Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id W75DLavqQmqeIAoAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 29 Jun 2026 23:59:07 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C0726DEF85
	for <lists+xen-devel@lfdr.de>; Mon, 29 Jun 2026 23:59:07 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=valinux.co.jp header.s=selector1 header.b=Q9RmgmDo;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=valinux.co.jp;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1348266.1606073 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1weJzl-0002kX-Q8; Mon, 29 Jun 2026 21:58:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1348266.1606073; Mon, 29 Jun 2026 21:58:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1weJzl-0002io-NH; Mon, 29 Jun 2026 21:58:25 +0000
Received: by outflank-mailman (input) for mailman id 1348266;
 Mon, 29 Jun 2026 21:58:24 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <taka@valinux.co.jp>) id 1weJzi-0002iR-Qh
 for xen-devel@lists.xenproject.org; Mon, 29 Jun 2026 21:58:24 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1weJzc-001eUD-D1
 for xen-devel@lists.xenproject.org; Mon, 29 Jun 2026 23:58:21 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <taka@valinux.co.jp>)
 id 6a42ea72-e002-0a2a0a5209dd-0a2a4509a9aa-4
 for <xen-devel@lists.xenproject.org>; Mon, 29 Jun 2026 23:58:15 +0200
Received: from [52.101.229.81]
 (helo=TY3P286CU002.outbound.protection.outlook.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <taka@valinux.co.jp>)
 id 6a42ea74-97e6-0a2a45090019-3465e55169fb-3
 for <xen-devel@lists.xenproject.org>; Mon, 29 Jun 2026 23:58:15 +0200
Received: from OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:458::18)
 by OS7P286MB7274.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:439::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.19; Mon, 29 Jun
 2026 21:58:10 +0000
Received: from OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
 ([fe80::c8c9:25cd:8d13:96d6]) by OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
 ([fe80::c8c9:25cd:8d13:96d6%6]) with mapi id 15.21.0159.018; Mon, 29 Jun 2026
 21:58:09 +0000
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
 b=KcFMOqujsJN1v7qsWfOuJJQjKuOj/h782ByHQRaL4i1p1hTrcGglctQNJCrke+kpJoTIjL2fefNQbq68X20cAfvC+avgsglQLlfORZlmjxo9pY5PqxVOtiDywDunCW0qhYm6rwEHdBvSlbYec2JYwlZ7FwHdv5QjtrkOcLjdIzXQW9wPhbhRB2rQ9PqFHutj7VE1mF26DCEIQJtTmXJcx2PgRVyLn/fLNIqw4rlIa1pmDFd+HvJFX8+xLGU9gjusg2YtW0tC2cObQoGNNs+KQi2j1kwzZ3ao1DZjiF2+4flKO4q0ontRRa0DNS1g8E++8PR8CwcaPmj+MTlqOOgYpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8206NVqXCPTNVxkDSfDdIXT3kJSrarb4kGiH6emSyTg=;
 b=PrM+SjEdTb/WCuTqN+LTGEqCDphQLd4h0wCldH+fREo8QVdO+aGRH4DhSQPOMSyLTc39uUkMKzsgYJOdNSyadnQeYjr01z+Hf2eF+ELi20uilTEavD/ik27tLnlI3p9YF8LJ1KGwbHWMbxEiAk6cbh0PwA5xGYImYzvos5f8mTSjAYBtlNc63JuGKPdF2KZvZZgWitRQ1V8TcQ0V6JqyHhWb+qePmpFa3B40BGfM7LuL85PJoAi9tZ5fYS5dqkFSxQhV2rTy4C97ftotRP/Akrh8nQZ0MdA0FcBHqFN4ovTKpizM+Rw/sXhiEo1CVnXHkPJKgLe8Wp2UrcJUulOcMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8206NVqXCPTNVxkDSfDdIXT3kJSrarb4kGiH6emSyTg=;
 b=Q9RmgmDok1wshIQDtJ0qqdqsKMozZYQztfmkwTV2cw+hvkSdSb69acssCKWQMwB2HKJqW1kbt2FXEDCHF6c2Yc9r+EIMAzdIo1TUpX1ARnD+9/Tj1yGIFmjK3f4gkz8WlReoJDR8t9U01RTFlZq9+8DfW8+gVypvrD84sR+3iF0=
