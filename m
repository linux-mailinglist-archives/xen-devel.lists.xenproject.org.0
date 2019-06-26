Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DD37556725
	for <lists+xen-devel@lfdr.de>; Wed, 26 Jun 2019 12:49:17 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hg5Rk-0000kN-Je; Wed, 26 Jun 2019 10:46:36 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=fhrD=UZ=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1hg5Rj-0000kH-97
 for xen-devel@lists.xenproject.org; Wed, 26 Jun 2019 10:46:35 +0000
X-Inumbo-ID: a9f791af-97ff-11e9-8980-bc764e045a96
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id a9f791af-97ff-11e9-8980-bc764e045a96;
 Wed, 26 Jun 2019 10:46:34 +0000 (UTC)
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ian.jackson@eu.citrix.com;
 spf=Pass smtp.mailfrom=Ian.Jackson@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ian.jackson@eu.citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="ian.jackson@eu.citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa1.hc3370-68.iphmx.com: domain of
 Ian.Jackson@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="Ian.Jackson@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: gOuGfxEWyuIxSjy8R5kXMsPQeuwWWdob2xfYfHRIF9mGHLuFXutpRbb7Cw2HmNfH0szGJQVKl9
 PojtA9sCY9MyHX7nWhQCXvOdHGvWCwups7gUYi8jc0YjUSAZ9oW/J6j2nL0xs8KKYcaUNqWLPx
 chRJrkWGFgEONUO8a3wW6dA55gw9ub3qYm7SYSvs0QrtZnEkSWl/SGZRKQ1G4xgRpBpKqEbzXY
 2mx7mg8O+Feitogt+vugXEuQDPR1ac/smCByannS8f8eky1ZfJSIHXAnYJdI2FTfGD1g5RCRHW
 E+o=
X-SBRS: 2.7
X-MesageID: 2261880
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.63,419,1557201600"; 
   d="scan'208";a="2261880"
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Wed, 26 Jun 2019 11:45:54 +0100
Message-ID: <20190626104554.23768-1-ian.jackson@eu.citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Subject: [Xen-devel] [OSSTEST PATCH] starvation: Do not give up if there are
 other jobs running
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
Cc: Ian Jackson <ian.jackson@eu.citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

V2Ugd2FudCB0aG9zZSBvdGhlciBqb2JzIHRvIGZpbmlzaCBzbyB0aGF0IHdlIGNhbiBpbmNsdWRl
IHRoZSB0aW1lCnRoZXkgdG9vaywgYW5kIHRoZSBmYWN0IHRoYXQgdGhleSBjb21wbGV0ZWQsIGlu
IG91ciBjYWxjdWxhdGlvbnMuCgpTaWduZWQtb2ZmLWJ5OiBJYW4gSmFja3NvbiA8aWFuLmphY2tz
b25AZXUuY2l0cml4LmNvbT4KLS0tCiB0cy1ob3N0cy1hbGxvY2F0ZS1FeGVjdXRpdmUgfCAxMiAr
KysrKysrKysrLS0KIDEgZmlsZSBjaGFuZ2VkLCAxMCBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9u
cygtKQoKZGlmZiAtLWdpdCBhL3RzLWhvc3RzLWFsbG9jYXRlLUV4ZWN1dGl2ZSBiL3RzLWhvc3Rz
LWFsbG9jYXRlLUV4ZWN1dGl2ZQppbmRleCA2YjNkYTYwMC4uMDc5ZWYxZDEgMTAwNzU1Ci0tLSBh
L3RzLWhvc3RzLWFsbG9jYXRlLUV4ZWN1dGl2ZQorKysgYi90cy1ob3N0cy1hbGxvY2F0ZS1FeGVj
dXRpdmUKQEAgLTc4OCw5ICs3ODgsMTcgQEAgc3ViIHN0YXJ2aW5nICgkJCkgewogICAgIG15ICRt
YXhmaW49MDsKICAgICB3aGlsZSAobXkgKCRqLCRzdCwkZmluKSA9ICRzdGFydmF0aW9uX3EtPmZl
dGNocm93X2FycmF5KCkpIHsKIAlpZiAoJHN0IGVxICdwcmVwYXJpbmcnIHx8Ci0JICAgICRzdCBl
cSAncXVldWVkJyB8fAotCSAgICAkc3QgZXEgJ3J1bm5pbmcnKSB7CisJICAgICRzdCBlcSAncXVl
dWVkJykgewogCSAgICAkdysrOworCX0gZWxzaWYgKCRzdCBlcSAncnVubmluZycpIHsKKwkgICAg
IyBXZSBkb24ndCBxdWl0IGlmIHRoZXJlIGFyZSBzdGlsbCBqb2JzIHJ1bm5pbmcuICBJbnN0ZWFk
CisJICAgICMgd2Ugd2FpdCB1bnRpbCB0aGV5IGFyZSBkb25lIGFuZCB0aGVuIHNlZSBpZiBob3cg
bXVjaCB3ZQorCSAgICAjIHdvdWxkIGJlIGRlbGF5aW5nIHRoZWlyIHJlc3VsdHMuICBUaGlzIGRv
ZXMgbWVhbiB0aGF0IGEKKwkgICAgIyBmbGlnaHQgY2FuIGJlIGtlcHQgZ29pbmcsIHJhdGhlciB0
aGFuIGJlaW5nIHRyZWF0ZWQgYXMKKwkgICAgIyBzdGFydmVkLCBieSBhIGNvbnN0YW50IHRyaWNr
bGUgb2YgbGF0ZSBqb2JzLiAgQnV0IHRoYXQKKwkgICAgIyBpcyBpbmRpc3Rpbmd1aXNoYWJsZSBm
cm9tIGEgZmxpZ2h0IHdoaWNoIGlzIGF0IHRoZSBoZWFkCisJICAgICMgb2YgdGhlIHF1ZXVlIGZv
ciBhIHNtYWxsIHNldCBvZiByZXNvdXJjZXMuCisJICAgIHJldHVybiAoMCwgImpvYiAkaiBzdGF0
dXMgJHN0LCBkb24ndCBnaXZlIHVwIGp1c3QgeWV0Iik7CiAJfSBlbHNlIHsKIAkgICAgJGQrKzsK
IAkgICAgcmV0dXJuICgwLCAiam9iICRqIHN0YXR1cyAkc3QgYnV0IG5vIHN0ZXAgZmluaXNoZWQg
dGltZSEiKQotLSAKMi4xMS4wCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hl
bi1kZXZlbA==
