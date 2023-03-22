Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 886B16C4419
	for <lists+xen-devel@lfdr.de>; Wed, 22 Mar 2023 08:30:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.513115.793643 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pesud-0002cA-2s; Wed, 22 Mar 2023 07:29:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 513115.793643; Wed, 22 Mar 2023 07:29:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pesuc-0002Ym-W9; Wed, 22 Mar 2023 07:29:34 +0000
Received: by outflank-mailman (input) for mailman id 513115;
 Wed, 22 Mar 2023 07:29:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=pl0Y=7O=amd.com=Ray.Huang@srs-se1.protection.inumbo.net>)
 id 1pesua-0002YX-V3
 for xen-devel@lists.xenproject.org; Wed, 22 Mar 2023 07:29:33 +0000
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on20616.outbound.protection.outlook.com
 [2a01:111:f400:7e83::616])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 475ea007-c883-11ed-b464-930f4c7d94ae;
 Wed, 22 Mar 2023 08:29:30 +0100 (CET)
Received: from DM5PR12MB2504.namprd12.prod.outlook.com (2603:10b6:4:b5::19) by
 SA3PR12MB7879.namprd12.prod.outlook.com (2603:10b6:806:306::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6178.37; Wed, 22 Mar 2023 07:29:25 +0000
Received: from DM5PR12MB2504.namprd12.prod.outlook.com
 ([fe80::4f9:60f8:cb12:d022]) by DM5PR12MB2504.namprd12.prod.outlook.com
 ([fe80::4f9:60f8:cb12:d022%3]) with mapi id 15.20.6178.037; Wed, 22 Mar 2023
 07:29:25 +0000
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
X-Inumbo-ID: 475ea007-c883-11ed-b464-930f4c7d94ae
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kQcNTCvG4of6X23xWN+J/uXB5DKvgUzOAvSY8KiqStQXTy8zP3hlUQJedxb7q/PLuis03dB1ibuoWLBVo+/lE0xP1BAXWDF8bF4ovAp0+Gqwh470WhGZyB3D6ibErRdpW8BAgdWDHqAInzhAPy4E+a4ppqMwv1zgf1h7pYpoyqxt1ISJntgbe+efvSRHYKt2XylngCKKQNLMiKsGcitW6wCPN7qF1m014qwLOr7LDyfUTyU2GMVZF2LQXYdagd/XNv/C7C9S68UGkTBrvTVPEbQViairqURLjukyGhB1oaqU/QRTVEe2Gurfmw+Fx4G5YEo+W5pKuoPpfDgeHeKBLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6E98sY3omzEpwiKLXUq5L2DY1IcaLnLCIrWhwbWnvt8=;
 b=MDH8GPh0P0pwchE+BeQ/EkVFNT3w2EwyjNMWXTxCMTbm+hEpXYd5X+0UvrFKkqeeTpqMLRvCgktc8wsIfnkYkcFFCMU4G8VoIQE9q920zS6xZRqvb5V5gynTpuPygnk3MnwY3Q6dKvyDbPWlmbcrcqRKelUytVBS2Axr3DWhAxyjR2BurZcejiqnuwZTVkCBS9VbXeIYfe5hD5hdV+u4Jbs7vk9AWI/aj0eFQ5wbrfmdQ4PJnmatLWfFBFoS77Xj2BSk1CdfGznv9M0XmegRDUmQ9J8gaWUMzzxuOh23+EDAj7L9lQ4PEW23bgIqlTVSmi2x9I63iv4Xlhbi5UCjsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6E98sY3omzEpwiKLXUq5L2DY1IcaLnLCIrWhwbWnvt8=;
 b=J+7ch7r0dYI0HzfTuRnsda6I7Fusg1ezTxz9Mjoj+RMQRLTjcqI1DXL8UxlvufAw4yh+cWZaQuJLt1fHrDFKc45y0/JP0GBDf1l6JgrEbrEiLG3UHNte9JTBWU5ipnDShMmwTB54jwnwNIQ1aBQ5ANrjMdWwGmqsSoRi+gKmZxQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Date: Wed, 22 Mar 2023 15:28:58 +0800
From: Huang Rui <ray.huang@amd.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "Deucher, Alexander" <Alexander.Deucher@amd.com>,
	"Koenig, Christian" <Christian.Koenig@amd.com>,
	"Hildebrand, Stewart" <Stewart.Hildebrand@amd.com>,
	Xenia Ragiadakou <burzalodowa@gmail.com>,
	"Huang, Honglei1" <Honglei1.Huang@amd.com>,
	"Zhang, Julia" <Julia.Zhang@amd.com>,
	"Chen, Jiqian" <Jiqian.Chen@amd.com>,
	Roger Pau =?utf-8?B?TW9ubu+/vQ==?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [RFC XEN PATCH 2/6] vpci: accept BAR writes if dom0 is PVH
Message-ID: <ZBquOn8x7IyI33Pj@amd.com>
References: <20230312075455.450187-1-ray.huang@amd.com>
 <20230312075455.450187-3-ray.huang@amd.com>
 <8adfeb57-1ddd-255d-6d93-24a74b463f59@suse.com>
 <ZBl6iU6T1CsWqVx9@amd.com>
 <ace92506-fd86-9da4-aeb2-37a80094d02a@suse.com>
 <ZBmDl8XjIos57EIy@amd.com>
 <cae4e673-65d8-273b-66b8-08d374797da2@suse.com>
 <ZBmZxnyZWrni57Ry@amd.com>
 <f5634fb6-fd41-6d42-603a-4df69adb929a@suse.com>
 <ZBmrI3wrrwsK5Q+0@amd.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZBmrI3wrrwsK5Q+0@amd.com>
X-ClientProxiedBy: SI2PR02CA0042.apcprd02.prod.outlook.com
 (2603:1096:4:196::19) To DM5PR12MB2504.namprd12.prod.outlook.com
 (2603:10b6:4:b5::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM5PR12MB2504:EE_|SA3PR12MB7879:EE_
X-MS-Office365-Filtering-Correlation-Id: 26b7a22c-e824-47d4-d230-08db2aa729e6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	sQutX75z2i6c3P/ywjVWPhHK35TjJZrwu/3BbFMu0njqIxV1mtMbnIudiPMKPk95bAeRvlarm3IqC3KM6OjUWodKZACQz6lrnL3RHgJBkvrKC5iTeJT8VjcaNLgRVTgfTZ7ak/2O4/iaC9KQjeFFRy6kYBTE3NWCuyPS5kg2g5E2nALEZlkHTDLwuuHqwIfpHs9Hn1owpOmHTfQrGhxlnmvxw8od/ZjWeD3S8XEVKTkWOlCe4M6NXa5ZdJCNh3bgt3mDNQo8BvwDPTrB7jrbpGqP3m6gwKTDVVE3O0vu6TCQGLwRPz5bFbk1Ig058nQsD+gfDSAH92KVqkrPTpZTmqIEPJ1GYgS1H3skY8H23PtDgsoo2Asq5ybLFowgvqiF1FFZB/nqc7fF82Q74nOp/Fr+a7nkAJPIBP9OLbDutIx+0FqEluFf70biDC+6QSHUBENJ/rqbTeuNCFjGi1qKmg3Hb3338vtj3fHcn466IXnVJVuDpWNr6fDDlWtCBiHI5xZz5MrQvvPWBlF/AXr+peqR1Jh7ljV0as8ku1KBngFK4PQXMqp82uACgTP7Jq1yqyzkOTEDMM9ZjUe+o1o9Jwdn0XOtbbI/02ivCQcbuE14c0PZAhHQps1YivSxTrcdPnmOHz1eQckymqWTmukWkw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM5PR12MB2504.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(396003)(376002)(39860400002)(136003)(366004)(346002)(451199018)(38100700002)(86362001)(26005)(36756003)(41300700001)(4326008)(66556008)(6512007)(6916009)(8676002)(5660300002)(8936002)(66476007)(2906002)(66946007)(478600001)(6486002)(186003)(2616005)(83380400001)(316002)(6666004)(54906003)(6506007)(53546011);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?dXC9i6WFPcOFW51pJiDwYRFsPwkrEjwSyfzoz78SRhMhHJmkQ440+ewghBhl?=
 =?us-ascii?Q?dXj+vkXWGxdKQEv74m3zO+EVzXgOWuPAWHepLje8LZP0o0ceMDjFmGnLB/lW?=
 =?us-ascii?Q?xprQq9ZALCq9QQglHWxL8W6o7jbVDwZppu+MUTuWCALLLYcGSKyjmrBKah9c?=
 =?us-ascii?Q?+bN1hRXuqVNsNEdv0mESovOz0s/hdvZAsv8uvN8/Epu2e1iQZgW1qBsBLrB1?=
 =?us-ascii?Q?3FXIi86jpmyyfaUIRkuFVjkTTUxUaNDMPXq/yor7455PUZA4+VK0TJbp1l1v?=
 =?us-ascii?Q?GY7Gl7E35N0ldexGigWq0cz1YF7c445ZJ+Z71nwT/Mbocs27X9UPzpWtyMpV?=
 =?us-ascii?Q?zV1tbWEeVljIyH7OXcPjiDzPO6JRpPikoMN+SaVTq4/jiglL4KgspNtfiSmE?=
 =?us-ascii?Q?inKMczEXN/Pnla/qklX2rSO28cQKB5dnLaFgh+hpjdSJJSriUKM1TTuq+39y?=
 =?us-ascii?Q?HdX/qlgD12Xvo+YTwfuSDdDNIlq7Itp24K6aP2LZ6OJblxb6zm8IG5ekS1iS?=
 =?us-ascii?Q?UWIEbyD8co4jvRJUIme3gbW5sa/P7kLCCh6vvaqcKSiv/4WGtrY+1HPhz70G?=
 =?us-ascii?Q?Ic1emjDhpFLI8h4OujFvTXiwoEUI3xEWkkIgU+YdqCkQLDLO9WLxvaUxMIvJ?=
 =?us-ascii?Q?BMR57KyCee4adkvJUxY6Bu8/hf8Xzou7yOYrnz6ZfmbAAQR0PWumINYAQfeB?=
 =?us-ascii?Q?mPGWpqUshfzmU5kxOh/RnNbEkRHST57RbB5qS7AnCVEp7f7RdTNm7AcPHSad?=
 =?us-ascii?Q?vTu80QH6GGtUZmSfSC7qFB5+zyybFNYz/ptp1gHancQ8DzFdyi3UwAly7jpC?=
 =?us-ascii?Q?W1Owp12vu3Aa2li7BuU+ux6h6Q489s6rmD/Wtu8fQTui6WXBUTftEfdp3hd0?=
 =?us-ascii?Q?HZ2cRBxrSM2oBq65bH16KeGYo++CRlXVOO/vTSUCvnus1yUb0IVtBxBYXMbh?=
 =?us-ascii?Q?sQqRFKrPtRUKSzCbIFD/+4zKDUJuYSgrjJ5g5y9YShCKJX9m9L3hjW0mf7d3?=
 =?us-ascii?Q?bw4yaXxzBPkXbk7+gsgXSbmQpUw02fJP7HJMO/yJa+VqW0afsPmg5OHP1PNy?=
 =?us-ascii?Q?l1OqXDHLQnmFyd7bjYh0WU39rKrHVO/YaKGh0D8Up5Il0fWrxCrZHIWbXl2B?=
 =?us-ascii?Q?f0Xgse8KEveu/H08jBNKPcL+N6PoV4fxtXbq9RQCU90tJEVlEgEfwSyperKp?=
 =?us-ascii?Q?cix0Mf5NgHLHQJ/g6HW137yckStKeDbH8BIop0Ixd+VDtYfmW0iprdx73W5l?=
 =?us-ascii?Q?+VOTanpfa8pany5rJA2d3qAl/ols6d9WnEBZqP2K7TCOC2tyIvtnIWt41aoD?=
 =?us-ascii?Q?owG0mZf8q3MjvVgHMpko9IFiZRReDO65RaQwQHk9Uklfz6T9V73Q1l1SbzLv?=
 =?us-ascii?Q?8eE7OtypW9QLahVfOoKzn6oRVI1LH7l2MEbfCqjaUubCs75dWU6qwe1CqTYv?=
 =?us-ascii?Q?4Ow4rbdMBDSrAV472u26fpsJuob1DZON5X3uf8YA384l2wSf6xtKYMD/BwEA?=
 =?us-ascii?Q?XIBLRPOQZbAcMbVwbYFF37aLlK1rk2egqwqNHPWbS3SCwsfeLn+ekDSmxUfv?=
 =?us-ascii?Q?xAESVDgadzVRkd0ryaj6lNorgYyS0EtCUBt1qZJr?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 26b7a22c-e824-47d4-d230-08db2aa729e6
X-MS-Exchange-CrossTenant-AuthSource: DM5PR12MB2504.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Mar 2023 07:29:25.6142
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9frEEaxbIhXrJ/pOZtYqKnaqHcVlrrfaOwStcBMe8rrEj4Tn2kLr3ubTylVTlwejcsB6+R+G0UVXijG4PYn4Lw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB7879

On Tue, Mar 21, 2023 at 09:03:58PM +0800, Huang Rui wrote:
> On Tue, Mar 21, 2023 at 08:27:21PM +0800, Jan Beulich wrote:
> > On 21.03.2023 12:49, Huang Rui wrote:
> > > Thanks, but we found if dom0 is PV domain, the passthrough device will
> > > access this function to write the real bar.
> > 
> > Can you please be quite a bit more detailed about this? The specific code
> > paths taken (in upstream software) to result in such would of of interest.
> > 
> 
> yes, please wait for a moment. let me capture a trace dump in my side.
> 

Sorry, we are wrong that if Xen PV dom0, bar_write() won't be called,
please ignore above information.

While xen is on initialization on PVH dom0, it will add all PCI devices in
the real bus including 0000:03:00.0 (VGA device: GPU) and 0000:03:00.1
(Audio device).

Audio is another function in the pcie device, but we won't use it here. So
we will remove it after that.

Please see below xl dmesg:

(XEN) PCI add device 0000:03:00.0
(XEN) d0v0 bar_write Ray line 391 0000:03:00.1 bar->enabled 0
(XEN) d0v0 bar_write Ray line 406 0000:03:00.1 bar->enabled 0
(XEN) d0v0 bar_write Ray line 391 0000:03:00.1 bar->enabled 0
(XEN) d0v0 bar_write Ray line 406 0000:03:00.1 bar->enabled 0
(XEN) PCI add device 0000:03:00.1
(XEN) d0v0 bar_write Ray line 391 0000:04:00.0 bar->enabled 0
(XEN) d0v0 bar_write Ray line 406 0000:04:00.0 bar->enabled 0
(XEN) d0v0 bar_write Ray line 391 0000:04:00.0 bar->enabled 0
(XEN) d0v0 bar_write Ray line 406 0000:04:00.0 bar->enabled 0
(XEN) d0v0 bar_write Ray line 391 0000:04:00.0 bar->enabled 0
(XEN) d0v0 bar_write Ray line 406 0000:04:00.0 bar->enabled 0
(XEN) d0v0 bar_write Ray line 391 0000:04:00.0 bar->enabled 0
(XEN) d0v0 bar_write Ray line 406 0000:04:00.0 bar->enabled 0
(XEN) d0v0 bar_write Ray line 391 0000:04:00.0 bar->enabled 0
(XEN) d0v0 bar_write Ray line 406 0000:04:00.0 bar->enabled 0
(XEN) d0v0 bar_write Ray line 391 0000:04:00.0 bar->enabled 0
(XEN) d0v0 bar_write Ray line 406 0000:04:00.0 bar->enabled 0
(XEN) d0v0 bar_write Ray line 391 0000:04:00.0 bar->enabled 0
(XEN) d0v0 bar_write Ray line 406 0000:04:00.0 bar->enabled 0
(XEN) d0v0 bar_write Ray line 391 0000:04:00.0 bar->enabled 0
(XEN) d0v0 bar_write Ray line 406 0000:04:00.0 bar->enabled 0
(XEN) PCI add device 0000:04:00.0

...

(XEN) PCI add device 0000:07:00.7
(XEN) arch/x86/hvm/svm/svm.c:2017:d0v0 RDMSR 0xc0010058 unimplemented
(XEN) arch/x86/hvm/svm/svm.c:2017:d0v0 RDMSR 0xc0011020 unimplemented
(XEN) PCI remove device 0000:03:00.1

We run below script to remove audio

echo -n "1" > /sys/bus/pci/devices/0000:03:00.1/remove

(XEN) arch/x86/hvm/svm/svm.c:2017:d0v0 RDMSR 0xc001029b unimplemented
(XEN) arch/x86/hvm/svm/svm.c:2017:d0v0 RDMSR 0xc001029a unimplemented

Then we will run "xl pci-assignable-add 03:00.0" to assign GPU as
passthrough. At this moment, the real bar is trying to be written.

(XEN) d0v7 bar_write Ray line 391 0000:03:00.0 bar->enabled 1
(XEN) d0v7 bar_write Ray line 406 0000:03:00.0 bar->enabled 1
(XEN) Xen WARN at drivers/vpci/header.c:408
(XEN) ----[ Xen-4.18-unstable  x86_64  debug=y  Not tainted ]----
(XEN) CPU:    8
(XEN) RIP:    e008:[<ffff82d040263cb9>] drivers/vpci/header.c#bar_write+0xc0/0x1ce
(XEN) RFLAGS: 0000000000010202   CONTEXT: hypervisor (d0v7)
(XEN) rax: ffff8303fc36d06c   rbx: ffff8303f90468b0   rcx: 0000000000000010
(XEN) rdx: 0000000000000002   rsi: ffff8303fc36a020   rdi: ffff8303fc36a018
(XEN) rbp: ffff8303fc367c18   rsp: ffff8303fc367be8   r8:  0000000000000001
(XEN) r9:  ffff8303fc36a010   r10: 0000000000000001   r11: 0000000000000001
(XEN) r12: 00000000d0700000   r13: ffff8303fc6d9230   r14: ffff8303fc6d9270
(XEN) r15: 0000000000000000   cr0: 0000000080050033   cr4: 00000000003506e0
(XEN) cr3: 00000003fc3c4000   cr2: 00007f180f6371e8
(XEN) fsb: 00007fce655edbc0   gsb: ffff88822f3c0000   gss: 0000000000000000
(XEN) ds: 0000   es: 0000   fs: 0000   gs: 0000   ss: 0000   cs: e008
(XEN) Xen code around <ffff82d040263cb9> (drivers/vpci/header.c#bar_write+0xc0/0x1ce):
(XEN)  b6 53 14 f6 c2 02 74 02 <0f> 0b 48 8b 03 45 84 ff 0f 85 ec 00 00 00 48 b9
(XEN) Xen stack trace from rsp=ffff8303fc367be8:
(XEN)    00000024fc367bf8 ffff8303f9046a50 0000000000000000 0000000000000004
(XEN)    0000000000000004 0000000000000024 ffff8303fc367ca0 ffff82d040263683
(XEN)    00000300fc367ca0 d070000003003501 00000024d0700000 ffff8303fc6d9230
(XEN)    0000000000000000 0000000000000000 0000002400000004 0000000000000000
(XEN)    0000000000000000 0000000000000000 0000000000000004 00000000d0700000
(XEN)    0000000000000024 0000000000000000 ffff82d040404bc0 ffff8303fc367cd0
(XEN)    ffff82d0402c60a8 0000030000000001 ffff8303fc367d88 0000000000000000
(XEN)    ffff8303fc610800 ffff8303fc367d30 ffff82d0402c54da ffff8303fc367ce0
(XEN)    ffff8303fc367fff 0000000000000004 ffff830300000004 00000000d0700000
(XEN)    ffff8303fc610800 ffff8303fc367d88 0000000000000001 0000000000000000
(XEN)    0000000000000000 ffff8303fc367d58 ffff82d0402c5570 0000000000000004
(XEN)    ffff8304065ea000 ffff8303fc367e28 ffff8303fc367dd0 ffff82d0402b5357
(XEN)    0000000000000cfc ffff8303fc621000 0000000000000000 0000000000000000
(XEN)    0000000000000cfc 00000000d0700000 0000000400000001 0001000000000000
(XEN)    0000000000000004 0000000000000004 0000000000000000 ffff8303fc367e44
(XEN)    ffff8304065ea000 ffff8303fc367e10 ffff82d0402b56d6 0000000000000000
(XEN)    ffff8303fc367e44 0000000000000004 0000000000000cfc ffff8304065e6000
(XEN)    0000000000000000 ffff8303fc367e30 ffff82d0402b6bcc ffff8303fc367e44
(XEN)    0000000000000001 ffff8303fc367e70 ffff82d0402c5e80 d070000040203490
(XEN)    000000000000007b ffff8303fc367ef8 ffff8304065e6000 ffff8304065ea000
(XEN) Xen call trace:
(XEN)    [<ffff82d040263cb9>] R drivers/vpci/header.c#bar_write+0xc0/0x1ce
(XEN)    [<ffff82d040263683>] F vpci_write+0x123/0x26c
(XEN)    [<ffff82d0402c60a8>] F arch/x86/hvm/io.c#vpci_portio_write+0xa0/0xa7
(XEN)    [<ffff82d0402c54da>] F hvm_process_io_intercept+0x203/0x26f
(XEN)    [<ffff82d0402c5570>] F hvm_io_intercept+0x2a/0x4c
(XEN)    [<ffff82d0402b5357>] F arch/x86/hvm/emulate.c#hvmemul_do_io+0x29b/0x5eb
(XEN)    [<ffff82d0402b56d6>] F arch/x86/hvm/emulate.c#hvmemul_do_io_buffer+0x2f/0x6a
(XEN)    [<ffff82d0402b6bcc>] F hvmemul_do_pio_buffer+0x33/0x35
(XEN)    [<ffff82d0402c5e80>] F handle_pio+0x70/0x1b7
(XEN)    [<ffff82d04029dc7f>] F svm_vmexit_handler+0x10ba/0x18aa
(XEN)    [<ffff82d0402034e5>] F svm_stgi_label+0x8/0x18
(XEN)
(XEN) d0v7 bar_write Ray line 391 0000:03:00.0 bar->enabled 1
(XEN) d0v7 bar_write Ray line 406 0000:03:00.0 bar->enabled 1

Thanks,
Ray

