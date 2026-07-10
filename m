Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id i7t2HQ2uUGpw3QIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 10 Jul 2026 10:32:13 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B29FC738827
	for <lists+xen-devel@lfdr.de>; Fri, 10 Jul 2026 10:32:12 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=epam.com header.s=selector1 header.b=FeMa5LJx;
	dmarc=pass (policy=quarantine) header.from=epam.com;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1358898.1612754 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wi6eG-00033r-Sr; Fri, 10 Jul 2026 08:31:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1358898.1612754; Fri, 10 Jul 2026 08:31:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wi6eG-00031l-Po; Fri, 10 Jul 2026 08:31:52 +0000
Received: by outflank-mailman (input) for mailman id 1358898;
 Fri, 10 Jul 2026 08:31:51 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Mykola_Kvach@epam.com>) id 1wi6eF-00031Y-3t
 for xen-devel@lists.xenproject.org; Fri, 10 Jul 2026 08:31:51 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wi6eE-0068KU-Gt
 for xen-devel@lists.xenproject.org; Fri, 10 Jul 2026 10:31:50 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Mykola_Kvach@epam.com>)
 id 6a50adec-5cb7-0a2a0a5109dd-0a2a4507e13a-20
 for <xen-devel@lists.xenproject.org>; Fri, 10 Jul 2026 10:31:50 +0200
Received: from [52.101.65.122]
 (helo=DU2PR03CU002.outbound.protection.outlook.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.2)
 (envelope-from <Mykola_Kvach@epam.com>)
 id 6a50adf5-ac46-0a2a45070019-3465417a18b4-3
 for <xen-devel@lists.xenproject.org>; Fri, 10 Jul 2026 10:31:50 +0200
