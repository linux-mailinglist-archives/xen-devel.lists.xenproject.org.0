Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B17FB2F3C04
	for <lists+xen-devel@lfdr.de>; Tue, 12 Jan 2021 22:59:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.66077.117268 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kzRgp-0003g9-O5; Tue, 12 Jan 2021 21:58:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 66077.117268; Tue, 12 Jan 2021 21:58:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kzRgp-0003eY-Aa; Tue, 12 Jan 2021 21:58:59 +0000
Received: by outflank-mailman (input) for mailman id 66077;
 Tue, 12 Jan 2021 21:58:57 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OoN1=GP=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1kzRc0-0002PK-IL
 for xen-devel@lists.xenproject.org; Tue, 12 Jan 2021 21:54:00 +0000
Received: from mail-wm1-x32f.google.com (unknown [2a00:1450:4864:20::32f])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8981ee5b-67c0-4834-8062-c0bc29ab2fb5;
 Tue, 12 Jan 2021 21:53:05 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id i63so3214278wma.4
 for <xen-devel@lists.xenproject.org>; Tue, 12 Jan 2021 13:53:05 -0800 (PST)
Received: from otyshchenko.www.tendawifi.com ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id 138sm6574053wma.41.2021.01.12.13.53.03
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 12 Jan 2021 13:53:04 -0800 (PST)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: 8981ee5b-67c0-4834-8062-c0bc29ab2fb5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=r9qMuj3+JjZCaIsXkfzjOZ+OYBXiWWkq8CnfFLTk3DQ=;
        b=LpKNcl8BGvU/LvQvGUTVfo9jJBWoWXWwi/1tC3C35Blx9EfAoTNGn+OdyWeq79GDmY
         CA1VYzPSWL0o2JMuH9nu0LXzuKOrAfg0Z3R+yNg9OH4iHBRYliYm6AQnBLgDuKjenAd9
         miV30NsoVkHNj+apN0VnVKVlVm3cLsJ4b2iXe00dqvfjELaAvAe8hYTzhud77ms1yDwL
         Hm4hOjP9tt6SZUktlukn9FbylmqlAAfHJs3pIszB48xHbPd9YIjoaPrUHy8rY3P8MLvf
         iBcvRFDKFXc/8O9aNBw7TmecSUF1LYK0yecSV9oJTUOOIv0lMnzauJ/YIDqL/kYLtAMf
         c0kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=r9qMuj3+JjZCaIsXkfzjOZ+OYBXiWWkq8CnfFLTk3DQ=;
        b=tUhMcq4K2CvJPZVezeY3HGKu98sT5CO9gxB3WBt4U0DQb9MtZCL4SJXiD5ogyzzJQv
         L8bxP/bmC82A7REzBbJlLfMSYE+UdiJboG6XuBV4fLfDkcYuUyjjd2rJkGJwE9KhlYNW
         vkprlhkJ4mnqIe/hcm23dTEQMorSlfn2O3mp+jUgDqAjv80veBpLAyYKBsNmwMQWrXRt
         hY+4uWWY2UH48sQewGtpcjlRBLBAlN0k5DkgXSPjAkxpCCZ5udPDSuaABtjCRwjTd8Kw
         iVhhluUjFdFNdMci5KZJ8HhpbCjEF0EMn8ILUSSGmGzLWmGAJtJfuJZK/SSIoELTQEOl
         LOSQ==
X-Gm-Message-State: AOAM531BnEl9ytoCwqKhknNIMJ/QSR7gbIJnabmYLP7v9GzOsIFuyk8l
	Q8QlIAfpvWdxdD/IkXPRvGktYuJ09iz73g==
X-Google-Smtp-Source: ABdhPJy5hPk56yWF1gDwGafXoyENIxy3TEKW6ihiULkChORQ1L2PBzJJ252f8E6nOwLtLGrn+UgzCA==
X-Received: by 2002:a1c:ac86:: with SMTP id v128mr1147523wme.76.1610488384787;
        Tue, 12 Jan 2021 13:53:04 -0800 (PST)
