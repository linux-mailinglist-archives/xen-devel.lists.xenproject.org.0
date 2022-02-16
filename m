Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B283C4B84B9
	for <lists+xen-devel@lfdr.de>; Wed, 16 Feb 2022 10:48:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.273896.469199 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nKGuk-0000bs-Rz; Wed, 16 Feb 2022 09:47:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 273896.469199; Wed, 16 Feb 2022 09:47:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nKGuk-0000Zu-OT; Wed, 16 Feb 2022 09:47:58 +0000
Received: by outflank-mailman (input) for mailman id 273896;
 Wed, 16 Feb 2022 09:47:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Gpsw=S7=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nKGuj-0008SA-89
 for xen-devel@lists.xenproject.org; Wed, 16 Feb 2022 09:47:57 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8492ea3f-8f0d-11ec-8eb8-a37418f5ba1a;
 Wed, 16 Feb 2022 10:47:56 +0100 (CET)
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur03lp2059.outbound.protection.outlook.com [104.47.10.59]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-5-92T6N7EaO1GhpZhnwFmYWg-1; Wed, 16 Feb 2022 10:47:55 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by DB7PR04MB5994.eurprd04.prod.outlook.com (2603:10a6:10:89::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.19; Wed, 16 Feb
 2022 09:47:54 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65%5]) with mapi id 15.20.4995.016; Wed, 16 Feb 2022
 09:47:54 +0000
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
X-Inumbo-ID: 8492ea3f-8f0d-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1645004876;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wrjV+vLVA73SOFP6R3lpOVxB9Z2Z5MqTybnTbxuoqRc=;
	b=hK3PAYnjVK63ZQMoa/n6HBD5hZ2VifI+L/PvggZTTjg32BiYaGAepTH/T5S/IxSNMDcKdc
	/fSlIEVqJq1WXwGvbSdyxbmiQcomdcYqHxsRSRivcgBKzMVebhigMsCKGpUBpMYEnOsgxQ
	cM12YzzWx4G5JjzSXb9kRrOOO0TpviM=
X-MC-Unique: 92T6N7EaO1GhpZhnwFmYWg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=k4g78f2Cax6A/43wI2u6/tlL5quJzjcSQ7rNZzbesQoick+YS6QaMEN3qSIByCGRGAdf7T7mbcl9qn6RyIAAkArKZf5dn0iFWLtf9iEc4iNN0B1HqPMvlBmlmHWBpe/AxK4mFa/0Uvb2T+xg5js1Q38W1IJTG4zg9eKHHzzlohoHH/soW9sGNrKVBtBNf5V9VvYoAVpvyh3I6C0NszmLYE5bviKuTUULq4sG/WekikhZfaRsJJOO0cJgi9aCBPZT3svCeknJW2MW1LO7drq0HY9IpBKJlzbi6PloHqEkClB5ZbHkv44MP3Dnmyl6hlxp1v84tfJToSNcGmGWR6jhmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qJlSCB8e43RnlrcgLKPcBNvQmylBelKT3Fb3SbRaTxw=;
 b=Hqulem0vlLnEvjgbgpB+aFmX8Y/W3P9k2k36SYw8PUFlzmixQ9n4Myem/YhYnhh6YPVYlgFIE6vutRMjHDqEva9/EPBQFvsPuJPfDZinW/OMWchGi3GFcAV6gCqAazdb3s5yK82xIlKTI+SLbK/D7CebmtcLr2AkVyQlQUZBfeieUb3OCtki3T0sBPQMbSFk/GJx2t1l87CUowx+cTsqblGjj0wgOdSC9Iox9Ezf2Nqrm91kJe3rC6k7q0rnBW/lPJugoZkBj1b5mx1aeBaTsfvCKOfJ1xJEJigArD8Ygptm0Ix9i8aq0nFq/bRmWqMcy2T+Yvhr02K8X7Skjr8j4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <c5657f85-e3c4-9c39-1a67-b5162b1f86ef@suse.com>
Date: Wed, 16 Feb 2022 10:47:52 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH 2/3] x86/clang: add retpoline support
Content-Language: en-US
To: Roger Pau Monne <roger.pau@citrix.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20220216090300.9424-1-roger.pau@citrix.com>
 <20220216090300.9424-3-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220216090300.9424-3-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM5PR0202CA0003.eurprd02.prod.outlook.com
 (2603:10a6:203:69::13) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: aa400f62-252c-4093-78eb-08d9f1316759