Received: from AS8PR03MB9746.eurprd03.prod.outlook.com (2603:10a6:20b:61d::18)
 by AS8PR03MB7367.eurprd03.prod.outlook.com (2603:10a6:20b:2ed::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.17; Fri, 10 Jul
 2026 08:31:47 +0000
Received: from AS8PR03MB9746.eurprd03.prod.outlook.com
 ([fe80::cf11:309:1384:58f7]) by AS8PR03MB9746.eurprd03.prod.outlook.com
 ([fe80::cf11:309:1384:58f7%4]) with mapi id 15.21.0181.016; Fri, 10 Jul 2026
 08:31:46 +0000
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
 b=QGjvgFiNl34+xJSi7XW762+UEzuBXiGr6HG1Iw4PoIZXel5seLqpre5V/emSEMxfPUBDw/yBduM6zJ6hVtA7FcbF1IYV/zn41STdyACbQPGHbAj+9pd2ZKvdSS559sO+iLoDPlBNWKosVrUuqmP7TT4uoX7lhbRuKlwy5nG7jmwgDe32TdJxRhcXhm65lAE/nx0WqosIYiyYkbbUAiB8albqzH+2fIuEbs46tssJtstKgvstkkxvqVzP2J/bM2bOMjRdzx0eaNqOmfcIYkdVjRs/mviyVVUPXuSy7medfta7GPwjJLyxRhjbroPnV4lxEvA936TuUKeNAZehrrhxKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2aB5Y91zry1fHf55lGHOXbfuzTn/0G7deff54RC4rIc=;
 b=ML9IanVHEtCBE5rgbx7Z7ibGB75oSE4ES8b6t5icye/dgShYmnJQpWpkM+4kd8IoKIIRXUVglvxToeDAnrPKDpGjcQccNPE9dnzcBNAzPRQAW9aYWEvJzf0wL1WUsGMNByMZF61b9JSnQpsxrbAXZ4YcerzjSgZYPN6dtTKsxijv13pYDv79ByrjNXX6N8xNe7SZUfx9YKjaK/wUNneq2HWe+hrQeKQwb0CsbFH7aSfdnLGeli1YcrvSr3qIZKI7R4cq2uq9cjkRfLa8C9gKW7ShZKQ5UzBd7tSbHsht6q3nXMvsY/5zSnUijKm2cvK5n54M52RxCc+9nj8h8zRWhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2aB5Y91zry1fHf55lGHOXbfuzTn/0G7deff54RC4rIc=;
 b=FeMa5LJxJleKNH8Z/ijDr3gw1AqhzAe3+UPQKocxc3RMP53aed1NoafwurQQXpuxRlRnP/bNpoRLEgbfcampspHPSJS38jX2pRpV0ksQPc7PVrSX5vDngC71Ch+yJe6olAan399LpzYGhAxhmYDpk8XZJvyTJXt3MMcBDbik4gRCVNTwilES16ox9eSY6xkf16S+3cp2bkb6zFGWOEDOdP+xBxlDAY4Zc+5kVXM8i+8SvtTOBt3SYNUyMOLGQmIG7JMWsLMGdcJJcQQTpyLWHgYeqZP6cYWN8p1g/H28ZjuzMOP5TMC27vkCnyIUqEEkmQTPIWF4pW+2vzsTc069AQ==
From: Mykola Kvach <mykola_kvach@epam.com>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH for-4.22 1/2] xen/arm: validate IRQs before descriptor lookup
Date: Fri, 10 Jul 2026 11:31:31 +0300
Message-ID: <1843da2e028635773638ef73ed10907c7ae7bb53.1783671887.git.mykola_kvach@epam.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1783671887.git.mykola_kvach@epam.com>
References: <cover.1783671887.git.mykola_kvach@epam.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: WA1PEPF00005B93.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d8::631) To AS8PR03MB9746.eurprd03.prod.outlook.com
 (2603:10a6:20b:61d::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR03MB9746:EE_|AS8PR03MB7367:EE_
X-MS-Office365-Filtering-Correlation-Id: 6070b5b2-e650-4fb2-af32-08dede5dae18
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|23010399003|18002099003|22082099003|56012099006|11063799006|6133799003;
X-Microsoft-Antispam-Message-Info:
	MLC4ycrTD83nA+ysv0Bmtd82nd1XPwUer04KIdwTkeQxsCDgQu0xTJgrEBS/Be6vYztqzKzyu/DL7P4Jfg3qSoYWGsAAN4anB6oiu7coc9NQoBxW2/cf/YmS9tgJhlZbd0ZoUhyPUHw7X53J+nHNfJmwFde526Bqr0Iq8cURSJd2SpGoPk5Mz7ujC+Za5ENXconH/dw3COksYTEIWXq1jQs2aCOGISLDNHTv8cAc60MBK6L/UmGs30O/k8BtkpkI1g1UBizP5lMEutJJzk5Kf5fCGhWCoWkWNz7yThFp7cgBbvRQ4MBCNeCCsfHqidU7I2/gWQfJaKu7SUJyUd1lcq8olW4v0zso97NDMj/X9ummXClkKdzOAExE6472KfxGZtSQLfXCfIeSxDd8ab/4/FImfRiMqyX4IasP0kg6i6Z58wmbYzlPJ1dEe8OOj6MMs35NIRbcVddObzw/fIxKA83ut/Kfmh5LO26oOpFvR2AfjusyA5vOk2MpuLQ2+jFlne6HRvI8uU/5HvVLAuB7QiVXIHyUOtyhe7EjokH/Kf8xU8I21ROukLsN9/z814GBp/OD24m08xZgys38hyhSUKfdaRrfVgS8T9Sp6JJ1pbAnLs2rqkjYycwViWSnuQRe1wkN7fOEutosqsDgcjlaa/JPK9JvAcXIXmjnS7NitB0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR03MB9746.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(18002099003)(22082099003)(56012099006)(11063799006)(6133799003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?TU1ICNSE1vl+yl1HxVCpmOa+HX1XlLk00Of5v3EZ9lzGquLUbBOYjDNsZrmw?=
 =?us-ascii?Q?3ixhhhhaAoyUB64pa1Y9R6kSBvNMhfPppTB7qPksKBhHEvKDEC0ifpfayz8v?=
 =?us-ascii?Q?qyPA7XnRMrWouf4uuY4yUPAkU9NXdsfe+cYslRnQsnTHquUrdwjGIX4eZbdL?=
 =?us-ascii?Q?9XzwxkCdVzXj0Jk77sr47oIBODVaIVd/Fgp4f4LpdvT+W+7hypfqfmAbPhz0?=
 =?us-ascii?Q?RI7SAwjG+E7TuGviQri6IaK2Aal3vyTIQrcEy69WHUEjQROu9YIJUftD34sF?=
 =?us-ascii?Q?nZyb2s9ZM5dEJnyYzJeff8HrPSu6gjNYFoeEXoshKIscvPoUlFHYUGBZJy4e?=
 =?us-ascii?Q?nht8hER5pcW3l+MylhVxEztBJf/4U4+Rg2ysuFqed+gl6IBFP3XzziWV1X54?=
 =?us-ascii?Q?nr3A65M7o9Jm1chU9+O1soFOVPetJFAOgFeDCpSj8Su/sbVGg1lm3LNkcFEH?=
 =?us-ascii?Q?e3aIsTHjgoA195GDH3kQot5d6IOAa1cwGFDfDGfH/G2VbCQkxuXyvuUcqDsR?=
 =?us-ascii?Q?eCqK0MnlbnC3teu13MIJTPEbZ2gVNDfLkfCNS4FLBsJIPqH0INlU58Ui35To?=
 =?us-ascii?Q?E6b7flnBfhWMUpV7LPOIhNBt5wh5jMUDxz3KDBBEzuc/DMtVAU+N9dGKdL06?=
 =?us-ascii?Q?faaw51HIIGWV64UFjlidvOfrz92uvUnIJEesHYW5zs/2YOce86NaD0rXKI2X?=
 =?us-ascii?Q?URcVz+duNxctMhagQRBF5058j0s/7nFXzh+kX0beh5+zk02Au0imX970ioES?=
 =?us-ascii?Q?CPXl73EljDaaCqCdWxq6Ug3TotpIBOUIqAvu/QBoMkto0B+oUG1ReVjJ0aXU?=
 =?us-ascii?Q?hU00bxATXrCba/TN6hDHPLbMxDMuqxjO93gYfkg5HtgxTzYhhVxUbCScXfQT?=
 =?us-ascii?Q?tvgCl4JvNJEnUUnQcCiPiDrhAUj5uOMg4oE5YT+fzfr6/CKmBU6GWO9SuEvK?=
 =?us-ascii?Q?brwh83kYW3+FUz9fh2QL/qSUOA8kneL2lBVyUBIKU8r0de312AXt6JyEX9/K?=
 =?us-ascii?Q?bUONU15dPXm224oubL8BF/bhZ6mSrNkFBquZufWxbZmpi/gYMxTms94bhDta?=
 =?us-ascii?Q?bzg8Yxk9A6wdG40ZLP/IVHVCs7swa/jWjfK/dpymiM0ozMUJ2BslkD+6G9Iy?=
 =?us-ascii?Q?3e7kxbKYdBN0MSyMt4sskPcOMqygv/FCuzQtXvMcz9obTktSgwoZmYWnHOG3?=
 =?us-ascii?Q?M7/CEhwW/2mOM+RXvtUJa7NeNEgYts/jO5PscznUnGXboPT2lE6rcviWoa6v?=
 =?us-ascii?Q?JP42Wkex4AoYNmBUkmMoPjVtyGS7qbDp28buhH457U0hLXwm7Yw84bux8IWG?=
 =?us-ascii?Q?5SzCMu2UU/Qkp4Q/8Fxr04UtQTlIdPigvSg2+bANtdIvd4JZ32gFjHKwVt5t?=
 =?us-ascii?Q?8jHBTTa0e8M9Jjc4NpzOy0P0daF2dmT/SkALftv4f9n+MG2f9QjRH9I/AUEo?=
 =?us-ascii?Q?Hs15kk8cZdkNdhQEO4oK2AWRVmq55OxIP3j7Szlqc4KyrfgneqW0OWDHn/mw?=
 =?us-ascii?Q?vw6xpS2fmRa9p9v8fjhYYClGuYRwCnhjSSwThBtjB2Cp06xP17btP+ycGJYK?=
 =?us-ascii?Q?TI/ql7oKwaqLnrvo/Qoq5V9iX4N6RJ3izoq89FBf1sNA7/hD8dmyIdgrKkDt?=
 =?us-ascii?Q?FjsDcd7L7Spm1jFVNPXybr7SNguv4JJxq45S6Uj0mreP+f5zfxKqY47ibMwX?=
 =?us-ascii?Q?zD1CnkBXfOz2Zm+IXVdHdYHAVrxNGVSNHzCKhSC4vmCi7pxsqMPRHqXDoohy?=
 =?us-ascii?Q?G+/oK2wJRw=3D=3D?=
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6070b5b2-e650-4fb2-af32-08dede5dae18
X-MS-Exchange-CrossTenant-AuthSource: AS8PR03MB9746.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2026 08:31:46.8624
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ynilg9eiZKmb4lKWGUikDibsxBNUTXVHRRqDQ07A73u/qAIS+RbPt+aErRWHaZUmz4oC79yWvrX7lNlX2TkImg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB7367
X-purgate-ID: tlsNG-ef75cf/1783672310-17F67201-03401FC0/0/0
X-purgate-type: clean
X-purgate-size: 2650
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.69 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[epam.com,quarantine];
	R_DKIM_ALLOW(-0.20)[epam.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[mykola_kvach@epam.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,s:lists@lfdr.de];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[epam.com:from_mime,epam.com:email,epam.com:mid,epam.com:dkim];
	FROM_NEQ_ENVFROM(0.00)[mykola_kvach@epam.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[epam.com:+];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B29FC738827

With GICv3 eSPI support, nr_irqs covers the architectural INTID
namespace up to ESPI_MAX_INTID. That namespace is not backed by a
single dense irq_desc[] array: regular SPIs use irq_desc[], eSPIs use
espi_desc[], and the INTIDs in between must not be treated as
descriptor indices.

A firmware-provided interrupt in the sparse range can therefore pass
checks based only on nr_irqs and reach irq_to_desc().

Validate IRQs with the GIC line helpers before looking up descriptors
in setup_irq(). Also validate SPI type configuration with gic_is_spi()
before irq_set_spi_type() obtains the descriptor, covering the
platform_get_irq() -> irq_set_type() path. The route-to-Xen assert
becomes redundant because setup_irq() now rejects invalid IRQs before
routing.

Fixes: 98f7060b9ed ("xen/arm/irq: add handling for IRQs in the eSPI range")
Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
---
 xen/arch/arm/gic.c | 2 --
 xen/arch/arm/irq.c | 9 +++++++--
 2 files changed, 7 insertions(+), 4 deletions(-)

diff --git a/xen/arch/arm/gic.c b/xen/arch/arm/gic.c
index ee75258fc3..ed9870c1bd 100644
--- a/xen/arch/arm/gic.c
+++ b/xen/arch/arm/gic.c
@@ -111,8 +111,6 @@ static void gic_set_irq_priority(struct irq_desc *desc, unsigned int priority)
 void gic_route_irq_to_xen(struct irq_desc *desc, unsigned int priority)
 {
     ASSERT(priority <= 0xff);     /* Only 8 bits of priority */
-    /* Can't route interrupts that don't exist */
-    ASSERT(gic_is_valid_line(desc->irq));
     ASSERT(test_bit(_IRQ_DISABLED, &desc->status));
     ASSERT(spin_is_locked(&desc->lock));
 
diff --git a/xen/arch/arm/irq.c b/xen/arch/arm/irq.c
index 73e58a5108..0314cf0b6e 100644
--- a/xen/arch/arm/irq.c
+++ b/xen/arch/arm/irq.c
@@ -416,6 +416,9 @@ int setup_irq(unsigned int irq, unsigned int irqflags, struct irqaction *new)
     struct irq_desc *desc;
     bool disabled;
 
+    if ( !gic_is_valid_line(irq) )
+        return -EINVAL;
+
     desc = irq_to_desc(irq);
 
     spin_lock_irqsave(&desc->lock, flags);
@@ -647,13 +650,15 @@ static bool irq_validate_new_type(unsigned int curr, unsigned int new)
 int irq_set_spi_type(unsigned int spi, unsigned int type)
 {
     unsigned long flags;
-    struct irq_desc *desc = irq_to_desc(spi);
+    struct irq_desc *desc;
     int ret = -EBUSY;
 
     /* This function should not be used for other than SPIs */
-    if ( spi < NR_LOCAL_IRQS )
+    if ( !gic_is_spi(spi) )
         return -EINVAL;
 
+    desc = irq_to_desc(spi);
+
     spin_lock_irqsave(&desc->lock, flags);
 
     if ( !irq_validate_new_type(desc->arch.type, type) )
-- 
2.43.0


