Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 76B4780DF2
	for <lists+xen-devel@lfdr.de>; Mon,  5 Aug 2019 00:52:31 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1huPJd-0003SA-62; Sun, 04 Aug 2019 22:49:25 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=wrCA=WA=gmail.com=john.hubbard@srs-us1.protection.inumbo.net>)
 id 1huPJb-0003S0-Uq
 for xen-devel@lists.xenproject.org; Sun, 04 Aug 2019 22:49:23 +0000
X-Inumbo-ID: 19d3c1fb-b70a-11e9-8980-bc764e045a96
Received: from mail-pl1-x642.google.com (unknown [2607:f8b0:4864:20::642])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 19d3c1fb-b70a-11e9-8980-bc764e045a96;
 Sun, 04 Aug 2019 22:49:22 +0000 (UTC)
Received: by mail-pl1-x642.google.com with SMTP id k8so35701704plt.3
 for <xen-devel@lists.xenproject.org>; Sun, 04 Aug 2019 15:49:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=qSYlns3rxzw4u/DyjG2ivKH4pSlvpz3tTvNpv+Vzl0A=;
 b=jybTYrVi3/xq5/4/5FbFZ3A+Avi8eGYC8zV2Lajlkkya81v1pvJ+j//mJRmP4os7lD
 Pd8/w1skHq1YhYCv/cTm/07sKK/5LLwMY8yKb56jpoRl4sOTEaO+YO4fS+uW5ibDjRY4
 SK47Sk33sgjSTM7WW3t5om3RQhbUAfKBukSB3Qa58elVFhWeS7gpKY2dEl5CUEmL0GkT
 cJU+T8cGekNAadyTXtrRFo2GhHLpIpM1jLMDjk030E5OQOxXyXaMHIl1GlqZCTT1a7gE
 aQRQ8be9PYnGm7aS2SHXD5MvGcDLHk+brY9g31PQLix1KL7YxVkXuE8j/pWB0S9GgrCJ
 uOkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=qSYlns3rxzw4u/DyjG2ivKH4pSlvpz3tTvNpv+Vzl0A=;
 b=U89GVc9RDkLTjvR1DPl4UH07beO1jyCwaIFdNcFZzep75kT7myeud3USFsk1UBYo3a
 xcW2cuBlyvwlYHhToB90QGMIRIsXN+UYF2uqc3jStBfSf1GNK8gaDWl3web81dw7CjBX
 mEpphHpGNObSPP8GmSuVKd7JiQN8+AdTL7w6Y0tmIYaIFvaHdurhur2FIGWkmBKMlCP4
 OMy6b7Jw4ONPKdp/0bum52sPOvY8TUtWhAf1RgXR8eP5+2Yr0XyaS/0ZcL8CYjMjNhU5
 u4KSlyUY/LK7gwJ3ijNS33vPtspiWaf+93jymTNBqeeJ2eS6TgjapNhrwbETbrMAZhvD
 RFaw==
X-Gm-Message-State: APjAAAXDvXXybeTpmq4RJiBull4Daif02Hw+w4EJ1aU2jFgoSfEOOtIX
 C2/xspfjfOUrGom74lpc/9E=
X-Google-Smtp-Source: APXvYqzWB5R7n8mlQi4NRUdHeMD3L3s1VHDWKbtchA3/EyzJr1LK3u0mwvhN/yz/RE2XpFwfmsejNQ==
X-Received: by 2002:a17:902:b48c:: with SMTP id
 y12mr106521467plr.202.1564958962017; 
 Sun, 04 Aug 2019 15:49:22 -0700 (PDT)
