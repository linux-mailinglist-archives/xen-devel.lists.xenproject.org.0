Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 29865BD711
	for <lists+xen-devel@lfdr.de>; Wed, 25 Sep 2019 06:18:22 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iCyj2-0000RU-BJ; Wed, 25 Sep 2019 04:16:24 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Z4a6=XT=suse.de=nsaenzjulienne@srs-us1.protection.inumbo.net>)
 id 1iCpJ9-0000FG-DE
 for xen-devel@lists.xenproject.org; Tue, 24 Sep 2019 18:13:03 +0000
X-Inumbo-ID: ece94744-def6-11e9-b588-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by localhost (Halon) with ESMTPS
 id ece94744-def6-11e9-b588-bc764e2007e4;
 Tue, 24 Sep 2019 18:12:53 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id A1202AF03;
 Tue, 24 Sep 2019 18:12:52 +0000 (UTC)
From: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
To: robh+dt@kernel.org, devicetree@vger.kernel.org, frowand.list@gmail.com,
 linux-arm-kernel@lists.infradead.org, linux-wireless@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 dmaengine@vger.kernel.org, etnaviv@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, xen-devel@lists.xenproject.org,
 linux-tegra@vger.kernel.org, linux-media@vger.kernel.org,
 linux-pci@vger.kernel.org
Date: Tue, 24 Sep 2019 20:12:33 +0200
Message-Id: <20190924181244.7159-3-nsaenzjulienne@suse.de>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20190924181244.7159-1-nsaenzjulienne@suse.de>
References: <20190924181244.7159-1-nsaenzjulienne@suse.de>
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 25 Sep 2019 04:16:20 +0000
Subject: [Xen-devel] [PATCH 02/11] of: base: introduce
 __of_n_*_cells_parent()
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

