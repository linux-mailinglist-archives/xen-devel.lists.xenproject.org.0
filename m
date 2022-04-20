Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A4615087C2
	for <lists+xen-devel@lfdr.de>; Wed, 20 Apr 2022 14:08:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.309198.525221 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nh97s-0004UE-7L; Wed, 20 Apr 2022 12:08:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 309198.525221; Wed, 20 Apr 2022 12:08:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nh97s-0004R2-2y; Wed, 20 Apr 2022 12:08:04 +0000
Received: by outflank-mailman (input) for mailman id 309198;
 Wed, 20 Apr 2022 12:08:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=YZ94=U6=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nh97q-0004Qw-OV
 for xen-devel@lists.xenproject.org; Wed, 20 Apr 2022 12:08:02 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 861918b6-c0a2-11ec-a405-831a346695d4;
 Wed, 20 Apr 2022 14:08:01 +0200 (CEST)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2054.outbound.protection.outlook.com [104.47.14.54]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-24-biHv-SU1ML6odw3Mr6nGUA-1; Wed, 20 Apr 2022 14:07:58 +0200
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com (2603:10a6:10:2db::16)
 by AM6PR04MB6247.eurprd04.prod.outlook.com (2603:10a6:20b:be::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5164.20; Wed, 20 Apr
 2022 12:07:57 +0000
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5cb0:5195:4203:7c2f]) by DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5cb0:5195:4203:7c2f%7]) with mapi id 15.20.5186.014; Wed, 20 Apr 2022
 12:07:57 +0000
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
X-Inumbo-ID: 861918b6-c0a2-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1650456480;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RQNgLqHj4lUl/YuwhxSwiIYtXXvqVMvpbSA50HpAcBE=;
	b=mFaKtMNn2sfGtUSx7sk3NUnNShvAbueccqb/nioLvfG4c2OWMojzc01Rwd+mqtELQ6E+XC
	mVtPagxf0Z+IxwkXNtLeozATA8y283pQiPP5v7Q+g0hcXpC/Ta5bsbM0qlBxEq0XUyELRa
	LgNQbQInmFQ54oyEVSfROEIUTmdKTDA=
X-MC-Unique: biHv-SU1ML6odw3Mr6nGUA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=O21eGBGUfmO10XhCWKH/98fSe3C1GBxcgrmdK54GhRo2oWl3IYmz28svUc0toeRQfi3rhJENcvqMWiPKBfXMXlRkW4iGg3d2kGuAIb5p/iiVLuosG2PLiylW26YxIyw6Os4Zqz6yK35/s1mNXEa3s9RT5zEv6M1PDzh8XNFJwxAnWmvZUVbwYDZ8KAC/sGYyYJdKBHBbsePCB1KESUlE8+7kD2Q0fiZJboIQZ/gC8062O6ddXm+uiBMMYTItJG4KJ25ofFutbDOALtvX/EalIVylM1y6Oa/PgI+GS04K39tQsmin4nmYT65IeceKLRwKmVjnoFBERPlTsnZIV0juig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4/wn6ejJNHIEeQONgUARuPPeuAi929+fhMrD6sGHKZc=;
 b=AyCAD9B31W2b1WgXUNyXpBuoF3pQYfs+Dae5/ZfSUGf+1eTCy88fOyfoENDFFTBwx6R8pPoExprki0cbD83Ua1lRJVh0kugGanak85nm+RHuBjMaVlgi9XfEAkaVlHNYxJZUfbu1zr/H6ENFE9risYb6OH87pG6d2Zbw2zmD4Omu88vqxJVdEHRDdIaoRM6SE/yatWjkUyirmAgJykO+QMkGAIMl0QZuS79mlAjVdn2I5d5Qw+3rgs2vhT/o+1DREFeQVwKtwrRHIo3jUnmhsaL/QPHcY78Frg+PazJSVCw4NKznU7zXne5dNbgrBHnka4Ri05RSMpaFSovidFzK6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <0f3cdf75-e6ae-1c16-a4db-9d7a54bf89ea@suse.com>
