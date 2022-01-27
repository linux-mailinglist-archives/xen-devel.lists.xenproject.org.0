Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E42849E69C
	for <lists+xen-devel@lfdr.de>; Thu, 27 Jan 2022 16:49:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.261575.453041 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nD70e-0002cG-FK; Thu, 27 Jan 2022 15:48:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 261575.453041; Thu, 27 Jan 2022 15:48:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nD70e-0002aL-BZ; Thu, 27 Jan 2022 15:48:28 +0000
Received: by outflank-mailman (input) for mailman id 261575;
 Thu, 27 Jan 2022 15:48:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=T5dr=SL=xilinx.com=ayankuma@srs-se1.protection.inumbo.net>)
 id 1nD70c-0002aF-5z
 for xen-devel@lists.xenproject.org; Thu, 27 Jan 2022 15:48:26 +0000
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam08on2061b.outbound.protection.outlook.com
 [2a01:111:f400:7e8d::61b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8e881a81-7f88-11ec-8f75-fffcc8bd4f1a;
 Thu, 27 Jan 2022 16:48:24 +0100 (CET)
Received: from SN6PR04CA0104.namprd04.prod.outlook.com (2603:10b6:805:f2::45)
 by MW4PR02MB7122.namprd02.prod.outlook.com (2603:10b6:303:76::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.8; Thu, 27 Jan
 2022 15:48:20 +0000
Received: from SN1NAM02FT0035.eop-nam02.prod.protection.outlook.com
 (2603:10b6:805:f2:cafe::6a) by SN6PR04CA0104.outlook.office365.com
 (2603:10b6:805:f2::45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.17 via Frontend
 Transport; Thu, 27 Jan 2022 15:48:20 +0000
Received: from xir-pvapexch02.xlnx.xilinx.com (149.199.80.198) by
 SN1NAM02FT0035.mail.protection.outlook.com (10.97.4.137) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4930.15 via Frontend Transport; Thu, 27 Jan 2022 15:48:19 +0000
Received: from xir-pvapexch02.xlnx.xilinx.com (172.21.17.17) by
 xir-pvapexch02.xlnx.xilinx.com (172.21.17.17) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Thu, 27 Jan 2022 15:48:18 +0000
Received: from smtp.xilinx.com (172.21.105.198) by
 xir-pvapexch02.xlnx.xilinx.com (172.21.17.17) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Thu, 27 Jan 2022 15:48:18 +0000
Received: from [10.71.119.211] (port=53640)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <ayan.kumar.halder@xilinx.com>)
 id 1nD70T-0006kG-NF; Thu, 27 Jan 2022 15:48:18 +0000
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
X-Inumbo-ID: 8e881a81-7f88-11ec-8f75-fffcc8bd4f1a
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dH1Nkfo1WAV6jfQ6O7pVwNce5+bcZFqItS8cr5aAuB0mHXs7lF7/jxgwX2QaIktCtviqztV/iDYElhOwhaRQfOgzroCOtTgxzo4e4qVPv/a7fcBKhEWwfzrGROeoFCmDs46iokm9THJVBSHnmeXdhymJBb6RFsg0nth3aNWEtOwjf+einJ2+ORZqWB3d85wXc+kOknN6D9xF/ZP/ydaRzYbbDe4PVpz43Pi3CBsD96pKvlV80eT7h7v7QWWh4FKEgsHeNDXDxVyuqIHDeNc18snBq79WA43yTP9iew/fCat+8bQ7KBpOicHk74IdXD7AiI+ERfPrZvcht/8u9FjxhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TJV2GIf50jElWiSP06bslgEuffoQFwZvW85RN1gxl3U=;
 b=nKWI51Jmum34q7H1aK66twXuGQpgDFAVTvuDFQ/YBUh4RmHO5cD0YPkk4MiIbTPZJD3THbaBNEEdsCo5ixCGiyM9jlsaW5hx5AlfmywLx4ziAaqgt01gj8jpppmLs+yFF8E28GLf+YrBMF4DWwkg9WFGzAg3mQ5UVPAVZFltyrbeh6WL3BjQoEeokLqYvAGZIjnf3B5ra12HIXfvgShN5lbuAJ3pM3I/3QKWjh/FWDA+2rjgrg1U26ZW37ic0BxwUFEmodBRre3v+fhkT6jYcOAcv/w4DwGNSBhFclU0BfT5Xxz2Samh9w3gdLnWs3PseDdaBkIU81VIOtL5XGdqzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.80.198) smtp.rcpttodomain=xen.org smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TJV2GIf50jElWiSP06bslgEuffoQFwZvW85RN1gxl3U=;
 b=oTh7r55dY1OJ5PKoahkRk/IooXhsW6XtNmqCI5+5wmsxeLwfg567JbBKmJEpJeglZLpHgJQEczqF+Di1RRA2amDA4EhATsZRJYhXYvyUtO9sWcickDKntiBjj6+rb5KYzKebERyVIf4mGu5H2sVyraHuo0pP4+u3vxFYV1B2Vok=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.80.198)
 smtp.mailfrom=xilinx.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.80.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.80.198; helo=xir-pvapexch02.xlnx.xilinx.com;
