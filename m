Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C924C7996FE
	for <lists+xen-devel@lfdr.de>; Sat,  9 Sep 2023 11:11:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.598477.933305 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qetyq-00030k-OR; Sat, 09 Sep 2023 09:10:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 598477.933305; Sat, 09 Sep 2023 09:10:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qetyq-0002xN-Kp; Sat, 09 Sep 2023 09:10:16 +0000
Received: by outflank-mailman (input) for mailman id 598477;
 Sat, 09 Sep 2023 09:10:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=JYTu=EZ=amd.com=Ray.Huang@srs-se1.protection.inumbo.net>)
 id 1qetyp-0002xH-Mj
 for xen-devel@lists.xenproject.org; Sat, 09 Sep 2023 09:10:15 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on20621.outbound.protection.outlook.com
 [2a01:111:f400:7eab::621])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ae63df19-4ef0-11ee-8783-cb3800f73035;
 Sat, 09 Sep 2023 11:10:13 +0200 (CEST)
Received: from SJ2PR12MB8690.namprd12.prod.outlook.com (2603:10b6:a03:540::10)
 by BN9PR12MB5259.namprd12.prod.outlook.com (2603:10b6:408:100::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.31; Sat, 9 Sep
 2023 09:10:08 +0000
Received: from SJ2PR12MB8690.namprd12.prod.outlook.com
 ([fe80::da13:5f6:45:fa40]) by SJ2PR12MB8690.namprd12.prod.outlook.com
 ([fe80::da13:5f6:45:fa40%4]) with mapi id 15.20.6768.029; Sat, 9 Sep 2023
 09:10:08 +0000
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
X-Inumbo-ID: ae63df19-4ef0-11ee-8783-cb3800f73035
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=l+o2tZaQligxMxZ/kCYQllEIm+IQCXWH6NiAD1nLksYzefyGi4N6JTZyWFrcGz6y8BEGRfA9vL29uLJmSPNUoYcWjvZSFOgMBvLepWyzPKoS+kbiqtcLCdX+1c8XzJGWRtVsCD72JFAyUxFhr1BjTRVDHWxcsoahNhV4JKlFp+xB0yWOTKqO5UGr3Q8ypNRUsF66gKFLpIsAJMWcbrrctdiwdwa5xftw+0zEBdDTWr9++/a44pgZUEwvZdTS3pBm1QsnE/6na1QTjuhw+g7PYP5eEvILL5ntRSp60+dJ2pzqFYpk9YdoWGVYu3SEiPIiZWL5ZJn+lHvvjE0Tsei+Gg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SoJnY3slHDZZylwAYPJ6G2oJDZgOugqTzOmoA5lRjbY=;
 b=Jt+RBgtOHBv7peOn0ddLCTVF37LpbuYdmQbnFX/+5rIEhUAvkLGh45IXw1s00aUphHPu7HUoaM5mJAOLxUdfYQgerPK4Bi0mlKcD1CPkYF3178SrrSKKLayvA1DbMLXk/+tOZEIwMRXXv2OMEIQ6tR204gsjmaznu5jZVn4GaT5QqQQx+QmO0lfI6KFLXyGYPFDMMJY/uxomxMdazsno19LmXiFZkgYfZH4i7YO0jfQipkCXc0v9WVrQDdFX9G1czWhSrt86j7y/Ez3tPQ/5cqydUVbtrcn61ork8/Znvj49ZwErGXdALNkyBFCeA8BMDoXcNFjAaAQveZCZ/w6i1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SoJnY3slHDZZylwAYPJ6G2oJDZgOugqTzOmoA5lRjbY=;
 b=yi3DyupBFEku1EfwTlp5uGM5isomouWen8mDoNbxpnO5yakaD/tBhqFwlzmrixVmu3mOSD6VEopRXL0ZYzyNF00PHaVQ9euBJzTp8ZDjXjNinUxcMd/EEMuEZ68y2NhVgiGZU0GKV1QxgL2QyC6LWuP/5kzLaLmSoTZPc6tFxUo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Date: Sat, 9 Sep 2023 17:09:38 +0800
From: Huang Rui <ray.huang@amd.com>
To: Akihiko Odaki <akihiko.odaki@daynix.com>
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
	Alyssa Ross <hi@alyssa.is>,
	Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
	"Deucher, Alexander" <Alexander.Deucher@amd.com>,
	"Koenig, Christian" <Christian.Koenig@amd.com>,
	"Ragiadakou, Xenia" <Xenia.Ragiadakou@amd.com>,
	"Pelloux-Prayer, Pierre-Eric" <Pierre-eric.Pelloux-prayer@amd.com>,
	"Huang, Honglei1" <Honglei1.Huang@amd.com>,
	"Zhang, Julia" <Julia.Zhang@amd.com>,
	"Chen, Jiqian" <Jiqian.Chen@amd.com>
Subject: Re: [QEMU PATCH v4 10/13] virtio-gpu: Resource UUID
Message-ID: <ZPw2UjxogIULU722@amd.com>
References: <20230831093252.2461282-1-ray.huang@amd.com>
 <20230831093252.2461282-11-ray.huang@amd.com>
 <58a4e81f-b0ce-49db-8a6a-f6b5bdc3d2d6@daynix.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <58a4e81f-b0ce-49db-8a6a-f6b5bdc3d2d6@daynix.com>
X-ClientProxiedBy: SI1PR02CA0055.apcprd02.prod.outlook.com
 (2603:1096:4:1f5::16) To SJ2PR12MB8690.namprd12.prod.outlook.com
 (2603:10b6:a03:540::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR12MB8690:EE_|BN9PR12MB5259:EE_
X-MS-Office365-Filtering-Correlation-Id: c3c78744-1c6e-40f5-8392-08dbb1148fbd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	kWEz3uUyH8/P3hNr0di5JWc23qq3sSSMG7d9JDR1HP0wtpwHQ47ol/+EtYJn1vFoKnlf5/qz5u59f81MIubEUdSXHoIlDB3JAYa5ujvFXSRsWfe3fXgDPpHnGRZwYN792lOk+9wP3YOkIOVE44Kh5HwcwHiVQTeIyE5DHDXcjF20z+YREygvttHF6ZWdyojfnQhoYfvy9rjl7aQ5sRHfmZ+hOIV0ZlPyOww0dgQMi0aOixGx8mhetP2Q2KA7XkvcIpfhqzOOQJZfZIJI5No6tvPNs+QGSFrOX6+vltuwXIT33wa5uDRvWSdzIdQiYlTKet0Sr56LkwDONpWuwxFkZOg4+BTEUd6bZBVhpEHxENlAbMCw1F8q5SclI5hH+7YFyF7c5ZmM8/Im23/Fr9jNBy2HRTOC4sZnmUuYUm4uKCHDb5LO/T749JOcEUjWV+4YkXZSq7bHj4BFX3eFPWmSSL8Fvf1UzgsN4zVa07x/06hGtcl3FI9izQK2CPEcHzPhSZVBDf7wML0aFpkqyErYVFN1Y7aSqULZ5PjxUyrioFTgD43exOLwoSH8CzdNfhxQ
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR12MB8690.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(346002)(136003)(39860400002)(396003)(366004)(186009)(1800799009)(451199024)(6486002)(6506007)(53546011)(6512007)(6666004)(83380400001)(86362001)(38100700002)(36756003)(2616005)(26005)(316002)(6916009)(7416002)(41300700001)(2906002)(8676002)(4326008)(54906003)(66476007)(66556008)(8936002)(66946007)(478600001)(5660300002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?JRODtyVj+gI6KTHh7lEo9G93ru9MrbyEQKd1QpmDRQmybtl1P9TALvq/k5FF?=
 =?us-ascii?Q?9ZngV1I89gac6OYUypmhT0+JbzxSO5eV4Eka0nJ+ZsQVq/qKeHIYbxSiz6sg?=
 =?us-ascii?Q?DP79Uf9SsY5U3/UxRiVeca14MkVgmYZeATIQBYQ9HdqIhb4+7oZ71qfelNWy?=
 =?us-ascii?Q?S+D9YOQa+ZxOof4oFxoAO/WfDiZ8KD9XQO7QXt5wtENys+buBa/7hBg9o8Tz?=
 =?us-ascii?Q?B9CHdiKQ0yHqs5YPoLeThXI9d+ccAHJWO3Qb7BylQbayq5sGVYNpMou/zBCn?=
 =?us-ascii?Q?2Npb7F+tUZ17iWQ7ZRW1Ik45yU1r6aEEcq2uyS76Rqf2eewAUGStOFMZ+ogy?=
 =?us-ascii?Q?oHFdrqu+eASjrbWSlKgwdxaF9CkAr0UBXPJU2lY6iy5m7YStBwzapEekVZu0?=
 =?us-ascii?Q?vBnpjrym8fEUh39R6oGQe6sIOxMM3M4aEHfFwtbkbaxTCaVV0uzmsYcqcpwY?=
 =?us-ascii?Q?PW6Aq1jVOP+cZZFbbsT1mWwlN43xEZBIsSDpdI7K10nHCsqlHGt0tAynq1qM?=
 =?us-ascii?Q?JGw5a1JzfVSS9OUYMlxsPuZWJ9BmpnB853E/xpA32hMvxzT5jv0dlT1zuRvl?=
 =?us-ascii?Q?BgVaDdGU8iFgSEP0wLnPCQymL+tyMsqkOR3Lc/v4BvCjod+a2fz78j8HIQXE?=
 =?us-ascii?Q?lN9EooipU3zGgzjpcbANVbvMrh0AT3qRhiDdO9TKzbTSJ2v9yjTbpDaqSMqd?=
 =?us-ascii?Q?ICwHhhxn9IzuHAqO/CZB3pSOFlzCTZE2L4s8hPW+sEaJDchNR9iq85l8NUvW?=
 =?us-ascii?Q?Ejh8UkJKlGgjjRGuTXdyrjce340Z1uuUdMjzf34w/TtgA3T7Y/amjY+zZU6X?=
 =?us-ascii?Q?T+V7eZypQSJN4CMc3mpCw+/DQIPyBs3NON5WCCI1uRUimURfxGzXm4pqNZ2f?=
 =?us-ascii?Q?J+PsKD50VARv70qDT0Vk9M9u9namzTZAYYcRSDh2Xj/Vi5YGX9IekR5qgOOC?=
 =?us-ascii?Q?Dbyp5jC0o2C17lKrulQjXe4eecfBHqY8fmf5PpuiVox6LXdD1deOuC8eGbMO?=
 =?us-ascii?Q?qC0G+I6qev1fsyEDrdjNBoUhGZjA3zmVaecXVt2Xu14SXZ/s8oY5TbqtKVio?=
 =?us-ascii?Q?JoGdLjo5aT0B3XCt2m2T70iyGTOoRsQPsXw0NQOOvYBkyFMmO+COm/4VzXEh?=
 =?us-ascii?Q?Jqmp17iKLKZg7nEeIjtGOSJTV7d+B13LNY1Q4MRSmcAffu1xdxJpsPqj+RWb?=
 =?us-ascii?Q?zH5unUHuf0g/1I5azLpQTNkAOeHnD4CQH2Gf0swaXWmkA0rpqs7TWe26OkrT?=
 =?us-ascii?Q?JDXaUio8ny/wQKb1E25o483vth+gc3FgOHLWt99yI4aY9OYnxyw3RwXdnYOT?=
 =?us-ascii?Q?a7/oQATMNjAeyQFLP3n8bCN2Uko7dUz0c/rxUK1fjDxCNKc+zlpEjWnpNJ6R?=
 =?us-ascii?Q?A6VYLqlmcqSCSFFclFimC48mEq98tjHZkRqsxxvw5gz2U/yGSrYAgDmx2HmN?=
 =?us-ascii?Q?6mNdzLgc2JRouoCBJ69cv2edtFcjVfCQ5hQgmcKsrHLB5dhcWmR8xxgDvt7l?=
 =?us-ascii?Q?/JuBqMSbLVibCb50FWuqfWI7eEEt+09emYzpe4lBopw+N8dj2dSHJqwDnBFV?=
 =?us-ascii?Q?DniK9TS4WqLXFq9CqymkLA7tD3y2lfpTVklEyEj1?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c3c78744-1c6e-40f5-8392-08dbb1148fbd
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB8690.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2023 09:10:07.4806
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Loa2Z+Mtn7yjslZhONHb9JtqHKGBQ/X0/xnvIZRx6ae50+bF56LAK78LXk1y3TWi7e+L7NaDuSSE4DtDnxVBlQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR12MB5259

On Thu, Aug 31, 2023 at 06:36:57PM +0800, Akihiko Odaki wrote:
> On 2023/08/31 18:32, Huang Rui wrote:
> > From: Antonio Caggiano <antonio.caggiano@collabora.com>
> > 
> > Enable resource UUID feature and implement command resource assign UUID.
> > This is done by introducing a hash table to map resource IDs to their
> > UUIDs.
> 
> The hash table does not seem to be stored during migration.

May I know whether you point g->resource_uuids table data in VirtIOGPU
device should be stored in virtio_gpu_save() and resumed in
virtio_gpu_load() for virtio migration?

> 
> > 
> > Signed-off-by: Antonio Caggiano <antonio.caggiano@collabora.com>
> > Signed-off-by: Huang Rui <ray.huang@amd.com>
> > ---
> > 
> > v1->v2:
> >     - Separate declarations from code.
> > 
> >   hw/display/trace-events        |  1 +
> >   hw/display/virtio-gpu-base.c   |  2 ++
> >   hw/display/virtio-gpu-virgl.c  | 21 +++++++++++++++++
> >   hw/display/virtio-gpu.c        | 41 ++++++++++++++++++++++++++++++++++
> >   include/hw/virtio/virtio-gpu.h |  4 ++++
> >   5 files changed, 69 insertions(+)
> > 
> > diff --git a/hw/display/trace-events b/hw/display/trace-events
> > index 2336a0ca15..54d6894c59 100644
> > --- a/hw/display/trace-events
> > +++ b/hw/display/trace-events
> > @@ -41,6 +41,7 @@ virtio_gpu_cmd_res_create_blob(uint32_t res, uint64_t size) "res 0x%x, size %" P
> >   virtio_gpu_cmd_res_unref(uint32_t res) "res 0x%x"
> >   virtio_gpu_cmd_res_back_attach(uint32_t res) "res 0x%x"
> >   virtio_gpu_cmd_res_back_detach(uint32_t res) "res 0x%x"
> > +virtio_gpu_cmd_res_assign_uuid(uint32_t res) "res 0x%x"
> >   virtio_gpu_cmd_res_xfer_toh_2d(uint32_t res) "res 0x%x"
> >   virtio_gpu_cmd_res_xfer_toh_3d(uint32_t res) "res 0x%x"
> >   virtio_gpu_cmd_res_xfer_fromh_3d(uint32_t res) "res 0x%x"
> > diff --git a/hw/display/virtio-gpu-base.c b/hw/display/virtio-gpu-base.c
> > index 4f2b0ba1f3..f44388715c 100644
> > --- a/hw/display/virtio-gpu-base.c
> > +++ b/hw/display/virtio-gpu-base.c
> > @@ -236,6 +236,8 @@ virtio_gpu_base_get_features(VirtIODevice *vdev, uint64_t features,
> >           features |= (1 << VIRTIO_GPU_F_CONTEXT_INIT);
> >       }
> >   
> > +    features |= (1 << VIRTIO_GPU_F_RESOURCE_UUID);
> > +
> >       return features;
> >   }
> >   
> > diff --git a/hw/display/virtio-gpu-virgl.c b/hw/display/virtio-gpu-virgl.c
> > index 17b634d4ee..1a996a08fc 100644
> > --- a/hw/display/virtio-gpu-virgl.c
> > +++ b/hw/display/virtio-gpu-virgl.c
> > @@ -36,6 +36,7 @@ static void virgl_cmd_create_resource_2d(VirtIOGPU *g,
> >   {
> >       struct virtio_gpu_resource_create_2d c2d;
> >       struct virgl_renderer_resource_create_args args;
> > +    struct virtio_gpu_simple_resource *res;
> >   
> >       VIRTIO_GPU_FILL_CMD(c2d);
> >       trace_virtio_gpu_cmd_res_create_2d(c2d.resource_id, c2d.format,
> > @@ -53,6 +54,14 @@ static void virgl_cmd_create_resource_2d(VirtIOGPU *g,
> >       args.nr_samples = 0;
> >       args.flags = VIRTIO_GPU_RESOURCE_FLAG_Y_0_TOP;
> >       virgl_renderer_resource_create(&args, NULL, 0);
> > +
> > +    res = g_new0(struct virtio_gpu_simple_resource, 1);
> > +    if (!res) {
> > +        cmd->error = VIRTIO_GPU_RESP_ERR_OUT_OF_MEMORY;
> > +        return;
> 
> virglrenderer thinks the resource is alive in such a situation.

Yes, so we can move the resource allocation in front of below virglrenderer
resource creation.

virgl_renderer_resource_create(&args, NULL, 0);

> 
> > +    }
> > +    res->resource_id = c2d.resource_id;
> > +    QTAILQ_INSERT_HEAD(&g->reslist, res, next);
> >   }
> >   
> >   static void virgl_cmd_create_resource_3d(VirtIOGPU *g,
> > @@ -60,6 +69,7 @@ static void virgl_cmd_create_resource_3d(VirtIOGPU *g,
> >   {
> >       struct virtio_gpu_resource_create_3d c3d;
> >       struct virgl_renderer_resource_create_args args;
> > +    struct virtio_gpu_simple_resource *res;
> >   
> >       VIRTIO_GPU_FILL_CMD(c3d);
> >       trace_virtio_gpu_cmd_res_create_3d(c3d.resource_id, c3d.format,
> > @@ -77,6 +87,14 @@ static void virgl_cmd_create_resource_3d(VirtIOGPU *g,
> >       args.nr_samples = c3d.nr_samples;
> >       args.flags = c3d.flags;
> >       virgl_renderer_resource_create(&args, NULL, 0);
> > +
> > +    res = g_new0(struct virtio_gpu_simple_resource, 1);
> > +    if (!res) {
> > +        cmd->error = VIRTIO_GPU_RESP_ERR_OUT_OF_MEMORY;
> > +        return;
> > +    }
> > +    res->resource_id = c3d.resource_id;
> > +    QTAILQ_INSERT_HEAD(&g->reslist, res, next);
> >   }
> >   
> >   static void virgl_resource_destroy(VirtIOGPU *g,
> > @@ -682,6 +700,9 @@ void virtio_gpu_virgl_process_cmd(VirtIOGPU *g,
> >           /* TODO add security */
> >           virgl_cmd_ctx_detach_resource(g, cmd);
> >           break;
> > +    case VIRTIO_GPU_CMD_RESOURCE_ASSIGN_UUID:
> > +        virtio_gpu_resource_assign_uuid(g, cmd);
> > +        break;
> >       case VIRTIO_GPU_CMD_GET_CAPSET_INFO:
> >           virgl_cmd_get_capset_info(g, cmd);
> >           break;
> > diff --git a/hw/display/virtio-gpu.c b/hw/display/virtio-gpu.c
> > index cc4c1f81bb..770e4747e3 100644
> > --- a/hw/display/virtio-gpu.c
> > +++ b/hw/display/virtio-gpu.c
> > @@ -966,6 +966,37 @@ virtio_gpu_resource_detach_backing(VirtIOGPU *g,
> >       virtio_gpu_cleanup_mapping(g, res);
> >   }
> >   
> > +void virtio_gpu_resource_assign_uuid(VirtIOGPU *g,
> > +                                     struct virtio_gpu_ctrl_command *cmd)
> > +{
> > +    struct virtio_gpu_simple_resource *res;
> > +    struct virtio_gpu_resource_assign_uuid assign;
> > +    struct virtio_gpu_resp_resource_uuid resp;
> > +    QemuUUID *uuid = NULL;
> 
> This initialization is unnecessary.

Yes, will remove it.

> 
> > +
> > +    VIRTIO_GPU_FILL_CMD(assign);
> > +    virtio_gpu_bswap_32(&assign, sizeof(assign));
> > +    trace_virtio_gpu_cmd_res_assign_uuid(assign.resource_id);
> > +
> > +    res = virtio_gpu_find_check_resource(g, assign.resource_id, false, __func__, &cmd->error);
> > +    if (!res) {
> > +        return;
> > +    }
> > +
> > +    memset(&resp, 0, sizeof(resp));
> > +    resp.hdr.type = VIRTIO_GPU_RESP_OK_RESOURCE_UUID;
> > +
> > +    uuid = g_hash_table_lookup(g->resource_uuids, GUINT_TO_POINTER(assign.resource_id));
> > +    if (!uuid) {
> > +        uuid = g_new(QemuUUID, 1);
> > +        qemu_uuid_generate(uuid);
> > +        g_hash_table_insert(g->resource_uuids, GUINT_TO_POINTER(assign.resource_id), uuid);
> > +    }
> > +
> > +    memcpy(resp.uuid, uuid, sizeof(QemuUUID));
> > +    virtio_gpu_ctrl_response(g, cmd, &resp.hdr, sizeof(resp));
> > +}
> > +
> >   void virtio_gpu_simple_process_cmd(VirtIOGPU *g,
> >                                      struct virtio_gpu_ctrl_command *cmd)
> >   {
> > @@ -1014,6 +1045,9 @@ void virtio_gpu_simple_process_cmd(VirtIOGPU *g,
> >       case VIRTIO_GPU_CMD_RESOURCE_DETACH_BACKING:
> >           virtio_gpu_resource_detach_backing(g, cmd);
> >           break;
> > +    case VIRTIO_GPU_CMD_RESOURCE_ASSIGN_UUID:
> > +        virtio_gpu_resource_assign_uuid(g, cmd);
> > +        break;
> >       default:
> >           cmd->error = VIRTIO_GPU_RESP_ERR_UNSPEC;
> >           break;
> > @@ -1393,12 +1427,15 @@ void virtio_gpu_device_realize(DeviceState *qdev, Error **errp)
> >       QTAILQ_INIT(&g->reslist);
> >       QTAILQ_INIT(&g->cmdq);
> >       QTAILQ_INIT(&g->fenceq);
> > +
> > +    g->resource_uuids = g_hash_table_new_full(NULL, NULL, NULL, g_free);
> >   }
> >   
> >   static void virtio_gpu_device_unrealize(DeviceState *qdev)
> >   {
> >       VirtIOGPU *g = VIRTIO_GPU(qdev);
> >   
> > +    g_hash_table_destroy(g->resource_uuids);
> >       g_clear_pointer(&g->ctrl_bh, qemu_bh_delete);
> >       g_clear_pointer(&g->cursor_bh, qemu_bh_delete);
> >       g_clear_pointer(&g->reset_bh, qemu_bh_delete);
> > @@ -1452,6 +1489,10 @@ void virtio_gpu_reset(VirtIODevice *vdev)
> >           g_free(cmd);
> >       }
> >   
> > +    if (g->resource_uuids) {
> 
> Isn't g->resource_uuids always non-NULL?

Yes, right. The if check should be superfluous. Will remove it.

Thanks,
Ray

> 
> > +        g_hash_table_remove_all(g->resource_uuids);
> > +    }
> > +
> >       virtio_gpu_base_reset(VIRTIO_GPU_BASE(vdev));
> >   }
> >   
> > diff --git a/include/hw/virtio/virtio-gpu.h b/include/hw/virtio/virtio-gpu.h
> > index b9adc28071..aa94b1b697 100644
> > --- a/include/hw/virtio/virtio-gpu.h
> > +++ b/include/hw/virtio/virtio-gpu.h
> > @@ -208,6 +208,8 @@ struct VirtIOGPU {
> >           QTAILQ_HEAD(, VGPUDMABuf) bufs;
> >           VGPUDMABuf *primary[VIRTIO_GPU_MAX_SCANOUTS];
> >       } dmabuf;
> > +
> > +    GHashTable *resource_uuids;
> >   };
> >   
> >   struct VirtIOGPUClass {
> > @@ -285,6 +287,8 @@ void virtio_gpu_cleanup_mapping_iov(VirtIOGPU *g,
> >                                       struct iovec *iov, uint32_t count);
> >   void virtio_gpu_cleanup_mapping(VirtIOGPU *g,
> >                                   struct virtio_gpu_simple_resource *res);
> > +void virtio_gpu_resource_assign_uuid(VirtIOGPU *g,
> > +                                     struct virtio_gpu_ctrl_command *cmd);
> >   void virtio_gpu_process_cmdq(VirtIOGPU *g);
> >   void virtio_gpu_device_realize(DeviceState *qdev, Error **errp);
> >   void virtio_gpu_reset(VirtIODevice *vdev);

