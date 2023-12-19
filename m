Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AA7781868A
	for <lists+xen-devel@lfdr.de>; Tue, 19 Dec 2023 12:42:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.656732.1025144 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFYTo-0002Cl-8F; Tue, 19 Dec 2023 11:41:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 656732.1025144; Tue, 19 Dec 2023 11:41:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFYTo-00029x-59; Tue, 19 Dec 2023 11:41:44 +0000
Received: by outflank-mailman (input) for mailman id 656732;
 Tue, 19 Dec 2023 11:41:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=oURO=H6=amd.com=Ray.Huang@srs-se1.protection.inumbo.net>)
 id 1rFYTm-00029r-MK
 for xen-devel@lists.xenproject.org; Tue, 19 Dec 2023 11:41:42 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20601.outbound.protection.outlook.com
 [2a01:111:f403:2412::601])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 92c37444-9e63-11ee-98eb-6d05b1d4d9a1;
 Tue, 19 Dec 2023 12:41:41 +0100 (CET)
Received: from SJ2PR12MB8690.namprd12.prod.outlook.com (2603:10b6:a03:540::10)
 by MN0PR12MB5833.namprd12.prod.outlook.com (2603:10b6:208:378::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7091.38; Tue, 19 Dec
 2023 11:41:36 +0000
Received: from SJ2PR12MB8690.namprd12.prod.outlook.com
 ([fe80::87d4:680b:51ef:181]) by SJ2PR12MB8690.namprd12.prod.outlook.com
 ([fe80::87d4:680b:51ef:181%7]) with mapi id 15.20.7091.034; Tue, 19 Dec 2023
 11:41:35 +0000
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
X-Inumbo-ID: 92c37444-9e63-11ee-98eb-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gwG9zx/Hycxz0pvU1GzzS8pZrNyCkZ7vJ6c3JymcINy03Lvu5zAprLDR46QR1y3HDs0NO1XpP58RhesHhGRgGmRs+Mv8FbJi9wwnuxMOCAfMpBFtwm84srTvicMKAfwuUsvuzeKtvY7dAesb6vZJIMmSNUOPSzANMwzwmtoghORDIGmOgu4oSnjj4TOAvpnWcBDhbDE2URAhDSsWuCLbxpKMKqUs6r2E2iICvGtUktCa/ZYd0kM9zigh/fOQ+c9no1tOc3U0qsb5ySOPLDawXd3ofv+I/IW/4NJVlnA7kRQDZgh9eSHY0jTJ0FnoD1N+WnjGt+Awaludxs8IkpNdKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U77njlRnreXjZvF3+32EEl747QWWVKdmYWzGOSPb/f8=;
 b=XE4GBrmcOgHqii+H61xALw0PYwk1g3P5bzOOpGwXICrNyEpZ6ZZxxJcuN9DtcZf0BoQZkezFU1eA5s9FA+eA61alwRPwlvojDGSjTGplqNlY94pwr+DTmYhFcSGulrqebXsPFnY3jQepVpW4M8HvJIJ1grJGYh+5qiUR+lLvZ0tpJjqBRtvsRfkEHP424dStxJbEJrAZKeGyyrA0TxjgimTvU+dZY3vX6mbGBomhMJTH047wmurha/rt1G7Ssp25uySUwPBtvw0SxBoLy0NbNcTBT8eoWyzyMdWHIlkLjfvWOIUBaPwggUBt0RpwHfQUzapb5HwQvF+d2QNTUpSTAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U77njlRnreXjZvF3+32EEl747QWWVKdmYWzGOSPb/f8=;
 b=XSpa6a8t0dB6Z3Xk3msSm2hD83Lb9drdyZTm6RNvragi3a74Rx9b8yw/CE/o4PJV0rgq25lZ+6yVZenaUZojOmkWV7ICEnPnrRfUFYcL7+G0JlaR3XXwHht5O3PyaxXC69lG8V6bhuk+FZbpZi+C+bK/JzOl887t5UJnfFY4guU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Date: Tue, 19 Dec 2023 19:41:08 +0800
From: Huang Rui <ray.huang@amd.com>
To: Antonio Caggiano <quic_acaggian@quicinc.com>
Cc: Akihiko Odaki <akihiko.odaki@daynix.com>,
	=?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@gmail.com>,
	Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>,
	Gerd Hoffmann <kraxel@redhat.com>,
	"Michael S . Tsirkin" <mst@redhat.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
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
Subject: Re: [PATCH v6 02/11] virtio-gpu: Configure new feature flag
 context_create_with_flags for virglrenderer
Message-ID: <ZYGBVM7DNRuwQEDh@amd.com>
References: <20231219075320.165227-1-ray.huang@amd.com>
 <20231219075320.165227-3-ray.huang@amd.com>
 <dbb37337-1552-410e-8231-7619aacbf887@quicinc.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <dbb37337-1552-410e-8231-7619aacbf887@quicinc.com>
X-ClientProxiedBy: SG2PR02CA0099.apcprd02.prod.outlook.com
 (2603:1096:4:92::15) To SJ2PR12MB8690.namprd12.prod.outlook.com
 (2603:10b6:a03:540::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR12MB8690:EE_|MN0PR12MB5833:EE_
X-MS-Office365-Filtering-Correlation-Id: ec05e7d6-5847-4117-b5e3-08dc0087745c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	yvsrAdUU3ubx+Yw+JvfqszeZjRdzE0Zgzc19AflHYHKSmAowx/gL/DmKUFfK93sK2LNG0RJaxKSARb3q3yy6RuBdGmsYQkirRCNMM9IeE1kCDVmZVSs5gjIoaaYbf64bEkVDIfid0va3QOmZ4U8aN7sdZnjzTYvrTTVLqYlSXinM0+USbX4m3WTnUGD+AFe3FIyE7c8q0ohdRg449YfukVSeN84VR4EJPFK2CS/CD1PkTUKGxz9zt8lfmK/UJnCheuY5CSjtwGUlYiDVjyM9c1ALK5j7Q5LhL4Rmrll45y1Vaiu8ZNecuulpXVGhvlnzEuUxWatYg80OxC6GT1cVD81TUmC6FHE9yLwnyQVddRbuT8Xysmx/i0PdOzFLDSMTFe6Dtev4DeX7d9pZqdLix844g3pfpzvRPEDp4JPOFOazxMPRxb7QIT4nwaOUrrdz/yTeq57G2zurpZ3kAR3t25GE4n3e9I+mMh5KJbT15+uH97SZ7Lulsr16NxD1N3fgBhDCm1owHQ4KV+EcOzU1qVqDELXMgvGBRXv7b2KvokGD9i2hiAYVIz+YGONpBSlI
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR12MB8690.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(376002)(366004)(39860400002)(396003)(136003)(230922051799003)(186009)(451199024)(1800799012)(64100799003)(53546011)(2616005)(26005)(38100700002)(4326008)(5660300002)(41300700001)(7416002)(8936002)(2906002)(478600001)(66556008)(6486002)(66476007)(6506007)(6512007)(6666004)(54906003)(66946007)(8676002)(316002)(6916009)(36756003)(86362001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?xev2fzVNP+Vreoeq+zPjW2Ig2crhSo6kheo4ErG6gz0fX+G/jrxJEuqOfXp0?=
 =?us-ascii?Q?zcKq92lJ32mvKXLxs2xouYBnrAf2V2OF8oqmeeG11f+9CM8waoWkYS8qiPHK?=
 =?us-ascii?Q?G3SXLBzVmf97BRnEXoBW9l1sdLVN3f0YBxWR3VRKpTSXejIzEu6dnHngD0Jf?=
 =?us-ascii?Q?JChuj8ACQNoedObtROXEq7qw/YMdypq4qKpI9isHTJ2CaYDi+o3MYhoV/1De?=
 =?us-ascii?Q?3T7oxqY+2bj0NFIhjHlXz/VQe4jbMxYgrdwf71ddoYk5uwM1qQr/NdFfAZTv?=
 =?us-ascii?Q?0hVq+gbHHKXWOLkeuaZ26fQYzCpuGDeqFk4XFwtxmsXeL85BsfeEmgPHSg9S?=
 =?us-ascii?Q?Eo8JRxJ2hVE8JzX2O3Z6doPIq6DMl3z7RASiUmYZ7/KFMYtSTEImZi21gUpq?=
 =?us-ascii?Q?uCLt2CGrJpPCGunn8f7bqsUrBHC3pMeDjZs4SMWoIQpTgN+dCWCO1mBUUGYv?=
 =?us-ascii?Q?mPGIta7bXANAlSBN1hObjmxAlldyG8T9tboHdCDMTqZES27sc5z8HBhRojEs?=
 =?us-ascii?Q?uo5YpKSpTQn88ydq57M4hOK6OkpBIIKNSNiShuTIvB0zHPuN5KWwYavEG8oN?=
 =?us-ascii?Q?8rPirA+NwFqdqIzGsXvu+sPkEcfBsPYzcBU7lcvYJxXs9KJSj3lEUhQliP8f?=
 =?us-ascii?Q?MJh6/zqY0E7bozIn/298QC/EAobieSsffkdKVgAvZBlX0m8DfICTF2TLrhm7?=
 =?us-ascii?Q?IitBujNeXwqJsLYt6qHV293WvleREAk0+9HqT4AzJoAV13ekLnUVqOVAgUxE?=
 =?us-ascii?Q?+2d7olf+EqKupogcfNnj7WJycrLSfwx9Ee7smtwJeihdy5kxtVP6GxxU6PSu?=
 =?us-ascii?Q?4XD9jIoeLMNzpyZfSX8j26HzbTwuX3jqajPd02s//CYu3A4kut8uAIr1nK0y?=
 =?us-ascii?Q?5s5KotqoZODsZlsF5ZdiMoin+ZW+1Ll1vaIAPtbf+x2cXXJHIQAXj+DMDoXi?=
 =?us-ascii?Q?7hKppOaeXXIpSGAgfg5pksXrWx8ODUKnrIf6KttP1OxovAYLal49dkBskCjK?=
 =?us-ascii?Q?ZzGQXfy6gWHsbPuvc3y9DQ9i74tD/iLV7T40YWjV2BrWs9HhcHBodo0OT62U?=
 =?us-ascii?Q?cFFyVRn/zT72UmudC7wDR3JvCl+zwxBdnKRX2/NKJBS1SSpS5OTpgDGFMIUL?=
 =?us-ascii?Q?rbuLLiAXfOwQgqmz3bQNg+WLkRtb7zyvQ1GNNupn675NodQOMwNBWitM2Cg2?=
 =?us-ascii?Q?8NAyeeKZXcxJUChfr5fvw8DfGfdd2p35t0uFhdfWoT6MBAQMJXQjMY0rWDNP?=
 =?us-ascii?Q?gAbMZd3GN59hJad4Ir3E+1LaUP4yux+9R40WpWgcB+ZKEX4zhO34QSjTTWzG?=
 =?us-ascii?Q?Rr5cYl/8j2BHvvG/iC2AnHOlolWZzFIwg69wHVo7K1pJNGdJ+9gos2j+ynSu?=
 =?us-ascii?Q?LZ62DiPxSPqSA1fu9sHCxvXqzhp0qgS5xPZAfrh4unZI66Py+p0E0aZOEcab?=
 =?us-ascii?Q?uiLl3cxgi75v4P33C2XSuaX8TF1bKMqty+hlIdubY+vy0X6LqTRXboRJ3tse?=
 =?us-ascii?Q?UaSM1wAKYJ/BMYObcf/Ba9eGHasBHk//2F6kQc/X48/oE/Lrh0VXo11aaanb?=
 =?us-ascii?Q?DbVGt1dEjBQXzpkl+kR8xMd1mDXbR3V559H163+e?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ec05e7d6-5847-4117-b5e3-08dc0087745c
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB8690.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Dec 2023 11:41:35.6013
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: A37/ug81Jsdfkgd7tdzem530iaGXTiEkxEmkzrXWp+80Ai1lwuybMRgSJr4DnfgAb3v2LslRNU/rJV6RiOeQtQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB5833

On Tue, Dec 19, 2023 at 05:09:27PM +0800, Antonio Caggiano wrote:
> Hi Huang Rui,
> 
> Thank you for this new version.
> 
> All patches which I did not sign off are reviewed by me :)

Thanks Antonio! May I have your RB in next version?

Best Regards,
Ray

> 
> Cheers,
> Antonio Caggiano
> 
> On 19/12/2023 08:53, Huang Rui wrote:
> > Configure a new feature flag (context_create_with_flags) for
> > virglrenderer.
> > 
> > Originally-by: Antonio Caggiano <antonio.caggiano@collabora.com>
> > Signed-off-by: Huang Rui <ray.huang@amd.com>
> > ---
> > 
> > Changes in v6:
> > - Move macros configurations under virgl.found() and rename
> >    HAVE_VIRGL_CONTEXT_CREATE_WITH_FLAGS.
> > 
> >   meson.build | 4 ++++
> >   1 file changed, 4 insertions(+)
> > 
> > diff --git a/meson.build b/meson.build
> > index ec01f8b138..ea52ef1b9c 100644
> > --- a/meson.build
> > +++ b/meson.build
> > @@ -1050,6 +1050,10 @@ if not get_option('virglrenderer').auto() or have_system or have_vhost_user_gpu
> >                            cc.has_member('struct virgl_renderer_resource_info_ext', 'd3d_tex2d',
> >                                          prefix: '#include <virglrenderer.h>',
> >                                          dependencies: virgl))
> > +    config_host_data.set('HAVE_VIRGL_CONTEXT_CREATE_WITH_FLAGS',
> > +                         cc.has_function('virgl_renderer_context_create_with_flags',
> > +                                         prefix: '#include <virglrenderer.h>',
> > +                                         dependencies: virgl))
> >     endif
> >   endif
> >   rutabaga = not_found

