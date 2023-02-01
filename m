Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CA5516864FA
	for <lists+xen-devel@lfdr.de>; Wed,  1 Feb 2023 12:03:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.488252.756254 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pNAs6-00025M-Sw; Wed, 01 Feb 2023 11:01:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 488252.756254; Wed, 01 Feb 2023 11:01:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pNAs6-00022q-Pe; Wed, 01 Feb 2023 11:01:46 +0000
Received: by outflank-mailman (input) for mailman id 488252;
 Wed, 01 Feb 2023 11:01:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jhIt=55=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1pNAs5-00022k-9G
 for xen-devel@lists.xenproject.org; Wed, 01 Feb 2023 11:01:45 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on20606.outbound.protection.outlook.com
 [2a01:111:f400:7e8a::606])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cdd614b3-a21f-11ed-933c-83870f6b2ba8;
 Wed, 01 Feb 2023 12:01:43 +0100 (CET)
Received: from BL1PR13CA0344.namprd13.prod.outlook.com (2603:10b6:208:2c6::19)
 by SA1PR12MB8096.namprd12.prod.outlook.com (2603:10b6:806:326::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.36; Wed, 1 Feb
 2023 11:01:36 +0000
Received: from BL02EPF0000EE3D.namprd05.prod.outlook.com
 (2603:10b6:208:2c6:cafe::9e) by BL1PR13CA0344.outlook.office365.com
 (2603:10b6:208:2c6::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.23 via Frontend
 Transport; Wed, 1 Feb 2023 11:01:35 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BL02EPF0000EE3D.mail.protection.outlook.com (10.167.241.134) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6064.17 via Frontend Transport; Wed, 1 Feb 2023 11:01:35 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Wed, 1 Feb
 2023 05:01:34 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Wed, 1 Feb
 2023 03:01:34 -0800
Received: from [10.71.193.39] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Wed, 1 Feb 2023 05:01:33 -0600
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
X-Inumbo-ID: cdd614b3-a21f-11ed-933c-83870f6b2ba8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KoLtJllTs53MF2baJot+Vq82a+7GBG9McejUP0WgiglhY5jyn5V6m8L+lioT1Y0JLZLmj+E2IcNP1Dpu03MwzD4rrLRsAxDjNNbr6AEktGWnNLKqSRpXXyNL4dZMn00AqRf/e8bkSY33BwAJh7MIiuSuPyf7mzmlc7/ZM6HGxprgHcC2YbBu0pdaNKIbAz588GvpI73fACSRkWC64RrkGMGDVEKDfvBEont1TUrhVsgo6gcJbo3Be3iECWbE5oO3hQIN9KuRWxVkk0rDcvaR1cDHGBwt3l7uft13x/keDnKSm1gbAoWOoYBo1vAjrAIClLx5E0yi68mmdIM1MKkCIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4rSbgbvsXDXbX9imJdiM0rAQK/eUPXBqxvzJH2t3+LA=;
 b=Ve7MexTTRE5hmEYxYgZdWIZBoU/yWVzLmwq9jG5OCfvhI0Qmf8+0qBIopLxl9bJqbl2UKK76k0WsZVNvZlZ+cpBrFJxtj6VXyyizpElRGNn20irTerQC5rwEMzaX0SU88eGmX2r2wBSQkd/2ZqBAU57h/A4N2Fqz2P0RTgYoXcqkJ20wI0cJfOGCT5zUXSrQ6mvi97k5gTldmgZcwgadir5NR2Edpq04PBiPX3J04moEnfpLEmAX7wMGXIWjir1oISi7bIHnBiBiE8LT7rE//teB+GzvW1ijPt8Ug2WJiyXjpPBIBbqu6am4srebXhmxdfE2a6bxTbk02b6C2bLalw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=xen.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4rSbgbvsXDXbX9imJdiM0rAQK/eUPXBqxvzJH2t3+LA=;
 b=rCCnznG/5qEjsRE5Xffg1O/hpeC7RPoM1G7g5459DFzOkAG5qGhyT0uL/TBk4am6ckLH2jYhFSl7Nn8mYLrWkCeim7mECjiOGkVzgQgVUwY8Y7/zZDPMzpAZZBYzBd/YgCIfxPJlK8o9aCbHOEkbRfrRiaN7YbsTsf5TeYsHLxM=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <7c09b900-6568-e57d-3256-2cf72a73690c@amd.com>
Date: Wed, 1 Feb 2023 12:01:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH 2/2] xen/arm: Add support for booting gzip compressed
 uImages
Content-Language: en-US
To: Julien Grall <julien@xen.org>, <xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	<ayankuma@amd.com>
References: <20230131151354.25943-1-michal.orzel@amd.com>
 <20230131151354.25943-3-michal.orzel@amd.com>
 <653d05c1-a860-052c-4ce2-55998c77db42@xen.org>
 <442d7e6b-9b51-69bc-48ea-c844427a4a97@amd.com>
 <f45dfe55-ca51-7aa0-ef9a-2788cfead470@xen.org>
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <f45dfe55-ca51-7aa0-ef9a-2788cfead470@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0000EE3D:EE_|SA1PR12MB8096:EE_
X-MS-Office365-Filtering-Correlation-Id: fc2a5a31-e8f0-4239-4607-08db0443af68
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	MzHxsjyq6NoeBSNid97Y5fdlhPysJ6pEhqMSRo2ErL0ciKTtCPwZayFvkcpjhF87WDEpkbfV5DFcwGu2YvIPiBlWx6PoQ+hryj803zUm40GxOgxr61q9O//v5ejIo1yxFo7Wv3Iu9Jnh4GS0aqdevpRD656t3KiSyZQb/tM0dsAKqehpyiAEOcg/TKKm9xr08HL1zady4bc/YIkBxuPovXd2A12i/8fB88MFSqRpck/FU4C95+vMk1/4YqgnI30lP40vPD38rOHtcPlAJPHMmC66/a7fHsjcAm686JA2zH3JBS9YjrplvgJrSVVs9Ir17hYpXYlaxv8yosK5tBnChCJekKGS2Dwq8QJPfF6lWO/bNKCzBLZeBThdEE08bOBW78hQT68NgC2sOl9XNItEQCyWo+GTKNxP6jW6ilfO+4rK3n0EZ5YoA1HNvo9IXEqfBqbw5kCnp57WXozAg42gDYzdEgwHHHv7HxQt65QZeicBqCygfBB9XR5PT0eDJ3fDO2AE+cvODtiKCZOSEMd0W5+F0qdXuMKG0SktYJguw/kYNFDlCKo36wzY5Bbq08fSZiJ2OcNbLG8rJHJh3B9iQEaoCVWolfzzZ8Ki3q2e/ipHo1BeyNAznb4fCpGR6vw/hdiKY1rPMTK464yidcjDEsuglsdYYHH3zCGHCkWKt/fPK5Jm5l85ZJOSsG2Lw7I8lTygLt9tj0jXIaJdYIjEdLsxdK96Macn/xSdSXxzIDd9brRY4OpYl5Wky9hs3JjEB8iCDjUzr24X4xV1ZFI+tw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230025)(4636009)(39860400002)(376002)(396003)(136003)(346002)(451199018)(36840700001)(46966006)(40470700004)(356005)(81166007)(86362001)(70206006)(31696002)(82740400003)(54906003)(16576012)(36756003)(5660300002)(316002)(4326008)(36860700001)(70586007)(8936002)(8676002)(40460700003)(2906002)(40480700001)(44832011)(41300700001)(82310400005)(336012)(83380400001)(426003)(47076005)(478600001)(2616005)(26005)(186003)(53546011)(31686004)(110136005)(36900700001)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Feb 2023 11:01:35.4754
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fc2a5a31-e8f0-4239-4607-08db0443af68
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF0000EE3D.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB8096

Hi Julien,

On 01/02/2023 11:13, Julien Grall wrote:
> 
> 
> On 01/02/2023 09:48, Michal Orzel wrote:
>> Hi Julien,
> 
> Hi Michal,
> 
>>
>> On 31/01/2023 21:20, Julien Grall wrote:
>>>
>>>
>>> Hi,
>>>
>>> On 31/01/2023 15:13, Michal Orzel wrote:
>>>> At the moment, Xen does not support booting gzip compressed uImages.
>>>> This is because we are trying to decompress the kernel before probing
>>>> the u-boot header. This leads to a failure as the header always appears
>>>> at the top of the image (and therefore obscuring the gzip header).
>>>>
>>>> Move the call to kernel_uimage_probe before kernel_decompress and make
>>>> the function self-containing by taking the following actions:
>>>>    - take a pointer to struct bootmodule as a parameter,
>>>>    - check the comp field of a u-boot header to determine compression type,
>>>>    - in case of compressed image, modify boot module start address and size
>>>>      by taking the header size into account and call kernel_decompress,
>>>>    - set up zimage.{kernel_addr,len} accordingly,
>>>>    - return -ENOENT in case of a u-boot header not found to distinguish it
>>>>      amongst other return values and make it the only case for falling
>>>>      through to try to probe other image types.
>>>>
>>>> This is done to avoid splitting the uImage probing into 2 stages (executed
>>>> before and after decompression) which otherwise would be necessary to
>>>> properly update boot module start and size before decompression and
>>>> zimage.{kernel_addr,len} afterwards.
>>>
>>> AFAIU, it would be possible to have a zImage/Image header embedded in
>>> the uImage. So any reason to only handle a compressed binary?
>> Not sure if I understand you correctly as what you say is already supported.
>> The split or moving decompression is only needed in case of compressed uImage,
>> as u-boot header (not being part of compression) appears before gzip header.
>> This is not the case for zImage/Image header that is embedded into image
>> and gzip header is at the top.
> 
> [...]
> 
>>
>> In case of uImage added on top of zImage/Image, the load address/entry point are taken
>> from uImage header so basically the zImage/Image header is not parsed (this is
>> documented in our booting.txt).
> 
> This is the case I am talking about. I think we need to parrse
> zImage/Image because it may contain additional information about the
> placement (for instance Image has a field to indicate the real size in
> memory).
As it was said during discussion on Ayan's patch, adding u-boot header on top of zImage/Image
is not a common behavior and the purpose is questionable. Also I've never heard of any SW
that would parse both headers. After all that is why u-boot has booti (Image), bootz (zImage)
and bootm (uImage) commands. When using bootm to load Image/zImage with u-boot header, u-boot
does not read the Image/zImage header but only u-boot header (this is what Xen does at the moment
and was writeen by Ayan in documentation). If we really decide to do such a step (quite innovative :))
I would prefer not to do this in this series as the goals are different. This series is to remove
the known Xen limitation.

