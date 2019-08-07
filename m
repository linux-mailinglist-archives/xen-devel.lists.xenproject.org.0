Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C0FA683FCD
	for <lists+xen-devel@lfdr.de>; Wed,  7 Aug 2019 03:36:48 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hvAqL-0000ps-Nd; Wed, 07 Aug 2019 01:34:21 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=TALv=WD=gmail.com=john.hubbard@srs-us1.protection.inumbo.net>)
 id 1hvAqK-0000oS-9M
 for xen-devel@lists.xenproject.org; Wed, 07 Aug 2019 01:34:20 +0000
X-Inumbo-ID: 798a0889-b8b3-11e9-8980-bc764e045a96
Received: from mail-pf1-x444.google.com (unknown [2607:f8b0:4864:20::444])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 798a0889-b8b3-11e9-8980-bc764e045a96;
 Wed, 07 Aug 2019 01:34:19 +0000 (UTC)
Received: by mail-pf1-x444.google.com with SMTP id 19so42486855pfa.4
 for <xen-devel@lists.xenproject.org>; Tue, 06 Aug 2019 18:34:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=py067aGaFWqYQnWW3CrL2Yk9VWIyNl4WEpwUsrZ7LgI=;
 b=iMIf7vv1OqjXs/pb2O80RbThn+V5BnR0qPinv0FzH0+g7xzprGLZVDhHDxqDtetcXv
 SaFnJoqNzRoFcPTVGSdSF8TWmFRSDY6HyI/xKEnGPkkBlyCLQ6e2r6EYWiPfaVK2Vmzt
 JZbyLYWCDWgBCgJU9imVgUMeONuNrElpVb025PXYsw4Ce7zDMpi0HqX5tsCmiW5ztLIV
 YDzIY1y6BpKbNCZAoclL3hg7itbVU1NhtHk3aXipSm7TKgtN0MS2OckyNUh0niZVwB8z
 njr19wA60AtVpgYuy80idYiGH3Z0ffMXU+t6KgBLR+IFYvULEDog7RhMgjNZybcJ+5TY
 bmmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=py067aGaFWqYQnWW3CrL2Yk9VWIyNl4WEpwUsrZ7LgI=;
 b=RaHbgEah48qrfUNwiJaRsTYnjnxnqZiw2W8QbFxFKoD2z+ZsAQfLC4qg+izFxqEVUT
 21n2E9xK+0fC4EBVjohriDfC5hJ3i8Uhh037UkROXolzHtdzM/garFxhzI9Be+Y5u0TF
 LlcjV7WLYN6pxypqJzsskNsdle7KpayD8H59zbBQrhbcuJQsqAcWlBJnVC0WXxUD+Jza
 8XgsJx3y2dtXsOxgtmOBaGM6OqtCs7XYBfwN67dlREV/pJrZcFY7W+acbgYfqm03q5uB
 CbofR7OWJght9yMKLmGOuwILeDPyIzBYbEkCVMmPS3Hw5e0sT4dK33CMrfh/9P6sUiO4
 PdhQ==
X-Gm-Message-State: APjAAAVNaBgNphFWZ6NXLd/jn9CwIYl/ovBzRnOi62j1/qYYfx2B/FQE
 obhAJ2ry+V5bvzbgSjtx+qw=
X-Google-Smtp-Source: APXvYqzEjGdQT4zwHkPHC3zuchqcBixfKdrLByyRaCgYuUpeMBSsZZqsbT+G0enkm62MLPirbgVZ8A==
X-Received: by 2002:a17:90a:fa07:: with SMTP id
 cm7mr5782148pjb.138.1565141658674; 
 Tue, 06 Aug 2019 18:34:18 -0700 (PDT)
Received: from blueforge.nvidia.com (searspoint.nvidia.com. [216.228.112.21])
 by smtp.gmail.com with ESMTPSA id
 u69sm111740800pgu.77.2019.08.06.18.34.17
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 06 Aug 2019 18:34:18 -0700 (PDT)
From: john.hubbard@gmail.com
X-Google-Original-From: jhubbard@nvidia.com
To: Andrew Morton <akpm@linux-foundation.org>
Date: Tue,  6 Aug 2019 18:33:20 -0700
Message-Id: <20190807013340.9706-22-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190807013340.9706-1-jhubbard@nvidia.com>
References: <20190807013340.9706-1-jhubbard@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
Subject: [Xen-devel] [PATCH v3 21/41] fsl_hypervisor: convert put_page() to
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
 Rob Herring <robh@kernel.org>, rds-devel@oss.oracle.com,
 linux-rdma@vger.kernel.org, x86@kernel.org, amd-gfx@lists.freedesktop.org,
 Christoph Hellwig <hch@infradead.org>, Jason Gunthorpe <jgg@ziepe.ca>,
 xen-devel@lists.xenproject.org, devel@lists.orangefs.org,
 linux-media@vger.kernel.org, Kees Cook <keescook@chromium.org>,
 John Hubbard <jhubbard@nvidia.com>, intel-gfx@lists.freedesktop.org,
 linux-block@vger.kernel.org,
 =?UTF-8?q?J=C3=A9r=C3=B4me=20Glisse?= <jglisse@redhat.com>,
 linux-rpi-kernel@lists.infradead.org, Dan Williams <dan.j.williams@intel.com>,
 linux-arm-kernel@lists.infradead.org, linux-nfs@vger.kernel.org,
 netdev@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
 linux-xfs@vger.kernel.org, linux-crypto@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, Al Viro <viro@zeniv.linux.org.uk>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RnJvbTogSm9obiBIdWJiYXJkIDxqaHViYmFyZEBudmlkaWEuY29tPgoKRm9yIHBhZ2VzIHRoYXQg
