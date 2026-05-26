Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qFg5FgKVFWpSWgcAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 26 May 2026 14:41:38 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FCEF5D5B26
	for <lists+xen-devel@lfdr.de>; Tue, 26 May 2026 14:41:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1319822.1587278 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wRr5i-0004vi-T8; Tue, 26 May 2026 12:41:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1319822.1587278; Tue, 26 May 2026 12:41:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wRr5i-0004tE-P4; Tue, 26 May 2026 12:41:02 +0000
Received: by outflank-mailman (input) for mailman id 1319822;
 Tue, 26 May 2026 12:41:00 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ross.lagerwall@citrix.com>) id 1wRr5g-0004hF-O4
 for xen-devel@lists.xenproject.org; Tue, 26 May 2026 12:41:00 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wRr5g-003dxT-3x
 for xen-devel@lists.xenproject.org; Tue, 26 May 2026 14:41:00 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <ross.lagerwall@citrix.com>)
 id 6a1594da-e002-0a2a0a5209dd-0a2a450a8828-8
 for <xen-devel@lists.xenproject.org>; Tue, 26 May 2026 14:41:00 +0200
Received: from [40.93.194.14]
 (helo=SN4PR0501CU005.outbound.protection.outlook.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <ross.lagerwall@citrix.com>)
 id 6a1594da-56b3-0a2a450a0019-285dc20e9618-3
 for <xen-devel@lists.xenproject.org>; Tue, 26 May 2026 14:40:59 +0200
