Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3138C7A33DF
	for <lists+xen-devel@lfdr.de>; Sun, 17 Sep 2023 07:47:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.603664.940730 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qhkbf-0005or-9j; Sun, 17 Sep 2023 05:46:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 603664.940730; Sun, 17 Sep 2023 05:46:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qhkbf-0005mJ-69; Sun, 17 Sep 2023 05:46:07 +0000
Received: by outflank-mailman (input) for mailman id 603664;
 Sun, 17 Sep 2023 05:46:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1vuy=FB=amd.com=Ray.Huang@srs-se1.protection.inumbo.net>)
 id 1qhkbd-0005mD-H8
 for xen-devel@lists.xenproject.org; Sun, 17 Sep 2023 05:46:05 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20619.outbound.protection.outlook.com
 [2a01:111:f400:7e89::619])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7aa1de08-551d-11ee-8788-cb3800f73035;
 Sun, 17 Sep 2023 07:46:03 +0200 (CEST)
Received: from SJ2PR12MB8690.namprd12.prod.outlook.com (2603:10b6:a03:540::10)
 by CH3PR12MB8330.namprd12.prod.outlook.com (2603:10b6:610:12c::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.23; Sun, 17 Sep
 2023 05:45:53 +0000
Received: from SJ2PR12MB8690.namprd12.prod.outlook.com
 ([fe80::c3b:811:fd1d:c33e]) by SJ2PR12MB8690.namprd12.prod.outlook.com
 ([fe80::c3b:811:fd1d:c33e%6]) with mapi id 15.20.6792.021; Sun, 17 Sep 2023
 05:45:47 +0000
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
X-Inumbo-ID: 7aa1de08-551d-11ee-8788-cb3800f73035
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g05UvUZ2gGuJyz9tPvzyjdAX/0uTjJONwkURoQKAqYSz386ce7/L64DxGml1Xpq0b3sNieKarA1rUjaIua6TNiAiBOC/3etWFIf7NOCZOGt6kUpR05g5ZxGZuo9x0SlmjLgvCi/6vRvyud4LU2ofRdU0ZWIcBKXYVOPrMSE3IE/AIqlwZdlEET0q+3CFI4K9pfMyg/c1r8LHDvvUEwMiXpqlcdQqUMb8CBWT627NWXYa5JNs3QNhtMgWQ0qNYNYGgQtQJLsvkqfYLwOJgjLGAVI1gqAPIlhhJkI1rdLSTptBR8LbIuknVEOQpXR9Z2RtTDU2uw5q8lcLWbBDeKZBmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FXU3qahuBo2iuTfNxhJKRcgHs6rO+mcqu5RSIXYG9pA=;
 b=dH5kbPE8Doi+fyDcsP4cvexexuy410iICBQKMjaryW6wvikV6QaG/xSbyNxaD8cDr+RS2aRNhozGNkOiJ/ukNA+EzsHWuY2BheomwZwDP4D8/NhRxEXA91p1panKHpY1NJVhp/oCpvx5Y6pZwSfTtNdl8IAsxM8Jaok5YkEWjA+EiMWdfdxQV5i3LR3Wa7jexEcB4zGxyCwkXTykWY+p5gpUbMH75sMoAevpnrPmGyk+nhi9gDbdH7EZDlxgvlstS5VGqxBz0AuoBAt66s5rKweBUb+7Arfe9kg55fLpCs8k18YNnnTZs+jtHm/P5E51gnHPD+9BgEcNKjR17fe6fw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FXU3qahuBo2iuTfNxhJKRcgHs6rO+mcqu5RSIXYG9pA=;
 b=HCeigAZIJ0hwQulu34F44/PFm0NVF4HNj9Hm3Cp0L4+alj7hzEC3INmUiTWZLD/xzMqfOLWefbFFQmon5S+raA5loNLLugksaBgN5fTUE6vkn+p5leAv3/FSAvDvW2XsSRKbXxn31Lx9BtPa9foK837y8QCikIxJNNthbYdYYvI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Date: Sun, 17 Sep 2023 13:45:17 +0800
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
Message-ID: <ZQaSbaCUQ6iiHI/Y@amd.com>
References: <20230915111130.24064-1-ray.huang@amd.com>
 <20230915111130.24064-7-ray.huang@amd.com>
 <561abf48-d72c-467d-94fd-54ffa1dfb512@daynix.com>
 <ZQWEQ9ZHkokhKOSA@amd.com>
 <d671bfad-7d78-41cf-a6f4-e92bf6ce2bd5@daynix.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d671bfad-7d78-41cf-a6f4-e92bf6ce2bd5@daynix.com>
X-ClientProxiedBy: SGXP274CA0010.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b8::22)
 To SJ2PR12MB8690.namprd12.prod.outlook.com (2603:10b6:a03:540::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR12MB8690:EE_|CH3PR12MB8330:EE_
X-MS-Office365-Filtering-Correlation-Id: 694361cd-0d1c-45e3-b351-08dbb7415740
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	u1JFXLUWvXNMHu5jiksWzdN7ZIblNuSb808kpILP5YjShm3FqDllcux5N49Xwf5VlOz5I2lnkGNAX+Nc+XHQC/naAY6qxZR6kE4sYmf0gZ2FKYUewN55cqzQqGxoyNz6r3MbZdcOTjYQJIHxNCt3PAesLlenEn0VlnjpalsKOTitsx/1xXbZ9/oXoa9dMNeMJbqG2vZSCdyXTNKDUxqNi/qmACOpMOj5okk2Z6Bm3CVMfdn6G445WXI/mwQeDBBbKfWBSNvmecDyCugltCFnqycuTX701AnfaMw0+2TX5q8FiA5GsOKY4etruTNwXqK+24VBVBxjqhNWwlni6i/l00iCokJ0Afm9feHmKoVBvaNufI43ymA8sfgfiQTbVh9HhNxvC9ilNnVIMQLSf9UVGHX1mfM5lJ7okE8k/55Om8dfFK4SCTKArf02Faq3+NUjIA8/pvcPcCrRzfShlX0LF16cZZVzYG9qDqNeFHDEHGMozebm2zeNbmb+zuCg3qN0YN8pkuBzZ5cpmQ/N5aB9K3dBMDjgreg3oP5BgELZh5Q=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR12MB8690.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(136003)(396003)(376002)(39860400002)(346002)(186009)(1800799009)(451199024)(26005)(2616005)(8936002)(8676002)(4326008)(66899024)(7416002)(83380400001)(2906002)(36756003)(5660300002)(86362001)(53546011)(6506007)(6486002)(966005)(478600001)(6666004)(6916009)(316002)(54906003)(6512007)(66946007)(66476007)(66556008)(38100700002)(41300700001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?pMPxUz/X1yuemL+Q9C1t9f0QTKxBDocJ3buxpI90+LPs75gHKif82Rb1u5s4?=
 =?us-ascii?Q?hkvdZ2rSek3t83OYNMShdfVRjDPvL6YPqcUypfwFnNG7okvR+tndQbj4lV2B?=
 =?us-ascii?Q?gAD32fF/LyLUvem/ox6Bh6BkkjwHDtEy4x+rDE83s/AX89jpsppfVdOjjN59?=
 =?us-ascii?Q?lk3i4KE7HBzS7GWZRepaoQy0YOHSPMJxd04ZWt4cHXzDUtshLqqUF9t+zBIR?=
 =?us-ascii?Q?66bOzpDWZ2SGPj7bMjYhz7MDasW0IAQjn4Ot/97ZLOlQ24oEsU60fQcxlHy4?=
 =?us-ascii?Q?/KuDZR+V4x0FHH8aDFSdqdsPiT+uAw8i4zew2rxXzOSjkBbE9G89Y/BKUHtR?=
 =?us-ascii?Q?lQ8XGFMY+I1DWD1Hp2geTSJcOrsvZXqGNFJy/MPiTO3R43jVoxtXQOt2NagV?=
 =?us-ascii?Q?lfbMDZZ0oRIgNN+kk5N9uI9wOnUD89b1lQVYlBXJmlGhdL0ifYNo28D22fsw?=
 =?us-ascii?Q?ygu43oTx9ICx8w1Ggi971GZTPCwXVNu0iQ3EBft+8az+ovpntDHYV4/RGdLy?=
 =?us-ascii?Q?ZLbd8BXTP5SUCPXPBosy8dVfOyCr8EP0JGTZ3VZmHu8jAchH0+UfVF6cXyZO?=
 =?us-ascii?Q?T4B6fGqnnihyUbJzUOQfYsyNX/4IrX+iKMJHWFad1+s4YlTSdPlhcVvCv4sL?=
 =?us-ascii?Q?5b7WVyJCztdcsPjuMg5g/JEKKcqY0hLa3Eo7/XRjc6tX+MUP+3RnclHJr4hy?=
 =?us-ascii?Q?werBniahulS6Br9zA0X/RUhaLMqXHYwHFjBmrFBLJWeKn8GWOX3dvfGSNw12?=
 =?us-ascii?Q?Kz8sEmn3/KVLH0Q3Y0NEDAfUKkJLdAHquubJ3vhUb/en3sC4SBDJXkbBNkWb?=
 =?us-ascii?Q?Saw5GuiCFbymK7u11IilJlpQjXa0LYFKsVWvtk77zlCGw0DoYYYHHg7qs2Nh?=
 =?us-ascii?Q?8BSFmFl45pnwSYs2jiaGMoZqcUVpQgjyC/f9WzRHZPlzHHqCQbGaO55+H6xb?=
 =?us-ascii?Q?hYgj/W+7X0DUc6qcnOTFttewZT2zOWM46s9nS4A3IlPbkXT9emfXsxIs0rkV?=
 =?us-ascii?Q?HStBzr91oiV0vAlZPAt8doxglcQeCPtM56u0V4TlIRazXr5cqjSslFjujUjs?=
 =?us-ascii?Q?fWgUV/l8lafdbZHuZ07xI6xMU+ld5Gx5TjZ7NJ1fVqyAM32HnzvXjjAOp2tP?=
 =?us-ascii?Q?ii+P4+kiA4MsKsycLQ+BJ+Hb9UlfXe2yFES/SyQFezaxzSRaCnQXnCR/e0m4?=
 =?us-ascii?Q?MX4wxHGpnFVnBLh5Pn1JMg1hnQiB9gWDNIKzQxWOgk03RjcGpXp1ehAqJIf3?=
 =?us-ascii?Q?78r2WaD/YZARCJQFCLK62wAXTHlEZRfLX4odcz3Z21PWrZFy1rVzrSre5Q+F?=
 =?us-ascii?Q?0TbXMBoASzWUWX4zlnGW1Qz9YH9slITzKKSFrfFenCOAIRHKv4S15pF5p0Bn?=
 =?us-ascii?Q?5E5jMS9HI545eAg63yGKqEY/zuekwEdkfadAaTOXQUjpizhHxSnENc+03jj0?=
 =?us-ascii?Q?GdfC6UoqDKU3xkgBoDFsfGjaUk5liJqsoJTNnRCwuxf6NElmrJWpIiFTIxVO?=
 =?us-ascii?Q?A4L/4phU4t4Pq0YXaZFDozIX1O4UbVo1thVvMGNuIXaQNrPgFo3jgEApzCGo?=
 =?us-ascii?Q?J9MDaBEzjcnpz6zmAiwguGM3BhomTFL4Z/xOrY8T?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 694361cd-0d1c-45e3-b351-08dbb7415740
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB8690.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Sep 2023 05:45:47.0377
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9qzMrqX2nvTk1kNDCtLBoa40JcUwbdC0JWSB0xQ8FSODPG1d766XPOHwarU3kKuv/UDHaqXRPCaZ0c+/Md6Zog==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8330

On Sat, Sep 16, 2023 at 06:42:04PM +0800, Akihiko Odaki wrote:
> On 2023/09/16 19:32, Huang Rui wrote:
> > On Fri, Sep 15, 2023 at 11:20:46PM +0800, Akihiko Odaki wrote:
> >> On 2023/09/15 20:11, Huang Rui wrote:
> >>> Patch "virtio-gpu: CONTEXT_INIT feature" has added the context_init
> >>> feature flags.
> >>> We would like to enable the feature with virglrenderer, so add to create
> >>> virgl renderer context with flags using context_id when valid.
> >>>
> >>> Originally-by: Antonio Caggiano <antonio.caggiano@collabora.com>
> >>> Signed-off-by: Huang Rui <ray.huang@amd.com>
> >>> ---
> >>>
> >>> V4 -> V5:
> >>>       - Inverted patch 5 and 6 because we should configure
> >>>         HAVE_VIRGL_CONTEXT_INIT firstly. (Philippe)
> >>>
> >>>    hw/display/virtio-gpu-virgl.c | 13 +++++++++++--
> >>>    hw/display/virtio-gpu.c       |  2 ++
> >>>    2 files changed, 13 insertions(+), 2 deletions(-)
> >>>
> >>> diff --git a/hw/display/virtio-gpu-virgl.c b/hw/display/virtio-gpu-virgl.c
> >>> index 8bb7a2c21f..312953ec16 100644
> >>> --- a/hw/display/virtio-gpu-virgl.c
> >>> +++ b/hw/display/virtio-gpu-virgl.c
> >>> @@ -106,8 +106,17 @@ static void virgl_cmd_context_create(VirtIOGPU *g,
> >>>        trace_virtio_gpu_cmd_ctx_create(cc.hdr.ctx_id,
> >>>                                        cc.debug_name);
> >>>    
> >>> -    virgl_renderer_context_create(cc.hdr.ctx_id, cc.nlen,
> >>> -                                  cc.debug_name);
> >>> +    if (cc.context_init) {
> >>> +#ifdef HAVE_VIRGL_CONTEXT_INIT
> >>> +        virgl_renderer_context_create_with_flags(cc.hdr.ctx_id,
> >>> +                                                 cc.context_init,
> >>> +                                                 cc.nlen,
> >>> +                                                 cc.debug_name);
> >>> +        return;
> >>> +#endif
> >>
> >> This should deal with the case when context_init is set while
> >> HAVE_VIRGL_CONTEXT_INIT is not defined.
> > 
> > Actually, I received the comment below before:
> > 
> > https://lore.kernel.org/qemu-devel/32588d0e-a1f2-30c4-5e9f-e6e7c4190b65@linaro.org/
> > 
> > At original patch set, I have the case while HAVE_VIRGL_CONTEXT_INIT is set
> > but HAVE_VIRGL_CONTEXT_INIT is not defined. But I think we may encounter
> > the case that virgl_renderer_context_create_with_flags is not defined in
> > virglrenderer early version. Should I bring the error message back?
> > 
> > Thanks,
> > Ray
> 
> I suggest checking VIRTIO_GPU_FLAG_CONTEXT_INIT_ENABLED instead of 
> reporting an error here. Perhaps it may be easier to add #ifdef around:
>  > +    DEFINE_PROP_BIT("context_init", VirtIOGPU, parent_obj.conf.flags,
>  > +                    VIRTIO_GPU_FLAG_CONTEXT_INIT_ENABLED, false),

How about below changes:

---
diff --git a/hw/display/virtio-gpu-virgl.c b/hw/display/virtio-gpu-virgl.c
index 8bb7a2c21f..54a3cfe136 100644
--- a/hw/display/virtio-gpu-virgl.c
+++ b/hw/display/virtio-gpu-virgl.c
@@ -106,8 +106,15 @@ static void virgl_cmd_context_create(VirtIOGPU *g,
     trace_virtio_gpu_cmd_ctx_create(cc.hdr.ctx_id,
                                     cc.debug_name);

-    virgl_renderer_context_create(cc.hdr.ctx_id, cc.nlen,
-                                  cc.debug_name);
+    if (cc.context_init && virtio_gpu_context_init_enabled(g->conf)) {
+        virgl_renderer_context_create_with_flags(cc.hdr.ctx_id,
+                                                 cc.context_init,
+                                                 cc.nlen,
+                                                 cc.debug_name);
+        return;
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


