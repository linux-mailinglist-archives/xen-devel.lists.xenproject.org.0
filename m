Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 268DE8B3966
	for <lists+xen-devel@lfdr.de>; Fri, 26 Apr 2024 16:02:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.712821.1113690 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s0M97-00006E-Iw; Fri, 26 Apr 2024 14:01:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 712821.1113690; Fri, 26 Apr 2024 14:01:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s0M97-0008UY-7q; Fri, 26 Apr 2024 14:01:49 +0000
Received: by outflank-mailman (input) for mailman id 712821;
 Fri, 26 Apr 2024 14:01:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LIFE=L7=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1s0M95-0008CS-Hv
 for xen-devel@lists.xenproject.org; Fri, 26 Apr 2024 14:01:47 +0000
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [2a00:1450:4864:20::633])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 847220ec-03d5-11ef-b4bb-af5377834399;
 Fri, 26 Apr 2024 16:01:45 +0200 (CEST)
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-a556d22fa93so259910766b.3
 for <xen-devel@lists.xenproject.org>; Fri, 26 Apr 2024 07:01:45 -0700 (PDT)
Received: from andrewcoop.citrite.net (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 cd9-20020a170906b34900b00a5264576138sm10646714ejb.35.2024.04.26.07.01.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Apr 2024 07:01:44 -0700 (PDT)
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
X-Inumbo-ID: 847220ec-03d5-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1714140105; x=1714744905; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=veQcubcMyTJwESdhZazD648xU+qEXNmLcmOyg8n0kxM=;
        b=vZk8m4RHZPnB5zFFexR7CkcLjAgONhLRWxgf+aW2c+P974T1TuCKT35MpT829MAUft
         P6xCgxtmxzA1l1L3L5u0R7Eh49d7eIFT5EPf2qeremPP4EK/D6smxpbs3KPrMVJI69I9
         au8pPmyKYgFmEL0p/DcZ6Uu5V/RQSL9ongV4M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714140105; x=1714744905;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=veQcubcMyTJwESdhZazD648xU+qEXNmLcmOyg8n0kxM=;
        b=LG+tdoiXQIIohLjAvbuGX1FNFjGSqLJnQJU9RYT5QkTTjNpgnUk0kGpvhPMFjQxpjK
         hGAjF8/RmaKXy8sZVCYby1vtmZLmiL4Aqj4VGfKHzfx4kIcUKJLjlJHeLVmRacovyjBP
         2KVLDaJbkTVonkUoH5wj87UuSzV1Caf7UN1iwptvQ5IQAsDUCu5m/2bujw+kiZEOCEYe
         wOnIoc112YhRUCPGn4okvAZ6ivgTufBKF1dvRK2DWxVfhpluSWzQ3XjWQXjY+oFtplcm
         yM143xIOOZOk1LVThzcJRuAFFUm9jkxA0mPDw4bwyT5TQgGuo4zigPOWzp0FTZB0QsWS
         +13w==
X-Gm-Message-State: AOJu0YzoushOYVpIyJa5uKqLx6m1flMswPBNiXnsl+q13jKRXlggZ88r
	f/nswbcFXnCHynpamLq/j2uUisvnTfWa+pEhqEfIBe+2RHZwjJ7nN8ulCBKv6St93QfQFDZMAw3
	8
X-Google-Smtp-Source: AGHT+IEj8vXvCopGaO4X7dStaBJ9uvmEkLYNnY0dcfRkjLKnRFpM2yYWaQLzOc6QAsV0QYdMaNgRUA==
X-Received: by 2002:a17:906:fa98:b0:a52:36e1:c139 with SMTP id lt24-20020a170906fa9800b00a5236e1c139mr1682397ejb.4.1714140104904;
        Fri, 26 Apr 2024 07:01:44 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Daniel Smith <dpsmith@apertussolutions.com>,
	Christopher Clark <christopher.w.clark@gmail.com>
Subject: [PATCH 2/3] x86/boot: Explain discard_initial_images() and untangle PV initrd handling
Date: Fri, 26 Apr 2024 15:01:39 +0100
Message-Id: <20240426140140.465506-3-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240426140140.465506-1-andrew.cooper3@citrix.com>
References: <20240426140140.465506-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

discard_initial_images() frees the memory backing the boot modules.  It is
called by dom0_construct_pv{,h}(), but obtains the module list by global
pointer which is why there is no apparent link with the initrd pointer.

Generally, module contents are copied into dom0 as it's being built, but the
initrd for PV dom0 might be directly mapped instead of copied.

dom0_construct_pv() does it's own ad-hoc freeing of the module in the copy
case, and points the global reference at the new copy, then sets the size to
0.  This only functions because init_domheap_pages(x, x) happens to be a nop.

Delete the ad-hoc freeing, and leave it to discard_initial_images().  This
requires (not) adjusting initd->mod_start in the copy case, and only setting
the size to 0 in the mapping case.

Alter discard_initial_images() to explicitly check for an ignored module, and
explain what's going on.  This is more robust and will allow for fixing other
problems with module handling.

The later logic in dom0_construct_pv() now cannot use initrd->mod_start, but
that's fine because initrd_mfn is already a duplicate of the information
wanted, and is more consistent with initrd_{pfn,len} used elsewhere.

Invalidate the initrd pointer with LIST_POISON1 to make it clearer that it
shouldn't be used.

No practical change in behaviour, but a substantial reduction in the
complexity of how this works.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Daniel Smith <dpsmith@apertussolutions.com>
CC: Christopher Clark <christopher.w.clark@gmail.com>

In other akward questions, why does initial_images_nrpages() account for all
modules when only 1 or 2 are relevant for how we construct dom0 ?
---
 xen/arch/x86/pv/dom0_build.c | 22 +++++++++++-----------
 xen/arch/x86/setup.c         |  9 ++++++++-
 2 files changed, 19 insertions(+), 12 deletions(-)

diff --git a/xen/arch/x86/pv/dom0_build.c b/xen/arch/x86/pv/dom0_build.c
index d8043fa58a27..64d9984b8308 100644
--- a/xen/arch/x86/pv/dom0_build.c
+++ b/xen/arch/x86/pv/dom0_build.c
@@ -630,18 +630,20 @@ int __init dom0_construct_pv(struct domain *d,
                 }
             memcpy(page_to_virt(page), mfn_to_virt(initrd->mod_start),
                    initrd_len);
-            mpt_alloc = (paddr_t)initrd->mod_start << PAGE_SHIFT;
-            init_domheap_pages(mpt_alloc,
-                               mpt_alloc + PAGE_ALIGN(initrd_len));
-            initrd->mod_start = initrd_mfn = mfn_x(page_to_mfn(page));
+            initrd_mfn = mfn_x(page_to_mfn(page));
         }
         else
         {
             while ( count-- )
                 if ( assign_pages(mfn_to_page(_mfn(mfn++)), 1, d, 0) )
                     BUG();
+            /*
+             * Mapped rather than copied.  Tell discard_initial_images() to
+             * ignore it.
+             */
+            initrd->mod_end = 0;
         }
