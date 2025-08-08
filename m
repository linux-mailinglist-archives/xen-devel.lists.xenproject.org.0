Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 92DB4B1E51B
	for <lists+xen-devel@lfdr.de>; Fri,  8 Aug 2025 10:58:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1074156.1436836 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ukIvQ-0002Na-Ov; Fri, 08 Aug 2025 08:58:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1074156.1436836; Fri, 08 Aug 2025 08:58:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ukIvQ-0002Kb-Lt; Fri, 08 Aug 2025 08:58:08 +0000
Received: by outflank-mailman (input) for mailman id 1074156;
 Fri, 08 Aug 2025 08:58:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=illN=2U=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ukIvP-0002KV-EY
 for xen-devel@lists.xenproject.org; Fri, 08 Aug 2025 08:58:07 +0000
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [2a00:1450:4864:20::535])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cbddb32c-7435-11f0-b898-0df219b8e170;
 Fri, 08 Aug 2025 10:58:05 +0200 (CEST)
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-60bfcada295so3125918a12.1
 for <xen-devel@lists.xenproject.org>; Fri, 08 Aug 2025 01:58:05 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-617c843c48fsm2220856a12.10.2025.08.08.01.58.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 08 Aug 2025 01:58:04 -0700 (PDT)
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
X-Inumbo-ID: cbddb32c-7435-11f0-b898-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1754643484; x=1755248284; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=b3Xrb/kMCbbPdbyyPoWEKuJ48aiOOWYFah5ZkKo8rjQ=;
        b=LGy0IeaP0z5azPiiyHImOY2wn8pLvwJp4gDSo3NQA5pnRm0X+kd9UJbsUDHzc3d9TH
         Nq0+19zL3wXlHX8sdKbyzkbJFG7kL8rZF1bY8K0Si6+xiyw3HLC4HmTr0KM0Lj9pvndn
         Dc0BPQXFwWWZiqUzoLNdnvd/R14yHkyBqK0dPAk4iikLVlV5R+Gn8FZfoQqIyyckoOOc
         drM5mpDflnRUmCjXZwyPuvM4JyJWTr7gRL1UPeaYo23wApLnVghNGygO0ZfWe8I5FXkG
         TzCgP7nAkldqwSXsNd7mWxJgoT4o2TKqfrahDvtr8yKvqdi9goHHTonBB5V/lJDzzX/1
         Pwtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754643485; x=1755248285;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b3Xrb/kMCbbPdbyyPoWEKuJ48aiOOWYFah5ZkKo8rjQ=;
        b=AcNGfl97uxZIfBRrL1TikYL1HVReBkwwiskFWJklQOozo3smUSy5KyBIOHgikqeDcf
         AtTENyQMPxVbU4qsHemdV2/RQJDKVLj2iMstqQkdKAt9Iu8NH+6Cp08Dx6aPuZXH5U3L
         xNREl3u6kPjeIcIOD7WtTyDYdJvMHM2RlYvp0dYLddMJftWibsZJJSt4VHhCmSvXNPdZ
         D4bTOQuWJyWMTbGlGf0G40FmKWz2vM2FkSAcdgGvQIHTp5uwQDqbrnxp3uM8UtqnMxC3
         qq3rwuoRQ1jargaXceCRjKkzWmDUpvZmVnj5NAL9nOEjLAugabY9A0uVTSjl4dc8qXAT
         pPWQ==
X-Forwarded-Encrypted: i=1; AJvYcCXw+oyO+zBZQqZbq3XTR+mOA+DDGzBaILwuOjjQrJEvx1VTMwCU0c7jW8hxY+ciVy4dWPLFCEXF1Xk=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy/oUUe9A6GYKh/5A00tzkmKrp2qzWMEddEzRkh0e7CbQK7syp1
	raKEF41B/ZDu24hvq9sdxTBnhLDoieAmw+Tgx9KuOfzO70JTM0FNftm/nsHGuLlWGw==
X-Gm-Gg: ASbGncsB+EcAEKBHUIad1wOQCelkUT3bguJEIKxAUJL/B4Ky/Y37fs3OxGeGA7b6Inx
	+newK6cwCLh/FxyvvQhhes0QaUZcHAPmi3L5ed4I6SqqTLoN+ojC4sxusIf7KIEW8zKceNdQdsI
	gXkZS1MvVdVZnKrSejBqBXBa5jtZCRt6jHYhsBACZ6zJMISJdPzcC6uDGvdPqm8sUJVh3UknXqu
	psLqTZpmk9h8iQRw+pFTclW+cXiGtU8fqvOu2wdydvBCwCHo9AboqOOwYFuguv2/vGhVPLJ+y/O
	ZDamOmJrbSNibtfmpztbbnmy7Y7kRrgKvKoWdlJGuG4F9OfMBY6yINzhc0ljkOv7jxH17YZuKbG
	dIVa170sptHIdIDsIGGHxcEb4Edkg3hqdaWbXPC6cF5YLf4Yiwm+8m+qXhfjzpQX9V6DV6tpLHG
	SMabdwKrI=
X-Google-Smtp-Source: AGHT+IHBQ6PXQ6mldcVCCjJququGjw1l4crXtly8IPfMEivMZhgLpqk9YVhHI5wg2CFgx8+UqSiVgA==
X-Received: by 2002:a05:6402:1ec4:b0:615:9b4e:7b81 with SMTP id 4fb4d7f45d1cf-617e2b8bf98mr1752673a12.7.1754643484550;
        Fri, 08 Aug 2025 01:58:04 -0700 (PDT)
Message-ID: <31f9800f-5d2a-4614-9850-07d6bbe232d8@suse.com>
Date: Fri, 8 Aug 2025 10:58:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 1/5] vpci: Use cleanup to free capability resource
 during deassign
To: Jiqian Chen <Jiqian.Chen@amd.com>
Cc: Huang Rui <ray.huang@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
References: <20250808080337.28609-1-Jiqian.Chen@amd.com>
 <20250808080337.28609-2-Jiqian.Chen@amd.com>
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
In-Reply-To: <20250808080337.28609-2-Jiqian.Chen@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 08.08.2025 10:03, Jiqian Chen wrote:
> @@ -321,6 +321,29 @@ void vpci_deassign_device(struct pci_dev *pdev)
>                      &pdev->domain->vpci_dev_assigned_map);
>  #endif
>  
> +    for ( i = 0; i < NUM_VPCI_INIT; i++ )
> +    {
> +        const vpci_capability_t *capability = &__start_vpci_array[i];
> +        const unsigned int cap = capability->id;
> +        unsigned int pos = 0;
> +
> +        if ( !capability->cleanup )
> +            continue;
> +
> +        if ( !capability->is_ext )
> +            pos = pci_find_cap_offset(pdev->sbdf, cap);
> +        else if ( is_hardware_domain(pdev->domain) )
> +            pos = pci_find_ext_capability(pdev->sbdf, cap);
> +        if ( pos )
> +        {
> +            int rc = capability->cleanup(pdev, false);
> +            if ( rc )

Nit: Blank line between declaration(s) and statement(s) please. (Likely
easy enough to adjust while committing, if no other need for a v12
arises.)

Jan

