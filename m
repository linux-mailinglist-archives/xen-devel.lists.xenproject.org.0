Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eDWEI88QC2pN/gQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 18 May 2026 15:14:55 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 43DE156D6CB
	for <lists+xen-devel@lfdr.de>; Mon, 18 May 2026 15:14:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1311851.1582022 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wOxnt-0001Nm-Ch; Mon, 18 May 2026 13:14:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1311851.1582022; Mon, 18 May 2026 13:14:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wOxnt-0001KS-8n; Mon, 18 May 2026 13:14:41 +0000
Received: by outflank-mailman (input) for mailman id 1311851;
 Mon, 18 May 2026 13:14:40 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ross.lagerwall@citrix.com>) id 1wOxnr-00015y-Tq
 for xen-devel@lists.xenproject.org; Mon, 18 May 2026 13:14:40 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wOxnr-003JoA-9e
 for xen-devel@lists.xenproject.org; Mon, 18 May 2026 15:14:39 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <ross.lagerwall@citrix.com>)
 id 6a0b10b7-2eae-0a2a0a5409dd-0a2a4501bf3c-22
 for <xen-devel@lists.xenproject.org>; Mon, 18 May 2026 15:14:39 +0200
Received: from [52.101.56.22]
 (helo=BN1PR04CU002.outbound.protection.outlook.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <ross.lagerwall@citrix.com>)
 id 6a0b10b9-c1f2-0a2a45010019-346538161449-4
 for <xen-devel@lists.xenproject.org>; Mon, 18 May 2026 15:14:38 +0200
