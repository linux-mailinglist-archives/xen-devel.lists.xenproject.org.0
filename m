Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gNcFL80QC2pN/gQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 18 May 2026 15:14:53 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2512056D6B4
	for <lists+xen-devel@lfdr.de>; Mon, 18 May 2026 15:14:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1311849.1582013 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wOxns-00018A-8V; Mon, 18 May 2026 13:14:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1311849.1582013; Mon, 18 May 2026 13:14:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wOxns-000169-0j; Mon, 18 May 2026 13:14:40 +0000
Received: by outflank-mailman (input) for mailman id 1311849;
 Mon, 18 May 2026 13:14:39 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ross.lagerwall@citrix.com>) id 1wOxnr-00013G-0d
 for xen-devel@lists.xenproject.org; Mon, 18 May 2026 13:14:39 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wOxnq-003JoA-Cq
 for xen-devel@lists.xenproject.org; Mon, 18 May 2026 15:14:38 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <ross.lagerwall@citrix.com>)
 id 6a0b10b7-2eae-0a2a0a5409dd-0a2a4501bf3c-14
 for <xen-devel@lists.xenproject.org>; Mon, 18 May 2026 15:14:38 +0200
Received: from [52.101.56.22]
 (helo=BN1PR04CU002.outbound.protection.outlook.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <ross.lagerwall@citrix.com>)
 id 6a0b10b9-c1f2-0a2a45010019-346538161449-3
 for <xen-devel@lists.xenproject.org>; Mon, 18 May 2026 15:14:34 +0200
