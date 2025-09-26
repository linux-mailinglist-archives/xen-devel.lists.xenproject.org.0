Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 09635BA2896
	for <lists+xen-devel@lfdr.de>; Fri, 26 Sep 2025 08:37:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1131037.1470272 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v225M-0004Wo-8d; Fri, 26 Sep 2025 06:37:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1131037.1470272; Fri, 26 Sep 2025 06:37:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v225M-0004Tg-5o; Fri, 26 Sep 2025 06:37:40 +0000
Received: by outflank-mailman (input) for mailman id 1131037;
 Fri, 26 Sep 2025 06:37:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=y8gL=4F=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1v225K-0004Ta-HB
 for xen-devel@lists.xenproject.org; Fri, 26 Sep 2025 06:37:38 +0000
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [2a00:1450:4864:20::529])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4a622c5f-9aa3-11f0-9d14-b5c5bf9af7f9;
 Fri, 26 Sep 2025 08:37:36 +0200 (CEST)
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-63486ff378cso4027407a12.0
 for <xen-devel@lists.xenproject.org>; Thu, 25 Sep 2025 23:37:36 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b353f87511dsm315579466b.43.2025.09.25.23.37.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 25 Sep 2025 23:37:35 -0700 (PDT)
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
X-Inumbo-ID: 4a622c5f-9aa3-11f0-9d14-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1758868656; x=1759473456; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=bis+KU+KA0PLLk4iULkzRwvbb9QPLHDV6ubN40wZ3+M=;
        b=J4aRVX5JZ9v6G5o39qk+vyqUzuHyUQ/CHMO5eWStLi46fory7jnQJ0o7QpzC2jbblJ
         VKk0OHh0oZ1TJ4B+vpQsWDvYpq5376EyJcdRYAoiSivdcw6tgUpXrU1PF0DlB+jlSaMI
         knJlWRtPHPNPiVbmxC1C8ByQxbTIoN8DbAuX0MWwxw1NhHDy28AlHq2OBMd5uOL4CKkU
         p/AH1XosM0DOgGGi/6REiINnG8ti7M+4X7xfnHyK4G7hK8/3H05ux5MozrWg+f+alI29
         ydfFnvtg9hrzvRoEAV2iZbEBpwlXH0PFcuW84egLPF8RKOVHofBpFk3ytbh8ebrVaet0
         YK1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758868656; x=1759473456;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bis+KU+KA0PLLk4iULkzRwvbb9QPLHDV6ubN40wZ3+M=;
        b=CWHyMTeS5MhKnEqTP7YVhOtyMGvZeRQisbxX7f8o7divGCPJfJjW+e9HeoC8TWX20d
         SeNHUt2ONhkdqQxuNLC46oYMQDPlF6rw0O2SKlpZCJww0rvaTRMDIkYITBmV79s4OX/t
         yB69sXzvmf+Kn8TrFhQdt5BK1UotE5YKdW1Mw/LOhhplEnWcwehcKEnGGxpyQUX+hXFe
         BkVms8mSzDH75BdIVkH2Pz2rh5tUQsngP0OP7hoW+XkIEwFUD4mru+zOFWzxdbKLQU+7
         XqV281BGX+ScXTnCMasabrbsLLwp/JERwpDlNPAkGtU4fmlroC0CtwWXx7Z8AMMTZAy6
         hbKw==
X-Forwarded-Encrypted: i=1; AJvYcCVLP7RrYJZi2WS7g0zleqZmGfl5UA30ugqrHqPaucFj0prq+5sSgGpa2rQcrtZiE4oCoHWMl8+E1j4=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyPeLahE1RnHQ3n6bsCISedxWlnINvKm0PqGgZkTagOqgdbbhpf
	qtHWiEzeJk+ZQAH6lufmQXlrZXjE7rAh5W8e6uQdhJiBlxecuALuCMJ5yw0UBQ6seg==
X-Gm-Gg: ASbGncud7GDxWkGFdTjd0BoYKItNd1pi0JALh83N8kiJQi3mQsTDHaRvZUM/OgvxbZT
	XO7njiN3Sl0D56ZTxIMwn77j8JFMgOuufYnBgpUsz8ZjfuU8bP6oPVUSN+PSjzIlTgqyAxphkkX
	IOyXSZfBXY1BT+u5pHUCO3Wd6zPpu7vBy3qToTYVGb34ay6Yv4Z3Rh14yOj1gfszeuqrb7z1ANu
	4iK+0HaPIu3bzPL3Rs2x/kRy3DntLIArsH3sKIasLRUlA1b3pANPPtXFtaexfRKea3Y7MJS34Pz
	udkRnSlI7UKwIpXw/ZWwabUIek8oNeZKzY9YpiRXZwZUfXkL5I3x4PHjoKPXXHBeK13OVKNrP8r
	JKdTbCESkNNTjIyRXBQnE8lkYccpu65eKdU/ZxslWCQYLKenPEOd/EJcmLc6FivpC/2dup44swl
	p35ovX5NY=
X-Google-Smtp-Source: AGHT+IGm9fNyKC8AyW7U7CGWYJkV5quAiBqaelRy7qa8Qn4MRuHwxl2D7JNf6BzieBnlO/NuDtW7Nw==
X-Received: by 2002:a17:907:1c16:b0:b0b:5d7f:6ae4 with SMTP id a640c23a62f3a-b35490f2f27mr516485166b.8.1758868656253;
        Thu, 25 Sep 2025 23:37:36 -0700 (PDT)
Message-ID: <9cf8925c-87c6-44ec-9d46-f8b0ed30f94a@suse.com>
Date: Fri, 26 Sep 2025 08:37:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN][PATCH] x86/hvm: mem_sharing: add dependency from
 CONFIG_INTEL_VMX
To: Grygorii Strashko <grygorii_strashko@epam.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Alejandro Vallejo <alejandro.garciavallejo@amd.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Tamas K Lengyel <tamas@tklengyel.com>
References: <20250925195607.521021-1-grygorii_strashko@epam.com>
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
In-Reply-To: <20250925195607.521021-1-grygorii_strashko@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 25.09.2025 21:56, Grygorii Strashko wrote:
> From: Grygorii Strashko <grygorii_strashko@epam.com>
> 
> According to the commit b66e28226dd9 ("x86/mem_sharing: gate enabling on
> cpu_has_vmx") the Xen memory sharing support is only possible on platforms
> with "Intel VT-x" (INTEL_VMX=y) enabled.
> The same commit is also added runtime check for "cpu_has_vmx" in
> mem_sharing_control() which blocks access to XENMEM_sharing_ops if
> !cpu_has_vmx.
> 
> Hence add dependency from INTEL_VMX for MEM_SHARING Kconfig option.
> 
> Signed-off-by: Grygorii Strashko <grygorii_strashko@epam.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>

You should have Cc-ed Tamas, for being the maintainer of mem-sharing.

> --- a/xen/arch/x86/hvm/Kconfig
> +++ b/xen/arch/x86/hvm/Kconfig
> @@ -79,5 +79,6 @@ config MEM_PAGING
>  
>  config MEM_SHARING
>  	bool "Xen memory sharing support (UNSUPPORTED)" if UNSUPPORTED
> +	depends on INTEL_VMX
>  
>  endif

Wouldn't this want accompanying by replacing the cpu_has_vmx in
mem_sharing_control() with using_vmx()? The gain in this case may not
be very high, but it would serve a doc purpose.

Jan

