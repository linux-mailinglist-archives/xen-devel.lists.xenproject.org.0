Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DB4C4AA05C2
	for <lists+xen-devel@lfdr.de>; Tue, 29 Apr 2025 10:28:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.971666.1360020 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u9gKT-00011w-G6; Tue, 29 Apr 2025 08:28:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 971666.1360020; Tue, 29 Apr 2025 08:28:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u9gKT-00010U-DQ; Tue, 29 Apr 2025 08:28:37 +0000
Received: by outflank-mailman (input) for mailman id 971666;
 Tue, 29 Apr 2025 08:28:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qXnC=XP=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1u9gKS-00010O-5E
 for xen-devel@lists.xenproject.org; Tue, 29 Apr 2025 08:28:36 +0000
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [2a00:1450:4864:20::631])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f0686591-24d3-11f0-9ffb-bf95429c2676;
 Tue, 29 Apr 2025 10:28:34 +0200 (CEST)
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-ac2c663a3daso1123322266b.2
 for <xen-devel@lists.xenproject.org>; Tue, 29 Apr 2025 01:28:34 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ace6e41c898sm740997366b.7.2025.04.29.01.28.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 29 Apr 2025 01:28:33 -0700 (PDT)
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
X-Inumbo-ID: f0686591-24d3-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1745915313; x=1746520113; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=kRtJrXRtQNjq41zHKBZdk2VUStOrxT5x02bWzd+spPw=;
        b=Yvy0Qrir9m4ZNS7aKfX6qZLd79cFmF6SBgJmgkmAoqudTnY573jVXilRC99ydXw5zR
         3UTWMhw/WybsADeEbqnb3IXUmKXs5NSeyMtM+m+5oLyx6bUhyivWl1iJgcs2Gq2FmWgC
         K2LIH7ldgTGC8/5SpjcT10RmQr6HG4Vku3S27VDkwC+vyC8Gdmv121VwGzXUoRTlNppR
         tSKzhVTcxR+M/YykJbNq9KbF/B2YoKrdJ4sSHFQMGmu3xE5ChC8MqBxI4Fj26VVIAuAH
         acdOmwoKy3mPeq0UOxzOryib1mlupHYKgXGm5c6/50PtkG1H3SeiHQKHMwy16+n0sL/I
         KatQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745915313; x=1746520113;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kRtJrXRtQNjq41zHKBZdk2VUStOrxT5x02bWzd+spPw=;
        b=rUWLGvIYmbgDGckUYYQQqrMHP4J1Bx26bIOJkSQYY+LqWV4+0SYjS9R1nwBNS8/a8d
         i+sKtIzsjEpDIdHwAWtrKRMr4UutTzahzeo2Vp3aWKheP4iwpxN8wGttce18I6KiNog3
         jeXYAT+fVR91zljoNZawOiU745FrwbEw1IsuLEAl71nqVoMLAhw5Sbj7NF/mlODuhpD+
         lZE3Ys35aVwsTnBWsHtzj00INTvLxtvl316oL5ajBU4zUO8PlMKZgMX7LTgAOugY5Ku0
         F3YgS2F49o3EbR/2+oP8KXrZef9KUEcTt/SSzXBPk6lwNtCX4hINLCEFZirRFBKXQsGn
         SZeQ==
X-Forwarded-Encrypted: i=1; AJvYcCX/zPC36gn38pYCCdrH1z+6dQYBMVgVzfIlK3hszxiCaMWDw8XWkHSuhvDr15NvCpC4j6JF+SEwIkI=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyXfIJVYuJzuIS6hjfaJQfcysOpV5Wud6LLBWPgMCYD1LV0Mkt8
	uygxvvo4XzQm+VUmpy3VAgk/2J1sirLzf7vgGl2AGe/KNki+930UvKZk0lKNww==
X-Gm-Gg: ASbGncuzqznSnMlZnZRwUIxiPvXSm18JrsJG/NKvkM6jx9MhI17bWTQZFKoINs6CLdi
	Y6Off5sHgSKHpPJcx5TRO3dK/pR6Pl1IU+It7RhF9iTe8hjsDPsqwWjMFbrcuZACCjc0ET5HxPC
	ZAwDPQRmWeFKzQB9wMevRry8kQLWRWeWZuycTRULk0LDHvR74ob0zMHxSTKFvXF40OVs/deqmeS
	im1NEHjMbkHxTmaMCvhIrPuZXUBxv7hCBg0ye9bxvWgqn49Y5xtaEKg0dCYNj98aP+RHR4T2iwP
	PJph12MywIYJ58KvdIQ80WacHZQo1hkMbrVEfGIUxifzCmEKxZaiGrtqsOfe4zodKbEcMAYuMRV
	lIXa2UDcLXVRSeavLPZIb1kGZow==
X-Google-Smtp-Source: AGHT+IFlEDN+Ki0/yXOLa0FDjv2ebvA8TC/yfuPmrOLkSpmyHSw/U4nS07Rwz9GTpO6U0BdghczHTQ==
X-Received: by 2002:a17:906:280c:b0:ace:bf94:2d2c with SMTP id a640c23a62f3a-acebf942f30mr346872366b.54.1745915313505;
        Tue, 29 Apr 2025 01:28:33 -0700 (PDT)
Message-ID: <77c9529e-8353-479f-994f-d6d668788374@suse.com>
Date: Tue, 29 Apr 2025 10:28:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] x86/hyperv: use dynamically allocated page for
 hypercalls
To: Ariadne Conill <ariadne@ariadne.space>
Cc: Paul Durrant <paul@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Alejandro Vallejo <agarciav@amd.com>,
 "Alexander M . Merritt" <alexander@edera.dev>, xen-devel@lists.xenproject.org
References: <20250428195736.2516-1-ariadne@ariadne.space>
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
In-Reply-To: <20250428195736.2516-1-ariadne@ariadne.space>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 28.04.2025 21:57, Ariadne Conill wrote:
> Previously Xen placed the hypercall page at the highest possible MFN,
> but this caused problems on systems where there is more than 36 bits
> of physical address space.

Hmm, I should have asked already on the earlier version: What kinds of
problems are these, beyond ...

> In general, it also seems unreliable to assume that the highest possible
> MFN is not already reserved for some other purpose.

... this particular aspect? I find it puzzling that such problems would
depend on the number of physical address bits.

Jan

