Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D4A63BA46A
	for <lists+xen-devel@lfdr.de>; Fri,  2 Jul 2021 21:43:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.149322.276094 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lzP4R-0001za-12; Fri, 02 Jul 2021 19:43:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 149322.276094; Fri, 02 Jul 2021 19:43:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lzP4Q-0001wd-Ta; Fri, 02 Jul 2021 19:43:26 +0000
Received: by outflank-mailman (input) for mailman id 149322;
 Fri, 02 Jul 2021 19:43:24 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wENR=L2=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1lzP4O-0001wX-HU
 for xen-devel@lists.xenproject.org; Fri, 02 Jul 2021 19:43:24 +0000
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1f750bb6-9dc6-43da-9a2a-418389247bea;
 Fri, 02 Jul 2021 19:43:23 +0000 (UTC)
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
X-Inumbo-ID: 1f750bb6-9dc6-43da-9a2a-418389247bea
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1625255002;
  h=to:cc:references:from:subject:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=HY/2zx7JsDsDRDIO7jca5fPF13HZXmGu/pYGKlWarDk=;
  b=OTM0LFid8mms3YinhnnGu+K9Yy7vDmI88b4injOPrr6Q5g35i3K6bB1b
   wGFVRCY3wDgiWX9I2/1vqgAQRc4BpSbfOwJP610Ed7skQAihiLNOMH8Wy
   KuDXUeJLEM2lHwZK6CjhtAIveBl8YCzUK63LgfcbbTVBy5l3eqdtJw5SL
   w=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: /uMgw+MXHXzfAZzVVxrrweiVstwx+G33gy7ZY9viQjp5y9Nhp4y55Srmzn5Ku0WGN84qA4xvEa
 GkbGjBL45GUmKEqvfQzKE1Jv2Y44Rfd9asVnlbHNNpKVG7Z435+zyY4w3HZXOLtc63fPc3NxX5
 adEhQ2fEkjIdk04OlCtSyk0VsZw+jnrGE3JNouneXs4aeETeX6IadtOzZW65KG35tbZvaqbU7U
 juDmMCxPtDsuiS3LA2yp4hrNDmJ5C+4bYI2KDhXtLlOrVF38Him1joKQfOoHeT+c8hc+RPOown
 Nl8=
X-SBRS: 5.1
X-MesageID: 47198654
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:JSp1Hah2mG4jYPZ6R3kLjb2ZwXBQXzF13DAbv31ZSRFFG/FwyP
 rAoB1L73PJYWgqNU3I+ergBEGBKUmskKKdkrNhQotKOzOWxFdATbsSkLcKpgePJ8SQzJ8k6U
 4NSdkYNDS0NykBsS+Y2njKLz9D+qj/zEnAv463pB0MPGIaHp2IrT0JbjpzencGNDWubqBJcq
 Z0iPA3xQZINU5nFfhSURI+Lpn+TpDw5d7bSC9DIyRixBiFjDuu5rK/Ox+E3i0GWzcK5bs562
 DKnyHw+63m6piAu1Hh/l6Wy64TtMrqy9NFCsDJos8JKg/0ggLtQIh6QbWNsB08venqwlc3l9
 vnpQsmIq1ImjzsV1DwhSGo9xjr0T4o5XOn40Sfm2HfrcvwQy9/I9ZdhKpCGyGpqHYIjZVZ6u
 ZmzmiZv51YAVfrhyLm/eXFUBlsiw6dvWciq+gOlHZSOLFuKIO5lbZvuX+9La1wWB4TsOscYa
 5T5YDnlbdrmGqhHjLkVjIF+q3rYpxbdS32MHTruaSuonNrdT5CvhIlLfck7wA9HaQGOtF5Dt
 T/Q9BVfY51P7krhIJGda08qJiMeyHwqSylChPaHb2xLtB4B5uKke+u3IkI
