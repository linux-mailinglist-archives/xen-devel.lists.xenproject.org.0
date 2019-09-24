Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A8AF7BD71D
	for <lists+xen-devel@lfdr.de>; Wed, 25 Sep 2019 06:19:38 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iCyj1-0000Qu-U5; Wed, 25 Sep 2019 04:16:23 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Z4a6=XT=suse.de=nsaenzjulienne@srs-us1.protection.inumbo.net>)
 id 1iCpJ9-0000FB-1Q
 for xen-devel@lists.xenproject.org; Tue, 24 Sep 2019 18:13:03 +0000
X-Inumbo-ID: ef6be1ac-def6-11e9-9625-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by localhost (Halon) with ESMTPS
 id ef6be1ac-def6-11e9-9625-12813bfff9fa;
 Tue, 24 Sep 2019 18:12:57 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id D66E4AE78;
 Tue, 24 Sep 2019 18:12:56 +0000 (UTC)
From: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
To: robh+dt@kernel.org, devicetree@vger.kernel.org, frowand.list@gmail.com,
 linux-arm-kernel@lists.infradead.org, linux-wireless@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 dmaengine@vger.kernel.org, etnaviv@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, xen-devel@lists.xenproject.org,
 linux-tegra@vger.kernel.org, linux-media@vger.kernel.org,
 linux-pci@vger.kernel.org
Date: Tue, 24 Sep 2019 20:12:36 +0200
Message-Id: <20190924181244.7159-6-nsaenzjulienne@suse.de>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20190924181244.7159-1-nsaenzjulienne@suse.de>
References: <20190924181244.7159-1-nsaenzjulienne@suse.de>
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 25 Sep 2019 04:16:20 +0000
Subject: [Xen-devel] [PATCH 05/11] of: expose __of_get_dma_parent() to OF
 subsystem
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

