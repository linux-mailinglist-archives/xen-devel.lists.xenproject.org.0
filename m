Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 27AEC4A4FAD
	for <lists+xen-devel@lfdr.de>; Mon, 31 Jan 2022 20:48:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.263294.455972 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nEcen-0003zI-Ch; Mon, 31 Jan 2022 19:48:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 263294.455972; Mon, 31 Jan 2022 19:48:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nEcen-0003wb-8l; Mon, 31 Jan 2022 19:48:09 +0000
Received: by outflank-mailman (input) for mailman id 263294;
 Mon, 31 Jan 2022 19:48:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JbNP=SP=xilinx.com=ayankuma@srs-se1.protection.inumbo.net>)
 id 1nEcek-0003wV-Qv
 for xen-devel@lists.xenproject.org; Mon, 31 Jan 2022 19:48:06 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on20602.outbound.protection.outlook.com
 [2a01:111:f400:fe59::602])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b3cdc6d9-82ce-11ec-8eb8-a37418f5ba1a;
 Mon, 31 Jan 2022 20:48:04 +0100 (CET)
Received: from BN0PR04CA0130.namprd04.prod.outlook.com (2603:10b6:408:ed::15)
 by SN6PR02MB5342.namprd02.prod.outlook.com (2603:10b6:805:74::29)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.20; Mon, 31 Jan
 2022 19:48:01 +0000
Received: from BN1NAM02FT031.eop-nam02.prod.protection.outlook.com
 (2603:10b6:408:ed:cafe::8e) by BN0PR04CA0130.outlook.office365.com
 (2603:10b6:408:ed::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.15 via Frontend
 Transport; Mon, 31 Jan 2022 19:48:00 +0000
Received: from xir-pvapexch01.xlnx.xilinx.com (149.199.80.198) by
 BN1NAM02FT031.mail.protection.outlook.com (10.13.2.145) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4930.15 via Frontend Transport; Mon, 31 Jan 2022 19:48:00 +0000
Received: from xir-pvapexch02.xlnx.xilinx.com (172.21.17.17) by
 xir-pvapexch01.xlnx.xilinx.com (172.21.17.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Mon, 31 Jan 2022 19:47:59 +0000
Received: from smtp.xilinx.com (172.21.105.197) by
 xir-pvapexch02.xlnx.xilinx.com (172.21.17.17) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Mon, 31 Jan 2022 19:47:59 +0000
Received: from [10.71.117.31] (port=5781)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <ayan.kumar.halder@xilinx.com>)
 id 1nEced-00013E-7e; Mon, 31 Jan 2022 19:47:59 +0000
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
X-Inumbo-ID: b3cdc6d9-82ce-11ec-8eb8-a37418f5ba1a
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FRif7Na7knFnt6XcYgG/xjb/ZY4ZxSwO1Jgj4yjXvKDGXcauIMkQTlgFqvOrjw4pt9FVlJFj+CnxGNOksOgRyim4FMYXmdVqe/bu8uQ0gcLw8TkewOdMN8rGJ1J7TK3SNd8uArZlm2zcht4W++A0/lD89Rmt8YCnfqoIvkwSxiR4j0TBPAqVggY/FHgFdd3rRLljxD6fav21MTMx7p9g85FxLBuHbZmA27zWomRt9/wp4v5Jy/7sZZt1QI5hf4HWFYCHsuf6VY74vMvEaGYjsUwspJ0ZbMYhvrEAlUZqSOfe2+hx0zImhH2dA5/gHhh/bADg4sSYN1PJvegHx/NViQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hv4kbZUnvTijxqnxqkup37qDCFF0CRDMc0J8Iyd95Yc=;
 b=dPgV8zZHzcxBWeD8EkU2MI/fLR6NRMbxpozc1k5UxlMm+RRb6nh9Hkdq8dvGE5tPSDdugMEjOE4i5aELBzdiBAi6gFY9qNPa0Ek8eEnt+7rMTxKHDerHrYps89PPhZ9Ad22pGQFR1uFB5DCmtXfIAOe8VwIvLHcsQ54kr1WrdDZLp3ERfbiZ6ceycKaWmhd4l0VU+8NNpylerdknTWmABuoO3k0yo2Z17Jtuf6Fw+dPdF6rs3lWxq8l0xkpYP2cNHnqiX1sC5+gxCr139YwIIwAXSrrFOEz4akwOoiGNAoBLiUS6PUzaLZsvhR7Olrv1oWjjZ+s36hxOdeOglhk3Ww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.80.198) smtp.rcpttodomain=lists.xenproject.org
 smtp.mailfrom=xilinx.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=xilinx.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hv4kbZUnvTijxqnxqkup37qDCFF0CRDMc0J8Iyd95Yc=;
 b=llskcDKQ3KIMaj2jBEOANscJYg/lp82ap9e4xs4Ggrgeu4teSAp0RzVm6Mj9fNVT3xoMSgg/Y80K3o95SFl/7QBFJU5ItwBjIBU7PZyHiS88mxDEapC6crstKFlqBDbh2Czcg/ugHjVsd2190akVw/8v4AOlrdwe2w9mvOgpUnQ=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.80.198)
 smtp.mailfrom=xilinx.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.80.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.80.198; helo=xir-pvapexch01.xlnx.xilinx.com;
