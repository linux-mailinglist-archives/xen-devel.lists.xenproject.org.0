Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F19C47A725E
	for <lists+xen-devel@lfdr.de>; Wed, 20 Sep 2023 07:52:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.605077.942711 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qiq6y-0002yl-9x; Wed, 20 Sep 2023 05:50:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 605077.942711; Wed, 20 Sep 2023 05:50:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qiq6y-0002vU-5f; Wed, 20 Sep 2023 05:50:56 +0000
Received: by outflank-mailman (input) for mailman id 605077;
 Wed, 20 Sep 2023 05:50:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=7N78=FE=amd.com=Ray.Huang@srs-se1.protection.inumbo.net>)
 id 1qiq6w-0002vO-3F
 for xen-devel@lists.xenproject.org; Wed, 20 Sep 2023 05:50:54 +0000
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on2061b.outbound.protection.outlook.com
 [2a01:111:f400:7e8b::61b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a5f29d7a-5779-11ee-9b0d-b553b5be7939;
 Wed, 20 Sep 2023 07:50:51 +0200 (CEST)
Received: from SJ2PR12MB8690.namprd12.prod.outlook.com (2603:10b6:a03:540::10)
 by CH3PR12MB9395.namprd12.prod.outlook.com (2603:10b6:610:1ce::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.27; Wed, 20 Sep
 2023 05:50:45 +0000
Received: from SJ2PR12MB8690.namprd12.prod.outlook.com
 ([fe80::c3b:811:fd1d:c33e]) by SJ2PR12MB8690.namprd12.prod.outlook.com
 ([fe80::c3b:811:fd1d:c33e%6]) with mapi id 15.20.6792.021; Wed, 20 Sep 2023
 05:50:44 +0000
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
X-Inumbo-ID: a5f29d7a-5779-11ee-9b0d-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ys0lpzkEi+cVhB5EGv2MZzyoaBtj16KI+sNh9u3vkitSwP/hxC18WzxkBSujYK8OUbIwOM/SmYGLFcwZqVqN7q9pwouwF+Vs/CjO9f/Ps+Fh3lJ8OpD8tn1bj54HYkCBh5JCarSt+roDlLiGOgCgkArwOWuXq38sYei3IAxSZpRfXN1QYRyVQBVNZ6Cs1VEeITZsaIccbQzbil2uF1/p9sxTP/iEoQhHtT7skH+RTAJQfPlcYrVPKePFrDE3RXAQOpPkYKCjzB0OIN/fHDY/PM7UiVstEbyKj06lInmYoThFrxBRomMHIEjibRO/JBW55FvDMLDQ2jB0BrZsQkgGuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cOENW9ZRlU3jJ/R6OMg5kD9FD0q5D10zilIfopN6BvU=;
 b=j1jjziGVuOcVjW4CXS4UYPkYhPn5cqr6atECSTwWDvqP0gIU8XwjF7JO4umtvORAAGWmrMypGSHwIU9yFDmuXY334rNA5nGSJii1QwAu/StYfu/YA8g5LNxi8/4lzrYCz/CQOHTxFYCItz57XdgwnFcLda3xhmePqDhqmMjEWrxzrWWV9KroS2S2hZFsKJ6+QbRPrIfZUPU/OaFCTHFL6DngqwK8TYuydhw4juDAyQArqwuTAgrEKSw7fdQkChc5D5mSlkxrZAMFiwd+vvF1ST1E8fZMbRdmkSXtU+WXdI/73aywpxinzxD9hyEttPh4Q1MdQLnqBvNW2ZPPSrr79w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cOENW9ZRlU3jJ/R6OMg5kD9FD0q5D10zilIfopN6BvU=;
 b=ttkNQDuKCbKB6h6m4NhrP5N5AsrsWiUyAK2RJB5Ro720RtSsrhJH2v3EAg4nPZFwAe9Sj6ps3KDpNmviSkHC7Kg4eM18ZHO1MeLQwFjOBWDus3q43N5VQ8lCq7U/HOheA58jsb1NeXBovbE0QKZF5DJKrUDo85jh1vUadOGhryk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Date: Wed, 20 Sep 2023 13:50:14 +0800
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
Subject: Re: [QEMU PATCH v5 09/13] virtio-gpu: Handle resource blob commands
Message-ID: <ZQqIFvasHD+Y8TSa@amd.com>
References: <20230915111130.24064-1-ray.huang@amd.com>
 <20230915111130.24064-10-ray.huang@amd.com>
 <a14b26dc-c804-4be8-83d5-088e71d37a7b@daynix.com>
 <9700c2ed-93c5-4bf6-bc6b-d5d33359d9a7@daynix.com>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <9700c2ed-93c5-4bf6-bc6b-d5d33359d9a7@daynix.com>
X-ClientProxiedBy: SG3P274CA0014.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:be::26)
 To SJ2PR12MB8690.namprd12.prod.outlook.com (2603:10b6:a03:540::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR12MB8690:EE_|CH3PR12MB9395:EE_
X-MS-Office365-Filtering-Correlation-Id: 155186ab-1ebd-40d3-93c7-08dbb99d8782
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	qVJB5ABwUqUa7maxL4ckIVOov/BrNkIOGtA8EAydqx5kqVqt5fVjP6IkpuFqo1FwPGasQDS38ZDteNL/T5N+ZRibdWDUJmnFcRUOaiJHRW0Hc/NOgChXw5IT6KMbO9wIk3jgK+O46sWvjOoL7XRLv3UwteDumSQcr7qEAvm0tTRGpL+6Pjeh38bEGsrY2RTEfirWBOQJxPp52HxNDoX74j3PlHnllk+K2UBs1fqAlcxCiUUSxIMUemLSlZkERO1vDv/tzARPbai1S2V45KR3yWgBlCYs1sZQKMx3WNq7dlL5JSDd2q1q6h3k9XF8i7p9VPuabEFRjDXW7y/Y5gMGA9PH0kPak47Q+KzncVnUCINfrQWHlJXXhrSvc9Z+ZHvzUc7J6hbwRzdoXEWGyfec7991EVrdjW+JX+ZCNW8fRbrdfGImjBNjkLLpFUMS/Q+pOOZSQjzjPiRSmlfcJviAd5wMHvQ4R7xIEHgGBvj8M+CeEjFDFz3ijUAS/8rW1NWPEBfnMIUFr7djoUrwIcUQUwthuyFyVJuKPfyIF0c5gLuV8Bvj1AvzhzWEyo73ktmP4wD5tsDSutdKTRIiu+hQxurU2EBLVqdRAdx5KxbmOoo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR12MB8690.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(136003)(366004)(346002)(396003)(39860400002)(1800799009)(186009)(451199024)(26005)(5660300002)(8936002)(8676002)(4326008)(2616005)(2906002)(86362001)(36756003)(7416002)(38100700002)(83380400001)(66476007)(6486002)(6506007)(53546011)(54906003)(66556008)(66946007)(6666004)(478600001)(6512007)(41300700001)(6916009)(316002)(67856001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?1WdgHF0bDDafafAGaTtq/DF8R2omXBKwFHybpqZElkxZsA8sKvKJ+f6HWB?=
 =?iso-8859-1?Q?z7e1N0+2fmW9uqmSxnclJMmJ1O9Mu9NuO3uc5HtXigdEdYX7ct7+cw1dne?=
 =?iso-8859-1?Q?0yzLvqiDFCXoH3OUtFi6Txpih67zYL2zD28GMSltswo/gRtOA0B9nuajwK?=
 =?iso-8859-1?Q?C7GLf5YpKPyJJsjHGhhnlSHM8b4VgOZIM1sed1BBWwjcvFdEBszyIcDmyT?=
 =?iso-8859-1?Q?sFdgvOIBTayD4SNYDIjOMwK9KB6Mv4Dae4CPTe9DeIzOxSBeUzgr38lRPi?=
 =?iso-8859-1?Q?u4scPqJroFvEDGX86I1kW4i7U9h+111cMOZSoPhNnUrozPRiUkOQjJ+q0C?=
 =?iso-8859-1?Q?4x8JuH9AkWudV97zUtmVA1FZox0T61v3ceKz5pXB3OL7R791cSEoza5LH5?=
 =?iso-8859-1?Q?yoycJoaN/CFcgmXPOoKKNy2jbEWMLHV50SsZ7OhpqfBHJkxGy3rZFddVVg?=
 =?iso-8859-1?Q?vIxOUaniqZv/RK7FfpmqNTVRAvIn62EAjbsWwDiamcTC2n9VCYLp/36liB?=
 =?iso-8859-1?Q?hGpo7dxRFwV/oqU2Uut1rY6wEc+oiI8g0GPyPUp5CRnE+akN47kkye+LV0?=
 =?iso-8859-1?Q?PDIOVClp0OfHiwVhP2OZYZHRmxt1u09DKL/MZFmx9Lp+boTLV9kvOgHCIH?=
 =?iso-8859-1?Q?N0bZrZYqwCAqixKyK2d2Onvo5YmvUCWBtWknv+enDdF1WQS+5eI5Bm3lxR?=
 =?iso-8859-1?Q?EfemEnDji6CXvfNNw5sgTlpZW5OzVcXK3biCM0h0xZPrOSoZ1c0jusbYDB?=
 =?iso-8859-1?Q?Dv8o0k+Yv/nApxEvposhAswNQ6QQLfnRdoOXjwfS8EGkopqL6VSmPZ8O7Y?=
 =?iso-8859-1?Q?/5bhDYxItMbYgBu9oYTAe5F0Zc0AI59LbOTQZHvt9gN73I3LrzhnB6WwVs?=
 =?iso-8859-1?Q?jXyfni+19y5HnZfzPoPuxV7ena4SbZdgessqWmPxmNI6wYuHpkcGDj4V8e?=
 =?iso-8859-1?Q?n2FvT34HGQ4M2/eMPV8499oU2DG/KEs6vv9hbjnuaG8xbDoSCGqAt8QkbJ?=
 =?iso-8859-1?Q?Uc6yMdq22e6HDci8PLciEEfw0na7KPFqCaaDm3nh7uIM6gz0/X7B0Y2TmY?=
 =?iso-8859-1?Q?CSjqmxrpFfczAkzrqJTGToosPSOtajkjzHzCVvRlqzFPSAjQkHYi3SAxAM?=
 =?iso-8859-1?Q?/GgmlnVmiFWXHbV3yU0enn0msfrUNQpFMmOeSk5suAIHSfugjE6YP6QdZi?=
 =?iso-8859-1?Q?zlZzk54fwqtc/rdlewA70PSR5fsuSSdyafcioeAtxECpYm1YdQvUkPLiqS?=
 =?iso-8859-1?Q?tCuzQwrrYgL22ICRp8xEjvt91rNJAgIoEKq2CmNdnBv8gq4osd0bde77/l?=
 =?iso-8859-1?Q?V3LtRWl49zaN3XBXPHm6VL48+NanVHSdV8OOKZHzlSBDhlL25K+6tAcfkc?=
 =?iso-8859-1?Q?pgpYQffKMkRZiuj9DrdPlLgvh+9VrQ/qLRRY4nhyEgJTvP/B63Vu/kPB9N?=
 =?iso-8859-1?Q?xOkpH6jAH5eVd1OVIKrrBZjV9XPB8prP+NfwHraFDyX8BIPyXf7XzwenAA?=
 =?iso-8859-1?Q?2AtCc28t456P/0KlgvhOjFnQXYjlFgXKisSRJMPOW00UJghNjpZAbv3uN9?=
 =?iso-8859-1?Q?ujvklIKdha5vijhyBDHaQQg9UYPfKokuw7herPsLbk9XVdBSVTpBe8B0F7?=
 =?iso-8859-1?Q?krZc+27ofgSNtBiRiW0ug+c2k5oYt5N+LY?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 155186ab-1ebd-40d3-93c7-08dbb99d8782
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB8690.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Sep 2023 05:50:43.9317
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gP4RfMYalkPHtrICygaRghxSM5pJsqC1rS3SlF2A2wYJpLWl4M0rjBHkPMPGHY1MTu79y+M0AQpFNNh3A0dWUA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9395

On Sat, Sep 16, 2023 at 12:37:29AM +0800, Akihiko Odaki wrote:
> On 2023/09/16 1:04, Akihiko Odaki wrote:
> > On 2023/09/15 20:11, Huang Rui wrote:
> >> From: Antonio Caggiano <antonio.caggiano@collabora.com>
> >>
> >> Support BLOB resources creation, mapping and unmapping by calling the
> >> new stable virglrenderer 0.10 interface. Only enabled when available and
> >> via the blob config. E.g. -device virtio-vga-gl,blob=true
> >>
> >> Signed-off-by: Antonio Caggiano <antonio.caggiano@collabora.com>
> >> Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
> >> Signed-off-by: Xenia Ragiadakou <xenia.ragiadakou@amd.com>
> >> Signed-off-by: Huang Rui <ray.huang@amd.com>
> >> ---
> >>
> >> V4 -> V5:
> >>      - Use memory_region_init_ram_ptr() instead of
> >>        memory_region_init_ram_device_ptr() (Akihiko)
> >>
> >>   hw/display/virtio-gpu-virgl.c  | 213 +++++++++++++++++++++++++++++++++
> >>   hw/display/virtio-gpu.c        |   4 +-
> >>   include/hw/virtio/virtio-gpu.h |   5 +
> >>   meson.build                    |   4 +
> >>   4 files changed, 225 insertions(+), 1 deletion(-)
> >>
> >> diff --git a/hw/display/virtio-gpu-virgl.c 
> >> b/hw/display/virtio-gpu-virgl.c
> >> index 312953ec16..563a6f2f58 100644
> >> --- a/hw/display/virtio-gpu-virgl.c
> >> +++ b/hw/display/virtio-gpu-virgl.c
> >> @@ -17,6 +17,7 @@
> >>   #include "trace.h"
> >>   #include "hw/virtio/virtio.h"
> >>   #include "hw/virtio/virtio-gpu.h"
> >> +#include "hw/virtio/virtio-gpu-bswap.h"
> >>   #include "ui/egl-helpers.h"
> >> @@ -78,9 +79,24 @@ static void virgl_cmd_create_resource_3d(VirtIOGPU *g,
> >>       virgl_renderer_resource_create(&args, NULL, 0);
> >>   }
> >> +static void virgl_resource_destroy(VirtIOGPU *g,
> >> +                                   struct virtio_gpu_simple_resource 
> >> *res)
> >> +{
> >> +    if (!res)
> >> +        return;
> >> +
> >> +    QTAILQ_REMOVE(&g->reslist, res, next);
> >> +
> >> +    virtio_gpu_cleanup_mapping_iov(g, res->iov, res->iov_cnt);
> >> +    g_free(res->addrs);
> >> +
> >> +    g_free(res);
> >> +}
> >> +
> >>   static void virgl_cmd_resource_unref(VirtIOGPU *g,
> >>                                        struct virtio_gpu_ctrl_command 
> >> *cmd)
> >>   {
> >> +    struct virtio_gpu_simple_resource *res;
> >>       struct virtio_gpu_resource_unref unref;
> >>       struct iovec *res_iovs = NULL;
> >>       int num_iovs = 0;
> >> @@ -88,13 +104,22 @@ static void virgl_cmd_resource_unref(VirtIOGPU *g,
> >>       VIRTIO_GPU_FILL_CMD(unref);
> >>       trace_virtio_gpu_cmd_res_unref(unref.resource_id);
> >> +    res = virtio_gpu_find_resource(g, unref.resource_id);
> >> +
> >>       virgl_renderer_resource_detach_iov(unref.resource_id,
> >>                                          &res_iovs,
> >>                                          &num_iovs);
> >>       if (res_iovs != NULL && num_iovs != 0) {
> >>           virtio_gpu_cleanup_mapping_iov(g, res_iovs, num_iovs);
> >> +        if (res) {
> >> +            res->iov = NULL;
> >> +            res->iov_cnt = 0;
> >> +        }
> >>       }
> >> +
> >>       virgl_renderer_resource_unref(unref.resource_id);
> >> +
> >> +    virgl_resource_destroy(g, res);
> 
> This may leak memory region.

The memory region should be freed under virgl_cmd_resource_unmap_blob()
which is calling memory_region_del_subregion(&b->hostmem, res->region).
Because this region is created by map_blob(). Do we have the case to call
virgl_cmd_resource_unref() without calling virgl_cmd_resource_unmap_blob()
for blob memory?

Thanks,
Ray

