Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 351D792B10C
	for <lists+xen-devel@lfdr.de>; Tue,  9 Jul 2024 09:29:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.755930.1164464 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sR5HW-0005yK-SL; Tue, 09 Jul 2024 07:28:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 755930.1164464; Tue, 09 Jul 2024 07:28:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sR5HW-0005vm-PV; Tue, 09 Jul 2024 07:28:58 +0000
Received: by outflank-mailman (input) for mailman id 755930;
 Tue, 09 Jul 2024 07:28:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=uARp=OJ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sR5HV-0005vd-1z
 for xen-devel@lists.xenproject.org; Tue, 09 Jul 2024 07:28:57 +0000
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com
 [2a00:1450:4864:20::22b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e596f2f3-3dc4-11ef-8776-851b0ebba9a2;
 Tue, 09 Jul 2024 09:28:54 +0200 (CEST)
Received: by mail-lj1-x22b.google.com with SMTP id
 38308e7fff4ca-2eea8ea8c06so20542691fa.2
 for <xen-devel@lists.xenproject.org>; Tue, 09 Jul 2024 00:28:54 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1fbb6ab75f4sm9566195ad.122.2024.07.09.00.28.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 Jul 2024 00:28:53 -0700 (PDT)
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
X-Inumbo-ID: e596f2f3-3dc4-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1720510134; x=1721114934; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Mw6CtuGRALb1WYKSdjZg7nMr3sxo5WE/PlL4u6rgGiU=;
        b=gx4Rbh0H5MooXf3HlKfGliQD3SMihz6FRr3i5oA5uoRaHchrQA+m4YKlFn/7vwDNQB
         U5Ql3r5i5HPHT4W+KfF2TqJV6LZGSRB289UCqTKTXxMUbt7GF5eQYqv7TSd3ZrMHZ8Y/
         f5y3IG4S7o+Vz1wZ7hano8qNSUEbdb8m1d2ns7TtEsCRq2/oaAneMB6LUlfO6K7zhWZ0
         igGlXlpecmizS4oLiPlDJxxBx25DJ8Vwygs/3naJ/px1GSDw9hyo3vZR8bZ2F8PprxnV
         S+6J1gBX8TyLPwHL7mp2T/pp4qQZaqkHUqn+7AWhnQZYoEFfeGQQceXKK2ZznsII3Ri5
         +YPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720510134; x=1721114934;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Mw6CtuGRALb1WYKSdjZg7nMr3sxo5WE/PlL4u6rgGiU=;
        b=acey26QgS7R1kKp3RYOvH/xeXxNS8yWovfAzBF+/VIz/25NMXh/KBcxRP/hrvXYBtx
         TGETFG3l2hIxOdm3hpYlByvPuVTSs8f0w1p4yjc5QC4gJQ3siMQECdHOFi4cVpPcUr4s
         lHciUqOAR1cve9aKQHC3J+voVyusn9sOLCQyWkeTNRquH/MsTtSGwNvKCRTMQmG0DXMo
         04uOzgzklMyqCyR4m/XGVYnxmIkS5M3AjAoc37QaJyhtAbutLOlrXxRB0J6owfRVDKtx
         nhH/aGifvI+SF13iAJBQILoUGfDLy2nLHHdK13val+DyvOgZ3ySaYcXAGesLLyB90X5H
         6Rmg==
X-Forwarded-Encrypted: i=1; AJvYcCXHjrAcFmCc5d+CIcNIyIg//GwJ+jNyhYeMXsvpqRwrQ2F4mWWtX6VqZnVfYmzBF7IEdlK1vghfn71Xpq3F6LVRmoMM5wBvW22V4GAJjlQ=
X-Gm-Message-State: AOJu0YwpHQf31FCYL43BTWKoDVhbArEnsKGLXBvPyU5yI4+8hoCiA1VA
	MIYCT7NVwge1h9fkJDpMFNv6JP2XmpE+7yQntF7cDMVCCXjKZalTYW23eikVVQ==
X-Google-Smtp-Source: AGHT+IFC82NdiUOqG0nNaqfkHzFm2M24LevO6nJhpLcWcKrk4jd9wGw43CqDGiI4rpB922PirlWMcw==
X-Received: by 2002:ac2:4e09:0:b0:52e:943c:c61a with SMTP id 2adb3069b0e04-52eb99d4bc5mr1080467e87.57.1720510134168;
        Tue, 09 Jul 2024 00:28:54 -0700 (PDT)
Message-ID: <5fad5c8e-a7f0-4536-86ea-b74a3116d122@suse.com>
Date: Tue, 9 Jul 2024 09:28:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v4 12/14] x86/ioreq: guard VIO_realmode_completion
 with CONFIG_VMX
To: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
Cc: Xenia Ragiadakou <burzalodowa@gmail.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xenia Ragiadakou <xenia.ragiadakou@amd.com>, Julien Grall <julien@xen.org>,
 xen-devel@lists.xenproject.org
References: <cover.1720501197.git.Sergiy_Kibrik@epam.com>
 <e6e0f30ea69ecfed4d8de531fc42162162b3f6e5.1720501197.git.Sergiy_Kibrik@epam.com>
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
In-Reply-To: <e6e0f30ea69ecfed4d8de531fc42162162b3f6e5.1720501197.git.Sergiy_Kibrik@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 09.07.2024 08:09, Sergiy Kibrik wrote:
> --- a/xen/arch/x86/include/asm/hvm/ioreq.h
> +++ b/xen/arch/x86/include/asm/hvm/ioreq.h
> @@ -13,6 +13,11 @@
>  #define IOREQ_STATUS_UNHANDLED   X86EMUL_UNHANDLEABLE
>  #define IOREQ_STATUS_RETRY       X86EMUL_RETRY
>  
> +#ifdef CONFIG_VMX
> +bool arch_vcpu_ioreq_completion(enum vio_completion completion);
> +#define arch_vcpu_ioreq_completion
> +#endif

Putting the (or some kind of) #define here is certainly fine, but moving ...

> --- a/xen/include/xen/ioreq.h
> +++ b/xen/include/xen/ioreq.h
> @@ -111,7 +111,6 @@ void ioreq_domain_init(struct domain *d);
>  int ioreq_server_dm_op(struct xen_dm_op *op, struct domain *d, bool *const_op);
>  
>  bool arch_ioreq_complete_mmio(void);
> -bool arch_vcpu_ioreq_completion(enum vio_completion completion);
>  int arch_ioreq_server_map_pages(struct ioreq_server *s);
>  void arch_ioreq_server_unmap_pages(struct ioreq_server *s);
>  void arch_ioreq_server_enable(struct ioreq_server *s);

... the declaration from here requires that all architectures wanting to
implement the function need to have identical copies. That's unnecessary
risk of going out of sync.

As to the #define itself: It expanding to nothing means the call site
de-generates to

#ifdef arch_vcpu_ioreq_completion
        res = (completion);
#else

which hardly is what is meant (despite compiling fine, and it likely
only being Eclair which would then tell us about the issue). Further
there you're also removing a blank line, I don't see why you're doing
that.

Jan

