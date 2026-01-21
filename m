Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SLkvCyjjcGkhawAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 21 Jan 2026 15:31:04 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 74B7258735
	for <lists+xen-devel@lfdr.de>; Wed, 21 Jan 2026 15:31:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1209826.1521735 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1viZDu-0007Bp-Dd; Wed, 21 Jan 2026 14:30:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1209826.1521735; Wed, 21 Jan 2026 14:30:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1viZDu-00078z-9y; Wed, 21 Jan 2026 14:30:18 +0000
Received: by outflank-mailman (input) for mailman id 1209826;
 Wed, 21 Jan 2026 14:30:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=D6Gw=72=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1viZDs-0006vP-6g
 for xen-devel@lists.xenproject.org; Wed, 21 Jan 2026 14:30:16 +0000
Received: from SN4PR2101CU001.outbound.protection.outlook.com
 (mail-southcentralusazlp170120001.outbound.protection.outlook.com
 [2a01:111:f403:c10d::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b1a13f4b-f6d5-11f0-9ccf-f158ae23cfc8;
 Wed, 21 Jan 2026 15:30:12 +0100 (CET)
Received: from MN2PR07CA0022.namprd07.prod.outlook.com (2603:10b6:208:1a0::32)
 by SA1PR12MB8142.namprd12.prod.outlook.com (2603:10b6:806:334::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.9; Wed, 21 Jan
 2026 14:30:05 +0000
Received: from BL6PEPF0001AB78.namprd02.prod.outlook.com
 (2603:10b6:208:1a0:cafe::35) by MN2PR07CA0022.outlook.office365.com
 (2603:10b6:208:1a0::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9542.10 via Frontend Transport; Wed,
 21 Jan 2026 14:29:59 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 BL6PEPF0001AB78.mail.protection.outlook.com (10.167.242.171) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9542.4 via Frontend Transport; Wed, 21 Jan 2026 14:30:04 +0000
Received: from xcbagarciav01.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 21 Jan
 2026 08:29:57 -0600
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
X-Inumbo-ID: b1a13f4b-f6d5-11f0-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hqadDK1Qv0i2agxIOQ5NbOvyBjAM0pujouGtyzxwBHfOxiRILh8SroAiV5vN8H6jHkJ4dGaBubsLVXeuno8cx4HqqvxGZTqla637jxzUjiYkutXpiLrUlFQ07XqZKDGFInddjeoYbDMI34H6DnEJgaY+eF4AUMhGOF9CL7E2qC7X1iAm7e0ELxORgkee17EhRKSPKksqgUOWa7z+ydjI/Ff7YBrpg564SItrNwSJA+5PmUeVsvc+k7dVV92NW7TiUWm9WgyEwbZWA5WBb9SKeeSkOka1zvEH9CdxUrQbm/jBRTdUOecP97RhUs/XCVLvxrClQvRmdneoZk1pp4wCgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tSKGe52NO3EUM355UnfiNliL5Anqp2e0DuhAflIiAW8=;
 b=aUf6iVIatbqoh+H0ulQ/jPX4Ov+a+sJhXDMlDAFkLOIhJVDOyR8Rgh9Wvyrq8hKprknYKY1v+rDqwVXpOsj/knE6D8W4BF8mw8PQ0/sbL/O8/b4v6VzUuXzzknk7RkGi7JhTpT9TSsEk/0T6walLE/Lq2+B37ppGfnfyFmyLmOXitcPxW7+5Qdza2u1Sm0hsy/t4N1mNcEKfc0tQkY/y6kXW8RQY9zH0l2DLAqNMa15vKSkCg3GWlGd1M+2vcyE6B0So0m4Y82aQBK/PuYoc373TrOzSeZ7TgkMP+/mw2uFivum+j6mwOWMFhVhgn35aIsK7vgI0WvKfyJaGvJdimw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tSKGe52NO3EUM355UnfiNliL5Anqp2e0DuhAflIiAW8=;
 b=QwX3QIvGObIckLnyr9LOrG57tJCAismjObm+E+SVUi7kUEnTiYxLgx/d9snxpNPqgnh7I7Ksg5jI2sxUpJuWNfMNfKVkiCU+3tLAulG26KHIHkxj+lRGc5Sz7L7skkLuy66RsDbwTyI6n/00SOfFDWe2KdQRGEBB9Xptb17I+XU=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
From: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Alejandro Vallejo <alejandro.garciavallejo@amd.com>, Jan Beulich
	<jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, Jason Andryuk
	<jason.andryuk@amd.com>, Teddy Astie <teddy.astie@vates.tech>
Subject: [PATCH v2 1/3] x86/svm: Add infrastructure for Bus Lock Threshold
Date: Wed, 21 Jan 2026 15:28:53 +0100
Message-ID: <20260121142857.39069-2-alejandro.garciavallejo@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260121142857.39069-1-alejandro.garciavallejo@amd.com>
References: <20260121142857.39069-1-alejandro.garciavallejo@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB78:EE_|SA1PR12MB8142:EE_
X-MS-Office365-Filtering-Correlation-Id: 90b5902e-1054-479b-2f9b-08de58f991ba
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|36860700013|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?qBggbYLY9aFGdpPhZXTem2aQVRZxZ3V6sW2PNRAJJc6ZN8r2HudpMDg+TuVL?=
 =?us-ascii?Q?UxoMLrVF0sjR3E7O/OVocH5MdMSUAw60AazDiUtHrVenbc3R56rWBoRi0h7/?=
 =?us-ascii?Q?g1pIWKXVwg6i+wlahToLpkcJ+2ZGzBsa0isvWJ2ovDTJtwEcJNNfxLLN/W3n?=
 =?us-ascii?Q?36LuU/8+C53Yxqxw9s71NocBy4u7+EGPJ1ZVsieNwovW0Ej3HLyRbJUbx/dh?=
 =?us-ascii?Q?wDWiYgN/mfeYa/Aa9/OwX5V31ld+Yp8Fzzrf7q7YCcjmiD3ze75YilKsbz3O?=
 =?us-ascii?Q?+OHNIgKIZZWs3D83A6YwB/4LGa7Crps49UlvpH0Wzdr9sVoYnmIzWR22S7O1?=
 =?us-ascii?Q?M7EK/twE7g58w0IkN7K97Ky1jdUvalPV2of2pSZ7c7xp83pTPuHDeJuuLwC+?=
 =?us-ascii?Q?KQ/Qk6UK34+nvv018cRFf9I0SSE/TM4zURSbNN1aBjCqMY8PXfPsWVkW+WgX?=
 =?us-ascii?Q?83NgmsRfFEZbWYSOtjy9dumqXYxEGuQ1H+gs70wkCpf3i/AviqSfzGer4yB8?=
 =?us-ascii?Q?iz2w0ea2yjfdMYcVwEmJnnPJz7+OUjjSMSUbI9EfhdjT6SXfkng0+YbxFuRM?=
 =?us-ascii?Q?2Iyvh/PQNBjpv5aUfQuKI7XWkb7MTL7MA/VEss4X/7C1MMfOdkt2qI63Dszp?=
 =?us-ascii?Q?G2qmWSWkIuuvEid42RpDryINC5Cwhrsl7079RnHVNRPBB/Nbj4BayVXCQ/06?=
 =?us-ascii?Q?JwgKrwQuzO14wrB6dCfzrpRSFAnqyiysBzr1aECSTjP8IFQLq4mnyhPLjlj/?=
 =?us-ascii?Q?D1ag2BNe/1W697bpcKzDmfrzpS7MWWHu8IaKfmS9D8ho2sMvKu4nGyv7e7aF?=
 =?us-ascii?Q?Lep+0nV5uyXXXEdIdFWuZXHqH4peZlrjobmwO1jtCkGh+OIb+1I3MEGbAdiM?=
 =?us-ascii?Q?yNO0xGw1FTc/cm0nuv6jPmIc1s96VfBCHJA0FNwpiqo37dUsHw/WK7RyKpX9?=
 =?us-ascii?Q?Ax3pAgB3UmFfTS97A0aVeKPn6YemTohyxOCnxNRhA1ia9VB7OcMlyhM5Rwav?=
 =?us-ascii?Q?0C1IG1ahWiktzwiM18A6HhhxnkHJMMAuJGkALwlEmwncvane05vEnPsJ0RIO?=
 =?us-ascii?Q?yRL00Xm1voGJkX2W10gZplwuGzJFLNcEiIRPN16SxNM/bSFeP9YYSdLmLRsp?=
 =?us-ascii?Q?q0Nbm0zQgnstJ+aZTlW2/4BLNznFDLk0EpaQp7D5J2yt8xiUriwnOKF5uhLQ?=
 =?us-ascii?Q?YciqDjpbsPCKKF13tSyvC71JiyR96GeGfrT2CZNjCI2s3bkGYHcRlXZ7afb3?=
 =?us-ascii?Q?i+cYwXEFJn16TC/MhfTDJtv9D+fF3j0weJ3TuV8ToqifvdUbD7uZn+z0EPBl?=
 =?us-ascii?Q?0hGwSKBnePFtxSL32Hpe0zg1XTkbw9kknhUXYRX3T23oqWSpIJ8qAWeiBWVz?=
 =?us-ascii?Q?JTBHPv4DL1hJsmVaG0PhHKd6CDm7gaPUQlbenOZiBE2XEAusiETGumumWL4U?=
 =?us-ascii?Q?rT7WskF+n0krZ9pHdohREmo38xKkCo16uwlY7B6Mj3b+Z4MVdICaE0FnJzw8?=
 =?us-ascii?Q?9VpJP/yRX5e27P2M8faIg5SgglFUlQZhAkbFxIQ9IYiP8hrPm1sQ8EHYD+gn?=
 =?us-ascii?Q?M+BiVsoou38GvnhHEoKZa01YPuisXvf4VZvyeTXfaRHW4sVu6DTpANKPoAh7?=
 =?us-ascii?Q?+NIrccwKtkTS1mb+aqYIbzimKBEnSjzF9Su2AuHKz/arlwB1/bYruMsR6v4X?=
 =?us-ascii?Q?Hvj5ow=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700013)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jan 2026 14:30:04.7744
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 90b5902e-1054-479b-2f9b-08de58f991ba
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF0001AB78.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB8142
X-Spamd-Result: default: False [-0.69 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:alejandro.garciavallejo@amd.com,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:jason.andryuk@amd.com,m:teddy.astie@vates.tech,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[alejandro.garciavallejo@amd.com,xen-devel-bounces@lists.xenproject.org];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:rdns,lists.xenproject.org:helo];
	FROM_NEQ_ENVFROM(0.00)[alejandro.garciavallejo@amd.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	HAS_XOIP(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 74B7258735
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add missing scaffolding to enable BusLock Threshold. That is:

  * Add general_intercepts_3.
  * Add missing VMEXIT
  * Adjust NPF perf counter base to immediately after the buslock counter

Signed-off-by: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
Reviewed-by: Teddy Astie <teddy.astie@vates.tech>
---
v2:
  * s/general intercepts 2/general intercepts 3/
  * removed _thresh suffix
  * added missing _svm_ infix in the SVM feature
---
 xen/arch/x86/hvm/svm/vmcb.h           | 15 +++++++++++++--
 xen/arch/x86/include/asm/hvm/svm.h    |  2 ++
 xen/arch/x86/include/asm/perfc_defn.h |  2 +-
 3 files changed, 16 insertions(+), 3 deletions(-)

diff --git a/xen/arch/x86/hvm/svm/vmcb.h b/xen/arch/x86/hvm/svm/vmcb.h
index ba554a9644..231f9b1b06 100644
--- a/xen/arch/x86/hvm/svm/vmcb.h
+++ b/xen/arch/x86/hvm/svm/vmcb.h
@@ -65,6 +65,11 @@ enum GenericIntercept2bits
     GENERAL2_INTERCEPT_RDPRU   = 1 << 14,
 };
 
+/* general 3 intercepts */
+enum GenericIntercept3bits
+{
+    GENERAL3_INTERCEPT_BUS_LOCK_THRESH = 1 << 5,
+};
 
 /* control register intercepts */
 enum CRInterceptBits
@@ -289,6 +294,7 @@ enum VMEXIT_EXITCODE
     VMEXIT_MWAIT_CONDITIONAL= 140, /* 0x8c */
     VMEXIT_XSETBV           = 141, /* 0x8d */
     VMEXIT_RDPRU            = 142, /* 0x8e */
+    VMEXIT_BUS_LOCK         = 165, /* 0xa5 */
     /* Remember to also update VMEXIT_NPF_PERFC! */
     VMEXIT_NPF              = 1024, /* 0x400, nested paging fault */
     /* Remember to also update SVM_PERF_EXIT_REASON_SIZE! */
@@ -405,7 +411,8 @@ struct vmcb_struct {
     u32 _exception_intercepts;  /* offset 0x08 - cleanbit 0 */
     u32 _general1_intercepts;   /* offset 0x0C - cleanbit 0 */
     u32 _general2_intercepts;   /* offset 0x10 - cleanbit 0 */
-    u32 res01[10];
+    u32 _general3_intercepts;   /* offset 0x14 - cleanbit 0 */
+    u32 res01[9];
     u16 _pause_filter_thresh;   /* offset 0x3C - cleanbit 0 */
     u16 _pause_filter_count;    /* offset 0x3E - cleanbit 0 */
     u64 _iopm_base_pa;          /* offset 0x40 - cleanbit 1 */
@@ -489,7 +496,10 @@ struct vmcb_struct {
     u64 nextrip;                /* offset 0xC8 */
     u8  guest_ins_len;          /* offset 0xD0 */
     u8  guest_ins[15];          /* offset 0xD1 */
-    u64 res10a[100];            /* offset 0xE0 pad to save area */
+    u64 res10a[8];              /* offset 0xE0 */
+    u16 bus_lock_thresh;        /* offset 0x120 */
+    u16 res10b[3];              /* offset 0x122 */
+    u64 res10c[91];             /* offset 0x128 pad to save area */
 
     union {
         struct segment_register sreg[6];
@@ -583,6 +593,7 @@ VMCB_ACCESSORS(dr_intercepts, intercepts)
 VMCB_ACCESSORS(exception_intercepts, intercepts)
 VMCB_ACCESSORS(general1_intercepts, intercepts)
 VMCB_ACCESSORS(general2_intercepts, intercepts)
+VMCB_ACCESSORS(general3_intercepts, intercepts)
 VMCB_ACCESSORS(pause_filter_count, intercepts)
 VMCB_ACCESSORS(pause_filter_thresh, intercepts)
 VMCB_ACCESSORS(tsc_offset, intercepts)
diff --git a/xen/arch/x86/include/asm/hvm/svm.h b/xen/arch/x86/include/asm/hvm/svm.h
index a6d7e4aed3..15f0268be7 100644
--- a/xen/arch/x86/include/asm/hvm/svm.h
+++ b/xen/arch/x86/include/asm/hvm/svm.h
@@ -37,6 +37,7 @@ extern u32 svm_feature_flags;
 #define SVM_FEATURE_VGIF          16 /* Virtual GIF */
 #define SVM_FEATURE_SSS           19 /* NPT Supervisor Shadow Stacks */
 #define SVM_FEATURE_SPEC_CTRL     20 /* MSR_SPEC_CTRL virtualisation */
+#define SVM_FEATURE_BUS_LOCK      29 /* Bus Lock Threshold */
 
 static inline bool cpu_has_svm_feature(unsigned int feat)
 {
@@ -56,6 +57,7 @@ static inline bool cpu_has_svm_feature(unsigned int feat)
 #define cpu_has_svm_vloadsave cpu_has_svm_feature(SVM_FEATURE_VLOADSAVE)
 #define cpu_has_svm_sss       cpu_has_svm_feature(SVM_FEATURE_SSS)
 #define cpu_has_svm_spec_ctrl cpu_has_svm_feature(SVM_FEATURE_SPEC_CTRL)
+#define cpu_has_svm_bus_lock  cpu_has_svm_feature(SVM_FEATURE_BUS_LOCK)
 
 #define MSR_INTERCEPT_NONE    0
 #define MSR_INTERCEPT_READ    1
diff --git a/xen/arch/x86/include/asm/perfc_defn.h b/xen/arch/x86/include/asm/perfc_defn.h
index d6127cb91e..ac7439b992 100644
--- a/xen/arch/x86/include/asm/perfc_defn.h
+++ b/xen/arch/x86/include/asm/perfc_defn.h
@@ -7,7 +7,7 @@ PERFCOUNTER_ARRAY(exceptions,           "exceptions", 32)
 #ifdef CONFIG_HVM
 
 #define VMX_PERF_EXIT_REASON_SIZE 76
-#define VMEXIT_NPF_PERFC 143
+#define VMEXIT_NPF_PERFC 166
 #define SVM_PERF_EXIT_REASON_SIZE (VMEXIT_NPF_PERFC + 1)
 PERFCOUNTER_ARRAY(vmexits,              "vmexits",
                   MAX(VMX_PERF_EXIT_REASON_SIZE, SVM_PERF_EXIT_REASON_SIZE))
-- 
2.43.0


