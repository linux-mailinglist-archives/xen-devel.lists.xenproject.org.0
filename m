Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6564DBD713
	for <lists+xen-devel@lfdr.de>; Wed, 25 Sep 2019 06:18:33 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iCyj3-0000UC-Vn; Wed, 25 Sep 2019 04:16:25 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Z4a6=XT=suse.de=nsaenzjulienne@srs-us1.protection.inumbo.net>)
 id 1iCpJJ-0000GV-EJ
 for xen-devel@lists.xenproject.org; Tue, 24 Sep 2019 18:13:13 +0000
X-Inumbo-ID: f03d052a-def6-11e9-8628-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by localhost (Halon) with ESMTPS
 id f03d052a-def6-11e9-8628-bc764e2007e4;
 Tue, 24 Sep 2019 18:12:59 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 376C8AC93;
 Tue, 24 Sep 2019 18:12:58 +0000 (UTC)
From: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
To: robh+dt@kernel.org, devicetree@vger.kernel.org, frowand.list@gmail.com,
 linux-arm-kernel@lists.infradead.org, linux-wireless@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 dmaengine@vger.kernel.org, etnaviv@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, xen-devel@lists.xenproject.org,
 linux-tegra@vger.kernel.org, linux-media@vger.kernel.org,
 linux-pci@vger.kernel.org
Date: Tue, 24 Sep 2019 20:12:37 +0200
Message-Id: <20190924181244.7159-7-nsaenzjulienne@suse.de>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20190924181244.7159-1-nsaenzjulienne@suse.de>
References: <20190924181244.7159-1-nsaenzjulienne@suse.de>
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 25 Sep 2019 04:16:20 +0000
Subject: [Xen-devel] [PATCH 06/11] of: address: use parent OF node in
 of_dma_get_range()
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

