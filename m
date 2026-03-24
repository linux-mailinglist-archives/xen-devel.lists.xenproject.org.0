Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QChlI+nVwmllmgQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 24 Mar 2026 19:20:25 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E1DB31AAE9
	for <lists+xen-devel@lfdr.de>; Tue, 24 Mar 2026 19:20:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1261261.1554383 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w56MS-0006mu-IF; Tue, 24 Mar 2026 18:20:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1261261.1554383; Tue, 24 Mar 2026 18:20:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w56MS-0006kw-DL; Tue, 24 Mar 2026 18:20:16 +0000
Received: by outflank-mailman (input) for mailman id 1261261;
 Tue, 24 Mar 2026 18:20:15 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ross.lagerwall@citrix.com>) id 1w56MR-0006ig-42
 for xen-devel@lists.xenproject.org; Tue, 24 Mar 2026 18:20:15 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w56MQ-0036ix-GH
 for xen-devel@lists.xenproject.org; Tue, 24 Mar 2026 19:20:14 +0100
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <ross.lagerwall@citrix.com>)
 id 69c2d5bc-5cb7-0a2a0a5109dd-0a2a45028430-44
 for <xen-devel@lists.xenproject.org>; Tue, 24 Mar 2026 19:20:14 +0100
Received: from [52.101.52.17]
 (helo=BL2PR02CU003.outbound.protection.outlook.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.55.2)
 (envelope-from <ross.lagerwall@citrix.com>)
 id 69c2d5dd-63bb-0a2a45020019-34653411f893-3
 for <xen-devel@lists.xenproject.org>; Tue, 24 Mar 2026 19:20:14 +0100
