Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 31C2619E516
	for <lists+xen-devel@lfdr.de>; Sat,  4 Apr 2020 15:07:01 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jKiVH-0004ug-8f; Sat, 04 Apr 2020 13:06:27 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=7qE9=5U=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1jKiVG-0004u6-3g
 for xen-devel@lists.xenproject.org; Sat, 04 Apr 2020 13:06:26 +0000
X-Inumbo-ID: 16b2fcb3-7675-11ea-be20-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 16b2fcb3-7675-11ea-be20-12813bfff9fa;
 Sat, 04 Apr 2020 13:06:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 MIME-Version:Content-Type:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=nL6FEJ5/y1biweD0xTmxlZW+q9AMSw7C93G6n4hYeOo=; b=fPJB9cIEFzj89LEBO2XnYQwQKO
 8/LadqNF6qb4kAHJqBGnQQ7MzGG2pj3nL7OFSwMal5dYS9oR/Nu15AojMMyZ8SHKAmAzJu77ziDft
 WJQsxbsZvVMtjTSBnmxnBQDw39Q7sHzvjqhEYa2o5xf/fqje5Wx2K258sUObYSyNNddU=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <julien@xen.org>)
 id 1jKiVE-00089p-IU; Sat, 04 Apr 2020 13:06:24 +0000
Received: from 54-240-197-235.amazon.com ([54.240.197.235]
 helo=ufe34d9ed68d054.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.89)
 (envelope-from <julien@xen.org>)
 id 1jKiVE-0007aO-8R; Sat, 04 Apr 2020 13:06:24 +0000
From: Julien Grall <julien@xen.org>
To: xen-devel@lists.xenproject.org
Subject: [PATCH v2] xen/guest_access: Harden *copy_to_guest_offset() to
 prevent const dest operand
Date: Sat,  4 Apr 2020 14:06:13 +0100
Message-Id: <20200404130613.26428-1-julien@xen.org>
X-Mailer: git-send-email 2.17.1
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, julien@xen.org,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Julien Grall <jgrall@amazon.com>, Jan Beulich <jbeulich@suse.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

From: Julien Grall <jgrall@amazon.com>

At the moment, *copy_to_guest_offset() will allow the hypervisor to copy
data to guest handle marked const.

Thankfully, no users of the helper will do that. Rather than hoping this
can be caught during review, harden copy_to_guest_offset() so the build
will fail if such users are introduced.

There is no easy way to check whether a const is NULL in C99. The
approach used is to introduce an unused variable that is non-const and
assign the handle. If the handle were const, this would fail at build
because without an explicit cast, it is not possible to assign a const
variable to a non-const variable.

Suggested-by: Jan Beulich <jbeulich@suse.com>
Signed-off-by: Julien Grall <jgrall@amazon.com>

---
    Changes in v2:
        - Use a void * variable to check the handle is not const.
---
 xen/include/asm-arm/guest_access.h | 9 +++++++++
 xen/include/asm-x86/guest_access.h | 9 +++++++++
 2 files changed, 18 insertions(+)

diff --git a/xen/include/asm-arm/guest_access.h b/xen/include/asm-arm/guest_access.h
index 8997a1cbfe..4046d50347 100644
--- a/xen/include/asm-arm/guest_access.h
+++ b/xen/include/asm-arm/guest_access.h
@@ -74,10 +74,14 @@ int access_guest_memory_by_ipa(struct domain *d, paddr_t ipa, void *buf,
 /*
  * Copy an array of objects to guest context via a guest handle,
  * specifying an offset into the guest array.
+ *
+ * The variable _t is only here to catch at build time whether we are
+ * copying back to a const guest handle.
  */
 #define copy_to_guest_offset(hnd, off, ptr, nr) ({      \
     const typeof(*(ptr)) *_s = (ptr);                   \
     char (*_d)[sizeof(*_s)] = (void *)(hnd).p;          \
+    void *__maybe_unused _t = (hnd).p;                  \
     ((void)((hnd).p == (ptr)));                         \
     raw_copy_to_guest(_d+(off), _s, sizeof(*_s)*(nr));  \
 })
@@ -124,9 +128,14 @@ int access_guest_memory_by_ipa(struct domain *d, paddr_t ipa, void *buf,
 #define guest_handle_okay(hnd, nr) (1)
 #define guest_handle_subrange_okay(hnd, first, last) (1)
 
+/*
+ * The variable _t is only here to catch at build time whether we are
+ * copying back to a const guest handle.
+ */
 #define __copy_to_guest_offset(hnd, off, ptr, nr) ({    \
     const typeof(*(ptr)) *_s = (ptr);                   \
     char (*_d)[sizeof(*_s)] = (void *)(hnd).p;          \
+    void *__maybe_unused _t = (hnd).p;                  \
     ((void)((hnd).p == (ptr)));                         \
     __raw_copy_to_guest(_d+(off), _s, sizeof(*_s)*(nr));\
 })
diff --git a/xen/include/asm-x86/guest_access.h b/xen/include/asm-x86/guest_access.h
index ca700c959a..0b58f2baee 100644
--- a/xen/include/asm-x86/guest_access.h
+++ b/xen/include/asm-x86/guest_access.h
@@ -83,10 +83,14 @@
 /*
  * Copy an array of objects to guest context via a guest handle,
  * specifying an offset into the guest array.
+ *
+ * The variable _t is only here to catch at build time whether we are
+ * copying back to a const guest handle.
  */
 #define copy_to_guest_offset(hnd, off, ptr, nr) ({      \
     const typeof(*(ptr)) *_s = (ptr);                   \
     char (*_d)[sizeof(*_s)] = (void *)(hnd).p;          \
+    void *__maybe_unused _t = (hnd).p;                  \
     ((void)((hnd).p == (ptr)));                         \
     raw_copy_to_guest(_d+(off), _s, sizeof(*_s)*(nr));  \
 })
@@ -134,9 +138,14 @@
                      (last)-(first)+1,                  \
                      sizeof(*(hnd).p)))
 
+/*
+ * The variable _t is only here to catch at build time whether we are
+ * copying back to a const guest handle.
+ */
 #define __copy_to_guest_offset(hnd, off, ptr, nr) ({    \
     const typeof(*(ptr)) *_s = (ptr);                   \
     char (*_d)[sizeof(*_s)] = (void *)(hnd).p;          \
+    void *__maybe_unused _t = (hnd).p;                  \
     ((void)((hnd).p == (ptr)));                         \
     __raw_copy_to_guest(_d+(off), _s, sizeof(*_s)*(nr));\
 })
-- 
2.17.1


