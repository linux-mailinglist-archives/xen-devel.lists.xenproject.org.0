Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F111E94CFEA
	for <lists+xen-devel@lfdr.de>; Fri,  9 Aug 2024 14:16:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.774702.1185131 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1scOX8-0007gr-Nf; Fri, 09 Aug 2024 12:15:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 774702.1185131; Fri, 09 Aug 2024 12:15:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1scOX8-0007eU-Kk; Fri, 09 Aug 2024 12:15:50 +0000
Received: by outflank-mailman (input) for mailman id 774702;
 Fri, 09 Aug 2024 12:15:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=H3Rt=PI=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1scOX7-0007eO-Mc
 for xen-devel@lists.xenproject.org; Fri, 09 Aug 2024 12:15:49 +0000
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on20600.outbound.protection.outlook.com
 [2a01:111:f403:2405::600])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1ba7badd-5649-11ef-bc04-fd08da9f4363;
 Fri, 09 Aug 2024 14:15:48 +0200 (CEST)
Received: from SJ0PR03CA0170.namprd03.prod.outlook.com (2603:10b6:a03:338::25)
 by MW6PR12MB8865.namprd12.prod.outlook.com (2603:10b6:303:23b::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7807.26; Fri, 9 Aug
 2024 12:15:43 +0000
Received: from CO1PEPF000044EF.namprd05.prod.outlook.com
 (2603:10b6:a03:338:cafe::e8) by SJ0PR03CA0170.outlook.office365.com
 (2603:10b6:a03:338::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.30 via Frontend
 Transport; Fri, 9 Aug 2024 12:15:43 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CO1PEPF000044EF.mail.protection.outlook.com (10.167.241.69) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7849.8 via Frontend Transport; Fri, 9 Aug 2024 12:15:42 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 9 Aug
 2024 07:15:40 -0500
Received: from [10.252.147.188] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Fri, 9 Aug 2024 07:15:39 -0500
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
X-Inumbo-ID: 1ba7badd-5649-11ef-bc04-fd08da9f4363
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mM77nuaZTZ6wurRMc2LakgTL8EZI1yuTsKKVz/5LTY5id69QlMrJroIQUL/pOYWc3jjJYUQvOGN89tm8VlbYS9dcLsLu4McBfCgCSugB+f93Vv+Y5aj+drJ0SDHgC9QtVUVsIyKrNySa0sdyDXfktSwSVOUd+rjpYbexGnBpGbD1MI/uLZO658JJYWk4SGV/SBJcilSkCK/blrHCvmqh63Rr4bBdLLl9/WAWd2GB+ri1+f4o2ODrOPXW5pJFO+E+qIRU+LBupUHxF3n6ulPWWEeByJtuUVTh7Z4e9o/58UNKI/GLxIXnsdr5L3v0bPhW0knNFyhyG964cbWevPQypQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HMnzhUbJraVztlOJr23Y1yGnGFvQt5n8gb0g57KqkrI=;
 b=Jzjzl2ulJNpVn2I9U29d+fuTJ3JYyvkkBd1cXpGrVs1TuSu/g2TiBMg4UcuXMKhMaQc5jaHGlEfIF3FuKlo5DGqVB4zbSylApWtI7jpDgiWbcxPR7uNa+yz4aWPGfPDthxfnuq0c6iImly+NyLHLa7J7CseT9MWo8n+0dzj5g0P+4o1xKcQoa4j9lCE2iLa2BmJw9t7qjqRCNOXO1qCF+rc3cOsQ3S0wFxXNQEAv0AjlgzMWymD6OkmYKWnmL7UMQ95YNEKj8ib/f52CRyOLla8htCpyVvnKjmjbnYV7FTUTPrLVTqiXXH41l+EssshARsvbVf2uEaqZDUDtDYhQbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HMnzhUbJraVztlOJr23Y1yGnGFvQt5n8gb0g57KqkrI=;
 b=10jKgakr38U79ZrdiMGMiASRun7b7Btx1sCXmcG9zwooZ0UM/B4ooRScsvXgazfscxToHGo2pJXzyo674T/B+oa/qUPyXLUcbvcDlmhOtvrxJ0y+ur4xE1Off+AZ0ByyPwkKk3mkrzmm7cdmG7Z5cb9sH2NGfQ73AclwxRSuuug=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <07e9a5bc-6e51-4073-b7a6-eb7bb7635891@amd.com>
Date: Fri, 9 Aug 2024 14:15:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/4] xen: arm: Enclose access to EL2 MMU specific
 registers under CONFIG_MMU
To: Ayan Kumar Halder <ayan.kumar.halder@amd.com>, <sstabellini@kernel.org>,
	<bertrand.marquis@arm.com>, <Volodymyr_Babchuk@epam.com>, <julien@xen.org>
CC: <xen-devel@lists.xenproject.org>
References: <20240808120936.3299937-1-ayan.kumar.halder@amd.com>
 <20240808120936.3299937-5-ayan.kumar.halder@amd.com>
Content-Language: en-US
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <20240808120936.3299937-5-ayan.kumar.halder@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB03.amd.com: michal.orzel@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000044EF:EE_|MW6PR12MB8865:EE_
X-MS-Office365-Filtering-Correlation-Id: 16428139-0e67-4e60-dc01-08dcb86cfd9c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?bzRCMTZOTkhGRHJaUTdyRkllSFkyMUhBd1Q4cXN4Y0s0OTg3VTFPdnpIbm91?=
 =?utf-8?B?YXdKb09MVTFPaFZlM0lEOUdENTJ1dWdaRXpySXVZaG1tdGpvNURLbWpmKzhO?=
 =?utf-8?B?WHVnU3BLRFU0Sm80TnNqTkJyTHlnUkhSUXp1QWtSNWdoU2pkL3NPQ1FoVlNK?=
 =?utf-8?B?aHlXSWFnUTVFTWpTTGFFZ0Z5Y0hQNXFlMWxFSVFIV2RVQlZjN25BOE9hREJO?=
 =?utf-8?B?MksxVVB0Z1AzeXJyK1FJQ1UyOU9JT3JobHE5eFdxdTd3Qlg1OGpmRlZvbzBw?=
 =?utf-8?B?c21mNnZ6c1p3U2tZeHFESkNwK2JyTUVXb0EvYlNZRjJlUm15OFM5NlRuNnEx?=
 =?utf-8?B?M2RJSVdMR3NBNUc4eHRFVi9pUjZjS1ZrdXR0VDJLMGwyNHNETTdDQzh6MzBU?=
 =?utf-8?B?VVhTdGV5ajJudHRHL2YzbkdCTnFuZnJCVDZPQ1ZuWVREU2JoeXdBY3N3Q0sy?=
 =?utf-8?B?Mk8zZDhKaTJFL01rbEhSZFE0VUpsZVJqYUJPOWEreTRHNnl1S1BlbnJpdXB4?=
 =?utf-8?B?YlNodGNrMkh2dXdwWW0zY2ZDY0pvWldEbXFJM1lkSzNvUks3VWRyQ3NDak1j?=
 =?utf-8?B?L21PbWJnbUdDa2FYQld0aTdJcnMyekwwVTUzMzczRDNseFFVVHZrSVlFZEdm?=
 =?utf-8?B?OUwvSEVHZmNsSWtwWnJZMWpXZmZ5elpsTFlwdHJNMHBWakk4blpCeHltSDcx?=
 =?utf-8?B?bGlPcFhJRWVwaVFFNUFxZXhsdHNYUmwxUGN0OFpybjVMdlk0RUd0QWx0TFND?=
 =?utf-8?B?R0M1TGRYZGZRT01KS21HOC80YThYWWNiZys0WHl2dXJ6VTgxVmlscWFpcTZS?=
 =?utf-8?B?c1MrbW9LbHF4cWU3Y0dWbld0SEFUN2p5TXBQSlZCY0Q3dXZNSElMZ3YxOThu?=
 =?utf-8?B?K2pTWkVwOVRRMWJUZ25iVXB2ZGRjeCs0UDRPcUJSNkhEa2MvZW1sK2JzRVlx?=
 =?utf-8?B?T2wrM2RZQUZNYTEyM0xCUzFFbEU5MXY0dWZQcHYzR0QxVW8rcVFkRzNDWUhD?=
 =?utf-8?B?amE1Qksvc09FOWxzS0tYZDVjSElRNU85ZDZsNHpMWG1yeCtuaThVSDJuTVNN?=
 =?utf-8?B?QnhBckkvZGptL0h3RE5oNlFVZHM2YmFxSWNZV25QeWllR0FWb29XTE1IUnla?=
 =?utf-8?B?QTVJbm5QWUkrWWl5N0tMSzVmbkdLRU96ZW5hN1lQZkR6R2psVG9iL3dRUnZK?=
 =?utf-8?B?UEt6Yy9NMlNsankvYU1hNVk0M01zbHIySTJGUitGUEpobDdVUjdReVZDaEps?=
 =?utf-8?B?eVVIdlJkTXgvU01EV3E1ZVdhVzR6dXhtWm1zU0I3OVNFRFdxcW96NGJjMVVw?=
 =?utf-8?B?aStCelZHMUEyMi9FY2Z6dVJKNkJDS2VGaUMrejF0dmZ1RnhhMlY0L3VwV2J6?=
 =?utf-8?B?WEZvNHdja0RyMi81UDM0L3ZDZkVWVDU5NWd6VWdtM0NQNy9FME5NVHQ3Rjdq?=
 =?utf-8?B?UnBmT1BBNW1RMUpkVjQ4eWNQd09nZGcrZnBjSitiYlByalNQQnZLWTMyZWRa?=
 =?utf-8?B?YlpWd3E1akN3RFd5UWJYSnNjMFZsSVE0Kythdnp4eUhnL2hONGNxZW1XcGtO?=
 =?utf-8?B?Wm45RGF6bU04dGFwbTdhUkViMVhyRllYby9VT21JaE96TWQrZDdteUdQOEIr?=
 =?utf-8?B?VlFrdDBjOTNWbnViMnVwdWxwYzRobXZnOC85dTJXSmhGZTlmd2lkMG80MGg1?=
 =?utf-8?B?b09nNmp6eHprdDdmUHpvK3NlNW5obEhqakNvWFJMZXB2em1sTUYrYkRqamp2?=
 =?utf-8?B?K2JrdWkzN1VKUHE5R3BxYjFrVExETVdsUnV5eXpWa0VLdVRBSjlpM25DWVhP?=
 =?utf-8?B?VGRjeGF4RFFIdlZ4aUlhSU9VNTh0bTFKZUJLOER2czZGYzlXNWhXeFhrZ2pn?=
 =?utf-8?B?cnY0ZHJaVk5ubU16N3ZwNjdzSkJYWkkvdWJzSzZnL2FZVDZtR0k2Uzd5dVd5?=
 =?utf-8?Q?JUEzba3n3jyuAdtxeGcSjzcbithw7SNr?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Aug 2024 12:15:42.8787
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 16428139-0e67-4e60-dc01-08dcb86cfd9c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000044EF.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR12MB8865

Hi Ayan,

On 08/08/2024 14:09, Ayan Kumar Halder wrote:
> All the EL2 MMU specific registers are enclosed within CONFIG_MMU.
> 
> Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
> ---
> Changes from v1 :-
> 1. 'vttbr_el2' field is enclosed with ifdef.
> 2. No movement of code.
> 
>  xen/arch/arm/traps.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/xen/arch/arm/traps.c b/xen/arch/arm/traps.c
> index aac6c599f8..f51e1424cb 100644
> --- a/xen/arch/arm/traps.c
> +++ b/xen/arch/arm/traps.c
> @@ -720,8 +720,10 @@ struct reg_ctxt {
>      uint32_t ifsr32_el2;
>  #endif
>  
> +#ifdef CONFIG_MMU
>      /* Hypervisor-side state */
>      uint64_t vttbr_el2;
Given that you protected the field here, why did you leave assignments in show_registers()
and vcpu_show_registers() unguarded?

~Michal

