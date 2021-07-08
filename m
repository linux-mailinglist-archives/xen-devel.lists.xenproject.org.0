Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E8863BF925
	for <lists+xen-devel@lfdr.de>; Thu,  8 Jul 2021 13:38:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.153024.282692 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m1SLw-0003eD-BC; Thu, 08 Jul 2021 11:38:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 153024.282692; Thu, 08 Jul 2021 11:38:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m1SLw-0003cM-7A; Thu, 08 Jul 2021 11:38:00 +0000
Received: by outflank-mailman (input) for mailman id 153024;
 Thu, 08 Jul 2021 11:37:58 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qibP=MA=citrix.com=Andrew.Cooper3@srs-us1.protection.inumbo.net>)
 id 1m1SLu-0003cG-8Z
 for xen-devel@lists.xenproject.org; Thu, 08 Jul 2021 11:37:58 +0000
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f0770e36-dfe0-11eb-8566-12813bfff9fa;
 Thu, 08 Jul 2021 11:37:57 +0000 (UTC)
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
X-Inumbo-ID: f0770e36-dfe0-11eb-8566-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1625744277;
  h=subject:to:cc:references:from:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=WRE9HRlcs4Z1cZlaVwxWMh/Z04+e+twlf1o40TOfUq8=;
  b=R5sRd4+5WGdX6EEZjBm4fiscnw4wPwqEebghrsnlnuQdHLMq0Tb4MQwo
   sWnHvxEmgb3d9p2tOMZ7YMv6+kUiBRShAYMPNjOi7wimfNgxodeVJTJDB
   gxX2Kyeg2Xp99JRyKdablKfvQRnKjiWC8jbhJ1rd4c03hkzfGzIEMZra6
   M=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: HSW9AGvF1lopADBWfm7WLsb/2nZdM6waByjStO4hEEFhBvZwYuAFCkJvMYNyfhH0LEf4Oik4qW
 //ZRLHZ0N5HM7rTdS9c/sHJ+wOwpqrrcbE33qfqHIjJhk8VfLuqdi/TXvlruhzNIMc2/zj0O8a
 tyeFih/DWKO6Lek+p3Q2XlAsl+PhMBV8hY1PIP1/HEzObGsL+ntFAbmyxD7goJfWD32uzpiN3J
 /g5fXBSmpXsntpt3zTxwMwJKpBq7ud8I6fSA3r9dhoCklMnbrLjFGQcxlPE8nAlwFWasUsd/fQ
 jNw=
X-SBRS: 5.1
X-MesageID: 47889376
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:nT0lBKqnTIMV6P+vMW3LrIkaV5veL9V00zEX/kB9WHVpm5Oj+P
 xGzc526farslsssREb+OxpOMG7MBfhHO1OkPYs1NCZLXXbUQqTXfxfBO7ZrQEIdBeOjtK1uZ
 0QFZSWTeeAd2SS7vyKkDVQcexQueVvmZrA7Yy1rwYPPHNXguNbnmBE426gYzxLrWJ9dPgE/f
 Snl696TnabCA8qhpPRPAh6YwGPnayHqLvWJTo9QzI34giHij2lrJb8Dhijxx8bFxdC260r/2
 TpmxHwovzLiYD19jbsk0voq7hGktrozdVOQOSKl8guMz3pziKlfp5oVbGutC085Muv9FEput
 /RpApIBbU+11rhOkWO5Tf90Qjp1zgjr1X4z0WDvHflqcvlABonFston+tiA1vkwntlmOs5/L
 NA3mqfuZYSJwjHhj7B69/BUAwvvlaooEAljfUYgxVkIMojgYdq3M4iFX5uYdI99HqQ0vFiLA
 AuNrCT2B9uSyLYU5iD1VMfh+BFNx8Ib2S7qktrgL3c79EZpgE+86Ii/r1qop43zuN1d3B13Z
 WwDk1WrsA4ciY3V9M3OA5Te7r8NoTyKSi8Rl56Z26XTZ06Bw==
