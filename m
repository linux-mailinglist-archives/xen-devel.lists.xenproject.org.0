Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BC5FD91DA6F
	for <lists+xen-devel@lfdr.de>; Mon,  1 Jul 2024 10:49:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.751383.1159328 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sOCj6-00066F-Dp; Mon, 01 Jul 2024 08:49:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 751383.1159328; Mon, 01 Jul 2024 08:49:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sOCj6-000641-BA; Mon, 01 Jul 2024 08:49:32 +0000
Received: by outflank-mailman (input) for mailman id 751383;
 Mon, 01 Jul 2024 08:49:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=kQX2=OB=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sOCj4-00062v-By
 for xen-devel@lists.xenproject.org; Mon, 01 Jul 2024 08:49:30 +0000
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com
 [2a00:1450:4864:20::22d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d3da3cbd-3786-11ef-90a4-e314d9c70b13;
 Mon, 01 Jul 2024 10:49:29 +0200 (CEST)
Received: by mail-lj1-x22d.google.com with SMTP id
 38308e7fff4ca-2eaafda3b5cso25910781fa.3
 for <xen-devel@lists.xenproject.org>; Mon, 01 Jul 2024 01:49:29 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-708043b710fsm5929927b3a.156.2024.07.01.01.49.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 Jul 2024 01:49:28 -0700 (PDT)
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
X-Inumbo-ID: d3da3cbd-3786-11ef-90a4-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1719823769; x=1720428569; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=WQbQXMm8A72ixdc3TmyKYnso+AE/QKcfaMsMLFepZyA=;
        b=FR+XxGEEcPRSmO8erIFg8rjpTKu425g1va4gRqwkI+Gb1U8RUjv4KB84ydKjsaqXGq
         peevegGEOyROIReC3dcEuCuGK8Pdf2OqAaIK+xz3vaeukWj00TWiRCyichrqbw0wXIy3
         Pa/VnwZs41gDNZDnZur3UB9V7gjON5FfL8xmhtpqjANYLxu6yehDsIwlMzI536E/kfAi
         ZBV45QTZGRUiXtAUwfK3uNyyIOZzSHFbvYWliDfXH8X5jwZ/W+8zP/sNvHjuO53/yW/K
         aqPSgdy13gYf0x+jEEnToziJdV0nY8stTQegtmYwmLwQUVdgMceBa/H+LXVGvnhGYZl9
         B8HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719823769; x=1720428569;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WQbQXMm8A72ixdc3TmyKYnso+AE/QKcfaMsMLFepZyA=;
        b=FpBiRoU6U3uALBOGq6aL6aY9ifC7c/Gl976b3dopv6vzuavgl46+hYmYN1tQLKyYNe
         u96Qt+lZOzYfI6dBW8rGhgZv2/g6+OpFXNgoNXmuowU3dz/qKljdyyBjJFlCJ2FXKFJv
         tr7TU3nXMBa9P2+1L9lnnoBffm1e7bOp8Z+X+u3BXb7xbsfBqsz5OcBkaVrOYoz2koFV
         7ldaZNOAmkFIGKiT5XS1LHIeztSl1E3Vz3xwZOkyFUrs2M4aw8sjtYFxBXhQL4ud8rpm
         dYTUyXN2/0rykWIfX1TOGKmW1NnxQIBaQuRzMyuH1p5J+tPiwTdmvSmB2N/47NRhTl49
         7bBQ==
X-Forwarded-Encrypted: i=1; AJvYcCXcGYPCPObtbHJtvb5fWeovPgfOFHN5ZU1nL8/EF18bM5u5zGQb0wJ0lePdJiUPJMM/Ee6+BX1HBQ7i+zyBkMbzW1/OxV7XyWDZL2QtmEU=
X-Gm-Message-State: AOJu0YxjZDe4bBXP7IrIc4LS1djEk0wui2AjAUBTapjXAR29VbHmRqTt
	I/df4r30RbaO6B8PfUEDpmQ2vdiLaGr1f7mECIVfoIZOE0ygHUsO+yFCBZ/Bew==
X-Google-Smtp-Source: AGHT+IHWBOp97N9D+HZdfF0f3wwXDiQFw9ubXWdYtQjBSYSDFGDGj2MHGkvn1/GA43W5j9JaAb8mpw==
X-Received: by 2002:a05:651c:b28:b0:2ec:561f:9605 with SMTP id 38308e7fff4ca-2ee5e3595bemr39013581fa.5.1719823768682;
        Mon, 01 Jul 2024 01:49:28 -0700 (PDT)
Message-ID: <6237453c-b07d-4aad-af33-099b4cc37838@suse.com>
Date: Mon, 1 Jul 2024 10:49:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v3 08/12] x86/vpt: address a violation of MISRA C Rule
 16.3
To: Federico Serafini <federico.serafini@bugseng.com>
Cc: consulting@bugseng.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <cover.1719383180.git.federico.serafini@bugseng.com>
 <453ef39f5a2a1871d8b0c74d921ed6a413b179b4.1719383180.git.federico.serafini@bugseng.com>
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
In-Reply-To: <453ef39f5a2a1871d8b0c74d921ed6a413b179b4.1719383180.git.federico.serafini@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 26.06.2024 11:28, Federico Serafini wrote:
> --- a/xen/arch/x86/hvm/vpt.c
> +++ b/xen/arch/x86/hvm/vpt.c
> @@ -118,9 +118,11 @@ static int pt_irq_masked(struct periodic_time *pt)
>              return 0;
>  
>          gsi = hvm_isa_irq_to_gsi(pt->irq);
> +
> +        /* Fallthrough to check if the interrupt is masked on the IO APIC. */
> +        fallthrough;
>      }
>  
> -    /* Fallthrough to check if the interrupt is masked on the IO APIC. */
>      case PTSRC_ioapic:
>      {
>          int mask = vioapic_get_mask(v->domain, gsi);

See question on patch 7. Plus the blank line may want purging here along
with the comment, to be consistent with what you're doing elsewhere.

Jan

