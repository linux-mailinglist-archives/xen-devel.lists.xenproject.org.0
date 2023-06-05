Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BA6E723268
	for <lists+xen-devel@lfdr.de>; Mon,  5 Jun 2023 23:40:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.543923.849306 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q6HvS-00053d-5X; Mon, 05 Jun 2023 21:39:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 543923.849306; Mon, 05 Jun 2023 21:39:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q6HvS-00051X-2o; Mon, 05 Jun 2023 21:39:42 +0000
Received: by outflank-mailman (input) for mailman id 543923;
 Mon, 05 Jun 2023 21:39:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wQOD=BZ=amd.com=stefano.stabellini@srs-se1.protection.inumbo.net>)
 id 1q6HvQ-00051R-Gq
 for xen-devel@lists.xenproject.org; Mon, 05 Jun 2023 21:39:40 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on20631.outbound.protection.outlook.com
 [2a01:111:f400:7eaa::631])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 77548080-03e9-11ee-8611-37d641c3527e;
 Mon, 05 Jun 2023 23:39:37 +0200 (CEST)
Received: from BYAPR07CA0006.namprd07.prod.outlook.com (2603:10b6:a02:bc::19)
 by IA0PR12MB8206.namprd12.prod.outlook.com (2603:10b6:208:403::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.32; Mon, 5 Jun
 2023 21:39:32 +0000
Received: from DM6NAM11FT099.eop-nam11.prod.protection.outlook.com
 (2603:10b6:a02:bc:cafe::23) by BYAPR07CA0006.outlook.office365.com
 (2603:10b6:a02:bc::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.33 via Frontend
 Transport; Mon, 5 Jun 2023 21:39:31 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DM6NAM11FT099.mail.protection.outlook.com (10.13.172.241) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6455.33 via Frontend Transport; Mon, 5 Jun 2023 21:39:31 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Mon, 5 Jun
 2023 16:39:30 -0500
Received: from ubuntu-20.04.2-arm64.shared (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.34 via Frontend Transport; Mon, 5 Jun 2023 16:39:29 -0500
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
X-Inumbo-ID: 77548080-03e9-11ee-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=elmlYW6sItkgQ1L2rWanQbiDnt9qz4fqVSDO5GFqB06tHQxU/oFCzEmcsydWPAagCrWWVg0djo385eoFyG88YQXvhkshtr1wYszUtndljuab3USqD1C9HEvxBCMVnNdg4HtJ/Kc2drRX+6+zATsEUo0Ycs4aS0tH6CFHdW7aIQxKEQpdl+EmMbNKXKVrlug906ZBn3R7AulOMHiZ2OgCyMkzuNUhu1cyexh1JyFkbwB1SDLcBXucCH9Q83i4yedsjfZNyBJR8PyS+UDqieV9maaaqNqZRBbRo3xL1iGolmkT8KZt6skBQb4AAGkmi2dyPJvy/ESbrkfwMnDY15Xvhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3sUczbDXjmMZe7GlucbeQzB1gtOCgQO7kTKUdod/ILE=;
 b=AaGhveYrMlbfnTkpsJ33L9hn9QDAug8a9O01IFN0S0Y2+GY071ZVzFvHcOiP8UBD9x1HU9gj/hb4T39iUrxdv7LGsXeZA87rG37eEV1ye5pjHvDYhZa8BzKJXUtW8AFRtWFR8WdNV/diSc/cJUqKu5XBXdcN46vExJl9thgenBbLxaws2X3cXfAoqszJ+fvZQx+lr+qYMYxi/yDv3dVO4mwABDsYJpNXDBePSmJK+jCA4zDZgjASYUwlrkk4DLQ2KlVNfpWYpZgEr4E9Gxpiezt+PMttkUCWyCzBrdBPdo5naMpou3ixne3shkOeKhVixGkNStRWHONq3LSq5WwSPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=bugseng.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3sUczbDXjmMZe7GlucbeQzB1gtOCgQO7kTKUdod/ILE=;
 b=xKqLSnQyD0oad/2zazHFaA3b7jvoAUHgFf8CL4g13hwI+rAl+y4R77t6qbZVXlqd+HO6A0XXM2cTcJtnasRkGIYJ3q1dZniQCJOjJYnQkrlZbbQMX0r4RtHGrC6kyi4L2kAUjLeCA9LaWdpdG9KErB4psCJ8l5u8GWE7lSm2JQs=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Date: Mon, 5 Jun 2023 14:39:28 -0700
From: Stefano Stabellini <stefano.stabellini@amd.com>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Roberto Bagnara <roberto.bagnara@bugseng.com>
CC: Jan Beulich <jbeulich@suse.com>, Stefano Stabellini
	<stefano.stabellini@amd.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: Re: Xen reliance on non-standard GCC features
In-Reply-To: <80a512ac-d90e-930a-7ef7-8ebb5a80e801@bugseng.com>
Message-ID: <alpine.DEB.2.22.394.2306051430370.3080090@ubuntu-linux-20-04-desktop>
References: <1cd359e7-5245-a621-3be2-9323ba5b327b@bugseng.com> <8314e0fc-4ead-40fa-ef7b-4da8ce0655b4@suse.com> <80a512ac-d90e-930a-7ef7-8ebb5a80e801@bugseng.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT099:EE_|IA0PR12MB8206:EE_
X-MS-Office365-Filtering-Correlation-Id: b9b4f02c-8ec3-4083-086b-08db660d58af
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	0KbFh3pEV409LARfdONEjiGcYPjOBOEo7lo0SzgoR3YorkDrm/+1DaY4SdUrVawL/q4fSpyOIMRRDeVdz+8GT1a6ZNha5xuh5Eyu98FwKQoH3LColPiPVDFO4LsLOwExkMFC0IciiCkqvHtkZH3q7F7/CznbaNovMVewFtpjTcxp61rfNHCFZu88FHtJdp69cY3eOwbTK21BRGjrYTtRwk7gQxsdQH7HBzyWRafL+E6fA73hn6+OE53fLYm7051+AGZaEprUE8Xbm+kGPCD+Y80QXwbTLh6Zbh+K17rG6FyhUnnNmtyVs7au/dX3P40SckIqcWzAoTgEtyIYcSzTcRMlHX2c8iV9GZVaYNoToQKXNkTJe3rKvDWsYbIbW+NWi2bDjYKig1umGYtaMB+to6t5qc+Z8ASfbJSglX8qZatImeQCKq7vq+3/9bcBJw944Ziy2UgEBPrLq1MiStEhD2Jpx9CKrGU/8wa2guvx/RTTH+/Ys4hIdv4z8BdrT4ZxdGoZaPS5ueY+CIycmNqAF8N3ZDKg7k0iT2HNCOiT2HLWU7h455CgP7pZZnIlnCWv3TneJnk5i4NTNrCr4aV2tZ/e2bhupbHaayvJdwTHFXjHGQQV2hCF5NhYpPnPzSJC/vO1im7DegAKd3ZUmGioKKBgVcINoFNlM9wY28NQMLuCfMoaHljYfGWC2qBTlarcOKkhxHJxqSQv5W9XHtd4bV+Nj3AB6Iinevm2PdpSu7luHOa/AMWpLHGhaERPeKSwTzPQgYUqI/NsBPfkD0SaMw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(7916004)(4636009)(376002)(346002)(396003)(136003)(39860400002)(451199021)(40470700004)(46966006)(36840700001)(9686003)(41300700001)(336012)(426003)(47076005)(186003)(26005)(36860700001)(83380400001)(40460700003)(478600001)(40480700001)(54906003)(4326008)(6916009)(81166007)(82310400005)(356005)(70586007)(70206006)(316002)(82740400003)(8676002)(5660300002)(8936002)(44832011)(2906002)(33716001)(86362001)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2023 21:39:31.0749
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b9b4f02c-8ec3-4083-086b-08db660d58af
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DM6NAM11FT099.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8206

On Mon, 5 Jun 2023, Roberto Bagnara wrote:
> > > Here is a list of extensions that are documented in the GCC manual:
> > 
> > I suppose that this list wasn't meant to be complete? The most
> > prominent example is probably asm().
> 
> As far as I can tell the list was almost complete (I realize now
> that the use of the keyword __signed__ was omitted because
> investigation was not completed).  But I am probably misunderstanding
> you.

We also make use of the following extensions (please correct me if I am
wrong and these are not extensions):

xen/include/xen/compiler.h:#define always_inline __inline__ __attribute__ ((__always_inline__))
xen/include/xen/compiler.h:#define gnu_inline    __inline__ __attribute__ ((__gnu_inline__))
xen/include/xen/compiler.h:#define noinline      __attribute__((__noinline__))
xen/include/xen/compiler.h:#define noreturn      __attribute__((__noreturn__))
xen/include/xen/compiler.h:#define __packed      __attribute__((__packed__))
xen/include/xen/compiler.h:#define __weak        __attribute__((__weak__))
xen/include/xen/compiler.h:# define nocall       __attribute__((__error__("Nonstandard ABI")))
xen/include/xen/compiler.h:# define cf_check     __attribute__((__cf_check__))
xen/include/xen/compiler.h:# define fallthrough        __attribute__((__fallthrough__))
xen/include/xen/compiler.h:#define __aligned(a) __attribute__((__aligned__(a)))
xen/include/xen/compiler.h:#define __attribute_pure__  __attribute__((__pure__))
xen/include/xen/compiler.h:#define __attribute_const__ __attribute__((__const__))
xen/include/xen/compiler.h:#define __transparent__     __attribute__((__transparent_union__))
xen/include/xen/compiler.h:#define __used         __attribute__((__used__))
xen/include/xen/compiler.h:#define __maybe_unused __attribute__((__unused__))
xen/include/xen/compiler.h:#define __must_check __attribute__((__warn_unused_result__))
xen/include/xen/compiler.h:#define __nonnull(...) __attribute__((__nonnull__(__VA_ARGS__)))

It is possible that some of these don't show up in any of the relevant
code build as part of the minimal configuration for safety so you won't
see any errors/warnings in Eclair.

Also, some of these extensions are probably no longer necessary, such as
__gnu_inline__.

