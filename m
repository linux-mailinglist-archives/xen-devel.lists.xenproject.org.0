Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BE5C7A72A3
	for <lists+xen-devel@lfdr.de>; Wed, 20 Sep 2023 08:13:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.605098.942740 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qiqS2-0007Cd-H3; Wed, 20 Sep 2023 06:12:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 605098.942740; Wed, 20 Sep 2023 06:12:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qiqS2-0007A7-Ds; Wed, 20 Sep 2023 06:12:42 +0000
Received: by outflank-mailman (input) for mailman id 605098;
 Wed, 20 Sep 2023 06:12:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=7N78=FE=amd.com=Ray.Huang@srs-se1.protection.inumbo.net>)
 id 1qiqS1-0007A1-6d
 for xen-devel@lists.xenproject.org; Wed, 20 Sep 2023 06:12:41 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on20628.outbound.protection.outlook.com
 [2a01:111:f400:fe59::628])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b27f8af8-577c-11ee-9b0d-b553b5be7939;
 Wed, 20 Sep 2023 08:12:38 +0200 (CEST)
Received: from SJ2PR12MB8690.namprd12.prod.outlook.com (2603:10b6:a03:540::10)
 by MW6PR12MB8898.namprd12.prod.outlook.com (2603:10b6:303:246::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.24; Wed, 20 Sep
 2023 06:12:32 +0000
Received: from SJ2PR12MB8690.namprd12.prod.outlook.com
 ([fe80::c3b:811:fd1d:c33e]) by SJ2PR12MB8690.namprd12.prod.outlook.com
 ([fe80::c3b:811:fd1d:c33e%6]) with mapi id 15.20.6792.021; Wed, 20 Sep 2023
 06:12:31 +0000
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
X-Inumbo-ID: b27f8af8-577c-11ee-9b0d-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aX69hGmWRJMhNFVfSqEh5pDxG3IF2Bqj6g2JFKdHwlSbykw+wCqw0FI3LWacfnWzJnH840wY5NoRHXWGV6le8JexvIhoMFOOg7UjyibIpO8dl95hPdrVkS4TU0bMWDSWTOHuthqvqdFgTjlkIVFPZGnEO16iKtHChhi1Fu49/APwHaB+Obe/LSCMVX2YO9DOxF2uekkNoxSZxsx3RFVtc4PAuUovqQbYSvUN6HqkAbEwnO+Y5UP8jIuXx01qJEHaPvye26uZ/EL+E3a3nDYJEdgeQNRSiPPjVd+y48o1X+F1+3WHsOWuMLTFYGcNOuufopnBvv4eqsyXRwNHi/mZ/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ykT79Jrjb3ULMEMcPcuqI5yQR+285A/pj+Vh16cB0GQ=;
 b=WLB03mv+0Ld5+1kLw9U9SVoEZhsL8LOj5ZtnYOyDRAD21c8VlmZzmsP+t8TC5nWZL/ljeQZZD7wInHW++X/qYQzjZt9pOdMJkbhMZSWPN3YmX3HydsYNwLmVqY2zFY1EpnRC0wZXHrOvX2HRQTE0CxYRHnQ+q1tOJ/5JxTJjWl7n9hyas7QN70GvC5ZrvJalyPG6XnqNbUgpM21VpBTyjJBQfOR1ISnp98U6m5diiL20PVsHZju5AjEyqA3ucTNHcDLjKLcxmHKF2gZHSGHVWyOHJ6Kd3unOJKIkoWWFMJhS7P7JdNEIBR4LynYAORYvB0gfR/qezC8o03ZI44t/bg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ykT79Jrjb3ULMEMcPcuqI5yQR+285A/pj+Vh16cB0GQ=;
 b=p5VQjz0F7qMzv9pxFMT7/Bswt0HvPH33HKUQ09V9cOejjw5FE/R2zXSrUfJZ4+mFiLofDnDoR2L21bxcXW/UW66NjG0mLJ/yfKvS5k0W7ayJ53mXEPaZVOxRcb1BPfC9Lg9H4E+rNYfUpfudPlCvjsEfuJtKNVpjr9pWpJsYlro=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Date: Wed, 20 Sep 2023 14:11:58 +0800
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
Message-ID: <ZQqNLrgfmIjqhVXE@amd.com>
References: <20230915111130.24064-1-ray.huang@amd.com>
 <20230915111130.24064-10-ray.huang@amd.com>
 <a14b26dc-c804-4be8-83d5-088e71d37a7b@daynix.com>
 <9700c2ed-93c5-4bf6-bc6b-d5d33359d9a7@daynix.com>
 <ZQqIFvasHD+Y8TSa@amd.com>
 <8d1f6b30-795e-418e-aeb5-3823680ea70a@daynix.com>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8d1f6b30-795e-418e-aeb5-3823680ea70a@daynix.com>
X-ClientProxiedBy: SI1PR02CA0012.apcprd02.prod.outlook.com
 (2603:1096:4:1f7::8) To SJ2PR12MB8690.namprd12.prod.outlook.com
 (2603:10b6:a03:540::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR12MB8690:EE_|MW6PR12MB8898:EE_
X-MS-Office365-Filtering-Correlation-Id: d4efb445-4ef2-4921-c698-08dbb9a092b5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	+O6zxtE3JEXbVrsxgGJ6bGjljSwPv9ma1QKw92v5EET2/mgA1uFpqhDDQuHJOSNF4B029pSBSgV3w6/Z8zWy+RDUVbeegpBA4BbBXq+69fyf6gEPHwYXRd51DTUeWSH/x3eWyZiXfHl7rjKfkaaCywPxm5HlKLusHu/dclYFY/8Av8/04E3GdduHGcGQ1dR9hJRXKrJfTS/h/s6DiiARnrAFgTgkHXSWQGOJ0YmR3Ty60DxiMTWG35BntaKqXnKMXzroSlFNt6tsMIQmxzCJlJSD/bm1G8Z1DTEERnj1QRatECnONFJdyAPgzqINW+3wSyhhjSpt9VshjpK0kZxbdQLiCp+CrSTdhbTTFo/3s5p7tmy0SJ8xx6OJAnFrwEEuEw8Hv+W1BcQDacZPkgdpCTnYB833y0wpQbCqjG7hUtnlbs2fJRPdTFvunFiUyGc9CWh410o0NKFAZjyLK+yaoFx4rkqy2LvCVt5p3ESvTQuo4Xc/xhduoR1mRapS4c3c+5pRIfrasD+PzNTylnYUFW8I/IOrWcxyd5GhSf8g2BrcgiaGiz4jEggWe4BtJ73D
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR12MB8690.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(366004)(136003)(376002)(39860400002)(346002)(1800799009)(186009)(451199024)(26005)(2616005)(8936002)(8676002)(4326008)(7416002)(83380400001)(2906002)(36756003)(6666004)(53546011)(6506007)(86362001)(6486002)(478600001)(5660300002)(6916009)(316002)(6512007)(54906003)(66556008)(38100700002)(41300700001)(66476007)(66946007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?RbJh2UU2+2Q+hSFN1NPkM+E6yvDI9k67fnXQVAuz1cf3r60KJpqeHhssEX?=
 =?iso-8859-1?Q?7F3H19vdez6HLWHtvv/DaLg1mFoaL70TzOkJdWXrJ3VAT19ztSdFIHSvCk?=
 =?iso-8859-1?Q?uOUA3kRkfi/9OBwPfa2XLL/2XEIdql8bflW2vdhA/p75JSFZ7/wTcPPxPF?=
 =?iso-8859-1?Q?P5BTJ8Tw1s6otELqj47hpID9SaImuw/dyNPvkJ9ApmFZJnESmXg9zgxczB?=
 =?iso-8859-1?Q?cGFC4TeJmVvw6hpe3iYQHjVnlKaSRqLqc/kgUcshKWLVsJ0ko3oQ1eG471?=
 =?iso-8859-1?Q?xMx2KTk16zGYwKMk9wc3rh8LStZjnnBg6nPSB72IslhJeSlEw+dxYjfBfm?=
 =?iso-8859-1?Q?XmKkW74VRsibBIUBl6knNrZ6Yz5unBykeKOKtDxY24MnTYlMm4nQf3KjyM?=
 =?iso-8859-1?Q?I20dKImEjAWruXph5XrN6vL38yEJUgRyZt7a7ZBm/GogZsU7kQLrXeW4Qu?=
 =?iso-8859-1?Q?gMBXT8tYTrSKN3lsDE3OQJEz+rEft82GTq/dazlk3BknqoEKdeoBYQkq2K?=
 =?iso-8859-1?Q?Brt2DAgNv5ZTLuvy6N/DebNfvO7gxLhhLiJBf52ePwrD+b2Bz7jYCFCnPS?=
 =?iso-8859-1?Q?eZvbKHwhpTFOCPjDad5oKCdwHkU02B5S9+eDNGe0VYMsuvXyaUUV02uOoN?=
 =?iso-8859-1?Q?jyE1NGeWIKalQpyj0zyrf0LIe1npR+jCWyFroojcCl3OO7AqU8HRdfE4kc?=
 =?iso-8859-1?Q?xnLcL229eGHb4gUn0wEWh8HY9apkOVEP8vplT2kZiqn9IHMXjZ+Z1wJz/A?=
 =?iso-8859-1?Q?hAJJ2l1lpZaJb3xNmPadk3UNlJpm3H4Th4PRatE9DkGf21A+E7mPTNoqoE?=
 =?iso-8859-1?Q?DuDzQbDkiF4ndff4hqZvxjZGgs1yJl/5NzY6GXNuF7hYEg44Jw5NchktJL?=
 =?iso-8859-1?Q?H/2b1UOf+RHyh7KlgLpXZATgU+uVT5hQbbJnxHqKF/+cWCpJXzDiFFqhc6?=
 =?iso-8859-1?Q?7Le7KKjx94KKgm4bPMWQ3Pu92fd6TBXnfgQcU9/96MJguMyFbQeankRvM4?=
 =?iso-8859-1?Q?rv+8e2xgPZWJyWK35HiRoxQm832XtjDSM8d87TfknycOtTmNWh6Xut9zOT?=
 =?iso-8859-1?Q?pWHb+QDEU0g+2XY7d+IcNmrPJiGGHIQcKOLuzHaC+V+ocZyZ03cmmKpCId?=
 =?iso-8859-1?Q?+Y1eYxu6S3dLJtRGeDXV9CPcq56n4OiTZXCr27bOrk6M9Wx16ZnlnfBqZ1?=
 =?iso-8859-1?Q?J932qUvxdHgZiXycaurfYVoR7TBL/KMU8AKbyLZpvG1hPP0qYGkx2e2VCn?=
 =?iso-8859-1?Q?fO96hwtnYUy7+VeccTSyN0OQmU1lDwKVgveSi/K/kR03kAv3vs4vOWvJaQ?=
 =?iso-8859-1?Q?pN2O1rSBotjnUNRkT5/HqBxtH3vjsVyxZWY+16lV+6i66BqzldXlaAS26U?=
 =?iso-8859-1?Q?gwTWSFxkk+ba+Lph90h/J+UQW08oa3qB9KxPi5DRAoOjBqi7tTL7JgkvA0?=
 =?iso-8859-1?Q?kOlomvgcziWNNRz2Grbxl5OofSd8sDY29jWlGl+uAS3E1VKuQ14/9Nu6kV?=
 =?iso-8859-1?Q?NihFJDyvu1gbgy4++KfgDajuLjuxAXo8CSVZ2QJZJyplLooLQbM3f0bdFb?=
 =?iso-8859-1?Q?+jVZKzjeIhcv0bJRVX3qyqwR+TIxUOrfBQF5QehdlXh76As/H/TPtXrUWB?=
 =?iso-8859-1?Q?EfIP9v8AvkvfsLlTP3sUV7kD1g5cKSqv22?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d4efb445-4ef2-4921-c698-08dbb9a092b5
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB8690.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Sep 2023 06:12:31.1751
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8tV7MOfrfSo8sPQ7ZubAi6DM1DYwqZPi+hD7wsZuUU9CgNCvevh4wtXz6bMTIcXP5s4/sv1Tq4sjfCck+FtJyQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR12MB8898

On Wed, Sep 20, 2023 at 01:54:03PM +0800, Akihiko Odaki wrote:
> On 2023/09/20 14:50, Huang Rui wrote:
> > On Sat, Sep 16, 2023 at 12:37:29AM +0800, Akihiko Odaki wrote:
> >> On 2023/09/16 1:04, Akihiko Odaki wrote:
> >>> On 2023/09/15 20:11, Huang Rui wrote:
> >>>> From: Antonio Caggiano <antonio.caggiano@collabora.com>
> >>>>
> >>>> Support BLOB resources creation, mapping and unmapping by calling the
> >>>> new stable virglrenderer 0.10 interface. Only enabled when available and
> >>>> via the blob config. E.g. -device virtio-vga-gl,blob=true
> >>>>
> >>>> Signed-off-by: Antonio Caggiano <antonio.caggiano@collabora.com>
> >>>> Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
> >>>> Signed-off-by: Xenia Ragiadakou <xenia.ragiadakou@amd.com>
> >>>> Signed-off-by: Huang Rui <ray.huang@amd.com>
> >>>> ---
> >>>>
> >>>> V4 -> V5:
> >>>>       - Use memory_region_init_ram_ptr() instead of
> >>>>         memory_region_init_ram_device_ptr() (Akihiko)
> >>>>
> >>>>    hw/display/virtio-gpu-virgl.c  | 213 +++++++++++++++++++++++++++++++++
> >>>>    hw/display/virtio-gpu.c        |   4 +-
> >>>>    include/hw/virtio/virtio-gpu.h |   5 +
> >>>>    meson.build                    |   4 +
> >>>>    4 files changed, 225 insertions(+), 1 deletion(-)
> >>>>
> >>>> diff --git a/hw/display/virtio-gpu-virgl.c
> >>>> b/hw/display/virtio-gpu-virgl.c
> >>>> index 312953ec16..563a6f2f58 100644
> >>>> --- a/hw/display/virtio-gpu-virgl.c
> >>>> +++ b/hw/display/virtio-gpu-virgl.c
> >>>> @@ -17,6 +17,7 @@
> >>>>    #include "trace.h"
> >>>>    #include "hw/virtio/virtio.h"
> >>>>    #include "hw/virtio/virtio-gpu.h"
> >>>> +#include "hw/virtio/virtio-gpu-bswap.h"
> >>>>    #include "ui/egl-helpers.h"
> >>>> @@ -78,9 +79,24 @@ static void virgl_cmd_create_resource_3d(VirtIOGPU *g,
> >>>>        virgl_renderer_resource_create(&args, NULL, 0);
> >>>>    }
> >>>> +static void virgl_resource_destroy(VirtIOGPU *g,
> >>>> +                                   struct virtio_gpu_simple_resource
> >>>> *res)
> >>>> +{
> >>>> +    if (!res)
> >>>> +        return;
> >>>> +
> >>>> +    QTAILQ_REMOVE(&g->reslist, res, next);
> >>>> +
> >>>> +    virtio_gpu_cleanup_mapping_iov(g, res->iov, res->iov_cnt);
> >>>> +    g_free(res->addrs);
> >>>> +
> >>>> +    g_free(res);
> >>>> +}
> >>>> +
> >>>>    static void virgl_cmd_resource_unref(VirtIOGPU *g,
> >>>>                                         struct virtio_gpu_ctrl_command
> >>>> *cmd)
> >>>>    {
> >>>> +    struct virtio_gpu_simple_resource *res;
> >>>>        struct virtio_gpu_resource_unref unref;
> >>>>        struct iovec *res_iovs = NULL;
> >>>>        int num_iovs = 0;
> >>>> @@ -88,13 +104,22 @@ static void virgl_cmd_resource_unref(VirtIOGPU *g,
> >>>>        VIRTIO_GPU_FILL_CMD(unref);
> >>>>        trace_virtio_gpu_cmd_res_unref(unref.resource_id);
> >>>> +    res = virtio_gpu_find_resource(g, unref.resource_id);
> >>>> +
> >>>>        virgl_renderer_resource_detach_iov(unref.resource_id,
> >>>>                                           &res_iovs,
> >>>>                                           &num_iovs);
> >>>>        if (res_iovs != NULL && num_iovs != 0) {
> >>>>            virtio_gpu_cleanup_mapping_iov(g, res_iovs, num_iovs);
> >>>> +        if (res) {
> >>>> +            res->iov = NULL;
> >>>> +            res->iov_cnt = 0;
> >>>> +        }
> >>>>        }
> >>>> +
> >>>>        virgl_renderer_resource_unref(unref.resource_id);
> >>>> +
> >>>> +    virgl_resource_destroy(g, res);
> >>
> >> This may leak memory region.
> > 
> > The memory region should be freed under virgl_cmd_resource_unmap_blob()
> > which is calling memory_region_del_subregion(&b->hostmem, res->region).
> > Because this region is created by map_blob(). Do we have the case to call
> > virgl_cmd_resource_unref() without calling virgl_cmd_resource_unmap_blob()
> > for blob memory?
> 
> Calling virgl_cmd_resource_unmap_blob() and virgl_cmd_resource_unref() 
> in order is a guest's responsibility, and we are required to prepare for 
> broken guests.

OK, no problem. I will update this in V6.

Thanks,
Ray

