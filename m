Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 72AFC853493
	for <lists+xen-devel@lfdr.de>; Tue, 13 Feb 2024 16:27:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.680020.1057833 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rZugh-0001zI-Jf; Tue, 13 Feb 2024 15:27:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 680020.1057833; Tue, 13 Feb 2024 15:27:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rZugh-0001xc-G4; Tue, 13 Feb 2024 15:27:11 +0000
Received: by outflank-mailman (input) for mailman id 680020;
 Tue, 13 Feb 2024 15:27:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=W/Jz=JW=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rZugf-0001xS-Ml
 for xen-devel@lists.xenproject.org; Tue, 13 Feb 2024 15:27:09 +0000
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [2a00:1450:4864:20::331])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5928f5e7-ca84-11ee-98f5-efadbce2ee36;
 Tue, 13 Feb 2024 16:27:07 +0100 (CET)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-411c779ab2dso4488425e9.0
 for <xen-devel@lists.xenproject.org>; Tue, 13 Feb 2024 07:27:07 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 bq10-20020a5d5a0a000000b0033b6e26f0f9sm2002007wrb.42.2024.02.13.07.27.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 Feb 2024 07:27:07 -0800 (PST)
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
X-Inumbo-ID: 5928f5e7-ca84-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1707838027; x=1708442827; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xWw3RjzWL7BVtLSN+eAGRRnnzqGow5bxLyMvvHGmVZk=;
        b=HwO/8psb605sr1w9ksIlyKaG9mZxJIJxU3XZ37R42CfAVFYHgXfd6zXGz4KUQm98dd
         8Sfp9dWTbykjLJGJ8vdcuo7CieQ1KKab5VCviVAWfMbsYAIaL8BWQMETjpAtNKmdc30l
         RoKsw/0mQ0jh6LU5qYLUhz9u6QNKxl6roYuRVyOlYrdq3SyQMg/6DyvzVuhIAzGdhmv0
         mV5dyOpmCOpuibcOCKsVBdgjejOSTmTFbJHwh/oTSpC98o1yydJUC0h4bVTVK4z+u3B/
         f8Qo31e65G4aI7Onb303kkeDo0U1qnPLCf0FVCdTbCJfgKGSYGQUeYbRj07sGCE+f9gc
         C6/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707838027; x=1708442827;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xWw3RjzWL7BVtLSN+eAGRRnnzqGow5bxLyMvvHGmVZk=;
        b=Dk3KBMH712L6JBehRXXzhONxtJ3m5fjFzi18pTZBI2cVSR8ysuNz1AIBtmLmJybelJ
         stXY2MKUsdOcGZ4/+9i3Eqv8eHS2VCCLGtHtnf+/nk/mcEqHAOpG4+PyltOxf0CQn2Y7
         wsED86T2KCvYzv9SIT67fpYtvC7U6sm3BfIklG+KQ1pOo6yzuJoexwFLxKxyILDrp2gV
         bg7YS8Ju2JVpcGxhCoFVR1a81j1A58icXT/QcACOacDfWShcxP98afMyqxy71QQXNYBe
         pQqRBLXw7BJYsf3uqG3ZUcTuIfw6KFI2xTRAPqhnMGTZ4Pz/tjhuDMIl+w6fwsWXG2cB
         zGAQ==
X-Gm-Message-State: AOJu0YwR/N/IFDn2pyemzwcevTJPJAzG/YE1bw0m1h++tRiICchV8OoN
	pCqND6Gwpe5mBnR+k+pMhVahYjXVgr+eTi94ySFabiryofrAvkiIXZOWTSBMvA==
X-Google-Smtp-Source: AGHT+IFJyq39jzuL7LrUlo8EweDtCnE0p23r4+FycNl3B7WWaJ77ubK6JzDYIpa0HkepggsPACCATg==
X-Received: by 2002:adf:b312:0:b0:33c:e321:b285 with SMTP id j18-20020adfb312000000b0033ce321b285mr281999wrd.12.1707838027246;
        Tue, 13 Feb 2024 07:27:07 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWL5z0m5RIQgbYAMQ4bqNvZhWXpBlL5kq2GgWKOPS/BUaxav89uJ0XCL8SitHVUHv+y5AQDr/cu5wHSy6P2wOimkWjHd+fEo6d2da+/paCIa1ZIeeYebtpTQW5IokyJ5tLNCf9Hm4Vg+pFUdNyVLMaF/6xO9fD8w/5OTA==
Message-ID: <c8d747a9-e164-460a-9e50-e976580d10ef@suse.com>
Date: Tue, 13 Feb 2024 16:27:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] libxl: Fix comment for LIBXL_HAVE_VMTRACE_BUF_KB
Content-Language: en-US
To: =?UTF-8?Q?Petr_Bene=C5=A1?= <w1benny@gmail.com>
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>,
 Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
References: <4ced67935b2e1a2fc79ccda7624c0849bea6cd87.1707836102.git.w1benny@gmail.com>
 <34bfa65b-5537-4bd3-a017-c9a3b01fb331@suse.com>
 <CAKBKdXiZ1wcz7_GnUHUmuboTHHVEE03QPSeWhdRKMoV=o7nf3w@mail.gmail.com>
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
In-Reply-To: <CAKBKdXiZ1wcz7_GnUHUmuboTHHVEE03QPSeWhdRKMoV=o7nf3w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 13.02.2024 16:08, Petr Beneš wrote:
>> On Tue, Feb 13, 2024 at 4:02 PM Jan Beulich <jbeulich@suse.com> wrote:
>>
>> On 13.02.2024 15:56, Petr Beneš wrote:
>>> From: Petr Beneš <w1benny@gmail.com>
>>>
>>> It's located in libxl_domain_build_info, not libxl_domain_create_info.
>>>
>>> Signed-off-by: Petr Beneš <w1benny@gmail.com>
>>> Acked-by: Anthony PERARD <anthony.perard@citrix.com>
>>
>> Any reason you didn't also add the Fixes: tag that Anthony suggested
>> to put there (for me to recognize that this may need backporting;
>> didn't check yet when that earlier commit went in)?
> 
> Apologies. No other reason that it's my first experience with creating
> v2 patch and I honestly didn't know that the "Fixes: tag" suggestion
> was directed at me. How should I proceed from here?

I'll try to remember to insert it while committing.

Jan

