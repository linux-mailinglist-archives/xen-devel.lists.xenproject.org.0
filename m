Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D8FC86AF74
	for <lists+xen-devel@lfdr.de>; Wed, 28 Feb 2024 13:51:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.686588.1068781 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rfJO9-0001xI-2T; Wed, 28 Feb 2024 12:50:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 686588.1068781; Wed, 28 Feb 2024 12:50:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rfJO8-0001vV-VJ; Wed, 28 Feb 2024 12:50:20 +0000
Received: by outflank-mailman (input) for mailman id 686588;
 Wed, 28 Feb 2024 12:50:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Gbmv=KF=amd.com=Xin.Wang2@srs-se1.protection.inumbo.net>)
 id 1rfJO8-0001u1-7u
 for xen-devel@lists.xenproject.org; Wed, 28 Feb 2024 12:50:20 +0000
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on20600.outbound.protection.outlook.com
 [2a01:111:f403:2405::600])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ec0d981c-d637-11ee-a1ee-f123f15fe8a2;
 Wed, 28 Feb 2024 13:50:17 +0100 (CET)
Received: from CH2PR05CA0010.namprd05.prod.outlook.com (2603:10b6:610::23) by
 SA1PR12MB5660.namprd12.prod.outlook.com (2603:10b6:806:238::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7316.39; Wed, 28 Feb
 2024 12:50:13 +0000
Received: from SN1PEPF0002BA4D.namprd03.prod.outlook.com
 (2603:10b6:610:0:cafe::86) by CH2PR05CA0010.outlook.office365.com
 (2603:10b6:610::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.12 via Frontend
 Transport; Wed, 28 Feb 2024 12:50:12 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SN1PEPF0002BA4D.mail.protection.outlook.com (10.167.242.70) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7292.25 via Frontend Transport; Wed, 28 Feb 2024 12:50:12 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Wed, 28 Feb
 2024 06:50:11 -0600
Received: from [172.31.100.92] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Wed, 28 Feb 2024 06:50:08 -0600
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
X-Inumbo-ID: ec0d981c-d637-11ee-a1ee-f123f15fe8a2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Sx1AL4LBO1GwZJBx6cakI37KTIJSuD3QJhwB7yfzKUOfSeOOgugBdPrLV2R+3PJ6hMCC/5f/QKQQ6eekEw8VPfSLaKWbAZKEO6Lq1FKtCTWXWTgFT25R4BafUKizW2blLBJvLuP1FHnRn57ogfAykTy/tRoeMUhyhGQcO6RyVZwA4HxVjAf2f6G56vnkDNHwjoNBzcHMr4FkNGyrJUTXMLoFWz8ezGr0JqU7obx0WDy93/wlDB7AncRUXSZxTr+C72et3nZTMh+7gABQf+6HpYTkj7ftLJbscB4QM9P4JXUu+9lJCYmHlwKpL7JEYx0JisTFta/V0XHh8I0O0J+u3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uybtuNqwicTm0XbF9JMzhofiQJwwSLgnTfRwNgDzpwk=;
 b=PhzZBH9/c8yE3VslDgr7mV25YmBZ7X9XrIjiP1GA/yHelf2fQHwpkpCiCnojbcNJl/vgxuPQAxivpldfulb5b/unCkR9WDvJtSAbWeoN6f6U1Fnaf75uWOn51oM6vxc4W0h2j7rFw98o6PMa5ubFMJHQhuXTYH/V+DPDfwpPdB8QoPliCyTDmz7wY6cbGzVBxAvFK/+jcX8k/71WXHj1xJ8fAgkSFUQEkY9kXf6032/fQgy+QhWiabqRCZsswyVLpL707eZ0lZ4X+FnkuGD3UZ/A9628zfyT6l2STqv2lQ/N+QvedLpArr6YSoCYv/ClskeSXaMZCGjWvNSSZUtPlw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=xen.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uybtuNqwicTm0XbF9JMzhofiQJwwSLgnTfRwNgDzpwk=;
 b=FztXMqvYJnXHy+HtMeraZ/ie+ABHFoI1/ZMkEkG8UPDGhnCPkfQHJOYCzB/q7ZbmSd718brPX02CyfDP8/mlkXc3Vegjcy+ILhax+8GPrhIZU0YL3h7fA3Iw9s9NELyY5GFK+cyoyzlP+1gTizquFaYdjbASHUWw8OSIgEWiLU8=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <e7960c4c-8fe8-44c0-8bff-3349fe274e90@amd.com>
Date: Wed, 28 Feb 2024 20:50:08 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/common: Do not allocate magic pages 1:1 for direct
 mapped domains
To: Julien Grall <julien@xen.org>, <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@citrix.com>, Juergen Gross
	<jgross@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, "Volodymyr
 Babchuk" <Volodymyr_Babchuk@epam.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
	<roger.pau@citrix.com>, Alec Kwapis <alec.kwapis@medtronic.com>
References: <20240226011935.169462-1-xin.wang2@amd.com>
 <d1518124-483c-4409-9b36-6a3392378911@xen.org>
 <a84aeb87-17e8-4195-90cb-7b0123064106@amd.com>
 <3982ba47-6709-47e3-a9c2-e2d3b4a2d8e3@xen.org>
 <8e56b75d-10a2-4764-8244-3e596f9fc695@amd.com>
 <98739f8d-dc00-4db8-a0b2-07f054107acf@xen.org>
Content-Language: en-US
From: Henry Wang <xin.wang2@amd.com>
In-Reply-To: <98739f8d-dc00-4db8-a0b2-07f054107acf@xen.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB03.amd.com: xin.wang2@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF0002BA4D:EE_|SA1PR12MB5660:EE_
X-MS-Office365-Filtering-Correlation-Id: 00f58296-07e1-44be-3d4d-08dc385bcd92
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	692EEDhQGkK7u0POqEe/vU6Ia1TxHBVuIcFb6TGjk3uPn8bsDlcywrjO0DNLVlRvVKJfdCIZPrc+lN5I320KQz7/4X+j1Kivrtc2+3D8xxO53L7m/gaXEm88IMuRDWCiTuVoeanjRnRVejDbcXzt5vUnMBlvG2fbpjw/KGhhDXSg6Sc/iJICoBXXLQP73jOl4jUka6uLIS5CizeH/ZSwFLUu/1omXNNgcFo9l0lynU8wmnvF7t0c+tbnXA5xlFdUhuUfx8vVN5UvxwSdgBucyZl6+Yxdok7zyn6URhoQCTCHKY6Gzzck5GwQlokI6KMd9ZfJny8uSCNOYM1HiwR1J2DExKJvWUpsc/4fhG1TscVkIV4SNRHKjm2xvVwK7uc+e7iwhnG0Gvo1iPOF2lX0qBjPUIkh8Akkm0vpjDtVwruxbmSOc5b9JmiKv/gCAQscy6XbiAP+lF9+x5bjlXiatOdRWCPTzqDCuQFPskmsyDhUTVVoZvYx5Wl1DQCvdJhhrQWPGcS3e6R3kVxuOYe8IyffmElWDPrAwFyRBzi1uOkyMe2mzp3uw4CT50aeUWpPjUR2rvsz1NTLAVKsAOUT0er7ddZSkbaYubFhetthnMfxpdp/PlkARLPBsNmwYIFyy9UMxMR5Ay8IgaqYTxlDUmB3/Loc9twnGDbap06OBI8NeK8p8orjy/nohPYEwQC7z4TpOmzhd0i/4dQ/UZpW9jSOc0gFMiA5zNgID9Yf3MMTv7DStg8qzdqClRq0GMIa
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(230273577357003)(82310400014)(36860700004);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Feb 2024 12:50:12.1391
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 00f58296-07e1-44be-3d4d-08dc385bcd92
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF0002BA4D.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB5660

Hi Julien,

On 2/28/2024 8:27 PM, Julien Grall wrote:
> Hi Henry,
>>>> After checking the code flow, below rough plan came to my mind, I 
>>>> think what we need to do is:
>>>>
>>>> (1) Find a range of un-used memory using similar method in 
>>>> find_unallocated_memory()/find_domU_holes()
>>>
>>> AFAIK, the toolstack doesn't have any knowledge of the memeory 
>>> layout for dom0less domUs today. We would need to expose it first.
>>
>> If I understand correctly, I think the issue you mentioned here and ...
>>
>>> Then the region could either be statically allocated (i.e. the admin 
>>> provides it in the DTB) or dynamically.
>>>
>>>> (2) Change the base address, i.e. GUEST_MAGIC_BASE in 
>>>> alloc_xs_page() in init-dom0less.c to point to the address in (1) 
>>>> if static mem or 11 directmap. (I think this is a bit tricky 
>>>> though, do you have any method that in your mind?)
>>>
>>> AFAIK, the toolstack doesn't know whether a domain is direct mapped 
>>> or using static mem.
>>
>> ...here basically means we want to do the finding of the unused 
>> region in toolstack. Since currently what we care about is only a 
>> couple of pages instead of the whole memory map, could it be possible 
>> that we do the opposite: in alloc_xs_page(), we issue a domctl 
>> hypercall to Xen and do the finding work in Xen and return with the 
>> found gfn? Then the page can be mapped by populate_physmap() from 
>> alloc_xs_page() and used for XenStore.
>
> I know that DOMCTL hypercalls are not stable. But I am not overly 
> happy with creating an hypercall which is just "fetch the magic 
> regions". I think it need to be a more general one that would expose 
> all the regions.
>
> Also, you can't really find the magic regions when the hypercall is 
> done as we don't have the guest memory layout. This will need to be 
> done in advance.
>
> Overall, I think it would be better if we provide an hypercall listing 
> the regions currently occupied (similar to e820). One will have the 
> type "magic pages".

Yeah now it is more clear. I agree your approach is indeed a lot better. 
I will check how e820 works and see if I can do something similar. Also 
it might not be related, I think we somehow had a similar discussion in 
[1] when I do static heap.

>> If above approach makes sense to you, I have a further question: 
>> Since I understand that the extended region is basically for safely 
>> foreign mapping pages
>
> This is not about safety. The extended region is optional. It was 
> introduced so it is easy for Linux to find an unallocated region to 
> map external pages (e.g. vCPU shared info) so it doesn't waste RAM pages.
>
> , and init_dom0less.c uses foreign memory map for this
>> XenStore page, should we find the wanted page in the extended region? 
>> or even extended region should be excluded?
>
> How is the extended region found for dom0less domUs today? 

The extended regions for dom0less domUs are found by function 
find_domU_holes() introduced by commit 2a24477 xen/arm: implement domU 
extended regions. I think this commit basically followed the original 
algorithm introduced by commit 57f8785 libxl/arm: Add handling of 
extended regions for DomU.

> It would be fine to steal some part of the extended regions for the 
> magic pages. But they would need to be reserved *before* the guest is 
> first unpaused.

I also thought this today, as I think writing a function basically doing 
the same as what we do for extended regions is probably too much, so 
stealing some part of the extended region is easier. What I worry about 
is that: Once the extended regions are allocated and written to the 
"reg" property of the device tree hypervisor node, the data structures 
to record these extended regions are freed. So we kind of "lost" the 
information about these extended regions if we want to get them later 
(for example my use case). Also, if we still some part of memory from 
the extended regions, should we carve out the "stolen" parts from the 
device tree as well?

>>>>> Also, why are you only checking the first GFN? What if the caller 
>>>>> pass an overlapped region?
>>>>
>>>> I am a bit confused. My understanding is at this point we are 
>>>> handling one page at a time.
>>>
>>> We are handling one "extent" at the time. This could be one or 
>>> multiple pages (see extent_order).
>>
>> I agree, sorry I didn't express myself well. For this specific 
>> XenStore page, I think the extent_order is
>> fixed as 0 so there is only 1 page.
>
> Correct. But you should not rely on this :).

Yeah definitely :)

[1] 
https://lore.kernel.org/xen-devel/e53601a1-a5ac-897a-334d-de45d96e9863@xen.org/

Kind regards,
Henry


