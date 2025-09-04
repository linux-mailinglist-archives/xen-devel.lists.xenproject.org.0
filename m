Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F510B448D7
	for <lists+xen-devel@lfdr.de>; Thu,  4 Sep 2025 23:52:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1111000.1459950 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uuHry-0004aa-Mj; Thu, 04 Sep 2025 21:51:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1111000.1459950; Thu, 04 Sep 2025 21:51:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uuHry-0004YT-Jn; Thu, 04 Sep 2025 21:51:50 +0000
Received: by outflank-mailman (input) for mailman id 1111000;
 Thu, 04 Sep 2025 21:51:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ehPD=3P=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1uuHrw-0004YN-IE
 for xen-devel@lists.xenproject.org; Thu, 04 Sep 2025 21:51:48 +0000
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on20606.outbound.protection.outlook.com
 [2a01:111:f403:2409::606])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 59b317c5-89d9-11f0-9809-7dc792cee155;
 Thu, 04 Sep 2025 23:51:45 +0200 (CEST)
Received: from DM5PR08CA0027.namprd08.prod.outlook.com (2603:10b6:4:60::16) by
 LV8PR12MB9359.namprd12.prod.outlook.com (2603:10b6:408:1fe::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.18; Thu, 4 Sep
 2025 21:51:42 +0000
Received: from DS1PEPF00017099.namprd05.prod.outlook.com
 (2603:10b6:4:60:cafe::94) by DM5PR08CA0027.outlook.office365.com
 (2603:10b6:4:60::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9094.17 via Frontend Transport; Thu,
 4 Sep 2025 21:51:41 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DS1PEPF00017099.mail.protection.outlook.com (10.167.18.103) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9094.14 via Frontend Transport; Thu, 4 Sep 2025 21:51:40 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 4 Sep
 2025 16:51:40 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.1748.10; Thu, 4 Sep
 2025 14:51:40 -0700
Received: from fedora.mshome.net (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Thu, 4 Sep 2025 16:51:39 -0500
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
X-Inumbo-ID: 59b317c5-89d9-11f0-9809-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=I4v23K34jSdDo+Z1EeNzPUuflJHL4PKh6/ZjgawiYBc31yS4nauZtETFBeuahCj3SqXsuWdr2Wu7WDnxLjDNwVzUoWsDQ4bI89XxPnFs6knjeek7dqKefzwn2PqdH7hbwfBeYNXJMJL5OWcNboSVAd8vTj0gPl0OPpk4wXPdM13j8867Ve8h/5Nuq4IVCgKT19QEbeTzV9nc2D/kUcGIaYpDEJsBe5ZVT89NF8as3Bu4YjoOwpDrrfDdLZKp0OOYl2ljndyI1Yeloh7jxucZpMWfWi8J095xdmsS1zZ8/zUTeR7B+rw2kLzPlGUEYimYmG2gHbkYw/7MVrddt7+lZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=02vFATc04fcvMY/aHiuyddySZsR9XJNjuJlXKYQkPow=;
 b=WDuozskEZwU/GAeZ9Z7KLMKURvTsqeR21Pb3lKYiVfbQho5QJ4SRO8LxHMvIjUDYp0NnPjLKiUnZuM3jSkvAzsomo2P/6fGXfEb1UnvrWKsbkRRpnkxEe8ukwwfqi546yGeOsALiIk3mvIhEikKjyCBflfgK612Ks8muVKUxMp2cgLxFoB/Ob6mZljOkMEYZMKMT9vr5Xga99I0Jw4AcCBZGViBVFpVqye7Aa3wUT5AoOXIQAsSxzK9eKzKhu6msqT08g43/jOhaAx2e6lJZ8a/JDl+ObbYdyfd+huGK5smYzjsM/AeeEOfcai7cKKi/TDxHsEjBtxi/CxX+U07wRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=02vFATc04fcvMY/aHiuyddySZsR9XJNjuJlXKYQkPow=;
 b=Vyio3uJJTehZJRjKXlxqiviplKHe7N7BnfPhDLco2wIeFiulYQA4F/krdDl/E24/2Vn7wa71SiFGzf6q912wcFhlx4NMZofGc8+ffGpbzV5p/e7sd950ulGrSgWodsMbi3jv7iZgkLZGrxuuAqk+rsgjlH8AuR5aGjQWoUxD2hE=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Jason Andryuk <jason.andryuk@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Jason Andryuk <jason.andryuk@amd.com>, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH] x86/apic: Avoid infinite loop in io_apic_level_ack_pending()
Date: Thu, 4 Sep 2025 17:51:37 -0400
Message-ID: <20250904215137.135529-1-jason.andryuk@amd.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF00017099:EE_|LV8PR12MB9359:EE_
X-MS-Office365-Filtering-Correlation-Id: 8c9237c9-ddab-4a76-5470-08ddebfd3b49
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?olw2FMSwCZP15ET8T/0POEWZjrpexP+5rurZNev4zhEDzuhxnZiJYj1cGipW?=
 =?us-ascii?Q?fmYSxUVi+0DC/rPzqPnpb/tFd4vVzkMxfPIXH3G00fJ6R59IT89KFFnWgtw7?=
 =?us-ascii?Q?KLqOs/Diebvo8CRKWSgA3yBLJw0DP7oEW1axR8+Glylmb9vNpZAzv7JJm5rn?=
 =?us-ascii?Q?3D/PToZQaV6XbHrgAaiboKSVqntGgsgFdox1wJoEH6alrQ/CgWVMfudwJLHw?=
 =?us-ascii?Q?Re/48TGl3FTOsiMkz14A+euga5mwe1Sg7E0ffYNjdP9A3RVAE9LFW+a8OUdL?=
 =?us-ascii?Q?UwNcIzjQUXO95vAunt4PIjMMl7yZXuYPiUVS10xpW5tFPrYh6hWyccpTr95U?=
 =?us-ascii?Q?zR2v4HxeL2boZ8RU8T38jPtKclJ7S24vJKPZSWXsGekRsiFR8EInrPDIhI/h?=
 =?us-ascii?Q?8Pztd2oO7BA55kQ0N3Szz6TR0TNLUqksKyymGa7Kg1kSdlqgRwXXfVvyK8cx?=
 =?us-ascii?Q?Yi1R/PxLy3pBSbL9b5V792Q4jpfE3TbYo4URv1r5NCUtuAv4/bT3Nk8jEkws?=
 =?us-ascii?Q?j8k8eu1Lp0/eNHkhdIw1ZlKdyfTN9tBxcWGg+F5hLG9a+b4f1reOEv1o8xCs?=
 =?us-ascii?Q?s8Kk1xficZlvxU5+Gf5qB4SSRTbRxcw91+5yNI8WpZ+y/P4rTyEeKvMBAXMQ?=
 =?us-ascii?Q?mpsjL7zSCLVFYnDNiVwjK5ow07r7/A/DelYBzGErgVZm/H5rkHYKgU4qJpCN?=
 =?us-ascii?Q?YyuX2CcQr5U+MDT2wdgsldhjWM+TSby4YPAsoevnWJQbhz+QZHHz4pOKfngR?=
 =?us-ascii?Q?DS18cGk8h99WP60jk0/mVf4O/IcrSyTWun8EwPFCCLITjm7m8rNs3D2qmXBa?=
 =?us-ascii?Q?wXFQVKpKfJ1G9BhzU+XjC0xpdqxe05m5orB+0Q3Z/buP78hOP2Kf1AqoZ1MD?=
 =?us-ascii?Q?Ev2y59LRACwd9r3KZazJFKuE+egMnAyKXwJdFGxN+G72PW8DYauCHiNIwHlI?=
 =?us-ascii?Q?6nfZAVoG+I+wSqUXu3FVMnE2quvMB/M6JcytrSur4d5i95HziN4mSMYeJUTN?=
 =?us-ascii?Q?NCiYjBTr/O/RUjfF077q+pOLnDoAbzazdE+/ExnVcyaUEBGOdVUfkGW1oEsr?=
 =?us-ascii?Q?iI/87GpTNAoSF7kxeo8FoAaP8w5DIxLBJGOq/e8L9ce5NW3YCQe0Ei0cBoKc?=
 =?us-ascii?Q?qHyVQwiuVL98OuE3jZMaixx6MJWvrRsLv+s/h9QozKRavHDNmrvhiq2dMkZO?=
 =?us-ascii?Q?pKS7yM2ZfZ7Ns8XcqC06K17MyYrdN1TVvh052naw4VgSoNBRbjHtNf4hvr3n?=
 =?us-ascii?Q?iJydnXMzRjbm2NOansEpc1Igb6WlH0QK3CKB0xbaaA/gfhcl53ce/9jS7eQQ?=
 =?us-ascii?Q?tq29aHFFs38yZv09FMdT5DWNY53E2Cqwghub+Mh+dVm4SKu/yxSomriTwO5h?=
 =?us-ascii?Q?zG7Z8CFjhCHqtO7VF70MapH6Gh5L3RQPxY9o9aKEvS9cUvZzmLE4aeAZWg3B?=
 =?us-ascii?Q?DMNtk35iNm1jPpbmF7Lww4lHNh7XmALVdkmwWF3mTh+44tI5PogEItzbMr8B?=
 =?us-ascii?Q?ga+xk4W3xb0h1xDYOUBHuG52XXQDCQgjEtm5?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2025 21:51:40.9628
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c9237c9-ddab-4a76-5470-08ddebfd3b49
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS1PEPF00017099.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9359

io_apic_level_ack_pending() will end up in an infinite loop if
entry->pin == -1.  entry does not change, so it will keep reading -1.

Switched to breaking out of the loop.

Fixes: f821102450a1 ("x86: IRQ Migration logic enhancement.")
Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
---
Noticed during code inspection.
---
 xen/arch/x86/io_apic.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/arch/x86/io_apic.c b/xen/arch/x86/io_apic.c
index 17e6827f4b..b21f0515f5 100644
--- a/xen/arch/x86/io_apic.c
+++ b/xen/arch/x86/io_apic.c
@@ -1715,7 +1715,7 @@ static bool io_apic_level_ack_pending(unsigned int irq)
 
         pin = entry->pin;
         if (pin == -1)
-            continue;
+            break;
         reg = io_apic_read(entry->apic, 0x10 + pin*2);
         /* Is the remote IRR bit set? */
         if (reg & IO_APIC_REDIR_REMOTE_IRR) {
-- 
2.51.0


