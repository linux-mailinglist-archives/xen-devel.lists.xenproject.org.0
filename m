Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WKijFdO9iWn0BQUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 09 Feb 2026 11:58:27 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B9CE610E73A
	for <lists+xen-devel@lfdr.de>; Mon, 09 Feb 2026 11:58:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1225184.1531671 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vpOag-0005DK-JF; Mon, 09 Feb 2026 10:34:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1225184.1531671; Mon, 09 Feb 2026 10:34:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vpOag-0005BC-Fi; Mon, 09 Feb 2026 10:34:02 +0000
Received: by outflank-mailman (input) for mailman id 1225184;
 Mon, 09 Feb 2026 10:34:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EeIc=AN=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1vpOae-0005Ay-NB
 for xen-devel@lists.xenproject.org; Mon, 09 Feb 2026 10:34:00 +0000
Received: from BL0PR03CU003.outbound.protection.outlook.com
 (mail-eastusazlp170120007.outbound.protection.outlook.com
 [2a01:111:f403:c101::7])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d703aca0-05a2-11f1-9ccf-f158ae23cfc8;
 Mon, 09 Feb 2026 11:33:58 +0100 (CET)
Received: from MN2PR02CA0009.namprd02.prod.outlook.com (2603:10b6:208:fc::22)
 by BL4PR12MB9723.namprd12.prod.outlook.com (2603:10b6:208:4ed::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.18; Mon, 9 Feb
 2026 10:33:54 +0000
Received: from BL6PEPF0001AB50.namprd04.prod.outlook.com
 (2603:10b6:208:fc:cafe::53) by MN2PR02CA0009.outlook.office365.com
 (2603:10b6:208:fc::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9587.19 via Frontend Transport; Mon,
 9 Feb 2026 10:33:54 +0000
Received: from satlexmb08.amd.com (165.204.84.17) by
 BL6PEPF0001AB50.mail.protection.outlook.com (10.167.242.74) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9587.10 via Frontend Transport; Mon, 9 Feb 2026 10:33:54 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Mon, 9 Feb
 2026 04:33:53 -0600
Received: from xcbagarciav01.xilinx.com (10.180.168.240) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Mon, 9 Feb
 2026 02:33:52 -0800
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
X-Inumbo-ID: d703aca0-05a2-11f1-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GzqBFwq47U4T++x1zo89aphFFkmiDvot3n0khcLPfar8FJ3QUtWfELGUY5vv6e/5BSJhjKPnNUDjOPyPvOkenu+Gy3Lic0mkftrPVNOSzIOLMbRLxYlj18CLqJZnakGcznperxMTFJ5SHBiF2878gikK+rL0krGnxrq+r8lfi22g4ciJM11PWCiIm1IhYV/YMk6tgOc1+QcUaahpPK9VQfhY3z94NGMKpibD+kW3GPnqLvS/QVCU5x2Wm4O4kdun6uKKOzQeHybMucrOQNNOV7IH11+Ssb1+F0O3J61ADPZwGaaxYPgtYE/ESuaromtDxveAQKhMCuWKmKHS97sjfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RE0PHywVwvZEIDnboVhWWsI0Yb3xWcXOSTtq7qyqpak=;
 b=W0GLh3Uvt6NmWTerusLrcbF7I0kqHO8zaxfOekWBe5LnY9bHFHRU0ldBl14/wzWsdD2OG81p6ofVRMddyeR2aRiB8EaweMzjWdJk+DoDwflMYSxzicCYd7jYwRuRpH+WcvB8AhgGx0X8Nfv6vXQITl1VKii8/j8c9U7va209viX/IC1LuiVFL/8iD1cfZ6JuKs5zOgQo9AihkH/4+yNFKGBkjpKt9o69LoS9woapIwrx4xFQk/7d08lGNmu+SDNZGE4hozGaUZ+Ou6N3tKMESoOjNdI3GQXUdBXYF5QS44AxI38+L1qpWfV5HmKM1Qo96JMSRMYYpdeIHqMmvsEFlg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RE0PHywVwvZEIDnboVhWWsI0Yb3xWcXOSTtq7qyqpak=;
 b=Um3V+W7uKe+3TtgYe5ovFj6RiArBxQpXJnbR52nSAUvIQnGlU0rmzESokZfFjgG7p7dnZ9OwPKnmhuGj0PtSDKFjbva6ISGJ3zkIjcBgIZlSrbPfpPMuxd2dcXiIc7g0SS74c4SLqYnDmHCyCxTVUQvRwYemMwBsldwpwd8se4w=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
From: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Alejandro Vallejo <alejandro.garciavallejo@amd.com>, Jan Beulich
	<jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH] x86/kconfig: Reflow the SHADOW help message
Date: Mon, 9 Feb 2026 11:33:38 +0100
Message-ID: <20260209103339.6466-1-alejandro.garciavallejo@amd.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb09.amd.com
 (10.181.42.218)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB50:EE_|BL4PR12MB9723:EE_
X-MS-Office365-Filtering-Correlation-Id: 7070f4d4-833c-47ba-66ff-08de67c6b92e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?5qzD/43yL+Mm9UsS8nAkg0PwXRAb1fitUpqyFmzLrNYkhSvdt2ogwOnvyxSs?=
 =?us-ascii?Q?mRXsgnLAiMY8lCM2bdiKC0WYfAGR7ILSV+mqlzV8xGrhr+lTI+qMEXX+/R4V?=
 =?us-ascii?Q?BJa0M8f0k3QhfEbFFgkKULOrcuKDddVD6u219wOSuzQJZUvfu3THcvQDfNQE?=
 =?us-ascii?Q?dohjK4sMeVhYH6SR7eabnWxxKpoacv34fMSaEGcVITUa9+xCU2ovnPMjuz/G?=
 =?us-ascii?Q?MYEN+IwfAywXQ696VU81gu+fm4SVNCs9/sOwIELYqOq2+Ca6vXf07H/vOI8e?=
 =?us-ascii?Q?NR89uifxOylAOC4mcXeaFVSpVbiePB0bBlZKIxT+egDxfsE02G9hu2iAn9FT?=
 =?us-ascii?Q?BmRZNB4FDOIcdxNESZfR7J9e3aaXqkzrRPVO/jBrxOyt1+9W6za38NpEXWZq?=
 =?us-ascii?Q?Rwks8ZTfG0vSQVpV8VzAV9X38YC9nHyJdsT/P2EGxSqc3sfbW0pdH5U0rDxW?=
 =?us-ascii?Q?nle8pbjRb2Mtey58SECLrAgfGZnRVcMq2+WukagH8IHpcA4IfAauum8HCS3K?=
 =?us-ascii?Q?aEmhKyzXMkeVV6VUIhZU40HU2kQwaMiKoFLHwSHVAh++2CfuZeUDozkR97ZN?=
 =?us-ascii?Q?vL2uTrkE4iEKFN2XdyZhfLL5wjHsXuf98IgUv3nddcoZgO79WVV+2ds1NOb/?=
 =?us-ascii?Q?RsNoznfhLtdJ8HMp23lFUJqkkfEgDXscFfwhqx8dYF9oA7tGP4HD/0hfCZ1L?=
 =?us-ascii?Q?j7oDYDcUUHaV4ls1XB93Jd9a/ueuvzz8pxGGd8g8mgaepKmkzdiUi5LTOeGH?=
 =?us-ascii?Q?kjR/UZxoqYD5lbtA9DHqkD1O/2XV6qZXnUh1mFRqcWVFV9auoZtbZa0g0rg5?=
 =?us-ascii?Q?rFR8hZP0nPkNU+I4YBiYWXDyu17VAulQ5B6pZbFyZm4WN/LLo2861OWv5l8q?=
 =?us-ascii?Q?wIUMmJfqMm2NEyxw/hYiQAzq69aRgx9ChL3eUIrX/qeq2XDqbX1sH46ZVFwv?=
 =?us-ascii?Q?YEV+lC/qdu2hT5TYEYCf2bJOS3OXDJMIIABrdXptnC/7mOWk+1hAPGt3VsTR?=
 =?us-ascii?Q?EQivjFwVvy2F781EUNjqll42WC6STR7gzQFeAULHba/RuyyeD0TtfpMDmKRb?=
 =?us-ascii?Q?q/B5rF2bN2jpDdo4rKmyMbTBAkoNRMbJDZuw9duJ4PM/7c+xhmUig3Op1brh?=
 =?us-ascii?Q?ai8Iafp2rMpC5YXRgcd0A7AJ1sxSUaYdv/Z44hhWRYz5ZZxEM3IWNV8Gu3Q/?=
 =?us-ascii?Q?p7qINFG020Ja1pmin7uJKEykbKXjvRznkstYDVQQk1pps2fTTZ0oYlxN7d+f?=
 =?us-ascii?Q?pxwuYpeULfSv1L6jolOe2u45DoIC+xJr9UeJ5h8tZ9aTljP8jLXnOBfiw9CP?=
 =?us-ascii?Q?7At8hRIxpSIiUKVQseMmouGiuvcWWFUTkLnEueDxoceVUJ/+OT9++pSrik9z?=
 =?us-ascii?Q?fh5Tr3uP6rl+S+MoKkxGClUbs9BdwcLPUYbpLL/GOuGpuAk/2/rsJ2XgUWzP?=
 =?us-ascii?Q?KrTQ3PnJC3nQTfrTPrsRY0JH4DGTQSY2TwX5xoL6r82f4UJ7i+OlKdpIarsm?=
 =?us-ascii?Q?YYznVUyIoB/zyNe3x41/KFqPRkV3CJCxIj6qvulibPoRYhxhgNEmfsXQrFqc?=
 =?us-ascii?Q?iyBDUWH82fKtxaqQ2usXu96392yCx+PC98HkU0PiDfWyDbzGfDbVkbUib9cu?=
 =?us-ascii?Q?HTHWuW5S27v8+Bs9RKJXZlh54PvWF8SaHIJ5ZNImHHRq7kZza0LbnoQNMlTD?=
 =?us-ascii?Q?yj7Avw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	asUt+9tLTHfhVlostRj8y73/AD6V1n+6AKNHPHXPc8l3eK/HRzuwl+D8HAiHgtNeYU6xKRTfX0OosgpZU1Y5RjVZYTymC2LHXaAGt4Fvt95fKyvitjRp3lneBt1AaxJGuQt9YtSilyRm48WEApQHPbTed94jbR2uHZnC3M8wfsK5FiPBTrvv0s8nTSjZOoF+z3d15E9vvm/Hx0Slb3rhAjLEghy+FzL0VYRNDgNIa1rW9hhPbvRjIcxCsXNMoiRYauiO8sxhk5ed/0ykDb+bfvKE8qJAdCid7ZJNM/51NP/N0CNmDR6DDzxmcTXdPUQF5IqGhs1k40Q1+nLNcZr4LBXZdamCh4FZ73dlMzMUZOGGgJquWUaJlqzBLo5E4Vn59xMC9vfGGOMo3shjBvgWiTeMxunK9iv4+GVxVGgGcTZ18doBF7pGOzq998n+u3bk
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2026 10:33:54.0751
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7070f4d4-833c-47ba-66ff-08de67c6b92e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF0001AB50.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL4PR12MB9723
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
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:alejandro.garciavallejo@amd.com,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[alejandro.garciavallejo@amd.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FROM_NEQ_ENVFROM(0.00)[alejandro.garciavallejo@amd.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	HAS_XOIP(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-0.966];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[11]
X-Rspamd-Queue-Id: B9CE610E73A
X-Rspamd-Action: no action

Wasn't following the tab+2 spaces convention throughout the rest of the file.

Not a functional change.

Signed-off-by: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
---
 xen/arch/x86/Kconfig | 21 +++++++++------------
 1 file changed, 9 insertions(+), 12 deletions(-)

diff --git a/xen/arch/x86/Kconfig b/xen/arch/x86/Kconfig
index 61f58aa829..2ce4747f6e 100644
--- a/xen/arch/x86/Kconfig
+++ b/xen/arch/x86/Kconfig
@@ -148,20 +148,17 @@ config SHADOW_PAGING
 	default !PV_SHIM_EXCLUSIVE
 	depends on PV || HVM
 	help
+	  Shadow paging is a software alternative to hardware paging support
+	  (Intel EPT, AMD NPT).
 
-          Shadow paging is a software alternative to hardware paging support
-          (Intel EPT, AMD NPT).
+	  It is required for:
+	  * Running HVM guests on hardware lacking hardware paging support
+	    (First-generation Intel VT-x or AMD SVM).
+	  * Live migration of PV guests.
+	  * L1TF sidechannel mitigation for PV guests.
 
-          It is required for:
-            * Running HVM guests on hardware lacking hardware paging support
-              (First-generation Intel VT-x or AMD SVM).
-            * Live migration of PV guests.
-            * L1TF sidechannel mitigation for PV guests.
-
-          Under a small number of specific workloads, shadow paging may be
-          deliberately used as a performance optimisation.
-
-          If unsure, say Y.
+	  Under a small number of specific workloads, shadow paging may be
+	  deliberately used as a performance optimisation.
 
 config PAGING
 	def_bool HVM || SHADOW_PAGING

base-commit: 1ee8b11c1106dca6b8fe0d54c0e79146bb6545f0
-- 
2.43.0


