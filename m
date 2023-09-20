Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 870017A788C
	for <lists+xen-devel@lfdr.de>; Wed, 20 Sep 2023 12:07:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.605496.943075 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qiu6v-0006BA-2R; Wed, 20 Sep 2023 10:07:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 605496.943075; Wed, 20 Sep 2023 10:07:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qiu6u-000685-VP; Wed, 20 Sep 2023 10:07:08 +0000
Received: by outflank-mailman (input) for mailman id 605496;
 Wed, 20 Sep 2023 10:07:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=7N78=FE=amd.com=Ray.Huang@srs-se1.protection.inumbo.net>)
 id 1qiu6t-00067z-A7
 for xen-devel@lists.xenproject.org; Wed, 20 Sep 2023 10:07:07 +0000
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on20624.outbound.protection.outlook.com
 [2a01:111:f400:fe5a::624])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7272a911-579d-11ee-9b0d-b553b5be7939;
 Wed, 20 Sep 2023 12:07:05 +0200 (CEST)
Received: from SJ2PR12MB8690.namprd12.prod.outlook.com (2603:10b6:a03:540::10)
 by DS0PR12MB7995.namprd12.prod.outlook.com (2603:10b6:8:14e::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.28; Wed, 20 Sep
 2023 10:07:00 +0000
Received: from SJ2PR12MB8690.namprd12.prod.outlook.com
 ([fe80::c3b:811:fd1d:c33e]) by SJ2PR12MB8690.namprd12.prod.outlook.com
 ([fe80::c3b:811:fd1d:c33e%6]) with mapi id 15.20.6792.021; Wed, 20 Sep 2023
 10:06:59 +0000
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
X-Inumbo-ID: 7272a911-579d-11ee-9b0d-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dRQMGj0V2TaYhz/z8q6W/UQKt8arS9T3fP5peGE3oq1KLcwaE0b408nFOH2HV4u9nHtjCJKqE77jl9ZZhk76yuIAsmz30n54hITAFg4x8B8ET/ag3QrByHvYITdDjnDXiMD3k36xojSh1C2tZuxe4mT7y8WWb/kCJJEbRaQbMRZjyDk6Fvce/1oPgIB5gflwhkTF9LlnK4IXW6Zybks3qpnSo1/OIqe1BV+Xf6d98V/8Qzif0KHjQr+NM6VP8vAsn1nLrRVKsCcn4Pvy6qV1cxW7HJLEXqvIx8iBuK+3LS3MECydSAKL1G//dHbB+nc7uY+rVYZuyWDcOBVG6RJcYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WG2ShA0TW/uvDFg8Ah3SXBYvGLpB9OARGazeOn9BBik=;
 b=Z7KJkisQYpuXpcq6y2Zp20BIMeZZchlgrlvJ4uk/pDMCLhEyR63RmaettxWHBr/CFBC0jdTFXK9nDWy+CYSIQaHeiDY3tbr8ku7xdxDD/gn6CWh1CTdpi2ppiEbQHLJhBfdKXqfg3Onw7CfTn5lg7Dxs+a6+czxFxEn00I7YTJ3fGe2MQcyhuERa4K2lETxB+yLo6PPBxvxiazcOT/+EJUOC2nMAHSQ1fkKWoQhJNlEL85Lo58HKZbgDPEm2b+ajQDnuGReuxKVz0cqVpRA5NVkV4be9ZNkxGgPsOFJmN5lQMgiunwPQRlj6ds+Pc5YlWBr0sw8oUwmh1gf6Rsxv8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WG2ShA0TW/uvDFg8Ah3SXBYvGLpB9OARGazeOn9BBik=;
 b=JlvoJIYzNTdsAa0oz/hJ9z7nqWi19X5Sc2L9KtwrnGE4DQzluRP50R0MvqDaR+FL4m8X7586zu+/qv4eTDDN+IPrt51dEhK3bKqnPcCU+BuvWXaK5ZrKdZ3Gy4CGpL2jlZNrhmCxGkXJJoC6uMsdhNl4CXgX6pxf6CBSzV+zgS4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Date: Wed, 20 Sep 2023 18:06:32 +0800
From: Huang Rui <ray.huang@amd.com>
To: =?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@gmail.com>
Cc: Gerd Hoffmann <kraxel@redhat.com>,
	"Michael S . Tsirkin" <mst@redhat.com>,
	Akihiko Odaki <akihiko.odaki@daynix.com>,
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
Subject: Re: [QEMU PATCH v5 11/13] virtio-gpu: Support Venus capset
Message-ID: <ZQrEKKHYVMXWFRQj@amd.com>
References: <20230915111130.24064-1-ray.huang@amd.com>
 <20230915111130.24064-12-ray.huang@amd.com>
 <CAJ+F1CJ8R7j_1k3yC2GsdN_v8CsOQ7R+=n_0CCzFW98tWrSLhA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAJ+F1CJ8R7j_1k3yC2GsdN_v8CsOQ7R+=n_0CCzFW98tWrSLhA@mail.gmail.com>
X-ClientProxiedBy: SI2PR01CA0054.apcprd01.prod.exchangelabs.com
 (2603:1096:4:193::22) To SJ2PR12MB8690.namprd12.prod.outlook.com
 (2603:10b6:a03:540::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR12MB8690:EE_|DS0PR12MB7995:EE_
X-MS-Office365-Filtering-Correlation-Id: 6f8c7598-6538-4762-fd13-08dbb9c1544d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	7TFHxc4i7HwA/u/MySC00IIHV6nl1trKRusjt6ixVGrwSGth/jFBR+ropYSXT17RuHZxJmUIhuBvOMA0zLsbGdtuJ83u6jxLjiNtuZu3kkfRT/rn/Gj2Eyk9TjLqz3BxWZkmuXeUrcP763DW6XsWP9CNQDzJxaMcEcqdPDM+o55PLW9vgVzxa6MfxpG9tVT3lx/PyPpedOhGC2Bp7Wq4lsgd1+LyZGRF8ASxoWon7koY7gbrRyxbQZAZOhaRh9uieX/z8idJZGF91sVcelhEOZmJ8chscUPTsotFmIg5avE5KysKnKCWXL30uCMw2MVag+7Yji2XBCZo3N1uZbOfveaYNSn4/4CR/FHmLwyOdHTOZBcaD6EqS7i/uA8Mc9pl3K4bkmu7+uZ4xQFoxVm497geXf5nB0qUv6ip2U0AUvP1280BcZFpooLd90dYc3R+Jt2VEripTNhE1DYv4RsvGyVJmM+8QP/FTt5gQCcapMWoDIpF29GQp7ViprN43nFzWbDSBlg4Zre6AAMGtC5duby4tYH1z8NAa6aMiuKt1jOvjys5ccfBxOydyOgdIXmHROKR2o/cyPgznn0Ap2UHuw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR12MB8690.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(366004)(136003)(376002)(346002)(396003)(1800799009)(186009)(451199024)(478600001)(6506007)(6486002)(53546011)(6666004)(86362001)(36756003)(38100700002)(8676002)(26005)(2906002)(6512007)(83380400001)(8936002)(5660300002)(2616005)(4326008)(966005)(41300700001)(66556008)(54906003)(7416002)(316002)(66946007)(66476007)(6916009);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YisvMDJqUTBOYTQ5ZnlxNkRxSG1OWE1KbDFSVlN1VmFOeWZDc3Z6dEhaSmtJ?=
 =?utf-8?B?cTFwNUF0ZVV6cDJ0Q1Z4UDQ1dGI5dzRDYWg0TUdPNTJZRnF4YzFtLy9VOE9p?=
 =?utf-8?B?ZkhJZ2VDWVRvdjdHL0l3dkpaOXR6akhjY2xtYUdpdVQrd0tIRVhRZk1CUlQy?=
 =?utf-8?B?M1BGekJOVGpoWVRVUUsycDdpYlAzN29ZQUtjaEQvMkc3eUdhYXprNHVMZ2FK?=
 =?utf-8?B?bmpxN2lTdElBMUZhM3JsaTc5bk9LbWxtSnlzbVRvWldDSFovSTlyenFxditH?=
 =?utf-8?B?OE00Ukg0SGtGbGVsejFOc0JsOXIvRlZ2TklERVBqQVBMS21mNStZZ3FPb0Vi?=
 =?utf-8?B?SXZPd3FOSHdGNnErT1RyUFZRdVIzdTBHTjhQdStmTjJUTzI4R1FvWXdBQkdp?=
 =?utf-8?B?QW1EWEorMFJqNXNMWFp3d2FHYzZ4cUh2eGl1RmIyR0ovK3hZbDJkcWlJV08y?=
 =?utf-8?B?V0FUa3ZXeUJKRUdhMjhaeHlmRThOb0NibVlVbzhxeVlhbDYyWTVqQWRQV3Ey?=
 =?utf-8?B?R1dVRVVqY2x0eUhML0tXODNUWkp6UE1ha1o0OXUxeFp1Skw4VWo4Q29KSU5V?=
 =?utf-8?B?V2FvZ2JsUkdHQmNoZUpPMk0yM0Zhbnljd1ZFZnFuVzNnM0xIZkhpcU5BT3E2?=
 =?utf-8?B?Z1lETEsreUNEVk1LZ2xVY1NiZDU3QnBrMlNBZXQvYnZGU3hjSk5pcmFxbS9C?=
 =?utf-8?B?Y09Cd0tybVlmZkhpU0VJTThQaHpVZU1ESjZqRkU4bFJpYWx2YWtyUTVoRWpi?=
 =?utf-8?B?SjNZSnFCK0pLaDRmb1pYS0dwaDJaN1dwZGJqajE1bXRyay90UkFCUkhTWUpw?=
 =?utf-8?B?NDJ0bFR6T0hScWR5VFU3QlpZU2VTQnhucitMTVB5TnlvZ29MOTlWL2ZGZ25z?=
 =?utf-8?B?Mk1nd2pjd0JTQmJjckh1MXByWXcrcjkvUUxDVENiNE5LZ2hKWHh5WHkyWHJO?=
 =?utf-8?B?bCszenBJTVdDbFRIRGFmQVREZmg1QWRibmZkTHlKVjFYNG1aUWxnZFg2dWIx?=
 =?utf-8?B?akU3d3pHK0dKUzlybTdIN1hVanV6c0xqZUY0S3A2ZHVaLzFSbkpSNVlacEth?=
 =?utf-8?B?cXN0UVg4TnZDZ0Y3Z1ZuRHhSTlNqczY2R0J6ZG5wQ3FRQk5oTGhCcW95UEVC?=
 =?utf-8?B?NDh6KzhRenhXV0pvM1Q3UVFzQlhwUWg4OGcxSTlxTVRUbmJwUDhaaUZnc0RE?=
 =?utf-8?B?RHE4azJ6NGNTM1h3dG9vSXVma1ZacTdndTY1UWNpYzBTbFAzckJDOU1vR0Np?=
 =?utf-8?B?NklvUEFUNjRyelc5bklsQW9LeEJqMjdXS0hHN2RMZURhR0V2aFJmRWdWbmNp?=
 =?utf-8?B?aTR5VDY4c25FcFBFcytyeFlqMnBOc29sbHVPYnllbEV6SUhGcExJR0Q2cGlF?=
 =?utf-8?B?Vmd4eGY2L2xLd0kxNzRYamR6eDV3NkUyT1lVZFg5RVJYbzYwUlBJMThLK25J?=
 =?utf-8?B?Zk1NakhWVU0rbW9xcnVjTitqTzF0UEc4cjdDZ1JZOTBXRktqdG83M0NDLzUz?=
 =?utf-8?B?cTk2RndTeGt2MEdxRkFNOUJyN3N0NGNyNG4vR0F6dkNqbWhLUzJVR1hYUk4z?=
 =?utf-8?B?WmdsMi9EcjhwK3NMaGFWTmhzaTRhRk1rSHNuMmE0NXJoZ0JDdU9SRG5kajk2?=
 =?utf-8?B?YlhxL21kbUZSZy81MjlWRzNHR2JvcTRYbDlRZENaZkJJd2p0SlQyY1hTVWpU?=
 =?utf-8?B?NWdFd1lwVDJNQU9kMVZrNTRxRGthM2Z6VWp4T210dnJIdGxjd2NPOGUxZHF1?=
 =?utf-8?B?TGpFRy9rQ1B2S2pEVm9XeVpwY25vUU01cWMvSk5vR25URExjZEVTRTVBN3R2?=
 =?utf-8?B?S25wN0psRmgvNG9iMS9NMithdlhCUVRXNjgyOVYyUnpiOU5PWUpIOFJGQ2xL?=
 =?utf-8?B?cUZEMVlGeUtIU0N6c1ZqZVhpajB5bWFGNHowaFIya3JDTjRjZ3RWZnRHaGs1?=
 =?utf-8?B?blZQM0EzcnhLRDJnK0tCbXU3dklRU3p5elBpNjVDcjM3dXFzRkNVcUg1ZFlu?=
 =?utf-8?B?K2pla21zRkp0V3NYK1pGWGZqK1VnV28wTGZ2YWpQSWIzUys4bEZjODZucDhJ?=
 =?utf-8?B?a0dGcnJtN2RrZStnKzNQVVZXVDhnb3ZtUGd4ZXlvTHhtc2RDZWNXcFZPYkVJ?=
 =?utf-8?Q?PuLAWOTH1VON7AgERPAD4fpAF?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f8c7598-6538-4762-fd13-08dbb9c1544d
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB8690.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Sep 2023 10:06:59.8907
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ajXqokqYqYoAjlQ5zeXn7Lq+2qmePy3fFUqmK2ohcFE7vnNrK7R+5LovX8StBaR2poGKLSTgnG7gbvvtKoC5Yg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7995

On Tue, Sep 19, 2023 at 05:02:36PM +0800, Marc-André Lureau wrote:
> Hi
> 
> On Fri, Sep 15, 2023 at 3:14 PM Huang Rui <ray.huang@amd.com> wrote:
> >
> > From: Antonio Caggiano <antonio.caggiano@collabora.com>
> >
> > Add support for the Venus capset, which enables Vulkan support through
> > the Venus Vulkan driver for virtio-gpu.
> >
> > Signed-off-by: Antonio Caggiano <antonio.caggiano@collabora.com>
> > Signed-off-by: Huang Rui <ray.huang@amd.com>
> > ---
> >
> > V4 -> V5:
> >     - Send kernel patch to define VIRTIO_GPU_CAPSET_VENUS and will use
> >       another patch to sync up linux headers. (Akihiko)
> >     - https://lore.kernel.org/lkml/20230915105918.3763061-1-ray.huang@amd.com/
> 
> Ok but in the meantime, you should have that header update patch in
> the series too, otherwise we can't compile it :)
> 

In fact, it's in my repo. :-)
I am waiting for it to be merged into kernel mainline and then update the
commit id.

https://gitlab.freedesktop.org/rui/qemu-xen/-/commit/4ae9d078f9242890769c98162caf32f95df42529

I will include it in next series.

Thanks,
Ray

> thanks
> 
> >
> >  hw/display/virtio-gpu-virgl.c | 21 +++++++++++++++++----
> >  1 file changed, 17 insertions(+), 4 deletions(-)
> >
> > diff --git a/hw/display/virtio-gpu-virgl.c b/hw/display/virtio-gpu-virgl.c
> > index 8a017dbeb4..7f95490e90 100644
> > --- a/hw/display/virtio-gpu-virgl.c
> > +++ b/hw/display/virtio-gpu-virgl.c
> > @@ -437,6 +437,11 @@ static void virgl_cmd_get_capset_info(VirtIOGPU *g,
> >          virgl_renderer_get_cap_set(resp.capset_id,
> >                                     &resp.capset_max_version,
> >                                     &resp.capset_max_size);
> > +    } else if (info.capset_index == 2) {
> > +        resp.capset_id = VIRTIO_GPU_CAPSET_VENUS;
> > +        virgl_renderer_get_cap_set(resp.capset_id,
> > +                                   &resp.capset_max_version,
> > +                                   &resp.capset_max_size);
> >      } else {
> >          resp.capset_max_version = 0;
> >          resp.capset_max_size = 0;
> > @@ -901,10 +906,18 @@ int virtio_gpu_virgl_init(VirtIOGPU *g)
> >
> >  int virtio_gpu_virgl_get_num_capsets(VirtIOGPU *g)
> >  {
> > -    uint32_t capset2_max_ver, capset2_max_size;
> > +    uint32_t capset2_max_ver, capset2_max_size, num_capsets;
> > +    num_capsets = 1;
> > +
> >      virgl_renderer_get_cap_set(VIRTIO_GPU_CAPSET_VIRGL2,
> > -                              &capset2_max_ver,
> > -                              &capset2_max_size);
> > +                               &capset2_max_ver,
> > +                               &capset2_max_size);
> > +    num_capsets += capset2_max_ver ? 1 : 0;
> > +
> > +    virgl_renderer_get_cap_set(VIRTIO_GPU_CAPSET_VENUS,
> > +                               &capset2_max_ver,
> > +                               &capset2_max_size);
> > +    num_capsets += capset2_max_size ? 1 : 0;
> >
> > -    return capset2_max_ver ? 2 : 1;
> > +    return num_capsets;
> >  }
> > --
> > 2.34.1
> >
> >
> 
> 
> -- 
> Marc-André Lureau

