Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3334F9E665E
	for <lists+xen-devel@lfdr.de>; Fri,  6 Dec 2024 05:42:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.849415.1264077 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tJQA1-0006Cp-NI; Fri, 06 Dec 2024 04:41:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 849415.1264077; Fri, 06 Dec 2024 04:41:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tJQA1-000608-7Y; Fri, 06 Dec 2024 04:41:49 +0000
Received: by outflank-mailman (input) for mailman id 849415;
 Fri, 06 Dec 2024 04:41:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5aHD=S7=kernel.org=devnull+dmukhin.ford.com@srs-se1.protection.inumbo.net>)
 id 1tJQ9w-0004Kb-Vd
 for xen-devel@lists.xenproject.org; Fri, 06 Dec 2024 04:41:44 +0000
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 61bf3ac9-b38c-11ef-99a3-01e77a169b0f;
 Fri, 06 Dec 2024 05:41:39 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 6B989A43EF8;
 Fri,  6 Dec 2024 04:39:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 059B1C4CEEC;
 Fri,  6 Dec 2024 04:41:38 +0000 (UTC)
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id F0BA2E77171;
 Fri,  6 Dec 2024 04:41:37 +0000 (UTC)
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
X-Inumbo-ID: 61bf3ac9-b38c-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733460098;
	bh=+PxKx+9Bd/NEReVQwLv8HwHoaFwOF8+i20hqmE7xSXQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=Nj6XLkuQmLp/uNXjB+dsck6DBJ29uP2b4H0jd7JyvqHnpdXwzzPGJwZz763k3n2K6
	 vy15uHNlEWnIvngW4gA7kpIkR/o0nMhomWd9N4qTGW9zrFGiSewvc5SS//R1Z/So7J
	 zpfTk/+m2gKC5dpiJ2vke+LWmqXtmf7LhOQdETNRLCPUoKxuV7nopiInEqPzQhCLFI
	 9U37FnA+WaAj7sfDO8TBa1xojmEqEA22aW1xWcFQ5mllJPxI6dMQQ1+98PKocXtvHX
	 R8UbVM511Ui+2dBoGD2FDFQPsvDDRG0DYmWqjmW89S0DxHpyNcLtE+kM/v0j1yZrGl
	 6TTsyQhh5v9Bw==
From: Denis Mukhin via B4 Relay <devnull+dmukhin.ford.com@kernel.org>
Date: Thu, 05 Dec 2024 20:41:41 -0800
Subject: [PATCH v2 11/35] xen/domain: enable max_init_domid for all
 architectures
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241205-vuart-ns8250-v1-11-e9aa923127eb@ford.com>
References: <20241205-vuart-ns8250-v1-0-e9aa923127eb@ford.com>
In-Reply-To: <20241205-vuart-ns8250-v1-0-e9aa923127eb@ford.com>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, 
 Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, 
 Stefano Stabellini <sstabellini@kernel.org>, 
 Denis Mukhin <dmukhin@ford.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1733460094; l=4201;
 i=dmukhin@ford.com; s=20241125; h=from:subject:message-id;
 bh=8SSnD1Rvlg1COWggZ+OR+NWe7LtZUd10G0Zzgq+sluI=;
 b=bpAwdXM1HckuHe2z460ut11GP/zeb2Seuz4iMoUD0qKiSQ2aJi9gKWeH+xAYirZL5R2XB7tFP
 S+AaQcyn37ZA9gVrx6KR2HNyCi7SiNrHbwLipUFQcKHQeVhT1n3aPXS
X-Developer-Key: i=dmukhin@ford.com; a=ed25519;
 pk=SsDZ9p39s0fqcpUKQuqKqrbn0rq6EtEAClvpOpzx6+U=
X-Endpoint-Received: by B4 Relay for dmukhin@ford.com/20241125 with
 auth_id=287
X-Original-From: Denis Mukhin <dmukhin@ford.com>
Reply-To: dmukhin@ford.com

From: Denis Mukhin <dmukhin@ford.com>

Move max_init_domid to a public API and enable for all architectures.
That is pre-requisite change for console focus switch logic cleanup.

max_init_domid is updated in domain_create().

Signed-off-by: Denis Mukhin <dmukhin@ford.com>
---
 xen/arch/arm/include/asm/setup.h   | 2 --
 xen/arch/arm/setup.c               | 2 --
 xen/arch/ppc/include/asm/setup.h   | 2 --
 xen/arch/riscv/include/asm/setup.h | 2 --
 xen/arch/x86/include/asm/setup.h   | 2 --
 xen/common/domain.c                | 9 +++++++++
 xen/include/xen/domain.h           | 2 ++
 7 files changed, 11 insertions(+), 10 deletions(-)

