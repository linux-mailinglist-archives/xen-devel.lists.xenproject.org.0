Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CBA854AFB2B
	for <lists+xen-devel@lfdr.de>; Wed,  9 Feb 2022 19:43:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.269434.463524 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nHrvY-0004HD-U2; Wed, 09 Feb 2022 18:42:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 269434.463524; Wed, 09 Feb 2022 18:42:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nHrvY-0004FO-Qz; Wed, 09 Feb 2022 18:42:52 +0000
Received: by outflank-mailman (input) for mailman id 269434;
 Wed, 09 Feb 2022 18:42:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=mP6M=SY=kernel.org=sashal@srs-se1.protection.inumbo.net>)
 id 1nHrvX-0004FI-8B
 for xen-devel@lists.xenproject.org; Wed, 09 Feb 2022 18:42:51 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 145a0da3-89d8-11ec-8eb8-a37418f5ba1a;
 Wed, 09 Feb 2022 19:42:50 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 84A9960AF2;
 Wed,  9 Feb 2022 18:42:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF6FAC340E9;
 Wed,  9 Feb 2022 18:42:46 +0000 (UTC)
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
X-Inumbo-ID: 145a0da3-89d8-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1644432167;
	bh=Y8q/J0Iry0Dpi9EHXI2yalvcbthB960zMJ7G+0SH+Rw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=tdeNjUE2TUiCpsgUfWk/D0BVQEPxdQKE89FUdKdPXy+TVGn2RoRYSpZvp4Uf7GR+e
	 aFW8WhJdmAlUUhn8tIrjMJaQM42fBdsb8k9a49vEhXxBlOOzJEX87fw7gnUtOdvy7V
	 8oNzE+gANByflZ5s5BL5Z916VBWGj3Tj1G6UL9jPRMQT7OkIXnJHujhxfEUwmZ7D1m
	 9NsEiL1SEWlGORijICWXAAEqYL+S1uFKfz+TFmmtYu6M0CYntVT+2HPk8el2Nexw6u
	 U8PGhoRbaPzqqZ2xQLgm2gRvnkJCUsxQjZCFLip10gyeQ+okkACE0L5JPmTyvLReDa
	 wucamD467uj2w==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Jan Beulich <jbeulich@suse.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Juergen Gross <jgross@suse.com>,
	Sasha Levin <sashal@kernel.org>,
	tglx@linutronix.de,
	mingo@redhat.com,
	bp@alien8.de,
	dave.hansen@linux.intel.com,
	x86@kernel.org,
	xen-devel@lists.xenproject.org
Subject: [PATCH AUTOSEL 5.10 24/27] x86/Xen: streamline (and fix) PV CPU enumeration
Date: Wed,  9 Feb 2022 13:41:00 -0500
Message-Id: <20220209184103.47635-24-sashal@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220209184103.47635-1-sashal@kernel.org>
References: <20220209184103.47635-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit

From: Jan Beulich <jbeulich@suse.com>

[ Upstream commit e25a8d959992f61b64a58fc62fb7951dc6f31d1f ]

This started out with me noticing that "dom0_max_vcpus=<N>" with <N>
larger than the number of physical CPUs reported through ACPI tables
would not bring up the "excess" vCPU-s. Addressing this is the primary
purpose of the change; CPU maps handling is being tidied only as far as
is necessary for the change here (with the effect of also avoiding the
setting up of too much per-CPU infrastructure, i.e. for CPUs which can
never come online).

Noticing that xen_fill_possible_map() is called way too early, whereas
xen_filter_cpu_maps() is called too late (after per-CPU areas were
already set up), and further observing that each of the functions serves
only one of Dom0 or DomU, it looked like it was better to simplify this.
Use the .get_smp_config hook instead, uniformly for Dom0 and DomU.
xen_fill_possible_map() can be dropped altogether, while
xen_filter_cpu_maps() is re-purposed but not otherwise changed.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
Reviewed-by: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Link: https://lore.kernel.org/r/2dbd5f0a-9859-ca2d-085e-a02f7166c610@suse.com
Signed-off-by: Juergen Gross <jgross@suse.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/x86/xen/enlighten_pv.c |  4 ----
 arch/x86/xen/smp_pv.c       | 26 ++++++--------------------
 2 files changed, 6 insertions(+), 24 deletions(-)

diff --git a/arch/x86/xen/enlighten_pv.c b/arch/x86/xen/enlighten_pv.c
index 16ff25d6935e7..804c65d2b95f3 100644
--- a/arch/x86/xen/enlighten_pv.c
+++ b/arch/x86/xen/enlighten_pv.c
@@ -1387,10 +1387,6 @@ asmlinkage __visible void __init xen_start_kernel(void)
 
 		xen_acpi_sleep_register();
 
-		/* Avoid searching for BIOS MP tables */
-		x86_init.mpparse.find_smp_config = x86_init_noop;
-		x86_init.mpparse.get_smp_config = x86_init_uint_noop;
-
 		xen_boot_params_init_edd();
 
 #ifdef CONFIG_ACPI
diff --git a/arch/x86/xen/smp_pv.c b/arch/x86/xen/smp_pv.c
index c2ac319f11a4b..8f9e7e2407c87 100644
--- a/arch/x86/xen/smp_pv.c
+++ b/arch/x86/xen/smp_pv.c
@@ -149,28 +149,12 @@ int xen_smp_intr_init_pv(unsigned int cpu)
 	return rc;
 }
 
-static void __init xen_fill_possible_map(void)
-{
-	int i, rc;
-
-	if (xen_initial_domain())
-		return;
-
-	for (i = 0; i < nr_cpu_ids; i++) {
-		rc = HYPERVISOR_vcpu_op(VCPUOP_is_up, i, NULL);
-		if (rc >= 0) {
-			num_processors++;
-			set_cpu_possible(i, true);
-		}
-	}
-}
-
-static void __init xen_filter_cpu_maps(void)
+static void __init _get_smp_config(unsigned int early)
 {
 	int i, rc;
 	unsigned int subtract = 0;
 
-	if (!xen_initial_domain())
+	if (early)
 		return;
 
 	num_processors = 0;
@@ -211,7 +195,6 @@ static void __init xen_pv_smp_prepare_boot_cpu(void)
 		 * sure the old memory can be recycled. */
 		make_lowmem_page_readwrite(xen_initial_gdt);
 
-	xen_filter_cpu_maps();
 	xen_setup_vcpu_info_placement();
 
 	/*
@@ -491,5 +474,8 @@ static const struct smp_ops xen_smp_ops __initconst = {
 void __init xen_smp_init(void)
 {
 	smp_ops = xen_smp_ops;
-	xen_fill_possible_map();
+
+	/* Avoid searching for BIOS MP tables */
+	x86_init.mpparse.find_smp_config = x86_init_noop;
+	x86_init.mpparse.get_smp_config = _get_smp_config;
 }
-- 
2.34.1


