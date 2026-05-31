Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6NGzFNu6HGp/RwkAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 01 Jun 2026 00:48:59 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 094CB6182F3
	for <lists+xen-devel@lfdr.de>; Mon, 01 Jun 2026 00:48:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1323467.1589227 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wToxH-0006fI-Le; Sun, 31 May 2026 22:48:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1323467.1589227; Sun, 31 May 2026 22:48:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wToxH-0006cV-Cp; Sun, 31 May 2026 22:48:27 +0000
Received: by outflank-mailman (input) for mailman id 1323467;
 Sun, 31 May 2026 22:48:26 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <taka@valinux.co.jp>) id 1wToxG-0006P7-6E
 for xen-devel@lists.xenproject.org; Sun, 31 May 2026 22:48:26 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wToxF-00En0E-It
 for xen-devel@lists.xenproject.org; Mon, 01 Jun 2026 00:48:25 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <taka@valinux.co.jp>)
 id 6a1cba94-bab6-0a2a0a5309dd-0a2a4504a1f8-10
 for <xen-devel@lists.xenproject.org>; Mon, 01 Jun 2026 00:48:25 +0200
Received: from [40.107.74.138]
 (helo=OS0P286CU010.outbound.protection.outlook.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <taka@valinux.co.jp>)
 id 6a1cbab7-1dec-0a2a45040019-286b4a8afde8-3
 for <xen-devel@lists.xenproject.org>; Mon, 01 Jun 2026 00:48:25 +0200
Received: from OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:458::18)
 by TYWP286MB2972.JPNP286.PROD.OUTLOOK.COM (2603:1096:400:2fe::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.16; Sun, 31 May
 2026 22:48:22 +0000
Received: from OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
 ([fe80::c8c9:25cd:8d13:96d6]) by OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
 ([fe80::c8c9:25cd:8d13:96d6%6]) with mapi id 15.21.0071.015; Sun, 31 May 2026
 22:48:22 +0000
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
 b=x9Q85AIugoR2y7uVk1WDWnAcwvbC00HJ7aixSJwGKT+7A5MAQ8avH1x/7GaKC7u3iGDzFX/8ysNiGgdSvW7JxPIIPKJOjkwNQmqsPMR78xCK7rcRZDMAZtBgpURfguPhhwd0pGS9eeTDE0gIRumxJs2xb5qcXv9z26iMHIw7pDffueXeHA+mtln/oN2mleO2eg+S/JPrPyW5cgGoubgeI6Ba2yZ9gQzEDvrVnA86V8iwvT5SHvehnHOB1pfnriwsPlcTneYEE8FKQxtjsDm22SVhRrYlj+os33X8day4JYyqDH0pVgR3YETKxRtsx5cZmeDgx0OIYjl+GzOBqDGk0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v3KGkmY7p7M2J6F4vJvqKMYA8FFzPtk9uty5vUDLtT0=;
 b=SPZ++2yAIdA3BUUYXLcAofOTV6BX0b0Xu8aor5ed2Bb1MGjq7LeYLlRjECrAejudof764+zYm1jVMT09e2n+j17IrJoU1qysKzk4/w6V1K2qpa/xrjUPoOcRIxiH+5C4/xMGD84ODE6v5jVkfS7UCB2I7aF+fWLGP2PfjYUr4iuglOKOmDM+dsHkoelQrzpz188SMfnBiMPayT4ivH1WYeSmSWpFbjwVfklsFO1EQ/mQkA2PuV1ZuthY5PriVll++MEdsaSbZDB1rJ3RDIs6vkjeBVkJ3cTTq0avUXHZUmm445tswiqLQfJD1VDXboKreKcyKRIGbdzdSwixSfRBKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v3KGkmY7p7M2J6F4vJvqKMYA8FFzPtk9uty5vUDLtT0=;
 b=vweD/dkPNDl/6D7fMpOsUH07KVB4p9xz4ULSf5LyE1XASAC67y1BqS98iQnBWsMjOm4bEr1BfzIP1wfzydOrjaQIoSgMc44T3FHRG4m3aszwj8VeJjD8a8S7kAwHQivcoAXxnpg+5Fqn4LBiPwumJAAJUYmkF+95n3klJUYYWKY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=valinux.co.jp;
From: Hirokazu Takahashi <taka@valinux.co.jp>
To: xen-devel@lists.xenproject.org
Cc: Hirokazu Takahashi <taka@valinux.co.jp>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH v2 11/24] tools/libxl: Fix vNUMA memory allocation algorithm to support ARM
Date: Mon,  1 Jun 2026 07:47:41 +0900
Message-ID: <20260531224755.9481-12-taka@valinux.co.jp>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260531224755.9481-1-taka@valinux.co.jp>
References: <20260531224755.9481-1-taka@valinux.co.jp>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TY6PR01CA0040.jpnprd01.prod.outlook.com
 (2603:1096:405:3bd::16) To OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:604:458::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS9P286MB7222:EE_|TYWP286MB2972:EE_
