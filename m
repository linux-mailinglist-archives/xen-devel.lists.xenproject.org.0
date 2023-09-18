Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CE787A408B
	for <lists+xen-devel@lfdr.de>; Mon, 18 Sep 2023 07:44:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.603763.940822 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qi736-0006tB-U3; Mon, 18 Sep 2023 05:43:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 603763.940822; Mon, 18 Sep 2023 05:43:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qi736-0006rP-R9; Mon, 18 Sep 2023 05:43:56 +0000
Received: by outflank-mailman (input) for mailman id 603763;
 Mon, 18 Sep 2023 05:43:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=5am5=FC=amd.com=Ray.Huang@srs-se1.protection.inumbo.net>)
 id 1qi735-0006rJ-2S
 for xen-devel@lists.xenproject.org; Mon, 18 Sep 2023 05:43:55 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on20619.outbound.protection.outlook.com
 [2a01:111:f400:fe59::619])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5928f305-55e6-11ee-8788-cb3800f73035;
 Mon, 18 Sep 2023 07:43:53 +0200 (CEST)
Received: from SJ2PR12MB8690.namprd12.prod.outlook.com (2603:10b6:a03:540::10)
 by PH8PR12MB7255.namprd12.prod.outlook.com (2603:10b6:510:224::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.30; Mon, 18 Sep
 2023 05:43:49 +0000
Received: from SJ2PR12MB8690.namprd12.prod.outlook.com
 ([fe80::c3b:811:fd1d:c33e]) by SJ2PR12MB8690.namprd12.prod.outlook.com
 ([fe80::c3b:811:fd1d:c33e%6]) with mapi id 15.20.6792.021; Mon, 18 Sep 2023
 05:43:49 +0000
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
X-Inumbo-ID: 5928f305-55e6-11ee-8788-cb3800f73035
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VsMB2gW1KCEt8dj44U0fntkiGnm35FIBYHCD4qgsNftzz+vMbQ5PTA840CALCCSVOo5pv5FXdak+sd5PR8Bf9WwTfLD5fBD1CXPAL9BYba19ywRKCYd6wQqTtuG7GussHSUbFzWyHcA6a9wOOsC5v1OdG1hy765//GqQIBWF1PIt1RY27F6ZPOd9rzejaWtWnbgSmzV0aM34f0EVElgzRoO9WoHAPo6ID7c4VbH5qg+vKTzkv+eM0whZ8L8p7gyjg3UNQLh+yISvr3fgDf1vdfV4OZmHYLYAVASYdNpDXwWkx8Vf6iIn5BHp1C1aPJC2HrWOdpsTmiZwj9HnFAoiww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CvkDqnlAF7rRETsb5K84Hk+N3n6r/77QPcFyf6zIN/E=;
 b=Tt+gu8QbEcrYBJJ8w4jzCd7gdrFyfKxDbVji80nL+cWP89hZF3BuXMgjYdWtkdoFFXxnEVYFJIWXmpc/EJjrTDwEnhI+a07MTduXZ9/XtPsrEMbV4f/DLfcOhrPGnxacYO/BxvOwBq2BObYM6qwxEEtGbfHWyN3Vf2zidcKfhgB4zQ7Y5AviRTPB0gILaZ3gLYyW5Sujzzr5ecO6/E1nny/R8R8PNG7pOQZ8lRmBc9AC5X411BH7Ycuhpvy6dTZNyqUunH+tzUCENnSgl+c5mBZfxK5Yh1vDbZfA08TOj8nOcpb8/divajZpM0A7FAyKr14g57Id1bT474lKZSQRFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CvkDqnlAF7rRETsb5K84Hk+N3n6r/77QPcFyf6zIN/E=;
 b=4PFc0UUR64nfsyXwOlFfKniNc2aBwYSs6WOl+zgDT8vFXAq/wolW4ao11smIWLktvJKmlVeMtt67HLcoQfqrJOEOtj3QQhE44VixX0EqeBzXE02HT8+tPBaMaisUxwQyElzpixSEQrTr0KnInG0FwnSA0gxAj79VZiKeM9Yarsc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Date: Mon, 18 Sep 2023 13:43:19 +0800
From: Huang Rui <ray.huang@amd.com>
To: Akihiko Odaki <akihiko.odaki@daynix.com>
Cc: Gerd Hoffmann <kraxel@redhat.com>,
	"Michael S . Tsirkin" <mst@redhat.com>,
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
Subject: Re: [QEMU PATCH v5 06/13] virtio-gpu: Support context init feature
 with virglrenderer
Message-ID: <ZQfjd9DsMTwxlPKF@amd.com>
References: <20230915111130.24064-1-ray.huang@amd.com>
 <20230915111130.24064-7-ray.huang@amd.com>
 <561abf48-d72c-467d-94fd-54ffa1dfb512@daynix.com>
 <ZQWEQ9ZHkokhKOSA@amd.com>
 <d671bfad-7d78-41cf-a6f4-e92bf6ce2bd5@daynix.com>
 <ZQaSbaCUQ6iiHI/Y@amd.com>
 <568e9a08-c09c-4695-8165-04d3817b09f3@daynix.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <568e9a08-c09c-4695-8165-04d3817b09f3@daynix.com>
X-ClientProxiedBy: SI1PR02CA0004.apcprd02.prod.outlook.com
 (2603:1096:4:1f7::12) To SJ2PR12MB8690.namprd12.prod.outlook.com
 (2603:10b6:a03:540::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR12MB8690:EE_|PH8PR12MB7255:EE_
X-MS-Office365-Filtering-Correlation-Id: 4c843311-5657-4a3a-1889-08dbb80a3afa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ftcUfFM11Q69st5G3GHZdW+bvhniT5e1WaPLnOPfT5QXYE20Dup9fMmBv/UiAWRunIQ3BPOka1L8SFYkwvNx22WHpCZ4T7+H3ux5BqamPFIJcIvoQ0vaqneK+JZzpB+qw7NDysucVvNMS6ukTYSVz7df7GsIhyYrtzWZI4IzaIVPxhOGQNRezZKEP+FkI01TX4YhKyDdDrXoOHgZGLRmKfiGQow11ejvC3UoRD9gHmt34DINapiylzgfS258ydRqqTkDG7rOdh5wqggbRCSq7RZ6/l4tFs38lnHheP7xYmoh2WRnWsvsZ/YLit42NxSWiWYlFuJIUd44q40X44IDN8Adrx+YLiDhhqp/RuH4Sa6Mh+NpinfmREUle3GoXGKZE4kSf8DXHm6h0/0tUCeCFZ8W1KkB0/J/9wFfs51lc8BaL6d/VdUQoYykWjm5utV6eT7NJXupXyE8BdPzE8P50/xeUPo0Zrj6z655Slwy1a+kKTRhMsfi1DW5WqK2WbhFUAZWqDtgI9urnxrc95P2nrM6jCRnZJgDONvS/IlqYIM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR12MB8690.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(136003)(366004)(376002)(396003)(346002)(1800799009)(186009)(451199024)(6506007)(6666004)(6486002)(53546011)(36756003)(66946007)(7416002)(8936002)(83380400001)(5660300002)(966005)(478600001)(6512007)(66556008)(41300700001)(2906002)(26005)(2616005)(54906003)(66476007)(6916009)(8676002)(316002)(38100700002)(86362001)(4326008)(66899024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?guc15RriW+bLtVkRh5X1t074X39rTBIHqWRF1jcaVL+VQWnCu9HT8k5KQ0FN?=
 =?us-ascii?Q?v+rHADOVc5WpCYJ8O91Ugq8oEdOjcHFahg22wbXWeouzSuJqYt4r2uZ7XTPb?=
 =?us-ascii?Q?UL/GEyiRe9olDr/3oeUfxcOV6W39gvUygbdkEqCoMuGS8b3bYfsXMM6ehxJf?=
 =?us-ascii?Q?KL02bS8NvJ+btYv1YwD9UwsuO9apbIkp4EU8C9yo1sjPlqtSj/Nyx4pNw9e+?=
 =?us-ascii?Q?JmrXAiiay9sEdcsrdnZtsCuTlrTZzVIAM0Gvm9R60z295bIiRbRfxYW/MEnn?=
 =?us-ascii?Q?/8uqK8MYK4WXzIIHN75c1TLs5rz+vctVyXkt9ZkFmHXKVmUHzCIP/5s8B2zb?=
 =?us-ascii?Q?WZnSYVuSqcBYCE0jAzeBljDKL5R99y3LPhydObRJylFgr+8cN/8jT6/mU+WD?=
 =?us-ascii?Q?+KP7dhstBBrQUBvBQPs3sWFeoYtykar0ZSs0cQvilldTGWTEMEoqARSzBLSg?=
 =?us-ascii?Q?oiz4tvah8ErIDLUWpU8xj1K/3t+mAUgL4eY3TtiJ5iomtVSMR/YkysID3wX7?=
 =?us-ascii?Q?i6CIn7VoSD+0CoFCKMCV/OuAcxAFhPqmK1RqE7hpso3U8PG8J41ViNvkz48M?=
 =?us-ascii?Q?j3WpsEu5mtZ1mhC8CNQEJPT0+kMbW2qaMLc4Gv04l3SAVTm1B7cWRTUcD7Yf?=
 =?us-ascii?Q?dtXBN0Tknx+pB1i2X3SKMjm/mnD79QjQ75RCszH65uCL80sBpJXimIlUA/fh?=
 =?us-ascii?Q?xC5cPaZBeQvVBGUdcgNIGLo5aXCOLY+N+/nlxIWYLp+l1bCz36rvsFc3lHWa?=
 =?us-ascii?Q?iCYwB6M8w9q/uti0FA9TFG4ynqnUS4NryfD1Ng91AoRadQ7QWSUEmytCXew8?=
 =?us-ascii?Q?zzQxM+9eugh0BO1ds1P1SNwyvMpQb1Quo+3U03CZcsc7zg/K9pAnSEJ07wyB?=
 =?us-ascii?Q?v9ZsDxYvd5lkW4zbK1AsblN3LykAvH/5VB6JUeYQ1YghQq7D3IOjToJo1w8t?=
 =?us-ascii?Q?UFAiNkh8cYqJziCSpa5stmQ+Pn0E71wy9xDOPwsggNR1z5x7+S5A2kjnbupu?=
 =?us-ascii?Q?O9NnGbNPRgh4F8A3e06WWLUtPcJYFQHgPxM72uRKpd/8ZiwvvCavFtYN3rkg?=
 =?us-ascii?Q?15eIb+X0id8lBVJBH1LAQZr1XtRhK0N9PBj5Q/NW6BMFRCTbGVCnc1qlG9+E?=
 =?us-ascii?Q?r3m5frdPvSz22elUMsGrk1x2DPlnLMhwBr0aVxd42eWHp8TL8XJOV3qPD7NQ?=
 =?us-ascii?Q?3p0IpmDGp0V3hu9/cNopqa9+8sJNgXRkyT6wdcXcTLFXXPla/inZFKE1HP/N?=
 =?us-ascii?Q?ByDToXhPI9B5iTya1skFYzvmGkT5YjBOddN6MziTkYpz/TJEsMb+drZV/uZN?=
 =?us-ascii?Q?OscLnWOMsDyUfrXmOhMdBAgeiZa9CqNwlyYBujh4g8MG5Fs2sD7EEnZqJPea?=
 =?us-ascii?Q?5RpJK/KqKBZMcHbfrRzhN9INj0hUdQcU82N6C3xbp/2qnn8HFFqDSncQi+ZY?=
 =?us-ascii?Q?E+WDoQJ7CXZHZc2qtAnLDnqfmNMXDT5Jw1JIFC64juopwlh1D4GaPB2wqZgK?=
 =?us-ascii?Q?0D/zV4gTFPaEK33e1KpE9vBS7XhuSLWRvvuKAHplvtElMe1KRIpzz79idt41?=
 =?us-ascii?Q?n8SFLcNMcc/45zV02hr/zh7ZO1SANo3JezrOAKT9?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c843311-5657-4a3a-1889-08dbb80a3afa
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB8690.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2023 05:43:48.6541
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5M2/wBbrH4dtFWN3LL/iEjleo/sZajwNvWAW9taU1SS44HVbOPrKcPNhvZkdboRFcVVE+bk5P/e5+8leWxBgAg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7255

On Sun, Sep 17, 2023 at 01:49:19PM +0800, Akihiko Odaki wrote:
> On 2023/09/17 14:45, Huang Rui wrote:
> > On Sat, Sep 16, 2023 at 06:42:04PM +0800, Akihiko Odaki wrote:
> >> On 2023/09/16 19:32, Huang Rui wrote:
> >>> On Fri, Sep 15, 2023 at 11:20:46PM +0800, Akihiko Odaki wrote:
> >>>> On 2023/09/15 20:11, Huang Rui wrote:
> >>>>> Patch "virtio-gpu: CONTEXT_INIT feature" has added the context_init
> >>>>> feature flags.
> >>>>> We would like to enable the feature with virglrenderer, so add to create
> >>>>> virgl renderer context with flags using context_id when valid.
> >>>>>
> >>>>> Originally-by: Antonio Caggiano <antonio.caggiano@collabora.com>
> >>>>> Signed-off-by: Huang Rui <ray.huang@amd.com>
> >>>>> ---
> >>>>>
> >>>>> V4 -> V5:
> >>>>>        - Inverted patch 5 and 6 because we should configure
> >>>>>          HAVE_VIRGL_CONTEXT_INIT firstly. (Philippe)
> >>>>>
> >>>>>     hw/display/virtio-gpu-virgl.c | 13 +++++++++++--
> >>>>>     hw/display/virtio-gpu.c       |  2 ++
> >>>>>     2 files changed, 13 insertions(+), 2 deletions(-)
> >>>>>
> >>>>> diff --git a/hw/display/virtio-gpu-virgl.c b/hw/display/virtio-gpu-virgl.c
> >>>>> index 8bb7a2c21f..312953ec16 100644
> >>>>> --- a/hw/display/virtio-gpu-virgl.c
> >>>>> +++ b/hw/display/virtio-gpu-virgl.c
> >>>>> @@ -106,8 +106,17 @@ static void virgl_cmd_context_create(VirtIOGPU *g,
> >>>>>         trace_virtio_gpu_cmd_ctx_create(cc.hdr.ctx_id,
> >>>>>                                         cc.debug_name);
> >>>>>     
> >>>>> -    virgl_renderer_context_create(cc.hdr.ctx_id, cc.nlen,
> >>>>> -                                  cc.debug_name);
> >>>>> +    if (cc.context_init) {
> >>>>> +#ifdef HAVE_VIRGL_CONTEXT_INIT
> >>>>> +        virgl_renderer_context_create_with_flags(cc.hdr.ctx_id,
> >>>>> +                                                 cc.context_init,
> >>>>> +                                                 cc.nlen,
> >>>>> +                                                 cc.debug_name);
> >>>>> +        return;
> >>>>> +#endif
> >>>>
> >>>> This should deal with the case when context_init is set while
> >>>> HAVE_VIRGL_CONTEXT_INIT is not defined.
> >>>
> >>> Actually, I received the comment below before:
> >>>
> >>> https://lore.kernel.org/qemu-devel/32588d0e-a1f2-30c4-5e9f-e6e7c4190b65@linaro.org/
> >>>
> >>> At original patch set, I have the case while HAVE_VIRGL_CONTEXT_INIT is set
> >>> but HAVE_VIRGL_CONTEXT_INIT is not defined. But I think we may encounter
> >>> the case that virgl_renderer_context_create_with_flags is not defined in
> >>> virglrenderer early version. Should I bring the error message back?
> >>>
> >>> Thanks,
> >>> Ray
> >>
> >> I suggest checking VIRTIO_GPU_FLAG_CONTEXT_INIT_ENABLED instead of
> >> reporting an error here. Perhaps it may be easier to add #ifdef around:
> >>   > +    DEFINE_PROP_BIT("context_init", VirtIOGPU, parent_obj.conf.flags,
> >>   > +                    VIRTIO_GPU_FLAG_CONTEXT_INIT_ENABLED, false),
> > 
> > How about below changes: >
> > ---
> > diff --git a/hw/display/virtio-gpu-virgl.c b/hw/display/virtio-gpu-virgl.c
> > index 8bb7a2c21f..54a3cfe136 100644
> > --- a/hw/display/virtio-gpu-virgl.c
> > +++ b/hw/display/virtio-gpu-virgl.c
> > @@ -106,8 +106,15 @@ static void virgl_cmd_context_create(VirtIOGPU *g,
> >       trace_virtio_gpu_cmd_ctx_create(cc.hdr.ctx_id,
> >                                       cc.debug_name);
> > 
> > -    virgl_renderer_context_create(cc.hdr.ctx_id, cc.nlen,
> > -                                  cc.debug_name);
> > +    if (cc.context_init && virtio_gpu_context_init_enabled(g->conf)) {
> > +        virgl_renderer_context_create_with_flags(cc.hdr.ctx_id,
> > +                                                 cc.context_init,
> > +                                                 cc.nlen,
> > +                                                 cc.debug_name);
> > +        return;
> > +    }
> > +
> > +    virgl_renderer_context_create(cc.hdr.ctx_id, cc.nlen, cc.debug_name);
> >   }
> > 
> >   static void virgl_cmd_context_destroy(VirtIOGPU *g,
> > diff --git a/hw/display/virtio-gpu.c b/hw/display/virtio-gpu.c
> > index be16efbd38..6ff2c8e92d 100644
> > --- a/hw/display/virtio-gpu.c
> > +++ b/hw/display/virtio-gpu.c
> > @@ -1508,6 +1508,10 @@ static Property virtio_gpu_properties[] = {
> >       DEFINE_PROP_BIT("blob", VirtIOGPU, parent_obj.conf.flags,
> >                       VIRTIO_GPU_FLAG_BLOB_ENABLED, false),
> >       DEFINE_PROP_SIZE("hostmem", VirtIOGPU, parent_obj.conf.hostmem, 0),
> > +#ifdef HAVE_VIRGL_CONTEXT_INIT
> > +    DEFINE_PROP_BIT("context_init", VirtIOGPU, parent_obj.conf.flags,
> > +                    VIRTIO_GPU_FLAG_CONTEXT_INIT_ENABLED, true),
> > +#endif
> >       DEFINE_PROP_END_OF_LIST(),
> >   };
> > 
> 
> It looks better, but not having #ifdef around 
> virgl_renderer_context_create_with_flags() will result in a link error 
> with old virglrenderer.

Hmm, right, it seems that we have to have a "#ifdef" around here. Or do you
have any better idea?

Thanks,
Ray