Received: from CH8PR03MB8274.namprd03.prod.outlook.com (2603:10b6:610:2ba::5)
 by CH4PR03MB7771.namprd03.prod.outlook.com (2603:10b6:610:237::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.25; Tue, 24 Mar
 2026 18:20:10 +0000
Received: from CH8PR03MB8274.namprd03.prod.outlook.com
 ([fe80::ebe2:32c1:d2be:a096]) by CH8PR03MB8274.namprd03.prod.outlook.com
 ([fe80::ebe2:32c1:d2be:a096%5]) with mapi id 15.20.9745.019; Tue, 24 Mar 2026
 18:20:10 +0000
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
 b=Dws1oPc0fp9HV4KuQfkhgRSebo/n9CMdck/KMh08CFV/yuki0cox8vkD+TeVDSkCU1SZnqhVE8iYfDTHcmpUzK02yY2Dwy35nEEcakpHV7DDoddWln87mbCjob9yQs3XcbOcIsAbDQGPrKZxdLNjOu4dlVMSQeKRkr9OHMGpeaa1Mjzh5sB4r1ma+VadUXXYovKqhdqMKrscY5O+IVC5JrsHIhrixDNeii9FK7S+Wk07wE+/ouHhZbU+/6rbUbh7Cf3Fi9wSjLfolpt7T58psgkZZgj01kmhDz1vXCRwxdI7/y+L89X2JuZbEvgZ/FdSYrfsC1vrNp8eLiU9hcR1EQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P2Oz3L+9MTBYxFvArtvwKn+CTpeTC9fRDIzDj5AalzM=;
 b=JdPRbTqU7LAnHNhSofKWY19zImmBCM3v5+sx0DzT9OlU9fqsTCuYlx/GMLCxutCQJks0cGE8dYdH2XINkopb9oEYLaBznD2vvHXOmtYLlKrEYJrFGjSGUM0i3f0Lvr7ijx7z1EG4mui2dt1HMfbVRK7XZpmO1DKJn7Y5Idtw0DbllpxpxTrCMG/9Rd9DV09lXXSw+ax3XAhn2+gLOfRauycf28I0FNjBRMWbrUbQbBz5qejRs8zG0XTNBcjATAiQb8b2PHDqZ+2t59A2oSFr9pi2SOSKgzI6STOzAO0uCONQJEBQKjQ/NtoY2voqxn0BEnQXzSReXFoiQLyZif3stg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P2Oz3L+9MTBYxFvArtvwKn+CTpeTC9fRDIzDj5AalzM=;
 b=Ev+FdWksRVDz5VRMUVPaG9Yv22d1YjSqoECckC/rwp07Lpmu9wXMnCruJjn5WCvxeKbvgzuLLyvJ8QZ4APzAxJrBD0lUVbpfcEOBVVsHshMQSFqrPmOsLtQ64QY1S2jbfJHFUbjqfL0zT0jl3wnaCIDVGUw1rfUpo5qs9gEF9+0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Ross Lagerwall <ross.lagerwall@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Ross Lagerwall <ross.lagerwall@citrix.com>
Subject: [PATCH v2 7/9] x86: Remove fpu_initialised/fpu_dirty
Date: Tue, 24 Mar 2026 18:19:35 +0000
Message-ID: <20260324181937.2465574-8-ross.lagerwall@citrix.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260324181937.2465574-1-ross.lagerwall@citrix.com>
References: <20260324181937.2465574-1-ross.lagerwall@citrix.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0613.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:314::19) To CH8PR03MB8274.namprd03.prod.outlook.com
 (2603:10b6:610:2ba::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8274:EE_|CH4PR03MB7771:EE_
X-MS-Office365-Filtering-Correlation-Id: 818b5eb5-fe43-49dc-c237-08de89d1fc56
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	UWfE5iLWg+OzSEfwRTTCphaSn6pg588TqSZQPV7YzYHhEFLNR9Q7eIObDxp6AXCXoxo7T5PWqX4r7FARRKstyB31QZGiDkaCgPRFhbDBJyYbQWOyHrz9SpcerFCaq3Rc3RXQx10fL3wQVQE30ERmFfrtQW61V7fyeQpRzMvnLH6mkp27Ai4LxGYuFxwJFL+DGgtMKkbfYFemkDZ7fGt1Yskt0ZT4qVnuuDiM2iW4wkcsmi/pdMoeDCpWKuec5tnZPX2HC6w18uo9Sbg984tIBdP/l+Jck/qTgmX5MJ7Nz/8Wnq5vQiPk/P+uu031AuyNS3KQTwzWC563D5cAM+JvVpfhkhzNcFsDMVO+QxK9CujRoLEiVje45dvzg5KSsd+hxXkoi2ycbCTqestpCyuLUXBgAW1roOdzm0SGJsTbxiVKTcWJo6XkRhx1BkzwHoEbtvjukwn58Jad88v5suzajAyggmIfbrinxkLdfzUS8SwRin2OJPXI12jV2fO12pF8AfbhbR9ta8l57uvpGnXLMGyQZmetZYlTQLcQTqRjicHSt5uHoERmIj5cfgdxqB7BSGt+o3hIChp4eVlqZ//PmxkNCJXPbNxdC4PIKDhexvD6VjPNs6PurJHnCjmoKc3I6o8Q2QBiCCT/uXmaL55hHpbvsPnRVqeuC82mU07doDFYr5gAeddRABQBTsnVTCYAN5U3I6Yj+EtUhBj6liRU4gA0df/AnSgdcTB77DcOpLY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8274.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?WaneD1Yo2n9Q9WODMKNGpHThukSleim59PyDVvp863tD9Fyd03HQQsJ+oBZx?=
 =?us-ascii?Q?AxPikyIycDCQFDRZ3vic8cu03fmk/PbPzwX8j+bKleRuL7wMzZCFlP66S+yE?=
 =?us-ascii?Q?y7Hfhyt6qevT+iRxUa+f0wmvPPbk+pR/ibfEhUS7rzS9kSeDjOtJY9zdifXg?=
 =?us-ascii?Q?QCyTc6x0xTjzswlLTjV6/3K2FxwIuFKutZul55G8ZjM6f7+9jDxOENYnqPHb?=
 =?us-ascii?Q?UDxdRJg0LhmU3c6MtGMLPs5A3LwFA6OfcRCg19ACsG1l5WvaJj3tciSyPxMo?=
 =?us-ascii?Q?JXbuNBH+CVFutDpAZr9pQwBUOIvbENJxuIRn5NwCMl2bRsXAnZ7mQ0GeXXFh?=
 =?us-ascii?Q?8ZIkDut13Z7TjdGzM89bAmszpXGwHc+KiSlPX6SAgjKi0Y9jGSvIMPusyeTH?=
 =?us-ascii?Q?FXUY+YcXd62ktAgALJXwAYMXBe4BkHlNNqoDhz5oCPaUVH8WoMqTctItNkZk?=
 =?us-ascii?Q?rM0TFWep1OMQ0GuyFAQa+sdjO8YFTGmKAUldu4hmVF6/d+tehEqefUvKXPeF?=
 =?us-ascii?Q?0S0wCTnkHL4KsEZKOlZqe99kpJgRxjycD6sgi9jh4wJ8iY17Ma4djZtzK+Tt?=
 =?us-ascii?Q?mrKT8v1KNV3coFoW+3aLBY1cRTqM9Vy/bnmXnAcMQhh6qMXY55MXCGjcFZhB?=
 =?us-ascii?Q?bpWDzA/lii67sN6hCGOZvIn5WXc9e+xDmjfgrn0YluqdzUCp3bBQoVHJiYjy?=
 =?us-ascii?Q?FV7oJ2xkvycBCfvYgC3tWcOZ+y/NJN6YyHLgLmYQuKSd1p0Q7yB9VEndjdDR?=
 =?us-ascii?Q?0khJt80pEGAxBZZbsKGyIR8If/LJG80BeBl5oLQw980BPFHGMRNDtP5eEqaf?=
 =?us-ascii?Q?Qkvrc4dUdvLCBk+M7vUnts3t4P/g66K/7cxdMA04QBnAIgeT4jp7K6PG5SAh?=
 =?us-ascii?Q?ZvOG8BvG2HZMUJzIEHkOeDqKholOMkleYwc2kuIlO4MJ+E4GIVpjCQtOqUyl?=
 =?us-ascii?Q?N9h567p4ktjrzZaYzBoQiOVM/7E0PscIVz5Dnl+Y5nB3plfMIHTNQIZHGApJ?=
 =?us-ascii?Q?r4BMBI/UyNAqoz3tVJQiFDMo/JdbB0TcErEriZ9g6gImH2zjwq1V2+YNFaw7?=
 =?us-ascii?Q?acanpo7/RXqtHtr9cqlwV5zqnSr/uBEbbuV1LcVpVTorB58HDYLgFIbUfHK+?=
 =?us-ascii?Q?n1+HxftaHcNNyGt6QNGT4tJG7a5S8BvipU0W5JD9tIWBhBzUnIqDG5+WlkT3?=
 =?us-ascii?Q?geExeuA59YjXg/dNWo3eZO9WVDh7TB2cQ7EAqRrPG8Cy4K6vN5V15J3IEdTQ?=
 =?us-ascii?Q?Dd0tYmAltXetzWMtxG1VQkw66l7ihtIatD1W4GqxqRKaUe5W1DrNlZJCvtfL?=
 =?us-ascii?Q?dMR7nBel7O+ga4smOwyVPd3WmgCy5sd78STp3wu+91BW58YAqjYosgIJj1YV?=
 =?us-ascii?Q?WdOaGrv4y+ZPgkwie/RhpQiIKglCodh6L92q9gSjnLQMQkJ0VZWrGEONovG3?=
 =?us-ascii?Q?XZjnf+2fYynejkPfeH/8xF6tQ1X24PUrVFu+khgmwYpwlwhlOQSygU2QnmUL?=
 =?us-ascii?Q?9f1/H629z7ImTjimekX67Q1x7KyZztAS0/DsnHk8IQlM6pT77XXLaOv4JywD?=
 =?us-ascii?Q?bxn81tR+hYDyQhQi+7p3MSheBdCZ0kXSeaqnEjlpZu4BXfsSrZGMradikBAD?=
 =?us-ascii?Q?SQAXhi7nh7G3Z5wDa55tH1O1sBh8VPOHdIkbWDlt+6ZqDStp1ZFvcogXAI92?=
 =?us-ascii?Q?sut5kRg94FnO5x5nVGBIlugbMMHsUYeCk9nJaRW78dk2BDN4JVbpJcxjQFIH?=
 =?us-ascii?Q?GpX1XD+gnBddsqr8lTl6WGdo8hRsLtg=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 818b5eb5-fe43-49dc-c237-08de89d1fc56
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8274.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2026 18:20:10.9007
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6qUHuG35tMD31mn9vGchnAHyt5rUXSF7cztto5TPo/4NRANQIJgf8uSC3gEqd0Uw3sV0D9c6m9vFg4CB916sn4qhrZe1YjCfqIMeY7NmxV0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH4PR03MB7771
X-purgate-ID: tlsNG-720697/1774376414-BF081DB8-44DAEF67/0/0
X-purgate-type: clean
X-purgate-size: 11721
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
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:sstabellini@kernel.org,m:ross.lagerwall@citrix.com,s:lists@lfdr.de];
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
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 1E1DB31AAE9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