From: Oleksandr Tyshchenko <olekstysh@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Julien Grall <julien.grall@arm.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>,
	George Dunlap <george.dunlap@citrix.com>,
	Ian Jackson <iwj@xenproject.org>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Subject: [PATCH V4 11/24] xen/mm: Make x86's XENMEM_resource_ioreq_server handling common
Date: Tue, 12 Jan 2021 23:52:19 +0200
Message-Id: <1610488352-18494-12-git-send-email-olekstysh@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1610488352-18494-1-git-send-email-olekstysh@gmail.com>
References: <1610488352-18494-1-git-send-email-olekstysh@gmail.com>

From: Julien Grall <julien.grall@arm.com>

As x86 implementation of XENMEM_resource_ioreq_server can be
re-used on Arm later on, this patch makes it common and removes
arch_acquire_resource as unneeded.

Also re-order #include-s alphabetically.

This support is going to be used on Arm to be able run device
emulator outside of Xen hypervisor.

Signed-off-by: Julien Grall <julien.grall@arm.com>
Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Reviewed-by: Jan Beulich <jbeulich@suse.com>
[On Arm only]
Tested-by: Wei Chen <Wei.Chen@arm.com>

---
Please note, this is a split/cleanup/hardening of Julien's PoC:
"Add support for Guest IO forwarding to a device emulator"

Changes RFC -> V1:
   - no changes

Changes V1 -> V2:
   - update the author of a patch

Changes V2 -> V3:
   - don't wrap #include <xen/ioreq.h>
   - limit the number of #ifdef-s
   - re-order #include-s alphabetically

Changes V3 -> V4:
   - rebase
   - Add Jan's R-b
---
 xen/arch/x86/mm.c        | 44 ---------------------------------
 xen/common/memory.c      | 63 +++++++++++++++++++++++++++++++++++++++---------
 xen/include/asm-arm/mm.h |  8 ------
 xen/include/asm-x86/mm.h |  4 ---
 4 files changed, 51 insertions(+), 68 deletions(-)

diff --git a/xen/arch/x86/mm.c b/xen/arch/x86/mm.c
index f6e128e..54ac398 100644
--- a/xen/arch/x86/mm.c
+++ b/xen/arch/x86/mm.c
@@ -4587,50 +4587,6 @@ static int handle_iomem_range(unsigned long s, unsigned long e, void *p)
     return err || s > e ? err : _handle_iomem_range(s, e, p);
 }
 
