Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C677484016
	for <lists+xen-devel@lfdr.de>; Wed,  7 Aug 2019 03:37:26 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hvAq0-0000QU-No; Wed, 07 Aug 2019 01:34:00 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=TALv=WD=gmail.com=john.hubbard@srs-us1.protection.inumbo.net>)
 id 1hvApz-0000Pq-7Z
 for xen-devel@lists.xenproject.org; Wed, 07 Aug 2019 01:33:59 +0000
X-Inumbo-ID: 6cda8d42-b8b3-11e9-8980-bc764e045a96
Received: from mail-pf1-x441.google.com (unknown [2607:f8b0:4864:20::441])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 6cda8d42-b8b3-11e9-8980-bc764e045a96;
 Wed, 07 Aug 2019 01:33:57 +0000 (UTC)
Received: by mail-pf1-x441.google.com with SMTP id g2so42501781pfq.0
 for <xen-devel@lists.xenproject.org>; Tue, 06 Aug 2019 18:33:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=YDBAQLU7S2U/jcsuraEitExVA8qAggFNDXffEk4LOSU=;
 b=fH35navam8Lh5O3/qNrV94jl6iS2d0GfzCxk/u0RVGSb5dvr8ME5vr6Nrz7RbT0FzH
 b+0bwfj6a40pZ7ZDEBSPteuD+EtCdatETgtIbhA4HjNGhTvq4/6/8Hfd0cWzD4ACfYbW
 rgRW0nwu/E9vCWm7L7kW1f14dc8w0gfs4RZvtHi6Oflt61RfXIS6VkmL4oCieKfyzE0K
 4m3Xz2o0LiyRj0Y9KXj50L4atLA3dDsoGvMpdRLog6j+z0Lu9QLqi3MvwrgBmW5y8MHT
 21A4qIppa4JRGq/2QNHN+lrWM1Z/51ATanglohKPJpBhZfdY/rs/WBKjHemXIrn3RGac
 3taQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=YDBAQLU7S2U/jcsuraEitExVA8qAggFNDXffEk4LOSU=;
 b=Q8Amdk9wiMU3re4Gbrz6/d/c2WxZCx4OlC7sxpPXPZeB+3jEdal5ACDU/sZqhL9WXy
 BEnUwnO7LgiMg5mnDELOPI5gWrX12mgObZMsp4hhqonXJBlncqxHefvrfPn9+jOTv4fK
 3QCYoMbPoBZTR9Jbt6Oep4S+PiTcX5zkLhLnuJ0zC0EAcDYNyuPzukgW2CBToXK+b8/v
 53frwRjOfJqQRatEXbxMP6jxLtf7EzE7jOZBgG/xpC4O1yn/1wSragug0TFyOs+iIrKx
 KCcpJ5HzeiV45+emMMhITMM7nAGciPYBZJ0UuDF6KTEh2qbs+14rjrAeWJi+Jn/mYTbR
 mEMQ==
X-Gm-Message-State: APjAAAVCkYxUqZ9wOaVpLplM78SRVaaDrr9AQla/EC09y+y3bsbaT4ze
 CeTgFtUFmgI27CjybNyGao8=
X-Google-Smtp-Source: APXvYqxowmB5KY9x5+3VpBUz7AtpjaBcc2B1U6EZUCl5VRWjmEE9hilm+u0BPGPiavOiCOJ108uPDQ==
X-Received: by 2002:a17:90a:30cf:: with SMTP id
 h73mr6096915pjb.42.1565141637378; 
 Tue, 06 Aug 2019 18:33:57 -0700 (PDT)
