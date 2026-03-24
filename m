Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2En7I+PVwmnmmgQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 24 Mar 2026 19:20:19 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0807831AACC
	for <lists+xen-devel@lfdr.de>; Tue, 24 Mar 2026 19:20:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1261257.1554374 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w56MO-0006MZ-BM; Tue, 24 Mar 2026 18:20:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1261257.1554374; Tue, 24 Mar 2026 18:20:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w56MO-0006KP-5s; Tue, 24 Mar 2026 18:20:12 +0000
Received: by outflank-mailman (input) for mailman id 1261257;
 Tue, 24 Mar 2026 18:20:11 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ross.lagerwall@citrix.com>) id 1w56MM-0006I1-Uk
 for xen-devel@lists.xenproject.org; Tue, 24 Mar 2026 18:20:11 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w56MM-00DbE3-Ae
 for xen-devel@lists.xenproject.org; Tue, 24 Mar 2026 19:20:10 +0100
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <ross.lagerwall@citrix.com>)
 id 69c2d5cc-e002-0a2a0a5209dd-0a2a450b9002-28
 for <xen-devel@lists.xenproject.org>; Tue, 24 Mar 2026 19:20:10 +0100
Received: from [52.101.57.18]
 (helo=BN8PR05CU002.outbound.protection.outlook.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.55.2)
 (envelope-from <ross.lagerwall@citrix.com>)
 id 69c2d5d9-ef63-0a2a450b0019-346539127a17-3
 for <xen-devel@lists.xenproject.org>; Tue, 24 Mar 2026 19:20:10 +0100
