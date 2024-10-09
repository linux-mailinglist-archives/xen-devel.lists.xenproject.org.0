Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 36C10996FB8
	for <lists+xen-devel@lfdr.de>; Wed,  9 Oct 2024 17:29:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.814821.1228501 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1syYcg-0008Jp-PQ; Wed, 09 Oct 2024 15:29:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 814821.1228501; Wed, 09 Oct 2024 15:29:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1syYcg-0008HK-MO; Wed, 09 Oct 2024 15:29:10 +0000
Received: by outflank-mailman (input) for mailman id 814821;
 Wed, 09 Oct 2024 15:29:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Z5PZ=RF=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1syYcg-0008HD-0D
 for xen-devel@lists.xenproject.org; Wed, 09 Oct 2024 15:29:10 +0000
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [2a00:1450:4864:20::62b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 398cc6d1-8653-11ef-99a2-01e77a169b0f;
 Wed, 09 Oct 2024 17:29:07 +0200 (CEST)
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-a99422c796eso645470766b.3
 for <xen-devel@lists.xenproject.org>; Wed, 09 Oct 2024 08:29:07 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a993fd777e6sm594972366b.79.2024.10.09.08.29.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Oct 2024 08:29:07 -0700 (PDT)
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
X-Inumbo-ID: 398cc6d1-8653-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1728487747; x=1729092547; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=NmzrO7/HAycTbd8bjMoywdwrbvb0vnQJtFqwLo1St7E=;
        b=Ijo/ckodb8/eOZ6QEzXV+WHhXgn6pvyXXk5CMf8LOV7CHIfjHJRu1+Q3JGxel/4xwl
         pKct0SD8x8CxyiP9BE2bx0uDoqkkIbP9JM0V/gvv+9SAGJ3qY/XizTrvD7Il4O5aIES5
         e+apRtT8DoYIT5vEyDiG0rOKjvlfH5iF/cQb1GynbtW9FpGJPPY8eOCWjmQIul1es33l
         2Vn7nFRXxsm2yN/EF58ixdnHRNgrHKa1e7vwQGMFOVSasbVjn6H6YiXHkgtANh8tPeHA
         XGpv+ZHDLJ5expTstapCB5JITFbkHdgQLlq5f72S70aoIR/p5cxvOl/PUTORCeYCwGcH
         t21g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728487747; x=1729092547;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NmzrO7/HAycTbd8bjMoywdwrbvb0vnQJtFqwLo1St7E=;
        b=cI8CcqkBsn99MTi49eXpjAIUKEG6klEt2nrn+2PDid1GETHkhYdQYNlLmW9xaF2rcN
         HarowVsCdXyouoG6fQpVgH+OkSAe3seiAdDJNKKWw1e/q9H0lTFhUol7N+pv11gffDm6
         P5yhSSufSzLnLYDr2dQJ6ibNfQxT45erNTi6RZAHowVrYgRFSqioMQxToG9C+9LAMKpH
         6sd8yl89m/4JkbUxojlRXPW0ZLSYiewaz6N7dLlKw2jIP/mAaij50/b1UKa0K91x/TIW
         R30oydvzeOOKkBW+ylsWHn92zZqEi2eJGsw8VL8HeskMwUp1uANkJhTBxN1v7KDneuz0
         yOFQ==
X-Forwarded-Encrypted: i=1; AJvYcCXf1bzv3XNluhtsGbdl9TF0Xpp1YbrIz05DARSf9kqHCjM73z2zdv4SDe8tCIhN0WZYT5yPLBsVy3o=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzZNv/6BNacqvCx16gJqSFGQG8zywgWmCeFLG8F/bpOWwBMN41Y
	sFQ8FrKxqODP9vxAmzDgkNPch/X6lidcwxrAmCzG2B6DxQZbmhgborfYztcd/A==
X-Google-Smtp-Source: AGHT+IExmvykAiH6Eonqdo8JCDuhVAp+GS0+Sz5wdP6VGp0GXNrXi78tJ3Y+dRrBusUmTa1YuaojHQ==
X-Received: by 2002:a17:906:6a05:b0:a8d:439d:5c44 with SMTP id a640c23a62f3a-a999e628a9fmr58401166b.1.1728487747380;
        Wed, 09 Oct 2024 08:29:07 -0700 (PDT)
Message-ID: <c0b97711-6bf2-476c-a2f7-7f4dc075d2aa@suse.com>
Date: Wed, 9 Oct 2024 17:29:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 08/44] x86/boot: convert setup.c mod refs to early_mod
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>
Cc: jason.andryuk@amd.com, christopher.w.clark@gmail.com,
 stefano.stabellini@amd.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20241006214956.24339-1-dpsmith@apertussolutions.com>
 <20241006214956.24339-9-dpsmith@apertussolutions.com>
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
In-Reply-To: <20241006214956.24339-9-dpsmith@apertussolutions.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 06.10.2024 23:49, Daniel P. Smith wrote:
> @@ -2061,8 +2067,9 @@ void asmlinkage __init noreturn __start_xen(unsigned long mbi_p)
>       * We're going to setup domain0 using the module(s) that we stashed safely
>       * above our heap. The second module, if present, is an initrd ramdisk.
>       */
> -    dom0 = create_dom0(mod, bi->mods[0].headroom,
> -                       initrdidx < bi->nr_modules ? mod + initrdidx : NULL,
> +    dom0 = create_dom0(bi->mods[0].mod, bi->mods[0].headroom,
> +                       initrdidx < bi->nr_modules ?
> +                            bi->mods[initrdidx].mod : NULL,

See an earlier comment regarding wrapped ?:. We certainly never have
indentation levels of 5 blanks.

Jan

