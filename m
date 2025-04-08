Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 693C1A80CA8
	for <lists+xen-devel@lfdr.de>; Tue,  8 Apr 2025 15:42:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.942143.1341411 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u29Dd-0002NT-Rf; Tue, 08 Apr 2025 13:42:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 942143.1341411; Tue, 08 Apr 2025 13:42:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u29Dd-0002Mz-NY; Tue, 08 Apr 2025 13:42:25 +0000
Received: by outflank-mailman (input) for mailman id 942143;
 Tue, 08 Apr 2025 13:42:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xdvb=W2=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1u29Dc-0002M8-BQ
 for xen-devel@lists.xenproject.org; Tue, 08 Apr 2025 13:42:24 +0000
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [2a00:1450:4864:20::331])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4c371a26-147f-11f0-9ffb-bf95429c2676;
 Tue, 08 Apr 2025 15:42:22 +0200 (CEST)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-43ede096d73so23876905e9.2
 for <xen-devel@lists.xenproject.org>; Tue, 08 Apr 2025 06:42:22 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43ec17b3572sm165566935e9.39.2025.04.08.06.42.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Apr 2025 06:42:21 -0700 (PDT)
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
X-Inumbo-ID: 4c371a26-147f-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1744119741; x=1744724541; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=R0F+97vDHSfn7Dtg+WrWKXqktzoIh+d1ZOvOEQ4/CRw=;
        b=NzzOHgrBwHr42KCqVFOQ+XL8Fu3OMCWoqX4k/jGHnystjFXDOKOr8BlSRmKNPA+ASl
         52GfKBFIK9UQ0N4YclTJHGRipTZA9tnalYbY6tejhhSYVhU6Tbxsj22bWsQha5Wjk1jX
         VXcxa+FwuU7J90t1jFdVH09FHZCZU4trtXChCoQt/h8+MJyvV9Ycpzy7Jqc0JshA7o5k
         A4uadks5q4jh9LOsGq862oiF5hWNnBSSbeQRCWtHpnNukBFrRJvtna2mA0HtOn636E+Y
         RE80LuOiVswHwYuL5tq7v56v5WwR0q3EOR55yN7XbFzJaoerEtsvXhz+WOaXu+Ioyu6R
         PPCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744119741; x=1744724541;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R0F+97vDHSfn7Dtg+WrWKXqktzoIh+d1ZOvOEQ4/CRw=;
        b=Dbx0E0Fn1s24Ah3SkD1GvUJn8Tbxei0F6rASrAV35d58OH0RXWXiGImSHkDHCoI6b1
         V+/ZU/dLcBxiqBwy5F1yqY2qAt6V9lxMv+DH4yysOxsJ/1fgoyfbPdxy3kV+HvbwFcZG
         sMAJ3zUrlY/LrWv3UDeW3fjlVb5CITdXK+fQClUYojj4GcCBfy7m26nVHTfsAqqSdsWJ
         8Xb2m3En3yjhRh3/q+QdDd+q4qOZRgYt9LtDlLxm9ZULsU4L7bPWppApLGBBeXiQrdLG
         zqP23Lnp7QxqZ6pVGphe229awpjSjj8SbiL/4vs0zYr7AjjqpjGpx9+8RzXDsPP1Kq4T
         hcTw==
X-Forwarded-Encrypted: i=1; AJvYcCXDNUYTnx16Of0GUhswCUIBXo1O0PEoFh2NsddYTQHJ/PndNNmf3f/x2OpaMEQ7NshgLkk0z+80i3U=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yx3swkLMa0xejCKXOGAM5jRvT0MejjAGNfzOA2Lh9ascvnIXJ2i
	q/0437VbuIxEIlZzqRhmPGihYgtKLZ5C46uErKGbXY7lwOn4drBaY+VOB8QZ2Q==
X-Gm-Gg: ASbGncvOMkncRmoHXgv+LRJb+HdfLXor2cObKuDr8E4imWpxsylz8eVfSDbtJuC/NvQ
	4l3gflg7R0o6ali34X3TEM3570zP9kIpP0Yp5BpN7b2AdwyMqTUStRZkGKjfo6IsOJ4pRq2F3+q
	YeWsiz1lfM3+nk44++V7uv9eE/YlbiiMFV/Qas1VpiNS905nDwx4TWNd4ZeQ/gR3PRkuFuPOa8X
	sFbMFwOZc88T4fgM+tumdGh6BUG+nci0iIG8p8tbZny5IXPlEhlZd5k0Os8qsmmjWy2WBtnpjxb
	COP9v/o/3O8iCFVqeYHqIULkKPr+YAuniCtL+7e8fweCicUxcLbn+CrBmIx9+SE5LXfgYRzByec
	Fw6AhytcHYNYE6jI4kTR57uKDWHbznQ==
