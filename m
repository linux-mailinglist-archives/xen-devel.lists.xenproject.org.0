Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D9379495634
	for <lists+xen-devel@lfdr.de>; Thu, 20 Jan 2022 23:02:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.259183.447176 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nAfVD-0000oO-01; Thu, 20 Jan 2022 22:01:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 259183.447176; Thu, 20 Jan 2022 22:01:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nAfVC-0000mU-Sw; Thu, 20 Jan 2022 22:01:54 +0000
Received: by outflank-mailman (input) for mailman id 259183;
 Thu, 20 Jan 2022 22:01:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lajj=SE=xilinx.com=ayankuma@srs-se1.protection.inumbo.net>)
 id 1nAfVB-0000mO-Eu
 for xen-devel@lists.xenproject.org; Thu, 20 Jan 2022 22:01:53 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2062b.outbound.protection.outlook.com
 [2a01:111:f400:7eaa::62b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 91880385-7a3c-11ec-bc18-3156f6d857e4;
 Thu, 20 Jan 2022 23:01:51 +0100 (CET)
Received: from SA9PR11CA0007.namprd11.prod.outlook.com (2603:10b6:806:6e::12)
 by DM5PR02MB3324.namprd02.prod.outlook.com (2603:10b6:4:66::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.12; Thu, 20 Jan
 2022 22:01:47 +0000
Received: from SN1NAM02FT0029.eop-nam02.prod.protection.outlook.com
 (2603:10b6:806:6e:cafe::39) by SA9PR11CA0007.outlook.office365.com
 (2603:10b6:806:6e::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.8 via Frontend
 Transport; Thu, 20 Jan 2022 22:01:46 +0000
Received: from xir-pvapexch01.xlnx.xilinx.com (149.199.80.198) by
 SN1NAM02FT0029.mail.protection.outlook.com (10.97.4.175) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4909.8 via Frontend Transport; Thu, 20 Jan 2022 22:01:46 +0000
Received: from xir-pvapexch02.xlnx.xilinx.com (172.21.17.17) by
 xir-pvapexch01.xlnx.xilinx.com (172.21.17.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Thu, 20 Jan 2022 22:01:45 +0000
Received: from smtp.xilinx.com (172.21.105.198) by
 xir-pvapexch02.xlnx.xilinx.com (172.21.17.17) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Thu, 20 Jan 2022 22:01:45 +0000
Received: from [10.71.117.147] (port=56629)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <ayan.kumar.halder@xilinx.com>)
 id 1nAfV2-0006bg-61; Thu, 20 Jan 2022 22:01:44 +0000
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
X-Inumbo-ID: 91880385-7a3c-11ec-bc18-3156f6d857e4
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C6v/3tRD8oBPkP1XVWHL1WFBnrgTTZbuEHyBl9yFz2gn2LCz/QKQqneKN+jmQMey8i4esYLgO1CAHdso3yTqYuLtOg9CeXzHqNv1dW162KpWY2qc1zF/oPn82BBEq/sFWJ1a8StJZmeF0dFoV3PdDXf/02HWIlGAttIOITSPy8ncWy2xjXSsRiK9zaBaalOn1pqXBAGd9F7B1UsaUuFn04+pTDQ+nguSwT+xO/50fBDd12dM5wirN9QzzXDKDFlKmz0uTZgCSSkR5jjAuh0o4A585u5RF4CEQe41PBF9YsFx7/6BajUn0jLz4qcExZBONQdyBhmbjIqSkT/wlZt4Kw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DwnwUsc1evMIhNKHmggVHmmXE0pgezlpBI6F6356l98=;
 b=Mwq7CvBlCenBMQWyhUMjY+cOPT8hvLyQoe5JIDdqCVuxFNLZZqJ+vULdHO9za0CQPc7PwXj1lqe+TREsn3kApDDBWNg7wbVBE6M/laaAbA86rVk4f8+mp/YH3b3E/HbuJbbVXiFNV3lHwmwq2Qmlz6SlzqRWbMfCt6/pwcB+mw9JpiuJvKRNuaF1NaSrJNNNXYAsoVEhw2BSqZpxpfSGZvAssXdaqR5KmPeaQL3LlmcDjESNd5re4BdgR3l3OUmWLK2aKg4lAdTrluBDwMFcVQqt7cb5weecy1BTCuyqdX8Mgl23LvMzV6uvHFPyF+vQYifqSM+2yqqtSI/qpqkkyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.80.198) smtp.rcpttodomain=arm.com smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DwnwUsc1evMIhNKHmggVHmmXE0pgezlpBI6F6356l98=;
 b=GNLu+rbiBo8w3hTK+iRJrondb5DjFAwZOk4kEme3SuDRKji4VApaz/s8MsBt+9V11n7zjjCUD0LtaZ4X/kdOxAdSyejNNHfbiG9CsO37cI+NwZBBgNnNyRFHH0NLGULiU5KfG18mCM4COjZ9uHoeiAkf8uhF7vAscynnW9gLUeo=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.80.198)
 smtp.mailfrom=xilinx.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.80.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.80.198; helo=xir-pvapexch01.xlnx.xilinx.com;
Message-ID: <88bca474-c0cf-b5aa-bbcd-33e587d673a9@xilinx.com>
Date: Thu, 20 Jan 2022 22:01:43 +0000
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
 <2978437f-c7ad-e874-5355-5bdfa2185f1c@xilinx.com>
 <20220111125222.6e2af49b@donnerap.cambridge.arm.com>
From: Ayan Kumar Halder <ayan.kumar.halder@xilinx.com>
In-Reply-To: <20220111125222.6e2af49b@donnerap.cambridge.arm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: dc8c0a31-50e6-4b93-2e16-08d9dc6073cf
X-MS-TrafficTypeDiagnostic: DM5PR02MB3324:EE_
X-Microsoft-Antispam-PRVS:
	<DM5PR02MB3324BA8427CB73B004349B21B25A9@DM5PR02MB3324.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	nAvjmIHmoNXC87HnpAflbi6vtXvk5Yqc0FSVzbVIOMS+8R/FlgBafsiZ3lRQFr4uFhcHd/ywIzY3vdNKV1jSUq5lpKcBTr3cKpeIzMNtPSZcHgxSXrLGXVPikp8NXC1w9T9wu4yhAQ6qGH9lraKLA1ZZp2hd1HGnvxl0uO0a9Dv5CCi0bbgRuXm8pN7kNMrKrrHZnrKpyagQUzShknevZTvwFeBdq/IOMn1YH5HnkTILVqsEqqzbt+NoRl9a6vKDixyibOR7slJSqsjeK3JcogLd0F5/MAvzwnsERViy0+lJ0NlIhmTwIv3iT5zu6E9lcln+IB4zyW5y9i2lzLk0bbn/3IaL0PHhivNT2OhW/5SMU7MschLEdEIfXBk1r+ayq5up0+K3QDgUbIddI3SVWXD0+Bjk4AnFvAUf7RXXTG0sSciebOLi/LsC/1ecaV0Yxw68KnuDJVNTu9JwUuxZPMYl3qvE7ME/UWfcv2BHa4aQCPQBC50E9ka623oHnkstONf1kANGVc31jaoRwUIQQwMs/3sqc0ZIFslWUfkkElz0u8PG8FM23YftquXUui0tSGdGOh4ckY6mJ/nWo8HvppokeGyybCH/vwl5UUWtboxRi8d+NozhI0qjNfUzKhKXOwKcsMxGPb8iVoJnNIISWf04YZ/EX+qoQ8ASsuhEfWdv9U+GXn0B3FlxFhBdJbNbJbcyvsAxxEi1gloeSIlt62+G1t4/RlMKBGTEiY8tCRGTSdMoqhBJPvPE23yWmVnNuIJrGJYh5SjgH1VfQslPAF4eQD1elO/uS3sgnFIjHi/nM0jMSuWjN2IagxEpEKYPl2HxdtgG77ArvGScN4BFC/CtCye8s0hs5RMZ2d3GmZlm1ZElwtbtVTknRbrStnkY
X-Forefront-Antispam-Report:
	CIP:149.199.80.198;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:xir-pvapexch01.xlnx.xilinx.com;PTR:unknown-80-198.xilinx.com;CAT:NONE;SFS:(4636009)(46966006)(36840700001)(31686004)(7636003)(82310400004)(83380400001)(47076005)(186003)(9786002)(336012)(356005)(2906002)(53546011)(30864003)(31696002)(426003)(5660300002)(36756003)(110136005)(26005)(508600001)(316002)(8676002)(966005)(8936002)(36860700001)(70206006)(70586007)(2616005)(54906003)(4326008)(50156003)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2022 22:01:46.4908
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dc8c0a31-50e6-4b93-2e16-08d9dc6073cf
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.80.198];Helo=[xir-pvapexch01.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1NAM02FT0029.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR02MB3324

Hi Andre/All,

Many thanks for your feedback.

On 11/01/2022 12:52, Andre Przywara wrote:
> On Mon, 10 Jan 2022 14:33:11 +0000
> Ayan Kumar Halder <ayan.kumar.halder@xilinx.com> wrote:
>
> Hi Ayan,
>
>> Many thanks for your inputs. It is making better sense now. Much
>> appreciated.
>>
>> A few questions/clarifications :-
>>
>> On 06/01/2022 15:33, Andre Przywara wrote:
>>> On Wed, 5 Jan 2022 16:55:11 +0000
>>> Ayan Kumar Halder<ayan.kumar.halder@xilinx.com>  wrote:
>>>
>>> Hi,
>>>   
>>>> Thank you so much for your feedback.
>>>>
>>>> I need a couple of clarifications before I can start with the v3 patch.
>>>>
>>>> On 08/12/2021 12:00, Andre Przywara wrote:
>>>>> On Mon, 6 Dec 2021 19:31:06 +0000
>>>>> Julien Grall<julien@xen.org>  wrote:
>>>>>
>>>>> Hi,
>>>>>      
>>>>>> On 01/12/2021 08:41, Bertrand Marquis wrote:
>>>>>>> Hi Ayan,
>>>>>>>          
>>>>>>>> On 30 Nov 2021, at 19:13, Ayan Kumar Halder<ayan.kumar.halder@xilinx.com>  wrote:
>>>>>>>>
>>>>>>>> Hi Andre,
>>>>>>>>
>>>>>>>> Thanks for your comments. They are useful.
>>>>>>>>
>>>>>>>> On 30/11/2021 09:49, Andre Przywara wrote:
>>>>>>>>> On Mon, 29 Nov 2021 19:16:38 +0000
>>>>>>>>> Ayan Kumar Halder<ayan.kumar.halder@xilinx.com>  wrote:
>>>>>>>>> Hi,
>>>>>>>>>> At the moment, Xen is only handling data abort with valid syndrome (i.e.
>>>>>>>>>> ISV=0). Unfortunately, this doesn't cover all the instructions a domain
>>>>>>>>>> could use to access MMIO regions.
>>>>>>>>>>
>>>>>>>>>> For instance, Xilinx baremetal OS will use:
>>>>>>>>>>
>>>>>>>>>>             volatile u32 *LocalAddr = (volatile u32 *)Addr;
>>>>>>>>>>             *LocalAddr = Value;
>>>>>>>>>>
>>>>>>>>>> This leave the compiler to decide which store instructions to use.
>>>>>>>>> As mentioned in the other email, this is wrong, if this points to MMIO:
>>>>>>>>> don't let the compiler do MMIO accesses. If a stage 2 fault isn't in
>>>>>>>>> an MMIO area, you should not see traps that you cannot handle already.
>>>>>>>>> So I don't think it's a good idea to use that as an example. And since
>>>>>>>>> this patch only seems to address this use case, I would doubt its
>>>>>>>>> usefulness in general.
>>>>>>>> Yes, I should have fixed the comment.
>>>>>>>>
>>>>>>>> Currently, I am testing with baremetal app which uses inline assembly code with post indexing instructions, to access the MMIO.
>>>>>>>>
>>>>>>>> ATM, I am testing with 32 bit MMIO only.
>>>>>>>>
>>>>>>>> On the usefulness, I am kind of torn as it is legitimate for post indexing instructions to be used in an inline-assembly code for accessing MMIO. However, that may not be something commonly seen.
>>>>>>>>
>>>>>>>> @Stefano/Bertrand/Julien/Volodymyr :- As you are the Arm mantainers, can you comment if we should have decoding logic or not ?
>>>>>>> Andre gave you the official statement from Arm and there is nothing more I can say.
>>>>>> I think this would be handy for other hypervisor and OS developper to
>>>>>> know what they can expect when running in a virtualized environment. So
>>>>>> would it be possible to update the Arm Arm reflecting this statement?
>>>>> I don't think it's within the scope of the ARM ARM to say that. It just
>>>>> says that "there is no syndrome information", and your mileage may vary in
>>>>> working around that.
>>>>>
>>>>> Personally I would say that if you expect your software to work nicely
>>>>> under a hypervisor, then just avoid those instructions. The Linux kernel
>>>>> certainly did so.
>>>>>
>>>>> You can try to do instruction emulation, but doing this right can get
>>>>> tricky quickly: think about I$/D$ coherency, MMU on or off, etc.
>>>> I am trying to get all the restrictions that need to be checked. I have
>>>> referred
>>>> https://developer.arm.com/documentation/dui0802/a/A64-General-Instructions/Register-restrictions-for-A64-instructions?lang=en
>>>> and "Arm A64 Instruction Set Architecture - DDI 0596" - LDR (immediate).
>>>>
>>>> So far I only see the following restrictions:-
>>>>
>>>> Rn -ne Rt
>>>>
>>>> Rt -ne SP
>>>>
>>>> You had mentioned the following cases :-
>>>>
>>>> 1. XZR vs SP - I see that both these refer to register no 31. Xen gets
>>>> the register number (for Rn/Rt) only, so I am not sure what is to be
>>>> done here.
>>> But the emulation code in Xen needs to know whether number 31 refers to the
>>> stack pointer or to the zero register. This depends on the context of the
>>> instruction. It's nothing magical about it, you just need to figure out
>>> which it is in your case and make sure that the code uses the right
>>> value. In the LDR case n==31 means SP, but t==31 means XZR. The emulation
>>> would need to consider this.
>> I see what you mean. I had a look at
>> xen/tools/qemu-xen-dir-remote/target/arm/cpu.h, CPUARMState {}. I don't
>> see anywhere we need to refer register by its name. IIUC, the
>> instruction decoding logic needs to know the register number only.
> But there is of course still a difference between them: they refer to two
> separate registers, they just share the encoding of x31 in the instruction.
> Each instruction then *knows* what register it needs to go to when it sees
> number 31.
> By its very nature, you don't need to save XZR, so GPR[31] is typically
> the SP, if you have an array holding register values, and you
> probably handle the XZR case in code.
>
>> In fact, Xen would only read CPUARMState->xregs[31] for SP/XZR in
>> Aarch64 context. Let me know what I might be missing here.
>>
>> Beata/Richard - I see you have committed most recently on the file.
>> Please feel free to add your inputs.
>>
>>>   
>>>> 2. MMU on or off - As I see in try_handle_mmio(), one gets the physical
>>>> address in gpa. So I am not sure what is to be done here.
>>> You *might* be fine, if Xen takes care of that, I don't know.
>>> But it needs to explicitly consider those two cases - and also make
>>> sure that caching effects are cared for.
>>>   
>>>> 3. I/D coherency - I don't understand how this affects instruction decoding.
>>> In the ARM architecture the I cache and D cache are not necessarily
>>> coherent. So whatever the CPU reads via the data bus does not need to be
>>> the same data that the instruction fetcher read a while ago. And while
>>> there is a well-known sequence to make the current data side visible to
>>> the instruction side, there is nothing architectural for the other way
>>> around.
>>> For example the CPU fetches a bunch of instructions into the I cache, then
>>> consumes it from there. Now some code changes those instruction words in
>>> "memory". Without explicit D-cache-clean-to-the-PoU and
>>> I-cache-invalidate+ISB the CPU might still execute the old instructions.
>> This makes sense. Referring
>> https://developer.arm.com/documentation/den0024/a/Caches/Cache-maintenance,
>> I assume that the following instructions need to be executed before the
>> instruction is decoded.
>>
>> Xn <--- contains the address of the instruction to be decoded.
>>
>> STR Wt, [Xn]
>> DC CVAU, Xn // Clean datacache by VA to point of unification (PoU)
>> DSB ISH // Ensure visibility of the datacleaned from cache
>> IC IVAU, Xn // Invalidate instruction cache by VA to PoU
>> DSB ISH // Ensure completion of the invalidations
>> ISB // Synchronize the fetched instruction stream
> That is what I sketched above: the typical sequence to make sure the
> instruction fetcher reads the right instructions, after you updated them.
> BUT this is not what we need here, we need to other way around: read the
> instruction that the CPU executed, but via the data bus, from memory. And
> I wouldn't know of a neat architectural way to ensure this.
>
>>> But if your emulation code tries to read the instruction from memory, it
>>> fetches the data-visible side of it - which is not what the CPU executed,
>>> so end up emulating the wrong thing.
>> I am guessing that this should not be a very unusual case. Isn't this
>> similar to a host processor loading and modifying a firmware in the
>> memory. The firmware can then be executed by a different
>> micro-controller or some programmable engine. I mean the data pipeline
>> or instruction pipeline should read the same contents from memory.
> ... if they are coherent. Otherwise you need explicit maintenance, see
> above. I mean it's the same situation with an external processor: this
> core reads instructions from memory and is probably buffering/caching them
> (crucial for performance). Now you need to tell if that buffer might
> contain stale data, and if the data in memory has changed meanwhile.
>
>>> Please also keep in mind that the architecture does not *guarantee*
>>> coherency, but in reality it might actually be coherent - either because
>>> of the particular silicon implementation, or because of side effects in
>>> the system (data cache line being evicted, ISB executed). So seeing the
>>> effects of coherency in your testing does not mean you are safe, it might
>>> just happen by chance.
>> Is there some good way to test this to ensure the best possible
>> reliability ?
> That's the problem, I think: You can reason on the basis of the
> architecture as described in the ARM ARM, but this brings you to the
> problems above. You can now try to hand wave away the problems, by stating
> that this will never happen in practice, but you then leave the steady
> ground the architecture gives you. That's why I was asking before if this
> is really necessary code to have, or if you would just be better off
> fixing the guests.
>
> Cheers,
> Andre
>
>>>> Please help me to understand further.
>>>>
>>>> - Ayan
>>>>   
>>>>>      
>>>>>>> I will leave this decision to Stefano and Julien.
>>>>>> I have had a chat on IRC with Stefano about this. I think the main
>>>>>> sticking point is the Arm Arm doesn't clearly state those instructions
>>>>>> should not be used by a virtualized OS on MMIO regions.
>>>>> I don't understand why the ARM ARM would need to say that. Certainly you
>>>>> realise that immediately when trying to use them, and apparently it was not
>>>>> a problem in the last 8ish years of Xen/ARM's existence.
>>>>>
>>>>> So it's your decision on having the emulation, I personally would only do
>>>>> it when there is a *good* use case.
>>>>> And please apply the demanded scrutiny on the review - including all the
>>>>> corner cases like Rn=Rt, XZR vs. SP (as Jan said) and possibly MMU status.

I have submitted a v3 patch for this addressing most of the comments.

"[XEN v3] xen/arm64: io: Decode ldr/str post-indexing instructions". 
Please have a look.

- Ayan

>>>>>
>>>>> Cheers,
>>>>> Andre
>>>>>      
>>>>>> To me, this topic looks similar to the set/way instruction dilemma. They
>>>>>> are a pain to virtualize (and the Arm Arm clearly hint it) but we had to
>>>>>> do it because some OSes relied on them.
>>>>>>
>>>>>> I think the main difference is the Arm Arm doesn't hint they should not
>>>>>> be used (it only says a valid syndrome is not provided) and the
>>>>>> implementation should hopefully be smaller and self-contained.
>>>>>>
>>>>>> So I would be inclined to allow Xen to decode post-indexing instructions
>>>>>> (pending the review).
>>>>>>
>>>>>> Cheers,
>>>>>>      

