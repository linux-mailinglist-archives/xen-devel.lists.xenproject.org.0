Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id xuh9LFUTVmpNywAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 14 Jul 2026 12:45:41 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CD609753869
	for <lists+xen-devel@lfdr.de>; Tue, 14 Jul 2026 12:45:40 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=valinux.co.jp header.s=selector1 header.b=fvhwsYgD;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=valinux.co.jp;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1362124.1614035 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wjadb-0005Rv-BC; Tue, 14 Jul 2026 10:45:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1362124.1614035; Tue, 14 Jul 2026 10:45:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wjadb-0005QF-8Z; Tue, 14 Jul 2026 10:45:19 +0000
Received: by outflank-mailman (input) for mailman id 1362124;
 Tue, 14 Jul 2026 10:45:18 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <taka@valinux.co.jp>) id 1wjadZ-0005Q9-8W
 for xen-devel@lists.xenproject.org; Tue, 14 Jul 2026 10:45:18 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wjadY-00AIjU-00
 for xen-devel@lists.xenproject.org; Tue, 14 Jul 2026 12:45:16 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <taka@valinux.co.jp>)
 id 6a56132b-5cb7-0a2a0a5109dd-0a2a4504aef0-38
 for <xen-devel@lists.xenproject.org>; Tue, 14 Jul 2026 12:45:15 +0200
Received: from [52.101.229.129]
 (helo=TY3P286CU002.outbound.protection.outlook.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <taka@valinux.co.jp>)
 id 6a561338-b57f-0a2a45040019-3465e581e533-3
 for <xen-devel@lists.xenproject.org>; Tue, 14 Jul 2026 12:45:14 +0200
Received: from OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:458::18)
 by TY6P286MB7347.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:361::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.202.20; Tue, 14 Jul
 2026 10:45:09 +0000
Received: from OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
 ([fe80::c8c9:25cd:8d13:96d6]) by OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
 ([fe80::c8c9:25cd:8d13:96d6%6]) with mapi id 15.21.0202.014; Tue, 14 Jul 2026
 10:45:09 +0000
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
 b=VFJQkijTrVXfdLpvVBjdSs5Lq0wXXHyFswr3v4wK1uRPSPNzfFvDKKXjBVVxfGVHfaFw7M5XdsolSE4hl8spG6ZRBDh1ZRS1cG9ixgFXVPlXyP/5L8mGGw4sgZ7fV++c162RoIbGQKcFBZBoInxuOXCXqUmv472060+X/m/KK+U7ZVWI5kfyqCRWWPTcjJ1ARvKg3qRCjfzntYCYP3hSJJiOgJqwurvmnFDJdKPEr1vaJyrNh+bNGKauSyABQ73QEy59QTHyu/JD3/vtphZn8r0ZDlb+HQgNWnl9KAOvrLBL0pEi6efVIHHT/SsL9rrBfpurVPc/J/K7Sc1heG7dng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=efwH0gTVrUVp+UfbP7PWKyF+d/oXJQh0wkp3IWv4byk=;
 b=qj2XjJaDaQCMhXPdtwHwSMxhwRbTyyWnqNA8/xgyF3qxRbK/xH5yj45q5XIpK6u5F1XOL97K6TmJB57ooT6XUDexc3OwHLpsxIeAriaa6yfLYKHkcHKOjYi2UNsw/UZcoQNNIBRXHsC5vdHvpk5yH5q1h8XI8KwELaA6r6UetIG+i65UDXenFouansHPnHlO5Gh0odYcp+FqVbeB44YL1fn1psFs/iBICzGjXHuh/ag5Wwc1qxheLgI3uOtrioIJUab/RKeg5P8aWV3muLC0aNZ5IPBQnh0qXWNMMLDIa7EdQpZPjxP20WyJoylmbDzipXuXSNSiIzecZTuuyA9Q6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=efwH0gTVrUVp+UfbP7PWKyF+d/oXJQh0wkp3IWv4byk=;
 b=fvhwsYgDYNZF8j5NyHYa13NoltcbbngzmOMTUowGeHn/K0VRSXQHZU3eFsPuUwjB0UErfcJDmRZfAKddLKSFe4KAommg3rJBOZ+Zaf/wb4U1QvOfhO6dq8igWa8ZOPKI5mPuHOk40lwZLDkW+TRwrZ0dqly0D07Dynnm08Y09Og=