diff --git a/xen/arch/arm/include/asm/setup.h b/xen/arch/arm/include/asm/setup.h
index 64c227d171fc7b92e5b62d9fd42e5662871bd12b..d4e1670cd69cdd4475b2a5eb316d2c0601090ed7 100644
--- a/xen/arch/arm/include/asm/setup.h
+++ b/xen/arch/arm/include/asm/setup.h
@@ -19,8 +19,6 @@ struct map_range_data
     struct rangeset *irq_ranges;
 };
 
-extern domid_t max_init_domid;
-
 void copy_from_paddr(void *dst, paddr_t paddr, unsigned long len);
 
 size_t estimate_efi_size(unsigned int mem_nr_banks);
diff --git a/xen/arch/arm/setup.c b/xen/arch/arm/setup.c
index 2e27af4560a504bf57daef572d4a768bd886145b..cb218fe3eb36f2cdda47cfa092fa99ee1ca4a14c 100644
--- a/xen/arch/arm/setup.c
+++ b/xen/arch/arm/setup.c
@@ -58,8 +58,6 @@ struct cpuinfo_arm __read_mostly system_cpuinfo;
 bool __read_mostly acpi_disabled;
 #endif
 
-domid_t __read_mostly max_init_domid;
-
 static __used void init_done(void)
 {
     int rc;
diff --git a/xen/arch/ppc/include/asm/setup.h b/xen/arch/ppc/include/asm/setup.h
index e4f64879b68ca5aac24bd9544255143e6ef693f3..956fa6985adb23375bd41d3e5d34d9d5f0712bd5 100644
--- a/xen/arch/ppc/include/asm/setup.h
+++ b/xen/arch/ppc/include/asm/setup.h
@@ -1,6 +1,4 @@
 #ifndef __ASM_PPC_SETUP_H__
 #define __ASM_PPC_SETUP_H__
 
-#define max_init_domid (0)
-
 #endif /* __ASM_PPC_SETUP_H__ */
diff --git a/xen/arch/riscv/include/asm/setup.h b/xen/arch/riscv/include/asm/setup.h
index 844a2f0ef1d762b3a9bc90b61a336a23f1693cc9..978cad71d3df484e80ba19acc0e37b9278e941f0 100644
--- a/xen/arch/riscv/include/asm/setup.h
+++ b/xen/arch/riscv/include/asm/setup.h
@@ -3,8 +3,6 @@
 #ifndef ASM__RISCV__SETUP_H
 #define ASM__RISCV__SETUP_H
 
-#define max_init_domid (0)
-
 void setup_mm(void);
 
 #endif /* ASM__RISCV__SETUP_H */
diff --git a/xen/arch/x86/include/asm/setup.h b/xen/arch/x86/include/asm/setup.h
index 5c2391a8684b66efdf4b092409ed33935db6b40c..296348655b9d146c73acc305cc9edd5fd46f7d47 100644
--- a/xen/arch/x86/include/asm/setup.h
+++ b/xen/arch/x86/include/asm/setup.h
@@ -69,6 +69,4 @@ extern bool opt_dom0_verbose;
 extern bool opt_dom0_cpuid_faulting;
 extern bool opt_dom0_msr_relaxed;
 
-#define max_init_domid (0)
-
 #endif
diff --git a/xen/common/domain.c b/xen/common/domain.c
index 2f67aa06ed50e69c27cedc8d7f6eb0b469fe81cd..9e57dd4122a726e2fb42efe9c029e775202be0e6 100644
--- a/xen/common/domain.c
+++ b/xen/common/domain.c
@@ -65,6 +65,9 @@ DEFINE_RCU_READ_LOCK(domlist_read_lock);
 static struct domain *domain_hash[DOMAIN_HASH_SIZE];
 struct domain *domain_list;
 
+/* Last known non-system domain ID. */
+domid_t __read_mostly max_init_domid;
+
 /*
  * Insert a domain into the domlist/hash.  This allows the domain to be looked
  * up by domid, and therefore to be the subject of hypercalls/etc.
@@ -815,6 +818,12 @@ struct domain *domain_create(domid_t domid,
 
     memcpy(d->handle, config->handle, sizeof(d->handle));
 
+    /*
+     * Housekeeping for physical console forwarding to the domain.
+     */
+    if ( !is_system_domain(d) && max_init_domid < domid )
+        max_init_domid = domid;
+
     return d;
 
  fail:
diff --git a/xen/include/xen/domain.h b/xen/include/xen/domain.h
index 601ef431cf621af44c867400499b73b845eb137a..6102826a929ff7aad58a4bc40974815071a97446 100644
--- a/xen/include/xen/domain.h
+++ b/xen/include/xen/domain.h
@@ -171,6 +171,8 @@ extern bool vmtrace_available;
 
 extern bool vpmu_is_available;
 
+extern domid_t max_init_domid;
+
 domid_t get_initial_domain_id(void);
 
 #endif /* __XEN_DOMAIN_H__ */

-- 
2.34.1