Received: from blueforge.nvidia.com (searspoint.nvidia.com. [216.228.112.21])
 by smtp.gmail.com with ESMTPSA id
 r6sm35946836pjb.22.2019.08.04.15.49.20
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Sun, 04 Aug 2019 15:49:21 -0700 (PDT)
From: john.hubbard@gmail.com
X-Google-Original-From: jhubbard@nvidia.com
To: Andrew Morton <akpm@linux-foundation.org>
Date: Sun,  4 Aug 2019 15:48:43 -0700
Message-Id: <20190804224915.28669-3-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190804224915.28669-1-jhubbard@nvidia.com>
References: <20190804224915.28669-1-jhubbard@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
Subject: [Xen-devel] [PATCH v2 02/34] net/rds: convert put_page() to
 put_user_page*()
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
Cc: linux-fbdev@vger.kernel.org, Jan Kara <jack@suse.cz>, kvm@vger.kernel.org,
 Dave Hansen <dave.hansen@linux.intel.com>, Dave Chinner <david@fromorbit.com>,
 dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
 sparclinux@vger.kernel.org, Ira Weiny <ira.weiny@intel.com>,
 ceph-devel@vger.kernel.org, devel@driverdev.osuosl.org,
 rds-devel@oss.oracle.com, linux-rdma@vger.kernel.org, x86@kernel.org,
 amd-gfx@lists.freedesktop.org, Christoph Hellwig <hch@infradead.org>,
 Jason Gunthorpe <jgg@ziepe.ca>, xen-devel@lists.xenproject.org,
 devel@lists.orangefs.org, linux-media@vger.kernel.org,
 John Hubbard <jhubbard@nvidia.com>, intel-gfx@lists.freedesktop.org,
 Santosh Shilimkar <santosh.shilimkar@oracle.com>, linux-block@vger.kernel.org,
 =?UTF-8?q?J=C3=A9r=C3=B4me=20Glisse?= <jglisse@redhat.com>,
 linux-rpi-kernel@lists.infradead.org, Dan Williams <dan.j.williams@intel.com>,
 linux-arm-kernel@lists.infradead.org, linux-nfs@vger.kernel.org,
 netdev@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
 linux-xfs@vger.kernel.org, linux-crypto@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, "David S . Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RnJvbTogSm9obiBIdWJiYXJkIDxqaHViYmFyZEBudmlkaWEuY29tPgoKRm9yIHBhZ2VzIHRoYXQg
