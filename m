Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BC5F635DFED
	for <lists+xen-devel@lfdr.de>; Tue, 13 Apr 2021 15:18:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.109754.209479 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lWIv8-0000S6-TL; Tue, 13 Apr 2021 13:17:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 109754.209479; Tue, 13 Apr 2021 13:17:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lWIv8-0000Rh-Q0; Tue, 13 Apr 2021 13:17:34 +0000
Received: by outflank-mailman (input) for mailman id 109754;
 Tue, 13 Apr 2021 13:17:33 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UdUp=JK=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1lWIv7-0000Rc-HC
 for xen-devel@lists.xenproject.org; Tue, 13 Apr 2021 13:17:33 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7cee59a6-1fc5-4bd5-a970-29e7633675e8;
 Tue, 13 Apr 2021 13:17:32 +0000 (UTC)
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
X-Inumbo-ID: 7cee59a6-1fc5-4bd5-a970-29e7633675e8
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1618319851;
  h=to:cc:references:from:subject:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=8y6Zm545iPg295ZlMAIPKP2ci/v6t9yGaJK99+2o4xg=;
  b=Hex8cdjMZ4p8BVhfjfKtYZjb1kyTTWeZdOAhIMhQi0TA+GsTUUdpknYF
   56Qd/xr0csrkg5z4Y1xXMAkMpSwpi3Yj/92C21gr8fbkDfL09eRnBgmVs
   RHkIWbIli9n+WTXZ4Ig2xg0ML8BvZzXuWAqZ2PHXypjHwedHIUDYpV2Fq
   8=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: upUcqEpx7as25A7HmHKbDt6+PmdpOOx54tmRhTC9Qi1xMDwF6tLKVk9PfaAP+A88/fuYUI6Cfa
 Drv0LjRQApx2LkyrMAaAgarfilGkVso4PFpFuxHS6a7946KWurOnShKr+LmqSuWAPa2MbCnx8H
 e3raKDf0MlEdvMdoRWZOTyY326L2y0D7ZmDg5uOmnzhLFLsXXxuF3cddWZuRKJ98xnX9jbdSwz
 CpFQh6bYyDfdGZRhmE3zHTBGRrSn054Y0VCDLkHJ+2zyaDb532OJx5Goe3TfHcdBCgFX8TZZDo
 joQ=
X-SBRS: 5.2
X-MesageID: 41478845
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:jvLxJ6gIGudphcdPrtSYc7+h63BQXwB13DAbvn1ZSRFFG/Gwv9
 yynfgdyB//gCsQXnZlotybJKycWxrnmKJdy48XILukQU3aqHKlRbsSiLfK7h/BP2nF9uBb3b
 p9aKQWMrfNJHVzkMqS2maFOvk6xt3vys6VrMP/61socg1wcaFn6G5Ce2SmO2l7XhNPC5Z8NL
 f03Kp6jgGtc3gWcci3b0NtN4T+jubGiY78Zlo+DwMngTPksRqT9LX4HxKEty1uMA9n/LFKyw
 n4uj283IqPmbWRyhjQ12jchq4m4ufJ+594K+GnzuQQIjXooA60aIpmQK3qhkFJnMifrGwEvf
 OJjxA8P9liy365RBDInTLdnzPO/Rxry3j+xUSWiXHuyPaJOw4SOo56qq9yNj76gnBQ2O1U4e
 Zw8E+y86dzN1fmmh/w4tDZPisa7nackD4ZvsM4y0BEXZB2Us43kaUvuHl7Pb0nByzA5IUuAI
 BVfbrhzccTS1+cYnzD11MfpuCEbzA2FheCdEAIptaY5ThQhGx41EsV3qUk7w49yK4=
