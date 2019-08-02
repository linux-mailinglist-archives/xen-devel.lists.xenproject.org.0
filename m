Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5248A7EB39
	for <lists+xen-devel@lfdr.de>; Fri,  2 Aug 2019 06:18:13 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1htOxY-0005s6-Ua; Fri, 02 Aug 2019 04:14:28 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=fOWY=V6=gmail.com=john.hubbard@srs-us1.protection.inumbo.net>)
 id 1htNBJ-00076I-PK
 for xen-devel@lists.xenproject.org; Fri, 02 Aug 2019 02:20:33 +0000
X-Inumbo-ID: 1ace5dff-b4cc-11e9-8980-bc764e045a96
Received: from mail-pf1-x441.google.com (unknown [2607:f8b0:4864:20::441])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 1ace5dff-b4cc-11e9-8980-bc764e045a96;
 Fri, 02 Aug 2019 02:20:33 +0000 (UTC)
Received: by mail-pf1-x441.google.com with SMTP id c3so12016252pfa.13
 for <xen-devel@lists.xenproject.org>; Thu, 01 Aug 2019 19:20:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=60C6UutqWDg70MnmR2wOYRHcozVv05mGJual4EWfkd0=;
 b=OcjBgeGu8UZCjg/O5HE3tZTmbKV/JxG356gcwN7XI4m7laLxmDfYwr2J+xgouxj3fQ
 Co0dhwd0qY47xArJmyB+EhpJv8h8AiGjGK24lKEHkHPsH9RjihM7pMRvNW+41GJgCLyu
 4QfSp0AC2zblPx9c01ipPR4kYld7HwcvdeZgybQdYrqzUfXd232AEHGN5xFwKTyZmR0/
 4nQ8d9yxpivs4/vMxrtO/9Xc8hiQJpvET/VRicWc2zu2qdEUBl4z9cTSyxwtCJdabvcM
 Ei+d8hsTWnZC71PLDlgF5ytQlKruZFkMxa42zlyyGk4z93JPolm9Mu5LN9FxicLHKdhc
 nCzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=60C6UutqWDg70MnmR2wOYRHcozVv05mGJual4EWfkd0=;
 b=R0UMGzC+Ljz1nB1HMjZT54Ke4jikMcYv1RB5OoBJhiDXD0m6dFs+zwrXRHzOhFNrmA
 ejRvrwzFMBz2kPymjMMqF3fRnV3ct4wdkCv/lcP5cuEd86oQY7DLhW864sQKwLre0ToO
 BPyxPBgNIO8s33c12USuoOqHYMuBQWOAO3dXF4mDurGFnfV90f7m2xSUYEBmtFT1ceA1
 tkuMYNABQeiiWAJ2B0EGY65rZAMCLBrgSMcYIRm6VGI54JAqWh8r9hQHsna6+ec5LBBn
 PuICh/sqvXR/dCHUS84lAHWORKzI9Iuio7llEWcMancYI3ve4XyKr8IZ6f94M+QpGZEQ
 9e1Q==
X-Gm-Message-State: APjAAAXLswmD0VWstkHXlui2LynYtawSGG/2Nkb1X4HHKJCCJTFuO06k
 YtP4BdsqkakhW+ilJoYql8Y=
X-Google-Smtp-Source: APXvYqxJWuQ3PRZS25/rGW/r93tu8qJViELHafWX8OhR+SZHdvKx4eGJZdpIEmnFGk4IpVB5b1wjUA==
X-Received: by 2002:a62:d45d:: with SMTP id u29mr56669248pfl.135.1564712432510; 
 Thu, 01 Aug 2019 19:20:32 -0700 (PDT)