X-IronPort-AV: E=Sophos;i="5.84,222,1620705600"; 
   d="scan'208";a="47889376"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZMyvVB2REbA8pEtAFXIQ6sqvnCr+rAFukF9FTOQGQa+sDqua1UCQiB4QwI/8gZhLeBE24wUGS7AXSKHoAasai+6OIZ6C/J+hsbPaak67B+eUeTlJyot5s8DjqV3XRLJ8FLMZlEAjgQg8gkGw9aj6RtDKVA0vebZ9NBjq5ZaGVtB8YaZ513K3Xx5CeRHAsgCOrQsaswFMVLAeNK4AKNFGZThY2uLgI/xo5N5EOwSCmrlv4AFJmIPf8MOBLy1pD2SILn9uzl8xttaN7eFlWKxIY7zGlmRoqLSEtB5u39uZmwrQDD4y7/FTafnGAWNufYmIdTwt6MxXecCYV2SH3+I03A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WRE9HRlcs4Z1cZlaVwxWMh/Z04+e+twlf1o40TOfUq8=;
 b=j4rdtYjxn/rQAc0J4AzQ7YVc1VNrHwB8U6intP5Rd5ma38QxrdC5lBN+XeWy5y9U3bGd0xpU2yRYuHuyePxjzViuyV/IJyvvuAAmTXOBUo4rp82B04pkK5ho0Gflr29ytFOV9SbG6hwLHH9o4+cCu65WB/3NrcPwjFPMhTCG78fRSxDe32ySRuiM+IVmQ/wdUR/013jW3bVnR5obUCgtARxFjjwTzsyQEHrEYVOHx5r7TwlsIraZpocY1JHLtmwBFNfNfSld5WhinrUupZbSe8uPMhSyvbeCffS7WC0X1pObE51psm9q7ANbJv69d9XVAgLLB5UV4GsEUOi0RRaHxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WRE9HRlcs4Z1cZlaVwxWMh/Z04+e+twlf1o40TOfUq8=;
 b=RK23w5zLvzmwRgqfIsFksx3q4Y2dD6rry+A4rrKhulWtogkHs40GF6ZX8wmCYHa6R6zliHN2DlMvC//EovbHkvKX8eMWTOJQcwJXWHxLAhjIB3RqaOtxhdhwHW+47N3GPbbXR25rqJwRjJ+nHZDQtUhL13JuPhpVkkQYF9yFZxY=
