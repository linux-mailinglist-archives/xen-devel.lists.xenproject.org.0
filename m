Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B70168631E
	for <lists+xen-devel@lfdr.de>; Wed,  1 Feb 2023 10:49:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.488241.756232 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pN9jw-00085k-9B; Wed, 01 Feb 2023 09:49:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 488241.756232; Wed, 01 Feb 2023 09:49:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pN9jw-00083F-5V; Wed, 01 Feb 2023 09:49:16 +0000
Received: by outflank-mailman (input) for mailman id 488241;
 Wed, 01 Feb 2023 09:49:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jhIt=55=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1pN9ju-000839-B0
 for xen-devel@lists.xenproject.org; Wed, 01 Feb 2023 09:49:14 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on20623.outbound.protection.outlook.com
 [2a01:111:f400:7e8a::623])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ab5fa491-a215-11ed-b63b-5f92e7d2e73a;
 Wed, 01 Feb 2023 10:49:08 +0100 (CET)
Received: from DM5PR08CA0028.namprd08.prod.outlook.com (2603:10b6:4:60::17) by
 IA1PR12MB6257.namprd12.prod.outlook.com (2603:10b6:208:3e7::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.38; Wed, 1 Feb
 2023 09:49:04 +0000
Received: from DS1PEPF0000E63A.namprd02.prod.outlook.com
 (2603:10b6:4:60:cafe::88) by DM5PR08CA0028.outlook.office365.com
 (2603:10b6:4:60::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.38 via Frontend
 Transport; Wed, 1 Feb 2023 09:49:04 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS1PEPF0000E63A.mail.protection.outlook.com (10.167.17.72) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6064.21 via Frontend Transport; Wed, 1 Feb 2023 09:49:03 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Wed, 1 Feb
 2023 03:49:03 -0600
Received: from [10.71.193.39] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Wed, 1 Feb 2023 03:48:36 -0600
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
X-Inumbo-ID: ab5fa491-a215-11ed-b63b-5f92e7d2e73a
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FpgUljH8EvM+GG/7Zrt+aMZ85SomS+8TxX7sP1gQNTp+kWNwBOlZW3+/rImbQm90itHByht4Z43vnX3y8NLP8qPgWL0/D+lfnsnSTBmlCTyVR4q9nx9TKSD1iYlt3y+y37guvSnkjjQ4smbfj0XrudkQqUgl/9sS4+0jDFqS0ZNrjzy+HnQB8/kA0bvctJPhvURQIH3+mSPfcSCecqUpQ1zjwhMM4Vszy6r8qgY683QGRxo46+ZCF/nv70NWPmrTnUfh/71w+w979I0vbh7azTjIGqbonG8c/GtC6H4K7f/ZdhcZCYIOI2GhlhEBxiUdWhvKalN7YRQTkucHwkm3zQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=olJacfv0aDshew5Y8dFglBHZkl47e7DRxAu0qEsJnzg=;
 b=XjYZuHVZDz6ztggE+1M7tHbqSjA4WPCXt62OQRVA/T/kdgvoVSKpCiLarLfJegTadnEDOLdfbBvUKMQ1Icl3Rgl9Oe983pAK0f6YoIQj5xeKRwI+sXO2kj0dpC2Tn+g7PAmVsKMUasiFE5QrG6yTBTShDJ2LbGUbSCp7kd+5yeaO7QlvFPq3rORaXxfSaJtkIdt9iSZCutPQRmnfI/e8Rq390lkJfiZlAo4NtB43B1HDJ4gWhuV47f4MCba5Bt35+RT8cL5kZcoA2MHEG1FWKWgXKYqCCQFqv6H3n8SDHZFSmmGXz9vBPAlWzTPbglbZuODcl/25IVauIGqHdhQHiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=xen.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=olJacfv0aDshew5Y8dFglBHZkl47e7DRxAu0qEsJnzg=;
 b=yok0QMUAbtPiD6upI4ayYJbis9F/7q3BPbCIof0c4HkQ0GkUbZkRH1QfFF9RzuE59xUSG6qnmpYTSNxDqwSYmfqJ82tlNAKcpFktnYypWsmzsJglwIBIdzJfT8QWBvHDPO8GUcY+EAiGZD0T+aiQIfvfNv8l3lbU3cwnRONKrYM=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <442d7e6b-9b51-69bc-48ea-c844427a4a97@amd.com>
Date: Wed, 1 Feb 2023 10:48:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH 2/2] xen/arm: Add support for booting gzip compressed
 uImages
To: Julien Grall <julien@xen.org>, <xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	<ayankuma@amd.com>
References: <20230131151354.25943-1-michal.orzel@amd.com>
 <20230131151354.25943-3-michal.orzel@amd.com>
 <653d05c1-a860-052c-4ce2-55998c77db42@xen.org>
Content-Language: en-US
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <653d05c1-a860-052c-4ce2-55998c77db42@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF0000E63A:EE_|IA1PR12MB6257:EE_
X-MS-Office365-Filtering-Correlation-Id: 53589b67-b16e-4be5-d6bb-08db04398da3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	+SCTI+nM/L5JBIkets4KojmKhZYau3tq3vYpmMoQuOYuzeGWc/5Im/jZocOI0yQDDSdR8o37T5o/rgvU7A7DfoJy5fKt1ZR+jVhtcB11UJef8lagF6NlXbQzldRqwwm1MLZXO0dG3avql4Ia1bWvzX9OZYrvcTeJq/W8CtRWxieoiHW+VrtoB/37Wudk5nHivcwzpw1/+w20Lc2qxdjpVhc70+EiaE36Ku/dO9wnlUCrJcnScLkROLMokZmLgFOH9xcmzJft58x7aFztCXByOEBET3n1KWqLU9xrUAN3Wu+R3RSFn32LegyWpTYVYudX+HYA2OkoDrZlFgerA8wqZ9mT1sZoPvXrbfbhVE26p1oa+RBwPNEtCPHZ5NfO8XL/A387TIlndAvPKkhxQMkrfR2zA56Lue7WMAAAoH/8H8AEaKQvBrF5DFyBYTjXr4JcJNHdidW9gEWgmt+hoZ/HbAHIm1R+gFNFIOld8bYZQnOjnEbpjyclNv/iT/0edWT4Iyo/nwLVrV0fR8i8buA1LGhbNQCEIBCiUNnuguJFXOr/zBpyhCio8NHlmZqyhw6Rm+/9iZyvp+8toqwO12xkEWlGIIystH96Gd/UTOyZ2YqwicqNh6nAtARYPC2PPTSRBFjyds2nqG3k3ihmRptgsJefPG97f9RN9d204VD72T6vJN1rJy9z3cJXEbTXV85Hzgy37Da5MDmj0l8BsTNmSugPC2Jgoso41H8p/JqXrVmabU0yMsB+nnwq5fJhg7x4egwUX+7PQMkfBeTNan596g==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230025)(4636009)(39860400002)(136003)(376002)(396003)(346002)(451199018)(36840700001)(46966006)(40470700004)(36756003)(110136005)(426003)(47076005)(16576012)(54906003)(83380400001)(82310400005)(2906002)(44832011)(82740400003)(316002)(81166007)(36860700001)(31686004)(2616005)(53546011)(478600001)(186003)(70586007)(26005)(70206006)(8676002)(31696002)(336012)(40460700003)(41300700001)(356005)(5660300002)(86362001)(4326008)(8936002)(40480700001)(36900700001)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Feb 2023 09:49:03.8247
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 53589b67-b16e-4be5-d6bb-08db04398da3
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS1PEPF0000E63A.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6257

