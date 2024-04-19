Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 645068AA6EE
	for <lists+xen-devel@lfdr.de>; Fri, 19 Apr 2024 04:28:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.708622.1107646 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rxdyK-0007pJ-6B; Fri, 19 Apr 2024 02:27:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 708622.1107646; Fri, 19 Apr 2024 02:27:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rxdyK-0007nU-3Q; Fri, 19 Apr 2024 02:27:28 +0000
Received: by outflank-mailman (input) for mailman id 708622;
 Fri, 19 Apr 2024 02:27:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=52U1=LY=amd.com=Xin.Wang2@srs-se1.protection.inumbo.net>)
 id 1rxdyJ-0007nO-7m
 for xen-devel@lists.xenproject.org; Fri, 19 Apr 2024 02:27:27 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on20601.outbound.protection.outlook.com
 [2a01:111:f403:2415::601])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5aa6998f-fdf4-11ee-94a3-07e782e9044d;
 Fri, 19 Apr 2024 04:27:24 +0200 (CEST)
Received: from SA1PR02CA0013.namprd02.prod.outlook.com (2603:10b6:806:2cf::11)
 by MW4PR12MB6826.namprd12.prod.outlook.com (2603:10b6:303:20c::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.39; Fri, 19 Apr
 2024 02:27:20 +0000
Received: from SN1PEPF0002636E.namprd02.prod.outlook.com
 (2603:10b6:806:2cf:cafe::38) by SA1PR02CA0013.outlook.office365.com
 (2603:10b6:806:2cf::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7495.30 via Frontend
 Transport; Fri, 19 Apr 2024 02:27:20 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SN1PEPF0002636E.mail.protection.outlook.com (10.167.241.139) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7452.22 via Frontend Transport; Fri, 19 Apr 2024 02:27:20 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Thu, 18 Apr
 2024 21:27:18 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Thu, 18 Apr
 2024 19:27:14 -0700
Received: from [10.69.48.49] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Thu, 18 Apr 2024 21:27:11 -0500
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
X-Inumbo-ID: 5aa6998f-fdf4-11ee-94a3-07e782e9044d
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZN4RyI+PU8yz3ZZsA/mqNC0k/2r4BuypUnXXFvDnj+c2DMNUcML1DtBYwEwqKd6XRyZXmSB0ZD353PZXNhO9o+BqVQLqU1LgyFC3nhcz05PXx1VT3dQ+FuVFXpA8DxEI8XQrJGTVsuSkrQdxWCXVjUVioFFQynHlTAn/W+hlv0W/nnHgwD0l+1ABersOOBBt+kmQtSz0oTiY7lEWwkdb0GAySDtpLyjYpxb/aDi+FRJ9HVnP2zYT4EJHRCyS9l6iDCYusO8OR69Z8uqa1EntXnTWJBEkghSh2PMd3GvYpKR22ooTKcfckAYGKHyCxpmbsUmj4+nCU8/cCr+75HeZeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L08/V9RoPBCV4Ouu/mBWPc5rRZ3PXDyRzfaE62nNzF8=;
 b=ZWgQfDOiOeO/eQVscQBiIxpLAhgGJ02Q9D0eFgPdcHlnszrIlR9uM+/8TRrILIhj3Po7lVEuAA81XVYFbNYwVUng4fnM1KFs1wwxQR2BCzA/uwUTUwMrahfKB0B4YFGtMuJgAn72VCAQ1n4trVyaZFWtmOdx92W4KCxr7VWWcNtB0ic2eR7DqF2JYUMd60+KogigFUJLsmfBX1XIYwtAU00gP6nKhan9CSI/iObV+Vh74tq47N6BSeVme7j3q3eCQHC6/iHWd8eQepX50QIFcxHebR4wBIwIW8SW+mfffDxhYH4jIZnoSaDif4QpZny6T2ZcjiSTcu04Lxu7SaNtYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L08/V9RoPBCV4Ouu/mBWPc5rRZ3PXDyRzfaE62nNzF8=;
 b=O/Dgt13UGJSCyzPDxPkfjBHKH0Q1QR3ulOY3ZKIDGEQPQhf4qsYxoB5V7B3g3w+eS4yKpXWpIE0DfiEwfHgDHN/gWASwMw0QbxielyEG6DzLxspoMqt0jlX4/JHdqOO/X0orh5liU2vYoaubBc9Jc6ndc+0c5umhd4tde2lL7u0=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <2e273d57-cd9b-4e05-a9c4-bd9782884e23@amd.com>
Date: Fri, 19 Apr 2024 10:27:11 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/5] xen/domctl, tools: Introduce a new domctl to get
 guest memory map
To: Jan Beulich <jbeulich@suse.com>
CC: Anthony PERARD <anthony.perard@citrix.com>, Juergen Gross
	<jgross@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Bertrand Marquis <bertrand.marquis@arm.com>, Michal
 Orzel <michal.orzel@amd.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Alec Kwapis <alec.kwapis@medtronic.com>, <xen-devel@lists.xenproject.org>
References: <20240409045357.236802-1-xin.wang2@amd.com>
 <20240409045357.236802-2-xin.wang2@amd.com>
 <e3f7b726-f7df-4aee-b69f-638cf492d18b@suse.com>
Content-Language: en-US
From: Henry Wang <xin.wang2@amd.com>
In-Reply-To: <e3f7b726-f7df-4aee-b69f-638cf492d18b@suse.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF0002636E:EE_|MW4PR12MB6826:EE_
X-MS-Office365-Filtering-Correlation-Id: e0936c8d-9a92-4070-5019-08dc60183d47
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Ph5Tlk+kP8awR9IFgnx28jLp0gU1nxTPgP/p4VeSeFbMxEiz1kf6Q3NdD7n8YxrDfTbjuIh4SyL8MAii5XwH2QMKNKZHEcAAUW5o9sMeY+p4uktEtAKCaTZn1KJEEwCiEKI8ZOU/BYg5YbsKJ7MY4+GEL8L171EaEK++5BjVlHaFaYSxQwATnKaBgqMiuGl0VQC/erVB7uEOms0KYJVcERcKABFYRkml0vXrsdGo+AFQN3LmODvTx54nqW6dnn9Xy2Dli2Rh8z+2rjke3IcwZl7hyrhDWWk1LqWlxxtCq3GDSP+c14pY+Vm50RXvXbBaKKtYYKQaipjQRKC1lBVzf1Nq3OTz95EVHz4w4LJfjRXiFMQIjkUCgEu8tuybTyXaIv0BV/eJPQNM8g4u0IVbnSgjlRSAsFBv0g3hH1UbzATI//HhW6ix/qnv0yJtfDwA1xwArXuXvc8hIKrDDSAa1CuLq74uNVDIjrYmIprMtPUxJFfystOg3Dkob/8kP3hqdRAs+JmP6Y3k/2AOOr4q1NDbGdvKQvG0GIWCYm0jlqrmez7XAVOdXwefk4wwL8VSq03KhceGTkHJ4wiul77Gv86ZP4v8RUGvLXCgnQjG199XZDyDcN2Yqzob+4/KtfvE3eBOXBwVgbqA2RjPHI1/+MBZDyafbxXZS+jOEjO4OPRKi05YBfnVpg+Zh5h4/1IYPJIsVlNE1zl2rq7QwMTK/KG/vNaPNIVnLAH1+kk1AlRgIOGZaQI+y+2iEKX+NwHn
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(1800799015)(82310400014)(376005)(7416005)(36860700004);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Apr 2024 02:27:20.2708
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e0936c8d-9a92-4070-5019-08dc60183d47
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF0002636E.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB6826

Hi Jan,

On 4/18/2024 8:37 PM, Jan Beulich wrote:
> On 09.04.2024 06:53, Henry Wang wrote:
>> --- a/tools/libs/ctrl/xc_domain.c
>> +++ b/tools/libs/ctrl/xc_domain.c
>> @@ -697,6 +697,43 @@ int xc_domain_setmaxmem(xc_interface *xch,
>>       return do_domctl(xch, &domctl);
>>   }
>>   
>> +int xc_get_domain_mem_map(xc_interface *xch, uint32_t domid,
>> +                          struct xen_mem_region mem_regions[],
>> +                          uint32_t *nr_regions)
>> +{
>> +    int rc;
>> +    uint32_t nr = *nr_regions;
>> +    struct xen_domctl domctl = {
>> +        .cmd         = XEN_DOMCTL_get_mem_map,
>> +        .domain      = domid,
>> +        .u.mem_map = {
>> +            .nr_mem_regions = nr,
>> +        },
>> +    };
>> +
>> +    DECLARE_HYPERCALL_BOUNCE(mem_regions, sizeof(xen_mem_region_t) * nr,
>> +                             XC_HYPERCALL_BUFFER_BOUNCE_OUT);
>> +
>> +    if ( !mem_regions || xc_hypercall_bounce_pre(xch, mem_regions) || nr < 1 )
> Why the nr < 1 part? For a caller to size the necessary buffer, it may want
> to pass in 0 (and a NULL buffer pointer) first.

I will drop this nr < 1 part.

>> @@ -176,6 +175,33 @@ long arch_do_domctl(struct xen_domctl *domctl, struct domain *d,
>>   
>>           return rc;
>>       }
>> +    case XEN_DOMCTL_get_mem_map:
>> +    {
>> +        int rc = 0;
>> +        uint32_t nr_regions;
> unsigned int (see ./CODING_STYLE)?

Ok, I will use unsigned int.

>> --- a/xen/include/public/arch-arm.h
>> +++ b/xen/include/public/arch-arm.h
>> @@ -223,6 +223,13 @@ typedef uint64_t xen_pfn_t;
>>    */
>>   #define XEN_LEGACY_MAX_VCPUS 1
>>   
>> +/*
>> + * Maximum number of memory map regions for guest memory layout.
>> + * Used by XEN_DOMCTL_get_mem_map, currently there is only one region
>> + * for the guest magic pages.
>> + */
>> +#define XEN_MAX_MEM_REGIONS 1
> Why is this in the public header? I can only find Xen-internal uses.

It will also be used in the init-dom0less app which is the toolstack side.

>> --- a/xen/include/public/domctl.h
>> +++ b/xen/include/public/domctl.h
>> @@ -946,6 +946,33 @@ struct xen_domctl_paging_mempool {
>>       uint64_aligned_t size; /* Size in bytes. */
>>   };
>>   
>> +#ifndef XEN_MAX_MEM_REGIONS
>> +#define XEN_MAX_MEM_REGIONS 1
>> +#endif
>> +
>> +struct xen_mem_region {
>> +    uint64_aligned_t start;
>> +    uint64_aligned_t size;
>> +#define XEN_MEM_REGION_DEFAULT    0
> I can't spot any use of this. What's its purpose?

I can drop it. My original intention is to define a default type since 
the struct arch_domain should be zalloc-ed.

>> +#define XEN_MEM_REGION_MAGIC      1
>> +    uint32_t         type;
>> +    /* Must be zero */
>> +    uint32_t         pad;
> This being OUT only, I don't think the comment makes sense. I'd omit it
> completely; if you absolutely want one, please say "will" instead of "must".

Sure, I will follow your suggestion. Thanks.

Kind regards,
Henry


>
> Jan


