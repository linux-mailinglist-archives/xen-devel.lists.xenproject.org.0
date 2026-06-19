Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 8HYmJ+v0NGoOlQYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 19 Jun 2026 09:51:07 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 49A0B6A4720
	for <lists+xen-devel@lfdr.de>; Fri, 19 Jun 2026 09:51:07 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=valinux.co.jp header.s=selector1 header.b=lbt9CRVa;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=valinux.co.jp;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1341732.1602011 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1waTzf-0004NX-TY; Fri, 19 Jun 2026 07:50:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1341732.1602011; Fri, 19 Jun 2026 07:50:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1waTzf-0004Lk-Nj; Fri, 19 Jun 2026 07:50:27 +0000
Received: by outflank-mailman (input) for mailman id 1341732;
 Fri, 19 Jun 2026 07:50:26 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <taka@valinux.co.jp>) id 1waTze-0003z1-GI
 for xen-devel@lists.xenproject.org; Fri, 19 Jun 2026 07:50:26 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1waTzd-001qMv-T8
 for xen-devel@lists.xenproject.org; Fri, 19 Jun 2026 09:50:25 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <taka@valinux.co.jp>)
 id 6a34f4b5-2eae-0a2a0a5409dd-0a2a450bb90e-38
 for <xen-devel@lists.xenproject.org>; Fri, 19 Jun 2026 09:50:25 +0200
Received: from [40.107.74.114]
 (helo=OS0P286CU010.outbound.protection.outlook.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.0)
 (envelope-from <taka@valinux.co.jp>)
 id 6a34f4b9-5e53-0a2a450b0019-286b4a724d13-5
 for <xen-devel@lists.xenproject.org>; Fri, 19 Jun 2026 09:50:25 +0200
Received: from OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:458::18)
 by TY4P286MB7477.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:356::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.11; Fri, 19 Jun
 2026 07:50:19 +0000
Received: from OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
 ([fe80::c8c9:25cd:8d13:96d6]) by OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
 ([fe80::c8c9:25cd:8d13:96d6%6]) with mapi id 15.21.0139.011; Fri, 19 Jun 2026
 07:50:19 +0000
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
 b=i+EGGOtU64Oob4wpmwj/yUyLfzeQNMcmg/FrDHQglIZYTROQUHRep4bqQye0W7OV1EC+k0Vf0xQI/y+XWxLPs0q9g66mCcdz/2/YdWEmisp0nxtKg2Ks6bh+eQNCZP/LTZAMZCApAtl8UyHMuWf1RpWhcUw0yC8rY49A4D7sDMUli7JmhysgU+nBtLzDrnIU8Y4gJA7ri2bx73Cv3awM/eMdjZ2w80FP4nsAQwdHGW/W8zQZ5ISC9C6GJHzo/bGpEakV+jGpp/Y5e/DB7WCQ0oN4AmNCo70sVUEDl9TTk9t32bl8Ak9NhgOWa/x8bRSj0HIpVzKjpzf0tCCQX7oeXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=61LMVP4jRTDvsJV5c8jFg3V5iNl05Shx6hWCtT3eNHQ=;
 b=bJ4OE3UhNKTtg2QKkXAGsOi7Zbk9Wy6U8LrKZ55dNCDgdZHmTBI2piCj+I1UMV0jkJ0n4ruUgJH0J2uHk/ZyFuEcPlCypyE614Pnki0vq3rSTvFKc3UyUprwZZ536xhbJqSbAIH9n02k+q71+ejnWARivQFK593RudXMA+lvjM2f2LHKLeCcrBOFXka/PJNIG32ymYRC975gUJgWLznl3M5dJqKQI8NzWCwQ/pAxmNCoA2LzVc4VZTkwcSXQd3o5oHV6NvjVVpd/+nVUbfs1YORVTAwQRpcUl5mPFuZqAW6YtWjSV4IXnzcK9ZZw1besu6x1KNMjFNQeUlZxeOfD4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=61LMVP4jRTDvsJV5c8jFg3V5iNl05Shx6hWCtT3eNHQ=;
 b=lbt9CRVaMUKJJ5bmrRSnJ9c15DwfEfubi2ZoGeRxM+EvkSgrci2t8AskiM6KBT1+rg4lEcHOT1FTgtUah0LxPXwmhItdlCKrsWdmWxzKG1TNGuu3Qh5AEfrSqr1WhurEaCdZJ2U+1TeQgrP26MFCG0cVUEkKsWGZ+P6CDM02Oms=
