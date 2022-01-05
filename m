Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 22CC44856E9
	for <lists+xen-devel@lfdr.de>; Wed,  5 Jan 2022 17:56:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.253688.434935 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n59ZJ-0002Ek-Oc; Wed, 05 Jan 2022 16:55:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 253688.434935; Wed, 05 Jan 2022 16:55:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n59ZJ-0002CW-KI; Wed, 05 Jan 2022 16:55:21 +0000
Received: by outflank-mailman (input) for mailman id 253688;
 Wed, 05 Jan 2022 16:55:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CctM=RV=xilinx.com=ayankuma@srs-se1.protection.inumbo.net>)
 id 1n59ZI-0002CQ-3L
 for xen-devel@lists.xenproject.org; Wed, 05 Jan 2022 16:55:20 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2060e.outbound.protection.outlook.com
 [2a01:111:f400:7eae::60e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 42be244a-6e48-11ec-9ce5-af14b9085ebd;
 Wed, 05 Jan 2022 17:55:18 +0100 (CET)
Received: from SN7PR04CA0014.namprd04.prod.outlook.com (2603:10b6:806:f2::19)
 by PH0PR02MB7463.namprd02.prod.outlook.com (2603:10b6:510:15::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4844.14; Wed, 5 Jan
 2022 16:55:14 +0000
Received: from SN1NAM02FT0016.eop-nam02.prod.protection.outlook.com
 (2603:10b6:806:f2:cafe::e9) by SN7PR04CA0014.outlook.office365.com
 (2603:10b6:806:f2::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4867.7 via Frontend
 Transport; Wed, 5 Jan 2022 16:55:14 +0000
Received: from xir-pvapexch01.xlnx.xilinx.com (149.199.80.198) by
 SN1NAM02FT0016.mail.protection.outlook.com (10.97.4.82) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4867.7 via Frontend Transport; Wed, 5 Jan 2022 16:55:13 +0000
Received: from xir-pvapexch01.xlnx.xilinx.com (172.21.17.15) by
 xir-pvapexch01.xlnx.xilinx.com (172.21.17.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Wed, 5 Jan 2022 16:55:12 +0000
Received: from smtp.xilinx.com (172.21.105.198) by
 xir-pvapexch01.xlnx.xilinx.com (172.21.17.15) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Wed, 5 Jan 2022 16:55:12 +0000
Received: from [10.71.116.201] (port=56661)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <ayan.kumar.halder@xilinx.com>)
 id 1n59ZA-0000x9-0V; Wed, 05 Jan 2022 16:55:12 +0000
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
X-Inumbo-ID: 42be244a-6e48-11ec-9ce5-af14b9085ebd
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=d2874sKI8ja7t5JpVZKU72nNyqFch7gIncWrZ/LnuUZbAXpcSvzsZSZk7tiCHxZz/I6pXA8feUvIsH2aFGpB+Xq+N80YOchva0J39hDrMHoiFqwTY657UNzps91DwvOXOGyCQVUsgCVwaYJDrB1Olckof2FTzjxpFfjGMtoZOvkDXIoFoAEz2qLpsNRBOretZbZoPqPw84vjulb7Z6HGn7X1jlBBjSAFvfSp0eD859jewTRhGaKTc3282j+QTC9cgV5c02CHIW35Xrxgqx0MThl1zDB0NkfFJMymF8lT14wPz+Uta7Ru2gwOGivLsJGAWYOTzukkWbcybtptQJyOlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iy3wP1PB1QiojTESkohQ67YE98m0ZWd/jMzKPXCfUBE=;
 b=YrNeQryJ+wam1cG6dBaxpH6O2aSjopr2WsI2TFpLnsTss/eHvVulzMJWlne/d54jUHkcUMgocuY2oii/pzUNVExwLXzT0np7hJi5GOyFqEXWHXVm/5UvuEOrOeP3Wlc7wM8xgg6AoWJm/54vqgtUuukmxMvgr1/JAspWG4FTBgCVM3XP3ZXJjTZRtC5D67Mr6jVoMNn4u0EDjiQCCUqUYsKc01P5q8fDxk/zSahx6U6N/bEgoinKrrWEcLHdVkHeXiAUKMvIn+58VMZhK+vggq88RJTN90pKITTXq9YxLRJoWv3f9DnMnp7zIVc0wjZALGMXZk9ka1TVRl3gRXSAoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.80.198) smtp.rcpttodomain=arm.com smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iy3wP1PB1QiojTESkohQ67YE98m0ZWd/jMzKPXCfUBE=;
 b=LrDM3Ppq8KOFcze3HYod6cAIMvv4HGwG39UZ2/BwqmSINs/BpsbwFa+5aparNktRCELazPr3lSpEAYhosOooJ5PfRXB5Nvq1KKS2AxnNXJFbqJEG8LK8ZlDpT6+Fb1ycqfSW3zXRWxRG6ZldNK6AGkmoiSbJhpx6KgaT96P8zlc=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.80.198)
 smtp.mailfrom=xilinx.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.80.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.80.198; helo=xir-pvapexch01.xlnx.xilinx.com;
Message-ID: <0f6e058a-bc23-2a77-6797-39bfacb7db79@xilinx.com>
Date: Wed, 5 Jan 2022 16:55:11 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.4.1
Subject: Re: [XEN v2] xen/arm64: io: Decode 32-bit ldr/str post-indexing
 instructions
To: Andre Przywara <andre.przywara@arm.com>, Julien Grall <julien@xen.org>
CC: Bertrand Marquis <Bertrand.Marquis@arm.com>, Ayan Kumar Halder
	<ayan.kumar.halder@xilinx.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, "sstabellini@kernel.org"
	<sstabellini@kernel.org>, "stefanos@xilinx.com" <stefanos@xilinx.com>,
	"Volodymyr_Babchuk@epam.com" <Volodymyr_Babchuk@epam.com>,
	"jbeulich@suse.com" <jbeulich@suse.com>
References: <20211129191638.19877-1-ayankuma@xilinx.com>
 <20211130094950.1bf368d6@donnerap.cambridge.arm.com>
 <a69d41f1-7b57-c127-ae73-2de5a581dddd@xilinx.com>
 <D8811539-65F2-4D40-BFEF-CE72EA8E902A@arm.com>
 <4315f3f8-4431-3257-dc95-a3089532237b@xen.org>
 <20211208120048.63fbf49b@donnerap.cambridge.arm.com>
From: Ayan Kumar Halder <ayan.kumar.halder@xilinx.com>
In-Reply-To: <20211208120048.63fbf49b@donnerap.cambridge.arm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8592ab49-8395-4ff8-9530-08d9d06c2498
X-MS-TrafficTypeDiagnostic: PH0PR02MB7463:EE_
X-Microsoft-Antispam-PRVS:
	<PH0PR02MB7463CC6A85C830DC7391EFB9B24B9@PH0PR02MB7463.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	V8XuLK0N7u6hXFXypRrP/7+jqnZteCEftD4wtRAem3OSlQ+sOw11Les8JtWs95uprR6yq1FtoDq941WR32mP0DLyEUlHPR2nU2HNZINn1WDKbqXla1GHx3JdFtuGcZT90zncBWIA9PbnLP5H7LSQWoBIKfOh/nU/ZrjnRK6s3oP/FiZnmpebfhuY4iMrVgCqBRsu+Y1iTqnG9MIx9kJMAhkKNvBC5iQhcWTTzaYTpLsW1HVOWHlkhrGilZKUKXSD+RqkcT+545l8pGxkPWxflUuxhxumWQIpQ5wD8xorXowA6gyVFb9ShC54cVMoS13xh3E8SF0cJ64S8cSgTTAMbnxQyRPIJ6O684NTYoe9wTcTlQcoBFUKCQ2vWgXdot09qqiSVAhi80U4JxKaLmEcIIrWzZoV60Djl8Ce8QflbEug5q6oWBdCWN3lnhvLzmaoNPh+8nnErMuulwzfgg5sp8MnDnMvaocmzLCA/n/nMkG8hECuemYSaFyVLCNXsgLSs61Vb4nBSssVZRKLOy0X+lLeaAweygZmUSrWzaVuFGSGKW9UihXGMsZMxB/PB38DFwRQhXC14QNF8c8tC9WMVRXxkfKYw4Rsf2/QSB2RGY2zG3Dmqd6M1M8EV2FHicEpjdQ9rKPquLT0ajgxghsR7uK8fPOQtyt7lbM4IwWr7u+XpG+Y/6x0JSh2vwlIPBSfV1Xs+2dxSO0X9B49E/USdaymdalLg47C67Dr4z5CxZeOgoeuZtFBx8qo/hp+F6gO37FvWI8RM3C3mr9e9rWu0I+TGY3qYka1vkMAa0STqxcvLotA7Ez2c6M9MP2aYP0skALl+0uEAqvFmrAPjQ9qPfnVFfJhBn6da/nw01XrHPg=
X-Forefront-Antispam-Report:
	CIP:149.199.80.198;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:xir-pvapexch01.xlnx.xilinx.com;PTR:unknown-80-198.xilinx.com;CAT:NONE;SFS:(4636009)(46966006)(36840700001)(83380400001)(8936002)(8676002)(110136005)(82310400004)(31696002)(70586007)(47076005)(5660300002)(316002)(54906003)(70206006)(9786002)(31686004)(4326008)(336012)(36756003)(186003)(426003)(966005)(2906002)(26005)(508600001)(2616005)(356005)(7636003)(36860700001)(53546011)(50156003)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jan 2022 16:55:13.6004
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8592ab49-8395-4ff8-9530-08d9d06c2498
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.80.198];Helo=[xir-pvapexch01.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1NAM02FT0016.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR02MB7463

Hi,

Thank you so much for your feedback.

I need a couple of clarifications before I can start with the v3 patch.

On 08/12/2021 12:00, Andre Przywara wrote:
> On Mon, 6 Dec 2021 19:31:06 +0000
> Julien Grall <julien@xen.org> wrote:
>
> Hi,
>
>> On 01/12/2021 08:41, Bertrand Marquis wrote:
>>> Hi Ayan,
>>>    
>>>> On 30 Nov 2021, at 19:13, Ayan Kumar Halder <ayan.kumar.halder@xilinx.com> wrote:
>>>>
>>>> Hi Andre,
>>>>
>>>> Thanks for your comments. They are useful.
>>>>
>>>> On 30/11/2021 09:49, Andre Przywara wrote:
>>>>> On Mon, 29 Nov 2021 19:16:38 +0000
>>>>> Ayan Kumar Halder <ayan.kumar.halder@xilinx.com> wrote:
>>>>> Hi,
>>>>>> At the moment, Xen is only handling data abort with valid syndrome (i.e.
>>>>>> ISV=0). Unfortunately, this doesn't cover all the instructions a domain
>>>>>> could use to access MMIO regions.
>>>>>>
>>>>>> For instance, Xilinx baremetal OS will use:
>>>>>>
>>>>>>           volatile u32 *LocalAddr = (volatile u32 *)Addr;
>>>>>>           *LocalAddr = Value;
>>>>>>
>>>>>> This leave the compiler to decide which store instructions to use.
>>>>> As mentioned in the other email, this is wrong, if this points to MMIO:
>>>>> don't let the compiler do MMIO accesses. If a stage 2 fault isn't in
>>>>> an MMIO area, you should not see traps that you cannot handle already.
>>>>> So I don't think it's a good idea to use that as an example. And since
>>>>> this patch only seems to address this use case, I would doubt its
>>>>> usefulness in general.
>>>> Yes, I should have fixed the comment.
>>>>
>>>> Currently, I am testing with baremetal app which uses inline assembly code with post indexing instructions, to access the MMIO.
>>>>
>>>> ATM, I am testing with 32 bit MMIO only.
>>>>
>>>> On the usefulness, I am kind of torn as it is legitimate for post indexing instructions to be used in an inline-assembly code for accessing MMIO. However, that may not be something commonly seen.
>>>>
>>>> @Stefano/Bertrand/Julien/Volodymyr :- As you are the Arm mantainers, can you comment if we should have decoding logic or not ?
>>> Andre gave you the official statement from Arm and there is nothing more I can say.
>> I think this would be handy for other hypervisor and OS developper to
>> know what they can expect when running in a virtualized environment. So
>> would it be possible to update the Arm Arm reflecting this statement?
> I don't think it's within the scope of the ARM ARM to say that. It just
> says that "there is no syndrome information", and your mileage may vary in
> working around that.
>
> Personally I would say that if you expect your software to work nicely
> under a hypervisor, then just avoid those instructions. The Linux kernel
> certainly did so.
>
> You can try to do instruction emulation, but doing this right can get
> tricky quickly: think about I$/D$ coherency, MMU on or off, etc.

I am trying to get all the restrictions that need to be checked. I have 
referred 
https://developer.arm.com/documentation/dui0802/a/A64-General-Instructions/Register-restrictions-for-A64-instructions?lang=en 
and "Arm A64 Instruction Set Architecture - DDI 0596" - LDR (immediate).

So far I only see the following restrictions:-

Rn -ne Rt

Rt -ne SP

You had mentioned the following cases :-

1. XZR vs SP - I see that both these refer to register no 31. Xen gets 
the register number (for Rn/Rt) only, so I am not sure what is to be 
done here.

2. MMU on or off - As I see in try_handle_mmio(), one gets the physical 
address in gpa. So I am not sure what is to be done here.

3. I/D coherency - I don't understand how this affects instruction decoding.

Please help me to understand further.

- Ayan

>
>>> I will leave this decision to Stefano and Julien.
>> I have had a chat on IRC with Stefano about this. I think the main
>> sticking point is the Arm Arm doesn't clearly state those instructions
>> should not be used by a virtualized OS on MMIO regions.
> I don't understand why the ARM ARM would need to say that. Certainly you
> realise that immediately when trying to use them, and apparently it was not
> a problem in the last 8ish years of Xen/ARM's existence.
>
> So it's your decision on having the emulation, I personally would only do
> it when there is a *good* use case.
> And please apply the demanded scrutiny on the review - including all the
> corner cases like Rn=Rt, XZR vs. SP (as Jan said) and possibly MMU status.
>
> Cheers,
> Andre
>
>> To me, this topic looks similar to the set/way instruction dilemma. They
>> are a pain to virtualize (and the Arm Arm clearly hint it) but we had to
>> do it because some OSes relied on them.
>>
>> I think the main difference is the Arm Arm doesn't hint they should not
>> be used (it only says a valid syndrome is not provided) and the
>> implementation should hopefully be smaller and self-contained.
>>
>> So I would be inclined to allow Xen to decode post-indexing instructions
>> (pending the review).
>>
>> Cheers,
>>

