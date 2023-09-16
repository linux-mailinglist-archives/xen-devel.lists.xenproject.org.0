Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B549C7A2F41
	for <lists+xen-devel@lfdr.de>; Sat, 16 Sep 2023 12:34:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.603550.940579 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qhSc0-0007VI-Qz; Sat, 16 Sep 2023 10:33:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 603550.940579; Sat, 16 Sep 2023 10:33:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qhSc0-0007Sv-NY; Sat, 16 Sep 2023 10:33:16 +0000
Received: by outflank-mailman (input) for mailman id 603550;
 Sat, 16 Sep 2023 10:33:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=JNh2=FA=amd.com=Ray.Huang@srs-se1.protection.inumbo.net>)
 id 1qhSby-0007SW-M9
 for xen-devel@lists.xenproject.org; Sat, 16 Sep 2023 10:33:14 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on20600.outbound.protection.outlook.com
 [2a01:111:f400:7e8a::600])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6ea463a2-547c-11ee-9b0d-b553b5be7939;
 Sat, 16 Sep 2023 12:33:11 +0200 (CEST)
Received: from SJ2PR12MB8690.namprd12.prod.outlook.com (2603:10b6:a03:540::10)
 by BN9PR12MB5292.namprd12.prod.outlook.com (2603:10b6:408:105::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.21; Sat, 16 Sep
 2023 10:33:06 +0000
Received: from SJ2PR12MB8690.namprd12.prod.outlook.com
 ([fe80::c3b:811:fd1d:c33e]) by SJ2PR12MB8690.namprd12.prod.outlook.com
 ([fe80::c3b:811:fd1d:c33e%6]) with mapi id 15.20.6792.021; Sat, 16 Sep 2023
 10:33:05 +0000
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
X-Inumbo-ID: 6ea463a2-547c-11ee-9b0d-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L6MdulTHMjmfnKMNO4ZXElH2eJwLvd5+bJfuaVEqMYPFphACW4rNe7Bov3R2FnnIXHfcIXQ7gZTHMN8cH6Bujx+eamYgNqNUHSR0tJeACdJrPLPv2YqosnuefKiLW3LS74QZl1YPBjXUHixIhr8Pk0vuEOBosvX4rstxVcIqr+FbH6oUHOzB0KUoPZSNGakQUraLxRBtYwvnCGTTA3+8Bbj+Pgwa3ZH+Qxz4lL5lHjPbaaxROBEmDW5DGs3zDa+z8wFD7EIpt3ZN1TJxc3pRTZCBHfSBQgxgssyguJr6H9u4YqTjfYyu2wirbI/b5zxbXruHCWS0YKlP35dBHzBiDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dsvEVklb27yICg9NOj/RmbVN0fwndIiYt1iCTi16vVU=;
 b=Wf868VRVTl3upXEUNr1iGKNcQRYy5/lCEv4S9nRBVCOp9OFrKqAiDEcfNe0Sa0mYC8Urej2k9D7f/hAKojYkm7xsUj1QVNoj8oSUj34szjWMhPrch9ZvdtzcQUoGJhrGXjInvdx5zLpfiXPx7t9hX0mRcb31XynfcaJSpdUX+Wf6PvY2E1oehg+RMn3AE/X+NBKEwTWUhwNmFOvIS9P7LYEnoFV4RZagdMnHit7biXbI7I74Gzo1LLEl7ERPaLyw1QsP6GEdg1ssRtPM3+6SjOQERafKUEs2AWsy7C7F2usQ1uvI0AEnIWDnxssNvwkXY+29dMY+mAXasgS146GQug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dsvEVklb27yICg9NOj/RmbVN0fwndIiYt1iCTi16vVU=;
 b=ZFJpmcF+8uWfHty1vDiIziZYbdXQ/RkjVPcVdgUhWtNAz9u3icUpqkYcilGODN3tLIMPTJWDNb2HhmV5LIlbmMMJJVR1j3P39ruG6xH6A8XOjqqRuDyLqtjJC0/FlTre1EVHKa+DWxPb6DwmbryDPCwYcCBrYzzGF1mRlSb5ZCE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Date: Sat, 16 Sep 2023 18:32:35 +0800
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
Subject: Re: [QEMU PATCH v5 06/13] virtio-gpu: Support context init feature
 with virglrenderer
Message-ID: <ZQWEQ9ZHkokhKOSA@amd.com>
References: <20230915111130.24064-1-ray.huang@amd.com>
 <20230915111130.24064-7-ray.huang@amd.com>
 <561abf48-d72c-467d-94fd-54ffa1dfb512@daynix.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <561abf48-d72c-467d-94fd-54ffa1dfb512@daynix.com>
X-ClientProxiedBy: SGXP274CA0009.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b8::21)
 To SJ2PR12MB8690.namprd12.prod.outlook.com (2603:10b6:a03:540::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR12MB8690:EE_|BN9PR12MB5292:EE_
X-MS-Office365-Filtering-Correlation-Id: c3ef947a-c79d-4977-2f03-08dbb6a04f5a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	CQe0PpzYtiICKJkQ60SA6zaFy0I1J1S+o76I+VLp42nUBhzEdgdf3SZaXSW2TDi1pLGoqa9viyG4RedeLhbi1kiSB9tMRGZDoKM88ox9Te9O/Leh7YqVT4Dxpy3JL1Hc8FTVrXQTtTR5fHh0ZEhHomw/vSrxDCgYG+tRadZHisvCTwRz2C6MaEN7y8Wi3/DiyQp9+8WwN/V2zCC+vzkRe+oTk5GCJWYgh3raHp1r7ukYK1J6ScB9T1X+59tdCfukiphNwN2QWTIK2hOzRDIC7WyMVft6XC2GVqgVSqXj2FaQgEo/ai4ZCAhMzxChOC2+BCq2fGZB3nFk8YnUiV3FImNrcgSqI2ghVGqUSYfTuAG0cOhcAlu59DqQvwOijbwbUPKdlu7BYY7xhf2ZHvZmBY+1KRAzQXiRbcX//iCyrW0reTFkqE4idAbqKu2ZlodApOx5c8Wma2MsuoanPWVply8EaKgi0U0RdcvSyvPG6rmOU2baocJ+e9w+fL1EuL+LsYQa0R9YAN8WQY9QvNn2M0+S3FWqyZ03raXbNvZw6dk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR12MB8690.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(39860400002)(366004)(346002)(376002)(136003)(1800799009)(451199024)(186009)(6486002)(6506007)(53546011)(6512007)(6666004)(66899024)(38100700002)(36756003)(83380400001)(26005)(2616005)(2906002)(8936002)(86362001)(41300700001)(7416002)(4326008)(8676002)(316002)(54906003)(66556008)(6916009)(66476007)(66946007)(478600001)(966005)(5660300002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?olTEiYuHeZvAFqutQtT48QNP3sDv1DKKPc6QI2XfyNjzzatWN6S5YWDZvugK?=
 =?us-ascii?Q?HzCP1GvGce5m4z43Nipd7QfOMXf13fo6V8gZNRvu9Dav+p/ga6hFFJSFpTv9?=
 =?us-ascii?Q?YhE0auUeyVts71sPfa9o0cVYM5QNHSiNoMtwOfQu2LmZw7aHXSqMSmUMjNPL?=
 =?us-ascii?Q?WL3lANDBI9eFx8vf/2A0eAiibMcgPAIZQn4Y0OQwaeorBDewGfavA8cG0Oiy?=
 =?us-ascii?Q?50vXr0TdNBm76EUkdJ9p5M2WTkamKebbTRoVyeZSwKYpb7+0Ezc+vybSZ6Ty?=
 =?us-ascii?Q?c68swv8lawOCivOsw6Fl/iK5f0qMqp++URLbQaMHLnE3Pvccv1QDKPn+/Z2m?=
 =?us-ascii?Q?qyGYV383+2esiR1CVVwuAFtJS3ah1RJzciL+yZht3or0b2fB4hwlpU98j+FW?=
 =?us-ascii?Q?VI6PA7egG0nWt9nnv4diOSG711uvtAl0GvBd/VVKD2xoLC51T6z3/6oqbPLf?=
 =?us-ascii?Q?wNYnf8knwvbvvqnJrrbbJtJr+1FMi3gvHJp6yUvme2cYV1ZDof62fPZCgO8W?=
 =?us-ascii?Q?ZcWnFzbl2xDa/368XRriJE7PUg/pCnZmzWeXHi/Qc7MV8+HrlNZRYGUcgDJd?=
 =?us-ascii?Q?NPcnT4xfPvgNLB6vkpzotDaLTxeDiprKl9IjwgP78SUTPTKpdCOYp1dxVQ+C?=
 =?us-ascii?Q?S6EVRIc9h2vc4VfXhuhb9xjTvdbBCy7X/Wq5NKNA+TbjrOoRJmj5Inl/36F6?=
 =?us-ascii?Q?S0O/5AdkhllTVvulmuTznp7RMUjePs0cL8N/PfDTpYS7pkt+rEuqqWR3NFPV?=
 =?us-ascii?Q?xPI0ylmECY05Lvy0WszOzIhcxtx3FZGDT3nILMecu5yeYs9H7Z9HVHvPBll3?=
 =?us-ascii?Q?kNTwtb7Kx0Chvs2+m1rz7JS+ysWV98UuU0svv1OTf64vnI8kyZxJ6KqDNkDw?=
 =?us-ascii?Q?44xQa9kYrhwYj2lKJoUXLWYO1ykfqmVjlZic41LoqyBTvJzu8UuQsfZDq5l9?=
 =?us-ascii?Q?BeuQFoMfVAEPgVa19P10x8slQOL0tsODnE8vtI/Oh7Iw4fZgmtwe6QHKjFM6?=
 =?us-ascii?Q?gdla0UI+ymQpb5tCJA/o6jZShyX6Tfc5QRMYsmL7bqKdNy4pfRGy887wdJmu?=
 =?us-ascii?Q?hLbQq1TsFRkNLkcs2P3xEiVx6M3Cvd+q4IQDRHMR5CFhXHuSIgq7c35Hpog6?=
 =?us-ascii?Q?e6VK2N2sYWn0ZyaNoOsVgJ8U5FeLBh7vhS97mC4xGs8L5VjPxP7rRmquTjoo?=
 =?us-ascii?Q?JkIP4lon14IcF+nT2BLxHdGKAq9nEePJ7O03dTcuxzYJ9t0R/O5inwO0AHUd?=
 =?us-ascii?Q?xVaZuR7sNuBbyAU6d4OHmUh5y6wwFZdm15X659l21EVY0wldCHeKMCtxwmio?=
 =?us-ascii?Q?JfZrSkcn8ruJxlmNqq9PDl6KRdu6tNtB0eO/51ENQkVXcGy4INbtF22+WeCj?=
 =?us-ascii?Q?yml/PO4tRxN2T/ZEMMyCWuFkOGJA9Vhf+Lbwajcq56W0JY4+LkwNKdeuL7eS?=
 =?us-ascii?Q?ntDKP8T5Xjlf7a4DwN+jfbqfS+pUdKmihG4P5g7XHWj1oTW8da2HZ1WJAZbt?=
 =?us-ascii?Q?keHUXl/0bQdKwj2H31rtGCa//0C7Txq2zUKuthjJTSTsBV9keL45Fv5XOGCe?=
 =?us-ascii?Q?Pz7lJsWyWCGUFRKk87iR5KueLWeUgtDYXEZmQoyk?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c3ef947a-c79d-4977-2f03-08dbb6a04f5a
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB8690.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2023 10:33:05.2962
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cPsaDzpzlLm20+waFZ6jbVF/vfvaKY6URQowGQhYg/pCWiw4XqE75VMAeUw6RkmjUQjWdFx9UesMnB6UZixh3w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR12MB5292

On Fri, Sep 15, 2023 at 11:20:46PM +0800, Akihiko Odaki wrote:
> On 2023/09/15 20:11, Huang Rui wrote:
> > Patch "virtio-gpu: CONTEXT_INIT feature" has added the context_init
> > feature flags.
> > We would like to enable the feature with virglrenderer, so add to create
> > virgl renderer context with flags using context_id when valid.
> > 
> > Originally-by: Antonio Caggiano <antonio.caggiano@collabora.com>
> > Signed-off-by: Huang Rui <ray.huang@amd.com>
> > ---
> > 
> > V4 -> V5:
> >      - Inverted patch 5 and 6 because we should configure
> >        HAVE_VIRGL_CONTEXT_INIT firstly. (Philippe)
> > 
> >   hw/display/virtio-gpu-virgl.c | 13 +++++++++++--
> >   hw/display/virtio-gpu.c       |  2 ++
> >   2 files changed, 13 insertions(+), 2 deletions(-)
> > 
> > diff --git a/hw/display/virtio-gpu-virgl.c b/hw/display/virtio-gpu-virgl.c
> > index 8bb7a2c21f..312953ec16 100644
> > --- a/hw/display/virtio-gpu-virgl.c
> > +++ b/hw/display/virtio-gpu-virgl.c
> > @@ -106,8 +106,17 @@ static void virgl_cmd_context_create(VirtIOGPU *g,
> >       trace_virtio_gpu_cmd_ctx_create(cc.hdr.ctx_id,
> >                                       cc.debug_name);
> >   
> > -    virgl_renderer_context_create(cc.hdr.ctx_id, cc.nlen,
> > -                                  cc.debug_name);
> > +    if (cc.context_init) {
> > +#ifdef HAVE_VIRGL_CONTEXT_INIT
> > +        virgl_renderer_context_create_with_flags(cc.hdr.ctx_id,
> > +                                                 cc.context_init,
> > +                                                 cc.nlen,
> > +                                                 cc.debug_name);
> > +        return;
> > +#endif
> 
> This should deal with the case when context_init is set while 
> HAVE_VIRGL_CONTEXT_INIT is not defined.

Actually, I received the comment below before:

https://lore.kernel.org/qemu-devel/32588d0e-a1f2-30c4-5e9f-e6e7c4190b65@linaro.org/

At original patch set, I have the case while HAVE_VIRGL_CONTEXT_INIT is set
but HAVE_VIRGL_CONTEXT_INIT is not defined. But I think we may encounter
the case that virgl_renderer_context_create_with_flags is not defined in
virglrenderer early version. Should I bring the error message back?

Thanks,
Ray

