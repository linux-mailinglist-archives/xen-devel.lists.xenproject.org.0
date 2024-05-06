Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 60EAF8BCADD
	for <lists+xen-devel@lfdr.de>; Mon,  6 May 2024 11:39:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.717398.1119553 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s3uoT-0006Il-9Z; Mon, 06 May 2024 09:39:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 717398.1119553; Mon, 06 May 2024 09:39:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s3uoT-0006GE-6r; Mon, 06 May 2024 09:39:13 +0000
Received: by outflank-mailman (input) for mailman id 717398;
 Mon, 06 May 2024 09:39:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=gbjR=MJ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1s3uoR-0006G5-N9
 for xen-devel@lists.xenproject.org; Mon, 06 May 2024 09:39:11 +0000
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com
 [2a00:1450:4864:20::230])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7d953571-0b8c-11ef-909c-e314d9c70b13;
 Mon, 06 May 2024 11:39:10 +0200 (CEST)
Received: by mail-lj1-x230.google.com with SMTP id
 38308e7fff4ca-2e0a34b2899so23722551fa.3
 for <xen-devel@lists.xenproject.org>; Mon, 06 May 2024 02:39:10 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 r9-20020a05600c35c900b0041bf5b9fb93sm15477300wmq.5.2024.05.06.02.39.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 May 2024 02:39:09 -0700 (PDT)
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
X-Inumbo-ID: 7d953571-0b8c-11ef-909c-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1714988350; x=1715593150; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1n2DVMBt5fEB5Tp437HSYwkEpJgwZ2SQY1adK8Ybwdg=;
        b=Rm+JG2JO+hVs5cVH/2Cta/qkBkbjX/WQw5cnAOXobjMrhMIp/wUVOAULTjFDX/zJcy
         lDlUSApUfYVDi2nYpxbE7LoGaCxqCfFR/l4dVxuhWX8r8L5fA/r/fd5dxY1kKvdIPIsM
         UhJb8odqmGAq+sTsijya31w3+oqXSWu+yBFK+w4JlAK5BIFnQsrww7BqJ1TobPiT6Gb0
         /vbuYRkdcL/Qu3M+ALMCNH2I64PYqz9zf5o7oWYd8N6V8EYkuU8gkZ1UYFW7KfdDMSwX
         F9jowK219Tv4HE4tTbGcgTFIk5p3cDuv+csPmTIVXfTqgwyEsB0sCO+itKzawnnVVqTT
         MevA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714988350; x=1715593150;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1n2DVMBt5fEB5Tp437HSYwkEpJgwZ2SQY1adK8Ybwdg=;
        b=INGLgL18M/j+735SiowmosDgLCQic8Gg8tMk5/WGX+paD7QvO/C25yylBEJXJ4fJoF
         E7I7w6Sd4cZWfoBHXDNBSkLM39necL2++q08JSFLX9pfZFSlJIPM5gdgUAEfdgPw1j7g
         DX5QMcTqF+EjyrPADZymvVlWniErNtFNHyYGTD+UzQkoqWpxBf76YqUJYdMQZsN5yl4m
         4mDzzUImOIb/mz8kg8+l11U25g7cotNAFbWKPW6/CYfN7fPcvUua7jnsC/RCclYxYr4N
         lpMoYRYRBM4ze/B0aTpXFMkLsEgW5yFYHAZrJqn46WS34y3Kz96YHlteAZTzmo6+ancW
         OJow==
X-Forwarded-Encrypted: i=1; AJvYcCXYq33IrgXQAyaD0URRa6K142EcLgpt0iAS1j67u+ZDuEZnReleeu8mLZxN1uSL6W2TCZ3YrEH8bW4+iIr3DI25AzvvP+RckoCizkbL5RM=
X-Gm-Message-State: AOJu0YzXp2eYCHayK5Efa4V/DsIxFriig/mKjCJoFePM36lX5JBEPMeZ
	7FwFt5+PMfUpw5mxG2gx/XpKRJPRHr1N21NHHMV8Xv/oaKUECZd0ycUQdd3bKA==
X-Google-Smtp-Source: AGHT+IFTeY5bY37/AXMMNxuSh63QwqRpurC1a2f4LPh4w0eq4TqVcgRj7JxS3ppD/IcB7ovmiQ7Oqw==
X-Received: by 2002:a2e:3a1a:0:b0:2e1:a8ca:6166 with SMTP id h26-20020a2e3a1a000000b002e1a8ca6166mr8272740lja.43.1714988350182;
        Mon, 06 May 2024 02:39:10 -0700 (PDT)
Message-ID: <8b433feb-467c-4569-9426-cc245fc9da50@suse.com>
Date: Mon, 6 May 2024 11:39:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/5] Add --force option to xen-ucode to override
 microcode version check
Content-Language: en-US
To: Fouad Hilly <fouad.hilly@cloud.com>
Cc: Anthony PERARD <anthony@xenproject.org>, Juergen Gross <jgross@suse.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20240430124709.865183-1-fouad.hilly@cloud.com>
 <20240430124709.865183-6-fouad.hilly@cloud.com>
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
In-Reply-To: <20240430124709.865183-6-fouad.hilly@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 30.04.2024 14:47, Fouad Hilly wrote:
> @@ -21,10 +23,11 @@ static const char   amd_id[] = "AuthenticAMD";
>  static void usage(const char *name)
>  {
>      printf("%s: Xen microcode updating tool\n"
> -           "Usage: %s [<microcode file> | Options]\n"
> +           "Usage: %s [microcode file] [options]\n"
>             "options:\n"
>             "  -h, --help            display this help and exit\n"
> -           "  -s, --show-cpu-info   show CPU information and exit\n",
> +           "  -s, --show-cpu-info   show CPU information and exit\n"
> +           "  -f, --force           force to skip micorocde version check\n",

Besides (nit) the typo, isn't "version check" too broad here? Elsewhere in the
series you mention Intel's "min_rev" addition. _That_ kind of version check
probably shouldn't be permitted to skip? In which case maybe better "certain
version checking" or some such?

Jan

