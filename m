Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D4074302B60
	for <lists+xen-devel@lfdr.de>; Mon, 25 Jan 2021 20:20:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.74354.133698 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l47P9-0002Hm-DN; Mon, 25 Jan 2021 19:20:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 74354.133698; Mon, 25 Jan 2021 19:20:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l47P9-0002Ex-0A; Mon, 25 Jan 2021 19:20:03 +0000
Received: by outflank-mailman (input) for mailman id 74354;
 Mon, 25 Jan 2021 19:20:00 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DTVL=G4=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1l47FG-0008N7-Ik
 for xen-devel@lists.xenproject.org; Mon, 25 Jan 2021 19:09:50 +0000
Received: from mail-wm1-x32a.google.com (unknown [2a00:1450:4864:20::32a])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 54e1574d-0cff-4cd0-a3d2-4f4dfbd2f06b;
 Mon, 25 Jan 2021 19:09:05 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id 190so404718wmz.0
 for <xen-devel@lists.xenproject.org>; Mon, 25 Jan 2021 11:09:05 -0800 (PST)
Received: from otyshchenko.www.tendawifi.com ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id k6sm12991031wro.27.2021.01.25.11.09.03
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 25 Jan 2021 11:09:04 -0800 (PST)
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
X-Inumbo-ID: 54e1574d-0cff-4cd0-a3d2-4f4dfbd2f06b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=XJ5PwD+gBkmZaN/B9jSk8lYAoHZ9OkzGDLF+hASZ6yI=;
        b=KmhCDvfatRhc71tGFTQX4nkHChngGSENcsKJt2izIcVCIV6Am/SDrJwD4AR/uKJ1xx
         DbWCugw4ho8Yj1zdkeJOLlImxKGUgX+tDnEPedcWbluhUgKmJLa7PXsdAodx+6bjRNvt
         mqqJQUXmXpNpdhcC/y0sSViD2SUxdYa+iqudDRTMWfAgLvN8MCDC8gIKOodptQKAP52B
         GzGPtqbnZIXFWzgW1J1NWs//cTMO2Y3IF+kDAmcmQ9Mn+8VbthrE/BhxVydjkwBojZ4i
         1FdspAH4dgq4aBMtWwqpYoQtGuPXJSv1/Z9PYUd55Qm2Hv+3m7CO9A3sQnMNWZnt0BqY
         VXyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=XJ5PwD+gBkmZaN/B9jSk8lYAoHZ9OkzGDLF+hASZ6yI=;
        b=F9/en+xAkNWR4omFYFytu4ZQilEjTw50Jjj5IVc1ePlP2agvhhmz6juDY6qsPCjmbh
         Cu3K5nRj0SHOmSt2Q07j+GTbg/iv2X3l1++nWSu8Y8w5Wq+5VHmrOjkWCA4S8hbqNgE9
         XS19ObgVNnmpcgJAI3NHKnOimfW3F7nsL7HzYDr/1dPpL3IlwjAV67b9uFgvOMHNuuNA
         ZoiKxNiMNW9/JtdNsyVCJ7ys6RdGr3jdgbNre7hcw38TcFht1xUGW6uceitxebwKw1Ce
         mE63rCZ/7DMbcluTXpeZ4JzWDSStfPJeVlEnRixTG4XtQZGmuV0rLF3xxOX88KVa3FP+
         D4Gg==
X-Gm-Message-State: AOAM533cMg+cJkgsi7XQwY0oTgtL8GQNzoxOWeTLPVeRf5/MWsnnkWP3
	cjOx6MJnggZ0m4zU0ka+ZFTqTULHm1aUzg==
X-Google-Smtp-Source: ABdhPJzmnPli3lOGk5X8VdadTB+eEwmbGIbFMGNRuUcrEoqH3VBWstVH3lJmMEyD9osn3jI+Dr7MQw==
X-Received: by 2002:a05:600c:21d8:: with SMTP id x24mr1443871wmj.27.1611601744646;
        Mon, 25 Jan 2021 11:09:04 -0800 (PST)
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
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Subject: [PATCH V5 11/22] xen/mm: Make x86's XENMEM_resource_ioreq_server handling common
Date: Mon, 25 Jan 2021 21:08:18 +0200
Message-Id: <1611601709-28361-12-git-send-email-olekstysh@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1611601709-28361-1-git-send-email-olekstysh@gmail.com>
References: <1611601709-28361-1-git-send-email-olekstysh@gmail.com>

