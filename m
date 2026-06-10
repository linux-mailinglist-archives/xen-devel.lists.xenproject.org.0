Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 3cJhMQlHKWrsTQMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 10 Jun 2026 13:14:17 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BB609668A08
	for <lists+xen-devel@lfdr.de>; Wed, 10 Jun 2026 13:14:16 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=valinux.co.jp header.s=selector1 header.b=W8L5pbFH;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=valinux.co.jp;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1334125.1597225 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wXGsI-0006IC-BO; Wed, 10 Jun 2026 11:13:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1334125.1597225; Wed, 10 Jun 2026 11:13:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wXGsI-0006DD-75; Wed, 10 Jun 2026 11:13:34 +0000
Received: by outflank-mailman (input) for mailman id 1334125;
 Wed, 10 Jun 2026 11:13:31 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <taka@valinux.co.jp>) id 1wXGsE-00069r-RD
 for xen-devel@lists.xenproject.org; Wed, 10 Jun 2026 11:13:31 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wXGsE-008xp6-0R
 for xen-devel@lists.xenproject.org; Wed, 10 Jun 2026 13:13:30 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <taka@valinux.co.jp>)
 id 6a2946c3-5cb7-0a2a0a5109dd-0a2a4508a5de-46
 for <xen-devel@lists.xenproject.org>; Wed, 10 Jun 2026 13:13:29 +0200
Received: from [52.101.229.134]
 (helo=TY3P286CU002.outbound.protection.outlook.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <taka@valinux.co.jp>)
 id 6a2946d6-63b5-0a2a45080019-3465e5868771-3
 for <xen-devel@lists.xenproject.org>; Wed, 10 Jun 2026 13:13:28 +0200
Received: from OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:458::18)
 by OS7P286MB6556.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:432::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.11; Wed, 10 Jun
 2026 11:13:23 +0000
Received: from OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
 ([fe80::c8c9:25cd:8d13:96d6]) by OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
 ([fe80::c8c9:25cd:8d13:96d6%6]) with mapi id 15.21.0113.011; Wed, 10 Jun 2026
 11:13:23 +0000
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
 b=vmq+4GodjlAkpGOvrd5GTLBYqKbNHcc317EsZw6oMZkPbuxWO9bgTxSW/MfkZcb9pDQiqVnb1OVn47tsDKgRlVdLRLOUPJ0u37oTu/W8GHGldMSw64xOOzR+BtCc6+wpkfq7/D3vWa5Ys6oIxOWi1VL0SbqioTPKnE0alV6fRpr6iz1HYfqs7+LXh0DPRGLUc6AsaS7eYG+/SY/QZTS7h7zg2d7qs+4LeqfvVWr6LOQO2P6gRS2kC5pZw47T88GuwkZVq25MxMdzv6Lbkey5pGkyipi7obKB0NXtaPnDOTSNAo2iWVRtP4VRsocUnjlH0cGoKcOroI0Ge95OV9UIyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=34rsH+F2NRs2isIyTtDSehq5A47h7DkUrBhtacMnahQ=;
 b=LpwWhRbn7Ln4Le8RZHuGOUmFsOaTpZUFZVbwWfe5DVujcagvcvfgp08yduMzqmdweUGO6Sa7zhc9pI4+vu5rZVjZFGGH7f4+7jqJYkjsEJ0NoXUgO2VPs40XEerV1c/JGEC16e8sa50ZZHH52Mw+91numOwMF0/DkhVzd18TD4gb4okBkAAYqHMmkrhQUZm3RItyRwjmr/gHZQCaQcOLHOii+y152EK5AJhg3qVioGe4khh7UF85d3XTip5Oe0seuSfcJeb6TM/ROsTXDyoFJW59LWrCTBLKRrTH3DbNFt4kjtlEfC36ADG4VuPzhTiOMc1JCyPOls8y0gl0tiswcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=34rsH+F2NRs2isIyTtDSehq5A47h7DkUrBhtacMnahQ=;
 b=W8L5pbFH6ZtSTsSQqC27+maNO+78AlODT6aO1hKFH3P2Htci+/1piCIp1R6ql35dg5E2+rLsICIQ5NlXM7SNu91MHeBK9H2hKhQD7R4z4pwaNJWfKuFDmdqHu7QbC1LfNRnQvg+cj7IhZUevz9ArIzGMfjU6MEoWltkCcKNJpoM=
From: Hirokazu Takahashi <taka@valinux.co.jp>
To: xen-devel@lists.xenproject.org
Cc: Mykyta_Poturai@epam.com,
	Hirokazu Takahashi <taka@valinux.co.jp>
Subject: [PATCH 0/3] xen/arm: Device Tree based CPU topology support
Date: Wed, 10 Jun 2026 20:13:17 +0900
Message-ID: <20260610111320.133784-1-taka@valinux.co.jp>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TY6PR01CA0030.jpnprd01.prod.outlook.com
 (2603:1096:405:3bd::9) To OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:604:458::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS9P286MB7222:EE_|OS7P286MB6556:EE_
