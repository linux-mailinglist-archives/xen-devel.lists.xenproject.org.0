Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EBAA2C57F19
	for <lists+xen-devel@lfdr.de>; Thu, 13 Nov 2025 15:29:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1161692.1489582 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vJYJf-0003cx-7Z; Thu, 13 Nov 2025 14:28:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1161692.1489582; Thu, 13 Nov 2025 14:28:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vJYJf-0003bG-4j; Thu, 13 Nov 2025 14:28:51 +0000
Received: by outflank-mailman (input) for mailman id 1161692;
 Thu, 13 Nov 2025 14:28:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=HFQP=5V=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vJYJd-0003bA-Sf
 for xen-devel@lists.xenproject.org; Thu, 13 Nov 2025 14:28:49 +0000
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [2a00:1450:4864:20::635])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 118799c9-c09d-11f0-9d18-b5c5bf9af7f9;
 Thu, 13 Nov 2025 15:28:48 +0100 (CET)
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-b735b7326e5so62948666b.0
 for <xen-devel@lists.xenproject.org>; Thu, 13 Nov 2025 06:28:48 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b734fd80d27sm174893366b.40.2025.11.13.06.28.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Nov 2025 06:28:47 -0800 (PST)
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
X-Inumbo-ID: 118799c9-c09d-11f0-9d18-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1763044128; x=1763648928; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=6z9LAEGW/utGPc+qe+s1pQh7FGgt8lv2FC/vukN4yA8=;
        b=Iua8/7jNqBje7O2/5kO7G5yIx0Dz2dRHvb1DLb3cGSZALAh+jLds6L/+tRRQE7J4OJ
         Ebu7D6SqjFtGkEuc216r+llf5yDuZt6FrqnCi9J6wC5knacA4oIajHoUVrRHx+sYx1sh
         BssAtqyAaE/JF5UZnWwdXereAEzSGEIppZMUmv8F8oq9ssd/D1/0NCn3241iqQIh2LZa
         lIlFXsL0jcoKrz8mjrdVhI0hSXYNQfL7aPKVsHROhns/Rzvr9jHCToPhp222Kjz2mFp+
         qjOney+M/D9hdrKyWA1GFVev0puVIacAGYTPkUL3EO8gJEjk9ciBSQmZaURNS8vA6jQp
         rdgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763044128; x=1763648928;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6z9LAEGW/utGPc+qe+s1pQh7FGgt8lv2FC/vukN4yA8=;
        b=TuPKni1PdgCqnUjo/5Mch0PN7ypo6J7a+msqE2I8vkI6CzV93D8QwuHQKLEbiwBA1z
         r/6+zpTZgNS2wI5db/4axhu7MhwuPGn1N8TI1mNTBQ5GqhcfH1QO8RJRwEDsk7nWqKx0
         hxiQIXd/PT1pf4lsmTWNp6R4y1SiSlMPeQKCI4jRcssnInDnjBxVFmotWRQzT16VoueC
         G7qvzwzPZKm67a/njvlypntYRAYPcXlal6wh5q/2p4eJrcwJTRRdE1x22LH4aNZjDH1c
         l4EHRJC/MJyKMZkJ+uP9dAN8lAQjHlC8cwUbC2uetW4ng3jHTgmLMXW09epGJVXj/Noa
         7yVA==
X-Forwarded-Encrypted: i=1; AJvYcCU/aFPBCuz4/V0eTZi9CG5EZU/aghy0ez/rRtpX83eDgnf+dRaVEi/74V76OSAywVSIwpcQ89g6prY=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yyi8ZVRHIsUjYR18k471dJ0ZEUIfpKD1vfaAB3Bz2hihqF4Kkou
	YsU5dDk0c+a24z19ugmYrENkivLzX8T8q817L1a8R+O6UVV0caFFvXB4/4shDgpUtg==
X-Gm-Gg: ASbGncsPgq0lKgUiJc8nYI0RKPSpVOZKR739wkyK+mx1hGNEIa07XRwjz2Hh8+OVrpr
	A9H6OygXMo6lFq7QUU92lutE6pJ0ZYcQ5zX/zN2Z3PakRSGCoqgs3YJgOvq9fU6GXx6Ctx/8pKk
	KXb5z/3hGJxt0fUCLBuVg3GNS4lfaJ+9OnqQr4soCKfWp0mj6OG5ShkoVXQiC5moAyDRaVyqO07
	15yOWnoorKH63HM/7Ve7lfT5NCQcn8M2Hu4FzKOCIhG/oC+s6wA2Ul0X10CtCEm1N8e9njo0btV
	euLpgSthK0sIF4gJo5g06d2VZsW8KaE3cU0Lzv0BPiTdUd88ldBjKZG/JL97KOp5xnrDC2tVSZn
	ycvRA2L1KHPUmR2wo5rDr3ju12/DHxBXVPjBUOUtR8jUjbUjz4E8ZqNURz3aBL27WFdo7SiPCL1
	FExF8IQ7/D8aaI6GD+5fI9V1CJ/uVwNP62UfCTdpVNTMjfdG2eCtGAJAGZD22IPvHHE83/MfjDa
	y4=
