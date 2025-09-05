Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C61AB466F3
	for <lists+xen-devel@lfdr.de>; Sat,  6 Sep 2025 01:01:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1112585.1460795 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uufR2-0005pm-9e; Fri, 05 Sep 2025 23:01:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1112585.1460795; Fri, 05 Sep 2025 23:01:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uufR2-0005mm-63; Fri, 05 Sep 2025 23:01:36 +0000
Received: by outflank-mailman (input) for mailman id 1112585;
 Fri, 05 Sep 2025 23:01:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8GKY=3Q=amd.com=stefano.stabellini@srs-se1.protection.inumbo.net>)
 id 1uufR0-0005mQ-TH
 for xen-devel@lists.xenproject.org; Fri, 05 Sep 2025 23:01:34 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2060b.outbound.protection.outlook.com
 [2a01:111:f403:2415::60b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 41f88c2d-8aac-11f0-9809-7dc792cee155;
 Sat, 06 Sep 2025 01:01:29 +0200 (CEST)
Received: from SJ0PR13CA0133.namprd13.prod.outlook.com (2603:10b6:a03:2c6::18)
 by IA0PPF04DCE520E.namprd12.prod.outlook.com
 (2603:10b6:20f:fc04::bc5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.19; Fri, 5 Sep
 2025 23:01:23 +0000
Received: from SN1PEPF0002BA52.namprd03.prod.outlook.com
 (2603:10b6:a03:2c6:cafe::49) by SJ0PR13CA0133.outlook.office365.com
 (2603:10b6:a03:2c6::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9115.7 via Frontend Transport; Fri, 5
 Sep 2025 23:01:22 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SN1PEPF0002BA52.mail.protection.outlook.com (10.167.242.75) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9094.14 via Frontend Transport; Fri, 5 Sep 2025 23:01:21 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 5 Sep
 2025 18:01:21 -0500
Received: from ubuntu-20.04.2-arm64.shared (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 5 Sep 2025 18:01:20 -0500
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
X-Inumbo-ID: 41f88c2d-8aac-11f0-9809-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=smZvHJG61cCBWlYzq0HdJhsdlIJn0wQMSd0r18lXGWg10ba8AY6YPUZ6R2mvYg3Dp46eT8YkyDV1cIU1OjhPYWyvaa09zbGplgNa2vJDJ2wToIdYgDZ7TPFfyh0z1XJ6+8gAngPnpgeSf6RPizlXKcS47CtTsZR2tbM4ZFrqvUPxL0L2XqMi1vBQ7sW3uwyh4cqv91CwwoiBbAxVq1rlQUR+jnSRyEjNC6h1M/oA2OKICggGJYS5PrFzUhoDbMeerDgBaZS/vI6+PKxZDYjWijQsXrko0yxAORyeDEvRF/wVGzX7Kyb3H9app4S6HD118d+Cobn/mgCTbL4W3xxxnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=urw86vEP5XP4TfLRn0BEWIyixbASdSjSHwutCjQC5mY=;
 b=wynd2fdRPY5n4lQggGnSTGXvylKZUpEqBIiXxmoFGYEJKgweLiUZ5uN1+qEZw9upqNJ1v2oi/9JoC8Izd4ZbVZ9943LzyCxcLXUTKdfzqMB3sJD/34lp4k1hC3PJ8xE7fZnN8E1DztWtxU+R2SkPsg17AOrahSS71gdDZr6hzYpvEtE+IOB+k/NX8dDySTCUMXN0PZI80+oS643tqBFUai+rZ6hTIiDKP8Tmg7RcG06DAI/Vx4h9fH78trlwscgCO61DAwdAdIPbpQXkuj7OU8x5Cq2CSHXbzenMsxJaYneKZOFvvpQVtvH2N5U+WfcZthL/SrI+jWgbQ+G29LRR0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=xen.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=urw86vEP5XP4TfLRn0BEWIyixbASdSjSHwutCjQC5mY=;
 b=rChykOvpBFnk/XsChKbBQ6Aig4+GtLGHlk7aZ5Imh6yeqMqpxVA5NVQWzwasmxb2FMmfOqmOqIVMh8pUN1mJx6mmfxuNgpF2zOwTFcMRN2unPvj363GdJi01CY5YXVCu79u0a6LWwJAYLO8Cp01Byxdzmbf2X3kubnXf+A/InxI=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Date: Fri, 5 Sep 2025 16:01:15 -0700
From: Stefano Stabellini <stefano.stabellini@amd.com>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: <dmukhin@xen.org>
CC: Stefano Stabellini <sstabellini@kernel.org>,
	<xen-devel@lists.xenproject.org>, <andrew.cooper3@citrix.com>,
	<anthony.perard@vates.tech>, <jbeulich@suse.com>, <julien@xen.org>,
	<michal.orzel@amd.com>, <roger.pau@citrix.com>, <dmukhin@ford.com>
Subject: Re: [PATCH v5 15/15] emul/ns16x50: implement IRQ emulation via
 vIOAPIC
In-Reply-To: <aLtqIJbhqrGU8Pgc@kraken>
Message-ID: <alpine.DEB.2.22.394.2509051557060.1405870@ubuntu-linux-20-04-desktop>
References: <20250828235409.2835815-1-dmukhin@ford.com> <20250828235409.2835815-16-dmukhin@ford.com> <alpine.DEB.2.22.394.2508291508330.341243@ubuntu-linux-20-04-desktop> <aLtqIJbhqrGU8Pgc@kraken>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: None (SATLEXMB04.amd.com: stefano.stabellini@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF0002BA52:EE_|IA0PPF04DCE520E:EE_
X-MS-Office365-Filtering-Correlation-Id: 226e5b11-2895-47a1-139f-08ddecd021bc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700013|1800799024|82310400026|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?5d/Ymsoh3Q56SHOcmeGphMNlxWdKsBlc/kqKxn9CXNF+XN3Oyu5sI1SYcj1f?=
 =?us-ascii?Q?Q3pUITA5F+YOQ7v0lSd6tBuenj6Wlle+LvV8/lXiQu4T3Qe688ZqA1Dizaz7?=
 =?us-ascii?Q?HvA6+iL+zt3VsMwoBqeg2NAIOIwu30vDhepajRq88hQWUf+n/cOpXU6fvVbP?=
 =?us-ascii?Q?JIxMi3qN3QRGqUUkgYm+KetAvGnTvBb0Ae8hQinwvgLxC5lThXSRbGrooZxL?=
 =?us-ascii?Q?iVVYJzWDmDsU9ltlp2RkK+4t15/+pP5H+tsodAIk7T5cXqJnglOPu7MThp9B?=
 =?us-ascii?Q?cDnrSyoEI2rit25+DPikppPs3fUd8xbHNAWaFZyJB/lh24JwQh2qKdSixQ5f?=
 =?us-ascii?Q?uXqN6pqN5D5U1w7Vii3T6qZBzwC2/L0JGY+7D/cXoHz2eEkixL2eZ3m7hdYp?=
 =?us-ascii?Q?gkjbSXbottDyFUGaOqZ9b4zTVnSTfQGauVyssHwUXSHAC/9/0p+ofIGAB8cu?=
 =?us-ascii?Q?98QyJFRXQi1m8JcDc1mYojgFX11ptxn3Imuc7ruNsKi0mWXE0ISajaGE2W7f?=
 =?us-ascii?Q?H9XQsDYsLHD8H0n1VtHCQHg/kO4LFAnMhRpC4uh3W4Ate+H0PsBjpNnmZt3Q?=
 =?us-ascii?Q?UgZ+n/tW9o5S7mR7NZ6aEsfcNg4s9qKn/xQbfreHRY9/DYgGdnetbuo9q1I9?=
 =?us-ascii?Q?9NSc48+k1l28H5uaXp1cyr21k7Ck57ZAmmZA2xKt+vhli7VQVgBxm6S4HKwP?=
 =?us-ascii?Q?lF7WNBXcG/jkknBCYeW+OSju+Bawt8+8Y82b+hTtEmla7Q+bMNLQUTUgS+5C?=
 =?us-ascii?Q?2xm/AWej4HSkbfpoZNnahzNoZGl9mRUlXOgfkNcSU/yNzj8F0HD52cldNArX?=
 =?us-ascii?Q?WR641eCfj6Pz4TsjViww0loi//C6br2v+QvDQUclGNEe/eLyAFEEFjFucztN?=
 =?us-ascii?Q?XyWL2nJ2l5dOQCM1jWDpHI0Gv2e+Jc/uITU6ysgE0iRs2+QozXimWwyrUJqH?=
 =?us-ascii?Q?Pus/uHG/pQdLXf1EMtLO1D427gpXTwtU/b8G0KYqD05NFHHv9nhKSXO0h2oJ?=
 =?us-ascii?Q?LRQ/gnI5SvKYXz0+TVfG4BF4JnXjTNgAO7LKh5rp53RlZ7tDC2l7jdsKQsi1?=
 =?us-ascii?Q?Z7yXj7I5ZPtUkxOeMJdU5ybSz1grc63ibIixeqLpC9JxywWVb6ay78bK6DMh?=
 =?us-ascii?Q?dJRpKQTKcnV20MS1u1GD45+pOC4j9vu88AlB1MZqxyl9/Xqg5lvyIdJLFliv?=
 =?us-ascii?Q?bunegtfygpmdnhdbMR/AFY186ZX3Xb7knTMW00eIdHC01R5/idSQxEkpSR4v?=
 =?us-ascii?Q?de7vA3WcAQyyNooxW7uxb9fEe2uAH8RVwNXQuD71qPneR8cX1UpLDmSMI782?=
 =?us-ascii?Q?dnKcotT3Zspu8niIQxee8WXsuMSFVX/El1W2DJoID0L4RpFP7PXOyqo+Frsx?=
 =?us-ascii?Q?M1921rh7BHaR8IopNCSaBfEJg3FI30rBRZr3mxd/K1LzTye1Ham00kmusJMl?=
 =?us-ascii?Q?u2srUr+Hn6RAnOCOeJSaChfa7t8vtiWc4HuG1FHeKpGmOENJchALzUzgn61V?=
 =?us-ascii?Q?DvDZYnzSTbk5KLeDZ9WRaqGmTuLjoeBa697Q?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(1800799024)(82310400026)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Sep 2025 23:01:21.9160
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 226e5b11-2895-47a1-139f-08ddecd021bc
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF0002BA52.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PPF04DCE520E

On Fri, 5 Sep 2025, dmukhin@xen.org wrote:
> On Fri, Aug 29, 2025 at 03:21:13PM -0700, Stefano Stabellini wrote:
> > On Thu, 28 Aug 2025, dmukhin@xen.org wrote:
> > > From: Denis Mukhin <dmukhin@ford.com> 
> > > 
> > > PVH domains use vIOAPIC, not vPIC and NS16550 emulates ISA IRQs which cannot
> > > be asserted on vIOAPIC.
> > 
> > One option is to enable the vPIT for PVH domains when the NS16550
> > emulator is enabled. Would that resolve the problem? That would be a
> > simpler solution compared to adding IRQ_EMU because the IRQ_* logic is
> > already quite complex.
> 
> vPIC? (PIT is timer).
> 
> I tried to enable vPIC for hwdom, but there's some more work to make it work
> :-/
> 
> > 
> > Alternatively...
> [..]
> > 
> > > --- a/xen/arch/x86/hvm/vioapic.c
> > > +++ b/xen/arch/x86/hvm/vioapic.c
> > > @@ -177,6 +177,16 @@ static int vioapic_hwdom_map_gsi(unsigned int gsi, unsigned int trig,
> > >  
> > >      ASSERT(is_hardware_domain(currd));
> > >  
> > > +    /*
> > > +     * Interrupt is claimed by one of the platform virtual devices (e.g.
> > > +     * NS16550); do nothing.
> > > +     */
> > > +    write_lock(&currd->event_lock);
> > > +    ret = domain_irq_to_emuirq(currd, gsi);
> > > +    write_unlock(&currd->event_lock);
> > > +    if ( ret != IRQ_UNBOUND )
> > > +        return 0;
> > 
> > ..alternatively, we could have an add-hoc check here? Not very nice but
> > at least it would be very simple.
> > 
> > In other words, adding vPIT is preferable in my opinion but as a second
> > option I would consider an ad-hoc check. I would try to avoid adding
> > IRQ_EMU -- that should be the last resort in my view.
> 
> In my opinion, IRQ_EMU falls into category of an ad-hoc.
> 
> I think vioapic_hwdom_map_gsi() should not depend on the presence of certain
> virtual devices but rely on some global flag, e.g. via quering
> domain_irq_to_emuirq() infra.

Hi Denis, the reason why IRQ_EMU is dangerous is that there are a bunch
of checks emuirq != IRQ_PT and also emuirq != IRQ_MSI_EMU which I don't
know if they would still behave correctly after the introduction of
IRQ_EMU.

I would prefer to avoid the problem if possible...

