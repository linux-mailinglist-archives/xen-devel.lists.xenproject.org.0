Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ZTHCNAlHKWrwTQMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 10 Jun 2026 13:14:17 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E187668A0A
	for <lists+xen-devel@lfdr.de>; Wed, 10 Jun 2026 13:14:17 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=valinux.co.jp header.s=selector1 header.b=nC2WzyAH;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=valinux.co.jp;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1334124.1597220 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wXGsI-0006D8-11; Wed, 10 Jun 2026 11:13:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1334124.1597220; Wed, 10 Jun 2026 11:13:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wXGsH-0006AN-UE; Wed, 10 Jun 2026 11:13:33 +0000
Received: by outflank-mailman (input) for mailman id 1334124;
 Wed, 10 Jun 2026 11:13:31 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <taka@valinux.co.jp>) id 1wXGsF-00069s-NW
 for xen-devel@lists.xenproject.org; Wed, 10 Jun 2026 11:13:31 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wXGsF-008xp6-3o
 for xen-devel@lists.xenproject.org; Wed, 10 Jun 2026 13:13:31 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <taka@valinux.co.jp>)
 id 6a2946da-5cb7-0a2a0a5109dd-0a2a450880a8-2
 for <xen-devel@lists.xenproject.org>; Wed, 10 Jun 2026 13:13:31 +0200
Received: from [52.101.229.134]
 (helo=TY3P286CU002.outbound.protection.outlook.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <taka@valinux.co.jp>)
 id 6a2946d6-63b5-0a2a45080019-3465e5868771-4
 for <xen-devel@lists.xenproject.org>; Wed, 10 Jun 2026 13:13:30 +0200
Received: from OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:458::18)
 by OS7P286MB6556.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:432::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.11; Wed, 10 Jun
 2026 11:13:25 +0000
Received: from OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
 ([fe80::c8c9:25cd:8d13:96d6]) by OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
 ([fe80::c8c9:25cd:8d13:96d6%6]) with mapi id 15.21.0113.011; Wed, 10 Jun 2026
 11:13:25 +0000
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
 b=s3sJK662g3oAP+Q2TLe2oFgevpD8CeKzqykzb72rtejn7E4XK8o1EbfyTxVKqxDPPKmE0AweV3FNjvJZ+PqNJG65JCDaMr7nwWavNrn9+xWIVXfzdSKWfgPKFegAQZxU1OwihPGzMhbwooWruCtxA0rfSa2qfYc5cRNfh61/AhOyb3EWFBjut1JTHOsKyuSeVi9Acu54vivTehRv0coWI8HPUHjIeHh33N/wpwZHArFqFeGfxD0ixGogENPHt++BNRuYgTR6/CCpmy3OmYR/7KAA699asE/pCL6Gski7fKkvZOSzEmz35Bt2KeMQjeFuTGWT6NM501GMmBqzcA3wig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IpWh0xgVzIL9fMjPYynsIQUoTP7Vl/xvtVBNtgvLy08=;
 b=AP/9DbNwUO8Of4okc/o+2TFSLu0qMNJ7X3AUYXN+nJk65H0N8Npr5d5zUqvGB2Eg0R4bmBNVRM49tI37ulcU7B4qrIi4Pbauw5pTx9wiAzT1nN1tQbo3P3htwc699nQolFoXoiDlZBpw/4jBy5Uf2M3dubGy92Wrnt+dxWDaV7TsuZUSiKGs25XH1b/6lNBuD5JFfw+Chi1tK9mKqnS5WOj1cnjE4O/ZlDzKTA+pUb9uiT3CZPRJqPi2OOi2BgPMraylD5qUEUVDOe6mtTOjpQEZkMmkPkb4rCGC6fK/Ydi4ov6T3o0lWtbtpcNcZwG6yHY2HCemK4KIVwOzKMHC+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IpWh0xgVzIL9fMjPYynsIQUoTP7Vl/xvtVBNtgvLy08=;
 b=nC2WzyAHMSN6buam4UDPB67nxm2bTJT5rEp9Wgst9t53DUHzbXxnNGbKiCvJlfASfLORXyG/ZcAet+e3ddfIAHDtC7dFvljTUJeUr8mxs8fCsj7cDFelteEceIIrnAepRc5XXCtZtBCiVp55XVmfYEM2Je6/g7EDH+96h4fWCCc=