Message-ID: <ebc23e5f-c172-1276-fcef-9b9216b61922@xilinx.com>
Date: Mon, 31 Jan 2022 19:47:58 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.5.1
Subject: Re: [XEN v5] xen/arm64: io: Decode ldr/str post-indexing instructions
To: Ayan Kumar Halder <ayan.kumar.halder@xilinx.com>,
	<xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>, <stefanos@xilinx.com>, <julien@xen.org>,
	<Volodymyr_Babchuk@epam.com>, <bertrand.marquis@arm.com>
References: <20220131193728.2980-1-ayankuma@xilinx.com>
From: Ayan Kumar Halder <ayan.kumar.halder@xilinx.com>
In-Reply-To: <20220131193728.2980-1-ayankuma@xilinx.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3fcc6cf1-7226-4601-db86-08d9e4f29668
X-MS-TrafficTypeDiagnostic: SN6PR02MB5342:EE_
X-Microsoft-Antispam-PRVS:
	<SN6PR02MB534252B464E01DFF23F42ED0B2259@SN6PR02MB5342.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ZWHdvZpNMfYIHibBIpl1JUu7WfkxJCONN3VmqSPeICLg40F03bmRqng6NVBzpbYvJe/LqpAqx0ogj2A4N+mTGp+7RIMxeB/2h/+OV30eImr5tUW9wTlhcZw4eHuf+MaudIwABltN34nOG1W+DYk6tkOpekrP/msEE/mW8Lfj/Qbg52SINv+kbWy5w+H2xvTjLPl1jLuYtFM/wwU66S3mjtmhxHi3FwTFTCl337p2GlbaqntlHhA0Wv5R4t2/cID4yWqR6IJKtCRgAqSQdeK9mNprym+WTtItkVCb8ws5N2iUwP/nFjz07gQDgmGmaMzj3gPUL/v4Jv14eD/YTyOXBH4sIsI2R6xmX6x/2crc6RzW8RvH2Itic927OldXjXDBiMGVhKSXByNDH+AsXREN0juFZrDtyA8qOYQx2IDrilLOpUFMNM5kYzjVDhgmnm3EZiUV3X1Sj9beKVIiiuaRvz4plFP2nz4TLlzMAxIk3o6PV9QVZeuUlUNoUaU4k/dQ8hmDHuoGkkOCmtdHjPuaa/pjaDLl0+xcE6oRXkZW46Xp9zVOABA9imbkqIJUe9WvPNVV1MV98QwjR9eZvVyUUJxLW0sxFxVK1g8m4hswuVovV/TnAUQRDSyjjk5UD81oHDWND0q0jTibP58ZfgpDbIj60hL80tt6/dtt/4mdlM1v9g151Xvwv1o0aIigM2gATM4A9FeDmrRWjhbXd9rDJoTA4aH0+PJjnOL/syZkSls/zaEIuoxSO+z7tTx1L6s+gJ4VIV59oY3g1nxRiCECfxZwRqUNfUfTnJk6AndfrbWgL/DHMgnc1o+XiRtjx4O90RMNDoc/K6ju5vqtmhKZTVC/nnVcLfXjb6HLCdTdzpdduLJeffoO9U91pUoHbJCopnEaO/iuALpwrqwjDxJ8Rg==
