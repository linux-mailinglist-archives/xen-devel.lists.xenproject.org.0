Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 18E249E6693
	for <lists+xen-devel@lfdr.de>; Fri,  6 Dec 2024 06:01:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.849758.1264328 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tJQSi-0001jv-Ge; Fri, 06 Dec 2024 05:01:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 849758.1264328; Fri, 06 Dec 2024 05:01:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tJQSi-0001iS-Dl; Fri, 06 Dec 2024 05:01:08 +0000
Received: by outflank-mailman (input) for mailman id 849758;
 Fri, 06 Dec 2024 05:01:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5aHD=S7=kernel.org=devnull+dmukhin.ford.com@srs-se1.protection.inumbo.net>)
 id 1tJQA7-0004Kb-0S
 for xen-devel@lists.xenproject.org; Fri, 06 Dec 2024 04:41:55 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 642d15e5-b38c-11ef-99a3-01e77a169b0f;
 Fri, 06 Dec 2024 05:41:43 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 505A75C7323;
 Fri,  6 Dec 2024 04:40:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id E50A9C4CEDE;
 Fri,  6 Dec 2024 04:41:38 +0000 (UTC)
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id DBE78E77175;
 Fri,  6 Dec 2024 04:41:38 +0000 (UTC)
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
X-Inumbo-ID: 642d15e5-b38c-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733460098;
	bh=PJJ4npH36unNSzjXcb8NI2vArWEkfURXL6bFFuUiDHo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=UQgkSZtWVa9FG9t1D5mOZW5z072Osw8G8GmdO1+7fn17cWhT0Ro8xPOW/k8vF45No
	 kA21roJuxVeE0nzz7aI/hcDSWdDh5fd1KR36560FtLwOLm0BfIbgarlaI3I7dXFkAy
	 ue39WmPRawJ1/n9YG9L3vT1WBEYrNBiINIbnRUt7kTpYEOI4Cz3zIH0I+uG3HwCSlX
	 lCpXFcN+KXgYunteT3BKGARDEuxesjKuQWhCgdicE3PMsZahaoisGbUJMt1QAvFc2y
	 mNaU3ZSiqJCiPoo6Wq/ToTGYZaEtn4mr3CWdaDnLfMS4bDoldla6Lhi4cbsOAUskja
	 nhYA9JkPvmNFg==
From: Denis Mukhin via B4 Relay <devnull+dmukhin.ford.com@kernel.org>
Date: Thu, 05 Dec 2024 20:41:54 -0800
Subject: [PATCH v2 24/35] xen/console: introduce hwdom_crashconsole=
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241205-vuart-ns8250-v1-24-e9aa923127eb@ford.com>
References: <20241205-vuart-ns8250-v1-0-e9aa923127eb@ford.com>
In-Reply-To: <20241205-vuart-ns8250-v1-0-e9aa923127eb@ford.com>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, 
 Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, 
 Stefano Stabellini <sstabellini@kernel.org>, 
 Denis Mukhin <dmukhin@ford.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1733460094; l=3897;
 i=dmukhin@ford.com; s=20241125; h=from:subject:message-id;
 bh=1SE1nPGu4xeTH/OTKpOlxTlLd/mo9Wc6622Zz4Y1AHc=;
 b=Ojfyv76A9s+nHItTnUu5XXzmcReLwQ/cS7xcueyxc3sbROAgSJngYgjiuIlonbN9oIe8CBGJs
 YSZYIJCFA4+CNyG8V/SJfCQkjRyHkBMEHk16OIe2bCfcQi3csn2vS0U
X-Developer-Key: i=dmukhin@ford.com; a=ed25519;
 pk=SsDZ9p39s0fqcpUKQuqKqrbn0rq6EtEAClvpOpzx6+U=
X-Endpoint-Received: by B4 Relay for dmukhin@ford.com/20241125 with
 auth_id=287
X-Original-From: Denis Mukhin <dmukhin@ford.com>
Reply-To: dmukhin@ford.com

From: Denis Mukhin <dmukhin@ford.com>

The new command line switch `hwdom_crashconsole=BOOL` allows to switch serial
console input focus to xen for machine state inspection using keyhandler
mechanism after the hardware domain crashes.

The new command line switch is aliased via `dom0=...,crashconsole` knob.

Such functionality can be useful while debugging dom0 bringup.

