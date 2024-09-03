Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 43EA896A2EE
	for <lists+xen-devel@lfdr.de>; Tue,  3 Sep 2024 17:38:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.789388.1198999 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1slVbl-00011r-Dk; Tue, 03 Sep 2024 15:38:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 789388.1198999; Tue, 03 Sep 2024 15:38:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1slVbl-0000zh-AC; Tue, 03 Sep 2024 15:38:17 +0000
Received: by outflank-mailman (input) for mailman id 789388;
 Tue, 03 Sep 2024 15:38:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=8q7v=QB=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1slVbk-0000zS-01
 for xen-devel@lists.xenproject.org; Tue, 03 Sep 2024 15:38:16 +0000
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [2a00:1450:4864:20::229])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 884e65f6-6a0a-11ef-99a1-01e77a169b0f;
 Tue, 03 Sep 2024 17:38:14 +0200 (CEST)
Received: by mail-lj1-x229.google.com with SMTP id
 38308e7fff4ca-2f406034874so66453981fa.1
 for <xen-devel@lists.xenproject.org>; Tue, 03 Sep 2024 08:38:14 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c226c6a437sm6535309a12.20.2024.09.03.08.38.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 Sep 2024 08:38:13 -0700 (PDT)
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
X-Inumbo-ID: 884e65f6-6a0a-11ef-99a1-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1725377894; x=1725982694; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=fNYEoSOxFtP8azigFDOt0sMIzx6btmEVYNlhqZz2xU4=;
        b=ZWgk01w1ykdOiATiNuXZEmOsUVjzFqmEo73hCxa19L15SCXJ92t9SvOIi/SIZLecLn
         TLKpRi9shGyrzOnreP/8cO6RAZLsFttcV5WCFWi3UCXhJg/SFYVhkPtUd6etEQOkZf40
         tqsn2byUEhcUH48p9Zy+KpB6DELck3sni1kIJbe9fkmAAVneJr1z2wG5pmmPzDaeTC+h
         6BkIPUOZMsaKKLQEO9xMg050Zmlb9CKFghBLQgh298118Ym0IfwPwQVLixAig5vK2D1r
         z74CXovEOP+eBVk1NXooezE9pUdPkjL63FqaY/RUxsJtDgSuW1EvZV9Dqv88zyo6lQ+W
         r/2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725377894; x=1725982694;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fNYEoSOxFtP8azigFDOt0sMIzx6btmEVYNlhqZz2xU4=;
        b=RKlpAdTTummosTMx1fffaI30ZkJUemyf060jeKc6dDOXXu+tW23KDbZcqRJQEwjxDi
         i9EPmHcHhxmr6zyaqzsS6WszvXmkoOG8RSyt+7aXrOW0UaggYdJWle6JMzvXFPfYLTgL
         UOxbKQnDJveK2+MelnFV1sCmVt4falG+5g1Jwrty6s459PoWOhdk5nlabVuGiK42hzqW
         yHb9C/DWh23v7Dkgfbolea0CKtSpyAhavPBA5qaM7v4xA1yGszvVbi5n1+QmnmYZ5q6f
         0WsqiiHhrYEqH1akHDfW2juvMsVMrpBZhxmGMxdfNGxVDXbJV9nSVb9qoFg3vzqivNyN
         JQNQ==
X-Forwarded-Encrypted: i=1; AJvYcCW/fP1btgVV1dyc7+uo/ZDkDJ9E8FdOFfQMMHOqdEkYKtq7w/1WEp13Q3vK8WxS2mVSVgwdP96NiEs=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yx9Jiu3/MOsazoVTM01GYMpxueq0vZCdAQjxCqoR3vFQ3g/qKUE
	7XdOLbvBWHfqzX26sFPQXRifzAfzgvaqIW1H+/I1KV/PX9EA/9ycI+aQBFUssA==
X-Google-Smtp-Source: AGHT+IEEkofcP4xjqwFPrxDSli1gonUNp8h4Z0t8RoWXAq7b7lP171QHwRASW/Khj8rUxMTWyv9d6g==
X-Received: by 2002:a2e:bc22:0:b0:2ef:1784:a20 with SMTP id 38308e7fff4ca-2f64d53e658mr8966431fa.38.1725377893567;
        Tue, 03 Sep 2024 08:38:13 -0700 (PDT)
Message-ID: <18a637ed-2ecd-4452-8a8f-70212f6c2e96@suse.com>
Date: Tue, 3 Sep 2024 17:38:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/7] x86/time: improvements to wallclock logic
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 xen-devel@lists.xenproject.org,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <20240903130303.71334-1-roger.pau@citrix.com>
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
In-Reply-To: <20240903130303.71334-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 03.09.2024 15:02, Roger Pau Monne wrote:
> Hello,
> 
> This series started as an attempt to change the default wallclock
> preference from EFI_GET_TIME to CMOS RTC, but has grown quite a lot.
> First 3 patches should be non-functional changes, mostly chopping the
> current logic into smaller functions so that in patch 4 the probing vs
> runtime wallclock logic can be split.
> 
> Patch 5 changes the preference to use CMOS RTC even when booted from EFI
> firmware.
> 
> Finally patches 6 introduces a new command line option to bypass the
> probing an allow specifying which wallclock source to use on the command
> line.  Patch 7 enables CMOS RTC probing by default.
> 
> Thanks, Roger.
> 
> Roger Pau Monne (7):
>   x86/time: introduce helper to fetch Xen wallclock when running as a
>     guest
>   x86/time: move CMOS edge detection into read helper
>   x86/time: split CMOS read and probe logic into function
>   x86/time: introduce probing logic for the wallclock
>   x86/time: prefer CMOS over EFI_GET_TIME
>   x86/time: introduce command line option to select wallclock
>   x86/time: probe the CMOS RTC by default
> 
>  docs/misc/xen-command-line.pandoc |  28 +++-
>  xen/arch/x86/time.c               | 238 +++++++++++++++++++++++-------
>  2 files changed, 208 insertions(+), 58 deletions(-)

Having reached patch 6, it seems pretty clear that somewhere in the series
a CHANGELOG.md entry wants adding.

Jan

