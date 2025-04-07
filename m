Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 15FF1A7D7D2
	for <lists+xen-devel@lfdr.de>; Mon,  7 Apr 2025 10:29:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.939309.1339470 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u1hrI-0007CW-JK; Mon, 07 Apr 2025 08:29:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 939309.1339470; Mon, 07 Apr 2025 08:29:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u1hrI-0007AM-Gj; Mon, 07 Apr 2025 08:29:32 +0000
Received: by outflank-mailman (input) for mailman id 939309;
 Mon, 07 Apr 2025 08:29:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cV/f=WZ=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1u1hrG-0007AD-SR
 for xen-devel@lists.xenproject.org; Mon, 07 Apr 2025 08:29:30 +0000
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com
 [2607:f8b0:4864:20::632])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6c06d64c-138a-11f0-9eaa-5ba50f476ded;
 Mon, 07 Apr 2025 10:29:29 +0200 (CEST)
Received: by mail-pl1-x632.google.com with SMTP id
 d9443c01a7336-223f4c06e9fso35157215ad.1
 for <xen-devel@lists.xenproject.org>; Mon, 07 Apr 2025 01:29:29 -0700 (PDT)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with UTF8SMTPSA id
 d9443c01a7336-2297865e093sm75458025ad.132.2025.04.07.01.29.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Apr 2025 01:29:27 -0700 (PDT)
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
X-Inumbo-ID: 6c06d64c-138a-11f0-9eaa-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1744014568; x=1744619368; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hSdAs2f+FX9mxAdk7Px3JSEdrERFGwDr3y7nuD5w7Os=;
        b=eSGG0HhvriD38bJyCLEeG0T8MPocUfE2jxJCwpsXEoQPi+8byX8B7cbmQchwMyiH2J
         rGKmbwjqyyQFxu+smk/w0jLZH0J7d9k8vjJ4vETLIKg99yw10iREiyv20kHd8uVGjSCl
         rHfKsgyyRhzZYouGPbLf7LqRsyeIvzTvEIzdI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744014568; x=1744619368;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hSdAs2f+FX9mxAdk7Px3JSEdrERFGwDr3y7nuD5w7Os=;
        b=rSL4EqEfih+rhXyrx+sG+h0XqI0/wwh79eKSeM2ax/aluTkpFU9D7sVz9knLQiMFNA
         nt0ZT5nYOpHMs13iiWYJsvrA9s92s/bGB6wSmEfRFWbhkMWAqg5+d90TaWiR+sqNu6l2
         XZ6VUxx0GVYnB4NBV9I6ANAbzLe9Il1K/R/R74HoS+4Fznx6heKrLPqra12tO8McLaC1
         pjXGtoSqj7jAoVOH9MiotfXkpahWL/nF5xq++79W/ae5s14tEp2W1pkBPYcVzfsbr27w
         /4OIGFSxorC4DkRwvII8ScbGj0tpMOVYR3OgGtmE5IS/5FnPWhJ0UK1lITooB6ZJ8BFx
         3fig==
X-Forwarded-Encrypted: i=1; AJvYcCWmqXsOxsletlxXAw7Ueycr1xdlhBMq+vGc5w7wHWqiAf4J9r62kdDea8QFyoB0Xf4nfzuPeHclVG8=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxTCapGjh+cCx9CZ35l4wUjT2LeO52WC5YEkNtNY8VnbNn/qcKR
	78lN57Kk4hOZfHl1aCWJ9CGqi3fB7ssk/gUNlRic4OLrb3O+wN5qnQ97NYxDPKw=
X-Gm-Gg: ASbGnct72ENq2WwIGEbkdnvtPZyjDV0uMP5sLEWJSk2CmKKFnNeAJmgMSOYTt/Mjcey
	KAWTXIdVqflzEpyu0k/Qag6sJB6ht+E5/omnAHw1MnXe3o1HHXmJdn9zICsnm4LnDLvBURC+Bqi
	U9/pZFMM4Toy+gm/63PKu+F831d5isGJIx0uiPv72F2IgJaICGePSvGDAxJLmkRUHaajOm2HaIS
	IrhpdiHfaxxPKgK3v6pLX6iSVjzA/yEzUXQJDQOSkFm9HWfiLpW3UXdkbdbVC9Wo0PBbFDSIFVj
	p/ZFYsPb2RwnY7jHQ6wPK9N8XXaiYQfU89SfgNflpocKj4a70A==
