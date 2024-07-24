Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EB60F93ACBC
	for <lists+xen-devel@lfdr.de>; Wed, 24 Jul 2024 08:40:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.763763.1174071 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sWVeY-0003oU-Ou; Wed, 24 Jul 2024 06:39:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 763763.1174071; Wed, 24 Jul 2024 06:39:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sWVeY-0003mR-LZ; Wed, 24 Jul 2024 06:39:10 +0000
Received: by outflank-mailman (input) for mailman id 763763;
 Wed, 24 Jul 2024 06:39:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=D33k=OY=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sWVeX-0003mL-UY
 for xen-devel@lists.xenproject.org; Wed, 24 Jul 2024 06:39:09 +0000
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [2a00:1450:4864:20::535])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6d98bdcb-4987-11ef-bbfe-fd08da9f4363;
 Wed, 24 Jul 2024 08:39:08 +0200 (CEST)
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-58f9874aeb4so5277118a12.0
 for <xen-devel@lists.xenproject.org>; Tue, 23 Jul 2024 23:39:08 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a7ab4a01faasm22641966b.74.2024.07.23.23.39.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 Jul 2024 23:39:07 -0700 (PDT)
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
X-Inumbo-ID: 6d98bdcb-4987-11ef-bbfe-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1721803147; x=1722407947; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=d/E1S6GlUp17I98dUZl8TyeqNdEAW/iSk+tuZZUHyJY=;
        b=c/acMaWC/+/kNEZOJdHQmZkKSV+y6BBG5cW/N2yAd3RY8aQb600LNcDEFvpNw69T22
         q/6vTEvkNr5aG9jc1hxL9i9YinUayc334tgy5GtLfBDLZa43pQWZEz8hPJWsRBQYTGFH
         C91iPMFu/NNfa7GuMTTxit6lUhjr/ZcL3vTkG8ReYpk20uT3VGQGp3Pvc19QsJiePbT7
         cbagyDgAj0TwdN/IoL0cmjxQ83ZXI4dqY4F3ZAIl0R+LA+7RQ9vuXqqnpR+zMKnCIib7
         5/lWTMS7l2NDU7c4TlJ+IcNYIwC+4Z+l7iYsQ0WqOB22QAJItnaf+RpcAn5FbHSBo3OO
         9K2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721803147; x=1722407947;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d/E1S6GlUp17I98dUZl8TyeqNdEAW/iSk+tuZZUHyJY=;
        b=KCtAqAEE9keqIThQnVIWAV03dqWYaaJ7Sys5jCfGCh0nCIbm0be0vj4J1dSCQ1bwBA
         fffIdd4hThbuOqso1Z1rC4oc2ydEtJE0cyA2sX2CCWXXdfYXFm/jKeCribgHBMAwUZX2
         rfpHB1Fa7ZUnsl2ZO6KfFMYQkLnlayIFmj+XVIyL8x9Q7dZm9dzY3/9j373/xZt4FjbI
         xONJOtoF1A9qtwkfu6ZX7x+TUwS19BS9Jq5u/yEZksZWHi5PSKbr6iNNYC5E6RBhgiTX
         oOc4zbOQHzJagF5QiXxasLWE3U1Bu3YUT7EYMm9oPmvrc9T9IYsMR+Fcthl2Zrfz+fOa
         rwRw==
X-Gm-Message-State: AOJu0Yw98SBYyAXdKab6JZ6uBN61VUFRcqx9uJiXA2ADLFB0h5U4wNqh
	wPHD6OgUEK5dC/LA4LdCd0BiI+wzbYKi0MXgTq31NRxmDni6H1K4ipI/1pvnxA==
X-Google-Smtp-Source: AGHT+IEHiKbwot4egEUzuME8h+bxHi8/7faOGLOOO+pghM+2qtZwhyd/VwiVlmJx041jMfREOHOwTg==
X-Received: by 2002:a17:906:794b:b0:a7a:b385:37cd with SMTP id a640c23a62f3a-a7ab3853bb3mr54489466b.30.1721803147543;
        Tue, 23 Jul 2024 23:39:07 -0700 (PDT)
Message-ID: <7a5da6ce-0ef0-4666-a5c4-44383469f67e@suse.com>
Date: Wed, 24 Jul 2024 08:39:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.19] x86/altcall: fix clang code-gen when using
 altcall in loop constructs
To: Alejandro Vallejo <alejandro.vallejo@cloud.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org, Andrew Cooper
 <andrew.cooper3@citrix.com>, Oleksii Kurochko <oleksii.kurochko@gmail.com>
References: <20240723093117.99487-1-roger.pau@citrix.com>
 <D2X13ED477J8.25JRFH9VEW33O@cloud.com> <Zp_VuwxqH3Mii8_W@macbook>
 <D2X237Y7T92R.1VVSBS9MCJOFW@cloud.com>
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
In-Reply-To: <D2X237Y7T92R.1VVSBS9MCJOFW@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 23.07.2024 18:24, Alejandro Vallejo wrote:
> On Tue Jul 23, 2024 at 5:09 PM BST, Roger Pau Monné wrote:
>> On Tue, Jul 23, 2024 at 04:37:12PM +0100, Alejandro Vallejo wrote:
>>> On Tue Jul 23, 2024 at 10:31 AM BST, Roger Pau Monne wrote:
>>>> --- a/xen/arch/x86/include/asm/alternative.h
>>>> +++ b/xen/arch/x86/include/asm/alternative.h
>>>> @@ -185,10 +185,10 @@ extern void alternative_branches(void);
>>>>   */
>>>>  #define ALT_CALL_ARG(arg, n)                                            \
>>>>      register union {                                                    \
>>>> -        typeof(arg) e;                                                  \
>>>> +        typeof(arg) e[sizeof(long) / sizeof(arg)];                      \
>>>>          unsigned long r;                                                \
>>>>      } a ## n ## _ asm ( ALT_CALL_arg ## n ) = {                         \
>>>> -        .e = ({ BUILD_BUG_ON(sizeof(arg) > sizeof(void *)); (arg); })   \
>>>> +        .e[0] = ({ BUILD_BUG_ON(sizeof(arg) > sizeof(void *)); (arg); })\
>>>>      }
>>>>  #else
>>>>  #define ALT_CALL_ARG(arg, n) \
>>>
>>> Don't we want BUILD_BUG_ON(sizeof(long) % sizeof(arg) == 0) instead?
>>
>> I think you meant BUILD_BUG_ON(sizeof(long) % sizeof(arg) != 0)?
> 
> Bah, yes. I wrote it as a COMPILE_ASSERT().
> 
>>
>>> Otherwise
>>> odd sizes will cause the wrong union size to prevail, and while I can't see
>>> today how those might come to happen there's Murphy's law.
>>
>> The overall union size would still be fine, because it has the
>> unsigned long element, it's just that the array won't cover all the
>> space assigned to the long member?
> 
> I explained myself poorly. If the current BUILD_BUG_ON() stays as-is that's
> right, but...
> 
>>
>> IOW if sizeof(arg) == 7, then we would define an array with only 1
>> element, which won't make the size of the union change, but won't
>> cover the same space that's used by the long member.
> 
> ... I thought the point of the patch was to cover the full union with the
> array, and not just a subset. My proposed alternative merely tries to ensure
> the argument is always a submultiple in size of a long so the array is always a
> perfect match.

Question is whether there's an issue with odd sized values in Clang. I
wouldn't want to exclude such (admittedly somewhat exotic) uses "just
in case". My understanding here is that the issue the patch addresses
is not merely the treatment of the union by Clang, but the combination
thereof with it violating the psABI when it comes to passing bool
around.

Jan