X-IronPort-AV: E=Sophos;i="5.82,219,1613451600"; 
   d="scan'208";a="41478845"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZMJcUUyQ6NsaIgHlanLpd3N5VNX1iohUmq6Q3sNfmyxQ7a17OoNTkfCA+ILGopEIZWTusottGjVGvu5OF8HdywvwOrXnrV0To6+Zw6PWjtjmpBuWIXiORLp76Mt+10fSX2wdA0J9/WlPyjrrQk88YKAStBAFkGjnFVxN1qSMBEFZ8mQca4+mb9+0Z0Jli6ENsY1dT83nQOQp52GwguoO6QEBAoJ87eOf7MP1Svmr+fT59nVvZa/BAwLf35vektt0rkwZ4Y4y7bKAfeaMxb+NdtcA7TMU3d7LT6ihnNrzosJ08TCrIg4BNTY/eXHVUmCmwAdQkwpdExzaMm66jFKq/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XU6SCAC8tSqQ5SZ56GRk5s8jm2BTCkOODkOEpV+B8rE=;
 b=G02R1ZJG62IiIAivvaTQ8MEUNcS8PMgufL9wcDcKIr1XCYJKTgtZU27KMg7cudMQudmMxM55k12cHkRDpUgllcRL2phpI4piNQ2NEsHjijdCbiJ0R4+cmfNsj+he2X+DLalmNGVWHjh6gKm3UbgB8kNc0dQGMh+LkBzwTkS+/EY4LhwmtjEIWrJMpDpG7ZlL5ADpCHxwBSycA6Jnsi/aF0QPoOJ/7zkX4yvKjox5CSV6mRG03OpqtUZDOU6Fgg/nMIsrezF2/5gO6tY8ptNJWMnFkwDotzl12jiIAFcmyY+KM0lSpHr7P19WPejfbvPurGgWYYsA+YUiXlv+Rtb1XQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XU6SCAC8tSqQ5SZ56GRk5s8jm2BTCkOODkOEpV+B8rE=;
 b=cJlcy8BIkwd1oUa3dWn/0MgjE8LLdGZf9rSau1fEhK0enWhg0pQe2nboFGTnt601YwjO6FJe9ilCSFpu8Sop+Eoqe1FSCIfX7AmSq+gBzfzh6A76qTKZRUR63ihk2emVDqsLIgPh/BgkJV/JQ7xhWJxA+0gqyZguC1OPpIS6uho=
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <0753c049-9572-c12a-c74f-7e2fac3f5a24@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: x86: memset() / clear_page() / page scrubbing
Message-ID: <21c00073-86a8-a040-fa40-e99e2fb434eb@citrix.com>
Date: Tue, 13 Apr 2021 14:17:19 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <0753c049-9572-c12a-c74f-7e2fac3f5a24@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-GB
X-ClientProxiedBy: LO2P265CA0076.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:8::16) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3d19fae2-0666-4031-e1fb-08d8fe7e7aed
X-MS-TrafficTypeDiagnostic: SJ0PR03MB5837:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SJ0PR03MB5837A56740CFA04A2405F799BA4F9@SJ0PR03MB5837.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3SXxVZJxbgiZnGBmBREeObYrOu7Jjw7EUYziwodJICZvh18uUDiLOz+hMthCmxdjAHCNSdQJa7wg/gqEtCNSqrLQpiOZDXxHYbqaPpqHkWvMU3ONUbz5igynfz7dq8CiqP4jmgfPRldXQt2re+tXtY15CmwYH8OIsCxLHPlM3g/+SgRxOuDXowKVxM7Vcu10UT0RRXtYFI8yHtd9G0iZujJkYN0rlHxBSq6udDDMazo8oFjZibHd+ecMOxsdDh1uAS4LVcK6rEmd1y+DcGGPy2Lbiz8TTAvPRflwkzwqDDg71VhwqKt9sAZ3RthKasVOZOKE3uFpI0OZOK5IcjLbDepgSCU/YtbEC2LCz6rhJCarnoKjkfm9dWGCtBzdUrqgDzfs8V+HcE/q4nYFlWyGtxqwWCaj32he/MFCih2pFrXRuoXSb0FqrLVDUETmyE6yA54AylLu6DI087emz80wMuuRwFKzOwbDhq/w5GKhoscQToYMq6WBfPwHsyK2VfRuSkP1lATi1EEgdRFFWf2Z4omzKUWAHFg/GFk5Ux+kHNr2BSjueS5N7VqRTQMdW5HewRif6zWzONSbCvcuej7rUf66uxVY3p7Wac9VaddNIeDIIep/XqbejMJhQLF9Y5OezZP2h+xIuvNR3xzB+pMErmFetF3vkJJXZ6f4gCq1yHO77hbz2vQAhIPsNu5Vcoxz
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39850400004)(346002)(396003)(136003)(376002)(366004)(2616005)(107886003)(4326008)(956004)(66556008)(5660300002)(186003)(66476007)(6486002)(2906002)(86362001)(66946007)(38100700002)(478600001)(83380400001)(26005)(110136005)(316002)(53546011)(8936002)(8676002)(6666004)(16576012)(31696002)(36756003)(16526019)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?TFRwVU4yeVJoME9KWURtUVo4akRvN2Z5bGtya2cxUnhRTHVMcGdDbzFZTTdK?=
 =?utf-8?B?L1lacEZkQ0YzaU5LQVBTUDMzR05vaXQyZXlLOXJQMFBMSTZhMS9PYWJTL0hT?=
 =?utf-8?B?b2dMYjgwcG5ISHJxaCs0VG5RY0FFWHVqZ2FCS2xnL0NWem85R01JMTJCaWl2?=
 =?utf-8?B?UXJYWWc0RnpCeVVwa1I3SkNTRkUzSkJhOWdrQzd4ZEVrR1ErU2FvemFPWFVa?=
 =?utf-8?B?MXNBNitheVZJQnNjSjZCNGFtYmRDSWR4NDVXblRVb2s1QjQwaVVnSVRrVTly?=
 =?utf-8?B?WTY1bHRSZk1leXUzR2RDVS9KM05HUGoyNkZ0R2NBZEV4bXFJM3h4dVU5N1VE?=
 =?utf-8?B?akpBaTFySXJ0OHlVbVpUMFZUd1VpOW8xMTRic2hkOWczKytIcVpKRVNYYUcv?=
 =?utf-8?B?R0FwY3pudVhEZXhDblNJYzZmb2dVVVU1dFJDR215SVRQT0ExbXMrZTZOZzBE?=
 =?utf-8?B?UFV4NHFOVWhZOG5hVHlCMzVWNEs5S1JzU1pmc0JwWkVtS1o1NnlHSmNnS1kx?=
 =?utf-8?B?dlI2S3RzRFlaVk05eDZqdTllK1hEczRXMC83TkgxTitlVWVaSm9RVWNHSHYv?=
 =?utf-8?B?cVByeG1PNmViVVJjS0pFM1JnZnFFcXdFOFRJMDVYdG05b21XbUJrdlZjZEVr?=
 =?utf-8?B?MG9jTFRPOXdoRGJyYnVCckozVll4OE9mK01sYys1ZVNsL01qQXdKNkgrb1U4?=
 =?utf-8?B?WUFTWkNlZ1Yrcjc2RWoyNnh2cmxzQnN6M0EyZ0FVRGI0MlEyYU0xQjlYaDAw?=
 =?utf-8?B?SXczT2ZEVVpnbFRQdEl5SkZObTJFWXhDZ0ZpdHQ4ODRkYUo4L0JKU1IwM2kr?=
 =?utf-8?B?cVZac2lPNlNhcEFWb1ZKOUh4dWI1TlVLTzNTenBYVXZVRDZXK3RKUm9Nc1ZF?=
 =?utf-8?B?NGNLWHYwSW9NdjdWdnkxKzREaVBKM1JvbHBUMnc5YTUveElROUl3WGlQeGps?=
 =?utf-8?B?eWJvSlYwcG10QTNUQWwybHZmeUE1YnRmajVoNGE3TnNZUE0zMzZJYnhyOFY5?=
 =?utf-8?B?RExYa2UyS2pMS25TanhEdWRqZUwwYmNEejNtbEk1aHgrWXVoY1pOcVVoa1JT?=
 =?utf-8?B?bGhhYlM0UzkwNGE4d2ljY3FZNktwS2QwNUNVVHZkWFBBWDdKV3ZYajZ6OXVK?=
 =?utf-8?B?L2lpSTkxNFBlejhtVExlYlJMVzBpbWVvbFJqQmRaeW92Qm4vNlpNSnNPcTJ0?=
 =?utf-8?B?NUN3N2svaWczcEg1SnE4RjdiV2d3eVhkRE1EU3NQdlRncFlrRHdDMnRHdzVr?=
 =?utf-8?B?a25TeVVUZncvVDRiVW1CSWhoQUtGZnNSTlgva1FhWjcxN292ZzdjYlVxNUYv?=
 =?utf-8?B?cnVEckZreGhHUlBGeUZrenNlaHE3VnV5ZUd4RSt4dWpjV05WNGcyR2xPeDd0?=
 =?utf-8?B?YTRxNXhPU0llQ3kvcEJqNjBJaVZwRVJPYitSbXR2SVpkTFJ1bDdQTlJMVmti?=
 =?utf-8?B?cmVzT2c4dzB6d2VwcW9KQlI5UTRqZytkckN1RGtJT0o0Q1VwOGo3TUZ2TGNF?=
 =?utf-8?B?Rlc2VzdIdVBxbFdEWTB4VE11QnJ5NWdCdmY1dWY2M3FzQU5BMGl0V1NoYkEr?=
 =?utf-8?B?T3U1V3dERWw0OXZPajdkWDBoUkJ0bTdDaXlXKzVuc29IekpXcExIYU8rWlNZ?=
 =?utf-8?B?djhuN1VQQjUwb0pGUDRNZGlGUkU0U0RiKzNWQWdINFIxK2V4WGh2b0V0NkhW?=
 =?utf-8?B?dzAvcUpRZzdnc28wUCt3RjNRWElPZU9NVTU0OGtBWG84RTAvYkk2OUoxdTNJ?=
 =?utf-8?Q?u3LQEiq0oLHBQFLy0zx1UNMAa8eUR62fa5+B/03?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d19fae2-0666-4031-e1fb-08d8fe7e7aed
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Apr 2021 13:17:25.6538
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9Ok3dRUIk/rYPl1+ak1pTo3/p92n6bwChBvNZZrO8diAhqxZTErv7DxmDHkJNEFJu3a8dufCX7RBvCs5ED1+HowcU6BLPoSqHQIG0SFprf8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB5837
X-OriginatorOrg: citrix.com

