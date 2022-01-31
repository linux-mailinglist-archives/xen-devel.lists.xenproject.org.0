Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 77CE44A4F97
	for <lists+xen-devel@lfdr.de>; Mon, 31 Jan 2022 20:42:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.263286.455961 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nEcYv-0003II-N3; Mon, 31 Jan 2022 19:42:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 263286.455961; Mon, 31 Jan 2022 19:42:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nEcYv-0003G9-Jf; Mon, 31 Jan 2022 19:42:05 +0000
Received: by outflank-mailman (input) for mailman id 263286;
 Mon, 31 Jan 2022 19:42:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JbNP=SP=xilinx.com=ayankuma@srs-se1.protection.inumbo.net>)
 id 1nEcYt-0003G3-Cw
 for xen-devel@lists.xenproject.org; Mon, 31 Jan 2022 19:42:03 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on20603.outbound.protection.outlook.com
 [2a01:111:f400:7eab::603])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id dbe688eb-82cd-11ec-8eb8-a37418f5ba1a;
 Mon, 31 Jan 2022 20:42:02 +0100 (CET)
Received: from SN7PR04CA0106.namprd04.prod.outlook.com (2603:10b6:806:122::21)
 by DM8PR02MB7877.namprd02.prod.outlook.com (2603:10b6:8:20::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.20; Mon, 31 Jan
 2022 19:41:58 +0000
Received: from SN1NAM02FT0059.eop-nam02.prod.protection.outlook.com
 (2603:10b6:806:122:cafe::91) by SN7PR04CA0106.outlook.office365.com
 (2603:10b6:806:122::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.17 via Frontend
 Transport; Mon, 31 Jan 2022 19:41:58 +0000
Received: from xir-pvapexch01.xlnx.xilinx.com (149.199.80.198) by
 SN1NAM02FT0059.mail.protection.outlook.com (10.97.5.175) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4930.15 via Frontend Transport; Mon, 31 Jan 2022 19:41:58 +0000
Received: from xir-pvapexch02.xlnx.xilinx.com (172.21.17.17) by
 xir-pvapexch01.xlnx.xilinx.com (172.21.17.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Mon, 31 Jan 2022 19:41:56 +0000
Received: from smtp.xilinx.com (172.21.105.197) by
 xir-pvapexch02.xlnx.xilinx.com (172.21.17.17) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Mon, 31 Jan 2022 19:41:56 +0000
Received: from [10.71.117.31] (port=5775)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <ayan.kumar.halder@xilinx.com>)
 id 1nEcYm-0000Ld-Gm; Mon, 31 Jan 2022 19:41:56 +0000
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
X-Inumbo-ID: dbe688eb-82cd-11ec-8eb8-a37418f5ba1a
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lZ4/NfP+LWr0lufXBHdBxlVxgKIUeTUyJsXa38d+WK6/CGuWx5XTuHUr3yHZzR28AvjNA87DeGRZ7C+dz4mHsuCEZcCeHlKzn80E0qjWrLPyzEGC5aGAa90qfKTDn40JaYTcwk21w5iDjvoF+YU5NqiklXW6DWm458RXHXZ/JrBby5rYsaqkYzy44fjD4C0ix25XHbzzRnnRvNlw4suAQHr9sWLeXkTp5y6Kvou5a5/119KcEw4UikcvrVr9OCnixM16ck/wcYR06OpZeamswH0Q/PoXincl39ya+OxpK98WOnuW0DqT64B0KJ2r1ImN+jBL7bOJGVtTqoE2oqK3Yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FztjTXZ6bBYyl2o6txI8hdnqWYyxquLqkvM5TW1qZcs=;
 b=FeqtFKnc1U6QRqzl4sJ+LpwXpp/gPB9aijuISqzEAKejRO5VXPIdX0K7m244R/1XQGGXFVSA4w7oWkwcTiNpLE4e3vyvAwowULBpzj6Vn14TTr0WjkhlAPDTEyDamZ+nCSshhWxhnzO1T4baP3Bc63fRIQCtATgkAoFM5rGqUUFM4TuMJf6+0Cikw7vQPwL1VxjBn/mUhFCnKW0dxzpPvOU7Q3k9CPE5E6Wn5fYyy4N30otSAPtVl6bKVj9ANGfWEgB8F2DXuaUXu9puQH1gYVzQQmgqOE8luRmU73Pn4qQQhodqpalTlbKXQW9/Sdt2ccp1TPNgdo6hMwvSvEtqoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.80.198) smtp.rcpttodomain=xen.org smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FztjTXZ6bBYyl2o6txI8hdnqWYyxquLqkvM5TW1qZcs=;
 b=Y9UNdQI8kQs62EiXwmRNjQKXhrt90cStfXqV4NbFrB34eCL9T+1+yo9ALlYLHJvG+CIJpQkf8219hIXNcV65/uiA8MGp8kU9eqVmEv7OP70J5qlpB2cybRUGh/ikfcFI7fTywCaXVyko9jPsMQ3IkAB+igZ72Mkk40qXlSW2mFs=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.80.198)
 smtp.mailfrom=xilinx.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.80.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.80.198; helo=xir-pvapexch01.xlnx.xilinx.com;
