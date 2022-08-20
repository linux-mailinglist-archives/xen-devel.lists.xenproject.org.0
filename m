Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 316DF59ACD7
	for <lists+xen-devel@lfdr.de>; Sat, 20 Aug 2022 11:26:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.390682.628225 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oPKjf-0007Q4-8j; Sat, 20 Aug 2022 09:25:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 390682.628225; Sat, 20 Aug 2022 09:25:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oPKjf-0007Jq-1x; Sat, 20 Aug 2022 09:25:43 +0000
Received: by outflank-mailman (input) for mailman id 390682;
 Sat, 20 Aug 2022 09:25:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=cfLG=YY=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1oPKjc-0006NL-KS
 for xen-devel@lists.xenproject.org; Sat, 20 Aug 2022 09:25:40 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [2001:67c:2178:6::1d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0df6ce76-206a-11ed-bd2e-47488cf2e6aa;
 Sat, 20 Aug 2022 11:25:39 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 023FA1FEFD;
 Sat, 20 Aug 2022 09:25:39 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id B9C3D13440;
 Sat, 20 Aug 2022 09:25:38 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id ADMoLJKoAGPJMAAAMHmgww
 (envelope-from <jgross@suse.com>); Sat, 20 Aug 2022 09:25:38 +0000
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
X-Inumbo-ID: 0df6ce76-206a-11ed-bd2e-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1660987539; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ApIUNLFVl6HZvnRkU+2Ix/2f56BO+zXK/TglyOeKv+E=;
	b=OVoRIvF8goFpMJZ0uw8ySeIl4Um60lYLwlPgpnYvUUYtNsnSHo8XctJ0ZyOjXo9aoCYVY/
	HbZEEu/C4KJYA4TEC5WeYmVy5Mu7qV0eKj4IAfguw+7mzASrNc6L9fylPZZ+eikjdzX2Qv
	R9IyrLHZQ9dN6daxeRRiHELCANSgRLw=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org,
	x86@kernel.org,
	linux-kernel@vger.kernel.org
Cc: Juergen Gross <jgross@suse.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>
Subject: [PATCH v2 07/10] x86/mtrr: simplify mtrr_bp_init()
Date: Sat, 20 Aug 2022 11:25:30 +0200
Message-Id: <20220820092533.29420-8-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220820092533.29420-1-jgross@suse.com>
References: <20220820092533.29420-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In case of the generic cache interface being used (Intel cpus or a
64-bit system), the initialization sequence of the boot cpu is more
complicated as necessary:

- check if MTRR enabled, if yes, call mtrr_bp_pat_init() which will
  disable caching, set the PAT MSR, and reenable caching

- call mtrr_cleanup(), in case that changed anything, call
  cache_cpu_init() doing the same caching disable/enable dance as
  above, but this time with setting the (modified) MTRR state (even
  if MTRR was disabled) AND setting the PAT MSR (again even with
  disabled MTRR)

The sequence can be simplified a lot while removing potential
inconsistencies:

- check if MTRR enabled, if yes, call mtrr_cleanup() and then
  cache_cpu_init()

This ensures to:

- no longer disable/enable caching more than once

- avoid to set MTRRs and/or the PAT MSR on the boot processor in case
  of MTRR cleanups even if MTRRs meant to be disabled

With that mtrr_bp_pat_init() can be removed.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
V2:
- new patch
---
 arch/x86/kernel/cpu/mtrr/generic.c | 14 --------------
 arch/x86/kernel/cpu/mtrr/mtrr.c    |  7 ++-----
 arch/x86/kernel/cpu/mtrr/mtrr.h    |  1 -
 3 files changed, 2 insertions(+), 20 deletions(-)

diff --git a/arch/x86/kernel/cpu/mtrr/generic.c b/arch/x86/kernel/cpu/mtrr/generic.c
index 1c6260b94cb9..b6be476c77af 100644
--- a/arch/x86/kernel/cpu/mtrr/generic.c
+++ b/arch/x86/kernel/cpu/mtrr/generic.c
@@ -442,20 +442,6 @@ static void __init print_mtrr_state(void)
 		pr_debug("TOM2: %016llx aka %lldM\n", mtrr_tom2, mtrr_tom2>>20);
 }
 
-/* PAT setup for BP. We need to go through sync steps here */
-void __init mtrr_bp_pat_init(void)
-{
-	unsigned long flags;
-
-	local_irq_save(flags);
-	cache_disable();
-
-	pat_init();
-
-	cache_enable();
-	local_irq_restore(flags);
-}
-
 /* Grab all of the MTRR state for this CPU into *state */
 bool __init get_mtrr_state(void)
 {
diff --git a/arch/x86/kernel/cpu/mtrr/mtrr.c b/arch/x86/kernel/cpu/mtrr/mtrr.c
index 19662ab057be..ca348dcc5bf8 100644
--- a/arch/x86/kernel/cpu/mtrr/mtrr.c
+++ b/arch/x86/kernel/cpu/mtrr/mtrr.c
@@ -761,13 +761,10 @@ void __init mtrr_bp_init(void)
 			mtrr_enabled = get_mtrr_state();
 
 			if (mtrr_enabled) {
-				mtrr_bp_pat_init();
 				cache_generic |= CACHE_GENERIC_MTRR |
 						 CACHE_GENERIC_PAT;
-			}
-
-			if (mtrr_cleanup(phys_addr)) {
-				changed_by_mtrr_cleanup = 1;
+				changed_by_mtrr_cleanup =
+					mtrr_cleanup(phys_addr);
 				cache_cpu_init();
 			}
 		}
diff --git a/arch/x86/kernel/cpu/mtrr/mtrr.h b/arch/x86/kernel/cpu/mtrr/mtrr.h
index 3b1883185185..c98928ceee6a 100644
--- a/arch/x86/kernel/cpu/mtrr/mtrr.h
+++ b/arch/x86/kernel/cpu/mtrr/mtrr.h
@@ -50,7 +50,6 @@ void set_mtrr_prepare_save(struct set_mtrr_context *ctxt);
 void fill_mtrr_var_range(unsigned int index,
 		u32 base_lo, u32 base_hi, u32 mask_lo, u32 mask_hi);
 bool get_mtrr_state(void);
-void mtrr_bp_pat_init(void);
 
 extern void __init set_mtrr_ops(const struct mtrr_ops *ops);
 
-- 
2.35.3


