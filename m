Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 237DEE79D1
	for <lists+xen-devel@lfdr.de>; Mon, 28 Oct 2019 21:15:32 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iPBLt-0001Tw-RU; Mon, 28 Oct 2019 20:10:57 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=nBLR=YV=ziepe.ca=jgg@srs-us1.protection.inumbo.net>)
 id 1iPBLr-0001Sl-OG
 for xen-devel@lists.xenproject.org; Mon, 28 Oct 2019 20:10:55 +0000
X-Inumbo-ID: 063abe2a-f9bf-11e9-8aca-bc764e2007e4
Received: from mail-qt1-x842.google.com (unknown [2607:f8b0:4864:20::842])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 063abe2a-f9bf-11e9-8aca-bc764e2007e4;
 Mon, 28 Oct 2019 20:10:45 +0000 (UTC)
Received: by mail-qt1-x842.google.com with SMTP id z17so9895172qts.9
 for <xen-devel@lists.xenproject.org>; Mon, 28 Oct 2019 13:10:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziepe.ca; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=l1vmkJOGIS2JMKSg4aauB9VEgyiPOw7K+GpcfRESIoI=;
 b=LU+bbOjd0cz1dQjUVAwpTjm6I0OdzLxMOxP5OoMyKCWRmK92PNmFNIQUKjbHoE0awh
 pvseSw0PInn+OF/81alAmqaBN3yHzoSoswny6AKzKgyRT2YkUzVM+paRmtol46aPrKhB
 QMMBDPPQTSaHLetLANbdYa3ssCHD20beSUMzU9gm9hiKbchM7fSukllx4483KCxtEhyN
 0Mm9M8XrqlM/44ykUJTpSDhYdIpysgD+jWTg7Bkp6a2q7tAw/WZ08cKn9lLaF//6ovXU
 MNbPAJvpBLVztUrMAbJtNDCSkUdk4JNS5LcIXoJukchmgRsl1Gm23FzQw1GvQQ1wT1Cn
 HISw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=l1vmkJOGIS2JMKSg4aauB9VEgyiPOw7K+GpcfRESIoI=;
 b=mZBHaahVFZ4qn9ytf62vMOKMgYhPuwswgamIKeTj1o63dtckdgBVoJj8tR8troutpX
 zEsgTHVHKLIFvGJ0EN33jfQ4E51+3YGQbm4H4aWNDGz9fJNA0llNuZuRZ57I+5axbCap
 dzcK/2IbsdLFLYCec2b2EO9qDxEf2zyIJS+en7yZDgpNGOCcLkviHU28I7nvodrjcOao
 apoFDGm1notsTv3PNTqkSVZ+wJJAmeTx6PBf6OcyiCU29rACap4TG8OBseBnojZIyNxJ
 OvoAyuLVPT2tRPBx42Pm4/3Gnzu92n/c22Pa55fNHjCpbaova+3E3/XjD1S0XGAUj8V3
 Fveg==
X-Gm-Message-State: APjAAAUifOeScqDqDk/7e8ZeKN9TgIFgvC/36AtVlNfcZ8s8d+/M55LU
 /IMz0VbyFfVNZJR+mTmG64Y5DQ==
X-Google-Smtp-Source: APXvYqxTDtu71nCg9F2jZDXMIik3Sf1CZYtmdCLMzyep9mn/F9AraC2jZajJbEZtCjPA2P8VltCn3g==
X-Received: by 2002:ad4:480e:: with SMTP id g14mr18897959qvy.39.1572293444691; 
 Mon, 28 Oct 2019 13:10:44 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-142-162-113-180.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [142.162.113.180])
 by smtp.gmail.com with ESMTPSA id m63sm6163383qkc.72.2019.10.28.13.10.43
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 28 Oct 2019 13:10:43 -0700 (PDT)
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)
 (envelope-from <jgg@ziepe.ca>)
 id 1iPBLf-0001g4-2o; Mon, 28 Oct 2019 17:10:43 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: linux-mm@kvack.org, Jerome Glisse <jglisse@redhat.com>,
 Ralph Campbell <rcampbell@nvidia.com>, John Hubbard <jhubbard@nvidia.com>,
 Felix.Kuehling@amd.com