X-MS-TrafficTypeDiagnostic: DB7PR04MB5994:EE_
X-Microsoft-Antispam-PRVS:
	<DB7PR04MB5994F0661C541A7F8DE3677CB3359@DB7PR04MB5994.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5236;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	W6fhF5XdFec4s2ZnLhLClhjGpmiiiAUemqMcb3/mPh1GWnzuXLML3jtJBPwUkwnx6zEk7N8hE+yGkXl45coEKPkY+w0fJryVrqJ+djA8vObvBO8t8ZKOd9AKvAd6GkYcL6FfIAPqjRCC655YO5Al6NuGqR+kA2VOv2UqyZ0OoJ+MrfLmXNPyS/eqLY/bEeFAXzvRsBoBudSpvtHbCwc7lQ0nQvysPY3uCgux2jPPNa9JTkvl6u5mRFla7q1y8eiFTEVBSLb7dadpZoIZgl/O1aUNI1qOVPxuBo6izn7xIE06zaGEi+5/CNT8UmDyV0bgoE/f7jqAkKx2WRveYzo7xqKEy/i65Vm5KY2j52dy7aQtxRAkwkKTUvsgz4l8EtSiOyAzgn4P0hT8BkCD14EihrBYYxiSyRzc0mwT24EFQxvT4S5WBRAM/sRBE9Oa7wwB7SiPlC9XreVyijukTCIJmG1kjmwdt1K8+NUEAxuJMOat01xekcqlqm5ZU+FF8ctPRc2gPTXGWP9u5LRiMbI9njlUwTthFDniFp3Ts9sJG7fuW/Q+jXkQTa8rGLs5Cm2DG0oqkevpiRwoe2NpsXApoPrmvOhIyQPOPRl/adD8w03mmEgoSkozkD+4hlUSV5QCuVtbRylVfLycgX39MIk/hKmmHYJngBXlDu07ZV1lKY+We0WJe2+u+mREG+M7k71Zy4EY9vjUowv2w6wmJcgm9FW0mpH1fknFK7wnsHrQ37ph84sUGe3oTtBSk6EuQLSC
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(38100700002)(2616005)(6916009)(54906003)(508600001)(316002)(36756003)(6486002)(186003)(6512007)(26005)(6506007)(31686004)(53546011)(83380400001)(66946007)(4326008)(66556008)(66476007)(8936002)(8676002)(31696002)(86362001)(5660300002)(2906002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?mVCp5+D0/E9AVwh9YEYCMKiSU1jaLb6eb5vW6ReERGs0/oOXJQZTEg/3tqUr?=
 =?us-ascii?Q?VIxSfJd0VUUa6xf59r++k8yuBRCGMTOI9kgR9aLM10mH+5ApjXLA2cCGmcp4?=
 =?us-ascii?Q?hSQZCD379NZ8HsKuIcEx2RPDBIpi70YaHYLL1VOB5UHTORj2EOgZy15kswj0?=
 =?us-ascii?Q?6wZc/jU45it7kwdtqHXYq9DORFJ5zjQah4E9MIr9g87w24f8cNtm1ovBajpr?=
 =?us-ascii?Q?+JCbgioDBzmrHrUiHPki1GyJYMYrla33Wb9jP8opFPf8ktKoSEPp2o9scUxu?=
 =?us-ascii?Q?yjDc0otm8825cvAoCVBlcDFLe5+Ato1SZsc8b8n3pZA9bq7gkFYFuiPx/VyY?=
 =?us-ascii?Q?YZcWxKZS9AXdMFoQJyvvzyKI5bw5Xitetp7SVAeuNylr4Kcqeg+GAlQDsW1q?=
 =?us-ascii?Q?6YedW/5cYQaBhWpLbNlRagRIm2UvOGF5XOmIIXiVdJsCam0dXK2z7pKx2L7y?=
 =?us-ascii?Q?pzUvLFddih4DfXytL8Am9ebDeOWEz5DlYJvt9FvqzKKHb2Se9CfOwKzkItSV?=
 =?us-ascii?Q?ZieKRPZVHlGHmbbQnRhvAK/oHruSd7Nj0KiQSf+8K3Rgb/U9Qnu6YaqdVi5A?=
 =?us-ascii?Q?puGsuVXI9KpvFkSaKh+8Afloy3bq+VBs8GLmkN7BirNyHszhFdiA+BOLxuAC?=
 =?us-ascii?Q?7UQP5yZ28ihSCII13NaAEcQQN8hZLH9buUmv2GIyEGDYeGrZXZvDkJMj0LPB?=
 =?us-ascii?Q?0j7S//Urm9olHw0XPNylbOJBoEX9447zNTbPS9O6wedcXAMHZ79ZVecskNEA?=
 =?us-ascii?Q?x3u/7QuoOHBjMOB6rcN43FNIxDJv30FuirsOF7vBm/cDp+HJT0GjVb8SNNts?=
 =?us-ascii?Q?c1vfxyaBC8IH40x1qn7E3NLy0YMunpbZGxFnCYCO7MSmU6Qoy1bNXsLT8QAr?=
 =?us-ascii?Q?cY5FkixVfA+XTe8NDV5Hw42NUK4Q77rxE+KuORIqDQQ4VwgHxO3hvRziF2Ss?=
 =?us-ascii?Q?6MjJPGxGEay1fo1L3wr1MDGDtLqPm/d31wOLfCnUK5u2hg08G69lI+LDlqzZ?=
 =?us-ascii?Q?hn9cCsin60qPhJszdgR9t57dI7Qq2B3SyBVbEa4xR8Bt3BbCuQDuk9AO8ndi?=
 =?us-ascii?Q?VuKHZ+KHWmUZqAUF9EBoS7FwiokLuKdpN0zvPJAaBODDaZtwwttG9SqOAIhV?=
 =?us-ascii?Q?jdwP9PW7d9rg9nsAgHc5xZETuagUPLg6Q7MXLEDPVkGzEKRo676npTJ6z164?=
 =?us-ascii?Q?8fo0L8vCYXfSO9TRrKvKL24/C6mxj4MyRM/s5bNZJZ/llHwDeFGA6sKmnNAl?=
 =?us-ascii?Q?sEdoSMu4CHCNisJHRT2YXH+hCQfrWkD+Cxu2OQbxNP+VChvhObKWQ5eVDmnW?=
 =?us-ascii?Q?Vu8fug+OwHc7eZvkSvIF9ecKNe5g/Hlw/m1CQYY83st9Xgl11mZNvbPY+vT4?=
 =?us-ascii?Q?CflFseSga0EoqzU8xiTvCTuGjL+/IoX7oZn5j7uCCMneQ5IcvQztzuzt5qcq?=
 =?us-ascii?Q?ZnSlV+jOW0v2Y40cJxpha+QRfmHOfT4yxtrQvVnXHEYRF5+DRDkCS9E3tsn1?=
 =?us-ascii?Q?aF877RNL91wEzcOHXrIPj0+HakaAsGunji2d03lLyb406Ri1NajLmxFZ4fn2?=
 =?us-ascii?Q?qwv0aGsjcVWB2UhF+sfUxpLsVgomBC1hQN1fWHlseiB1K97Nkl6cDt5/+7xj?=
 =?us-ascii?Q?nN6wAKwT+1mayISRJBmVzFs=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aa400f62-252c-4093-78eb-08d9f1316759
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Feb 2022 09:47:54.0337
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: U6gTZc6BS1BGkNKZI9ecz5cCceiZvTZF38Bz7Y4bVftVdDkUefHkt6jaxVIB40XltrwQMa+I73TcYO/JPAZUQQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB5994

On 16.02.2022 10:02, Roger Pau Monne wrote:
> Detect whether the compiler supports clang retpoline option and enable
> by default if available, just like it's done for gcc.
>=20
> Note clang already disables jump tables when retpoline is enabled, so
> there's no need to also pass the fno-jump-tables parameter.

That's one of the secondary gcc side arrangements. What about the other
(-mindirect-branch-register)?

> Reported-by: Jan Beulich <JBeulich@suse.com>

That's Andrew, not me?

Jan

> Signed-off-by: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
> ---
>  xen/arch/x86/Kconfig | 5 ++++-
>  xen/arch/x86/arch.mk | 3 +++
>  2 files changed, 7 insertions(+), 1 deletion(-)
>=20
> diff --git a/xen/arch/x86/Kconfig b/xen/arch/x86/Kconfig
> index 2cd713724f..fe00b4598b 100644
> --- a/xen/arch/x86/Kconfig
> +++ b/xen/arch/x86/Kconfig
> @@ -35,8 +35,11 @@ config ARCH_DEFCONFIG
>  config GCC_INDIRECT_THUNK
>  	def_bool $(cc-option,-mindirect-branch-register)
> =20
> +config CLANG_INDIRECT_THUNK
> +	def_bool $(cc-option,-mretpoline-external-thunk)
> +
>  config INDIRECT_THUNK
> -	depends on GCC_INDIRECT_THUNK
> +	depends on GCC_INDIRECT_THUNK || CLANG_INDIRECT_THUNK
>  	def_bool y
> =20
>  config HAS_AS_CET_SS
> diff --git a/xen/arch/x86/arch.mk b/xen/arch/x86/arch.mk
> index 2da4bdb1ed..f2aa2a515f 100644
> --- a/xen/arch/x86/arch.mk
> +++ b/xen/arch/x86/arch.mk
> @@ -47,6 +47,9 @@ CFLAGS-$(CONFIG_GCC_INDIRECT_THUNK) +=3D -mindirect-bra=
nch=3Dthunk-extern
>  CFLAGS-$(CONFIG_GCC_INDIRECT_THUNK) +=3D -mindirect-branch-register
>  CFLAGS-$(CONFIG_GCC_INDIRECT_THUNK) +=3D -fno-jump-tables
> =20
> +# Enable clang retpoline support if available.
> +CFLAGS-$(CONFIG_CLANG_INDIRECT_THUNK) +=3D -mretpoline-external-thunk
> +
>  # If supported by the compiler, reduce stack alignment to 8 bytes. But a=
llow
>  # this to be overridden elsewhere.
>  $(call cc-option-add,CFLAGS_stack_boundary,CC,-mpreferred-stack-boundary=
=3D3)


