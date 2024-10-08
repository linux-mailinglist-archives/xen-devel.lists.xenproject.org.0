Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AFD339957A9
	for <lists+xen-devel@lfdr.de>; Tue,  8 Oct 2024 21:32:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.813455.1226402 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1syFvq-0004cU-40; Tue, 08 Oct 2024 19:31:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 813455.1226402; Tue, 08 Oct 2024 19:31:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1syFvq-0004ac-1P; Tue, 08 Oct 2024 19:31:42 +0000
Received: by outflank-mailman (input) for mailman id 813455;
 Tue, 08 Oct 2024 19:31:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=A1UB=RE=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1syFvp-0004aW-2X
 for xen-devel@lists.xenproject.org; Tue, 08 Oct 2024 19:31:41 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on20601.outbound.protection.outlook.com
 [2a01:111:f403:2009::601])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id efbec36a-85ab-11ef-a0bc-8be0dac302b0;
 Tue, 08 Oct 2024 21:31:39 +0200 (CEST)
Received: from CH0PR03CA0322.namprd03.prod.outlook.com (2603:10b6:610:118::27)
 by MW6PR12MB9019.namprd12.prod.outlook.com (2603:10b6:303:23f::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.16; Tue, 8 Oct
 2024 19:31:33 +0000
Received: from DS3PEPF000099DC.namprd04.prod.outlook.com
 (2603:10b6:610:118:cafe::45) by CH0PR03CA0322.outlook.office365.com
 (2603:10b6:610:118::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.17 via Frontend
 Transport; Tue, 8 Oct 2024 19:31:33 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DS3PEPF000099DC.mail.protection.outlook.com (10.167.17.198) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8048.13 via Frontend Transport; Tue, 8 Oct 2024 19:31:32 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 8 Oct
 2024 14:31:32 -0500
Received: from [172.21.103.178] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Tue, 8 Oct 2024 14:31:31 -0500
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
X-Inumbo-ID: efbec36a-85ab-11ef-a0bc-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MI87hFllK+d23o2f+RB8Eb6fUXcXXe9m5kCuWIh/h4gUTLJmjae79Lffy+3S6hZ3MF56zwoCmi4xUS26vXcNndqlpD8ywNsXCGrcX/FsOOUNr1FXjJH7RslZF+fmQS9DLyWqc1MKTWAGRP2bgzGelols5uSo9LY9Ea+wHogB5dW5zPviVTPcZ31d1zUtTUdFFs4Hj0B3lK5XIVVaO52LyaCzkYOBtFhVK6p6LX9e47yhVUcB2iykWDL3oUpYGPeQgqJvqWG1gCjKdtOgrkuXuj+Mj2L++IobY1MuraRy2gbG/5sxl3yAmQUAeGPD8YVWzLgHbS769UPbqq8mcW0Biw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=apPzJ4F/+9MDmm63nNvLM8UTcZm7W8vUUcFUquf+DTg=;
 b=kSCnlKX40UWAVey5VY/iK+eEYaQBUxtZI2jAiACPyLyXdDhg1rRcng0KA/3/FV6ohbxFyEu7gaNzjn4dboda3TGwdWheu6ElANBd78yzpANxrbQxVkiRf6twbsm7YidQxhi5EgIBnkH6qeBgdVfKpedwYsmmCBpSGO7E3AvZBj4EgOQ5i9cXNhs5PU/wzN9cA0RQ02Y59622UOAcfNvGGvyiwLMFrOAiIFu5td8I6eWvfLQzLNVyQPkXUX7UjCoaJAjJ6PH/pYLLCx0fK4n5S15QxfBAWL5OXVqMSoW0DyPE2GVMtDWzNgm9qJf/7UxoW08T6smmd6SEjcQWmydYZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=apertussolutions.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=apPzJ4F/+9MDmm63nNvLM8UTcZm7W8vUUcFUquf+DTg=;
 b=0CGiGQd6Cce6LEXGKrduGE1uf6gEPBTQJnYo5NfpvqmZsvfk+mBpuomJVPLq2KlaRFnlkkVhGDFlRmWXmNb3tpMLWA9PPBiG8x3vhVGofmGM/BgGAEWiKPCNaF2JoIsfLCkfPqTyTj8aHfXD+PXmeBBkHBzLpdRu8DbMyLpsACA=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <b86bdb83-d4fa-4ebd-ba13-adff8dba7bdd@amd.com>
Date: Tue, 8 Oct 2024 14:30:52 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 30/44] x86/boot: convert dom0_construct_pv initrd param
 to struct boot_module
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	<xen-devel@lists.xenproject.org>
CC: <christopher.w.clark@gmail.com>, <stefano.stabellini@amd.com>, Jan Beulich
	<jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <20241006214956.24339-1-dpsmith@apertussolutions.com>
 <20241006214956.24339-31-dpsmith@apertussolutions.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <20241006214956.24339-31-dpsmith@apertussolutions.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB03.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF000099DC:EE_|MW6PR12MB9019:EE_
X-MS-Office365-Filtering-Correlation-Id: 52abb66d-77e9-4e56-37dd-08dce7cfd0ef
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?NTVMTjhyd1laZXU5alVLb2pKZmdmODM5d01kSU5iais0b0hpcU9qRnQ4YUNQ?=
 =?utf-8?B?NkJub29TQk5ZWkgzTkg1N1g2RFEwSjN0cjl2UDZaaE1vb0p3b2VWWWl1czZo?=
 =?utf-8?B?Q1ZKUVpaWks5ODlqbU9rUmJZS1M2cUptVGlDdWJyZGgwOXNyOVpFTCtzb2Ns?=
 =?utf-8?B?YjZodmxHbVE4cTRlWWZRMDY2ZTFhNklmelBCZWJqQWdGenN1bUVvZWU5eUNW?=
 =?utf-8?B?SjY3am9NbEgra0hCblhqUUdKNzBJS0QvVWdnZk1kejBjL1ZOcFpJVEp5VUhF?=
 =?utf-8?B?VG5ZZy9PeC9zc2NwaVBUWDkzQ2JDeEpQZENUcm9NaEZzdTBhWHRqRDRFblgy?=
 =?utf-8?B?cVBENTRaRStDTWpqYmdzYjZHRmtKanVVTjZyN040TklHZTBsRWtIdUpzVGk0?=
 =?utf-8?B?cDZ0L2RwOVFqUkFWZVJvRnMwZ29jSHBiYkwvWFE0TmlBekRkNERidUI0TDNl?=
 =?utf-8?B?Q0lveEJoc09YZ240VFpjWVlySEEraXRnckdXSWRNeDhET1BHQlZ1QkRhdDRz?=
 =?utf-8?B?MHlTRUUyYUlqeVZDQWx2VURTbU01VEFFSDVOK2VvcUF5VmI0cUpJSy9XQlhS?=
 =?utf-8?B?SXNWb1VzK1VVVTEyR1c2ckNQRjBRVTNiOWJvMFZVNXNyRitFZVBPQlhWQzNa?=
 =?utf-8?B?K3lZVTNDR2lPbEZxelh5aFdZL25reUxDRG84VUZCdzh2dFpkNVhmMDRKbEow?=
 =?utf-8?B?NWM3bm1oM0dkWjFmZ2pKaXVVc0ZNZjc1ZkE3c2tHVzhuT01lVTh3azZWK2xt?=
 =?utf-8?B?OEU5aFo0dUxhU3gveFQrN2VONnJ4RFllUyt3SkQ2WGlnZHFqN0c2K2JPMnBt?=
 =?utf-8?B?VytuN0lhakJ4RHFhVHB0YVhjMEY4VC9tanh0cWxMQllaOU52eXlmWm8wcWlm?=
 =?utf-8?B?NHRydWRVRE1CU1ZDcklSY0lYRzBBRHVoZTZMRkgwREx2V1NNaXZSeEZFM3l1?=
 =?utf-8?B?djBjM2llRTNzQzA3aytCK2hXUTY0cUlLeFpzUVB0N21zTHpYK0J2Y1h6NXNQ?=
 =?utf-8?B?NjZPanYrdTg1SDRuNzFsV0N0MU9EdWxNRk00UnlZRk4vVG1idndLc0tzRVhK?=
 =?utf-8?B?eHgzVUg0UmlVWHhwTzNyc2xwNHlEL05Xd3hDSFNMU1lMNHEyZkd4L0w5TFFC?=
 =?utf-8?B?Rk9UM28vdHJwS091Q0lwWTVnNHFQZ0h4Q2QrY3NRcm9hK1p3NVJ2dmhJYUM1?=
 =?utf-8?B?MWlldHovOW0vbXVDbmZQc2JRSkhpZGVQeDNvZUdtWng0RmpkZEVmRWkwSUQw?=
 =?utf-8?B?NUQyQmkwT2JnV2JZdVlqdXpQci9WYmsxMmhVNlFMVVRiNzRoR2dXVzZmTzZa?=
 =?utf-8?B?bWFuTWRoYkNNRnJ2VGpvdlRzRHViSzg4NXhYQmVoR1Boa3VUZGRwQ1FuUmt3?=
 =?utf-8?B?R1JkWFEvS2hxTlZuMHBncjRFUmd0TEVPaTVmOGpGLzQwaUxUa1krSUdIYmV0?=
 =?utf-8?B?MXdESnRXT0hiWEZNZU5YT1B6SWdtaW93ZUdTSFJFcXRocHVwUHZiMmNNZEtu?=
 =?utf-8?B?a21teWJ4dVdKQVppdjErd0NZSm1TREpSOFhNalZza2F1aWN5WUhXWTdHTEMy?=
 =?utf-8?B?VmcyM3ZsZDd3eDVJZ2NFSFJwRjVvVDNycVVaMW50ZEY3cG5UVjA0MjNKVUF0?=
 =?utf-8?B?YmdUaUh1NTlLSDZERDVjSU00cnRZdWdtNDYyb2U3dkUzcjFCY1Ntc2t1V3Yv?=
 =?utf-8?B?NFpxVk4rYU90Rk5jSHJBSTFhSmpBU2pPMGxlTzFHaWVFVDRxZE55SXJ1T1R2?=
 =?utf-8?B?QjFDV09jYTArUkNlZ1A2Q1Y3c0tJR0JoTFdmYzkrTjNKbC8rcDY1TmZ2Rkhy?=
 =?utf-8?B?bm91c0xFeHJFUC9TUEd0eE1DVXltczVaUUVqbTdnV2xjMlB1V00xKzRMVklJ?=
 =?utf-8?Q?aZRO96nEddgFh?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2024 19:31:32.7633
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 52abb66d-77e9-4e56-37dd-08dce7cfd0ef
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS3PEPF000099DC.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR12MB9019

On 2024-10-06 17:49, Daniel P. Smith wrote:
> This changes the type for the initrd parameter of dom0_construct_pv to be struct
> boot_module. This conversion requires several adjustments throughout dom0_construct_pv
> to account for the type change. Removes the usage of early_mod field for ramdisk module.
> 
> Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>

> diff --git a/xen/arch/x86/pv/dom0_build.c b/xen/arch/x86/pv/dom0_build.c
> index 7b6afe64d799..16b8c1e40998 100644
> --- a/xen/arch/x86/pv/dom0_build.c
> +++ b/xen/arch/x86/pv/dom0_build.c

> @@ -367,7 +367,8 @@ static int __init dom0_construct(struct domain *d,
>       unsigned long nr_pt_pages;
>       unsigned long alloc_spfn;
>       unsigned long alloc_epfn;
> -    unsigned long initrd_pfn = -1, initrd_mfn = 0;
> +    unsigned long initrd_pfn = -1;
> +    mfn_t  initrd_mfn = { 0 };

= _mfn(0);

With that:

Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>

>       unsigned long count;
>       struct page_info *page = NULL;
>       unsigned int flush_flags = 0;

