Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 858FA6C7EA9
	for <lists+xen-devel@lfdr.de>; Fri, 24 Mar 2023 14:24:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.514315.796434 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pfhNt-0002be-OM; Fri, 24 Mar 2023 13:23:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 514315.796434; Fri, 24 Mar 2023 13:23:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pfhNt-0002Ym-L4; Fri, 24 Mar 2023 13:23:09 +0000
Received: by outflank-mailman (input) for mailman id 514315;
 Fri, 24 Mar 2023 13:23:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=nsyw=7Q=amd.com=Ray.Huang@srs-se1.protection.inumbo.net>)
 id 1pfhNr-0002Yg-Sy
 for xen-devel@lists.xenproject.org; Fri, 24 Mar 2023 13:23:08 +0000
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on20611.outbound.protection.outlook.com
 [2a01:111:f400:7e8d::611])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 016d89e9-ca47-11ed-85db-49a42c6b2330;
 Fri, 24 Mar 2023 14:23:05 +0100 (CET)
Received: from DM5PR12MB2504.namprd12.prod.outlook.com (2603:10b6:4:b5::19) by
 SN7PR12MB6861.namprd12.prod.outlook.com (2603:10b6:806:266::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.38; Fri, 24 Mar
 2023 13:23:01 +0000
Received: from DM5PR12MB2504.namprd12.prod.outlook.com
 ([fe80::4f9:60f8:cb12:d022]) by DM5PR12MB2504.namprd12.prod.outlook.com
 ([fe80::4f9:60f8:cb12:d022%3]) with mapi id 15.20.6178.038; Fri, 24 Mar 2023
 13:23:01 +0000
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
X-Inumbo-ID: 016d89e9-ca47-11ed-85db-49a42c6b2330
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kLzby+zCiRhlOvmhN3uo4fZCv+wtBmFt1+COkBSvm9da8NxJlaLS/TSm5sjMsbAFIf9oYIVJ2acJQw6de8OAqIS6CYbU/GPGQccrEoj/RxCMEyhkO7Q2TdwUiQVPRILS2dn935khz6u67Fj5UgP9ft7nRj7Z48Gbw3vw8Jg7Zu+TgeT7VabtumENAJTTjwXWK0D7yTsHVJfR7d4eMTBLGT6msJlWfsQ5ghQVDKE4iMAwQH8IcMXRk7uwKa+xuerzQfDQwd/ppXEtpOfTlHBlN+Kd5lI5c0UxSwZ+r4A+21a24O3TU5NYB71MkiyzMJoCoFkRDHEyXWDjuSJ4zbVihQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CpGtiECSbIcYp+oJm2u5FkgYOEPEo1O5E5Gt+qKrRfA=;
 b=PV/N9hsEgk47vf/0oGH5FEVpm6Z40qSfYHui2gc1ystDCbs1/9tm7Eu4O9KV/7EGcknrH9I9GJHCUewicE/9urHBD0VqiGaWkhhzkWeAn1eAG4AzonZNcaBcSWXt353Pfb/7Erd70TVP3+adEkXuY90fnLRUCqEYWXTw9GaYoUA3OxxXo1RzXNq3yXeK+/F8FnwTtZ4Ss3DInrZmZrmrJnF3sRLQcoDwjXl0nBofL+g8g7MPA8BGepPBE/l7orE1QvhlLwzRQ+pWSdYN4a4adzp5howrWBokJFXZUAIlm6Scb13kPt0Qx50/FxXzOHCDssx2hyfsmMs5RJiozzrG5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CpGtiECSbIcYp+oJm2u5FkgYOEPEo1O5E5Gt+qKrRfA=;
 b=lBhItX7f2VD1inP+Xe6aW0vcheY7hacwKNZFCUPAj135crlWsYeUhabFR/z4HEnj+y9SSGA9gv3bOJww/9yTzPyftkphHkk8gG6ceRGgmO4o96BquvrXqiUy9VwJmFm2/kYEXf9lJ/dyTDXqQ7So8U+HQo7I0Bb0UGRJTbWzi7Q=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Date: Fri, 24 Mar 2023 21:22:32 +0800
From: Huang Rui <ray.huang@amd.com>
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>
Cc: Gerd Hoffmann <kraxel@redhat.com>,
	"Michael S . Tsirkin" <mst@redhat.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	"Dr . David Alan Gilbert" <dgilbert@redhat.com>,
	Robert Beckett <bob.beckett@collabora.com>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	"Deucher, Alexander" <Alexander.Deucher@amd.com>,
	"Koenig, Christian" <Christian.Koenig@amd.com>,
	"Hildebrand, Stewart" <Stewart.Hildebrand@amd.com>,
	Xenia Ragiadakou <burzalodowa@gmail.com>,
	"Huang, Honglei1" <Honglei1.Huang@amd.com>,
	"Zhang, Julia" <Julia.Zhang@amd.com>,
	"Chen, Jiqian" <Jiqian.Chen@amd.com>
Subject: Re: [RFC QEMU PATCH 08/18] virtio-gpu: Initialize Venus
Message-ID: <ZB2kGABHUKc+Bk5H@amd.com>
References: <20230312092244.451465-1-ray.huang@amd.com>
 <20230312092244.451465-9-ray.huang@amd.com>
 <68195782-0309-2f81-7f1f-84a7fe7bb05c@collabora.com>
 <ZA9HWRYxPUk1OeGe@amd.com>
 <53c25304-bc30-b5af-846e-b247aab67be9@collabora.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <53c25304-bc30-b5af-846e-b247aab67be9@collabora.com>
X-ClientProxiedBy: SGXP274CA0023.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b8::35)
 To DM5PR12MB2504.namprd12.prod.outlook.com (2603:10b6:4:b5::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM5PR12MB2504:EE_|SN7PR12MB6861:EE_
X-MS-Office365-Filtering-Correlation-Id: b47ad2ef-6a0a-4bb4-7720-08db2c6ae3fb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	7tkAu49BVZkB6yiACTi4Rhre5d0SKG5hnxtSDfk6tqWA7oRtFESpsfjHflif1EQqvBhWdtXIUJyzeR6UrmxoR4fAQ/IfrOcVRg3tExbcDwZF6okMlfvHpVWnvytLSh88VK86mfZuxJVyugsSQ33KV8vz0lI5lW+YZ6RzmomeKC+qdTD0EeykjiG368ADxdr3v+EJLSz/Ju1tCwXgVBjKS3KNo5kMeGskErAxa5Bmb7Jhyo4ztsXTY2xpoOiq+yCVtW41y3lOq1bj8Vb/u4QB0y7roJK5CXwTOx5mspst7ykYqmtm5wz5Cfqw95/7mKxlyAvnr6ldCO4xgv56RTEQJaL3Td2+J9jgHsX9XKcnrFfHMTx0kF3oLLepH0XW9x+CuTuUxSBEhB0u754Fd7qgOy/3Tb47SSDEgsr8aekJdIg/fF0cVdiBjdshHXjjuckdvEgtqLX3aObh9+wBFZlFwbxI+3vaHUF/r66tpYzEe2fGJ+Odbg7rZPSjuwvOYqqsj5A7459NX9o2RuM7beVWxltnejjGlwkJuUaL2ANdT6zMhCy/4dCRhKXk0dqdvfAX0ai9MpwKvUxtlPEQeJnKk4CYgf0nh69FENxZlxqkbthYlU2bSMLAYjtbFkblZvl4qhHMZYGnBt8Pz/AbbxP39g==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM5PR12MB2504.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(136003)(39860400002)(396003)(366004)(376002)(346002)(451199018)(83380400001)(26005)(186003)(2616005)(966005)(478600001)(6486002)(6666004)(66476007)(8676002)(4326008)(316002)(6916009)(66556008)(54906003)(53546011)(66946007)(6506007)(6512007)(41300700001)(8936002)(2906002)(5660300002)(7416002)(38100700002)(86362001)(36756003)(67856001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?GY3gdN+0XBdQjdzCM8eSDtddj04Upkkrz33ggmT+ub+lBNNI8P3MwTCjIrZF?=
 =?us-ascii?Q?mTvkK03pfeth64Y7LiDAJPZVOFPbT+jwFA9Z3dyyj9ZoasKPS+a5VZPhE2Ab?=
 =?us-ascii?Q?4tJCd99MwQu/XyPp8zVNevgBT2SE6hTawAUmXp92W7hCJ8NHwMIj3cdbfWcM?=
 =?us-ascii?Q?BsvoNWACRa0ygSE8+Oi99z+QE1gdxT1h+Y0VBwZBLlpuD6135xf7Uvv5XFh8?=
 =?us-ascii?Q?StZRhzJ8FAPO2Q6se9D17sbGUaEV7AO+mzRHvOxcLhg2ZKgzk4FCYum3hgkw?=
 =?us-ascii?Q?SHYvYpNIEDt5jSJpEz6DM1p0gCyl44Eqfi6Bq/w6aklXSFHrcDVAOjUTDO1T?=
 =?us-ascii?Q?Zp4w4nGZKHKbGYpxZRgk5dyhrDPMKmh/Ujxqa9RUp9m0+yHPpYXwF1884Z8j?=
 =?us-ascii?Q?yGAnYyR9stXuW5qfsyGj3ARl8+EQrNhdM1eMTlRxNpokdMDKlib8acRCfgzC?=
 =?us-ascii?Q?Ua+f1YB0tgycYOaNfmk55h97gUJ6tbb92hhlPaL3ZFF2/c99tAHfrP1RemMW?=
 =?us-ascii?Q?Oyea2MIg9TMY6WtYngi9gEa99FQIrfrCT0hcwtTA1pgKifOudZDeBh5LgyrZ?=
 =?us-ascii?Q?jnNyfINIi/kFZA8bQzVHb7I6TXAdFWuZ2UJha0Id080nL8oR0zaCl1XJk0Cr?=
 =?us-ascii?Q?nJ50xpj2+tcgfr/e8jLAdJ9wan4OZoU1B01eJdvgYuDBjv438b3UtMeHgGPt?=
 =?us-ascii?Q?7l5TMnOtCloMSBUy14WiSeIDGvLg0Sl8XcV4noYZ195w57eOjPSytN+agS/t?=
 =?us-ascii?Q?WBOulRDHIC4nD0wbYWksJCBS685HiBLejweDDnkTINo/yXdzqwML3ZG+4Mp4?=
 =?us-ascii?Q?5gfHxayUT19MfqmADjSXauvKAbkZDJb9CofboedwnFPcFjPKILpU0ofFlIRx?=
 =?us-ascii?Q?mfhhEcXhHt9cVy2SgtS1VVhoe0leOhkNZ4s3lR9qf+Vp4DVWhPgw6a6cfOYe?=
 =?us-ascii?Q?WimhWq32KQ9z+9UEv/w4I0adm9pMUfQsLzL5sySkNyjN2wgTOOecjvLhfKyf?=
 =?us-ascii?Q?Rz1chT8b/Q5hQbf1TuL8sr76IdSEN+07ffr18ogKMLouxxcgj67LAIPT4DkG?=
 =?us-ascii?Q?lQwWx3qWBCk/kRAYZImneTLp7Ytk+MP78vYWQa1+7J3XjPh1AesTVjv0Mvd1?=
 =?us-ascii?Q?Ku3KXJ18PtZ8AsCER6yErM9Ssy2PcdrD1jctcMEkQwBpeG6psPv8Te6KTxmX?=
 =?us-ascii?Q?o3Y/TeLragpL6IMBElUjYmZ08ACKuFwJmOsHclh1Pmnpmo4NL3Kor8HKZl73?=
 =?us-ascii?Q?ZU6vr5nKN+tA+bzjtOEQqFvvOOPJJi74PGN9MPMnw/OLUPgBPNv/ZpdI21Dm?=
 =?us-ascii?Q?xV/CEKjBqAN7Pgg6K0umsq7JJ3XUAZyxRTfr/2qjAEp6KBnrgtjNNwmXQ+tS?=
 =?us-ascii?Q?4ugAXUzrNAUmvFTdJbQG1bsJAeJTaEE+LiHk6XF2jiJTo6hgQAVZ/XmPYA7X?=
 =?us-ascii?Q?3VnGUaHVMM/xvMTOVIWnKCsyVNNPGby5PQySzT6qaXvMkJWY2cOLYNrLIKO1?=
 =?us-ascii?Q?evC4NNI55islna3QF8fRsx61iudG3oRDM58Dn65Cd7MWJM4Y30/v/bzp3GFm?=
 =?us-ascii?Q?zc8PIDUeObqryHEyAvpThMF59CAljwPC9TYinsec?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b47ad2ef-6a0a-4bb4-7720-08db2c6ae3fb
X-MS-Exchange-CrossTenant-AuthSource: DM5PR12MB2504.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2023 13:23:01.0339
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6WdZJQZYbWQwkWLMqM+gODfHqbYKkq4HXhMvxbUUwcCktno5KUZ6vLQXlSS//OdN5WXVbEpLdlK8wo5G6iHEUw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6861

On Thu, Mar 16, 2023 at 07:14:47AM +0800, Dmitry Osipenko wrote:
> On 3/13/23 18:55, Huang Rui wrote:
> > On Mon, Mar 13, 2023 at 01:51:03AM +0800, Dmitry Osipenko wrote:
> >> On 3/12/23 12:22, Huang Rui wrote:
> >>> From: Antonio Caggiano <antonio.caggiano@collabora.com>
> >>>
> >>> Request Venus when initializing VirGL.
> >>>
> >>> Signed-off-by: Antonio Caggiano <antonio.caggiano@collabora.com>
> >>> ---
> >>>  hw/display/virtio-gpu-virgl.c | 4 ++++
> >>>  1 file changed, 4 insertions(+)
> >>>
> >>> diff --git a/hw/display/virtio-gpu-virgl.c b/hw/display/virtio-gpu-virgl.c
> >>> index fe03dc916f..f5ce206b93 100644
> >>> --- a/hw/display/virtio-gpu-virgl.c
> >>> +++ b/hw/display/virtio-gpu-virgl.c
> >>> @@ -803,7 +803,11 @@ int virtio_gpu_virgl_init(VirtIOGPU *g)
> >>>  {
> >>>      int ret;
> >>>  
> >>> +#ifdef VIRGL_RENDERER_VENUS
> >>> +    ret = virgl_renderer_init(g, VIRGL_RENDERER_VENUS, &virtio_gpu_3d_cbs);
> >>> +#else
> >>>      ret = virgl_renderer_init(g, 0, &virtio_gpu_3d_cbs);
> >>> +#endif
> >>
> >> Note that Venus now requires VIRGL_RENDERER_RENDER_SERVER flag to be
> >> set. Please test the patches with the latest virglrenderer and etc.
> >>
> >> The #ifdef also doesn't allow adding new flags, it should look like:
> >>
> >> #ifdef VIRGL_RENDERER_VENUS
> >>     flags |= VIRGL_RENDERER_RENDER_SERVER;
> >> #endif
> >>
> >>     ret = virgl_renderer_init(g, flags, &virtio_gpu_3d_cbs);
> > 
> > In fact, we have rebased to the latest virglrenderer:
> > 
> > We check both VIRGL_RENDERER_RENDER_SERVER or VIRGL_RENDERER_VENUS in
> > virglrenderer, alternative of them works.
> > 
> > https://gitlab.freedesktop.org/rui/virglrenderer/-/commit/c1322a8a84379b1ef7939f56c6761b0114716f45
> 
> All the extra changes you made to virglrenderer that Qemu depends on
> need to go upstream. Please open all the relevant merge requests. Thanks!
> 

Dmitry, sorry to late response, I have created relevant merge requests
below:

Virglrenderer:
https://gitlab.freedesktop.org/virgl/virglrenderer/-/merge_requests/1068

Mesa:
https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/22108

I'd appreciate any comments. :-)

Thanks,
Ray

