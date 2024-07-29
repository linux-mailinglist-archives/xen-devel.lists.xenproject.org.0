Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BCAD893F49A
	for <lists+xen-devel@lfdr.de>; Mon, 29 Jul 2024 13:54:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.766658.1177164 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sYOww-0004u6-BF; Mon, 29 Jul 2024 11:53:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 766658.1177164; Mon, 29 Jul 2024 11:53:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sYOww-0004qp-7C; Mon, 29 Jul 2024 11:53:58 +0000
Received: by outflank-mailman (input) for mailman id 766658;
 Mon, 29 Jul 2024 11:53:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=XCGL=O5=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sYOwv-0004qh-0e
 for xen-devel@lists.xenproject.org; Mon, 29 Jul 2024 11:53:57 +0000
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [2a00:1450:4864:20::632])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3b43cf2d-4da1-11ef-8776-851b0ebba9a2;
 Mon, 29 Jul 2024 13:53:55 +0200 (CEST)
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-a7a9a369055so379122566b.3
 for <xen-devel@lists.xenproject.org>; Mon, 29 Jul 2024 04:53:55 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a7acadb8072sm495772466b.196.2024.07.29.04.53.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 29 Jul 2024 04:53:54 -0700 (PDT)
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
X-Inumbo-ID: 3b43cf2d-4da1-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1722254034; x=1722858834; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=RHxB+KOsH2qUfsGR7EJ+h5H+zbkNMnGmnXV0Nli+o1U=;
        b=aZh5CqQya31GW7kE4jfTUsskhkS0z4he2nTJpnp8CBiycONQDSQ4JNqUBMxed92fWp
         nYHE0z9dT9nEb/Nyqtzx69cht76z4WuXH9ndWfLcOC0B6P0dOHRqgQdV1j7ZUu5Og7HK
         JMs8c68+PRy847OAl483P6YdcOaZMpFCb1l8AtgfMsu/uEWhi9rMMOrsjLkcPkJMKsNf
         K88jyGN77PWnVcqgxYpWnbDpuWIqZjFt8pjnsYLhfgJCVvjK77oDMrketjBicduVaNJx
         dpvDrrAswnj44j3txZEKnGmXfOtsM6w2xo4AaFMSGh9lcN50ZbFu6++W5H6u6QTra3q7
         aFHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722254034; x=1722858834;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RHxB+KOsH2qUfsGR7EJ+h5H+zbkNMnGmnXV0Nli+o1U=;
        b=h4GuHIKzzfd1oSebvn4NzurT+A+gsgRH7EnO7GCZVyYVurxNeN79Uh9M+9Tte9G/6h
         6eDe7UBQA00g/tIWwZEVPXo+CahgEcPPpocp8OprM+JRUzAZFAkAunQK73u46UZ3kOMG
         qV6cOSI4oZAJNPE19cUNcy4AX6iZ6nqJWdrmzfGX5yAGqbFIIZWAir1wjD+i3UoMlKyX
         OjjyYEDcOptvP4aBgTISjmBiN3ZDAkDzzTH/o8nAQzny3Q38jsQTVcyentKeDrNGgZrQ
         S03QFNO2spUutIDUzhOjq8GdEG7piC2r6ud0vbSar1ZjYRRqHQIdjA4p37Canj5ZU3LO
         ZZ5A==
X-Forwarded-Encrypted: i=1; AJvYcCVK+TpWVKmzrxqgyG5Hn+Nq5OgENkVprmhHzCA8Dk5we9v8XF0XUte+x124HkFA+EsbfSMTqaZN3jERccG/64GZC4FzcMwu0aHNvS5D0Vo=
X-Gm-Message-State: AOJu0Yy1Qzf8B7lgsfQ+bxYg54TAxhovHBDhVn03CXauG4i0w2m66tek
	G8tJBeo50G5jb0V6nwtN0sbPzJM5nMzfWR8hx3KsItyRNwhRF+EaGfNQ9b+vMQ==
X-Google-Smtp-Source: AGHT+IEawEg71ZZqW7v2vUSg/3DTj5bBabnh32gSriG5lG8qvYfRTPyVnja8be0EIb0PwDtDf/HIdQ==
X-Received: by 2002:a17:907:7f1f:b0:a77:db97:f4fd with SMTP id a640c23a62f3a-a7d400575dbmr423823766b.34.1722254034567;
        Mon, 29 Jul 2024 04:53:54 -0700 (PDT)
Message-ID: <b1918f51-1ac0-40f8-9174-d8161b2681dd@suse.com>
Date: Mon, 29 Jul 2024 13:53:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 03/22] x86/dom0: only disable SMAP for the PV dom0 build
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: alejandro.vallejo@cloud.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20240726152206.28411-1-roger.pau@citrix.com>
 <20240726152206.28411-4-roger.pau@citrix.com>
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
In-Reply-To: <20240726152206.28411-4-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 26.07.2024 17:21, Roger Pau Monne wrote:
> The PVH dom0 builder doesn't switch page tables and has no need to run with
> SMAP disabled.
> 
> Put the SMAP disabling close to the code region where it's necessary, as it
> then becomes obvious why switch_cr3_cr4() is required instead of
> write_ptbase().
> 
> Note removing SMAP from cr4_pv32_mask is not required, as we never jump into
> guest context, and hence updating the value of cr4_pv32_mask is not relevant.

I'm okay-ish with that being dropped, but iirc the goal was to keep the
variable in sync with CPU state.

> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>