From: Hirokazu Takahashi <taka@valinux.co.jp>
To: xen-devel@lists.xenproject.org
Cc: Hirokazu Takahashi <taka@valinux.co.jp>
Subject: [PATCH v3 0/3] xen/arm: Device Tree based CPU topology support
Date: Tue, 30 Jun 2026 06:58:03 +0900
Message-ID: <20260629215806.11610-1-taka@valinux.co.jp>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TY6P301CA0011.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:3be::15) To OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:604:458::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS9P286MB7222:EE_|OS7P286MB7274:EE_
X-MS-Office365-Filtering-Correlation-Id: c6dbf8d2-9384-406f-f8ab-08ded6298205
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|10070799003|376014|366016|6133799003|56012099006|18002099003;
X-Microsoft-Antispam-Message-Info:
	tmUTKxMIpiAey3YjBriK1w42EOyWPYnHeh6ncbOl5Sh7dCm6YaSMNp+4fSd4YZzWqRi/Sk0Fxcx0SdGNoa98EkiyKfrDFlansKDASLlpObkE7lULQbNqMCfX/b1A4FKTFjdOGxSnDc2YanJoLKJ/O3lU25l/F58eZpIP/XboQQvqj8nd+w9ibDa2Z1I6f2+zkXE0zMjMgq9TvphViy96rPtfQ5yGGko1hTr+UYKOpKh0F1OOPnwloRwwtaBdblVney/0ZNVd8h6WYVmWVOLBwQiyUVrU4nmGVuWRU4wIMkHn2qJUlTvb4Cpnpvb8tLeZJG5vDbYKecEasJ/oDCIdxbN202MCzGPUSZf8O+LnOlyxV9q9L1Enh1LrgPdCoI6U1fBHxLSj0+3Hl64vItkMZg8RkOECKQepQAk+8qUIGHEbhQ4DQDw/tiq9GB6oWpe8KlnyxxjcLriM/M/hfgAC/kmEAfxi9m1WEetU6MBjtQife2/SUnHjoOJSp5hi+6BiPsrDqFmRuqNv9S8Mk6PV4o1J4bPNH5DWywrP91VPckeT4uRrWuJVcmq/aA+nCezuCjVbtVgz/VqZWYyiyzwEPaozQSKS4E+ZwwskyJYd3hFmmay6Dn1bJefhNhTGtYy3/7NiRmzOZWD6CcXYTt5G06LTZ2l4sAgfM0fmR+2ntag=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(10070799003)(376014)(366016)(6133799003)(56012099006)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?uTip1aSJjZA9v7K/oLgLbHtWoD7WecL1mF8ewYLVyhnhhqvXyIwiJgkhYNQ6?=
 =?us-ascii?Q?lAXBV3bn6enTKiJoa5278n9QFC0Y7KXwOPhzAsik343Yuxo1XjU0oI5q7a/1?=
 =?us-ascii?Q?sOYebyEFc42sCABqEI8niYtDFQGXFyjBGbxPcgI9jXDNLaNtd8UpeBLOltAB?=
 =?us-ascii?Q?UQWQXLlTs2qZMyWWRY/ehkIFx72YeVNZBoHEay2mK+fRUZAeYaI1j4kz8i1C?=
 =?us-ascii?Q?zWHryNa9NLBX4Y2PqL5lGheGtMGs6EuxbVVy6ZfRL/b8GTELAPkTaBT9eI69?=
 =?us-ascii?Q?38IajF8GHta4fVEOBx+klDGlP3Stt51lNgJg+usJ0c/mtsaUuX5slxB8L4Ai?=
 =?us-ascii?Q?7wnszzWez+I7CDZxDU5SIyE5aOeIzMsaYjB04RFuf3QltsD8Eqi+k2XrTvur?=
 =?us-ascii?Q?9DU+QTpqk/huoIalV1qqh832KD3ieotpNzsQmAqDhI5Gf3hxBG3l06XSnQM8?=
 =?us-ascii?Q?IJWaFmbf/SHw223d7DVEJJdrSRONUIjq/d7VvKj2DXrsUzCXszFwCWgcIEoJ?=
 =?us-ascii?Q?sQQSxklFLvEu8h9htHOPdPwKK4u4SQ8fTonVwUmuVkYcqIusLi+zCNPGP0YA?=
 =?us-ascii?Q?8+V7wHcX9szleH2HFkkAUy2ALTO4mIm7CUouK8u5wOmfaXJIS5oh/NELdy8o?=
 =?us-ascii?Q?YMQ4tWzmhlWSqhGz/y/qt1kDWHbRmjfqDQdE2OP0Id2B+psljwenU1m1YPKH?=
 =?us-ascii?Q?b0WKvfe0SLirulXVAPrfsVG0GVP3ocDDCW84weHDPD7GUiGFzVMLQ/f+PP2d?=
 =?us-ascii?Q?h8kyv4fm9tSdEmcVwvL3ka5fWG9b9sBLSDGMVf5A/FxfEJHda+DYguCgi8UT?=
 =?us-ascii?Q?AKY+16dV+HCdCxk3hy9vNHyTEqeZC3Fom28eCENEoIKeB+OkovP6thLu2Fat?=
 =?us-ascii?Q?lstKF29R0x2H4s5PWhdYvLjfFWi5pKOBQkh8xVFjF2yTtmpXkQ68kRmpnNW6?=
 =?us-ascii?Q?w0FuZl54vfZWM48COj1hut2vmZhMrUOqjm1nheoGk5aQjKbcqAMEAfTzfuas?=
 =?us-ascii?Q?gU8x5hVAH6pXgwJtKpPGPKGzoe9kzIYFL4thsBEyroQ8by0aGzi8RVbl/Frd?=
 =?us-ascii?Q?Iwv/hezLEhafi5JhiucsOvPbPRh5TzzQED0lEhU9YauMEuNq1IVO1NXpEmqi?=
 =?us-ascii?Q?YJRcCp0vmN2ls76o4//0PE/4rvocBC1+l+VLj1/rbkdqLCqnah9CbnGlm4Bb?=
 =?us-ascii?Q?VsEwluLXD3GjX0y8KOADlDP+/+npHT4pYY6D7r76iEhHRdXLTgHlmgBEfpVg?=
 =?us-ascii?Q?jvBhneeq3JGDZWBQbw/ajf5X41Ws3d7N8OizcQopgc+fz4gVQe7CQ7uqaxqt?=
 =?us-ascii?Q?6LqdM9mRCvXXjfeIaeeSzw8TTQ+2uD+XnaUJREkq6lRsw+RBuY8Hyxv2mGrG?=
 =?us-ascii?Q?ER2nn2H8Ln4r75NP4RgntvkRAgIXQIn3WdSlQUySp8rTrCKFwgLoiSKEdDpg?=
 =?us-ascii?Q?seEA9PQGdqnsZTyepaosaip9E89X2fT3X9M3nZvj0qwz8w3gL5ytAql2hgyM?=
 =?us-ascii?Q?a0z6Nt2qZcy9SeUCBCdanxbXBD5eORLFY+IKUqUckW0CAqtTJEVO4WF8seLs?=
 =?us-ascii?Q?YSprKPo0oEXsOg+62YnxVvto6R64xKLa2yPvjlLKFvzfBcJWj9LQibxyESz+?=
 =?us-ascii?Q?+tVSMNG4uzPhrBHjAuoVK4CclO8iyJZxcemlpMS6ojgjJ7H0cjMDyUCEcWgK?=
 =?us-ascii?Q?IMa+D4Hfpt+1KpsBvsBhZEOzDyBA/i4zj2vo3Uz86osuq/2uPZ9lzRLubm1Z?=
 =?us-ascii?Q?Z+1HAaFafs2z3a8OIk19dGfdrWhKIorG+nnPQbql2hUqp+7ap0Wp23rsG9Gf?=
