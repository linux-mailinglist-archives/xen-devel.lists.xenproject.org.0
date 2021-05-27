Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 24DD43929F0
	for <lists+xen-devel@lfdr.de>; Thu, 27 May 2021 10:48:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.132920.247865 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lmBgp-0005gb-Pa; Thu, 27 May 2021 08:48:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 132920.247865; Thu, 27 May 2021 08:48:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lmBgp-0005e5-MJ; Thu, 27 May 2021 08:48:27 +0000
Received: by outflank-mailman (input) for mailman id 132920;
 Thu, 27 May 2021 08:48:25 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ln4B=KW=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1lmBgn-0005dz-KM
 for xen-devel@lists.xenproject.org; Thu, 27 May 2021 08:48:25 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id eb2aa845-59ba-4295-bba0-b619b18ac5c7;
 Thu, 27 May 2021 08:48:24 +0000 (UTC)
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
X-Inumbo-ID: eb2aa845-59ba-4295-bba0-b619b18ac5c7
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1622105304;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=Beyw+hEbY9USWAxOm7hXs8j+8jjcDpFd9xQhJ9P4pFE=;
  b=HZH7C0LfWwwQaWP1OHMJmKTNdOEjJytaUIrMurA9kfuFO8RXAP3cTe25
   W5K/1VRzWIRAe9oCMCI5t7rxfVzpHFvsSn5tWsxpFQ81YTsSyH9Ig7A6V
   OoezmEKnBaheaupw62Ze0zFSY9ciNnJmHhua8wAXAJsxfF7/T+BJzmxdJ
   o=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: 7bmBOuYlJZzYUcFZkl6m+TJ2wbMpjiHV3wGxbSmzzPEtsBeMeUhQ/eK5KEXea5yUss8LZ5zvqj
 o7E4dV37AqT1cC83BO7/hQLtB4HqJ6oJZERyDlZZufgISpIzGyWUgO0X46P/f6bH+mLM4oY+nR
 NNbEmJSCosd+yAvG66L1+SkCdI04rcPuffjKaOwgdW3rVFhfe64EKa50WEjua4WZcAGllnJCzg
 actelCFBHcDmE05STmuANBwuLSdHDMMGsVZQH8UcEtrYltCtkveHZELIJeKhD5HonGhDZOahER
 /NA=
X-SBRS: 5.1
X-MesageID: 44750877
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:cR+ELqwhKKPFRfSGemC2KrPw2r1zdoMgy1knxilNoHxuH/BwWf
 rPoB17726TtN91YhsdcL+7V5VoLUmzyXcx2/hyAV7AZniAhILLFvAA0WKK+VSJdxEWtNQtsJ
 uIG5IUNDSaNykfsS+V2miF+9ZL+qj5zEir792usUuEm2tRGtBdBwQSMHfqLqVvLjM2fKbQjP
 Cnl7d6TzzLQwVuUu2LQkMrcsLkvNPxmJfvcXc9dmIaAFnnt0LS1FbieSLopCsjbw==
