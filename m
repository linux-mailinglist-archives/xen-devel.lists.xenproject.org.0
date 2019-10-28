Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EBAA9E79D6
	for <lists+xen-devel@lfdr.de>; Mon, 28 Oct 2019 21:15:41 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iPBMm-000210-Ej; Mon, 28 Oct 2019 20:11:52 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=nBLR=YV=ziepe.ca=jgg@srs-us1.protection.inumbo.net>)
 id 1iPBMk-0001zt-PO
 for xen-devel@lists.xenproject.org; Mon, 28 Oct 2019 20:11:50 +0000
X-Inumbo-ID: 09c76ed0-f9bf-11e9-8aca-bc764e2007e4
Received: from mail-qt1-x842.google.com (unknown [2607:f8b0:4864:20::842])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 09c76ed0-f9bf-11e9-8aca-bc764e2007e4;
 Mon, 28 Oct 2019 20:10:51 +0000 (UTC)
Received: by mail-qt1-x842.google.com with SMTP id e14so16574672qto.1
 for <xen-devel@lists.xenproject.org>; Mon, 28 Oct 2019 13:10:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziepe.ca; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=F2P8/bWutEEexpXtgY3Ri54G2hYwzd51MYRSkoxVUFY=;
 b=f9VJ69PD3RaUkbEbccVYeRFDh/thjTQCzF5PuJ+gvt+IG6OkssL4Za0EKWGJI3j+0E
 HLSRRQqMXLrz5Gxqj9/Q7HBPvcvH4eX8f81f9tWwJzMf/Kvz1p+RSsKPa8Aqw6sRhOF1
 Ci6tCvrYka+pGRB45g/D9/kkwjGtIvI70tHdkxrH/C2yY97y+krIusL/sDyIaNisQg6v
 qVOhr1RtmNaMOuz4sPbCR/gy0XgHfVy8Z38tgeJWChrZRpsSaK+vcI6dRNWyH4tJvL8A
 b5RnhHZBFnkXiK2WV1K4WPo4s9VnYg1eiHNZQ2qUzq0o8pj/0x8HMVMYPMRl0Q10ejMR
 z6Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=F2P8/bWutEEexpXtgY3Ri54G2hYwzd51MYRSkoxVUFY=;
 b=IPgcx4bS4tQcgZh3omwxpq5D8Iwn/CcRPyu8LuuvaQRKmZIB6jnwTU8PxQh4QCz1Lf
 EKdFUeKMzfRi4ESY3iLXgRb6mJnu4WeGVTQCblbsWMY8gksrdmqeW5eypsIJXB/SrLC0
 ViZVF1jANeDCBE4WycN5p8XQIdtkNItwWWTQFMhcirRghPTc7kHI6X4mdyQ8fNCCo/8F
 DIeEHei97AJ19wNINT/9jKcE/PkBbWYvLbHWDCZMP4q7aMCWlM2yYsioFnHq4Ve7pd3p
 VUeMhy7TVJ8kg5dwBhxHTdVvVqxwn3Oz7o5PS3gbw8L62VIG24Ecmb1v+IHpvvHibzwe
 xBHQ==
X-Gm-Message-State: APjAAAWGWrQn8azywwXEA9Sgz/aBb+SeAMWLxN0GO1j8Q6LIGaoK/zem
 1ikSgP1uhu1SE8rIjTGckRTshg==
X-Google-Smtp-Source: APXvYqwTcskfH9Xiak0a57YVk8h4p5RuEjqynPFL5VtkKYVgvqVrkyouZ1IxJ09RUdRPaJJt1AiVUg==
X-Received: by 2002:ac8:6783:: with SMTP id b3mr300845qtp.25.1572293450670;
 Mon, 28 Oct 2019 13:10:50 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-142-162-113-180.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [142.162.113.180])
 by smtp.gmail.com with ESMTPSA id y33sm10527481qta.18.2019.10.28.13.10.43
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 28 Oct 2019 13:10:48 -0700 (PDT)
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)
 (envelope-from <jgg@ziepe.ca>)
 id 1iPBLf-0001h9-Ir; Mon, 28 Oct 2019 17:10:43 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: linux-mm@kvack.org, Jerome Glisse <jglisse@redhat.com>,
 Ralph Campbell <rcampbell@nvidia.com>, John Hubbard <jhubbard@nvidia.com>,
 Felix.Kuehling@amd.com
Date: Mon, 28 Oct 2019 17:10:29 -0300
Message-Id: <20191028201032.6352-13-jgg@ziepe.ca>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191028201032.6352-1-jgg@ziepe.ca>
References: <20191028201032.6352-1-jgg@ziepe.ca>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v2 12/15] drm/amdgpu: Call find_vma under
 mmap_sem
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

