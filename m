Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B0B0D4D0AFB
	for <lists+xen-devel@lfdr.de>; Mon,  7 Mar 2022 23:23:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.286454.485974 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nRLlA-0002im-8Y; Mon, 07 Mar 2022 22:23:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 286454.485974; Mon, 07 Mar 2022 22:23:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nRLlA-0002g5-4e; Mon, 07 Mar 2022 22:23:20 +0000
Received: by outflank-mailman (input) for mailman id 286454;
 Mon, 07 Mar 2022 22:23:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bwGU=TS=xilinx.com=ayankuma@srs-se1.protection.inumbo.net>)
 id 1nRLl8-0002fz-OZ
 for xen-devel@lists.xenproject.org; Mon, 07 Mar 2022 22:23:18 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2060f.outbound.protection.outlook.com
 [2a01:111:f400:7e88::60f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2eb4085b-9e65-11ec-8eba-a37418f5ba1a;
 Mon, 07 Mar 2022 23:23:17 +0100 (CET)
Received: from DM6PR21CA0005.namprd21.prod.outlook.com (2603:10b6:5:174::15)
 by CH2PR02MB6294.namprd02.prod.outlook.com (2603:10b6:610:e::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.14; Mon, 7 Mar
 2022 22:23:10 +0000
Received: from DM3NAM02FT050.eop-nam02.prod.protection.outlook.com
 (2603:10b6:5:174:cafe::7a) by DM6PR21CA0005.outlook.office365.com
 (2603:10b6:5:174::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5081.5 via Frontend
 Transport; Mon, 7 Mar 2022 22:23:10 +0000
Received: from xir-pvapexch02.xlnx.xilinx.com (149.199.80.198) by
 DM3NAM02FT050.mail.protection.outlook.com (10.13.5.53) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5038.14 via Frontend Transport; Mon, 7 Mar 2022 22:23:10 +0000
Received: from xir-pvapexch02.xlnx.xilinx.com (172.21.17.17) by
 xir-pvapexch02.xlnx.xilinx.com (172.21.17.17) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Mon, 7 Mar 2022 22:23:09 +0000
Received: from smtp.xilinx.com (172.21.105.197) by
 xir-pvapexch02.xlnx.xilinx.com (172.21.17.17) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Mon, 7 Mar 2022 22:23:09 +0000
Received: from [10.71.118.47] (port=65347)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <ayan.kumar.halder@xilinx.com>)
 id 1nRLkx-0007Pz-Rz; Mon, 07 Mar 2022 22:23:08 +0000
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
X-Inumbo-ID: 2eb4085b-9e65-11ec-8eba-a37418f5ba1a
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=de9HuMKG0O5yefaIPt+94kyLY3WjtdgsnsafL9LiGqvZ2VEs49C05a10wZtJiGWGMVn3gNMVYqMBD3/wpZLtGi0kSQl1qyZ+8rY+LgNXoMmnh0TbMyrjO5qyYX6TR0aJh20ruxJRSSA55xoTM8uIKBu7DCLCDe5l9EsSpeOoJABThpQ67b+iSsC0R/rrs4OJwK5PYmBQF7STViRzkXGNSmVS7VQsnDEwzIZEDouqCZWXZeNPzgJV6PtLHO/Ni0H9Ub9WcTWo2bxA2X0NBLpfv0ceyWLqG9z8B/+cEFGaVRbeGEyn703n3V5CR2wgqaw6dLRx3kIyoMP7y7p/ys6zVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xPch9ewswf0FAvWG5bQkDwgAjlT3Qem9cNaXnNbglBw=;
 b=AMkR4ahnnA2QFNhBZ/JG2h+JLFSSe4tpaVki5/EYykSxoSSyO/2YqDUttBxvoeFuUzM8gC2EuQ7SRJRkZOJ0EzgJc6ml1na1WKldseBvocgPFaLJ9pPok4G6Vkq/pr0T7j/Z3mhWRpuDFLmYiw9aC04VQa3CvmfSVYDcy3K9MwMRw4UbQyV+9SsN8WfFiOMiXmv6Z+vuQ8wPMusXKF5vdQS2TiThV9OzTwiCL0ntq6M6zpOhfNOanV3sLr6QIcpKyMr+8ZMb+eeT2lvdIi0Hqn3I8TgPqcxTGQFDbIVkCDhCvqKzas3E7dEzMjLOT05DmhvD5xvzCD0X8JT9Zd1AvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.80.198) smtp.rcpttodomain=xen.org smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xPch9ewswf0FAvWG5bQkDwgAjlT3Qem9cNaXnNbglBw=;
 b=nFV+80KQbYxokwNQDC/neNre/6+6XhbiK7FXCBwtk5jBmgP5xMMxYscQRhaZfgUd+vwPe3BSjb0XJxLlJH/+ugL/TmD8SCO8sF9ggrctQAQamqJfyWTMnpboghmrJ/KxN5gX0yWtU89inlgC9hpq89syEcqU/nIpo32NJAORFtM=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.80.198)
 smtp.mailfrom=xilinx.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.80.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.80.198; helo=xir-pvapexch02.xlnx.xilinx.com;
