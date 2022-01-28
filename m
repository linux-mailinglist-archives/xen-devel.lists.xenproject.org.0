Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F218349F8F0
	for <lists+xen-devel@lfdr.de>; Fri, 28 Jan 2022 13:08:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.261979.453928 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nDQ33-0001cH-I1; Fri, 28 Jan 2022 12:08:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 261979.453928; Fri, 28 Jan 2022 12:08:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nDQ33-0001ZH-E3; Fri, 28 Jan 2022 12:08:13 +0000
Received: by outflank-mailman (input) for mailman id 261979;
 Fri, 28 Jan 2022 12:08:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DjlO=SM=xilinx.com=ayankuma@srs-se1.protection.inumbo.net>)
 id 1nDQ32-0001ZB-1I
 for xen-devel@lists.xenproject.org; Fri, 28 Jan 2022 12:08:12 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on20623.outbound.protection.outlook.com
 [2a01:111:f400:7e8a::623])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f4ee5e81-8032-11ec-8f75-fffcc8bd4f1a;
 Fri, 28 Jan 2022 13:08:10 +0100 (CET)
Received: from SN4PR0501CA0079.namprd05.prod.outlook.com
 (2603:10b6:803:22::17) by DM8PR02MB8101.namprd02.prod.outlook.com
 (2603:10b6:8:1a::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.10; Fri, 28 Jan
 2022 12:08:07 +0000
Received: from SN1NAM02FT0036.eop-nam02.prod.protection.outlook.com
 (2603:10b6:803:22:cafe::c5) by SN4PR0501CA0079.outlook.office365.com
 (2603:10b6:803:22::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.5 via Frontend
 Transport; Fri, 28 Jan 2022 12:08:06 +0000
Received: from xir-pvapexch02.xlnx.xilinx.com (149.199.80.198) by
 SN1NAM02FT0036.mail.protection.outlook.com (10.97.4.102) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4930.15 via Frontend Transport; Fri, 28 Jan 2022 12:08:05 +0000
Received: from xir-pvapexch01.xlnx.xilinx.com (172.21.17.15) by
 xir-pvapexch02.xlnx.xilinx.com (172.21.17.17) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Fri, 28 Jan 2022 12:08:04 +0000
Received: from smtp.xilinx.com (172.21.105.198) by
 xir-pvapexch01.xlnx.xilinx.com (172.21.17.15) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Fri, 28 Jan 2022 12:08:04 +0000
Received: from [10.71.117.48] (port=55667)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <ayan.kumar.halder@xilinx.com>)
 id 1nDQ2t-00066W-DT; Fri, 28 Jan 2022 12:08:03 +0000
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
X-Inumbo-ID: f4ee5e81-8032-11ec-8f75-fffcc8bd4f1a
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=V7Vsri6HGJ7zoW49qKCbfIK+5mFlJC5IRhD9NLPO0gPDB7TVtlHKSfQNCnWo4WWME6oo/SxysxAlrK+2YYK3/jSNQWuGAOsBpnquzctOnVBXYMrZq/toll2poDW3Ju1dbM/lCObldoALzGg/5liygkNm0b80A0n3Tznhtj8WLQggAOSZKWUbUtpXsKNmvtkjA9JPDAQ4VZXZ/FAEqhUPnvAxC1AGOZt0I3TTTU1uCkXyo4eXZsaG6/smVEGsqMhupWylBLwjllHVwWHR+NcmS8ksuDb5lYOLRFj+CcImDZZQ2n33HqIZjJPJLkkQipdGuB6XnmqUp4q24cVxmictRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dAgwEsqbYyqq5pjJ0fZSpOvLz5DniqCuJcX2G2jjbqM=;
 b=QO6vgh5kbZCkhlXF0prrLnk9dajKdAwBE4oJovUei3ZzZrN/hXOn6FHqsfkgwURaqSLNpxdLEogs3NXd2E4A6f4tqcTxNSVCIh7Lh4TGG01i2sN3x0BGoNmkHGbkwwhi5SBb8XftXrVaIkfd6uadgoW/d5wL0ajYF1PulHCDpwNM2QIKLYShaYmbm8a6DzyDl7yToq9zn+jw3HK/OhrIJrABC1vKRwVpp567IgfLkKpKEISHhOozwcGTu2AqS13UsC8YBPSKwjsmEFORCJ/xaeQjMqJL4WBnI1d6EUDwQsfBF7aXD60jplyo9JU/NzAcKcWvj1xNGtIw7a/FMONYKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.80.198) smtp.rcpttodomain=xen.org smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dAgwEsqbYyqq5pjJ0fZSpOvLz5DniqCuJcX2G2jjbqM=;
 b=YDp7WiO3fRGQUXCT6dUL9oztdyemzS82qXqa1yfkg4rsOgc2XUh2u/NA1lTqFxrSZ1y8WYdA+XKg6XOX7Qvw2dSvGsJpUeGhnNaRbjmGNeA1BXklLovwL7+YJaJ3TgztF+8VzoWfkaDSAOwu0cHWOjaZxly9GtkCqu0r5PySJt0=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.80.198)
 smtp.mailfrom=xilinx.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.80.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.80.198; helo=xir-pvapexch02.xlnx.xilinx.com;
