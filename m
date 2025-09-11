Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A0FECB524FF
	for <lists+xen-devel@lfdr.de>; Thu, 11 Sep 2025 02:33:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1118988.1464565 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uwVFS-0003y8-8u; Thu, 11 Sep 2025 00:33:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1118988.1464565; Thu, 11 Sep 2025 00:33:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uwVFS-0003vJ-6C; Thu, 11 Sep 2025 00:33:14 +0000
Received: by outflank-mailman (input) for mailman id 1118988;
 Thu, 11 Sep 2025 00:33:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YcHV=3W=amd.com=VictorM.Lira@srs-se1.protection.inumbo.net>)
 id 1uwVFQ-0003vB-HH
 for xen-devel@lists.xenproject.org; Thu, 11 Sep 2025 00:33:12 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20625.outbound.protection.outlook.com
 [2a01:111:f403:2414::625])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e42f952a-8ea6-11f0-9d13-b5c5bf9af7f9;
 Thu, 11 Sep 2025 02:33:10 +0200 (CEST)
Received: from BYAPR21CA0029.namprd21.prod.outlook.com (2603:10b6:a03:114::39)
 by DS0PR12MB9348.namprd12.prod.outlook.com (2603:10b6:8:1a0::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Thu, 11 Sep
 2025 00:33:04 +0000
Received: from SJ1PEPF0000231A.namprd03.prod.outlook.com
 (2603:10b6:a03:114:cafe::85) by BYAPR21CA0029.outlook.office365.com
 (2603:10b6:a03:114::39) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9137.6 via Frontend Transport; Thu,
 11 Sep 2025 00:32:58 +0000
Received: from satlexmb08.amd.com (165.204.84.17) by
 SJ1PEPF0000231A.mail.protection.outlook.com (10.167.242.231) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9115.13 via Frontend Transport; Thu, 11 Sep 2025 00:33:03 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.17; Wed, 10 Sep
 2025 17:33:02 -0700
Received: from satlexmb07.amd.com (10.181.42.216) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 10 Sep
 2025 19:33:02 -0500
Received: from [10.17.28.33] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17 via Frontend
 Transport; Wed, 10 Sep 2025 17:33:02 -0700
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
X-Inumbo-ID: e42f952a-8ea6-11f0-9d13-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qaFwrGm744H4dNCqvZj5zokUiDPw65eUyPRTWxTRmWDfN1D2IfuSBdgj+fDImotU72fIT761JzroBa9zpK681ib7Cmimd06h/PeYckUWX96dhIXEID8RJyLiJs4NN4LMF9nvcIqdkcLUd9E0i9A8uhayft9wGrusn2ADRz7ZvXHtHOeowJJRCFksuW9W6oongkDJ68enGKfFYaZdkaIMLSDhmOPNRkcsgyDy3TOpkddBGw7EsSlTjq/x4LV6SeztD2lpdI4TN/jgX9FBrjcnU92tPSI1MntCeONrHvwTaYoyDDYkIz/TA+RDMLNt6t34gWXf/XxgqWtRcpsP8tjVIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GDWJSEcTVjc0wJZaqkRixzXwBrasAZEKCM01Inh6H/s=;
 b=fRpo6UcGNQxfZYxZQ0Zt/OwzW8amoDJikVqUIjVkw8fB6zZuTCISMTA6fYi8Ktbkst6TOUFTmQoP5EVW4u/eHs+We8F7VO47LQDYLYDEGRfvQ5nspLlwBvLlUJIYWk3PdpRrYCqIFerK7MtvlSywaI5LJH6yrGPCrJrtcJ1CbRjKGU2+BqhzVFEloUa7/jcYIfKYNw+7EjABMMNpigiyANcI4av8zUbQ69rHnuf4b2I++pEtxaI3YAdda9AsGyjTeGF26KleTIrzh5zZ1HdS7Fk/ou6x04ISJhI2azGuttEK6hwX4wkJBI6u+6VMswYkypfrm04H5fvjIHMY+fIVFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=citrix.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GDWJSEcTVjc0wJZaqkRixzXwBrasAZEKCM01Inh6H/s=;
 b=Dk/zU9C64HnNl1m8x6c9/nQgb7asVKbZyHmQF8oPjwc82gZJRhFMUlSBPXmvQfPVcl7YxBTBnc/x47A5KMMhFmmi50yfqOmYrsS9fxamxo9QWLmM5vT1D70EFN3WB5tG4OyxZH34tuFmg3dn9hT1KBwTx6EGWzmjBh+dFtqkHv0=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Message-ID: <2df767a3-8a37-4cb2-82c7-2b1c9861cc69@amd.com>
Date: Wed, 10 Sep 2025 17:33:01 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] coverage: add missing include for macro
To: Andrew Cooper <andrew.cooper3@citrix.com>,
	<xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@vates.tech>, Michal Orzel
	<michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, Julien Grall
	<julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>
