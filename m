Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 335EB198462
	for <lists+xen-devel@lfdr.de>; Mon, 30 Mar 2020 21:25:33 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jIzzA-0005wt-5v; Mon, 30 Mar 2020 19:22:12 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=TZrn=5P=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1jIzz8-0005wo-5k
 for xen-devel@lists.xenproject.org; Mon, 30 Mar 2020 19:22:10 +0000
X-Inumbo-ID: bf42d45a-72bb-11ea-b9f4-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id bf42d45a-72bb-11ea-b9f4-12813bfff9fa;
 Mon, 30 Mar 2020 19:22:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
 Sender:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=m6d++yISFYoabczO21ysTR9r+GhnJXbvqXk0ITsPtjo=; b=CRq9bVLPhYr/5ywgpu35lYfrCq
 XihjmGslycLYzQhv117hy3z2K8TYeOD1/D5zjZe1fDtH3qJ0YyTqtTPL0U92tDmU94hdS3kSzhuWx
 gYQcvWvk5K/6bI1b4fNymdAoOgfxqAoM5FwuuvdQFRneHwNYTG9hWDpGy0DoS2sN+5Kk=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <julien@xen.org>)
 id 1jIzz5-0003l1-M9; Mon, 30 Mar 2020 19:22:07 +0000
Received: from 54-240-197-235.amazon.com ([54.240.197.235]
 helo=ufe34d9ed68d054.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.89)
 (envelope-from <julien@xen.org>)
 id 1jIzz5-0007AJ-DC; Mon, 30 Mar 2020 19:22:07 +0000
From: Julien Grall <julien@xen.org>
To: xen-devel@lists.xenproject.org
Date: Mon, 30 Mar 2020 20:21:50 +0100
Message-Id: <20200330192157.1335-2-julien@xen.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200330192157.1335-1-julien@xen.org>
References: <20200330192157.1335-1-julien@xen.org>
Subject: [Xen-devel] [PATCH 1/8] xen/guest_access: Harden
 copy_to_guest_offset to prevent const dest operand
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Julien Grall <jgrall@amazon.com>, dfaggioli@suse.com,
 Jan Beulich <jbeulich@suse.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

From: Julien Grall <jgrall@amazon.com>

At the moment, copy_to_guest_offset() will allow the hypervisor to copy
data to guest handle marked const.

Thankfully, no users of the helper will do that. Rather than hoping this
can be caught during review, harden copy_to_guest_offset() so the build
will fail if such users are introduced.

Signed-off-by: Julien Grall <jgrall@amazon.com>
---
 xen/include/asm-arm/guest_access.h | 2 +-
 xen/include/asm-x86/guest_access.h | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/xen/include/asm-arm/guest_access.h b/xen/include/asm-arm/guest_access.h
index 8997a1cbfe..ff2eec237d 100644
--- a/xen/include/asm-arm/guest_access.h
+++ b/xen/include/asm-arm/guest_access.h
@@ -126,7 +126,7 @@ int access_guest_memory_by_ipa(struct domain *d, paddr_t ipa, void *buf,
 
 #define __copy_to_guest_offset(hnd, off, ptr, nr) ({    \
     const typeof(*(ptr)) *_s = (ptr);                   \
-    char (*_d)[sizeof(*_s)] = (void *)(hnd).p;          \
+    typeof(*((hnd).p)) *_d = (hnd).p;                   \
     ((void)((hnd).p == (ptr)));                         \
     __raw_copy_to_guest(_d+(off), _s, sizeof(*_s)*(nr));\
 })
diff --git a/xen/include/asm-x86/guest_access.h b/xen/include/asm-x86/guest_access.h
index ca700c959a..2693c6540b 100644
--- a/xen/include/asm-x86/guest_access.h
+++ b/xen/include/asm-x86/guest_access.h
@@ -86,7 +86,7 @@
  */
 #define copy_to_guest_offset(hnd, off, ptr, nr) ({      \
     const typeof(*(ptr)) *_s = (ptr);                   \
-    char (*_d)[sizeof(*_s)] = (void *)(hnd).p;          \
+    typeof(*((hnd).p)) *_d = (hnd).p;                   \
     ((void)((hnd).p == (ptr)));                         \
     raw_copy_to_guest(_d+(off), _s, sizeof(*_s)*(nr));  \
 })
-- 
2.17.1


