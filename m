Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FF7C8B2FFB
	for <lists+xen-devel@lfdr.de>; Fri, 26 Apr 2024 07:58:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.712410.1113086 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s0Eac-00014n-0R; Fri, 26 Apr 2024 05:57:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 712410.1113086; Fri, 26 Apr 2024 05:57:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s0Eab-00012h-Sx; Fri, 26 Apr 2024 05:57:41 +0000
Received: by outflank-mailman (input) for mailman id 712410;
 Fri, 26 Apr 2024 05:57:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=lj3M=L7=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1s0Eaa-00012b-F3
 for xen-devel@lists.xenproject.org; Fri, 26 Apr 2024 05:57:40 +0000
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [2a00:1450:4864:20::12b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e3900aa3-0391-11ef-909a-e314d9c70b13;
 Fri, 26 Apr 2024 07:57:39 +0200 (CEST)
Received: by mail-lf1-x12b.google.com with SMTP id
 2adb3069b0e04-51ca95db667so514155e87.0
 for <xen-devel@lists.xenproject.org>; Thu, 25 Apr 2024 22:57:39 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 s16-20020a1709060c1000b00a560ee2db26sm5028674ejf.124.2024.04.25.22.57.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 25 Apr 2024 22:57:38 -0700 (PDT)
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
X-Inumbo-ID: e3900aa3-0391-11ef-909a-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1714111059; x=1714715859; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :from:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=kpvzPvt/cvEVfafBw9a77e4DszJmZIpLs4Jzf1taytU=;
        b=cMMLuO5nWw5o2dKgsx76ERYOmctGomkKnBm4KKNeoV1Nw7LPXpq0LWHPqGSdRPzhep
         4YIWUyQQdNxNMha4lmWz2FBUjZExuUlSuTuS+V2Vh/RqvMmknWx15ESFPPsn8Q/g0lTx
         D+/Mb9sCFoIQZn4dRZIAd5hbLWafC5+sR96LXNMAmSJhZ4LuJH6mBsQJfZ9+Qb3soxJ2
         psDlJEhJQioQdGhvtCLpXUPT0f46a8pW+/xn5nBs0Vxl2pPpZRBMb7uU0bK74afhrX7r
         yiUkNra00e+M7aK0NtzLNx2RYFH/I0VC1CL3V1+jNyC3Oaka4EBCaGf4IeG/XbZp9SAS
         9RSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714111059; x=1714715859;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :from:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kpvzPvt/cvEVfafBw9a77e4DszJmZIpLs4Jzf1taytU=;
        b=TdhavBfyfDlz4uZDAKAv4Hozt0Z3ynmFxqcF3oJQD4jj1GKaipqgEGW2zrQGjFTbYI
         GmWnfeod0Np3nXfmUxCqmJ+WUATUFwh2Fy6YwER6ITAPTRHssdBTxp6rLEH/3lgURx60
         RYiiFDUmJPUMDoF/6g98UFgifOR3WuCInY3nbuy2cbixl2/67cBHDL1ptlhyRdUnHCs1
         Xc26LYhFjMoibp2OwJv9BAJfP3zy84V1TRzRFweZf6kVm0v4HmWWZO6Jn/d9hs7QBa71
         L9mEgL8kUpbB8oRPqGW91xceGXuTT77m4wioVdcb9Mk6QtA42eXwTvkai3v5KsJulOPB
         hRfw==
X-Forwarded-Encrypted: i=1; AJvYcCU4El3/fJ+bKvv16jZSxzS4n3g4VFa2YGDIS87banTzPknWe/MmkF0k0jTHCdfcaBdi1AkIGo2Dsayvfqb1Nv2RMraTbZp970Y//Ob8Mu0=
X-Gm-Message-State: AOJu0Yy1f78/8VI7fSssNTrTHBvz2cLaQ09MNel+u8+HzOxvOqHNryES
	7ovtgyNaJQ/i5v1umDesxuBMg73dB0XLFUpVHj3UsVsNUYG7VTfRkoBjc7GveHL2Bl6rw8W/SXo
	=
X-Google-Smtp-Source: AGHT+IGLU2/BJIZtXLtqt0MjhEVTZyeFCx5XWOrttMGGQGGVzIhA/nQzZtcLiAwngYzuQfkNOE8eYg==
X-Received: by 2002:a05:6512:ac1:b0:51c:cc1b:a8f6 with SMTP id n1-20020a0565120ac100b0051ccc1ba8f6mr274638lfu.20.1714111059008;
        Thu, 25 Apr 2024 22:57:39 -0700 (PDT)
Message-ID: <a0404716-7611-4b2f-9fd1-c16b109067b5@suse.com>
Date: Fri, 26 Apr 2024 07:57:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 7/8] gzip: move bitbuffer into gunzip state
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>
Cc: Jason Andryuk <jason.andryuk@amd.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org,
 Andrew Cooper <andrew.cooper3@citrix.com>
References: <20240424163422.23276-1-dpsmith@apertussolutions.com>
 <20240424163422.23276-8-dpsmith@apertussolutions.com>
 <06b325c3-04a4-4294-85e1-a6d05019e3f0@citrix.com>
 <42614bdf-0aaa-4bbe-aa0f-f9d54c1e10d1@suse.com>
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
In-Reply-To: <42614bdf-0aaa-4bbe-aa0f-f9d54c1e10d1@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 26.04.2024 07:55, Jan Beulich wrote:
> On 25.04.2024 21:23, Andrew Cooper wrote:
>> On 24/04/2024 5:34 pm, Daniel P. Smith wrote:
>>> --- a/xen/common/gzip/inflate.c
>>> +++ b/xen/common/gzip/inflate.c
>>> @@ -1017,8 +1014,8 @@ static int __init inflate(struct gunzip_state *s)
>>>      /* Undo too much lookahead. The next read will be byte aligned so we
>>>       * can discard unused bits in the last meaningful byte.
>>>       */
>>> -    while (bk >= 8) {
>>> -        bk -= 8;
>>> +    while (s->bk >= 8) {
>>> +        s->bk -= 8;
>>>          s->inptr--;
>>>      }
>>
>> Isn't it just me, but isn't this just:
>>
>>     s->inptr -= (s->bk >> 3);
>>     s->bk &= 7;
>>
>> ?
> 
> I'd say yes, if only there wasn't the comment talking of just a single byte,
> and even there supposedly some of the bits.

Talking of the comment: Considering what patch 1 supposedly does, how come
that isn't Xen-style (yet)?

Jan

