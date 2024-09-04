Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A26996B1B5
	for <lists+xen-devel@lfdr.de>; Wed,  4 Sep 2024 08:33:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.789801.1199452 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sljZx-0007xj-NI; Wed, 04 Sep 2024 06:33:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 789801.1199452; Wed, 04 Sep 2024 06:33:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sljZx-0007w3-KT; Wed, 04 Sep 2024 06:33:21 +0000
Received: by outflank-mailman (input) for mailman id 789801;
 Wed, 04 Sep 2024 06:33:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=uxYG=QC=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sljZw-0007vq-VO
 for xen-devel@lists.xenproject.org; Wed, 04 Sep 2024 06:33:20 +0000
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [2a00:1450:4864:20::52f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9320bf89-6a87-11ef-99a1-01e77a169b0f;
 Wed, 04 Sep 2024 08:33:19 +0200 (CEST)
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-5c25dd38824so675178a12.0
 for <xen-devel@lists.xenproject.org>; Tue, 03 Sep 2024 23:33:19 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c226c6ab6asm7227313a12.10.2024.09.03.23.33.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 Sep 2024 23:33:18 -0700 (PDT)
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
X-Inumbo-ID: 9320bf89-6a87-11ef-99a1-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1725431599; x=1726036399; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=AcswbBCRmocxIN9EqOib/F236MuuXivBijwGkPgv85U=;
        b=XcnukUz21mP0hTcih79khwv8M72Nm+mnn86Q52OJk44qs+tPv6+ZYgT8KvnKmNufJM
         c+toemifenwkr1jMsFnvNZfeyuoEYPnbDExJS63jUK6seHm1m7Qza/3ZD20zva6+3v3n
         dKkIHUncVVL8YEh9N5EGzcOyb3SY+ezkug+DTn1mmQ+jPZIJG8MsPKDHoDLlY1hm/j+c
         exG0RAbHWu/2pHomzWKXv5OELeYSX7FstruUd6hZK6fRBPnAbvTdyRirrc2i7bc+HhOI
         lXlE341S+qgYs5OjxxNaXObrqzGuBADTI9qnQss4o0f84VMBpWc1+nDa2UtFPvN/YBtX
         SFAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725431599; x=1726036399;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AcswbBCRmocxIN9EqOib/F236MuuXivBijwGkPgv85U=;
        b=X0L/wsY9VEcJaD5ZFIrpoLfkPPQMImx20fYOuN0DiPySDP828IWj1O+RrCSmQCoeD0
         k843E87oeVL7cv0vxbeFM7cmXUHB2BFerRH82B0MWlDaRU03vEXGD87njtCoAYHyTtW0
         0lxUJeLtTYMd4bQHmQoMmJbGYbe9BWS9tZepjRIxnxvWit2Bce4+rYUPzd9PfpcKyk8R
         QUdsqmLPdDxWWo6d3CX1NvEzbwcfE3n411IjsljIrFlLryRNIkRonl0iesgaBIzMTfpI
         zqHqo9ENajfCcXBuZ8eDKQONVYHWa5utGocJA60l9huD1pKDqK29opwKU1n4R5GoWoZH
         qswg==
X-Forwarded-Encrypted: i=1; AJvYcCV87BmwRnOMurEW890OaulAIotafN3hTfW8A6+1hVskBehME38J/crF7Y4EbAMtTNvg/g1nXtOV5i0=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxIubB0Id/6ByZT4BNNQuEXeqx4TkkQ4w457QD8aSCJym7f0ua1
	CTwZnLk8JtW0/gDAmWdmZJaYhpJUTzdbqrHlunTumJd7Wn+A7cpVjO+ttZBiwg==
X-Google-Smtp-Source: AGHT+IECBYw+iGlu3kMy9h+8j+Z3YYhFWMNyzXE/J6wPoa99Yz3P3mSLdYeyRJk9d/vgDuDS7/bkmQ==
X-Received: by 2002:a05:6402:34c9:b0:5c2:18d2:762a with SMTP id 4fb4d7f45d1cf-5c3c1f7b9acmr970304a12.8.1725431598797;
        Tue, 03 Sep 2024 23:33:18 -0700 (PDT)
Message-ID: <ac41cfe3-5ad2-4a6f-8e3d-973021923ec3@suse.com>
Date: Wed, 4 Sep 2024 08:33:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 05/44] x86/boot: introduce struct boot_module
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>
Cc: jason.andryuk@amd.com, christopher.w.clark@gmail.com,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20240830214730.1621-1-dpsmith@apertussolutions.com>
 <20240830214730.1621-6-dpsmith@apertussolutions.com>
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
In-Reply-To: <20240830214730.1621-6-dpsmith@apertussolutions.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 30.08.2024 23:46, Daniel P. Smith wrote:
> @@ -303,6 +308,14 @@ static void __init multiboot_to_bootinfo(multiboot_info_t *mbi)
>          info.mmap_length = mbi->mmap_length;
>      }
>  
> +    info.mods = boot_mods;
> +
> +    for ( i=0; i < info.nr_mods; i++ )
> +        boot_mods[i].early_mod = &mods[i];
> +
> +    /* map the last mb module for xen entry */

Nit: Comment style.

Jan

