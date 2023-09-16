Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CE637A2F43
	for <lists+xen-devel@lfdr.de>; Sat, 16 Sep 2023 12:37:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.603556.940588 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qhSfm-0008NE-9g; Sat, 16 Sep 2023 10:37:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 603556.940588; Sat, 16 Sep 2023 10:37:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qhSfm-0008Kp-6r; Sat, 16 Sep 2023 10:37:10 +0000
Received: by outflank-mailman (input) for mailman id 603556;
 Sat, 16 Sep 2023 10:37:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=JNh2=FA=amd.com=Ray.Huang@srs-se1.protection.inumbo.net>)
 id 1qhSfl-0008Kj-Lp
 for xen-devel@lists.xenproject.org; Sat, 16 Sep 2023 10:37:09 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on20623.outbound.protection.outlook.com
 [2a01:111:f400:7e8a::623])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fb65ba7e-547c-11ee-9b0d-b553b5be7939;
 Sat, 16 Sep 2023 12:37:07 +0200 (CEST)
Received: from SJ2PR12MB8690.namprd12.prod.outlook.com (2603:10b6:a03:540::10)
 by BN9PR12MB5292.namprd12.prod.outlook.com (2603:10b6:408:105::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.21; Sat, 16 Sep
 2023 10:36:58 +0000
Received: from SJ2PR12MB8690.namprd12.prod.outlook.com
 ([fe80::c3b:811:fd1d:c33e]) by SJ2PR12MB8690.namprd12.prod.outlook.com
 ([fe80::c3b:811:fd1d:c33e%6]) with mapi id 15.20.6792.021; Sat, 16 Sep 2023
 10:36:58 +0000
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
X-Inumbo-ID: fb65ba7e-547c-11ee-9b0d-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HYSGu3CrWw6gARHce09vOajteZ9S8srHKT1Xe2TzDxFWgA8OoK1E95hYwjJ6NkjWALAVa8URKR0fZ4S3C6lfo2WEfSkmuUpQ/C8Ek68LbhyMr90XxYXh+YV3y4/qp2gAbDAM7pU4l7LeOKxgekNTvKiCsf/SWR9VsFKh+NuFLm/rkjSsKDWPDNF4WAwMamxjTtY6IsGX1uyj431NhNPBn+LsnoVdDhnFFda3QU+9z9yERKnjPTC7BgSG4Yw26LZAgNkSKZGgZ4Sw/jgoacyIHCHOgR6tElrIBDTaqJoGzFnNGELTzPHQta/1hB52+HUON7fAuGFuvi47hhT+jmE1EQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P+YAeIhE79Tdyh4UChFST6MFzOP1UNgLVHGwu57RtmI=;
 b=cFrItww3QdflLknNQ2/g7KftOICM6UrihyN80XxV3qkYJGuy72Y6WPDeUu3lLA2vMK5pJvGon8t7jjG9lF2QJDYA0L/LDIfpc14QXrgtQGC39JhSFh14UEPMj0QrjbK/cDtP1aKxRD0Oq87+7/VNikE0YRR2Zhavbxe0iN86jBa6jbSROv5sIGWA1UzBZc06k+7gerZSmBlEWaFrYrPWkp94LbMQnYyQZc51lDUlxgm7TvB0Bi5M+y1k1u5YfD16x2uAZfO9bJ+zrIiWCueXHCRjjBUttqV+Tm8fCmC4SIGLzGC5Ne0z58WZZ9hAwDCaUzn+8cMrajVUnD0vNf4urw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P+YAeIhE79Tdyh4UChFST6MFzOP1UNgLVHGwu57RtmI=;
 b=sdbWjfZtaZQ9gFaNQKmdfAr16uL/O7UwVr4G7LQavuojgEMMIHf8JLmjN36OXgP3IGZFXc/qI+2cr0iMvtSm8gsnWwFPfqaFAAAj7HkdQbVcEQBFO2B0vVZGtxUUJO2pzOZwBEtyqR4bO7WD+CFQ88sCBvmiQDI/2o6/PrsWmgw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Date: Sat, 16 Sep 2023 18:36:30 +0800
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
Message-ID: <ZQWFLiQk29Z6D1nS@amd.com>
References: <20230915111130.24064-1-ray.huang@amd.com>
 <20230915111130.24064-7-ray.huang@amd.com>
 <37ed7472-428f-4a5a-8ac9-fd2a7ab05691@daynix.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <37ed7472-428f-4a5a-8ac9-fd2a7ab05691@daynix.com>
X-ClientProxiedBy: SGXP274CA0014.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b8::26)
 To SJ2PR12MB8690.namprd12.prod.outlook.com (2603:10b6:a03:540::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR12MB8690:EE_|BN9PR12MB5292:EE_
X-MS-Office365-Filtering-Correlation-Id: 7c6ede19-93e8-4724-7b31-08dbb6a0da6c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	gkuBJQ41XyyDxXnwsBgZjho7/50plfQuV+3PAYlPl3LvVYqFsNEvLCFGVfOjoLN5i/Gy/g10j72EGxYAnu28K0R3AUwf4yxr0w7JlyiWhMK/SwhlwFrMWf94j3pKifXh0qda7wKunhsKGl+ZBVWRV2aBEyToRQl73pN4pzFFhfjDP2hHxO3Kj5ng9oNHQSvHvVoI5RoC3c9z7CRQ9VbOMYg/Qq1pIC7vpuvH/Iig+deosnMwdt7yeDN7ie2XrVCwhmjEyvdYggBxF4TEIDQI/pcoN23sYAw9/9rKQh7JP27lVGUV+WcY1KN4ShruIzI3k3+xsxybeuY8jkvP59pvK+pkSc22+n1Fz46PjjPVFDEYeZMYzcSPZIpr3Jb3mhucatYLq3e3BrF2C3VohGAECy+WWXmIICIJcFulAJNA7ehBkW9b9JFatgNw1gwLKxBrZ/QCAPyTSg8MKCfAqF75d8Ut4382fDGh4/ZVk6NBof1B6hN0OnAiBUuGCcxIn/ukmZI2KBFsTCDzKiuYYqMAmvfx1sU/bSgcHVg1DUrm7YM7SW4PjgSZ9w+Fxnck8a7B
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR12MB8690.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(39860400002)(366004)(346002)(376002)(136003)(1800799009)(451199024)(186009)(6486002)(6506007)(53546011)(6512007)(6666004)(38100700002)(36756003)(83380400001)(26005)(2616005)(2906002)(8936002)(86362001)(41300700001)(7416002)(4326008)(8676002)(316002)(54906003)(66556008)(6916009)(66476007)(66946007)(478600001)(5660300002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?v6b7rycCLR+4bS89xn82xK+4sJuAxgnOfA3+BlUrucMgGbkdRuFrO/aHuCRN?=
 =?us-ascii?Q?3v2sof30lMry14CjJU2m0bT1lg5NFmR7Dy/Qm+mdsfX1vwf6KifLSwfwJQG/?=
 =?us-ascii?Q?BeH7q1p8pnr04Sk2zX3odE35OMhKu1sHMyUJTl+d5M8V2m5RCxRwhpOMgABB?=
 =?us-ascii?Q?iELHzOqgkmS1ZRO2V031NlyNaMJ6ZyTS1eBAFqOTQMFwIbgn5BBhyVa63mwN?=
 =?us-ascii?Q?oGDH6/nIgqMXBMsK4FM0zIX0dM9xPOKol4oqg30SMWM6uDAG9ufT3tV1wEVA?=
 =?us-ascii?Q?EzDyMoFNZEvMOzS1WY7L/R0W0DIIVNzE6A1eRDGj2Dbb2EFtPlx+g4EAd/b7?=
 =?us-ascii?Q?60zEiGpv95/t5cofxahDnOsBAUGyFbl9O8t2rpPP3PyV3mHicEl94K5kh/E+?=
 =?us-ascii?Q?je/pVwASR3UlesDAvYJBSE6Ph9QM2Vu8Ob69r+akB1uYqZaYP56T3X2vHDPB?=
 =?us-ascii?Q?HSA/XGycnxv1jOUa4yGJ04VTKXBDSPSVim1qTVIrvo2ShNVd8FI2gXmcscFH?=
 =?us-ascii?Q?vv/SsqzEyGFrva/3FQq9xd5UwGqni6TuXuILZkOxB8qHKCILM4MYebi7H4iH?=
 =?us-ascii?Q?/jMDDEw+eaMKrPWwk8JZIqD0g1WxG2Wvnh6vSAWCwR2K0HRPJuD04NHUFM3i?=
 =?us-ascii?Q?PSIJou/3LrkxTz49tECeXluDAo6IKlDEiXr3GFdgP4/af5RWXuY21DzPFcM0?=
 =?us-ascii?Q?3Kp9EXcV5WrIyiapXWWtmJQhQtS54tNAXer94iTJu36O9WfDSH8mb/isphtl?=
 =?us-ascii?Q?I+kG9LKikZ38ga+q7XHKsH9zebU+xDynRBUUEcCFO2fiNGb5SXBLUZvrrPvB?=
 =?us-ascii?Q?5+43rflpHRW1Zvj2KdaYKXHQ94pnOuMQqUKYw3ASW96aD2S1f71plDxFs23M?=
 =?us-ascii?Q?TzfnwnN/dmmBCkxupTdkQ8eVPeR/t9h3VDfvj7NCZrMzQqT/KdhoxlOfh74F?=
 =?us-ascii?Q?6RQgW6ysHg0zE5SOP7YDcH0traDQLMl/Exny3YB6F1Ckx1378QprpK4KDi0E?=
 =?us-ascii?Q?U0tyJrRsQRtjAnqJqBu5XUTs9rZwEIod1Pa4MXKXG7dIOo/HC++AQAJc7qYH?=
 =?us-ascii?Q?xhvBFpee9dkZZaURgvanij2Ooh6QHsPlcSanoFkCWx0c5DlVG9GFusLe1CYV?=
 =?us-ascii?Q?JseeqAL9eclYhbhT59mPX8adB/xRGeJn+o1ak0ch9NRRZfS9Z2j2Z9ZncW49?=
 =?us-ascii?Q?GWS6mvteBGaBacM29zzOrkzvYCKXM7p+wNwWGUtOaH0/IAsOFzgDaPrI9bVv?=
 =?us-ascii?Q?l5jTnVCyWLFnKvgkKqRXX1Rd/bF8zErZXqwEs9g35l4CrROMAoJYLinflug3?=
 =?us-ascii?Q?iCaf6c8yBdzl4wODlmXMSRVi3WDuhsLEfFm93lZLVxzeUlkw3/HVDAKZ1vt+?=
 =?us-ascii?Q?Dz3CJmTWFPA3ROHl4UGGkeh3HmiOMSwtFEr2vdnCnWa7wcGE0wTD1/SVC7LK?=
 =?us-ascii?Q?fKwRn8lWAmFtdj5CSY7VdYS6kENcrhYLInH7zQiBwueC9GL4gDXSAbFhlf5Y?=
 =?us-ascii?Q?mrUUVxkmuNWk5xSlb67JbhnCuTlTnYCta5rLLzmtlRoXuQ6fb/sDcFI8kAPG?=
 =?us-ascii?Q?Wp/+BSa+bTlL3+g4GvhUwuSqRNp3sMfUsqLiAxRp?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c6ede19-93e8-4724-7b31-08dbb6a0da6c
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB8690.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2023 10:36:58.1188
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DO+ey5sHLQKNc0EU5br4Qgvc6YLbdBCI7CWRz+MtWQteJaGG8OcboWNGovgW08Sq2ALAI4xx91HLI/d3a1Gn5g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR12MB5292

On Sat, Sep 16, 2023 at 12:58:31AM +0800, Akihiko Odaki wrote:
> On 2023/09/15 20:11, Huang Rui wrote:
> > Patch "virtio-gpu: CONTEXT_INIT feature" has added the context_init
> > feature flags.
> > We would like to enable the feature with virglrenderer, so add to create
> > virgl renderer context with flags using context_id when valid.
> > 
> > Originally-by: Antonio Caggiano <antonio.caggiano@collabora.com>
> > Signed-off-by: Huang Rui <ray.huang@amd.com>
> > ---
> > 
> > V4 -> V5:
> >      - Inverted patch 5 and 6 because we should configure
> >        HAVE_VIRGL_CONTEXT_INIT firstly. (Philippe)
> > 
> >   hw/display/virtio-gpu-virgl.c | 13 +++++++++++--
> >   hw/display/virtio-gpu.c       |  2 ++
> >   2 files changed, 13 insertions(+), 2 deletions(-)
> > 
> > diff --git a/hw/display/virtio-gpu-virgl.c b/hw/display/virtio-gpu-virgl.c
> > index 8bb7a2c21f..312953ec16 100644
> > --- a/hw/display/virtio-gpu-virgl.c
> > +++ b/hw/display/virtio-gpu-virgl.c
> > @@ -106,8 +106,17 @@ static void virgl_cmd_context_create(VirtIOGPU *g,
> >       trace_virtio_gpu_cmd_ctx_create(cc.hdr.ctx_id,
> >                                       cc.debug_name);
> >   
> > -    virgl_renderer_context_create(cc.hdr.ctx_id, cc.nlen,
> > -                                  cc.debug_name);
> > +    if (cc.context_init) {
> > +#ifdef HAVE_VIRGL_CONTEXT_INIT
> > +        virgl_renderer_context_create_with_flags(cc.hdr.ctx_id,
> > +                                                 cc.context_init,
> > +                                                 cc.nlen,
> > +                                                 cc.debug_name);
> > +        return;
> > +#endif
> > +    }
> > +
> > +    virgl_renderer_context_create(cc.hdr.ctx_id, cc.nlen, cc.debug_name);
> >   }
> >   
> >   static void virgl_cmd_context_destroy(VirtIOGPU *g,
> > diff --git a/hw/display/virtio-gpu.c b/hw/display/virtio-gpu.c
> > index 3e658f1fef..a66cbd9930 100644
> > --- a/hw/display/virtio-gpu.c
> > +++ b/hw/display/virtio-gpu.c
> > @@ -1506,6 +1506,8 @@ static Property virtio_gpu_properties[] = {
> >       DEFINE_PROP_BIT("blob", VirtIOGPU, parent_obj.conf.flags,
> >                       VIRTIO_GPU_FLAG_BLOB_ENABLED, false),
> >       DEFINE_PROP_SIZE("hostmem", VirtIOGPU, parent_obj.conf.hostmem, 0),
> > +    DEFINE_PROP_BIT("context_init", VirtIOGPU, parent_obj.conf.flags,
> > +                    VIRTIO_GPU_FLAG_CONTEXT_INIT_ENABLED, false),
> >       DEFINE_PROP_END_OF_LIST(),
> >   };
> >   
> 
> I think it's more convenient if this feature is enabled by default.

Yes, I will update it in next version.

Thanks,
Ray

