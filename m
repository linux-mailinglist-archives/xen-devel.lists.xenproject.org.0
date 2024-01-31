Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D5ED7843A6F
	for <lists+xen-devel@lfdr.de>; Wed, 31 Jan 2024 10:11:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.673839.1048320 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rV6cP-0006Y5-P0; Wed, 31 Jan 2024 09:10:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 673839.1048320; Wed, 31 Jan 2024 09:10:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rV6cP-0006VZ-M0; Wed, 31 Jan 2024 09:10:53 +0000
Received: by outflank-mailman (input) for mailman id 673839;
 Wed, 31 Jan 2024 09:10:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=q596=JJ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rV6cO-0006VT-8D
 for xen-devel@lists.xenproject.org; Wed, 31 Jan 2024 09:10:52 +0000
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [2a00:1450:4864:20::429])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a062dbda-c018-11ee-98f5-efadbce2ee36;
 Wed, 31 Jan 2024 10:10:50 +0100 (CET)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-3394ca0c874so3965422f8f.2
 for <xen-devel@lists.xenproject.org>; Wed, 31 Jan 2024 01:10:49 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 cl1-20020a5d5f01000000b0033afcc899c1sm3400247wrb.13.2024.01.31.01.10.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 31 Jan 2024 01:10:49 -0800 (PST)
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
X-Inumbo-ID: a062dbda-c018-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1706692249; x=1707297049; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9p39soEk6ArgSnnhDao33UTSRr0AyyVIhT0eOH58YhQ=;
        b=EHf4ne0hK6gqSMI4rGV5s09QXXF5Pj7c/isS164s5hC03M+b6Bq9hPv0C+ZQIpOvSC
         vhPOhAfQuuepk5SUi5zQ3+jZ65wyM2XGQveMfkFNOqkf83n50F6WZEoG4YaHuK1SY+nk
         dhplDUUKzFo+I0xUc9fwCO0kzNCh10fgHndEvIw4WzpYEm+8wy+5HNz58kwjDeTY/V34
         qKI65gShe62ihT5F05/NBZoyE6w5ShLs42IuFj1l1IKaL8y60Gl+Pj0Ok0jfyUjF57N4
         KLJlhraFEtu0gQh5kN9wjtn2rCYuPYSXNN2Sjl7Aj4+4m6LKCf1TgCFWt+XyafrqLwe7
         6CTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706692249; x=1707297049;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9p39soEk6ArgSnnhDao33UTSRr0AyyVIhT0eOH58YhQ=;
        b=YMbVK9OV5KaV5+W3kfj+bYTSiuOUOzvgZKkJxL2ivzWecOlcP4PnjClRDqlpF68Kzj
         mJnDqmwCiPwj9KJE4eoF7fbA53p2KmSOOo5OR0LPaAZxnAk3mZQvyPY0apkPH47PEurH
         2gXieZ6fAdsRDqJJfenV90zUOv0oGTEETcU0PNvD88MvYNArXnDvdwjysN/kpi7SUYJI
         UWyfDuuXmqsyvlkybGlez4BcblxnxHMMTD5hPgl70fLg5aK227yJye404Oe95TDcZPVz
         t+TctwU6Rn8NOn3lwv3LqxHb1El+r0/LTicxkaXovrfm0ekje9DqmDMB/iDpEM9FiYid
         NfJA==
X-Gm-Message-State: AOJu0Yx2NqfCMVSBoQ/qibH8r5myZzAnHG/u2rFgnweYTYpuQlN9gEV8
	lRwwpw/3G0Yp8KHKxEHLLF0Z4P6AEjZURZPxXiRjEhA+z38g4quq0v2F9uGEXA==
X-Google-Smtp-Source: AGHT+IE+MMEYtp/hiMQ/8pK/ifPMCBZ6P93wY3VQNqAQtVPFVELZh+6Pu2uP2kW9bUjIEq78zSY0aA==
X-Received: by 2002:adf:ec45:0:b0:33a:e73b:b0d0 with SMTP id w5-20020adfec45000000b0033ae73bb0d0mr801433wrn.32.1706692249291;
        Wed, 31 Jan 2024 01:10:49 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCWxQ+kLz2F3bJwDBt3h2XTbC8jx+sXu0jwvIY+/NswatyPFwJsK/p8oQs3CahmF5HU/hLREEZqFo1xpyTc0POA44TMjN3/CDwItayOpxFPRLItHMS5g/W/N+83MvJ32B0mdC4c3eMLm5Z6XpFFs28DdGbHXD82hc+ac5DyuKEHNM5sUv6mtYWRNNUD67GlBC+2v/cSXx+SvbpzzeEpwAqvSPYstbtxdVqE1gVldCT1oIKngYnOh2Qb1WMKx2pNFbr2UIZr9TIHzqGz/EH1Ltzt4U5utfwP+q7fyWnYoxP4za7pTvzmlfGOdJBVMYDrA8VuGUinhNJ2dykbM61DdGwqSBvYhWMR1x1CpgXj4ehFDlcYJakqM4zNK6rrloT29zffgiqpjiNEW03dhabXjhiCbFSvru/46RXWMmA==
Message-ID: <4ac2f9e6-8fa7-4446-8af3-29de4028c7a6@suse.com>
Date: Wed, 31 Jan 2024 10:10:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/*/asm-offset: Fix bad copy&paste from x86
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien@xen.org>, Volodymyr Babchuk
 <Volodymyr_Babchuk@epam.com>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>, Bob Eshleman <bobbyeshleman@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Shawn Anastasio <sanastasio@raptorengineering.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20240130222808.106006-1-andrew.cooper3@citrix.com>
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
In-Reply-To: <20240130222808.106006-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 30.01.2024 23:28, Andrew Cooper wrote:
> --- a/xen/arch/x86/x86_64/asm-offsets.c
> +++ b/xen/arch/x86/x86_64/asm-offsets.c
> @@ -18,11 +18,11 @@
>  
>  #define DEFINE(_sym, _val)                                                 \
>      asm volatile ("\n.ascii\"==>#define " #_sym " %0 /* " #_val " */<==\"" \
> -                  : : "i" (_val) )
> +                  :: "i" (_val))

The removal of the last blank is against our style; instead a blank wants
insertion after the opening parenthesis.

>  #define BLANK()                                                            \
> -    asm volatile ( "\n.ascii\"==><==\"" : : )
> +    asm volatile ("\n.ascii\"==><==\"")

Similarly here while dropping the colons is fine, the blanks next to the
parentheses want keeping.

With that adjusted throughout
Reviewed-by: Jan Beulich <jbeulich@suse.com>

Jan