From: Hirokazu Takahashi <taka@valinux.co.jp>
To: xen-devel@lists.xenproject.org
Cc: Mykyta_Poturai@epam.com,
	Hirokazu Takahashi <taka@valinux.co.jp>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Jan Beulich <jbeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH 1/3] xen/device-tree: Parse 'cpu-map' node for CPU topology exploration
Date: Wed, 10 Jun 2026 20:13:18 +0900
Message-ID: <20260610111320.133784-2-taka@valinux.co.jp>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260610111320.133784-1-taka@valinux.co.jp>
References: <20260610111320.133784-1-taka@valinux.co.jp>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TY6PR01CA0034.jpnprd01.prod.outlook.com
 (2603:1096:405:3bd::17) To OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:604:458::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS9P286MB7222:EE_|OS7P286MB6556:EE_
X-MS-Office365-Filtering-Correlation-Id: c745a8bc-2cb3-4a86-7f69-08dec6e14abb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|1800799024|7416014|376014|366016|23010399003|22082099003|18002099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	3n/Xdj49m7lTRL/deE/eT1SArTpd0OAMkKpX8vaUn0qSVN8ksC85eIfFEsFj0gY8HPnMqEl3Ux5lvEraocf4IPtUzHmidr61VqdGbIyAm0IzJnQHwbQ+Z4BWAZHIeysTPU8Pogo5uFmM0qK0hZhjLZxVASP4iE8bkk29RHTdU5d3FQ3D+SyUSJiCjgOU/KwibbFO5NJynvf/uPiSxa9YLV2erJQvlL7//eYdrEfTzf5fZxRZlFtkAaca/uO8vCJvNcgr8mfjj0CrqghQ6sxTAMJ6Hf7+D3yZzt4CGGkyj8QuU/CVTGI63+UZyXVcfjgWc0cAzzRpF1ySleUWBDnxD8JX6FHvdV1gUtfiDKgJdSlHj6yhmq27wqwphFeWWCzAqa+EndYItXV/J+DZgc5VJssZ2ELOijyI+0KBBr4UOe+4CCfHUBMtUkYY4iW5v0ceDExKk6N9EcCWUtxiBLTgXpNIV9l7gYcsdLEKs30h/D+Xl9maFV5uSvPhnJnQ/GaKtgIOg4PAGfIt31GxmdkAwkW5fSwSHyJljdLC9v/PHTFthdaUXDzXZ+9A9sU9Df0wPeqdxUauLuXIAhPz1vK4j1E9MeuHBPDH3W+XgIa1R8yx8Cntmd0kXRSrkzUcmZp8/x8n5uRJneviUJEXCzc3MD2xpS/lcjRjMrYVbQ3OnDFePDW8I/g4rLV/CIEzkh0G
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(1800799024)(7416014)(376014)(366016)(23010399003)(22082099003)(18002099003)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?whNdwJk3T85WKqONlt/AHNUBDVE1jcwn/Ap13VxPpyv+W0L7ohwlTJ3Blb8N?=
 =?us-ascii?Q?0WT28cP89cAuyl3EntAtBYxPAGgqmqg2vjIiovqzIxRAWnXJB96RUSNJTWOU?=
 =?us-ascii?Q?zHJy85AOaIffFrGBRK7CR+vGx2iq5Yf2pyMvF6XTtBikU4NLfZ+lIPwvejiI?=
 =?us-ascii?Q?tbRhyNeSeIAYoxu3AK5OVJQZk4qwCNQMTc5qKTUXmM+BaMWmZ2/NPrmIZBYe?=
 =?us-ascii?Q?dbqPHDaIH31i1BgbmEAt58q8o++WPnB4wjprIZUGdt1PZdqErnmPIMStTNKO?=
 =?us-ascii?Q?9M1N4sTM+8BMdS3hQFHUnHH/fgJFkwmOKyvr+ftWr38YSMfxnh0MVtTW26iA?=
 =?us-ascii?Q?+popFE5GxFlq1T1gx1h9UbrdS3pKa3hI6j5nbnrdVw5un1Tqkes5OdmSQ4pU?=
 =?us-ascii?Q?uZlsgersSVtBcz0dFHiNfm3oEI6mUaj67w7ioF8CpUXpa8f+olRp3FyTnHUF?=
 =?us-ascii?Q?mGbOVzokP4B1TQZUxLNGTCMWVODRHgbjfoRwJ8vFUomuK3QeVu1JHgA8J8H9?=
 =?us-ascii?Q?y6iuvtoytQXKFrYN7N8XhFgL6ZFVX8cXXGrq8ChQDgdCbJvb10oYnB4eYk/H?=
 =?us-ascii?Q?er9xaDvi4vtl98nyv/Gid2Bbn+OYyMnsjMWyNFkvWBh9I2r4i+rJ+tyw3LUj?=
 =?us-ascii?Q?l2U+nJmxOsfht++/XhxZ+qL6nBRLmYLbwI251V5sP5sBykQAnTJnEsagI4Gm?=
 =?us-ascii?Q?iLoc07btz9Pp5TQCOU6OfA2FEoHSzZib0VVTIMmFmGNdb/MYgla6UAyUFJWb?=
 =?us-ascii?Q?4oCl0sRxfq2bFJDxk2FrIsmUlzizHeLuWHOWIqeZZ8UOL8rR9NobsR/bgsKy?=
 =?us-ascii?Q?rRytPnuEC59WnWgov6m12QU5UIesKXks+9QCxav3jCx0ToF46pHgVypI38A6?=
 =?us-ascii?Q?n33srKojVmF/cdxQqgSrmaLIrXf3Xd7IANLSDD/VHyBlcxryteL8tpB6OHeH?=
 =?us-ascii?Q?3EKgaAFr/PfaIQgM8DmRxFuWKBPD1j3AKIf76Aw4ot+1SK0v7VYCm1DfhRAJ?=
 =?us-ascii?Q?dmmkrXRVmVETpel/3rPBulypLAzgIRdFpT2wgQgNrLrAY3Ildv1dX5tPb0kQ?=
 =?us-ascii?Q?AXVwbrv00l18m3Dw2AIlt+fHwQmxsr+fl1WdwLJEYmzj/ziOM8qTpmj9DYhe?=
 =?us-ascii?Q?+OSL/nqgoskRry6N0HStzp5fI0G2nJGDcpuTl4ICJtjWyE2bkqADWkP0na0l?=
 =?us-ascii?Q?BtypyoXMZOG+vyRVnqtjjld07eWxah7a2Jv4sN6z/f0yueH2rHF3ZPAdndv3?=
 =?us-ascii?Q?U7Txch9i+33A/w4o0ETrzM1KWkmpkkqxi6sdiFzkv+HO7GOCJ4b2S6fsPOdJ?=
 =?us-ascii?Q?B1MCz9PlZYw2bGp9n27lt2Rr8LOB4w7a/Xc0sl5GQnKkir3SDptR+awfKL/v?=
 =?us-ascii?Q?BT+J31PEpukKcEP+PHjkn9W1q8eBfh6p8cDXJ4nE7Gon9N2U4PAgWDOjbpPE?=
 =?us-ascii?Q?bPrlgKbq6mGu1Bnc90Ub0I+lJ0SjtbqBEb184n9M46xgZH/aSHtYUHHSXXmR?=
 =?us-ascii?Q?Ui2q1iN+G1EtOiqJIqFYS8GCUzLZJNOoidHJGle04mQw4LVeEvd9bETUX04g?=
 =?us-ascii?Q?lkUQiPQvGJ4mgXF4/oo1Xk9x8nXQ8PAFcg4sHAUCp5diDMBllilMEaPLRi/A?=
 =?us-ascii?Q?nSnvAL3nfKutzAtL2FQhCwt42zIUXl7TBAdyWtVhuTP+wrkE7If7T+Z0uPvZ?=
 =?us-ascii?Q?a145T1D8cstiSn8N0Pk8FFeWU1wVzP/BfZ6q4LHHhli63PMUwmwSDYZpsRK+?=
 =?us-ascii?Q?ipy5t2EZ5UcohmHfwpjmzkLN8RtMWublZXBAh3vsX3IpDhPsWE76fHoqDnAU?=
