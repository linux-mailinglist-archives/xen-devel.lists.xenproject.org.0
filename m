Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6753F4BEC41
	for <lists+xen-devel@lfdr.de>; Mon, 21 Feb 2022 22:12:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.276441.472619 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nMFxg-000366-4d; Mon, 21 Feb 2022 21:11:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 276441.472619; Mon, 21 Feb 2022 21:11:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nMFxg-000332-0S; Mon, 21 Feb 2022 21:11:12 +0000
Received: by outflank-mailman (input) for mailman id 276441;
 Mon, 21 Feb 2022 21:11:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Nr+1=TE=xilinx.com=ayankuma@srs-se1.protection.inumbo.net>)
 id 1nMFxe-00032w-BT
 for xen-devel@lists.xenproject.org; Mon, 21 Feb 2022 21:11:10 +0000
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2061a.outbound.protection.outlook.com
 [2a01:111:f400:fe5a::61a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c84c8e6b-935a-11ec-8eb8-a37418f5ba1a;
 Mon, 21 Feb 2022 22:11:07 +0100 (CET)
Received: from SN4PR0401CA0041.namprd04.prod.outlook.com
 (2603:10b6:803:2a::27) by BYAPR02MB5112.namprd02.prod.outlook.com
 (2603:10b6:a03:70::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4995.16; Mon, 21 Feb
 2022 21:11:02 +0000
Received: from SN1NAM02FT0037.eop-nam02.prod.protection.outlook.com
 (2603:10b6:803:2a:cafe::a2) by SN4PR0401CA0041.outlook.office365.com
 (2603:10b6:803:2a::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4995.14 via Frontend
 Transport; Mon, 21 Feb 2022 21:11:02 +0000
Received: from xir-pvapexch02.xlnx.xilinx.com (149.199.80.198) by
 SN1NAM02FT0037.mail.protection.outlook.com (10.97.4.243) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4975.11 via Frontend Transport; Mon, 21 Feb 2022 21:11:01 +0000
Received: from xir-pvapexch02.xlnx.xilinx.com (172.21.17.17) by
 xir-pvapexch02.xlnx.xilinx.com (172.21.17.17) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Mon, 21 Feb 2022 21:11:00 +0000
Received: from smtp.xilinx.com (172.21.105.197) by
 xir-pvapexch02.xlnx.xilinx.com (172.21.17.17) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Mon, 21 Feb 2022 21:11:00 +0000
Received: from [10.71.117.142] (port=64147)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <ayan.kumar.halder@xilinx.com>)
 id 1nMFxT-0005TE-A9; Mon, 21 Feb 2022 21:10:59 +0000
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
X-Inumbo-ID: c84c8e6b-935a-11ec-8eb8-a37418f5ba1a
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DJLpS6Yp5u5MhjWcSevWaMXOO8CU4DWH2VrnvGcs3XjPfhcBNmCRNIToFS5tLTiFr4w1+NIumVM0L4RWzecMThhQaUvyAai3TD2hdQFa56TA+LO8odMR6BZ0quKYGsDvIIo5ETR8RdVugA8ONkgFqHxbWL2GSNpgr/BzThH62IHIp1wjPtLlMD9Y7akkpB7D7reP2Sd9y2dc8QFa2n6oatWXhZETA0CmdmzafyKBuefVeQiVRMr76XTP7W9+ydOYL2d+eLb1QsstYb03oNF1Jh91bB8MkOnsPuYGSb5J2uynyEkU7DszZZ/AyVLsDr8c1fL8lbVURbcU8QII4c68VA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gyMlo1JhMjgqSNxGOR52Qwwlj25T+FEOQ6sZi1F/wSE=;
 b=NLpEnWzAy3OW8NCu9WgDV/RAIjIP+VRWjQr7O3PkVOJjxkLrRvN2cZ6FZNaDbbC7mxmPW0qqZMQhmdUe5b8i/MqulCQ12+x0lKcZzku1+54i4TlbF0YT88H1+VvCIPKkbMhr4YIDLT0mMJO5PgIiejmvFpZTPIH/fNzlZAdoIgiLN+/hniQ71cXupmXHmmKpaUkW7TFdofXukKikNFGOKY4WDoR93RF4vK4m84ut6YDjJVsnQur5eFXkyLDX/jsQ1X6x3hnWulgccHorcWseuTdTU5gjj2XIMwfpKdH3FKyewc/upqLrVGgsCRcW9kUrVZIFsXT0CACZmSM8e9bDng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.80.198) smtp.rcpttodomain=xen.org smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gyMlo1JhMjgqSNxGOR52Qwwlj25T+FEOQ6sZi1F/wSE=;
 b=nPgLDwU+SemsM6U1IXwQRw4Oiee8fdQn/LmZG0oe1Wen/MAP4EXVouffGtw86+B4c96YC1ZfEa+QGzGU2sphzEozaiVVLN8DyL4f9zAVxQxIX32XDgbDrDEXYlWHs7NNWWImcpzLtwBAj1M9ecw+Zae7CRK3/GCeolV227yo0wk=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.80.198)
 smtp.mailfrom=xilinx.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.80.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.80.198; helo=xir-pvapexch02.xlnx.xilinx.com;
