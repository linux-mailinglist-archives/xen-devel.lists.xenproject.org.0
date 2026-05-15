Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CG5+BmOcBmpNlQIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 15 May 2026 06:09:07 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 873C25491B3
	for <lists+xen-devel@lfdr.de>; Fri, 15 May 2026 06:09:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1309345.1580416 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wNjqk-0002qG-OH; Fri, 15 May 2026 04:08:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1309345.1580416; Fri, 15 May 2026 04:08:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wNjqk-0002jC-EI; Fri, 15 May 2026 04:08:34 +0000
Received: by outflank-mailman (input) for mailman id 1309345;
 Fri, 15 May 2026 04:08:31 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <den@valinux.co.jp>) id 1wNjqh-00021J-Df
 for xen-devel@lists.xenproject.org; Fri, 15 May 2026 04:08:31 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wNjqg-00GbfP-Q7
 for xen-devel@lists.xenproject.org; Fri, 15 May 2026 06:08:30 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <den@valinux.co.jp>)
 id 6a069c3e-2eae-0a2a0a5409dd-0a2a4502c694-0
 for <xen-devel@lists.xenproject.org>; Fri, 15 May 2026 06:08:30 +0200
Received: from [40.107.74.73]
 (helo=OS0P286CU010.outbound.protection.outlook.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <den@valinux.co.jp>)
 id 6a069c3a-af86-0a2a45020019-286b4a49ea93-5
 for <xen-devel@lists.xenproject.org>; Fri, 15 May 2026 06:08:30 +0200
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:38f::10)
 by TYYP286MB3981.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:156::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.18; Fri, 15 May
 2026 04:08:24 +0000
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32]) by TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32%5]) with mapi id 15.20.9846.025; Fri, 15 May 2026
 04:08:24 +0000
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
 b=QDCrjOBeD+nbUqtSUUKMu9l68x2JF7jrM5YO8hH5Am7A/xW/zbyy3TVpPiq6Za/S57zBbhRxkNm3kVwwbPgzLcrnTbapOzV7bHPaEbvD/j7j6ow12ueyC3RJcpf1aCBJLqaIsTEFuZLgozh78XzYxZrh3VsmVNm8jclhFoc5ik8p/hDxWRiHIsfr7m4sdEPKuralTwAHUSTulwJ34osQ2MbdL8R7/IYY0obnSo/YWsu/G140cIsjkfAg5UFZqVMAkAJpQ8lD8HTOheokXhdpdPUVK1KZd/CYXcJopY6Qd63F5tr3LU4fjDcm1oCxC/Y0AashRrC6XoC2EIpRZoUl0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UyVaj4/RdCO+bvx/q4AkK7MGTGIPg9kj2o0tPGAL1DI=;
 b=hyf6QhfhCW+gdEw+ZDn7DCP9gbwlZ9igPTbtGgiEAhErLHGq9Dwdv3l95FPMZOlHcDxap66Rnp2dYFkHQRvnGa44eSlgYB6NCC4IoVnJceZ3CV/j/A2Glx0Njl58IjtKwXUUwH5w63NRrhnEBf96w9IoKd4gfg9Vcb5cDMB/qpcW6N4/hmBI6PgI2jyHdp5ZogzCHLbkZVwVKHXRl91g/ok3zcthx7WRr7Snz87M3aPBoxyNzWEWhY/kZYFmMWEPzBaUFtqZbzGKV/0B//nMGnn9AzmN3BsZPSsgzgFhICxFC8CZOaH9eTBsEwx3U2DiyelTAnmhY0cq1TEscDobAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UyVaj4/RdCO+bvx/q4AkK7MGTGIPg9kj2o0tPGAL1DI=;
 b=TeGlu6xgJXlAGw37q/gh6/Yb47b+pCglDnwJj5oHcgD0mRIbbQdECtObqMrsGo6VZWzbCMfd3rt3tkPLIW1RffTU9vxyNHybgJiAcM5DzT1Je1mC4EHmoQnKKpJ2bwLpoltzPoGU2g075LA1nx5XknO5jf2Uq39stb65t6rY8CQ=
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
Subject: [RFC PATCH v1 07/26] xen/arm/cca: initialize the RMM and Realm parameters
Date: Fri, 15 May 2026 13:07:53 +0900
Message-ID: <20260515040812.983626-8-den@valinux.co.jp>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260515040812.983626-1-den@valinux.co.jp>
References: <20260515040812.983626-1-den@valinux.co.jp>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCP286CA0093.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b4::6) To TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:38f::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY7P286MB7722:EE_|TYYP286MB3981:EE_
X-MS-Office365-Filtering-Correlation-Id: 2e4ce52f-3bfb-4bd1-7471-08deb2379bc5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|376014|366016|10070799003|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	UfcFrQvCIVtqCR+pvBa12k3wKUgmP05cV1WxFmxp6NiG2+Ap6xJMIUsD0Z4NzRl2N+nWIkfGF7J/dtUVrZbEjUlq/LE1bJagplHaWyZUOBTYh6KVJ7U8/Y6OZfCxAmAvShgUDlXZswOoBaaVsAa6yZ6lLIY7RDcEG5L3xPp1CcvXu5iPyAn9KyTP6IzJNzqX4rQGKBP01ytnWPVXXlmUcsIdoatmu0UbdTKbZRX/ZazgvvM8bPHcm0b2DV83OjhZhkPiTA2r8ynRlokPlFQWClRBi7pmtDznUrz8KUGVzFU+iIja6TtJszQle/L6tj+l2fzpaXB+qX8oQJLmNNeT6QcQOHkcViVhb6cUkTQg/PChmJAauXulOy59eGRpLMLhH1JS5uTjyxU3bys3zTbLdFt3m37jY1AdsDSkJ4Jg9/YbuTKJ9L0iztUXkzlpvFHgqM3z2Gym7/7heBtGaktple+WyT0OJryVKOqFXvnHOJx1n20grgzcmxK9CVcFOiGIuzsaseU7tIFYMgKgJ2AlbxkvqGwWuDQSHB3X8BGsuX2a8w3nVwmeTwj3P+9xz+60+vTqQ9ISI5WYXGwsVEQCWIa4YUDOjxl0vu79qd+UAJOSazPn4pAmvlMTW1UjJt/Cz++0s9nfasPk5pb4fOBSlPC8ZqYve2OjW4D5pYsVujcXQEahEJ2IUDgipxCQs67q
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(10070799003)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?cQt7RaPd4M3lQ4Mx56z5LK79TAAcO6fUrfducgJbOciF0idOdUa13NH3VDE5?=
 =?us-ascii?Q?ue48/AjZFvRQGzmIFUwBAieabZwra5qUU1l20IDIil4fr6gccS25qx+wmZRm?=
 =?us-ascii?Q?wU4g3rfcTM3CyFN4VHhC9hAQKC2y4ru4yb60njKF2M/QO8iBfyStjUsR1dIZ?=
 =?us-ascii?Q?3VBoHKRdHZiPH0k5JivudsIov1Y+qwkz9qj2wyZRjWNgJOJgi72tXC+dRIxc?=
 =?us-ascii?Q?VY1T4vnu8cA6dhT8/FbvUNTpycpftaky3KULf48DwwuwisiBeuuwjbInrG84?=
 =?us-ascii?Q?WfIAhJhSJn8VQPUwfw/wLjVBYRQdg5AwhxgU0PduEhz9yJOJ9ccYud5aNRc0?=
 =?us-ascii?Q?One6qeSkkwxAjy7dcFYiC2UUouCazM1WyDHpeEMhVo8X/gbb3ne6Wm2pqPGU?=
 =?us-ascii?Q?XVcJUrKlgIBceMUu71XiAmBQRSTbOOQf+PcsGxQaBU5b9yu9Vtks7urPyJMZ?=
 =?us-ascii?Q?qOVQZJhhbaxLMSxRrSOnBLQ3LSC0Np/23iF6VllAx7Fw+wXq6HlyA75y6UCS?=
 =?us-ascii?Q?uTQP13dpnC720fSSebshKQmmXSCK3kFL578QboSk8AKJr3UIPxIHJZmyilq6?=
 =?us-ascii?Q?SZ1XAMR26O+iN5dIXNhpo4vMs3TVOAdPO6E1DlNqBsesuIBYfAXeG4Lu2yQT?=
 =?us-ascii?Q?oeTVlZxU/gl88CpWZK35V7DKHm17m5Ug42XyzIQnkloLqRJBfazdpv6c0DkG?=
 =?us-ascii?Q?7AQVB+L/Wk2gPACXNSuWej4h5EWa56zs96MJMmoacJRq5Tiu5FyUQXP9NGzq?=
 =?us-ascii?Q?Dh2Ru6Sd/8CVmRodhA7PCRyo17jrCi389rWs4BPIYWtNC3FbVzcCywgFkfDi?=
 =?us-ascii?Q?znSuxJLWUvfapvNdrhjlKW126Z73pYLUz1XjMNqxVUv+Ui58VD4wTYGmYrX8?=
 =?us-ascii?Q?T911P+wiJ1tX2M0Efa7j9TwgWZxb5goUJOPDmwMojk22R8ZqOaGXgLWbSK4n?=
 =?us-ascii?Q?Ld3UD+OT4eNnIh48xHoJkGj5S42O1LuUrDLeT5VMOt94eJiMiU7zpRuiNW8X?=
 =?us-ascii?Q?YnreRnezFUkEyPuhcHs7wfLtXQ74B9IwCq/LJYt4oF/Vmm4bK3kU+H59iwxY?=
 =?us-ascii?Q?D+VBswi1jg3p+x2anLwFU/BxzrPpqaeDKD4x7ATlyOAxuRyiakn7+zF/vpfL?=
 =?us-ascii?Q?yhDa9Tit/zVwdwB+DuwJg/0Fenv/hfFookBaK8hOX/c0UJQKLAVap8BQOTsB?=
 =?us-ascii?Q?uI9twXwqNsRGvmv2XHBaIeWkVl04TpeePkFG0l5kvMG/38URAnQWCEuV1lII?=
 =?us-ascii?Q?bm1maTCfzM/lKlvqSFZ2hB22/sNY+sHao7AfufTD01r+sKogsZkPbqsnpWtK?=
 =?us-ascii?Q?MpcLMCjGTQuu4j/k2ebu7RHDxX+eNeaEwpycrZjLSpFcSiLZnF1tU/kHSFax?=
 =?us-ascii?Q?pCwoY0HmyvIRLgFQMRZtlrHcSLR7A+BaJIXU1xwabM+QCX6rvv7KLp6/KD1D?=
 =?us-ascii?Q?AlSifyQPJATm/bJniqH0mKHNDEshmxO0DqD59saA5t04TkzgnHMAanmBQh7E?=
 =?us-ascii?Q?8qLql0GSG+q74aliB8ZC1fK9ofGXCMp3vUc50dM4/VtFZeX/XN7EbfnbYHsC?=
 =?us-ascii?Q?bz6KZz4LX8YhFj0ulXxr7M3b2G7HG6vsoQDbd3lmMCb62vkrKVQLmWIKk1+H?=
 =?us-ascii?Q?R61E4QpS5j5Tk+n3knxzD/r7bL1xEFxMPkHebbBteKZ2D3Vk9Jav4mwsXya5?=
 =?us-ascii?Q?/MKkl6vS8pK8a/hUOmQTOovg9+2wZjzSz6+68MPRyc+ZcDpKZi9bR4Dqt7pX?=
 =?us-ascii?Q?PCgvYwAyhJ6/zeQsYtWI3vQGPHUbmLzjY067QFuHZUTKVRJq6d13?=
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e4ce52f-3bfb-4bd1-7471-08deb2379bc5
X-MS-Exchange-CrossTenant-AuthSource: TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 May 2026 04:08:24.0101
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jTbCTrrZSlewrpSkN5c4sBxL2P8iQURDNvZOmhDRN819k5yesed0OAc2tKWmv0gFf+YExIvWkMAkXe1GLh6GfA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYP286MB3981
X-purgate-ID: tlsNG-720697/1778818110-82B68161-7E941101/0/0
X-purgate-type: clean
X-purgate-size: 7408
X-Rspamd-Queue-Id: 873C25491B3
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.31 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[valinux.co.jp,none];
	R_DKIM_ALLOW(-0.20)[valinux.co.jp:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_SENDER(0.00)[den@valinux.co.jp,xen-devel-bounces@lists.xenproject.org];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:dpsmith@apertussolutions.com,m:jgross@suse.com,m:bertrand.marquis@arm.com,m:Volodymyr_Babchuk@epam.com,s:lists@lfdr.de];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[valinux.co.jp:email,valinux.co.jp:mid,valinux.co.jp:dkim];
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