Subject: Re: [PATCH v1] automation: dump contents of /etc/os-release
To: Olaf Hering <olaf@aepfle.de>, <xen-devel@lists.xenproject.org>
CC: Doug Goldstein <cardoe@cardoe.com>
References: <20210708062922.23393-1-olaf@aepfle.de>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <122b1f88-6663-2251-4211-01674f9b34a4@citrix.com>
Date: Thu, 8 Jul 2021 12:37:46 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <20210708062922.23393-1-olaf@aepfle.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
X-ClientProxiedBy: LO4P123CA0367.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18e::12) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ada8d669-b6f3-4151-0a03-08d94204d246
X-MS-TrafficTypeDiagnostic: SJ0PR03MB5534:
X-Microsoft-Antispam-PRVS: <SJ0PR03MB5534331FFB1D7F938DCBCFB3BA199@SJ0PR03MB5534.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1923;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: y+44sEpPqjG8/X30iriechWh9UxeDM5PWpY3+mkRtMfVUOcXxVFzQl8Fc6+2GXUoj1bDbsl4YDiXGkb8yNVwXG6q6Foat/IRBzBjoW62Q0y+ird1v9vrbRhPJitr7j80bhhjYZNyfY4dH9Bzz8zCTFHMx8WPR0cSd8IOnNakg8cx2O6zvufNczqFRNjJg4HYFGmBH7gE5+3mxazA/3Eh4zQyw2HQAG4ku9DRClZyd7tAqXyp7q8gTevA5MiTqoW3fF/6JCpSbNq3JI3wXgXBh1bYkjVyioYbGbB66GdrKZlhsKGxWkiTbj/Ih5nC3XHBzCKaRSEQq5aZ75AfpySB35B/YGHLl5eCE8GP+obY9oTanjIrkDKmvtNt2vJf/SKDVt0WtNUN3MoeRkQqah5ODyIBL2474zdAKQXtytzP7+QBcpgVptmIIgyHoQO3RETY6pA16JnJ/8ZRYGeQXP1O5D+ckmGCUB42O4EUF3w6Tl+xnC7jUK6ioLuNCby7o+Cn+ASvNyNkRjM5tnIDa8az2JPnIt9QDYy3GvKF3oNVKK1b4F5WkOfFORU+wjqCCziieJjqmdEGcbg9O6kJJJsoAp+G/m9PoMYOqM9bqRobAyR+g83M99Jk/aF5eDOh3XZmPHEOJD23JDDRaUO94DGscdLEn2viRSLAmmvTay/CnfRJ4p8GcBAc/MsuUmXT8Men5L0P7lGf5rZrwKJPTFr4gImwKqnLd4DBnHgQRwDsvSU=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(346002)(39860400002)(376002)(136003)(396003)(31696002)(5660300002)(38100700002)(186003)(6486002)(36756003)(31686004)(83380400001)(16576012)(8676002)(6666004)(86362001)(4326008)(4744005)(478600001)(8936002)(66476007)(26005)(66556008)(956004)(66946007)(2906002)(316002)(53546011)(2616005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bTRoVkVlOTdBTHhuaEVKQWtPV2ROcDYyYWlOT3FjQ3BEb2YxTytSTzU3NC9U?=
 =?utf-8?B?aWhyMEpxZ09FUWtIM1FTTG5qODhqS0Q5MTV0YU41TXBxSnFoUUpGVlpCNlhD?=
 =?utf-8?B?NENXanVRTVloRnBVc1FhY01DRnVUZEJFcGFFMXdGdEU0a3N3MDNSbWc1ZktP?=
 =?utf-8?B?TzY1MkFVWHpETVNUSElzUTdrakh2OEZyOFJmQ1hBeWtMWllSOC8yeFhXekp5?=
 =?utf-8?B?L3NNc211UGhTdlRlRzI4anoyeGk4alZsbjJLcTNycnR2Q3NZRkdOVDlXTWFv?=
 =?utf-8?B?cWtLWHdvYlVDOTNZSUszZzdxeW14YmppRkZuOWpSMi93MlFRNGdORkhwMjdO?=
 =?utf-8?B?bjhiZEFLQWdPOEJFUFhZWkh3Q0FnbVB0MC8vZzVkUVBNWHlJcllyTStSN0hy?=
 =?utf-8?B?dW5HUWNLNVdiNUR6M0pWRUVGeHJlRDA2UmtZWGRZYU1rbWRmMTRzTWZQYU5x?=
 =?utf-8?B?WWN1ajJtcmszVHJZUVRMeUpUenUxazlFWFc2a2c4Q0ZnRm0zclhaQzVrZTdF?=
 =?utf-8?B?UDIrMi83cDZuaUoweW05MVRiTkFlRVptVy9PRWQ1ZjM4SzlyYVNOM3ZGY3BX?=
 =?utf-8?B?eGNkWFFGbllOcmNKbWo2RmFVMnNkS2JEV0FDeDkyNHczd2oycGxPS0REaFBN?=
 =?utf-8?B?aWRzd0UrekNyYnorVHJBZVpMUHdCakxOcS9CNXVKcDNSM1BsNWM4WTNWWmRi?=
 =?utf-8?B?OFFhK2pJZGV2NjgyblFWdnpSdDJYcUpRUU9aR216OWg5UndudjVXWHNOT21h?=
 =?utf-8?B?Tld0RFRtUGFwZkxZY1Q5ZHgxeGJRN1BISVVieE9xK0tpazRYQitJUy9zN0Fx?=
 =?utf-8?B?YWlCWTZXbC9ndHhQNWIvZ3Z4RW91NFRhWXpPZjM3SlFlbE9OelYxOHQrYlFF?=
 =?utf-8?B?Y01kdjRyVnBxR3NBelpHTEgxdXgzV1JFcVNPUU53OEFLQU9hZGlHaU9wVDVv?=
 =?utf-8?B?dXlGWm8zMFZGSDlzOFkrbk42ZVU4UG5zWkI0c3RoNDFaV3psYTVhSThvUjJv?=
 =?utf-8?B?VGdaSUdtYW1ENXdmVEhBSWcvTE1aY1ZIVWNmdzhpcDB0WUZUMlZoeTRhSVRW?=
 =?utf-8?B?SU51eC9IeHJ0V2pQV3c2TEZrdjBaWTNkUmJ4d3lFZDQ2a0xqKzhoVXhObmxY?=
 =?utf-8?B?R2RLNkN1UFFEdU9rdy9LbGRaendLWDBjMWFMRTEvSVRKTHp4MHhnT1BETlZn?=
 =?utf-8?B?TnN0emg4VHJiM1NhbWVCTW1vbHlUY2pzbmdsNGlJZTIxQXViWXFreGxpTndi?=
 =?utf-8?B?NUR6M3FsQ2tvNmNuZ2tiOWl4Wk5BS0IyRDJGemwzNkUyc0NneHlmOGVSdXZl?=
 =?utf-8?B?N1FKSjVlZE9JaUFER0kzc1VKaG1mK3lQN2pMaVAwZ3R3UGgxNmg4eGRWZk5y?=
 =?utf-8?B?RERlVEhWd2ZSZzdDdTdDWmFIK05BOVErMXE4cUdZSy9jVGpNYlhMV215aWhu?=
 =?utf-8?B?Nld2Rk1FeWdZQ2R2Q0wwdUhqYmRVWGZ1ZHQzZVBxOHM4N1E4QURXbTZraTd0?=
 =?utf-8?B?OUs0Vy9wVytDdTdkQWg5MlFYLzJqam9XNEtEOXFucFR0dnJyaXdqTzdmcm1p?=
 =?utf-8?B?TE16dmd0Y0hRVHptZXJFWXdmenVNbzBSb09nWG9sV0dnTXBheG10bHdzREdv?=
 =?utf-8?B?alFOaE8xcE9DV29qd1FraU9nYkRXQXg5Qk5FVnhNaURBRSs3K1FGb3diWGR6?=
 =?utf-8?B?NVVhbm42azR6cEpzWW1qRG5DVkt5ZTZNM2diWUdGcTNMRGNreXJTWWFBbml5?=
 =?utf-8?Q?TPuAVmhdQC2HodtKSmrPGrxGqYSycDFVPykvWy5?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ada8d669-b6f3-4151-0a03-08d94204d246
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2021 11:37:52.6572
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sL/RlpMs+pdOdMtffi45DiUIhxJxofOX21i8RFGb8Bf33O9ptBEXX4doS7QkWTWMakdXOePKQZL8XFP2E5FbyBMsfhWsWy8I9aRUA5IkxiE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB5534
X-OriginatorOrg: citrix.com

On 08/07/2021 07:29, Olaf Hering wrote:
> To aid debugging build failures, dump /etc/os-release during build.
> This helps with rolling releases such as Tumbleweed to understand the
> state of the build container.
>
> Signed-off-by: Olaf Hering <olaf@aepfle.de>

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

