Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DE3CCF9A93
	for <lists+xen-devel@lfdr.de>; Tue, 12 Nov 2019 21:26:06 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iUcgc-0002yq-Tz; Tue, 12 Nov 2019 20:22:50 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=zGHR=ZE=ziepe.ca=jgg@srs-us1.protection.inumbo.net>)
 id 1iUcgb-0002yk-GK
 for xen-devel@lists.xenproject.org; Tue, 12 Nov 2019 20:22:49 +0000
X-Inumbo-ID: 31bed46a-058a-11ea-9631-bc764e2007e4
Received: from mail-qv1-xf43.google.com (unknown [2607:f8b0:4864:20::f43])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 31bed46a-058a-11ea-9631-bc764e2007e4;
 Tue, 12 Nov 2019 20:22:48 +0000 (UTC)
Received: by mail-qv1-xf43.google.com with SMTP id d3so5366762qvs.11
 for <xen-devel@lists.xenproject.org>; Tue, 12 Nov 2019 12:22:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziepe.ca; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=vnS3z876J83ixoyjmv49DG9xbHQOY1MbChbRcHTvym4=;
 b=Dzk0IYPNoeuja6Z87jLZ16h5TFzbWhhaL2hE6e59eRJAr2o3x1k/qz1haRHmaKm2Oo
 pJdjmv04a60AokPpqfbEs8fcyiISwOqa6zHSTlPcqeOyWCS8kySDbonYwBGZimXEsiCr
 m+99Yx7WlBmR7rBCtzYugbBaq8RGC03XIHbn2PpO3V8jyiqo5Hk0w/HBZzsp2aMrUtNM
 6LE16wMsLdbDUqIZRBITP0567Jo4IONU9HkH5/mvp6Sr+ybWOj9b1NnCn2oFxTupAE27
 smAd6xHPhgykqaEmfbT/1zs/1tv2/o4ldY0ZS0sj1TBlKGbqpB11Kml+kU8JiiV0ASzB
 Lu1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=vnS3z876J83ixoyjmv49DG9xbHQOY1MbChbRcHTvym4=;
 b=qy2svGRSyHQcfvWM9+hRNN4uMCFLxVcnzu3M1Bl2itBztrawsYDfweubGp0u/Zyli5
 FKFes2mPoXbVr5W39D41z9u/w7vEXc8mfmWFqZThW7O+8Ymg/U82ytyj8slZMm6BQf2f
 6C/Dy9YqDRJfLcKJxwQJ7L+NN8220iWWaI+gmowyqFRLhCI8zLU/Ts0NROAkLC03AxI2
 HhMeUrO9c0POfRYj7u6VCwBpH6IYSCbKxd6T2d2lz9JxCgEtcBaGJVthdmi9tXsy4NzR
 nyB+Xd0ipLi3Z29aLOnEnqXJXmCTLQ4zkqVu4nwOH2vNga5JvdDAcH7BK8iBNT7OMLRZ
 mM0Q==
X-Gm-Message-State: APjAAAVW7d/Y6Jqg6naNtTwU6400ufSdsLqxrgK4pZ9FgajnEtBFe005
 t+vi706fhWOc9m1HlNZkyr7D+w==
X-Google-Smtp-Source: APXvYqwt6TPTyhRT+Pf1utgCUQUY7yQF048IJVBt4Y/k4d6RD16npyce/49GYasfkdRZSZLp6DS/WQ==
X-Received: by 2002:a05:6214:14ac:: with SMTP id
 bo12mr30993106qvb.67.1573590168353; 
 Tue, 12 Nov 2019 12:22:48 -0800 (PST)
Received: from ziepe.ca
 (hlfxns017vw-142-162-113-180.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [142.162.113.180])
 by smtp.gmail.com with ESMTPSA id z17sm8848536qtq.69.2019.11.12.12.22.47
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 12 Nov 2019 12:22:48 -0800 (PST)
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)
 (envelope-from <jgg@ziepe.ca>)
 id 1iUcgZ-0003ja-5T; Tue, 12 Nov 2019 16:22:47 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: linux-mm@kvack.org, Jerome Glisse <jglisse@redhat.com>,
 Ralph Campbell <rcampbell@nvidia.com>, John Hubbard <jhubbard@nvidia.com>,
 Felix.Kuehling@amd.com
