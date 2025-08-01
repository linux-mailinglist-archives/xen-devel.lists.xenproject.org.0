Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 895B8B17D9A
	for <lists+xen-devel@lfdr.de>; Fri,  1 Aug 2025 09:32:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1066922.1431948 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uhkFU-0000YY-LB; Fri, 01 Aug 2025 07:32:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1066922.1431948; Fri, 01 Aug 2025 07:32:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uhkFU-0000Vp-Ib; Fri, 01 Aug 2025 07:32:16 +0000
Received: by outflank-mailman (input) for mailman id 1066922;
 Fri, 01 Aug 2025 07:32:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=zIvO=2N=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uhkFT-0000Vh-2a
 for xen-devel@lists.xenproject.org; Fri, 01 Aug 2025 07:32:15 +0000
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [2a00:1450:4864:20::42f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a44b222f-6ea9-11f0-b895-0df219b8e170;
 Fri, 01 Aug 2025 09:32:13 +0200 (CEST)
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-3b78bca0890so1230142f8f.3
 for <xen-devel@lists.xenproject.org>; Fri, 01 Aug 2025 00:32:13 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-241e8aab53dsm35587165ad.170.2025.08.01.00.32.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 01 Aug 2025 00:32:11 -0700 (PDT)
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
X-Inumbo-ID: a44b222f-6ea9-11f0-b895-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1754033532; x=1754638332; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=2b67bWBoJF+scvThy2PBo/iMaedszGZcsn14iUlxQnc=;
        b=Pt60jXdMah4PRiLUxpCx4OjLVw1W08QvMT7lTEntdNUD6Bb3GqXtqNHrmoEAvnqQOt
         vhYeYb+caAy9e3kC0f+Ze4RIDVe0Mdo4kMNXDeImA9UxU3FJ83XebRmWrH/RJjI8c3CF
         yFal/PD5UAyMG0pXx1tYHDa2SdDAlhPG9G/uSWoWAW+6XSzeHuwinFUSvCZTqbcClufT
         DG8f6X18d6QW9ahgvcn7wcaLgiue+SUz0ZmEzWKFHtVDLGz6Tp6kbxtWvcuV/1aF8fai
         TrOnTDOO0MZfD6/jWphaKRGauKlEWhYMw8WdWzOSvVK/jTqz+S+vvgxlBczA6+uwDGW0
         TACw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754033532; x=1754638332;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2b67bWBoJF+scvThy2PBo/iMaedszGZcsn14iUlxQnc=;
        b=mbR0MCkdtklMukAMbVCXybJEvzSvic7B3B8ndXHy1Ijccz4Ndt9mB0lOkkynoDPazu
         j39AGliu1NUf03HMEPAW/fHFgRxA7EmKEjDgnhfaO2++MpdVrDiIUhsPXIrEwHnW1gsx
         0NSDgCb4SIxxo0YrNNFp0vZSfK87th8ZEbE92lWvLLjoXVQC+CaUcsFTe6MiA0OP3Uy3
         fKIaZ8bDLedwULGLPvrgXLb+99PgdZ92J20R8YKBVDPHEmlMkWS/PSyb08tq5r2iQjqp
         xV1kw6DcWGDT/qICvHf0lSZFJquJjGUA0Jhgx1f7dJk2BN4/ADgftY8h5CbD+u3Zgugs
         CRVA==
X-Forwarded-Encrypted: i=1; AJvYcCWFVREGWTBfNbPoVcXkV6Q0PjczHbz4p9PuM/Bobm0X/UwOeNcpgSiiqZOFo1A8UBZ8ZxSA/5hvwiU=@lists.xenproject.org
X-Gm-Message-State: AOJu0YznDbBBJWn/e6g+LCO4l6So7EsGVcsElxRSROa0Xaa7vOI0hMzx
	jYunVy/FpHxRAmGAoSNVkinY1QMHyt/wSgruBWCArLpPTxJ9g6sYC60BesLjjSSDqg0r2r8bvqn
	Jr3w=
X-Gm-Gg: ASbGncsqemNH3ZMv9wUPSk5zCfQ6iljUqjXRhfoMV6YTYWLJBSZAZ8NrX1ifa+3rfn3
	trDDwFiyKFlx/N8GeH62zdefWV7zoktnp4Z/KI2pTMzIwo2vta9RyffuCmmUJva2VlE97u/izdl
	pYdEf6+rlb+VqZGlofeI6+uvlJoQoXmSZj1ztX99GV7Doas6pMv1FK91d3a5RosCID3z65KbcPY
	qtshibs2vsfJ8hRkFOLGt7S7TYp+t6QLhzT/yeeUqH436So6th3ijUfGdCaPM+sdZdnabJy/HIR
	OxtKDLo9XjLV3a9Q0DmDHuYZtEG3YVnbPCIFnNp0kjsEoS93jsdWHhdwgTRnXbKjr1PWZGxG7S+
	h+r4d270NGCTSJoKb2gBz28DLZb7T722s8GKl4M9iCGhVQpyGQv6bXPGtBOjawAn54ipsOyeM1Z
	+C1SbJggCD1tZ0NQXJ/Q==
X-Google-Smtp-Source: AGHT+IEkXkMy42GWKskwXMrnY5nHLiWnBU3+JA8de7e3rvTZl/vL1puVkOR78ak55mJ9aIarn1w8wA==
X-Received: by 2002:a05:6000:4212:b0:3a3:63d3:369a with SMTP id ffacd0b85a97d-3b794fc182dmr8985694f8f.25.1754033532510;
        Fri, 01 Aug 2025 00:32:12 -0700 (PDT)
Message-ID: <d325eb5c-dba1-4063-a311-aefc3f84b620@suse.com>
Date: Fri, 1 Aug 2025 09:32:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] xen/console: remove __printk_ratelimit()
To: dmkhn@proton.me
Cc: Julien Grall <julien@xen.org>, andrew.cooper3@citrix.com,
 anthony.perard@vates.tech, michal.orzel@amd.com, roger.pau@citrix.com,
 sstabellini@kernel.org, dmukhin@ford.com, xen-devel@lists.xenproject.org