TWFzdGVyIFBDSSBkZXZpY2VzIG1pZ2h0IG5vdCBhcHBlYXIgaW4gdGhlIGRldmljZSB0cmVlLCB5
ZXQgdGhleSBzdGlsbApuZWVkIHRvIGdldCB0aGUgdW5kZXJseWluZyBjZWxscyBwcm9wZXJ0aWVz
IGluIG9yZGVyIHRvIGNhbGN1bGF0ZSB0aGUKYnVzIERNQSBjb25zdHJhaW50cy4gVGhpcyBjb25m
bGljdHMgd2l0aCBvZl9uXypfY2VsbHMoKSBhcyBpdCdzIGRlc2lnbmVkCnVuZGVyIHRoZSBhc3N1
bXB0aW9uIGl0J2xsIHJlY2VpdmUgYSBkZXZpY2UgT0Ygbm9kZS4KCkNyZWF0ZSBfX29mX25fKl9j
ZWxsc19wYXJlbnQoKSBpbiBvcmRlciB0byBkZWFsIHdpdGggdGhpcyBsaW1pdGF0aW9uLgpGb3Ig
bm93LCBpdCdsbCBvbmx5IGJlIGF2YWlsYWJsZSBwcml2YXRlbHkgdG8gT0YgY29kZS4KClNpZ25l
ZC1vZmYtYnk6IE5pY29sYXMgU2FlbnogSnVsaWVubmUgPG5zYWVuemp1bGllbm5lQHN1c2UuZGU+
Ci0tLQoKIGRyaXZlcnMvb2YvYmFzZS5jICAgICAgIHwgNDQgKysrKysrKysrKysrKysrKysrKysr
KysrKysrKystLS0tLS0tLS0tLS0KIGRyaXZlcnMvb2Yvb2ZfcHJpdmF0ZS5oIHwgIDMgKysrCiAy
IGZpbGVzIGNoYW5nZWQsIDM0IGluc2VydGlvbnMoKyksIDEzIGRlbGV0aW9ucygtKQoKZGlmZiAt
LWdpdCBhL2RyaXZlcnMvb2YvYmFzZS5jIGIvZHJpdmVycy9vZi9iYXNlLmMKaW5kZXggMWQ2Njdl
YjczMGUxLi45NGY4MzA1MTkxMGMgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvb2YvYmFzZS5jCisrKyBi
L2RyaXZlcnMvb2YvYmFzZS5jCkBAIC04NiwzNCArODYsNTIgQEAgc3RhdGljIGJvb2wgX19vZl9u
b2RlX2lzX3R5cGUoY29uc3Qgc3RydWN0IGRldmljZV9ub2RlICpucCwgY29uc3QgY2hhciAqdHlw
ZSkKIAlyZXR1cm4gbnAgJiYgbWF0Y2ggJiYgdHlwZSAmJiAhc3RyY21wKG1hdGNoLCB0eXBlKTsK
IH0KIAotaW50IG9mX25fYWRkcl9jZWxscyhzdHJ1Y3QgZGV2aWNlX25vZGUgKm5wKQoraW50IF9f
b2Zfbl9hZGRyX2NlbGxzX3BhcmVudChzdHJ1Y3QgZGV2aWNlX25vZGUgKnBhcmVudCkKIHsKIAl1
MzIgY2VsbHM7CiAKLQlkbyB7Ci0JCWlmIChucC0+cGFyZW50KQotCQkJbnAgPSBucC0+cGFyZW50
OwotCQlpZiAoIW9mX3Byb3BlcnR5X3JlYWRfdTMyKG5wLCAiI2FkZHJlc3MtY2VsbHMiLCAmY2Vs
bHMpKQorCXdoaWxlIChwYXJlbnQpIHsKKwkJaWYgKCFvZl9wcm9wZXJ0eV9yZWFkX3UzMihwYXJl
bnQsICIjYWRkcmVzcy1jZWxscyIsICZjZWxscykpCiAJCQlyZXR1cm4gY2VsbHM7Ci0JfSB3aGls
ZSAobnAtPnBhcmVudCk7CisKKwkJcGFyZW50ID0gcGFyZW50LT5wYXJlbnQ7CisJfQorCiAJLyog
Tm8gI2FkZHJlc3MtY2VsbHMgcHJvcGVydHkgZm9yIHRoZSByb290IG5vZGUgKi8KIAlyZXR1cm4g
T0ZfUk9PVF9OT0RFX0FERFJfQ0VMTFNfREVGQVVMVDsKIH0KKworaW50IG9mX25fYWRkcl9jZWxs
cyhzdHJ1Y3QgZGV2aWNlX25vZGUgKm5wKQoreworCWlmIChucC0+cGFyZW50KQorCQlucCA9IG5w
LT5wYXJlbnQ7CisKKwlyZXR1cm4gX19vZl9uX2FkZHJfY2VsbHNfcGFyZW50KG5wKTsKK30KIEVY
UE9SVF9TWU1CT0wob2Zfbl9hZGRyX2NlbGxzKTsKIAotaW50IG9mX25fc2l6ZV9jZWxscyhzdHJ1
Y3QgZGV2aWNlX25vZGUgKm5wKQoraW50IF9fb2Zfbl9zaXplX2NlbGxzX3BhcmVudChzdHJ1Y3Qg
ZGV2aWNlX25vZGUgKnBhcmVudCkKIHsKIAl1MzIgY2VsbHM7CiAKLQlkbyB7Ci0JCWlmIChucC0+
cGFyZW50KQotCQkJbnAgPSBucC0+cGFyZW50OwotCQlpZiAoIW9mX3Byb3BlcnR5X3JlYWRfdTMy
KG5wLCAiI3NpemUtY2VsbHMiLCAmY2VsbHMpKQorCXdoaWxlIChwYXJlbnQpIHsKKwkJaWYgKCFv
Zl9wcm9wZXJ0eV9yZWFkX3UzMihwYXJlbnQsICIjc2l6ZS1jZWxscyIsICZjZWxscykpCiAJCQly
ZXR1cm4gY2VsbHM7Ci0JfSB3aGlsZSAobnAtPnBhcmVudCk7Ci0JLyogTm8gI3NpemUtY2VsbHMg
cHJvcGVydHkgZm9yIHRoZSByb290IG5vZGUgKi8KKworCQlwYXJlbnQgPSBwYXJlbnQtPnBhcmVu
dDsKKwl9CisKKwkvKiBObyAjYWRkcmVzcy1jZWxscyBwcm9wZXJ0eSBmb3IgdGhlIHJvb3Qgbm9k
ZSAqLwogCXJldHVybiBPRl9ST09UX05PREVfU0laRV9DRUxMU19ERUZBVUxUOwogfQorCitpbnQg
b2Zfbl9zaXplX2NlbGxzKHN0cnVjdCBkZXZpY2Vfbm9kZSAqbnApCit7CisJaWYgKG5wLT5wYXJl
bnQpCisJCW5wID0gbnAtPnBhcmVudDsKKworCXJldHVybiBfX29mX25fc2l6ZV9jZWxsc19wYXJl
bnQobnApOworfQogRVhQT1JUX1NZTUJPTChvZl9uX3NpemVfY2VsbHMpOwogCiAjaWZkZWYgQ09O
RklHX05VTUEKZGlmZiAtLWdpdCBhL2RyaXZlcnMvb2Yvb2ZfcHJpdmF0ZS5oIGIvZHJpdmVycy9v
Zi9vZl9wcml2YXRlLmgKaW5kZXggMjQ3ODY4MThlMzJlLi5iNTI4MzA0YmUyNDQgMTAwNjQ0Ci0t
LSBhL2RyaXZlcnMvb2Yvb2ZfcHJpdmF0ZS5oCisrKyBiL2RyaXZlcnMvb2Yvb2ZfcHJpdmF0ZS5o
CkBAIC0zOSw2ICszOSw5IEBAIGV4dGVybiBzdHJ1Y3QgbXV0ZXggb2ZfbXV0ZXg7CiBleHRlcm4g
c3RydWN0IGxpc3RfaGVhZCBhbGlhc2VzX2xvb2t1cDsKIGV4dGVybiBzdHJ1Y3Qga3NldCAqb2Zf
a3NldDsKIAoraW50IF9fb2Zfbl9hZGRyX2NlbGxzX3BhcmVudChzdHJ1Y3QgZGV2aWNlX25vZGUg
KnBhcmVudCk7CitpbnQgX19vZl9uX3NpemVfY2VsbHNfcGFyZW50KHN0cnVjdCBkZXZpY2Vfbm9k
ZSAqcGFyZW50KTsKKwogI2lmIGRlZmluZWQoQ09ORklHX09GX0RZTkFNSUMpCiBleHRlcm4gaW50
IG9mX3Byb3BlcnR5X25vdGlmeShpbnQgYWN0aW9uLCBzdHJ1Y3QgZGV2aWNlX25vZGUgKm5wLAog
CQkJICAgICAgc3RydWN0IHByb3BlcnR5ICpwcm9wLCBzdHJ1Y3QgcHJvcGVydHkgKm9sZF9wcm9w
KTsKLS0gCjIuMjMuMAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2
ZWw=
