Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id jYQrNExJMWpugAUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 16 Jun 2026 15:02:04 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 00A4268FB48
	for <lists+xen-devel@lfdr.de>; Tue, 16 Jun 2026 15:01:57 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=citrix.com header.s=selector1 header.b=ZiJM2Ter;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=reject) header.from=citrix.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1339203.1600345 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wZTPx-0001uB-Rf; Tue, 16 Jun 2026 13:01:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1339203.1600345; Tue, 16 Jun 2026 13:01:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wZTPx-0001rP-OL; Tue, 16 Jun 2026 13:01:25 +0000
Received: by outflank-mailman (input) for mailman id 1339203;
 Tue, 16 Jun 2026 13:01:24 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ross.lagerwall@citrix.com>) id 1wZTPw-0001rI-Gs
 for xen-devel@lists.xenproject.org; Tue, 16 Jun 2026 13:01:24 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wZTPt-003owZ-J8
 for xen-devel@lists.xenproject.org; Tue, 16 Jun 2026 15:01:21 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <ross.lagerwall@citrix.com>)
 id 6a314920-2eae-0a2a0a5409dd-0a2a45018218-6
 for <xen-devel@lists.xenproject.org>; Tue, 16 Jun 2026 15:01:21 +0200
Received: from [52.101.53.39]
 (helo=BL0PR03CU003.outbound.protection.outlook.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <ross.lagerwall@citrix.com>)
 id 6a31491a-c1f2-0a2a45010019-3465352742cf-3
 for <xen-devel@lists.xenproject.org>; Tue, 16 Jun 2026 15:01:15 +0200