Hi Julien,

On 31/01/2023 21:20, Julien Grall wrote:
> 
> 
> Hi,
> 
> On 31/01/2023 15:13, Michal Orzel wrote:
>> At the moment, Xen does not support booting gzip compressed uImages.
>> This is because we are trying to decompress the kernel before probing
>> the u-boot header. This leads to a failure as the header always appears
>> at the top of the image (and therefore obscuring the gzip header).
>>
>> Move the call to kernel_uimage_probe before kernel_decompress and make
>> the function self-containing by taking the following actions:
>>   - take a pointer to struct bootmodule as a parameter,
>>   - check the comp field of a u-boot header to determine compression type,
>>   - in case of compressed image, modify boot module start address and size
>>     by taking the header size into account and call kernel_decompress,
>>   - set up zimage.{kernel_addr,len} accordingly,
>>   - return -ENOENT in case of a u-boot header not found to distinguish it
>>     amongst other return values and make it the only case for falling
>>     through to try to probe other image types.
>>
>> This is done to avoid splitting the uImage probing into 2 stages (executed
>> before and after decompression) which otherwise would be necessary to
>> properly update boot module start and size before decompression and
>> zimage.{kernel_addr,len} afterwards.
> 
> AFAIU, it would be possible to have a zImage/Image header embedded in
> the uImage. So any reason to only handle a compressed binary?
Not sure if I understand you correctly as what you say is already supported.
The split or moving decompression is only needed in case of compressed uImage,
as u-boot header (not being part of compression) appears before gzip header.
This is not the case for zImage/Image header that is embedded into image
and gzip header is at the top.

