Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4651C4AACEE
	for <lists+xen-devel@lfdr.de>; Sat,  5 Feb 2022 23:59:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.266161.459861 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nGU0k-0007Vs-Qh; Sat, 05 Feb 2022 22:58:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 266161.459861; Sat, 05 Feb 2022 22:58:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nGU0k-0007Ol-M9; Sat, 05 Feb 2022 22:58:30 +0000
Received: by outflank-mailman (input) for mailman id 266161;
 Sat, 05 Feb 2022 22:58:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pZml=SU=xilinx.com=ayankuma@srs-se1.protection.inumbo.net>)
 id 1nGU0j-0007Ml-6H
 for xen-devel@lists.xenproject.org; Sat, 05 Feb 2022 22:58:29 +0000
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam08on20603.outbound.protection.outlook.com
 [2a01:111:f400:7e8d::603])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1fe6ca6c-86d7-11ec-8eb8-a37418f5ba1a;
 Sat, 05 Feb 2022 23:58:26 +0100 (CET)
Received: from SN4PR0401CA0005.namprd04.prod.outlook.com
 (2603:10b6:803:21::15) by BN6PR02MB3234.namprd02.prod.outlook.com
 (2603:10b6:405:65::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.12; Sat, 5 Feb
 2022 22:58:22 +0000
Received: from SN1NAM02FT0052.eop-nam02.prod.protection.outlook.com
 (2603:10b6:803:21:cafe::16) by SN4PR0401CA0005.outlook.office365.com
 (2603:10b6:803:21::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.12 via Frontend
 Transport; Sat, 5 Feb 2022 22:58:22 +0000
Received: from xir-pvapexch01.xlnx.xilinx.com (149.199.80.198) by
 SN1NAM02FT0052.mail.protection.outlook.com (10.97.5.70) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4951.12 via Frontend Transport; Sat, 5 Feb 2022 22:58:21 +0000
Received: from xir-pvapexch02.xlnx.xilinx.com (172.21.17.17) by
 xir-pvapexch01.xlnx.xilinx.com (172.21.17.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Sat, 5 Feb 2022 22:58:20 +0000
Received: from smtp.xilinx.com (172.21.105.198) by
 xir-pvapexch02.xlnx.xilinx.com (172.21.17.17) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Sat, 5 Feb 2022 22:58:19 +0000
Received: from [10.108.8.223] (port=45840 helo=xcbayankuma41x.xilinx.com)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <ayan.kumar.halder@xilinx.com>)
 id 1nGU0Y-0005LJ-SX; Sat, 05 Feb 2022 22:58:19 +0000
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
X-Inumbo-ID: 1fe6ca6c-86d7-11ec-8eb8-a37418f5ba1a
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NDsWfXwJ2JZsZNTg7WmanJ+8taD7Ez07bwBiRaqeJu8mjXymiaNkUCtSBx3ii0rJDAeD8fUYxIC7JJMUv26heSoxyHkfaPH42J3Ura3yvAmZ3Gb1skcvaqy8O4y09MRywM+OKNfGcbHvarntqR/k7z97TVpjYs4sswTX2Zo5txOWXeVZjQrMzoQeexANBxWvbHbiFzTaZrD/VQDnpH/dwpIdUUGSjJyVTOZM2SHDi7wFjQygR+3dVmd2arKzmuQGOzaLgVIvfv16ROpTmHturbargHn5FbRXpmexJEhJA+RfZs31r+b5asUb16UVDFH3clmg9Rk6Zvi5luNi5qMZPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4VqlO1ntTl/yRfiLIXFfIRXVtxXzh0hwXYse28sFqdc=;
 b=QLAzDEeEgCnaprDKmT3ivdky4vxqxtbq33g09jw0dIFU1JXuRJt/UOAnqacgXlQxizZb64yzhxMCG1ANb89OJGRXTyItMO0cY+5UHBvWPW9rU1y4uvsIO2MC19m9ZucCkezQ8X3KMpuGbNroFDkaHoW0ZMrT6/44fs7HJA1lDmgfnIJvIJ0c3OA2VxOk60m39WZfbqnOXgOeGCJz9VqQbHB9f4F+LOHeyyoA/xwwFx09iNs+u1Is7crM59vGXNBxfljPrv0AhwnvdNfv+g0s5qoSwRnDIrubrvW2OJuob42C/ynYhRWj+6HDr2W6smdkJl0DxYIfYQwCzy3YdKQG1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.80.198) smtp.rcpttodomain=lists.xenproject.org
 smtp.mailfrom=xilinx.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=xilinx.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4VqlO1ntTl/yRfiLIXFfIRXVtxXzh0hwXYse28sFqdc=;
 b=jQQ42rJBRj4ibtg6uGOi5ygq6UhPS5FxknNa/XIjKl3iBpD42Zr0T6RfIEjge3u66Yrk+Kc2e0Zew0OuksxJz/ywueWRTriTKMy24f3aYx1Ayfb807jWuBRzwigkggeTL1c9hfKgNMsXvhCPsYWR8RT29iNtS6UWGTqmsmtkMCg=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.80.198)
 smtp.mailfrom=xilinx.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.80.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.80.198; helo=xir-pvapexch01.xlnx.xilinx.com;
