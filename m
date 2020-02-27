Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 16100172801
	for <lists+xen-devel@lfdr.de>; Thu, 27 Feb 2020 19:49:34 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j7OAi-0006Hw-NY; Thu, 27 Feb 2020 18:46:08 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=iNYA=4P=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1j7OAh-0006Hr-OM
 for xen-devel@lists.xenproject.org; Thu, 27 Feb 2020 18:46:07 +0000
X-Inumbo-ID: 697637da-5991-11ea-83b0-bc764e2007e4
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 697637da-5991-11ea-83b0-bc764e2007e4;
 Thu, 27 Feb 2020 18:46:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1582829167;
 h=from:to:cc:subject:date:message-id:mime-version;
 bh=AkgT2nv8+RRbmZx7MoRhg0SHqYJEL6hry9fiUhJ4c+Q=;
 b=E7y9ygpKjt76pHXFI6v+hJll2yEbcVllpoNzu65J6CLg4FrPHLoxBU/Q
 a24LQFuCFldR6Scy29MDXDL8ahs8bsXmyiXyXzYV+FqeYXTyN1RZyS1KO
 vHMQzt/J9tXFS89QTkcLnhzmKoavVZN8C3BD/sx1v+TO6gP+Afu7JnPD6 0=;
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
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: Y9kaHUqK1KDg0id5ghT3bs68/w7jAXvWyGj1DISbiQe2sFv3x4rrZ7FhpN/eUphI625rKt0M3h
 5jsK/+dM6txrcXEiWG9+sY9oxGyUjIdBl0NtrG4T3eon2EE3DxUjjHtB/Hdxu13QcYJxQlOumI
 Dxf52W8ejxapXOWXO3AO54ZW0o9PYjXfWx9FMy2ADXprrclkFwQgtzG/g1t8XkqKo8t42TKRHl
 Bnd0S0AXw6a6+HgzZVnt20K63+p+eNCsECPOJp5u+paQM83zkAr9Q0Ej3rF/hQZJRHnm/RCRw0
 cG8=
