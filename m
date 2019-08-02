Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E724B7EB3D
	for <lists+xen-devel@lfdr.de>; Fri,  2 Aug 2019 06:18:18 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1htOxd-0005un-HU; Fri, 02 Aug 2019 04:14:33 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=fOWY=V6=gmail.com=john.hubbard@srs-us1.protection.inumbo.net>)
 id 1htNBh-0007BE-OJ
 for xen-devel@lists.xenproject.org; Fri, 02 Aug 2019 02:20:57 +0000
X-Inumbo-ID: 28ac740b-b4cc-11e9-8980-bc764e045a96
Received: from mail-pl1-x641.google.com (unknown [2607:f8b0:4864:20::641])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 28ac740b-b4cc-11e9-8980-bc764e045a96;
 Fri, 02 Aug 2019 02:20:56 +0000 (UTC)
Received: by mail-pl1-x641.google.com with SMTP id 4so26013994pld.10
 for <xen-devel@lists.xenproject.org>; Thu, 01 Aug 2019 19:20:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Puv5caB6Xd1AJbwd7nGzyFKNouoVWAfL+vJwz/b+4QQ=;
 b=QRyVr5yg7UVnGFe/94tarV2cx/oce/jeAuEbGS+hXnWMVkUY07iSzJ+XdsjD5nlJBq
 rtaqXFFIyJDVZMz/IPqdxV28iUWO51kec9aYcvEuc1NKK19hn11UPjRAndaZuD321pFs
 RKnDddIFoWzyAYe9j0yIZ0ilD198KHwio3GcyDW9wHOLHbZQnh4EWC6hi4aeKuKjN/3A
 ASJiUynmLC6iZL/fZBtp3/NtpLCOGP1VvcXTdQwMcpbWEECy63Zknc8xjKmFGFNfVmU2
 0O+/0uGt4SKVMx7bM2tpg32Bk0v9UkWkkUlVmxU39ntVy853hr2Hw2jr21+6/jgrAg21
 vCDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Puv5caB6Xd1AJbwd7nGzyFKNouoVWAfL+vJwz/b+4QQ=;
 b=ptG9YodWJ2hJXSYJWBwSdioxf1NyTaVuDdFpo4d2QFS+uN9OU20T1Oz4893m2hg9SK
 T0oNObJim0/1CnmJxj8N6UOG1JbGMZ+BAqmLVqIpL2dnEdJ7puS5X75Co7QQN1A8DpGZ
 WojkShEH4L2Lh8WqaQTKtZK+E80OxRdEZKNb7RqS7C3ap0x7RkOpxtOBBN6ySSWT3QTg
 XsRJo2b2Mn5EEX9auHFhiyQaW1cqfs/fuJsNkKsi8jqHVSl2pVR4YnwflYt5Iv5+tG2G
 GxDe8dJWqyoihlI0mg4VAOEKNCiUPT7ky3krtvFwLKl6LRani1GvfvBZ752H5PetgaFe
 z9Vw==
X-Gm-Message-State: APjAAAUb+7T/oASHRP08UM/EDQAhhUNF+yFvT+36waynqwHll7cmIOvv
 aWnGxviFD78AwNFwnD+sETg=
X-Google-Smtp-Source: APXvYqyaZ4okZt4HMDulUfOascyI9kF+Bm8CH1styyIgJXB6Yp2GZVtQjz5NJsvyCn9V25oNb5Ohjg==
X-Received: by 2002:a17:902:100a:: with SMTP id
 b10mr87552918pla.338.1564712455774; 
 Thu, 01 Aug 2019 19:20:55 -0700 (PDT)
