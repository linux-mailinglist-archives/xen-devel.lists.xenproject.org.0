Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B3336A7BDFF
	for <lists+xen-devel@lfdr.de>; Fri,  4 Apr 2025 15:37:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.938207.1339139 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u0hD9-00028h-Bj; Fri, 04 Apr 2025 13:35:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 938207.1339139; Fri, 04 Apr 2025 13:35:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u0hD9-00026V-8W; Fri, 04 Apr 2025 13:35:55 +0000
Received: by outflank-mailman (input) for mailman id 938207;
 Fri, 04 Apr 2025 13:35:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=C8GG=WW=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1u0hD7-00026N-Bn
 for xen-devel@lists.xenproject.org; Fri, 04 Apr 2025 13:35:53 +0000
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [2a00:1450:4864:20::52d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ba4409d6-1159-11f0-9eaa-5ba50f476ded;
 Fri, 04 Apr 2025 15:35:52 +0200 (CEST)
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-5e677f59438so3237085a12.2
 for <xen-devel@lists.xenproject.org>; Fri, 04 Apr 2025 06:35:52 -0700 (PDT)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with UTF8SMTPSA id
 a640c23a62f3a-ac7c01c1085sm253747966b.183.2025.04.04.06.35.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Apr 2025 06:35:51 -0700 (PDT)
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
X-Inumbo-ID: ba4409d6-1159-11f0-9eaa-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1743773752; x=1744378552; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7zMVCjKwCi74UMVT2Q8AVcMCSyrZzJQzum19Wgp9Wls=;
        b=G/8OAaRSf/EGEBA8ExySYSEhkCDck64ZXPHODmkaosH8bE7i50tSAaASe2BALh+y46
         03U5g37JNy1fA+jk/fWUOm2R8ZmfGloeaMwgI1Z6Ie1cp73M7WtYxFugYsnnWFW+aV/1
         3HhRqb0GRfC6N+v5mdCG3d0ZZC527FdEbwaZQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743773752; x=1744378552;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7zMVCjKwCi74UMVT2Q8AVcMCSyrZzJQzum19Wgp9Wls=;
        b=Rnz7BcVJVWlN8sq5NvaU3QyPcqED9ntsMMcEOh0bqsRUSHvxZyAhQw970EX7HYV/yh
         As/IoI2K0cNnvndbr8f+WckuBpGHLx+8YF+u8ZQJOggQ6J782I0YgNY2/IsENZv3y3F0
         HgnqhL5QNds0+WMhQC4dwmtnJMdyufmHZ0VnKfnlkeLGBGKWhn6fVNK0nBh7B6LRKKcf
         x3VHFGZUa3v5KXsRDNfd7EVsGoqeO6Pq2jd5gRrOTQ0u49RAQ/NOOfsG3LMfKEz8EZhy
         Gqos0HypiJ3S7WwD+MOcAky4GiYAZ6iazKS11APLH8A6aDKH1nwhRnCt6Pd3gNMzg87g
         2nog==
X-Forwarded-Encrypted: i=1; AJvYcCW3FhgeRpVKbLHHgNCvpU5edlumhaEXKVRqHLOnb9uCqF7daY1Tsp3Jk7lrWsA+eD8X8Tauc2QMkMM=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yypm4NtL1s3GH0voChk2eYVNr6uEocFx2RF9h2J24Atoh9dnl2G
	C2FprmiCn8sG5pev2GfwHQ56tfpNPmbqrSe/FQcwnizhnb95qq7lyRlMOCh0EIw=
X-Gm-Gg: ASbGncuqLA1MOD5MrWHCtd+xCHiswGyHqy9oWUCD11040D0OatupUPNrX0XegpyMsUT
	2yfYpkjJMyW8NAQwP1mR/RxBxy6QFrUtDwiP7Nx7eWD1rZE2mdRawK8fe6diFd+rO5zkM+huTuG
	VMruZK7Aw/qE9jbhk9s2JxHApQYYotDA+YspNduEtVqOu0wm0iOVYa9Nh++Xc2EOAeLWozr8TiE
	eF/kox0xGBeCdCWNxUfMMU1WmCNx8Y2zSLIwu63bKwNeylYH2ecdXgwWIcZxtqTMx5wtmixplPl
	fhvaoFGqaQPhXmHBHKJ05VWQcmZMQRWfJufZF19dndcAWzFbyA==
X-Google-Smtp-Source: AGHT+IFSKCngGbRbwdtl+C7MsVBdbETjJAdfQeZKdojq/dV5G705u6R+N4qeFiZ9coPdcBWaR16zzw==
X-Received: by 2002:a17:907:3d8d:b0:ac7:391a:e2d4 with SMTP id a640c23a62f3a-ac7d6e9fe27mr218999966b.59.1743773751706;
        Fri, 04 Apr 2025 06:35:51 -0700 (PDT)
From: Roger Pau Monne <roger.pau@citrix.com>
To: Juergen Gross <jgross@suse.com>,
	Roger Pau Monne <roger.pau@citrix.com>,
	xen-devel@lists.xenproject.org,
	linux-kernel@vger.kernel.org
Cc: Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Subject: [PATCH v2] x86/xen: fix balloon target initialization for PVH dom0
Date: Fri,  4 Apr 2025 15:34:58 +0200
Message-ID: <20250404133459.16125-1-roger.pau@citrix.com>
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
mappings.

Take the opportunity to unify PV with PVH/HVM guests regarding the usage of
get_num_physpages(), as that avoids having to add different logic for PV vs
PVH in both balloon_add_regions() and arch_xen_unpopulated_init().

Much like a6aa4eb994ee, the code in this changeset should have been part of
38620fc4e893.

Fixes: a6aa4eb994ee ('xen/x86: add extra pages to unpopulated-alloc if available')
Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
Changes since v1:
 - Replace BUG_ON() with a WARN and failure to initialize the balloon
   driver.
---
 arch/x86/xen/enlighten.c |  7 +++++++
 drivers/xen/balloon.c    | 34 ++++++++++++++++++++++++----------
 2 files changed, 31 insertions(+), 10 deletions(-)

diff --git a/arch/x86/xen/enlighten.c b/arch/x86/xen/enlighten.c
index 43dcd8c7badc..651bb206434c 100644
--- a/arch/x86/xen/enlighten.c
+++ b/arch/x86/xen/enlighten.c
@@ -466,6 +466,13 @@ int __init arch_xen_unpopulated_init(struct resource **res)
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


