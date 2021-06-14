Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FA203A6D52
	for <lists+xen-devel@lfdr.de>; Mon, 14 Jun 2021 19:37:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.141761.261752 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lsqWI-0008O5-Fl; Mon, 14 Jun 2021 17:37:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 141761.261752; Mon, 14 Jun 2021 17:37:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lsqWI-0008M0-Bw; Mon, 14 Jun 2021 17:37:06 +0000
Received: by outflank-mailman (input) for mailman id 141761;
 Mon, 14 Jun 2021 17:37:04 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=AGyB=LI=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1lsqWG-0008Lu-Ki
 for xen-devel@lists.xenproject.org; Mon, 14 Jun 2021 17:37:04 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ea170588-72f4-40a1-bd22-b136fc9a0647;
 Mon, 14 Jun 2021 17:37:03 +0000 (UTC)
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
X-Inumbo-ID: ea170588-72f4-40a1-bd22-b136fc9a0647
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1623692223;
  h=subject:to:cc:references:from:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=+lvXVQtxif1hpySznCBoQ70l4iST2DnGRk06jdEHwrU=;
  b=HPsX8bBdPmXLIQW2vn9K6eLuB2jjbajzKZvkSNuZ2nCAMsEMD2XBMLpL
   Uf+rXDZ6CoFed33KiyBngJgPcRjWR5l3SD2onxpf3LM1zk/IlPLZBt5+S
   EyT+Y5KREeSowFx0nm3ma57j81KkyJhZsoYbiozpM4JGQQv64lJP+t6vJ
   I=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: geFQI56TdYjUmNR7E+fUq0iX8yCr8sfnsYbqbczihcowwGM3M4UmKTn5xiGThudYFlJQcy+3cp
 NmLwNoJ3aCw4JyeVae86ZGqJd9vjTIZs8EDQWPY5NaGzSk6OFYQwkXRLW+Fglb+2BOs+bb3IDW
 Qctb9TIoo5v8XGw8TDFZbfV/s557kX+4K1tFaDZFFd5RdLwiA+XF20pF7vD17efW2V+kc3GI4K
 eqLY/lEnoaHnKGhX93OR3+0iHg8FFMxUVlaw6uWg05kwCcFAkvVmdW8CC3x+NSEU3PKjBcR5AL
 F9M=
X-SBRS: 5.1
X-MesageID: 47668895
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:guuaY6MHi7pB8sBcTyX155DYdb4zR+YMi2TDiHoedfUFSKOlfp
 6V8MjztSWVtN4QMEtQ/uxoS5PwP080kqQFnrX5XI3SIDUO3VHIEGgM1/qY/9SNIVyGygcZ79
 YcT0EcMqyDMbEZt7eD3ODQKb9Jq7PrgcPY55ar854ud3ANV0gJ1XYLNu/xKDwSeOApP+tcKH
 PR3Ls8m9L2Ek5nHvhTS0N1EdTrlpnurtbLcBQGDxko5E2nii6p0qfzF1y90g0FWz1C7L8++S
 yd+jaJppmLgrWe8FvxxmXT55NZlJ/IzcZCPtWFjowwJi/3ggilSYx9U/mpvSwzosuo9FE2+e
 O84isIDoBW0Tf8b2u1qRzi103LyzA18ULvzleenD/KvdH5bChSMbsFuatpNj/ir2YwttB116
 xGm0iDsYBMMB/GlCPho/DVShBRkFauq3ZKq59Qs5Vma/pYVFZtl/1YwKsMe61wRR4SqbpXU9
 WGNfusoMq/KjihHijkVgAF+q3YYpwxdi32D3Tq9PbliAS/MRhCvgMlLfck7wE9HaQGOtN5Dt
 T/Q9NVfY51P4YrhIJGdas8qJiMeyPwqSylChPYHb2xLtB3B5uKke+s3IkI