Message-ID: <bcd28a18-80ea-0987-6867-5c6fc634a8a5@xilinx.com>
Date: Thu, 27 Jan 2022 15:48:17 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.5.1
Subject: Re: [XEN v1] xen/arm: io: Check ESR_EL2.ISV != 0 before searching for
 a MMIO handler
To: Julien Grall <julien@xen.org>, Ayan Kumar Halder
	<ayan.kumar.halder@xilinx.com>, Julien Grall <julien.grall.oss@gmail.com>
CC: xen-devel <xen-devel@lists.xenproject.org>, Stefano Stabellini
	<sstabellini@kernel.org>, <stefanos@xilinx.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Bertrand Marquis <bertrand.marquis@arm.com>
References: <20220126165827.61168-1-ayankuma@xilinx.com>
 <CAJ=z9a1KjOAeR4vpRQGA_sYSvx1h331NKim2bgG8jyru94Beow@mail.gmail.com>
 <eeedbb72-d881-363d-c862-234b705eaec7@xilinx.com>
 <CAJ=z9a0VEqr_ODQZvdsO82PiOpHt5-TVc4JWE5pJCeNYPh+XHg@mail.gmail.com>
 <bee7ea7a-6d3d-bf3c-4b5f-d40deb601867@xilinx.com>
 <2064878e-4ef1-f0a3-1476-7175c2c8d29e@xen.org>
From: Ayan Kumar Halder <ayan.kumar.halder@xilinx.com>
In-Reply-To: <2064878e-4ef1-f0a3-1476-7175c2c8d29e@xen.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b0e4ae97-d0e7-474f-03a1-08d9e1ac715e
X-MS-TrafficTypeDiagnostic: MW4PR02MB7122:EE_
X-Microsoft-Antispam-PRVS:
	<MW4PR02MB71220FF998D8F9BE32E4B455B2219@MW4PR02MB7122.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	RwZ36g1EzkANh4NYAVemdUpqLo7wgi0WuQbfFyCuWNsa6ldw+XG/cXWUFrZ169cwQhEkdmNt6ecku82mEBcAYtMBQV7Ro3TjOFs0ZXGYAwCj+uWVbb3YQ4pvddfgJ+WMUtRSpxnispq7158JTzmpMOaC79IWArY60TthwNXqk98f+4YIUlGI8A7B08A/wgNbAMOx5W+ooMzEQck2jGKVcXuOQIl86vvWax0RhtXB9wzKdu5mKaNaPuqrY2hooHypjn92LtZqlrDX0FGBhNefJzrUK3YOR8qas7aVC34bfETnTRaPubG9daWZgBtLrgsLmcTgrT1lW2tNe7KgI0rAPJLVxrNwpUwrbJt3pJgoCm1EcyD6ZSoSG2m8wX1y7vxSzcEYypNKAKtmILFn41ESqirS0mzLQvQ+qn7CUmrGETrDjH70UjzIYF1c7dJBKhpvOSjnn5jS2Ao9/EKa2VTe7noUBIoJOxWEzefjaKRfaAWlDNwj+SwcTxRyQX3ebK9f9PftcmlKLZMMx7EXaEdXsS/bnl4M+PNy7AuuQBXBLlqNtFsStBgpFuhNILyUod8ZaYqBp3jaCTyLWlYGXVqYP4BkaOeg7y4UVZXYD8ibJMJ0cTWEziS7qxz9NKpJ3N1Iyqy9IGkIe/EWVH3NZPhgVoiv75EerkSZXCke6iQ7P9DJWdY3wSXb/uDZl+nQaccwn3tZpCs40Hxxk9StAOKt0/0j3c5WAAz/rGFaMF973kWpagL/UdWnNgfYyocovfGQK7JRHD1YJHT9s8EWkO0E9U2gZB9f+/vHyQSSbIY6husR27FWmgxTqF18nOy9XAPEziaqnwRJy3Rl3hHfnygiuD6rsPXM+PBtbSEJu/3l4ys=
