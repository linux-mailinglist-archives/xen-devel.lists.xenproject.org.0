Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E928BA78D3A
	for <lists+xen-devel@lfdr.de>; Wed,  2 Apr 2025 13:37:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.935649.1337013 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tzwPF-0005Yt-V2; Wed, 02 Apr 2025 11:37:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 935649.1337013; Wed, 02 Apr 2025 11:37:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tzwPF-0005XR-SB; Wed, 02 Apr 2025 11:37:17 +0000
Received: by outflank-mailman (input) for mailman id 935649;
 Wed, 02 Apr 2025 11:37:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PNgW=WU=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1tzwPE-0005XL-6A
 for xen-devel@lists.xenproject.org; Wed, 02 Apr 2025 11:37:16 +0000
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com
 [2607:f8b0:4864:20::42a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d2be7ca8-0fb6-11f0-9ea9-5ba50f476ded;
 Wed, 02 Apr 2025 13:37:15 +0200 (CEST)
Received: by mail-pf1-x42a.google.com with SMTP id
 d2e1a72fcca58-73712952e1cso16587b3a.1
 for <xen-devel@lists.xenproject.org>; Wed, 02 Apr 2025 04:37:15 -0700 (PDT)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with UTF8SMTPSA id
 41be03b00d2f7-af93b6d6f77sm8173978a12.36.2025.04.02.04.37.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Apr 2025 04:37:13 -0700 (PDT)
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
X-Inumbo-ID: d2be7ca8-0fb6-11f0-9ea9-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1743593833; x=1744198633; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ixU0oqK5jbY2nPR4JZGgt/nTg2jny4RurPx7i/XkUWw=;
        b=WG8hewpDW6y228cGhbVjjVcfXTyo1BBHpwNf/fjvSwRIpBM/BNuEkZ6zMesQllMqzP
         /aSQCf3X+4kJg+/bOprOEyLBApMpneu97dTtPlDmoOn9hXv1KLwsxkXS9SJjdVIyS9d4
         OiMSCN+1OIsuPp3T79NtQsxOIskIpDk3islfc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743593833; x=1744198633;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ixU0oqK5jbY2nPR4JZGgt/nTg2jny4RurPx7i/XkUWw=;
        b=DTslPGrW8C5A6xT3GRhXYARf8RgSZZwCsvLhAZfHYhnLAbkA1oUzegb/xv4KOAdAOO
         +IqXvrHcLffDgT3IEJitxRf2llPDiF0DNIgPO/HzxjOGN8ITuJzk5/XmM6rzRqdjs4sg
         BGHAlWeSVEc5WJ0vFuVcZLXmAG0BALWjYfs7dwAsBsDIC+mL1FzL8fciN/Q9PLuWNcc3
         uxRl8mlwdPTX00/bOT1gnZ8rLd2KaQ/zwIcdqxlLzifZvRSEGXe+qdNe3BqvdqABjiLB
         pizVxCMKpACyVKFUrp49C335tTTR8a5/U1UPGTr0tokUC7sPMIbZiWGhdxsiCENR6msg
         1dhw==
X-Forwarded-Encrypted: i=1; AJvYcCX/cpY81/eULmPj+DRrGEH+37k2OOPCx9hhyvIpH8ULNribnGX4A06D4IjAP5VfoRK1skAJNYLxk2g=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzzU22X+keO7v4ec3Qk2hFFXbJ0E7MBHPstKNtUriUkIzlNlWyS
	4D0bAAaBjJmYyixEvDuj38mUvSZ8XlyIO7rotnYSCKQj7stNz0aHD599zSazFKg=
X-Gm-Gg: ASbGncvd25X/M/br3ZYz3LcfRvoYsjHCunvUApSLRBY9slKOY4mRQfbHPpjICRyBhip
	a6FKxUthCFpFQzzinLc46ZlPecR4YZ83DqYHi3hPggU40jTr7dShghP7ubycQdI+bOgu3qj+WXM
	rbvyV3e6GsZsUdgJ09MpgRpu493G22og4jL5ThldkzNTFtA9r091UCStns5AekdWhk03KW8LIk/
	9PoydIB6Zd38hIXKzf80nega0NCO58KStTowpvPKln5Ulo6V40SddqSlPwT1rCqQF2RrAHX3qdk
	ciSXUENuleBY+u7S+NEsTJ73Q6Fx+5splCmD1bF7z22ndczGyINsPRYYRXYS
X-Google-Smtp-Source: AGHT+IGIDNqLOf2aBjmE23vtRj3zY193A54lzODujE/OYAP6rZ4Xy3aIyLk/gK9APCDfp4CLMHy1Ow==
X-Received: by 2002:a05:6a20:9f99:b0:1f0:e42e:fb1d with SMTP id adf61e73a8af0-2009f79c23amr28543288637.36.1743593833636;
        Wed, 02 Apr 2025 04:37:13 -0700 (PDT)
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
Subject: [PATCH] x86/xen: fix balloon target initialization for PVH dom0
Date: Wed,  2 Apr 2025 13:36:55 +0200
Message-ID: <20250402113656.84673-1-roger.pau@citrix.com>
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
I think it's easier to unify the PV and PVH/HVM paths here regarding the
usage of get_num_physpages(), as otherwise the fix needs to add further PV
vs HVM divergences in both balloon_add_regions() and
arch_xen_unpopulated_init(), but it also has a higher risk of breaking PV
in subtle ways.
---
 arch/x86/xen/enlighten.c |  7 +++++++
 drivers/xen/balloon.c    | 19 +++++++++++--------
 2 files changed, 18 insertions(+), 8 deletions(-)

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
index 163f7f1d70f1..085d418ee6da 100644
--- a/drivers/xen/balloon.c
+++ b/drivers/xen/balloon.c
@@ -698,7 +698,15 @@ static void __init balloon_add_regions(void)
 		for (pfn = start_pfn; pfn < extra_pfn_end; pfn++)
 			balloon_append(pfn_to_page(pfn));
 
-		balloon_stats.total_pages += extra_pfn_end - start_pfn;
+		/*
+		 * Extra regions are accounted for in the physmap, but need
+		 * decreasing from current_pages to balloon down the initial
+		 * allocation, because they are already accounted for in
+		 * total_pages.
+		 */
+		BUG_ON(extra_pfn_end - start_pfn >=
+		       balloon_stats.current_pages);
+		balloon_stats.current_pages -= extra_pfn_end - start_pfn;
 	}
 }
 
@@ -711,13 +719,8 @@ static int __init balloon_init(void)
 
 	pr_info("Initialising balloon driver\n");
 
-#ifdef CONFIG_XEN_PV
-	balloon_stats.current_pages = xen_pv_domain()
-		? min(xen_start_info->nr_pages - xen_released_pages, max_pfn)
-		: get_num_physpages();
-#else
-	balloon_stats.current_pages = get_num_physpages();
-#endif
+	BUG_ON(xen_released_pages >= get_num_physpages());
+	balloon_stats.current_pages = get_num_physpages() - xen_released_pages;
 	balloon_stats.target_pages  = balloon_stats.current_pages;
 	balloon_stats.balloon_low   = 0;
 	balloon_stats.balloon_high  = 0;
-- 
2.48.1


