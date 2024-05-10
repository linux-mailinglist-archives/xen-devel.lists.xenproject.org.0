Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 418988C1F30
	for <lists+xen-devel@lfdr.de>; Fri, 10 May 2024 09:39:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.719542.1122339 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s5KpD-0003Rx-6o; Fri, 10 May 2024 07:37:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 719542.1122339; Fri, 10 May 2024 07:37:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s5KpD-0003Q4-3r; Fri, 10 May 2024 07:37:51 +0000
Received: by outflank-mailman (input) for mailman id 719542;
 Fri, 10 May 2024 07:37:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+rhO=MN=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1s5KpB-0003Py-PD
 for xen-devel@lists.xenproject.org; Fri, 10 May 2024 07:37:49 +0000
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on20600.outbound.protection.outlook.com
 [2a01:111:f403:2409::600])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 31c8121d-0ea0-11ef-909c-e314d9c70b13;
 Fri, 10 May 2024 09:37:47 +0200 (CEST)
Received: from CH0PR04CA0109.namprd04.prod.outlook.com (2603:10b6:610:75::24)
 by MW3PR12MB4361.namprd12.prod.outlook.com (2603:10b6:303:5a::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.47; Fri, 10 May
 2024 07:37:44 +0000
Received: from CH1PEPF0000AD7F.namprd04.prod.outlook.com
 (2603:10b6:610:75:cafe::ad) by CH0PR04CA0109.outlook.office365.com
 (2603:10b6:610:75::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.51 via Frontend
 Transport; Fri, 10 May 2024 07:37:44 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CH1PEPF0000AD7F.mail.protection.outlook.com (10.167.244.88) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7452.22 via Frontend Transport; Fri, 10 May 2024 07:37:43 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Fri, 10 May
 2024 02:37:43 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Fri, 10 May
 2024 02:37:43 -0500
Received: from [10.252.147.188] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Fri, 10 May 2024 02:37:41 -0500
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
X-Inumbo-ID: 31c8121d-0ea0-11ef-909c-e314d9c70b13
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=V2FZHqx4tTnnsdo/8XVzfXTK9kKlHFuPIu7Kr8fqCkjGtOsyi64vW0oKyiw35ZpZBMNq/vm0/PPKeWYneE8AgSy2LlrUEwp2EZlsGbKM8wm6uvexiCKlMeNYliQJk4r0bwvtmCvQSosKFMBH8OajS3kHkhw68LywUbuwHXNjANXvFzT+r1HxLXA3W+WrU9JJ/MY9JbikcpKvoD8xgNfu9PkJj4E3jYkU7dSkIAXQB0e25ccdrHkCkgu+UdUYGwixYxiJ5VHWNdBH4qqfqvCqnzGnbaTZ/BzsTZyhOgQjJeRbItdnm3/CLjbnvceH5cwOd6ky3hT7ZfJdyAH2kENHgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=48cBJhgTwMMujLUdyxPhBeMKf9PaNp9uYn1TxzAT8P0=;
 b=fUkH0pkyiOveG8XlZuWC60EfR1MNAhrOvPulapdFxH6NCVsMSoVYPkr6b1s0eV0p7g8TwbDp8+gxlbdtM1x0VxEqPik9yWyTAvEbDGlE5byF+/CRfJFxz/r32GZfqscB44JimP388MsUjbYlg92rDZZBsJFoOQNHK1m0n+pTAvtwWUhbhK1Ui1hCYsg8UPEjdTg7C4p5UVFfpI5CwrM8EzszzDlfqMGxxlVbtjlEIbmKh7TvGEsFPJytOwI0QQjNtN1ChgSGm0nbykhjfXp8hqapRhbV06yqVX2hTUxxpWK/PS3FSMSfJd5LFVGWnER7DxGleHLlReYPGxza7Tbn8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=48cBJhgTwMMujLUdyxPhBeMKf9PaNp9uYn1TxzAT8P0=;
 b=jz3pXWG9Tv0ud6UQrpGQ8uUYv2DRHO+C6nW+mwWqQzH8eIMbdzamPIvmq3pWw0P/CsqArG/vHGVaqUT71DE+mmk9J1aJAwdqvliiKzXrcDCcN/cIZC80OvAZkwrjGlXDAI6Tqpgmc3/FtDwOHmILSGGGiVvizquh8VgfaKg9QU4=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <5d3ead96-5079-4fa3-b5fd-4d9803c251b6@amd.com>
Date: Fri, 10 May 2024 09:37:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] xen/arm/dom0less-build: Alloc magic pages for
 Dom0less DomUs from hypervisor
To: Henry Wang <xin.wang2@amd.com>, <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@citrix.com>, Juergen Gross
	<jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, "Volodymyr
 Babchuk" <Volodymyr_Babchuk@epam.com>, Alec Kwapis
	<alec.kwapis@medtronic.com>, "Daniel P . Smith"
	<dpsmith@apertussolutions.com>
References: <20240426031455.579637-1-xin.wang2@amd.com>
 <20240426031455.579637-2-xin.wang2@amd.com>
Content-Language: en-US
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <20240426031455.579637-2-xin.wang2@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB05.amd.com: michal.orzel@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD7F:EE_|MW3PR12MB4361:EE_
X-MS-Office365-Filtering-Correlation-Id: 4ac4e60a-3a36-4a8c-91ff-08dc70c4147e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230031|1800799015|376005|36860700004|82310400017;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?aUQweVRaRG5SNEFjY0ZZbmROMHMreVFkQmdUN3phdmF6bWNrMmM5TW5sanlN?=
 =?utf-8?B?Q1ptSUdwdHJNcUNRL0lHTUtmSmVvb2dSVXN1cTN5dnpWZktLNEwyeU5MMm1X?=
 =?utf-8?B?YTVIdUpLbUM5dHNGbFFQdzRzdHdNRTFuMEZPUlErY1FMeGZHdjBFdUtFRkJp?=
 =?utf-8?B?QXFNczFzZExKOHJwekJrRXVxbGZpSC84R09KNnRENStlTVlIb0xrRit5cFpQ?=
 =?utf-8?B?SVlaMDRWcng4OEhOYXpvSS9admZGOWJGVUdqRGRuak84M2xQVkxxb1FCeTJY?=
 =?utf-8?B?cXZjMGxjOUhNdVJsRzl6eHFjeHpLWXh4MUJRQ1dNWDZkTGZmcEgvYmNxRTRN?=
 =?utf-8?B?NVVrVEpFRERUNGhqbEF2bnVPTmZVbE56d2dwUStjeGlXblY2aXpQbkRkSkd0?=
 =?utf-8?B?WHpYR0NMWTNLZXNHV0pTTm1OaHBzenZ3N0c1S3grVVpaL09SSGxLY1hkWlNv?=
 =?utf-8?B?UVE4a01KU256azBlV3o5cHBrWE96RUQyMnNQY2RJOG1vQU42Q2IxMS9HM0lM?=
 =?utf-8?B?YXNyVldxK3cxUlpTRlEva0IyM09vcER2bWpRcXAyaExTVWFITC9YOGxxR1Fh?=
 =?utf-8?B?aG9TcEd2eW1UdWJiM2dpRi9xWHorcTJhOU9HVmZocG9LQkJYVzI0Tyt4UkRo?=
 =?utf-8?B?Mmt1bU5KcUcxRnBhL2VzZWc5U0lFYmc5NWRkQ3dzd2c5OXZ6TVJPY0x5em1H?=
 =?utf-8?B?UnhtZ1crN2Rjd2YxbjFNRGpMN1ozUmFrMS9NV1lsUGtseFd2Qll2L2psSHJL?=
 =?utf-8?B?MEFTc05LUUE4cWpzRGthS2dFTXMwTnlYdld6VHJYOFMwWVpPWVZMQ1dIZTd5?=
 =?utf-8?B?L09EUEczem9QMDZXcy9HM2lNNHJoM0hwTFpZN1FLRDBlSTdBRkNramd2UnBq?=
 =?utf-8?B?VXFKTDNwMG9GL0JxRXdkOGJvU0hTYWVRT09rajBMOVlSdytJUzZrS2Y3bGdB?=
 =?utf-8?B?U0VRamFrZDMyUGNrWnFKOENDQVAzQnpVcVp0SjZsOThsZ1c2TlpxczJTeEZx?=
 =?utf-8?B?V0JLYUdtcldIdmlmVnl1cHI4cVhKU1NyRzBYcmIrb2ZFeFprd0FIRmpESHpn?=
 =?utf-8?B?eWs5dW5hNmlJbldGZEdJY0xnWVVnM1RRUnlwZUJjNkx2RmFud1creHlkbUox?=
 =?utf-8?B?bG01L24zbSs5ZTlkb1RDaVV2c3dpcVBGOUVVSzZpVUk4VWZjbWlLQjlBOW80?=
 =?utf-8?B?Sk5JOStucmQwZEV6ZXBhMHdaNDlnd0ZiNnZ4aC9nSm1HbStVbHBUeUQzajJP?=
 =?utf-8?B?YnlBNzNuUzlVdXA1QVBEajJvMFAvc2ZYdWJjdEhMMEdWODYyQk1VS2lyTmFG?=
 =?utf-8?B?d2pVaEhIalZYSkQrVm1pWFJjYjcrSFQvcEdpYUhRTDc3OUhHZWEwakZvYms5?=
 =?utf-8?B?eThFMzZGcnpKTit2TnZ6aCsxQ0pncm5wWTBEZ0pjdU1CMEJvZEpxdXppUlRD?=
 =?utf-8?B?dXhIOGZ6S0pLS09zeTlKMTVHcURmZU1lanRxWjl4ZXFHaUIvTm1BZ1AvU1Yw?=
 =?utf-8?B?aXA0Qlcxc1FXakt5ZVpxbE5nUk9Fb3ZjS0RGV2lwdWV0cUNvUkh1Um1BNUdx?=
 =?utf-8?B?aExUVVhSS2pMRXplNkdtZWd6NWEvUHJLZmx2eXZSTHVhWnV0QVZSSEx0VVc3?=
 =?utf-8?B?cXd6RFJTMlFOSHM3RG5FeFFhYi9wUDlMNm1SdEttMC9leUFZZ3FVUnJYeUhy?=
 =?utf-8?B?YmNmWXVpT2lpbWF1d1Mrc2dlRTd1MTdqbytYclR4WldLNnJxdHY3NmhiVE1x?=
 =?utf-8?B?dGZvSXhGbjB5L1EwUjF5SlF6YW1FdG52VHIrbk04Y21NeVF6aXhPS3d5SCt5?=
 =?utf-8?B?MmlMZnpMdXNwYUdNZ3o4c2h2elZkZE1hd0tBQ3k1cnJ2am1CL0wvdThYMDlo?=
 =?utf-8?Q?X1s3zTDuC/0+v?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(1800799015)(376005)(36860700004)(82310400017);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 May 2024 07:37:43.8882
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ac4e60a-3a36-4a8c-91ff-08dc70c4147e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000AD7F.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR12MB4361

Hi Henry,

On 26/04/2024 05:14, Henry Wang wrote:
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
> This is because currently the magic pages for Dom0less DomUs are
> populated by the init-dom0less app through populate_physmap(), and
> populate_physmap() automatically assumes gfn == mfn for 1:1 direct
> mapped domains. This cannot be true for the magic pages that are
> allocated later from the init-dom0less application executed in Dom0.
> For domain using statically allocated memory but not 1:1 direct-mapped,
> similar error "failed to retrieve a reserved page" can be seen as the
> reserved memory list is empty at that time.
> 
> To solve above issue, this commit allocates the magic pages for
> Dom0less DomUs at the domain construction time. The base address/PFN
> of the magic page region will be noted and communicated to the
> init-dom0less application in Dom0.
> 
> Reported-by: Alec Kwapis <alec.kwapis@medtronic.com>
> Suggested-by: Daniel P. Smith <dpsmith@apertussolutions.com>
> Signed-off-by: Henry Wang <xin.wang2@amd.com>
> ---
>  tools/libs/guest/xg_dom_arm.c |  1 -
>  xen/arch/arm/dom0less-build.c | 22 ++++++++++++++++++++++
>  xen/include/public/arch-arm.h |  1 +
>  3 files changed, 23 insertions(+), 1 deletion(-)
> 
> diff --git a/tools/libs/guest/xg_dom_arm.c b/tools/libs/guest/xg_dom_arm.c
> index 2fd8ee7ad4..8cc7f27dbb 100644
> --- a/tools/libs/guest/xg_dom_arm.c
> +++ b/tools/libs/guest/xg_dom_arm.c
> @@ -25,7 +25,6 @@
>  
>  #include "xg_private.h"
>  
> -#define NR_MAGIC_PAGES 4
Moving only this macro to arch-arm.h while leaving the offsets does not make much sense to me.
I think they all should be moved. This would also allow init-dom0less.h not to re-define XENSTORE_PFN_OFFSET.

>  #define CONSOLE_PFN_OFFSET 0
>  #define XENSTORE_PFN_OFFSET 1
>  #define MEMACCESS_PFN_OFFSET 2
> diff --git a/xen/arch/arm/dom0less-build.c b/xen/arch/arm/dom0less-build.c
> index fb63ec6fd1..40dc85c759 100644
> --- a/xen/arch/arm/dom0less-build.c
> +++ b/xen/arch/arm/dom0less-build.c
> @@ -834,11 +834,33 @@ static int __init construct_domU(struct domain *d,
>  
>      if ( kinfo.dom0less_feature & DOM0LESS_XENSTORE )
>      {
> +        struct page_info *magic_pg;
> +        mfn_t mfn;
> +        gfn_t gfn;
> +
>          ASSERT(hardware_domain);
>          rc = alloc_xenstore_evtchn(d);
>          if ( rc < 0 )
>              return rc;
>          d->arch.hvm.params[HVM_PARAM_STORE_PFN] = ~0ULL;
> +
> +        d->max_pages += NR_MAGIC_PAGES;
> +        magic_pg = alloc_domheap_pages(d, get_order_from_pages(NR_MAGIC_PAGES), 0);
80 char exceeded

> +        if ( magic_pg == NULL )
> +            return -ENOMEM;
> +
> +        mfn = page_to_mfn(magic_pg);
> +        if ( !is_domain_direct_mapped(d) )
> +            gfn = gaddr_to_gfn(GUEST_MAGIC_BASE);
> +        else
> +            gfn = gaddr_to_gfn(mfn_to_maddr(mfn));
> +
> +        rc = guest_physmap_add_pages(d, gfn, mfn, NR_MAGIC_PAGES);
> +        if ( rc )
> +        {
> +            free_domheap_pages(magic_pg, get_order_from_pages(NR_MAGIC_PAGES));
> +            return rc;
> +        }
Please create a function alloc_magic_pages to encapsulate the above block.

>      }
>  
>      return rc;
> diff --git a/xen/include/public/arch-arm.h b/xen/include/public/arch-arm.h
> index e167e14f8d..f24e7bbe37 100644
> --- a/xen/include/public/arch-arm.h
> +++ b/xen/include/public/arch-arm.h
> @@ -475,6 +475,7 @@ typedef uint64_t xen_callback_t;
>  
>  #define GUEST_MAGIC_BASE  xen_mk_ullong(0x39000000)
>  #define GUEST_MAGIC_SIZE  xen_mk_ullong(0x01000000)
> +#define NR_MAGIC_PAGES 4
>  
>  #define GUEST_RAM_BANKS   2
>  

~Michal


