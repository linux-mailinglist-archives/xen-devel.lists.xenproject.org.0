Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BF7998C4224
	for <lists+xen-devel@lfdr.de>; Mon, 13 May 2024 15:41:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.720930.1124030 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s6VvZ-0004uA-Ff; Mon, 13 May 2024 13:41:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 720930.1124030; Mon, 13 May 2024 13:41:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s6VvZ-0004oI-9h; Mon, 13 May 2024 13:41:17 +0000
Received: by outflank-mailman (input) for mailman id 720930;
 Mon, 13 May 2024 13:41:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=w2Lj=MQ=amazon.co.uk=prvs=8568adbc3=eliasely@srs-se1.protection.inumbo.net>)
 id 1s6VvW-0002lY-Sh
 for xen-devel@lists.xenproject.org; Mon, 13 May 2024 13:41:14 +0000
Received: from smtp-fw-80009.amazon.com (smtp-fw-80009.amazon.com
 [99.78.197.220]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7682f9fd-112e-11ef-b4bb-af5377834399;
 Mon, 13 May 2024 15:41:12 +0200 (CEST)
Received: from pdx4-co-svc-p1-lb2-vlan2.amazon.com (HELO
 smtpout.prod.us-west-2.prod.farcaster.email.amazon.dev) ([10.25.36.210])
 by smtp-border-fw-80009.pdx80.corp.amazon.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2024 13:41:08 +0000
Received: from EX19MTAUEB002.ant.amazon.com [10.0.0.204:52542]
 by smtpin.naws.us-east-1.prod.farcaster.email.amazon.dev [10.0.83.223:2525]
 with esmtp (Farcaster)
 id 111a19b8-6e8a-4b34-aba9-a09724c45941; Mon, 13 May 2024 13:41:08 +0000 (UTC)
Received: from EX19D008UEC003.ant.amazon.com (10.252.135.194) by
 EX19MTAUEB002.ant.amazon.com (10.252.135.47) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.28; Mon, 13 May 2024 13:41:04 +0000
Received: from EX19MTAUWB001.ant.amazon.com (10.250.64.248) by
 EX19D008UEC003.ant.amazon.com (10.252.135.194) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.28; Mon, 13 May 2024 13:41:04 +0000
Received: from dev-dsk-eliasely-1a-fd74790f.eu-west-1.amazon.com
 (10.253.91.118) by mail-relay.amazon.com (10.250.64.254) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.28 via Frontend Transport; Mon, 13 May 2024 13:41:02 +0000
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
X-Inumbo-ID: 7682f9fd-112e-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
  t=1715607673; x=1747143673;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=YiMscZoqlqA2XJ1v3gO3e8DXR6HvvHTgLBqJAfmepmI=;
  b=HUQ7GfIFvo7e1Fn0AnP3cCiYzhtqHgQKuHy9nIbEYwr6LGx946yyNdm3
   hGOpSp8Flm1bJpw/bv10j3eE9kv3FzOrzP3OTl6UAcXR9OqANFNyQUsK+
   7FAd7SWddaEWKa1v6nH0oXbWhj50x7FMHB4OaPE89GaD5+4Xi9EeCFxAG
   o=;
X-IronPort-AV: E=Sophos;i="6.08,158,1712620800"; 
   d="scan'208";a="88857729"
X-Farcaster-Flow-ID: 111a19b8-6e8a-4b34-aba9-a09724c45941
From: Elias El Yandouzi <eliasely@amazon.com>
To: <xen-devel@lists.xenproject.org>
CC: <julien@xen.org>, <pdurrant@amazon.com>, <dwmw@amazon.com>, Hongyan Xia
	<hongyxia@amazon.com>, Andrew Cooper <andrew.cooper3@citrix.com>, "George
 Dunlap" <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, "Stefano
 Stabellini" <sstabellini@kernel.org>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Julien Grall <jgrall@amazon.com>, Elias El Yandouzi
	<eliasely@amazon.com>
Subject: [PATCH V3 (resend) 06/19] x86: Add a boot option to enable and disable the direct map
Date: Mon, 13 May 2024 13:40:33 +0000
Message-ID: <20240513134046.82605-7-eliasely@amazon.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240513134046.82605-1-eliasely@amazon.com>
References: <20240513134046.82605-1-eliasely@amazon.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Hongyan Xia <hongyxia@amazon.com>

Also add a helper function to retrieve it. Change arch_mfns_in_direct_map
to check this option before returning.

This is added as a Kconfig option as well as a boot command line option.
While being generic, the Kconfig option is only usable for x86 at the moment.

Note that there remains some users of the directmap at this point. The option
is introduced now as it will be needed in follow-up patches.

Signed-off-by: Hongyan Xia <hongyxia@amazon.com>
Signed-off-by: Julien Grall <jgrall@amazon.com>
Signed-off-by: Elias El Yandouzi <eliasely@amazon.com>

----

    Changes in V2:
        * Introduce a Kconfig option
        * Reword the commit message
        * Make opt_directmap and helper generic

    Changes since Hongyan's version:
        * Reword the commit message
        * opt_directmap is only modified during boot so mark it as
          __ro_after_init

diff --git a/docs/misc/xen-command-line.pandoc b/docs/misc/xen-command-line.pandoc
index e760f3266e..743d343ffa 100644
--- a/docs/misc/xen-command-line.pandoc
+++ b/docs/misc/xen-command-line.pandoc
@@ -799,6 +799,18 @@ that enabling this option cannot guarantee anything beyond what underlying
 hardware guarantees (with, where available and known to Xen, respective
 tweaks applied).
 
+### directmap (x86)
+> `= <boolean>`
+
+> Default: `true`
+
+Enable or disable the directmap region in Xen.
+
+By default, Xen creates the directmap region which maps physical memory
+in that region. Setting this to no will sparsely populate the directmap,
+blocking exploits that leak secrets via speculative memory access in the
+directmap.
+
 ### dma_bits
 > `= <integer>`
 
diff --git a/xen/arch/x86/Kconfig b/xen/arch/x86/Kconfig
index 7e03e4bc55..b4ec0e582e 100644
--- a/xen/arch/x86/Kconfig
+++ b/xen/arch/x86/Kconfig
@@ -28,6 +28,7 @@ config X86
 	select HAS_PCI_MSI
 	select HAS_PIRQ
 	select HAS_SCHED_GRANULARITY
+	select HAS_SECRET_HIDING
 	select HAS_UBSAN
 	select HAS_VPCI if HVM
 	select NEEDS_LIBELF
diff --git a/xen/arch/x86/include/asm/mm.h b/xen/arch/x86/include/asm/mm.h
index 98b66edaca..54d835f156 100644
--- a/xen/arch/x86/include/asm/mm.h
+++ b/xen/arch/x86/include/asm/mm.h
@@ -622,11 +622,17 @@ void write_32bit_pse_identmap(uint32_t *l2);
 /*
  * x86 maps part of physical memory via the directmap region.
  * Return whether the range of MFN falls in the directmap region.
+ *
+ * When boot command line sets directmap=no, the directmap will mostly be empty
+ * so this will always return false.
  */
 static inline bool arch_mfns_in_directmap(unsigned long mfn, unsigned long nr)
 {
     unsigned long eva = min(DIRECTMAP_VIRT_END, HYPERVISOR_VIRT_END);
 
+    if ( !has_directmap() )
+        return false;
+
     return (mfn + nr) <= (virt_to_mfn(eva - 1) + 1);
 }
 
diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
index f84e1cd79c..bd6b1184f5 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -1517,6 +1517,8 @@ void asmlinkage __init noreturn __start_xen(unsigned long mbi_p)
     if ( highmem_start )
         xenheap_max_mfn(PFN_DOWN(highmem_start - 1));
 
+    printk("Booting with directmap %s\n", has_directmap() ? "on" : "off");
+
     /*
      * Walk every RAM region and map it in its entirety (on x86/64, at least)
      * and notify it to the boot allocator.
diff --git a/xen/common/Kconfig b/xen/common/Kconfig
index 565ceda741..856604068c 100644
--- a/xen/common/Kconfig
+++ b/xen/common/Kconfig
@@ -80,12 +80,29 @@ config HAS_PMAP
 config HAS_SCHED_GRANULARITY
 	bool
 
+config HAS_SECRET_HIDING
+	bool
+
 config HAS_UBSAN
 	bool
 
 config MEM_ACCESS_ALWAYS_ON
 	bool
 
+config SECRET_HIDING
+    bool "Secret hiding"
+    depends on HAS_SECRET_HIDING
+    help
+		The directmap contains mapping for most of the RAM which makes domain
+		memory easily accessible. While making the performance better, it also makes
+		the hypervisor more vulnerable to speculation attacks.
+
+		Enabling this feature will allow the user to decide whether the memory
+		is always mapped at boot or mapped only on demand (see the command line
+		option "directmap").
+
+		If unsure, say N.
+
 config MEM_ACCESS
 	def_bool MEM_ACCESS_ALWAYS_ON
 	prompt "Memory Access and VM events" if !MEM_ACCESS_ALWAYS_ON
diff --git a/xen/common/page_alloc.c b/xen/common/page_alloc.c
index 7c1bdfc046..9b7e4721cd 100644
--- a/xen/common/page_alloc.c
+++ b/xen/common/page_alloc.c
@@ -174,6 +174,11 @@ paddr_t __ro_after_init mem_hotplug;
 static char __initdata opt_badpage[100] = "";
 string_param("badpage", opt_badpage);
 
+bool __ro_after_init opt_directmap = true;
+#ifdef CONFIG_HAS_SECRET_HIDING
+boolean_param("directmap", opt_directmap);
+#endif
+
 /*
  * no-bootscrub -> Free pages are not zeroed during boot.
  */
diff --git a/xen/include/xen/mm.h b/xen/include/xen/mm.h
index 7561297a75..9d4f1f2d0d 100644
--- a/xen/include/xen/mm.h
+++ b/xen/include/xen/mm.h
@@ -167,6 +167,13 @@ extern unsigned long max_page;
 extern unsigned long total_pages;
 extern paddr_t mem_hotplug;
 
+extern bool opt_directmap;
+
+static inline bool has_directmap(void)
+{
+    return opt_directmap;
+}
+
 /*
  * Extra fault info types which are used to further describe
  * the source of an access violation.
-- 
2.40.1