X-IronPort-AV: E=Sophos;i="5.83,273,1616472000"; 
   d="scan'208";a="47668895"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K5KNWay1OtnTEChhCywQBXxtbNbCUoIOEX/SdRNPqpVyQtfQvCK2j1DPZ14EkrK/P7Ij/V30Fz4LWxVl/u8ZxFJgVEyJK6ZQw4VnrD+Zs0f5Ra8+vc1klHqbrGdtNTWioVvOyO8pxVvYHdxsqHxfw+mDe5q6vcxyJrLqMbdfV64vtlz7hARj2eEuVu/evJcA1dEufs2svz+PARpQzDMP4UAJ7j1tBqMXdizYaQvrx6LWUjPgoD+HZSU6lbd644LaGWvG8Xl7oqIQQg4I0QrbmXBYsgDfSeoI+tvgLyjrgbcVmU/yT8qEyAHmN9qVo8VCzYP0iKRPnPzeEohukiRqdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XrO1I7RtTsJNiVkcx05KnjXlIafK7T0CJKH8Yf3+WcY=;
 b=O3iHqtyLsPmj7fdfkNUmfRx0O8hmxGoiAOMmZadGft5MqbALI0NfkwUI0dBC5+TVMTjSF9Q+fFdiOHsS2TQUOR8PqgVC4isorqFwMvIKJmyYO4KEFuRVYez8loDt3ed5OJUN5E3GsAXBwePxHjdS5L3ad4i72H7yNsir4h/zEKMyslvd/h+kJ39sXxeqjdfyGFn/qw6dnntMz8fWULD2eQltwamQ1FJn1V2+CXCp0cwW+mdSXtXqgwa1/sHikFxWyW726BoiQUweXrWRh7b1DM2YiTDz1axCQfJhjEFAi4k/rK7MyjxBFkrhY0uYBXyth44qmQG46vmPJJ9Ml3bcHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XrO1I7RtTsJNiVkcx05KnjXlIafK7T0CJKH8Yf3+WcY=;
 b=cAr/PaKU1ZAmG0bxAA7lzezn/UARK7ql8DZ3uVm4RqUAESZoFdar97veJh8vyfH7z2EvNxSM6RK9HIA8ySaOD5R/q8aAo8pzwQdYvxmi9JpnieOLJKX0j8A+vEZW54vhjiGXIevL+on2r7SKsLgS6w6eUtMswy7flkpEdjICvxA=
Subject: Re: [PATCH v2 5/5] tests: Introduce a TSX test
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Igor Druzhinin <igor.druzhinin@citrix.com>, Edwin Torok
	<edvin.torok@citrix.com>, Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu <wl@xen.org>
References: <20210611163627.4878-6-andrew.cooper3@citrix.com>
 <20210614161317.31481-1-andrew.cooper3@citrix.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <2288287b-a4bf-119a-1391-80afe203fa6e@citrix.com>