X-IronPort-AV: E=Sophos;i="5.82,334,1613451600"; 
   d="scan'208";a="44750877"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=R9g/rvRQqWY5aFhH30Cqk1YnvprtrSho+zCLM4wO3X+ZHejp6ihiAsXDLIsGfE4d0lv2nOpMdD1AGWNC3jobj6r4/OgFfO8mhxVu/m+3e6ibG1F+4peg0Y7FOnsMB3GrNqCfs8XBaIL7X+u+e+RcCnXoDC4ANpH6tHzSSxVxRvqZ9n+cFk9+2SEWxNMExwunIaFwxPQSDZ4YOJzIcDpxZ0fzHLjbJy8yb/zEGlOKcEEg/lJWyA4PUGZBvdKDbGqGb6zuLV1dvlvlhH2+mJXuW2gUd+SOBunS8JN2581rfJMl+QprpDHE8f+PtW7nafKqNJXY/97NhECQYGon/Sh3iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XQqVaxQLPw9y9kMPbzlGNFefFRnsW32OmqEdEk3O22Y=;
 b=NGL5idLh5MgIoxz4VWJ2lxYu3D/LwHAAhRQVZL6x5XaO6d4PKeuqLUYTZnEtQu5bid5KMTC9YfCPlS1MC7vQ7SeDqus45zbMQm+NFdT73GleU8Qq6X43vT7ahjrclWOLiihGCM8YCIErSWxKPO7GVX70LpHNBhzj4oY5XOOhwSnllIjZeoSH308ui1XA6hqbegmAdwo47f5+3YOhveQIyw6Vv2jlUivpUdPV6tzfunTqa2SC3xrnehWbMLUJXMVOAwQX+wQafmu+uWddS2stOeLvjJKuLiPw29NqnfAlzqvhk+/r8w2raGAYuibbLOUlzQPjWJxqcYbfGBPBExkzrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XQqVaxQLPw9y9kMPbzlGNFefFRnsW32OmqEdEk3O22Y=;
 b=IoCpE0zSaLH0VV9iRFeREpSh4oZhi/rI8hRRSDZCjrWXHgiEVH7GaPFAbRnXTwAh6R/IavO1coZyT+XVLj8C0vqC3V+fU9Mi6vFdywhbWGMbJvu7+HkBOEVeheptXmThE57wFNmhn11GdhCRWgyvB9dqA0RkWoP/l5n7J2UrRDU=
Date: Thu, 27 May 2021 10:48:16 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Andrew
 Cooper" <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>, Julien Grall
	<julien@xen.org>, "Stefano Stabellini" <sstabellini@kernel.org>, Wei Liu
	<wl@xen.org>
