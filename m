Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 44F46A1D4B0
	for <lists+xen-devel@lfdr.de>; Mon, 27 Jan 2025 11:45:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.877634.1287768 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tcMbz-0001ct-Eq; Mon, 27 Jan 2025 10:44:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 877634.1287768; Mon, 27 Jan 2025 10:44:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tcMbz-0001ap-BT; Mon, 27 Jan 2025 10:44:59 +0000
Received: by outflank-mailman (input) for mailman id 877634;
 Mon, 27 Jan 2025 10:44:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=O4xJ=UT=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tcMbx-0001ah-Vn
 for xen-devel@lists.xenproject.org; Mon, 27 Jan 2025 10:44:57 +0000
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [2a00:1450:4864:20::52c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bfcd15e5-dc9b-11ef-a0e6-8be0dac302b0;
 Mon, 27 Jan 2025 11:44:56 +0100 (CET)
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-5d0d32cd31aso6382048a12.0
 for <xen-devel@lists.xenproject.org>; Mon, 27 Jan 2025 02:44:56 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ab675e66358sm566631266b.69.2025.01.27.02.44.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Jan 2025 02:44:56 -0800 (PST)
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
X-Inumbo-ID: bfcd15e5-dc9b-11ef-a0e6-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1737974696; x=1738579496; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=zDL8kIOek8iWrkwRYQHjtWMr97qlvPEUGJ/CkFtkRGw=;
        b=FQs7clwZwNlarKfryrwJOWYQh5rLn01FHr0pJ9e92w9kVE6SJQrSEGfIDv2s0lY0R7
         CIUXj9g8ibuWU4ABGoKj1iMx54LZiWo+C1vNIqYgyl/LntqgqtEAvrjz7geJt7KhNtjC
         I07zM7fmtMcR/wbXbE59iUzKW08IwDhBIL5nDwged+mLF28LiyPDKKK3j+ajnPDW+llO
         KCABwBZgao7h1Te0slavY7hXsaAQo7U2Lj205gVj+eapKIak8CVICD++C35GbW0qPXz1
         sY7XwuGF1ct1toKARcTHLZwWF1QFlqIsE2ecD0zxIHPdRandYJH2SVGTN/6b3uXt4WR2
         +t3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737974696; x=1738579496;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zDL8kIOek8iWrkwRYQHjtWMr97qlvPEUGJ/CkFtkRGw=;
        b=jX65v2XVJ+32ek4Qh56lHsuGA10Akc11y9+3mgw3LUDnlnLdRxlnWs5fY/LIBwQs9u
         G/mzb90FsLLkxwnu83rSkbeWArY8HXS1BAk6RLxty6ncA6FjNfjYYOQUpbws7adfuNS0
         W5wRLDTuWqzby95ejH2bNaa2/FQvvSPhQpcNTRB2D8bNui4zh1sZYA8TYhpL2SNJz9Nu
         /tUsrCmD+QxlaFfV6yBsQuU+oqZqkNGXTxU47aeoK/xMen01Q4yM4VX3uv/Yp5k8wOIN
         EWt0BV1dGAwu1PuYc20eKgHXCeP8zzAPLNrEOsMUv7q23HiEjYnnV97OgsseeLo4VIAq
         J2Ww==
X-Forwarded-Encrypted: i=1; AJvYcCUF7xttNkloHe/kkJi/2qo17cDWRMBY+Y4q9hr0vaqh8veRtiD0WS34u+MQvn6cE378mlBE0oWUGYs=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yxw1c9nbgx2icbfWd0l2dryvhy6CuQQeTDPzUDdPUZFY1eIX+e1
	wvLfujRqIKhr4d8cw8WqwanUBEY4Tr7nmidPM0kHkkmOhI3xlqI3CCmlVCNwBQ==
X-Gm-Gg: ASbGncsHaOGUabo7WEhMol/pNHb7OJH/Te4SrLkJS9IFS6uQ5ilGjP/R3RSFoLuIa6F
	Icdq14zfK1usElqUKOR5o8FffRuTeX52MeZ0rn1p3LVrRVUrFkgeqJLB9nuHHB7EsO/UZBkFgmi
	b5jw27kizJu9ieG5xHlHgFe1jxyNzbfBL8LoNbwqicyBoWmLRM4DON0QBu4gdEWeNj+vT/qDICN
	xq67BCkXFTFEVwm7pVzQJfcbqo75Cv8nsejuNcGcFeZK4VEZ38mdHAm/ABHcVdJ0l52FOymA8Jv
	KlegZMScPCvZli0pXEtSXEuR9PKPxON5NVehxKVRG55WsDyPcKJ09zidQ6MDm2KKtg==
X-Google-Smtp-Source: AGHT+IFuso5LFYBjCyHHxnfSoiRKKt+NOdKjxS6R5NRIrtTLrx9tq4AhFfetbzWYrWu1y/2Du7f6fA==
X-Received: by 2002:a05:6402:2706:b0:5d4:2ef7:1c with SMTP id 4fb4d7f45d1cf-5db7db078c2mr91872839a12.24.1737974696311;
        Mon, 27 Jan 2025 02:44:56 -0800 (PST)
Message-ID: <74ba0d8b-af2a-4fc7-891c-1a1305e71df7@suse.com>
Date: Mon, 27 Jan 2025 11:44:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 01/12] x86/xstate: Create map/unmap primitives for
 xsave areas
