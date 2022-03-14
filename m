Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 43ECA4D7DED
	for <lists+xen-devel@lfdr.de>; Mon, 14 Mar 2022 09:57:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.290053.491901 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nTgV5-0001QJ-Em; Mon, 14 Mar 2022 08:56:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 290053.491901; Mon, 14 Mar 2022 08:56:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nTgV5-0001NB-BJ; Mon, 14 Mar 2022 08:56:23 +0000
Received: by outflank-mailman (input) for mailman id 290053;
 Mon, 14 Mar 2022 08:56:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=knG6=TZ=citrix.com=prvs=0654505ba=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nTgV3-0001Le-2i
 for xen-devel@lists.xenproject.org; Mon, 14 Mar 2022 08:56:21 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 99fe3c72-a374-11ec-853b-5f4723681683;
 Mon, 14 Mar 2022 09:56:15 +0100 (CET)
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
X-Inumbo-ID: 99fe3c72-a374-11ec-853b-5f4723681683
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1647248176;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=VBJoX8tiXlgRO5qb4sY8hEOLWi2vWuNChQvlx8Q3OzA=;
  b=UCZqsdglQ7lwxDZb1Ss3TBGLF++vAwSpwTgvmrkDG/tAF0y54pBnD3Tq
   JWYgUlFOCLZisO3itsCYa1fNcCnGcYUupHGopgbKtxZKEJ25pxEDst5fx
   5tOK3b5FlCV0aUSO/YYi6AduX70kHn6MlYy9rurJFD6s3x7M+bwdw03Cj
   s=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
X-SBRS: 5.1
X-MesageID: 66162254
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:p1gAja3lvNSed0hFWvbD5dBxkn2cJEfYwER7XKvMYLTBsI5bpzIOm
 mAaDTjTPf+DMDb3fYtxOY2z909XuMWGmNNgTQBspC1hF35El5HIVI+TRqvS04J+DSFhoGZPt
 Zh2hgzodZhsJpPkjk7xdOCn9xGQ7InQLlbGILes1htZGEk1EE/NtTo5w7Rj2tUx3YDga++wk
 YiaT/P3aQfNNwFcagr424rbwP+4lK2v0N+wlgVWicFj5DcypVFMZH4sDfjZw0/DaptVBoaHq
 9Prl9lVyI97EyAFUbtJmp6jGqEDryW70QKm0hK6UID66vROS7BbPg/W+5PwZG8O4whlkeydx
 /1KjpiiTzcZBJeVwsQ9DzpXUD1zGolvreqvzXiX6aR/zmXDenrohf5vEFs3LcsT/eMf7WNmr
 KJCbmpXN1ba2rzwkOnTpupE36zPKOHxO4wSoDd4xCzxBvc6W5HTBa7N4Le02R9u2JkQR6yDO
 6L1bxJdYQXcaB1XNGsRBbkRpcHrlmvcQgVx/Qf9Sa0fvDGIkV0ZPKLWGMXRUsyHQ4NShEnwj
 nLL+SH1Dw8XMPSbyCGZ6TS8i+nXhyT5VYkOUrqi+ZZCglee22gSAx0+TkagrL+yjUvWZj5EA
 xVKoGx09/F0rRH1CImmN/GlnJKalhknX8hWI90A0ljX6oqIwAnaGmUjahcUPbTKq/QKbTAt0
 1aImfbgCjpurKCZRBqhy1uEkd+hEXNLdDFfPEfoWSNAuoC++99r0nojW/45SMaIYsvJ9SYcK
 txghAw3nP0tgMECzM1XFniX0mv39vAlouPYjzg7v15JDCskPuZJhKTysDA3CMqsy67DEjG8U
 IAswZT20Qz3JcjleNaxaOsMBqq1wP2OLSfRh1Vid7F4qWjyoi/8J9gPv2gmTKuMDirjUWW1C
 HI/RCsLvMMDVJdURfIfj32N5zQCkvG7SIWNugH8ZdtSeJlhHDJrDwk1DXN8K1vFyRB2+YlmY
 M/zWZ/1UR4yVPQ2pBLrFrx1+eJ6mUgDKZb7GMmTI+KPiuHFOhZ4iN4tbTOzUwzOxPjd8VuPr
 IoHaZfiJtc2eLSWXxQ7OLU7dDgiBXM6GYr3u4pQcOuCKRBhA2YvF7naxrZJRmCvt/09ejvgl
 p1lZnJl9Q==
