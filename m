Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A3E9872F672
	for <lists+xen-devel@lfdr.de>; Wed, 14 Jun 2023 09:35:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.548505.856481 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q9L2G-0007f6-1w; Wed, 14 Jun 2023 07:35:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 548505.856481; Wed, 14 Jun 2023 07:35:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q9L2F-0007bc-UX; Wed, 14 Jun 2023 07:35:19 +0000
Received: by outflank-mailman (input) for mailman id 548505;
 Wed, 14 Jun 2023 07:35:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=h8JF=CC=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1q9L2E-0007aV-3M
 for xen-devel@lists.xenproject.org; Wed, 14 Jun 2023 07:35:18 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 008c9f71-0a86-11ee-8611-37d641c3527e;
 Wed, 14 Jun 2023 09:35:14 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 73AED21857;
 Wed, 14 Jun 2023 07:35:14 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 20CA01391E;
 Wed, 14 Jun 2023 07:35:14 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id wH2bBrJtiWQyHwAAMHmgww
 (envelope-from <jgross@suse.com>); Wed, 14 Jun 2023 07:35:14 +0000
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
X-Inumbo-ID: 008c9f71-0a86-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1686728114; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YgJA17a1c7AVDrVoB4HwZlBuwIqmPEUlEc3gzIFv3pY=;
	b=SrM4IiLyt4N7guH1CZIQ0nKGj3L6b9HODrNWAv2YMcYoNAzVz4cSCZUEiGSmZnKipU46r4
	2rb0hubPsFyJGeQAp07phllcBHG8owzj2AAk30x9UBgKykWUiR7mPeWxvtj2r6yf+D8NcY
	MlCT16p+pawSJdSdangqU0dacCuGAAU=
From: Juergen Gross <jgross@suse.com>
To: linux-kernel@vger.kernel.org,
	x86@kernel.org
Cc: Juergen Gross <jgross@suse.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	xen-devel@lists.xenproject.org,
	Arnd Bergmann <arnd@kernel.org>
Subject: [PATCH v4 1/2] x86/xen: add prototypes for paravirt mmu functions
Date: Wed, 14 Jun 2023 09:35:00 +0200
Message-Id: <20230614073501.10101-2-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230614073501.10101-1-jgross@suse.com>
References: <20230614073501.10101-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The paravirt MMU functions called via the PV_CALLEE_SAVE_REGS_THUNK()
macro can't be defined to be static, as the macro is generating a
function via asm() statement calling the paravirt MMU function.

In order to avoid warnings when specifying "-Wmissing-prototypes" for
the build, add local prototypes (there should never be any external
caller of those functions).

Reported-by: Arnd Bergmann <arnd@kernel.org>
Signed-off-by: Juergen Gross <jgross@suse.com>
---
 arch/x86/xen/mmu_pv.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/x86/xen/mmu_pv.c b/arch/x86/xen/mmu_pv.c
index b3b8d289b9ab..e0a975165de7 100644
--- a/arch/x86/xen/mmu_pv.c
+++ b/arch/x86/xen/mmu_pv.c
@@ -86,6 +86,22 @@
 #include "mmu.h"
 #include "debugfs.h"
 
+/*
+ * Prototypes for functions called via PV_CALLEE_SAVE_REGS_THUNK() in order
+ * to avoid warnings with "-Wmissing-prototypes".
+ */
+pteval_t xen_pte_val(pte_t pte);
+pgdval_t xen_pgd_val(pgd_t pgd);
+pmdval_t xen_pmd_val(pmd_t pmd);
+pudval_t xen_pud_val(pud_t pud);
+p4dval_t xen_p4d_val(p4d_t p4d);
+pte_t xen_make_pte(pteval_t pte);
+pgd_t xen_make_pgd(pgdval_t pgd);
+pmd_t xen_make_pmd(pmdval_t pmd);
+pud_t xen_make_pud(pudval_t pud);
+p4d_t xen_make_p4d(p4dval_t p4d);
+pte_t xen_make_pte_init(pteval_t pte);
+
 #ifdef CONFIG_X86_VSYSCALL_EMULATION
 /* l3 pud for userspace vsyscall mapping */
 static pud_t level3_user_vsyscall[PTRS_PER_PUD] __page_aligned_bss;
-- 
2.35.3