Message-ID: <8c45a34c-9e54-1a9b-d894-f05f41412657@xilinx.com>
Date: Mon, 21 Feb 2022 21:10:58 +0000
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
 <e53b1407-4701-f0f1-5f49-5bd8cbb6eb41@xilinx.com>
 <96610d30-0de2-96e9-e838-504acf83a8d8@xen.org>
From: Ayan Kumar Halder <ayan.kumar.halder@xilinx.com>
In-Reply-To: <96610d30-0de2-96e9-e838-504acf83a8d8@xen.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ff5120ef-308e-4d00-05e3-08d9f57eaa09
X-MS-TrafficTypeDiagnostic: BYAPR02MB5112:EE_
X-Microsoft-Antispam-PRVS:
	<BYAPR02MB51127F6EB407DA225690C4F8B23A9@BYAPR02MB5112.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	lHYS7x1RqKOEA8TUYnJdydqWNrp9DGLHoxOIj2qkNeXC4HQt4L2rZh1TTycGeYaSsj8xyzcTt3T/FG+31o7oH4HsZ8MprEZSwQUxBBh4w5tgKMkAT/Pw3NsneoJvnpiQpRHPGbCyaEgRNzpn1zydpg3hw8tXMpxJN2O/4CVdfhR/VKdGVkU5mfxcYHsobJY50W2e+NNHDETwovdsho9TExgm534AF/iS6tJKp7hU9aG05/7GwFxueCGFN9oAEODFVOESYKUdvIsgScgnurbRgV2Xo0WQ937UkA+H3sbN/n5q41+P/LCFq4zUxtLXnEm70nSsZ4XNRys6kReXnECkZAlalPVwGSyFw11s1y7UMrc6hQIP92+5kuHv8GgdlLCQLpzW0h15mZNabTkJ6O8AOeTSToRc/vOvnF3U1GG2C2JLBN6CLFe4FyFunRKEW6gS17B+SSr5yOsNE2w0D3y2GAaSyVDVJ6nCtrGHPSRkQ8hBoQxCURVfa02ep/sBTpARCrpcKGRdAv3dRy0jbSm5MVOb8NZT6j57FBys7cJETI9ZMWqDtky1ZfGOBlNm3BJBmlCWNBE5RlclwLG9iOFTsqst+aXIveBkcVcSiVU/6GMvdixHEEVgt+UBSlWsJKNBnQQO7dCnZBBoKRtn84cl/BFW+5Cv//T5JzCSg0eLhkNpcWueM4Z//pKPJ8dArxkodh0v68gD+7ur/BuM/p1OyQ==
