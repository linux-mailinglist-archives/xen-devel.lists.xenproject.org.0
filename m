Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E56AF4B935C
	for <lists+xen-devel@lfdr.de>; Wed, 16 Feb 2022 22:45:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.274404.469862 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nKS7E-0006yv-Lj; Wed, 16 Feb 2022 21:45:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 274404.469862; Wed, 16 Feb 2022 21:45:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nKS7E-0006vP-IF; Wed, 16 Feb 2022 21:45:36 +0000
Received: by outflank-mailman (input) for mailman id 274404;
 Wed, 16 Feb 2022 21:45:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=AWAb=S7=xilinx.com=stefanos@srs-se1.protection.inumbo.net>)
 id 1nKS7C-0006vJ-Sr
 for xen-devel@lists.xenproject.org; Wed, 16 Feb 2022 21:45:35 +0000
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1anam02on2061e.outbound.protection.outlook.com
 [2a01:111:f400:7ea9::61e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c2ceef27-8f71-11ec-8eb8-a37418f5ba1a;
 Wed, 16 Feb 2022 22:45:31 +0100 (CET)
Received: from DS7PR03CA0060.namprd03.prod.outlook.com (2603:10b6:5:3b5::35)
 by DM6PR02MB6873.namprd02.prod.outlook.com (2603:10b6:5:259::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.18; Wed, 16 Feb
 2022 21:45:28 +0000
Received: from DM3NAM02FT041.eop-nam02.prod.protection.outlook.com
 (2603:10b6:5:3b5:cafe::bf) by DS7PR03CA0060.outlook.office365.com
 (2603:10b6:5:3b5::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4995.16 via Frontend
 Transport; Wed, 16 Feb 2022 21:45:28 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (149.199.62.198) by
 DM3NAM02FT041.mail.protection.outlook.com (10.13.5.133) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4975.11 via Frontend Transport; Wed, 16 Feb 2022 21:45:27 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Wed, 16 Feb 2022 13:45:07 -0800
Received: from smtp.xilinx.com (172.19.127.96) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Wed, 16 Feb 2022 13:45:07 -0800
Received: from [10.23.121.122] (port=59639 helo=ubuntu-20.04.2-arm64.shared)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <stefano.stabellini@xilinx.com>)
 id 1nKS6k-0003RU-0k; Wed, 16 Feb 2022 13:45:06 -0800
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
X-Inumbo-ID: c2ceef27-8f71-11ec-8eb8-a37418f5ba1a
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZGsX5E0qE6tXUy5+RxR4gf3dyLb4npE4K2gifFjT+wT4qFA0BsSraY++YzF6Dw6PzmbEtYW1tlddHh5JumRBGVNwqCRkBptcTHJr1LwYL45zpYfAZAGWz9JR95BgIsV9BRMwmbYI6GuUIaQ98SfFoN3MKrL2h6fW7USm2ANrq2FThDKJLDVtbHOiIXw9UnGCG5A9VmtWjDXOW0qfzPPW9dndSzUQkMU4AHv9sSxj8AtOw9K85iHIwEkUEK2ffnUs5QiX3yh7h+KoesD6TcKJjMAm0MpeLo/2kzdT7mZ4BA5MsmO46no62LMSctuiXkoARoTFLDst8wpP3Pca8WUEMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DMiileQrEAOXLt2ANWW6F5Qg5RDknaQTnkr0OULuZKM=;
 b=lYmdotqH0vGbppT2cOnbm/j1MGCVP3RCkJrfjBiccf+goTEJpAb1L26WZt1+1XijX1H8wn6IkE12puWjXVQE2GKz+EBMtjqMVphIFJQD5olyar4jZDbuDwu05iUXUCeQ+oAI23qtj6tnbsbSUeia3PTxdcQjvDG2FIaIZHWhUdzngN+bGegsBYYOuXpFrekF4gZV5ZCVD4fPU31q2+wUge1lU1BDvtBSAHuXdFipN+yJc3Kb7ZkRYBdGQmZHnzl7g+5hsV+fGGdYgMEqBdAh8TYW7ash7/bAPzvbgjiQqkyAxMy/j9rLl9vDdeSZKXa7yYeh2ndvQGi6CQqeB1ktjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=linaro.org smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DMiileQrEAOXLt2ANWW6F5Qg5RDknaQTnkr0OULuZKM=;
 b=Ubk7Z0mXaqG+n4P/qH7Cy6tNU5VN+zh24VS5z0fDg22c8pZ1YPTy6kBmBp1tfqdrJ4WZIlcPuIg4DCyV+q5mEusbhpOpTjgzHhYyyOCPjwekps1oaiachToDHFzGn7I1HyD7iAowNxddgRWnKM0fcK4ShF9WMQjLVuVRU0qJGys=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch02.xlnx.xilinx.com;
Date: Wed, 16 Feb 2022 13:45:05 -0800
From: Stefano Stabellini <stefano.stabellini@xilinx.com>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Vincent Guittot <vincent.guittot@linaro.org>
CC: Stefano Stabellini <stefano.stabellini@xilinx.com>,
	=?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
	<stratos-dev@op-lists.linaro.org>, <xen-devel@lists.xenproject.org>, AKASHI
 Takahiro <takahiro.akashi@linaro.org>, Arnd Bergmann
	<arnd.bergmann@linaro.org>, Christopher Clark
	<christopher.w.clark@gmail.com>, Dmytro Firsov <dmytro_firsov@epam.com>,
	Julien Grall <julien@xen.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, <Oleksandr_Tyshchenko@epam.com>,
	<Artem_Mygaiev@epam.com>, <bertrand.marquis@arm.com>, <Wei.Chen@arm.com>,
	<Ed.Doxat@arm.com>, <Oleksii_Moisieiev@epam.com>
Subject: Re: Metadata and signalling channels for Zephyr virtio-backends on
 Xen
In-Reply-To: <CAKfTPtB1ONsxA1Rch8AO+UrPRZsHrCgF1_-F-kh9U_Xu2M47aA@mail.gmail.com>
Message-ID: <alpine.DEB.2.22.394.2202161256350.43738@ubuntu-linux-20-04-desktop>
References: <87h79bgd1m.fsf@linaro.org> <alpine.DEB.2.22.394.2202071419270.2091381@ubuntu-linux-20-04-desktop> <CAKfTPtB1ONsxA1Rch8AO+UrPRZsHrCgF1_-F-kh9U_Xu2M47aA@mail.gmail.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed;
	boundary="8323329-1281770804-1645045378=:43738"
Content-ID: <alpine.DEB.2.22.394.2202161303010.43738@ubuntu-linux-20-04-desktop>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 26b00acf-e363-465a-eb15-08d9f195a5a1
X-MS-TrafficTypeDiagnostic: DM6PR02MB6873:EE_
X-Microsoft-Antispam-PRVS:
	<DM6PR02MB68731356BE9E0C664E17DAEBA0359@DM6PR02MB6873.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	KZRQ9DXiqAgYrrpxJfW1Yb50tqabWAYxoZgvguP1/zpRKhKFBbVHq6VkXKeSDG4/N+yyrTo5AyHN837VzxKqDL8b+/VnRnXzmNN3QsZLjhtg864PfmsLEpgvaCQsmj1l3HS98GftWHTXbjl1f7pydqmZZg/6O5jLvvkKUX5WM/CbmafokeFZ/Siczb9LRZoRIFWRrQNxopo2DBmqEWzTiy7V4flCpUeuYATKU2MjooITYOIugTtw1C6sI5TYG6YV440p9XAx1EGuV72nuG8llgsbhWco54KnoFCqTJ8XPSGKpJVWg7yXuyx0ZChstoiY0q6WQ11diHxUILgPuoqBNbqyLQ/7djt1oBmfXUDaFiAAHpqfqoknVNOt/WBVvS298FNSxtLoDFpmcDPMaiVMlI+a9KmMiP4fI3Q7In+VbzJjmTNjf9vhAakmB/Q4742BE2wJibQXxtfaWdtHdROafupWBUFuus/SafY63FgYgOOT0sA3qTBlNFOzIvIwmB3WumCqmqFrQ1IUv7D3KET9aojcHZbzf9kghR2WNBnyqcjZs5P9t4fAlF4CIYqbvVTECfKREr0KXNef1yE7aQbDIdsYfVa5nxaG05KQjfdPQwUTWpTZYpL0Ut6dg2PB9SSuOilsFrp3DM0invAz4qFp5tQctpE98phF4A2asVNGGVkwja3TGML5y494Q6MNRh2jH/bFgPDNx0C+1CjpXGZwdCBSNoAiiiO+eXVJxpu188mlNUJyqVY95t7wcf/hdLzefb5CGKtEoByvrgtWtqdwsdDwBN5yiJDJO2E/tz8+GrA=
X-Forefront-Antispam-Report:
	CIP:149.199.62.198;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapexch02.xlnx.xilinx.com;PTR:unknown-62-198.xilinx.com;CAT:NONE;SFS:(13230001)(4636009)(7916004)(36840700001)(46966006)(40470700004)(83380400001)(966005)(7416002)(508600001)(8936002)(356005)(9786002)(7636003)(316002)(82310400004)(6916009)(54906003)(5660300002)(4326008)(8676002)(70206006)(70586007)(186003)(26005)(33716001)(40460700003)(66574015)(36860700001)(30864003)(47076005)(44832011)(33964004)(336012)(426003)(9686003)(2906002);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Feb 2022 21:45:27.9971
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 26b00acf-e363-465a-eb15-08d9f195a5a1
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.62.198];Helo=[xsj-pvapexch02.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DM3NAM02FT041.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR02MB6873

--8323329-1281770804-1645045378=:43738
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Content-ID: <alpine.DEB.2.22.394.2202161303011.43738@ubuntu-linux-20-04-desktop>

On Tue, 15 Feb 2022, Vincent Guittot wrote:
> On Tue, 8 Feb 2022 at 01:16, Stefano Stabellini
> <stefano.stabellini@xilinx.com> wrote:
> >
> > On Mon, 7 Feb 2022, Alex Bennée wrote:
> > > Hi Stefano,
> > >
> > > Vincent gave an update on his virtio-scmi work at the last Stratos sync
> > > call and the discussion moved onto next steps.
> >
> > Hi Alex,
> >
> > I don't know the specifics of virtio-scmi, but if it is about power,
> > clocks, reset, etc. like the original SCMI protocol, then virtio-scmi is
> 
> virtio-scmi is one transport channel that support SCMI protocol
> 
> > likely going to be very different from all the other virtio frontends
> 
> The virtio-scmi front-end is merged mainline
> 
> > and backends. That's because SCMI requires a full view of the system,
> > which is different from something like virtio-net that is limited to the
> > emulation of 1 device. For this reason, it is likely that the
> > virtio-scmi backend would be a better fit in Xen itself, rather than run
> > in userspace inside a VM.
> 
> Not sure what you mean when you say that SCMI requires a full view of
> the system.

SCMI can be used to read the status of resources in the system and
typically leads to a full view of the system's resources.

If I assign the USB controller to a VM, I expect that VM to only "see"
the USB controller and any attached USB peripherals, in addition to the
other regular virtual resources that a VM commonly has.

If I assign SCMI to a VM, I expect the VM to "see" everything in the
system thanks to the SCMI probing functions. Unless we only assign a
single SCMI channel with limited capabilities to the VM, like EPAM's
patch series on xen-devel is doing.


> If you are referring to the system wide resources which
> reset or power up/down the whole SoC, this is not really what we are
> targeting here. Those system wide resources should already be handled
> by a dedicated power coprocessor. In our case, the IPs of the SoC will
> be handled by different VMs but those IPs are usually sharing common
> resources like a parent PLL , a power domain or a clock gating reg as
> few examples. Because all those VMs can't directly set these resources
> without taking into account others and because the power coprocessor
> doesn't have an unlimited number of channels, we add an SCMI backend
> that will gather and proxy the VM request before accessing the
> register that gates some clocks IP as an example or before powering
> down an external regulator shared between the camera and another
> device.

Do you know what would be the expected number of SCMI channels available
in a "normal" deployment?

My expectation was that there would be enough SCMI channels to give one
for each VM in a common embedded scenario, where the number of VMs is
typically not very high. If we have enought channels so that we can
assign each channel to a different VM maybe we can get away without a
proxy?


> This SCMI backend will most probably also send request with
> OSPM permission access to the power coprocessor once aggregating all
> the VMs ' request

Please correct me if I am wrong, but I would have expected the SCMI
firmware to be able to do reference counting on the hardware resources
and therefore be able to handle the case where:

- we have 2 VMs
- each VM has its own SCMI channel
- a VM requests power-off on 1 resource also used by the other VM

My understanding of the SCMI protocol is that the SCMI firmware
implementation should detect that the resource in question is also
in-use by another VM/channel and thus it would refuse the power-off
operation. (For your information, that is also how the Xilinx EEMI
protocol works.)

Reference counting is a key requirement for a good multi-channel
implementation. If SCMI doesn't support it today, then we have a
problem with SCMI multi-channel, regardless of virtualization.


> We are using virtio-cmi protocol because it has the main advantage of
> not being tied to an hypervisor

That is a valuable goal, which is a bit different from the goal of
finding the best SCMI architecture for Xen, and that's OK. Let's see if
we can find any common ground and synergies we can exploit to improve
both goals. I'll join the Stratos meeting tomorrow.


> In our PoC, the SCMI backend is running with zehyr and reuse the same
> software that can run in the power coprocessor which helps splitting
> what is critical and must be handled by power coprocessor and what is
> not critical for the system (what is usually managed by linux directly
> when their no hypervisor involved typically)
> 
>
> > FYI, a good and promising approach to handle both SCMI and SCPI is the
> > series recently submitted by EPAM to mediate SCMI and SCPI requests in
> > Xen: https://marc.info/?l=xen-devel&m=163947444032590
> >
> > (Another "special" virtio backend is virtio-iommu for similar reasons:
> > the guest p2m address mappings and also the IOMMU drivers are in Xen.
> > It is not immediately clear whether a virtio-iommu backend would need to
> > be in Xen or run as a process in dom0/domU.)
> >
> > On the other hand, for all the other "normal" protocols (e.g.
> > virtio-net, virtio-block, etc.) the backend would naturally run as a
> > process in dom0 or domU (e.g. QEMU in Dom0) as one would expect.
> >
> >
> > > Currently the demo setup
> > > is intermediated by a double-ended vhost-user daemon running on the
> > > devbox acting as a go between a number of QEMU instances representing
> > > the front and back-ends. You can view the architecture with Vincents
> > > diagram here:
> > >
> > >   https://docs.google.com/drawings/d/1YSuJUSjEdTi2oEUq4oG4A9pBKSEJTAp6hhcHKKhmYHs/edit?usp=sharing
> > >
> > > The key virtq handling is done over the special carve outs of shared
> > > memory between the front end and guest. However the signalling is
> > > currently over a virtio device on the backend. This is useful for the
> > > PoC but obviously in a real system we don't have a hidden POSIX system
> > > acting as a go between not to mention the additional latency it causes
> > > with all those context switches.
> > >
> > > I was hoping we could get some more of the Xen experts to the next
> > > Stratos sync (17th Feb) to go over approaches for a properly hosted on
> > > Xen approach. From my recollection (Vincent please correct me if I'm
> > > wrong) of last week the issues that need solving are:
> >
> > Unfortunately I have a regular conflict which prevents me from being
> > able to join the Stratos calls. However, I can certainly make myself
> > available for one call (unless something unexpected comes up).
> >
> >
> > >  * How to handle configuration steps as FE guests come up
> > >
> > > The SCMI server will be a long running persistent backend because it is
> > > managing real HW resources. However the guests may be ephemeral (or just
> > > restarted) so we can't just hard-code everything in a DTB. While the
> > > virtio-negotiation in the config space covers most things we still need
> > > information like where in the guests address space the shared memory
> > > lives and at what offset into that the queues are created. As far as I'm
> > > aware the canonical source of domain information is XenStore
> > > (https://wiki.xenproject.org/wiki/XenStore) but this relies on a Dom0
> > > type approach. Is there an alternative for dom0less systems or do we
> > > need a dom0-light approach, for example using STR-21 (Ensure Zephyr can
> > > run cleanly as a Dom0 guest) providing just enough services for FE's to
> > > register metadata and BE's to read it?
> >
> > I'll try to answer the question for a generic virtio frontend and
> > backend instead (not SCMI because SCMI is unique due to the reasons
> > above.)
> >
> > Yes, xenstore is the easiest way to exchange configuration information
> > between domains. I think EPAM used xenstore to exchange the
> > configuration information in their virtio-block demo. There is a way to
> > use xenstore even between dom0less VMs:
> > https://marc.info/?l=xen-devel&m=164340547602391 Not just xenstore but
> > full PV drivers too. However, in the dom0less case xenstore is going to
> > become available some time after boot, not immediately at startup time.
> > That's because you need to wait until xenstored is up and running.
> >
> > There are other ways to send data from one VM to another which are
> > available immediately at boot, such as Argo and static shared memory.
> >
> > But dom0less is all about static partitioning, so it makes sense to
> > exploit the build-time tools to the fullest. In the dom0less case, we
> > already know what is going to run on the target before it is even turned
> > on. As an example, we might have already prepared an environment with 3
> > VMs using Yocto and ImageBuilder. We could also generate all
> > configurations needed and place them inside each VMs using Yocto's
> > standard tools and ImageBuilder. So for dom0less, I recommend to go via
> > a different route and pre-generate the configuration directly where
> > needed instead of doing dynamic discovery.
> >
> >
> > >  * How to handle mapping of memory
> > >
> > > AIUI the Xen model is the FE guest explicitly makes grant table requests
> > > to expose portions of it's memory to other domains. Can the BE query the
> > > hypervisor itself to discover the available grants or does it require
> > > coordination with Dom0/XenStore for that information to be available to
> > > the BE domain?
> >
> > Typically the frontend passes grant table references to the backend
> > (i.e. instead of plain guest physical addresses on the virtio ring.)
> > Then, the backend maps the grants; Xen checks that the mapping is
> > allowed.
> >
> > We might be able to use the same model with virtio devices. A special
> > pseudo-IOMMU driver in Linux would return a grant table reference and an
> > offset as "DMA address". The "DMA address" is passed to the virtio
> > backend over the virtio ring. The backend would map the grant table
> > reference using the regular grant table hypercalls.
> >
> >
> > >  * How to handle signalling
> > >
> > > I guess this requires a minimal implementation of the IOREQ calls for
> > > Zephyr so we can register the handler in the backend? Does the IOREQ API
> > > allow for a IPI style notifications using the global GIC IRQs?
> > >
> > > Forgive the incomplete notes from the Stratos sync, I was trying to type
> > > while participating in the discussion so hopefully this email captures
> > > what was missed:
> > >
> > >   https://linaro.atlassian.net/wiki/spaces/STR/pages/28682518685/2022-02-03+Project+Stratos+Sync+Meeting+Notes
> >
> > Yes, any emulation backend (including virtio backends) would require an
> > IOREQ implementation, which includes notifications via event channels.
> > Event channels are delivered as a GIC PPI interrupt to the Linux kernel.
> > Then, the kernel sends the notification to userspace via a file
> > descriptor.
> 
--8323329-1281770804-1645045378=:43738--

