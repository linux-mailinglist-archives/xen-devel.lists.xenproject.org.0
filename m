Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C8EC4489B52
	for <lists+xen-devel@lfdr.de>; Mon, 10 Jan 2022 15:34:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.255362.437552 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n6vjf-0004xW-9y; Mon, 10 Jan 2022 14:33:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 255362.437552; Mon, 10 Jan 2022 14:33:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n6vjf-0004vD-6l; Mon, 10 Jan 2022 14:33:23 +0000
Received: by outflank-mailman (input) for mailman id 255362;
 Mon, 10 Jan 2022 14:33:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dcx9=R2=xilinx.com=ayankuma@srs-se1.protection.inumbo.net>)
 id 1n6vjd-0004v3-TV
 for xen-devel@lists.xenproject.org; Mon, 10 Jan 2022 14:33:22 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on20624.outbound.protection.outlook.com
 [2a01:111:f400:fe59::624])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4024eafb-7222-11ec-9ce5-af14b9085ebd;
 Mon, 10 Jan 2022 15:33:18 +0100 (CET)
Received: from BN9PR03CA0892.namprd03.prod.outlook.com (2603:10b6:408:13c::27)
 by PH0PR02MB7239.namprd02.prod.outlook.com (2603:10b6:510:1d::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4867.10; Mon, 10 Jan
 2022 14:33:15 +0000
Received: from BN1NAM02FT056.eop-nam02.prod.protection.outlook.com
 (2603:10b6:408:13c:cafe::f2) by BN9PR03CA0892.outlook.office365.com
 (2603:10b6:408:13c::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4867.11 via Frontend
 Transport; Mon, 10 Jan 2022 14:33:15 +0000
Received: from xir-pvapexch01.xlnx.xilinx.com (149.199.80.198) by
 BN1NAM02FT056.mail.protection.outlook.com (10.13.2.164) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4867.7 via Frontend Transport; Mon, 10 Jan 2022 14:33:14 +0000
Received: from xir-pvapexch01.xlnx.xilinx.com (172.21.17.15) by
 xir-pvapexch01.xlnx.xilinx.com (172.21.17.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Mon, 10 Jan 2022 14:33:13 +0000
Received: from smtp.xilinx.com (172.21.105.197) by
 xir-pvapexch01.xlnx.xilinx.com (172.21.17.15) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Mon, 10 Jan 2022 14:33:13 +0000
Received: from [10.71.118.97] (port=59945)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <ayan.kumar.halder@xilinx.com>)
 id 1n6vjU-0002Tp-7D; Mon, 10 Jan 2022 14:33:12 +0000
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
X-Inumbo-ID: 4024eafb-7222-11ec-9ce5-af14b9085ebd
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GHEFESl4F+f8qyYFQXMuBbZxrIdDepEok/nkeahSZfFEYzyCmCW4rCI/vZ79JlnxI/RKQii8Ke57qdO1G95ZDd6BJthIXRp499JtwrFdWgFfNHmS9nZOJ4EDufn6OKaDAP5wLV79xukYPBh9wMUbspq23KNHCwe+EIu5yKPK0+INUOdO8uywvK0XzBTBg+3iEbNnewNAsDRepQC8VeabcMT4OLXBPesKIrWFswUvTHzya1W1Uc0gDA4ZEPBNAJ80VEHX24ymjVKHbqkovqPmMXJS7NQbZLNTJTm7Fr93qEWUhzmp58rESpGo+fUGSSkyKyYwTF2G1th77SpaWSaP5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6CumRueFBVoaazG2t53D450FpQPhJXZ9h/MAdjpmxH0=;
 b=UD/a7HxdfHHDzJn33mC5UG8OzmAiVKo6NnJ4NTMNjQyv8yax2KQCU6/kNwBC5px+GjVyFl6HGSnay+yz8PrdFCHrBX08e1BDAyq7LcNhgF9ZjC20FYirYnAXzl5ibyDmwmDaro0HFzMnRHbc5PwwwwEEjHQZwXiHRuGXSPjIhJreTon8zZYobYWrem3LTGuww6XLhiG0UmB6fPXpmD4vVZR/n9sWIRi85pklc56bEvUe0QVb12ORcFa/p/zx9FlYJAgWb+OPHApUO3j2eseMZCMFv+2TLIoVd1R+9It8lFOlzwmYIi6PkXuZEKPdGyPayX0rYRot9SoVFZPYF+GDFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.80.198) smtp.rcpttodomain=arm.com smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6CumRueFBVoaazG2t53D450FpQPhJXZ9h/MAdjpmxH0=;
 b=EcoUoN55DJRzlcrgciG/qLXn4bJ6kppyEQmUlKuti2RXasTWni1F9LqH3CdAEsfxHrQHX45gw3UKBfn1Jnan0v9iWZoaVrDhXJ4ZvJRN5ASihtyHcn2K1ymIAvLr5EqWrF6KnNhciUwmuZFjdmT54qhXnyxG0WO0kiv29FdB4UM=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.80.198)
 smtp.mailfrom=xilinx.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.80.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.80.198; helo=xir-pvapexch01.xlnx.xilinx.com;
Content-Type: multipart/alternative;
	boundary="------------RzZKkUvWUsRk4nlUrV9fuYR6"
Message-ID: <2978437f-c7ad-e874-5355-5bdfa2185f1c@xilinx.com>
Date: Mon, 10 Jan 2022 14:33:11 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.4.1
Subject: Re: [XEN v2] xen/arm64: io: Decode 32-bit ldr/str post-indexing
 instructions
To: Andre Przywara <andre.przywara@arm.com>, Ayan Kumar Halder
	<ayan.kumar.halder@xilinx.com>
