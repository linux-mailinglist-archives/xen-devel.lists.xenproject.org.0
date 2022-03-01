Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 161694C8BCF
	for <lists+xen-devel@lfdr.de>; Tue,  1 Mar 2022 13:40:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.281333.479628 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nP1ny-0005wP-1N; Tue, 01 Mar 2022 12:40:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 281333.479628; Tue, 01 Mar 2022 12:40:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nP1nx-0005st-Sm; Tue, 01 Mar 2022 12:40:37 +0000
Received: by outflank-mailman (input) for mailman id 281333;
 Tue, 01 Mar 2022 12:40:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kl2V=TM=xilinx.com=ayankuma@srs-se1.protection.inumbo.net>)
 id 1nP1nv-0005sf-S7
 for xen-devel@lists.xenproject.org; Tue, 01 Mar 2022 12:40:35 +0000
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam08on20606.outbound.protection.outlook.com
 [2a01:111:f400:7e8c::606])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c947ded3-995c-11ec-8eba-a37418f5ba1a;
 Tue, 01 Mar 2022 13:40:33 +0100 (CET)
Received: from SN6PR01CA0020.prod.exchangelabs.com (2603:10b6:805:b6::33) by
 BN6PR02MB2577.namprd02.prod.outlook.com (2603:10b6:404:58::15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5017.22; Tue, 1 Mar 2022 12:40:27 +0000
Received: from SN1NAM02FT0021.eop-nam02.prod.protection.outlook.com
 (2603:10b6:805:b6:cafe::fd) by SN6PR01CA0020.outlook.office365.com
 (2603:10b6:805:b6::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.23 via Frontend
 Transport; Tue, 1 Mar 2022 12:40:27 +0000
Received: from xir-pvapexch02.xlnx.xilinx.com (149.199.80.198) by
 SN1NAM02FT0021.mail.protection.outlook.com (10.97.5.32) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5017.22 via Frontend Transport; Tue, 1 Mar 2022 12:40:26 +0000
Received: from xir-pvapexch01.xlnx.xilinx.com (172.21.17.15) by
 xir-pvapexch02.xlnx.xilinx.com (172.21.17.17) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Tue, 1 Mar 2022 12:40:25 +0000
Received: from smtp.xilinx.com (172.21.105.198) by
 xir-pvapexch01.xlnx.xilinx.com (172.21.17.15) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Tue, 1 Mar 2022 12:40:25 +0000
Received: from [10.108.8.223] (port=53852 helo=xcbayankuma41x.xilinx.com)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <ayan.kumar.halder@xilinx.com>)
 id 1nP1nl-0000Ui-3X; Tue, 01 Mar 2022 12:40:25 +0000
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
X-Inumbo-ID: c947ded3-995c-11ec-8eba-a37418f5ba1a
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=J+TZLWJ4YhOfNAvgCEacUVtsXGCUyeKiS/f+mMNPQIx9qhyXB+PTOaTqoOgCZREBbLfTd4ol7RCcgbqZoFxUtHDyIGtDigRuylnIbVcuMfLo4lERbiRkImpOw6JYGzGJUCiunBvYua6bnAjx2CgtZr7D8yFTKElnPcooznuED/KOWc5IoDQMB7QxAQWIryxi4HWjzYWxsWay1HQeYy5Od8dvHcbUYkKu2Zan387mFPR8/BohRGLJBIOvGaSumc+cB02N60bnCmHkcAfQaeT/nftLRaFX/30jt3ziXumTIWKo4kAOxupWGM17cqT8CSRV5mi9RE9kY8x+R0H5etXCpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s7JM5sSqmCS0X6wpG3eHNfOa7X8ZI8f0x0HeN9KJuhU=;
 b=Rtq9UaqBnh/YaqUI1tAziKyjyi+hXQjzws6cUZaEeCYKQ9g4nZwV2V5ZHa9FEvl9kkxXCJLn8jB3fJnO7k86nYdB42oAFl9SRHwneuIif7Lz6YpPOQyHJzHpDq3eYbjfyovgDVHDQWBoJkAfAORBBm54yhm6UTH6g6M0P75ltgCeUUFmJW7wutzWKgDN3v2e+4nZXb7xN2uzMxuBObGxJfAbjDEv+ocXomC0KUwMzEeokIFeueXElH4PonSA2CCwP0cWaqfmMnB+m9cuYd1wBkLGGeJaltiFJl4E6jVr9u4VY7RdzmFloVQLklbC21mOeBncqQ4CK/3IEnzcrC42sg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.80.198) smtp.rcpttodomain=lists.xenproject.org
 smtp.mailfrom=xilinx.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=xilinx.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s7JM5sSqmCS0X6wpG3eHNfOa7X8ZI8f0x0HeN9KJuhU=;
 b=Kt7WwKak+XY/VaDtv4TbOnnrm4wrkhdzf1idNJJGUdAqbOaNE9zdjtXknhhgMHFBNJmpCxCVbpyzMcsmSi4ah9V27PWB/hXUXnHLj3we+4MnZGBphjo8dtGsHc3nemEnYz2geuM4GBxJZ2tYKESwA/5PfcCAXg97mPx60rS/XIs=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.80.198)
 smtp.mailfrom=xilinx.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.80.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.80.198; helo=xir-pvapexch02.xlnx.xilinx.com;
