Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DFF69A559CA
	for <lists+xen-devel@lfdr.de>; Thu,  6 Mar 2025 23:31:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.904143.1312106 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tqJjp-0002lO-J8; Thu, 06 Mar 2025 22:30:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 904143.1312106; Thu, 06 Mar 2025 22:30:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tqJjp-0002ig-GN; Thu, 06 Mar 2025 22:30:45 +0000
Received: by outflank-mailman (input) for mailman id 904143;
 Thu, 06 Mar 2025 22:30:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0N12=VZ=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1tqJKF-0000Ss-DB
 for xen-devel@lists.xenproject.org; Thu, 06 Mar 2025 22:04:19 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2062c.outbound.protection.outlook.com
 [2a01:111:f403:2009::62c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f129742d-fad6-11ef-9ab4-95dc52dad729;
 Thu, 06 Mar 2025 23:04:15 +0100 (CET)
Received: from CH0PR03CA0210.namprd03.prod.outlook.com (2603:10b6:610:e4::35)
 by SA1PR12MB7175.namprd12.prod.outlook.com (2603:10b6:806:2b2::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.16; Thu, 6 Mar
 2025 22:04:10 +0000
Received: from CH2PEPF00000145.namprd02.prod.outlook.com
 (2603:10b6:610:e4:cafe::f3) by CH0PR03CA0210.outlook.office365.com
 (2603:10b6:610:e4::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8511.17 via Frontend Transport; Thu,
 6 Mar 2025 22:04:10 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH2PEPF00000145.mail.protection.outlook.com (10.167.244.102) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8511.15 via Frontend Transport; Thu, 6 Mar 2025 22:04:10 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 6 Mar
 2025 16:04:09 -0600
Received: from fedora.mshome.net (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Thu, 6 Mar 2025 16:04:09 -0600
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
X-Inumbo-ID: f129742d-fad6-11ef-9ab4-95dc52dad729
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=u5x9yXw8HTM+1bNPSwKrFNBXOJeelgEYriIrsWGpoB410YIWcSHcO27AKPIN7QDAzAXdBF/pmc8yx208fi9dlyJSHNe0nkqRqluiuorvE6AZBqYGS8fBfKL7uGi+WLKYvC4g5zW3XsdJY+B6TYopONsdSDr+cWu2X8vviOeSg9ro8nhrFLPyfPaH8VWai1Cuv283CBfUOc+P7nf++hOkJ3YrNdB86alYbtoZxlKvJCJof7yoQm9noZqQ97HDFGdQyBfRxrVmQslP9F6/mAbeOBusdlWFv0EIjolH5dGTUC6rkmmpyWjBe+OV8vHdds86Ian+ASTskUCjYFbVU9W8aw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dNf6RjYjhNpFroM/vFGz8qFvPyty4gsB+36I+cSZL2A=;
 b=BV5vPonF4P83xj/goz1tpox21SxcnO3oM1B353uT2X7u0MMR5Th18TBVgV254vq0B8hPKvtbjSuX9IOBPHGuh4bdA63nLNvC/e6SKrGp+lckgNEBHJKjcvNTbVsUM2wAbpSA1aKcikgbmuEP7oiQfInEMgoBL8SvWDzNIf3IpWUg/OhipBkv8IXBdg//nupPxW3wF4pV9ox0XNILOluzVhmtIRjFgKFGC8huovy7Z+bXQtz+KKmhFUe0Pt5IJGZm0NjhxuqmTufVFi4WEj9Ju8KVg7L4bPoB8EAbFIiiEJ/I1CnD1EdJ7iL3FkU0xx43yw9gqmdgIQEnJAF79horLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dNf6RjYjhNpFroM/vFGz8qFvPyty4gsB+36I+cSZL2A=;
 b=agHAkZGYGZ9DAL6OIOSsuMnme0vwNP0eCVgFbtXDeZisjjdcoeb6Fagl5FaRpl05j/hwGFuLjAaqETMXO2mjVME/tvjs5iwVoK2WUSyo71XJl7pjDP10ho3VJhige8hKiqns8OT6zVMO/C3PxBtslwaKCGVWbQ8SB4bZFc45juA=
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
Subject: [PATCH 18/23] xsm/dummy: Allow hwdom SYSCTL_readconsole/physinfo
Date: Thu, 6 Mar 2025 17:03:38 -0500
Message-ID: <20250306220343.203047-19-jason.andryuk@amd.com>
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
X-MS-TrafficTypeDiagnostic: CH2PEPF00000145:EE_|SA1PR12MB7175:EE_
X-MS-Office365-Filtering-Correlation-Id: 89114dba-dc84-4392-20a0-08dd5cfad2d3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|376014|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?L6VUTVnvL+Bbk5Doyyfc7DDku1JlBURR54u45jL7XJ5f/vpeigZ5v/7OxvU8?=
 =?us-ascii?Q?iNBmGthu30RU+HAMC4uFdNSfMNpEcc2foxzLSA4Oz1fNJkWQ0bC9yKP9a8nS?=
 =?us-ascii?Q?hk9XGAx77ZtO2EZNASUaul6mdTIkDEwsbkipnSe+ovVJ3Y95zxjnHgGTTEzc?=
 =?us-ascii?Q?CG0nRcRiSeJqx4RV25v9AINYHGQjGAB5lywQCFQaRthyVBMqEXrp3N3759OZ?=
 =?us-ascii?Q?Tl9hi/L59sQdUOHcLXkXnn7Ybmz1fRbMYsIHlmoCtVTncy7/z2gCLUYwU6bT?=
 =?us-ascii?Q?upnZu1cgQlFcLeLtUDTYAwtgx4mHsyKbrx28hvkSuLu2T99edZEzKBxqVTa/?=
 =?us-ascii?Q?k35qp6TzynvilGKO/AxZvDm6eaYzXMyK7yKgtVsFegpbzsNnWugQKaUpYWOV?=
 =?us-ascii?Q?f3EC3HAbQap+qG53ZdfnrZsy48opK54lxMa2jq8K5ZNot/gXqqI5wimS2jFk?=
 =?us-ascii?Q?O0FSbccdEuuRT/LAvtQLArBzETYDlhIJtZ8U7AMO7pjMhumjDGMOibloqmUs?=
 =?us-ascii?Q?YgUrWBhRAeG3/ZpG3xVQQEaUJAoclXEAdtb8UCGDE61+kRM2QSj/7+BHvGw5?=
 =?us-ascii?Q?YSMfMQ4q900WnpTspmWW4iCpocD7hA8U4lIv6xjDbXxZV5+FTaqpQAYGkYIz?=
 =?us-ascii?Q?9BxY1NvNOwRLWnTg+NJmS4c6FGVHLlgpft3FJFzDfDPyhsRcSgBoIhNx4HXM?=
 =?us-ascii?Q?GROe9HUL7TQ2pa8Bh6IZQl1PwlT9aGE4bo+OutkPe1YpCgkU5Gl2yjpdJX+x?=
 =?us-ascii?Q?8BmtnyTWGCbK1kMV2Pl5hS+UOV3Jj4VaLieUKNB1hv79hdI/E8tuuwonQWjx?=
 =?us-ascii?Q?lxfP2w72jJYcS7XTecMPPD9mI7Y9XffWhnau3UgPxw0zyiJvDBPrjojT/DDp?=
 =?us-ascii?Q?o2V17BkhcceBqIn5D9xufyxHcdzcFvZYMI9Vn2GxojNwOb4uJ/bUf8DhnLbV?=
 =?us-ascii?Q?S3Iv2/bv7H6+zLLT3pEiNu2EWelm12C2klImfDUYEtGgyx9fUOA+gM6HYzBY?=
 =?us-ascii?Q?75pIuULsHRnOk/7tCGUlNOW74+gh+JHsxqKDq+o/3ny78CbDAJF4edW9Dc1y?=
 =?us-ascii?Q?6wUsUQmP7QGni9yQbJu8YaYICuzT0PxhsXMu946bKd7k1YgsKSEwifGzCuLJ?=
 =?us-ascii?Q?apAGveIegtuECtz9wmey2Q2GvOGllLrj5TSjTt08ruHtQsHp19nUaipjR2K2?=
 =?us-ascii?Q?dSs1RbDyn0ncz6QvXvfg2DVGcsz/Yf9ipJUBDw+z9MXUCCbw0eAqsjpyEHhq?=
 =?us-ascii?Q?R0puZHAZvwEG70cxnFyzk2aDIbLiV8knWiOQau/lqcAAzGpi9ecGU7662AOw?=
 =?us-ascii?Q?pK0ayU0MrRSA05BYe6pMqaHf1rchMUICyAeunOmIMwybKoYrNOFS8+2aOT14?=
 =?us-ascii?Q?/YytDIwdI2fVDl13Gl7+vNGXUBDIwkJfCWb4VAnIs6u6wLBr/Lhpggh/wLun?=
 =?us-ascii?Q?5R58pe+r3byR0wsZEhdzPB5el5AT/xUR/+PLnYA60Dd+VnMRCsGFMA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2025 22:04:10.4328
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 89114dba-dc84-4392-20a0-08dd5cfad2d3
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH2PEPF00000145.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB7175

Allow the hwdom to access the console, and to access physical
information about the system.

Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
---
 xen/include/xsm/dummy.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/xen/include/xsm/dummy.h b/xen/include/xsm/dummy.h
index 294777e904..f4656bd179 100644
--- a/xen/include/xsm/dummy.h
+++ b/xen/include/xsm/dummy.h
@@ -193,6 +193,9 @@ static XSM_INLINE int cf_check xsm_sysctl(XSM_DEFAULT_ARG int cmd)
     {
     case XEN_SYSCTL_getdomaininfolist:
         return xsm_default_action(XSM_XS_PRIV, current->domain, NULL);
+    case XEN_SYSCTL_readconsole:
+    case XEN_SYSCTL_physinfo:
+        return xsm_default_action(XSM_HW_PRIV, current->domain, NULL);
     default:
         return xsm_default_action(XSM_PRIV, current->domain, NULL);
     }
-- 
2.48.1


