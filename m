Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8892995E64
	for <lists+xen-devel@lfdr.de>; Tue, 20 Aug 2019 14:26:21 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i03AJ-0006SX-P3; Tue, 20 Aug 2019 12:23:07 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=aYQB=WQ=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1i03AI-0006SS-Ag
 for xen-devel@lists.xenproject.org; Tue, 20 Aug 2019 12:23:06 +0000
X-Inumbo-ID: 4230662e-c345-11e9-8bf7-12813bfff9fa
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 4230662e-c345-11e9-8bf7-12813bfff9fa;
 Tue, 20 Aug 2019 12:23:04 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D3ACC344;
 Tue, 20 Aug 2019 05:23:03 -0700 (PDT)
Received: from e108454-lin.cambridge.arm.com (e108454-lin.cambridge.arm.com
 [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1191D3F246;
 Tue, 20 Aug 2019 05:23:02 -0700 (PDT)
From: Julien Grall <julien.grall@arm.com>
To: xen-devel@lists.xenproject.org
Date: Tue, 20 Aug 2019 13:22:55 +0100
Message-Id: <20190820122255.9864-1-julien.grall@arm.com>
X-Mailer: git-send-email 2.11.0
Subject: [Xen-devel] [PATCH] xen/arm: iommu: Panic if not all IOMMUs are
 initialized
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
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Julien Grall <julien.grall@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

QXQgdGhlIG1vbWVudCwgdGhlIHBsYXRmb3JtIGNhbiBjb21lIHVwIHdpdGggb25seSBwYXJ0IG9m
IHRoZSBJT01NVXMKaW5pdGlhbGl6ZWQuIFRoaXMgY291bGQgbGVhZCB0byBhIGZhaWx1cmUgbGF0
ZXIgb24gd2hlbiBidWlsZGluZyB0aGUKaGFyZHdhcmUgZG9tYWluIG9yIGV2ZW4gdHJ5aW5nIHRv
IGFzc2lnbiBhIGRldmljZSB0byBhIGd1ZXN0LgoKVG8gYXZvaWQgdW53YW50ZWQgYmVoYXZpb3Is
IFhlbiB3aWxsIG5vdCBjb250aW51ZSBpZiBvbmUgb2YgdGhlIElPTU1VcwpoYXMgbm90IGJlZW4g
aW5pdGlhbGl6ZWQgY29ycmVjdGx5LgoKU2lnbmVkLW9mZi1ieTogSnVsaWVuIEdyYWxsIDxqdWxp
ZW4uZ3JhbGxAYXJtLmNvbT4KCi0tLQoKQ2M6IE9sZWtzYW5kciBUeXNoY2hlbmtvIDxvbGVrc2Fu
ZHJfdHlzaGNoZW5rb0BlcGFtLmNvbT4KCkJhc2ljYWxseSwgdGhpcyBpcyBzaW1pbGFyIHRvIGZv
cmNpbmcgdGhlIHVzZSBvZiBJT01NVSAoaS5lCmlvbW11PWZvcmNlKS4gTWF5YmUgd2Ugc2hvdWxk
IGRyb3AgdGhlIHBhbmljIGluIHNldHVwLmMgYW5kIGp1c3QKc2V0IGZvcmNlX2lvbW11LiBBbnkg
b3Bpbmlvbj8KLS0tCiB4ZW4vYXJjaC9hcm0vc2V0dXAuYyAgICAgICAgICAgICAgICB8IDUgKysr
Ky0KIHhlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL2FybS9pb21tdS5jIHwgOCArKysrKysrKwogMiBm
aWxlcyBjaGFuZ2VkLCAxMiBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0
IGEveGVuL2FyY2gvYXJtL3NldHVwLmMgYi94ZW4vYXJjaC9hcm0vc2V0dXAuYwppbmRleCA3NTA5
ZDc2ZGQ0Li5mOGE0MDY0ZDNlIDEwMDY0NAotLS0gYS94ZW4vYXJjaC9hcm0vc2V0dXAuYworKysg
Yi94ZW4vYXJjaC9hcm0vc2V0dXAuYwpAQCAtNzU1LDYgKzc1NSw3IEBAIHZvaWQgX19pbml0IHN0
YXJ0X3hlbih1bnNpZ25lZCBsb25nIGJvb3RfcGh5c19vZmZzZXQsCiAgICAgICAgIC5tYXhfZ3Jh
bnRfZnJhbWVzID0gZ250dGFiX2RvbTBfZnJhbWVzKCksCiAgICAgICAgIC5tYXhfbWFwdHJhY2tf
ZnJhbWVzID0gb3B0X21heF9tYXB0cmFja19mcmFtZXMsCiAgICAgfTsKKyAgICBpbnQgcmM7CiAK
ICAgICBkY2FjaGVfbGluZV9ieXRlcyA9IHJlYWRfZGNhY2hlX2xpbmVfYnl0ZXMoKTsKIApAQCAt
ODkyLDcgKzg5Myw5IEBAIHZvaWQgX19pbml0IHN0YXJ0X3hlbih1bnNpZ25lZCBsb25nIGJvb3Rf
cGh5c19vZmZzZXQsCiAKICAgICBzZXR1cF92aXJ0X3BhZ2luZygpOwogCi0gICAgaW9tbXVfc2V0
dXAoKTsKKyAgICByYyA9IGlvbW11X3NldHVwKCk7CisgICAgaWYgKCAhaW9tbXVfZW5hYmxlZCAm
JiByYyAhPSAtRU5PREVWICkKKyAgICAgICAgcGFuaWMoIkNvdWxkbid0IGNvbmZpZ3VyZSBjb3Jy
ZWN0bHkgYWxsIHRoZSBJT01NVXMuIik7CiAKICAgICBkb19pbml0Y2FsbHMoKTsKIApkaWZmIC0t
Z2l0IGEveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvYXJtL2lvbW11LmMgYi94ZW4vZHJpdmVycy9w
YXNzdGhyb3VnaC9hcm0vaW9tbXUuYwppbmRleCAyMTM1MjMzNzM2Li5mMjE5ZGU5YWMzIDEwMDY0
NAotLS0gYS94ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9hcm0vaW9tbXUuYworKysgYi94ZW4vZHJp
dmVycy9wYXNzdGhyb3VnaC9hcm0vaW9tbXUuYwpAQCAtNTEsNiArNTEsMTQgQEAgaW50IF9faW5p
dCBpb21tdV9oYXJkd2FyZV9zZXR1cCh2b2lkKQogICAgICAgICByYyA9IGRldmljZV9pbml0KG5w
LCBERVZJQ0VfSU9NTVUsIE5VTEwpOwogICAgICAgICBpZiAoICFyYyApCiAgICAgICAgICAgICBu
dW1faW9tbXVzKys7CisgICAgICAgIC8qCisgICAgICAgICAqIElnbm9yZSB0aGUgZm9sbG93aW5n
IGVycm9yIGNvZGVzOgorICAgICAgICAgKiAgIC0gRUJBREY6IEluZGljYXRlIHRoZSBjdXJyZW50
IG5vdCBpcyBub3QgYW4gSU9NTVUKKyAgICAgICAgICogICAtIEVOT0RFVjogVGhlIElPTU1VIGlz
IG5vdCBwcmVzZW50IG9yIGNhbm5vdCBiZSB1c2VkIGJ5CisgICAgICAgICAqICAgICBYZW4uCisg
ICAgICAgICAqLworICAgICAgICBlbHNlIGlmICggcmMgIT0gLUVCQURGICYmIHJjICE9IC1FTk9E
RVYgKQorICAgICAgICAgICAgcmV0dXJuIHJjOwogICAgIH0KIAogICAgIHJldHVybiAoIG51bV9p
b21tdXMgPiAwICkgPyAwIDogLUVOT0RFVjsKLS0gCjIuMTEuMAoKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVu
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcv
bWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
