Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C1E1ABA67C
	for <lists+xen-devel@lfdr.de>; Sat, 17 May 2025 01:22:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.987715.1372941 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uG4NH-0006Jd-JG; Fri, 16 May 2025 23:21:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 987715.1372941; Fri, 16 May 2025 23:21:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uG4NH-0006HI-Fu; Fri, 16 May 2025 23:21:55 +0000
Received: by outflank-mailman (input) for mailman id 987715;
 Fri, 16 May 2025 23:21:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=iQOe=YA=amd.com=stefano.stabellini@srs-se1.protection.inumbo.net>)
 id 1uG4NF-0005s2-9h
 for xen-devel@lists.xenproject.org; Fri, 16 May 2025 23:21:53 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on20624.outbound.protection.outlook.com
 [2a01:111:f403:2413::624])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8bf9804a-32ac-11f0-9eb6-5ba50f476ded;
 Sat, 17 May 2025 01:21:52 +0200 (CEST)
Received: from CH0PR03CA0247.namprd03.prod.outlook.com (2603:10b6:610:e5::12)
 by MW4PR12MB5666.namprd12.prod.outlook.com (2603:10b6:303:188::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.30; Fri, 16 May
 2025 23:21:47 +0000
Received: from CH1PEPF0000A34A.namprd04.prod.outlook.com
 (2603:10b6:610:e5:cafe::b5) by CH0PR03CA0247.outlook.office365.com
 (2603:10b6:610:e5::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8722.29 via Frontend Transport; Fri,
 16 May 2025 23:21:46 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CH1PEPF0000A34A.mail.protection.outlook.com (10.167.244.5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8746.27 via Frontend Transport; Fri, 16 May 2025 23:21:46 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 16 May
 2025 18:21:45 -0500
Received: from smtp.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Fri, 16 May 2025 18:21:44 -0500
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
X-Inumbo-ID: 8bf9804a-32ac-11f0-9eb6-5ba50f476ded
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IPwM/EYi1QPTSXZ4KDn1/9i4Pd0LexesI1nf4/nfOpVDRFBO42NlwapMPWOBejXnRKeiAommHBjyTpWriTBS8XS9YrdI2zxOfbFjE5dCvQXSYNfbreMjepgrJH0FIOjzUCjAkAIWXgcELgvp2EmN4UNODJIx90wELNU891+O+jVoqfU8t7HMkxF4aFDLMnc2+hm+nXzJg7ltejO9CDmysW/RCTyJHWQ9SdYlasyyhr4mzSEKTXTUlSQKUFHUh9RJ94pSjSxNToV8bzzwWlDTI96zCMvEMC+tHKgmG3LsycqWmwI2QGwLmU84a/mMwY9nsW/LTbejQDrcp62G5T+ABw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hOfLncgDV8d5Q1wUOwc7gzU+soF9bg8LoZ3vX+hETX0=;
 b=rtTlNKFby8cQfn8irbtFwtWEE3cUoZCmL+Dsspe8nSfaHKjQythtmrRfeVfeDaWuezwy8VcSYwqM7z+FR5d9dxnLShZ//wUM5Q1Pk3w0DMPsJlKXH4pYP2Wv/hIzTJSuyUaD8rqqu6UKQOJtl9U9T4TVR9ILy1d5DUmIKWvj0F5nZyZ1vAmAWVZbkrBZw4AHwr7IYolY4xvGKqH5iOphz4HbF/ERXb3GKB/86/OmBuZEP4f4sksw/bi0516W0168ZIwRqd7h6o2xHuNiDKo85Vz0pfbhF4RTeolep1dLTu/104uKOpfkRpcHmYdzWuNumxM898YPDI4+mjxAyCg61Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hOfLncgDV8d5Q1wUOwc7gzU+soF9bg8LoZ3vX+hETX0=;
 b=ZpUlH5p+W4QUzagKIse9gtO74NPBy0s5Xz39VuQwF5tC02YrTvRESUXqGpmqZDZcR9An7meGqqsidOH94DeJzP24iqeH8xetGWL+U6Yw+R6KAevdx8yvFSKpsBT4PF9ZNu4SKmnX0nVrBmbL3vBQuIOBl8FGTH328RGMm0fCeZ8=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Stefano Stabellini <stefano.stabellini@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <andrew.cooper3@citrix.com>, <michal.orzel@amd.com>, <jbeulich@suse.com>,
	<julien@xen.org>, <roger.pau@citrix.com>, <sstabellini@kernel.org>,
	<bertrand.marquis@arm.com>, Federico Serafini
	<federico.serafini@bugseng.com>, Stefano Stabellini
	<stefano.stabellini@amd.com>
Subject: [PATCH 2/6] xen/x86: add inclusion guards
Date: Fri, 16 May 2025 16:21:26 -0700
Message-ID: <20250516232130.835779-2-stefano.stabellini@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <alpine.DEB.2.22.394.2505161618280.145034@ubuntu-linux-20-04-desktop>
References: <alpine.DEB.2.22.394.2505161618280.145034@ubuntu-linux-20-04-desktop>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB03.amd.com: stefano.stabellini@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000A34A:EE_|MW4PR12MB5666:EE_
X-MS-Office365-Filtering-Correlation-Id: 3e30d180-9f2c-4510-09c2-08dd94d06d32
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|376014|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?RDTLGWSWeHuWgJql4JL54szsUnjnlPXtULl5K3JPtwFlBtxS9nSUdVD2jkgF?=
 =?us-ascii?Q?lafQ4/Sv/KGUsOGbweuaHTJ/jjzFn5VX57K3RjKmBwdfIgoJnHsOhS/etYgd?=
 =?us-ascii?Q?bRDL8EUeH2aL13MZ+lfue1G8P071ma6+Q9nO6rOlZLd4iiN2X4suNbocRSvX?=
 =?us-ascii?Q?zD6HggIZ3DWeCmrH+FEKVzwnHhUivjg6n8yKTTnxRmEIv2HKtd2dbK4l+pCC?=
 =?us-ascii?Q?aOd7ltM0BPDwbA0bWqv3QENvgLOOlDG0WpgBJ9rzw5f15YJUU+s/HLVH9P9w?=
 =?us-ascii?Q?SyUqHYsfqEFNx8DqTV1s2G2z5xHeY7V58QNT3zJZ0tZfashNCkxMPT1hpA85?=
 =?us-ascii?Q?FCZv0JGeRZcdFX7c387I4n8f8kvHRXT/9LZO/zRzdmnDxfFHw1kUZskQHnO8?=
 =?us-ascii?Q?5EwfXi6U4AMdg0fb+hMnvAxSJTlYCt+qdTQJVZ0zPwU4PWODOJNAKy9SEhm+?=
 =?us-ascii?Q?OmlDIR+FH3dISEv1+4PnD0STruozZlk2Tt4mtwE0+F+rp5gl/VqbkOLml1zZ?=
 =?us-ascii?Q?EnPRaBLHQyvHbtMRoTREh4xEAqH7sFYO4+OkuuMPfil55Xi6EqFeSJwfYNS2?=
 =?us-ascii?Q?qxvUbp1cZoMaHsJW7Dq5UgqIbh4ErUQTGi9zJJF7jSmmrZZ9KAGKfD+Vh9YX?=
 =?us-ascii?Q?H3i2HRsnoXK6bGwYsTCMNQVBR5yVQ06jNWWzPO+dDnZBgIhWrux4SYoetCAt?=
 =?us-ascii?Q?pwUxIVyvzHkKmjsj0T1PH0+5fW7zv/IqNScY0FxI4zM5mPRCaiOCGEFrbzoD?=
 =?us-ascii?Q?K1Xh2KNTabN/Gs/jBQdWDHpem0ABUYu3bZ/J+/oD0hYwGzCXbsJUp6Wfj7bm?=
 =?us-ascii?Q?+cX4aJyB3zetIfs1nMFxhRwGDUYDegzYi0UT0YEBfrzPHQ9JVjakzBTkB/LO?=
 =?us-ascii?Q?gVKqzxUJTY7ZniZdOdjNO67vKKrFPahFmjFrzYZIOmyBd1Yacfwl7yl/SciL?=
 =?us-ascii?Q?9H/LaDJGuRUbvw+0UZxtI15rKz226Ps7agCAIFjtZd4tkp8ozQ5iZdwQU1L7?=
 =?us-ascii?Q?2J5uCenKKnVg7tkhvFgnqUTnuAyI1uNcda8H3E10Rx/bkjigGS1GGh3xG38S?=
 =?us-ascii?Q?uUIFJCN3eDlhPf04oEtcNkh08CFZj0QrlCK2MT4yq/di9AsdR13HrtsCj8gm?=
 =?us-ascii?Q?/LBpIm68AkwFMrdW4yPrkNkAbtdb1Ln6YFKo5ZJmELbigdhX1GsLSBOicHKs?=
 =?us-ascii?Q?u4kYW4z2Y8y3rRqnAQw/2PSamCX4kjTNEqz/U90aG3kGtjC0rReYsypQZ/wO?=
 =?us-ascii?Q?94TfGUifTNBCgZmiSzwU5G3evZqEqgvCzANel195tA8QJQEL1WwcUHBW1Vax?=
 =?us-ascii?Q?CVCSVdXfB2VDN3lviDQ21b3p/LLgvNeLcx75SgEtyY5nd4vok8NjI5N6iF9/?=
 =?us-ascii?Q?Zhv8sfplxzM1HqDimluWhPaQ+D91sXYmP2pOhW2Xw19hx1kAy0nD6gToO9Sn?=
 =?us-ascii?Q?nZx8ybXheUuQwoySngdmQuEAWn+0TkPV27feu6aKOAOfwdfp+g6LIM+GlzTJ?=
 =?us-ascii?Q?C8yfXQ93jAv8sVG892YX4ZavQT93jpzfkNxO?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 May 2025 23:21:46.1229
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e30d180-9f2c-4510-09c2-08dd94d06d32
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000A34A.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB5666

From: Federico Serafini <federico.serafini@bugseng.com>

MISRA C Directive 4.10 states that:
"Precautions shall be taken in order to prevent the contents of a
header file being included more than once".

Add inclusion guards where missing to address violations of the
guideline.

Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
---
 xen/arch/x86/cpu/cpu.h             | 6 ++++++
 xen/arch/x86/efi/efi-boot.h        | 6 ++++++
 xen/arch/x86/efi/runtime.h         | 5 +++++
 xen/arch/x86/include/asm/compat.h  | 5 +++++
 xen/arch/x86/include/asm/efibind.h | 5 +++++
 xen/arch/x86/x86_64/mmconfig.h     | 5 +++++
 xen/arch/x86/x86_emulate/private.h | 5 +++++
 7 files changed, 37 insertions(+)

diff --git a/xen/arch/x86/cpu/cpu.h b/xen/arch/x86/cpu/cpu.h
index 8be65e975a..cbb434f3a2 100644
--- a/xen/arch/x86/cpu/cpu.h
+++ b/xen/arch/x86/cpu/cpu.h
@@ -1,4 +1,8 @@
 /* attempt to consolidate cpu attributes */
+
+#ifndef X86_CPU_H
+#define X86_CPU_H
+
 struct cpu_dev {
 	void		(*c_early_init)(struct cpuinfo_x86 *c);
 	void		(*c_init)(struct cpuinfo_x86 * c);
@@ -26,3 +30,5 @@ void amd_init_spectral_chicken(void);
 void detect_zen2_null_seg_behaviour(void);
 
 void intel_unlock_cpuid_leaves(struct cpuinfo_x86 *c);
+
+#endif /* X86_CPU_H */
diff --git a/xen/arch/x86/efi/efi-boot.h b/xen/arch/x86/efi/efi-boot.h
index 1d8902a9a7..0ecf4ca53f 100644
--- a/xen/arch/x86/efi/efi-boot.h
+++ b/xen/arch/x86/efi/efi-boot.h
@@ -3,6 +3,10 @@
  * is intended to be included by common/efi/boot.c _only_, and
  * therefore can define arch specific global variables.
  */
+
+#ifndef X86_EFI_EFI_BOOT_H
+#define X86_EFI_EFI_BOOT_H
+
 #include <xen/vga.h>
 
 #include <asm/boot-helpers.h>
@@ -908,6 +912,8 @@ void __init efi_multiboot2(EFI_HANDLE ImageHandle,
     efi_exit_boot(ImageHandle, SystemTable);
 }
 
+#endif /* X86_EFI_EFI_BOOT_H */
+
 /*
  * Local variables:
  * mode: C
diff --git a/xen/arch/x86/efi/runtime.h b/xen/arch/x86/efi/runtime.h
index 77866c5f21..88ab5651e9 100644
--- a/xen/arch/x86/efi/runtime.h
+++ b/xen/arch/x86/efi/runtime.h
@@ -1,3 +1,6 @@
+#ifndef X86_EFI_RUNTIME_H
+#define X86_EFI_RUNTIME_H
+
 #include <xen/domain_page.h>
 #include <xen/mm.h>
 #include <asm/atomic.h>
@@ -17,3 +20,5 @@ void efi_update_l4_pgtable(unsigned int l4idx, l4_pgentry_t l4e)
     }
 }
 #endif
+
+#endif /* X86_EFI_RUNTIME_H */
diff --git a/xen/arch/x86/include/asm/compat.h b/xen/arch/x86/include/asm/compat.h
index 818cad87db..30ed8f2fd0 100644
--- a/xen/arch/x86/include/asm/compat.h
+++ b/xen/arch/x86/include/asm/compat.h
@@ -2,6 +2,9 @@
  * compat.h
  */
 
+#ifndef X86_COMPAT_H
+#define X86_COMPAT_H
+
 #ifdef CONFIG_COMPAT
 
 #define COMPAT_BITS_PER_LONG 32
@@ -18,3 +21,5 @@ int switch_compat(struct domain *);
 #include <xen/errno.h>
 static inline int switch_compat(struct domain *d) { return -EOPNOTSUPP; }
 #endif
+
+#endif /* X86_COMPAT_H */
diff --git a/xen/arch/x86/include/asm/efibind.h b/xen/arch/x86/include/asm/efibind.h
index bce02f3707..ab46341281 100644
--- a/xen/arch/x86/include/asm/efibind.h
+++ b/xen/arch/x86/include/asm/efibind.h
@@ -1,2 +1,7 @@
+#ifndef X86_EFIBIND_H
+#define X86_EFIBIND_H
+
 #include <xen/types.h>
 #include <asm/x86_64/efibind.h>
+
+#endif /* X86_EFIBIND_H */
diff --git a/xen/arch/x86/x86_64/mmconfig.h b/xen/arch/x86/x86_64/mmconfig.h
index 3da4b21e9b..722bf67975 100644
--- a/xen/arch/x86/x86_64/mmconfig.h
+++ b/xen/arch/x86/x86_64/mmconfig.h
@@ -5,6 +5,9 @@
  * Author: Allen Kay <allen.m.kay@intel.com> - adapted from linux
  */
 
+#ifndef X86_64_MMCONFIG_H
+#define X86_64_MMCONFIG_H
+
 #define PCI_DEVICE_ID_INTEL_E7520_MCH    0x3590
 #define PCI_DEVICE_ID_INTEL_82945G_HB    0x2770
 
@@ -72,3 +75,5 @@ int pci_mmcfg_reserved(uint64_t address, unsigned int segment,
 int pci_mmcfg_arch_init(void);
 int pci_mmcfg_arch_enable(unsigned int idx);
 void pci_mmcfg_arch_disable(unsigned int idx);
+
+#endif /* X86_64_MMCONFIG_H */
diff --git a/xen/arch/x86/x86_emulate/private.h b/xen/arch/x86/x86_emulate/private.h
index 30be595470..467bce3c84 100644
--- a/xen/arch/x86/x86_emulate/private.h
+++ b/xen/arch/x86/x86_emulate/private.h
@@ -6,6 +6,9 @@
  * Copyright (c) 2005-2007 XenSource Inc.
  */
 
+#ifndef X86_EMULATE_PRIVATE_H
+#define X86_EMULATE_PRIVATE_H
+
 #ifdef __XEN__
 
 # include <xen/bug.h>
@@ -843,3 +846,5 @@ static inline int read_ulong(enum x86_segment seg,
     *val = 0;
     return ops->read(seg, offset, val, bytes, ctxt);
 }
+
+#endif /* X86_EMULATE_PRIVATE_H */
-- 
2.25.1