X-MS-Office365-Filtering-Correlation-Id: 9d9ad8db-f265-46ef-5643-08debf66b78c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|1800799024|366016|376014|22082099003|18002099003|6133799003|56012099006;
X-Microsoft-Antispam-Message-Info:
	eqHm9enbcl9DXHLtLAuKqpk5ilO3SHon4rLqDhQCbjlXisa/Ft/2jB5GMWw38CxEjdkXSbAkyKQ5Wd/8RJUoJganVIdhfiilW6jb5VlFxugDY2hODnm4Y4TazrMyWimgYP6sUtrB1GydTbaJJKQFAUA15wiJAuT3e5IRVi7Sy36BwkYjFDbZs3aUK8NGkrLWlUeLDfcTskyfKKg1UL9H5v1m2oSZf0LGg0wfXPd010PW6692gLrWmqpY0VWm196V4LkBMGagNiiSKIaVrts7KemQ+p38i91oDk5CpMxK75COO814vS3ZWW+nXXJtBPgTW+V1k5W4I7jBd+R4XmOMKU6r7jiMHc1X3jQH7zrmDg4jWV/LYiID21z9xam2Jxevs7ExMxz8rDtGfHOnx6Q0ylZvvzhG7JiwockT1IqEZk+sYDTQ2a84l9tu+HFHNpIRtI8XzTSOcGAtzuIcBM2/t/aKNPoiNjVkJqwYe2cqT2LDRfslC2AuTPjoOC1rWmvdZFGsZKw56I+ydlcOzR3C6glqDa9S03l2/yRhzQK1GvhhRQZko5T6uRODRV53pz8P9hYeAU1IW9lwzwCkCkXly0bJh68cbZBNiWdfve+9HF3AKxCxOFWt6kvZ4qKS7FeJvPG0xrXncuNPHmr6a8Qi3YVzIPOos3xy8x4SVkADTZLD7tpkwUZjqVjAHfFXQf3n
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(1800799024)(366016)(376014)(22082099003)(18002099003)(6133799003)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?T7tpQmfMkBU9t7PoGlBDqCecQwCfcmaGLpAnPQ3hJl49sp3ndUCb9itwzCds?=
 =?us-ascii?Q?xwOdd/LctWiXvU3CibJ718w7E1CStJ6vZeZDjrRnbv+DROFHf8Qk5daLjNoM?=
 =?us-ascii?Q?Qb+jI5OCvj6lD2TQR74FU2Us0/JQF4lqoxwYRttoAAzM1BfDfb8hBFTHtAh7?=
 =?us-ascii?Q?TNORaa+a1JeCX7GapWYMTkcjcinQvM8M9Zr3WgbLRJZmCRhFSQ2FMT7cgbbL?=
 =?us-ascii?Q?aIlDl9SfDyCw3UF2oMXvZvPaYq7iwmmx4OejeuOg+VdwbNxPARpcIi2uLEl7?=
 =?us-ascii?Q?Xg5eM2sx1mtMGmxZ4orRMzGHIQOcizzYxIx3zOgWkqnk91Sjt5U2gXwMx6Jn?=
 =?us-ascii?Q?ujbo6GEQuj7hBtH+WCJ9iYiSwRVVn6Q6orhcmhIP4CiRXt2cefvUWU+vxV92?=
 =?us-ascii?Q?tLElBGF7vs8IacOocuUiGGk4SXm5TA+sYie8/DprFveRmzTghII9Pfd9n3FB?=
 =?us-ascii?Q?bjLu3IcTXEwYIMnnKVi5WCtU+ExbrEfoO4RS7ClRwzMF8LmTJrTHmyTzIblU?=
 =?us-ascii?Q?IMqy3BnazhJGNNljEe4zPQ2DV8AFhaY5jv+1shZvRUzh34EQHlN19uylvaU9?=
 =?us-ascii?Q?cbt4PsvpEPqBt3W5OTYhOMMIH/D3xQ4QZDBA3ij8W3iydLy2NkI1zsJXuC7z?=
 =?us-ascii?Q?DVTBQUgkDLPJkE2/R+Oe1eeGB42xdYwCU2igFoa2yzcz7b0G+pqbbbUZNthx?=
 =?us-ascii?Q?bArCaPovpztjhzGNKsN/e2ziFptfMQ0D+sqvRjnJSTaZ9GrPvTFIk9Zn3UDC?=
 =?us-ascii?Q?8S6ohiolVMwV0lj3DPmtUriBc5TOPVeBq3yjN+guO/1cBMUCVEKp2TIhDU2H?=
 =?us-ascii?Q?BMtOibTjj9XAqpSzFKKET6cRb6L6IzNmsrogKbjwg3JJpQgttKOlR7pBomm/?=
 =?us-ascii?Q?ot96KIV157SWHowZNUQMqAvfA0779yTfNanWI5NOY0wf7jt1iiPkjmhWPq1n?=
 =?us-ascii?Q?bl+8bCM2Jxh+tCtDhso8QAO2D4C45KoGqxxj+4HoVKCJe6a61mNynMsxC0zB?=
 =?us-ascii?Q?AAVHEKCRubBR+Ve56YBZwU3s9XYaj8vXhwv30S+9at1V7/VgxWWXnfgyy9kj?=
 =?us-ascii?Q?wu3X6vNT8Qf6uqV8U5EyeSUPfHiaZDVw0DNeGal1nr/4eykh/4qG8KzMumaI?=
 =?us-ascii?Q?8MWR1fTP8zdP/XO96aDlLkANshIGnub89CU0ihq25jLsW5ClfMCiGQUeJbRf?=
 =?us-ascii?Q?BSUPE91zc/GCp90//XqJHIXzjC/dda2P8UD3AimvyIT7c9YivmCZKjkJ5MA6?=
 =?us-ascii?Q?mWb9GamhvLJAAimEI5GQMJCGwlnj7dyA220nHij9smHZgSUsQssFMTb18ERU?=
 =?us-ascii?Q?qBGSltSWvPx8z+2horuIzRck+2czy1hpLE2/wpnSF3T7U6PZD0SXfLVtCJJs?=
 =?us-ascii?Q?m5fnO/8+LpCvPKVIf58vlSHeDSYakxcRV2fcuNUmNuvJLDDOx1I8PbB6XgOH?=
 =?us-ascii?Q?egZFdQp8Sv4+O/I7oz6aT0ZIqw1R/qiGJ4xBjXXDewutWv6nKRm7K1yTJI+r?=
 =?us-ascii?Q?8lvnJ+Ac6VKQ/5GzkA3pcV0jtaT46GJg56SYYviYrqQi1m7VF0RmqBWDw5vF?=
 =?us-ascii?Q?ESOAti9x01ePDx0Ww1ZFY06bblcz3OcPp3g2Oij0Dx+6n0J4cv7pUScG2fUU?=
 =?us-ascii?Q?7VCpyQU3C6zndHjOC09ac8FUr+qxwvN00zj8/35AmdZity2guSExb/1aCsr6?=
 =?us-ascii?Q?mWnchKjqNZprhuBBMAUoSHsyuvHTlQmGomsXFjgwYl9cOpQ7y1NyL8yAjJzP?=
 =?us-ascii?Q?UFux+TSRVTWjeOLJuzXcBxTKK7PZmrcR2PkYdQL2HZWk4T4FHx9aBXG96z4A?=
