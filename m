Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EHZBLgKdBmpLlQIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 15 May 2026 06:11:46 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 52601549219
	for <lists+xen-devel@lfdr.de>; Fri, 15 May 2026 06:11:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1309421.1580468 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wNjtf-0000Ib-FZ; Fri, 15 May 2026 04:11:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1309421.1580468; Fri, 15 May 2026 04:11:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wNjtf-0000FM-Bb; Fri, 15 May 2026 04:11:35 +0000
Received: by outflank-mailman (input) for mailman id 1309421;
 Fri, 15 May 2026 04:11:34 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <den@valinux.co.jp>) id 1wNjtd-0008TI-UM
 for xen-devel@lists.xenproject.org; Fri, 15 May 2026 04:11:34 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wNjtd-007AXG-AM
 for xen-devel@lists.xenproject.org; Fri, 15 May 2026 06:11:33 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <den@valinux.co.jp>)
 id 6a069cda-5cb7-0a2a0a5109dd-0a2a450291b6-14
 for <xen-devel@lists.xenproject.org>; Fri, 15 May 2026 06:11:33 +0200
Received: from [40.107.74.73]
 (helo=OS0P286CU010.outbound.protection.outlook.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <den@valinux.co.jp>)
 id 6a069c3a-af86-0a2a45020019-286b4a49ea93-7
 for <xen-devel@lists.xenproject.org>; Fri, 15 May 2026 06:08:32 +0200
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:38f::10)
 by TYYP286MB3981.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:156::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.18; Fri, 15 May
 2026 04:08:29 +0000
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32]) by TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32%5]) with mapi id 15.20.9846.025; Fri, 15 May 2026
 04:08:29 +0000
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=valinux.co.jp header.i="@valinux.co.jp" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Vzp0DKcA1h0AGCQoph9JD1OGGeJohyGDop9/XptVxLEtF9MtJeztTMNgc78XH64CgSHd6QwjoWlYdzfuTAXt5ygb+Y7Zn5dkDsHQbud9hp6gHRycqpfHnhU92r8abLgSqmfx5G5JJ3cuYfPhjk1zUc1/sxe2J4pJ0U0+Q3Hv0BSLOMZMEQ7OYs5LHrYPTwbemlCi2AF25J5A/vLT/w5zx+ZxBES4wGx7r7eJJ6oXWhR9TaEs4yqiK8GtNebb8c5pVYbeBBijQDRhTZJyH4z8g8h0VAOg4oQX4c7UzC+WGaajOjyiIUG7hcO4w/3FJqO6vPw1teiFEzMd1buk0c9zyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K4GVaM6Ba/cf6m/qACnohRbb9uPse9KRbMYMMHWB/6M=;
 b=OB18H0zIh8mTGRWoi5E35Tj6w32vtVqmsCoyEaq5WWko8EumtMKq2p+SLDO5XDsz99bX21EzMCplZKU2JssBngRkQ5Fv0gxpKFwLtPRzEp2Q2D/YAmnJlA27BMLnokZWXQIYE2wkjq9ghjVMDvY2GNpwlk3kEjxp1xUm2JTnaTInqepB6ZO44CiaYB2/p7Xmn0q2KbcqvfJzKxJXwIL3M3PXpZrBFAXyClOElOvvziMgiOiw2dTSA4Fa3gOigWiyrAwyYE5SFIRTB9sczgAwXObGvnii3w6izCAFW6WtKGM1vX+Zb10CSmxAVKFrl4QqGl3CjCbAlBOXVsYRrf1O/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K4GVaM6Ba/cf6m/qACnohRbb9uPse9KRbMYMMHWB/6M=;
 b=FU8zoInqj974caCRTisQEA3Bygdx6b2i7111pWBHoFnHlU5F5q2l1bdjvoaToXyQvlrdwfYLCgVe7RRVqvvcPjYnwps1E2sO/7QqXq81BGetOyMpU0xgdTwbgLdT3+Rl/OwDq0Axq3WmQxwACjY8AG0WapiO7NbwOsCLYcvwF9g=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=valinux.co.jp;
From: Koichiro Den <den@valinux.co.jp>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>,
	Juergen Gross <jgross@suse.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [RFC PATCH v1 14/26] xen/arm/cca: validate Realm construction inputs
