Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AB2D0E79D5
	for <lists+xen-devel@lfdr.de>; Mon, 28 Oct 2019 21:15:41 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iPBMc-0001tS-H6; Mon, 28 Oct 2019 20:11:42 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=nBLR=YV=ziepe.ca=jgg@srs-us1.protection.inumbo.net>)
 id 1iPBMa-0001sc-Oo
 for xen-devel@lists.xenproject.org; Mon, 28 Oct 2019 20:11:40 +0000
X-Inumbo-ID: 0971d524-f9bf-11e9-bbab-bc764e2007e4
Received: from mail-qk1-x743.google.com (unknown [2607:f8b0:4864:20::743])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0971d524-f9bf-11e9-bbab-bc764e2007e4;
 Mon, 28 Oct 2019 20:10:50 +0000 (UTC)
Received: by mail-qk1-x743.google.com with SMTP id g21so9746886qkm.11
 for <xen-devel@lists.xenproject.org>; Mon, 28 Oct 2019 13:10:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziepe.ca; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=kWAFXaairmju5dUouyI0fIFpVoVh+rRI3GJkG/c3jbo=;
 b=ZMZ20vhDqRatgd/VeNs+gakMuIFZXaMsb6XQWoUK9HXLD+PHirdDumPc851+WT2Hyf
 C1Iv1wiPN6IlkT/5OzHp2qTA3MHXJcFx6P54sX18cmGOfENyUr/3lvF7WB/e9idjitHy
 lGg8W7hcfUwYhCtTo+P5QwNkSGSXWLHrmB7UiWpkznO/5PpvIjO4rkGK5oPJe284j39Z
 0SrDdsATeTt0aysE+Vjhm+ODlfdb0SYunqwjoByjas1/pFQCfKFMrcffBKQilclNwoJN
 Kw57TFwiQGNXYLPWr/vN3hajssQSFf3odyyUW2L2YFJ1wLFryfEwL6Mj/wjl8DvBS7u6
 6HmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=kWAFXaairmju5dUouyI0fIFpVoVh+rRI3GJkG/c3jbo=;
 b=B2HNisO76pcvbS4AVTda9X1EdWeCeRJ0ImTDhY8AEHVtLzH4daNNjgOiGOa7L90Mt0
 63/RTPOWciN0PKul9BxEfccQD2XMMtnnbYqutEe1IZKAHjEy3gZNuiTMx1eM//IsM6Hv
 QqFoIurRekDjbeeKz4Joa9CWCjyWNtx9Jw7eIgLu2v7DK6mnnJoAPaEPHvbL66/q4QhD
 ab6/e6ticKtDcRSUNLOfuAqw3GcJb5ikLgOts3UGnw3AHJpDCTFBdSKtzZAuyvF1P/Rc
 1XH1hlxhKTJBbpxqD7p543mjFmxhTj0tUyee5z9yQch+eW02lOqO9qLN3Qufdhdlxr+u
 /cow==
X-Gm-Message-State: APjAAAWeZwjJGWVlc7HwnXqaEu58KnQ3bb1LjuSaqvhnvze7J6ZjWjDv
 PE/X7NH7JI94++iqhTv54gw6eA==
X-Google-Smtp-Source: APXvYqyexUtgyT46O4Xj8Sx5B6Zyp9sP915KnVYaCPjwqJLiYtfebmqJR+ZAbE7J5Hww5Pxy2DBZEA==
X-Received: by 2002:a05:620a:13f0:: with SMTP id
 h16mr17732993qkl.310.1572293449993; 
 Mon, 28 Oct 2019 13:10:49 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-142-162-113-180.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [142.162.113.180])
 by smtp.gmail.com with ESMTPSA id o1sm7821379qtb.82.2019.10.28.13.10.44
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 28 Oct 2019 13:10:48 -0700 (PDT)
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)
 (envelope-from <jgg@ziepe.ca>)
 id 1iPBLf-0001hL-Mi; Mon, 28 Oct 2019 17:10:43 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: linux-mm@kvack.org, Jerome Glisse <jglisse@redhat.com>,
 Ralph Campbell <rcampbell@nvidia.com>, John Hubbard <jhubbard@nvidia.com>,
 Felix.Kuehling@amd.com
Date: Mon, 28 Oct 2019 17:10:31 -0300
Message-Id: <20191028201032.6352-15-jgg@ziepe.ca>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191028201032.6352-1-jgg@ziepe.ca>
References: <20191028201032.6352-1-jgg@ziepe.ca>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v2 14/15] drm/amdgpu: Use mmu_range_notifier
 instead of hmm_mirror
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