Message-ID: <f209d185-1c64-74f0-bb79-16feafe77242@xilinx.com>
Date: Mon, 31 Jan 2022 19:41:56 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.5.1
Subject: Re: [XEN v1] xen/arm: io: Check ESR_EL2.ISV != 0 before searching for
 a MMIO handler
To: Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
CC: Julien Grall <julien.grall.oss@gmail.com>, Ayan Kumar Halder
	<ayan.kumar.halder@xilinx.com>, xen-devel <xen-devel@lists.xenproject.org>,
	<stefanos@xilinx.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>
References: <20220126165827.61168-1-ayankuma@xilinx.com>
 <CAJ=z9a1KjOAeR4vpRQGA_sYSvx1h331NKim2bgG8jyru94Beow@mail.gmail.com>
 <eeedbb72-d881-363d-c862-234b705eaec7@xilinx.com>
 <CAJ=z9a0VEqr_ODQZvdsO82PiOpHt5-TVc4JWE5pJCeNYPh+XHg@mail.gmail.com>
 <bee7ea7a-6d3d-bf3c-4b5f-d40deb601867@xilinx.com>
 <2064878e-4ef1-f0a3-1476-7175c2c8d29e@xen.org>
 <bcd28a18-80ea-0987-6867-5c6fc634a8a5@xilinx.com>
 <f6853134-8b65-5ffb-b39a-62ed26b3f499@xen.org>
 <alpine.DEB.2.22.394.2201271327430.27308@ubuntu-linux-20-04-desktop>
 <CAJ=z9a2Sp6w0b21p96YHx4w_m0jAbYJ4v=cVar-1nPeL7SotZw@mail.gmail.com>
 <CAJ=z9a1HML30aGn52GY34g-QbvLPHep7j=H-UDxsH1+B0CEb3Q@mail.gmail.com>
 <alpine.DEB.2.22.394.2201271513330.27308@ubuntu-linux-20-04-desktop>
 <9880cf7c-962f-8a32-483c-2bf5889d3273@xen.org>
 <alpine.DEB.2.22.394.2201281216130.27308@ubuntu-linux-20-04-desktop>
 <4d5a9e02-47ee-ef04-5c8f-602ad4bb9e81@xen.org>
