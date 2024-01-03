Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 911018229B7
	for <lists+xen-devel@lfdr.de>; Wed,  3 Jan 2024 09:48:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.660916.1030601 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rKwuV-0004CJ-ST; Wed, 03 Jan 2024 08:47:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 660916.1030601; Wed, 03 Jan 2024 08:47:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rKwuV-0004A0-PS; Wed, 03 Jan 2024 08:47:35 +0000
Received: by outflank-mailman (input) for mailman id 660916;
 Wed, 03 Jan 2024 08:47:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=08Ob=IN=amd.com=Ray.Huang@srs-se1.protection.inumbo.net>)
 id 1rKwuT-00049u-V0
 for xen-devel@lists.xenproject.org; Wed, 03 Jan 2024 08:47:34 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on20601.outbound.protection.outlook.com
 [2a01:111:f403:2416::601])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ba6596a0-aa14-11ee-9b0f-b553b5be7939;
 Wed, 03 Jan 2024 09:47:31 +0100 (CET)
Received: from SJ2PR12MB8690.namprd12.prod.outlook.com (2603:10b6:a03:540::10)
 by SA1PR12MB5672.namprd12.prod.outlook.com (2603:10b6:806:23c::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7135.25; Wed, 3 Jan
 2024 08:47:26 +0000
Received: from SJ2PR12MB8690.namprd12.prod.outlook.com
 ([fe80::9b8e:816d:20b9:9845]) by SJ2PR12MB8690.namprd12.prod.outlook.com
 ([fe80::9b8e:816d:20b9:9845%5]) with mapi id 15.20.7159.013; Wed, 3 Jan 2024
 08:47:26 +0000
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
X-Inumbo-ID: ba6596a0-aa14-11ee-9b0f-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h64Bt/HcFkGy5TfC3YbeBRH/3WvPJjVjMcSBcscmu811W+dOpi21h393Nyy3LFRwWk2QZF5gPCeBsWKDKUceZMCZ5syp2RuOOvZ7UlV3C11Dqhfj2DO81J70pPMojCmAgFwv19vmaA+rPKh0ODiyjHmT/xO1FHaQZkP5Cp+Vrfbqyfu25QInWmkKZFny8p9glGekAmc8rTkOsaShGI6redf2JHKtL5p2THcB9pjQZDenkWDcpL1YeA5lva+zKDmgyGr7FfstXTMqtJWdcf3I22hroDv0MPkbycKlkbN62zCh5JrcFUzHKomTlSfEqzaQnWHDg0IaUVkYlo6NeWRyfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=30UsxFmHmKLAyDmhZfRz5WKNFF4i8bqWX+v7pNDaabk=;
 b=CNSVHgW6REB2frTJOUfEp5qVzgi2bSW5csC1vXm1xCIXyiogge5vNYZ/1hmMuhLI2fjxh2Pa0h/u/35uUy/ww5SZvIhkqxCwGjH2dYRMa259bWIOcsf/PMmnbo1d1oeiYGgHOec+pA7jxIl+EmgzEJjlZ96pMFVhxfDaK69U8luYZO52cYuS2pBjMDEcxa1DEtnK5cEHZDFtguHldMeG0B9TXcRI7B8eoA3AJjlEdffBLD9Nun5UU4zcZJ6HRcB14pYll4OMuBrlaHGU0HCjVcHX99txq91w1+D5EM4y0QGb52KfYoqoxXiLehWcxz7nu2wxT87JbPIuPYFKpEYVaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=30UsxFmHmKLAyDmhZfRz5WKNFF4i8bqWX+v7pNDaabk=;
 b=yFHwhVD/epuIvE0xxMCTRcM85jfKhsfnvoYoIath8n3oKv2a1p4+AltzlW/b6hBhiRGCYqvd+EwxiDdPymkkswrGJGr9y+XYIuCd48jCeyovEEEoMrjm44SY+3tgy6xvS0488cbXGXEbI+5qHgouyCDwOp1+6/vjakpGERZpAbU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Date: Wed, 3 Jan 2024 16:46:58 +0800
From: Huang Rui <ray.huang@amd.com>
To: =?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@gmail.com>
Cc: Akihiko Odaki <akihiko.odaki@daynix.com>,
	Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>,
	Gerd Hoffmann <kraxel@redhat.com>,
	"Michael S . Tsirkin" <mst@redhat.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Antonio Caggiano <quic_acaggian@quicinc.com>,
	"Dr . David Alan Gilbert" <dgilbert@redhat.com>,
	Robert Beckett <bob.beckett@collabora.com>,
	Dmitry Osipenko <dmitry.osipenko@collabora.com>,
	Gert Wollny <gert.wollny@collabora.com>,
	Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Gurchetan Singh <gurchetansingh@chromium.org>,
	"ernunes@redhat.com" <ernunes@redhat.com>,
	Alyssa Ross <hi@alyssa.is>,
	Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
	"Deucher, Alexander" <Alexander.Deucher@amd.com>,
	"Stabellini, Stefano" <stefano.stabellini@amd.com>,
	"Koenig, Christian" <Christian.Koenig@amd.com>,
	"Ragiadakou, Xenia" <Xenia.Ragiadakou@amd.com>,
	"Pelloux-Prayer, Pierre-Eric" <Pierre-eric.Pelloux-prayer@amd.com>,
	"Huang, Honglei1" <Honglei1.Huang@amd.com>,
	"Zhang, Julia" <Julia.Zhang@amd.com>,
	"Chen, Jiqian" <Jiqian.Chen@amd.com>,
	Antonio Caggiano <antonio.caggiano@collabora.com>
Subject: Re: [PATCH v6 03/11] virtio-gpu: Support context init feature with
 virglrenderer
Message-ID: <ZZUfAu5vXRWNUwjY@amd.com>
References: <20231219075320.165227-1-ray.huang@amd.com>
 <20231219075320.165227-4-ray.huang@amd.com>
 <CAJ+F1CJ7cH3v9vXy+g-2ANZ1MowprW451dhzSDdsSn=P+c7LFg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAJ+F1CJ7cH3v9vXy+g-2ANZ1MowprW451dhzSDdsSn=P+c7LFg@mail.gmail.com>
X-ClientProxiedBy: SI2PR04CA0005.apcprd04.prod.outlook.com
 (2603:1096:4:197::16) To SJ2PR12MB8690.namprd12.prod.outlook.com
 (2603:10b6:a03:540::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR12MB8690:EE_|SA1PR12MB5672:EE_
X-MS-Office365-Filtering-Correlation-Id: 6cb4165b-007e-4a6e-e416-08dc0c389c41
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	OTwRtRJT5ivHVbZBT+4dTF26k1iInlBQVljjSZTgn23rjJDewhSHIRXJei+jTXkoIPinxQc6oiyt1li5XVXopiofVIMAMNk9sdXePjEC97qHg2EBIjN2fy3Fku0/TF0UvRoEwggt5W/wuXce/EfWZsL5/AAl/ODWdL+Tx1UAQCrkc3IoSWiuEnrQOTuE0CdkNT3tNTe/bV2x0ORn/d4uT0DOPHorske8YYAHnlPqHWuhAnI1TPvrpboPND/IgrMVvFi40qIf3z/9led3QSm83t+0aQtufrAJsbhgMG+66jYasGJxl3Q2UO4HXkBiHwysJT/QGqTcogSHZm0BKVfj4pFUU9aOziwc2GmQlDDTn70icH0ens6/s0vCT9xlU4FFxQiRuJTx3vXk5M1qkZWm7ic8b/iNPQutOloW6ldUgoP++LFTv2TDc42J9RXszgckjfxx+7OOIzySePrko39sZgK1XZYjKWoG1paDD4kRX8M1Fdhxrj4UB8lkW7OmMb8+PpuR06XR+pI1bfUl0wwpCeEo84v7xT/fupmd2RIWi4cIhSHut/iKL8JKDFauErK1
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR12MB8690.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(346002)(376002)(39860400002)(136003)(396003)(230922051799003)(451199024)(1800799012)(64100799003)(186009)(41300700001)(26005)(2616005)(38100700002)(83380400001)(8676002)(54906003)(6666004)(5660300002)(8936002)(316002)(7416002)(4326008)(2906002)(478600001)(6916009)(66556008)(6486002)(6506007)(53546011)(66476007)(6512007)(66946007)(86362001)(36756003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aGVjRFZGN2x3VHZTbVdWbHlXN3N5RTVpRnl6cGtEVUZ1VHNqcFE1TmtDbFF2?=
 =?utf-8?B?WTQwUnEveWFwOXNYVElEMmltNDZVZFExNktRbkRSejYzTWw4b29qSlQ2S2Fo?=
 =?utf-8?B?eUhxM28xSHZ0Tm1wdW1BSGFnYi8zT2hLT1E5R3lTWjUvdDB4bGFDeUt6Y3Zt?=
 =?utf-8?B?Mk1OejdFb3l1eEJYK3dvQ3R1OGJkZ3Y2RG1YaEJDZzF6TTdITzZNazNYVzh4?=
 =?utf-8?B?ZjNwRmxlalZ3VmdwSjJiTzlDbHM5NFlscWZPYnYvdzFyV0dJdi92Sk5xNTVB?=
 =?utf-8?B?N01MN3V4cXFtVEM3YU5sbGNGOEkybHZSZE5OQnMxcXNDZ3RoVkxJS0ZLRFlm?=
 =?utf-8?B?VmNReG1WT1hkb3RvUU1jcDFUbS9ySEoyd1ZDQ052bW95YytDRVRZcE9wWmcz?=
 =?utf-8?B?OEQzZHJMWDRuK0k4d0IyTFpBTHBnWEYra09ONkN3ZFRxSzdya0RJSGljRlRs?=
 =?utf-8?B?aktReWEwdE9jL0VkSTlLTHp2Uk1ESE1Sa21BdlRSNkt2U0ttcFZBWFNmQTFG?=
 =?utf-8?B?UVJWQ0tySTlsTmc1SmlkVWRuWVE4djZDTnhoOVhYVlBGR1JtQy96cVU1RXhS?=
 =?utf-8?B?bW85eU5KcVBZT0lITW5Pc0xiT25HbHVpOUdwNlp4SGR0VDdnZUpLZHNBYkVU?=
 =?utf-8?B?cTRpRGhCa1hscU9EVUlxUG5IVWM1UEtNQnViQzlzZVRUTzBrVEkxbFJGa3pL?=
 =?utf-8?B?YVBPNWROVDJ3WU1qZU1uUmhHdXVwZHZwN2hkejlkc0dzVXZSaWh1U2ZWNmNF?=
 =?utf-8?B?UDJCQmhlWHlyRFFLT2hyVklyeU9yQ21Ga0lPOFlKa2g1eUV2cTJDSTUwaDVt?=
 =?utf-8?B?RDloZWV5Wm1nNmZaRVU1emFta2NqWmZpMDRwTjlSNzg4R00zaFVLUllzbWRC?=
 =?utf-8?B?dERpYkhUeXIweFFTb2FKMnl5LzBvb3N1RWlDWXNUSG0vY0hsUXo5SysvSFBi?=
 =?utf-8?B?bUZJallMTk1DNGxhUGpObGtNVmZWVDlDaS8wcmpFTXAzZUsrVVZXdlVtN3pE?=
 =?utf-8?B?STA2Q2VaZHZwU3BqaDNYaEUweUNzdE8zSzdFQlNwY2MwamdzWGdDMTByK09r?=
 =?utf-8?B?SnZMaDNSejAxNFFVVUpOc1U0R1dmZFRXOGFQRGFLS3d1THNpYWZzanJEZ29C?=
 =?utf-8?B?T1pzSnBzQ3JvNHNVT0RGZkNGN0V1TlZtc2dpS3pPZzMzbnlMV1pqT3UwZ3cr?=
 =?utf-8?B?QjM0UzdRTTdVdjEySlJHbDBLeS9yL3pteUUvaW5oRVh5R1N1dUtTR1FBSnE1?=
 =?utf-8?B?TVZCQzdPMGRYaFVvMlpOazdxNEtZQjBQc25oOGg1djVHREhKTDRpb1lmOHM0?=
 =?utf-8?B?MEd5cmxWeTMxNUZKenNKWW1JNG00S2xsc0thZklmWFRZa3oxdUJNUlZQUHpT?=
 =?utf-8?B?azJTVlg4RWp0aVRJaVEzSm92RDN0QXNWc0ZyTzE1RnlWR0tnOEw2RWVsR2V6?=
 =?utf-8?B?Ti9QNFE0ZFZOUXJWK1o0QUtOM2VXdURDSVhnZm91dU43VUV3cStTOVhHRTBa?=
 =?utf-8?B?WVYydW82ZFlrdUY1MlNkWXB0aTJNVWRka0FvNkRUdnJ4WGhnRHVKNGVrQ0Rn?=
 =?utf-8?B?U2FVWDFBaEVVbkxqQ09pS1YvN3pSVWFLMGpxcTVWakkxOFVjQld3Z3M1eXY1?=
 =?utf-8?B?aWZBeVJ3T0dJTVc2NjNoN09RUko1ZG01cnVJdUVVbDk5azg4NEU1SjBPS0gx?=
 =?utf-8?B?Mmw4SkxEdWpSNmdDZ0VLZy95UC8zRmpQQVgxK2Z3cWozaG1hcU03SitscnNp?=
 =?utf-8?B?VUo2UXY0TW5zQlc4eEFxR0hMdkMxM0UxTTltY3BGNjVGR2wwRmFocDR4M3lj?=
 =?utf-8?B?aG1SdHI4bWliSW5hbG4yei85VC9iVlBlZmNMckE3TWw1RzFBV3BMZ1VRUW1N?=
 =?utf-8?B?Y2Y1cmltSG9lbkVlWUJpNUlpK3JqSnc5Skw5Sy8yV2VVTE5OUDBhbnBlZitP?=
 =?utf-8?B?eEtMYmJEUlQ0WkY3N1FCNjJCMkdKUWU2WTVBcFJqTnE1RXc4clFSWkg0MDla?=
 =?utf-8?B?czhoM1V6T3ArVFlMWXplOVVhVVA3dlZjTDVtS0VsV3NCTzBHZXV4dThDTEFo?=
 =?utf-8?B?SEQzSkZiTnFWUXpKdFJnNkk5YTFUUjRXNERlN284N0JRQ3c1VnpENXJnVmRi?=
 =?utf-8?Q?QqT77XIa5Uu5W0BcJV+L2cm2V?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6cb4165b-007e-4a6e-e416-08dc0c389c41
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB8690.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jan 2024 08:47:26.2247
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: O55xT5eNe9QJH70aJCxe517aD0oV+zuQDThkDAL4vx6rIdWtZn0tGYm2DxDrJFy9UNMZUqFaIoutMGglgs2a8Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB5672

On Tue, Jan 02, 2024 at 07:43:20PM +0800, Marc-André Lureau wrote:
> Hi
> 
> On Tue, Dec 19, 2023 at 11:54 AM Huang Rui <ray.huang@amd.com> wrote:
> >
> > Patch "virtio-gpu: CONTEXT_INIT feature" has added the context_init
> > feature flags.
> > We would like to enable the feature with virglrenderer, so add to create
> > virgl renderer context with flags using context_id when valid.
> >
> > Originally-by: Antonio Caggiano <antonio.caggiano@collabora.com>
> > Signed-off-by: Huang Rui <ray.huang@amd.com>
> > ---
> >
> > Changes in v6:
> > - Handle the case while context_init is disabled.
> > - Enable context_init by default.
> >
> >  hw/display/virtio-gpu-virgl.c | 13 +++++++++++--
> >  hw/display/virtio-gpu.c       |  4 ++++
> >  2 files changed, 15 insertions(+), 2 deletions(-)
> >
> > diff --git a/hw/display/virtio-gpu-virgl.c b/hw/display/virtio-gpu-virgl.c
> > index 8bb7a2c21f..5bbc8071b2 100644
> > --- a/hw/display/virtio-gpu-virgl.c
> > +++ b/hw/display/virtio-gpu-virgl.c
> > @@ -106,8 +106,17 @@ static void virgl_cmd_context_create(VirtIOGPU *g,
> >      trace_virtio_gpu_cmd_ctx_create(cc.hdr.ctx_id,
> >                                      cc.debug_name);
> >
> > -    virgl_renderer_context_create(cc.hdr.ctx_id, cc.nlen,
> > -                                  cc.debug_name);
> > +#ifdef HAVE_VIRGL_CONTEXT_CREATE_WITH_FLAGS
> > +    if (cc.context_init && virtio_gpu_context_init_enabled(g->parent_obj.conf)) {
> > +        virgl_renderer_context_create_with_flags(cc.hdr.ctx_id,
> > +                                                 cc.context_init,
> > +                                                 cc.nlen,
> > +                                                 cc.debug_name);
> > +        return;
> > +    }
> > +#endif
> > +
> > +    virgl_renderer_context_create(cc.hdr.ctx_id, cc.nlen, cc.debug_name);
> >  }
> >
> >  static void virgl_cmd_context_destroy(VirtIOGPU *g,
> > diff --git a/hw/display/virtio-gpu.c b/hw/display/virtio-gpu.c
> > index b016d3bac8..8b2f4c6be3 100644
> > --- a/hw/display/virtio-gpu.c
> > +++ b/hw/display/virtio-gpu.c
> > @@ -1619,6 +1619,10 @@ static Property virtio_gpu_properties[] = {
> >      DEFINE_PROP_BIT("blob", VirtIOGPU, parent_obj.conf.flags,
> >                      VIRTIO_GPU_FLAG_BLOB_ENABLED, false),
> >      DEFINE_PROP_SIZE("hostmem", VirtIOGPU, parent_obj.conf.hostmem, 0),
> > +#ifdef HAVE_VIRGL_CONTEXT_CREATE_WITH_FLAGS
> > +    DEFINE_PROP_BIT("context_init", VirtIOGPU, parent_obj.conf.flags,
> > +                    VIRTIO_GPU_FLAG_CONTEXT_INIT_ENABLED, true),
> > +#endif
> 
> Does it make sense to make this configurable? If the context to be
> created asked for a capset id but the one created doesn't respect it,
> what's the outcome?
> 
> It looks like it should instead set cmd->error.
> 

Hmm, how about setting VIRTIO_GPU_FLAG_CONTEXT_INIT_ENABLED in
virtio_gpu_gl_device_realize(). And then drop context_init DEFINE_PROP_BIT
in virtio_gpu_properties. We treat all gl device as context_init enabled
and let virglrenderer report the error if command fails.

Thanks,
Ray

