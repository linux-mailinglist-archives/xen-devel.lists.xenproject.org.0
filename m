Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 48325996F5E
	for <lists+xen-devel@lfdr.de>; Wed,  9 Oct 2024 17:14:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.814776.1228446 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1syYNN-0007De-Bb; Wed, 09 Oct 2024 15:13:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 814776.1228446; Wed, 09 Oct 2024 15:13:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1syYNN-0007Bu-8S; Wed, 09 Oct 2024 15:13:21 +0000
Received: by outflank-mailman (input) for mailman id 814776;
 Wed, 09 Oct 2024 15:13:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Z5PZ=RF=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1syYNM-0007AR-As
 for xen-devel@lists.xenproject.org; Wed, 09 Oct 2024 15:13:20 +0000
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [2a00:1450:4864:20::533])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 043bd66b-8651-11ef-a0bd-8be0dac302b0;
 Wed, 09 Oct 2024 17:13:19 +0200 (CEST)
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-5c928611371so851272a12.0
 for <xen-devel@lists.xenproject.org>; Wed, 09 Oct 2024 08:13:19 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c91cbcef7asm1046944a12.21.2024.10.09.08.13.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Oct 2024 08:13:18 -0700 (PDT)
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
X-Inumbo-ID: 043bd66b-8651-11ef-a0bd-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1728486799; x=1729091599; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=WDxBdv25sYK7I5dsHcdBDYf5Brn0i7juSVfocGrSMhc=;
        b=MW1RgY5pun8JoPyxnvbVUFxquNZX43LhsjLNWGWX+1QzfdiUuEmAK/LFVoQmxWwsYZ
         CSQZXLjNYbHWPxJzNovHnl85eHMXQby8p8EIDP6FuplR+a+UkNysVgajKT+Zxw5ZObp1
         XSBBrzhBOqK/SeBNwmnSVXW4fxao09Srm31eBuCTi+sJkaIeHH+gatesgtI9zC2yt58R
         nX5ey25vy3j7D/DE91wleivK6t8grlEh447br507urAxDCfKoTqCHlO1d75w2zsEeAI5
         w5pH2vfwewVRPo0QsaII3L1wtIr2fLJY6t85Ra6/pc5keAiralyKqNa4NCkDvfqc9/56
         yjBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728486799; x=1729091599;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WDxBdv25sYK7I5dsHcdBDYf5Brn0i7juSVfocGrSMhc=;
        b=d4O5xyziVSWdG5c0awvd0t/p4A4Ugmqhyumy8j9mUT37EXorOLL+GW/RAisCYn2w3g
         LcwKtL1ztz3Um/UbisWxfQycPiyL1Xg8rWVmM2oprMK0kBTHxaMa0SQ5fUGHptzo3Zx1
         S4DL7KiOJAuuX22jZOBmYctGMMnC0OAlvXTol1W0UBQlVhxYnv8TZiZiMiiS1bvzfDIF
         XbEZBi/IBBJZYEWjscxIk1F/uuaT1GgMxAfhgoufcI35ruQ1FyitaVLEJNikrKA2c13L
         zYMuOIyTqQ23QQgWsGb4Kj/77ddkbjaO8Gg/pxiopVlEt8HfOJCFb9hU2wGY7G0V7k+B
         nDnA==
X-Forwarded-Encrypted: i=1; AJvYcCX3bvPuvJtDIQU5Q4RqeRgSZVKijclkjyW0RrMJwY3DbQMnsxAt2mh1fnutj2zZ9J00BEvLZkyWoU8=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzdKv3NL+i/CNkzb18RA6/KiMW2xv/6LU0ISx33FhF3MNl05Ltm
	USW4ajudhcKd8Q0xrL/9ibGHB8reK/Np78IYrxcafG6lxg98EXI/a731lNPBEg==
X-Google-Smtp-Source: AGHT+IExbbqyNWt2fPKyYIMNhJX6R1E0TijCcg/rASHtEuDYoIeTqUU83Whk9ZWQeNdt8OPbN8gL4g==
X-Received: by 2002:a05:6402:51ca:b0:5c8:9f3c:ea01 with SMTP id 4fb4d7f45d1cf-5c91d54d157mr1895353a12.2.1728486798856;
        Wed, 09 Oct 2024 08:13:18 -0700 (PDT)
Message-ID: <07b7f29a-db11-4ac6-bd1f-c2d9eb657b88@suse.com>
Date: Wed, 9 Oct 2024 17:13:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 04/44] x86/boot: move mmap info to boot info
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>
Cc: jason.andryuk@amd.com, christopher.w.clark@gmail.com,
 stefano.stabellini@amd.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20241006214956.24339-1-dpsmith@apertussolutions.com>
 <20241006214956.24339-5-dpsmith@apertussolutions.com>
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
In-Reply-To: <20241006214956.24339-5-dpsmith@apertussolutions.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 06.10.2024 23:49, Daniel P. Smith wrote:
> --- a/xen/arch/x86/setup.c
> +++ b/xen/arch/x86/setup.c
> @@ -296,6 +296,12 @@ static struct boot_info __init *multiboot_fill_boot_info(unsigned long mbi_p)
>      else
>          bi->cmdline = "";
>  
> +    if ( mbi->flags & MBI_MEMMAP )
> +    {
> +        bi->memmap_addr = mbi->mmap_addr;
> +        bi->memmap_length = mbi->mmap_length;
> +    }
> +
>      return bi;
>  }
>  
> @@ -1185,13 +1191,13 @@ void asmlinkage __init noreturn __start_xen(unsigned long mbi_p)
>      {
>          memmap_type = "Xen-e820";
>      }
> -    else if ( mbi->flags & MBI_MEMMAP )
> +    else if ( bi->memmap_addr )

I'd like to note that this isn't an exact transformation, as with the flag
set the memory map could theoretically also like at address 0. As long as
the legacy BIOS layout of low memory is as it is, that won't happen. I'm
less certain going forward, for legacy-free hardware/firmware. Imo at the
very least this needs mentioning as intentional in the description, for
archeologists to later be able to tell whether this was an oversight.

Or maybe it would be better to check ->memmap_length? That being zero
clearly means there's effectively no map.

Jan