Received: from CH8PR03MB8274.namprd03.prod.outlook.com (2603:10b6:610:2ba::5)
 by SJ0PR03MB7128.namprd03.prod.outlook.com (2603:10b6:a03:4e7::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.12; Tue, 26 May
 2026 12:40:56 +0000
Received: from CH8PR03MB8274.namprd03.prod.outlook.com
 ([fe80::ebe2:32c1:d2be:a096]) by CH8PR03MB8274.namprd03.prod.outlook.com
 ([fe80::ebe2:32c1:d2be:a096%7]) with mapi id 15.21.0048.019; Tue, 26 May 2026
 12:40:56 +0000
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
 b=EEOkTT6pq7FLlYfKxLIa88/mHRGsxUc3Ek2dqbjtuFBVBbBDa66kEnrhQhX5u4GH2BkmOP84WIJUYcxPpKQWIpQX9VrAA/tq455HnvBPoO6LoHunFsoRH0YyOLD1y1Gm/bY218RCkpbgfVVrcwPW2hMpUxlfMxSqHBJ6lj5hZVKDfM6j2md/+0VbvuZG0qogVhbPixF+bqKK7MiMb+pVe3O5+i8z+hCXVvk+8Y4hUy7e1NyPPmnxdutjEm29WHD4Gk2jE+l9ja//cYx5jELB/llIvgkw4Sh44DM6ueOZMaDyEssnHdY2JrP7G3dYUWUXxpC8M1Ig1OugV3lw7Hyx7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GX+1TOnlCGkHWbfkqlqcLqEwDZoZkQlvgzLo/cb85NU=;
 b=IszNPlSq+YJ/Fc7HcXzZ9gcdCZ4qi5W2dG/Sy9QpD1FpFFx8SLVLCpoBBELrFkkfxJPe0eotvazl6NOEfSb/ptqwtMV7SQmxtM57kObl9dQkDB2a4sbs9YK64gNM76P1rrGj2ndQA7pdPLpbBdaU4Qsbq+ND/i4JbNUC+OGanrXn3dyS2AE1g+lzkA0+bvp1+nGssnj2DgpoRIB8R7TdRML14w13w+9G1eC1uh9HdPmMyBzbP6P2z7NMqjgOcpcg8lJt1gigOhfHRFviu+35iWh8UkFJfsPljvvTntP9i09l0ZDZDMVkLEXYG7moK9fcOh/cLSM5TkPV8ZFQ/nzJSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GX+1TOnlCGkHWbfkqlqcLqEwDZoZkQlvgzLo/cb85NU=;
 b=EzvFcPoXH1Ygd0NBjCVYqm42hZgtubfK/ogHjmWjw39EGttohjuUSOGlEpHd9iciYxTWVihLeQFqy/423L2REqEgmzWWSaTVlN9AHQyNnoWd4v/XZYfGnLeGFm2x5HhsmYIL8E5nHhzidfRwwSq5uuzwiWcrBG/mAXO4Gt2NG3k=
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
Subject: [PATCH v1 2/6] nestedsvm: Adjust L2's DR intercept when adjusting L1
Date: Tue, 26 May 2026 13:40:23 +0100
Message-ID: <20260526124027.573412-3-ross.lagerwall@citrix.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260526124027.573412-1-ross.lagerwall@citrix.com>
References: <20260526124027.573412-1-ross.lagerwall@citrix.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0365.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18e::10) To CH8PR03MB8274.namprd03.prod.outlook.com
 (2603:10b6:610:2ba::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8274:EE_|SJ0PR03MB7128:EE_
X-MS-Office365-Filtering-Correlation-Id: 9b4c0d73-dbbc-4551-e90a-08debb240867
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|1800799024|3023799007|6133799003|11063799006|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	n4JLV41MmolSKU4N8Oef0JYHVBpL+KUW7+CvNa3nhzeUVDmGe5mwqkocCG1BaAJFR+jacb47yoNmoXVmbI9oDIDRljlIcWF6DmoMEMk9xQCY7CdRezfX0hqi2rYt5YvfmN1t1RaFust+uCMgoYRqZxROrgraiHrDg35+aNvrQNzsqQqJtsA+w8rPDYNZChwnNxUlGP8dbFhl+yDB/4BMMffdzctzmxJYumW3Qqh7v5zz/2gIxqFlR0vE1GoPxuAxDWkpgBs8cwTLz6v5FPuYttnP5V7BvQewlGBNneFoUYeEZiKUXBnh/2/wrpZjMNHRnX7072gmaNDTepRNm9rWmf2Lk/5I5oitEENEhNPqTRLe5AqMJfoyqu9W+pVUOjUX8JxgcMxRCOOejG3kWrGdDrr8itinYC7e583kvka4Plbne1Rdx9ybXqoRvqFBRGHLu06C3ZtcFl+oaom42iiWKw0YcPV6/cBJxnePqmnyKpbxSDja9I2vrn4rLfptcMGRwinm+NL9uPxW3bb1elMu/xsaf6C0iZ5TPd3uPdA4NiP0o4WtpyM+6atSFd2UgviMu59I1oSn01UYmwkMSj2/8hrPDQIiDfatxgwwcMR7K/ON6zTZ88gtbkeLDJL0IghGLPMq208kXVK/ZrUdrWTAKZyqnhxR2rn07knX+Il8o9tfMvo+94x/wxZhBHum00aO
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8274.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(3023799007)(6133799003)(11063799006)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?eKgjhetw2Jxup0K5BX4qlVL97XhGII10rTmFyjuUiGn1BtOZ/H+qh7Ck/FVV?=
 =?us-ascii?Q?Q1jHhlRh69pHfZLXUTU3AVe30jZkJVSBU51D99Kk+Rl0vUL5rfM2ZkeKIz6x?=
 =?us-ascii?Q?zLRrA4qB4Z/6zXipXUtyksvPVsa488LdAdv+UgJktMfvGk/U4g1en6rKitS5?=
 =?us-ascii?Q?XiBJgveqJbvgF1vCgLZsUe6djO3fIT5OiXtyw7AI2uEcWjg2bJSk5fF2sDBk?=
 =?us-ascii?Q?7yC4wnT4NYwHjkocJkVMWBatJru9SXG6kF5Y/9QZMxyq5VUuBHgCehugcEP5?=
 =?us-ascii?Q?U77YDkubdkbPjHRCJMEp/kLCtb4sFQCDat+JM5Mry2JTOihdQDVrxkIEbbDq?=
 =?us-ascii?Q?D7H2FmfnyRzB6TusJ8Q9aN7uRDio6redflwOTzlAtPmfqCUGy1kU2syQrQ4q?=
 =?us-ascii?Q?Kk08Iqsn7G/ctdbjkyTl7wpxiPvSSXEcGzYkLf0+gRttWuVxn2mdQDwg6kau?=
 =?us-ascii?Q?yuoRVRNn2qiZQb0z2SzVwfgTzttqW9jzPVKVEVKiQh3yb6eUkN0utPhIEFkN?=
 =?us-ascii?Q?31qzJU1iJbc4FUNNXNlP7mdUkwOVbn8BA1dHnknOmTM+/bX1F7X5IBmz6bfG?=
 =?us-ascii?Q?oMeYeQ4P2g9vtdKgmzYERrToq94HiiCLjS9j/7REwCWR0kkgpxG6wPUieZp9?=
 =?us-ascii?Q?+u1O8suvQvlDvNjia4v8epZMWKZasZdB0XXLnMOh7G866wXPy/I/henryJum?=
 =?us-ascii?Q?WJNChSbz8SW+Hd6r/95LPY3452SI5vlXM36wnU2sgDQ5XS1a6H766+Yr+pca?=
 =?us-ascii?Q?dGCv2dGwvbL8nx6DoR+yVnl0l0phYdQwdwycgTRxA+Kh6KYTCFNz2uxgcs8Y?=
 =?us-ascii?Q?1xCDYqg8sSsAiL8e8PluXzzfRQHtPTfiX4z1wk4Jx8Z32uGmpdl5TwRLbSj6?=
 =?us-ascii?Q?XqwycHXzlBk6Qx6H216r8vuZ5SW0bFoyUNC74s2oVE/vfExumZgMSVreLI+Z?=
 =?us-ascii?Q?As2rQv0aAIWSnPX+AY1BLDTbPL/90oYPLD69VDdzuTDRwhgQfMAxdc2/Tona?=
 =?us-ascii?Q?Cr+dM55MYiQRTmKL4EI3KwojcxCmGCeXbwtCiDKo/aVc6s7Skh6itXG+QYhY?=
 =?us-ascii?Q?CXcvlcfL8Isp03j/L049RS9pyMYpSn6YfkF4K+wEZMs6iP2CKe3hD2Eus0mN?=
 =?us-ascii?Q?vFKnG9+t5jCesq/4NmHcZuomkocvhIxo4FhB1gZqTw2AFAkF+ws4H8vCVeDx?=
 =?us-ascii?Q?Nl3/VJdjnKcH3muEeAYbKLhJwOa4wKCUwD9Yp7WREEeRMhkvY1RWJGJlD5LV?=
 =?us-ascii?Q?3g0ACZct75l7N75yF8J0p6mwQSLNOb0SogXksB/1Mlf2kGC2viPTLLhQvzD7?=
 =?us-ascii?Q?UxROZ+jvdkt+5FZps/CFjLi/eW6ognhRwAmtgRzp2N0e2ih9eiRAcDjhbV6T?=
 =?us-ascii?Q?yyKcbFyIFk7aulj6IrB8W/g5Dzpa7/wP/7RrYmISgDO4cJbpI4X2H0qu4OqQ?=
 =?us-ascii?Q?8qvD2m+BvoYoG7uX4E9CJtOtZ8Z7eGtauKwrENhQqKG83yBqA9MELLzjHYMS?=
 =?us-ascii?Q?OF9ww370bW2ZUR882uwxmRDvoZH59S5LR4uR7FLHhfdtdKi3NaREB3qPEhXV?=
 =?us-ascii?Q?rsSOq6E3bwDdBrWlGvd8Rlx5uy0Gc/AD6HV4THqFSFJdigUL1YaLlcOjHcXu?=
 =?us-ascii?Q?2GmzFe3MAKk9yna8+r/2iS56LvNt/jiFIxqU0MrF2H2yBQL1zpZahAlS9nUq?=
 =?us-ascii?Q?lcLmVe9W7/0KLMHXCC0v6ZC4Kf5Whr/9b1iHRsIKc5ihI9ASlALN3dy/tFDG?=
 =?us-ascii?Q?BYXgJOX0rncA3UpC2z0w3JgnYokQ0mw=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b4c0d73-dbbc-4551-e90a-08debb240867
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8274.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 May 2026 12:40:56.8055
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: og/J39pXI3v2f9b/IB9ONXepoFnNf010a3hRH/4PWJb/0J1lEGEcyFy+dkyohPEcYQQYbjSxksr1QJcEfltFGsTkAaymquSWeY7hXhZdkS8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB7128
X-purgate-ID: tlsNG-4011c0/1779799260-71D688B7-7224FBCB/0/0
X-purgate-type: clean
X-purgate-size: 1157
X-Spamd-Result: default: False [1.32 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:ross.lagerwall@citrix.com,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:jason.andryuk@amd.com,m:teddy.astie@vates.tech,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[ross.lagerwall@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[ross.lagerwall@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	NEURAL_HAM(-0.00)[-0.997];
	RCPT_COUNT_SEVEN(0.00)[7];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 0FCEF5D5B26
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

If L2 accesses a debug register (like reading DR7) without L1 intercepting
it, it locks up the vCPU. L0 intercepts VMEXIT_DR7_READ, which disables
the intercept for L1 and then restarts L2 which re-executes the
instruction and then this repeats indefinitely.

Disable the intercept for the current VMCB if in guest mode to reflect
what would happen if the VMCB were recreated via
nsvm_vmcb_prepare4vmrun().

Fixes: a59a7be91b61 ("nestedsvm: fix DRn handling")
Signed-off-by: Ross Lagerwall <ross.lagerwall@citrix.com>
---
 xen/arch/x86/hvm/svm/svm.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/xen/arch/x86/hvm/svm/svm.c b/xen/arch/x86/hvm/svm/svm.c
index 49fcdd906cf8..209edcba321a 100644
--- a/xen/arch/x86/hvm/svm/svm.c
+++ b/xen/arch/x86/hvm/svm/svm.c
@@ -1657,6 +1657,8 @@ static void svm_dr_access(struct vcpu *v, struct cpu_user_regs *regs)
 
     TRACE(TRC_HVM_DR_WRITE);
     __restore_debug_registers(vmcb, v);
+    if ( nestedhvm_enabled(v->domain) && nestedhvm_vcpu_in_guestmode(v) )
+        vmcb_set_dr_intercepts(v->arch.hvm.svm.vmcb, 0);
 }
 
 static int cf_check svm_msr_read_intercept(
-- 
2.53.0


