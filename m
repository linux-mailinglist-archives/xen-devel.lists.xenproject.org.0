Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AD73FCAD78C
	for <lists+xen-devel@lfdr.de>; Mon, 08 Dec 2025 15:44:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1180761.1503884 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vScSo-00018e-9S; Mon, 08 Dec 2025 14:43:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1180761.1503884; Mon, 08 Dec 2025 14:43:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vScSo-000163-6j; Mon, 08 Dec 2025 14:43:46 +0000
Received: by outflank-mailman (input) for mailman id 1180761;
 Mon, 08 Dec 2025 14:43:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TwXn=6O=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1vScSn-00015x-0P
 for xen-devel@lists.xenproject.org; Mon, 08 Dec 2025 14:43:45 +0000
Received: from CH4PR04CU002.outbound.protection.outlook.com
 (mail-northcentralusazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c105::7])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4a23f42d-d444-11f0-9cce-f158ae23cfc8;
 Mon, 08 Dec 2025 15:43:42 +0100 (CET)
Received: from BYAPR11CA0107.namprd11.prod.outlook.com (2603:10b6:a03:f4::48)
 by DS2PR12MB9751.namprd12.prod.outlook.com (2603:10b6:8:2ad::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.14; Mon, 8 Dec
 2025 14:43:38 +0000
Received: from SJ5PEPF000001D6.namprd05.prod.outlook.com
 (2603:10b6:a03:f4:cafe::42) by BYAPR11CA0107.outlook.office365.com
 (2603:10b6:a03:f4::48) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9388.14 via Frontend Transport; Mon,
 8 Dec 2025 14:43:31 +0000
Received: from satlexmb08.amd.com (165.204.84.17) by
 SJ5PEPF000001D6.mail.protection.outlook.com (10.167.242.58) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9412.4 via Frontend Transport; Mon, 8 Dec 2025 14:43:37 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Mon, 8 Dec
 2025 08:43:37 -0600
Received: from [10.71.194.215] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Mon, 8 Dec 2025 06:43:36 -0800
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
X-Inumbo-ID: 4a23f42d-d444-11f0-9cce-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PaAZQDD3QLaHhAZkvw7hunR620ZlkArPTxbdvAqEL2Z8q3T54x6O18Qx9T3xH5/XJA5u4kw6H2F48IUBJBVZC0L0BbK0Ud9cBoLxYdCMdUiXRb6NxCs0uftSGMhSX5MdN49dQR0aCj5flZ34jl6StD2ltxCegJMzHRr7Z6hleOV+2UVOPACpigcjweuhgsDMoEAc4bBS7Fn37PYB8KgXBGEsgRfpNmL6KTHjEW6wlmdPueqSsiGeNRS3MGeWrUp1S6I249ovpak6c/2rnRqwV289oiE7LiTIGrhSUBXWrWPJPYIzDP2fDU+oyOhphCqkUpIju0u+ce/2q6oUspfDCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WdUpVf7xVXw9ntmZ67/ntwdN6yyfnm2EeHfw0BXRy1o=;
 b=H6NQ16chIfTSqooK58dpjzGrbdtHok9dqOKNfKjxsXWrCgNWub//DLNNKcB8hVQuGlyXGnl6Q9Fd6nAPrEm9dufNOvRFLmkkyIE1H5PSvA0BswvetLFBBHTvYGLSbmE13RpIwyBjRUOVckkhM0fB9ZPIdcU5ogoyfNgwzdLZDxKBpbiyiuC0L0MX3+yLxZlm071ZExPa5A/hK7PLiMPZTvZCunWYzOsIMCmYjo0cWtl7DP6GooV2UmHCWJmWG+tQPjPimcMfvLjuqpltdxCBlVXm0HsXMoKJC80ACWr6HXfINDQ8LkjsD4uHun34atMmM+P+bi0e34oKndsB2vXRRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=epam.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WdUpVf7xVXw9ntmZ67/ntwdN6yyfnm2EeHfw0BXRy1o=;
 b=ge0xa1A90qmKH0T9Ffp/xVVLfCp1/6L7ACAxdT3rzrUzx9Z6szpl6owYxQfHtUBVSeoO7PSYmNv6JMtlYdzxebzileDqF70HBIt35qCtTohwydsx+phGOm4vpFNKmzu+C9gqpSdh2MnElVfyaq3UuX5INw6MQiMviUmAn6DyVdo=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Message-ID: <221cee55-e7ff-4f17-ac22-16ccd40566b6@amd.com>
Date: Mon, 8 Dec 2025 15:43:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] arm/domain: Update SBSA_VUART_CONSOLE config option
 handling
To: Milan Djokic <milan_djokic@epam.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>
References: <cover.1764961645.git.milan_djokic@epam.com>
 <723a873c8c35f54d1cb29866c9b68211f6a977e7.1764961645.git.milan_djokic@epam.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <723a873c8c35f54d1cb29866c9b68211f6a977e7.1764961645.git.milan_djokic@epam.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001D6:EE_|DS2PR12MB9751:EE_
