Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E26177A74FA
	for <lists+xen-devel@lfdr.de>; Wed, 20 Sep 2023 09:56:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.605165.942784 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qis3f-0005pV-Vz; Wed, 20 Sep 2023 07:55:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 605165.942784; Wed, 20 Sep 2023 07:55:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qis3f-0005mV-S6; Wed, 20 Sep 2023 07:55:39 +0000
Received: by outflank-mailman (input) for mailman id 605165;
 Wed, 20 Sep 2023 07:55:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=7N78=FE=amd.com=Ray.Huang@srs-se1.protection.inumbo.net>)
 id 1qis3e-0005mP-3j
 for xen-devel@lists.xenproject.org; Wed, 20 Sep 2023 07:55:38 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2062b.outbound.protection.outlook.com
 [2a01:111:f400:fe59::62b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 14473773-578b-11ee-8789-cb3800f73035;
 Wed, 20 Sep 2023 09:55:36 +0200 (CEST)
Received: from SJ2PR12MB8690.namprd12.prod.outlook.com (2603:10b6:a03:540::10)
 by SA0PR12MB4509.namprd12.prod.outlook.com (2603:10b6:806:9e::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.20; Wed, 20 Sep
 2023 07:55:30 +0000
Received: from SJ2PR12MB8690.namprd12.prod.outlook.com
 ([fe80::c3b:811:fd1d:c33e]) by SJ2PR12MB8690.namprd12.prod.outlook.com
 ([fe80::c3b:811:fd1d:c33e%6]) with mapi id 15.20.6792.021; Wed, 20 Sep 2023
 07:55:30 +0000
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
X-Inumbo-ID: 14473773-578b-11ee-8789-cb3800f73035
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LgNEdvu7O0YLwfIG6dK8mdpvQh2isfGdZY5CUoTW9RIoKBZ8yXPyIL5SPPL2Pdp8KhRBDjVH53kwgxFMLkoWgnQh5v2lIdLSIm6pAtxM8MCSl1CorPCIloO8DmadHxdWPmg40nizWvjJ7NlQcnUl6BcAp1REsFclfNumE07TL9pFljjJSlMxRERw8eJuEQ/NnNTXgdY4UefifTi1moxEKP9XJ4Gj4C8fu4e05nrHRf9V6KGkQVNBzbTQT5E/JBFbLdrjksCrPY5mqVtg6VWnz8r0ImCqDSaaB7xOM8w3cs6QJ0FyOrUh9NqulDWILCiuR2Y+QJq31jTFPy0LkainIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EZC9e/00KCrbeZtSyy5KNo8IzsuMGsxSe1NO2WXh7t8=;
 b=hfdGdMUcsflEQt+qjnICCv2JV/AZCYkgokGLr+a8PFiNUm1TbpK4xHOxRVRbJjPKdWNldALxDtg+/Ph4F2DNr1uPE9nWV/MJkNrFfgFPYV4rV+VcuA1PM+zbDa1niaXS+a3dGxJNvC1TZMTEab/DHLKhvTdiAqgvEeqlrvaeLsdiE91tKv7y8e3EYZpZIragsDAuwtFrvXId5MmbuYg1hyuY7PZ5SaWHQfKERiU5McCTBiUgLuA3Rti80VvLS3wysvQh0bLjfscrGJs3BHm52xrBXDs7t1RYodx+MXKxkjvrVUsEkn6jMTfpmSwfJJBkT2PY/RlGlnR8+qxPQ6wBTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EZC9e/00KCrbeZtSyy5KNo8IzsuMGsxSe1NO2WXh7t8=;
 b=3Rv5WGWa3Thr3ST5Ix2r5XvG7J4xPGx28C1qpSzyipjU1WRzXwqLzU7ppZ/S4Ymx9WZJSsRliMZW8WnWFGfF8asVBxCHHUeFPV9SJW8/EHV5bhl0WsjaVrq5InNBVMdnJeUPDV0iZven+ZXkgwXFVDt2nLw3oTFuKZLlV73zUEk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Date: Wed, 20 Sep 2023 15:55:01 +0800
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
Subject: Re: [QEMU PATCH v5 10/13] virtio-gpu: Resource UUID
Message-ID: <ZQqlVb2PkRMjMaKF@amd.com>
References: <20230915111130.24064-1-ray.huang@amd.com>
 <20230915111130.24064-11-ray.huang@amd.com>
 <a3a46b78-9feb-47f3-bd3e-519ebe899737@daynix.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a3a46b78-9feb-47f3-bd3e-519ebe899737@daynix.com>
X-ClientProxiedBy: SI2PR01CA0027.apcprd01.prod.exchangelabs.com
 (2603:1096:4:192::7) To SJ2PR12MB8690.namprd12.prod.outlook.com
 (2603:10b6:a03:540::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR12MB8690:EE_|SA0PR12MB4509:EE_
X-MS-Office365-Filtering-Correlation-Id: 699ec20f-3535-4111-04c9-08dbb9aef57f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	l5xgTjxY70F9McTm16eFNxnlRlVDwtRqz+xhClO8DW1PseXNgJrNasuI374VPif1CzF5BjnD8kS2Vw++Wt2zcWN7W85XvtT9TI3ua+4Lo58JK2ukN0/FvKRpkcYs/siSpNAp9teXmPbZ6Vg9Sae05QyRO8nA/QLBzy8mgXnJtLwKdZgdzKVc3r3kaY9e3orwxJuOZWgtAo4FF2W+xFRcFjzejUOMZ6Enk4G19rfmT0NQGMi8OeMPFWPrftkYz04o/EGc+mPnSjqn7/+BbsSVplMQKF8js18f9N4cYCjPyfjVz8rTNmihQU7J9w6d4gpNVvrKr4mjvVWufXZN+yaxWweweN3Nr9osICjFxSw3iCqI2y02VzDFzzaPCGHcZkinqKMxa21BUUqSsve6WCK1z3SFJQOW1KIXRbST03LgKtd2nDhseKQM5O1pPJkYbwo+rhetg9Frc2JfV+EO2kTv/vjO6hhrUsO5kvjx1JBlWZsr+SUsX98e321MCSuQpgUAcqzKV72B9DXxxiVKaBgD45sjQJe5tJzROiQ2/U8yEvH8tK7g1BQyeBrjlpB5gdwZWr0bREl/LN8TQRzeEl514Uue5yP3neuYAlFgIas1nMw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR12MB8690.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(346002)(396003)(366004)(39860400002)(376002)(186009)(1800799009)(451199024)(6506007)(53546011)(6666004)(6486002)(6512007)(478600001)(83380400001)(26005)(2616005)(2906002)(7416002)(66476007)(54906003)(66556008)(66946007)(316002)(4326008)(8676002)(5660300002)(8936002)(41300700001)(6916009)(86362001)(36756003)(38100700002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?i9RqqPUYszmjlm8yH5TITR/4/CDLQkcv1z3b7wJpYf2OOWWVZzHMrDp+b1cE?=
 =?us-ascii?Q?JTzmUvHXZQclrisZXRdIa4DCjff8eyunGmCHbZOjN0Ne29lOEoYOil3mmwvx?=
 =?us-ascii?Q?JdwqBkBm6bVb8F7iUOhQtWiNn0UxAmcEgEFdsETHD7JUXoql/BG5yKQycQOz?=
 =?us-ascii?Q?2/sPwqlrmAYgtPGzNFA/HPd0Kken91/477m00QnDNJf/plvks8XDnpAeaENm?=
 =?us-ascii?Q?qCpHR/CoyQekTmzf/Wn2YeZR3tHnHRo5XYxXBqv/7x4IeAeUPz9XQPQdTGkt?=
 =?us-ascii?Q?vlvIsD3VjV2vXJDB9HiJpYjtIi/KTNIkjfOYV3tvosrXfuGWTxjIa5Nkhrsr?=
 =?us-ascii?Q?diI38Mv16cPdZxnXFnR4ZNvE9XPnOo/+QIJL8YF2Wt0Y00Ry3FIS6qfHCX8z?=
 =?us-ascii?Q?HZyb1erQwy9+UZc6RwvjtkgWcG/iFGy6Bh8XRGyjKuTq5hfl4cj3xFEqRg5J?=
 =?us-ascii?Q?VzcDRx9uBzu/sZbGs5/WDtso9zCrJVwgs5azFYzCk1VXsQIuqHUjbZC5icrz?=
 =?us-ascii?Q?QPvGaLiG+SAltuWsEr6b19m1ppLTz8VHMHIr0odylqs+/aICu/U93jIZHQvH?=
 =?us-ascii?Q?4Dh4cy5lj00NximOlxEWgU/LjSSymuJG0L4dDQ7seyICXkXErvSb4U0OyWfu?=
 =?us-ascii?Q?5sSMLoeRx8+cD0D6JNG+wDb8G2IZRnjskSPz6HpZ9e7SvsJna49fafWUxvVN?=
 =?us-ascii?Q?ehkKSJM0+5lp48i/sxxyd6C5hNDBhS4jP8riY6XeKgtxCyQd68lUoISS7u58?=
 =?us-ascii?Q?uZN7GEHmSFb+pKtgJuegoQOiEUG6NOHqwdfE32X4L/Q12JalBsqOORzHr5gK?=
 =?us-ascii?Q?1Eyd5cg6f2COkMKPAizOxIEsPcs5FgSGEfNgkzwdKpWVVMuq26a6W3JdBQD4?=
 =?us-ascii?Q?LG/udHfZnYWQEKA67XoQvRLAzW42eNGdxwSeb4zuL0JyjJuO4DY8hybW0Vlq?=
 =?us-ascii?Q?arDaTFbrjISbBAWMUHF8b+AE3DlEAhaptjdYiHqeDFxu8WGqXWHCuwOiTX0X?=
 =?us-ascii?Q?2iBG9Jd7lT4C4WAVkM6mq6mET6XOx+QxmKWlqOND4qWtRuCNxtsmakcV+XiT?=
 =?us-ascii?Q?LKDIWu1PGXyRnuhUUCRXLKrvGx8T4vrx/E+CV3FV4L8nqVZvLAxocDfzjExX?=
 =?us-ascii?Q?yQoVHgQ3sd+xFbZWw0ORvx1O8wqdZ4RzmJVHNHFEo/BlyAatKWNj6EJb+7uL?=
 =?us-ascii?Q?Wc47SypSYa1OMksRzyolZmKx9piSJN4Oqd+JaxYrQRUttbSNQ6fdB+LhoCh/?=
 =?us-ascii?Q?fi8QosVchl89aoZFPOya8QTi6Cv3atDROjc0hSsFe8MotTkd/98JnU/Ugk1G?=
 =?us-ascii?Q?5ZHYaqeZhx0XFSJ417bEplmkkYOD2iwwSvraKVZCH8nMCenGSS/MJoYODATK?=
 =?us-ascii?Q?NL+y6AUbJ2K8TQX/P/+hx5WcQRCG6lKb9sNo45Jx4fI0ag9xBMZlT1FdrzHa?=
 =?us-ascii?Q?dF3euV+Bds3lyBlB+tqvbyNoa+UPSzULEYJ12jBMusbymLvA7vnmyOPjMbU/?=
 =?us-ascii?Q?Raiwn3RpF6bwAT1eLyvqhh6ggibPUEIrh9F3BYnr6zZhoNLG6U5GRjmB7UTG?=
 =?us-ascii?Q?5ZXeXS8shhjSixDpjpArDxIRdlrQofRsuB/+UXrM?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 699ec20f-3535-4111-04c9-08dbb9aef57f
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB8690.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Sep 2023 07:55:29.9335
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: b1ouNsWGxpPsVYasmyotbcHsd2AIe32gMUh6ThBh1/WIQERYq9bT0KIECBd852y1qvT9ZxYME7T0Ygnvu+1AMQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4509

On Sat, Sep 16, 2023 at 12:48:14AM +0800, Akihiko Odaki wrote:
> On 2023/09/15 20:11, Huang Rui wrote:
> > From: Antonio Caggiano <antonio.caggiano@collabora.com>
> > 
> > Enable resource UUID feature and implement command resource assign UUID.
> > This is done by introducing a hash table to map resource IDs to their
> > UUIDs.
> > 
> > Signed-off-by: Antonio Caggiano <antonio.caggiano@collabora.com>
> > Signed-off-by: Huang Rui <ray.huang@amd.com>
> > ---
> > 
> > V4 -> V5:
> >      - Add virtio migration handling for uuid (Akihiko)
> >      - Adjust sequence to allocate gpu resource before virglrender resource
> >        creation (Akihiko)
> >      - Clean up (Akihiko)
> > 
> >   hw/display/trace-events        |  1 +
> >   hw/display/virtio-gpu-base.c   |  2 ++
> >   hw/display/virtio-gpu-virgl.c  | 21 ++++++++++++
> >   hw/display/virtio-gpu.c        | 58 ++++++++++++++++++++++++++++++++++
> >   include/hw/virtio/virtio-gpu.h |  6 ++++
> >   5 files changed, 88 insertions(+)
> > 
> > diff --git a/hw/display/trace-events b/hw/display/trace-events
> > index 2336a0ca15..54d6894c59 100644
> > --- a/hw/display/trace-events
> > +++ b/hw/display/trace-events
> > @@ -41,6 +41,7 @@ virtio_gpu_cmd_res_create_blob(uint32_t res, uint64_t size) "res 0x%x, size %" P
> >   virtio_gpu_cmd_res_unref(uint32_t res) "res 0x%x"
> >   virtio_gpu_cmd_res_back_attach(uint32_t res) "res 0x%x"
> >   virtio_gpu_cmd_res_back_detach(uint32_t res) "res 0x%x"
> > +virtio_gpu_cmd_res_assign_uuid(uint32_t res) "res 0x%x"
> >   virtio_gpu_cmd_res_xfer_toh_2d(uint32_t res) "res 0x%x"
> >   virtio_gpu_cmd_res_xfer_toh_3d(uint32_t res) "res 0x%x"
> >   virtio_gpu_cmd_res_xfer_fromh_3d(uint32_t res) "res 0x%x"
> > diff --git a/hw/display/virtio-gpu-base.c b/hw/display/virtio-gpu-base.c
> > index 4f2b0ba1f3..f44388715c 100644
> > --- a/hw/display/virtio-gpu-base.c
> > +++ b/hw/display/virtio-gpu-base.c
> > @@ -236,6 +236,8 @@ virtio_gpu_base_get_features(VirtIODevice *vdev, uint64_t features,
> >           features |= (1 << VIRTIO_GPU_F_CONTEXT_INIT);
> >       }
> >   
> > +    features |= (1 << VIRTIO_GPU_F_RESOURCE_UUID);
> > +
> >       return features;
> >   }
> >   
> > diff --git a/hw/display/virtio-gpu-virgl.c b/hw/display/virtio-gpu-virgl.c
> > index 563a6f2f58..8a017dbeb4 100644
> > --- a/hw/display/virtio-gpu-virgl.c
> > +++ b/hw/display/virtio-gpu-virgl.c
> > @@ -36,11 +36,20 @@ static void virgl_cmd_create_resource_2d(VirtIOGPU *g,
> >   {
> >       struct virtio_gpu_resource_create_2d c2d;
> >       struct virgl_renderer_resource_create_args args;
> > +    struct virtio_gpu_simple_resource *res;
> >   
> >       VIRTIO_GPU_FILL_CMD(c2d);
> >       trace_virtio_gpu_cmd_res_create_2d(c2d.resource_id, c2d.format,
> >                                          c2d.width, c2d.height);
> >   
> > +    res = g_new0(struct virtio_gpu_simple_resource, 1);
> > +    if (!res) {
> > +        cmd->error = VIRTIO_GPU_RESP_ERR_OUT_OF_MEMORY;
> > +        return;
> > +    }
> > +    res->resource_id = c2d.resource_id;
> > +    QTAILQ_INSERT_HEAD(&g->reslist, res, next);
> > +
> 
> The struct virtio_gpu_simple_resource for a resource created with 
> virgl_cmd_create_resource_2d() and virgl_resource_attach_backing() will 
> not have iov and iov_cnt set, which is inconsistent with 
> virgl_cmd_resource_create_blob().
> 

OK, so we should find out the resource in virgl_resource_attach_backing(),
and set the related iov and iov_cnt for this resource to align with blob
memory.

> >       args.handle = c2d.resource_id;
> >       args.target = 2;
> >       args.format = c2d.format;
> > @@ -60,11 +69,20 @@ static void virgl_cmd_create_resource_3d(VirtIOGPU *g,
> >   {
> >       struct virtio_gpu_resource_create_3d c3d;
> >       struct virgl_renderer_resource_create_args args;
> > +    struct virtio_gpu_simple_resource *res;
> >   
> >       VIRTIO_GPU_FILL_CMD(c3d);
> >       trace_virtio_gpu_cmd_res_create_3d(c3d.resource_id, c3d.format,
> >                                          c3d.width, c3d.height, c3d.depth);
> >   
> > +    res = g_new0(struct virtio_gpu_simple_resource, 1);
> > +    if (!res) {
> > +        cmd->error = VIRTIO_GPU_RESP_ERR_OUT_OF_MEMORY;
> > +        return;
> > +    }
> > +    res->resource_id = c3d.resource_id;
> > +    QTAILQ_INSERT_HEAD(&g->reslist, res, next);
> > +
> >       args.handle = c3d.resource_id;
> >       args.target = c3d.target;
> >       args.format = c3d.format;
> > @@ -682,6 +700,9 @@ void virtio_gpu_virgl_process_cmd(VirtIOGPU *g,
> >           /* TODO add security */
> >           virgl_cmd_ctx_detach_resource(g, cmd);
> >           break;
> > +    case VIRTIO_GPU_CMD_RESOURCE_ASSIGN_UUID:
> > +        virtio_gpu_resource_assign_uuid(g, cmd);
> > +        break;
> >       case VIRTIO_GPU_CMD_GET_CAPSET_INFO:
> >           virgl_cmd_get_capset_info(g, cmd);
> >           break;
> > diff --git a/hw/display/virtio-gpu.c b/hw/display/virtio-gpu.c
> > index cc4c1f81bb..44414c1c5e 100644
> > --- a/hw/display/virtio-gpu.c
> > +++ b/hw/display/virtio-gpu.c
> > @@ -966,6 +966,38 @@ virtio_gpu_resource_detach_backing(VirtIOGPU *g,
> >       virtio_gpu_cleanup_mapping(g, res);
> >   }
> >   
> > +void virtio_gpu_resource_assign_uuid(VirtIOGPU *g,
> > +                                     struct virtio_gpu_ctrl_command *cmd)
> > +{
> > +    struct virtio_gpu_simple_resource *res;
> > +    struct virtio_gpu_resource_assign_uuid assign;
> > +    struct virtio_gpu_resp_resource_uuid resp;
> > +    QemuUUID *uuid;
> > +
> > +    VIRTIO_GPU_FILL_CMD(assign);
> > +    virtio_gpu_bswap_32(&assign, sizeof(assign));
> > +    trace_virtio_gpu_cmd_res_assign_uuid(assign.resource_id);
> > +
> > +    res = virtio_gpu_find_check_resource(g, assign.resource_id, false, __func__, &cmd->error);
> > +    if (!res) {
> > +        return;
> > +    }
> > +
> > +    memset(&resp, 0, sizeof(resp));
> > +    resp.hdr.type = VIRTIO_GPU_RESP_OK_RESOURCE_UUID;
> > +
> > +    uuid = g_hash_table_lookup(g->resource_uuids, GUINT_TO_POINTER(assign.resource_id));
> > +    if (!uuid) {
> > +        uuid = g_new(QemuUUID, 1);
> > +        qemu_uuid_generate(uuid);
> > +        g_hash_table_insert(g->resource_uuids, GUINT_TO_POINTER(assign.resource_id), uuid);
> > +        res->has_uuid = true;
> > +    }
> 
> What about embedding uuid into struct virtio_gpu_simple_resource? You 
> will not need to maintain another table in this way.

Yes, agree. Will update it in V6.

Thanks,
Ray

