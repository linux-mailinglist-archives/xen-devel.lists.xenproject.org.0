Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 308857FE79
	for <lists+xen-devel@lfdr.de>; Fri,  2 Aug 2019 18:18:43 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1htaEA-00022b-TK; Fri, 02 Aug 2019 16:16:22 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=FvgH=V6=citrix.com=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1htaE9-00022S-6s
 for xen-devel@lists.xenproject.org; Fri, 02 Aug 2019 16:16:21 +0000
X-Inumbo-ID: dcdcffd5-b540-11e9-8980-bc764e045a96
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id dcdcffd5-b540-11e9-8980-bc764e045a96;
 Fri, 02 Aug 2019 16:16:20 +0000 (UTC)
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=george.dunlap@citrix.com;
 spf=Pass smtp.mailfrom=George.Dunlap@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 george.dunlap@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="George.Dunlap@citrix.com";
 x-sender="george.dunlap@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa4.hc3370-68.iphmx.com: domain of
 George.Dunlap@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="George.Dunlap@citrix.com";
 x-sender="George.Dunlap@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="George.Dunlap@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: hAcvFRb5TIqJOsVdWHhDr7f7WeHBHABccqioPSVd6tDJPs2QfJ9G6v63iH1e1fDO9belvulNtP
 vissyUhsVxX/3aXOPSXW3XPXeyX2sZYYQWqJwaMl5TzRapMmT04OoGpm7RVkQZcV6Y5peYHv47
 uQ/mB11x+goSlvVSmBKDFUPJ3s+hhft5cnVrMV6MFCykEj9x6YSo/++qsdaPy3Shiqwx3Llwn+
 t4azuAoJUSlp8N12Fe0Wg1ipnclFVHvcc+05pCqXYJWSRPRxwLZTbrIvD8ZuE1lqdxgoXxEjcp
 Q+4=
X-SBRS: 2.7
X-MesageID: 3952364
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,338,1559534400"; 
   d="scan'208";a="3952364"
From: George Dunlap <george.dunlap@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Fri, 2 Aug 2019 17:16:11 +0100
Message-ID: <20190802161611.4145-1-george.dunlap@citrix.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH] mm: Safe to clear PGC_allocated on xenheap
 pages without an extra reference
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
 Paul Durrant <paul.durrant@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Q29tbWl0cyBlYzgzZjgyNTYyNyAibW0uaDogYWRkIGhlbHBlciBmdW5jdGlvbiB0byB0ZXN0LWFu
