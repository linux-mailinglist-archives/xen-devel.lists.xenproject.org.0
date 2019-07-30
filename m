Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 350567AE4F
	for <lists+xen-devel@lfdr.de>; Tue, 30 Jul 2019 18:46:16 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hsVEO-0003sD-TV; Tue, 30 Jul 2019 16:44:08 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=3sDM=V3=citrix.com=paul.durrant@srs-us1.protection.inumbo.net>)
 id 1hsVEN-0003s3-FB
 for xen-devel@lists.xenproject.org; Tue, 30 Jul 2019 16:44:07 +0000
X-Inumbo-ID: 3e8d2704-b2e9-11e9-8980-bc764e045a96
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 3e8d2704-b2e9-11e9-8980-bc764e045a96;
 Tue, 30 Jul 2019 16:44:06 +0000 (UTC)
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=paul.durrant@citrix.com;
 spf=Pass smtp.mailfrom=Paul.Durrant@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 paul.durrant@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="paul.durrant@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa6.hc3370-68.iphmx.com: domain of
 Paul.Durrant@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="Paul.Durrant@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: WHQGUY3xml/8j8VtVLAAQQUc4MHwxnztbkyHXElZfwuRaN40Yvf/fNcvu4jMf53nPXhtmnqbbC
 nxlqHS6ndwVvOzS2TI3Eh4LbfarBkts9XVxofKhWz+u7rBn22NNLQB3BgdFQYMANe3VCYFWAY7
 rgkQ9X2u51adsEkQJ0iyySw1Q1/gUe1FCn5XllkQ0o/E5s7jrYpnVTb0He555Ns/d2g9a/fSWt
 sk7UibJWm5tQ8xSPZbvOyVVj4E9DO5QcTvJQu3Gmx/Kp9S9921hKDVnaRpjfZP3tQAtz2dUvzw
 qrc=
X-SBRS: 2.7
X-MesageID: 3754868
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,327,1559534400"; 
   d="scan'208";a="3754868"
From: Paul Durrant <paul.durrant@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Tue, 30 Jul 2019 17:44:01 +0100
Message-ID: <20190730164401.34097-1-paul.durrant@citrix.com>
X-Mailer: git-send-email 2.20.1.2.gb21ebb671
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH] fix BUG in gnttab_unpopulate_status_frames()
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>, Paul Durrant <paul.durrant@citrix.com>,
 Jan Beulich <jbeulich@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

