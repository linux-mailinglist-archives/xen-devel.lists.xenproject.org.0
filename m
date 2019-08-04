Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 52DA680DF7
	for <lists+xen-devel@lfdr.de>; Mon,  5 Aug 2019 00:52:32 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1huPK4-0003pC-41; Sun, 04 Aug 2019 22:49:52 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=wrCA=WA=gmail.com=john.hubbard@srs-us1.protection.inumbo.net>)
 id 1huPK1-0003m8-HP
 for xen-devel@lists.xenproject.org; Sun, 04 Aug 2019 22:49:49 +0000
X-Inumbo-ID: 29520b6b-b70a-11e9-8980-bc764e045a96
Received: from mail-pg1-x542.google.com (unknown [2607:f8b0:4864:20::542])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 29520b6b-b70a-11e9-8980-bc764e045a96;
 Sun, 04 Aug 2019 22:49:48 +0000 (UTC)
Received: by mail-pg1-x542.google.com with SMTP id x15so28316350pgg.8
 for <xen-devel@lists.xenproject.org>; Sun, 04 Aug 2019 15:49:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Zk7mJfsjIPJK9Qgsn0u5osZJajJrXebF0c1tZrgdgoI=;
 b=WszdJ6eSiS6l8Z9/5N/vbNe3jNFvMTjmOIbyGI43X/lqn/ujHi2UxXu88CH1bmo3Pr
 auVxGpa3TkNwR224TaYOB1ePcD+ho6gM00/37bER1kKjl0rL2SnnzYvGvu3vN/SXHfk+
 wtblnQHWP5rqAtZxjvFWL+wwPm4ICxkBWE6EXcMAD+BIssgCDDepKV59lPfeJfOzGgFr
 KW9V0+2vgt3eaIWXLk7U/hy0iBaj5GHPE+ZLhIwPVMA8/7B6uNEiy5Dm26EoCBxtBU9T
 tUYfOzYB8/UlHywiUxmEUaaGe/mgWuOGErPZVtfj1mQo23l9R0hEud7H5SM/CqJoFOsO
 zJVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Zk7mJfsjIPJK9Qgsn0u5osZJajJrXebF0c1tZrgdgoI=;
 b=GFNGmvrQLs+cRzY/GFsBJ30v65yDaQG5HZDHAlQJWYRQx3lLGS5ICZiy7Apn6GmaFU
 Ov4+PJJmr5p8k3oFHMTGoXOCkrD56AOXLmEUR7BX+io6u4NAN0+Ju9z+jmMCaXR2VAOA
 9GYpViI8F4jvzQNexd8Jczr/VgsGjnrEnca33Cr9+XIKWvMtpsLG0S8zBWvR7vbUe7xn
 wnBgss+VTpRBok5tbtMykR8mfqjdu6r46PqjNtqKpRiGWAsY8uXtqlGaYV/KoBN9iIZ6
 xcJSEP0hBYqG+z4eYaiivNjD3VAlBa8rXGtStUjIb47lz0ySCDv04JnEzmm8r9XJn74Y
 AxAw==
X-Gm-Message-State: APjAAAUQzQjEe7tuSBVI+9r/HDIfkVQ/X4CX5dq73pUSdYaTLFFzunCY
 yyTp96f0sujYlRmMd6d+xR8=
X-Google-Smtp-Source: APXvYqzXOrOAw0v6KK/XGb3+LYPhc4s7KW/tJCUCwczRKyA5tVzLB0NIrofddWwwfme3ueTIgYzfbg==
X-Received: by 2002:a63:3407:: with SMTP id b7mr22111094pga.143.1564958987901; 
 Sun, 04 Aug 2019 15:49:47 -0700 (PDT)
