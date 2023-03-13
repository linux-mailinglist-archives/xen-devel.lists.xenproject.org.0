Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DBDF26B7CE6
	for <lists+xen-devel@lfdr.de>; Mon, 13 Mar 2023 16:58:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.509337.784897 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pbkYQ-0003cM-SR; Mon, 13 Mar 2023 15:57:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 509337.784897; Mon, 13 Mar 2023 15:57:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pbkYQ-0003Zy-Pf; Mon, 13 Mar 2023 15:57:42 +0000
Received: by outflank-mailman (input) for mailman id 509337;
 Mon, 13 Mar 2023 15:57:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=LnkN=7F=amd.com=Ray.Huang@srs-se1.protection.inumbo.net>)
 id 1pbkYP-0003Zr-IC
 for xen-devel@lists.xenproject.org; Mon, 13 Mar 2023 15:57:41 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on20603.outbound.protection.outlook.com
 [2a01:111:f400:7eaa::603])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c72243a8-c1b7-11ed-87f5-c1b5be75604c;
 Mon, 13 Mar 2023 16:57:40 +0100 (CET)
Received: from DM5PR12MB2504.namprd12.prod.outlook.com (2603:10b6:4:b5::19) by
 CH2PR12MB5001.namprd12.prod.outlook.com (2603:10b6:610:61::18) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6178.24; Mon, 13 Mar 2023 15:57:35 +0000
Received: from DM5PR12MB2504.namprd12.prod.outlook.com
 ([fe80::4f9:60f8:cb12:d022]) by DM5PR12MB2504.namprd12.prod.outlook.com
 ([fe80::4f9:60f8:cb12:d022%3]) with mapi id 15.20.6178.022; Mon, 13 Mar 2023
 15:57:35 +0000
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
X-Inumbo-ID: c72243a8-c1b7-11ed-87f5-c1b5be75604c
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LOOr8buJClWzMRvizM8nlA3R6FjVDrQpQnZIktkvYpQ8mCnKjgpbQNrbZlgZu5/6i4wz3Nl8Lfs61hTGZ/jQQOqrkEUvPUxK4s9EhrCVMCUwcq2SHMrCXyb1zfThXO7lMrrNkRHgfBHRewy4VCxGJHDKarh3VOHn6G5hH7YMf4ecMIoZdJZv9YqQ3XBCyuI6LhM9ex2IA6n7H4HIJSggEIK38oo+H8SYJ05HvIxoECPa/SHDdyjGVWGSJDJFgthIRz83tW0Mk43lK/xgIqY6B4oxGet3BiNMP5PsCezC3OF2mOMllzdCYk49k1qKR6M+KoReEmw54PhteZyoBapDvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Bthr1QWPFMEqeEDh/KBoh+yxNrZXBaalAi4REG9k+To=;
 b=GUQOJdF4fZ7B8/hcJL/I+7A8dFtSDs5laUhtLKOpeLT6tU89lyN+BSltV3uxxBhJ8FNS3XnPt3iAnC8dYRgdngEFkI1siWpzOrHGEe9sd2fMcFlfcs1gwrUy+v1+W2JbO1C4JBEdPIM8ELeSJBDq5mSmXZVfnL+QetgPVnwDLBpsq2WffPcca4kPCSNcwafcIwP0pm01ZT7U4j3Hn3rZmDJO7uFZC9XbNiQbunQ4KsUTJDZFi9+TzJwaffDS7mz8b5Nz+UsYkcHwRPwJVm1PnU3uYNA2b2cO5Xk72PlKp0lqM9QUU2hi1EMfanMAQiBIsDmL6Cfs+W5eX/hdc9xavA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Bthr1QWPFMEqeEDh/KBoh+yxNrZXBaalAi4REG9k+To=;
 b=RonlFwTGhLWJoIFEmyTjeIL31IxdmFI5TXQBOhq3xJ0jy5rCkuS1rIG6p7MbcscdvAldY7ZPV96PU3lwpnHLVftmrlEDuWbQs8MqGhc4IZB7rii6trgiBs3MY1dYfRbMwtg4qzXB9kyCe17wGVYPD865/zGBolm0F7mO5x6n45s=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Date: Mon, 13 Mar 2023 23:57:09 +0800
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
Message-ID: <ZA9H1TtNTiPEj130@amd.com>
References: <20230312092244.451465-1-ray.huang@amd.com>
 <20230312092244.451465-9-ray.huang@amd.com>
 <68195782-0309-2f81-7f1f-84a7fe7bb05c@collabora.com>
 <d6f31fd0-bc04-79a5-266b-5e6ba7bf2a03@collabora.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d6f31fd0-bc04-79a5-266b-5e6ba7bf2a03@collabora.com>