Received: from blueforge.nvidia.com (searspoint.nvidia.com. [216.228.112.21])
 by smtp.gmail.com with ESMTPSA id
 u69sm111740800pgu.77.2019.08.06.18.33.55
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 06 Aug 2019 18:33:56 -0700 (PDT)
From: john.hubbard@gmail.com
X-Google-Original-From: jhubbard@nvidia.com
To: Andrew Morton <akpm@linux-foundation.org>
Date: Tue,  6 Aug 2019 18:33:07 -0700
Message-Id: <20190807013340.9706-9-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190807013340.9706-1-jhubbard@nvidia.com>
References: <20190807013340.9706-1-jhubbard@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
Subject: [Xen-devel] [PATCH v3 08/41] drm/i915: convert put_page() to
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
 David Airlie <airlied@linux.ie>, Dave Hansen <dave.hansen@linux.intel.com>,
 Dave Chinner <david@fromorbit.com>, dri-devel@lists.freedesktop.org,
 linux-mm@kvack.org, sparclinux@vger.kernel.org,
 Ira Weiny <ira.weiny@intel.com>, ceph-devel@vger.kernel.org,
 devel@driverdev.osuosl.org, rds-devel@oss.oracle.com,
 linux-rdma@vger.kernel.org, x86@kernel.org, amd-gfx@lists.freedesktop.org,
 Christoph Hellwig <hch@infradead.org>, Jason Gunthorpe <jgg@ziepe.ca>,
 xen-devel@lists.xenproject.org, devel@lists.orangefs.org,
 linux-media@vger.kernel.org, Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 John Hubbard <jhubbard@nvidia.com>, intel-gfx@lists.freedesktop.org,
 Jani Nikula <jani.nikula@linux.intel.com>, linux-block@vger.kernel.org,
 =?UTF-8?q?J=C3=A9r=C3=B4me=20Glisse?= <jglisse@redhat.com>,
 linux-rpi-kernel@lists.infradead.org, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Dan Williams <dan.j.williams@intel.com>, linux-arm-kernel@lists.infradead.org,
 linux-nfs@vger.kernel.org, netdev@vger.kernel.org,
 LKML <linux-kernel@vger.kernel.org>, linux-xfs@vger.kernel.org,
 linux-crypto@vger.kernel.org, linux-fsdevel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RnJvbTogSm9obiBIdWJiYXJkIDxqaHViYmFyZEBudmlkaWEuY29tPgoKRm9yIHBhZ2VzIHRoYXQg
