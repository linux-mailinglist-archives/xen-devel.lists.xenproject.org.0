Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 30EBE778800
	for <lists+xen-devel@lfdr.de>; Fri, 11 Aug 2023 09:20:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.582280.911956 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qUMRA-0003po-9a; Fri, 11 Aug 2023 07:19:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 582280.911956; Fri, 11 Aug 2023 07:19:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qUMRA-0003lV-2P; Fri, 11 Aug 2023 07:19:56 +0000
Received: by outflank-mailman (input) for mailman id 582280;
 Fri, 11 Aug 2023 07:19:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9r9U=D4=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1qUMR8-0003ey-H9
 for xen-devel@lists.xenproject.org; Fri, 11 Aug 2023 07:19:54 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 77998ba3-3817-11ee-b284-6b7b168915f2;
 Fri, 11 Aug 2023 09:19:53 +0200 (CEST)
Received: from nico.bugseng.com (unknown [147.123.100.131])
 by support.bugseng.com (Postfix) with ESMTPSA id 2F49E4EE0741;
 Fri, 11 Aug 2023 09:19:53 +0200 (CEST)
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
X-Inumbo-ID: 77998ba3-3817-11ee-b284-6b7b168915f2
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org,
	michal.orzel@amd.com,
	xenia.ragiadakou@amd.com,
	ayan.kumar.halder@amd.com,
	consulting@bugseng.com,
	Nicola Vetrini <nicola.vetrini@bugseng.com>
Subject: [XEN PATCH 2/6] x86/setup: add missing headers
Date: Fri, 11 Aug 2023 09:19:27 +0200
Message-Id: <c4fbf7b2a763f1b8e700e2ed36628c047231cb46.1691676251.git.nicola.vetrini@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1691676251.git.nicola.vetrini@bugseng.com>
References: <cover.1691676251.git.nicola.vetrini@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The missing headers declare variables 'xen_cpuidle' and 'use_invpcid'
that are then defined inside the file.
This is undesirable and also violates MISRA C:2012 Rule 8.4.
Adding suitable "#include"s resolves the issue.

The type of the variable 'xen_cpuidle' also changes according to
s/s8/int8_t/.

Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
Fixes: 3eab82196b02 ("x86: PIT broadcast to fix local APIC timer stop issue for Deep C state")
Fixes: 63dc135aeaf9 ("x86: invpcid support")
---
 xen/arch/x86/setup.c      | 4 +++-
 xen/include/xen/cpuidle.h | 2 +-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
index 80ae973d64e4..2bfc1fd00f8c 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -47,10 +47,12 @@
 #include <asm/mach-generic/mach_apic.h> /* for generic_apic_probe */
 #include <asm/setup.h>
 #include <xen/cpu.h>
+#include <xen/cpuidle.h>
 #include <asm/nmi.h>
 #include <asm/alternative.h>
 #include <asm/mc146818rtc.h>
 #include <asm/cpu-policy.h>
+#include <asm/invpcid.h>
 #include <asm/spec_ctrl.h>
 #include <asm/guest.h>
 #include <asm/microcode.h>
@@ -88,7 +90,7 @@ boolean_param("noapic", skip_ioapic_setup);
 
 /* **** Linux config option: propagated to domain0. */
 /* xen_cpuidle: xen control cstate. */
-s8 __read_mostly xen_cpuidle = -1;
+int8_t __read_mostly xen_cpuidle = -1;
 boolean_param("cpuidle", xen_cpuidle);
 
 #ifndef NDEBUG
diff --git a/xen/include/xen/cpuidle.h b/xen/include/xen/cpuidle.h
index 521a8deb04c2..705d0c1135f0 100644
--- a/xen/include/xen/cpuidle.h
+++ b/xen/include/xen/cpuidle.h
@@ -86,7 +86,7 @@ struct cpuidle_governor
     void (*reflect)         (struct acpi_processor_power *dev);
 };
 
-extern s8 xen_cpuidle;
+extern int8_t xen_cpuidle;
 extern struct cpuidle_governor *cpuidle_current_governor;
 
 bool cpuidle_using_deep_cstate(void);
-- 
2.34.1


