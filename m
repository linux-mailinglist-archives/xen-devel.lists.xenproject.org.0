Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id hWYWBfJ9R2rNZQAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 03 Jul 2026 11:16:34 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A40B9700856
	for <lists+xen-devel@lfdr.de>; Fri, 03 Jul 2026 11:16:32 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=valinux.co.jp header.s=selector1 header.b=dHV9As1s;
	dmarc=pass (policy=none) header.from=valinux.co.jp;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1353027.1609212 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wfa05-0004E2-QA; Fri, 03 Jul 2026 09:15:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1353027.1609212; Fri, 03 Jul 2026 09:15:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wfa05-0004CQ-ND; Fri, 03 Jul 2026 09:15:57 +0000
Received: by outflank-mailman (input) for mailman id 1353027;
 Fri, 03 Jul 2026 09:15:56 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <taka@valinux.co.jp>) id 1wfa03-0004Bu-00
 for xen-devel@lists.xenproject.org; Fri, 03 Jul 2026 09:15:56 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wfa02-00GN2P-5L
 for xen-devel@lists.xenproject.org; Fri, 03 Jul 2026 11:15:54 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <taka@valinux.co.jp>)
 id 6a477dc6-2eae-0a2a0a5409dd-0a2a450ace40-4
 for <xen-devel@lists.xenproject.org>; Fri, 03 Jul 2026 11:15:53 +0200
Received: from [52.101.125.115]
 (helo=TYVP286CU001.outbound.protection.outlook.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <taka@valinux.co.jp>)
 id 6a477dc6-e40e-0a2a450a0019-34657d733221-3
 for <xen-devel@lists.xenproject.org>; Fri, 03 Jul 2026 11:15:52 +0200
