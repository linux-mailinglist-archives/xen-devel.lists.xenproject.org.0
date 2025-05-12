Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D39FAAB3D35
	for <lists+xen-devel@lfdr.de>; Mon, 12 May 2025 18:17:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.981829.1368240 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uEVpo-0006xN-4G; Mon, 12 May 2025 16:16:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 981829.1368240; Mon, 12 May 2025 16:16:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uEVpo-0006vF-09; Mon, 12 May 2025 16:16:56 +0000
Received: by outflank-mailman (input) for mailman id 981829;
 Mon, 12 May 2025 16:16:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zSlO=X4=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1uEVpm-0006v7-7R
 for xen-devel@lists.xenproject.org; Mon, 12 May 2025 16:16:54 +0000
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com
 [2607:f8b0:4864:20::42d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 821133ff-2f4c-11f0-9ffb-bf95429c2676;
 Mon, 12 May 2025 18:16:50 +0200 (CEST)
Received: by mail-pf1-x42d.google.com with SMTP id
 d2e1a72fcca58-7424c24f88bso2948569b3a.1
 for <xen-devel@lists.xenproject.org>; Mon, 12 May 2025 09:16:50 -0700 (PDT)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with UTF8SMTPSA id
 d2e1a72fcca58-74237a8f805sm6407121b3a.170.2025.05.12.09.16.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 May 2025 09:16:48 -0700 (PDT)
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
X-Inumbo-ID: 821133ff-2f4c-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1747066609; x=1747671409; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=nN/S4cK2LyFgxGlldWjXucgg0EQKtBoxU2FXSYhGWuw=;
        b=JZkFH+CUqfeilhhIrDyf8GeyYtmWNRYig4vFCc6wnwgfkOlLSVKvXUCtbxn4nzH2Nr
         U35+HhgOQlnkSh03I7mlHtOPS1fGo3T//R8VKcem0sWvFu19V3J+xsVv8pxueg8qWr77
         PPa7SM1eX7DSXZo04eu5Y2MVRe1pjEcZp129w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747066609; x=1747671409;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nN/S4cK2LyFgxGlldWjXucgg0EQKtBoxU2FXSYhGWuw=;
        b=kndwTZ6kSypChE4FjDit68t4X0fF/0c25Dwr47T5uCgbKlm51bZSXhNugWZdCrSlBP
         tgkzMGrlpdF8VilsSqLhNQtWSE3EVruHuaFtsE+945TxgSwGusAax77jlncQyN6A1F0B
         O9ZlV07Mky/VLSkIu8QhvFXb54+Aa1Jep/nNZSf5JpoAF3p/I3SWindMQaruul/T7O3M
         3QIcEieeSjdypYYGsJtsUlCsyqfwBnMNwChJzmjlqO9IuXcet+d6OD5NAz4tBuQy3Jh2
         AYWImJtZjRVt3JqU6X8Czqm/jNQRudQWmpuV4w/DCGqX/twQhvJUuzkJy0AEzdlb61t9
         EGfA==
X-Forwarded-Encrypted: i=1; AJvYcCWBMen2OaF9AfQ2JdY4K/BfVeURaxHhw9varCuXC4d1WrVjfy6ZnnVUJ6w3m1QNunY/9HgNsqBRHIw=@lists.xenproject.org
X-Gm-Message-State: AOJu0YySb8gvLuoiMKP2xFyCNjydAfuBUPQbUSzT/QMhvb5QtkyzgXGD
	1svFZWHMS8u8ATG+nKk3tmDq5/k7EJmhl4QT8bnCE0PVfpF/2xGvmVid4RfyqFY=
X-Gm-Gg: ASbGncvW2W2/H21SA+2kFhlSqimHTSZvgYRVOxgH35J5jF6yvBslQYAqiL6s1SNloGQ
	o/CANODB1/F4iIADrX1GtPZnx8Zz4vnS+pj8Aobr95ytYlB88xrEB4VECdJtFySqYseLyR9afJt
	9XGBHDUr6pr9BB8VqQb6eWe/xIhVZn1D4K5e/0eDWA1pTuqoi5vBxCQSVOdluwuNrDtQsx10LZg
	2Gk3Smx+VBudT0AnPGJY0p99g5DmTO/if1YffnsI1s9WVNKCTvjXd3d6LMFy/uvl00neepWwFS/
	UH5og1X1pbx3u9xbrgNhS0yhYZpMpA8R6AcaUnnBnSRiD9yg/9C4xXGE
X-Google-Smtp-Source: AGHT+IEzDQhrQsnDKcstSjrZA+fIg9XIH70ZRMYMvAo6RsBaOI1k/Dqiq37ekiLbLa5j2ahFagTpCw==
X-Received: by 2002:a05:6a00:3d43:b0:73e:23bb:e750 with SMTP id d2e1a72fcca58-7423c02cdcamr20611593b3a.23.1747066608721;
        Mon, 12 May 2025 09:16:48 -0700 (PDT)
Date: Mon, 12 May 2025 18:16:43 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: "Lira, Victor M" <VictorM.Lira@amd.com>
Cc: Jan Beulich <jbeulich@suse.com>, Jason Andryuk <jason.andryuk@amd.com>,
	Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	xen-devel@lists.xenproject.org,
	Andrew Cooper <andrew.cooper3@citrix.com>, Xenia.Ragiadakou@amd.com,
	Alejandro.GarciaVallejo@amd.com
Subject: Re: [RFC] xen/x86: allow overlaps with non-RAM regions
Message-ID: <aCIe60al7G7pfeUJ@macbook.lan>
References: <ce06ec74-1a73-4a02-87fc-3e829399cc77@amd.com>
 <aAnvRMgJxAskbCtE@macbook.lan>
 <aAoPNTsLjMMfsHvJ@mail-itl>
 <aAoW-kvpsWuPJwrC@macbook.lan>
 <775d3ac0-8f43-415a-a32d-14377092b96b@amd.com>
 <554026de-bbb4-488f-95c4-8e2f034d6d0e@amd.com>
 <aAtPpOq2Kc_N6hBy@macbook.lan>
 <2acad9ba-564a-4d18-9b09-dcabe8f7b025@suse.com>
 <aAttUBx57tds8WJJ@macbook.lan>
 <e5d464f3-6675-4fd6-a834-7f743fee668a@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <e5d464f3-6675-4fd6-a834-7f743fee668a@amd.com>

On Fri, Apr 25, 2025 at 09:47:57AM -0700, Lira, Victor M wrote:
> I can confirm with the patch the NVME drive can be accessed despite the "not
> mapping BAR" warning from Xen.
> Output log attached.

Thanks a lot for the test, and sorry for the delay in getting back.  I
was busy with other stuff and needed some time to figure out the best
way to deal with this.  Can you give a try to the patch below?  I hope
it will still fix the issue.

Thanks, Roger.
---
diff --git a/xen/arch/arm/include/asm/pci.h b/xen/arch/arm/include/asm/pci.h
index 7f77226c9bbf..1605ec660d0b 100644
--- a/xen/arch/arm/include/asm/pci.h
+++ b/xen/arch/arm/include/asm/pci.h
@@ -128,6 +128,9 @@ int pci_host_bridge_mappings(struct domain *d);
 
 bool pci_check_bar(const struct pci_dev *pdev, mfn_t start, mfn_t end);
 
+static inline int pci_sanitize_bar_memory(struct rangeset *r)
+{ return 0; }
+
 #else   /*!CONFIG_HAS_PCI*/
 
 struct pci_dev;
diff --git a/xen/arch/x86/include/asm/pci.h b/xen/arch/x86/include/asm/pci.h
index fd5480d67d43..d2701f2deb62 100644
--- a/xen/arch/x86/include/asm/pci.h
+++ b/xen/arch/x86/include/asm/pci.h
@@ -2,6 +2,7 @@
 #define __X86_PCI_H__
 
 #include <xen/mm.h>
+#include <xen/rangeset.h>
 
 #define CF8_BDF(cf8)     (  ((cf8) & 0x00ffff00U) >> 8)
 #define CF8_ADDR_LO(cf8) (   (cf8) & 0x000000fcU)
@@ -57,14 +58,7 @@ static always_inline bool is_pci_passthrough_enabled(void)
 
 void arch_pci_init_pdev(struct pci_dev *pdev);
 
-static inline bool pci_check_bar(const struct pci_dev *pdev,
-                                 mfn_t start, mfn_t end)
-{
-    /*
-     * Check if BAR is not overlapping with any memory region defined
-     * in the memory map.
-     */
-    return is_memory_hole(start, end);
-}
+bool pci_check_bar(const struct pci_dev *pdev, mfn_t start, mfn_t end);
+int pci_sanitize_bar_memory(struct rangeset *r);
 
 #endif /* __X86_PCI_H__ */
diff --git a/xen/arch/x86/pci.c b/xen/arch/x86/pci.c
index 97b792e578f1..de9ce76e1c8a 100644
--- a/xen/arch/x86/pci.c
+++ b/xen/arch/x86/pci.c
@@ -98,3 +98,56 @@ int pci_conf_write_intercept(unsigned int seg, unsigned int bdf,
 
     return rc;
 }
+
+bool pci_check_bar(const struct pci_dev *pdev, mfn_t start, mfn_t end)
+{
+    /*
+     * Check if BAR is not overlapping with any memory region defined
+     * in the memory map.
+     */
+    if ( !is_memory_hole(start, end) )
+        gdprintk(XENLOG_WARNING,
+                 "%pp: BAR at [%"PRI_mfn", %"PRI_mfn"] not in memory map hole\n",
+                 &pdev->sbdf, mfn_x(start), mfn_x(end));
+
+    /*
+     * Unconditionally return true, pci_sanitize_bar_memory() will remove any
+     * non-hole regions.
+     */
+    return true;
+}
+
+int pci_sanitize_bar_memory(struct rangeset *r)
+{
+    unsigned int i;
+
+    for ( i = 0; i < e820.nr_map; i++ )
+    {
+        const struct e820entry *entry = &e820.map[i];
+        int rc;
+
+        if ( !entry->size )
+            continue;
+
+        /*
+         * Remove overlaps with any memory ranges defined in the host memory
+         * map.
+         */
+        rc = rangeset_remove_range(r, PFN_DOWN(entry->addr),
+                                   PFN_DOWN(entry->addr + entry->size - 1));
+        if ( rc )
+            return rc;
+    }
+
+    return 0;
+}
+
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: "BSD"
+ * c-basic-offset: 4
+ * tab-width: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
diff --git a/xen/drivers/vpci/header.c b/xen/drivers/vpci/header.c
index ef6c965c081c..533e24ca3674 100644
--- a/xen/drivers/vpci/header.c
+++ b/xen/drivers/vpci/header.c
@@ -394,6 +394,14 @@ static int modify_bars(const struct pci_dev *pdev, uint16_t cmd, bool rom_only)
                 return rc;
             }
         }
+
+        rc = pci_sanitize_bar_memory(bar->mem);
+        if ( rc )
+        {
+            gprintk(XENLOG_WARNING, "%pp: failed to sanitize BAR memory: %d\n",
+                    &pdev->sbdf, rc);
+            return rc;
+        }
     }
 
     /* Remove any MSIX regions if present. */