-        initrd->mod_end = 0;
+        initrd = LIST_POISON1; /* No longer valid to use. */
 
         iommu_memory_setup(d, "initrd", mfn_to_page(_mfn(initrd_mfn)),
                            PFN_UP(initrd_len), &flush_flags);
@@ -653,12 +655,10 @@ int __init dom0_construct_pv(struct domain *d,
     if ( domain_tot_pages(d) < nr_pages )
         printk(" (%lu pages to be allocated)",
                nr_pages - domain_tot_pages(d));
-    if ( initrd )
-    {
-        mpt_alloc = (paddr_t)initrd->mod_start << PAGE_SHIFT;
+    if ( initrd_len )
         printk("\n Init. ramdisk: %"PRIpaddr"->%"PRIpaddr,
-               mpt_alloc, mpt_alloc + initrd_len);
-    }
+               pfn_to_paddr(initrd_mfn),
+               pfn_to_paddr(initrd_mfn) + initrd_len);
 
     printk("\nVIRTUAL MEMORY ARRANGEMENT:\n");
     printk(" Loaded kernel: %p->%p\n", _p(vkern_start), _p(vkern_end));
@@ -881,7 +881,7 @@ int __init dom0_construct_pv(struct domain *d,
         if ( pfn >= initrd_pfn )
         {
             if ( pfn < initrd_pfn + PFN_UP(initrd_len) )
-                mfn = initrd->mod_start + (pfn - initrd_pfn);
+                mfn = initrd_mfn + (pfn - initrd_pfn);
             else
                 mfn -= PFN_UP(initrd_len);
         }
diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
index 59907fae095f..785a46a44995 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -294,7 +294,7 @@ unsigned long __init initial_images_nrpages(nodeid_t node)
     return nr;
 }
 
-void __init discard_initial_images(void)
+void __init discard_initial_images(void) /* a.k.a. free multiboot modules */
 {
     unsigned int i;
 
@@ -302,6 +302,13 @@ void __init discard_initial_images(void)
     {
         uint64_t start = (uint64_t)initial_images[i].mod_start << PAGE_SHIFT;
 
+        /*
+         * Sometimes the initrd is mapped, rather than copied, into dom0.
+         * end=0 signifies that we should leave it alone.
+         */
+        if ( initial_images[i].mod_end == 0 )
+            continue;
+
         init_domheap_pages(start,
                            start + PAGE_ALIGN(initial_images[i].mod_end));
     }
-- 
2.30.2


