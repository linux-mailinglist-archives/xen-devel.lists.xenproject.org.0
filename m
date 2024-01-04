Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C9638823CC1
	for <lists+xen-devel@lfdr.de>; Thu,  4 Jan 2024 08:29:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.661087.1030784 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rLI9G-0001Bl-MW; Thu, 04 Jan 2024 07:28:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 661087.1030784; Thu, 04 Jan 2024 07:28:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rLI9G-000198-Iu; Thu, 04 Jan 2024 07:28:14 +0000
Received: by outflank-mailman (input) for mailman id 661087;
 Thu, 04 Jan 2024 07:28:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=NmwG=IO=amd.com=Ray.Huang@srs-se1.protection.inumbo.net>)
 id 1rLI9E-000192-QX
 for xen-devel@lists.xenproject.org; Thu, 04 Jan 2024 07:28:13 +0000
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on20611.outbound.protection.outlook.com
 [2a01:111:f400:7e83::611])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cf286c82-aad2-11ee-98ef-6d05b1d4d9a1;
 Thu, 04 Jan 2024 08:28:10 +0100 (CET)
Received: from SJ2PR12MB8690.namprd12.prod.outlook.com (2603:10b6:a03:540::10)
 by IA1PR12MB6385.namprd12.prod.outlook.com (2603:10b6:208:38b::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7135.25; Thu, 4 Jan
 2024 07:28:05 +0000
Received: from SJ2PR12MB8690.namprd12.prod.outlook.com
 ([fe80::9b8e:816d:20b9:9845]) by SJ2PR12MB8690.namprd12.prod.outlook.com
 ([fe80::9b8e:816d:20b9:9845%5]) with mapi id 15.20.7159.013; Thu, 4 Jan 2024
 07:28:05 +0000
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
X-Inumbo-ID: cf286c82-aad2-11ee-98ef-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kKfb7ELqUk5W1M1Az+Wcid8+QRnAjrdmUkzFrWrvX/nU2JbtyuuAPLmeFb0SpUczC5h2U/BrOIUhFoq4c1QhGI1lzyNtPIXz1pc4woBC+qjgDFBYbwEcCcX/6KcL0NZZQ+ofNcIoTdfT8SCRpJdjOXeL4zKMpQaSzn4XAp4Frk7T8nS+gOCM4En1gnQw0gp0abtGNE5gnsmMFMHRYUipLkoxk/0O/HvY/E0iQTaq6ZDSP4W1cfkOqCZgg0wSxd/hJqunGVardz7Itf1ddfRD8Mh2iKn5HAXhce4yXFuY7bF142doPl/AFkF7RAo2ngiOgLUf9loXnjkqyL/OKPaQjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bQgBZZHXKDiWsObp33Dylkkgai5L0Y9yrgbatlk5dXc=;
 b=npRbXebCEOPPHgo2RafMCtA0r4calyedCZEHY2gqkIf76I4Od6QSAxBe6kLLWqUESOaf3U8E8h+hpFWwuBgrVx+OjkZeAnKiVbZJuBKno2lxXI89C+tV20N+EoUhCYzhpPusC8l3kPcEXBRt+++4F3L1dt7VUIwcm3H5QDNm+RinCS7DRsb3OFO/5rOy44aaUH2uD6C4ruy5JiIlGLL3RS8/ZmxneMcP+8t3cWrsc4YrSiV4wvbFosiiWZE8UNRsTvxSlrLvmEF0ZsoS6O3jCBZ+2cbfjpnhEXU810Eb0UrCbJjqZXycDhexB13p2ynVpkbgyUhO2oUA2kjs1pe4Mw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bQgBZZHXKDiWsObp33Dylkkgai5L0Y9yrgbatlk5dXc=;
 b=CWwaVrjhhvyVZPHPdfnFIg+v92segp59XCno+2Dihg2CwFJhlQ2p4mtaJJBVrNNAEJIKzQBURVX0UAMkAD7p5arY4CalypYc8+i8+moJc7RZS0Hqq9AUxC9mUvfCQ9ABr4xX29uqWTV0TibwjX2IAW8VPA63+/hI2bCJh1ZZILs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Date: Thu, 4 Jan 2024 15:27:38 +0800
From: Huang Rui <ray.huang@amd.com>
To: =?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@gmail.com>
Cc: Akihiko Odaki <akihiko.odaki@daynix.com>,
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
	"Chen, Jiqian" <Jiqian.Chen@amd.com>
Subject: Re: [PATCH v6 05/11] virtio-gpu: Introduce virgl_gpu_resource
 structure
Message-ID: <ZZZd6rueZGmzSbPb@amd.com>
References: <20231219075320.165227-1-ray.huang@amd.com>
 <20231219075320.165227-6-ray.huang@amd.com>
 <CAJ+F1CKOsDk835H8j56mfS7e=8BusYjo3mJYwuPbdRPq1MmNzw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAJ+F1CKOsDk835H8j56mfS7e=8BusYjo3mJYwuPbdRPq1MmNzw@mail.gmail.com>
X-ClientProxiedBy: SG2PR02CA0108.apcprd02.prod.outlook.com
 (2603:1096:4:92::24) To SJ2PR12MB8690.namprd12.prod.outlook.com
 (2603:10b6:a03:540::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR12MB8690:EE_|IA1PR12MB6385:EE_
X-MS-Office365-Filtering-Correlation-Id: 80af6f06-263d-4c9a-b561-08dc0cf6b0ca
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	mwATAW5smQUBr/NkiutoK/x0weguozx4lOB3rXBkvh1Ijvb3dd2YR6PqUpgDE4kHjINk1qcHnnNmRlqziB2KoOAEkom7DCvW4WgmSHDTIC6XidPDz+Aglda4DeDVVTdY0FSTy3AkhjUTNyjBoIhkPT9uTzRbQbDBLRZau+WD88sq1JBVNkAnaG+vbMocj3SrZ+TNoW1C/oeh+LusDtwjT9p/k1At/GPGk/DoyIr5saiJTU0DpFYkmpdp/kV2CT+QE+JxrdN2KaxzYylvRhZPRAh0cezIFTv/U10PSj8SLE0XuLb1xQUwt2znf6UxjBF5jpFgX+rUFKSd4YiQIsiJxnxDzsw9GUaVUIPNq7nk4ZqCVxB02MOJfaHmivFAp1/v/+JyFFdkgMC4ZPHxaD3K4MpG9BACL2SMRJp6JTpaNNgtVuuH/OV9WKnr6YZGXnyIHFYHR0LP5l4znuY/LiMXuZtO+t9u7sY/h8XobugyC4p78UKslqDVgf486ExcTyn+c/w9nxzR3RCluY0Ghot9FJZ2uUrlOyMJcVPGSQnkyIs7TokA+yT5LJ1K/yuKA8P9
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR12MB8690.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(396003)(346002)(39860400002)(376002)(366004)(230922051799003)(186009)(1800799012)(451199024)(64100799003)(66946007)(4326008)(8676002)(316002)(478600001)(54906003)(6916009)(66556008)(8936002)(6486002)(66476007)(83380400001)(6512007)(53546011)(6506007)(6666004)(2616005)(26005)(7416002)(5660300002)(41300700001)(2906002)(36756003)(38100700002)(86362001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aGtKYnhSZ1dyTkF5aW5qL2d1YWtBYTZYQUVBOGtZNkhUdVhBYTh4b1h5OWdn?=
 =?utf-8?B?NncwVEszSWp3MXVlTzFzZFhzcGlVNVRlN3FaaHJnU0FYbHZGb0pEVmhJbW9O?=
 =?utf-8?B?a1hMRTNRdGQwL1NrQXNJeFFpVjFLbEJWRy9PUTgwczlHNUhtT0NKOXJnelFw?=
 =?utf-8?B?S1BnUFpNTlVDNWtYNUo5K2lPTEprUjF3STVJTnZmb0tFVFA3NGZYblJQSUU1?=
 =?utf-8?B?TXRiZ2lCM3FMZ2YvREtPQng1aGpoQ1RSWWNNc2pIY0FSWjRqQVhMRXZSWjUx?=
 =?utf-8?B?WlY5NjMzVkloM0x4cGhSWFR1Q2xvV04zSDRVSmI0MDduNTAwVWdYZ0dOdGxQ?=
 =?utf-8?B?ZEMyYXZJdk14Rmw3ZzNlbnJQa0QxalZ5cnB6OWc2aXA1TmpUMURXcFRyb2I3?=
 =?utf-8?B?TXhFTHdGLzl1SXkxZjRiNytvNklVTS9aVmZEcjIzMVl4S2kyZXNTTHRGc2Zo?=
 =?utf-8?B?ejc4RkR1alpRT3NDT2VwdjNVd21iRUpOZStvUFcxT241cS9DUnUwNkN2RnhJ?=
 =?utf-8?B?Q0hTeGtZUERKaHNCMlNINEdjVE5qWXpVb1FqU0p4dlRWa2JFRlNSSUVBOVBO?=
 =?utf-8?B?Q01wTlN1VXhrQVpML20yVEU4TXo1RDNjeHlCbGZQMEttUHdBdjVWT0RxSE42?=
 =?utf-8?B?NzlIS3F2VHBvNlZqYlRsbHA0MjNEZG1EdGRTYlc3VlpsVmpBZ3NnNWl3WVZS?=
 =?utf-8?B?SEZkZHRNV3dCTFpQUjk2V0Y1elM5SjF6TFVHWDgxZjByMnZTUy9pUGorN2xj?=
 =?utf-8?B?c0dGUGpCV3lmWWRRWC8xbk85aDh1c1ErRkFpUVk1QVBrWXJFY3NMdmgvZm5B?=
 =?utf-8?B?OUk4QU42RUMxUnlCNnQzYTlUVnZWcVhoMEZobGkvUTBRQmxOb0JiVXhwdW1y?=
 =?utf-8?B?UXlMMFhOeHNyOGRYSUdoNitVYVYxUkhIYWFselpNOW9xZEZWcFFtUjI5OFJp?=
 =?utf-8?B?RTZZcUFGQWUvQWU0UktNUVlkZFlxck5qSG9LdzJQcEwxcFFBZm5BWlFBeW40?=
 =?utf-8?B?S1VZMzM0aEFHYUlZUkx0Y3EwdjNWb25ScFZaVGJpYmw2RjYwbnh4bzZEK1c5?=
 =?utf-8?B?MFRablEyUmdTNVIyT2s4dTRDTktnTE0rQVdmbHdGRWt1VE5vR1dSZERuTFk5?=
 =?utf-8?B?VzROSDJwY1VROTVPSXZwUmtmeCs1aHZ1MlpsTmFxL1lNKzZ4ejZmYjZoWnc1?=
 =?utf-8?B?N3g2REIxd1BqUXVHN1NXYk5ubTB5WWN1aERHaTMwV2VnK0R5K1ZqeHRYT1k5?=
 =?utf-8?B?SkVvVi9yRzkrcHBTdnlRVkJod0xFZXZveGRrTmRXU0xvQlpTdFBIVWhaRUgx?=
 =?utf-8?B?MkthYXN0bGxvWG9RK3lveGFpbUpKSHRUWlhObnFEMHJpMC9Gb2RtNWZJWVI1?=
 =?utf-8?B?NG10RHR2SDVrRlUxeS9SeEh3b1hqUHBqYXJxMmtYTTZvK2tqRXJrRFR2RzZL?=
 =?utf-8?B?ckRqUDJoTmg4NlpPdFlwVnZ6cmR3NTdOSEhYQXB5Y2dHWVZwTUVzSEhsdlpM?=
 =?utf-8?B?MG50U1k5TGV0a0N4RXo1WTBEcGExdkFNNmxIS0orTk8vV3AwOU1ZVnhnZjF6?=
 =?utf-8?B?UEJ5eHQrdXdtYW8vVENlZnpSbnY2U3NUckRGU3czSjBtVDV4aUpMWiszRjNu?=
 =?utf-8?B?ajAvL3V5T0dycWpHQlpBbVQxdHgybHJkV3c3NUVHd3FLZHU2TCtjcURSejl4?=
 =?utf-8?B?WThCdndqbncwNDVseXdFTXl2bXk0Z1Q3WWVsSDJPTkx5L2xSOGZmRzU2WTRx?=
 =?utf-8?B?YytMc0lqQW1hcmdDamdkTDZodHBZaFliYXpOMVA1dHZjTno1NEpJS1dQbFZE?=
 =?utf-8?B?aktqa2Z0MDhPdURqNU9KdFlrb1JQalJUQWhvbFRWSXRJUEZReUxnM0RWV293?=
 =?utf-8?B?ZGtTTmo2djJwZjQzTmx0MFNJaGRSU3gxYkwya0J6RXZqZHdaQ2NSK012RzhW?=
 =?utf-8?B?YzdOOXU4UzZibnFyaFJhQlREbWpxMUM4Qlc1SzkrRy8wT0ZkSUlydVRwV3pU?=
 =?utf-8?B?MElNTVFwNHh3VTZJZ29BczNaK0gzaVVyOGNMWktQZFR1Yk9UZVNGV2RaVFRT?=
 =?utf-8?B?Mk1XbnQ0VjdNTlFHWGh1Y3V5Y2QyMjgrYUg1UVF0NC91aS8zcFVXcURCR3g0?=
 =?utf-8?Q?L4JfW/BgisnLy1GGB37a1DV0v?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 80af6f06-263d-4c9a-b561-08dc0cf6b0ca
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB8690.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jan 2024 07:28:05.0412
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RgzTUAvY+G9IZ6e+zkwoKGfrs8PPcp/eurA+ouvUrSrKI1mshTFPBkY78fdRxoInnNZsv1jwn7uaIxYH4Piafg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6385

On Tue, Jan 02, 2024 at 07:52:04PM +0800, Marc-André Lureau wrote:
> Hi
> 
> On Tue, Dec 19, 2023 at 11:55 AM Huang Rui <ray.huang@amd.com> wrote:
> >
> > Introduce a new virgl_gpu_resource data structure and helper functions
> > for virgl. It's used to add new member which is specific for virgl in
> > following patches of blob memory support.
> >
> > Signed-off-by: Huang Rui <ray.huang@amd.com>
> > ---
> >
> > New patch:
> > - Introduce new struct virgl_gpu_resource to store virgl specific members.
> > - Move resource initialization from path "virtio-gpu: Resource UUID" here.
> > - Remove error handling of g_new0, because glib will abort() on OOM.
> > - Set iov and iov_cnt in struct virtio_gpu_simple_resource for all types
> >   of resources.
> >
> >  hw/display/virtio-gpu-virgl.c | 84 ++++++++++++++++++++++++++---------
> >  1 file changed, 64 insertions(+), 20 deletions(-)
> >
> > diff --git a/hw/display/virtio-gpu-virgl.c b/hw/display/virtio-gpu-virgl.c
> > index 5bbc8071b2..faab374336 100644
> > --- a/hw/display/virtio-gpu-virgl.c
> > +++ b/hw/display/virtio-gpu-virgl.c
> > @@ -22,6 +22,23 @@
> >
> >  #include <virglrenderer.h>
> >
> > +struct virgl_gpu_resource {
> > +    struct virtio_gpu_simple_resource res;
> > +};
> > +
> > +static struct virgl_gpu_resource *
> > +virgl_gpu_find_resource(VirtIOGPU *g, uint32_t resource_id)
> > +{
> > +    struct virtio_gpu_simple_resource *res;
> > +
> > +    res = virtio_gpu_find_resource(g, resource_id);
> > +    if (!res) {
> > +        return NULL;
> > +    }
> > +
> > +    return container_of(res, struct virgl_gpu_resource, res);
> > +}
> > +
> >  #if VIRGL_RENDERER_CALLBACKS_VERSION >= 4
> >  static void *
> >  virgl_get_egl_display(G_GNUC_UNUSED void *cookie)
> > @@ -35,11 +52,19 @@ static void virgl_cmd_create_resource_2d(VirtIOGPU *g,
> >  {
> >      struct virtio_gpu_resource_create_2d c2d;
> >      struct virgl_renderer_resource_create_args args;
> > +    struct virgl_gpu_resource *vres;
> >
> >      VIRTIO_GPU_FILL_CMD(c2d);
> >      trace_virtio_gpu_cmd_res_create_2d(c2d.resource_id, c2d.format,
> >                                         c2d.width, c2d.height);
> >
> 
> It should check the resource doesn't already exist (similar to 2d code)
> 

Will add the resource check here in V7.

Thanks,
Ray

> > +    vres = g_new0(struct virgl_gpu_resource, 1);
> > +    vres->res.width = c2d.width;
> > +    vres->res.height = c2d.height;
> > +    vres->res.format = c2d.format;
> > +    vres->res.resource_id = c2d.resource_id;
> > +    QTAILQ_INSERT_HEAD(&g->reslist, &vres->res, next);
> > +
> >      args.handle = c2d.resource_id;
> >      args.target = 2;
> >      args.format = c2d.format;
> > @@ -59,11 +84,19 @@ static void virgl_cmd_create_resource_3d(VirtIOGPU *g,
> >  {
> >      struct virtio_gpu_resource_create_3d c3d;
> >      struct virgl_renderer_resource_create_args args;
> > +    struct virgl_gpu_resource *vres;
> >
> >      VIRTIO_GPU_FILL_CMD(c3d);
> >      trace_virtio_gpu_cmd_res_create_3d(c3d.resource_id, c3d.format,
> >                                         c3d.width, c3d.height, c3d.depth);
> >
> 
> same
> 
> > +    vres = g_new0(struct virgl_gpu_resource, 1);
> > +    vres->res.width = c3d.width;
> > +    vres->res.height = c3d.height;
> > +    vres->res.format = c3d.format;
> > +    vres->res.resource_id = c3d.resource_id;
> > +    QTAILQ_INSERT_HEAD(&g->reslist, &vres->res, next);
> > +
> >      args.handle = c3d.resource_id;
> >      args.target = c3d.target;
> >      args.format = c3d.format;
> > @@ -82,19 +115,23 @@ static void virgl_cmd_resource_unref(VirtIOGPU *g,
> >                                       struct virtio_gpu_ctrl_command *cmd)
> >  {
> >      struct virtio_gpu_resource_unref unref;
> > -    struct iovec *res_iovs = NULL;
> > -    int num_iovs = 0;
> > +    struct virgl_gpu_resource *vres;
> >
> >      VIRTIO_GPU_FILL_CMD(unref);
> >      trace_virtio_gpu_cmd_res_unref(unref.resource_id);
> >
> > -    virgl_renderer_resource_detach_iov(unref.resource_id,
> > -                                       &res_iovs,
> > -                                       &num_iovs);
> > -    if (res_iovs != NULL && num_iovs != 0) {
> > -        virtio_gpu_cleanup_mapping_iov(g, res_iovs, num_iovs);
> > +    vres = virgl_gpu_find_resource(g, unref.resource_id);
> > +    if (!vres) {
> > +        cmd->error = VIRTIO_GPU_RESP_ERR_INVALID_RESOURCE_ID;
> > +        return;
> >      }
> > +
> > +    virgl_renderer_resource_detach_iov(unref.resource_id, NULL, NULL);
> >      virgl_renderer_resource_unref(unref.resource_id);
> > +
> > +    QTAILQ_REMOVE(&g->reslist, &vres->res, next);
> > +    virtio_gpu_cleanup_mapping(g, &vres->res);
> > +    g_free(vres);
> >  }
> >
> >  static void virgl_cmd_context_create(VirtIOGPU *g,
> > @@ -310,44 +347,51 @@ static void virgl_resource_attach_backing(VirtIOGPU *g,
> >                                            struct virtio_gpu_ctrl_command *cmd)
> >  {
> >      struct virtio_gpu_resource_attach_backing att_rb;
> > -    struct iovec *res_iovs;
> > -    uint32_t res_niov;
> > +    struct virgl_gpu_resource *vres;
> >      int ret;
> >
> >      VIRTIO_GPU_FILL_CMD(att_rb);
> >      trace_virtio_gpu_cmd_res_back_attach(att_rb.resource_id);
> >
> > +    vres = virgl_gpu_find_resource(g, att_rb.resource_id);
> > +    if (!vres) {
> > +        cmd->error = VIRTIO_GPU_RESP_ERR_INVALID_RESOURCE_ID;
> > +        return;
> > +    }
> > +
> >      ret = virtio_gpu_create_mapping_iov(g, att_rb.nr_entries, sizeof(att_rb),
> > -                                        cmd, NULL, &res_iovs, &res_niov);
> > +                                        cmd, NULL, &vres->res.iov,
> > +                                        &vres->res.iov_cnt);
> >      if (ret != 0) {
> >          cmd->error = VIRTIO_GPU_RESP_ERR_UNSPEC;
> >          return;
> >      }
> >
> >      ret = virgl_renderer_resource_attach_iov(att_rb.resource_id,
> > -                                             res_iovs, res_niov);
> > +                                             vres->res.iov, vres->res.iov_cnt);
> >
> > -    if (ret != 0)
> > -        virtio_gpu_cleanup_mapping_iov(g, res_iovs, res_niov);
> > +    if (ret != 0) {
> > +        virtio_gpu_cleanup_mapping(g, &vres->res);
> > +    }
> >  }
> >
> >  static void virgl_resource_detach_backing(VirtIOGPU *g,
> >                                            struct virtio_gpu_ctrl_command *cmd)
> >  {
> >      struct virtio_gpu_resource_detach_backing detach_rb;
> > -    struct iovec *res_iovs = NULL;
> > -    int num_iovs = 0;
> > +    struct virgl_gpu_resource *vres;
> >
> >      VIRTIO_GPU_FILL_CMD(detach_rb);
> >      trace_virtio_gpu_cmd_res_back_detach(detach_rb.resource_id);
> >
> > -    virgl_renderer_resource_detach_iov(detach_rb.resource_id,
> > -                                       &res_iovs,
> > -                                       &num_iovs);
> > -    if (res_iovs == NULL || num_iovs == 0) {
> > +    vres = virgl_gpu_find_resource(g, detach_rb.resource_id);
> > +    if (!vres) {
> > +        cmd->error = VIRTIO_GPU_RESP_ERR_INVALID_RESOURCE_ID;
> >          return;
> >      }
> > -    virtio_gpu_cleanup_mapping_iov(g, res_iovs, num_iovs);
> > +
> > +    virgl_renderer_resource_detach_iov(detach_rb.resource_id, NULL, NULL);
> > +    virtio_gpu_cleanup_mapping(g, &vres->res);
> >  }
> >
> >
> > --
> > 2.25.1
> >
> >
> 
> 
> -- 
> Marc-André Lureau

