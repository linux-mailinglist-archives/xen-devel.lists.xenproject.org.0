Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EFA6FCB0D62
	for <lists+xen-devel@lfdr.de>; Tue, 09 Dec 2025 19:27:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1182113.1505047 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vT2Q9-0001wL-WD; Tue, 09 Dec 2025 18:26:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1182113.1505047; Tue, 09 Dec 2025 18:26:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vT2Q9-0001tz-Sq; Tue, 09 Dec 2025 18:26:45 +0000
Received: by outflank-mailman (input) for mailman id 1182113;
 Tue, 09 Dec 2025 18:26:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=T3Df=6P=citrix.com=andrew.cooper3@srs-se1.protection.inumbo.net>)
 id 1vT2Q7-0001t6-Vx
 for xen-devel@lists.xenproject.org; Tue, 09 Dec 2025 18:26:43 +0000
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [2a00:1450:4864:20::331])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9c41e0d2-d52c-11f0-b15b-2bf370ae4941;
 Tue, 09 Dec 2025 19:26:42 +0100 (CET)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-47a80d4a065so6109935e9.2
 for <xen-devel@lists.xenproject.org>; Tue, 09 Dec 2025 10:26:42 -0800 (PST)
Received: from localhost.localdomain (host-92-26-102-188.as13285.net.
 [92.26.102.188]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-42f7d222484sm33422334f8f.24.2025.12.09.10.26.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Dec 2025 10:26:41 -0800 (PST)
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
X-Inumbo-ID: 9c41e0d2-d52c-11f0-b15b-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1765304802; x=1765909602; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qgeu3O/7msTq+RISNhzvJM6a1GlYNkNz0h2icF9rS7o=;
        b=le1QSbtIXNpHV/j8+cq+9k4QXOhEf0NJ5xb5R4nTPahyIfDjsU5esdq4bHq5zn5qFu
         60pGwlyb7NSc+bMiNdiY+QaP+Kbae657CO9hZuoUohFHFdkxGWr37qAY5qGQKTbAV/Lh
         FniWNt3JLLS01REhv+89gabvQeCujqXWkUP/k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765304802; x=1765909602;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qgeu3O/7msTq+RISNhzvJM6a1GlYNkNz0h2icF9rS7o=;
        b=oYIjMKJisJEJ9tF+FOg3SAwN8QxbDQqx3yi+FNrtdlK7YUT/O9j+gvL7W2IFNodYNz
         WkvPNRFGvw5DmbjgyTqLFeiTiBsfVRdajW50KVKq/LQdYskeFbrlo5I1fYjHX0jEErSY
         dN9j1LS5l4pDwui1JTUmEtEgQbGB9n1vNTusDxU/LVqjDWdoWip9MzmVxpPsS2BHm38H
         bzqjAe419ddUJHlo9zVUsZoeC/wf+l0E1N9r4Mg7nC5sjXQVszZRaNQIJowQVQJ9qwaC
         Fa8pdOXX8JxN05VQp6CeYYvhg7g840y47yxQTtQZ5Ah6aecjTDqnmxaolEATh4YhIW0T
         kthw==
X-Gm-Message-State: AOJu0YyFDGZClPQ3tYGSY+jV112LYLbnxM7vBZN6UiS3pJYiRbLeLv+4
	wuJVCwKDRKT6CgYGxQ7crpbK48D9bWh1Z8LhBa8sHhdlojjX1suyPBJSIPRRVwwyO+BLayHjAg8
	UJc7C
X-Gm-Gg: ASbGnculdiBJH8CEdRZzKGARAqp0m24yo0HBCVbA8ff5g9Fxilm3QrLLiNN8F03eyKV
	ZaROUX82EOkQMX5oee2i/mH4Cx9UHDwjslw2BdCsynWlrLOGH0ygbyd14ThDEf+ZqQf6i8ieLPK
	Xr7oNpy4tnjQCUqJeT7DGk/FFwiHdRlP1mrOvcFxXtzeuHoOBZ+d7xwWXoUihkcXuvYirzZS/Sy
	kxpDfDRPhT+ZDb/xPYfZhNV4UOZW5BmxTjtdwOXgDxQH7CsMSvuSLeWeCXaSb23KS1XJYcO6VHb
	pd8cMGaZZckN5MR3mFdcsIWNrVpV+uh6Nb+0jcCw8SQwUhhl+VmJXcTeiDkJ6eURJwfiWqVTZ5r
	aPfxTOh0gukIoWdFJspvHTtPXiAJXd3gWNKkMU1zc0usJKmhsG1FlQ6rooXFH8x1viqBDU4aQVT
	L0J7i3e8fHD3eYmRHhEL3C0yugPFcAjEhwodu9c3123dm0kj57mL2b2JQ8eiyZAA==
X-Google-Smtp-Source: AGHT+IE35wsE3QIKMycmMi+jn5VAyMNL8EqgQOIZzhx3omT9CEYdt1JbuYd5/MrUaNof6LHS5cejwA==
X-Received: by 2002:a05:600c:5252:b0:477:7b16:5f9f with SMTP id 5b1f17b1804b1-47939e3a708mr133176575e9.31.1765304801779;
        Tue, 09 Dec 2025 10:26:41 -0800 (PST)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Grygorii Strashko <grygorii_strashko@epam.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH] x86/pv: Move hv_compat_vstart into pv_domain
Date: Tue,  9 Dec 2025 18:26:39 +0000
Message-Id: <20251209182639.2171895-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The hv_compat_vstart variable is hidden behind CONFIG_PV32 but lives in
arch_domain.  Moving it into pv_domain is an obvious improvement.

