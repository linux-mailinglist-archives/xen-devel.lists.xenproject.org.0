Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8H8hI9AQC2pN/gQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 18 May 2026 15:14:56 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AACC56D6D8
	for <lists+xen-devel@lfdr.de>; Mon, 18 May 2026 15:14:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1311858.1582030 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wOxny-0001vY-Mp; Mon, 18 May 2026 13:14:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1311858.1582030; Mon, 18 May 2026 13:14:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wOxny-0001tP-G4; Mon, 18 May 2026 13:14:46 +0000
Received: by outflank-mailman (input) for mailman id 1311858;
 Mon, 18 May 2026 13:14:45 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ross.lagerwall@citrix.com>) id 1wOxnx-0001nH-6n
 for xen-devel@lists.xenproject.org; Mon, 18 May 2026 13:14:45 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wOxnw-000mZB-Ix
 for xen-devel@lists.xenproject.org; Mon, 18 May 2026 15:14:44 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <ross.lagerwall@citrix.com>)
 id 6a0b10b5-bab6-0a2a0a5309dd-0a2a45028f1a-46
 for <xen-devel@lists.xenproject.org>; Mon, 18 May 2026 15:14:44 +0200
Received: from [40.107.208.42]
 (helo=PH0PR06CU001.outbound.protection.outlook.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <ross.lagerwall@citrix.com>)
 id 6a0b10c0-af86-0a2a45020019-286bd02a7639-3
 for <xen-devel@lists.xenproject.org>; Mon, 18 May 2026 15:14:42 +0200