ZC1jbGVhcgpfUEdDX2FsbG9jYXRlZCIgKGFuZCBzdWJzZXF1ZW50IGZpeC11cCA0NGE4ODdkMDIx
ZCAibW0uaDogZml4IEJVR19PTigpCmNvbmRpdGlvbiBpbiBwdXRfcGFnZV9hbGxvY19yZWYoKSIp
IGludHJvZHVjZWQgYSBCVUdfT04oKSB0byBkZXRlY3QKdW5zYWZlIGJlaGF2aW9yIG9mIGNhbGxl
cnMuCgpVbmZvcnR1bmF0ZWx5IHRoaXMgY29uZGl0aW9uIHN0aWxsIHR1cm5zIG91dCB0byBiZSB0
b28gc3RyaWN0Lgp4ZW5oZWFwIHBhZ2VzIGFyZSBzb21ld2hhdCAibWFnaWMiOiBjYWxsaW5nIGZy
ZWVfZG9taGVhcF9wYWdlcygpIG9uCnRoZW0gd2lsbCBub3QgY2F1c2UgZnJlZV9oZWFwX3BhZ2Vz
KCkgdG8gYmUgY2FsbGVkOiB3aGljaGV2ZXIgcGFydCBvZgpYZW4gYWxsb2NhdGVkIHRoZW0gc3Bl
Y2lhbGx5IG11c3QgY2FsbCBmcmVlX3hlbmhlYXBfcGFnZXMoKQpzcGVjaWZpY2FsbHkuICAoVGhl
eSdsbCBhbHNvIGJlIGhhbmRsZWQgYXBwcm9wcmlhdGVseSBhdCBkb21haW4KZGVzdHJ1Y3Rpb24g
dGltZS4pCgpPbmx5IGNyYXNoIFhlbiB3aGVuIHB1dF9wYWdlX2FsbG9jX3JlZigpIGZpbmRzIG9u
bHkgYSBzaW5nbGUgcmVmY291bnQKaWYgdGhlIHBhZ2UgaXMgbm90IGEgeGVuaGVhcCBwYWdlLgoK
U2lnbmVkLW9mZi1ieTogR2VvcmdlIER1bmxhcCA8Z2VvcmdlLmR1bmxhcEBjaXRyaXguY29tPgot
LS0KTkIgdGhpcyBoYXMgYmVlbiBjb21waWxlLXRlc3RlZCBvbmx5LgoKQ0M6IEFuZHJldyBDb29w
ZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+CkNDOiBKYW4gQmV1bGljaCA8amJldWxpY2hA
c3VzZS5jb20+CkNDOiBQYXVsIER1cnJhbnQgPHBhdWwuZHVycmFudEBjaXRyaXguY29tPgotLS0K
IHhlbi9pbmNsdWRlL3hlbi9tbS5oIHwgMTcgKysrKysrKysrKystLS0tLS0KIDEgZmlsZSBjaGFu
Z2VkLCAxMSBpbnNlcnRpb25zKCspLCA2IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3hlbi9p
bmNsdWRlL3hlbi9tbS5oIGIveGVuL2luY2x1ZGUveGVuL21tLmgKaW5kZXggOTc3ZTQ1YWFlNy4u
Mjk3ZmM2YWQ3YiAxMDA2NDQKLS0tIGEveGVuL2luY2x1ZGUveGVuL21tLmgKKysrIGIveGVuL2lu
Y2x1ZGUveGVuL21tLmgKQEAgLTY2NiwxNSArNjY2LDIwIEBAIHN0YXRpYyBpbmxpbmUgdm9pZCBz
aGFyZV94ZW5fcGFnZV93aXRoX3ByaXZpbGVnZWRfZ3Vlc3RzKAogc3RhdGljIGlubGluZSB2b2lk
IHB1dF9wYWdlX2FsbG9jX3JlZihzdHJ1Y3QgcGFnZV9pbmZvICpwYWdlKQogewogICAgIC8qCi0g
ICAgICogV2hlbmV2ZXIgYSBwYWdlIGlzIGFzc2lnbmVkIHRvIGEgZG9tYWluIHRoZW4gdGhlIF9Q
R0NfYWxsb2NhdGVkIGJpdAotICAgICAqIGlzIHNldCBhbmQgdGhlIHJlZmVyZW5jZSBjb3VudCBp
cyBzZXQgdG8gYXQgbGVhc3QgMS4gVGhpcyBmdW5jdGlvbgotICAgICAqIGNsZWFycyB0aGF0ICdh
bGxvY2F0aW9uIHJlZmVyZW5jZScgYnV0IGl0IGlzIHVuc2FmZSB0byBkbyBzbyB3aXRob3V0Ci0g
ICAgICogdGhlIGNhbGxlciBob2xkaW5nIGFuIGFkZGl0aW9uYWwgcmVmZXJlbmNlLiBJLmUuIHRo
ZSBhbGxvY2F0aW9uCi0gICAgICogcmVmZXJlbmNlIG11c3QgbmV2ZXIgYmUgdGhlIGxhc3QgcmVm
ZXJlbmNlIGhlbGQuCisgICAgICogV2hlbmV2ZXIgYSBwYWdlIGlzIGFzc2lnbmVkIHRvIGEgZG9t
YWluIHRoZW4gdGhlIF9QR0NfYWxsb2NhdGVkCisgICAgICogYml0IGlzIHNldCBhbmQgdGhlIHJl
ZmVyZW5jZSBjb3VudCBpcyBzZXQgdG8gYXQgbGVhc3QgMS4gVGhpcworICAgICAqIGZ1bmN0aW9u
IGNsZWFycyB0aGF0ICdhbGxvY2F0aW9uIHJlZmVyZW5jZScgYnV0IGl0IGlzIHVuc2FmZSB0bwor
ICAgICAqIGRvIHNvIHRvIGRvbWhlYXAgcGFnZXMgd2l0aG91dCB0aGUgY2FsbGVyIGhvbGRpbmcg
YW4gYWRkaXRpb25hbAorICAgICAqIHJlZmVyZW5jZS4gSS5lLiB0aGUgYWxsb2NhdGlvbiByZWZl
cmVuY2UgbXVzdCBuZXZlciBiZSB0aGUgbGFzdAorICAgICAqIHJlZmVyZW5jZSBoZWxkLgorICAg
ICAqIAorICAgICAqIChJdCdzIHNhZmUgZm9yIHhlbmhlYXAgcGFnZXMsIGJlY2F1c2UgcHV0X3Bh
Z2UoKSB3aWxsIG5vdCBjYXVzZQorICAgICAqIHRoZW0gdG8gYmUgZnJlZWQuKQogICAgICAqLwog
ICAgIGlmICggdGVzdF9hbmRfY2xlYXJfYml0KF9QR0NfYWxsb2NhdGVkLCAmcGFnZS0+Y291bnRf
aW5mbykgKQogICAgIHsKLSAgICAgICAgQlVHX09OKChwYWdlLT5jb3VudF9pbmZvICYgUEdDX2Nv
dW50X21hc2spIDw9IDEpOworICAgICAgICBCVUdfT04oKHBhZ2UtPmNvdW50X2luZm8gJiBQR0Nf
Y291bnRfbWFzaykgPD0gMSAmJgorICAgICAgICAgICAgICAgIShwYWdlLT5jb3VudF9pbmZvICYg
UEdDX3hlbl9oZWFwKSk7CiAgICAgICAgIHB1dF9wYWdlKHBhZ2UpOwogICAgIH0KIH0KLS0gCjIu
MjAuMQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhl
bi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBz
Oi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
