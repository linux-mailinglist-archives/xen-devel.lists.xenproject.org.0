Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8597B860DBF
	for <lists+xen-devel@lfdr.de>; Fri, 23 Feb 2024 10:16:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.684694.1064715 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rdRfD-0002UG-8G; Fri, 23 Feb 2024 09:16:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 684694.1064715; Fri, 23 Feb 2024 09:16:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rdRfD-0002Rn-54; Fri, 23 Feb 2024 09:16:15 +0000
Received: by outflank-mailman (input) for mailman id 684694;
 Fri, 23 Feb 2024 09:16:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=oqZf=KA=amd.com=Ray.Huang@srs-se1.protection.inumbo.net>)
 id 1rdRfC-0002Rh-Bx
 for xen-devel@lists.xenproject.org; Fri, 23 Feb 2024 09:16:14 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on20609.outbound.protection.outlook.com
 [2a01:111:f400:7e88::609])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2f59b811-d22c-11ee-98f5-efadbce2ee36;
 Fri, 23 Feb 2024 10:16:12 +0100 (CET)
Received: from SJ2PR12MB8690.namprd12.prod.outlook.com (2603:10b6:a03:540::10)
 by PH7PR12MB7965.namprd12.prod.outlook.com (2603:10b6:510:270::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7316.23; Fri, 23 Feb
 2024 09:16:07 +0000
Received: from SJ2PR12MB8690.namprd12.prod.outlook.com
 ([fe80::e7a:5022:4b7d:ade1]) by SJ2PR12MB8690.namprd12.prod.outlook.com
 ([fe80::e7a:5022:4b7d:ade1%6]) with mapi id 15.20.7316.023; Fri, 23 Feb 2024
 09:16:07 +0000
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
X-Inumbo-ID: 2f59b811-d22c-11ee-98f5-efadbce2ee36
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=naU1w/LOtv2UFE9wqpEegdkxZCmy4GjGOn+E4gHxTLvgVCWa1vko7u7HJcAnkL7/nnd5766U+0xuOLSPb86I1YSu41+uamk1i6XhO+H15XQy+PSHljZ8YodDt1+NslYVrzwfWtxT5d9tZ0BwNeVBHXz93JkhTBEawiYMwT7ckGMvZ62vefs7+Ix755KB3r25KmEm+LEMavegnD1I0DxfjkfcWS+sF9Z2PnR3JTxH9fO0g3YdUjJ/SBhPh7WOotEnL9SFa6Cy3lRW2ngFzBj0Jjte5Z//canJTylAJV1tSjSxbMs8wP35UxfXkqBd7Go2GGQBsnw5Iu/aBpubdbER2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W0+q/t21RIbG/uUyv0SqG41fSql+NgSoPURFOny8XXs=;
 b=dtms5A4mVOhqIbrgc5IVWFRyQIV5k9dAv4n17mY6nZeE9ltpkDSz7MTEYrIxNzi17dI9n8XntdjV2XS3MiQdp0jjeB/KBGnfLE/wI6o3Ym677Pif6P9pO1oVfGdt8bRW+N3cLfzRfTB6YsMSXSluHdQxCg2AZPz93FxQdpFoq58g/6lbSSkwHoVVAzvPNXtwtp9qyepMnK3w0VYLaHJ7ynN70bJW4rD3iIh8rR0WwxA27sZuvjWxBiSbtUPEhZR2Gk68+xFKfJsZ0qwfu5JTGLKLfjRhvQJ5o+zF0Hu7VYdbVX6iYUZwYw6tYLDfgrQPHv9IjrWrUreJewfiJZB8sw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W0+q/t21RIbG/uUyv0SqG41fSql+NgSoPURFOny8XXs=;
 b=EsHBZc0Rr4QVBUpUHLVF4CRUhH83yls80a4Or8fqhxsLDai2aiTtg6jtWi3yXHshVVmOQzWntMvtFK6EVCf19h4tH2iMh+5yQjWvajVYXa6CnbvtWq0iD8bkiElVOASGhTWegLTDM01jPo9BAx4OHh5xHxrhJH6xRORZl4lq8Q4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Date: Fri, 23 Feb 2024 17:15:39 +0800
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
	"Chen, Jiqian" <Jiqian.Chen@amd.com>,
	Antonio Caggiano <antonio.caggiano@collabora.com>
Subject: Re: [PATCH v6 10/11] virtio-gpu: Initialize Venus
Message-ID: <ZdhiO0ZEZS9lmAeo@amd.com>
References: <20231219075320.165227-1-ray.huang@amd.com>
 <20231219075320.165227-11-ray.huang@amd.com>
 <CAJ+F1C+gQ7kwAD=Tv7uAgKtgA57wPkZcE_zadAogtMUEFUmFnQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAJ+F1C+gQ7kwAD=Tv7uAgKtgA57wPkZcE_zadAogtMUEFUmFnQ@mail.gmail.com>
X-ClientProxiedBy: TYCPR01CA0008.jpnprd01.prod.outlook.com (2603:1096:405::20)
 To MW6PR12MB8706.namprd12.prod.outlook.com (2603:10b6:303:249::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR12MB8690:EE_|PH7PR12MB7965:EE_
X-MS-Office365-Filtering-Correlation-Id: b6889da4-d0ed-4de0-a4c3-08dc345010f7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	t7mbcuid9WlPnW7brOrlUs3lPfeKGAnixyeM1EHfgESV/c7Yhi8HHgTLuQXKwshb0t6PFdNqqS52DphgBq8hj0gZLbJD/aaXEYzJgzt1sJyDsoCGr946ZmGv7SZneW/zo3p/A7WujYcRz/h/70+r9oy65Gz5ikkXDGY5MgqSRLFW5B/982Y0BGXyAZlOXJRCktv0/9WXyVrIh0Za2qWbtC72I/89+6VnauKzy5QeqII3f+LB/hFmVDTTrPJS2xgXdUlBe5zpHp9yYCZMcdwu11XC4zmZRrUZQG5oVrLXbtO3/yQ35bAkQtuPOaI63gD8/6Aq2HoIeTHfAE4wziQaaROIEJVkPjYlJx7yKTCAzhMuA9Y8sXZMbM+GkAZG5j8DJAKI6osTM8ET7z7kWbzjw8ELFzC/SXa/kBz5B/56bHcj+6V3mbYQZ7ph4de6hsdvErnQsnoCTlURXXvGZ6v6lnhCPeXMrEdyz8Rt6qRYtjuu1q3SQASndwTK0cmc/QvWgwnlUSjah8ftjlqyW3gg1eCxKfuf1o8ntkKJ1yseH9U=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR12MB8690.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?c1pJUExlR1lOMnJhK3Z5YjVMWXdxYnlzTzVQVEdObHdleXRZN0tnZFFQb1Vo?=
 =?utf-8?B?ZHJRSEpENDQ2b2grU0JYQUZ5VEErekpsbDUxbVNTdCtQRGRJb2lCcTZncldW?=
 =?utf-8?B?UDVacnZvYnBtVkRScU8zL0QvZWlPdjZ4ZzlSMVF2MG94NFFudXYwWXdDUGdq?=
 =?utf-8?B?WkVacFhkbU4vdW5FV1Z4MUdSaHVTaHJjSGl2S3cvb3RLK2JJTm5WZXgzV3pY?=
 =?utf-8?B?V1BLeHhQK0M4RXdDL3BzS0dGa2FySU9yVVlBbVhLc0t4cUE2VGRwbGRGZFhP?=
 =?utf-8?B?aUsxSlBYamdUU25XQUFLM2ZSeDVRWklLN3RHU2t5NWp4NjdMNjdjQkFpemVw?=
 =?utf-8?B?YVdJSjhXSE4rQnF4ai8zZ2lvMnJaSFNaK1RYeEs5NUtVU0g1M2JzeUpRVktk?=
 =?utf-8?B?RmUvZ3V0SkJTNmxBU0hYSThKYTIwaGllWWFScEpWUExyWDZhUHJqZTk2U0o3?=
 =?utf-8?B?eTlSQlA5NmlWb20zdlpLV05qUVdEa2FJbUY3dUNzOHZaeVdpTWE2S2Q4NTYy?=
 =?utf-8?B?U0NYa3JHTlM2MFpUQi9WbFcydHRFSlBIaTNlYm5LL3ZNTDVRMDdrTkkrK1Bj?=
 =?utf-8?B?VUFDOGFxanJyT0R5YVFaQjVMSkdnbnprKzd6OGEySWFlaXAyeVI5SDN4UzZs?=
 =?utf-8?B?MzdtRUtJeVlqTGppdGZTUDdSdXZOblgrZnZvamU3STA4czdzc3kwVzVhd1Qv?=
 =?utf-8?B?ZHdmWlYrUTdoQjIwRjgvYWFJK3lZdk52Y2hQUmJBbndQcmlQbDF5MHh2azBk?=
 =?utf-8?B?M0pqL0xuOEYvQ09DVGp1azc4RW5RbjNiYlFnNkFWN3EwM2p6Y1NyaUVMNDlM?=
 =?utf-8?B?bDg0YVEwdDkrWHRsU2NTbE9YNFpjTXBweG1oR0JrdnRpaCtOQm1EbHBMcUFC?=
 =?utf-8?B?Y0NBay9rdG1EN2Vuem93aDRKRm5hcmtBY0t3YTFabk5PTHVzc0ora2pBZFFX?=
 =?utf-8?B?MUUvUWh6VXJJVjhNMWRVZ3c2N3N2cmJiQzBFejJZQzJDRlpVNy9nN0xuaFpV?=
 =?utf-8?B?RVg1ekdYSmRRSjNkNC9SQm1wTnRCZFd0ZHdtc0I0ZSt4cVlkcTVhNnFQMHIr?=
 =?utf-8?B?NEpYR0tFUjZwRmZpb252YTQ2UGVVdWYzQ0FiSER0SEpGY29vc1l2U1JDMUZV?=
 =?utf-8?B?N2lyL3VJSmxYZHIwbUZqalF3NldaazVlajFLRmxlZFF1YmJOK1dpMS9mV0JB?=
 =?utf-8?B?YnIxYXBtd0dYZkJHeTI5ZFN4aDhTTEQ1cWFTWmFUT3hxcHRZZUNyMUpwWHBj?=
 =?utf-8?B?cVhkZHdTUlJlWFMrZGx4aHZVbUMzTHpFRVdGRHhZdEJ6QW1nTWF1djJBWEwx?=
 =?utf-8?B?eDJNblFtSU1KQzNqaDJxZ0pTODV0ZUE2ZWo4N293Z21aZ2IxcS9TaXZ1eVJM?=
 =?utf-8?B?WVFONy9aMFFrQWRBR1diN3hBcjRHclh5RkhjVDJqcG1HOTV5QVlSREZVVW1k?=
 =?utf-8?B?amh6S2pRc2p4cTdEb2RLS3BmdW1ZTE9hQU9RODlRU1VaMFpQRi9OdW1JcGQy?=
 =?utf-8?B?eFdVSVk3Y3REQjNvNXhJd3lUYUJLRldqVTdzVDMzemppS000WWZjTEF2b05C?=
 =?utf-8?B?WU9qZnlQUmhBT0xlU2Q2d2NUZzlJSy95Ylc4NG4yVXdQY3ZNNUZjZEErdGN3?=
 =?utf-8?B?eEF5OWpnWDZ4MUhZS0dnbWl5cHA1UXViUFlwUG9pRTVrNkE1bjBuOG9UbnlL?=
 =?utf-8?B?MjgwVnViU1kvR2NPQmZZb1c4MFVCMCswdnlqVkdkeUZOV1cwSEt1SGF2bExQ?=
 =?utf-8?B?UWJUTGxGNUVTL1gybjRJaVR0bmFsejFDUWM2YTJmWHUzdmxFVXFCN04yZjhq?=
 =?utf-8?B?d1ROOUhJMmNLV2tZWFJJNVBKRUZDRVZZazNuU1ZmMUxzbkFYTm5CN0huZ0cr?=
 =?utf-8?B?bjZjbEhMWC92eGp0dytBT1FLSmp0THRoWm1HczlNZnoyZm50YWl6aFJsand0?=
 =?utf-8?B?TndjNTYyd1d4WS9WRFJ1MFlDOFBOTWRLcHIxSDkza1ArWFNJbXQ5OGYreFI3?=
 =?utf-8?B?Z0tVdE1XUEZwQUNqTTgxUG42QmZWRXdXVUg0SFNGZGt0cUd2K3ovaTJoY3Js?=
 =?utf-8?B?QmNTd2I2R3JTNzNxcTFLVnhicmNtaTRPSWJ3Nzg2Q2RFMUs4Zy9zQUhPS0to?=
 =?utf-8?Q?u8zWHl+vAP6Lz++Fu8h/LIbth?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b6889da4-d0ed-4de0-a4c3-08dc345010f7
X-MS-Exchange-CrossTenant-AuthSource: MW6PR12MB8706.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Feb 2024 09:16:07.5265
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kmsU6z2T6VGF017LkW8lo0OOVv+4BUBUoEn6a14yQNL4jbWby9ILjHN/YVfhyDPhzwgLUrVnoVu3M9A7bthctQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7965

On Tue, Jan 02, 2024 at 09:33:11PM +0800, Marc-André Lureau wrote:
> Hi
> 
> On Tue, Dec 19, 2023 at 11:55 AM Huang Rui <ray.huang@amd.com> wrote:
> >
> > From: Antonio Caggiano <antonio.caggiano@collabora.com>
> >
> > Request Venus when initializing VirGL.
> >
> > Signed-off-by: Antonio Caggiano <antonio.caggiano@collabora.com>
> > Signed-off-by: Huang Rui <ray.huang@amd.com>
> > ---
> >
> > Changes in v6:
> > - Remove the unstable API flags check because virglrenderer is already 1.0.
> > - Squash the render server flag support into "Initialize Venus".
> >
> >  hw/display/virtio-gpu-virgl.c | 4 ++++
> >  1 file changed, 4 insertions(+)
> >
> > diff --git a/hw/display/virtio-gpu-virgl.c b/hw/display/virtio-gpu-virgl.c
> > index f35a751824..c523a6717a 100644
> > --- a/hw/display/virtio-gpu-virgl.c
> > +++ b/hw/display/virtio-gpu-virgl.c
> > @@ -964,6 +964,10 @@ int virtio_gpu_virgl_init(VirtIOGPU *g)
> >      }
> >  #endif
> >
> > +#ifdef VIRGL_RENDERER_VENUS
> > +    flags |= VIRGL_RENDERER_VENUS | VIRGL_RENDERER_RENDER_SERVER;
> > +#endif
> > +
> 
> I wonder if it's a good idea to initialize venus by default. It
> doesn't seem to require vulkan during initialization, but this may
> evolve. Make it optional?
> 

I am fine. In fact, vulkan is widely used for graphic area such as gaming,
compute, VR/AR, etc.

Thanks,
Ray

> >      ret = virgl_renderer_init(g, flags, &virtio_gpu_3d_cbs);
> >      if (ret != 0) {
> >          error_report("virgl could not be initialized: %d", ret);
> > --
> > 2.25.1
> >
> 
> 
> -- 
> Marc-André Lureau

