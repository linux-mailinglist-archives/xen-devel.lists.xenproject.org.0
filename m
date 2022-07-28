Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 45E56584789
	for <lists+xen-devel@lfdr.de>; Thu, 28 Jul 2022 23:07:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.377181.610258 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oHAjA-0000zJ-JY; Thu, 28 Jul 2022 21:07:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 377181.610258; Thu, 28 Jul 2022 21:07:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oHAjA-0000ws-Fm; Thu, 28 Jul 2022 21:07:28 +0000
Received: by outflank-mailman (input) for mailman id 377181;
 Thu, 28 Jul 2022 21:07:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=C0cA=YB=amd.com=stefano.stabellini@srs-se1.protection.inumbo.net>)
 id 1oHAj8-0000wm-W6
 for xen-devel@lists.xenproject.org; Thu, 28 Jul 2022 21:07:27 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2059.outbound.protection.outlook.com [40.107.243.59])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 46ea1553-0eb9-11ed-924f-1f966e50362f;
 Thu, 28 Jul 2022 23:07:25 +0200 (CEST)
Received: from BN9PR03CA0597.namprd03.prod.outlook.com (2603:10b6:408:10d::32)
 by PH0PR12MB5468.namprd12.prod.outlook.com (2603:10b6:510:ea::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5482.6; Thu, 28 Jul
 2022 21:07:20 +0000
Received: from BN8NAM11FT040.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:10d:cafe::cf) by BN9PR03CA0597.outlook.office365.com
 (2603:10b6:408:10d::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5482.10 via Frontend
 Transport; Thu, 28 Jul 2022 21:07:20 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BN8NAM11FT040.mail.protection.outlook.com (10.13.177.166) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5482.10 via Frontend Transport; Thu, 28 Jul 2022 21:07:20 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Thu, 28 Jul
 2022 16:07:19 -0500
Received: from ubuntu-20.04.2-arm64.shared (10.180.168.240) by
 SATLEXMB03.amd.com (10.181.40.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28 via Frontend Transport; Thu, 28 Jul 2022 16:07:13 -0500
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
X-Inumbo-ID: 46ea1553-0eb9-11ed-924f-1f966e50362f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fdUq5mBJDlCKMjDAogom2dG6W1QljmPcOONPYdCWKO5cytU7gwGlsJEe6c4EaSgeMGXmcMuOTg1/T1w7iyj2WoJ4wR5+ksM1quRMsadiyOXDmwC5H+X8d812bqxU0GO2zKrpjYM3oXZSkFCBXbkaDmF13kfJO4ciOG0KCY2yaOZJ9W8G9eoVN+avRvp0AF0Py3prf6KT8Q36VIKrStwIxJRAbr4syAOtBlckCK+rhRgjqI2IcbZCewO4liHOsT1jKZzAcW+ThNZpxb7pdFkoENocIQh2X3Kr+7IFJN+DS9UrTPhKJMSrNPSgBzrWSnp0FSnBlRTW8TZWJLa9B0G9QA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mgk2nthYcqQjL7vj6xYPhzGb7JQB/6hr8mZMLS6kRoA=;
 b=Hh6DoLQEGy9ZnG5juflZxCoTQegKrA+CZmwtfDUus8ee63Z0tOAR997dHRA7L1pQ20z7KixfuGWm/saI8muUBUA3Q/EIR3IG9ra3/FjEaa0/HskUElG4JOp0Bkt7UHdHrbBsSqyFq2pGNaTJs24wdAqVQ60HJTopC4xVI7OSHkh17K7RCpRjgdvvftzl9SDca0ot2lVZZbvfsg21Koe8cyUe5mP6PpuAuPs+ZrwTXGsEsWL6WQTeYCGd/S1OdmQpQ+KzYvrFahB7jcYWfcY5/hvq+VdIFSGTGbTs6Yis2JtF7by3A+q8UKeFzNA2MohdY9BYdeZ1e8WE68Gbfqy4jw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mgk2nthYcqQjL7vj6xYPhzGb7JQB/6hr8mZMLS6kRoA=;
 b=GLRWb/iwTxlMgEpCP9TFE8tCCOItMEnom7xhY/1sY47uaJg64jb9kVhH358EyQGVdrI5U1qdE4Ep++v3Wdt+INWMpzUhi0+kHvkpxuhe85RLKilKqaeAzvGc1QNzrPR7jPQiYX0fPJW3pkjrBvF/HEFTyiKmiNWuOAP0gWyasFg=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Date: Thu, 28 Jul 2022 14:07:12 -0700
From: Stefano Stabellini <stefano.stabellini@amd.com>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Igor Mammedov <imammedo@redhat.com>
CC: Huang Rui <ray.huang@amd.com>, "anthony.perard@citrix.com"
	<anthony.perard@citrix.com>, "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Huang,
 Trigger" <Trigger.Huang@amd.com>, <kraxel@redhat.com>, <mst@redhat.com>,
	<xadimgnik@gmail.com>, <anthony.perard@citrix.com>, <vikram.garhwal@amd.com>
Subject: Re: Question to mem-path support at QEMU for Xen
In-Reply-To: <20220728155618.2c390be3@redhat.com>
Message-ID: <alpine.DEB.2.22.394.2207281342070.4648@ubuntu-linux-20-04-desktop>
References: <Yt+XS81vmsWoJA5y@amd.com> <20220727101930.66ed56e1@redhat.com> <YuI4HXKaRnnS9foV@amd.com> <20220728155618.2c390be3@redhat.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 04d4540d-d1c6-47fa-9470-08da70dd290b
X-MS-TrafficTypeDiagnostic: PH0PR12MB5468:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	jm6YuVz9iYnsfAij0gV5U80yq0h7CpsyygRannuFjbiUpmyl49NOiwdMnkYISJX35DhWV8usZ+bhn5EPaEudHtDjaw0qffLQSYlzWKfqw3CNDkRULMzMpkxtTtQJV+HOgQOgkavOBVoS3JWzMPD8mIpid8uXGmmTlNM0SC+dPgt4WgE6BzFLak5ezEFz+6pAEv7a1nzp8ZpkvEVarNRzXIbJMsZoathsqKCjB6SljlnwfC5kiqs7x6j0wlb7Ff3DQ+XP3ABSwtxo5RClAIsuRdAf7tXuP99RnaXz6oU5kNVE54sDf8IDYr/vSzKFi6vT3byynZrVSz3rC/Ptmm+8H0GemnIQhEx+OJejt7CMIgjj+gpKp+HO4h1sfSxX05Ha1K+R3YyBc7TH0qJYhuOnzCxjaoDluMKRPxbLUQWFU0vRV45MvRpAnM7oHHo/kyx1gSGstqc4b4NHi8uHlnXdIVHLhiH4tZE9qD+WZXEbIxleiKa6YbR2WLtZ5ObIlALwvdGyeE2p7BQpdfgYc7RBHFO3L/qJqmSAY33vKRpNPFCnLbH028E6EmJ/UklwQHNuUOK/GhPjiSlFeQM1XjtWmM5YSFol6lITqMmxWVR2KrzcBFna9M8XCCRvxuZJFCrwIV+58M9HooDPxj0GPZGRJYZnSQ0Frl9vXkhnqMG2XSQQKZ4T7sYRTIxGELpYLdbFf9JXBYlrH1FUIkLbru9MHYeTdMKxb1hxZvFe6lI3BhLhY3jzEVIUohA/G9meV2fDSFKUI0DkDG9niIl6bhVrIx7Ni+7l+TarZaBZBsGjLnGXb7N1J41FqPBxfzNnrZLVkHQocMpVuqUreCjodsymWw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230016)(4636009)(7916004)(136003)(346002)(376002)(396003)(39860400002)(36840700001)(46966006)(40470700004)(4326008)(40460700003)(44832011)(70206006)(8676002)(8936002)(70586007)(356005)(82740400003)(316002)(2906002)(336012)(6916009)(54906003)(86362001)(36860700001)(33716001)(426003)(81166007)(26005)(9686003)(83380400001)(47076005)(5660300002)(40480700001)(82310400005)(478600001)(41300700001)(186003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2022 21:07:20.4429
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 04d4540d-d1c6-47fa-9470-08da70dd290b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN8NAM11FT040.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB5468

On Thu, 28 Jul 2022, Igor Mammedov wrote:
> On Thu, 28 Jul 2022 15:17:49 +0800
> Huang Rui <ray.huang@amd.com> wrote:
> 
> > Hi Igor,
> > 
> > Appreciate you for the reply!
> > 
> > On Wed, Jul 27, 2022 at 04:19:30PM +0800, Igor Mammedov wrote:
> > > On Tue, 26 Jul 2022 15:27:07 +0800
> > > Huang Rui <ray.huang@amd.com> wrote:
> > >   
> > > > Hi Anthony and other Qemu/Xen guys,
> > > > 
> > > > We are trying to enable venus on Xen virtualization platform. And we would
> > > > like to use the backend memory with memory-backend-memfd,id=mem1,size=4G
> > > > options on QEMU, however, the QEMU will tell us the "-mem-path" is not
> > > > supported with Xen. I verified the same function on KVM.
> > > > 
> > > > qemu-system-i386: -mem-path not supported with Xen
> > > > 
> > > > So may I know whether Xen has any limitation that support
> > > > memory-backend-memfd in QEMU or just implementation is not done yet?  
> > > 
> > > Currently Xen doesn't use guest RAM allocation the way the rest of
> > > accelerators do. (it has hacks in memory_region/ramblock API,
> > > that divert RAM allocation calls to Xen specific API)  
> > 
> > I am new for Xen and QEMU, we are working on GPU. We would like to have a
> > piece of backend memroy like video memory for VirtIO GPU to support guest
> > VM Mesa Vulkan (Venus). Do you mean we can the memory_region/ramblock APIs
> > to work around it?
> > 
> > > 
> > > The sane way would extend Xen to accept RAM regions (whatever they are
> > > ram or fd based) QEMU allocates instead of going its own way. This way
> > > it could reuse all memory backends that QEMU provides for the rest of
> > > the non-Xen world. (not to mention that we could drop non trivial
> > > Xen hacks so that guest RAM handling would be consistent with other
> > > accelerators)
> > >   
> > 
> > May I know what do you mean by "going its own way"? This sounds good, could
> > you please elaborate on how can we implement this? We would like to give a
> > try to address the problem on Xen. Would you mind to point somewhere that I
> > can learn and understand the RAM region. Very happy to see your
> > suggestions!
> 
> see for example see ram_block_add(), if Xen could be persuaded to use memory
> allocated by '!xen_enabled()' branch then it's likely file base backends
> would also become usable.
> 
> Whether it is possible for Xen or not I don't know,
> I guess CCed Xen folks will suggest something useful.


Hi Igor, Huang,

I think there is room for improvement in the way Xen support in QEMU is
implemented, especially because it predates support for other
accelerators in QEMU. I am happy to help come up with a good idea or two
on how to do it better.

At the same time it is not trivial. The way Xen works with QEMU is that
Xen is the one allocating memory for the VM. Keep in mind that in a Xen
setup, the VM where QEMU is running is just one of the many VMs in the
system (even if it is dom0) and doesn't have ownership over the entire
memory. It is also possible to run QEMU in a regular guest for security
benefits.

Given that, Xen is typically the one allocating memory for the VM and by
the time QEMU is started the main memory is already allocated.

That is the reason why normally ram_block_add() is implemented in a
special way for Xen using xen_ram_alloc. In most cases, there is no need
to allocate any memory at all.

However, it is also possible for QEMU to allocate memory for the VM. It
is done by QEMU issuing a hypercall to Xen. See for instance the call to
xc_domain_populate_physmap_exact. As you can see from the implementation
of xen_ram_alloc, it is already used for things that are not normal
memory (see the check mr == &ram_memory). So if you want to allocate
memory for the VM, you could use xc_domain_populate_physmap_exact.


Another thing to note is that Xen can connect to multiple emulators at
the same time. Each emulator (each instance of QEMU, or other emulators)
uses a hypercall to connect to Xen and register a PCI device or memory
range that it is emulating. Each emulator is called "IOREQ server" in
Xen terminology because it is handling "IO emulation REQuests" from Xen.
The IOREQ interface is very simple. each IOREQ is defined a ioreq_t
struct, see: xen/include/public/hvm/ioreq.h:ioreq_t

So if you are looking to connect a secondary emulator to QEMU, a
different, more efficient, way to solve the problem on Xen would be to
connect the secondary emulator directly to Xen. Instead of:

  Xen -> QEMU -> secondary emulator

You would do:

  Xen ---> QEMU
       |
       +-> secondary emulator


The second approach is much faster in terms of latency because you are
going to skip a step in the notification chain. See how QEMU calls
xen_register_ioreq to register itself with Xen.