From: Hirokazu Takahashi <taka@valinux.co.jp>
To: xen-devel@lists.xenproject.org
Cc: Mykyta_Poturai@epam.com,
	Hirokazu Takahashi <taka@valinux.co.jp>
Subject: [PATCH v6 0/5] xen/acpi,device-tree: Introduce generic CPU topology support for ACPI and DT
Date: Tue, 14 Jul 2026 19:44:40 +0900
Message-ID: <20260714104445.919830-1-taka@valinux.co.jp>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TY4P301CA0046.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:36b::18) To OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:604:458::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS9P286MB7222:EE_|TY6P286MB7347:EE_
X-MS-Office365-Filtering-Correlation-Id: 5edcf241-77ea-455d-017e-08dee194f9b2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|1800799024|376014|10070799003|18002099003|25016099003|56012099006|3023799007|6133799003|29003799003;
X-Microsoft-Antispam-Message-Info:
	dVcIB7hdmrmrOifpwxD+ufe2EjuD+bNkaPM7xXQurGUsTsft+Q3oxFGWxO/nHy5HJp5QaCG+4zDVZr/cVfAxxMc97byyzcn/irEAB4xFePoYNHwd9T6jYKwZHhonOUX4DIeWJ5p2z3vJ3sFP5P3M5bgCR2mHjflwoiohvREXsDNz7lsf9CieVMU/ieJ8CHGMVnjKHoHif1xnhphTuAcz+OqaHm8FtwcQNpCf3uqodc7c1yZrASZ5zvrxme8Ul9SPeLsGer+C1O53Rvi9jH5xtx2nX0wsd+TgdYL+TOVsfxmouR+9XMXgS7v4o4jCbim4Vw9dc3xfuGLzzldIqWSbTCyh7bkyQBHeO82DKBGY3rU8XXVf86D0nh8d38tjM4upWR7vrmAyuf6M1ZoPq1my8UZMnG7IDQkVSVmdrgqBC0FKyvqfkjYRwiISQ93W1XBsSops9mji0weEr2QRi/kOzgLfoK/2qCr02s76a7ZrhEHnxleL4r1H/UdCuFS2ER8dxougoniNNIgXI/UlVKWKQJzVehmC3+gIHGGEf02RblldCdroY6aAVqulLVZyN4qMDiMZxFkrJpxQuwRisLR3kf5uMhfCBFUgHfJQ/zm82QAz5Eqty/vecE+eUWym+GyYB+gvXCne9qq44zFqC0aTLh1iTTqJhJt6LD9FXbw406s=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(1800799024)(376014)(10070799003)(18002099003)(25016099003)(56012099006)(3023799007)(6133799003)(29003799003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?jokSrhbKUbyzS+8VZOp88uUNO2F5hVY2ctiFKR34TKP8EdH73HbQklVmo1bT?=
 =?us-ascii?Q?4wP0L7czFXBtftmrnj/RAZ7DfI3AOB6MBRuLXSDDxy7Vv/55QnO/7p74gFE3?=
 =?us-ascii?Q?Z2cPwyganUBIBfzfgreSvmyr9gGlqk2MPDJM+1RX9uk2eAws0glH+2139RFI?=
 =?us-ascii?Q?4OjLQbmlG8vk3EYFLenqebgJuc4Bn5c8nsdAouoDoAAcjhl67E8eY354ggD3?=
 =?us-ascii?Q?h32LsGi95rBd6JCvClxxCxtYhRDmBRyLccYhpUpIIBnXKEdhTqpJSgzDOth5?=
 =?us-ascii?Q?mLPfpVvfx/3WoTGGSdDLKhAGJTeAe+YMoBCtkJzi0Q9seSFz8/FMx93N91wQ?=
 =?us-ascii?Q?Visz0g2Zmimq3DOnOq0ANS1fAoRDt0wJ754TlSqUKDTtrcWWmnNXSD3Z/hvF?=
 =?us-ascii?Q?U84NOBcr9caM/dLolm06PR6zr6SYl5ehr6I7x+lkffAJSRIlWTFaStFtVpAz?=
 =?us-ascii?Q?gJWz2dJ1Hbw8Qd8pqTr6gVIaXGuLQs9wxFQUBuzEQQl/Sa2ZlpZormmitE5A?=
 =?us-ascii?Q?9AGYcUAQ0nr3MEBTzEz+rJZijkFiacOu8ofU0Dmd04gXq9Lr61eXzVuMVdVo?=
 =?us-ascii?Q?VETiMfrfBSIE45Yr0h6jgCSSlFaY0k8FowMH/Obt/hxBuJIBcsxADXUG495i?=
 =?us-ascii?Q?N3HGa/O+C2uTlTBnc624+lASERm9Te/fqXV90FoeetrV10IKMK0XuJANc5wc?=
 =?us-ascii?Q?1CS3HHZerJ64xAS9qL/9QVrRFhBmexSgH8yaCJbprc4z+Mm6OjuzF1ELBk6U?=
 =?us-ascii?Q?r8BJP3w5aDlmc7xYSild7EwLCZ/ql7c/2e2lzD/aCAnyrBgVCUSU+RGfsut4?=
 =?us-ascii?Q?ZRGzEBWuFqC2pDbmPXexYXzcdN2kHtAfxYMMKvWjRKn3mMNusn/43/+cM9w5?=
 =?us-ascii?Q?OozBPYB4azXqQ8kXDzcJMxWIAYxwkiobhXQBcz/5zMaqX9kkhNV4r9/idqD1?=
 =?us-ascii?Q?Y0hLH1fa0V8z8dUQBofZZWwugTYeHfSUllh30yhw3bREcgXwditzu7Cn26uH?=
 =?us-ascii?Q?zdyBEAVnTEpplAb0YlkQlrLXZ2sAOYrzjdyR4AhucGBzqMYKWfLR2Q5Lfrav?=
 =?us-ascii?Q?67okVdbjLC9P+i+jKLW63OekDl2RiMr+9R3XccBFi/ZOWOuK1J3WN6+utReX?=
 =?us-ascii?Q?UXdlgRti7O7XyAK3Ads81oyZNv4XHyQ3iM4ZGS5oR3SilviUjSW6x9kieamH?=
 =?us-ascii?Q?Cu3MVG5Wq/BgPUfw/yPy+1PCvKFH6UvGNzIJXHmZK+iKGWJYeCdjaZ0PRdg7?=
 =?us-ascii?Q?IEL/0WRZ+fOI0r5TONH+wVR6uFbdSxeJJ2nFPkBs3gjtYfbBdotUdMWUzQtB?=
 =?us-ascii?Q?b33PHq6R/ahG0BfLhrNO6tOeZk1Q1tnrsgVebdgQEvDtYsMxvjwBHX2Uuwlw?=
 =?us-ascii?Q?NIQbf8OdvhXKOYRcSxquSzc0mymmmFyjEEwNyij+djzc7u57eYBTrcM6UacK?=
 =?us-ascii?Q?x68bFkbqEom96XBqOqEaOjzklVRnEXA9eZhebKTTnq/RwQwJUWaEaubYTG//?=
 =?us-ascii?Q?4MXmP2shgAzYgu/HnLFpEEb1taQfaJXE8ilBwymzrVPJaC3hQU6Xb6iBAidl?=
 =?us-ascii?Q?hiDyLac0P/6GNz6PUFzaCELuCHW+7KuXqv/rSxDzBahr6GltSFLOdZlZdODj?=
 =?us-ascii?Q?866ojFU93RwEUTlcIaMyPJTO4f8YiHZiIaAxvILFOy2soI3Z71ptqlczvGbF?=
 =?us-ascii?Q?IIzO7fuIT0akY7OqpekxxHo9KYX72rvHn8HqWWmEssBrur+vMQpP2+IqEy/5?=
 =?us-ascii?Q?zxJXFNIAuBIKbIyZUAs1J23h93+Shf5FjZQApqGiQpNw4155432JkFc7Viy8?=
X-MS-Exchange-AntiSpam-MessageData-1: 0yqHNtw5Q3oaug==
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: 5edcf241-77ea-455d-017e-08dee194f9b2
X-MS-Exchange-CrossTenant-AuthSource: OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jul 2026 10:45:09.4457
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2Hjme5Be8unO8QoJi7t1Y4l4pMDiVjbvArwgpic1aUN6/NJWUnpdBgDEyVJOEWhKDgLW+rQlkweCI1uNkeNG9Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY6P286MB7347
X-purgate-ID: tlsNG-ebf023/1784025915-C22D4B50-B7AFF815/0/0
X-purgate-type: clean
X-purgate-size: 8895
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.69 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[valinux.co.jp,none];
	R_DKIM_ALLOW(-0.20)[valinux.co.jp:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:Mykyta_Poturai@epam.com,m:taka@valinux.co.jp,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[taka@valinux.co.jp,xen-devel-bounces@lists.xenproject.org];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_THREE(0.00)[3];
	FORGED_SENDER_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[valinux.co.jp:from_mime,valinux.co.jp:dkim,valinux.co.jp:mid,lists.xenproject.org:from_smtp,lists.xenproject.org:helo,lists.xenproject.org:rdns];
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
X-Rspamd-Queue-Id: CD609753869

Hello,

This patch series integrates CPU topology discovery into the Xen hypervisor
for both ACPI and Device Tree platforms. The primary goal is to make
accurate threading and socket information available to the Xen scheduler.

Changes in v6:
 - Renamed the series subject from "xen/arm: Device Tree based CPU topology
   support" to reflect the inclusion of generic ACPI PPTT topology parsing.

 - Infrastructure & Kconfig:
   * Updated Kconfig to make both DT_CPU_TOPOLOGY and ACPI_CPU_TOPOLOGY
     select GENERIC_CPU_TOPOLOGY.
   * Ensured that if topology parsing from either DT or ACPI PPTT fails, the
     CPU topology table is freed to fall back to the non-topology behavior.
   * Moved the `cpu_topology` definition to `cpu.c` so that variables and
     functions in `cpu-topology.c` can be completely freed after Xen init.

 - Topology Logic (DT / ACPI):
   * Set the cluster ID to 0 when the cluster definition is missing from the
     Device Tree `cpu-map` node.
   * Handled cases where cluster info is missing upon reaching a physical
     package in the PPTT parser by assuming one cluster per socket.
   * Split out the import of ACPI PPTT definitions from the Linux kernel
     (including unused definitions) into a separate standalone patch.

 - Robustness & Safety:
   * Avoided assuming `np` becomes NULL after exiting `dt_for_each_child_node()`;
     explicitly return NULL instead.
   * Added bounds-checking `ASSERT`s for values returned by `cpumask_first()`.
   * Added explicit braces `{}` to nested `if` statements to clarify `else`
     scoping and maintain style symmetry.
   * Enforced an upper limit on the PPTT parsing loop iterations to prevent
     infinite loops on corrupted tables.
   * Treat the absence of a physical package node definition in PPTT as a
     parsing error.

 - Optimization & Efficiency:
   * Optimized `setup_siblings_masks()` to eliminate redundant loop iterations.
   * Dynamically allocate the temporary data storage used during ACPI PPTT
     parsing.

 - Code Cleanup & Refactoring:
   * Replaced the `invalid_topo_id` constant with the `INVALID_TOPO_ID` macro.
   * Initialized all members of the `cpu_map` array with `INVALID_TOPO_ID`.
   * Added a blank line between `<xen/...>` and `<asm/...>` header groups.
   * Reordered `#ifdef` blocks to prioritize generic logic over architecture-
     specific ones.
   * Corrected code indentation.
   * Applied the `static` specifier to file-local data structures and functions.
   * Minimized the use of fixed-width `uint32_t` types, restricting its use only
     where strictly required by the 32-bit ACPI ID specification.
   * Declared `map_cpu_acpiid[]` as static and introduced the helper function
     `acpi_map_cpu_acpiid()` for managed access.
   * Renamed local variables to more intuitive names.
   * Simplified the implementation of `get_logical_id()`.
   * Refactored PPTT parsing to reduce type casting by using `container_of()`
     and switching from `char *` to `void *` pointers.
   * Removed redundant error checks.
   * Cleaned up unused variables and eliminated debug print statements.

Changes in v5:
 - Extracted CPU topology information from the ACPI PPTT.
 - Corrected the erroneous use of CONFIG_CPU_TOPOLOGY to
   CONFIG_GENERIC_CPU_TOPOLOGY.

Changes in v4:
 - Only display the CPU topology configuration prompt in common/Kconfig
   if the architecture defines HAS_GENERIC_CPU_TOPOLOGY.
 - Move the definition of the global 'cpu_topology' pointer to
   common/cpu-topology.c.
 - Update the Makefile to explicitly build objects as .init.o when all
   functions and data within a file are annotated with __init/__initdata,
   ensuring their memory is reclaimed after system initialization.
 - Add an error log in the CPU-to-node mapping function for out-of-bounds
   cases.
 - Use ARRAY_SIZE() instead of raw macros when guarding array accesses.
 - Rename variables and functions to avoid ambiguous or misleading terms:
   - Avoid 'cpuid' to prevent confusion with x86 CPUID features/instructions.
   - Avoid 'node' where it could be confused with a NUMA node, explicitly
     renaming them to clarify they refer to a Device Tree node.
 - Move local variable declarations into the narrowest possible scope.
 - Replace the unsupported "%pOF" printk format specifier with "%s" and
   explicit node name retrieval.
 - Remove #include <dt-cpu-topology.h> from cpu-topology.h, and ensure
   the header directly includes only what its definitions require.
 - Remove #include <xen/device_tree.h> from dt-cpu-topology.h, replacing
   it with a forward declaration of 'struct dt_device_node'.
 - Use 'const' qualifiers for pointer declarations where the pointed-to
   structure is not modified.
 - Explicitly #include <asm/processor.h> in cpu-topology.h to guarantee
   that arch-specific definitions of cpu_to_core() and cpu_to_socket()
   take precedence over the generic fallbacks.
 - Introduce inline initialization functions for cpu_sibling_mask and
   cpu_core_mask in cpu-topology.h, providing separate variants for both
   when CONFIG_GENERIC_CPU_TOPOLOGY is enabled and disabled.

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

Hirokazu Takahashi (5):
  xen/device-tree: Parse 'cpu-map' node for CPU topology exploration
  xen/sched: Link CPU topology to scheduler
  xen/sched: Make cpu_nr_siblings() architecture-specific
  xen/acpi: Import PPTT definitions from Linux
  xen/acpi: Parse PPTT to initialize CPU topology

 xen/arch/arm/Kconfig                   |   1 +
 xen/arch/arm/acpi/boot.c               |   2 +
 xen/arch/arm/include/asm/acpi.h        |   2 +
 xen/arch/arm/include/asm/processor.h   |   4 -
 xen/arch/arm/smpboot.c                 |  15 +-
 xen/arch/ppc/include/asm/processor.h   |   4 -
 xen/arch/riscv/include/asm/processor.h |   4 -
 xen/arch/x86/include/asm/processor.h   |   1 +
 xen/common/Kconfig                     |  22 ++
 xen/common/Makefile                    |   1 +
 xen/common/cpu-topology.c              |  65 ++++
 xen/common/cpu.c                       |   5 +
 xen/common/device-tree/Makefile        |   1 +
 xen/common/device-tree/cpu-topology.c  | 408 +++++++++++++++++++++++++
 xen/common/sched/credit2.c             |  21 +-
 xen/common/sysctl.c                    |   1 +
 xen/drivers/acpi/Kconfig               |   3 +
 xen/drivers/acpi/Makefile              |   1 +
 xen/drivers/acpi/topology.c            | 269 ++++++++++++++++
 xen/include/acpi/actbl2.h              | 113 +++++++
 xen/include/xen/acpi.h                 |  15 +
 xen/include/xen/cpu-topology.h         |  83 +++++
 xen/include/xen/dt-cpu-topology.h      |  35 +++
 23 files changed, 1040 insertions(+), 36 deletions(-)
 create mode 100644 xen/common/cpu-topology.c
 create mode 100644 xen/common/device-tree/cpu-topology.c
 create mode 100644 xen/drivers/acpi/topology.c
 create mode 100644 xen/include/xen/cpu-topology.h
 create mode 100644 xen/include/xen/dt-cpu-topology.h

-- 
2.43.0