Activate the RMM during Xen init and keep the small Realm/REC parameter
initializers with the rest of the CCA code.

Signed-off-by: Koichiro Den <den@valinux.co.jp>
---
 xen/arch/arm/cca/Makefile      |   1 +
 xen/arch/arm/cca/realm.c       | 191 +++++++++++++++++++++++++++++++++
 xen/arch/arm/include/asm/cca.h |  10 ++
 3 files changed, 202 insertions(+)
 create mode 100644 xen/arch/arm/cca/realm.c

diff --git a/xen/arch/arm/cca/Makefile b/xen/arch/arm/cca/Makefile
index 7f20d43323c3..57c3986d5de8 100644
--- a/xen/arch/arm/cca/Makefile
+++ b/xen/arch/arm/cca/Makefile
@@ -1,3 +1,4 @@
 obj-y += granule.o
+obj-y += realm.o
 obj-y += rmi.o
 obj-y += state.o
diff --git a/xen/arch/arm/cca/realm.c b/xen/arch/arm/cca/realm.c
new file mode 100644
index 000000000000..14aa7bba595f
--- /dev/null
+++ b/xen/arch/arm/cca/realm.c
@@ -0,0 +1,191 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+
+#include <xen/errno.h>
+#include <xen/init.h>
+#include <xen/lib.h>
+#include <xen/mm.h>
+#include <xen/sched.h>
+
+#include <asm/cca.h>
+
+#include "rmi.h"
+#include "sro.h"
+
+/*
+ * Pages donated while activating the RMM are owned by the activated RMM until
+ * system reset.  Keep the host references here to make that lifetime explicit.
+ */
+static struct page_info *arm_cca_rmm_sro_pages[ARM_CCA_MAX_SRO_DONATION_PAGES];
+static unsigned int arm_cca_nr_rmm_sro_pages;
+static struct page_list_head arm_cca_rmm_abandoned_pages =
+    PAGE_LIST_HEAD_INIT(arm_cca_rmm_abandoned_pages);
+static bool arm_cca_rmm_available;
+static unsigned long arm_cca_rmm_features0;
+static unsigned long arm_cca_rmm_features1;
+
+static int arm_cca_set_rmm_config(struct arm_cca_rmi_rmm_config *cfg)
+{
+    memset(cfg, 0, ARM_CCA_RMI_RMM_CONFIG_SIZE);
+    cfg->rmi_granule_size = ARM_CCA_RMI_GRANULE_SIZE_4KB;
+    cfg->tracking_region_size = ARM_CCA_RMI_TRACKING_4KB_REGION_1GB;
+
+    return arm_cca_rmi_rmm_config_set(virt_to_maddr(cfg));
+}
+
+static int arm_cca_activate_rmm(void)
+{
+    struct arm_cca_rmi_rmm_config *cfg;
+    struct arm_cca_sro_mem_xfer xfer = {
+        .pages = arm_cca_rmm_sro_pages,
+        .nr_pages = &arm_cca_nr_rmm_sro_pages,
+        .max_pages = ARRAY_SIZE(arm_cca_rmm_sro_pages),
+        .abandoned_pages = &arm_cca_rmm_abandoned_pages,
+    };
+    struct arm_smccc_res res;
+    int rc = 0;
+
+    cfg = alloc_xenheap_page();
+    if ( cfg == NULL )
+        return -ENOMEM;
+
+    rc = arm_cca_set_rmm_config(cfg);
+    if ( rc == 0 )
+    {
+        rc = arm_cca_rmi_rmm_activate(&res);
+        rc = arm_cca_sro_complete_mem_transfer(rc, &res, &xfer);
+    }
+
+    if ( rc != 0 && (arm_cca_nr_rmm_sro_pages != 0 ||
+                     !page_list_empty(&arm_cca_rmm_abandoned_pages)) )
+        rc = -EIO;
+
+    free_xenheap_page(cfg);
+
+    return rc;
+}
+
+static int arm_cca_validate_rmm_config(void)
+{
+    struct arm_cca_rmi_rmm_config *cfg;
+    struct arm_smccc_res res;
+    int rc;
+
+    cfg = alloc_xenheap_page();
+    if ( cfg == NULL )
+        return -ENOMEM;
+
+    memset(cfg, 0, ARM_CCA_RMI_RMM_CONFIG_SIZE);
+
+    rc = arm_cca_rmi_rmm_config_get(virt_to_maddr(cfg), &res);
+    if ( rc != 0 )
+    {
+        printk(XENLOG_ERR
+               "ARM CCA: RMI_RMM_CONFIG_GET failed status=%#x data=%#lx\n",
+               arm_cca_rmi_status_code(arm_cca_rmi_result(&res)),
+               (unsigned long)arm_cca_rmi_result_data(
+                   arm_cca_rmi_result(&res)));
+        rc = -EOPNOTSUPP;
+        goto out;
+    }
+
+    /*
+     * Xen's current Realm build and teardown paths assume 4KB RMI granules
+     * and the matching 1GB tracking region.  Other active RMM configurations
+     * are valid RMI, but need explicit Xen support before they can be
+     * accepted here.
+     */
+    if ( cfg->rmi_granule_size != ARM_CCA_RMI_GRANULE_SIZE_4KB )
+    {
+        printk(XENLOG_ERR
+               "ARM CCA: requires 4KB RMI granules, but current RMM "
+               "granule size encoding is %u\n", cfg->rmi_granule_size);
+        rc = -EOPNOTSUPP;
+        goto out;
+    }
+
+    if ( cfg->tracking_region_size != ARM_CCA_RMI_TRACKING_4KB_REGION_1GB )
+    {
+        printk(XENLOG_ERR
+               "ARM CCA: requires 1GB tracking regions for 4KB RMI "
+               "granules, but current RMM tracking-region encoding is %u\n",
+               cfg->tracking_region_size);
+        rc = -EOPNOTSUPP;
+        goto out;
+    }
+
+    rc = 0;
+
+out:
+    free_xenheap_page(cfg);
+
+    return rc;
+}
+
+static int __init arm_cca_init_rmi(void)
+{
+    unsigned long revision_lower;
+    int rc;
+
+    rc = arm_cca_rmi_version(ARM_CCA_RMI_ABI_VERSION, &revision_lower, NULL);
+    if ( rc != 0 || revision_lower != ARM_CCA_RMI_ABI_VERSION )
+        return 0;
+
+    arm_cca_rmm_features0 = arm_cca_rmi_features(0);
+    arm_cca_rmm_features1 = arm_cca_rmi_features(1);
+
+    rc = arm_cca_activate_rmm();
+    if ( rc != 0 )
+    {
+        printk(XENLOG_ERR "ARM CCA: RMM activate failed: %d\n", rc);
+        return 0;
+    }
+
+    rc = arm_cca_validate_rmm_config();
+    if ( rc != 0 )
+        return 0;
+
+    rc = arm_cca_prepare_host_memory(arm_cca_rmm_features1);
+    if ( rc != 0 )
+    {
+        printk(XENLOG_ERR "ARM CCA: host memory metadata check failed: %d\n",
+               rc);
+        return 0;
+    }
+
+    arm_cca_rmm_available = true;
+    printk(XENLOG_INFO "ARM CCA: RMI configured\n");
+
+    return 0;
+}
+__initcall(arm_cca_init_rmi);
+
+int arm_cca_probe(struct domain *d)
+{
+    if ( !arm_cca_rmm_available )
+        return -EOPNOTSUPP;
+
+    d->arch.cca.rmi_features0 = arm_cca_rmm_features0;
+    d->arch.cca.rmi_features1 = arm_cca_rmm_features1;
+
+    return 0;
+}
+
+void arm_cca_realm_params_init(struct arm_cca_rmi_realm_params *params)
+{
+    memset(params, 0, sizeof(*params));
+}
+
+void arm_cca_rec_params_init(struct arm_cca_rmi_rec_params *params,
+                             register_t mpidr, register_t pc, bool runnable)
+{
+    memset(params, 0, sizeof(*params));
+
+    params->flags = runnable ? ARM_CCA_RMI_REC_CREATE_RUNNABLE : 0;
+    params->mpidr = mpidr;
+    params->pc = pc;
+}
+
+void arm_cca_rec_run_init(struct arm_cca_rmi_rec_run *run)
+{
+    memset(run, 0, sizeof(*run));
+}
diff --git a/xen/arch/arm/include/asm/cca.h b/xen/arch/arm/include/asm/cca.h
index c35d51f750a3..80c161078d6c 100644
--- a/xen/arch/arm/include/asm/cca.h
+++ b/xen/arch/arm/include/asm/cca.h
@@ -24,6 +24,9 @@
 
 struct domain;
 struct vcpu;
+struct arm_cca_rmi_realm_params;
+struct arm_cca_rmi_rec_params;
+struct arm_cca_rmi_rec_run;
 struct page_info;
 
 struct arm_cca_rtt_record {
@@ -84,4 +87,11 @@ int arm_cca_delegate_granule(paddr_t granule);
 int arm_cca_undelegate_granule(paddr_t granule);
 int arm_cca_prepare_host_memory(unsigned long features1) __init;
 
+int arm_cca_probe(struct domain *d);
+
+void arm_cca_realm_params_init(struct arm_cca_rmi_realm_params *params);
+void arm_cca_rec_params_init(struct arm_cca_rmi_rec_params *params,
+                             register_t mpidr, register_t pc, bool runnable);
+void arm_cca_rec_run_init(struct arm_cca_rmi_rec_run *run);
+
 #endif /* ARM_CCA_H */
-- 
2.51.0


