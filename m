Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E4D76653DC5
	for <lists+xen-devel@lfdr.de>; Thu, 22 Dec 2022 10:55:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.468378.727464 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p8IHt-0004YY-Ju; Thu, 22 Dec 2022 09:54:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 468378.727464; Thu, 22 Dec 2022 09:54:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p8IHt-0004WR-HK; Thu, 22 Dec 2022 09:54:53 +0000
Received: by outflank-mailman (input) for mailman id 468378;
 Thu, 22 Dec 2022 09:54:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=TLdZ=4U=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1p8IHs-0004WL-6h
 for xen-devel@lists.xenproject.org; Thu, 22 Dec 2022 09:54:52 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01on2082.outbound.protection.outlook.com [40.107.13.82])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ace8bf3d-81de-11ed-8fd4-01056ac49cbb;
 Thu, 22 Dec 2022 10:54:50 +0100 (CET)
Received: from AM6PR04MB6551.eurprd04.prod.outlook.com (2603:10a6:20b:fa::20)
 by AS1PR04MB9454.eurprd04.prod.outlook.com (2603:10a6:20b:4d9::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5924.16; Thu, 22 Dec
 2022 09:54:50 +0000
Received: from AM6PR04MB6551.eurprd04.prod.outlook.com
 ([fe80::8084:fa5b:fe3a:fa24]) by AM6PR04MB6551.eurprd04.prod.outlook.com
 ([fe80::8084:fa5b:fe3a:fa24%4]) with mapi id 15.20.5924.016; Thu, 22 Dec 2022
 09:54:50 +0000
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
X-Inumbo-ID: ace8bf3d-81de-11ed-8fd4-01056ac49cbb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ezJm5EiburevLXVlVL38mDUJlu/U/XHDQ4lk7TV2+mGpHjqlmYv7Axu/tgZhNaCM8WYzqF4X5x60lG9lrtq+s+BWmetU5E7yKxOscOV+9kPYervIOEvznTZXR9st4TRFUdeX63whcSbPep/xYn+O4O3H0iNsq/78We+IxQByCDMDj43/aBlH0TX9CeMYKQzDhhKCoEa0IDCprIMDugz8t+FN2hwT6viCtz3yVTOwYUxhdJzy5r9EaD8VROX/XCi35+db1YKB0gctAVG+o24Jp0O5OSE+qtZeggNElu5cDdyWzvdNupmwAyMg9Bn5JQirklQ18C8v6ZPNzXw9VxudxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3kCIRZyz+4akDPdFSli8KPUeWsLxiwk/RnxHMhE8Ztc=;
 b=mAIUq8RnVHFvQ/+OkMJ9upOld5EiYy+IgxXayzGXmUS4Hjm1W5pWH+larCzxLnks0UGpGMelJX6LG9ntBtf8lF2NMD1F3jR1HfDQuZImwindGonQaRKs0g4qaLMp4R19n9XFKJbvoPobtQ4jDSfyGGHEccomuujW7qXwWYMVtSzeFCz9XrdbUAN3UP1KKcYqMf0maxzMoDOkHb4QUsBgJHzCrv8FuEq/ePDp4YbemaSePAzhn3UhaOqdGCdf00T33SurhEsRbF86VNu+hKBmEOKNiQcAOelheuu158pUCSskv/HvmMnXpyoZD6rb1NS083cUk2Iy+nzxqttEigKIBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3kCIRZyz+4akDPdFSli8KPUeWsLxiwk/RnxHMhE8Ztc=;
 b=LGRI/xWzU5tnfoCleVKrFV2N2hna+30eEjvZqeeTx14GL1q64UXNDJA07ylky3z76lHR0+iuQx/49nCeCJLA/7FtIxE9OKjPv7g3Ndo9Lq0JsAUfx27OkNMkFZ29cpeqAZLqsmS5NumLBszHxMtYwIK/6khR/CrVzfaUZe8mDVJg6CeizVueiKU0k2yZ7axRrjx1kShFaCYapeE18LKWsRMc8V5OSBvZ9DuLLUnF6swVLYKtMQD5Iza8N9p5SoEg1AqhrmR2AksYjWV3PjtOgCyoDVvibErDMDTwhJd10QzRgHD0NqoJWjAf7s1lc8XVri6cJsKjICgQDOU2Z19k6w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <700e86ac-7efc-9d6d-43dd-a06bb541a1fb@suse.com>
Date: Thu, 22 Dec 2022 10:54:48 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v5 08/10] x86/mm: make code robust to future PAT changes
Content-Language: en-US
To: Demi Marie Obenour <demi@invisiblethingslab.com>
Cc: =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
 Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>,
 George Dunlap <george.dunlap@citrix.com>, Tim Deegan <tim@xen.org>,
 xen-devel@lists.xenproject.org