-int arch_acquire_resource(struct domain *d, unsigned int type,
-                          unsigned int id, unsigned long frame,
-                          unsigned int nr_frames, xen_pfn_t mfn_list[])
-{
-    int rc;
-
-    switch ( type )
-    {
-#ifdef CONFIG_HVM
-    case XENMEM_resource_ioreq_server:
-    {
-        ioservid_t ioservid = id;
-        unsigned int i;
-
-        rc = -EINVAL;
-        if ( !is_hvm_domain(d) )
-            break;
-
-        if ( id != (unsigned int)ioservid )
-            break;
-
-        rc = 0;
-        for ( i = 0; i < nr_frames; i++ )
-        {
-            mfn_t mfn;
-
-            rc = hvm_get_ioreq_server_frame(d, id, frame + i, &mfn);
-            if ( rc )
-                break;
-
-            mfn_list[i] = mfn_x(mfn);
-        }
-        break;
-    }
-#endif
-
-    default:
-        rc = -EOPNOTSUPP;
-        break;
-    }
-
-    return rc;
-}
-
 long arch_memory_op(unsigned long cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
 {
     int rc;
diff --git a/xen/common/memory.c b/xen/common/memory.c
index b21b6c4..7e560b5 100644
--- a/xen/common/memory.c
+++ b/xen/common/memory.c
@@ -8,22 +8,23 @@
  */
 
 #include <xen/domain_page.h>
-#include <xen/types.h>
+#include <xen/errno.h>
+#include <xen/event.h>
+#include <xen/grant_table.h>
+#include <xen/guest_access.h>
+#include <xen/hypercall.h>
+#include <xen/iocap.h>
+#include <xen/ioreq.h>
 #include <xen/lib.h>
+#include <xen/mem_access.h>
 #include <xen/mm.h>
+#include <xen/numa.h>
+#include <xen/paging.h>
 #include <xen/param.h>
 #include <xen/perfc.h>
 #include <xen/sched.h>
-#include <xen/event.h>
-#include <xen/paging.h>
-#include <xen/iocap.h>
-#include <xen/guest_access.h>
-#include <xen/hypercall.h>
-#include <xen/errno.h>
-#include <xen/numa.h>
-#include <xen/mem_access.h>
 #include <xen/trace.h>
-#include <xen/grant_table.h>
+#include <xen/types.h>
 #include <asm/current.h>
 #include <asm/hardirq.h>
 #include <asm/p2m.h>
@@ -1090,6 +1091,40 @@ static int acquire_grant_table(struct domain *d, unsigned int id,
     return 0;
 }
 
+static int acquire_ioreq_server(struct domain *d,
+                                unsigned int id,
+                                unsigned long frame,
+                                unsigned int nr_frames,
+                                xen_pfn_t mfn_list[])
+{
+#ifdef CONFIG_IOREQ_SERVER
+    ioservid_t ioservid = id;
+    unsigned int i;
+    int rc;
+
+    if ( !is_hvm_domain(d) )
+        return -EINVAL;
+
+    if ( id != (unsigned int)ioservid )
+        return -EINVAL;
+
+    for ( i = 0; i < nr_frames; i++ )
+    {
+        mfn_t mfn;
+
+        rc = hvm_get_ioreq_server_frame(d, id, frame + i, &mfn);
+        if ( rc )
+            return rc;
+
+        mfn_list[i] = mfn_x(mfn);
+    }
+
+    return 0;
+#else
+    return -EOPNOTSUPP;
+#endif
+}
+
 static int acquire_resource(
     XEN_GUEST_HANDLE_PARAM(xen_mem_acquire_resource_t) arg)
 {
@@ -1148,9 +1183,13 @@ static int acquire_resource(
                                  mfn_list);
         break;
 
+    case XENMEM_resource_ioreq_server:
+        rc = acquire_ioreq_server(d, xmar.id, xmar.frame, xmar.nr_frames,
+                                  mfn_list);
+        break;
+
     default:
-        rc = arch_acquire_resource(d, xmar.type, xmar.id, xmar.frame,
-                                   xmar.nr_frames, mfn_list);
+        rc = -EOPNOTSUPP;
         break;
     }
 
diff --git a/xen/include/asm-arm/mm.h b/xen/include/asm-arm/mm.h
index f8ba49b..0b7de31 100644
--- a/xen/include/asm-arm/mm.h
+++ b/xen/include/asm-arm/mm.h
@@ -358,14 +358,6 @@ static inline void put_page_and_type(struct page_info *page)
 
 void clear_and_clean_page(struct page_info *page);
 
-static inline
-int arch_acquire_resource(struct domain *d, unsigned int type, unsigned int id,
-                          unsigned long frame, unsigned int nr_frames,
-                          xen_pfn_t mfn_list[])
-{
-    return -EOPNOTSUPP;
-}
-
 unsigned int arch_get_dma_bitsize(void);
 
 #endif /*  __ARCH_ARM_MM__ */
diff --git a/xen/include/asm-x86/mm.h b/xen/include/asm-x86/mm.h
index deeba75..859214e 100644
--- a/xen/include/asm-x86/mm.h
+++ b/xen/include/asm-x86/mm.h
@@ -639,8 +639,4 @@ static inline bool arch_mfn_in_directmap(unsigned long mfn)
     return mfn <= (virt_to_mfn(eva - 1) + 1);
 }
 
-int arch_acquire_resource(struct domain *d, unsigned int type,
-                          unsigned int id, unsigned long frame,
-                          unsigned int nr_frames, xen_pfn_t mfn_list[]);
-
 #endif /* __ASM_X86_MM_H__ */
-- 
2.7.4