On 08/04/2021 14:58, Jan Beulich wrote:
> All,
>
> since over the years we've been repeatedly talking of changing the
> implementation of these fundamental functions, I've taken some time
> to do some measurements (just for possible clear_page() alternatives
> to keep things manageable). I'm not sure I want to spend as much time
> subsequently on memcpy() / copy_page() (or more, because there are
> yet more combinations of arguments to consider), so for the moment I
> think the route we're going to pick here is going to more or less
> also apply to those.
>
> The present copy_page() is the way it is because of the desire to
> avoid disturbing the cache. The effect of REP STOS on the L1 cache
> (compared to the present use of MOVNTI) is more or less noticable on
> all hardware, and at least on Intel hardware more noticable when the
> cache starts out clean. For L2 the results are more mixed when
> comparing cache-clean and cache-filled cases, but the difference
> between MOVNTI and REP STOS remains or (at least on Zen2 and older
> Intel hardware) becomes more prominent.
>
> Otoh REP STOS, as was to be expected, in most cases has meaningfully
> lower latency than MOVNTI.
>
> Because I was curious I also included AVX (32-byte stores), AVX512
> (64-byte stores), and AMD's CLZERO in my testing. While AVX is a
> clear win except on the vendors' first generations implementing it
> (but I've left out any playing with CR0.TS, which is what I expect
> would take this out as an option), AVX512 isn't on Skylake (perhaps
> newer hardware does better). CLZERO has slightly higher impact on
> L1 than MOVNTI, but lower than REP STOS. Its latency is between
> both when the caches are warm, and better than both when the caches
> are cold.
>
> Therefore I think that we want to distinguish page clearing (where
> we care about latency) from (background) page scrubbing (where I
> think the goal ought to be to avoid disturbing the caches). That
> would make it
> - REP STOS{L,Q} for clear_page() (perhaps also to be used for
>   synchronous scrubbing),
> - MOVNTI for scrub_page() (when done from idle context), unless
>   CLZERO is available.
> Whether in addition we should take into consideration activity of
> other (logical) CPUs sharing caches I don't know - this feels like
> it could get complex pretty quickly.
>
> For memset() we already simply use REP STOSB. I don't see a strong
> need to change that, but it may be worth to consider bringing it
> closer to memcpy() - try to do the main chunk with REP STOS{L,Q}.
> They perform somewhat better in a number of cases (including when
> ERMS is advertised, i.e. on my Haswell and Skylake, which isn't
> what I would have expected). We may want to put the whole thing in
> a .S file though, seeing that the C function right now consists of
> little more than an asm().
>
> For memcpy() I'm inclined to suggest that we simply use REP MOVSB
> on ERMS hardware, and stay with what we have everywhere else.
>
> copy_page() (or really copy_domain_page()) doesn't have many uses,
> so I'm not sure how worthwhile it is to do much optimization there.
> It might be an option to simply expand it to memcpy(), like Arm
> does.
>
> Looking forward, on CPUs having "Fast Short REP CMPSB/SCASB" we
> may want to figure out whether using these for strlen(), strcmp(),
> strchr(), memchr(), and/or memcmp() would be a win.
>
> Thoughts anyone, before I start creating actual patches?