X-Google-Smtp-Source: AGHT+IF0CSzr5MZm3MP3ECWI39e3e76OnxJJystHy5NBHpjYzkDs4iGYAsXV3wu+sJhREp3R/IAdWg==
X-Received: by 2002:a17:902:d487:b0:224:3994:8a8c with SMTP id d9443c01a7336-229765bd473mr177056685ad.8.1744014567961;
        Mon, 07 Apr 2025 01:29:27 -0700 (PDT)
From: Roger Pau Monne <roger.pau@citrix.com>
To: Juergen Gross <jgross@suse.com>,
	Roger Pau Monne <roger.pau@citrix.com>,
	xen-devel@lists.xenproject.org,
	linux-kernel@vger.kernel.org
Cc: stable@vger.kernel.org,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Subject: [PATCH v3] x86/xen: fix balloon target initialization for PVH dom0
Date: Mon,  7 Apr 2025 10:28:37 +0200
Message-ID: <20250407082838.65495-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

PVH dom0 re-uses logic from PV dom0, in which RAM ranges not assigned to
dom0 are re-used as scratch memory to map foreign and grant pages.  Such
logic relies on reporting those unpopulated ranges as RAM to Linux, and
mark them as reserved.  This way Linux creates the underlying page
structures required for metadata management.

Such approach works fine on PV because the initial balloon target is
calculated using specific Xen data, that doesn't take into account the
memory type changes described above.  However on HVM and PVH the initial
balloon target is calculated using get_num_physpages(), and that function
does take into account the unpopulated RAM regions used as scratch space
for remote domain mappings.

This leads to PVH dom0 having an incorrect initial balloon target, which
causes malfunction (excessive memory freeing) of the balloon driver if the
dom0 memory target is later adjusted from the toolstack.

Fix this by using xen_released_pages to account for any pages that are part
of the memory map, but are already unpopulated when the balloon driver is
initialized.  This accounts for any regions used for scratch remote
mappings.  Note on x86 xen_released_pages definition is moved to
enlighten.c so it's uniformly available for all Xen-enabled builds.

Take the opportunity to unify PV with PVH/HVM guests regarding the usage of
get_num_physpages(), as that avoids having to add different logic for PV vs
PVH in both balloon_add_regions() and arch_xen_unpopulated_init().

Much like a6aa4eb994ee, the code in this changeset should have been part of
38620fc4e893.

Fixes: a6aa4eb994ee ('xen/x86: add extra pages to unpopulated-alloc if available')
Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
Reviewed-by: Juergen Gross <jgross@suse.com>
Cc: stable@vger.kernel.org
---
Changes since v2:
 - For x86: Move xen_released_pages definition from setup.c (PV specific)
   to enlighten.c (shared between all guest modes).

Changes since v1:
 - Replace BUG_ON() with a WARN and failure to initialize the balloon
   driver.
---
 arch/x86/xen/enlighten.c | 10 ++++++++++
 arch/x86/xen/setup.c     |  3 ---
 drivers/xen/balloon.c    | 34 ++++++++++++++++++++++++----------
 3 files changed, 34 insertions(+), 13 deletions(-)

diff --git a/arch/x86/xen/enlighten.c b/arch/x86/xen/enlighten.c
index 43dcd8c7badc..1b7710bd0d05 100644
--- a/arch/x86/xen/enlighten.c
+++ b/arch/x86/xen/enlighten.c
@@ -70,6 +70,9 @@ EXPORT_SYMBOL(xen_start_flags);
  */
 struct shared_info *HYPERVISOR_shared_info = &xen_dummy_shared_info;
 
