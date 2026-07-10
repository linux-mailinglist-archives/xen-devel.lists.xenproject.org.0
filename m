Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id TD12HQ2uUGpv3QIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 10 Jul 2026 10:32:13 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AE531738826
	for <lists+xen-devel@lfdr.de>; Fri, 10 Jul 2026 10:32:12 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=epam.com header.s=selector1 header.b=l+C3nnH1;
	dmarc=pass (policy=quarantine) header.from=epam.com;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1358899.1612763 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wi6eI-0003Gb-5A; Fri, 10 Jul 2026 08:31:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1358899.1612763; Fri, 10 Jul 2026 08:31:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wi6eI-0003El-0X; Fri, 10 Jul 2026 08:31:54 +0000
Received: by outflank-mailman (input) for mailman id 1358899;
 Fri, 10 Jul 2026 08:31:53 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Mykola_Kvach@epam.com>) id 1wi6eG-00031k-Uo
 for xen-devel@lists.xenproject.org; Fri, 10 Jul 2026 08:31:53 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wi6eF-00GHay-S5
 for xen-devel@lists.xenproject.org; Fri, 10 Jul 2026 10:31:51 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Mykola_Kvach@epam.com>)
 id 6a50adf2-e002-0a2a0a5209dd-0a2a4502ab40-26
 for <xen-devel@lists.xenproject.org>; Fri, 10 Jul 2026 10:31:51 +0200
Received: from [52.101.84.97]
 (helo=DB3PR0202CU003.outbound.protection.outlook.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.2)
 (envelope-from <Mykola_Kvach@epam.com>)
 id 6a50adf7-64c6-0a2a45020019-346554610d4f-3
 for <xen-devel@lists.xenproject.org>; Fri, 10 Jul 2026 10:31:51 +0200
