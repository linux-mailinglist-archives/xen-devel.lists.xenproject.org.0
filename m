Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CFDA16C6953
	for <lists+xen-devel@lfdr.de>; Thu, 23 Mar 2023 14:16:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.513867.795534 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pfKmv-0000xB-8S; Thu, 23 Mar 2023 13:15:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 513867.795534; Thu, 23 Mar 2023 13:15:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pfKmv-0000vS-4W; Thu, 23 Mar 2023 13:15:29 +0000
Received: by outflank-mailman (input) for mailman id 513867;
 Thu, 23 Mar 2023 13:15:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7ZVY=7P=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1pfKms-0000vM-UX
 for xen-devel@lists.xenproject.org; Thu, 23 Mar 2023 13:15:27 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2061f.outbound.protection.outlook.com
 [2a01:111:f400:7eaa::61f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c45c384d-c97c-11ed-b464-930f4c7d94ae;
 Thu, 23 Mar 2023 14:15:22 +0100 (CET)
Received: from DM6PR07CA0117.namprd07.prod.outlook.com (2603:10b6:5:330::32)
 by IA1PR12MB8538.namprd12.prod.outlook.com (2603:10b6:208:455::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37; Thu, 23 Mar
 2023 13:15:16 +0000
Received: from DM6NAM11FT046.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:330:cafe::5a) by DM6PR07CA0117.outlook.office365.com
 (2603:10b6:5:330::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.38 via Frontend
 Transport; Thu, 23 Mar 2023 13:15:16 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT046.mail.protection.outlook.com (10.13.172.121) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6222.17 via Frontend Transport; Thu, 23 Mar 2023 13:15:16 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 23 Mar
 2023 08:15:14 -0500
Received: from [10.71.193.39] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Thu, 23 Mar 2023 08:15:13 -0500
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
X-Inumbo-ID: c45c384d-c97c-11ed-b464-930f4c7d94ae
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nYP1p8cSkqhoQafECy85l/CxcDBEr30elodzSQGmHjATcNfkBcEOIfN7za5CKfBnVDvyfWKa4zDIYBCX+fKcs51NpowrFPkZd5ZR3zYDN/6L0BcdIYz5xScjiy6NpwjfyrDZAlz6LHw3JT47nYeWtApK/sZUI/GhRnPlMHVvD6pUCK/67JqkPe0TRikIyrygEpyldu5TPmQRltC2HOnA810Xtx3GB/OLV8Ki6xkcJCgjgBABGCdbMzRPKeDatpzkhzps6TPHg1DyUvV8YyVJDJ7u6m0G3M6+I0l4HgfV4WMlRXoO5oZp7Wu5kSWx/hAH1uc5lz/6/2SBxmQh7A3LDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E2dKj7gxeeUDtwMk4UDdeW/cYJ5cjLD4UNYVvJNTZkY=;
 b=QnPWmn0Vdf0kYHm4w42VItIwbqg7dPaU4SH3XSB3fOCfcgUtl9RCBjzix1bVLaOjOT3bVMXQY1s3NB6KRjQiDAJYz9Ik+xd5iHz2eiJjX+yp1hTjoky3olp/IpwwpEX0ZKWTYznLTvc58W8FfkqLEKjhWhTVCHR8V73xmqnH8RnTcVy4uPIvUg8wiIs6ScxjaZn/QZqA3DLto3EmInyjUwmJm/VBhha2ARhsaRJ23Q09Xk3Bm1sU1DD82fAhnyPeo3gis+5RD5u0fW8mVchzByiB/o8ffQD+jnqbRf04snGQoYinHiPtRnlj/xDHqTRyz6gQdBQVNnJkfyprX61Nvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=xen.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E2dKj7gxeeUDtwMk4UDdeW/cYJ5cjLD4UNYVvJNTZkY=;
 b=nO6uvA+c5eV/XmbzLyFnbbXtmQFRKNueOiB+Y8uW1X5fOsyaUGomzbz1qlNEeIFdsTSZR+VzOlKNrb5WKaqDJrd7Li4AxwI8U7zF5S7pTgbtpxwXZVGMl9wS81YbP6x5P77ZiZFBEb0SQx5gY2BXSNvMLk3DXzTbQDZ3Q77qWyU=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <f86eaceb-942f-278f-c6f8-68f01eac8ba7@amd.com>
Date: Thu, 23 Mar 2023 14:15:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 2/2] xen/arm: vpl011: Fix domain_vpl011_init error path
Content-Language: en-US
To: Julien Grall <julien@xen.org>, <xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20230322102941.959-1-michal.orzel@amd.com>
 <20230322102941.959-3-michal.orzel@amd.com>
 <130680d1-155e-e989-8ab9-2ef59ca59fd6@xen.org>
 <b0253701-3696-fd18-ba74-9fb7e6150a1f@amd.com>
 <05196f3f-213c-e93c-c5be-1d2e83927bef@xen.org>
 <611499ff-1922-221e-ad9b-9303e3a88502@amd.com>
 <1527b04a-cc68-e6f4-2d12-4774110c25d1@xen.org>
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <1527b04a-cc68-e6f4-2d12-4774110c25d1@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT046:EE_|IA1PR12MB8538:EE_
X-MS-Office365-Filtering-Correlation-Id: 47a5c1e0-24d8-4633-cc11-08db2ba0a4e1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	dGb9PVPMXsU1QL1gvXkoGsRls73uqmO+EGNGzobbBYQaW+YiBCIsV7RdUM7fUAzse5JVk7/4lKwOgM3qNSKfqA/3USIme8xOddkGZS2LnCNnv9g1xBriwyR9rNW1B9LpWOVT4Yf2VtUjMl6hPyBoMXIf3OvVnYAKOWPzI+P3m2q5MbZV5328H6LLwdOvH268TWPFPeBuI6HLLiaU7ucLbJtVU0C5xAYpTPh7wYDRrgg1uxIeltMkoYft0RvZUzBR6G0Wqn8um9d50rSlYJ3CLzG1DI+647XO7aXcpXSBLR1oPRuUfUUrNtGhhM/Z8wIqwycki8fRecFvWJvlKluRTFs0xfxQfMkJq9cNDafaXLoeRXB4bK7Uypo27OLqVDsNnTzuC0P0Lk3R/ogYTQqBDA3nAMJMI+zCDo7XaBgTtNoZZTY1mU8H1bDO/F5D23VKtjz+XW+TbnwG0cZ4JyLr89XEzmF6bAI18MWF26SpwMfFdFrp864P/eZ+FbCEqF3Abrf8A/ytTmdMwJNWppiOclsQVLMmmZhIsRHcYuMataxNurwlfrUpsgKltzeEnWADF+QoWidd4vUhl1iBn5bPV+MOLXOTY7BOaoa5ewGAVrZomvVC4TZ3bw5HEbMuAfbf8kgPws6Zgd1WUhvthnRY0R/VBO8EwmiYLMtmTxb6motsfJ197UKKO+u71IsvR8k3f1FKaREg/pV9Esb6nQIQW20olJ1EgoG+kBSbZmX05cMlnlwwWU/wXdToXLRNsik8aJsCeyEzV1E4wbQbMNFWEg==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230025)(4636009)(376002)(346002)(136003)(39860400002)(396003)(451199018)(36840700001)(40470700004)(46966006)(31696002)(86362001)(36756003)(36860700001)(82740400003)(81166007)(356005)(2906002)(44832011)(40460700003)(41300700001)(8676002)(4326008)(5660300002)(8936002)(40480700001)(82310400005)(2616005)(336012)(186003)(53546011)(83380400001)(47076005)(426003)(54906003)(110136005)(478600001)(70586007)(70206006)(16576012)(316002)(26005)(31686004)(36900700001)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Mar 2023 13:15:16.3298
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 47a5c1e0-24d8-4633-cc11-08db2ba0a4e1
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DM6NAM11FT046.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8538



