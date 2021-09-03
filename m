Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 893254007FB
	for <lists+xen-devel@lfdr.de>; Sat,  4 Sep 2021 00:49:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.178547.324627 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mMI0A-0005aX-G6; Fri, 03 Sep 2021 22:49:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 178547.324627; Fri, 03 Sep 2021 22:49:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mMI0A-0005Xk-Cm; Fri, 03 Sep 2021 22:49:38 +0000
Received: by outflank-mailman (input) for mailman id 178547;
 Fri, 03 Sep 2021 22:49:36 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UKUJ=NZ=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1mMI08-0005XF-DJ
 for xen-devel@lists.xenproject.org; Fri, 03 Sep 2021 22:49:36 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 92e6d110-16a5-49ea-9fed-1136efe8e605;
 Fri, 03 Sep 2021 22:49:35 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6E69C60FA0;
 Fri,  3 Sep 2021 22:49:34 +0000 (UTC)
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
X-Inumbo-ID: 92e6d110-16a5-49ea-9fed-1136efe8e605
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1630709374;
	bh=MelmbXi6qQvN2rHzNWcwaBtUUsR83J5tHhU/VWOnA1s=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=mcilNlKENYopNymU1GVqplsCs8G0/C4btMrZJGuTed3q3TrBbiG8T3gEGlnzljwVX
	 SUtsli8oSfJiIkWIfRVRxWRGC3HKGIqd9aYs7K4EQCzWqXM9CU8l4dEdGjt2oYKAYi
	 BrHh+LjMyGVhE9yH0oufb0eWPTNoftb9qmiyTagEG4p1GBTV12Z8h9WYVDrHlseIyt
	 HV6Hf5OvsINegFSIlXRHAAErKX0+3zkRUfz2QgFNSiKhwUDCLp8kIUYlqXw7O2fnA9
	 enW0pUxNRQCJ8rI7q4zLaA9BrUItINft9SpdUgs8WyjEreechqYFS7a1EJPxizLBd+
	 wPafcGzr9n/Hg==
Date: Fri, 3 Sep 2021 15:49:33 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
cc: Julien Grall <julien@xen.org>, 
    "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v3 7/7] xen/arm: Sanitize CTR_EL0 and emulate it if
 needed
In-Reply-To: <CA9E8DFA-E0D8-4C33-A277-E19EFFCAFDC4@arm.com>
Message-ID: <alpine.DEB.2.21.2109031540470.26072@sstabellini-ThinkPad-T480s>
References: <cover.1629897306.git.bertrand.marquis@arm.com> <a7482653a0c29d68854846f25553f4938a6279b9.1629897306.git.bertrand.marquis@arm.com> <14b1639e-c9e4-f8fb-e921-73d7f28681ac@xen.org> <98E8FB9D-3372-47D2-92F7-8AD401AC1092@arm.com>
 <6705127a-bde2-36cd-0fed-900eb1eace03@xen.org> <CA9E8DFA-E0D8-4C33-A277-E19EFFCAFDC4@arm.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 31 Aug 2021, Bertrand Marquis wrote:
> Hi Julien,
> 
> > On 31 Aug 2021, at 15:47, Julien Grall <julien@xen.org> wrote:
> > 
> > 
> > 
> > On 31/08/2021 14:17, Bertrand Marquis wrote:
> >> Hi Julien,
> > 
> > Hi Bertrand,
> > 
> >>> On 27 Aug 2021, at 16:05, Julien Grall <julien@xen.org> wrote:
> >>> 
> >>> Hi Bertrand,
> >>> 
> >>> On 25/08/2021 14:18, Bertrand Marquis wrote:
> >>>> Sanitize CTR_EL0 value between cores.
> >>>> In most cases different values will taint Xen but if different
> >>>> i-cache policies are found, we choose the one which will be compatible
> >>>> between all cores in terms of invalidation/data cache flushing strategy.
> >>> 
> >>> I understand that all the CPUs in Xen needs to agree on the cache flush strategy. However...
> >>> 
> >>>> In this case we need to activate the TID2 bit in HCR to emulate the
> >>>> TCR_EL0 register for guests. This patch is not activating TID2 bit all
> >>>> the time to limit the overhead when possible.
> >>> 
> >>> as we discussed in an earlier version, a vCPU is unlikely (at least in short/medium) to be able move across pCPU of different type. So the vCPU would be pinned to a set of pCPUs. IOW, the guest would have to be big.LITTLE aware and therefore would be able to do its own strategy decision.
> >>> 
> >>> So I think we should be able to get away from trappings the registers.
> >> I do agree that we should be able to get away from that in the long term once
> >> we have cpupools properly set but right now this is the only way to have
> >> something useable (I will not say right).
> >> I will work on finding a way to setup properly cpupools (or something else as
> >> we discussed earlier) but in the short term I think this is the best we can do.
> > 
> > My concern is you are making look like Xen will be able to deal nicely with big.LITTLE when in fact there are a lot more potential issue by allow a vCPU moving accross pCPU of different type (the errata is one example).
> 
> I agree and this is why Xen is tainted.
> 
> > 
> >> An other solution would be to discard this patch from the serie for now until
> >> I have worked a proper solution for this case.
> >> Should we discard or merge or do you have an other idea ?
> > Please correct me if I am wrong, at the moment, it doesn't look like this patch will be part of the longer plan. If so, then I think it should be parked for now.
> 
> Not sure it depends on what the final solution would be but this is highly possible I agree.
> 
> > 
> > This would also have the advantage to avoid spending too much time on resolving the emulation issue I mentioned in my previous answer.
> > 
> > No need to resend a new version of this series yet. You can wait until the rest of the series get more feedback.
> 
> Ok, I will wait for feedback and next serie will not include this patch anymore.

Would it be worth keeping just the part that sanitizes ctr, without any
of the emulation stuff? That way we could still detect cases where there
is a mismatch between CPUs, print a useful message and taint Xen.

For clarity something like the appended.


diff --git a/xen/arch/arm/arm64/cpufeature.c b/xen/arch/arm/arm64/cpufeature.c
index b1936ef1d6..d2456af2bf 100644
--- a/xen/arch/arm/arm64/cpufeature.c
+++ b/xen/arch/arm/arm64/cpufeature.c
@@ -275,9 +275,6 @@ static const struct arm64_ftr_bits ftr_id_aa64mmfr2[] = {
 	ARM64_FTR_END,
 };
 
