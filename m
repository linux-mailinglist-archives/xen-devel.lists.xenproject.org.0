Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1518D7A44E6
	for <lists+xen-devel@lfdr.de>; Mon, 18 Sep 2023 10:38:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.603810.940882 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qi9kM-0008Vf-R4; Mon, 18 Sep 2023 08:36:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 603810.940882; Mon, 18 Sep 2023 08:36:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qi9kM-0008TB-ON; Mon, 18 Sep 2023 08:36:46 +0000
Received: by outflank-mailman (input) for mailman id 603810;
 Mon, 18 Sep 2023 08:36:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=5am5=FC=amd.com=Ray.Huang@srs-se1.protection.inumbo.net>)
 id 1qi9kL-0008Sm-2f
 for xen-devel@lists.xenproject.org; Mon, 18 Sep 2023 08:36:45 +0000
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on2062b.outbound.protection.outlook.com
 [2a01:111:f400:7e8c::62b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7baf4faa-55fe-11ee-9b0d-b553b5be7939;
 Mon, 18 Sep 2023 10:36:39 +0200 (CEST)
Received: from SJ2PR12MB8690.namprd12.prod.outlook.com (2603:10b6:a03:540::10)
 by BN9PR12MB5132.namprd12.prod.outlook.com (2603:10b6:408:119::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.27; Mon, 18 Sep
 2023 08:36:34 +0000
Received: from SJ2PR12MB8690.namprd12.prod.outlook.com
 ([fe80::c3b:811:fd1d:c33e]) by SJ2PR12MB8690.namprd12.prod.outlook.com
 ([fe80::c3b:811:fd1d:c33e%6]) with mapi id 15.20.6792.021; Mon, 18 Sep 2023
 08:36:34 +0000
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
X-Inumbo-ID: 7baf4faa-55fe-11ee-9b0d-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FMgdxu93Zb0HZdajuC9rkJuaZ4O1nrkp7u9ATBqZmURkrzX2LrWS/X0NIUrg2WrmB7OlOCXeM9uEOU3h9HSR2vx9y49sgPSpt6EYHncrxM7owKJo51iHEs0HwWNGsKAKF1Se3BVcpsQBqkXgClC0+/kX68bP4rOMR6if0nulIu6vV0mSU1nn5JZhQMo8h8WxE/fUkKiv7/Sp2liN5/mm5G0lG4XUQWixZUh8UJeDPqXP6RRXXu+xvGf3HhPU1toy4hiKpg4T5xIlfQjGfjMwH/dy/DjFyqb1OLBGgdXPurnexYoWrggT5sEmtgDU9idtnQ+oTdnV6USTyMFGY8UC8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SOsuO5ct/iDwWYejfSopgB19BUubJlRyyQwEpS6E5DE=;
 b=Sm6ssY1Jh3hWl9ZohVwM5Y69224nVMzwFZdxbYnPZweXxI+pcJo8MMRuig82aN+ly8CMGunz/T7thxlhtuLE9Wv2+nE10a19P+wWrkWK21dUoq3TcRJoM2zmz/tfxBCFjPP7qM8wpa3SF5HQlns9/38Q1cEJ8V4CNWjs3h1W8M4UskeSllwDDizNanWtYkSJZi/hXsA0TfB96BeqIVztPpa0rrPcxhbI68D+4JjiCZh0HwBAlEuXcKOK9rPqfRIHIDFUCvGL/9pbpbSfnGuW/toFVHX71wQvHi/+U2aZm1/Pz1NrrcE5ctczD9elx3i87gH8oQHUFhOuwm0oSeF6mQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SOsuO5ct/iDwWYejfSopgB19BUubJlRyyQwEpS6E5DE=;
 b=FaDf8YSgsiOCBZs9OWYrgOc1//Ct3JemyjTK+HXqNIiwHV+RJYzyT8Zke6osYaHWqPPB/uM8rcjQdDphdBMqp+XPoRFrxGaLatwxnkDVE+LhRHCF8oBYrWyXoof9DUeddfk0yDThQ3PLPQzFr4gqm76Vbpd5yFVootz2bk3C66A=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Date: Mon, 18 Sep 2023 16:36:03 +0800
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
Message-ID: <ZQgL89xUESe5JZ0o@amd.com>
References: <20230915111130.24064-1-ray.huang@amd.com>
 <20230915111130.24064-10-ray.huang@amd.com>
 <a14b26dc-c804-4be8-83d5-088e71d37a7b@daynix.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a14b26dc-c804-4be8-83d5-088e71d37a7b@daynix.com>
X-ClientProxiedBy: SI2PR01CA0018.apcprd01.prod.exchangelabs.com
 (2603:1096:4:191::7) To SJ2PR12MB8690.namprd12.prod.outlook.com
 (2603:10b6:a03:540::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR12MB8690:EE_|BN9PR12MB5132:EE_
X-MS-Office365-Filtering-Correlation-Id: 66696a6b-c1e0-4113-c216-08dbb8225cd5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	4ie5MVZx94cOSdrWxj/G9rEvg+nDTCkWTajHmfY1s81VrHzeJpMbAFQgQs/K15HOdMuzK1WNlZjs6/NQDszHr/xJAyKFj03eFCYzVKQivOJJKiqqIvjuG9XSNskMVq8twUUcVYE1zrCU9dgkrQip2jXsyhNUzmkgJMSY/qz3Sd8J/m5J/z3OsE5WxDS1FN6a8ip1S1rYRnrnKDaUtfgWqjeXwHiHPjQ/CkOq5yY6WzX1lbAc85dDk9mMWIrhGInvFjked1wulwZrhgvxc8Pc3AS76FKNEbzoqIvae3jAlegyn8PNCU83t+cS3UG09gQYxtyuMJtgIr9B1EobmSEwa9aO4yHqYIemoDPp4L3UkrfcnD+aNIWI0o6REs3w4kkAAfVZ57CvwIHnjsFIOnxDgtEC2NQHrRMvX+0uv3pa/YR1Rd3RL72pvclMe+TxD2c2YJM/XdoL9SrZnA4B6Cc3gvnBlJidKeQDJ5u14niEeUef3+c4voE/S839ABUwSZ1t4JxTO1IAM13pX+CqupaYbEpUXio2la7pQelYeoifB56+qdPVNPyzPt9yRk7yYS+l
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR12MB8690.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(396003)(136003)(366004)(376002)(346002)(451199024)(186009)(1800799009)(66946007)(53546011)(6506007)(6486002)(66476007)(66556008)(54906003)(6512007)(6916009)(316002)(41300700001)(478600001)(6666004)(4326008)(8936002)(8676002)(26005)(5660300002)(36756003)(38100700002)(83380400001)(2906002)(2616005)(30864003)(7416002)(86362001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Ot1LlgtTjcHsyGAN1WMZY9zm4jLDVuBJydSqTWJ7Tna2Zbe5QmgYeHBjLLjC?=
 =?us-ascii?Q?g1AoIbHp+52tQusQ/+9/rC9aNT6yTUSC23wtr+FprSd8FUeRN8ga6H7I2/0L?=
 =?us-ascii?Q?UWJIvfEMleOALQpAeVrEPSqqZGgNxjsaOMLuW3UQf6zW0JG4nB3kAdpyxcw0?=
 =?us-ascii?Q?qvCH5kXalYEuBfAp/hglNrPC6M1rf5aMAHr9957teo373DsrUyZNT+sURvMH?=
 =?us-ascii?Q?T/b7t1ori/zesYdrpvGVm6XJFV3EtWqqvt7BotIIKJ75egHORaWzTzTp5DJ2?=
 =?us-ascii?Q?w4S0ocD8lAhnyrXEkgWFi3P5SOJ3WORuwxlDQjDFZVx/P7SP+Zf9SGCvz/OW?=
 =?us-ascii?Q?Glo0bR9rR5ujXHwWea/6jOGn23+faViM4oOI4/lgBdkd1hR2uv53grXNBNQo?=
 =?us-ascii?Q?i5BF3uYXNaiCCHKsxs7ZTTQ0OfeTQ7q5kILxgk/zQMmzpFac7lm7PZ00hbIV?=
 =?us-ascii?Q?ZO48+W+5191+ZTOtaXVFRpqfUZpDqwm2Pd3N9IMyBOAUEnrIqpBBqFYA9vSm?=
 =?us-ascii?Q?y73i0Uk9FNTRsr4QfotM+d7PWwbyfutMCW1MYCihZOkBqZXHU458UToK8vFu?=
 =?us-ascii?Q?xc7tC8MmWPLePewsT7qMjCWVxINqgw46nzfgvmyKOxUddXF9FqUGe6I3nQ5q?=
 =?us-ascii?Q?3qgEm4+ZVGp9oVKnXLJeiYH1gOasgiGYlBTy+9KU/YWTSuvErCR9gvzuebrJ?=
 =?us-ascii?Q?2iAy/2QGnIMIbUKn+K02uEt8Zbzya0BTNPL80/JPtU80Rfrr8SzbXuc9BU0W?=
 =?us-ascii?Q?i//mapVsmsKHHf1mbgVEGAUE/foUyIl5NwrHe5ZZRIvv7CubsxEqrs6ol7C0?=
 =?us-ascii?Q?bxuWKbv+5JDYOIzdGVeCbPLPOg6TLW9Fw1aNCvx17st5a3uwFwYbdsUtUBC4?=
 =?us-ascii?Q?0kn1jA2rVOtWHWQp1H+T+VjAmUU4ir5dZQCDBlWeFG3nbuMKqtYbsLBIDG7N?=
 =?us-ascii?Q?fIF59R9RRMXfCYeBDjE+fTLu3Nc5FwsedeP00xdo5hCjdoIB4dGJ41lCCLrB?=
 =?us-ascii?Q?Pyno0wvQkIXm+xphG4WQpm2+zueFu8s19GI6IIibVvgWqOHFQAgmGombf8lK?=
 =?us-ascii?Q?F2V04QWkl0QD8dHbDS1/MnGwETuiHEAxozBqQaJ05eskk4DEBK99tQPkmTkT?=
 =?us-ascii?Q?AD5fsxvS/vXTqer0pgYImWqBqL9wfgPgaVX2gFjhbVHqVaagAqhqWDqvPTGF?=
 =?us-ascii?Q?mG0YBo9fREtdh6DRPFmdkC/1jBTzCiA+LTifNKupwTsF3Jr5cQjJToAFpZAf?=
 =?us-ascii?Q?23JIeNB+n3HFDd0K3IBdfjErDC/rP+5LnUKY2AswI9cDPskcusl95wFcuvyJ?=
 =?us-ascii?Q?ibLm5ngexofrN44k1vj8mKuRL4fbZhRNusvrWn2T29xhV6+pJVUJoCFiJnAU?=
 =?us-ascii?Q?pJesFDTfEwZ5GMolcllb8moWU1jZGc8Ay+85Sqf9EO36bc6TZ7whe5d4E2+S?=
 =?us-ascii?Q?EXD7PurqnaXOlYTV84SfVYjbJ+Bs6PpVwIFki66ZdhcesUemixniB1C0Qyi2?=
 =?us-ascii?Q?0EwXpK2SU4Gr6wIvLmMv+Pl858g1zdAHAj3ND2w2v2ZsIPb8jWmIdlyLm+jU?=
 =?us-ascii?Q?0bTckR4ssX2y34MUk28ExJyKeVg6m8FkZh8/Ocll?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 66696a6b-c1e0-4113-c216-08dbb8225cd5
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB8690.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2023 08:36:33.3948
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9XKLYYCYbEIZVmZHB6rBZIwWj88jNgzMtuHagDeI3EFzoAJRq+iRXAo2WrLBRbKaPSOu2CMEaoJL5dxS7ep1vA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR12MB5132

On Sat, Sep 16, 2023 at 12:04:17AM +0800, Akihiko Odaki wrote:
> On 2023/09/15 20:11, Huang Rui wrote:
> > From: Antonio Caggiano <antonio.caggiano@collabora.com>
> > 
> > Support BLOB resources creation, mapping and unmapping by calling the
> > new stable virglrenderer 0.10 interface. Only enabled when available and
> > via the blob config. E.g. -device virtio-vga-gl,blob=true
> > 
> > Signed-off-by: Antonio Caggiano <antonio.caggiano@collabora.com>
> > Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
> > Signed-off-by: Xenia Ragiadakou <xenia.ragiadakou@amd.com>
> > Signed-off-by: Huang Rui <ray.huang@amd.com>
> > ---
> > 
> > V4 -> V5:
> >      - Use memory_region_init_ram_ptr() instead of
> >        memory_region_init_ram_device_ptr() (Akihiko)
> > 
> >   hw/display/virtio-gpu-virgl.c  | 213 +++++++++++++++++++++++++++++++++
> >   hw/display/virtio-gpu.c        |   4 +-
> >   include/hw/virtio/virtio-gpu.h |   5 +
> >   meson.build                    |   4 +
> >   4 files changed, 225 insertions(+), 1 deletion(-)
> > 
> > diff --git a/hw/display/virtio-gpu-virgl.c b/hw/display/virtio-gpu-virgl.c
> > index 312953ec16..563a6f2f58 100644
> > --- a/hw/display/virtio-gpu-virgl.c
> > +++ b/hw/display/virtio-gpu-virgl.c
> > @@ -17,6 +17,7 @@
> >   #include "trace.h"
> >   #include "hw/virtio/virtio.h"
> >   #include "hw/virtio/virtio-gpu.h"
> > +#include "hw/virtio/virtio-gpu-bswap.h"
> >   
> >   #include "ui/egl-helpers.h"
> >   
> > @@ -78,9 +79,24 @@ static void virgl_cmd_create_resource_3d(VirtIOGPU *g,
> >       virgl_renderer_resource_create(&args, NULL, 0);
> >   }
> >   
> > +static void virgl_resource_destroy(VirtIOGPU *g,
> > +                                   struct virtio_gpu_simple_resource *res)
> > +{
> > +    if (!res)
> > +        return;
> > +
> > +    QTAILQ_REMOVE(&g->reslist, res, next);
> > +
> > +    virtio_gpu_cleanup_mapping_iov(g, res->iov, res->iov_cnt);
> > +    g_free(res->addrs);
> > +
> > +    g_free(res);
> > +}
> > +
> >   static void virgl_cmd_resource_unref(VirtIOGPU *g,
> >                                        struct virtio_gpu_ctrl_command *cmd)
> >   {
> > +    struct virtio_gpu_simple_resource *res;
> >       struct virtio_gpu_resource_unref unref;
> >       struct iovec *res_iovs = NULL;
> >       int num_iovs = 0;
> > @@ -88,13 +104,22 @@ static void virgl_cmd_resource_unref(VirtIOGPU *g,
> >       VIRTIO_GPU_FILL_CMD(unref);
> >       trace_virtio_gpu_cmd_res_unref(unref.resource_id);
> >   
> > +    res = virtio_gpu_find_resource(g, unref.resource_id);
> > +
> >       virgl_renderer_resource_detach_iov(unref.resource_id,
> >                                          &res_iovs,
> >                                          &num_iovs);
> >       if (res_iovs != NULL && num_iovs != 0) {
> >           virtio_gpu_cleanup_mapping_iov(g, res_iovs, num_iovs);
> > +        if (res) {
> > +            res->iov = NULL;
> > +            res->iov_cnt = 0;
> > +        }
> >       }
> > +
> >       virgl_renderer_resource_unref(unref.resource_id);
> > +
> > +    virgl_resource_destroy(g, res);
> >   }
> >   
> >   static void virgl_cmd_context_create(VirtIOGPU *g,
> > @@ -426,6 +451,183 @@ static void virgl_cmd_get_capset(VirtIOGPU *g,
> >       g_free(resp);
> >   }
> >   
> > +#ifdef HAVE_VIRGL_RESOURCE_BLOB
> > +
> > +static void virgl_cmd_resource_create_blob(VirtIOGPU *g,
> > +                                           struct virtio_gpu_ctrl_command *cmd)
> > +{
> > +    struct virtio_gpu_simple_resource *res;
> > +    struct virtio_gpu_resource_create_blob cblob;
> > +    struct virgl_renderer_resource_create_blob_args virgl_args = { 0 };
> > +    int ret;
> > +
> > +    VIRTIO_GPU_FILL_CMD(cblob);
> > +    virtio_gpu_create_blob_bswap(&cblob);
> > +    trace_virtio_gpu_cmd_res_create_blob(cblob.resource_id, cblob.size);
> > +
> > +    if (cblob.resource_id == 0) {
> > +        qemu_log_mask(LOG_GUEST_ERROR, "%s: resource id 0 is not allowed\n",
> > +                      __func__);
> > +        cmd->error = VIRTIO_GPU_RESP_ERR_INVALID_RESOURCE_ID;
> > +        return;
> > +    }
> > +
> > +    res = virtio_gpu_find_resource(g, cblob.resource_id);
> > +    if (res) {
> > +        qemu_log_mask(LOG_GUEST_ERROR, "%s: resource already exists %d\n",
> > +                      __func__, cblob.resource_id);
> > +        cmd->error = VIRTIO_GPU_RESP_ERR_INVALID_RESOURCE_ID;
> > +        return;
> > +    }
> > +
> > +    res = g_new0(struct virtio_gpu_simple_resource, 1);
> > +    if (!res) {
> > +        cmd->error = VIRTIO_GPU_RESP_ERR_OUT_OF_MEMORY;
> > +        return;
> > +    }
> > +
> > +    res->resource_id = cblob.resource_id;
> > +    res->blob_size = cblob.size;
> > +
> > +    if (cblob.blob_mem != VIRTIO_GPU_BLOB_MEM_HOST3D) {
> > +        ret = virtio_gpu_create_mapping_iov(g, cblob.nr_entries, sizeof(cblob),
> > +                                            cmd, &res->addrs, &res->iov,
> > +                                            &res->iov_cnt);
> > +        if (!ret) {
> > +            g_free(res);
> > +            cmd->error = VIRTIO_GPU_RESP_ERR_UNSPEC;
> > +            return;
> > +        }
> > +    }
> > +
> > +    QTAILQ_INSERT_HEAD(&g->reslist, res, next);
> > +
> > +    virgl_args.res_handle = cblob.resource_id;
> > +    virgl_args.ctx_id = cblob.hdr.ctx_id;
> > +    virgl_args.blob_mem = cblob.blob_mem;
> > +    virgl_args.blob_id = cblob.blob_id;
> > +    virgl_args.blob_flags = cblob.blob_flags;
> > +    virgl_args.size = cblob.size;
> > +    virgl_args.iovecs = res->iov;
> > +    virgl_args.num_iovs = res->iov_cnt;
> > +
> > +    ret = virgl_renderer_resource_create_blob(&virgl_args);
> > +    if (ret) {
> > +        virgl_resource_destroy(g, res);
> > +        qemu_log_mask(LOG_GUEST_ERROR, "%s: virgl blob create error: %s\n",
> > +                      __func__, strerror(-ret));
> > +        cmd->error = VIRTIO_GPU_RESP_ERR_UNSPEC;
> > +    }
> > +}
> > +
> > +static void virgl_cmd_resource_map_blob(VirtIOGPU *g,
> > +                                        struct virtio_gpu_ctrl_command *cmd)
> > +{
> > +    struct virtio_gpu_simple_resource *res;
> > +    struct virtio_gpu_resource_map_blob mblob;
> > +    int ret;
> > +    void *data;
> > +    uint64_t size;
> > +    struct virtio_gpu_resp_map_info resp;
> > +    VirtIOGPUBase *b = VIRTIO_GPU_BASE(g);
> > +
> > +    VIRTIO_GPU_FILL_CMD(mblob);
> > +    virtio_gpu_map_blob_bswap(&mblob);
> > +
> > +    if (mblob.resource_id == 0) {
> > +        qemu_log_mask(LOG_GUEST_ERROR, "%s: resource id 0 is not allowed\n",
> > +                      __func__);
> > +        cmd->error = VIRTIO_GPU_RESP_ERR_INVALID_RESOURCE_ID;
> > +        return;
> > +    }
> > +
> > +    res = virtio_gpu_find_resource(g, mblob.resource_id);
> > +    if (!res) {
> > +        qemu_log_mask(LOG_GUEST_ERROR, "%s: resource does not exist %d\n",
> > +                      __func__, mblob.resource_id);
> > +        cmd->error = VIRTIO_GPU_RESP_ERR_INVALID_RESOURCE_ID;
> > +        return;
> > +    }
> > +    if (res->region) {
> > +        qemu_log_mask(LOG_GUEST_ERROR, "%s: resource already mapped %d\n",
> > +		      __func__, mblob.resource_id);
> > +        cmd->error = VIRTIO_GPU_RESP_ERR_INVALID_RESOURCE_ID;
> > +        return;
> > +    }
> > +
> > +    ret = virgl_renderer_resource_map(res->resource_id, &data, &size);
> > +    if (ret) {
> > +        qemu_log_mask(LOG_GUEST_ERROR, "%s: resource map error: %s\n",
> > +                      __func__, strerror(-ret));
> > +        cmd->error = VIRTIO_GPU_RESP_ERR_INVALID_RESOURCE_ID;
> > +        return;
> > +    }
> > +
> > +    res->region = g_new0(MemoryRegion, 1);
> > +    if (!res->region) {
> > +        virgl_renderer_resource_unmap(res->resource_id);
> > +        cmd->error = VIRTIO_GPU_RESP_ERR_OUT_OF_MEMORY;
> > +        return;
> > +    }
> > +    memory_region_init_ram_ptr(res->region, OBJECT(g), NULL, size, data);
> > +    OBJECT(res->region)->free = g_free;
> > +    memory_region_add_subregion(&b->hostmem, mblob.offset, res->region);
> > +    memory_region_set_enabled(res->region, true);
> > +
> > +    memset(&resp, 0, sizeof(resp));
> > +    resp.hdr.type = VIRTIO_GPU_RESP_OK_MAP_INFO;
> > +    virgl_renderer_resource_get_map_info(mblob.resource_id, &resp.map_info);
> > +    virtio_gpu_ctrl_response(g, cmd, &resp.hdr, sizeof(resp));
> > +}
> > +
> > +static int virtio_gpu_virgl_resource_unmap(VirtIOGPU *g,
> > +                                           struct virtio_gpu_simple_resource
> > +                                           *res)
> > +{
> > +    VirtIOGPUBase *b = VIRTIO_GPU_BASE(g);
> > +
> > +    if (!res) {
> > +        qemu_log_mask(LOG_GUEST_ERROR, "%s: resource already unmapped %d\n",
> > +                      __func__, res->resource_id);
> > +        return VIRTIO_GPU_RESP_ERR_INVALID_RESOURCE_ID;
> 
> This returns enum virtio_gpu_ctrl_type while 
> virgl_renderer_resource_unmap() returns -errno and the returned error 
> code is ignored.
> 
> I think you can just inline this function into 
> virgl_cmd_resource_unmap_blob(). It will be more concise and consistent 
> with virgl_cmd_resource_map_blob().

OK, will update in V2.

> 
> > +    }
> > +
> > +    memory_region_set_enabled(res->region, false);
> > +    memory_region_del_subregion(&b->hostmem, res->region);
> > +    object_unparent(OBJECT(res->region));
> > +    res->region = NULL;
> > +
> > +    return virgl_renderer_resource_unmap(res->resource_id);
> > +}
> > +
> > +static void virgl_cmd_resource_unmap_blob(VirtIOGPU *g,
> > +                                          struct virtio_gpu_ctrl_command *cmd)
> > +{
> > +    struct virtio_gpu_simple_resource *res;
> > +    struct virtio_gpu_resource_unmap_blob ublob;
> > +    VIRTIO_GPU_FILL_CMD(ublob);
> > +    virtio_gpu_unmap_blob_bswap(&ublob);
> > +
> > +    if (ublob.resource_id == 0) {
> > +        qemu_log_mask(LOG_GUEST_ERROR, "%s: resource id 0 is not allowed\n",
> > +                      __func__);
> > +        cmd->error = VIRTIO_GPU_RESP_ERR_INVALID_RESOURCE_ID;
> > +        return;
> > +    }
> > +
> > +    res = virtio_gpu_find_resource(g, ublob.resource_id);
> > +    if (!res) {
> > +        qemu_log_mask(LOG_GUEST_ERROR, "%s: resource does not exist %d\n",
> > +                      __func__, ublob.resource_id);
> > +        cmd->error = VIRTIO_GPU_RESP_ERR_INVALID_RESOURCE_ID;
> > +        return;
> > +    }
> > +
> > +    virtio_gpu_virgl_resource_unmap(g, res);
> > +}
> > +
> > +#endif /* HAVE_VIRGL_RESOURCE_BLOB */
> > +
> >   void virtio_gpu_virgl_process_cmd(VirtIOGPU *g,
> >                                         struct virtio_gpu_ctrl_command *cmd)
> >   {
> > @@ -492,6 +694,17 @@ void virtio_gpu_virgl_process_cmd(VirtIOGPU *g,
> >       case VIRTIO_GPU_CMD_GET_EDID:
> >           virtio_gpu_get_edid(g, cmd);
> >           break;
> > +#ifdef HAVE_VIRGL_RESOURCE_BLOB
> > +    case VIRTIO_GPU_CMD_RESOURCE_CREATE_BLOB:
> > +        virgl_cmd_resource_create_blob(g, cmd);
> > +        break;
> > +    case VIRTIO_GPU_CMD_RESOURCE_MAP_BLOB:
> > +        virgl_cmd_resource_map_blob(g, cmd);
> > +        break;
> > +    case VIRTIO_GPU_CMD_RESOURCE_UNMAP_BLOB:
> > +        virgl_cmd_resource_unmap_blob(g, cmd);
> > +        break;
> > +#endif /* HAVE_VIRGL_RESOURCE_BLOB */
> >       default:
> >           cmd->error = VIRTIO_GPU_RESP_ERR_UNSPEC;
> >           break;
> > diff --git a/hw/display/virtio-gpu.c b/hw/display/virtio-gpu.c
> > index 5b7a7eab4f..cc4c1f81bb 100644
> > --- a/hw/display/virtio-gpu.c
> > +++ b/hw/display/virtio-gpu.c
> > @@ -1367,10 +1367,12 @@ void virtio_gpu_device_realize(DeviceState *qdev, Error **errp)
> >               return;
> >           }
> >   
> > +#ifndef HAVE_VIRGL_RESOURCE_BLOB
> >           if (virtio_gpu_virgl_enabled(g->parent_obj.conf)) {
> > -            error_setg(errp, "blobs and virgl are not compatible (yet)");
> > +            error_setg(errp, "Linked virglrenderer does not support blob resources");
> >               return;
> >           }
> > +#endif
> >       }
> >   
> >       if (!virtio_gpu_base_device_realize(qdev,
> > diff --git a/include/hw/virtio/virtio-gpu.h b/include/hw/virtio/virtio-gpu.h
> > index 55973e112f..b9adc28071 100644
> > --- a/include/hw/virtio/virtio-gpu.h
> > +++ b/include/hw/virtio/virtio-gpu.h
> > @@ -58,6 +58,11 @@ struct virtio_gpu_simple_resource {
> >       int dmabuf_fd;
> >       uint8_t *remapped;
> >   
> > +#ifdef HAVE_VIRGL_RESOURCE_BLOB
> > +    /* only blob resource needs this region to be mapped as guest mmio */
> > +    MemoryRegion *region;
> > +#endif
> > +
> 
> Since this is specific to virgl, let's create a struct that embeds 
> virtio_gpu_simple_resource and use it to avoid modifying virtio-gpu 
> common code.

I am thinking should I modify the whole virtio-gpu-virgl.c to use the new
struct like virgl_gpu_resource which has virtio_gpu_simple_resource
embedded? Then in virgl, we can use this structure to indicate the resource
for virglrenderer.

Thanks,
Ray