U29tZSBkZXZpY2VzIGRvbid0IGhhdmUgdGhlaXIgb3duIE9GIG5vZGUsIGFuZCBhcmUgc3R1Y2sg
cGFzc2luZyB0aGVpcgpidXMgbm9kZS4gQWRhcHQgdGhlIGZ1bmN0aW9uIGZvciB0aGlzIHVzZSBj
YXNlLgoKU2lnbmVkLW9mZi1ieTogTmljb2xhcyBTYWVueiBKdWxpZW5uZSA8bnNhZW56anVsaWVu
bmVAc3VzZS5kZT4KLS0tCgogZHJpdmVycy9vZi9hZGRyZXNzLmMgICAgICAgfCAzMyArKysrKysr
KysrKysrKystLS0tLS0tLS0tLS0tLS0tLS0KIGRyaXZlcnMvb2YvZGV2aWNlLmMgICAgICAgIHwg
IDMgKystCiBpbmNsdWRlL2xpbnV4L29mX2FkZHJlc3MuaCB8ICA4ICsrKystLS0tCiAzIGZpbGVz
IGNoYW5nZWQsIDIxIGluc2VydGlvbnMoKyksIDIzIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBh
L2RyaXZlcnMvb2YvYWRkcmVzcy5jIGIvZHJpdmVycy9vZi9hZGRyZXNzLmMKaW5kZXggNTM2NjYw
NjNlOTM4Li5iN2I4NjRiMGFjNzUgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvb2YvYWRkcmVzcy5jCisr
KyBiL2RyaXZlcnMvb2YvYWRkcmVzcy5jCkBAIC05MTQsMzAgKzkxNCwyMSBAQCBFWFBPUlRfU1lN
Qk9MKG9mX2lvX3JlcXVlc3RfYW5kX21hcCk7CiAgKiBJdCByZXR1cm5zIC1FTk9ERVYgaWYgImRt
YS1yYW5nZXMiIHByb3BlcnR5IHdhcyBub3QgZm91bmQKICAqIGZvciB0aGlzIGRldmljZSBpbiBE
VC4KICAqLwotaW50IG9mX2RtYV9nZXRfcmFuZ2Uoc3RydWN0IGRldmljZV9ub2RlICpucCwgdTY0
ICpkbWFfYWRkciwgdTY0ICpwYWRkciwgdTY0ICpzaXplKQoraW50IG9mX2RtYV9nZXRfcmFuZ2Uo
c3RydWN0IGRldmljZV9ub2RlICpwYXJlbnQsIHU2NCAqZG1hX2FkZHIsCisJCSAgICAgdTY0ICpw
YWRkciwgdTY0ICpzaXplKQogewotCXN0cnVjdCBkZXZpY2Vfbm9kZSAqbm9kZSA9IG9mX25vZGVf
Z2V0KG5wKTsKKwlzdHJ1Y3QgZGV2aWNlX25vZGUgKm5vZGUgPSBvZl9ub2RlX2dldChwYXJlbnQp
OwogCWNvbnN0IF9fYmUzMiAqcmFuZ2VzID0gTlVMTDsKIAlpbnQgbmFkZHIsIG5zaXplLCBwbmE7
CiAJaW50IHJldCA9IDA7CiAJdTY0IGRtYWFkZHI7CiAKLQlpZiAoIW5vZGUpCi0JCXJldHVybiAt
RUlOVkFMOwotCiAJd2hpbGUgKDEpIHsKLQkJc3RydWN0IGRldmljZV9ub2RlICpwYXJlbnQ7CisJ
CXN0cnVjdCBkZXZpY2Vfbm9kZSAqdG1wOwogCQlpbnQgbGVuOwogCi0JCW5hZGRyID0gb2Zfbl9h
ZGRyX2NlbGxzKG5vZGUpOwotCQluc2l6ZSA9IG9mX25fc2l6ZV9jZWxscyhub2RlKTsKLQotCQlw
YXJlbnQgPSBfX29mX2dldF9kbWFfcGFyZW50KG5vZGUpOwotCQlvZl9ub2RlX3B1dChub2RlKTsK
LQotCQlub2RlID0gcGFyZW50OwotCQlpZiAoIW5vZGUpCi0JCQlicmVhazsKKwkJbmFkZHIgPSBf
X29mX25fYWRkcl9jZWxsc19wYXJlbnQobm9kZSk7CisJCW5zaXplID0gX19vZl9uX3NpemVfY2Vs
bHNfcGFyZW50KG5vZGUpOwogCiAJCXJhbmdlcyA9IG9mX2dldF9wcm9wZXJ0eShub2RlLCAiZG1h
LXJhbmdlcyIsICZsZW4pOwogCkBAIC05NTEsMTAgKzk0MiwxNiBAQCBpbnQgb2ZfZG1hX2dldF9y
YW5nZShzdHJ1Y3QgZGV2aWNlX25vZGUgKm5wLCB1NjQgKmRtYV9hZGRyLCB1NjQgKnBhZGRyLCB1
NjQgKnNpegogCQkgKi8KIAkJaWYgKCFyYW5nZXMpCiAJCQlicmVhazsKKworCQl0bXAgPSBfX29m
X2dldF9kbWFfcGFyZW50KG5vZGUpOworCQlvZl9ub2RlX3B1dChub2RlKTsKKwkJbm9kZSA9IHRt
cDsKKwkJaWYgKCFub2RlKQorCQkJYnJlYWs7CiAJfQogCiAJaWYgKCFyYW5nZXMpIHsKLQkJcHJf
ZGVidWcoIm5vIGRtYS1yYW5nZXMgZm91bmQgZm9yIG5vZGUoJXBPRilcbiIsIG5wKTsKKwkJcHJf
ZGVidWcoIm5vIGRtYS1yYW5nZXMgZm91bmQgZm9yIG5vZGUoJXBPRilcbiIsIG5vZGUpOwogCQly
ZXQgPSAtRU5PREVWOwogCQlnb3RvIG91dDsKIAl9CkBAIC05NjcsMTAgKzk2NCwxMCBAQCBpbnQg
b2ZfZG1hX2dldF9yYW5nZShzdHJ1Y3QgZGV2aWNlX25vZGUgKm5wLCB1NjQgKmRtYV9hZGRyLCB1
NjQgKnBhZGRyLCB1NjQgKnNpegogCSAqIHNpemUJCTogbnNpemUgY2VsbHMKIAkgKi8KIAlkbWFh
ZGRyID0gb2ZfcmVhZF9udW1iZXIocmFuZ2VzLCBuYWRkcik7Ci0JKnBhZGRyID0gb2ZfdHJhbnNs
YXRlX2RtYV9hZGRyZXNzKG5wLCByYW5nZXMpOworCSpwYWRkciA9IG9mX3RyYW5zbGF0ZV9kbWFf
YWRkcmVzc19wYXJlbnQocGFyZW50LCByYW5nZXMpOwogCWlmICgqcGFkZHIgPT0gT0ZfQkFEX0FE
RFIpIHsKIAkJcHJfZXJyKCJ0cmFuc2xhdGlvbiBvZiBETUEgYWRkcmVzcyglcGFkKSB0byBDUFUg
YWRkcmVzcyBmYWlsZWQgbm9kZSglcE9GKVxuIiwKLQkJICAgICAgIGRtYV9hZGRyLCBucCk7CisJ
CSAgICAgICBkbWFfYWRkciwgcGFyZW50KTsKIAkJcmV0ID0gLUVJTlZBTDsKIAkJZ290byBvdXQ7
CiAJfQpkaWZmIC0tZ2l0IGEvZHJpdmVycy9vZi9kZXZpY2UuYyBiL2RyaXZlcnMvb2YvZGV2aWNl
LmMKaW5kZXggZGE4MTU4MzkyMDEwLi4yNjdiNTA5ZGY1MTcgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMv
b2YvZGV2aWNlLmMKKysrIGIvZHJpdmVycy9vZi9kZXZpY2UuYwpAQCAtOTUsNyArOTUsOCBAQCBp
bnQgb2ZfZG1hX2NvbmZpZ3VyZShzdHJ1Y3QgZGV2aWNlICpkZXYsIHN0cnVjdCBkZXZpY2Vfbm9k
ZSAqbnAsIGJvb2wgZm9yY2VfZG1hKQogCWNvbnN0IHN0cnVjdCBpb21tdV9vcHMgKmlvbW11Owog
CXU2NCBtYXNrOwogCi0JcmV0ID0gb2ZfZG1hX2dldF9yYW5nZShucCwgJmRtYV9hZGRyLCAmcGFk
ZHIsICZzaXplKTsKKwlyZXQgPSBvZl9kbWFfZ2V0X3JhbmdlKF9fb2ZfZ2V0X2RtYV9wYXJlbnQo
bnApLCAmZG1hX2FkZHIsCisJCQkgICAgICAgJnBhZGRyLCAmc2l6ZSk7CiAJaWYgKHJldCA8IDAp
IHsKIAkJLyoKIAkJICogRm9yIGxlZ2FjeSByZWFzb25zLCB3ZSBoYXZlIHRvIGFzc3VtZSBzb21l
IGRldmljZXMgbmVlZApkaWZmIC0tZ2l0IGEvaW5jbHVkZS9saW51eC9vZl9hZGRyZXNzLmggYi9p
bmNsdWRlL2xpbnV4L29mX2FkZHJlc3MuaAppbmRleCAzMGU0MGZiNjkzNmIuLmFhMWNlMGNiNTlh
MSAxMDA2NDQKLS0tIGEvaW5jbHVkZS9saW51eC9vZl9hZGRyZXNzLmgKKysrIGIvaW5jbHVkZS9s
aW51eC9vZl9hZGRyZXNzLmgKQEAgLTU1LDggKzU1LDggQEAgZXh0ZXJuIGludCBvZl9wY2lfZG1h
X3JhbmdlX3BhcnNlcl9pbml0KHN0cnVjdCBvZl9wY2lfcmFuZ2VfcGFyc2VyICpwYXJzZXIsCiBl
eHRlcm4gc3RydWN0IG9mX3BjaV9yYW5nZSAqb2ZfcGNpX3JhbmdlX3BhcnNlcl9vbmUoCiAJCQkJ
CXN0cnVjdCBvZl9wY2lfcmFuZ2VfcGFyc2VyICpwYXJzZXIsCiAJCQkJCXN0cnVjdCBvZl9wY2lf
cmFuZ2UgKnJhbmdlKTsKLWV4dGVybiBpbnQgb2ZfZG1hX2dldF9yYW5nZShzdHJ1Y3QgZGV2aWNl
X25vZGUgKm5wLCB1NjQgKmRtYV9hZGRyLAotCQkJCXU2NCAqcGFkZHIsIHU2NCAqc2l6ZSk7Citl
eHRlcm4gaW50IG9mX2RtYV9nZXRfcmFuZ2Uoc3RydWN0IGRldmljZV9ub2RlICpwYXJlbnQsIHU2
NCAqZG1hX2FkZHIsCisJCQkgICAgdTY0ICpwYWRkciwgdTY0ICpzaXplKTsKIGV4dGVybiBib29s
IG9mX2RtYV9pc19jb2hlcmVudChzdHJ1Y3QgZGV2aWNlX25vZGUgKm5wKTsKICNlbHNlIC8qIENP
TkZJR19PRl9BRERSRVNTICovCiBzdGF0aWMgaW5saW5lIHZvaWQgX19pb21lbSAqb2ZfaW9fcmVx
dWVzdF9hbmRfbWFwKHN0cnVjdCBkZXZpY2Vfbm9kZSAqZGV2aWNlLApAQCAtMTA0LDggKzEwNCw4
IEBAIHN0YXRpYyBpbmxpbmUgc3RydWN0IG9mX3BjaV9yYW5nZSAqb2ZfcGNpX3JhbmdlX3BhcnNl
cl9vbmUoCiAJcmV0dXJuIE5VTEw7CiB9CiAKLXN0YXRpYyBpbmxpbmUgaW50IG9mX2RtYV9nZXRf
cmFuZ2Uoc3RydWN0IGRldmljZV9ub2RlICpucCwgdTY0ICpkbWFfYWRkciwKLQkJCQl1NjQgKnBh
ZGRyLCB1NjQgKnNpemUpCitzdGF0aWMgaW5saW5lIGludCBvZl9kbWFfZ2V0X3JhbmdlKHN0cnVj
dCBkZXZpY2Vfbm9kZSAqcGFyZW50LCB1NjQgKmRtYV9hZGRyLAorCQkJCSAgIHU2NCAqcGFkZHIs
IHU2NCAqc2l6ZSkKIHsKIAlyZXR1cm4gLUVOT0RFVjsKIH0KLS0gCjIuMjMuMAoKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5n
IGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJv
amVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