Received: from AS8PR03MB9746.eurprd03.prod.outlook.com (2603:10a6:20b:61d::18)
 by AS8PR03MB7367.eurprd03.prod.outlook.com (2603:10a6:20b:2ed::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.17; Fri, 10 Jul
 2026 08:31:48 +0000
Received: from AS8PR03MB9746.eurprd03.prod.outlook.com
 ([fe80::cf11:309:1384:58f7]) by AS8PR03MB9746.eurprd03.prod.outlook.com
 ([fe80::cf11:309:1384:58f7%4]) with mapi id 15.21.0181.016; Fri, 10 Jul 2026
 08:31:48 +0000
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
 b=x1fHHZ+yWsXY2qnifJWLwtVhcNUC4/FVOzKCHNMmQKvAs9x8Dlu9AvzicIVmTK/Sfvf2IFmmwuJGL4SaHOVQ1wdI/wOGduDydnxeqEft3CWGvbgxE6IMEyP6pPc9CzhxJYl4lqIMopx1syesX2/829xnt5GOhZto+JgY9PV6WSyS1lXnEjSuy0CsjxiJQk9XIAtnGpSF7bugnGUbSR2uUQh4ftlsfs+t/HyLM1WyNXm6TU2Stljl7I7nOVCCBZKv6vj97vlEj40v6ynJeSsT3sHWEBwX3lLefHtw56lh5UUayqwh0L1dskRKvLWRQ9CRK+GWZqrycKsucQe4Oc/8Ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=61GIlb6exJm425sHaT9cUAkX2wIriwZ7XFpSTPSlU5I=;
 b=rwMy2WpRNIsfeveJe1GcK/rmRm/NLw2Avv0btSSgcCulRytTkfv7Sc3nNN4YKtPw0KP0ey2oesA3o0ZP0RKx181vqtkOS1azCn6Klq+En/f5bcrZdFm6MyAsUCMA0fAi3QgojPi2bJfl+PGkA4M9qgVj/QYyU/y814jHaOexwleb4Fd5HgUAK1ZlKNOOticj/LKuCbFM4tLJecVhpxnbvz7+6QwzjIv4ffUCuJofVxHH0zRKKRFX+0ENbvzTXjzJVYV8vZTCsm2hBGV7GfON7GowzjDBsKkY2rovIYQywF0k0l0+ccLl9Bc6WAkvV7fd/st9/PNJZW4bjr85XHRweQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=61GIlb6exJm425sHaT9cUAkX2wIriwZ7XFpSTPSlU5I=;
 b=l+C3nnH1mifcwQs0GQZ9ZdQjkfWEP5zSnEULFcwx5jePIuvXYAaRXmD/nx3Dzt5T1OTofAOA0w1TMTWarJaCmTiL+8PeDwYVeEOHUaFvVF9Jgve39N4BZfIams0OLSQ68Ms0K1DBCM+mfUtRMIWVOms1NoPrG6s+zf5EqzhLXNv7oGxJPMtHcvr4ikNLkNzW0pzrbB/ietFzJglhAecLqWmatneaDMKX/cdUI8DTX5CwvMAGbKnlFDwfSPXvlxqbKqC8rZjrP1NkfqExSDVuRLAZoDRRfAEgDPwW/cw+uMV7OLSJyCoFNLO0D6wNUMSyFqzwOLbvN0HQvfhCDKIjXQ==
From: Mykola Kvach <mykola_kvach@epam.com>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH for-4.22 2/2] xen/arm: vgic: free eSPIs using the bitmap index
Date: Fri, 10 Jul 2026 11:31:32 +0300
Message-ID: <6d279de6db90c7e8b76fb4da93b8e451a9cf9874.1783671887.git.mykola_kvach@epam.com>
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
X-MS-Office365-Filtering-Correlation-Id: 12b2a379-7013-4f65-8552-08dede5daf3e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|23010399003|18002099003|22082099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	Mgy3L0qnbUns0g1zG0Ygj5lMfzxMILFkrpJRs419Ca/W7hhe47V81Cc0YM7+slHBWtkLjNXorJz2U7em6YdGEJB4tmVvOTA1OTrx/GCQk+sFMMaoM3ZpGtKJ5JLthY+Zb5w8bcInQ4pXHIddSAO0M2zqxzpZIo7zxwVQ/cSxca5KUMtCjdngvIi8rQ8hitUxZZ3wkojr4fw1rEpv5kl733Q0OUnbJWTWvpneSZ9jeDFejfDg97SdhQvWxRKfi9jTpggWbIzpiwzOqo3q+Vj7k5R35khAL5ehIHJbBTUfBkuXRfj3t+ABym38aDbWRiZI65zaPW2dNiFYrNr9TTCu8Ip4oUcX65Wyrg41jLDkA0qY9GJLC601wmtTwROMP6lvGTyVUraRV5ZKcwu8XmHgWWO3t1yDSAexLh8n2EPd1CF4DintEPJf5T4UG6AYe/PxGaZ4dYheYtUC0amDUtE8F3no+reJjYFzPFuKF8wd0M5l6sf/rj/VHkw2jWfuCCQWmFOzAbF+WC5iP9/nL00EhnXgTK3fgxiMgZuYrkvuk8AF+5wWBw4daXdh1cVVFqZ7nQXGXXVsQDs5Aduukc1ke634GAEAl/s7ZaE7DGdQwjm/3qtjEBXyUlmPRzLxbPOY0xd+ni4mKFR25wyHE8SgjXlrrNqdqf5H+KAy2tsWPp8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR03MB9746.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(18002099003)(22082099003)(56012099006)(11063799006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?TDZWlC7CrhTm+C9ev89LdpemmDOLhigwqLxEgfgQvl/rw3gXNTiKQTa7+hiK?=
 =?us-ascii?Q?eK5LDRGg3je1SKsw5ARyv2aQ++3g5zCJSMV+69l9MceRAgwCVNLor8D6hLQl?=
 =?us-ascii?Q?Ps7oZXzmpKesCtOZ9Pk1eIyY05Zpy6kMtJgkprQx8MxlrfVF5vQp2JZ0ctzz?=
 =?us-ascii?Q?KeypWcf8Ufbdr6if+SPfOLl/tb065LXAYNAE4KkfzctWLhdQVP+B5oiJfbk+?=
 =?us-ascii?Q?FY5Onr/XwQPzAXiOloCvWmuBaW44Q4BbJ6GsVC8mZziQKokpVhEnY3kQVfuD?=
 =?us-ascii?Q?JeMn4aEHXVGJRK7Q93UvKTY3efTujxMeTV+iuZJwQsytIE2PphrKGJjcNbLu?=
 =?us-ascii?Q?6z9KHpbQxzOhRuYe6wNXAdEMUCE8YDocCeiZRGg85Y4efkEyT67qZJ9x9fSY?=
 =?us-ascii?Q?lZ5tFOsB/BQSNyFbuH8MfccOwl+g78Jc9o08XshMQCh8VJVteGJ1eShAAbai?=
 =?us-ascii?Q?Ln7K0FANhMWHKNk+Gn4iJZMc+IoO8z78KxMTuMVISIKH2+WwxyCJ8wdxZ+6n?=
 =?us-ascii?Q?4wqC3UV97lTNv+bqr6xM29vE8f1xiVKP7+efi9OXD0YaIXCtXAZZDgW3oehV?=
 =?us-ascii?Q?mfv1jS5rrVKU6915mg+pB+pC9wNgpoMw+bkNI+R6boDyRuDjF/2E0pKm9gOW?=
 =?us-ascii?Q?Oq3LaFQ/vtcjZFWG37xc6B0XDzj3U6OxGznEsyIGICZ2KNS7QNjCg11r6XgC?=
 =?us-ascii?Q?BdQb5jSZH4gtaqxJgUHS+gVP0e+MF5gQCmhJfrOQpS/N7MUyrgvvCZAWC/Rf?=
 =?us-ascii?Q?z2uELRB3MRD+cU+oWpTqFhW5UcLKprxXSYs3vB6fOfDZApOxtAov7U75NF2M?=
 =?us-ascii?Q?2vRP4gXiqCej+pS+NAaUxf/FHbT+4O5utO54Csge/IrMukK5uSdU8TJ83Zbg?=
 =?us-ascii?Q?4D0ZhtPrz8gEQkOZl+8JlkYPDDzqhFCY2Uzp92yim5J5PxaZU0PAPWaga7Rg?=
 =?us-ascii?Q?LDt3YWqnzmC9Z6a75SJNoqhcrHAIPGsoNr0It9E8cEoy0RAp57X6/gxCbtnx?=
 =?us-ascii?Q?oltvC79HJDJAiyM5x7X0Xl7Nm7hFT/UuBZW6qKwP3Gprcy7pUNOTneKqPl3B?=
 =?us-ascii?Q?56eZlRS8GWUqMzI/5T8fPaJfQGHRGGfgDhSDGaiGofZBgmqND4uIC35VFPo7?=
 =?us-ascii?Q?7RDGnz2kCQ80M+aPaSLzcDlIefJvwRSu4uZFlMxia8bYtRAhm7TsBRfCEtPM?=
 =?us-ascii?Q?BMa3g/s2NXKSdpTS3Ycb/NSjC1mAQGghY32V+ZFYDegd03CNixPuMHMSG3uA?=
 =?us-ascii?Q?HoQ05htkBUYvoXjjuR6/RjyVc6mBV54lWfdviAJui8OQZNHVxXncFy720OhP?=
 =?us-ascii?Q?8m1NqGtVbax7Nj9QQ+N7ajLQ6yQ8YDRFsCo7zwzFmDOmtOWXLvZR6QOO2UYZ?=
 =?us-ascii?Q?oFf7c2MlZP0s8z8N3U7BOWEj6HF+rRiYL4mHr7tbcv1VLWFtEP5LmD/slxY1?=
 =?us-ascii?Q?bUirYR2y3aZgkBARjfh/ppZ0ftKvjvuWc/DvkuZ0xLp8AyzxYRsRlqPRuUph?=
 =?us-ascii?Q?ZE27+UHx9HqrINrCL9L2NoXSLEg7Ss7d9XC2N7Mi/UF5T9PTnqBcG9xDNBkK?=
 =?us-ascii?Q?wEwUiIL+S5YIeHRiWe18qLZT/S7M34b4wFcLQtFx+5HARSY0vhHolBZg7nra?=
 =?us-ascii?Q?zCBNMuI1lK7VUch9awc2fezKLzfoSwaauafZ6Ms6IA2W5x7ffNczLbayy318?=
 =?us-ascii?Q?VNaFmZTncBrqRR71nGYkB7ssMug6rJ5xF89rCRgTZeV+Du0dxrBEbHRGZOtu?=
 =?us-ascii?Q?Zh0VtgagQQ=3D=3D?=
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 12b2a379-7013-4f65-8552-08dede5daf3e
X-MS-Exchange-CrossTenant-AuthSource: AS8PR03MB9746.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2026 08:31:48.8073
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hEZX5vucRe9smMal2PkLwFu8kkVyAmdzPqjiHyTLmBPAHsh75NIIyaRM/loplRnsIPiWYwzqUkAUwtScCCYsVg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB7367
X-purgate-ID: tlsNG-720697/1783672311-3C954A87-D6AF5F65/0/0
X-purgate-type: clean
X-purgate-size: 2564
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
X-Rspamd-Queue-Id: AE531738826

Classic vGIC stores eSPIs in allocated_irqs after the regular virtual
interrupts. vgic_reserve_virq() therefore translates an eSPI INTID to a
compressed bitmap index before test_and_set_bit().

vgic_free_virq() still used the raw virtual INTID. Freeing INTID 4096
would clear bit 4096 instead of the first eSPI allocation bit, which is
outside allocated_irqs for a domain with eSPI support. That can leave
the eSPI reserved and may corrupt memory.

Add the inverse of idx_to_virq() and use it in both reserve and free, so
the allocation bitmap is indexed consistently. Also reject invalid
virtual INTIDs before clearing the bitmap.

Fixes: bdde400c6e1b ("xen/arm: vgic: add resource management for extended SPIs")
Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
---
 xen/arch/arm/vgic.c | 27 ++++++++++++++++-----------
 1 file changed, 16 insertions(+), 11 deletions(-)

diff --git a/xen/arch/arm/vgic.c b/xen/arch/arm/vgic.c
index e5aca17dcb..b85710c6a7 100644
--- a/xen/arch/arm/vgic.c
+++ b/xen/arch/arm/vgic.c
@@ -33,6 +33,16 @@ static inline unsigned int idx_to_virq(struct domain *d, unsigned int idx)
     return idx;
 }
 
+static inline unsigned int virq_to_idx(struct domain *d, unsigned int virq)
+{
+#ifdef CONFIG_GICV3_ESPI
+    if ( is_espi(virq) )
+        return espi_intid_to_idx(virq) + vgic_num_irqs(d);
+#endif
+
+    return virq;
+}
+
 bool vgic_is_valid_line(struct domain *d, unsigned int virq)
 {
 #ifdef CONFIG_GICV3_ESPI
@@ -848,19 +858,11 @@ bool vgic_emulate(struct cpu_user_regs *regs, union hsr hsr)
 
 bool vgic_reserve_virq(struct domain *d, unsigned int virq)
 {
-    unsigned int idx = virq;
-
     if ( !vgic_is_valid_line(d, virq) )
         return false;
 
-    if ( is_espi(virq) )
-    {
-        unsigned int num_regular_irqs = vgic_num_irqs(d);
-
-        idx = espi_intid_to_idx(virq) + num_regular_irqs;
-    }
-
-    return !test_and_set_bit(idx, d->arch.vgic.allocated_irqs);
+    return !test_and_set_bit(virq_to_idx(d, virq),
+                             d->arch.vgic.allocated_irqs);
 }
 
 int vgic_allocate_virq(struct domain *d, bool spi)
@@ -897,7 +899,10 @@ int vgic_allocate_virq(struct domain *d, bool spi)
 
 void vgic_free_virq(struct domain *d, unsigned int virq)
 {
-    clear_bit(virq, d->arch.vgic.allocated_irqs);
+    if ( !vgic_is_valid_line(d, virq) )
+        return;
+
+    clear_bit(virq_to_idx(d, virq), d->arch.vgic.allocated_irqs);
 }
 
 unsigned int vgic_max_vcpus(unsigned int domctl_vgic_version)
-- 
2.43.0