Received: from blueforge.nvidia.com (searspoint.nvidia.com. [216.228.112.21])
 by smtp.gmail.com with ESMTPSA id
 u9sm38179744pgc.5.2019.08.01.19.20.54
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 01 Aug 2019 19:20:55 -0700 (PDT)
From: john.hubbard@gmail.com
X-Google-Original-From: jhubbard@nvidia.com
To: Andrew Morton <akpm@linux-foundation.org>
Date: Thu,  1 Aug 2019 19:19:59 -0700
Message-Id: <20190802022005.5117-29-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190802022005.5117-1-jhubbard@nvidia.com>
References: <20190802022005.5117-1-jhubbard@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
X-Mailman-Approved-At: Fri, 02 Aug 2019 04:14:22 +0000
Subject: [Xen-devel] [PATCH 28/34] mm/madvise.c: convert put_page() to
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
 Matthew Wilcox <willy@infradead.org>, sparclinux@vger.kernel.org,
 Ira Weiny <ira.weiny@intel.com>, ceph-devel@vger.kernel.org,
 devel@driverdev.osuosl.org, rds-devel@oss.oracle.com,
 linux-rdma@vger.kernel.org, x86@kernel.org, amd-gfx@lists.freedesktop.org,
 Christoph Hellwig <hch@infradead.org>, Jason Gunthorpe <jgg@ziepe.ca>,
 xen-devel@lists.xenproject.org, devel@lists.orangefs.org,
 linux-media@vger.kernel.org, Daniel Black <daniel@linux.ibm.com>,
 John Hubbard <jhubbard@nvidia.com>, intel-gfx@lists.freedesktop.org,
 linux-block@vger.kernel.org,
 =?UTF-8?q?J=C3=A9r=C3=B4me=20Glisse?= <jglisse@redhat.com>,
 linux-rpi-kernel@lists.infradead.org, Dan Williams <dan.j.williams@intel.com>,
 linux-arm-kernel@lists.infradead.org, linux-nfs@vger.kernel.org,
 netdev@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
 linux-xfs@vger.kernel.org, linux-crypto@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, Mike Kravetz <mike.kravetz@oracle.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RnJvbTogSm9obiBIdWJiYXJkIDxqaHViYmFyZEBudmlkaWEuY29tPgoKRm9yIHBhZ2VzIHRoYXQg
d2VyZSByZXRhaW5lZCB2aWEgZ2V0X3VzZXJfcGFnZXMqKCksIHJlbGVhc2UgdGhvc2UgcGFnZXMK
dmlhIHRoZSBuZXcgcHV0X3VzZXJfcGFnZSooKSByb3V0aW5lcywgaW5zdGVhZCBvZiB2aWEgcHV0
X3BhZ2UoKSBvcgpyZWxlYXNlX3BhZ2VzKCkuCgpUaGlzIGlzIHBhcnQgYSB0cmVlLXdpZGUgY29u
dmVyc2lvbiwgYXMgZGVzY3JpYmVkIGluIGNvbW1pdCBmYzFkOGU3Y2NhMmQKKCJtbTogaW50cm9k
dWNlIHB1dF91c2VyX3BhZ2UqKCksIHBsYWNlaG9sZGVyIHZlcnNpb25zIikuCgpDYzogRGFuIFdp
bGxpYW1zIDxkYW4uai53aWxsaWFtc0BpbnRlbC5jb20+CkNjOiBEYW5pZWwgQmxhY2sgPGRhbmll
bEBsaW51eC5pYm0uY29tPgpDYzogSmFuIEthcmEgPGphY2tAc3VzZS5jej4KQ2M6IErDqXLDtG1l
IEdsaXNzZSA8amdsaXNzZUByZWRoYXQuY29tPgpDYzogTWF0dGhldyBXaWxjb3ggPHdpbGx5QGlu
ZnJhZGVhZC5vcmc+CkNjOiBNaWtlIEtyYXZldHogPG1pa2Uua3JhdmV0ekBvcmFjbGUuY29tPgpT
aWduZWQtb2ZmLWJ5OiBKb2huIEh1YmJhcmQgPGpodWJiYXJkQG52aWRpYS5jb20+Ci0tLQogbW0v
bWFkdmlzZS5jIHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0
aW9uKC0pCgpkaWZmIC0tZ2l0IGEvbW0vbWFkdmlzZS5jIGIvbW0vbWFkdmlzZS5jCmluZGV4IDk2
OGRmM2FhMDY5Zi4uMWM2ODgxYTc2MWE1IDEwMDY0NAotLS0gYS9tbS9tYWR2aXNlLmMKKysrIGIv
bW0vbWFkdmlzZS5jCkBAIC02NzIsNyArNjcyLDcgQEAgc3RhdGljIGludCBtYWR2aXNlX2luamVj
dF9lcnJvcihpbnQgYmVoYXZpb3IsCiAJCSAqIHJvdXRpbmUgaXMgcmVzcG9uc2libGUgZm9yIHBp
bm5pbmcgdGhlIHBhZ2UgdG8gcHJldmVudCBpdAogCQkgKiBmcm9tIGJlaW5nIHJlbGVhc2VkIGJh
Y2sgdG8gdGhlIHBhZ2UgYWxsb2NhdG9yLgogCQkgKi8KLQkJcHV0X3BhZ2UocGFnZSk7CisJCXB1
dF91c2VyX3BhZ2UocGFnZSk7CiAJCXJldCA9IG1lbW9yeV9mYWlsdXJlKHBmbiwgMCk7CiAJCWlm
IChyZXQpCiAJCQlyZXR1cm4gcmV0OwotLSAKMi4yMi4wCgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2
ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