X-MS-Exchange-AntiSpam-MessageData-1: sn8/sx4nEV1tiw==
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: c6dbf8d2-9384-406f-f8ab-08ded6298205
X-MS-Exchange-CrossTenant-AuthSource: OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jun 2026 21:58:09.7576
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0zgdgUO/JYTzyD7ETu80b8MkuWhpChg6Q9VGuFErsIKRUEqS/B7+ru5oRrIMRJC49bIiFRJzrvtFldaJU59myg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS7P286MB7274
X-purgate-ID: tlsNG-bad1c0/1782770295-47B33986-44BD7F28/0/0
X-purgate-type: clean
X-purgate-size: 4710
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
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[taka@valinux.co.jp,xen-devel-bounces@lists.xenproject.org];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:taka@valinux.co.jp,s:lists@lfdr.de];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp];
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
X-Rspamd-Queue-Id: 2C0726DEF85

Hello,

This patch series introduces basic CPU topology support for ARM Xen.

I'm a bit torn on the best way to implement the fallback macros like
cpu_to_socket() in cpu-topology.h when CONFIG_CPU_TOPOLOGY is off.
Specifically, I want non-x86 architectures to share these fallbacks
while keeping x86 from seeing them.

The first approach is simple, but it will break if x86 changes how it
defines these helpers in the future. For example, if it switches from
macros to inline functions:

#ifndef cpu_to_socket
#define cpu_to_socket(cpu) (0)
#endif

The second approach is to make them active only for Device Tree setups
via CONFIG_DEVICE_TREE_PARSE. However, this might not be the "right"
way either, just in case an architecture comes along that doesn't use
DT but still populates the topology table via another method like
ACPI.

#ifdef CONFIG_DEVICE_TREE_PARSE
#define cpu_to_socket(cpu) (0)
#endif /* CONFIG_DEVICE_TREE_PARSE */

Then again, if ARM, RISC-V, and PPC all end up enabling
CONFIG_CPU_TOPOLOGY by default anyway, we won't even need this =n
fallback code. So I'm maybe just overthinking this.

Future Work:
 - Support for the "credit2_runqueue=cluster" option.
 - CPU topology support for RISC-V and PPC (once SMP support is available).
 - Topology information generation from the ACPI PPTT.

Changes in v3:
 - Use (nr_cpu_ids - 1) as the maximum CPU ID here. The fix for the sparse
   map mismatch issue on ARM Xen has been split out into a separate patch.
 - Switch topology sibling masks to cpumask_var_t for dynamic allocation.
 - Allow the system to keep running with a degraded fallback even if
   the topology table allocation fails.
 - Remove the temporary definitions of cpu_to_core() and cpu_to_socket()
   from RISC-V and PPC processor.h.
 - Minimize the use of #ifdef blocks, leveraging compiler Dead Code
   Elimination (DCE) where possible.
 - Clean up the code to follow the Xen coding style. Please let me know
   if I missed any style nits!
 - Verify successful builds across x86, RISC-V, and PPC environments.

Changes in v2:
 - Generate topology information even when ACPI is enabled. Note that
   this is a temporary implementation and doesn't yet parse the PPTT
   (Processor Properties Topology Table).
 - Added support for cpu-map node in Device Tree that doesn't contain
   explicit cluster node definitions.

Changes in v1 from the previous series "Introduce Device Tree based NUMA
support for ARM Xen":

1. Optimized Memory Allocation:
   The series now allocates only the minimum required memory area to manage
   the essential data for the CPUs.

2. Flexible Device Tree Parsing:
   The parsing logic no longer depends on the definition order of the 'cpu'
   nodes and 'cpu-map' nodes in the Device Tree. They can now be read
   correctly even if their orders do not match.

3. CPU Hotplug Readiness:
   To support future CPU hotplug, the system assumes that inactive CPUs are
   also described in the Device Tree. Xen will pre-load and generate the
   topology information for these inactive CPUs during the boot phase so
   it stays available in memory.

Thank you,
Hirokazu Takahashi

Hirokazu Takahashi (3):
  xen/device-tree: Parse 'cpu-map' node for CPU topology exploration
  xen/sched: Link CPU topology to scheduler
  xen/sched: Make cpu_nr_siblings() architecture-specific

 xen/arch/arm/Kconfig                   |  10 +
 xen/arch/arm/include/asm/processor.h   |   4 -
 xen/arch/arm/smpboot.c                 |  29 +-
 xen/arch/ppc/include/asm/processor.h   |   4 -
 xen/arch/riscv/include/asm/processor.h |   4 -
 xen/arch/x86/include/asm/processor.h   |   1 +
 xen/common/Kconfig                     |   8 +
 xen/common/Makefile                    |   1 +
 xen/common/cpu-topology.c              |  59 ++++
 xen/common/device-tree/Makefile        |   1 +
 xen/common/device-tree/cpu-topology.c  | 403 +++++++++++++++++++++++++
 xen/common/sched/credit2.c             |  21 +-
 xen/common/sysctl.c                    |   1 +
 xen/drivers/acpi/Kconfig               |   3 +
 xen/drivers/acpi/Makefile              |   2 +
 xen/drivers/acpi/topology.c            |  41 +++
 xen/include/xen/acpi.h                 |   2 +
 xen/include/xen/cpu-topology.h         |  55 ++++
 xen/include/xen/dt-cpu-topology.h      |  29 ++
 19 files changed, 642 insertions(+), 36 deletions(-)
 create mode 100644 xen/common/cpu-topology.c
 create mode 100644 xen/common/device-tree/cpu-topology.c
 create mode 100644 xen/drivers/acpi/topology.c
 create mode 100644 xen/include/xen/cpu-topology.h
 create mode 100644 xen/include/xen/dt-cpu-topology.h

-- 
2.43.0


