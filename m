Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A0386C1B4E
	for <lists+xen-devel@lfdr.de>; Mon, 20 Mar 2023 17:24:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.511999.791529 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1peII3-0008JL-Oe; Mon, 20 Mar 2023 16:23:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 511999.791529; Mon, 20 Mar 2023 16:23:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1peII3-0008Gx-Kx; Mon, 20 Mar 2023 16:23:19 +0000
Received: by outflank-mailman (input) for mailman id 511999;
 Mon, 20 Mar 2023 16:23:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=2oBA=7M=amd.com=Ray.Huang@srs-se1.protection.inumbo.net>)
 id 1peII2-0008Gr-Ej
 for xen-devel@lists.xenproject.org; Mon, 20 Mar 2023 16:23:18 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2062b.outbound.protection.outlook.com
 [2a01:111:f400:fe59::62b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 81ecf0d4-c73b-11ed-b464-930f4c7d94ae;
 Mon, 20 Mar 2023 17:23:13 +0100 (CET)
Received: from DM5PR12MB2504.namprd12.prod.outlook.com (2603:10b6:4:b5::19) by
 BY5PR12MB4116.namprd12.prod.outlook.com (2603:10b6:a03:210::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37; Mon, 20 Mar
 2023 16:23:09 +0000
Received: from DM5PR12MB2504.namprd12.prod.outlook.com
 ([fe80::4f9:60f8:cb12:d022]) by DM5PR12MB2504.namprd12.prod.outlook.com
 ([fe80::4f9:60f8:cb12:d022%3]) with mapi id 15.20.6178.037; Mon, 20 Mar 2023
 16:23:09 +0000
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
X-Inumbo-ID: 81ecf0d4-c73b-11ed-b464-930f4c7d94ae
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nKWmqUsXRj1XPEtckTQnVar6B87oOXhozNWYRICBTC+ElsVNOAIAyo9f1fg7IVgOfjyXtSjJrP4OeiCiqvNBjSVW75K/33t6f4lgzk8TsTLR0ji7JlK1KN3bcrDdiZ1UNvNjZHbXtepiFUXp7ltuAvsoaEGj403NQDJbRBdrlgKedVq/i/vpWfHXTqgR18uvqQYSdwouPCNEI0I7BSuFft2A62BPq0OGtR9MGWWq/BIY9VFcpvr2mXNJIxDHw0jlBC5W01h6xb7hN+3TKCWuSl4VqQRmx4UviRGDAYq2lgqBGbZH5N9n8DnOQxV4vThFzQSoKIVM2wTPF/svmopnwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u7IqRMdvdrS53E+qKt20gbWhWqK6nmmuGlmIxf1ECNo=;
 b=J3+ZAhmkH5/DopQmoBBKGyG90+XqHO9ArpMESOdOUgljC8MUPGLuWZuqXuE3XxWu/zQQKRX4Dfz4kT94RDl/tEhar8qmwrdQUUasOXfj+d6dL0J7sD52mLASfUfBO+BSMvIJ7lmxAJFfm5LHsLEfWvEP9/u1jQadEYxyxTFvWTbe6dqik3wUwrk3mUG7mwwTUMVD5vGQAwS4f9R0r/2PtgMWOw5igdTwLe8AKkPSH6v9WfL4IN6hChS7rfmCLe5JsahV508hTlBvaWkpXzHeTqNHasyTSgb8mI73C1OZpxLDmjagFli9edSjrtQg2c6bqGfrs6p9PH/TPQTLBRnoaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u7IqRMdvdrS53E+qKt20gbWhWqK6nmmuGlmIxf1ECNo=;
 b=ddO9ixaZJKOPUfJCK3xo7eUvT2VCmCPwQtvaNTlWCq9kAPdu9zeT7rU5nrnPSjvltDmyJ414JXSM2tCbowufKv/EUnclOKtykifGh27wfNVg24j38641fCili6I8gTeam1qrDqF75qWZnKTMisXgIiBhueLYYxcy4dveer/20d8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Date: Tue, 21 Mar 2023 00:22:39 +0800
From: Huang Rui <ray.huang@amd.com>
To: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: "Deucher, Alexander" <Alexander.Deucher@amd.com>,
	"Koenig, Christian" <Christian.Koenig@amd.com>,
	"Hildebrand, Stewart" <Stewart.Hildebrand@amd.com>,
	Xenia Ragiadakou <burzalodowa@gmail.com>,
	"Huang, Honglei1" <Honglei1.Huang@amd.com>,
	"Zhang, Julia" <Julia.Zhang@amd.com>,
	"Chen, Jiqian" <Jiqian.Chen@amd.com>
Subject: Re: [RFC XEN PATCH 0/6] Introduce VirtIO GPU and Passthrough GPU
 support on Xen PVH dom0
Message-ID: <ZBiIT+MLZtM6e4Dz@amd.com>
References: <20230312075455.450187-1-ray.huang@amd.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230312075455.450187-1-ray.huang@amd.com>
X-ClientProxiedBy: SG2PR04CA0198.apcprd04.prod.outlook.com
 (2603:1096:4:14::36) To DM5PR12MB2504.namprd12.prod.outlook.com
 (2603:10b6:4:b5::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM5PR12MB2504:EE_|BY5PR12MB4116:EE_
X-MS-Office365-Filtering-Correlation-Id: 67062da5-3483-4c66-0d9b-08db295f646b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	8ivZEaZ6mk9EWSpTP2exO0d94yC2iWRrizHTwp9yBADa9cnwyXwlfYAodXyGD4m0Ak3Pe3mxBIEFA2TMf8B1S/HPfWhxveGCIaG/LbuYn+8euJq46xTbjKpnjg65uDpuUUexe3cCwRmsnR8NJ0U48k06w5YkS/LuxyEV1Cif2wPxQAvroEIoJlrzefgbiqEjKotr3cjTnRAJmlw45WHrVhB/gObqEBGn7iaxRYMdc+oai9jZRqnCCcwaU9+IugoDW3n76uy+UyfywAg5ZomcOMPvFfkraafqvtJ9JkuDShMx6y5qB719ObAWY9eC5ju+fxD5E1T3FqgJqvxkuR27os1J8hbYtwsUDzli/xAISH4j/U6PkEV1LSfhP6toLxyIQSlAVgkeFzmAOg0F10iwAcgn+tpgPR/SsXuM/MZpsUnpXxZkylFa4pHMeJAotzyOoMAZhF5MX0CpfgKZlV1gQe34ztZ/AM1Q4tFU7djIRPp1LzgdssgZlSRjO3qbMeZbvaKD9MFnBwwfKwzQQk+BNrjUD3mYquKOJuNnQ68hMdAApjEuOa9TJKStGV+fLtS+s/+7v3zfqlke8TbrYRrEXU4P+Dytl/ffOzSThLtlv1jxSTo4kMxr1yaHLVnN9NbW4p6JermuwR+3SpOIlMJFaCknq7Qvzyja7Xv7Q4zXxFnt9eSPxIek+YZgsz8Z3QxU1cR+khERHrwfRUYiMJS6i3WcWWsDmL5QrNIh+L3Y2YtY2UyyV3pXMhj3nQR8i9Fd
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM5PR12MB2504.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(39860400002)(136003)(366004)(376002)(346002)(396003)(451199018)(38100700002)(66574015)(86362001)(54906003)(110136005)(316002)(5660300002)(36756003)(66946007)(66556008)(4326008)(8936002)(8676002)(41300700001)(66476007)(478600001)(2906002)(83380400001)(6666004)(2616005)(186003)(6506007)(6512007)(26005)(966005)(6486002)(5930299012)(67856001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?JNh1nHt1e3inuGKyeKUkkkBrcQOiDUx9ewIUT9rN4B8q2lZPiBPmZkmkLkEA?=
 =?us-ascii?Q?n2tD3KwvBM3BaNDCwFHuX2L1JyWs6B+hkywfVo9CPoQ9osPpOYVWL/1Lny7B?=
 =?us-ascii?Q?kTFoU2s3umLE64RsnJdXqkbJ6ph/tVDSRojOdX3EvOqem1Iscco7o0GwNkOX?=
 =?us-ascii?Q?TVmURacsgg3xWPfjH/30jryfu9T20vq5L9JbSSxLLn/2LWlW9ssgc0zSfdFj?=
 =?us-ascii?Q?KxroX3bBtdtHdeWtuflzzV9K+vrzXgjRYh7NpdLXRMTTl5PKJML0Hs9EMcgl?=
 =?us-ascii?Q?jAeFfXNu2/3yDttKIAlCHYZyAJQVVZ8kfF8Fc2Bm3rh40otCOZNattABSCmM?=
 =?us-ascii?Q?CQnMP8vscKIBt7yDkD9QWyaet6StvnxXmUPOb5uSIUaprHi8wtkN/Gv2kXbW?=
 =?us-ascii?Q?+xqW7p4g+LLrT38Cu3kfQgdrqNxB+5jY2pUcVLeF0yxUHRrzqU+BVvJdBJfA?=
 =?us-ascii?Q?q5xWJtGcIZd5NSmAjH56xZACArLHONOR+ELEbu9WAWkz+mIzmdcIs+BsB0Vu?=
 =?us-ascii?Q?hEqbYwf1E7/kC0ArcqxpYG0km3XT4L8AC9UU7KJQ/kuMQ3DmF1KxY49Jb6jo?=
 =?us-ascii?Q?MLmzGpzk78ZCPkgW0fpCPef4ztiAHXzr40mpevGw6bc0Rgmfv9xkHfmFykGr?=
 =?us-ascii?Q?ErHztvPxhoGHHf3JhOjL7C4m/xeJPNlMCJO4i57cNPPOxwJysMbMPBCmSZzT?=
 =?us-ascii?Q?YgaenpODdST9IwLKi8M7Hq5OQwL54VAMq4kMXOT/UMjS4rL9LU+1Nl/M8BoZ?=
 =?us-ascii?Q?0cZo38w6X5K6pvc5E7GVwsGHb+Cip77acPLcQJo6GwGNRHJqw6fpC4pReJh6?=
 =?us-ascii?Q?5hHtfCWSrr+43XFe8KXZCUxU6eIRAo92ld6BDiJKh0WZelF4Lxl8k0SZPIh4?=
 =?us-ascii?Q?oQwr67Mw6nYYYckegdNF4tToMnp9IGQdKJWXqyTWmlf1fC0MoH70UE+lwd4x?=
 =?us-ascii?Q?LyjhG+L3SchWCvdCZHwtwGPcDy/gXCxKajDKEcjRoXQTVzHP4dAHNzr4EUv8?=
 =?us-ascii?Q?RGb7ZqgAAL86rXYK9dq2Qz5uWdFLilrxqaQG4xqnjCQ7w8lYny/8xsYd23lA?=
 =?us-ascii?Q?B8rqzenqSItxptQAFIYaNn9FI/WdSKSfF6HOkZPShbXz0QpOgsN3kxXvLvT2?=
 =?us-ascii?Q?x8AybMEEFQxZamhkwyeEpibT+D87PNfjsNSeUqIlzdHj9ADLhpxUUqd73mXu?=
 =?us-ascii?Q?Xf9d9wV8x6fh0cmXtOGZ2Gaqz6DtGQ/NjxzHS6flyy++v509hlzMD/Q7h6WX?=
 =?us-ascii?Q?bM/11bkU5FiPKwlGGBIAMZ7Cn1zkFn2d+01llatiWF0ltdfJCCgkrIlSdtIJ?=
 =?us-ascii?Q?ysth2+LI7detTRZwLJ+E3wSJepFrudKHw7b4oJNZMS2Ba5psfhwfVHYJXkjm?=
 =?us-ascii?Q?MUfzwvY1db/bKrgGEhdU6zfZw09qY4APkpsRzK3GH94Ou4Zl5sqOkxPNhbpV?=
 =?us-ascii?Q?E0CKRMMUXZOmH9bEcONzewY0E1qCWebgB8fwAaF/ua7ASwKDupJnoGtQPw6J?=
 =?us-ascii?Q?mg+i0zsFhsfkWsAJsuWCPme7Pp+jRvSnSl9IWwPmQTX/7kRGh78rZkVePcQ9?=
 =?us-ascii?Q?EMs2dg9VNyDtLlihW+rMLabrjGdf/7JnOla0njas?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 67062da5-3483-4c66-0d9b-08db295f646b
X-MS-Exchange-CrossTenant-AuthSource: DM5PR12MB2504.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Mar 2023 16:23:08.8457
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: d1bntQwEggA8LB58QY3rbo4etMAY1IP3YTL+GLh8DSvTjGzEQZ6LW31zCr6BBi5OYVx6KO3heA/JD13hujAD+g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4116

Hi Jan, Roger, Stefano, Andrew,

Sorry to late response, I was fully occupied by another problem last week.
And I will give the reply one by one in the mail tomorrow. Thanks for your
patience. :-)

Thanks,
Ray

On Sun, Mar 12, 2023 at 03:54:49PM +0800, Huang, Ray wrote:
> Hi all,
> 
> In graphic world, the 3D applications/games are runing based on open
> graphic libraries such as OpenGL and Vulkan. Mesa is the Linux
> implemenatation of OpenGL and Vulkan for multiple hardware platforms.
> Because the graphic libraries would like to have the GPU hardware
> acceleration. In virtualization world, virtio-gpu and passthrough-gpu are
> two of gpu virtualization technologies.
> 
> Current Xen only supports OpenGL (virgl:
> https://docs.mesa3d.org/drivers/virgl.html) for virtio-gpu and passthrough
> gpu based on PV dom0 for x86 platform. Today, we would like to introduce
> Vulkan (venus: https://docs.mesa3d.org/drivers/venus.html) and another
> OpenGL on Vulkan (zink: https://docs.mesa3d.org/drivers/zink.html) support
> for VirtIO GPU on Xen. These functions are supported on KVM at this moment,
> but so far, they are not supported on Xen. And we also introduce the PCIe
> passthrough (GPU) function based on PVH dom0 for AMD x86 platform.
> 
> These supports required multiple repositories changes on kernel, xen, qemu,
> mesa, and virglrenderer. Please check below branches:
> 
> Kernel: https://git.kernel.org/pub/scm/linux/kernel/git/rui/linux.git/log/?h=upstream-fox-xen
> Xen: https://gitlab.com/huangrui123/xen/-/commits/upstream-for-xen
> QEMU: https://gitlab.com/huangrui123/qemu/-/commits/upstream-for-xen
> Mesa: https://gitlab.freedesktop.org/rui/mesa/-/commits/upstream-for-xen
> Virglrenderer: https://gitlab.freedesktop.org/rui/virglrenderer/-/commits/upstream-for-xen
> 
> In xen part, we mainly add the PCIe passthrough support on PVH dom0. It's
> using the QEMU to passthrough the GPU device into guest HVM domU. And
> mainly work is to transfer the interrupt by using gsi, vector, and pirq.
> 
> Below are the screenshot of these functions, please take a look.
> 
> Venus:
> https://drive.google.com/file/d/1_lPq6DMwHu1JQv7LUUVRx31dBj0HJYcL/view?usp=share_link
> 
> Zink:
> https://drive.google.com/file/d/1FxLmKu6X7uJOxx1ZzwOm1yA6IL5WMGzd/view?usp=share_link
> 
> Passthrough GPU:
> https://drive.google.com/file/d/17onr5gvDK8KM_LniHTSQEI2hGJZlI09L/view?usp=share_link
> 
> We are working to write the documentation that describe how to verify these
> functions in the xen wiki page. And will update it in the future version.
> 
> Thanks,
> Ray
> 
> Chen Jiqian (5):
>   vpci: accept BAR writes if dom0 is PVH
>   x86/pvh: shouldn't check pirq flag when map pirq in PVH
>   x86/pvh: PVH dom0 also need PHYSDEVOP_setup_gsi call
>   tools/libs/call: add linux os call to get gsi from irq
>   tools/libs/light: pci: translate irq to gsi
> 
> Roger Pau Monne (1):
>   x86/pvh: report ACPI VFCT table to dom0 if present
> 
>  tools/include/xen-sys/Linux/privcmd.h |  7 +++++++
>  tools/include/xencall.h               |  2 ++
>  tools/include/xenctrl.h               |  2 ++
>  tools/libs/call/core.c                |  5 +++++
>  tools/libs/call/libxencall.map        |  2 ++
>  tools/libs/call/linux.c               | 14 ++++++++++++++
>  tools/libs/call/private.h             |  9 +++++++++
>  tools/libs/ctrl/xc_physdev.c          |  4 ++++
>  tools/libs/light/libxl_pci.c          |  1 +
>  xen/arch/x86/hvm/dom0_build.c         |  1 +
>  xen/arch/x86/hvm/hypercall.c          |  3 +--
>  xen/drivers/vpci/header.c             |  2 +-
>  xen/include/acpi/actbl3.h             |  1 +
>  13 files changed, 50 insertions(+), 3 deletions(-)
> 
> -- 
> 2.25.1
> 

