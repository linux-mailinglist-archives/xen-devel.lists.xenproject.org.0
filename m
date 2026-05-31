Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wHhtNti6HGp+RwkAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 01 Jun 2026 00:48:56 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 894BF6182AC
	for <lists+xen-devel@lfdr.de>; Mon, 01 Jun 2026 00:48:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1323451.1589130 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wTox0-0003vA-Q9; Sun, 31 May 2026 22:48:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1323451.1589130; Sun, 31 May 2026 22:48:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wTox0-0003sD-Jf; Sun, 31 May 2026 22:48:10 +0000
Received: by outflank-mailman (input) for mailman id 1323451;
 Sun, 31 May 2026 22:48:09 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <taka@valinux.co.jp>) id 1wTowx-0003rv-Pc
 for xen-devel@lists.xenproject.org; Sun, 31 May 2026 22:48:09 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wToww-008Rpn-Md
 for xen-devel@lists.xenproject.org; Mon, 01 Jun 2026 00:48:06 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <taka@valinux.co.jp>)
 id 6a1cba94-e002-0a2a0a5209dd-0a2a45059030-10
 for <xen-devel@lists.xenproject.org>; Mon, 01 Jun 2026 00:48:05 +0200
Received: from [40.107.74.122]
 (helo=OS0P286CU010.outbound.protection.outlook.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <taka@valinux.co.jp>)
 id 6a1cbaa2-aaa8-0a2a45050019-286b4a7acd57-3
 for <xen-devel@lists.xenproject.org>; Mon, 01 Jun 2026 00:48:04 +0200
