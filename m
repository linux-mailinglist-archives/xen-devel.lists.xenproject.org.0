Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2081C89BB0F
	for <lists+xen-devel@lfdr.de>; Mon,  8 Apr 2024 10:59:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.701848.1096380 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rtkpy-0001uW-RN; Mon, 08 Apr 2024 08:58:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 701848.1096380; Mon, 08 Apr 2024 08:58:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rtkpy-0001sy-Od; Mon, 08 Apr 2024 08:58:46 +0000
Received: by outflank-mailman (input) for mailman id 701848;
 Mon, 08 Apr 2024 08:58:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=WYQ4=LN=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rtkpw-0001sr-KI
 for xen-devel@lists.xenproject.org; Mon, 08 Apr 2024 08:58:44 +0000
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [2a00:1450:4864:20::32b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 334fe4bb-f586-11ee-afe6-a90da7624cb6;
 Mon, 08 Apr 2024 10:58:43 +0200 (CEST)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-4164c9debf6so7286085e9.1
 for <xen-devel@lists.xenproject.org>; Mon, 08 Apr 2024 01:58:43 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 f14-20020a05600c154e00b0041552dbc539sm12671643wmg.11.2024.04.08.01.58.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Apr 2024 01:58:42 -0700 (PDT)
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
X-Inumbo-ID: 334fe4bb-f586-11ee-afe6-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1712566722; x=1713171522; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=j00kVXRkZ7xAIZEwz5G6LS4ZZ/M6YNOSxVJ7k0IMnuo=;
        b=gfOvMZNOc2FfjHUfUkFPRBss/iJfDRFt/G4uQp+4ogp7qHh2viPzA2XxpsOYTVJ17f
         5WeTc0rKAQQyK9jrrfi2eexKBKx/xH2P/LKPsx3xIsrkkLSAY0DuknaIlAngRBXW0Vzm
         xrEhs6HTxwILk3nj+49nKUMcAK1yxAqaIdfc6DxJNkkP6QFMDa5M4UjFfkQnRVpFXX+R
         h3Y4sblu47v6siEC2MxbneqkO3seb3WUCxOo9q7gJpYoYMSKyA1GN/JsYOEOt1YWjLT0
         JQkFCWjnVhEgjEJcX+UvEwikRnf2vTlu/KZfNzBzpbPZY+nlsA3UCADWMNkBPghXHw84
         S/8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712566722; x=1713171522;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=j00kVXRkZ7xAIZEwz5G6LS4ZZ/M6YNOSxVJ7k0IMnuo=;
        b=BWeJ/uCXdY/tyjMv1ivPtBQr89AN/c0uKlIEPg7ptybjIj/KJfxvt1OTgE7QGoIrzf
         EiWZ58ijtYcXxZxzvCVxY830HZZVW0GXr5Jh3PVGATfSjN8vmKY7GOaz8XcZ4c1Oqhcm
         oB4KhMkn4MLLcE+QTZc+pTNfSPz8DFFfugPnNtnEhyF5ui+/cAamYOaVGiPBfB8p94Uh
         4IqrV+PSsERI/ZZrlix8xEy79usJj/I9cVbr1w2tKNI+uyFto9/eQL8E6mpZt/nzx1sI
         sBEubiL98VNdf3j8qqXVp60gufs3HLHn2c8hKsaT32T9bX6jd7H/sRAnxP0fqAjQECYp
         XODg==
X-Forwarded-Encrypted: i=1; AJvYcCVQXouy/UAgjJSpAoEKkFsL7FYOoCedABe3OBk/xGWzKxizjfmscoS9+H1k1c3HDXAyitx21kTyuXzVCGPVRhZRwfua7uHoSb89B7ke4T4=
X-Gm-Message-State: AOJu0YwqaGozujlrxeuPVx5moLpynhq+23cQbddQ2eJMK0C2bLvZwCtE
	zaWKtERRo9YNbhPgqktG7y9H+D7pSr9dNksGYeF6eTWlyK//YvB1q8D5+O0U8g==
X-Google-Smtp-Source: AGHT+IFy/XstF97mJ2XaMREP3+l28UVRulhxJBzxQbSFblVvw4sNG3DDNNu9rS5HRv2JOuAtGjVmew==
X-Received: by 2002:a05:600c:4e93:b0:415:691c:f83d with SMTP id f19-20020a05600c4e9300b00415691cf83dmr5966356wmq.33.1712566722656;
        Mon, 08 Apr 2024 01:58:42 -0700 (PDT)
Message-ID: <d64da76d-e363-4ca5-bd01-5d6c82d833ef@suse.com>
Date: Mon, 8 Apr 2024 10:58:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/MCE: move intel mcheck init code to separate file
Content-Language: en-US
To: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
References: <20240404113828.2535191-1-Sergiy_Kibrik@epam.com>
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
In-Reply-To: <20240404113828.2535191-1-Sergiy_Kibrik@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 04.04.2024 13:38, Sergiy Kibrik wrote:
> Separate Intel nonfatal MCE initialization code from generic MCE code, the same
> way it is done for AMD code. This is to be able to later make intel/amd MCE
> code optional in the build.
> 
> Also clean up unused includes.
> 
> No functional change intended.
> 
> Signed-off-by: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
> ---
>  xen/arch/x86/cpu/mcheck/Makefile         |  1 +
>  xen/arch/x86/cpu/mcheck/intel_nonfatal.c | 83 ++++++++++++++++++++++++

Like elsewhere, can we please uses dashes in favor of underscores in new files'
names?

> --- /dev/null
> +++ b/xen/arch/x86/cpu/mcheck/intel_nonfatal.c
> @@ -0,0 +1,83 @@
> +/*
> + * Non Fatal Machine Check Exception Reporting
> + *
> + * (C) Copyright 2002 Dave Jones. <davej@codemonkey.org.uk>
> + *
> + * This file contains routines to check for non-fatal MCEs every 15s
> + *

Nit: This almost blank line wants dropping. Furthermore the whole file, no
longer having a direct Linux equivalent, imo wants converting to Xen code
style right for its introduction.

Jan

