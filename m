Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3537143DCC8
	for <lists+xen-devel@lfdr.de>; Thu, 28 Oct 2021 10:13:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.217723.377886 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mg0WW-0004az-C7; Thu, 28 Oct 2021 08:12:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 217723.377886; Thu, 28 Oct 2021 08:12:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mg0WW-0004Z1-7z; Thu, 28 Oct 2021 08:12:32 +0000
Received: by outflank-mailman (input) for mailman id 217723;
 Thu, 28 Oct 2021 08:12:31 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=vfrR=PQ=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1mg0WU-00041u-TR
 for xen-devel@lists.xenproject.org; Thu, 28 Oct 2021 08:12:30 +0000
Received: from smtp-out2.suse.de (unknown [195.135.220.29])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5daee37d-a544-4438-9282-357a0ff238fd;
 Thu, 28 Oct 2021 08:12:25 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 07CF41FD4F;
 Thu, 28 Oct 2021 08:12:25 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id B678814083;
 Thu, 28 Oct 2021 08:12:24 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id CK1RK2hbemE/MQAAMHmgww
 (envelope-from <jgross@suse.com>); Thu, 28 Oct 2021 08:12:24 +0000
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
X-Inumbo-ID: 5daee37d-a544-4438-9282-357a0ff238fd
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1635408745; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dqnayNM2vGd2Nrg8Q8qI72d6PyZbBY3HiH0gFXYcd+Y=;
	b=BXb9x2kWX32ZD+ibkO+u1SI6k7/MiU42TziCvwCnK6bY2CW2BUuJTmX90k2dYpTMlzNZz/
	7i6vxJGKz8/7y1Hwj4C5OncMAvmb+xf06mYWq6vciW1LQPlr0Eic5whbcU6Kl6gEERsQQ4
	YOp9GpFxlPrjYfE4Z+5OPdo6fsWubzg=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org,
	x86@kernel.org,
	linux-kernel@vger.kernel.org
Cc: Juergen Gross <jgross@suse.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>
Subject: [PATCH 3/4] xen: remove highmem remnants
Date: Thu, 28 Oct 2021 10:12:20 +0200
Message-Id: <20211028081221.2475-4-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20211028081221.2475-1-jgross@suse.com>
References: <20211028081221.2475-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There are some references to highmem left in Xen pv specific code which
can be removed.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 arch/x86/xen/enlighten_pv.c | 7 -------
 arch/x86/xen/mmu_pv.c       | 1 -
 2 files changed, 8 deletions(-)

diff --git a/arch/x86/xen/enlighten_pv.c b/arch/x86/xen/enlighten_pv.c
index a7b7d674f500..fe19a398bc00 100644
--- a/arch/x86/xen/enlighten_pv.c
+++ b/arch/x86/xen/enlighten_pv.c
@@ -27,7 +27,6 @@
 #include <linux/export.h>
 #include <linux/mm.h>
 #include <linux/page-flags.h>
-#include <linux/highmem.h>
 #include <linux/pci.h>
 #include <linux/gfp.h>
 #include <linux/edd.h>
@@ -1245,12 +1244,6 @@ asmlinkage __visible void __init xen_start_kernel(void)
 	__supported_pte_mask &= ~_PAGE_GLOBAL;
 	__default_kernel_pte_mask &= ~_PAGE_GLOBAL;
 
-	/*
-	 * Prevent page tables from being allocated in highmem, even
-	 * if CONFIG_HIGHPTE is enabled.
-	 */
-	__userpte_alloc_gfp &= ~__GFP_HIGHMEM;
-
 	/* Get mfn list */
 	xen_build_dynamic_phys_to_machine();
 
diff --git a/arch/x86/xen/mmu_pv.c b/arch/x86/xen/mmu_pv.c
index 3359c23573c5..793870fb942a 100644
--- a/arch/x86/xen/mmu_pv.c
+++ b/arch/x86/xen/mmu_pv.c
@@ -41,7 +41,6 @@
  * Jeremy Fitzhardinge <jeremy@xensource.com>, XenSource Inc, 2007
  */
 #include <linux/sched/mm.h>
-#include <linux/highmem.h>
 #include <linux/debugfs.h>
 #include <linux/bug.h>
 #include <linux/vmalloc.h>
-- 
2.26.2


