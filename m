Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DDAE19C3F5D
	for <lists+xen-devel@lfdr.de>; Mon, 11 Nov 2024 14:12:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.833732.1248961 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tAUDE-0000AK-T2; Mon, 11 Nov 2024 13:12:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 833732.1248961; Mon, 11 Nov 2024 13:12:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tAUDE-00007W-PS; Mon, 11 Nov 2024 13:12:12 +0000
Received: by outflank-mailman (input) for mailman id 833732;
 Mon, 11 Nov 2024 13:12:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=//j0=SG=amazon.co.uk=prvs=038d26d0c=eliasely@srs-se1.protection.inumbo.net>)
 id 1tAUDD-0007pD-8y
 for xen-devel@lists.xenproject.org; Mon, 11 Nov 2024 13:12:11 +0000
Received: from smtp-fw-6002.amazon.com (smtp-fw-6002.amazon.com [52.95.49.90])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8cff79c6-a02e-11ef-99a3-01e77a169b0f;
 Mon, 11 Nov 2024 14:12:07 +0100 (CET)
Received: from iad6-co-svc-p1-lb1-vlan3.amazon.com (HELO
 smtpout.prod.us-east-1.prod.farcaster.email.amazon.dev) ([10.124.125.6])
 by smtp-border-fw-6002.iad6.amazon.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2024 13:12:04 +0000
Received: from EX19MTAUEB002.ant.amazon.com [10.0.0.204:33875]
 by smtpin.naws.us-east-1.prod.farcaster.email.amazon.dev [10.0.48.172:2525]
 with esmtp (Farcaster)
 id 8b24fb90-c20d-42da-9514-cb3d2facd874; Mon, 11 Nov 2024 13:12:04 +0000 (UTC)
Received: from EX19D008UEA004.ant.amazon.com (10.252.134.191) by
 EX19MTAUEB002.ant.amazon.com (10.252.135.47) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.1258.34;
 Mon, 11 Nov 2024 13:12:03 +0000
Received: from EX19MTAUEA001.ant.amazon.com (10.252.134.203) by
 EX19D008UEA004.ant.amazon.com (10.252.134.191) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.1258.34;
 Mon, 11 Nov 2024 13:12:03 +0000
Received: from email-imr-corp-prod-pdx-all-2b-5ec155c2.us-west-2.amazon.com
 (10.124.125.2) by mail-relay.amazon.com (10.252.134.102) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id
 15.2.1258.34 via Frontend Transport; Mon, 11 Nov 2024 13:12:03 +0000
Received: from dev-dsk-eliasely-1a-fd74790f.eu-west-1.amazon.com
 (dev-dsk-eliasely-1a-fd74790f.eu-west-1.amazon.com [10.253.91.118])
 by email-imr-corp-prod-pdx-all-2b-5ec155c2.us-west-2.amazon.com (Postfix) with
 ESMTPS id B071742133; Mon, 11 Nov 2024 13:12:01 +0000 (UTC)
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
X-Inumbo-ID: 8cff79c6-a02e-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjUyLjk1LjQ5LjkwIiwiaGVsbyI6InNtdHAtZnctNjAwMi5hbWF6b24uY29tIn0=
X-Custom-Transaction: eyJpZCI6IjhjZmY3OWM2LWEwMmUtMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMxMzMwNzI3Ljc1MTMwNiwic2VuZGVyIjoicHJ2cz0wMzhkMjZkMGM9ZWxpYXNlbHlAYW1hem9uLmNvLnVrIiwicmVjaXBpZW50IjoieGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnIn0=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
  t=1731330727; x=1762866727;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=NWIwGRJXlVDN14kBG5n0Ww+/BOM/U6VioMpFX1uyIRk=;
  b=D+wQ+XgGkxYROZyzWsoJ7s28Cb8xHF0j+4l6CSfk4NT5dCJO5h2UHF5C
   5ODMQl/Be6MqNgzR6n/fkXYM0r5MeBvA8zGdcFSC7+8wU8wh+4j9kXgi5
   tq3oKfDJGc47LrEW00IRB9cLm5AhhfbMjxq9SDxape8fX+jqKVDPO1fnu
   E=;
X-IronPort-AV: E=Sophos;i="6.12,145,1728950400"; 
   d="scan'208";a="447823622"
X-Farcaster-Flow-ID: 8b24fb90-c20d-42da-9514-cb3d2facd874
From: Elias El Yandouzi <eliasely@amazon.com>
To: <xen-devel@lists.xenproject.org>
CC: <julien@xen.org>, <pdurrant@amazon.com>, <dwmw@amazon.com>, Hongyan Xia
	<hongyxia@amazon.com>, Julien Grall <jgrall@amazon.com>, Elias El Yandouzi
	<eliasely@amazon.com>
Subject: [PATCH V4 05/15] x86: Add a boot option to enable and disable the direct map
Date: Mon, 11 Nov 2024 13:11:38 +0000
Message-ID: <20241111131148.52568-6-eliasely@amazon.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20241111131148.52568-1-eliasely@amazon.com>
References: <20241111131148.52568-1-eliasely@amazon.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Hongyan Xia <hongyxia@amazon.com>

This is added as a Kconfig option as well as a boot command line option.
While being generic, the Kconfig option is only usable for x86 at the moment.