Received: from blueforge.nvidia.com (searspoint.nvidia.com. [216.228.112.21])
 by smtp.gmail.com with ESMTPSA id
 u9sm38179744pgc.5.2019.08.01.19.20.30
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 01 Aug 2019 19:20:32 -0700 (PDT)
From: john.hubbard@gmail.com
X-Google-Original-From: jhubbard@nvidia.com
To: Andrew Morton <akpm@linux-foundation.org>
Date: Thu,  1 Aug 2019 19:19:44 -0700
Message-Id: <20190802022005.5117-14-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190802022005.5117-1-jhubbard@nvidia.com>
References: <20190802022005.5117-1-jhubbard@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
X-Mailman-Approved-At: Fri, 02 Aug 2019 04:14:22 +0000
Subject: [Xen-devel] [PATCH 13/34] rapidio: convert put_page() to
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
 Matt Porter <mporter@kernel.crashing.org>, devel@lists.orangefs.org,
 linux-media@vger.kernel.org, Kees Cook <keescook@chromium.org>,
 John Hubbard <jhubbard@nvidia.com>, intel-gfx@lists.freedesktop.org,
 linux-block@vger.kernel.org,
 =?UTF-8?q?J=C3=A9r=C3=B4me=20Glisse?= <jglisse@redhat.com>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 linux-rpi-kernel@lists.infradead.org, Dan Williams <dan.j.williams@intel.com>,
 linux-arm-kernel@lists.infradead.org, linux-nfs@vger.kernel.org,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>, netdev@vger.kernel.org,
 LKML <linux-kernel@vger.kernel.org>, linux-xfs@vger.kernel.org,
 Alexandre Bounine <alex.bou9@gmail.com>, linux-crypto@vger.kernel.org,
 Ioan Nicu <ioan.nicu.ext@nokia.com>, linux-fsdevel@vger.kernel.org,
 Logan Gunthorpe <logang@deltatee.com>, Al Viro <viro@zeniv.linux.org.uk>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RnJvbTogSm9obiBIdWJiYXJkIDxqaHViYmFyZEBudmlkaWEuY29tPgoKRm9yIHBhZ2VzIHRoYXQg