References: <20250725212235.753363-1-dmukhin@ford.com>
 <290ae958-4fba-42d8-a64b-d44845b85491@xen.org>
 <aade04e0-737f-481c-9ed1-1275969c2ef7@suse.com> <aIlIm7F5L3WQLoWd@kraken>
 <4292abbe-28b1-4545-87af-b37dd4ace53e@suse.com> <aIpfH5Cy10o8VMCu@kraken>
 <528f4bd1-4a2f-4fa1-94cc-363a5f5fdbea@suse.com> <aIvf+FHRFgqZmQgA@kraken>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
Autocrypt: addr=jbeulich@suse.com; keydata=
 xsDiBFk3nEQRBADAEaSw6zC/EJkiwGPXbWtPxl2xCdSoeepS07jW8UgcHNurfHvUzogEq5xk
 hu507c3BarVjyWCJOylMNR98Yd8VqD9UfmX0Hb8/BrA+Hl6/DB/eqGptrf4BSRwcZQM32aZK
 7Pj2XbGWIUrZrd70x1eAP9QE3P79Y2oLrsCgbZJfEwCgvz9JjGmQqQkRiTVzlZVCJYcyGGsD
 /0tbFCzD2h20ahe8rC1gbb3K3qk+LpBtvjBu1RY9drYk0NymiGbJWZgab6t1jM7sk2vuf0Py
 O9Hf9XBmK0uE9IgMaiCpc32XV9oASz6UJebwkX+zF2jG5I1BfnO9g7KlotcA/v5ClMjgo6Gl
 MDY4HxoSRu3i1cqqSDtVlt+AOVBJBACrZcnHAUSuCXBPy0jOlBhxPqRWv6ND4c9PH1xjQ3NP
 nxJuMBS8rnNg22uyfAgmBKNLpLgAGVRMZGaGoJObGf72s6TeIqKJo/LtggAS9qAUiuKVnygo
 3wjfkS9A3DRO+SpU7JqWdsveeIQyeyEJ/8PTowmSQLakF+3fote9ybzd880fSmFuIEJldWxp
 Y2ggPGpiZXVsaWNoQHN1c2UuY29tPsJgBBMRAgAgBQJZN5xEAhsDBgsJCAcDAgQVAggDBBYC
 AwECHgECF4AACgkQoDSui/t3IH4J+wCfQ5jHdEjCRHj23O/5ttg9r9OIruwAn3103WUITZee
 e7Sbg12UgcQ5lv7SzsFNBFk3nEQQCACCuTjCjFOUdi5Nm244F+78kLghRcin/awv+IrTcIWF
 hUpSs1Y91iQQ7KItirz5uwCPlwejSJDQJLIS+QtJHaXDXeV6NI0Uef1hP20+y8qydDiVkv6l
 IreXjTb7DvksRgJNvCkWtYnlS3mYvQ9NzS9PhyALWbXnH6sIJd2O9lKS1Mrfq+y0IXCP10eS
 FFGg+Av3IQeFatkJAyju0PPthyTqxSI4lZYuJVPknzgaeuJv/2NccrPvmeDg6Coe7ZIeQ8Yj
 t0ARxu2xytAkkLCel1Lz1WLmwLstV30g80nkgZf/wr+/BXJW/oIvRlonUkxv+IbBM3dX2OV8
 AmRv1ySWPTP7AAMFB/9PQK/VtlNUJvg8GXj9ootzrteGfVZVVT4XBJkfwBcpC/XcPzldjv+3
 HYudvpdNK3lLujXeA5fLOH+Z/G9WBc5pFVSMocI71I8bT8lIAzreg0WvkWg5V2WZsUMlnDL9
 mpwIGFhlbM3gfDMs7MPMu8YQRFVdUvtSpaAs8OFfGQ0ia3LGZcjA6Ik2+xcqscEJzNH+qh8V
 m5jjp28yZgaqTaRbg3M/+MTbMpicpZuqF4rnB0AQD12/3BNWDR6bmh+EkYSMcEIpQmBM51qM
 EKYTQGybRCjpnKHGOxG0rfFY1085mBDZCH5Kx0cl0HVJuQKC+dV2ZY5AqjcKwAxpE75MLFkr
 wkkEGBECAAkFAlk3nEQCGwwACgkQoDSui/t3IH7nnwCfcJWUDUFKdCsBH/E5d+0ZnMQi+G0A
 nAuWpQkjM1ASeQwSHEeAWPgskBQL
