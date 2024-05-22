Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 245A28CB827
	for <lists+xen-devel@lfdr.de>; Wed, 22 May 2024 03:23:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.727161.1131573 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s9age-0004O4-0G; Wed, 22 May 2024 01:22:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 727161.1131573; Wed, 22 May 2024 01:22:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s9agd-0004Lh-Tc; Wed, 22 May 2024 01:22:35 +0000
Received: by outflank-mailman (input) for mailman id 727161;
 Wed, 22 May 2024 01:22:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=X7YA=MZ=amd.com=Xin.Wang2@srs-se1.protection.inumbo.net>)
 id 1s9agc-0004LZ-Ab
 for xen-devel@lists.xenproject.org; Wed, 22 May 2024 01:22:34 +0000
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on20601.outbound.protection.outlook.com
 [2a01:111:f403:2409::601])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c2f41552-17d9-11ef-909f-e314d9c70b13;
 Wed, 22 May 2024 03:22:33 +0200 (CEST)
Received: from SJ0P220CA0017.NAMP220.PROD.OUTLOOK.COM (2603:10b6:a03:41b::27)
 by PH7PR12MB7186.namprd12.prod.outlook.com (2603:10b6:510:202::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.36; Wed, 22 May
 2024 01:22:29 +0000
Received: from MWH0EPF000971E2.namprd02.prod.outlook.com
 (2603:10b6:a03:41b:cafe::a) by SJ0P220CA0017.outlook.office365.com
 (2603:10b6:a03:41b::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.35 via Frontend
 Transport; Wed, 22 May 2024 01:22:29 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 MWH0EPF000971E2.mail.protection.outlook.com (10.167.243.69) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7611.14 via Frontend Transport; Wed, 22 May 2024 01:22:29 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Tue, 21 May
 2024 20:22:26 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Tue, 21 May
 2024 20:22:26 -0500
Received: from [10.69.48.49] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Tue, 21 May 2024 20:22:25 -0500
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
X-Inumbo-ID: c2f41552-17d9-11ef-909f-e314d9c70b13
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EMQElXQrTCWwyvHEX4i9mvjYriTEFcYgH0RW3LMEwPdlG3lm992m0/zDj6WrO/uakFlNlzCMtjZF9fzLHVHBSUo6E5+l1iNRzCuX8z0Ns769O7nr+RczcNnQsPr3FOQWA/a88bvxOfKneR+WWPUSns6drwFNb9S9WMJajKPgPeJwyrbo4euXTSu1T/yXSWcRUxhgBU9ikOrsLkK7WsTCD5VJ3bTnkrVdjMkd5mg1E/wWSBKIYUr4750brud3D4s0Ah7hslB0sG56Tox5DREwrwJzVIitTaOwa2N0+2hjq5jzGosnJ6qrJpCiW5D9nRlwsSmNC01V14m/zKS83XZhLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ECnBaYTW+9NhBUuNxED0nph6VbLqiyh5JVId249zVRE=;
 b=NHJIMWh4PLCnlBMhs5DmnIY1X9Uc6XFKnwoTH1OW8AhhhBuIs/ZiYDjwTD2+6AD6CNJcS7oTm5HwB7bNz+hGIBpHjkeQJiOKqLcMlJDk6Dft9wxn+pYv8qZNcLaumGnMqFYwBPLhxVrIwz0ncPWvgVsNu0qgRGRtaIZlxv/D7Pni9Pn5a55dJu5+qoLn/Jug3SPAg3sfACOamaLaTrl7BYVP5/j2jYgwvBV87iKwLm74P9oIWVFLo5/adY5SM1EYRxysLkvxds9S4m8BVNeAwpH/AeUN/ZHYrzjSQuVDxDL2wJu9/Qn5nc1RCx26CMjsiMrCjGrXyIZLdDO//yEkog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ECnBaYTW+9NhBUuNxED0nph6VbLqiyh5JVId249zVRE=;
 b=pJK4mBVolFzHn0FGYcbWDzQzqgWAYEt1J8o5eMmdwurIdPVTPf2OxZJQmyyFf1Tw/qroR6qrU3RcmqTL3RvxGLal6M//3Ko8uPLmVkYH9AB65O0hZV0o4wkrmTwrAN7X+BnLC5mKpTs3UebMPIVav54UzGKEw9d8vB/YVlALsos=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <29073700-673d-40aa-8759-efc60af3b7c0@amd.com>
Date: Wed, 22 May 2024 09:22:02 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/8] xen/arm/gic: Allow routing/removing interrupt to
 running VMs
To: Stefano Stabellini <sstabellini@kernel.org>
CC: Julien Grall <julien@xen.org>, <xen-devel@lists.xenproject.org>, "Bertrand
 Marquis" <bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20240521043557.1580753-1-xin.wang2@amd.com>
 <20240521043557.1580753-6-xin.wang2@amd.com>
 <3f6fa7e7-c02c-4fa5-b4aa-5e4c2efed65f@xen.org>
 <4f6a24b5-5e7b-41e0-9314-496bbcaa8888@amd.com>
 <alpine.DEB.2.22.394.2405211815040.1052252@ubuntu-linux-20-04-desktop>
Content-Language: en-US
From: Henry Wang <xin.wang2@amd.com>
In-Reply-To: <alpine.DEB.2.22.394.2405211815040.1052252@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: None (SATLEXMB05.amd.com: xin.wang2@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000971E2:EE_|PH7PR12MB7186:EE_
X-MS-Office365-Filtering-Correlation-Id: 330c5ee1-21f2-4646-0e92-08dc79fda5a9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230031|1800799015|36860700004|376005|82310400017;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?NGpLVFNIQ3hzd3JaazlzM3UxMkI4dmFmV0ljeXhCYmNWbFozYVBSTys2SjI4?=
 =?utf-8?B?d2RrVDVKQWgxd3J6MVQ2YmtpSkVYYnhTUGVQem5KaWswZHN0blJ3T1JOUERw?=
 =?utf-8?B?VVNoK2RXRGFReGxkSS9MRkY4VzQwaThBZ0tMcUs4S2NlS3FQNUU1QWhuUnVB?=
 =?utf-8?B?K3U5azdBRnMwZmszRzdMWHdNRWxBMnBCWmgwNm81eENJZTdzK3BrMTFreVNV?=
 =?utf-8?B?RGtJVnd1bUxsRE1LWHhmcXhyTGlPQ2NUVkQ0R2ZmcHBLWHVEbkQ2MTVNMWpP?=
 =?utf-8?B?NzVIczkzTXZCVm0xK2R6NmMyd3k5WWVTMlkwd2sxUG9MMllaUWpSTlRsNllP?=
 =?utf-8?B?MDNpTzBkME9yYkRkdUdsaDY2N0l5RHgxSDFhL200MmxhV0RoZmhvNTNJbVFw?=
 =?utf-8?B?V1RLdjg0ODZtWUJvVzNRWVRYU2tRd3FHanZsanVUbzJWM0VjV0JpaFluQjVk?=
 =?utf-8?B?ZTltRkZjVGRYVXY2VldkdEQ3MnpnREJXMUZBYUFSQUlKZGo5UW9OVjZoNzhv?=
 =?utf-8?B?NXA5L3J2bnZLUDVMZnZOcGY1VENaZUJUSlJDUFpoT0wxanJ0RUFYcVdobis2?=
 =?utf-8?B?V3FEUlFDWkNJTjJWWHlMQTB5ajlDV3NWYXJxdEE4Q0FRNG8wTWZNYm9TZjM4?=
 =?utf-8?B?L1ovY1lpUFVDL3pQejlaMUx3R1ZUcnFQSWFGM2FINTRIdUd1SHZtQW8zdHEx?=
 =?utf-8?B?dHNoc0t1elNmYzlhUEljalZFSjNHM1pBL3RGQ2ptbE82amF1UURML1FUZWZO?=
 =?utf-8?B?TjRuVys1eThyaWhIdEc5aTdWUEhWcXNxUVN1cTRIUGlra3dPbkVLS3dzVnFz?=
 =?utf-8?B?Y2hvNmVTUHlDZ0tNQ2tqbVFLZlFWQjQ1bm45TTlQSFlwaTRUQmxoTVZiMWsr?=
 =?utf-8?B?WWlBMFl5M25PQVIwTjhHakYzRUVRcjVIWEwrRFNLenpqSFh4QWpvN1U3R29F?=
 =?utf-8?B?TzlQVnhIcWprWkYzYklqRzJOMnZ2SVl2ajdYcWVLaXN3eTFxVHkyeTR5RDRy?=
 =?utf-8?B?YnZjVmMzUEN3WGpQM3JPVlNiVUJ4NXJhdU9WVk5MMThLU3ZCNk1QU2JLWjg3?=
 =?utf-8?B?bEk5a1ZRd0d3bmRxVnZDUjU1TC9xMndwUDF0Y0l5NFpYRGxUMG4zalIvVnl6?=
 =?utf-8?B?SlpTT1dQS3RqeUZPRjErekgrdmllc3lmWTlzZDdPWmd0T2JHc3lpcXd5bzJZ?=
 =?utf-8?B?M1d5cTN4RU1WOHMwS0daN0FUa0pKRytWZVl6anc3NjEzR2FSTEF6TW5tbGJ2?=
 =?utf-8?B?bTY0d1VVUU9TaHhCK09nNlM4MkN2aTEvMlN6MlduNHZZYmNNYlp4blNBZnNp?=
 =?utf-8?B?R2JmMmtFQittbmlXS0RRcFlqUXQrYlY2UzBwdEhHSkFGK3MxWGN6eElSUCs1?=
 =?utf-8?B?dzRYTk51V24zS3RhbDhkb24zQURiZ1Q1b0s3R1VBYXRqWW9LWXFSWHZpRWor?=
 =?utf-8?B?U0lPaHZJejNZZWZIQ2g3OTFHc0J0YjVId1VOa2trM09QN3JyN293N3dZbksv?=
 =?utf-8?B?c0p5dE9RTk5TdDRrUW04alFqMlBNWjJ2ZW5WMzRscXFydzd6MWZYd2RqKyti?=
 =?utf-8?B?dFpzeFZ0MXhzWkorMW82ZGR6eUg2dGluOWgwL0F1KzhpcVlnZG1xTkVDOExp?=
 =?utf-8?B?QmpBaXMrQm5nc2taQXBNQVBPS1VWVGtPZWV1by9IMVFwek5OWVd3UUlYeHFj?=
 =?utf-8?B?WXIvcG5NZ1NkUUZWMklMamdFK1FBek92Y0lxNzI3eVJ0VGFldWd0Y0dwcVVV?=
 =?utf-8?B?Z0UxZWpsQlVRaGo4TDJnajJubU5Cb2k4eHZ2RHI4NStwMnJYK25DYWhVaDhs?=
 =?utf-8?Q?fUGyGvz6XWjXGXd/RQP4LKoYRVzDyOIXuImBI=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(1800799015)(36860700004)(376005)(82310400017);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2024 01:22:29.1368
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 330c5ee1-21f2-4646-0e92-08dc79fda5a9
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000971E2.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7186

Hi Stefano,

On 5/22/2024 9:16 AM, Stefano Stabellini wrote:
> On Wed, 22 May 2024, Henry Wang wrote:
>> Hi Julien,
>>
>> On 5/21/2024 8:30 PM, Julien Grall wrote:
>>> Hi,
>>>
>>> On 21/05/2024 05:35, Henry Wang wrote:
>>>> diff --git a/xen/arch/arm/gic-vgic.c b/xen/arch/arm/gic-vgic.c
>>>> index 56490dbc43..956c11ba13 100644
>>>> --- a/xen/arch/arm/gic-vgic.c
>>>> +++ b/xen/arch/arm/gic-vgic.c
>>>> @@ -439,24 +439,33 @@ int vgic_connect_hw_irq(struct domain *d, struct
>>>> vcpu *v, unsigned int virq,
>>>>          /* We are taking to rank lock to prevent parallel connections. */
>>>>        vgic_lock_rank(v_target, rank, flags);
>>>> +    spin_lock(&v_target->arch.vgic.lock);
>>> I know this is what Stefano suggested, but v_target would point to the
>>> current affinity whereas the interrupt may be pending/active on the
>>> "previous" vCPU. So it is a little unclear whether v_target is the correct
>>> lock. Do you have more pointer to show this is correct?
>> No I think you are correct, we have discussed this in the initial version of
>> this patch. Sorry.
>>
>> I followed the way from that discussion to note down the vcpu ID and retrieve
>> here, below is the diff, would this make sense to you?
>>
>> diff --git a/xen/arch/arm/gic-vgic.c b/xen/arch/arm/gic-vgic.c
>> index 956c11ba13..134ed4e107 100644
>> --- a/xen/arch/arm/gic-vgic.c
>> +++ b/xen/arch/arm/gic-vgic.c
>> @@ -439,7 +439,7 @@ int vgic_connect_hw_irq(struct domain *d, struct vcpu *v,
>> unsigned int virq,
>>
>>       /* We are taking to rank lock to prevent parallel connections. */
>>       vgic_lock_rank(v_target, rank, flags);
>> -    spin_lock(&v_target->arch.vgic.lock);
>> + spin_lock(&d->vcpu[p->spi_vcpu_id]->arch.vgic.lock);
>>
>>       if ( connect )
>>       {
>> @@ -465,7 +465,7 @@ int vgic_connect_hw_irq(struct domain *d, struct vcpu *v,
>> unsigned int virq,
>>               p->desc = NULL;
>>       }
>>
>> -    spin_unlock(&v_target->arch.vgic.lock);
>> + spin_unlock(&d->vcpu[p->spi_vcpu_id]->arch.vgic.lock);
>>       vgic_unlock_rank(v_target, rank, flags);
>>
>>       return ret;
>> diff --git a/xen/arch/arm/include/asm/vgic.h b/xen/arch/arm/include/asm/vgic.h
>> index 79b73a0dbb..f4075d3e75 100644
>> --- a/xen/arch/arm/include/asm/vgic.h
>> +++ b/xen/arch/arm/include/asm/vgic.h
>> @@ -85,6 +85,7 @@ struct pending_irq
>>       uint8_t priority;
>>       uint8_t lpi_priority;       /* Caches the priority if this is an LPI. */
>>       uint8_t lpi_vcpu_id;        /* The VCPU for an LPI. */
>> +    uint8_t spi_vcpu_id;        /* The VCPU for an SPI. */
>>       /* inflight is used to append instances of pending_irq to
>>        * vgic.inflight_irqs */
>>       struct list_head inflight;
>> diff --git a/xen/arch/arm/vgic.c b/xen/arch/arm/vgic.c
>> index c04fc4f83f..e852479f13 100644
>> --- a/xen/arch/arm/vgic.c
>> +++ b/xen/arch/arm/vgic.c
>> @@ -632,6 +632,7 @@ void vgic_inject_irq(struct domain *d, struct vcpu *v,
>> unsigned int virq,
>>       }
>>       list_add_tail(&n->inflight, &v->arch.vgic.inflight_irqs);
>>   out:
>> +    n->spi_vcpu_id = v->vcpu_id;
>>       spin_unlock_irqrestore(&v->arch.vgic.lock, flags);
>>
>>       /* we have a new higher priority irq, inject it into the guest */
>>       vcpu_kick(v);
>>
>>
>>> Also, while looking at the locking, I noticed that we are not doing anything
>>> with GIC_IRQ_GUEST_MIGRATING. In gic_update_one_lr(), we seem to assume that
>>> if the flag is set, then p->desc cannot be NULL.
>>>
>>> Can we reach vgic_connect_hw_irq() with the flag set?
>> I think even from the perspective of making the code extra safe, we should
>> also check GIC_IRQ_GUEST_MIGRATING as the LR is allocated for this case. I
>> will also add the check of GIC_IRQ_GUEST_MIGRATING here.
> Yes. I think it might be easier to check for GIC_IRQ_GUEST_MIGRATING
> early and return error immediately in that case. Otherwise, we can
> continue and take spin_lock(&v_target->arch.vgic.lock) because no
> migration is in progress

Ok, this makes sense to me, I will add

     if( test_bit(GIC_IRQ_GUEST_MIGRATING, &p->status) )
     {
         vgic_unlock_rank(v_target, rank, flags);
         return -EBUSY;
     }

right after taking the vgic rank lock.

Kind regards,
Henry

