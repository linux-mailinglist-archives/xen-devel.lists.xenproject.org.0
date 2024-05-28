Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 93DFF8D1E7F
	for <lists+xen-devel@lfdr.de>; Tue, 28 May 2024 16:23:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.731173.1136537 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sBxiu-0000qT-Pl; Tue, 28 May 2024 14:22:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 731173.1136537; Tue, 28 May 2024 14:22:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sBxiu-0000ny-N9; Tue, 28 May 2024 14:22:44 +0000
Received: by outflank-mailman (input) for mailman id 731173;
 Tue, 28 May 2024 14:22:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bNtp=M7=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1sBxit-0000ns-Po
 for xen-devel@lists.xenproject.org; Tue, 28 May 2024 14:22:43 +0000
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [2a00:1450:4864:20::62c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id be44446e-1cfd-11ef-b4bb-af5377834399;
 Tue, 28 May 2024 16:22:41 +0200 (CEST)
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-a635a74e0deso30209466b.0
 for <xen-devel@lists.xenproject.org>; Tue, 28 May 2024 07:22:41 -0700 (PDT)
Received: from andrewcoop.citrite.net ([160.101.139.1])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a626cc8e295sm617318766b.185.2024.05.28.07.22.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 May 2024 07:22:40 -0700 (PDT)
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
X-Inumbo-ID: be44446e-1cfd-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1716906161; x=1717510961; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hiFfRD3NkJZafGxeBd15GFIv6yknVt/RJZXHd7avlw0=;
        b=RivQJyvB3GjeaWMiuUAdljKgxl9FTHLISnuz/yz6SDbsrVW4a5b715/lcAnC9xOU2R
         xmO6563dj7t6Y6qttYnd5J0za2dDZ7lGougpon3An1z5SdXYR+scfYjk9CXttuuriAPJ
         KvjgwXbR/8MtDz2yHm54SA7BMiop3rQsrj9Gc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716906161; x=1717510961;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hiFfRD3NkJZafGxeBd15GFIv6yknVt/RJZXHd7avlw0=;
        b=HlxO+Z7Dkr//vnQzVZXIyTTh5Gh/KRoVem8MaaiZFPA1i6RngTCjaqVnoPdgHMEfaQ
         gn/O0TcYPsrnq3QYSy8fjMGKXuLSsyQVUCp8TLH5Ac+NBQId9K50YIHMKic+c7hEpfbN
         qWIRMPJKSFmjiHXWMkqraGmXtCj5hFXh5CaeIAu6OYB8YBlU2+OmaskL0XxixQ2Z6ts/
         eEgcO3xpcgdbJ47+7ctY5z3WBKcEs2QngJOCw5LAsbsttEEKXZOvk+OoV8EvKdmsbS4y
         hUX3XVHIkVlW+6ilLZ62+fWhLAPbrxZm36xnOK31FZ1vm47tvwDUaM4bscQl3kgbxeYL
         gg8w==
X-Gm-Message-State: AOJu0Ywju2Gc3a66JfdfKJFo0Zw7NiCB1Lx3y26EJ9jfCe30D6fcUWjy
	Q2SpxZPegiGUmihLU6qtl0IdbOambuGH1FYkohlC4d/rbVGkYpCMK96FU8c3MyYIbVs7kK2jtaM
	919Q=
X-Google-Smtp-Source: AGHT+IHvXG7uFMRmADwZ9KZBFro9Zxnay4o8Kz3oIymPjgQ/DwjM9yR/g3ZWlo0Vecjg+21SveG2YQ==
X-Received: by 2002:a17:906:3d0:b0:a63:5421:85b0 with SMTP id a640c23a62f3a-a6354218711mr80265266b.75.1716906160935;
        Tue, 28 May 2024 07:22:40 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Shawn Anastasio <sanastasio@raptorengineering.com>,
	"consulting @ bugseng . com" <consulting@bugseng.com>,
	Simone Ballarin <simone.ballarin@bugseng.com>,
	Federico Serafini <federico.serafini@bugseng.com>,
	Nicola Vetrini <nicola.vetrini@bugseng.com>
Subject: [PATCH v2 for-4.19 0.5/13] xen: Introduce CONFIG_SELF_TESTS
Date: Tue, 28 May 2024 15:22:38 +0100
Message-Id: <20240528142238.1340228-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240524200338.1232391-1-andrew.cooper3@citrix.com>
References: <20240524200338.1232391-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

... and move x86's stub_selftest() under this new option.

There is value in having these tests included in release builds too.

It will shortly be used to gate the bitops unit tests on all architectures.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Julien Grall <julien@xen.org>
CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
CC: Bertrand Marquis <bertrand.marquis@arm.com>
CC: Michal Orzel <michal.orzel@amd.com>
CC: Oleksii Kurochko <oleksii.kurochko@gmail.com>
CC: Shawn Anastasio <sanastasio@raptorengineering.com>
CC: consulting@bugseng.com <consulting@bugseng.com>
CC: Simone Ballarin <simone.ballarin@bugseng.com>
CC: Federico Serafini <federico.serafini@bugseng.com>
CC: Nicola Vetrini <nicola.vetrini@bugseng.com>

v2.5:
 * As suggested in "[PATCH v2 05/13] xen/bitops: Implement generic_f?sl() in
 lib/"

I've gone with SELF_TESTS rather than BOOT_TESTS, because already in bitops
we've got compile time tests (which aren't strictly boot time), and the
livepatching testing wants to be included here and is definitely not boot
time.
---
 xen/Kconfig.debug      | 6 ++++++
 xen/arch/x86/extable.c | 4 ++--
 xen/arch/x86/setup.c   | 2 +-
 3 files changed, 9 insertions(+), 3 deletions(-)