-#if 0
-/* TODO: use this to sanitize the cache line size among cores */
-
 static const struct arm64_ftr_bits ftr_ctr[] = {
 	ARM64_FTR_BITS(FTR_VISIBLE, FTR_STRICT, FTR_EXACT, 31, 1, 1), /* RES1 */
 	ARM64_FTR_BITS(FTR_VISIBLE, FTR_STRICT, FTR_LOWER_SAFE, CTR_DIC_SHIFT, 1, 1),
@@ -294,7 +291,6 @@ static const struct arm64_ftr_bits ftr_ctr[] = {
 	ARM64_FTR_BITS(FTR_VISIBLE, FTR_STRICT, FTR_LOWER_SAFE, CTR_IMINLINE_SHIFT, 4, 0),
 	ARM64_FTR_END,
 };
-#endif
 
 static const struct arm64_ftr_bits ftr_id_mmfr0[] = {
 	S_ARM64_FTR_BITS(FTR_HIDDEN, FTR_STRICT, FTR_LOWER_SAFE, ID_MMFR0_INNERSHR_SHIFT, 4, 0xf),
@@ -600,6 +596,8 @@ void update_system_features(const struct cpuinfo_arm *new)
 	 */
 	SANITIZE_REG(dczid, 0, dczid);
 
+	SANITIZE_REG(ctr, 0, ctr);
+
 	if ( cpu_feature64_has_el0_32(&system_cpuinfo) )
 	{
 		SANITIZE_ID_REG(pfr32, 0, pfr0);
diff --git a/xen/arch/arm/cpufeature.c b/xen/arch/arm/cpufeature.c
index 113f20f601..6e51f530a8 100644
--- a/xen/arch/arm/cpufeature.c
+++ b/xen/arch/arm/cpufeature.c
@@ -127,6 +127,8 @@ void identify_cpu(struct cpuinfo_arm *c)
 
     c->dczid.bits[0] = READ_SYSREG(DCZID_EL0);
 
+    c->ctr.bits[0] = READ_SYSREG(CTR_EL0);
+
     aarch32_el0 = cpu_feature64_has_el0_32(c);
 #endif
 
diff --git a/xen/arch/arm/setup.c b/xen/arch/arm/setup.c
index 3798c5ade0..33b7bfb59c 100644
--- a/xen/arch/arm/setup.c
+++ b/xen/arch/arm/setup.c
@@ -627,7 +627,7 @@ static void __init setup_mm(void)
         panic("No memory bank\n");
 
     /* We only supports instruction caches implementing the IVIPT extension. */
-    if ( ((ctr >> CTR_L1Ip_SHIFT) & CTR_L1Ip_MASK) == CTR_L1Ip_AIVIVT )
+    if ( ((ctr >> CTR_L1IP_SHIFT) & CTR_L1IP_MASK) == ICACHE_POLICY_AIVIVT )
         panic("AIVIVT instruction cache not supported\n");
 
     init_pdx();
diff --git a/xen/include/asm-arm/cpufeature.h b/xen/include/asm-arm/cpufeature.h
index 5219fd3bab..ca6e827fcb 100644
--- a/xen/include/asm-arm/cpufeature.h
+++ b/xen/include/asm-arm/cpufeature.h
@@ -267,6 +267,14 @@ struct cpuinfo_arm {
         register_t bits[1];
     } dczid;
 
+    /*
+     * CTR is only used to check for different cache types or policies and
+     * taint Xen in this case
+     */
+    struct {
+        register_t bits[1];
+    } ctr;
+
 #endif
 
     /*
@@ -339,6 +347,9 @@ extern struct cpuinfo_arm system_cpuinfo;
 extern void identify_cpu(struct cpuinfo_arm *);
 
 #ifdef CONFIG_ARM_64
+
+extern bool mismatched_cache_type;
+
 extern void update_system_features(const struct cpuinfo_arm *);
 #else
 static inline void update_system_features(const struct cpuinfo_arm *cpuinfo)
diff --git a/xen/include/asm-arm/processor.h b/xen/include/asm-arm/processor.h
index 2577e9a244..8c9843e12b 100644
--- a/xen/include/asm-arm/processor.h
+++ b/xen/include/asm-arm/processor.h
@@ -7,9 +7,21 @@
 #include <public/arch-arm.h>
 
 /* CTR Cache Type Register */
-#define CTR_L1Ip_MASK       0x3
-#define CTR_L1Ip_SHIFT      14
-#define CTR_L1Ip_AIVIVT     0x1
+#define CTR_L1IP_MASK       0x3
+#define CTR_L1IP_SHIFT      14
+#define CTR_DMINLINE_SHIFT  16
+#define CTR_IMINLINE_SHIFT  0
+#define CTR_IMINLINE_MASK   0xf
+#define CTR_ERG_SHIFT       20
+#define CTR_CWG_SHIFT       24
+#define CTR_CWG_MASK        15
+#define CTR_IDC_SHIFT       28
+#define CTR_DIC_SHIFT       29
+
+#define ICACHE_POLICY_VPIPT  0
+#define ICACHE_POLICY_AIVIVT 1
+#define ICACHE_POLICY_VIPT   2
+#define ICACHE_POLICY_PIPT   3
 
 /* MIDR Main ID Register */
 #define MIDR_REVISION_MASK      0xf

