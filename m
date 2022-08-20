Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 160ED59ACD9
	for <lists+xen-devel@lfdr.de>; Sat, 20 Aug 2022 11:26:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.390681.628204 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oPKjd-0006t9-SC; Sat, 20 Aug 2022 09:25:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 390681.628204; Sat, 20 Aug 2022 09:25:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oPKjd-0006oJ-MS; Sat, 20 Aug 2022 09:25:41 +0000
Received: by outflank-mailman (input) for mailman id 390681;
 Sat, 20 Aug 2022 09:25:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=cfLG=YY=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1oPKjc-0006NK-Aq
 for xen-devel@lists.xenproject.org; Sat, 20 Aug 2022 09:25:40 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0cdff878-206a-11ed-9250-1f966e50362f;
 Sat, 20 Aug 2022 11:25:37 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 25C021FA75;
 Sat, 20 Aug 2022 09:25:37 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id D0E1B13440;
 Sat, 20 Aug 2022 09:25:36 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 6DubMZCoAGPJMAAAMHmgww
 (envelope-from <jgross@suse.com>); Sat, 20 Aug 2022 09:25:36 +0000
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
X-Inumbo-ID: 0cdff878-206a-11ed-9250-1f966e50362f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1660987537; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dNonIY2eSN2qALXA1xwqca8n1uiC2OZmHsAoG2ku6S4=;
	b=V/DSldnei2N0b/QjoZVHWD91fOusf/NBo0/8KqkWOsov44+Zf25qNDINpw+6cJHaFuWV2n
	sIcrQI04yUJyzSgBFXyN9sl+qQyIuu1oi2bh6+M/3sIkYTYNpNHAkgh4E1QpuICJVDdhgt
	BKvehrmm4SOtEce3Ucp+OllxKvMFKgI=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org,
	x86@kernel.org,
	linux-kernel@vger.kernel.org
Cc: Juergen Gross <jgross@suse.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	stable@vger.kernel.org
Subject: [PATCH v2 01/10] x86/mtrr: fix MTRR fixup on APs
Date: Sat, 20 Aug 2022 11:25:24 +0200
Message-Id: <20220820092533.29420-2-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220820092533.29420-1-jgross@suse.com>
References: <20220820092533.29420-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When booting or resuming the system MTRR state is saved on the boot
processor and then this state is loaded into MTRRs of all other cpus.
During update of the MTRRs the MTRR mechanism needs to be disabled by
writing the related MSR. The old contents of this MSR are saved in a
set of static variables and later those static variables are used to
restore the MSR.

In case the MSR contents need to be modified on a cpu due to the MSR
not having been initialized properly by the BIOS, the related update
function is modifying the static variables accordingly.

Unfortunately the MTRR state update is usually running on all cpus
at the same time, so using just one set of static variables for all
cpus is racy in case the MSR contents differ across cpus.

Fix that by using percpu variables for saving the MSR contents.

Cc: stable@vger.kernel.org
Signed-off-by: Juergen Gross <jgross@suse.com>
---
I thought adding a "Fixes:" tag for the kernel's initial git commit
would maybe be entertaining, but without being really helpful.
The percpu variables were preferred over on-stack ones in order to
avoid more code churn in followup patches decoupling PAT from MTRR
support.
V2:
- new patch
---
 arch/x86/kernel/cpu/mtrr/generic.c | 21 ++++++++++++++-------
 1 file changed, 14 insertions(+), 7 deletions(-)

diff --git a/arch/x86/kernel/cpu/mtrr/generic.c b/arch/x86/kernel/cpu/mtrr/generic.c
index 558108296f3c..3d185fcf08ca 100644
--- a/arch/x86/kernel/cpu/mtrr/generic.c
+++ b/arch/x86/kernel/cpu/mtrr/generic.c
@@ -679,7 +679,8 @@ static bool set_mtrr_var_ranges(unsigned int index, struct mtrr_var_range *vr)
 	return changed;
 }
 
-static u32 deftype_lo, deftype_hi;
+static DEFINE_PER_CPU(u32, deftype_lo);
+static DEFINE_PER_CPU(u32, deftype_hi);
 
 /**
  * set_mtrr_state - Set the MTRR state for this CPU.
@@ -691,6 +692,7 @@ static unsigned long set_mtrr_state(void)
 {
 	unsigned long change_mask = 0;
 	unsigned int i;
+	u32 *lo = this_cpu_ptr(&deftype_lo);
 
 	for (i = 0; i < num_var_ranges; i++) {
 		if (set_mtrr_var_ranges(i, &mtrr_state.var_ranges[i]))
@@ -704,10 +706,10 @@ static unsigned long set_mtrr_state(void)
 	 * Set_mtrr_restore restores the old value of MTRRdefType,
 	 * so to set it we fiddle with the saved value:
 	 */
-	if ((deftype_lo & 0xff) != mtrr_state.def_type
-	    || ((deftype_lo & 0xc00) >> 10) != mtrr_state.enabled) {
+	if ((*lo & 0xff) != mtrr_state.def_type
+	    || ((*lo & 0xc00) >> 10) != mtrr_state.enabled) {
 
-		deftype_lo = (deftype_lo & ~0xcff) | mtrr_state.def_type |
+		*lo = (*lo & ~0xcff) | mtrr_state.def_type |
 			     (mtrr_state.enabled << 10);
 		change_mask |= MTRR_CHANGE_MASK_DEFTYPE;
 	}
@@ -729,6 +731,8 @@ static DEFINE_RAW_SPINLOCK(set_atomicity_lock);
 static void prepare_set(void) __acquires(set_atomicity_lock)
 {
 	unsigned long cr0;
+	u32 *lo = this_cpu_ptr(&deftype_lo);
+	u32 *hi = this_cpu_ptr(&deftype_hi);
 
 	/*
 	 * Note that this is not ideal
@@ -763,10 +767,10 @@ static void prepare_set(void) __acquires(set_atomicity_lock)
 	flush_tlb_local();
 
 	/* Save MTRR state */
-	rdmsr(MSR_MTRRdefType, deftype_lo, deftype_hi);
+	rdmsr(MSR_MTRRdefType, *lo, *hi);
 
 	/* Disable MTRRs, and set the default type to uncached */
-	mtrr_wrmsr(MSR_MTRRdefType, deftype_lo & ~0xcff, deftype_hi);
+	mtrr_wrmsr(MSR_MTRRdefType, *lo & ~0xcff, *hi);
 
 	/* Again, only flush caches if we have to. */
 	if (!static_cpu_has(X86_FEATURE_SELFSNOOP))
@@ -775,12 +779,15 @@ static void prepare_set(void) __acquires(set_atomicity_lock)
 
 static void post_set(void) __releases(set_atomicity_lock)
 {
+	u32 *lo = this_cpu_ptr(&deftype_lo);
+	u32 *hi = this_cpu_ptr(&deftype_hi);
+
 	/* Flush TLBs (no need to flush caches - they are disabled) */
 	count_vm_tlb_event(NR_TLB_LOCAL_FLUSH_ALL);
 	flush_tlb_local();
 
 	/* Intel (P6) standard MTRRs */
-	mtrr_wrmsr(MSR_MTRRdefType, deftype_lo, deftype_hi);
+	mtrr_wrmsr(MSR_MTRRdefType, *lo, *hi);
 
 	/* Enable caches */
 	write_cr0(read_cr0() & ~X86_CR0_CD);
-- 
2.35.3


