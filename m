Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D5F0A6C67E3
	for <lists+xen-devel@lfdr.de>; Thu, 23 Mar 2023 13:15:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.513822.795415 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pfJpi-0003i5-Rr; Thu, 23 Mar 2023 12:14:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 513822.795415; Thu, 23 Mar 2023 12:14:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pfJpi-0003f2-Na; Thu, 23 Mar 2023 12:14:18 +0000
Received: by outflank-mailman (input) for mailman id 513822;
 Thu, 23 Mar 2023 12:14:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7ZVY=7P=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1pfJpg-0003er-R0
 for xen-devel@lists.xenproject.org; Thu, 23 Mar 2023 12:14:16 +0000
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on20631.outbound.protection.outlook.com
 [2a01:111:f400:7e8c::631])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 376c4a36-c974-11ed-b464-930f4c7d94ae;
 Thu, 23 Mar 2023 13:14:12 +0100 (CET)
Received: from BN9PR03CA0573.namprd03.prod.outlook.com (2603:10b6:408:10d::8)
 by PH8PR12MB7207.namprd12.prod.outlook.com (2603:10b6:510:225::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37; Thu, 23 Mar
 2023 12:14:06 +0000
Received: from BN8NAM11FT107.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:10d:cafe::b7) by BN9PR03CA0573.outlook.office365.com
 (2603:10b6:408:10d::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.38 via Frontend
 Transport; Thu, 23 Mar 2023 12:14:06 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BN8NAM11FT107.mail.protection.outlook.com (10.13.176.149) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6222.17 via Frontend Transport; Thu, 23 Mar 2023 12:14:06 +0000
Received: from SATLEXMB07.amd.com (10.181.41.45) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 23 Mar
 2023 07:14:05 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB07.amd.com
 (10.181.41.45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 23 Mar
 2023 05:14:05 -0700
Received: from [10.71.193.39] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Thu, 23 Mar 2023 07:14:04 -0500
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
X-Inumbo-ID: 376c4a36-c974-11ed-b464-930f4c7d94ae
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FH8i3KgWV7pjDHjaItvZIwYormZXIH+yTFai8/KdhDEWdStoni9tw5MewspVFveG4TThBA+aVHiQT2DBZM/uBSnLr2MwCEStcgKVPTZ1G8yHwfeacXHvUZ2412ayIkj/ejUP/KrNb1VVEye8bUeckJ6CT9wtSmajgcmETTZr2VLvHuNzqlv1vmHvV+HZbvcCwqBSAjtinNC1WaK3McJXtcPlxNYn9HIF7/SUzvISwUiLRPnJOaaIDggh49O2TsevMgx2/JXLo2XWvDoeAjSZpeSsDehOjiRR09sNEer4tAZKlPkPR0bIGPO+MLTXeJdG3Uxd97/ROvLEz0fsWHgIIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w547YdYcUxSbidEz0LntS8RzqL/fzFXor/mag2G8YCM=;
 b=L+5gSST0pxOQ4NLzO/QHUsiJ7dmq/ziAqnRRrb7S8d2D54eR4mITjigEwkJ2bmpZKQtR+0Ak+YY+3RjCvZVYQ877NfsfLi+2aaHnRknEL2BVsLm7mUEt6s3zbhrbuqukHl8JQv5ZGuYZmqGMEyWnoIGVdTnnn+QlcsrfCVwaqKsbk2pqSTZpg0h0fOMI0LsMLhzriWrQym2MrZrlSJKgpqWeZVGFdLMWLygCjKCTQoRzbF6wOc7+mLQI1nDS0YQ2KiavR+5b4QsCkz1rh4DunmbsUFUobCWz2bHFjBmQNMpYy93C3JrNt2u7ubAgpSYJ3OWXblAQrsQKelEnGcy9Aw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=xen.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w547YdYcUxSbidEz0LntS8RzqL/fzFXor/mag2G8YCM=;
 b=Bh1CYJaU4cwDsaxXlwgM/9w0s5T15Cm8qm0BddIH+XRoA2GHA9H5ijBoU0RNmabHzWJFOrvFSQbJmkCJbNr2mqk4R9tEXvIkGDu44Zu9oYOJ0CK36JQIelgZz4tO8yEBKeR9jO0Y6o1YEYJqjKwvvere5+dkoy2ZfZKsK1sqfLU=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <611499ff-1922-221e-ad9b-9303e3a88502@amd.com>
Date: Thu, 23 Mar 2023 13:13:56 +0100
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
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <05196f3f-213c-e93c-c5be-1d2e83927bef@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT107:EE_|PH8PR12MB7207:EE_
X-MS-Office365-Filtering-Correlation-Id: df0f031b-39dc-4f44-a3d6-08db2b98195b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	LWBFvJZ2VL6NPd9TxOoQksZpkZTQxrW3obRx6lA71Jt1gI5q+pqm+WfAebY7sBwHhy7bHh1VJOIFQOlFbxLlaosYH8RwV9kk9XuAcfliai4nkqYw3QCWJB5ocWrmA9F6N5WewhjDSIC7Vbvh9cmiBKSrIhNd7twSIcdizphtw6Lj1c0M14z2lAtUTXRwDoXDDlh+pHnb1hyFsaGV4GNQP4Qv4grFyk3m1+R+iQaLdB6Ju1yAX3dDHSY8fmobKA5R8dVBHwn+TpKGBax4hfcbrbDyU5Iy6lg5CDLyxGxHJft1wLQM6eUnXuNtEVDpvaacfChkYMn8a9birObKGmu2dSZDCETa/NLTlVyZRyXaagoRMUNcUBRKC5Tvy7XmxMS1La7g06RIpuXrePAMK2yiPfs9jsn41DnFr+ok7I23MmpyZwwJWmdwEgNJ/9R9hNRfLMOPEsBqzCIsLZr3cTT2uihApEyZt+6D+PCme1BYAcvkzsXjvMEUsPJTNtC8kzr9IWEzuPSY3nI+raHNVzQAmInGVuFU2HfWcr1XMowT5spk8lUIrSgGn0RbLfU5Xlb0mq62aryt8p80FgQGngvXYWAXAMu4mN+mfGxS9Xo8SkE4+r14TbfBmvjGlDAeNEEC5OlyUTM/UZ4iacc3xvCKOdxP3ylMa+i3uq75cNBmKiAcW2v88zkbx3pdLx9RSaRfAhl7U37HuRRvpvYK14f8mUXgKI0lwnm7906YXfNkxYX1/4kqINpCeAQ4Pdgv8QBhzbsEAKzRCuuf+KgFvYBekA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230025)(4636009)(396003)(39860400002)(376002)(346002)(136003)(451199018)(40470700004)(36840700001)(46966006)(40460700003)(4326008)(70586007)(70206006)(8676002)(36860700001)(316002)(110136005)(16576012)(54906003)(5660300002)(81166007)(44832011)(82740400003)(41300700001)(8936002)(26005)(53546011)(47076005)(426003)(6666004)(2616005)(336012)(186003)(83380400001)(478600001)(82310400005)(31696002)(86362001)(36756003)(40480700001)(356005)(2906002)(31686004)(36900700001)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Mar 2023 12:14:06.3047
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: df0f031b-39dc-4f44-a3d6-08db2b98195b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN8NAM11FT107.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7207

Hi Julien,

On 23/03/2023 12:33, Julien Grall wrote:
> 
> 
> On 23/03/2023 11:10, Michal Orzel wrote:
>> Hi Julien,
>>
>> On 22/03/2023 17:19, Julien Grall wrote:
>>>
>>>
>>> Hi Michal,
>>>
>>> On 22/03/2023 10:29, Michal Orzel wrote:
>>>> When vgic_reserve_virq() fails and backend is in domain, we should also
>>>> free the allocated event channel.
>>>>
>>>> When backend is in Xen and call to xzalloc() returns NULL, there is no
>>>> need to call xfree(). This should be done instead on an error path
>>>> from vgic_reserve_virq().
>>>
>>> Most likely this was implemented this way to avoid a double "if (
>>> vpl011->backend_in_domain)". TBH, I am not very thrilled with this
>>> approach. Could we instead consider to use domain_pl011_deinit()? (A
>>> couple of tweak would be necessary to use it)
>> I think we could. More about it later.
>>
>>>
>>>> Also, take the opportunity to return -ENOMEM
>>>> instead of -EINVAL when memory allocation fails.
>>>>
>>>> Fixes: 1ee1e4b0d1ff ("xen/arm: Allow vpl011 to be used by DomU")
>>>> Signed-off-by: Michal Orzel <michal.orzel@amd.com>
>>>> ---
>>>>    xen/arch/arm/vpl011.c | 11 +++++++----
>>>>    1 file changed, 7 insertions(+), 4 deletions(-)
>>>>
>>>> diff --git a/xen/arch/arm/vpl011.c b/xen/arch/arm/vpl011.c
>>>> index 541ec962f189..df29a65ad365 100644
>>>> --- a/xen/arch/arm/vpl011.c
>>>> +++ b/xen/arch/arm/vpl011.c
>>>> @@ -696,8 +696,8 @@ int domain_vpl011_init(struct domain *d, struct vpl011_init_info *info)
>>>>            vpl011->backend.xen = xzalloc(struct vpl011_xen_backend);
>>>>            if ( vpl011->backend.xen == NULL )
>>>>            {
>>>> -            rc = -EINVAL;
>>>> -            goto out1;
>>>> +            rc = -ENOMEM;
>>>> +            goto out;
>>>>            }
>>>>        }
>>>>
>>>> @@ -720,12 +720,15 @@ int domain_vpl011_init(struct domain *d, struct vpl011_init_info *info)
>>>>    out2:
>>>>        vgic_free_virq(d, vpl011->virq);
>>>>
>>>> +    if ( vpl011->backend_in_domain )
>>>> +        free_xen_event_channel(d, vpl011->evtchn);
>>>> +    else
>>>> +        xfree(vpl011->backend.xen);
>>>
>>> There is another bug here (unrelated to your change). You want to use
>>> XFREE() to avoid an extra free in domain_pl011_deinit(). Can you look at it?
>> Strictly speaking this is not a bug. Memory allocation can only happen if backend is in Xen.
>> This means, that if vpl011 init fails, we will call free only once (domain_vpl011_deinit
>> will not be called on this path i.e. we will invoke panic after construct_domU).
> 
> Well yes, in the current use this is not a real bug (it is only latent).
> But the same reasoning is also true for adding the call to
> free_xen_event_channel() because we would not continue to run the domain
> if domain_vpl011_init() is failing (even when the backend is in the
> domain). And even if we were going to continue this is just a channel
> that cannot be used. It will get free when the domain is destroyed
> (either explicitly in deinit() or by evtchn_destroy()).
> 
>> Of course, we could switch to XFREE just for sanity.
> This is just not about sanity here. You are relying on how the caller is
> behaving. And we have no guarantee this is going to be the same forever.
> For instance, one may decide that it would fine to continue even if
> construct_domU() is failing (e.g. because the domain is not critical).
> At this point, this would become a real bug.
ok, makes sense.

