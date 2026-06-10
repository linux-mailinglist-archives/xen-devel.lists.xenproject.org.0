Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id h4HlGdpcKWr1VgMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 10 Jun 2026 14:47:22 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F072B669690
	for <lists+xen-devel@lfdr.de>; Wed, 10 Jun 2026 14:47:21 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=epam.com header.s=selector1 header.b=kmOWDSno;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=quarantine) header.from=epam.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1334253.1597341 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wXIKm-0001KJ-Ir; Wed, 10 Jun 2026 12:47:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1334253.1597341; Wed, 10 Jun 2026 12:47:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wXIKm-0001Is-EU; Wed, 10 Jun 2026 12:47:04 +0000
Received: by outflank-mailman (input) for mailman id 1334253;
 Wed, 10 Jun 2026 12:44:58 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Mykola_Kvach@epam.com>) id 1wXIIk-00017n-4a
 for xen-devel@lists.xenproject.org; Wed, 10 Jun 2026 12:44:58 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wXIIj-009Dx3-9q
 for xen-devel@lists.xenproject.org; Wed, 10 Jun 2026 14:44:57 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Mykola_Kvach@epam.com>)
 id 6a295c44-bab6-0a2a0a5309dd-0a2a4507bd70-10
 for <xen-devel@lists.xenproject.org>; Wed, 10 Jun 2026 14:44:57 +0200
Received: from [52.101.65.132]
 (helo=DU2PR03CU002.outbound.protection.outlook.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <Mykola_Kvach@epam.com>)
 id 6a295c48-229c-0a2a45070019-346541848232-3
 for <xen-devel@lists.xenproject.org>; Wed, 10 Jun 2026 14:44:57 +0200
Received: from AS8PR03MB9746.eurprd03.prod.outlook.com (2603:10a6:20b:61d::18)
 by DB9PR03MB7706.eurprd03.prod.outlook.com (2603:10a6:10:2c8::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.11; Wed, 10 Jun
 2026 12:44:54 +0000
Received: from AS8PR03MB9746.eurprd03.prod.outlook.com
 ([fe80::cf11:309:1384:58f7]) by AS8PR03MB9746.eurprd03.prod.outlook.com
 ([fe80::cf11:309:1384:58f7%4]) with mapi id 15.21.0113.011; Wed, 10 Jun 2026
 12:44:54 +0000
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
 b=BK0xhJ8lEVc05sY8oLcuo6DNM0q8J6iONWuYGOcY0bilY2v0BwmyMzGOk2xsEblVIi5nig5b1iFHXHM5Ck+otmQHaDTCSDd2MSx3nb0oXKxbmRMx326ZvyLJXcg6UUVx2BpFx5QdaUw94tEhn8QP+VP1IKfz58rOEKoZU76YGGHRimALuSTRvUPod7vKfld64SoXUdZcOAdgJRFU74i6ExxWS81e3jJl6jMWVOSDroUGpOXSUf0ahlflecr9h0w+D9b3KH2cCvfgipPckbjEBDqvUO2qn198fwnCbcg2MVjAHuoZPUcwrizkPgjlOUb7fg9cuUvuUWwB5QIUVn9bmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=geZCPGGVe3t5qiSzHFGv7JpUvpI0ztKOEZwmaUd1wnk=;
 b=gCb3ggPvfEvva7MFxm3gVs7fokgRccr/1P3ZV8B5l8jGScKWsHqAB/s0E34Gz1lI4Pj5MzVNLLQ6prex8d4WwOB7EhaNeg2B0K/6hEk4gkCLg6bM4+AnZYwsxnqlWSzvL2O9c0oeNI00jTkTBoCuiF0mh4V2jbBVaJCdaiibRKcw6MQiA/h2AGCiGFa4YEs9hSUxlbOysL8tkD9qfZlcIgfpqq/K3vx1cHa8Qp8OmxLKcyeE50KbvqRZZHEyfJBongJo0FqUWH409LnPwUA8X8SWVxlthpvD5Qw5FZ+Se8lVjhjFWjNqp+N+3BQswiD85dlA7b7hkP4q+OvdvTqECA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=geZCPGGVe3t5qiSzHFGv7JpUvpI0ztKOEZwmaUd1wnk=;
 b=kmOWDSnoyntImsS+a89308ZBee8fVwd5jeTmzb6G8uGKRXilkcW151P/IH1CDtpGHw6Fi6VlIto9XhcCByxmk1IZda+zlWXi2FQacKhdMhYEyqTiVxn/vg7LyiuBclaTVR2vNT0LWXIlN1z67RXL3eWLNINh2qaxLrmo/lbXzl0gx4z40imBJZGIAQg8AtoGwOAs0ocWfTYLyijCE7UtxkTTEupXr7DyYAzxLl4N/LLYo7z+LNJ0LauIqk1xhTAY1id0IAq5Ia0lY23U2h+NlyvoML9QavPew1Pq8wELCq79PDI+7TPJB6sTGWpfT0tRrO2K7WJIGZlVEJ0agQrD7A==
From: Mykola Kvach <mykola_kvach@epam.com>
To: xen-devel@lists.xenproject.org
Cc: Mykola Kvach <mykola_kvach@epam.com>,
	Mykola Kvach <xakep.amatop@gmail.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Jan Beulich <jbeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Jens Wiklander <jens.wiklander@linaro.org>,
	Rahul Singh <rahul.singh@arm.com>
Subject: [PATCH v11 00/13] Add initial Xen Suspend-to-RAM support on ARM64
Date: Wed, 10 Jun 2026 15:44:20 +0300
Message-ID: <cover.1781084290.git.mykola_kvach@epam.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: WA1P291CA0008.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:19::19) To AS8PR03MB9746.eurprd03.prod.outlook.com
 (2603:10a6:20b:61d::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR03MB9746:EE_|DB9PR03MB7706:EE_
X-MS-Office365-Filtering-Correlation-Id: 48487aa9-903c-4c05-3b6b-08dec6ee11f1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|376014|7416014|366016|5023799004|56012099006|11063799006|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	bndTJzf6PsgdEfKwvJ9ieJBHIGelVZPjDuKPKOT/HSHQUnLvwlWX1zi+pDWkNmuhddy1Y54N+Ef+mm3yhW6/C5aBtN5X2dix9c7pFZIvcm4Mf3rgsihqLupypotMWh9aQFr3fFy/f88vSwn6X1jttu99qOEGlFO++e00fWTH52bfxfRRYxD+xGG0RVlRBcmxD9nF2hj0/OSLTt5tMbPMiZRa+WBdVVFVYTFCvsPGJlUlK3fikwqEicXX5+LceMXgWq+DTVwnHFmrhBiktr+gXI75Gf1xkh+hut5mW5QFBxN0Ts6BfVVhi1NvjhOmOMtDy1PV3CVStTiQrpJrvaiXnOcTHhgA/juUhF6cbRzTZlEA+hRNQxQNxBD2x3NZ3pXPAk4jE4xiEyd1bf7kJL6QFkLXMwGXoiCgeo7fGGTm2MmmiptK71I5gjn6WtHNjWdYVo5KRIemW2jffxmrBd99zTmOpyo4xKmjr9OwL8CNme6e9nNWuCA6JPcgO0fxB/uYhXKkKRY46ICKiB9ZlcsXx4Tvjo2ijhXmupAyVmf+iADx2BCybj3YzWvO2yVU1/Hew53XE6YMEZ/z9tYIMoiC6S+6t1LhGUxTAd+wxKIi0uTbVApMq20uwPVUAJzi7AnAdOFbym0LFOHf6hXs9qzgvAonGrnnSnu5Wa1MTl/T7UFhQReDaKGK2eBcNPdmpoZh
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR03MB9746.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(376014)(7416014)(366016)(5023799004)(56012099006)(11063799006)(18002099003)(6133799003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Iyq45izxAnRDODyx7wnYr/+xa5y2oeYzJ2sUZ32gak9FwUyonKJMEUnH6VBB?=
 =?us-ascii?Q?/C2gvAkfRYQ/SVXna06BXdkN+gFh0CaENuIuK1Iq7ab2G24q4H/q0m9PY6cI?=
 =?us-ascii?Q?MCpeLzMPNXP/ZkAgxOl7gxlLYrUFbecJPxxuTuuV1leSlS7Wpw2FvX3kMWF3?=
 =?us-ascii?Q?t2md/osgGLh0HfsOL42R1M1OeU14CZchSoxSiESYdA/NqvqRs1trlH3cCd9k?=
 =?us-ascii?Q?k62cnP9f3CRcxpIT9sBpXgE3r+ghgJyt5rLVnzz/i1BkqakcQA8OjLsfHFtE?=
 =?us-ascii?Q?He/McApN0nHdjHgfp2KgNJeYnCIf6T1M2QVrG7T9zhsRiffs7G/F2raUpOHe?=
 =?us-ascii?Q?IOXC9jEouONle8Z47TWhzKrlAKB4FtVgAxx/yZ1JMtJpjlO1fXZ7ub5XhpJT?=
 =?us-ascii?Q?bG6iGJG/+SwPfk8g8MoJXqfk+GMnpxKDTHBAuGrvZOF8hltgqu1jRRSEr5CV?=
 =?us-ascii?Q?kSNx4/5cTbL5KuhrL0RM8CYUtHrxFalfUtpkspHx09K4cjozy4Q6UcESXhqy?=
 =?us-ascii?Q?l7/4oOlTRiVOZ9lGyYkIz5jXnAqOveZkoG357/QT0Gi2QldxZLxFTM2OhYgh?=
 =?us-ascii?Q?abq7aFJPPezPaQF59gl7UqB8wyqGaG6+ZoOlZi1aLWXexGGyhpzPkLDbgKo6?=
 =?us-ascii?Q?cSjAPSaPiJZFUgZTrJyFQvCUgjpFGRoVeLhx+97CVSKIvTrp7hagQzsaUdVl?=
 =?us-ascii?Q?Te42QB09tyrJuEOOwvEMyi7qjqO41rXn5pTeqezNW2Jp6pOH7FNrZDcXmG99?=
 =?us-ascii?Q?CIqfUuKCJ+/v0WqI7kPgv2VHh+RATZ+qnapx/atKoViaZp6LtgVDKlZj7lII?=
 =?us-ascii?Q?z20Jxf1jjcrM3pAACOK/SsLDvvYar4KZRJqcnos/e4Np0k3EvcuKlb0vnGHC?=
 =?us-ascii?Q?MlbtKWBxSOnMQjbIa8yX9Mofnj3SyA4GlTv5XIh5KlRqghGqLLJ6WXT1d/jS?=
 =?us-ascii?Q?bhyeDxfszTCtz2CAVBSudbfOTVpqXMjlHzAohuNgi07jybYVlAD86mRHbCaa?=
 =?us-ascii?Q?rpTyPxH4dU6WwY4ekHSww1bC+dm3/eGbu9O8rnOXpmONefmgusYN7WCVe7Kg?=
 =?us-ascii?Q?dlkTcyRYLueV7CqsZPDvMQn3oTbHGs+4hAxlbxbda/5BZX8hFbL1lw3V3DoP?=
 =?us-ascii?Q?pCYYCnYCSBsMf0+vyIWqypNGKCNWb/3Rakb1h60+PYAmhSH3+ccsxT52SE3O?=
 =?us-ascii?Q?bCeybGsNikZA/nsI0ChM97n+R5Fg85j7kvB8MLNXNXr1PzYiU/EXkwb0nDFA?=
 =?us-ascii?Q?DiENdredxsJKKq6pWbR7z97bKflqM2HeT9eCtUZN4KD3lDP+2ZDqR2eWVNax?=
 =?us-ascii?Q?tiMufb4DSWJJ9GSzitsIUjlKoBxKHyzZTJ0AT9yvbKA+1JENc9UFEYcOkpSJ?=
 =?us-ascii?Q?fy3tKd8XNmuufdt/j2zHj4GBKp1cKSOMn/bMUZu4KVajo6iaE3PzZ6vV9eXt?=
 =?us-ascii?Q?gJO2QhOXiKXJq4ZY2JqDq7k5+xTUkktMb/4Uh6Z5gIqrobGPxBvZ9JlrrtCc?=
 =?us-ascii?Q?7M2deBOp+ISqWP8GHL54smMCqAtI5tBKqGSJ7/MohwkDiGFqE897YI26RLcw?=
 =?us-ascii?Q?Y3mo5dCYbIwnFWrRA49GKGDeskttn/ewY3EC2Ghk1xOt9PRZU1SGLueDbFOL?=
 =?us-ascii?Q?OtPQ0pmOJLAHsOfXFDI823ac/2M3m7/2RhnpKnoeQI2gzlo/6dE9jIbu7Veo?=
 =?us-ascii?Q?Q9J7O00f0mgdgLF0d6ib/kqYeUVrFn5PCyHqMvwrRdk1lbVd/MIz3iP5snTm?=
 =?us-ascii?Q?27ShEQRY3Q=3D=3D?=
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 48487aa9-903c-4c05-3b6b-08dec6ee11f1
X-MS-Exchange-CrossTenant-AuthSource: AS8PR03MB9746.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2026 12:44:54.0992
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: i4+uV71QQtV3fQvtS1Ogy7zn1g44K4WCGKuCGJ/6K10GE66Vaoa6QxZa0koWIkPd1Ppp6JhVbUUKWm53MIEKmA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR03MB7706
X-purgate-ID: tlsNG-ef75cf/1781095497-0B57BC48-78E68EDD/0/0
X-purgate-type: clean
X-purgate-size: 8546
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.81 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[epam.com,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[epam.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:mykola_kvach@epam.com,m:xakep.amatop@gmail.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:jbeulich@suse.com,m:roger.pau@citrix.com,m:jens.wiklander@linaro.org,m:rahul.singh@arm.com,m:xakepamatop@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[mykola_kvach@epam.com,xen-devel-bounces@lists.xenproject.org];
	RCPT_COUNT_TWELVE(0.00)[14];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[mailman];
	FREEMAIL_CC(0.00)[epam.com,gmail.com,kernel.org,xen.org,arm.com,amd.com,citrix.com,vates.tech,suse.com,linaro.org];
	DKIM_TRACE(0.00)[epam.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mykola_kvach@epam.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: F072B669690

This is part 2 of the ARM Xen system suspend/resume patch series, based
on earlier work by Mirela Simonovic and Mykyta Poturai.

Part 1, covering guest suspend functionality, is already in mainline.

NOTE: Host-wide suspend/resume support is guarded by CONFIG_SYSTEM_SUSPEND,
which can currently only be selected when UNSUPPORTED is set, and thus the
host suspend backend is neither enabled by default nor built in supported
configurations. The separate HAS_HWDOM_SYSTEM_SUSPEND policy bit only changes
how ARM treats SHUTDOWN_suspend from the hardware domain; it does not enable
the host-wide suspend backend by itself.

This version is ported to Xen master and includes extensive improvements
based on reviewer feedback. The patch series restructures code to improve
robustness and maintainability, and implements initial ARM64 host-wide
Suspend-to-RAM support driven by control-domain PSCI SYSTEM_SUSPEND
requests. vPSCI also exposes SYSTEM_SUSPEND as a domain suspend operation
for all domains; attempt-time host-suspend policy failures are reported as
PSCI_DENIED rather than hidden through PSCI_FEATURES.

Key updates in this series:
 - Introduced architecture-specific suspend/resume infrastructure
 - Integrated GICv2/GICv3 suspend and resume, including memory-backed context
   save/restore with error handling
 - Added time and IRQ suspend/resume hooks, ensuring correct timer/interrupt
   state across suspend cycles
 - Implemented proper PSCI SYSTEM_SUSPEND invocation and version checks
 - Added vPSCI SYSTEM_SUSPEND policy for domain suspend and host-wide
   control-domain sequencing
 - Improved state management and recovery in error cases during suspend/resume
 - Added support for IPMMU-VMSA/SMMUv3 context save/restore
 - Added support for GICv3 eSPI registers context save/restore
 - Added support for ITS registers context save/restore
---

TODOs:
 - Enable "xl suspend" support on ARM
 - Add suspend/resume CI test for ARM (QEMU if feasible)
 - PCI suspend ?
---

Detailed changelogs can be found in each patch.

Changes in v11:
- Keep SMMUv3 reset helpers in init text when CONFIG_SYSTEM_SUSPEND is
  disabled.
- Update host suspend policy blockers after review: make the runtime gate
  __ro_after_init, log the SMMUv3 MSI blocker only once, and wrap the Arm
  IOMMU blocker in CONFIG_SYSTEM_SUSPEND.

Changes in v10:
- Clarify the vPSCI SYSTEM_SUSPEND policy summary: keep SYSTEM_SUSPEND
  advertised once implemented and return PSCI_DENIED, rather than
  PSCI_NOT_SUPPORTED, for attempt-time host-suspend policy failures.
- Tighten GICv2/GICv3 suspend/resume based on review feedback: avoid
  reserved interrupt register ranges, check visible active-priority state,
  restore configuration before enable state, and re-enable the redistributor
  before restoring CPU/virtual interface state on abort paths.
- Refine ITS resume so MAPC is replayed only for ITS-backed collections and
  clarify the collection-ID assumptions.
- Rework IPMMU and SMMUv3 resume/suspend handling, including root-before-cache
  IPMMU restore ordering and disabling SMMU interrupt generation before
  suspend.
- Save and restore CNTHCTL_EL2 in the arm64 CPU resume context and simplify
  the resume trampoline/context hand-off.
- Re-apply boot CPU errata/workaround handling after SYSTEM_SUSPEND and move
  set_init_ttbr() declaration to asm/mmu/mm.h.
- Update patch 12 details: shorten SYSTEM_SUSPEND blocker logs, use %pd for
  control-domain logging, mark serial_suspend_available as __ro_after_init,
  and mention the xen/suspend.h struct domain forward declaration.

Changes in v9:
- Split the control-domain SYSTEM_SUSPEND flow so host availability,
  runtime blockers and domain-readiness checks are handled separately from
  the host suspend backend.
- Gate vPSCI SYSTEM_SUSPEND on cached host PSCI support and Xen runtime
  suspend blockers, and log firmware support during initialization.
- Fold the arm64 resume trampoline into the CPU context save/restore patch
  and use asm-offsets-generated RESUME_CTX_* definitions for the assembly
  save/restore path.
- Tighten the GICv2/GICv3/ITS/IPMMU/SMMUv3 suspend/resume paths based on
  review feedback, including state-save/restore fixes and safer failure
  handling.
- Reorder the host suspend/resume phases so timer and GIC state are
  handled with local IRQs disabled and restored before console/IOMMU
  resume.

Changes in v8:
- Rebased to latest master and refreshed the series accordingly.
- Added a new GICv3 patch to tolerate retained redistributor LPI state
  across CPU_OFF/CPU_ON.
- GICv2 suspend now disables the CPU interface and distributor before
  saving state.
- GICv3 suspend/resume fixes the redistributor base used for LPI state.
- ITS and SMMUv3 suspend/resume paths were tightened, with safer
  restore/rollback handling and stricter fatal-error handling.
- System suspend now checks that all domains are already in
  SHUTDOWN_suspend before proceeding, and renames the hardware-domain
  suspend capability/helper for clearer semantics.
- Fixed alignment/cleanup issues in the low-level suspend/resume code.

Changes in v7:
- Timer helper renamed/clarified; virtual/hyper/phys handling documented.
- GICv2 uses one context block; restore saved CTLR; panic on alloc failure.
- GICv3/eSPI/ITS always suspend/resume; restore LPI/eSPI; rdist timeout.
- IPMMU suspend context allocated before PCI setup.
- System suspend: control domain drives host suspend.
- Dropped v6 IRQ descriptor restore patches; use setup_irq and re-register
  local IRQs on resume instead.

For earlier changelogs, please refer to the previous cover letters.

Mirela Simonovic (5):
  xen/arm: Add suspend and resume timer helpers
  xen/arm: gic-v2: Implement GIC suspend/resume functions
  xen/arm64: Save/restore CPU context across SYSTEM_SUSPEND
  xen/arm: Implement PSCI SYSTEM_SUSPEND call (host interface)
  xen/arm: Add host system suspend backend

Mykola Kvach (7):
  xen/arm: gic-v3: tolerate retained redistributor LPI state across
    CPU_OFF
  xen/arm: gic-v3: Implement GICv3 suspend/resume functions
  xen/arm: gic-v3: add ITS suspend/resume support
  xen/arm: tee: keep init_tee_secondary() for hotplug and resume
  xen/arm: ffa: fix notification SRI across CPU hotplug/suspend
  xen/arm: smmu-v3: add suspend/resume handlers
  xen/arm: Add vPSCI SYSTEM_SUSPEND policy

Oleksandr Tyshchenko (1):
  iommu/ipmmu-vmsa: Implement suspend/resume callbacks

 xen/arch/arm/Kconfig                     |   2 +
 xen/arch/arm/Makefile                    |   1 +
 xen/arch/arm/arm64/asm-offsets.c         |  21 +
 xen/arch/arm/arm64/head.S                | 122 ++++++
 xen/arch/arm/cpuerrata.c                 |   7 +-
 xen/arch/arm/gic-v2.c                    | 226 +++++++++++
 xen/arch/arm/gic-v3-its.c                | 146 ++++++-
 xen/arch/arm/gic-v3-lpi.c                |  80 +++-
 xen/arch/arm/gic-v3.c                    | 482 ++++++++++++++++++++++-
 xen/arch/arm/gic.c                       |  35 ++
 xen/arch/arm/include/asm/arm64/sysregs.h |   5 +
 xen/arch/arm/include/asm/cpuerrata.h     |   1 +
 xen/arch/arm/include/asm/gic.h           |  16 +
 xen/arch/arm/include/asm/gic_v3_defs.h   |   3 +
 xen/arch/arm/include/asm/gic_v3_its.h    |  28 ++
 xen/arch/arm/include/asm/mmu/mm.h        |   2 +
 xen/arch/arm/include/asm/psci.h          |   4 +
 xen/arch/arm/include/asm/suspend.h       |  37 ++
 xen/arch/arm/include/asm/time.h          |   5 +
 xen/arch/arm/mmu/smpboot.c               |   2 +-
 xen/arch/arm/psci.c                      |  38 +-
 xen/arch/arm/suspend.c                   | 210 ++++++++++
 xen/arch/arm/tee/ffa_notif.c             |  63 ++-
 xen/arch/arm/tee/tee.c                   |   2 +-
 xen/arch/arm/time.c                      |  44 ++-
 xen/arch/arm/vpsci.c                     | 120 +++++-
 xen/common/Kconfig                       |   3 +
 xen/common/domain.c                      |   7 +-
 xen/drivers/char/serial.c                |  12 +
 xen/drivers/passthrough/arm/iommu.c      |   6 +
 xen/drivers/passthrough/arm/ipmmu-vmsa.c | 323 ++++++++++++++-
 xen/drivers/passthrough/arm/smmu-v3.c    | 203 ++++++++--
 xen/include/xen/list.h                   |  14 +
 xen/include/xen/serial.h                 |   1 +
 xen/include/xen/suspend.h                |   2 +
 35 files changed, 2169 insertions(+), 104 deletions(-)
 create mode 100644 xen/arch/arm/suspend.c

-- 
2.43.0


