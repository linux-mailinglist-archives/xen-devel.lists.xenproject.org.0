Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id zYJ2NGsTVmpTywAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 14 Jul 2026 12:46:03 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 599BF753884
	for <lists+xen-devel@lfdr.de>; Tue, 14 Jul 2026 12:46:03 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=valinux.co.jp header.s=selector1 header.b=tw0RCRCF;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=valinux.co.jp;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1362131.1614063 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wjae9-0006Kn-74; Tue, 14 Jul 2026 10:45:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1362131.1614063; Tue, 14 Jul 2026 10:45:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wjae9-0006JB-2Z; Tue, 14 Jul 2026 10:45:53 +0000
Received: by outflank-mailman (input) for mailman id 1362131;
 Tue, 14 Jul 2026 10:45:51 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <taka@valinux.co.jp>) id 1wjae7-0006HT-33
 for xen-devel@lists.xenproject.org; Tue, 14 Jul 2026 10:45:51 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wjae6-00HHZm-Fp
 for xen-devel@lists.xenproject.org; Tue, 14 Jul 2026 12:45:50 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <taka@valinux.co.jp>)
 id 6a56135b-2eae-0a2a0a5409dd-0a2a4502907a-4
 for <xen-devel@lists.xenproject.org>; Tue, 14 Jul 2026 12:45:50 +0200
Received: from [40.107.74.120]
 (helo=OS0P286CU010.outbound.protection.outlook.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <taka@valinux.co.jp>)
 id 6a56135c-6ca4-0a2a45020019-286b4a782f33-3
 for <xen-devel@lists.xenproject.org>; Tue, 14 Jul 2026 12:45:50 +0200
Received: from OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:458::18)
 by TY6P286MB7347.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:361::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.202.20; Tue, 14 Jul
 2026 10:45:46 +0000
Received: from OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
 ([fe80::c8c9:25cd:8d13:96d6]) by OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
 ([fe80::c8c9:25cd:8d13:96d6%6]) with mapi id 15.21.0202.014; Tue, 14 Jul 2026
 10:45:46 +0000
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
 b=s9C0P3G8hgjm90Qs9I0cF0+JR3BnJeksvOj40q/e9b41lJ+2ZKULQOWzysy5T9x6Lj2sAmqNKDM8HtxIMy4lYOXFKRIU3qfsbqvDHKvyBiT6sEYufiyBivEY7AoiKSwIaLwlDLLiSO/kBBJ5CJ5pWoabh+Ltfx/1SQz9npZ1lZjRIOdeCJYrNsrGqDgXEUArMetIp2iSjf5a4L4vBCkWoPvSA/5y9pRn9QYO8WU+6aTDwa5wj7LPmLeVL91pFUYqns1REd+DISjq/V7IslBJ38OpBXlUXz6i9Ww5IGEwAx0k88akPuOUtRGbne2Uc3FiHN+pCqGl6iEE2Sq7tF646Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aqRIT0ovWcpKUF4Ojak3jbwqwtoVYmAGHWnTq7kkF1A=;
 b=XCMEfh0T4ewItfSbeCOcDtee1BJ1hCQmV4hWg3xE54mARVtxroq1q7qezg++mjJfwFoS2PLgimiePLZ0sMV2k1hDip2vDI/S25UeSWiJ+ht6O0YOnxHfOCfhEksjT0JRu+855g6WzKTrOozLri8bMeSVYSF9fh2lBrN7zjpdbj2KyunL1kGDi7tRhm4vJ1HipH/UlOKt2ihEU9omu6W/cYvXWQxPWOph3Dwe2PG+U744hk1DhhwHVfAHY/OfGnugAJ2/rmRpUYMXvC1C7J8eDGLMegP3/iKH18CwqaFmuOMdymfBE8eZxaex4463s/vZCT7+tHNPLmTJmP+J9fcpRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aqRIT0ovWcpKUF4Ojak3jbwqwtoVYmAGHWnTq7kkF1A=;
 b=tw0RCRCFQUtvIAi8UXz2h9ML/gEFyIE6r/vxr+ioIA49uOsclVcIRtXIk6tvfx+aJJzjl2SqmTb5WQGOe6dsPV/YxCgNR9/lw2/m9kODbmry7pqs8TGVDhzYb1YdkFSzXt40DMENH3Xx4WBKqoh4HCKHXggAE+hJvVJ8Smt0v0k=
From: Hirokazu Takahashi <taka@valinux.co.jp>
To: xen-devel@lists.xenproject.org
Cc: Mykyta_Poturai@epam.com,
	Hirokazu Takahashi <taka@valinux.co.jp>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Teddy Astie <teddy.astie@vates.tech>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Dario Faggioli <dfaggioli@suse.com>,
	Juergen Gross <jgross@suse.com>,
	George Dunlap <gwd@xenproject.org>
