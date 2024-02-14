Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CADA854C4B
	for <lists+xen-devel@lfdr.de>; Wed, 14 Feb 2024 16:13:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.680966.1059424 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1raGwY-0002kj-FS; Wed, 14 Feb 2024 15:13:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 680966.1059424; Wed, 14 Feb 2024 15:13:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1raGwY-0002iq-CN; Wed, 14 Feb 2024 15:13:02 +0000
Received: by outflank-mailman (input) for mailman id 680966;
 Wed, 14 Feb 2024 15:13:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=l+oD=JX=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1raGwX-0002ic-25
 for xen-devel@lists.xenproject.org; Wed, 14 Feb 2024 15:13:01 +0000
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [2a00:1450:4864:20::232])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8a53ea85-cb4b-11ee-8a4d-1f161083a0e0;
 Wed, 14 Feb 2024 16:12:59 +0100 (CET)
Received: by mail-lj1-x232.google.com with SMTP id
 38308e7fff4ca-2d0a4e8444dso63364111fa.2
 for <xen-devel@lists.xenproject.org>; Wed, 14 Feb 2024 07:12:59 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 hn32-20020a05600ca3a000b00410ebcf8180sm2206447wmb.43.2024.02.14.07.12.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 14 Feb 2024 07:12:59 -0800 (PST)
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
X-Inumbo-ID: 8a53ea85-cb4b-11ee-8a4d-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1707923579; x=1708528379; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SmBQtWqYk9CvBmizB1i7LwVJxy/3yjASVs1Xa7mYRYo=;
        b=Q7yEbJSDvxJ8eZ151M2V6f1uY8KzqJXsIe3CQmRBThHtcUb44Tra1fXTuJtcXdZe7F
         HEeVdkJqq80js02BPiTbElWHXoRAONORVkzt5eJp9nhbWxsnFKNGUy/ZL6+YwuaCuU+d
         hqg/pNorY98PN+s+7nNfAoMeHNB5S4JY9idsHVhVo4InkgOnjHu6Qvv1PoqhKktwSAjy
         3RSg+WtTjxN0wBgCZeynH1n/VW/Jj+BhmyFf0PS/D7iK1l6hCje8Ybl9PbfJGxiJFjOu
         fp0xG3s4srJH9qi0VwKdUXI6T9gCCXL/cCGderLieNEFpus+/pIvCLSR92mv7Xf0ggS+
         drIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707923579; x=1708528379;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SmBQtWqYk9CvBmizB1i7LwVJxy/3yjASVs1Xa7mYRYo=;
        b=W270bQSB1FDxLESnMHSYf7R/u0+j+rPaI6EB6UQWh4zToX+uNI69IgvCt9VLNmJ7gX
         tKjJDbeQLT40QO0KJKJnoDDfGhpFcjUR3o3evYqRIWlAjJTF7eiyNN0prNYTFks6D261
         M1Pj0mvnEpyqMObCbiY/F4OApT9hWyQPYkICpMX0Wdz2pRTQv+3bAVN7mgUUmlo2Zf5Y
         75Bw2SE+2x3snnE6TS00j5tHN08oOViuIMT3kE4As+eJOfoP1J8aKDu1mnjdpEGOoE7Z
         K0jNYEU0DOzoPR4MZBd2dmYgPzxiv0RBIuMg0gF4uZ7V0HuvVXasbht+6Fh5gPzlFUsL
         fTZw==
X-Forwarded-Encrypted: i=1; AJvYcCUXF85wIExMJK/CYKZAd0/mT9L1hPJkrF/bbEQV/weBu/E9mBBBNdxmj7DGZgaWM+cMB5T7F6mNnf4giPpw1pW1pCQPfSgAmdkYgNG8RUg=
X-Gm-Message-State: AOJu0YynOojG3URMmXG5Y2/0JIQlE2XmCiizmXpC8uls47lE9Sz5AV+V
	PdFbdWppBX8uf5TOkBpoF+wrdB/rvUTvBSYJLnHzHx4xyJwcF+TPytalAR0L3w==
X-Google-Smtp-Source: AGHT+IEM3+DZ1fCRA+5ZVBlBnelcscSOrVF8Zji8HWdFkqEXOcyMkelxT+fivlwQoZ/vBVpnfCv6lA==
X-Received: by 2002:a05:651c:212:b0:2d0:c490:affe with SMTP id y18-20020a05651c021200b002d0c490affemr2240015ljn.19.1707923579513;
        Wed, 14 Feb 2024 07:12:59 -0800 (PST)
Message-ID: <560ff594-97fd-4cee-a9e4-70d153bf3a53@suse.com>
Date: Wed, 14 Feb 2024 16:12:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH] build: Replace `which` with `command -v`
Content-Language: en-US
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20240214143411.37957-1-anthony.perard@citrix.com>
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
In-Reply-To: <20240214143411.37957-1-anthony.perard@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 14.02.2024 15:34, Anthony PERARD wrote:
> The `which` command is not standard, may not exist on the build host,
> or may not behave as expected. It is recommanded to use `command -v`
> to find out if a command exist and have it's path, and it's part of a
> POSIX shell standard.
> 
> Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
> ---
>  xen/Makefile | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/xen/Makefile b/xen/Makefile
> index 21832d6402..767e47d6c7 100644
> --- a/xen/Makefile
> +++ b/xen/Makefile
> @@ -25,8 +25,8 @@ export XEN_BUILD_HOST	:= $(shell hostname)
>  endif
>  
>  # Best effort attempt to find a python interpreter, defaulting to Python 3 if
> -# available.  Fall back to just `python` if `which` is nowhere to be found.
> -PYTHON_INTERPRETER	:= $(word 1,$(shell which python3 python python2 2>/dev/null) python)
> +# available.  Fall back to just `python`.
> +PYTHON_INTERPRETER	:= $(word 1,$(shell command -v python3 || command -v python || command -v python2) python)
>  export PYTHON		?= $(PYTHON_INTERPRETER)

Shouldn't we go farther with this and also switch the use in
xen/build.mk (which looks to be the only other one I can find under
xen/ and config/)?

Jan