Received: from CH8PR03MB8274.namprd03.prod.outlook.com (2603:10b6:610:2ba::5)
 by BY5PR03MB5111.namprd03.prod.outlook.com (2603:10b6:a03:1e2::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.24; Mon, 18 May
 2026 13:14:39 +0000
Received: from CH8PR03MB8274.namprd03.prod.outlook.com
 ([fe80::ebe2:32c1:d2be:a096]) by CH8PR03MB8274.namprd03.prod.outlook.com
 ([fe80::ebe2:32c1:d2be:a096%7]) with mapi id 15.21.0025.022; Mon, 18 May 2026
 13:14:39 +0000
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
 b=nUCV8Dv9bhFFV1MyNsMYFaX0wcL/ybkVWtsPaKZNzle4kMKaXTQpOeNJxCWD7B7wSEXliMEuw7EZ+78/+KV9DTVw9twyxUetliyqAEe8L+CW5Q41CaOuOMYx3hzfq3DPHIO4qzf+rMG8j4ZE14oyYxgwVLp6hEizH8AFfDPKtpeRP0a4rWoHix1HL0Fg45bqTHDZJDbo+JarUxb6q8CkCz1BqWbvNpgXDaIkoQEzQVKQ1stpO+1i2Fe8rafDDkWPr4DLQZdKxo/WvjUxAmlCFvCBGbnrrjNwoE7M2vuvMBOhaN1HOkKUIPWDTVahbHkoAs3LO6dfLHNGlnpsPWOwxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jSz8C0IVcytuL/56tb/6U7V4vTK3UtX0AriIPF8ktGk=;
 b=kfFgBKM5E9JPBwfHVq8mJjt52jtJC8jfqOwqKWqwHRy54Wp8W3otK6y2u0O/1Y0ZI+EuH6TQZQA2ZKtg2tZLIDWBTbB7B9gz0TbOxw32eVXm2k3On4TgtAMXUM9yGWT4lzv6EtEezv26Daqnaydznt+ljbqoslrZimyE6h7jKibxmgWkPOGDCJwvGsdcZbSpI/T1INWdEJaNl0UhKkNiJ9mQYV4/wAf+XBiGCbc85nAJzQUEDM0ru2vdjog/NExdZeXoKElRKff9MUj1Zm/NNhvuzsQcdh7a1MR+cjbzHf3dMX6prw5+VxlWXT4Qa5b0EBqi5cUPGYJ5fww2tFPTig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jSz8C0IVcytuL/56tb/6U7V4vTK3UtX0AriIPF8ktGk=;
 b=X13BSbgcVhVwZT4CqFily1CcqrLPtg4heqRRSnQl3QcXuvCZMJi5gEpUmgEg0+UmbRZsFPokBa/7J7CwIt2E06EUl2/0wRuQgqwiFtWDtlPdNVPWncDyQZlFvzXFTjTscWOLsGFv+HX5gUagPxYdXLNcGWm7pJo0hArXGyhWWPc=
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
Subject: [RFC v1 7/7] x86/svm: Use the emulator path for VMEXIT_CR*
Date: Mon, 18 May 2026 14:14:04 +0100
Message-ID: <20260518131404.3716969-8-ross.lagerwall@citrix.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260518131404.3716969-1-ross.lagerwall@citrix.com>
References: <20260518131404.3716969-1-ross.lagerwall@citrix.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0572.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:276::22) To CH8PR03MB8274.namprd03.prod.outlook.com
 (2603:10b6:610:2ba::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8274:EE_|BY5PR03MB5111:EE_
X-MS-Office365-Filtering-Correlation-Id: c9d292ea-384c-4986-33ff-08deb4df6a9b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|22082099003|56012099003|18002099003|11063799003;
X-Microsoft-Antispam-Message-Info:
	awEB4N86Z7GSbvrO1oyHCwt1rs0bAQB0gn69AORCGP9gWSzSfKjIV5PLsX6sdwU1SBlBELf00840pF4rzouwHeaqDP+3q9kiC08RYQ75ybaj3aGHn5bZFarZEZSav+my2PPjsxjoiabJxPtN5aODW/pv4m+QJhxZknLMpdpttaEuERipVXkaWkcLNAWvOhWsd0vTfJeakUkJPD5iqpWVSIsFQm8EnnEMWDUeHFVvfIcEBEWPC/ibs2KB54ncOe6q26c+N1Nr8PMd1Q8cUC1q68901DuX+vQQXtt/k/o8PYZTu68xPvApBb+yygEbWL3CVOXPEwNbqw2Sf6/+Ak8XQjN0csO0KuzS9mpqzjN5sjS50yMbNCnkeZGIe0H1HXqVl9UDDT7vZ825QXTyaaacU7mmxL4//yZbBj0miO9F7EGfeCzG1X28NjvFsNBDv4mYf+pPtGGAS+V6Ff1UmQtbt0mp1OGA6le80O/dgH62GPonATT3phHjI4xKIh4QXp65tHvr9qevlsOynkR+H7yU4F9Er9P9RLht+7LZQKVRATYtZjHlSWpozT1Vd/hJzPV+pcmvx++VQ6r67ta93D/SPj8HRW1MvyOGfopzZWiKkillfIgobX7YwB/VZoe08pt2PZ/qlK8RPCilptA+S2eq0EnCvu0urRSy5ZlraJAVLzSTq0MyHjIrQ16qCp4h1NDw
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8274.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(22082099003)(56012099003)(18002099003)(11063799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?maTtU7xVEhLCIjQn3HOqwAadUg48LJLeOsf/1a+LifRPUoYFoserKkqw6QF3?=
 =?us-ascii?Q?V4DoXJ9PWMZvYioz/dpNMGtFzR8w6sNuE36gi+UIi8vfWrMmCSXaqCoKG8KJ?=
 =?us-ascii?Q?YKGYpDhFqZZXKgfRqES6+TWKPCnoGNo2bZdeqGp4eDY1VvplBoHCB7L8Up65?=
 =?us-ascii?Q?nSQWQxK7dPXqS4iYUoGkFYqMFqN1Ec2ReO+MuwRfcEuV7xzzqXpvJBKDr/ce?=
 =?us-ascii?Q?vdC2WPtROdu8RQlQytx7nIt/9rI8e29Cwn7wcK58i+S6+tpORwAgdrvZHCl4?=
 =?us-ascii?Q?V53asSOEiFKv//LR685oW2KWmgfhiOWX8gq6q0dp/9Ckrp/3ekyiqS6+icC6?=
 =?us-ascii?Q?QpX05CryFk7zJA40khLPxlCFn+yt8EZmuq0WAH5koaEv5jp3Ra3P3oDARD5R?=
 =?us-ascii?Q?5BGTL/mhgHH0/Ik5UEssTNW9LFzTG/5y0QbSSeK25pW0ZqyNDRUSkYP+cnEy?=
 =?us-ascii?Q?7KkfDWX8YgJ6iqiLN2xqBiL+OT3WMtGl24P1eKy6dL5y71ZdF1eyhlEzi3LL?=
 =?us-ascii?Q?UULM9rbwKcSEHV+QRcsC28zNzOPYGcsA1zXrPrLydTuES+iJAYEWo6AnaCb/?=
 =?us-ascii?Q?DMCMSzjH8ewdPsLEF7EFom8YKxJsayA33PLT9slMmJsblu/xUdYh60d8ErMi?=
 =?us-ascii?Q?KRJiRNaYY83kMm7yTejqS24duFrnXWDry1BYR4PNIUbTHOWPA15IZA5L1wYm?=
 =?us-ascii?Q?rXUI/aCIoRF/sPxvjg6j62K2pA/TKpUtLTMwyveH/OOx5qYBVG39axpASMeP?=
 =?us-ascii?Q?gTi2PjJEQSRhhvTY89x7Ai/DNzhrrEnO1DeSRQZmbL0qindyjGhEUPPUgxzg?=
 =?us-ascii?Q?eitW4zCBFpPTlXbT8YWXZozp0GmuQL96SBQnY8r24GlvGsjAwmiWvF6LP0L+?=
 =?us-ascii?Q?cFbwr7J/9+WfqTVIeOxKL0SqqCXdLiGmPn9DZCn5oU5HIG+d8D9lib2WF221?=
 =?us-ascii?Q?zioI4ph0nzR8xlGeYkRVbZW4m8xiAWj6WS66EyXnL1nRZ6monSE96Sr8Zc06?=
 =?us-ascii?Q?Ezt142rzwB8lLHnXpOEXfhmFyMmeXfgGtSelndTwbrZYilv2+ucoKXkc1JxJ?=
 =?us-ascii?Q?vB1eGss4WvSEjKnRR2jnGTwWqnHx5FsM1Da5bCGi3k9AfEeOJRkY6k8LMqdo?=
 =?us-ascii?Q?5LYytdUUGrfGDvqMlW7z2PA62ok/1FCJP2XASq4x0iu+ei3/YotIVpg1qVnP?=
 =?us-ascii?Q?5bGsb0cN7XsxdIIe9N9SemLggoHX5CjXNANbstxNSUFAfGugmiSroYM8I0kd?=
 =?us-ascii?Q?c3cNZY9PA2CKXcKo9tZDmVvjxDNyulUb0WxRvNKhwkfLCq5vNw1uH6F90U0T?=
 =?us-ascii?Q?yMzFHI6wnTO9essGV+48hgjB3KEIfyPTFObbdKAznch2dPiRkMEJLt3XYPdg?=
 =?us-ascii?Q?fA7OEMUfujRvkTq1s3byjbUC9ikJzueeTUeyC/kUsSg5D9gPGpNamEATs//s?=
 =?us-ascii?Q?I8U4Q+RGoslDVRNFXuiwGQoG5fl5N6ywoAAjPB0c9k/I6alchhYhg3J4Iqq2?=
 =?us-ascii?Q?VbdAXtG75TBvqwF/pMDlnRqVo9TvYQrO6bNsxxf2wsU4DBt5Zg7t9Hb5BzM7?=
 =?us-ascii?Q?NYYmwpHdbqY8b14NjYK0NCRoDEAC35K1rNWkRpBOW9Yt9fsM/Mv4dqp1h9LR?=
 =?us-ascii?Q?zZRxAZG2ZSMcGrnsRICX6x378cAavb2Rm8/V+D+yAVra5kkUdRGbDXccxUrG?=
 =?us-ascii?Q?mEccvqLwh63QM7Arnr7d/5kQUwUkwsaCZhnbWIPj+9FwhxBXJE1Nd+d78BXZ?=
 =?us-ascii?Q?A/Bq+Ss+Efik98xsiOK7aTik9LnuiEk=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c9d292ea-384c-4986-33ff-08deb4df6a9b
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8274.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 May 2026 13:14:39.3120
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lDMkA7rcZ+a+Jv/8DWmkxJFd5Ek8NCzaSsxwCb1fv3haWbdW8QKGl50JRFTQKjTPbGl2ThEQh6y041N816GxX1i5OEKs1fBdNdV1h3VNZ2c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR03MB5111
X-purgate-ID: tlsNG-720697/1779110083-83762161-3447B30A/0/0
X-purgate-type: clean
X-purgate-size: 4269
X-Rspamd-Queue-Id: 0AACC56D6D8
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[citrix.com:email,citrix.com:mid,citrix.com:dkim,cr.gp:url];
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
	NEURAL_HAM(-0.00)[-0.999];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	DKIM_TRACE(0.00)[citrix.com:+];
	RCPT_COUNT_SEVEN(0.00)[7];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Action: no action

If the processor has provided extra information, use that to accelerate
the emulator path.

The hvmemul_{read,write}_cr callbacks are used for consistent behaviour
between emulated and fast paths.

Signed-off-by: Ross Lagerwall <ross.lagerwall@citrix.com>
---
 xen/arch/x86/hvm/emulate.c             | 11 ++++++++++
 xen/arch/x86/hvm/svm/svm.c             | 28 +++++++++-----------------
 xen/arch/x86/include/asm/hvm/emulate.h |  7 +++++++
 xen/arch/x86/include/asm/hvm/hvm.h     |  2 ++
 4 files changed, 29 insertions(+), 19 deletions(-)

diff --git a/xen/arch/x86/hvm/emulate.c b/xen/arch/x86/hvm/emulate.c
index 471c032c1e9c..0f7507575884 100644
--- a/xen/arch/x86/hvm/emulate.c
+++ b/xen/arch/x86/hvm/emulate.c
@@ -2804,6 +2804,17 @@ static int _hvm_emulate_one(struct hvm_emulate_ctxt *hvmemul_ctxt,
             hvmemul_ctxt->ctxt.retire.hlt = true;
             rc = X86EMUL_OKAY;
             break;
+        case INSTR_MOV_FROM_CR:
+        case INSTR_MOV_TO_CR:
+        {
+            unsigned long *val = decode_gpr(regs, hvmemul_ctxt->u.cr.gp);
+
+            if ( hvmemul_ctxt->insn == INSTR_MOV_TO_CR )
+                rc = hvmemul_write_cr(hvmemul_ctxt->u.cr.cr, *val, &hvmemul_ctxt->ctxt);
+            else
+                rc = hvmemul_read_cr(hvmemul_ctxt->u.cr.cr, val, &hvmemul_ctxt->ctxt);
+            break;
+        }
 
         default:
             ASSERT_UNREACHABLE();
diff --git a/xen/arch/x86/hvm/svm/svm.c b/xen/arch/x86/hvm/svm/svm.c
index 2d6022d6238c..3ba852f52666 100644
--- a/xen/arch/x86/hvm/svm/svm.c
+++ b/xen/arch/x86/hvm/svm/svm.c
@@ -1625,22 +1625,6 @@ static void svm_do_nested_pgfault(struct vcpu *v,
     domain_crash(v->domain);
 }
 
-static void svm_vmexit_do_cr_access(
-    struct vmcb_struct *vmcb, struct cpu_user_regs *regs)
-{
-    int gp, cr, dir, rc;
-
-    cr = vmcb->exitcode - VMEXIT_CR0_READ;
-    dir = (cr > 15);
-    cr &= 0xf;
-    gp = vmcb->ei.mov_cr.gpr;
-
-    rc = dir ? hvm_mov_to_cr(cr, gp) : hvm_mov_from_cr(cr, gp);
-
-    if ( rc == X86EMUL_OKAY )
-        __update_guest_eip(regs, vmcb->nextrip - vmcb->rip);
-}
-
 static void svm_dr_access(struct vcpu *v, struct cpu_user_regs *regs)
 {
     struct vmcb_struct *vmcb = vcpu_nestedhvm(v).nv_n1vmcx;
@@ -2869,10 +2853,16 @@ void asmlinkage svm_vmexit_handler(void)
 
     case VMEXIT_CR0_READ ... VMEXIT_CR15_READ:
     case VMEXIT_CR0_WRITE ... VMEXIT_CR15_WRITE:
+        hvm_emulate_init_once(&ctxt, x86_insn_is_cr_access, "CR access", regs);
+
         if ( cpu_has_svm_decode && vmcb->ei.mov_cr.mov_insn )
-            svm_vmexit_do_cr_access(vmcb, regs);
-        else if ( !hvm_emulate_one_insn(x86_insn_is_cr_access, "CR access") )
-            hvm_inject_hw_exception(X86_EXC_GP, 0);
+        {
+            ctxt.u.cr.cr = vmcb->exitcode - VMEXIT_CR0_READ;
+            ctxt.insn = (ctxt.u.cr.cr > 15) ? INSTR_MOV_TO_CR : INSTR_MOV_FROM_CR;
+            ctxt.u.cr.cr = ctxt.u.cr.cr & 0xf;
+            ctxt.u.cr.gp = vmcb->ei.mov_cr.gpr;
+        }
+        svm_emulate_one(&ctxt);
         break;
 
     case VMEXIT_INVLPG:
diff --git a/xen/arch/x86/include/asm/hvm/emulate.h b/xen/arch/x86/include/asm/hvm/emulate.h
index 1e626f8af8f2..3661ca28d6f4 100644
--- a/xen/arch/x86/include/asm/hvm/emulate.h
+++ b/xen/arch/x86/include/asm/hvm/emulate.h
@@ -56,6 +56,13 @@ struct hvm_emulate_ctxt {
 
     unsigned int insn;
     unsigned int insn_len;
+
+    union {
+        struct {
+            int cr;
+            int gp;
+        } cr;
+    } u;
 };
 
 enum emul_kind {
diff --git a/xen/arch/x86/include/asm/hvm/hvm.h b/xen/arch/x86/include/asm/hvm/hvm.h
index a9b64814ca71..7732217e279a 100644
--- a/xen/arch/x86/include/asm/hvm/hvm.h
+++ b/xen/arch/x86/include/asm/hvm/hvm.h
@@ -879,6 +879,8 @@ static inline void hvm_sync_pir_to_irr(struct vcpu *v)
 #define INSTR_RDTSC      INSTR_ENC(X86EMUL_OPC(0x0f, 0x31), 0)
 #define INSTR_RDMSR      INSTR_ENC(X86EMUL_OPC(0x0f, 0x32), 0)
 #define INSTR_CPUID      INSTR_ENC(X86EMUL_OPC(0x0f, 0xa2), 0)
+#define INSTR_MOV_FROM_CR INSTR_ENC(X86EMUL_OPC(0x0f, 0x20), 0)
+#define INSTR_MOV_TO_CR  INSTR_ENC(X86EMUL_OPC(0x0f, 0x22), 0)
 
 #else  /* CONFIG_HVM */
 
-- 
2.53.0