X-MS-Office365-Filtering-Correlation-Id: 0fda3031-6c5f-43df-aae6-08de36682c34
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|36860700013|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?MGVYS1FJMnlkd2NBUEVqckZOREZCYTJNUEFYK2RuUThYaDdBUTFCanVFeU91?=
 =?utf-8?B?N1ZlL201cUUvK21FUk15VGNSNnN6ZUtwbHN6SFd6MDZ6Wmp0WktubnJYai84?=
 =?utf-8?B?OThRZ1RYeXdwWXh5SkRXVWkwQ2lpYm0yNlA0UEhhUnlmZTBIVUhJYVNBQjhs?=
 =?utf-8?B?Q1R0alYrZ1hRZlRyTkxRdSsxVHIxOEJqREZRVk5qbnpyRVlPTnhla0tKd2pB?=
 =?utf-8?B?RmxRZnBzQUhMQXVERW1WanNwMnh5c0EzRTFQL2xsQkVtaUtMYWwzcXJ5bExO?=
 =?utf-8?B?QVFTQllKd3k4Y0Q5QXpSQ3NTYktSQVE4TUhlcUJDYmZ2UUxIbXNhSWkrY2Ey?=
 =?utf-8?B?NGlxZkt3L1VyYkdGS2syM3RlekxSYm10aHFMTDZlaXd2MExjTXg2VnFnRHZa?=
 =?utf-8?B?cWViY1JLVWRKTlBsalpPSnpWaFd1MTAvQXF4M3hhemdIMXpBdzF3NWM5MHNF?=
 =?utf-8?B?ZVVHMUFkQk5nRUhVam9sTVVZUXR3UURTMGhmM2tIZ3pWQk1mWjVUbXVwUld6?=
 =?utf-8?B?bkJYQVd6QVJBRm9LREFSdVBmVHBreDNxMUE4dTIwVDJOWGpXR0lxb0dyYkZY?=
 =?utf-8?B?blMzTTBNTW5vRWt1TlhjazZHcHRReWtFQm90S1NleUJPVFlid3l5bnFIRjFP?=
 =?utf-8?B?aVBWRDk2NmhBUG1rNTZtdzR1ajVHQjFBdnMyOURZMGFZWU5QVTdWak5UOGIz?=
 =?utf-8?B?bzhnMXNqd0NvOWpTSHF2SkxQV1RDNXI1YkkzbWppUE8zc01LOFVCcUd3RFZU?=
 =?utf-8?B?U1o2NmlWUXAzZ0lCM3E0b3F0UHNOVXBDWmN6ZzJYTXU3QStBTXhIRVl4d0xP?=
 =?utf-8?B?TzdZc3NWMnUvS0pMdGM5VlJrUFpCaE83bk5nYTF6cFA2SDhudERWY0U0eTBC?=
 =?utf-8?B?YzMyTHRSbHBlVnQyWHVSZWVTd2J4UHZtVm9Tb1IxOEpvNjJiUGtiTHg2dUdM?=
 =?utf-8?B?S0hJZS9maFE3WUQyVXZDbmFwMjZLNnZUeWVTRk5QbDh0RTRnTmhrd05FZU1S?=
 =?utf-8?B?OUtodHFRVVM5aURmMEo4S3JZZ0hSUFVydTBXelVoaGJjWFUrRDVzcXlVQVla?=
 =?utf-8?B?L2hyQUsxa2loRCtzNzlGWWxiWnhHdXh3cGFGSUNnTkdPS1ZWMXA1MGhkbEZp?=
 =?utf-8?B?T1Q0ZFhwdnd3M3IvUjhyWkM2Qm5zYm1MZ3Mxc2ljQXYwUDBaQ2xReUlIRVpL?=
 =?utf-8?B?NVQxVjNqeTBsZHk2Uy9hM2xqVmN3M094WmJkMW56aVZCWlhOaVF4a2x6UXBh?=
 =?utf-8?B?dGttdVJabmllbkRQaXFTUmRtZVVOc1l6UkVEektEZEp1eU02NGlqVmtSSFlq?=
 =?utf-8?B?dFIvL1NvTEZYRU9lcExMdjlnbXF0RDJnMjdWaHZPWWVxVmVya3lJTHFGRFU5?=
 =?utf-8?B?SmdsMGM4NWlDc1VYczFnZE1HcEdIcTNBZ1I0YmhYcHJNMkdUejMrMy9oQjlO?=
 =?utf-8?B?UWIrbGZSMmwrYWhncUNocm5DWkFzRk5CMmJKS3FNdENlQnlLNFQ4NStqNHYr?=
 =?utf-8?B?a3lSTHVLVE10TWpFTm5aYVo1T1lFdTd6d2FsYTBYcXZSOGYyb0Z3YldVL25i?=
 =?utf-8?B?dFMxYmFqd1lMKzVSTVRLcXMrN2tmMFNMbE9iS00zaGQrQzR2OVllMXRiQUNS?=
 =?utf-8?B?UnQvM2dmM1ZJSEp4YkVmRlh3b3ZGTC93WGE3UG1GeXdjNEVTdmNzR2V4czFT?=
 =?utf-8?B?WU5HSGUxQ1dnOG9QNFljcWczSFN2aTJ6V1Q3SEgzejJMdVBlOCswQUM5T0JT?=
 =?utf-8?B?bjF5V2l5NkVoeHJaKys3NFp2M2NENUc4R1ZVek1xTVFES3JBWmhQL2ZPMlpQ?=
 =?utf-8?B?bmdCWGtyeUZPMlJUVWUwbHV4OE1ZUTNCZmppQXU2cm1TdWd1OUtZcHRVbm1u?=
 =?utf-8?B?UWlRdjBreDRRMVJqNGJnVm9lU2dmemF6WlVGaDRJMjhxR0xHNkkvOFhrOUpq?=
 =?utf-8?B?VkIybUkxZlU3aFFySm02ZzRyc0lvMkphbHV5bWFuaGgybTNRbWtUeUVQKzBt?=
 =?utf-8?B?NTQraVN2Ym0xUGZvQksyb2tjKzdnRVl1M0tQQXdVdTBuNG9pckZCTStvWTQr?=
 =?utf-8?B?S253YzUwUms1elREQzIrRnY3b0RGZDNIQnhGTHlGbE5OQTZMbXN4WDlaWjhl?=
 =?utf-8?Q?Oijk=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700013)(376014)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Dec 2025 14:43:37.8240
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0fda3031-6c5f-43df-aae6-08de36682c34
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001D6.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS2PR12MB9751