> 
>>>> +
>>>>    out1:
>>>>        if ( vpl011->backend_in_domain )
>>>>            destroy_ring_for_helper(&vpl011->backend.dom.ring_buf,
>>>>                                    vpl011->backend.dom.ring_page);
>>>> -    else
>>>> -        xfree(vpl011->backend.xen);
>>>>
>>>>    out:
>>>>        return rc;
>>>
>> Solution to reuse domain_pl011_deinit would be as follows:
>>
>>       vgic_free_virq(d, vpl011->virq);
> 
> We should move this call in domain_vpl011_deinit();
True and I think it does not need any guard as in case of a not registered virq it will
just clear the already cleared bit.

> 
>>
>>   out1:
>> -    if ( vpl011->backend_in_domain )
>> -        destroy_ring_for_helper(&vpl011->backend.dom.ring_buf,
>> -                                vpl011->backend.dom.ring_page);
>> -    else
>> -        xfree(vpl011->backend.xen);
>> +    domain_vpl011_deinit(d);
>>
>>   out:
>>       return rc;
>> @@ -737,12 +733,15 @@ void domain_vpl011_deinit(struct domain *d)
>>
>>       if ( vpl011->backend_in_domain )
>>       {
>> -        if ( !vpl011->backend.dom.ring_buf )
>> -            return;
>> +        if ( vpl011->backend.dom.ring_buf )
>> +            destroy_ring_for_helper(&vpl011->backend.dom.ring_buf,
>> +                                    vpl011->backend.dom.ring_page);
>>
>> -        free_xen_event_channel(d, vpl011->evtchn);
>> -        destroy_ring_for_helper(&vpl011->backend.dom.ring_buf,
>> -                                vpl011->backend.dom.ring_page);
>> +        if ( vpl011->evtchn )
>> +        {
>> +            free_xen_event_channel(d, vpl011->evtchn);
>> +            vpl011->evtchn = 0;
>> +        }
>>       }
>>       else
>>           xfree(vpl011->backend.xen);
> 
> Now, it is more clearer that this will need to become an XFREE().
> 
>>
>> However there is one problem with guarding free_xen_event_channel to be called only once.
>> Even without allocating event channel, vpl011->evtchn is 0 by default. So doing:
>> if ( is_port_valid(vpl011->evtchn) )
>>      free_xen_event_channel(d, vpl011->evtchn);
>> would not help us as evtchn 0 is always there. So in my proposal I'm assuming (I think correctly)
>> that vpl011->evtchn cannot be 0 after successful evtchn allocation because 0 is "reserved".
> 0 was reserved because it is used as the "invalid event channel". So
> your check above is correct.
ok, let me send a v2 then.

~Michal