References: <ae1c963aa985694967ca7ba87929b2a66dcfd8bd.1757545904.git.victorm.lira@amd.com>
 <93b71cf5-5f58-4170-8e4e-0dee2ec21484@citrix.com>
Content-Language: en-US
From: "Lira, Victor M" <victorm.lira@amd.com>
In-Reply-To: <93b71cf5-5f58-4170-8e4e-0dee2ec21484@citrix.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB05.amd.com: victorm.lira@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF0000231A:EE_|DS0PR12MB9348:EE_
X-MS-Office365-Filtering-Correlation-Id: cd14128b-0d9f-4ce6-2d6c-08ddf0cac532
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|82310400026|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dllQOVp4NTVPUTMzL1A3VVN4ZGZHQ3RLVjV6aFB3NHgyaERPMHVmb0RVWlB4?=
 =?utf-8?B?dkdiZGhST3Y4M3lBYlB6TDFyMHNwY0ErMGFQZUVyWFlUbUZPOHVJWElPaVVZ?=
 =?utf-8?B?dWY0MTVNWnMyTStxSUQxaWFCWUZmQ2R2MmlESXNvUUhpZzkrNGJMUGlzSmNT?=
 =?utf-8?B?R01TaUtEWTk0eGRUOThYb2l1ME5KNmRWL2N6cXQ5NmFHQlM4cDNqcFNLRWpE?=
 =?utf-8?B?dktJOWx1RWF4dXZxMVZNZ1h6MTNSamU0cW10M1hibzdhd093NE9WeTZMS3k2?=
 =?utf-8?B?SGQ5RkR0cGc1V2Nxcm4vRmIrcEtYNHJPaytVVkw4UmZhMjloMHRLZS80OUFo?=
 =?utf-8?B?OTFuNy9kRVRvaG9odW0wSkNVZFBrV3NYL2JIV2RLdVhXWHhXVW9LaEpBcEVs?=
 =?utf-8?B?dDNOK3k1WWx6bzloQm0vcE5DZmFPekdydGEySXVRUWhTRS9zd3ljVkRZWUpa?=
 =?utf-8?B?YUNjOWxEcjF6aVdRREhxU29LNCtmWVhnVExQSEI3TTJUMWRQUFF2S1lYeEIx?=
 =?utf-8?B?eVJTMVFFd09QclYxY2pHbGtWNUtBTWFWa214Vyt0dGNZdC8yR3d4SlNFSlBv?=
 =?utf-8?B?a3JVRlVHWWp0YTZaV2o4S3lYQWdBNVNoVUd0clFBbm9LTlhHMDRlaUtyT3RB?=
 =?utf-8?B?ekIwbG40R0J0NWR6WUdEWm90UkczcWlHQWRBTGNSVFdpdWJzdFdRdDNFdWhn?=
 =?utf-8?B?aFpiVTRtZHN5ZHVzekZNSDluZDBmZVhaL04rTWI1ZkNJbmRSbGlGL25rUHpk?=
 =?utf-8?B?QU9mMWx6eXAyaEpaOVcwcDE3azc0UjdodUhHZDBaT2VsUDB1M0E4Wk9xcXlN?=
 =?utf-8?B?Y0w3VEhHb1UvMHZZY2dFaGlFRGlaYm1WTDFYYU1sQU9wY05heS9aOHZvTEJW?=
 =?utf-8?B?ajhQb3dCc0VLY3dNNDBTcHVYcnlEYnM4cTRQK3IwdGxHYmpONU15Y0dUbFBF?=
 =?utf-8?B?ZHd2SVRjSWtvTHBRYVN3MFoyNlNYd0F0NW1OQlhEYUZ5VHlucHVtQ0dRVVgy?=
 =?utf-8?B?VXhxa0pKTGRSNHZlTW5ZTkhqUDVlcW5NS3FWTG5ucG5uMnpGTkJFWEJ2aVNC?=
 =?utf-8?B?UENTVDZwdU1DTnBHYW8xZlp5WDRvT243aWpsZCtKYWVNRzVBbmJHb05HUzJE?=
 =?utf-8?B?OEFGVzVqdi93RTdnUjZFb05nNmZGRzdqYnhxNmJyN0JzbEdtVW8xb1Z3NnZJ?=
 =?utf-8?B?enNxUVh6cEhZdlRHTkM1UlFQVkVUbVBKa0Erc0p5N01ENzVOM084QzRiODlB?=
 =?utf-8?B?Sk1HZkRhd0FZUlFQZ1hxTWdQWkhGdGhGdjkrYThNN01zbllqNjRrWkpDa0g4?=
 =?utf-8?B?QWx4YVI1S3ZxTmhyL1hvUnY5cmpNT1JMWWVGN1I0QkFYaVZNSDFVQ2RSc21i?=
 =?utf-8?B?M2FKMW54eVhQM2RDVjhCSkRHczFKd1ZMVlVCYVhPWnFjd0tPZEhGNC96b1hL?=
 =?utf-8?B?L2RmQU13SWkzY0IzbmRIT2lleTJVcVo3TXhNYUJ4dWZ2WFVHc2FRbFVvcXhV?=
 =?utf-8?B?ZU1tZElhbThFMC92QTc2cEtuRGVjRVk4TVFxRDBiU3ZGbktKdXRxUlJoa1M5?=
 =?utf-8?B?WTBweit5eEp4MFh5SWloeTd5Ry9mbVBGMUNmZW0yRU1nZFlpK0lmOTJha0tN?=
 =?utf-8?B?UFRhZ1Ftb1p5Qmg2WU5jMWRuLzREOHc3KzBUS0FPOHZBbmNaM2E4M25CbEdu?=
 =?utf-8?B?NmtNSHcvMGlvN1ZrTmg2OStYNkcva3B4Yng3SGlpSnJBMTdtNkJlWDRGS3lT?=
 =?utf-8?B?R1JxV1FVS2RQQzVnWXVUUmRoSzJFY1B1d1RYYTg3R2JEbjN0eEFwVWNoa0po?=
 =?utf-8?B?N3NEVml0cnVPam9DdXY1SktzVlI3ZU1UTjVhU2dLRlppSmdHQTNXYnAzN2dm?=
 =?utf-8?B?SFluU1dlWW5jRHN4bkt3OTZwQnNmUTBrbmhtS2Z3UlJvVTdNY1VXNVdvR0Mv?=
 =?utf-8?B?ZEszS2F2bERDcFptL2pxdzV0WCtuSjZjQWEzM01LN1ZNdDZPYUViUHdtKzJS?=
 =?utf-8?B?dHVUeFg3ZjNuUHNHQnpYMTFnQjRCT29VUWJMQnV2OEpaVk1JTERpd1JibzJw?=
 =?utf-8?Q?dFNqjw?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2025 00:33:03.7600
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cd14128b-0d9f-4ce6-2d6c-08ddf0cac532
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF0000231A.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB9348

On 9/10/2025 4:47 PM, Andrew Cooper wrote:
> @@ -5,6 +5,7 @@
>   #include <public/sysctl.h>
>   int sysctl_cov_op(struct xen_sysctl_coverage_op *op);
>   #else
> +#include <xen/errno.h>
>   static inline int sysctl_cov_op(void *unused)
>   {
>       return -EOPNOTSUPP;
> ... this is starting to get overly busy to read and could do with some
> extra lines around the primary #ifdef CONFIG_COVERAGE / #else / #endif.
>
> Happy to fix up on commit.
OK, its fine by me.


Victor