U2luY2UgY29tbWl0IGVjODNmODI1NjI3ICJtbS5oOiBhZGQgaGVscGVyIGZ1bmN0aW9uIHRvIHRl
c3QtYW5kLWNsZWFyCl9QR0NfYWxsb2NhdGVkIiAoYW5kIHN1YnNlcXVlbnQgZml4LXVwIDQ0YTg4
N2QwMjFkICJtbS5oOiBmaXggQlVHX09OKCkKY29uZGl0aW9uIGluIHB1dF9wYWdlX2FsbG9jX3Jl
ZigpIikgc2V0dGluZyBncmFudCB0YWJsZSB2ZXJzaW9uIGZyb20gMgpiYWNrIHRvIDEgaGFzIGJl
ZW4gdnVsbmVyYWJsZSB0byBoaXR0aW5nIHRoZSBCVUdfT04gaW4gcHV0X3BhZ2VfYWxsb2NfcmVm
KCkKZHVyaW5nIGdudHRhYl91bnBvcHVsYXRlX3N0YXR1c19mcmFtZXMoKSBiZWNhdXNlIHRoYXQg
ZnVuY3Rpb24gZG9lcyBub3QKYWNxdWlyZSBhIGxvY2FsIHBhZ2UgcmVmZXJlbmNlLgoKVGhpcyBw
YXRjaCBmaXhlcyB0aGUgcHJvYmxlbSBieSBmaXJzdCBhY3F1aXJpbmcgYSBsb2NhbCBwYWdlIHJl
ZmVyZW5jZSBvbiBhCnN0YXR1cyBmcmFtZSAod2hpY2ggc2hvdWxkIGFsd2F5cyBzdWNjZWVkIGFu
ZCBzbyBhIGZhaWx1cmUgcmVzdWx0cyBpbiBhCmRvbWFpbl9jcmFzaCgpKSBiZWZvcmUgYXR0ZW1w
dGluZyB0byAndW5hc3NpZ24nIGl0IGZyb20gdGhlIGd1ZXN0IGJ5CmRyb3BwaW5nIHRoZSBhbGxv
Y2F0aW9uIHJlZmVyZW5jZS4gVGhlIGxvY2FsIHJlZmVyZW5jZSBjYW4gdGhlbiBiZSBkcm9wcGVk
LgoKU2lnbmVkLW9mZi1ieTogUGF1bCBEdXJyYW50IDxwYXVsLmR1cnJhbnRAY2l0cml4LmNvbT4K
LS0tCkNjOiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPgpDYzogR2Vv
cmdlIER1bmxhcCA8R2VvcmdlLkR1bmxhcEBldS5jaXRyaXguY29tPgpDYzogSWFuIEphY2tzb24g
PGlhbi5qYWNrc29uQGV1LmNpdHJpeC5jb20+CkNjOiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3Vz
ZS5jb20+CkNjOiBKdWxpZW4gR3JhbGwgPGp1bGllbi5ncmFsbEBhcm0uY29tPgpDYzogS29ucmFk
IFJ6ZXN6dXRlayBXaWxrIDxrb25yYWQud2lsa0BvcmFjbGUuY29tPgpDYzogU3RlZmFubyBTdGFi
ZWxsaW5pIDxzc3RhYmVsbGluaUBrZXJuZWwub3JnPgpDYzogVGltIERlZWdhbiA8dGltQHhlbi5v
cmc+CkNjOiBXZWkgTGl1IDx3bEB4ZW4ub3JnPgotLS0KIHhlbi9jb21tb24vZ3JhbnRfdGFibGUu
YyB8IDkgKysrKysrKysrCiAxIGZpbGUgY2hhbmdlZCwgOSBpbnNlcnRpb25zKCspCgpkaWZmIC0t
Z2l0IGEveGVuL2NvbW1vbi9ncmFudF90YWJsZS5jIGIveGVuL2NvbW1vbi9ncmFudF90YWJsZS5j
CmluZGV4IDk3Njk1YTIyMWEuLmI5Y2EzODgwNTEgMTAwNjQ0Ci0tLSBhL3hlbi9jb21tb24vZ3Jh
bnRfdGFibGUuYworKysgYi94ZW4vY29tbW9uL2dyYW50X3RhYmxlLmMKQEAgLTE2ODIsNiArMTY4
MiwxNCBAQCBnbnR0YWJfdW5wb3B1bGF0ZV9zdGF0dXNfZnJhbWVzKHN0cnVjdCBkb21haW4gKmQs
IHN0cnVjdCBncmFudF90YWJsZSAqZ3QpCiAgICAgICAgIHN0cnVjdCBwYWdlX2luZm8gKnBnID0g
dmlydF90b19wYWdlKGd0LT5zdGF0dXNbaV0pOwogICAgICAgICBnZm5fdCBnZm4gPSBnbnR0YWJf
Z2V0X2ZyYW1lX2dmbihndCwgdHJ1ZSwgaSk7CiAKKyAgICAgICAgaWYgKCAhZ2V0X3BhZ2UocGcs
IGQpICkKKyAgICAgICAgeworICAgICAgICAgICAgZ3ByaW50ayhYRU5MT0dfRVJSLAorICAgICAg
ICAgICAgICAgICAgICAiQ291bGQgbm90IGdldCBhIHJlZmVyZW5jZSB0byBzdGF0dXMgZnJhbWUg
JXVcbiIsIGkpOworICAgICAgICAgICAgZG9tYWluX2NyYXNoKGQpOworICAgICAgICAgICAgcmV0
dXJuIC1FSU5WQUw7CisgICAgICAgIH0KKwogICAgICAgICAvKgogICAgICAgICAgKiBGb3IgdHJh
bnNsYXRlZCBkb21haW5zLCByZWNvdmVyaW5nIGZyb20gZmFpbHVyZSBhZnRlciBwYXJ0aWFsCiAg
ICAgICAgICAqIGNoYW5nZXMgd2VyZSBtYWRlIGlzIG1vcmUgY29tcGxpY2F0ZWQgdGhhbiBpdCBz
ZWVtcyB3b3J0aApAQCAtMTcwOCw2ICsxNzE2LDcgQEAgZ250dGFiX3VucG9wdWxhdGVfc3RhdHVz
X2ZyYW1lcyhzdHJ1Y3QgZG9tYWluICpkLCBzdHJ1Y3QgZ3JhbnRfdGFibGUgKmd0KQogCiAgICAg
ICAgIEJVR19PTihwYWdlX2dldF9vd25lcihwZykgIT0gZCk7CiAgICAgICAgIHB1dF9wYWdlX2Fs
bG9jX3JlZihwZyk7CisgICAgICAgIHB1dF9wYWdlKHBnKTsKIAogICAgICAgICBpZiAoIHBnLT5j
b3VudF9pbmZvICYgflBHQ194ZW5faGVhcCApCiAgICAgICAgIHsKLS0gCjIuMjAuMS4yLmdiMjFl
YmI2NzEKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpY
ZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRw
czovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
