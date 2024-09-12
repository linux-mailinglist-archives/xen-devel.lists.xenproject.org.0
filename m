Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DD1FD976BD5
	for <lists+xen-devel@lfdr.de>; Thu, 12 Sep 2024 16:20:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.797544.1207523 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sokgP-0006of-CN; Thu, 12 Sep 2024 14:20:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 797544.1207523; Thu, 12 Sep 2024 14:20:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sokgP-0006mc-8I; Thu, 12 Sep 2024 14:20:29 +0000
Received: by outflank-mailman (input) for mailman id 797544;
 Thu, 12 Sep 2024 14:20:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=dRhM=QK=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sokgN-0006mW-U1
 for xen-devel@lists.xenproject.org; Thu, 12 Sep 2024 14:20:27 +0000
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [2a00:1450:4864:20::334])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 27709fd2-7112-11ef-99a1-01e77a169b0f;
 Thu, 12 Sep 2024 16:20:25 +0200 (CEST)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-42cb1758e41so8531775e9.1
 for <xen-devel@lists.xenproject.org>; Thu, 12 Sep 2024 07:20:25 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42cb116f44esm167691905e9.45.2024.09.12.07.20.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Sep 2024 07:20:24 -0700 (PDT)
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
X-Inumbo-ID: 27709fd2-7112-11ef-99a1-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1726150825; x=1726755625; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=vgSUwi68sI4ZZ0EFj4Pt1EyRlo8OTzTPiLgT0ug3sRE=;
        b=BG8bm7ciVZJ4jEzYOPDOGHhzs0l4htbr6zQ2DeuFNiSpNW3SG6y64E/yjK2THGmrsA
         qxny5uD1UqhsRGRpzeyz5/Wfe9kqmbp9XTb1Wg0ZqgwZywJpl511HG+vWKMW3jeUWN1j
         ya/jbKsp7VBjzRiviOorpONL3HkezBLXXwFP/3S3XKloZjzVE33kq3jdq0fd3SQ4uuq8
         hPeTLkZ0oQYv6StXew7rZtJjdTLO1HWZ2ej4VCFaFR9GvJh/tcXS7z5f8+PRXX8O21/1
         mNEWunlE3dzY/UORyT97khex1x8jihSXjrtcGb5nCH7+H0fgjN1foD6a1ytT9zgDOHqb
         Z+rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726150825; x=1726755625;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vgSUwi68sI4ZZ0EFj4Pt1EyRlo8OTzTPiLgT0ug3sRE=;
        b=Qdx+ubmeeyO/nDFvuPowcNiN/ax1pecJIqRrn3FtAN4GJP3jrxepQI0LVdz+5c0vz1
         uKH6Wt++v7i2xvEGPQCdSAtTqau6qOTfUiLGF0Fmh1bncDur1HqK6Lo+/6M2z2M6cVKa
         n0mvZl4HPE5A2A7lWpfXIInphvlcbkhX1+op+3oRWYv+wpuXkC2SlLKoYR7iAvKat2JG
         B2rlsHbvnEeGdxiL60/lwwTzvMaQXvPTLwPgcz0FPYvc6ViDECYEzu25BId+zt7HU1hD
         wOF0spia0iArxBOBXYKNVdcpK9jJGiYGxxg0W7FBuKvxZ4ZIU2FQL/373MTqZidkNI2n
         o4bw==
X-Forwarded-Encrypted: i=1; AJvYcCXiI30Xb8mJvDQ1aFRoCji9HKSrSLvKyg03N9tw0eLSdOyg02LYTVxXGjxqrfZeh0fnbX7hgsEN2kE=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxuZXncORpww4qkcoaRc25mQDUHUfMqtUlXNYkIorNJMUh6eSG/
	ftNKgMtCqpXVj6GrucZfSSxQf2XqYkMG7F4k6PmV63Fvg3hcGsLZmkVnVij65g==
X-Google-Smtp-Source: AGHT+IFxB/IWKy1FB69h7DoDjK/jIRSCj2ZtJ5cUorZ0i6wBufwpo+X2+2Zn6HsVtcZDURMcJjs3Xw==
X-Received: by 2002:a05:600c:1c85:b0:429:a05:32fb with SMTP id 5b1f17b1804b1-42cdb5318femr22426705e9.10.1726150825109;
        Thu, 12 Sep 2024 07:20:25 -0700 (PDT)
Message-ID: <886dc591-e680-420a-a07f-ffd288ec413c@suse.com>
Date: Thu, 12 Sep 2024 16:20:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/keyhandler: Move key_table[] into __ro_after_init
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Daniel Smith <dpsmith@apertussolutions.com>,
 Jason Andryuk <jandryuk@gmail.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20240912125154.1708025-1-andrew.cooper3@citrix.com>
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
In-Reply-To: <20240912125154.1708025-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 12.09.2024 14:51, Andrew Cooper wrote:
> @@ -596,6 +594,8 @@ int __init iommu_setup(void)
>      }
>      else
>      {
> +        register_keyhandler('o', &iommu_dump_page_tables, "dump iommu page tables", 0);
> +
>          if ( iommu_quarantine_init() )
>              panic("Could not set up quarantine\n");

It's a little odd to have this immediately ahead of something that can
panic(), but not a big deal of course. The line wants wrapping though,
to stay within 80 cols.

Jan


