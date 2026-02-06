Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oKYZCS0Uhmk1JgQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 06 Feb 2026 17:17:49 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6568D10026B
	for <lists+xen-devel@lfdr.de>; Fri, 06 Feb 2026 17:17:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1223577.1531073 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1voOWY-0003Iq-HD; Fri, 06 Feb 2026 16:17:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1223577.1531073; Fri, 06 Feb 2026 16:17:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1voOWY-0003G5-CJ; Fri, 06 Feb 2026 16:17:38 +0000
Received: by outflank-mailman (input) for mailman id 1223577;
 Fri, 06 Feb 2026 16:17:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lgBG=AK=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1voOVX-0005HV-Bz
 for xen-devel@lists.xenproject.org; Fri, 06 Feb 2026 16:16:35 +0000
Received: from CY7PR03CU001.outbound.protection.outlook.com
 (mail-westcentralusazlp170100005.outbound.protection.outlook.com
 [2a01:111:f403:c112::5])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 333d7b06-0377-11f1-b161-2bf370ae4941;
 Fri, 06 Feb 2026 17:16:34 +0100 (CET)
Received: from SA0PR11CA0027.namprd11.prod.outlook.com (2603:10b6:806:d3::32)
 by LV2PR12MB5896.namprd12.prod.outlook.com (2603:10b6:408:172::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.15; Fri, 6 Feb
 2026 16:16:21 +0000
Received: from SN1PEPF00036F41.namprd05.prod.outlook.com
 (2603:10b6:806:d3:cafe::2a) by SA0PR11CA0027.outlook.office365.com
 (2603:10b6:806:d3::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9587.15 via Frontend Transport; Fri,
 6 Feb 2026 16:15:58 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 SN1PEPF00036F41.mail.protection.outlook.com (10.167.248.25) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9587.10 via Frontend Transport; Fri, 6 Feb 2026 16:16:20 +0000
Received: from xcbagarciav01.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 6 Feb
 2026 10:16:13 -0600
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
X-Inumbo-ID: 333d7b06-0377-11f1-b161-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=P1KP7lKcZOlGtD+/mITh7dKwL7mZLQTOXUc1urosQ8X4qH7RaZt2hCfIJRiM7LzQI2e5eja8kcBr73SREC8HwFesopWUTCXIwj6CzkSVbqNecwDQlA0p/uxkW9hdgdbveikSx5GRfCjzzJzua071gX5e6L3DdrDXyAPnd949seXFOk68g4HFmxbIhEyzTN/XnOhtwtx3UHFMgUVYcA5/0v/+/aOcCb3INKD+PVhVazhsAbx53g6uUbePLvp+Q+am9AbaxxEf+4Rg6UbibQqSpejUF4eg/14NNMggNOAtPcZVg9+qjRRQRri4DVFgUor/C6zSvtfORFfoHHLvBOSNwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/jfYW07KAjXqKVaVm3zRcCd3GsPpEyUAxEWXRxtkz+8=;
 b=lg8VEJbZ7v6KrvGElhdMmYsmFDXMv34LoZr4gJVsQtSnnkcEFMHLAdAG94fwuSMmAY85cRBuKj/iwtNEDfAjmzdkNkZOzzvQEBRTD2j6dbeM+GDNcxpQ34kV2E2H44Y5ukgtpPcgLlNgBLmL67uprnour2Lvcgcaw9p2ZeoO2wTfffV2irzEwM+XmL+t8UEwQrJCcK/+oyajtL20zq2TO7m858abELRb7zhDctRDeCSvUCW0hFaEHk8hCM6B2fWU+9oUp88BrzEoblyl3JTb7NrL76obTcaHVHCe0XfecS1p8NuFa/wwknj1mVD2CqpnIVJOOk61HzpT9xllLO25wA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/jfYW07KAjXqKVaVm3zRcCd3GsPpEyUAxEWXRxtkz+8=;
 b=5Xov+7h4Wc5OPFWr3kItl6F+m75R2kXn+Z7wNKzAY6/RiNeHhSHOM9MM5WgfZQTbfjJl1VCLBLRHY+FKOkazWVcRYy1uwSu74/clDcq5VMlEwrp7p0fh8Zu0j040WELDRlosPDRf30xoPU89ouq5Aq0lDOvM+0jGdYXsT7Z1jc4=
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
Subject: [PATCH 12/12] x86: Migrate every remaining raw vendor check to cpu_vendor()
Date: Fri, 6 Feb 2026 17:15:35 +0100
Message-ID: <20260206161539.209922-14-alejandro.garciavallejo@amd.com>
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
X-MS-TrafficTypeDiagnostic: SN1PEPF00036F41:EE_|LV2PR12MB5896:EE_
X-MS-Office365-Filtering-Correlation-Id: 4509b12d-18d7-442e-2ecd-08de659b106f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|82310400026|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?LI6REjNS+bZCjLv2BJo4vgK9ca8iR1w3PBppr55QPbMhgUyOJGwTSP0i+NNE?=
 =?us-ascii?Q?VNBlrlFfIV1hqWll7B8Y3HSLDZTGu5KwjJj1dGGr34JW63jIJlDau6M/mdI6?=
 =?us-ascii?Q?zCM9raHfohFMUP8A4Ep7+QkosG85WNIgcRM+1muT600jq2Z3d3LUU3F00t6w?=
 =?us-ascii?Q?Yyig95yfyOOjkmpDEeokTpjWcqAIS3PyPRcgJTOjLyOpcFTrDCgKwP2heXBr?=
 =?us-ascii?Q?cbBqNw2rJabFYi+t87H4s68XakxmR5d0zxpW0C25nwSl027xvoS6SCrPc0gy?=
 =?us-ascii?Q?D2n7B8zf8jPoi3qxNoJ+x0lqaRGIBNHkvJ6S6NcqKOUeu2twAZxLIRoCehH3?=
 =?us-ascii?Q?LyZI+lOGFwUuQsd2eoSVlo9+BTDLBJJ9+Mp0BSZ3naOYAzj7TPg9pGjoaReL?=
 =?us-ascii?Q?/7Lb8lYFtXF9jVguRK7YD5LhCufXwMZNe8n8Cqz06q93Oh/4KqZUwddYv6IX?=
 =?us-ascii?Q?+/iyISQT9v2ZYVNcpYnqhwdu1Qxb3D9ZtswS6twG2FhAWjkRWYgVPArwS8hJ?=
 =?us-ascii?Q?rDRdOfXWevEnNvC8aaKaC9vJFbjgbHB3wDWYjUho7zDpwgU6ZTo66EwJqc79?=
 =?us-ascii?Q?+0nIksuf33z7SQyTidWLfme27uxDLIu2OausIB4j8ecGO2uW1ONpRP+Wgd2m?=
 =?us-ascii?Q?gyuirPN2ZfkmWkNLrC9NycUtqAy0ypi1PtB/PnX5ic0Qy5VDqku0CReqd2Vg?=
 =?us-ascii?Q?ni7dH2cwY4b5nJT0++9alg2Z0y3Hc/ynQU8ZjbvfcQqrR+Kg9WkCg0eFM6xJ?=
 =?us-ascii?Q?4pOScjJoJyNP789Rwydd0sL56tAcPcuHrYbyfhrmIivT5so1M7n8tUFyYrxL?=
 =?us-ascii?Q?1sVNPRlXvPWhq0Ftk0K70rrn2qQenuwVEwwbypPBM5m0RK2nu0jq1wcQ9uhB?=
 =?us-ascii?Q?SVyguPCtXLev5vMato7xhtXWIuL2ulCwvLFtX/Q8izuPzggh5rJKtZjUU8pd?=
 =?us-ascii?Q?jlPbfRrJ5GIM6DYZ1tLqWBPs+TTAB0n5HSbLGefkE+2FiCOMdHbOdIAgCnlD?=
 =?us-ascii?Q?90LTWNQSAmDCex2RG+ge4yD0XZqGy2uLKOaagN+g+S5PF73pvrhQQqkmuDXw?=
 =?us-ascii?Q?AlkiCPJK/2axZMFZ6U6XXGKihBTeNaOHpnj90RpMAsYKNruatSvtkxRZLfhe?=
 =?us-ascii?Q?fMaEw+byfwG4kPWSVXU/22NMW4mZg4byNH+P13wSsG9FAZ44HjLWEceuuEj2?=
 =?us-ascii?Q?PQAwJlwJpg4/ZvLfcc1gUXzCdZWaGSbBt+pjURqbGxF+PZNXgBu5C6FQkpvX?=
 =?us-ascii?Q?zT1f2s97vj/8dJ/QYh2vREvdAlqp1Xjp5zEpGQgmfcMdwUzDvJRpA4E/rWHo?=
 =?us-ascii?Q?LKS7iXzglSQYujRG1fjD3iXan+ta+ai+1N5cwRWZppGzoZFbVfrDnmtt1r2t?=
 =?us-ascii?Q?G5mhKyBSZjleRk+J1Af/X2s3pclo9uriB+3cgPO8xG4oHXugF3G9thNrBfMV?=
 =?us-ascii?Q?Me4Y8mapqeY4PoWPKZvqLTtqt7iW3j7GWDehPpbKU2NrwMPNDInjRcMk4RKr?=
 =?us-ascii?Q?xj46NV9T9lTlwdltoPfaRgwnnoM7ejyE9j/gqpvhCllxpP/X4fNvILtD2ml7?=
 =?us-ascii?Q?vIbygImvh3RXGocF5WZM5lBVDXJQJOi/qaBPNyOCBnl/1lDsU/lBGt5rMp+C?=
 =?us-ascii?Q?eL03tSdKoWASJwlXkAIKN6hbAhFY2EsyxE86RV9m1zO3arxPoDJjbU8qBp7s?=
 =?us-ascii?Q?wEnX2A=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	QO9Og815qQC6iZd1G5IQjwRXMAnm60V/4HGsVp5YegNHvM5G/DXtxeqVH/DrxXCNLBNPk52tJ2VG28iEMO+LjMCIXN5zupMS/zzOP6cKPZpeT+Nh8ya+zERV8bi+IvkXAEzJ5O48WqIcXIE0jgY54Ea7vaZXs6zOXihjUYyaueB3Oonfeb7uqPnzOu32outxilp1nILnyMikvSawyVLkhXZ6wqKD1Am8qLwRinQSrTxAr8c9JqgiWWOavTaC4+1bNOHClA6nh/tb/kpIy0DbpiCNssbvOSd9YGDGYU8nZ7IboPivyK2hLWiQSXT7HYh2dsqHfluGflVNf+OBZ3ZVzcd389OV7cmzhEgaSGWkMC0UusIWW46ruq7pPEOcwRKovmWTscbued8CSP5jfmWx2K4P2npKipjak2luqfIjjWgK8GbUV3DcdTrrsofxClKA
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2026 16:16:20.2901
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4509b12d-18d7-442e-2ecd-08de659b106f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF00036F41.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB5896
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
	NEURAL_HAM(-0.00)[-0.965];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 6568D10026B
X-Rspamd-Action: no action

Not a functional change.

Signed-off-by: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
---
 xen/arch/x86/apic.c                 |  2 +-
 xen/arch/x86/cpu-policy.c           |  8 ++++----
 xen/arch/x86/cpuid.c                |  5 ++---
 xen/arch/x86/dom0_build.c           |  2 +-
 xen/arch/x86/domain.c               | 12 +++++-------
 xen/arch/x86/e820.c                 |  2 +-
 xen/arch/x86/hvm/hvm.c              |  3 +--
 xen/arch/x86/hvm/ioreq.c            |  3 +--
 xen/arch/x86/hvm/vmx/vmx.c          |  8 +++-----
 xen/arch/x86/i8259.c                |  5 ++---
 xen/arch/x86/include/asm/guest_pt.h |  3 +--
 xen/arch/x86/irq.c                  |  3 +--
 xen/arch/x86/setup.c                |  7 +++----
 13 files changed, 26 insertions(+), 37 deletions(-)

diff --git a/xen/arch/x86/apic.c b/xen/arch/x86/apic.c
index fb38be7ec3..fd3ac07aeb 100644
--- a/xen/arch/x86/apic.c
+++ b/xen/arch/x86/apic.c
@@ -406,7 +406,7 @@ void __init init_bsp_APIC(void)
     value |= APIC_SPIV_APIC_ENABLED;
     
     /* This bit is reserved on P4/Xeon and should be cleared */
-    if ((boot_cpu_data.x86_vendor == X86_VENDOR_INTEL) && (boot_cpu_data.x86 == 15))
+    if ((cpu_vendor() & X86_VENDOR_INTEL) && (boot_cpu_data.x86 == 15))
         value &= ~APIC_SPIV_FOCUS_DISABLED;
     else
         value |= APIC_SPIV_FOCUS_DISABLED;
diff --git a/xen/arch/x86/cpu-policy.c b/xen/arch/x86/cpu-policy.c
index 62aff61d8c..055862b0b2 100644
--- a/xen/arch/x86/cpu-policy.c
+++ b/xen/arch/x86/cpu-policy.c
@@ -770,7 +770,7 @@ static void __init calculate_hvm_max_policy(void)
      * long mode (and init_amd() has cleared it out of host capabilities), but
      * HVM guests are able if running in protected mode.
      */
-    if ( (boot_cpu_data.vendor & (X86_VENDOR_AMD | X86_VENDOR_HYGON)) &&
+    if ( (cpu_vendor() & (X86_VENDOR_AMD | X86_VENDOR_HYGON)) &&
          raw_cpu_policy.basic.sep )
         __set_bit(X86_FEATURE_SEP, fs);
 
@@ -963,8 +963,8 @@ void recalculate_cpuid_policy(struct domain *d)
     p->basic.max_leaf   = min(p->basic.max_leaf,   max->basic.max_leaf);
     p->feat.max_subleaf = min(p->feat.max_subleaf, max->feat.max_subleaf);
     p->extd.max_leaf    = 0x80000000U | min(p->extd.max_leaf & 0xffff,
-                                            ((p->x86_vendor & (X86_VENDOR_AMD |
-                                                               X86_VENDOR_HYGON))
+                                            ((cpu_vendor() & (X86_VENDOR_AMD |
+                                                              X86_VENDOR_HYGON))
                                              ? CPUID_GUEST_NR_EXTD_AMD
                                              : CPUID_GUEST_NR_EXTD_INTEL) - 1);
 
@@ -998,7 +998,7 @@ void recalculate_cpuid_policy(struct domain *d)
     if ( is_pv_32bit_domain(d) )
     {
         __clear_bit(X86_FEATURE_LM, max_fs);
-        if ( !(boot_cpu_data.vendor & (X86_VENDOR_AMD | X86_VENDOR_HYGON)) )
+        if ( !(cpu_vendor() & (X86_VENDOR_AMD | X86_VENDOR_HYGON)) )
             __clear_bit(X86_FEATURE_SYSCALL, max_fs);
     }
 
diff --git a/xen/arch/x86/cpuid.c b/xen/arch/x86/cpuid.c
index 5decfad8cd..d64030bc09 100644
--- a/xen/arch/x86/cpuid.c
+++ b/xen/arch/x86/cpuid.c
@@ -437,8 +437,7 @@ void guest_cpuid(const struct vcpu *v, uint32_t leaf,
 
     case 0xa:
         /* TODO: Rework vPMU control in terms of toolstack choices. */
-        if ( boot_cpu_data.x86_vendor != X86_VENDOR_INTEL ||
-             !vpmu_available(v) )
+        if ( !(cpu_vendor() & X86_VENDOR_INTEL) || !vpmu_available(v) )
             *res = EMPTY_LEAF;
         else
         {
@@ -483,7 +482,7 @@ void guest_cpuid(const struct vcpu *v, uint32_t leaf,
 
     case 0x80000001U:
         /* SYSCALL is hidden outside of long mode on Intel. */
-        if ( p->x86_vendor == X86_VENDOR_INTEL &&
+        if ( (cpu_vendor() & X86_VENDOR_INTEL) &&
              is_hvm_domain(d) && !hvm_long_mode_active(v) )
             res->d &= ~cpufeat_mask(X86_FEATURE_SYSCALL);
 
diff --git a/xen/arch/x86/dom0_build.c b/xen/arch/x86/dom0_build.c
index 0b467fd4a4..4b7f1bf034 100644
--- a/xen/arch/x86/dom0_build.c
+++ b/xen/arch/x86/dom0_build.c
@@ -572,7 +572,7 @@ int __init dom0_setup_permissions(struct domain *d)
             rc |= iomem_deny_access(d, mfn, mfn);
     }
     /* HyperTransport range. */
-    if ( boot_cpu_data.x86_vendor & (X86_VENDOR_AMD | X86_VENDOR_HYGON) )
+    if ( cpu_vendor() & (X86_VENDOR_AMD | X86_VENDOR_HYGON) )
     {
         mfn = paddr_to_pfn(1UL <<
                            (boot_cpu_data.x86 < 0x17 ? 40 : paddr_bits));
diff --git a/xen/arch/x86/domain.c b/xen/arch/x86/domain.c
index 10a558e515..fd9c7f0be5 100644
--- a/xen/arch/x86/domain.c
+++ b/xen/arch/x86/domain.c
@@ -372,7 +372,7 @@ void domain_cpu_policy_changed(struct domain *d)
         {
             uint64_t mask = cpuidmask_defaults._6c;
 
-            if ( boot_cpu_data.x86_vendor == X86_VENDOR_AMD )
+            if ( cpu_vendor() & X86_VENDOR_AMD )
                 mask &= (~0ULL << 32) | p->basic.raw[6].c;
 
             d->arch.pv.cpuidmasks->_6c = mask;
@@ -387,8 +387,7 @@ void domain_cpu_policy_changed(struct domain *d)
              * wholesale from the policy, but clamp the features in 7[0].ebx
              * per usual.
              */
-            if ( boot_cpu_data.x86_vendor &
-                 (X86_VENDOR_AMD | X86_VENDOR_HYGON) )
+            if ( cpu_vendor() & (X86_VENDOR_AMD | X86_VENDOR_HYGON) )
                 mask = (((uint64_t)p->feat.max_subleaf << 32) |
                         ((uint32_t)mask & p->feat._7b0));
 
@@ -400,7 +399,7 @@ void domain_cpu_policy_changed(struct domain *d)
             uint64_t mask = cpuidmask_defaults.Da1;
             uint32_t eax = p->xstate.Da1;
 
-            if ( boot_cpu_data.x86_vendor == X86_VENDOR_INTEL )
+            if ( cpu_vendor() & X86_VENDOR_INTEL )
                 mask &= (~0ULL << 32) | eax;
 
             d->arch.pv.cpuidmasks->Da1 = mask;
@@ -424,7 +423,7 @@ void domain_cpu_policy_changed(struct domain *d)
              * If not emulating AMD or Hygon, clear the duplicated features
              * in e1d.
              */
-            if ( !(p->x86_vendor & (X86_VENDOR_AMD | X86_VENDOR_HYGON)) )
+            if ( cpu_vendor() & ~(X86_VENDOR_AMD | X86_VENDOR_HYGON) )
                 edx &= ~CPUID_COMMON_1D_FEATURES;
 
             switch( cpu_vendor() )
@@ -457,8 +456,7 @@ void domain_cpu_policy_changed(struct domain *d)
         cpu_policy_updated(v);
 
         /* If PMU version is zero then the guest doesn't have VPMU */
-        if ( boot_cpu_data.x86_vendor == X86_VENDOR_INTEL &&
-             p->basic.pmu_version == 0 )
+        if ( (cpu_vendor() & X86_VENDOR_INTEL) && p->basic.pmu_version == 0 )
             vpmu_destroy(v);
     }
 }
diff --git a/xen/arch/x86/e820.c b/xen/arch/x86/e820.c
index ca577c0bde..0bf90f2283 100644
--- a/xen/arch/x86/e820.c
+++ b/xen/arch/x86/e820.c
@@ -426,7 +426,7 @@ static uint64_t __init mtrr_top_of_ram(void)
 
     /* By default we check only Intel systems. */
     if ( e820_mtrr_clip == -1 )
-        e820_mtrr_clip = boot_cpu_data.x86_vendor == X86_VENDOR_INTEL;
+        e820_mtrr_clip = cpu_vendor() == X86_VENDOR_INTEL;
 
     if ( !e820_mtrr_clip )
         return 0;
diff --git a/xen/arch/x86/hvm/hvm.c b/xen/arch/x86/hvm/hvm.c
index 4d37a93c57..52a6cc69e5 100644
--- a/xen/arch/x86/hvm/hvm.c
+++ b/xen/arch/x86/hvm/hvm.c
@@ -2681,8 +2681,7 @@ bool hvm_vcpu_virtual_to_linear(
         }
         else if ( last_byte > reg->limit )
             goto out; /* last byte is beyond limit */
-        else if ( last_byte < offset &&
-                  v->domain->arch.cpuid->x86_vendor == X86_VENDOR_AMD )
+        else if ( (cpu_vendor() & X86_VENDOR_AMD) && last_byte < offset )
             goto out; /* access wraps */
     }
 
diff --git a/xen/arch/x86/hvm/ioreq.c b/xen/arch/x86/hvm/ioreq.c
index a5fa97e149..7a55b14f55 100644
--- a/xen/arch/x86/hvm/ioreq.c
+++ b/xen/arch/x86/hvm/ioreq.c
@@ -285,8 +285,7 @@ bool arch_ioreq_server_get_type_addr(const struct domain *d,
         *type = XEN_DMOP_IO_RANGE_PCI;
         *addr = ((uint64_t)sbdf.sbdf << 32) | reg;
         /* AMD extended configuration space access? */
-        if ( CF8_ADDR_HI(cf8) &&
-             d->arch.cpuid->x86_vendor == X86_VENDOR_AMD &&
+        if ( CF8_ADDR_HI(cf8) && (cpu_vendor() & X86_VENDOR_AMD) &&
              (x86_fam = get_cpu_family(
                  d->arch.cpuid->basic.raw_fms, NULL, NULL)) >= 0x10 &&
              x86_fam < 0x17 )
diff --git a/xen/arch/x86/hvm/vmx/vmx.c b/xen/arch/x86/hvm/vmx/vmx.c
index 82c55f49ae..5637ee15e7 100644
--- a/xen/arch/x86/hvm/vmx/vmx.c
+++ b/xen/arch/x86/hvm/vmx/vmx.c
@@ -3073,8 +3073,7 @@ static bool __init has_if_pschange_mc(void)
      * IF_PSCHANGE_MC is only known to affect Intel Family 6 processors at
      * this time.
      */
-    if ( boot_cpu_data.x86_vendor != X86_VENDOR_INTEL ||
-         boot_cpu_data.x86 != 6 )
+    if ( !(cpu_vendor() & X86_VENDOR_INTEL) || boot_cpu_data.x86 != 6 )
         return false;
 
     switch ( boot_cpu_data.x86_model )
@@ -3431,7 +3430,7 @@ static void __init lbr_tsx_fixup_check(void)
      * fixed up as well.
      */
     if ( cpu_has_hle || cpu_has_rtm ||
-         boot_cpu_data.x86_vendor != X86_VENDOR_INTEL ||
+         !(cpu_vendor() & X86_VENDOR_INTEL) ||
          boot_cpu_data.x86 != 6 )
         return;
 
@@ -3476,8 +3475,7 @@ static void __init ler_to_fixup_check(void)
      * that are not equal to bit[47].  Attempting to context switch this value
      * may cause a #GP.  Software should sign extend the MSR.
      */
-    if ( boot_cpu_data.x86_vendor != X86_VENDOR_INTEL ||
-         boot_cpu_data.x86 != 6 )
+    if ( !(cpu_vendor() & X86_VENDOR_INTEL) || boot_cpu_data.x86 != 6 )
         return;
 
     switch ( boot_cpu_data.x86_model )
diff --git a/xen/arch/x86/i8259.c b/xen/arch/x86/i8259.c
index 5c7e21a751..c19d2fe7b4 100644
--- a/xen/arch/x86/i8259.c
+++ b/xen/arch/x86/i8259.c
@@ -419,9 +419,8 @@ void __init init_IRQ(void)
          * the interrupt.
          */
         cpumask_copy(desc->arch.cpu_mask,
-                     (boot_cpu_data.x86_vendor &
-                      (X86_VENDOR_AMD | X86_VENDOR_HYGON) ? &cpumask_all
-                                                          : cpumask_of(cpu)));
+                     ((cpu_vendor() & (X86_VENDOR_AMD | X86_VENDOR_HYGON))
+                          ? &cpumask_all : cpumask_of(cpu)));
         desc->arch.vector = LEGACY_VECTOR(irq);
     }
     
diff --git a/xen/arch/x86/include/asm/guest_pt.h b/xen/arch/x86/include/asm/guest_pt.h
index 21473f9bbc..cc3e9b504c 100644
--- a/xen/arch/x86/include/asm/guest_pt.h
+++ b/xen/arch/x86/include/asm/guest_pt.h
@@ -314,8 +314,7 @@ static always_inline bool guest_l4e_rsvd_bits(const struct vcpu *v,
                                               guest_l4e_t l4e)
 {
     return l4e.l4 & (guest_rsvd_bits(v) | GUEST_L4_PAGETABLE_RSVD |
-                     ((v->domain->arch.cpuid->x86_vendor == X86_VENDOR_AMD)
-                      ? _PAGE_GLOBAL : 0));
+                     ((cpu_vendor() & X86_VENDOR_AMD) ? _PAGE_GLOBAL : 0));
 }
 #endif /* GUEST_PAGING_LEVELS >= 4 */
 #endif /* GUEST_PAGING_LEVELS >= 3 */
diff --git a/xen/arch/x86/irq.c b/xen/arch/x86/irq.c
index cc2934bfca..8e3706fb98 100644
--- a/xen/arch/x86/irq.c
+++ b/xen/arch/x86/irq.c
@@ -2011,8 +2011,7 @@ void do_IRQ(struct cpu_user_regs *regs)
                      * interrupts have been delivered to CPUs
                      * different than the BSP.
                      */
-                    (boot_cpu_data.x86_vendor & (X86_VENDOR_AMD |
-                                                 X86_VENDOR_HYGON))) &&
+                    cpu_vendor() & (X86_VENDOR_AMD | X86_VENDOR_HYGON)) &&
                    bogus_8259A_irq(vector - FIRST_LEGACY_VECTOR)) )
             {
                 printk("CPU%u: No irq handler for vector %02x (IRQ %d%s)\n",
diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
index 27c63d1d97..26b17aab8f 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -1406,8 +1406,7 @@ void asmlinkage __init noreturn __start_xen(void)
          * CPUs with this addressed enumerate CET-SSS to indicate that
          * supervisor shadow stacks are now safe to use.
          */
-        bool cpu_has_bug_shstk_fracture =
-            boot_cpu_data.x86_vendor == X86_VENDOR_INTEL &&
+        bool cpu_has_bug_shstk_fracture = (cpu_vendor() & X86_VENDOR_INTEL) &&
             !boot_cpu_has(X86_FEATURE_CET_SSS);
 
         /*
@@ -2038,10 +2037,10 @@ void asmlinkage __init noreturn __start_xen(void)
 
     /* Do not enable SMEP/SMAP in PV shim on AMD and Hygon by default */
     if ( opt_smep == -1 )
-        opt_smep = !pv_shim || !(boot_cpu_data.x86_vendor &
+        opt_smep = !pv_shim || !(cpu_vendor() &
                                  (X86_VENDOR_AMD | X86_VENDOR_HYGON));
     if ( opt_smap == -1 )
-        opt_smap = !pv_shim || !(boot_cpu_data.x86_vendor &
+        opt_smap = !pv_shim || !(cpu_vendor() &
                                  (X86_VENDOR_AMD | X86_VENDOR_HYGON));
 
     if ( !opt_smep )
-- 
2.43.0


