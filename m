Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YDR9DGecBmpOlQIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 15 May 2026 06:09:11 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B329B5491EA
	for <lists+xen-devel@lfdr.de>; Fri, 15 May 2026 06:09:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1309340.1580383 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wNjqi-00029U-3j; Fri, 15 May 2026 04:08:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1309340.1580383; Fri, 15 May 2026 04:08:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wNjqi-00023W-08; Fri, 15 May 2026 04:08:32 +0000
Received: by outflank-mailman (input) for mailman id 1309340;
 Fri, 15 May 2026 04:08:30 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <den@valinux.co.jp>) id 1wNjqf-0001nN-Th
 for xen-devel@lists.xenproject.org; Fri, 15 May 2026 04:08:30 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wNjqf-00GbfP-9l
 for xen-devel@lists.xenproject.org; Fri, 15 May 2026 06:08:29 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <den@valinux.co.jp>)
 id 6a069c0b-2eae-0a2a0a5409dd-0a2a4504bda6-42
 for <xen-devel@lists.xenproject.org>; Fri, 15 May 2026 06:08:29 +0200
Received: from [52.101.125.129]
 (helo=TYVP286CU001.outbound.protection.outlook.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <den@valinux.co.jp>)
 id 6a069c35-1dec-0a2a45040019-34657d8136d2-6
 for <xen-devel@lists.xenproject.org>; Fri, 15 May 2026 06:08:29 +0200
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:38f::10)
 by TYYP286MB3981.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:156::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.18; Fri, 15 May
 2026 04:08:21 +0000
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32]) by TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32%5]) with mapi id 15.20.9846.025; Fri, 15 May 2026
 04:08:21 +0000
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
 b=mTaEbr6yRRq0aXvYCtBaJkIVY2thhsVNnScppWcep2Ie5zC1kfPd8tlk6tGy7CWhO+IhekcDDt8uQAXlrijDTlXfBAn8UUgd5lUhoO12WbRd/GxjBJzrxt7vBBeI2uN7if99lpT3ycYfJSjm2hOZe/GIjDLvS7Ilh9IA7bqbxUJM79xmMfnzpFcXb0SOTZCdQhxup9sDubjwm/GE7kNVHyT+0uD6QRPBkqTw13CNFRbrHa4DSqLJjuXdSp97Ic6SeEr4bCmunjFV3zida/bm/QSHeQOMsB3IVDg8RZRSr/vlI8yGE4Dkq5ZLRmU8t1k7wS8eaJ5SHeBpxaWMon8coA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GHrMD1ZRwMJqiJUr8zXCjReMk57kt2vx8gsp61dgHdY=;
 b=BMTlo11NVJUJKLoF1fFHOT3BLVHDvz3jz97w0j7z0YCY43sWy5nixffvvuSF+SB7+WXYojmREaiVfkdD61l1RHLiaMK1yCJUwUw4lJEz3Knfpir53zi1+yOTILlwhJYACcSQ6vaa83dFs1/V4HXZkzJWjh4GSHN46DXf26GFAvf5WcsJzh5PKJpDdNkxpeudCCL8yqMua5pi7aYUNUrSvmrqPGPNSXfjDHvhIq5SYcMrSWR1Sl5y9XcQCWAbGa1/FzDVEmQd9FRWMMybrJn2AV+sHvq3EY1X5RtbIO+niEU/LL64RBpEsToBBA78JVJDfXZgrUDW+eBl5ShY5ILaPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GHrMD1ZRwMJqiJUr8zXCjReMk57kt2vx8gsp61dgHdY=;
 b=YO8H+Lk3yXoDNDOwAngEecsWQQt5tReFNepMSlG24T+naXz9urWWiv77rubuCHdLFDzlyfKx5AfOp+Our6Ncu2lnr985EUpmoJm9fK5qTH6Tx2IMP0y2DQFPl5Yq7IolVdW0h3VR7vJ3f+OuELokQLtvdOuy5OPZ2YybWcofT+I=
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
Subject: [RFC PATCH v1 04/26] xen/arm/cca: add Realm domain and vCPU state
Date: Fri, 15 May 2026 13:07:50 +0900
Message-ID: <20260515040812.983626-5-den@valinux.co.jp>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260515040812.983626-1-den@valinux.co.jp>
References: <20260515040812.983626-1-den@valinux.co.jp>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCP286CA0352.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:7c::19) To TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:38f::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY7P286MB7722:EE_|TYYP286MB3981:EE_
X-MS-Office365-Filtering-Correlation-Id: 63cdcc5a-39d3-40a8-b9c4-08deb2379a6b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|376014|366016|10070799003|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	ZwoBko41sEgLYwrUrKmeEfiYFlxIgyph0mcsCSU6JEuJRI57Bf2AmHyd+NkzxkU/qbzAvY0Q8REFvkQYIBLvhRrsumiz/QPMc5vHVEfgTCEJJWEfvEIwypZKuyGwCns4rCIp+6WQOrTwxxptYN6cvYoN1rnlJVvDk9gq5hbW0Ohb5fjf4P/rUvA4WgPrlvpYzELkwsiJzJYtv6Fa2QnFHPJQOZ219S4HHsxwGgdOWawnKm80SreoBbRCwAHtT7ja6WMRH1plXasL2BJ0W5lCzGEW3Hllz5cfn1GNqqH1XRBObuaqICFtd/fgYxqwkFJsRUPpq22IGHVl5XFVkJ8BxA4nKhIzyfm2nwzrBhIypNIaSs1KMgypdVJM/YMCSMeD5BcNRfQI8lYA3a7qMMSWsEz538opakLw2v6P1DtIDhLGb5IytSKUz1U72CsmbFWvtYo4L5Q5vZCOqEi6s0pwDPnS3Sq1SS4pr9nWsAjmGozKqVLfRIxkGQoIVfX5YkqB25W2SQrWfLo3IPVgut2ukEHuQkdMV3E+KTR2gmLEUXNdPFGTmIBkrMiPKnYpDV3Sk3YyyMH7AuzHwmZ7Ebe2yfa0KnFkD6DEn1T23RU//UXaHFpLu/yvjd+Zh4tN7oEao/bmz23EqjKTnET3YB4hcErcU4z4lBqSIuQLREhyangYt7ShhhlKoZLAIf1wbitx
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(10070799003)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?rH48G1WSS7ntts+uU4P35t2pPu2uGKffcwDNg8in9D3Xn/sWMzZwaa0Ufq/7?=
 =?us-ascii?Q?374LKqjJR/uPgRl6sA94QBBW2Laq89SuLpA57ok78I8mmdVqcF/15wkgnBon?=
 =?us-ascii?Q?/tQhjGbp/VEAO8CSMqTZ5R/b7JOwUz/00lsFXYIrMtLKSM3InZLGgfdGXFxf?=
 =?us-ascii?Q?tDcitylIUNvpMoAhauXf2WlK2hTDq25gaqAzc8SeeJnO+TXeOW0EGDgbguRe?=
 =?us-ascii?Q?yR6K4TjBOWRQJV+6FeMFlPwX8aJ4kk7ZMP30/nymSpePKgMtuqTrf34EQNqt?=
 =?us-ascii?Q?TyknlgVo/Wji2fSFjiHyW9tbFOcPVuPTkKBl+sYHfdXUUmMJxVPVxYLq4/9Y?=
 =?us-ascii?Q?DFR+Z3f2lEHuFBv1KXQVP4Tx1SimuJpK4PYbrgY9l3bDNSush8JhkTMF27NN?=
 =?us-ascii?Q?kf3eiRZU8g1AN9Zwm2PRivqYEiy89iS29RJz8/e8RckvpjnRm8+1WMMTX7BZ?=
 =?us-ascii?Q?iVv4wOBHH6ON2Brw1CIy+9UiiVN8Z8hP0Yg91vQLt0rCHLYEC815PrYCqH5A?=
 =?us-ascii?Q?Ny1+WD2ko6FQ5T++gek2iyref+l62Nsi8uYSUyyVVtbBMgT9I6DPDpOrFCtj?=
 =?us-ascii?Q?7tQlgbDixBW0ywIkfl3WmmxOoipDOJuVWUXYlSaCiruv8WfIa7bwuMUDufqk?=
 =?us-ascii?Q?pzxoIyNsJ5+6iX04P34Eg+sYz4vnzMcbUVeBKYUEowfMSkW1o5HQKRHsBFkx?=
 =?us-ascii?Q?54o3jzO4Pq+MMcnJrpXTofkkYAuMosWraxxgUoZmizWlvwmTH4gtDjOLeL8d?=
 =?us-ascii?Q?GMi8gqbe9IlZWKZMRGkxCCcn7Z/QqTSFEjX2Mx8/UJqHDUE4VlBUvaCDpxbO?=
 =?us-ascii?Q?Td6Lncb+NuNK17un8BDmQ0ygbISEPllUQHJsY4HVxevIJxjjIqssY9TjCL2u?=
 =?us-ascii?Q?UCecuttsmBe4hGqK/6uLsmEH+9vO8LMF/+Lkk/a/Yfsgcal5DaaN+opATJvW?=
 =?us-ascii?Q?hN4Pf5rfynfb/24WbNQOFWyhzW8L5Bvq84/xCZkoHAA/MTiYQm/FOsr092uO?=
 =?us-ascii?Q?ZaiEJq893izYSp7gZL1DS4Zyb3xrDv68s1JfauPASRew44wk2y3GEE8pCNVf?=
 =?us-ascii?Q?bzg0WC+St7wjlWB1MznRWwZMl03bPm3gOkDCmJeXnc+5f+JBhQrA2XHzQviA?=
 =?us-ascii?Q?qH8dCKtNo+2iVvOEljRG2Q9RQ9/O2ER+ZXGlwa+9wuj+Tt15BI9+vQlxGxiC?=
 =?us-ascii?Q?4sBzypVZ2RY+AV5Ti4Kq+uuBU0xkp6CWnvwZTREu8rzUAZegW4Z5o4mlMNE6?=
 =?us-ascii?Q?SiELhZpkydBeYYGN9MavW2RNMVANn/C6YFVERXTSWOnYcJXrjRVG17JhOUEP?=
 =?us-ascii?Q?nY8ClzuIW8cwM01jUB5pSEVLC3Ywj52e75wgz92LuJQJl9awjFcRgJrfWDJu?=
 =?us-ascii?Q?HtLvPZheW+M8+uKI0t03x2CkNYiDzqLDwye/jXzAR2QXjZs+QaorZxLJDp1y?=
 =?us-ascii?Q?kd+TiRExB6H/spI9ei0bKFS0txBI+6urOBAZ4k2n0pTwrIHd3vbfz1VhEZjC?=
 =?us-ascii?Q?6lBeaxXIJ7m8VjZQPNksva8JU2Z1J1LX88ds/TrWnsop5RIOzWmj34XrMiyc?=
 =?us-ascii?Q?AFBVg2g4Ivp7IWg9HlHcpdgHlyJIBPDpK7TnNvURdHUdgWdowV4vkBGB+++y?=
 =?us-ascii?Q?TZsmT9IVYHhPkQ/NXp/rxfLT+9qtMClMhYtWzCYKxOTdtNMe5nw9dqLarHyy?=
 =?us-ascii?Q?9kTVORNn6gRlLlVIuqsT72iTJpLN/YfnvxaQM3cWubvE/qQzq9ZgvO79aNC9?=
 =?us-ascii?Q?ejLPkquqgtO+UrvGJ7fVfpKWwWSsa+BmgZpJ4OyeaRYfG/fXjALg?=
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: 63cdcc5a-39d3-40a8-b9c4-08deb2379a6b
X-MS-Exchange-CrossTenant-AuthSource: TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 May 2026 04:08:21.7474
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TNRBO4+UpP2KShOZ2d/+cX5cNYJBst/cxA+omQEtPwX0hTNCvUFe7Ej8wCOhreNaCCnEPI6enYJ3Hcj1xVPEuA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYP286MB3981
X-purgate-ID: tlsNG-ebf023/1778818109-413773FF-243BD070/0/0
X-purgate-type: clean
X-purgate-size: 6468
X-Rspamd-Queue-Id: B329B5491EA
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