X-ClientProxiedBy: SG2PR02CA0037.apcprd02.prod.outlook.com
 (2603:1096:3:18::25) To DM5PR12MB2504.namprd12.prod.outlook.com
 (2603:10b6:4:b5::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM5PR12MB2504:EE_|CH2PR12MB5001:EE_
X-MS-Office365-Filtering-Correlation-Id: a7c66f17-0fdc-4ad4-33f4-08db23dba9ac
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ews51hkgbGsIyA9wHIv53MzFWxxjoxwz+SbcBp57AdkoW1IKiCGhnMEQ1E67Sa77whd8AqUy9MofT3ynem1WKQ2KvrmcHkBKOEjvYRGXS6Na6A/vHn+++Dc93xTNAtoVlj5HI4WmbVxhQ/7o7pZuoJe6EDuCh2HHJNXf+7jbCxFb79erpWcJ4NuhMFNUwjS1+geaBWY22vXqDQPvzwyiUaLmB3Iu3K31EoOOFDPjtFzEr2/w0IA9wSOy726EW8HbcEu05/Y7GxNNUq58AkzujE5qXTPy7VJ41r8K6tTXf7qa9ZPqEwscOx10+rqSvj1Ky/BEHAYdhaZDGcELVFUQuT2aGEF9NIlmmUaTR3fkNiBed4ENhK3UE260BnW/RB5qsik3KaiQKjYbF3FPeCqmK+xiJ2IvZVkqzgOiXdCZZTy+rD9cW+vREmI9lFYTByNjbqxKfulHyfpWEHo57GYsl+Pa0KX/+GsOlUknkwGN+oeZALTY/mASpsVV42u+ELMvtzem7biJAcaKZvTg3O1Y2XZvKvAHM2KK5pDMMelyXkHH+H2XjgsWJ9tGP0M8FYCL/Ae7VddF3hgi+Vj1cH4FY/LkHHjIQnc0BZ/pxpVowrc/SE3sV8w8c2pL24vbxAnT
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM5PR12MB2504.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(366004)(346002)(396003)(376002)(39860400002)(136003)(451199018)(41300700001)(54906003)(478600001)(8676002)(4326008)(66556008)(66476007)(66946007)(8936002)(6916009)(36756003)(86362001)(38100700002)(26005)(53546011)(6512007)(966005)(6486002)(6666004)(186003)(5660300002)(7416002)(2906002)(316002)(6506007)(83380400001)(2616005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?lec8PC7VQ1zBZ4Jul/ISAM9lhC9H/xcyVA13B1UHAJDWr3guis7kdC8BGLoJ?=
 =?us-ascii?Q?K4mawDAtOWBU/KTHwzr1Rjvarm2OkIxbMvP++D9RexRddpnUlY9eO3MSuxAM?=
 =?us-ascii?Q?tE9RfbufraSoyQ2fGqmbbY7caDL2DNUqrKDF73kXkBypd+HcIsXz3rriwOYV?=
 =?us-ascii?Q?Cd7p7YLGhFRQu8Fvr3vP9ikIYNVx+Twj/HPL1TO266X5OFOYYykGGxEzlcE3?=
 =?us-ascii?Q?x099wZ/YovgQogFxAx7ixpW0a4TIIIpknMJIIGipxSNpsEwZo6GAc5aFebgJ?=
 =?us-ascii?Q?jAqMbAgjLvFsOapbst/uEYWhm5x94vQQUae6P3pSfPjBYCG6Jo1iR3Fo7UNU?=
 =?us-ascii?Q?RGBFOSxsdUmkXKOSmGKFXxHA2ZtACTuH6fSDuLvfzkW5pT/JNPXVhVVVOvNc?=
 =?us-ascii?Q?7I9wKtjkkOk5X1TC97XSMqn2JVXjVmEc//oPx7mZC9Dn7pNFifvbLRgbfAIv?=
 =?us-ascii?Q?2AWkUzYaDItKydKsOpPdrc8xdOdryh9yvYwe4L2Mr3fNhvQa4L9WOb1wk0JR?=
 =?us-ascii?Q?/GVldr6W3u4flZ8Hbefuya6Nbts3jZIR25KKoiUSndKM0+FVYMXQoUj7gutr?=
 =?us-ascii?Q?/k7wiJr2xQFFJ/Awu0LyKzz/4fe/kKo7Jsgi8iA0DI/xLzog55XZaPvmtgps?=
 =?us-ascii?Q?0T21Ga55KsGRk3RDqqJDWISombYKcvFw0Rm+XZ+KKIGwy4M6EtQw4DxXljgq?=
 =?us-ascii?Q?B7pQvL0LqjCf0sPXB2KmTOrgsKlB6EKfwKi2CJz77L8H+WeaeGju8/23c71S?=
 =?us-ascii?Q?3nSoPoqXBS99IejVYPJL5ySumxMWt3G3vsWmbVlyqSDLncfRGDPdNzq0tifW?=
 =?us-ascii?Q?i/LF94D/4W7X3zVsPi99ET+oFdhNCsW8EM9vQ57nfhVnZ/DXGtkHMZCQu6oO?=
 =?us-ascii?Q?xXD2KvAwvThpZ3KaIWL1b5eqjjiAUC2HoGW7WqhEBq4xjq0rNKX42olWT5oG?=
 =?us-ascii?Q?mC7sNmwDWhJ4uMydAK3nw8if4VZpak4kMTAMgygaNS2L/khL8SY+VDMxikBT?=
 =?us-ascii?Q?p/WDStPL+i7GaA6vw+HLSL/wvt8yMNqTYeGJwTjQKhxUBvueRruVzj39hc5Y?=
 =?us-ascii?Q?5iw1wBtVqSTy9v7wqmpXmk04PvVnyCwap3Mwx3imGgVmta8X/dgs6nhC5Td4?=
 =?us-ascii?Q?Q4lBruRvLCz5+0pMyCpEyNfJorX6YZrvwqikxWWf1VWTYVAB1owN78hfcuGj?=
 =?us-ascii?Q?QHby9QA6VQjIiKAsD+z8rzkTqcPuai8r/LLtWbWcO1zf4R+XFV9LuPXfX/+t?=
 =?us-ascii?Q?V+Gr1LRqQGGs6N7HqrAm3yNETxL7r9FIsoKDoQXVR3eGBAp/06vC23MVbfdF?=
 =?us-ascii?Q?SfgFOaAL1MiP6pjDdDRDUpafAOpmi2qTfG6sxWIKxbfsoZKaKxhY7wrTMKbg?=
 =?us-ascii?Q?69gEO81DJ4gk+yTitNW/kGSw9WL6zqB4/000CormDylqzcf9it2bq5ACfYQt?=
 =?us-ascii?Q?BeNmJijxMTziWmp8E1rQeCsBKUC9JhrWBXiJVL8da6B1IWrTBnsVPUE9DvdM?=
 =?us-ascii?Q?8ACkszZIyi01evGIE1opXZPM4aPQFr93vK0whwmGOToYlrJ6ebYA9gkJkdLg?=
 =?us-ascii?Q?wdXPUYQSwKTJu+eUTImEXDxiTTvz02a8mPlCa0fE?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a7c66f17-0fdc-4ad4-33f4-08db23dba9ac
X-MS-Exchange-CrossTenant-AuthSource: DM5PR12MB2504.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2023 15:57:35.5908
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +uI52VvInu/hbxHLYI1Gx1H5YDvSUiLAdY9tOQTnPq5h3X4NDGbg2+/QhaAOh02/NsB/a+sm3wDN5t14B8NLYQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB5001

On Mon, Mar 13, 2023 at 10:22:24AM +0800, Dmitry Osipenko wrote:
> On 3/12/23 20:51, Dmitry Osipenko wrote:
> > On 3/12/23 12:22, Huang Rui wrote:
> >> From: Antonio Caggiano <antonio.caggiano@collabora.com>
> >>
> >> Request Venus when initializing VirGL.
> >>
> >> Signed-off-by: Antonio Caggiano <antonio.caggiano@collabora.com>
> >> ---
> >>  hw/display/virtio-gpu-virgl.c | 4 ++++
> >>  1 file changed, 4 insertions(+)
> >>
> >> diff --git a/hw/display/virtio-gpu-virgl.c b/hw/display/virtio-gpu-virgl.c
> >> index fe03dc916f..f5ce206b93 100644
> >> --- a/hw/display/virtio-gpu-virgl.c
> >> +++ b/hw/display/virtio-gpu-virgl.c
> >> @@ -803,7 +803,11 @@ int virtio_gpu_virgl_init(VirtIOGPU *g)
> >>  {
> >>      int ret;
> >>  
> >> +#ifdef VIRGL_RENDERER_VENUS
> >> +    ret = virgl_renderer_init(g, VIRGL_RENDERER_VENUS, &virtio_gpu_3d_cbs);
> >> +#else
> >>      ret = virgl_renderer_init(g, 0, &virtio_gpu_3d_cbs);
> >> +#endif
> > 
> > Note that Venus now requires VIRGL_RENDERER_RENDER_SERVER flag to be
> > set. Please test the patches with the latest virglrenderer and etc.
> > 
> > The #ifdef also doesn't allow adding new flags, it should look like:
> > 
> > #ifdef VIRGL_RENDERER_VENUS
> >     flags |= VIRGL_RENDERER_RENDER_SERVER;
> > #endif
> > 
> >     ret = virgl_renderer_init(g, flags, &virtio_gpu_3d_cbs);
> > 
> 
> BTW, Alex reviewed the Venus v3 patches a month ago [1] and the review
> comments need to be addressed. AFAICS, you're actually using the very
> old Venus patches here that stopped working about a year ago, so again
> you're using a very outdated virglrenderer version.
> 
> Please take it all into account if you'll beat me to posting the next
> version of Venus patches ;)
> 
> [1]
> https://lore.kernel.org/qemu-devel/20220926142422.22325-1-antonio.caggiano@collabora.com/
> 

Thanks Dmitry point it out, I will use the latest v3 patches, and try to
address the comments in next version. :-)

Thanks,
Ray

