Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A871595C57E
	for <lists+xen-devel@lfdr.de>; Fri, 23 Aug 2024 08:33:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.782140.1191602 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1shNpz-0006jW-7N; Fri, 23 Aug 2024 06:31:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 782140.1191602; Fri, 23 Aug 2024 06:31:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1shNpz-0006hL-4W; Fri, 23 Aug 2024 06:31:55 +0000
Received: by outflank-mailman (input) for mailman id 782140;
 Fri, 23 Aug 2024 06:31:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=+Ly7=PW=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1shNpx-0006hF-Mw
 for xen-devel@lists.xenproject.org; Fri, 23 Aug 2024 06:31:53 +0000
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [2a00:1450:4864:20::635])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 62467df9-6119-11ef-a50a-bb4a2ccca743;
 Fri, 23 Aug 2024 08:31:52 +0200 (CEST)
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-a86abbd68ffso10640366b.0
 for <xen-devel@lists.xenproject.org>; Thu, 22 Aug 2024 23:31:52 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a868f43790bsm210819466b.126.2024.08.22.23.31.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 Aug 2024 23:31:51 -0700 (PDT)
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
X-Inumbo-ID: 62467df9-6119-11ef-a50a-bb4a2ccca743
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1724394712; x=1724999512; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=YjdBEQO1jlm3fuESIohG+xz31zFEudu6/daTF547e1I=;
        b=LeJ+JzELv0HKv167iKWvQ22XAi8zIe8cV8M4dw9v6QvyEo5xhlJ1p9OK3fymRa5OZI
         JM9qLsRwVmYU2lgxIBM2YO1iO/EUTjOs/hC+XOi2LHNIjmrewTZoWEUdetVsq/srvtt0
         d99H0UzWIIFKPP2MkO0ZsAlBbcKJPc9k2ZHCKFJK6j1c+Pl3Ky3IxNymqp4OzyWhNzxI
         5ydHl9i66i1bb4dig2AVbovLXl87vY9vv8M4xAWewkIukjU64lI9J6/w5TZnF5rSk/2P
         OKQGWAW17LfYgueEyuKNQxZhOtXs4Kxv5dha8WXb1/UIXkg3sMfamBmp+DK0hoD/J7EM
         iBcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724394712; x=1724999512;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YjdBEQO1jlm3fuESIohG+xz31zFEudu6/daTF547e1I=;
        b=Lel2kanplwA8q28jv+cMDJBjKiUSSoS+znA2wuc8+1fIZpcKx+v1fxMCcVLUdKtZ/R
         FYKgnwGzjYJ6Stf4fnPWDyfhkCsyT1brAmaAgEGkanlDGI+8Z3heFvr2CkeMxSASuCBg
         5g7RxvOvBk7/LkELEBGNSCR/DQ3MrRA2PRiPwtCd3gI5Sp0XK4oePLLGBxlLTG+EBKNy
         cgpUh55iIdnHFg+jmrxsIUgSOmH9aULx3wGPFKTlg5BjceWjN/+BZGggKs/jGgYux7Vh
         zQb/LbNba6a9qhZOE+qOq9ZCHi4eLwF+HJ4j1GQR4uhUoVVdslC22k5VEyDBHcGNdXhr
         79Aw==
X-Forwarded-Encrypted: i=1; AJvYcCV050+lSf8vBOEDagegtMl2P8/vtg/mdJEnByzmDkz+BMo4lnNW1Aa8ZSSDnfWNH8az3FxSz28n+w0=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwcjvJ3LPrApqfHNjI3IIdeSvQ/hNLpn61PS6M8OUU6p2wk9iUT
	O7SLOynZIg54DJSVZt80HI1tSlkYU9bSh2LA/b3XLGGtcpta3kCWSbq+inY936Av/BTg562pHrI
	=
X-Google-Smtp-Source: AGHT+IEz0HZE9T6v3TnwLmHWp49xCvAr8+Frwi6ggjDb550xULk8hW+1QjHExOPDFmKHYDBMjKxS8Q==
X-Received: by 2002:a17:907:96a1:b0:a80:b016:2525 with SMTP id a640c23a62f3a-a86a2f5a37bmr138366566b.8.1724394711643;
        Thu, 22 Aug 2024 23:31:51 -0700 (PDT)
Message-ID: <7b575ad5-c7c6-4054-8036-9d2961630d42@suse.com>
Date: Fri, 23 Aug 2024 08:31:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v1] libxl: Fix nul-termination of the return value of
 libxl_xen_console_read_line()
To: Javi Merino <javi.merino@cloud.com>,
 Anthony PERARD <anthony.perard@vates.tech>
Cc: Juergen Gross <jgross@suse.com>, =?UTF-8?B?RWR3aW4gVMO2csO2aw==?=
 <edwin.torok@cloud.com>, xen-devel@lists.xenproject.org
References: <ad7c89bbae34155566ae7c9ca2cb501f21c7d585.1724330921.git.javi.merino@cloud.com>
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
In-Reply-To: <ad7c89bbae34155566ae7c9ca2cb501f21c7d585.1724330921.git.javi.merino@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 22.08.2024 15:13, Javi Merino wrote:
> When built with ASAN, "xl dmesg" crashes in the "printf("%s", line)"
> call in main_dmesg().  ASAN reports a heap buffer overflow: an
> off-by-one access to cr->buffer.
> 
> The readconsole sysctl copies up to count characters into the buffer,
> but it does not add a null character at the end.  Despite the
> documentation of libxl_xen_console_read_line(), line_r is not
> nul-terminated if 16384 characters were copied to the buffer.
> 
> Fix this by making count one less that the size of the allocated
> buffer so that the last byte is always null.
> 
> Reported-by: Edwin Török <edwin.torok@cloud.com>
> Signed-off-by: Javi Merino <javi.merino@cloud.com>

Perhaps wants a Fixes: tag as well?

> --- a/tools/libs/light/libxl_console.c
> +++ b/tools/libs/light/libxl_console.c
> @@ -779,7 +779,7 @@ libxl_xen_console_reader *
>      cr = libxl__zalloc(NOGC, sizeof(libxl_xen_console_reader));
>      cr->buffer = libxl__zalloc(NOGC, size);
>      cr->size = size;
> -    cr->count = size;
> +    cr->count = size - 1;
>      cr->clear = clear;
>      cr->incremental = 1;

While this looks to be addressing the issue at hand, I still wonder: Why
does the "count" field exist at all? It's certainly odd to be set right
here (when the buffer actually is empty). It's used solely in
libxl_xen_console_read_line(), so could be a local variable there.

Then, further, I wonder why struct libxl__xen_console_reader lives in
libxl_internal.h - it's used solely in libxl_console.c.

Finally - why libxl__zalloc() when libxl_xen_console_read_line() clears
the buffer anyway?

Jan

