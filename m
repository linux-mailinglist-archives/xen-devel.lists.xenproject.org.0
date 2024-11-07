Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6250C9C0207
	for <lists+xen-devel@lfdr.de>; Thu,  7 Nov 2024 11:14:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.831628.1246964 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t8zXB-0000mU-6n; Thu, 07 Nov 2024 10:14:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 831628.1246964; Thu, 07 Nov 2024 10:14:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t8zXB-0000kG-46; Thu, 07 Nov 2024 10:14:37 +0000
Received: by outflank-mailman (input) for mailman id 831628;
 Thu, 07 Nov 2024 10:14:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=aElt=SC=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1t8zXA-0000kA-GX
 for xen-devel@lists.xenproject.org; Thu, 07 Nov 2024 10:14:36 +0000
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [2a00:1450:4864:20::136])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 15315923-9cf1-11ef-99a3-01e77a169b0f;
 Thu, 07 Nov 2024 11:14:32 +0100 (CET)
Received: by mail-lf1-x136.google.com with SMTP id
 2adb3069b0e04-539f1292a9bso737517e87.2
 for <xen-devel@lists.xenproject.org>; Thu, 07 Nov 2024 02:14:32 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-432aa74abb9sm55253975e9.42.2024.11.07.02.14.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 07 Nov 2024 02:14:31 -0800 (PST)
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
X-Inumbo-ID: 15315923-9cf1-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjoxMzYiLCJoZWxvIjoibWFpbC1sZjEteDEzNi5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjE1MzE1OTIzLTljZjEtMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMwOTc0NDcyLjk2MjIxNywic2VuZGVyIjoiamJldWxpY2hAc3VzZS5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1730974472; x=1731579272; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=f983S6h+HLmFUr9DZLpXfuoLLvROS9LPfZi1mCx7uok=;
        b=UT8UwxiQd4iRSrhzxcvUW+8plN3+OZRyD5RU4G1DRdEeQssdErOASGx6wrYS0Tv+t8
         xiVBC+OFzRNaKAYFF1JZ++8NimVlXtmDYWo9i26UWW6JunCMl7DJcYvvEJAnFpRMbIpT
         wdADVatX50unkZ9vl2SO6yB5a/GGp2a3l+mO20A9ZmJUzF2YOz9uqIGWc8LQicJTKwcp
         oXTBGWGo7L2mKJZ5R7yzV4oTxxpjscX4oP+LjUyEQHtAElk3NNpx33Z+KGFOzcmL9xOf
         6tOjOlr7pJ63zkkQl4r5TVFCR+muS36DJ9HckqcdxdvwfDTHcUtwm8dC1OdfXWksKTgV
         wtaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730974472; x=1731579272;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f983S6h+HLmFUr9DZLpXfuoLLvROS9LPfZi1mCx7uok=;
        b=axx8wf2yvNQ8l4zdFWzKwp3qRLkeIdXzLkv/eV8ZXiTRex0vGU1LQ/RgpdwyjKSSBm
         V9ITu5pmSJWDxZ/6QRH2WWi0pXPOThwF8JMq51BblJSkOqk5/8l9ZDXhh9b5jANvIrjd
         Bp6x4qfEyatW6dQySpsuOEOYq8AvBLe8g4A+L2g0Q7yQSgXHFfBhtfLyrN8a0oWDuPWX
         Dbt8ObKB0rTeDRSOeAsVaLjgFA6BkdD8mCxyPzrtIuBjbdqq6gR4lAeqm4qqxpez5+8Q
         vlBTJpaUNY4suSp9YOwTnlHuGdmtSdg03duZP6fApHOb2EjHLzHIfBdvRiDS6AXFWhnA
         ZQDQ==
X-Forwarded-Encrypted: i=1; AJvYcCXKMYpwDmz0AoW3TNUin1aNc9ozSUq+lnlys22+xfsp2fd6ztHV3cujI/yUJFUJ5JASdecUphBBN/4=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxtckcweTdWtSIgDnr90EdujsLKD5xiDFaoj8oNJH1oEOBEP8s/
	+ye/j1yCz3a6pigWluEfJ890yPMx5NQONfOo6Y+8sMZpo2Sd6JpXyE7qGEjENw==
X-Google-Smtp-Source: AGHT+IFkKSBIIL6CrMu6ju0PzK9lGwabCBIcAuOFOW80toORbP63zXFX6sp8ZnemM8wRHK/Iz7M0JA==
X-Received: by 2002:a05:6512:3b2b:b0:52e:f99e:5dd1 with SMTP id 2adb3069b0e04-53b3491cd1emr22061015e87.47.1730974472290;
        Thu, 07 Nov 2024 02:14:32 -0800 (PST)
Message-ID: <f6f439cb-4d89-48d5-98c4-83e3761ea59d@suse.com>
Date: Thu, 7 Nov 2024 11:14:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] x86/ucode: Enforce invariant about module
 selection
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: "Daniel P . Smith" <dpsmith@apertussolutions.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20241106003938.3453243-1-andrew.cooper3@citrix.com>
 <20241106003938.3453243-2-andrew.cooper3@citrix.com>
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
In-Reply-To: <20241106003938.3453243-2-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 06.11.2024 01:39, Andrew Cooper wrote:
> The work to add the `ucode=nmi` cmdline option left a subtle corner case.
> Both scan and an explicit index could be chosen, and we could really find both
> a CPIO archive and a microcode file.
> 
> Worse, because the if/else chains for processing ucode_{blob,mod} are opposite
> ways around in early_microcode_load() and microcode_init_cache(), we can
> genuinely perform early microcode loading from the CPIO archive, then cache
> from the explicit file.
> 
> Therefore, enforce that only one selection method can be active.

While, following my v1 comment on this, I'm okay with it staying like this,
I'm afraid ...

> @@ -109,13 +103,28 @@ static bool ucode_in_nmi = true;
>  /* Protected by microcode_mutex */
>  static const struct microcode_patch *microcode_cache;
>  
> +/*
> + * opt_mod_idx and opt_scan have subtle semantics.
> + *
> + * The cmdline can either identify a module by number (inc -ve back-reference)
> + * containing a raw microcode container, or select scan which instructs Xen to
> + * search all modules for an uncompressed CPIO archive containing a file with
> + * a vendor-dependent name.
> + *
> + * These options do not make sense when combined, so for the benefit of module
> + * location we require that they are not both active together.
> + */

... "do not make sense" is still wrong here. As per your subsequent v1 reply
to my comments, it is merely the case that we do not assign any meaning to
that combination. Yet as outlined we could. With the wording tweaked
accordingly:
Reviewed-by: Jan Beulich <jbeulich@suse.com>

Jan