d2VyZSByZXRhaW5lZCB2aWEgZ2V0X3VzZXJfcGFnZXMqKCksIHJlbGVhc2UgdGhvc2UgcGFnZXMK
dmlhIHRoZSBuZXcgcHV0X3VzZXJfcGFnZSooKSByb3V0aW5lcywgaW5zdGVhZCBvZiB2aWEgcHV0
X3BhZ2UoKSBvcgpyZWxlYXNlX3BhZ2VzKCkuCgpUaGlzIGlzIHBhcnQgYSB0cmVlLXdpZGUgY29u
dmVyc2lvbiwgYXMgZGVzY3JpYmVkIGluIGNvbW1pdCBmYzFkOGU3Y2NhMmQKKCJtbTogaW50cm9k
dWNlIHB1dF91c2VyX3BhZ2UqKCksIHBsYWNlaG9sZGVyIHZlcnNpb25zIikuCgpDYzogU2FudG9z
aCBTaGlsaW1rYXIgPHNhbnRvc2guc2hpbGlta2FyQG9yYWNsZS5jb20+CkNjOiBEYXZpZCBTLiBN
aWxsZXIgPGRhdmVtQGRhdmVtbG9mdC5uZXQ+CkNjOiBuZXRkZXZAdmdlci5rZXJuZWwub3JnCkNj
OiBsaW51eC1yZG1hQHZnZXIua2VybmVsLm9yZwpDYzogcmRzLWRldmVsQG9zcy5vcmFjbGUuY29t
ClNpZ25lZC1vZmYtYnk6IEpvaG4gSHViYmFyZCA8amh1YmJhcmRAbnZpZGlhLmNvbT4KLS0tCiBu
ZXQvcmRzL2luZm8uYyAgICB8ICA1ICsrLS0tCiBuZXQvcmRzL21lc3NhZ2UuYyB8ICAyICstCiBu
ZXQvcmRzL3JkbWEuYyAgICB8IDE1ICsrKysrKystLS0tLS0tLQogMyBmaWxlcyBjaGFuZ2VkLCAx
MCBpbnNlcnRpb25zKCspLCAxMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9uZXQvcmRzL2lu
Zm8uYyBiL25ldC9yZHMvaW5mby5jCmluZGV4IDAzZjZmZDU2ZDIzNy4uY2E2YWYyODg5YWRmIDEw
MDY0NAotLS0gYS9uZXQvcmRzL2luZm8uYworKysgYi9uZXQvcmRzL2luZm8uYwpAQCAtMTYyLDcg
KzE2Miw2IEBAIGludCByZHNfaW5mb19nZXRzb2Nrb3B0KHN0cnVjdCBzb2NrZXQgKnNvY2ssIGlu
dCBvcHRuYW1lLCBjaGFyIF9fdXNlciAqb3B0dmFsLAogCXN0cnVjdCByZHNfaW5mb19sZW5ndGhz
IGxlbnM7CiAJdW5zaWduZWQgbG9uZyBucl9wYWdlcyA9IDA7CiAJdW5zaWduZWQgbG9uZyBzdGFy
dDsKLQl1bnNpZ25lZCBsb25nIGk7CiAJcmRzX2luZm9fZnVuYyBmdW5jOwogCXN0cnVjdCBwYWdl
ICoqcGFnZXMgPSBOVUxMOwogCWludCByZXQ7CkBAIC0yMzUsOCArMjM0LDggQEAgaW50IHJkc19p
bmZvX2dldHNvY2tvcHQoc3RydWN0IHNvY2tldCAqc29jaywgaW50IG9wdG5hbWUsIGNoYXIgX191
c2VyICpvcHR2YWwsCiAJCXJldCA9IC1FRkFVTFQ7CiAKIG91dDoKLQlmb3IgKGkgPSAwOyBwYWdl
cyAmJiBpIDwgbnJfcGFnZXM7IGkrKykKLQkJcHV0X3BhZ2UocGFnZXNbaV0pOworCWlmIChwYWdl
cykKKwkJcHV0X3VzZXJfcGFnZXMocGFnZXMsIG5yX3BhZ2VzKTsKIAlrZnJlZShwYWdlcyk7CiAK
IAlyZXR1cm4gcmV0OwpkaWZmIC0tZ2l0IGEvbmV0L3Jkcy9tZXNzYWdlLmMgYi9uZXQvcmRzL21l
c3NhZ2UuYwppbmRleCA1MGYxM2YxZDRhZTAuLmQ3YjBkMjY2YzQzNyAxMDA2NDQKLS0tIGEvbmV0
L3Jkcy9tZXNzYWdlLmMKKysrIGIvbmV0L3Jkcy9tZXNzYWdlLmMKQEAgLTQwNCw3ICs0MDQsNyBA
QCBzdGF0aWMgaW50IHJkc19tZXNzYWdlX3pjb3B5X2Zyb21fdXNlcihzdHJ1Y3QgcmRzX21lc3Nh
Z2UgKnJtLCBzdHJ1Y3QgaW92X2l0ZXIgKgogCQkJaW50IGk7CiAKIAkJCWZvciAoaSA9IDA7IGkg
PCBybS0+ZGF0YS5vcF9uZW50czsgaSsrKQotCQkJCXB1dF9wYWdlKHNnX3BhZ2UoJnJtLT5kYXRh
Lm9wX3NnW2ldKSk7CisJCQkJcHV0X3VzZXJfcGFnZShzZ19wYWdlKCZybS0+ZGF0YS5vcF9zZ1tp
XSkpOwogCQkJbW1wID0gJnJtLT5kYXRhLm9wX21tcF96bm90aWZpZXItPnpfbW1wOwogCQkJbW1f
dW5hY2NvdW50X3Bpbm5lZF9wYWdlcyhtbXApOwogCQkJcmV0ID0gLUVGQVVMVDsKZGlmZiAtLWdp
dCBhL25ldC9yZHMvcmRtYS5jIGIvbmV0L3Jkcy9yZG1hLmMKaW5kZXggOTE2ZjVlYzM3M2Q4Li42
NzYyZTg2OTZiOTkgMTAwNjQ0Ci0tLSBhL25ldC9yZHMvcmRtYS5jCisrKyBiL25ldC9yZHMvcmRt
YS5jCkBAIC0xNjIsOCArMTYyLDcgQEAgc3RhdGljIGludCByZHNfcGluX3BhZ2VzKHVuc2lnbmVk
IGxvbmcgdXNlcl9hZGRyLCB1bnNpZ25lZCBpbnQgbnJfcGFnZXMsCiAJCQkJICBwYWdlcyk7CiAK
IAlpZiAocmV0ID49IDAgJiYgcmV0IDwgbnJfcGFnZXMpIHsKLQkJd2hpbGUgKHJldC0tKQotCQkJ
cHV0X3BhZ2UocGFnZXNbcmV0XSk7CisJCXB1dF91c2VyX3BhZ2VzKHBhZ2VzLCByZXQpOwogCQly
ZXQgPSAtRUZBVUxUOwogCX0KIApAQCAtMjc2LDcgKzI3NSw3IEBAIHN0YXRpYyBpbnQgX19yZHNf
cmRtYV9tYXAoc3RydWN0IHJkc19zb2NrICpycywgc3RydWN0IHJkc19nZXRfbXJfYXJncyAqYXJn
cywKIAogCWlmIChJU19FUlIodHJhbnNfcHJpdmF0ZSkpIHsKIAkJZm9yIChpID0gMCA7IGkgPCBu
ZW50czsgaSsrKQotCQkJcHV0X3BhZ2Uoc2dfcGFnZSgmc2dbaV0pKTsKKwkJCXB1dF91c2VyX3Bh
Z2Uoc2dfcGFnZSgmc2dbaV0pKTsKIAkJa2ZyZWUoc2cpOwogCQlyZXQgPSBQVFJfRVJSKHRyYW5z
X3ByaXZhdGUpOwogCQlnb3RvIG91dDsKQEAgLTQ2NCw5ICs0NjMsMTAgQEAgdm9pZCByZHNfcmRt
YV9mcmVlX29wKHN0cnVjdCBybV9yZG1hX29wICpybykKIAkJICogdG8gbG9jYWwgbWVtb3J5ICov
CiAJCWlmICghcm8tPm9wX3dyaXRlKSB7CiAJCQlXQVJOX09OKCFwYWdlLT5tYXBwaW5nICYmIGly
cXNfZGlzYWJsZWQoKSk7Ci0JCQlzZXRfcGFnZV9kaXJ0eShwYWdlKTsKKwkJCXB1dF91c2VyX3Bh
Z2VzX2RpcnR5X2xvY2soJnBhZ2UsIDEsIHRydWUpOworCQl9IGVsc2UgeworCQkJcHV0X3VzZXJf
cGFnZShwYWdlKTsKIAkJfQotCQlwdXRfcGFnZShwYWdlKTsKIAl9CiAKIAlrZnJlZShyby0+b3Bf
bm90aWZpZXIpOwpAQCAtNDgxLDggKzQ4MSw3IEBAIHZvaWQgcmRzX2F0b21pY19mcmVlX29wKHN0
cnVjdCBybV9hdG9taWNfb3AgKmFvKQogCS8qIE1hcmsgcGFnZSBkaXJ0eSBpZiBpdCB3YXMgcG9z
c2libHkgbW9kaWZpZWQsIHdoaWNoCiAJICogaXMgdGhlIGNhc2UgZm9yIGEgUkRNQV9SRUFEIHdo
aWNoIGNvcGllcyBmcm9tIHJlbW90ZQogCSAqIHRvIGxvY2FsIG1lbW9yeSAqLwotCXNldF9wYWdl
X2RpcnR5KHBhZ2UpOwotCXB1dF9wYWdlKHBhZ2UpOworCXB1dF91c2VyX3BhZ2VzX2RpcnR5X2xv
Y2soJnBhZ2UsIDEsIHRydWUpOwogCiAJa2ZyZWUoYW8tPm9wX25vdGlmaWVyKTsKIAlhby0+b3Bf
bm90aWZpZXIgPSBOVUxMOwpAQCAtODY3LDcgKzg2Niw3IEBAIGludCByZHNfY21zZ19hdG9taWMo
c3RydWN0IHJkc19zb2NrICpycywgc3RydWN0IHJkc19tZXNzYWdlICpybSwKIAlyZXR1cm4gcmV0
OwogZXJyOgogCWlmIChwYWdlKQotCQlwdXRfcGFnZShwYWdlKTsKKwkJcHV0X3VzZXJfcGFnZShw
YWdlKTsKIAlybS0+YXRvbWljLm9wX2FjdGl2ZSA9IDA7CiAJa2ZyZWUocm0tPmF0b21pYy5vcF9u
b3RpZmllcik7CiAKLS0gCjIuMjIuMAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5m
by94ZW4tZGV2ZWw=
