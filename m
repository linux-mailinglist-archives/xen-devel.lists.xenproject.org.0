Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A74618BAE4
	for <lists+xen-devel@lfdr.de>; Tue, 13 Aug 2019 15:56:16 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hxXDm-0006SG-JK; Tue, 13 Aug 2019 13:52:18 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=8rFE=WJ=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1hxXDk-0006S8-G3
 for xen-devel@lists.xenproject.org; Tue, 13 Aug 2019 13:52:16 +0000
X-Inumbo-ID: 8e7c79c4-bdd1-11e9-ace5-33e37f24dc84
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8e7c79c4-bdd1-11e9-ace5-33e37f24dc84;
 Tue, 13 Aug 2019 13:52:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1565704335;
 h=from:to:cc:subject:date:message-id:mime-version;
 bh=i7Olcy1mMFqeL4hThALbIgKSUsvURztvVTRhgDHjJuI=;
 b=R5yhL32AGTV5OL4uUyRfk1ADPbf4B+J6iMXjX8o0IQBxoreJNAKQP2QY
 RjFGnVpbuAaq9iLF8cga6/wPeOQUBzlZ7HVsmNsyKHayxO+25dYlECb8Y
 ulTWi4oA6PQ9LBi9NAkqWTEp+FvBHELSwd0skWYK08GeKJyuslhZqCkWV U=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa4.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: azq86Yq4fQtESadWrLJiDNfIaFmipZ86eSLsTXkH7AUkeho2BGAhiHmZrFWbm2l2rTEjBLKnx0
 5TEdDqkoLwHKCYv8QGeFv2UWzSVnwLVHu0nUlgay5wT4EATItzPi5BxkhUkUOl+ohcDLTxJFYX
 8/GYwYqlzdqwAH8DVD7ZnsR5qPmVcu8hW8EIsckvQiZYpj+9HXj61SliIwbXHe/EGXiRthBAw/
 cnRo1oxMRdbB4Tl2waQbO51RHMw0wiGKHKgjKJ9LSa95q+qBa6biNayMksaqj38rbb47BAuW1Z
 iS0=
X-SBRS: 2.7
X-MesageID: 4408663
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,381,1559534400"; 
   d="scan'208";a="4408663"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Date: Tue, 13 Aug 2019 14:52:11 +0100
Message-ID: <20190813135211.13668-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH] tools/xenstat: Fix -Wformat-truncation= issue
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