Date: Tue, 12 Nov 2019 16:22:18 -0400
Message-Id: <20191112202231.3856-2-jgg@ziepe.ca>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191112202231.3856-1-jgg@ziepe.ca>
References: <20191112202231.3856-1-jgg@ziepe.ca>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v3 01/14] mm/mmu_notifier: define the header
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
d2VkLWJ5OiBKw6lyw7RtZSBHbGlzc2UgPGpnbGlzc2VAcmVkaGF0LmNvbT4KVGVzdGVkLWJ5OiBS
YWxwaCBDYW1wYmVsbCA8cmNhbXBiZWxsQG52aWRpYS5jb20+ClJldmlld2VkLWJ5OiBKb2huIEh1
YmJhcmQgPGpodWJiYXJkQG52aWRpYS5jb20+ClNpZ25lZC1vZmYtYnk6IEphc29uIEd1bnRob3Jw
ZSA8amdnQG1lbGxhbm94LmNvbT4KLS0tCiBpbmNsdWRlL2xpbnV4L21tdV9ub3RpZmllci5oIHwg
NDYgKysrKysrKysrKysrKy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCiBtbS9tbXVfbm90aWZpZXIu
YyAgICAgICAgICAgIHwgMTMgKysrKysrKysrKwogMiBmaWxlcyBjaGFuZ2VkLCAzMCBpbnNlcnRp
b25zKCspLCAyOSBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9pbmNsdWRlL2xpbnV4L21tdV9u
b3RpZmllci5oIGIvaW5jbHVkZS9saW51eC9tbXVfbm90aWZpZXIuaAppbmRleCAxYmQ4ZTZhMDlh
M2MyNy4uMTJiZDYwM2QzMThjZTcgMTAwNjQ0Ci0tLSBhL2luY2x1ZGUvbGludXgvbW11X25vdGlm
aWVyLmgKKysrIGIvaW5jbHVkZS9saW51eC9tbXVfbm90aWZpZXIuaApAQCAtNyw4ICs3LDkgQEAK
ICNpbmNsdWRlIDxsaW51eC9tbV90eXBlcy5oPgogI2luY2x1ZGUgPGxpbnV4L3NyY3UuaD4KIAor
c3RydWN0IG1tdV9ub3RpZmllcl9tbTsKIHN0cnVjdCBtbXVfbm90aWZpZXI7Ci1zdHJ1Y3QgbW11
X25vdGlmaWVyX29wczsKK3N0cnVjdCBtbXVfbm90aWZpZXJfcmFuZ2U7CiAKIC8qKgogICogZW51
bSBtbXVfbm90aWZpZXJfZXZlbnQgLSByZWFzb24gZm9yIHRoZSBtbXUgbm90aWZpZXIgY2FsbGJh
Y2sKQEAgLTQwLDM2ICs0MSw4IEBAIGVudW0gbW11X25vdGlmaWVyX2V2ZW50IHsKIAlNTVVfTk9U
SUZZX1NPRlRfRElSVFksCiB9OwogCi0jaWZkZWYgQ09ORklHX01NVV9OT1RJRklFUgotCi0jaWZk
ZWYgQ09ORklHX0xPQ0tERVAKLWV4dGVybiBzdHJ1Y3QgbG9ja2RlcF9tYXAgX19tbXVfbm90aWZp
ZXJfaW52YWxpZGF0ZV9yYW5nZV9zdGFydF9tYXA7Ci0jZW5kaWYKLQotLyoKLSAqIFRoZSBtbXUg
bm90aWZpZXJfbW0gc3RydWN0dXJlIGlzIGFsbG9jYXRlZCBhbmQgaW5zdGFsbGVkIGluCi0gKiBt
bS0+bW11X25vdGlmaWVyX21tIGluc2lkZSB0aGUgbW1fdGFrZV9hbGxfbG9ja3MoKSBwcm90ZWN0
ZWQKLSAqIGNyaXRpY2FsIHNlY3Rpb24gYW5kIGl0J3MgcmVsZWFzZWQgb25seSB3aGVuIG1tX2Nv
dW50IHJlYWNoZXMgemVybwotICogaW4gbW1kcm9wKCkuCi0gKi8KLXN0cnVjdCBtbXVfbm90aWZp
ZXJfbW0gewotCS8qIGFsbCBtbXUgbm90aWZpZXJzIHJlZ2lzdGVyZCBpbiB0aGlzIG1tIGFyZSBx
dWV1ZWQgaW4gdGhpcyBsaXN0ICovCi0Jc3RydWN0IGhsaXN0X2hlYWQgbGlzdDsKLQkvKiB0byBz
ZXJpYWxpemUgdGhlIGxpc3QgbW9kaWZpY2F0aW9ucyBhbmQgaGxpc3RfdW5oYXNoZWQgKi8KLQlz
cGlubG9ja190IGxvY2s7Ci19OwotCiAjZGVmaW5lIE1NVV9OT1RJRklFUl9SQU5HRV9CTE9DS0FC
TEUgKDEgPDwgMCkKIAotc3RydWN0IG1tdV9ub3RpZmllcl9yYW5nZSB7Ci0Jc3RydWN0IHZtX2Fy
ZWFfc3RydWN0ICp2bWE7Ci0Jc3RydWN0IG1tX3N0cnVjdCAqbW07Ci0JdW5zaWduZWQgbG9uZyBz
dGFydDsKLQl1bnNpZ25lZCBsb25nIGVuZDsKLQl1bnNpZ25lZCBmbGFnczsKLQllbnVtIG1tdV9u
b3RpZmllcl9ldmVudCBldmVudDsKLX07Ci0KIHN0cnVjdCBtbXVfbm90aWZpZXJfb3BzIHsKIAkv
KgogCSAqIENhbGxlZCBlaXRoZXIgYnkgbW11X25vdGlmaWVyX3VucmVnaXN0ZXIgb3Igd2hlbiB0
aGUgbW0gaXMKQEAgLTI0OSw2ICsyMjIsMjEgQEAgc3RydWN0IG1tdV9ub3RpZmllciB7CiAJdW5z
aWduZWQgaW50IHVzZXJzOwogfTsKIAorI2lmZGVmIENPTkZJR19NTVVfTk9USUZJRVIKKworI2lm
ZGVmIENPTkZJR19MT0NLREVQCitleHRlcm4gc3RydWN0IGxvY2tkZXBfbWFwIF9fbW11X25vdGlm
aWVyX2ludmFsaWRhdGVfcmFuZ2Vfc3RhcnRfbWFwOworI2VuZGlmCisKK3N0cnVjdCBtbXVfbm90
aWZpZXJfcmFuZ2UgeworCXN0cnVjdCB2bV9hcmVhX3N0cnVjdCAqdm1hOworCXN0cnVjdCBtbV9z
dHJ1Y3QgKm1tOworCXVuc2lnbmVkIGxvbmcgc3RhcnQ7CisJdW5zaWduZWQgbG9uZyBlbmQ7CisJ
dW5zaWduZWQgZmxhZ3M7CisJZW51bSBtbXVfbm90aWZpZXJfZXZlbnQgZXZlbnQ7Cit9OworCiBz
dGF0aWMgaW5saW5lIGludCBtbV9oYXNfbm90aWZpZXJzKHN0cnVjdCBtbV9zdHJ1Y3QgKm1tKQog
ewogCXJldHVybiB1bmxpa2VseShtbS0+bW11X25vdGlmaWVyX21tKTsKZGlmZiAtLWdpdCBhL21t
L21tdV9ub3RpZmllci5jIGIvbW0vbW11X25vdGlmaWVyLmMKaW5kZXggN2ZkZTg4Njk1ZjM1ZDYu
LjM2NzY3MGNmZDAyYjdiIDEwMDY0NAotLS0gYS9tbS9tbXVfbm90aWZpZXIuYworKysgYi9tbS9t
bXVfbm90aWZpZXIuYwpAQCAtMjcsNiArMjcsMTkgQEAgc3RydWN0IGxvY2tkZXBfbWFwIF9fbW11
X25vdGlmaWVyX2ludmFsaWRhdGVfcmFuZ2Vfc3RhcnRfbWFwID0gewogfTsKICNlbmRpZgogCisv
KgorICogVGhlIG1tdSBub3RpZmllcl9tbSBzdHJ1Y3R1cmUgaXMgYWxsb2NhdGVkIGFuZCBpbnN0
YWxsZWQgaW4KKyAqIG1tLT5tbXVfbm90aWZpZXJfbW0gaW5zaWRlIHRoZSBtbV90YWtlX2FsbF9s
b2NrcygpIHByb3RlY3RlZAorICogY3JpdGljYWwgc2VjdGlvbiBhbmQgaXQncyByZWxlYXNlZCBv
bmx5IHdoZW4gbW1fY291bnQgcmVhY2hlcyB6ZXJvCisgKiBpbiBtbWRyb3AoKS4KKyAqLworc3Ry
dWN0IG1tdV9ub3RpZmllcl9tbSB7CisJLyogYWxsIG1tdSBub3RpZmllcnMgcmVnaXN0ZXJlZCBp
biB0aGlzIG1tIGFyZSBxdWV1ZWQgaW4gdGhpcyBsaXN0ICovCisJc3RydWN0IGhsaXN0X2hlYWQg
bGlzdDsKKwkvKiB0byBzZXJpYWxpemUgdGhlIGxpc3QgbW9kaWZpY2F0aW9ucyBhbmQgaGxpc3Rf
dW5oYXNoZWQgKi8KKwlzcGlubG9ja190IGxvY2s7Cit9OworCiAvKgogICogVGhpcyBmdW5jdGlv
biBjYW4ndCBydW4gY29uY3VycmVudGx5IGFnYWluc3QgbW11X25vdGlmaWVyX3JlZ2lzdGVyCiAg
KiBiZWNhdXNlIG1tLT5tbV91c2VycyA+IDAgZHVyaW5nIG1tdV9ub3RpZmllcl9yZWdpc3RlciBh
bmQgZXhpdF9tbWFwCi0tIAoyLjI0LjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVs
