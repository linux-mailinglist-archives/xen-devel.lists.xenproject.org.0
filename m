Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id AX77OtlcKWrxVgMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 10 Jun 2026 14:47:21 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 465B6669680
	for <lists+xen-devel@lfdr.de>; Wed, 10 Jun 2026 14:47:21 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=epam.com header.s=selector1 header.b=iqGiAEbu;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=quarantine) header.from=epam.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1334279.1597433 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wXIKt-0003Hx-3n; Wed, 10 Jun 2026 12:47:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1334279.1597433; Wed, 10 Jun 2026 12:47:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wXIKs-0002vo-Jh; Wed, 10 Jun 2026 12:47:10 +0000
Received: by outflank-mailman (input) for mailman id 1334279;
 Wed, 10 Jun 2026 12:45:48 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Mykola_Kvach@epam.com>) id 1wXIJY-0001H1-5c
 for xen-devel@lists.xenproject.org; Wed, 10 Jun 2026 12:45:48 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wXIJX-00HZzX-Ik
 for xen-devel@lists.xenproject.org; Wed, 10 Jun 2026 14:45:47 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Mykola_Kvach@epam.com>)
 id 6a295c7b-2eae-0a2a0a5409dd-0a2a450cccde-0
 for <xen-devel@lists.xenproject.org>; Wed, 10 Jun 2026 14:45:47 +0200
Received: from [52.101.69.83]
 (helo=AM0PR83CU005.outbound.protection.outlook.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <Mykola_Kvach@epam.com>)
 id 6a295c7b-62f1-0a2a450c0019-346545532a7e-4
 for <xen-devel@lists.xenproject.org>; Wed, 10 Jun 2026 14:45:47 +0200
Received: from AS8PR03MB9746.eurprd03.prod.outlook.com (2603:10a6:20b:61d::18)
 by AM9PR03MB7558.eurprd03.prod.outlook.com (2603:10a6:20b:415::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.11; Wed, 10 Jun
 2026 12:45:45 +0000
Received: from AS8PR03MB9746.eurprd03.prod.outlook.com
 ([fe80::cf11:309:1384:58f7]) by AS8PR03MB9746.eurprd03.prod.outlook.com
 ([fe80::cf11:309:1384:58f7%4]) with mapi id 15.21.0113.011; Wed, 10 Jun 2026
 12:45:45 +0000
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
 b=AEWDXlosCvNifLpDxluL+1iiRhpjrp+h3Fy1Xa/J0DaftDyx0aw13w26R4Jr2KC/ZyTuO4qnqnRv7zJngAV6/eE6DJ6sulBvnIk1TLbhs2eB9oIU7m00LecidFh7ZEthgaoX9qiFyDi8aP35dd4KjmxPEXgwqhkuwfhXhVDRaUWNcgVAF02MG2rWLYd1nfcaMX7qOdoJNhdGnVdOL83fBThbn8gnmxcZMKp68BWWONvYAlCJIveGtzp+j8ZWOFmJei61HzoGQxs6C9thrl11RMsQKq+fihpUVCWy68kAnMihL5a2Afkgj6uuVJsH5PiC/tc5w8iKkRCRDN+5R8KL3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CmvxC/INp19b+i88n0k6NHOjs/Hn3KkLy2VeOHRcLXY=;
 b=AZkFmpalzgjJIvUj2MX9OERXpgqq56HTiG31jWED4pFpM5fUxYxnSOgvecDSz7nm+vo1R+6HVtz0eju5HS3exuLQ+YZBc/aRQt3GYgQnTSyhVe0MwxLOIJtZsz6uFnpvzASmdBRbXjp3HVk9KBSvA4/lUtcG2DQCGXk2eI4JsjlWuOirAcC+Q7uGe+XGXUjShgI9yBaPcT2mgvvGa0JsXzu8NeIvG5teHxcd4lWIF7fvtUhZIbxFJva9gs4hLpo1HwuW6AdxUd+bNxk4v6UzBEbEiCYOTJVMWld0WO0l5p99fl4y2XIx5OPHodclgE6WIcr9ITyztnj2Sf/aqy5fCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CmvxC/INp19b+i88n0k6NHOjs/Hn3KkLy2VeOHRcLXY=;
 b=iqGiAEbukuy8V+6CEBUNXqWkOSxscfZMPkNHwRkUJnYfgcDY8o09JHijQXtfHdUwH3bbqKw/p9Fchsyztbh7sBqb6X9WUFs647/0mNmghHMrNaBpbKcCnb5G1Lcl4vHUv+glELwiqPBEIEw733DhXbDosTqnMza1rL6hH7tsL2xHWcS2r/U7s65GwfxCgOOeW/Vt1aVGBUoAr6tFkYffCFpu7kWTFWWnh7gUB9cBvA8/1wkNYK5qh2bL2+4YRHSGzZ7NB7RCUCdONWpLIZ1c0DYO/npjyX6aGO347HXdbtBMUHdgCXBfZeS7Z30ukxRg/fgRvuXaM5BCsH7AuuRSSA==
From: Mykola Kvach <mykola_kvach@epam.com>
To: xen-devel@lists.xenproject.org
Cc: Mykola Kvach <mykola_kvach@epam.com>,
	Mykola Kvach <xakep.amatop@gmail.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v11 13/13] xen/arm: Add host system suspend backend