Received: from OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:458::18)
 by TY3P286MB3731.JPNP286.PROD.OUTLOOK.COM (2603:1096:400:3d3::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.10; Fri, 3 Jul
 2026 09:15:47 +0000
Received: from OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
 ([fe80::c8c9:25cd:8d13:96d6]) by OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
 ([fe80::c8c9:25cd:8d13:96d6%6]) with mapi id 15.21.0181.009; Fri, 3 Jul 2026
 09:15:47 +0000
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
 b=Jyh2PoPDSRqn2koWS9MUd/eyGUS008vJmldeA0cV4rSNuJ0rnyMStDBLFmbpdWeoP9rmBfuK7OUgj08g88Q0VV6kExlZrHPjnIpE6Ir/vBI1Cs2CHEGWuzf+3pyG66TEbmRWp9vlLzcuQeq3LYciGQoj9EJjbwW7Fdn3l8L84WyOYsaqAu4YUBV7jOyH15zqoVTEmRtFlBpOU+bCxb8BRBFZ7eQgBXGYvrdjWOCkZx26SQrcqMMEFRdVb8XUChJB+CVYL9KzaoCZFUxbxv6SStlvdfhA9sjsFOYKoBFniJFAOZ69QElTR85rsiUvKZJIXSKHVqnRneudrVH68FGMUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7lJiE4pPeY5QvYLhZ/xDXbCkrelaciRSvhG3kRNYSjE=;
 b=r3MXN5dD/eXYTSnKVhUteth0CJMfWlL/y4yl1kxBmVh0+y2R1RAOGu60y+NZUp0C7EhdMUfqDMIPEp2e9uARLxhI0S/PAepUxRiaesebCQBp59+a7TT5ZG1GD3yeZwm6aGFDS1+U26BR15V9hm+CupzK5ChGAL3sSuk6ScvIIHtw5+QWZFkAe5nCMG6bHzEdcna/N8d3LM+9qKEiy2O6Q4KV7yk0la+lpsC0j4dqrT533g3zWgglbNk2tdB5csfRY+ZWOa7fh2bdt50Sqq5RB9CezP7rnrsPmOagMc8ioMqy/NfzLfJGZigBw6U7i5biyXy/H7DLrC44n3t1+hgqtA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7lJiE4pPeY5QvYLhZ/xDXbCkrelaciRSvhG3kRNYSjE=;
 b=dHV9As1spRToGLO1FE2XskTH6a4cbrP4G7BiBql7o3wWbpHm3/F8mAtoTLyDIJr013CRS9BiPSzDZHrRnzd9AebeA1VnNv3ULzF2qcij4pFuxbpygh/YXS5YsQUpTwbDvehbpiwnAUAaRuzJvXgEgZH6d9WezfN4hbJ9q4HVKs8=
From: Hirokazu Takahashi <taka@valinux.co.jp>
To: xen-devel@lists.xenproject.org
Cc: Hirokazu Takahashi <taka@valinux.co.jp>
Subject: [PATCH v4 0/3] xen/arm: Device Tree based CPU topology support
Date: Fri,  3 Jul 2026 18:15:41 +0900
Message-ID: <20260703091544.183548-1-taka@valinux.co.jp>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TY4P301CA0062.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:36a::13) To OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:604:458::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS9P286MB7222:EE_|TY3P286MB3731:EE_
X-MS-Office365-Filtering-Correlation-Id: 962167c5-cf88-4311-a63e-08ded8e3ab43
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|1800799024|376014|10070799003|3023799007|29003799003|25016099003|6133799003|56012099006|18002099003;
X-Microsoft-Antispam-Message-Info:
	2WbLpQmPlIcSdrY8e4iq/wk/8gF28J/g+1lyLD6WhKVXJJn/crzHozZbCiIcM0rYYPpU5GBoA293xNAxAsCB73EHwXv52vVSu+QtUP98o/Hpo1BvWpo/O5vCXAK0q1PinkXvNF3L9mED7iR5lPkACJO5oZDx4WWAXdkKt87H8JfeyQDBUnSeFA5jT6invQYGNuT6OkuSNvqiY6iF0epk8WoZw6BOfmw7tNutx42pBJeLyk3Yf4X9To46PnhZzk4lKBXL87koDzP0cIIZA1eIb9n5bywqep3XAo8kTNNCfTOOHS5FiXAhEi4MD/AwMHal+JvhaiKnnap6rKAMvx1DYcFKy4fSbe5Zu+i1Ves1lzNDaxFHm5ANX8IV1hdklbldfQG5LFVDM/Ze6nEVkTjYmfhS9+PxNQppl72ZGgGGVTOdEOgF5Cxmc6KiTKI1RuRYwX2SMbLdjBr+sXryLKJ8AqTEzxjmUv0hffRcQL1W4ZXpD9lytvmGlKHc/TWHaMJX7MrKIrCn3mGCCXnDJ6Nt5LgJQRI7frGdi3oFxqgh/789V6mhRjy4XtjDPgKej6qN3KQI+Sr/oT76OjteWlRzlVaiYzHzXLbB62uXNmwiC9l3nzYLkcV39B7UeIJxDnVxdXnpHHzTxgL5DMpesiuKokkMkESIsGqXZl64pcdX5wg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(10070799003)(3023799007)(29003799003)(25016099003)(6133799003)(56012099006)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?yhG50z0vGq5AwkqtgbKBVfjbe00c4a1NVdxbXr88jk6d1qOOjIqgQ4r7jAoB?=
 =?us-ascii?Q?RxeLbSWdThkLybPQqx9ySgCPJHwvgIkpUcrF5+rkh7F48c7Bst30YRIZnSPm?=
 =?us-ascii?Q?9Tv52WKX81lsmiyyM3pBezbKStvg1U0rUA9g98QIjjHKqbtEzfPi8MwU4roc?=
 =?us-ascii?Q?KWxuBFbrcRcWD0ZXOf7mC4keDsJG1NH9rKP91F58G5LC1w4P9RH/W0jxfaGj?=
 =?us-ascii?Q?iymP8hgllkw/0VrgbnfXbl/xm8wm8IxbZyqiJxYpBGkWviys88pIMRwFGZi5?=
 =?us-ascii?Q?oDUwl0Vui3MHF/SQQ4V1SothLCnbL0k1KTVLuOn7j7mY5xya5GNspvVmQUgT?=
 =?us-ascii?Q?+Ob3vof5dd2JLTJAOXRhEq//UNcngz0r7ume2x8r8vnmxnYiQ4a0KRWbuq48?=
 =?us-ascii?Q?/7VH4doRW4mAexPeH9BICRQiIo8kchmgMghBzWKCslchSpUsmJTQmAvAVhh4?=
 =?us-ascii?Q?yo5CSYX7G3hXW97BMJg8a4ZVTw8X1Goyvy6w22bPWxv2vYXeYs/6MCmp44gE?=
 =?us-ascii?Q?gbrdwf1KqojPyEnu4sQkEPNRWtSY8HjgvUhCDIU3HaoMiV2P8wOgrYg9JxMF?=
 =?us-ascii?Q?7R4nmq/+4oZm/n5qV+dQfFxPKOzn7mu3UGvNZIA+Z/pplu0qll6jAqSpQc+M?=
 =?us-ascii?Q?DrSU8ry1l+Xq5QYvG5T20f1DComtdsO1roC8PtscuEJTQJ75s5oX5r9pj3pQ?=
 =?us-ascii?Q?mxBROrAjgGQQ8DC64j4prP02wQoykG0hQMsUB/I21xPZO7SuE2KftWC74hwo?=
 =?us-ascii?Q?jOjdIIIaIXz/voy/sn46M6PXOgJqOh3+MW47M7uy8NmXprF6OZiD/ldx/4LO?=
 =?us-ascii?Q?xFwrZEc965a4axUl6l9rPsoxdNOjUgS19U8i0FsOSwTWIBruJZWdVhOOqMcK?=
 =?us-ascii?Q?zRppmD6LD9pHsqqs8XgHW9VDCz9L+SIXFbcoLKt/Nws5RSkTFpq3G8bSxeN9?=
 =?us-ascii?Q?wTf3cAlAHDUMJw5TU+fxL/sLi7PkJJT8QTcVK/+UGvyzlASkvwY5KFl1WKIx?=
 =?us-ascii?Q?lCJWd7lFEJAXtPoDuGsWtqoMaNz/EkrYbq8fWkL86lBvHAjoYc2T+aDlCApz?=
 =?us-ascii?Q?jaBCpqDICivoHdVYTJUTUt30+3DF8ZEl6fymDxcWooOUoBkc/gNRv+eN09gr?=
 =?us-ascii?Q?ot6NGlprvS6JW2ahV/rUrJGMKQjpSdTA/2xkZruQSeiAYR3RgDEnzoqcGj1n?=
 =?us-ascii?Q?iRdY8SiouXvscpc/iYL0lhdfxOkAUh533dOFft+8AdGCOxOoKiFGJcwT0c7N?=
 =?us-ascii?Q?+Rs+DagdOoDKjGRUF84jm0pzLE0cv0baqxrhK2Bi+ot6izX5hMrvRTTze2m0?=
 =?us-ascii?Q?BDE7N5Ey4P4TwT0MaClW/Do7E72gMB/C05N+UhKVTWc91evjhWPo6nkdN6Nc?=
 =?us-ascii?Q?3VKn0dIwYl5bYotdsuwxEOMRdEC/W4hgghVM+b7tWoDvQYEkLYatYU1QCLQu?=
 =?us-ascii?Q?K2t9H9VFD3GLIc0c3YSLMX3p7+ELFHe5f2Rr4PcZ+UNVD9nfHB5teg2USO0g?=
 =?us-ascii?Q?o9owZrjKoXoxQIksIbIDtIbyJ6y0SWt6f9Zni8UOr5UhaOyx4sM9lOpPufGK?=
 =?us-ascii?Q?KONMoYVeElOViBYKVrzZECk/R3dxRa36o1G+xBIJC9Yk78r2LYcxMZb7z07o?=
 =?us-ascii?Q?wITlUdQ6Bbltz8q9OVcZkyIgt7zA81WdSrJivSkUsEICJdp2PuR+29NGICU2?=
 =?us-ascii?Q?NqB0I+7FmB6le3WIMmzUJ/FpzoYCniVdvTrv7zUWaPBR0yWsU0hjnigKzbjm?=
 =?us-ascii?Q?a2xZqZUL3gBAmJqcgtm/RTUrEqFcJBkKEOegs8Q+TqjSeMMiXeap0mtxebD6?=
