Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B7C360C4C8
	for <lists+xen-devel@lfdr.de>; Tue, 25 Oct 2022 09:12:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.429590.680642 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1onE6Z-0008Ns-RT; Tue, 25 Oct 2022 07:12:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 429590.680642; Tue, 25 Oct 2022 07:12:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1onE6Z-0008M5-Oe; Tue, 25 Oct 2022 07:12:07 +0000
Received: by outflank-mailman (input) for mailman id 429590;
 Tue, 25 Oct 2022 07:12:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=N5aB=22=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1onE6Y-0008Ly-7l
 for xen-devel@lists.xenproject.org; Tue, 25 Oct 2022 07:12:06 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2040.outbound.protection.outlook.com [40.107.236.40])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5274ce19-5434-11ed-8fd0-01056ac49cbb;
 Tue, 25 Oct 2022 09:12:02 +0200 (CEST)
Received: from MW4PR03CA0240.namprd03.prod.outlook.com (2603:10b6:303:b9::35)
 by LV2PR12MB5965.namprd12.prod.outlook.com (2603:10b6:408:172::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.26; Tue, 25 Oct
 2022 07:11:59 +0000
Received: from CO1NAM11FT059.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:b9:cafe::b3) by MW4PR03CA0240.outlook.office365.com
 (2603:10b6:303:b9::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.26 via Frontend
 Transport; Tue, 25 Oct 2022 07:11:58 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT059.mail.protection.outlook.com (10.13.174.160) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5746.16 via Frontend Transport; Tue, 25 Oct 2022 07:11:58 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Tue, 25 Oct
 2022 02:11:56 -0500
Received: from [10.71.192.110] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.31 via Frontend
 Transport; Tue, 25 Oct 2022 02:11:55 -0500
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
X-Inumbo-ID: 5274ce19-5434-11ed-8fd0-01056ac49cbb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ADSBy+sEbRz3pKQJzRDbOz6zW5nz9oGcwuZfOY9pAY7k3iQYrqs27rrBhMN2iAXLlSiV953daeTn0dzgOWnHWzDlDveYxTLd8Mh9QG0bBZ6gfkMz6iYxiSYLRSFMoWK11yq956R38s9BFW/eZLXB9xqHVL8mY679F3EBS7/wXxlZtvpctiF391d1QB3SHLgckN62frrZICgJ6mDkMXnUaUMeC5pCZ09ulVo8t9Y3V4+c6lqgLW7cnkhUjPrqo0earuxs30Y+EJrIkyrD5kft2qrteXRfgvXKBcMUrclK6KK+yfQWhdPbP9i950XlDATlis5dTJydVi1p+HiIdm8ADA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s60BJEcvxeK1+2zS14ot2I/lAGyI3PTzqa93cEn7rQs=;
 b=XzT5Lk8NiVsaXjNL+CZBNjpxawsjwz8S1Nc0WcGeAxjZQ+t/T7EC2yBLEtDGpCMgiJdJZ0JOGNSjc5ZBh8IjcqHb3AOKa5H346EZzRc6q34N8LkjwGtLgUpq/V/x2jX7GCDGlZgYMi2LJvXVh7tOAij4lIlhhCa5P1sgblT6WhG+bPnx6GL55I+f1Zvpno8ZleBUXLoNlbU28sxzNcxHkR2Lmiyppri83/wQdRtF7ijjuM9lyWUQFd5hw6t7JPG8HVBIPGIta2fAIXyrKEp17Qz3NMB1JdxpkMTSoytu3Lx7KlOjtox9qhMYqh+WboevnzIsRTO8v7wo7F1jn7SVcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s60BJEcvxeK1+2zS14ot2I/lAGyI3PTzqa93cEn7rQs=;
 b=vKTuoXds1jab5UeD5SsTf6XFaApOQUgDyIjWFEKHFcwFJDZa4xtCHUo61Vz8L3m04vze2OBPShZARx6qMOh9z1A3II8rgnVhyOPm2wVDgYVf8nnzuTAALd/uD/rXKLnv/Y6SZbaGvTuYhZGfmdnNb62u9+tSIlObEWMQdriiTUs=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <ed0bf3da-fe9f-e00c-9bc3-35e10840701e@amd.com>
Date: Tue, 25 Oct 2022 09:11:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: Deadcode discussion based on Arm NS phys timer
To: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Bertrand Marquis <Bertrand.Marquis@arm.com>
References: <d55938a3-aaca-1d01-b34f-858dbca9830b@amd.com>
 <8691e100-4548-9752-8e7e-b292643cae83@xen.org>
 <6aefd6d6-45a2-a1f3-24da-8bbbba22fc08@amd.com>
 <aff58db0-646c-6699-48af-033e28c5626f@xen.org>
 <alpine.DEB.2.22.394.2210241819420.1151068@ubuntu-linux-20-04-desktop>
Content-Language: en-US
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <alpine.DEB.2.22.394.2210241819420.1151068@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT059:EE_|LV2PR12MB5965:EE_
X-MS-Office365-Filtering-Correlation-Id: f7f86529-07db-4acd-f778-08dab65834fe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	T108pff/N6ZZbV/XZ+Ym3g7MyHquVe3pIeGudB2wJAiP/mWKHrJmuH5ohElynOQzLFwHbrjZ45CV2I+s8/ZnsoLhbyKaHK+WEghVbjQuMejR+DoVSMPfV1B75ignsldcWV8A70dVd5AJnwElAm6jI21ykjbMTyvtExROncr18HHhZIReOZbhhKnowDaBrQ+xRgK107bjQoUhPO0Xqx/LNX8Eu0rGLwMU4KWB3GFHMEUfE0t+zkHZLnJQu3Sar/kbOcs73uNEh48HCNQbzFiKE4eO8oaGwCcUeJpdmzNgxlpVHZ1IOTzwAax+Lsbj+HnfNKAmSgEwCvsOKk5X0diR0RD/PVRdl4JY1/NxoFlUiIaDXeChfLzm1JBqHvc3+2wEehZykqOh0zI9aRMX4eqInBjxUKKmaOcd6jqnzlgPtFsI+qdh1vY7u7qYGPlS1GPDUtQ/QffVv+dVEJJ8oa/bKKz0US2BrUkyuV5h2STfQrUcQ3hFCld/u7LFIMH2+ocsKAITTRJi/Op4PFPoffKlXORY2p0gbYhKmL/q5UWJp+TvGlR4Uj2G0lNLZ470FYsOXxg9Y3WOA0kvxndMiRB5xkr+Y+hOxs2vIcGLxePnozUuD/THQoDdBT/DNsinsqK3B3AmbpM0PMwrgEy1+/JUWo0RhbSdwQkXnMJ8BGw6YRSzjTSYEAasZCM136WIiVWtYobDIim0543fCHFIoUf1dDDiV32ajh6TDk+UvRAA15211g0wNh3ZQ/+GCPhk/OFGR9xlAHB1wyk8/WUwBikzxy46mqcwE+N/KTFSykNpLg2RPRqI07khbx1w+GexrmKfX8hfJBbihobwx/1iD/tWBg==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(396003)(376002)(136003)(346002)(451199015)(36840700001)(40470700004)(46966006)(82310400005)(6666004)(41300700001)(82740400003)(53546011)(16576012)(316002)(54906003)(5660300002)(26005)(356005)(40480700001)(110136005)(478600001)(4326008)(40460700003)(81166007)(36756003)(44832011)(8936002)(70206006)(31696002)(83380400001)(86362001)(8676002)(47076005)(426003)(336012)(186003)(31686004)(66899015)(2616005)(36860700001)(2906002)(70586007)(43740500002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Oct 2022 07:11:58.7442
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f7f86529-07db-4acd-f778-08dab65834fe
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1NAM11FT059.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB5965

Hi,

On 25/10/2022 03:29, Stefano Stabellini wrote:
> 
> 
> On Mon, 24 Oct 2022, Julien Grall wrote:
>>> On 24/10/2022 12:51, Julien Grall wrote:
>>>> Caution: This message originated from an External Source. Use proper
>>>> caution when opening attachments, clicking links, or responding.
>>>>
>>>>
>>>> On 24/10/2022 10:07, Michal Orzel wrote:
>>>>> Hello,
>>>>
>>>> Hi Michal,
>>>>
>>>>> Recently I came across a deadcode in Xen Arm arch timer code. Briefly
>>>>> speaking, we are routing
>>>>> the NS phys timer (CNTP) IRQ to Xen, even though Xen does not make use
>>>>> of it (as it uses the hypervisor timer CNTHP).
>>>>> This timer is fully emulated, which means that there is nothing that can
>>>>> trigger such IRQ. This code is
>>>>> a left over from early days, where the CNTHP was buggy on some models
>>>>> and we had to use the CNTP instead.
>>>>>
>>>>> As far as the problem itself is not really interesting, it raises a
>>>>> question of what to do with a deadcode,
>>>>> as there might be/are other deadcode places in Xen.
>>>>
>>>> There are multiple definition of deadcode. Depending on which one you
>>>> chose, then this could cover IS_ENABLED() and possibly #ifdef. So this
>>>> would result to a lot of places impacted with the decision.
>>>>
>>>> So can you clarify what you mean by deadcode?
>>> In the timer example, I think we have both a deadcode and unreachable code.
>>> For the purpose of this discussion, let's take the MISRA definition of a
>>> deadcode which is a "code that can be executed
>>> but has no effect on the functional behavior of the program". This differs
>>> from the unreachable code definition that is
>>> a "code that cannot be executed". Setting up the IRQ for Xen is an example
>>> of a deadcode. Code within IRQ handler is an unreachable code
>>> (there is nothing that can trigger this IRQ).
>>>
>>> What I mean by deadcode happens to be the sum of the two cases above i.e.
>>> the code that cannot be executed as well as the code that
>>> does not impact the functionality of the program.
>>>
>>>>
>>>>> One may say that it is useful to keep it, because one day,
>>>>> someone might need it when dealing with yet another broken HW. Such
>>>>> person would still need to modify the other
>>>>> part of the code (e.g. reprogram_timer), but there would be less work
>>>>> required overall. Personally, I'm not in favor of
>>>>> such approach, because we should not really support possible scenarios
>>>>> with broken HW (except for erratas listing known issues).
>>>>
>>>> The difference between "broken HW" and "HW with known errata" is a bit
>>>> unclear to me. Can you clarify how you would make the difference here?
>>>>
>>>> In particular, at which point do you consider that the HW should not be
>>>> supported by Xen?
>>> I'm not saying that HW should not be supported. The difference for me
>>> between broken HW and
>>> HW with known errata is that for the former, the incorrect behavior is often
>>> due to the early support stage,
>>> using emulators/models instead of real HW, whereas for the latter, the HW is
>>> already released and it happens to be that it is buggy
>>> (the HW vendor is aware of the issue and released erratas).
>>
>> Thanks for the clarification. What I would call broken is anything that can't
>> be fixed in software. For a not too fictional example, an HW where PCI devices
>> are using the same stream ID. So effectively, passthrough can't be safely
>> supported.
>>
>> Regarding, not yet released HW, I don't think Xen should have workaround for
>> them. I wouldn't even call it "broken" because they are not yet released and
>> it is common to have bug in early revision.
>>
>>> Do we have any example in Xen for supporting broken HW,
>>> whose vendor is not aware of the issue or did not release any errata?
>> I will not cite any HW on the ML. But from my experience, the vendors are not
>> very vocal about issues in public (some don't even seem to have public doc).
>> The best way to find the issues is to look at Linux commit.
>>
>>>
>>>>
>>>>> Also, as part of the certification/FUSA process, there should be no
>>>>> deadcode and we should have explanation for every block of code.
>>>>
>>>> See above. What are you trying to cover by deadcode? Would protecting
>>>> code with IS_ENABLED() (or #ifdef) ok?
>>> I think this would be ok from the certification point of view (this would at
>>> least means, that we are aware of the issue
>>> and we took some steps). Otherwise, such code is just an example of a
>>> deadcode/unreachable code.
>>
>> Thanks for the clarification. So the exact approach will depend on the
>> context....
>>
>>>>> There are different ways to deal with a deadcode: > 1. Get rid of it
>>>>> completely
>>>>> 2. Leave it as it is
>>
>> ... this is my preference in the context of the timer.
> 
> From a certification point of view, the fewer lines of code the better,
> and ideally all the lines of code used for the certified build should be
> testable and used.
> 
> So I think 2. is the lest useful option from a certification
> perspective. For this reason, I'd prefer another alternative.
> 
> 
>> If the other don't like it, then 1 would be my preference.
>>
>> In general, my preference would be either 3.3 or 3.2 (see below).
> 
> I also think that 3.2 and 3.3 are good options for the general case. For
> the timer, I can see why 1 is your (second) preference and I am fine
> with 1 as well.
Ok, sounds good to me. Let's still give Bertrand the chance to share his opinion.

> 
> 
>>>>> 3. Admit that it can be useful one day and:
>>>>>     3.1. protect it with #if 0
>>
>> #if 0 should not be used in Xen code. IMHO this is the worse of all the world.
I share your opinion here Julien. Unfortunately we still have quite a few examples
in the Arm code using this either to mark something as TODO or to comment out
parts of the code waiting for future support. This is mostly in SMMU code that
was taken from Linux but already diverged quite far (maybe some cleanup is necessary).

>>
>>>>>     3.2. protect it with a new Kconfig option (disabled by default)
>>>>> using #ifdef
>>>>>     3.3. protect it with a new Kconfig option (disabled by default)
>>>>> using IS_ENABLED (to make sure code always compile)
>>
>> I would prefer 3.3 over 3.2. 3.2 would be used if it is too difficult to get
>> the code compiled when !IS_ENABLED.
>>
>> Similar to one if this is to move all the affected code in a separate file
>> with using obj-$(CONFIG...). That would only work for large chunk of code and
>> would be preferred over 3.2.
> 

~Michal

