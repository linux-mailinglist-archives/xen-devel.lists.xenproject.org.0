Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CA39C57205
	for <lists+xen-devel@lfdr.de>; Thu, 13 Nov 2025 12:16:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1161026.1489043 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vJVJB-0001Hx-T0; Thu, 13 Nov 2025 11:16:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1161026.1489043; Thu, 13 Nov 2025 11:16:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vJVJB-0001Ef-QE; Thu, 13 Nov 2025 11:16:09 +0000
Received: by outflank-mailman (input) for mailman id 1161026;
 Thu, 13 Nov 2025 11:16:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=HFQP=5V=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vJVJA-0001EZ-Sd
 for xen-devel@lists.xenproject.org; Thu, 13 Nov 2025 11:16:08 +0000
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [2a00:1450:4864:20::535])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 254620bd-c082-11f0-980a-7dc792cee155;
 Thu, 13 Nov 2025 12:16:05 +0100 (CET)
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-6406f3dcc66so1159768a12.3
 for <xen-devel@lists.xenproject.org>; Thu, 13 Nov 2025 03:16:05 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b7359bfb238sm49194866b.14.2025.11.13.03.16.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Nov 2025 03:16:04 -0800 (PST)
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
X-Inumbo-ID: 254620bd-c082-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1763032565; x=1763637365; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=c7QCK1+tg24sjXU8hjpXAn+s9zucVbjuH5q7MgxGunQ=;
        b=R+LOneUPxoVI9/O2o3TM/9OaNaSlPyRO0gcOFlbBeBXBTGtp3F78jnrA/8NeGndHZ9
         iMhv8fzrdkrc6MsK/Y+A38jQlbCpKuXcr8umQr8QRDcrsrASoiigWVs+fL6c94nMuhn7
         nn4W3Dr+LJ1gVU6DHHJSyLv6VeqUtqFt+EgUVgrYNlgD8pk8/LzrsG8LFxvuBFE50Wti
         t5/MXOFs8sfDn21tlu6k2C+5zKModILonatuUtlZE89Bw7b66yuai4HvZ/gQZpPyG55/
         vZoTdI9NLNgp6LXyXnOynPYfRnSP15avPHXxfO2sNJFAtN+6B7P8Fg8mWvhCrjXnfFdW
         8u6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763032565; x=1763637365;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c7QCK1+tg24sjXU8hjpXAn+s9zucVbjuH5q7MgxGunQ=;
        b=GSQ4QIO0NXTQuCkkNf3+wguzaoeedi9p0TxZplnBNCxkogaFt2brqqk+VzYzYAhnHG
         ShV1IRhYDFniF40mr2/n07s7JtE0qZYdYc95HXIeYqCbrtMQzLyF+HxkKfRlulDVqXwe
         AXW7CpOFgcWjmzdZ/gHovrDnrqUcLhlvy2tUkJeaqDAXn20PFffsEcB9gkgij6irwS7K
         Ux0a0b2krVDRvGNMRbSvCRsqeXb0uYE13P3SSDIeU2LjoCiguTFGJFAavWNf2iL2nHuD
         uZMvMB3RG/AMrsdQvqom5gqVxLM3YWtlJw9Z8giKKWztHgWCXxRcALMI6urLe1q6Aqs8
         5i+Q==
X-Forwarded-Encrypted: i=1; AJvYcCVIv30L9MJnq+9B5R0rLUwd06qcOpDWHW0S2PIcNiFHBAlhuhuMGAtmkZajKPX8tJMVK3xpB4F6B00=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yz2eufmfEPUl/pvIrwQe73MpZnfHVrMtIo5ViH0YI0IHfOPC8m0
	84+KKkS3kLNqIQ5B+VyAGQvMdNi+2pUmdN+sn9DS4J00Mrm9wBtX3iZYkYLD1MWVvlYcAIav+II
	BoOs=