To: Alejandro Vallejo <alejandro.vallejo@cloud.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20250110132823.24348-1-alejandro.vallejo@cloud.com>
 <20250110132823.24348-2-alejandro.vallejo@cloud.com>
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
In-Reply-To: <20250110132823.24348-2-alejandro.vallejo@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10.01.2025 14:28, Alejandro Vallejo wrote:
> Add infrastructure to simplify ASI handling. With ASI in the picture
> we'll have several different means of accessing the XSAVE area of a
> given vCPU, depending on whether a domain is covered by ASI or not and
> whether the vCPU is question is scheduled on the current pCPU or not.
> 
> Having these complexities exposed at the call sites becomes unwieldy
> very fast. These wrappers are intended to be used in a similar way to
> map_domain_page() and unmap_domain_page(); The map operation will
> dispatch the appropriate pointer for each case in a future patch, while
> unmap will remain a no-op where no unmap is required (e.g: when there's
> no ASI) and remove the transient maping if one was required.
> 
> Follow-up patches replace all uses of raw v->arch.xsave_area by this
> mechanism in preparation to add the beforementioned dispatch logic to be
> added at a later time.
> 
> Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>

Acked-by: Jan Beulich <jbeulich@suse.com>
with one nit below.

> --- a/xen/arch/x86/include/asm/xstate.h
> +++ b/xen/arch/x86/include/asm/xstate.h
> @@ -143,4 +143,46 @@ static inline bool xstate_all(const struct vcpu *v)
>             (v->arch.xcr0_accum & XSTATE_LAZY & ~XSTATE_FP_SSE);
>  }
>  
> +/*
> + * Fetch a pointer to a vCPU's XSAVE area
> + *
> + * TL;DR: If v == current, the mapping is guaranteed to already exist.
> + *
> + * Despite the name, this macro might not actually map anything. The only case
> + * in which a mutation of page tables is strictly required is when ASI==on &&
> + * v!=current. For everything else the mapping already exists and needs not
> + * be created nor destroyed.
> + *
> + *                         +-----------------+--------------+
> + *                         |   v == current  | v != current |
> + *          +--------------+-----------------+--------------+
> + *          | ASI  enabled | per-vCPU fixmap |  actual map  |
> + *          +--------------+-----------------+--------------+
> + *          | ASI disabled |             directmap          |
> + *          +--------------+--------------------------------+
> + *
> + * There MUST NOT be outstanding maps of XSAVE areas of the non-current vCPU
> + * at the point of context switch. Otherwise, the unmap operation will
> + * misbehave.
> + *
> + * TODO: Expand the macro to the ASI cases after infra to do so is in place.
> + *
> + * @param v Owner of the XSAVE area
> + */
> +#define VCPU_MAP_XSAVE_AREA(v) ((v)->arch.xsave_area)
> +
> +/*
> + * Drops the mapping of a vCPU's XSAVE area and nullifies its pointer on exit
> + *
> + * See VCPU_MAP_XSAVE_AREA() for additional information on the persistence of
> + * these mappings. This macro only tears down the mappings in the ASI=on &&
> + * v!=current case.
> + *
> + * TODO: Expand the macro to the ASI cases after infra to do so is in place.
> + *
> + * @param v Owner of the XSAVE area
> + * @param x XSAVE blob of v
> + */
> +#define VCPU_UNMAP_XSAVE_AREA(v, x) do { (void)(v); (x) = NULL; } while(0)

The "while" still wants to conform to style, despite it being a kind of
degenerate form. The overwhelming majority of instances we've got have at
least a blank before the opening parenthesis. Many also have the ones
inside.

Jan

