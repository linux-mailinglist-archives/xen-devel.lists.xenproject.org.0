Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F77B4D50D4
	for <lists+xen-devel@lfdr.de>; Thu, 10 Mar 2022 18:45:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.288557.489347 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nSMqi-0002hg-Ix; Thu, 10 Mar 2022 17:45:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 288557.489347; Thu, 10 Mar 2022 17:45:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nSMqi-0002fd-Fl; Thu, 10 Mar 2022 17:45:16 +0000
Received: by outflank-mailman (input) for mailman id 288557;
 Thu, 10 Mar 2022 17:45:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=i5Vk=TV=xilinx.com=ayankuma@srs-se1.protection.inumbo.net>)
 id 1nSMqg-0002fW-U5
 for xen-devel@lists.xenproject.org; Thu, 10 Mar 2022 17:45:15 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20614.outbound.protection.outlook.com
 [2a01:111:f400:7eae::614])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d435954e-a099-11ec-853a-5f4723681683;
 Thu, 10 Mar 2022 18:45:11 +0100 (CET)
Received: from DM5PR17CA0051.namprd17.prod.outlook.com (2603:10b6:3:13f::13)
 by SJ0PR02MB8532.namprd02.prod.outlook.com (2603:10b6:a03:3fd::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.15; Thu, 10 Mar
 2022 17:45:08 +0000
Received: from DM3NAM02FT023.eop-nam02.prod.protection.outlook.com
 (2603:10b6:3:13f:cafe::44) by DM5PR17CA0051.outlook.office365.com
 (2603:10b6:3:13f::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5061.22 via Frontend
 Transport; Thu, 10 Mar 2022 17:45:08 +0000
Received: from xir-pvapexch01.xlnx.xilinx.com (149.199.80.198) by
 DM3NAM02FT023.mail.protection.outlook.com (10.13.5.127) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5061.22 via Frontend Transport; Thu, 10 Mar 2022 17:45:07 +0000
Received: from xir-pvapexch01.xlnx.xilinx.com (172.21.17.15) by
 xir-pvapexch01.xlnx.xilinx.com (172.21.17.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Thu, 10 Mar 2022 17:45:05 +0000
Received: from smtp.xilinx.com (172.21.105.198) by
 xir-pvapexch01.xlnx.xilinx.com (172.21.17.15) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Thu, 10 Mar 2022 17:45:05 +0000
Received: from [10.108.8.223] (port=47674 helo=xcbayankuma41x.xilinx.com)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <ayan.kumar.halder@xilinx.com>)
 id 1nSMqX-00062C-20; Thu, 10 Mar 2022 17:45:05 +0000
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
X-Inumbo-ID: d435954e-a099-11ec-853a-5f4723681683
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OVvdguyP6Z9CK2wMVk7YPdfhcrl60tmkSUuD7GNBDWOY1jZzgg0t+lkKQaLzJ7BPCTKRIKvnRwf8wH706t/z2prdlr99ulyTgInh7UGmbltiiwl6z+Pf15S3ok4q0o2ABtJWkXSGcDVfFuCbqyTW/zpMaWn9WyIHXD3ZC6ilNGMe8KsUEaUz4+qyiDn+0Qx2Vz1fM194PsLGSoENWkHT8YfXXS4n3YUUKa0+4FtPuSvMOFosgbVVx9tUsYzYIfAgAZcQHeM26Hm9tLjFiaEsbz7f/NXlzqivwPaey4yVMeH8yy5a4VGYsK5LhYO6ytegnZTU9PcOfolaqTUDSro/Zg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vtnqHWo21PYkXXu0QirZrBjGvvDVMR1GsuzNkgjNRRA=;
 b=ApqVUp/tcEOQNPmRxWsPnS3xar/EMCwpjDjRzZNJb9Oa5vglUbrkPm1V8iL99DROGMfShZlH7wBRecyzcaohj5itMcCaApQWkmcFTjTuC0IA14+jgSRQctNPLAY7GxPPRXBBjBY/aQ2jchrJ+Tc5a5wAe0tJBWnqFbG4PsDa5Z2qPnjFF/Gt5aEvnA+F4e+UP/cTOwHKU66+M3aB4qG4zm8xl6dGv+VsXiwsM8Op2WqHRocO+f/foLWQFekvhBkysfEzq0/pmG9JNSiBR3LcUVLlFdwpjBCmZautsqLuPYRncXALOVOL1ryrTgXFoO6cwZz3dxSiVzgM/BqqZG8Dpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.80.198) smtp.rcpttodomain=lists.xenproject.org
 smtp.mailfrom=xilinx.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=xilinx.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vtnqHWo21PYkXXu0QirZrBjGvvDVMR1GsuzNkgjNRRA=;
 b=GWiE9ec2vo1EmqGkvyIbnAg5HucNj8lRNh169JTbNRknB/WgfpLx4YJ/2GOGRQrVVHuw7TjtOxpLS6H3++RRfaKye0lvH70W1qw02RLwbvkzh6Pu+dJwwEhTjFjREvR4Ubb1ZBBScyzTpok/ewI5VlGP8vdFneguWVM+1mwbYqY=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.80.198)
 smtp.mailfrom=xilinx.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.80.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.80.198; helo=xir-pvapexch01.xlnx.xilinx.com;
