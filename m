Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E8C7861F31
	for <lists+xen-devel@lfdr.de>; Fri, 23 Feb 2024 22:43:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.684939.1065210 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rddJH-00085u-6F; Fri, 23 Feb 2024 21:42:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 684939.1065210; Fri, 23 Feb 2024 21:42:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rddJH-00084N-3R; Fri, 23 Feb 2024 21:42:23 +0000
Received: by outflank-mailman (input) for mailman id 684939;
 Fri, 23 Feb 2024 21:42:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nQMd=KA=amd.com=stefano.stabellini@srs-se1.protection.inumbo.net>)
 id 1rddJF-00084H-JD
 for xen-devel@lists.xenproject.org; Fri, 23 Feb 2024 21:42:21 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on20600.outbound.protection.outlook.com
 [2a01:111:f403:2415::600])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 696cbbfa-d294-11ee-98f5-efadbce2ee36;
 Fri, 23 Feb 2024 22:42:17 +0100 (CET)
Received: from BN9PR03CA0278.namprd03.prod.outlook.com (2603:10b6:408:f5::13)
 by BY5PR12MB4276.namprd12.prod.outlook.com (2603:10b6:a03:20f::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7316.24; Fri, 23 Feb
 2024 21:42:13 +0000
Received: from BN3PEPF0000B071.namprd04.prod.outlook.com
 (2603:10b6:408:f5:cafe::1b) by BN9PR03CA0278.outlook.office365.com
 (2603:10b6:408:f5::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.43 via Frontend
 Transport; Fri, 23 Feb 2024 21:42:12 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BN3PEPF0000B071.mail.protection.outlook.com (10.167.243.116) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7292.25 via Frontend Transport; Fri, 23 Feb 2024 21:42:12 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Fri, 23 Feb
 2024 15:42:12 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Fri, 23 Feb
 2024 15:42:11 -0600
Received: from ubuntu-20.04.2-arm64.shared (10.180.168.240) by
 SATLEXMB03.amd.com (10.181.40.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 23 Feb 2024 15:42:11 -0600
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
X-Inumbo-ID: 696cbbfa-d294-11ee-98f5-efadbce2ee36
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eS3C1nnct3mCy8hPMmX3wP0s1xMLiiSyYqjCBLByd6gqLvQvDg+V0eJfiuCo2SLxBLclhnz611obQduXayW+EmE4yJCmX0YwJN7BsCmGlxyiKseC7WvF2OjKwsC/tW57RPpVsAWV/uu3y+vsiI7XEknjYujLpMUu34KThKmnxaBeak/MpwexXTjlLm3VkfpnPE8ZT+qYhI57i4suHI3uu0tTPK270EUscoNVe9Sh+g18UQbENG/eZQS4KJ+nUcOzbSmoqv+D8f15+lAz+Gas4vnuhJp//J73+mxn3ZlGE00xLphARHdNtVL4FTwd/8brI/WDhNf7qja3Al1OxNGKeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=brzpYEEybsreMV1sY2Ki8Ly4xbWrIx5anpAufpPOS70=;
 b=hz5hSs4Fc+w4dkQ1bQG58729PRwycpd+d5IgzPSHS2c/rwXYnnwZoMdnDDsf79HiFPhW8E/UDkIQpTPtjHzGSY7dtGWgLFvT0fxLxI88kPrWh5VQaIzkIMtIlp9HBJO0kCtRufrfdzv5250aNCgP86uJ/pzZdSJkwrhlW84o6WoDrMgegomPVHt0CRr+gVSpgOB7hZEyxZJFo+5JKyANNZA1qfwNHt7S0RpiaDjsqr69Ua13LgC0CyH78r8cudMcHIQEL6xvo+JS4eaTmgmh/weZhH/o9XuMPRfwcfLE4rE/HD/BdTnsLcIewxUSJGwNflSD9Linq83STl9DoxLEfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=nxp.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=brzpYEEybsreMV1sY2Ki8Ly4xbWrIx5anpAufpPOS70=;
 b=G7sYzAF1EgEbPw2om+LQznZPBkgksvx32rhOeLP4efnHKtPTPMGcfxLvvEx23hUADRWbRNJOGr00GX4GNjUrKQFoNTknwmPw3SIu97NBYAgwMKnCvgc83EXm7bggjRFE+pJZrdkY3bt3ql3e+AC3HyFqBuhPEdQgV6iOaQWYHMs=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Date: Fri, 23 Feb 2024 13:42:10 -0800
From: Stefano Stabellini <stefano.stabellini@amd.com>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Peng Fan <peng.fan@nxp.com>
CC: "stefano.stabellini@amd.com" <stefano.stabellini@amd.com>, Julien Grall
	<julien@xen.org>, "vikram.garhwal@amd.com" <vikram.garhwal@amd.com>,
	"oleksandr_tyshchenko@epam.com" <oleksandr_tyshchenko@epam.com>, Leo Yan
	<leo.yan@linaro.org>, Viresh Kumar <viresh.kumar@linaro.org>,
	"stewart.hildebrand@amd.com" <stewart.hildebrand@amd.com>,
	"sgarzare@redhat.com" <sgarzare@redhat.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: Re: question about virtio-vsock on xen
In-Reply-To: <DU0PR04MB941734DA793D87B7FF3A491488552@DU0PR04MB9417.eurprd04.prod.outlook.com>
Message-ID: <alpine.DEB.2.22.394.2402231332580.754277@ubuntu-linux-20-04-desktop>
References: <DU0PR04MB941734DA793D87B7FF3A491488552@DU0PR04MB9417.eurprd04.prod.outlook.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: None (SATLEXMB05.amd.com: stefano.stabellini@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B071:EE_|BY5PR12MB4276:EE_
X-MS-Office365-Filtering-Correlation-Id: 157e3131-6f19-4f45-9ace-08dc34b84b7f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	kO+V4s9OdN91nn/QK39thiS8VYDf5mwOL4PA6U9vPHwLaYOmY+HNZlD3jSHddezGEyNKtQ+oZAqlOIidwiYr5asAKWG0wgYI6/XzzrNhVVYC3pfPknYMBrsw/Q4LPKnU+gH07wM7g/ozryMn47d9bhgt0V4RgNKkYbjk6eboMza88cvxmv0Y8ngr5eUV8HfZmbu2Pl294O9uuAM4r98aYxDvF/tY9ecezsW4CkVCEZ9aoMWvaoxgTQc8d80qMbWnGakjGF8T10BkPtiGBt7eGcny9ZUNwYu7nLya7RFvWi+Gw8n9wDBgdgO22ZNp7UJY2FFc3XT+dWgiOoujatmovkuAU50e2UGK1sfTkSeAk4w8AazwYqq6uwhPw1UeK6ItfI1qVCgZME74XknXZSodCNnzGfbmkm6IxhBtDyMaYAvE2kG+UnDgL0m1rmviWHIhENm7lBpBP27xd2qwwUonBL34C74f9KQOnzn2J7UoMNv4/aU6pssIphI/sxkc3Zc4b1k6/53SbxyQ8CJkGKIkbpEqDpAuoW9Kc2fDO9LBl5viWMH+LooT6gGw6x/bUZcUQdf+zZnZ5vMZyYMxafomBcFWO2rp/Vr9mgQ9e5SNqGgWgv2Zdo38tpylS5u/8P4AvMlHJLBVHT2qwAqDv8ygKQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(36860700004)(40470700004)(46966006);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Feb 2024 21:42:12.4736
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 157e3131-6f19-4f45-9ace-08dc34b84b7f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF0000B071.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4276

Hi Peng,

We haven't tried to setup virtio-vsock yet.

In general, I am very supportive of using QEMU for virtio backends. We
use QEMU to provide virtio-net, virtio-block, virtio-console and more.

However, typically virtio-vsock comes into play for VM-to-VM
communication, which is different. Going via QEMU in Dom0 just to have 1
VM communicate with another VM is not an ideal design: it adds latency
and uses resources in Dom0 when actually we could do without it.

A better model for VM-to-VM communication would be to have the VM talk
to each other directly via grant table or pre-shared memory (see the
static shared memory feature) or via Xen hypercalls (see Argo.)

For a good Xen design, I think the virtio-vsock backend would need to be
in Xen itself (the hypervisor).

Of course that is more work and it doesn't help you with the specific
question you had below :-)

For that, I don't have a pointer to help you but maybe others in CC
have.

Cheers,

Stefano


On Fri, 23 Feb 2024, Peng Fan wrote:
> Hi All,
> 
> Has anyone make virtio-vsock on xen work? My dm args as below:
> 
> virtio = [
> 'backend=0,type=virtio,device,transport=pci,bdf=05:00.0,backend_type=qemu,grant_usage=true'
> ]
> device_model_args = [
> '-D', '/home/root/qemu_log.txt',
> '-d', 'trace:*vsock*,trace:*vhost*,trace:*virtio*,trace:*pci_update*,trace:*pci_route*,trace:*handle_ioreq*,trace:*xen*',
> '-device', 'vhost-vsock-pci,iommu_platform=false,id=vhost-vsock-pci0,bus=pcie.0,addr=5.0,guest-cid=3']
> 
> During my test, it always return failure in dom0 kernel in below code:
> 
> vhost_transport_do_send_pkt {
> ...
>                nbytes = copy_to_iter(hdr, sizeof(*hdr), &iov_iter);                                
>                 if (nbytes != sizeof(*hdr)) {                                                       
>                         vq_err(vq, "Faulted on copying pkt hdr %x %x %x %px\n", nbytes, sizeof(*hdr),                        
> __builtin_object_size(hdr, 0), &iov_iter);
>                         kfree_skb(skb);                                                             
>                         break;                                                                      
>                 }  
> }
> 
> I checked copy_to_iter, it is copy data to __user addr, but it never pass, 
> the copy to __user addr always return 0 bytes copied.
> 
> The asm code "sttr x7, [x6]" will trigger data abort, the kernel will run
> into do_page_fault, but lock_mm_and_find_vma report it is VM_FAULT_BADMAP,
> that means the __user addr is not mapped, no vma has this addr.
> 
> I am not sure what may cause this. Appreciate if any comments.
> 
> BTW: I tested blk pci, it works, so the virtio pci should work on my setup.
> 
> Thanks,
> Peng.
> 