From: Hirokazu Takahashi <taka@valinux.co.jp>
To: xen-devel@lists.xenproject.org
Cc: Hirokazu Takahashi <taka@valinux.co.jp>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v3 03/22] xen/arm: NUMA helper functions via Device Tree helpers
Date: Fri, 19 Jun 2026 16:49:51 +0900
Message-ID: <20260619075011.377116-4-taka@valinux.co.jp>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260619075011.377116-1-taka@valinux.co.jp>
References: <20260619075011.377116-1-taka@valinux.co.jp>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TY4P301CA0001.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:26f::12) To OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:604:458::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS9P286MB7222:EE_|TY4P286MB7477:EE_
X-MS-Office365-Filtering-Correlation-Id: 20df154f-4776-4778-d73c-08decdd768ba
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|376014|1800799024|10070799003|56012099006|6133799003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	ATnHAXa7q3aDm0W/mJ9pUI5HXdQG1H0PaX8NcsQBrY5G2Qa0YT2sIClmVEhX2cijc/fT2gS4/AvKBRsOauoz4FjlRb3+W1PzuVT+qyc8YP1N6Jc5cdju+hP7ijK94sDsMueAFv6PNKRhiHX1pzGRDyPfAqfkaZcpj/QDQuW7Xp5orAA227K4fuNdAMQTtr4BMs//PlrYhzFa8BUWx5nlWhpO69X/ooVXEKTgYfbheCvWnkLn40a6Ulh7rzqkaOXoEmNSxkPqjr0KiPiS5ZR0O56oAclniXxVwMJM4erM1o6YvJPZwP9MGyaz21IRVizODSNfkb4v+SLCJ2t757VX2xaGRiJDcadQU/b7Dn/UeUL2PWfCt8O0TYcF2lS5NNLUz7NQZwhoBsdh+P/cz1AooozEzBBtQYtA8K+8RS+yYklZWBw2U0/kRA3xuiuxnh1ItXHqHQ0VICzwApn2U8M8ECI6/RNbH+jKMWQAHT7LV7ow5WkUteX3m2nZZPZ6KzTsgTRXE9je1gJQcMkbRV1I0Cz1sw+nHgTbu7sb51rWfr5XQLTM7Xc0+49/ikBXsWrjR+KVGQrpQnu6RWK4I9iFrui0w0dA4erXIb8EDW4JfQRsSjsdi5dPX6+CmSuCbWrsiWnNbdNEJTPXagiZ8KE6hJq4Zax3qWi9DewsQbTZ5hQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(376014)(1800799024)(10070799003)(56012099006)(6133799003)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Rdim2DioGZvTQCeaPH2lEzySHtWZFYcJ5AAQz+LBAOHdNHCsHpKeFvP1jSaG?=
 =?us-ascii?Q?qK3MlgWOFiG3E1Smu9uljH+89VYtQSHJVKrmyAl93pfbJP//ISJV4latl1c8?=
 =?us-ascii?Q?RUGW7eJloZhSA3Xddme3MkJ1w7og+9lUG5TKvzhDoy/v8MfdcHJRHj4uBj9Z?=
 =?us-ascii?Q?rAB488CUJZMVBxO935au3r63WoZPETFxdBzHOABrXuEZvU1H5C+/uC0i2CR9?=
 =?us-ascii?Q?gN6i7iu/44W8+lRyDvhG6hB0N1vk2netNHM2YUzGV5Cl8n2NeXmNgPi5DkLA?=
 =?us-ascii?Q?lT/u/gbkGLIYYbVtjiQImuJQm2H1Jo+3T7AGBcpp68wnyiQAo3z1p3IOj8wO?=
 =?us-ascii?Q?EEms6+x9voXk1VMIMDiROWfFfzjV5Rls95gsFsI1YZZIOUpK5NM8VFtLbPgk?=
 =?us-ascii?Q?rBT6c02hj/2NCaLLc08QxEt4hg73tEoa8TXn0PQKvHEtE2oBjE/GVOUxPTqd?=
 =?us-ascii?Q?ewOcGa74hQxUHfhnHkzwQ7JHNSjOQ+eSoZXD3vGqyrdJorgiiDGgZp3xZrPK?=
 =?us-ascii?Q?P6x5EdJpXbfEeoZ2kPk16HJVASQjvXa4EQCVkTZ5LjYKfuH8iuNLVaAV2+VU?=
 =?us-ascii?Q?Z0L/4fr2qgURUvFnFhjkRWY4SjJ6TQwmnZofk8pOch6SeDbiX2T6wnHqCHcJ?=
 =?us-ascii?Q?q6v1lAfKMDa/JRXEb5hPqmZGSSE3sPtmabrkY/oO2GjakuYZsqqb/pFSV/XD?=
 =?us-ascii?Q?DINDZOLMD4GlRLXY2cm9bmECuvNpQW0X4IMVueBcMuO2UVlyrwHewQhHFQOI?=
 =?us-ascii?Q?1P1mwZaOyW9htjVzcXkfuJ8T7pZ31uFlqniRt87FXNpL0m8d0zozj6/CdIJV?=
 =?us-ascii?Q?Enn1EKZ7hJu0SxEZ2jN/XE924di8ZOEPji85nsiV2vOao/Pvx9Mk/pApZseZ?=
 =?us-ascii?Q?xaz/wgAu5yzVkEO3zIed3283vnuBFPNUNjo2GokDqTCdta/nFfmkd1s2YkrJ?=
 =?us-ascii?Q?/mCjtCNw/P+hgYl6ZFW4z026tmU7THBgpb4jnGB9O/MG5tRG3Rd1gBB2O0Kq?=
 =?us-ascii?Q?mpsQrgYzsIUYg0WrzIxBeLiUdHAlipS9WYwGjQxR7yK8THuxfjNLCC9qqoBJ?=
 =?us-ascii?Q?SweC4dlBYZPTcO8XR/QCTfNLh8AWH9cBZm9K0bbXXKTuEB6I6sVdTbi3Q8pL?=
 =?us-ascii?Q?JW5mNdpuB/p6tuKtBudvSlZDfRTYw+OArN8YsRDRtnUAG15jsv9iAEATIdb9?=
 =?us-ascii?Q?Fh+HbDskTY8P9b5zeG6MGgVNtHcVkHLhjdqKwjbQPY533yJVpzTLAqe23ARy?=
 =?us-ascii?Q?kHMvZuaGAkfCEk30BLcy7RR1L/xEFigEmGhtMIfA5SfxDlAfoinCRSNdEPMX?=
 =?us-ascii?Q?1qKUAcw5i1DR9woESvI7PS93yetbzxY1Us9pgnCH96brgRSZK4ieza8O0mAl?=
 =?us-ascii?Q?W2LfVIcVHxsZSUmw2wcjKYCP7Wz2uwAvEKt7b/kLJP0kzU+grYMnPMkwJzmB?=
 =?us-ascii?Q?0XL9sjBbGnyXBq1Lig7sKhFq0+yDHzkFVD683XTlEx90WSKAeBJ/jRTakAVi?=
 =?us-ascii?Q?f8L8X3LDcKWyuS+lr2UkoV+2RQMA9ytgtJEfDpHWBoGX7L/5R5HdLh9A54qx?=
 =?us-ascii?Q?NFloBB6AtVfyg/F2PNytuZVTiZvw5AmW0u/KqqCpI8oyexpm8OPw3ySxFLhL?=
 =?us-ascii?Q?4DHfXWO7hJIGPr1DwdWFUjENOah7W7BII6qIiqk9Fgv5PW4MHZJGHhOAcV5E?=
 =?us-ascii?Q?MEv0LETmW0glzBabjAkZo9wQHMYReHNcm9MMCgvjJzzi4jscLUzSK6XOFOGS?=
 =?us-ascii?Q?OUzxOdDnGmmEXswkGXwG0RO9pykl/zw9Ah0xr54c6WAOzGZ1t8O2Qokr9cju?=