d2VyZSByZXRhaW5lZCB2aWEgZ2V0X3VzZXJfcGFnZXMqKCksIHJlbGVhc2UgdGhvc2UgcGFnZXMK
dmlhIHRoZSBuZXcgcHV0X3VzZXJfcGFnZSooKSByb3V0aW5lcywgaW5zdGVhZCBvZiB2aWEgcHV0
X3BhZ2UoKSBvcgpyZWxlYXNlX3BhZ2VzKCkuCgpUaGlzIGlzIHBhcnQgYSB0cmVlLXdpZGUgY29u
dmVyc2lvbiwgYXMgZGVzY3JpYmVkIGluIGNvbW1pdCBmYzFkOGU3Y2NhMmQKKCJtbTogaW50cm9k
dWNlIHB1dF91c2VyX3BhZ2UqKCksIHBsYWNlaG9sZGVyIHZlcnNpb25zIikuCgpUaGlzIGlzIGEg
bWVyZ2UtYWJsZSB2ZXJzaW9uIG9mIHRoZSBmaXgsIGJlY2F1c2UgaXQgcmVzdHJpY3RzCml0c2Vs
ZiB0byBwdXRfdXNlcl9wYWdlKCkgYW5kIHB1dF91c2VyX3BhZ2VzKCksIGJvdGggb2Ygd2hpY2gK
aGF2ZSBub3QgY2hhbmdlZCB0aGVpciBBUElzLiBMYXRlciwgaTkxNV9nZW1fdXNlcnB0cl9wdXRf
cGFnZXMoKQpjYW4gYmUgc2ltcGxpZmllZCB0byB1c2UgcHV0X3VzZXJfcGFnZXNfZGlydHlfbG9j
aygpLgoKQWNrZWQtYnk6IFJvZHJpZ28gVml2aSA8cm9kcmlnby52aXZpQGludGVsLmNvbT4KCkNj
OiBKYW5pIE5pa3VsYSA8amFuaS5uaWt1bGFAbGludXguaW50ZWwuY29tPgpDYzogSm9vbmFzIExh
aHRpbmVuIDxqb29uYXMubGFodGluZW5AbGludXguaW50ZWwuY29tPgpDYzogRGF2aWQgQWlybGll
IDxhaXJsaWVkQGxpbnV4LmllPgpDYzogaW50ZWwtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpD
YzogZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpTaWduZWQtb2ZmLWJ5OiBKb2huIEh1
YmJhcmQgPGpodWJiYXJkQG52aWRpYS5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2k5MTUvZ2Vt
L2k5MTVfZ2VtX3VzZXJwdHIuYyB8IDYgKysrLS0tCiAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRp
b25zKCspLCAzIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1
L2dlbS9pOTE1X2dlbV91c2VycHRyLmMgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9nZW0vaTkxNV9n
ZW1fdXNlcnB0ci5jCmluZGV4IDJjYWE1OTQzMjJiYy4uNzZkZGEyOTIzY2YxIDEwMDY0NAotLS0g
YS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9nZW0vaTkxNV9nZW1fdXNlcnB0ci5jCisrKyBiL2RyaXZl
cnMvZ3B1L2RybS9pOTE1L2dlbS9pOTE1X2dlbV91c2VycHRyLmMKQEAgLTUyNyw3ICs1MjcsNyBA
QCBfX2k5MTVfZ2VtX3VzZXJwdHJfZ2V0X3BhZ2VzX3dvcmtlcihzdHJ1Y3Qgd29ya19zdHJ1Y3Qg
Kl93b3JrKQogCX0KIAltdXRleF91bmxvY2soJm9iai0+bW0ubG9jayk7CiAKLQlyZWxlYXNlX3Bh
Z2VzKHB2ZWMsIHBpbm5lZCk7CisJcHV0X3VzZXJfcGFnZXMocHZlYywgcGlubmVkKTsKIAlrdmZy
ZWUocHZlYyk7CiAKIAlpOTE1X2dlbV9vYmplY3RfcHV0KG9iaik7CkBAIC02NDAsNyArNjQwLDcg
QEAgc3RhdGljIGludCBpOTE1X2dlbV91c2VycHRyX2dldF9wYWdlcyhzdHJ1Y3QgZHJtX2k5MTVf
Z2VtX29iamVjdCAqb2JqKQogCQlfX2k5MTVfZ2VtX3VzZXJwdHJfc2V0X2FjdGl2ZShvYmosIHRy
dWUpOwogCiAJaWYgKElTX0VSUihwYWdlcykpCi0JCXJlbGVhc2VfcGFnZXMocHZlYywgcGlubmVk
KTsKKwkJcHV0X3VzZXJfcGFnZXMocHZlYywgcGlubmVkKTsKIAlrdmZyZWUocHZlYyk7CiAKIAly
ZXR1cm4gUFRSX0VSUl9PUl9aRVJPKHBhZ2VzKTsKQEAgLTY3NSw3ICs2NzUsNyBAQCBpOTE1X2dl
bV91c2VycHRyX3B1dF9wYWdlcyhzdHJ1Y3QgZHJtX2k5MTVfZ2VtX29iamVjdCAqb2JqLAogCQkJ
c2V0X3BhZ2VfZGlydHlfbG9jayhwYWdlKTsKIAogCQltYXJrX3BhZ2VfYWNjZXNzZWQocGFnZSk7
Ci0JCXB1dF9wYWdlKHBhZ2UpOworCQlwdXRfdXNlcl9wYWdlKHBhZ2UpOwogCX0KIAlvYmotPm1t
LmRpcnR5ID0gZmFsc2U7CiAKLS0gCjIuMjIuMAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby94ZW4tZGV2ZWw=
