Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3677B81365F
	for <lists+xen-devel@lfdr.de>; Thu, 14 Dec 2023 17:36:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.654699.1021916 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rDohI-0002MR-EX; Thu, 14 Dec 2023 16:36:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 654699.1021916; Thu, 14 Dec 2023 16:36:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rDohI-0002KD-AH; Thu, 14 Dec 2023 16:36:28 +0000
Received: by outflank-mailman (input) for mailman id 654699;
 Thu, 14 Dec 2023 16:36:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xmUX=HZ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rDohH-0002BF-48
 for xen-devel@lists.xenproject.org; Thu, 14 Dec 2023 16:36:27 +0000
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [2a00:1450:4864:20::229])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ec4041b2-9a9e-11ee-9b0f-b553b5be7939;
 Thu, 14 Dec 2023 17:36:25 +0100 (CET)
Received: by mail-lj1-x229.google.com with SMTP id
 38308e7fff4ca-2c9f9db9567so95731091fa.3
 for <xen-devel@lists.xenproject.org>; Thu, 14 Dec 2023 08:36:25 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 h7-20020a170906530700b00a1b32663d7csm9633429ejo.102.2023.12.14.08.36.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Dec 2023 08:36:24 -0800 (PST)
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
X-Inumbo-ID: ec4041b2-9a9e-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1702571785; x=1703176585; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PRKu0czlNBsLFVH3CVysVNF65A67HErZmHe2IEwwcq0=;
        b=HE/+liaQdVakosfchhj01V2R7rnCq/JlN46V2pJPu/v5BFPUIhQyjAa/yx7fuPXIe9
         hhT4lc5094c0/PsQR9cRIqhrAF6ulnpyHTQ8kTxqGohIqVvycBfd/YEZimg8jfaeVr6N
         6oTtqoq9pDsGIloWaiRVLok6kxs7QxBrzEN+e01uclDZZrZYBuD6SZijxHRb6IvOY3Oc
         jNpavN62sX5Y6Q5sl4TB6LirX/42eSRYMqH855mBGTkrD26bJYloJpHmxKygf2Mbwle6
         B31Y0q29dyOA3Mzs9xo2ZxmhzweVY9UoLUm+M0x4mBcIvSDLMTyBMHDu/zE6QDC16rit
         ySmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702571785; x=1703176585;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PRKu0czlNBsLFVH3CVysVNF65A67HErZmHe2IEwwcq0=;
        b=i06pJ3q8qS/1fPrGZNxbEwsJ1G8wKzwW6S8rxx1lbLMWQ6jrQDO3JpcJdSTWuwTiB/
         YXX01tvnTEw0MzLsqI3VGR1f/cBz31mTwYJhVrCdGQfAu83BPbjzkWIXSNxVNplgcmct
         5IQ98AjsQ5W1sGWmJ/c3oCrHaVYK8UOgvboCoaYW0SHhAxoiljxVkS5PuOIHBskmgVKc
         INUHbQbEO1i4Eo8tFFPlBxCdeDn5D29OBo/V6yrezY3NmJlK11mfKK8aGMausrIqlzVq
         jfpqhg5OfjROGcqIn/AoQg4SMjibMeKXOMR+gCNo0Lhj6MgtPz3eSuPWS1SxfYw8hkQr
         6jXQ==
X-Gm-Message-State: AOJu0YyjyEam8p2xbHmBFi8nJ0CqX2GNQeVY0uCT4c4IDamwL2fM7HB/
	9OjrluqV8JupSLmVXLpxB5jOwcLeDZQ3O7p3UdWz
X-Google-Smtp-Source: AGHT+IGB8phFJ0MvtA+chBVuEXVM9gfwZrbVmb+F1F5S+rz4gSJA0ZZD9nI6C2AhNbzvoHZI9N/vDQ==
X-Received: by 2002:a05:6512:2388:b0:50b:dec0:8d0b with SMTP id c8-20020a056512238800b0050bdec08d0bmr5991595lfv.85.1702571784940;
        Thu, 14 Dec 2023 08:36:24 -0800 (PST)
Message-ID: <a9b5e527-b2a8-4edb-8285-77e6be0152e3@suse.com>
Date: Thu, 14 Dec 2023 17:36:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/9] ACPI: address violations of MISRA C:2012 Rule 11.8
Content-Language: en-US
To: Simone Ballarin <simone.ballarin@bugseng.com>
Cc: consulting@bugseng.com,
 Maria Celeste Cesario <maria.celeste.cesario@bugseng.com>,
 xen-devel@lists.xenproject.org
References: <cover.1702555386.git.maria.celeste.cesario@bugseng.com>
 <44c8f94bcfe4f0e33e53a7eb8aef826e7d906196.1702555387.git.maria.celeste.cesario@bugseng.com>
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
In-Reply-To: <44c8f94bcfe4f0e33e53a7eb8aef826e7d906196.1702555387.git.maria.celeste.cesario@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 14.12.2023 13:07, Simone Ballarin wrote:
> --- a/xen/include/acpi/acmacros.h
> +++ b/xen/include/acpi/acmacros.h
> @@ -116,7 +116,7 @@
>  #define ACPI_PTR_TO_PHYSADDR(i)         ACPI_TO_INTEGER(i)
>  
>  #ifndef ACPI_MISALIGNMENT_NOT_SUPPORTED
> -#define ACPI_COMPARE_NAME(a,b)          (*ACPI_CAST_PTR (u32,(a)) == *ACPI_CAST_PTR (u32,(b)))
> +#define ACPI_COMPARE_NAME(a,b)          (*ACPI_CAST_PTR (const u32,(a)) == *ACPI_CAST_PTR (const u32,(b)))

Hmm, I'm a little hesitant to take changes to this header. We've
inherited it from Linux, who in turn inherited / imported it from
ACPI CA.

>  #else
>  #define ACPI_COMPARE_NAME(a,b)          (!ACPI_STRNCMP (ACPI_CAST_PTR (char,(a)), ACPI_CAST_PTR (char,(b)), ACPI_NAME_SIZE))
>  #endif

What about this alternative code, btw?

Jan

