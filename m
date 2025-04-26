Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DAD4A9D680
	for <lists+xen-devel@lfdr.de>; Sat, 26 Apr 2025 02:00:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.968873.1358319 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u8Sy9-0000CC-Q3; Sat, 26 Apr 2025 00:00:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 968873.1358319; Sat, 26 Apr 2025 00:00:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u8Sy9-00009p-NN; Sat, 26 Apr 2025 00:00:33 +0000
Received: by outflank-mailman (input) for mailman id 968873;
 Sat, 26 Apr 2025 00:00:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=P9o3=XM=amd.com=VictorM.Lira@srs-se1.protection.inumbo.net>)
 id 1u8Sy7-0008NA-A3
 for xen-devel@lists.xenproject.org; Sat, 26 Apr 2025 00:00:31 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2060d.outbound.protection.outlook.com
 [2a01:111:f403:2009::60d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7649bcd6-2231-11f0-9ffb-bf95429c2676;
 Sat, 26 Apr 2025 02:00:29 +0200 (CEST)
Received: from BY5PR13CA0010.namprd13.prod.outlook.com (2603:10b6:a03:180::23)
 by PH7PR12MB5925.namprd12.prod.outlook.com (2603:10b6:510:1d8::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.35; Sat, 26 Apr
 2025 00:00:24 +0000
Received: from SJ1PEPF000023D2.namprd02.prod.outlook.com
 (2603:10b6:a03:180:cafe::c4) by BY5PR13CA0010.outlook.office365.com
 (2603:10b6:a03:180::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.25 via Frontend Transport; Sat,
 26 Apr 2025 00:00:24 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ1PEPF000023D2.mail.protection.outlook.com (10.167.244.9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8655.12 via Frontend Transport; Sat, 26 Apr 2025 00:00:24 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 25 Apr
 2025 19:00:21 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 25 Apr
 2025 19:00:21 -0500
Received: from xsjstefanos51.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39 via Frontend
 Transport; Fri, 25 Apr 2025 19:00:20 -0500
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
X-Inumbo-ID: 7649bcd6-2231-11f0-9ffb-bf95429c2676
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=w9XVeYu1MnPTvRTG5eU/utm1UahUPXfNQ+JRvEHy/1ErDd7KqbiOSIRAFT85OORTPeLXMRsZGGDKmPEdBBjj/1xLpDHEd0Aw8Ghas6oIiyRxU78z1LHqBOwiditJ9PAsYM6RROWZf3g+jNvXdHec0Pv9iEyhjs5utuK/HYS7j+4miUEyFIMS5/bHCMBLyNF/4jTvsj9EC570gcO2o9+VfrRy4Btl6RrVx/pB9S1iPsruqbOuYryc8tPvMsPoO25wIzS91aEjG4ZPJxJ1AxdSKJcjafuf1g85KoronLeWv858oAhlBjgR4DaX/maaw766FnKgqYm0jegSx/DTfzXk2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/9EL92AkaER7xWjfF8j3JdbDSsw+UUDA18EqCAWQYEo=;
 b=ZxcsktjbOQDUARP1BBnWFfJPLhc6979tMIeUt+puq1pl4mOa7jZ+f9CXHTlBHEMPTj0TDp1l01EobLJqYOhJ7mUof2zYIZ8pPFaUWBc1vKLi9DP76bnYTM7v7OSyw5092uHxgDsmGiA+Ypv1KGWfDK2sMnrm4k8R7VZdKq9J/J1+sNmSdwAITIn0jQI1AfM9fwwsbEZOXLWbV31bh/sUxmoKP7tqfbwvYXTJjbSwATeAnF36S1YhW1ipfgCbt6N842ztoxhXcanzG976ECiJ5HfcddyXxcPbsnbAqEgKj0vo9NYBQIs6NYlxq7jYogQA4PP1YYQz7UoTnYiOJMxFgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/9EL92AkaER7xWjfF8j3JdbDSsw+UUDA18EqCAWQYEo=;
 b=dzgUtO+FB384Dk1gEhMf8NXfHr5Jwiz2J4DQ0aTkSQsiZyZ3H6Guc1Mp095rkcBwN037BWrXMH0mjjLO0ZsxAjyKQPTY00VKAPYtQ+nJcNXS2v3z4bhK9IKtxOMKaNCxChQrmXsKYxfPj1fpGHwMmOLjjeNpa0sH2PMOXZpb3ww=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: <victorm.lira@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Federico Serafini <federico.serafini@bugseng.com>, Victor Lira
	<victorm.lira@amd.com>, Andrew Cooper <andrew.cooper3@citrix.com>, "Anthony
 PERARD" <anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>, Jan
 Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Nicola Vetrini
	<nicola.vetrini@bugseng.com>, Bertrand Marquis <bertrand.marquis@arm.com>
Subject: [PATCH v1 2/2] automation/eclair: add Rule 14.3 to the monitored set
Date: Fri, 25 Apr 2025 17:00:10 -0700
Message-ID: <d5e278584038bb8410bf81d0c67ebfbc5464caba.1745625477.git.victorm.lira@amd.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <5f2e316aae4667d1fe851e68552eb881c4d5a015.1745625477.git.victorm.lira@amd.com>
References: <5f2e316aae4667d1fe851e68552eb881c4d5a015.1745625477.git.victorm.lira@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Received-SPF: None (SATLEXMB05.amd.com: victorm.lira@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000023D2:EE_|PH7PR12MB5925:EE_
X-MS-Office365-Filtering-Correlation-Id: 91d026b6-f0c6-4526-539b-08dd84555852
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|82310400026|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?eWhwYWFYNktib3IzNVA5V3hxREpzcWorQnFDS3hzdElsSVZ3alh5NUlnWVVP?=
 =?utf-8?B?d3VFb0ZxNmp3c083Q20rNExQSVI1WEhTL1pyTGxub2MrTjB4R0FZWG15SGov?=
 =?utf-8?B?bEtqaWVUUlplR2lickdiN1Q1SlZWb3BvT3hQZlNUTjc2SVExekZ4cEFkY2xL?=
 =?utf-8?B?T1U0VlovVWNPRExLSC8zWERUbWNyVHJIUDdxSU0yNFpNZ3E5THhsUUJ2cks0?=
 =?utf-8?B?V3lXc0h4V3BGTEh3S3NmK2N6Ym9mQkYrOFprYS9jYmk2cVVQVWUxVlpZMUZE?=
 =?utf-8?B?R1VYZGh2RUZsVDNrdXlONGpIcTdpanVXZE9oRWxLbytGUEJvZ3Znam9YdU80?=
 =?utf-8?B?SmdpUG1RaWY4L3gyLzNjNGlweXBOY0NXeGVBR21XN3NpMThqRmhveU83T2dN?=
 =?utf-8?B?NkZNdUNjajZXbnVNVk9vWFpVVWF6MlZuSmxYT3MwY09wQnJVVDVHeWlmRWdn?=
 =?utf-8?B?MHFlK0NKa3pLaHFFOHRGUHVBUDRPTG03SEpRblkxc1Z5SE1aKzMzc2YrSnd2?=
 =?utf-8?B?UXpKa2F5MGNiMjdnc2RML2gwUTU1R2pRbGVoa1FvZ0I1SVVsZloxVzdrWExB?=
 =?utf-8?B?VWlkMUNuVFlURXl2TlNrMmdORm9RQTF6b0tBMUJ5bTk4bXBaU3habzdGRDZO?=
 =?utf-8?B?dkVoNW9jclpQMVRPSE43K1ZmZitJQ2ZZN2tZUkUzbCtWZmhCUm12SDM4d0ps?=
 =?utf-8?B?WEdYQS9keEs1bkVEeWpQWHE0dHZwcmRaT2hNTmFTUHJuZURodDZDcXZNSmN3?=
 =?utf-8?B?d2JSODlFUVMxTmRmYlZKZGtnYzBBQWcyK2ZBd25PS2VTR0xqcXRTN01PYTB6?=
 =?utf-8?B?WkN1cGVVcEpQajVIRHZxWCtjTE04cWl2V3J0MTB2TGF6SHhrTGo5bE9mQ1Z3?=
 =?utf-8?B?ZGlwREJ5bHFrUEhPelYvNUEzbk4wdjBtZXFxMkQreUdaQ2x5enFrR3lGUGZK?=
 =?utf-8?B?djkrRS91eUNjdHRNUW1XRUt2MWRCNmZubCs3TDBSNDYvWmtEeWZOOGhXUUtI?=
 =?utf-8?B?TVJVTmhvWGVacTNuOHAzUk5hMGpKcHhrQU13bC9QK3BxMGdIMi9iV085aE1Y?=
 =?utf-8?B?UWRMQ0srWm5wYlpUeFB2RkRqbndncEZiYmxnNUs2dFlnOUFGSHNya1AxQkFl?=
 =?utf-8?B?MXdubkxyOXcydDE5aHkyRTArY3Rwb0N4cEY5c3BKaDcvcHR2eVhjemlNazF3?=
 =?utf-8?B?S2N3a0JYYnBKUW1hREVaZTBqb3JmTHZhcmlaVUxBTTRxM1RNODFLL01nTEJH?=
 =?utf-8?B?NXFGSWpaSWs0a2d1dGRyU2NJRjRNVG1RY3lvakhoQ3cyQ2FKVHZkQVMzQVBz?=
 =?utf-8?B?VnNRRHdkS0ZuUGNFMlJLTWpDeGxjOVAyaTlHNVpoUU9GYWEyS2FJdFduSCtN?=
 =?utf-8?B?ZWhzU1lXN2syYWJteTVDMTJERThjaDFhUnkzUlhzWitCci9Ebkh1QVNyVUFQ?=
 =?utf-8?B?MGl0Zk1hK1Z3dDJ1eTdhZjNOYk14TWNjUTZWWTVObDQ5dXNNNkpMc2R0V1Rt?=
 =?utf-8?B?SDByRDltbzNJTzBZY2Y5MzhaNGt0MUY1Yk1MR1BwZUlpbE5uL2dYNEp4azlO?=
 =?utf-8?B?b2YvYUU0Z2N6Ri9CUjdSR0toZjNORmV0blRsdTN0ZzRRY2lpU05BVHM4STUz?=
 =?utf-8?B?cVNtTSsrdTVvN0dWU3ZSbktlZzIvZ21jcVYxS0tEd25RcmpSL0JKUmc2dHhQ?=
 =?utf-8?B?OGpyMkZIZnBQR2lhR3QrNVJSSGRnc3pqV0lpUFBmNEQzM3V6MjBiQkFuMkpz?=
 =?utf-8?B?N2tjMUVzWU05UTc2Z2ZrU2ZzeTFCQUZxOHZiUC94WnRLZ3FUSS9lRVdLV1E3?=
 =?utf-8?B?Z3JOWDh0MzhqeWl3eWFLRGJ3eS9ieHhoNHRraHZwTTZuSG1nWFpwR0lQeURy?=
 =?utf-8?B?cEkxbXZuSHJwTXpqdFRNaTQ2dmdiUm9iNSs5cWQ0cStacFdoZEZNQjRhN2Fx?=
 =?utf-8?B?eHBXeW5Ec2xoOUxDcUE2d1laRkdrYndZTzNTci9qQzhYSWgwWVQ0cis5RUFK?=
 =?utf-8?B?d2lPc1BxcmFIL2s4MUlSMkx3VVNoZ3l4c0ZKNjNIM1E3TEg4ZXVQOUFEVXNt?=
 =?utf-8?Q?xuOFAi?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(376014)(82310400026)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Apr 2025 00:00:24.3876
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 91d026b6-f0c6-4526-539b-08dd84555852
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF000023D2.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5925

From: Federico Serafini <federico.serafini@bugseng.com>

MISRA C Rule 14.3 is already tagged as clean: add it to the
monitored set to avoid regressions.

Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
Signed-off-by: Victor Lira <victorm.lira@amd.com>
---
Cc: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Anthony PERARD <anthony.perard@vates.tech>
Cc: Michal Orzel <michal.orzel@amd.com>
Cc: Jan Beulich <jbeulich@suse.com>
Cc: Julien Grall <julien@xen.org>
Cc: Roger Pau Monné <roger.pau@citrix.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>
Cc: Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: Federico Serafini <federico.serafini@bugseng.com>
Cc: Bertrand Marquis <bertrand.marquis@arm.com>
---

 automation/eclair_analysis/ECLAIR/monitored.ecl | 1 +
 1 file changed, 1 insertion(+)

diff --git a/automation/eclair_analysis/ECLAIR/monitored.ecl b/automation/eclair_analysis/ECLAIR/monitored.ecl
index 8351996ec8..ca2f5e3c7f 100644
--- a/automation/eclair_analysis/ECLAIR/monitored.ecl
+++ b/automation/eclair_analysis/ECLAIR/monitored.ecl
@@ -53,6 +53,7 @@
 -enable=MC3A2.R13.2
 -enable=MC3A2.R13.6
 -enable=MC3A2.R14.1
+-enable=MC3A2.R14.3
 -enable=MC3A2.R14.4
 -enable=MC3A2.R16.2
 -enable=MC3A2.R16.3
--
2.47.0