Date: Wed, 10 Jun 2026 15:44:33 +0300
Message-ID: <8396f8bfd4a17a6aa38a824f317fb20000ebd940.1781084290.git.mykola_kvach@epam.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1781084290.git.mykola_kvach@epam.com>
References: <cover.1781084290.git.mykola_kvach@epam.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: WA1P291CA0008.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:19::19) To AS8PR03MB9746.eurprd03.prod.outlook.com
 (2603:10a6:20b:61d::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR03MB9746:EE_|AM9PR03MB7558:EE_
X-MS-Office365-Filtering-Correlation-Id: 2840ef83-8f1b-4b58-2081-08dec6ee309f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|1800799024|376014|3023799007|56012099006|11063799006|5023799004|6133799003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	ep29k07wTH7rppEfb81arMHWUoXmqelkfYXEcVOkiR+B5bePO104+4oSyt74sSlAPFoH9DE0DXqYb4G+by7sXRwr3J5Cx2/obk0YghajVYuwtLC/RtUNgvBSvw/Rx+UdfB1XVz5f1bVFTRb2rpT0uows94BI5ZISqPUlh4B8goujSPlZNHk4AZDtzyofcWy06Mca7umX8kRmJjpAc/BM7odO39TMPqM65obsdtt44An2QkoSbG2JopT3gkj0FZS8wt+mukLz3CBxTz6PfzNZBQ6QKGh4hQtfp3c4EXdhobsjAiQVFhRbd271Ea37HbDsKVgtauIMXhHKhtqVmsQIJuye48uFxCJAUzoTpexlq/NNGVkT7RfF+gU/dgkGL4wfwWLA83jblWwTnDylUR/YVcjekhFn/PYjz156k6Gf9nlcGNxLQ332eV8ElYiX56OzXIrh/Q28jyVNeOaYnmCoyi6FCETUGIOU0J8KR95s1K1kdwL+1LoRxoicr7bFmbLd1DbrY8puAdkfxjE3YYxZxjgwvi9B9HOA1DJr0Cm6Sg0alzcaVoC0rhhiOJ+WfKjh8Utr+ahjShrm5C1cP4svraXcrLYoqwHdBemHLUSO3VSHKrV915MddsTtJllXcWwzj55tzat6NvisWY4zZZehTsOaqSpAtXWXkmIY1RQBwmKJKGqrrgF3QaZvAt0SGQic
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR03MB9746.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(3023799007)(56012099006)(11063799006)(5023799004)(6133799003)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?miKEKD1rjW5wzjl+GnUu1jp3HZk8J6rjeMyIbyydxOn6aNabjovZwHsC77oz?=
 =?us-ascii?Q?fIVMlG/mNWYQKfg7Lrrn7y6AFSE2BhKHDTV2PvLiMrp9IStBRXq/ZpcyRYcU?=
 =?us-ascii?Q?pu9QjiLItA1TDFpnKKLAD07qOm/e6D/JCdAPDxudHimLsKqH8qUVza8QBKDH?=
 =?us-ascii?Q?9jf4Gx8wHwWxnm8el3UKdv7Mfuw3Fgfr4nJqXdq4VItV3gcx8nvYDBvmp9/s?=
 =?us-ascii?Q?2CgCqT296AEHoCXx6ZOyPFIiy2ksdqOSQ88um0wDlBYfNMnLSvZpVM9asaO1?=
 =?us-ascii?Q?RKCIAXNQLkrVkWK+KAFTD+KWDl+LOfSc2cDoonf8205r3STDv9l9bjs0PShH?=
 =?us-ascii?Q?Be/ES4WWBYfClhd0N0aQPbCUleQxkPwgEs+4sQpgyx2FkomIIbcHsOO1XyYw?=
 =?us-ascii?Q?n2YWbMSqua2iwkg4bhcbbei228ifPPs79HorFVl9Fqs8HMj+aaztdVAD1heE?=
 =?us-ascii?Q?ILVwvuZ4/rPTEXKEhqYQkZLXWegMsgfCDaFjLfxN6w0H+p1RN5fSNTLg6gXf?=
 =?us-ascii?Q?G6+ljeNiQv5MzO5Sn1kCrA06B0qej9jZkdkP7JBKQRvlkAC/Q202d6UjBGQj?=
 =?us-ascii?Q?yRP3LcpFUx4okttBLP6c1oLLnQz4MMg8p5ewenXn3DXDsx9wWH///PskRvh0?=
 =?us-ascii?Q?hAkSqbOBQvDRTsMkNGPvtTGNDl8TkUKLaZkKFHS9eRyxnOqD54HP1uYa9WRV?=
 =?us-ascii?Q?ngxjnZHBHDCronJqEYdO8KJeZtfdeMsVta+eoCaOW6QEWYHLDLSdQtnZpQMd?=
 =?us-ascii?Q?GjmA1+ss/JJFLuXk2wgiJ3mJI3b/Um5NF1wRWAH8aRfKoU9sPmNRdKmekcDd?=
 =?us-ascii?Q?Nd/hL38LqozuXmizca2OAuiHwlQZ9pfrKqEA8j3XWjL76sDRFcek5q03gjwO?=
 =?us-ascii?Q?pXEsjIyMleDQ/9HRjuv+oisH3J+ZD2BCA16IzlxSJcaifuNXriP5xfISaQ+d?=
 =?us-ascii?Q?27wZZdpah8dLhZecXF3K4TKlQsNvTVqV4wzfkGkTW5D2hHuEl80mT6idBqBw?=
 =?us-ascii?Q?nO4ZabXP8HxyNan5e7HHONCjy3PrGWY9H6PVkSYthFOJt7d8DigW62oj8B4X?=
 =?us-ascii?Q?GdM4eKAYwOjQbE5WwBjNu0fEcLKIpcifXIUVd1lnJbg7fKGE1yCLkJCKUtfi?=
 =?us-ascii?Q?gcbXNme2baJHvXZ/PWaxNElzglFOQu50v2ynO+nVuCXR0c4R3nOIuHAVZAO3?=
 =?us-ascii?Q?cFaZJnffn9RBEF9H2kzlYg+6RVKU4A8JmbuN0RCWDBDtMHZtzwHSv5ggd3BZ?=
 =?us-ascii?Q?V9u0RIDdfwe2KTVXcO+injofSvl26PXMIFjPWvGvwxlGc2UClpYCeYUTpuGe?=
 =?us-ascii?Q?hz32iIsHQfRMPgFVWr1IxYKqXc9Ow850/D9CHIDNbHcLEo/YOwxXfVeXneun?=
 =?us-ascii?Q?ciCBWidUqodLxAwcLBYk0uxFmkVvNQ/eXf++86gVsbku2nDFguWNDuJgOM2D?=
 =?us-ascii?Q?N8KNrI6ttGBTiEdJ9+G5XpdefbRIdcjki8sVFjNd2qokKU5+/EuBnj+mVgTp?=
 =?us-ascii?Q?Nd8aK0eCjvOogX1y6riOeXU2vDwy9GRzNrpqnvv/u+Aw/B8joEQdbImg0oW8?=
 =?us-ascii?Q?/r2jN78mDi48GQW06JCA4Ucwe76/hzS2NMOgsqlGhzbFvI0Snmu2kco7q4g3?=
 =?us-ascii?Q?myQ3xNyDABThBYwJgSi4Zni9jxiAW1tOIAPBdgjc3femmG6sT2GovePXYSNN?=
 =?us-ascii?Q?+z7HiuYwVkR9pJ/nzVs7YTLEgEKU7c86bJvy9EH+h4fd6X/xN8We2586g5Ag?=
 =?us-ascii?Q?ZaxPNZ36qQ=3D=3D?=
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2840ef83-8f1b-4b58-2081-08dec6ee309f
X-MS-Exchange-CrossTenant-AuthSource: AS8PR03MB9746.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2026 12:45:45.5027
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: r7vgIt8HtYEtHGDWnDy9PYbxmNPUMa563oD4erczjubjXJbA2wvIp5FC4rmN4lhBQpoU4+ruu0rp/haPqIDcBw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR03MB7558
X-purgate-ID: tlsNG-d25034/1781095547-DA169CF5-0DD9C169/0/0
X-purgate-type: clean
X-purgate-size: 13927
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.81 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[epam.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[epam.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[epam.com,gmail.com,kernel.org,xen.org,arm.com,amd.com];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:mykola_kvach@epam.com,m:xakep.amatop@gmail.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:xakepamatop@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[mykola_kvach@epam.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[mykola_kvach@epam.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[epam.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 465B6669680

From: Mirela Simonovic <mirela.simonovic@aggios.com>

Add the Xen-wide suspend/resume backend used after a control-domain
vPSCI SYSTEM_SUSPEND request has been accepted. The vPSCI policy,
runtime driver blockers and control-domain sequencing checks are handled
by the preceding commit; this change adds the code that actually drives
the host suspend attempt.

The backend runs from a tasklet scheduled on pCPU0, because non-boot CPUs
are disabled during suspend. It freezes domains, disables the scheduler
and then disables non-boot CPUs.

Host-side suspend participants are handled in phases. IOMMU and console
state are suspended first. Local IRQs are then disabled before suspending
timer and GIC state. On resume or failure, the completed suspend phases
are unwound in reverse: GIC and timer state are restored while IRQs are
still disabled, local IRQs are restored, and then console and IOMMU state
are restored.

On boot, init_ttbr is normally initialized during secondary CPU hotplug.
On uniprocessor systems this can leave init_ttbr uninitialized, so set it
from the boot CPU before entering suspend.

Note: the code is behind CONFIG_HAS_SYSTEM_SUSPEND, which is currently
only selected when UNSUPPORTED is set and MPU is not set.

Signed-off-by: Mirela Simonovic <mirela.simonovic@aggios.com>
Signed-off-by: Saeed Nowshadi <saeed.nowshadi@xilinx.com>
Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>
Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
---
Changes in V10:
- Re-apply boot CPU local errata/workaround handling after SYSTEM_SUSPEND,
  before resuming the rest of the host suspend path.
- Move set_init_ttbr() declaration to asm/mmu/mm.h, since it is
  MMU-specific.

Changes in V9:
- Split vPSCI availability policy, runtime host-suspend blockers and the
  domain-readiness precheck into the preceding commit.
- Trigger the host suspend backend from the control-domain SYSTEM_SUSPEND
  path.
- Reorder the host suspend/resume phases so the timer is suspended with
  local IRQs disabled and local IRQs are restored after the GIC and timer
  resume paths, before the console and IOMMU resume paths.
- Move HAS_HWDOM_SYSTEM_SUSPEND and related logic to policy patch.

Changes in V8:
- Add a pre-suspend check in system_suspend() after scheduler_disable() to
  require all domains to be in the shut down state with SHUTDOWN_suspend
  before proceeding with the global suspend flow.
- Drop the common-level depends on !ARM_64 || !SYSTEM_SUSPEND from
  CONFIG_HAS_HWDOM_SHUTDOWN_ON_SUSPEND and model the ARM64 suspend case
  with an arch-selected capability instead.
- Rename CONFIG_HAS_HWDOM_SHUTDOWN_ON_SUSPEND to
  CONFIG_HAS_HWDOM_SYSTEM_SUSPEND.
- Rename need_hwdom_shutdown() to want_hwdom_shutdown().

Changes in V7:
- Control domain is responsible for host suspend.
- Add an empty inline host_system_suspend() function when SYSTEM_SUSPEND
  config is disabled.
- Use IS_ENABLED() for config checking instead of #ifdef.
- Replace #ifdef checks in domain_shutdown() with IS_ENABLED() to simplify
  control flow.
- Factor hardware domain shutdown condition into a helper
  (need_hwdom_shutdown()) to avoid preprocessor directives inside the
  function.
- Squash with iommu suspend/resume commit.
---
 xen/arch/arm/Kconfig                 |   1 +
 xen/arch/arm/cpuerrata.c             |   7 +-
 xen/arch/arm/include/asm/cpuerrata.h |   1 +
 xen/arch/arm/include/asm/mmu/mm.h    |   2 +
 xen/arch/arm/include/asm/suspend.h   |   2 +
 xen/arch/arm/mmu/smpboot.c           |   2 +-
 xen/arch/arm/suspend.c               | 156 +++++++++++++++++++++++++++
 xen/arch/arm/vpsci.c                 |  10 +-
 8 files changed, 177 insertions(+), 4 deletions(-)

diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
index 9acd342f09..09ae8e1aac 100644
--- a/xen/arch/arm/Kconfig
+++ b/xen/arch/arm/Kconfig
@@ -9,6 +9,7 @@ config ARM_64
 	select 64BIT
 	select HAS_DOMAIN_TYPE
 	select HAS_FAST_MULTIPLY
+	select HAS_SYSTEM_SUSPEND if !MPU && UNSUPPORTED
 	select HAS_VPCI_GUEST_SUPPORT if PCI_PASSTHROUGH
 
 config ARM
diff --git a/xen/arch/arm/cpuerrata.c b/xen/arch/arm/cpuerrata.c
index 3a32183618..e6499aaab3 100644
--- a/xen/arch/arm/cpuerrata.c
+++ b/xen/arch/arm/cpuerrata.c
@@ -782,6 +782,11 @@ void check_local_cpu_errata(void)
     update_cpu_capabilities(arm_errata, "enabled workaround for");
 }
 
+int enable_local_cpu_errata_workarounds(void)
+{
+    return enable_nonboot_cpu_caps(arm_errata);
+}
+
 void __init enable_errata_workarounds(void)
 {
     enable_cpu_capabilities(arm_errata);
@@ -818,7 +823,7 @@ static int cpu_errata_callback(struct notifier_block *nfb,
          * fixed to expect an error at CPU_STARTING phase.
          */
         ASSERT(system_state != SYS_STATE_boot);
-        rc = enable_nonboot_cpu_caps(arm_errata);
+        rc = enable_local_cpu_errata_workarounds();
         break;
     default:
         break;
diff --git a/xen/arch/arm/include/asm/cpuerrata.h b/xen/arch/arm/include/asm/cpuerrata.h
index 1799a16d7e..b93521326f 100644
--- a/xen/arch/arm/include/asm/cpuerrata.h
+++ b/xen/arch/arm/include/asm/cpuerrata.h
@@ -5,6 +5,7 @@
 #include <asm/alternative.h>
 
 void check_local_cpu_errata(void);
+int enable_local_cpu_errata_workarounds(void);
 void enable_errata_workarounds(void);
 
 #define CHECK_WORKAROUND_HELPER(erratum, feature, arch)         \
diff --git a/xen/arch/arm/include/asm/mmu/mm.h b/xen/arch/arm/include/asm/mmu/mm.h
index 7f4d59137d..ee73a77777 100644
--- a/xen/arch/arm/include/asm/mmu/mm.h
+++ b/xen/arch/arm/include/asm/mmu/mm.h
@@ -110,6 +110,8 @@ void dump_pt_walk(paddr_t ttbr, paddr_t addr,
 extern void switch_ttbr(uint64_t ttbr);
 extern void relocate_and_switch_ttbr(uint64_t ttbr);
 
+void set_init_ttbr(lpae_t *root);
+
 #endif /* __ARM_MMU_MM_H__ */
 
 /*
diff --git a/xen/arch/arm/include/asm/suspend.h b/xen/arch/arm/include/asm/suspend.h
index 50dc6e9fdf..889a6509d9 100644
--- a/xen/arch/arm/include/asm/suspend.h
+++ b/xen/arch/arm/include/asm/suspend.h
@@ -41,11 +41,13 @@ int prepare_resume_ctx(void);
 void hyp_resume(void);
 bool host_system_suspend_allowed(void);
 void host_system_suspend_disable(const char *reason);
+void host_system_suspend(struct domain *d);
 
 #else /* !CONFIG_SYSTEM_SUSPEND */
 
 static inline bool host_system_suspend_allowed(void) { return false; }
 static inline void host_system_suspend_disable(const char *reason) {}
+static inline void host_system_suspend(struct domain *d) {}
 
 #endif
 
diff --git a/xen/arch/arm/mmu/smpboot.c b/xen/arch/arm/mmu/smpboot.c
index 37e91d72b7..ff508ecf40 100644
--- a/xen/arch/arm/mmu/smpboot.c
+++ b/xen/arch/arm/mmu/smpboot.c
@@ -72,7 +72,7 @@ static void clear_boot_pagetables(void)
     clear_table(boot_third);
 }
 
-static void set_init_ttbr(lpae_t *root)
+void set_init_ttbr(lpae_t *root)
 {
     /*
      * init_ttbr is part of the identity mapping which is read-only. So
diff --git a/xen/arch/arm/suspend.c b/xen/arch/arm/suspend.c
index c7c26bcf03..3fe2ffa4fb 100644
--- a/xen/arch/arm/suspend.c
+++ b/xen/arch/arm/suspend.c
@@ -1,10 +1,18 @@
 /* SPDX-License-Identifier: GPL-2.0-only */
 
+#include <asm/cpuerrata.h>
+#include <asm/cpufeature.h>
+#include <asm/gic.h>
 #include <asm/psci.h>
 #include <asm/suspend.h>
 
+#include <xen/console.h>
+#include <xen/cpu.h>
+#include <xen/iommu.h>
 #include <xen/lib.h>
+#include <xen/sched.h>
 #include <xen/serial.h>
+#include <xen/tasklet.h>
 
 struct resume_cpu_context resume_cpu_context;
 
@@ -44,6 +52,154 @@ void host_system_suspend_disable(const char *reason)
            reason ? reason : "unsupported suspend/resume path");
 }
 
+/* Xen suspend. data identifies the domain that initiated suspend. */
+static void system_suspend(void *data)
+{
+    int status;
+    unsigned long flags;
+    struct domain *d = (struct domain *)data;
+
+    BUG_ON(system_state != SYS_STATE_active);
+
+    system_state = SYS_STATE_suspend;
+
+    printk("Xen suspending...\n");
+
+    freeze_domains();
+    scheduler_disable();
+
+    /*
+     * Non-boot CPUs have to be disabled on suspend and enabled on resume
+     * (hotplug-based mechanism). Disabling non-boot CPUs will lead to PSCI
+     * CPU_OFF to be called by each non-boot CPU. Depending on the underlying
+     * platform capabilities, this may lead to the physical powering down of
+     * CPUs.
+     */
+    status = disable_nonboot_cpus();
+    if ( status )
+    {
+        system_state = SYS_STATE_resume;
+        goto resume_nonboot_cpus;
+    }
+
+    console_start_sync();
+    status = iommu_suspend();
+    if ( status )
+    {
+        system_state = SYS_STATE_resume;
+        goto resume_end_sync;
+    }
+
+    status = console_suspend();
+    if ( status )
+    {
+        dprintk(XENLOG_ERR, "Failed to suspend the console, err=%d\n", status);
+        system_state = SYS_STATE_resume;
+        goto resume_iommu;
+    }
+
+    local_irq_save(flags);
+
+    time_suspend();
+
+    status = gic_suspend();
+    if ( status )
+    {
+        system_state = SYS_STATE_resume;
+        goto resume_time;
+    }
+
+    set_init_ttbr(xen_pgtable);
+
+    /*
+     * Enable identity mapping before entering suspend to simplify
+     * the resume path
+     */
+    update_boot_mapping(true);
+
+    if ( prepare_resume_ctx() )
+    {
+        status = call_psci_system_suspend();
+        /*
+         * If suspend is finalized properly by above system suspend PSCI call,
+         * the code below in this 'if' branch will never execute. Execution
+         * will continue from hyp_resume which is the hypervisor's resume point.
+         * In hyp_resume CPU context will be restored and since link-register is
+         * restored as well, it will appear to return from prepare_resume_ctx.
+         * The difference in returning from prepare_resume_ctx on system suspend
+         * versus resume is in function's return value: on suspend, the return
+         * value is a non-zero value, on resume it is zero. That is why the
+         * control flow will not re-enter this 'if' branch on resume.
+         */
+        if ( status )
+            dprintk(XENLOG_WARNING, "PSCI system suspend failed, err=%d\n",
+                    status);
+
+        system_state = SYS_STATE_resume;
+    }
+    else
+    {
+        system_state = SYS_STATE_resume;
+
+        /*
+         * CPU0 resumes directly from hyp_resume(), bypassing the CPU hotplug
+         * path that re-checks and re-enables errata workarounds for secondary
+         * CPUs.
+         */
+        check_local_cpu_errata();
+        check_local_cpu_features();
+        BUG_ON(enable_local_cpu_errata_workarounds());
+    }
+
+    update_boot_mapping(false);
+
+    gic_resume();
+
+ resume_time:
+    time_resume();
+
+    local_irq_restore(flags);
+
+    console_resume();
+
+ resume_iommu:
+    iommu_resume();
+
+ resume_end_sync:
+    console_end_sync();
+
+ resume_nonboot_cpus:
+    /*
+     * The rcu_barrier() has to be added to ensure that the per cpu area is
+     * freed before a non-boot CPU tries to initialize it (_free_percpu_area()
+     * has to be called before the init_percpu_area()). This scenario occurs
+     * when non-boot CPUs are hot-unplugged on suspend and hotplugged on resume.
+     */
+    rcu_barrier();
+    enable_nonboot_cpus();
+
+    scheduler_enable();
+    thaw_domains();
+
+    system_state = SYS_STATE_active;
+
+    printk("Resume (status %d)\n", status);
+
+    domain_resume(d);
+}
+
+static DECLARE_TASKLET(system_suspend_tasklet, system_suspend, NULL);
+
+void host_system_suspend(struct domain *d)
+{
+    system_suspend_tasklet.data = (void *)d;
+    /*
+     * The suspend procedure has to be finalized by the pCPU#0 (non-boot pCPUs
+     * will be disabled during the suspend).
+     */
+    tasklet_schedule_on_cpu(&system_suspend_tasklet, 0);
+}
+
 /*
  * Local variables:
  * mode: C
diff --git a/xen/arch/arm/vpsci.c b/xen/arch/arm/vpsci.c
index 0bae42c1bd..6e332d6a12 100644
--- a/xen/arch/arm/vpsci.c
+++ b/xen/arch/arm/vpsci.c
@@ -237,7 +237,8 @@ static bool domain_in_suspend_state(struct domain *d)
     return suspended;
 }
 
-static int32_t domain_psci_system_suspend_policy(struct domain *d)
+static int32_t domain_psci_system_suspend_policy(struct domain *d,
+                                                 bool *host_suspend)
 {
     struct domain *other;
     bool last_awake_control_domain = true;
@@ -300,6 +301,7 @@ static int32_t domain_psci_system_suspend_policy(struct domain *d)
     if ( !host_system_suspend_allowed() )
         return PSCI_DENIED;
 
+    *host_suspend = true;
     return 0;
 }
 
@@ -310,6 +312,7 @@ static int32_t do_psci_1_0_system_suspend(register_t epoint, register_t cid)
     struct vcpu *v;
     struct domain *d = current->domain;
     bool is_thumb = epoint & 1;
+    bool host_suspend = false;
     struct resume_info *rctx = &d->arch.resume_ctx;
 
     /* THUMB set is not allowed with 64-bit domain */
@@ -334,7 +337,7 @@ static int32_t do_psci_1_0_system_suspend(register_t epoint, register_t cid)
 
     spin_lock(&vpsci_system_suspend_lock);
 
-    rc = domain_psci_system_suspend_policy(d);
+    rc = domain_psci_system_suspend_policy(d, &host_suspend);
     if ( !rc )
     {
         rc = domain_shutdown(d, SHUTDOWN_suspend);
@@ -359,6 +362,9 @@ static int32_t do_psci_1_0_system_suspend(register_t epoint, register_t cid)
             "SYSTEM_SUSPEND requested, epoint=%#"PRIregister", cid=%#"PRIregister"\n",
             epoint, cid);
 
+    if ( host_suspend )
+        host_system_suspend(d);
+
     return rc;
 }
 
-- 
2.43.0


