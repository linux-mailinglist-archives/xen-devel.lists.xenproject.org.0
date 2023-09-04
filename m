Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 48889791199
	for <lists+xen-devel@lfdr.de>; Mon,  4 Sep 2023 08:47:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.594961.928409 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qd3M3-0000UT-Ed; Mon, 04 Sep 2023 06:46:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 594961.928409; Mon, 04 Sep 2023 06:46:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qd3M3-0000S3-Bz; Mon, 04 Sep 2023 06:46:35 +0000
Received: by outflank-mailman (input) for mailman id 594961;
 Mon, 04 Sep 2023 06:46:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=8Cex=EU=amd.com=Ray.Huang@srs-se1.protection.inumbo.net>)
 id 1qd3M2-0000Rv-3X
 for xen-devel@lists.xenproject.org; Mon, 04 Sep 2023 06:46:34 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on20605.outbound.protection.outlook.com
 [2a01:111:f400:7e8a::605])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c851369d-4aee-11ee-8783-cb3800f73035;
 Mon, 04 Sep 2023 08:46:32 +0200 (CEST)
Received: from SJ2PR12MB8690.namprd12.prod.outlook.com (2603:10b6:a03:540::10)
 by DS0PR12MB9323.namprd12.prod.outlook.com (2603:10b6:8:1b3::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.30; Mon, 4 Sep
 2023 06:46:27 +0000
Received: from SJ2PR12MB8690.namprd12.prod.outlook.com
 ([fe80::da13:5f6:45:fa40]) by SJ2PR12MB8690.namprd12.prod.outlook.com
 ([fe80::da13:5f6:45:fa40%4]) with mapi id 15.20.6745.030; Mon, 4 Sep 2023
 06:46:26 +0000
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
X-Inumbo-ID: c851369d-4aee-11ee-8783-cb3800f73035
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QRzqBPi7RwtfRtdE5rdxAU1IVsogrWidtVhjK7tssaQ+zKkayiJi60/rgb56SL37iB0LtxbSvArm08kE+9UklaMjZqhJHtUTRLuhrsdU6kOi0sniD21EMAkqillP9xHKStrg+FlE6Yvzhj+6K8MsJbF8fciZELQyyS7Q7Ku7yMewHNPbbgnpoBdg+5s0ApCziWEJ7ntUkbRHT/zeMVirLSwtltDOeT3n1qu5+YVLB5VAlXwy/8gQjZvHktm++9tTrAbxuggrIZxMFbeegr55cbUSmNrpKbpcZGNWYrCtbOhvcMNzOA2riLLE0Qw5Wp9rEaTzZHjPp07ZI74MgK+wvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SJrRPI1Ee77EK7uAYCAbaRtDK7w/nt+ui+Ot9R1oiv0=;
 b=eKQecve5NRpwHW7xmdC/No7S6JwEyrlv+kVtAl4/jm8kDKzhSMByF1OHWXaB/CfTV1Ms0rkmVDWDFUySPyh9WLeaPUyrpNYNgkXZd/ScH7ozMwbBCuWOQNhKrUEyTI6+zylPZWEiS8HghtC7jV1juqaN5c5TYgG7q3xVTwgzoGdA6IvyC0NroGVfFK4q2Uq1VA1gDaqQXXedb1T2/N4hdrmi5xK+qUlarQY+slcydNa9doaJJEFXt53KIHjfJMPF+8Lv3kve2srozfFS3mRz1iOCqprJok7wuzwQM5HHtvpzU8ur8c5z6CxB2crvYOvK2K/3PUDqsGX04fsOgoGIoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SJrRPI1Ee77EK7uAYCAbaRtDK7w/nt+ui+Ot9R1oiv0=;
 b=ZAcUtPAT93QE2kw/RbYkC2wTborgxhgrP74N59g2djygZt1+NxTCidM+2dFs5pJhpZQpem+Y7UYd8ds8lwdCM6MtG95jL8C8qFKq4GUbYbNIQi66byW8DYZcGTA8sc2soBv73HDwZ2Y7eMDggP8mePz3ou78PrawII29HKoGlqQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Date: Mon, 4 Sep 2023 14:45:59 +0800
From: Huang Rui <ray.huang@amd.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>
Cc: Gerd Hoffmann <kraxel@redhat.com>,
	"Michael S . Tsirkin" <mst@redhat.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Antonio Caggiano <antonio.caggiano@collabora.com>,
	"Dr . David Alan Gilbert" <dgilbert@redhat.com>,
	Robert Beckett <bob.beckett@collabora.com>,
	Dmitry Osipenko <dmitry.osipenko@collabora.com>,
	Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Gurchetan Singh <gurchetansingh@chromium.org>,
	"ernunes@redhat.com" <ernunes@redhat.com>,
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
Subject: Re: [QEMU PATCH v4 06/13] virtio-gpu: Configure context init for
 virglrenderer
Message-ID: <ZPV9JxTVPNwkteu8@amd.com>
References: <20230831093252.2461282-1-ray.huang@amd.com>
 <20230831093252.2461282-7-ray.huang@amd.com>
 <a3ffe20a-db49-5c16-caed-a858ea5dff09@linaro.org>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a3ffe20a-db49-5c16-caed-a858ea5dff09@linaro.org>
X-ClientProxiedBy: SI2PR01CA0004.apcprd01.prod.exchangelabs.com
 (2603:1096:4:191::22) To SJ2PR12MB8690.namprd12.prod.outlook.com
 (2603:10b6:a03:540::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR12MB8690:EE_|DS0PR12MB9323:EE_
X-MS-Office365-Filtering-Correlation-Id: f69290d1-7a55-4de0-a25f-08dbad12a924
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	kZX9mc+XtEWssxRbcJGEBSN33fA8EkYGVL286jZL+ijfuAi40nS4m9HIn9bg1zsNlcxN5MawgYS0pFVKxOf3/JBnI2QxxbJWVNyr3Qt/DJgodCMzATe38iUMwAXaiMBtd1kcr4IAT4W40pNLrq/gluoRPvpP8Fb25uYmBjpxVb4UiefFgU2mdrm0I4D3UoE4FniZca1pNLmt6NCImQHQGPW2IWHZJRkJRKQ1diUl+Um0fS4NOwIs+urnk86v6m4Ic2HfIA0r0N+QWPecgY9cn2MVMhbpgu0VHZ3XIagtpDAf4pjCXajD0UxpD5E8s2plL9vz4sa6sf0wEXJ1vbwjbla2oWlqg8FepY2zDTJrGufeZoo4ZUuEwXMr/CVCo/YtpMav9ZFSj8wn7QHpiv1/P9xgOR+yQQnghCJbw+Ec+nmnd/p4KcxoRp53/bOx22T8nGoTbu0em12XpT6B9pDmyJ7p6euKTjRJ8cTUctpf9Maqp8XBCzmM80vLCA4I2x73BNsTPOBdHCxo034ABo5v45FtjDz0b/F5MaotBrPjaYfKRA+PTHXakSP9ZN1wD8pW
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR12MB8690.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(346002)(136003)(366004)(396003)(376002)(451199024)(1800799009)(186009)(7416002)(8936002)(41300700001)(83380400001)(478600001)(6666004)(2906002)(66946007)(5660300002)(8676002)(6916009)(66476007)(66556008)(54906003)(316002)(4326008)(6512007)(53546011)(2616005)(6506007)(26005)(6486002)(36756003)(38100700002)(86362001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?Qlay4XOvTzSEG0Hazw/1kkV5FDeWfGwsD5+oJUSZb0rj1whPGHNr9rSnB+?=
 =?iso-8859-1?Q?2Ps04IAd3PmeHvt7NzLI3GelN9pWB7l0XMn4B1IDyZjDS7vDK4W2uNWPXM?=
 =?iso-8859-1?Q?e3E0G/WOPbV8zLiABZkn03Qo02Obo94/D+P4Ax2MUcC89i64agtKJUJ+FQ?=
 =?iso-8859-1?Q?q+kD5X0jXJV44roSx7ML2DzEGBmKRGMRoeyOc2/wJf3OH+rThpm7UaJTUt?=
 =?iso-8859-1?Q?S9l+28y90CMkWkOJWCCJs8dpvBu5oNjvbA7OgVSnow2YsX1IKNpOYfQQjA?=
 =?iso-8859-1?Q?JFxwcqLxQntV4yZAVCn+8FJsolEnkRUDX4kPfimelfqHBU8blpLkU6QggJ?=
 =?iso-8859-1?Q?C+RyoysYCHHHY58/G5TRx3EinDt9td1J0e4XLANOe1eytxIP637JiBuGez?=
 =?iso-8859-1?Q?7wLq6X90P+nkxU1y3IsDJf9GV0Qc9D5Qt6Z/6OKp07MN+apLEdvAQJarEa?=
 =?iso-8859-1?Q?PrWgFywr5PcT8hTOagm7+usn1jbrqGEzSX6f6z7r2H2F5peMGaaK0yoIic?=
 =?iso-8859-1?Q?c6cApXEZqpQPczz9S1S8o6IKGLJWH+Epm6QnZMc0+eXiJhywgrCUfMnOkC?=
 =?iso-8859-1?Q?C3OVU7p5/vWPOenb7JSNvdU6ngeJhcfaJwWw1odRPO3GbLTPWnLbbYRAxK?=
 =?iso-8859-1?Q?VKV0G1CFE2nIQMWADHWcy/mI6FNi76p9gRjvhLrumZ4urKHFLOHn6MVYLJ?=
 =?iso-8859-1?Q?pH0hWiTaQMPwXggy2OzR51mlWVPtomsRxrC+2N5dMm9J9OJNC+QGKJ3r88?=
 =?iso-8859-1?Q?Hn2dIBTnR2sqNTZvY0DOcbowXWTSQhOmu7gehqhavLZnOtOXnZget0N4md?=
 =?iso-8859-1?Q?TmQYH1Azl3pta06es+PCLei+4lGkKNcvQyRZBBA5X32y0PKN0IOBjkfdyq?=
 =?iso-8859-1?Q?ZfbwWuFHd8kDKCvpOeRRTHOISiZai2qF8Lq5cuFg5uQHCghiByaJNKyKyQ?=
 =?iso-8859-1?Q?O2N9nbhCLytFJPk6309bG7v5iEoq/X57CpUylh0Xl0ag4DhW6a1RFbREW+?=
 =?iso-8859-1?Q?L4jsEIl0bJ/WguEU4W1JTL6e69nB2SUWxl9MuOcQF5cRiNsUt9WU3I3deS?=
 =?iso-8859-1?Q?YnvshhvLA3GYyUuw65mcO3fvc+u5XakZ7RoQbeRButXQESNS+4Z20WI4Ni?=
 =?iso-8859-1?Q?I+Xn8R5vfsgQEVBTsBWiiTc03nQFMcAxy9l17WJCVo1FI8F7PjzZalqTHd?=
 =?iso-8859-1?Q?i5tztRJnGRdRoh1Toq4p1/uvDWvecoPDK7cP/nab9XuxJptMhbqzP+AzTH?=
 =?iso-8859-1?Q?Uf1pTL8/f8Ts9J2bBzQ7+lqbN8MZRgd1qsQnbkuCQIoG2m+N9rbo/5QhAF?=
 =?iso-8859-1?Q?7MZoY/E3e+x+MpRa4tEIacTJkc2l4dPHUYaoAdfBKJWeQY5htS36eywfab?=
 =?iso-8859-1?Q?hpPpwfziU1X1GbHpnpNs//Eq/4P1z2DXBu9CYAIqhum1Qn+tBo/BOowB0t?=
 =?iso-8859-1?Q?xLWDO8P3996X/spBzS6RcH2c0zulMtm8u1HtjqN8K8cOmo9nu8DXEFGK0L?=
 =?iso-8859-1?Q?TWjSo5E34xA4OOzBwFEF0v6lvu+qAoeq4bedj4EbTVx1gK/JwQbt+hCfD0?=
 =?iso-8859-1?Q?s39RjNirEURjYLiEqDcdL//s5QPECIKsBG2PwzBlVfVIfQ37qifc2h7LsX?=
 =?iso-8859-1?Q?KMPlHuX/Nny7PEgKv9MZi+11CxecoJGLwM?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f69290d1-7a55-4de0-a25f-08dbad12a924
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB8690.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2023 06:46:26.3336
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7u/BB/Qoneb+LE7knJLMyOidZzPBSldvbNAa9tc8MvhCO0/UHoJA9x0S79HojUsSXKYPjZJ+RhfN3JuxNRLe6Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB9323

On Thu, Aug 31, 2023 at 05:39:38PM +0800, Philippe Mathieu-Daudé wrote:
> On 31/8/23 11:32, Huang Rui wrote:
> > Configure context init feature flag for virglrenderer.
> > 
> > Originally-by: Antonio Caggiano <antonio.caggiano@collabora.com>
> > Signed-off-by: Huang Rui <ray.huang@amd.com>
> > ---
> > 
> > New patch, result of splitting
> > [RFC QEMU PATCH 04/18] virtio-gpu: CONTEXT_INIT feature
> > 
> >   meson.build | 4 ++++
> >   1 file changed, 4 insertions(+)
> > 
> > diff --git a/meson.build b/meson.build
> > index 98e68ef0b1..ff20d3c249 100644
> > --- a/meson.build
> > +++ b/meson.build
> > @@ -1068,6 +1068,10 @@ if not get_option('virglrenderer').auto() or have_system or have_vhost_user_gpu
> >                                          prefix: '#include <virglrenderer.h>',
> >                                          dependencies: virgl))
> >     endif
> > +  config_host_data.set('HAVE_VIRGL_CONTEXT_INIT',
> > +                       cc.has_function('virgl_renderer_context_create_with_flags',
> > +                                       prefix: '#include <virglrenderer.h>',
> > +                                       dependencies: virgl))
> 
> Shouldn't this be inverted with previous patch?
> 

Yes, this should be patch 3 because we should configure
HAVE_VIRGL_CONTEXT_INIT firstly. I will update it in next version.

Thanks
Ray

