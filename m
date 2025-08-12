Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E26AB22090
	for <lists+xen-devel@lfdr.de>; Tue, 12 Aug 2025 10:19:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1078411.1439399 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ulkDw-0004O5-K7; Tue, 12 Aug 2025 08:19:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1078411.1439399; Tue, 12 Aug 2025 08:19:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ulkDw-0004MN-HS; Tue, 12 Aug 2025 08:19:12 +0000
Received: by outflank-mailman (input) for mailman id 1078411;
 Tue, 12 Aug 2025 08:19:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Pr65=2Y=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ulkDv-0004MH-Cj
 for xen-devel@lists.xenproject.org; Tue, 12 Aug 2025 08:19:11 +0000
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [2a00:1450:4864:20::632])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 05608c07-7755-11f0-b898-0df219b8e170;
 Tue, 12 Aug 2025 10:19:09 +0200 (CEST)
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-af9611d8ff7so913458466b.1
 for <xen-devel@lists.xenproject.org>; Tue, 12 Aug 2025 01:19:09 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-af91a078cbasm2169983266b.5.2025.08.12.01.19.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 Aug 2025 01:19:08 -0700 (PDT)
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
X-Inumbo-ID: 05608c07-7755-11f0-b898-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1754986749; x=1755591549; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=msNObn64K/b+WyR6ZKvFGUVAbGoAb9fs4i3A4OZSrow=;
        b=Mm9li0MopS3oKO9ctAaeV1bpJiQbIgaSRm+f1KqdwE0PdHyYyU2hFegcvahA1/6PE8
         JTCDmoH/EbW3DOnobu9rOsKVC9IeR2hNIjmUt0N2ivikAxKcxtYpYUCS0Bhgf27EZvTz
         ToO/iE7WXSUfRtMCZ0csgxx8hvQF9KAP0FjOGBD6PPqYMMx079Vt8zNHV7q/RhY6F+YA
         941dGF+su/p8K3wlnNNFwsQsY/Y8gU7ykyTDFYj+45s9SpwvAp6Rq1bDN7udCp0iwOTm
         EEAxNa4AZPhFiuwgFKM3htDjS9XRrZ4ow0mCAFZE4SCE6OOz9ll+Zz9+XOz/RpaeJkCy
         jp/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754986749; x=1755591549;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=msNObn64K/b+WyR6ZKvFGUVAbGoAb9fs4i3A4OZSrow=;
        b=nEXHwvpXaPXvC7tzJDjKxJYemBxCYVnzTjwJ2A+OGI6QKohOsZV2UBJx+DGEOCzNbB
         P9kE+5t7hvbTr/NA77XO/OF4Vjt2xxauNWQsr7nLG1xXKgAuTiFFU56k3cIZMF9ZEA6Y
         /unrqxuLH7iXS+94y6vdbqUReQikU2CuBBlTcNG1NtgzjUlzgEZv3coYteorovvtTIFI
         3T4Ov/VZrVaglbrf0mjye/6agAuhdNhhcIpQ/mf3f6oe3XsMddmE8R234J8aJjQkc/gA
         6ceRqhJGKGUpXw+or9fXHMssYqXhnl4MFyRFtRKQID3BxgbHpCp7YROY0ga+m5lj46vh
         70/Q==
X-Forwarded-Encrypted: i=1; AJvYcCXwmqXJes7RC8OHMfr4urJ5u8tICj0hokr1GnG/mlBZToOCyWxFWoIuLuyg1wwcNLgdCQ/LQ9g7JQ8=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yzv80O3gVPyHSEMXk99gtdAZGf06Y6RhR/QFSkHajz6mZUgcKEQ
	SVT3xLT1rTz9bgtS3czpTCPlq3AQ3GFEmZrqP5FgnUe4saFm/6VMEzc13PY9+6u65w==
X-Gm-Gg: ASbGncseQhf7hau7JzBQ9mzDV6h0Ga/02RPSnWk9G+ehlu9Ve8XaP18D8UmJ9Kn3oy6
	q3UV+ua09IOCKK7LBosPh44Q9Zn/uPdidZOc644RZkQFlHHKKEY1djTKkaKf1d94J5T/SEtEU3r
	QK8z/kMGR0KSzwGax/TExmgwKmVCd6J2/U7GWPXnbm66IYlSUDiu87ldcKqUndVHZtqsvLqX+fW
	cfxujUcSHBSY9yYmwajOdDk9TPWMhaq1tDtpfydEfP64Dbh+g/i/0Ml76XOfQVtgfSOiED3bJKz
	8ft0468+hVEjRia4avpWLKUj3QQgnOB1kpj3q4Yh6MspvzuAhBpNuGEjnD8/JEggIeItfsd0U7y
	5BS2corUCA8Yqh3SEN2Qe/t9eSJ3e7UOMSXyQQufMp9OwzQ+AyAmrYdnWvBVm3UIvgGJl+1ZL71
	QLrcmgtas=
X-Google-Smtp-Source: AGHT+IFXDqucQ+tsb4a1uoljrTkceXBHKgD/V448VdcnbjlhBBPAHKos+ep8xyoMczh5UeUxEccbXg==
X-Received: by 2002:a17:907:971c:b0:af9:3f99:1422 with SMTP id a640c23a62f3a-afa1d617a1dmr261034266b.5.1754986749041;
        Tue, 12 Aug 2025 01:19:09 -0700 (PDT)
Message-ID: <59f267a5-ca5f-4708-8538-e2c7d5fc0c3b@suse.com>
Date: Tue, 12 Aug 2025 10:19:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 06/22] x86/traps: Introduce bsp_traps_reinit()
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20250808202314.1045968-1-andrew.cooper3@citrix.com>
 <20250808202314.1045968-7-andrew.cooper3@citrix.com>
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
In-Reply-To: <20250808202314.1045968-7-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 08.08.2025 22:22, Andrew Cooper wrote:
> ... to abstract away updating the refereces to the old BSP stack.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

If it helps later:
Acked-by: Jan Beulich <jbeulich@suse.com>
with ..

> --- a/xen/arch/x86/traps-setup.c
> +++ b/xen/arch/x86/traps-setup.c
> @@ -107,6 +107,15 @@ void __init traps_init(void)
>      percpu_traps_init();
>  }
>  
> +/*
> + * Re-initialise all state referencing the early-boot stack.
> + */
> +void bsp_traps_reinit(void)

... __init added here.

Jan