References: <cover.1671497984.git.demi@invisiblethingslab.com>
 <a8920eef3254cbf470a0d35a887dbaf0e4907a6d.1671497984.git.demi@invisiblethingslab.com>
 <06dff83a-b120-a2b4-c61f-7864935d4c3e@suse.com> <Y6QodBfEc828o988@itl-email>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <Y6QodBfEc828o988@itl-email>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0159.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:99::8) To AM6PR04MB6551.eurprd04.prod.outlook.com
 (2603:10a6:20b:fa::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6PR04MB6551:EE_|AS1PR04MB9454:EE_
X-MS-Office365-Filtering-Correlation-Id: aa14ded1-0cd8-4f1d-4a3e-08dae40290fc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	spbc7eUwyfmw+medGcicaTTWgXEstWPb1ENcMaxUWaeuk/XmIeQzyKXB4+hAmNNYQmvzelxd2CbvbhPDr7kdexJEPPbkdgilyZEaCdxlEPWGjs74/B3f3459fSKS17tcR//rawQs92AEPw5dEviGgJXha0/d7/rotvMprlnst6S7KRCSG+s8gzekLQIlZODFwd+TSxbIE3URFv+3GzgmudXbJmB9XsAqtB+aEGLPMganZ36FF7MS0Eikd20wBSVWoxcmGiT8zvTjGyrwQXnQ3JE9JOo1rWUDEVD4Bs/rLKu0XjVoYCeanuyCH4X+Q5rh+kysD1eYoxpC5JH5uOqka+a5m5LNK82cbF0U46TbggnPQoiWnUw3lkLYSGC6Mx57M3nFnU4Whqju4rEvy+PLBG2+3Vz2odi99vWo1sZnYf1fcHtfWuXQPWLAPsTjp44OwipNm4nUF/egR3PmYF720Uh7ZQuw/iRkpbkqjTsK16c++gTys7RIbjaIFhQMhuybmN7tgaJsYHcyidv3YmOMeLaHuVw3BV/2x6daMzWfFVDegBWfnpQxXVybwaRKZnE/SFked/WJnJf+QYr5/dGxVJjQvUtQnEN/zLxfqtVPPRMesNxZPKNX/8ZZjvT8vvaq4Na0/RP2WLINngcPfSIPn4ApkY0fENeVlQSe9apip+ZW4yhhF6BcxcMUIyP/Y8QPVGmEZCh0Q4NrYIS6YbAK3DYg2DhEWaGT9uZTCwrCi9U=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB6551.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(366004)(396003)(346002)(136003)(39860400002)(376002)(451199015)(31686004)(2906002)(5660300002)(38100700002)(41300700001)(7416002)(66556008)(8676002)(36756003)(4326008)(66946007)(66476007)(316002)(8936002)(53546011)(6512007)(31696002)(6916009)(26005)(86362001)(186003)(54906003)(83380400001)(2616005)(478600001)(6506007)(6486002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MVcyYVFLNFFVRlNKSDFzREJwSmQ5U2gyaE1PMHFkVDZoYnVoK2dKS2J4YW9P?=
 =?utf-8?B?MElFS3lOZndCK0JQeVpoVjN0TjhId08ySCtLa2NYMHFVMHdHa2J6ODFTWXlC?=
 =?utf-8?B?ZThHQmtjMVY3YnZOaVVrZFhWdTg4U2R0R0tMYndubnd6eG5OL0czYjdnY0xF?=
 =?utf-8?B?alZOYjVBd3pKcENzQXpKQ3JXelR2U1A2bEV1UWVuVmhpQUhIRlIzVVg3QXUy?=
 =?utf-8?B?dS9kTVFMVUZzeUJWcXArTStVN2JNMVRvbjlDZWdKMEZ3ZVN3cE9WR3lYSitV?=
 =?utf-8?B?RXNNajRxOXo4UStwVW42L3psa2crdUZEeXBZSlloNC93L0VSNm81UFdYWWdX?=
 =?utf-8?B?SFhJOWZuTkNVRXBocFlXc25LWmpLditPUlBuWlVxcGgvbVpwVWtoMXVNaEpP?=
 =?utf-8?B?QjB1ai9EMFZ2RElZSnVOMndWMHg0UFNVeTR5bmk1VG1wTkJuQnQzbUR4c0Rh?=
 =?utf-8?B?dWV3SDFpRk9vam13bWFzVG1zdHNncjE5WlhObVlGVDVIbGNKZXJDS1BHNGlD?=
 =?utf-8?B?dkRmL3k2c24yOFVZeDFRY3E1aHJZcVl0eDcrYWovWkNPQU5wMDZwdUNVRW5W?=
 =?utf-8?B?UnprUnc3TGM3clJNMzR2VjZaOVh0TkxVYVVJbUx6amFPdHN5Y3g3djd1VGJW?=
 =?utf-8?B?OWJZWG5YZjVPeWpQM005TlNSbU1haXFlUHVmaG5wYUdBMklsb2NVREFobXVu?=
 =?utf-8?B?d1ZBQ3JJYnRwd2ZFNjZSdDZ3cEJpZTRtdndGTkFlU1VwWEJBMjJMdEMxb3hw?=
 =?utf-8?B?byt5VVBxRkJwSnUrc2ZzOGkwTk5LemZQT0ZsTWtaa2dVV3YvWWhqbWR6SXdF?=
 =?utf-8?B?MmZ6Y1BRMmJDT21ldXovZk5VV0hPa0lXUytUSHVtTUpyeXJibE05ZnY5eHpw?=
 =?utf-8?B?ajBJeERWb0psNHJxVHBEbkZWeDBrWUV2Y0F5R1NpVzAxR3ZyaVhzeHVqR1RZ?=
 =?utf-8?B?Yk91Z25aV0lPc0VXdDBkODJuRXdIYWdMZ25GOFBOS3ZqWWdIdWV0Q05nOU16?=
 =?utf-8?B?NlZ2bWJuMDU3cGlJWUUwOFVlQkl5bHl2YWM5aDRacStvS2RjQkl2ZXIvZlVX?=
 =?utf-8?B?RkNWSE9XczhmK1hBWEhuR25IbmZIUEpocWZ4cVpnUjhPOVdFcDdXSllUQmNV?=
 =?utf-8?B?cGl0SFY2Wm5mRFhTTWphUGN2bExicGdkM3k0L3lJbEYzazlzLzVVQmNQanBH?=
 =?utf-8?B?b1dhUkkvM2Y5VnR0TGxrbHpSaEdNdjl6RzRrU2hyaDg3TmQxMFV1Mk5MTWtW?=
 =?utf-8?B?MVZCRkhVM0F3Y0NGbmthT2hzbG1qSjZQZ2IrbzUrSDlSZTllTld2dlNjQVVp?=
 =?utf-8?B?WXlaOU8rVkdkbWJRRWtFQkhFWVBWOVpyQzFidmQvOEF1VHlVZGhDQU0vNkdI?=
 =?utf-8?B?N05NSEhCSDEyYzdzRmgrMkc5dXhHUFhBSEo5WHRlL2E0S0ZIUmZJS0grWVJy?=
 =?utf-8?B?WWN6dVNNYWk4eU1TVDZOQzhWRXE1N1ZLL1lSYnlKTk5DU1BvR2FwNVpNQWpr?=
 =?utf-8?B?aDREdG50cHo2NkRHOVBOUG90LzJ2N1k0YUxJWXhSVjgyODNOWVU5bXRHdzJE?=
 =?utf-8?B?TnAwZzRheTRyLzJzYTNBN090aHdZN25oWnZYR2JNYWsyNEdtYXI5SUs4a2tX?=
 =?utf-8?B?cGRjNU9YZjByaENxUlNKZTJUU1JZcTRTRFNFNWNiUFhidnVIQVlKSVhRZkJF?=
 =?utf-8?B?TmV6MDdFT2dxTlJZeWU2LzlBRGxPVFFvSWJteTI0UHRUSGcyNE14RFlDem1O?=
 =?utf-8?B?cVJHcjIva2hMTm1WdXRnM1NSa0hJakF5cTVjcTNrL0V0dVpSZER2cmhHTEhS?=
 =?utf-8?B?TkVnN3p0UE1PenFrVFZYNUo4QUZJcjMzNnRSTXQ4K1RHV0hlbXhWbmRUS0p2?=
 =?utf-8?B?ZVFlMXNyWktESkh0UjdDUUprTDYybUhYc1BGZ2NCcWY2dUNncjZBVWJXa0ZM?=
 =?utf-8?B?MW9HWWJTVjRaMldRTU1VZUlDUXlJS0NlVDhNYWJOTGVQZllXU2plT2RjOVBG?=
 =?utf-8?B?em1DWGlrME1RcHlvNERyaE1CSEorazh4SG9kRnpzRmszSittNnBtbmRSZjhB?=
 =?utf-8?B?N3NXblZpS2E2TU5NbnpCeE9zSUxTeU50Q2FDN0tuZUZUSUdvUkp5SHpvVnMw?=
 =?utf-8?Q?NdXIKXsaSGLVoZgclbhzzMEap?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aa14ded1-0cd8-4f1d-4a3e-08dae40290fc
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB6551.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Dec 2022 09:54:50.0960
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: a9EWsPyCUBRme/Qd5Cf0XgzvtI80+bWIew+/siz5wKJLSSSmmM14zBDmLffvcMqQII5XOaF+fEOEfC2+8ZEfBA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR04MB9454

On 22.12.2022 10:50, Demi Marie Obenour wrote:
> On Thu, Dec 22, 2022 at 10:35:08AM +0100, Jan Beulich wrote:
>> On 20.12.2022 02:07, Demi Marie Obenour wrote:
>>> --- a/xen/arch/x86/mm.c
>>> +++ b/xen/arch/x86/mm.c
>>> @@ -6352,6 +6352,11 @@ unsigned long get_upper_mfn_bound(void)
>>>      return min(max_mfn, 1UL << (paddr_bits - PAGE_SHIFT)) - 1;
>>>  }
>>>  
>>> +
>>> +/*
>>> + * A bunch of static assertions to check that the XEN_MSR_PAT is valid
>>> + * and consistent with the _PAGE_* macros, and that _PAGE_WB is zero.
>>> + */
>>>  static void __init __maybe_unused build_assertions(void)
>>>  {
>>>      /*
>>> @@ -6361,6 +6366,72 @@ static void __init __maybe_unused build_assertions(void)
>>>       * using different PATs will not work.
>>>       */
>>>      BUILD_BUG_ON(XEN_MSR_PAT != 0x050100070406ULL);
>>> +
>>> +    /*
>>> +     * _PAGE_WB must be zero for several reasons, not least because Linux
>>> +     * assumes it.
>>> +     */
>>> +    BUILD_BUG_ON(_PAGE_WB);
>>
>> Strictly speaking this is a requirement only for PV guests. We may not
>> want to go as far as putting "#ifdef CONFIG_PV" around it, but at least
>> the code comment (and then also the part of the description referring
>> to this) will imo want to say so.
> 
> Does Xen itself depend on this?

With the wording in the description I was going from the assumption that
you have audited code and found that we properly use _PAGE_* constants
everywhere.

>>> +} while (0)
>>> +
>>> +    /*
>>> +     * If one of these trips, the corresponding _PAGE_* macro is inconsistent
>>> +     * with XEN_MSR_PAT.  This would cause Xen to use incorrect cacheability
>>> +     * flags, with results that are undefined and probably harmful.
>>
>> Why "undefined"? They may be wrong / broken, but the result is still well-
>> defined afaict.
> 
> “undefined” is meant as “one has violated a core assumption that
> higher-level stuff depends on, so things can go arbitrarily wrong,
> including e.g. corrupting memory or data”.  Is this accurate?  Should I
> drop the dependent clause, or do you have a suggestion for something
> better?

s/undefined/unknown/ ?

Jan

