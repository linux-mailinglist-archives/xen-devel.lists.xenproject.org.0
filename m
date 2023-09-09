Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AD360799717
	for <lists+xen-devel@lfdr.de>; Sat,  9 Sep 2023 11:31:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.598484.933315 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qeuIU-0006lH-DZ; Sat, 09 Sep 2023 09:30:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 598484.933315; Sat, 09 Sep 2023 09:30:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qeuIU-0006jb-Al; Sat, 09 Sep 2023 09:30:34 +0000
Received: by outflank-mailman (input) for mailman id 598484;
 Sat, 09 Sep 2023 09:30:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=JYTu=EZ=amd.com=Ray.Huang@srs-se1.protection.inumbo.net>)
 id 1qeuIT-0006jV-02
 for xen-devel@lists.xenproject.org; Sat, 09 Sep 2023 09:30:33 +0000
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on2061b.outbound.protection.outlook.com
 [2a01:111:f400:7ea9::61b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 84aeda14-4ef3-11ee-8783-cb3800f73035;
 Sat, 09 Sep 2023 11:30:31 +0200 (CEST)
Received: from SJ2PR12MB8690.namprd12.prod.outlook.com (2603:10b6:a03:540::10)
 by MW4PR12MB7166.namprd12.prod.outlook.com (2603:10b6:303:224::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.31; Sat, 9 Sep
 2023 09:30:24 +0000
Received: from SJ2PR12MB8690.namprd12.prod.outlook.com
 ([fe80::da13:5f6:45:fa40]) by SJ2PR12MB8690.namprd12.prod.outlook.com
 ([fe80::da13:5f6:45:fa40%4]) with mapi id 15.20.6768.029; Sat, 9 Sep 2023
 09:30:24 +0000
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
X-Inumbo-ID: 84aeda14-4ef3-11ee-8783-cb3800f73035
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MArb8+60waLeq7ehgCGUYDN05pw6PDkRJbXlifj7EwHMgB9AyQZug9/28n/aNXOOilBjSvLIDFHRoKZJ7WXSiAgrEnqRKAEHGGH8WFzTGLGjUAixl6C1RcptlO6+n6My2d6+2fAPYCPGYPR3g/rPXuA1yqu+OB+ps7RTOnScDvChKvS5obm1MNXzCYvrA05cUVev30ryIFZCBpISgHauTDxIXQm+EDRdeS4+iQSfnVjxqdhfWPM7W5SbEIQnPhm7tNzrMObBjWcVM1TVPYuLehMya6wZeTFgB65J0Wj6wk72VxHZ2aol1GAzTkEeL37AYEILicqCuXkpmRLZdfD2XQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zf56A8xo2EV8tGG4DRZO1FfjzNPRkQQhtB+dN1WhCpU=;
 b=Stq2iCeGtfSOo3lOjx6RXzwkrHw0uyjPn/yUBuz40ffjnCzX2/grsvXnkwfliffcFnQ1+HsskJkkU+4ms4a3oWUGXnF238AOSASccguAayKPP+KeQliw6xuFQ0vrA34iLdQN2qU6H/LridhwmAgQNXwFwtWU/YhIWcMBg3SXWPwe6NVm74jlI0tkwVHi7gd50zdJM+kg10DNnpM4opa+xH0LbKPKZZCmTqs4nt7yuEgvAN6pH3gkk9wO0ixy77654NCCkyo1CQ50gpVHtGd/eSG8UA7JCuk4QA6LYa/5ZR64waodRYOG9+bixnjyyx1cSDlKOthrGSNMx9caGeZZ+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zf56A8xo2EV8tGG4DRZO1FfjzNPRkQQhtB+dN1WhCpU=;
 b=jkYxPXuT7NIDrZ0OcZXnbLP7hei4GFB0zXRMEE6y2Yi92qqumGvKjB4T4oeCQhBNOjY/TT3VTahu41yjyAZ6qWpT6aUzkkKTvFG7fY0u4jgwbTmHhw4IovTrxjFSFdr9jE08f7hICcLbHVmJoaBmqOEErXx/rv4cuVxM++/+mis=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Date: Sat, 9 Sep 2023 17:29:56 +0800
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
Subject: Re: [QEMU PATCH v4 11/13] virtio-gpu: Support Venus capset
Message-ID: <ZPw7FIMmykdYtVeM@amd.com>
References: <20230831093252.2461282-1-ray.huang@amd.com>
 <20230831093252.2461282-12-ray.huang@amd.com>
 <fe36e4e1-1198-4da4-b6ee-a6a00a44298a@daynix.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fe36e4e1-1198-4da4-b6ee-a6a00a44298a@daynix.com>
X-ClientProxiedBy: SI2PR02CA0047.apcprd02.prod.outlook.com
 (2603:1096:4:196::14) To SJ2PR12MB8690.namprd12.prod.outlook.com
 (2603:10b6:a03:540::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR12MB8690:EE_|MW4PR12MB7166:EE_
X-MS-Office365-Filtering-Correlation-Id: a9ed9647-93cf-48ee-ff6a-08dbb11764ea
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	KLzcOGZDYf3uhjOK2KKYQ2/VkWi1r2z1uO0ig2nTVNSWajPBKe78X3l2jg7OA5kUJzB2PiikkG7fRrCY4p5RIjJFDCkrVzGN2DNDibdovUf87HMuZMXkTsXeOV2TgeZWsj7+XGrLVOlKbUIyVR4M2lZAXHfT342mEroZTFh/VAJ4A5oN7RkROuQXFCaIlH/nDwf7j5C4MlYmBRAvjEl0QKLCufL/DVbYHM4a6ztp5mOiUtndKFVUxcpsw+cab966QfkqqGV3MUJDa3nFYz+3BdP1piHYHDzFc3wd/xMgAUi2TTt+F4xZE8b+JW8QcT1Gs7mHZ61Yj55PzW5YdYs3ET16y/YKyF4HSlQYZvw9BsKrAl5xKdu8Sh8Yv2/89nZW4QEEZQVzUjK2nJ9Mn4zxUlazcaO3WLn+gR4O6kQGwQxMe5VBY+DUhdAZ+PCDz7pZEUDuxh9+X6SEdy6cS70xSRBoe4thBZrO6LgdbcwtvN31L/mWwgpGGmRb4+7rJ2DyytG2szQo740LxKFE0mF5CsOx7/aUpj9so6upDCNzYSl+X4GD2wozNUWUhQxUzaXQ
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR12MB8690.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(136003)(39860400002)(366004)(346002)(396003)(186009)(451199024)(1800799009)(6486002)(6666004)(6512007)(6506007)(53546011)(478600001)(83380400001)(2616005)(26005)(2906002)(7416002)(316002)(54906003)(66476007)(66556008)(6916009)(66946007)(5660300002)(8936002)(8676002)(41300700001)(4326008)(38100700002)(36756003)(86362001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?FYjX9yOHciVW4zcgZeR/1W4GC4h7Qb9C2OpuZl8OVObb4kDbvfpuataHeHk0?=
 =?us-ascii?Q?LsqjutXDASqHNn6qOTMsxyZ2l2a+QrmBsNHVN5o9zUZkWzkEWFyPSOPvc8WT?=
 =?us-ascii?Q?u0B/deGNZ0wuklw9NLrw0b/6LerwuZHPKFVatGVqb8NaXd2ux+OfDlODVtZL?=
 =?us-ascii?Q?hkoAb4Rm/HEbCK7TbGYJGnO86LACGpIDv6Xhxy4IAKXUE0YJKFNOBiy7pJp9?=
 =?us-ascii?Q?5IvPiFi3jbmzJg2s7vOP+yXpEOOz8JvVsyCLKMwt+djloi8DpnQ6XzFcdzNH?=
 =?us-ascii?Q?T9jq03uqlr2HCEA4cOoWTLtGwVUFkA5Kgqwm1c5deuThgg000foXiBgYW5fL?=
 =?us-ascii?Q?JPgyklFLgxfvaCX/CEwe2kLcv0A7Ae420fMvax5rfZp/EegE8XUxlYnpYeY6?=
 =?us-ascii?Q?LNtwLEPk2igPAarp77UtFs0s6AU1msbDjG5PGOf3Gvc6oMd0bJ2GlaQnCE+i?=
 =?us-ascii?Q?tKAvbepBZzi8Vr2pBMHM+npva6us/3jQZljhbxnzhqZjrB+aApEV8jMo2V5d?=
 =?us-ascii?Q?mLqmdfoysrTcx0iioTmhKvk6JwUstT54BuZ0smHEYeH5jaLeAE6zWnoVWFB8?=
 =?us-ascii?Q?tqRCqXo+jqZK6yDMghhpDmVVeV4HOKzvRTiL5cc1cH0eKJ9PZu74qwy0wuqF?=
 =?us-ascii?Q?pLEI0V3pD4Ici5CneSvtJ3/CW1TbKIbhJVXg6TJP9HxL/FmfU5RIRTe+pRgy?=
 =?us-ascii?Q?0E1v+SEti0vGUWGIMsrHDbU6jVLDmDtYSLxkNOuuFoI2XV++eW3Yljux5FNB?=
 =?us-ascii?Q?f9lGpU40bCp55UsO7qzL3wMisr29FSZCAcSrgQbtfQeXorZhLAQD4s5k/BOF?=
 =?us-ascii?Q?9UvaXuGdcQqtltosKWEPsyDgJd7m3EH0babJfMF9nPTI3NYaUEoRFUs3zSy0?=
 =?us-ascii?Q?y1WfWRxNSMm86gqJ5r13jN0KEcahmNpX75iyjYRLnt6hA76WRCUN3XqVDsvd?=
 =?us-ascii?Q?vVPCVdzhnVwU/GqMSQv5jGindfiFwq0yeBwL62HeuL+awIAbAKv5Svpioq//?=
 =?us-ascii?Q?5jryWvV96GM6WSNLrINZsSr3ccalwg/rCxp/EpPtyOcfsAuQ/LXmL5gjYRPs?=
 =?us-ascii?Q?58u6xI7+ZEElErQqCnakSXO1duLFthXhTTsYZRaul0I9uQNylMKTP3D0ghph?=
 =?us-ascii?Q?gLx96jibjDR7IrzEOhE2d7HeuVhbBPrLlipALIkH9skEqmH7yXeqbJwY+2Ra?=
 =?us-ascii?Q?AqUnaD7UnxllA/+uv1MyGEJlnoboV9d3fFhrusMy8MnleFkxxBC+EU+1wegl?=
 =?us-ascii?Q?Mtb8GASKH72W1xpDlonR1ZdRVXA/4Z77njuYkKRGu+EHmTLbRDO59K6B0vAG?=
 =?us-ascii?Q?qicLrpeAXWnAJG7AbUXAg+RMhC3fzTvTr5uVKwTafn8tQxYEb8Grx32VWwi8?=
 =?us-ascii?Q?vQXc4b15jN2F0PeheEinWwU4nuVbnyAE4+wN6u84ja9cjiOT9p5Fita2ae0Y?=
 =?us-ascii?Q?R43qCWwBCmoSVdBeURffaO5ZZl3w0WceHZvgFUq107MinbX2kTjKS75TONtF?=
 =?us-ascii?Q?pOeYVQD2mya4cboxTDaW4s1VJTkZcRxSYNZbc3DZN4KVLkMoVCYrfNQNgxvW?=
 =?us-ascii?Q?20+1Hd7s+Zdwutuko/4EceM0e7O3QlXwbuc1GZnU?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a9ed9647-93cf-48ee-ff6a-08dbb11764ea
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB8690.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2023 09:30:24.0142
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: D3fySWlZ2q1XG7uCIkYgG0aAdTMQDr8rYLjf4wI6C+T6GFFr5YZRR9IwNxJlhEkwpjalvhJDabwc55OavRRs+g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7166

On Thu, Aug 31, 2023 at 06:43:17PM +0800, Akihiko Odaki wrote:
> On 2023/08/31 18:32, Huang Rui wrote:
> > From: Antonio Caggiano <antonio.caggiano@collabora.com>
> > 
> > Add support for the Venus capset, which enables Vulkan support through
> > the Venus Vulkan driver for virtio-gpu.
> > 
> > Signed-off-by: Antonio Caggiano <antonio.caggiano@collabora.com>
> > Signed-off-by: Huang Rui <ray.huang@amd.com>
> > ---
> >   hw/display/virtio-gpu-virgl.c               | 21 +++++++++++++++++----
> >   include/standard-headers/linux/virtio_gpu.h |  2 ++
> >   2 files changed, 19 insertions(+), 4 deletions(-)
> > 
> > diff --git a/hw/display/virtio-gpu-virgl.c b/hw/display/virtio-gpu-virgl.c
> > index 1a996a08fc..83cd8c8fd0 100644
> > --- a/hw/display/virtio-gpu-virgl.c
> > +++ b/hw/display/virtio-gpu-virgl.c
> > @@ -437,6 +437,11 @@ static void virgl_cmd_get_capset_info(VirtIOGPU *g,
> >           virgl_renderer_get_cap_set(resp.capset_id,
> >                                      &resp.capset_max_version,
> >                                      &resp.capset_max_size);
> > +    } else if (info.capset_index == 2) {
> > +        resp.capset_id = VIRTIO_GPU_CAPSET_VENUS;
> > +        virgl_renderer_get_cap_set(resp.capset_id,
> > +                                   &resp.capset_max_version,
> > +                                   &resp.capset_max_size);
> >       } else {
> >           resp.capset_max_version = 0;
> >           resp.capset_max_size = 0;
> > @@ -901,10 +906,18 @@ int virtio_gpu_virgl_init(VirtIOGPU *g)
> >   
> >   int virtio_gpu_virgl_get_num_capsets(VirtIOGPU *g)
> >   {
> > -    uint32_t capset2_max_ver, capset2_max_size;
> > +    uint32_t capset2_max_ver, capset2_max_size, num_capsets;
> > +    num_capsets = 1;
> > +
> >       virgl_renderer_get_cap_set(VIRTIO_GPU_CAPSET_VIRGL2,
> > -                              &capset2_max_ver,
> > -                              &capset2_max_size);
> > +                               &capset2_max_ver,
> > +                               &capset2_max_size);
> > +    num_capsets += capset2_max_ver ? 1 : 0;
> > +
> > +    virgl_renderer_get_cap_set(VIRTIO_GPU_CAPSET_VENUS,
> > +                               &capset2_max_ver,
> > +                               &capset2_max_size);
> > +    num_capsets += capset2_max_size ? 1 : 0;
> >   
> > -    return capset2_max_ver ? 2 : 1;
> > +    return num_capsets;
> >   }
> > diff --git a/include/standard-headers/linux/virtio_gpu.h b/include/standard-headers/linux/virtio_gpu.h
> > index 2da48d3d4c..2db643ed8f 100644
> > --- a/include/standard-headers/linux/virtio_gpu.h
> > +++ b/include/standard-headers/linux/virtio_gpu.h
> > @@ -309,6 +309,8 @@ struct virtio_gpu_cmd_submit {
> >   
> >   #define VIRTIO_GPU_CAPSET_VIRGL 1
> >   #define VIRTIO_GPU_CAPSET_VIRGL2 2
> > +/* 3 is reserved for gfxstream */
> > +#define VIRTIO_GPU_CAPSET_VENUS 4
> 
> This file is synced with scripts/update-linux-headers.sh and should not 
> be modified.

Should I add marco in kernel include/uapi/linux/virtio_gpu.h?

They are used at VIRGL_RENDERER_UNSTABLE_APIS in virglrender.

enum virgl_renderer_capset {
   VIRGL_RENDERER_CAPSET_VIRGL                   = 1,
   VIRGL_RENDERER_CAPSET_VIRGL2                  = 2,
   /* 3 is reserved for gfxstream */
   VIRGL_RENDERER_CAPSET_VENUS                   = 4,
   /* 5 is reserved for cross-domain */
   VIRGL_RENDERER_CAPSET_DRM                     = 6,
};

Thanks,
Ray

> 
> >   
> >   /* VIRTIO_GPU_CMD_GET_CAPSET_INFO */
> >   struct virtio_gpu_get_capset_info {