X-Google-Smtp-Source: AGHT+IEHl82PpdTl4nbTh0VmiGRufZ9ktiyGRLU+PyL74QdyuVtLqBriQN6NPZWAsJ7rQZvPrMoWtQ==
X-Received: by 2002:a17:907:7e84:b0:b4a:e7c9:84c1 with SMTP id a640c23a62f3a-b7348056909mr357154766b.7.1763044127998;
        Thu, 13 Nov 2025 06:28:47 -0800 (PST)
Message-ID: <4b0b5b43-1931-40a5-9879-f2a2dac9c602@suse.com>
Date: Thu, 13 Nov 2025 15:28:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 7/7] xen: New hypercall to claim memory using
 XEN_DOMCTL_claim_memory
To: Bernhard Kaindl <bernhard.kaindl@cloud.com>
Cc: Alejandro Vallejo <alejandro.garciavallejo@amd.com>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Juergen Gross
 <jgross@suse.com>, Christian Lindig <christian.lindig@citrix.com>,
 David Scott <dave@recoil.org>, xen-devel@lists.xenproject.org
References: <cover.1757261045.git.bernhard.kaindl@cloud.com>
 <e45dee16b67f31960e89fb3a3033064fcff02aae.1757261045.git.bernhard.kaindl@cloud.com>
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
In-Reply-To: <e45dee16b67f31960e89fb3a3033064fcff02aae.1757261045.git.bernhard.kaindl@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 07.09.2025 18:15, Bernhard Kaindl wrote:
> --- a/xen/common/domain.c
> +++ b/xen/common/domain.c
> @@ -267,6 +267,35 @@ int get_domain_state(struct xen_domctl_get_domain_state *info, struct domain *d,
>      return rc;
>  }
>  
> +/* XEN_DOMCTL_claim_memory: Claim an amount of memory for a domain */
> +int claim_memory(struct domain *d, const struct xen_domctl_claim_memory *uinfo)
> +{
> +    memory_claim_t claim;
> +    int rc;
> +
> +    switch ( uinfo->nr_claims )
> +    {
> +        case 0:

Nit (style) Indentation (case labels ant indenting the same as the respective
opening figure brace).

Considering what follows I'm not quite sure though that using switch() is
appropriate here. Kind of depends on what the longer-term plans are.

> +            /* Cancel existing claim. */
> +            rc = domain_claim_pages(d, 0, 0);
> +            break;

This effect also wants mentioning in the public header. It's not what I would
expect (a no-op). Also, shouldn't NUMA_NO_NODE be passed here?

> +        case 1:
> +            /* Only single node claims supported at the moment. */

Isn't the comment misplaced? Comments usually describe what follows, and the
"nr_claims == 1" restriction starts already a line earlier. Maybe the comment
would best go on the same line as the case label.

> +            if ( copy_from_guest(&claim, uinfo->claims, 1) )
> +                return -EFAULT;
> +
> +            rc = domain_claim_pages(d, claim.node, claim.nr_pages);

claim.node needs bounds checking, for nodemask_test() to not overrun the bitmap.

> --- a/xen/include/public/domctl.h
> +++ b/xen/include/public/domctl.h
> @@ -1276,6 +1276,21 @@ struct xen_domctl_get_domain_state {
>      uint64_t unique_id;      /* Unique domain identifier. */
>  };
>  
> +struct xen_memory_claim {
> +    unsigned int node;      /* NUMA node, XC_NUMA_NO_NODE for a host claim */
> +    unsigned long nr_pages; /* Number of pages to claim */

Fixed-width types need using here and ...

> +};
> +typedef struct xen_memory_claim memory_claim_t;
> +DEFINE_XEN_GUEST_HANDLE(memory_claim_t);
> +
> +/* XEN_DOMCTL_claim_memory: Claim an amount of memory for a domain */
> +struct xen_domctl_claim_memory {
> +    /* IN: array of memory claims */
> +    XEN_GUEST_HANDLE_64(memory_claim_t) claims;
> +    /* IN: number of claims */
> +    unsigned int nr_claims;

... here.

Jan

