Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 68B10A1D4E3
	for <lists+xen-devel@lfdr.de>; Mon, 27 Jan 2025 11:57:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.877699.1287837 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tcMno-0007ao-23; Mon, 27 Jan 2025 10:57:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 877699.1287837; Mon, 27 Jan 2025 10:57:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tcMnn-0007ZB-VW; Mon, 27 Jan 2025 10:57:11 +0000
Received: by outflank-mailman (input) for mailman id 877699;
 Mon, 27 Jan 2025 10:57:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=O4xJ=UT=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tcMnl-0007Z3-Sc
 for xen-devel@lists.xenproject.org; Mon, 27 Jan 2025 10:57:09 +0000
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [2a00:1450:4864:20::62a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 74113671-dc9d-11ef-a0e6-8be0dac302b0;
 Mon, 27 Jan 2025 11:57:08 +0100 (CET)
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-aaeef97ff02so711037066b.1
 for <xen-devel@lists.xenproject.org>; Mon, 27 Jan 2025 02:57:08 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ab6760ab0bcsm569339766b.95.2025.01.27.02.57.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Jan 2025 02:57:08 -0800 (PST)
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
X-Inumbo-ID: 74113671-dc9d-11ef-a0e6-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1737975428; x=1738580228; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=J0JWhd+/Gtr38oYfFIiqC5hteKmC0+hQCXF2FGzYW+Q=;
        b=QlsUoNI1uxNYT2rzyjOu78b+Kl6jqQP7GRAa/oXKqH0zj8drx7Ozzxba1VlJkmVenK
         XfRkHtg68lEI4bvXA3dKQItmibJDsvb/SoZKJzmz3hAc1mzAreZRxExMcwkHvsQrVOdE
         A0r+pXgMOyXt3N9dIgGEiLi7Z6yw1mbi4DW/dmQyQj8l3bwSImKWp5XM36/pshN3MAkI
         0gkttDICgTIIiemBhMixAGaltcqBCa+jw+kqCHW7mcIEauycv+CmOseUc2BdzI7MGJN2
         1Z++fcmfd1HjGDwj2hpXNowWA00NRGHu9IzTt+Hbbh4QLvLJMjgtd+5U/hBd+U/t1fOj
         AiIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737975428; x=1738580228;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J0JWhd+/Gtr38oYfFIiqC5hteKmC0+hQCXF2FGzYW+Q=;
        b=RWedaispxN55VHN1GgAsmzDnrUyYVEsn0aIf/ulR+pxQGTqEvovQE35hxAFXXfQBjg
         /tFkJF1Dpvzn0GOmqjHIwNZaEzmgK8nyA70M/1U8vnUn+Y6izrrxEnpGLV0t73cN6XtQ
         1/SSD/FSo9O/vVStlHMjRCqoBJNIkgsemNSNDeuYLKDj4YcWGCYV1XEZ1SakkLhgH3e6
         KaZBuN5ym9wWDEU2b/cFWiWlMr0ZWrDCGsHlkK5IkotP6irUsZYK02KVmgLQ/wIQJg7m
         Qmx3VI5oeWv0jnwnLUplXgRk66xeZAgb5E2LI+lVe1pw7/fm90UVSh18lclN+sEtQVQ3
         xa2A==
X-Forwarded-Encrypted: i=1; AJvYcCW7FedSBMGicmWkH1m9ZTlb2nfq3DgKRHIhp10j2Ay43qbklXkqLddJO9lfi3MymDhHJFZbzL7J4YQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwOKLSJR7WdE0T8GCnyA/VRcQ0Gcw3gswrOoyh7RZxYgw2ccw37
	PUuETR9/nKnesf2p3imdTsGJ/hwEDFX5nU+N98QtLL+kT88KIA4f5XZlM6+T+w==
X-Gm-Gg: ASbGnctDaIaNLvYIqGeJxhEgPbAcdTfkm1aQZlJNJ2wN3OOq3q6YGFdA7AGZdmcmu8V
	nNlQmrrXF9BZXpZXgMcWFDcttIBmyeUSSVxjSAbXBF8t0TqxmjKO8ZFrckOTzQkD17CA2i2cNoc
	tn/m8ffd2kjFscHDsyagDUGCpVhZTwxk8d6wRQzB7oZESTe6XfLB+siEga0ie99SbNfEVXsrklu
	635P+VnksQ0pQKxVyW2uLOYuQB9QP4kSgqjDSbBaEE1khWjt4jq0UH5xnv7/rQ0XufH5+4orxr5
	ab1GpgqBF6XRd7pP5/C06TeIgHilfYz19xUeSFZU2FxpxJSVL0A95vPA/m3tGE68ww==
X-Google-Smtp-Source: AGHT+IH4EaBBQ022jsYWWDuo1/XXsbjFWkgxKWofNbk4VvIp570pfJs9zy4DFbdZT1PJQb9F6bn00g==
X-Received: by 2002:a17:907:94cb:b0:aa6:423c:850e with SMTP id a640c23a62f3a-ab38b29954bmr3632009466b.27.1737975428276;
        Mon, 27 Jan 2025 02:57:08 -0800 (PST)
Message-ID: <4011a01c-acbd-4ef4-b6f8-d266f6623289@suse.com>
Date: Mon, 27 Jan 2025 11:57:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 09/12] x86/mpx: Map/unmap xsave area in in
 read_bndcfgu()
To: Alejandro Vallejo <alejandro.vallejo@cloud.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20250110132823.24348-1-alejandro.vallejo@cloud.com>
 <20250110132823.24348-10-alejandro.vallejo@cloud.com>
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
In-Reply-To: <20250110132823.24348-10-alejandro.vallejo@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10.01.2025 14:28, Alejandro Vallejo wrote:
> --- a/xen/arch/x86/xstate.c
> +++ b/xen/arch/x86/xstate.c
> @@ -1024,9 +1024,10 @@ int handle_xsetbv(u32 index, u64 new_bv)
>  
>  uint64_t read_bndcfgu(void)
>  {
> +    uint64_t bndcfgu = 0;
>      unsigned long cr0 = read_cr0();
> -    struct xsave_struct *xstate
> -        = idle_vcpu[smp_processor_id()]->arch.xsave_area;
> +    struct vcpu *v = idle_vcpu[smp_processor_id()];

Question on this one remains: Can it be pointer-to-const (in the longer
run; certainly in can be right now)?

> +    struct xsave_struct *xstate = VCPU_MAP_XSAVE_AREA(v);

I realize my similar remark on this one was actually wrong; the asm()s
clearly modify what is being pointed top.

Jan