Received: from CH8PR03MB8274.namprd03.prod.outlook.com (2603:10b6:610:2ba::5)
 by DM6PR03MB5131.namprd03.prod.outlook.com (2603:10b6:5:1f0::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.18; Tue, 16 Jun
 2026 13:01:10 +0000
Received: from CH8PR03MB8274.namprd03.prod.outlook.com
 ([fe80::ebe2:32c1:d2be:a096]) by CH8PR03MB8274.namprd03.prod.outlook.com
 ([fe80::ebe2:32c1:d2be:a096%7]) with mapi id 15.21.0113.015; Tue, 16 Jun 2026
 13:01:10 +0000
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
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hu9aHp1X4JqzV0Sn20prffgQeDSyhJFwSoFvUxHX3RG+ZCFhN//7DXYqLaP4hK3fvjKQF+BW1counGP2mBZtpKrPLK3w0148AmOF+Ffwds19ZPr96hyYkuWiDCepWOfR8uYenIVZT7xwiTBzZYmcZeWrP2F6ctLU6Mr5rDZlGzLZICupRkLSEP8N0xIUpm5yCJ9SlSSUaXNoZOa53yIC2/wUp/rXBIw/c/ly0cc8rJjxftpMVnQ7oqM4y4kY5dAanJk39ZL64FUPrMrWOZb8/jTKVm27S24NUqVrlnHnOQKP/RFqgVe4ciax6hqoTbpZQO/rJnmYi2Hne2HiQlwGqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qmvRo+/bLAUm3O2W2tuAHcB0hOYQkRhe34AUaSTMyF8=;
 b=QhRoXdCyLIh5/dcMQ2NL38J45sHJJqtVvbSbqY2piqXX/lMmC5UW071C1TaTQAmbhMEwRe+wASAkNZQAERgFOvCzmQZCuKgpmoNLo8c0uALDrzUZZc62R2KR/FobUhRIXbCIqY7v71C2LQvAOY3Uqpl5D9P7g5lI2jXiwCleervNW+WAK2Aarsf/8wMUPUa5c76YqKcHI/yeYh6e6AsMWVkMqa0JIpFOULHW0Pe8X6qMhDexQBPxYmOoJjgCyuZWjHMawnNqEyy9sBww1V8mnN1mgaJ3nydzuBlfk2O+nlEcKKE11bsriB3Y15PV7x9sZJHpgkZC72ArkqBlJsolVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qmvRo+/bLAUm3O2W2tuAHcB0hOYQkRhe34AUaSTMyF8=;
 b=ZiJM2TerUuNcVoOj7Nxxo+rg4G+2EPsMnqfinkps9+pOoNo+MCXF3MFND2HQt5afDjWtzQGGlA0k1nxf0CljPrv5r+dPpInUy8Q5CIS59HynxpuejZ0ksXT0afFmqtpeuw2lLOYVu09NS3wZPR2YQJkE64eQkixrNceLHLlkyU8=
From: Ross Lagerwall <ross.lagerwall@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Ross Lagerwall <ross.lagerwall@citrix.com>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Jan Beulich <jbeulich@suse.com>,
	Anthony PERARD <anthony.perard@vates.tech>
Subject: [PATCH] efi: Skip FPU save / restore if using idle vCPU
Date: Tue, 16 Jun 2026 14:00:51 +0100
Message-ID: <20260616130051.3359801-1-ross.lagerwall@citrix.com>
X-Mailer: git-send-email 2.53.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AS4P192CA0035.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:20b:658::18) To CH8PR03MB8274.namprd03.prod.outlook.com
 (2603:10b6:610:2ba::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8274:EE_|DM6PR03MB5131:EE_
X-MS-Office365-Filtering-Correlation-Id: 3cfae294-543b-414f-ffea-08decba7562c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|23010399003|1800799024|56012099006|11063799006|6133799003|18002099003;
X-Microsoft-Antispam-Message-Info:
	RToc3smbpN+4OXE6Y+NcPpF3KMuJ2yqC7qHZ2GBcKQPeIyYZjsvasnkbIIO7aaQiILP9gT2j6fO6vnJTMd/UozeZmab0sRdsXXiK9gYlsc0pHXwXiTU3Lb0TRfQR6f/YmK9VVSMMeFQkZCeORcvqWr5Oj4eaz7YwyMKURl19ILKfTFFc2LYLckdMy98avmA+ITjh4l5RE7z7y5gKPQPMqSRhBKg9cvE6jFzxH84BpVt/5yjoEZbcT6xv2a4ZTxj0OS5B5b+Tzp6rxg5k37PFqCn6uMnle1+X3892CYIIRmt3HzFjP3qO92Jew0O86cYssAR2oF0S+9cRwsinssYyYbzHVeQH9j+Ms4OUoUuZM58ETqwDecdyNUb0pjsm5e5Hg9qo2SQ0Om1LQX9Hww+kw8Rifou5y/F/HevXolxk4u8PvcUkLSn6FWXwF0PbFGYco2zbQdBFE6VZ1M7JbEb9KZqMSO0iw5KNuZUGvnCEnZOCG+hEsJ6TWKZa0SQJLniZQY2k6+XWPad4PvGIVHF/Xae8p+MMlq+5MzTUUb0pC3fvoAHavJuZTAN3FpMeG10EqLxGRb5I1NcIc3jZfUyQEEG3VLJNv6dHsSG+DtHn+HvThd0x2Wpe+0iZcIpN2k2MIRztA3yxO0khVg3josYWtRyM4QJyFfmWzxd7zF0ayoYLxk5Y7iq+r3cWPwFtFV73
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8274.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(23010399003)(1800799024)(56012099006)(11063799006)(6133799003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?BuCjxFr7fgV+0H4RC1dBta0GXg2nSsNbrOuIwH4bsoly0LzePrFY4eskC9mM?=
 =?us-ascii?Q?UqfKxUDhA8PivM0JLb0rcNQJ3gRV3xg3Uug05sreyPVZYK6PEDW99modL9dT?=
 =?us-ascii?Q?E1wY4chDljSg6PzYbJCf20vnkaozE+vArfy5UIJWyBR43Wq0twKHZHDsI24F?=
 =?us-ascii?Q?Lov2jN2VLK0nWgCZjrXCJnwDMHGZOxJnJXD+pDwJ8XXX7LqPUBrMfz98BAyR?=
 =?us-ascii?Q?0K7JnG72HtkE5vQpoQQZRh6TiF7MVzs+MYo/MMOHRCEhc4Arg4MJN0NayGJe?=
 =?us-ascii?Q?L03s6qo66WpVwQXDjzI3WPuTWJMjqCEu9uoBv5E3o3AyZi9dnCh9StibAj6i?=
 =?us-ascii?Q?gt1458S7MbB2mkFBzuWQJd2LLRaQRbm5HoSmZqkId5gHMLV1cNgj8ph8wLmN?=
 =?us-ascii?Q?R+7x2yH1CGPAeyEM/JalbaKwhn5nbZjGyJ67Y27riVShbr4DZ8Cyh5YosS0R?=
 =?us-ascii?Q?1YwZBQkgbWAF+uuUwv75N2QQ7qTpLvYGsygHA2a2TiQFdvZuLrOXIKUsBPxz?=
 =?us-ascii?Q?yl76TiAo4PBVLCLRaK9JTf/2Vuv0Nessbk4P8bgw4aWwXayH//6iraBkiaH8?=
 =?us-ascii?Q?giPCA3tr8nGqXQ46iPhYm6+fhreffsohDC47Ahe4xjcv/+aYPUSjQPX1D2FP?=
 =?us-ascii?Q?MWiNajSJiUVCNT0pib9zrIqdJDYMOtyEaFBMtoh+Y+U2vJ3YkmFg5QDA9BV9?=
 =?us-ascii?Q?c0AN7d/xBR4vA5emoGRPO9SOnejI3ZPlJoBsnGth0Ux8DysHl1MHLnINVo8V?=
 =?us-ascii?Q?Z4hyxeUtRX39bHjL+7HIZOwiqPDYfwTrzcqi2+gn0IUIUFPf1N6oSnYEbOc/?=
 =?us-ascii?Q?QEkqyjclp0L1ZHeh+ZWqsIQeYG3ZZgWL4WRJvokJsTJ4w24acvOkrfGgA5Ah?=
 =?us-ascii?Q?G/LjqhUOk4YtkO8GeOXj58dDLQ9py1iBCuRFPaPD+WsT4iuyqTGFD5Xu4B8Z?=
 =?us-ascii?Q?4gZpgDnMCCRVYdvglMHiDVU2MKXPdJlelmIhCy7wziX19h3L88y2ED/NcutU?=
 =?us-ascii?Q?dygB2Ew4wttTB3EfLIQeLhVtQTrsY4Yflv/Q2ZND8hN9obwjUA2sffwEHu05?=
 =?us-ascii?Q?w7mveJWP8bR4cVqhp+OLa8m+uXPUMHXyAzBPtHs8kWv+rIJ87+q5SY6qmlnd?=
 =?us-ascii?Q?9/4CYhp0kmEka5uhE3nGPxHA/fBGsPO08sgaC+2z2jGbM58Z4LB9JM5ku+do?=
 =?us-ascii?Q?gkemJdk4BUc0xpFG5cLvrd3n/q1dF9219fgJhFn1WQU53irFREBUNTeNF2Ih?=
 =?us-ascii?Q?Oxf0WtIYAsGP4cVQqwDmO1xriM9DhIb5AfdbYtLjb7CMq++pMViDAF6pXkDE?=
 =?us-ascii?Q?oiCAlTaOCclyEBJFIia8o0umhNE3905pu3KC/108TrsDcn903syzGk567OhS?=
 =?us-ascii?Q?QYo1N5nZOTBN6SypeHfvEur+NrdG7Rn4W9NZqQqlLC+FcF8z4p1sgv3CgSSV?=
 =?us-ascii?Q?WnEvhEeihjPzkrObE8wKaMIujGCvv58bl9XxAAlI7Mq8Nr2Bt4D8/oh3wFOm?=
 =?us-ascii?Q?UQIeG3GkpwTkGipmV5YJ3qAyyOm71ttcAuqV4m3YWtsRi+tGOf070qWYFtKb?=
 =?us-ascii?Q?+6HJ0z4MCz+PKiyc4jFQJnPCakBEZ8b1OKQhYPVYgyFb9QOoJ6b1/G2I6FkC?=
 =?us-ascii?Q?BlnN3kKyFcwSpiNnD7wRcJ5JPGg7h2HkjELe2JJfsV6sxz9ZZD5rdzhcefMJ?=
 =?us-ascii?Q?ezQON1q6yhMuyKGyLujOqnYUeUG6YT6OLiOFmuIAiTXAS1Amp/LhYypHrOD7?=
 =?us-ascii?Q?OpozYL55bwS2wV1sKrzClhkdIqf5KlQ=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3cfae294-543b-414f-ffea-08decba7562c
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8274.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2026 13:01:09.9674
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eyvWyZHwhvn5t7cJdW8itfJu8fMv4FbUya3nDgzFqMxexPGSiI0zHr2DGhqgidIeS/76hMPjXT1XdS0j/p0SZjCzJpcPtJEVOJnAxqYtV5E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB5131
X-purgate-ID: tlsNG-d62444/1781614875-B4173FF4-B79AE6EB/0/0
X-purgate-type: clean
X-purgate-size: 2217
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.68 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[ross.lagerwall@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:ross.lagerwall@citrix.com,m:dpsmith@apertussolutions.com,m:marmarek@invisiblethingslab.com,m:jbeulich@suse.com,m:anthony.perard@vates.tech,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	RCVD_COUNT_SEVEN(0.00)[10];
	RSPAMD_EMAILBL_FAIL(0.00)[ross.lagerwall@citrix.com:query timed out,jbeulich.suse.com:query timed out];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[ross.lagerwall@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,vates.tech:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 00A4268FB48

The recent changes to remove lazy FPU support mean that
vcpu_{save,restore}_fpu perform the action unconditionally. This trips
the assert when calling these functions from an idle vCPU as might
happen when calling an EFI runtime function. There is no need to
save/restore the FPU in that case so skip the calls if using the idle
vCPU.

Fixes: dba44e051209 ("x86: Remove fully_eager_fpu")
Fixes: 4b9851c64522 ("x86: Remove fpu_initialised/fpu_dirty")
Reported-by: Anthony PERARD <anthony.perard@vates.tech>
Suggested-by: Jan Beulich <jbeulich@suse.com>
Signed-off-by: Ross Lagerwall <ross.lagerwall@citrix.com>
---

Anythony, can you check if this fixes boot on your machine?

 xen/common/efi/runtime.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/xen/common/efi/runtime.c b/xen/common/efi/runtime.c
index a23fa75e3740..7713676ce288 100644
--- a/xen/common/efi/runtime.c
+++ b/xen/common/efi/runtime.c
@@ -88,6 +88,7 @@ struct efi_rs_state efi_rs_enter(void)
     static const u16 fcw = FCW_DEFAULT;
     static const u32 mxcsr = MXCSR_DEFAULT;
     struct efi_rs_state state = { .cr3 = 0 };
+    struct vcpu *curr = current;
 
     if ( mfn_eq(efi_l4_mfn, INVALID_MFN) )
         return state;
@@ -98,7 +99,8 @@ struct efi_rs_state efi_rs_enter(void)
      */
     sync_local_execstate();
     state.cr3 = read_cr3();
-    vcpu_save_fpu(current);
+    if ( !is_idle_vcpu(curr) )
+        vcpu_save_fpu(curr);
     asm volatile ( "fnclex; fldcw %0" :: "m" (fcw) );
     asm volatile ( "ldmxcsr %0" :: "m" (mxcsr) );
 
@@ -107,7 +109,7 @@ struct efi_rs_state efi_rs_enter(void)
     /* prevent fixup_page_fault() from doing anything */
     irq_enter();
 
-    if ( is_pv_vcpu(current) && !is_idle_vcpu(current) )
+    if ( is_pv_vcpu(curr) && !is_idle_vcpu(curr) )
     {
         struct desc_ptr gdt_desc = {
             .limit = LAST_RESERVED_GDT_BYTE,
@@ -159,7 +161,8 @@ void efi_rs_leave(struct efi_rs_state *state)
     }
     irq_exit();
     spin_unlock(&efi_rs_lock);
-    vcpu_restore_fpu(curr);
+    if ( !is_idle_vcpu(curr) )
+        vcpu_restore_fpu(curr);
 }
 
 unsigned long efi_get_time(void)
-- 
2.53.0