d2VyZSByZXRhaW5lZCB2aWEgZ2V0X3VzZXJfcGFnZXMqKCksIHJlbGVhc2UgdGhvc2UgcGFnZXMK
dmlhIHRoZSBuZXcgcHV0X3VzZXJfcGFnZSooKSByb3V0aW5lcywgaW5zdGVhZCBvZiB2aWEgcHV0
X3BhZ2UoKSBvcgpyZWxlYXNlX3BhZ2VzKCkuCgpUaGlzIGlzIHBhcnQgYSB0cmVlLXdpZGUgY29u
dmVyc2lvbiwgYXMgZGVzY3JpYmVkIGluIGNvbW1pdCBmYzFkOGU3Y2NhMmQKKCJtbTogaW50cm9k
dWNlIHB1dF91c2VyX3BhZ2UqKCksIHBsYWNlaG9sZGVyIHZlcnNpb25zIikuCgpUaGlzIGNoYW5n
ZXMgdGhlIHJlbGVhc2UgY29kZSBzbGlnaHRseSwgYmVjYXVzZSBlYWNoIHBhZ2Ugc2xvdCBpbiB0
aGUKcGFnZV9saXN0W10gYXJyYXkgaXMgbm8gbG9uZ2VyIGNoZWNrZWQgZm9yIE5VTEwuIEhvd2V2
ZXIsIHRoYXQgY2hlY2sKd2FzIHdyb25nIGFueXdheSwgYmVjYXVzZSB0aGUgZ2V0X3VzZXJfcGFn
ZXMoKSBwYXR0ZXJuIG9mIHVzYWdlIGhlcmUKbmV2ZXIgYWxsb3dlZCBmb3IgTlVMTCBlbnRyaWVz
IHdpdGhpbiBhIHJhbmdlIG9mIHBpbm5lZCBwYWdlcy4KCkNjOiBBbCBWaXJvIDx2aXJvQHplbml2
LmxpbnV4Lm9yZy51az4KQ2M6IEtlZXMgQ29vayA8a2Vlc2Nvb2tAY2hyb21pdW0ub3JnPgpDYzog
Um9iIEhlcnJpbmcgPHJvYmhAa2VybmVsLm9yZz4KU2lnbmVkLW9mZi1ieTogSm9obiBIdWJiYXJk
IDxqaHViYmFyZEBudmlkaWEuY29tPgotLS0KIGRyaXZlcnMvdmlydC9mc2xfaHlwZXJ2aXNvci5j
IHwgNyArKy0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCA1IGRlbGV0aW9u
cygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvdmlydC9mc2xfaHlwZXJ2aXNvci5jIGIvZHJpdmVy
cy92aXJ0L2ZzbF9oeXBlcnZpc29yLmMKaW5kZXggOTNkNWJlYmY5NTcyLi5hOGY3OGQ1NzJjNDUg
MTAwNjQ0Ci0tLSBhL2RyaXZlcnMvdmlydC9mc2xfaHlwZXJ2aXNvci5jCisrKyBiL2RyaXZlcnMv
dmlydC9mc2xfaHlwZXJ2aXNvci5jCkBAIC0yOTIsMTEgKzI5Miw4IEBAIHN0YXRpYyBsb25nIGlv
Y3RsX21lbWNweShzdHJ1Y3QgZnNsX2h2X2lvY3RsX21lbWNweSBfX3VzZXIgKnApCiAJCXZpcnRf
dG9fcGh5cyhzZ19saXN0KSwgbnVtX3BhZ2VzKTsKIAogZXhpdDoKLQlpZiAocGFnZXMpIHsKLQkJ
Zm9yIChpID0gMDsgaSA8IG51bV9wYWdlczsgaSsrKQotCQkJaWYgKHBhZ2VzW2ldKQotCQkJCXB1
dF9wYWdlKHBhZ2VzW2ldKTsKLQl9CisJaWYgKHBhZ2VzKQorCQlwdXRfdXNlcl9wYWdlcyhwYWdl
cywgbnVtX3BhZ2VzKTsKIAogCWtmcmVlKHNnX2xpc3RfdW5hbGlnbmVkKTsKIAlrZnJlZShwYWdl
cyk7Ci0tIAoyLjIyLjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRl
dmVs
