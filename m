Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B08E6472CE
	for <lists+xen-devel@lfdr.de>; Thu,  8 Dec 2022 16:24:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.457230.715116 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p3Il3-0005iS-4o; Thu, 08 Dec 2022 15:24:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 457230.715116; Thu, 08 Dec 2022 15:24:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p3Il3-0005fa-23; Thu, 08 Dec 2022 15:24:21 +0000
Received: by outflank-mailman (input) for mailman id 457230;
 Thu, 08 Dec 2022 15:24:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UkKA=4G=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1p3Il1-0005fU-4s
 for xen-devel@lists.xenproject.org; Thu, 08 Dec 2022 15:24:19 +0000
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on20603.outbound.protection.outlook.com
 [2a01:111:f400:7e83::603])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 605d33cd-770c-11ed-8fd2-01056ac49cbb;
 Thu, 08 Dec 2022 16:24:17 +0100 (CET)
Received: from DS7P222CA0001.NAMP222.PROD.OUTLOOK.COM (2603:10b6:8:2e::7) by
 IA0PR12MB8278.namprd12.prod.outlook.com (2603:10b6:208:3dc::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.14; Thu, 8 Dec
 2022 15:24:12 +0000
Received: from DM6NAM11FT012.eop-nam11.prod.protection.outlook.com
 (2603:10b6:8:2e:cafe::fd) by DS7P222CA0001.outlook.office365.com
 (2603:10b6:8:2e::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.14 via Frontend
 Transport; Thu, 8 Dec 2022 15:24:12 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DM6NAM11FT012.mail.protection.outlook.com (10.13.173.109) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5901.16 via Frontend Transport; Thu, 8 Dec 2022 15:24:11 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 8 Dec
 2022 09:24:11 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 8 Dec
 2022 09:24:11 -0600
Received: from [10.71.193.33] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Thu, 8 Dec 2022 09:24:09 -0600
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
X-Inumbo-ID: 605d33cd-770c-11ed-8fd2-01056ac49cbb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=S4XchZZ4AhUgNZgaTsTNixmyILGotraIEp//OFSNDZpqukRDUcuuwi5oJZ0eXZcJpk67kbWlm0OdMIzdOdmRhZUZvMc+ypRg/TwOU7+8bEckyZn3LpRTr4+EYIOmUlGCaVYISH3hXparosAH0QIP/o6Ok9LpuPNkJ5/6j7mWeJHKa5hLG2QB8KhPecRBshbvkx+dHqDSgz2TQgfIpN32AtkCxSFKjC5x3wCaRX+WbJ/U/rbOUpqCsS/v/Wfb3D4/ZdCg1mriZE7G18nqm8Vi55Uf6VPR/+WHKaJxUJtxl3Me4n1n5nrBqpP3DOlS2ih6pFcZamsA+ywH+OYbq9R4Ow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/ezzrzS/zkPRbz6lbFhf03w1v7HSxCQYF3B6EOnZgbU=;
 b=oVpR3J7S3L2GMT2LeShf355fJ50Nb1K+l5MRBzb3KdwtkM91eDHORGfOxGRK2ezjPrxkeb4uau4a1TUZu5CA1KPeCsGdUs47Bsl8Y7Jb8Ue2s8fUmgvFa6SfMn4OdyBNOYIESPFezC8ZseL5dBE5AeyPo5yfk+a1miwucjaD7+A1EsUFWPDovHR3rq1gQMF2Pd2wRfhd1Cgyzpk56SXwfky4iVSeASonBu/6A9KjZERZWBhD0gPGdIC2ejMRtaqj1dAVac9R3F38Q7+RGkfWF9xKSACPeLvGu2hKzo1ufgGjDrQIoiLbzXLyOGfKS0/o3IwwLXU68QDxXR6p1dqI3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=xen.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/ezzrzS/zkPRbz6lbFhf03w1v7HSxCQYF3B6EOnZgbU=;
 b=tm5XaRDO3owHkVXJmMGjWgKpZG6QLiU3POU5gA9mRsOoBRrxVmGLX7KHlX/HVMokCtCFffkgR4O6Fkf3XjcWutIs34z5+LvPXHauczJn6WdFXcMbAMjH+RVMpfNkolvZwhMpbzWpsvvWMhFECqIlY1Sh4mJEknuml6FR9WbKRD0=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <e8aff19a-4992-9d35-4e78-9e64aec384f9@amd.com>
Date: Thu, 8 Dec 2022 16:24:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [XEN v1] xen/Arm: Probe the entry point address of an uImage
 correctly
Content-Language: en-US
To: Julien Grall <julien@xen.org>, Ayan Kumar Halder
	<ayan.kumar.halder@amd.com>, <xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>, <stefanos@xilinx.com>,
	<Volodymyr_Babchuk@epam.com>, <bertrand.marquis@arm.com>, "Oleksandr
 Tyshchenko" <oleksandr_tyshchenko@epam.com>
References: <20221208124929.55268-1-ayan.kumar.halder@amd.com>
 <1ad3ee8c-991f-6e15-255f-ccc24dd5b84f@xen.org>
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <1ad3ee8c-991f-6e15-255f-ccc24dd5b84f@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT012:EE_|IA0PR12MB8278:EE_
X-MS-Office365-Filtering-Correlation-Id: e52771fe-81ff-4a97-0610-08dad930424b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	TalKlu3hImWrtlRUWFp3YZ4iMRb2ovZDocig/XZGSLWGS8f8C7LRQ3dsQjbJCDJkDD5J9vkihu7NbqqcQuZWqZQEv2Bn5d6UtcmZaQ6cOA+sWMcqiBLwqKg+pc3kbV7BwUL9xLKs6iSImbDwHALxzumhWXnG12Vr0DmC1/U0IRdga62CD5TFvv017FTmFKz+RkQblmZCewi7uPIlvbqN9ejKiWRsdpqvc//I9O7aq+Qwosh51V6iXOr5NEav4UWV3QA36p4YraE0DGZbH2Ylis/2OHIZ1VZT16R35NP2AKSMiUQ6Yjqe8C8eeKHVWGAIzNy0SGpzwuFO32SHapoGv3r8LJ5XopcFEaIGftYP9U3m+DrqzC/Xtr5CozZFHBqtmeJelZLHJbdx+y8sZ/u0jYsrs1OCpqXMY2p+Bra5Z6KVs6WNzfV23FLKC/IYf7xNSFlzvpixNoD5Qt1qB5ZDzKFjcmDj06f+pZh2S/qwlXJX46ntppaCErdobobUsEKuKVL/1PZBMiN8Rlqbg05UdHfddcfATKohOEt8hH46TtaDL7u3Uruw6XuerV2jUdD5yzYhTl1btRf6dyxsjx/rfR/g9YA733qbnNa9sgKkeF1DY17vhneO06O4B85zPnk5NBkhbB/uHB0s3MX+s8XUu3h3RXMJXLZNzBqwnZuvJRe3r0xiOnR5sAD2fWPLKi8tlMcywDoCu76hCJRkJgmhJXfz3peWIy+REE2SY2tfonoGmJa4mw+B55+P70irQ6DXOUsP6QHczxFLFeaNN8YLyg==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(396003)(346002)(136003)(376002)(39860400002)(451199015)(36840700001)(40470700004)(46966006)(336012)(8676002)(40460700003)(26005)(83380400001)(41300700001)(82310400005)(40480700001)(47076005)(8936002)(186003)(44832011)(2616005)(2906002)(86362001)(4326008)(70586007)(16576012)(70206006)(426003)(5660300002)(54906003)(31696002)(36860700001)(110136005)(36756003)(316002)(356005)(82740400003)(478600001)(31686004)(81166007)(53546011)(36900700001)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Dec 2022 15:24:11.9435
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e52771fe-81ff-4a97-0610-08dad930424b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DM6NAM11FT012.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8278

Hi,

On 08/12/2022 14:51, Julien Grall wrote:
> Caution: This message originated from an External Source. Use proper caution when opening attachments, clicking links, or responding.
> 
> 
> Hi,
> 
> Title extra NIT: I have seen it multiple time and so far refrain to say
> it. Please use 'arm' rather than 'Arm'. This is for consistency in the
> way we name the subsystem in the title.
> 
> On 08/12/2022 12:49, Ayan Kumar Halder wrote:
>> Currently, kernel_uimage_probe() does not set info->zimage.start. As a
>> result, it contains the default value (ie 0). This causes,
>> kernel_zimage_place() to treat the binary (contained within uImage) as
>> position independent executable. Thus, it loads it at an incorrect address.
>>
>> The correct approach would be to read "uimage.ep" and set
>> info->zimage.start. This will ensure that the binary is loaded at the
>> correct address.
> 
> In non-statically allocated setup, a user doesn't know where the memory
> for dom0/domU will be allocated.
> 
> So I think this was correct to ignore the address. In fact, I am worry
> that...
> 
>>
>> Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
>> ---
>>
>> I uncovered this issue while loading Zephyr as a dom0less domU with Xen on
>> R52 FVP. Zephyr builds with static device tree. Thus, the load address is
>> always fixed.
>>
>>   xen/arch/arm/kernel.c | 2 ++
>>   1 file changed, 2 insertions(+)
>>
>> diff --git a/xen/arch/arm/kernel.c b/xen/arch/arm/kernel.c
>> index 2556a45c38..e4e8c67669 100644
>> --- a/xen/arch/arm/kernel.c
>> +++ b/xen/arch/arm/kernel.c
>> @@ -222,6 +222,8 @@ static int __init kernel_uimage_probe(struct kernel_info *info,
>>       if ( len > size - sizeof(uimage) )
>>           return -EINVAL;
>>
>> +    info->zimage.start = be32_to_cpu(uimage.ep);
> ... this will now ended up to break anyone that may have set an address
> but didn't care where it should be loaded.
> 
> I also understand your use case but now, we have contradictory
> approaches. I am not entirely sure how we can solve it. We may have to
> break those users (Cc some folks that may use it). But we should figure
> out what is the alternative for them.
> 
> If we decide to break those users, then this should be documented in the
> commit message and in docs/misc/arm/booting.txt (which interestingly
> didn't mention uImage).
> 
So the first issue with Zephyr is that it does not support zImage protocol for arm32.
Volodymyr added support only for Image header for arm64 Zephyr.
I guess this is why Ayan, willing to boot it on Xen (arm32), decided to add u-boot header.

Now, there is also a question about supporting arm64 uImage kernels. In Xen kernel_zimage_place,
we do:
#ifdef CONFIG_ARM_64
    if ( info->type == DOMAIN_64BIT )
        return info->mem.bank[0].start + info->zimage.text_offset;
#endif

So if we modify the uImage behavior for arm32, we will break consistency with arm64
(we would take uImage entry point address into account for arm32 but not for arm64).
At the moment at least they are in sync.


> Cheers,
> 
> --
> Julien Grall

~Michal

