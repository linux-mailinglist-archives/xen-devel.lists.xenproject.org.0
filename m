Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BCC1540A1BB
	for <lists+xen-devel@lfdr.de>; Tue, 14 Sep 2021 01:52:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.186008.334753 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mPvjZ-0005L4-3d; Mon, 13 Sep 2021 23:51:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 186008.334753; Mon, 13 Sep 2021 23:51:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mPvjY-0005IN-Vu; Mon, 13 Sep 2021 23:51:32 +0000
Received: by outflank-mailman (input) for mailman id 186008;
 Mon, 13 Sep 2021 23:51:31 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uZue=OD=xilinx.com=stefanos@srs-us1.protection.inumbo.net>)
 id 1mPvjW-0005IH-Uw
 for xen-devel@lists.xen.org; Mon, 13 Sep 2021 23:51:31 +0000
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (unknown
 [40.107.96.40]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ea8a4d6c-7a16-4808-a39b-9053d2451f38;
 Mon, 13 Sep 2021 23:51:29 +0000 (UTC)
Received: from BN0PR02CA0021.namprd02.prod.outlook.com (2603:10b6:408:e4::26)
 by CH2PR02MB6776.namprd02.prod.outlook.com (2603:10b6:610:7d::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.16; Mon, 13 Sep
 2021 23:51:26 +0000
Received: from BN1NAM02FT037.eop-nam02.prod.protection.outlook.com
 (2603:10b6:408:e4:cafe::3b) by BN0PR02CA0021.outlook.office365.com
 (2603:10b6:408:e4::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.15 via Frontend
 Transport; Mon, 13 Sep 2021 23:51:26 +0000
Received: from xsj-pvapexch01.xlnx.xilinx.com (149.199.62.198) by
 BN1NAM02FT037.mail.protection.outlook.com (10.13.2.148) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4500.14 via Frontend Transport; Mon, 13 Sep 2021 23:51:25 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Mon, 13 Sep 2021 16:51:16 -0700
Received: from smtp.xilinx.com (172.19.127.96) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Mon, 13 Sep 2021 16:51:16 -0700
Received: from [10.23.120.123] (port=50347 helo=localhost)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <stefano.stabellini@xilinx.com>)
 id 1mPvjI-000DaH-15; Mon, 13 Sep 2021 16:51:16 -0700
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
X-Inumbo-ID: ea8a4d6c-7a16-4808-a39b-9053d2451f38
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TlE+sqcZ84m+zoXfjG7NnbbcBUUOtVLZ5xgW1xl/wLrMC/QjY0IwU+y3oqprY7GTRepMNyW/wjgvFn7BaxgaQfTg3fJy9YKLdXuaUCnBfKiNYDK0Zs5I91li+7SDCVHB5VVdXfW0BQMCh96oLrhJAuZ3cKJEUnbXqmHN9UZhcU+8tBlg3EUTJ1zTOyFquBvnDfdddsVAuGT3++81tNRzfwy4di3LLg/3DBzTOxTN02w12fpqA+rNGxIFXI5RhN6mSMARuGKSpzaI9zZ1gRJux7hKj1XiyWnYL8VOwMf5MfKcQB86t5mJKiiozNpKwY2bg0mhYjtLSnGT71Yz/eBFjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=uvhrbYiih/BgnbeDkHjMOlRTobKBT60UTUhY7unmeDU=;
 b=oS0LHbyFvFOdQQReOoBnfCD9pREoWzup+EL4RpBAnb7ofUDuOccu/ClojHnILP5CAa96ev08xDX7agXSN/rzR5gBjQ3hA20rLUTTVMZCl/aImJ/bjublzBY7mYJ5eeRAheNdkPFqkDI1K9uRw6vZRXsYWWF4Az4AoWVAwSINRkR6RpM7oCYSe4Jn+DN24XexUKhnwkwjZrcaZfKamsjY7ySMJzGdO87nyLq9PbHBDY/JwERjtOmRZvMdX5DPDklEx4MVzXpsfenhZBpB5HJjsS90ZMztS919JkE9w7gRjyLp3ynZXmsC2Et/whOtD/wkLY22nQDDB+CMaJOuRvbciQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=linaro.org smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uvhrbYiih/BgnbeDkHjMOlRTobKBT60UTUhY7unmeDU=;
 b=gjgvOyFPPQXcYE7mZEDlBgG8vfgKaBX4IuIYiBTII/Fkw/1BvoICEN2Z5kljmmlBntJsSjGWlnpjXCtNgt4L5dwapruVqnnJBpb1fmdkeBYgSZanELQX23Z4pb7sHwjtsQbl2VODmxMRyGzNnP1ZjZktimm0U9FEs0xa8aZPjSY=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch01.xlnx.xilinx.com;
Date: Mon, 13 Sep 2021 16:51:15 -0700
From: Stefano Stabellini <stefano.stabellini@xilinx.com>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: AKASHI Takahiro <takahiro.akashi@linaro.org>
CC: Alex Benn??e <alex.bennee@linaro.org>, Stefan Hajnoczi
	<stefanha@redhat.com>, Stefano Stabellini <sstabellini@kernel.org>, Stratos
 Mailing List <stratos-dev@op-lists.linaro.org>,
	<virtio-dev@lists.oasis-open.org>, Arnd Bergmann <arnd.bergmann@linaro.org>,
	Viresh Kumar <viresh.kumar@linaro.org>, Stefano Stabellini
	<stefano.stabellini@xilinx.com>, Jan Kiszka <jan.kiszka@siemens.com>, Carl
 van Schaik <cvanscha@qti.qualcomm.com>, <pratikp@quicinc.com>, Srivatsa
 Vaddagiri <vatsa@codeaurora.org>, Jean-Philippe Brucker
	<jean-philippe@linaro.org>, Mathieu Poirier <mathieu.poirier@linaro.org>,
	<Wei.Chen@arm.com>, <olekstysh@gmail.com>, <Oleksandr_Tyshchenko@epam.com>,
	<Bertrand.Marquis@arm.com>, <Artem_Mygaiev@epam.com>, <julien@xen.org>,
	<jgross@suse.com>, <paul@xen.org>, <xen-devel@lists.xen.org>, Elena Afanasova
	<eafanasova@gmail.com>
Subject: Re: Enabling hypervisor agnosticism for VirtIO backends
In-Reply-To: <20210906022356.GD40187@laputa>
Message-ID: <alpine.DEB.2.21.2109131615570.10523@sstabellini-ThinkPad-T480s>
References: <87v94ldrqq.fsf@linaro.org> <alpine.DEB.2.21.2108041055390.9768@sstabellini-ThinkPad-T480s> <YRuSPT9075NuWRYS@stefanha-x1.localdomain> <875yvkh1p1.fsf@linaro.org> <20210903080609.GD47953@laputa> <87czpqq9qu.fsf@linaro.org>
 <20210906022356.GD40187@laputa>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9ac308c8-504f-4cdc-d5d2-08d977116620
X-MS-TrafficTypeDiagnostic: CH2PR02MB6776:
X-Microsoft-Antispam-PRVS:
	<CH2PR02MB67769995CDC9C29D0F19C6DCA0D99@CH2PR02MB6776.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	tyDxsviuIQ8x/+fA5OsHGPoHwHXbIIzOLtbDSR9SwOzsT+KMWVDWNH2687hkHWwz4g3aNIyDHdW6HfqYA1MJs7nMgs4L+0DO1qo4Q4vsUhYNCSaBtu2WV9iigzKVm8KcZl97qFniNxSs1txBleoF0asXBIWuQC3vXwx6+YzKdYFi7rTUoQ/gGZMEO7ar6LgeS5Kc7s4TbJNqGtk7NxXr8KJWoUHKsyhICIGS600Xe7/5Sz2mKytnKW6nHQcQ9lcqp0xpmTvlDqZ+SZbzxaSb9ATBwt1Ayzk8lkAJfpGvWWQFeGTlLqVp4mbpDlYrFhpKXg8T3boamgCHMVu7CvgDLq0392/n9qL/M35X9hcu8fjZcSLvnDzFFV3Gi7Wd3g8Sz3fwxNo+QzDB0HGrnXNs+ytNL9+udWGmdoFawPMVqT8lJcClZVuOOr9bB0M1sMyvkYAtcLZC3gsmQ1fE7ei93UUTwrbk+n4WUFs/V8Yv69OT3z+532x3VqRiolbQD53Zdy3ntv1YuDfVfCB55K3HMZGiP0g70EiILQDXsdR3RwmHdLvbTUaWaJVSIha80rH9HURf3sePC3lQQRgwRkftzRmqDvrKpzq0wsscePby42l3taz3E5blS0NWVs49W116zhlRM1WuDBGc1xar8s69XbTRAVHV4KMwhxKO+hw02Q7BKcR9iTrj2fgw6N/Tfg4ii2IDYV73X6KYEEJFYF5qY2Hs+XeR6JS0W/BtUg1t8Spcdz/l28IDmsKpmRos6qB/iCtEFbBnCYyMNv3VZHL71BGfUwLjQ9bmNAyfGk8aqKk=
X-Forefront-Antispam-Report:
	CIP:149.199.62.198;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapexch01.xlnx.xilinx.com;PTR:unknown-62-198.xilinx.com;CAT:NONE;SFS:(4636009)(7916004)(396003)(346002)(39860400002)(136003)(376002)(46966006)(36840700001)(316002)(426003)(36906005)(7636003)(70586007)(9786002)(70206006)(82310400003)(2906002)(44832011)(336012)(36860700001)(9686003)(47076005)(82740400003)(26005)(5660300002)(966005)(4326008)(8936002)(6916009)(478600001)(8676002)(7416002)(356005)(54906003)(186003)(83380400001)(33716001);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Sep 2021 23:51:25.9733
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ac308c8-504f-4cdc-d5d2-08d977116620
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.62.198];Helo=[xsj-pvapexch01.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1NAM02FT037.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR02MB6776

On Mon, 6 Sep 2021, AKASHI Takahiro wrote:
> > the second is how many context switches are involved in a transaction.
> > Of course with all things there is a trade off. Things involving the
> > very tightest latency would probably opt for a bare metal backend which
> > I think would imply hypervisor knowledge in the backend binary.
> 
> In configuration phase of virtio device, the latency won't be a big matter.
> In device operations (i.e. read/write to block devices), if we can
> resolve 'mmap' issue, as Oleksandr is proposing right now, the only issue is
> how efficiently we can deliver notification to the opposite side. Right?
> And this is a very common problem whatever approach we would take.
> 
> Anyhow, if we do care the latency in my approach, most of virtio-proxy-
> related code can be re-implemented just as a stub (or shim?) library
> since the protocols are defined as RPCs.
> In this case, however, we would lose the benefit of providing "single binary"
> BE.
> (I know this is is an arguable requirement, though.)

In my experience, latency, performance, and security are far more
important than providing a single binary.

In my opinion, we should optimize for the best performance and security,
then be practical on the topic of hypervisor agnosticism. For instance,
a shared source with a small hypervisor-specific component, with one
implementation of the small component for each hypervisor, would provide
a good enough hypervisor abstraction. It is good to be hypervisor
agnostic, but I wouldn't go extra lengths to have a single binary. I
cannot picture a case where a BE binary needs to be moved between
different hypervisors and a recompilation is impossible (BE, not FE).
Instead, I can definitely imagine detailed requirements on IRQ latency
having to be lower than 10us or bandwidth higher than 500 MB/sec.

Instead of virtio-proxy, my suggestion is to work together on a common
project and common source with others interested in the same problem.

I would pick something like kvmtool as a basis. It doesn't have to be
kvmtools, and kvmtools specifically is GPL-licensed, which is
unfortunate because it would help if the license was BSD-style for ease
of integration with Zephyr and other RTOSes.

As long as the project is open to working together on multiple
hypervisors and deployment models then it is fine. For instance, the
shared source could be based on OpenAMP kvmtool [1] (the original
kvmtool likely prefers to stay small and narrow-focused on KVM). OpenAMP
kvmtool was created to add support for hypervisor-less virtio but they
are very open to hypervisors too. It could be a good place to add a Xen
implementation, a KVM fatqueue implementation, a Jailhouse
implementation, etc. -- work together toward the common goal of a single
BE source (not binary) supporting multiple different deployment models.


[1] https://github.com/OpenAMP/kvmtool

