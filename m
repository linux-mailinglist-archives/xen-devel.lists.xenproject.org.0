Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E1B65B17A5
	for <lists+xen-devel@lfdr.de>; Thu,  8 Sep 2022 10:50:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.402843.644778 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oWDEL-0000c0-BJ; Thu, 08 Sep 2022 08:49:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 402843.644778; Thu, 08 Sep 2022 08:49:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oWDEL-0000ZT-7P; Thu, 08 Sep 2022 08:49:49 +0000
Received: by outflank-mailman (input) for mailman id 402843;
 Thu, 08 Sep 2022 08:49:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=wZDO=ZL=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1oWDEJ-0007YH-Sg
 for xen-devel@lists.xenproject.org; Thu, 08 Sep 2022 08:49:47 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 31023e2e-2f53-11ed-a31c-8f8a9ae3403f;
 Thu, 08 Sep 2022 10:49:47 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id D9BA91F8A3;
 Thu,  8 Sep 2022 08:49:46 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 998871322C;
 Thu,  8 Sep 2022 08:49:46 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 3SRPJKqsGWOONgAAMHmgww
 (envelope-from <jgross@suse.com>); Thu, 08 Sep 2022 08:49:46 +0000
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
X-Inumbo-ID: 31023e2e-2f53-11ed-a31c-8f8a9ae3403f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1662626986; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wDKuCN3FDCh/jRyZekgDw7nh9c+GGbOWD1BvZKsc508=;
	b=h2PK0NZ1OCS5TyVIZcYsjtBHsRLWOMkBd9if1BTrvC/vkd3VVi1cvLtQKNwXctgQ5sCK3K
	TGiCjxDD+wy/9lXUqGhaVCaDIa5jrJ8TFEjecbmdq7bB0MAIMCeYLcqJpLL+4VD8HLtkIR
	lLzMA4YQSDiAuBR5sZ3IyyHqAiv/Tqk=
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
Subject: [PATCH v3 05/10] x86/mtrr: split generic_set_all()
Date: Thu,  8 Sep 2022 10:49:09 +0200
Message-Id: <20220908084914.21703-6-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220908084914.21703-1-jgross@suse.com>
References: <20220908084914.21703-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Split generic_set_all() into multiple parts, while moving the main
function body into cacheinfo.c.

This prepares the support of PAT without needing MTRR support by
moving the main function body of generic_set_all() into cacheinfo.c
while renaming it to cache_cpu_init(). The MTRR specific parts are
moved into a dedicated small function called by cache_cpu_init().
The PAT and MTRR specific functions are called conditionally based
on the cache_generic bit settings.

The setting of smp_changes_mask is merged into the (new) function
mtrr_generic_set_state() used to call set_mtrr_state(). It was
probably split in ancient times, as atomic operations while running
uncached might be quite expensive, but OTOH only systems with a
broken BIOS should ever require to set any bit in smp_changes_mask,
so just hurting those devices with a penalty of a few microseconds
during boot shouldn't be a real issue.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
V2:
- new patch
---
 arch/x86/include/asm/cacheinfo.h   |  1 +
 arch/x86/include/asm/mtrr.h        |  2 ++
 arch/x86/kernel/cpu/cacheinfo.c    | 19 +++++++++++++++++++
 arch/x86/kernel/cpu/mtrr/generic.c | 15 ++-------------
 4 files changed, 24 insertions(+), 13 deletions(-)

diff --git a/arch/x86/include/asm/cacheinfo.h b/arch/x86/include/asm/cacheinfo.h
index 313a6920d0f9..563d9cb5fcf5 100644
--- a/arch/x86/include/asm/cacheinfo.h
+++ b/arch/x86/include/asm/cacheinfo.h
@@ -12,5 +12,6 @@ void cacheinfo_hygon_init_llc_id(struct cpuinfo_x86 *c, int cpu);
 
 void cache_disable(void);
 void cache_enable(void);
+void cache_cpu_init(void);
 
 #endif /* _ASM_X86_CACHEINFO_H */
diff --git a/arch/x86/include/asm/mtrr.h b/arch/x86/include/asm/mtrr.h
index 12a16caed395..986249a2b9b6 100644
--- a/arch/x86/include/asm/mtrr.h
+++ b/arch/x86/include/asm/mtrr.h
@@ -50,6 +50,7 @@ extern int mtrr_trim_uncached_memory(unsigned long end_pfn);
 extern int amd_special_default_mtrr(void);
 void mtrr_disable(void);
 void mtrr_enable(void);
+void mtrr_generic_set_state(void);
 #  else
 static inline u8 mtrr_type_lookup(u64 addr, u64 end, u8 *uniform)
 {
@@ -91,6 +92,7 @@ static inline void mtrr_centaur_report_mcr(int mcr, u32 lo, u32 hi)
 #define mtrr_bp_restore() do {} while (0)
 #define mtrr_disable() do {} while (0)
 #define mtrr_enable() do {} while (0)
+#define mtrr_generic_set_state() do {} while (0)
 #  endif
 
 #ifdef CONFIG_COMPAT
diff --git a/arch/x86/kernel/cpu/cacheinfo.c b/arch/x86/kernel/cpu/cacheinfo.c
index 47e2c72fa8a4..36378604ec61 100644
--- a/arch/x86/kernel/cpu/cacheinfo.c
+++ b/arch/x86/kernel/cpu/cacheinfo.c
@@ -1120,3 +1120,22 @@ void cache_enable(void) __releases(cache_disable_lock)
 
 	raw_spin_unlock(&cache_disable_lock);
 }
+
+void cache_cpu_init(void)
+{
+	unsigned long flags;
+
+	local_irq_save(flags);
+	cache_disable();
+
+	/* Set MTRR state. */
+	if (cache_generic & CACHE_GENERIC_MTRR)
+		mtrr_generic_set_state();
+
+	/* Set PAT. */
+	if (cache_generic & CACHE_GENERIC_PAT)
+		pat_init();
+
+	cache_enable();
+	local_irq_restore(flags);
+}
diff --git a/arch/x86/kernel/cpu/mtrr/generic.c b/arch/x86/kernel/cpu/mtrr/generic.c
index 5ed397f03a87..fc7b2d952737 100644
--- a/arch/x86/kernel/cpu/mtrr/generic.c
+++ b/arch/x86/kernel/cpu/mtrr/generic.c
@@ -731,30 +731,19 @@ void mtrr_enable(void)
 	mtrr_wrmsr(MSR_MTRRdefType, deftype_lo, deftype_hi);
 }
 
-static void generic_set_all(void)
+void mtrr_generic_set_state(void)
 {
 	unsigned long mask, count;
-	unsigned long flags;
-
-	local_irq_save(flags);
-	cache_disable();
 
 	/* Actually set the state */
 	mask = set_mtrr_state();
 
-	/* also set PAT */
-	pat_init();
-
-	cache_enable();
-	local_irq_restore(flags);
-
 	/* Use the atomic bitops to update the global mask */
 	for (count = 0; count < sizeof(mask) * 8; ++count) {
 		if (mask & 0x01)
 			set_bit(count, &smp_changes_mask);
 		mask >>= 1;
 	}
-
 }
 
 /**
@@ -854,7 +843,7 @@ int positive_have_wrcomb(void)
  * Generic structure...
  */
 const struct mtrr_ops generic_mtrr_ops = {
-	.set_all		= generic_set_all,
+	.set_all		= cache_cpu_init,
 	.get			= generic_get_mtrr,
 	.get_free_region	= generic_get_free_region,
 	.set			= generic_set_mtrr,
-- 
2.35.3