X-Gm-Gg: ASbGncvkFzOalOYx+tm4XA2FYWXibXzw721CY3EZJnfHD1+l/QfQFrKpfLjnn5WiPFp
	xBa+0hWj//Aq1xN1Norz5Y/i/ePsKZbgFmqPmhnfrF9WS+RdyOGcv6NkKjcM+rR4bBq9Pc4USk1
	DUbsH2WtynA/nBLMDFTJicvNcLcFpjTn6sqnfJoxVL1Le6NedeIpACYBk/36erCfBZeC9MxEfIE
	GW86lCVbRDFSn1LX/MfPKhiY/zMMR8M6cNlLJAZRC8HVuIBp2lJWVyqgYPJj+aYVF5ZZ/2kv9HO
	y9qy952F5PbdAnlE7Q9tu+BDJpsq2Xu/noVM1oqYnf1bDNfRxfGMbnxULzZ6GXzIfpHZioZiSgp
	cCwVekFRdVxcv8rgBWreQLRu5mvgqQNm+fnYlxJJt1I3izEnzPlHFjK9BHi8PJw+2hyQVmk9Tz6
	tO+PQXPlTmyweu14TC0tINqncE+170dJanFlrumJK8CZLon5wOAiS/yxG9eIV+1t3hz8WjZiFEK
	CE=
X-Google-Smtp-Source: AGHT+IGQZrDQnPIb1iG5tvonIbYfDRWmsVBZc5AGS23JiNkYi/EnNGv4oMr5eEuPc6Xf2nEetIJMsg==
X-Received: by 2002:a17:907:60d1:b0:b73:21af:c0e7 with SMTP id a640c23a62f3a-b7331af147bmr721970666b.53.1763032564680;
        Thu, 13 Nov 2025 03:16:04 -0800 (PST)
Message-ID: <3a19c920-e5e6-43ea-ac07-674b07ce7301@suse.com>
Date: Thu, 13 Nov 2025 12:16:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RESEND PATCH v2 3/3] x86/hvm: vmx: refactor cache disable mode
 data
To: Grygorii Strashko <grygorii_strashko@epam.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Tim Deegan <tim@xen.org>, Jason Andryuk <jason.andryuk@amd.com>,
 Teddy Astie <teddy.astie@vates.tech>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20251111200958.3576341-1-grygorii_strashko@epam.com>
 <20251111200958.3576341-4-grygorii_strashko@epam.com>
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
In-Reply-To: <20251111200958.3576341-4-grygorii_strashko@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11.11.2025 21:10, Grygorii Strashko wrote:
> From: Grygorii Strashko <grygorii_strashko@epam.com>
> 
> The Cache Disable mode data is used only by VMX code, so move it from
> common HVM structures into VMX specific structures:
> - move "uc_lock", "is_in_uc_mode" fields from struct hvm_domain to struct
> vmx_domain;
> - move "cache_mode" field from struct hvm_vcpu to struct vmx_vcpu.
> 
> Hence, the "in_uc_mode" field is used directly in mm/shadow/multi.c
> _sh_propagate(), introduce the hvm_is_in_uc_mode() macro to avoid direct
> access to this field and account for INTEL_VMX configuration.
> 
> While here:
> - rename "is_in_uc_mode" to "in_uc_mode"
> - s/NORMAL_CACHE_MODE/CACHE_MODE_NORMAL
> - s/NO_FILL_CACHE_MODE/CACHE_MODE_NO_FILL
> 
> Suggested-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Signed-off-by: Grygorii Strashko <grygorii_strashko@epam.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>

> @@ -158,6 +166,11 @@ struct vmx_vcpu {
>  
>      uint8_t              lbr_flags;
>  
> +    /* Which cache mode is this VCPU in (CR0:CD/NW)? */
> +    uint8_t              cache_mode;
> +#define CACHE_MODE_NORMAL  0
> +#define CACHE_MODE_NO_FILL 2

I wonder though whether the odd use of 0 and 2 (rather than 0 and 1) needs
retaining ...

> --- a/xen/arch/x86/include/asm/mtrr.h
> +++ b/xen/arch/x86/include/asm/mtrr.h
> @@ -7,9 +7,6 @@
>  #define MEMORY_NUM_TYPES     MTRR_NUM_TYPES
>  #define NO_HARDCODE_MEM_TYPE MTRR_NUM_TYPES
>  
> -#define NORMAL_CACHE_MODE          0
> -#define NO_FILL_CACHE_MODE         2

... from how it was.

Jan

