Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 8CssOdtcKWr6VgMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 10 Jun 2026 14:47:23 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 979C76696AB
	for <lists+xen-devel@lfdr.de>; Wed, 10 Jun 2026 14:47:23 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=epam.com header.s=selector1 header.b=JRqJ3b57;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=quarantine) header.from=epam.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1334255.1597345 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wXIKm-0001OO-QA; Wed, 10 Jun 2026 12:47:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1334255.1597345; Wed, 10 Jun 2026 12:47:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wXIKm-0001L2-Mc; Wed, 10 Jun 2026 12:47:04 +0000
Received: by outflank-mailman (input) for mailman id 1334255;
 Wed, 10 Jun 2026 12:45:15 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Mykola_Kvach@epam.com>) id 1wXIJ0-00018L-Rp
 for xen-devel@lists.xenproject.org; Wed, 10 Jun 2026 12:45:14 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wXIJ0-007rhd-1Y
 for xen-devel@lists.xenproject.org; Wed, 10 Jun 2026 14:45:14 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Mykola_Kvach@epam.com>)
 id 6a295c4f-2eae-0a2a0a5409dd-0a2a4508b56c-36
 for <xen-devel@lists.xenproject.org>; Wed, 10 Jun 2026 14:45:13 +0200
Received: from [52.101.66.72]
 (helo=DUZPR83CU001.outbound.protection.outlook.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <Mykola_Kvach@epam.com>)
 id 6a295c59-63b5-0a2a45080019-3465424806ab-3
 for <xen-devel@lists.xenproject.org>; Wed, 10 Jun 2026 14:45:13 +0200