In-Reply-To: <aIvf+FHRFgqZmQgA@kraken>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 31.07.2025 23:28, dmkhn@proton.me wrote:
> On Thu, Jul 31, 2025 at 08:23:16AM +0200, Jan Beulich wrote:
>> On 30.07.2025 20:06, dmkhn@proton.me wrote:
>>> On Wed, Jul 30, 2025 at 07:35:04AM +0200, Jan Beulich wrote:
>>>> On 30.07.2025 00:18, dmkhn@proton.me wrote:
>>>>> On Mon, Jul 28, 2025 at 11:32:43AM +0200, Jan Beulich wrote:
>>>>>> On 26.07.2025 11:20, Julien Grall wrote:
>>>>>>> On 25/07/2025 22:24, dmkhn@proton.me wrote:
>>>>>>>> From: Denis Mukhin <dmukhin@ford.com>
>>>>>>>>
>>>>>>>> __printk_ratelimit() is never used outside of the console driver.
>>>>>>>> Remove it from the lib.h and merge with the public printk_ratelimit().
>>>>>>>
>>>>>>> Is this solving any sort of violation? Asking because even if the
>>>>>>> function is only used by one caller, I could see a benefit to be able to
>>>>>>> use different value for the ratelimit. So I leaning towards keep the
>>>>>>> code as-is.
>>>>>>
>>>>>> +1
>>>>>>
>>>>>> In fact I'm surprised (or maybe not) that we still don't make better use
>>>>>> the rate limiting functionality.
>>>>>
>>>>> Out of curiosity, do you have any ideas re: make better use of the rate
>>>>> limiting functionality?
>>>>
>>>> No concrete ones; thinking about this has been way too long ago.
>>>>
>>>>> Build-time parameterization?
>>>>
>>>> That and/or command line controls.
>>>
>>> Got it.
>>>
>>> Can you please explain why exporting __printk_ratelimit() is still required
>>> for implementation of build/command line settings in console.c?
>>
>> I didn't say console.c, did I? Whatever subsystem wanted to do proper rate
> 
> But you also did not say anything about idea of having per-subsystem rate
> limiting.
> 
>> limiting would need to gain some way of controlling this (as said, build
>> time or cmdline driven), and it'll then need that function: How would it
>> effect the behavior with custom ms and/or burst values, without having
>> that function to call? (It is another thing that the function, using static
>> variables rather than per-caller state, may not be quite ready for that
>> kind of use. Also the arbitrary and hard-coded 10 * 5 * 1000 there would
>> probably also want to be customizable.)
>>
>> What you may want to do for Misra's sake is make the function static for
>> the time being. The compiler will then fold it into its sole caller,
>> until some new user appears. (At that occasion dropping one of the
>> underscores may also be reasonable.)
> 
> Do I understand it correctly that you will accept the following submission:
>  1) make __printk_ratelimit() static
>  2) drop one underscore from the name

Yes, if you really think that's worth it.

Jan

>  3) keep the only call __printk_ratelimit() in a hope of there will be
>     per-subsystem rate limiting in the future?
> 
> --
> Denis
> 
>>
>> Jan
>>
> 


