Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CTIJCze2jGnlsQAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 11 Feb 2026 18:02:47 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BFFE8126641
	for <lists+xen-devel@lfdr.de>; Wed, 11 Feb 2026 18:02:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1227969.1534340 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vqDbX-0002RZ-Ui; Wed, 11 Feb 2026 17:02:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1227969.1534340; Wed, 11 Feb 2026 17:02:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vqDbX-0002OS-RV; Wed, 11 Feb 2026 17:02:19 +0000
Received: by outflank-mailman (input) for mailman id 1227969;
 Wed, 11 Feb 2026 17:02:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZNQR=AP=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1vqDbW-0002OM-8N
 for xen-devel@lists.xenproject.org; Wed, 11 Feb 2026 17:02:18 +0000
Received: from BL0PR03CU003.outbound.protection.outlook.com
 (mail-eastusazlp170120007.outbound.protection.outlook.com
 [2a01:111:f403:c101::7])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 69372e4c-076b-11f1-b162-2bf370ae4941;
 Wed, 11 Feb 2026 18:02:16 +0100 (CET)
Received: from SN7PR04CA0189.namprd04.prod.outlook.com (2603:10b6:806:126::14)
 by IA1PR12MB8223.namprd12.prod.outlook.com (2603:10b6:208:3f3::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.19; Wed, 11 Feb
 2026 17:02:11 +0000
Received: from SA2PEPF00003AEB.namprd02.prod.outlook.com
 (2603:10b6:806:126:cafe::b1) by SN7PR04CA0189.outlook.office365.com
 (2603:10b6:806:126::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9611.10 via Frontend Transport; Wed,
 11 Feb 2026 17:01:59 +0000
Received: from satlexmb08.amd.com (165.204.84.17) by
 SA2PEPF00003AEB.mail.protection.outlook.com (10.167.248.11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9611.8 via Frontend Transport; Wed, 11 Feb 2026 17:02:10 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 11 Feb
 2026 11:01:29 -0600
Received: from fedora.mshome.net (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Wed, 11 Feb 2026 11:01:28 -0600
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
X-Inumbo-ID: 69372e4c-076b-11f1-b162-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=o1StyCJfOu1e6q5hgWQ+UIbPayiZ3Xo5piyGi3t11iBi0ZDbGCwgB3izoW0HWr5uoRj0l7hjcA+tUCaqdY3naEkIc33IOylA7c6N44oPBKVV9GDubV+vKFlFpMpsHiyxECKAVmUUzlmKRwC3LsCpF5hOf07kuhIe3+Udnk7RyUeUkdbp4Mjroqp+1lWqCUfMTaD5SaTcxanqtLNqbsNxU6inNAw++7bI37L28qIvntgZfZIaec3/w9FBtoQi/mIxP7AWApHY2q98P5VpFSIYSssNQcczFqVSCnxp+he/2DTD85iR+9b4zVfwjZKQ76ZorBEOfCZV9yICMq0zSRnExg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/aCm1TpIJjYd0leIOhN0/WRlXUcOWnbPdDL9kCWTj40=;
 b=cZHEb2krm2hzqFI0+uo6kCoJk3zSSe6vJe73l9+KGJYwPgweJkqeP0VuoNEpnKDPAQCprKbpkFdAG5EIu4n7i1qqgdJD0Dys/AFhEajRO1O3ZQ3Z9v5fGA8PzP2WhdWGtHkEog1U+cTEWLiFY2VlxjyGQasSkbkWPcQclvMS4ZjFoyc7Lb5lBIKVg+EEu87QHdWieQ7hvShDNgpOdm0eO9GbAbQ/hXTirt34zNscAYwARk/DnNDFFM8NDOkI3dCgaGUAiSvwbfL5fKUM/VkI2wnKFpM0LeQlhDCSux+QZfNWUWC+AicbxVdCEAhHBpi/jw5XMhXK5MyAi1a1ScVqXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/aCm1TpIJjYd0leIOhN0/WRlXUcOWnbPdDL9kCWTj40=;
 b=tUDMuEpHJpdA63DmdIWcqebmYUM2cSINmrtG7RXT3seGz9v2YzkGyY2l76Vye5btEyt8SDJfLwF7yBOJDP5gzDCOrKi6o+bOm2wbwrwaRC8lSBgJC0TuvBF+qE1iXL4/Oecr1oHC+eM2m08IIzfprkcHq0XJPZ6AZTn5ioAw4v8=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
From: Jason Andryuk <jason.andryuk@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Jason Andryuk <jason.andryuk@amd.com>, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>, "Julien
 Grall" <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH] xen: Put wait.c behind CONFIG_WAIT
Date: Wed, 11 Feb 2026 12:01:18 -0500
Message-ID: <20260211170118.109946-1-jason.andryuk@amd.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00003AEB:EE_|IA1PR12MB8223:EE_
X-MS-Office365-Filtering-Correlation-Id: 759226ef-2d4f-478b-0941-08de698f4ba3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|376014|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?x0NcQmx5NHD31xg68RntltIAsFlMPUB7+HgjgB724K/mJKLIqtk6bDVWz/1+?=
 =?us-ascii?Q?9lD9Y8HvfTev3b0S1Nz7nsnfLFBpmdvfOpbIirAdSVmMVktaDPRAelmF5MZ6?=
 =?us-ascii?Q?fadzQquMfgvGetEE6sxk66GYdpWhQN8M5FDX+0fB0/d45t3t0rQyl9aSZO8M?=
 =?us-ascii?Q?9DD0ciSRUGVXLdvsYOyxKiYYnyHh97wvjwtjGnY2FwaeHDsDmBlAkL6EnxeB?=
 =?us-ascii?Q?itSNh8sHN5W6eqtl2nCSDvW+h1D+3uVtMC8SdxWA9eg2FPKctT4RwOo8tY9S?=
 =?us-ascii?Q?YesXkjETl/GERMZ9d4u+je2WFgiZ67z3R7zwVGfwF4f5AxdoWnbbd7RmY78f?=
 =?us-ascii?Q?VYsuln+eyaKBn2LNWrZG7qfhNq6i/T6Can+v2MES0cJ0Pp2YhW+xv03dNfVl?=
 =?us-ascii?Q?0erM7WSiT2Xah42+ian1117IGuxbv1yjoqyenZ3+71c+RUW83zQoansDfKdS?=
 =?us-ascii?Q?JmTqW2d7zHs95X6QAvXAagar0I7htmiDMg14u9OJCg4J9aMYwY9UuGoKUmdo?=
 =?us-ascii?Q?yanxCoD+t4xwrm5br9bMlJYL0QRk+KZl0O8s4wtyVV1Lpb/9pMCYOK/ZhjEl?=
 =?us-ascii?Q?iZhDOD2ilFy6BdP7pA+Rn8B0LsJzM/rOj6Srr8YdW3s2E8ZkXxkR8ULr8vVv?=
 =?us-ascii?Q?MdK/ZY3vy0b2wyWROon5AkSgiZuVPmxTZxgNqpqKGqRlIVLGR41orgd2e6cI?=
 =?us-ascii?Q?1DXL2Wc+MCFbdIWQ4aHAcFrXVobZvKawAZRNHA9dOTbQSLR1c1rsSkjDJKg0?=
 =?us-ascii?Q?4hpZvgObD8UuVdwRDDsYaT6KkBsW00MUw1rIKxc+aI9uM3uwPeVvP4/1+xzB?=
 =?us-ascii?Q?IbyvthWl8KRBHEhgmHHeQrqeyw9LPCd9ZirktSFOyUoh53ZkKdqFp972u0na?=
 =?us-ascii?Q?o/bq7pY/ZEUtM1uzuf/G6asSwV2EuAbS4NpSxpeb442eBLKWe2o+G0nv452u?=
 =?us-ascii?Q?Uwt9TILoCIbDDDgiakg2RG2TQA6+y1U8kdahII3QGa1ebp6xLnoDYGCc2biO?=
 =?us-ascii?Q?xKhJ+qsei/bsH79PsjK3YqFVeAFbNiPrnkT3kTRmTZ2abGotVVw2dQTdVaoH?=
 =?us-ascii?Q?or7Ycig7G9bm9DnJY3G2TAU1mmMinBa9F3mGl2T+gYbmXR3JpWuSI8yUSuUA?=
 =?us-ascii?Q?W7NS6MF/71irVIx/zgWVMsKYZv/QZTXGI5vNAzFKInw9MXbutTfKqYE2QNFr?=
 =?us-ascii?Q?Td4XR1D1xaPYNSchKxP2hQVfoqjyuI51PI6zlZIHQ2Ik2O9xijl/CXlgH3cY?=
 =?us-ascii?Q?0Cwn6383kwRd5PM1hWjW49RQzp2rQAAJk0zGJtoPKbjUb/EeKDzOdxqe9uVi?=
 =?us-ascii?Q?6jgnynsteY+lIpDX+ywlwICQEwtH5Ca6Dplril4IH9pfKpRcd7MR6Hb9CeVE?=
 =?us-ascii?Q?uFRWrq3OT7KB/+CW4rCtB/9FgmzpjDBD5FPkrtUPBt7QPrn0znle6M7qSd/n?=
 =?us-ascii?Q?3T/uvWEJ7sO925+TlnYjSb4OheEnpFkhnddNtpT8+YjuRHhHqYEvOBJPOmlQ?=
 =?us-ascii?Q?u63nvEXVebQ6lHkj0s90CgtSN4KWC90k9P5f/dNyABBt/zyx5yQ1/rjUPSBf?=
 =?us-ascii?Q?HGRmu7M8OzOaROEmMMMcXB1uWNGObBo6/ZrrPrrmWuvIpA+X8BUaLoHnmV1G?=
 =?us-ascii?Q?tz1LUNOpyMN3mCgMP2Qe2V2tdw/DySavWzmzVgmAgW5mTebam0KTzKAti9CH?=
 =?us-ascii?Q?bTTJ5g=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	J5qjQ7Uog/EUic5aPU1i9twgRT2dFpjy1aUGrhbUId9udBPMJct8gxb+Rq89RegCA6DsikbYuazr1JutYMZrV1Jlcj8ZIxpCI1eMh+RzcHIjUvdKE5GJqp7108AmfNwV48zA1WrgjIwWeB4GgVtwIbmkklVIFM0rjfrXX0eV+SBMOdRTtleWA/qtlE4F5VA3urx/z4g2IzlzkLzFP2mzJIN7MKMN0w9V6u0LzWkAU2GSIWB1KboDj+/Ph8hQF2hGu+Dxjb90lskey7H+XVJOxQXoLOr6jpJLhdBu9JX3RFLRe9e0YzFvyf/k9LPkRF2xWbM84in96nZbNL84/pPgxq7Ps1pmHkM9JEMp3JOCdbF0Me7f/uBRHWXLIgg/vjhV71nuVoiFL6J3d/KwZT87qihMDMNHoaButjoEbc+ZBXvIVeS/KeqNLxVLIyd3TQll
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Feb 2026 17:02:10.2713
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 759226ef-2d4f-478b-0941-08de698f4ba3
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF00003AEB.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8223
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.69 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:jason.andryuk@amd.com,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:sstabellini@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[jason.andryuk@amd.com,xen-devel-bounces@lists.xenproject.org];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jason.andryuk@amd.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:mid,amd.com:dkim,amd.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	RCPT_COUNT_SEVEN(0.00)[9];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[11]
X-Rspamd-Queue-Id: BFFE8126641
X-Rspamd-Action: no action

wait.c is only used by vm_event.c.  Make CONFIG_VM_EVENT select
CONFIG_WAIT, and use CONFIG_WAIT to control building it.

Provide stubs of functions called from common code.  entry.S needs an
ifdef to hide the symbol from the assembly.

Also conditionalize .waitqueue_vcpu in struct vcpu to save space.

Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
---
 xen/arch/x86/x86_64/entry.S |  2 ++
 xen/common/Kconfig          |  4 ++++
 xen/common/Makefile         |  2 +-
 xen/include/xen/sched.h     |  2 ++
 xen/include/xen/wait.h      | 11 +++++++++--
 5 files changed, 18 insertions(+), 3 deletions(-)

diff --git a/xen/arch/x86/x86_64/entry.S b/xen/arch/x86/x86_64/entry.S
index ca446c6ff0..adb570c07e 100644
--- a/xen/arch/x86/x86_64/entry.S
+++ b/xen/arch/x86/x86_64/entry.S
@@ -664,7 +664,9 @@ FUNC(continue_pv_domain)
         ALTERNATIVE "", "mov $2, %eax; incsspd %eax", X86_FEATURE_XEN_SHSTK
 #endif
 
+#ifdef CONFIG_WAIT
         call  check_wakeup_from_wait
+#endif
 ret_from_intr:
         GET_CURRENT(bx)
         testb $3, UREGS_cs(%rsp)
diff --git a/xen/common/Kconfig b/xen/common/Kconfig
index d7e79e752a..ab3f24cb4f 100644
--- a/xen/common/Kconfig
+++ b/xen/common/Kconfig
@@ -173,10 +173,14 @@ config HAS_VMAP
 config LIBFDT
 	bool
 
+config WAIT
+	bool
+
 config VM_EVENT
 	bool "Memory Access and VM events"
 	depends on HVM
 	default X86
+	select WAIT
 	help
 
 	  Framework to configure memory access types for guests and receive
diff --git a/xen/common/Makefile b/xen/common/Makefile
index 4fc0c15088..ef2c5ddd4e 100644
--- a/xen/common/Makefile
+++ b/xen/common/Makefile
@@ -61,7 +61,7 @@ obj-y += virtual_region.o
 obj-$(CONFIG_VM_EVENT) += vm_event.o
 obj-$(CONFIG_HAS_VMAP) += vmap.o
 obj-y += vsprintf.o
-obj-y += wait.o
+obj-$(CONFIG_WAIT) += wait.o
 obj-bin-y += warning.init.o
 obj-y += xmalloc_tlsf.o
 
diff --git a/xen/include/xen/sched.h b/xen/include/xen/sched.h
index 1268632344..f232f2731e 100644
--- a/xen/include/xen/sched.h
+++ b/xen/include/xen/sched.h
@@ -293,7 +293,9 @@ struct vcpu
     /* Multicall information. */
     struct mc_state  mc_state;
 
+#ifdef CONFIG_WAIT
     struct waitqueue_vcpu *waitqueue_vcpu;
+#endif
 
     struct evtchn_fifo_vcpu *evtchn_fifo;
 
diff --git a/xen/include/xen/wait.h b/xen/include/xen/wait.h
index 1c68bc564b..d7d83adef1 100644
--- a/xen/include/xen/wait.h
+++ b/xen/include/xen/wait.h
@@ -49,11 +49,18 @@ do {                                            \
 } while (0)
 
 /* Private functions. */
-int init_waitqueue_vcpu(struct vcpu *v);
-void destroy_waitqueue_vcpu(struct vcpu *v);
 void prepare_to_wait(struct waitqueue_head *wq);
 void wait(void);
 void finish_wait(struct waitqueue_head *wq);
+
+#ifdef CONFIG_WAIT
+int init_waitqueue_vcpu(struct vcpu *v);
+void destroy_waitqueue_vcpu(struct vcpu *v);
 void check_wakeup_from_wait(void);
+#else
+static inline int init_waitqueue_vcpu(struct vcpu *v) { return 0; }
+static inline void destroy_waitqueue_vcpu(struct vcpu *v) {}
+static inline void check_wakeup_from_wait(void) {}
+#endif
 
 #endif /* __XEN_WAIT_H__ */
-- 
2.53.0