On 23/03/2023 13:57, Julien Grall wrote:
> 
> 
> On 23/03/2023 12:13, Michal Orzel wrote:
>> Hi Julien,
>>
>> On 23/03/2023 12:33, Julien Grall wrote:
>>>
>>>
>>> On 23/03/2023 11:10, Michal Orzel wrote:
>>>> Hi Julien,
>>>>
>>>> On 22/03/2023 17:19, Julien Grall wrote:
>>>>>
>>>>>
>>>>> Hi Michal,
>>>>>
>>>>> On 22/03/2023 10:29, Michal Orzel wrote:
>>>>>> When vgic_reserve_virq() fails and backend is in domain, we should also
>>>>>> free the allocated event channel.
>>>>>>
>>>>>> When backend is in Xen and call to xzalloc() returns NULL, there is no
>>>>>> need to call xfree(). This should be done instead on an error path
>>>>>> from vgic_reserve_virq().
>>>>>
>>>>> Most likely this was implemented this way to avoid a double "if (
>>>>> vpl011->backend_in_domain)". TBH, I am not very thrilled with this
>>>>> approach. Could we instead consider to use domain_pl011_deinit()? (A
>>>>> couple of tweak would be necessary to use it)
>>>> I think we could. More about it later.
>>>>
>>>>>
>>>>>> Also, take the opportunity to return -ENOMEM
>>>>>> instead of -EINVAL when memory allocation fails.
>>>>>>
>>>>>> Fixes: 1ee1e4b0d1ff ("xen/arm: Allow vpl011 to be used by DomU")
>>>>>> Signed-off-by: Michal Orzel <michal.orzel@amd.com>
>>>>>> ---
>>>>>>     xen/arch/arm/vpl011.c | 11 +++++++----
>>>>>>     1 file changed, 7 insertions(+), 4 deletions(-)
>>>>>>
>>>>>> diff --git a/xen/arch/arm/vpl011.c b/xen/arch/arm/vpl011.c
>>>>>> index 541ec962f189..df29a65ad365 100644
>>>>>> --- a/xen/arch/arm/vpl011.c
>>>>>> +++ b/xen/arch/arm/vpl011.c
>>>>>> @@ -696,8 +696,8 @@ int domain_vpl011_init(struct domain *d, struct vpl011_init_info *info)
>>>>>>             vpl011->backend.xen = xzalloc(struct vpl011_xen_backend);
>>>>>>             if ( vpl011->backend.xen == NULL )
>>>>>>             {
>>>>>> -            rc = -EINVAL;
>>>>>> -            goto out1;
>>>>>> +            rc = -ENOMEM;
>>>>>> +            goto out;
>>>>>>             }
>>>>>>         }
>>>>>>
>>>>>> @@ -720,12 +720,15 @@ int domain_vpl011_init(struct domain *d, struct vpl011_init_info *info)
>>>>>>     out2:
>>>>>>         vgic_free_virq(d, vpl011->virq);
>>>>>>
>>>>>> +    if ( vpl011->backend_in_domain )
>>>>>> +        free_xen_event_channel(d, vpl011->evtchn);
>>>>>> +    else
>>>>>> +        xfree(vpl011->backend.xen);
>>>>>
>>>>> There is another bug here (unrelated to your change). You want to use
>>>>> XFREE() to avoid an extra free in domain_pl011_deinit(). Can you look at it?
>>>> Strictly speaking this is not a bug. Memory allocation can only happen if backend is in Xen.
>>>> This means, that if vpl011 init fails, we will call free only once (domain_vpl011_deinit
>>>> will not be called on this path i.e. we will invoke panic after construct_domU).
>>>
>>> Well yes, in the current use this is not a real bug (it is only latent).
>>> But the same reasoning is also true for adding the call to
>>> free_xen_event_channel() because we would not continue to run the domain
>>> if domain_vpl011_init() is failing (even when the backend is in the
>>> domain). And even if we were going to continue this is just a channel
>>> that cannot be used. It will get free when the domain is destroyed
>>> (either explicitly in deinit() or by evtchn_destroy()).
>>>
>>>> Of course, we could switch to XFREE just for sanity.
>>> This is just not about sanity here. You are relying on how the caller is
>>> behaving. And we have no guarantee this is going to be the same forever.
>>> For instance, one may decide that it would fine to continue even if
>>> construct_domU() is failing (e.g. because the domain is not critical).
>>> At this point, this would become a real bug.
>> ok, makes sense.
>>
>>>
>>>>>> +
>>>>>>     out1:
>>>>>>         if ( vpl011->backend_in_domain )
>>>>>>             destroy_ring_for_helper(&vpl011->backend.dom.ring_buf,
>>>>>>                                     vpl011->backend.dom.ring_page);
>>>>>> -    else
>>>>>> -        xfree(vpl011->backend.xen);
>>>>>>
>>>>>>     out:
>>>>>>         return rc;
>>>>>
>>>> Solution to reuse domain_pl011_deinit would be as follows:
>>>>
>>>>        vgic_free_virq(d, vpl011->virq);
>>>
>>> We should move this call in domain_vpl011_deinit();
>> True and I think it does not need any guard as in case of a not registered virq it will
>> just clear the already cleared bit.
> 
> Technically it could have been reserved by someone else afterwards. So
> it would be best to 0 it (we allocate a SPI so we could use 0 as invalid).
Hmm, ok so the same handling as for event channel:
if ( vpl011->virq )
{
    vgic_free_virq(d, vpl011->virq);
    vpl011->virq = 0;
}

~Michal