Received: from OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:458::18)
 by TYWP286MB2972.JPNP286.PROD.OUTLOOK.COM (2603:1096:400:2fe::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.16; Sun, 31 May
 2026 22:48:00 +0000
Received: from OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
 ([fe80::c8c9:25cd:8d13:96d6]) by OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
 ([fe80::c8c9:25cd:8d13:96d6%6]) with mapi id 15.21.0071.015; Sun, 31 May 2026
 22:47:59 +0000
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
 b=XdYt07bkS+GkSgBZWuKwNaOYAbd2Bp+93o1+c0n613G7qgjN3zZOzX22trznPS2ss/jx9w65p2aexHSMw6dRLG4bH/dl+HN4R7IvxxZK2wu8fezp0nSflob9EpusYSMpQTxy2+XJor6+2lrsdB/H6LP5wW7emNABmD4XFwgvbPJnoPEzw9IhNY3rXZUFE7sJAEBms0J+7jQWxWjI8OVBTjW7DqLHq+D3uuaKG+HWPOFxnOaH6ylr72FxMfa3ae5CpN8CQXAIBnVm9x95EjK+j0M4iKn09oJTZjSsxmQNKQ+z8Z/XMF5VdwasMQe/dPktz7q1llKNDEokrW7eZtyi0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D3/zwRwToyUW7sgpHxnLbfCUw6Hh/u9E2cfxXK2NMiQ=;
 b=aBqCSQW/q8TiP+B2QBSqGgCSGBJl11aFW5qN4174g4IA4yBmx6HfXv8T3nlDlheIDddXcu8LkM0CA4Nvb5Nr/rKrDD7/GS/8J2EfrW/FjppVf5Z0hfTonhu6SVXbE3cAs7bAniHOdrWd+6fJNhX+4pz9zbBWM1FB2HTsBKVouDNvWyNME1GVhhgzuWRxhIioiMk4vedVwsbrpkBC6+7MFaHCJWGO0PLiFcAxLaR8ksJzCPm0WjfwRMXHnjqqdAC39fsbn2F+w4sanDtgxSSiKWzNs8P7lLgxtFEpEZ6fBhJxPCu8veUaGz8AX7gxB130qgLIedIVXH9nuW8V2oaeNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D3/zwRwToyUW7sgpHxnLbfCUw6Hh/u9E2cfxXK2NMiQ=;
 b=ZKZRfdBG79t7LWvaf7fhtU9cKLtbgMAaB+EZQ0oD3giV8UI4sv4JqUr0eXRHgwKnhMDW3a/ozSjUUEXamPl7XG2hnygeMmjLNT/2wkyzE9gc/Zq0vwx8ZiecRX0Uce6ACafs+66elOm7Vxpv+ETpvtF9NhaxJliw7sPCqhCfFJ4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=valinux.co.jp;
From: Hirokazu Takahashi <taka@valinux.co.jp>
To: xen-devel@lists.xenproject.org
Cc: Hirokazu Takahashi <taka@valinux.co.jp>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>
Subject: [PATCH v2 00/24] Introduce Device Tree based NUMA support for ARM Xen
Date: Mon,  1 Jun 2026 07:47:30 +0900
Message-ID: <20260531224755.9481-1-taka@valinux.co.jp>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TY4P301CA0061.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:36a::17) To OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:604:458::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS9P286MB7222:EE_|TYWP286MB2972:EE_
X-MS-Office365-Filtering-Correlation-Id: 4526f8ed-394c-4db9-cf2d-08debf66aa30
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|1800799024|366016|376014|18002099003|5023799004|6133799003|56012099006;
X-Microsoft-Antispam-Message-Info:
	5ERm2ouvYw7qNi+KOF8dINdVkk9WwbTiQWAcHFbOvJOPn9QCpixQVyLC5x5uiquJZjBpnO5j5LL2PCO1RNxDXusg0LCSLV7FIXPIgRrBamxpKvJWrTlxcs4KlIrgD+iPB6rCpwxhAoAaiUEUdGqeepYH9Dj7lQnekTzB1HhyeDP1M7IlNwITEYKrLnIkYCG/xMRyN/ntH9gxzAcTUyIDphBLxe2F1z+m7+8OdCZrHXkNONwJWZT3HBQV+kPUAmdUFlLJxBJoVrNs22bs/MevH60V+d3tJM6sLn7L0w1zL7SvEoBOKe0tPzp9AeF3VnYamfUdl9O1P6Gdoh0IDXn1OfhDEaBTn7LueOa/CFCSw8TJaO0bIeoYKzaZA/IGftTc+tunxqZgTUeZKCJWqoFU1FvbLtnk0Cm0UsTFe+rbhUVhJtl1hqAO84G0BlRUKSp9jjODlqcobDHNno/fimiKAtfnLWS6tO5GTAIldPBa9cK9kOLPDPoKxfy52KCRlPG2rzs2UbYRCgnPuNoAzUbdz5X+p2T95+MuZXkNWBUEkyC5P9B3qCYJ8MuI7Owl+NbYJKu2ZPlo0c/I3WbWsIgEWM4EMTlrzXv+Te90TbAcU8KKME6WKCiEpn6tL+NWQK3kAZT8k6ZZi5AgmzcrFH1raYvp9b9fsSnn+tuxRPh++mUfGvHLp/8EvI7OONIOOoCPWTSVSisLYvXhNO5mouopvw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(1800799024)(366016)(376014)(18002099003)(5023799004)(6133799003)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?iDoA5OGHPBeV5devIH/ZeIVig3N2R0XlMXvjGHNJ1G9PSe+COAEK02DgNfhg?=
 =?us-ascii?Q?KIUyBiLfD2Jg3heX33pY8fEO+1/KUM3oy6cEuzSHOgLIVcCxHHBVjyolQz/3?=
 =?us-ascii?Q?Yqv9+5FHmJphMjibFNvNkJiPDMNwqzuUccmaJw3wGDJwcj3tWV5oWfRjIdA7?=
 =?us-ascii?Q?NT/h6hFw3dTxRJVOs6ImyIa/Xe25x/wfTrL6BoCAYgr9Pbg4JM/zOvVZSf1H?=
 =?us-ascii?Q?wQ95C6dZd3JE7D36PXDN0Et9BaGv1xfobMTyV6keBr15yrm5tNXjFWA1hT3c?=
 =?us-ascii?Q?7nN8EFk6Bz+NaVShtrlJ0c71oiCl4yJ+uRwNANdm7JRgUwqEhZ3Hx3C3yyW1?=
 =?us-ascii?Q?hZWAYBVFTQpnRC9CXLWn9YNp674ZJmVbK4Arp3vEFrzD3HvdtAgVzaph0nAi?=
 =?us-ascii?Q?54uFC1Ww8ljie/zNVcnH6qeSp0HkxziX0hVPhA+sRm6fylMTL3iH+03IDZKZ?=
 =?us-ascii?Q?b+ofd2WhpS/zLUYgchaCGDkYvb6bl5nEd+38XwOp6N6rJs5O9Wzwg7ZPEGVY?=
 =?us-ascii?Q?Rknmu+dn1B5XIHCvH56L/3KKzf2CyVRnz5wMsfrERe4fm2IFt1iMf7Amr6X6?=
 =?us-ascii?Q?JtTOIBdZKyQcS++YDv6CVLoumSg5OWMF5zdCoM4rBO20bnKe42K2bfGEivCS?=
 =?us-ascii?Q?e4NYJUa8yLyFgn3sG66HTgADhM+lnBenIRkg0fWqHLRAw2Br5dRPJVaJT4Az?=
 =?us-ascii?Q?DxcmYaIA/CFcZv9eZqk4rdJ1PnDeZvlMcaSb4Ss8OnE82hSL5MyzBnbpIp4v?=
 =?us-ascii?Q?o3rwnskj0Pvvk/D9PJ6Mu1FxOVmqj8po2KxqRN4Ggebtj4I8yeqYqV0XQ+gb?=
 =?us-ascii?Q?PgZu/CdlB5huan2lymKoqFS0zM0zLzrNo1xuOQEx0cB9kzT+FRdC7UQIF18i?=
 =?us-ascii?Q?Gn27L4L0YU90YqD5OXkmwEwGXoSdbtld+x4GvgevZzFeAHWQ1oGYEAH/Kdku?=
 =?us-ascii?Q?kHE4rO1rnOULZHM6Qi5TQvpjMj+KQ4zVeb3qmp0c6gOoZ+C3B0uM1lXQps2j?=
 =?us-ascii?Q?3N31awAGQpQonO2roFSOTLHDlkN4LvmNZqETSWZYPw8OgiDz5LIVoWvy4U6V?=
 =?us-ascii?Q?CZe9sXhXo0xThKQY1+X5v8812XEtt4gn30cdkscsg8tCOWZk8KapO6idFVjS?=
 =?us-ascii?Q?fzq++iblFhfJsplAmuASrYLfYx+XDqzgGb56X4Rig5uWU8L5ZHgp4XQDsupK?=
 =?us-ascii?Q?mwnoiI9R53XBCq8R0cACUXsx34Li1wJEFspzI1Y8woYf2UG8hbYPmR2uziTq?=
 =?us-ascii?Q?jcqXUnC2yzIis01JWKDhwu2CQOURQN0/EvOtNW4aKBlxAEWItZczGEM1DWVY?=
 =?us-ascii?Q?3S0vBMfw6fH4qg/BWUCDgvJiidglNQG+W3Qrwun8kxi0hG+7QpkYGnlmZ+aT?=
 =?us-ascii?Q?LtFyMqZYVCuLx3nW4czWkRgSreB85v8UNn+W6PRWcuR7ZLIVQgX4zEHEjknR?=
 =?us-ascii?Q?+hTx07Xgw89eAmzyCAB0qd3RWZdOcKwnGs/ZYHqoLGkbsWqFgL0TBq9ZStha?=
 =?us-ascii?Q?5NbmbnrB+V8t7/5bs8uw47SCldcrxhjQQ0stHx2bn1/mbX85Cf2tJiyZWP9H?=
 =?us-ascii?Q?OHyFzwIRTEFP2nsFgcbwwxeqEQmgkeKvaJe2edpa+3PDEQ0yKUPQFtfos+k2?=
 =?us-ascii?Q?pJgmiP8IrchXUPqT4Xt9PnhTIlDeInqZzDaNKt9XYDsNNTeb/C8ZjO2jJKb/?=
 =?us-ascii?Q?zmLZgspmWPT6B8v1JBR3DLTikqbYGLo6AYzTk8DH3nYQFyuL6Q7h8ezH4TbU?=
 =?us-ascii?Q?J9krKR5MdVoBUQcBTYePM1O8LaDUIxvRuhUjrzwvqNe4kA56TpiqivHms02L?=