With lazy FPU removed, fpu_initialised and fpu_dirty are always set to
true in vcpu_restore_fpu() so remove them and adjust the code
accordingly.

There is a small user-visible change here. After this commit, calling
XEN_DOMCTL_getvcpucontext immediately after vCPU creation would show the
FPU as initialized (with a clean state) whereas before it would show as
uninitialized.

Signed-off-by: Ross Lagerwall <ross.lagerwall@citrix.com>
---
In v2: Noted behaviour change in commit message

 xen/arch/x86/domctl.c              |  3 +--
 xen/arch/x86/hvm/emulate.c         |  6 +-----
 xen/arch/x86/hvm/hvm.c             | 15 ++++++---------
 xen/arch/x86/hvm/vlapic.c          |  3 ---
 xen/arch/x86/i387.c                | 31 ++----------------------------
 xen/arch/x86/include/asm/hvm/hvm.h |  1 -
 xen/arch/x86/include/asm/xstate.h  | 11 -----------
 xen/arch/x86/xstate.c              | 21 +++++---------------
 xen/common/domain.c                |  2 --
 xen/include/xen/sched.h            |  4 ----
 10 files changed, 15 insertions(+), 82 deletions(-)

diff --git a/xen/arch/x86/domctl.c b/xen/arch/x86/domctl.c
index 942f41c584d4..d9b08182ac1d 100644
--- a/xen/arch/x86/domctl.c
+++ b/xen/arch/x86/domctl.c
@@ -1409,8 +1409,7 @@ void arch_get_info_guest(struct vcpu *v, vcpu_guest_context_u c)
         c(flags = v->arch.pv.vgc_flags & ~(VGCF_i387_valid|VGCF_in_kernel));
     else
         c(flags = 0);
