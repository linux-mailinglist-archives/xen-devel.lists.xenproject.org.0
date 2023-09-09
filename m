Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 86376799776
	for <lists+xen-devel@lfdr.de>; Sat,  9 Sep 2023 12:54:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.598500.933355 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qevaN-0002XC-AQ; Sat, 09 Sep 2023 10:53:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 598500.933355; Sat, 09 Sep 2023 10:53:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qevaN-0002Ue-6A; Sat, 09 Sep 2023 10:53:07 +0000
Received: by outflank-mailman (input) for mailman id 598500;
 Sat, 09 Sep 2023 10:53:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=JYTu=EZ=amd.com=Ray.Huang@srs-se1.protection.inumbo.net>)
 id 1qevaL-0002UY-QB
 for xen-devel@lists.xenproject.org; Sat, 09 Sep 2023 10:53:05 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20600.outbound.protection.outlook.com
 [2a01:111:f400:7eae::600])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0c659c7d-4eff-11ee-8783-cb3800f73035;
 Sat, 09 Sep 2023 12:53:03 +0200 (CEST)
Received: from SJ2PR12MB8690.namprd12.prod.outlook.com (2603:10b6:a03:540::10)
 by IA0PR12MB7776.namprd12.prod.outlook.com (2603:10b6:208:430::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.30; Sat, 9 Sep
 2023 10:52:58 +0000
Received: from SJ2PR12MB8690.namprd12.prod.outlook.com
 ([fe80::da13:5f6:45:fa40]) by SJ2PR12MB8690.namprd12.prod.outlook.com
 ([fe80::da13:5f6:45:fa40%4]) with mapi id 15.20.6768.029; Sat, 9 Sep 2023
 10:52:58 +0000
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
X-Inumbo-ID: 0c659c7d-4eff-11ee-8783-cb3800f73035
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BjBwOdT5jO/+w0Q2dZ6xYkBfWL8J5peGrxmd1r7Sd6FvkFJztYQFF5m2Pp8o9Ha3vybNI8cNu8AP7O6gEQkmwslEdpHs/tZ/iyznFwe3s3ok4NtQb+kkZqgb2al9jWjOAN0iVKav3Erk7MklSv5oaaGB1XQn1eSBGCSnVJvJadITsrROH1GeLuKOHbF+zgMxwa9kJpzdr6veuDLLQClDVVwtRYkLMiRn/KMwwE7gSH+CYqnTZawI1HABk8HWJjWGvGWaYARGxkEEPTfnDArGECU1EDwdEfTeBpT4wOHL8aCHK35Kqik0IwqZPhyoEAbCnRG1WoUtXGDJEZp9ySmV6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Wbvq17hlK8xWNP92Lytsx2HHCBc+CPpLZ1Qmhpxj/N4=;
 b=YQSmGfAtAvbUv5BIf3WSu/6IQZS+yuhWnRLq0Q6z1ZjNdrlLhaAOYdiHU0B6Kr9scJAtKlGTZtkTBQKrwCT32nO2xfVqzJk6jcZ9TW+RtspgixMrJT4LljN2PPbxz2LwcrIhHm0PNcnPjXw2XdO5k4wFUGInTSEXek7mOVDrdqrCR8N/tFhbh5lpohTkbPxLjvX2yudAy+xAObFjQjAocFE0csAaErDoUrjpvlVXOaMg5V0OYZDQA9dElLiQwm4Alf1MSQkbFT0lANjLSezEJiQZjDM3eZu8ywnG71D+FgIYhHIujADNbODC1edVFmpG5BEXJeModyZ9Qz8gntZ0TQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Wbvq17hlK8xWNP92Lytsx2HHCBc+CPpLZ1Qmhpxj/N4=;
 b=iylX7SXOAWZ+LG4HSXPtut0FG/pD5uOo0O+8/p93vdk+bDyyRntKw2Y6ak1XD2U6fVqBnL6zSH77bPTWd89l53+SI6nDxKrqZq8ra5emHo2mXiL9Mblu8+re920sFUu4cxvQCJRZ7ZE7GcDYYIdEDS4V7UypdDvJfkC//4ek0BU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Date: Sat, 9 Sep 2023 18:52:27 +0800
From: Huang Rui <ray.huang@amd.com>
To: Antonio Caggiano <quic_acaggian@quicinc.com>
Cc: Gerd Hoffmann <kraxel@redhat.com>,
	"Michael S . Tsirkin" <mst@redhat.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Antonio Caggiano <antonio.caggiano@collabora.com>,
	"Dr . David Alan Gilbert" <dgilbert@redhat.com>,
	Robert Beckett <bob.beckett@collabora.com>,
	Dmitry Osipenko <dmitry.osipenko@collabora.com>,
	Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Gurchetan Singh <gurchetansingh@chromium.org>,
	"ernunes@redhat.com" <ernunes@redhat.com>,
	Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>,
	Akihiko Odaki <akihiko.odaki@daynix.com>,
	Alyssa Ross <hi@alyssa.is>,
	Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
	"Deucher, Alexander" <Alexander.Deucher@amd.com>,
	"Koenig, Christian" <Christian.Koenig@amd.com>,
	"Ragiadakou, Xenia" <Xenia.Ragiadakou@amd.com>,
	"Pelloux-Prayer, Pierre-Eric" <Pierre-eric.Pelloux-prayer@amd.com>,
	"Huang, Honglei1" <Honglei1.Huang@amd.com>,
	"Zhang, Julia" <Julia.Zhang@amd.com>,
	"Chen, Jiqian" <Jiqian.Chen@amd.com>
Subject: Re: [QEMU PATCH v4 12/13] virtio-gpu: Initialize Venus
Message-ID: <ZPxOazRKpcMXcUDw@amd.com>
References: <20230831093252.2461282-1-ray.huang@amd.com>
 <20230831093252.2461282-13-ray.huang@amd.com>
 <ca8bcf9a-2886-aed0-5229-4787808bd39c@quicinc.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ca8bcf9a-2886-aed0-5229-4787808bd39c@quicinc.com>
X-ClientProxiedBy: SI2PR01CA0005.apcprd01.prod.exchangelabs.com
 (2603:1096:4:191::23) To SJ2PR12MB8690.namprd12.prod.outlook.com
 (2603:10b6:a03:540::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR12MB8690:EE_|IA0PR12MB7776:EE_
X-MS-Office365-Filtering-Correlation-Id: 6bb3e6ba-1e74-4e6a-7b12-08dbb122ed4f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	noAdySwIQTUvNKSPPYgvD/CBoLQHpmB9LAqFgan2rMtLskJJMPO8feXutk5Z6dV4U9MGmwaROamuxQx/hKLw8rCJ2S2PBeBj7HUHrpTJzJt7YsQzJNl78iFFHPqKaeq6EgI4c6YRE/qTdIx5yb9q+fVXQ6BDUmtUcDrgSy/bsyFIptmjTvwuqSLWSQb26kanVPRqLboOv5BmFFeIEztsBTFQ1QurAceWkMzl0VkC5H6VgIDRAtJexxDGjWXopQ4NpQl09QdJaYpbU5szoLNpHFR0+133jWk5SshDTaMg85t3YVRqEog3O60MH7che+uRYwNUZzrXBMSaiPUGO1b0/wA0FYNv6BcZYrec4225RBY45ZZFzUPyIzjuhrlNtGebxG2+UFjSkjBp1zkApOw5a1qQTvu9VX7oABGI0R5qZWQfoktafVu2c9aMubYLqbiLIAr1sxicyKim7NsnSJZ+OOcPtbOX7Zg4t3TUqR4fTsfg39IUWHH2GmMccyA7SEad64+12eC8km+x5FAA1qL4cRAKobunPyA2t08Y9JvXige9qYS4cMQIqdLtMgCV2DP7tw2ZxXEgQiPkbqAxdqCZOA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR12MB8690.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(396003)(376002)(366004)(346002)(39860400002)(1800799009)(186009)(451199024)(53546011)(6666004)(6486002)(6506007)(36756003)(86362001)(38100700002)(2616005)(2906002)(966005)(478600001)(6512007)(83380400001)(41300700001)(8936002)(8676002)(5660300002)(316002)(4326008)(26005)(66476007)(7416002)(6916009)(54906003)(66946007)(66556008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?l0TLh186v1eGHYo7x2vi4egipmwp+Pk+fSWsHrkcYk0cfx/aYUrY3CpLzj8a?=
 =?us-ascii?Q?COzV+WXDqJW+BK0fucVJcNOTzSveaGXnCJROoY9L4ZNeDIa1R/dJR3Go0rUW?=
 =?us-ascii?Q?JJ6S/msw0PoQTERX3YmIB0uOirn+0srds/RWYkHq/BuU5HiEqWwB1gnZdHNs?=
 =?us-ascii?Q?YZtFE6ff6tsJUiAhcXsSTszliaIxvyaAlGXkXegLNJVljWoezQxV8pDVBcGs?=
 =?us-ascii?Q?4047y9AKw4Tsq25vJ3ILzdFQocUl9o8A+tGNV1l68j2+MWZQdLazwyQtFi4T?=
 =?us-ascii?Q?pIBgWUSuMqf5iGZtTMmcopb1XwgcbfUHfklA8MFYFefwWoQCj9QLxkV+MWDB?=
 =?us-ascii?Q?SIzaceoeFKxwNWn/kLzqRdpdk7GTH3MtajskMKuYgVSnHTged6xvjUJwPImA?=
 =?us-ascii?Q?KBHaJpV5PkphsTwbo6C/Xr2PjBMxajLU6EZu586CxabJ7bhX/TdV48wh7r4b?=
 =?us-ascii?Q?gm8Be/ct2kH/rRUuADlnBxBq2rUODdoheaJgdcbSJ8sf5k7Ek1S9nJ75HVf8?=
 =?us-ascii?Q?fktH2qg8rTC/7wJkFqahyImyQIpA4gYf5O8XSZxrpjy0v28ueGPuf8QXx7+K?=
 =?us-ascii?Q?IseTblbAKebUB/ptLoUwg4RnMjUDzw+F2FPSiW+fquzSwsWpGIs2gHfbrmjk?=
 =?us-ascii?Q?rZ8Qi/JlMVHGQYDBSz+l0fnDEya53tsQOk5eUQ6GzX2t/Kfn6qwmVffRfbnb?=
 =?us-ascii?Q?LEE35iFCxo4OndJnDa2s9AhmGgpxW89o8sRyw+KihjZ72pSuTZkYvBPuovkp?=
 =?us-ascii?Q?1lgQbQNk6Ed5SP9G4wdYCjv/F1bQJOlZjiPs80btVuVesCReAOnbwiZ+rEA0?=
 =?us-ascii?Q?qpMxhiQ5vz/4AmfW9z0KGgfqzaqkxJp3cWaiPD8GEenaoJFeC2I9Gwx+W+0b?=
 =?us-ascii?Q?DQytUN97yYeFIyd1OjBBsHNLececwt8GJzm0B7F6+o9lTJ59e9FXyZjpxZF4?=
 =?us-ascii?Q?HtXDJ/HeevR7J4o86Bma9vzO9PtVJ1cZIFPnK8zffEd6CciXQrzm4hyWqBIe?=
 =?us-ascii?Q?euBn5pA5Qz7nMClimsKFGbaLkIEf3Jz+Utf+PRFcACEgTQzBnCxJfGxs7tJ6?=
 =?us-ascii?Q?ee/+3RVKnvhH0vyvsbNH3/YjfA9gvbfSXb9JAJnR5r0I8C93e16b0GgzjkeL?=
 =?us-ascii?Q?n/oQ7OFxATeVdTWfkea/sV6SkmPHZXPe02qky3hMYJIrArayAwm5iu9CAojG?=
 =?us-ascii?Q?PtNUTW0znfhGG9D8lbnwmSGrn1Hu1M2XBhhPEbA2U/Un6GbS8C7jTpoaipxR?=
 =?us-ascii?Q?w6WTDXskpWR6LZ8xXzoJbXAMxp2L+kyvUsdd7o1Sz1e+HFsxbZ18UrAZcj5R?=
 =?us-ascii?Q?szht34vqkFDuyIaTS41vbWyv4wB3bNz+I8r5HVB0DMWaZzBaMLiCQhiM4Dgl?=
 =?us-ascii?Q?ErImtxp6z1wgvLeJ1WcOBMZJf61oY7z0IGG1DDQBLVYuPqKea87szSvrxeyQ?=
 =?us-ascii?Q?oxZrBBnt+lHMEa9y0S1JLgbOmUl+6ff62aE9nNSD+SHf1aApp2VE2zJpFc25?=
 =?us-ascii?Q?+qppC2/9RO6Q7mlcAmflDGZKIhYN8rwxS2yx1uCakCr3nNcsBkPnfCZvDOSa?=
 =?us-ascii?Q?UvLvyJ22e9xxsvkSwLOrO0txHOwvYwtpTUN+6sLt?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6bb3e6ba-1e74-4e6a-7b12-08dbb122ed4f
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB8690.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2023 10:52:57.4167
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7DsPlIb3U2L4TcfuaHDvm0nsrETfKs9rSM0sy6FSf3wZQsPqwdkhA3c5M3jgAJpJua3PKSqa6Ok5x+cOsFhCfA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB7776

On Thu, Aug 31, 2023 at 06:40:11PM +0800, Antonio Caggiano wrote:
> Hi Huang,
> 
> Thank you for pushing this forward!
> 

My pleasure! :-)

> On 31/08/2023 11:32, Huang Rui wrote:
> > From: Antonio Caggiano <antonio.caggiano@collabora.com>
> > 
> > Request Venus when initializing VirGL.
> > 
> > Signed-off-by: Antonio Caggiano <antonio.caggiano@collabora.com>
> > Signed-off-by: Huang Rui <ray.huang@amd.com>
> > ---
> > 
> > v1->v2:
> >      - Rebase to latest version
> > 
> >   hw/display/virtio-gpu-virgl.c | 2 ++
> >   1 file changed, 2 insertions(+)
> > 
> > diff --git a/hw/display/virtio-gpu-virgl.c b/hw/display/virtio-gpu-virgl.c
> > index 83cd8c8fd0..c5a62665bd 100644
> > --- a/hw/display/virtio-gpu-virgl.c
> > +++ b/hw/display/virtio-gpu-virgl.c
> > @@ -887,6 +887,8 @@ int virtio_gpu_virgl_init(VirtIOGPU *g)
> >       }
> >   #endif
> >   
> > +    flags |= VIRGL_RENDERER_VENUS;
> > +
> 
> VIRGL_RENDERER_VENUS is a symbol only available from virglrenderer 0.9.1 
> [0] and only if VIRGL_RENDERER_UNSTABLE_APIS is defined.
> 
> Luckily for us, VIRGL_RENDERER_UNSTABLE_APIS is defined unconditionally 
> from virglrenderer 0.9.0 [1], so we could check for that in qemu/meson.build
> 
> e.g.
> 
> 
>    if virgl.version().version_compare('>= 0.9.0')
>      message('Enabling virglrenderer unstable APIs')
>      virgl = declare_dependency(compile_args: 
> '-DVIRGL_RENDERER_UNSTABLE_APIS',
>                                 dependencies: virgl)
>    endif
> 
> 
> Also, while testing this with various versions of virglrenderer, I 
> realized there are no guarantees for Venus backend to be available in 
> the linked library. Virglrenderer should be built with 
> -Dvenus_experimental=true, and if that is not the case, the following 
> virgl_renderer_init would fail for previous versions of virglrenderer or 
> in case it has not been built with venus support.
> 
> I would suggest another approach for that which tries initializing Venus 
> only if VIRGL_RENDERER_VENUS is actually defined. Then, if it fails 
> cause virglrenderer has not been built with venus support, try again 
> falling back to virgl only.
> 
> e.g.
> 
> #ifdef VIRGL_RENDERER_VENUS
>      ret = virgl_renderer_init(g, VIRGL_RENDERER_VENUS, &virtio_gpu_3d_cbs);
>      if (ret != 0) {
>          warn_report("Failed to initialize virglrenderer with venus: 
> %d", ret);
>          warn_report("Falling back to virgl only");
>          ret = virgl_renderer_init(g, 0, &virtio_gpu_3d_cbs);
>      }
> #else
>      ret = virgl_renderer_init(g, 0, &virtio_gpu_3d_cbs);
> #endif
> 

Thanks a lot to explain so clearly. Yes, it's reasonable for me. I will
modify it in the next version. And agree, we should take care of different
virglrenderer versions.

Thanks,
Ray

> 
> >       ret = virgl_renderer_init(g, flags, &virtio_gpu_3d_cbs);
> >       if (ret != 0) {
> >           error_report("virgl could not be initialized: %d", ret);
> 
> [0] 
> https://gitlab.freedesktop.org/virgl/virglrenderer/-/commit/6c31f85330bb4c5aba8b82eba606971e598c6e25
> [1] 
> https://gitlab.freedesktop.org/virgl/virglrenderer/-/commit/491afdc42a49ec6a1b8d7cbc5c97360229002d41
> 
> Best regards,
> Antonio Caggiano