Subject: [PATCH v6 3/5] xen/sched: Make cpu_nr_siblings() architecture-specific
Date: Tue, 14 Jul 2026 19:44:43 +0900
Message-ID: <20260714104445.919830-4-taka@valinux.co.jp>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260714104445.919830-1-taka@valinux.co.jp>
References: <20260714104445.919830-1-taka@valinux.co.jp>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCP301CA0062.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:7d::15) To OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:604:458::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS9P286MB7222:EE_|TY6P286MB7347:EE_
X-MS-Office365-Filtering-Correlation-Id: 277a1cb6-ca33-419c-3e83-08dee1950fa4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|1800799024|376014|7416014|10070799003|18002099003|22082099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	ORyZ/x+pkgqvRPBHX/qWLeCIeJhpOkLDOPduWxlVpOBsJ2VGPD+xrGmeeQw+zTMT5ifB+8KkZxl2MZDaokbsYor4U9sPeXCp8KK/AUQipCuA3nrf+BRew/PSwPUd9OxZRpoDFFdy7Vf/k4sJqYzoBNj0Erx83MHTwOhbPWG8mCD+/3Xx1RA93vAzeAlvYIS9ArnooA/7sGW+4z7pLBqINmTf/nr6kQ+ft9RhrqVs+2Ojf1n09C7jBzXnI1JnY0IGWBUzZzLo5f7kyU4OuXbNU6bZLVqmu0KRARJtJZX3BRshWeNydEddCck+xXnnycpyjagJpEqwJM8JXhLN2Phf6NW2ZZGaVtIonVbc+qDBt//gryhNGMofioxcDJqmCkRT3nhF7ItIc+vFKBBEz53ACV2HRhRLoWbIZU1XoJ08kpY6ZKTZ9oZuulf2HnCwNp/lujmhA9P7z6TGL9YPHRGJSu7P72QqKTlRkxSbUfPuxYym07NRcpXF2tbQBIZoJHZ6Xqi3KnmZuIVFEQJ1h6rmxbgzroM7KpEl4QierEHyzqsJNo7st5dqG9Qk6dJzM/vavLUKjAbfsatHboKZNlwTeCQOpVSifOXiqildxBCvnMqsNMv41fcFC1PTgdAcQkzNc3kxqmygFCBVER3axXpNnPEiB6hfhWQQhMDZz6XXd+c=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(1800799024)(376014)(7416014)(10070799003)(18002099003)(22082099003)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?lUtWFxNF8oIUjJ7ypPa6clBg8vzPK9E6ilJlqjt0AGE/nL0eLVB4FZhP0Oa0?=
 =?us-ascii?Q?tQzC6GH7rsccqZrb9qbGv6RE017pHNnM1tqiVhne5AxYeteXzh7kY4WLRsrK?=
 =?us-ascii?Q?Rutlz+TMekUFAyjOQyqH0ijwgJ7Qu8uSQIaBL32e2qLutOzcKS7h6jszKZys?=
 =?us-ascii?Q?+zGUnyGZyd/8Aybl3slhvjFtKzIpWR+dsm5HH7115TtmgRCqREvCGLlny2so?=
 =?us-ascii?Q?/HLGL0QbBM5lJYUsvvU7yMrArK7gWCUBuztLv4CBGOcVmHdxYVMtpF5EDGoh?=
 =?us-ascii?Q?m2/8Ai6pGVwoREzeDr0O7nAFiOqLSTKVMpzEQLkLIusrMMfLoiaeP6iFJ56G?=
 =?us-ascii?Q?b4FwMRvJWbzCsRuQZdCcYyBDp5mM//75XSX6Oa56+xzXUN7/2yOkSKsfA2Q6?=
 =?us-ascii?Q?L91sFbcAcFiWhtyyJNgU+Wu0DjbgYhknnvf7b9sDHFf6U2XDkv7T5vwmTvii?=
 =?us-ascii?Q?KALoRnFLViPK54GcD1mAcOQ6HktiDAzPW+CbCp6n/M2/nIiO7Ey+2qTrdT6H?=
 =?us-ascii?Q?TmcQ2A1ZaIfYYVYByqo0MmfelpTmO38jFGAlzMYbZ0DPYQZr2OhdBmZ/JP5b?=
 =?us-ascii?Q?HTTDX/YxXpqFH9VC3DQJCKd4UiQbH0U8qjCvBeQQdqeEd8n4Yujs9XDfrTUp?=
 =?us-ascii?Q?MXqI8g4hiwNiDDG/ucrX4/dh7oq1YVsZYbIuxBh2rmYb9GFQHLkwEFGKr1XX?=
 =?us-ascii?Q?W10htWrg4LEuZXYwr7NGcfrLNKTuXKqldV8+69DXQGl4vfPA9dOT8uAuLXD6?=
 =?us-ascii?Q?/BbTYy9gIRdxg5xDk0HeTWaT65wOIefEBo2OCTta/XrGyKe7FdVEMiTELMz7?=
 =?us-ascii?Q?nM7aqr1TH5NBpzLhB4aEsOhf0WF+/bprm67C7Sqw/Gl+7pSnS0Ys3D/kdxLA?=
 =?us-ascii?Q?2Ybk90lILCBp3sjS7FbSIil8ZYyT6q7+Noef+OkuILXO8v1NIRO3WxtE6pUH?=
 =?us-ascii?Q?KLPNoOGa4sJdiBmZiRLmXu4tz6IRjnTKEy+EO5oVffvLKjWgcz+lmtiGvGR5?=
 =?us-ascii?Q?VkmPTaDK04cTp8eI+pOi2jdbos5iVHJ3CFI1hKJdfGWxhkv3iaaK6UuZFp2Y?=
 =?us-ascii?Q?D/MoxGugcEB7x15I13kPNK99+iSB3pQOFPuglBHUFnGYKMHue6VZuJ583fj5?=
 =?us-ascii?Q?3NEcpjeLp6stZwsz3egQvrYn/wLLL2xy07oyzuDEHToq6yG8JJO1g7lLtk4n?=
 =?us-ascii?Q?JT8fijlbA5YzofvmIYH2MGSqTQez8pIm4LG51BqcicZfYJcbKnJXqyMj1gX8?=
 =?us-ascii?Q?X68IK5pwbzJnjuCf7rebha45SV6DY2AYRUW046vqb6eRGEQOPnTJ8WvavCDn?=
 =?us-ascii?Q?3sODVPylC0fNF18iDFLDROyv7U3FvN5UQMXHCrq32HmUw1yuo+JpCjB6YZUr?=
 =?us-ascii?Q?fzQsBHfDavE1ydkKhhxJe/C6PTcK5Dck1MqL003yB7pnfnJbh/tYVsltLRSu?=
 =?us-ascii?Q?uoKajQOvOfhKK4YRehLPbeRYKMQmEF+oVhpmZVeO4VgbkkUApD/wcLe+EAlF?=
 =?us-ascii?Q?z4WtQkPwURA7rGIQU04z3f60yGQxyfKEaUedW7yVsjiWbiClcJeMK+0iFkgN?=
 =?us-ascii?Q?6AfrXFIijTrznMX8+YI/MyHgAtAOBwdPf3IL1VTkOdWLPHmwySv+Nry/Xo5O?=
 =?us-ascii?Q?YTRYV7oztNOnUInoIpHHSkB4fI05c74KNIq41hFn/OZW4HiWqLpzJ3RXNSfm?=
 =?us-ascii?Q?SRlKGspw7wQcg2CuR94DU33H6RgwaEUIggL9LlU3KikMuE7Hk5EN+73ccjEI?=
 =?us-ascii?Q?nouI4RcOozMx9+jOyPUq9nZz/1Y4KbgvLB72BELzwPJsNYXn7bvys9nvHAiC?=
