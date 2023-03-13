Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EADC66B7CE0
	for <lists+xen-devel@lfdr.de>; Mon, 13 Mar 2023 16:56:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.509335.784888 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pbkWU-00035W-Hg; Mon, 13 Mar 2023 15:55:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 509335.784888; Mon, 13 Mar 2023 15:55:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pbkWU-00032s-EO; Mon, 13 Mar 2023 15:55:42 +0000
Received: by outflank-mailman (input) for mailman id 509335;
 Mon, 13 Mar 2023 15:55:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=LnkN=7F=amd.com=Ray.Huang@srs-se1.protection.inumbo.net>)
 id 1pbkWS-00032m-Qn
 for xen-devel@lists.xenproject.org; Mon, 13 Mar 2023 15:55:41 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on20629.outbound.protection.outlook.com
 [2a01:111:f400:7e8a::629])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7e3c5ecc-c1b7-11ed-87f5-c1b5be75604c;
 Mon, 13 Mar 2023 16:55:38 +0100 (CET)
Received: from DM5PR12MB2504.namprd12.prod.outlook.com (2603:10b6:4:b5::19) by
 PH8PR12MB7422.namprd12.prod.outlook.com (2603:10b6:510:22a::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.24; Mon, 13 Mar
 2023 15:55:32 +0000
Received: from DM5PR12MB2504.namprd12.prod.outlook.com
 ([fe80::4f9:60f8:cb12:d022]) by DM5PR12MB2504.namprd12.prod.outlook.com
 ([fe80::4f9:60f8:cb12:d022%3]) with mapi id 15.20.6178.022; Mon, 13 Mar 2023
 15:55:32 +0000
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
X-Inumbo-ID: 7e3c5ecc-c1b7-11ed-87f5-c1b5be75604c
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=H3YN7GPNIkyDopcf/8X8eO1wUvDmHJPqwVIE6VAP6f579VgnGMLavLM3MbsVbK/P3Q7nIuTyUkuzWbP9mEnCm/K5503gDbU9QL0wy94yMB5P6quNUpFs3Zln3G+lsOE3x5AkotZcDR36jr5lo3NhjuKXO04N4tqUnxrFvgFbDvrBR+jT6Ilpu/FI7iCxd3pp9PQ0bNbgrrInjrnG1f9+7i4p8pxcPai0OyKeZPBGxd7pG7Ze85RGZHEC1yxlYlINt4H/FvQXWY2eQr4ZhuLMtUnZyi5zg6drU34zUeF498BEIc3mCYnB75VIu/MzeAXTYpVCJ2leukkqW7xYZtoHQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QSEz8N7rHEQJu7Dymta3B4w544klpspLeFSIGoWsUsU=;
 b=K3PkN408TmMs6fSIgFxw8xDSpQUezK328QL0X0OoOyfRzBi/h3qpQ25CaLIkrWfPADVrrQVWyAsjqE8r/CPRqeEt+SaHvZ9BA1iYZXPVkU0zfPaxWhZMTHoiJ/jdCNDVCjH8yfjozH+R3isKzj7akDRuj5Z2+WiTysbpN2MnYSXFVs6/HGzK42KS60MZ7V4zOkNRRKvuPDGYqKBK8R9SExC4uQA5vVY6GBXvquF86DAQYumSuikBE/e8uB2uVOJJb2WGhk5J0HJRz221iNqwie6jjkKfkIJDeO6P8IOo3YVKQdtPk7L3R2o1R+Xo0pascUkgpoXM3f+25e9EmvDSvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QSEz8N7rHEQJu7Dymta3B4w544klpspLeFSIGoWsUsU=;
 b=l1yxnWfQ7B7ovA183T4ep06Hf0KIbRZF/7qtW2+XxvIGfC28G9wIeNwyOIF1EOoj9n+1stT3Jb0UjHiHLIR2RpbsnTFWlOgIb3XH0jS4/nRzZaFOwlhudDtTLfm9hYFXEIZURo7v20HVQYcxqk02uk7CN0IuEZF+OqVn21J/LhQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Date: Mon, 13 Mar 2023 23:55:05 +0800
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
Message-ID: <ZA9HWRYxPUk1OeGe@amd.com>
References: <20230312092244.451465-1-ray.huang@amd.com>
 <20230312092244.451465-9-ray.huang@amd.com>
 <68195782-0309-2f81-7f1f-84a7fe7bb05c@collabora.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <68195782-0309-2f81-7f1f-84a7fe7bb05c@collabora.com>
X-ClientProxiedBy: SG2P153CA0030.APCP153.PROD.OUTLOOK.COM (2603:1096:4:c7::17)
 To DM5PR12MB2504.namprd12.prod.outlook.com (2603:10b6:4:b5::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM5PR12MB2504:EE_|PH8PR12MB7422:EE_
X-MS-Office365-Filtering-Correlation-Id: c74ef369-2829-46c6-2852-08db23db5fb6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	/lWkIm6/60eX1VQaHd1Nw2v3i6B3ZvPeP9HVN+LGmMYJ68S2BO2uGkub8NXAcnjs2jEnFzhtVxdn2YrJYx2UPDb4kZwjiHTe7iAZ+Xk5HE26ygEvbfrmELAl1yg8tfQh/1HFBbCQZAlXmSCyPKQwUIRwVdWyiL1bSe5n71/dIUEmen06ioZlq4HSIZm3KJlgU1o68Vk0vuglGBMy4pQgzzWxwnLWLVAvHH5FuVNrEO4hVRyJntmYRqi4jnI9LEM5zJ8a/bThMHGa/mnAmSYtjjqbkmzxk8CmOxe3PtokFwGx7r8JihGQDm+W6c5xOPDz8GLzLEhTOD/b2gl3Zs9jiLt+ZvQx3hTAoJlqdvnBm+6y5cJLMEkytuBnxTHA1wFwZDvoLzomyJDHzGX03pAml1QNiohQ0EW4fIbdlsHHxfNJzhK/YTSqOgJPdF9I1osGEeC2X/ieUTwJN8hQKafWKVEf6iosAqCf48SaXAdptaPmnxwCRPB3g+3N894ZSJXk69NwaNwu/xwK9x7any9Y9mqNGLBVFyJjK+zFcn3vIAGNdA1TVlqaD3i0U8MyWerfRm/wga6yGBqJF3W29Pj7UA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM5PR12MB2504.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(39860400002)(396003)(136003)(376002)(346002)(366004)(451199018)(2906002)(83380400001)(7416002)(5660300002)(36756003)(8936002)(66556008)(66946007)(8676002)(41300700001)(6916009)(54906003)(66476007)(4326008)(38100700002)(86362001)(316002)(478600001)(2616005)(186003)(53546011)(6666004)(6506007)(26005)(6512007)(6486002)(966005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?7D+c2ZxUskADfZXksNKJpUQr4S/PkXjnMpNlyG5PpqG3vw+TcKSpxn12rvlu?=
 =?us-ascii?Q?4cycLU7r8GDSCNN8UfZLb8RwrbUOGVJn4oFqe39EUdKFCO4sALvhxv9Txb6b?=
 =?us-ascii?Q?vEbm6jtb5fb8n97pQwLM6b2KJ+fLR307ueaScn8xREyOmYSnMndwPV3q/nDE?=
 =?us-ascii?Q?zbDOT0Ow3/COX7gYJwnc5R+0aGwH4YuvN4S1WVMmVKz2Di/UkU/sKxD6PC+x?=
 =?us-ascii?Q?sM25Yo8ijPbgvl7kiNMBocmGeqWRKBan3WNu6O1Fm7lEA3569Bot0yyvgCo0?=
 =?us-ascii?Q?olBrL7SvaciX/oLJYMJcYUcw7/p4NKZuNZM91EYPssED3gV4sHaDjBasdqrT?=
 =?us-ascii?Q?KrmTgp5hWeNC7mo1vlK6Uz+Vt472gH4CiCHycjR8ImcgoZJNbcYtB8RaeO7k?=
 =?us-ascii?Q?+U8PoG1Q69+lQf0c+zKze4Y6WLe5zLni8/J85r1uJcjcSsaH+iFTCf8QxQlr?=
 =?us-ascii?Q?ZpODkk8xVZAp+YM/rWGbD9kqSrotvF6/ybPq+3KnUKyVIJ0R1+9/WXjp7cua?=
 =?us-ascii?Q?fulfuV/PKmlaNJY8oGr93ci74FVewPWHORErQqjfl61yis9loaX98bE2W7dQ?=
 =?us-ascii?Q?ZKQosz2ZsfrpWanfzS1PC02aPMeapeASoVFjzHen2xsAlgANKCtTExQS6/3v?=
 =?us-ascii?Q?I+fzPk7C1MOp3Y5Jf/l3ONcGEzUsaP904IvCwFGgDwe7JtYRy0IFHbpoG71I?=
 =?us-ascii?Q?vRTc8zlTYd6WzmnBayqoldd2EJtiC+j6eqGZkHQYK1aQ97uocH37/ySkWkKc?=
 =?us-ascii?Q?claJlOJiMQzGswK+pPnI+dvAzrqUYae8mrUExF+qXqEU7pucUFoV2YDqvU9c?=
 =?us-ascii?Q?S7FdD8hbVXiUaclfeSTo4KfpMSXMEx0+TQmmpwTwFZIqUY9YgYYYRXZkZxim?=
 =?us-ascii?Q?8ot8ld8qlJcdJS5QDk1WO+2EwwHcLnq/YoDkSn2gSFCKhX5imhwt9Ifjhjxr?=
 =?us-ascii?Q?egONBTBFEGgFF6QDKr1ym6SdtqRhKpTOw9kuz7luxa6DYTkBXWTyQWkpFkBN?=
 =?us-ascii?Q?ZNU/ywLPtqDCW3FmPhWii0NR6iBrv7/QsamNr+NS8hlNnv+aqTMxMT6Bzjns?=
 =?us-ascii?Q?CsOplrY1+3T8SamzMmLLme+PX+wq5c6I7dcnqHB4Osuca2co4zyScOddv2Kx?=
 =?us-ascii?Q?NcwfeAVgj+0o54oN5qnWU4PlJceCaqrr24FCuo1ROIZ1MZv1lgNgoJD4YcMp?=
 =?us-ascii?Q?E77jnN5lO5EDPVYbwjK35T88M6Uf4UlBfOkkpFRUJEpy+APLABkKw/iEcwBB?=
 =?us-ascii?Q?De1Zy0KgLZ09o1B3x5rJAi7OtTZIS1E8ykDc2XPmvOeZBuJVE5RBjau9KiZn?=
 =?us-ascii?Q?R7vj0sU+yMiB7+JPhlOaJGMpO0y+3dIk+vCebD1bLi2+A7E9505XT/acO0+H?=
 =?us-ascii?Q?WKMybfvVGd1L+cJ4BJ1Mt8WFEgk82/JOpTZmQ7vOXw5X739eMzvBcZOAcZUs?=
 =?us-ascii?Q?QY4amLnfbfGLO85xUEbv482QGGuiSc8VObnRGx/qZ2Sc+WnqBcKxIODf0rdX?=
 =?us-ascii?Q?NXELu3cCTQ6w+22SZ+hM3gwxkuFhSHUeoZaGGuGXcH7Gg5vMYAbgteoB3eGs?=
 =?us-ascii?Q?c/WH0HiIWy4FsS/4IsttIJm7Ek4xP1LAiRn+75cB?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c74ef369-2829-46c6-2852-08db23db5fb6
X-MS-Exchange-CrossTenant-AuthSource: DM5PR12MB2504.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2023 15:55:31.8483
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: R7H/CuKn7cwZIqf4HHWOUuFRbs0m5OE7HIJgVDo5IUMr9j0xsqFk/7lTbu4PI1BeHJjBsILsSCXSABRcDVGKvQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7422

On Mon, Mar 13, 2023 at 01:51:03AM +0800, Dmitry Osipenko wrote:
> On 3/12/23 12:22, Huang Rui wrote:
> > From: Antonio Caggiano <antonio.caggiano@collabora.com>
> > 
> > Request Venus when initializing VirGL.
> > 
> > Signed-off-by: Antonio Caggiano <antonio.caggiano@collabora.com>
> > ---
> >  hw/display/virtio-gpu-virgl.c | 4 ++++
> >  1 file changed, 4 insertions(+)
> > 
> > diff --git a/hw/display/virtio-gpu-virgl.c b/hw/display/virtio-gpu-virgl.c
> > index fe03dc916f..f5ce206b93 100644
> > --- a/hw/display/virtio-gpu-virgl.c
> > +++ b/hw/display/virtio-gpu-virgl.c
> > @@ -803,7 +803,11 @@ int virtio_gpu_virgl_init(VirtIOGPU *g)
> >  {
> >      int ret;
> >  
> > +#ifdef VIRGL_RENDERER_VENUS
> > +    ret = virgl_renderer_init(g, VIRGL_RENDERER_VENUS, &virtio_gpu_3d_cbs);
> > +#else
> >      ret = virgl_renderer_init(g, 0, &virtio_gpu_3d_cbs);
> > +#endif
> 
> Note that Venus now requires VIRGL_RENDERER_RENDER_SERVER flag to be
> set. Please test the patches with the latest virglrenderer and etc.
> 
> The #ifdef also doesn't allow adding new flags, it should look like:
> 
> #ifdef VIRGL_RENDERER_VENUS
>     flags |= VIRGL_RENDERER_RENDER_SERVER;
> #endif
> 
>     ret = virgl_renderer_init(g, flags, &virtio_gpu_3d_cbs);

In fact, we have rebased to the latest virglrenderer:

We check both VIRGL_RENDERER_RENDER_SERVER or VIRGL_RENDERER_VENUS in
virglrenderer, alternative of them works.

https://gitlab.freedesktop.org/rui/virglrenderer/-/commit/c1322a8a84379b1ef7939f56c6761b0114716f45

Thanks,
Ray

