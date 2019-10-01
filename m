Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BB216C3781
	for <lists+xen-devel@lfdr.de>; Tue,  1 Oct 2019 16:34:31 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iFJCI-0001cv-MV; Tue, 01 Oct 2019 14:32:14 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=78uS=X2=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1iFJCH-0001cc-94
 for xen-devel@lists.xenproject.org; Tue, 01 Oct 2019 14:32:13 +0000
X-Inumbo-ID: 4070fb44-e458-11e9-9701-12813bfff9fa
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by localhost (Halon) with ESMTPS
 id 4070fb44-e458-11e9-9701-12813bfff9fa;
 Tue, 01 Oct 2019 14:32:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1569940331;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=qN9vrpn9ppYQyu9gxN0suHznD3EeQ34geDfu/AkxTxA=;
 b=H6Y0OcaJXUCtiib+tLyyUqcEFCXQe0DDI7n5wJ92xm0BrMvy9trTAeLo
 BojGoL+XZ5Eyavm24pdABXv6YqfOAk1gf0I70h+jlsnI4R9LgYAXiQn5D
 AXw2XndDY87ymZrJJVxQWKLQeD50CtJbuwkI+ZCd3tSuKFvcxeUmmqs2G c=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa3.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: nrReZ/hhV1ob2rWvAjhYLPPK4y3hvFFG2HlvZAkQhqC8qBiXHjYupI6kQCNFoE4tnm66uDP7I+
 KQ/X5qQhfGn9cSiEJrWCS2P7vTZv6WX5T/VgEKraBzt3BeG4odhAe/HAHdD22BF90DCwnXOzPb
 ADdZPVsvD5cHTLbqqauARsVPYbOifpsbXgwRaDF99LndKUWi5EWNiuS14G+VbvcjwGiU2QMDJs
 T8bQt4SrLZdYisKQUoSO1H+yfDtDgRodgGeoCg+OfHhzDCsaabvm8pq3KmdDtBzpBJ/umaC6NJ
 yOQ=
X-SBRS: 2.7
X-MesageID: 6316998
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,571,1559534400"; 
   d="scan'208";a="6316998"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Date: Tue, 1 Oct 2019 15:32:05 +0100
Message-ID: <20191001143207.15844-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH for-4.13 v2 0/2] xen/nospec: Add Kconfig options
 for speculative hardening
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
Cc: Juergen Gross <jgross@suse.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Norbert Manthey <nmanthey@amazon.de>, Jan Beulich <JBeulich@suse.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhlIG1haW4gcHVycG9zZSBpcyBwYXRjaCAyLiAgVGhlICJsMXRmLWJhcnJpZXIiIHdvcmsgY3Vy
cmVudGx5IGNhdXNlcyBhIHBlcmYKaGl0IGFuZCBnYWlucyBubyBzYWZldHksIGFuZCBpcyB0aGVy
ZWZvcmUgdW5maXQgZm9yIGluY2x1c2lvbiBpbnRvIFhlbiA0LjEzIGF0CnRoaXMgdGltZS4KClNl
ZSBpbmRpdmlkdWFsIHBhdGNoZXMgZm9yIGNoYW5nZXMgZnJvbSB2MS4KCkFuZHJldyBDb29wZXIg
KDIpOgogIHhlbi9ub3NwZWM6IEludHJvZHVjZSBDT05GSUdfU1BFQ1VMQVRJVkVfSEFSREVOX0FS
UkFZCiAgeGVuL25vc3BlYzogSW50cm9kdWNlIENPTkZJR19TUEVDVUxBVElWRV9IQVJERU5fQlJB
TkNIIGFuZCBkaXNhYmxlIGl0CgogZG9jcy9taXNjL3hlbi1jb21tYW5kLWxpbmUucGFuZG9jIHwg
IDggKy0tLS0tLQogeGVuL2FyY2gveDg2L3NwZWNfY3RybC5jICAgICAgICAgIHwgMTcgKystLS0t
LS0tLS0tLS0tCiB4ZW4vY29tbW9uL0tjb25maWcgICAgICAgICAgICAgICAgfCA0NSArKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysKIHhlbi9pbmNsdWRlL2FzbS14ODYvY3B1
ZmVhdHVyZXMuaCB8ICAyICstCiB4ZW4vaW5jbHVkZS9hc20teDg2L25vc3BlYy5oICAgICAgfCAg
NiArKystLS0KIHhlbi9pbmNsdWRlL2FzbS14ODYvc3BlY19jdHJsLmggICB8ICAxIC0KIHhlbi9p
bmNsdWRlL3hlbi9ub3NwZWMuaCAgICAgICAgICB8ICA1ICsrKysrCiA3IGZpbGVzIGNoYW5nZWQs
IDU3IGluc2VydGlvbnMoKyksIDI3IGRlbGV0aW9ucygtKQoKLS0gCjIuMTEuMAoKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5n
IGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJv
amVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