Received: from CH8PR03MB8274.namprd03.prod.outlook.com (2603:10b6:610:2ba::5)
 by BY5PR03MB5111.namprd03.prod.outlook.com (2603:10b6:a03:1e2::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.24; Mon, 18 May
 2026 13:14:36 +0000
Received: from CH8PR03MB8274.namprd03.prod.outlook.com
 ([fe80::ebe2:32c1:d2be:a096]) by CH8PR03MB8274.namprd03.prod.outlook.com
 ([fe80::ebe2:32c1:d2be:a096%7]) with mapi id 15.21.0025.022; Mon, 18 May 2026
 13:14:36 +0000
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
 b=XmsVF3aYBfqvy99Xv4+jX4KNqikN8LFoFqMES4Q9hvZFSp70qTQx/p8W0du4KnojDHL3aXLhiTBH+/z8CBK2TStTgtL1EGKy5M54Lzft48Pr2K4NPguJTh3aXeHfsXchOewzlCvygM9c2TMlIVRHAdrgIEGGAamWVJ9ZGKI5wJeiugYgRv201zFULbsguEbk78ExtuW+XTnPRbt7roDK8NDWw4bqqcnWNNWylwfoXEow1HaCJK1OJGOLQPZElpqpItzSFzOBVX1qyMKdb3tkDxl64Ug5j7gEU7AIRD9sFBimtQDUhcCx8NgNcMjoIzriFLgq2KfJlNKk9S8soKwlpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KoDhQ+7axytwqMbd7TZEfHbYAtFgt+F6pamrfRpBcS0=;
 b=MD2rGGtvtRIZKSA96jkyFYJPJfbta0QpxkKvos79FM882DUde9XC4AOZSevOyQUkcKYzeDsWJNwJIsDnaJTAWptBXrWrDi2TEdbB0puBCDG4K/oOUxnUDk6eYBr6yqjwj/LkgCEQ4Dq1mcxmu4RTZRm0eXSDjmewXrR2M5yymWav3RKcELJaQ6k3uiTXTfmOXMObWOADuhvm1aXPvGoC+bhsC/3KCPfeHV10XP2zwcX/K5NMQsz3d1X9tpzpFwL8XPtZLb71SuRLqv+LINtsZTrUPIKPcfSKUarY0aAWidWg8jcmOPUtjEaZLA4SWXh+ySqMQoKUVfZY+eBtpsV1zw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KoDhQ+7axytwqMbd7TZEfHbYAtFgt+F6pamrfRpBcS0=;
 b=ag3tNsGfO8D2KzYDipOZKxUrAWdazynABCS5a7ACk85ce89hYoRd6NIR8HUOikaY3okPgl6IMoCLaCggk2JIHZPRPDyHI82JEARGdUq2QvqluiL7WQEK9Myg3Yvxkpr07Wy1vTUPKk4t7f92mE9ttL9VFNgbpjxgvIMU1gG8R1w=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Ross Lagerwall <ross.lagerwall@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Ross Lagerwall <ross.lagerwall@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Teddy Astie <teddy.astie@vates.tech>,
	Jason Andryuk <jason.andryuk@amd.com>
Subject: [RFC v1 6/7] x86/svm: Use the emulator path for VMEXIT_HLT
Date: Mon, 18 May 2026 14:14:03 +0100
Message-ID: <20260518131404.3716969-7-ross.lagerwall@citrix.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260518131404.3716969-1-ross.lagerwall@citrix.com>
References: <20260518131404.3716969-1-ross.lagerwall@citrix.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0373.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18e::18) To CH8PR03MB8274.namprd03.prod.outlook.com
 (2603:10b6:610:2ba::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8274:EE_|BY5PR03MB5111:EE_
X-MS-Office365-Filtering-Correlation-Id: 132fa3f7-db45-45df-61f4-08deb4df689d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|22082099003|56012099003|18002099003|11063799003;
X-Microsoft-Antispam-Message-Info:
	UsW46sa84rLqLcB3/ncT0KO13TjkveqYENur/yNER1L6i1zD9NdfnxkRO9j3u7DKZER4Ji1V/VcLf6F0UKoDR88Avo4MAxuV2xBYD49F+aW/cXDrA97GpYPyt4y8zvOx2zi2iVy4RqAvxSJjjsp7+DKNQHe0CSZFVVFMnIQpc38xL3aDlU9f302kHH9084dA0zTG9yozsMq6yReKh21FWGmh65DhEnJYBh5jUWN34ZQF5MUe4CnHU+QA/GhY0YiWaGeVlWnkY0X/H8MHThbp28fHTzdiWvqtwPnrZzUbOzR4zYMM2ggcDfK2AC9uBj1cJSAcG2AGbcWKBv97zjRnir8X8/My5Nj30iGD8mkgpWKICGkMbTISuNMt/mwjjIJTR+bdXCrqg+JCxorcW59PPMeIZwboqbd+DIm4q7DMOlwlxGHwukQAitZXhFj8NTdaq6/RdUjsj5fQ/7sfV1EXDrryc6hAwSJANfGQfDmhEZenYG2kpkpa1qH08cOeWAZ5uURNFRheSj+/JoMlF/i9Hz/HlkrmuLVHx7TPtqs+29S85M4UR7YCz5IVlcr2gpGBDVK+90gz4swaKIcecx6i41Wea0H2AakhRORgMtudg+vk3ShEmzuypVEbPn0haO/1UTo3XLlGXTMkUvLp8RjQkyBhMyVWfkgMKIFTwMfQT636PpjiLJq6tt8GmdsPAdUg
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8274.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(22082099003)(56012099003)(18002099003)(11063799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?4UjIJmNSDMEk/43vFr6s590TZS+r9thMXUH6lLJlRLFynCfvRwkJ68Rw4c1W?=
 =?us-ascii?Q?Uq6H2GHacCEA2plfZtl6H4DYQ/s/G08ZiCV8X6wdv7Dzq2UPziuUeT43+It1?=
 =?us-ascii?Q?uIvjOcNbX+7X/BkHUmyq3H/1lVHjy65wwAGAbi8w2ZLus00XbUaNHxFhPTwT?=
 =?us-ascii?Q?2V+9D2Wr2ULUVDoQV9e+flV5H0XvAixSw0Np2F4+K/ZJhhSxtCKQX8B2Daxv?=
 =?us-ascii?Q?sYeruix1OytkzeUBBY/RfcqkgMEwIFTqMJKnZvIspy6zDRKhS37I50aCYKcS?=
 =?us-ascii?Q?7spOSgEelgce8c6LlBmK5NXRC1Zb/f/FkhB2/dbZcMi1HcJBcPgu8RX5B+Q1?=
 =?us-ascii?Q?vnd3OqLxa8EYvraVqfSSPN0vonRTE0pygZnkZwI+t1Xt4THwiwvvTOfjsVQm?=
 =?us-ascii?Q?qKgMCENRuR8Lmxg3bIyaDxEGcKWyxEOqkxBxO2W0lI8/IFg46GFgEw17aDg1?=
 =?us-ascii?Q?7GWRR6wYHUx15MZMw+G3JCK9iFzMIKM0DM1N7N+dYA9KHGiw9BLZVvf+IVID?=
 =?us-ascii?Q?Ny5rLBSYgAG/hWEyLXfTtcJbpPf7sPO+oARbAUe6Zsl9IujWrEf4ELziWRhs?=
 =?us-ascii?Q?4Dlm+vxFZTICp/RFsfjOqE33AMd2Ti9r2veiYPWizAq2oG72V4WUKBEWXlPf?=
 =?us-ascii?Q?FwG1GoT44AMJsvkYKRQQR2uoI3/TMJvXdExtF2Ey2LPGVbLBes3GvNSL2tyq?=
 =?us-ascii?Q?l2Ryytq5+KcgpBWLYwtx/fXEjZ7BfdNCuETNlyY3wZXQhe3gnIvRuFNdFzA+?=
 =?us-ascii?Q?PMM/Gpulk/UxhZPJ0fXMjn8K1ynYG6MFEJJgSvXzmTbJ1fHWnSQlYffeciNI?=
 =?us-ascii?Q?JDM/hZXJhY5bP8D9w4v2MHKcW1aOSbD9Fh5I+w7WfG+QIxafojW4/Ql6G2Jl?=
 =?us-ascii?Q?oQH4B+ioTiuw6hSQ6yDClmltWkp9fa2Nm8GPFMXQ/VbtUjKszfetSrJifB+w?=
 =?us-ascii?Q?bSKsoluF5y/XuE8TA6nSNjdwN72Y38jdhL5St+pNwTFFRml5872SlMnrzbFH?=
 =?us-ascii?Q?x4IxR6KcKpJznPaCEQXR00bIdgjx2RrObFHAuYEJROltLPKztOu6BmHC9ijc?=
 =?us-ascii?Q?+n4/8PEvKxvFN8JJJNIcSmDM9WJqU0jZmesN2iRm3+iE57Xg3gQOnXYJoFYk?=
 =?us-ascii?Q?pcDLnIv1LZi1VripA0VLef9mrpm5HZ1BpTJT/1DFNYCOdqmc/tNCLhbNg5ry?=
 =?us-ascii?Q?/zbWIw40sZysj01PZPiZR/7ZFhRrtQ1MRwwwma0fwZp0jatk1dI4jxucIaOW?=
 =?us-ascii?Q?Yf3Wn1FiN1T2i+hPE5pDxCiCcugjP8BMZMxltnJOm9R3CN64UKxTANLPPdIC?=
 =?us-ascii?Q?aI1U5EEuvP30L3jkwT8ls6YUa4mbZ9AlojKIR+ZbEzd0RQUy/z/SymdKSiHD?=
 =?us-ascii?Q?1mvN0/yaF4HNBsvvbAQg9jWI6QTa0Elxn5GrEB0Jgtuvg3OVoQ+ETr5KPkZj?=
 =?us-ascii?Q?sbpIFhqJGup8dxRJi0lB92HDhEiL1O8H223RFfewwzNRKuoCjKB6jC4EpyRM?=
 =?us-ascii?Q?b/bOpy4JxpN8cm2b8LgefFtz75czlHjz2UG/CvD7JqZCOs5qbR4ybEOGHG7H?=
 =?us-ascii?Q?d7TWnT381pCzaEMonswFfDR3x3ZLiMKweBPHbpoKpXuDi7K7yMf6vfO+mgdC?=
 =?us-ascii?Q?LePAteObyYYaPGP/DNZKAK/fZ6zU1NcBk/fMOonY+wxORsNEmi9x/0f8Q6iS?=
 =?us-ascii?Q?O2Tbs2IiesaX0NjCE7yG+JCStrzWrK6IAWjt9aVKuN9xkXP3JoSRzlAPjNTS?=
 =?us-ascii?Q?GU7jL92p2oB/xiodKDmluLZGCdzVjk0=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 132fa3f7-db45-45df-61f4-08deb4df689d
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8274.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 May 2026 13:14:35.9885
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: l9LaQ+Lp6UYvnC26wCYopAKCf8fyT/fRHJpFpXD/cIUE/SLjYFK4cnq/+/X+dTnch0EO2vhbKw0IDI5zSG/CeVRGNioctBw0J567IkUyrY0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR03MB5111
X-purgate-ID: tlsNG-d62444/1779110079-ACA50FF4-FF3DD081/0/0
X-purgate-type: clean
X-purgate-size: 3664
X-Rspamd-Queue-Id: 43DE156D6CB
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.69 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[citrix.com:email,citrix.com:mid,citrix.com:dkim];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:ross.lagerwall@citrix.com,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,m:jason.andryuk@amd.com,s:lists@lfdr.de];
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

Signed-off-by: Ross Lagerwall <ross.lagerwall@citrix.com>
---
 xen/arch/x86/hvm/emulate.c     |  5 +++++
 xen/arch/x86/hvm/svm/emulate.c |  2 +-
 xen/arch/x86/hvm/svm/svm.c     | 24 +++++++++++-------------
 xen/arch/x86/hvm/svm/svm.h     |  1 +
 4 files changed, 18 insertions(+), 14 deletions(-)

diff --git a/xen/arch/x86/hvm/emulate.c b/xen/arch/x86/hvm/emulate.c
index c9553cd28238..471c032c1e9c 100644
--- a/xen/arch/x86/hvm/emulate.c
+++ b/xen/arch/x86/hvm/emulate.c
@@ -2800,6 +2800,11 @@ static int _hvm_emulate_one(struct hvm_emulate_ctxt *hvmemul_ctxt,
 
         switch ( hvmemul_ctxt->insn )
         {
+        case INSTR_HLT:
+            hvmemul_ctxt->ctxt.retire.hlt = true;
+            rc = X86EMUL_OKAY;
+            break;
+
         default:
             ASSERT_UNREACHABLE();
             rc = X86EMUL_UNHANDLEABLE;
diff --git a/xen/arch/x86/hvm/svm/emulate.c b/xen/arch/x86/hvm/svm/emulate.c
index 1dd830a31bd7..31f3cd88a858 100644
--- a/xen/arch/x86/hvm/svm/emulate.c
+++ b/xen/arch/x86/hvm/svm/emulate.c
@@ -16,7 +16,7 @@
 #include "svm.h"
 #include "vmcb.h"
 
-static unsigned long svm_nextrip_insn_length(struct vcpu *v)
+unsigned long svm_nextrip_insn_length(struct vcpu *v)
 {
     struct vmcb_struct *vmcb = v->arch.hvm.svm.vmcb;
 
diff --git a/xen/arch/x86/hvm/svm/svm.c b/xen/arch/x86/hvm/svm/svm.c
index f49d2ebbfdd5..2d6022d6238c 100644
--- a/xen/arch/x86/hvm/svm/svm.c
+++ b/xen/arch/x86/hvm/svm/svm.c
@@ -2051,18 +2051,6 @@ static void svm_do_msr_access(struct cpu_user_regs *regs)
         hvm_inject_hw_exception(X86_EXC_GP, 0);
 }
 
-static void svm_vmexit_do_hlt(struct vmcb_struct *vmcb,
-                              struct cpu_user_regs *regs)
-{
-    unsigned int inst_len;
-
-    if ( (inst_len = svm_get_insn_len(current, INSTR_HLT)) == 0 )
-        return;
-    __update_guest_eip(regs, inst_len);
-
-    hvm_hlt(regs->eflags);
-}
-
 static void svm_vmexit_do_rdtsc(struct cpu_user_regs *regs, bool rdtscp)
 {
     struct vcpu *curr = current;
@@ -2363,6 +2351,13 @@ static void cf_check svm_set_reg(struct vcpu *v, unsigned int reg, uint64_t val)
     }
 }
 
+static void svm_emulate_one(struct hvm_emulate_ctxt *ctxt)
+{
+    ctxt->insn_len = svm_nextrip_insn_length(current);
+    if ( !hvm_emulate_one_ctxt(ctxt) )
+        hvm_inject_hw_exception(X86_EXC_GP, 0);
+}
+
 static struct hvm_function_table __initdata_cf_clobber svm_function_table = {
     .name                 = "SVM",
     .cpu_up_prepare       = svm_cpu_up_prepare,
@@ -2496,6 +2491,7 @@ void asmlinkage svm_vmexit_handler(void)
     vintr_t intr;
     bool vcpu_guestmode = false;
     struct vlapic *vlapic = vcpu_vlapic(v);
+    struct hvm_emulate_ctxt ctxt;
 
     regs->rax = vmcb->rax;
     regs->rip = vmcb->rip;
@@ -2840,7 +2836,9 @@ void asmlinkage svm_vmexit_handler(void)
     }
 
     case VMEXIT_HLT:
-        svm_vmexit_do_hlt(vmcb, regs);
+        hvm_emulate_init_once(&ctxt, NULL, NULL, regs);
+        ctxt.insn = INSTR_HLT;
+        svm_emulate_one(&ctxt);
         break;
 
     case VMEXIT_IOIO:
diff --git a/xen/arch/x86/hvm/svm/svm.h b/xen/arch/x86/hvm/svm/svm.h
index f75bca7c5f66..9422dbd38a78 100644
--- a/xen/arch/x86/hvm/svm/svm.h
+++ b/xen/arch/x86/hvm/svm/svm.h
@@ -36,6 +36,7 @@ static inline void svm_invlpga(unsigned long linear, uint32_t asid)
     asm volatile ( "invlpga" :: "a" (linear), "c" (asid) );
 }
 
+unsigned long svm_nextrip_insn_length(struct vcpu *v);
 unsigned int svm_get_insn_len(struct vcpu *v, unsigned int instr_enc);
 unsigned int svm_get_task_switch_insn_len(void);
 
-- 
2.53.0


