Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6633E868370
	for <lists+xen-devel@lfdr.de>; Mon, 26 Feb 2024 23:02:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.685800.1067118 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rej26-0005AA-FR; Mon, 26 Feb 2024 22:01:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 685800.1067118; Mon, 26 Feb 2024 22:01:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rej26-00057q-CY; Mon, 26 Feb 2024 22:01:10 +0000
Received: by outflank-mailman (input) for mailman id 685800;
 Mon, 26 Feb 2024 22:01:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cwyd=KD=amd.com=stefano.stabellini@srs-se1.protection.inumbo.net>)
 id 1rej24-00057j-VZ
 for xen-devel@lists.xenproject.org; Mon, 26 Feb 2024 22:01:09 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on20601.outbound.protection.outlook.com
 [2a01:111:f403:2415::601])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 886ffd5b-d4f2-11ee-8a58-1f161083a0e0;
 Mon, 26 Feb 2024 23:01:04 +0100 (CET)
Received: from DS7PR03CA0211.namprd03.prod.outlook.com (2603:10b6:5:3ba::6) by
 DM4PR12MB6110.namprd12.prod.outlook.com (2603:10b6:8:ad::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7316.34; Mon, 26 Feb 2024 22:01:00 +0000
Received: from DS1PEPF0001708F.namprd03.prod.outlook.com
 (2603:10b6:5:3ba:cafe::69) by DS7PR03CA0211.outlook.office365.com
 (2603:10b6:5:3ba::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.49 via Frontend
 Transport; Mon, 26 Feb 2024 22:01:00 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DS1PEPF0001708F.mail.protection.outlook.com (10.167.17.139) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7292.25 via Frontend Transport; Mon, 26 Feb 2024 22:01:00 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Mon, 26 Feb
 2024 16:00:59 -0600
Received: from ubuntu-20.04.2-arm64.shared (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 26 Feb 2024 16:00:59 -0600
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
X-Inumbo-ID: 886ffd5b-d4f2-11ee-8a58-1f161083a0e0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Dsjj/4A+NE80GSPot01tzEdEbDpPu+Ypnml1i6RBf3s7n3lPA507lJ0ev79u+CukmH5fFRqhS7QJdaTP+OBfC2eVDQX+ZFQ6FuxrqtICtVO/c7FwQxY3OVRtIcLFivXSwAbuND9v37d9Ts79eoXfEoZLljkNiyXRpB8s3YA3CkbAGOZXs3gqRfBDKGoPndTW/YzUun08j/hsu6hQKLESzr46Bb4uKgxkH5QAHLYOaDgFkkle55PDhiosptT/pmZcCglVfM7e5lHSUcjkljptbLZmuEWMwqacH9Pqw0Fl9UpSog3NDJXL7HVZC1OYlHVr+tPJ0c8ReeMGiDbxakOjmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4/5bQQxxeS8lpi2svK66Drb1FT6L3WH3kQkmcgWzcsU=;
 b=nIcHJsi9E+CFI8OFaQ0apwTiaC8abrTrTFdVrA9WFt/4S4WKOV056VQUHzZgHtkCXzkbIAYXEqhj6Rbnswr9uDE4q3H+q59drgyZro4UrkPQjnIEWvd4pg1FO108VPtZ9X6XxKZAuUiV/H52Lj7cxIJTDla3gPHniqGVwxprLgUiwFxp1s40566zbHejsygobGyNBO6ijA8PnBT28datSVCK5MepndGV4lW7FLVrXXCeSJsMaoDLG2IieoIfHYUCXmUJKr8sO+3tTsEzNb98Ga/RwAEP51ZtCZwpGUiM2i8Xo1kd4WNPvmTOIUYiCag/K+g+3ir4Qb1qR0X4yIh59Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=nxp.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4/5bQQxxeS8lpi2svK66Drb1FT6L3WH3kQkmcgWzcsU=;
 b=yBf/rJn6iqoqMkQLqspR3so2V6ntkCtU/eRXp76gWYMHsU4spUcAA4a64iYuA5Uz3o+vpTbhudCjVIfV0gh140pBxIeboxxeo7hCq1BLD8D9i3WoP8dtQXCxd4aFtUF7/sRUml9sbl1xScDjrDUOMBNnyT3xr5g0opXfEWSItH8=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Date: Mon, 26 Feb 2024 14:00:58 -0800
From: Stefano Stabellini <stefano.stabellini@amd.com>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Peng Fan <peng.fan@nxp.com>
CC: Stefano Stabellini <stefano.stabellini@amd.com>, Julien Grall
	<julien@xen.org>, "vikram.garhwal@amd.com" <vikram.garhwal@amd.com>,
	"oleksandr_tyshchenko@epam.com" <oleksandr_tyshchenko@epam.com>, Leo Yan
	<leo.yan@linaro.org>, Viresh Kumar <viresh.kumar@linaro.org>,
	"stewart.hildebrand@amd.com" <stewart.hildebrand@amd.com>,
	"sgarzare@redhat.com" <sgarzare@redhat.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: RE: question about virtio-vsock on xen
In-Reply-To: <DU0PR04MB941746B1F385B6A514704F2B885A2@DU0PR04MB9417.eurprd04.prod.outlook.com>
Message-ID: <alpine.DEB.2.22.394.2402261359280.247676@ubuntu-linux-20-04-desktop>
References: <DU0PR04MB941734DA793D87B7FF3A491488552@DU0PR04MB9417.eurprd04.prod.outlook.com> <alpine.DEB.2.22.394.2402231332580.754277@ubuntu-linux-20-04-desktop> <DU0PR04MB941746B1F385B6A514704F2B885A2@DU0PR04MB9417.eurprd04.prod.outlook.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: None (SATLEXMB03.amd.com: stefano.stabellini@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF0001708F:EE_|DM4PR12MB6110:EE_
X-MS-Office365-Filtering-Correlation-Id: 24dee0e3-db02-4e59-e044-08dc37166b39
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	HnvfMCvHALZy7fJ2jNIzd67kEsPDgSb3uS9EZGZ4JKqAEpdrz7+AkKKc3wBtXXev+E9xujUDyZMtWYH+3qQhq4EdG2vtuAvv9zjH8CVhuSJYJKuZf97xS1rFlVmSTaCvK9IQlia56c/yos0qyx5xSorWxyH0q9a4TEdx774Rt3oRALcqAWJUDChfh3J0Vmu8yGBHreJuKaBDE2MUDH2Fdxv9rIbcBuRotsg2FvMJEHayM/9or1QzW7jtK94MQrmV2WaPuIwYvoTO9sTyWNGX/KLIXJFI885vMdNgbWSgTgghvJ8cgUZHTsglhkJ2RQl4Vjn/eyeYaCyrrY+5wJX22Rw81u6QD9cIlSPTrsMwQHRDWUxh5hlxuuq11f9pF7euD4B25UdVXOTCYspZx6RDhpNqYMImB5WZanHl/1xrzREwXE9/6+IdQhzyQZ5sjZzNC9Gp0vCwf6QhLGlcBN399Ifr2o1+8g55fpzvC3cgLat5dHPm3eggrie/M0jAqxTbYpUCuRUM+3vtQuJw080d/t46RsAmudh06jgfR4oUKrdB+Z2ko2NC79eaR/KTHuO/UHSJrcuETZmkTW1k5PW63NZ9GC2sluJEtcqzY7u2olpLhwWNjjzZaAUUeiSmmivz+9hY00RMHctoiprgOgZe6LQZoOv4+I4jNnTHhXlTzx8Fw0oR0z+6aNYbmPsQj1YcJSHooHEEAKcn5JYU3T6/htFKGxXFqJUFb0P3FEc2O29VU/PfBYwiFksvmDdQL9Jf
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(36860700004);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2024 22:01:00.6749
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 24dee0e3-db02-4e59-e044-08dc37166b39
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS1PEPF0001708F.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6110

On Mon, 26 Feb 2024, Peng Fan wrote:
> Hi Stefano,
> 
> > Subject: Re: question about virtio-vsock on xen
> > 
> > Hi Peng,
> > 
> > We haven't tried to setup virtio-vsock yet.
> > 
> > In general, I am very supportive of using QEMU for virtio backends. We use
> > QEMU to provide virtio-net, virtio-block, virtio-console and more.
> 
> Would you mind share how to setup virtio-console using qemu + xen?

Vikram (CCed) has been working on it and should be able to share more
details

 
> > However, typically virtio-vsock comes into play for VM-to-VM
> > communication, which is different. Going via QEMU in Dom0 just to have 1
> > VM communicate with another VM is not an ideal design: it adds latency and
> > uses resources in Dom0 when actually we could do without it.
> > 
> > A better model for VM-to-VM communication would be to have the VM talk
> > to each other directly via grant table or pre-shared memory (see the static
> > shared memory feature) or via Xen hypercalls (see Argo.)
> 
> The goal is to make android trout VM run with XEN + i.MX95, so need vsock.

I am not familiar with the details of Android Trout... Where is vsock
used? Just asking for my own understanding.


> > For a good Xen design, I think the virtio-vsock backend would need to be in
> > Xen itself (the hypervisor).
> > 
> > Of course that is more work and it doesn't help you with the specific question
> > you had below :-)
> > 
> > For that, I don't have a pointer to help you but maybe others in CC have.
> > 
> > Cheers,
> > 
> > Stefano
> > 
> > 
> > On Fri, 23 Feb 2024, Peng Fan wrote:
> > > Hi All,
> > >
> > > Has anyone make virtio-vsock on xen work? My dm args as below:
> > >
> > > virtio = [
> > >
> > 'backend=0,type=virtio,device,transport=pci,bdf=05:00.0,backend_type=qem
> > u,grant_usage=true'
> > > ]
> > > device_model_args = [
> > > '-D', '/home/root/qemu_log.txt',
> > > '-d',
> > > 'trace:*vsock*,trace:*vhost*,trace:*virtio*,trace:*pci_update*,trace:*
> > > pci_route*,trace:*handle_ioreq*,trace:*xen*',
> > > '-device',
> > > 'vhost-vsock-pci,iommu_platform=false,id=vhost-vsock-pci0,bus=pcie.0,a
> > > ddr=5.0,guest-cid=3']
> > >
> > > During my test, it always return failure in dom0 kernel in below code:
> > >
> > > vhost_transport_do_send_pkt {
> > > ...
> > >                nbytes = copy_to_iter(hdr, sizeof(*hdr), &iov_iter);
> > >                 if (nbytes != sizeof(*hdr)) {
> > >                         vq_err(vq, "Faulted on copying pkt hdr %x %x %x %px\n",
> > nbytes, sizeof(*hdr),
> > > __builtin_object_size(hdr, 0), &iov_iter);
> > >                         kfree_skb(skb);
> > >                         break;
> > >                 }
> > > }
> > >
> > > I checked copy_to_iter, it is copy data to __user addr, but it never
> > > pass, the copy to __user addr always return 0 bytes copied.
> > >
> > > The asm code "sttr x7, [x6]" will trigger data abort, the kernel will
> > > run into do_page_fault, but lock_mm_and_find_vma report it is
> > > VM_FAULT_BADMAP, that means the __user addr is not mapped, no vma
> > has this addr.
> > >
> > > I am not sure what may cause this. Appreciate if any comments.
> > >
> > > BTW: I tested blk pci, it works, so the virtio pci should work on my setup.
> > >
> > > Thanks,
> > > Peng.
> > >
> 

