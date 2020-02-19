Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B9134164C72
	for <lists+xen-devel@lfdr.de>; Wed, 19 Feb 2020 18:48:03 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j4TOz-0001vh-O0; Wed, 19 Feb 2020 17:44:49 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=jH6y=4H=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1j4TOy-0001ui-HA
 for xen-devel@lists.xenproject.org; Wed, 19 Feb 2020 17:44:48 +0000
X-Inumbo-ID: 823ee3ea-533f-11ea-83f8-12813bfff9fa
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 823ee3ea-533f-11ea-83f8-12813bfff9fa;
 Wed, 19 Feb 2020 17:44:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1582134284;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=/s5u8sMdunnqNRIWop29wFYp8BPH9IKS621+zWod4l0=;
 b=Yp48fX4yGxgQOAzDW1IwyyNUhKTikwV0AABJ8yvMkBfLs2iu9v7nYIQQ
 YgRFzEV4BOY+p3emm3a1YwwdwdP3AOsaKAAx6vYMHiJhaq9awpdof0d/C
 umecLsd0TUg5fU6UFnuQftfQvBwBl1CldVJ8djxClPCpUqryC41fP++x2 Y=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa1.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: pB94+noT6O70wgniVX0Xb/7jddOpgpw8XvSFM/7Xo3utDH0SucIa+RK0IymhD2HAFZaDM48C1x
 2n45x/2MaIoJ29MEyQd8hIeg88SBpSQ1oPH658DR9ycZJgxKJcunqkY9vcpfVVJZ8L8IyjTDUX
 h1i34YYxFgN01dmU/T349DMJ0KCZTpjr7LIZYnJiciiTG1od0Xe7QXYpAmgLFPlFSkCML2bEc7
 hljMkynzxZO50cmCzQfwL7LPH7MqlndrLKqcf62JlNdWs4IoC9QtcAw1TPdUx5RdlrDnslX1Pd
 3Is=
X-SBRS: 2.7
X-MesageID: 12882318
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,461,1574139600"; d="scan'208";a="12882318"
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Wed, 19 Feb 2020 18:43:53 +0100
Message-ID: <20200219174354.84726-7-roger.pau@citrix.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200219174354.84726-1-roger.pau@citrix.com>
References: <20200219174354.84726-1-roger.pau@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v5 6/7] xen/guest: prepare hypervisor ops to use
 alternative calls
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Paul Durrant <pdurrant@amazon.com>, Jan Beulich <jbeulich@suse.com>,
 Wei Liu <wl@xen.org>, Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

