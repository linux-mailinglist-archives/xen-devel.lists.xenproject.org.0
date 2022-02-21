Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 039644BEA50
	for <lists+xen-devel@lfdr.de>; Mon, 21 Feb 2022 20:06:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.276412.472562 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nME0Z-0006Qk-HM; Mon, 21 Feb 2022 19:06:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 276412.472562; Mon, 21 Feb 2022 19:06:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nME0Z-0006Ou-EA; Mon, 21 Feb 2022 19:06:03 +0000
Received: by outflank-mailman (input) for mailman id 276412;
 Mon, 21 Feb 2022 19:06:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Nr+1=TE=xilinx.com=ayankuma@srs-se1.protection.inumbo.net>)
 id 1nME0Y-0006OT-Ga
 for xen-devel@lists.xenproject.org; Mon, 21 Feb 2022 19:06:02 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2062b.outbound.protection.outlook.com
 [2a01:111:f400:7eaa::62b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4d7c8786-9349-11ec-8eb8-a37418f5ba1a;
 Mon, 21 Feb 2022 20:05:59 +0100 (CET)
Received: from BN0PR04CA0022.namprd04.prod.outlook.com (2603:10b6:408:ee::27)
 by SJ0PR02MB8861.namprd02.prod.outlook.com (2603:10b6:a03:3f4::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4995.22; Mon, 21 Feb
 2022 19:05:55 +0000
Received: from BN1NAM02FT055.eop-nam02.prod.protection.outlook.com
 (2603:10b6:408:ee:cafe::1e) by BN0PR04CA0022.outlook.office365.com
 (2603:10b6:408:ee::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4995.15 via Frontend
 Transport; Mon, 21 Feb 2022 19:05:54 +0000
Received: from xir-pvapexch01.xlnx.xilinx.com (149.199.80.198) by
 BN1NAM02FT055.mail.protection.outlook.com (10.13.2.163) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4995.19 via Frontend Transport; Mon, 21 Feb 2022 19:05:54 +0000
Received: from xir-pvapexch01.xlnx.xilinx.com (172.21.17.15) by
 xir-pvapexch01.xlnx.xilinx.com (172.21.17.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Mon, 21 Feb 2022 19:05:53 +0000
Received: from smtp.xilinx.com (172.21.105.197) by
 xir-pvapexch01.xlnx.xilinx.com (172.21.17.15) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Mon, 21 Feb 2022 19:05:53 +0000
Received: from [10.71.117.205] (port=35928)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <ayan.kumar.halder@xilinx.com>)
 id 1nME0O-00083B-MV; Mon, 21 Feb 2022 19:05:52 +0000
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
X-Inumbo-ID: 4d7c8786-9349-11ec-8eb8-a37418f5ba1a
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aDIl7LbZz2n8JKwKRBuGQrj+n/bQxk2CBgq4dqTYoGnMBTHLA2LG5pwS6Q6AtEI5CSNuUnhBilrlesSNiVl4fa8H1SLb1ngYcnYH64PlVvYBqBV1i0kOjCaKFxzcYmLKS241kVTg1yB8bW9DC+MMo4ExIssPxJAA7rLWzezpvS50nimOSCs07ZaCpEw8onKlWaY+SRj4Qf93X+e0InIq2RBQcMnq4neRVVW3vSToCwG7GzVrsyqJMmQ8uaXCCq0zxMl5tWleIZeIyvl3E+V2AWP0EFdMQWIyzUAtBWCSZpPmGlq+qBdsByUJAqCvLSVvyYRdG4kfS3keTKmHObBapw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dGyQF80MFo4yZeo3vn42A1fN0nvkrzuMSCcOpoDcoEc=;
 b=MX3PTkKjXdbejTPEp2ssAW05sXbbk74Pcl3pkiWZtg/k/tlMMUv0V9bgmCeLRsgzTIWXdQav/TB2zYRxVpancZvdZo6GObPHjVAjHoXMSloeEAtIcLSzqypEbKzzyfwD54byjuIvoQpCsqLmdxe399d9qhZcN4DXzSCU1qN5FL79OZGjNyCZXMI+1NNlNd87dUCDe6dwqCYqSNyCIPyG4LF+oQ7fDdT7tUBxeWnggpNIK8sHaTi6QZoM90N0Hx3cRdU/xMGyGjeIalpcqlH2j+3ltKUpzu08nJNTiA+Yxmjk1lxOBpohMGivCcxYw8JbDIYMlZcmt0wyDBsz7IYC0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.80.198) smtp.rcpttodomain=xen.org smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dGyQF80MFo4yZeo3vn42A1fN0nvkrzuMSCcOpoDcoEc=;
 b=eJFTzayATDb9EdDHq1CIoj06M8Q3Kjf8uonhr0PVPUTUl9SQscQ4zeloGSSVa7Sj6ASCNOPB8V7C15WixKVEP/OPG0jr37aqU5UF3syVhvtiLmvVHmktVOl2VdeSOFvI78u0INnkyO5MHoC1gG2Kt6B9SojYng48ei3lQjzjCfs=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.80.198)
 smtp.mailfrom=xilinx.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.80.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.80.198; helo=xir-pvapexch01.xlnx.xilinx.com;
Message-ID: <e53b1407-4701-f0f1-5f49-5bd8cbb6eb41@xilinx.com>
Date: Mon, 21 Feb 2022 19:05:52 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.6.0
Subject: Re: [XEN v8 2/2] xen/arm64: io: Support instructions (for which ISS
 is not valid) on emulated MMIO region using MMIO/ioreq handler
To: Julien Grall <julien@xen.org>, Ayan Kumar Halder
	<ayan.kumar.halder@xilinx.com>, <xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>, <stefanos@xilinx.com>,
	<Volodymyr_Babchuk@epam.com>, <bertrand.marquis@arm.com>
References: <20220212233433.46018-1-ayankuma@xilinx.com>
 <20220212233433.46018-3-ayankuma@xilinx.com>
 <1599e2f3-0a34-020a-dd42-5ba87dad555d@xen.org>
 <10cf253b-fc58-1afc-66ec-33ac3008bb0f@xilinx.com>
 <576cf522-f002-afac-36b6-b31f87724dca@xen.org>
From: Ayan Kumar Halder <ayan.kumar.halder@xilinx.com>
In-Reply-To: <576cf522-f002-afac-36b6-b31f87724dca@xen.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ceba1dc2-d479-47a3-f2ea-08d9f56d2f56
X-MS-TrafficTypeDiagnostic: SJ0PR02MB8861:EE_
X-Microsoft-Antispam-PRVS:
	<SJ0PR02MB8861FA782B0C303F543FBA02B23A9@SJ0PR02MB8861.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	O43l7YTHznrcXF5SLgg17lgq/676NwjuQJcIk0iSXU/v1hzLLZT/8aRU2r02bW76HHeQpIFlHSLhjIFFOUeM19qLHR/gdwby7n1yqmX6pzsaoL+LQxRavZ0BaB5DodmBDRa8mhGZA86oEmxe8V2JSyHTxM2G1nz1XXCrmkt+L5hkRhGVhWaUt4LjXEWj9nS9KQA8IDdIoCKH4+GQxXPYMdBmxR9jqQo8U5IkczePSku8KeNr13YIcco1JY0wUwmVDZrKc/mOmRP2cTfRzCnDPGtPgoi2cu9xhUjNW4Il6MJIu4Bz2qix9uGxh4aYJd3++kl4FtlLquc25T6rp4GnV/g+VPcdQrrjRiTlRLeB8c2rhwb6yEDEUdw0VGMx/barcpFg8YgjtA9ZYIv53iIaMiuRMYVW4OjAiLs7v2B3zDh6zE9OxPd54537yNv0OTTQGnGSf3X57DlZbCXc1JNcAX/Si296VUo2cI96TRyWSvCabCxAmKu6aLSb2qdtiph+xTEgkS/+DL+GbBwxePi8TUaTVsdmk+qUpDjP/4y5nyBODiQNhznC7Yd3eJixGkPXa3kLFe3qCHPTvWEYLR7XVRTb4udbQ9WlpEquyVh69aZXPRFEgiVzdktT2+tojeYylHOyNwFyF+LIiYR2WNXsQv7NEBXrsKUGUqJ+FnZ940j6REYnAxxxUBir2HpMoeLq9sTVDdkxmJaQaY3Fo48VThU1Cx21rsJ3z6qH0kBJa8NLRPIKcvREIE3pZKPXeiJNWfpNsHNxezb1BRJcpLGdPxIBqi4Sgyq4jzqcTjaGTlU=
X-Forefront-Antispam-Report:
	CIP:149.199.80.198;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:xir-pvapexch01.xlnx.xilinx.com;PTR:unknown-80-198.xilinx.com;CAT:NONE;SFS:(13230001)(4636009)(36840700001)(40470700004)(46966006)(9786002)(5660300002)(2906002)(356005)(36756003)(70586007)(508600001)(31686004)(7636003)(83380400001)(8936002)(2616005)(426003)(40460700003)(316002)(54906003)(110136005)(47076005)(53546011)(31696002)(336012)(186003)(26005)(82310400004)(8676002)(4326008)(36860700001)(70206006)(50156003)(43740500002)(473944003)(414714003);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Feb 2022 19:05:54.2385
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ceba1dc2-d479-47a3-f2ea-08d9f56d2f56
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.80.198];Helo=[xir-pvapexch01.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1NAM02FT055.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR02MB8861


On 21/02/2022 17:57, Julien Grall wrote:
>
>
> On 21/02/2022 17:05, Ayan Kumar Halder wrote:
>> Hi Julien,
>
> Hi,
Hi Julien,
>
>> On 13/02/2022 12:19, Julien Grall wrote:
>>>>   }
>>>>     void register_mmio_handler(struct domain *d,
>>>> diff --git a/xen/arch/arm/ioreq.c b/xen/arch/arm/ioreq.c
>>>> index 308650b400..3c0a935ccf 100644
>>>> --- a/xen/arch/arm/ioreq.c
>>>> +++ b/xen/arch/arm/ioreq.c
>>>> @@ -47,6 +47,7 @@ enum io_state try_fwd_ioserv(struct cpu_user_regs 
>>>> *regs,
>>>>                                struct vcpu *v, mmio_info_t *info)
>>>>   {
>>>>       struct vcpu_io *vio = &v->io;
>>>> +    struct dabt_instr instr = info->dabt_instr;
>>>>       ioreq_t p = {
>>>>           .type = IOREQ_TYPE_COPY,
>>>>           .addr = info->gpa,
>>>> @@ -76,10 +77,8 @@ enum io_state try_fwd_ioserv(struct 
>>>> cpu_user_regs *regs,
>>>>       if ( !s )
>>>>           return IO_UNHANDLED;
>>>>   -    if ( !info->dabt.valid )
>>>> -        return IO_ABORT;
>>>> -
>>>
>>> For this one, I would switch to ASSERT(dabt.valid);
>> I see that try_fwd_ioserv() is invoked from try_handle_mmio() only. 
>> Thus, if I follow your suggestion of adding a check for dabt.valid at 
>> the beginning of try_handle_mmio(), then this ASSERT() is not required.
>
> I agree that try_handle_mmio() is the only caller today. But we don't 
> know how this is going to be used tomorrow.
>
> The goal of this ASSERT() is to catch those new users that would call 
> it wrongly.
>
> [...]
>
>>> ... this will inject a data abort to the guest when we can't decode. 
>>> This is not what we want. We should check whether this is a P2M 
>>> translation fault or we need to map an MMIO region.
>>>
>>> In pseudo-code, this would look like:
>>>
>>> if ( !is_data || hsr.dabt.valid )
>>
>> I think you mean if ( !is_data || !hsr.dabt.valid )
>
> You are right.
>
>>
>> The reason being if there is an instruction abort or a data abort 
>> (with ISV == 0), then it should try to configure the page tables.
>>
>>> {
>>>     if ( check_p2m() )
>>>       return;
>>>
>>>
>>>     if ( !is_data )
>>>        goto inject_dabt;
>>>
>>>     decode_instruction();
>>>     if ( !dabt.invalid )
>>>       goto inject_dabt;
>>> }
>>>
>>> try_handle_mmio();
>>>
>>> if ( instruction was not decoded )
>>>   check_p2m();
>>
>> If the instruction was not decoded, then there is no need to 
>> configure the page tables again. We have already done this before.
>
> Hmmmm... I think there are confusing about which sort of decoding I 
> was referring to. In this case, I mean if we didn't decode the 
> instruction manully, then it is not necessary to call check_p2m().
>
> Do you agree with that?

If we (ie Xen) didn't decode the instruction manually, then check_p2m() 
has not been invoked yet.  This is because of the following 
(info.dabt.valid == True) :-

         if ( !is_data || !info.dabt.valid )
         {

                 ...

                 if ( check_p2m(is_data, gpa) )
                     return;

                 ...

         }

So, in this scenario ( !info.dabt.valid), it would not be necessary to 
invoke check_p2m() after try_handle_mmio().

However, if we havenot decoded the instruction manually (ie 
info.dabt.valid == True), and try_handle_mmio() returns IO_UNHANDLED, 
then it will be necessary to invoke "check_p2m(is_data, gpa)"

- Ayan

>
>> So my understanding is as follows :-
>>
>>          /* Check that it is instruction abort or ISS is invalid. */
>
> I have had a remark on this line before. Please have a look and 
> address it.
>
>>          if ( !is_data || !info.dabt.valid )
>>          {
>>              /*
>>               * If the instruction was trapped due to access to stage 
>> 1 translation
>>               * then Xen should try to resolve the page table entry 
>> for the stage 1
>>               * translation table with the assumption that the page 
>> tables are
>>               * present in the non MMIO region. If it is successful, 
>> then it should
>>               * ask the guest to retry the instruction.
>>               */
>
> I agree that we want to skip the MMIO mapping when s1ptw == 1. 
> However, I am not sure this belongs to this patch because this is 
> technically already a bug.
>
>>              if ( is_data && info.dabt.s1ptw )
>>              {
>>                  info.dabt_instr.state = INSTR_RETRY;
>>                  /* The translation tables are assumed to be in non 
>> MMIO region. */
>>                  is_data = false;
>
> is_data is also used to decide which sort of abort we want to send to 
> the guest (see after inject_dabt). So I don't think we could force set 
> is_data here.
>
> Instead, I would define a new local variable (maybe 
> mmio_access_allowed) that will be set for instruction abort or when 
> s1ptw is 1.
>
>>              }
>>
>>              /*
>>               * Assumption :- Most of the times when we get a 
>> translation fault
>>               * and the ISS is invalid, the underlying cause is that 
>> the page
>>               * tables have not been set up correctly.
>>               */
>
> I think this comment make more sense on top of "if !is_data || 
> !info.dabt.valid".
>
>>              if ( check_p2m(is_data, gpa) )
>>                  return;
>>
>>              /*
>>               * If the instruction abort or the data abort due to 
>> access to stage 1
>>               * translation tables could not be resolved by setting 
>> the appropriate
>>               * bits in the translation table, then Xen should abort 
>> the guest.
>
> IHMO, "abort the guest" means we are going to crash the guest. 
> However, this not the case here. We are telling the guest that we 
> couldn't handle the data/instruction request. It is up to the guest to 
> decide whether it should panic or handle gracefully the error.
>
> We should also avoid the term guest because it usually only refers to 
> any domain but dom0.
>
> Therefore, I would reword it to something like "Xen will forward the 
> data/instruction abort to the domain".
>
>>               */
>>              if ( !is_data || (info.dabt_instr.state == INSTR_RETRY) )
>
> The second part looks unnecessary.
>
>>                  goto inject_abt;
>>
>>              try_decode_instruction(regs, &info);
>>
>>              /* Instruction could not be decoded, then abort the 
>> guest */
>>
>>              if ( info.dabt_instr.state == INSTR_ERROR)
>>                  goto inject_abt;
>>          }
>>
>>          state = try_handle_mmio(regs, &info);
>>
>>          switch ( state )
>>          {
>>              case IO_ABORT:
>>                  goto inject_abt;
>>              case IO_HANDLED:
>>                  /*
>>                   * If the instruction was decoded and has executed 
>> successfully
>>                   * on the MMIO region, then Xen should execute the 
>> next part of
>>                   * the instruction. (for eg increment the rn if it is a
>>                   * post-indexing instruction.
>>                   */
>>                  post_increment_register(&info.dabt_instr);
>>                  advance_pc(regs, hsr);
>>                  return;
>>              case IO_RETRY:
>>                  /* finish later */
>>                  return;
>>              case IO_UNHANDLED:
>>                  /* IO unhandled, try another way to handle it. */
>>                  break;
>>          }
>>
>>          if ( check_p2m(is_data, gpa) )
>
> It is unnecessary to call check_p2M() if we manually decoded the 
> instruction (see above why).
>
> Cheers,
>