X-MS-Office365-Filtering-Correlation-Id: a00fc723-d6cb-4835-30de-08dec6e14987
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|1800799024|376014|366016|23010399003|18002099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	NYH4VN8HlyZMYIUHw9olR/EBw5NjCwUSq8YzOqT9sxuLiFHnCevB8Ktp3yh4j/i++PHhdLaoMZyxTo232/GxN/CWsgg0YjPBdtjlB8Af+EomVV1v0gwzIFC/yL/uTRy5M5AaV/wwl/OuOM8eUObEclYIRoV8G8l6oE3P6gNBiX11wnjt1whq0Zk5Mk0cvpy6TtEvWFMLU7byC1kCrh5zlw60eaKhlELvyHtXtLgYxXggJGIcPFzhXP5T5Wkd2YcU+vrR1NlkUJ5GOAlqp157f0rHLdclS4oChG9y8A/RwsMmp2LrPs3YUmjP65I/AUNyupAz0brdH2hOEbp1E+r7y+sycjlAzqdNn8J5oGPDc9FgeJ36H4Yw3iThzo5mYjvTPO8ggGmKK+M6P+tN2fzb3ijXVlu+hcOUSeACAW4ajX/Hualr85tvIILRylgsD74wURAQ1QF5rmCzwn14+HPNHWXNfG3YvvO4yuq9UQuO9HdYp+OA2tBK9oqlUN6+A9pP7zzCOpLt9+r9OGQdzv7pDGtw5STzXKfqLfy9D3aQDC0rnDTyha/GAB3ns7d66f2Zf8Uv9jckS3Pbr0B5eYphrv4yO37TG9IV9rxoysG3vrUOBrSOVrG0Xe/oAYAJzA7xks1yB3tat59RPvOoMlWV2SDtqI7J7P/VWDLjC6xIcCaxIdGQoDjxMmzzOv87axL5
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(1800799024)(376014)(366016)(23010399003)(18002099003)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?zJKyrOo1mfcUVuuuconNjuiBdgvri31hwUBibCXw+/vDcgNca4YaryOoFPna?=
 =?us-ascii?Q?vVJ8VqNb/Exu9mhHZzJiy3bJ24RzCoEuAfGOGkuTkyi2eOYD2g33Pq7uX0JI?=
 =?us-ascii?Q?4eLhjSbq5RvnxAjdJjZIFiy4cg38Eky2YLuECGJPbE3RjJlRbo7aEaSf4CdP?=
 =?us-ascii?Q?SjWhrt741I0PM7WIAT+1CwFSaTqIUqdyME8lXcvGpJ6ze4OaEeA6U79naNkT?=
 =?us-ascii?Q?1ijcY2a766rv08xPi93Hat8o7s7eXtwp6xY+2kUAeGlwSK1m57jS3/qaPlqE?=
 =?us-ascii?Q?dbTswJXoL072QkbSHSxm9M3W1QquT2yUvIONTMKziqctzgmufqu3mFPygHuF?=
 =?us-ascii?Q?/85XeOeW2G7YwykyPo6KefkBA+1pNHNetixv0GaF0ZQ4pQW9MFcy6Y+oZtgB?=
 =?us-ascii?Q?3qwYN2yakMlK9XeY7jNSrJHVE9qlYdf1neSJanaU5msMXf4UEP0dbEPVbP7e?=
 =?us-ascii?Q?Jtfd2XUH0XTDBXJ3MqHfUKnHfdNVI/y2dDiLM9e72MWxH4s0gT+oejTk6w1C?=
 =?us-ascii?Q?DLDv68pSK4YeYeih92za5LpHgqm+Ra7ay8fQotmP2wgvh98TJBuQ+SOHAgDH?=
 =?us-ascii?Q?0GbTD6ixzUp+44JNv8LdMbKswpY0ak9gNjrAEZqnFPinJd0dGeOknEEL5fdC?=
 =?us-ascii?Q?RRtjq6uL/dSlNMQSRDkboHskkmt+J4OcO9829Zt1D+nfFyaMJ+qOh0ba5Hrx?=
 =?us-ascii?Q?kiIVwRQ80hOAIIuJ+fsLdSn0My+W8NXraKQ/rHVzfPCOtL62CVaqbs+510Un?=
 =?us-ascii?Q?qE5I2Kezp9Ss17jLcwpXN2TdDecZproTleGshJ5DotbgrnggRy67sVz4D0/r?=
 =?us-ascii?Q?wbn0bYdn+SnhAx88EWBOLNZKyOaCG7rQj33gcapeEsSoFM+9StHx1dv6R4hr?=
 =?us-ascii?Q?/WNs96s1TCEFyY2Nub5v61ge1kjLoCf4UUlRKBxy7aUFYt6HSwL5zXqPzzGP?=
 =?us-ascii?Q?cDFQF4niBy1BMCWkPM01r+fiuxMjR4+ryUPiIsnUHr3gcTQrKrkDa8Aqkt1Z?=
 =?us-ascii?Q?7U4qPJ9oCVsOCkVklwrh+GBNmQqF0FI1k6gojlOW5FRC+tAcSvNfpQghqhgT?=
 =?us-ascii?Q?cOoKuAt9UKE6kuUWxOT9lXSFe81lTkMIVo4p3TpjcZD/evfA4M0dMf7bK/8A?=
 =?us-ascii?Q?L9/Pza3RdufeMfi/QCW+l2mESUb0bhtIqplJ8Lz7ll3Mn/2BgfYq+fdwd/fl?=
 =?us-ascii?Q?3xIkBI9A6SWJb94YR94p6iLIUBA+kAyZoHvQqlubvuZNgf/ky3JAz6rIJl18?=
 =?us-ascii?Q?U2wSYj9QNZ72Acz2xqNlQE4d/tLsclUmeyjAh5e+kHz6IV15UFpMq46hlznA?=
 =?us-ascii?Q?R0JV/KFIH7K5Qj/d/t79uLULfy/NT3z+yhAfDenmpbhKO/1/QuKlPz45CDVi?=
 =?us-ascii?Q?xnxfWIWOBRD9POxVRVtarkeMHfDoLhHqa9kRZT4zxdNkdPJrRVr3/ZQQeaWX?=
 =?us-ascii?Q?DDN7hmyU3wQkYXLeUhqNqyu8cKJYC50yhueqL2uAhDo49jjTzfQymk1Qc5Uj?=
 =?us-ascii?Q?adIZrTwIKeU/pCaTurUAsi3ow9aq9njEllo3GiK5vWKq3alp75RJmtZinJxN?=
 =?us-ascii?Q?deRBRCZ601O22LQ+uIyO9S6sYCAOj91rj5+Vs2zIsWiL+5/RoVFhLtoZQkmR?=
 =?us-ascii?Q?sxanUANFYTUmLZleqbGDJD0qGq8+CF03t7CrdC958wui4ALiyWcI3DPjQeIa?=
 =?us-ascii?Q?NFt+9oJxhjhNOzTRU5JvkK4HL5eysf+6UsRauSlY6nKz0BljwZYymfo+U7pW?=
 =?us-ascii?Q?AXD/2ItKgkyuT1TQuJhH1cbIiN82VVqzMowy0ukRnYjW9RMajgHoA+7JYmi0?=