X-MS-Exchange-AntiSpam-MessageData-1: 4BanTVy2XASFtA==
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: 4526f8ed-394c-4db9-cf2d-08debf66aa30
X-MS-Exchange-CrossTenant-AuthSource: OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 May 2026 22:47:59.7094
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XNMCoUmsXcKyhfQ0nD4PGIPttmvdu8tT3hEFhWWqX2zsOHNOn0kJY+pUlLCEoOjIZC0QydKQxjbvtnwu9T4Cmg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWP286MB2972
X-purgate-ID: tlsNG-c201ff/1780267685-E1B9E443-26C3DDC8/0/0
X-purgate-type: clean
X-purgate-size: 4675
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
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:taka@valinux.co.jp,m:dpsmith@apertussolutions.com,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[taka@valinux.co.jp,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-0.992];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 894BF6182AC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hello,

Regarding the configuration, we now select CONFIG_ARM_NUMA when
using NUMA on ARM Xen. Eventually, it would be great to have NUMA
enabled by default, just like it is on x86.

I also fixed a bug in the DomU memory layout creation where an x86
dependency was breaking memory allocation for vNUMA nodes. With
this fix, it correctly references the domain's vNUMA node
information and performs NUMA-aware memory allocation.
For now, I've applied a simple fix using #ifdef, but I'm wondering
if we should make this more generic.