-    if ( v->fpu_initialised )
-        c(flags |= VGCF_i387_valid);
+    c(flags |= VGCF_i387_valid);
     if ( !(v->pause_flags & VPF_down) )
         c(flags |= VGCF_online);
     if ( !compat )
diff --git a/xen/arch/x86/hvm/emulate.c b/xen/arch/x86/hvm/emulate.c
index 2daea084f15c..48c7320360c7 100644
--- a/xen/arch/x86/hvm/emulate.c
+++ b/xen/arch/x86/hvm/emulate.c
@@ -2517,9 +2517,7 @@ static int cf_check hvmemul_get_fpu(
 {
     struct vcpu *curr = current;
 
-    if ( !curr->fpu_dirtied )
-        alternative_vcall(hvm_funcs.fpu_dirty_intercept);
-    else if ( type == X86EMUL_FPU_fpu )
+    if ( type == X86EMUL_FPU_fpu )
     {
         /* Has a fastpath for `current`, so there's no actual map */
         const struct xsave_struct *xsave_area = VCPU_MAP_XSAVE_AREA(curr);
@@ -2537,8 +2535,6 @@ static int cf_check hvmemul_get_fpu(
          * masking of all exceptions by FNSTENV.)
          */
         save_fpu_enable();
-        curr->fpu_initialised = true;
-        curr->fpu_dirtied = true;
         if ( (fpu_ctxt->fcw & 0x3f) != 0x3f )
         {
             uint16_t fcw;
diff --git a/xen/arch/x86/hvm/hvm.c b/xen/arch/x86/hvm/hvm.c
index 4d37a93c57a5..d4ba82845146 100644
--- a/xen/arch/x86/hvm/hvm.c
+++ b/xen/arch/x86/hvm/hvm.c
@@ -866,6 +866,7 @@ static int cf_check hvm_save_cpu_ctxt(struct vcpu *v, hvm_domain_context_t *h)
         .dr7 = v->arch.dr7,
         .msr_efer = v->arch.hvm.guest_efer,
     };
+    const struct xsave_struct *xsave_area;
 
     /*
      * We don't need to save state for a vcpu that is down; the restore
@@ -933,15 +934,11 @@ static int cf_check hvm_save_cpu_ctxt(struct vcpu *v, hvm_domain_context_t *h)
     ctxt.ldtr_base = seg.base;
     ctxt.ldtr_arbytes = seg.attr;
 
-    if ( v->fpu_initialised )
-    {
-        const struct xsave_struct *xsave_area = VCPU_MAP_XSAVE_AREA(v);
-
-        BUILD_BUG_ON(sizeof(ctxt.fpu_regs) != sizeof(xsave_area->fpu_sse));
-        memcpy(ctxt.fpu_regs, &xsave_area->fpu_sse, sizeof(ctxt.fpu_regs));
-        VCPU_UNMAP_XSAVE_AREA(v, xsave_area);
-        ctxt.flags = XEN_X86_FPU_INITIALISED;
-    }
+    xsave_area = VCPU_MAP_XSAVE_AREA(v);
+    BUILD_BUG_ON(sizeof(ctxt.fpu_regs) != sizeof(xsave_area->fpu_sse));
+    memcpy(ctxt.fpu_regs, &xsave_area->fpu_sse, sizeof(ctxt.fpu_regs));
+    VCPU_UNMAP_XSAVE_AREA(v, xsave_area);
+    ctxt.flags = XEN_X86_FPU_INITIALISED;
 
     return hvm_save_entry(CPU, v->vcpu_id, h, &ctxt);
 }
diff --git a/xen/arch/x86/hvm/vlapic.c b/xen/arch/x86/hvm/vlapic.c
index 79697487ba90..885f5d304b2f 100644
--- a/xen/arch/x86/hvm/vlapic.c
+++ b/xen/arch/x86/hvm/vlapic.c
@@ -276,7 +276,6 @@ static void vlapic_init_sipi_one(struct vcpu *target, uint32_t icr)
     switch ( icr & APIC_DM_MASK )
     {
     case APIC_DM_INIT: {
-        bool fpu_initialised;
         int rc;
 
         /* No work on INIT de-assert for P4-type APIC. */
@@ -289,10 +288,8 @@ static void vlapic_init_sipi_one(struct vcpu *target, uint32_t icr)
         hvm_vcpu_down(target);
         domain_lock(target->domain);
         /* Reset necessary VCPU state. This does not include FPU state. */
-        fpu_initialised = target->fpu_initialised;
         rc = vcpu_reset(target);
         ASSERT(!rc);
-        target->fpu_initialised = fpu_initialised;
         vlapic_do_init(vcpu_vlapic(target));
         domain_unlock(target->domain);
         break;
diff --git a/xen/arch/x86/i387.c b/xen/arch/x86/i387.c
index 88018397b1ad..5e893a2aab94 100644
--- a/xen/arch/x86/i387.c
+++ b/xen/arch/x86/i387.c
@@ -110,22 +110,7 @@ static inline void fpu_fxrstor(struct vcpu *v)
 
 static inline uint64_t vcpu_xsave_mask(const struct vcpu *v)
 {
-    if ( v->fpu_dirtied )
-        return v->arch.nonlazy_xstate_used ? XSTATE_ALL : XSTATE_LAZY;
-
-    ASSERT(v->arch.nonlazy_xstate_used);
-
-    /*
-     * The offsets of components which live in the extended region of
-     * compact xsave area are not fixed. Xsave area may be overwritten
-     * when a xsave with v->fpu_dirtied set is followed by one with
-     * v->fpu_dirtied clear.
-     * In such case, if hypervisor uses compact xsave area and guest
-     * has ever used lazy states (checking xcr0_accum excluding
-     * XSTATE_FP_SSE), vcpu_xsave_mask will return XSTATE_ALL. Otherwise
-     * return XSTATE_NONLAZY.
-     */
-    return xstate_all(v) ? XSTATE_ALL : XSTATE_NONLAZY;
+    return v->arch.nonlazy_xstate_used ? XSTATE_ALL : XSTATE_LAZY;
 }
 
 /* Save x87 extended state */
@@ -201,19 +186,11 @@ void vcpu_restore_fpu(struct vcpu *v)
     /* Avoid recursion */
     clts();
 
-    /*
-     * When saving full state even with !v->fpu_dirtied (see vcpu_xsave_mask()
-     * above) we also need to restore full state, to prevent subsequently
-     * saving state belonging to another vCPU.
-     */
     if ( cpu_has_xsave )
         fpu_xrstor(v, XSTATE_ALL);
     else
         fpu_fxrstor(v);
 
-    v->fpu_initialised = 1;
-    v->fpu_dirtied = 1;
-
     /* Xen doesn't need TS set, but the guest might. */
     if ( is_pv_vcpu(v) && (v->arch.pv.ctrlreg[0] & X86_CR0_TS) )
         stts();
@@ -225,7 +202,7 @@ void vcpu_restore_fpu(struct vcpu *v)
  */
 static bool _vcpu_save_fpu(struct vcpu *v)
 {
-    if ( !v->fpu_dirtied && !v->arch.nonlazy_xstate_used )
+    if ( !v->arch.nonlazy_xstate_used )
         return false;
 
     ASSERT(!is_idle_vcpu(v));
@@ -238,8 +215,6 @@ static bool _vcpu_save_fpu(struct vcpu *v)
     else
         fpu_fxsave(v);
 
-    v->fpu_dirtied = 0;
-
     return true;
 }
 
@@ -265,7 +240,6 @@ void vcpu_reset_fpu(struct vcpu *v)
 {
     struct xsave_struct *xsave_area = VCPU_MAP_XSAVE_AREA(v);
 
-    v->fpu_initialised = false;
     *xsave_area = (struct xsave_struct) {
         .xsave_hdr.xstate_bv = X86_XCR0_X87,
     };
@@ -282,7 +256,6 @@ void vcpu_setup_fpu(struct vcpu *v, const void *data)
 {
     struct xsave_struct *xsave_area = VCPU_MAP_XSAVE_AREA(v);
 
-    v->fpu_initialised = true;
     *xsave_area = (struct xsave_struct) {
         .fpu_sse = *(const fpusse_t*)data,
         .xsave_hdr.xstate_bv = XSTATE_FP_SSE,
diff --git a/xen/arch/x86/include/asm/hvm/hvm.h b/xen/arch/x86/include/asm/hvm/hvm.h
index a9425c8cffe8..846b91ebefcc 100644
--- a/xen/arch/x86/include/asm/hvm/hvm.h
+++ b/xen/arch/x86/include/asm/hvm/hvm.h
@@ -184,7 +184,6 @@ struct hvm_function_table {
 
     /* Instruction intercepts: non-void return values are X86EMUL codes. */
     void (*wbinvd_intercept)(void);
-    void (*fpu_dirty_intercept)(void);
     int (*msr_read_intercept)(unsigned int msr, uint64_t *msr_content);
     int (*msr_write_intercept)(unsigned int msr, uint64_t msr_content);
     void (*handle_cd)(struct vcpu *v, unsigned long value);
diff --git a/xen/arch/x86/include/asm/xstate.h b/xen/arch/x86/include/asm/xstate.h
index e3b9745543d7..ca38c43ec1c3 100644
--- a/xen/arch/x86/include/asm/xstate.h
+++ b/xen/arch/x86/include/asm/xstate.h
@@ -132,17 +132,6 @@ xsave_area_compressed(const struct xsave_struct *xsave_area)
     return xsave_area->xsave_hdr.xcomp_bv & XSTATE_COMPACTION_ENABLED;
 }
 
-static inline bool xstate_all(const struct vcpu *v)
-{
-    /*
-     * XSTATE_FP_SSE may be excluded, because the offsets of XSTATE_FP_SSE
-     * (in the legacy region of xsave area) are fixed, so saving
-     * XSTATE_FP_SSE will not cause overwriting problem with XSAVES/XSAVEC.
-     */
-    return xsave_area_compressed(v->arch.xsave_area) &&
-           (v->arch.xcr0_accum & XSTATE_LAZY & ~XSTATE_FP_SSE);
-}
-
 /*
  * Fetch a pointer to a vCPU's XSAVE area
  *
diff --git a/xen/arch/x86/xstate.c b/xen/arch/x86/xstate.c
index e990abc9d18c..11d390cac985 100644
--- a/xen/arch/x86/xstate.c
+++ b/xen/arch/x86/xstate.c
@@ -994,28 +994,17 @@ int handle_xsetbv(u32 index, u64 new_bv)
     if ( new_bv & XSTATE_NONLAZY )
         curr->arch.nonlazy_xstate_used = 1;
 
-    mask &= curr->fpu_dirtied ? ~XSTATE_FP_SSE : XSTATE_NONLAZY;
+    mask &= ~XSTATE_FP_SSE;
     if ( mask )
     {
         unsigned long cr0 = read_cr0();
+        /* Has a fastpath for `current`, so there's no actual map */
+        struct xsave_struct *xsave_area = VCPU_MAP_XSAVE_AREA(curr);
 
         clts();
-        if ( curr->fpu_dirtied )
-        {
-            /* Has a fastpath for `current`, so there's no actual map */
-            struct xsave_struct *xsave_area = VCPU_MAP_XSAVE_AREA(curr);
 
-            asm ( "stmxcsr %0" : "=m" (xsave_area->fpu_sse.mxcsr) );
-            VCPU_UNMAP_XSAVE_AREA(curr, xsave_area);
-        }
-        else if ( xstate_all(curr) )
-        {
-            /* See the comment in i387.c:vcpu_restore_fpu_eager(). */
-            mask |= XSTATE_LAZY;
-            curr->fpu_initialised = 1;
-            curr->fpu_dirtied = 1;
-            cr0 &= ~X86_CR0_TS;
-        }
+        asm ( "stmxcsr %0" : "=m" (xsave_area->fpu_sse.mxcsr) );
+        VCPU_UNMAP_XSAVE_AREA(curr, xsave_area);
         xrstor(curr, mask);
         if ( cr0 & X86_CR0_TS )
             write_cr0(cr0);
diff --git a/xen/common/domain.c b/xen/common/domain.c
index ab910fcf9306..30cfea30459a 100644
--- a/xen/common/domain.c
+++ b/xen/common/domain.c
@@ -1824,8 +1824,6 @@ int vcpu_reset(struct vcpu *v)
     clear_bit(v->vcpu_id, d->poll_mask);
     v->poll_evtchn = 0;
 
-    v->fpu_initialised = 0;
-    v->fpu_dirtied     = 0;
     v->is_initialised  = 0;
     if ( v->affinity_broken & VCPU_AFFINITY_OVERRIDE )
         vcpu_temporary_affinity(v, NR_CPUS, VCPU_AFFINITY_OVERRIDE);
diff --git a/xen/include/xen/sched.h b/xen/include/xen/sched.h
index 40a35fc15c65..212c7d765c3e 100644
--- a/xen/include/xen/sched.h
+++ b/xen/include/xen/sched.h
@@ -212,10 +212,6 @@ struct vcpu
     struct guest_area runstate_guest_area;
     unsigned int     new_state;
 
-    /* Has the FPU been initialised? */
-    bool             fpu_initialised;
-    /* Has the FPU been used since it was last saved? */
-    bool             fpu_dirtied;
     /* Initialization completed for this VCPU? */
     bool             is_initialised;
     /* Currently running on a CPU? */
-- 
2.53.0