X-Forefront-Antispam-Report:
	CIP:149.199.80.198;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:xir-pvapexch02.xlnx.xilinx.com;PTR:unknown-80-198.xilinx.com;CAT:NONE;SFS:(4636009)(46966006)(40470700004)(36840700001)(83380400001)(47076005)(40460700003)(31696002)(36860700001)(186003)(70586007)(356005)(70206006)(31686004)(316002)(2906002)(36756003)(508600001)(9786002)(2616005)(53546011)(5660300002)(82310400004)(426003)(8676002)(26005)(8936002)(336012)(54906003)(110136005)(7636003)(4326008)(50156003)(51383001)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2022 15:48:19.9434
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b0e4ae97-d0e7-474f-03a1-08d9e1ac715e
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.80.198];Helo=[xir-pvapexch02.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1NAM02FT0035.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR02MB7122

Hi Julien,

Thanks a lot for your clarification. Appreciate your help. I have a 
concern as below:-

On 27/01/2022 13:57, Julien Grall wrote:
>
>
> On 27/01/2022 13:20, Ayan Kumar Halder wrote:
>> Hi,
>>
>> Asking here as well (might not have been clear on irc).
>>
>> On 27/01/2022 00:10, Julien Grall wrote:
>>> Hi,
>>>
>>> On Wed, 26 Jan 2022, 17:56 Ayan Kumar Halder, 
>>> <ayan.kumar.halder@xilinx.com> wrote:
>>>
>>>     Hi Julien,
>>>
>>>     On 26/01/2022 17:22, Julien Grall wrote:
>>>>     Hi,
>>>>
>>>>     On Wed, 26 Jan 2022, 16:58 Ayan Kumar Halder,
>>>>     <ayan.kumar.halder@xilinx.com> wrote:
>>>>
>>>>         Refer to Armv8 ARM DDI 0487G.b, Page D13-3219 "ISS encoding
>>>>         for an exception
>>>>         from a Data Abort" :-
>>>>         ISV - ISS[23:14] holds a valid instruction syndrome
>>>>
>>>>         When the ISV is 0, the instruction could not be decoded by
>>>>         the hardware (ie ISS
>>>>         is invalid). One should immediately return an error to the
>>>>         caller with an
>>>>         appropriate error message.
>>>>
>>>>     That's going to be very spammy because we have use-case where it
>>>>     could trap without a valid ISV (e.g. when break-before-make
>>>>     happens). So please don't had a message.
>>>
>>>     There is already a logging statement in traps.c :-
>>>
>>>     inject_abt:
>>>         gdprintk(XENLOG_DEBUG,
>>>                  "HSR=%#"PRIregister" pc=%#"PRIregister"
>>>     gva=%#"PRIvaddr" gpa=%#"PRIpaddr"\n",
>>>                  hsr.bits, regs->pc, gva, gpa);
>>>
>>>     The reason for the error is to give the user some hint that an IO
>>>     abort is triggered by Xen.
>>>
>>> The main difference here is inject_dabt should only be reached when 
>>> we exhausted all the possibility in I/O handling.
>>>
>>> In your case, if we can't handle as an MMIO then we should 
>>> fallthrough the other method (see do_trap_stage2_abort_guest()).
>>>
>>> In fact, moving the check early and doing the decoding before 
>>> find_mmio() or try_fwd_io() is actually wrong. Sorry I should 
>>> realized that earlier.
>>
>> Why should we care about MMIO when ISS is invalid ?
>
> Because a translation fault doesn't mean this is emulated MMIO. This 
> may be actual RAM but with the stage-2 entry marked as invalid for 
> tracking purpose (or else).
>
>> Should we not check first if the ISS is valid or not as it will 
>> trigger IO_abort regardless of the MMIO.
>
> No. Imagine the guest decides to use a store exclusive on a RAM region 
> that was temporally marked as invalid in the stage-2 page-table.
>
> This will generate a data abort in Xen with ISV=0. We want to try to 
> resolve the fault first and retry the instruction.
>
>>
>> I am assuming that once Xen resolves the MMIO 
>> (p2m_resolve_translation_fault()), the guest will again try to run 
>> the same instruction on MMIO region. This will be trapped in Xen 
>> which will return IO abort as the post-indexing instruction could not 
>> be decoded.
>
> The access will not trap again in Xen if the fault was resolved.

I think your words makes sense.

However, I am still concerned that we might not be doing the correct 
thing in try_fwd_ioserv().

See this :-

     ioreq_t p = {
         .type = IOREQ_TYPE_COPY,
         .addr = info->gpa,
         .size = 1 << info->dabt.size,
         .count = 1,
         .dir = !info->dabt.write,
         /*
          * On x86, df is used by 'rep' instruction to tell the direction
          * to iterate (forward or backward).
          * On Arm, all the accesses to MMIO region will do a single
          * memory access. So for now, we can safely always set to 0.
          */
         .df = 0,
         .data = get_user_reg(regs, info->dabt.reg),
         .state = STATE_IOREQ_READY,
     };
If info->dabt.valid = 0, then '.size', '.dir' and '.data' fields are 
invalid.

'.size' gets used in ioreq_server_select() to obtain the end address. It 
seems incorrect to me.

I suppose "if ( !info->dabt.valid )" needs to be checked before "s = 
ioreq_server_select(v->domain, &p);".

What do you think ?

- Ayan

>
> Cheers,
>