On 05/12/2025 21:36, Milan Djokic wrote:
> Update XEN_DOMCTL_vuart_op command handling to return -EOPNOTSUPP when
> vpl011 is disabled, informing the control domain that this feature
> is unavailable.
> Added dom0less config sanity check for vpl011 property
> 
> Signed-off-by: Milan Djokic <milan_djokic@epam.com>
> ---
>  xen/arch/arm/dom0less-build.c     | 4 ++++
>  xen/arch/arm/domctl.c             | 3 +++
>  xen/arch/arm/include/asm/vpl011.h | 2 +-
>  3 files changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/xen/arch/arm/dom0less-build.c b/xen/arch/arm/dom0less-build.c
> index 4181c10538..57980d2abe 100644
> --- a/xen/arch/arm/dom0less-build.c
> +++ b/xen/arch/arm/dom0less-build.c
> @@ -322,6 +322,10 @@ int __init arch_parse_dom0less_node(struct dt_device_node *node,
>      if ( domu_dt_sci_parse(node, d_cfg) )
>          panic("Error getting SCI configuration\n");
>  
> +    if ( dt_property_read_bool(node, "vpl011") &&
> +         !IS_ENABLED(CONFIG_SBSA_VUART_CONSOLE) )
> +        panic("'vpl011' property found, but CONFIG_SBSA_VUART_CONSOLE not selected\n");
I don't think there is a need for another dt property reading. In init_vuart()
we read this property and if present we call domain_vpl011_init. This function
returns (thanks to your change) -EOPNOTSUPP, so we already cover both cases. No
need for an explicit panic.

> +
>      if ( !dt_property_read_u32(node, "nr_spis", &d_cfg->arch.nr_spis) )
>      {
>          int vpl011_virq = GUEST_VPL011_SPI;
> diff --git a/xen/arch/arm/domctl.c b/xen/arch/arm/domctl.c
> index ad914c915f..250e20a9fb 100644
> --- a/xen/arch/arm/domctl.c
> +++ b/xen/arch/arm/domctl.c
> @@ -156,6 +156,9 @@ long arch_do_domctl(struct xen_domctl *domctl, struct domain *d,
>          unsigned int i;
>          struct xen_domctl_vuart_op *vuart_op = &domctl->u.vuart_op;
>  
> +        if ( !IS_ENABLED(CONFIG_SBSA_VUART_CONSOLE) )
> +            return -EOPNOTSUPP;
Why is this needed? Later on in this path we will call domain_vpl011_init that
will return exactly the same if CONFIG_SBSA_VUART_CONSOLE is not enabled.

> +
>          /* check that structure padding must be 0. */
>          for ( i = 0; i < sizeof(vuart_op->pad); i++ )
>              if ( vuart_op->pad[i] )
> diff --git a/xen/arch/arm/include/asm/vpl011.h b/xen/arch/arm/include/asm/vpl011.h
> index cc83868281..b8f4d85651 100644
> --- a/xen/arch/arm/include/asm/vpl011.h
> +++ b/xen/arch/arm/include/asm/vpl011.h
> @@ -74,7 +74,7 @@ int vpl011_rx_char_xen(struct domain *d, char c);
>  static inline int domain_vpl011_init(struct domain *d,
>                                       struct vpl011_init_info *info)
>  {
> -    return -ENOSYS;
> +    return -EOPNOTSUPP;
This change is ok.

~Michal