X-SBRS: 2.7
X-MesageID: 13105780
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,493,1574139600"; d="scan'208";a="13105780"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Date: Thu, 27 Feb 2020 18:46:02 +0000
Message-ID: <20200227184602.28282-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH] xen/grant: Fix signed/unsigned comparisons
 issues
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <JBeulich@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RWFjaCBmdW5jdGlvbiB0YWtlcyBhbiB1bnNpZ25lZCBjb3VudCwgYW5kIGxvb3BzIGJhc2VkIG9u
IGEgc2lnbmVkIGkuICBUaGlzCmNhdXNlcyBwcm9ibGVtcyB3aGVuIGJldHdlZW4gMiBhbmQgNCBi
aWxsaW9uIG9wZXJhdGlvbnMgYXJlIHJlcXVlc3RlZC4KCkluIHByYWN0aWNlLCBzaWduZWQtbmVz
cyBpc3N1ZXMgYXJlbid0IHBvc3NpYmxlIGJlY2F1c2UgY291bnQgZXhjZWVkaW5nCklOVF9NQVgg
aXMgZXhjbHVkZWQgZWFybGllciBpbiBkb19ncmFudF9vcCgpLCBidXQgdGhlIGNvZGUgcmVhZHMg
YXMgaWYgaXQgaXMKYnVnZ3ksIGFuZCBHQ0Mgb2J2aW91c2x5IGNhbid0IHNwb3QgdGhpcyBlaXRo
ZXIuCgpCbG9hdC1vLW1ldGVyIHJlcG9ydHM6CiAgYWRkL3JlbW92ZTogMC8wIGdyb3cvc2hyaW5r
OiAwLzQgdXAvZG93bjogMC8tOTUgKC05NSkKICBGdW5jdGlvbiAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICBvbGQgICAgIG5ldyAgIGRlbHRhCiAgZG9fZ3JhbnRfdGFibGVfb3Ag
ICAgICAgICAgICAgICAgICAgICAgICAgICA3MTU1ICAgIDcxNDAgICAgIC0xNQogIGdudHRhYl90
cmFuc2ZlciAgICAgICAgICAgICAgICAgICAgICAgICAgICAgMjczMiAgICAyNzE2ICAgICAtMTYK
ICBnbnR0YWJfdW5tYXBfZ3JhbnRfcmVmICAgICAgICAgICAgICAgICAgICAgICA3NzEgICAgIDcz
OSAgICAgLTMyCiAgZ250dGFiX3VubWFwX2FuZF9yZXBsYWNlICAgICAgICAgICAgICAgICAgICAg
NzcxICAgICA3MzkgICAgIC0zMgogIFRvdGFsOiBCZWZvcmU9Mjk5NjM2NCwgQWZ0ZXI9Mjk5NjI2
OSwgY2hnIC0wLjAwJQoKYW5kIGluc3BlY3Rpb24gb2YgZ250dGFiX3VubWFwX2dyYW50X3JlZigp
IGF0IGxlYXN0IHJldmVhbHMgb25lIGZld2VyIGxvY2FsCnZhcmlhYmxlcyBvbiB0aGUgc3RhY2su
CgpTaWduZWQtb2ZmLWJ5OiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29t
PgotLS0KQ0M6IEdlb3JnZSBEdW5sYXAgPEdlb3JnZS5EdW5sYXBAZXUuY2l0cml4LmNvbT4KQ0M6
IEphbiBCZXVsaWNoIDxKQmV1bGljaEBzdXNlLmNvbT4KQ0M6IEtvbnJhZCBSemVzenV0ZWsgV2ls
ayA8a29ucmFkLndpbGtAb3JhY2xlLmNvbT4KQ0M6IFN0ZWZhbm8gU3RhYmVsbGluaSA8c3N0YWJl
bGxpbmlAa2VybmVsLm9yZz4KQ0M6IFdlaSBMaXUgPHdsQHhlbi5vcmc+CkNDOiBKdWxpZW4gR3Jh
bGwgPGp1bGllbkB4ZW4ub3JnPgoKZ250dGFiX3VubWFwX2dyYW50X3JlZigpJ3Mgc3RhY2sgZnJh
bWUgc2l6ZSBpcyAweDc0MCAoZHJvcHBpbmcgdG8gMHg3MzgpIHdoaWNoCmlzIGFsYXJtaW5nbHkg
Y2xvc2UgdG8gMmsuCi0tLQogeGVuL2NvbW1vbi9ncmFudF90YWJsZS5jIHwgMTYgKysrKysrKysr
LS0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDkgaW5zZXJ0aW9ucygrKSwgNyBkZWxldGlvbnMoLSkK
CmRpZmYgLS1naXQgYS94ZW4vY29tbW9uL2dyYW50X3RhYmxlLmMgYi94ZW4vY29tbW9uL2dyYW50
X3RhYmxlLmMKaW5kZXggYmMzN2FjYWUwZS4uMGY4MTg3NWJlZSAxMDA2NDQKLS0tIGEveGVuL2Nv
bW1vbi9ncmFudF90YWJsZS5jCisrKyBiL3hlbi9jb21tb24vZ3JhbnRfdGFibGUuYwpAQCAtMTI3
MCw3ICsxMjcwLDcgQEAgc3RhdGljIGxvbmcKIGdudHRhYl9tYXBfZ3JhbnRfcmVmKAogICAgIFhF
Tl9HVUVTVF9IQU5ETEVfUEFSQU0oZ250dGFiX21hcF9ncmFudF9yZWZfdCkgdW9wLCB1bnNpZ25l
ZCBpbnQgY291bnQpCiB7Ci0gICAgaW50IGk7CisgICAgdW5zaWduZWQgaW50IGk7CiAgICAgc3Ry
dWN0IGdudHRhYl9tYXBfZ3JhbnRfcmVmIG9wOwogCiAgICAgZm9yICggaSA9IDA7IGkgPCBjb3Vu
dDsgaSsrICkKQEAgLTE1NjgsMTMgKzE1NjgsMTQgQEAgc3RhdGljIGxvbmcKIGdudHRhYl91bm1h
cF9ncmFudF9yZWYoCiAgICAgWEVOX0dVRVNUX0hBTkRMRV9QQVJBTShnbnR0YWJfdW5tYXBfZ3Jh
bnRfcmVmX3QpIHVvcCwgdW5zaWduZWQgaW50IGNvdW50KQogewotICAgIGludCBpLCBjLCBwYXJ0
aWFsX2RvbmUsIGRvbmUgPSAwOworICAgIHVuc2lnbmVkIGludCBpLCBwYXJ0aWFsX2RvbmUsIGRv
bmUgPSAwOwogICAgIHN0cnVjdCBnbnR0YWJfdW5tYXBfZ3JhbnRfcmVmIG9wOwogICAgIHN0cnVj
dCBnbnR0YWJfdW5tYXBfY29tbW9uIGNvbW1vbltHTlRUQUJfVU5NQVBfQkFUQ0hfU0laRV07CiAK
ICAgICB3aGlsZSAoIGNvdW50ICE9IDAgKQogICAgIHsKLSAgICAgICAgYyA9IG1pbihjb3VudCwg
KHVuc2lnbmVkIGludClHTlRUQUJfVU5NQVBfQkFUQ0hfU0laRSk7CisgICAgICAgIHVuc2lnbmVk
IGludCBjID0gbWluKGNvdW50LCAodW5zaWduZWQgaW50KUdOVFRBQl9VTk1BUF9CQVRDSF9TSVpF
KTsKKwogICAgICAgICBwYXJ0aWFsX2RvbmUgPSAwOwogCiAgICAgICAgIGZvciAoIGkgPSAwOyBp
IDwgYzsgaSsrICkKQEAgLTE2MzMsMTMgKzE2MzQsMTQgQEAgc3RhdGljIGxvbmcKIGdudHRhYl91
bm1hcF9hbmRfcmVwbGFjZSgKICAgICBYRU5fR1VFU1RfSEFORExFX1BBUkFNKGdudHRhYl91bm1h
cF9hbmRfcmVwbGFjZV90KSB1b3AsIHVuc2lnbmVkIGludCBjb3VudCkKIHsKLSAgICBpbnQgaSwg
YywgcGFydGlhbF9kb25lLCBkb25lID0gMDsKKyAgICB1bnNpZ25lZCBpbnQgaSwgcGFydGlhbF9k
b25lLCBkb25lID0gMDsKICAgICBzdHJ1Y3QgZ250dGFiX3VubWFwX2FuZF9yZXBsYWNlIG9wOwog
ICAgIHN0cnVjdCBnbnR0YWJfdW5tYXBfY29tbW9uIGNvbW1vbltHTlRUQUJfVU5NQVBfQkFUQ0hf
U0laRV07CiAKICAgICB3aGlsZSAoIGNvdW50ICE9IDAgKQogICAgIHsKLSAgICAgICAgYyA9IG1p
bihjb3VudCwgKHVuc2lnbmVkIGludClHTlRUQUJfVU5NQVBfQkFUQ0hfU0laRSk7CisgICAgICAg
IHVuc2lnbmVkIGludCBjID0gbWluKGNvdW50LCAodW5zaWduZWQgaW50KUdOVFRBQl9VTk1BUF9C
QVRDSF9TSVpFKTsKKwogICAgICAgICBwYXJ0aWFsX2RvbmUgPSAwOwogCiAgICAgICAgIGZvciAo
IGkgPSAwOyBpIDwgYzsgaSsrICkKQEAgLTIxNDIsNyArMjE0NCw3IEBAIGdudHRhYl90cmFuc2Zl
cigKICAgICBzdHJ1Y3QgZG9tYWluICpkID0gY3VycmVudC0+ZG9tYWluOwogICAgIHN0cnVjdCBk
b21haW4gKmU7CiAgICAgc3RydWN0IHBhZ2VfaW5mbyAqcGFnZTsKLSAgICBpbnQgaTsKKyAgICB1
bnNpZ25lZCBpbnQgaTsKICAgICBzdHJ1Y3QgZ250dGFiX3RyYW5zZmVyIGdvcDsKICAgICBtZm5f
dCBtZm47CiAgICAgdW5zaWduZWQgaW50IG1heF9iaXRzaXplOwpAQCAtMzM1OSw3ICszMzYxLDcg
QEAgc3RhdGljIGxvbmcKIGdudHRhYl9zd2FwX2dyYW50X3JlZihYRU5fR1VFU1RfSEFORExFX1BB
UkFNKGdudHRhYl9zd2FwX2dyYW50X3JlZl90KSB1b3AsCiAgICAgICAgICAgICAgICAgICAgICAg
dW5zaWduZWQgaW50IGNvdW50KQogewotICAgIGludCBpOworICAgIHVuc2lnbmVkIGludCBpOwog
ICAgIGdudHRhYl9zd2FwX2dyYW50X3JlZl90IG9wOwogCiAgICAgZm9yICggaSA9IDA7IGkgPCBj
b3VudDsgaSsrICkKLS0gCjIuMTEuMAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5m
by94ZW4tZGV2ZWw=
