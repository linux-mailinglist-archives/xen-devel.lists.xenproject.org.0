Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 76F591791E0
	for <lists+xen-devel@lfdr.de>; Wed,  4 Mar 2020 15:03:31 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j9UZq-0001XF-M6; Wed, 04 Mar 2020 14:00:46 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=3Mvz=4V=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1j9UZp-0001X9-GA
 for xen-devel@lists.xenproject.org; Wed, 04 Mar 2020 14:00:45 +0000
X-Inumbo-ID: 89d9f87a-5e20-11ea-a3e5-12813bfff9fa
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 89d9f87a-5e20-11ea-a3e5-12813bfff9fa;
 Wed, 04 Mar 2020 14:00:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1583330445;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=i3mRY+lx1Hy3oLRJQMX1AYdZ0waCfrmdMA30h5tkSK8=;
 b=eyrIDDRsmgkXjW1D0AZOhMTIkM3EMf+zBb9bWFRAuNolwxznRLxbnMz4
 Jp5PEFpkI4TqwFD01c5VYtpSDKA9avD7hvE2ok8eLYEBAD+meGmKdyEER
 J3mXBzz0e09J6Te2satVjP19tRJeECp86tyKvV5CrtdrBo2vBw2mPujIt o=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: lZe6UpeJcjEZ12HV+wVrKPe0BAIVlZA1vXS1RzvewUHEXsMhANAwXqM2IThNv1nJloVyAXg7D+
 FVCNBhJcZG+pAmVoBT/lsMGFq9rczh++PGC1XiKn63tG4GIdC0v5IY3eeMmJ3HmsA18r+EKMgA
 UdpTFVDmqY7wV1vip1p1KT0jWYVSFRHsv7ItmXeHPIuh8Y62Ydx/4PDIQmSyTemTtSbMZvamEU
 xdIraAmeIN1MbIqQe/ATmXrxY1LJV5+r4ZRo/8RPDutyNUoW8h7fZRWQb9HFLnmtRtHbWIMRPf
 jCo=
X-SBRS: 2.7
X-MesageID: 13403949
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,514,1574139600"; d="scan'208";a="13403949"
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Wed, 4 Mar 2020 15:00:21 +0100
Message-ID: <20200304140021.55777-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH] iommu: fix check for autotranslated hardware
 domain
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Paul Durrant <pdurrant@amzn.com>, Jan Beulich <jbeulich@suse.com>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhlIGN1cnJlbnQgcG9zaXRpb24gb2YgdGhlIGNoZWNrX2h3ZG9tX3JlcXMgaXMgd3JvbmcsIGFz
IHRoZXJlJ3MgYQppc19pb21tdV9lbmFibGVkIGF0IHRoZSB0b3Agb2YgdGhlIGZ1bmN0aW9uIHRo
YXQgd2lsbCBwcmV2ZW50IGdldHRpbmcKdG8gdGhlIGNoZWNrIG9uIHN5c3RlbXMgd2l0aG91dCBh
biBJT01NVSwgYmVjYXVzZSB0aGUgaGFyZHdhcmUgZG9tYWluCndvbid0IGhhdmUgdGhlIFhFTl9E
T01DVExfQ0RGX2lvbW11IGZsYWcgc2V0LgoKTW92ZSB0aGUgcG9zaXRpb24gb2YgdGhlIGNoZWNr
IHNvIGl0J3MgZG9uZSBiZWZvcmUgdGhlCmlzX2lvbW11X2VuYWJsZWQgb25lLCBhbmQgdGh1cyBh
dHRlbXB0cyB0byBjcmVhdGUgYSB0cmFuc2xhdGVkCmhhcmR3YXJlIGRvbWFpbiB3aXRob3V0IGFu
IElPTU1VIGNhbiBiZSBkZXRlY3RlZC4KCkZpeGVzOiBmODlmNTU1ODI3YSAoJ3JlbW92ZSBsYXRl
IChvbi1kZW1hbmQpIGNvbnN0cnVjdGlvbiBvZiBJT01NVSBwYWdlIHRhYmxlcycpClNpZ25lZC1v
ZmYtYnk6IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRyaXguY29tPgotLS0KIHhlbi9k
cml2ZXJzL3Bhc3N0aHJvdWdoL2lvbW11LmMgfCA2ICsrKy0tLQogMSBmaWxlIGNoYW5nZWQsIDMg
aW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS94ZW4vZHJpdmVycy9w
YXNzdGhyb3VnaC9pb21tdS5jIGIveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvaW9tbXUuYwppbmRl
eCBjYWI3YTA2OGFhLi5kYWMxYjU4ZmE1IDEwMDY0NAotLS0gYS94ZW4vZHJpdmVycy9wYXNzdGhy
b3VnaC9pb21tdS5jCisrKyBiL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL2lvbW11LmMKQEAgLTE3
Miw2ICsxNzIsOSBAQCBpbnQgaW9tbXVfZG9tYWluX2luaXQoc3RydWN0IGRvbWFpbiAqZCwgdW5z
aWduZWQgaW50IG9wdHMpCiAgICAgc3RydWN0IGRvbWFpbl9pb21tdSAqaGQgPSBkb21faW9tbXUo
ZCk7CiAgICAgaW50IHJldCA9IDA7CiAKKyAgICBpZiAoIGlzX2hhcmR3YXJlX2RvbWFpbihkKSAp
CisgICAgICAgIGNoZWNrX2h3ZG9tX3JlcXMoZCk7IC8qIG1heSBtb2RpZnkgaW9tbXVfaHdkb21f
c3RyaWN0ICovCisKICAgICBpZiAoICFpc19pb21tdV9lbmFibGVkKGQpICkKICAgICAgICAgcmV0
dXJuIDA7CiAKQEAgLTE4OCw5ICsxOTEsNiBAQCBpbnQgaW9tbXVfZG9tYWluX2luaXQoc3RydWN0
IGRvbWFpbiAqZCwgdW5zaWduZWQgaW50IG9wdHMpCiAgICAgaWYgKCByZXQgfHwgaXNfc3lzdGVt
X2RvbWFpbihkKSApCiAgICAgICAgIHJldHVybiByZXQ7CiAKLSAgICBpZiAoIGlzX2hhcmR3YXJl
X2RvbWFpbihkKSApCi0gICAgICAgIGNoZWNrX2h3ZG9tX3JlcXMoZCk7IC8qIG1heSBtb2RpZnkg
aW9tbXVfaHdkb21fc3RyaWN0ICovCi0KICAgICAvKgogICAgICAqIFVzZSBzaGFyZWQgcGFnZSB0
YWJsZXMgZm9yIEhBUCBhbmQgSU9NTVUgaWYgdGhlIGdsb2JhbCBvcHRpb24KICAgICAgKiBpcyBl
bmFibGVkIChmcm9tIHdoaWNoIHdlIGNhbiBpbmZlciB0aGUgaC93IGlzIGNhcGFibGUpIGFuZAot
LSAKMi4yNS4wCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcK
aHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