QnVpbGRpbmcgd2l0aCBHQ0MgOC4zIG9uIEJ1c3RlciBpZGVudGlmaWVzOgoKICBzcmMveGVuc3Rh
dF9saW51eC5jOiBJbiBmdW5jdGlvbiAneGVuc3RhdF9jb2xsZWN0X25ldHdvcmtzJzoKICBzcmMv
eGVuc3RhdF9saW51eC5jOjMwNzozMjogd2FybmluZzogJ3NucHJpbnRmJyBvdXRwdXQgbWF5IGJl
IHRydW5jYXRlZCBiZWZvcmUKICB0aGUgbGFzdCBmb3JtYXQgY2hhcmFjdGVyIFstV2Zvcm1hdC10
cnVuY2F0aW9uPV0KICAgIHNucHJpbnRmKGRldk5vQnJpZGdlLCAxNiwgInAlcyIsIGRldkJyaWRn
ZSk7CiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBeCiAgc3JjL3hlbnN0YXRfbGlu
dXguYzozMDc6Mjogbm90ZTogJ3NucHJpbnRmJyBvdXRwdXQgYmV0d2VlbiAyIGFuZCAxNyBieXRl
cyBpbnRvCiAgYSBkZXN0aW5hdGlvbiBvZiBzaXplIDE2CiAgICBzbnByaW50ZihkZXZOb0JyaWRn
ZSwgMTYsICJwJXMiLCBkZXZCcmlkZ2UpOwogICAgXn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+
fn5+fn5+fn5+fn5+fn5+fgoKZGV2Tm9CcmlkZ2VbXSBuZWVkcyBvbmUgY2hhcmF0ZXIgbW9yZSB0
aGFuIGRldkJyaWRnZVtdLCBzbyBhbGxvY2F0ZSBvbmUgYnl0ZQptb3JlLiAgUmVwbGFjZSBhIHJh
dyAxNiBpbiB0aGUgc25wcmludGYoKSBjYWxsIHdpdGggYSBzaXplb2YoKSBleHByZXNzaW9uCmlu
c3RlYWQuCgpGaW5hbGx5LCBsaWJ4ZW5zdGF0LCB1bmxpa2UgbW9zdCBvZiB0aGUgcmVzdCBvZiB0
aGUgWGVuLCBkb2Vzbid0IHVzZSAtV2Vycm9yCndoaWNoIGlzIHdoeSB0aGlzIGlzc3VlIHdlbnQg
dW5ub3RpY2VkIGluIENJLiAgRml4IHRoaXMuCgpTaWduZWQtb2ZmLWJ5OiBBbmRyZXcgQ29vcGVy
IDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPgotLS0KQ0M6IElhbiBKYWNrc29uIDxJYW4uSmFj
a3NvbkBjaXRyaXguY29tPgpDQzogV2VpIExpdSA8d2xAeGVuLm9yZz4KLS0tCiB0b29scy94ZW5z
dGF0L2xpYnhlbnN0YXQvTWFrZWZpbGUgICAgICAgICAgICB8IDIgKy0KIHRvb2xzL3hlbnN0YXQv
bGlieGVuc3RhdC9zcmMveGVuc3RhdF9saW51eC5jIHwgNCArKy0tCiAyIGZpbGVzIGNoYW5nZWQs
IDMgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS90b29scy94ZW5z
dGF0L2xpYnhlbnN0YXQvTWFrZWZpbGUgYi90b29scy94ZW5zdGF0L2xpYnhlbnN0YXQvTWFrZWZp
bGUKaW5kZXggNThmOWQ2M2RlNS4uZWExMTVhZTBlNiAxMDA2NDQKLS0tIGEvdG9vbHMveGVuc3Rh
dC9saWJ4ZW5zdGF0L01ha2VmaWxlCisrKyBiL3Rvb2xzL3hlbnN0YXQvbGlieGVuc3RhdC9NYWtl
ZmlsZQpAQCAtMzEsNyArMzEsNyBAQCBPQkpFQ1RTLSQoQ09ORklHX05ldEJTRCkgKz0gc3JjL3hl
bnN0YXRfbmV0YnNkLm8KIE9CSkVDVFMtJChDT05GSUdfRnJlZUJTRCkgKz0gc3JjL3hlbnN0YXRf
ZnJlZWJzZC5vCiBTT05BTUVfRkxBR1M9LVdsLCQoU09OQU1FX0xERkxBRykgLVdsLGxpYnhlbnN0
YXQuc28uJChNQUpPUikKIAotQ0ZMQUdTKz0tZlBJQworQ0ZMQUdTKz0tZlBJQyAtV2Vycm9yCiBD
RkxBR1MrPS1Jc3JjICQoQ0ZMQUdTX2xpYnhlbmN0cmwpICQoQ0ZMQUdTX2xpYnhlbnN0b3JlKSAk
KENGTEFHU194ZW5pbmNsdWRlKSAtaW5jbHVkZSAkKFhFTl9ST09UKS90b29scy9jb25maWcuaAog
CiBMRExJQlMteSA9ICQoTERMSUJTX2xpYnhlbnN0b3JlKSAkKExETElCU19saWJ4ZW5jdHJsKSAt
bHlhamwKZGlmZiAtLWdpdCBhL3Rvb2xzL3hlbnN0YXQvbGlieGVuc3RhdC9zcmMveGVuc3RhdF9s
aW51eC5jIGIvdG9vbHMveGVuc3RhdC9saWJ4ZW5zdGF0L3NyYy94ZW5zdGF0X2xpbnV4LmMKaW5k
ZXggOTQyMWNhNDNjOC4uNzUzMDM0OWVlZSAxMDA2NDQKLS0tIGEvdG9vbHMveGVuc3RhdC9saWJ4
ZW5zdGF0L3NyYy94ZW5zdGF0X2xpbnV4LmMKKysrIGIvdG9vbHMveGVuc3RhdC9saWJ4ZW5zdGF0
L3NyYy94ZW5zdGF0X2xpbnV4LmMKQEAgLTI2NCw3ICsyNjQsNyBAQCBpbnQgeGVuc3RhdF9jb2xs
ZWN0X25ldHdvcmtzKHhlbnN0YXRfbm9kZSAqIG5vZGUpCiB7CiAJLyogSGVscGVyIHZhcmlhYmxl
cyBmb3IgcGFyc2VOZXREZXZMaW5lKCkgZnVuY3Rpb24gZGVmaW5lZCBhYm92ZSAqLwogCWludCBp
OwotCWNoYXIgbGluZVs1MTJdID0geyAwIH0sIGlmYWNlWzE2XSA9IHsgMCB9LCBkZXZCcmlkZ2Vb
MTZdID0geyAwIH0sIGRldk5vQnJpZGdlWzE2XSA9IHsgMCB9OworCWNoYXIgbGluZVs1MTJdID0g
eyAwIH0sIGlmYWNlWzE2XSA9IHsgMCB9LCBkZXZCcmlkZ2VbMTZdID0geyAwIH0sIGRldk5vQnJp
ZGdlWzE3XSA9IHsgMCB9OwogCXVuc2lnbmVkIGxvbmcgbG9uZyByeEJ5dGVzLCByeFBhY2tldHMs
IHJ4RXJycywgcnhEcm9wcywgdHhCeXRlcywgdHhQYWNrZXRzLCB0eEVycnMsIHR4RHJvcHM7CiAK
IAlzdHJ1Y3QgcHJpdl9kYXRhICpwcml2ID0gZ2V0X3ByaXZfZGF0YShub2RlLT5oYW5kbGUpOwpA
QCAtMzA0LDcgKzMwNCw3IEBAIGludCB4ZW5zdGF0X2NvbGxlY3RfbmV0d29ya3MoeGVuc3RhdF9u
b2RlICogbm9kZSkKIAogCS8qIFdlIGdldCB0aGUgYnJpZGdlIGRldmljZXMgZm9yIHVzZSB3aXRo
IGJvbmRpbmcgaW50ZXJmYWNlIHRvIGdldCBib25kaW5nIGludGVyZmFjZSBzdGF0cyAqLwogCWdl
dEJyaWRnZSgidmlyIiwgZGV2QnJpZGdlLCBzaXplb2YoZGV2QnJpZGdlKSk7Ci0Jc25wcmludGYo
ZGV2Tm9CcmlkZ2UsIDE2LCAicCVzIiwgZGV2QnJpZGdlKTsKKwlzbnByaW50ZihkZXZOb0JyaWRn
ZSwgc2l6ZW9mKGRldk5vQnJpZGdlKSwgInAlcyIsIGRldkJyaWRnZSk7CiAKIAl3aGlsZSAoZmdl
dHMobGluZSwgNTEyLCBwcml2LT5wcm9jbmV0ZGV2KSkgewogCQl4ZW5zdGF0X2RvbWFpbiAqZG9t
YWluOwotLSAKMi4xMS4wCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVj
dC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1k
ZXZlbA==