Date: Wed, 20 Apr 2022 14:07:55 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH 3/3] x86/build: Clean up boot/Makefile
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
CC: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20220414114708.4788-1-andrew.cooper3@citrix.com>
 <20220414114708.4788-4-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220414114708.4788-4-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM6P194CA0083.EURP194.PROD.OUTLOOK.COM
 (2603:10a6:209:8f::24) To DU2PR04MB8616.eurprd04.prod.outlook.com
 (2603:10a6:10:2db::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e76ee1c1-383f-48d3-ba9f-08da22c66830
X-MS-TrafficTypeDiagnostic: AM6PR04MB6247:EE_
X-Microsoft-Antispam-PRVS:
	<AM6PR04MB6247DF4FC1A45C16D1D33E64B3F59@AM6PR04MB6247.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	vYX+XYAmjh9QOng0RMcUmrKPVMeJSK+boXYfE1BcJ03Th4J6lMTqtjsqkotsfBIrIwbB956FZm5ymdxW4+q1ON5vq3VOf46wyzGUFEvPqdZtV79ziLKxkfrKS6pBsIju6o2YawPjAC1jKajNFUiR/mWFW5sAACBv+quDwWDkgNix2J2gmGtVW9llf4TLHXGLyLylw8Jbc4XYPQ/BDGpkXfZupsLJQzH0FUbFc3COrCkidmJThX4FM8rB6VLiQTy+GazJGwFb8CF7SsObDILhrQgQ3JhVEdTuq7aBLhc2W91ymYZXbQd7FgciiCvU327RbwjpyC3Ox8lXJE3zxIW4t0hPTjGuSneFivlIlUyPSPyLSXEXbMh/+6EYtjdEadZjo5OOOJRomujJg14SfYYyw6y8zOTe+ctDl4Lj0oMgYGmQSf0f8JYiPLxsgKRKQV2gykN0JrcDheXy+NYFj21rOgfn6VnlHfF7pUuMmyd/gyoMd3U0KKjqf8vEi5eVZBUuplEOsJYSHrqSBSdR2/hCdoiyKXoB57OisIPr26gt8muzZ3DOKvmsJUrMrEDE1leLZHU35uz0v5z/TeGNYii7zG+RqEE2+GhEgI1JjKqfvxwwR56F0909SLtGsSKYipsvxxbK2BOySct53fzeD8h5CEM0yMhLUIioaICCk7G8oiphyr3QMBvfIyek3dycAUJfjqJkMVd/dEuhsIjEjDdEFZRTiRQNLQjhVxadBKLsmK8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8616.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(54906003)(186003)(6916009)(31686004)(31696002)(26005)(2616005)(2906002)(53546011)(6506007)(66556008)(4326008)(66946007)(66476007)(36756003)(8676002)(508600001)(86362001)(6486002)(8936002)(38100700002)(316002)(5660300002)(6512007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?zERnc7DRgMpWoou2ymomef2d4lcsCWTjoZkqzdyxmsjmt/4TiTjWL0Ta0SUu?=
 =?us-ascii?Q?mC7aBp9bBq3LtX9+sw9l/wCFn4vuVqvhHbNGRgPMG2d82jt6vHmXYPdJH20+?=
 =?us-ascii?Q?EC2RRbDoaODZP67pLBYV2yAOPwaxHxe6cAA3paIk8sYIwYc6PiVPByCuTOc9?=
 =?us-ascii?Q?Xjeyw2vvwaWjzUu75hqCjJhxMO9CTFfcQ7miejuSqHpVF1oqnHpKK0YoWOIb?=
 =?us-ascii?Q?978ZaOdHkNYBQgzOHBs+0gt5XmyxYymM8MM8BvuD1ZJdkirz/uKjuj1KLp6g?=
 =?us-ascii?Q?8ogVzeP04+EyxpArScTFGziIaq0ndtgL1cpVxTmP6omIQn0XWVg5pOSV8sdr?=
 =?us-ascii?Q?aVrO/VUIZPAk8GuaS7lkI5oa1jirqdbo7QAc0GdbfCb2JcCosTBAYEd1PFfg?=
 =?us-ascii?Q?2zLHvEBkts6eCHDrLOILeqbJQIPMwpWfC1YfXSQ1nK0ZXWsR/yyCaS12ZdrJ?=
 =?us-ascii?Q?IwGCCcuJ6nWZLtjvaoZa7o7v8wCwfOXICnXSAv7Tm2J8K0n65xbJxLgeA8O6?=
 =?us-ascii?Q?XpykPoy5/X+wlSm1ALNAcnVh6q/3jtA+wgRZyuqJ+k/iG1du590LTNqBhhpb?=
 =?us-ascii?Q?EBX+LCJ7jp3PVi9HsJPppv2dihhEGTrYK0te1qroSkHpms7f69OCvdU8+hMm?=
 =?us-ascii?Q?kPcgP/qr0jaXyEIjUtb0njl08VMBQBBXXSbzYCuUJXXOcB05b0cPRtXzrLTt?=
 =?us-ascii?Q?d4A3yfKvyzz8Ccqfj4kY+PS0K8AKrSrC5U6OhloKlXLc7tF27YgXH3suVW6u?=
 =?us-ascii?Q?tg8cixo3N5hdiueJKEpx8wnzZJ4+AIcUuWRCWYUSR3H224oAPOKaqqi9uUeU?=
 =?us-ascii?Q?bbYccKyFOW7ktcDj2oZ2o6NkjsWFCTvBtfDeg3saAJJOtxQ0sSkaozU40j54?=
 =?us-ascii?Q?vPt0DhVfU1RmLzwJlLkTYoj11KVQ6FXx7yldW3asPhWbO2ukT4d7OF1PQUnM?=
 =?us-ascii?Q?1Xs+XHO/vuTEa2LUcnaQHfxfWwp15tdFK9bB/4U0lTv3BdiauUBCGvAcVgoX?=
 =?us-ascii?Q?/K+tUDZfw0RmToEVpRR0vLBmTOp2IVb2SukhnYyHc4pbRbNSV4Wj9ZQQnpeK?=
 =?us-ascii?Q?U/reS4fua+ssrIO3D7RuLzGgnYtIGScKXgS6/FNBiVZ/g0cPFIdN5JQW3bDK?=
 =?us-ascii?Q?u/qWIhqOCoXlps2oztm9PdFZ4zye4LI0Jxr9ZFA2mlyy3eLYbX0kN2MEk/Y2?=
 =?us-ascii?Q?THwQC7GbzRu2Od7CsSiIEUQ26wmgPLwmgnyfgjEuse6IoS0knUoex2Wo7OJQ?=
 =?us-ascii?Q?gJiAvM/8rGS+AZGur56ihIj6kVEofv/88qsDtnZC6YYLmAT8s4LWDnk2+bWy?=
 =?us-ascii?Q?c6Img1osByzYqhs8uUHZfMBaqn46Zm+zfhdUKvlWvAY9nE+x5WI22HA6qQo/?=
 =?us-ascii?Q?VLPfBdM+nHV5yxW3tcaLarNCS5g92sMU+pWkgcs+yKaTFUc9oCZEGNu1SQZY?=
 =?us-ascii?Q?BBBQX56rZ7RMEceVrTwRRhyJPjjnO0jg5JpnFaB+pCjyGcfwFWEaaHdQUEuC?=
 =?us-ascii?Q?INoAwKs48yAD9eSpN5azbfW9F1pyB1ROEhKazCqmNHlRQ71NgvyHsWMMfnDS?=
 =?us-ascii?Q?Tf/LtVfdxvJaPGKDUvDZEGKGV943qXbUDUydowzZAUlQo2Gz0eps+vzn0CwZ?=
 =?us-ascii?Q?KyEazWMOW8l3lIqKGXoBlnY5ZvrzkLBw6HRrkPWFIaxb6O5p+4RVZmltlzW3?=
 =?us-ascii?Q?HtAUghLw0Sp6zQYBuPSulfs+AL1cjA5w1zpZ12PknjAJDVSpJDyCey5Z/P+d?=
 =?us-ascii?Q?eAfmNmeV1A=3D=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e76ee1c1-383f-48d3-ba9f-08da22c66830
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8616.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Apr 2022 12:07:57.5114
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yxElzqIncDCZBBYXuXGwDsDfEDlLdpDW+a44pL9pFJjd/5ec8Mnzdc5YFUCPBj6+WBh1K3YuaRbGA4ngYxhVCw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB6247

On 14.04.2022 13:47, Andrew Cooper wrote:
> There are no .S intermediate files, so rework in terms of head-bin-objs.
>=20
> No functional change.
>=20
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> CC: Jan Beulich <JBeulich@suse.com>
> CC: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
> CC: Wei Liu <wl@xen.org>
> CC: Anthony PERARD <anthony.perard@citrix.com>
>=20
> I'm slightly -1 on this, because
>=20
>   head-bin-objs :=3D $(addprefix $(obj)/,$(head-bin-objs))
>=20
> is substantial obfuscation which I'd prefer to bin.

Would ...

> --- a/xen/arch/x86/boot/Makefile
> +++ b/xen/arch/x86/boot/Makefile
> @@ -1,16 +1,17 @@
>  obj-bin-y +=3D head.o
> -head-srcs :=3D cmdline.S reloc.S
> =20
> -nocov-y +=3D $(head-srcs:.S=3D.o)
> -noubsan-y +=3D $(head-srcs:.S=3D.o)
> -targets +=3D $(head-srcs:.S=3D.o)
> +head-bin-objs :=3D cmdline.o reloc.o

head-bin-objs :=3D $(obj)/cmdline.o $(obj)/reloc.o

> -head-srcs :=3D $(addprefix $(obj)/, $(head-srcs))
> +nocov-y +=3D $(head-bin-objs)
> +noubsan-y +=3D $(head-bin-objs)
> +targets +=3D $(head-bin-objs)

nocov-y +=3D $(notdir $(head-bin-objs))

etc perhaps be a little less obfuscation?

Jan


