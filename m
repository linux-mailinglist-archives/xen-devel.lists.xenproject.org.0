Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B8E92A559FA
	for <lists+xen-devel@lfdr.de>; Thu,  6 Mar 2025 23:41:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.904234.1312177 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tqJu7-0008U6-A7; Thu, 06 Mar 2025 22:41:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 904234.1312177; Thu, 06 Mar 2025 22:41:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tqJu7-0008Sl-5g; Thu, 06 Mar 2025 22:41:23 +0000
Received: by outflank-mailman (input) for mailman id 904234;
 Thu, 06 Mar 2025 22:41:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0N12=VZ=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1tqJKE-0000St-3c
 for xen-devel@lists.xenproject.org; Thu, 06 Mar 2025 22:04:18 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on20606.outbound.protection.outlook.com
 [2a01:111:f403:2009::606])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f13a057d-fad6-11ef-9898-31a8f345e629;
 Thu, 06 Mar 2025 23:04:15 +0100 (CET)
Received: from CH5PR02CA0014.namprd02.prod.outlook.com (2603:10b6:610:1ed::18)
 by SA1PR12MB7246.namprd12.prod.outlook.com (2603:10b6:806:2bc::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.29; Thu, 6 Mar
 2025 22:04:11 +0000
Received: from CH2PEPF00000147.namprd02.prod.outlook.com
 (2603:10b6:610:1ed:cafe::a7) by CH5PR02CA0014.outlook.office365.com
 (2603:10b6:610:1ed::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8511.19 via Frontend Transport; Thu,
 6 Mar 2025 22:04:11 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH2PEPF00000147.mail.protection.outlook.com (10.167.244.104) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8511.15 via Frontend Transport; Thu, 6 Mar 2025 22:04:11 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 6 Mar
 2025 16:04:10 -0600
Received: from fedora.mshome.net (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Thu, 6 Mar 2025 16:04:10 -0600
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
X-Inumbo-ID: f13a057d-fad6-11ef-9898-31a8f345e629
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aIChjmyTqA6NIq4lvZH6Cg/M5b+GDs5s/V0bmizIuZp0JA2AxiBcN5++LLD2NgCr39fhb6MRbwFWaGPDegsRnp1YTu1nuwrXNxXokBOgh3jHIOjnvNcU8SgqDrbknQWvKNdz9pP3UmnlMrV6KAevR+hu4ZmmAJAvgey5GVJRPR5jIl40TxnNoXmHy78Kac7K6wwU1/9x1TkMMky/ZWN2kfj/Y4lDLj5Y80yFlmHfcIIQ2/c1+OweJ4OhSU7t1fQvOHJJcSfBmug6LNuN9BofsbyFhziVNWONlG6SvWzkp+zYw+cqXLqknWhACVrJxwVut1RaRbUi3VQ54tN0leFvMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ok8RL7TyW5vc5cM4sRmKREX6HGYDRWzAE9iCY9N4XB0=;
 b=bHTI0OfZ7oWOBtH22/JuiiiZuknQyAtjMEhxHpKkR9ASNEJZaKCo1BonkbVOI7FW4U+wRUuUD4hgcsAmY7BcnkY4MhmX8UtfogTtM3boDTANs+Bpu8z2gOz2v4Ol/dBBfic1gSHm2Lteb95TF0A616f25+a3M1jsxdWXqlnEvaULq47TPbN4eYW7MNYpsrlF8Zm47XnqmY0qAjeiTj/7xCmcgK6yAVz73nztn0WNPd4R/oaj5rZ0OKhJOAnFxEepckUhsT05m6lD0MMifT2xO9bHpw0jvuyJhdV3jkbuCpwcYt2JIaqtibgIpGcEuFYRz2v8CL3x46maKZAVivJyMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ok8RL7TyW5vc5cM4sRmKREX6HGYDRWzAE9iCY9N4XB0=;
 b=15LO/jV4EvSXoc05AUDZch9EU9d+D47Z8zEqFQ3ZwyXlQZ2NNmuwksnON56ogGkTtdmJR/a/pp5gA6DrjOscFVhtcP8Ijj0wo1DjzHKrxvaloevw/sMAg7//pHiov2uCHtWek2zKI118wdv4+AV5ZsaCSlyvruvK/yvpsskmKi4=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Jason Andryuk <jason.andryuk@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Jason Andryuk <jason.andryuk@amd.com>, "Daniel P. Smith"
	<dpsmith@apertussolutions.com>
Subject: [PATCH 19/23] xsm/dummy: Allow sysctls to both hardware and control
Date: Thu, 6 Mar 2025 17:03:39 -0500
Message-ID: <20250306220343.203047-20-jason.andryuk@amd.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250306220343.203047-1-jason.andryuk@amd.com>
References: <20250306220343.203047-1-jason.andryuk@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB04.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF00000147:EE_|SA1PR12MB7246:EE_
X-MS-Office365-Filtering-Correlation-Id: 9e301467-6413-4007-2fe8-08dd5cfad35c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|36860700013|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?wPu15T2MzxR4AV5WN3QDEw36Sjufkp8Sa7CTyOD8AZnwEpKZ1+4MAjWKlX3R?=
 =?us-ascii?Q?O9Ch2kvKgL0evN+gFUg7P7vJkzAxO/dmGlEetzqIMeERFf3cs1PofYHsBang?=
 =?us-ascii?Q?DToItTWknZbcA1PzIHyy2fDHFpLcnTQJeEpPXSI+XQvALgu0JNmTEhoTi67V?=
 =?us-ascii?Q?nB6etYUWzSiebHzRzbjaG6bin56Q99PWZghTcBlCNoIoWWtLqstAQ3i60Gl2?=
 =?us-ascii?Q?Zn8ZrIw712tec0kHJL/1QisUrE1uC07OXvCuR/HgMrnKk9V78Qnlvkg+C89y?=
 =?us-ascii?Q?DKkG/KYPi8aFtUPk79NiSXZHSMb3UkVpFIrO5z6ut67RgulUuyu6p4VPdgBL?=
 =?us-ascii?Q?trhgzlS5gTpWlyqlXcTWPtjz+o+UsiDz66Au9G8VHx7lDhCyytRZ8WrRqJO2?=
 =?us-ascii?Q?1cm29udLUYCKSFeb+lw8hbE5Q33/n/FKymjSZd3gjeFChPtxXWa9G8ir59lM?=
 =?us-ascii?Q?wwRBoQSVnTIuuT/XY1T1X8Ar4JJdNJYK8+WNK52PwmRheA/UM+iJ9dc3DtCV?=
 =?us-ascii?Q?GXG/bJZMuibhngprcvdYCPvoAmJVl7yO8AzCusgS+2FX9vv0I1n7WuB+HoPA?=
 =?us-ascii?Q?SLfmaxAcup8Jt62eFhlIg1VuWWrhpCNw47sNLYJTFNqanxkLxYfxa6iq0CID?=
 =?us-ascii?Q?IqKgwXOR8oLkEsiMKBM+YgzOOdzMepeGPSOfLmwxw8v8LIGNt5z8sMBZhoOp?=
 =?us-ascii?Q?hI7PSUu8XsdLLilk3mC+N3+ee57Adwd5zvA1OQZqb+RRDHP2eoPZtcvaFjMO?=
 =?us-ascii?Q?YPyfa/ZPtvcL5mmWCBt57AdTdJ0e95NAL1MhxqlLfiP5FjXB6ueq0ss+QyCT?=
 =?us-ascii?Q?SG+df/ZVhDPCEwk0imGYGxo6I35DGQT4tUVnp4s7TkBPE2hrVScmmU4Wvxq+?=
 =?us-ascii?Q?zCfFwJfc7XG17FR3s/88vXqkLsKBNBQJFL+SbLsx4eiulUND3odC9j6qjeyG?=
 =?us-ascii?Q?0619FaMFB+GTlr+zj7bkX7G/hmBVLGWcdtkjJEGBoyGWoD/gthgu6yQBig95?=
 =?us-ascii?Q?lxONkLx6LHAzLQUtZbzkahiZMpLtBpctV4EUq58vRFnMOma3PSMmvS3RafjK?=
 =?us-ascii?Q?N9NxBu+fPhxAV+hlA2W150eArmcA91uj8aWTU/OxbUXFPk4zCR/wyz0cFN1+?=
 =?us-ascii?Q?JLotAGMs7cf3ax3Z9okWWrrlMpbEyzSCKaHl5i66ry5yrnov1tNzMjjVmK+V?=
 =?us-ascii?Q?XLKzFleKC3zDkopXERoJOucV6n+546zuUldXM1ewggrL27FPAfm4EpXhSiVv?=
 =?us-ascii?Q?VELfZ6TqgS3WT4ZCDpSMOOWsSf9p+8n/aIhqqIIoNF2aBVOsWgvYNuO42JLT?=
 =?us-ascii?Q?eiIubLVPPDZGrg7Y4tWKVZDybUVJm4OduVP3aM8Bl2TngXe6Qv5UURm7F3JH?=
 =?us-ascii?Q?t5B/3KkztJtIoqygLgtf+eaoZ6YKuRLa9S/2f5Wiw/6sLQHo5iUv3N3hEsXD?=
 =?us-ascii?Q?ekrC9bnsODzbGls1+3nE9c3HRNUOwkz6hDS+J/CAxo3HUnvv1lVOs4GUsGkQ?=
 =?us-ascii?Q?YTu/7bbWPKARQc8=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700013)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2025 22:04:11.3310
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e301467-6413-4007-2fe8-08dd5cfad35c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH2PEPF00000147.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB7246

xl queries SYSCTL_physinfo for the physical cpus:
domU:~# xl list
libxl: error: libxl_utils.c:817:libxl_cpu_bitmap_alloc: failed to retrieve the maximum number of cpus
libxl: error: libxl_utils.c:817:libxl_cpu_bitmap_alloc: failed to retrieve the maximum number of cpus
libxl: error: libxl_utils.c:817:libxl_cpu_bitmap_alloc: failed to retrieve the maximum number of cpus
Name                    ID   Mem VCPUs        State   Time(s)
Domain-0                 0   800     1     r-----     130.0
dom0less-1               1   400     1     r-----     130.3
dom0less-2               2   800     1     r-----     130.3

Hardware and control are both privileged.  Allow them both access to
sysctls so they have insight into the running system.  This is coarse
grained permissions for the dummy policy.

Now the only sysctl denied to a control domain is readconsole.

Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
---
Could just allow physinfo to control as an alternative.  There could be
follow on sysctls needed in that case.
---
 xen/include/xsm/dummy.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/xen/include/xsm/dummy.h b/xen/include/xsm/dummy.h
index f4656bd179..ea8b2fd6ee 100644
--- a/xen/include/xsm/dummy.h
+++ b/xen/include/xsm/dummy.h
@@ -194,9 +194,10 @@ static XSM_INLINE int cf_check xsm_sysctl(XSM_DEFAULT_ARG int cmd)
     case XEN_SYSCTL_getdomaininfolist:
         return xsm_default_action(XSM_XS_PRIV, current->domain, NULL);
     case XEN_SYSCTL_readconsole:
-    case XEN_SYSCTL_physinfo:
         return xsm_default_action(XSM_HW_PRIV, current->domain, NULL);
     default:
+        if ( is_hardware_domain(current->domain) )
+            return xsm_default_action(XSM_HW_PRIV, current->domain, NULL);
         return xsm_default_action(XSM_PRIV, current->domain, NULL);
     }
 }
-- 
2.48.1