Additionally, some code borrowed from the Linux kernel doesn't
strictly follow the Xen coding style. I've left it as-is for now
because I want to avoid creating unnecessary diffs against the
original Linux kernel code.

Changes in v2:
- Fix vNUMA memory allocation algorithm to support ARM
- Allocate vNUMA memory from the associated pNUMA memory
- Include the XSM Policy module size in the required memory
  calculation for Dom0 Bank 0.
- Enforce a minimum chunk size of 4MB during Dom0 memory
  allocation.
- Define the cpu_to_core() and cpu_to_socket() macros in
  cpu-topology.h instead of processor.h, as processor.h should
  strictly focus on processor hardware information.
- Make cpu_nr_siblings() an architecture-specific function.
- Refine the code to conform with the Xen coding style guidelines.

Thanks,
Hirokazu Takahashi

Hirokazu Takahashi (24):
  xen/device-tree: Initial framework for Device Tree NUMA support
  xen/arm: NUMA helper functions via Device Tree helpers
  xen/arm: Introduce CONFIG_DEVICE_TREE_NUMA config option
  xen/arm: Configure NUMA affinity for populated memory banks
  xen/arm: Map populated CPUs to their respective NUMA nodes
  xen/device-tree: Read NUMA node distance from Device Tree
    'distance-map'
  xen/device-tree: Parse 'cpu-map' node for CPU topology exploration
  xen/sched: Link CPU topology to scheduler and display via xl info
  xen/sched: Make cpu_nr_siblings() architecture-specific
  xen/common: Allow building ARM32 Xen with CONFIG_NUMA
  tools/libxl: Fix vNUMA memory allocation algorithm to support ARM
  tools/libs/guest: Allocate vNUMA memory from associated pNUMA nodes
  tools/libxl: Add 'numa-node-id' property to DomU memory nodes
  tools/libxl: Add 'numa-node-id' property to DomU CPU nodes
  tools/libxl: Create 'distance-map' node in DomU Device Tree
  xen/arm: Introduce dom0_nodes boot command option
  xen/arm: Set Domain-0 node affinity from dom0_nodes option
  xen/arm: Reflect physical NUMA node IDs in Dom0 memory DT nodes
  xen/arm: Balance Dom0 vCPU assignment across NUMA nodes
  xen/arm: Export Dom0 vCPU-to-NUMA node mapping to Device Tree
  xen/arm: Generate distance-map node for Dom0 Device Tree
  xen/arm: Balance Dom0 memory allocation across allowed NUMA nodes
  xen/arm: Use dedicated function for Static SHM Device Tree creation
  xen/arm: Support numa and dom0_nodes boot options

 docs/misc/xen-command-line.pandoc     |   9 +-
 tools/libs/guest/xg_dom_arm.c         |  62 +++-
 tools/libs/light/libxl_arm.c          | 103 ++++++-
 tools/libs/light/libxl_vnuma.c        |  13 +-
 xen/arch/arm/Kconfig                  |   9 +
 xen/arch/arm/Makefile                 |   1 +
 xen/arch/arm/domain_build.c           | 428 +++++++++++++++++++-------
 xen/arch/arm/include/asm/numa.h       |  19 ++
 xen/arch/arm/include/asm/processor.h  |   4 -
 xen/arch/arm/numa.c                   |  62 ++++
 xen/arch/arm/setup.c                  |   4 +
 xen/arch/arm/smpboot.c                |  35 ++-
 xen/arch/x86/include/asm/processor.h  |   1 +
 xen/common/Kconfig                    |   7 +
 xen/common/device-tree/Makefile       |   2 +
 xen/common/device-tree/bootinfo-fdt.c |   8 +
 xen/common/device-tree/cpu-topology.c | 360 ++++++++++++++++++++++
 xen/common/device-tree/domain-build.c |  99 +++---
 xen/common/device-tree/numa.c         | 142 +++++++++
 xen/common/numa.c                     |   2 +-
 xen/common/sched/credit2.c            |  22 +-
 xen/common/sysctl.c                   |   1 +
 xen/include/xen/bootinfo.h            |  37 +++
 xen/include/xen/cpu-topology.h        |  53 ++++
 xen/include/xen/dt-numa.h             |  31 ++
 xen/include/xen/fdt-domain-build.h    |   2 +
 26 files changed, 1310 insertions(+), 206 deletions(-)
 create mode 100644 xen/arch/arm/include/asm/numa.h
 create mode 100644 xen/arch/arm/numa.c
 create mode 100644 xen/common/device-tree/cpu-topology.c
 create mode 100644 xen/common/device-tree/numa.c
 create mode 100644 xen/include/xen/cpu-topology.h
 create mode 100644 xen/include/xen/dt-numa.h

-- 
2.43.0