Date: Fri, 15 May 2026 13:08:00 +0900
Message-ID: <20260515040812.983626-15-den@valinux.co.jp>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260515040812.983626-1-den@valinux.co.jp>
References: <20260515040812.983626-1-den@valinux.co.jp>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TY6P286CA0015.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:3b9::12) To TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:38f::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY7P286MB7722:EE_|TYYP286MB3981:EE_
X-MS-Office365-Filtering-Correlation-Id: 5ab2625d-3e26-4aad-b152-08deb2379f25
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|376014|366016|10070799003|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	aihSdoJdb3v91Qyr/Y1S1HMn4l8pCP5kPB4BtPyIqrbpLLLOizR59eKjmsV9A9NGlChig78LtQzc2HrY38zQ4PFSkJuzL3QOaAB7prSMrS+KrtAGM5Y5/YVyuXfNrysr9lA2cBL68KqCd7C4z10XrL11xynhrb3PHcdM1IqkKeIa7h9rc5ScWU4QM4ZSeGIhoLiONvORVDIYRMxo+U1z1rOfy/BGIPsShnJFeWnCoapq/g1Wo2kq3uviPejQvb4ehFNiWkN9iUDi0BkauC4GC+Y7CXKTakkxXQ5W9WAHMrM1KxGj4z44u/Nb/tbNxDVIdGJW0COixymXWvJqUNFQlClkPK7pXn26037GHylItmKFv39o1HFYLpZKpmE+vu1V8pEnFh2LuMGnPzY1pf/Uqu/3EasB5nTqXN6Nk5JHyICxV+kHfwfr6zgRXrnJBT8xwToJ1I22/hHwIz+AoGMzjmX1n/PPdekrWYRNoJBF+8zXk13xLDcFrzFlMFARVUBzSwtd+tH20lCfX9Rfh3OC5X2948t1+YBU/IhBQxXNsAuzg8/NfjfvmJiZAzWbBHr9UvA4Murix9MKKtM4hbZSx9LOwFkLr3LAzuiHpFzr5zyejBfU+ROtf0YyzAVN8LpHi3e1FvBKzDpCMMgD2B9KC19ezAGjJaEroS88j7TNNmrXnQ4Yl3dhEbbFMqhs1Jn1
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(10070799003)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Uh9OEppHmW7KV3wU6PlB2OasRrFxf34qvVqTbP2VYThslsIJP2wlHUdyuiw4?=
 =?us-ascii?Q?bJPdZJ+9QZqlGQfcBcw1IybyOt/7L1A+dfte9KZnvHQHfzZh5nl0+3nhElaG?=
 =?us-ascii?Q?fTzAG/rwDITYE8TlTRNgtyAfKqyAeLchra7dpu+MTD33wyWZ5Njl9iLkC6Og?=
 =?us-ascii?Q?RaxtkGOcZte4Zmx7w8tXtAtCkMaVuB1eyK6CHFgajyvXs4xf8Meaes3H9ICx?=
 =?us-ascii?Q?OozjIjW2ukmRz8g6OvmSbxcXcmfSVBv137VvYUTz/8Gb4miu4Wj254esHThU?=
 =?us-ascii?Q?8w6Uu11GU2I91kMwFd+YxM0h1NGnLrn8z15JzuqbllW/Bu3nGY18n7dsVzS0?=
 =?us-ascii?Q?tyCPB3hku2MzTWU/BfjFfsqUzAAzyQrd6yF65E6dGXArJsmVzd7k2lfAKNW+?=
 =?us-ascii?Q?DeO+vvSaMBfevUNYN+/C1czewvAtJCI/FGXYgQYNiG41LncZp0iLD//lHoe8?=
 =?us-ascii?Q?LFx6l/Uzon0HyxRh+3kIU6sTS5rszGCzpJXt7AD5uuiA6832RRM9T4FMk5L1?=
 =?us-ascii?Q?I8H4EMupfmkSFTGAQ5HAxDO/ismAKcA/oH+SpYhVFt2R0H/ngfgiE3pc0UO1?=
 =?us-ascii?Q?Vb3bPJkWRoGqMbTaR47vD2gz8IOkPwubrJNYyRhS6EVTDB2hCotsALU+cma5?=
 =?us-ascii?Q?4bT3htG6US/jztIQLFaCgu/VeMf7knGXYJPygPAWf+5hpGXMbaECYrwMLt3w?=
 =?us-ascii?Q?loGsCHVvzQbZs41+HrA0k4XFMOVeYXymD16efJ+OBeahvObqkjizA2tjHZwb?=
 =?us-ascii?Q?gd3DGQKfx5BtpwkFAhjlnbHjMIzPC+H+MiWVGMw01rFNJLXf8Yrru8ET7n9K?=
 =?us-ascii?Q?/IphHFYF1yELmNRGXZBiHbmr3gTdQfJL+6T/cXxF9W9XxEkP2J/IV2PAiF44?=
 =?us-ascii?Q?7gl5zWdfXlhO5hxPnLLpWNKZrA50jYCxT5vIP8AlQFooj5bAO4IQ4u1/yvpn?=
 =?us-ascii?Q?d2QpiC+mHlqi5v95dmW+XwXBrgg1vI5fak9oznjcdGKY10fInYMCCmqxVmPk?=
 =?us-ascii?Q?aAr8IJmsNnnDAOmS4tbc3KGJK3CApt9bXXCpg66M/OfqHAI2yFUSGxrMFqWR?=
 =?us-ascii?Q?nHCJe3/87VZ6yIgbU0Yyx/1+RVOv2yPe+AIIjScHAbBxRxzZb1BMyFcyPRqV?=
 =?us-ascii?Q?EXVZUg+bGUpCInaFjSsz37MfLeqtli7bXrvNCO7Lv2lJKoMAaZ0dzij1KcEZ?=
 =?us-ascii?Q?G/e8eIHEoTlv3djETxFZ2+ifQiz40ftewYputlk3VARZa7ZwmD5gpvEar7jo?=
 =?us-ascii?Q?NZxnHR1jtKjFwcOhf8fBMGdV0WMkvAevKZI8Ti4oulDjs5Yb0My/MjZ/1xGB?=
 =?us-ascii?Q?Nukq/7SZz8Fl/STDr4le67JCuuhHSy+avy3SK4g5oaFF0TOV9USVen3tGrEf?=
 =?us-ascii?Q?87kF8deA6y3WvHSj5Ck4ebV0SXaiUKnsHQDsvo2nJxC8EqusgkNwzGCOOMsz?=
 =?us-ascii?Q?RPKA2J06jcF47zP8T6O/qXxyRGymBXbTMjXuFJm+gyZDPIHSMUo0WY+ILSQe?=
 =?us-ascii?Q?BnFbzMmP4DMYhO6b4YJ4l5JpyHaCJ+oQlV0lWIHquTUCs+rKyQr6qoqaPVR1?=
 =?us-ascii?Q?/cHEdd8oY3FX+12WUJXNccr0l1K43sgFhu1ohZWNkUdrKvLieSBA15Ty0uY3?=
 =?us-ascii?Q?VUMArqTU59a62sgodrK5adwfGY/rvce7jilVFFBNEX4O8agpXY5wm1TUDkr7?=
 =?us-ascii?Q?u2nbXM4DsYvkjQ4/Pppr2PI/sMhjUWna4nW3GGp9GixXjaEX9osp87zlKzwi?=
 =?us-ascii?Q?HB8C5JYpU/gUHsIzhz85KkdgJlO01VjoGV9eQjuFltjC3Kh1V4BH?=
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ab2625d-3e26-4aad-b152-08deb2379f25
X-MS-Exchange-CrossTenant-AuthSource: TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 May 2026 04:08:29.6865
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mCFhhMx0nBjgUIFtyN61KX/ZkYDJVqjGJTOJE6Iy881LAEkF6bvI9CokLXxuo4XUQk7ll4S02YcmlWDobZSatQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYP286MB3981
X-purgate-ID: tlsNG-720697/1778818113-A8145161-891DA07A/0/0
X-purgate-type: clean
X-purgate-size: 13840
X-Rspamd-Queue-Id: 52601549219
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.32 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[valinux.co.jp,none];
	R_DKIM_ALLOW(-0.20)[valinux.co.jp:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:dpsmith@apertussolutions.com,m:jgross@suse.com,m:bertrand.marquis@arm.com,m:Volodymyr_Babchuk@epam.com,s:lists@lfdr.de];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[den@valinux.co.jp,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,valinux.co.jp:email,valinux.co.jp:mid,valinux.co.jp:dkim];
	FROM_NEQ_ENVFROM(0.00)[den@valinux.co.jp,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[valinux.co.jp:+];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Action: no action

Check the domain shape, RAM layout and RMM feature set before starting a
Realm build. The domctl range is treated as the protected Realm RAM.

Signed-off-by: Koichiro Den <den@valinux.co.jp>
---
 xen/arch/arm/cca/build.c | 411 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 411 insertions(+)
 create mode 100644 xen/arch/arm/cca/build.c

diff --git a/xen/arch/arm/cca/build.c b/xen/arch/arm/cca/build.c
new file mode 100644
index 000000000000..f333813e10a0
--- /dev/null
+++ b/xen/arch/arm/cca/build.c
@@ -0,0 +1,411 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+
+#include <xen/errno.h>
+#include <xen/lib.h>
+#include <xen/mm.h>
+#include <xen/domain_page.h>
+#include <xen/sched.h>
+#include <xen/sizes.h>
+#include <xen/xmalloc.h>
+
+#include <asm/arm64/sve.h>
+#include <asm/cca.h>
+#include <asm/domain.h>
+#include <asm/event.h>
+#include <asm/p2m.h>
+#include <asm/vpl011.h>
+
+#include "rmi.h"
+#include "sro.h"
+
+/*
+ * Xen CCA currently accepts only 4KB RMI granules.  With 512 entries per RTT,
+ * the table spans here are 512GB, 1GB, and 2MB respectively.
+ */
+#define ARM_CCA_L0_TABLE_SPAN   GB(512)
+#define ARM_CCA_L1_TABLE_SPAN   GB(1)
+#define ARM_CCA_L2_TABLE_SPAN   SZ_2M
+#define ARM_CCA_REALM_MAX_PAGES (GUEST_RAM0_SIZE >> PAGE_SHIFT)
+#define ARM_CCA_BUILD_PREEMPT_TABLES       64U
+#define ARM_CCA_BUILD_FORCE_PREEMPT_TABLES 256U
+#define ARM_CCA_BUILD_PREEMPT_PAGES        1024UL
+#define ARM_CCA_BUILD_FORCE_PREEMPT_PAGES  4096UL
+#define ARM_CCA_REALM_MAX_IPA_BITS_WITHOUT_LPA2 48U
+
+static struct page_info *arm_cca_alloc_host_page(void)
+{
+    struct page_info *pg;
+    void *va;
+
+    pg = alloc_domheap_page(NULL, 0);
+    if ( !pg )
+        return NULL;
+
+    va = map_domain_page(page_to_mfn(pg));
+    clear_page(va);
+    unmap_domain_page(va);
+
+    return pg;
+}
+
+static unsigned int arm_cca_feature_field(unsigned long features,
+                                          unsigned int shift,
+                                          unsigned int width)
+{
+    return arm_cca_rmi_field_get(features, shift, width);
+}
+
+static bool arm_cca_feature_is_true(unsigned long features, unsigned int shift)
+{
+    return arm_cca_feature_field(features, shift, 1U) ==
+           ARM_CCA_RMI_FEATURE_TRUE;
+}
+
+static int arm_cca_build_record_rmi_failure(uint64_t *rmi_result, int rc,
+                                            const struct arm_smccc_res *res)
+{
+    uint64_t result = arm_cca_rmi_result(res);
+
+    if ( rc != 0 && rmi_result &&
+         (arm_cca_rmi_status_is_error(result) ||
+          arm_cca_rmi_result_is_smccc_unknown(result)) )
+        *rmi_result = result;
+
+    return rc;
+}
+
+static bool arm_cca_undelegate_build_page(struct domain *d,
+                                          struct page_info *pg)
+{
+    paddr_t pa = page_to_maddr(pg);
+    int rc = arm_cca_undelegate_granule(pa);
+
+    if ( rc != 0 )
+    {
+        /* No successful undelegation means no RMM wipe guarantee. */
+        printk(XENLOG_ERR
+               "%pd: ARM CCA: failed to undelegate abandoned granule %#"
+               PRIpaddr "\n",
+               d, pa);
+        return false;
+    }
+
+    return true;
+}
+
+/*
+ * Return true when the caller can forget pg.  A false return means
+ * undelegation failed, so the caller must keep the page tracked.
+ */
+static bool arm_cca_free_build_page(struct domain *d, struct page_info *pg,
+                                    bool delegated)
+{
+    if ( !pg )
+        return true;
+
+    if ( delegated && !arm_cca_undelegate_build_page(d, pg) )
+        return false;
+
+    free_domheap_page(pg);
+
+    return true;
+}
+
+static void arm_cca_free_or_abandon_build_page(struct domain *d,
+                                               struct page_info *pg,
+                                               bool delegated)
+{
+    if ( !arm_cca_free_build_page(d, pg, delegated) )
+        page_list_add_tail(pg, &d->arch.cca.abandoned_pages);
+}
+
+static bool arm_cca_gfn_range_contains(gfn_t base, gfn_t end,
+                                       gfn_t start, gfn_t next)
+{
+    return gfn_x(base) <= gfn_x(start) && gfn_x(next) <= gfn_x(end);
+}
+
+static bool arm_cca_gfn_range_overlaps(gfn_t base, gfn_t end,
+                                       gfn_t start, gfn_t next)
+{
+    return gfn_x(start) < gfn_x(end) && gfn_x(base) < gfn_x(next);
+}
+
+/*
+ * Initial Realm support has no separate private/shared memory metadata.
+ * Treat the domctl range as the whole protected Realm RAM contract: every
+ * mapped entry in the range must be writable RAM, and no other valid guest
+ * mapping may remain outside it apart from Arm magic pages, which are not
+ * exposed through the Realm device tree.
+ *
+ * p2m_get_entry() can return block mappings, so reject entries which only
+ * partly overlap the Realm RAM range. Otherwise one p2m block could make
+ * memory outside the measured/protected range guest-visible.
+ */
+static int arm_cca_validate_ram_layout(struct domain *d, gfn_t base_gfn,
+                                       unsigned long nr_pages)
+{
+    struct p2m_domain *p2m = p2m_get_hostp2m(d);
+    gfn_t end_gfn = gfn_add(base_gfn, nr_pages);
+    gfn_t magic_base = _gfn(GUEST_MAGIC_BASE >> PAGE_SHIFT);
+    gfn_t magic_end = _gfn((GUEST_MAGIC_BASE + GUEST_MAGIC_SIZE) >>
+                           PAGE_SHIFT);
+    gfn_t gfn, end;
+    int rc = 0;
+
+    p2m_read_lock(p2m);
+
+    gfn = p2m->lowest_mapped_gfn;
+    end = gfn_add(p2m->max_mapped_gfn, 1);
+
+    while ( gfn_x(gfn) < gfn_x(end) )
+    {
+        unsigned int order;
+        p2m_type_t t;
+        bool valid;
+        mfn_t mfn = p2m_get_entry(p2m, gfn, &t, NULL, &order, &valid);
+        gfn_t next = gfn_next_boundary(gfn, order);
+
+        if ( arm_cca_gfn_range_overlaps(base_gfn, end_gfn, gfn, next) )
+        {
+            if ( !valid || mfn_eq(mfn, INVALID_MFN) ||
+                 t != p2m_ram_rw ||
+                 !arm_cca_gfn_range_contains(base_gfn, end_gfn, gfn, next) )
+            {
+                rc = -EINVAL;
+                break;
+            }
+        }
+        else if ( valid && !mfn_eq(mfn, INVALID_MFN) &&
+                  !arm_cca_gfn_range_contains(magic_base, magic_end, gfn,
+                                              next) )
+        {
+            rc = -EINVAL;
+            break;
+        }
+
+        gfn = next;
+    }
+
+    p2m_read_unlock(p2m);
+
+    return rc;
+}
+
+static int arm_cca_validate_domain(struct domain *d, gfn_t base_gfn,
+                                   unsigned long nr_pages)
+{
+    unsigned int i;
+    int rc;
+
+    if ( is_hardware_domain(d) )
+        return -EOPNOTSUPP;
+
+    if ( !is_hvm_domain(d) )
+        return -EOPNOTSUPP;
+
+    if ( is_32bit_domain(d) )
+        return -EOPNOTSUPP;
+
+    if ( d->max_vcpus == 0 || d->vcpu[0] == NULL )
+        return -EOPNOTSUPP;
+
+    for ( i = 1; i < d->max_vcpus; ++i )
+        if ( d->vcpu[i] == NULL )
+            return -EOPNOTSUPP;
+
+    if ( d->arch.vgic.version != GIC_V3 )
+        return -EOPNOTSUPP;
+
+    if ( d->creation_finished )
+        return -EPERM;
+
+    if ( is_domain_realm(d) )
+        return -EEXIST;
+
+    if ( domain_has_vpl011(d) &&
+         !IS_ENABLED(CONFIG_ARM_CCA_REALM_DEBUG_VUART) )
+    {
+        printk(XENLOG_G_ERR
+               "ARM CCA: Realm VUART debug console is disabled for %pd\n",
+               d);
+        return -EOPNOTSUPP;
+    }
+
+    if ( gfn_x(base_gfn) != (GUEST_RAM_BASE >> PAGE_SHIFT) )
+        return -EOPNOTSUPP;
+
+    if ( nr_pages == 0 || nr_pages > ARM_CCA_REALM_MAX_PAGES )
+        return -EINVAL;
+
+    /*
+     * domain_tot_pages() also includes Arm magic pages outside guest RAM, so
+     * it is only a sanity upper bound for the protected RAM range.
+     */
+    if ( nr_pages > domain_tot_pages(d) )
+        return -EINVAL;
+
+    rc = arm_cca_validate_ram_layout(d, base_gfn, nr_pages);
+    if ( rc != 0 )
+        return rc;
+
+    return 0;
+}
+
+static int arm_cca_validate_realm_features0(struct domain *d)
+{
+    unsigned long features0 = d->arch.cca.rmi_features0;
+    unsigned int max_ipa_bits;
+    unsigned int num_bps, num_wps;
+
+    max_ipa_bits = arm_cca_feature_field(
+        features0, ARM_CCA_RMI_FEATURE_REGISTER_0_S2SZ_SHIFT,
+        ARM_CCA_RMI_FEATURE_REGISTER_0_S2SZ_WIDTH);
+    if ( p2m_ipa_bits > max_ipa_bits )
+    {
+        printk(XENLOG_G_ERR
+               "ARM CCA: %pd requires %u-bit IPA, RMM supports %u-bit IPA\n",
+               d, p2m_ipa_bits, max_ipa_bits);
+        return -EOPNOTSUPP;
+    }
+
+    /*
+     * Xen CCA currently leaves RmiRealmParams::flags0.lpa2, sve, and pmu
+     * clear.  Reject configurations that would need those Realm features
+     * instead of silently creating a Realm with different behavior.
+     */
+    if ( p2m_ipa_bits > ARM_CCA_REALM_MAX_IPA_BITS_WITHOUT_LPA2 )
+    {
+        if ( !arm_cca_feature_is_true(
+                 features0, ARM_CCA_RMI_FEATURE_REGISTER_0_LPA2_SHIFT) )
+            printk(XENLOG_G_ERR
+                   "ARM CCA: %pd requires LPA2 for %u-bit IPA, "
+                   "but RMM does not report LPA2 support\n",
+                   d, p2m_ipa_bits);
+        else
+            printk(XENLOG_G_ERR
+                   "ARM CCA: %pd requires LPA2 for %u-bit IPA, "
+                   "but Xen CCA does not enable Realm LPA2 yet\n",
+                   d, p2m_ipa_bits);
+        return -EOPNOTSUPP;
+    }
+
+    if ( is_sve_domain(d) )
+    {
+        if ( !arm_cca_feature_is_true(
+                 features0, ARM_CCA_RMI_FEATURE_REGISTER_0_SVE_SHIFT) )
+            printk(XENLOG_G_ERR
+                   "ARM CCA: %pd requests SVE, "
+                   "but RMM does not report SVE support\n",
+                   d);
+        else
+        {
+            unsigned int max_sve_vl = arm_cca_feature_field(
+                features0, ARM_CCA_RMI_FEATURE_REGISTER_0_SVE_VL_SHIFT,
+                ARM_CCA_RMI_FEATURE_REGISTER_0_SVE_VL_WIDTH);
+
+            printk(XENLOG_G_ERR
+                   "ARM CCA: %pd requests SVE; RMM supports %u-bit VL, "
+                   "but Xen CCA does not enable Realm SVE yet\n",
+                   d, (max_sve_vl + 1U) * SVE_VL_MULTIPLE_VAL);
+        }
+        return -EOPNOTSUPP;
+    }
+
+    num_bps = arm_cca_feature_field(
+        features0, ARM_CCA_RMI_FEATURE_REGISTER_0_NUM_BPS_SHIFT,
+        ARM_CCA_RMI_FEATURE_REGISTER_0_NUM_BPS_WIDTH);
+    if ( num_bps == 0 )
+    {
+        printk(XENLOG_G_ERR
+               "ARM CCA: %pd RMM reports reserved NUM_BPS value 0\n", d);
+        return -EOPNOTSUPP;
+    }
+
+    num_wps = arm_cca_feature_field(
+        features0, ARM_CCA_RMI_FEATURE_REGISTER_0_NUM_WPS_SHIFT,
+        ARM_CCA_RMI_FEATURE_REGISTER_0_NUM_WPS_WIDTH);
+    if ( num_wps == 0 )
+    {
+        printk(XENLOG_G_ERR
+               "ARM CCA: %pd RMM reports reserved NUM_WPS value 0\n", d);
+        return -EOPNOTSUPP;
+    }
+
+    if ( d->options & XEN_DOMCTL_CDF_vpmu )
+    {
+        if ( !arm_cca_feature_is_true(
+                 features0, ARM_CCA_RMI_FEATURE_REGISTER_0_PMU_SHIFT) )
+            printk(XENLOG_G_ERR
+                   "ARM CCA: %pd requests PMU, "
+                   "but RMM does not report PMU support\n",
+                   d);
+        else
+        {
+            unsigned int num_ctrs = arm_cca_feature_field(
+                features0,
+                ARM_CCA_RMI_FEATURE_REGISTER_0_PMU_NUM_CTRS_SHIFT,
+                ARM_CCA_RMI_FEATURE_REGISTER_0_PMU_NUM_CTRS_WIDTH);
+
+            printk(XENLOG_G_ERR
+                   "ARM CCA: %pd requests PMU; RMM supports %u counters, "
+                   "but Xen CCA does not enable Realm PMU yet\n",
+                   d, num_ctrs);
+        }
+        return -EOPNOTSUPP;
+    }
+
+    return 0;
+}
+
+static int arm_cca_validate_realm_features1(struct domain *d)
+{
+    unsigned long features1 = d->arch.cca.rmi_features1;
+    unsigned int max_recs_order, max_recs;
+
+    if ( !arm_cca_feature_is_true(
+             features1,
+             ARM_CCA_RMI_FEATURE_REGISTER_1_RMI_GRAN_SZ_4KB_SHIFT) )
+    {
+        printk(XENLOG_G_ERR
+               "ARM CCA: %pd requires 4KB RMI granules, "
+               "but RMM does not report 4KB RMI granule support\n",
+               d);
+        return -EOPNOTSUPP;
+    }
+
+    if ( !arm_cca_feature_is_true(
+             features1, ARM_CCA_RMI_FEATURE_REGISTER_1_HASH_SHA_256_SHIFT) )
+    {
+        printk(XENLOG_G_ERR
+               "ARM CCA: %pd requires SHA-256 Realm measurements, "
+               "but RMM does not report SHA-256 support\n",
+               d);
+        return -EOPNOTSUPP;
+    }
+
+    max_recs_order = arm_cca_feature_field(
+        features1, ARM_CCA_RMI_FEATURE_REGISTER_1_MAX_RECS_ORDER_SHIFT,
+        ARM_CCA_RMI_FEATURE_REGISTER_1_MAX_RECS_ORDER_WIDTH);
+    max_recs = (1U << max_recs_order) - 1U;
+    if ( d->max_vcpus > max_recs )
+    {
+        printk(XENLOG_G_ERR
+               "ARM CCA: %pd requires %u RECs, RMM supports %u RECs\n",
+               d, d->max_vcpus, max_recs);
+        return -EOPNOTSUPP;
+    }
+
+    return 0;
+}
+
+static int arm_cca_validate_realm_features(struct domain *d)
+{
+    int rc;
+
+    rc = arm_cca_validate_realm_features0(d);
+    if ( rc != 0 )
+        return rc;
+
+    return arm_cca_validate_realm_features1(d);
+}
-- 
2.51.0


