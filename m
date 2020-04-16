Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 86E421ABF09
	for <lists+xen-devel@lfdr.de>; Thu, 16 Apr 2020 13:25:14 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jP2dC-00064f-Gz; Thu, 16 Apr 2020 11:24:30 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=FuWY=6A=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1jP2dA-00064Y-BY
 for xen-devel@lists.xenproject.org; Thu, 16 Apr 2020 11:24:28 +0000
X-Inumbo-ID: d48b55a1-7fd4-11ea-8b78-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d48b55a1-7fd4-11ea-8b78-12813bfff9fa;
 Thu, 16 Apr 2020 11:24:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 MIME-Version:Content-Type:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=lztuz1kka89WKgJaeck9DZdVbr9zC3Dt9d5CkACQMII=; b=YaVw0aGGW+I0Y+B+FButI8n2HR
 ZF84y6il0u1pmEqWe2Rg2JCGLNChla8bL75776ckVvrot9nJc4iFgZptJ+heFqk0BuvizKtbctdcm
 rez84p5I+TCGuQoN8nnyoutDL58K84OdJNDK6rknfZRCpIqpksi53eOQcc/Tmrn3qKY8=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <julien@xen.org>)
 id 1jP2d8-0002fA-BG; Thu, 16 Apr 2020 11:24:26 +0000
Received: from 54-240-197-235.amazon.com ([54.240.197.235]
 helo=ufe34d9ed68d054.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.89)
 (envelope-from <julien@xen.org>)
 id 1jP2d8-00036o-1Z; Thu, 16 Apr 2020 11:24:26 +0000
From: Julien Grall <julien@xen.org>
To: xen-devel@lists.xenproject.org
Subject: [[PATCH v3]] xen/guest_access: Harden *copy_to_guest_offset() to
 prevent const dest operand
Date: Thu, 16 Apr 2020 12:24:23 +0100
Message-Id: <20200416112423.25755-1-julien@xen.org>
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
Cc: Julien Grall <jgrall@amazon.com>, julien@xen.org,
 Jan Beulich <jbeulich@suse.com>
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
    Changes in v3:
        - Reduce the length of the comments and move it within the
        macro.

    Changes in v2:
        - Use a void * variable to check the handle is not const.
---
 xen/include/asm-arm/guest_access.h | 4 ++++
 xen/include/asm-x86/guest_access.h | 4 ++++
 2 files changed, 8 insertions(+)

diff --git a/xen/include/asm-arm/guest_access.h b/xen/include/asm-arm/guest_access.h
index 8997a1cbfe..97cf3384f1 100644
--- a/xen/include/asm-arm/guest_access.h
+++ b/xen/include/asm-arm/guest_access.h
@@ -78,6 +78,8 @@ int access_guest_memory_by_ipa(struct domain *d, paddr_t ipa, void *buf,
 #define copy_to_guest_offset(hnd, off, ptr, nr) ({      \
     const typeof(*(ptr)) *_s = (ptr);                   \
     char (*_d)[sizeof(*_s)] = (void *)(hnd).p;          \
+    /* Check if the handle is not const */              \
+    void *__maybe_unused _t = (hnd).p;                  \
     ((void)((hnd).p == (ptr)));                         \
     raw_copy_to_guest(_d+(off), _s, sizeof(*_s)*(nr));  \
 })
@@ -127,6 +129,8 @@ int access_guest_memory_by_ipa(struct domain *d, paddr_t ipa, void *buf,
 #define __copy_to_guest_offset(hnd, off, ptr, nr) ({    \
     const typeof(*(ptr)) *_s = (ptr);                   \
     char (*_d)[sizeof(*_s)] = (void *)(hnd).p;          \
+    /* Check if the handle is not const */              \
+    void *__maybe_unused _t = (hnd).p;                  \
     ((void)((hnd).p == (ptr)));                         \
     __raw_copy_to_guest(_d+(off), _s, sizeof(*_s)*(nr));\
 })
diff --git a/xen/include/asm-x86/guest_access.h b/xen/include/asm-x86/guest_access.h
index ca700c959a..6f5107951c 100644
--- a/xen/include/asm-x86/guest_access.h
+++ b/xen/include/asm-x86/guest_access.h
@@ -87,6 +87,8 @@
 #define copy_to_guest_offset(hnd, off, ptr, nr) ({      \
     const typeof(*(ptr)) *_s = (ptr);                   \
     char (*_d)[sizeof(*_s)] = (void *)(hnd).p;          \
+    /* Check if the handle is not const */              \
+    void *__maybe_unused _t = (hnd).p;                  \
     ((void)((hnd).p == (ptr)));                         \
     raw_copy_to_guest(_d+(off), _s, sizeof(*_s)*(nr));  \
 })
@@ -137,6 +139,8 @@
 #define __copy_to_guest_offset(hnd, off, ptr, nr) ({    \
     const typeof(*(ptr)) *_s = (ptr);                   \
     char (*_d)[sizeof(*_s)] = (void *)(hnd).p;          \
+    /* Check if the handle is not const */              \
+    void *__maybe_unused _t = (hnd).p;                  \
     ((void)((hnd).p == (ptr)));                         \
     __raw_copy_to_guest(_d+(off), _s, sizeof(*_s)*(nr));\
 })
-- 
2.17.1