d2VyZSByZXRhaW5lZCB2aWEgZ2V0X3VzZXJfcGFnZXMqKCksIHJlbGVhc2UgdGhvc2UgcGFnZXMK
dmlhIHRoZSBuZXcgcHV0X3VzZXJfcGFnZSooKSByb3V0aW5lcywgaW5zdGVhZCBvZiB2aWEgcHV0
X3BhZ2UoKSBvcgpyZWxlYXNlX3BhZ2VzKCkuCgpUaGlzIGlzIHBhcnQgYSB0cmVlLXdpZGUgY29u
dmVyc2lvbiwgYXMgZGVzY3JpYmVkIGluIGNvbW1pdCBmYzFkOGU3Y2NhMmQKKCJtbTogaW50cm9k
dWNlIHB1dF91c2VyX3BhZ2UqKCksIHBsYWNlaG9sZGVyIHZlcnNpb25zIikuCgpDYzogTWF0dCBQ
b3J0ZXIgPG1wb3J0ZXJAa2VybmVsLmNyYXNoaW5nLm9yZz4KQ2M6IEFsZXhhbmRyZSBCb3VuaW5l
IDxhbGV4LmJvdTlAZ21haWwuY29tPgpDYzogQWwgVmlybyA8dmlyb0B6ZW5pdi5saW51eC5vcmcu
dWs+CkNjOiBMb2dhbiBHdW50aG9ycGUgPGxvZ2FuZ0BkZWx0YXRlZS5jb20+CkNjOiBDaHJpc3Rv
cGhlIEpBSUxMRVQgPGNocmlzdG9waGUuamFpbGxldEB3YW5hZG9vLmZyPgpDYzogSW9hbiBOaWN1
IDxpb2FuLm5pY3UuZXh0QG5va2lhLmNvbT4KQ2M6IEtlZXMgQ29vayA8a2Vlc2Nvb2tAY2hyb21p
dW0ub3JnPgpDYzogVHZydGtvIFVyc3VsaW4gPHR2cnRrby51cnN1bGluQGludGVsLmNvbT4KU2ln
bmVkLW9mZi1ieTogSm9obiBIdWJiYXJkIDxqaHViYmFyZEBudmlkaWEuY29tPgotLS0KIGRyaXZl
cnMvcmFwaWRpby9kZXZpY2VzL3Jpb19tcG9ydF9jZGV2LmMgfCA5ICsrKy0tLS0tLQogMSBmaWxl
IGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgNiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9k
cml2ZXJzL3JhcGlkaW8vZGV2aWNlcy9yaW9fbXBvcnRfY2Rldi5jIGIvZHJpdmVycy9yYXBpZGlv
L2RldmljZXMvcmlvX21wb3J0X2NkZXYuYwppbmRleCA4MTU1ZjU5ZWNlMzguLjBlOGVhMGU1YTg5
ZSAxMDA2NDQKLS0tIGEvZHJpdmVycy9yYXBpZGlvL2RldmljZXMvcmlvX21wb3J0X2NkZXYuYwor
KysgYi9kcml2ZXJzL3JhcGlkaW8vZGV2aWNlcy9yaW9fbXBvcnRfY2Rldi5jCkBAIC01NzIsMTQg
KzU3MiwxMiBAQCBzdGF0aWMgdm9pZCBkbWFfcmVxX2ZyZWUoc3RydWN0IGtyZWYgKnJlZikKIAlz
dHJ1Y3QgbXBvcnRfZG1hX3JlcSAqcmVxID0gY29udGFpbmVyX29mKHJlZiwgc3RydWN0IG1wb3J0
X2RtYV9yZXEsCiAJCQlyZWZjb3VudCk7CiAJc3RydWN0IG1wb3J0X2NkZXZfcHJpdiAqcHJpdiA9
IHJlcS0+cHJpdjsKLQl1bnNpZ25lZCBpbnQgaTsKIAogCWRtYV91bm1hcF9zZyhyZXEtPmRtYWNo
LT5kZXZpY2UtPmRldiwKIAkJICAgICByZXEtPnNndC5zZ2wsIHJlcS0+c2d0Lm5lbnRzLCByZXEt
PmRpcik7CiAJc2dfZnJlZV90YWJsZSgmcmVxLT5zZ3QpOwogCWlmIChyZXEtPnBhZ2VfbGlzdCkg
ewotCQlmb3IgKGkgPSAwOyBpIDwgcmVxLT5ucl9wYWdlczsgaSsrKQotCQkJcHV0X3BhZ2UocmVx
LT5wYWdlX2xpc3RbaV0pOworCQlwdXRfdXNlcl9wYWdlcyhyZXEtPnBhZ2VfbGlzdCwgcmVxLT5u
cl9wYWdlcyk7CiAJCWtmcmVlKHJlcS0+cGFnZV9saXN0KTsKIAl9CiAKQEAgLTgxNSw3ICs4MTMs
NyBAQCByaW9fZG1hX3RyYW5zZmVyKHN0cnVjdCBmaWxlICpmaWxwLCB1MzIgdHJhbnNmZXJfbW9k
ZSwKIAlzdHJ1Y3QgbXBvcnRfZG1hX3JlcSAqcmVxOwogCXN0cnVjdCBtcG9ydF9kZXYgKm1kID0g
cHJpdi0+bWQ7CiAJc3RydWN0IGRtYV9jaGFuICpjaGFuOwotCWludCBpLCByZXQ7CisJaW50IHJl
dDsKIAlpbnQgbmVudHM7CiAKIAlpZiAoeGZlci0+bGVuZ3RoID09IDApCkBAIC05NDYsOCArOTQ0
LDcgQEAgcmlvX2RtYV90cmFuc2ZlcihzdHJ1Y3QgZmlsZSAqZmlscCwgdTMyIHRyYW5zZmVyX21v
ZGUsCiAKIGVycl9wZzoKIAlpZiAoIXJlcS0+cGFnZV9saXN0KSB7Ci0JCWZvciAoaSA9IDA7IGkg
PCBucl9wYWdlczsgaSsrKQotCQkJcHV0X3BhZ2UocGFnZV9saXN0W2ldKTsKKwkJcHV0X3VzZXJf
cGFnZXMocGFnZV9saXN0LCBucl9wYWdlcyk7CiAJCWtmcmVlKHBhZ2VfbGlzdCk7CiAJfQogZXJy
X3JlcToKLS0gCjIuMjIuMAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4t
ZGV2ZWw=