diff --git a/xen/Kconfig.debug b/xen/Kconfig.debug
index 61b24ac552cd..07ff7eb7ba83 100644
--- a/xen/Kconfig.debug
+++ b/xen/Kconfig.debug
@@ -29,6 +29,12 @@ config FRAME_POINTER
 	  maybe slower, but it gives very useful debugging information
 	  in case of any Xen bugs.
 
+config SELF_TESTS
+	bool "Extra self-testing"
+	default DEBUG
+	help
+	  Enable extra unit and functional testing.
+
 config COVERAGE
 	bool "Code coverage support"
 	depends on !LIVEPATCH
diff --git a/xen/arch/x86/extable.c b/xen/arch/x86/extable.c
index 8415cd1fa249..705cf9eb94ca 100644
--- a/xen/arch/x86/extable.c
+++ b/xen/arch/x86/extable.c
@@ -144,7 +144,7 @@ search_exception_table(const struct cpu_user_regs *regs, unsigned long *stub_ra)
     return 0;
 }
 
-#ifdef CONFIG_DEBUG
+#ifdef CONFIG_SELF_TESTS
 #include <asm/setup.h>
 #include <asm/traps.h>
 
@@ -214,7 +214,7 @@ int __init cf_check stub_selftest(void)
     return 0;
 }
 __initcall(stub_selftest);
-#endif
+#endif /* CONFIG_SELF_TESTS */
 
 unsigned long asmlinkage search_pre_exception_table(struct cpu_user_regs *regs)
 {
diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
index b50c9c84af6d..dd51e68dbe5b 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -742,7 +742,7 @@ static void noreturn init_done(void)
     system_state = SYS_STATE_active;
 
     /* Re-run stub recovery self-tests with CET-SS active. */
-    if ( IS_ENABLED(CONFIG_DEBUG) && cpu_has_xen_shstk )
+    if ( IS_ENABLED(CONFIG_SELF_TESTS) && cpu_has_xen_shstk )
         stub_selftest();
 
     domain_unpause_by_systemcontroller(dom0);

base-commit: 2d93f78bfe25f695d8ffb61d110da9df293ed71b
-- 
2.30.2


