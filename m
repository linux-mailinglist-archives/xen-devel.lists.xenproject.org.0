Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 07BAA9B445C
	for <lists+xen-devel@lfdr.de>; Tue, 29 Oct 2024 09:38:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.827134.1241642 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t5hjg-0000Cs-1s; Tue, 29 Oct 2024 08:37:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 827134.1241642; Tue, 29 Oct 2024 08:37:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t5hjf-0000AZ-VK; Tue, 29 Oct 2024 08:37:55 +0000
Received: by outflank-mailman (input) for mailman id 827134;
 Tue, 29 Oct 2024 08:37:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=E68c=RZ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1t5hjf-0000AT-62
 for xen-devel@lists.xenproject.org; Tue, 29 Oct 2024 08:37:55 +0000
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com
 [2a00:1450:4864:20::22f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 169d3fca-95d1-11ef-99a3-01e77a169b0f;
 Tue, 29 Oct 2024 09:37:53 +0100 (CET)
Received: by mail-lj1-x22f.google.com with SMTP id
 38308e7fff4ca-2fb584a8f81so47367271fa.3
 for <xen-devel@lists.xenproject.org>; Tue, 29 Oct 2024 01:37:53 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43193573551sm136694935e9.6.2024.10.29.01.37.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 29 Oct 2024 01:37:52 -0700 (PDT)
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
X-Inumbo-ID: 169d3fca-95d1-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1730191073; x=1730795873; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=uTGuSycCXg9UQnZ4r21/xl3RN6DXXnawLG16iaDgOtU=;
        b=XL/9PXGzRFIiyjtk2EmgXG+PsUu2DdvUQDK8C9LjXe7xWur/hgqpQFbjY/p2gQ278o
         oFkKIASZsHhqYlTwkzYGyUGTfnt1lb1K+a0lwaqafF5kWs4BoxIYYRkN96VrjfFMHhui
         Iv4huFcwFnRHEf8OKEGxujQB5NWMVDe/pLtSPy022ZN4QPf9qb/DGUnHXCByn0y86v13
         /JwrKerBfkQEg/fA2Fs6jHL/kbCW6OElLlgnYW8bNH/qUNU/RUBSRMTqsutAEljHhoEf
         kXbX+MPm3nKgLpc6REFNSpxxokDpJBSyFjWSQc/DLo7c4Ok2MW7olxckuvi3q+VuP7Gy
         +BAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730191073; x=1730795873;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uTGuSycCXg9UQnZ4r21/xl3RN6DXXnawLG16iaDgOtU=;
        b=QJHscRc7xyuBldM87mmaFHoEiBcLtpg4VcWio6l4KrCZr46V8LJdXsrLYXi1HZweVV
         PfCF/Zeun79BIayzM9pLcKz3I3HmtW4ljJ0LT4LpfMfN4QauTElzBP7T+YOdIb/AqGiy
         R15T9m8M8L5Yq0gnyL4a28cdDE7JpRpX1eCu6S9gHruqcP/2dXrpYqYOne1RNQ6oisy/
         l8Iz6r5PzYfdch5chxzyaESq/keKZBVqXKGjf6NYYCGIIBcjkW6CZbDOrBfIg5q5GuK/
         cv4rZFwxetsjDHhcr+SqSfY91Z+2twtP2+yEDkAOMIXC6YYEYfCJ/kELKzYr/0btyI66
         0/eA==
X-Forwarded-Encrypted: i=1; AJvYcCVUy78H1Tmym9qyEHzQvxxVX/t1eIrFmT5kPQNlZ/Gy4VZkMBxhjd/KK05VvJb8biurQ1t1F6rESNg=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwBkQahFhiXJ1w0qaNgytGnxyw9dLhS6FdugIQ2sWVEUwFeuQ30
	vCsIzfD5xu+z1DaknWLoeg1aGuHgMOKzU/KSbHE8KjJHfNoHSNUtWaokhIIA6w==
X-Google-Smtp-Source: AGHT+IFRtszaLh2+yvTCg9TIf60ZZzdH5fsCB2ufi1MfoFqL2cANZ293zEY5uzD6nk3YF2/kuGx5Uw==
X-Received: by 2002:a05:651c:505:b0:2f5:abe:b6bd with SMTP id 38308e7fff4ca-2fcbe099636mr45603761fa.42.1730191072559;
        Tue, 29 Oct 2024 01:37:52 -0700 (PDT)
Message-ID: <85e7334b-b878-4896-8f7a-462ba73ea9e2@suse.com>
Date: Tue, 29 Oct 2024 09:37:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 12/14] x86/fpu: Pass explicit xsave areas to
 fpu_(f)xsave()
To: Alejandro Vallejo <alejandro.vallejo@cloud.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20241028154932.6797-1-alejandro.vallejo@cloud.com>
 <20241028154932.6797-13-alejandro.vallejo@cloud.com>
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
In-Reply-To: <20241028154932.6797-13-alejandro.vallejo@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 28.10.2024 16:49, Alejandro Vallejo wrote:
> --- a/xen/arch/x86/xstate.c
> +++ b/xen/arch/x86/xstate.c
> @@ -300,9 +300,8 @@ void compress_xsave_states(struct vcpu *v, const void *src, unsigned int size)
>      vcpu_unmap_xsave_area(v, xstate);
>  }
>  
> -void xsave(struct vcpu *v, uint64_t mask)
> +void xsave(struct vcpu *v, struct xsave_struct *ptr, uint64_t mask)
>  {
> -    struct xsave_struct *ptr = v->arch.xsave_area;
>      uint32_t hmask = mask >> 32;
>      uint32_t lmask = mask;
>      unsigned int fip_width = v->domain->arch.x87_fip_width;

Imo this change wants to constify v at the same time, to demonstrate that
nothing is changed through v anymore. The comment may extend to other functions
as well that are being altered here; I only closely looks at this one.

Jan

