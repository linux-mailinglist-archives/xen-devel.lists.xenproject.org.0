Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E9F8799777
	for <lists+xen-devel@lfdr.de>; Sat,  9 Sep 2023 12:54:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.598505.933365 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qevbX-00031k-Lk; Sat, 09 Sep 2023 10:54:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 598505.933365; Sat, 09 Sep 2023 10:54:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qevbX-000309-GY; Sat, 09 Sep 2023 10:54:19 +0000
Received: by outflank-mailman (input) for mailman id 598505;
 Sat, 09 Sep 2023 10:54:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=JYTu=EZ=amd.com=Ray.Huang@srs-se1.protection.inumbo.net>)
 id 1qevbW-0002t1-FM
 for xen-devel@lists.xenproject.org; Sat, 09 Sep 2023 10:54:18 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20600.outbound.protection.outlook.com
 [2a01:111:f400:7eae::600])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3797d160-4eff-11ee-9b0d-b553b5be7939;
 Sat, 09 Sep 2023 12:54:16 +0200 (CEST)
Received: from SJ2PR12MB8690.namprd12.prod.outlook.com (2603:10b6:a03:540::10)
 by IA0PR12MB7776.namprd12.prod.outlook.com (2603:10b6:208:430::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.30; Sat, 9 Sep
 2023 10:54:12 +0000
Received: from SJ2PR12MB8690.namprd12.prod.outlook.com
 ([fe80::da13:5f6:45:fa40]) by SJ2PR12MB8690.namprd12.prod.outlook.com
 ([fe80::da13:5f6:45:fa40%4]) with mapi id 15.20.6768.029; Sat, 9 Sep 2023
 10:54:12 +0000
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
X-Inumbo-ID: 3797d160-4eff-11ee-9b0d-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=U/hXx/IohU4NSftnn0tosV+baR5fOQQA349NW+iE8Np3XO/DR5NL4A0qKZs83H+FST/tWl/93Hz+CZtC4Cneo02vEzoUjVFgB1OA6OeQindQLlMHQ1GUVkKTAlu0h9bYt7Ier16rkO+3c2LDqUjMh4hqX867B/luiQTyy4NsY8TtaFUwgVZ1JDRhCzRPWWLa2fdUFtVRAwqO/b3hSml4Ol98bnXl6gNtfl37lMUcLQk+BkIcHV0vfGHekBlJRDNEwWOt6Yp/b2joAvWK1O3RMGUpr5U6x7CElx7DHeQzWttSyfP0FcrlzCWmmJziLg/5wYZM6jGieNIdamDnkbDt3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vP5VtGMwqKXDYMHajnAU1m4VDmRFinybtUjuat8b4fM=;
 b=Hz7u2EeRpVyzsR8Uwv1C3sqzA0yxHaaSEmWznyVP/pO7n1qv6TwF8EyRO0vA1Vo8+AHrJN/kDasaFrvCZLPbmkJEZiy55pPu5x8rSWRIwDYwzMG7PAoA/HEW7yCdRR4FOzJ2d7oqPU7ogTeiMVWJ9iVJf7sOexySoUHwgyFOYM6lek90hjK3hWJkN16tNXTH5Jby2lDnCB4Lu25rri0aBxCKjikNk60hXzOTdUxvBHmfmPqTNP0qJ4aWbVisL8aGqAquyvpiP1ysUqBJuoosGTilqWf8h9Y8qvNTeXhNHGm28f6cnKPOdJkOdwm7Zkj+APmcJrpcUrRbhAEWjOwDUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vP5VtGMwqKXDYMHajnAU1m4VDmRFinybtUjuat8b4fM=;
 b=jTPHUL4SVQ6ojQzks79t90uLKhG2Voekp0VbSHucjl49Y2vIRSc07dFLLc1+2FgqdZD5lBrfbQtiBxXZHz1XlKaLqd1haSCB1T0Mmzi0bEkBHkhKjcNFzY/JsMHfxtWMXynNADC5S9ApG5Vn6UZ3bqrgf5HnYncnguEby3/PxHg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Date: Sat, 9 Sep 2023 18:53:44 +0800
From: Huang Rui <ray.huang@amd.com>
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>
Cc: Antonio Caggiano <quic_acaggian@quicinc.com>,
	Gerd Hoffmann <kraxel@redhat.com>,
	"Michael S . Tsirkin" <mst@redhat.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	"Dr . David Alan Gilbert" <dgilbert@redhat.com>,
	Robert Beckett <bob.beckett@collabora.com>,
	Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Gurchetan Singh <gurchetansingh@chromium.org>,
	"ernunes@redhat.com" <ernunes@redhat.com>,
	Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>,
	Akihiko Odaki <akihiko.odaki@daynix.com>,
	Alyssa Ross <hi@alyssa.is>,
	Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
	"Deucher, Alexander" <Alexander.Deucher@amd.com>,
	"Koenig, Christian" <Christian.Koenig@amd.com>,
	"Ragiadakou, Xenia" <Xenia.Ragiadakou@amd.com>,
	"Pelloux-Prayer, Pierre-Eric" <Pierre-eric.Pelloux-prayer@amd.com>,
	"Huang, Honglei1" <Honglei1.Huang@amd.com>,
	"Zhang, Julia" <Julia.Zhang@amd.com>,
	"Chen, Jiqian" <Jiqian.Chen@amd.com>
Subject: Re: [QEMU PATCH v4 12/13] virtio-gpu: Initialize Venus
Message-ID: <ZPxOuIryznYcGmLS@amd.com>
References: <20230831093252.2461282-1-ray.huang@amd.com>
 <20230831093252.2461282-13-ray.huang@amd.com>
 <ca8bcf9a-2886-aed0-5229-4787808bd39c@quicinc.com>
 <5462a77f-c66d-af2d-fc07-df9f787558c2@collabora.com>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5462a77f-c66d-af2d-fc07-df9f787558c2@collabora.com>
X-ClientProxiedBy: SI2PR02CA0018.apcprd02.prod.outlook.com
 (2603:1096:4:194::18) To SJ2PR12MB8690.namprd12.prod.outlook.com
 (2603:10b6:a03:540::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR12MB8690:EE_|IA0PR12MB7776:EE_
X-MS-Office365-Filtering-Correlation-Id: 3cfe5010-05ff-4ccf-0497-08dbb1231a0c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	l+umJcJZKAhucvHeiBlsbDqcJJWngS3GmwMY/NbUbPGvq5eigKekyLz80B1AIgLDRsnyiuXsJd0x8hwQSAnaG2CAEOmXMGlOWmG4UqwbLP85SLi/OT0VpO7f7ivs3t+TxFV9fMiN8K0WPg3cxKx+OIPp/5ut1ETAau1/x3WQ8iygVY+yjcrdcuNplVrlnHXHbdUV2TPWRbjm3Ro6dEWtsICFvcVsc6YP9tpb1YExE3U/lFLa3mnsJHPGiKLD2A5uZPQh+7ak/UHneDiOMWXagDg/uqVVzkAkesEyCNkcejUKd1Q4nNu15GPP3jJHf12el+0puich6kP1AWwAlpY8rPpYGpacv55FwpcLblvlgwROAA67GPohmQDpOoas1Wpikp0uTvdPNf1fbBpb7W/ecirVUbSp8MoceVqrD0LBBtPKcT5TQBxufqbiULVOydBldJ73UxY0zhh6ha3LwkLFHeUoLMN8rRo2T9fvFNXijQNAjd7i7MtT2dWL0Gn+w2rkIbovpBEOKaFHEpG9RkQXZMh/CtbQQ104W0iHUssPqAMOwUu+XRgtiXBIX8xNrgf3
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR12MB8690.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(396003)(376002)(366004)(346002)(39860400002)(1800799009)(186009)(451199024)(53546011)(6666004)(6486002)(6506007)(36756003)(86362001)(38100700002)(2616005)(2906002)(478600001)(6512007)(83380400001)(41300700001)(8936002)(8676002)(5660300002)(316002)(4326008)(26005)(66476007)(7416002)(6916009)(54906003)(66946007)(66556008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?SOXqKdiyU56Eo3UHFGddWxk/moK8z/nHbMDskcBZSCe9PV318iTnKZqt0Q?=
 =?iso-8859-1?Q?3RYewE5InWBWLbuRRBm72DS1Wr7H3ex4Co/8qkIujdYMy0K+4s++aVz502?=
 =?iso-8859-1?Q?/3PF9iPg2HJ8qjZ81aEwqrBObDJp3qIfud2v8ORr1VqT0Jr4diIUkW4q2b?=
 =?iso-8859-1?Q?Njifv8pWaWN7boftMWZzED7gTDE15dAjtDqFZvFIfATrRrA0DaGKXDjwBD?=
 =?iso-8859-1?Q?RFTcMUQ4EI65r63OCpmg06qRBkho1DtaDGS/kdB1hrxttI+DV7LRmFtcCV?=
 =?iso-8859-1?Q?PbJZ1g/EjqPCnlB45x9jwj63aEznGhSUd3p+qB7n3MIUOuqammsxWcG0ZZ?=
 =?iso-8859-1?Q?8/Clpn0Giv24dSIOUVh80OReBGNMDQJiKaxSJ6D8ThzVwB7ekoosRtC9Tm?=
 =?iso-8859-1?Q?RB0095CnJKG+rQa9k4YFgifrpdehZmEBW6qB/gGLFJF6y4ZEfvsUBSa9Hl?=
 =?iso-8859-1?Q?XrMNsMZNSd9qc2VsVoUX6S11N3eNaHS+WSL+cejQd31qDp5JTI8U5BzLQz?=
 =?iso-8859-1?Q?Zo6r1668maE02ZkQbycB6IL6AWt3hgTMP8RkjxVRH5Am2ElnNSGythSGuq?=
 =?iso-8859-1?Q?QIltmJgv2p/pwNpZRQpl7dAtI1rIfrLuAFmJPMCNQzbfxpTLmmh+hRCC6U?=
 =?iso-8859-1?Q?nQTcS2WQUoXcbaJgeFS+gw/Z1RwmovZaRw4q8Vbsk3OvXD+G9p1q0Xw3Oi?=
 =?iso-8859-1?Q?zgIJJbAizWbpQrVYZomxtoyjl7sD2XNF9USofyGvsKxLt4SE1Ae9Bji0vu?=
 =?iso-8859-1?Q?MDytRDeh1kumzWuDRPs0vqkpc7TkrsTuAn0DyeAgQS1ye4c6DTDwcPxGds?=
 =?iso-8859-1?Q?bsmIm+Ov0A/3ooX4bb8dr7+n5adP4V0DcC9bhy3+q+Yc09+1Raw+IMj/gj?=
 =?iso-8859-1?Q?Lhbk0AOj7/QLC08jbjMlQ2hyy3wCEqLOWupEqhV/RyUbE+32fy3XgaRVaZ?=
 =?iso-8859-1?Q?PemyKaQz4dGl/pYVuS8Rb5o/fRtkWWT9zZcGPrXLvgGcJiYkWE6EXAywV5?=
 =?iso-8859-1?Q?rZ4vApEbqPSyjQAEMPjl1tkr0Umma8J6l52gOD6AjO1uTdTtGWZqCmCuuZ?=
 =?iso-8859-1?Q?65ZElLNKurKr5Q8iQy7YFaWe1L2OD3kC9WzRfRaY9PFmKFchNPkIPUR6bq?=
 =?iso-8859-1?Q?Kn0M+IhhK3MZgn9OHWuGntdCp6TYhAxvtrzoI8bSf6aYvalvUhRgHkKdGH?=
 =?iso-8859-1?Q?vmiTDAUnOz+rUqRlT3cjFHV87cgLaEIZaEmxUO8XrZL6BZbTldJr/WSkPA?=
 =?iso-8859-1?Q?WD+wY4GN4AtJ6WaP+Dv9da0VO2Zv+BsEwnHKkfjeKzp32OwD8yVbQ1tlna?=
 =?iso-8859-1?Q?uJNhK+/os9eFpv2+Bnpy6TdSisww53xr1Yr2sDsQ2WgJWEQUdWJ8q9qcrb?=
 =?iso-8859-1?Q?URCa/kkYbJlZNh1RQAfkFOL+qsqnukUljmDgvD9iir14gck2aT+HUM4UXE?=
 =?iso-8859-1?Q?1gkvyDK6aaAtnbkiJFi/p4TmemrlDfuAys1gHHrgLeCDsgAOzYL3pojM2k?=
 =?iso-8859-1?Q?pM5JYDiFXunBouMxSp+qzl+Th9alqknqUPV9uS8YqJRiUYn2Owtfz+Yvcm?=
 =?iso-8859-1?Q?p4stumLebWOr5JDgt/1iirq5J5DG+cYskJXwOmb3P1/jIho89V/XbwuLs5?=
 =?iso-8859-1?Q?9Xf+8xXfaGISYrCqYXvsLf+cTz/f97sXMz?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3cfe5010-05ff-4ccf-0497-08dbb1231a0c
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB8690.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2023 10:54:12.3484
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7u9BzgK+Ni12sOxVpHQmkBAybcHRE5Qd9ni4WZMzhrGm1tlpPiIRv9JNCweGg9Fr2k4lclmmqBTGPPVNfB9Sbw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB7776

On Thu, Aug 31, 2023 at 11:51:50PM +0800, Dmitry Osipenko wrote:
> On 8/31/23 13:40, Antonio Caggiano wrote:
> > Hi Huang,
> > 
> > Thank you for pushing this forward!
> > 
> > On 31/08/2023 11:32, Huang Rui wrote:
> >> From: Antonio Caggiano <antonio.caggiano@collabora.com>
> >>
> >> Request Venus when initializing VirGL.
> >>
> >> Signed-off-by: Antonio Caggiano <antonio.caggiano@collabora.com>
> >> Signed-off-by: Huang Rui <ray.huang@amd.com>
> >> ---
> >>
> >> v1->v2:
> >>      - Rebase to latest version
> >>
> >>   hw/display/virtio-gpu-virgl.c | 2 ++
> >>   1 file changed, 2 insertions(+)
> >>
> >> diff --git a/hw/display/virtio-gpu-virgl.c
> >> b/hw/display/virtio-gpu-virgl.c
> >> index 83cd8c8fd0..c5a62665bd 100644
> >> --- a/hw/display/virtio-gpu-virgl.c
> >> +++ b/hw/display/virtio-gpu-virgl.c
> >> @@ -887,6 +887,8 @@ int virtio_gpu_virgl_init(VirtIOGPU *g)
> >>       }
> >>   #endif
> >>   +    flags |= VIRGL_RENDERER_VENUS;
> >> +
> > 
> > VIRGL_RENDERER_VENUS is a symbol only available from virglrenderer 0.9.1
> > [0] and only if VIRGL_RENDERER_UNSTABLE_APIS is defined.
> > 
> > Luckily for us, VIRGL_RENDERER_UNSTABLE_APIS is defined unconditionally
> > from virglrenderer 0.9.0 [1], so we could check for that in
> > qemu/meson.build
> > 
> > e.g.
> > 
> > 
> >   if virgl.version().version_compare('>= 0.9.0')
> >     message('Enabling virglrenderer unstable APIs')
> >     virgl = declare_dependency(compile_args:
> > '-DVIRGL_RENDERER_UNSTABLE_APIS',
> >                                dependencies: virgl)
> >   endif
> > 
> > 
> > Also, while testing this with various versions of virglrenderer, I
> > realized there are no guarantees for Venus backend to be available in
> > the linked library. Virglrenderer should be built with
> > -Dvenus_experimental=true, and if that is not the case, the following
> > virgl_renderer_init would fail for previous versions of virglrenderer or
> > in case it has not been built with venus support.
> > 
> > I would suggest another approach for that which tries initializing Venus
> > only if VIRGL_RENDERER_VENUS is actually defined. Then, if it fails
> > cause virglrenderer has not been built with venus support, try again
> > falling back to virgl only.
> 
> All the APIs will be stabilized with the upcoming virglrender 1.0
> release that will happen soon. There is also a venus protocol bump, qemu
> will have to bump virglrenderer's version dependency to 1.0 for venus
> and other new features.
> 

Dmitry, do you know the timeline of virglrender 1.0?

Thanks,
Ray