Message-ID: <124726df-eafe-014a-ea9a-f97e0921eccc@xilinx.com>
Date: Mon, 7 Mar 2022 22:23:07 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.6.2
Subject: Re: [XEN v9 3/4] xen/arm64: io: Handle the abort due to access to
 stage1 translation table
To: Julien Grall <julien@xen.org>, Ayan Kumar Halder
	<ayan.kumar.halder@xilinx.com>, <xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>, <stefanos@xilinx.com>,
	<Volodymyr_Babchuk@epam.com>, <bertrand.marquis@arm.com>,
	<andrew.cooper3@citrix.com>, <george.dunlap@citrix.com>, <jbeulich@suse.com>,
	<wl@xen.org>, <paul@xen.org>, <roger.pau@citrix.com>
References: <20220301124022.10168-1-ayankuma@xilinx.com>
 <20220301124022.10168-4-ayankuma@xilinx.com>
 <68acfbf0-f2c1-c52e-93a3-632f1286d90f@xen.org>
 <5d5b0fc1-6f47-dfc0-dca3-5d60483a6eae@xilinx.com>
 <3e9d5d0c-f68f-004e-06b7-c4f0452f1e64@xen.org>
From: Ayan Kumar Halder <ayan.kumar.halder@xilinx.com>
In-Reply-To: <3e9d5d0c-f68f-004e-06b7-c4f0452f1e64@xen.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9be99591-988f-4295-3244-08da00890ff3
X-MS-TrafficTypeDiagnostic: CH2PR02MB6294:EE_
X-Microsoft-Antispam-PRVS:
	<CH2PR02MB6294E19EB4F295F6DBAD4E03B2089@CH2PR02MB6294.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	IzDNnVBVPmSJO+WQw6V5MU0q6MdBI6N8YS+82opCSOP3Doft6BYYBzrFDPyRqivbahlooPeDMxiFv612ibbaj0gHPa/ZF5kELE1dLfZT70oDJERP3Zxe4KzHStf3unwvXYGJlbdqjESCgcR11P7hwudrcSUV1MRwAEnt9KXq4YXjt3YADvOUj4YGgO9QG3ZQby/3IWaiQhABEWM7IRILn56rNfZ0xV7oHKflfKKUR3VgfQ1YGv+pFtFXhmBg3m5td/hlaKYC5Pt5SW32x+67e6uWRdEAqbYRGPrarj8IHgLpNEEnqRjnxWlYmFtAitdITYdIq6i0/7ZU//VoPWyTKKTcYcQ4ubn8fYZemjagMMqbf0LTg4D6lfjKNjS+h3td7JiJ7IcWIpRwj/dNEXGt14ooqsse0EECaNt+/a/pO+WI7Ld3yUmnPOoetKDSXAVyTX/zwLSzniIn5r9LYsIiaY9aTdCk5Xuzj9k/uSA52GDKGvdFNkhCKRH5ZCd8CAoUvUKhvffY2/7re+HZ9Ym74ZMT7KkM+UXZ+1ne9eaEeLYdkriJPPjYPke2z7qZ2xLrMk2Y504dqSZgzNQJ2V/FZHnpwv52Hvy01Vk2N3e3v5YTVkyx3RGyAzRcosc5jJT8G2lUETaEQEF1Fxvyn2ZGcUvsOhcoQxhBX8IyjTU2tUbDO1A/kSATEJKCtrLyLypi5YvZt++swivZNicnFmQeCWk5789xDqlYsEfI6D52EjxeAgRCcWNYnUz1FwSpS1fWQoMaIkA9EwxwK5TY25AQ7g==
