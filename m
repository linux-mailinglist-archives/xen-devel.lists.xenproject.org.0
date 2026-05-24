Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KFwiGEFAEmo+xAYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Sun, 24 May 2026 02:03:13 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 182D45C0ECA
	for <lists+xen-devel@lfdr.de>; Sun, 24 May 2026 02:03:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1318178.1586552 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wQwIf-0002Il-52; Sun, 24 May 2026 00:02:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1318178.1586552; Sun, 24 May 2026 00:02:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wQwIf-0002GU-1S; Sun, 24 May 2026 00:02:37 +0000
Received: by outflank-mailman (input) for mailman id 1318178;
 Sun, 24 May 2026 00:02:36 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <taka@valinux.co.jp>) id 1wQwId-0002Fe-RN
 for xen-devel@lists.xenproject.org; Sun, 24 May 2026 00:02:35 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wQwId-005yCJ-7e
 for xen-devel@lists.xenproject.org; Sun, 24 May 2026 02:02:35 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <taka@valinux.co.jp>)
 id 6a123fb2-e002-0a2a0a5209dd-0a2a4502816c-36
 for <xen-devel@lists.xenproject.org>; Sun, 24 May 2026 02:02:35 +0200
Received: from [52.101.125.80]
 (helo=TYVP286CU001.outbound.protection.outlook.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <taka@valinux.co.jp>)
 id 6a124018-af86-0a2a45020019-34657d50d7f2-3
 for <xen-devel@lists.xenproject.org>; Sun, 24 May 2026 02:02:34 +0200
Received: from OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:458::18)
 by OS9P286MB4275.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:2ca::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.17; Sun, 24 May
 2026 00:02:31 +0000
Received: from OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
 ([fe80::c8c9:25cd:8d13:96d6]) by OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
 ([fe80::c8c9:25cd:8d13:96d6%6]) with mapi id 15.21.0048.016; Sun, 24 May 2026
 00:02:31 +0000
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
 b=XKvETBGUOdA6bhyCSqI5xwvCDstWAXnLlgT3e3fl/AENn8pLfofdz4Rx0HzyN7b+z0BPPG1+3pyPGxdEc1fOtLuFtHro5eOJknm1yoSfBLe7CS1bv/osM5QoFYMSqJmKiio4m5DHtUTIOi8RUchxde8boaSHktb2a4j8LdosAC0vmPr5vKsGNGQawa+h628M11oLKowvU2bqSJz57m+rNiJ4CmqyYkX84lp23rwrQ0gIb5byhrSYfNB/p8hzrUwcdVKIXYL7xPXFpo8HRAvzTviS0IIv2Meby023AR83SeSg+cEXVAl6Tx/qfOb8tcS5mix5XtXq+ZHrXwTPPlIPkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g2lrdoLMqmg98r42qC1DD889Q8lEgAE6Jpi+XHGPJaI=;
 b=hZai01O1ZyxiyrZbVlD2mhixtjb6F1Czlbs57qMnO0O/NNzKdgtMstXG0MX9Bmj8ONEWtQhdVQ6L6NtcbAL7Upd9sbhbf1WcIA00mHmVCmnBVShQWUaJX6uZ8tQtlOvhVFI+FNzqV3isH5pNxZ1adbsBfPSsflI4hgpCkcW/FKq7bTPFtH4pI2XeXl869YrqmEcFHPOJr9o0Iz8N17wThE7dlZatZH1VH0o1gtn0ISFrsXeN+uXpuXSJZrlVm9dmbZKDfZZBwozkvzQJNC0jWfT0wC7JGwLLmG+JQBRcPjH4BP+Ets/t50MXV8okFGuF8A6kMi1ZkXKqN8fFYPda0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g2lrdoLMqmg98r42qC1DD889Q8lEgAE6Jpi+XHGPJaI=;
 b=LFf4VD+JS5vierFwmUFtVljA4+jGx7CgZJczyqNWerYq16LADBt14aaYwHwswEmuynn9oeDFICSpOsay0OHTuo6vIyNjAA1CZEIrl2d0v1wmKRYtXRdUG+tOyJ5SWR/93M6Z10hoq0pkB4/knDWwwHP0VaIHfSDJYKOFvGikOU8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=valinux.co.jp;