Do you have actual numbers from these experiments?=C2=A0 I've seen your pat=
ch
from the thread, but at a minimum its missing some hunks adding new
CPUID bits.=C2=A0 I do worry however whether the testing is likely to be
realistic for non-idle scenarios.

It is very little surprise that AVX-512 on Skylake is poor.=C2=A0 The
frequency hit from using %zmm is staggering.=C2=A0 IceLake is expected to b=
e
better, but almost certainly won't exceed REP MOVSB, which is optimised
in microcode for the data width of the CPU.

For memset(), please don't move in the direction of memcpy().=C2=A0 memcpy(=
)
is problematic because the common case is likely to be a multiple of 8
bytes, meaning that we feed 0 into the REP MOVSB, and this a hit wanting
avoiding.=C2=A0 The "Fast Zero length $FOO" bits on future parts indicate
when passing %ecx=3D0 is likely to be faster than branching around the
invocation.

With ERMS/etc, our logic should be a REP MOVSB/STOSB only, without any
cleverness about larger word sizes.=C2=A0 The Linux forms do this fairly we=
ll
already, and probably better than Xen, although there might be some room
for improvement IMO.

It is worth nothing that we have extra variations of memset/memcpy where
__builtin_memcpy() gets expanded inline, and the result is a
compiler-chosen sequence, and doesn't hit any of our optimised
sequences.=C2=A0 I'm not sure what to do about this, because there is surel=
y
a larger win from the cases which can be turned into a single mov, or an
elided store/copy, than using a potentially inefficient sequence in the
rare cases.=C2=A0 Maybe there is room for a fine-tuning option to say "just
call memset() if you're going to expand it inline".


For all set/copy operations, whether you want non-temporal or not
depends on when/where the lines are next going to be consumed.=C2=A0 Page
scrubbing in idle context is the only example I can think of where we
aren't plausibly going to consume the destination imminently.=C2=A0 Even
clear/copy page in a hypercall doesn't want to be non-temporal, because
chances are good that the vcpu is going to touch the page on return.

~Andrew