Received: from blueforge.nvidia.com (searspoint.nvidia.com. [216.228.112.21])
 by smtp.gmail.com with ESMTPSA id
 r6sm35946836pjb.22.2019.08.04.15.49.46
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Sun, 04 Aug 2019 15:49:47 -0700 (PDT)
From: john.hubbard@gmail.com
X-Google-Original-From: jhubbard@nvidia.com
To: Andrew Morton <akpm@linux-foundation.org>
Date: Sun,  4 Aug 2019 15:48:59 -0700
Message-Id: <20190804224915.28669-19-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190804224915.28669-1-jhubbard@nvidia.com>
References: <20190804224915.28669-1-jhubbard@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
Subject: [Xen-devel] [PATCH v2 18/34] fbdev/pvr2fb: convert put_page() to
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
 Kees Cook <keescook@chromium.org>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 John Hubbard <jhubbard@nvidia.com>, intel-gfx@lists.freedesktop.org,
 linux-block@vger.kernel.org,
 =?UTF-8?q?J=C3=A9r=C3=B4me=20Glisse?= <jglisse@redhat.com>,
 linux-rpi-kernel@lists.infradead.org, Arvind Yadav <arvind.yadav.cs@gmail.com>,
 Dan Williams <dan.j.williams@intel.com>, linux-arm-kernel@lists.infradead.org,
 linux-nfs@vger.kernel.org, netdev@vger.kernel.org,
 LKML <linux-kernel@vger.kernel.org>, linux-xfs@vger.kernel.org,
 linux-crypto@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 Bhumika Goyal <bhumirks@gmail.com>, Al Viro <viro@zeniv.linux.org.uk>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RnJvbTogSm9obiBIdWJiYXJkIDxqaHViYmFyZEBudmlkaWEuY29tPgoKRm9yIHBhZ2VzIHRoYXQg
d2VyZSByZXRhaW5lZCB2aWEgZ2V0X3VzZXJfcGFnZXMqKCksIHJlbGVhc2UgdGhvc2UgcGFnZXMK
dmlhIHRoZSBuZXcgcHV0X3VzZXJfcGFnZSooKSByb3V0aW5lcywgaW5zdGVhZCBvZiB2aWEgcHV0
X3BhZ2UoKSBvcgpyZWxlYXNlX3BhZ2VzKCkuCgpUaGlzIGlzIHBhcnQgYSB0cmVlLXdpZGUgY29u
dmVyc2lvbiwgYXMgZGVzY3JpYmVkIGluIGNvbW1pdCBmYzFkOGU3Y2NhMmQKKCJtbTogaW50cm9k
dWNlIHB1dF91c2VyX3BhZ2UqKCksIHBsYWNlaG9sZGVyIHZlcnNpb25zIikuCgpDYzogQmFydGxv
bWllaiBab2xuaWVya2lld2ljeiA8Yi56b2xuaWVya2llQHNhbXN1bmcuY29tPgpDYzogS2VlcyBD
b29rIDxrZWVzY29va0BjaHJvbWl1bS5vcmc+CkNjOiBBbCBWaXJvIDx2aXJvQHplbml2LmxpbnV4
Lm9yZy51az4KQ2M6IEJodW1pa2EgR295YWwgPGJodW1pcmtzQGdtYWlsLmNvbT4KQ2M6IEFydmlu
ZCBZYWRhdiA8YXJ2aW5kLnlhZGF2LmNzQGdtYWlsLmNvbT4KQ2M6IGRyaS1kZXZlbEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKQ2M6IGxpbnV4LWZiZGV2QHZnZXIua2VybmVsLm9yZwpTaWduZWQtb2Zm
LWJ5OiBKb2huIEh1YmJhcmQgPGpodWJiYXJkQG52aWRpYS5jb20+Ci0tLQogZHJpdmVycy92aWRl
by9mYmRldi9wdnIyZmIuYyB8IDMgKy0tCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyks
IDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy92aWRlby9mYmRldi9wdnIyZmIu
YyBiL2RyaXZlcnMvdmlkZW8vZmJkZXYvcHZyMmZiLmMKaW5kZXggN2ZmNGI2Yjg0MjgyLi4wZTRm
OWFhNjQ0NGQgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvdmlkZW8vZmJkZXYvcHZyMmZiLmMKKysrIGIv
ZHJpdmVycy92aWRlby9mYmRldi9wdnIyZmIuYwpAQCAtNzAwLDggKzcwMCw3IEBAIHN0YXRpYyBz
c2l6ZV90IHB2cjJmYl93cml0ZShzdHJ1Y3QgZmJfaW5mbyAqaW5mbywgY29uc3QgY2hhciAqYnVm
LAogCXJldCA9IGNvdW50OwogCiBvdXRfdW5tYXA6Ci0JZm9yIChpID0gMDsgaSA8IG5yX3BhZ2Vz
OyBpKyspCi0JCXB1dF9wYWdlKHBhZ2VzW2ldKTsKKwlwdXRfdXNlcl9wYWdlcyhwYWdlcywgbnJf
cGFnZXMpOwogCiAJa2ZyZWUocGFnZXMpOwogCi0tIAoyLjIyLjAKCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