The value however is less obvious, and a mess.

In !PV32 builds, it's uniformly 0, but in PV32 builds it's ~0U (HVM guests),
__HYPERVISOR_COMPAT_VIRT_START (PV guests), or custom (PV32 dom0).  This seems
to work because uses are guarded behind is_pv32_{domain,vcpu}().

Simplify things by leaving it as 0 in PV32 builds for most domains,
initialising it in only in switch_compat() when a domain becomes 32bit PV.
dom0_construct() adjusts the value after calling switch_compat().

Suggested-by: Grygorii Strashko <grygorii_strashko@epam.com>
Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Grygorii Strashko <grygorii_strashko@epam.com>

Texturally, but not logically, depends on "[PATCH] x86/pv: Inline
domain_set_alloc_bitsize() into it's single caller"

Bloat-o-meter reports:

  add/remove: 0/0 grow/shrink: 0/2 up/down: 0/-65 (-65)
  Function                                     old     new   delta
  switch_compat                                472     463      -9
  arch_domain_create                          1056    1000     -56

The reason that switch_compat() gets smaller is because
MACH2PHYS_COMPAT_NR_ENTRIES(d) can now be calculated at compile time,
including the fls() thereof.
---
 xen/arch/x86/domain.c             | 5 -----
 xen/arch/x86/include/asm/config.h | 2 +-
 xen/arch/x86/include/asm/domain.h | 8 ++++----
 xen/arch/x86/pv/dom0_build.c      | 2 +-
 xen/arch/x86/pv/domain.c          | 2 ++
 5 files changed, 8 insertions(+), 11 deletions(-)

diff --git a/xen/arch/x86/domain.c b/xen/arch/x86/domain.c
index d33a42c8824c..5e37bfbd17d6 100644
--- a/xen/arch/x86/domain.c
+++ b/xen/arch/x86/domain.c
@@ -890,11 +890,6 @@ int arch_domain_create(struct domain *d,
     }
     d->arch.emulation_flags = emflags;
 
-#ifdef CONFIG_PV32
-    d->arch.hv_compat_vstart =
-        is_pv_domain(d) ? __HYPERVISOR_COMPAT_VIRT_START : ~0u;
-#endif
-
     spec_ctrl_init_domain(d);
 
     if ( (rc = paging_domain_init(d)) != 0 )
diff --git a/xen/arch/x86/include/asm/config.h b/xen/arch/x86/include/asm/config.h
index 156369695442..cc80f2c62310 100644
--- a/xen/arch/x86/include/asm/config.h
+++ b/xen/arch/x86/include/asm/config.h
@@ -201,7 +201,7 @@
 
 /* This is not a fixed value, just a lower limit. */
 #define __HYPERVISOR_COMPAT_VIRT_START 0xF5800000
-#define HYPERVISOR_COMPAT_VIRT_START(d) ((d)->arch.hv_compat_vstart)
+#define HYPERVISOR_COMPAT_VIRT_START(d) ((d)->arch.pv.hv_compat_vstart)
 
 #else /* !CONFIG_PV32 */
 
diff --git a/xen/arch/x86/include/asm/domain.h b/xen/arch/x86/include/asm/domain.h
index 386ec6174589..7e5cbd11a464 100644
--- a/xen/arch/x86/include/asm/domain.h
+++ b/xen/arch/x86/include/asm/domain.h
@@ -288,6 +288,10 @@ struct pv_domain
     /* Mitigate L1TF with shadow/crashing? */
     bool check_l1tf;
 
+#ifdef CONFIG_PV32
+    unsigned int hv_compat_vstart;
+#endif
+
     /* map_domain_page() mapping cache. */
     struct mapcache_domain mapcache;
 
@@ -315,10 +319,6 @@ struct arch_domain
 {
     struct page_info *perdomain_l3_pg;
 
-#ifdef CONFIG_PV32
-    unsigned int hv_compat_vstart;
-#endif
-
     /* Maximum physical-address bitwidth supported by this guest. */
     unsigned int physaddr_bitsize;
 
diff --git a/xen/arch/x86/pv/dom0_build.c b/xen/arch/x86/pv/dom0_build.c
index fed03dc15dcf..418b453ba8bf 100644
--- a/xen/arch/x86/pv/dom0_build.c
+++ b/xen/arch/x86/pv/dom0_build.c
@@ -521,7 +521,7 @@ static int __init dom0_construct(const struct boot_domain *bd)
                 printk("Dom0 expects too high a hypervisor start address\n");
                 return -ERANGE;
             }
-            d->arch.hv_compat_vstart =
+            d->arch.pv.hv_compat_vstart =
                 max_t(unsigned int, m2p_compat_vstart, value);
         }
 
diff --git a/xen/arch/x86/pv/domain.c b/xen/arch/x86/pv/domain.c
index 11db6a6d8396..ca5f6920516e 100644
--- a/xen/arch/x86/pv/domain.c
+++ b/xen/arch/x86/pv/domain.c
@@ -254,6 +254,8 @@ int switch_compat(struct domain *d)
             goto undo_and_fail;
     }
 
+    d->arch.pv.hv_compat_vstart = __HYPERVISOR_COMPAT_VIRT_START;
+
     if ( MACH2PHYS_COMPAT_NR_ENTRIES(d) < max_page )
         d->arch.physaddr_bitsize =
             /* 2^n entries can be contained in guest's p2m mapping space */
-- 
2.39.5


