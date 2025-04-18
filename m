Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 01E7EA93F47
	for <lists+xen-devel@lfdr.de>; Fri, 18 Apr 2025 23:00:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.959400.1351768 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u5soI-0002tD-Ug; Fri, 18 Apr 2025 20:59:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 959400.1351768; Fri, 18 Apr 2025 20:59:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u5soI-0002rn-RS; Fri, 18 Apr 2025 20:59:42 +0000
Received: by outflank-mailman (input) for mailman id 959400;
 Fri, 18 Apr 2025 20:59:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=h+zk=XE=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1u5soH-0002rh-QX
 for xen-devel@lists.xenproject.org; Fri, 18 Apr 2025 20:59:41 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2060b.outbound.protection.outlook.com
 [2a01:111:f403:2415::60b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 09b9434e-1c98-11f0-9eb0-5ba50f476ded;
 Fri, 18 Apr 2025 22:59:38 +0200 (CEST)
Received: from SJ0PR05CA0095.namprd05.prod.outlook.com (2603:10b6:a03:334::10)
 by PH8PR12MB7374.namprd12.prod.outlook.com (2603:10b6:510:216::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.22; Fri, 18 Apr
 2025 20:59:34 +0000
Received: from SN1PEPF0002529D.namprd05.prod.outlook.com
 (2603:10b6:a03:334:cafe::d6) by SJ0PR05CA0095.outlook.office365.com
 (2603:10b6:a03:334::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.14 via Frontend Transport; Fri,
 18 Apr 2025 20:59:33 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SN1PEPF0002529D.mail.protection.outlook.com (10.167.242.4) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8655.12 via Frontend Transport; Fri, 18 Apr 2025 20:59:33 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 18 Apr
 2025 15:59:32 -0500
Received: from fedora.mshome.net (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Fri, 18 Apr 2025 15:59:32 -0500
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
X-Inumbo-ID: 09b9434e-1c98-11f0-9eb0-5ba50f476ded
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BiZIwML8gBoXJBYyKPw57uHxeEcrwr8uo+3qvZt7bVVLekOxgOdr6ofhBKuxH6uiPqzZnNumJlICU9CIOnzRrv1DhoUV/h7D7gTtETDCYNXWJlxoWuwOYWHiHtYSyk5NoZdjbeKCK61dsUamxzoyyMgXjLd2Jzdo4XgRIKnjXpfiDjxUvYmNrZ8dhYThxovfC95qANbD5VGmTs9GeXQ4zh0Nw9zzKZLbHLpYkQEW6Z4E+hqbiJbmT+Zafx0yKZQSq2eWt1rsvYoQIJOGApmrkYOG/6ztRestSG20NVQjl2+m9gtv4tLXAsYOr9Syz/DhHMVvNzhbpKaHIcDQaEvZ+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RAdewbTf97jUH+iFwOrNcv+kf97lMEvKgqHa8aLDe4g=;
 b=O447z78HJbN8FK7tRovHKvfhmWfSSGkjy+SIjkgyS9U6rccYvi4IOPvCosjxA8ADLW7VzPFg5btNO9eGcXbmGiSqIMpR3xoo97gzMyMlMFMjiuhJwJjRD4IZ5T0MtPf15WOqt4t7X3tItpie/Il/zsVonE5pjqfViY7iGr59HYae8qKaAo8BfXahvaZ0TTSY8JWyj4KhZFaP5TLv9zoQ1tUcXPTfhoUyen8s7FInS0KgsSAun4I9D5m/sBwDFYohuFPU1jfj1cAAFpkt+b3zJusbsVn/i/zsNxU/1Peti/UEbk0Minn2FWGu2XILRSlEdVR4LJw1xzTa6IVThzS1Dw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RAdewbTf97jUH+iFwOrNcv+kf97lMEvKgqHa8aLDe4g=;
 b=bwQyPZr+RiPue858I1vtlP1Bmok6XIzWdC92KfpYeulF3YIVkjCL2B6j16UloiA+VVCkZRCuCPq/Yn0ef76UZLf7ZqOpIs50MhiCcsHIt8fkx46Rw2Wrmrq6krhAs6REaZuZXW/UZv475GON31q/IIHj6tKUR8AteJYKv2JOqJE=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Jason Andryuk <jason.andryuk@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Jason Andryuk <jason.andryuk@amd.com>, Juergen Gross <jgross@suse.com>,
	Julien Grall <julien@xen.org>, Anthony PERARD <anthony.perard@vates.tech>
Subject: [PATCH] xenstored: Remove setjmp.h
Date: Fri, 18 Apr 2025 16:59:33 -0400
Message-ID: <20250418205933.542150-1-jason.andryuk@amd.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB03.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF0002529D:EE_|PH8PR12MB7374:EE_
X-MS-Office365-Filtering-Correlation-Id: e6bd79dd-8b54-4925-d983-08dd7ebbeba1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?asBI+hDvAH2EU5vsOn3cg6J9kXMWGdKMKsCHn0agOqMTQ4qO3an34s/5OImh?=
 =?us-ascii?Q?IqC/CSlY1LANhmEFtTwt5Se/aAWdutWlRlo6eaJxqCsCMjLD7OnMOfqCGOrg?=
 =?us-ascii?Q?P7rKfxilwz+yvsAet6nF0z61vTBAF5cVf5yJJomYjrOqn+B/Kxmbbb+XXmrG?=
 =?us-ascii?Q?p84D8dq904+glR7L1Re+98LNSVzxgBeNeGGwf+FJ9RqXtrh1NIpyNF7ibWnC?=
 =?us-ascii?Q?ZEgIOuv1kNr+I+DuAXlA9WnnorD9rYwFQU0fQ5CZMjoy1fP12mZL4bCD9n0W?=
 =?us-ascii?Q?Q/xhS6hoavQlsmCRJEwEd/CPuiYZv9CVpbAXGMP3ifZcJjcpmQeqMsp4gEva?=
 =?us-ascii?Q?1bN/gniHhALIXQHs06nNoyirtHMhoMgvnwG2KbW7iVJsej+A9eWLcCAhdydZ?=
 =?us-ascii?Q?G6/E4dVD+sBZCBaUbpxCg0yGSay+7EQe0yB41Tg0nEh68Xi6A4xpEl74zHH9?=
 =?us-ascii?Q?6JrxjEKdqwTNGK8PorgYh1Fq+xwpYwAMkmrUSdFI9WLvlilAKA5cNSV9j279?=
 =?us-ascii?Q?epXwOEz7Oa1II6dECA7+uAJZDnmCdF3hqQG9Jt7QEwNtwBc//QG4WXM0zPjG?=
 =?us-ascii?Q?sX9Z3H0baIcBC87jLv74RtX4457aGntkwHgmaVLWt7BhDuf6g9mPOtOqry+O?=
 =?us-ascii?Q?Kl0ktbtciwKwu8O+zTEAVFYcmfgvvTbW7xWVSD6CU6Uk2oGLlT5r+7+M5vBt?=
 =?us-ascii?Q?e7iVNhOcZKdYPsDtsHnmkthjmgjjYY1DY/MvkVUa3YZ9lli3QVc7O/IzJjqr?=
 =?us-ascii?Q?hIsQo6iVS4h0N98KSuFC6NPAdCEm/NLb1PUEickokv5mlX6bTiFU7W3oaI81?=
 =?us-ascii?Q?1nGHoNC6yuFIrYBe3YmytD+QpTLi9yFSWm6qneJ7OI6kyfu41R/HV0verkni?=
 =?us-ascii?Q?JvWzR3ISv7XkQQhQrPzqZ+v/dY7Xm8vuN42fzfEyLdp+zPuizP2kEstIqQL+?=
 =?us-ascii?Q?wqkfC0c58Dcb4JyK/PVARrIzJZ6gsB1PVyRm6asQs7TQ8eS2qbfYOv1bDUdq?=
 =?us-ascii?Q?yJ7PP+n71ro8nXN55iIVsA3CRNqSrZQ8uu/ZIzP7oLn89Hbml8jGFnqREG39?=
 =?us-ascii?Q?SzgeSVA9FmS0czt0or1Ly/VzhaWp40aYtnbDeoBCo7gtCBgJiPjx+Wdt6ER7?=
 =?us-ascii?Q?VsB72xw1kJ44cxpGOuU0E/WzPRLEFFvAude9YzK9HhQQVMpcTNHJxM41yh5U?=
 =?us-ascii?Q?DyKDswXfGh5JGQELysiTAQGzZuU73S1rqLzwFrbIAKRqQQkxcB4CfQ1DxmE4?=
 =?us-ascii?Q?hng5vqKSWpyURQrHn8R9pbzAqop0wl4dnDHucxTP4SkF/PetEwn8z3o1N2TD?=
 =?us-ascii?Q?KPj6VPQapvQRo//TFz+B8rY6PHBqa2y/rp56hZAIz2kYUxSarO6CvP3IDsxI?=
 =?us-ascii?Q?raxy4h6y3JBHhqaZgCPJXajOnmElFSqtWRUc9ohc/7s1wAF2WgRqVrXOBS53?=
 =?us-ascii?Q?+qjFCchzYkoujYwVZVBiy4ChU/zA2cY2NLu3m5ETeHOvII/PLW0zH+dyoh0H?=
 =?us-ascii?Q?umfjytN2SheBnSJWst76RDuACQiYJ3OPw8sn?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Apr 2025 20:59:33.3090
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e6bd79dd-8b54-4925-d983-08dd7ebbeba1
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF0002529D.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7374

Use of setjmp/longjmp as removed in 2006, but the include remained.
Remove it now.

Fixes: 1bac3b49cd ("Import the current version of talloc...")
Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
---
I truncated the Fixes above.  The full line is:
Fixes: 1bac3b49cd ("Import the current version of talloc from the Samba 3 source base.  This gives us greater confidence that our talloc implementation is "known good".  Remove the OOM handling from consider_message: talloc_set_fail_handler is no longer supported.")
---
 tools/xenstored/core.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/tools/xenstored/core.c b/tools/xenstored/core.c
index 91b2530e5c..835402af81 100644
--- a/tools/xenstored/core.c
+++ b/tools/xenstored/core.c
@@ -35,7 +35,6 @@
 #include <getopt.h>
 #include <signal.h>
 #include <assert.h>
-#include <setjmp.h>
 
 #include <xenevtchn.h>
 #include <xen-tools/xenstore-common.h>
-- 
2.49.0