Subject: Re: [PATCH] x86: make hypervisor build with gcc11
Message-ID: <YK9c0DaIEo7uZ5Gk@Air-de-Roger>
References: <ca7a78e5-2ee9-4109-7905-3b9186475f3d@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ca7a78e5-2ee9-4109-7905-3b9186475f3d@suse.com>
X-ClientProxiedBy: PR3P193CA0029.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:102:50::34) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f7bf46f9-12bd-4bed-6337-08d920ec2de3
X-MS-TrafficTypeDiagnostic: DM6PR03MB4681:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR03MB4681BFFFCC1413657856EE188F239@DM6PR03MB4681.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: DQKGlp/MhFKsrk2V1mWWPlm6aD75W/slggmBF0opMZR2VH/l2mp1yxPXHYJ9gFNqnAG43LRGLSpTNzR4cuwZnvYG/IFWAfqwhYe5Gx+SQ6IW2i2tD6Ah7RYeLKcQXSaaOlVkrVfw/2/Oe0PIRrKVxb5fwteyl/GRKtjk25Nij8S0YifiejSxe5+lhvF9i25KrJQfFrloXu8Cz7Y3xwMnYS5Klys4rvBq6OWq6hbPVkD4Gg2/Bt3Era8VWTeC4OiFHKvzmympUfu5c8JniRFP1qUCKnRxNOnjVkVveHyGjoxvWE7hmEinsY4Q3Pbj3m2NfcazGSPNjwzcAxo+3nIBliA7Rs2GFy033RlhBZ5TzSxLR74+Z0PN6zi4w1HelDCJ9PDP3eSghub5DcjZRia9Iy5JWeYadO2MYGEyhUR/547TRP9zn3B5El5VtSqEd/KHdOHK6gLjCN1ICMXAPRD79SpTgNcYEmIHTVI525Ml9Yc4eKIWbYFV2WgjFMCYroJI5fmnbTVgcb5s1+18dV4CG0z2hIJm3k+Qc2Qts0l2fkoT2fCWzOnROIuYdDz2tqO0K2KpGRhw5DWVB3GEZAzFWaJ+SIXSAmZuUp1/f8Ivfs0uo8ib2awmC3a1fEMsq2e5exv+ka+2j3XuoSrro50MNABs3uwCp4F4H7bvNHYIrF7fcXoioV2dH9fvgQ4Ti6PqvBdu6ev3W+gOwkAewZ8ER0pZBN3n8eGsIJLYkwep9LY=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(4636009)(366004)(346002)(376002)(39850400004)(136003)(396003)(6916009)(956004)(85182001)(33716001)(8936002)(26005)(6486002)(2906002)(186003)(16526019)(38100700002)(6496006)(316002)(5660300002)(8676002)(4326008)(83380400001)(9686003)(66946007)(66476007)(66556008)(86362001)(966005)(478600001)(6666004)(54906003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?L241aFYwRWd6bzNZUlgzRHNxV01wSWNGTjY4cTcwTGYvQ0tCVHhjRWV0RTlx?=
 =?utf-8?B?Y3ZJNHBObkM0OEU1N1crTCtkc1ptdlBuRC9tMGdxd0J1QnJyM1hIMmpsak5F?=
 =?utf-8?B?Rlp6YStGcTNuMWd1MzZjNEJFK0YxNkQ2THdyNDVNOUZJRGI5QU1wUXM2MHY0?=
 =?utf-8?B?RkRhanZtdm9namxXMXdEWEk1UlRZRkZCbHcyS1YrdlQ3Vnh5MlcxUHZNaHA1?=
 =?utf-8?B?MFl6WFM1cmVTVG8zL1ZFd1oreHpDaEZ5cmw2WG5OTFB0emNacEZUa1h6dUFT?=
 =?utf-8?B?K0h6MWkzUHU1bFFDUE4rUnFTWHVLRVV0eDZYaFRGckNRemx0N2dhMlUyWjJT?=
 =?utf-8?B?aGRBaEhySlRBV2hyaUVFZGx5c21JU2pXM2lveDBlRmlNU05Ob2ZjUG5Ga2Mz?=
 =?utf-8?B?YUZrVkZqZkJac0I5em5vOFM5aHY3Q1hRVDRtRllrTUdBbk1tQmNnU2NmRitF?=
 =?utf-8?B?NGdGWUdrUnJERXRBL0kzSi9ON1ljY25GajdBaHFuRFYyNFIrQ3RaNy8zbUwy?=
 =?utf-8?B?dFB2YUFmNHRsSU52RGN6bDFvdjhkdVQzM2xtMzRkY1RoVDBPZmVKc3RINkZK?=
 =?utf-8?B?VWZrWTRualpGRE1YME5XVVhjVHNRbVlqZzNMZk5ZUlFEaXN6cWU1OW9BczFu?=
 =?utf-8?B?MmYrbUZTbVdtbUhWOE1zY2FTRTJCaEpoczU3Q0ZudWFmUkxaZFFhdUJRZnFJ?=
 =?utf-8?B?NjJpU3BWSmV3N3YwQ0hwZ1dPOCtiRi9BS2ZJVUlERTJqZXFweHloaEJDUzZL?=
 =?utf-8?B?N2I4RUFNdlIzMk9zcVg5Q1VjR1FJYldaeEo3cjVEZnlHV1RjMTVRWno3cEdv?=
 =?utf-8?B?VDdIQmhBQkRTTWxWWWdHRHVqWCtoeSsxcFo5TGZLdHhsK2wzUmd1bkFDTW54?=
 =?utf-8?B?TTdJcGFOR2FkQ3VzcWxKUkRVdnoxUDJ0UzE0ZjhYVmhvckFLcGVZTmg5VjQ1?=
 =?utf-8?B?RU9udlZzYXpEbTZVR2JyYitzaU5Rbmw4OFM1UU9DVkV6MHozcnZueS93MjF0?=
 =?utf-8?B?Qysrbi9sOThkNjljM0g1NHUwTGxJY05XdkdIM05TbUZhTldWTWx2eUpjZXdo?=
 =?utf-8?B?NUNsZ0hxc29Wa2p2K25rQlo0eUVZUzh2aCtNVTUvME9lY1VxM2MwMzVEY3RB?=
 =?utf-8?B?WmkxV2lUZGFvSkpKd2x2QVRDQnZ4U210a1BFc213VFhBOXBhY2NWbHNFOUN2?=
 =?utf-8?B?QzVRYzNtTURZWUdmQ1l6TkZlZDBtU0x0c01lRmhXZ3ZHMEdJcG1pY1pHbG9w?=
 =?utf-8?B?ZC9lVDBndWRaNHlGMjkrUlFUMUpwSERZdi9EU29vK1EyVWYzZTJJYkYzcms3?=
 =?utf-8?B?QTQvR3dxQ2d1WVJTYUwyRnBVNXl2SWd4Vmlsd3o2aC8ySTBZanF6YUpCa2Fh?=
 =?utf-8?B?Wk9UaE82UkYrV0gvamRFUmJrUUNPSEErcjhSenB5L2hxNjgrOXVlWExjbzYv?=
 =?utf-8?B?Ym4yUmpvWWNVdWlwTDJWaXFydVo4clV6WUYrR3JwUnFFVy9tMUlJSWt6NzNZ?=
 =?utf-8?B?dXFRdTJvdGVhRytOQUtib0xZbFFWSWNlYW9Hd0M4SERwRnR1Ym11ajRZbEZQ?=
 =?utf-8?B?VjEwNDVpczRhQUtGNklaTzNuS21wVlhuNGd0VXNLVVRYVWErYVRjOWRzdWho?=
 =?utf-8?B?U1R5S3JvTzl3Nld1UFIwNGRBNUtoRFI1NXArdWVjek0vVE51ZDJuZ3RPVC9G?=
 =?utf-8?B?bndUeitETWtuOXRWeC9ieDZFYkY4Lytabkp5RzlvcCtUa2lwK2d3QTR6Q0Zn?=
 =?utf-8?Q?yieELyyoCpEEWz6jsUDIx947gCeezL+EUy1DGPv?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f7bf46f9-12bd-4bed-6337-08d920ec2de3
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 May 2021 08:48:20.5585
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZmgK+QzmaMkKMKCPi90o61b0aM1iK0tc559+iARtl0XOiN4d708jE6KuCLytMhsYmw52dBxrBRSPjV20iu9tGQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB4681
X-OriginatorOrg: citrix.com

On Wed, May 19, 2021 at 05:39:50PM +0200, Jan Beulich wrote:
> Gcc 11 looks to make incorrect assumptions about valid ranges that
> pointers may be used for addressing when they are derived from e.g. a
> plain constant. See https://gcc.gnu.org/bugzilla/show_bug.cgi?id=100680.
> 
> Utilize RELOC_HIDE() to work around the issue, which for x86 manifests
> in at least
> - mpparse.c:efi_check_config(),
> - tboot.c:tboot_probe(),
> - tboot.c:tboot_gen_frametable_integrity(),
> - x86_emulate.c:x86_emulate() (at -O2 only).
> The last case is particularly odd not just because it only triggers at
> higher optimization levels, but also because it only affects one of at
> least three similar constructs. Various "note" diagnostics claim the
> valid index range to be [0, 2⁶³-1].
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Roger Pau Monné <roger.pau@citrix.com>

This is all quite ugly, but I don't have any recommendation short of
getting gcc fixed (or being able to disable those heuristics).

> 
> --- a/tools/tests/x86_emulator/x86-emulate.c
> +++ b/tools/tests/x86_emulator/x86-emulate.c
> @@ -8,6 +8,13 @@
>  
>  #define ERR_PTR(val) NULL
>  
> +/* See gcc bug 100680, but here don't bother making this version dependent. */

Might be worth also referencing 99578 which seems to be the parent
bug? (as 100680 has been closed as a duplicate)

Thanks, Roger.

