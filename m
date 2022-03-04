Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 05C7C4CDC1C
	for <lists+xen-devel@lfdr.de>; Fri,  4 Mar 2022 19:17:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.284460.483904 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nQCUi-0002X1-Uj; Fri, 04 Mar 2022 18:17:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 284460.483904; Fri, 04 Mar 2022 18:17:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nQCUh-0001yM-3o; Fri, 04 Mar 2022 18:17:35 +0000
Received: by outflank-mailman (input) for mailman id 284460;
 Fri, 04 Mar 2022 17:56:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=WvCO=TP=xt3.it=ms@srs-se1.protection.inumbo.net>)
 id 1nQC2W-0005R4-72
 for xen-devel@lists.xenproject.org; Fri, 04 Mar 2022 17:48:28 +0000
Received: from radon.xt3.it (radon.xt3.it [2a01:4f8:190:4055::2])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4bc51566-9be3-11ec-8eba-a37418f5ba1a;
 Fri, 04 Mar 2022 18:48:27 +0100 (CET)
Received: from nb2assolieri.mat.unimo.it ([155.185.4.56] helo=localhost)
 by radon.xt3.it with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.89) (envelope-from <ms@xt3.it>)
 id 1nQC2U-0000IG-TQ; Fri, 04 Mar 2022 18:48:27 +0100
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
X-Inumbo-ID: 4bc51566-9be3-11ec-8eba-a37418f5ba1a
From: Marco Solieri <marco.solieri@minervasys.tech>
To: xen-devel@lists.xenproject.org
Cc: Marco Solieri <marco.solieri@minervasys.tech>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>,
	Marco Solieri <marco.solieri@unimore.it>,
	Andrea Bastoni <andrea.bastoni@minervasys.tech>,
	Luca Miccio <lucmiccio@gmail.com>
Subject: [PATCH 33/36] doc, xen-command-line: introduce coloring options
Date: Fri,  4 Mar 2022 18:46:58 +0100
Message-Id: <20220304174701.1453977-34-marco.solieri@minervasys.tech>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220304174701.1453977-1-marco.solieri@minervasys.tech>
References: <20220304174701.1453977-1-marco.solieri@minervasys.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Luca Miccio <lucmiccio@gmail.com>

Four additional parameters in the Xen command line are used to define
the underlying coloring policy, which is not directly configurable
otherwise.

Signed-off-by: Luca Miccio <lucmiccio@gmail.com>
Signed-off-by: Marco Solieri <marco.solieri@minervasys.tech>
---
 docs/misc/xen-command-line.pandoc | 51 +++++++++++++++++++++++++++++--
 1 file changed, 49 insertions(+), 2 deletions(-)

diff --git a/docs/misc/xen-command-line.pandoc b/docs/misc/xen-command-line.pandoc
index efda335652..a472d51cf9 100644
--- a/docs/misc/xen-command-line.pandoc
+++ b/docs/misc/xen-command-line.pandoc
@@ -299,6 +299,20 @@ can be maintained with the pv-shim mechanism.
     cause Xen not to use Indirect Branch Tracking even when support is
     available in hardware.
 
+### buddy\_size (arm64)
+> `= <size in megabyte>`
+
+> Default: `64 MB`
+
+Amount of memory reserved for the buddy allocator when colored allocator is
+active. This options is useful only if coloring support is enabled.
+The colored allocator is meant as an alternative to the buddy allocator,
+since its allocation policy is by definition incompatible with the
+generic one. Since the Xen heap systems is not colored yet, we need to
+support the coexistence of the two allocators for now. This parameter, which is
+optional and for expert only, is used to set the amount of memory reserved to
+the buddy allocator.
+
 ### clocksource (x86)
 > `= pit | hpet | acpi | tsc`
 
@@ -884,7 +898,17 @@ Controls for the dom0 IOMMU setup.
 
     Incorrect use of this option may result in a malfunctioning system.
 
-### dom0_ioports_disable (x86)
+### dom0\_colors (arm64)
+> `= List of <integer>-<integer>`
+
+> Default: `All available colors`
+
+Specify dom0 color configuration. If the parameter is not set, all available
+colors are chosen and the user is warned on Xen's serial console. This color
+configuration acts also as the default one for all DomUs that do not have any
+explicit color assignment in their configuration file.
+
+### dom0\_ioports\_disable (x86)
 > `= List of <hex>-<hex>`
 
 Specify a list of IO ports to be excluded from dom0 access.
@@ -2625,6 +2649,20 @@ unknown NMIs will still be processed.
 Set the NMI watchdog timeout in seconds.  Specifying `0` will turn off
 the watchdog.
 
+### way\_size (arm64)
+> `= <size in byte>`
+
+> Default: `Obtained from the hardware`
+
+Specify the way size of the Last Level Cache. This parameter is only useful with
+coloring support enabled. It is an optional, expert-only parameter and it is
+used to calculate what bits in the physical address can be used by the coloring
+algorithm, and thus the maximum available colors on the platform. It can be
+obtained by dividing the total LLC size by the number of associativity ways.
+By default, the value is also automatically computed during coloring
+initialization to avoid any kind of misconfiguration. For this reason, it is
+highly recommended to use this boot argument with specific needs only.
+
 ### x2apic (x86)
 > `= <boolean>`
 
@@ -2642,7 +2680,16 @@ In the case that x2apic is in use, this option switches between physical and
 clustered mode.  The default, given no hint from the **FADT**, is cluster
 mode.
 
-### xenheap_megabytes (arm32)
+### xen\_colors (arm64)
+> `= List of <integer>-<integer>`
+
+> Default: `0-0: the lowermost color`
+
+Specify Xen color configuration. 
+Two colors are most likely needed on platforms where private caches are
+physically indexed, e.g. the L1 instruction cache of the Arm Cortex-A57.
+
+### xenheap\_megabytes (arm32)
 > `= <size>`
 
 > Default: `0` (1/32 of RAM)
-- 
2.30.2


