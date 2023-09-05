Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E2BD779214C
	for <lists+xen-devel@lfdr.de>; Tue,  5 Sep 2023 11:09:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.595496.929080 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qdS3g-0008H2-Uk; Tue, 05 Sep 2023 09:09:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 595496.929080; Tue, 05 Sep 2023 09:09:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qdS3g-0008Ef-R4; Tue, 05 Sep 2023 09:09:16 +0000
Received: by outflank-mailman (input) for mailman id 595496;
 Tue, 05 Sep 2023 09:09:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Og0L=EV=amd.com=Ray.Huang@srs-se1.protection.inumbo.net>)
 id 1qdS3f-0008EZ-1k
 for xen-devel@lists.xenproject.org; Tue, 05 Sep 2023 09:09:15 +0000
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on20629.outbound.protection.outlook.com
 [2a01:111:f400:7e8d::629])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e09eb752-4bcb-11ee-9b0d-b553b5be7939;
 Tue, 05 Sep 2023 11:09:12 +0200 (CEST)
Received: from SJ2PR12MB8690.namprd12.prod.outlook.com (2603:10b6:a03:540::10)
 by DS0PR12MB9037.namprd12.prod.outlook.com (2603:10b6:8:f1::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.33; Tue, 5 Sep
 2023 09:09:08 +0000
Received: from SJ2PR12MB8690.namprd12.prod.outlook.com
 ([fe80::da13:5f6:45:fa40]) by SJ2PR12MB8690.namprd12.prod.outlook.com
 ([fe80::da13:5f6:45:fa40%4]) with mapi id 15.20.6745.030; Tue, 5 Sep 2023
 09:09:08 +0000
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
X-Inumbo-ID: e09eb752-4bcb-11ee-9b0d-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Dw+7Z2rufoHOvxkm5h2MIUjhyEvxVXCijO6kmfYMFlR5jt1wvGPC86bctkMKDyASkM3Zylws3kztKMGOoyIK+AUz2PSoirZZlMzDi978b686r1c9Xz9hvcRoo5WFsJx/Ck/5W55qLnBAWBVkgcoDH13jDx+8CVyO3U3iq4rLIGoKMNN5WjyVjTlXgNTiCzaoLptxpkPo0a0HRkGZc+018ABiNSAjZXyUYALQ1v9S/XlLc4s0Y9BknGMin0jJD5ot094RHZMM6ljvejhGldOQHAoVH8peToq0uM38n8I3Dx1IdTEpI8YvjnGtsrISNbDA0xkXdTrSHDFPGtCKW1trCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UZTlXoNoNczrtqNBYxQZRjvScQ5LFRngZk2YbfQs9n8=;
 b=fj4qJa1o9AJ/+6/TJmLn9BJX+qEog8Q6JlraYYy24zgJ+u4jEJR1B3XmCubWgCWp8fYHfw1twV5ZRsEQwPLt9V4YcDoWMkRM1KTq38C/cblXIRCf2ibfn0AJiWMxa9snovy3W7EcU5O9P+KsXXzwOsw4mg+6stAkhbPKTZ9aTHLZrtu8kRqTf4qM24aIHr3urZfnfVmHRqBtUmQu8oJg0AaYZazhZ4nf2GMjsajMOiKvyjlvIAmIve1UdwkKZCTwL0FXrk9T7M2TSIMN5KlIyk4aAiNdkdymgb2cSuhZ/xx3rc/g95YryObQB/t5FdWOcTk3CUUK+LY7TeXNmSUtVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UZTlXoNoNczrtqNBYxQZRjvScQ5LFRngZk2YbfQs9n8=;
 b=xT75Y/YHP5wpNAVqUgCUZBVNQ/xaKE3hKWZCC9YEHocXg8FvxdFyvscRvN3E99r+BHVdc0Ob01hTYxOdFQ4nGs7q70Mx+/p2Dc+ZOEoAPgeJZcaVRebuGW2I2R45tcI9BjUn6BYJ0M4EfBurUrPcaOD8N7iw0JCW7I750y57OjY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Date: Tue, 5 Sep 2023 17:08:40 +0800
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
Subject: Re: [QEMU PATCH v4 09/13] virtio-gpu: Handle resource blob commands
Message-ID: <ZPbwGA3apjQTtCeu@amd.com>
References: <20230831093252.2461282-1-ray.huang@amd.com>
 <20230831093252.2461282-10-ray.huang@amd.com>
 <ba478789-5db0-4011-bed1-7dd6901eccd6@daynix.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ba478789-5db0-4011-bed1-7dd6901eccd6@daynix.com>
X-ClientProxiedBy: SI2PR06CA0016.apcprd06.prod.outlook.com
 (2603:1096:4:186::22) To SJ2PR12MB8690.namprd12.prod.outlook.com
 (2603:10b6:a03:540::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR12MB8690:EE_|DS0PR12MB9037:EE_
X-MS-Office365-Filtering-Correlation-Id: 5043260b-d012-4cef-9fd3-08dbadefc2ee
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	NTfLOFdUbE5l7BKnZbsye5yHF8lGVuc/YGOPFJ6TNlM7k22mtPmPPbPJTGmFnDahCl+g0JCOKQNUD7LpeBkkS2UQqklEkvXm7Ulh7Fq3Aul7JapOiP/Q/8h051sFLHuFdWUMekfspxpUhKy+LzcD5hpFsTFaQ0hYo/+JRAROdLuGgJgmNcZ00jdcBj6aZpj+x3Lp9ya18n0U2D8Wa6qe1Kqrb/vsYhodlLD/jm27ngoXDoBBNR7ChQlG0D2apv1ltvR5dKcGxKjToYV/jcysme7Au//o+yJk5L9ptkQ0wouArJVNrzNtqRhtAKlp3fukBxU5sGOU2fyUapsBxDf/fo/S3RVy0xQ6crwTO2Mv9OB2DWmk4dxePXEOxw/UI8iPu3GiiJ7CGBcyemnCcO0EUL/KdpRyOcsWV5GeHVjQ0tzBz3S2JQBmqxtRH37B5w1skyb/+MTHkpmFI/s9M/XCFjL/PL8ZrIe3QodDNB7XxKLaLAFpASbQ8OYuz8RQHNq+AQmdFysPNuYxRJRU/KYI015AK9byWoGQswCmkfoa0FqgXuG9YQ1/rSdWGa025wBw
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR12MB8690.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(136003)(396003)(366004)(376002)(39860400002)(1800799009)(451199024)(186009)(5660300002)(8936002)(66476007)(7416002)(41300700001)(54906003)(66556008)(6916009)(66946007)(316002)(2906002)(6666004)(53546011)(6486002)(6506007)(6512007)(4326008)(2616005)(8676002)(478600001)(26005)(83380400001)(38100700002)(36756003)(86362001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?t4ScbwmUmMsg3wGMGZXm885PiOTavLXn6973NLXYLysBo0mAvJiceYp0uBS/?=
 =?us-ascii?Q?kBrwWK0SFh5VH80mivcccQgM8nlU8ravOt1Xnzhao3Ss6vh3Qd7shUyBzTs7?=
 =?us-ascii?Q?ZQfeAzJLnN3c9F3G7btPvN2/QNy7kUYx3samc3Y9m1P+3rBT0Rt2zJBF06j8?=
 =?us-ascii?Q?Lb9HetNrjcbfY7dEu36wLtuPD6Yg4H3pgzt6nTpQ5TvLZ7KmB0rnbWea+9x4?=
 =?us-ascii?Q?N41AoRUfn1P5lF4Yb0BBGCI+ZZtVT6DXUw2GI9yb1H5XWpWjEvz2h6bmVKYm?=
 =?us-ascii?Q?thYIM2cw0ZMn+C1Av6/kdShR/+iMtO9NM1oGeuIdcZhKDEUUOjQMX7HWOd4z?=
 =?us-ascii?Q?u0I6GskIZWPY+rJ3zwDzHlQOauW2bNbn+2WDkbyPOiqXiC+6Yd5RK8mzaooB?=
 =?us-ascii?Q?9lZi/VJDzFapKNRgsD+bFdYdZ102lZ6Boxp3cvHO3P/3URJArEf8Gesst/c1?=
 =?us-ascii?Q?wz0z6SXjNH47ham8GUBeIm4vaulQvB2SMkshSgj0XZuk69kiOwvmQc7ymYgB?=
 =?us-ascii?Q?pqPQ5IvK3rGcKMXighV13dmrg0SozryJjkQ/0YNSXNT8VAdGeB4vGkb4gtfS?=
 =?us-ascii?Q?rmPk7b02eADkphBvgQv76nSOUoNDYtW4aNX+DYhNiJff7ZDQVogSo1EJZiE3?=
 =?us-ascii?Q?C1UB3kKktyt9Y17xOqngnlZ6XN61iUoKtC/mFc3adaeUgHAqUXOKqFj7OTQA?=
 =?us-ascii?Q?5q2hpCffHr5cn2ZeHCK0lX70jOgwRGL/tg/9Pe7qxZFy4I0kW7Nshf1c+Fs7?=
 =?us-ascii?Q?bOMWthe1Pa1Drx4SENLGTLtNgYI2QdByhKRA3KNPdiDIPJrSCFfSyOD7JCAX?=
 =?us-ascii?Q?x4eah1WpADA7icUQa2NZgRAxYGL3YjYFzv0Sw4k3DnQHCLTxJx1BcwJm1rsc?=
 =?us-ascii?Q?8NuB7Ps6mtwNo1t/bfCTAx+pYGGPIu+/ZzzmljKdwWYd9WckPTHLjrjLIpI9?=
 =?us-ascii?Q?IZXDkBmETzDnjoMZN40TdmjDbVm16mhwGq4T/ULIuJAL/ZK2Hr8Q6NZicK+d?=
 =?us-ascii?Q?g9c9CUj/p63Skr4zsKtLYi1fzFdbeyg1xNcISuycUFkO5cZEJfGWkcND1dud?=
 =?us-ascii?Q?oBd0odLKhPY3/MqskVNxyxW7RWnx+Rj8YjvXrIh8SczHT0EmlZfaB471z9ZM?=
 =?us-ascii?Q?ODXq+iC8nqa55PDdmeCM2pM/n9XG/6UqQRdt1rcx6/ka4GR1y6/W24ltbUVR?=
 =?us-ascii?Q?/fJzWX3pFBHPbrrgza9TPVbNyh+uXrdkrNZNYzD9wY69kRX9/HFFRBaGzLwk?=
 =?us-ascii?Q?/hHHbwUd05XSD/8GoBYBcnl1VCPAnLOqbJcgHLlWzrPamwY3BBSLUyTNqV5F?=
 =?us-ascii?Q?bvlDGTqNAMcnBSsPASuVqLlJXK9BZ361btpYi/GXqAYVIBX6XoythnH3HURc?=
 =?us-ascii?Q?jIlEiJXMYj0H8zdh0Tu7XglKRIrOXVhoZqk486PyGLsnR69d9IsLB9/e0Hlw?=
 =?us-ascii?Q?T6gI/4EXNxEnePp0L/P0np2zZsj7xPPRISQphN6pWmqRN4bhn9VzJwX74Oj3?=
 =?us-ascii?Q?m7bAlZcGhXHlBmaatvm0319Osg4/7wVm7NlWnSBdQNvXALMBfnghUxKUKius?=
 =?us-ascii?Q?fFnuzs5cWgiuS6VfB/N0mmLBVzWEFkb/t4HN3D/J?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5043260b-d012-4cef-9fd3-08dbadefc2ee
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB8690.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Sep 2023 09:09:08.4066
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4ByG8U//hxwOawf/ILm4+TKFK+q9rwYDHt5hGloIp+syzC/mgSBj24D8Pt1fL+RztNrDBkH/FTKtXyiqHMvzqg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB9037

On Thu, Aug 31, 2023 at 06:24:32PM +0800, Akihiko Odaki wrote:
> On 2023/08/31 18:32, Huang Rui wrote:
> > From: Antonio Caggiano <antonio.caggiano@collabora.com>
> > 
> > Support BLOB resources creation, mapping and unmapping by calling the
> > new stable virglrenderer 0.10 interface. Only enabled when available and
> > via the blob config. E.g. -device virtio-vga-gl,blob=true
> > 
> > Signed-off-by: Antonio Caggiano <antonio.caggiano@collabora.com>
> > Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
> > Signed-off-by: Xenia Ragiadakou <xenia.ragiadakou@amd.com>
> > Signed-off-by: Huang Rui <ray.huang@amd.com>
> > ---
> > 
> > v1->v2:
> >      - Remove unused #include "hw/virtio/virtio-iommu.h"
> > 
> >      - Add a local function, called virgl_resource_destroy(), that is used
> >        to release a vgpu resource on error paths and in resource_unref.
> > 
> >      - Remove virtio_gpu_virgl_resource_unmap from virtio_gpu_cleanup_mapping(),
> >        since this function won't be called on blob resources and also because
> >        blob resources are unmapped via virgl_cmd_resource_unmap_blob().
> > 
> >      - In virgl_cmd_resource_create_blob(), do proper cleanup in error paths
> >        and move QTAILQ_INSERT_HEAD(&g->reslist, res, next) after the resource
> >        has been fully initialized.
> > 
> >      - Memory region has a different life-cycle from virtio gpu resources
> >        i.e. cannot be released synchronously along with the vgpu resource.
> >        So, here the field "region" was changed to a pointer that will be
> >        released automatically once the memory region is unparented and all
> >        of its references have been released.
> >        Also, since the pointer can be used to indicate whether the blob
> >        is mapped, the explicit field "mapped" was removed.
> > 
> >      - In virgl_cmd_resource_map_blob(), add check on the value of
> >        res->region, to prevent beeing called twice on the same resource.
> > 
> >      - Remove direct references to parent_obj.
> > 
> >      - Separate declarations from code.
> > 
> >   hw/display/virtio-gpu-virgl.c  | 213 +++++++++++++++++++++++++++++++++
> >   hw/display/virtio-gpu.c        |   4 +-
> >   include/hw/virtio/virtio-gpu.h |   5 +
> >   meson.build                    |   4 +
> >   4 files changed, 225 insertions(+), 1 deletion(-)
> > 
> > diff --git a/hw/display/virtio-gpu-virgl.c b/hw/display/virtio-gpu-virgl.c
> > index 312953ec16..17b634d4ee 100644
> > --- a/hw/display/virtio-gpu-virgl.c
> > +++ b/hw/display/virtio-gpu-virgl.c
> > @@ -17,6 +17,7 @@
> >   #include "trace.h"
> >   #include "hw/virtio/virtio.h"
> >   #include "hw/virtio/virtio-gpu.h"
> > +#include "hw/virtio/virtio-gpu-bswap.h"
> >   
> >   #include "ui/egl-helpers.h"
> >   
> > @@ -78,9 +79,24 @@ static void virgl_cmd_create_resource_3d(VirtIOGPU *g,
> >       virgl_renderer_resource_create(&args, NULL, 0);
> >   }
> >   
> > +static void virgl_resource_destroy(VirtIOGPU *g,
> > +                                   struct virtio_gpu_simple_resource *res)
> > +{
> > +    if (!res)
> > +        return;
> > +
> > +    QTAILQ_REMOVE(&g->reslist, res, next);
> > +
> > +    virtio_gpu_cleanup_mapping_iov(g, res->iov, res->iov_cnt);
> > +    g_free(res->addrs);
> > +
> > +    g_free(res);
> > +}
> > +
> >   static void virgl_cmd_resource_unref(VirtIOGPU *g,
> >                                        struct virtio_gpu_ctrl_command *cmd)
> >   {
> > +    struct virtio_gpu_simple_resource *res;
> >       struct virtio_gpu_resource_unref unref;
> >       struct iovec *res_iovs = NULL;
> >       int num_iovs = 0;
> > @@ -88,13 +104,22 @@ static void virgl_cmd_resource_unref(VirtIOGPU *g,
> >       VIRTIO_GPU_FILL_CMD(unref);
> >       trace_virtio_gpu_cmd_res_unref(unref.resource_id);
> >   
> > +    res = virtio_gpu_find_resource(g, unref.resource_id);
> > +
> >       virgl_renderer_resource_detach_iov(unref.resource_id,
> >                                          &res_iovs,
> >                                          &num_iovs);
> >       if (res_iovs != NULL && num_iovs != 0) {
> >           virtio_gpu_cleanup_mapping_iov(g, res_iovs, num_iovs);
> > +        if (res) {
> > +            res->iov = NULL;
> > +            res->iov_cnt = 0;
> > +        }
> >       }
> > +
> >       virgl_renderer_resource_unref(unref.resource_id);
> > +
> > +    virgl_resource_destroy(g, res);
> >   }
> >   
> >   static void virgl_cmd_context_create(VirtIOGPU *g,
> > @@ -426,6 +451,183 @@ static void virgl_cmd_get_capset(VirtIOGPU *g,
> >       g_free(resp);
> >   }
> >   
> > +#ifdef HAVE_VIRGL_RESOURCE_BLOB
> > +
> > +static void virgl_cmd_resource_create_blob(VirtIOGPU *g,
> > +                                           struct virtio_gpu_ctrl_command *cmd)
> > +{
> > +    struct virtio_gpu_simple_resource *res;
> > +    struct virtio_gpu_resource_create_blob cblob;
> > +    struct virgl_renderer_resource_create_blob_args virgl_args = { 0 };
> > +    int ret;
> > +
> > +    VIRTIO_GPU_FILL_CMD(cblob);
> > +    virtio_gpu_create_blob_bswap(&cblob);
> > +    trace_virtio_gpu_cmd_res_create_blob(cblob.resource_id, cblob.size);
> > +
> > +    if (cblob.resource_id == 0) {
> > +        qemu_log_mask(LOG_GUEST_ERROR, "%s: resource id 0 is not allowed\n",
> > +                      __func__);
> > +        cmd->error = VIRTIO_GPU_RESP_ERR_INVALID_RESOURCE_ID;
> > +        return;
> > +    }
> > +
> > +    res = virtio_gpu_find_resource(g, cblob.resource_id);
> > +    if (res) {
> > +        qemu_log_mask(LOG_GUEST_ERROR, "%s: resource already exists %d\n",
> > +                      __func__, cblob.resource_id);
> > +        cmd->error = VIRTIO_GPU_RESP_ERR_INVALID_RESOURCE_ID;
> > +        return;
> > +    }
> > +
> > +    res = g_new0(struct virtio_gpu_simple_resource, 1);
> > +    if (!res) {
> > +        cmd->error = VIRTIO_GPU_RESP_ERR_OUT_OF_MEMORY;
> > +        return;
> > +    }
> > +
> > +    res->resource_id = cblob.resource_id;
> > +    res->blob_size = cblob.size;
> > +
> > +    if (cblob.blob_mem != VIRTIO_GPU_BLOB_MEM_HOST3D) {
> > +        ret = virtio_gpu_create_mapping_iov(g, cblob.nr_entries, sizeof(cblob),
> > +                                            cmd, &res->addrs, &res->iov,
> > +                                            &res->iov_cnt);
> > +        if (!ret) {
> > +            g_free(res);
> > +            cmd->error = VIRTIO_GPU_RESP_ERR_UNSPEC;
> > +            return;
> > +        }
> > +    }
> > +
> > +    QTAILQ_INSERT_HEAD(&g->reslist, res, next);
> > +
> > +    virgl_args.res_handle = cblob.resource_id;
> > +    virgl_args.ctx_id = cblob.hdr.ctx_id;
> > +    virgl_args.blob_mem = cblob.blob_mem;
> > +    virgl_args.blob_id = cblob.blob_id;
> > +    virgl_args.blob_flags = cblob.blob_flags;
> > +    virgl_args.size = cblob.size;
> > +    virgl_args.iovecs = res->iov;
> > +    virgl_args.num_iovs = res->iov_cnt;
> > +
> > +    ret = virgl_renderer_resource_create_blob(&virgl_args);
> > +    if (ret) {
> > +        virgl_resource_destroy(g, res);
> > +        qemu_log_mask(LOG_GUEST_ERROR, "%s: virgl blob create error: %s\n",
> > +                      __func__, strerror(-ret));
> > +        cmd->error = VIRTIO_GPU_RESP_ERR_UNSPEC;
> > +    }
> > +}
> > +
> > +static void virgl_cmd_resource_map_blob(VirtIOGPU *g,
> > +                                        struct virtio_gpu_ctrl_command *cmd)
> > +{
> > +    struct virtio_gpu_simple_resource *res;
> > +    struct virtio_gpu_resource_map_blob mblob;
> > +    int ret;
> > +    void *data;
> > +    uint64_t size;
> > +    struct virtio_gpu_resp_map_info resp;
> > +    VirtIOGPUBase *b = VIRTIO_GPU_BASE(g);
> > +
> > +    VIRTIO_GPU_FILL_CMD(mblob);
> > +    virtio_gpu_map_blob_bswap(&mblob);
> > +
> > +    if (mblob.resource_id == 0) {
> > +        qemu_log_mask(LOG_GUEST_ERROR, "%s: resource id 0 is not allowed\n",
> > +                      __func__);
> > +        cmd->error = VIRTIO_GPU_RESP_ERR_INVALID_RESOURCE_ID;
> > +        return;
> > +    }
> > +
> > +    res = virtio_gpu_find_resource(g, mblob.resource_id);
> > +    if (!res) {
> > +        qemu_log_mask(LOG_GUEST_ERROR, "%s: resource does not exist %d\n",
> > +                      __func__, mblob.resource_id);
> > +        cmd->error = VIRTIO_GPU_RESP_ERR_INVALID_RESOURCE_ID;
> > +        return;
> > +    }
> > +    if (res->region) {
> > +        qemu_log_mask(LOG_GUEST_ERROR, "%s: resource already mapped %d\n",
> > +		      __func__, mblob.resource_id);
> > +        cmd->error = VIRTIO_GPU_RESP_ERR_INVALID_RESOURCE_ID;
> > +        return;
> > +    }
> > +
> > +    ret = virgl_renderer_resource_map(res->resource_id, &data, &size);
> > +    if (ret) {
> > +        qemu_log_mask(LOG_GUEST_ERROR, "%s: resource map error: %s\n",
> > +                      __func__, strerror(-ret));
> > +        cmd->error = VIRTIO_GPU_RESP_ERR_INVALID_RESOURCE_ID;
> > +        return;
> > +    }
> > +
> > +    res->region = g_new0(MemoryRegion, 1);
> > +    if (!res->region) {
> > +        virgl_renderer_resource_unmap(res->resource_id);
> > +        cmd->error = VIRTIO_GPU_RESP_ERR_OUT_OF_MEMORY;
> > +        return;
> > +    }
> > +    memory_region_init_ram_device_ptr(res->region, OBJECT(g), NULL, size, data);
> 
> I think memory_region_init_ram_ptr() should be used instead.

Would you mind to explain the reason?

Thanks,
Ray

