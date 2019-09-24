Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D192BD712
	for <lists+xen-devel@lfdr.de>; Wed, 25 Sep 2019 06:18:25 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iCyj3-0000Sf-35; Wed, 25 Sep 2019 04:16:25 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Z4a6=XT=suse.de=nsaenzjulienne@srs-us1.protection.inumbo.net>)
 id 1iCpJE-0000Fs-DO
 for xen-devel@lists.xenproject.org; Tue, 24 Sep 2019 18:13:08 +0000
X-Inumbo-ID: eda88f32-def6-11e9-97fb-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by localhost (Halon) with ESMTPS
 id eda88f32-def6-11e9-97fb-bc764e2007e4;
 Tue, 24 Sep 2019 18:12:54 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id E4980AEF8;
 Tue, 24 Sep 2019 18:12:53 +0000 (UTC)
From: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
To: robh+dt@kernel.org, devicetree@vger.kernel.org, frowand.list@gmail.com,
 linux-arm-kernel@lists.infradead.org, linux-wireless@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 dmaengine@vger.kernel.org, etnaviv@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, xen-devel@lists.xenproject.org,
 linux-tegra@vger.kernel.org, linux-media@vger.kernel.org,
 linux-pci@vger.kernel.org
Date: Tue, 24 Sep 2019 20:12:34 +0200
Message-Id: <20190924181244.7159-4-nsaenzjulienne@suse.de>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20190924181244.7159-1-nsaenzjulienne@suse.de>
References: <20190924181244.7159-1-nsaenzjulienne@suse.de>
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 25 Sep 2019 04:16:20 +0000
Subject: [Xen-devel] [PATCH 03/11] of: address: use parent DT node in
 bus->count_cells()
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
Cc: f.fainelli@gmail.com, mbrugger@suse.com, wahrenst@gmx.net,
 james.quinlan@broadcom.com, robin.murphy@arm.com,
 Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhlIGZ1bmN0aW9uIHByb3ZpZGVzIHRoZSBjZWxsIHNpemVzIGZvciBhIHNwZWNpZmljIGJ1cyB0
