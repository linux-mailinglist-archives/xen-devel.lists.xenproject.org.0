Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 62FAD4B314F
	for <lists+xen-devel@lfdr.de>; Sat, 12 Feb 2022 00:35:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.270678.465000 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nIfRG-0001XL-1N; Fri, 11 Feb 2022 23:34:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 270678.465000; Fri, 11 Feb 2022 23:34:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nIfRF-0001UJ-UL; Fri, 11 Feb 2022 23:34:53 +0000
Received: by outflank-mailman (input) for mailman id 270678;
 Fri, 11 Feb 2022 23:34:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=u2lR=S2=xilinx.com=stefanos@srs-se1.protection.inumbo.net>)
 id 1nIfRE-0001UC-7L
 for xen-devel@lists.xenproject.org; Fri, 11 Feb 2022 23:34:52 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on20603.outbound.protection.outlook.com
 [2a01:111:f400:7e88::603])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 349f76e6-8b93-11ec-8eb8-a37418f5ba1a;
 Sat, 12 Feb 2022 00:34:50 +0100 (CET)
Received: from SA0PR11CA0028.namprd11.prod.outlook.com (2603:10b6:806:d3::33)
 by PH0PR02MB8763.namprd02.prod.outlook.com (2603:10b6:510:f0::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.12; Fri, 11 Feb
 2022 23:34:45 +0000
Received: from SN1NAM02FT0042.eop-nam02.prod.protection.outlook.com
 (2603:10b6:806:d3:cafe::45) by SA0PR11CA0028.outlook.office365.com
 (2603:10b6:806:d3::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.15 via Frontend
 Transport; Fri, 11 Feb 2022 23:34:45 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (149.199.62.198) by
 SN1NAM02FT0042.mail.protection.outlook.com (10.97.4.129) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4975.11 via Frontend Transport; Fri, 11 Feb 2022 23:34:44 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Fri, 11 Feb 2022 15:34:43 -0800
Received: from smtp.xilinx.com (172.19.127.95) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Fri, 11 Feb 2022 15:34:43 -0800
Received: from [10.23.120.145] (port=64944 helo=ubuntu-20.04.2-arm64.shared)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <stefano.stabellini@xilinx.com>)
 id 1nIfR5-0006V2-Oj; Fri, 11 Feb 2022 15:34:43 -0800
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
X-Inumbo-ID: 349f76e6-8b93-11ec-8eb8-a37418f5ba1a
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JNmrGS0gijoKvcXHFqQjw2hZ117r0PVLPNBQJKSrfORbHYLlc+n7FfVhVVzPBTFBpvrsdS9qbmayY4/V49At/HCPDkFBqWysebSAtysYWUOofqUeGTf4NEYTLv1QFIOQHd//BRIAj+MOA9hGucSd8dpNTTv7uQwhsBnDgPRDxNyAjj0xaRQjfUiE6qVEmMaTy6aFSNHYLAtolUXN61Unz0LHuZXY7vLXc1PfWSSmkaV1vwubXP6mbkh3bU74qevVWlTa20SaA1VkGFEIdR9MlbHHDT9Q4krdHKVKrABl/8hK5SnVOw7czmjuFybBhBKVzQXx+HiuBH9mM3MQJFGz/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cvFQN9JienQG+muiB2OfHI1+NPX3aY65DQpnak25QD0=;
 b=F5WT0h5+K4/nxbtw+/aTdszAZKjDdeA+FggSPVdBrijXbEeEpbyKRDnlhehpT+SB/DbjqDIjIATVInc2DlQxETNzq11g/fnGfqW/5m9aK5tjKP1kam1F1dE5Uo2koIR/es9AFNW5vFclSvP4bzN/UDUaHP1UWB87ykNm8fIiL/bef52LxfznbhuFyuEsGXKiKNiNsip8nrH78oFTDEymGSBDW+c6e/c8SVOPSDyo5BuQ4gZYo7N5ej+a6bIa3vyogAuNv57o4cz593iARl2S/1LYiRzgOY6tlC9SXM8WIMxlB9IBtcVp9jVYJnZRbZpEJ+0cgWoqzXGg7TYQnkQAjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=linaro.org smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cvFQN9JienQG+muiB2OfHI1+NPX3aY65DQpnak25QD0=;
 b=sGiuY9Wx0b5jlZ+7uo6vmActZ004eUv3LiRMHdXVf6iDhjdd0eO/XZZ/f9ZcILikGmoS0KyqWTpJSHpNXFshVqSfBpCgsQY7NvjYHo7J6Qm8GaWObgU9+qDhnoV+XC/HLJvYPVmiNy6TLLEPIlkqHAgaaA5mRN27+165bPsG3eA=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch02.xlnx.xilinx.com;
Date: Fri, 11 Feb 2022 15:34:43 -0800
From: Stefano Stabellini <stefano.stabellini@xilinx.com>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
CC: Stefano Stabellini <stefano.stabellini@xilinx.com>, Vincent Guittot
	<vincent.guittot@linaro.org>, <stratos-dev@op-lists.linaro.org>,
	<xen-devel@lists.xenproject.org>, AKASHI Takahiro
	<takahiro.akashi@linaro.org>, Arnd Bergmann <arnd.bergmann@linaro.org>,
	Christopher Clark <christopher.w.clark@gmail.com>, Dmytro Firsov
	<dmytro_firsov@epam.com>, Julien Grall <julien@xen.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, <Oleksandr_Tyshchenko@epam.com>,
	<Artem_Mygaiev@epam.com>, <bertrand.marquis@arm.com>, <Wei.Chen@arm.com>,
	<Ed.Doxat@arm.com>, <Oleksii_Moisieiev@epam.com>
Subject: Re: Metadata and signalling channels for Zephyr virtio-backends on
 Xen
In-Reply-To: <87k0e1cl9z.fsf@linaro.org>
Message-ID: <alpine.DEB.2.22.394.2202111445290.2091381@ubuntu-linux-20-04-desktop>
References: <87h79bgd1m.fsf@linaro.org> <alpine.DEB.2.22.394.2202071419270.2091381@ubuntu-linux-20-04-desktop> <87k0e1cl9z.fsf@linaro.org>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed;
	boundary="8323329-1747806176-1644620554=:2091381"
Content-ID: <alpine.DEB.2.22.394.2202111502360.2091381@ubuntu-linux-20-04-desktop>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 72b68da3-503f-4211-6362-08d9edb715b7
X-MS-TrafficTypeDiagnostic: PH0PR02MB8763:EE_
X-Microsoft-Antispam-PRVS:
	<PH0PR02MB8763FCACB86D7A36F79FBB74A0309@PH0PR02MB8763.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	si7BCVIg49xhfZRZO/pWSSF4QJdwyHvHR+690P1YfEAqp6bjPKYjiuEyzI9OjgsAVl1/82NqnB17XCrpPOm++qrqAdn3WkVy8l4KYkQjXFB8clg57BEFed7gMsehQ1RsWlI06nlU+Azs9nzbuosWW4kN5QwsNc1lXrPkQUp1WQDLq1pfv+xZEhosEP3rOrxosiWm60r4s/8vEXa9Cw2RQy3HEGvUZn1tBIKtloCQSIjvdmgpNe1ckUNgKiO45DH3IbbB6+xnvgUGwkGp+Rl8Fc5ny+ckG+aIkAaGvd6FwIdHFeuLCumz4y7FpipMlvMoOqoSnlDauX8f42+8Jn5GaOiExbxDXR/2hBeoTYDl0YTgSd+3+DDH04yrFpG+Wu6TYKUZFpFmgxSrQkGKy30/8kPlKy6oJXaIjc9L83Sgm2ASOEw2mQ2y4Madami1wDvCLqrqfkchLgt65RmZjCu/xWOC4XPEjIVyQ4qoNfHtINU6Kk+rlsThQYZsIUKB0i9wSC8Xf17+Wx+YQqs4o69v30y7SeUm6tzXqdjc+E6CLjGOpjU9zJqZlQAKY+w2pWQsM4mJRlY20YhoaL8i5rXE5DcExCvIc/GhkCiFzhMu1IlTR3THvyDWjwfPXQXEplhqj+YgNI3jjlFLIcBp3llOLe7zjpdIU31+nJknr0q8rw+N/vOE6+D1kFsyAoVVQD0nXUOykSIXMUSqhXkJvspyrzLKUokw6b/BISKLzgfLiCqgbGZt88BVJrKmjZixyzciEP17ZK/XZBQKE3To67jJ5vP+U7TW4apXiO3x7ozEk+I=
X-Forefront-Antispam-Report:
	CIP:149.199.62.198;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapexch02.xlnx.xilinx.com;PTR:unknown-62-198.xilinx.com;CAT:NONE;SFS:(13230001)(7916004)(4636009)(36840700001)(40470700004)(46966006)(66574015)(356005)(26005)(186003)(40460700003)(47076005)(5660300002)(2906002)(33716001)(9786002)(44832011)(7416002)(33964004)(8936002)(4326008)(82310400004)(6916009)(70206006)(316002)(54906003)(966005)(9686003)(508600001)(8676002)(83380400001)(426003)(336012)(7636003)(36860700001)(70586007);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Feb 2022 23:34:44.7992
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 72b68da3-503f-4211-6362-08d9edb715b7
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.62.198];Helo=[xsj-pvapexch02.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1NAM02FT0042.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR02MB8763

--8323329-1747806176-1644620554=:2091381
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Content-ID: <alpine.DEB.2.22.394.2202111502361.2091381@ubuntu-linux-20-04-desktop>

On Fri, 11 Feb 2022, Alex Bennée wrote:
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
> 
> Can domU's not be given particular access to HW they might want to
> tweak? I assume at some point a block device backend needs to actually
> talk to real HW to store the blocks (even if in most cases it would be a
> kernel doing the HW access on it's behalf).

Yes, it would. Block and network are subsystems with limited visibility,
access, and harmful capabilities (assuming IOMMU).

If the block device goes down or is misused, block might not work but
everything else is expected to work. Block only requires visibility of
the block device for it to work. The same is true for network, GPU, USB,
etc.

SCMI is different. If SCMI is misused the whole platform is affected.
SCMI implies visibility of everything in the system. It is not much
about emulating SCMI but more about mediating SCMI calls.

In other words, SCMI is not a device, it is a core interface. In a Xen
model, Xen virtualizes CPU and memory and other core features/interfaces
(timers, interrupt controller, IOMMU, etc). The PCI root complex is
handled by Xen too. Individual (PCI and non-PCI) devices are assigned to
guests.

These are the reasons why I think the best way to enable SCMI in
upstream Xen is with a mediator in the hypervisor as it is currently in
development. Any chances you could combine your efforts with EPAM's
outstanding series? You might be able to spot gaps if any, and might
even have already code to fill those gaps. It would be fantastic to have
your reviews and/or contributions on xen-devel.

Otherwise, if you have to run the virtio-scmi backend in userspace, why
not try to get it to work on Xen :-) It might not be the ideal solution,
but it could be a good learning experience and pave the way for the
other virtio backends which definitely will be in userspace
(virtio-block, virtio-gpu, etc).


> >> Currently the demo setup
> >> is intermediated by a double-ended vhost-user daemon running on the
> >> devbox acting as a go between a number of QEMU instances representing
> >> the front and back-ends. You can view the architecture with Vincents
> >> diagram here:
> >> 
> >>   https://docs.google.com/drawings/d/1YSuJUSjEdTi2oEUq4oG4A9pBKSEJTAp6hhcHKKhmYHs/edit?usp=sharing
> >> 
> >> The key virtq handling is done over the special carve outs of shared
> >> memory between the front end and guest. However the signalling is
> >> currently over a virtio device on the backend. This is useful for the
> >> PoC but obviously in a real system we don't have a hidden POSIX system
> >> acting as a go between not to mention the additional latency it causes
> >> with all those context switches.
> >> 
> >> I was hoping we could get some more of the Xen experts to the next
> >> Stratos sync (17th Feb) to go over approaches for a properly hosted on
> >> Xen approach. From my recollection (Vincent please correct me if I'm
> >> wrong) of last week the issues that need solving are:
> >
> > Unfortunately I have a regular conflict which prevents me from being
> > able to join the Stratos calls. However, I can certainly make myself
> > available for one call (unless something unexpected comes up).
> >
> >
> >>  * How to handle configuration steps as FE guests come up
> >> 
> >> The SCMI server will be a long running persistent backend because it is
> >> managing real HW resources. However the guests may be ephemeral (or just
> >> restarted) so we can't just hard-code everything in a DTB. While the
> >> virtio-negotiation in the config space covers most things we still need
> >> information like where in the guests address space the shared memory
> >> lives and at what offset into that the queues are created. As far as I'm
> >> aware the canonical source of domain information is XenStore
> >> (https://wiki.xenproject.org/wiki/XenStore) but this relies on a Dom0
> >> type approach. Is there an alternative for dom0less systems or do we
> >> need a dom0-light approach, for example using STR-21 (Ensure Zephyr can
> >> run cleanly as a Dom0 guest) providing just enough services for FE's to
> >> register metadata and BE's to read it?
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
> 
> Even in a full dom0less setup you still need to manage lifetimes somehow
> if a guest reboots.

Sure but that's not a problem: all the info and configuration related to
rebooting the guest can also be pre-generated in Yocto or ImageBuilder.

As an example, it is already possible (although rudimental) in
ImageBuilder to generate the dom0less configuration and also the domU xl
config file for the same domU with passthrough devices.
--8323329-1747806176-1644620554=:2091381--

