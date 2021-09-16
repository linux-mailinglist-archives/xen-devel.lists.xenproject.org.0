Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C364C40D191
	for <lists+xen-devel@lfdr.de>; Thu, 16 Sep 2021 04:12:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.187980.337015 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mQgsM-0007ul-7N; Thu, 16 Sep 2021 02:11:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 187980.337015; Thu, 16 Sep 2021 02:11:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mQgsM-0007t1-25; Thu, 16 Sep 2021 02:11:46 +0000
Received: by outflank-mailman (input) for mailman id 187980;
 Thu, 16 Sep 2021 02:11:44 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=54Q8=OG=xilinx.com=stefanos@srs-us1.protection.inumbo.net>)
 id 1mQgsK-0007sv-8i
 for xen-devel@lists.xen.org; Thu, 16 Sep 2021 02:11:44 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (unknown
 [40.107.236.77]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ed91bf96-5965-49c7-84be-7b64f29a52e3;
 Thu, 16 Sep 2021 02:11:42 +0000 (UTC)
Received: from BN0PR04CA0113.namprd04.prod.outlook.com (2603:10b6:408:ec::28)
 by BL3PR02MB7875.namprd02.prod.outlook.com (2603:10b6:208:33e::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.14; Thu, 16 Sep
 2021 02:11:39 +0000
Received: from BN1NAM02FT024.eop-nam02.prod.protection.outlook.com
 (2603:10b6:408:ec:cafe::23) by BN0PR04CA0113.outlook.office365.com
 (2603:10b6:408:ec::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.14 via Frontend
 Transport; Thu, 16 Sep 2021 02:11:40 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (149.199.62.198) by
 BN1NAM02FT024.mail.protection.outlook.com (10.13.2.138) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4523.14 via Frontend Transport; Thu, 16 Sep 2021 02:11:38 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Wed, 15 Sep 2021 19:11:13 -0700
Received: from smtp.xilinx.com (172.19.127.95) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Wed, 15 Sep 2021 19:11:13 -0700
Received: from [10.23.120.123] (port=58151 helo=localhost)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <stefano.stabellini@xilinx.com>)
 id 1mQgrp-000El2-Hq; Wed, 15 Sep 2021 19:11:13 -0700
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
X-Inumbo-ID: ed91bf96-5965-49c7-84be-7b64f29a52e3
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BwIwyJEUx4bglYFyGgh4jAIDuTeqs3456XEUeenA0O6Fh6sDjxT/kiZ9Xd0nwX5JwQCYMCOZkPD0bIlu19CQGSbke3lo3kUZeSXVNuaG1M72jlrj83Wlouc8+hVTZCxLq0Dem/R0OmPxf6hddBJIJK62js3WSWQ4Sy1796w5NzwHcnxelb+A8MAb3MefxpWTqo5+TRr/JzX6T+aYtyxd3PS07wjYk851LRaG0ZUNin6FDOrGVB5ObpW47ClUqj6sCbRqb2OTDxRVAIpO1z/LEmnzU0gPPA8f/v0pekU9co0GRyDpR2xL410pKSe4G9urz+LEIq5S7jgczCtDCaR8QQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=MU9RjuCzOWHaLkh+VZKJRtIQ/bdhrC8FhXuQTF7/8Uc=;
 b=eP8lzPeHDIJsTAY7t/2Z1v9XWqxFQzR3Ghs4Q32HJElR1rnAxmTZ77p7AT2r0lOfGfKrFe63rcaMuOEOWeRmG6NAdLqiYdAznq8DxAs16FuM1w25m/XUDMQhmvyz7rSxwj/5R0dZYT7djUp0tGrMqIcGG8Ji837D/s1RSAe69GXzwJWvm3hg5cBJWAJtKHr4k9wb8LuG98a1SklLd43cCPVsJaiFTwbvgBBGZVrfEEyhw1Vx8eHFcvozhCve7VpAOqWPOFL79+7J8Y+8JzMdIbh3qdnSE2WV3EJuLlyQYsTTphk29dPu7H1wtjoXgeRYBwn9K6fUVhFaahgn+TOLUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=quicinc.com smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MU9RjuCzOWHaLkh+VZKJRtIQ/bdhrC8FhXuQTF7/8Uc=;
 b=YuZo0KXYM7NaZtBQGJBq3nVZiaR6Y41SNI4c9rxcbAyTKHaODvPJr/oiAiGZcxKhGu7SnxQq/SWtYgpwoz2rFQQJ+JGTyVyYY5JXcW7ycZuzDmOg75G0EH1wyHJDQgyeQr6WyESscZ+aP3gHUQ5HCIt8VdeTz+uepwWY921mtrY=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; quicinc.com; dkim=none (message not signed)
 header.d=none;quicinc.com; dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch02.xlnx.xilinx.com;
Date: Wed, 15 Sep 2021 19:11:12 -0700
From: Stefano Stabellini <stefano.stabellini@xilinx.com>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Trilok Soni <quic_tsoni@quicinc.com>
CC: Stefano Stabellini <stefano.stabellini@xilinx.com>, AKASHI Takahiro
	<takahiro.akashi@linaro.org>, <paul@xen.org>, Stratos Mailing List
	<stratos-dev@op-lists.linaro.org>, <virtio-dev@lists.oasis-open.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Jan Kiszka <jan.kiszka@siemens.com>,
	Arnd Bergmann <arnd.bergmann@linaro.org>, <jgross@suse.com>,
	<julien@xen.org>, Carl van Schaik <cvanscha@qti.qualcomm.com>,
	<Bertrand.Marquis@arm.com>, Stefan Hajnoczi <stefanha@redhat.com>,
	<Artem_Mygaiev@epam.com>, <xen-devel@lists.xen.org>, <olekstysh@gmail.com>,
	<Oleksandr_Tyshchenko@epam.com>, Elena Afanasova <eafanasova@gmail.com>
Subject: Re: [Stratos-dev] Enabling hypervisor agnosticism for VirtIO
 backends
In-Reply-To: <1fcd68fc-eace-2501-cc0d-4fa3ea96da75@quicinc.com>
Message-ID: <alpine.DEB.2.21.2109151849310.21985@sstabellini-ThinkPad-T480s>
References: <87v94ldrqq.fsf@linaro.org> <alpine.DEB.2.21.2108041055390.9768@sstabellini-ThinkPad-T480s> <YRuSPT9075NuWRYS@stefanha-x1.localdomain> <875yvkh1p1.fsf@linaro.org> <20210903080609.GD47953@laputa> <87czpqq9qu.fsf@linaro.org> <20210906022356.GD40187@laputa>
 <alpine.DEB.2.21.2109131615570.10523@sstabellini-ThinkPad-T480s> <e9df2014-b691-1ee4-7fcd-03912d0aed59@quicinc.com> <alpine.DEB.2.21.2109141127500.21985@sstabellini-ThinkPad-T480s> <1fcd68fc-eace-2501-cc0d-4fa3ea96da75@quicinc.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 220a1056-f972-49a8-5d55-08d978b750fe
X-MS-TrafficTypeDiagnostic: BL3PR02MB7875:
X-Microsoft-Antispam-PRVS:
	<BL3PR02MB787587DEE6CD092C89326734A0DC9@BL3PR02MB7875.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	KGdYC7oY0QMDdi5TXsgtlj67x2zt03M2EyJzFTZpCFjSvXLCS2Z/k7BWEzi0jAevVwqiI3qdIVDu04O9yG2RIXJziOKngOjfZfTobQVc2AwPZhsCBqP9cf9Le0DeVpZgovFztIn2cWuVrLCo2KhCtM2FuSq8wlAlYxuGF+pT2Cs9rS64s3fk4gjukFf2AX0BJwvRvYy3q/zz1YKTbcc5bacMm1q7snXMIkQ1Fj43hhQrU+9tqi5aF+f+MAAPaXD7kUw+q8VECkgG3zX/5+99v+GKM/RUlGY8iyqHanu5UjgzQ5N0uZpvVZmVW6SV0h7OK+pxaxcupb/sKPI2PqM5x5iaGfh2Q019xd7GQ9vO6BdGkxY2/ddhTfvHabF5jBpP7idp2r1NPvjf79qdaeDK4xOK48VRwS75TJHUBc3/29cZ64WJRAekEXrv/Lxn5AU87vhV9WeLl7vN4vth6mPMqszw+797KbB43Bw6o17cooXtCmpImNoKndMQouY/jq8I7okuSurFuGIdOInktQcNWocSFIrM0Tk7vYTyx6EtJQteKxsMZLX5GMZz0n5mOfuEHIDBZ8T7bBxXwWbqMZ0Zye2s+gcWu/FhOi4AqIxG45JqHGoiYRdv2T36yCltbbPYzkE9i7GhMVSGGU6l1fMhkK5cncc2c0RtSRb96BdtInw1rIHSyV99YvOs7E7AuznTa2AkLUyVqfY6QZNZnycp/Q==
X-Forefront-Antispam-Report:
	CIP:149.199.62.198;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapexch02.xlnx.xilinx.com;PTR:unknown-62-198.xilinx.com;CAT:NONE;SFS:(7916004)(4636009)(39860400002)(346002)(136003)(396003)(376002)(46966006)(36840700001)(4326008)(33716001)(54906003)(45080400002)(47076005)(82740400003)(8676002)(7636003)(36860700001)(2906002)(356005)(316002)(7416002)(8936002)(9686003)(82310400003)(336012)(5660300002)(26005)(186003)(478600001)(426003)(36906005)(70206006)(70586007)(9786002)(53546011)(6916009)(83380400001)(44832011);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2021 02:11:38.1502
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 220a1056-f972-49a8-5d55-08d978b750fe
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.62.198];Helo=[xsj-pvapexch02.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1NAM02FT024.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR02MB7875

On Wed, 15 Sep 2021, Trilok Soni wrote:
> On 9/14/2021 8:29 PM, Stefano Stabellini wrote:
> > On Tue, 14 Sep 2021, Trilok Soni wrote:
> > > On 9/13/2021 4:51 PM, Stefano Stabellini via Stratos-dev wrote:
> > > > On Mon, 6 Sep 2021, AKASHI Takahiro wrote:
> > > > > > the second is how many context switches are involved in a
> > > > > > transaction.
> > > > > > Of course with all things there is a trade off. Things involving the
> > > > > > very tightest latency would probably opt for a bare metal backend
> > > > > > which
> > > > > > I think would imply hypervisor knowledge in the backend binary.
> > > > > 
> > > > > In configuration phase of virtio device, the latency won't be a big
> > > > > matter.
> > > > > In device operations (i.e. read/write to block devices), if we can
> > > > > resolve 'mmap' issue, as Oleksandr is proposing right now, the only
> > > > > issue
> > > > > is
> > > > > how efficiently we can deliver notification to the opposite side.
> > > > > Right?
> > > > > And this is a very common problem whatever approach we would take.
> > > > > 
> > > > > Anyhow, if we do care the latency in my approach, most of
> > > > > virtio-proxy-
> > > > > related code can be re-implemented just as a stub (or shim?) library
> > > > > since the protocols are defined as RPCs.
> > > > > In this case, however, we would lose the benefit of providing "single
> > > > > binary"
> > > > > BE.
> > > > > (I know this is is an arguable requirement, though.)
> > > > 
> > > > In my experience, latency, performance, and security are far more
> > > > important than providing a single binary.
> > > > 
> > > > In my opinion, we should optimize for the best performance and security,
> > > > then be practical on the topic of hypervisor agnosticism. For instance,
> > > > a shared source with a small hypervisor-specific component, with one
> > > > implementation of the small component for each hypervisor, would provide
> > > > a good enough hypervisor abstraction. It is good to be hypervisor
> > > > agnostic, but I wouldn't go extra lengths to have a single binary. I
> > > > cannot picture a case where a BE binary needs to be moved between
> > > > different hypervisors and a recompilation is impossible (BE, not FE).
> > > > Instead, I can definitely imagine detailed requirements on IRQ latency
> > > > having to be lower than 10us or bandwidth higher than 500 MB/sec.
> > > > 
> > > > Instead of virtio-proxy, my suggestion is to work together on a common
> > > > project and common source with others interested in the same problem.
> > > > 
> > > > I would pick something like kvmtool as a basis. It doesn't have to be
> > > > kvmtools, and kvmtools specifically is GPL-licensed, which is
> > > > unfortunate because it would help if the license was BSD-style for ease
> > > > of integration with Zephyr and other RTOSes.
> > > > 
> > > > As long as the project is open to working together on multiple
> > > > hypervisors and deployment models then it is fine. For instance, the
> > > > shared source could be based on OpenAMP kvmtool [1] (the original
> > > > kvmtool likely prefers to stay small and narrow-focused on KVM). OpenAMP
> > > > kvmtool was created to add support for hypervisor-less virtio but they
> > > > are very open to hypervisors too. It could be a good place to add a Xen
> > > > implementation, a KVM fatqueue implementation, a Jailhouse
> > > > implementation, etc. -- work together toward the common goal of a single
> > > > BE source (not binary) supporting multiple different deployment models.
> > > 
> > > I have my reservations on using "kvmtool" to do any development here.
> > > "kvmtool" can't be used on the products and it is just a tool for the
> > > developers.
> > > 
> > > The benefit of the solving problem w/ rust-vmm is that some of the crates
> > > from
> > > this project can be utilized for the real product. Alex has mentioned that
> > > "rust-vmm" today has some KVM specific bits but the rust-vmm community is
> > > already discussing to remove or re-org them in such a way that other
> > > Hypervisors can fit in.
> > > 
> > > Microsoft has Hyper-V implementation w/ cloud-hypervisor which uses some
> > > of
> > > the rust-vmm components as well and they had shown interest to add the
> > > Hyper-V
> > > support in the "rust-vmm" project as well. I don't know the current
> > > progress
> > > but they had proven it it "cloud-hypervisor" project.
> > > 
> > > "rust-vmm" project's license will work as well for most of the project
> > > developments and I see that "CrosVM" is shipping in the products as well.
> > 
> > Most things in open source start as a developers tool before they become
> > part of a product :)
> 
> Agree, but I had an offline discussions with one the active developer of
> kvmtool and the confidence of using it in the product was no where near we
> expected during our evaluation. Same goes the QEMU and one of the biggest
> problem was no. of security issues against this huge codebase of QEMU.

That is fair, but it is important to recognize that these are *known*
security issues.

Does rust-vmm have a security process and a security response team? I
tried googling for it but couldn't find relevant info.

QEMU is a very widely used and very well inspected codebase. It has a
mailing list to report security issues and a security process. As a
consequence we know of many vulnerabilities affecting the code base.
As far as I am aware rust-vmm has not been inspected yet with the same
level of attention and the same amount of security researchers.

That said, of course it is undeniable that the larger size of QEMU
implies a higher amount of security issues. But for this project, we
wouldn't be using the whole of QEMU of course. We would be narrowing it
down to a build with only few revelant pieces. I imagine that the total
LOC count would still be higher but the number of relevant security
vulnerabilities would only be a small fraction of the QEMU total.

 
> > I am concerned about how "embeddable" rust-vmm is going to be. Do you
> > think it would be possible to run it against an RTOS together with other
> > apps written in C?
> 
> I don't see any limitations of rust-vmm. For example, I am confident that we
> can port rust-vmm based backend into the QNX as host OS and same goes w/
> Zephyr as well. Some work is needed but nothing fundamentally blocking it. We
> should be able to run it w/ Fuchsia as well with some effort.
 
That's good to hear.