Date: Mon, 14 Jun 2021 18:21:13 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <20210614161317.31481-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
X-ClientProxiedBy: LO4P123CA0291.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:196::8) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ff256b55-e6b6-4612-90b3-08d92f58d2e2
X-MS-TrafficTypeDiagnostic: BYAPR03MB4120:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR03MB4120653869A7E4093E7A82C2BA319@BYAPR03MB4120.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: NqXLV5vznC8O3vfdFJVnuBB38t6R/LxbLHRuUg7MVdjlgn6cLg8HrZK9dX9fttg3gaS69YcJktI7rzsMIsy2FMsWaTX5iUa0X6nrMbfAh/jm2jmZ4G0R8CCjFOOB5gzT1uAVp1O00e0fjXlQWGIbPiz6nDR/+8m3UJ2oIIaNnCaU/Z74n7DteQ3l+1fCrDszh1XOske9seJuZIbmS8GK3JXFw0ee5QxF3VBRtAQ8W7JdVPJ7H9fS9V5Oq4YW1krINAqSmLpoI+c11LskpVDFvONtrhfkqoVCfrOkymGsri7mmzHhgKHM3DZIwjMC0xKIZuJUOL8+8rdAuuJUaa522Kx/ZR6EWd1lRCwSleXvHx6Ji8/DuYDAuYfH8kZS/4bWEcfE9hQxHvSMnA9vNazxsPCLyEUxiD+lZ7NKYj3gLM5rcZXBHz2IfwSNaGMFKL07hZdTsdc0n0sAn5rL9+SRCQLL+LGDNukRA8z92bGQBhJ4RVldr7cM54RJw9GsWIvrNmojQKQ2hXjCwzFfS9VRKcZRPjzHAiQro6hCANbzun4wStVf7bu+KD8e8LTaWSJ0TkK5l40DHWK8wj8Uf9TQHsuMcY25X3UkUXK/ewTuz1lb06Vai5PEN48ACDbB8R+gG29WrtblESV5nQFSQAxH+UcAEqUBFWMsUrb+zcJG/UctoZ9n7OEswHEFgzIc7hXUnyo0pbC7VAmHDodaIYgeYwF6EV2xRP285ymSn2Pz8SrBu8w/NW4VlfXo7jR/ubSBIyC5t1mVy5M3UzPz+STAf1fYzqXhF7fcE4ixdnLdbbg=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(39840400004)(136003)(396003)(346002)(366004)(53546011)(478600001)(36756003)(31686004)(83380400001)(186003)(5660300002)(8676002)(16526019)(54906003)(4326008)(2906002)(6666004)(26005)(6916009)(8936002)(966005)(31696002)(38100700002)(66556008)(16576012)(66476007)(956004)(66946007)(6486002)(316002)(86362001)(2616005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dFdPTTNKTHpPRnVOUHVKbEU1VzVudSs2aHV0MFA1RlFzbWdCUzNRSnhYYmo5?=
 =?utf-8?B?aE5RMUVUbkxudzVIWk4yRXdlTnY5NnM3UXNFeWl1dmE3aGZDcXN3TWczeFBI?=
 =?utf-8?B?NlJxVExWVEt0dW4rdkRaekViY0FTbjFMUWU1TXM5bnVqdEM2aVRoVWlUY2xS?=
 =?utf-8?B?RHM5M2VrSWtpR0s0eXk3bWFYVXlqYkJ5Z2NvNDJUSGtDcUxRRjhSK0JYQmQ2?=
 =?utf-8?B?SmlhTE16aDhsV2JPeXNxM09BVE1ITmJQdXg2UG1mZ3dZaWNhc0djRUZRUnBl?=
 =?utf-8?B?d1dXd2NCSlhyQUJ4T3FNR1NQVS9mdFRvUWdldld1eHVWSUZ0NkFsc1FMSjY1?=
 =?utf-8?B?RnNnTWxaWTVwT3dSLzRjYTVNMExnQmNWc3owRFZzZG0rcW1hUjJINXg2QUY1?=
 =?utf-8?B?MUEzNEZERjJEUElaNnpGTHBFS09PM014cVpxSjB5SFg2aFE0bDVmRFJOalYv?=
 =?utf-8?B?NndIMXhKWnM5elUvRTU5dGNWdG5YSUk3a1hYSm0yWXRua3VmNUVERGZxdmJP?=
 =?utf-8?B?b1RFK0FWRWN3TlEvbUtqZzlzWEM0YkhNcHNYbmRLZnVmMEYzaFRzVWpCWEll?=
 =?utf-8?B?RHFIR1hrdUVRL3UvL3RwemN6SW5VUlFBSmtZTXdvdGhVdGxqUENlazl4OVRC?=
 =?utf-8?B?MFJpNC9OZ0RFY0xQUTJ4NDN1YWVGTzI3SWVCemQ4bkVPSVRHVzhjZk9SV1M2?=
 =?utf-8?B?RmdKV1FkaGtRR0didE00M1lZZEVHY1NDMzJxL2hDdlJKRUVjTE9vcE1TUFk5?=
 =?utf-8?B?eXNsK3hNNU9tL241MHhZVlRIaUlKWDBSL0xoUVpzbkpyalc4US9iMWpmdHhi?=
 =?utf-8?B?NXphQktFdEt6cTdxL1ZSQ2hhQjA1djZqRWpFOVUwcjh4cVM2QmYrQ21wdnhB?=
 =?utf-8?B?V0ZORzZjS0RGSWlLTmlzbTJsTm1kbzNPR096dEhnTWdqSWJQUzdIN0crYTlm?=
 =?utf-8?B?clNBVURYUWhqejNhdjd6a0Z1elZ5akpNQUFiY3dzTit0ZFY0aTNocGlKNTBH?=
 =?utf-8?B?eFNUUXVDaHB6ZlhtK0UyVGZZT0NtN2lReWRHWWgrdHhDdjhiaXZxUElEKzJD?=
 =?utf-8?B?VjN6VXNxclp0bUg1bEwvTUlESmUzSWxCdU85bDVoZWFKeFhTbzNEL2poQUhR?=
 =?utf-8?B?dVBCUXdLMUNNTEQ0RXVidVhHVHc4Qy9YT0U1QUtpZjFyR2JpWmxqUjZNcnla?=
 =?utf-8?B?UEY2RGM4M0E5L2pBRk5Mcm54NE8ySStlTWtUWnBWWmxheWxMYWdRN09pOXYx?=
 =?utf-8?B?V1VWT2QwelAzby82MjlwMVhzTXdnRXNUT3dvdHB5OHg3YVZhSjhVTDZjTEhZ?=
 =?utf-8?B?SDJ6N1Y3RGpjY2pVMUp0bitlM29VK2pZMHQzZWUyNHBLQXlNemN0RlNQSVVa?=
 =?utf-8?B?RTA3NDI4TXlDQ3ZOQ0ovU29uSmRndEZPcHpndUY3bFVIblNTWjdMNXZNREZL?=
 =?utf-8?B?RzBPUmdZYURTNmt1czA5bjRWV2JLUzg1VDRUcnNCNyttZ3VIS05IRGQ2a2VJ?=
 =?utf-8?B?a0k2czlCNlc4RDZXYWlQRmZtSlFYQ1o0UUlpSllKKytabkhuUEpnYVhTVU9k?=
 =?utf-8?B?Mmhpc1d4M2NyRVBFOXdyWkNUU3AyOW9GRllsdTNsblh2b3JITUdUUFRCbGVJ?=
 =?utf-8?B?UE9nU3VUODRjRUx3ODRSYkI4b2NuaVgwNTVWVC9JcjdocVpNRHd4ZmF5ZEEr?=
 =?utf-8?B?NC9KOTBGYkw2S3Z2alQ5TkE5R3NRMXFQOHhpeUROZkRaZFBlcGppT3liNlRl?=
 =?utf-8?Q?GFy4gf2fX6aI2iOJ7VAfhaCIV6ISqzhfN/N9xhW?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ff256b55-e6b6-4612-90b3-08d92f58d2e2
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jun 2021 17:21:19.2796
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2b/wpWrMw24/6rgmJmxQdNmbKRXOPQD/WYdp23dcKUnh1NFDbAOplDW4k/V+ralUJ50yI3NoI5IUAsbfpLAn6chVo/iglFWQr4z9ygyUM8E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB4120
X-OriginatorOrg: citrix.com

On 14/06/2021 17:13, Andrew Cooper wrote:
> +/*
> + * Probe for how RTM behaves, deliberately not inspecting CPUID.
> + * Distinguishes between "no support at all" (i.e. XBEGIN suffers #UD),
> + * working ok, and appearing to always abort.
> + */
> +static enum rtm_behaviour __attribute__((noclone)) probe_rtm_behaviour(void)

This doesn't compile, because Clang doesn't understand noclone.

With it dropped, https://cirrus-ci.com/build/6399801072812032 is the
FreeBSD build, confirming that sigill_handler() below is seemingly ok.

~Andrew

> +{
> +    for ( unsigned int i = 0; i < 1000; ++i )
> +    {
> +        /*
> +         * Opencoding the RTM infrastructure from immintrin.h, because we
> +         * still support older versions of GCC.  ALso so we can include #UD
> +         * detection logic.
> +         */
> +#define XBEGIN_STARTED -1
> +#define XBEGIN_UD      -2
> +        unsigned int status = XBEGIN_STARTED;
> +
> +        asm volatile ( ".Lxbegin: .byte 0xc7,0xf8,0,0,0,0" /* XBEGIN 1f; 1: */
> +                       : "+a" (status) :: "memory" );
> +        if ( status == XBEGIN_STARTED )
> +        {
> +            asm volatile ( ".byte 0x0f,0x01,0xd5" ::: "memory" ); /* XEND */
> +            return RTM_OK;
> +        }
> +        else if ( status == XBEGIN_UD )
> +            return RTM_UD;
> +    }
> +
> +    return RTM_ABORT;
> +}
> +
> +static struct sigaction old_sigill;
> +
> +static void sigill_handler(int signo, siginfo_t *info, void *extra)
> +{
> +    extern const char xbegin_label[] asm(".Lxbegin");
> +
> +    if ( info->si_addr == xbegin_label &&
> +         memcmp(info->si_addr, "\xc7\xf8\x00\x00\x00\x00", 6) == 0 )
> +    {
> +        ucontext_t *context = extra;
> +
> +        /*
> +         * Found the XBEGIN instruction.  Step over it, and update `status` to
> +         * signal #UD.
> +         */
> +#if defined(__linux__)
> +# ifdef __x86_64__
> +        context->uc_mcontext.gregs[REG_RIP] += 6;
> +        context->uc_mcontext.gregs[REG_RAX] = XBEGIN_UD;
> +# else
> +        context->uc_mcontext.gregs[REG_EIP] += 6;
> +        context->uc_mcontext.gregs[REG_EAX] = XBEGIN_UD;
> +# endif
> +
> +#elif defined(__FreeBSD__)
> +# ifdef __x86_64__
> +        context->uc_mcontext.mc_rip += 6;
> +        context->uc_mcontext.mc_rax = XBEGIN_UD;
> +# else
> +        context->uc_mcontext.mc_eip += 6;
> +        context->uc_mcontext.mc_eax = XBEGIN_UD;
> +# endif
> +
> +#elif defined(__NetBSD__)
> +# ifdef __x86_64__
> +        context->uc_mcontext.__gregs[_REG_RIP] += 6;
> +        context->uc_mcontext.__gregs[_REG_RAX] = XBEGIN_UD;
> +# else
> +        context->uc_mcontext.__gregs[_REG_EIP] += 6;
> +        context->uc_mcontext.__gregs[_REG_EAX] = XBEGIN_UD;
> +# endif
> +
> +#else
> +# error Unknown environment - please adjust
> +#endif
> +    }
> +    else
> +    {
> +        /*
> +         * Not the SIGILL we're looking for...  Restore the old handler and
> +         * try again.  Will likely coredump as a result.
> +         */
> +        sigaction(SIGILL, &old_sigill, NULL);
> +    }
> +}