X-IronPort-AV: E=Sophos;i="5.83,319,1616472000"; 
   d="scan'208";a="47198654"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=W00Z/toL/YgW0tAhVjwDX+ObOdXSiqzHfGIIzUPo6JFYSncPw8znVQPMlBtDpiL1lUhhS4Ipm3P6i1LYiArskxpKMCwCI34ukUEUGevcxjg5hROyyCs3T5BrzDjDKiuk6Z6mLUshbaJewd4wLLuSXDUmx6tCoBc36+GxqTHerbeKXAeiE9Xef5yW83XHV6pLGuUOpVLbIhlWWy7mBJXT17OrU5jTgY6dXdabDw9owIJL8XJZHWZXyjIbrNRSmklL6l7FxNa2NNlYaNpyi5hvugnGkXQNibESRCPiJgTB2YscLdAtL9ReMhhqrC2DexftxMstpH0sUhp9UXWg+u196Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WQm8/LM5DZNPep69o2xTgCMxTO2rUFu6G+DGUi9imyU=;
 b=ZnnIDGJidU8W4yLPGT9cYTIQMi32QAQUQ5M5S1Ej2jT6v/EHwO7S7LMEGcJfW1d/S5ZXXqEZXpWRgF9rqs/xdOleae0cHICI7HYcW2wd1RA/+nImaVSf/0mT86bw3fb7owIF1QUBsYck9DnRRjFu5icGadJfpGmjruqeQSMacYYTNUv9NN2qFFsK1imLA8BCSEssDPSrjPJlMFNXKKzxKkJy3zkTIbkjlGvRIf7aOW+4bm/tPITo9JmRUgazTH6ovxC+2nWw/xbJ5f0h4X8EsbQlpb/9EkeP0rWTrb27awZqNLqDm9Hfw7g7l6DTCMqlwVQ8t56v2Ekw4S5/dPGdog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WQm8/LM5DZNPep69o2xTgCMxTO2rUFu6G+DGUi9imyU=;
 b=ruW8BmgGsRvEBH/BDqZpS0dfqShZZQQuZ8jHw4INtRvaJ52dA6ywyYURMOO8Rv8bue4rRwzCKRqMtG0skI1ue10+gJKcUf0FWxgb2KpcP7gU0QYa3K1rWCYDd1oW0Vg2L2nzKeCE6wEabgznPXPPIIITwLkqXXi9WC7FPXqvCyw=
To: Olaf Hering <olaf@aepfle.de>, <xen-devel@lists.xenproject.org>
CC: Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>, Juergen Gross
	<jgross@suse.com>
References: <20210701095635.15648-1-olaf@aepfle.de>
 <20210701095635.15648-13-olaf@aepfle.de>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v20210701 12/40] tools: unify type checking for data pfns
 in migration stream
