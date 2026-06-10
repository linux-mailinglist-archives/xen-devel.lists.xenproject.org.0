Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id W4Z/H9lcKWroVgMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 10 Jun 2026 14:47:21 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BB74866967E
	for <lists+xen-devel@lfdr.de>; Wed, 10 Jun 2026 14:47:20 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=epam.com header.s=selector1 header.b=IB7KvO2s;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=quarantine) header.from=epam.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1334262.1597365 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wXIKn-0001hq-QR; Wed, 10 Jun 2026 12:47:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1334262.1597365; Wed, 10 Jun 2026 12:47:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wXIKn-0001bO-GM; Wed, 10 Jun 2026 12:47:05 +0000
Received: by outflank-mailman (input) for mailman id 1334262;
 Wed, 10 Jun 2026 12:45:26 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Mykola_Kvach@epam.com>) id 1wXIJC-0001BR-FD
 for xen-devel@lists.xenproject.org; Wed, 10 Jun 2026 12:45:26 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wXIJB-007rkt-SI
 for xen-devel@lists.xenproject.org; Wed, 10 Jun 2026 14:45:25 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Mykola_Kvach@epam.com>)
 id 6a295c63-e002-0a2a0a5209dd-0a2a4509d228-14
 for <xen-devel@lists.xenproject.org>; Wed, 10 Jun 2026 14:45:25 +0200
Received: from [52.101.83.85]
 (helo=GVXPR05CU001.outbound.protection.outlook.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <Mykola_Kvach@epam.com>)
 id 6a295c64-2497-0a2a45090019-3465535525e5-3
 for <xen-devel@lists.xenproject.org>; Wed, 10 Jun 2026 14:45:25 +0200
Received: from AS8PR03MB9746.eurprd03.prod.outlook.com (2603:10a6:20b:61d::18)
 by AM9PR03MB7558.eurprd03.prod.outlook.com (2603:10a6:20b:415::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.11; Wed, 10 Jun
 2026 12:45:22 +0000
Received: from AS8PR03MB9746.eurprd03.prod.outlook.com
 ([fe80::cf11:309:1384:58f7]) by AS8PR03MB9746.eurprd03.prod.outlook.com
 ([fe80::cf11:309:1384:58f7%4]) with mapi id 15.21.0113.011; Wed, 10 Jun 2026
 12:45:22 +0000
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
 b=qy4btD1g19thg/5ndVWseDM7RDshRK1JCBA7zwZujGtdEJRN7Fz59HX4jvgUaFZlDp2rda4/ves/k9N34bbzVuBmy/HwXmU+uO0Ar98ZRem1e+V1p+8poJtFQPKH5wK/EO5zDhowoUtiUOoaOLiLT9uXXTbQ9ms9I0EUTkPLLg/y+gRlyFHzChM6fRlRXH7XVqoWSs6l5cpqfwGY6vwktpq+9n24XNuh7gcpXPN8MPC2XtE97/DDkwXsJEyCeiD+STjkInDRfMESFSM5B9kIdEQsXfNm0ch52botRrDi/9OcNcUR+Su4wYLY/4YR92fP97OYaolOn065twiNopjZjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dh3U6cg6sHHug97rKagQGLrX6CLgD+gnss748WpNxZQ=;
 b=QPiyIhKJiqhxJEK3o/SeEcpBPEOmEqmp7qBFrvn4WT1jSixx3jt/jhxV9W7LY8/9VOpCvTEH4/ADl6ovx8wA52yWR4JgtMAPXWaqyw37j0htcwZ9QXkkDF7SvKuCmSR5LGqbnduQJn1Sj/HfT10TiWNZM/8BWV/T/RjHT7/TUCH1umpx86WEeg2r+roGqs3I92X75kN5Z3hgsKUhKFnZ3YNK9oCiiuSAjiQMk9cbFZpyJQdWDqMvAuo7kBFWsl6kybBypoYjmMYtkhUi2aIPoVFIdlPnbm08bnTQEapV4gD7VjkwC2dtky0weMrsaArDdiHQPLQ1/kK/1pryNkR+sw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dh3U6cg6sHHug97rKagQGLrX6CLgD+gnss748WpNxZQ=;
 b=IB7KvO2sIvl96NC4E3kvRZwIg5d2te25hE/I5Y/4J3AgoQkGyFT/kJ7YdCmNyg0jTNpvm33ZWtyRJf9FEdgeskv/i4woJiqIRH5TWVx5coXhdMLjZyYFK5DM2j4uhkWK92rdTo/e4OAXegqZ4fzJOhqMcFiSLKCpp+XfqShQdzhWy2Kx3VDJspUEjZ8nEyH0hJYJD7T8PAxlb0XIpx5jFzmOmX4Bvq3CwnIk1AjnBjA41Ak7eDiWqFEXT/RBgweKe8IsfEjmSfBQznp8Oz321b3dsuEPiJczLHyPZkAHULWRwtz14O8KQLEN4iSzR2veKPJKB19oXRuuYV7gfeTjNw==
From: Mykola Kvach <mykola_kvach@epam.com>
To: xen-devel@lists.xenproject.org
Cc: Mykola Kvach <mykola_kvach@epam.com>,
	Mykola Kvach <xakep.amatop@gmail.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Luca Fancellu <luca.fancellu@arm.com>
Subject: [PATCH v11 04/13] xen/arm: gic-v3: Implement GICv3 suspend/resume functions
Date: Wed, 10 Jun 2026 15:44:24 +0300
Message-ID: <51618361a911b527c1aaa4ab6a96bd1bd2239006.1781084290.git.mykola_kvach@epam.com>
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
X-MS-Office365-Filtering-Correlation-Id: ca39d394-72d2-4762-4d76-08dec6ee22ea
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|1800799024|376014|56012099006|11063799006|5023799004|6133799003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	58OIdrEZlRntCfwn5jBxKsoFpmLtkg4ySRJIZZjWAg+OayzHu0D3IvqsL1qsx1DaLcPIDgq5Tt1UgseHdOua8RSrA84EZFp1wOqK8HS1ANny71S69k4TezP9E7UoYtR0clDX4cISoQW5w6vVDAt81FijF4VbWhpIf50aUcNuN3IRFAIAkymgsppph2YSlDDFoKRu1xPG1EYAz9GMAgCjEdJ0rcXMKAkj69ZvDH5FdPEYt1zwJWgk/AKUpUw7fOxWmnRiKhhPKSSeimV0DSuo9uws8lU9hy61qKIdrjG7Pi0bkuJIyH/NwDgc2hyoYlUEUq++0lhKbpKPUKm9d24wjzZmz51tL9ps4cSs0pD6x/5LYbhzgha5fTNiqOQIeX9RfgZIwJaRBD1yRwEdu7OsYVNFF/AZC4C/4FF1tnVXw3aPmxk6Dddm7YhIwJVX4kIG8jnYT1lkN7jiEVeEzL7/8RpBdW1NA3seLNV/eROOUCWhLRgk7pwtO+E7mwi4IrdKt7p3T+7QAYg6LBD13cVFxAqCJ2KA87nCjG/sOCNSteB6HGNLfsuNBtkpXYUJRHe75HcKtF8SX2AMtAZN6PkTL8BKmIrscL7jml50ubMUCX5sQBlPJ4tKF95izTJ4KvCUQZ5arZTscpikeWCryI2nchi6XDP4G2687OlfI+iYm4Qhj4pPWFSvJJO2c7Fme9lP
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR03MB9746.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(56012099006)(11063799006)(5023799004)(6133799003)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?iUP2L6+IoMutcS9Uq/hrcM6wAIGfQ/ck+U7znda4iobeP90rjFonrTdwsVNo?=
 =?us-ascii?Q?uyB3woarOW0hykaYhtJ3wFUxj3gIRGYcAIVHDbc+r2cvjXo6lhHRzg6o5KUG?=
 =?us-ascii?Q?69NF9gWYilrXoWNFcGT2G3yNF13G473TIjLLSLt6XcFhHHm2m1SGdf3lwGNs?=
 =?us-ascii?Q?mg0tTHAZvGZv3SyehPpvo0VozfSi7BRnPDSz2hJD0RdYMNp1Yl6BexUYw+JT?=
 =?us-ascii?Q?I8twd/GLD7zxT5DRpangoy+vH1tfAAMThXtwcKvNVqzZ6hrYnHQbH3sCUByN?=
 =?us-ascii?Q?dOQDsQ84U9kk/rF9Niz1WukV6eFmRPAoKRfcv+iBQzFcTpSGxyeHLwY3apjP?=
 =?us-ascii?Q?kzIOMRnMQ+FJfxR/3pBvtCasZj0lVMps/cjT8itBqN1uC6Y0PlPl6FZXL7rC?=
 =?us-ascii?Q?lXTlSx3hDUC15PaYp2/I4UUJ3Jf3nD0o0ZoM3VjhoY90i3j/tGK+qqDfg8U2?=
 =?us-ascii?Q?0PLmqSy8MloEwK7jgkjfRhJ1YhPbBKEZzAseaJ6vBuAfs8hsUNd3VkaMy0M1?=
 =?us-ascii?Q?PJb0RjRoy1lf5bH6WHHgs2dyRNrytp807nisIG20uBwA0tJ/cNjugQBLncwi?=
 =?us-ascii?Q?T0LR7/oeXhEoff3n/hiEE3wKgQ+9pwqMxrXsHOHfYuE2oUJeO+HikXSvCLCs?=
 =?us-ascii?Q?JhWLsaGGnTg5uA3YaKx4deCPOsCb1mpmAyvaZCTGJKGf0FyfgcqINgKMByS9?=
 =?us-ascii?Q?UOY7aRlFK7h/gHVa6MRdTvmZNveanzY1kizZU8Tid7l5Mb9X4aedp1B2SQyk?=
 =?us-ascii?Q?xMYjb2PfZAsDr9MnIKNxWXJIrr0e62PrrY8XD5KatRTnHtn8wS20Blvl9eUo?=
 =?us-ascii?Q?ONaEzXK59eslWeNKgizREJUZ5LdPPvS9tO3tkabbQuUf5wnJtUJqgiPC0++e?=
 =?us-ascii?Q?tAp4y5MYKdtre681+Fl/jwpuKWdMu65v9b/eQYBt3WSi6WbhdRM8CUa/oZFc?=
 =?us-ascii?Q?86MLhYWdhOzZZQxyStUclDloivesZlqjj0tr4/W88axidSC7KML1J0N5lxKW?=
 =?us-ascii?Q?R+8VxPtpiY8pZJWcar5qzV2QDzKNBPOJUFEfIkPUbogGK+lwSzPv0e01Myt4?=
 =?us-ascii?Q?PenRWBnScoDUWUtSVNplg43fqBMpolSeWPpl4Kdrkcw5PdvITBe8I+pWplmV?=
 =?us-ascii?Q?4of3Bs6ZAtjQPEc2CS6I5F4K4gVAgYK2xbiM+vnKg7FEsrRN2Payjy8WfWcw?=
 =?us-ascii?Q?zm9U4TscHjVT3KnrekQr85NgJkxN31iP/24bDZL1cF8Ur2NlU3LjwR8OJmIk?=
 =?us-ascii?Q?AXoQKS+pLQK/zXF3nFF5Ue80ooRJH6tvzYO2XqobZJiGmH3i/aHSEird02SP?=
 =?us-ascii?Q?fiCWRXrRVPpGtFKBf+l/m9swLqHfyqunS2qJKSuWaOqsEsD7KU3OTImG4KQy?=
 =?us-ascii?Q?VSsqRG9mfo0AL+C82i5o2FyeGYxSaDtuVnstbPOEtyvAg/oSjPzdredcziq9?=
 =?us-ascii?Q?Ewb5mW/rRiEhx9MtWs7e7Ec7aUjzUUH0zcss5V0WRF1R0fIynuptdw6TsqBs?=
 =?us-ascii?Q?JhOZR2OTMsQ6OTqjKQQ1Kk4BTf86ssKozAiMs+4i4s31t+0YKQ5FRHEq1KaZ?=
 =?us-ascii?Q?yFjpxTzvoTpcmnEXCEB6q0gfGt3BgUaOvIWc4KiufrqmnhGBJxskKAbC3HzU?=
 =?us-ascii?Q?mtH+7bYxo+Yf3FrkH4mOizHsoiTS3xR9XeTjze8NWw9OZm9o6WjUeeaf3u3W?=
 =?us-ascii?Q?i3nRFZ8cNNvegnaErGQrbo+pF5tLiiJNdq4nL6Dmfd8ZmeC3PBhrsA0SGiKy?=
 =?us-ascii?Q?EiXSr0+zaQ=3D=3D?=
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ca39d394-72d2-4762-4d76-08dec6ee22ea
X-MS-Exchange-CrossTenant-AuthSource: AS8PR03MB9746.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2026 12:45:22.5409
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wLVB+1Yulgb/KqEtY2vH0zFW2aaaTaAqvXuI94XGybV51R5ItDrm5n9zf3bpPzYezK32L0OXVsh9IOpIsUtH9A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR03MB7558
X-purgate-ID: tlsNG-bad1c0/1781095525-4015DA53-57EBD25A/0/0
X-purgate-type: clean
X-purgate-size: 21035
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
	FREEMAIL_CC(0.00)[epam.com,gmail.com,kernel.org,xen.org,arm.com,amd.com];
	FORWARDED(0.00)[mailman];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[mykola_kvach@epam.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:mykola_kvach@epam.com,m:xakep.amatop@gmail.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:luca.fancellu@arm.com,m:xakepamatop@gmail.com,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[arm.com:email];
	FROM_NEQ_ENVFROM(0.00)[mykola_kvach@epam.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[epam.com:+];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	RCPT_COUNT_SEVEN(0.00)[9];
	TO_DN_SOME(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: BB74866967E

System suspend may lead to a state where GIC would be powered down.
Therefore, Xen should save/restore the context of GIC on suspend/resume.

Note that the context consists of states of registers which are
controlled by the hypervisor. Other GIC registers which are accessible
by guests are saved/restored on context switch.

Before continuing suspend, also verify that the physical CPU interface
has no Group 1 active-priority state left. Use ICC_CTLR_EL1.PRIbits to
decide which ICC_AP1R<n>_EL1 registers are implemented, so Xen does not
read an unimplemented AP1R register.

Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
Reviewed-by: Luca Fancellu <luca.fancellu@arm.com>
---
Changes in V10:
- abort suspend when the physical Group 1 active-priority state is still
  present, deriving accessible ICC_AP1R<n>_EL1 registers from
  ICC_CTLR_EL1.PRIbits;
- re-enable the redistributor before restoring CPU and virtual interface
  state on the suspend abort path;
- panic if the redistributor cannot be re-enabled on the suspend abort path;
- avoid saving/restoring reserved GICD_IPRIORITYR and GICD_IROUTER entries
  for a partially populated last SPI block;
- disable Distributor group forwarding while preserving affinity routing
  state before restoring Distributor configuration;
- disable SPI/eSPI forwarding and wait for RWP before restoring
  GICD_ICFGR<n>.Int_config.

Changes in V9:
- fix the suspend-context comment typo and split dist_ctx declarations;
- restore ICC_IGRPEN1_EL1 on the suspend error path;
- re-initialize GICD_IGROUPRnE during resume;
- restore GICD_IROUTER only after re-enabling ARE_NS during resume.

Changes in V8:
- use right rdist base for prop/pend baser and ctrl

Changes in V7:
- restore LPI regs on resume
- add timeout during redist disabling
- squash with suspend/resume handling for GICv3 eSPI registers
- drop ITS guard paths so suspend/resume always runs; switch missing ctx
  allocation to panic
- trim TODO comments; narrow redistributor storage to PPI icfgr
- keep distributor context allocation even without ITS; adjust resume
  to use GENMASK(31, 0) for clearing enables
- drop storage of the SGI configuration register, as SGIs are always
  edge-triggered
---
 xen/arch/arm/gic-v3-lpi.c                |   3 +
 xen/arch/arm/gic-v3.c                    | 458 ++++++++++++++++++++++-
 xen/arch/arm/include/asm/arm64/sysregs.h |   5 +
 xen/arch/arm/include/asm/gic_v3_defs.h   |   3 +
 4 files changed, 466 insertions(+), 3 deletions(-)

diff --git a/xen/arch/arm/gic-v3-lpi.c b/xen/arch/arm/gic-v3-lpi.c
index 847da26ff7..a63c8c4979 100644
--- a/xen/arch/arm/gic-v3-lpi.c
+++ b/xen/arch/arm/gic-v3-lpi.c
@@ -467,6 +467,9 @@ static int cpu_callback(struct notifier_block *nfb, unsigned long action,
     switch ( action )
     {
     case CPU_UP_PREPARE:
+        if ( system_state == SYS_STATE_resume )
+            break;
+
         rc = gicv3_lpi_allocate_pendtable(cpu);
         if ( rc )
             printk(XENLOG_ERR "Unable to allocate the pendtable for CPU%lu\n",
diff --git a/xen/arch/arm/gic-v3.c b/xen/arch/arm/gic-v3.c
index cae4ec28a1..be223dd915 100644
--- a/xen/arch/arm/gic-v3.c
+++ b/xen/arch/arm/gic-v3.c
@@ -1081,12 +1081,12 @@ out:
     return res;
 }
 
-static void gicv3_hyp_disable(void)
+static void gicv3_hyp_enable(bool enable)
 {
     register_t hcr;
 
     hcr = READ_SYSREG(ICH_HCR_EL2);
-    hcr &= ~GICH_HCR_EN;
+    hcr = enable ? (hcr | GICH_HCR_EN) : (hcr & ~GICH_HCR_EN);
     WRITE_SYSREG(hcr, ICH_HCR_EL2);
     isb();
 }
@@ -1193,7 +1193,7 @@ static void gicv3_disable_interface(void)
     spin_lock(&gicv3.lock);
 
     gicv3_cpu_disable();
-    gicv3_hyp_disable();
+    gicv3_hyp_enable(false);
 
     spin_unlock(&gicv3.lock);
 }
@@ -1929,6 +1929,450 @@ static bool gic_dist_supports_lpis(void)
     return (readl_relaxed(GICD + GICD_TYPER) & GICD_TYPE_LPIS);
 }
 
+#ifdef CONFIG_SYSTEM_SUSPEND
+
+/* This struct represents a block of 32 IRQs */
+struct dist_irq_block {
+    uint32_t icfgr[2];
+    uint32_t ipriorityr[8];
+    uint64_t irouter[32];
+    uint32_t isactiver;
+    uint32_t isenabler;
+};
+
+struct redist_ctx {
+    uint32_t ctlr;
+    uint32_t icfgr; /* only PPIs stored */
+    uint32_t igroupr;
+    uint32_t ipriorityr[8];
+    uint32_t isactiver;
+    uint32_t isenabler;
+
+    uint64_t pendbase;
+    uint64_t propbase;
+};
+
+/* GICv3 registers to be saved/restored on system suspend/resume */
+struct gicv3_ctx {
+    struct dist_ctx {
+        uint32_t ctlr;
+        struct dist_irq_block *irqs;
+        struct dist_irq_block *espi_irqs;
+    } dist;
+
+    /* have only one rdist structure for last running CPU during suspend */
+    struct redist_ctx rdist;
+
+    struct cpu_ctx {
+        uint32_t ctlr;
+        uint32_t pmr;
+        uint32_t bpr;
+        uint32_t sre_el2;
+        uint32_t grpen;
+    } cpu;
+};
+
+static struct gicv3_ctx gicv3_ctx;
+
+static void __init gicv3_alloc_context(void)
+{
+    uint32_t blocks = DIV_ROUND_UP(gicv3_info.nr_lines, 32);
+
+    /* The spec allows for systems without any SPIs */
+    if ( blocks > 1 )
+    {
+        gicv3_ctx.dist.irqs = xzalloc_array(struct dist_irq_block, blocks - 1);
+        if ( !gicv3_ctx.dist.irqs )
+            panic("Failed to allocate memory for GICv3 suspend context\n");
+    }
+
+#ifdef CONFIG_GICV3_ESPI
+    if ( !gic_number_espis() )
+        return;
+
+    blocks = gic_number_espis() / 32;
+    gicv3_ctx.dist.espi_irqs = xzalloc_array(struct dist_irq_block, blocks);
+    if ( !gicv3_ctx.dist.espi_irqs )
+        panic("Failed to allocate memory for GICv3 eSPI suspend context\n");
+#endif
+}
+
+static int gicv3_disable_redist(void)
+{
+    void __iomem *waker = GICD_RDIST_BASE + GICR_WAKER;
+    s_time_t deadline;
+
+    /*
+     * Avoid infinite loop if Non-secure does not have access to GICR_WAKER.
+     * See Arm IHI 0069H.b, 12.11.42 GICR_WAKER:
+     *     When GICD_CTLR.DS == 0 and an access is Non-secure accesses to this
+     *     register are RAZ/WI.
+     */
+    if ( !(readl_relaxed(GICD + GICD_CTLR) & GICD_CTLR_DS) )
+        return 0;
+
+    deadline = NOW() + MILLISECS(1000);
+
+    writel_relaxed(readl_relaxed(waker) | GICR_WAKER_ProcessorSleep, waker);
+    while ( (readl_relaxed(waker) & GICR_WAKER_ChildrenAsleep) == 0 )
+    {
+        if ( NOW() > deadline )
+        {
+            printk("GICv3: Timeout waiting for redistributor to sleep\n");
+            return -ETIMEDOUT;
+        }
+        cpu_relax();
+        udelay(10);
+    }
+
+    return 0;
+}
+
+#define GET_SPI_REG_OFFSET(name, is_espi) \
+    ((is_espi) ? GICD_##name##nE : GICD_##name)
+
+static void gicv3_store_spi_irq_block(struct dist_irq_block *irqs,
+                                      unsigned int i, unsigned int nr_irqs,
+                                      bool is_espi)
+{
+    void __iomem *base;
+    unsigned int irq, nr_priority_regs;
+
+    ASSERT(nr_irqs && nr_irqs <= 32);
+    nr_priority_regs = DIV_ROUND_UP(nr_irqs, 4);
+
+    base = GICD + GET_SPI_REG_OFFSET(ICFGR, is_espi) + i * sizeof(irqs->icfgr);
+    irqs->icfgr[0] = readl_relaxed(base);
+    irqs->icfgr[1] = readl_relaxed(base + 4);
+
+    base = GICD + GET_SPI_REG_OFFSET(IPRIORITYR, is_espi);
+    base += i * sizeof(irqs->ipriorityr);
+    for ( irq = 0; irq < nr_priority_regs; irq++ )
+        irqs->ipriorityr[irq] = readl_relaxed(base + 4 * irq);
+
+    base = GICD + GET_SPI_REG_OFFSET(IROUTER, is_espi);
+    base += i * sizeof(irqs->irouter);
+    for ( irq = 0; irq < nr_irqs; irq++ )
+        irqs->irouter[irq] = readq_relaxed_non_atomic(base + 8 * irq);
+
+    base = GICD + GET_SPI_REG_OFFSET(ISACTIVER, is_espi);
+    base += i * sizeof(irqs->isactiver);
+    irqs->isactiver = readl_relaxed(base);
+
+    base = GICD + GET_SPI_REG_OFFSET(ISENABLER, is_espi);
+    base += i * sizeof(irqs->isenabler);
+    irqs->isenabler = readl_relaxed(base);
+}
+
+static void gicv3_restore_spi_irq_config(struct dist_irq_block *irqs,
+                                         unsigned int i, unsigned int nr_irqs,
+                                         bool is_espi)
+{
+    void __iomem *base;
+    unsigned int irq, nr_priority_regs;
+
+    ASSERT(nr_irqs && nr_irqs <= 32);
+    nr_priority_regs = DIV_ROUND_UP(nr_irqs, 4);
+
+    base = GICD + GET_SPI_REG_OFFSET(ICFGR, is_espi) + i * sizeof(irqs->icfgr);
+    writel_relaxed(irqs->icfgr[0], base);
+    writel_relaxed(irqs->icfgr[1], base + 4);
+
+    base = GICD + GET_SPI_REG_OFFSET(IPRIORITYR, is_espi);
+    base += i * sizeof(irqs->ipriorityr);
+    for ( irq = 0; irq < nr_priority_regs; irq++ )
+        writel_relaxed(irqs->ipriorityr[irq], base + 4 * irq);
+}
+
+static void gicv3_restore_spi_irq_routing(struct dist_irq_block *irqs,
+                                          unsigned int i, unsigned int nr_irqs,
+                                          bool is_espi)
+{
+    void __iomem *base;
+    unsigned int irq;
+
+    ASSERT(nr_irqs && nr_irqs <= 32);
+
+    base = GICD + GET_SPI_REG_OFFSET(IROUTER, is_espi);
+    base += i * sizeof(irqs->irouter);
+    for ( irq = 0; irq < nr_irqs; irq++ )
+        writeq_relaxed_non_atomic(irqs->irouter[irq], base + 8 * irq);
+}
+
+static void gicv3_disable_spi_irq_block(unsigned int i, bool is_espi)
+{
+    void __iomem *base;
+
+    base = GICD + GET_SPI_REG_OFFSET(ICENABLER, is_espi) + i * 4;
+    writel_relaxed(GENMASK(31, 0), base);
+}
+
+static void gicv3_restore_spi_irq_state(struct dist_irq_block *irqs,
+                                        unsigned int i, bool is_espi)
+{
+    void __iomem *base;
+
+    base = GICD + GET_SPI_REG_OFFSET(ISENABLER, is_espi);
+    base += i * sizeof(irqs->isenabler);
+    writel_relaxed(irqs->isenabler, base);
+
+    base = GICD + GET_SPI_REG_OFFSET(ICACTIVER, is_espi) + i * 4;
+    writel_relaxed(GENMASK(31, 0), base);
+
+    base = GICD + GET_SPI_REG_OFFSET(ISACTIVER, is_espi);
+    base += i * sizeof(irqs->isactiver);
+    writel_relaxed(irqs->isactiver, base);
+}
+
+static int gicv3_check_ap1r(unsigned int n, register_t apr)
+{
+    if ( !apr )
+        return 0;
+
+    printk(XENLOG_ERR "GICv3: suspend aborted: ICC_AP1R%u_EL1=%#"
+           PRIregister"\n", n, apr);
+
+    return -EBUSY;
+}
+
+static int gicv3_check_active_priorities(register_t ctlr)
+{
+    unsigned int pribits = MASK_EXTR(ctlr, ICC_CTLR_EL1_PRIBITS_MASK) + 1;
+    int ret;
+
+    /*
+     * Xen enables physical Group 1 interrupts through ICC_IGRPEN1_EL1,
+     * so only the physical Group 1 active-priority registers are relevant
+     * here. Use ICC_CTLR_EL1.PRIbits for the physical CPU interface, not
+     * ICH_VTR_EL2, which describes the virtual interface. ICC_AP1R1_EL1 is
+     * only implemented with at least 6 physical priority bits, and
+     * ICC_AP1R2_EL1/ICC_AP1R3_EL1 with at least 7.
+     */
+    switch ( pribits )
+    {
+    case 8:
+    case 7:
+        ret = gicv3_check_ap1r(3, READ_SYSREG(ICC_AP1R3_EL1));
+        if ( ret )
+            return ret;
+        ret = gicv3_check_ap1r(2, READ_SYSREG(ICC_AP1R2_EL1));
+        if ( ret )
+            return ret;
+        /* Fall through */
+    case 6:
+        ret = gicv3_check_ap1r(1, READ_SYSREG(ICC_AP1R1_EL1));
+        if ( ret )
+            return ret;
+        /* Fall through */
+    default:
+        return gicv3_check_ap1r(0, READ_SYSREG(ICC_AP1R0_EL1));
+    }
+}
+
+static int gicv3_suspend(void)
+{
+    unsigned int i, nr_irqs;
+    void __iomem *base;
+    int ret;
+    struct redist_ctx *rdist = &gicv3_ctx.rdist;
+
+    /* Save GICC configuration */
+    gicv3_ctx.cpu.ctlr     = READ_SYSREG(ICC_CTLR_EL1);
+    gicv3_ctx.cpu.pmr      = READ_SYSREG(ICC_PMR_EL1);
+    gicv3_ctx.cpu.bpr      = READ_SYSREG(ICC_BPR1_EL1);
+    gicv3_ctx.cpu.sre_el2  = READ_SYSREG(ICC_SRE_EL2);
+    gicv3_ctx.cpu.grpen    = READ_SYSREG(ICC_IGRPEN1_EL1);
+
+    gicv3_disable_interface();
+
+    ret = gicv3_check_active_priorities(gicv3_ctx.cpu.ctlr);
+    if ( ret )
+        goto out_enable_iface;
+
+    ret = gicv3_disable_redist();
+    if ( ret )
+        goto out_enable_iface;
+
+    /* Save GICR configuration */
+    gicv3_redist_wait_for_rwp();
+
+    base = GICD_RDIST_BASE;
+
+    rdist->ctlr = readl_relaxed(base + GICR_CTLR);
+
+    rdist->propbase = readq_relaxed(base + GICR_PROPBASER);
+    rdist->pendbase = readq_relaxed(base + GICR_PENDBASER);
+
+    base = GICD_RDIST_SGI_BASE;
+
+    /* Save priority on PPI and SGI interrupts */
+    for ( i = 0; i < NR_GIC_LOCAL_IRQS / 4; i++ )
+        rdist->ipriorityr[i] = readl_relaxed(base + GICR_IPRIORITYR0 + 4 * i);
+
+    rdist->isactiver = readl_relaxed(base + GICR_ISACTIVER0);
+    rdist->isenabler = readl_relaxed(base + GICR_ISENABLER0);
+    rdist->igroupr   = readl_relaxed(base + GICR_IGROUPR0);
+    rdist->icfgr     = readl_relaxed(base + GICR_ICFGR1);
+
+    /* Save GICD configuration */
+    gicv3_dist_wait_for_rwp();
+    gicv3_ctx.dist.ctlr = readl_relaxed(GICD + GICD_CTLR);
+
+    for ( i = 1; i < DIV_ROUND_UP(gicv3_info.nr_lines, 32); i++ )
+    {
+        nr_irqs = min(32U, gicv3_info.nr_lines - i * 32);
+        gicv3_store_spi_irq_block(gicv3_ctx.dist.irqs + i - 1, i, nr_irqs,
+                                  false);
+    }
+
+#ifdef CONFIG_GICV3_ESPI
+    for ( i = 0; i < gic_number_espis() / 32; i++ )
+        gicv3_store_spi_irq_block(gicv3_ctx.dist.espi_irqs + i, i, 32, true);
+#endif
+
+    return 0;
+
+ out_enable_iface:
+    if ( gicv3_enable_redist() )
+        panic("GICv3: Failed to re-enable redistributor after suspend abort\n");
+
+    gicv3_hyp_enable(true);
+    WRITE_SYSREG(gicv3_ctx.cpu.grpen, ICC_IGRPEN1_EL1);
+    isb();
+
+    return ret;
+}
+
+static void gicv3_resume(void)
+{
+    int ret;
+    unsigned int i, nr_irqs;
+    uint32_t dist_ctlr;
+    void __iomem *base;
+    struct redist_ctx *rdist = &gicv3_ctx.rdist;
+
+    dist_ctlr = gicv3_ctx.dist.ctlr & GICD_CTLR_ARE_NS;
+
+    /* Disable group forwarding while preserving affinity routing state. */
+    writel_relaxed(dist_ctlr, GICD + GICD_CTLR);
+    gicv3_dist_wait_for_rwp();
+
+    /*
+     * IHI0069H.b 12.9.9 says changing GICD_ICFGR<n>.Int_config
+     * while the interrupt is individually enabled is UNPREDICTABLE.
+     * Disable SPIs first; 4.7.1 defines GICD_ICENABLER<n>, n > 0,
+     * as the per-SPI disable mechanism.
+     */
+    for ( i = 1; i < DIV_ROUND_UP(gicv3_info.nr_lines, 32); i++ )
+        gicv3_disable_spi_irq_block(i, false);
+
+#ifdef CONFIG_GICV3_ESPI
+    for ( i = 0; i < gic_number_espis() / 32; i++ )
+        gicv3_disable_spi_irq_block(i, true);
+#endif
+
+    gicv3_dist_wait_for_rwp();
+
+    for ( i = NR_GIC_LOCAL_IRQS; i < gicv3_info.nr_lines; i += 32 )
+        writel_relaxed(GENMASK(31, 0), GICD + GICD_IGROUPR + (i / 32) * 4);
+
+    for ( i = 1; i < DIV_ROUND_UP(gicv3_info.nr_lines, 32); i++ )
+    {
+        nr_irqs = min(32U, gicv3_info.nr_lines - i * 32);
+        gicv3_restore_spi_irq_config(gicv3_ctx.dist.irqs + i - 1, i, nr_irqs,
+                                     false);
+    }
+
+#ifdef CONFIG_GICV3_ESPI
+    for ( i = 0; i < gic_number_espis() / 32; i++ )
+    {
+        writel_relaxed(GENMASK(31, 0), GICD + GICD_IGROUPRnE + i * 4);
+        gicv3_restore_spi_irq_config(gicv3_ctx.dist.espi_irqs + i, i, 32,
+                                     true);
+    }
+#endif
+
+    if ( dist_ctlr )
+    {
+        for ( i = 1; i < DIV_ROUND_UP(gicv3_info.nr_lines, 32); i++ )
+        {
+            nr_irqs = min(32U, gicv3_info.nr_lines - i * 32);
+            gicv3_restore_spi_irq_routing(gicv3_ctx.dist.irqs + i - 1, i,
+                                          nr_irqs, false);
+        }
+
+#ifdef CONFIG_GICV3_ESPI
+        for ( i = 0; i < gic_number_espis() / 32; i++ )
+            gicv3_restore_spi_irq_routing(gicv3_ctx.dist.espi_irqs + i, i,
+                                          32, true);
+#endif
+    }
+
+    for ( i = 1; i < DIV_ROUND_UP(gicv3_info.nr_lines, 32); i++ )
+        gicv3_restore_spi_irq_state(gicv3_ctx.dist.irqs + i - 1, i, false);
+
+#ifdef CONFIG_GICV3_ESPI
+    for ( i = 0; i < gic_number_espis() / 32; i++ )
+        gicv3_restore_spi_irq_state(gicv3_ctx.dist.espi_irqs + i, i, true);
+#endif
+
+    writel_relaxed(gicv3_ctx.dist.ctlr, GICD + GICD_CTLR);
+    gicv3_dist_wait_for_rwp();
+
+    ret = gicv3_lpi_init_rdist(GICD_RDIST_BASE);
+    /*
+     * If LPIs are already enabled, assume firmware or the still-powered
+     * redistributor has valid PROPBASER/PENDBASER and skip reprogramming.
+     * Return -EBUSY so callers can ignore this case.
+     */
+    if ( ret && ret != -ENODEV && ret != -EBUSY )
+        panic("GICv3: Failed to re-initialize LPIs during resume\n");
+    else if ( ret == -EBUSY ) /* extra checks, just to be sure */
+    {
+        base = GICD_RDIST_BASE;
+        if ( readq_relaxed(base + GICR_PROPBASER) != rdist->propbase ||
+             readq_relaxed(base + GICR_PENDBASER) != rdist->pendbase )
+            panic("GICv3: LPIs already enabled with unexpected PROPBASER/PENDBASER during resume\n");
+    }
+
+    /* Restore GICR (Redistributor) configuration */
+    if ( gicv3_enable_redist() )
+        panic("GICv3: Failed to re-enable redistributor during resume\n");
+
+    base = GICD_RDIST_SGI_BASE;
+
+    writel_relaxed(GENMASK(31, 0), base + GICR_ICENABLER0);
+    gicv3_redist_wait_for_rwp();
+
+    for ( i = 0; i < NR_GIC_LOCAL_IRQS / 4; i++ )
+        writel_relaxed(rdist->ipriorityr[i], base + GICR_IPRIORITYR0 + i * 4);
+
+    writel_relaxed(rdist->isactiver, base + GICR_ISACTIVER0);
+    writel_relaxed(rdist->igroupr,   base + GICR_IGROUPR0);
+    writel_relaxed(rdist->icfgr,     base + GICR_ICFGR1);
+
+    gicv3_redist_wait_for_rwp();
+
+    writel_relaxed(rdist->isenabler, base + GICR_ISENABLER0);
+    writel_relaxed(rdist->ctlr, GICD_RDIST_BASE + GICR_CTLR);
+
+    gicv3_redist_wait_for_rwp();
+
+    WRITE_SYSREG(gicv3_ctx.cpu.sre_el2, ICC_SRE_EL2);
+    isb();
+
+    /* Restore CPU interface (System registers) */
+    WRITE_SYSREG(gicv3_ctx.cpu.pmr,   ICC_PMR_EL1);
+    WRITE_SYSREG(gicv3_ctx.cpu.bpr,   ICC_BPR1_EL1);
+    WRITE_SYSREG(gicv3_ctx.cpu.ctlr,  ICC_CTLR_EL1);
+    WRITE_SYSREG(gicv3_ctx.cpu.grpen, ICC_IGRPEN1_EL1);
+    isb();
+
+    gicv3_hyp_init();
+}
+
+#endif /* CONFIG_SYSTEM_SUSPEND */
+
 /* Set up the GIC */
 static int __init gicv3_init(void)
 {
@@ -2003,6 +2447,10 @@ static int __init gicv3_init(void)
 
     gicv3_hyp_init();
 
+#ifdef CONFIG_SYSTEM_SUSPEND
+    gicv3_alloc_context();
+#endif
+
 out:
     spin_unlock(&gicv3.lock);
 
@@ -2042,6 +2490,10 @@ static const struct gic_hw_operations gicv3_ops = {
 #endif
     .iomem_deny_access   = gicv3_iomem_deny_access,
     .do_LPI              = gicv3_do_LPI,
+#ifdef CONFIG_SYSTEM_SUSPEND
+    .suspend             = gicv3_suspend,
+    .resume              = gicv3_resume,
+#endif
 };
 
 static int __init gicv3_dt_preinit(struct dt_device_node *node, const void *data)
diff --git a/xen/arch/arm/include/asm/arm64/sysregs.h b/xen/arch/arm/include/asm/arm64/sysregs.h
index f3c11d871e..2261620316 100644
--- a/xen/arch/arm/include/asm/arm64/sysregs.h
+++ b/xen/arch/arm/include/asm/arm64/sysregs.h
@@ -16,6 +16,11 @@
 #define ICC_SRE_EL1               S3_0_C12_C12_5
 #define ICC_IGRPEN1_EL1           S3_0_C12_C12_7
 
+#define ICC_AP1R0_EL1             S3_0_C12_C9_0
+#define ICC_AP1R1_EL1             S3_0_C12_C9_1
+#define ICC_AP1R2_EL1             S3_0_C12_C9_2
+#define ICC_AP1R3_EL1             S3_0_C12_C9_3
+
 #define ICH_VSEIR_EL2             S3_4_C12_C9_4
 #define ICC_SRE_EL2               S3_4_C12_C9_5
 #define ICH_HCR_EL2               S3_4_C12_C11_0
diff --git a/xen/arch/arm/include/asm/gic_v3_defs.h b/xen/arch/arm/include/asm/gic_v3_defs.h
index 3714cfeb7d..f741587322 100644
--- a/xen/arch/arm/include/asm/gic_v3_defs.h
+++ b/xen/arch/arm/include/asm/gic_v3_defs.h
@@ -94,12 +94,15 @@
 #define GICD_TYPE_LPIS               (1U << 17)
 
 #define GICD_CTLR_RWP                (1UL << 31)
+#define GICD_CTLR_DS                 (1U << 6)
 #define GICD_CTLR_ARE_NS             (1U << 4)
 #define GICD_CTLR_ENABLE_G1A         (1U << 1)
 #define GICD_CTLR_ENABLE_G1          (1U << 0)
 #define GICD_IROUTER_SPI_MODE_ANY    (1UL << 31)
 
 #define GICC_CTLR_EL1_EOImode_drop   (1U << 1)
+#define ICC_CTLR_EL1_PRIBITS_SHIFT   8
+#define ICC_CTLR_EL1_PRIBITS_MASK    (0x7U << ICC_CTLR_EL1_PRIBITS_SHIFT)
 
 #define GICR_WAKER_ProcessorSleep    (1U << 1)
 #define GICR_WAKER_ChildrenAsleep    (1U << 2)
-- 
2.43.0


