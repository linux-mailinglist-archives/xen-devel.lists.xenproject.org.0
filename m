Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B1D628D2EFC
	for <lists+xen-devel@lfdr.de>; Wed, 29 May 2024 09:58:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.731572.1137139 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sCEBX-00079D-TI; Wed, 29 May 2024 07:57:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 731572.1137139; Wed, 29 May 2024 07:57:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sCEBX-00076r-QM; Wed, 29 May 2024 07:57:23 +0000
Received: by outflank-mailman (input) for mailman id 731572;
 Wed, 29 May 2024 07:57:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DcHb=NA=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1sCEBX-00076l-4a
 for xen-devel@lists.xenproject.org; Wed, 29 May 2024 07:57:23 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2060b.outbound.protection.outlook.com
 [2a01:111:f400:7e88::60b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 12a2ec2a-1d91-11ef-b4bb-af5377834399;
 Wed, 29 May 2024 09:57:20 +0200 (CEST)
Received: from PH7PR13CA0004.namprd13.prod.outlook.com (2603:10b6:510:174::25)
 by MN0PR12MB6341.namprd12.prod.outlook.com (2603:10b6:208:3c2::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.30; Wed, 29 May
 2024 07:57:16 +0000
Received: from CY4PEPF0000EE34.namprd05.prod.outlook.com
 (2603:10b6:510:174:cafe::f1) by PH7PR13CA0004.outlook.office365.com
 (2603:10b6:510:174::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.19 via Frontend
 Transport; Wed, 29 May 2024 07:57:16 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000EE34.mail.protection.outlook.com (10.167.242.40) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7633.15 via Frontend Transport; Wed, 29 May 2024 07:57:15 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Wed, 29 May
 2024 02:57:12 -0500
Received: from [10.252.147.188] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Wed, 29 May 2024 02:57:11 -0500
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
X-Inumbo-ID: 12a2ec2a-1d91-11ef-b4bb-af5377834399
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eAYUNztqgpLnBHm6T2kegJp+p/TRR2xlOHZCacgFj4HiZ3dkZ+tvMa/7maiQewBlLDpyAENwex5sX3Raq8LfVyb8hdUY8WdepMSJYlhDAwF1lg61dsrO9M5eOnLWbtlexsCTM2yMnDitUus8B0TZ31p9bfadVkj0mSoR0WHQ8yOFxnLdkxoRrsNLPTeEY3E6DtfaYMmLg0PGGsf0g4ycuo89z7o8mzL0LoOo3UvIXMgDHevW7CXHSNTGrYHaa1FR48Xpd/gvI/adjEPPCNYo5Yy2NTbUC4fo2vAa/46HK4i3q6PfC24OUAYi9KnDU5X00Mp2A7d0KK0IBWOnQTcgSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BZXHWSmTLEehqwLmMPRdKW925X2CNhmKJtd2q3IMBvs=;
 b=EE4JOaNNFyD3X5WySChIW4hbQ/JgV/jBul2i7xWigsAQZNIT1/QZhM9qnGpDjFaJTZtOz6p3TAta+LsEWVG46uOT+Ny3NMRoMWgmPVwSXeYJwpRrZ4imzfmW+QJau8fGru47fwPFXI8IHY3NKy3+2mfnrD7nJggnqeyYi/lPjRq4eZl6bdWWd8XMTqNXrNuv2OYe+0D5OZAZb0L6SFI8m/AgR7nWOnDgu7eib7jOYe2UOOug5gfmtKN30s85QwUl4S1B5ztKQWzZByf6Tcf4V/aLQvu4pHq0ITB7NNywL0Lh5bFSPYYgFqw9VtGlfDLFpPqfotK7V9QgZR8Ifj+nmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BZXHWSmTLEehqwLmMPRdKW925X2CNhmKJtd2q3IMBvs=;
 b=gOCUuvkADBBVf3LJWE+jZyiWqOpSwKwpkxtrYHzM+1P4qiQXsSWwHsx/kt2CwpJ5efkjHxoss52hEd8dOVa0NNekhO0c/360UQHa8iLf/NWtMLxvAPaErKLr161oFvlC1pzN0p9hO/N11MQ+TvZdq5/khha5daaCFpSfhKp2nSM=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <b30fa6dd-97f4-4249-a1b1-5cbf13e20055@amd.com>
Date: Wed, 29 May 2024 09:57:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/4] xen/arm: Alloc XenStore page for Dom0less DomUs
 from hypervisor
To: Stefano Stabellini <stefano.stabellini@amd.com>,
	<xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>, <julien@xen.org>, <bertrand.marquis@arm.com>,
	<Volodymyr_Babchuk@epam.com>, Henry Wang <xin.wang2@amd.com>, Alec Kwapis
	<alec.kwapis@medtronic.com>, "Daniel P . Smith"
	<dpsmith@apertussolutions.com>
References: <alpine.DEB.2.22.394.2405241552240.2557291@ubuntu-linux-20-04-desktop>
 <20240524225522.2878481-2-stefano.stabellini@amd.com>
Content-Language: en-US
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <20240524225522.2878481-2-stefano.stabellini@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB04.amd.com: michal.orzel@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE34:EE_|MN0PR12MB6341:EE_
X-MS-Office365-Filtering-Correlation-Id: 8342e4b0-2bc0-4b0c-521e-08dc7fb4f4b0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230031|36860700004|376005|1800799015|82310400017;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?OG9KN2NsRmpOL2pGczhBTDdzMExMbVhYZzFKeDFPZjFreEZzSVNRYTE2ak05?=
 =?utf-8?B?S2M5SGJqRjhpMVVlZEowUnd2NXNGQUJOQmpIaVRibW5pcVlaMkV1dlhVTFRE?=
 =?utf-8?B?L1pYN0w5QkZxRUgwUFFacUZEUDhWcWQ2bUNPVi9SajBUa3pqSUpoeHB6OThN?=
 =?utf-8?B?UzQ1MWM1SWFLT21TZXdFR1FUaUlRQU9mVUVoOWhnT09aaW1WdG5qeEhtRmg3?=
 =?utf-8?B?UmxkV2dVUTdYTkM3aTgzMVpBbHo5dXpPVThnbTBaa0doSnUvdmNKVExWa3c3?=
 =?utf-8?B?eHFoWlVpM3lCdFRPUmIwWXNFa05RY2NsejlURWx2UkFMS1oxYVoxa2FvOTFv?=
 =?utf-8?B?NEJ1cE9qVlkrcENGRmNTVE5wT0RHV09VMHA3cnlyRTBUdlErVkhMNEtpVzJn?=
 =?utf-8?B?SkZMazEvbTNJclVwYy9IUG5DZTlTOHRUR3pEYTBaUjZCdmVSd1FxWWMyUEhI?=
 =?utf-8?B?cEtCK1pUUWxhY3R6UXk3S3RvTlpPdExQWHVIejd1RzU1RGxFQkVwU2NUd200?=
 =?utf-8?B?dmI2clp3T0czUTg2dmc5ejRiSy9wOGJGTGFZZGhXUUIxUTlZZ2xIcVdYQ0NK?=
 =?utf-8?B?N0toUjBmbGFDN2pUaVhJN2lEOERCb2hiZDFBeFRRaFVnYTZZcGFTM0FhZ05o?=
 =?utf-8?B?SjVXR0liaEhDRk9raFBaNEhtNUczY3k2THBwMnArYTZkUHlHOU5iZVpKQ3F5?=
 =?utf-8?B?YkNaK1JNaHdHQTRMMXdOUnhabUVteldtV2xlbW15M2llMW5KTlV1cU5sK0lI?=
 =?utf-8?B?algvc1NPZTgycDZHNjBZYXNMd2FSVUVMTW5BeHVENE1yRWFvMVlRQm9RK1NV?=
 =?utf-8?B?OHJSc1VOWWo5UEhSYkFsdnlqUjJCVHYxR0RjUENIeGVPQytNKzBGR05ucnlN?=
 =?utf-8?B?dWxWLzZXWFVMZS8xUE5VeElzWmlSeTlra0JVWk8xaXd3UU5wRTZvaTRtcjc5?=
 =?utf-8?B?MzloVXNWeklWRTNNaHdEODJFSW5iTlMvVTd6UmUrSFE4Rjl2V2pEYWh6d3kx?=
 =?utf-8?B?R3NmZllvejI2dFBNc256REZOWUF6S0lBbVFwUVd5L3dYUWNWYXpxOGllQ3N2?=
 =?utf-8?B?emVKTUVWZ1BnNFNJNHNxMS9TUTNIWlh6WkRLanplY0c1NE5BTHJFcys2Y21G?=
 =?utf-8?B?UkpybDF4Z3h6TFNsOUcvd0NPRkNZN3BueUxuRzZxRmh3blJKYjZkYm1SbUln?=
 =?utf-8?B?L2YyeW91bS9ZdzdIZEJ6WHB6VnNzaXB0RVRabFJKK3JNVlhuVkQxQzBsTU1N?=
 =?utf-8?B?VHR1TG9JUkp5WDJCeWxzS3c2eVhZUmdCS3BYdXZDVVVxVU5NYkpSZFFoK1pt?=
 =?utf-8?B?RkhRbVVqWlBjZ1E1dllyMm45bmhIWXh0MVBRQ3haK2ozbHJ4eW0weDA1Wk9U?=
 =?utf-8?B?ZzE2UTFRWEFFZHRmcEVxUFZON1o2VTZjbTZuT0lFS0x3eVd0aUlQZHJvbExO?=
 =?utf-8?B?NWxhTVl6QW9uK01BbDZOMHRGYTdOelJrVEtPWmJrMFZPelFFVkMvUlpMYVlw?=
 =?utf-8?B?MjJ6RDZVYko4clpYTHhnNWVaTVlEUERtbHJyaXNJTlBRQkF6SDJWSng5T0I1?=
 =?utf-8?B?MUtqbFNvQkFZQ0VxRzB4c0QzZU55OEZvYTZzRG9KRGxaV2FlR1F5ekczVUE1?=
 =?utf-8?B?WkxFTG1DQjRZRjQvNWF4QjNjM09qR3d2UlRBV3lGb0ZuNG1DRTdLcUlaS0cx?=
 =?utf-8?B?VCt4NnhVbUltM1VpMkhsRFdIY05BbDhqRG1NM2FvQmFzbzFsTHJxdEg1SlVP?=
 =?utf-8?B?QkFKSkVyejhsck11WnlYdm9xSkpaN1JRd3lURTlHU0EwM3o5UjJpVzJCSm53?=
 =?utf-8?B?S1ZFTVdoMFRRSkIxc1FOSlYzL3pTaFd2ODJYMkNOVFJ6UmJSVXZ4akxvcVZP?=
 =?utf-8?Q?Wl+ElD1XowTKu?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(36860700004)(376005)(1800799015)(82310400017);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 May 2024 07:57:15.4867
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8342e4b0-2bc0-4b0c-521e-08dc7fb4f4b0
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EE34.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6341

Hi Stefano,

Wasn't this patch supposed to be folded with patch no.3 to avoid breaking the bisection?

On 25/05/2024 00:55, Stefano Stabellini wrote:
> From: Henry Wang <xin.wang2@amd.com>
> 
> There are use cases (for example using the PV driver) in Dom0less
> setup that require Dom0less DomUs start immediately with Dom0, but
> initialize XenStore later after Dom0's successful boot and call to
> the init-dom0less application.
> 
> An error message can seen from the init-dom0less application on
> 1:1 direct-mapped domains:
> ```
> Allocating magic pages
> memory.c:238:d0v0 mfn 0x39000 doesn't belong to d1
> Error on alloc magic pages
> ```
> 
> The "magic page" is a terminology used in the toolstack as reserved
> pages for the VM to have access to virtual platform capabilities.
> Currently the magic pages for Dom0less DomUs are populated by the
> init-dom0less app through populate_physmap(), and populate_physmap()
> automatically assumes gfn == mfn for 1:1 direct mapped domains. This
> cannot be true for the magic pages that are allocated later from the
> init-dom0less application executed in Dom0. For domain using statically
> allocated memory but not 1:1 direct-mapped, similar error "failed to
> retrieve a reserved page" can be seen as the reserved memory list is
> empty at that time.
> 
> Since for init-dom0less, the magic page region is only for XenStore.
> To solve above issue, this commit allocates the XenStore page for
> Dom0less DomUs at the domain construction time. The PFN will be
> noted and communicated to the init-dom0less application executed
> from Dom0. To keep the XenStore late init protocol, set the connection
> status to XENSTORE_RECONNECT.
> 
> Reported-by: Alec Kwapis <alec.kwapis@medtronic.com>
> Suggested-by: Daniel P. Smith <dpsmith@apertussolutions.com>
> Signed-off-by: Henry Wang <xin.wang2@amd.com>
> Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
> ---
>  xen/arch/arm/dom0less-build.c | 55 ++++++++++++++++++++++++++++++++++-
>  1 file changed, 54 insertions(+), 1 deletion(-)
> 
> diff --git a/xen/arch/arm/dom0less-build.c b/xen/arch/arm/dom0less-build.c
> index 74f053c242..2963ecc0b3 100644
> --- a/xen/arch/arm/dom0less-build.c
> +++ b/xen/arch/arm/dom0less-build.c
> @@ -1,5 +1,6 @@
>  /* SPDX-License-Identifier: GPL-2.0-only */
>  #include <xen/device_tree.h>
> +#include <xen/domain_page.h>
>  #include <xen/err.h>
>  #include <xen/event.h>
>  #include <xen/grant_table.h>
> @@ -10,6 +11,8 @@
>  #include <xen/sizes.h>
>  #include <xen/vmap.h>
>  
> +#include <public/io/xs_wire.h>
> +
>  #include <asm/arm64/sve.h>
>  #include <asm/dom0less-build.h>
>  #include <asm/domain_build.h>
> @@ -739,6 +742,53 @@ static int __init alloc_xenstore_evtchn(struct domain *d)
>      return 0;
>  }
>  
> +#define XENSTORE_PFN_OFFSET 1
> +static int __init alloc_xenstore_page(struct domain *d)
> +{
> +    struct page_info *xenstore_pg;
> +    struct xenstore_domain_interface *interface;
> +    mfn_t mfn;
> +    gfn_t gfn;
> +    int rc;
> +
> +    if ( (UINT_MAX - d->max_pages) < 1 )
> +    {
> +        printk(XENLOG_ERR "%pd: Over-allocation for d->max_pages by 1 page.\n",
> +               d);
> +        return -EINVAL;
> +    }
> +    d->max_pages += 1;
NIT: empty line here for readability

> +    xenstore_pg = alloc_domheap_page(d, MEMF_bits(32));
> +    if ( xenstore_pg == NULL && is_64bit_domain(d) )
> +        xenstore_pg = alloc_domheap_page(d, 0);
> +    if ( xenstore_pg == NULL )
> +        return -ENOMEM;
> +
> +    mfn = page_to_mfn(xenstore_pg);
> +    if ( !mfn_x(mfn) )
> +        return -ENOMEM;
I think you should free the allocated page here

Other than that:
Reviewed-by: Michal Orzel <michal.orzel@amd.com>

~Michal

