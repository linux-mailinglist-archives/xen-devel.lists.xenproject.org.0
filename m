Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D0D779369A
	for <lists+xen-devel@lfdr.de>; Wed,  6 Sep 2023 09:57:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.596299.930144 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qdnP5-00076L-U6; Wed, 06 Sep 2023 07:56:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 596299.930144; Wed, 06 Sep 2023 07:56:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qdnP5-00074W-RP; Wed, 06 Sep 2023 07:56:47 +0000
Received: by outflank-mailman (input) for mailman id 596299;
 Wed, 06 Sep 2023 07:56:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=3g10=EW=amd.com=Ray.Huang@srs-se1.protection.inumbo.net>)
 id 1qdnP4-00074O-Fc
 for xen-devel@lists.xenproject.org; Wed, 06 Sep 2023 07:56:46 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on20608.outbound.protection.outlook.com
 [2a01:111:f400:7eab::608])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id eac9133a-4c8a-11ee-9b0d-b553b5be7939;
 Wed, 06 Sep 2023 09:56:43 +0200 (CEST)
Received: from SJ2PR12MB8690.namprd12.prod.outlook.com (2603:10b6:a03:540::10)
 by MW4PR12MB6825.namprd12.prod.outlook.com (2603:10b6:303:20d::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.34; Wed, 6 Sep
 2023 07:56:37 +0000
Received: from SJ2PR12MB8690.namprd12.prod.outlook.com
 ([fe80::da13:5f6:45:fa40]) by SJ2PR12MB8690.namprd12.prod.outlook.com
 ([fe80::da13:5f6:45:fa40%4]) with mapi id 15.20.6745.030; Wed, 6 Sep 2023
 07:56:37 +0000
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
X-Inumbo-ID: eac9133a-4c8a-11ee-9b0d-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cQPe/N9wkzJnlycJ1DspCmw1XFRiOiJ3Mbu/ELHV7GzsIqWxh0hwYZCvQjn4gOtqU5oNVi6cTvq9Wx3wJKbRrR4iTDjRODcoWANE3ApY0KPKzMLimCgfzts0Isozct0emBuMXEjGE9j6VeMijwP32unLweN0yPEWcViNUKX4LW6vg8nD+Glvhha4sRAfs2NFGYR4oSY46KQrVWI3yMfIcNJChLP9wThjOYqqpQXgNA7V5IhyswwomaZ3Io1YuVKmS0pYgxsm3FOVp4N8monMuwcsbn67ZX+BNsPM34DbmztvvtdaKdJW4BlHrfbcjtqRlaljJEPYzWP9CploNr2oxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7SkGQgPYJx9/6zWq+enDufxrCOY5Fc5Z7JoDDDYEmCI=;
 b=Yw75d48s2G7AXEaI0BxyTVAjjk0TMEUXdG54SR/vpwto1BM0ARA8JQ80i1t+yGS61bU+OyoTP9SUi552DYD3Vq8PKCtKzi1DfwVr5103okYQY8U3fIUCJGyO6MgnGqsVRSBoT18+py8s6XqqOe+6ciP22e7InbOjWrxMtTLhUchNYqqY9NJ7sRuomEOInhgDdYTrNFWkxopwtq4v3vrHWJ3x+rYJzh6UOeweg51Mwi6mR1g8Z/6NZ84DvcOhsgcPdHYm3KKo67SuNSNZ+CC2ig4fX7LngpErZka1leZfn2wSDArqGO4tR8W5X+fyFlSTTYOS95OEuW654CxQvH16XA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7SkGQgPYJx9/6zWq+enDufxrCOY5Fc5Z7JoDDDYEmCI=;
 b=jPsYnCCx1IdlY/5IPwcIAFfwBukS1ce7efxe7XZZv2zGvvfdmAn4Xd7FHgXB6PP9dxzVFDD+xUTcoFyYJYcF56B9A42mSe7dL6BlVq6MKt873acsX4dDBy+yvj7shnJvixcgtmwpx6810JagsIdq5wc2gq9O53f7dIJpi5O7lHs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Date: Wed, 6 Sep 2023 15:56:12 +0800
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
Subject: Re: [QEMU PATCH v4 09/13] virtio-gpu: Handle resource blob commands
Message-ID: <ZPgwnMR5YM9rFLtK@amd.com>
References: <20230831093252.2461282-1-ray.huang@amd.com>
 <20230831093252.2461282-10-ray.huang@amd.com>
 <ba478789-5db0-4011-bed1-7dd6901eccd6@daynix.com>
 <ZPbwGA3apjQTtCeu@amd.com>
 <053ecca7-f76d-4289-9189-0c3600d4804b@daynix.com>
 <ZPftWfuwLKafLPah@amd.com>
 <9d883490-3c82-4016-a290-6570f682908a@daynix.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9d883490-3c82-4016-a290-6570f682908a@daynix.com>
X-ClientProxiedBy: TY2PR02CA0068.apcprd02.prod.outlook.com
 (2603:1096:404:e2::32) To SJ2PR12MB8690.namprd12.prod.outlook.com
 (2603:10b6:a03:540::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR12MB8690:EE_|MW4PR12MB6825:EE_
X-MS-Office365-Filtering-Correlation-Id: 6aee892b-bf98-48a0-233f-08dbaeaecbe3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	hmHz2xCT2NcKZVr8g2DviEDK7HzQG4sAqXQS3Hj4vQ8y4esr3qYpzLJU2McjKuGXfMEqOkNSYkAbAqResz3VZ2ca/aX2nyFb+vjsMiopFRB5BXrw0bQ1cC6M4oap8iKC846MFiINKE3KGODpMMgkkDYrh13Xg4jPxLrFTOLDeN4jtPAyPPIXgw7a40T9FtuyADQ3ONeOp11wUBscwujTASCkduoysCo/vaziLyE4AIohNg2xGEvc0aOgnRowJJjURXhmRRpJdHzpJ16AWzDiG0tBvFHnaEe6pZDuFMETWwVJ7r2RMLHy7gM31Pr5Nvh37EApVzWMlXkcF3iWt+gQmvWh+Qzekia8xVBjkb9RDCBY+JVCoZrW92hClT8k3VksEfS1WBy2vwOqb85H61CsO0oSeXsGd3ZIcbQ+39KEFg6aem5hvQOm+LJw4rPt/8D/KvMSAZR7zCbl3OKi2zCjVryKLjcZ9rdBlQBsy80OMNq+iYA1ok3FGb1mq5BwmYJV+rsOm59X53QyrHMYQzaJzWdKH6jd1z2ZvoljISQkJrKVcZjtPrI0i3gdueT42mPQ7iEkmZIyXAfmxk3GsTyfOELJ5s1Gka3YQXLRs/JS4Fk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR12MB8690.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(39860400002)(366004)(396003)(346002)(136003)(186009)(451199024)(1800799009)(83380400001)(26005)(2616005)(54906003)(66476007)(66556008)(66946007)(316002)(6916009)(4326008)(8676002)(8936002)(41300700001)(5660300002)(53546011)(6486002)(6506007)(6512007)(6666004)(2906002)(30864003)(7416002)(478600001)(86362001)(36756003)(38100700002)(21314003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?F2lUgGBZowA8fnOkBVrkrX+24Dowf4bbYezKI3cCAsrtAVNZSViE6SkFApm9?=
 =?us-ascii?Q?z6KMYUpIaZgctomgDs1DXyZHJtwFIDAVvDOiu6kAfYhpw/+eg1arX9b8VMv9?=
 =?us-ascii?Q?dIpftdUtVT685hDI8ahbPF7W9dpSC0U/VRNp/kPUKXK0Lap7aA5xymNkzvi6?=
 =?us-ascii?Q?bbozmLf/XfW8AjfsERpWc488SvLnArvsjrkclBIdDd8s6Yk+sTN7CjiLDDR5?=
 =?us-ascii?Q?4o5sxp0da4KfHxXNA+3TqPGQtPRFhd5S08m7ruLm0L4XFyt7nQZ+zIdIyclW?=
 =?us-ascii?Q?4rlezssJEqxFFNbfhlSUiBssq2nEn9KhMk+yR8GvFCJmXu4s2xsvMILi6nAy?=
 =?us-ascii?Q?NKsNBUbsfqAj7Mz7fg2EKublJxAAAvvx0B3CH1hqy2SkrIyKG7j+WeaT2Yhs?=
 =?us-ascii?Q?38FPKHYsJzOiJf2XxGfp821ePCSCnwMslkO8+1Cl+o0Ce79V8jvPaA2jqoyY?=
 =?us-ascii?Q?cZUyBtdAE9TbscrKrOEdeJ1zpZNxPmCJGdA0NIhcbhi50mPU8J52FFvKG27u?=
 =?us-ascii?Q?kZ0dS8Xrb5MA3rgOimfRnR+d2yQ6EoKXUtXMvXLQPZjW5rWPnNMx1CjW919b?=
 =?us-ascii?Q?+FN3FvsCq6zllCB4EJ62wAL8Gaa9nIm2rPSkEZE9UpChr3lH7RdL9l2754Ys?=
 =?us-ascii?Q?LQdSs8OgfH8mvv1eyUAOFybsc12gcRX1WK+LfdHexCQYY1sRIKp0N+NIg0wT?=
 =?us-ascii?Q?aDv2xvCM0nlM9KyVucGvsQ9+NnAj12f0pJlnKmoeLp8sSjCFVWUWyrxljhZa?=
 =?us-ascii?Q?maKg0VDRaOunf1DK9ur4vAp4hCEkpkNSdN/F8C1MkGeitvgs+GBxZ6I6VSam?=
 =?us-ascii?Q?R3w4wYOi4dxp+DqLl9HxO+0w4gKYfRggIWohoDkYvW1hpetsA/0PnOCipdec?=
 =?us-ascii?Q?k7ixCFRzXJQqG4j74PGB6LOGgFod1i+MUFN+ohNhvvU3bbYWIxrOO42QWV1p?=
 =?us-ascii?Q?yHXaUBIFO0oC0dJuw5aZd6LKk6Iisi6dB8Evp5/4HCAkQi8iIy3McFScBGVb?=
 =?us-ascii?Q?v0GE+nK4o5nd/Dmi7jQ6RMIqLnoP6wHxeGtFSNWJ6MxGPcEv8MURAee1Ee54?=
 =?us-ascii?Q?snjYKcK/gymYDZL2F3eAeZDYR+UNWBS0egWBmiTlxJQ/8CknMX8auxzNwXr4?=
 =?us-ascii?Q?nnYDFQraN6P2HlWerhnuzvgDV3gZGjLst9LGzS5PlH1IAapk/tUTlAM2EKzK?=
 =?us-ascii?Q?oAYeoGfaGbDfPivUG34WX0GxwRVdkIfaWxnx8e+CAy+VkWJksWgl8dIj77jW?=
 =?us-ascii?Q?oHarcZIgKt8gF5JTZDhpcqjRYvNhPoMD9gUjl/FgoE9h8TzFttohH2ruEdew?=
 =?us-ascii?Q?+FwZGcdlCiXp5idXhwz3FnFt0rP7mFw9N0zkYx+OaldlNKr9NtRZ/7n5rO96?=
 =?us-ascii?Q?Sfbv/cojcLl0QV2ill94HyVo2oE3xDh+uUNi3FLNoCv7Fb1r8VJG9L+357M5?=
 =?us-ascii?Q?vJ+WIzl2VHeuw4Ca9Flb7woo/zggbzru0JmnWVh+WSl5yCbEvp0osLDV2FsY?=
 =?us-ascii?Q?S2wl9SQO5kuDiQWKezKgReMrDEmBGKfykVUtJc2QCGf1BE4Uac3pNmU/VvaJ?=
 =?us-ascii?Q?CPSk/nQJxoe51Dx9Ouu7l/kUhcolOnc/fTb2pqs8?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6aee892b-bf98-48a0-233f-08dbaeaecbe3
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB8690.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2023 07:56:37.3162
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: o45J3mama7HEFYWCSw3gsGI6nNPYlZvbgBTxvWGWxFXE3o71JmdfmhcQLV0iP46kezCnL8nrZCBfZK8wCNVIZg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB6825

On Wed, Sep 06, 2023 at 11:39:09AM +0800, Akihiko Odaki wrote:
> On 2023/09/06 12:09, Huang Rui wrote:
> > On Tue, Sep 05, 2023 at 05:20:43PM +0800, Akihiko Odaki wrote:
> >> On 2023/09/05 18:08, Huang Rui wrote:
> >>> On Thu, Aug 31, 2023 at 06:24:32PM +0800, Akihiko Odaki wrote:
> >>>> On 2023/08/31 18:32, Huang Rui wrote:
> >>>>> From: Antonio Caggiano <antonio.caggiano@collabora.com>
> >>>>>
> >>>>> Support BLOB resources creation, mapping and unmapping by calling the
> >>>>> new stable virglrenderer 0.10 interface. Only enabled when available and
> >>>>> via the blob config. E.g. -device virtio-vga-gl,blob=true
> >>>>>
> >>>>> Signed-off-by: Antonio Caggiano <antonio.caggiano@collabora.com>
> >>>>> Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
> >>>>> Signed-off-by: Xenia Ragiadakou <xenia.ragiadakou@amd.com>
> >>>>> Signed-off-by: Huang Rui <ray.huang@amd.com>
> >>>>> ---
> >>>>>
> >>>>> v1->v2:
> >>>>>        - Remove unused #include "hw/virtio/virtio-iommu.h"
> >>>>>
> >>>>>        - Add a local function, called virgl_resource_destroy(), that is used
> >>>>>          to release a vgpu resource on error paths and in resource_unref.
> >>>>>
> >>>>>        - Remove virtio_gpu_virgl_resource_unmap from virtio_gpu_cleanup_mapping(),
> >>>>>          since this function won't be called on blob resources and also because
> >>>>>          blob resources are unmapped via virgl_cmd_resource_unmap_blob().
> >>>>>
> >>>>>        - In virgl_cmd_resource_create_blob(), do proper cleanup in error paths
> >>>>>          and move QTAILQ_INSERT_HEAD(&g->reslist, res, next) after the resource
> >>>>>          has been fully initialized.
> >>>>>
> >>>>>        - Memory region has a different life-cycle from virtio gpu resources
> >>>>>          i.e. cannot be released synchronously along with the vgpu resource.
> >>>>>          So, here the field "region" was changed to a pointer that will be
> >>>>>          released automatically once the memory region is unparented and all
> >>>>>          of its references have been released.
> >>>>>          Also, since the pointer can be used to indicate whether the blob
> >>>>>          is mapped, the explicit field "mapped" was removed.
> >>>>>
> >>>>>        - In virgl_cmd_resource_map_blob(), add check on the value of
> >>>>>          res->region, to prevent beeing called twice on the same resource.
> >>>>>
> >>>>>        - Remove direct references to parent_obj.
> >>>>>
> >>>>>        - Separate declarations from code.
> >>>>>
> >>>>>     hw/display/virtio-gpu-virgl.c  | 213 +++++++++++++++++++++++++++++++++
> >>>>>     hw/display/virtio-gpu.c        |   4 +-
> >>>>>     include/hw/virtio/virtio-gpu.h |   5 +
> >>>>>     meson.build                    |   4 +
> >>>>>     4 files changed, 225 insertions(+), 1 deletion(-)
> >>>>>
> >>>>> diff --git a/hw/display/virtio-gpu-virgl.c b/hw/display/virtio-gpu-virgl.c
> >>>>> index 312953ec16..17b634d4ee 100644
> >>>>> --- a/hw/display/virtio-gpu-virgl.c
> >>>>> +++ b/hw/display/virtio-gpu-virgl.c
> >>>>> @@ -17,6 +17,7 @@
> >>>>>     #include "trace.h"
> >>>>>     #include "hw/virtio/virtio.h"
> >>>>>     #include "hw/virtio/virtio-gpu.h"
> >>>>> +#include "hw/virtio/virtio-gpu-bswap.h"
> >>>>>     
> >>>>>     #include "ui/egl-helpers.h"
> >>>>>     
> >>>>> @@ -78,9 +79,24 @@ static void virgl_cmd_create_resource_3d(VirtIOGPU *g,
> >>>>>         virgl_renderer_resource_create(&args, NULL, 0);
> >>>>>     }
> >>>>>     
> >>>>> +static void virgl_resource_destroy(VirtIOGPU *g,
> >>>>> +                                   struct virtio_gpu_simple_resource *res)
> >>>>> +{
> >>>>> +    if (!res)
> >>>>> +        return;
> >>>>> +
> >>>>> +    QTAILQ_REMOVE(&g->reslist, res, next);
> >>>>> +
> >>>>> +    virtio_gpu_cleanup_mapping_iov(g, res->iov, res->iov_cnt);
> >>>>> +    g_free(res->addrs);
> >>>>> +
> >>>>> +    g_free(res);
> >>>>> +}
> >>>>> +
> >>>>>     static void virgl_cmd_resource_unref(VirtIOGPU *g,
> >>>>>                                          struct virtio_gpu_ctrl_command *cmd)
> >>>>>     {
> >>>>> +    struct virtio_gpu_simple_resource *res;
> >>>>>         struct virtio_gpu_resource_unref unref;
> >>>>>         struct iovec *res_iovs = NULL;
> >>>>>         int num_iovs = 0;
> >>>>> @@ -88,13 +104,22 @@ static void virgl_cmd_resource_unref(VirtIOGPU *g,
> >>>>>         VIRTIO_GPU_FILL_CMD(unref);
> >>>>>         trace_virtio_gpu_cmd_res_unref(unref.resource_id);
> >>>>>     
> >>>>> +    res = virtio_gpu_find_resource(g, unref.resource_id);
> >>>>> +
> >>>>>         virgl_renderer_resource_detach_iov(unref.resource_id,
> >>>>>                                            &res_iovs,
> >>>>>                                            &num_iovs);
> >>>>>         if (res_iovs != NULL && num_iovs != 0) {
> >>>>>             virtio_gpu_cleanup_mapping_iov(g, res_iovs, num_iovs);
> >>>>> +        if (res) {
> >>>>> +            res->iov = NULL;
> >>>>> +            res->iov_cnt = 0;
> >>>>> +        }
> >>>>>         }
> >>>>> +
> >>>>>         virgl_renderer_resource_unref(unref.resource_id);
> >>>>> +
> >>>>> +    virgl_resource_destroy(g, res);
> >>>>>     }
> >>>>>     
> >>>>>     static void virgl_cmd_context_create(VirtIOGPU *g,
> >>>>> @@ -426,6 +451,183 @@ static void virgl_cmd_get_capset(VirtIOGPU *g,
> >>>>>         g_free(resp);
> >>>>>     }
> >>>>>     
> >>>>> +#ifdef HAVE_VIRGL_RESOURCE_BLOB
> >>>>> +
> >>>>> +static void virgl_cmd_resource_create_blob(VirtIOGPU *g,
> >>>>> +                                           struct virtio_gpu_ctrl_command *cmd)
> >>>>> +{
> >>>>> +    struct virtio_gpu_simple_resource *res;
> >>>>> +    struct virtio_gpu_resource_create_blob cblob;
> >>>>> +    struct virgl_renderer_resource_create_blob_args virgl_args = { 0 };
> >>>>> +    int ret;
> >>>>> +
> >>>>> +    VIRTIO_GPU_FILL_CMD(cblob);
> >>>>> +    virtio_gpu_create_blob_bswap(&cblob);
> >>>>> +    trace_virtio_gpu_cmd_res_create_blob(cblob.resource_id, cblob.size);
> >>>>> +
> >>>>> +    if (cblob.resource_id == 0) {
> >>>>> +        qemu_log_mask(LOG_GUEST_ERROR, "%s: resource id 0 is not allowed\n",
> >>>>> +                      __func__);
> >>>>> +        cmd->error = VIRTIO_GPU_RESP_ERR_INVALID_RESOURCE_ID;
> >>>>> +        return;
> >>>>> +    }
> >>>>> +
> >>>>> +    res = virtio_gpu_find_resource(g, cblob.resource_id);
> >>>>> +    if (res) {
> >>>>> +        qemu_log_mask(LOG_GUEST_ERROR, "%s: resource already exists %d\n",
> >>>>> +                      __func__, cblob.resource_id);
> >>>>> +        cmd->error = VIRTIO_GPU_RESP_ERR_INVALID_RESOURCE_ID;
> >>>>> +        return;
> >>>>> +    }
> >>>>> +
> >>>>> +    res = g_new0(struct virtio_gpu_simple_resource, 1);
> >>>>> +    if (!res) {
> >>>>> +        cmd->error = VIRTIO_GPU_RESP_ERR_OUT_OF_MEMORY;
> >>>>> +        return;
> >>>>> +    }
> >>>>> +
> >>>>> +    res->resource_id = cblob.resource_id;
> >>>>> +    res->blob_size = cblob.size;
> >>>>> +
> >>>>> +    if (cblob.blob_mem != VIRTIO_GPU_BLOB_MEM_HOST3D) {
> >>>>> +        ret = virtio_gpu_create_mapping_iov(g, cblob.nr_entries, sizeof(cblob),
> >>>>> +                                            cmd, &res->addrs, &res->iov,
> >>>>> +                                            &res->iov_cnt);
> >>>>> +        if (!ret) {
> >>>>> +            g_free(res);
> >>>>> +            cmd->error = VIRTIO_GPU_RESP_ERR_UNSPEC;
> >>>>> +            return;
> >>>>> +        }
> >>>>> +    }
> >>>>> +
> >>>>> +    QTAILQ_INSERT_HEAD(&g->reslist, res, next);
> >>>>> +
> >>>>> +    virgl_args.res_handle = cblob.resource_id;
> >>>>> +    virgl_args.ctx_id = cblob.hdr.ctx_id;
> >>>>> +    virgl_args.blob_mem = cblob.blob_mem;
> >>>>> +    virgl_args.blob_id = cblob.blob_id;
> >>>>> +    virgl_args.blob_flags = cblob.blob_flags;
> >>>>> +    virgl_args.size = cblob.size;
> >>>>> +    virgl_args.iovecs = res->iov;
> >>>>> +    virgl_args.num_iovs = res->iov_cnt;
> >>>>> +
> >>>>> +    ret = virgl_renderer_resource_create_blob(&virgl_args);
> >>>>> +    if (ret) {
> >>>>> +        virgl_resource_destroy(g, res);
> >>>>> +        qemu_log_mask(LOG_GUEST_ERROR, "%s: virgl blob create error: %s\n",
> >>>>> +                      __func__, strerror(-ret));
> >>>>> +        cmd->error = VIRTIO_GPU_RESP_ERR_UNSPEC;
> >>>>> +    }
> >>>>> +}
> >>>>> +
> >>>>> +static void virgl_cmd_resource_map_blob(VirtIOGPU *g,
> >>>>> +                                        struct virtio_gpu_ctrl_command *cmd)
> >>>>> +{
> >>>>> +    struct virtio_gpu_simple_resource *res;
> >>>>> +    struct virtio_gpu_resource_map_blob mblob;
> >>>>> +    int ret;
> >>>>> +    void *data;
> >>>>> +    uint64_t size;
> >>>>> +    struct virtio_gpu_resp_map_info resp;
> >>>>> +    VirtIOGPUBase *b = VIRTIO_GPU_BASE(g);
> >>>>> +
> >>>>> +    VIRTIO_GPU_FILL_CMD(mblob);
> >>>>> +    virtio_gpu_map_blob_bswap(&mblob);
> >>>>> +
> >>>>> +    if (mblob.resource_id == 0) {
> >>>>> +        qemu_log_mask(LOG_GUEST_ERROR, "%s: resource id 0 is not allowed\n",
> >>>>> +                      __func__);
> >>>>> +        cmd->error = VIRTIO_GPU_RESP_ERR_INVALID_RESOURCE_ID;
> >>>>> +        return;
> >>>>> +    }
> >>>>> +
> >>>>> +    res = virtio_gpu_find_resource(g, mblob.resource_id);
> >>>>> +    if (!res) {
> >>>>> +        qemu_log_mask(LOG_GUEST_ERROR, "%s: resource does not exist %d\n",
> >>>>> +                      __func__, mblob.resource_id);
> >>>>> +        cmd->error = VIRTIO_GPU_RESP_ERR_INVALID_RESOURCE_ID;
> >>>>> +        return;
> >>>>> +    }
> >>>>> +    if (res->region) {
> >>>>> +        qemu_log_mask(LOG_GUEST_ERROR, "%s: resource already mapped %d\n",
> >>>>> +		      __func__, mblob.resource_id);
> >>>>> +        cmd->error = VIRTIO_GPU_RESP_ERR_INVALID_RESOURCE_ID;
> >>>>> +        return;
> >>>>> +    }
> >>>>> +
> >>>>> +    ret = virgl_renderer_resource_map(res->resource_id, &data, &size);
> >>>>> +    if (ret) {
> >>>>> +        qemu_log_mask(LOG_GUEST_ERROR, "%s: resource map error: %s\n",
> >>>>> +                      __func__, strerror(-ret));
> >>>>> +        cmd->error = VIRTIO_GPU_RESP_ERR_INVALID_RESOURCE_ID;
> >>>>> +        return;
> >>>>> +    }
> >>>>> +
> >>>>> +    res->region = g_new0(MemoryRegion, 1);
> >>>>> +    if (!res->region) {
> >>>>> +        virgl_renderer_resource_unmap(res->resource_id);
> >>>>> +        cmd->error = VIRTIO_GPU_RESP_ERR_OUT_OF_MEMORY;
> >>>>> +        return;
> >>>>> +    }
> >>>>> +    memory_region_init_ram_device_ptr(res->region, OBJECT(g), NULL, size, data);
> >>>>
> >>>> I think memory_region_init_ram_ptr() should be used instead.
> >>>
> >>> Would you mind to explain the reason?
> >>
> >> The documentation comment of memory_region_init_ram_device_ptr() says:
> >>   > A RAM device represents a mapping to a physical device, such as to a
> >>   > PCI MMIO BAR of an vfio-pci assigned device.  The memory region may be
> >>   > mapped into the VM address space and access to the region will modify
> >>   > memory directly.  However, the memory region should not be included in
> >>   > a memory dump (device may not be enabled/mapped at the time of the
> >>   > dump), and operations incompatible with manipulating MMIO should be
> >>   > avoided.  Replaces skip_dump flag.
> >>
> >> In my understanding it's not MMIO so memory_region_init_ram_ptr() should
> >> be used instead.
> >>
> > 
> > It actually maybe the video memory (mmio) or system memory here. :-)
> > 
> > We will get the host memory for blob from host with
> > virgl_renderer_resource_map() in virglrenderer. In virglrenderer, there are two
> > types of VIRGL_RESOURCE_FD_DMABUF and VIRGL_RESOURCE_FD_SHM to indicate the
> > memory types. The shmem is the system memory that won't need GPU
> > accessible, and dmabuf is the memory that required GPU accessible. Host
> > kernel amdgpu driver will register dma-buf to export the resource buffer
> > for sharing, and here, it may have video memory that exposed by amdgpu pcie
> > bar0 in the dma-buf buffers. And we also have system memory(gtt) that can
> > be mapped as gpu page tables for gpu accessible.
> > 
> > 07:00.0 VGA compatible controller: Advanced Micro Devices, Inc. [AMD/ATI] Renoir (rev c1) (prog-if 00 [VGA controller])
> >          Subsystem: Advanced Micro Devices, Inc. [AMD/ATI] Renoir
> >          Flags: bus master, fast devsel, latency 0, IRQ 56
> >          Memory at fcc0000000 (64-bit, prefetchable) [size=256M]
> >          Memory at fcd0000000 (64-bit, prefetchable) [size=2M]
> >          I/O ports at 1000 [size=256]
> >          Memory at d0400000 (32-bit, non-prefetchable) [size=512K]
> >          Capabilities: <access denied>
> >          Kernel driver in use: amdgpu
> >          Kernel modules: amdgpu
> 
> In my understanding it is not relevant if the memory is backed by device 
> or not. Here MMIO means memory-mapping I/O registers that has 
> side-effects during accesses. Reading such a register may acknowledge an 
> interrupt for example and the unit of writes may also matter. 
> memory_region_init_ram_device_ptr() ensures no supurious memory read 
> will not happen and word accesses are preserved.
> 
> They do not matter for video memory even if it lies in a separate device 
> memory. In this sense the name "memory_region_init_ram_device_ptr" is 
> somewhat misnomer.
> 

OK. Thanks for the clarification.

After traced the code, if memory_region_init_ram_device_ptr(), it will use
memory_region_dispatch_write() to call into memory_region_ram_device_write()
which registered as ram_device_mem_ops to write ram_block->host with offset
dword by dword. And if we use memory_region_init_ram_ptr(), the
flatview_write_continue() will use memmove() to write buf into ramblock while
we write the blob memory. May I know whether you mean the "memmove" may have an
interrupt or supurious memory access?

        } else if (!memory_access_is_direct(mr, true)) {
            release_lock |= prepare_mmio_access(mr);
            l = memory_access_size(mr, l, addr1);
            /* XXX: could force current_cpu to NULL to avoid
               potential bugs */
            val = ldn_he_p(buf, l);
            result |= memory_region_dispatch_write(mr, addr1, val,
                                                   size_memop(l), attrs);
        } else {
            /* RAM case */
            ram_ptr = qemu_ram_ptr_length(mr->ram_block, addr1, &l, false);
            memmove(ram_ptr, buf, l);
            invalidate_and_set_dirty(mr, addr1, l);
        }

Thanks,
Ray

