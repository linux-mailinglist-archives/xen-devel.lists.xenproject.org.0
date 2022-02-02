Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D4BEB4A76E1
	for <lists+xen-devel@lfdr.de>; Wed,  2 Feb 2022 18:31:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.264366.457444 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nFJSg-0005NX-Sk; Wed, 02 Feb 2022 17:30:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 264366.457444; Wed, 02 Feb 2022 17:30:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nFJSg-0005LC-Oz; Wed, 02 Feb 2022 17:30:30 +0000
Received: by outflank-mailman (input) for mailman id 264366;
 Wed, 02 Feb 2022 17:30:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FkQ0=SR=xilinx.com=ayankuma@srs-se1.protection.inumbo.net>)
 id 1nFJSf-0005L1-6i
 for xen-devel@lists.xenproject.org; Wed, 02 Feb 2022 17:30:29 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on20630.outbound.protection.outlook.com
 [2a01:111:f400:fe59::630])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ce5826b9-844d-11ec-8eb8-a37418f5ba1a;
 Wed, 02 Feb 2022 18:30:26 +0100 (CET)
Received: from BN6PR1401CA0010.namprd14.prod.outlook.com
 (2603:10b6:405:4b::20) by CH2PR02MB6168.namprd02.prod.outlook.com
 (2603:10b6:610:a::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.17; Wed, 2 Feb
 2022 17:30:22 +0000
Received: from BN1NAM02FT016.eop-nam02.prod.protection.outlook.com
 (2603:10b6:405:4b:cafe::4e) by BN6PR1401CA0010.outlook.office365.com
 (2603:10b6:405:4b::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.12 via Frontend
 Transport; Wed, 2 Feb 2022 17:30:22 +0000
Received: from xir-pvapexch01.xlnx.xilinx.com (149.199.80.198) by
 BN1NAM02FT016.mail.protection.outlook.com (10.13.2.133) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4951.12 via Frontend Transport; Wed, 2 Feb 2022 17:30:22 +0000
Received: from xir-pvapexch01.xlnx.xilinx.com (172.21.17.15) by
 xir-pvapexch01.xlnx.xilinx.com (172.21.17.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Wed, 2 Feb 2022 17:30:21 +0000
Received: from smtp.xilinx.com (172.21.105.198) by
 xir-pvapexch01.xlnx.xilinx.com (172.21.17.15) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Wed, 2 Feb 2022 17:30:21 +0000
Received: from [10.108.8.223] (port=56994 helo=xcbayankuma41x.xilinx.com)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <ayan.kumar.halder@xilinx.com>)
 id 1nFJSW-0004a1-1X; Wed, 02 Feb 2022 17:30:20 +0000
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
X-Inumbo-ID: ce5826b9-844d-11ec-8eb8-a37418f5ba1a
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jv0yguxRbqIapmtJ/KoNIJKOIeAe1kAR0e6J5Nm5q6Id2uE/Dj9zAQFSoUn6kPcv1VICczaX4TIGl+8gwnuCKdstUXQVsAB/SezFhlNfk1uBPgztdWXDjmrrEzOjyrs71vGMI/Ft6QHb31fvlJGr3UUN7oYgoS8H3X51KR+4VIUtNPI9f9j4i5XRA5szvXWxNJb2xLnP8h3fcJhq/sqxujlwFWEx0m1auRtHQPpQcuHh1N5yhp9K/n5u6yWiw/h5ZnVV3Hy7QxWxUAKuT6h9P/hlAVXoAkosZ3XxZDIonKjuDS6vs9CVSSIYPff637gJI83Yhj2+Ei2uaMx8NAnVfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q0l0VgEygkT2jSFeBt8xFaCn5y1Wf34uWHniJq3qmLA=;
 b=RWUtMhtsO0NFtDhHxxcp1wi0BfL9iu8U2QutfdcupTUGq5XRQrWS1ZGoZQDDW+STnh9yI59Eez4WnOdcQU/O9tSBYpp2ZudK2w+3/yPVWjN/mmmdj+5Uullu2AKdtwfrVTi4bFXpAYz2pyp8/vXXW2EkcJlLnlotBkUqNalMgFqCNRWyXcoIsQFzU6x9h1+VCfixvLl3tMvBQPO2H63iH/XsVsetzDKURPv0ZGvZLR+00vfXSPwGbjvD3jB0l68vryCh/sT+dT92yHm/E+1zre9HNjEprZTjfDOkagSz2IAh1eKeIHGUaot7zMFRu9/aCI2p2EETAtZDja+H2fAT1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.80.198) smtp.rcpttodomain=lists.xenproject.org
 smtp.mailfrom=xilinx.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=xilinx.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q0l0VgEygkT2jSFeBt8xFaCn5y1Wf34uWHniJq3qmLA=;
 b=C0Ky1AEdkgRFHlJ4CF/D4kbxyLopQkaC/2q91SW5iz0BJpBbW3+Iv2I5I3wW7VCU4E08dpgXUl/Ff88vv70ck6cROgOWUk1cn2+tcBonnCFFZM/RYR3gfihI/e0hEZEPNAkSI5X5XG6sopkp7jHNRsNBmU422ExH2PtvFQmy8hs=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.80.198)
 smtp.mailfrom=xilinx.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.80.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.80.198; helo=xir-pvapexch01.xlnx.xilinx.com;