Add the per-domain and per-vCPU state needed before Realm objects are
created: Realm state, RMI feature snapshots, REC bookkeeping and RecRun
lifetime.

Signed-off-by: Koichiro Den <den@valinux.co.jp>
---
 xen/arch/arm/cca/Makefile         |  1 +
 xen/arch/arm/cca/state.c          | 68 +++++++++++++++++++++++++++++++
 xen/arch/arm/domain.c             | 14 +++++++
 xen/arch/arm/include/asm/cca.h    | 42 +++++++++++++++++++
 xen/arch/arm/include/asm/domain.h | 16 ++++++++
 5 files changed, 141 insertions(+)
 create mode 100644 xen/arch/arm/cca/state.c
 create mode 100644 xen/arch/arm/include/asm/cca.h

diff --git a/xen/arch/arm/cca/Makefile b/xen/arch/arm/cca/Makefile
index 9c351f901dfd..aaa04e3b914b 100644
--- a/xen/arch/arm/cca/Makefile
+++ b/xen/arch/arm/cca/Makefile
@@ -1 +1,2 @@
 obj-y += rmi.o
+obj-y += state.o
diff --git a/xen/arch/arm/cca/state.c b/xen/arch/arm/cca/state.c
new file mode 100644
index 000000000000..a47d9cd7b6fd
--- /dev/null
+++ b/xen/arch/arm/cca/state.c
@@ -0,0 +1,68 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+
+#include <xen/lib.h>
+#include <xen/mm.h>
+#include <xen/sched.h>
+
+#include <asm/cca.h>
+
+#include "rmi.h"
+
+static void arm_cca_reset_domain_state(struct domain *d)
+{
+    d->arch.cca.realm_active = false;
+    d->arch.cca.rd = INVALID_PADDR;
+    d->arch.cca.rmi_features0 = 0;
+    d->arch.cca.rmi_features1 = 0;
+}
+
+static void arm_cca_reset_vcpu_state(struct vcpu *v)
+{
+    v->arch.cca.rec = INVALID_PADDR;
+    v->arch.cca.run = NULL;
+    v->arch.cca.run_pa = INVALID_PADDR;
+}
+
+void arm_cca_domain_init(struct domain *d)
+{
+    arm_cca_reset_domain_state(d);
+}
+
+void arm_cca_domain_destroy(struct domain *d)
+{
+    arm_cca_reset_domain_state(d);
+}
+
+void arm_cca_vcpu_init(struct vcpu *v)
+{
+    arm_cca_reset_vcpu_state(v);
+}
+
+void arm_cca_vcpu_destroy(struct vcpu *v)
+{
+    if ( v->arch.cca.run )
+        arm_cca_free_rec_run(v->arch.cca.run);
+
+    arm_cca_reset_vcpu_state(v);
+}
+
+void *arm_cca_alloc_rec_run(void)
+{
+    void *run;
+
+    BUILD_BUG_ON(sizeof(struct arm_cca_rmi_rec_run) !=
+                 ARM_CCA_RMI_REC_RUN_SIZE);
+
+    run = alloc_xenheap_page();
+    if ( run == NULL )
+        return NULL;
+
+    clear_page(run);
+
+    return run;
+}
+
+void arm_cca_free_rec_run(void *run)
+{
+    free_xenheap_page(run);
+}
diff --git a/xen/arch/arm/domain.c b/xen/arch/arm/domain.c
index 26380a807cad..4b6115491c59 100644
--- a/xen/arch/arm/domain.c
+++ b/xen/arch/arm/domain.c
@@ -482,6 +482,10 @@ int arch_vcpu_create(struct vcpu *v)
     v->arch.saved_context.sp = (register_t)v->arch.cpu_info;
     v->arch.saved_context.pc = (register_t)continue_new_vcpu;
 
