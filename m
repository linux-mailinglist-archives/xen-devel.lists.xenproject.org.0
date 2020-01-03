Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4839712F8A2
	for <lists+xen-devel@lfdr.de>; Fri,  3 Jan 2020 14:08:49 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1inMfJ-0004B2-4U; Fri, 03 Jan 2020 13:06:57 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=3Lau=2Y=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1inMfH-0004AN-8i
 for xen-devel@lists.xenproject.org; Fri, 03 Jan 2020 13:06:55 +0000
X-Inumbo-ID: e56956bc-2e29-11ea-88e7-bc764e2007e4
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e56956bc-2e29-11ea-88e7-bc764e2007e4;
 Fri, 03 Jan 2020 13:06:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1578056806;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=p5FEpdaxz96h2yAh0G89UJzZg2BFVDzVF56s4ViHgDc=;
 b=JA/eem2luti+Uw/Dn/sXFr49/kjxcj9jQnWeVnmVb64UyvFdNgLsbiak
 ywzKjjZekwmYA9qeA9LKsfvy436LQHo2P7IDcUQKcyFoHXBL/Hd7qMGOR
 y4qqdTS1ijaW+t+jy8ASGpmnfYFD7EcNnPYpsW0/9hXwTVMmZe70kmHw3 s=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
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
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: fKMR6Q9Bbwn+2k8260f4loJiGkMiARZ7eBUq7skpyvCMQTHuxba/KmIKA5m2zE4j5mEP+yMxyx
 7f0GoLmUJn7noBJcS6NGxT835NcJxCZzesC5QFwihWaTpfVei/VlIblX5W4oB3CdJAxa+rR6Gs
 MGQJrIZ/2VP1kkCYzy1W/SYGUTlle1UHMA68Aa1TYW5mrgnkBmckJ1PAbgoDh/zDeU/JOVEdd6
 25ye6Bm7eRV76/LKpVvKtTk0htHL42h7Yj7hJlCWjrZ7IBduPzaWZjSuM1HhmqeDyXj5c02R6I
 N94=
X-SBRS: 2.7
X-MesageID: 10435308
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,390,1571716800"; d="scan'208";a="10435308"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Date: Fri, 3 Jan 2020 13:06:16 +0000
Message-ID: <20200103130616.13724-7-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20200103130616.13724-1-andrew.cooper3@citrix.com>
References: <20200103130616.13724-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH 20/20] tools/libxc: Restore CPUID/MSR data found
 in the migration stream
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 Ian Jackson <Ian.Jackson@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