eXBlLiBJbnN0ZWFkIG9mCnBhc3NpbmcgaXQgdGhlIGRldmljZSBEVCBub2RlIHNpdHRpbmcgb24g
dG9wIG9mIHRoYXQgYnVzIHdlIGRpcmVjdGx5CnBhc3MgaXRzIHBhcmVudCB3aGljaCBpcyB0aGUg
YWN0dWFsIG5vZGUgdGhlIGZ1bmN0aW9uIHdpbGwgc3RhcnQgbG9va2luZwpmcm9tLgoKU2lnbmVk
LW9mZi1ieTogTmljb2xhcyBTYWVueiBKdWxpZW5uZSA8bnNhZW56anVsaWVubmVAc3VzZS5kZT4K
LS0tCgogZHJpdmVycy9vZi9hZGRyZXNzLmMgfCAxOCArKysrKysrKysrLS0tLS0tLS0KIDEgZmls
ZSBjaGFuZ2VkLCAxMCBpbnNlcnRpb25zKCspLCA4IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBh
L2RyaXZlcnMvb2YvYWRkcmVzcy5jIGIvZHJpdmVycy9vZi9hZGRyZXNzLmMKaW5kZXggMGY4OTg3
NTYxOTlkLi45YzFlNjM4ZmE4ZWEgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvb2YvYWRkcmVzcy5jCisr
KyBiL2RyaXZlcnMvb2YvYWRkcmVzcy5jCkBAIC0xNCw2ICsxNCw4IEBACiAjaW5jbHVkZSA8bGlu
dXgvc2xhYi5oPgogI2luY2x1ZGUgPGxpbnV4L3N0cmluZy5oPgogCisjaW5jbHVkZSAib2ZfcHJp
dmF0ZS5oIgorCiAvKiBNYXggYWRkcmVzcyBzaXplIHdlIGRlYWwgd2l0aCAqLwogI2RlZmluZSBP
Rl9NQVhfQUREUl9DRUxMUwk0CiAjZGVmaW5lIE9GX0NIRUNLX0FERFJfQ09VTlQobmEpCSgobmEp
ID4gMCAmJiAobmEpIDw9IE9GX01BWF9BRERSX0NFTExTKQpAQCAtNDIsNyArNDQsNyBAQCBzdHJ1
Y3Qgb2ZfYnVzIHsKIAljb25zdCBjaGFyCSpuYW1lOwogCWNvbnN0IGNoYXIJKmFkZHJlc3NlczsK
IAlpbnQJCSgqbWF0Y2gpKHN0cnVjdCBkZXZpY2Vfbm9kZSAqcGFyZW50KTsKLQl2b2lkCQkoKmNv
dW50X2NlbGxzKShzdHJ1Y3QgZGV2aWNlX25vZGUgKmNoaWxkLAorCXZvaWQJCSgqY291bnRfY2Vs
bHMpKHN0cnVjdCBkZXZpY2Vfbm9kZSAqcGFyZW50LAogCQkJCSAgICAgICBpbnQgKmFkZHJjLCBp
bnQgKnNpemVjKTsKIAl1NjQJCSgqbWFwKShfX2JlMzIgKmFkZHIsIGNvbnN0IF9fYmUzMiAqcmFu
Z2UsCiAJCQkJaW50IG5hLCBpbnQgbnMsIGludCBwbmEpOwpAQCAtNTQsMTMgKzU2LDEzIEBAIHN0
cnVjdCBvZl9idXMgewogICogRGVmYXVsdCB0cmFuc2xhdG9yIChnZW5lcmljIGJ1cykKICAqLwog
Ci1zdGF0aWMgdm9pZCBvZl9idXNfZGVmYXVsdF9jb3VudF9jZWxscyhzdHJ1Y3QgZGV2aWNlX25v
ZGUgKmRldiwKK3N0YXRpYyB2b2lkIG9mX2J1c19kZWZhdWx0X2NvdW50X2NlbGxzKHN0cnVjdCBk
ZXZpY2Vfbm9kZSAqcGFyZW50LAogCQkJCSAgICAgICBpbnQgKmFkZHJjLCBpbnQgKnNpemVjKQog
ewogCWlmIChhZGRyYykKLQkJKmFkZHJjID0gb2Zfbl9hZGRyX2NlbGxzKGRldik7CisJCSphZGRy
YyA9IF9fb2Zfbl9hZGRyX2NlbGxzX3BhcmVudChwYXJlbnQpOwogCWlmIChzaXplYykKLQkJKnNp
emVjID0gb2Zfbl9zaXplX2NlbGxzKGRldik7CisJCSpzaXplYyA9IF9fb2Zfbl9zaXplX2NlbGxz
X3BhcmVudChwYXJlbnQpOwogfQogCiBzdGF0aWMgdTY0IG9mX2J1c19kZWZhdWx0X21hcChfX2Jl
MzIgKmFkZHIsIGNvbnN0IF9fYmUzMiAqcmFuZ2UsCkBAIC0xOTIsNyArMTk0LDcgQEAgY29uc3Qg
X19iZTMyICpvZl9nZXRfcGNpX2FkZHJlc3Moc3RydWN0IGRldmljZV9ub2RlICpkZXYsIGludCBi
YXJfbm8sIHU2NCAqc2l6ZSwKIAkJb2Zfbm9kZV9wdXQocGFyZW50KTsKIAkJcmV0dXJuIE5VTEw7
CiAJfQotCWJ1cy0+Y291bnRfY2VsbHMoZGV2LCAmbmEsICZucyk7CisJYnVzLT5jb3VudF9jZWxs
cyhwYXJlbnQsICZuYSwgJm5zKTsKIAlvZl9ub2RlX3B1dChwYXJlbnQpOwogCWlmICghT0ZfQ0hF
Q0tfQUREUl9DT1VOVChuYSkpCiAJCXJldHVybiBOVUxMOwpAQCAtNTkyLDcgKzU5NCw3IEBAIHN0
YXRpYyB1NjQgX19vZl90cmFuc2xhdGVfYWRkcmVzcyhzdHJ1Y3QgZGV2aWNlX25vZGUgKmRldiwK
IAlidXMgPSBvZl9tYXRjaF9idXMocGFyZW50KTsKIAogCS8qIENvdW50IGFkZHJlc3MgY2VsbHMg
JiBjb3B5IGFkZHJlc3MgbG9jYWxseSAqLwotCWJ1cy0+Y291bnRfY2VsbHMoZGV2LCAmbmEsICZu
cyk7CisJYnVzLT5jb3VudF9jZWxscyhwYXJlbnQsICZuYSwgJm5zKTsKIAlpZiAoIU9GX0NIRUNL
X0NPVU5UUyhuYSwgbnMpKSB7CiAJCXByX2RlYnVnKCJCYWQgY2VsbCBjb3VudCBmb3IgJXBPRlxu
IiwgZGV2KTsKIAkJZ290byBiYWlsOwpAQCAtNjM0LDcgKzYzNiw3IEBAIHN0YXRpYyB1NjQgX19v
Zl90cmFuc2xhdGVfYWRkcmVzcyhzdHJ1Y3QgZGV2aWNlX25vZGUgKmRldiwKIAogCQkvKiBHZXQg
bmV3IHBhcmVudCBidXMgYW5kIGNvdW50cyAqLwogCQlwYnVzID0gb2ZfbWF0Y2hfYnVzKHBhcmVu
dCk7Ci0JCXBidXMtPmNvdW50X2NlbGxzKGRldiwgJnBuYSwgJnBucyk7CisJCXBidXMtPmNvdW50
X2NlbGxzKHBhcmVudCwgJnBuYSwgJnBucyk7CiAJCWlmICghT0ZfQ0hFQ0tfQ09VTlRTKHBuYSwg
cG5zKSkgewogCQkJcHJfZXJyKCJCYWQgY2VsbCBjb3VudCBmb3IgJXBPRlxuIiwgZGV2KTsKIAkJ
CWJyZWFrOwpAQCAtNzI2LDcgKzcyOCw3IEBAIGNvbnN0IF9fYmUzMiAqb2ZfZ2V0X2FkZHJlc3Mo
c3RydWN0IGRldmljZV9ub2RlICpkZXYsIGludCBpbmRleCwgdTY0ICpzaXplLAogCWlmIChwYXJl
bnQgPT0gTlVMTCkKIAkJcmV0dXJuIE5VTEw7CiAJYnVzID0gb2ZfbWF0Y2hfYnVzKHBhcmVudCk7
Ci0JYnVzLT5jb3VudF9jZWxscyhkZXYsICZuYSwgJm5zKTsKKwlidXMtPmNvdW50X2NlbGxzKHBh
cmVudCwgJm5hLCAmbnMpOwogCW9mX25vZGVfcHV0KHBhcmVudCk7CiAJaWYgKCFPRl9DSEVDS19B
RERSX0NPVU5UKG5hKSkKIAkJcmV0dXJuIE5VTEw7Ci0tIAoyLjIzLjAKCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0
Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qu
b3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