Received: from CH8PR03MB8274.namprd03.prod.outlook.com (2603:10b6:610:2ba::5)
 by CH4PR03MB7771.namprd03.prod.outlook.com (2603:10b6:610:237::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.25; Tue, 24 Mar
 2026 18:20:07 +0000
Received: from CH8PR03MB8274.namprd03.prod.outlook.com
 ([fe80::ebe2:32c1:d2be:a096]) by CH8PR03MB8274.namprd03.prod.outlook.com
 ([fe80::ebe2:32c1:d2be:a096%5]) with mapi id 15.20.9745.019; Tue, 24 Mar 2026
 18:20:07 +0000
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
 b=BAZ6xyLBtsa7GULaAad4+dehTOVa4o90GKBDTqA7vGf9/G7TR+XMfTcCNeOgD6uYSMS8fS9cFlVOlygeBGF7U5lTWh93A/KAskaKiztqg53BzDatbPjyGsbaQfcQmI7YtuAUrx5O1JLdS6bq/yZbnpcdirLVkDpeuJ7RL8Fyy5GAGXQCgf/UhF8B9NkdptcxAI2WJ+WbR5x4du7jzytnLaIw2DMh4xH101cdiLMrtj0VsEtvZG2ONFz0r1Gqr9xyAsBibitcg59BZryKTuTbXf6OBkVnh5hOmvPJYo7wu1qQffPs+S5QNRh+xZiZGfVTgE4v2sT4RoipqGqwuEssXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X62vJSapLR1Eexll3f19ciTMiElOQaxc2nc9kog+l+E=;
 b=AdakxBCKaUiAr86EkSsF9pCLAMKnOv8fJFcKtUCSG1KMqIziGSaCRAG3RZSXZHMEW7oY27zFQVDoyUlLEQ8pr9NvIGhO476RglIWbWKb43dfmRl1kl0jsZ6zLhnZFljzPmxc8DGysF1VW2IqXg/rjngltRREq9y0LiTdRUz0eMeii5985PKN/bOdf3qK1xOUZYA+QpOo4pAQ0piypJAXPpSnXCHCiW9LMpMGRqucGLJ+A1HPbDyhIDYYYZVnOW7ca0CamgaeV17mYaLOFUbNc6e50Yh6tCdXGmXBVCgjrUlgibNDxYRsOuZ+WhgQDvV9qX+E3zszwznYW2RFwClaSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X62vJSapLR1Eexll3f19ciTMiElOQaxc2nc9kog+l+E=;
 b=onpaLGxjvTXxlrALxxITQaThYlST1TZ1uCPdqX8lLDFWnOIpJ3CDOSPrfLqE0127clcqpawVYM0hXi6XHpf0pQiJg2+iH8DYMt6PA9rgLB+sWQADGsI8hbj9IhgxFZwSsQHHKPp6MVyaoEPaZ2igoUsaroBOV5LUK9BQ5+fBHQY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Ross Lagerwall <ross.lagerwall@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Ross Lagerwall <ross.lagerwall@citrix.com>
Subject: [PATCH v2 6/9] x86: Remove fully_eager_fpu
Date: Tue, 24 Mar 2026 18:19:34 +0000
Message-ID: <20260324181937.2465574-7-ross.lagerwall@citrix.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260324181937.2465574-1-ross.lagerwall@citrix.com>
References: <20260324181937.2465574-1-ross.lagerwall@citrix.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0608.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:314::8) To CH8PR03MB8274.namprd03.prod.outlook.com
 (2603:10b6:610:2ba::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8274:EE_|CH4PR03MB7771:EE_
X-MS-Office365-Filtering-Correlation-Id: fe078d2c-df9f-48a1-4fd6-08de89d1fa21
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	jz853MfTvqzXClK6gliJjELwZiNAKAQrK5pRwpxGOAgHR2nBBOnhtqP/f+pZunJawo/c9w3R7LA4xl9OTxMMf0cJoGuEXaF+8fN0LmgNHFPyIJwoJEiBBt11Ye/izt0Lk10W+wtiajS8IG3dV6E7htb5fVUVspLIccRO+W/oM0SaTVYYWFe6M14ru4QbPKv9ZBgyil7DjfUNcGMXbBB4EGL7mL+ybKMPtRQHy4hPfzX80DEp3/RaCEQ/awysCM2BHNT/MYgalq4xbnjFRFLue3VG5KDA7OSifvgXAAtslHvObHCHYxHqXsjHlUd1PcLdbkW/G8L6lSogOcSOog5ipqfO/3lr8xK7aCmb4K9vXBQSSjeBynehB2votrZ2f8b4IFHsmySq3x2aiQURYJmY1awMbLXatnkEpKpCsDfj2QPtvI1a/RyZMyTBeDR6zGCTyfdSunHEpBKDr86CCKiC/BwwgIQzSJmq57GQUg8Fi+hx1S4Ro95FvQkuN0EKk1MdMQfKBMURG7wO2Jq/e+s0q8qBQWFUhnzXrGXtmysVznhhjVca4qxoNjbyY33NXx9uHE3E0u5f6dXbBCc5/+7puWMHh4uFaHZyuDMmDESaA9jVQoQ1+z52OOxv7eguoueFS5W7V3A+g+Y01EADObDoWTqfo/AE3qTKDi1oZIhW8uoIXPP3Akxm0d3ecghpxruwFOAsUD40Fzgzm7B3VzxO6fRjzKT9mF1SzIpzpfpesvs=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8274.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?B4G9uSBITJrXzgbHDqCXg4QNTT6TFzOMy7pmp6dKs79XJ4Dmru3bcMBFZmvv?=
 =?us-ascii?Q?uTRJ+v3Z5O7Ud3NA0PzYBnrmng+UQkYI1hdzeMOMw/frANAjl+Ue6g7/RcVO?=
 =?us-ascii?Q?gZdpCCCR0oHus+IMGLvw1dcvNzoVwxEPwFz04LzWiuLlQx7FLbsljldU+1cy?=
 =?us-ascii?Q?WBJsMLXztJ+Qq1BqWqJP6qxCy0IkYFWiHFnBnpwq2FD+D7eT0mvD33HZsB40?=
 =?us-ascii?Q?ptmx/kksH1tJohOqOVrQ/AcUzVyrYzaOzYg3Y5NW3tEO3sZsHsIdslVIXROA?=
 =?us-ascii?Q?/rCb9B6hkTOk4OV9LaYNsDodDXdCStj5q4O/RFZ0bdFxlj/n4KGAFk15rWmc?=
 =?us-ascii?Q?tLW0Sx9CCeQnU+tig3+dkP+jiUrVTYi0ZjsVEhnJfAvYPbn1maef8dAXBBU+?=
 =?us-ascii?Q?ZcdR35SAPx3otbELDV/7oWq3JhZAIOoJhmgfjk6N6a9XCvMVWnTQUlv0qtYq?=
 =?us-ascii?Q?yO+gFZTripREWKvJSBfZqcDbSbsds0X1Ea5jAt3qRwjym0cMgFLLQFhdjJPu?=
 =?us-ascii?Q?FQP+Ik99kpNqtFp7nZD+QxaQXv37XR/jCslHzzdXKdVAqHfkYN0U8Xx5SlUj?=
 =?us-ascii?Q?OPS215Yh3g3duJbQUsyXWfV6bn8Z3DAkJumXaLLVQ1te1JMItkeWlg0W37w6?=
 =?us-ascii?Q?kaQW+bUemwjdolffCoAl50UiOi7n49z87syEjpwMKbZpYUu41H/XqGSs5bLG?=
 =?us-ascii?Q?ALdo9Z29D55bxCL02rLoAaawY33A8mqOjyf1hPc4Oh9i48xKhnxtH4RUbWUv?=
 =?us-ascii?Q?ckH75f1Y/rY+ZnxrjGwZRiUbdcMYWsUKcctVbXRta/t7hEAWJAfIu0ydqp5l?=
 =?us-ascii?Q?UsscBdbQVg36F8+sKf88djORPfAc/7vzxLWwCrFxb5dBlm0PtPiEtQKKwUk2?=
 =?us-ascii?Q?sRddI2YReN/aMzou0zUodq53IKx5scPb2TUOXhQ7tLmOkTQL6nHFM2YTJXDq?=
 =?us-ascii?Q?HppGxTVqhsQPnsvtTiupdVnrEtpu60tsN3W6Xhi+s4OEd9pL6GJwu5fY14v/?=
 =?us-ascii?Q?HXX4ZPouImzFbuVPTG4lNsA17JTEUz5VMkHbHfUFONmIm/8Fyf639Q8AIlpG?=
 =?us-ascii?Q?fCw6ZaGsWhg5YgwKCArs7/Sc3xnhNplZNa59bSL9Pg0xZTwghz6FuQgXm9zs?=
 =?us-ascii?Q?8JHXXGGnqObzCuAv70ZQF+UBuljpoEF6kwdWQLnevJCn17JdYp3PyaUaW5Ym?=
 =?us-ascii?Q?0pT3o9Lc8JkI01Yz+3z8Wlf+s2hPrvPsh/LAbLShrKO7JOgzQxB3sgS8YeZG?=
 =?us-ascii?Q?IXBNc9J3/Ac51r9+K1Txk3B9BibiWUXPoeSewSwN5nceezV4NiLyUxn1s2IY?=
 =?us-ascii?Q?hgmZnRBmq1TcQsxHrvST8jfr/umdbPjp/FlHMw0GXkpEPrj9iWsrugx8qMu0?=
 =?us-ascii?Q?6WmYsLSGFdNuT3lA/BeZGgiYGEVu8a1Hfz2ORdRbg+8BxE6uYOT6G0lZDpJG?=
 =?us-ascii?Q?xPN92nUHwMXDmTxqi1ok4oUr8aUeLp4sBd3mi/PCHhpYcbPH3JheWQu6yU+c?=
 =?us-ascii?Q?IzAmqxDuIfwRCghgExv9k9PCyTex/gTQygPBzSYv0WHMtkEf7ryKRirO/4Q0?=
 =?us-ascii?Q?JQMFnwdezXpHkUY/p+1JFVKWbVbWo7pvwCPC6Qx6xxRRtWYX1H8RZ0g2l+rn?=
 =?us-ascii?Q?KV6Fr7niMbpR8MWLfntmjQu+JGpNxheU23ooWGCRY4jZICMq9psAD4RWaByD?=
 =?us-ascii?Q?OhNMz+pYSpg1rKQkhZPzmZc3C7nFifPkyLtQGjHdWEQSDCI0kiOK5W8fsjRI?=
 =?us-ascii?Q?jn1eyzvKY+/3l/gy6IbQluCVNeac9yI=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fe078d2c-df9f-48a1-4fd6-08de89d1fa21
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8274.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2026 18:20:07.2370
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bB4UN/1ibGW3lt+d2oLH3vQhPYtTMJCcDpQJHRVuypAFI5dXtuAcSPtl1Ct19kMPlHfzDbxOZnZtc5GWccAwRntFp3z4byf7+eq7RDTG7gU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH4PR03MB7771
X-purgate-ID: tlsNG-42698a/1774376410-98CBB112-7752B4DE/0/0
X-purgate-type: clean
X-purgate-size: 6103
X-Spamd-Result: default: False [-0.69 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:dpsmith@apertussolutions.com,m:marmarek@invisiblethingslab.com,m:ross.lagerwall@citrix.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[ross.lagerwall@citrix.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ross.lagerwall@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 0807831AACC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Since fully_eager_fpu is always true, remove it and adjust the code
accordingly. At the same time, rename vcpu_restore_fpu_nonlazy since it
always does the full restore.

No functional change intended.

Signed-off-by: Ross Lagerwall <ross.lagerwall@citrix.com>
Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
Unchanged in v2

 xen/arch/x86/domain.c              |  2 +-
 xen/arch/x86/hvm/emulate.c         | 18 +--------------
 xen/arch/x86/i387.c                | 35 ++++++++----------------------
 xen/arch/x86/include/asm/domain.h  |  3 ---
 xen/arch/x86/include/asm/hvm/hvm.h |  2 --
 xen/arch/x86/include/asm/i387.h    |  2 +-
 xen/common/efi/runtime.c           |  2 +-
 7 files changed, 13 insertions(+), 51 deletions(-)

diff --git a/xen/arch/x86/domain.c b/xen/arch/x86/domain.c
index 82da1c5d7b38..a10cb87e0b58 100644
--- a/xen/arch/x86/domain.c
+++ b/xen/arch/x86/domain.c
@@ -2127,7 +2127,7 @@ static void __context_switch(void)
             if ( cpu_has_xsaves && is_hvm_vcpu(n) )
                 set_msr_xss(n->arch.msrs->xss.raw);
         }
-        vcpu_restore_fpu_nonlazy(n, false);
+        vcpu_restore_fpu(n);
         nd->arch.ctxt_switch->to(n);
     }
 
diff --git a/xen/arch/x86/hvm/emulate.c b/xen/arch/x86/hvm/emulate.c
index 86b1f7535668..2daea084f15c 100644
--- a/xen/arch/x86/hvm/emulate.c
+++ b/xen/arch/x86/hvm/emulate.c
@@ -2630,23 +2630,7 @@ static void cf_check hvmemul_put_fpu(
     }
 
     if ( backout == X86EMUL_FPU_fpu )
-    {
-        /*
-         * To back out changes to the register file
-         * - in fully eager mode, restore original state immediately,
-         * - in lazy mode, simply adjust state such that upon next FPU insn
-         *   use by the guest we'll reload the state saved (or freshly loaded)
-         *   by hvmemul_get_fpu().
-         */
-        if ( curr->arch.fully_eager_fpu )
-            vcpu_restore_fpu_nonlazy(curr, false);
-        else
-        {
-            curr->fpu_dirtied = false;
-            stts();
-            alternative_vcall(hvm_funcs.fpu_leave, curr);
-        }
-    }
+        vcpu_restore_fpu(curr);
 }
 
 static int cf_check hvmemul_tlb_op(
diff --git a/xen/arch/x86/i387.c b/xen/arch/x86/i387.c
index 7da731865f73..88018397b1ad 100644
--- a/xen/arch/x86/i387.c
+++ b/xen/arch/x86/i387.c
@@ -194,12 +194,8 @@ static inline void fpu_fxsave(struct vcpu *v)
 /*       VCPU FPU Functions    */
 /*******************************/
 /* Restore FPU state whenever VCPU is schduled in. */
-void vcpu_restore_fpu_nonlazy(struct vcpu *v, bool need_stts)
+void vcpu_restore_fpu(struct vcpu *v)
 {
-    /* Restore nonlazy extended state (i.e. parts not tracked by CR0.TS). */
-    if ( !v->arch.fully_eager_fpu && !v->arch.nonlazy_xstate_used )
-        goto maybe_stts;
-
     ASSERT(!is_idle_vcpu(v));
 
     /* Avoid recursion */
@@ -210,27 +206,16 @@ void vcpu_restore_fpu_nonlazy(struct vcpu *v, bool need_stts)
      * above) we also need to restore full state, to prevent subsequently
      * saving state belonging to another vCPU.
      */
-    if ( v->arch.fully_eager_fpu || xstate_all(v) )
-    {
-        if ( cpu_has_xsave )
-            fpu_xrstor(v, XSTATE_ALL);
-        else
-            fpu_fxrstor(v);
-
-        v->fpu_initialised = 1;
-        v->fpu_dirtied = 1;
-
-        /* Xen doesn't need TS set, but the guest might. */
-        need_stts = is_pv_vcpu(v) && (v->arch.pv.ctrlreg[0] & X86_CR0_TS);
-    }
+    if ( cpu_has_xsave )
+        fpu_xrstor(v, XSTATE_ALL);
     else
-    {
-        fpu_xrstor(v, XSTATE_NONLAZY);
-        need_stts = true;
-    }
+        fpu_fxrstor(v);
 
- maybe_stts:
-    if ( need_stts )
+    v->fpu_initialised = 1;
+    v->fpu_dirtied = 1;
+
+    /* Xen doesn't need TS set, but the guest might. */
+    if ( is_pv_vcpu(v) && (v->arch.pv.ctrlreg[0] & X86_CR0_TS) )
         stts();
 }
 