CC: Julien Grall <julien@xen.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, "sstabellini@kernel.org"
	<sstabellini@kernel.org>, "stefanos@xilinx.com" <stefanos@xilinx.com>,
	"Volodymyr_Babchuk@epam.com" <Volodymyr_Babchuk@epam.com>,
	"jbeulich@suse.com" <jbeulich@suse.com>, <beata.michalska@linaro.org>,
	<richard.henderson@linaro.org>
References: <20211129191638.19877-1-ayankuma@xilinx.com>
 <20211130094950.1bf368d6@donnerap.cambridge.arm.com>
 <a69d41f1-7b57-c127-ae73-2de5a581dddd@xilinx.com>
 <D8811539-65F2-4D40-BFEF-CE72EA8E902A@arm.com>
 <4315f3f8-4431-3257-dc95-a3089532237b@xen.org>
 <20211208120048.63fbf49b@donnerap.cambridge.arm.com>
 <0f6e058a-bc23-2a77-6797-39bfacb7db79@xilinx.com>
 <20220106153327.6ebb2be1@donnerap.cambridge.arm.com>
From: Ayan Kumar Halder <ayan.kumar.halder@xilinx.com>
In-Reply-To: <20220106153327.6ebb2be1@donnerap.cambridge.arm.com>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 238c87b8-234b-44d0-49e5-08d9d44622e8
X-MS-TrafficTypeDiagnostic: PH0PR02MB7239:EE_
X-Microsoft-Antispam-PRVS:
	<PH0PR02MB7239962DA21BCEE2441C0D80B2509@PH0PR02MB7239.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	x1MDQ26pjcW8uBqcBTJJf4o0bdDZrjvO+xJroJrRxjLsK7X5v9XEwdVVmVXSoqgLVXVer14orWV7ylzk+SMxvaaiZLOr7lplGJTHCKSFs3/++VeIdRA++8ELGKOP3keGZPa96hBYlLjObSJwkEbbOk62ZCBNV2j/WCwviyOooeIUg5txd3FABQaU1opnXtqTtUWsx/ZnSuxVPKJ5KEY9T1mBavisncf5bHZ46CnIhZ782hznHGisBWawBpZHA8UbANVAL5QnPer13ng8KVvtSmPAVyFZu2k4aAtQy+teAzo+BAHkN7CWCMK+WlVNNQkM2KfpXMLR7c63x/J95hGAEkE4apGCDz9ojHLW8UICwP8uFINOaZrjTeQm9xbtTkwUcjWzTiJX9lLCyX1gAIbiLjKCOK3kgdyFY5LpiYgBNhl6zIyluRDiCM2dFGCQo0Uzn4i3xgfa8il8og/bM+gxe2VPNBuDQoDnVU17ixrSxdjKnTgwrtYHIUli/WvDFV1qGM+abzNy1Ry/nGja2LYFQ670kf2p+J/F4V8yIAzmJiu/MOrxCMxX7fmmAw2199CnIm0i1gwWOaAA8mIdHYOw21smmDDUr1MDQxya79jLjPkGmRCDeYL6Y8do5xM3oWdrLNqijLSINEwDmwDIMj+86gbQRIIfvp5GUp3zMIkXGmIfLVtzQAW1CyLvrwUSztLxRCID7g0hlgLzKQJl+RYMCLhp4IiQGsMpTrie7DBKQd7dC55fg1ggvmhctg2ywATP//by99q+t6hSvLXJw4u1RNNE95n37Ik4DKNl6ossd/grM147lWdhIXikj21+1h3dRy9bpQ+jvmdHfhGxuW43Fktgu5lpNsjBEoAtyJ9QZfPZWNStSaPKwhpGIR3rwQGe
