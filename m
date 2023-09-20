Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BC5EE7A762D
	for <lists+xen-devel@lfdr.de>; Wed, 20 Sep 2023 10:42:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.605311.942924 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qismx-00087v-3G; Wed, 20 Sep 2023 08:42:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 605311.942924; Wed, 20 Sep 2023 08:42:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qismw-00085o-VD; Wed, 20 Sep 2023 08:42:26 +0000
Received: by outflank-mailman (input) for mailman id 605311;
 Wed, 20 Sep 2023 08:42:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=7N78=FE=amd.com=Ray.Huang@srs-se1.protection.inumbo.net>)
 id 1qismu-00084Y-Dq
 for xen-devel@lists.xenproject.org; Wed, 20 Sep 2023 08:42:24 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20622.outbound.protection.outlook.com
 [2a01:111:f400:fe5b::622])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9cd10bbc-5791-11ee-9b0d-b553b5be7939;
 Wed, 20 Sep 2023 10:42:21 +0200 (CEST)
Received: from SJ2PR12MB8690.namprd12.prod.outlook.com (2603:10b6:a03:540::10)
 by IA0PR12MB8421.namprd12.prod.outlook.com (2603:10b6:208:40f::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.19; Wed, 20 Sep
 2023 08:42:13 +0000
Received: from SJ2PR12MB8690.namprd12.prod.outlook.com
 ([fe80::c3b:811:fd1d:c33e]) by SJ2PR12MB8690.namprd12.prod.outlook.com
 ([fe80::c3b:811:fd1d:c33e%6]) with mapi id 15.20.6792.021; Wed, 20 Sep 2023
 08:42:12 +0000
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
X-Inumbo-ID: 9cd10bbc-5791-11ee-9b0d-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lRwBUJ1LjrkF0nqL8wqiZ0+MS7UD5PEkOpNdTkaWZnWKqUy8593P7UraIn5mLrwv4UMQNePEVxuCwv0mJX4J9v9V5fAV8gIcUsE9uFLaUpdHaCNTZFw4uEhj15swGJYQzdnnCkI0bVHwquntuztOxGLo1W3MKF4A873Q34zalWb6Hmjmcuxp3dTWzzz4n8IqDLDRcYEr8ZDkksBA2zepimNbPP+lwqWEAn9I6H5Q8jQxwzdytS8FA++BvUVX2Q5gODWiFiJQcq4gfI8+Hme9mbPPoSiZc4iAutlSNktU5xMUkVUiluYlI7Awlitv7IU0bvMlViukfN2fiVIVWEjKWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Bncs6D0qnZ2rxd1tro+efyJlKkvljoFGVx34A2/aCPU=;
 b=ez693Fg+y0+MXiB9q0yVTDo2XAUIQ/ViFxPYA0vy63Sk8WfsJebdzRa7pMFCbcLgv+kkpgk1vxcOwpOFYY38nU5l3ebZB4ewziw327TiN3yxjcmxDLVuhllZZYZxoFxta592jwS8ni0lUOt5RL1HLa3tFG5KPnNUENZGjkBWeHiM/W1o+aKRAUEdkcZe8UjcZtVj0uJahIDoV0jLxKXfskin0dvrafq574jrxXSWE6BdiCU5hZldQMloueJ1rRdfmmNjgIyFc48bZsu14dt1QEVsecfan+sW6oipb+arQl6jj99dc+MMU8gZfyTbks1ijJdmv9QeUN2IyLdVW0pBTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Bncs6D0qnZ2rxd1tro+efyJlKkvljoFGVx34A2/aCPU=;
 b=5UJP5zteQS1L83WbWchJVhAfLfAGapKz0AQ3PFt40CI/NlP9DwsYtbDX78TmY0qOMd0APjf2gUh0e8+dylOiaI0FbFoDWEIE+NTHpI21HcjgY/jb4EclAd1Z5JPL0RFkBnQPE/8ZfbfJR2qz9pD9bZh45Ing+wgF3DBrmnbLjcI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Date: Wed, 20 Sep 2023 16:41:44 +0800
From: Huang Rui <ray.huang@amd.com>
To: =?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@gmail.com>
Cc: Gerd Hoffmann <kraxel@redhat.com>,
	"Michael S . Tsirkin" <mst@redhat.com>,
	Akihiko Odaki <akihiko.odaki@daynix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Antonio Caggiano <quic_acaggian@quicinc.com>,
	"Dr . David Alan Gilbert" <dgilbert@redhat.com>,
	Robert Beckett <bob.beckett@collabora.com>,
	Dmitry Osipenko <dmitry.osipenko@collabora.com>,
	Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Gurchetan Singh <gurchetansingh@chromium.org>,
	Albert Esteve <aesteve@redhat.com>,
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
	"Chen, Jiqian" <Jiqian.Chen@amd.com>,
	Antonio Caggiano <antonio.caggiano@collabora.com>
Subject: Re: [QEMU PATCH v5 09/13] virtio-gpu: Handle resource blob commands
Message-ID: <ZQqwSN7OaFfTlCZP@amd.com>
References: <20230915111130.24064-1-ray.huang@amd.com>
 <20230915111130.24064-10-ray.huang@amd.com>
 <CAJ+F1CLXqxGKOoOvmXKZWJYENmH6Z3CJhoftvjQBRFO=fhtQuA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAJ+F1CLXqxGKOoOvmXKZWJYENmH6Z3CJhoftvjQBRFO=fhtQuA@mail.gmail.com>
X-ClientProxiedBy: SI2P153CA0026.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:190::18) To SJ2PR12MB8690.namprd12.prod.outlook.com
 (2603:10b6:a03:540::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR12MB8690:EE_|IA0PR12MB8421:EE_
X-MS-Office365-Filtering-Correlation-Id: fac9a002-6c27-4f43-61e8-08dbb9b57bdd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	YUnUIcTuXmlUEwQfjJ4nkN+Xw/D0EVWbEgwI/61PXLy3HBZo8mKC1OZAOEhyAkSd3JSUHTHzkI8UhrAp+vNGTfyXRuH1r2HVo7+XE+Vzcii1hSHmomnnr27QoIXYLP5jRhhZDF1BwXDv8NS7LcakoUdLftDiRGFQkgi9wFysF8TJ7luPj3twAgPtdjl3Jko3h48CPzFd7dPrdQ3+yjGFPjenam/0K4lTz6eirUaY8/98CTmwMuse0prU4stF5ilwJI3IOX4kX2SNkGK3jxnCERvzJ1vvLdNFC119kirSzzH/CrFus2RKreo8ARgo0taFma8zEdIKfw1Q3LVCAYmoAoQr7U9M4tHb0OhRlpBBWdWavtKfjZvwrLWc1erfLD1SCrgRj+jKnDtNOwmgIKopcjp3/fVLPS/49CG4IrsLu9v7m8ZRhdKMfJcO/MyKcnveCscKm2+wz897xnQ9F03xMOWWh9/81YKv7fecNGieXBGDh0jHlarh1F2WNY+JpT1wvmF4sxNY5cU8bYsV/qDp6GLey1oH9WgDMtEBcC3D0KVbDsQ74ayP3bDH54QSdYjC
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR12MB8690.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(366004)(346002)(376002)(136003)(39860400002)(451199024)(1800799009)(186009)(53546011)(6486002)(6506007)(6666004)(6512007)(478600001)(83380400001)(26005)(2616005)(30864003)(2906002)(7416002)(54906003)(66946007)(66476007)(66556008)(316002)(6916009)(4326008)(8676002)(8936002)(5660300002)(41300700001)(36756003)(86362001)(38100700002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Rm9VaDBiVVhhdDIyUWxkZFdJK0RCTEZ2RE9yREY4UWhmOTU1YUJsK29LSndx?=
 =?utf-8?B?OWRxSXFzNnpnVDdoOVN2SzJDcXZWUHVMS3dqeUorbmNac3J3djlzQW01eC9R?=
 =?utf-8?B?YzBsd2M3cDRVVC9TakFqZ2R0cDV5QzZvVWlSS2tkZFZQaHo2U0huVW9VbDc1?=
 =?utf-8?B?SjJZWUFZSEtaUk5yekZWc0I5MUxGOWMxY01oYzhnTmVKbTBTMnVTWndveFd1?=
 =?utf-8?B?OGVCcE1aY3lYOUV1elNGdG5vODFkb3h5S3RMOWdzbk1EcFdKOWo3Yjgwb254?=
 =?utf-8?B?RzJKWk1HbXpRTW9tVGtIUXFicmNqa0lKZ1FKYkF2U2orYlV2Z3BHTXMwYW5v?=
 =?utf-8?B?T2I4VGhxTTBjSXQ0aGxTaWQrMGlwRGtTQmZtMmVQMDJJZFhRUzJzaXdrcGNH?=
 =?utf-8?B?NlYvcDZSRTJnUjkySnJwdkRvM3cxczk0eStKUjhvVTNsdGxoUTBLYmtMOGtp?=
 =?utf-8?B?ckJWTkliRFp3Wnd0N1orR1ZnQmlqWTR1REIyYVJNMDFNdmc5b2pRZlpINWVh?=
 =?utf-8?B?TzdBaitGYjg4c1dqN2V1TWNrMDNJWTA4Q1NmblBweEVEZTUrbG5Ob1NROG1Z?=
 =?utf-8?B?WllHdXRaU1lXU1hlYjhIM056TkR5NXZMT3g4T3hPQnhCczQ3a1hHczlqZFV2?=
 =?utf-8?B?eW54QTFYSTdRRjhiejBuTG5qa0lPZ3dHaTFveHlRbVhDRDdjdXlwZjdQV0hB?=
 =?utf-8?B?RE15U200MXViU2ZHdVdEaU1POTNUL2piaStkT05hM1hQOGhTOUx4TEpXa3h1?=
 =?utf-8?B?cEZCdCtLMklMcWZhazFzK2QyaWwwd3N5RVl1NUphODB1THltanZlalByZSs0?=
 =?utf-8?B?ZE5BS3hQVHRVUkxsenk5ckg0UmVFL1pyZlZlOUgybXQyV2ZVMlBFblo2eDNa?=
 =?utf-8?B?ZUk1Tm1IL3U4TlR1cm1PbDFwWU56UjQ5T2FSeHNFdkNoSnA5MFJQUjZ3U3FQ?=
 =?utf-8?B?VE1KL0IwYit2WnJkMW4xZlNHL2hKSE1rdmpJNys3RlYrOWk3L2M1WkFuMlRt?=
 =?utf-8?B?YjdxVmIzYlorUk1zM094MnlsZDhVbjBYQk5WUXpzaFFzTWQycFBleVpCeU5x?=
 =?utf-8?B?MlFPWlBzTmhTT05UaWdpQUdBTWRiZHg2am4yNmRHNmVrdUdUTVREMWpNNkJr?=
 =?utf-8?B?czZZUnJnNE9hZ2x0Uk1GUkhoU1IvWFgxUWlQRjJveTVFcjR4YU5YU1VSMkFk?=
 =?utf-8?B?WTd4amF2N1Y0WGdiZklWb0tpbW5NNE9HZVNIa21EOHdHVWZkNTFVeUFwUTRL?=
 =?utf-8?B?SEtLeW9nbXR3VDhCd1JWMVQ0MURGWHVCRGt4aFFGNXJLdk5aNGpzcnNVV1pi?=
 =?utf-8?B?VGNPRm9DWmhFVU9qdkVSOXg1MXkxa3Fhb1Vid08wK2xBWllhZWg4bWEyWVRp?=
 =?utf-8?B?dUlXa1F0Y3JURWZRejN5ZGFVVWRvWUxwMzlIMUgwTjJFSTdiaUJuSnRySUZY?=
 =?utf-8?B?ejZBRDl5eGV1KytXOG5McC8reUpRZzh2VHpRRDdGYi9aK2ZYMGpnQkhjY0Ro?=
 =?utf-8?B?T2g4RGJSRUFaN0FmbHRaeFhsMjZ3OERsN1RGZ2FwWVE3dDNnem9qaUI2NzVh?=
 =?utf-8?B?SHFGbFlxSlJXK1AvUEFLUzZHN25LUmhoMHNSRlMydUltYjV5T2RtU1NsSEFP?=
 =?utf-8?B?czBNQWNiTTJIdzFxVG42dlVUc0xsdCtIUUowOTcrUXNTSmM1MmdBU2NGZ01S?=
 =?utf-8?B?MURhWjd0ZmJvNmhaenVJY2pNbVpCRElKaW5uN0Q0aXlQcWJUcU5ZckV6RzJH?=
 =?utf-8?B?OUpmazJ1UWJnbUx0QStHRnJQdWxDSkJ4dzZDMmE5aFhua1ZRVlVmOVVHNEk5?=
 =?utf-8?B?dWRoOXJlM2REL0pVTjNmWW03cjFyZzR0cjlNcEpmSTdYaGdiTm93TWs0d3Q3?=
 =?utf-8?B?VjluOHNrYzNsQW5ydm4xb2hVN1JySER0SFZNTjMraitGODFwd3FtRFlqSjFv?=
 =?utf-8?B?VWJNUXpwTUhhaklraXBvZG5iVng0M1BheThLd2x6V0tBQjFQc0FVNXpMQU5G?=
 =?utf-8?B?WFFZa2ErdXJkY0k4aERYbUkwREpFRzV1TGRySWU3QlpnOTJCRGhWK1BjS1Rt?=
 =?utf-8?B?WnRUSE03R0JpY040UHR3QnNLM3RrdytEV2xvclFKaThrU3NqWlBDbHlNZk9T?=
 =?utf-8?Q?Iv3nnyMN8YQNVzp2B41UluzH1?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fac9a002-6c27-4f43-61e8-08dbb9b57bdd
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB8690.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Sep 2023 08:42:12.3905
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: z28u8TB4F4tYpi+couiZFvp0NT8PYBVzqrFbjHL9uKy5T6TfTG+w5+wKTzjEieFMUDXywuzCH5eCDhB9PqQqSw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8421

On Tue, Sep 19, 2023 at 04:44:01PM +0800, Marc-André Lureau wrote:
> Hi
> 
> On Fri, Sep 15, 2023 at 3:14 PM Huang Rui <ray.huang@amd.com> wrote:
> >
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
> > V4 -> V5:
> >     - Use memory_region_init_ram_ptr() instead of
> >       memory_region_init_ram_device_ptr() (Akihiko)
> >
> >  hw/display/virtio-gpu-virgl.c  | 213 +++++++++++++++++++++++++++++++++
> >  hw/display/virtio-gpu.c        |   4 +-
> >  include/hw/virtio/virtio-gpu.h |   5 +
> >  meson.build                    |   4 +
> >  4 files changed, 225 insertions(+), 1 deletion(-)
> >
> > diff --git a/hw/display/virtio-gpu-virgl.c b/hw/display/virtio-gpu-virgl.c
> > index 312953ec16..563a6f2f58 100644
> > --- a/hw/display/virtio-gpu-virgl.c
> > +++ b/hw/display/virtio-gpu-virgl.c
> > @@ -17,6 +17,7 @@
> >  #include "trace.h"
> >  #include "hw/virtio/virtio.h"
> >  #include "hw/virtio/virtio-gpu.h"
> > +#include "hw/virtio/virtio-gpu-bswap.h"
> >
> >  #include "ui/egl-helpers.h"
> >
> > @@ -78,9 +79,24 @@ static void virgl_cmd_create_resource_3d(VirtIOGPU *g,
> >      virgl_renderer_resource_create(&args, NULL, 0);
> >  }
> >
> > +static void virgl_resource_destroy(VirtIOGPU *g,
> > +                                   struct virtio_gpu_simple_resource *res)
> > +{
> > +    if (!res)
> > +        return;
> > +
> 
> QEMU coding style imposes braces
> 

Thanks for reminder.

> > +    QTAILQ_REMOVE(&g->reslist, res, next);
> > +
> > +    virtio_gpu_cleanup_mapping_iov(g, res->iov, res->iov_cnt);
> > +    g_free(res->addrs);
> > +
> > +    g_free(res);
> 
> If you embed virtio_gpu_simple_resource in a new struct, we should
> instead call the existing virtio_gpu_resource_destroy() I guess.

Yes, but I didn't call virtio_gpu_resource_destroy() here, I am using the
virgl_resource_destroy() and the input should be the virgl resource in next
version. May I know whether I miss understood your point?

> 
> > +}
> > +
> >  static void virgl_cmd_resource_unref(VirtIOGPU *g,
> >                                       struct virtio_gpu_ctrl_command *cmd)
> >  {
> > +    struct virtio_gpu_simple_resource *res;
> >      struct virtio_gpu_resource_unref unref;
> >      struct iovec *res_iovs = NULL;
> >      int num_iovs = 0;
> > @@ -88,13 +104,22 @@ static void virgl_cmd_resource_unref(VirtIOGPU *g,
> >      VIRTIO_GPU_FILL_CMD(unref);
> >      trace_virtio_gpu_cmd_res_unref(unref.resource_id);
> >
> > +    res = virtio_gpu_find_resource(g, unref.resource_id);
> > +
> >      virgl_renderer_resource_detach_iov(unref.resource_id,
> >                                         &res_iovs,
> >                                         &num_iovs);
> >      if (res_iovs != NULL && num_iovs != 0) {
> >          virtio_gpu_cleanup_mapping_iov(g, res_iovs, num_iovs);
> > +        if (res) {
> > +            res->iov = NULL;
> > +            res->iov_cnt = 0;
> > +        }
> >      }
> > +
> >      virgl_renderer_resource_unref(unref.resource_id);
> > +
> > +    virgl_resource_destroy(g, res);
> >  }
> >
> >  static void virgl_cmd_context_create(VirtIOGPU *g,
> > @@ -426,6 +451,183 @@ static void virgl_cmd_get_capset(VirtIOGPU *g,
> >      g_free(resp);
> >  }
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
> 
> needless error handling, glib will abort() on OOM.

OK, I will remove all simliar error handling in next version.

> 
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
> > +                     __func__, mblob.resource_id);
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
> 
> no need for OOM handling here too
> 
> > +        virgl_renderer_resource_unmap(res->resource_id);
> > +        cmd->error = VIRTIO_GPU_RESP_ERR_OUT_OF_MEMORY;
> > +        return;
> > +    }
> > +    memory_region_init_ram_ptr(res->region, OBJECT(g), NULL, size, data);
> > +    OBJECT(res->region)->free = g_free;
> > +    memory_region_add_subregion(&b->hostmem, mblob.offset, res->region);
> > +    memory_region_set_enabled(res->region, true);
> > +
> > +    memset(&resp, 0, sizeof(resp));
> > +    resp.hdr.type = VIRTIO_GPU_RESP_OK_MAP_INFO;
> > +    virgl_renderer_resource_get_map_info(mblob.resource_id, &resp.map_info);
> > +    virtio_gpu_ctrl_response(g, cmd, &resp.hdr, sizeof(resp));
> > +}
> > +
> > +static int virtio_gpu_virgl_resource_unmap(VirtIOGPU *g,
> > +                                           struct virtio_gpu_simple_resource
> > +                                           *res)
> > +{
> > +    VirtIOGPUBase *b = VIRTIO_GPU_BASE(g);
> > +
> > +    if (!res) {
> > +        qemu_log_mask(LOG_GUEST_ERROR, "%s: resource already unmapped %d\n",
> > +                      __func__, res->resource_id);
> > +        return VIRTIO_GPU_RESP_ERR_INVALID_RESOURCE_ID;
> > +    }
> > +
> > +    memory_region_set_enabled(res->region, false);
> > +    memory_region_del_subregion(&b->hostmem, res->region);
> > +    object_unparent(OBJECT(res->region));
> > +    res->region = NULL;
> > +
> > +    return virgl_renderer_resource_unmap(res->resource_id);
> > +}
> > +
> > +static void virgl_cmd_resource_unmap_blob(VirtIOGPU *g,
> > +                                          struct virtio_gpu_ctrl_command *cmd)
> > +{
> > +    struct virtio_gpu_simple_resource *res;
> > +    struct virtio_gpu_resource_unmap_blob ublob;
> > +    VIRTIO_GPU_FILL_CMD(ublob);
> > +    virtio_gpu_unmap_blob_bswap(&ublob);
> > +
> > +    if (ublob.resource_id == 0) {
> > +        qemu_log_mask(LOG_GUEST_ERROR, "%s: resource id 0 is not allowed\n",
> > +                      __func__);
> > +        cmd->error = VIRTIO_GPU_RESP_ERR_INVALID_RESOURCE_ID;
> > +        return;
> > +    }
> > +
> > +    res = virtio_gpu_find_resource(g, ublob.resource_id);
> > +    if (!res) {
> > +        qemu_log_mask(LOG_GUEST_ERROR, "%s: resource does not exist %d\n",
> > +                      __func__, ublob.resource_id);
> > +        cmd->error = VIRTIO_GPU_RESP_ERR_INVALID_RESOURCE_ID;
> > +        return;
> > +    }
> > +
> > +    virtio_gpu_virgl_resource_unmap(g, res);
> > +}
> > +
> > +#endif /* HAVE_VIRGL_RESOURCE_BLOB */
> > +
> >  void virtio_gpu_virgl_process_cmd(VirtIOGPU *g,
> >                                        struct virtio_gpu_ctrl_command *cmd)
> >  {
> > @@ -492,6 +694,17 @@ void virtio_gpu_virgl_process_cmd(VirtIOGPU *g,
> >      case VIRTIO_GPU_CMD_GET_EDID:
> >          virtio_gpu_get_edid(g, cmd);
> >          break;
> > +#ifdef HAVE_VIRGL_RESOURCE_BLOB
> > +    case VIRTIO_GPU_CMD_RESOURCE_CREATE_BLOB:
> > +        virgl_cmd_resource_create_blob(g, cmd);
> > +        break;
> > +    case VIRTIO_GPU_CMD_RESOURCE_MAP_BLOB:
> > +        virgl_cmd_resource_map_blob(g, cmd);
> > +        break;
> > +    case VIRTIO_GPU_CMD_RESOURCE_UNMAP_BLOB:
> > +        virgl_cmd_resource_unmap_blob(g, cmd);
> > +        break;
> > +#endif /* HAVE_VIRGL_RESOURCE_BLOB */
> >      default:
> >          cmd->error = VIRTIO_GPU_RESP_ERR_UNSPEC;
> >          break;
> > diff --git a/hw/display/virtio-gpu.c b/hw/display/virtio-gpu.c
> > index 5b7a7eab4f..cc4c1f81bb 100644
> > --- a/hw/display/virtio-gpu.c
> > +++ b/hw/display/virtio-gpu.c
> > @@ -1367,10 +1367,12 @@ void virtio_gpu_device_realize(DeviceState *qdev, Error **errp)
> >              return;
> >          }
> >
> > +#ifndef HAVE_VIRGL_RESOURCE_BLOB
> >          if (virtio_gpu_virgl_enabled(g->parent_obj.conf)) {
> > -            error_setg(errp, "blobs and virgl are not compatible (yet)");
> > +            error_setg(errp, "Linked virglrenderer does not support blob resources");
> >              return;
> >          }
> > +#endif
> >      }
> >
> >      if (!virtio_gpu_base_device_realize(qdev,
> > diff --git a/include/hw/virtio/virtio-gpu.h b/include/hw/virtio/virtio-gpu.h
> > index 55973e112f..b9adc28071 100644
> > --- a/include/hw/virtio/virtio-gpu.h
> > +++ b/include/hw/virtio/virtio-gpu.h
> > @@ -58,6 +58,11 @@ struct virtio_gpu_simple_resource {
> >      int dmabuf_fd;
> >      uint8_t *remapped;
> >
> > +#ifdef HAVE_VIRGL_RESOURCE_BLOB
> > +    /* only blob resource needs this region to be mapped as guest mmio */
> > +    MemoryRegion *region;
> > +#endif
> > +
> >      QTAILQ_ENTRY(virtio_gpu_simple_resource) next;
> >  };
> >
> > diff --git a/meson.build b/meson.build
> > index ff20d3c249..f7b744ab82 100644
> > --- a/meson.build
> > +++ b/meson.build
> > @@ -1072,6 +1072,10 @@ if not get_option('virglrenderer').auto() or have_system or have_vhost_user_gpu
> >                         cc.has_function('virgl_renderer_context_create_with_flags',
> >                                         prefix: '#include <virglrenderer.h>',
> >                                         dependencies: virgl))
> > +  config_host_data.set('HAVE_VIRGL_RESOURCE_BLOB',
> > +                       cc.has_function('virgl_renderer_resource_create_blob',
> > +                                       prefix: '#include <virglrenderer.h>',
> > +                                       dependencies: virgl))
> 
> better moved under the if virgl.found() block

Yes, will update.

> 
> >  endif
> >  blkio = not_found
> >  if not get_option('blkio').auto() or have_block
> > --
> > 2.34.1
> >
> >
> 
> 
> -- 
> Marc-André Lureau

