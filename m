Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C1204DC82F
	for <lists+xen-devel@lfdr.de>; Thu, 17 Mar 2022 15:01:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.291586.494982 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nUqgZ-0000nj-Bu; Thu, 17 Mar 2022 14:01:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 291586.494982; Thu, 17 Mar 2022 14:01:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nUqgZ-0000kT-8d; Thu, 17 Mar 2022 14:01:03 +0000
Received: by outflank-mailman (input) for mailman id 291586;
 Thu, 17 Mar 2022 14:01:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zfHd=T4=xilinx.com=ayankuma@srs-se1.protection.inumbo.net>)
 id 1nUqgX-0000IZ-EJ
 for xen-devel@lists.xenproject.org; Thu, 17 Mar 2022 14:01:01 +0000
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam07on20624.outbound.protection.outlook.com
 [2a01:111:f400:7eb2::624])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ab980459-a5fa-11ec-8eba-a37418f5ba1a;
 Thu, 17 Mar 2022 15:00:59 +0100 (CET)
Received: from BN9PR03CA0210.namprd03.prod.outlook.com (2603:10b6:408:f9::35)
 by BL0PR02MB4610.namprd02.prod.outlook.com (2603:10b6:208:4b::30)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5061.26; Thu, 17 Mar
 2022 14:00:52 +0000
Received: from BN1NAM02FT025.eop-nam02.prod.protection.outlook.com
 (2603:10b6:408:f9:cafe::39) by BN9PR03CA0210.outlook.office365.com
 (2603:10b6:408:f9::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5081.17 via Frontend
 Transport; Thu, 17 Mar 2022 14:00:52 +0000
Received: from xir-pvapexch02.xlnx.xilinx.com (149.199.80.198) by
 BN1NAM02FT025.mail.protection.outlook.com (10.13.2.139) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5081.14 via Frontend Transport; Thu, 17 Mar 2022 14:00:52 +0000
Received: from xir-pvapexch02.xlnx.xilinx.com (172.21.17.17) by
 xir-pvapexch02.xlnx.xilinx.com (172.21.17.17) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Thu, 17 Mar 2022 14:00:51 +0000
Received: from smtp.xilinx.com (172.21.105.197) by
 xir-pvapexch02.xlnx.xilinx.com (172.21.17.17) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Thu, 17 Mar 2022 14:00:51 +0000
Received: from [10.108.8.223] (port=9027 helo=xcbayankuma41x.xilinx.com)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <ayan.kumar.halder@xilinx.com>)
 id 1nUqgM-0004ME-Mi; Thu, 17 Mar 2022 14:00:51 +0000
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
X-Inumbo-ID: ab980459-a5fa-11ec-8eba-a37418f5ba1a
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TtaIqCQZZfUnhsqN14FINFE7ENwkgUmrMLZCXGmMnEkGs/2KfHJnr/a7UHggUObSeuLr9hQ/rHj7Iic5K0YYnd4Ze5uaDEzOl3Gpsv8Sr/Xqn4CCI9KKVNB8ajyQE5r62Dlkbq2CgtIgqZv9TzVkICgzPURSdTJOlRRm4etLGaeDJG/LzcIguhntZu3Jkb42miau0bSVB6MNjLu6Dpp3cUBNXoRLiGuLQvshDiI3enh00FOT2V0mxwIMu/J/apZ18cP01IS3dja3JHWI0VViiHOYcBt+eK5sQ/W8WrEt/hkk9jvpGF25PRqoolXTjpX30u6R8+D2fDn/dBD8qMqaVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aXrU+SHMFUVKeGdJn+m6fiq82dkwxZek/EvuMvh/LkE=;
 b=VEOPdpa0UA/mqM1riSUiDJc36t3QfyFTNlnviuFrwXYDLGYQKSoSseHUH3OhD8Oo84gC2wlzPT/eTgldLVMoyWzm6KOSTi0uted1sO5WvKdxb6Cq4ne1qB7JUoqsuuMLhpzq5+hO0FpK6KxESVEz06l7D79D/+1OgXwCjhgkrt0jt7jiOtZsFzJ5YFw19wk8YjzDyr4DKXm4xVa4JhVwOXyqvS9F54eojhfRjUbiQfLqgm/AhaYOkkY8zHCSsw2N6rq+fowR+CihxOguJRkxJCKZ+lXw4r0Q4/6Ghel+I80EMkVcDLMS6ZnbPyqzV4CJ+nnB3gVUpxR+f97WrZ/ADA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.80.198) smtp.rcpttodomain=lists.xenproject.org
 smtp.mailfrom=xilinx.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=xilinx.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aXrU+SHMFUVKeGdJn+m6fiq82dkwxZek/EvuMvh/LkE=;
 b=liI1xv1ZvBnIS+CDlbmfOIniG6bpPib9a6SkRxKMpRvZQYMRqGsdJ9DKiy4aIYgY8SlW9FINCB41YQq1XtLJBuKVRhE+lT1Bwk0tc20iQM7kr3oNjOFUteMME3vBVQkpY9nrX3/Vx3e5RqQOmIYPe37EMpKI6b7Cq9yiLbmHsoc=
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
Subject: [PATCH v11 0/3] xen/arm64: io: Decode ldr/str post-indexing instruction
Date: Thu, 17 Mar 2022 14:00:43 +0000
Message-ID: <20220317140046.64563-1-ayankuma@xilinx.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8971e89f-997c-4fc5-7b20-08da081e8c8d
X-MS-TrafficTypeDiagnostic: BL0PR02MB4610:EE_
X-Microsoft-Antispam-PRVS:
	<BL0PR02MB46102B32BE61F0F536ADDD76B2129@BL0PR02MB4610.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	zc06GGQgjvkQ3O2T3iKnrIlODDaJDP+9Z4iG72X/SRGVO5tJTUyWFaNsLiZmwumkAJjxy6qxo8sYvOeI5dgdH9cqwT1LIKwte3t3D2qvhGjGhG/5X60GT9bbiu5z/WTUoDIKezVwbdsMislFcGGvWvGivB0dKGwvzoQTuqocUZED4H7fZzZehCkhBsv2/1Et2He6Yi8I2wNiSa+Qpafo2yfyaQkrJoPMSrRfVic3a1FGafvJHF8qGnVKN6BvX8IOGAhb8/RBYDbCeWdZC59B8f3Qhwmpv+ikitj8BPA2nvZiIBNyVCKz1Zn+sE502E2BofuLzRHZm7+HHF4DehOWIEW5zHIvCzAi6kNH8mVqbL9av/XkMLZxUn3Tp3/Xa9zaQQH0+fXPEMtkeKFM6DFj1r3Hl70izWv9+dwJsquF89p6W5LeuzLzw68bAIISjZm9zNRYMc6qPooljZwr7fE6GLHwLK7oxrTN6mpEWTfFBRBbknfAGIgmob/NZouwNCfehML29ibNO1fuHOyx/avxAJwHGKz0qms5WcOGKbVCxce+81K03lrqT63UY9+FNohOIKAq4m+hiHQdPVyBu+zDXGOJC+chGuevvYimz+XJefjhdA6LYEGSa9ebgnVVzMnzaZcAxxskZGlMbsOHMA5OpBv88b0fqdOmVKSnigMv9ptaCWA9CKHZeoiqllxW7pRF5C7u6H+yf1KTWUgNUC9rGsWYR+Wlnayu3T1LgdFgcyE=
