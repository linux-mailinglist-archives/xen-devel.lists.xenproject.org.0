Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F239A05FDF
	for <lists+xen-devel@lfdr.de>; Wed,  8 Jan 2025 16:19:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.867493.1279120 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tVXq3-00036Z-5g; Wed, 08 Jan 2025 15:19:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 867493.1279120; Wed, 08 Jan 2025 15:19:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tVXq2-0002x2-HT; Wed, 08 Jan 2025 15:19:18 +0000
Received: by outflank-mailman (input) for mailman id 867493;
 Wed, 08 Jan 2025 15:19:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HyFE=UA=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1tVXpz-0008Ue-N1
 for xen-devel@lists.xenproject.org; Wed, 08 Jan 2025 15:19:15 +0000
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [2a00:1450:4864:20::530])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ead458f6-cdd3-11ef-99a4-01e77a169b0f;
 Wed, 08 Jan 2025 16:19:13 +0100 (CET)
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-5d3d14336f0so10201984a12.3
 for <xen-devel@lists.xenproject.org>; Wed, 08 Jan 2025 07:19:13 -0800 (PST)
Received: from localhost.localdomain ([66.81.170.107])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aac0eae71desm2488412166b.89.2025.01.08.07.19.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Jan 2025 07:19:12 -0800 (PST)
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
X-Inumbo-ID: ead458f6-cdd3-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1736349553; x=1736954353; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t3Cqxub2b0rcz5hsX+nKFFTBraQpc6Cf0wNJ5J2Y5Kk=;
        b=cOR7jUI+eFa3+6GqKNoZDW9t62TZUmubaP5YaQQs7ImmW3zr9En5TZdiKRrGTHIhgE
         VatN+IbZXyyUg3LJ69qV5fYS1KC1/QukHP4xiIiQaNW6oY/Lm6MmXAsKVkAbwvHB9eW7
         W+Liz95yF/wlb7Epy13g2732UIyf88a993vL4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736349553; x=1736954353;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=t3Cqxub2b0rcz5hsX+nKFFTBraQpc6Cf0wNJ5J2Y5Kk=;
        b=QkFCDD00ec2y29pv8ePj7/Qw2OOt+SxRFksgSkyYfq01A6NU4IsZ3LYGMTJZAg+TzS
         FZQW4lyLQBpm4tTGc6UCo+t6by3vsdJ/SfQZwnRNYkRk2fjbOCK8SkZ9jdc7Z7aYmKAF
         HHLCDJU9Uc28RG8A3qaMPrB8t99ZCUNq4yTvwOrPguaSGG76RWvhZ1FcFXAwJIoOZ/CF
         2Qhezkm1J0eDdTBkq+1GMOI+iy6PCKjLigLmNy6B0ogtOvLldavTmDUu8PDQH7kkh1yf
         5mJMYGkBrh07ForlKvBUhLduTHKQ5KZKcq4gbotUuPusflo6PAYexDjloWihEzXVCe8Y
         78uA==
X-Gm-Message-State: AOJu0Yz5br1KLIjODl8cSxZLvpim99Sj3C+LHqEPFXIuo9XvZCui8PBL
	53Kv4pH/DteJXFgwQRI73zT584FYYXYO9i0Z9XOmYC+fEDnYebLW6lAOPrHScRB6Hbi7Gm6yoLu
	l9MnlQQ==
X-Gm-Gg: ASbGnctj6efBGsPnNvXwCVYV3xU5ohpOR1KPV6hjG88yETjy15+DocYCZQAw4iXFDbT
	YolXx4djXAZwvSiAk/1DG7lR4WQ8cZYQJ/wjreL5GPIJVtIeds5iMwNJIGX47mLp+ZVyxRVmoJh
	+WMdRwe4Tl9k3ZB8pjjl9G7z1KIiYG7lG7Squ9N4VUGY2n/mS33uQH+RR59oxwP4syJDVtvtKVD
	Qo5NXJCZbpcUNCk3kP+Ol/EjuX2qsmbTVFCxQ5Z5RC6dy9PanWnjTwpojU6ojhcYr/Th9B7dHsN
	avY=
X-Google-Smtp-Source: AGHT+IHqrn/5VYtgEnnsa6k46BuFXzyBRGCwDHd32H/cc0VkKHYs5ezd33Pd3pAtPdvk2DJ4qBaqdQ==
X-Received: by 2002:a17:907:3f92:b0:aac:439:10ce with SMTP id a640c23a62f3a-ab2ab73e812mr245573266b.27.1736349552593;
        Wed, 08 Jan 2025 07:19:12 -0800 (PST)
From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Hongyan Xia <hongyxia@amazon.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Julien Grall <jgrall@amazon.com>,
	Elias El Yandouzi <eliasely@amazon.com>,
	Alejandro Vallejo <alejandro.vallejo@cloud.com>
Subject: [PATCH v5 11/15] x86/setup: Do not create valid mappings when directmap=no
Date: Wed,  8 Jan 2025 15:18:18 +0000
Message-ID: <20250108151822.16030-12-alejandro.vallejo@cloud.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250108151822.16030-1-alejandro.vallejo@cloud.com>
References: <20250108151822.16030-1-alejandro.vallejo@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Hongyan Xia <hongyxia@amazon.com>

Create empty mappings in the second e820 pass. Also, destroy existing
direct map mappings created in the first pass.

To make xenheap pages visible in guests, it is necessary to create empty
L3 tables in the direct map even when directmap=no, since guest cr3s
copy idle domain's L4 entries, which means they will share mappings in
the direct map if we pre-populate idle domain's L4 entries and L3
tables. A helper is introduced for this.

