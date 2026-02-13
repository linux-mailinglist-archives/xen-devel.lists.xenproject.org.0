Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 1k5PNFEOj2lhHgEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 13 Feb 2026 12:43:13 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E9AC135D16
	for <lists+xen-devel@lfdr.de>; Fri, 13 Feb 2026 12:43:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1230717.1536155 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vqrZZ-0007xN-U4; Fri, 13 Feb 2026 11:42:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1230717.1536155; Fri, 13 Feb 2026 11:42:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vqrZZ-0007v1-R6; Fri, 13 Feb 2026 11:42:57 +0000
Received: by outflank-mailman (input) for mailman id 1230717;
 Fri, 13 Feb 2026 11:42:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FeGe=AR=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1vqrZY-0007uv-Dx
 for xen-devel@lists.xenproject.org; Fri, 13 Feb 2026 11:42:56 +0000
Received: from SA9PR02CU001.outbound.protection.outlook.com
 (mail-southcentralusazlp170130001.outbound.protection.outlook.com
 [2a01:111:f403:c10c::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 221df5c6-08d1-11f1-b163-2bf370ae4941;
 Fri, 13 Feb 2026 12:42:54 +0100 (CET)
Received: from SJ0PR03CA0358.namprd03.prod.outlook.com (2603:10b6:a03:39c::33)
 by IA0PR12MB8328.namprd12.prod.outlook.com (2603:10b6:208:3dd::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.18; Fri, 13 Feb
 2026 11:42:49 +0000
Received: from CO1PEPF00012E7D.namprd03.prod.outlook.com
 (2603:10b6:a03:39c:cafe::1d) by SJ0PR03CA0358.outlook.office365.com
 (2603:10b6:a03:39c::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9611.13 via Frontend Transport; Fri,
 13 Feb 2026 11:42:46 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 CO1PEPF00012E7D.mail.protection.outlook.com (10.167.249.52) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9611.8 via Frontend Transport; Fri, 13 Feb 2026 11:42:47 +0000
Received: from xcbagarciav01.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 13 Feb
 2026 05:42:44 -0600
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
X-Inumbo-ID: 221df5c6-08d1-11f1-b163-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DXZDuqz9v8sy2snioDZufQth5lK3/3MLFXN/ENbMf3ksRl27T3Wl3Vw4keAKisyL76r4TLx5IbAZ4uANJb50M51U8zldtzIcFPvyTw62yHZSrX7rY4F6WJsifQGbY+c2OtnVaWaF7N+mVEQxzslCU36S3ZhDRqxwcPbeFHNVshczB7K96xJ5YSt2E8jFSNNLK54tlwtMQr+ueKZXCo/c/uuEE00OiXP5DdfA/7cFczaCMINCdEPtpaw67rQ1RdY7BRwq77eUr2N/7BP1wjX5eXQT6aEOhrNEjvrMeIOcxJuMUH3HB6XhWtTeIJy2WIXaTWNgrgILN7+N6SgdAgXARw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a1BoLmaVWRPZko7TcFAR7QJZ2rTpb1hvlyh7u4oJJgM=;
 b=ZUrmgg7GFziszoljO9vtO5gHHnI7akjyxrTzNOEht0Q3y0n0KiM4lL79g7hqOUHiLufVEr4zph2ak5LtspPnvaNnQHTAgHDo2obXR5mO0Q3Cu1ExnQKQL2jus29z5DfB3tCyOooUsaBp6yIk/Pt8tm6mAP0codF0SUMaRj1gYSgdt6Yhh6xh+hEdvRra1AOkIOtyievw4FNJVtZRTehkofJBvUTVT5KXvqPCfSb98SCidHI9MMqC7hKfQ/8tWwKx7916NfZPeEQinI09/V7MLDmgWGj4umaGhSBqMHh/97w4ycXNjmB/IxULW2iU9buBnpTcqRWB+NHOVY3jgblM6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a1BoLmaVWRPZko7TcFAR7QJZ2rTpb1hvlyh7u4oJJgM=;
 b=l2pHkf77MU8isyrw8JyxGU9PTAtyn5S7wxNUfktxeCru+EGoXH3I2pPUiQJo1P8jEspY6Deti7xtk+TlFMTnfVLZcSw4AtQcUb1v4G2cKXYkQUEqzs1q/NhWlbIKDX93zmv5cuhyW/bmo3sPZ1TNxEolVeLpenCoFY7SSKwIYQg=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
From: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Alejandro Vallejo <alejandro.garciavallejo@amd.com>, Oleksii Kurochko
	<oleksii.kurochko@gmail.com>, Community Manager
	<community.manager@xenproject.org>, Jan Beulich <jbeulich@suse.com>, "Andrew
 Cooper" <andrew.cooper3@citrix.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>, "Jason
 Andryuk" <jason.andryuk@amd.com>
Subject: [PATCH v3 0/4] x86: Drop cross-vendor support
Date: Fri, 13 Feb 2026 12:42:26 +0100
Message-ID: <20260213114232.42996-1-alejandro.garciavallejo@amd.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF00012E7D:EE_|IA0PR12MB8328:EE_
X-MS-Office365-Filtering-Correlation-Id: 4a30f81d-c914-4158-cfb7-08de6af502c7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|36860700013|1800799024|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?13mDT/DVTfXjIlGeLQTp4yLF1qZmPHkxD+pxhoy3a5m9NFJ9a4xKnT1pP5XE?=
 =?us-ascii?Q?Dsdsc7v14THXQLkrFHumcuDhYyVRqsyeDpj37jQmZ+qkqcrPFmi81bsCQgCF?=
 =?us-ascii?Q?Obz51R6hW1mB5GT8dJaDr7KFh20ZOrW7RUTVskak81fJloC9/ej2SC8NYZvk?=
 =?us-ascii?Q?gYOu6av1vSE+Dnz0X+SW0UPaHy8R2CFF/nRMwID1RLQq5Cvi1r3n31+6fKLI?=
 =?us-ascii?Q?502fBPvOCLGh0JDPRD02a8T4haaBpDkJNrWzugE3OCrjt5/izdm4re2scO3b?=
 =?us-ascii?Q?6eIdk9DyOnDB3MC95HWNxvC0Nr/E/4w7AJ4wzvXko4FSIxN6yIlBF2rSOHfw?=
 =?us-ascii?Q?TTMwFbrMArGQ/Rdo65+ZxuR6gou9vzWiJWbhItfkePfxmSYH8TITYmK1xX66?=
 =?us-ascii?Q?O7i7iOS5vzjFB/7Ubz5d//Wn4dtOEN+P9ZPi9uRrGvGx5FNQM1T/eojYHwW5?=
 =?us-ascii?Q?4JfiTMhvHdjgh7VRt7cYYdEaMC+JcAmUEfSCfj922MEa1npNY/WRzfDwjwlH?=
 =?us-ascii?Q?w+Bqenf+Yf+qrF9rm7zdukFtTl9aIvmULINzmszFTNIIMmpcG2YeFV2gqWyd?=
 =?us-ascii?Q?xs7YzmKr13GC2p5fYH7Wnx70zZ2fDhdqaWQcUQmQ9Cle6ywyQwH0n4TQnUAi?=
 =?us-ascii?Q?N11MPy+B+4gKdWspVH9c0lpuA4b/nMQB+ulpDm2j+14TmEG1b/HFA5JB7cRx?=
 =?us-ascii?Q?x3sNVdfGbzTkzgVwFmvmSOweSle3FX+81Jo2oDiFE0Hx+F7Wlu64f4xFOfvN?=
 =?us-ascii?Q?bWtTW8Mb55kNukHRRbB6pk0T8/E61ObNp4DgebcPvkcnlniMZnGpa2OPsnUq?=
 =?us-ascii?Q?Nwes7KSnzg7Vtdqi79MNnmlS0vJQcngqOhHyojgbxtkFugLVMX4RNsnX0tH+?=
 =?us-ascii?Q?tbXnZjOs+3UeCWx1RMq80smNP0XQ1WjhU7DPIuuE73didRDqgr/q3qKnuVpk?=
 =?us-ascii?Q?mMaGslrv/0YBFQNBhZ0jytfte+S60559u0nrRQp8A5mroMUQreVW1opgH/Pt?=
 =?us-ascii?Q?xYPvetnIAxtk/BY/hKBlPvS7Fanxce2CsN/BAA9sE1GnS/LzgRaHP6PTR+Za?=
 =?us-ascii?Q?V/nBl3A5MtW8Z9yV76kPOOSO8g7EOU781Dj8TWxSyaLeP7yxjOSIBHZ3E0OX?=
 =?us-ascii?Q?f+FOdh7sQzyoiPKxrRJpvM5FcHbhPIISxCMFeWVRUha7fk8PflPjqcOlalf2?=
 =?us-ascii?Q?aYIKgOH+suBhJBfgYM7E+v8bFFejI1IY7pgoLT1hDaxN3YIXTkXEcDOZK2Ml?=
 =?us-ascii?Q?MjJRLyi3Vx/W/70bolo5/8UNYPm6ahIj5LJR1ScunGtnATyK7wpBQeXJGAZC?=
 =?us-ascii?Q?cw89XBS7HoklcuGjnzx087bgmcJl5DYNR3W0HwWkFR7lim/iWgX3vUPotpxH?=
 =?us-ascii?Q?gaRDw+zveTfCoggZNkbxsQui3hTNmEda58NU0oDGN5KLa6BZ9p82AIP77PsW?=
 =?us-ascii?Q?R0sPt9/1by6+TNojvpi661ZnrixUTtfpcQfrCOp8PH21Oy7VnCi9MjAox9y+?=
 =?us-ascii?Q?1VAT7HSoiJiXXBuQsnF1c4mxZphi/W1BOBw7crFeeWqr5Wo56O2XM96u0+U3?=
 =?us-ascii?Q?JV7o8Y0yndjcamRqlG/Ctybs6w3/FCizfKl1hWBHoEOiTfTEZeeD2LyHNMZH?=
 =?us-ascii?Q?tMLJYq1R9KRHqlrqwYoT3FP209Ng1+24v9clj4J0EEN8gEAJh/8tGVbUccai?=
 =?us-ascii?Q?MuQaAwW9exMfhgvaqAPu2n25N/o=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700013)(1800799024)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	zfP/wTd8Dql4Y84k2v3WrAwgiRYwsLbjF5Bo9y+8SsrSnAMqO0arozbsuAcHb3gxzANzHTvJOTwPBX8iToprkAmwf9029k4hY11w0GajxSEgNXtXxFQA/MIavjAk9HxLojEUUmxcBjbqW+Aa9+nG5d1qp/VnWE2JMAxgSAh6yrURTz2uwKBb4wLhBflSFu5ivNHK0vz7NK1X2u5F0itNayeA/DTMeH3//YcSal6hnQT1XQRqSPEERyu+tcjKAj3DaKAwBFI9mYquOqxyVIv+lCJ+wc1Qf+XXGXyFn5xTuiDjeZLPoPfmssLv1CwU47k+qlU8u9HFMSjKhvozK6SmRg8uAH/0JdeYEZiltg0ASwgBO16zcMwKQzs4piqC5cabF5pTFkUeO1u4zxOmSz3Z9K79+kwioOlQLIMyTlaHeK+PPj2aPFm0ZplnisIoJn4n
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Feb 2026 11:42:47.8017
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a30f81d-c914-4158-cfb7-08de6af502c7
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF00012E7D.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8328
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.81 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:alejandro.garciavallejo@amd.com,m:oleksii.kurochko@gmail.com,m:community.manager@xenproject.org,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:anthony.perard@vates.tech,m:jason.andryuk@amd.com,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[alejandro.garciavallejo@amd.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[amd.com,gmail.com,xenproject.org,suse.com,citrix.com,vates.tech];
	DKIM_TRACE(0.00)[amd.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alejandro.garciavallejo@amd.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	HAS_XOIP(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 4E9AC135D16
X-Rspamd-Action: no action

Hi,

v1: https://lore.kernel.org/xen-devel/20260122164943.20691-1-alejandro.garciavallejo@amd.com/
v2: https://lore.kernel.org/xen-devel/20260205170923.38425-1-alejandro.garciavallejo@amd.com/
pipeline (green): https://gitlab.com/xen-project/people/agvallejo/xen/-/pipelines/2324131649

This time the policy check uses e{b,c,d}x rather than x86_vendor and there's
2 unit tests for it.

Cheers,
Alejandro

Alejandro Vallejo (4):
  x86: Reject CPU policies with vendors other than the host's
  x86/hvm: Disable cross-vendor handling in #UD handler
  x86/hvm: Remove cross-vendor checks from MSR handlers.
  x86/svm: Drop emulation of Intel's SYSENTER behaviour on AMD systems

 CHANGELOG.md                             |  5 ++
 tools/tests/cpu-policy/test-cpu-policy.c | 27 +++++++++
 xen/arch/x86/hvm/hvm.c                   | 77 +++++++++---------------
 xen/arch/x86/hvm/svm/svm.c               | 45 ++++++--------
 xen/arch/x86/hvm/svm/vmcb.c              |  3 +
 xen/arch/x86/hvm/vmx/vmx.c               |  3 +-
 xen/arch/x86/include/asm/hvm/svm-types.h | 10 ---
 xen/arch/x86/msr.c                       |  8 +--
 xen/lib/x86/policy.c                     |  5 +-
 9 files changed, 93 insertions(+), 90 deletions(-)


base-commit: 1f4f85b64d393be1aa8dc8170201f4fbfe9c7222
-- 
2.43.0