From: Hirokazu Takahashi <taka@valinux.co.jp>
To: xen-devel@lists.xenproject.org
Cc: andrew.cooper3@citrix.com,
	anthony.perard@vates.tech,
	michal.orzel@amd.com,
	jbeulich@suse.com,
	julien@xen.org,
	roger.pau@citrix.com,
	sstabellini@kernel.org,
	jgross@suse.com,
	bertrand.marquis@arm.com,
	Volodymyr_Babchuk@epam.com,
	dfaggioli@suse.com,
	gwd@xenproject.org,
	Hirokazu Takahashi <taka@valinux.co.jp>
Subject: [PATCH 03/21] xen/arm: Introduce CONFIG_DEVICE_TREE_NUMA config option
Date: Sun, 24 May 2026 09:01:51 +0900
Message-ID: <20260524000209.292370-4-taka@valinux.co.jp>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260524000209.292370-1-taka@valinux.co.jp>
References: <20260524000209.292370-1-taka@valinux.co.jp>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCP286CA0365.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:79::12) To OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:604:458::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS9P286MB7222:EE_|OS9P286MB4275:EE_
X-MS-Office365-Filtering-Correlation-Id: 772accbe-66a6-464d-35c5-08deb927c025
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|10070799003|7416014|376014|366016|22082099003|18002099003|56012099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	TzLRG3tWDA1C9A5OKhu85mUBk+EYW7kCIwv8jxhf+2YiTuFGDZTfWHrwef3vzsmifIeb0bBoSos2ceQ1zsecFRA2/G578wc9tpxADPyg8EOELaax9fiB+wF7WUwYSKTyIlLNMoOpTl+xNALenOypxeouJdm3IcnsTOSw2JyUnNVweTOtdYndgv7iXwSZi4Zj0DXQvYr81iS3UPL6HkMx8y6BhV1vcJexJrlaaWGoAZ/k2H3Hs7fWUQUHQYvD72zv0S0q1Aqp5sgxVnKR+CDquYEj+tYrQvB8u95ZKDmbwcskq7qZZOaPxAdO+T5kJQX6VvGLQzLRqN9ZBARvJgJNuzLpbPvq4mbE2B6pEykZClADNq6os8btZlk0fmpkUt5r2j1dJUDY8UDIX2zF39kmYWqI0d8YadtxZp+qLHA/isuEj0/1zJlRIb6JOHD1wCjNNsPTyV0DUv3a2qGo96psD6qsoL12ZYRvil1K5R5TTfPUWpF/lnLhSk1Gr2wHCKaO2HEeL/FrHPpiOAcKQ51L+JXpkXmMdqTdPltMLZuFJTkpUWio7r2kFjqdVnyzw/vEbS/IlvpZclLX59WlAKLClTgES1kUD1Pvupgm4coitE9w3YigDZoVwG2hBAfoaTECbOJkCCRd9HvUibcWzZ2N2zE6rT4amzbVLpkQe6QmbdpTpW2TOurG2s5eCymrUNfx
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(10070799003)(7416014)(376014)(366016)(22082099003)(18002099003)(56012099003)(6133799003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?t6hx4cIPOK7Mqu4fV1o/Wp86HgVmM9BDZuM/HTzIlvKg4cOHqVDOKzjvEZRK?=
 =?us-ascii?Q?ECp0jnK5uhz2zcMLCxjTV57WqToy1uKwapnfrUZEarOn1W1SQBIPdxDo9DwE?=
 =?us-ascii?Q?rIdiaXn5p4Qjdqro9f1edY0vtC5Y9EtIMY4Yc60mKFK8Ae6RcvSPt3BLjl6s?=
 =?us-ascii?Q?2ZHbeJWrj5UYubpHeZzzA//0VLzqLh+VuT6KiGONWxMgOJf4Rs8W76pYkJnn?=
 =?us-ascii?Q?G0ZC7MLQfXsSyN7XHCYQvWr4jGQKw9uqHNnbXtaMLaXYlCuHUBXJHbSTHQmu?=
 =?us-ascii?Q?FMzk9+TdMEqCli8zM9KBfENNLjG1zS4QwM7+TDl3IP62HTV8aFbcsVWAApxL?=
 =?us-ascii?Q?Gz1l8BJSafWTIydqwWkWTB6+88wsUFYEYpEU92R/SWdqMKSMb9woLmyegZxM?=
 =?us-ascii?Q?dyowR/9txCAY+yx70ca2YJFt5V0I+zZkOg9te4mglbrqWYhMbWaiVH47tKlc?=
 =?us-ascii?Q?P//37bIXIgSxbKx8hetpvqsZB4iIavR33OKS5eEWglFEJ6MOi/b0W0i9WEye?=
 =?us-ascii?Q?snywolB/baGTSvHv++hOuqFweGcVaSBWFEPt3EEWWNFVGLrRixOjliPB8/9R?=
 =?us-ascii?Q?gR3SfIXOj20fZrzTH+2kXaXpUEZ6OvV9mifJ9+U7v8pcWHMXG9m4Op2/wWNj?=
 =?us-ascii?Q?wOvjJfTBn8mcLH9gmvwmUmbZMWE/WByaW3xIkm8vnN3JNC53QCUhsVJcQtHY?=
 =?us-ascii?Q?0wlQJHRkeWyrtoQWXczwlIocIPppWL103xVZz8Gw2/S33OKUXNjfu2WpPjS8?=
 =?us-ascii?Q?itP3o6Cl9BNFXGmRT2XQFHomLlDOlgkwwJnsiHCj1ToYvz47gcE7NKVTHIn1?=
 =?us-ascii?Q?QiYI1YfZ2pfXF+4UkdLyrw4xKGCNRm5Swf93N/mxtV4LYlBtbUTw/OEGfUcj?=
 =?us-ascii?Q?4R/ZUN09zOEGdEmb9//eCjzPShMcjQNu05Ow6WYLB1fEj79uCoTgqXDzEBFZ?=
 =?us-ascii?Q?d68eE5jhCgzP3FiWrpqQ0DoZcqYymZKpKZ9Xbc14CXWP6354xN2OzG41quRa?=
 =?us-ascii?Q?HrWjpTd4vbQN10CPG9f48cJiAjtfZAxlk8YZHFVnHepWP1eO7xq8H9isH3bu?=
 =?us-ascii?Q?Murr2f/65ILh2sXzC9+Utyk7AskO7W4IxNE3uQp0PXmIm/8rpjjdCtiL0+sB?=
 =?us-ascii?Q?dfzrnTEv/hJ/kC2J08/c7wqSEIFYA/zASTFvty46GdxiQurKOYJ8GIN6GLvG?=
 =?us-ascii?Q?O8YOpN5gomTdirItHVXSAXu276xFduebBqT140XNBYdxyzxo4C3xWbpR5kjD?=
 =?us-ascii?Q?ff2dEPwG2ukDQICfDP/Z0e7Tkp969FwJf1Nh5le1u8HytX05N94lcwSyLLik?=
 =?us-ascii?Q?AwCU4shjaIgSWjHaM1N+VU9ie4vP+0rUFy3qnY9DmlyFRx1A0ckusbiGRGa9?=
 =?us-ascii?Q?U8v/Erw4QYpHH08BWoq42aZdXYXh5diMVsal08qtcJcSieM+Ntz3YRbRuqgJ?=
 =?us-ascii?Q?xr/soGAEp0JMXF1MjLIJI0N+/zMfLQUC8AoemSCqgQu1BMJm/pNSzIOAppGv?=
 =?us-ascii?Q?qeUk3nZ8kdZQesazuvgUwgPN3pRJqrj5r7/FbBwSVbCDh1VB+ZTDLGDsTyeH?=
 =?us-ascii?Q?42qXgvYh3Fx4YAKsXID7I3/1EI7ZrHjw8wFeDPuH9/h7/GWNvZYKx+9fU/yF?=
 =?us-ascii?Q?cvWU5ab9kZ0SkuvYy0x/WkYINIZixxO3eEJQCiDTRH6wJUKfD4QqCnRWrjlP?=
 =?us-ascii?Q?KIoY5AeYDsz6zCXdRIsEJJDD6sGvul1Mnrmj979AocFYSuepd7D5vZs75VDR?=
 =?us-ascii?Q?4c9HK4KiWTfXqx+xLdFhHNA6eELnzBlV6I2lIQYIj8VOweZP9gNFJnfbvsrv?=
X-MS-Exchange-AntiSpam-MessageData-1: Z8RtTEC6NNuhXw==
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: 772accbe-66a6-464d-35c5-08deb927c025
X-MS-Exchange-CrossTenant-AuthSource: OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 May 2026 00:02:31.2622
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3dUUbETlsdEPM0nTUL2SSGgqRYGXYhWPUhMurcmyBVhRIavu0ymWhOM1OympOn5HrAxOenxHJ0xjuNXmAGYUFQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS9P286MB4275
X-purgate-ID: tlsNG-720697/1779580955-83B60161-E0218547/0/0
X-purgate-type: clean
X-purgate-size: 2348
X-Spamd-Result: default: False [1.32 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	DMARC_POLICY_ALLOW(-0.50)[valinux.co.jp,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[valinux.co.jp:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:jgross@suse.com,m:bertrand.marquis@arm.com,m:Volodymyr_Babchuk@epam.com,m:dfaggioli@suse.com,m:gwd@xenproject.org,m:taka@valinux.co.jp,s:lists@lfdr.de];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[taka@valinux.co.jp,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[valinux.co.jp:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[taka@valinux.co.jp,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-0.997];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 182D45C0ECA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Introduce the CONFIG_DEVICE_TREE_NUMA configuration option for
Device Tree-based NUMA support. Selecting CONFIG_DEVICE_TREE_NUMA
automatically selects CONFIG_NUMA. While this option is currently
restricted to the ARM architecture, it is designed to be selectable
for RISC-V and PPC in the future. This patch also includes the
necessary compilation fixes required when building with CONFIG_NUMA,
and creates a single fake NUMA node to ensure Xen can boot
successfully at this stage.
---
 xen/arch/arm/setup.c   | 4 ++++
 xen/arch/arm/smpboot.c | 2 ++
 xen/common/Kconfig     | 9 +++++++++
 3 files changed, 15 insertions(+)

diff --git a/xen/arch/arm/setup.c b/xen/arch/arm/setup.c
index 6310a47d68..c0202d9ff6 100644
--- a/xen/arch/arm/setup.c
+++ b/xen/arch/arm/setup.c
@@ -351,6 +351,10 @@ void asmlinkage __init noreturn start_xen(unsigned long fdt_paddr)
     /* Parse the ACPI tables for possible boot-time configuration */
     acpi_boot_table_init();
 
+#ifdef CONFIG_NUMA
+    numa_initmem_init(0x0UL, 0x1UL << (PADDR_BITS - 12));
+#endif /* CONFIG_NUMA */
+
     end_boot_allocator();
 
     /*
diff --git a/xen/arch/arm/smpboot.c b/xen/arch/arm/smpboot.c
index 7f3cfa812e..d1651fe7dd 100644
--- a/xen/arch/arm/smpboot.c
+++ b/xen/arch/arm/smpboot.c
@@ -47,8 +47,10 @@ integer_param("maxcpus", max_cpus);
 /* CPU logical map: map xen cpuid to an MPIDR */
 register_t __cpu_logical_map[NR_CPUS] = { [0 ... NR_CPUS-1] = MPIDR_INVALID };
 
+#ifndef CONFIG_NUMA
 /* Fake one node for now. See also xen/numa.h */
 nodemask_t __read_mostly node_online_map = { { [0] = 1UL } };
+#endif /* CONFIG_NUMA */
 
 /* Xen stack for bringing up the first CPU. */
 static unsigned char __initdata cpu0_boot_stack[STACK_SIZE]
diff --git a/xen/common/Kconfig b/xen/common/Kconfig
index 5ff71480ee..2365b421bf 100644
--- a/xen/common/Kconfig
+++ b/xen/common/Kconfig
@@ -188,6 +188,15 @@ config VM_EVENT
 config NEEDS_LIBELF
 	bool
 
+config DEVICE_TREE_NUMA
+	bool "Device tree based NUMA support (UNSUPPORTED)" if UNSUPPORTED && ARM
+	depends on HAS_DEVICE_TREE_DISCOVERY
+	select NUMA
+	help
+	  Device tree based NUMA support. The "numa-node-id" property in
+	  the CPU and memory nodes of a Device Tree defines the NUMA node
+	  to which they belong.
+
 config NUMA
 	bool
 
-- 
2.43.0