IronPort-HdrOrdr: A9a23:N4um1KPnRMeWycBcTsWjsMiBIKoaSvp037BN7TEXdfU1SL39qy
 nKpp8mPHDP5Ar5NEtOpTniAsm9qBHnm6KdiLN5Vd3OYOCMggqVBbAnwYz+wyDxXw3Sn9QtsJ
 uIqpIOa+EY22IK7/rH3A==
X-IronPort-AV: E=Sophos;i="5.90,180,1643691600"; 
   d="scan'208";a="66162254"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TloaKuuuzjY0PQH29kJew8n+2xjrgK/o4t7TKmiBgU2CshlgN5kwIB6ulzAZwMFc2wMab1urAmHPfDzspT7xXyRf9xXPR9xCfpu67KRMTgDNWMrFUbK7Xzqdp3Z2MHguCvaqzrJ41X9lnNvJBu0cIE9nslEwgrG1+izqsGMpBM++WID9U8hnc1dki455CTg2Y1iU2wuF0+F14MDrDE/5hiUYITeJjyQXleuQDNPBKaZBGDuQmO1fJxtLYlRpByGkWPb3NrSGiODClOOkUlGXASLBreBXdxcwrXKcDQQh7M2U+fKUI5PX8Wf7tpkZHGOEtZthvHOxNoBaji1D9q210A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=poKvJJ6nelKY3DJA2ef1LFVjaP9p0DQCrGcNsDXoJ/U=;
 b=NxIdylsBkRY9lx1/04AxQaG3mvdjOnJE2JZbLYN3lNhum55lH6CTxTbQBwHMWHyBylfdj7bzDafmtx8m59MzaHYxFB8vKTexu65NOXighxDvxpT5ODU/8IoK7obU9kkN2BTzIZOOHijhMBLXq6L8v7IMB7X35A/OtideFgMtfMdbVBDzm9oKIH8lwz2tdJXrGSfJtKrAU9/LLog4S+L3JVY+bkvdH2eT0QgOjw9mUlJl7V0bGipdtmvPvGnCZdmhUw6cB6qaD0utBFkU/e5PTYPm9Ic8+US1dnOGAtabBKpu+YIlCaqJLfuvLIH0ANDEi40XwbxHqX2ehESqOHbUWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=poKvJJ6nelKY3DJA2ef1LFVjaP9p0DQCrGcNsDXoJ/U=;
 b=K1MDko0Q1C6j3tmmNq+XLP/GLs+Xxia6tB9Qq0pHWIHq+uif8ngclCvhd7rJqb7HVTOAjypJkAcUPVkkq2Kd7z3GoCCFOGeK8GtgHwDx3W5HvOTVfSZc9BQ/2p4xnga4BYGnItpAtq5TPdFJ30eu01XTd3OGwj1dDOPgYYIUTCg=
Date: Mon, 14 Mar 2022 09:56:00 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Andrew
 Cooper" <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH v3 4/4] x86/APIC: make connections between seemingly
 arbitrary numbers
Message-ID: <Yi8DIDGwb/4jYWI8@Air-de-Roger>
References: <35cb3c72-05ba-24c7-1fdd-3ee1aced3aec@suse.com>
 <123a9ae8-caab-01ae-5bea-8c590bd8f9d9@suse.com>
 <YitbhmgGy4Yh8PoP@Air-de-Roger>
 <8ec77c15-7c98-edc1-2f6b-f1d62d15b2a1@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8ec77c15-7c98-edc1-2f6b-f1d62d15b2a1@suse.com>