X-MS-Exchange-AntiSpam-MessageData-1: GN/rsN2lqPhToQ==
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: c745a8bc-2cb3-4a86-7f69-08dec6e14abb
X-MS-Exchange-CrossTenant-AuthSource: OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2026 11:13:25.7773
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8xI1UkHf1f4IU1Xl5Z0wLwDjfpiYelwAva29SBbsUqFaW8hz8pQ5ANmjpejZr8PUi2bKp3DxJvy/WVFaTh+kFA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS7P286MB6556
X-purgate-ID: tlsNG-c1860d/1781090011-C487BDB1-FD7C428F/0/0
X-purgate-type: clean
X-purgate-size: 13239
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
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[taka@valinux.co.jp,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:Mykyta_Poturai@epam.com,m:taka@valinux.co.jp,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:jbeulich@suse.com,m:roger.pau@citrix.com,s:lists@lfdr.de];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[valinux.co.jp:dkim,valinux.co.jp:email,valinux.co.jp:mid,valinux.co.jp:from_mime];
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
X-Rspamd-Queue-Id: 1E187668A0A

Parse the 'cpu-map' node in the Device Tree to extract CPU topology
information. If the 'cpu-map' node is absent, fall back to
generating the topology data from the NUMA information. This
generation assumes exactly one socket per NUMA node and that SMT
is unsupported.