VGhlIGZ1bmN0aW9uIHdhcyBvbmx5IGF2YWlsYWJsZSBsb2NhbGx5IHRvIG9mL2FkZHJlc3MuYywg
bWFrZSBpdAphdmFpbGFibGUgdG8gdGhlIE9GIHN1YnN5c3RlbS4KClNpZ25lZC1vZmYtYnk6IE5p
Y29sYXMgU2FlbnogSnVsaWVubmUgPG5zYWVuemp1bGllbm5lQHN1c2UuZGU+Ci0tLQoKIGRyaXZl
cnMvb2YvYWRkcmVzcy5jICAgIHwgMTggLS0tLS0tLS0tLS0tLS0tLS0tCiBkcml2ZXJzL29mL2Jh
c2UuYyAgICAgICB8IDI1ICsrKysrKysrKysrKysrKysrKysrKysrKysKIGRyaXZlcnMvb2Yvb2Zf
cHJpdmF0ZS5oIHwgIDIgKysKIDMgZmlsZXMgY2hhbmdlZCwgMjcgaW5zZXJ0aW9ucygrKSwgMTgg
ZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9vZi9hZGRyZXNzLmMgYi9kcml2ZXJz
L29mL2FkZHJlc3MuYwppbmRleCBjOWViNGViY2MyZTkuLjUzNjY2MDYzZTkzOCAxMDA2NDQKLS0t
IGEvZHJpdmVycy9vZi9hZGRyZXNzLmMKKysrIGIvZHJpdmVycy9vZi9hZGRyZXNzLmMKQEAgLTY4
MSwyNCArNjgxLDYgQEAgdTY0IG9mX3RyYW5zbGF0ZV9hZGRyZXNzKHN0cnVjdCBkZXZpY2Vfbm9k
ZSAqZGV2LCBjb25zdCBfX2JlMzIgKmluX2FkZHIpCiB9CiBFWFBPUlRfU1lNQk9MKG9mX3RyYW5z
bGF0ZV9hZGRyZXNzKTsKIAotc3RhdGljIHN0cnVjdCBkZXZpY2Vfbm9kZSAqX19vZl9nZXRfZG1h
X3BhcmVudChjb25zdCBzdHJ1Y3QgZGV2aWNlX25vZGUgKm5wKQotewotCXN0cnVjdCBvZl9waGFu
ZGxlX2FyZ3MgYXJnczsKLQlpbnQgcmV0LCBpbmRleDsKLQotCWluZGV4ID0gb2ZfcHJvcGVydHlf
bWF0Y2hfc3RyaW5nKG5wLCAiaW50ZXJjb25uZWN0LW5hbWVzIiwgImRtYS1tZW0iKTsKLQlpZiAo
aW5kZXggPCAwKQotCQlyZXR1cm4gb2ZfZ2V0X3BhcmVudChucCk7Ci0KLQlyZXQgPSBvZl9wYXJz
ZV9waGFuZGxlX3dpdGhfYXJncyhucCwgImludGVyY29ubmVjdHMiLAotCQkJCQkgIiNpbnRlcmNv
bm5lY3QtY2VsbHMiLAotCQkJCQkgaW5kZXgsICZhcmdzKTsKLQlpZiAocmV0IDwgMCkKLQkJcmV0
dXJuIG9mX2dldF9wYXJlbnQobnApOwotCi0JcmV0dXJuIG9mX25vZGVfZ2V0KGFyZ3MubnApOwot
fQotCiBzdGF0aWMgdTY0IG9mX3RyYW5zbGF0ZV9kbWFfYWRkcmVzc19wYXJlbnQoc3RydWN0IGRl
dmljZV9ub2RlICpwYXJlbnQsCiAJCQkJCSAgIGNvbnN0IF9fYmUzMiAqaW5fYWRkcikKIHsKZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvb2YvYmFzZS5jIGIvZHJpdmVycy9vZi9iYXNlLmMKaW5kZXggOTRm
ODMwNTE5MTBjLi5lYzE2MWU2YjUyMjIgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvb2YvYmFzZS5jCisr
KyBiL2RyaXZlcnMvb2YvYmFzZS5jCkBAIC03MTYsNiArNzE2LDMxIEBAIHN0cnVjdCBkZXZpY2Vf
bm9kZSAqb2ZfZ2V0X3BhcmVudChjb25zdCBzdHJ1Y3QgZGV2aWNlX25vZGUgKm5vZGUpCiB9CiBF
WFBPUlRfU1lNQk9MKG9mX2dldF9wYXJlbnQpOwogCisvKioKKyAqCV9fb2ZfZ2V0X2RtYV9wYXJl
bnQgLSBHZXQgYSBub2RlJ3MgZG1hIHBhcmVudCBpZiBhbnkKKyAqCUBub2RlOglOb2RlIHRvIGdl
dCBkbWEgcGFyZW50CisgKgorICoJUmV0dXJucyBhIG5vZGUgcG9pbnRlciB3aXRoIHJlZmNvdW50
IGluY3JlbWVudGVkLCB1c2UKKyAqCW9mX25vZGVfcHV0KCkgb24gaXQgd2hlbiBkb25lLgorICov
CitzdHJ1Y3QgZGV2aWNlX25vZGUgKl9fb2ZfZ2V0X2RtYV9wYXJlbnQoY29uc3Qgc3RydWN0IGRl
dmljZV9ub2RlICpucCkKK3sKKwlzdHJ1Y3Qgb2ZfcGhhbmRsZV9hcmdzIGFyZ3M7CisJaW50IHJl
dCwgaW5kZXg7CisKKwlpbmRleCA9IG9mX3Byb3BlcnR5X21hdGNoX3N0cmluZyhucCwgImludGVy
Y29ubmVjdC1uYW1lcyIsICJkbWEtbWVtIik7CisJaWYgKGluZGV4IDwgMCkKKwkJcmV0dXJuIG9m
X2dldF9wYXJlbnQobnApOworCisJcmV0ID0gb2ZfcGFyc2VfcGhhbmRsZV93aXRoX2FyZ3MobnAs
ICJpbnRlcmNvbm5lY3RzIiwKKwkJCQkJICIjaW50ZXJjb25uZWN0LWNlbGxzIiwKKwkJCQkJIGlu
ZGV4LCAmYXJncyk7CisJaWYgKHJldCA8IDApCisJCXJldHVybiBvZl9nZXRfcGFyZW50KG5wKTsK
KworCXJldHVybiBvZl9ub2RlX2dldChhcmdzLm5wKTsKK30KKwogLyoqCiAgKglvZl9nZXRfbmV4
dF9wYXJlbnQgLSBJdGVyYXRlIHRvIGEgbm9kZSdzIHBhcmVudAogICoJQG5vZGU6CU5vZGUgdG8g
Z2V0IHBhcmVudCBvZgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9vZi9vZl9wcml2YXRlLmggYi9kcml2
ZXJzL29mL29mX3ByaXZhdGUuaAppbmRleCBiNTI4MzA0YmUyNDQuLjYzYmIxNmNjNDU0YyAxMDA2
NDQKLS0tIGEvZHJpdmVycy9vZi9vZl9wcml2YXRlLmgKKysrIGIvZHJpdmVycy9vZi9vZl9wcml2
YXRlLmgKQEAgLTQyLDYgKzQyLDggQEAgZXh0ZXJuIHN0cnVjdCBrc2V0ICpvZl9rc2V0OwogaW50
IF9fb2Zfbl9hZGRyX2NlbGxzX3BhcmVudChzdHJ1Y3QgZGV2aWNlX25vZGUgKnBhcmVudCk7CiBp
bnQgX19vZl9uX3NpemVfY2VsbHNfcGFyZW50KHN0cnVjdCBkZXZpY2Vfbm9kZSAqcGFyZW50KTsK
IAorc3RydWN0IGRldmljZV9ub2RlICpfX29mX2dldF9kbWFfcGFyZW50KGNvbnN0IHN0cnVjdCBk
ZXZpY2Vfbm9kZSAqbnApOworCiAjaWYgZGVmaW5lZChDT05GSUdfT0ZfRFlOQU1JQykKIGV4dGVy
biBpbnQgb2ZfcHJvcGVydHlfbm90aWZ5KGludCBhY3Rpb24sIHN0cnVjdCBkZXZpY2Vfbm9kZSAq
bnAsCiAJCQkgICAgICBzdHJ1Y3QgcHJvcGVydHkgKnByb3AsIHN0cnVjdCBwcm9wZXJ0eSAqb2xk
X3Byb3ApOwotLSAKMi4yMy4wCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hl
bi1kZXZlbA==
