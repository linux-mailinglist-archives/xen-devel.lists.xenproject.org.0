Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 60B77802D84
	for <lists+xen-devel@lfdr.de>; Mon,  4 Dec 2023 09:48:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.646615.1009055 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rA4c2-0004KF-PU; Mon, 04 Dec 2023 08:47:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 646615.1009055; Mon, 04 Dec 2023 08:47:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rA4c2-0004Hg-LY; Mon, 04 Dec 2023 08:47:34 +0000
Received: by outflank-mailman (input) for mailman id 646615;
 Mon, 04 Dec 2023 08:47:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=IWUc=HP=kernel.org=arnd@srs-se1.protection.inumbo.net>)
 id 1rA4c1-0004GM-7x
 for xen-devel@lists.xenproject.org; Mon, 04 Dec 2023 08:47:33 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org
 [2604:1380:4601:e00::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c28977a8-9281-11ee-9b0f-b553b5be7939;
 Mon, 04 Dec 2023 09:47:31 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id 1D86BB80D0D;
 Mon,  4 Dec 2023 08:47:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0EB18C433C8;
 Mon,  4 Dec 2023 08:47:26 +0000 (UTC)
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
X-Inumbo-ID: c28977a8-9281-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701679649;
	bh=yWpIH3H9GnySfKiZ2biNF5eZOOjjW8G9znn26WMmWq8=;
	h=From:To:Cc:Subject:Date:From;
	b=Bt3tvQd17fxJG1QhyKLzWmqZhTgFXCUi8NohfV/BqaRjuxBDL9Fj93TEqKVCQ3prU
	 cECFd3wX7hGQ1ZsUi1sVIDMP1aDiiYTgo30xsobza+llJl7HUKfOl7kkwRGQroloEl
	 yd2Q8qCHNPURUuMjaU/6j+kOWycz0WtS3sXUOyrE3qfJ0RfyJuklEFWgs1tcOV3oXr
	 x869c6XKfR4pe6BA3BUr8dc6woUP3GgRaQiA0e9xzy5syhPrdc0yyIIv0EFZ11zBg+
	 El8TBWLd6TH3ElkOkDmVHbNPpODQxtFJYZbsMQLOInyjm0yqJ75sqGIHTuYHICIIgG
	 yggzDxlBMAi+Q==
From: Arnd Bergmann <arnd@kernel.org>
To: Juergen Gross <jgross@suse.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	xen-devel@lists.xenproject.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] x86/xen: add CPU dependencies for 32-bit build
Date: Mon,  4 Dec 2023 09:47:01 +0100
Message-Id: <20231204084722.3789473-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

Xen only supports modern CPUs even when running a 32-bit kernel, and it now
requires a kernel built for a 64 byte (or larger) cache line:

In file included from <command-line>:
In function 'xen_vcpu_setup',
    inlined from 'xen_vcpu_setup_restore' at arch/x86/xen/enlighten.c:111:3,
    inlined from 'xen_vcpu_restore' at arch/x86/xen/enlighten.c:141:3:
include/linux/compiler_types.h:435:45: error: call to '__compiletime_assert_287' declared with attribute error: BUILD_BUG_ON failed: sizeof(*vcpup) > SMP_CACHE_BYTES
arch/x86/xen/enlighten.c:166:9: note: in expansion of macro 'BUILD_BUG_ON'
  166 |         BUILD_BUG_ON(sizeof(*vcpup) > SMP_CACHE_BYTES);
      |         ^~~~~~~~~~~~

Enforce the dependency with a whitelist of CPU configurations. In normal
distro kernels, CONFIG_X86_GENERIC is enabled, and this works fine. When this
is not set, still allow Xen to be built on kernels that target a 64-bit
capable CPU.

Fixes: db2832309a82 ("x86/xen: fix percpu vcpu_info allocation")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/x86/xen/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/x86/xen/Kconfig b/arch/x86/xen/Kconfig
index 9b1ec5d8c99c..a65fc2ae15b4 100644
--- a/arch/x86/xen/Kconfig
+++ b/arch/x86/xen/Kconfig
@@ -9,6 +9,7 @@ config XEN
 	select PARAVIRT_CLOCK
 	select X86_HV_CALLBACK_VECTOR
 	depends on X86_64 || (X86_32 && X86_PAE)
+	depends on X86_64 || (X86_GENERIC || MPENTIUM4 || MCORE2 || MATOM || MK8)
 	depends on X86_LOCAL_APIC && X86_TSC
 	help
 	  This is the Linux Xen port.  Enabling this will allow the
-- 
2.39.2


