Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A521AAD4A68
	for <lists+xen-devel@lfdr.de>; Wed, 11 Jun 2025 07:24:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1011289.1389654 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uPDw9-0002Ia-Ga; Wed, 11 Jun 2025 05:23:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1011289.1389654; Wed, 11 Jun 2025 05:23:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uPDw9-0002Hg-Ck; Wed, 11 Jun 2025 05:23:45 +0000
Received: by outflank-mailman (input) for mailman id 1011289;
 Wed, 11 Jun 2025 05:23:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Z5UX=Y2=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uPDw8-0002Ha-5o
 for xen-devel@lists.xenproject.org; Wed, 11 Jun 2025 05:23:44 +0000
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [2a00:1450:4864:20::334])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3d278590-4684-11f0-a307-13f23c93f187;
 Wed, 11 Jun 2025 07:23:42 +0200 (CEST)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-450cb2ddd46so36711025e9.2
 for <xen-devel@lists.xenproject.org>; Tue, 10 Jun 2025 22:23:42 -0700 (PDT)
Received: from ?IPV6:2003:ca:b734:b419:d0bf:1423:db44:9404?
 (p200300cab734b419d0bf1423db449404.dip0.t-ipconnect.de.
 [2003:ca:b734:b419:d0bf:1423:db44:9404])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45326f3cf0fsm1102215e9.8.2025.06.10.22.23.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Jun 2025 22:23:41 -0700 (PDT)
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
X-Inumbo-ID: 3d278590-4684-11f0-a307-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1749619422; x=1750224222; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=6e/6gqfZhP4cRkQrjpT/xeY16qenFE0pb27RUmfH1xU=;
        b=Mludi6J2vpwohRaRbKCKYLLjoYF0+aEqfJC4f3uEWqAKA23g4dlaEzFbg485A7zK8s
         mN3Nz1ZJDHWT15lrU5cinLbnUVmEeRGaQTP8eu9iPXMWRrEyVeL3VFivSYeXE48Kb57p
         8JBNxzYqEwVbEWJMffCZwaET0k4RYvZtBft97k/EYHArU+95XXewFDAjVdguV/588PqH
         aKcJ9FIK/cRwxUNYEhHT09G15UMnRZYYXKQEpLYs2TJjcb5lpGqviqJqctIH8R6JtiTl
         zHvCAtSvd03n4qqRuBwA3Plfo3m/Dy5WObi+QKCfKI+gJI9WOUGCyZk9ED/Ct5rfl8Yq
         cSlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749619422; x=1750224222;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6e/6gqfZhP4cRkQrjpT/xeY16qenFE0pb27RUmfH1xU=;
        b=S9QgVjdGs+JnO3dNLcftna56dJNde+Bw0WemL/3gXlEhUJSSrCcHkx+zNKC8Tv4EEn
         tjV1T+NlU/igl1Wg2It/zUh06WhicF5763OZnZVdUvBD5MiPcD26F6kZofBT9r6OWl6U
         87XGYy8bLo3h+Vl1uZ67EaWJwmgbb3YkPUUPfmYen+v020EGibU/SuJvtFLe5bThKB1z
         EFfU1v+8Aw+1zF6uqG2kDTHkAbI9r9m6JputbxaELSAQHn5qwn+g3HxBg14m4dO65b6J
         3Vo3YIxsGsOfRS8cc5FEfTeWQfQ7JHfaCgyQjsrig8JfPOGm+lr1xEospe+2CgkqU/nb
         vI/w==
X-Forwarded-Encrypted: i=1; AJvYcCW/HeetTcH+QHsxWxfmfQe+8ciig7G7YlzqtwZcJOAlf44ExAOyAbQur2sGJ7glO0h1j6ro1+VsD/M=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyoLyReq0JBV3rT0l0Zvez+SOLOQToZWmogSYQ6R9nkL6o8teqH
	LNODbcfktA76q6B/2SMnk4goVfeLVghTj3OhFsijxGPU30JuqcgYrCKzr1EnGlwCYg==
X-Gm-Gg: ASbGncuCDNNRuPd0CUf6ZMqkzePzUZV7irRYiolQWc0S67vRQyjCRM+5V7O59eaq7WG
	6AbQsPiNiOfJ+j3TNG/PDWihg5zIchYYfVH3+jbA8grQb25TOkHFw3GVQTXmimDdKLZb5I7UZmp
	GTOwn0emKFQkD8wn/OzuHslKLPEOmjU/qw6esJG5T+5lC5AbBZz6Zzkm91HdIv+pHR64iljDWja
	I4ScWZTDcL4a+VW+rkdsnOzd5Wp0TU4ihwkYQTRstbSgwAh+8lXUBb02eH3smrzCOX5K96J346D
	lAL0pFHgj32OcSjh25pTK1U1fEAHu8+DHSj531YeEcFIGOX3gvSW9y4Wn/xOAUhc2HuVARucNJr
	QYWrNWDFd0W+NAzwYE28cXfQ0Dr60WJ3vivGJkjQQLdibHRaZTuEbNQ/xJBdXneKOG8OtDALkRL
	ejYRrQDh00qUTXLCGmV5eP
X-Google-Smtp-Source: AGHT+IELHaHtO7+uzpOM8NUK0BY2CD9uXomFLsiUZZlqg3wj105p4rfGgJEZMDnU6IP50RSkeqeeRQ==
X-Received: by 2002:a05:600c:474c:b0:453:c39:d0c2 with SMTP id 5b1f17b1804b1-453248ca5c8mr11717425e9.24.1749619422027;
        Tue, 10 Jun 2025 22:23:42 -0700 (PDT)
Message-ID: <6ac8ffbc-5bd3-4bea-9ade-f31710747291@suse.com>
Date: Wed, 11 Jun 2025 07:23:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7] xen/arm: pci: introduce PCI_PASSTHROUGH Kconfig option
To: Stewart Hildebrand <stewart.hildebrand@amd.com>
Cc: Rahul Singh <rahul.singh@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Stefano Stabellini <stefano.stabellini@amd.com>,
 xen-devel@lists.xenproject.org
References: <20250610174635.203439-1-stewart.hildebrand@amd.com>
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
In-Reply-To: <20250610174635.203439-1-stewart.hildebrand@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10.06.2025 19:46, Stewart Hildebrand wrote:
> --- a/xen/arch/arm/Kconfig
> +++ b/xen/arch/arm/Kconfig
> @@ -258,6 +258,16 @@ config PARTIAL_EMULATION
>  
>  source "arch/arm/firmware/Kconfig"
>  
> +config PCI_PASSTHROUGH
> +	bool "PCI passthrough" if EXPERT
> +	depends on ARM_64
> +	select HAS_PCI
> +	select HAS_VPCI
> +	select HAS_VPCI_GUEST_SUPPORT

What about HAS_PASSTHROUGH? Seeing that being selected by MMU, what about
that connection here?

Selecting HAS_VPCI shouldn't really be necessary; HAS_VPCI_GUEST_SUPPORT
does that for you already. (I further wonder whether HAS_VPCI wouldn't
in turn better select HAS_PCI.)

> +	default n

This is unnecessary (redundant) and would hence better be omitted.

Jan