From: Ayan Kumar Halder <ayan.kumar.halder@xilinx.com>
To: <xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>, <stefanos@xilinx.com>, <julien@xen.org>,
	<Volodymyr_Babchuk@epam.com>, <bertrand.marquis@arm.com>,
	<andrew.cooper3@citrix.com>, <george.dunlap@citrix.com>, <jbeulich@suse.com>,
	<wl@xen.org>, <paul@xen.org>, <roger.pau@citrix.com>, Ayan Kumar Halder
	<ayankuma@xilinx.com>
Subject: [XEN v9 0/4] xen/arm64: io: Decode ldr/str post-indexing instruction
Date: Tue, 1 Mar 2022 12:40:18 +0000
Message-ID: <20220301124022.10168-1-ayankuma@xilinx.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 83578c97-1964-4599-5bdd-08d9fb80a9c4
X-MS-TrafficTypeDiagnostic: BN6PR02MB2577:EE_
X-Microsoft-Antispam-PRVS:
	<BN6PR02MB2577FEE496933EAE2D7FA0CFB2029@BN6PR02MB2577.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	+P0iazNZpEJYmIPFUKfHMJNnQfrjDkEcEc1wKHwxu/YXS3TpqbvTR+FUAfS8RSVbo+0TvF6LqDv4TvqzG1W9bkzfhC1FuNigjHnRglqdb8ucWk5Jr6zgzxP/Pmt6+1b/OcwGqCwGYAS/UgjyyXUtIiaI08WVmke89oy1NnL/H6IvZ7fwQTSCZ8hmZNM8XX9pWagxwRVb4ckJgbqD95vAOES3DJid5XiboLB0CkbOQ+UI6NdiVD3SnVr00PhsZjwbj3uEnWqE77wBJaoLS92PsMOuWeGMyiRLJ9zpmB3afokNhnQgoaRSAa9HQ3e0/VyNxmwGwyesE8BANHXp5MC0n0jOOujWyhHmlGQvGOjeREhfvPXQ6peqch4aA2SFurPN2UDWGIFAur2so+e410TkQjecYjEtN0/AIIuSxQc8uDwGyGZSZV+IhHICifecmmbmSFzmnM0oo0ueID0bmdBZOiDGSxqLQUtYm5h01pGfi8Lvc3z5CQcBNMlsjot/PrHLLcP0alyDSDnYnFgZ6N38PPk4Ze50wi5lrVtVZk3B5JhtyILeHhtJpRuPlQlzMFU/ZryS/QinPJusHQMEedDHgHGj3fwJR+z99GK7j7ksSItyztgseoVNADmd+bqHHBWs/itH9wycNY61MObGcDVVgWVGMU8KKZPtGdb+Sl1Xu7VfSP2Qf62djsRUGCN077ZaizgJlcAKa96E5W6lfbKJ9Q==
X-Forefront-Antispam-Report:
	CIP:149.199.80.198;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:xir-pvapexch02.xlnx.xilinx.com;PTR:unknown-80-198.xilinx.com;CAT:NONE;SFS:(13230001)(4636009)(46966006)(36840700001)(70586007)(70206006)(6666004)(54906003)(8676002)(7696005)(508600001)(82310400004)(336012)(7636003)(356005)(186003)(6916009)(426003)(2616005)(47076005)(36860700001)(1076003)(107886003)(83380400001)(26005)(4326008)(5660300002)(8936002)(9786002)(7416002)(36756003)(2906002)(316002)(102446001)(473944003);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Mar 2022 12:40:26.9427
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 83578c97-1964-4599-5bdd-08d9fb80a9c4
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.80.198];Helo=[xir-pvapexch02.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1NAM02FT0021.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR02MB2577

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

 xen/arch/arm/arm32/traps.c        |  11 +++
 xen/arch/arm/arm64/traps.c        |  47 +++++++++++++
 xen/arch/arm/decode.c             |  80 ++++++++++++++++++++-
 xen/arch/arm/decode.h             |  48 +++++++++++--
 xen/arch/arm/include/asm/domain.h |   4 ++
 xen/arch/arm/include/asm/mmio.h   |  22 +++++-
 xen/arch/arm/include/asm/traps.h  |   2 +
 xen/arch/arm/io.c                 | 112 +++++++++++++++++++++---------
 xen/arch/arm/ioreq.c              |   7 +-
 xen/arch/arm/traps.c              |  93 ++++++++++++++++++++-----
 xen/arch/x86/include/asm/ioreq.h  |   3 +
 xen/include/xen/sched.h           |   2 +
 12 files changed, 369 insertions(+), 62 deletions(-)

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

-- 
2.17.1