Received: from AS8PR03MB9746.eurprd03.prod.outlook.com (2603:10a6:20b:61d::18)
 by DB9PR03MB7706.eurprd03.prod.outlook.com (2603:10a6:10:2c8::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.11; Wed, 10 Jun
 2026 12:45:11 +0000
Received: from AS8PR03MB9746.eurprd03.prod.outlook.com
 ([fe80::cf11:309:1384:58f7]) by AS8PR03MB9746.eurprd03.prod.outlook.com
 ([fe80::cf11:309:1384:58f7%4]) with mapi id 15.21.0113.011; Wed, 10 Jun 2026
 12:45:11 +0000
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
 b=CAzuTfeSUc4P/MiEmlPkECyD1hNXFpooh5GYiiQnkDUtJbhTbZBLTsW6J7EOyxqSChJkuzt9DUDOWs322E+LcjKM/PE7nnc0bPTsBgtvE5M2EA1Lz/4zjFt+ZREnQ5QghnzUgwjTGNEUQyxOgN4Jlur38oXcyXkVQKXv61AiVUkSccRmrectw7nZg2TeDFRQnmR93joU06N3SVAtl4M5o35JPfhlj9jtrVVWAMvPkv753h8f8tFuQ9Ynidhic76Tzah6vOWGBxGfmPhmYoT7aG539pQOf0J2gIp9wjlg7rDjQtj1ViOcJKbNRv5Dkhh/8PUGdwdvQ5CHutp1mwgM6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j/x0rT1oB7OVwr8zqPawvId6h6lac1Z+SScMfAw/LeE=;
 b=LRud86CaDjRzQQhiS9xFRq+bPjAkkx3mNjskn5gpyHKZVG0rz7upjlayGOG6EAmFOV4SSBlwMe/IuBKh+oYdWonmLpG1mraUCUPv9nkbrGLv02LBybHnGLIMhGDkxvBM+Wocv8+SL79XonnC28/a282nsYZmQWAsn6KSw333cZjSlUkiFghiHkx3KqoWy4d9UMm+yO7CdM1tOzJGuf/qernsCAtw3EcZdRdHiF4T87poHk5Eyr2RK0tT5cloqDDKJ7R5TYuVpMHqxaJOa6e9U+zBMbvvVGag/MEhSg0ms79LKzTdzEUkinFArDEAlKSGE38SewzfbE+amPNK/4xhtw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j/x0rT1oB7OVwr8zqPawvId6h6lac1Z+SScMfAw/LeE=;
 b=JRqJ3b57fpOO8zntxFNyuZZNpqPONRlFbV+ycfMAZ++wvMNgwMqEbx6GENFKQ5AZ7N89g/hAxoVTxoEYMPjDjVfHa5BtcQ1KMFph8oCQtjAw5LWj0jGC/sEV5CAcWhzft6gEmzgBJ1JdREQflb5LQVvG/pT6i4M9i6KhEQRFBp+mgRA/daDheruitgEyD4pTlxT18zsLhozMolFHtrNUR8FhUzUQllu60GIXz5LAZ4F7aXLppnGcXBeXmzDMlE2XXUaB3i9C0DBB6GX91n/jQx60jM6FkwjmlyS9sEKpyuOmC6Jx7WSB4F1DAguScJdhr7seIvwpRmvWI0n12OSxUQ==
From: Mykola Kvach <mykola_kvach@epam.com>
To: xen-devel@lists.xenproject.org
Cc: Mykola Kvach <mykola_kvach@epam.com>,
	Mykola Kvach <xakep.amatop@gmail.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Julien Grall <jgrall@amazon.com>,
	Luca Fancellu <luca.fancellu@arm.com>
Subject: [PATCH v11 01/13] xen/arm: Add suspend and resume timer helpers
Date: Wed, 10 Jun 2026 15:44:21 +0300
Message-ID: <c6c326fd9a7e6fce44d97f332a8b5d815ffad841.1781084290.git.mykola_kvach@epam.com>
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
X-MS-TrafficTypeDiagnostic: AS8PR03MB9746:EE_|DB9PR03MB7706:EE_
X-MS-Office365-Filtering-Correlation-Id: 77c52398-2fef-4888-487d-08dec6ee1c87
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|376014|366016|3023799007|56012099006|11063799006|18002099003|22082099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	Ol+8jfu3EV6t1S9G7B7hocjuuZ+LxeWyanHXnFUqrJhjfA0iHbVuZ9iO+03WxNnRZPNvx1BvCL23RJ4H4uTulK+/AE59Z1vdo/dy22cEYw62F79GWPHmJ1n/oVCRNpst2T9+ptlfxGszPeitnKMIbZYeHVJHu90I18KrD07R2k1nxDEFa/PENGTquoW+zzgsHZ8UnUEuAZofqTilJAV0tBa2joKJ+XocbqUkUdkPyXRZnDwN5TPbmn3mF5Gi3YXzkV0RUt6jyOxdkFJ3dtQg+L7d1W5RfXtU4tmCG3T6taoVRKau/r7OalixVkSm+F8XJRU274IKunhrRuGe2R+3c3BAfk7B6MhmQKiKEIWiW2orjhZbOV3gZxiDpMUAeJhq0GJJvdJX5qzWX98OeYWx2yDyUHk70gGLoQkAzpo+ytxzOPcb7aMTolROlq1f6f4ZkrQoaA4ERTLnOuG6JN5YgDVw0GYC+v8jfDGsoZpzeD0fQrOtffVw7Nl1phnBA0Fx5rI33FRtF2l0UiVPCWhT3JY/KhZubrNyurfOsLhvgud8HMD1L0F2QqxKfXd62u303a0zo79eZDwp1PbGaMOnzd0M4oFbcmwfiyHm/iG6yMe3QSD0seSrUmgAzygproHAi4/2X2S7w+qoxKa+Cr2NmdMqpvQODnPR1y6KJreLDepObB+hPSnU1dq+Z6MTavoz
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR03MB9746.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(376014)(366016)(3023799007)(56012099006)(11063799006)(18002099003)(22082099003)(6133799003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?P+SVnulLqut7slHm0nXwtAdhWpljY9N+RSLhuyPRPPkZuBePuh2/Cjb3pHB1?=
 =?us-ascii?Q?xpI5H+MW7V/ZfolGbyPAPEaruiREe0spP/DKw1XHIp6txhtmhNtZCFd4JOL4?=
 =?us-ascii?Q?bAJ0OIeJEie/MCEHkV1UzKsWdQ/mAewaUiQkSms5evtzddCczSzNiBXH+12J?=
 =?us-ascii?Q?npQcO4YrgnXqNOMigcLUL6dBNqMIvGdARkSSXXbpHFLyQFEmxMnbfEoqHZnA?=
 =?us-ascii?Q?g50hSY/r5AnzKiJif1thMgYKAwjOIK8leEXppKq0am1B50xU4c1YpCHncokQ?=
 =?us-ascii?Q?6H6jRlGWro6s3g2bUCSyObhCw0IQ0Vq59FtVMjT/RIdm3a3phSi4u7b56sS+?=
 =?us-ascii?Q?dTsSbcNlAu3imFYj2B0cxr7t8kIbtJ9RQX0S+D4958kNgwSwq+6SyJdNQZ3T?=
 =?us-ascii?Q?m7A/FvOmrL2Z/QxntCyI2bRAogZYz00b+65DonNEjWVm9geUQu7/szCxl/Ji?=
 =?us-ascii?Q?x2+Rcled0WNWyH2AiLuaRrZ3IEoWaAhCV4P8DUo6y58vXZ2xNLHH8sQacgc0?=
 =?us-ascii?Q?RA23TPw5wYDU/EMHFOjKJP4C5ampaOOpk3oUxR3zKBSjElj3sTbVXuTeRRCr?=
 =?us-ascii?Q?sduaPX3ZmfcCuxajFv+GGQB4E/SKehZwgOXB6y+lTygyLA1KAJY2Q8JHtM0i?=
 =?us-ascii?Q?7d4aE6aE9hmiiRl/Zu6sU2nSGR7+NhEu5os5AX9x8mZSZeG7/6uowHmByxdx?=
 =?us-ascii?Q?u9lOIV3Hg/0z1GFOdbYnoxoYnTPQH1d8iKQA96mjL3SDE6DedLG0zrXyo8wl?=
 =?us-ascii?Q?IM/TEtOgdqUo4lUkBipJkNImv8M5a+wdcs1cIkRHpi7oA5gdHelzE2hLdUma?=
 =?us-ascii?Q?wdJfradrojLUo4IJarhSM3LW2R/k7WAb8Yb647SdPS7JnI0CZ5VAdmOOCuC0?=
 =?us-ascii?Q?LovHL+2nC7fQswe5CMC8feEPG5Ej6i5/Zebd1qlPysH7XZa5X71buA7fu0FB?=
 =?us-ascii?Q?fVUQwtAnl0oVkKbMWfeVt6uGJ3jfwtGPBebo0GNrubtwYCDOOPq0iBYwZk+j?=
 =?us-ascii?Q?3Gw4qooihYNyD3qfmY9oFFR29udfa2km/HT2Z9TekdLGhcpoATYxWtqMLK7A?=
 =?us-ascii?Q?4kyXOwwMRVGja3kNf/jnGbYv79QWy9hxz65B9wHRM9FgPoJUxg75/NHw/4FS?=
 =?us-ascii?Q?l/HiR4PXey6Bz3Ji6We1gdMVYlYl8iCtCYGtbLwToCgp/Vlie6+7Hvftenrf?=
 =?us-ascii?Q?neg2VZZFkNRBxr4a8VDm+1bBRWUh2tREz9m5fOHX1WQKsMFpUVEGS0mXJzGu?=
 =?us-ascii?Q?bxsfyED1SmV5wNGxtQozDdb1ZDHvfCaNez7fvRZII+b7CTwh//TnLO+507sL?=
 =?us-ascii?Q?8NoSf7O7e4TxW+ZBFbDUxmBQS2wfrgrnvSiERndaFaGvEdq8Tvbvpf5bWgm7?=
 =?us-ascii?Q?WjDFJSkD6OccLXXq6/o7Ky5gtERKs0yyG/FYcaiPmK4KfUkyWkhN2NEijJ2H?=
 =?us-ascii?Q?CiC+zoRV/lHhZbCYv2NhU/NPaDnpm17cto843O8HRSTUJAQyjjlOCZ0/Q+rS?=
 =?us-ascii?Q?aB0KsGpSOd32OS0fbEe9qzqglRrTY2mTAWwjySFEPyVrGLnAEWtf+TYa8Fu0?=
 =?us-ascii?Q?DCzrp5Z6kqIfSVurVPcM23bMC/Bfrpz/7JBfuS6lM8xytVCr9jJqW4uadj2h?=
 =?us-ascii?Q?fAcnwpOhn9042Xz/5/eO64RIMbZUA9lYg6gBWHPXlV7V2kUzP5jlEkEla8Q5?=
 =?us-ascii?Q?7VI3PyLODFOdrD14YqgyZXGaAz8wlNVkj8eMQLtCEL/LqRRa9HJRXhaokHLp?=
 =?us-ascii?Q?3LFbaaKnAw=3D=3D?=
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 77c52398-2fef-4888-487d-08dec6ee1c87
X-MS-Exchange-CrossTenant-AuthSource: AS8PR03MB9746.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2026 12:45:11.7839
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DB721hZWBwKcinEDQskQE576MKSSHCTw/61XlPMljuAPqkBqPcT+e8BqRoZGDEDw01vZaVcoPvZLLyJljSDnXQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR03MB7706
X-purgate-ID: tlsNG-c1860d/1781095513-BCB64DB1-9DF22876/0/0
X-purgate-type: clean
X-purgate-size: 5064
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.81 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[epam.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[epam.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[epam.com,gmail.com,kernel.org,xen.org,arm.com,amd.com,amazon.com];
	FORWARDED(0.00)[mailman];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[mykola_kvach@epam.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:mykola_kvach@epam.com,m:xakep.amatop@gmail.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:jgrall@amazon.com,m:luca.fancellu@arm.com,m:xakepamatop@gmail.com,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[arm.com:email];
	FROM_NEQ_ENVFROM(0.00)[mykola_kvach@epam.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[epam.com:+];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	RCPT_COUNT_SEVEN(0.00)[10];
	TO_DN_SOME(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 979C76696AB

From: Mirela Simonovic <mirela.simonovic@aggios.com>

Timer interrupts must be disabled while the system is suspended to prevent
spurious wake-ups. Suspending timers in Xen consists of disabling the
physical timer and the hypervisor timer on the current CPU. The virtual
timer does not need explicit handling here, as it is already disabled on
vCPU context switch and its state is restored per-vCPU on the next context
restore.

Resuming consists of raising TIMER_SOFTIRQ, which prompts the generic
timer code to reprogram the hypervisor timer with the correct timeout.

Xen does not use or expose the physical timer, so it remains disabled
across suspend/resume.

Introduce a new helper, disable_phys_hyp_timers(), to encapsulate disabling
of the physical and hypervisor timers.

Signed-off-by: Mirela Simonovic <mirela.simonovic@aggios.com>
Signed-off-by: Saeed Nowshadi <saeed.nowshadi@xilinx.com>
Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
Acked-by: Julien Grall <jgrall@amazon.com>
Reviewed-by: Luca Fancellu <luca.fancellu@arm.com>
---
Changes in V7:
  - Dropped EL1/EL2 wording; use "physical timer" and "hypervisor timer"
  - Renamed helper to disable_phys_hyp_timers() to reflect its actual scope
  - Clarified virtual timer handling (disabled on vCPU switch-out, restored
    on context restore) and added comments in suspend/resume paths
  - Added resume comment explaining which timers are restored by
    TIMER_SOFTIRQ
---
 xen/arch/arm/include/asm/time.h |  5 ++++
 xen/arch/arm/time.c             | 44 ++++++++++++++++++++++++++++-----
 2 files changed, 43 insertions(+), 6 deletions(-)

diff --git a/xen/arch/arm/include/asm/time.h b/xen/arch/arm/include/asm/time.h
index c194dbb9f5..9313b157ea 100644
--- a/xen/arch/arm/include/asm/time.h
+++ b/xen/arch/arm/include/asm/time.h
@@ -105,6 +105,11 @@ void preinit_xen_time(void);
 
 void force_update_vcpu_system_time(struct vcpu *v);
 
+#ifdef CONFIG_SYSTEM_SUSPEND
+void time_suspend(void);
+void time_resume(void);
+#endif /* CONFIG_SYSTEM_SUSPEND */
+
 #endif /* __ARM_TIME_H__ */
 /*
  * Local variables:
diff --git a/xen/arch/arm/time.c b/xen/arch/arm/time.c
index 6955b2788f..fff8e4aca6 100644
--- a/xen/arch/arm/time.c
+++ b/xen/arch/arm/time.c
@@ -296,6 +296,14 @@ static void check_timer_irq_cfg(unsigned int irq, const char *which)
 static DEFINE_PER_CPU_READ_MOSTLY(struct irqaction, irq_hyp);
 static DEFINE_PER_CPU_READ_MOSTLY(struct irqaction, irq_virt);
 
+/* Disable physical and hypervisor timers on the current CPU */
+static inline void disable_phys_hyp_timers(void)
+{
+    WRITE_SYSREG(0, CNTP_CTL_EL0);    /* Physical timer disabled */
+    WRITE_SYSREG(0, CNTHP_CTL_EL2);   /* Hypervisor's timer disabled */
+    isb();
+}
+
 /* Set up the timer interrupt on this CPU */
 void init_timer_interrupt(void)
 {
@@ -306,9 +314,7 @@ void init_timer_interrupt(void)
     WRITE_SYSREG64(0, CNTVOFF_EL2);     /* No VM-specific offset */
     /* Do not let the VMs program the physical timer, only read the physical counter */
     WRITE_SYSREG(CNTHCTL_EL2_EL1PCTEN, CNTHCTL_EL2);
-    WRITE_SYSREG(0, CNTP_CTL_EL0);    /* Physical timer disabled */
-    WRITE_SYSREG(0, CNTHP_CTL_EL2);   /* Hypervisor's timer disabled */
-    isb();
+    disable_phys_hyp_timers();
 
     hyp_action->name = "hyptimer";
     hyp_action->handler = htimer_interrupt;
@@ -333,9 +339,7 @@ void init_timer_interrupt(void)
  */
 static void deinit_timer_interrupt(void)
 {
-    WRITE_SYSREG(0, CNTP_CTL_EL0);    /* Disable physical timer */
-    WRITE_SYSREG(0, CNTHP_CTL_EL2);   /* Disable hypervisor's timer */
-    isb();
+    disable_phys_hyp_timers();
 
     release_irq(timer_irq[TIMER_HYP_PPI], NULL);
     release_irq(timer_irq[TIMER_VIRT_PPI], NULL);
@@ -375,6 +379,34 @@ void domain_set_time_offset(struct domain *d, int64_t time_offset_seconds)
     /* XXX update guest visible wallclock time */
 }
 
+#ifdef CONFIG_SYSTEM_SUSPEND
+
+void time_suspend(void)
+{
+    /* CNTV already disabled by virt_timer_save() during vcpu context switch. */
+    disable_phys_hyp_timers();
+}
+
+void time_resume(void)
+{
+    /*
+     * Raising TIMER_SOFTIRQ triggers generic timer code to reprogram the
+     * hypervisor timer with the correct timeout (not known here).
+     *
+     * Xen doesn't use or expose the physical timer, so it remains disabled
+     * across suspend/resume.
+     *
+     * The virtual timer state is restored per-vCPU on the next context switch.
+     *
+     * No further action is needed to restore timekeeping after power down,
+     * since the system counter is unaffected. See ARM DDI 0487 L.a, D12.1.2
+     * "The system counter must be implemented in an always-on power domain."
+     */
+    raise_softirq(TIMER_SOFTIRQ);
+}
+
+#endif /* CONFIG_SYSTEM_SUSPEND */
+
 static int cpu_time_callback(struct notifier_block *nfb,
                              unsigned long action,
                              void *hcpu)
-- 
2.43.0


