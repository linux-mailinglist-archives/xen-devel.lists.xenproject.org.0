Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B7DB9DFDE0
	for <lists+xen-devel@lfdr.de>; Mon,  2 Dec 2024 10:57:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.846505.1261671 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tI3Au-0004PO-Kt; Mon, 02 Dec 2024 09:57:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 846505.1261671; Mon, 02 Dec 2024 09:57:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tI3Au-0004Np-GR; Mon, 02 Dec 2024 09:57:04 +0000
Received: by outflank-mailman (input) for mailman id 846505;
 Mon, 02 Dec 2024 09:57:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=iCIG=S3=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tI3As-0003pF-K5
 for xen-devel@lists.xenproject.org; Mon, 02 Dec 2024 09:57:02 +0000
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [2a00:1450:4864:20::62f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c6106198-b093-11ef-a0d2-8be0dac302b0;
 Mon, 02 Dec 2024 10:57:00 +0100 (CET)
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-a9a68480164so566658366b.3
 for <xen-devel@lists.xenproject.org>; Mon, 02 Dec 2024 01:57:00 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aa5996c11c0sm488748466b.35.2024.12.02.01.56.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 Dec 2024 01:56:59 -0800 (PST)
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
X-Inumbo-ID: c6106198-b093-11ef-a0d2-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo2MmYiLCJoZWxvIjoibWFpbC1lajEteDYyZi5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6ImM2MTA2MTk4LWIwOTMtMTFlZi1hMGQyLThiZTBkYWMzMDJiMCIsInRzIjoxNzMzMTMzNDIwLjI5MzEzNywic2VuZGVyIjoiamJldWxpY2hAc3VzZS5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1733133420; x=1733738220; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=itCBYJ2tSnP3SFzDDju7SCugxJgCPiwpzoFYH3qzQW4=;
        b=BhurNz2Ag+ldwopoj53u0pgGdpaxahFeXy4xCsUTZ9aYjBkrV8PI9gMz2SExjCsowN
         2Parm/b8adRcw37Qf5LFofJwdADDvARBind+28q75lckFg+d7dS7GyI8Akyf6H2d1aaK
         VAJ+uCW96Up0SoNE/nXlGHIRlQReqbIRqKHNsSQy/1fnZ1IWvoPeA0K5upvo3xfh9wTC
         GvIzHF1gDfTytQv7ObgCQS4XBFtGS1DpJbZ5/a8+FF6feAIPXIupfsV5xaUTf4na7Iti
         ghFr0sHibQJaVsaFAX2krx+PK6gM73uIV8iWzDK/mSTbjr6BW2qsskbKjq8MNFUZQfCv
         khXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733133420; x=1733738220;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=itCBYJ2tSnP3SFzDDju7SCugxJgCPiwpzoFYH3qzQW4=;
        b=b6SIOX72L0gXxbHHnUIrx+bgeagd5nmsHIanHLGptWq9/ulpR8Dfth/4CGu/xpho5D
         lSPZlkmmNzQg49g+cndRTCWq8XSy5+f8TFzTYaARt/4wVg8f2RDUD7/XqNQTFiv1yn1f
         wTxyWgQcYFKzGPT4ogogBplMamqrkSpeHuyWnO7WTQuSmXRmo1/2pDHSgFXDSXFqYuq0
         /aJWvV8jNhTGaD0OdWa1SouzSsgt57sxlsQsHRZQrWrPzROMJLy6LKoffl68GzOD6xKK
         P5V+uVZwIRdI06P40OQrp9fNMIZC8BNNiRTcTvqgmdUDW55l297639AW2aVOJlvH5jVw
         7g4w==
X-Forwarded-Encrypted: i=1; AJvYcCXSxhBHkCMtondOTaN8mmSYMT2/OtjbNkajtPAgyIiejIeoZftNuKSJ+QeCf1GWAo4Oj405n6+7hk8=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwWKXrB8GJrgDNign3ToWy7bw/AIlZndbcH+1X6bisQFK0xYkPf
	SXdRppPzPLq2jecuLJgjsFhQcatAFX15iCjglKECRnnZGjDWYIm3J+gfAirBMw==
X-Gm-Gg: ASbGnctru2Wla4sNexsY3CpyHJPnM1Hjotn5IMp9mlBY562CBfY04s8tdKLpgjjV83w
	XIwkrVi7/Ta5/er/Q3n3mG17MsEuxT5CsWjhjGjwezwPiGDzEOOqhsXTZFn9vaf2r2LmZ2Idhs/
	Qqi2ql6IBIo3Jz4sUQGYd25ZY9/16dUvcOLnDB69WycZCq/XQhIezcz//7mS21amOHX+cBxK17B
	PIU5mH3uQtrHwivVaFEBSrO8P/nwDRi6oQ62MoIl6wKMvvbIgwu4CFQT5Di7u0QgPrab9vpe6DN
	Pj8ahX8x/ougJDpy9QuKTHFO/0Gs94qJzQY=
X-Google-Smtp-Source: AGHT+IH+NkQ8zdXgS8azURKS7JwAfg1YGPe7opRdV2fr9aEHXcofK+7UguTQwlyK46XEft1KC2ZdRw==
X-Received: by 2002:a17:907:abb:b0:aa5:308c:3489 with SMTP id a640c23a62f3a-aa58108aa75mr1815818566b.58.1733133419695;
        Mon, 02 Dec 2024 01:56:59 -0800 (PST)
Message-ID: <de804eaa-df1d-4ca5-9dd7-1ee36c9d150b@suse.com>
Date: Mon, 2 Dec 2024 10:57:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/15] x86/boot: introduce boot domain
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>
Cc: jason.andryuk@amd.com, christopher.w.clark@gmail.com,
 stefano.stabellini@amd.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20241123182044.30687-1-dpsmith@apertussolutions.com>
 <20241123182044.30687-2-dpsmith@apertussolutions.com>
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
In-Reply-To: <20241123182044.30687-2-dpsmith@apertussolutions.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 23.11.2024 19:20, Daniel P. Smith wrote:
> To begin moving toward allowing the hypervisor to construct more than one
> domain at boot, a container is needed for a domain's build information.
> Introduce a new header, <xen/asm/bootdomain.h>, that contains the initial
> struct boot_domain that encapsulate the build information for a domain.

Why does this need to be a per-arch header? Wasn't one of the goals to unify
things as much as possible?

> --- a/xen/arch/x86/include/asm/dom0_build.h
> +++ b/xen/arch/x86/include/asm/dom0_build.h
> @@ -13,9 +13,9 @@ unsigned long dom0_compute_nr_pages(struct domain *d,
>                                      unsigned long initrd_len);
>  int dom0_setup_permissions(struct domain *d);
>  
> -struct boot_info;
> -int dom0_construct_pv(struct boot_info *bi, struct domain *d);
> -int dom0_construct_pvh(struct boot_info *bi, struct domain *d);
> +struct boot_domain;
> +int dom0_construct_pv(struct boot_domain *bd);
> +int dom0_construct_pvh(struct boot_domain *bd);

I'm wondering: Just a few commits ago you moved these to boot_info. Now you
move them to boot_domain. Why the extra churn, and what further transformations
are to be expected?

Jan

