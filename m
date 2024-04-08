Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1779D89B658
	for <lists+xen-devel@lfdr.de>; Mon,  8 Apr 2024 05:20:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.701707.1096069 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rtfY5-00034e-Mq; Mon, 08 Apr 2024 03:19:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 701707.1096069; Mon, 08 Apr 2024 03:19:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rtfY5-00031c-K6; Mon, 08 Apr 2024 03:19:57 +0000
Received: by outflank-mailman (input) for mailman id 701707;
 Mon, 08 Apr 2024 03:19:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=pPud=LN=amd.com=Xin.Wang2@srs-se1.protection.inumbo.net>)
 id 1rtfY4-00031W-Fu
 for xen-devel@lists.xenproject.org; Mon, 08 Apr 2024 03:19:56 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20601.outbound.protection.outlook.com
 [2a01:111:f403:2412::601])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id dd8d5fb3-f556-11ee-a1ef-f123f15fe8a2;
 Mon, 08 Apr 2024 05:19:54 +0200 (CEST)
Received: from PH0P220CA0030.NAMP220.PROD.OUTLOOK.COM (2603:10b6:510:d3::30)
 by DS0PR12MB8562.namprd12.prod.outlook.com (2603:10b6:8:164::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.47; Mon, 8 Apr
 2024 03:19:50 +0000
Received: from SN1PEPF00036F43.namprd05.prod.outlook.com
 (2603:10b6:510:d3:cafe::a3) by PH0P220CA0030.outlook.office365.com
 (2603:10b6:510:d3::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.28 via Frontend
 Transport; Mon, 8 Apr 2024 03:19:48 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SN1PEPF00036F43.mail.protection.outlook.com (10.167.248.27) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7452.22 via Frontend Transport; Mon, 8 Apr 2024 03:19:48 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Sun, 7 Apr
 2024 22:19:48 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Sun, 7 Apr
 2024 22:19:47 -0500
Received: from [10.69.48.49] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Sun, 7 Apr 2024 22:19:46 -0500
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
X-Inumbo-ID: dd8d5fb3-f556-11ee-a1ef-f123f15fe8a2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=J+lLzDXz7+NvMfYgAI2awhODtj8AfWM/mdIufuEY12PTNqkUqglgjJwMFaO7Eh5zepGPMZvCR/qrU+sKw8R0dSwOhfB5v98QAdBCG36qNjNg4mrXVsuBOE+Ga0eYTFNp1ygQdlTvqaKR5uIM2Cti4OHf+yE5z4ZjIRUJ2Hu0AHb7quz/9mjd7hIghJSRdJCmjlEivs1R64OTb5z1cpLnLifXh5YL5c9mmgnvN55jHoNRAS07d4h3BSvWBcB1tJ9iF27DLjBAtdQTZc7mJ942N3/FCrLDpZe4t9/5W7HqA1NuzHwynAbeHjPrFsoueHpJhZtH41gTOcRbTgb0r5O8YA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lYDGbwFQ7NFXrxe0ro+FDYqgg/xrnd98fKiG3yqntXk=;
 b=Migb07arE46hmUTJo+OkuEkhUCxVdncKyCJ66uqfZZiBkKLZGX4/MhvnbnsTYIFVwtLWRWpxHl+AkCu6WMF1yaFwV63ao0brlbpzmQzRMXnCbX/87zNW5rV8tagifiZhH3et36ix3YtyI1kSuWbq26atxBYkiGs9HqMzI+H3ozWNFYz4V1B/qruKtrLkG5K9Mmlqkp93VbZGz6TASewNBQlZAj3CAx4Bi0HEaZT5ykKZ4xgWwsVFiu8xJtR2oBbuCk4pjcD+qH9tqWnZAvJYwWz5uAEjqGvMq6A26+S2tFgaG0rI4W18XYUws23v1zc/xpeqAq5um0+YTgJQtIl7gQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lYDGbwFQ7NFXrxe0ro+FDYqgg/xrnd98fKiG3yqntXk=;
 b=n+QuO0UFNd7w50p1rCcBY2yiExIHE6NPslz88yEC9bg9kSpkraf3sS0CLREYnDRmvuKMQNwjEHxLcGs1PhDYakAS9xChRPA8tFwJRokp76lauUR64abg91V3xlRccwhrGSkrg7wkmDen5yLm3Rr5hLwLKs+sYbKUjoupS3qg+G8=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <09cc419a-cdf6-4cda-90f1-c0e1ae83ad47@amd.com>
Date: Mon, 8 Apr 2024 11:19:45 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/4] xen/memory, tools: Avoid hardcoding
 GUEST_MAGIC_BASE in init-dom0less
To: Jan Beulich <jbeulich@suse.com>
CC: Anthony PERARD <anthony.perard@citrix.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>,
	"Julien Grall" <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
	"Alec Kwapis" <alec.kwapis@medtronic.com>, <xen-devel@lists.xenproject.org>
References: <20240403081626.375313-1-xin.wang2@amd.com>
 <20240403081626.375313-5-xin.wang2@amd.com>
 <e9167c39-187f-4a66-b9a4-8b3a6ae3000b@suse.com>
Content-Language: en-US
From: Henry Wang <xin.wang2@amd.com>
In-Reply-To: <e9167c39-187f-4a66-b9a4-8b3a6ae3000b@suse.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF00036F43:EE_|DS0PR12MB8562:EE_
X-MS-Office365-Filtering-Correlation-Id: ba64a74d-a332-4376-1784-08dc577abf46
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	MqvqVzhr6PPz/7CpQeVRfwdEA5ihXjDMBxvnVjVFgT2TQpYY1yBtx1TVcf2RxxYbLjGD6KruQ+qdZ7jMBN/GbFcm74qJ4BlM0PQHP1WZJZc4tCqr/eK6hft5anDk/+94cvTWWqvlhvik19iXur0u0vTiYvkKb7PNSeRuitfbInd1GFe8UOaHmMyfNyPFWOCqr880lBUTxCAiJ67Ob5oIcQLDiVPCryfoGr3NJcYX20LKrS4Gzx/M+Zyk8sTazu4b4hxv3kuai1VUdeqRRkqHsOSBtkB3Q/ezCqlBDxn6uAa7JIP8tLWM5Rj2h46ar/P1ngPmGrjv7pBxyrkukhJg0DrvCLdGbxJF2sSDCobLySx4TFRdnLeUkSCSAv2BKYgPweWQaDBhIzuGlm9arNk+EcTsKXufOIb5h9zmkaXZhRKeevHk6i9s1gCafRCeW/i3ATrtAvvYTiMBarGxobGibSuNGZPpyPoEJlp6JiA5aH17PXr0E0Fj5ZW8gpmJf9q77BzHQ7We0GyuGeROZrDIg/fqyAimx3NII8gAJwfG4/LmQCMRR6evq7cSXez/ts81at5PZPEsxd1yBMiPNiWa2X9KR8DnVR8PEh4QpmdpfQKtLXsSwfQ26zdM4gqZJnRBzmUrWElfWjuF1GdfZkppKPuN36ZrpI8xXkEgeAP/Jh6uyUQzCsZJ61ZEAV8dRTL33zLVkNYcuz26wBq9cbY9IxDMOM7g7Mll9fUF9ElLNPEedpdzgySnPxqnDC7pWaqj
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(36860700004)(82310400014)(376005)(1800799015);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2024 03:19:48.5811
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ba64a74d-a332-4376-1784-08dc577abf46
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF00036F43.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8562

Hi Jan,

On 4/4/2024 5:38 PM, Jan Beulich wrote:
> On 03.04.2024 10:16, Henry Wang wrote:
>> --- a/xen/common/memory.c
>> +++ b/xen/common/memory.c
>> @@ -219,7 +219,8 @@ static void populate_physmap(struct memop_args *a)
>>           }
>>           else
>>           {
>> -            if ( is_domain_direct_mapped(d) )
>> +            if ( is_domain_direct_mapped(d) &&
>> +                 !(a->memflags & MEMF_force_heap_alloc) )
>>               {
>>                   mfn = _mfn(gpfn);
>>   
>> @@ -246,7 +247,8 @@ static void populate_physmap(struct memop_args *a)
>>   
>>                   mfn = _mfn(gpfn);
>>               }
>> -            else if ( is_domain_using_staticmem(d) )
>> +            else if ( is_domain_using_staticmem(d) &&
>> +                      !(a->memflags & MEMF_force_heap_alloc) )
>>               {
>>                   /*
>>                    * No easy way to guarantee the retrieved pages are contiguous,
>> @@ -271,6 +273,14 @@ static void populate_physmap(struct memop_args *a)
>>               }
>>               else
>>               {
>> +                /*
>> +                 * Avoid passing MEMF_force_heap_alloc down to
>> +                 * alloc_domheap_pages() where the meaning would be the
>> +                 * original MEMF_no_refcount.
>> +                 */
>> +                if ( unlikely(a->memflags & MEMF_force_heap_alloc) )
>> +                    clear_bit(_MEMF_force_heap_alloc, &a->memflags);
> Why an atomic operation? &= will to quite fine here. And you can also
> drop the if().

Ok, I will use &= and drop the if here.

>> @@ -1408,6 +1418,10 @@ long do_memory_op(unsigned long cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
>>           if ( copy_from_guest(&reservation, arg, 1) )
>>               return start_extent;
>>   
>> +        if ( op != XENMEM_populate_physmap
>> +             && (reservation.mem_flags & XENMEMF_force_heap_alloc) )
>> +            return -EINVAL;
>> +
>>           /* Is size too large for us to encode a continuation? */
>>           if ( reservation.nr_extents > (UINT_MAX >> MEMOP_EXTENT_SHIFT) )
>>               return start_extent;
>> @@ -1433,6 +1447,10 @@ long do_memory_op(unsigned long cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
>>                && (reservation.mem_flags & XENMEMF_populate_on_demand) )
>>               args.memflags |= MEMF_populate_on_demand;
>>   
>> +        if ( op == XENMEM_populate_physmap
>> +             && (reservation.mem_flags & XENMEMF_force_heap_alloc) )
>> +            args.memflags |= MEMF_force_heap_alloc;
> If in the end no new sub-op is used (see below), this and the earlier if()
> want combining.
>
> You further may want to assert that the flag isn't already set (as coming
> back from construct_memop_from_reservation()).

Ok I will check and do the combining as suggested. Thanks!

>> --- a/xen/include/public/memory.h
>> +++ b/xen/include/public/memory.h
>> @@ -41,6 +41,11 @@
>>   #define XENMEMF_exact_node(n) (XENMEMF_node(n) | XENMEMF_exact_node_request)
>>   /* Flag to indicate the node specified is virtual node */
>>   #define XENMEMF_vnode  (1<<18)
>> +/*
>> + * Flag to force populate physmap to use pages from domheap instead of 1:1
>> + * or static allocation.
>> + */
>> +#define XENMEMF_force_heap_alloc  (1<<19)
> As before, a separate new sub-op would look to me as being the cleaner
> approach, avoiding the need to consume a bit position for something not
> even going to be used on all architectures.

Like discussed in v2, I doubt that if introducing a new sub-op, the 
helpers added to duplicate mainly populate_physmap() and the toolstack 
helpers would be a good idea. Similarly as the way that we do for the 
MEMF_force_heap_alloc, if in the future we run out of the bit positions, 
can't we reuse this bit for different architectures as an alias? Or 
maybe we can even alias it now?

>> --- a/xen/include/xen/mm.h
>> +++ b/xen/include/xen/mm.h
>> @@ -192,6 +192,13 @@ struct npfec {
>>   /* memflags: */
>>   #define _MEMF_no_refcount 0
>>   #define  MEMF_no_refcount (1U<<_MEMF_no_refcount)
>> +/*
>> + * Alias of _MEMF_no_refcount to avoid introduction of a new, single-use flag.
>> + * This flag should be used for populate_physmap() only as a re-purposing of
>> + * _MEMF_no_refcount to force a non-1:1 allocation from domheap.
>> + */
>> +#define _MEMF_force_heap_alloc _MEMF_no_refcount
>> +#define  MEMF_force_heap_alloc (1U<<_MEMF_force_heap_alloc)
> Given its purpose and scope, this alias wants to be local to common/memory.c.

Sure, I will move it to common/memory.c

Kind regards,
Henry

> Jan