RnJvbTogSmFzb24gR3VudGhvcnBlIDxqZ2dAbWVsbGFub3guY29tPgoKZmluZF92bWEoKSBtdXN0
IGJlIGNhbGxlZCB1bmRlciB0aGUgbW1hcF9zZW0sIHJlb3JnYW5pemUgdGhpcyBjb2RlIHRvCmRv
IHRoZSB2bWEgY2hlY2sgYWZ0ZXIgZW50ZXJpbmcgdGhlIGxvY2suCgpGdXJ0aGVyLCBmaXggdGhl
IHVubG9ja2VkIHVzZSBvZiBzdHJ1Y3QgdGFza19zdHJ1Y3QncyBtbSwgaW5zdGVhZCB1c2UKdGhl
IG1tIGZyb20gaG1tX21pcnJvciB3aGljaCBoYXMgYW4gYWN0aXZlIG1tX2dyYWIuIEFsc28gdGhl
IG1tX2dyYWIKbXVzdCBiZSBjb252ZXJ0ZWQgdG8gYSBtbV9nZXQgYmVmb3JlIGFjcXVpcmluZyBt
bWFwX3NlbSBvciBjYWxsaW5nCmZpbmRfdm1hKCkuCgpGaXhlczogNjZjNDU1MDBiZmRjICgiZHJt
L2FtZGdwdTogdXNlIG5ldyBITU0gQVBJcyBhbmQgaGVscGVycyIpCkZpeGVzOiAwOTE5MTk1ZjJi
MGQgKCJkcm0vYW1kZ3B1OiBFbmFibGUgYW1kZ3B1X3R0bV90dF9nZXRfdXNlcl9wYWdlcyBpbiB3
b3JrZXIgdGhyZWFkcyIpCkNjOiBBbGV4IERldWNoZXIgPGFsZXhhbmRlci5kZXVjaGVyQGFtZC5j
b20+CkNjOiBDaHJpc3RpYW4gS8O2bmlnIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+CkNjOiBE
YXZpZCAoQ2h1bk1pbmcpIFpob3UgPERhdmlkMS5aaG91QGFtZC5jb20+CkNjOiBhbWQtZ2Z4QGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpTaWduZWQtb2ZmLWJ5OiBKYXNvbiBHdW50aG9ycGUgPGpnZ0Bt
ZWxsYW5veC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3R0bS5j
IHwgMzcgKysrKysrKysrKysrKystLS0tLS0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDIxIGluc2Vy
dGlvbnMoKyksIDE2IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9h
bWQvYW1kZ3B1L2FtZGdwdV90dG0uYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdw
dV90dG0uYwppbmRleCBkZmY0MWQwYTg1ZmU5Ni4uYzBlNDFmMWYwYzIzNjUgMTAwNjQ0Ci0tLSBh
L2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV90dG0uYworKysgYi9kcml2ZXJzL2dw
dS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdHRtLmMKQEAgLTM1LDYgKzM1LDcgQEAKICNpbmNsdWRl
IDxsaW51eC9obW0uaD4KICNpbmNsdWRlIDxsaW51eC9wYWdlbWFwLmg+CiAjaW5jbHVkZSA8bGlu
dXgvc2NoZWQvdGFzay5oPgorI2luY2x1ZGUgPGxpbnV4L3NjaGVkL21tLmg+CiAjaW5jbHVkZSA8
bGludXgvc2VxX2ZpbGUuaD4KICNpbmNsdWRlIDxsaW51eC9zbGFiLmg+CiAjaW5jbHVkZSA8bGlu
dXgvc3dhcC5oPgpAQCAtNzg4LDcgKzc4OSw3IEBAIGludCBhbWRncHVfdHRtX3R0X2dldF91c2Vy
X3BhZ2VzKHN0cnVjdCBhbWRncHVfYm8gKmJvLCBzdHJ1Y3QgcGFnZSAqKnBhZ2VzKQogCXN0cnVj
dCBobW1fbWlycm9yICptaXJyb3IgPSBiby0+bW4gPyAmYm8tPm1uLT5taXJyb3IgOiBOVUxMOwog
CXN0cnVjdCB0dG1fdHQgKnR0bSA9IGJvLT50Ym8udHRtOwogCXN0cnVjdCBhbWRncHVfdHRtX3R0
ICpndHQgPSAodm9pZCAqKXR0bTsKLQlzdHJ1Y3QgbW1fc3RydWN0ICptbSA9IGd0dC0+dXNlcnRh
c2stPm1tOworCXN0cnVjdCBtbV9zdHJ1Y3QgKm1tOwogCXVuc2lnbmVkIGxvbmcgc3RhcnQgPSBn
dHQtPnVzZXJwdHI7CiAJc3RydWN0IHZtX2FyZWFfc3RydWN0ICp2bWE7CiAJc3RydWN0IGhtbV9y
YW5nZSAqcmFuZ2U7CkBAIC03OTYsMjUgKzc5NywxNCBAQCBpbnQgYW1kZ3B1X3R0bV90dF9nZXRf
dXNlcl9wYWdlcyhzdHJ1Y3QgYW1kZ3B1X2JvICpibywgc3RydWN0IHBhZ2UgKipwYWdlcykKIAl1
aW50NjRfdCAqcGZuczsKIAlpbnQgciA9IDA7CiAKLQlpZiAoIW1tKSAvKiBIYXBwZW5zIGR1cmlu
ZyBwcm9jZXNzIHNodXRkb3duICovCi0JCXJldHVybiAtRVNSQ0g7Ci0KIAlpZiAodW5saWtlbHko
IW1pcnJvcikpIHsKIAkJRFJNX0RFQlVHX0RSSVZFUigiRmFpbGVkIHRvIGdldCBobW1fbWlycm9y
XG4iKTsKLQkJciA9IC1FRkFVTFQ7Ci0JCWdvdG8gb3V0OworCQlyZXR1cm4gLUVGQVVMVDsKIAl9
CiAKLQl2bWEgPSBmaW5kX3ZtYShtbSwgc3RhcnQpOwotCWlmICh1bmxpa2VseSghdm1hIHx8IHN0
YXJ0IDwgdm1hLT52bV9zdGFydCkpIHsKLQkJciA9IC1FRkFVTFQ7Ci0JCWdvdG8gb3V0OwotCX0K
LQlpZiAodW5saWtlbHkoKGd0dC0+dXNlcmZsYWdzICYgQU1ER1BVX0dFTV9VU0VSUFRSX0FOT05P
TkxZKSAmJgotCQl2bWEtPnZtX2ZpbGUpKSB7Ci0JCXIgPSAtRVBFUk07Ci0JCWdvdG8gb3V0Owot
CX0KKwltbSA9IG1pcnJvci0+aG1tLT5tbXVfbm90aWZpZXIubW07CisJaWYgKCFtbWdldF9ub3Rf
emVybyhtbSkpIC8qIEhhcHBlbnMgZHVyaW5nIHByb2Nlc3Mgc2h1dGRvd24gKi8KKwkJcmV0dXJu
IC1FU1JDSDsKIAogCXJhbmdlID0ga3phbGxvYyhzaXplb2YoKnJhbmdlKSwgR0ZQX0tFUk5FTCk7
CiAJaWYgKHVubGlrZWx5KCFyYW5nZSkpIHsKQEAgLTg0Nyw2ICs4MzcsMTcgQEAgaW50IGFtZGdw
dV90dG1fdHRfZ2V0X3VzZXJfcGFnZXMoc3RydWN0IGFtZGdwdV9ibyAqYm8sIHN0cnVjdCBwYWdl
ICoqcGFnZXMpCiAJaG1tX3JhbmdlX3dhaXRfdW50aWxfdmFsaWQocmFuZ2UsIEhNTV9SQU5HRV9E
RUZBVUxUX1RJTUVPVVQpOwogCiAJZG93bl9yZWFkKCZtbS0+bW1hcF9zZW0pOworCXZtYSA9IGZp
bmRfdm1hKG1tLCBzdGFydCk7CisJaWYgKHVubGlrZWx5KCF2bWEgfHwgc3RhcnQgPCB2bWEtPnZt
X3N0YXJ0KSkgeworCQlyID0gLUVGQVVMVDsKKwkJZ290byBvdXRfdW5sb2NrOworCX0KKwlpZiAo
dW5saWtlbHkoKGd0dC0+dXNlcmZsYWdzICYgQU1ER1BVX0dFTV9VU0VSUFRSX0FOT05PTkxZKSAm
JgorCQl2bWEtPnZtX2ZpbGUpKSB7CisJCXIgPSAtRVBFUk07CisJCWdvdG8gb3V0X3VubG9jazsK
Kwl9CisKIAlyID0gaG1tX3JhbmdlX2ZhdWx0KHJhbmdlLCAwKTsKIAl1cF9yZWFkKCZtbS0+bW1h
cF9zZW0pOwogCkBAIC04NjUsMTUgKzg2NiwxOSBAQCBpbnQgYW1kZ3B1X3R0bV90dF9nZXRfdXNl
cl9wYWdlcyhzdHJ1Y3QgYW1kZ3B1X2JvICpibywgc3RydWN0IHBhZ2UgKipwYWdlcykKIAl9CiAK
IAlndHQtPnJhbmdlID0gcmFuZ2U7CisJbW1wdXQobW0pOwogCiAJcmV0dXJuIDA7CiAKK291dF91
bmxvY2s6CisJdXBfcmVhZCgmbW0tPm1tYXBfc2VtKTsKIG91dF9mcmVlX3BmbnM6CiAJaG1tX3Jh
bmdlX3VucmVnaXN0ZXIocmFuZ2UpOwogCWt2ZnJlZShwZm5zKTsKIG91dF9mcmVlX3JhbmdlczoK
IAlrZnJlZShyYW5nZSk7CiBvdXQ6CisJbW1wdXQobW0pOwogCXJldHVybiByOwogfQogCi0tIAoy
LjIzLjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpY
ZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRw
czovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