@@ -273,8 +258,6 @@ void save_fpu_enable(void)
 /* Initialize FPU's context save area */
 int vcpu_init_fpu(struct vcpu *v)
 {
-    v->arch.fully_eager_fpu = true;
-
     return xstate_alloc_save_area(v);
 }
 
diff --git a/xen/arch/x86/include/asm/domain.h b/xen/arch/x86/include/asm/domain.h
index ad7f6adb2cb9..bd7b02085ef8 100644
--- a/xen/arch/x86/include/asm/domain.h
+++ b/xen/arch/x86/include/asm/domain.h
@@ -671,9 +671,6 @@ struct arch_vcpu
      * and thus should be saved/restored. */
     bool nonlazy_xstate_used;
 
-    /* Restore all FPU state (lazy and non-lazy state) on context switch? */
-    bool fully_eager_fpu;
-
     struct vmce vmce;
 
     struct paging_vcpu paging;
diff --git a/xen/arch/x86/include/asm/hvm/hvm.h b/xen/arch/x86/include/asm/hvm/hvm.h
index 7d9774df59fe..a9425c8cffe8 100644
--- a/xen/arch/x86/include/asm/hvm/hvm.h
+++ b/xen/arch/x86/include/asm/hvm/hvm.h
@@ -160,8 +160,6 @@ struct hvm_function_table {
 
     void (*cpuid_policy_changed)(struct vcpu *v);
 
-    void (*fpu_leave)(struct vcpu *v);
-
     int  (*get_guest_pat)(struct vcpu *v, uint64_t *gpat);
     int  (*set_guest_pat)(struct vcpu *v, uint64_t gpat);
 
diff --git a/xen/arch/x86/include/asm/i387.h b/xen/arch/x86/include/asm/i387.h
index da0c7e945f95..fe5e4419b6f4 100644
--- a/xen/arch/x86/include/asm/i387.h
+++ b/xen/arch/x86/include/asm/i387.h
@@ -27,7 +27,7 @@ struct ix87_env {
     uint16_t fds, _res6;
 };
 
-void vcpu_restore_fpu_nonlazy(struct vcpu *v, bool need_stts);
+void vcpu_restore_fpu(struct vcpu *v);
 void vcpu_save_fpu(struct vcpu *v);
 void save_fpu_enable(void);
 int vcpu_init_fpu(struct vcpu *v);
diff --git a/xen/common/efi/runtime.c b/xen/common/efi/runtime.c
index ba27c62132d2..982e42e8f341 100644
--- a/xen/common/efi/runtime.c
+++ b/xen/common/efi/runtime.c
@@ -157,7 +157,7 @@ void efi_rs_leave(struct efi_rs_state *state)
     irq_exit();
     efi_rs_on_cpu = NR_CPUS;
     spin_unlock(&efi_rs_lock);
-    vcpu_restore_fpu_nonlazy(curr, true);
+    vcpu_restore_fpu(curr);
 }
 
 bool efi_rs_using_pgtables(void)
-- 
2.53.0


