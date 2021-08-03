Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A3553DF6F1
	for <lists+xen-devel@lfdr.de>; Tue,  3 Aug 2021 23:38:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.163613.299671 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mB26A-0003eW-LV; Tue, 03 Aug 2021 21:37:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 163613.299671; Tue, 03 Aug 2021 21:37:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mB26A-0003cF-ID; Tue, 03 Aug 2021 21:37:18 +0000
Received: by outflank-mailman (input) for mailman id 163613;
 Tue, 03 Aug 2021 21:37:16 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GulG=M2=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1mB268-0003c9-OS
 for xen-devel@lists.xenproject.org; Tue, 03 Aug 2021 21:37:16 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f83f7e89-f4a2-11eb-9b0d-12813bfff9fa;
 Tue, 03 Aug 2021 21:37:15 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 746E760524;
 Tue,  3 Aug 2021 21:37:14 +0000 (UTC)
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
X-Inumbo-ID: f83f7e89-f4a2-11eb-9b0d-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1628026634;
	bh=gYczJfrT3WcLqTTtUlNHbkFitIUCC0SL5Wk0165OeIA=;
	h=Date:From:To:cc:Subject:From;
	b=n8GWyZQ7IYP96tdyqAK90PLZbGhOHF3Jre7G8FrCl5xIKt+7glyUjUCLw9sEtw5im
	 K/LeTY2HkPE1hDvIqj79iSNbjqT/JJ7ojxY5eUtDCMdHWNKHI8ta3wNbMGwvSYEv5d
	 Aga1sCynSLJzpTc0nKzELL03zXt5ZIXYlQFs+0V5vyGWzamooW+/mohfH9t4HkLlJ2
	 9LPvFilubJmN7Lpbx/lEeHi4LXDTNxTmdAa2mqqW7yH0wpP+kqk2KNbkSqobpRH+Cv
	 7qc9m+q+fhv5cbA+MXPMaNEL49q+NdAM0gv81lSHfUoD3PuF/HEsEJqqbv5baXBXG7
	 7ET/5zqVfYcfQ==
Date: Tue, 3 Aug 2021 14:37:13 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: julien@xen.org
cc: sstabellini@kernel.org, xen-devel@lists.xenproject.org, 
    Volodymyr_Babchuk@epam.com, Bertrand.Marquis@arm.com
Subject: [PATCH] do not p2m_invalidate_root when iommu_use_hap_pt
Message-ID: <alpine.DEB.2.21.2108031419500.19737@sstabellini-ThinkPad-T480s>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

Set/Way flushes never work correctly in a virtualized environment.

Our current implementation is based on clearing the valid bit in the p2m
pagetable to track guest memory accesses. This technique doesn't work
when the IOMMU is enabled for the domain and the pagetable is shared
between IOMMU and MMU because it triggers IOMMU faults.

Specifically, p2m_invalidate_root causes IOMMU faults if
iommu_use_hap_pt returns true for the domain.

Add a check in vsysreg.c and vcpreg.c: if a set/way instruction is used
and iommu_use_hap_pt returns true, rather than failing with obscure
IOMMU faults, inject an undef exception straight away into the guest,
and print a verbose error message to explain the problem.

Also add an ASSERT in p2m_invalidate_root to make sure we don't
inadvertently stumble across this problem again in the future.

Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
---

This patch is an improvement over the IOMMU faults. I don't know if we
want to give users an option to get past these errors for development
and debugging.

We could add a Xen command line option to make Xen ignore Set/Way
instructions (do nothing on trap). Or we could add an option to avoid
trapping Set/Way instructions altogether (remove HCR_TSW).

Both workarounds are obviously not correct and could lead to memory
corruptions (the former) or bad interference between guests (the latter).

Either way, we can start with this patch.

diff --git a/xen/arch/arm/arm64/vsysreg.c b/xen/arch/arm/arm64/vsysreg.c
index caf17174b8..125a9281fc 100644
--- a/xen/arch/arm/arm64/vsysreg.c
+++ b/xen/arch/arm/arm64/vsysreg.c
@@ -105,6 +105,13 @@ void do_sysreg(struct cpu_user_regs *regs,
     case HSR_SYSREG_DCISW:
     case HSR_SYSREG_DCCSW:
     case HSR_SYSREG_DCCISW:
+        if ( iommu_use_hap_pt(current->domain) )
+        {
+            gdprintk(XENLOG_ERR,
+                     "d%u uses set/way cache flushes with the IOMMU on. It cannot work. Replace set/way instructions with dc [ci]vac and retry. Injecting exception into the guest now.\n",
+                     current->domain->domain_id);
+            return inject_undef_exception(regs, hsr);
+        }
         if ( !hsr.sysreg.read )
             p2m_set_way_flush(current);
         break;
diff --git a/xen/arch/arm/p2m.c b/xen/arch/arm/p2m.c
index d414c4feb9..240913d5ac 100644
--- a/xen/arch/arm/p2m.c
+++ b/xen/arch/arm/p2m.c
@@ -1171,6 +1171,9 @@ void p2m_invalidate_root(struct p2m_domain *p2m)
 {
     unsigned int i;
 
+    /* Clearing the valid bit causes IOMMU faults. */
+    ASSERT(!iommu_use_hap_pt(p2m->domain));
+
     p2m_write_lock(p2m);
 
     for ( i = 0; i < P2M_ROOT_LEVEL; i++ )
diff --git a/xen/arch/arm/vcpreg.c b/xen/arch/arm/vcpreg.c
index e3ce56d875..04b68f6901 100644
--- a/xen/arch/arm/vcpreg.c
+++ b/xen/arch/arm/vcpreg.c
@@ -231,6 +231,13 @@ void do_cp15_32(struct cpu_user_regs *regs, const union hsr hsr)
     case HSR_CPREG32(DCISW):
     case HSR_CPREG32(DCCSW):
     case HSR_CPREG32(DCCISW):
+        if ( iommu_use_hap_pt(current->domain) )
+        {
+            gdprintk(XENLOG_ERR,
+                     "d%u uses set/way cache flushes with the IOMMU on. It cannot work. Replace set/way instructions with dc [ci]vac and retry. Injecting exception into the guest now.\n",
+                     current->domain->domain_id);
+            return inject_undef_exception(regs, hsr);
+        }
         if ( !cp32.read )
             p2m_set_way_flush(current);
         break;