X-Forefront-Antispam-Report:
	CIP:149.199.80.198;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:xir-pvapexch01.xlnx.xilinx.com;PTR:unknown-80-198.xilinx.com;CAT:NONE;SFS:(13230001)(4636009)(46966006)(36840700001)(40470700004)(83380400001)(31686004)(36860700001)(31696002)(70586007)(70206006)(47076005)(316002)(54906003)(110136005)(966005)(82310400004)(426003)(336012)(2616005)(5660300002)(9786002)(4326008)(8936002)(8676002)(30864003)(53546011)(36756003)(356005)(7636003)(186003)(26005)(2906002)(40460700003)(508600001)(50156003)(43740500002)(473944003)(20210929001);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jan 2022 19:48:00.4590
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3fcc6cf1-7226-4601-db86-08d9e4f29668
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.80.198];Helo=[xir-pvapexch01.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1NAM02FT031.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR02MB5342

Hi All,

On 31/01/2022 19:37, Ayan Kumar Halder wrote:
> At the moment, Xen is only handling data abort with valid syndrome (i.e.
> ISV=0). Unfortunately, this doesn't cover all the instructions a domain
> could use to access MMIO regions.
>
> For instance, a baremetal OS can use any of the following instructions, where
> x1 contains the address of the MMIO region:
>
> 1.      ldr     x2,    [x1],    #8
> 2.      ldr     w2,    [x1],    #-4
> 3.      ldr     x2,    [x1],    #-8
> 4.      ldr     w2,    [x1],    #4
> 5.      ldrh    w2,    [x1],    #2
> 6.      ldrb    w2,    [x1],    #1
> 7.      str     x2,    [x1],    #8
> 8.      str     w2,    [x1],    #-4
> 9.      strh    w2,    [x1],    #2
> 10.     strb    w2,    [x1],    #1
>
> In the following two instructions, Rn could theoretically be stack pointer which
> might contain the address of the MMIO region:-
> 11.     ldrb    w2,    [Rn],    #1
> 12.     ldrb    wzr,   [Rn],    #1
>
> In order to handle post-indexing store/load instructions (like those mentioned
> above), Xen will need to fetch and decode the instruction.
>
> Xen will not decode the instructions if the data abort is caused by stage1
> translation table walk or cache instructions. In the former scenario, it will
> try to update the page tables and in the latter scenario, it will ignore the
> instruction (ie simply increment the program counter).
>
> If Xen is unable to decode the instructions, it will abort the guest.
>
> This patch only cover post-index store/load instructions from AArch64 mode.
> For now, AArch32 mode is left unimplemented.
>
> Signed-off-by: Ayan Kumar Halder <ayankuma@xilinx.com>
> ---
>
> Changelog :-
> v2 - 1. Updated the rn register after reading from it. (Pointed by Julien,
>          Stefano)
>       2. Used a union to represent the instruction opcode (Suggestd by Bertrand)
>       3. Fixed coding style issues (Pointed by Julien)
>       4. In the previous patch, I was updating dabt->sign based on the signedness
>          of imm9. This was incorrect. As mentioned in ARMv8 ARM  DDI 0487G.b,
>          Page 3221, SSE indicates the signedness of the data item loaded. In our
>          case, the data item loaded is always unsigned.
>
> v3- 1. Handled all the variants of ldr/str (ie 64, 32, 16, 8 bit variants).
>         Thus, I have removed the check for "instr->code.opc == 0" (Suggested by
>         Andre)
>      2. Handled the scenario when rn = SP, rt = XZR (Suggested by Jan, Andre)
>      3. Added restriction for "rt != rn" (Suggested by Andre)
>      4. Moved union ldr_str_instr_class {} to decode.h. This is the header included
>         by io.c and decode.c (where the union is referred). (Suggested by Jan)
>      5. Indentation and typo fixes (Suggested by Jan)
>
> v4- 1. Fixed the patch as per Stefano's comments on v3. They are as follows :-
>          1.1 Use macros to determine the fixed values in the instruction opcode
>          1.2 Checked if instr != NULL
>          1.3 Changed some data types and added #define ARM_64 for AArch64 specific
>              code
>          1.4 Moved post_increment_register() to decode.c so that the decoding
>              logic is confined to a single file.
>          1.5 Moved some checks from post_increment_register() to
>              decode_loadstore_postindexing()
>          1.6 Removed a duplicate check
>      2. Updated the commit message as per Andre's comments.
>      3. Changed the names of a label and some comments. *32bit* was erroneously
>         mentioned in a label and comments in decode_loadstore_postindexing()
>         although the function handled all variants of ldr/str post indexing.
>
> v5- 1. Renamed decode_loadstore_postindexing() to decode_arm64(). The reason
>         being this will be extended in future to support more instructions for
>         which hsr_badt.isv = 0
>      2. Introduce a function try_decode_instruction_invalid_iss() to determine
>         if the instruction needs to be decoded before invoking decode_instruction().
>
>         It checks :-
>         2.1  dabt->s1ptw - Returns IO_UNHANDLED
>         2.2  dabt->cache - Returns IO_IGNORED. (new enum instroduced to let the
>              caller know that the instruction needs to be ignored by Xen. Thus
>              the caller needs to increment the PC and return to the guest.
>
>      3. Invoked try_decode_instruction_invalid_iss() from the following 2 places :-
>          3.a - try_handle_mmio() - When we have determined that there is a valid
>                mmio handler.
>          3.b - try_fwd_ioserv()
>          When ioserver completes the io request, the acknowledgement is sent via
>          handle_ioserv(). Here, we need to increment the register. As there is no
>          common data shared between try_fwd_ioserv() and handle_ioserv(), we need
>          to decode the instruction again in handle_ioserv() to determine rn, imm9.
>
>          (NOTE to Reviewers) - This does not feel correct. However, I could not
>          think of a better approach. Please provide your inputs.
>
>      4. Augumented struct hsr_dabt{} with struct hsr_dabt_instr_details{} to hold
>         rn and imm9. This is passed to post_increment_register() to update rn.
>      5. Other style changes as suggested in v4.
>
>   Patch has been based on the comments received on the following two patches:-
>   1. https://lists.xenproject.org/archives/html/xen-devel/2022-01/msg01245.html

Should be 
https://lists.xenproject.org/archives/html/xen-devel/2022-01/msg01193.html

- Ayan

>   2. https://lists.xenproject.org/archives/html/xen-devel/2022-01/msg01279.html
>
>   xen/arch/arm/arm32/traps.c  |  7 ++++
>   xen/arch/arm/arm64/traps.c  | 42 +++++++++++++++++++++
>   xen/arch/arm/decode.c       | 73 +++++++++++++++++++++++++++++++++++++
>   xen/arch/arm/decode.h       | 42 ++++++++++++++++++++-
>   xen/arch/arm/io.c           | 66 +++++++++++++++++++++++++++------
>   xen/arch/arm/ioreq.c        | 35 +++++++++++++++++-
>   xen/arch/arm/traps.c        |  1 +
>   xen/include/asm-arm/hsr.h   |  5 +++
>   xen/include/asm-arm/mmio.h  |  1 +
>   xen/include/asm-arm/traps.h |  1 +
>   10 files changed, 258 insertions(+), 15 deletions(-)
>
> diff --git a/xen/arch/arm/arm32/traps.c b/xen/arch/arm/arm32/traps.c
> index 9c9790a6d1..62a91e8728 100644
> --- a/xen/arch/arm/arm32/traps.c
> +++ b/xen/arch/arm/arm32/traps.c
> @@ -24,6 +24,8 @@
>   #include <asm/processor.h>
>   #include <asm/traps.h>
>   
> +struct hsr_dabt_instr_details;
> +
>   void do_trap_reset(struct cpu_user_regs *regs)
>   {
>       do_unexpected_trap("Reset", regs);
> @@ -82,6 +84,11 @@ void do_trap_data_abort(struct cpu_user_regs *regs)
>           do_unexpected_trap("Data Abort", regs);
>   }
>   
> +void post_increment_register(const struct hsr_dabt_instr_details *instr_details)
> +{
> +    ASSERT_UNREACHABLE();
> +}
> +
>   /*
>    * Local variables:
>    * mode: C
> diff --git a/xen/arch/arm/arm64/traps.c b/xen/arch/arm/arm64/traps.c
> index 9113a15c7a..482751496f 100644
> --- a/xen/arch/arm/arm64/traps.c
> +++ b/xen/arch/arm/arm64/traps.c
> @@ -18,9 +18,11 @@
>   
>   #include <xen/lib.h>
>   
> +#include <asm/current.h>
>   #include <asm/hsr.h>
>   #include <asm/system.h>
>   #include <asm/processor.h>
> +#include <asm/regs.h>
>   
>   #include <public/xen.h>
>   
> @@ -31,6 +33,8 @@ static const char *handler[]= {
>           "Error"
>   };
>   
> +struct hsr_dabt_instr_details;
> +
>   void do_bad_mode(struct cpu_user_regs *regs, int reason)
>   {
>       union hsr hsr = { .bits = regs->hsr };
> @@ -44,6 +48,44 @@ void do_bad_mode(struct cpu_user_regs *regs, int reason)
>       panic("bad mode\n");
>   }
>   
> +void post_increment_register(const struct hsr_dabt_instr_details *instr_details)
> +{
> +    struct cpu_user_regs *regs = guest_cpu_user_regs();
> +    register_t val;
> +
> +    /*
> +     * Handle when rn = SP
> +     * Refer ArmV8 ARM DDI 0487G.b, Page - D1-2463 "Stack pointer register selection"
> +     * t = SP_EL0
> +     * h = SP_ELx
> +     * and M[3:0] (Page - C5-474 "When exception taken from AArch64 state:")
> +     */
> +    if (instr_details->rn == 31 )
> +    {
> +        if ( (regs->cpsr & PSR_MODE_MASK) == PSR_MODE_EL1h )
> +            val = regs->sp_el1;
> +        else if ( ((regs->cpsr & PSR_MODE_MASK) == PSR_MODE_EL1t) ||
> +                    ((regs->cpsr & PSR_MODE_MASK) == PSR_MODE_EL0t) )
> +            val = regs->sp_el0;
> +        else
> +            ASSERT_UNREACHABLE();
> +    }
> +    else
> +        val = get_user_reg(regs, instr_details->rn);
> +
> +    val += instr_details->imm9;
> +
> +    if ( instr_details->rn == 31 )
> +    {
> +        if ( (regs->cpsr & PSR_MODE_MASK) == PSR_MODE_EL1h )
> +            regs->sp_el1 = val;
> +        else
> +            regs->sp_el0 = val;
> +    }
> +    else
> +        set_user_reg(regs, instr_details->rn, val);
> +}
> +
>   /*
>    * Local variables:
>    * mode: C
> diff --git a/xen/arch/arm/decode.c b/xen/arch/arm/decode.c
> index 792c2e92a7..63376adc7c 100644
> --- a/xen/arch/arm/decode.c
> +++ b/xen/arch/arm/decode.c
> @@ -84,6 +84,76 @@ bad_thumb2:
>       return 1;
>   }
>   
> +static int decode_arm64(register_t pc, struct hsr_dabt *dabt)
> +{
> +    union instr opcode = {0};
> +
> +    if ( raw_copy_from_guest(&opcode.value, (void * __user)pc, sizeof (opcode)) )
> +    {
> +        gprintk(XENLOG_ERR, "Could not copy the instruction from PC\n");
> +        goto bad_loadstore;
> +    }
> +
> +    /*
> +     * Refer Arm v8 ARM DDI 0487G.b, Page - C6-1107
> +     * "Shared decode for all encodings" (under ldr immediate)
> +     * If n == t && n != 31, then the return value is implementation defined
> +     * (can be WBSUPPRESS, UNKNOWN, UNDEFINED or NOP). Thus, we do not support
> +     * this. This holds true for ldrb/ldrh immediate as well.
> +     *
> +     * Also refer, Page - C6-1384, the above described behaviour is same for
> +     * str immediate. This holds true for strb/strh immediate as well
> +     */
> +    if ( (opcode.ldr_str.rn == opcode.ldr_str.rt) && (opcode.ldr_str.rn != 31) )
> +    {
> +        gprintk(XENLOG_ERR, "Rn should not be equal to Rt except for r31\n");
> +        goto bad_loadstore;
> +    }
> +
> +    /* First, let's check for the fixed values */
> +    if ( (opcode.value & POST_INDEX_FIXED_MASK) != POST_INDEX_FIXED_VALUE )
> +    {
> +        gprintk(XENLOG_ERR,
> +            "Decoding instruction 0x%x is not supported",opcode.value);
> +        goto bad_loadstore;
> +    }
> +
> +    if ( opcode.ldr_str.v != 0 )
> +    {
> +        gprintk(XENLOG_ERR,
> +            "ldr/str post indexing for vector types are not supported\n");
> +        goto bad_loadstore;
> +    }
> +
> +    /* Check for STR (immediate) */
> +    if ( opcode.ldr_str.opc == 0 )
> +        dabt->write = 1;
> +    /* Check for LDR (immediate) */
> +    else if ( opcode.ldr_str.opc == 1 )
> +        dabt->write = 0;
> +    else
> +    {
> +        gprintk(XENLOG_ERR,
> +            "Decoding ldr/str post indexing is not supported for this variant\n");
> +        goto bad_loadstore;
> +    }
> +
> +    gprintk(XENLOG_INFO,
> +        "opcode->ldr_str.rt = 0x%x, opcode->ldr_str.size = 0x%x, opcode->ldr_str.imm9 = %d\n",
> +        opcode.ldr_str.rt, opcode.ldr_str.size, opcode.ldr_str.imm9);
> +
> +    update_dabt(dabt, opcode.ldr_str.rt, opcode.ldr_str.size, false);
> +
> +    dabt->dabt_instr.rn = opcode.ldr_str.rn;
> +    dabt->dabt_instr.imm9 = opcode.ldr_str.imm9;
> +
> +    return 0;
> +
> + bad_loadstore:
> +    gprintk(XENLOG_ERR, "unhandled Arm instruction 0x%x\n", opcode.value);
> +    return 1;
> +}
> +
>   static int decode_thumb(register_t pc, struct hsr_dabt *dabt)
>   {
>       uint16_t instr;
> @@ -155,6 +225,9 @@ int decode_instruction(const struct cpu_user_regs *regs, struct hsr_dabt *dabt)
>       if ( is_32bit_domain(current->domain) && regs->cpsr & PSR_THUMB )
>           return decode_thumb(regs->pc, dabt);
>   
> +    if ( !psr_mode_is_32bit(regs) )
> +        return decode_arm64(regs->pc, dabt);
> +
>       /* TODO: Handle ARM instruction */
>       gprintk(XENLOG_ERR, "unhandled ARM instruction\n");
>   
> diff --git a/xen/arch/arm/decode.h b/xen/arch/arm/decode.h
> index 4613763bdb..7080da9ab6 100644
> --- a/xen/arch/arm/decode.h
> +++ b/xen/arch/arm/decode.h
> @@ -23,9 +23,47 @@
>   #include <asm/regs.h>
>   #include <asm/processor.h>
>   
> -/**
> +/*
> + * Refer to the ARMv8 ARM (DDI 0487G.b), Section C4.1.4 Loads and Stores
> + * Page 318 specifies the following bit pattern for
> + * "load/store register (immediate post-indexed)".
> + *
> + * 31 30 29  27 26 25  23   21 20              11   9         4       0
> + * ___________________________________________________________________
> + * |size|1 1 1 |V |0 0 |opc |0 |      imm9     |0 1 |  Rn     |  Rt   |
> + * |____|______|__|____|____|__|_______________|____|_________|_______|
> + */
> +union instr {
> +    uint32_t value;
> +    struct {
> +        unsigned int rt:5;     /* Rt register */
> +        unsigned int rn:5;     /* Rn register */
> +        unsigned int fixed1:2; /* value == 01b */
> +        signed int imm9:9;            /* imm9 */
> +        unsigned int fixed2:1; /* value == 0b */
> +        unsigned int opc:2;    /* opc */
> +        unsigned int fixed3:2; /* value == 00b */
> +        unsigned int v:1;      /* vector */
> +        unsigned int fixed4:3; /* value == 111b */
> +        unsigned int size:2;   /* size */
> +    } ldr_str;
> +};
> +
> +#define POST_INDEX_FIXED_MASK   0x3B200C00
> +#define POST_INDEX_FIXED_VALUE  0x38000400
> +
> +/*
> + * Try to decode an instruction when ISS is invalid
> + * This function determines if the instruction is to be decoded on the basis of
> + * the attributes in 'struct hsr_dabt'. If so, then invokes decode_instruction().
> + * If not, it returns an appropriate io_state.
> + */
> +enum io_state try_decode_instruction_invalid_iss(const struct cpu_user_regs *regs,
> +                                                 struct hsr_dabt *dabt);
> +
> +/*
>    * Decode an instruction from pc
> - * /!\ This function is not intended to fully decode an instruction. It
> + * This function is not intended to fully decode an instruction. It
>    * considers that the instruction is valid.
>    *
>    * This function will get:
> diff --git a/xen/arch/arm/io.c b/xen/arch/arm/io.c
> index 14d39222f2..dede7d59b0 100644
> --- a/xen/arch/arm/io.c
> +++ b/xen/arch/arm/io.c
> @@ -95,6 +95,35 @@ static const struct mmio_handler *find_mmio_handler(struct domain *d,
>       return handler;
>   }
>   
> +enum io_state try_decode_instruction_invalid_iss(const struct cpu_user_regs *regs,
> +                                                 struct hsr_dabt *dabt)
> +{
> +    int rc;
> +
> +    /*
> +     * Xen should not decode the instruction when it was trapped due to
> +     * translation fault.
> +     */
> +    if ( dabt->s1ptw )
> +        return IO_UNHANDLED;
> +
> +    /*
> +     * If the fault occurred due to cache maintenance or address translation
> +     * instructions, then Xen needs to ignore these instructions.
> +     */
> +    if ( dabt->cache )
> +        return IO_IGNORED;
> +
> +    rc = decode_instruction(regs, dabt);
> +    if ( rc )
> +    {
> +        gprintk(XENLOG_ERR, "Unable to decode instruction\n");
> +        return IO_ABORT;
> +    }
> +    else
> +        return IO_HANDLED;
> +}
> +
>   enum io_state try_handle_mmio(struct cpu_user_regs *regs,
>                                 const union hsr hsr,
>                                 paddr_t gpa)
> @@ -106,21 +135,14 @@ enum io_state try_handle_mmio(struct cpu_user_regs *regs,
>           .gpa = gpa,
>           .dabt = dabt
>       };
> +    int rc;
> +    bool instr_decoded = false;
>   
>       ASSERT(hsr.ec == HSR_EC_DATA_ABORT_LOWER_EL);
>   
> -    /* All the instructions used on emulated MMIO region should be valid */
> -    if ( !dabt.valid )
> -    {
> -        gprintk(XENLOG_DEBUG, "No valid instruction syndrome for data abort\n");
> -        return IO_ABORT;
> -    }
> -
>       handler = find_mmio_handler(v->domain, info.gpa);
>       if ( !handler )
>       {
> -        int rc;
> -
>           rc = try_fwd_ioserv(regs, v, &info);
>           if ( rc == IO_HANDLED )
>               return handle_ioserv(regs, v);
> @@ -128,6 +150,21 @@ enum io_state try_handle_mmio(struct cpu_user_regs *regs,
>           return rc;
>       }
>   
> +    /*
> +     * Armv8 processor does not provide a valid syndrome for decoding some
> +     * instructions. So in order to process these instructions, Xen must
> +     * decode them.
> +     */
> +    if ( !dabt.valid )
> +    {
> +        rc = try_decode_instruction_invalid_iss(regs, &info.dabt);
> +
> +        if ( rc != IO_HANDLED)
> +            return rc;
> +        else
> +            instr_decoded = true;
> +    }
> +
>       /*
>        * Erratum 766422: Thumb store translation fault to Hypervisor may
>        * not have correct HSR Rt value.
> @@ -146,9 +183,16 @@ enum io_state try_handle_mmio(struct cpu_user_regs *regs,
>       }
>   
>       if ( info.dabt.write )
> -        return handle_write(handler, v, &info);
> +        rc = handle_write(handler, v, &info);
>       else
> -        return handle_read(handler, v, &info);
> +        rc = handle_read(handler, v, &info);
> +
> +    if ( instr_decoded )
> +    {
> +        post_increment_register(&info.dabt.dabt_instr);
> +    }
> +
> +    return rc;
>   }
>   
>   void register_mmio_handler(struct domain *d,
> diff --git a/xen/arch/arm/ioreq.c b/xen/arch/arm/ioreq.c
> index 308650b400..f19fb46f72 100644
> --- a/xen/arch/arm/ioreq.c
> +++ b/xen/arch/arm/ioreq.c
> @@ -23,16 +23,35 @@
>   
>   #include <public/hvm/ioreq.h>
>   
> +#include "decode.h"
> +
>   enum io_state handle_ioserv(struct cpu_user_regs *regs, struct vcpu *v)
>   {
>       const union hsr hsr = { .bits = regs->hsr };
> -    const struct hsr_dabt dabt = hsr.dabt;
> +    struct hsr_dabt dabt = hsr.dabt;
> +
>       /* Code is similar to handle_read */
>       register_t r = v->io.req.data;
>   
>       /* We are done with the IO */
>       v->io.req.state = STATE_IOREQ_NONE;
>   
> +    /*
> +     * Note that we have already decoded the instruction in try_fwd_ioserv().
> +     * We decode the instruction again to obtain rn and imm9. This will be used
> +     * to do the post increment.
> +     * Also there is no need to check whether the instruction can be decoded or
> +     * was successfully decoded. The reason being if there was an error, then
> +     * try_fwd_ioserv() would have returned error and this function would not
> +     * have been called. Thus, there is an assumption that handle_iosev() is
> +     * invoked when try_fwd_ioserv() has returned successfully.
> +     */
> +    if ( !dabt.valid )
> +    {
> +        decode_instruction(regs, &dabt);
> +        post_increment_register(&dabt.dabt_instr);
> +    }
> +
>       if ( dabt.write )
>           return IO_HANDLED;
>   
> @@ -65,6 +84,8 @@ enum io_state try_fwd_ioserv(struct cpu_user_regs *regs,
>       };
>       struct ioreq_server *s = NULL;
>       enum io_state rc;
> +    bool instr_decoded = false;
> +    const union hsr hsr = { .bits = regs->hsr };
>   
>       if ( vio->req.state != STATE_IOREQ_NONE )
>       {
> @@ -76,8 +97,18 @@ enum io_state try_fwd_ioserv(struct cpu_user_regs *regs,
>       if ( !s )
>           return IO_UNHANDLED;
>   
> +    /*
> +     * Armv8 processor does not provide a valid syndrome for decoding some
> +     * instructions (for eg post-indexing ldr/str instructions). So in order to
> +     * process these instructions, Xen must decode them.
> +     */
>       if ( !info->dabt.valid )
> -        return IO_ABORT;
> +    {
> +        rc = try_decode_instruction_invalid_iss(regs, &info->dabt);
> +
> +        if ( rc != IO_HANDLED)
> +            return rc;
> +    }
>   
>       vio->req = p;
>   
> diff --git a/xen/arch/arm/traps.c b/xen/arch/arm/traps.c
> index 219ab3c3fb..2958e4b697 100644
> --- a/xen/arch/arm/traps.c
> +++ b/xen/arch/arm/traps.c
> @@ -1979,6 +1979,7 @@ static void do_trap_stage2_abort_guest(struct cpu_user_regs *regs,
>               {
>               case IO_ABORT:
>                   goto inject_abt;
> +            case IO_IGNORED:
>               case IO_HANDLED:
>                   advance_pc(regs, hsr);
>                   return;
> diff --git a/xen/include/asm-arm/hsr.h b/xen/include/asm-arm/hsr.h
> index 9b91b28c48..2d1fbec2ab 100644
> --- a/xen/include/asm-arm/hsr.h
> +++ b/xen/include/asm-arm/hsr.h
> @@ -143,6 +143,11 @@ union hsr {
>           unsigned long valid:1; /* Syndrome Valid */
>           unsigned long len:1;   /* Instruction length */
>           unsigned long ec:6;    /* Exception Class */
> +
> +        struct hsr_dabt_instr_details {
> +            unsigned long rn:5;
> +            signed int imm9:9;
> +        } dabt_instr; /* Data abort details obtained from instr decoding */
>       } dabt; /* HSR_EC_DATA_ABORT_* */
>   
>       /* Contain the common bits between DABT and IABT */
> diff --git a/xen/include/asm-arm/mmio.h b/xen/include/asm-arm/mmio.h
> index 7ab873cb8f..0cf00bc5a7 100644
> --- a/xen/include/asm-arm/mmio.h
> +++ b/xen/include/asm-arm/mmio.h
> @@ -36,6 +36,7 @@ enum io_state
>   {
>       IO_ABORT,       /* The IO was handled by the helper and led to an abort. */
>       IO_HANDLED,     /* The IO was successfully handled by the helper. */
> +    IO_IGNORED,     /* The IO was ignored by the helper. */
>       IO_UNHANDLED,   /* The IO was not handled by the helper. */
>       IO_RETRY,       /* Retry the emulation for some reason */
>   };
> diff --git a/xen/include/asm-arm/traps.h b/xen/include/asm-arm/traps.h
> index 2ed2b85c6f..bd22c6575d 100644
> --- a/xen/include/asm-arm/traps.h
> +++ b/xen/include/asm-arm/traps.h
> @@ -109,6 +109,7 @@ static inline register_t sign_extend(const struct hsr_dabt dabt, register_t r)
>       return r;
>   }
>   
> +void post_increment_register(const struct hsr_dabt_instr_details *instr_details);
>   #endif /* __ASM_ARM_TRAPS__ */
>   /*
>    * Local variables:

