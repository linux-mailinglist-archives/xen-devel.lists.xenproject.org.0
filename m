Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A9748972887
	for <lists+xen-devel@lfdr.de>; Tue, 10 Sep 2024 06:47:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.794984.1204036 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1snsm4-0002I0-EA; Tue, 10 Sep 2024 04:46:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 794984.1204036; Tue, 10 Sep 2024 04:46:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1snsm4-0002F5-BI; Tue, 10 Sep 2024 04:46:44 +0000
Received: by outflank-mailman (input) for mailman id 794984;
 Tue, 10 Sep 2024 04:46:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JJ84=QI=amd.com=stefano.stabellini@srs-se1.protection.inumbo.net>)
 id 1snsm3-0002Dr-BC
 for xen-devel@lists.xenproject.org; Tue, 10 Sep 2024 04:46:43 +0000
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on2061b.outbound.protection.outlook.com
 [2a01:111:f403:2409::61b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id aa95a111-6f2f-11ef-99a1-01e77a169b0f;
 Tue, 10 Sep 2024 06:46:39 +0200 (CEST)
Received: from SJ2PR07CA0019.namprd07.prod.outlook.com (2603:10b6:a03:505::21)
 by CYXPR12MB9386.namprd12.prod.outlook.com (2603:10b6:930:de::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.24; Tue, 10 Sep
 2024 04:46:34 +0000
Received: from MWH0EPF000971E7.namprd02.prod.outlook.com
 (2603:10b6:a03:505:cafe::92) by SJ2PR07CA0019.outlook.office365.com
 (2603:10b6:a03:505::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.24 via Frontend
 Transport; Tue, 10 Sep 2024 04:46:33 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 MWH0EPF000971E7.mail.protection.outlook.com (10.167.243.75) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7918.13 via Frontend Transport; Tue, 10 Sep 2024 04:46:33 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 9 Sep
 2024 23:46:32 -0500
Received: from ubuntu-20.04.2-arm64.shared (10.180.168.240) by
 SATLEXMB03.amd.com (10.181.40.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 9 Sep 2024 23:46:31 -0500
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
X-Inumbo-ID: aa95a111-6f2f-11ef-99a1-01e77a169b0f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LozbYdh7r22sj+E4i3YFgc31uw5/vcmIu5nhr1Aw5rjExn1PvRHCCR27Z8Rc7m8gKwdBjdtWFdfei1bES7+FTEKeDr7JCA0IXIHoemnSfzAUOiUaidizhIB9BJb3OA5vRO03xCo8BSKVafexdJGGjTHUIhJ+YnvwuIdm5eifJBwaVqJxpaJDk82ybxTAYbMJElCe6eR0escqX2H0cnNSZ8CQiR69MSIpx/dTCifiANu9MIeFHdcgseD9VvjNRGRFo9j5ooEImN72jJvGeGOz1P0g68iqizj5EepzU7YUjDZrE7g7kEzpQWdNMG8dj6u97HW/01ky06438owI7EuD0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MNjgoZPRMZJ4FSml+vHTtmNgj3wE+sKqc/D2WYME75U=;
 b=nlCAWK2xrWZB630X2GkC6vsPscyolUtttJlsEoi92e7SzTiitjWIl/pyNKFNpN22TDyPv7OJOJYXazWvD2WBv8G+7rAhSPXCPecZJJBsqaizlsFGaYmTQRu2880JkpTb/ew03k1XQbah5e5W4vvE1dQJ7d6buntJTAjliTNX75V9LY1oJElnY5gbCTrlxd6PzLwpmU4eIPHlYqDrmH9jouO6vCDdGVmNqoSO6Fb8Nbk2GqFeZqQ7h4d69n0QvhkEsfMD3x8ouyif4NzKJ7+lGcqDOUBs+RWrkoCU81WC11AGRP3hxXUWEMrhyRS1k4QGighj6WFiJmDHiAb43nz5lw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MNjgoZPRMZJ4FSml+vHTtmNgj3wE+sKqc/D2WYME75U=;
 b=axDW0SUloEjNU5iPSvF0Q/aFwW30/NCCqMonMaK9pGRl3KpUlrza/Ji+uMuWzqA4nQHFIkUaoxnwtfRpG8OVB3WVhmBdqxlaEJmwX6fMnxZJo+VgtdMMfQ7R+DyvkGyLkWFj3a2NnZMwx8PPb16NQIYyWaDMTiQKLzgjNsTwxE4=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Date: Mon, 9 Sep 2024 21:46:30 -0700
From: Stefano Stabellini <stefano.stabellini@amd.com>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jan Beulich <jbeulich@suse.com>
CC: Nicola Vetrini <nicola.vetrini@bugseng.com>, <sstabellini@kernel.org>,
	<michal.orzel@amd.com>, <xenia.ragiadakou@amd.com>,
	<ayan.kumar.halder@amd.com>, <consulting@bugseng.com>,
	<xen-devel@lists.xenproject.org>
Subject: Re: [XEN PATCH v2] automation/eclair_analysis: deviate linker symbols
 for Rule 18.2
In-Reply-To: <b0599929-d6f7-48f8-b93c-4b4882225da9@suse.com>
Message-ID: <alpine.DEB.2.22.394.2409092141570.3672@ubuntu-linux-20-04-desktop>
References: <e3a9c3268685562ae557248d6e76376579d99715.1725714006.git.nicola.vetrini@bugseng.com> <b0599929-d6f7-48f8-b93c-4b4882225da9@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: None (SATLEXMB04.amd.com: stefano.stabellini@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000971E7:EE_|CYXPR12MB9386:EE_
X-MS-Office365-Filtering-Correlation-Id: aa8a3011-12f8-4eeb-c5fc-08dcd1538b98
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?EA5oh6SM/KJKzfk6EyD4Knk81RlmTUQfWwm4g1ic7bKHpNzYN7VkU3oZM6Cw?=
 =?us-ascii?Q?i3C9MZZth4mGC/RI/y8lAhl50K/givYySgQa1wfsXUr2WN74JLg7n/X8zo9N?=
 =?us-ascii?Q?Ec3K8F7fQ5LIAfIM99G/RpKUPHyHApBCQHHIsq4n3RsngcE4FoA9XOs4Ahft?=
 =?us-ascii?Q?z509hRDqk3aqtKZ9F9MAweWu4ej4mXOg5cAVVEwnkLrXEwbhr8H55AG7Dqc6?=
 =?us-ascii?Q?nAke0kWRaqzM3/C7z7uJk8cw7X0JFd5EVfImgJ3hcsOlny7n6LsuqtWML2yK?=
 =?us-ascii?Q?AQbOs7hOvWGGPSMFz5GCX/702/dSsrcVKrDpAYSTaxff+62rHBmme+0hv++V?=
 =?us-ascii?Q?/YW4sW9nQyNkQUZEpLMmiDTWySO/l4mvX5ZbSbGfJaDGgh6f8WJnWHEyXMN9?=
 =?us-ascii?Q?HBAH7DwAenSBFuC6GP2NG57uU7NI2XGVO4iN0qLzcG5lUyhRBwvVUeySlNRa?=
 =?us-ascii?Q?aThpk7OU246XBzS4e5BC+l5K2esZxiIDhuFGVTeUkXnmzsbv23zZo98u/k44?=
 =?us-ascii?Q?b5XyYdaw89wFQyQ18EIUcpaq1c3nKHbDJDDkbMX6gVmIgK04vA2XTOQVDGTe?=
 =?us-ascii?Q?riL6+a63xTnhXst1ffEIAiZ6+K0sGEqeX/5VIMIao3IYVB66zA9Dr81EIr9p?=
 =?us-ascii?Q?5yJ+HPKED8xzuFJqbzmfdjbZ8rLOtD/t3WvwAfGFBF9FEEvZ5qFQIWKsLSD3?=
 =?us-ascii?Q?tT7GdVlqQbgQL5jeWSagpL9Jb9fUz01Xl4k75tBkNFUu0v1X/3+o2PBCunv/?=
 =?us-ascii?Q?Y0aYbuHO6F51Qnh5uVP32KqHxCZludKX3vQgnPqSSfTYhKuWlvl3Lt7F/JLW?=
 =?us-ascii?Q?QZKnHPRptTnkDxZrkSW3PYPadxw5oxcwsmBnIlAw5Mgp1GNyr+g6MKmIEKlO?=
 =?us-ascii?Q?0GlbCoVGrUetsFzSG+J/VenL194C3QDRfiBpqil4ou+hJ2Nr9i3ub/PyDWvG?=
 =?us-ascii?Q?YJq8nlA2BwOPiernhm/3gR7wufSvVXmJKLkJF34+yWAYWkHAe6zlpx5rm87D?=
 =?us-ascii?Q?xWFZ2D6vWaeD39/eb+eJ/o5qk8L/t8tNuaVffKpNfZnRthj5DiV34MZrhlZa?=
 =?us-ascii?Q?7+K3XnQC5WpTKjtioSOJjkVz1HWKtRx8IS/PnClTuXT18OIZegAHesBP3SSV?=
 =?us-ascii?Q?bFv7Fqg318uPQPtc9lVfeokIrnGmoqwR/XSZDUIr6uGgljMp0Yf4c8QQNanc?=
 =?us-ascii?Q?l/M+z/IFCvJE5gQg+uLDsT7s+P/rqvWUNj3X3QXC1uldtstpoQ6OIg9DoT9c?=
 =?us-ascii?Q?WBKHzMhqbOYsTJx8gIEeYHk52xHy9FUcgMw6EgqPhYmaMv7ahBNQuejxLDHK?=
 =?us-ascii?Q?/5+Ofo5yRUpDw49DWUf3Ca+n937aMxhDHe9AmqPX1xDB+/xEavGDsYjWesuR?=
 =?us-ascii?Q?r5OAMQ8IgasX84fwrqXi1fWatEKvnchoZCEur40USzHzJY1lxtDLqGHueIiv?=
 =?us-ascii?Q?mOuERZjZABr3nct8TwpoHToURg+K5g3b?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2024 04:46:33.2741
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: aa8a3011-12f8-4eeb-c5fc-08dcd1538b98
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000971E7.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYXPR12MB9386

On Mon, 9 Sep 2024, Jan Beulich wrote:
> On 07.09.2024 15:03, Nicola Vetrini wrote:
> > --- a/docs/misra/deviations.rst
> > +++ b/docs/misra/deviations.rst
> > @@ -501,6 +501,16 @@ Deviations related to MISRA C:2012 Rules:
> >           - __builtin_memset()
> >           - cpumask_check()
> >  
> > +   * - R18.2
> > +     - Subtractions between pointers where at least one of the operand is a
> > +       pointer to a symbol defined by the linker are safe.
> 
> Imo there should be "deemed" in there, as such subtractions aren't
> necessarily safe. We've merely settled on considering the risk as
> acceptable, iirc.

I can add it on commit


> > +     - Tagged as `safe` for ECLAIR.
> > +
> > +   * - R18.2
> > +     - Subtraction between pointers encapsulated by macro page_to_mfn
> > +       are safe.
> > +     - Tagged as `safe` for ECLAIR.
> 
> This one is a result of using frame_table[], aiui. Alternative approaches
> were discussed before. Did that not lead anywhere, requiring a purely
> textual / configurational deviation?

During the last MISRA discussion we agree that this was an acceptable
approach. What else did you have in mind? In any case, keep in mind that
exploring options is a task in itself and we could use our efforts on
reducing the numbers of violations instead which I think is more useful.