V2l0aCBsaWJ4bCBzdWl0YWJseSBhZGp1c3RlZCwgaXQgaXMgbm93IHNhZmUgdG8gcmVzdG9yZSB0
aGUgQ1BVSUQvTVNSIGRhdGEKZGlyZWN0bHkgZnJvbSB0aGUgbWlncmF0aW9uIHN0cmVhbS4gIEFk
anVzdCB0aGUgWEdSX1NERF9NSVNTSU5HXyogZmxhZ3MgZm9yCnRoZSBzdGF0aWNfZGF0YV9kb25l
KCkgY2FsbGJhY2sgYXBwcm9wcmlhdGVseS4KClNpZ25lZC1vZmYtYnk6IEFuZHJldyBDb29wZXIg
PGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+Ci0tLQpDQzogSWFuIEphY2tzb24gPElhbi5KYWNr
c29uQGNpdHJpeC5jb20+CkNDOiBXZWkgTGl1IDx3bEB4ZW4ub3JnPgotLS0KIHRvb2xzL2xpYnhj
L3hjX3NyX2NvbW1vbl94ODYuYyB8IDI0ICsrKysrKysrKysrKysrKysrKysrKystLQogMSBmaWxl
IGNoYW5nZWQsIDIyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEv
dG9vbHMvbGlieGMveGNfc3JfY29tbW9uX3g4Ni5jIGIvdG9vbHMvbGlieGMveGNfc3JfY29tbW9u
X3g4Ni5jCmluZGV4IGMzZDFkMzBkOTEuLjVjNWIzZTc2MzUgMTAwNjQ0Ci0tLSBhL3Rvb2xzL2xp
YnhjL3hjX3NyX2NvbW1vbl94ODYuYworKysgYi90b29scy9saWJ4Yy94Y19zcl9jb21tb25feDg2
LmMKQEAgLTQ1LDExICs0NSwzMSBAQCBpbnQgaGFuZGxlX3g4Nl90c2NfaW5mbyhzdHJ1Y3QgeGNf
c3JfY29udGV4dCAqY3R4LCBzdHJ1Y3QgeGNfc3JfcmVjb3JkICpyZWMpCiBpbnQgeDg2X3N0YXRp
Y19kYXRhX2NvbXBsZXRlKHN0cnVjdCB4Y19zcl9jb250ZXh0ICpjdHgpCiB7CiAgICAgeGNfaW50
ZXJmYWNlICp4Y2ggPSBjdHgtPnhjaDsKKyAgICB1aW50MzJfdCBucl9sZWF2ZXMgPSAwLCBucl9t
c3JzID0gMDsKKyAgICB1aW50MzJfdCBlcnJfbCA9IH4wLCBlcnJfcyA9IH4wLCBlcnJfbSA9IH4w
OwogICAgIHVuc2lnbmVkIGludCBtaXNzaW5nID0gMDsKICAgICBpbnQgcmM7CiAKLSAgICAvKiBU
T0RPIC0gc29tZXRoaW5nIHVzZWZ1bC4gKi8KLSAgICBtaXNzaW5nID0gWEdSX1NERF9NSVNTSU5H
X01TUiB8IFhHUl9TRERfTUlTU0lOR19DUFVJRDsKKyAgICBpZiAoIGN0eC0+eDg2LnJlc3RvcmUu
Y3B1aWQucHRyICkKKyAgICAgICAgbnJfbGVhdmVzID0gY3R4LT54ODYucmVzdG9yZS5jcHVpZC5z
aXplIC8gc2l6ZW9mKHhlbl9jcHVpZF9sZWFmX3QpOworICAgIGVsc2UKKyAgICAgICAgbWlzc2lu
ZyB8PSBYR1JfU0REX01JU1NJTkdfQ1BVSUQ7CisKKyAgICBpZiAoIGN0eC0+eDg2LnJlc3RvcmUu
bXNyLnB0ciApCisgICAgICAgIG5yX21zcnMgPSBjdHgtPng4Ni5yZXN0b3JlLm1zci5zaXplIC8g
c2l6ZW9mKHhlbl9tc3JfZW50cnlfdCk7CisgICAgZWxzZQorICAgICAgICBtaXNzaW5nIHw9IFhH
Ul9TRERfTUlTU0lOR19NU1I7CisKKyAgICBpZiAoIChucl9sZWF2ZXMgfHwgbnJfbXNycykgJiYK
KyAgICAgICAgIHhjX3NldF9kb21haW5fY3B1X3BvbGljeSh4Y2gsIGN0eC0+ZG9taWQsCisgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgbnJfbGVhdmVzLCBjdHgtPng4Ni5yZXN0b3Jl
LmNwdWlkLnB0ciwKKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBucl9tc3JzLCAg
IGN0eC0+eDg2LnJlc3RvcmUubXNyLnB0ciwKKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAmZXJyX2wsICZlcnJfcywgJmVycl9tKSApCisgICAgeworICAgICAgICBQRVJST1IoIkZh
aWxlZCB0byBzZXQgQ1BVSUQgcG9saWN5OiBsZWFmICUwOHgsIHN1YmxlYWYgJTA4eCwgbXNyICUw
OHgiLAorICAgICAgICAgICAgICAgZXJyX2wsIGVycl9zLCBlcnJfbSk7CisgICAgICAgIHJldHVy
biAtMTsKKyAgICB9CiAKICAgICByYyA9IGN0eC0+cmVzdG9yZS5jYWxsYmFja3MtPnN0YXRpY19k
YXRhX2RvbmUoCiAgICAgICAgIG1pc3NpbmcsIGN0eC0+cmVzdG9yZS5jYWxsYmFja3MtPmRhdGEp
OwotLSAKMi4xMS4wCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5v
cmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZl
bA==