RnJvbTogSmFzb24gR3VudGhvcnBlIDxqZ2dAbWVsbGFub3guY29tPgoKQ29udmVydCB0aGUgY29s
bGlzaW9uLXJldHJ5IGxvY2sgYXJvdW5kIGhtbV9yYW5nZV9mYXVsdCB0byB1c2UgdGhlIG9uZSBu
b3cKcHJvdmlkZWQgYnkgdGhlIG1tdV9yYW5nZSBub3RpZmllci4KCkFsdGhvdWdoIHRoaXMgZHJp
dmVyIGRvZXMgbm90IHNlZW0gdG8gdXNlIHRoZSBjb2xsaXNpb24gcmV0cnkgbG9jayB0aGF0Cmht
bSBwcm92aWRlcyBjb3JyZWN0bHksIGl0IGNhbiBzdGlsbCBiZSBjb252ZXJ0ZWQgb3ZlciB0byB1
c2UgdGhlCm1tdV9yYW5nZV9ub3RpZmllciBhcGkgaW5zdGVhZCBvZiBobW1fbWlycm9yIHdpdGhv
dXQgdG9vIG11Y2ggdHJvdWJsZS4KClRoaXMgYWxzbyBkZWxldGVzIGFub3RoZXIgcGxhY2Ugd2hl
cmUgYSBkcml2ZXIgaXMgYXNzb2NpYXRpbmcgYWRkaXRpb25hbApkYXRhIChzdHJ1Y3QgYW1kZ3B1
X21uKSB3aXRoIGEgbW11X3N0cnVjdC4KCkNjOiBBbGV4IERldWNoZXIgPGFsZXhhbmRlci5kZXVj
aGVyQGFtZC5jb20+CkNjOiBDaHJpc3RpYW4gS8O2bmlnIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5j
b20+CkNjOiBEYXZpZCAoQ2h1bk1pbmcpIFpob3UgPERhdmlkMS5aaG91QGFtZC5jb20+CkNjOiBh
bWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpTaWduZWQtb2ZmLWJ5OiBKYXNvbiBHdW50aG9y
cGUgPGpnZ0BtZWxsYW5veC5jb20+Ci0tLQogLi4uL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVf
YW1ka2ZkX2dwdXZtLmMgIHwgICA0ICsKIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdw
dV9jcy5jICAgICAgICB8ICAxNCArLQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1
X21uLmMgICAgICAgIHwgMTQ4ICsrLS0tLS0tLS0tLS0tLS0tLQogZHJpdmVycy9ncHUvZHJtL2Ft
ZC9hbWRncHUvYW1kZ3B1X21uLmggICAgICAgIHwgIDQ5IC0tLS0tLQogZHJpdmVycy9ncHUvZHJt
L2FtZC9hbWRncHUvYW1kZ3B1X3R0bS5jICAgICAgIHwgIDc2ICsrKystLS0tLQogNSBmaWxlcyBj
aGFuZ2VkLCA2NiBpbnNlcnRpb25zKCspLCAyMjUgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2FtZGtmZF9ncHV2bS5jIGIvZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2FtZGtmZF9ncHV2bS5jCmluZGV4IDQ3NzAwMzAy
YTA4YjdmLi4xYmNlZGI5YjQ3N2RjZSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9h
bWRncHUvYW1kZ3B1X2FtZGtmZF9ncHV2bS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1k
Z3B1L2FtZGdwdV9hbWRrZmRfZ3B1dm0uYwpAQCAtMTczOCw2ICsxNzM4LDEwIEBAIHN0YXRpYyBp
bnQgdXBkYXRlX2ludmFsaWRfdXNlcl9wYWdlcyhzdHJ1Y3QgYW1ka2ZkX3Byb2Nlc3NfaW5mbyAq
cHJvY2Vzc19pbmZvLAogCQkJcmV0dXJuIHJldDsKIAkJfQogCisJCS8qCisJCSAqIEZJWE1FOiBD
YW5ub3QgaWdub3JlIHRoZSByZXR1cm4gY29kZSwgbXVzdCBob2xkCisJCSAqIG5vdGlmaWVyX2xv
Y2sKKwkJICovCiAJCWFtZGdwdV90dG1fdHRfZ2V0X3VzZXJfcGFnZXNfZG9uZShiby0+dGJvLnR0
bSk7CiAKIAkJLyogTWFyayB0aGUgQk8gYXMgdmFsaWQgdW5sZXNzIGl0IHdhcyBpbnZhbGlkYXRl
ZApkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2NzLmMgYi9k
cml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfY3MuYwppbmRleCAyZTUzZmVlZDQwZTIz
MC4uNzY3NzFmNWYwYjYwYWIgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1
L2FtZGdwdV9jcy5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9jcy5j
CkBAIC02MDcsOCArNjA3LDYgQEAgc3RhdGljIGludCBhbWRncHVfY3NfcGFyc2VyX2JvcyhzdHJ1
Y3QgYW1kZ3B1X2NzX3BhcnNlciAqcCwKIAkJZS0+dHYubnVtX3NoYXJlZCA9IDI7CiAKIAlhbWRn
cHVfYm9fbGlzdF9nZXRfbGlzdChwLT5ib19saXN0LCAmcC0+dmFsaWRhdGVkKTsKLQlpZiAocC0+
Ym9fbGlzdC0+Zmlyc3RfdXNlcnB0ciAhPSBwLT5ib19saXN0LT5udW1fZW50cmllcykKLQkJcC0+
bW4gPSBhbWRncHVfbW5fZ2V0KHAtPmFkZXYsIEFNREdQVV9NTl9UWVBFX0dGWCk7CiAKIAlJTklU
X0xJU1RfSEVBRCgmZHVwbGljYXRlcyk7CiAJYW1kZ3B1X3ZtX2dldF9wZF9ibygmZnByaXYtPnZt
LCAmcC0+dmFsaWRhdGVkLCAmcC0+dm1fcGQpOwpAQCAtMTI5MSwxMSArMTI4OSwxMSBAQCBzdGF0
aWMgaW50IGFtZGdwdV9jc19zdWJtaXQoc3RydWN0IGFtZGdwdV9jc19wYXJzZXIgKnAsCiAJaWYg
KHIpCiAJCWdvdG8gZXJyb3JfdW5sb2NrOwogCi0JLyogTm8gbWVtb3J5IGFsbG9jYXRpb24gaXMg
YWxsb3dlZCB3aGlsZSBob2xkaW5nIHRoZSBtbiBsb2NrLgotCSAqIHAtPm1uIGlzIGhvbGQgdW50
aWwgYW1kZ3B1X2NzX3N1Ym1pdCBpcyBmaW5pc2hlZCBhbmQgZmVuY2UgaXMgYWRkZWQKLQkgKiB0
byBCT3MuCisJLyogTm8gbWVtb3J5IGFsbG9jYXRpb24gaXMgYWxsb3dlZCB3aGlsZSBob2xkaW5n
IHRoZSBub3RpZmllciBsb2NrLgorCSAqIFRoZSBsb2NrIGlzIGhlbGQgdW50aWwgYW1kZ3B1X2Nz
X3N1Ym1pdCBpcyBmaW5pc2hlZCBhbmQgZmVuY2UgaXMKKwkgKiBhZGRlZCB0byBCT3MuCiAJICov
Ci0JYW1kZ3B1X21uX2xvY2socC0+bW4pOworCW11dGV4X2xvY2soJnAtPmFkZXYtPm5vdGlmaWVy
X2xvY2spOwogCiAJLyogSWYgdXNlcnB0ciBhcmUgaW52YWxpZGF0ZWQgYWZ0ZXIgYW1kZ3B1X2Nz
X3BhcnNlcl9ib3MoKSwgcmV0dXJuCiAJICogLUVBR0FJTiwgZHJtSW9jdGwgaW4gbGliZHJtIHdp
bGwgcmVzdGFydCB0aGUgYW1kZ3B1X2NzX2lvY3RsLgpAQCAtMTMzOCwxMyArMTMzNiwxMyBAQCBz
dGF0aWMgaW50IGFtZGdwdV9jc19zdWJtaXQoc3RydWN0IGFtZGdwdV9jc19wYXJzZXIgKnAsCiAJ
YW1kZ3B1X3ZtX21vdmVfdG9fbHJ1X3RhaWwocC0+YWRldiwgJmZwcml2LT52bSk7CiAKIAl0dG1f
ZXVfZmVuY2VfYnVmZmVyX29iamVjdHMoJnAtPnRpY2tldCwgJnAtPnZhbGlkYXRlZCwgcC0+ZmVu
Y2UpOwotCWFtZGdwdV9tbl91bmxvY2socC0+bW4pOworCW11dGV4X3VubG9jaygmcC0+YWRldi0+
bm90aWZpZXJfbG9jayk7CiAKIAlyZXR1cm4gMDsKIAogZXJyb3JfYWJvcnQ6CiAJZHJtX3NjaGVk
X2pvYl9jbGVhbnVwKCZqb2ItPmJhc2UpOwotCWFtZGdwdV9tbl91bmxvY2socC0+bW4pOworCW11
dGV4X3VubG9jaygmcC0+YWRldi0+bm90aWZpZXJfbG9jayk7CiAKIGVycm9yX3VubG9jazoKIAlh
bWRncHVfam9iX2ZyZWUoam9iKTsKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1k
Z3B1L2FtZGdwdV9tbi5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X21uLmMK
aW5kZXggNGZmZDdiOTBmNGQ5MDcuLmNiNzE4YTA2NGViNDkxIDEwMDY0NAotLS0gYS9kcml2ZXJz
L2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfbW4uYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1k
L2FtZGdwdS9hbWRncHVfbW4uYwpAQCAtNTAsMjggKzUwLDYgQEAKICNpbmNsdWRlICJhbWRncHUu
aCIKICNpbmNsdWRlICJhbWRncHVfYW1ka2ZkLmgiCiAKLS8qKgotICogYW1kZ3B1X21uX2xvY2sg
LSB0YWtlIHRoZSB3cml0ZSBzaWRlIGxvY2sgZm9yIHRoaXMgbm90aWZpZXIKLSAqCi0gKiBAbW46
IG91ciBub3RpZmllcgotICovCi12b2lkIGFtZGdwdV9tbl9sb2NrKHN0cnVjdCBhbWRncHVfbW4g
Km1uKQotewotCWlmIChtbikKLQkJZG93bl93cml0ZSgmbW4tPmxvY2spOwotfQotCi0vKioKLSAq
IGFtZGdwdV9tbl91bmxvY2sgLSBkcm9wIHRoZSB3cml0ZSBzaWRlIGxvY2sgZm9yIHRoaXMgbm90
aWZpZXIKLSAqCi0gKiBAbW46IG91ciBub3RpZmllcgotICovCi12b2lkIGFtZGdwdV9tbl91bmxv
Y2soc3RydWN0IGFtZGdwdV9tbiAqbW4pCi17Ci0JaWYgKG1uKQotCQl1cF93cml0ZSgmbW4tPmxv
Y2spOwotfQotCiAvKioKICAqIGFtZGdwdV9tbl9pbnZhbGlkYXRlX2dmeCAtIGNhbGxiYWNrIHRv
IG5vdGlmeSBhYm91dCBtbSBjaGFuZ2UKICAqCkBAIC04MiwxMiArNjAsMTkgQEAgdm9pZCBhbWRn
cHVfbW5fdW5sb2NrKHN0cnVjdCBhbWRncHVfbW4gKm1uKQogICogcG90ZW50aWFsbHkgZGlydHku
CiAgKi8KIHN0YXRpYyBib29sIGFtZGdwdV9tbl9pbnZhbGlkYXRlX2dmeChzdHJ1Y3QgbW11X3Jh
bmdlX25vdGlmaWVyICptcm4sCi0JCQkJICAgICBjb25zdCBzdHJ1Y3QgbW11X25vdGlmaWVyX3Jh
bmdlICpyYW5nZSkKKwkJCQkgICAgIGNvbnN0IHN0cnVjdCBtbXVfbm90aWZpZXJfcmFuZ2UgKnJh
bmdlLAorCQkJCSAgICAgdW5zaWduZWQgbG9uZyBjdXJfc2VxKQogewogCXN0cnVjdCBhbWRncHVf
Ym8gKmJvID0gY29udGFpbmVyX29mKG1ybiwgc3RydWN0IGFtZGdwdV9ibywgbm90aWZpZXIpOwog
CXN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2ID0gYW1kZ3B1X3R0bV9hZGV2KGJvLT50Ym8uYmRl
dik7CiAJbG9uZyByOwogCisJLyoKKwkgKiBGSVhNRTogTXVzdCBob2xkIHNvbWUgbG9jayBzaGFy
ZWQgd2l0aAorCSAqIGFtZGdwdV90dG1fdHRfZ2V0X3VzZXJfcGFnZXNfZG9uZSgpCisJICovCisJ
bW11X3JhbmdlX3NldF9zZXEobXJuLCBjdXJfc2VxKTsKKwogCS8qIEZJWE1FOiBJcyB0aGlzIG5l
Y2Vzc2FyeT8gKi8KIAlpZiAoIWFtZGdwdV90dG1fdHRfYWZmZWN0X3VzZXJwdHIoYm8tPnRiby50
dG0sIHJhbmdlLT5zdGFydCwKIAkJCQkJICByYW5nZS0+ZW5kKSkKQEAgLTExOSwxMSArMTA0LDE4
IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgbW11X3JhbmdlX25vdGlmaWVyX29wcyBhbWRncHVfbW5f
Z2Z4X29wcyA9IHsKICAqIGV2aWN0aW5nIGFsbCB1c2VyLW1vZGUgcXVldWVzIG9mIHRoZSBwcm9j
ZXNzLgogICovCiBzdGF0aWMgYm9vbCBhbWRncHVfbW5faW52YWxpZGF0ZV9oc2Eoc3RydWN0IG1t
dV9yYW5nZV9ub3RpZmllciAqbXJuLAotCQkJCSAgICAgY29uc3Qgc3RydWN0IG1tdV9ub3RpZmll
cl9yYW5nZSAqcmFuZ2UpCisJCQkJICAgICBjb25zdCBzdHJ1Y3QgbW11X25vdGlmaWVyX3Jhbmdl
ICpyYW5nZSwKKwkJCQkgICAgIHVuc2lnbmVkIGxvbmcgY3VyX3NlcSkKIHsKIAlzdHJ1Y3QgYW1k
Z3B1X2JvICpibyA9IGNvbnRhaW5lcl9vZihtcm4sIHN0cnVjdCBhbWRncHVfYm8sIG5vdGlmaWVy
KTsKIAlzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiA9IGFtZGdwdV90dG1fYWRldihiby0+dGJv
LmJkZXYpOwogCisJLyoKKwkgKiBGSVhNRTogTXVzdCBob2xkIHNvbWUgbG9jayBzaGFyZWQgd2l0
aAorCSAqIGFtZGdwdV90dG1fdHRfZ2V0X3VzZXJfcGFnZXNfZG9uZSgpCisJICovCisJbW11X3Jh
bmdlX3NldF9zZXEobXJuLCBjdXJfc2VxKTsKKwogCS8qIEZJWE1FOiBJcyB0aGlzIG5lY2Vzc2Fy
eT8gKi8KIAlpZiAoIWFtZGdwdV90dG1fdHRfYWZmZWN0X3VzZXJwdHIoYm8tPnRiby50dG0sIHJh
bmdlLT5zdGFydCwKIAkJCQkJICByYW5nZS0+ZW5kKSkKQEAgLTE0Myw5MiArMTM1LDYgQEAgc3Rh
dGljIGNvbnN0IHN0cnVjdCBtbXVfcmFuZ2Vfbm90aWZpZXJfb3BzIGFtZGdwdV9tbl9oc2Ffb3Bz
ID0gewogCS5pbnZhbGlkYXRlID0gYW1kZ3B1X21uX2ludmFsaWRhdGVfaHNhLAogfTsKIAotc3Rh
dGljIGludCBhbWRncHVfbW5fc3luY19wYWdldGFibGVzKHN0cnVjdCBobW1fbWlycm9yICptaXJy
b3IsCi0JCQkJICAgICBjb25zdCBzdHJ1Y3QgbW11X25vdGlmaWVyX3JhbmdlICp1cGRhdGUpCi17
Ci0Jc3RydWN0IGFtZGdwdV9tbiAqYW1uID0gY29udGFpbmVyX29mKG1pcnJvciwgc3RydWN0IGFt
ZGdwdV9tbiwgbWlycm9yKTsKLQotCWlmICghbW11X25vdGlmaWVyX3JhbmdlX2Jsb2NrYWJsZSh1
cGRhdGUpKQotCQlyZXR1cm4gZmFsc2U7Ci0KLQlkb3duX3JlYWQoJmFtbi0+bG9jayk7Ci0JdXBf
cmVhZCgmYW1uLT5sb2NrKTsKLQlyZXR1cm4gMDsKLX0KLQotLyogTG93IGJpdHMgb2YgYW55IHJl
YXNvbmFibGUgbW0gcG9pbnRlciB3aWxsIGJlIHVudXNlZCBkdWUgdG8gc3RydWN0Ci0gKiBhbGln
bm1lbnQuIFVzZSB0aGVzZSBiaXRzIHRvIG1ha2UgYSB1bmlxdWUga2V5IGZyb20gdGhlIG1tIHBv
aW50ZXIKLSAqIGFuZCBub3RpZmllciB0eXBlLgotICovCi0jZGVmaW5lIEFNREdQVV9NTl9LRVko
bW0sIHR5cGUpICgodW5zaWduZWQgbG9uZykobW0pICsgKHR5cGUpKQotCi1zdGF0aWMgc3RydWN0
IGhtbV9taXJyb3Jfb3BzIGFtZGdwdV9obW1fbWlycm9yX29wc1tdID0gewotCVtBTURHUFVfTU5f
VFlQRV9HRlhdID0gewotCQkuc3luY19jcHVfZGV2aWNlX3BhZ2V0YWJsZXMgPSBhbWRncHVfbW5f
c3luY19wYWdldGFibGVzLAotCX0sCi0JW0FNREdQVV9NTl9UWVBFX0hTQV0gPSB7Ci0JCS5zeW5j
X2NwdV9kZXZpY2VfcGFnZXRhYmxlcyA9IGFtZGdwdV9tbl9zeW5jX3BhZ2V0YWJsZXMsCi0JfSwK
LX07Ci0KLS8qKgotICogYW1kZ3B1X21uX2dldCAtIGNyZWF0ZSBITU0gbWlycm9yIGNvbnRleHQK
LSAqCi0gKiBAYWRldjogYW1kZ3B1IGRldmljZSBwb2ludGVyCi0gKiBAdHlwZTogdHlwZSBvZiBN
TVUgbm90aWZpZXIgY29udGV4dAotICoKLSAqIENyZWF0ZXMgYSBITU0gbWlycm9yIGNvbnRleHQg
Zm9yIGN1cnJlbnQtPm1tLgotICovCi1zdHJ1Y3QgYW1kZ3B1X21uICphbWRncHVfbW5fZ2V0KHN0
cnVjdCBhbWRncHVfZGV2aWNlICphZGV2LAotCQkJCWVudW0gYW1kZ3B1X21uX3R5cGUgdHlwZSkK
LXsKLQlzdHJ1Y3QgbW1fc3RydWN0ICptbSA9IGN1cnJlbnQtPm1tOwotCXN0cnVjdCBhbWRncHVf
bW4gKmFtbjsKLQl1bnNpZ25lZCBsb25nIGtleSA9IEFNREdQVV9NTl9LRVkobW0sIHR5cGUpOwot
CWludCByOwotCi0JbXV0ZXhfbG9jaygmYWRldi0+bW5fbG9jayk7Ci0JaWYgKGRvd25fd3JpdGVf
a2lsbGFibGUoJm1tLT5tbWFwX3NlbSkpIHsKLQkJbXV0ZXhfdW5sb2NrKCZhZGV2LT5tbl9sb2Nr
KTsKLQkJcmV0dXJuIEVSUl9QVFIoLUVJTlRSKTsKLQl9Ci0KLQloYXNoX2Zvcl9lYWNoX3Bvc3Np
YmxlKGFkZXYtPm1uX2hhc2gsIGFtbiwgbm9kZSwga2V5KQotCQlpZiAoQU1ER1BVX01OX0tFWShh
bW4tPm1pcnJvci5obW0tPm1tdV9ub3RpZmllci5tbSwKLQkJCQkgIGFtbi0+dHlwZSkgPT0ga2V5
KQotCQkJZ290byByZWxlYXNlX2xvY2tzOwotCi0JYW1uID0ga3phbGxvYyhzaXplb2YoKmFtbiks
IEdGUF9LRVJORUwpOwotCWlmICghYW1uKSB7Ci0JCWFtbiA9IEVSUl9QVFIoLUVOT01FTSk7Ci0J
CWdvdG8gcmVsZWFzZV9sb2NrczsKLQl9Ci0KLQlhbW4tPmFkZXYgPSBhZGV2OwotCWluaXRfcndz
ZW0oJmFtbi0+bG9jayk7Ci0JYW1uLT50eXBlID0gdHlwZTsKLQotCWFtbi0+bWlycm9yLm9wcyA9
ICZhbWRncHVfaG1tX21pcnJvcl9vcHNbdHlwZV07Ci0JciA9IGhtbV9taXJyb3JfcmVnaXN0ZXIo
JmFtbi0+bWlycm9yLCBtbSk7Ci0JaWYgKHIpCi0JCWdvdG8gZnJlZV9hbW47Ci0KLQloYXNoX2Fk
ZChhZGV2LT5tbl9oYXNoLCAmYW1uLT5ub2RlLCBBTURHUFVfTU5fS0VZKG1tLCB0eXBlKSk7Ci0K
LXJlbGVhc2VfbG9ja3M6Ci0JdXBfd3JpdGUoJm1tLT5tbWFwX3NlbSk7Ci0JbXV0ZXhfdW5sb2Nr
KCZhZGV2LT5tbl9sb2NrKTsKLQotCXJldHVybiBhbW47Ci0KLWZyZWVfYW1uOgotCXVwX3dyaXRl
KCZtbS0+bW1hcF9zZW0pOwotCW11dGV4X3VubG9jaygmYWRldi0+bW5fbG9jayk7Ci0Ja2ZyZWUo
YW1uKTsKLQotCXJldHVybiBFUlJfUFRSKHIpOwotfQotCiAvKioKICAqIGFtZGdwdV9tbl9yZWdp
c3RlciAtIHJlZ2lzdGVyIGEgQk8gZm9yIG5vdGlmaWVyIHVwZGF0ZXMKICAqCkBAIC0yNjMsMjUg
KzE2OSwzIEBAIHZvaWQgYW1kZ3B1X21uX3VucmVnaXN0ZXIoc3RydWN0IGFtZGdwdV9ibyAqYm8p
CiAJbW11X3JhbmdlX25vdGlmaWVyX3JlbW92ZSgmYm8tPm5vdGlmaWVyKTsKIAliby0+bm90aWZp
ZXIubW0gPSBOVUxMOwogfQotCi0vKiBmbGFncyB1c2VkIGJ5IEhNTSBpbnRlcm5hbCwgbm90IHJl
bGF0ZWQgdG8gQ1BVL0dQVSBQVEUgZmxhZ3MgKi8KLXN0YXRpYyBjb25zdCB1aW50NjRfdCBobW1f
cmFuZ2VfZmxhZ3NbSE1NX1BGTl9GTEFHX01BWF0gPSB7Ci0JCSgxIDw8IDApLCAvKiBITU1fUEZO
X1ZBTElEICovCi0JCSgxIDw8IDEpLCAvKiBITU1fUEZOX1dSSVRFICovCi0JCTAgLyogSE1NX1BG
Tl9ERVZJQ0VfUFJJVkFURSAqLwotfTsKLQotc3RhdGljIGNvbnN0IHVpbnQ2NF90IGhtbV9yYW5n
ZV92YWx1ZXNbSE1NX1BGTl9WQUxVRV9NQVhdID0gewotCQkweGZmZmZmZmZmZmZmZmZmZmVVTCwg
LyogSE1NX1BGTl9FUlJPUiAqLwotCQkwLCAvKiBITU1fUEZOX05PTkUgKi8KLQkJMHhmZmZmZmZm
ZmZmZmZmZmZjVUwgLyogSE1NX1BGTl9TUEVDSUFMICovCi19OwotCi12b2lkIGFtZGdwdV9obW1f
aW5pdF9yYW5nZShzdHJ1Y3QgaG1tX3JhbmdlICpyYW5nZSkKLXsKLQlpZiAocmFuZ2UpIHsKLQkJ
cmFuZ2UtPmZsYWdzID0gaG1tX3JhbmdlX2ZsYWdzOwotCQlyYW5nZS0+dmFsdWVzID0gaG1tX3Jh
bmdlX3ZhbHVlczsKLQkJcmFuZ2UtPnBmbl9zaGlmdCA9IFBBR0VfU0hJRlQ7Ci0JfQotfQpkaWZm
IC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X21uLmggYi9kcml2ZXJz
L2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfbW4uaAppbmRleCBkNzNhYjI5NDdiMjJiMi4uYTI5
MjIzOGY3NWViYWUgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdw
dV9tbi5oCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9tbi5oCkBAIC0z
MCw1OSArMzAsMTAgQEAKICNpbmNsdWRlIDxsaW51eC93b3JrcXVldWUuaD4KICNpbmNsdWRlIDxs
aW51eC9pbnRlcnZhbF90cmVlLmg+CiAKLWVudW0gYW1kZ3B1X21uX3R5cGUgewotCUFNREdQVV9N
Tl9UWVBFX0dGWCwKLQlBTURHUFVfTU5fVFlQRV9IU0EsCi19OwotCi0vKioKLSAqIHN0cnVjdCBh
bWRncHVfbW4KLSAqCi0gKiBAYWRldjogYW1kZ3B1IGRldmljZSBwb2ludGVyCi0gKiBAdHlwZTog
dHlwZSBvZiBNTVUgbm90aWZpZXIKLSAqIEB3b3JrOiBkZXN0cnVjdGlvbiB3b3JrIGl0ZW0KLSAq
IEBub2RlOiBoYXNoIHRhYmxlIG5vZGUgdG8gZmluZCBzdHJ1Y3R1cmUgYnkgYWRldiBhbmQgbW4K
LSAqIEBsb2NrOiBydyBzZW1hcGhvcmUgcHJvdGVjdGluZyB0aGUgbm90aWZpZXIgbm9kZXMKLSAq
IEBtaXJyb3I6IEhNTSBtaXJyb3IgZnVuY3Rpb24gc3VwcG9ydAotICoKLSAqIERhdGEgZm9yIGVh
Y2ggYW1kZ3B1IGRldmljZSBhbmQgcHJvY2VzcyBhZGRyZXNzIHNwYWNlLgotICovCi1zdHJ1Y3Qg
YW1kZ3B1X21uIHsKLQkvKiBjb25zdGFudCBhZnRlciBpbml0aWFsaXNhdGlvbiAqLwotCXN0cnVj
dCBhbWRncHVfZGV2aWNlCSphZGV2OwotCWVudW0gYW1kZ3B1X21uX3R5cGUJdHlwZTsKLQotCS8q
IG9ubHkgdXNlZCBvbiBkZXN0cnVjdGlvbiAqLwotCXN0cnVjdCB3b3JrX3N0cnVjdAl3b3JrOwot
Ci0JLyogcHJvdGVjdGVkIGJ5IGFkZXYtPm1uX2xvY2sgKi8KLQlzdHJ1Y3QgaGxpc3Rfbm9kZQlu
b2RlOwotCi0JLyogb2JqZWN0cyBwcm90ZWN0ZWQgYnkgbG9jayAqLwotCXN0cnVjdCByd19zZW1h
cGhvcmUJbG9jazsKLQotI2lmZGVmIENPTkZJR19ITU1fTUlSUk9SCi0JLyogSE1NIG1pcnJvciAq
LwotCXN0cnVjdCBobW1fbWlycm9yCW1pcnJvcjsKLSNlbmRpZgotfTsKLQogI2lmIGRlZmluZWQo
Q09ORklHX0hNTV9NSVJST1IpCi12b2lkIGFtZGdwdV9tbl9sb2NrKHN0cnVjdCBhbWRncHVfbW4g
Km1uKTsKLXZvaWQgYW1kZ3B1X21uX3VubG9jayhzdHJ1Y3QgYW1kZ3B1X21uICptbik7Ci1zdHJ1
Y3QgYW1kZ3B1X21uICphbWRncHVfbW5fZ2V0KHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2LAot
CQkJCWVudW0gYW1kZ3B1X21uX3R5cGUgdHlwZSk7CiBpbnQgYW1kZ3B1X21uX3JlZ2lzdGVyKHN0
cnVjdCBhbWRncHVfYm8gKmJvLCB1bnNpZ25lZCBsb25nIGFkZHIpOwogdm9pZCBhbWRncHVfbW5f
dW5yZWdpc3RlcihzdHJ1Y3QgYW1kZ3B1X2JvICpibyk7Ci12b2lkIGFtZGdwdV9obW1faW5pdF9y
YW5nZShzdHJ1Y3QgaG1tX3JhbmdlICpyYW5nZSk7CiAjZWxzZQotc3RhdGljIGlubGluZSB2b2lk
IGFtZGdwdV9tbl9sb2NrKHN0cnVjdCBhbWRncHVfbW4gKm1uKSB7fQotc3RhdGljIGlubGluZSB2
b2lkIGFtZGdwdV9tbl91bmxvY2soc3RydWN0IGFtZGdwdV9tbiAqbW4pIHt9Ci1zdGF0aWMgaW5s
aW5lIHN0cnVjdCBhbWRncHVfbW4gKmFtZGdwdV9tbl9nZXQoc3RydWN0IGFtZGdwdV9kZXZpY2Ug
KmFkZXYsCi0JCQkJCSAgICAgIGVudW0gYW1kZ3B1X21uX3R5cGUgdHlwZSkKLXsKLQlyZXR1cm4g
TlVMTDsKLX0KIHN0YXRpYyBpbmxpbmUgaW50IGFtZGdwdV9tbl9yZWdpc3RlcihzdHJ1Y3QgYW1k
Z3B1X2JvICpibywgdW5zaWduZWQgbG9uZyBhZGRyKQogewogCURSTV9XQVJOX09OQ0UoIkhNTV9N
SVJST1Iga2VybmVsIGNvbmZpZyBvcHRpb24gaXMgbm90IGVuYWJsZWQsICIKZGlmZiAtLWdpdCBh
L2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV90dG0uYyBiL2RyaXZlcnMvZ3B1L2Ry
bS9hbWQvYW1kZ3B1L2FtZGdwdV90dG0uYwppbmRleCBjMGU0MWYxZjBjMjM2NS4uNjVkOTgyNGI1
NGYyYTkgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV90dG0u
YworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdHRtLmMKQEAgLTc3Myw2
ICs3NzMsMjAgQEAgc3RydWN0IGFtZGdwdV90dG1fdHQgewogI2VuZGlmCiB9OwogCisjaWZkZWYg
Q09ORklHX0RSTV9BTURHUFVfVVNFUlBUUgorLyogZmxhZ3MgdXNlZCBieSBITU0gaW50ZXJuYWws
IG5vdCByZWxhdGVkIHRvIENQVS9HUFUgUFRFIGZsYWdzICovCitzdGF0aWMgY29uc3QgdWludDY0
X3QgaG1tX3JhbmdlX2ZsYWdzW0hNTV9QRk5fRkxBR19NQVhdID0geworCSgxIDw8IDApLCAvKiBI
TU1fUEZOX1ZBTElEICovCisJKDEgPDwgMSksIC8qIEhNTV9QRk5fV1JJVEUgKi8KKwkwIC8qIEhN
TV9QRk5fREVWSUNFX1BSSVZBVEUgKi8KK307CisKK3N0YXRpYyBjb25zdCB1aW50NjRfdCBobW1f
cmFuZ2VfdmFsdWVzW0hNTV9QRk5fVkFMVUVfTUFYXSA9IHsKKwkweGZmZmZmZmZmZmZmZmZmZmVV
TCwgLyogSE1NX1BGTl9FUlJPUiAqLworCTAsIC8qIEhNTV9QRk5fTk9ORSAqLworCTB4ZmZmZmZm
ZmZmZmZmZmZmY1VMIC8qIEhNTV9QRk5fU1BFQ0lBTCAqLworfTsKKwogLyoqCiAgKiBhbWRncHVf
dHRtX3R0X2dldF91c2VyX3BhZ2VzIC0gZ2V0IGRldmljZSBhY2Nlc3NpYmxlIHBhZ2VzIHRoYXQg
YmFjayB1c2VyCiAgKiBtZW1vcnkgYW5kIHN0YXJ0IEhNTSB0cmFja2luZyBDUFUgcGFnZSB0YWJs
ZSB1cGRhdGUKQEAgLTc4MCwyOSArNzk0LDI3IEBAIHN0cnVjdCBhbWRncHVfdHRtX3R0IHsKICAq
IENhbGxpbmcgZnVuY3Rpb24gbXVzdCBjYWxsIGFtZGdwdV90dG1fdHRfdXNlcnB0cl9yYW5nZV9k
b25lKCkgb25jZSBhbmQgb25seQogICogb25jZSBhZnRlcndhcmRzIHRvIHN0b3AgSE1NIHRyYWNr
aW5nCiAgKi8KLSNpZiBJU19FTkFCTEVEKENPTkZJR19EUk1fQU1ER1BVX1VTRVJQVFIpCi0KLSNk
ZWZpbmUgTUFYX1JFVFJZX0hNTV9SQU5HRV9GQVVMVAkxNgotCiBpbnQgYW1kZ3B1X3R0bV90dF9n
ZXRfdXNlcl9wYWdlcyhzdHJ1Y3QgYW1kZ3B1X2JvICpibywgc3RydWN0IHBhZ2UgKipwYWdlcykK
IHsKLQlzdHJ1Y3QgaG1tX21pcnJvciAqbWlycm9yID0gYm8tPm1uID8gJmJvLT5tbi0+bWlycm9y
IDogTlVMTDsKIAlzdHJ1Y3QgdHRtX3R0ICp0dG0gPSBiby0+dGJvLnR0bTsKIAlzdHJ1Y3QgYW1k
Z3B1X3R0bV90dCAqZ3R0ID0gKHZvaWQgKil0dG07CiAJc3RydWN0IG1tX3N0cnVjdCAqbW07CisJ
c3RydWN0IGhtbV9yYW5nZSAqcmFuZ2U7CiAJdW5zaWduZWQgbG9uZyBzdGFydCA9IGd0dC0+dXNl
cnB0cjsKIAlzdHJ1Y3Qgdm1fYXJlYV9zdHJ1Y3QgKnZtYTsKLQlzdHJ1Y3QgaG1tX3JhbmdlICpy
YW5nZTsKIAl1bnNpZ25lZCBsb25nIGk7Ci0JdWludDY0X3QgKnBmbnM7CiAJaW50IHIgPSAwOwog
Ci0JaWYgKHVubGlrZWx5KCFtaXJyb3IpKSB7Ci0JCURSTV9ERUJVR19EUklWRVIoIkZhaWxlZCB0
byBnZXQgaG1tX21pcnJvclxuIik7CisJbW0gPSBiby0+bm90aWZpZXIubW07CisJaWYgKHVubGlr
ZWx5KCFtbSkpIHsKKwkJRFJNX0RFQlVHX0RSSVZFUigiQk8gaXMgbm90IHJlZ2lzdGVyZWQ/XG4i
KTsKIAkJcmV0dXJuIC1FRkFVTFQ7CiAJfQogCi0JbW0gPSBtaXJyb3ItPmhtbS0+bW11X25vdGlm
aWVyLm1tOworCS8qIEFub3RoZXIgZ2V0X3VzZXJfcGFnZXMgaXMgcnVubmluZyBhdCB0aGUgc2Ft
ZSB0aW1lPz8gKi8KKwlpZiAoV0FSTl9PTihndHQtPnJhbmdlKSkKKwkJcmV0dXJuIC1FRkFVTFQ7
CisKIAlpZiAoIW1tZ2V0X25vdF96ZXJvKG1tKSkgLyogSGFwcGVucyBkdXJpbmcgcHJvY2VzcyBz
aHV0ZG93biAqLwogCQlyZXR1cm4gLUVTUkNIOwogCkBAIC04MTEsMzAgKzgyMywyNCBAQCBpbnQg
YW1kZ3B1X3R0bV90dF9nZXRfdXNlcl9wYWdlcyhzdHJ1Y3QgYW1kZ3B1X2JvICpibywgc3RydWN0
IHBhZ2UgKipwYWdlcykKIAkJciA9IC1FTk9NRU07CiAJCWdvdG8gb3V0OwogCX0KKwlyYW5nZS0+
bm90aWZpZXIgPSAmYm8tPm5vdGlmaWVyOworCXJhbmdlLT5mbGFncyA9IGhtbV9yYW5nZV9mbGFn
czsKKwlyYW5nZS0+dmFsdWVzID0gaG1tX3JhbmdlX3ZhbHVlczsKKwlyYW5nZS0+cGZuX3NoaWZ0
ID0gUEFHRV9TSElGVDsKKwlyYW5nZS0+c3RhcnQgPSBiby0+bm90aWZpZXIuaW50ZXJ2YWxfdHJl
ZS5zdGFydDsKKwlyYW5nZS0+ZW5kID0gYm8tPm5vdGlmaWVyLmludGVydmFsX3RyZWUubGFzdCAr
IDE7CisJcmFuZ2UtPmRlZmF1bHRfZmxhZ3MgPSBobW1fcmFuZ2VfZmxhZ3NbSE1NX1BGTl9WQUxJ
RF07CisJaWYgKCFhbWRncHVfdHRtX3R0X2lzX3JlYWRvbmx5KHR0bSkpCisJCXJhbmdlLT5kZWZh
dWx0X2ZsYWdzIHw9IHJhbmdlLT5mbGFnc1tITU1fUEZOX1dSSVRFXTsKIAotCXBmbnMgPSBrdm1h
bGxvY19hcnJheSh0dG0tPm51bV9wYWdlcywgc2l6ZW9mKCpwZm5zKSwgR0ZQX0tFUk5FTCk7Ci0J
aWYgKHVubGlrZWx5KCFwZm5zKSkgeworCXJhbmdlLT5wZm5zID0ga3ZtYWxsb2NfYXJyYXkodHRt
LT5udW1fcGFnZXMsIHNpemVvZigqcmFuZ2UtPnBmbnMpLAorCQkJCSAgICAgR0ZQX0tFUk5FTCk7
CisJaWYgKHVubGlrZWx5KCFyYW5nZS0+cGZucykpIHsKIAkJciA9IC1FTk9NRU07CiAJCWdvdG8g
b3V0X2ZyZWVfcmFuZ2VzOwogCX0KIAotCWFtZGdwdV9obW1faW5pdF9yYW5nZShyYW5nZSk7Ci0J
cmFuZ2UtPmRlZmF1bHRfZmxhZ3MgPSByYW5nZS0+ZmxhZ3NbSE1NX1BGTl9WQUxJRF07Ci0JcmFu
Z2UtPmRlZmF1bHRfZmxhZ3MgfD0gYW1kZ3B1X3R0bV90dF9pc19yZWFkb25seSh0dG0pID8KLQkJ
CQkwIDogcmFuZ2UtPmZsYWdzW0hNTV9QRk5fV1JJVEVdOwotCXJhbmdlLT5wZm5fZmxhZ3NfbWFz
ayA9IDA7Ci0JcmFuZ2UtPnBmbnMgPSBwZm5zOwotCXJhbmdlLT5zdGFydCA9IHN0YXJ0OwotCXJh
bmdlLT5lbmQgPSBzdGFydCArIHR0bS0+bnVtX3BhZ2VzICogUEFHRV9TSVpFOwotCi0JaG1tX3Jh
bmdlX3JlZ2lzdGVyKHJhbmdlLCBtaXJyb3IpOwotCi0JLyoKLQkgKiBKdXN0IHdhaXQgZm9yIHJh
bmdlIHRvIGJlIHZhbGlkLCBzYWZlIHRvIGlnbm9yZSByZXR1cm4gdmFsdWUgYXMgd2UKLQkgKiB3
aWxsIHVzZSB0aGUgcmV0dXJuIHZhbHVlIG9mIGhtbV9yYW5nZV9mYXVsdCgpIGJlbG93IHVuZGVy
IHRoZQotCSAqIG1tYXBfc2VtIHRvIGFzY2VydGFpbiB0aGUgdmFsaWRpdHkgb2YgdGhlIHJhbmdl
LgotCSAqLwotCWhtbV9yYW5nZV93YWl0X3VudGlsX3ZhbGlkKHJhbmdlLCBITU1fUkFOR0VfREVG
QVVMVF9USU1FT1VUKTsKKwlyYW5nZS0+bm90aWZpZXJfc2VxID0gbW11X3JhbmdlX3JlYWRfYmVn
aW4oJmJvLT5ub3RpZmllcik7CiAKIAlkb3duX3JlYWQoJm1tLT5tbWFwX3NlbSk7CiAJdm1hID0g
ZmluZF92bWEobW0sIHN0YXJ0KTsKQEAgLTg1NSwxMCArODYxLDEwIEBAIGludCBhbWRncHVfdHRt
X3R0X2dldF91c2VyX3BhZ2VzKHN0cnVjdCBhbWRncHVfYm8gKmJvLCBzdHJ1Y3QgcGFnZSAqKnBh
Z2VzKQogCQlnb3RvIG91dF9mcmVlX3BmbnM7CiAKIAlmb3IgKGkgPSAwOyBpIDwgdHRtLT5udW1f
cGFnZXM7IGkrKykgewotCQlwYWdlc1tpXSA9IGhtbV9kZXZpY2VfZW50cnlfdG9fcGFnZShyYW5n
ZSwgcGZuc1tpXSk7CisJCXBhZ2VzW2ldID0gaG1tX2RldmljZV9lbnRyeV90b19wYWdlKHJhbmdl
LCByYW5nZS0+cGZuc1tpXSk7CiAJCWlmICh1bmxpa2VseSghcGFnZXNbaV0pKSB7CiAJCQlwcl9l
cnIoIlBhZ2UgZmF1bHQgZmFpbGVkIGZvciBwZm5bJWx1XSA9IDB4JWxseFxuIiwKLQkJCSAgICAg
ICBpLCBwZm5zW2ldKTsKKwkJCSAgICAgICBpLCByYW5nZS0+cGZuc1tpXSk7CiAJCQlyID0gLUVO
T01FTTsKIAogCQkJZ290byBvdXRfZnJlZV9wZm5zOwpAQCAtODczLDggKzg3OSw3IEBAIGludCBh
bWRncHVfdHRtX3R0X2dldF91c2VyX3BhZ2VzKHN0cnVjdCBhbWRncHVfYm8gKmJvLCBzdHJ1Y3Qg
cGFnZSAqKnBhZ2VzKQogb3V0X3VubG9jazoKIAl1cF9yZWFkKCZtbS0+bW1hcF9zZW0pOwogb3V0
X2ZyZWVfcGZuczoKLQlobW1fcmFuZ2VfdW5yZWdpc3RlcihyYW5nZSk7Ci0Ja3ZmcmVlKHBmbnMp
OworCWt2ZnJlZShyYW5nZS0+cGZucyk7CiBvdXRfZnJlZV9yYW5nZXM6CiAJa2ZyZWUocmFuZ2Up
Owogb3V0OgpAQCAtOTAzLDkgKzkwOCw4IEBAIGJvb2wgYW1kZ3B1X3R0bV90dF9nZXRfdXNlcl9w
YWdlc19kb25lKHN0cnVjdCB0dG1fdHQgKnR0bSkKIAkJIk5vIHVzZXIgcGFnZXMgdG8gY2hlY2tc
biIpOwogCiAJaWYgKGd0dC0+cmFuZ2UpIHsKLQkJciA9IGhtbV9yYW5nZV92YWxpZChndHQtPnJh
bmdlKTsKLQkJaG1tX3JhbmdlX3VucmVnaXN0ZXIoZ3R0LT5yYW5nZSk7Ci0KKwkJciA9IG1tdV9y
YW5nZV9yZWFkX3JldHJ5KGd0dC0+cmFuZ2UtPm5vdGlmaWVyLAorCQkJCQkgZ3R0LT5yYW5nZS0+
bm90aWZpZXJfc2VxKTsKIAkJa3ZmcmVlKGd0dC0+cmFuZ2UtPnBmbnMpOwogCQlrZnJlZShndHQt
PnJhbmdlKTsKIAkJZ3R0LT5yYW5nZSA9IE5VTEw7Ci0tIAoyLjIzLjAKCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0
Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qu
b3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