X-ClientProxiedBy: MR2P264CA0006.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:1::18) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9ea31d98-0777-406d-611c-08da05987a35
X-MS-TrafficTypeDiagnostic: BYAPR03MB4135:EE_
X-Microsoft-Antispam-PRVS: <BYAPR03MB4135B75F256846D2B99C755C8F0F9@BYAPR03MB4135.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: h0rMpHpPS4gHshCzWB4nI47vosXdMFBGe61r110DLep0PseUqzXXHgqJhRlavsC1psk6U4xjBiICQLWRuaWXzBu+Ulc0cQQqOen75LAapYV39GUWkGUilFVWQIVBnLsyMoRd4E8D5R/IEawYE3WmyFZw7lVMmtbJWXSR582/AnStTaE+69e4B+4T5nTjyVDYXAVpek+5jeOTGjK5vaRIC6ab90LxB2yzquYJtJql2SLXeSXC15S/NMjQedwaDQHnfx4dr6r0VlZB5v7K+e33YktwqRetB4YYEYVEREa/6d8ylKONxhi2sPk9zZJzMwISG6hIwC3a3cgAFRjUVpp1dJvo2GbBZ9HGsPkl5RcA1Bp6xUVgwTa10R1ZgoOHvuu4pk32NkZWgbi8CQttJz3/9MgUYeLh55T2XTzHVhk7hWOP116+JfIu85XxiK9luVgIx8I44uTRILc01PPxSKAjvYN7zbzduPCfbI8KIvwueUdpCnu1C1n3vvFQRWmVpoNmaVHlUJiJLQfECxbCzdWLx1UyrLi1bAc3qkzxSKYEGKdOzE1zXZGN80rXuCgac45INUclTv7yM09UwWSlgNKtp6flrbCenSU+ekZklOYgIj+uuSd14vT/6bDTOkbXwjz/WdfoAlt8XRPmLbRU6FhymA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(7916004)(366004)(6666004)(9686003)(6916009)(54906003)(316002)(6512007)(53546011)(6506007)(4326008)(33716001)(38100700002)(8676002)(6486002)(66946007)(66556008)(66476007)(508600001)(86362001)(85182001)(5660300002)(8936002)(83380400001)(26005)(2906002)(82960400001)(186003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Q29xUUN4UzJvb0t6QWdxRC9EdTJZY2s3clM3L0p4Z3U0QXBFaFBhb1RwOHlU?=
 =?utf-8?B?alF2d0h0UjRnM1FDK201RzVYZVgweTFRQ012REJab3FVNXlKVzcxTTdGNXpm?=
 =?utf-8?B?bzMweXRjOVl0SnR5c0lUY0VwTzVYMDVnYkxwb0xlNVBoaUV2dkpkNU9xbVNX?=
 =?utf-8?B?WmN3NkZoRDBhNXN0aVQ1RnhmQUZrVUtjZzhLUFR4V2ZHa29Jb0FWS1ZvQlJu?=
 =?utf-8?B?VFBoVzBJNnJTZFhuUGw0NDY3L0JjeXp0MEVBUFVVQ3VFYVVhL3daL284UVVo?=
 =?utf-8?B?SzN5M2VGWStjYWRiMW1pYkVFQVZndmNaMXQwK1lCNnJ2OWk0SlluVndFdUtF?=
 =?utf-8?B?Mk9iZ3pTbktXTG9QNGtJY3FlN2EvVE05aUxhTEF2QlZSa2JaTDB4eWJaWXNX?=
 =?utf-8?B?Smt5YmUzT3ZnK3FZaVkyWFIwenA2YmdYNzNLMEdrL2FLaWh2c2FtenB4d1B1?=
 =?utf-8?B?ZUNXUUU1Smp1QnBDQUtNUlNOZXZWSmNjS0gvY25XZUEwZEdNVk9VVUdBWGJN?=
 =?utf-8?B?WTNIY0hneEFBTzBGa2E5S0VlNkRPS2I5TnVEVjJvL2lkR0l2M2p4NGlKOWpp?=
 =?utf-8?B?V3JKcG1LV21oYXpzUHJDdTFNL1MxTG15bmJWZUx1YWtKTDVEb1FEc0V4aEpm?=
 =?utf-8?B?TGtLQURCejhEMU5YMEJBVkJrTUVxU3VNdVZMdHRJWnkrUWg1OC9XcDNveDNM?=
 =?utf-8?B?V2xjVkFuV1Z6NWRFRDIzM2pmNkNldVdrc0pKOFNQVHo5YVNGNUk2MXlUNXhB?=
 =?utf-8?B?cHkzQ3hNVUphRTZMNmMwZmhHbHJGVVZoRkZEZmhURnNHbzZjbHZxZDVqOEtO?=
 =?utf-8?B?U1d4eFM1RmQyUVFScThVbFRxZUNRVzFYZ3R0STZqL2cxVDBKeVJYeTBQdW42?=
 =?utf-8?B?WXd5ZW8wRFMrNFE3STRxak8ybGRwWk5nWjBLZjcwSklhK0Z5TFdscXhGdHFF?=
 =?utf-8?B?RVZuMno3amRwUlRmQkw2WDZWOWpzQ0I1Qkw4OTFkUHhlQ0p2TUZKOUg0c0hL?=
 =?utf-8?B?LzlRcFFKWjBkZDNKbHY2WEFsRVFWcnhWVEdKOThiV2RkeEs2Qm02aUJpWFpy?=
 =?utf-8?B?d282SFNvaUJMWDl6NmkvSUp1eVpOdU1jRUM0WnI3MnFDRWJLRmVZa1NpWGRp?=
 =?utf-8?B?UG51VlJrTW9RVlFoZlozam9oNDdFSjd5N3BGbE5aSGlPaFpWYlpDZ05acFB0?=
 =?utf-8?B?Z28wNGxodmVpT29ZVE5nSU1ZZFRuN1hpczhDMFRBWWd4Vng3eVhBWDNNNGdi?=
 =?utf-8?B?cDQzbGJMdkQvamllRTJZYWo3UUFVRjYrempxMzl3RENxRkhTS0FXMnp4TDF2?=
 =?utf-8?B?K2ZnS3JqWFVRd3NhaEVybEhpY0taVmplcjYxdlRzVUZOR2kzQ01xZnZ2Y1hW?=
 =?utf-8?B?b1hsTU8rN0hzVWFjbGdOcHVIK0xsbERsYkViZHBsbzVGYmtvaFJsUFBON1pO?=
 =?utf-8?B?OG5iWVhYRUNYdlk1Y2UvYmVOZ252SHhwcGNBWmhTTU1NRHZZcVZPMlhyZkNT?=
 =?utf-8?B?eUpUTVNRc0laclVOeG5ady9YdWEyNHgwWXAxdVh6L01WdHlvMXEwWTgzTzNz?=
 =?utf-8?B?cnBZKzdqSUxFRmNnZld0WVJqa2pIT1NjYUxmY1JBTk9IWjk1V3Q5WmtSZW5H?=
 =?utf-8?B?ZlE4WTRtMFRGKzJUa01qYnArNWhiOTNCcWpFS1RzbWxKQW5uZm85Y3BiS0Zq?=
 =?utf-8?B?K1h4TWNqbkNSdmZaWU1ZSnNUaWEzTHhYTWo0bG5nTWhJQjIwNGZuK1hyUnVw?=
 =?utf-8?B?V0tXNWsrd1RNZEtKblppMHk0ZndTd0ZYQnhLWHo1SzNBbmlNWW5ubTJudTRh?=
 =?utf-8?B?b2Y2eXhZZUZNa3llWFRnQzNQdDU4ekc1bDdJaXV2SlY5RVh5dDdoQkdNMFdK?=
 =?utf-8?B?TnJvR0UxUlZudkZDd3RhbFJlOW9LSjdoTWdYN01FaHpoanhaMzVIWlBEcmdG?=
 =?utf-8?Q?G2CqmHx0Mgw/zn51RVId8IfNBANJjIuI?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ea31d98-0777-406d-611c-08da05987a35
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Mar 2022 08:56:07.2176
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ccPM0yszG/qN1KDMX8C97fHIM+ZTC8ZPfId3k2MeeovyZHrdJPNeDgy2cA+EXAOHmKRkEti5D1gMGTycuKgWCA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB4135
X-OriginatorOrg: citrix.com

On Mon, Mar 14, 2022 at 09:19:01AM +0100, Jan Beulich wrote:
> On 11.03.2022 15:24, Roger Pau Monné wrote:
> > On Mon, Feb 14, 2022 at 10:25:57AM +0100, Jan Beulich wrote:
> >> Making adjustments to arbitrarily chosen values shouldn't require
> >> auditing the code for possible derived numbers - such a change should
> >> be doable in a single place, having an effect on all code depending on
> >> that choice.
> >>
> >> For one make the TDCR write actually use APIC_DIVISOR. With the
> >> necessary mask constant introduced, also use that in vLAPIC code. While
> >> introducing the constant, drop APIC_TDR_DIV_TMBASE: The bit has been
> >> undefined in halfway recent SDM and PM versions.
> >>
> >> And then introduce a constant tying together the scale used when
> >> converting nanoseconds to bus clocks.
> >>
> >> No functional change intended.
> >>
> >> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> > 
> > Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>
> 
> Thanks.
> 
> >> ---
> >> I thought we have a generic "glue" macro, but I couldn't find one. Hence
> >> I'm (ab)using _AC().
> > 
> > I would be fine if you want to introduce something right in this
> > commit to cover those needs, using _AC is not overly nice (or
> > clear) IMO.
> 
> Hmm, I was rather hoping that you (or someone else) would point me
> at what I thought I'm overlooking. If anything I'd likely clone
> Linux'es __PASTE() (avoiding the leading underscores), but their
> placement in linux/compiler_types.h seems pretty arbitrary and
> hence not a good guideline for placement in our tree. To be honest
> the only thing that would seem halfway consistent to me would be a
> separate header, yet that seems somewhat overkill ... Or wait -
> maybe xen/lib.h could be viewed as kind of suitable. Of course
> there's then the immediate question of whether to make _AC() use
> the new macro instead of open-coding it.

I think if possible _AC should be switched to use the new macro, yes.

Thanks, Roger.