QWRhcHQgdGhlIGh5cGVydmlzb3Igb3BzIGZyYW1ld29yayBzbyBpdCBjYW4gYmUgdXNlZCB3aXRo
IHRoZQphbHRlcm5hdGl2ZSBjYWxscyBmcmFtZXdvcmsuIFNvIGZhciBubyBob29rcyBhcmUgbW9k
aWZpZWQgdG8gbWFrZSB1c2UKb2YgdGhlIGFsdGVybmF0aXZlcyBwYXRjaGluZywgYXMgdGhleSBh
cmUgbm90IGluIGFueSBob3QgcGF0aC4KCk5vIGZ1bmN0aW9uYWwgY2hhbmdlIGludGVuZGVkLgoK
U2lnbmVkLW9mZi1ieTogUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+ClJl
dmlld2VkLWJ5OiBXZWkgTGl1IDx3bEB4ZW4ub3JnPgpSZXZpZXdlZC1ieTogUGF1bCBEdXJyYW50
IDxwZHVycmFudEBhbWF6b24uY29tPgotLS0KQ2hhbmdlcyBzaW5jZSB2MzoKIC0gTmV3IGluIHRo
aXMgdmVyc2lvbi4KLS0tCiB4ZW4vYXJjaC94ODYvZ3Vlc3QvaHlwZXJ2L2h5cGVydi5jIHwgIDIg
Ky0KIHhlbi9hcmNoL3g4Ni9ndWVzdC9oeXBlcnZpc29yLmMgICAgfCA0MSArKysrKysrKysrKysr
KystLS0tLS0tLS0tLS0tLS0KIHhlbi9hcmNoL3g4Ni9ndWVzdC94ZW4veGVuLmMgICAgICAgfCAg
MiArLQogMyBmaWxlcyBjaGFuZ2VkLCAyMyBpbnNlcnRpb25zKCspLCAyMiBkZWxldGlvbnMoLSkK
CmRpZmYgLS1naXQgYS94ZW4vYXJjaC94ODYvZ3Vlc3QvaHlwZXJ2L2h5cGVydi5jIGIveGVuL2Fy
Y2gveDg2L2d1ZXN0L2h5cGVydi9oeXBlcnYuYwppbmRleCBmYWJjNjJiMGQ2Li43MGY0Y2Q1YWUw
IDEwMDY0NAotLS0gYS94ZW4vYXJjaC94ODYvZ3Vlc3QvaHlwZXJ2L2h5cGVydi5jCisrKyBiL3hl
bi9hcmNoL3g4Ni9ndWVzdC9oeXBlcnYvaHlwZXJ2LmMKQEAgLTE5OSw3ICsxOTksNyBAQCBzdGF0
aWMgdm9pZCBfX2luaXQgZTgyMF9maXh1cChzdHJ1Y3QgZTgyMG1hcCAqZTgyMCkKICAgICAgICAg
cGFuaWMoIlVuYWJsZSB0byByZXNlcnZlIEh5cGVyLVYgaHlwZXJjYWxsIHJhbmdlXG4iKTsKIH0K
IAotc3RhdGljIGNvbnN0IHN0cnVjdCBoeXBlcnZpc29yX29wcyBvcHMgPSB7CitzdGF0aWMgY29u
c3Qgc3RydWN0IGh5cGVydmlzb3Jfb3BzIF9faW5pdGRhdGEgb3BzID0gewogICAgIC5uYW1lID0g
Ikh5cGVyLVYiLAogICAgIC5zZXR1cCA9IHNldHVwLAogICAgIC5hcF9zZXR1cCA9IGFwX3NldHVw
LApkaWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L2d1ZXN0L2h5cGVydmlzb3IuYyBiL3hlbi9hcmNo
L3g4Ni9ndWVzdC9oeXBlcnZpc29yLmMKaW5kZXggNWZkNDMzYzhkNC4uNjQ3Y2RiMTM2NyAxMDA2
NDQKLS0tIGEveGVuL2FyY2gveDg2L2d1ZXN0L2h5cGVydmlzb3IuYworKysgYi94ZW4vYXJjaC94
ODYvZ3Vlc3QvaHlwZXJ2aXNvci5jCkBAIC0yNCw1MiArMjQsNTMgQEAKICNpbmNsdWRlIDxhc20v
Y2FjaGUuaD4KICNpbmNsdWRlIDxhc20vZ3Vlc3QuaD4KIAotc3RhdGljIGNvbnN0IHN0cnVjdCBo
eXBlcnZpc29yX29wcyAqX19yZWFkX21vc3RseSBvcHM7CitzdGF0aWMgc3RydWN0IGh5cGVydmlz
b3Jfb3BzIF9fcmVhZF9tb3N0bHkgb3BzOwogCiBjb25zdCBjaGFyICpfX2luaXQgaHlwZXJ2aXNv
cl9wcm9iZSh2b2lkKQogeworICAgIGNvbnN0IHN0cnVjdCBoeXBlcnZpc29yX29wcyAqZm5zOwor
CiAgICAgaWYgKCAhY3B1X2hhc19oeXBlcnZpc29yICkKICAgICAgICAgcmV0dXJuIE5VTEw7CiAK
LSAgICBvcHMgPSB4Z19wcm9iZSgpOwotICAgIGlmICggb3BzICkKLSAgICAgICAgcmV0dXJuIG9w
cy0+bmFtZTsKKyAgICBmbnMgPSB4Z19wcm9iZSgpOworICAgIGlmICggIWZucyApCisgICAgICAg
IC8qCisgICAgICAgICAqIERldGVjdGlvbiBvZiBIeXBlci1WIG11c3QgY29tZSBhZnRlciBYZW4g
dG8gYXZvaWQgZmFsc2UgcG9zaXRpdmUgZHVlCisgICAgICAgICAqIHRvIHZpcmlkaWFuIHN1cHBv
cnQKKyAgICAgICAgICovCisgICAgICAgIGZucyA9IGh5cGVydl9wcm9iZSgpOwogCi0gICAgLyoK
LSAgICAgKiBEZXRlY3Rpb24gb2YgSHlwZXItViBtdXN0IGNvbWUgYWZ0ZXIgWGVuIHRvIGF2b2lk
IGZhbHNlIHBvc2l0aXZlIGR1ZQotICAgICAqIHRvIHZpcmlkaWFuIHN1cHBvcnQKLSAgICAgKi8K
LSAgICBvcHMgPSBoeXBlcnZfcHJvYmUoKTsKLSAgICBpZiAoIG9wcyApCi0gICAgICAgIHJldHVy
biBvcHMtPm5hbWU7CisgICAgaWYgKCBmbnMgKQorICAgICAgICBvcHMgPSAqZm5zOwogCi0gICAg
cmV0dXJuIE5VTEw7CisgICAgcmV0dXJuIG9wcy5uYW1lOwogfQogCiB2b2lkIF9faW5pdCBoeXBl
cnZpc29yX3NldHVwKHZvaWQpCiB7Ci0gICAgaWYgKCBvcHMgJiYgb3BzLT5zZXR1cCApCi0gICAg
ICAgIG9wcy0+c2V0dXAoKTsKKyAgICBpZiAoIG9wcy5zZXR1cCApCisgICAgICAgIG9wcy5zZXR1
cCgpOwogfQogCiBpbnQgaHlwZXJ2aXNvcl9hcF9zZXR1cCh2b2lkKQogewotICAgIGlmICggb3Bz
ICYmIG9wcy0+YXBfc2V0dXAgKQotICAgICAgICByZXR1cm4gb3BzLT5hcF9zZXR1cCgpOworICAg
IGlmICggb3BzLmFwX3NldHVwICkKKyAgICAgICAgcmV0dXJuIG9wcy5hcF9zZXR1cCgpOwogCiAg
ICAgcmV0dXJuIDA7CiB9CiAKIHZvaWQgaHlwZXJ2aXNvcl9yZXN1bWUodm9pZCkKIHsKLSAgICBp
ZiAoIG9wcyAmJiBvcHMtPnJlc3VtZSApCi0gICAgICAgIG9wcy0+cmVzdW1lKCk7CisgICAgaWYg
KCBvcHMucmVzdW1lICkKKyAgICAgICAgb3BzLnJlc3VtZSgpOwogfQogCiB2b2lkIF9faW5pdCBo
eXBlcnZpc29yX2U4MjBfZml4dXAoc3RydWN0IGU4MjBtYXAgKmU4MjApCiB7Ci0gICAgaWYgKCBv
cHMgJiYgb3BzLT5lODIwX2ZpeHVwICkKLSAgICAgICAgb3BzLT5lODIwX2ZpeHVwKGU4MjApOwor
ICAgIGlmICggb3BzLmU4MjBfZml4dXAgKQorICAgICAgICBvcHMuZTgyMF9maXh1cChlODIwKTsK
IH0KIAogLyoKZGlmZiAtLWdpdCBhL3hlbi9hcmNoL3g4Ni9ndWVzdC94ZW4veGVuLmMgYi94ZW4v
YXJjaC94ODYvZ3Vlc3QveGVuL3hlbi5jCmluZGV4IDNjZjhmNjY3YTEuLmYxNTFiMDc1NDggMTAw
NjQ0Ci0tLSBhL3hlbi9hcmNoL3g4Ni9ndWVzdC94ZW4veGVuLmMKKysrIGIveGVuL2FyY2gveDg2
L2d1ZXN0L3hlbi94ZW4uYwpAQCAtMzI0LDcgKzMyNCw3IEBAIHN0YXRpYyB2b2lkIF9faW5pdCBl
ODIwX2ZpeHVwKHN0cnVjdCBlODIwbWFwICplODIwKQogICAgICAgICBwdl9zaGltX2ZpeHVwX2U4
MjAoZTgyMCk7CiB9CiAKLXN0YXRpYyBjb25zdCBzdHJ1Y3QgaHlwZXJ2aXNvcl9vcHMgb3BzID0g
eworc3RhdGljIGNvbnN0IHN0cnVjdCBoeXBlcnZpc29yX29wcyBfX2luaXRkYXRhIG9wcyA9IHsK
ICAgICAubmFtZSA9ICJYZW4iLAogICAgIC5zZXR1cCA9IHNldHVwLAogICAgIC5hcF9zZXR1cCA9
IGFwX3NldHVwLAotLSAKMi4yNS4wCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L3hlbi1kZXZlbA==
