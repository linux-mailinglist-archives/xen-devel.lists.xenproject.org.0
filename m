Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yPDhM+rKcmlgpgAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 23 Jan 2026 02:12:10 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BA5E6EECD
	for <lists+xen-devel@lfdr.de>; Fri, 23 Jan 2026 02:12:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1211978.1523346 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vj5iQ-0000tt-92; Fri, 23 Jan 2026 01:11:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1211978.1523346; Fri, 23 Jan 2026 01:11:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vj5iQ-0000rh-6K; Fri, 23 Jan 2026 01:11:58 +0000
Received: by outflank-mailman (input) for mailman id 1211978;
 Fri, 23 Jan 2026 01:11:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Su0e=74=amd.com=stefano.stabellini@srs-se1.protection.inumbo.net>)
 id 1vj5iO-0000rb-M1
 for xen-devel@lists.xenproject.org; Fri, 23 Jan 2026 01:11:56 +0000
Received: from SJ2PR03CU001.outbound.protection.outlook.com
 (mail-westusazlp170120002.outbound.protection.outlook.com
 [2a01:111:f403:c001::2])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 80df01dc-f7f8-11f0-b15e-2bf370ae4941;
 Fri, 23 Jan 2026 02:11:55 +0100 (CET)
Received: from BN9PR03CA0553.namprd03.prod.outlook.com (2603:10b6:408:138::18)
 by LV8PR12MB9407.namprd12.prod.outlook.com (2603:10b6:408:1f9::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.11; Fri, 23 Jan
 2026 01:11:48 +0000
Received: from BN3PEPF0000B370.namprd21.prod.outlook.com
 (2603:10b6:408:138:cafe::5) by BN9PR03CA0553.outlook.office365.com
 (2603:10b6:408:138::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9542.10 via Frontend Transport; Fri,
 23 Jan 2026 01:11:44 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN3PEPF0000B370.mail.protection.outlook.com (10.167.243.167) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9564.0 via Frontend Transport; Fri, 23 Jan 2026 01:11:46 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.17; Thu, 22 Jan
 2026 19:06:45 -0600
Received: from satlexmb08.amd.com (10.181.42.217) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 22 Jan
 2026 19:06:45 -0600
Received: from SATLEXMB04.amd.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Thu, 22 Jan 2026 19:06:44 -0600
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
X-Inumbo-ID: 80df01dc-f7f8-11f0-b15e-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Zy06W+gITimFU1jT6KOAoMEdgEnZsi6uzA6gP1dvQ15kW6aSscNQsDffuxnIoqAz4FSOcCbotNF/oOmjw3EdH+Z7jPlKkWvIU7mABj1k+fnTpUHZ0Gw74o7hkNLIt4kOUiDhX+FMVmjrdR5WENNbEEYjR6FWTL5J6VMhi4WPRY5PuCFQ/RsZ+Z0UvRmmAKnnB3xtO2l/9NdtVQ+MUyh83tWWk1okP1H9N8EWk/l5mxWp2ABhaXpjstrwlBmurtY3S5PIiYoc8n+PpJGMq4iX1+HBg3BW/Rz0sOGvVqWoyIVX9dVKSe8n6IFAxQa7KMnU3BtZIhDuZEfFjoiT/BFw8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wtar+qZPCoP0IKYh9UDHTAiZjxPGrGIsKWHWOtMQ6Ro=;
 b=tzijfIN6P53ToVQVhflMeyiYp5g0I/VbKA5ZQ8vOj01/GHM/xWG4O6FDx6UENWfTWqCnpNE6kC9obHsRdSro9rJLwRRCvZwdS+Yz4b4Q/WENuguqw/jd48+adLVn/0lPfXCLhWjbY+Hzux0QL0VzhyN6+mw4oQfL7lEUbjGSdvgvZGnB+5ni7DjrBhDcsJGAOu7RERBGjMjZTReDqSOzTmDwEcsv9J5gmuhXd6H2RleNoOozrsJmZZK6M0c/tuwahCR7EW7LMVjXD3IkN7WuY3Pl5VhvG4KK05tFkgvqMu3rvdCzb3i5qrSVBOAGl9bHlh9aZmKAR6i2cjjqEenVRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wtar+qZPCoP0IKYh9UDHTAiZjxPGrGIsKWHWOtMQ6Ro=;
 b=oB0Dd4Av6a+p6xhppglxkLjVXeMi4kgPWoqk7ckGS5MK9XqXjZJ9OJvu3956TD5DKPtzLOSplLwvSEvY4EZltS0FSiMbtr0YMlTn5uBpN87BjUyiZX/mD+xrI2l6o+iWjaDjWKiCHN/RGsGBmahMS8zgsAbIw8bSq175WA1xYog=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
From: Stefano Stabellini <stefano.stabellini@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <grygorii_strashko@epam.com>, <anthony.perard@vates.tech>,
	<michal.orzel@amd.com>, <julien@xen.org>, <roger.pau@citrix.com>,
	<jason.andryuk@amd.com>, <victorm.lira@amd.com>, <andrew.cooper3@citrix.com>,
	<jbeulich@suse.com>, <sstabellini@kernel.org>, Stefano Stabellini
	<stefano.stabellini@amd.com>
Subject: [PATCH v7 2/2] xen: enable dom0less guests to use console_io hypercalls
Date: Thu, 22 Jan 2026 17:06:40 -0800
Message-ID: <20260123010640.1194863-2-stefano.stabellini@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <alpine.DEB.2.22.394.2601221704110.7192@ubuntu-linux-20-04-desktop>
References: <alpine.DEB.2.22.394.2601221704110.7192@ubuntu-linux-20-04-desktop>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB03.amd.com: stefano.stabellini@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B370:EE_|LV8PR12MB9407:EE_
X-MS-Office365-Filtering-Correlation-Id: 45c5fafd-f0a0-4403-dd8e-08de5a1c6138
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?aE6fgB5PxvL+C+TubjIHQORNY2y+4mGW5gnO9BBpNeEceyGcphwNMkBs0F03?=
 =?us-ascii?Q?FP907P9sF3XAgCKYs26T0X9YmlEiXS9gj2qa6fGdhPxaiTZNkA/OrJ327kJK?=
 =?us-ascii?Q?OWkoQLeJ0mYfg+ddqNwfm3porr4TtHB/P0aZ620z4Qsd6B5TAIlNciK8GFND?=
 =?us-ascii?Q?Ku1O3drlH/Q7y3/0BL2l1HjQzwf6LRbEh28wKdzTATEmNwUqBf2S0vq1D47f?=
 =?us-ascii?Q?95oi5+UMIk7G5oNznqGQAgY7Yyoh7qr9nyNXI88Cvox/RF+OK7mVlXBmBpoJ?=
 =?us-ascii?Q?rIUeJAYX1sVTxufhoYECNsdWdn1AVeZIudJFhpckE+ihrYem+oZ+ia+8Px5U?=
 =?us-ascii?Q?25QuDWoyUVWyFqBIcR+1pYatVwCmrQAmK6MNT897HCpBJyHEdjyZj378e+fg?=
 =?us-ascii?Q?xxrJq+4vRU3sGdhSfItFHikM7O7Bb7E/nFig/HrmE3+kQteohS7Wp04+U5E8?=
 =?us-ascii?Q?NokSgqkpsSoGuRyu65lbK78lr7BV4s3pJX0ELuXONW7D8hJNGpf2b8miWMMB?=
 =?us-ascii?Q?LYk0fiC70m2VHz+pcSUWIo8Jj0eIovKqJGCtTucxJkAbuOImGOOK5JcznpLl?=
 =?us-ascii?Q?9boeIXmrbNHKwSr2o80d577Bg1TqTjoQdArNhBo7RnMvlqBtj/r1vmZuAfta?=
 =?us-ascii?Q?HNKJY6ueZmuAclmwIOc9sO4zS4Fq7m5zGbeyHgMh4ASxsOnf/h7rVvtjUmRS?=
 =?us-ascii?Q?/pr5zIXoqSULmAywb6ymsP+xSktEFozS2iXNH1zqBt7iz4bi9GHXXh5MW4of?=
 =?us-ascii?Q?UeZisw15aGaDmAMn6kRvjwpoRZ6XiDz/lusfmwfrJhxbUC5Fsc2CtzYkF+ck?=
 =?us-ascii?Q?E4yYCKuD3UlNrK2v1tNA97cyho8RoC7dMM0gKyr0NGmA5wt4oN/82evY66X/?=
 =?us-ascii?Q?/BD2qkBCrczE6wXcpXxQJIyjFU8ab0dJuczATqEI/HvSGftLwtcOcOBhrKJ7?=
 =?us-ascii?Q?37cVDcqPMUgrHyssEo0PDS8HZUahO+1eaKyh7uU1TWbwPVCiStR2d26y5aeW?=
 =?us-ascii?Q?9EamCJDQ6YlKF4AntMmQaLvjpeDCllWMOOzzjUyB/iDU82JcNIBLDb7jRpOk?=
 =?us-ascii?Q?6LFdj3f0g7MAWjBjM/1BYyD0Y652h+YcyYn06sR1Ss21Vq80BhC6nhk5K7HX?=
 =?us-ascii?Q?+kDIrbkaJp9dcOJPud4j82IH7JH1hzRdMCfbRHrVkOQiMvTvkGWAUsA5QH6W?=
 =?us-ascii?Q?4BR85Q+g3r4fsdYhM0gm8vkyLHyUng15PNuKX40GyKY/XRhFFxBs3PX/j2R+?=
 =?us-ascii?Q?feYM/7AA0D2hd+Dl52sQJK0IQ8g7qW02L2LdY1Puv4ddUiwpr7pZEj7F6Vxh?=
 =?us-ascii?Q?4DjmmWz83a6dIQyEfKyRV3bwmMN+a354gtFIYm05cX+I5amHSpqBc5XavO8P?=
 =?us-ascii?Q?s0DIdLAiETmt0wwNk11zB2yDfnQQ6EEHfBsNIAu464QZxof2gme1dxsDV0pP?=
 =?us-ascii?Q?Gke/svJ+dwqbL6jzN5u8e7n7Qf4XKXepHApMRKZt/GZUGq3lPWexNYJkGgl0?=
 =?us-ascii?Q?//IcnhJtZaznU7yu+1f0sX8m93odsA2y1LarLVen7IzQrFbkaskeS9QfawZV?=
 =?us-ascii?Q?qqI5NKLdxQ61LQ2vlurymTrmxKK+aosBwM2Ek08Hb/di0/+2ZS8bGZwJ7j2g?=
 =?us-ascii?Q?dWSaDC1sxlks063KpjbK2v8C5f9r4TRWMyAL2suRg+h2uv1Q2kb7mlHUeVM/?=
 =?us-ascii?Q?wWd6Hg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2026 01:11:46.9496
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 45c5fafd-f0a0-4403-dd8e-08de5a1c6138
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF0000B370.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9407
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.69 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:grygorii_strashko@epam.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:jason.andryuk@amd.com,m:victorm.lira@amd.com,m:andrew.cooper3@citrix.com,m:jbeulich@suse.com,m:sstabellini@kernel.org,m:stefano.stabellini@amd.com,s:lists@lfdr.de];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[stefano.stabellini@amd.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[stefano.stabellini@amd.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	RCVD_COUNT_TWELVE(0.00)[12];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-0.854];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email,amd.com:dkim,amd.com:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns]
X-Rspamd-Queue-Id: 2BA5E6EECD
X-Rspamd-Action: no action

Enable dom0less guests on ARM to use console_io hypercalls:
- set input_allow = true for dom0less domains
- update the in-code comment in console.c
- prioritize the VUART check to retain the same behavior as today

Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
---
 xen/common/device-tree/dom0less-build.c |  2 ++
 xen/drivers/char/console.c              | 17 ++++++++++-------
 2 files changed, 12 insertions(+), 7 deletions(-)

diff --git a/xen/common/device-tree/dom0less-build.c b/xen/common/device-tree/dom0less-build.c
index 840d14419d..cb7026fa7e 100644
--- a/xen/common/device-tree/dom0less-build.c
+++ b/xen/common/device-tree/dom0less-build.c
@@ -829,6 +829,8 @@ static int __init construct_domU(struct kernel_info *kinfo,
 
     rangeset_destroy(kinfo->xen_reg_assigned);
 
+    d->console->input_allowed = true;
+
     return rc;
 }
 
diff --git a/xen/drivers/char/console.c b/xen/drivers/char/console.c
index 09354db2e0..26de872b8d 100644
--- a/xen/drivers/char/console.c
+++ b/xen/drivers/char/console.c
@@ -612,10 +612,18 @@ static void __serial_rx(char c)
     if ( !d )
         return;
 
-    if ( is_hardware_domain(d) )
+#ifdef CONFIG_SBSA_VUART_CONSOLE
+    /* Prioritize vpl011 if enabled for this domain */
+    if ( d->arch.vpl011.base_addr )
+    {
+        /* Deliver input to the emulated UART. */
+        rc = vpl011_rx_char_xen(d, c);
+    }
+    else
+#endif
     {
         /*
-         * Deliver input to the hardware domain buffer, unless it is
+         * Deliver input to the focus domain buffer, unless it is
          * already full.
          */
         nrspin_lock_irq(&console_lock);
@@ -629,11 +637,6 @@ static void __serial_rx(char c)
          */
         send_global_virq(VIRQ_CONSOLE);
     }
-#ifdef CONFIG_SBSA_VUART_CONSOLE
-    else
-        /* Deliver input to the emulated UART. */
-        rc = vpl011_rx_char_xen(d, c);
-#endif
 
     if ( consoled_is_enabled() )
         /* Deliver input to the PV shim console. */
-- 
2.25.1