Signed-off-by: Hirokazu Takahashi <taka@valinux.co.jp>
---
 xen/arch/arm/smpboot.c                |   6 +
 xen/common/Kconfig                    |   7 +
 xen/common/device-tree/Makefile       |   1 +
 xen/common/device-tree/cpu-topology.c | 342 ++++++++++++++++++++++++++
 xen/include/xen/cpu-topology.h        |  38 +++
 5 files changed, 394 insertions(+)
 create mode 100644 xen/common/device-tree/cpu-topology.c
 create mode 100644 xen/include/xen/cpu-topology.h

diff --git a/xen/arch/arm/smpboot.c b/xen/arch/arm/smpboot.c
index 7f3cfa812e..c071f1494f 100644
--- a/xen/arch/arm/smpboot.c
+++ b/xen/arch/arm/smpboot.c
@@ -24,6 +24,7 @@
 #include <xen/warning.h>
 #include <xen/irq.h>
 #include <xen/console.h>
+#include <xen/cpu-topology.h>
 #include <asm/cpuerrata.h>
 #include <asm/gic.h>
 #include <asm/procinfo.h>
@@ -242,6 +243,8 @@ static void __init dt_smp_init_cpus(void)
         }
         else
             tmp_map[i] = hwid;
+
+        map_cpuid_to_node(i, cpu); /* pass the info to dt_init_cpu_topology() */
     }
 
     if ( !bootcpu_valid )
@@ -275,7 +278,10 @@ void __init smp_init_cpus(void)
     }
 
     if ( acpi_disabled )
+    {
         dt_smp_init_cpus();
+        dt_init_cpu_topology();
+    }
     else
         acpi_smp_init_cpus();
 
diff --git a/xen/common/Kconfig b/xen/common/Kconfig
index 5ff71480ee..9f9b48a4b7 100644
--- a/xen/common/Kconfig
+++ b/xen/common/Kconfig
@@ -188,6 +188,13 @@ config VM_EVENT
 config NEEDS_LIBELF
 	bool
 
+config DT_CPU_TOPOLOGY
+	bool "Device tree based CPU topology support (UNSUPPORTED)" if UNSUPPORTED
+	depends on HAS_DEVICE_TREE_DISCOVERY
+	help
+	  Retrieve CPU topology information from the device tree to optimize
+	  virtual CPU scheduling.
+
 config NUMA
 	bool
 
diff --git a/xen/common/device-tree/Makefile b/xen/common/device-tree/Makefile
index 9036e455d6..38bc5d5306 100644
--- a/xen/common/device-tree/Makefile
+++ b/xen/common/device-tree/Makefile
@@ -1,6 +1,7 @@
 obj-y += bootfdt.init.o
 obj-$(CONFIG_HAS_DEVICE_TREE_DISCOVERY) += bootinfo-fdt.init.o
 obj-$(CONFIG_HAS_DEVICE_TREE_DISCOVERY) += bootinfo.init.o