From: Ayan Kumar Halder <ayan.kumar.halder@xilinx.com>
To: <xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>, <stefanos@xilinx.com>, <julien@xen.org>,
	<Volodymyr_Babchuk@epam.com>, <bertrand.marquis@arm.com>, Ayan Kumar Halder
	<ayankuma@xilinx.com>
Subject: [XEN v6 0/3] xen/arm64: io: Decode ldr/str post-indexing instruction
Date: Wed, 2 Feb 2022 17:30:14 +0000
Message-ID: <20220202173017.48463-1-ayankuma@xilinx.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 414c7be7-6b18-42a2-5498-08d9e671b0f6
X-MS-TrafficTypeDiagnostic: CH2PR02MB6168:EE_
X-Microsoft-Antispam-PRVS:
	<CH2PR02MB6168F3E64A7F6C7B9630165BB2279@CH2PR02MB6168.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:5516;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Gwz0cKObIpaSIZFN1eCEo/AjZUJGIr+77ZTunuOzKEfDd35AcuXN3cZV91f1Z5/5zIPJMz3OgfbczYxXsDkvFw67Nwi6AhRmEB8cexVrsn9PenjX11Ftcl7z9wHeslSa03hFWjkdqEvMH60651DuEoFMW3754AcDZ/6RXWxudLL0++DxAJAsnsEMSbdoSzsH7b0zc4LzHRPaDeVuwYbF9YD9FAyysdeJGI9zDH5D680spKt4iUPEOFYAl+4aYqTWFQhl3wyOyGuB8helqNbMdNl+ieQ0AJQZ+ZjYPQDkGPwu7BNoT+U3a5skYaZqKhWGLF7lZBIcuCwBjDJf4bcjw9iBO1sZ09NoKvq29i3xeXJYzhmWP2/5/tg7qNTtFlMrplSy6tjt4mXeidFy6N6cCBTfC+/ovZ5y1s0Y8vciNs281y5AsIHuv7AKcez7TZEfhgjl2OjFcVR1bM37DJ0qv4AGhgU7Vah9mLc5uTH+a2NezaBCtjYG1BXUdZsHdfIzd//Q23d1132SIjT7GScGkrgYqh7lImpQ55o5EGLr8+4JuIWdiLntvhXHwXk+6Hf0D1Cd5JnjTPmiobB7mArqHBzBhg4J5PG6PIhYpAPwXXvkTlm/se4Oe9h3KHLG6AztR2BgwhCZNtNVQbv2X4drpp1ftIlcYJjLJueOfq0AS1FgCopxRVQMNGP+Kg6Q6SXrLG3bs/ohOPDWcbkHd3H3cw==
X-Forefront-Antispam-Report:
	CIP:149.199.80.198;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:xir-pvapexch01.xlnx.xilinx.com;PTR:unknown-80-198.xilinx.com;CAT:NONE;SFS:(13230001)(4636009)(36840700001)(46966006)(6666004)(1076003)(26005)(2906002)(2616005)(8676002)(70586007)(8936002)(4326008)(5660300002)(186003)(82310400004)(7696005)(9786002)(107886003)(70206006)(36860700001)(47076005)(426003)(83380400001)(336012)(7636003)(508600001)(356005)(6916009)(316002)(36756003)(54906003)(102446001)(473944003);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Feb 2022 17:30:22.2543
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 414c7be7-6b18-42a2-5498-08d9e671b0f6
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.80.198];Helo=[xir-pvapexch01.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1NAM02FT016.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR02MB6168

Hi All,

I have split "[XEN v5] xen/arm64: io: Decode ldr/str post-indexing instructions"
into the following three patches :-

Ayan Kumar Halder (3):
  xen/arm64: Decode ldr/str post increment operations
  xen/arm64: io: Support instructions (for which ISS is not valid) on
    emulated MMIO region using MMIO handler
  xen/arm64: io: Support instructions (for which ISS is not valid) on
    emulated MMIO region using ioreq handler

The third patch introduces quite a bit of complexity. So, I decided to keep
it separate to ease the review and help me to understand better.

I haven't tested the patches. I am sending it out to get a feedback to see
if it is going in the correct direction.

 xen/arch/arm/arm32/traps.c       |  6 +++
 xen/arch/arm/arm64/traps.c       | 45 ++++++++++++++++
 xen/arch/arm/decode.c            | 81 +++++++++++++++++++++++++++-
 xen/arch/arm/decode.h            | 48 ++++++++++++++---
 xen/arch/arm/include/asm/mmio.h  | 17 ++++++
 xen/arch/arm/include/asm/traps.h |  2 +
 xen/arch/arm/io.c                | 92 ++++++++++++++++++++++++--------
 xen/arch/arm/ioreq.c             | 13 +++--
 xen/arch/arm/traps.c             | 56 ++++++++++++++++++-
 xen/include/public/hvm/ioreq.h   | 19 +++----
 10 files changed, 333 insertions(+), 46 deletions(-)

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
-- 
2.17.1


