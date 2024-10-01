Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C0DA98C60C
	for <lists+xen-devel@lfdr.de>; Tue,  1 Oct 2024 21:31:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.808492.1220391 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1svia2-0007aZ-Qg; Tue, 01 Oct 2024 19:30:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 808492.1220391; Tue, 01 Oct 2024 19:30:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1svia2-0007Ya-N3; Tue, 01 Oct 2024 19:30:42 +0000
Received: by outflank-mailman (input) for mailman id 808492;
 Tue, 01 Oct 2024 19:30:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=eMg8=Q5=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1svia1-0007YU-1U
 for xen-devel@lists.xenproject.org; Tue, 01 Oct 2024 19:30:41 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2062e.outbound.protection.outlook.com
 [2a01:111:f403:2009::62e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a2a71416-802b-11ef-99a2-01e77a169b0f;
 Tue, 01 Oct 2024 21:30:38 +0200 (CEST)
Received: from MW4PR03CA0256.namprd03.prod.outlook.com (2603:10b6:303:b4::21)
 by IA1PR12MB8333.namprd12.prod.outlook.com (2603:10b6:208:3fe::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8005.26; Tue, 1 Oct
 2024 19:30:33 +0000
Received: from MWH0EPF000A6735.namprd04.prod.outlook.com
 (2603:10b6:303:b4:cafe::66) by MW4PR03CA0256.outlook.office365.com
 (2603:10b6:303:b4::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.16 via Frontend
 Transport; Tue, 1 Oct 2024 19:30:33 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 MWH0EPF000A6735.mail.protection.outlook.com (10.167.249.27) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8026.11 via Frontend Transport; Tue, 1 Oct 2024 19:30:33 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 1 Oct
 2024 14:30:32 -0500
Received: from [172.30.194.120] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Tue, 1 Oct 2024 14:30:31 -0500
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
X-Inumbo-ID: a2a71416-802b-11ef-99a2-01e77a169b0f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=URVL9BRF5g+3/453yv+XgVlvsr6YERJGdBcbkZehjHnzRTOnYazMsobW8O7FFVmaGeUOZ8CbaGou1W04of5pqbi8tX/46Ip3rCVCFjftcP9f1Hjpr61vk/Z2PriGcEtniK0i+iPXs9ZHJVRTHkhh2g/Zgkz81vNAqmz4/uZ0l+dbga16dJ4154ybmhinNM8B2fLqyrkQcbekLfh+S28FGzXhdc4qK4B6JcajStTFTEJObz4ibxtDDtLvrLlmzTc1VTETbNIsBGh0lQfySfGyRQOtpwpCJMQNn1Ad1rh1YjjhZ3wf29MDhAcQ+0zIDj2Rho3qFoEb383/NwdyDFWFvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DIGfvN+rRVqlOhjfJJqu1l0NsjX7EGw/d/MABEMRqs8=;
 b=y1WqywAvTZwvEUUxKxZlZJhP24k2Hg7C/ob/eAOmS0dcnZ9/NRfoHKkMT6kdXt1Id3D0qb0HE015QdlDFZMD+KC1pxL41VEbu59Sv4N0/HPchZ9fDror7QGY+Q6AmZvaMLjWqc7rQjaKsnPxoU/0Q8/I2ml8rwf3dWWnEyzqcLD+/ThC3U5s5Rwy023/hbyYZYzr0HYKfV9z8OrWA+FALaRCqrsGTbK6ndYMsPOTgQWT/gNda0+8F1lXQzrcNKR6V+FBZ5nQz/F9nNFp9udv/Xc0gV1pH5fEwoWi1NzWfkpzcZpDw4lTYXtcxtX+HfYhz9p1PbbnaqJHpZOibOuMfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DIGfvN+rRVqlOhjfJJqu1l0NsjX7EGw/d/MABEMRqs8=;
 b=0s6/Hat4UqYj6q0wOa0k95Yqie5efS6tCXB/RgGXfbuA0tAiXQlDsvBrEX43xKPtwaxTNFvoZODN0aZiJeiiQAa5jwQH+/+lMklUAsGAQGiJfMknbKLV6z+ijdza/ZqT+kLDhKDAd5d1nvL7QyGzTMep/83t4PIdrjqKCmr9+3M=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <4d3b6a4e-4731-4d37-a2c2-855408fb610a@amd.com>
Date: Tue, 1 Oct 2024 15:30:30 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 3/6] xen/arm: create dom0less virtio-pci DT node
To: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	<xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>, <julien@xen.org>, <bertrand.marquis@arm.com>,
	<michal.orzel@amd.com>, <Volodymyr_Babchuk@epam.com>,
	<dpsmith@apertussolutions.com>, <edgar.iglesias@amd.com>
References: <20240924162359.1390487-1-edgar.iglesias@gmail.com>
 <20240924162359.1390487-4-edgar.iglesias@gmail.com>
Content-Language: en-US
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
In-Reply-To: <20240924162359.1390487-4-edgar.iglesias@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB04.amd.com: stewart.hildebrand@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000A6735:EE_|IA1PR12MB8333:EE_
X-MS-Office365-Filtering-Correlation-Id: db69b658-646c-4b01-f0b0-08dce24f8490
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ZjR1SnduUGJUb3JzSnVHT21uSHdQVmZPMGV6KzBDMW5VN2JoQ1NmQ1hTMWxj?=
 =?utf-8?B?SjZkc2RvcWJRdmY1aFZlNE5mWkZkNEdWa29kYXJyNzJGVFkxOFpSKzdDN1li?=
 =?utf-8?B?TUFqUmdka1lVTiswMHhWZ3RDWktnOWZjVHl0WDN5Y2pjNzUvcUhXcVhudkxs?=
 =?utf-8?B?b25zSWd1YmpJTk1qd2RZTS82eUxlZWM0WnZ6RHl1cS91QndtbGZIYXpWWVlG?=
 =?utf-8?B?UlVQZlhsaFBsWjN0T3AvUlNtaEpOcU1mUFdyZVUxNXpKWlh6NiszTFZHaVl6?=
 =?utf-8?B?SlhKZlpaeDh3WUpaUW80akVxVEZMUSs4Y3UwZldoV2Q3L2I5OXlrRlF3RWhV?=
 =?utf-8?B?Mkd1ZEhaeVo3Yy9UV0d6QjMrTlZPSWhkcy9pOUZjYkRMNDUxYURvK1ZqYWlz?=
 =?utf-8?B?ZkhXYytEYlh6MS9jU05JWkJEdzhxMjdadDJKM1hCOXBTSXRoK1B4enpvaHhz?=
 =?utf-8?B?eGdWb0NoUkpKQ3VWcy9QZXpCRTBYTmFuSG1zWWQrYURXMVlQQWpyT0dZQWhN?=
 =?utf-8?B?VzNPNFNvYzNSaUFWcVpHcUxic0NuQ1VEcm1hdU1NM3EwSEN4ek15c3pVeUsw?=
 =?utf-8?B?Ui9vSGlac20wRTVEUWlTL0ZDbzdlV0djOW94ZjExb1JCL2xhUUMxdEp5K1lG?=
 =?utf-8?B?dHhyVk5LNEFWL2wxSlBFdFY0MkFxUjFzVzhmVnRUckh5QUtTcnVQQlFZeHYw?=
 =?utf-8?B?dmp5Y20wMG1tVDBCWm5vdDhWMmlPaGpkZ1BwUU5YM3Y4Y0xPTUVsemRHeE1m?=
 =?utf-8?B?QXNmdmZkQXIxVHpKR2loSFNpNVJMd2tyZWZsWGEzK0JOTWl4VXhpZXhIWERk?=
 =?utf-8?B?M0ZhYjNUUDB5WnJTNEhTYmt1OVBtR3ZkMk52UmxHWXplby92aDVtL0xPSnNR?=
 =?utf-8?B?UnlhRUs5MUxxNFZjNDMrSlhaUWlYbUpycWhWVm5WTlAzNWt6a0IvZU5jTW56?=
 =?utf-8?B?U05qVnVqd0JYNmtlaERIR3R1dDFWbllYbytHbDFOYnlORHR4aHE4T1pXYWFz?=
 =?utf-8?B?OUljUGFRRlJSeUh1ZTV4UlhiWTdUQ3AxZkRmd3pMSFFRbnhramlweHZuYU53?=
 =?utf-8?B?bjBFdWg4VFN0UFZpbWNxczYraUVCL1dSZmg0RU1vcTI4ZHduWGdWSU5tRjQv?=
 =?utf-8?B?aWhSN3AvVDY2a0NoT1RBZlVtYVBwNW1XVkh2aE9EaUt6Ym9KK0kzYlJZeXlY?=
 =?utf-8?B?RkJ0alB3K0hoOXdxRzlsUDk0aEgyUy9tV1hIOFJ0UWx0M1MyZUVnYkFra3Nh?=
 =?utf-8?B?dkE5NzAvYjdRWTd6RDNiVkhQZUhRbU1hKzhEMHptSHhFV1dZT2lqd2JiYTh3?=
 =?utf-8?B?VU1Dak9hcmxoWWowU1BkcVppUG1VSS9laTVqclBrOWQzcGczN2NvbDAwR3ZF?=
 =?utf-8?B?QWZ6T0Z1MmpVOGQwQ25tKzcyYUo4Z25sZFdmcXdKZkgxVFZNcFcrajRYdjU4?=
 =?utf-8?B?VEhLV1FNQ09vZjVqckRSWHhrQlNubS9rNW82RmxzRG04MGMwVGNTSEtrT3Jy?=
 =?utf-8?B?bHpra2FYMzVKSWo3bmhUUXU3c0dsK1dmbzJQZWJZdjY5eXR0TVRxUnVtcUlJ?=
 =?utf-8?B?NE4yUkJadnBtbjdlTDJhVVRXUVVTVTJ3cUhhc0xUSzIyN1JsUkdmMDcxMGJC?=
 =?utf-8?B?a1BJOXRVWndoYmdpdGZReVFUTjRldlFoOHpjdko3SlhrSEFzenh0SndBY0dV?=
 =?utf-8?B?UjkzM2kzdStRVDZ5OWRRRkpyOG13S2dLcWVVK2FkdGpoSDdYMFZWT3ZvaHdT?=
 =?utf-8?B?S2JGUGJkZVFRdllQbk9nZUo0WG12b1ZrZmR5d1l3NmVaZjFWUGNQVFNRRXo5?=
 =?utf-8?Q?lPcf+rTKVMlAHW3HLBqDC61Uwr1YarR1ywxic=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2024 19:30:33.2121
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: db69b658-646c-4b01-f0b0-08dce24f8490
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000A6735.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8333

On 9/24/24 12:23, Edgar E. Iglesias wrote:
> diff --git a/xen/arch/arm/dom0less-build.c b/xen/arch/arm/dom0less-build.c
> index 09b65e44ae..dab24fa9e2 100644
> --- a/xen/arch/arm/dom0less-build.c
> +++ b/xen/arch/arm/dom0less-build.c
> @@ -586,6 +586,189 @@ static int __init domain_handle_dtb_bootmodule(struct domain *d,
>      return res;
>  }
>  
> +static int __init make_virtio_pci_domU_node(const struct kernel_info *kinfo)
> +{
> +    void *fdt = kinfo->fdt;
> +    /* reg is sized to be used for all the needed properties below */
> +    __be32 reg[(1 + (GUEST_ROOT_ADDRESS_CELLS * 2) + GUEST_ROOT_SIZE_CELLS)
> +               * 2];
> +    __be32 irq_map[4 * 4 * 8];

Why two separate arrays on the stack? It looks like they're used for the
same purpose, so I think we may as well keep the bigger one and get rid
of the smaller.