X-Forefront-Antispam-Report:
	CIP:149.199.80.198;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:xir-pvapexch02.xlnx.xilinx.com;PTR:unknown-80-198.xilinx.com;CAT:NONE;SFS:(13230001)(4636009)(36840700001)(40470700004)(46966006)(4326008)(26005)(8936002)(336012)(9786002)(53546011)(8676002)(54906003)(7416002)(40460700003)(5660300002)(186003)(426003)(83380400001)(36756003)(31696002)(110136005)(31686004)(2616005)(356005)(7636003)(2906002)(36860700001)(82310400004)(508600001)(70586007)(70206006)(47076005)(316002)(50156003)(43740500002)(473944003);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Mar 2022 22:23:10.2118
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9be99591-988f-4295-3244-08da00890ff3
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.80.198];Helo=[xir-pvapexch02.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DM3NAM02FT050.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR02MB6294


On 07/03/2022 19:37, Julien Grall wrote:
>
>
> On 07/03/2022 14:27, Ayan Kumar Halder wrote:
>> Hi Julien,
>
> Hi Ayan,

Hi Julien,

I need a bit of clarification to understand this.

>
>>
>> One clarification.
>>
>> On 04/03/2022 10:39, Julien Grall wrote:
>>> Hi Ayan,
>>>
>>> On 01/03/2022 12:40, Ayan Kumar Halder wrote:
>>>> If the abort was caused due to access to stage1 translation table, Xen
>>>> will assume that the stage1 translation table is in the non MMIO 
>>>> region.
>
> Reading this commit message again. I think you want to explain why we 
> want to do that because, from my understanding, this is technically 
> not forbidden by the Arm Arm.
>
> From the previous discussion, we want to do this because we can't 
> easily handle such fault on emulated region (we have no away to the 
> walker the value read).

Sorry, Can you explain this a bit more ? Do you mean that if the page 
table is located in the emulated region, map_domain_page() (called from 
p2m_next_level()) will fail.

But for emulated region, shouldn't pages be already mapped for Xen to 
access them ?

>
>>>> It will try to resolve the translation fault. If it succeeds, it will
>>>> return to the guest to retry the instruction. If not, then it means
>>>> that the table is in MMIO region which is not expected by Xen. Thus,
>>>> Xen will forward the abort to the guest.
>>>>
>>>> Signed-off-by: Ayan Kumar Halder <ayankuma@xilinx.com>
>>>> ---
>>>>
>>>> Changelog :-
>>>>
>>>> v1..v8 - NA
>>>>
>>>> v9 - 1. Extracted this change from "[XEN v8 2/2] xen/arm64: io: 
>>>> Support
>>>> instructions (for which ISS is not..." into a separate patch of its 
>>>> own.
>>>> The reason being this is an existing bug in the codebase.
>>>>
>>>>   xen/arch/arm/io.c    | 11 +++++++++++
>>>>   xen/arch/arm/traps.c | 12 +++++++++++-
>>>>   2 files changed, 22 insertions(+), 1 deletion(-)
>>>>
>>>> diff --git a/xen/arch/arm/io.c b/xen/arch/arm/io.c
>>>> index bea69ffb08..ebcb8ed548 100644
>>>> --- a/xen/arch/arm/io.c
>>>> +++ b/xen/arch/arm/io.c
>>>> @@ -128,6 +128,17 @@ void try_decode_instruction(const struct 
>>>> cpu_user_regs *regs,
>>>>           return;
>>>>       }
>>>>   +    /*
>>>> +     * At this point, we know that the stage1 translation table is 
>>>> in the MMIO
>>>> +     * region. This is not expected by Xen and thus it forwards 
>>>> the abort to the
>>>
>>> We don't know that. We only know that there are no corresponding 
>>> valid mapping in the P2M. So the address may be part of an emulated 
>>> MMIO region or invalid.
>>>
>>> For both cases, we will want to send an abort.
>>>
>>> Furthermore, I would say "emulated MMIO region" rather than MMIO 
>>> region because the P2M can also contain MMIO mapping (we usually 
>>> call then "direct MMIO").
>>
>> Can I say MMIO region (to indicate both emulated and direct) ? The 
>> reason being the assumption that stage1 page tables cannot be in the 
>> MMIO region. And thus, when check_p2m() is invoked, we do not invoke 
>> try_map_mmio(gaddr_to_gfn(gpa).
>>
>> See this snippet :-
>>
>>              if ( xabt.s1ptw )
>>                  check_mmio_region = false;
>
> Thinking a bit more of this. I would actually drop this check. We 
> don't need to decode the instruction, so I don't think there are much 
> benefits here to restrict access for direct MMIO. Did I miss anything?
>
Can Linux or any OS keep its page tables in the direct MMIO space ? If 
yes, then try_map_mmio() needs to be invoked to map the region, so that 
OS can access it. If not, then Xen needs to return abort because the OS 
may be behaving maliciously.

My understanding from previous discussion was that it does not make 
sense for linux or any OS to keep its page tables in any MMIO region 
(emulated or direct). Please correct me if mistaken.

- Ayan

> Cheers,
>