X-Forefront-Antispam-Report:
	CIP:149.199.80.198;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:xir-pvapexch02.xlnx.xilinx.com;PTR:unknown-80-198.xilinx.com;CAT:NONE;SFS:(13230001)(4636009)(36840700001)(46966006)(31696002)(2906002)(356005)(26005)(186003)(31686004)(47076005)(54906003)(110136005)(9786002)(7636003)(8936002)(36756003)(82310400004)(316002)(36860700001)(508600001)(2616005)(5660300002)(53546011)(8676002)(426003)(4326008)(70206006)(70586007)(336012)(50156003)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Feb 2022 21:11:01.4226
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ff5120ef-308e-4d00-05e3-08d9f57eaa09
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.80.198];Helo=[xir-pvapexch02.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1NAM02FT0037.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR02MB5112

Hi Julien,

On 21/02/2022 19:13, Julien Grall wrote:
>
>
> On 21/02/2022 19:05, Ayan Kumar Halder wrote:
>> If we (ie Xen) didn't decode the instruction manually, then 
>> check_p2m() has not been invoked yet.  This is because of the 
>> following (info.dabt.valid == True) :-
>>
>>          if ( !is_data || !info.dabt.valid )
>>          {
>>
>>                  ...
>>
>>                  if ( check_p2m(is_data, gpa) )
>>                      return;
>>
>>                  ...
>>
>>          }
>>
>> So, in this scenario ( !info.dabt.valid), it would not be necessary 
>> to invoke check_p2m() after try_handle_mmio().
>>
>> However, if we havenot decoded the instruction manually (ie 
>> info.dabt.valid == True), and try_handle_mmio() returns IO_UNHANDLED, 
>> then it will be necessary to invoke "check_p2m(is_data, gpa)"
>
> Hmmm you are right. But this doesn't seem to match the code you wrote 
> below. What did I miss?

My code was not correct.  I have rectified it as below. Please let me 
know if it looks sane.

<snip>

     case FSC_FLT_TRANS:
     {
         info.gpa = gpa;
         info.dabt = hsr.dabt;

         /*
          * Assumption :- Most of the times when we get a data abort and 
the ISS
          * is invalid or an instruction abort, the underlying cause is 
that the
          * page tables have not been set up correctly.
          */
         if ( !is_data || !info.dabt.valid )
         {
             if ( check_p2m(is_data, gpa) )
                 return;

             /*
              * If the instruction abort could not be resolved by 
setting the
              * appropriate bits in the translation table, then Xen should
              * forward the abort to the guest.
              */
             if ( !is_data )
                 goto inject_abt;

             try_decode_instruction(regs, &info);

             /*
              * If Xen could not decode the instruction or encountered 
an error
              * while decoding, then it should forward the abort to the 
guest.
              */
             if ( info.dabt_instr.state == INSTR_ERROR )
                 goto inject_abt;
         }

         state = try_handle_mmio(regs, &info);

         switch ( state )
         {
             case IO_ABORT:
                 goto inject_abt;
             case IO_HANDLED:
                 /*
                  * If the instruction was decoded and has executed 
successfully
                  * on the MMIO region, then Xen should execute the next 
part of
                  * the instruction. (for eg increment the rn if it is a
                  * post-indexing instruction.
                  */
                 post_increment_register(&info.dabt_instr);
                 advance_pc(regs, hsr);
                 return;
             case IO_RETRY:
                 /* finish later */
                 return;
             case IO_UNHANDLED:
                 /* IO unhandled, try another way to handle it. */
                 break;
         }

         /*
          * If the instruction was valid but Xen could not emulate the 
instruction
          * then it should configure the page tables to set the correct 
page table
          * entry corresponding to the faulting address. If it was 
successful, it
          * should return to the guest to retry the instruction (hoping 
that the
          * instruction will not be trapped to Xen again).
          * However, if Xen was not successful in setting the page 
tables, then
          * it should forward the abort to the guest.
          */
         if ( info.dabt.valid && check_p2m(is_data, gpa) )
             return;

         break;
     }
     default:

<snip>

- Ayan

>
> Cheers,
>