Also, after the direct map is actually gone, we need to stop updating
the direct map in update_xen_mappings().

Signed-off-by: Hongyan Xia <hongyxia@amazon.com>
Signed-off-by: Julien Grall <jgrall@amazon.com>
Signed-off-by: Elias El Yandouzi <eliasely@amazon.com>
Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>
---
v4->v5:
  * No changes.
---
 xen/arch/x86/setup.c | 73 +++++++++++++++++++++++++++++++++++++++-----
 1 file changed, 66 insertions(+), 7 deletions(-)

diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
index 609ec4cf07f2..23b77f13bc10 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -1060,6 +1060,56 @@ static struct domain *__init create_dom0(struct boot_info *bi)
     return d;
 }
 
+/*
+ * This either populates a valid direct map, or allocates empty L3 tables and
+ * creates the L4 entries for virtual address between [start, end) in the
+ * direct map depending on has_directmap();
+ *
+ * When directmap=no, we still need to populate empty L3 tables in the
+ * direct map region. The reason is that on-demand xenheap mappings are
+ * created in the idle domain's page table but must be seen by
+ * everyone. Since all domains share the direct map L4 entries, they
+ * will share xenheap mappings if we pre-populate the L4 entries and L3
+ * tables in the direct map region for all RAM. We also rely on the fact
+ * that L3 tables are never freed.
+ */
+static void __init populate_directmap(paddr_t pstart, paddr_t pend,
+                                      unsigned int flags)
+{
+    unsigned long vstart = (unsigned long)__va(pstart);
+    unsigned long vend = (unsigned long)__va(pend);
+
+    if ( pstart >= pend )
+        return;
+
+    BUG_ON(vstart < DIRECTMAP_VIRT_START);
+    BUG_ON(vend > DIRECTMAP_VIRT_END);
+
+    if ( has_directmap() )
+        /* Populate valid direct map. */
+        BUG_ON(map_pages_to_xen(vstart, maddr_to_mfn(pstart),
+                                PFN_DOWN(pend - pstart), flags));
+    else
+    {
+        /* Create empty L3 tables. */
+        unsigned long vaddr = vstart & ~((1UL << L4_PAGETABLE_SHIFT) - 1);
+
+        for ( unsigned long idx = l4_table_offset(vaddr);
+              idx <= l4_table_offset(vend); idx++ )
+        {
+            l4_pgentry_t *pl4e = &idle_pg_table[l4_table_offset(idx)];
+
+            if ( !(l4e_get_flags(*pl4e) & _PAGE_PRESENT) )
+            {
+                mfn_t mfn = alloc_boot_pages(1, 1);
+
+                clear_domain_page(mfn);
+                l4e_write(pl4e, l4e_from_mfn(mfn, __PAGE_HYPERVISOR));
+            }
+        }
+    }
+}
+
 /* How much of the directmap is prebuilt at compile time. */
 #define PREBUILT_MAP_LIMIT (1 << L2_PAGETABLE_SHIFT)
 
@@ -1681,8 +1731,17 @@ void asmlinkage __init noreturn __start_xen(void)
         map_e = min_t(uint64_t, e,
                       ARRAY_SIZE(l2_directmap) << L2_PAGETABLE_SHIFT);
 
-        /* Pass mapped memory to allocator /before/ creating new mappings. */
+        /*
+         * Pass mapped memory to allocator /before/ creating new mappings.
+         * The direct map for the bottom 4GiB has been populated in the first
+         * e820 pass. In the second pass, we make sure those existing mappings
+         * are destroyed when directmap=no.
+         */
         init_boot_pages(s, min(map_s, e));
+        if ( !has_directmap() )
+            destroy_xen_mappings((unsigned long)__va(s),
+                                 (unsigned long)__va(min(map_s, e)));
+
         s = map_s;
         if ( s < map_e )
         {
@@ -1690,6 +1749,9 @@ void asmlinkage __init noreturn __start_xen(void)
             map_s = (s + mask) & ~mask;
             map_e &= ~mask;
             init_boot_pages(map_s, map_e);
+            if ( !has_directmap() )
+                destroy_xen_mappings((unsigned long)__va(map_s),
+                                     (unsigned long)__va(map_e));
         }
 
         if ( map_s > map_e )
@@ -1703,8 +1765,7 @@ void asmlinkage __init noreturn __start_xen(void)
 
             if ( map_e < end )
             {
-                map_pages_to_xen((unsigned long)__va(map_e), maddr_to_mfn(map_e),
-                                 PFN_DOWN(end - map_e), PAGE_HYPERVISOR);
+                populate_directmap(map_e, end, PAGE_HYPERVISOR);
                 init_boot_pages(map_e, end);
                 map_e = end;
             }
@@ -1713,13 +1774,11 @@ void asmlinkage __init noreturn __start_xen(void)
         {
             /* This range must not be passed to the boot allocator and
              * must also not be mapped with _PAGE_GLOBAL. */
-            map_pages_to_xen((unsigned long)__va(map_e), maddr_to_mfn(map_e),
-                             PFN_DOWN(e - map_e), __PAGE_HYPERVISOR_RW);
+            populate_directmap(map_e, e, __PAGE_HYPERVISOR_RW);
         }
         if ( s < map_s )
         {
-            map_pages_to_xen((unsigned long)__va(s), maddr_to_mfn(s),
-                             PFN_DOWN(map_s - s), PAGE_HYPERVISOR);
+            populate_directmap(s, map_s, PAGE_HYPERVISOR);
             init_boot_pages(s, map_s);
         }
     }
-- 
2.47.1