Date: Mon, 28 Oct 2019 17:10:18 -0300
Message-Id: <20191028201032.6352-2-jgg@ziepe.ca>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191028201032.6352-1-jgg@ziepe.ca>
References: <20191028201032.6352-1-jgg@ziepe.ca>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v2 01/15] mm/mmu_notifier: define the header
 pre-processor parts even if disabled
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
Cc: Juergen Gross <jgross@suse.com>, David Zhou <David1.Zhou@amd.com>,
 Mike Marciniszyn <mike.marciniszyn@intel.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 linux-rdma@vger.kernel.org, nouveau@lists.freedesktop.org,
 Dennis Dalessandro <dennis.dalessandro@intel.com>,
 amd-gfx@lists.freedesktop.org, Christoph Hellwig <hch@infradead.org>,
 Jason Gunthorpe <jgg@mellanox.com>, dri-devel@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>, xen-devel@lists.xenproject.org,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, Petr Cvek <petrcvekcz@gmail.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Ben Skeggs <bskeggs@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RnJvbTogSmFzb24gR3VudGhvcnBlIDxqZ2dAbWVsbGFub3guY29tPgoKTm93IHRoYXQgd2UgaGF2
ZSBLRVJORUxfSEVBREVSX1RFU1QgYWxsIGhlYWRlcnMgYXJlIGdlbmVyYWxseSBjb21waWxlCnRl
c3RlZCwgc28gcmVseWluZyBvbiBtYWtlZmlsZSB0cmlja3MgdG8gYXZvaWQgY29tcGlsaW5nIGNv
ZGUgdGhhdCBkZXBlbmRzCm9uIENPTkZJR19NTVVfTk9USUZJRVIgaXMgbW9yZSBhbm5veWluZy4K
Ckluc3RlYWQgZm9sbG93IHRoZSB1c3VhbCBwYXR0ZXJuIGFuZCBwcm92aWRlIG1vc3Qgb2YgdGhl
IGhlYWRlciB3aXRoIG9ubHkKdGhlIGZ1bmN0aW9ucyBzdHViYmVkIG91dCB3aGVuIENPTkZJR19N
TVVfTk9USUZJRVIgaXMgZGlzYWJsZWQuIFRoaXMKZW5zdXJlcyBjb2RlIGNvbXBpbGVzIG5vIG1h
dHRlciB3aGF0IHRoZSBjb25maWcgc2V0dGluZyBpcy4KCldoaWxlIGhlcmUsIHN0cnVjdCBtbXVf
bm90aWZpZXJfbW0gaXMgcHJpdmF0ZSB0byBtbXVfbm90aWZpZXIuYywgbW92ZSBpdC4KClJldmll
d2VkLWJ5OiBKw6lyw7RtZSBHbGlzc2UgPGpnbGlzc2VAcmVkaGF0LmNvbT4KU2lnbmVkLW9mZi1i
eTogSmFzb24gR3VudGhvcnBlIDxqZ2dAbWVsbGFub3guY29tPgotLS0KIGluY2x1ZGUvbGludXgv
bW11X25vdGlmaWVyLmggfCA0NiArKysrKysrKysrKysrLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0K
IG1tL21tdV9ub3RpZmllci5jICAgICAgICAgICAgfCAxMyArKysrKysrKysrCiAyIGZpbGVzIGNo
YW5nZWQsIDMwIGluc2VydGlvbnMoKyksIDI5IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2lu
Y2x1ZGUvbGludXgvbW11X25vdGlmaWVyLmggYi9pbmNsdWRlL2xpbnV4L21tdV9ub3RpZmllci5o
CmluZGV4IDFiZDhlNmEwOWEzYzI3Li4xMmJkNjAzZDMxOGNlNyAxMDA2NDQKLS0tIGEvaW5jbHVk
ZS9saW51eC9tbXVfbm90aWZpZXIuaAorKysgYi9pbmNsdWRlL2xpbnV4L21tdV9ub3RpZmllci5o
CkBAIC03LDggKzcsOSBAQAogI2luY2x1ZGUgPGxpbnV4L21tX3R5cGVzLmg+CiAjaW5jbHVkZSA8
bGludXgvc3JjdS5oPgogCitzdHJ1Y3QgbW11X25vdGlmaWVyX21tOwogc3RydWN0IG1tdV9ub3Rp
ZmllcjsKLXN0cnVjdCBtbXVfbm90aWZpZXJfb3BzOworc3RydWN0IG1tdV9ub3RpZmllcl9yYW5n
ZTsKIAogLyoqCiAgKiBlbnVtIG1tdV9ub3RpZmllcl9ldmVudCAtIHJlYXNvbiBmb3IgdGhlIG1t
dSBub3RpZmllciBjYWxsYmFjawpAQCAtNDAsMzYgKzQxLDggQEAgZW51bSBtbXVfbm90aWZpZXJf
ZXZlbnQgewogCU1NVV9OT1RJRllfU09GVF9ESVJUWSwKIH07CiAKLSNpZmRlZiBDT05GSUdfTU1V
X05PVElGSUVSCi0KLSNpZmRlZiBDT05GSUdfTE9DS0RFUAotZXh0ZXJuIHN0cnVjdCBsb2NrZGVw
X21hcCBfX21tdV9ub3RpZmllcl9pbnZhbGlkYXRlX3JhbmdlX3N0YXJ0X21hcDsKLSNlbmRpZgot
Ci0vKgotICogVGhlIG1tdSBub3RpZmllcl9tbSBzdHJ1Y3R1cmUgaXMgYWxsb2NhdGVkIGFuZCBp
bnN0YWxsZWQgaW4KLSAqIG1tLT5tbXVfbm90aWZpZXJfbW0gaW5zaWRlIHRoZSBtbV90YWtlX2Fs
bF9sb2NrcygpIHByb3RlY3RlZAotICogY3JpdGljYWwgc2VjdGlvbiBhbmQgaXQncyByZWxlYXNl
ZCBvbmx5IHdoZW4gbW1fY291bnQgcmVhY2hlcyB6ZXJvCi0gKiBpbiBtbWRyb3AoKS4KLSAqLwot
c3RydWN0IG1tdV9ub3RpZmllcl9tbSB7Ci0JLyogYWxsIG1tdSBub3RpZmllcnMgcmVnaXN0ZXJk
IGluIHRoaXMgbW0gYXJlIHF1ZXVlZCBpbiB0aGlzIGxpc3QgKi8KLQlzdHJ1Y3QgaGxpc3RfaGVh
ZCBsaXN0OwotCS8qIHRvIHNlcmlhbGl6ZSB0aGUgbGlzdCBtb2RpZmljYXRpb25zIGFuZCBobGlz
dF91bmhhc2hlZCAqLwotCXNwaW5sb2NrX3QgbG9jazsKLX07Ci0KICNkZWZpbmUgTU1VX05PVElG
SUVSX1JBTkdFX0JMT0NLQUJMRSAoMSA8PCAwKQogCi1zdHJ1Y3QgbW11X25vdGlmaWVyX3Jhbmdl
IHsKLQlzdHJ1Y3Qgdm1fYXJlYV9zdHJ1Y3QgKnZtYTsKLQlzdHJ1Y3QgbW1fc3RydWN0ICptbTsK
LQl1bnNpZ25lZCBsb25nIHN0YXJ0OwotCXVuc2lnbmVkIGxvbmcgZW5kOwotCXVuc2lnbmVkIGZs
YWdzOwotCWVudW0gbW11X25vdGlmaWVyX2V2ZW50IGV2ZW50OwotfTsKLQogc3RydWN0IG1tdV9u
b3RpZmllcl9vcHMgewogCS8qCiAJICogQ2FsbGVkIGVpdGhlciBieSBtbXVfbm90aWZpZXJfdW5y
ZWdpc3RlciBvciB3aGVuIHRoZSBtbSBpcwpAQCAtMjQ5LDYgKzIyMiwyMSBAQCBzdHJ1Y3QgbW11
X25vdGlmaWVyIHsKIAl1bnNpZ25lZCBpbnQgdXNlcnM7CiB9OwogCisjaWZkZWYgQ09ORklHX01N
VV9OT1RJRklFUgorCisjaWZkZWYgQ09ORklHX0xPQ0tERVAKK2V4dGVybiBzdHJ1Y3QgbG9ja2Rl
cF9tYXAgX19tbXVfbm90aWZpZXJfaW52YWxpZGF0ZV9yYW5nZV9zdGFydF9tYXA7CisjZW5kaWYK
Kworc3RydWN0IG1tdV9ub3RpZmllcl9yYW5nZSB7CisJc3RydWN0IHZtX2FyZWFfc3RydWN0ICp2
bWE7CisJc3RydWN0IG1tX3N0cnVjdCAqbW07CisJdW5zaWduZWQgbG9uZyBzdGFydDsKKwl1bnNp
Z25lZCBsb25nIGVuZDsKKwl1bnNpZ25lZCBmbGFnczsKKwllbnVtIG1tdV9ub3RpZmllcl9ldmVu
dCBldmVudDsKK307CisKIHN0YXRpYyBpbmxpbmUgaW50IG1tX2hhc19ub3RpZmllcnMoc3RydWN0
IG1tX3N0cnVjdCAqbW0pCiB7CiAJcmV0dXJuIHVubGlrZWx5KG1tLT5tbXVfbm90aWZpZXJfbW0p
OwpkaWZmIC0tZ2l0IGEvbW0vbW11X25vdGlmaWVyLmMgYi9tbS9tbXVfbm90aWZpZXIuYwppbmRl
eCA3ZmRlODg2OTVmMzVkNi4uMzY3NjcwY2ZkMDJiN2IgMTAwNjQ0Ci0tLSBhL21tL21tdV9ub3Rp
Zmllci5jCisrKyBiL21tL21tdV9ub3RpZmllci5jCkBAIC0yNyw2ICsyNywxOSBAQCBzdHJ1Y3Qg
bG9ja2RlcF9tYXAgX19tbXVfbm90aWZpZXJfaW52YWxpZGF0ZV9yYW5nZV9zdGFydF9tYXAgPSB7
CiB9OwogI2VuZGlmCiAKKy8qCisgKiBUaGUgbW11IG5vdGlmaWVyX21tIHN0cnVjdHVyZSBpcyBh
bGxvY2F0ZWQgYW5kIGluc3RhbGxlZCBpbgorICogbW0tPm1tdV9ub3RpZmllcl9tbSBpbnNpZGUg
dGhlIG1tX3Rha2VfYWxsX2xvY2tzKCkgcHJvdGVjdGVkCisgKiBjcml0aWNhbCBzZWN0aW9uIGFu
ZCBpdCdzIHJlbGVhc2VkIG9ubHkgd2hlbiBtbV9jb3VudCByZWFjaGVzIHplcm8KKyAqIGluIG1t
ZHJvcCgpLgorICovCitzdHJ1Y3QgbW11X25vdGlmaWVyX21tIHsKKwkvKiBhbGwgbW11IG5vdGlm
aWVycyByZWdpc3RlcmVkIGluIHRoaXMgbW0gYXJlIHF1ZXVlZCBpbiB0aGlzIGxpc3QgKi8KKwlz
dHJ1Y3QgaGxpc3RfaGVhZCBsaXN0OworCS8qIHRvIHNlcmlhbGl6ZSB0aGUgbGlzdCBtb2RpZmlj
YXRpb25zIGFuZCBobGlzdF91bmhhc2hlZCAqLworCXNwaW5sb2NrX3QgbG9jazsKK307CisKIC8q
CiAgKiBUaGlzIGZ1bmN0aW9uIGNhbid0IHJ1biBjb25jdXJyZW50bHkgYWdhaW5zdCBtbXVfbm90
aWZpZXJfcmVnaXN0ZXIKICAqIGJlY2F1c2UgbW0tPm1tX3VzZXJzID4gMCBkdXJpbmcgbW11X25v
dGlmaWVyX3JlZ2lzdGVyIGFuZCBleGl0X21tYXAKLS0gCjIuMjMuMAoKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QK
WGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5v
cmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