X-MS-Exchange-AntiSpam-MessageData-1: Z2wwqEJoQhrAvw==
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: a00fc723-d6cb-4835-30de-08dec6e14987
X-MS-Exchange-CrossTenant-AuthSource: OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2026 11:13:23.7654
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sztB6D9cyyF+aVXpdgtTvQglvTjYknoqD9JxLCv50I0scncHzmo29hyNOhOvI1GqS0zYNRU9iQMINzhGXQei3A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS7P286MB6556
X-purgate-ID: tlsNG-c1860d/1781090009-BE577DB1-07166749/0/0
X-purgate-type: clean
X-purgate-size: 2442
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.69 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[valinux.co.jp,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[valinux.co.jp:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[taka@valinux.co.jp,xen-devel-bounces@lists.xenproject.org];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:Mykyta_Poturai@epam.com,m:taka@valinux.co.jp,s:lists@lfdr.de];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_THREE(0.00)[3];
	FORGED_SENDER_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[valinux.co.jp:dkim,valinux.co.jp:mid,valinux.co.jp:from_mime];
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
X-Rspamd-Queue-Id: BB609668A08

Hello,

This patch series introduces Device Tree based CPU topology support for
ARM Xen.

These patches were previously part of my "Introduce Device Tree based NUMA
support for ARM Xen" series. Since the CPU topology feature can perfectly
work on its own, I decided to split it out and submit it as a standalone
series to make the review process easier.

Compared to the previous version included in the NUMA series, I have made
a few key improvements based on earlier discussions:

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

Summary of changes:
 - Patch 1: Parses the 'cpu-map' node in the Device Tree to extract topology
            information.
 - Patch 2: Connects the extracted CPU topology data to the Xen scheduler.
 - Patch 3: Refactors `cpu_nr_siblings()` to be an architecture-specific
            function, providing an x86 implementation and a common version
            for Device Tree-based systems.

Thank you,
Hirokazu Takahashi

Hirokazu Takahashi (3):
  xen/device-tree: Parse 'cpu-map' node for CPU topology exploration
  xen/sched: Link CPU topology to scheduler
  xen/sched: Make cpu_nr_siblings() architecture-specific

 xen/arch/arm/include/asm/processor.h  |   4 -
 xen/arch/arm/smpboot.c                |  16 +-
 xen/arch/x86/include/asm/processor.h  |   1 +
 xen/common/Kconfig                    |   7 +
 xen/common/device-tree/Makefile       |   1 +
 xen/common/device-tree/cpu-topology.c | 393 ++++++++++++++++++++++++++
 xen/common/sched/credit2.c            |  22 +-
 xen/common/sysctl.c                   |   1 +
 xen/include/xen/cpu-topology.h        |  50 ++++
 9 files changed, 472 insertions(+), 23 deletions(-)
 create mode 100644 xen/common/device-tree/cpu-topology.c
 create mode 100644 xen/include/xen/cpu-topology.h

-- 
2.43.0