Message-ID: <95944225-6642-b41c-c496-d735826e3c93@xilinx.com>
Date: Fri, 28 Jan 2022 12:08:02 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.5.1
Subject: Re: [XEN v1] xen/arm: io: Check ESR_EL2.ISV != 0 before searching for
 a MMIO handler
To: Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien.grall.oss@gmail.com>
CC: Ayan Kumar Halder <ayan.kumar.halder@xilinx.com>, xen-devel
	<xen-devel@lists.xenproject.org>, <stefanos@xilinx.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Bertrand Marquis <bertrand.marquis@arm.com>
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
From: Ayan Kumar Halder <ayan.kumar.halder@xilinx.com>
In-Reply-To: <9880cf7c-962f-8a32-483c-2bf5889d3273@xen.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 75ea433a-2744-4679-77c5-08d9e256d797
X-MS-TrafficTypeDiagnostic: DM8PR02MB8101:EE_
X-Microsoft-Antispam-PRVS:
	<DM8PR02MB81016DB02CF589E85168E793B2229@DM8PR02MB8101.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?K0hTcWVyV0dlK0xrS3cvSWhkd3NsNFQvazRBMk5kZ01janVCVURpMnUrcDYz?=
 =?utf-8?B?WTFnWVpUQWVKcVJ6U1Y1clI0VFVXSnBaanZQQTBlR3BDTlFQZEMzUWZVRmd3?=
 =?utf-8?B?ckljcGFySndjand4amVYbkxTOUJrZk9RRWhhTXZKT1l2Sjg0cStNaFhMMndE?=
 =?utf-8?B?eE5PS3VCWmJhaWlBQTAzM2djMURyRzhHOTdubzZQcTVjcUM0NFJkbnFTLy9M?=
 =?utf-8?B?UzFBNlV4V0RYUklxazg4S003OGwrUmJ5Z1k2SmdGalhNNkkyb2Mrak1PUVRk?=
 =?utf-8?B?dUszM3RVZ1QvM0k2Q1ZIcm53T3NzQ0tVa2xER2labHIvNUZPZVZ5M0IrOHd3?=
 =?utf-8?B?YmZlYTJxNUdZWDQ1RlBoQjNsOGJHaVdLaDFKU2k4ek1KLytxdE5udVV6L01F?=
 =?utf-8?B?MW82c3ZEVXliNDVMRk5yemJPb25HVG9YL0kwUG9ZL2gxVDh0ODR2V3ByRUc2?=
 =?utf-8?B?c1RlK2hRQ210Q0pac2Fhd2JFOUE4RFJZQjBJbzFNQ2ZCYnpPYkp6M29jaUE3?=
 =?utf-8?B?UkdFOWdEUEZEZWU0VDI4MmRveDJOT21iSXZHVlR1TGhod2IyOUJpUlZnWWh1?=
 =?utf-8?B?MXZvaERHOEtFRUsrOTFuTEltNlN0Vk5Pc2M3R2JZM3ZzTTMwNkJ1cWlBclVV?=
 =?utf-8?B?amJiZzhKMGtNdGNQcnI1UGh0bVIxbUdaZ28rdHdYQU9OVXdTOXVUc01oTnYr?=
 =?utf-8?B?S2FKWHc2Ni9DZVdGNGxoNmJoT2NaRGt6dXp2dzdaMG1sQzR6RkJzc0wzRmp2?=
 =?utf-8?B?QXBMVjlIR2ZGRWhDL0xlVFRzbm01OUVVUWcrelMvRlJPZjhFR0FOeW1Cb0tX?=
 =?utf-8?B?SFJNbEZVa1lwak9GbW0vSmpzVFhiVU9tSWh3QUJPMSs3RjVmZy9NYmFaOXQ3?=
 =?utf-8?B?V25Rdk9hbmlzSkVUdHNqMFpSNzRrczREaUx0MDVkT0FiMDZDcTJhREh1eU5n?=
 =?utf-8?B?clZEaDJRRlhrMzhHVG96T3MzdlkwMU5lUXNib20wK0lucGlNRVlSNWxZZ3hG?=
 =?utf-8?B?V0VsWC96WWkrNENCa3RrdWllMjM2LzZlM1BmVktPT0lMSUppaG9lTkhjUlhE?=
 =?utf-8?B?ZjFjQUdlYVQvRVVmSWFDR3BVanA1YWVmZUhsamtPd1BvZXl3YXk5UUoydkZD?=
 =?utf-8?B?eitHQysvVGIyMVVicU5NMVo2blliUTJFVnpZbi9NWjBxMGc5T2RUeEY0dkM3?=
 =?utf-8?B?bWdKWjFOUExsM24zeU9nMWxxVHJQWCs5Zm5odVM0Sy90TUgxMy8zMEhCbG01?=
 =?utf-8?B?aUlqeGphVGJ1anNSRjQ5SUJvQzNMVnR6VFZDLzN2QVlSOFdQUT09?=