From: Ayan Kumar Halder <ayan.kumar.halder@xilinx.com>
To: <xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>, <stefanos@xilinx.com>, <julien@xen.org>,
	<Volodymyr_Babchuk@epam.com>, <bertrand.marquis@arm.com>,
	<andrew.cooper3@citrix.com>, <george.dunlap@citrix.com>, <jbeulich@suse.com>,
	<wl@xen.org>, <paul@xen.org>, <roger.pau@citrix.com>, Ayan Kumar Halder
	<ayankuma@xilinx.com>
Subject: [XEN v10 0/4] xen/arm64: io: Decode ldr/str post-indexing instruction
Date: Thu, 10 Mar 2022 17:44:57 +0000
Message-ID: <20220310174501.62040-1-ayankuma@xilinx.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6e4557a3-ca8b-43fe-c0cc-08da02bdb787
X-MS-TrafficTypeDiagnostic: SJ0PR02MB8532:EE_
X-Microsoft-Antispam-PRVS:
	<SJ0PR02MB8532B2FFB83BDE5F6E84C9DDB20B9@SJ0PR02MB8532.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	I1hxDPqNGaDu1prwP89ioO1s9B3+L4TIgLhWItQ6txt8d5B9/SWxT7Dc7FBTq1ecNA74bgTy7hR/RqXjhgpxDa7O927OF1weqBRthtbMK3bMsp4gOwlBikghuHd1iBj7RROGkEfu3mSxnKDhaL6q+FBxgZtAhnvySzs8lTAdLx74rM1b0mmlkAdF2L/HRYI4fQQdDtIzbo+tORUivdpufdfW5YYxy3cNHKF48AFVlORjCSWxkUf5xDaWDe6PAZIkebe5JLUT1sHsWhAFSXXKPSeK2eGL9sW0OEfCpTcOtlBs4avS91RFM3ttzuOMufDBSJXhoVsGTXpu90ozI9nBwOby6DlLdqtkOiDdsCPngC1x4J7gvZqf5uLQeajddkyAauWdYLjLCsbJdiA8pkflMoy0GZeBsPdXH4Y2PewufT+NyHAVKJO3cTJvtRP9M04127aoopn12AW5iUS0uNWGLSv5u6XNqn0qFsbo//4x4zMFaaBp5k29jwnN79yqLEkAdHx/zUgftATZfmKUTzJ03OjVZcCMKAoahHoz+EOrhRhhA1PlUROnJ2+0rv/o/x9GKQgFA4cPrSm9PQhQ1qSu/S4naVm8SnhCd0Wy9+efaL15kPfx+LchoxRirls9rtz+yNyXdsK36mRSUkXUCAG0r9p290uHldE3meEuHgKCqmT43EPp3KLswGvBBESlL1dWJpX8CG7z6BGsbS/ES4GL7RA7PibtuqjnrqLRzPqtxJY=