Received: from CH8PR03MB8274.namprd03.prod.outlook.com (2603:10b6:610:2ba::5)
 by BY5PR03MB5111.namprd03.prod.outlook.com (2603:10b6:a03:1e2::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.24; Mon, 18 May
 2026 13:14:31 +0000
Received: from CH8PR03MB8274.namprd03.prod.outlook.com
 ([fe80::ebe2:32c1:d2be:a096]) by CH8PR03MB8274.namprd03.prod.outlook.com
 ([fe80::ebe2:32c1:d2be:a096%7]) with mapi id 15.21.0025.022; Mon, 18 May 2026
 13:14:31 +0000
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=citrix.com header.i="@citrix.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QAy02tJS5b5VGRekoS78xeBonh4UNZzl91vKvy8cvS4092S7rn9iYdge2nQcGj/k2jFTdaxkRGR0xWlVgzq6vDEdIVYRatsH54YxLOlgRFXXMqku3nK+h6RYAutb5NbndrSI7VmV0SuHwkxSvZQZUgHaCnd0ezXwlodteT2GvsgrIXQ3Ox8TYH/Xk5KoFXcDMfTTqqx9b03CTAMISKWlAssgs9uylnI81X1k7v6ofKDZZN+gKLWkMg8Vut4t5mrjMZynbKewnBHenXlbzk0o9CeTYAMPWBnLFG6kdpTz8SpDneY5EWZT0jVpmZPyYrntjv9Oegy9pteCFgu10kC08A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=py92D7T6ajUs/lftz0hxd7Va7hBBB94kwza6iTYKzCg=;
 b=WQTfwzApEro7Xe9pkuynshJJYYNh1oTAri6T4k6o+Cy3KC9HhR9BVjmSdcwS7UDwUrct2k1M80QRiNetdw3daNtmmaR3Ytd+LlvvLcn4KZbEcdqfk5jcl2tgolh9Hi2Kx33tLNpWNKpxNTxTxfDlf831w58H6a5OoKRBFCHsP0dsjprx2NKpQo7PUoIZu85QW757k4JT4zwBEtGIQb0oamlAimEupf8sobp4zpOxaOKLioEU7Hy9LHJDSXnN1DcKJes3Bc1uxYrbbVfxcrm1imyMkjzfxb3rdKTiE4RhL+W6v6qA8pZHSn+0GIUZECH6jXvs4v+4hU6tZPgh8CBk3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=py92D7T6ajUs/lftz0hxd7Va7hBBB94kwza6iTYKzCg=;
 b=fy8+EXebDbMhWkGEaI5YMwVV0S59T76fT46bgD8unDyQlo+RE978X1kXeeCTLFoLS1XK02UsE2A5890DlL1Iaq6bbhpesDxwxWvCBgeN43FygSmqvL3XdJT27ZXc/M1xApZtURdLB33y3XhEqw0Z8zQEnl7p5OaX2x0CNDr+GvQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Ross Lagerwall <ross.lagerwall@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Ross Lagerwall <ross.lagerwall@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Jason Andryuk <jason.andryuk@amd.com>,
	Teddy Astie <teddy.astie@vates.tech>
Subject: [RFC v1 5/7] x86/hvm: Move INSTR_* constants to hvm.h
Date: Mon, 18 May 2026 14:14:02 +0100
Message-ID: <20260518131404.3716969-6-ross.lagerwall@citrix.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260518131404.3716969-1-ross.lagerwall@citrix.com>
References: <20260518131404.3716969-1-ross.lagerwall@citrix.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0370.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18e::15) To CH8PR03MB8274.namprd03.prod.outlook.com
 (2603:10b6:610:2ba::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8274:EE_|BY5PR03MB5111:EE_
X-MS-Office365-Filtering-Correlation-Id: 5b5df522-df46-421b-b7a3-08deb4df65e4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|22082099003|56012099003|18002099003|3023799003|11063799003;
X-Microsoft-Antispam-Message-Info:
	e9y3u0Qr3nxsz/plYe7lyNk9Qm5G1NkE4hJSHRLwAxhiStA5U04bK8Pdgb2mfM1nj/7FLFQw468UOiseS9NX8RgZq1fzTRRL/ckndQ0bWMxXUnKalGzP1Hfc9jde6NN2lrn38jNhjJJtzBZN09aJ0W8UBdHP8JP9X4IcuyrFJc/zV+L4vzWXHt7MsNO17kHBee+C21X98QbveqFh2EBP4J9AbHIKvU2JlkbCyqjFDI5Q7agncIz6c/wmComAH4PQWvcA1cWGqAFA7fCx4iNOcNHxZyOEt+rfzWU9tXFrRhDXAjmEswb7COgayy13TgQHLE1Nj09EVqR/DIVUFCpiXEBZzTg7iXZoBr1Um+hHRrfKjVm3AjDheGpqw5DJXHUzxxLSNjePDNxyZgteuhrCSF+zI821FGM8uZu/2mvhiasHKCVSBYQ2fsV+vOLZ9QtROuocBkOBuZg3GPLbDh8h8/5UBwt4BwOsIXSSkAAypcCYdZkgn1BzhilEd+5y4ff8Fl99iv6ekiFDb66SNAei8Fw+fhrLVxnWxdAzVa/lvqlhEF4ZekiT4oEPAoiG91eCOvcC2CQwYhg505OjX8iI4wwI0zmHiBHB8vbGGqhXG7eb2jHVTNYL9lzlLjCif/L62giEkhZXdm/420tx2rVarEAZz+NtvP4+XVNPOCJQchh5e9ScyO3b/P2QmOJ0hlLZ
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8274.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(22082099003)(56012099003)(18002099003)(3023799003)(11063799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Z5iGAc4L4eeMxVQMQNGJdXt/TT5WGMxFcyQ8piwPo1dXEqe7NfGtbcAFd8Cz?=
 =?us-ascii?Q?bXjUOXxF1rJ/NnJTfa/BYG+/L6XeJOclIq/OZTP+g4ld96R02dDX348zVuEA?=
 =?us-ascii?Q?ZrX2IqxLzmSNcsHSzl5dGOQP8N91sA3kjcLUENEaG/tewhjCX2Vx+9P5vAL0?=
 =?us-ascii?Q?Amb2opucCthBneVvsj845lrDugkOpIxES0xSbEQ2Czx7mKhuLP7vA6rwC7wg?=
 =?us-ascii?Q?1ChCutz1awEH2OfCwTRfaxqOhYDeBsgI48eGCSR7/dVOHpM1waWpP4NahIvi?=
 =?us-ascii?Q?DV0FEXrs4m79K02n/0aPvPAIdBvvBMCXPOzk1EIH3uAe4LtYZYoP50nnsKpa?=
 =?us-ascii?Q?ESZtdzRU9m65V/HYpMsdmpjTtiJdwb/ULUITT6RficUrB6/hYTjO6zDgSbL3?=
 =?us-ascii?Q?7m0AVNhGu9QJLui1FStev0FD/F0QoZXTbGIfKxxOeHIv3rQ5DGWOZcyQSSzo?=
 =?us-ascii?Q?OVwLeUixGsxkWLZhF50CgDwRoqhmh9dAus3N6Ek+ltvp4QAzksBjUzXAbHhZ?=
 =?us-ascii?Q?8Bc05Z1l8r+tlxY0jQIp8JUx70B+fw6bRXjuHebjudgNxUcLPeQCrB2uDaHZ?=
 =?us-ascii?Q?VKg3c5CI9ol0lf4j8N06kBQe8HbeZAbFfpYFieNXVhhRGXYNxHoCRgPD8YoH?=
 =?us-ascii?Q?7EGs6TmSY4dxveOZU5Q9taf+LOGyE6kquijzui5YQ5DXt53FGc5/y5R8bXDG?=
 =?us-ascii?Q?xF8Xeh+L7fINGhZjwFK6e6amNTHr1DcNX3B/rDYK/9mrlcDVEZ5uPUeZ4OaO?=
 =?us-ascii?Q?HPTno+1bqZKHZyjjbVxLe5E8oHXPtU4TjClsZQzFo9S23+pDpWlLvC8xhPDY?=
 =?us-ascii?Q?aMDugjlwIkI1cwWgX21x1hHDqn7DPj+vWUSy6LMJAqcgRzG0ksgGBBJkU2R0?=
 =?us-ascii?Q?YoQARS7v+cqGXzMuL2ij438+KRWAehqQ/y70nHhGaoCE6cXdoMn8rXpU5bDi?=
 =?us-ascii?Q?2WYmQ8e7c1TZeLyN/mbKAsIS02qgGsU8wKKBZlGQqWPnwPvuLd512E6EzP3o?=
 =?us-ascii?Q?gFDGaKkPpHTAQbS4nMvxaXRW6JZpHQc6hSLXmLRVUTKsPTppmNlR7sYRMRYP?=
 =?us-ascii?Q?dCtQg66dHUbYqXWUVEJAjUX4z5H5gIwi66chpccHyb48Zh9KKD4+lvpFN104?=
 =?us-ascii?Q?NUIsMlxqgbDY0kJx94K0EuqsM6LSZ6Bvqh9tr4s2s1Ikoc3GkT981cq9jejv?=
 =?us-ascii?Q?sNmv6LR3B3uCDO0EvYp7mPijKY2z7V7cQ0WYkIKTkflWpBNmP8GnCseTmB/j?=
 =?us-ascii?Q?gMGGvrCFv5rH4Z/2xkuCOWQL8uxJa2T5uUfCEEIn9baSbgItLTOUZrL1hDTV?=
 =?us-ascii?Q?3PTvzX59PfAVCMXcJLy/pkf2oUR6iPZEgXS8xkdaFxuK4dYKbgTrSjDnigNg?=
 =?us-ascii?Q?PMnXBDLwohFDTHZ+1YA6w9z3MpLB2uOJOtw1kCGn5sSa6auqa9ph/J3wfUVX?=
 =?us-ascii?Q?UoBi0zc+PvmYPuCFkJhVnnK5U5dNANqHHvcLziKf4dAgcBdOZpcFtU8Y9r3J?=
 =?us-ascii?Q?YDth0dGv/tdvq52fmh4A1wZY6p9T+GN4NJJTKm7+ynpj9lckkS+jvDnRyI+z?=
 =?us-ascii?Q?yxtbTTJmQQSmOXdsrj4INfw3jNta59t4P7h1Ok+dO8irHgrUd5eUBl4cn7ZM?=
 =?us-ascii?Q?ThTMlq2mjQd8omZG4OEskp7wTqT6uuUVkrXStFLQg7vFYpmi0AhXqb6Lw98Z?=
 =?us-ascii?Q?MdbiC7FL3ywajUpbWBEDJzkSaqWXA3k1tqxJf/by+dJn5r/4XxLNdrypKMU6?=
 =?us-ascii?Q?8JqhHqiTm0XIdvSlqIqZ38D8JkmC0WQ=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b5df522-df46-421b-b7a3-08deb4df65e4
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8274.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 May 2026 13:14:31.5784
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cpfI7Cmvgxc0kl6iiC+3OatIvTGrfT6eLo59jbU9NwsWY7pI0zVfBuKAB9nPhEbEcbAwyp/vHI8nGxuv7WdE644X4KPcWYfXCX9ZhoW54Oc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR03MB5111
X-purgate-ID: tlsNG-d62444/1779110074-B4D49FF4-C251B081/0/0
X-purgate-type: clean
X-purgate-size: 4736
X-Rspamd-Queue-Id: 2512056D6B4
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.69 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[citrix.com:email,citrix.com:mid,citrix.com:dkim];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:ross.lagerwall@citrix.com,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:jason.andryuk@amd.com,m:teddy.astie@vates.tech,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[ross.lagerwall@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	FROM_NEQ_ENVFROM(0.00)[ross.lagerwall@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	DKIM_TRACE(0.00)[citrix.com:+];
	RCPT_COUNT_SEVEN(0.00)[7];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Action: no action

These aren't specific to SVM and will be used for emulator fast path so
move them to hvm.h.

Signed-off-by: Ross Lagerwall <ross.lagerwall@citrix.com>
---
 xen/arch/x86/hvm/svm/svm.h         | 29 -----------------------------
 xen/arch/x86/include/asm/hvm/hvm.h | 29 +++++++++++++++++++++++++++++
 2 files changed, 29 insertions(+), 29 deletions(-)

diff --git a/xen/arch/x86/hvm/svm/svm.h b/xen/arch/x86/hvm/svm/svm.h
index cfa411ad5ae1..f75bca7c5f66 100644
--- a/xen/arch/x86/hvm/svm/svm.h
+++ b/xen/arch/x86/hvm/svm/svm.h
@@ -36,35 +36,6 @@ static inline void svm_invlpga(unsigned long linear, uint32_t asid)
     asm volatile ( "invlpga" :: "a" (linear), "c" (asid) );
 }
 
-/*
- * Encoding for svm_get_insn_len().  We take X86EMUL_OPC() for the main
- * opcode, shifted left to make room for the ModRM byte.
- *
- * The Grp7 instructions have their ModRM byte expressed in octal for easier
- * cross referencing with the opcode extension table.
- */
-#define INSTR_ENC(opc, modrm) (((opc) << 8) | (modrm))
-
-#define INSTR_PAUSE      INSTR_ENC(X86EMUL_OPC_F3(0, 0x90), 0)
-#define INSTR_INT3       INSTR_ENC(X86EMUL_OPC(   0, 0xcc), 0)
-#define INSTR_ICEBP      INSTR_ENC(X86EMUL_OPC(   0, 0xf1), 0)
-#define INSTR_HLT        INSTR_ENC(X86EMUL_OPC(   0, 0xf4), 0)
-#define INSTR_XSETBV     INSTR_ENC(X86EMUL_OPC(0x0f, 0x01), 0321) /* octal-ok */
-#define INSTR_VMRUN      INSTR_ENC(X86EMUL_OPC(0x0f, 0x01), 0330) /* octal-ok */
-#define INSTR_VMCALL     INSTR_ENC(X86EMUL_OPC(0x0f, 0x01), 0331) /* octal-ok */
-#define INSTR_VMLOAD     INSTR_ENC(X86EMUL_OPC(0x0f, 0x01), 0332) /* octal-ok */
-#define INSTR_VMSAVE     INSTR_ENC(X86EMUL_OPC(0x0f, 0x01), 0333) /* octal-ok */
-#define INSTR_STGI       INSTR_ENC(X86EMUL_OPC(0x0f, 0x01), 0334) /* octal-ok */
-#define INSTR_CLGI       INSTR_ENC(X86EMUL_OPC(0x0f, 0x01), 0335) /* octal-ok */
-#define INSTR_INVLPGA    INSTR_ENC(X86EMUL_OPC(0x0f, 0x01), 0337) /* octal-ok */
-#define INSTR_RDTSCP     INSTR_ENC(X86EMUL_OPC(0x0f, 0x01), 0371) /* octal-ok */
-#define INSTR_INVD       INSTR_ENC(X86EMUL_OPC(0x0f, 0x08), 0)
-#define INSTR_WBINVD     INSTR_ENC(X86EMUL_OPC(0x0f, 0x09), 0)
-#define INSTR_WRMSR      INSTR_ENC(X86EMUL_OPC(0x0f, 0x30), 0)
-#define INSTR_RDTSC      INSTR_ENC(X86EMUL_OPC(0x0f, 0x31), 0)
-#define INSTR_RDMSR      INSTR_ENC(X86EMUL_OPC(0x0f, 0x32), 0)
-#define INSTR_CPUID      INSTR_ENC(X86EMUL_OPC(0x0f, 0xa2), 0)
-
 unsigned int svm_get_insn_len(struct vcpu *v, unsigned int instr_enc);
 unsigned int svm_get_task_switch_insn_len(void);
 
diff --git a/xen/arch/x86/include/asm/hvm/hvm.h b/xen/arch/x86/include/asm/hvm/hvm.h
index e7c1364802f8..a9b64814ca71 100644
--- a/xen/arch/x86/include/asm/hvm/hvm.h
+++ b/xen/arch/x86/include/asm/hvm/hvm.h
@@ -851,6 +851,35 @@ static inline void hvm_sync_pir_to_irr(struct vcpu *v)
         alternative_vcall(hvm_funcs.sync_pir_to_irr, v);
 }
 
+/*
+ * Encoding for svm_get_insn_len().  We take X86EMUL_OPC() for the main
+ * opcode, shifted left to make room for the ModRM byte.
+ *
+ * The Grp7 instructions have their ModRM byte expressed in octal for easier
+ * cross referencing with the opcode extension table.
+ */
+#define INSTR_ENC(opc, modrm) (((opc) << 8) | (modrm))
+
+#define INSTR_PAUSE      INSTR_ENC(X86EMUL_OPC_F3(0, 0x90), 0)
+#define INSTR_INT3       INSTR_ENC(X86EMUL_OPC(   0, 0xcc), 0)
+#define INSTR_ICEBP      INSTR_ENC(X86EMUL_OPC(   0, 0xf1), 0)
+#define INSTR_HLT        INSTR_ENC(X86EMUL_OPC(   0, 0xf4), 0)
+#define INSTR_XSETBV     INSTR_ENC(X86EMUL_OPC(0x0f, 0x01), 0321) /* octal-ok */
+#define INSTR_VMRUN      INSTR_ENC(X86EMUL_OPC(0x0f, 0x01), 0330) /* octal-ok */
+#define INSTR_VMCALL     INSTR_ENC(X86EMUL_OPC(0x0f, 0x01), 0331) /* octal-ok */
+#define INSTR_VMLOAD     INSTR_ENC(X86EMUL_OPC(0x0f, 0x01), 0332) /* octal-ok */
+#define INSTR_VMSAVE     INSTR_ENC(X86EMUL_OPC(0x0f, 0x01), 0333) /* octal-ok */
+#define INSTR_STGI       INSTR_ENC(X86EMUL_OPC(0x0f, 0x01), 0334) /* octal-ok */
+#define INSTR_CLGI       INSTR_ENC(X86EMUL_OPC(0x0f, 0x01), 0335) /* octal-ok */
+#define INSTR_INVLPGA    INSTR_ENC(X86EMUL_OPC(0x0f, 0x01), 0337) /* octal-ok */
+#define INSTR_RDTSCP     INSTR_ENC(X86EMUL_OPC(0x0f, 0x01), 0371) /* octal-ok */
+#define INSTR_INVD       INSTR_ENC(X86EMUL_OPC(0x0f, 0x08), 0)
+#define INSTR_WBINVD     INSTR_ENC(X86EMUL_OPC(0x0f, 0x09), 0)
+#define INSTR_WRMSR      INSTR_ENC(X86EMUL_OPC(0x0f, 0x30), 0)
+#define INSTR_RDTSC      INSTR_ENC(X86EMUL_OPC(0x0f, 0x31), 0)
+#define INSTR_RDMSR      INSTR_ENC(X86EMUL_OPC(0x0f, 0x32), 0)
+#define INSTR_CPUID      INSTR_ENC(X86EMUL_OPC(0x0f, 0xa2), 0)
+
 #else  /* CONFIG_HVM */
 
 #define hvm_enabled false
-- 
2.53.0