Signed-off-by: Denis Mukhin <dmukhin@ford.com>
---
 docs/misc/xen-command-line.pandoc |  5 +++++
 xen/arch/x86/dom0_build.c         |  2 ++
 xen/common/domain.c               | 14 +++++++++++++-
 xen/include/xen/domain.h          |  1 +
 4 files changed, 21 insertions(+), 1 deletion(-)

diff --git a/docs/misc/xen-command-line.pandoc b/docs/misc/xen-command-line.pandoc
index 293dbc1a957ba6e668fd4d55d58e84f643822126..fb77d7dca1ea517f79d6713aa6909422f31e7724 100644
--- a/docs/misc/xen-command-line.pandoc
+++ b/docs/misc/xen-command-line.pandoc
@@ -806,6 +806,7 @@ Specify the bit width of the DMA heap.
 
 ### dom0
     = List of [ pv | pvh, shadow=<bool>, verbose=<bool>,
+                crashconsole=<bool>,
                 cpuid-faulting=<bool>, msr-relaxed=<bool> ] (x86)
 
     = List of [ sve=<integer> ] (Arm64)
@@ -839,6 +840,10 @@ Controls for how dom0 is constructed on x86 systems.
     information during the dom0 build.  It defaults to the compile time choice
     of `CONFIG_VERBOSE_DEBUG`.
 
+*   The `crashconsole` boolean instructs Xen to drop into emergency console
+    in case of dom0 crash. May be useful for dom0 bringup on a custom
+    hardware.
+
 *   The `cpuid-faulting` boolean is an interim option, is only applicable to
     PV dom0, and defaults to true.
 
diff --git a/xen/arch/x86/dom0_build.c b/xen/arch/x86/dom0_build.c
index e8f5bf5447bc47a6daa3d95787106a4c11e80d31..706aeec0ecbb565a415edbfb33ca2fd72967c560 100644
--- a/xen/arch/x86/dom0_build.c
+++ b/xen/arch/x86/dom0_build.c
@@ -286,6 +286,8 @@ int __init parse_arch_dom0_param(const char *s, const char *e)
         opt_dom0_cpuid_faulting = val;
     else if ( (val = parse_boolean("msr-relaxed", s, e)) >= 0 )
         opt_dom0_msr_relaxed = val;
+    else if ( (val = parse_boolean("crashconsole", s, e)) >= 0 )
+        opt_hwdom_crashconsole = !!val;
     else
         return -EINVAL;
 
diff --git a/xen/common/domain.c b/xen/common/domain.c
index aab546c0a8535e4f007cbbc9c5c552bcf66b5807..4fe69f294158dda7b2e0b9d98d49c34e04131cb8 100644
--- a/xen/common/domain.c
+++ b/xen/common/domain.c
@@ -56,6 +56,13 @@ unsigned int xen_processor_pmbits = XEN_PROCESSOR_PM_PX;
 bool opt_dom0_vcpus_pin;
 boolean_param("dom0_vcpus_pin", opt_dom0_vcpus_pin);
 
+/*
+ * Hardware domain crash handler: if true, do not halt machine, but switch to
+ * Xen console for debugging.
+ */
+bool opt_hwdom_crashconsole;
+boolean_param("hwdom_crashconsole", opt_hwdom_crashconsole);
+
 /* Protect updates/reads (resp.) of domain_list and domain_hash. */
 DEFINE_SPINLOCK(domlist_update_lock);
 DEFINE_RCU_READ_LOCK(domlist_read_lock);
@@ -1138,7 +1145,12 @@ int domain_shutdown(struct domain *d, u8 reason)
     reason = d->shutdown_code;
 
     if ( is_hardware_domain(d) )
-        hwdom_shutdown(reason);
+    {
+        if ( opt_hwdom_crashconsole )
+            console_set_owner(DOMID_XEN);
+        else
+            hwdom_shutdown(reason);
+    }
 
     if ( d->is_shutting_down )
     {
diff --git a/xen/include/xen/domain.h b/xen/include/xen/domain.h
index 6102826a929ff7aad58a4bc40974815071a97446..e0c52af878b69e28e2d19957d0d3a8234860ecba 100644
--- a/xen/include/xen/domain.h
+++ b/xen/include/xen/domain.h
@@ -150,6 +150,7 @@ extern unsigned int xen_processor_pmbits;
 extern bool opt_dom0_vcpus_pin;
 extern cpumask_t dom0_cpus;
 extern bool dom0_affinity_relaxed;
+extern bool opt_hwdom_crashconsole;
 
 /* vnuma topology per domain. */
 struct vnuma_info {

-- 
2.34.1