+/* Number of pages released from the initial allocation. */
+unsigned long xen_released_pages;
+
 static __ref void xen_get_vendor(void)
 {
 	init_cpu_devs();
@@ -466,6 +469,13 @@ int __init arch_xen_unpopulated_init(struct resource **res)
 			xen_free_unpopulated_pages(1, &pg);
 		}
 
+		/*
+		 * Account for the region being in the physmap but unpopulated.
+		 * The value in xen_released_pages is used by the balloon
+		 * driver to know how much of the physmap is unpopulated and
+		 * set an accurate initial memory target.
+		 */
+		xen_released_pages += xen_extra_mem[i].n_pfns;
 		/* Zero so region is not also added to the balloon driver. */
 		xen_extra_mem[i].n_pfns = 0;
 	}
diff --git a/arch/x86/xen/setup.c b/arch/x86/xen/setup.c
index c3db71d96c43..3823e52aef52 100644
--- a/arch/x86/xen/setup.c
+++ b/arch/x86/xen/setup.c
@@ -37,9 +37,6 @@
 
 #define GB(x) ((uint64_t)(x) * 1024 * 1024 * 1024)
 
-/* Number of pages released from the initial allocation. */
-unsigned long xen_released_pages;
-
 /* Memory map would allow PCI passthrough. */
 bool xen_pv_pci_possible;
 
diff --git a/drivers/xen/balloon.c b/drivers/xen/balloon.c
index 163f7f1d70f1..ee165f4f7fe6 100644
--- a/drivers/xen/balloon.c
+++ b/drivers/xen/balloon.c
@@ -675,7 +675,7 @@ void xen_free_ballooned_pages(unsigned int nr_pages, struct page **pages)
 }
 EXPORT_SYMBOL(xen_free_ballooned_pages);
 
-static void __init balloon_add_regions(void)
+static int __init balloon_add_regions(void)
 {
 	unsigned long start_pfn, pages;
 	unsigned long pfn, extra_pfn_end;
@@ -698,26 +698,38 @@ static void __init balloon_add_regions(void)
 		for (pfn = start_pfn; pfn < extra_pfn_end; pfn++)
 			balloon_append(pfn_to_page(pfn));
 
-		balloon_stats.total_pages += extra_pfn_end - start_pfn;
+		/*
+		 * Extra regions are accounted for in the physmap, but need
+		 * decreasing from current_pages to balloon down the initial
+		 * allocation, because they are already accounted for in
+		 * total_pages.
+		 */
+		if (extra_pfn_end - start_pfn >= balloon_stats.current_pages) {
+			WARN(1, "Extra pages underflow current target");
+			return -ERANGE;
+		}
+		balloon_stats.current_pages -= extra_pfn_end - start_pfn;
 	}
+
+	return 0;
 }
 
 static int __init balloon_init(void)
 {
 	struct task_struct *task;
+	int rc;
 
 	if (!xen_domain())
 		return -ENODEV;
 
 	pr_info("Initialising balloon driver\n");
 
-#ifdef CONFIG_XEN_PV
-	balloon_stats.current_pages = xen_pv_domain()
-		? min(xen_start_info->nr_pages - xen_released_pages, max_pfn)
-		: get_num_physpages();
-#else
-	balloon_stats.current_pages = get_num_physpages();
-#endif
+	if (xen_released_pages >= get_num_physpages()) {
+		WARN(1, "Released pages underflow current target");
+		return -ERANGE;
+	}
+
+	balloon_stats.current_pages = get_num_physpages() - xen_released_pages;
 	balloon_stats.target_pages  = balloon_stats.current_pages;
 	balloon_stats.balloon_low   = 0;
 	balloon_stats.balloon_high  = 0;
@@ -734,7 +746,9 @@ static int __init balloon_init(void)
 	register_sysctl_init("xen/balloon", balloon_table);
 #endif
 
-	balloon_add_regions();
+	rc = balloon_add_regions();
+	if (rc)
+		return rc;
 
 	task = kthread_run(balloon_thread, NULL, "xen-balloon");
 	if (IS_ERR(task)) {
-- 
2.48.1