> 
>>
>> This patch makes the uImage compression works as the other combinations work fine already.
>> You can boot what you can already:
>> - zImage/Image
>> - compressed zImage/Image
>> - zImage/Image,raw with u-boot header
>> + this patch allows to boot:
>> - compressed uImage (i.e. zImage/Image/raw compressed with u-boot header)
>>
>>>
>>>>
>>>> Remove the limitation from the booting.txt documentation.
>>>>
>>>> Signed-off-by: Michal Orzel <michal.orzel@amd.com>
>>>> ---
>>>>    docs/misc/arm/booting.txt |  3 ---
>>>>    xen/arch/arm/kernel.c     | 51 ++++++++++++++++++++++++++++++++++-----
>>>>    2 files changed, 45 insertions(+), 9 deletions(-)
>>>>
>>>> diff --git a/docs/misc/arm/booting.txt b/docs/misc/arm/booting.txt
>>>> index bd7bfe7f284a..02f7bb65ec6d 100644
>>>> --- a/docs/misc/arm/booting.txt
>>>> +++ b/docs/misc/arm/booting.txt
>>>> @@ -50,9 +50,6 @@ Also, it is to be noted that if user provides the legacy image header on
>>>>    top of zImage or Image header, then Xen uses the attributes of legacy
>>>>    image header to determine the load address, entry point, etc.
>>>>
>>>> -Known limitation: compressed kernels with a uboot headers are not
>>>> -working.
>>>> -
>>>>
>>>>    Firmware/bootloader requirements
>>>>    --------------------------------
>>>> diff --git a/xen/arch/arm/kernel.c b/xen/arch/arm/kernel.c
>>>> index 068fbf88e492..ea5f9618169e 100644
>>>> --- a/xen/arch/arm/kernel.c
>>>> +++ b/xen/arch/arm/kernel.c
>>>> @@ -265,11 +265,14 @@ static __init int kernel_decompress(struct bootmodule *mod)
>>>>    #define IH_ARCH_ARM             2       /* ARM          */
>>>>    #define IH_ARCH_ARM64           22      /* ARM64        */
>>>>
>>>> +/* uImage Compression Types */
>>>> +#define IH_COMP_GZIP            1
>>>> +
>>>>    /*
>>>>     * Check if the image is a uImage and setup kernel_info
>>>>     */
>>>>    static int __init kernel_uimage_probe(struct kernel_info *info,
>>>> -                                      paddr_t addr, paddr_t size)
>>>> +                                      struct bootmodule *mod)
>>>>    {
>>>>        struct {
>>>>            __be32 magic;   /* Image Header Magic Number */
>>>> @@ -287,6 +290,8 @@ static int __init kernel_uimage_probe(struct kernel_info *info,
>>>>        } uimage;
>>>>
>>>>        uint32_t len;
>>>> +    paddr_t addr = mod->start;
>>>> +    paddr_t size = mod->size;
>>>>
>>>>        if ( size < sizeof(uimage) )
>>>>            return -EINVAL;
>>>> @@ -294,13 +299,21 @@ static int __init kernel_uimage_probe(struct kernel_info *info,
>>>>        copy_from_paddr(&uimage, addr, sizeof(uimage));
>>>>
>>>>        if ( be32_to_cpu(uimage.magic) != UIMAGE_MAGIC )
>>>> -        return -EINVAL;
>>>> +        return -ENOENT;
>>>>
>>>>        len = be32_to_cpu(uimage.size);
>>>>
>>>>        if ( len > size - sizeof(uimage) )
>>>>            return -EINVAL;
>>>>
>>>> +    /* Only gzip compression is supported. */
>>>> +    if ( uimage.comp && uimage.comp != IH_COMP_GZIP )
>>>> +    {
>>>> +        printk(XENLOG_ERR
>>>> +               "Unsupported uImage compression type %"PRIu8"\n", uimage.comp);
>>>> +        return -EOPNOTSUPP;
>>>> +    }
>>>> +
>>>>        info->zimage.start = be32_to_cpu(uimage.load);
>>>>        info->entry = be32_to_cpu(uimage.ep);
>>>>
>>>> @@ -330,8 +343,26 @@ static int __init kernel_uimage_probe(struct kernel_info *info,
>>>>            return -EINVAL;
>>>>        }
>>>>
>>>> -    info->zimage.kernel_addr = addr + sizeof(uimage);
>>>> -    info->zimage.len = len;
>>>> +    if ( uimage.comp )
>>>> +    {
>>>> +        int rc;
>>>> +
>>>> +        /* Prepare start and size for decompression. */
>>>> +        mod->start += sizeof(uimage);
>>>> +        mod->size -= sizeof(uimage);
>>>
>>> kernel_decompress() will free the compressed module once it is
>>> decompressed. By updating the region it means the free page will be not
>>> be freed (assuming start was previously page-aligned).
>> Ok, so the start address was previously page-aligned and by adding the uimage size
>> to it, it is no longer aligned. True. Do I understand you correctly that you refer
>> to the fw_unreserved_regions call from kernel_decompress where we will pass unaligned
>> address?
> 
> Correct.
> 
>> This could be solved by doing (not harmful in my opinion for common case)
>> addr &= PAGE_MASK.
> I don't quite understand your argument here. We need a check that work
> for everyone (not only in the common case).
As we assume the kernel module is at page aligned address (otherwise the issue you observed
can happen not only in uImage compressed case), having a check like
this is generic. I.e. for normal usecase (no uImage compressed), addr &= PAGE_MASK
does not modify the address. For uImage compressed usecase it causes the addr to get
back to the previous value (before we added header size to it).

Apart from the addr, we need to pass the correct size (as we extracted header size from it).
We could have the following (with appropriate comment):
size += addr - (addr & PAGE_MASK);
addr &= PAGE_MASK;
fw_unreserved_regions(addr, addr + size, init_domheap_pages, 0);

It does not look great but solves the uImage issue and does not modify
the previous behavior. Anyway, I'm open for suggestions.

> 
> Cheers,
> 
> --
> Julien Grall

~Michal

