Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 19A1082F4CA
	for <lists+xen-devel@lfdr.de>; Tue, 16 Jan 2024 20:01:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.667996.1039805 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rPogz-00033A-8w; Tue, 16 Jan 2024 19:01:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 667996.1039805; Tue, 16 Jan 2024 19:01:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rPogz-00031b-6F; Tue, 16 Jan 2024 19:01:45 +0000
Received: by outflank-mailman (input) for mailman id 667996;
 Tue, 16 Jan 2024 19:01:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wmx9=I2=amazon.co.uk=prvs=738631f0b=eliasely@srs-se1.protection.inumbo.net>)
 id 1rPoXm-0002UD-4f
 for xen-devel@lists.xenproject.org; Tue, 16 Jan 2024 18:52:14 +0000
Received: from smtp-fw-9102.amazon.com (smtp-fw-9102.amazon.com
 [207.171.184.29]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5b316841-b4a0-11ee-98f1-6d05b1d4d9a1;
 Tue, 16 Jan 2024 19:52:12 +0100 (CET)
Received: from pdx4-co-svc-p1-lb2-vlan3.amazon.com (HELO
 email-inbound-relay-iad-1box-1dm6-7f722725.us-east-1.amazon.com)
 ([10.25.36.214]) by smtp-border-fw-9102.sea19.amazon.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jan 2024 18:52:10 +0000
Received: from smtpout.prod.us-east-1.prod.farcaster.email.amazon.dev
 (iad7-ws-svc-p70-lb3-vlan2.iad.amazon.com [10.32.235.34])
 by email-inbound-relay-iad-1box-1dm6-7f722725.us-east-1.amazon.com (Postfix)
 with ESMTPS id 4C12986ECA; Tue, 16 Jan 2024 18:52:07 +0000 (UTC)
Received: from EX19MTAUEA001.ant.amazon.com [10.0.44.209:54377]
 by smtpin.naws.us-east-1.prod.farcaster.email.amazon.dev [10.0.95.118:2525]
 with esmtp (Farcaster)
 id 9e06fc42-65ec-4c14-b51d-213d16eee67d; Tue, 16 Jan 2024 18:52:06 +0000 (UTC)
Received: from EX19D008UEA004.ant.amazon.com (10.252.134.191) by
 EX19MTAUEA001.ant.amazon.com (10.252.134.203) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Tue, 16 Jan 2024 18:51:59 +0000
Received: from EX19MTAUWB001.ant.amazon.com (10.250.64.248) by
 EX19D008UEA004.ant.amazon.com (10.252.134.191) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Tue, 16 Jan 2024 18:51:58 +0000
Received: from dev-dsk-eliasely-1a-fd74790f.eu-west-1.amazon.com
 (10.253.91.118) by mail-relay.amazon.com (10.250.64.254) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40 via Frontend Transport; Tue, 16 Jan 2024 18:51:56 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: 5b316841-b4a0-11ee-98f1-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
  t=1705431133; x=1736967133;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=OwpyHZJCgfsvXgrpfF3qQCU4NbQDoI500a3pBhrqpBY=;
  b=lTC2y5xp1rEfaDu/+8cUL02edy9LtvvvaSXhzlVtiNPglFYrn4zCeYU1
   m0tfQrJRqTBWYng0IwbggLWtqlq6zPf19PoV/qrsqd0FKTVTMDokNLL0X
   8yPcFIveCbTihCzWrAmy7I9SqmMwdwdIrWmsS1ODwyIzZKNuEEeNYLyAL
   A=;
X-IronPort-AV: E=Sophos;i="6.05,200,1701129600"; 
   d="scan'208";a="390202576"
X-Farcaster-Flow-ID: 9e06fc42-65ec-4c14-b51d-213d16eee67d
From: Elias El Yandouzi <eliasely@amazon.com>
To: <xen-devel@lists.xenproject.org>
CC: <julien@xen.org>, <pdurrant@amazon.com>, <dwmw@amazon.com>, Hongyan Xia
	<hongyxia@amazon.com>, Andrew Cooper <andrew.cooper3@citrix.com>, "George
 Dunlap" <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, Julien Grall
	<jgrall@amazon.com>
Subject: [PATCH v2] x86: Add a boot option to enable and disable the direct map
Date: Tue, 16 Jan 2024 18:50:42 +0000
Message-ID: <20240116185056.15000-14-eliasely@amazon.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240116185056.15000-1-eliasely@amazon.com>
References: <20240116185056.15000-1-eliasely@amazon.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Precedence: Bulk

From: Hongyan Xia <hongyxia@amazon.com>

Also add a helper function to retrieve it. Change arch_mfns_in_direct_map
to check this option before returning.

This is added as a Kconfig option as well as a boot command line option.
While being generic, the Kconfig option is only usable for x86 at the moment.

Signed-off-by: Hongyan Xia <hongyxia@amazon.com>
Signed-off-by: Julien Grall <jgrall@amazon.com>

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
index 8e65f8bd18..63c946f482 100644
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
+Enable or disable the direct map region in Xen.
+
+By default, Xen creates the direct map region which maps physical memory
+in that region. Setting this to no will remove the direct map, blocking
+exploits that leak secrets via speculative memory access in the direct
+map.
+
 ### dma_bits
 > `= <integer>`
 
diff --git a/xen/arch/x86/Kconfig b/xen/arch/x86/Kconfig
index 1acdffc51c..350f41b832 100644
--- a/xen/arch/x86/Kconfig
+++ b/xen/arch/x86/Kconfig
@@ -29,6 +29,7 @@ config X86
 	select HAS_UBSAN
 	select HAS_VPCI if HVM
 	select NEEDS_LIBELF
+	select HAS_SECRET_HIDING
 
 config ARCH_DEFCONFIG
 	string
diff --git a/xen/arch/x86/include/asm/mm.h b/xen/arch/x86/include/asm/mm.h
index 7d26d9cd2f..4aae270a78 100644
--- a/xen/arch/x86/include/asm/mm.h
+++ b/xen/arch/x86/include/asm/mm.h
@@ -620,10 +620,18 @@ void write_32bit_pse_identmap(uint32_t *l2);
 /*
  * x86 maps part of physical memory via the directmap region.
  * Return whether the range of MFN falls in the directmap region.
+ *
+ * When boot command line sets directmap=no, we will not have a direct map at
+ * all so this will always return false.
  */
 static inline bool arch_mfns_in_directmap(unsigned long mfn, unsigned long nr)
 {
-    unsigned long eva = min(DIRECTMAP_VIRT_END, HYPERVISOR_VIRT_END);
+    unsigned long eva;
+
+    if ( !has_directmap() )
+        return false;
+
+    eva = min(DIRECTMAP_VIRT_END, HYPERVISOR_VIRT_END);
 
     return (mfn + nr) <= (virt_to_mfn(eva - 1) + 1);
 }
diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
index 4d0c90b7a0..b813ea75b5 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -1512,6 +1512,8 @@ void asmlinkage __init noreturn __start_xen(unsigned long mbi_p)
     if ( highmem_start )
         xenheap_max_mfn(PFN_DOWN(highmem_start - 1));
 
+    printk("Booting with directmap %s\n", has_directmap() ? "on" : "off");
+
     /*
      * Walk every RAM region and map it in its entirety (on x86/64, at least)
      * and notify it to the boot allocator.
diff --git a/xen/common/Kconfig b/xen/common/Kconfig
index 310ad4229c..9a24c89ac5 100644
--- a/xen/common/Kconfig
+++ b/xen/common/Kconfig
@@ -83,6 +83,23 @@ config HAS_UBSAN
 config MEM_ACCESS_ALWAYS_ON
 	bool
 
+config HAS_SECRET_HIDING
+	bool
+
+config SECRET_HIDING
+    bool "Secret hiding"
+    depends on HAS_SECRET_HIDING
+    ---help---
+    The directmap contains mapping for most of the RAM which makes domain
+    memory easily accessible. While making the performance better, it also makes
+    the hypervisor more vulnerable to speculation attacks.
+
+    Enabling this feature will allow the user to decide whether the memory
+    is always mapped at boot or mapped only on demand (see the command line
+    option "directmap").
+
+    If unsure, say N.
+
 config MEM_ACCESS
 	def_bool MEM_ACCESS_ALWAYS_ON
 	prompt "Memory Access and VM events" if !MEM_ACCESS_ALWAYS_ON
diff --git a/xen/common/page_alloc.c b/xen/common/page_alloc.c
index 740b6f0ff7..a3746cfbcf 100644
--- a/xen/common/page_alloc.c
+++ b/xen/common/page_alloc.c
@@ -173,6 +173,11 @@ paddr_t __ro_after_init mem_hotplug;
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
index 3d9b2d05a5..f860e98ee4 100644
--- a/xen/include/xen/mm.h
+++ b/xen/include/xen/mm.h
@@ -165,6 +165,13 @@ extern unsigned long max_page;
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