Message-ID: <9db50e05-233b-e279-307d-548fc23d0115@citrix.com>
Date: Fri, 2 Jul 2021 20:43:13 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <20210701095635.15648-13-olaf@aepfle.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-GB
X-ClientProxiedBy: LO4P123CA0098.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:191::13) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e18f3e4b-8cc5-4cfc-4a88-08d93d91a4ad
X-MS-TrafficTypeDiagnostic: BYAPR03MB3942:
X-Microsoft-Antispam-PRVS: <BYAPR03MB394298FCE598C5A15CC40260BA1F9@BYAPR03MB3942.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8W7sJJuSfv6ny0N+g2nd4Zdaig2Fsk2WfD5IigFQ2ZWBYi613rpbCib150suxs1C4CTQ4ngvMqgHSca71W9e5X6bKJSSiUwTVOOtXPIjRcF8/HTBkM8kTaC3hHZVe4JGoZ2d0EHKl4UfEacJbaad7jF6C5in/DeznZJSrJAfnRzcPnuhDeI5bGcH6bIZbxAU3GTJ86k4nYCAbOdlmCrFUSTNlKbn8uuoJnoPvENSKlBnDSg6B0QaLA/KQef9K20yyzs9AwkisyvCvR8WysIZTdrH65cxVlXP2HPaVis9/p7sDjziDMLrXZm2JGKymji39jKqG1/JdYULPdiYYVYXkIk7s3l7ZX3QO6fRV17CDB04pBlbs8L9xuGs7ym+hyTDR9BFMWdcaXqQU2cQv+waidschGSndYytDWmfEvcuG4vk3ekrft6rAo7VJT7yGW5geuNJM+F196+9E1eQroNEGNuVLoWdV8ws2eLr8aJ75I6Favx0JjCN1OzXSVTww15ZwUlcG7XhgMgZNHF4dbKXC3rURpvNzc+f6EdZ1+AWZTtZ9ieZ/cOSb1icBG2AkdRVN3YdM3x++hwqYFe4hCOYYTuiT2RJTTlffrUeVOP2lgYxM2BEkUOyuVpQsSHvOBE6pQ2Qj48Oc9Nm2S2C2p4qkb+artD/KRcftSJ4t+K4slhy/RNrF7Zvcm2IO0dvwXQ+oLwnedUMTlAw7qYcP5GtRVjUvltc5dhA3Bt70i2UYdtPPKcjI/5dlylxr5qgXO1L
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(376002)(136003)(366004)(39860400002)(396003)(26005)(36756003)(6666004)(5660300002)(478600001)(66946007)(66476007)(66556008)(16576012)(54906003)(316002)(16526019)(2906002)(186003)(8676002)(6486002)(53546011)(86362001)(83380400001)(38100700002)(8936002)(31696002)(31686004)(4326008)(956004)(2616005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UFFFTG1CcW9lL0tQdFVvalVWYVh0Q3doZFBjNmdRcldQQzZzR2U3dSs4Yzgx?=
 =?utf-8?B?NDdwajNTZ3lDUVNFck9FWUZ5NC91L2ZWTFg2NVA2VklHZzRpOEV1ZnF5d1Zy?=
 =?utf-8?B?cHdzTzlGSmlrWndsQmNDdWFpVmJZOC94RnBtWlJ6OHJ2a2QvdVFON0dEVkZM?=
 =?utf-8?B?emp2bll0K2IyMVp2V2x5bmNHYVowclNyT21qUUFJZk12RzdMcnZIVVBpeVVJ?=
 =?utf-8?B?ZjFjenZIVlZ3NkFqWGdYNzdxMTAyK2VHelJQMWxlWTJISnpWR0NUZ3AwUTF1?=
 =?utf-8?B?bjRkMEpoTzI3RHZzdGNPeElPeDJrdHJhZkhoTDk0VUMwRm1tRWZINit3RTlY?=
 =?utf-8?B?WEZoN2tNM2dkQ2xYakV6YXM1UWxxMG8vNzkyaFVZcXNSYk5qdUdsY0pCUnl3?=
 =?utf-8?B?ZDRWMmZZd0hSNTF6MWFVaXBPVlR6S2J0b3oyRlhmSUtuTk03eXRKSnM4aUxX?=
 =?utf-8?B?dUEwa21iV0dMTGRxUGZzcXMrNGdxalNWYW5aM2JHYklOdFd6WlB1MUlZSWVQ?=
 =?utf-8?B?NSs3U1I5TnFNNit1b2ZDcDNucVpjbCtIdU1YTHA2MnNnaXF3eHF3WWlmemRB?=
 =?utf-8?B?dkZZek5SemNwR1BwdXVwQnRLZkJPc2JwcnNTRlcyRlJCUFovMml3K1B6SGND?=
 =?utf-8?B?MjdheU5xQkFMTTB0Yi9OTFBMbEVvM0piSUVqRHBLNEI1bk9PaytQNUpUTC96?=
 =?utf-8?B?U2pPeXFTWWZhSW5VNEl1ZGpSZXErZkxvL0dvdkNxYVhhS3RUYlVZUWdQUnBq?=
 =?utf-8?B?VExncktaVUxvSnFWZ0tHWkZiMGFKNzVaWElNczc2OUdRMEdwRmR1Q0hxbXZ3?=
 =?utf-8?B?Mm4zOWcyOGVaVVRqNXAvVlRDbytPVTcrTEVZeVRibUcvTUpSajVhQUxWSEhF?=
 =?utf-8?B?UW9xVXpaZk91WmhKWHZOV1ZuNk1Ub0lSRVExUnJlUzdrWjZYVTdEcjFLSi8y?=
 =?utf-8?B?V2V5d1FOcXdCeVIreUx2aVBxSHNWK2RFK0NWNXRycXJsR1VBbVoyeTVNUjJz?=
 =?utf-8?B?dU9rUFFBOGp4WjN0T0VYMjdyY3VHSTJpWjgwaDArTGU2MG1jS2xDUDhQQzRV?=
 =?utf-8?B?T2grcTVSdXdjYU9TOUJSZzhiRnNWUXcyTVp3bGgydStYL2wrM0hVQmErS3N3?=
 =?utf-8?B?emFKQVZoTHhCTlBLbUMxaFAxWkdWRHB1QzZmdDk3T1I5S0haRkF4a0owMlQ0?=
 =?utf-8?B?YWlxb1hpb1VmcTJFcTJlTHM5c2F0dUV2THZqc3ZzMkZORGJFYkV1T0JMcDcv?=
 =?utf-8?B?UlJHempQTmJNR0wxUTdEZVl2NU9QRDBxOCtXY0ttTk5wOHZsdWRaRnFOM2Q4?=
 =?utf-8?B?Q2NkdmQ1YWw2a2x1V3NmSWN5V3NRRVFHb0dFQVRMWXJCbWV6Ymlvdlk4ZWEw?=
 =?utf-8?B?NmJGUmtER3EyUG8zOHZ3Z0dRK2RTSDBPWTlzY1ZBV2hFSXYzWGpwSlhaZUhZ?=
 =?utf-8?B?TzlZVHVxNnY3L2lhOU4vWmNHTXgwU1FPRm1SMnpJSVM2enB1UkZ4SGVXR2Nz?=
 =?utf-8?B?SWtSZG54enZjTkRZSFlrSG5HL2lyMDdxLzRTRGJGbS9uenI4U3VnRmI5bDhC?=
 =?utf-8?B?cVFUeEhEY1VMK1Vqbm1xd3RiZ1NwcDRCNG8wL3Zwd1FCR1lGTzJVLzlSMFFK?=
 =?utf-8?B?U3I3dmNZT09ralJvbSttaXVMZTdtbjFIT1NidVdiTjd5R0Y4blVGckJmU1Nl?=
 =?utf-8?B?QWlPMkpacVB3VTYwN1gzbk5IMGtDbnJsd09FVmRValhLbG9TWmlrQ0ZGL0pL?=
 =?utf-8?Q?RHywifRPnwiczIedknN5OimZaI5RDMF4ndUJb9U?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e18f3e4b-8cc5-4cfc-4a88-08d93d91a4ad
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jul 2021 19:43:19.5956
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RteaGOXmWeExst11eY0mwr9zVBfnM1xyXsolp9ore1yqFP6CRr3HX5cSQQl+oHEbeBoVgIdSaq2RYLAs+Co1z2LQdEVhgbxdvqtAioO+P/I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB3942
X-OriginatorOrg: citrix.com

On 01/07/2021 10:56, Olaf Hering wrote:
> Introduce a helper which decides if a given pfn in the migration
> stream is backed by memory.
>
> This specifically deals with type XEN_DOMCTL_PFINFO_XALLOC, which was
> a synthetic toolstack-only type used in Xen 4.2 to 4.5. It indicated a
> dirty page on the sending side for which no data will be send in the
> initial iteration.
>
> No change in behavior intended.
>
> Signed-off-by: Olaf Hering <olaf@aepfle.de>
> ---
>  tools/libs/saverestore/common.h  | 17 +++++++++++++++++
>  tools/libs/saverestore/restore.c |  5 ++---
>  2 files changed, 19 insertions(+), 3 deletions(-)
>
> diff --git a/tools/libs/saverestore/common.h b/tools/libs/saverestore/com=
mon.h
> index 07c506360c..fa242e808d 100644
> --- a/tools/libs/saverestore/common.h
> +++ b/tools/libs/saverestore/common.h
> @@ -500,6 +500,23 @@ static inline bool sr_is_known_page_type(xen_pfn_t t=
ype)
>      return ret;
>  }
> =20
> +static inline bool page_type_to_populate(uint32_t type)
> +{
> +    bool ret;
> +
> +    switch (type)
> +    {

Same style comments as before.

> +    case XEN_DOMCTL_PFINFO_XTAB:
> +    case XEN_DOMCTL_PFINFO_BROKEN:
> +        ret =3D false;
> +        break;
> +    case XEN_DOMCTL_PFINFO_XALLOC:
> +    default:
> +        ret =3D true;
> +        break;

I know you're replacing the logic as-was, but in hindsight, I'm not sure
it was great to begin with.=C2=A0 It defaults the unallocated types to bein=
g
considered populated, which isn't a clever idea.

Anyone adding a new page type is going to have to audit/edit each of
these helpers.=C2=A0 I think it would be better to write all the true cases
explicitly.

> +    }
> +    return ret;
> +}
>  #endif
>  /*
>   * Local variables:
> diff --git a/tools/libs/saverestore/restore.c b/tools/libs/saverestore/re=
store.c
> index 324b9050e2..477b7527a1 100644
> --- a/tools/libs/saverestore/restore.c
> +++ b/tools/libs/saverestore/restore.c
> @@ -152,9 +152,8 @@ int populate_pfns(struct xc_sr_context *ctx, unsigned=
 int count,
> =20
>      for ( i =3D 0; i < count; ++i )
>      {
> -        if ( (!types || (types &&
> -                         (types[i] !=3D XEN_DOMCTL_PFINFO_XTAB &&
> -                          types[i] !=3D XEN_DOMCTL_PFINFO_BROKEN))) &&
> +        if ( (!types ||
> +              (types && page_type_to_populate(types[i]) =3D=3D true)) &&

I'm surprised not to have seen a compiler or static analysis complaint
about this.

!A || (A && B) is redundant, and simplifies to !A || B.

Clearly need to blame whichever numpty wrote this code to begin with.

~Andrew


