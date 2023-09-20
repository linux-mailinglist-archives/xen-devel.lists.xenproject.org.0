Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 64FC07A7543
	for <lists+xen-devel@lfdr.de>; Wed, 20 Sep 2023 10:06:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.605231.942828 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qisD5-00020o-1d; Wed, 20 Sep 2023 08:05:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 605231.942828; Wed, 20 Sep 2023 08:05:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qisD4-0001yf-U2; Wed, 20 Sep 2023 08:05:22 +0000
Received: by outflank-mailman (input) for mailman id 605231;
 Wed, 20 Sep 2023 08:05:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=7N78=FE=amd.com=Ray.Huang@srs-se1.protection.inumbo.net>)
 id 1qisD3-0001wb-7T
 for xen-devel@lists.xenproject.org; Wed, 20 Sep 2023 08:05:21 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20611.outbound.protection.outlook.com
 [2a01:111:f400:7e89::611])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 70811274-578c-11ee-8789-cb3800f73035;
 Wed, 20 Sep 2023 10:05:20 +0200 (CEST)
Received: from SJ2PR12MB8690.namprd12.prod.outlook.com (2603:10b6:a03:540::10)
 by MN0PR12MB5857.namprd12.prod.outlook.com (2603:10b6:208:378::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.28; Wed, 20 Sep
 2023 08:05:14 +0000
Received: from SJ2PR12MB8690.namprd12.prod.outlook.com
 ([fe80::c3b:811:fd1d:c33e]) by SJ2PR12MB8690.namprd12.prod.outlook.com
 ([fe80::c3b:811:fd1d:c33e%6]) with mapi id 15.20.6792.021; Wed, 20 Sep 2023
 08:05:13 +0000
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
X-Inumbo-ID: 70811274-578c-11ee-8789-cb3800f73035
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dVcOyn0YPOsg9O097dxS/TXYKb0HCvJRRTiCAzTNblL9P4JBjE8JL+XYslU7VRXgDdM9kJvIZW7b2QcrksDhZXKcPnqZWRswm8AUjLwScmuTjf+2Q+vFW4WBK1Vj5IAUY1cfPuIzJ7AqUIrWLZ8wA5OsdPBcAs3xJI22vLb8n97pvxX8OqDWHX4Sfh5aXHq4xs9nurrBUJlF+xmk0szICJwxGcr8lwa2NK1yVIDMgy7RC7xhoD8ub1iRZetym8tBuJhGojkqdvSU0Ksf87WenoeQ4ay+BddcTdCHhoGojjlMFZeKSekYkuvqkWL1jliGj+E5L8oKQJw5u8z5cLNfjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Lc1mPKgHSrEnW8uCDILbkS1PUINl6k97rGjvS0guXbI=;
 b=HQ3ZWoa6LX5S8ynxBIxT2hFg8VVdPgVu0EgoYFzOYEq7IgCxGZriK11MAoOpGvF7qyJB4ZeugSCy9XR8LTFLZqEWtOZinSJAQBrQtrajH6dEzJYrzpau4WLhFwoe3Ylp+AXGrKBZwH7NO1z9SyfkUbvsDYWrGoRV6PsMzfupJSiJJ9nPcNaMfDTO928KjmTcmeUB+lqJ5MSR2XiSknOVJ6kGGfywveG5Su30IgbtZH3vPwKBpuWFn2jimCZYDtFrbw4kz3gGgX81gcVQ9b+jloW3N91QY6HxD0XKmj9qOh/wQryd8nMCRw7eGIqVOaNoBrvpQF85WLIACjCtmBUERg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Lc1mPKgHSrEnW8uCDILbkS1PUINl6k97rGjvS0guXbI=;
 b=zN1XCg7SFQ8uAEiBhfByHjC8+J09ebne6VqxMj2X+CaUsRhOj3siGl+UTz6AF+C1JnMq8yLnS4RycFDn4Y2EKRjsXqFy4c9SycTAGSyc45sftaOgpO65Yuwq1Yv02SmKgngMYJviCbSzn5I5fhFdx7gGFUEbtf/MEFJWJcFLDuw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Date: Wed, 20 Sep 2023 16:04:39 +0800
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
Subject: Re: [QEMU PATCH v5 05/13] virtio-gpu: Configure context init for
 virglrenderer
Message-ID: <ZQqnl7tXDWaGcOcf@amd.com>
References: <20230915111130.24064-1-ray.huang@amd.com>
 <20230915111130.24064-6-ray.huang@amd.com>
 <CAJ+F1CK6_vDhh_=2kvHXkba8HYTvTuCP9ov-xW9EJ76SB4toWQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAJ+F1CK6_vDhh_=2kvHXkba8HYTvTuCP9ov-xW9EJ76SB4toWQ@mail.gmail.com>
X-ClientProxiedBy: SG2PR04CA0191.apcprd04.prod.outlook.com
 (2603:1096:4:14::29) To SJ2PR12MB8690.namprd12.prod.outlook.com
 (2603:10b6:a03:540::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR12MB8690:EE_|MN0PR12MB5857:EE_
X-MS-Office365-Filtering-Correlation-Id: c0301cf2-d471-4416-c45e-08dbb9b05192
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	C3uLZLW5MihmSblvNoWLd8uSxjYUdJKMNnt6HyForEpF58vz1r2Jvl+YBZsJbwiY29gcUS9VgMMbvHW4tU+Y3RFUB/QPLEu+4qrCRz4KveOPiMjvKbWE18wm0EJrPDmCNmA0/WgZti/Q+N6rAG/QTfKRxs3UDPjeiy9PHRy/vA4ud/I+XtTil/0ms3whftzUcz+wnuX5L/e41EQ+2DJf1cT7hDuFCZPbsv12IMnP7/IrJYRv3e0g6vOV27doSDpsF+Xj0zqbJP2sQPXOc9+hF4rXwKpa/WNxS3IFRIiMWfx5pUBws96SzHK/rBEjZV/R92SH+dkA2nf8Rzkc9GTNL817GEamW/XpXKPg7JTIC3cIsN/w6em332o/dNXs02HcWIYzfPEJ/sQ0CVJkkEosAIkPxq0YVDxC/uPoH/gmlYBYBa0sdGJ+t1hOhbScpSizJmk6KTXBOTDh4Tu7MhJyDvOcm9gbFEVqhllqwkt/8WoU8u36rdnErgrUhf42VRcNxnUuoeVontA9z5pQQiBx8/jdt4kUoxFmsT2QrZbBtCJgrlb3hx3H8GijxIrMcvjO
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR12MB8690.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(396003)(136003)(346002)(39860400002)(366004)(1800799009)(186009)(451199024)(6506007)(53546011)(6486002)(6666004)(6512007)(478600001)(83380400001)(26005)(4326008)(2616005)(2906002)(6916009)(66476007)(66556008)(54906003)(316002)(66946007)(5660300002)(8676002)(8936002)(41300700001)(7416002)(38100700002)(36756003)(86362001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MmNzTWNtRnNlOWZDR0dZYjZ5cmhxSkN1ME5uZ0JHUU9lUWJCeEVyUTl4b21F?=
 =?utf-8?B?SzA1WVJKbHdjK2N0b2ZZSU0wcWFyMDhIV1VRUzNKbnF2aFR1K25BRytacUhF?=
 =?utf-8?B?cHgxL1Nnelk3K3h3ejBxUnNWcVpXQTY2aWRTb3ZJbjNIWVkxbUhFV2p4aUFx?=
 =?utf-8?B?bVN0NkVKazRMLzlYeFBuNEVDa3B1bkpXSVlpTjlGbTUxdCtESWpMV2tKNGtk?=
 =?utf-8?B?NmlsNVBrQlhPdUJTbUE4bktkdzJPOTRxdnpleFZlOXV0aC9OSGVCTGhsY3Rr?=
 =?utf-8?B?OVJnNHREaHNPdXYxSE5pSkFyN0kwbExQdU1icWprTksyVklsN2FtV2ZYTkhw?=
 =?utf-8?B?eGlaSVNFQ0JPK3ZPU2pJTUJzQysyZGQrMjhraEUyVnkxZyt2WmZrdmlVTEY1?=
 =?utf-8?B?UUpkNHhieit0ekQ0cHpadTN5UEN0alVaNGEwL2gyMlVMRmNpY3lGYUtobXBY?=
 =?utf-8?B?QUlWdkZlRXBXSFZHQld5eWZHTnlORTR2M0N3clcvK1JITjRpUFp2ZmpIaTZJ?=
 =?utf-8?B?andLOGIrQmRCU044UU1yM0ZZaWxxUkxDU3ZvK2xkanExdVM2Q1ptbmZGVzVq?=
 =?utf-8?B?QmRPYlE2VUsvNUV5WXNZNUZnWXBwTllabnI3amNuUytVNFVzSjdrRXRhQWVm?=
 =?utf-8?B?OTJoSlFXM25tTmFmUGxsY21ObXZ3UWJCVTUyRm9hVWh0SGZUZThwY2R2TVR6?=
 =?utf-8?B?SmVHVk0xRUg2YTVkWHBVNVFCNE9Td3JQT0RsZ1lrSlEvQmhrYlRJRElpMEMv?=
 =?utf-8?B?bkd3dDA3Y2JWQzBEUml0US9qSkdwTUl1R2lxS3kzSHF3eEswN056bmFpc0tI?=
 =?utf-8?B?YUhBeGhwTW9OMVgzMllMaGc0Nnp4b3RWVy9sRjBkeXhWZitIbUNLSEZ6MFdh?=
 =?utf-8?B?Y1kySEppaUJVekNjcjRRQ2NWM3diRW1oYXRFeHRncFA4bHcxbXlObitSbXdV?=
 =?utf-8?B?a3oxRDUyZlNqanROejJmSStjRlZpOVdXV3AxcEMvbkZwUWQ2UDQ4SFhGNEla?=
 =?utf-8?B?N3BxNytLdFA3b2p3L1BjNUJoWitzcWVQdDdDc1FLdm1wZTBnVDJReXpPNm5V?=
 =?utf-8?B?SGhua3BSRXpwYmFLRmRwLzVmTDE4MUErWWFkeks2c3Aza1dVQnUvdmpqU0Vi?=
 =?utf-8?B?aE9wZHN4dFNRT29pMGtZOVpUc3N6cjlNa1l0YThPa1dwb2FpZWZwZW9qS1Nh?=
 =?utf-8?B?TzNtZDlpSUZkb3AvanJYSi9BcFpUYndmdzBmbEtpTXV1U3hLSUxNZDMrMHpE?=
 =?utf-8?B?M25OVnV2Y3IrN05HRFhTcGNKM1hYWTF1QWxIRU9GV3lsOXRDb0lhSUlYaWFr?=
 =?utf-8?B?UFJ0dGNDUVRVRjZZR09UaTJhWktWUi9sNW83RUQvWFAvYVk1TU44dnNqQkpy?=
 =?utf-8?B?Y1RONmlzNGxFdm0weVdISmxxRFQxbWs1enJJdjhxOWUwbzQ4SzFLK0ttMi9j?=
 =?utf-8?B?bWl5QlcvUkZsc1BqaTBUWEkvS1RPdU5DMGN0NDFOamwxYktjaVFpcHBCbHRE?=
 =?utf-8?B?eTlrQU5tdHNySXV6dWFYc3NpTzBtSGVZVlovSzNIWkY1ZGNoMXc0VHBjUXBE?=
 =?utf-8?B?TTBGemNnem1hNWhYa21WNldSQThZRFBVbG5GZnBqTGlkM20rMTlQWlBjV3p1?=
 =?utf-8?B?cFZETDBMWGs5blJ6YnRGQks5bUU5c0phcXNPL2lXZlI0bEx1TTZOTU9ZZ2xE?=
 =?utf-8?B?d3JqQ0VDOHA5bldKa0owczdzZ0wwOXIvajJFUUJhSnlnbnhldVM3ODQzcVJv?=
 =?utf-8?B?YzVHblcwZzgrSTRJdTkwTksyYVI4NkxHcmhvK2tEMUxaYm9PWGJYdkdKejVz?=
 =?utf-8?B?RzczeVRlSkxZYWVxMEE2cG8ybGlYWTdSNHp4dHU1UGpUUWdsc1FkR2hoajFv?=
 =?utf-8?B?S3orY1Y5TkVGbE1hUTZ3S0wzOVFJV0o5a3BZUzVJZWZCR1pMRXo0aFByK3d4?=
 =?utf-8?B?QmY0b3FTbXhRNnAyZUloazdMQVJadXdLTTNKam9RcEZEMGZvZEJwdjgvZXY5?=
 =?utf-8?B?NFVOejc4dGRNdjRadHpsUjV4UTYyZEZ6OHBCazZ1YjVGbDdkMlN4RGhERHJY?=
 =?utf-8?B?TWo2UHM3ZnRjOFpPUzNva1NQRnd2VXl3N1VxR21xMHQ2K0JiN3Z3ZTRFdW9K?=
 =?utf-8?Q?9AJLqq7BTPbmydKF0A1xPM5ko?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c0301cf2-d471-4416-c45e-08dbb9b05192
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB8690.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Sep 2023 08:05:13.8376
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mGnIB0yUL8N1lAg1iIEg2wPLbkfgcCwa/Xrm/CXAAkKQiPq51UZqN087i3w00RFQzBmD0mxc6KZccU43nIxxMA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB5857

On Tue, Sep 19, 2023 at 04:17:43PM +0800, Marc-André Lureau wrote:
> Hi
> 
> On Fri, Sep 15, 2023 at 6:16 PM Huang Rui <ray.huang@amd.com> wrote:
> >
> > Configure context init feature flag for virglrenderer.
> >
> > Originally-by: Antonio Caggiano <antonio.caggiano@collabora.com>
> > Signed-off-by: Huang Rui <ray.huang@amd.com>
> > ---
> >
> > V4 -> V5:
> >     - Inverted patch 5 and 6 because we should configure
> >       HAVE_VIRGL_CONTEXT_INIT firstly. (Philippe)
> >
> >  meson.build | 4 ++++
> >  1 file changed, 4 insertions(+)
> >
> > diff --git a/meson.build b/meson.build
> > index 98e68ef0b1..ff20d3c249 100644
> > --- a/meson.build
> > +++ b/meson.build
> > @@ -1068,6 +1068,10 @@ if not get_option('virglrenderer').auto() or have_system or have_vhost_user_gpu
> >                                         prefix: '#include <virglrenderer.h>',
> >                                         dependencies: virgl))
> >    endif
> > +  config_host_data.set('HAVE_VIRGL_CONTEXT_INIT',
> > +                       cc.has_function('virgl_renderer_context_create_with_flags',
> > +                                       prefix: '#include <virglrenderer.h>',
> > +                                       dependencies: virgl))
> 
> Move it under the "if virgl.found()" block above.
> 
> I suggest to name it after what is actually checked:
> HAVE_VIRGL_CONTEXT_CREATE_WITH_FLAGS for ex
> 

OK, will update it in V6.

Thanks,
Ray

> >  endif
> >  blkio = not_found
> >  if not get_option('blkio').auto() or have_block
> > --
> > 2.34.1
> >
> >
> 
> 
> -- 
> Marc-André Lureau

