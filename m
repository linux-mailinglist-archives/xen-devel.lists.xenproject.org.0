Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aM0ZM90Thmk1JgQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 06 Feb 2026 17:16:29 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 85AF810021E
	for <lists+xen-devel@lfdr.de>; Fri, 06 Feb 2026 17:16:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1223508.1530946 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1voOV7-0005KT-PL; Fri, 06 Feb 2026 16:16:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1223508.1530946; Fri, 06 Feb 2026 16:16:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1voOV7-0005I7-M8; Fri, 06 Feb 2026 16:16:09 +0000
Received: by outflank-mailman (input) for mailman id 1223508;
 Fri, 06 Feb 2026 16:16:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lgBG=AK=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1voOV6-0005HV-4G
 for xen-devel@lists.xenproject.org; Fri, 06 Feb 2026 16:16:08 +0000
Received: from CH1PR05CU001.outbound.protection.outlook.com
 (mail-northcentralusazlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c105::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 227491bc-0377-11f1-b161-2bf370ae4941;
 Fri, 06 Feb 2026 17:16:04 +0100 (CET)
Received: from SA9P221CA0018.NAMP221.PROD.OUTLOOK.COM (2603:10b6:806:25::23)
 by SA1PR12MB6971.namprd12.prod.outlook.com (2603:10b6:806:24e::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.13; Fri, 6 Feb
 2026 16:15:59 +0000
Received: from SN1PEPF00036F3D.namprd05.prod.outlook.com
 (2603:10b6:806:25:cafe::79) by SA9P221CA0018.outlook.office365.com
 (2603:10b6:806:25::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9587.15 via Frontend Transport; Fri,
 6 Feb 2026 16:15:41 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 SN1PEPF00036F3D.mail.protection.outlook.com (10.167.248.21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9587.10 via Frontend Transport; Fri, 6 Feb 2026 16:15:58 +0000
Received: from xcbagarciav01.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 6 Feb
 2026 10:15:57 -0600
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
X-Inumbo-ID: 227491bc-0377-11f1-b161-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=degnmZ/NmJiJxxx5uBAmiFH7zkk8AO2+jWtHJaRbyToKkGnUvct0d3KDz/XmSq+kb5XpCUOjOMmvilsbS09DEXcdp337XQutA7pU9WcG0Q/gIs2g9kMtrwU+JC85hu7u83amXwmN1zGw3pXefSmE4j3ASwfpr33xIzUIwygEZvGZ0tFmPM4QCD+ZN1hkyd7vMn85WNZu6Gs3o0gv7jar3bK5ZX3wLhI/Ah34ULLUa/BQRyL7xdpOzODcXgbWY4Jhrw9PBLovsZlpZvyayEuiRtLMdzDku0vyzSC4cazmA8qNiMRxxZrvwNJB2s/I4yefDHE1NFvv0pSN+yce3gURQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8U/tOhuQz4IEnvv5g6K+uE3NzPZT0JPx1VIr+jwU6TU=;
 b=PL1zkJmmtoAe/siY60mi+hMZFKXySSwUcBjnhH5lLBjN+U0jHvvC7A7QI/YBQg+aoEcSEzbbUPYRDxuGOiHiEl9w/WDvV7b7NhWOdzy3+fNBvILTx6LFd6lDT1c6yFTFGJrCHvYJnyz78cd2hqykn6i/j1ru+m9Xw09dZnnGwYnJj1BXzqFu40+AyESI2n7o+E3eVGvzY+06lNw6uTFb5iaKRqGifay2KZushy/0vrTZocHAtpdhsFMbUkXQCUay9HOKFdk+IvdRcCLV/1abLF5AcimOOETU9gEkC/kttJKB2LK6UthRrfDD6UQ/nHo2dieB6WSKNbezVbOk8yOcxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8U/tOhuQz4IEnvv5g6K+uE3NzPZT0JPx1VIr+jwU6TU=;
 b=QHBi/zh1SPcUpp211nnsFR04MTPS4CgLnmxmjlS9dYMQ7b4zgxfjXmsHDAyNydp9Peejx3VHtKj1Kr9MpTRSydp2SnuZq7PJdsvvIo+NnWJxFkoUA62z82VELMp+zCUhBV4LW2KPZIYK483wlS2+s8cbsudc0sYi1HwwsgUBfQY=
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
Subject: [PATCH 01/12] x86: Reject CPU policies with vendors other than the host's
Date: Fri, 6 Feb 2026 17:15:23 +0100
Message-ID: <20260206161539.209922-2-alejandro.garciavallejo@amd.com>
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
X-MS-TrafficTypeDiagnostic: SN1PEPF00036F3D:EE_|SA1PR12MB6971:EE_
X-MS-Office365-Filtering-Correlation-Id: f2a0cb51-ff81-4503-abbd-08de659b03b6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?gw/C7mZFMjh5CYgilZE+ZhuCPUZFU/eSGPSzyBEBe/SK/BL0pWKBNVBhsHkm?=
 =?us-ascii?Q?mC7vvFGiu/vOQ04dyQZNMFkxSyEpqzqJ2Cu0vQNDHMn7gDtDvIEnayQdHwGG?=
 =?us-ascii?Q?RMwg1eQ8+2ELvv3nK4cl2WESkpBDhAXeQu7vNlvg1mcrp20k7KwuukkBA4hb?=
 =?us-ascii?Q?YlD59Knok8HH4pHxsJc3C0deG3wRLBV18UwJ9Zq3MdawZO6p3jgvldPTP7TC?=
 =?us-ascii?Q?Ep/dAI0r8+CdVwuNzsgzAVWgOi7t864tArfUM53mgU6qV18dtzybUO9K0sau?=
 =?us-ascii?Q?C2gA2MZ/5d6L3g8PWFJ8I3CtCjJNqLnY1WYVgWWqEeXkxT0eaJAm4BWSLB35?=
 =?us-ascii?Q?1o3TtNrsAPCWbVwQ75eLj3QTXg7jstlct2mKZsegdxbMXMA3/HON9m55Ag7l?=
 =?us-ascii?Q?jTwI1rq6awQdz4hrOL6efte+JITotnT5tc2FD26Uw8/5fLut0JraoPh+oYRw?=
 =?us-ascii?Q?DZk1rmJp3E1t57uf+4ARyoRxX05sOXHaPxsz8pLcw1v1swSObvyK4LlNDCEc?=
 =?us-ascii?Q?6tPkXGsUriBsSszr4o6mVxnqbUy24jGAPMtDrMcfGZkg+YFFoZahg5XBTMX5?=
 =?us-ascii?Q?NUYbz52uwgkYm76r3Ydycj5l1Ifb/pnGiq+anwTgFS48CnScurjZRDksbAN9?=
 =?us-ascii?Q?6stx2qdcnWX8NSYuo4ZUNpR93dd+1R89aOvT3HpeZd3oYWw+enuE7Trnf4V+?=
 =?us-ascii?Q?2A5VuE59X3pt5eSihOaEHf0HmPrgmdtA05hKbSBxyuOJg6f8reHwUzT9DKyu?=
 =?us-ascii?Q?NuJIlkbgVFTMVSbrlAbYUujtszZZNLCxxq/tPtc91Xjlm3GRLVabitKHkE12?=
 =?us-ascii?Q?CF14C8muaRXbWY2SGpqMk3GEN4shimgKuNMThhamt7Ciiw1exX436G9QuwMF?=
 =?us-ascii?Q?6xuyfNEWmn8ZFtT4sdwKitur+PwRud5qIiiqNMEjv7Y5jMtg7TVlhC0XTDdw?=
 =?us-ascii?Q?0r0rFwUUJmCp6Ly9YCv5bN2ERKIpoeKS7JkiUI9Tw6GsUzEBlPAEPcUGCqa1?=
 =?us-ascii?Q?R76Im8QbWqSfOc1+LaKShr8cGXrkmCIerUUO8oefB0N28htlZL2tDxcsXxBa?=
 =?us-ascii?Q?d71XY2d1FJO/AGI3LNlrjR3JzElQQ14l4gZqdRPCaOMsp0RSmbaNnkF37t5m?=
 =?us-ascii?Q?orArhoJl35Hu9N3M1gBwYonvUrW7txOJQgMEVBox6+ueAsEy+UiiyCCR0Vlj?=
 =?us-ascii?Q?ALQPSxbpab+CMGXc0ZmXU4pvLeX8ATKXWkgvhd1D/xQyhl4NXceYs4XwDU9/?=
 =?us-ascii?Q?RTBESNejaPPEopZzWOjgcljOCL9KtILwJU/qnHK8XNCwbcY2+YgXtRlGsMGf?=
 =?us-ascii?Q?i3QELC9GSyz0frCMjc9f9KWJua8PyBc4Ll4QvMavpLJMfCxxN4P8uZb7/xkh?=
 =?us-ascii?Q?mNE7h2TDITPi4tXpfUl3otEZMCKHIg10Zj8tmqFZU09xCb+AZgXSwT4XpY1C?=
 =?us-ascii?Q?1ybTuBqRSAGOWDsTWkOJUb6taam/QH0Fu9x1ILYm2ApCNxX1EWtscC2LuHhH?=
 =?us-ascii?Q?ZiE25bSNzqdPTaN2VuFZMrkKlEaLeiutIsxPTaW0WDijWQ17zt9K1UpBh1IO?=
 =?us-ascii?Q?y2OlkHVTiIsSMS1sMGMC+omIw9n8BbL3DjADlW4JWvGdKh2Q0sS7jPRfeyNj?=
 =?us-ascii?Q?wEtgwYE/5fdZf2dW/3eTE21lPsyDdKG7t1SRqG70JT0caoHnlrDE/rBrcpA2?=
 =?us-ascii?Q?9Bzytg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	YHGuCS2RElm1v7C9ObqPcZd4u2psQH4fRNXiWumvcBtm5HqRCMr/NXsyjsLqrEBz5f6hkUTlMx9df/Nbf4yL5D+vKx+rhHejDvMqW/HyiO36mwLVMcfl/hJhGc5xTQ3Mnn7bCxaLnDNnUhH6TQHTJahEuVO7UC9dYcrhuX227XMb+2lRhZV/+U8IHz2wZ9DObJaQ0KfSf8/d6Ubm/BsZaFl/GLY3lLtpG1lcdwAZddArlWg6VpSUTQXcsxjCiEZaFoFlURY0gbFxoVlzngy9IWqQt+wTVClBT523AQu3oWRY2yqpwbk92V02xN8ceczUQQqe5olboy9BV/pwG4rFXRV2/oDGQW0Aj1ZMEGYEDtE9kTcpuFLzlevaTTocOhvTAh1SubtCNqC8Z5J1fsn0wV/FeUFQvMJR/bnBGZHXHXi6E6rXPE99Im0zWG3ZzhVE
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2026 16:15:58.9151
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f2a0cb51-ff81-4503-abbd-08de659b03b6
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF00036F3D.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB6971
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
	NEURAL_HAM(-0.00)[-0.967];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 85AF810021E
X-Rspamd-Action: no action

While in principle it's possible to have a vendor virtualising another,
this is fairly tricky in practice. Not doing so enables certain
optimisations with regards to vendor checks in later patches.

Signed-off-by: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
---
Patch 1 from the cross-vendor series. Do not merge here. It's simply for
consistency.
---
 xen/lib/x86/policy.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/xen/lib/x86/policy.c b/xen/lib/x86/policy.c
index f033d22785..079c42a29b 100644
--- a/xen/lib/x86/policy.c
+++ b/xen/lib/x86/policy.c
@@ -15,7 +15,8 @@ int x86_cpu_policies_are_compatible(const struct cpu_policy *host,
 #define FAIL_MSR(m) \
     do { e.msr = (m); goto out; } while ( 0 )
 
-    if ( guest->basic.max_leaf > host->basic.max_leaf )
+    if ( (guest->x86_vendor     != host->x86_vendor) ||
+         (guest->basic.max_leaf >  host->basic.max_leaf) )
         FAIL_CPUID(0, NA);
 
     if ( guest->feat.max_subleaf > host->feat.max_subleaf )
-- 
2.43.0


