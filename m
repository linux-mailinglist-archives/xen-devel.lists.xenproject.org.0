Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 990C3860ADC
	for <lists+xen-devel@lfdr.de>; Fri, 23 Feb 2024 07:37:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.684641.1064636 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rdPA8-000512-Vw; Fri, 23 Feb 2024 06:36:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 684641.1064636; Fri, 23 Feb 2024 06:36:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rdPA8-0004xp-RI; Fri, 23 Feb 2024 06:36:00 +0000
Received: by outflank-mailman (input) for mailman id 684641;
 Fri, 23 Feb 2024 06:35:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=oqZf=KA=amd.com=Ray.Huang@srs-se1.protection.inumbo.net>)
 id 1rdPA7-0004xj-3D
 for xen-devel@lists.xenproject.org; Fri, 23 Feb 2024 06:35:59 +0000
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on20600.outbound.protection.outlook.com
 [2a01:111:f403:240a::600])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cb37161b-d215-11ee-98f5-efadbce2ee36;
 Fri, 23 Feb 2024 07:35:55 +0100 (CET)
Received: from SJ2PR12MB8690.namprd12.prod.outlook.com (2603:10b6:a03:540::10)
 by BY5PR12MB4066.namprd12.prod.outlook.com (2603:10b6:a03:207::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7316.26; Fri, 23 Feb
 2024 06:35:50 +0000
Received: from SJ2PR12MB8690.namprd12.prod.outlook.com
 ([fe80::e7a:5022:4b7d:ade1]) by SJ2PR12MB8690.namprd12.prod.outlook.com
 ([fe80::e7a:5022:4b7d:ade1%6]) with mapi id 15.20.7316.023; Fri, 23 Feb 2024
 06:35:50 +0000
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
X-Inumbo-ID: cb37161b-d215-11ee-98f5-efadbce2ee36
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iCkWhrwx0s8oFhENfvUQwM3f7GfVMPhx5KiwNiRSLHTczlRgzwGE2fRf6gGR8OIn51RfN9iTbg47LBo8cnoftJW5YaQqJXAfavGEWy24M8fUrxnRczdeppIxomN09hXqwzIxr0MhNWXCi1M6M4DneEvyICBdofGrfPq0pqvBNb53L5TRNrl+jriU85FYpz4MSV8zQZOuZOgeqbIFe/zWeXiUnawJ7oHzDX9C06q1V8I3WFIBHPENzaF7BiIF6ose0Uogsxqk8PRnEa3aV4dzA1tdAtLe/7wxyyfzfwh3OZICkujekvauOkgd4LE1wGFxZMur3UJ4uAftwsQ1oX7J6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MhACpc4kiVFwEdFtg6pExw1NBrA0ebSBvcu4VULNahc=;
 b=bssT6RMFhd+vVMYOxekW7wsGUdxP7Hqu34yVwm9KShlsT8jI8EltuHIsfbj8faJnOd6ZPvysdloXPqYC4AG96rDz5t5QJnpfQi00UJXpHPYvodNN6KqVvH1qfsk4RR6ByxNsYiNM+zDNReEO2JYejmAN23W5FNDl12TMbs8vBkVE750CZTEuvCUBi44oFLupEdXADZ1tUL6TZvJqrERewI26KAfHRqk/qLGmfBF3f2HPXZaQ4gicCDF64fHyRp334XvGwvfHhRf/joIHEKaScKH4mQpUbJt3VJMfPTC8l5rMGibqxKJbqDjdHQ8CLCE93cxQViYL2KkZxONJAtaHwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MhACpc4kiVFwEdFtg6pExw1NBrA0ebSBvcu4VULNahc=;
 b=YJfJ5NmQOGkkHVjw7ubUzGNdyWHxpNdG6uBietYTfMe9/+rQnYJV9WbW6anM2o87TyE2hGmHmTGmbBXQ3hqr+j8WE9I1XgGB41eCSIi3d9Ift1YFvxgzTtIoV/2j19ql1e9oFvgQiepGMlrYSKmN11h9gxgk9ngzhmJhsLxR8BQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Date: Fri, 23 Feb 2024 14:34:53 +0800
From: Huang Rui <ray.huang@amd.com>
To: Pierre-Eric Pelloux-Prayer <pierre-eric@damsy.net>
Cc: Akihiko Odaki <akihiko.odaki@daynix.com>,
	=?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@gmail.com>,
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
Subject: Re: [PATCH v6 07/11] virtio-gpu: Handle resource blob commands
Message-ID: <Zdg8jYYI1e3+xyJi@amd.com>
References: <20231219075320.165227-1-ray.huang@amd.com>
 <20231219075320.165227-8-ray.huang@amd.com>
 <ccc34ce0-44af-425e-8634-6f7a0583ee12@damsy.net>
 <c986f552-60b8-471a-a439-a8714936fa47@damsy.net>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c986f552-60b8-471a-a439-a8714936fa47@damsy.net>
X-ClientProxiedBy: SI2PR04CA0007.apcprd04.prod.outlook.com
 (2603:1096:4:197::19) To SJ2PR12MB8690.namprd12.prod.outlook.com
 (2603:10b6:a03:540::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR12MB8690:EE_|BY5PR12MB4066:EE_
X-MS-Office365-Filtering-Correlation-Id: ce0c9367-f83f-4423-586b-08dc3439ad03
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	kect6Fcjm+yRcHAebXQQQHvGmmeDzRRYh16DT8bDiI7rf+9pBYeEyQnR1FK9zDhA+IxgdcvdOrS4iWcz7O9Bb1fkuQWUS6qORSxAo+GipgNc41jwADFM0S21/k42Z5MUGULnqA+hPEcNNWEVbwo9NWq0hVP7IyWhNXxWxPHL8HNCVDlAKFUff1Q92eTCp+Dj3HAOcJ1aanbamKGmYydn6Ap2Z+EW1vFGXg7iJOGiFovjB9BhsSSLEQegTHYSFw7gFFH2cE0TL86MUVZwMoORAe1RMttWzvSA4D+FCMRpjmQyryhwR5vYuVnMVw+L7h94mNMj+AvF6EbWCpqA9YWck+zzfV4XlWG67mGcPwQucvbRxtA/Lkoo0piajRVea/3f+26yla1qUXiKQd4WjqPWKFlDK6Lq+RH5AvXFbniJrpeHuhkIksqY/Z+nTdln+9C0rHz86ImZq4SnKQIvCGj4CI7qD3w6H5oimQCcxqqax/vh4xvl1VPlZS2MQwSgGgnmEa2TnyFNHVRFYRZoszlTLaA9thXQl5kwucqEjSYLm4k=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR12MB8690.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?oYPm5RAVwy/29ce+1TAKFZLEOna8JbXsEfylnSw20zVudHIEo8SebfQX3x?=
 =?iso-8859-1?Q?ZdVQ7Fw9EHiOLJDm7CBLXowJAKIjqVwdO8zUqh5pYT6H8UhVRUdMvL9y7H?=
 =?iso-8859-1?Q?GFAPDlCNf2lEm6eBTb++lIIt/Mc0tJ/Si3KoI0GbIywjZsfKQJGyjqsRem?=
 =?iso-8859-1?Q?yz8KbbPvK0scY/FSkzzOnd5AXarmaK0cVzLsnYjY+i2BQhuKYaCXI1pFkw?=
 =?iso-8859-1?Q?iVREN90xYbQFrds9pmSNwF+wgto6CoiUvr0yk722YjFs4tA1X1kmNfukN2?=
 =?iso-8859-1?Q?eR71IfdiwdRTykhMzko5jhEDvTciU2FkgLv7DMW+RnEAjX6o1txo6BNpVF?=
 =?iso-8859-1?Q?4wOTV8zMamFw4SErhqiiKz5gG6qpGdfSWo9W6f++/KUgcTL5W30WiPFW0T?=
 =?iso-8859-1?Q?E+9MZpzeglUjeAFSrRTeooY/idn8sUchE1LgZ2Ko7LE3kQvGuPATYg2/r8?=
 =?iso-8859-1?Q?KJHuPB1iXHgmfVy9lK7pyrf8LolXYrGbYz19c9BT8wX/eh0RA6ooSTjp67?=
 =?iso-8859-1?Q?Gn7dmxfiJLV01ixcy0s/wsquCyURUbTb48LQ66HixyG5thz7UtdPa7Y216?=
 =?iso-8859-1?Q?mfo0/eAm/oJJe0bXrmShBjkZC361TssFHRs2ptpk400ErQSgyanyTuT8sU?=
 =?iso-8859-1?Q?F7+wSDY5aIsa6qeYQC6L9woPCUwkW1qRJ6hiUG4OmUcHa7x+wb62O+SO6h?=
 =?iso-8859-1?Q?QZKugQM+F5VNydmaqzDNQphGJcsU31yXE3LTwu/FIMyf/9noUAaUBDTauH?=
 =?iso-8859-1?Q?661WUagOANxQdOmh+tTLNyYliz2BlVK6+MmjDjyHfMUuqwtl7gUPOz8L/3?=
 =?iso-8859-1?Q?yU70BLpa2wvF76p6Y05lWUTmnZl9p4b6i260DDs8W/3khZ1yriYZRnt46N?=
 =?iso-8859-1?Q?GJNSUKxYHBBoL8HRJSdiVWXfTLBACWJAgJDb0kaERGRUdrEJFdcOrlJUQE?=
 =?iso-8859-1?Q?C9TtJ/rrVYBVD38CB3/5DfcVJ2StIZIUJBEEbfNSAB3uTHpudNeF/Yed1v?=
 =?iso-8859-1?Q?Tt3dKnQOZNjVlMPD82N5jQKEH4SWzTD7u281Z/bvHtF6+InASiJqKZjbJO?=
 =?iso-8859-1?Q?O7/zUwLefsU/njDvHLr3oAPrudhOPN2VnE/4Iad8hL1wPNH8ryK7YwZk5j?=
 =?iso-8859-1?Q?7WT9mv9IGgQYTTdpq5le0J1pYOj8upcsekQvdWqoIcBUYQFtCamWBpHTEt?=
 =?iso-8859-1?Q?nAv8P7XNoaZBHIYB0REqD281zgs99go3znUT1wHVgR/0gH+MwfWQpvF7dl?=
 =?iso-8859-1?Q?QvM5K3+dDlT1o09qRavL3xIgCY05NtFzesG9+s6BjaMm6pNmzHa/2NQN1b?=
 =?iso-8859-1?Q?mOXppNU1oCNHFeyTLT/9epwiU9M8xBJE/plN63PSlS4CNe+DhAXPHx0pSj?=
 =?iso-8859-1?Q?GtwKwMLwnbdrhW3HvsPWvBGrQOqgyf+YViQQSq4puqEe/GCr5rL33nhDSe?=
 =?iso-8859-1?Q?FlkGZCtynNsZXPGvRnhRLUJp66LTP8OXpmSBsbKRfyZNGMDQyz24ADNJPN?=
 =?iso-8859-1?Q?klEZTfe9WpjK2QxAPgzRqqPUXgRC1izqonrCk91gVvRT23+mBVH9Kvz8kJ?=
 =?iso-8859-1?Q?GnOeNaT9f9O0f93r+N1Xs6NxWKCHwHPWgiWPRgxTLE36AyTiRV2r7nMgXG?=
 =?iso-8859-1?Q?sq/zW84mkUDJg/hfIlM8leENyWGcG0q90w?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ce0c9367-f83f-4423-586b-08dc3439ad03
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB8690.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Feb 2024 06:35:50.3883
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uWlO1D35SxwrtwgiIpy08JL/O/34S56jTfjPffcRww0m5di7qnZTfzpIAxDt6F1ELzZG3gocVeJJZ10aoxpm5A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4066

On Wed, Jan 10, 2024 at 04:51:31PM +0800, Pierre-Eric Pelloux-Prayer wrote:
> 
> 
> Le 09/01/2024 à 17:50, Pierre-Eric Pelloux-Prayer a écrit :
> > 
> > 
> > Le 19/12/2023 à 08:53, Huang Rui a écrit :
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
> >> Changes in v6:
> >> - Use new struct virgl_gpu_resource.
> >> - Unmap, unref and destroy the resource only after the memory region
> >>    has been completely removed.
> >> - In unref check whether the resource is still mapped.
> >> - In unmap_blob check whether the resource has been already unmapped.
> >> - Fix coding style
> >>
> >>   hw/display/virtio-gpu-virgl.c | 274 +++++++++++++++++++++++++++++++++-
> >>   hw/display/virtio-gpu.c       |   4 +-
> >>   meson.build                   |   4 +
> >>   3 files changed, 276 insertions(+), 6 deletions(-)
> >>
> >> diff --git a/hw/display/virtio-gpu-virgl.c b/hw/display/virtio-gpu-virgl.c
> >> index faab374336..5a3a292f79 100644
> >> --- a/hw/display/virtio-gpu-virgl.c
> >> +++ b/hw/display/virtio-gpu-virgl.c
> >> @@ -17,6 +17,7 @@
> >>   #include "trace.h"
> >>   #include "hw/virtio/virtio.h"
> >>   #include "hw/virtio/virtio-gpu.h"
> >> +#include "hw/virtio/virtio-gpu-bswap.h"
> >>   #include "ui/egl-helpers.h"
> >> @@ -24,8 +25,62 @@
> >>   struct virgl_gpu_resource {
> >>       struct virtio_gpu_simple_resource res;
> >> +    uint32_t ref;
> >> +    VirtIOGPU *g;
> >> +
> >> +#ifdef HAVE_VIRGL_RESOURCE_BLOB
> >> +    /* only blob resource needs this region to be mapped as guest mmio */
> >> +    MemoryRegion *region;
> >> +#endif
> >>   };
> >> +static void vres_get_ref(struct virgl_gpu_resource *vres)
> >> +{
> >> +    uint32_t ref;
> >> +
> >> +    ref = qatomic_fetch_inc(&vres->ref);
> >> +    g_assert(ref < INT_MAX);
> >> +}
> >> +
> >> +static void virgl_resource_destroy(struct virgl_gpu_resource *vres)
> >> +{
> >> +    struct virtio_gpu_simple_resource *res;
> >> +    VirtIOGPU *g;
> >> +
> >> +    if (!vres) {
> >> +        return;
> >> +    }
> >> +
> >> +    g = vres->g;
> >> +    res = &vres->res;
> >> +    QTAILQ_REMOVE(&g->reslist, res, next);
> >> +    virtio_gpu_cleanup_mapping(g, res);
> >> +    g_free(vres);
> >> +}
> >> +
> >> +static void virgl_resource_unref(struct virgl_gpu_resource *vres)
> >> +{
> >> +    struct virtio_gpu_simple_resource *res;
> >> +
> >> +    if (!vres) {
> >> +        return;
> >> +    }
> >> +
> >> +    res = &vres->res;
> >> +    virgl_renderer_resource_detach_iov(res->resource_id, NULL, NULL);
> >> +    virgl_renderer_resource_unref(res->resource_id);
> >> +}
> >> +
> >> +static void vres_put_ref(struct virgl_gpu_resource *vres)
> >> +{
> >> +    g_assert(vres->ref > 0);
> >> +
> >> +    if (qatomic_fetch_dec(&vres->ref) == 1) {
> >> +        virgl_resource_unref(vres);
> >> +        virgl_resource_destroy(vres);
> >> +    }
> >> +}
> >> +
> >>   static struct virgl_gpu_resource *
> >>   virgl_gpu_find_resource(VirtIOGPU *g, uint32_t resource_id)
> >>   {
> >> @@ -59,6 +114,8 @@ static void virgl_cmd_create_resource_2d(VirtIOGPU *g,
> >>                                          c2d.width, c2d.height);
> >>       vres = g_new0(struct virgl_gpu_resource, 1);
> >> +    vres_get_ref(vres);
> >> +    vres->g = g;
> >>       vres->res.width = c2d.width;
> >>       vres->res.height = c2d.height;
> >>       vres->res.format = c2d.format;
> >> @@ -91,6 +148,8 @@ static void virgl_cmd_create_resource_3d(VirtIOGPU *g,
> >>                                          c3d.width, c3d.height, c3d.depth);
> >>       vres = g_new0(struct virgl_gpu_resource, 1);
> >> +    vres_get_ref(vres);
> >> +    vres->g = g;
> >>       vres->res.width = c3d.width;
> >>       vres->res.height = c3d.height;
> >>       vres->res.format = c3d.format;
> >> @@ -126,12 +185,21 @@ static void virgl_cmd_resource_unref(VirtIOGPU *g,
> >>           return;
> >>       }
> >> -    virgl_renderer_resource_detach_iov(unref.resource_id, NULL, NULL);
> >> -    virgl_renderer_resource_unref(unref.resource_id);
> >> +#ifdef HAVE_VIRGL_RESOURCE_BLOB
> >> +    if (vres->region) {
> >> +        VirtIOGPUBase *b = VIRTIO_GPU_BASE(g);
> >> +        MemoryRegion *mr = vres->region;
> >> +
> >> +        warn_report("%s: blob resource %d not unmapped",
> >> +                    __func__, unref.resource_id);
> >> +        vres->region = NULL;
> > 
> > Shouldn't there be a call to memory_region_unref(mr)?
> > 
> >> +        memory_region_set_enabled(mr, false);
> >> +        memory_region_del_subregion(&b->hostmem, mr);
> >> +        object_unparent(OBJECT(mr));
> >> +    }
> >> +#endif /* HAVE_VIRGL_RESOURCE_BLOB */
> >> -    QTAILQ_REMOVE(&g->reslist, &vres->res, next);
> >> -    virtio_gpu_cleanup_mapping(g, &vres->res);
> >> -    g_free(vres);
> >> +    vres_put_ref(vres);
> >>   }
> >>   static void virgl_cmd_context_create(VirtIOGPU *g,
> >> @@ -470,6 +538,191 @@ static void virgl_cmd_get_capset(VirtIOGPU *g,
> >>       g_free(resp);
> >>   }
> >> +#ifdef HAVE_VIRGL_RESOURCE_BLOB
> >> +
> >> +static void virgl_resource_unmap(struct virgl_gpu_resource *vres)
> >> +{
> >> +    if (!vres) {
> >> +        return;
> >> +    }
> >> +
> >> +    virgl_renderer_resource_unmap(vres->res.resource_id);
> >> +
> >> +    vres_put_ref(vres);
> >> +}
> >> +
> >> +static void virgl_resource_blob_async_unmap(void *obj)
> >> +{
> >> +    MemoryRegion *mr = MEMORY_REGION(obj);
> >> +    struct virgl_gpu_resource *vres = mr->opaque;
> >> +
> >> +    virgl_resource_unmap(vres);
> >> +
> >> +    g_free(obj);
> >> +}
> >> +
> >> +static void virgl_cmd_resource_create_blob(VirtIOGPU *g,
> >> +                                           struct virtio_gpu_ctrl_command *cmd)
> >> +{
> >> +    struct virgl_gpu_resource *vres;
> >> +    struct virtio_gpu_resource_create_blob cblob;
> >> +    struct virgl_renderer_resource_create_blob_args virgl_args = { 0 };
> >> +    int ret;
> >> +
> >> +    VIRTIO_GPU_FILL_CMD(cblob);
> >> +    virtio_gpu_create_blob_bswap(&cblob);
> >> +    trace_virtio_gpu_cmd_res_create_blob(cblob.resource_id, cblob.size);
> >> +
> >> +    if (cblob.resource_id == 0) {
> >> +        qemu_log_mask(LOG_GUEST_ERROR, "%s: resource id 0 is not allowed\n",
> >> +                      __func__);
> >> +        cmd->error = VIRTIO_GPU_RESP_ERR_INVALID_RESOURCE_ID;
> >> +        return;
> >> +    }
> >> +
> >> +    vres = virgl_gpu_find_resource(g, cblob.resource_id);
> >> +    if (vres) {
> >> +        qemu_log_mask(LOG_GUEST_ERROR, "%s: resource already exists %d\n",
> >> +                      __func__, cblob.resource_id);
> >> +        cmd->error = VIRTIO_GPU_RESP_ERR_INVALID_RESOURCE_ID;
> >> +        return;
> >> +    }
> >> +
> >> +    vres = g_new0(struct virgl_gpu_resource, 1);
> >> +    vres_get_ref(vres);
> >> +    vres->g = g;
> >> +    vres->res.resource_id = cblob.resource_id;
> >> +    vres->res.blob_size = cblob.size;
> >> +
> >> +    if (cblob.blob_mem != VIRTIO_GPU_BLOB_MEM_HOST3D) {
> >> +        ret = virtio_gpu_create_mapping_iov(g, cblob.nr_entries, sizeof(cblob),
> >> +                                            cmd, &vres->res.addrs,
> >> +                                            &vres->res.iov, &vres->res.iov_cnt);
> >> +        if (!ret) {
> >> +            g_free(vres);
> >> +            cmd->error = VIRTIO_GPU_RESP_ERR_UNSPEC;
> >> +            return;
> >> +        }
> >> +    }
> >> +
> >> +    QTAILQ_INSERT_HEAD(&g->reslist, &vres->res, next);
> >> +
> >> +    virgl_args.res_handle = cblob.resource_id;
> >> +    virgl_args.ctx_id = cblob.hdr.ctx_id;
> >> +    virgl_args.blob_mem = cblob.blob_mem;
> >> +    virgl_args.blob_id = cblob.blob_id;
> >> +    virgl_args.blob_flags = cblob.blob_flags;
> >> +    virgl_args.size = cblob.size;
> >> +    virgl_args.iovecs = vres->res.iov;
> >> +    virgl_args.num_iovs = vres->res.iov_cnt;
> >> +
> >> +    ret = virgl_renderer_resource_create_blob(&virgl_args);
> >> +    if (ret) {
> >> +        qemu_log_mask(LOG_GUEST_ERROR, "%s: virgl blob create error: %s\n",
> >> +                      __func__, strerror(-ret));
> >> +        cmd->error = VIRTIO_GPU_RESP_ERR_UNSPEC;
> >> +    }
> >> +}
> >> +
> >> +static void virgl_cmd_resource_map_blob(VirtIOGPU *g,
> >> +                                        struct virtio_gpu_ctrl_command *cmd)
> >> +{
> >> +    struct virgl_gpu_resource *vres;
> >> +    struct virtio_gpu_resource_map_blob mblob;
> >> +    int ret;
> >> +    void *data;
> >> +    uint64_t size;
> >> +    struct virtio_gpu_resp_map_info resp;
> >> +    VirtIOGPUBase *b = VIRTIO_GPU_BASE(g);
> >> +
> >> +    VIRTIO_GPU_FILL_CMD(mblob);
> >> +    virtio_gpu_map_blob_bswap(&mblob);
> >> +
> >> +    if (mblob.resource_id == 0) {
> >> +        qemu_log_mask(LOG_GUEST_ERROR, "%s: resource id 0 is not allowed\n",
> >> +                      __func__);
> >> +        cmd->error = VIRTIO_GPU_RESP_ERR_INVALID_RESOURCE_ID;
> >> +        return;
> >> +    }
> >> +
> >> +    vres = virgl_gpu_find_resource(g, mblob.resource_id);
> >> +    if (!vres) {
> >> +        qemu_log_mask(LOG_GUEST_ERROR, "%s: resource does not exist %d\n",
> >> +                      __func__, mblob.resource_id);
> >> +        cmd->error = VIRTIO_GPU_RESP_ERR_INVALID_RESOURCE_ID;
> >> +        return;
> >> +    }
> >> +    if (vres->region) {
> >> +        qemu_log_mask(LOG_GUEST_ERROR, "%s: resource already mapped %d\n",
> >> +                      __func__, mblob.resource_id);
> >> +        cmd->error = VIRTIO_GPU_RESP_ERR_INVALID_RESOURCE_ID;
> >> +        return;
> >> +    }
> >> +
> >> +    ret = virgl_renderer_resource_map(vres->res.resource_id, &data, &size);
> >> +    if (ret) {
> >> +        qemu_log_mask(LOG_GUEST_ERROR, "%s: resource map error: %s\n",
> >> +                      __func__, strerror(-ret));
> >> +        cmd->error = VIRTIO_GPU_RESP_ERR_INVALID_RESOURCE_ID;
> >> +        return;
> >> +    }
> >> +
> >> +    vres_get_ref(vres);
> > 
> > Why is this needed? And if it is, shouldn't virgl_cmd_resource_unmap_blob
> > call "vres_put_ref(vres)" ?
> > 
> >> +    vres->region = g_new0(MemoryRegion, 1);
> >> +    memory_region_init_ram_ptr(vres->region, OBJECT(g), NULL, size, data);
> >> +    vres->region->opaque = vres;
> >> +    OBJECT(vres->region)->free = virgl_resource_blob_async_unmap;
> >> +    memory_region_add_subregion(&b->hostmem, mblob.offset, vres->region);
> >> +    memory_region_set_enabled(vres->region, true);
> >> +
> >> +    memset(&resp, 0, sizeof(resp));
> >> +    resp.hdr.type = VIRTIO_GPU_RESP_OK_MAP_INFO;
> >> +    virgl_renderer_resource_get_map_info(mblob.resource_id, &resp.map_info);
> >> +    virtio_gpu_ctrl_response(g, cmd, &resp.hdr, sizeof(resp));
> >> +}
> >> +
> >> +static void virgl_cmd_resource_unmap_blob(VirtIOGPU *g,
> >> +                                          struct virtio_gpu_ctrl_command *cmd)
> >> +{
> >> +    struct virgl_gpu_resource *vres;
> >> +    struct virtio_gpu_resource_unmap_blob ublob;
> >> +    VirtIOGPUBase *b = VIRTIO_GPU_BASE(g);
> >> +    MemoryRegion *mr;
> >> +
> >> +    VIRTIO_GPU_FILL_CMD(ublob);
> >> +    virtio_gpu_unmap_blob_bswap(&ublob);
> >> +
> >> +    if (ublob.resource_id == 0) {
> >> +        qemu_log_mask(LOG_GUEST_ERROR, "%s: resource id 0 is not allowed\n",
> >> +                      __func__);
> >> +        cmd->error = VIRTIO_GPU_RESP_ERR_INVALID_RESOURCE_ID;
> >> +        return;
> >> +    }
> >> +
> >> +    vres = virgl_gpu_find_resource(g, ublob.resource_id);
> >> +    if (!vres) {
> >> +        qemu_log_mask(LOG_GUEST_ERROR, "%s: resource does not exist %d\n",
> >> +                      __func__, ublob.resource_id);
> >> +        cmd->error = VIRTIO_GPU_RESP_ERR_INVALID_RESOURCE_ID;
> >> +        return;
> >> +    }
> >> +
> >> +    if (!vres->region) {
> >> +        qemu_log_mask(LOG_GUEST_ERROR, "%s: resource already unmapped %d\n",
> >> +                      __func__, ublob.resource_id);
> >> +        cmd->error = VIRTIO_GPU_RESP_ERR_INVALID_RESOURCE_ID;
> >> +        return;
> >> +    }
> >> +
> >> +    mr = vres->region;
> >> +    vres->region = NULL;
> > 
> > memory_region_unref(mr)?
> > 
> > Note that AFAICT without the added memory_region_unref() calls virgl_resource_unmap()
> > was never called.
> 
> 
> Xenia and I figured out the refcounting issue: this code is written based on the
> assumption that:
>   
>     object_unparent(OBJECT(mr));
> 
> 
> Will decrement the refcount. But this assumption is only true if mr->parent_obj.parent
> is non-NULL.
> 
> The map_blob function uses the following arguments:
> 
>     memory_region_init_ram_ptr(vres->region, OBJECT(g), NULL, size, data);
> 
> Since name is NULL, mr won't be added as a child of 'g' and thus object_unparent()
> does nothing.
> 
> I'd suggest 2 changes:
>     * use a name ("blob_memory"?) to so mr can be a child of g
>     * increment mr's refcount when setting vres->region and decrement it when clearing it.
>       This change is not needed technically but when a variable is refcounted it seems
>       clearer to increment/decrement the refcount in these situations.
> 

Yes, issue is caused by NULL in name field, I will update according to your
suggestions in V7.

Thanks,
Ray

> 
> Pierre-Eric
> 
> 
> > 
> >> +    memory_region_set_enabled(mr, false);
> >> +    memory_region_del_subregion(&b->hostmem, mr);
> >> +    object_unparent(OBJECT(mr));
> >> +}
> >> +
> >> +#endif /* HAVE_VIRGL_RESOURCE_BLOB */
> >> +
> >>   void virtio_gpu_virgl_process_cmd(VirtIOGPU *g,
> >>                                         struct virtio_gpu_ctrl_command *cmd)
> >>   {
> >> @@ -536,6 +789,17 @@ void virtio_gpu_virgl_process_cmd(VirtIOGPU *g,
> >>       case VIRTIO_GPU_CMD_GET_EDID:
> >>           virtio_gpu_get_edid(g, cmd);
> >>           break;
> >> +#ifdef HAVE_VIRGL_RESOURCE_BLOB
> >> +    case VIRTIO_GPU_CMD_RESOURCE_CREATE_BLOB:
> >> +        virgl_cmd_resource_create_blob(g, cmd);
> >> +        break;
> >> +    case VIRTIO_GPU_CMD_RESOURCE_MAP_BLOB:
> >> +        virgl_cmd_resource_map_blob(g, cmd);
> >> +        break;
> >> +    case VIRTIO_GPU_CMD_RESOURCE_UNMAP_BLOB:
> >> +        virgl_cmd_resource_unmap_blob(g, cmd);
> >> +        break;
> >> +#endif /* HAVE_VIRGL_RESOURCE_BLOB */
> >>       default:
> >>           cmd->error = VIRTIO_GPU_RESP_ERR_UNSPEC;
> >>           break;
> >> diff --git a/hw/display/virtio-gpu.c b/hw/display/virtio-gpu.c
> >> index 4c3ec9d0ea..8189c392dc 100644
> >> --- a/hw/display/virtio-gpu.c
> >> +++ b/hw/display/virtio-gpu.c
> >> @@ -1449,10 +1449,12 @@ void virtio_gpu_device_realize(DeviceState *qdev, Error **errp)
> >>               return;
> >>           }
> >> +#ifndef HAVE_VIRGL_RESOURCE_BLOB
> >>           if (virtio_gpu_virgl_enabled(g->parent_obj.conf)) {
> >> -            error_setg(errp, "blobs and virgl are not compatible (yet)");
> >> +            error_setg(errp, "Linked virglrenderer does not support blob resources");
> >>               return;
> >>           }
> >> +#endif
> >>       }
> >>       if (!virtio_gpu_base_device_realize(qdev,
> >> diff --git a/meson.build b/meson.build
> >> index ea52ef1b9c..629407128e 100644
> >> --- a/meson.build
> >> +++ b/meson.build
> >> @@ -1054,6 +1054,10 @@ if not get_option('virglrenderer').auto() or have_system or have_vhost_user_gpu
> >>                            cc.has_function('virgl_renderer_context_create_with_flags',
> >>                                            prefix: '#include <virglrenderer.h>',
> >>                                            dependencies: virgl))
> >> +    config_host_data.set('HAVE_VIRGL_RESOURCE_BLOB',
> >> +                         cc.has_function('virgl_renderer_resource_create_blob',
> >> +                                         prefix: '#include <virglrenderer.h>',
> >> +                                         dependencies: virgl))
> >>     endif
> >>   endif
> >>   rutabaga = not_found
> > 