X-Forefront-Antispam-Report:
	CIP:149.199.80.198;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:xir-pvapexch02.xlnx.xilinx.com;PTR:unknown-80-198.xilinx.com;CAT:NONE;SFS:(4636009)(46966006)(36840700001)(40470700004)(336012)(966005)(53546011)(110136005)(83380400001)(5660300002)(508600001)(31686004)(40460700003)(26005)(316002)(9786002)(70206006)(47076005)(356005)(186003)(36860700001)(8936002)(7636003)(54906003)(4326008)(82310400004)(8676002)(2906002)(426003)(2616005)(31696002)(70586007)(36756003)(50156003)(51383001)(43740500002)(473944003);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jan 2022 12:08:05.8916
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 75ea433a-2744-4679-77c5-08d9e256d797
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.80.198];Helo=[xir-pvapexch02.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1NAM02FT0036.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM8PR02MB8101

Hi Julien/Stefano,

Good discussion to learn about Xen (from a newbie's perspective). :)

I am trying to clarify my understanding. Some queries as below :-

On 28/01/2022 09:46, Julien Grall wrote:
>
>
> On 28/01/2022 01:20, Stefano Stabellini wrote:
>> On Thu, 27 Jan 2022, Julien Grall wrote:
>>> On Thu, 27 Jan 2022 at 23:05, Julien Grall 
>>> <julien.grall.oss@gmail.com> wrote:
>>>>
>>>> On Thu, 27 Jan 2022 at 22:40, Stefano Stabellini 
>>>> <sstabellini@kernel.org> wrote:
>>>>> I am with you on both points.
>>>>>
>>>>> One thing I noticed is that the code today is not able to deal with
>>>>> IO_UNHANDLED for MMIO regions handled by IOREQ servers or Xen MMIO
>>>>> emulator handlers. p2m_resolve_translation_fault and try_map_mmio are
>>>>> called after try_handle_mmio returns IO_UNHANDLED but 
>>>>> try_handle_mmio is
>>>>> not called a second time (or am I mistaken?)
>>>>
>>>> Why would you need it? If try_mmio_fault() doesn't work the first 
>>>> time, then
>>>
>>> Sorry I meant try_handle_mmio().
>>>
>>>> it will not work the second it.
>>
>> I think I explained myself badly, I'll try again below.
>>
>>
>>>>> Another thing I noticed is that currently find_mmio_handler and
>>>>> try_fwd_ioserv expect dabt to be already populated and valid so it 
>>>>> would
>>>>> be better if we could get there only when dabt.valid.
>>>>>
>>>>> With these two things in mind, I think maybe the best thing to do 
>>>>> is to
>>>>> change the code in do_trap_stage2_abort_guest slightly so that
>>>>> p2m_resolve_translation_fault and try_map_mmio are called first when
>>>>> !dabt.valid.
>>>>
>>>> An abort will mostly likely happen because of emulated I/O. If we call
>>>> p2m_resolve_translation_fault() and try_map_mmio() first, then it 
>>>> means
>>>> the processing will take longer than necessary for the common case.
>>>>
>>>> So I think we want to keep the order as it is. I.e first trying the 
>>>> MMIO
>>>> and then falling back to the less likely reason for a trap.
>>
>> Yeah I thought about it as well. The idea would be that if dabt.valid is
>> set then we leave things as they are (we call try_handle_mmio first) but
>> if dabt.valid is not set (it is not valid) then we skip the
>> try_handle_mmio() call because it wouldn't succeed anyway and go
>> directly to p2m_resolve_translation_fault() and try_map_mmio().
>>
>> If either of them work (also reading what you wrote about it) then we
>> return immediately.
>
> Ok. So the assumption is data abort with invalid syndrome would mostly 
> likely be because of a fault handled by p2m_resolve_translation_fault().
>
> I think this makes sense. However, I am not convinced we can currently 
> safely call try_map_mmio() before try_handle_mmio(). This is because 
> the logic in try_map_mmio() is quite fragile and we may mistakenly map 
> an emulated region.

By emulated region, you mean vgic.dbase (Refer 
https://xenbits.xen.org/gitweb/?p=xen.git;a=blob;f=xen/arch/arm/vgic-v2.c;h=589c033eda8f5e11af33c868eae2c159f985eac9;hb=0bdc43c8dec993258e930b34855853c22b917519#l702, 
which has not been mapped to the guest) and thus requires an MMIO handler.

Is my understanding correcr ?

If so, can Xen mantain a table of such emulated regions ? I am guessing 
that all emulated regions will have a mmio_handler. Then, before 
invoking try_map_mmio(), it can check the table.

>
> Similarly, we can't call try_map_mmio() before 
> p2m_resolve_translation_fault() because a transient fault may be
> misinterpreted.
>
> I think we may be able to harden try_map_mmio() by checking if the I/O 
> region is emulated. But this will need to be fully thought through first.
>
>>
>> If not, then we call decode_instruction from do_trap_stage2_abort_guest
>> and try again. The second time dabt.valid is set so we end up calling
>> try_handle_mmio() as usual.
>
> With the approach below, you will also end up to call 
> p2m_resolve_translation_fault() and try_map_mmio() a second time if 
> try_handle_mmio() fails.
>
>>
>> Just for clarity let me copy/paste the relevant code, apologies if it
>> was already obvious to you -- I got the impression my suggestion wasn't
>> very clear.
>>
>>
>>
>> +again:
>> +        if ( is_data && hsr.dabt.valid )
>>          {
>>              enum io_state state = try_handle_mmio(regs, hsr, gpa);
>>
>>              switch ( state )
>>              {
>>              case IO_ABORT:
>>                  goto inject_abt;
>>              case IO_HANDLED:
>>                  advance_pc(regs, hsr);
>>                  return;
>>              case IO_RETRY:
>>                  /* finish later */
>>                  return;
>>              case IO_UNHANDLED:
>>                  /* IO unhandled, try another way to handle it. */
>>                  break;
>>              }
>>          }
>>
>>          /*
>>           * First check if the translation fault can be resolved by the
>>           * P2M subsystem. If that's the case nothing else to do.
>>           */
>>          if ( p2m_resolve_translation_fault(current->domain,
>>                                             gaddr_to_gfn(gpa)) )
>>              return;
>>
>>          if ( is_data && try_map_mmio(gaddr_to_gfn(gpa)) )
>>              return;
>>
>> +        if ( !hsr.dabt.valid )
> One more thing I noticed, a stage 2 fault can also happen on an access 
> made for a stage 1 translation walk. In this case, I think we don't 
> want to decode the instruction.
>
> So this would need to be !hsr.dabt.valid && !hsr.dabt.s1ptw. Depending 
> on which patch we go with, this would also need to be adjusted in the 
> other one as well.

This triggered me to check for the remaining bits as well. Refer DDI 
0487G.b Armv8 Arm, "ISS encoding for an exception from a Data Abort", 
Page D13-3219

I guess we need to check the following :-

1. !hsr.dabt.valid

2. !hsr.dabt.s1ptw - Abort may be due to stage 1 translation table walk

3. !hsr.dabt.cache - Abort is due to cache maintenance or address 
translation instructions. We do not decode these instructions.

4. !hsr.dabt.eat - Abort is external


There is no need to check the following due to the reasons mentioned :-

1. hsr.dabt.dfsc - no need as we have already determined that it is a 
translation fault from EL0/EL1.

2. hsr.dabt.write - no need as the fault can be caused due to both read 
or write

3. hsr.dabt.fnv - no use for this in instruction decoding

4. hsr.dabt.sbzp0 - Bits[12:11] - We know that DFSC cannot be 0b010000 
(FEAT_RAS), We may not check for FEAT_LS64 as from the instruction 
opcode, we can make out that it is not ST64BV, LD64B, ST64B or ST64BV0

                          Bit[13] - VCNR - The instruction opcode will 
tell us that it is not MRS/MSR instruction.

Please let me know if my understanding is correct. I can send out a v5 
patch "Re: [XEN v4] xen/arm64: io: Decode ldr/str post-indexing 
instructions" will additional checks in place.

- Ayan

>
> Cheers,
>

