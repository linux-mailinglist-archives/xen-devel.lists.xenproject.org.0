Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yHTVLuUThmk1JgQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 06 Feb 2026 17:16:37 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C32610024D
	for <lists+xen-devel@lfdr.de>; Fri, 06 Feb 2026 17:16:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1223525.1531056 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1voOVR-0000EW-SB; Fri, 06 Feb 2026 16:16:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1223525.1531056; Fri, 06 Feb 2026 16:16:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1voOVR-00009e-MI; Fri, 06 Feb 2026 16:16:29 +0000
Received: by outflank-mailman (input) for mailman id 1223525;
 Fri, 06 Feb 2026 16:16:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lgBG=AK=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1voOVP-0005HV-Ss
 for xen-devel@lists.xenproject.org; Fri, 06 Feb 2026 16:16:28 +0000
Received: from PH8PR06CU001.outbound.protection.outlook.com
 (mail-westus3azlp170120001.outbound.protection.outlook.com
 [2a01:111:f403:c107::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2f402c0e-0377-11f1-b161-2bf370ae4941;
 Fri, 06 Feb 2026 17:16:26 +0100 (CET)
Received: from PH7PR10CA0014.namprd10.prod.outlook.com (2603:10b6:510:23d::16)
 by CH3PR12MB8910.namprd12.prod.outlook.com (2603:10b6:610:179::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.15; Fri, 6 Feb
 2026 16:16:16 +0000
Received: from SN1PEPF00036F42.namprd05.prod.outlook.com
 (2603:10b6:510:23d:cafe::74) by PH7PR10CA0014.outlook.office365.com
 (2603:10b6:510:23d::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9587.16 via Frontend Transport; Fri,
 6 Feb 2026 16:16:11 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 SN1PEPF00036F42.mail.protection.outlook.com (10.167.248.26) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9587.10 via Frontend Transport; Fri, 6 Feb 2026 16:16:16 +0000
Received: from xcbagarciav01.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 6 Feb
 2026 10:16:10 -0600
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
X-Inumbo-ID: 2f402c0e-0377-11f1-b161-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hN+d7duL8jfrV55NJv7n71rGpoCzUDP6Ku2vaKoLE0JR/+X2Zs+xdEgjECl5T9CnMH3o81Q9vU9Dj7Onb2RL/Yq3GnNNN8VMY2wl41LDGeS32NhPv/TcwqxUFbfTXJTqg51uYwMVab01Gma+wCksKBPZG+AV8b8XlNm8+Kv9ImTLOBS88car2qet8rTRZY6TofhKK2kdyyoxjcSBj+Zqfe+y8wPZspR3oO+yNjL01TBkQzJPDIK4dQ9gqb7u/TRY0EDS9+oQ/eo5qjP9soZW6keqgUy49cpLXFbb5EVGp6NebEcDKdsojJ+lO7kYUFWptDk8OcbrHD4Wilq6I4ADfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fjZ3KGt1oKvWdF+qKsxJPwEsM/qwiLCAqyhzQ4GhfSE=;
 b=idWomeWOtNt2BYk3REeTNjzOtEp/uUgP63xr40PO2t20XQlDnTN2Hlix5rCx0AgzCkmZQuSPnnIOzA7nzugHkmOcXvw+cjrg8eJYoZXZNkPbxyS8T1Bt4dpXltmJg5Q4En/LMbXbrpzYVxjJac2e/EnzSbiAHEspdbaEKBj2tPSlRNumuqrMgcYLq654de4SLQPN8GgLUos2D5gbr0zULUhw2Nh23+zrIIEBU9jhH8SouMlkbfr5idN5XiJKgt+qBG1z4lnNfOZJjR6ggj/0kJ+o3oTPQCcx7+DYmb9FKAXFKL05PaB9WEA77341CehcBSW5KYheA7j+QNWSfZDA/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fjZ3KGt1oKvWdF+qKsxJPwEsM/qwiLCAqyhzQ4GhfSE=;
 b=s3+A7B7n50gkhFksWozjr7XqW5rRL3VtM3aZfvt++OsGtgbsW1cl8JziOCh1+2GBJhX8vMYpTiBhoINKdBX8iotKpTXEy6uU6e4WJuCf8szxiwzwGXdt9dYW6XCgAuMvnyEg6z8KwXRnye2LohsDM0L4rxkf1ISMMcQ8F1LPkRA=
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
	<jason.andryuk@amd.com>
Subject: [PATCH 10/12] x86/mcheck: Migrate vendor checks to use cpu_vendor()
Date: Fri, 6 Feb 2026 17:15:33 +0100
Message-ID: <20260206161539.209922-12-alejandro.garciavallejo@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260206161539.209922-1-alejandro.garciavallejo@amd.com>
References: <20260206161539.209922-1-alejandro.garciavallejo@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF00036F42:EE_|CH3PR12MB8910:EE_
X-MS-Office365-Filtering-Correlation-Id: d84cdd99-d9f8-49de-2249-08de659b0e41
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700013|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?E4yM8adFBgM/0sMwppSPLrjXuP6+d8RTa1qwtKSTJslMzAm873KBjXmUZkCi?=
 =?us-ascii?Q?waKt5+FBzwBQ/V1fg4gF/tWOdC4VZg4qsUT5pd7SYlGMxKcZm9Aqf5v3S05L?=
 =?us-ascii?Q?sJXOowNTP2UEqCoLWqrhs77/36d8m8Julzv6/L3T33afcJtzlX84X6FG6NEk?=
 =?us-ascii?Q?lLEg0hKqGB2hpHVSgKEqh4KaGIDb2s+jJyW0SBrcw9Johy2ZaDWVTjeux8Bb?=
 =?us-ascii?Q?0PITkiTBh1cbYEK3MZ4pRCyRbor+t4/cOeiyZ+m9Omm6Q/fH7rmaeP3VAE8E?=
 =?us-ascii?Q?wTryNDdcni138QH5Ww+jDTBRmD8psAEkbiVRUbrpwXAQkpS4uWno+2VGwiYy?=
 =?us-ascii?Q?P/2lBwC0gEDtE8kVbBO09goR59dFSo5jU4ZlyOluCBI6MHAvhbYxuuY4M3Np?=
 =?us-ascii?Q?fXruISRDieQWgJo5b7nD/hE82BmC5x86X+oKyvRxajX8mY/K4suNqn6Z4xW9?=
 =?us-ascii?Q?P/6C4AFdiVUrUiyp5T1NvqRasvPppegsgmik/Li2Wo3UxC+GeOWgHbDIOLKp?=
 =?us-ascii?Q?nT6KVJ1JDLVEld/uaQ8CVLCikvXg9pzLaAjHYLTlqhGxX3A+SgmfIXer9rzC?=
 =?us-ascii?Q?x76f45dR0sRL/2bj+ysQuuNd5fZpsQgAqXi/pyOWCCxuHY1yMSt0vUC0GO3L?=
 =?us-ascii?Q?S8dU2iKRzfh0UX22GMBYu4NE8zemeErYmdrE2W1+QAruDz4D03yPY7zPtFmy?=
 =?us-ascii?Q?UEOxjmioB+v7a2CyaDgnUg5r0vWy5n1veFPKTMKTxvar46I0e6PNA6gI6ipA?=
 =?us-ascii?Q?b9Vjq/wSTWKFRc/Zdpp4V8Yp4izf2Xs2hPOoduXgyL7QWmChq1mrqEISGxIL?=
 =?us-ascii?Q?xFGUx9jzNQHVEd8WAce2fAPRRmAp78tOZwI99JTqWjG3tmHR7lE2KbVmjAC+?=
 =?us-ascii?Q?Nt5q4tgxqy9g06Vcy6yrOUKlsj83hvNPj0oAer6vWu13+LSDAEj1R0pP83CT?=
 =?us-ascii?Q?q+lOtPyQ2OVLZ4GcAWw0eXoNFBbNNXweJTacUeUJMTUvcFuT3DxmAUo0g//j?=
 =?us-ascii?Q?M+3bsqOtIpwUF/PHnlxj41hfqQgAriyna2xLHcHyMXRF7J2QQZOMiIVRJujv?=
 =?us-ascii?Q?teK0EWNSwCdGB3H13p1UHve8rkN3I85qOt0SGjm2BxB9zKA/fwiBD9Gr56y4?=
 =?us-ascii?Q?Mp8riybhMJ2Djl1rDIxxiQUGzVdvOO+ZvUhVKaaja3O6ZHmOckVhFK8HD7Iw?=
 =?us-ascii?Q?IJTraXqfHh+STamkvabEFTzYIj359J9Uv68BlA5Y9xQdjczNtUaBFi7c5V0y?=
 =?us-ascii?Q?6TVnrJBdLnm8YmJ+geLaex2Ys7uOWRHiZ14+cAgP6F6WaZj8636L+pirlXkR?=
 =?us-ascii?Q?SAMfpnwGhvz6CN/Ubd8P2v9G5Pie3MWXdFuIsK7p70AJQ6eZ+/yoOfuLU5OH?=
 =?us-ascii?Q?eo81G0+dzZKsUVad0H5HVD6p284RUjGEkuZyofkSVBdVXoLK49saACIKFZVE?=
 =?us-ascii?Q?phJYJsl34vS/lZ+w3e+pRmQ/xmer9WuQK36sXABvAFc7WXD6WB2D6ExMts9N?=
 =?us-ascii?Q?YoY/DRPPFqUH6VGQl8H3BK927QynWBHUk8zXi8JXlXW1V56PQdIRxDvtuIXn?=
 =?us-ascii?Q?etXqjFZjDYOcXqdyekFPXzZDa8NYqRAv5xXFGTyZc4PiWnTYflO2AtJNp1ZP?=
 =?us-ascii?Q?VJiVvWnCIt6kMJg8SQGSAC5t/VcXiq+ftlo6c63pv0xaQdhI9jn6yzrQMmGI?=
 =?us-ascii?Q?bxRrsA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	K8oZZBH6uZBla21Z9M2vfLJAX68OLd8+0oO51WGf1RFZseJNTj5fDFtZA0oYMahII1C5QXMdhF3TC270ePYEKi2EVy7faqG2WNz8K19BN0tNZOLI4o1lOCelkUVcv/jaX6hr0k7rbFcP+q5WVU9eS8v0BMj7EzYZHrujusIFf7P3L7i2Vhul/tZ2gqSGIiR8HhdKQRrp2x8qy7bKZyw3U+PtMJy4v4dUelg0yl2Mtmf5PVdMy/gokMXYIy3s6NnFEQxP90yaQq0+YK0hyWTFeW60HmSRJxL7U1S0IQAop3RwFuDLnmOa7tJ7isOpSYc5H1V9SbZKfa27m4Hw/UQX3HxCK1SgWpwG4BRgesajIXuaf4+gbCsAfoKSNjO/9puf8JTxvH+QDLOWahtvrf+jPG485G7OQ4hn2BbUd9fTTh/hq3EPBFe+SSV6zYlc6OPw
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2026 16:16:16.5847
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d84cdd99-d9f8-49de-2249-08de659b0e41
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF00036F42.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8910
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.69 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:alejandro.garciavallejo@amd.com,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:jason.andryuk@amd.com,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[alejandro.garciavallejo@amd.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	FORGED_SENDER_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email,amd.com:dkim,amd.com:mid];
	FROM_NEQ_ENVFROM(0.00)[alejandro.garciavallejo@amd.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	HAS_XOIP(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-0.966];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 4C32610024D
X-Rspamd-Action: no action

Not a functional change.

Signed-off-by: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
---
 xen/arch/x86/cpu/mcheck/amd_nonfatal.c |  2 +-
 xen/arch/x86/cpu/mcheck/mcaction.c     |  2 +-
 xen/arch/x86/cpu/mcheck/mce.c          | 17 ++++++++---------
 xen/arch/x86/cpu/mcheck/mce_amd.c      |  7 +++----
 xen/arch/x86/cpu/mcheck/mce_intel.c    |  7 +++----
 xen/arch/x86/cpu/mcheck/vmce.c         |  4 ++--
 6 files changed, 18 insertions(+), 21 deletions(-)

diff --git a/xen/arch/x86/cpu/mcheck/amd_nonfatal.c b/xen/arch/x86/cpu/mcheck/amd_nonfatal.c
index 7d48c9ab5f..ebe13911ba 100644
--- a/xen/arch/x86/cpu/mcheck/amd_nonfatal.c
+++ b/xen/arch/x86/cpu/mcheck/amd_nonfatal.c
@@ -191,7 +191,7 @@ static void cf_check mce_amd_work_fn(void *data)
 
 void __init amd_nonfatal_mcheck_init(struct cpuinfo_x86 *c)
 {
-	if (!(c->x86_vendor & (X86_VENDOR_AMD | X86_VENDOR_HYGON)))
+	if (!(cpu_vendor() & (X86_VENDOR_AMD | X86_VENDOR_HYGON)))
 		return;
 
 	/* Assume we are on K8 or newer AMD or Hygon CPU here */
diff --git a/xen/arch/x86/cpu/mcheck/mcaction.c b/xen/arch/x86/cpu/mcheck/mcaction.c
index bf7a0de965..b7fc5056d8 100644
--- a/xen/arch/x86/cpu/mcheck/mcaction.c
+++ b/xen/arch/x86/cpu/mcheck/mcaction.c
@@ -101,7 +101,7 @@ mc_memerr_dhandler(struct mca_binfo *binfo,
                       * not always precise. In that case, fallback to broadcast.
                       */
                      global->mc_domid != bank->mc_domid ||
-                     (boot_cpu_data.x86_vendor == X86_VENDOR_INTEL &&
+                     ((cpu_vendor() & X86_VENDOR_INTEL) &&
                       (!(global->mc_gstatus & MCG_STATUS_LMCE) ||
                        !(d->vcpu[mc_vcpuid]->arch.vmce.mcg_ext_ctl &
                          MCG_EXT_CTL_LMCE_EN))) )
diff --git a/xen/arch/x86/cpu/mcheck/mce.c b/xen/arch/x86/cpu/mcheck/mce.c
index 4b295aeeb5..91c5033edb 100644
--- a/xen/arch/x86/cpu/mcheck/mce.c
+++ b/xen/arch/x86/cpu/mcheck/mce.c
@@ -333,8 +333,7 @@ mcheck_mca_logout(enum mca_source who, struct mca_banks *bankmask,
                 ASSERT(mig);
                 mca_init_global(mc_flags, mig);
                 /* A hook here to get global extended msrs */
-                if ( IS_ENABLED(CONFIG_INTEL) &&
-                     boot_cpu_data.x86_vendor == X86_VENDOR_INTEL )
+                if ( cpu_vendor() & X86_VENDOR_INTEL )
                     intel_get_extended_msrs(mig, mci);
             }
         }
@@ -564,8 +563,8 @@ bool mce_available(const struct cpuinfo_x86 *c)
  */
 unsigned int mce_firstbank(struct cpuinfo_x86 *c)
 {
-    return c->x86 == 6 &&
-           c->x86_vendor == X86_VENDOR_INTEL && c->x86_model < 0x1a;
+    return (cpu_vendor() & X86_VENDOR_INTEL) &&
+           c->x86 == 6 && c->x86_model < 0x1a;
 }
 
 static int show_mca_info(int inited, struct cpuinfo_x86 *c)
@@ -862,7 +861,7 @@ static void x86_mcinfo_apei_save(
     memset(&m, 0, sizeof(struct mce));
 
     m.cpu = mc_global->mc_coreid;
-    m.cpuvendor = boot_cpu_data.x86_vendor;
+    m.cpuvendor = cpu_vendor();
     m.cpuid = cpuid_eax(1);
     m.socketid = mc_global->mc_socketid;
     m.apicid = mc_global->mc_apicid;
@@ -964,7 +963,7 @@ static void cf_check __maybe_unused do_mc_get_cpu_info(void *v)
                         &xcp->mc_ncores_active, &xcp->mc_nthreads);
     xcp->mc_cpuid_level = c->cpuid_level;
     xcp->mc_family = c->x86;
-    xcp->mc_vendor = c->x86_vendor;
+    xcp->mc_vendor = cpu_vendor();
     xcp->mc_model = c->x86_model;
     xcp->mc_step = c->x86_mask;
     xcp->mc_cache_size = c->x86_cache_size;
@@ -1122,7 +1121,7 @@ static bool __maybe_unused x86_mc_msrinject_verify(struct xen_mc_msrinject *mci)
 
         if ( IS_MCA_BANKREG(reg, mci->mcinj_cpunr) )
         {
-            if ( c->x86_vendor == X86_VENDOR_AMD )
+            if ( (cpu_vendor() & X86_VENDOR_AMD) )
             {
                 /*
                  * On AMD we can set MCi_STATUS_WREN in the
@@ -1157,7 +1156,7 @@ static bool __maybe_unused x86_mc_msrinject_verify(struct xen_mc_msrinject *mci)
             case MSR_F10_MC4_MISC1:
             case MSR_F10_MC4_MISC2:
             case MSR_F10_MC4_MISC3:
-                if ( c->x86_vendor != X86_VENDOR_AMD )
+                if ( !(cpu_vendor() & X86_VENDOR_AMD) )
                     reason = "only supported on AMD";
                 else if ( c->x86 < 0x10 )
                     reason = "only supported on AMD Fam10h+";
@@ -1165,7 +1164,7 @@ static bool __maybe_unused x86_mc_msrinject_verify(struct xen_mc_msrinject *mci)
 
             /* MSRs that the HV will take care of */
             case MSR_K8_HWCR:
-                if ( c->x86_vendor & (X86_VENDOR_AMD | X86_VENDOR_HYGON) )
+                if ( cpu_vendor() & (X86_VENDOR_AMD | X86_VENDOR_HYGON) )
                     reason = "HV will operate HWCR";
                 else
                     reason = "only supported on AMD or Hygon";
diff --git a/xen/arch/x86/cpu/mcheck/mce_amd.c b/xen/arch/x86/cpu/mcheck/mce_amd.c
index 25c29eb3d2..b4d09fd6c1 100644
--- a/xen/arch/x86/cpu/mcheck/mce_amd.c
+++ b/xen/arch/x86/cpu/mcheck/mce_amd.c
@@ -160,7 +160,7 @@ mcequirk_lookup_amd_quirkdata(const struct cpuinfo_x86 *c)
 {
     unsigned int i;
 
-    BUG_ON(c->x86_vendor != X86_VENDOR_AMD);
+    BUG_ON(!(cpu_vendor() & X86_VENDOR_AMD));
 
     for ( i = 0; i < ARRAY_SIZE(mce_amd_quirks); i++ )
     {
@@ -291,7 +291,7 @@ amd_mcheck_init(const struct cpuinfo_x86 *c, bool bsp)
     uint32_t i;
     enum mcequirk_amd_flags quirkflag = 0;
 
-    if ( c->x86_vendor != X86_VENDOR_HYGON )
+    if ( !(cpu_vendor() & X86_VENDOR_HYGON) )
         quirkflag = mcequirk_lookup_amd_quirkdata(c);
 
     /* Assume that machine check support is available.
@@ -337,6 +337,5 @@ amd_mcheck_init(const struct cpuinfo_x86 *c, bool bsp)
             ppin_msr = MSR_AMD_PPIN;
     }
 
-    return c->x86_vendor == X86_VENDOR_HYGON ?
-            mcheck_hygon : mcheck_amd_famXX;
+    return (cpu_vendor() & X86_VENDOR_HYGON) ? mcheck_hygon : mcheck_amd_famXX;
 }
diff --git a/xen/arch/x86/cpu/mcheck/mce_intel.c b/xen/arch/x86/cpu/mcheck/mce_intel.c
index 839a0e5ba9..90dbb60236 100644
--- a/xen/arch/x86/cpu/mcheck/mce_intel.c
+++ b/xen/arch/x86/cpu/mcheck/mce_intel.c
@@ -711,8 +711,8 @@ static bool mce_is_broadcast(struct cpuinfo_x86 *c)
      * DisplayFamily_DisplayModel encoding of 06H_EH and above,
      * a MCA signal is broadcast to all logical processors in the system
      */
-    if ( c->x86_vendor == X86_VENDOR_INTEL && c->x86 == 6 &&
-         c->x86_model >= 0xe )
+    if ( (cpu_vendor() & X86_VENDOR_INTEL) &&
+         c->x86 == 6 && c->x86_model >= 0xe )
         return true;
     return false;
 }
@@ -1018,7 +1018,6 @@ int vmce_intel_wrmsr(struct vcpu *v, uint32_t msr, uint64_t val)
 
 int vmce_intel_rdmsr(const struct vcpu *v, uint32_t msr, uint64_t *val)
 {
-    const struct cpu_policy *cp = v->domain->arch.cpu_policy;
     unsigned int bank = msr - MSR_IA32_MC0_CTL2;
 
     switch ( msr )
@@ -1036,7 +1035,7 @@ int vmce_intel_rdmsr(const struct vcpu *v, uint32_t msr, uint64_t *val)
         return 1;
     }
 
-    if ( !(cp->x86_vendor & X86_VENDOR_INTEL) )
+    if ( !(cpu_vendor() & X86_VENDOR_INTEL) )
         return 0;
 
     if ( bank < GUEST_MC_BANK_NUM )
diff --git a/xen/arch/x86/cpu/mcheck/vmce.c b/xen/arch/x86/cpu/mcheck/vmce.c
index 0c1bfb691b..393bf8c787 100644
--- a/xen/arch/x86/cpu/mcheck/vmce.c
+++ b/xen/arch/x86/cpu/mcheck/vmce.c
@@ -45,7 +45,7 @@ void vmce_init_vcpu(struct vcpu *v)
     int i;
 
     /* global MCA MSRs init */
-    if ( boot_cpu_data.x86_vendor == X86_VENDOR_INTEL )
+    if ( cpu_vendor() & X86_VENDOR_INTEL )
         v->arch.vmce.mcg_cap = INTEL_GUEST_MCG_CAP;
     else
         v->arch.vmce.mcg_cap = AMD_GUEST_MCG_CAP;
@@ -63,7 +63,7 @@ int vmce_restore_vcpu(struct vcpu *v, const struct hvm_vmce_vcpu *ctxt)
 {
     unsigned long guest_mcg_cap;
 
-    if ( boot_cpu_data.x86_vendor == X86_VENDOR_INTEL )
+    if ( cpu_vendor() & X86_VENDOR_INTEL )
         guest_mcg_cap = INTEL_GUEST_MCG_CAP | MCG_LMCE_P;
     else
         guest_mcg_cap = AMD_GUEST_MCG_CAP;
-- 
2.43.0