X-Forefront-Antispam-Report:
	CIP:149.199.80.198;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:xir-pvapexch01.xlnx.xilinx.com;PTR:unknown-80-198.xilinx.com;CAT:NONE;SFS:(4636009)(36840700001)(46966006)(166002)(8676002)(70206006)(8936002)(82310400004)(26005)(30864003)(966005)(36756003)(53546011)(31686004)(4326008)(5660300002)(33964004)(36860700001)(508600001)(54906003)(110136005)(316002)(426003)(9786002)(47076005)(83380400001)(70586007)(2616005)(186003)(356005)(7636003)(2906002)(31696002)(336012)(50156003)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jan 2022 14:33:14.6365
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 238c87b8-234b-44d0-49e5-08d9d44622e8
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.80.198];Helo=[xir-pvapexch01.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1NAM02FT056.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR02MB7239

--------------RzZKkUvWUsRk4nlUrV9fuYR6
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

Hi Andre,

Many thanks for your inputs. It is making better sense now. Much 
appreciated.

A few questions/clarifications :-

On 06/01/2022 15:33, Andre Przywara wrote:
> On Wed, 5 Jan 2022 16:55:11 +0000
> Ayan Kumar Halder<ayan.kumar.halder@xilinx.com>  wrote:
>
> Hi,
>
>> Thank you so much for your feedback.
>>
>> I need a couple of clarifications before I can start with the v3 patch.
>>
>> On 08/12/2021 12:00, Andre Przywara wrote:
>>> On Mon, 6 Dec 2021 19:31:06 +0000
>>> Julien Grall<julien@xen.org>  wrote:
>>>
>>> Hi,
>>>   
>>>> On 01/12/2021 08:41, Bertrand Marquis wrote:
>>>>> Hi Ayan,
>>>>>       
>>>>>> On 30 Nov 2021, at 19:13, Ayan Kumar Halder<ayan.kumar.halder@xilinx.com>  wrote:
>>>>>>
>>>>>> Hi Andre,
>>>>>>
>>>>>> Thanks for your comments. They are useful.
>>>>>>
>>>>>> On 30/11/2021 09:49, Andre Przywara wrote:
>>>>>>> On Mon, 29 Nov 2021 19:16:38 +0000
>>>>>>> Ayan Kumar Halder<ayan.kumar.halder@xilinx.com>  wrote:
>>>>>>> Hi,
>>>>>>>> At the moment, Xen is only handling data abort with valid syndrome (i.e.
>>>>>>>> ISV=0). Unfortunately, this doesn't cover all the instructions a domain
>>>>>>>> could use to access MMIO regions.
>>>>>>>>
>>>>>>>> For instance, Xilinx baremetal OS will use:
>>>>>>>>
>>>>>>>>            volatile u32 *LocalAddr = (volatile u32 *)Addr;
>>>>>>>>            *LocalAddr = Value;
>>>>>>>>
>>>>>>>> This leave the compiler to decide which store instructions to use.
>>>>>>> As mentioned in the other email, this is wrong, if this points to MMIO:
>>>>>>> don't let the compiler do MMIO accesses. If a stage 2 fault isn't in
>>>>>>> an MMIO area, you should not see traps that you cannot handle already.
>>>>>>> So I don't think it's a good idea to use that as an example. And since
>>>>>>> this patch only seems to address this use case, I would doubt its
>>>>>>> usefulness in general.
>>>>>> Yes, I should have fixed the comment.
>>>>>>
>>>>>> Currently, I am testing with baremetal app which uses inline assembly code with post indexing instructions, to access the MMIO.
>>>>>>
>>>>>> ATM, I am testing with 32 bit MMIO only.
>>>>>>
>>>>>> On the usefulness, I am kind of torn as it is legitimate for post indexing instructions to be used in an inline-assembly code for accessing MMIO. However, that may not be something commonly seen.
>>>>>>
>>>>>> @Stefano/Bertrand/Julien/Volodymyr :- As you are the Arm mantainers, can you comment if we should have decoding logic or not ?
>>>>> Andre gave you the official statement from Arm and there is nothing more I can say.
>>>> I think this would be handy for other hypervisor and OS developper to
>>>> know what they can expect when running in a virtualized environment. So
>>>> would it be possible to update the Arm Arm reflecting this statement?
>>> I don't think it's within the scope of the ARM ARM to say that. It just
>>> says that "there is no syndrome information", and your mileage may vary in
>>> working around that.
>>>
>>> Personally I would say that if you expect your software to work nicely
>>> under a hypervisor, then just avoid those instructions. The Linux kernel
>>> certainly did so.
>>>
>>> You can try to do instruction emulation, but doing this right can get
>>> tricky quickly: think about I$/D$ coherency, MMU on or off, etc.
>> I am trying to get all the restrictions that need to be checked. I have
>> referred
>> https://developer.arm.com/documentation/dui0802/a/A64-General-Instructions/Register-restrictions-for-A64-instructions?lang=en  
>> and "Arm A64 Instruction Set Architecture - DDI 0596" - LDR (immediate).
>>
>> So far I only see the following restrictions:-
>>
>> Rn -ne Rt
>>
>> Rt -ne SP
>>
>> You had mentioned the following cases :-
>>
>> 1. XZR vs SP - I see that both these refer to register no 31. Xen gets
>> the register number (for Rn/Rt) only, so I am not sure what is to be
>> done here.
> But the emulation code in Xen needs to know whether number 31 refers to the
> stack pointer or to the zero register. This depends on the context of the
> instruction. It's nothing magical about it, you just need to figure out
> which it is in your case and make sure that the code uses the right
> value. In the LDR case n==31 means SP, but t==31 means XZR. The emulation
> would need to consider this.

I see what you mean. I had a look at 
xen/tools/qemu-xen-dir-remote/target/arm/cpu.h, CPUARMState {}. I don't 
see anywhere we need to refer register by its name. IIUC, the 
instruction decoding logic needs to know the register number only.

In fact, Xen would only read CPUARMState->xregs[31] for SP/XZR in 
Aarch64 context. Let me know what I might be missing here.

Beata/Richard - I see you have committed most recently on the file. 
Please feel free to add your inputs.

>
>> 2. MMU on or off - As I see in try_handle_mmio(), one gets the physical
>> address in gpa. So I am not sure what is to be done here.
> You *might* be fine, if Xen takes care of that, I don't know.
> But it needs to explicitly consider those two cases - and also make
> sure that caching effects are cared for.
>
>> 3. I/D coherency - I don't understand how this affects instruction decoding.
> In the ARM architecture the I cache and D cache are not necessarily
> coherent. So whatever the CPU reads via the data bus does not need to be
> the same data that the instruction fetcher read a while ago. And while
> there is a well-known sequence to make the current data side visible to
> the instruction side, there is nothing architectural for the other way
> around.
> For example the CPU fetches a bunch of instructions into the I cache, then
> consumes it from there. Now some code changes those instruction words in
> "memory". Without explicit D-cache-clean-to-the-PoU and
> I-cache-invalidate+ISB the CPU might still execute the old instructions.

This makes sense. Referring 
https://developer.arm.com/documentation/den0024/a/Caches/Cache-maintenance, 
I assume that the following instructions need to be executed before the 
instruction is decoded.

Xn <--- contains the address of the instruction to be decoded.

STR Wt, [Xn] DC CVAU, Xn // Clean datacache by VA to point of 
unification (PoU) DSB ISH // Ensure visibility of the datacleaned from 
cache IC IVAU, Xn // Invalidate instruction cache by VA to PoU DSB ISH 
// Ensure completion of the invalidations ISB // Synchronize the fetched 
instruction stream

> But if your emulation code tries to read the instruction from memory, it
> fetches the data-visible side of it - which is not what the CPU executed,
> so end up emulating the wrong thing.

I am guessing that this should not be a very unusual case. Isn't this 
similar to a host processor loading and modifying a firmware in the 
memory. The firmware can then be executed by a different 
micro-controller or some programmable engine. I mean the data pipeline 
or instruction pipeline should read the same contents from memory.

>
> Please also keep in mind that the architecture does not *guarantee*
> coherency, but in reality it might actually be coherent - either because
> of the particular silicon implementation, or because of side effects in
> the system (data cache line being evicted, ISB executed). So seeing the
> effects of coherency in your testing does not mean you are safe, it might
> just happen by chance.

Is there some good way to test this to ensure the best possible 
reliability ?

- Ayan

>
> Cheers,
> Andre
>
>> Please help me to understand further.
>>
>> - Ayan
>>
>>>   
>>>>> I will leave this decision to Stefano and Julien.
>>>> I have had a chat on IRC with Stefano about this. I think the main
>>>> sticking point is the Arm Arm doesn't clearly state those instructions
>>>> should not be used by a virtualized OS on MMIO regions.
>>> I don't understand why the ARM ARM would need to say that. Certainly you
>>> realise that immediately when trying to use them, and apparently it was not
>>> a problem in the last 8ish years of Xen/ARM's existence.
>>>
>>> So it's your decision on having the emulation, I personally would only do
>>> it when there is a *good* use case.
>>> And please apply the demanded scrutiny on the review - including all the
>>> corner cases like Rn=Rt, XZR vs. SP (as Jan said) and possibly MMU status.
>>>
>>> Cheers,
>>> Andre
>>>   
>>>> To me, this topic looks similar to the set/way instruction dilemma. They
>>>> are a pain to virtualize (and the Arm Arm clearly hint it) but we had to
>>>> do it because some OSes relied on them.
>>>>
>>>> I think the main difference is the Arm Arm doesn't hint they should not
>>>> be used (it only says a valid syndrome is not provided) and the
>>>> implementation should hopefully be smaller and self-contained.
>>>>
>>>> So I would be inclined to allow Xen to decode post-indexing instructions
>>>> (pending the review).
>>>>
>>>> Cheers,
>>>>   
--------------RzZKkUvWUsRk4nlUrV9fuYR6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<html>
  <head>
    <meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DUTF=
-8">
  </head>
  <body>
    <p>Hi Andre,</p>
    <p>Many thanks for your inputs. It is making better sense now. Much
      appreciated.</p>
    <p>A few questions/clarifications :-<br>
    </p>
    <div class=3D"moz-cite-prefix">On 06/01/2022 15:33, Andre Przywara
      wrote:<br>
    </div>
    <blockquote type=3D"cite"
      cite=3D"mid:20220106153327.6ebb2be1@donnerap.cambridge.arm.com">
      <pre class=3D"moz-quote-pre" wrap=3D"">On Wed, 5 Jan 2022 16:55:11 =
+0000
Ayan Kumar Halder <a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:ayan.=
kumar.halder@xilinx.com">&lt;ayan.kumar.halder@xilinx.com&gt;</a> wrote:

Hi,

</pre>
      <blockquote type=3D"cite">
        <pre class=3D"moz-quote-pre" wrap=3D"">Thank you so much for your=
 feedback.

I need a couple of clarifications before I can start with the v3 patch.

On 08/12/2021 12:00, Andre Przywara wrote:
</pre>
        <blockquote type=3D"cite">
          <pre class=3D"moz-quote-pre" wrap=3D"">On Mon, 6 Dec 2021 19:31=
:06 +0000
Julien Grall <a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:julien@xen=
=2Eorg">&lt;julien@xen.org&gt;</a> wrote:

Hi,
=20
</pre>
          <blockquote type=3D"cite">
            <pre class=3D"moz-quote-pre" wrap=3D"">On 01/12/2021 08:41, B=
ertrand Marquis wrote: =20
</pre>
            <blockquote type=3D"cite">
              <pre class=3D"moz-quote-pre" wrap=3D"">Hi Ayan,
    =20
</pre>
              <blockquote type=3D"cite">
                <pre class=3D"moz-quote-pre" wrap=3D"">On 30 Nov 2021, at=
 19:13, Ayan Kumar Halder <a class=3D"moz-txt-link-rfc2396E" href=3D"mail=
to:ayan.kumar.halder@xilinx.com">&lt;ayan.kumar.halder@xilinx.com&gt;</a>=
 wrote:

Hi Andre,

Thanks for your comments. They are useful.

On 30/11/2021 09:49, Andre Przywara wrote: =20
</pre>
                <blockquote type=3D"cite">
                  <pre class=3D"moz-quote-pre" wrap=3D"">On Mon, 29 Nov 2=
021 19:16:38 +0000
Ayan Kumar Halder <a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:ayan.=
kumar.halder@xilinx.com">&lt;ayan.kumar.halder@xilinx.com&gt;</a> wrote:
Hi, =20
</pre>
                  <blockquote type=3D"cite">
                    <pre class=3D"moz-quote-pre" wrap=3D"">At the moment,=
 Xen is only handling data abort with valid syndrome (i.e.
ISV=3D0). Unfortunately, this doesn't cover all the instructions a domain=

could use to access MMIO regions.

For instance, Xilinx baremetal OS will use:

          volatile u32 *LocalAddr =3D (volatile u32 *)Addr;
          *LocalAddr =3D Value;

This leave the compiler to decide which store instructions to use. =20
</pre>
                  </blockquote>
                  <pre class=3D"moz-quote-pre" wrap=3D"">As mentioned in =
the other email, this is wrong, if this points to MMIO:
don't let the compiler do MMIO accesses. If a stage 2 fault isn't in
an MMIO area, you should not see traps that you cannot handle already.
So I don't think it's a good idea to use that as an example. And since
this patch only seems to address this use case, I would doubt its
usefulness in general. =20
</pre>
                </blockquote>
                <pre class=3D"moz-quote-pre" wrap=3D"">Yes, I should have=
 fixed the comment.

Currently, I am testing with baremetal app which uses inline assembly cod=
e with post indexing instructions, to access the MMIO.

ATM, I am testing with 32 bit MMIO only.

On the usefulness, I am kind of torn as it is legitimate for post indexin=
g instructions to be used in an inline-assembly code for accessing MMIO. =
However, that may not be something commonly seen.

@Stefano/Bertrand/Julien/Volodymyr :- As you are the Arm mantainers, can =
you comment if we should have decoding logic or not ? =20
</pre>
              </blockquote>
              <pre class=3D"moz-quote-pre" wrap=3D"">Andre gave you the o=
fficial statement from Arm and there is nothing more I can say. =20
</pre>
            </blockquote>
            <pre class=3D"moz-quote-pre" wrap=3D"">I think this would be =
handy for other hypervisor and OS developper to
know what they can expect when running in a virtualized environment. So
would it be possible to update the Arm Arm reflecting this statement? =20
</pre>
          </blockquote>
          <pre class=3D"moz-quote-pre" wrap=3D"">I don't think it's withi=
n the scope of the ARM ARM to say that. It just
says that "there is no syndrome information", and your mileage may vary i=
n
working around that.

Personally I would say that if you expect your software to work nicely
under a hypervisor, then just avoid those instructions. The Linux kernel
certainly did so.

You can try to do instruction emulation, but doing this right can get
tricky quickly: think about I$/D$ coherency, MMU on or off, etc. =20
</pre>
        </blockquote>
        <pre class=3D"moz-quote-pre" wrap=3D"">
I am trying to get all the restrictions that need to be checked. I have=20
referred=20
<a class=3D"moz-txt-link-freetext" href=3D"https://developer.arm.com/docu=
mentation/dui0802/a/A64-General-Instructions/Register-restrictions-for-A6=
4-instructions?lang=3Den">https://developer.arm.com/documentation/dui0802=
/a/A64-General-Instructions/Register-restrictions-for-A64-instructions?la=
ng=3Den</a>=20
and "Arm A64 Instruction Set Architecture - DDI 0596" - LDR (immediate).

So far I only see the following restrictions:-

Rn -ne Rt

Rt -ne SP

You had mentioned the following cases :-

1. XZR vs SP - I see that both these refer to register no 31. Xen gets=20
the register number (for Rn/Rt) only, so I am not sure what is to be=20
done here.
</pre>
      </blockquote>
      <pre class=3D"moz-quote-pre" wrap=3D"">
But the emulation code in Xen needs to know whether number 31 refers to t=
he
stack pointer or to the zero register. This depends on the context of the=

instruction. It's nothing magical about it, you just need to figure out
which it is in your case and make sure that the code uses the right
value. In the LDR case n=3D=3D31 means SP, but t=3D=3D31 means XZR. The e=
mulation
would need to consider this.</pre>
    </blockquote>
    <p>I see what you mean. I had a look at
      xen/tools/qemu-xen-dir-remote/target/arm/cpu.h, CPUARMState {}. I
      don't see anywhere we need to refer register by its name. IIUC,
      the instruction decoding logic needs to know the register number
      only. <br>
    </p>
    <p>In fact, Xen would only read CPUARMState-&gt;xregs[31] for SP/XZR
      in Aarch64 context. Let me know what I might be missing here.<br>
    </p>
    <p>Beata/Richard - I see you have committed most recently on the
      file. Please feel free to add your inputs.<br>
    </p>
    <blockquote type=3D"cite"
      cite=3D"mid:20220106153327.6ebb2be1@donnerap.cambridge.arm.com">
      <pre class=3D"moz-quote-pre" wrap=3D"">

</pre>
      <blockquote type=3D"cite">
        <pre class=3D"moz-quote-pre" wrap=3D"">2. MMU on or off - As I se=
e in try_handle_mmio(), one gets the physical=20
address in gpa. So I am not sure what is to be done here.
</pre>
      </blockquote>
      <pre class=3D"moz-quote-pre" wrap=3D"">
You *might* be fine, if Xen takes care of that, I don't know.
But it needs to explicitly consider those two cases - and also make
sure that caching effects are cared for.

</pre>
      <blockquote type=3D"cite">
        <pre class=3D"moz-quote-pre" wrap=3D"">3. I/D coherency - I don't=
 understand how this affects instruction decoding.
</pre>
      </blockquote>
      <pre class=3D"moz-quote-pre" wrap=3D"">
In the ARM architecture the I cache and D cache are not necessarily
coherent. So whatever the CPU reads via the data bus does not need to be
the same data that the instruction fetcher read a while ago. And while
there is a well-known sequence to make the current data side visible to
the instruction side, there is nothing architectural for the other way
around.
For example the CPU fetches a bunch of instructions into the I cache, the=
n
consumes it from there. Now some code changes those instruction words in
"memory". Without explicit D-cache-clean-to-the-PoU and
I-cache-invalidate+ISB the CPU might still execute the old instructions.<=
/pre>
    </blockquote>
    <p>This makes sense. Referring
<a class=3D"moz-txt-link-freetext" href=3D"https://developer.arm.com/docu=
mentation/den0024/a/Caches/Cache-maintenance">https://developer.arm.com/d=
ocumentation/den0024/a/Caches/Cache-maintenance</a>,
      I assume that the following instructions need to be executed
      before the instruction is decoded.</p>
    <p>Xn &lt;--- contains the address of the instruction to be decoded.<=
br>
    </p>
    <p><span class=3D"hljs-keyword" style=3D"box-sizing: border-box; marg=
in: 0px; padding: 0px; -webkit-font-smoothing: antialiased; text-shadow: =
rgba(0, 0, 0, 0.004) 1px 1px 1px; color: rgb(99, 73, 139); font-family: C=
ourier, monospace; font-size: 16px; font-style: normal; font-variant-caps=
: normal; font-weight: normal; letter-spacing: normal; orphans: auto; tex=
t-align: start; text-indent: 0px; text-transform: none; white-space: pre-=
wrap; widows: auto; word-spacing: 0px; -webkit-text-size-adjust: auto; -w=
ebkit-text-stroke-width: 0px; background-color: rgb(247, 247, 247); text-=
decoration: none;"><span class=3D"hljs-keyword" style=3D"box-sizing: bord=
er-box; margin: 0px; padding: 0px; -webkit-font-smoothing: antialiased; t=
ext-shadow: rgba(0, 0, 0, 0.004) 1px 1px 1px; color: rgb(99, 73, 139);"> =
 STR </span></span><span style=3D"caret-color: rgb(51, 62, 72); color: rg=
b(51, 62, 72); font-family: Courier, monospace; font-size: 16px; font-sty=
le: normal; font-variant-caps: normal; font-weight: normal; letter-spacin=
g: normal; orphans: auto; text-align: start; text-indent: 0px; text-trans=
form: none; white-space: pre-wrap; widows: auto; word-spacing: 0px; -webk=
it-text-size-adjust: auto; -webkit-text-stroke-width: 0px; background-col=
or: rgb(247, 247, 247); text-decoration: none; display: inline !important=
; float: none;">Wt, [Xn]
  DC CVAU, Xn     // Clean </span><span class=3D"hljs-meta" style=3D"box-=
sizing: border-box; margin: 0px; padding: 0px; -webkit-font-smoothing: an=
tialiased; text-shadow: rgba(0, 0, 0, 0.004) 1px 1px 1px; color: rgb(173,=
 72, 0); font-family: Courier, monospace; font-size: 16px; font-style: no=
rmal; font-variant-caps: normal; font-weight: normal; letter-spacing: nor=
mal; orphans: auto; text-align: start; text-indent: 0px; text-transform: =
none; white-space: pre-wrap; widows: auto; word-spacing: 0px; -webkit-tex=
t-size-adjust: auto; -webkit-text-stroke-width: 0px; background-color: rg=
b(247, 247, 247); text-decoration: none;"><span class=3D"hljs-meta" style=
=3D"box-sizing: border-box; margin: 0px; padding: 0px; -webkit-font-smoot=
hing: antialiased; text-shadow: rgba(0, 0, 0, 0.004) 1px 1px 1px; color: =
rgb(173, 72, 0);">data</span></span><span style=3D"caret-color: rgb(51, 6=
2, 72); color: rgb(51, 62, 72); font-family: Courier, monospace; font-siz=
e: 16px; font-style: normal; font-variant-caps: normal; font-weight: norm=
al; letter-spacing: normal; orphans: auto; text-align: start; text-indent=
: 0px; text-transform: none; white-space: pre-wrap; widows: auto; word-sp=
acing: 0px; -webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0p=
x; background-color: rgb(247, 247, 247); text-decoration: none; display: =
inline !important; float: none;"> cache </span><span class=3D"hljs-keywor=
d" style=3D"box-sizing: border-box; margin: 0px; padding: 0px; -webkit-fo=
nt-smoothing: antialiased; text-shadow: rgba(0, 0, 0, 0.004) 1px 1px 1px;=
 color: rgb(99, 73, 139); font-family: Courier, monospace; font-size: 16p=
x; font-style: normal; font-variant-caps: normal; font-weight: normal; le=
tter-spacing: normal; orphans: auto; text-align: start; text-indent: 0px;=
 text-transform: none; white-space: pre-wrap; widows: auto; word-spacing:=
 0px; -webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0px; bac=
kground-color: rgb(247, 247, 247); text-decoration: none;"><span class=3D=
"hljs-keyword" style=3D"box-sizing: border-box; margin: 0px; padding: 0px=
; -webkit-font-smoothing: antialiased; text-shadow: rgba(0, 0, 0, 0.004) =
1px 1px 1px; color: rgb(99, 73, 139);">by </span></span><span style=3D"ca=
ret-color: rgb(51, 62, 72); color: rgb(51, 62, 72); font-family: Courier,=
 monospace; font-size: 16px; font-style: normal; font-variant-caps: norma=
l; font-weight: normal; letter-spacing: normal; orphans: auto; text-align=
: start; text-indent: 0px; text-transform: none; white-space: pre-wrap; w=
idows: auto; word-spacing: 0px; -webkit-text-size-adjust: auto; -webkit-t=
ext-stroke-width: 0px; background-color: rgb(247, 247, 247); text-decorat=
ion: none; display: inline !important; float: none;">VA to point of unifi=
cation (PoU)
  </span><span class=3D"hljs-keyword" style=3D"box-sizing: border-box; ma=
rgin: 0px; padding: 0px; -webkit-font-smoothing: antialiased; text-shadow=
: rgba(0, 0, 0, 0.004) 1px 1px 1px; color: rgb(99, 73, 139); font-family:=
 Courier, monospace; font-size: 16px; font-style: normal; font-variant-ca=
ps: normal; font-weight: normal; letter-spacing: normal; orphans: auto; t=
ext-align: start; text-indent: 0px; text-transform: none; white-space: pr=
e-wrap; widows: auto; word-spacing: 0px; -webkit-text-size-adjust: auto; =
-webkit-text-stroke-width: 0px; background-color: rgb(247, 247, 247); tex=
t-decoration: none;"><span class=3D"hljs-keyword" style=3D"box-sizing: bo=
rder-box; margin: 0px; padding: 0px; -webkit-font-smoothing: antialiased;=
 text-shadow: rgba(0, 0, 0, 0.004) 1px 1px 1px; color: rgb(99, 73, 139);"=
>DSB </span></span><span style=3D"caret-color: rgb(51, 62, 72); color: rg=
b(51, 62, 72); font-family: Courier, monospace; font-size: 16px; font-sty=
le: normal; font-variant-caps: normal; font-weight: normal; letter-spacin=
g: normal; orphans: auto; text-align: start; text-indent: 0px; text-trans=
form: none; white-space: pre-wrap; widows: auto; word-spacing: 0px; -webk=
it-text-size-adjust: auto; -webkit-text-stroke-width: 0px; background-col=
or: rgb(247, 247, 247); text-decoration: none; display: inline !important=
; float: none;">ISH         // Ensure visibility of the </span><span clas=
s=3D"hljs-meta" style=3D"box-sizing: border-box; margin: 0px; padding: 0p=
x; -webkit-font-smoothing: antialiased; text-shadow: rgba(0, 0, 0, 0.004)=
 1px 1px 1px; color: rgb(173, 72, 0); font-family: Courier, monospace; fo=
nt-size: 16px; font-style: normal; font-variant-caps: normal; font-weight=
: normal; letter-spacing: normal; orphans: auto; text-align: start; text-=
indent: 0px; text-transform: none; white-space: pre-wrap; widows: auto; w=
ord-spacing: 0px; -webkit-text-size-adjust: auto; -webkit-text-stroke-wid=
th: 0px; background-color: rgb(247, 247, 247); text-decoration: none;"><s=
pan class=3D"hljs-meta" style=3D"box-sizing: border-box; margin: 0px; pad=
ding: 0px; -webkit-font-smoothing: antialiased; text-shadow: rgba(0, 0, 0=
, 0.004) 1px 1px 1px; color: rgb(173, 72, 0);">data</span></span><span st=
yle=3D"caret-color: rgb(51, 62, 72); color: rgb(51, 62, 72); font-family:=
 Courier, monospace; font-size: 16px; font-style: normal; font-variant-ca=
ps: normal; font-weight: normal; letter-spacing: normal; orphans: auto; t=
ext-align: start; text-indent: 0px; text-transform: none; white-space: pr=
e-wrap; widows: auto; word-spacing: 0px; -webkit-text-size-adjust: auto; =
-webkit-text-stroke-width: 0px; background-color: rgb(247, 247, 247); tex=
t-decoration: none; display: inline !important; float: none;"> cleaned fr=
om cache
  IC IVAU, Xn     // Invalidate instruction cache </span><span class=3D"h=
ljs-keyword" style=3D"box-sizing: border-box; margin: 0px; padding: 0px; =
-webkit-font-smoothing: antialiased; text-shadow: rgba(0, 0, 0, 0.004) 1p=
x 1px 1px; color: rgb(99, 73, 139); font-family: Courier, monospace; font=
-size: 16px; font-style: normal; font-variant-caps: normal; font-weight: =
normal; letter-spacing: normal; orphans: auto; text-align: start; text-in=
dent: 0px; text-transform: none; white-space: pre-wrap; widows: auto; wor=
d-spacing: 0px; -webkit-text-size-adjust: auto; -webkit-text-stroke-width=
: 0px; background-color: rgb(247, 247, 247); text-decoration: none;"><spa=
n class=3D"hljs-keyword" style=3D"box-sizing: border-box; margin: 0px; pa=
dding: 0px; -webkit-font-smoothing: antialiased; text-shadow: rgba(0, 0, =
0, 0.004) 1px 1px 1px; color: rgb(99, 73, 139);">by </span></span><span s=
tyle=3D"caret-color: rgb(51, 62, 72); color: rgb(51, 62, 72); font-family=
: Courier, monospace; font-size: 16px; font-style: normal; font-variant-c=
aps: normal; font-weight: normal; letter-spacing: normal; orphans: auto; =
text-align: start; text-indent: 0px; text-transform: none; white-space: p=
re-wrap; widows: auto; word-spacing: 0px; -webkit-text-size-adjust: auto;=
 -webkit-text-stroke-width: 0px; background-color: rgb(247, 247, 247); te=
xt-decoration: none; display: inline !important; float: none;">VA to PoU
  </span><span class=3D"hljs-keyword" style=3D"box-sizing: border-box; ma=
rgin: 0px; padding: 0px; -webkit-font-smoothing: antialiased; text-shadow=
: rgba(0, 0, 0, 0.004) 1px 1px 1px; color: rgb(99, 73, 139); font-family:=
 Courier, monospace; font-size: 16px; font-style: normal; font-variant-ca=
ps: normal; font-weight: normal; letter-spacing: normal; orphans: auto; t=
ext-align: start; text-indent: 0px; text-transform: none; white-space: pr=
e-wrap; widows: auto; word-spacing: 0px; -webkit-text-size-adjust: auto; =
-webkit-text-stroke-width: 0px; background-color: rgb(247, 247, 247); tex=
t-decoration: none;"><span class=3D"hljs-keyword" style=3D"box-sizing: bo=
rder-box; margin: 0px; padding: 0px; -webkit-font-smoothing: antialiased;=
 text-shadow: rgba(0, 0, 0, 0.004) 1px 1px 1px; color: rgb(99, 73, 139);"=
>DSB </span></span><span style=3D"caret-color: rgb(51, 62, 72); color: rg=
b(51, 62, 72); font-family: Courier, monospace; font-size: 16px; font-sty=
le: normal; font-variant-caps: normal; font-weight: normal; letter-spacin=
g: normal; orphans: auto; text-align: start; text-indent: 0px; text-trans=
form: none; white-space: pre-wrap; widows: auto; word-spacing: 0px; -webk=
it-text-size-adjust: auto; -webkit-text-stroke-width: 0px; background-col=
or: rgb(247, 247, 247); text-decoration: none; display: inline !important=
; float: none;">ISH         // Ensure completion of the invalidations
  </span><span class=3D"hljs-keyword" style=3D"box-sizing: border-box; ma=
rgin: 0px; padding: 0px; -webkit-font-smoothing: antialiased; text-shadow=
: rgba(0, 0, 0, 0.004) 1px 1px 1px; color: rgb(99, 73, 139); font-family:=
 Courier, monospace; font-size: 16px; font-style: normal; font-variant-ca=
ps: normal; font-weight: normal; letter-spacing: normal; orphans: auto; t=
ext-align: start; text-indent: 0px; text-transform: none; white-space: pr=
e-wrap; widows: auto; word-spacing: 0px; -webkit-text-size-adjust: auto; =
-webkit-text-stroke-width: 0px; background-color: rgb(247, 247, 247); tex=
t-decoration: none;"><span class=3D"hljs-keyword" style=3D"box-sizing: bo=
rder-box; margin: 0px; padding: 0px; -webkit-font-smoothing: antialiased;=
 text-shadow: rgba(0, 0, 0, 0.004) 1px 1px 1px; color: rgb(99, 73, 139);"=
>ISB </span></span><span style=3D"caret-color: rgb(51, 62, 72); color: rg=
b(51, 62, 72); font-family: Courier, monospace; font-size: 16px; font-sty=
le: normal; font-variant-caps: normal; font-weight: normal; letter-spacin=
g: normal; orphans: auto; text-align: start; text-indent: 0px; text-trans=
form: none; white-space: pre-wrap; widows: auto; word-spacing: 0px; -webk=
it-text-size-adjust: auto; -webkit-text-stroke-width: 0px; background-col=
or: rgb(247, 247, 247); text-decoration: none; display: inline !important=
; float: none;">            // Synchronize the fetched instruction </span=
><span class=3D"hljs-keyword" style=3D"box-sizing: border-box; margin: 0p=
x; padding: 0px; -webkit-font-smoothing: antialiased; text-shadow: rgba(0=
, 0, 0, 0.004) 1px 1px 1px; color: rgb(99, 73, 139); font-family: Courier=
, monospace; font-size: 16px; font-style: normal; font-variant-caps: norm=
al; font-weight: normal; letter-spacing: normal; orphans: auto; text-alig=
n: start; text-indent: 0px; text-transform: none; white-space: pre-wrap; =
widows: auto; word-spacing: 0px; -webkit-text-size-adjust: auto; -webkit-=
text-stroke-width: 0px; background-color: rgb(247, 247, 247); text-decora=
tion: none;"><span class=3D"hljs-keyword" style=3D"box-sizing: border-box=
; margin: 0px; padding: 0px; -webkit-font-smoothing: antialiased; text-sh=
adow: rgba(0, 0, 0, 0.004) 1px 1px 1px; color: rgb(99, 73, 139);">stream<=
/span></span></p>
    <blockquote type=3D"cite"
      cite=3D"mid:20220106153327.6ebb2be1@donnerap.cambridge.arm.com">
      <pre class=3D"moz-quote-pre" wrap=3D"">
But if your emulation code tries to read the instruction from memory, it
fetches the data-visible side of it - which is not what the CPU executed,=

so end up emulating the wrong thing.</pre>
    </blockquote>
    <p>I am guessing that this should not be a very unusual case. Isn't
      this similar to a host processor loading and modifying a firmware
      in the memory. The firmware can then be executed by a different
      micro-controller or some programmable engine. I mean the data
      pipeline or instruction pipeline should read the same contents
      from memory. <br>
    </p>
    <blockquote type=3D"cite"
      cite=3D"mid:20220106153327.6ebb2be1@donnerap.cambridge.arm.com">
      <pre class=3D"moz-quote-pre" wrap=3D"">

Please also keep in mind that the architecture does not *guarantee*
coherency, but in reality it might actually be coherent - either because
of the particular silicon implementation, or because of side effects in
the system (data cache line being evicted, ISB executed). So seeing the
effects of coherency in your testing does not mean you are safe, it might=

just happen by chance.</pre>
    </blockquote>
    <p>Is there some good way to test this to ensure the best possible
      reliability ?</p>
    <p>- Ayan<br>
    </p>
    <blockquote type=3D"cite"
      cite=3D"mid:20220106153327.6ebb2be1@donnerap.cambridge.arm.com">
      <pre class=3D"moz-quote-pre" wrap=3D"">

Cheers,
Andre

</pre>
      <blockquote type=3D"cite">
        <pre class=3D"moz-quote-pre" wrap=3D"">Please help me to understa=
nd further.

- Ayan

</pre>
        <blockquote type=3D"cite">
          <pre class=3D"moz-quote-pre" wrap=3D"">=20
</pre>
          <blockquote type=3D"cite">
            <blockquote type=3D"cite">
              <pre class=3D"moz-quote-pre" wrap=3D"">I will leave this de=
cision to Stefano and Julien. =20
</pre>
            </blockquote>
            <pre class=3D"moz-quote-pre" wrap=3D"">I have had a chat on I=
RC with Stefano about this. I think the main
sticking point is the Arm Arm doesn't clearly state those instructions
should not be used by a virtualized OS on MMIO regions. =20
</pre>
          </blockquote>
          <pre class=3D"moz-quote-pre" wrap=3D"">I don't understand why t=
he ARM ARM would need to say that. Certainly you
realise that immediately when trying to use them, and apparently it was n=
ot
a problem in the last 8ish years of Xen/ARM's existence.

So it's your decision on having the emulation, I personally would only do=

it when there is a *good* use case.
And please apply the demanded scrutiny on the review - including all the
corner cases like Rn=3DRt, XZR vs. SP (as Jan said) and possibly MMU stat=
us.

Cheers,
Andre
=20
</pre>
          <blockquote type=3D"cite">
            <pre class=3D"moz-quote-pre" wrap=3D"">To me, this topic look=
s similar to the set/way instruction dilemma. They
are a pain to virtualize (and the Arm Arm clearly hint it) but we had to
do it because some OSes relied on them.

I think the main difference is the Arm Arm doesn't hint they should not
be used (it only says a valid syndrome is not provided) and the
implementation should hopefully be smaller and self-contained.

So I would be inclined to allow Xen to decode post-indexing instructions
(pending the review).

Cheers,
=20
</pre>
          </blockquote>
        </blockquote>
      </blockquote>
      <pre class=3D"moz-quote-pre" wrap=3D"">
</pre>
    </blockquote>
  </body>
</html>

--------------RzZKkUvWUsRk4nlUrV9fuYR6--