X-Forefront-Antispam-Report:
	CIP:149.199.80.198;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:xir-pvapexch01.xlnx.xilinx.com;PTR:unknown-80-198.xilinx.com;CAT:NONE;SFS:(13230001)(4636009)(46966006)(40470700004)(36840700001)(2906002)(107886003)(7696005)(82310400004)(40460700003)(426003)(83380400001)(336012)(2616005)(36860700001)(186003)(26005)(47076005)(316002)(8936002)(9786002)(36756003)(70586007)(70206006)(4326008)(8676002)(508600001)(5660300002)(6666004)(356005)(7416002)(7636003)(1076003)(54906003)(6916009)(102446001)(473944003);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2022 17:45:07.4735
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e4557a3-ca8b-43fe-c0cc-08da02bdb787
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.80.198];Helo=[xir-pvapexch01.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DM3NAM02FT023.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR02MB8532

Hi All,

The patch series introduces support to decode instructions by Xen when ISS is
invalid. Currently, when the guest executes post indexing ldr/str instructions
on emulated MMIO, these instructions are trapped into Xen as a data abort.
Xen reads hsr_dabt.isv == 0, so ISS is invalid. Therefore, it reads the faulting
instruction's opcode from guest's PC. It decodes and executes the instruction on
the emulated region.

While doing the patch, we found two bugs in the codebase. I have addressed them
in patches 3 and 4. These bugs were discussed with Julien on IRC chat. The
purpose of addressing these bugs (in this series) is that 1. We should not forget
about them. 2. To get clarity if our understanding is correct.

Ayan Kumar Halder (4):
  xen/arm64: Decode ldr/str post increment operations
  xen/arm64: io: Support instructions (for which ISS is not valid) on
    emulated MMIO region using MMIO/ioreq handler
  xen/arm64: io: Handle the abort due to access to stage1 translation
    table
  xen/arm64: io: Handle data abort due to cache maintenance instructions


Ayan Kumar Halder (4):
  xen/arm64: Decode ldr/str post increment operations
  xen/arm64: io: Support instructions (for which ISS is not valid) on
    emulated MMIO region using MMIO/ioreq handler
  xen/arm64: io: Handle the abort due to access to stage1 translation
    table
  xen/arm64: io: Handle data abort due to cache maintenance instructions

 xen/arch/arm/arm32/traps.c        |  11 +++
 xen/arch/arm/arm64/traps.c        |  52 ++++++++++++++
 xen/arch/arm/decode.c             |  81 ++++++++++++++++++++-
 xen/arch/arm/decode.h             |  48 +++++++++++--
 xen/arch/arm/include/asm/domain.h |   4 ++
 xen/arch/arm/include/asm/mmio.h   |  22 +++++-
 xen/arch/arm/include/asm/traps.h  |   2 +
 xen/arch/arm/io.c                 | 115 ++++++++++++++++++++++--------
 xen/arch/arm/ioreq.c              |  21 +++++-
 xen/arch/arm/traps.c              |  77 +++++++++++++++-----
 xen/arch/x86/include/asm/ioreq.h  |   3 +
 xen/include/xen/sched.h           |   2 +
 12 files changed, 379 insertions(+), 59 deletions(-)

Changelog :-
v2 - 1. Updated the rn register after reading from it. (Pointed by Julien,
        Stefano)
     2. Used a union to represent the instruction opcode (Suggestd by Bertrand)
     3. Fixed coding style issues (Pointed by Julien)
     4. In the previous patch, I was updating dabt->sign based on the signedness
        of imm9. This was incorrect. As mentioned in ARMv8 ARM  DDI 0487G.b,
        Page 3221, SSE indicates the signedness of the data item loaded. In our
        case, the data item loaded is always unsigned.

v3- 1. Handled all the variants of ldr/str (ie 64, 32, 16, 8 bit variants).
       Thus, I have removed the check for "instr->code.opc == 0" (Suggested by
       Andre)
    2. Handled the scenario when rn = SP, rt = XZR (Suggested by Jan, Andre)
    3. Added restriction for "rt != rn" (Suggested by Andre)
    4. Moved union ldr_str_instr_class {} to decode.h. This is the header included
       by io.c and decode.c (where the union is referred). (Suggested by Jan)
    5. Indentation and typo fixes (Suggested by Jan)

v4- 1. Fixed the patch as per Stefano's comments on v3. They are as follows :-
        1.1 Use macros to determine the fixed values in the instruction opcode
        1.2 Checked if instr != NULL
        1.3 Changed some data types and added #define ARM_64 for AArch64 specific
            code
        1.4 Moved post_increment_register() to decode.c so that the decoding
            logic is confined to a single file.
        1.5 Moved some checks from post_increment_register() to
            decode_loadstore_postindexing()
        1.6 Removed a duplicate check
    2. Updated the commit message as per Andre's comments.
    3. Changed the names of a label and some comments. *32bit* was erroneously
       mentioned in a label and comments in decode_loadstore_postindexing()
       although the function handled all variants of ldr/str post indexing.

v5- 1. Renamed decode_loadstore_postindexing() to decode_arm64(). The reason
       being this will be extended in future to support more instructions for
       which hsr_badt.isv = 0
    2. Introduce a function try_decode_instruction_invalid_iss() to determine
       if the instruction needs to be decoded before invoking decode_instruction().

       It checks :-
       2.1  dabt->s1ptw - Returns IO_UNHANDLED
       2.2  dabt->cache - Returns IO_IGNORED. (new enum instroduced to let the
            caller know that the instruction needs to be ignored by Xen. Thus
            the caller needs to increment the PC and return to the guest.

    3. Invoked try_decode_instruction_invalid_iss() from the following 2 places :-
        3.a - try_handle_mmio() - When we have determined that there is a valid
              mmio handler.
        3.b - try_fwd_ioserv()
        When ioserver completes the io request, the acknowledgement is sent via
        handle_ioserv(). Here, we need to increment the register. As there is no
        common data shared between try_fwd_ioserv() and handle_ioserv(), we need
        to decode the instruction again in handle_ioserv() to determine rn, imm9.

        (NOTE to Reviewers) - This does not feel correct. However, I could not
        think of a better approach. Please provide your inputs.

    4. Augumented struct hsr_dabt{} with struct hsr_dabt_instr_details{} to hold
       rn and imm9. This is passed to post_increment_register() to update rn.
    5. Other style changes as suggested in v4.

v6 - 1. Split the patch into three parts.

v7 - 1. Merged patch2 and patch3 into a single patch.

v8 - 1. Changes mentioned in the individual patches.

v9 - 1. Added patches 3 and 4 to address the bugs found in the existing codebase.
     2. Changes mentioned in the individual patches.

v10 - 1. Changes mentioned in the individual patches.
-- 
2.17.1