+#ifdef CONFIG_ARM_CCA
+    arm_cca_vcpu_init(v);
+#endif
+
     /* Idle VCPUs don't need the rest of this setup */
     if ( is_idle_vcpu(v) )
         return rc;
@@ -526,6 +530,9 @@ fail:
 
 void arch_vcpu_destroy(struct vcpu *v)
 {
+#ifdef CONFIG_ARM_CCA
+    arm_cca_vcpu_destroy(v);
+#endif
     if ( is_sve_domain(v->domain) )
         sve_context_free(v);
     vcpu_timer_destroy(v);
@@ -642,6 +649,10 @@ int arch_domain_create(struct domain *d,
 
     BUILD_BUG_ON(GUEST_MAX_VCPUS < MAX_VIRT_CPUS);
 
+#ifdef CONFIG_ARM_CCA
+    arm_cca_domain_init(d);
+#endif
+
 #ifdef CONFIG_IOREQ_SERVER
     ioreq_domain_init(d);
 #endif
@@ -786,6 +797,9 @@ void arch_domain_destroy(struct domain *d)
 {
     resume_ctx_reset(&d->arch.resume_ctx);
 
+#ifdef CONFIG_ARM_CCA
+    arm_cca_domain_destroy(d);
+#endif
     tee_free_domain_ctx(d);
     /* IOMMU page table is shared with P2M, always call
      * iommu_domain_destroy() before p2m_final_teardown().
diff --git a/xen/arch/arm/include/asm/cca.h b/xen/arch/arm/include/asm/cca.h
new file mode 100644
index 000000000000..1be43327119e
--- /dev/null
+++ b/xen/arch/arm/include/asm/cca.h
@@ -0,0 +1,42 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+#ifndef ARM_CCA_H
+#define ARM_CCA_H
+
+#include <xen/types.h>
+
+/*
+ * Keep the public ARM CCA arch header independent from the internal RMI ABI
+ * definitions that live under arch/arm/cca/.
+ *
+ * DEN0137 2.0-bet1 - B3.99 RecAuxCount caps the implementation-defined
+ * number of REC auxiliary granules.  REC_CREATE gets them through SRO
+ * donation.
+ */
+#define ARM_CCA_MAX_REC_AUX 16U
+
+struct domain;
+struct vcpu;
+
+struct arm_cca_domain_state {
+    bool realm_active;
+    paddr_t rd;
+    unsigned long rmi_features0;
+    unsigned long rmi_features1;
+};
+
+struct arm_cca_vcpu_state {
+    paddr_t rec;
+    void *run;
+    paddr_t run_pa;
+};
+
+void arm_cca_domain_init(struct domain *d);
+void arm_cca_domain_destroy(struct domain *d);
+
+void arm_cca_vcpu_init(struct vcpu *v);
+void arm_cca_vcpu_destroy(struct vcpu *v);
+
+void *arm_cca_alloc_rec_run(void);
+void arm_cca_free_rec_run(void *run);
+
+#endif /* ARM_CCA_H */
diff --git a/xen/arch/arm/include/asm/domain.h b/xen/arch/arm/include/asm/domain.h
index 46a5cdc0c800..25230c18d16b 100644
--- a/xen/arch/arm/include/asm/domain.h
+++ b/xen/arch/arm/include/asm/domain.h
@@ -3,6 +3,7 @@
 
 #include <xen/cache.h>
 #include <xen/timer.h>
+#include <asm/cca.h>
 #include <asm/page.h>
 #include <asm/p2m.h>
 #include <asm/suspend.h>
@@ -96,6 +97,9 @@ struct arch_domain
     /* ARM SCI driver's specific data */
     void *sci_data;
 #endif
+#ifdef CONFIG_ARM_CCA
+    struct arm_cca_domain_state cca;
+#endif
 
     struct resume_info resume_ctx;
 }  __cacheline_aligned;
@@ -207,6 +211,10 @@ struct arch_vcpu
     /* Timer registers  */
     register_t cntkctl;
 
+#ifdef CONFIG_ARM_CCA
+    struct arm_cca_vcpu_state cca;
+#endif
+
     struct vtimer phys_timer;
     struct vtimer virt_timer;
     bool   vtimer_initialized;
@@ -224,6 +232,14 @@ struct arch_vcpu
 void vcpu_show_registers(struct vcpu *v);
 void vcpu_switch_to_aarch64_mode(struct vcpu *v);
 
+#ifdef CONFIG_ARM_CCA
+#define is_domain_realm(d) ((d)->arch.cca.realm_active)
+#define is_vcpu_realm(v) is_domain_realm((v)->domain)
+#else
+#define is_domain_realm(d) ({ (void)(d); false; })
+#define is_vcpu_realm(v) ({ (void)(v); false; })
+#endif
+
 /*
  * Due to the restriction of GICv3, the number of vCPUs in AFF0 is
  * limited to 16, thus only the first 4 bits of AFF0 are legal. We will
-- 
2.51.0


