Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 72148A05FE5
	for <lists+xen-devel@lfdr.de>; Wed,  8 Jan 2025 16:19:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.867484.1279057 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tVXpt-00018K-RJ; Wed, 08 Jan 2025 15:19:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 867484.1279057; Wed, 08 Jan 2025 15:19:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tVXpt-00013u-Lb; Wed, 08 Jan 2025 15:19:09 +0000
Received: by outflank-mailman (input) for mailman id 867484;
 Wed, 08 Jan 2025 15:19:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HyFE=UA=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1tVXpr-0008Lg-Lh
 for xen-devel@lists.xenproject.org; Wed, 08 Jan 2025 15:19:07 +0000
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [2a00:1450:4864:20::62a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e6f60577-cdd3-11ef-a0df-8be0dac302b0;
 Wed, 08 Jan 2025 16:19:07 +0100 (CET)
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-aa6a92f863cso532874266b.1
 for <xen-devel@lists.xenproject.org>; Wed, 08 Jan 2025 07:19:06 -0800 (PST)
Received: from localhost.localdomain ([66.81.170.107])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aac0eae71desm2488412166b.89.2025.01.08.07.19.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Jan 2025 07:19:05 -0800 (PST)
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
X-Inumbo-ID: e6f60577-cdd3-11ef-a0df-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1736349546; x=1736954346; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JwBhhGsIi6j0431N7dPj7kwiLad+N3xTknrKun361rM=;
        b=M8n8xpYd9vewjvtm5b76xNCSnGbb1XXttXuIjHEpNx/D4qdLC7YaX2HvC/lGCPTtqh
         h7F20sgMxTr1a863CknvsiC0FEpxogkLYVq5+iYwNvoftU1bXGPKP3Q5fUeg11tKDNM8
         njDRjSelwbthUFejJjz6KnctQinwPDt5wtfVg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736349546; x=1736954346;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JwBhhGsIi6j0431N7dPj7kwiLad+N3xTknrKun361rM=;
        b=FD9mCh9T9ccYg26fyaY5RhNSDoJtBUgFZUeQf9b3d+8G3JLsyFOvEpLzSO8GuVQub/
         M4taYRzQ2roo2LIJmqzi7qZ63NKZiExiq4av4/oVX6eh6nY/9vzKrgfkJkdrrtNZflFh
         Xj6MHPgWh8Wakuk1btrpcvFfO2d752dk25TZXZedvGlypGoJMrTDCj8ApF99C5XXecqf
         QpiKU5Wzs7ZDWfyPTfV4CW1xcZLd6/Qe0HBVyPzEW4UdGzFAOprOUh+4XHkKxFWQ5MNW
         uBxBGBG4H7y51Heay2ubPdSmvFa3Q6lbvdCxp0ss3WtbFyrI59Jfc3KMCAvDTuVywxcv
         no2A==
X-Gm-Message-State: AOJu0Yx0EEbnRzRMjALD284nIHpu02mqrYo/pmpsCelGji5H2FthiyR3
	AjbwQ4y7kS0UnCMNXiLFTaY/kz10dmHwosxyz2OrChlzvjcpoELnO1Z0YFiRoHl9brLfAFrJlHr
	DKDAPBg==
X-Gm-Gg: ASbGncsqeXJJInbWIdRG+UkAIuH125muNoyqyTxgITcsu6h5TRkI0uLTpnb1b4SwCB6
	TCMVrBPJuYe3kH4wEK6RnjqvhTbEaO8JnZIvtAU7pe4tSV1YAKhCD7PL/0/oyxP9nUb4gJz5Z6a
	wRN5DYUNxRMCiUpd+CcLflAEgmYzpMoFEuHD6xDNGgSnie/dO23er5TUKyouidUf2wzWzIa9fUM
	yud2SI/Vt32XYmffgpkzVsVmH0RETZ0lET6N6U0Id3UK98i3yfXSiCSok+vbLOAClXwIyUNsRZU
	YnU=
X-Google-Smtp-Source: AGHT+IEmRfZTn8az4OYaE9fsLSrrsmECKXw/OTjUIfdtxZkfacPZRnaTOoT2mNfX9WgazQmGZBl7sA==
X-Received: by 2002:a17:907:7fa5:b0:aa6:5d30:d976 with SMTP id a640c23a62f3a-ab2ab6a84f7mr275128066b.10.1736349546043;
        Wed, 08 Jan 2025 07:19:06 -0800 (PST)
From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Hongyan Xia <hongyxia@amazon.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <jgrall@amazon.com>,
	Elias El Yandouzi <eliasely@amazon.com>,
	Alejandro Vallejo <alejandro.vallejo@cloud.com>
Subject: [PATCH v5 05/15] x86: Add a boot option to enable and disable the direct map
Date: Wed,  8 Jan 2025 15:18:12 +0000
Message-ID: <20250108151822.16030-6-alejandro.vallejo@cloud.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250108151822.16030-1-alejandro.vallejo@cloud.com>
References: <20250108151822.16030-1-alejandro.vallejo@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Hongyan Xia <hongyxia@amazon.com>

This is added as a Kconfig option as well as a boot command line option.
While being generic, the Kconfig option is only usable for x86 at the
moment.

Note that there remains some users of the directmap at this point. The
option is introduced now as it will be needed in follow-up patches.

Signed-off-by: Hongyan Xia <hongyxia@amazon.com>
Signed-off-by: Julien Grall <jgrall@amazon.com>
Signed-off-by: Elias El Yandouzi <eliasely@amazon.com>
Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>
---
There's a major change compared with v4. directmap= turned into asi= for
compatibility with Roger's ASI series. In particular, after everything
is done we expect the commandline to have somewhat different effects per
arch depending on the extent of ASI implemented. e.g: x86 might implement
distinct toggles for PV and HVM, which are nonsensical for anything but
x86.

With the intent of parsing the commandline differently I've modified
this patch to parse it on arch-specific code from the get-go. I also
adjusted the commandline text to make it a lot more similar to the final
text expected on Roger's series.

v4->v5:
  * Moved cmdline parsing to arch-specific code and turned directmap= to
    asi= (where asi == !directmap). This is for compatibility with
    Roger's work, which appends extra suboptions to asi= on x86.
  * Moved the printk() highlighting the sparse directmap to spec-ctrl
    with the rest of speculative mitigations. Further additions to asi=
    will interact with XPTI, so it makes sense to have it all there.
  * Moved CONFIG_ONDEMAND_DIRECTMAP to the speculation hardening section
    of Kconfig.
  * Reworded the help message to align it with other rows in that
    section and make it more ameanable for end users.
  * Simplified #ifdef hunk defining has_directmap()
  * Used #ifdef CONFIG_ONDEMAND_DIRECTMAP rather than
    CONFIG_HAS_ONDEMAND_DIRECTMAP. The former selects the feature, while
    the latter signals support for it on the arch.

v3->v4:
  * Rename the Kconfig options
  * Set opt_directmap to true if CONFIG_HAS_ONDEMAND_DIRECTMAP is not
enabled

v2->v3:
  * No changes.

v1->v2:
  * Introduce a Kconfig option
  * Reword the commit message
  * Make opt_directmap and helper generic

Changes since Hongyan's version:
  * Reword the commit message
  * opt_directmap is only modified during boot so mark it as
    __ro_after_init
---
 docs/misc/xen-command-line.pandoc | 11 +++++++++++
 xen/arch/x86/Kconfig              |  1 +
 xen/arch/x86/include/asm/mm.h     |  6 ++++++
 xen/arch/x86/spec_ctrl.c          |  7 +++++++
 xen/common/Kconfig                | 21 +++++++++++++++++++++
 xen/include/xen/mm.h              | 11 +++++++++++
 6 files changed, 57 insertions(+)

diff --git a/docs/misc/xen-command-line.pandoc b/docs/misc/xen-command-line.pandoc
index 08b0053f9ced..6a1351b6c09b 100644
--- a/docs/misc/xen-command-line.pandoc
+++ b/docs/misc/xen-command-line.pandoc
@@ -202,6 +202,17 @@ to appropriate auditing by Xen.  Argo is disabled by default.
     This option is disabled by default, to protect domains from a DoS by a
     buggy or malicious other domain spamming the ring.
 
+### asi (x86)
+> `= <boolean>`
+
+> Default: `false`
+
+Offers control over whether the hypervisor will engage in Address Space
+Isolation, by not having potentially sensitive information permanently mapped
+in the directmap. Enabling this option populates the directmap sparsely on
+demand, blocking exploits that leak secrets via speculative memory access in
+the directmap.
+
 ### asid (x86)
 > `= <boolean>`
 
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
index 6c7e66ee21ab..4c82428b8b3e 100644
--- a/xen/arch/x86/include/asm/mm.h
+++ b/xen/arch/x86/include/asm/mm.h
@@ -643,11 +643,17 @@ void write_32bit_pse_identmap(uint32_t *l2);
 /*
  * x86 maps part of physical memory via the directmap region.
  * Return whether the range of MFN falls in the directmap region.
+ *
+ * Enabling ASI on the commandline (i.e: using the `asi=` option) causes the
+ * directmap to be mostly empty, so this always returns false in that case.
  */
 static inline bool arch_mfns_in_directmap(unsigned long mfn, unsigned long nr)
 {
     unsigned long eva = min(DIRECTMAP_VIRT_END, HYPERVISOR_VIRT_END);
 
+    if ( !has_directmap() )
+        return false;
+
     return (mfn + nr) <= (virt_to_mfn(eva - 1) + 1);
 }
 
diff --git a/xen/arch/x86/spec_ctrl.c b/xen/arch/x86/spec_ctrl.c
index ced84750015c..f67e0139b81e 100644
--- a/xen/arch/x86/spec_ctrl.c
+++ b/xen/arch/x86/spec_ctrl.c
@@ -85,6 +85,11 @@ static int8_t __initdata opt_gds_mit = -1;
 static int8_t __initdata opt_div_scrub = -1;
 bool __ro_after_init opt_bp_spec_reduce = true;
 
+#ifdef CONFIG_ONDEMAND_DIRECTMAP
+bool __ro_after_init opt_ondemand_dmap;
+boolean_param("asi", opt_ondemand_dmap);
+#endif
+
 static int __init cf_check parse_spec_ctrl(const char *s)
 {
     const char *ss;
@@ -633,6 +638,8 @@ static void __init print_details(enum ind_thunk thunk)
                cpu_has_bug_l1tf ? "" : " not",
                l1d_maxphysaddr, paddr_bits, l1tf_safe_maddr);
 
+    printk("  ASI: %s", !has_directmap() ? "enabled" : "disabled");
+
     /*
      * Alternatives blocks for protecting against and/or virtualising
      * mitigation support for guests.
diff --git a/xen/common/Kconfig b/xen/common/Kconfig
index 6166327f4d14..1ee498a3e9a7 100644
--- a/xen/common/Kconfig
+++ b/xen/common/Kconfig
@@ -74,6 +74,9 @@ config HAS_KEXEC
 config HAS_LLC_COLORING
 	bool
 
+config HAS_ONDEMAND_DIRECTMAP
+	bool
+
 config HAS_PIRQ
 	bool
 
@@ -214,6 +217,24 @@ config SPECULATIVE_HARDEN_LOCK
 
 	  If unsure, say Y.
 
+config ONDEMAND_DIRECTMAP
+	bool "On-Demand Directmap"
+	depends on HAS_ONDEMAND_DIRECTMAP
+	help
+	  Contemporary processors may use speculative execution as a
+	  performance optimisation, but this can potentially be abused by an
+	  attacker to leak data via speculative sidechannels.
+
+	  When enabled, this option provides defense in depth by preventing
+	  most RAM from being constantly mapped on the hypervisor, thereby
+	  greatly reducing the scope of data leaks after a successful
+	  speculative attack.
+
+	  This option is disabled by default at run time, and needs to be
+	  enabled on the command line.
+
+	  If unsure, say N.
+
 endmenu
 
 config DIT_DEFAULT
diff --git a/xen/include/xen/mm.h b/xen/include/xen/mm.h
index 16f733281af3..fe73057e1781 100644
--- a/xen/include/xen/mm.h
+++ b/xen/include/xen/mm.h
@@ -169,6 +169,17 @@ extern unsigned long max_page;
 extern unsigned long total_pages;
 extern paddr_t mem_hotplug;
 
+#ifdef CONFIG_ONDEMAND_DIRECTMAP
+extern bool opt_ondemand_dmap;
+
+static inline bool has_directmap(void)
+{
+    return !opt_ondemand_dmap;
+}
+#else
+#define has_directmap() true
+#endif
+
 /*
  * Extra fault info types which are used to further describe
  * the source of an access violation.
-- 
2.47.1