X-MS-Exchange-AntiSpam-MessageData-1: 5kRIWTpL4TU5nw==
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: 277a1cb6-ca33-419c-3e83-08dee1950fa4
X-MS-Exchange-CrossTenant-AuthSource: OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jul 2026 10:45:46.2585
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1I4fFc8juALGETbMm8onk7TUY9xvGRJdK1os6xESdoNTH+LWMxjoHRAL/I2wybJyhFTIYBwlzt/6yk8gn819qQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY6P286MB7347
X-purgate-ID: tlsNG-720697/1784025950-F1CAA2AC-AD3C4902/0/0
X-purgate-type: clean
X-purgate-size: 3400
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.69 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[valinux.co.jp,none];
	R_DKIM_ALLOW(-0.20)[valinux.co.jp:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[taka@valinux.co.jp,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:Mykyta_Poturai@epam.com,m:taka@valinux.co.jp,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:sstabellini@kernel.org,m:dfaggioli@suse.com,m:jgross@suse.com,m:gwd@xenproject.org,s:lists@lfdr.de];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:from_smtp,lists.xenproject.org:helo,lists.xenproject.org:rdns,valinux.co.jp:from_mime,valinux.co.jp:mid,valinux.co.jp:email,valinux.co.jp:dkim,suse.com:email];
	FROM_NEQ_ENVFROM(0.00)[taka@valinux.co.jp,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[valinux.co.jp:+];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 599BF753884

Make cpu_nr_siblings() an architecture-specific function.
This patch provides the implementation for x86 and a common
version for Device Tree-based architectures.

Signed-off-by: Hirokazu Takahashi <taka@valinux.co.jp>
Acked-by: Jan Beulich <jbeulich@suse.com>
---
 xen/arch/x86/include/asm/processor.h |  1 +
 xen/common/sched/credit2.c           | 22 +++-------------------
 xen/include/xen/cpu-topology.h       |  5 +++++
 3 files changed, 9 insertions(+), 19 deletions(-)

diff --git a/xen/arch/x86/include/asm/processor.h b/xen/arch/x86/include/asm/processor.h
index 8ca6799a81..9758060129 100644
--- a/xen/arch/x86/include/asm/processor.h
+++ b/xen/arch/x86/include/asm/processor.h
@@ -106,6 +106,7 @@ extern void intel_init_arat(void);
 
 #define cpu_to_core(_cpu)   (cpu_data[_cpu].cpu_core_id)
 #define cpu_to_socket(_cpu) (cpu_data[_cpu].phys_proc_id)
+#define cpu_nr_siblings(_cpu) (cpu_data[_cpu].x86_num_siblings)
 
 unsigned int apicid_to_socket(unsigned int apicid);
 
diff --git a/xen/common/sched/credit2.c b/xen/common/sched/credit2.c
index a69327c808..6c645f0e21 100644
--- a/xen/common/sched/credit2.c
+++ b/xen/common/sched/credit2.c
@@ -29,22 +29,6 @@
 /* #define d2printk printk */
 #define d2printk(x...)
 
-/*
- * TODO: Abstract this properly, and figure out what Credit2 wants to do with
- *       the fact that x86_num_siblings doesn't even have the same meaning
- *       between x86 vendors.
- */
-static unsigned int cpu_nr_siblings(unsigned int cpu)
-{
-#if defined(CONFIG_GENERIC_CPU_TOPOLOGY)
-    return cpu_topology ? cpu_topology[cpu].num_siblings : 1;
-#elif defined(CONFIG_X86)
-    return cpu_data[cpu].x86_num_siblings;
-#else
-    return 1;
-#endif
-}
-
 /*
  * Credit2 tracing events ("only" 512 available!). Check
  * include/public/trace.h for more details.
@@ -882,9 +866,9 @@ cpu_runqueue_match(const struct csched2_runqueue_data *rqd, unsigned int cpu)
 
 /*
  * Additional checks, to avoid separating siblings in different runqueues.
- * This deals with both Intel's HTs and AMD's CUs. An arch that does not have
- * any similar concept will just have cpu_nr_siblings() always return 1, and
- * setup the cpu_sibling_mask-s acordingly (as currently does ARM), and things
+ * This deals with Intel's HTs, AMD's CUs and ARM's SMT. An arch that
+ * does not have similar concept will just have cpu_nr_siblings() always
+ * return 1, and setup the cpu_sibling_mask-s accordingly, and things
  * will just work as well.
  */
 static bool
diff --git a/xen/include/xen/cpu-topology.h b/xen/include/xen/cpu-topology.h
index 82608b7789..8c653a1582 100644
--- a/xen/include/xen/cpu-topology.h
+++ b/xen/include/xen/cpu-topology.h
@@ -46,6 +46,7 @@ static inline void init_cpu_sibling_map(unsigned int cpu)
 
 #define cpu_to_core(cpu) (cpu_topology ? cpu_topology[cpu].phys_core_id : 0)
 #define cpu_to_socket(cpu) (cpu_topology ? cpu_topology[cpu].phys_socket_id : 0)
+#define cpu_nr_siblings(cpu) (cpu_topology ? cpu_topology[cpu].num_siblings : 1)
 
 #else /* CONFIG_GENERIC_CPU_TOPOLOGY */
 
@@ -64,6 +65,10 @@ static inline void init_cpu_sibling_map(unsigned int cpu)
 #define cpu_to_socket(cpu) (0)
 #endif
 
+#ifndef cpu_nr_siblings
+#define cpu_nr_siblings(cpu) (1)
+#endif
+
 #endif /* CONFIG_GENERIC_CPU_TOPOLOGY */
 
 #endif /* XEN_CPU_TOPOLOGY_H */
-- 
2.43.0


