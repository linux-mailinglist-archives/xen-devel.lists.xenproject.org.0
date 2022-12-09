Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B36D647F99
	for <lists+xen-devel@lfdr.de>; Fri,  9 Dec 2022 09:54:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.457695.715661 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p3Z8I-0007H8-A0; Fri, 09 Dec 2022 08:53:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 457695.715661; Fri, 09 Dec 2022 08:53:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p3Z8I-0007EA-6W; Fri, 09 Dec 2022 08:53:26 +0000
Received: by outflank-mailman (input) for mailman id 457695;
 Fri, 09 Dec 2022 08:53:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pcfL=4H=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1p3Z8G-0007E3-KP
 for xen-devel@lists.xenproject.org; Fri, 09 Dec 2022 08:53:24 +0000
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on20616.outbound.protection.outlook.com
 [2a01:111:f400:7e8c::616])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ee8eb9d3-779e-11ed-91b6-6bf2151ebd3b;
 Fri, 09 Dec 2022 09:53:22 +0100 (CET)
Received: from DM5PR07CA0093.namprd07.prod.outlook.com (2603:10b6:4:ae::22) by
 BL3PR12MB6572.namprd12.prod.outlook.com (2603:10b6:208:38f::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.16; Fri, 9 Dec
 2022 08:53:17 +0000
Received: from DM6NAM11FT020.eop-nam11.prod.protection.outlook.com
 (2603:10b6:4:ae:cafe::49) by DM5PR07CA0093.outlook.office365.com
 (2603:10b6:4:ae::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.18 via Frontend
 Transport; Fri, 9 Dec 2022 08:53:17 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT020.mail.protection.outlook.com (10.13.172.224) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5901.17 via Frontend Transport; Fri, 9 Dec 2022 08:53:16 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Fri, 9 Dec
 2022 02:53:16 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Fri, 9 Dec
 2022 00:53:15 -0800
Received: from [10.71.193.33] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Fri, 9 Dec 2022 02:53:14 -0600
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
X-Inumbo-ID: ee8eb9d3-779e-11ed-91b6-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ebQb+5xa19pxli0b3uBdwCM71bhw1UKu0qX23ApW/pKSduAyFYwiNdcD80+AIqfVsnjSx6R+cdUh9F/MZWl2573oA8RlBXqMeHLRcXqedjXlczYdb8YgeXvtbcuHMdLyg3JUKV4JRNi9Rm1gq5bHVRB6iIeDENeMdEKZWu+OBioVpX0EW2nzGhyW4bsuXq44/t0UBPgE3WS1mkzuAzGY5fnxm0ZCUisE7L4gZAXGele166QCyGp7C1YzlmoNfanuAatsdQoOkNH4uv9c61NQ8yI5rpHXVrQIfyLwaUwimJeRYHSplavj6zFvVEI1IB6GZB4EhwtgtFJTqrltq2S4/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0A6H4cCEjUmuonuaVlnTiwc3qAkW9W1Fzc6f9S9e5ZM=;
 b=eOFfzLxBZ1Fbxm9o4i7EH3c+hKbRYebfnx94ctcBp5JdVvWP7Hm3mE1/mS1p3bY6l3b8wnlVoPFKP6ig7H7ZFfoK5gwKObDcUPopzmVbMilqDleNjG3VTAiW5TlGYHLhozcCvOca66duQg1GKJLQN7PZzBmkDAVMhnqgWjCEZrRDyfKa+30IODSvqWHeenuKFeF+DDYmvfV5R5Y6jx0dMNyZC2p6jv2LOfR5dcOxaWSVDcdgs3LoSqPkht7nu6O1RXBl9yuOcfRxtI/N/iFTFKpdIFE/W639t4qeokSpF6K758tP8PIYlU0vUO48iHJUuGGedXWUc3QF6pQCLmlCrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=xen.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0A6H4cCEjUmuonuaVlnTiwc3qAkW9W1Fzc6f9S9e5ZM=;
 b=0ZgpGZxADseOnPX+RyDRtluGas/Z2TbWTUuX5GNHhBDbp3hxbOxydE6I3URlznGEAxLsGo1wllLTiI/qWeP8u8vsEjqCSvoLdKiA0da7kvB3n6sdVLbIVFhZmD5KW1x893GNb93pui6x+qB46/FZ2bAFcidZX+4GR5rity9vchw=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <00793926-ef60-405b-e450-b42ccf939f5e@amd.com>
Date: Fri, 9 Dec 2022 09:53:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [XEN v1] xen/Arm: Probe the entry point address of an uImage
 correctly
To: Ayan Kumar Halder <ayankuma@amd.com>, Julien Grall <julien@xen.org>, "Ayan
 Kumar Halder" <ayan.kumar.halder@amd.com>, <xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>, <stefanos@xilinx.com>,
	<Volodymyr_Babchuk@epam.com>, <bertrand.marquis@arm.com>, "Oleksandr
 Tyshchenko" <oleksandr_tyshchenko@epam.com>
References: <20221208124929.55268-1-ayan.kumar.halder@amd.com>
 <1ad3ee8c-991f-6e15-255f-ccc24dd5b84f@xen.org>
 <e8aff19a-4992-9d35-4e78-9e64aec384f9@amd.com>
 <00ab59fa-d449-255b-bfe3-aaacb87e34dd@xen.org>
 <ca2db58b-0183-8972-0336-25bcabc99824@amd.com>
Content-Language: en-US
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <ca2db58b-0183-8972-0336-25bcabc99824@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT020:EE_|BL3PR12MB6572:EE_
X-MS-Office365-Filtering-Correlation-Id: d63be598-db55-44e9-6eaf-08dad9c2d055
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	l/IJILFpfudu6CBNGS5TngUC+XqPk1lClJ6OZ1K9uGq3+GhXvOXYILl0/EYi3vZTKLHV5aUv1T9Xp+D5fqAkTSai6r87XBYUUZexuy661FDTMQ1F241aUb5VjpIKKvJ3JNz0g3a8EZL8SBUNK+6gjuTunmwLQhqGQsEPue4sJEGKfFFS5NvU+myMH4fx4QMo7wgkYBEV4lieKlEp8yJ3SuOmZyzNVHrzn3uWUM0xgoAJn2CTWRwkTDRHmdO0mg29xUcxZhnpPMV/6yOAGJ53uKvvzuhW8hngL1z3bkFhkRuY3sUtmAhgBB6QwkmGH4Rh/7F79hjlCmNqo7SpkoqFTIUs9X1CDJmHrfEroYzgquSRuJ+CtJBRUlhemAiNyljOKOSU7y/2zU1MtIVlDoV5aPmklzUCjQqylsCVGV49s/EQbVCxNXt7xOVVn81AjfC2mqXIL/vDPsJjNIxi49ND7/JbtcVyVD3vAA58PwKQDgfLg8W/z/jgI0pImsUMilAj6azeDypwqhuy/JGQW+FtvKva6HO0aq49dWjxxzbmQNso3QdA6GEz4OuSbpLkzyjRXho8vaRPsjp9jixAiW/sbavVdbb1XyqO7QaL+IJF/YHVAgbTHW+9dj8oejfyiYQXiJkpsDb/5tnyRK/z9JEpXZwluuGktIhbNIWBeouy6lMGaIIAeWU/+rsuDgeFUbI3l4Iu/vT4HDjKTwF6b2IFeXh8NiypUvuU+tmJh8KVJ3Ouvpzj2YIj+fzbTCqnXW+o5g0uKxAwuBxMhBPR2+s75Cnd279tnWBWzGFE5EQ95Ow=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(136003)(346002)(376002)(396003)(451199015)(40470700004)(46966006)(36840700001)(8676002)(86362001)(2906002)(31686004)(44832011)(41300700001)(40460700003)(8936002)(110136005)(54906003)(70206006)(16576012)(70586007)(4326008)(5660300002)(316002)(31696002)(478600001)(36860700001)(82740400003)(36756003)(82310400005)(53546011)(966005)(26005)(47076005)(426003)(336012)(83380400001)(81166007)(356005)(40480700001)(2616005)(186003)(36900700001)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Dec 2022 08:53:16.7707
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d63be598-db55-44e9-6eaf-08dad9c2d055
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DM6NAM11FT020.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR12MB6572


On 08/12/2022 19:42, Ayan Kumar Halder wrote:
> 
> On 08/12/2022 16:53, Julien Grall wrote:
>> Hi,
> Hi,
>>
>> On 08/12/2022 15:24, Michal Orzel wrote:
>>> On 08/12/2022 14:51, Julien Grall wrote:
>>>> Caution: This message originated from an External Source. Use proper 
>>>> caution when opening attachments, clicking links, or responding.
>>>>
>>>>
>>>> Hi,
>>>>
>>>> Title extra NIT: I have seen it multiple time and so far refrain to say
>>>> it. Please use 'arm' rather than 'Arm'. This is for consistency in the
>>>> way we name the subsystem in the title.
>>>>
>>>> On 08/12/2022 12:49, Ayan Kumar Halder wrote:
>>>>> Currently, kernel_uimage_probe() does not set info->zimage.start. As a
>>>>> result, it contains the default value (ie 0). This causes,
>>>>> kernel_zimage_place() to treat the binary (contained within uImage) as
>>>>> position independent executable. Thus, it loads it at an incorrect 
>>>>> address.
>>>>>
>>>>> The correct approach would be to read "uimage.ep" and set
>>>>> info->zimage.start. This will ensure that the binary is loaded at the
>>>>> correct address.
>>>>
>>>> In non-statically allocated setup, a user doesn't know where the memory
>>>> for dom0/domU will be allocated.
>>>>
>>>> So I think this was correct to ignore the address. In fact, I am worry
>>>> that...
>>>>
>>>>>
>>>>> Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
>>>>> ---
>>>>>
>>>>> I uncovered this issue while loading Zephyr as a dom0less domU with 
>>>>> Xen on
>>>>> R52 FVP. Zephyr builds with static device tree. Thus, the load 
>>>>> address is
>>>>> always fixed.
>>>>>
>>>>>    xen/arch/arm/kernel.c | 2 ++
>>>>>    1 file changed, 2 insertions(+)
>>>>>
>>>>> diff --git a/xen/arch/arm/kernel.c b/xen/arch/arm/kernel.c
>>>>> index 2556a45c38..e4e8c67669 100644
>>>>> --- a/xen/arch/arm/kernel.c
>>>>> +++ b/xen/arch/arm/kernel.c
>>>>> @@ -222,6 +222,8 @@ static int __init kernel_uimage_probe(struct 
>>>>> kernel_info *info,
>>>>>        if ( len > size - sizeof(uimage) )
>>>>>            return -EINVAL;
>>>>>
>>>>> +    info->zimage.start = be32_to_cpu(uimage.ep);
>>>> ... this will now ended up to break anyone that may have set an address
>>>> but didn't care where it should be loaded.
>>>>
>>>> I also understand your use case but now, we have contradictory
>>>> approaches. I am not entirely sure how we can solve it. We may have to
>>>> break those users (Cc some folks that may use it). But we should figure
>>>> out what is the alternative for them.
>>>>
>>>> If we decide to break those users, then this should be documented in 
>>>> the
>>>> commit message and in docs/misc/arm/booting.txt (which interestingly
>>>> didn't mention uImage).
>>>>
>>> So the first issue with Zephyr is that it does not support zImage 
>>> protocol for arm32.
>>> Volodymyr added support only for Image header for arm64 Zephyr.
>>> I guess this is why Ayan, willing to boot it on Xen (arm32), decided 
>>> to add u-boot header.
>>
>> If that's the only reason, then I would rather prefer if we go with 
>> zImage for a few reasons:
>>  - The zImage protocol has at least some documentation (not perfect) 
>> of the expected state of the memory/registers when jumping to the image.
>>  - AFAICT libxl is not (yet) supporting uImage. So this means zephyr 
>> cannot be loaded on older Xen releases (not great).
> 
> I am exploring for a similar option as Volodymyr ie support zimage 
> protocol for arm32.
> 
> But for that I need some public documentation that explains the zimage 
> header format for arm32.
> 
> Refer xen/arch/arm/kernel.c
> 
> #define ZIMAGE32_MAGIC_OFFSET 0x24
> #define ZIMAGE32_START_OFFSET 0x28
> #define ZIMAGE32_END_OFFSET   0x2c
> #define ZIMAGE32_HEADER_LEN   0x30
> 
> #define ZIMAGE32_MAGIC 0x016f2818
> 
> Is this documented anywhere ?
> 
> I had a look at 
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/arm/booting.rst 
> , but there is nothing that explains the header format.
> 
>>
>> Note this doesn't mean we should not fix Xen for uImage.
>>
>>> Now, there is also a question about supporting arm64 uImage kernels. 
>>> In Xen kernel_zimage_place,
>>> we do:
>>> #ifdef CONFIG_ARM_64
>>>      if ( info->type == DOMAIN_64BIT )
>>>          return info->mem.bank[0].start + info->zimage.text_offset;
>>> #endif
>>>
>>> So if we modify the uImage behavior for arm32, we will break 
>>> consistency with arm64
>>> (we would take uImage entry point address into account for arm32 but 
>>> not for arm64).
>>> At the moment at least they are in sync.
>>
>> That's a good point. It would be best if the behavior is consistent.
> 
> Currently, kernel_zimage_place() is called for both uImage and zImage.
> 
> Will it be sane if we write a different function for uImage ?
> 
> Something like this ...
> 
> static paddr_t __init kernel_uimage_place(struct kernel_info *info)
> 
> {
> 
>      /* Read and return uImage header's load address */
> 
>      return be32_to_cpu(uimage.load);
> 
> }
> 
> This will be consistent across arm32 and arm64
> 
All of these does not make a lot of sense because we are allocating memory for a domain
before probing the kernel image. This means that the load/entry address for a kernel
must be within the bank allocated for a domain. So the kernel already needs to know
that it is running e.g. as a Xen domU, and add corresponding u-boot header to load
us at e.g. GUEST_RAM0_BASE. Otherwise Xen will fail trying to copy the kernel into domain's
memory. Whereas for domU it is easy to guess the memory bank, for dom0 it is not.

zImage and Image are image protocols, uImage is not. It is just a legacy u-boot header (no requirements
\wrt booting,memory,registers, etc.). It can be added on top of anything (even vmlinux or a text file).
So I guess this is why Xen states that it supports zImage/Image and does not mention uImage.
A header is one thing, the boot requirements are another. Supporting uImage is ok but if we specify
that it must be a u-boot header added on top of zImage/Image.

> - Ayan
> 
>>
>> Cheers,
>>
~Michal