X-Google-Smtp-Source: AGHT+IFMsaQg1mVrzS7+aUtz6Q4q2QuNMpPwYoloHBtjiTRKlKia+q5bhYQNA4SF/YcKiWwV4mML8g==
X-Received: by 2002:a05:600c:1d12:b0:43c:fd72:f028 with SMTP id 5b1f17b1804b1-43ed0db3ba4mr155568555e9.29.1744119741634;
        Tue, 08 Apr 2025 06:42:21 -0700 (PDT)
Message-ID: <4e047ee6-8f13-4d18-a62c-b7cd36b3fd4e@suse.com>
Date: Tue, 8 Apr 2025 15:42:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] x86/hvm: remove unreachable MMCFG write emulation
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
References: <20250408093156.83277-1-roger.pau@citrix.com>
 <20250408093156.83277-2-roger.pau@citrix.com>
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
In-Reply-To: <20250408093156.83277-2-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 08.04.2025 11:31, Roger Pau Monne wrote:
> The current implementation of PVH dom0 relies on vPCI to trap and handle
> accesses to the MMCFG area.  Previous implementation of PVH dom0 (v1)
> didn't have vPCI, and as a classic PV dom0, relied on the MMCFG range being
> RO.  As such hvm_emulate_one_mmio() had to special case write accesses to
> the MMCFG area.
> 
> With PVH dom0 using vPCI, and the MMCFG accesses being fully handled there,
> hvm_emulate_one_mmio() should never handle accesses to MMCFG, making the
> code effectively unreachable.
> 
> Remove it and leave an ASSERT to make sure MMCFG accesses never get into
> hvm_emulate_one_mmio().  As a result of the removal of one of the users of
> mmcfg_intercept_write(), the function can now be moved into the same
> translation unit where it's solely used, allowing it to be made static and
> effectively built only when PV support is enabled.
> 
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>
with one cosmetic suggestion:

> --- a/xen/arch/x86/hvm/emulate.c
> +++ b/xen/arch/x86/hvm/emulate.c
> @@ -2858,12 +2858,6 @@ int hvm_emulate_one(
>  
>  int hvm_emulate_one_mmio(unsigned long mfn, unsigned long gla)
>  {
> -    static const struct x86_emulate_ops hvm_intercept_ops_mmcfg = {
> -        .read       = x86emul_unhandleable_rw,
> -        .insn_fetch = hvmemul_insn_fetch,
> -        .write      = mmcfg_intercept_write,
> -        .validate   = hvmemul_validate,
> -    };
>      static const struct x86_emulate_ops hvm_ro_emulate_ops_mmio = {
>          .read       = x86emul_unhandleable_rw,
>          .insn_fetch = hvmemul_insn_fetch,
> @@ -2872,28 +2866,28 @@ int hvm_emulate_one_mmio(unsigned long mfn, unsigned long gla)
>      };
>      struct mmio_ro_emulate_ctxt mmio_ro_ctxt = { .cr2 = gla, .mfn = _mfn(mfn) };
>      struct hvm_emulate_ctxt ctxt;
> -    const struct x86_emulate_ops *ops;
>      unsigned int seg, bdf;
>      int rc;
>  
>      if ( pci_ro_mmcfg_decode(mfn, &seg, &bdf) )
>      {
> -        mmio_ro_ctxt.seg = seg;
> -        mmio_ro_ctxt.bdf = bdf;
> -        ops = &hvm_intercept_ops_mmcfg;
> +        /* Should be always handled by vPCI for PVH dom0. */
> +        gdprintk(XENLOG_ERR, "unhandled MMCFG access for %pp\n",
> +                 &PCI_SBDF(seg, bdf));
> +        ASSERT_UNREACHABLE();
> +        return X86EMUL_UNHANDLEABLE;
>      }
> -    else
> -        ops = &hvm_ro_emulate_ops_mmio;
>  
>      hvm_emulate_init_once(&ctxt, x86_insn_is_mem_write,
>                            guest_cpu_user_regs());
>      ctxt.ctxt.data = &mmio_ro_ctxt;
>  
> -    switch ( rc = _hvm_emulate_one(&ctxt, ops, VIO_no_completion) )
> +    switch ( rc = _hvm_emulate_one(&ctxt, &hvm_ro_emulate_ops_mmio,
> +                                   VIO_no_completion) )
>      {
>      case X86EMUL_UNHANDLEABLE:
>      case X86EMUL_UNIMPLEMENTED:
> -        hvm_dump_emulation_state(XENLOG_G_WARNING, "MMCFG", &ctxt, rc);
> +        hvm_dump_emulation_state(XENLOG_G_WARNING, "RO MMIO", &ctxt, rc);

The string doesn't need to be all capitals (see other uses of the function).
How about "r/o MMIO"?

Jan