X-Forefront-Antispam-Report:
	CIP:149.199.80.198;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:xir-pvapexch02.xlnx.xilinx.com;PTR:unknown-80-198.xilinx.com;CAT:NONE;SFS:(13230001)(4636009)(40470700004)(36840700001)(46966006)(36756003)(6666004)(508600001)(8936002)(47076005)(83380400001)(7416002)(5660300002)(426003)(336012)(40460700003)(2906002)(82310400004)(186003)(26005)(4326008)(6916009)(9786002)(54906003)(70586007)(70206006)(316002)(2616005)(36860700001)(1076003)(7636003)(356005)(107886003)(7696005)(8676002)(102446001)(473944003);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2022 14:00:52.4751
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8971e89f-997c-4fc5-7b20-08da081e8c8d
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.80.198];Helo=[xir-pvapexch02.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1NAM02FT025.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR02MB4610

Hi All,

The patch series continues with the support to decode instructions by Xen when
ISS is invalid. Currently, when the guest executes post indexing ldr/str instructions
on emulated MMIO, these instructions are trapped into Xen as a data abort.
Xen reads hsr_dabt.isv == 0, so ISS is invalid. Therefore, it reads the faulting
instruction's opcode from guest's PC. It decodes and executes the instruction on
the emulated region.

This is a continuation of the previous patch series "[XEN v10 0/4] xen/arm64: io:
Decode ldr/str post-indexing instruction". In the previous series, patches 2 and
3 had to be reverted as they cause a build break on x86 and boot failure on arm32.
Only patch 1 (ie "[XEN v10 1/4] xen/arm64: Decode ldr/str post increment operations"
was committed)

While doing the patch, we found two bugs in the codebase. I have addressed them
in patches 2 and 3. This was discussed with Julien on the IRC.

Ayan Kumar Halder (3):
  xen/arm64: io: Emulate instructions (with invalid ISS) on MMIO region
  xen/arm64: io: Handle the abort due to access to stage1 translation
    table
  xen/arm64: io: Handle data abort due to cache maintenance instructions

 xen/arch/arm/arm32/traps.c        |  12 +++
 xen/arch/arm/arm64/traps.c        |  52 +++++++++++++
 xen/arch/arm/decode.c             |   2 +
 xen/arch/arm/include/asm/domain.h |   4 +
 xen/arch/arm/include/asm/mmio.h   |  18 ++++-
 xen/arch/arm/include/asm/traps.h  |   2 +
 xen/arch/arm/io.c                 | 117 +++++++++++++++++++++---------
 xen/arch/arm/ioreq.c              |  15 +++-
 xen/arch/arm/traps.c              |  77 ++++++++++++++++----
 xen/arch/x86/include/asm/domain.h |   3 +
 xen/include/xen/sched.h           |   2 +
 11 files changed, 251 insertions(+), 53 deletions(-)

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

v11 - 1. Patch 1/4 from v10 was committed. Thus, this series contains patches 2..4.
      2. Changes mentioned in the individual patches.

-- 
2.17.1