From: Julien Grall <julien.grall@arm.com>

As x86 implementation of XENMEM_resource_ioreq_server can be
re-used on Arm later on, this patch makes it common and removes
arch_acquire_resource (and the corresponding option) as unneeded.

Also re-order #include-s alphabetically.

This support is going to be used on Arm to be able run device
emulator outside of Xen hypervisor.

Signed-off-by: Julien Grall <julien.grall@arm.com>
Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Reviewed-by: Jan Beulich <jbeulich@suse.com>
Reviewed-by: Paul Durrant <paul@xen.org>
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

Changes V4 -> V5:
   - add Paul's R-b
   - update patch description
   - remove ARCH_ACQUIRE_RESOURCE option, etc
---
---
 xen/arch/x86/Kconfig     |  1 -
 xen/arch/x86/mm.c        | 44 ---------------------------------
 xen/common/Kconfig       |  3 ---
 xen/common/memory.c      | 63 +++++++++++++++++++++++++++++++++++++++---------
 xen/include/asm-x86/mm.h |  4 ---
 xen/include/xen/mm.h     |  9 -------
 6 files changed, 51 insertions(+), 73 deletions(-)

diff --git a/xen/arch/x86/Kconfig b/xen/arch/x86/Kconfig
index ea9a9ea..abe0fce 100644
--- a/xen/arch/x86/Kconfig
+++ b/xen/arch/x86/Kconfig
@@ -6,7 +6,6 @@ config X86
 	select ACPI
 	select ACPI_LEGACY_TABLES_LOOKUP
 	select ARCH_SUPPORTS_INT128
-	select ARCH_ACQUIRE_RESOURCE
 	select COMPAT
 	select CORE_PARKING
 	select HAS_ALTERNATIVE
diff --git a/xen/arch/x86/mm.c b/xen/arch/x86/mm.c
index 59eb5c8..4366ea3 100644
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
diff --git a/xen/common/Kconfig b/xen/common/Kconfig
index cf32a07..fa049a6 100644
--- a/xen/common/Kconfig
+++ b/xen/common/Kconfig
@@ -22,9 +22,6 @@ config GRANT_TABLE
 
 	  If unsure, say Y.
 
-config ARCH_ACQUIRE_RESOURCE
-	bool
-
 config HAS_ALTERNATIVE
 	bool
 
diff --git a/xen/common/memory.c b/xen/common/memory.c
index ccb4d49..2f274a6 100644
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
@@ -1091,6 +1092,40 @@ static int acquire_grant_table(struct domain *d, unsigned int id,
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
@@ -1149,9 +1184,13 @@ static int acquire_resource(
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
 
diff --git a/xen/include/asm-x86/mm.h b/xen/include/asm-x86/mm.h
index 1fdb4eb..041c158 100644
--- a/xen/include/asm-x86/mm.h
+++ b/xen/include/asm-x86/mm.h
@@ -640,8 +640,4 @@ static inline bool arch_mfn_in_directmap(unsigned long mfn)
     return mfn <= (virt_to_mfn(eva - 1) + 1);
 }
 
-int arch_acquire_resource(struct domain *d, unsigned int type,
-                          unsigned int id, unsigned long frame,
-                          unsigned int nr_frames, xen_pfn_t mfn_list[]);
-
 #endif /* __ASM_X86_MM_H__ */
diff --git a/xen/include/xen/mm.h b/xen/include/xen/mm.h
index 636a125..667f9da 100644
--- a/xen/include/xen/mm.h
+++ b/xen/include/xen/mm.h
@@ -612,13 +612,4 @@ static inline void put_page_alloc_ref(struct page_info *page)
     }
 }
 
-#ifndef CONFIG_ARCH_ACQUIRE_RESOURCE
-static inline int arch_acquire_resource(
-    struct domain *d, unsigned int type, unsigned int id, unsigned long frame,
-    unsigned int nr_frames, xen_pfn_t mfn_list[])
-{
-    return -EOPNOTSUPP;
-}
-#endif /* !CONFIG_ARCH_ACQUIRE_RESOURCE */
-
 #endif /* __XEN_MM_H__ */
-- 
2.7.4


