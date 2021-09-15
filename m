Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D7E640BE41
	for <lists+xen-devel@lfdr.de>; Wed, 15 Sep 2021 05:30:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.187189.335969 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mQLbl-0003V5-W8; Wed, 15 Sep 2021 03:29:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 187189.335969; Wed, 15 Sep 2021 03:29:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mQLbl-0003TH-Su; Wed, 15 Sep 2021 03:29:13 +0000
Received: by outflank-mailman (input) for mailman id 187189;
 Wed, 15 Sep 2021 03:29:12 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=26R+=OF=xilinx.com=stefanos@srs-us1.protection.inumbo.net>)
 id 1mQLbj-0003TB-TN
 for xen-devel@lists.xen.org; Wed, 15 Sep 2021 03:29:12 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (unknown
 [40.107.220.54]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 16a4f29c-15d5-11ec-b4d4-12813bfff9fa;
 Wed, 15 Sep 2021 03:29:10 +0000 (UTC)
Received: from DM5PR12CA0050.namprd12.prod.outlook.com (2603:10b6:3:103::12)
 by BYAPR02MB5157.namprd02.prod.outlook.com (2603:10b6:a03:64::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.16; Wed, 15 Sep
 2021 03:29:05 +0000
Received: from DM3NAM02FT025.eop-nam02.prod.protection.outlook.com
 (2603:10b6:3:103:cafe::4c) by DM5PR12CA0050.outlook.office365.com
 (2603:10b6:3:103::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.14 via Frontend
 Transport; Wed, 15 Sep 2021 03:29:05 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (149.199.62.198) by
 DM3NAM02FT025.mail.protection.outlook.com (10.13.4.112) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4523.14 via Frontend Transport; Wed, 15 Sep 2021 03:29:05 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Tue, 14 Sep 2021 20:29:03 -0700
Received: from smtp.xilinx.com (172.19.127.96) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Tue, 14 Sep 2021 20:29:03 -0700
Received: from [10.23.120.123] (port=59358 helo=localhost)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <stefano.stabellini@xilinx.com>)
 id 1mQLbb-0005bf-2T; Tue, 14 Sep 2021 20:29:03 -0700
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
X-Inumbo-ID: 16a4f29c-15d5-11ec-b4d4-12813bfff9fa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LeIu1K7IWEioBlGJ3Oyl2SMlQaPVNkEK6hsjR/vLYx/OaXHeG9l+eFIKguiuc9LKb7KtSWKawV9LocgqzVi/JnIziXH6xF4KMQP4127HrsuWFd94JnxInhLW+IVl7DbMGwq3rtvEbrAuwyR+GWN6hmxNly5lEyy/3074DFfNwv2/Ik+8CBOdiWFUF4jGMtWPyu/tIbRmMY0c1SOneICsjlKQZt9o4YlrjGsXEk6q00EqX52nOsvEkOLGFSMQD+ZkvPmPdffS4bOPNKSwvOk8duPPm4SKpXUdsArsOa/Y5PXKNBweHKmmJ5G1x9tD02sEmf0TC9PZ1SZdjXGn3tT4sQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=N7Tl2WRijlXWZr4aIJxLSFdeZd+kL7VyxyPMG7+Sp00=;
 b=S3CB7EocoRGnm/pCf04OWCLZrKGFVkgU8ZYOJ30H1tUpKC5pubNOk8/56rZvNi+s9iWIpQbsHjcwUUafM5Cg1xXL41zlsPPkck5EnVaabq89FVH+lL2FQH3hpjgDDr+Etn12nDB9YSKI+zFzheYxcgakICol3+YQntR10YVeW5peuJc0xY0c4rRpqcfLVddq4IF7hqRcjpxizu8h8nbLEdusstYAHoGfjqRslb0P4Z5VoMPeXIqXp0q75S59EgVP/MnoPYefdMrPhpl7de4mng4STNesI7GqTujogm6KlkvUmm46OYjtAXJrKXE9c68JeqdCEYelkNFXRQ+ki6lRpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=quicinc.com smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N7Tl2WRijlXWZr4aIJxLSFdeZd+kL7VyxyPMG7+Sp00=;
 b=KaA+QS5JNSJgvdObvsChGapVEmGfUhjdOtK6DOf/lRCXWikCf03a1FvSXmpt0KZGu9aWVCRWzTAX/IEjpz5NiiTIXbaXdJvgOgeypzvsiWXzDbi7jxdbe8wXnaO3/zgoT0ya1jdsiuFTJgxWXhPlpy0mPLONvjLn/JwDj+KaijU=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; quicinc.com; dkim=none (message not signed)
 header.d=none;quicinc.com; dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch02.xlnx.xilinx.com;
Date: Tue, 14 Sep 2021 20:29:02 -0700
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
In-Reply-To: <e9df2014-b691-1ee4-7fcd-03912d0aed59@quicinc.com>
Message-ID: <alpine.DEB.2.21.2109141127500.21985@sstabellini-ThinkPad-T480s>
References: <87v94ldrqq.fsf@linaro.org> <alpine.DEB.2.21.2108041055390.9768@sstabellini-ThinkPad-T480s> <YRuSPT9075NuWRYS@stefanha-x1.localdomain> <875yvkh1p1.fsf@linaro.org> <20210903080609.GD47953@laputa> <87czpqq9qu.fsf@linaro.org> <20210906022356.GD40187@laputa>
 <alpine.DEB.2.21.2109131615570.10523@sstabellini-ThinkPad-T480s> <e9df2014-b691-1ee4-7fcd-03912d0aed59@quicinc.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e198edbf-544c-4c33-9159-08d977f8f889
X-MS-TrafficTypeDiagnostic: BYAPR02MB5157:
X-Microsoft-Antispam-PRVS:
	<BYAPR02MB515783CCE042A8F0477F9CE1A0DB9@BYAPR02MB5157.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Jsa4pVwidVDbBVcMI/6ijrZRo0iUCfVUT1/x3/beXYsC9ThqCg8zONMfNQf4FYUpjI1PEXlZmazRJA+Bz7xcCmQInOuQjg6yDtY5mb7i4kxKBUvkGNHkLSLolfY6treIATV7cStUPUxXMHdZ8hdYqWK6cigBKC8aEo635lN4kYLmcuOTXOLaCFDMvtroUNjJPZuzxarF3QX37V7Gr0QdFt60cVI6++tOCjzLc+O+yDAHoQVdaFGi/WKtTJ08vZBrmwSxapAoSjhiVmzqC6EBuCvcunCllXtFl7EYFcrfYm50APOC44T8pb3y7Q37lcVztUJOMwX1rC+TYn/y3oxjJLB2ohChsD4cg2D7G3UPOw8Tdypy8DIlorix2NVigJTAU+38kROvSkUmQInNR4/Ic3RhxcqMMSyAT/yQ1trBwQgZcmJvEjZsP2PR7nOzCu+j4MyM41EMfnLiTQ7vZpgeD8Wt2XSNLfHGtZg+cZ95CN8mOG43r9YCP+ZcNGKqRFvN2nP68H8mlcfg1rU1a6T3EO4u+rkvEj27o7fWdEep8FzZdhxBcIXBor3J6g1lrNvAcReeNyiL3u7eoChZrbP9dwurWB8o1GDPD4QB4VMDAJt8rJ9rVCDj7QsgRzXIvJOQ/l92hF0t5+Dpwu6+CbU4VvqE+kmvNgKU+exZ6+U1VVGJCucUv1rJMeTJz2knUK0ojIKkEU8A0o9d8ht4i4Z9Ug==
X-Forefront-Antispam-Report:
	CIP:149.199.62.198;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapexch02.xlnx.xilinx.com;PTR:unknown-62-198.xilinx.com;CAT:NONE;SFS:(7916004)(4636009)(396003)(346002)(39850400004)(376002)(136003)(36840700001)(46966006)(356005)(47076005)(33716001)(8676002)(26005)(45080400002)(7636003)(426003)(2906002)(7416002)(9686003)(82310400003)(4326008)(336012)(5660300002)(70586007)(36906005)(83380400001)(6916009)(54906003)(8936002)(316002)(36860700001)(82740400003)(478600001)(70206006)(186003)(44832011)(9786002)(53546011);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2021 03:29:05.4076
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e198edbf-544c-4c33-9159-08d977f8f889
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.62.198];Helo=[xsj-pvapexch02.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DM3NAM02FT025.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR02MB5157

On Tue, 14 Sep 2021, Trilok Soni wrote:
> On 9/13/2021 4:51 PM, Stefano Stabellini via Stratos-dev wrote:
> > On Mon, 6 Sep 2021, AKASHI Takahiro wrote:
> > > > the second is how many context switches are involved in a transaction.
> > > > Of course with all things there is a trade off. Things involving the
> > > > very tightest latency would probably opt for a bare metal backend which
> > > > I think would imply hypervisor knowledge in the backend binary.
> > > 
> > > In configuration phase of virtio device, the latency won't be a big
> > > matter.
> > > In device operations (i.e. read/write to block devices), if we can
> > > resolve 'mmap' issue, as Oleksandr is proposing right now, the only issue
> > > is
> > > how efficiently we can deliver notification to the opposite side. Right?
> > > And this is a very common problem whatever approach we would take.
> > > 
> > > Anyhow, if we do care the latency in my approach, most of virtio-proxy-
> > > related code can be re-implemented just as a stub (or shim?) library
> > > since the protocols are defined as RPCs.
> > > In this case, however, we would lose the benefit of providing "single
> > > binary"
> > > BE.
> > > (I know this is is an arguable requirement, though.)
> > 
> > In my experience, latency, performance, and security are far more
> > important than providing a single binary.
> > 
> > In my opinion, we should optimize for the best performance and security,
> > then be practical on the topic of hypervisor agnosticism. For instance,
> > a shared source with a small hypervisor-specific component, with one
> > implementation of the small component for each hypervisor, would provide
> > a good enough hypervisor abstraction. It is good to be hypervisor
> > agnostic, but I wouldn't go extra lengths to have a single binary. I
> > cannot picture a case where a BE binary needs to be moved between
> > different hypervisors and a recompilation is impossible (BE, not FE).
> > Instead, I can definitely imagine detailed requirements on IRQ latency
> > having to be lower than 10us or bandwidth higher than 500 MB/sec.
> > 
> > Instead of virtio-proxy, my suggestion is to work together on a common
> > project and common source with others interested in the same problem.
> > 
> > I would pick something like kvmtool as a basis. It doesn't have to be
> > kvmtools, and kvmtools specifically is GPL-licensed, which is
> > unfortunate because it would help if the license was BSD-style for ease
> > of integration with Zephyr and other RTOSes.
> > 
> > As long as the project is open to working together on multiple
> > hypervisors and deployment models then it is fine. For instance, the
> > shared source could be based on OpenAMP kvmtool [1] (the original
> > kvmtool likely prefers to stay small and narrow-focused on KVM). OpenAMP
> > kvmtool was created to add support for hypervisor-less virtio but they
> > are very open to hypervisors too. It could be a good place to add a Xen
> > implementation, a KVM fatqueue implementation, a Jailhouse
> > implementation, etc. -- work together toward the common goal of a single
> > BE source (not binary) supporting multiple different deployment models.
> 
> I have my reservations on using "kvmtool" to do any development here.
> "kvmtool" can't be used on the products and it is just a tool for the
> developers.
>
> The benefit of the solving problem w/ rust-vmm is that some of the crates from
> this project can be utilized for the real product. Alex has mentioned that
> "rust-vmm" today has some KVM specific bits but the rust-vmm community is
> already discussing to remove or re-org them in such a way that other
> Hypervisors can fit in.
> 
> Microsoft has Hyper-V implementation w/ cloud-hypervisor which uses some of
> the rust-vmm components as well and they had shown interest to add the Hyper-V
> support in the "rust-vmm" project as well. I don't know the current progress
> but they had proven it it "cloud-hypervisor" project.
> 
> "rust-vmm" project's license will work as well for most of the project
> developments and I see that "CrosVM" is shipping in the products as well.

Most things in open source start as a developers tool before they become
part of a product :)

I am concerned about how "embeddable" rust-vmm is going to be. Do you
think it would be possible to run it against an RTOS together with other
apps written in C?

Let me make a realistic example. You can imagine a Zephyr instance with
simple toolstack functionalities written in C (starting/stopping VMs).
One might want to add a virtio backend to it. I am not familiar enough
with Rust and rust-vmm to know if it would be feasible and "easy" to run
a rust-vmm backend as a Zephyr app.

A C project of the size of kvmtool, but BSD-licensed, could run on
Zephyr with only a little porting effort using the POSIX compatibility
layer. I think that would be ideal. Anybody aware of a project
fulfilling these requirements?


If we have to give up the ability to integrate with an RTOS, then I
think QEMU could be the leading choice because is still the main
reference implementation for virtio.

