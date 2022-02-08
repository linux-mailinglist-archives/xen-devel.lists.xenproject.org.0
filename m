Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 942204ACCBA
	for <lists+xen-devel@lfdr.de>; Tue,  8 Feb 2022 01:17:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.267467.461203 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nHEBJ-0006up-UF; Tue, 08 Feb 2022 00:16:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 267467.461203; Tue, 08 Feb 2022 00:16:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nHEBJ-0006rr-QX; Tue, 08 Feb 2022 00:16:29 +0000
Received: by outflank-mailman (input) for mailman id 267467;
 Tue, 08 Feb 2022 00:16:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Yqj2=SX=xilinx.com=stefanos@srs-se1.protection.inumbo.net>)
 id 1nHEBH-0006rl-A7
 for xen-devel@lists.xenproject.org; Tue, 08 Feb 2022 00:16:27 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20608.outbound.protection.outlook.com
 [2a01:111:f400:fe5b::608])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 59181628-8874-11ec-8f75-fffcc8bd4f1a;
 Tue, 08 Feb 2022 01:16:25 +0100 (CET)
Received: from SN7PR04CA0039.namprd04.prod.outlook.com (2603:10b6:806:120::14)
 by SJ0PR02MB8467.namprd02.prod.outlook.com (2603:10b6:a03:3f7::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.12; Tue, 8 Feb
 2022 00:16:21 +0000
Received: from SN1NAM02FT0047.eop-nam02.prod.protection.outlook.com
 (2603:10b6:806:120:cafe::64) by SN7PR04CA0039.outlook.office365.com
 (2603:10b6:806:120::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.12 via Frontend
 Transport; Tue, 8 Feb 2022 00:16:21 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (149.199.62.198) by
 SN1NAM02FT0047.mail.protection.outlook.com (10.97.5.120) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4951.12 via Frontend Transport; Tue, 8 Feb 2022 00:16:20 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Mon, 7 Feb 2022 16:16:02 -0800
Received: from smtp.xilinx.com (172.19.127.95) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Mon, 7 Feb 2022 16:16:02 -0800
Received: from [10.23.120.145] (port=57738 helo=ubuntu-20.04.2-arm64.shared)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <stefano.stabellini@xilinx.com>)
 id 1nHEAs-0000aw-OH; Mon, 07 Feb 2022 16:16:02 -0800
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
X-Inumbo-ID: 59181628-8874-11ec-8f75-fffcc8bd4f1a
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fC34V4nEzOc+yAZQN7mc2KehnIgytZNDmU7vNQbXiRJFgTM/p+nILlqPPsG5EOOE3/px/TNASriO80y8mzVRB5Ogik+OVhse0pqZvExPVxO/lOTmCbtnaNxr4UySE4Xlbfc/GRlhZZccOV1XQaTXaETTo7J8+MNFStEphr5u0Oxs3usBHKZAlbkvd1ZNakvzVaReuH+yqW3Y4kw0ast0Y5j2ua+zBQE6kkSlUcjA9QpLOAWatO+gWhVm9OK0c0nQv1bO0RPJSC7TzyR1yBItCOJDhg8I1wad3oqNLMTLoW+64m23cCZTxIzEwtcNe44fYcp+T1kXezd/n94v9C3awQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E3cE+QEJk3oDCyfgnZSUOJPrIkDlMVuDo/g5tSaRvZQ=;
 b=dCaZF3GQrIdEJpSKSM5H+UMBrMLZe3FFFabbdMsb2XLcSGFTRct8G6rASlkA1/Rf5bFHb8EOXhmuxFgwgktXJaciKelLdgyOAG2eSyQmFofoJkfDfGM/PQdW8evCEcUIDrso5CBNI2KgYkyzxhS671t+SYQOSRkx+cTuQUFBG6esxuD21hFYI3qgZmnKROPIh+wL63Z3sV7NS0tzSqpf2vRoM5xEljA6lrLWOqd/O/e3oOYB+GH6teEHG1CkbXNC5waxm69h3fhc0eR/kvHuX9xSrQhlC3SFnMQ+DDircZ+vgHiXienseplZnhPs+2UTG7WTadjnd1m9uVkvgW/WZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=linaro.org smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E3cE+QEJk3oDCyfgnZSUOJPrIkDlMVuDo/g5tSaRvZQ=;
 b=hfqSCRviHjrNumr43W1/bZ3wG8VQ2+EtwvkY4Sk3IWvZdjYuxXn0rkal2GnBZT6dbyq3YImfm5N43odBL/D49Pn8/PtkGmxF7RoiCGZaExgcCzPc6YJsxWpSFyT8ZAyHTx7gUzSZ0ccJxuaqI2k92TKmsZRW/eAOp8pZnLGQgnQ=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch02.xlnx.xilinx.com;
Date: Mon, 7 Feb 2022 16:16:02 -0800
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
In-Reply-To: <87h79bgd1m.fsf@linaro.org>
Message-ID: <alpine.DEB.2.22.394.2202071419270.2091381@ubuntu-linux-20-04-desktop>
References: <87h79bgd1m.fsf@linaro.org>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed;
	boundary="8323329-618230339-1644272516=:2091381"
Content-ID: <alpine.DEB.2.22.394.2202071422170.2091381@ubuntu-linux-20-04-desktop>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 98622387-adad-41e0-1bc5-08d9ea983bcc
X-MS-TrafficTypeDiagnostic: SJ0PR02MB8467:EE_
X-Microsoft-Antispam-PRVS:
	<SJ0PR02MB8467B0FA374EE11A2088223BA02D9@SJ0PR02MB8467.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	+7jXePYhCFGO5My4ecuXhXQXt+H6A0p/OcAbkHwMKCi1fslCaw8B2Tqo1VHx86JwwwipwOf9dUrK+w85WlKjaWrTfvZQWxe5bqHHGBmIVhkkziMAegLDuHaX6G67+wrZRJMa+uCfUQ2MsJn1GY9qWoadmF5wkNW0Eh2celNl7Vm8bNi9/RXV0xdt5XKnjwHStAfCkxIwQaz6QQHNxqljifqYXbsipxYXJ/RSSfQBnGqR41+WD6kjHmm28X9jc5q8VKql4+hbOQ63N89jtquQ8W/Qn552N0xQxb6T4YxMC4/rQJFAMw587VAzYYx+XmnCfNy3YPdcILVEe/m9WQopPLeUs4KhduTknzfQASNIWF8j6MJZYU7YHP16Tirp5CJ8Z8WGcaHjag+iDFzuAMsK9WNeg8BB0tNzA/1yLzhIinWH86xeW157yREWOXX7s51dN4sz60qhUucjDcC2UrbfiGF7vOQpQeKof62kQQIMYA3YDWLYJIMuvMh2kjLEwRuq3BajasV6MoXS2xKra8Dno/Drbr6CDnR9uENl43zoIKbNrPXkyyuR17fWY1G9kJUrEDhg4x/g+KF01RABKffDdk6L/Dl994PQFv7KWFKv7qjCsCYW6HFCdi+7zh9sm0z2vbdzwcKFg4B7KTSdPqs6Vn49BaGfyoBKiQxvv+AF0PkEmcklBVV+ymyGE7cWfjhG2UBT7C2uJtnDvyk3+Gy4bVgoeEEHxXLgyUP3vQvw0HI=
X-Forefront-Antispam-Report:
	CIP:149.199.62.198;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapexch02.xlnx.xilinx.com;PTR:unknown-62-198.xilinx.com;CAT:NONE;SFS:(13230001)(7916004)(4636009)(46966006)(36840700001)(508600001)(6916009)(9686003)(33964004)(316002)(2906002)(8676002)(44832011)(7416002)(4326008)(9786002)(8936002)(70206006)(5660300002)(70586007)(83380400001)(54906003)(356005)(82310400004)(966005)(47076005)(7636003)(36860700001)(33716001)(186003)(336012)(26005)(426003)(66574015);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Feb 2022 00:16:20.8015
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 98622387-adad-41e0-1bc5-08d9ea983bcc
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.62.198];Helo=[xsj-pvapexch02.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1NAM02FT0047.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR02MB8467

--8323329-618230339-1644272516=:2091381
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Content-ID: <alpine.DEB.2.22.394.2202071422171.2091381@ubuntu-linux-20-04-desktop>

On Mon, 7 Feb 2022, Alex Bennée wrote:
> Hi Stefano,
> 
> Vincent gave an update on his virtio-scmi work at the last Stratos sync
> call and the discussion moved onto next steps.

Hi Alex,

I don't know the specifics of virtio-scmi, but if it is about power,
clocks, reset, etc. like the original SCMI protocol, then virtio-scmi is
likely going to be very different from all the other virtio frontends
and backends. That's because SCMI requires a full view of the system,
which is different from something like virtio-net that is limited to the
emulation of 1 device. For this reason, it is likely that the
virtio-scmi backend would be a better fit in Xen itself, rather than run
in userspace inside a VM.

FYI, a good and promising approach to handle both SCMI and SCPI is the
series recently submitted by EPAM to mediate SCMI and SCPI requests in
Xen: https://marc.info/?l=xen-devel&m=163947444032590

(Another "special" virtio backend is virtio-iommu for similar reasons:
the guest p2m address mappings and also the IOMMU drivers are in Xen.
It is not immediately clear whether a virtio-iommu backend would need to
be in Xen or run as a process in dom0/domU.)

On the other hand, for all the other "normal" protocols (e.g.
virtio-net, virtio-block, etc.) the backend would naturally run as a
process in dom0 or domU (e.g. QEMU in Dom0) as one would expect.


> Currently the demo setup
> is intermediated by a double-ended vhost-user daemon running on the
> devbox acting as a go between a number of QEMU instances representing
> the front and back-ends. You can view the architecture with Vincents
> diagram here:
> 
>   https://docs.google.com/drawings/d/1YSuJUSjEdTi2oEUq4oG4A9pBKSEJTAp6hhcHKKhmYHs/edit?usp=sharing
> 
> The key virtq handling is done over the special carve outs of shared
> memory between the front end and guest. However the signalling is
> currently over a virtio device on the backend. This is useful for the
> PoC but obviously in a real system we don't have a hidden POSIX system
> acting as a go between not to mention the additional latency it causes
> with all those context switches.
> 
> I was hoping we could get some more of the Xen experts to the next
> Stratos sync (17th Feb) to go over approaches for a properly hosted on
> Xen approach. From my recollection (Vincent please correct me if I'm
> wrong) of last week the issues that need solving are:

Unfortunately I have a regular conflict which prevents me from being
able to join the Stratos calls. However, I can certainly make myself
available for one call (unless something unexpected comes up).


>  * How to handle configuration steps as FE guests come up
> 
> The SCMI server will be a long running persistent backend because it is
> managing real HW resources. However the guests may be ephemeral (or just
> restarted) so we can't just hard-code everything in a DTB. While the
> virtio-negotiation in the config space covers most things we still need
> information like where in the guests address space the shared memory
> lives and at what offset into that the queues are created. As far as I'm
> aware the canonical source of domain information is XenStore
> (https://wiki.xenproject.org/wiki/XenStore) but this relies on a Dom0
> type approach. Is there an alternative for dom0less systems or do we
> need a dom0-light approach, for example using STR-21 (Ensure Zephyr can
> run cleanly as a Dom0 guest) providing just enough services for FE's to
> register metadata and BE's to read it?

I'll try to answer the question for a generic virtio frontend and
backend instead (not SCMI because SCMI is unique due to the reasons
above.)

Yes, xenstore is the easiest way to exchange configuration information
between domains. I think EPAM used xenstore to exchange the
configuration information in their virtio-block demo. There is a way to
use xenstore even between dom0less VMs:
https://marc.info/?l=xen-devel&m=164340547602391 Not just xenstore but
full PV drivers too. However, in the dom0less case xenstore is going to
become available some time after boot, not immediately at startup time.
That's because you need to wait until xenstored is up and running.

There are other ways to send data from one VM to another which are
available immediately at boot, such as Argo and static shared memory.

But dom0less is all about static partitioning, so it makes sense to
exploit the build-time tools to the fullest. In the dom0less case, we
already know what is going to run on the target before it is even turned
on. As an example, we might have already prepared an environment with 3
VMs using Yocto and ImageBuilder. We could also generate all
configurations needed and place them inside each VMs using Yocto's
standard tools and ImageBuilder. So for dom0less, I recommend to go via
a different route and pre-generate the configuration directly where
needed instead of doing dynamic discovery.


>  * How to handle mapping of memory
> 
> AIUI the Xen model is the FE guest explicitly makes grant table requests
> to expose portions of it's memory to other domains. Can the BE query the
> hypervisor itself to discover the available grants or does it require
> coordination with Dom0/XenStore for that information to be available to
> the BE domain?

Typically the frontend passes grant table references to the backend
(i.e. instead of plain guest physical addresses on the virtio ring.)
Then, the backend maps the grants; Xen checks that the mapping is
allowed.

We might be able to use the same model with virtio devices. A special
pseudo-IOMMU driver in Linux would return a grant table reference and an
offset as "DMA address". The "DMA address" is passed to the virtio
backend over the virtio ring. The backend would map the grant table
reference using the regular grant table hypercalls.


>  * How to handle signalling
> 
> I guess this requires a minimal implementation of the IOREQ calls for
> Zephyr so we can register the handler in the backend? Does the IOREQ API
> allow for a IPI style notifications using the global GIC IRQs?
> 
> Forgive the incomplete notes from the Stratos sync, I was trying to type
> while participating in the discussion so hopefully this email captures
> what was missed:
> 
>   https://linaro.atlassian.net/wiki/spaces/STR/pages/28682518685/2022-02-03+Project+Stratos+Sync+Meeting+Notes

Yes, any emulation backend (including virtio backends) would require an
IOREQ implementation, which includes notifications via event channels.
Event channels are delivered as a GIC PPI interrupt to the Linux kernel.
Then, the kernel sends the notification to userspace via a file
descriptor.
--8323329-618230339-1644272516=:2091381--