Note that there remains some users of the directmap at this point. The option
is introduced now as it will be needed in follow-up patches.

Signed-off-by: Hongyan Xia <hongyxia@amazon.com>
Signed-off-by: Julien Grall <jgrall@amazon.com>
Signed-off-by: Elias El Yandouzi <eliasely@amazon.com>

----
    Changes in V4:
        * Rename the Kconfig options
        * Set opt_directmap to true if CONFIG_HAS_ONDEMAND_DIRECTMAP is not enabled

    Changes in V2:
        * Introduce a Kconfig option
        * Reword the commit message
        * Make opt_directmap and helper generic

    Changes since Hongyan's version:
        * Reword the commit message
        * opt_directmap is only modified during boot so mark it as
          __ro_after_init

diff --git a/docs/misc/xen-command-line.pandoc b/docs/misc/xen-command-line.pandoc
index 293dbc1a957b..10b0b2714661 100644
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
+Enable or disable fully populating the directmap region in Xen.
+
+By default, Xen creates the directmap region which maps all physical memory
+in that region. Disabling this option will sparsely populate the directmap,
+blocking exploits that leak secrets via speculative memory access in the
+directmap.
+
 ### dma_bits
 > `= <integer>`
 
diff --git a/xen/arch/x86/Kconfig b/xen/arch/x86/Kconfig
index 9cdd04721afa..55f1e8702ab9 100644
--- a/xen/arch/x86/Kconfig
+++ b/xen/arch/x86/Kconfig
@@ -23,6 +23,7 @@ config X86
 	select HAS_IOPORTS
 	select HAS_KEXEC
 	select HAS_NS16550
+	select HAS_ONDEMAND_DIRECTMAP
 	select HAS_PASSTHROUGH
 	select HAS_PCI
 	select HAS_PCI_MSI
diff --git a/xen/arch/x86/include/asm/mm.h b/xen/arch/x86/include/asm/mm.h
index 71a29b2cb3af..d3936bd173fa 100644
--- a/xen/arch/x86/include/asm/mm.h
+++ b/xen/arch/x86/include/asm/mm.h
@@ -620,11 +620,17 @@ void write_32bit_pse_identmap(uint32_t *l2);
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
index 177f4024abca..a3c21ca05099 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -1586,6 +1586,8 @@ void asmlinkage __init noreturn __start_xen(void)
     if ( highmem_start )
         xenheap_max_mfn(PFN_DOWN(highmem_start - 1));
 
+    printk("Booting with directmap %s\n", has_directmap() ? "full" : "on demand");
+
     /*
      * Walk every RAM region and map it in its entirety (on x86/64, at least)
      * and notify it to the boot allocator.
diff --git a/xen/common/Kconfig b/xen/common/Kconfig
index 90268d92499a..72094c491756 100644
--- a/xen/common/Kconfig
+++ b/xen/common/Kconfig
@@ -71,6 +71,9 @@ config HAS_IOPORTS
 config HAS_KEXEC
 	bool
 
+config HAS_ONDEMAND_DIRECTMAP
+	bool
+
 config HAS_PIRQ
 	bool
 
@@ -415,6 +418,20 @@ source "common/sched/Kconfig"
 config CRYPTO
 	bool
 
+config ONDEMAND_DIRECTMAP
+    bool "On-Demand Directmap"
+    depends on HAS_ONDEMAND_DIRECTMAP
+    help
+		The directmap contains mapping for most of the RAM, making domain
+		memory easily accessible. While this can improve performance, it also
+		increases the vulnerability to speculation attacks.
+
+		Enabling this feature allows the user to control whether the memory
+		is always mapped at boot or mapped only on demand (see the command line
+		option "directmap").
+
+		If unsure, say N.
+
 config LIVEPATCH
 	bool "Live patching support"
 	default X86
diff --git a/xen/common/page_alloc.c b/xen/common/page_alloc.c
index 33c8c917d984..b0be246780b7 100644
--- a/xen/common/page_alloc.c
+++ b/xen/common/page_alloc.c
@@ -175,6 +175,11 @@ paddr_t __ro_after_init mem_hotplug;
 static char __initdata opt_badpage[100] = "";
 string_param("badpage", opt_badpage);
 
+#ifdef CONFIG_HAS_ONDEMAND_DIRECTMAP
+bool __ro_after_init opt_directmap = true;
+boolean_param("directmap", opt_directmap);
+#endif
+
 /*
  * no-bootscrub -> Free pages are not zeroed during boot.
  */
diff --git a/xen/include/xen/mm.h b/xen/include/xen/mm.h
index 7561297a7553..9e3c9f3b6dfa 100644
--- a/xen/include/xen/mm.h
+++ b/xen/include/xen/mm.h
@@ -167,6 +167,17 @@ extern unsigned long max_page;
 extern unsigned long total_pages;
 extern paddr_t mem_hotplug;
 
+#ifdef CONFIG_HAS_ONDEMAND_DIRECTMAP
+    extern bool opt_directmap;
+#else
+    #define opt_directmap true
+#endif
+
+static inline bool has_directmap(void)
+{
+    return !IS_ENABLED(CONFIG_HAS_ONDEMAND_DIRECTMAP) || opt_directmap;
+}
+
 /*
  * Extra fault info types which are used to further describe
  * the source of an access violation.
-- 
2.40.1