From: Ayan Kumar Halder <ayan.kumar.halder@xilinx.com>
To: <xen-devel@lists.xenproject.org>, <ayankuma@xilinx.com>
CC: <sstabellini@kernel.org>, <stefanos@xilinx.com>, <julien@xen.org>,
	<Volodymyr_Babchuk@epam.com>, <bertrand.marquis@arm.com>
Subject: [XEN v7 0/2] xen/arm64: io: Decode ldr/str post-indexing instruction
Date: Sat, 5 Feb 2022 22:58:14 +0000
Message-ID: <20220205225816.5952-1-ayankuma@xilinx.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 35d7953c-1b4c-445a-062d-08d9e8fb01fa
X-MS-TrafficTypeDiagnostic: BN6PR02MB3234:EE_
X-Microsoft-Antispam-PRVS:
	<BN6PR02MB3234E7E0F891601E2AAC6CFFB22A9@BN6PR02MB3234.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:5516;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	LK2fcIgUj/g6QlK95BXqnVs4upArXKl3edarBKLdCUWfydaWMpqIuWQsfwP0CBN5ISx1aEP/OaerIjbLpRG8IM3AoJpYCbesTzGxCqf1OjQgsrLycqxLfN7G4Sfr1Gw8G+9TjxqtNmGCbcQS502wiynGs1oP8fSSQiYnTeziBzRBWtVt97o3Xd9nXFPVYKYLe/zezvSaVwy/l7XVaQ+UwlPonZyhj4JgSsFsRqz7fU8NmzT1+iep5haccTmfoeNIMyc04/xQ5hWffVOcnLfvxWtVabrblKvMuzpQ2XS2Zo3S2Sh4fykg5eOnTPXE/Pm2HFzw+QLz5xs8UDv9CY9U5c1hONLw70TcON0RAgDStNrOFDtByyXBPgew3+4q/zXRvg9cjSb/wz4d4k5bK/zzUWfy6ZlIywh1+xXGoVkw3abhYOcA3QND1DEaz5/ayGRpW9eGAJ4ESICAOvzzklsKC/9MWG92DIw6ikvCMLT99f/+U0f0q1Q/0mhCZdMTSuc7IFmuaJlaqOqdYNLxdzTk+oG4I5eZQGIqqLY+k+ylOpoZT0dv+VWbTebDx+Epedv67tu/hpj77kb6hoyNtXjFirDlrI3Eq19WrM6+fi/9MHH0g0xmuor7PwdaZ1a4QybVgfv3tzvx7jTISgNYBJv61EZHIbVK+oNfkMGHmNYun7oLIgLcvEZxvF39nyAsyuENDppvk9ZolQNyc/YVMR3Niw==
X-Forefront-Antispam-Report:
	CIP:149.199.80.198;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:xir-pvapexch01.xlnx.xilinx.com;PTR:unknown-80-198.xilinx.com;CAT:NONE;SFS:(13230001)(4636009)(36840700001)(46966006)(110136005)(508600001)(1076003)(7696005)(36756003)(6666004)(83380400001)(47076005)(426003)(8936002)(8676002)(7049001)(26005)(2616005)(336012)(186003)(70586007)(70206006)(4326008)(2906002)(7636003)(356005)(316002)(6636002)(5660300002)(36860700001)(54906003)(82310400004)(9786002)(102446001)(473944003);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Feb 2022 22:58:21.4421
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 35d7953c-1b4c-445a-062d-08d9e8fb01fa
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.80.198];Helo=[xir-pvapexch01.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1NAM02FT0052.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR02MB3234

Hi All,

The patch series introduces support to decode instructions by Xen when ISS
is invalid. Currently, when the guest executes post indexing ldr/str instructions
on emulated MMIO, these instruction was trapped into Xen as a data abort.
Xen reads hsr_dabt.isv = 0, so ISS is invalid. Therefore, it reads the
faulting instruction's opcode from guest's PC. It decodes and executes the
instruction on the emulated region.

Ayan Kumar Halder (2):
  xen/arm64: Decode ldr/str post increment operations
  xen/arm64: io: Support instructions (for which ISS is not valid) on
    emulated MMIO region using MMIO/ioreq handler

 xen/arch/arm/arm32/traps.c        |   7 ++
 xen/arch/arm/arm64/traps.c        |  47 +++++++++++++
 xen/arch/arm/decode.c             |  81 +++++++++++++++++++++-
 xen/arch/arm/decode.h             |  48 +++++++++++--
 xen/arch/arm/include/asm/domain.h |   4 ++
 xen/arch/arm/include/asm/ioreq.h  |   1 +
 xen/arch/arm/include/asm/mmio.h   |  20 +++++-
 xen/arch/arm/include/asm/traps.h  |   2 +
 xen/arch/arm/io.c                 | 108 ++++++++++++++++++++----------
 xen/arch/arm/ioreq.c              |  12 ++--
 xen/arch/arm/traps.c              |  85 ++++++++++++++++++++---
 xen/arch/x86/include/asm/ioreq.h  |   3 +
 xen/include/xen/sched.h           |   2 +
 13 files changed, 362 insertions(+), 58 deletions(-)

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

-- 
2.17.1