From: Ayan Kumar Halder <ayan.kumar.halder@xilinx.com>
In-Reply-To: <4d5a9e02-47ee-ef04-5c8f-602ad4bb9e81@xen.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e935cd0c-25e4-4b55-e0fa-08d9e4f1be7f
X-MS-TrafficTypeDiagnostic: DM8PR02MB7877:EE_
X-Microsoft-Antispam-PRVS:
	<DM8PR02MB787733E6735B594ECFFE0746B2259@DM8PR02MB7877.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	oBZF8gNI84m6/An5xGf2qH0zWpTLSpUfViC8C4U6lw8YH2ieJCWU5wkzH1T9hhID1mJOZJiU0O+9Q/TqPYa7bR7i3eEjBmFAWYr2xLtrXOqUKQfB18fYTjInb7r0UNTXAZRlhFnLzbX85YXellvlAZUvKfZ3QfCqfMuEWUgW61jjvi6FeSpFTzgjF9yNJ62hR7i6ItoyfsDy4ixGnW+if0vqJHC7YdxRvVoSVqCqc22bDxN8KBwMOhGwZQUMOLlX8dqjcvNH+5FIxr3sNAYMJsVRb0ZPNvqkR4HiooL95yeydkUnYccH1QkHujw75LZ8N0rdgCwZSOI6bYfCieMIQeiSqXsHL66iZOWToE9E5rb5D70Srlv9mU4+5aSHCdcb7z6Rn5+KHUGUZQCcGxsofkQjU1ovEreYlqsJ1uED46bMUPLe//S+Gdc+DuWYJ9p2yDwMH+s11HgtfOj4Pf4rgBPTdeA05iIvdPIOjtw5ZaPPpaQkla/ipxKWyEnViUdEO3PmpfSYsWrLrWPywTAg9Za6Ir62eNLdQTRlORIGSsM8EKSggJCFCjoTJX6txJi8NvAPkvakPj6z8wrLLUFW7D6TeZClB+0jTYgSDIeHwQBVKc3RF3Xal3KL/BcOIDoRpocGc5abTiGdWFXQXnSn5atNJUuAxMWVkDh0qsYPz8Q7No+hywGyWQYb9A0i6awUJKpPu9yzv2Xbsbyy0d0hZsyZER8XLFjlVowXhSoWSxho0pebIwQSygT7sLuxS/SvBIqyBdf2Gns9zpzqc+K/2Q==
