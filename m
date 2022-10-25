Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4523B60C615
	for <lists+xen-devel@lfdr.de>; Tue, 25 Oct 2022 10:08:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.429625.680709 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1onEyV-0000Nb-Ph; Tue, 25 Oct 2022 08:07:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 429625.680709; Tue, 25 Oct 2022 08:07:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1onEyV-0000Kh-Mz; Tue, 25 Oct 2022 08:07:51 +0000
Received: by outflank-mailman (input) for mailman id 429625;
 Tue, 25 Oct 2022 08:07:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=N5aB=22=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1onEyU-0000Kb-6m
 for xen-devel@lists.xenproject.org; Tue, 25 Oct 2022 08:07:50 +0000
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2060.outbound.protection.outlook.com [40.107.244.60])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1c3a1411-543c-11ed-91b5-6bf2151ebd3b;
 Tue, 25 Oct 2022 10:07:48 +0200 (CEST)
Received: from DM6PR05CA0059.namprd05.prod.outlook.com (2603:10b6:5:335::28)
 by DM4PR12MB7767.namprd12.prod.outlook.com (2603:10b6:8:100::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.35; Tue, 25 Oct
 2022 08:07:44 +0000
Received: from DM6NAM11FT109.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:335:cafe::6b) by DM6PR05CA0059.outlook.office365.com
 (2603:10b6:5:335::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5769.8 via Frontend
 Transport; Tue, 25 Oct 2022 08:07:44 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT109.mail.protection.outlook.com (10.13.173.178) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5746.16 via Frontend Transport; Tue, 25 Oct 2022 08:07:44 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Tue, 25 Oct
 2022 03:07:41 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Tue, 25 Oct
 2022 01:07:12 -0700
Received: from [10.71.192.110] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.31 via Frontend
 Transport; Tue, 25 Oct 2022 03:07:11 -0500
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
X-Inumbo-ID: 1c3a1411-543c-11ed-91b5-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gvJ3XmtDzO5eJCk6Nq+xUDXapc1KdtEUGRwv/l1fRqje5HKIunVuNkr8weQa7XLtnl5bP2/ZNuF5Fe9EtLyf1hwlf9GWwn5I/vUpW6NIx3ThoK1B3OqZEVdAq8QDCSCKplKYLpurYNDsmrAIFaC3hNglg+3e2GrJyrxr7AdygfsMj5NsB0NHdKkYtd1a4TkSpQoPT0CNCkM4tAO9zD6gsgqwpvSP/57HxyLfxre3Qd32iLW2ZvAPV5djZnJHc1nTQc+ZhmOk6raZ/qEHV1Pzwnc/8GHfV/wx47f3FqUTjihYmAHqGRjJ+cmG2er2q1RtKj7K4Ku4umSkSdb0iIVJFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AO+q60fC8oAS8vOAuaw2LYlhKXmeCxSCxPF1xUsVmq0=;
 b=MK0Ykm6tzHBdDGZ6IFYxEhJ0ELQqTnG2RMaHhLmNKMWiMX3E7k4t6+ImUTmmDE6u/2G+Fe3FTjU0UokVKipombir8BQdRKCbBaX/I07Awk3cxOyRe4vgAI/9/Qei5EbyhEuOaBAPaCxu8A+UmyLmsbsFvCinvoJpOqggjA9E4TJrh6p30b+qjIZxWxqSHPtE7Yb+e2gV5aBJ91t+lKgY+M+u48HXTD2TlNvilagjGKL3w2Y9L3ozgaN8laLl2YbiukAY9a1N9pLQYpdnPeW8dZecPjUYhZCXWGctMCk445pbg4IM0umo7N77jDWAPC1lDCPj/iuR1oufX+/bP6A5hA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=arm.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AO+q60fC8oAS8vOAuaw2LYlhKXmeCxSCxPF1xUsVmq0=;
 b=Jxx9P3vWZBgqQnU4qc6Umc1CIVUWbXERSBZaTo/7ZhMCRMjkJleyHuA7yrO0hrgAbTY0k0bbu0xHR6N+nnrxwxlQoc9i+svLMOU4AWQOmjpZ3ZnYlUD5FFULG2YF5qpMRPU0+Eui6AW3NY5kbTzMLoG7RfgD+0N7h4CII+puPqc=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <89ff9e50-be23-82c2-cd6b-81e05d339778@amd.com>
Date: Tue, 25 Oct 2022 10:07:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: Deadcode discussion based on Arm NS phys timer
Content-Language: en-US
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
References: <d55938a3-aaca-1d01-b34f-858dbca9830b@amd.com>
 <8691e100-4548-9752-8e7e-b292643cae83@xen.org>
 <6aefd6d6-45a2-a1f3-24da-8bbbba22fc08@amd.com>
 <aff58db0-646c-6699-48af-033e28c5626f@xen.org>
 <alpine.DEB.2.22.394.2210241819420.1151068@ubuntu-linux-20-04-desktop>
 <ed0bf3da-fe9f-e00c-9bc3-35e10840701e@amd.com>
 <06D2C614-0F17-4364-BE52-FB0DB51D097B@arm.com>
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <06D2C614-0F17-4364-BE52-FB0DB51D097B@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT109:EE_|DM4PR12MB7767:EE_
X-MS-Office365-Filtering-Correlation-Id: a8b2ca3e-1681-4f4b-e250-08dab65fff32
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	u7mlgpcUuXPZe0zFxBWdToX1ftcEGbjMG4PURWYaxtNd8VZJ74NvGHWb6isMKnTIofg2mZLr1uUpda4hp+DZyFk9WyOQKSEG5C0H5S4LUT8GH7KK3WaxjiXYo7fNPBYkKFRkqIlXT1ucPsyOcE7dwzkeOBbp+EbkTUiOk2WQJWW15OtktU51+AuR4udbtXWcCyZQzhMcbVsN8EsMvgvR7aA9pmfeSAh1JrlpNGBegq5s6dtHfZt4a0Z5gLoBCHvA+8q+TQjh3dZlw4p0nylLJ3BBgLkuj60pxvT6R79Tmi+Y6/ABmbNOeeVVx+M1OAIUWW5HwnZMBmappKRCV2P/A7MoP3vUpRLPahkecrvRLq4FEOEVdqDrgVJ6Tl6rnxojcXSgy9F4DJzmDrUx6dRN3nizOfvD9DFigd2xFhgx2e/aSVBbyJy6ul9Rid9Imxz1sfKgLx5hd9GFIVpoaNUBxRDBITA60SIAFHrhMpXQMkVWAoBuvgoMNS3n09Z5+WuDJnMDZjf7xIEaXt3RVg3KgquG4jec10TXf/luX68P3sXyhpMqNxOrDRSevwAzH9kGe0mlqA5mmGYMNsJWvbICKfyLHddseGKXFa8QAbgBL4x8PThkG/DFm/N0+hzyF3jMSQkWvrzW3OiIEvJCeTZONQFtveM5x98xts0/My+xm/gbjBMWBmji8UyoLVB8cOonKTC0KFJwgJznsyMUccjNDsycMsqf71U1YUwVyJV8YyVMi6vMynp89N3QbDRqIOyibr22q1eZfIpnII58rsHWeXsVkP/sW0jJ/8pVDl91W5RKX0w8gM4plHB+Yohjv3q3H9073YN4YzMqZ4UbWt2cEw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(346002)(136003)(396003)(376002)(39860400002)(451199015)(36840700001)(40470700004)(46966006)(36756003)(31686004)(478600001)(66899015)(31696002)(86362001)(82310400005)(82740400003)(81166007)(356005)(336012)(316002)(36860700001)(70206006)(83380400001)(2906002)(16576012)(40480700001)(6916009)(70586007)(40460700003)(47076005)(2616005)(53546011)(186003)(44832011)(5660300002)(4326008)(8936002)(41300700001)(26005)(54906003)(8676002)(426003)(43740500002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Oct 2022 08:07:44.5238
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a8b2ca3e-1681-4f4b-e250-08dab65fff32
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DM6NAM11FT109.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB7767

Hi Bertrand,

On 25/10/2022 09:45, Bertrand Marquis wrote:
> 
> 
> Hi Michal,
> 
>> On 25 Oct 2022, at 08:11, Michal Orzel <michal.orzel@amd.com> wrote:
>>
>> Hi,
>>
>> On 25/10/2022 03:29, Stefano Stabellini wrote:
>>>
>>>
>>> On Mon, 24 Oct 2022, Julien Grall wrote:
>>>>> On 24/10/2022 12:51, Julien Grall wrote:
>>>>>> Caution: This message originated from an External Source. Use proper
>>>>>> caution when opening attachments, clicking links, or responding.
>>>>>>
>>>>>>
>>>>>> On 24/10/2022 10:07, Michal Orzel wrote:
>>>>>>> Hello,
>>>>>>
>>>>>> Hi Michal,
>>>>>>
>>>>>>> Recently I came across a deadcode in Xen Arm arch timer code. Briefly
>>>>>>> speaking, we are routing
>>>>>>> the NS phys timer (CNTP) IRQ to Xen, even though Xen does not make use
>>>>>>> of it (as it uses the hypervisor timer CNTHP).
>>>>>>> This timer is fully emulated, which means that there is nothing that can
>>>>>>> trigger such IRQ. This code is
>>>>>>> a left over from early days, where the CNTHP was buggy on some models
>>>>>>> and we had to use the CNTP instead.
>>>>>>>
>>>>>>> As far as the problem itself is not really interesting, it raises a
>>>>>>> question of what to do with a deadcode,
>>>>>>> as there might be/are other deadcode places in Xen.
>>>>>>
>>>>>> There are multiple definition of deadcode. Depending on which one you
>>>>>> chose, then this could cover IS_ENABLED() and possibly #ifdef. So this
>>>>>> would result to a lot of places impacted with the decision.
>>>>>>
>>>>>> So can you clarify what you mean by deadcode?
>>>>> In the timer example, I think we have both a deadcode and unreachable code.
>>>>> For the purpose of this discussion, let's take the MISRA definition of a
>>>>> deadcode which is a "code that can be executed
>>>>> but has no effect on the functional behavior of the program". This differs
>>>>> from the unreachable code definition that is
>>>>> a "code that cannot be executed". Setting up the IRQ for Xen is an example
>>>>> of a deadcode. Code within IRQ handler is an unreachable code
>>>>> (there is nothing that can trigger this IRQ).
>>>>>
>>>>> What I mean by deadcode happens to be the sum of the two cases above i.e.
>>>>> the code that cannot be executed as well as the code that
>>>>> does not impact the functionality of the program.
>>>>>
>>>>>>
>>>>>>> One may say that it is useful to keep it, because one day,
>>>>>>> someone might need it when dealing with yet another broken HW. Such
>>>>>>> person would still need to modify the other
>>>>>>> part of the code (e.g. reprogram_timer), but there would be less work
>>>>>>> required overall. Personally, I'm not in favor of
>>>>>>> such approach, because we should not really support possible scenarios
>>>>>>> with broken HW (except for erratas listing known issues).
>>>>>>
>>>>>> The difference between "broken HW" and "HW with known errata" is a bit
>>>>>> unclear to me. Can you clarify how you would make the difference here?
>>>>>>
>>>>>> In particular, at which point do you consider that the HW should not be
>>>>>> supported by Xen?
>>>>> I'm not saying that HW should not be supported. The difference for me
>>>>> between broken HW and
>>>>> HW with known errata is that for the former, the incorrect behavior is often
>>>>> due to the early support stage,
>>>>> using emulators/models instead of real HW, whereas for the latter, the HW is
>>>>> already released and it happens to be that it is buggy
>>>>> (the HW vendor is aware of the issue and released erratas).
>>>>
>>>> Thanks for the clarification. What I would call broken is anything that can't
>>>> be fixed in software. For a not too fictional example, an HW where PCI devices
>>>> are using the same stream ID. So effectively, passthrough can't be safely
>>>> supported.
>>>>
>>>> Regarding, not yet released HW, I don't think Xen should have workaround for
>>>> them. I wouldn't even call it "broken" because they are not yet released and
>>>> it is common to have bug in early revision.
>>>>
>>>>> Do we have any example in Xen for supporting broken HW,
>>>>> whose vendor is not aware of the issue or did not release any errata?
>>>> I will not cite any HW on the ML. But from my experience, the vendors are not
>>>> very vocal about issues in public (some don't even seem to have public doc).
>>>> The best way to find the issues is to look at Linux commit.
>>>>
>>>>>
>>>>>>
>>>>>>> Also, as part of the certification/FUSA process, there should be no
>>>>>>> deadcode and we should have explanation for every block of code.
>>>>>>
>>>>>> See above. What are you trying to cover by deadcode? Would protecting
>>>>>> code with IS_ENABLED() (or #ifdef) ok?
>>>>> I think this would be ok from the certification point of view (this would at
>>>>> least means, that we are aware of the issue
>>>>> and we took some steps). Otherwise, such code is just an example of a
>>>>> deadcode/unreachable code.
>>>>
>>>> Thanks for the clarification. So the exact approach will depend on the
>>>> context....
>>>>
>>>>>>> There are different ways to deal with a deadcode: > 1. Get rid of it
>>>>>>> completely
>>>>>>> 2. Leave it as it is
>>>>
>>>> ... this is my preference in the context of the timer.
>>>
>>> From a certification point of view, the fewer lines of code the better,
>>> and ideally all the lines of code used for the certified build should be
>>> testable and used.
>>>
>>> So I think 2. is the lest useful option from a certification
>>> perspective. For this reason, I'd prefer another alternative.
>>>
>>>
>>>> If the other don't like it, then 1 would be my preference.
>>>>
>>>> In general, my preference would be either 3.3 or 3.2 (see below).
>>>
>>> I also think that 3.2 and 3.3 are good options for the general case. For
>>> the timer, I can see why 1 is your (second) preference and I am fine
>>> with 1 as well.
>> Ok, sounds good to me. Let's still give Bertrand the chance to share his opinion.
> 
> We need to get rid of dead code and removing it is not always the best solution.
> 
> If the code is or could be useful for someone some day, protecting it with ifdef is ok.
> 
> In the mid term we will have to introduce a lot more ifdef or IS_ENABLED in the
> code so that we can compile out what we do not need and code not applying to
> some hardware is a case where we will do that (does not mean that by default
> we will not compile it in but we will make it easier to reduce the code size for a
> specific use case).
> 
> So 3.2 and 3.3 are ok for me.

So we all agree that the code in the current form is a no go from certification purposes.
That is good :)

The reason why I opt for solution 1 and not the others is that in the latter case it would
mean introducing the Kconfig option to allow user to select the timer to be used by Xen.
This is not really correct. Also in the current form, it would also require adding more
code to time.c code because at the moment using CNTP for Xen would not work out of the box.
The architecture defines the hypervisor timer for a purpose. If it does not work, it means
that the HW is problematic. I agree that we would want to support such use case but I'm not
really aware of any issue like that. Adding more code and Kconfig options just because
one day someone may face issues with a new HW is something I am not a fan of.

I would agree with your solution under the condition that the code is already ready
for the timer switch.

I guess we need another round of sharing opinions.

> 
>>
>>>
>>>
>>>>>>> 3. Admit that it can be useful one day and:
>>>>>>>    3.1. protect it with #if 0
>>>>
>>>> #if 0 should not be used in Xen code. IMHO this is the worse of all the world.
>> I share your opinion here Julien. Unfortunately we still have quite a few examples
>> in the Arm code using this either to mark something as TODO or to comment out
>> parts of the code waiting for future support. This is mostly in SMMU code that
>> was taken from Linux but already diverged quite far (maybe some cleanup is necessary).
> 
> Definitely the SMMU code will need some cleaning.
> #if 0 are a no go from a certification point of view.
> 
> Cheers
> Bertrand
> 
>>
>>>>
>>>>>>>    3.2. protect it with a new Kconfig option (disabled by default)
>>>>>>> using #ifdef
>>>>>>>    3.3. protect it with a new Kconfig option (disabled by default)
>>>>>>> using IS_ENABLED (to make sure code always compile)
>>>>
>>>> I would prefer 3.3 over 3.2. 3.2 would be used if it is too difficult to get
>>>> the code compiled when !IS_ENABLED.
>>>>
>>>> Similar to one if this is to move all the affected code in a separate file
>>>> with using obj-$(CONFIG...). That would only work for large chunk of code and
>>>> would be preferred over 3.2.
>>>
>>
>> ~Michal
> 

~Michal

