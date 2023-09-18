Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D3057A40F7
	for <lists+xen-devel@lfdr.de>; Mon, 18 Sep 2023 08:21:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.603776.940841 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qi7dT-0004YK-0H; Mon, 18 Sep 2023 06:21:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 603776.940841; Mon, 18 Sep 2023 06:21:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qi7dS-0004We-Ts; Mon, 18 Sep 2023 06:21:30 +0000
Received: by outflank-mailman (input) for mailman id 603776;
 Mon, 18 Sep 2023 06:21:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=5am5=FC=amd.com=Ray.Huang@srs-se1.protection.inumbo.net>)
 id 1qi7dR-0004WY-4r
 for xen-devel@lists.xenproject.org; Mon, 18 Sep 2023 06:21:29 +0000
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on20629.outbound.protection.outlook.com
 [2a01:111:f400:7e8d::629])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 97f857e2-55eb-11ee-9b0d-b553b5be7939;
 Mon, 18 Sep 2023 08:21:26 +0200 (CEST)
Received: from SJ2PR12MB8690.namprd12.prod.outlook.com (2603:10b6:a03:540::10)
 by IA0PR12MB8327.namprd12.prod.outlook.com (2603:10b6:208:40e::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.24; Mon, 18 Sep
 2023 06:21:22 +0000
Received: from SJ2PR12MB8690.namprd12.prod.outlook.com
 ([fe80::c3b:811:fd1d:c33e]) by SJ2PR12MB8690.namprd12.prod.outlook.com
 ([fe80::c3b:811:fd1d:c33e%6]) with mapi id 15.20.6792.021; Mon, 18 Sep 2023
 06:21:21 +0000
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
X-Inumbo-ID: 97f857e2-55eb-11ee-9b0d-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GODwSbYD/TLyhzQtBNlleOJdiKUPVBTQYFDE/uCJ00MrHTZFIGgdlYBU4shmFCFiotK4w4vCf+MXILAOqlmobv4Yr/lpc9d82q6d8FXfIJNJ2ZAZA10WY/8c/lU4ty7sgaCUJcyuQilwH1hsaLOK/550Svcsa6nfXBeIwV8EUH4RbPSEIZL0VENHWeIsU2bg5qGm5XTsg4pRnAvhqPIeZCwaDYQazRDptjC9Ahw6FKfbXeNVeQlpBKa+ieJoe06lQqJCFXnnQvHtN7sqPzP9Co9Kjgb4U45omfsZGVZRWEQZKWVSjzOWJ92Al4d+SqOLDFt4kxR3BLgK3envAxE5Dg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0Da3cTb/vjzR6oWrSblfCyseVniFgVYtKaBzX3Wa7jY=;
 b=N+Z0KXFFkP3Z8k6ZCnWApx51L1ZaehWmwK9AjV00sj6YogTovA9kUPTLC1F1+FYnribCZPnlOb81+aV6Ni1RmHaqGaQZf3vII3HJTyZ1B3JnSMUTo0qRHm76p3YO76VvNKiLKvwpEOiBYJn919VV4kXgKlJROLxxU5T/0Z+sZD6hbTadVUo9OHr1w4LMm4cCHGzDBSu0LMWzNWCmdfnsCLHtcsgfJKZjEEtmclbNB5KmZy0vfj/BNAEiTD0rTIpgKs2X86//dB+WwwdnCygujsL6CmvF4muj9qdo66IzQ2NKVrG4JAU1mbsrQ3rloYhYFolAoPE1RtAWCaoGZfHbPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0Da3cTb/vjzR6oWrSblfCyseVniFgVYtKaBzX3Wa7jY=;
 b=OthMsbkrLM9VaMg6gYjfTciOpvy3HbyAjcwf64pruahRwhT/ssGl/hwTW9FSlQeRo1VekjLoCMO/WvZEcgwOwhP9Luk/3LPkcvEL+ve8qAklsdsuUKMggFNtOTkq2OtfwbYDNs3pgnDiq2aOR1YEEJv4oNz25T7enNTGmwJqEeE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Date: Mon, 18 Sep 2023 14:20:52 +0800
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
Message-ID: <ZQfsRDk/H3VMDgw+@amd.com>
References: <20230915111130.24064-1-ray.huang@amd.com>
 <20230915111130.24064-7-ray.huang@amd.com>
 <561abf48-d72c-467d-94fd-54ffa1dfb512@daynix.com>
 <ZQWEQ9ZHkokhKOSA@amd.com>
 <d671bfad-7d78-41cf-a6f4-e92bf6ce2bd5@daynix.com>
 <ZQaSbaCUQ6iiHI/Y@amd.com>
 <568e9a08-c09c-4695-8165-04d3817b09f3@daynix.com>
 <ZQfjd9DsMTwxlPKF@amd.com>
 <6e4887e7-f850-43aa-b9c6-6eb80b37bbc2@daynix.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6e4887e7-f850-43aa-b9c6-6eb80b37bbc2@daynix.com>
X-ClientProxiedBy: SI2PR01CA0023.apcprd01.prod.exchangelabs.com
 (2603:1096:4:192::17) To SJ2PR12MB8690.namprd12.prod.outlook.com
 (2603:10b6:a03:540::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR12MB8690:EE_|IA0PR12MB8327:EE_
X-MS-Office365-Filtering-Correlation-Id: 9ef990de-969b-499f-b09c-08dbb80f79e1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	YQY+53BVKzHk/Tc4AqYV7/Odmya3S3XWbo9c/9OlhDXyvpoMazOr4H3BVWoPID2s098GhnH0bmRMxSfxaYtngNzIZDiCWgFHcCaTTgEUJyb+JcR/7rjMuy0ms6iGCivH8SYyjqsMgKWrNkop77OBWuqu9K63D6nc6+xzhRPgrcvrF0/3bBRjC7ELDQMT6fqLTdemZIhCuCHk59fvV27hME7UEjtNGvcB6suNgABUS8KLtpGoIboMJXYq3MbXVBWM7EQmbS8SXlvLCJNE54LSC9+2LX8HA2NK6nme5fMeXy9p4V/2mW5kduLNMQb87rsz0nViLKJzyKWTeCUXL7kY8C793JYsMfJXpXjAUGR3FLlbHZhejirO/YYyJBPHObBjdgbYEYAv+tQET2JOpU7BcirqqxHAcveK0urBYtvAcl0uSeLb+juGMOzuJCfDHtBBsizP6A9PMO9RTtQ34pkPoJQU2opp12EPN8PaSdvXYML6z0D6Rm/3s5NrfMNaRJ75KfHtu+NmZCz6q3wyjH2IPxaRbl1pENsuzflc+XoGoU4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR12MB8690.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(366004)(346002)(396003)(136003)(376002)(451199024)(186009)(1800799009)(66899024)(6486002)(6666004)(6506007)(53546011)(86362001)(38100700002)(36756003)(26005)(2906002)(6512007)(966005)(2616005)(478600001)(83380400001)(5660300002)(8676002)(8936002)(4326008)(41300700001)(7416002)(66946007)(54906003)(316002)(66476007)(66556008)(6916009);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?TjSvLjFhBcohUCXV9iHCIIqP6uHx+8oOw1wVg/rSPoskjghxxVVW5CwfW0z+?=
 =?us-ascii?Q?fAR0T3ci4qwwJNKzoDmlIxSXIE9wFEGE9WDQcuvWg8c/B+sbyPyhm68+VI6p?=
 =?us-ascii?Q?x4tVcJgNEX59JG0lPuad5mtfacgFNfW87wDRw433vmNfzZMAS9x+1e2/HzX6?=
 =?us-ascii?Q?tjFiptfHzTuVfAcQF2xYjaJLqZWe3Tz2B9k5NTc01pNSCZiuYukKmkWkOaXW?=
 =?us-ascii?Q?nyZcP/YNIXGg20w//CxcNw1HqgHw4XIoj9dygvfG9I0Jn51ih1D3PBECQkQM?=
 =?us-ascii?Q?Hh3wGdcP4zoCr8GYslD2Z8+8sT2lni39JGb2efAYLH13QUj2DeggtpQFCflA?=
 =?us-ascii?Q?XVGbomvVtcbTy8KhrkGX+Y+mAwoX/2jzg4SunTPqS/jUxTm5fU1RboJktjLI?=
 =?us-ascii?Q?OKgbsQXVaYWeyPAm0Ksg5jw+gyH5ZsR1jnkvsP0mufclbsBYq3JObDNj2yn9?=
 =?us-ascii?Q?iku63WsI3zaP/gwmcMR42gvFGLGoXGTteJyB0Kbmm6priYFj6HEGDlHecj90?=
 =?us-ascii?Q?YMj/TKwsGmwQThTAikhhJ4080iwtzRM1mOJ4PT1z2wOTOQf0JyY8SDDC48Dp?=
 =?us-ascii?Q?vCXgczUMGyGDHzm7WOwvJA/4jBImDhNPSKcCVRWbBJDHH9VX0iHSAXSDzYmR?=
 =?us-ascii?Q?PhViKHpVnaY/eGlNMEKeDo0MQSF14kHGVGO1doIdMT2DNNAAT3yLfnAeshPA?=
 =?us-ascii?Q?zsEiam/mlPFg56Far4Ifc//vbzcIabqXHRWNmf1Ml71u69Vm/iYww22QqDJW?=
 =?us-ascii?Q?Zk6gCphgHr5728z/z8GeBTsa2S8wWvjhlvPR/Rvavev7bM14ttDnIn7f88Af?=
 =?us-ascii?Q?tIQzWW2ugI9RJgQ9vjYB3LH69+pqQlMlJgXVejclxhQnayIKRcRb8I0vvSHO?=
 =?us-ascii?Q?X+c71uaM96fR/Z0mGD0kiJ81Dc3/r1ap4exgOSKf15meifkL1/nAY5dheF+d?=
 =?us-ascii?Q?mD0EPNms5srN5xF3CdB4OqnG1ke4lEHVDnlJ/V/bjNmNzwpKOtZ3jaSPI/xq?=
 =?us-ascii?Q?yyFqeCUupweLRnI5T2MKwuLARjBGN5cqXX8OX2/benKQopR1DLCxvr0+T8RC?=
 =?us-ascii?Q?2xQ4U2Vru8HKxVqTdtva9KY6BdZapf2rfSyhPu8jcpuAJb+dul7nVhpmI3pn?=
 =?us-ascii?Q?soO9YsOPf8tg54XXvwwhv+O3Smv36czbPjR4uL7Z596+w7FKHIEGwB0XFqRm?=
 =?us-ascii?Q?+NOd8twi4Wjo1DdF+tdXBIUTIP1N3SRxC6qAc4LC4nshBGqQ6ZmMyKGRGpgu?=
 =?us-ascii?Q?+OB5hhf7q2wboqYepLDAlH0fdtF4tfu5fz7RUsgmVe6ClYt0bkmlS9TnWb7w?=
 =?us-ascii?Q?BVHCOOyaoqhyFsBLW34Jyq7IkSPXscVrVBFMDTfKuPI26A8K7ur9C3MNO7t6?=
 =?us-ascii?Q?66ZszHfwOSJCWL0QQUsBFu9Mkgw9hVi6lX/Bpsdzj1W8oAFpPMrMs2G/3X1U?=
 =?us-ascii?Q?6mn8ZF8fA/TkjmwkNcf9Minve1rWl3KroxHG+wIYE4wMITJg899vT7xsjDeT?=
 =?us-ascii?Q?tVmhMEx/lRdYwiU8OI6sFeXwKwbcHsmBsULuSr983LBlLvaeGx3RvooQvAU2?=
 =?us-ascii?Q?ICzQH3YfK8j+KoF/Ecf0J2tiR3efh92e3bWNX3Qr?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ef990de-969b-499f-b09c-08dbb80f79e1
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB8690.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2023 06:21:21.3478
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eWb73uo8Ncute3RvT4asX+2NPaB+rxF+aeCj0g79hrHvHygLjphWpGmXziO5aL4UNPwKRicZ3B36I2J06XHRcw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8327

On Mon, Sep 18, 2023 at 02:07:25PM +0800, Akihiko Odaki wrote:
> On 2023/09/18 14:43, Huang Rui wrote:
> > On Sun, Sep 17, 2023 at 01:49:19PM +0800, Akihiko Odaki wrote:
> >> On 2023/09/17 14:45, Huang Rui wrote:
> >>> On Sat, Sep 16, 2023 at 06:42:04PM +0800, Akihiko Odaki wrote:
> >>>> On 2023/09/16 19:32, Huang Rui wrote:
> >>>>> On Fri, Sep 15, 2023 at 11:20:46PM +0800, Akihiko Odaki wrote:
> >>>>>> On 2023/09/15 20:11, Huang Rui wrote:
> >>>>>>> Patch "virtio-gpu: CONTEXT_INIT feature" has added the context_init
> >>>>>>> feature flags.
> >>>>>>> We would like to enable the feature with virglrenderer, so add to create
> >>>>>>> virgl renderer context with flags using context_id when valid.
> >>>>>>>
> >>>>>>> Originally-by: Antonio Caggiano <antonio.caggiano@collabora.com>
> >>>>>>> Signed-off-by: Huang Rui <ray.huang@amd.com>
> >>>>>>> ---
> >>>>>>>
> >>>>>>> V4 -> V5:
> >>>>>>>         - Inverted patch 5 and 6 because we should configure
> >>>>>>>           HAVE_VIRGL_CONTEXT_INIT firstly. (Philippe)
> >>>>>>>
> >>>>>>>      hw/display/virtio-gpu-virgl.c | 13 +++++++++++--
> >>>>>>>      hw/display/virtio-gpu.c       |  2 ++
> >>>>>>>      2 files changed, 13 insertions(+), 2 deletions(-)
> >>>>>>>
> >>>>>>> diff --git a/hw/display/virtio-gpu-virgl.c b/hw/display/virtio-gpu-virgl.c
> >>>>>>> index 8bb7a2c21f..312953ec16 100644
> >>>>>>> --- a/hw/display/virtio-gpu-virgl.c
> >>>>>>> +++ b/hw/display/virtio-gpu-virgl.c
> >>>>>>> @@ -106,8 +106,17 @@ static void virgl_cmd_context_create(VirtIOGPU *g,
> >>>>>>>          trace_virtio_gpu_cmd_ctx_create(cc.hdr.ctx_id,
> >>>>>>>                                          cc.debug_name);
> >>>>>>>      
> >>>>>>> -    virgl_renderer_context_create(cc.hdr.ctx_id, cc.nlen,
> >>>>>>> -                                  cc.debug_name);
> >>>>>>> +    if (cc.context_init) {
> >>>>>>> +#ifdef HAVE_VIRGL_CONTEXT_INIT
> >>>>>>> +        virgl_renderer_context_create_with_flags(cc.hdr.ctx_id,
> >>>>>>> +                                                 cc.context_init,
> >>>>>>> +                                                 cc.nlen,
> >>>>>>> +                                                 cc.debug_name);
> >>>>>>> +        return;
> >>>>>>> +#endif
> >>>>>>
> >>>>>> This should deal with the case when context_init is set while
> >>>>>> HAVE_VIRGL_CONTEXT_INIT is not defined.
> >>>>>
> >>>>> Actually, I received the comment below before:
> >>>>>
> >>>>> https://lore.kernel.org/qemu-devel/32588d0e-a1f2-30c4-5e9f-e6e7c4190b65@linaro.org/
> >>>>>
> >>>>> At original patch set, I have the case while HAVE_VIRGL_CONTEXT_INIT is set
> >>>>> but HAVE_VIRGL_CONTEXT_INIT is not defined. But I think we may encounter
> >>>>> the case that virgl_renderer_context_create_with_flags is not defined in
> >>>>> virglrenderer early version. Should I bring the error message back?
> >>>>>
> >>>>> Thanks,
> >>>>> Ray
> >>>>
> >>>> I suggest checking VIRTIO_GPU_FLAG_CONTEXT_INIT_ENABLED instead of
> >>>> reporting an error here. Perhaps it may be easier to add #ifdef around:
> >>>>    > +    DEFINE_PROP_BIT("context_init", VirtIOGPU, parent_obj.conf.flags,
> >>>>    > +                    VIRTIO_GPU_FLAG_CONTEXT_INIT_ENABLED, false),
> >>>
> >>> How about below changes: >
> >>> ---
> >>> diff --git a/hw/display/virtio-gpu-virgl.c b/hw/display/virtio-gpu-virgl.c
> >>> index 8bb7a2c21f..54a3cfe136 100644
> >>> --- a/hw/display/virtio-gpu-virgl.c
> >>> +++ b/hw/display/virtio-gpu-virgl.c
> >>> @@ -106,8 +106,15 @@ static void virgl_cmd_context_create(VirtIOGPU *g,
> >>>        trace_virtio_gpu_cmd_ctx_create(cc.hdr.ctx_id,
> >>>                                        cc.debug_name);
> >>>
> >>> -    virgl_renderer_context_create(cc.hdr.ctx_id, cc.nlen,
> >>> -                                  cc.debug_name);
> >>> +    if (cc.context_init && virtio_gpu_context_init_enabled(g->conf)) {
> >>> +        virgl_renderer_context_create_with_flags(cc.hdr.ctx_id,
> >>> +                                                 cc.context_init,
> >>> +                                                 cc.nlen,
> >>> +                                                 cc.debug_name);
> >>> +        return;
> >>> +    }
> >>> +
> >>> +    virgl_renderer_context_create(cc.hdr.ctx_id, cc.nlen, cc.debug_name);
> >>>    }
> >>>
> >>>    static void virgl_cmd_context_destroy(VirtIOGPU *g,
> >>> diff --git a/hw/display/virtio-gpu.c b/hw/display/virtio-gpu.c
> >>> index be16efbd38..6ff2c8e92d 100644
> >>> --- a/hw/display/virtio-gpu.c
> >>> +++ b/hw/display/virtio-gpu.c
> >>> @@ -1508,6 +1508,10 @@ static Property virtio_gpu_properties[] = {
> >>>        DEFINE_PROP_BIT("blob", VirtIOGPU, parent_obj.conf.flags,
> >>>                        VIRTIO_GPU_FLAG_BLOB_ENABLED, false),
> >>>        DEFINE_PROP_SIZE("hostmem", VirtIOGPU, parent_obj.conf.hostmem, 0),
> >>> +#ifdef HAVE_VIRGL_CONTEXT_INIT
> >>> +    DEFINE_PROP_BIT("context_init", VirtIOGPU, parent_obj.conf.flags,
> >>> +                    VIRTIO_GPU_FLAG_CONTEXT_INIT_ENABLED, true),
> >>> +#endif
> >>>        DEFINE_PROP_END_OF_LIST(),
> >>>    };
> >>>
> >>
> >> It looks better, but not having #ifdef around
> >> virgl_renderer_context_create_with_flags() will result in a link error
> >> with old virglrenderer.
> > 
> > Hmm, right, it seems that we have to have a "#ifdef" around here. Or do you
> > have any better idea?
> 
> Having #ifdef is the right direction.

OK, so we can use cc.context_init and make sure context_init function
enabled. Please check below:

---
diff --git a/hw/display/virtio-gpu-virgl.c b/hw/display/virtio-gpu-virgl.c
index 8bb7a2c21f..8363674ebc 100644
--- a/hw/display/virtio-gpu-virgl.c
+++ b/hw/display/virtio-gpu-virgl.c
@@ -106,8 +106,17 @@ static void virgl_cmd_context_create(VirtIOGPU *g,
     trace_virtio_gpu_cmd_ctx_create(cc.hdr.ctx_id,
                                     cc.debug_name);

-    virgl_renderer_context_create(cc.hdr.ctx_id, cc.nlen,
-                                  cc.debug_name);
+    if (cc.context_init && virtio_gpu_context_init_enabled(g->parent_obj.conf)) {
+#ifdef HAVE_VIRGL_CONTEXT_INIT
+        virgl_renderer_context_create_with_flags(cc.hdr.ctx_id,
+                                                 cc.context_init,
+                                                 cc.nlen,
+                                                 cc.debug_name);
+        return;
+#endif
+    }
+
+    virgl_renderer_context_create(cc.hdr.ctx_id, cc.nlen, cc.debug_name);
 }

 static void virgl_cmd_context_destroy(VirtIOGPU *g,
diff --git a/hw/display/virtio-gpu.c b/hw/display/virtio-gpu.c
index be16efbd38..6ff2c8e92d 100644
--- a/hw/display/virtio-gpu.c
+++ b/hw/display/virtio-gpu.c
@@ -1508,6 +1508,10 @@ static Property virtio_gpu_properties[] = {
     DEFINE_PROP_BIT("blob", VirtIOGPU, parent_obj.conf.flags,
                     VIRTIO_GPU_FLAG_BLOB_ENABLED, false),
     DEFINE_PROP_SIZE("hostmem", VirtIOGPU, parent_obj.conf.hostmem, 0),
+#ifdef HAVE_VIRGL_CONTEXT_INIT
+    DEFINE_PROP_BIT("context_init", VirtIOGPU, parent_obj.conf.flags,
+                    VIRTIO_GPU_FLAG_CONTEXT_INIT_ENABLED, true),
+#endif
     DEFINE_PROP_END_OF_LIST(),
 };