X-Forefront-Antispam-Report:
	CIP:149.199.80.198;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:xir-pvapexch01.xlnx.xilinx.com;PTR:unknown-80-198.xilinx.com;CAT:NONE;SFS:(13230001)(4636009)(40470700004)(36840700001)(46966006)(31686004)(83380400001)(47076005)(36860700001)(53546011)(508600001)(186003)(426003)(2616005)(26005)(36756003)(336012)(40460700003)(4326008)(31696002)(82310400004)(9786002)(356005)(8676002)(2906002)(7636003)(70206006)(5660300002)(316002)(110136005)(70586007)(8936002)(54906003)(51383001)(50156003)(43740500002)(20210929001);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jan 2022 19:41:58.1282
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e935cd0c-25e4-4b55-e0fa-08d9e4f1be7f
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.80.198];Helo=[xir-pvapexch01.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1NAM02FT0059.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM8PR02MB7877

Hi Stefano/Julien,

On 29/01/2022 17:40, Julien Grall wrote:
> Hi Stefano,
>
> On 28/01/2022 20:23, Stefano Stabellini wrote:
>> On Fri, 28 Jan 2022, Julien Grall wrote:
>>> On 28/01/2022 01:20, Stefano Stabellini wrote:
>>>> On Thu, 27 Jan 2022, Julien Grall wrote:
>>>>> On Thu, 27 Jan 2022 at 23:05, Julien Grall 
>>>>> <julien.grall.oss@gmail.com>
>>>>> wrote:
>>>>>>
>>>>>> On Thu, 27 Jan 2022 at 22:40, Stefano Stabellini
>>>>>> <sstabellini@kernel.org> wrote:
>>>>>>> I am with you on both points.
>>>>>>>
>>>>>>> One thing I noticed is that the code today is not able to deal with
>>>>>>> IO_UNHANDLED for MMIO regions handled by IOREQ servers or Xen MMIO
>>>>>>> emulator handlers. p2m_resolve_translation_fault and 
>>>>>>> try_map_mmio are
>>>>>>> called after try_handle_mmio returns IO_UNHANDLED but 
>>>>>>> try_handle_mmio
>>>>>>> is
>>>>>>> not called a second time (or am I mistaken?)
>>>>>>
>>>>>> Why would you need it? If try_mmio_fault() doesn't work the first 
>>>>>> time,
>>>>>> then
>>>>>
>>>>> Sorry I meant try_handle_mmio().
>>>>>
>>>>>> it will not work the second it.
>>>>
>>>> I think I explained myself badly, I'll try again below.
>>>>
>>>>
>>>>>>> Another thing I noticed is that currently find_mmio_handler and
>>>>>>> try_fwd_ioserv expect dabt to be already populated and valid so it
>>>>>>> would
>>>>>>> be better if we could get there only when dabt.valid.
>>>>>>>
>>>>>>> With these two things in mind, I think maybe the best thing to 
>>>>>>> do is
>>>>>>> to
>>>>>>> change the code in do_trap_stage2_abort_guest slightly so that
>>>>>>> p2m_resolve_translation_fault and try_map_mmio are called first 
>>>>>>> when
>>>>>>> !dabt.valid.
>>>>>>
>>>>>> An abort will mostly likely happen because of emulated I/O. If we 
>>>>>> call
>>>>>> p2m_resolve_translation_fault() and try_map_mmio() first, then it 
>>>>>> means
>>>>>> the processing will take longer than necessary for the common case.
>>>>>>
>>>>>> So I think we want to keep the order as it is. I.e first trying 
>>>>>> the MMIO
>>>>>> and then falling back to the less likely reason for a trap.
>>>>
>>>> Yeah I thought about it as well. The idea would be that if 
>>>> dabt.valid is
>>>> set then we leave things as they are (we call try_handle_mmio 
>>>> first) but
>>>> if dabt.valid is not set (it is not valid) then we skip the
>>>> try_handle_mmio() call because it wouldn't succeed anyway and go
>>>> directly to p2m_resolve_translation_fault() and try_map_mmio().
>>>>
>>>> If either of them work (also reading what you wrote about it) then we
>>>> return immediately.
>>>
>>> Ok. So the assumption is data abort with invalid syndrome would 
>>> mostly likely
>>> be because of a fault handled by p2m_resolve_translation_fault().
>>>
>>> I think this makes sense. However, I am not convinced we can 
>>> currently safely
>>> call try_map_mmio() before try_handle_mmio(). This is because the 
>>> logic in
>>> try_map_mmio() is quite fragile and we may mistakenly map an 
>>> emulated region.
>>>
>>> Similarly, we can't call try_map_mmio() before 
>>> p2m_resolve_translation_fault()
>>> because a transient fault may be
>>> misinterpreted.
>>>
>>> I think we may be able to harden try_map_mmio() by checking if the 
>>> I/O region
>>> is emulated. But this will need to be fully thought through first.
>>
>> That's a good point. I wonder if it could be as simple as making sure
>> that iomem_access_permitted returns false for all emulated regions?
>
> I have replied to that in the other thread. The short answer is no and...
>
>> Looking at the code, it looks like it is already the case today. Is that
>> right?
>
> not 100%. The thing is iomem_access_permitted() is telling you which 
> *host* physical address is accessible. Not which *guest* physical 
> address is emulated.
>
> We could possibly take some short cut at the risk of bitting back in 
> the future if we end up to emulate non-existing region in the host 
> physical address.

I have sent out a "[XEN v5] xen/arm64: io: Decode ldr/str post-indexing 
instructions" addressing some of the comments based on the discussion. 
As for this patch, we agreed that this is incorrect. Thus, there will be 
no v2 patch for this.

- Ayan

>
> Cheers,
>