X-MS-Exchange-AntiSpam-MessageData-1: nBxzIzJt966/cg==
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: 20df154f-4776-4778-d73c-08decdd768ba
X-MS-Exchange-CrossTenant-AuthSource: OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2026 07:50:19.2859
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: V36CT44LETdGVdndFEjqWdFcvbQej//FefBYDLmmQUZSemfX+ra9B+BM3b9fw5CJ4QDxy9GJ7Uwm+7t4QQsdUw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY4P286MB7477
X-purgate-ID: tlsNG-42698a/1781855425-47DE800E-A0ACCF41/0/0
X-purgate-type: clean
X-purgate-size: 2685
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.69 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[valinux.co.jp,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[valinux.co.jp:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[valinux.co.jp:dkim,valinux.co.jp:email,valinux.co.jp:mid,valinux.co.jp:from_mime];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:taka@valinux.co.jp,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[taka@valinux.co.jp,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	FROM_NEQ_ENVFROM(0.00)[taka@valinux.co.jp,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	ALIAS_RESOLVED(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	DKIM_TRACE(0.00)[valinux.co.jp:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 49A0B6A4720

Implement the NUMA helper functions for ARM Xen by invoking
the Device Tree-based NUMA helper functions.

Signed-off-by: Hirokazu Takahashi <taka@valinux.co.jp>
---
 xen/arch/arm/Makefile           |  1 +
 xen/arch/arm/include/asm/numa.h | 19 +++++++++++++
 xen/arch/arm/numa.c             | 50 +++++++++++++++++++++++++++++++++
 3 files changed, 70 insertions(+)
 create mode 100644 xen/arch/arm/include/asm/numa.h
 create mode 100644 xen/arch/arm/numa.c

diff --git a/xen/arch/arm/Makefile b/xen/arch/arm/Makefile
index 84c4062b30..10d20e3a84 100644
--- a/xen/arch/arm/Makefile
+++ b/xen/arch/arm/Makefile
@@ -51,6 +51,7 @@ obj-y += setup.o
 obj-y += shutdown.o
 obj-y += smp.o
 obj-y += smpboot.o
+obj-$(CONFIG_NUMA) += numa.o
 obj-$(CONFIG_SYSCTL) += sysctl.o
 obj-y += time.o
 obj-y += traps.o
diff --git a/xen/arch/arm/include/asm/numa.h b/xen/arch/arm/include/asm/numa.h
new file mode 100644
index 0000000000..8c46048ac8
--- /dev/null
+++ b/xen/arch/arm/include/asm/numa.h
@@ -0,0 +1,19 @@
+#ifndef _ASM_ARM_NUMA_H
+#define _ASM_ARM_NUMA_H 1
+
+#include <xen/types.h>
+#include <xen/cpumask.h>
+#include <xen/vmap.h>
+#include <xen/dt-numa.h>
+
+typedef uint8_t nodeid_t;
+
+#define ZONE_ALIGN (1UL << (MAX_ORDER+PAGE_SHIFT))
+
+extern bool numa_disabled(void);
+extern unsigned int numa_node_to_arch_nid(nodeid_t n);
+extern uint8_t __node_distance(nodeid_t a, nodeid_t b);
+
+#define arch_want_default_dmazone() (num_online_nodes() > 1)
+
+#endif /* _ASM_ARM_NUMA_H */
diff --git a/xen/arch/arm/numa.c b/xen/arch/arm/numa.c
new file mode 100644
index 0000000000..1fddf7d15b
--- /dev/null
+++ b/xen/arch/arm/numa.c
@@ -0,0 +1,50 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Helper functions for ARM NUMA.
+ */
+
+#include <xen/bootinfo.h>
+#include <xen/init.h>
+#include <xen/numa.h>
+
+#if CONFIG_ACPI_NUMA
+#error "ACPI NUMA isn't supported yet."
+#endif /* CONFIG_ACPI_NUMA */
+
+
+bool arch_numa_disabled(void)
+{
+    return false;
+}
+
+unsigned int numa_node_to_arch_nid(nodeid_t n)
+{
+    return numa_node_to_dt_nid(n);
+}
+
+uint8_t __node_distance(nodeid_t a, nodeid_t b)
+{
+    return numa_node_distance(a, b);
+}
+
+int __init arch_numa_setup(const char *opt)
+{
+    /* parse "numa=" option */
+    return 0;
+}
+
+int __init arch_get_ram_range(unsigned int idx, paddr_t *start, paddr_t *end)
+{
+    return bootinfo_get_ram_range(idx, start, end);
+}
+
+bool __init arch_numa_unavailable(void)
+{
+    return false;
+}
+
+void __init numa_fw_bad(void)
+{
+    printk(KERN_ERR "%s NUMA info is broken.\n", numa_fw_nid_name);
+}
+
-- 
2.43.0