X-MS-Exchange-AntiSpam-MessageData-1: pTL2LVlnC+RiBw==
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: 962167c5-cf88-4311-a63e-08ded8e3ab43
X-MS-Exchange-CrossTenant-AuthSource: OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2026 09:15:47.6919
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Edy9msFGwxJJTLewKSBCOus1dNBl1Zv4OKeiEK1Du6k7eaeqvgfj3jGDJIQy5g0Kld/fs6SzrKzvGsJdd4aD3A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3P286MB3731
X-purgate-ID: tlsNG-4011c0/1783070153-CF935DDE-51332E90/0/0
X-purgate-type: clean
X-purgate-size: 5768
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
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[taka@valinux.co.jp,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:taka@valinux.co.jp,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[mailman];
	RCPT_COUNT_TWO(0.00)[2];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[taka@valinux.co.jp,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[valinux.co.jp:+];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A40B9700856

Hello,

This patch series introduces Device-Tree based CPU topology support
for ARM Xen.

This version incorporates the feedback received from Jan on the v3
submission. The main focus of this update includes transitioning 
towards a generic Kconfig structure, untangling header dependencies
and various code cleanups.

Future Work:
 - Support for the "credit2_runqueue=cluster" option.
 - CPU topology support for RISC-V and PPC (once SMP support is available).
 - Topology information generation from the ACPI PPTT.

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

Hirokazu Takahashi (3):
  xen/device-tree: Parse 'cpu-map' node for CPU topology exploration
  xen/sched: Link CPU topology to scheduler
  xen/sched: Make cpu_nr_siblings() architecture-specific

 xen/arch/arm/Kconfig                   |   1 +
 xen/arch/arm/include/asm/processor.h   |   4 -
 xen/arch/arm/smpboot.c                 |  15 +-
 xen/arch/ppc/include/asm/processor.h   |   4 -
 xen/arch/riscv/include/asm/processor.h |   4 -
 xen/arch/x86/include/asm/processor.h   |   1 +
 xen/common/Kconfig                     |  18 ++
 xen/common/Makefile                    |   1 +
 xen/common/cpu-topology.c              |  62 ++++
 xen/common/device-tree/Makefile        |   1 +
 xen/common/device-tree/cpu-topology.c  | 406 +++++++++++++++++++++++++
 xen/common/sched/credit2.c             |  21 +-
 xen/common/sysctl.c                    |   1 +
 xen/drivers/acpi/Kconfig               |   3 +
 xen/drivers/acpi/Makefile              |   1 +
 xen/drivers/acpi/topology.c            |  41 +++
 xen/include/xen/acpi.h                 |   2 +
 xen/include/xen/cpu-topology.h         |  83 +++++
 xen/include/xen/dt-cpu-topology.h      |  29 ++
 19 files changed, 662 insertions(+), 36 deletions(-)
 create mode 100644 xen/common/cpu-topology.c
 create mode 100644 xen/common/device-tree/cpu-topology.c
 create mode 100644 xen/drivers/acpi/topology.c
 create mode 100644 xen/include/xen/cpu-topology.h
 create mode 100644 xen/include/xen/dt-cpu-topology.h

-- 
2.43.0