In case of uImage added on top of zImage/Image, the load address/entry point are taken
from uImage header so basically the zImage/Image header is not parsed (this is
documented in our booting.txt).

This patch makes the uImage compression works as the other combinations work fine already.
You can boot what you can already:
- zImage/Image
- compressed zImage/Image
- zImage/Image,raw with u-boot header
+ this patch allows to boot:
- compressed uImage (i.e. zImage/Image/raw compressed with u-boot header)

> 
>>
>> Remove the limitation from the booting.txt documentation.
>>
>> Signed-off-by: Michal Orzel <michal.orzel@amd.com>
>> ---
>>   docs/misc/arm/booting.txt |  3 ---
>>   xen/arch/arm/kernel.c     | 51 ++++++++++++++++++++++++++++++++++-----
>>   2 files changed, 45 insertions(+), 9 deletions(-)
>>
>> diff --git a/docs/misc/arm/booting.txt b/docs/misc/arm/booting.txt
>> index bd7bfe7f284a..02f7bb65ec6d 100644
>> --- a/docs/misc/arm/booting.txt
>> +++ b/docs/misc/arm/booting.txt
>> @@ -50,9 +50,6 @@ Also, it is to be noted that if user provides the legacy image header on
>>   top of zImage or Image header, then Xen uses the attributes of legacy
>>   image header to determine the load address, entry point, etc.
>>
>> -Known limitation: compressed kernels with a uboot headers are not
>> -working.
>> -
>>
>>   Firmware/bootloader requirements
>>   --------------------------------
>> diff --git a/xen/arch/arm/kernel.c b/xen/arch/arm/kernel.c
>> index 068fbf88e492..ea5f9618169e 100644
>> --- a/xen/arch/arm/kernel.c
>> +++ b/xen/arch/arm/kernel.c
>> @@ -265,11 +265,14 @@ static __init int kernel_decompress(struct bootmodule *mod)
>>   #define IH_ARCH_ARM             2       /* ARM          */
>>   #define IH_ARCH_ARM64           22      /* ARM64        */
>>
>> +/* uImage Compression Types */
>> +#define IH_COMP_GZIP            1
>> +
>>   /*
>>    * Check if the image is a uImage and setup kernel_info
>>    */
>>   static int __init kernel_uimage_probe(struct kernel_info *info,
>> -                                      paddr_t addr, paddr_t size)
>> +                                      struct bootmodule *mod)
>>   {
>>       struct {
>>           __be32 magic;   /* Image Header Magic Number */
>> @@ -287,6 +290,8 @@ static int __init kernel_uimage_probe(struct kernel_info *info,
>>       } uimage;
>>
>>       uint32_t len;
>> +    paddr_t addr = mod->start;
>> +    paddr_t size = mod->size;
>>
>>       if ( size < sizeof(uimage) )
>>           return -EINVAL;
>> @@ -294,13 +299,21 @@ static int __init kernel_uimage_probe(struct kernel_info *info,
>>       copy_from_paddr(&uimage, addr, sizeof(uimage));
>>
>>       if ( be32_to_cpu(uimage.magic) != UIMAGE_MAGIC )
>> -        return -EINVAL;
>> +        return -ENOENT;
>>
>>       len = be32_to_cpu(uimage.size);
>>
>>       if ( len > size - sizeof(uimage) )
>>           return -EINVAL;
>>
>> +    /* Only gzip compression is supported. */
>> +    if ( uimage.comp && uimage.comp != IH_COMP_GZIP )
>> +    {
>> +        printk(XENLOG_ERR
>> +               "Unsupported uImage compression type %"PRIu8"\n", uimage.comp);
>> +        return -EOPNOTSUPP;
>> +    }
>> +
>>       info->zimage.start = be32_to_cpu(uimage.load);
>>       info->entry = be32_to_cpu(uimage.ep);
>>
>> @@ -330,8 +343,26 @@ static int __init kernel_uimage_probe(struct kernel_info *info,
>>           return -EINVAL;
>>       }
>>
>> -    info->zimage.kernel_addr = addr + sizeof(uimage);
>> -    info->zimage.len = len;
>> +    if ( uimage.comp )
>> +    {
>> +        int rc;
>> +
>> +        /* Prepare start and size for decompression. */
>> +        mod->start += sizeof(uimage);
>> +        mod->size -= sizeof(uimage);
> 
> kernel_decompress() will free the compressed module once it is
> decompressed. By updating the region it means the free page will be not
> be freed (assuming start was previously page-aligned).
Ok, so the start address was previously page-aligned and by adding the uimage size
to it, it is no longer aligned. True. Do I understand you correctly that you refer
to the fw_unreserved_regions call from kernel_decompress where we will pass unaligned
address? This could be solved by doing (not harmful in my opinion for common case)
addr &= PAGE_MASK.

> 
>> +
>> +        rc = kernel_decompress(mod);
>> +        if ( rc )
>> +            return rc;
>> +
>> +        info->zimage.kernel_addr = mod->start;
>> +        info->zimage.len = mod->size;
>> +    }
>> +    else
>> +    {
>> +        info->zimage.kernel_addr = addr + sizeof(uimage);
>> +        info->zimage.len = len;
>> +    }
>>
>>       info->load = kernel_zimage_load;
>>
>> @@ -561,6 +592,16 @@ int __init kernel_probe(struct kernel_info *info,
>>           printk("Loading ramdisk from boot module @ %"PRIpaddr"\n",
>>                  info->initrd_bootmodule->start);
>>
>> +    /*
>> +     * uImage header always appears at the top of the image (even compressed),
>> +     * so it needs to be probed first. Note that in case of compressed uImage,
>> +     * kernel_decompress is called from kernel_uimage_probe making the function
>> +     * self-containing (i.e. fall through only in case of a header not found).
>> +    */
>> +    rc = kernel_uimage_probe(info, mod);
>> +    if ( rc != -ENOENT )
>> +        return rc;
>> +
>>       /* if it is a gzip'ed image, 32bit or 64bit, uncompress it */
>>       rc = kernel_decompress(mod);
>>       if ( rc && rc != -EINVAL )
>> @@ -570,8 +611,6 @@ int __init kernel_probe(struct kernel_info *info,
>>       rc = kernel_zimage64_probe(info, mod->start, mod->size);
>>       if (rc < 0)
>>   #endif
>> -        rc = kernel_uimage_probe(info, mod->start, mod->size);
>> -    if (rc < 0)
>>           rc = kernel_zimage32_probe(info, mod->start, mod->size);
>>
>>       return rc;
> Cheers,
> 
> --
> Julien Grall

~Michal