X-MS-Exchange-AntiSpam-MessageData-1: 6MV0a98T6wfklg==
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d9ad8db-f265-46ef-5643-08debf66b78c
X-MS-Exchange-CrossTenant-AuthSource: OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 May 2026 22:48:22.0853
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 92RmgxP+MjUfXNBugZs/1oWJlI9cCmYFESRdicop3ZECUuODFsACVW/cIETEF2UO7sYyRKZgPOY3yKWeX+hCJw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWP286MB2972
X-purgate-ID: tlsNG-ebf023/1780267705-417793FF-11D28434/0/0
X-purgate-type: clean
X-purgate-size: 1528
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
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[valinux.co.jp:+];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[taka@valinux.co.jp,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:taka@valinux.co.jp,m:anthony.perard@vates.tech,m:jgross@suse.com,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[taka@valinux.co.jp,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-0.994];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 094CB6182F3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

When creating a domU with vNUMA enabled, the memory allocation
algorithm was dependent on x86. Fix this logic to make it
usable on ARM as well.
---
 tools/libs/light/libxl_vnuma.c | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/tools/libs/light/libxl_vnuma.c b/tools/libs/light/libxl_vnuma.c
index d181574782..70a92a7598 100644
--- a/tools/libs/light/libxl_vnuma.c
+++ b/tools/libs/light/libxl_vnuma.c
@@ -259,8 +259,12 @@ int libxl__vnuma_build_vmemrange_hvm(libxl__gc *gc,
     xen_vmemrange_t *vmemranges;
     int rc;
 
-    /* Derive vmemranges from vnode size and memory hole.
-     *
+    /* Derive vmemranges from vnode size and memory hole. */
+#if defined (__arm__) || defined(__aarch64__)
+    hole_start = GUEST_RAM0_BASE + GUEST_RAM0_SIZE;
+    hole_end = GUEST_RAM1_BASE;
+#else
+    /*
      * Guest physical address space layout:
      * [0, hole_start) [hole_start, hole_end) [hole_end, highmem_end)
      */
@@ -268,10 +272,15 @@ int libxl__vnuma_build_vmemrange_hvm(libxl__gc *gc,
         dom->lowmem_end : dom->mmio_start;
     hole_end = (dom->mmio_start + dom->mmio_size) > (1ULL << 32) ?
         (dom->mmio_start + dom->mmio_size) : (1ULL << 32);
+#endif
 
     assert(state->vmemranges == NULL);
 
+#if defined (__arm__) || defined(__aarch64__)
+    next = GUEST_RAM0_BASE;
+#else
     next = 0;
+#endif
     nr_vmemrange = 0;
     vmemranges = NULL;
     for (nid = 0; nid < b_info->num_vnuma_nodes; nid++) {
-- 
2.43.0