+obj-$(CONFIG_DT_CPU_TOPOLOGY) += cpu-topology.o
 obj-y += device-tree.o
 obj-$(CONFIG_DOMAIN_BUILD_HELPERS) += domain-build.init.o
 obj-$(filter $(CONFIG_DOM0LESS_BOOT),$(CONFIG_HAS_DEVICE_TREE_DISCOVERY)) += dom0less-build.init.o
diff --git a/xen/common/device-tree/cpu-topology.c b/xen/common/device-tree/cpu-topology.c
new file mode 100644
index 0000000000..bbdf0d1fe8
--- /dev/null
+++ b/xen/common/device-tree/cpu-topology.c
@@ -0,0 +1,342 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ * Derived from Linux kernel 7.0's $drivers/base/arch_topology.c
+ * Parse cpu topology information.
+ *
+ * Copyright (c) 2026 VA Linux Systems Japan K.K.
+ * Author: Hirokazu Takahashi <taka@valinux.co.jp>
+ */
+
+#include <xen/cpu.h>
+#include <xen/cpumask.h>
+#include <xen/delay.h>
+#include <xen/device_tree.h>
+#include <xen/cpu-topology.h>
+#include <xen/numa.h>
+#include <xen/domain_page.h>
+#include <xen/errno.h>
+#include <xen/init.h>
+
+struct cpu_map {
+    unsigned int thread_id;
+    unsigned int core_id;
+    unsigned int cluster_id;
+    unsigned int package_id;
+};
+
+struct cpu_topology *cpu_topology;
+static struct cpu_map __initdata cpu_map[NR_CPUS] = {
+    [0 ... NR_CPUS-1] = {~0U, ~0U, ~0U, 0U}
+};
+static struct dt_device_node * __initdata dt_cpu_table[NR_CPUS];
+static const unsigned int __initdata invalid_topo_id = (~0U);
+
+static void __init setup_siblings_masks(unsigned int cpuid)
+{
+    struct cpu_topology *cpuid_topo = &cpu_topology[cpuid];
+    struct cpu_map *cpuid_map = &cpu_map[cpuid];
+    unsigned int cpu;
+
+    /* Update core and thread sibling masks */
+    for_each_possible_cpu( cpu )
+    {
+        struct cpu_topology *cpu_topo = &cpu_topology[cpu];
+        struct cpu_map *map = &cpu_map[cpu];
+
+        if ( cpuid_map->package_id != map->package_id )
+            continue;
+
+        cpumask_set_cpu(cpuid, &cpu_topo->core_sibling);
+        cpumask_set_cpu(cpu, &cpuid_topo->core_sibling);
+
+        if ( cpuid_map->cluster_id != map->cluster_id )
+            continue;
+
+        if ( cpuid_map->cluster_id != invalid_topo_id )
+        {
+            cpumask_set_cpu(cpu, &cpuid_topo->cluster_sibling);
+            cpumask_set_cpu(cpuid, &cpu_topo->cluster_sibling);
+        }
+
+        if ( cpuid_map->core_id != map->core_id )
+            continue;
+
+        cpumask_set_cpu(cpuid, &cpu_topo->thread_sibling);
+        cpumask_set_cpu(cpu, &cpuid_topo->thread_sibling);
+    }
+}
+
+static struct dt_device_node * __init dt_find_child_node_by_name(struct dt_device_node *from, const char *name)
+{
+    struct dt_device_node *np;
+    const struct dt_device_node *dt = from;
+
+    dt_for_each_child_node( dt, np )
+        if ( np->name && (dt_node_cmp(np->name, name) == 0) )
+            break;
+
+    return np;
+}
+
+void __init map_cpuid_to_node(unsigned int cpuid, struct dt_device_node *cpu_node)
+{
+    if ( cpuid < NR_CPUS )
+        dt_cpu_table[cpuid] = cpu_node;
+}
+
+static unsigned int __init cpu_node_to_id(struct dt_device_node *cpu_node)
+{
+    unsigned int cpu;
+    bool found = false;
+
+    for_each_possible_cpu( cpu )
+    {
+        found = (cpu_node == dt_cpu_table[cpu]);
+        if ( found )
+            return cpu;
+    }
+
+    return invalid_topo_id;
+}
+
+/*
+ * This function returns the logic cpu number of the node.
+ */
+static unsigned int __init get_cpu_for_node(struct dt_device_node *node)
+{
+    struct dt_device_node *cpu_node = dt_parse_phandle(node, "cpu", 0);
+
+    if ( !cpu_node )
+        return invalid_topo_id;
+
+    return cpu_node_to_id(cpu_node);
+}
+
+static int __init parse_core(struct dt_device_node *core,
+                unsigned int package_id, unsigned int cluster_id,
+                unsigned int core_id)
+{
+    char name[20];
+    bool leaf = true;
+    unsigned int i = 0U;
+    unsigned int cpu;
+
+    do {
+        struct dt_device_node *t;
+
+        snprintf(name, sizeof(name), "thread%u", i);
+        t = dt_find_child_node_by_name(core, name);
+
+        if ( !t )
+            break;
+
+        leaf = false;
+        cpu = get_cpu_for_node(t);
+        if ( cpu != invalid_topo_id )
+        {
+            cpu_map[cpu].package_id = package_id;
+            cpu_map[cpu].cluster_id = cluster_id;
+            cpu_map[cpu].core_id = core_id;
+            cpu_map[cpu].thread_id = i;
+        }
+        else
+        {
+            printk(XENLOG_ERR "ERROR: %pOF: Can't get CPU for thread\n", t);
+            return -EINVAL;
+        }
+        i++;
+    } while ( true );
+
+    cpu = get_cpu_for_node(core);
+
+    if ( cpu != invalid_topo_id )
+    {
+        if ( !leaf )
+        {
+            printk(XENLOG_ERR "ERROR: %pOF: Core has both threads and CPU\n",
+                   core);
+            return -EINVAL;
+        }
+
+        cpu_map[cpu].package_id = package_id;
+        cpu_map[cpu].cluster_id = cluster_id;
+        cpu_map[cpu].core_id = core_id;
+        cpu_map[cpu].thread_id = 0U;
+    }
+    else if ( leaf )
+    {
+        printk(XENLOG_ERR "ERROR: %pOF: Can't get CPU for leaf core\n", core);
+        return -EINVAL;
+    }
+
+    return 0;
+}
+
+static int __init parse_cluster(struct dt_device_node *cluster,
+                unsigned int package_id, unsigned int cluster_id,
+                unsigned int depth)
+{
+    char name[20];
+    bool leaf = true;
+    bool has_cores = false;
+    unsigned int core_id = 0U;
+    unsigned int i;
+    int ret;
+
+    /*
+     * First check for child clusters; we currently ignore any
+     * information about the nesting of clusters and present the
+     * scheduler with a flat list of them.
+     */
+    i = 0U;
+    do {
+        struct dt_device_node *c;
+
+        snprintf(name, sizeof(name), "cluster%u", i);
+        c = dt_find_child_node_by_name(cluster, name);
+
+        if ( !c )
+            break;
+
+        leaf = false;
+        ret = parse_cluster(c, package_id, i, depth + 1U);
+        if ( depth > 0U )
+            printk(XENLOG_WARNING "WARNING: Topology for clusters of clusters not yet supported\n");
+        if ( ret != 0 )
+            return ret;
+        i++;
+    } while ( true );
+
+    /* Now check for cores */
+    i = 0U;
+    do {
+        struct dt_device_node *c;
+
+        snprintf(name, sizeof(name), "core%u", i);
+        c = dt_find_child_node_by_name(cluster, name);
+
+        if ( !c )
+            break;
+
+        has_cores = true;
+
+        if ( depth == 0U )
+        {
+            printk(XENLOG_ERR "ERROR: %pOF: cpu-map children should be clusters\n", c);
+            return -EINVAL;
+        }
+
+        if ( leaf )
+        {
+            ret = parse_core(c, package_id, cluster_id, core_id++);
+            if ( ret != 0 )
+                return ret;
+        }
+        else
+        {
+            printk(XENLOG_ERR "ERROR: %pOF: Non-leaf cluster with core %s\n",
+                   cluster, name);
+            return -EINVAL;
+        }
+
+        i++;
+    } while ( true );
+
+    if ( leaf && !has_cores )
+        printk(XENLOG_WARNING "WARNING: %pOF: empty cluster\n", cluster);
+
+    return 0;
+}
+
+static int __init parse_socket(struct dt_device_node *socket)
+{
+    char name[20];
+    bool has_socket = false;
+    unsigned int package_id = 0U;
+    int ret;
+
+    do {
+        struct dt_device_node *c;
+
+        snprintf(name, sizeof(name), "socket%u", package_id);
+        c = dt_find_child_node_by_name(socket, name);
+
+        if ( !c )
+            break;
+
+        has_socket = true;
+        ret = parse_cluster(c, package_id, invalid_topo_id, 0U);
+        if ( ret != 0 )
+            return ret;
+
+        package_id++;
+    } while ( true );
+
+    if ( !has_socket )
+        ret = parse_cluster(socket, 0U, invalid_topo_id, 0U);
+
+    return ret;
+}
+
+/*
+ * Generate cpu topology information when cpu-map node doesn't exist.
+ * It assumes that the cpu doesn't have SMT and all CPUs on a NUMA
+ * node belong to the same socket.
+ */
+static void __init fixup_topology(void)
+{
+    unsigned int cpu;
+    unsigned int clid = 0U;
+    unsigned int pkgid = 0U;
+
+    for_each_possible_cpu( cpu )
+    {
+        struct cpu_map *map = &cpu_map[cpu];
+
+        map->package_id = cpu_to_node(cpu);
+        if ( map->package_id != pkgid )
+        {
+            pkgid = map->package_id;
+            clid = 0U;
+        }
+        map->cluster_id = clid++;
+        map->core_id = 0U;
+        map->thread_id = 0U;
+    }
+}
+
+int __init parse_dt_topology(void)
+{
+    struct dt_device_node *cpus;
+    struct dt_device_node *map;
+
+    cpus = dt_find_node_by_path("/cpus");
+
+    if ( !cpus )
+    {
+        printk(XENLOG_ERR "ERROR: No CPU information found in DT\n");
+        return -EINVAL;
+    }
+
+    map = dt_find_child_node_by_name(cpus, "cpu-map");
+    if ( !map )
+        return -ENOENT;
+
+    return parse_socket(map);
+}
+
+void __init dt_init_cpu_topology(void)
+{
+    unsigned int cpu;
+    const unsigned int nr_cpus = cpumask_last(&cpu_possible_map) + 1U;
+
+    cpu_topology = xzalloc_array(struct cpu_topology, nr_cpus);
+    if ( !cpu_topology )
+        panic("Failed to allocate memory for cpu_topology array\n");
+
+    if (parse_dt_topology())
+        fixup_topology();
+
+    for_each_possible_cpu( cpu )
+        setup_siblings_masks(cpu);
+}
diff --git a/xen/include/xen/cpu-topology.h b/xen/include/xen/cpu-topology.h
new file mode 100644
index 0000000000..1c03f4deaa
--- /dev/null
+++ b/xen/include/xen/cpu-topology.h
@@ -0,0 +1,38 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+
+#ifndef XEN_CPU_TOPOLOGY_H
+#define XEN_CPU_TOPOLOGY_H
+
+#include <xen/types.h>
+#include <xen/device_tree.h>
+
+struct cpu_topology {
+    cpumask_t thread_sibling;
+    cpumask_t core_sibling;
+    cpumask_t cluster_sibling;
+};
+
+
+#ifdef CONFIG_DT_CPU_TOPOLOGY
+
+extern struct cpu_topology *cpu_topology;
+void map_cpuid_to_node(unsigned int cpuid, struct dt_device_node *cpu_node);
+void dt_init_cpu_topology(void);
+
+#elif CONFIG_DEVICE_TREE_PARSE
+
+static inline void map_cpuid_to_node(unsigned int cpuid, struct dt_device_node *cpu_node) {}
+static inline void dt_init_cpu_topology(void) {}
+
+#endif /* CONFIG_DEVICE_TREE_PARSE */
+
+#endif /* XEN_CPU_TOPOLOGY_H */
+
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: "BSD"
+ * c-basic-offset: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
-- 
2.43.0


