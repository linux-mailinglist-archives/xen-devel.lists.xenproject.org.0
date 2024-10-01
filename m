Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5106398B541
	for <lists+xen-devel@lfdr.de>; Tue,  1 Oct 2024 09:12:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.807753.1219389 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1svX2k-0004h4-3j; Tue, 01 Oct 2024 07:11:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 807753.1219389; Tue, 01 Oct 2024 07:11:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1svX2k-0004dx-0B; Tue, 01 Oct 2024 07:11:34 +0000
Received: by outflank-mailman (input) for mailman id 807753;
 Tue, 01 Oct 2024 07:11:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jjk+=Q5=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1svX2i-0004dr-Gr
 for xen-devel@lists.xenproject.org; Tue, 01 Oct 2024 07:11:32 +0000
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [2a00:1450:4864:20::632])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6168369a-7fc4-11ef-a0ba-8be0dac302b0;
 Tue, 01 Oct 2024 09:11:31 +0200 (CEST)
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-a8a6d1766a7so752037266b.3
 for <xen-devel@lists.xenproject.org>; Tue, 01 Oct 2024 00:11:31 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a93c2978f14sm666055766b.149.2024.10.01.00.11.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Oct 2024 00:11:28 -0700 (PDT)
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
X-Inumbo-ID: 6168369a-7fc4-11ef-a0ba-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1727766689; x=1728371489; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=f5j8pXeTpP1J7tFjGmhfnuw1XIVE3NwwH4Cee95KIrQ=;
        b=Fc4z/BLtjdTdHUcmJX9ffzzySOn4O1IZj7ZktnFAeHF26THiZVv0yKXv4zeZyIztFh
         MF7T/d58UYXfLdIZB9lnAQagfBycre0Z6SgQA++0FAFcuieg1sKQgNCLyDHcRXIwvE7A
         XCUpmMCyjTLk1PXUtcjcsOduiAdPE/d9EtMx64CZA/mI3QUnIOkYCkswMtY0wILmsYK9
         +rpy33LEYmVSNrY++heCU8XWZ8X/ORV7oNDm2w940syMHH7a/yLrQLVIZoTCuok8qLjn
         4gnH7+Zrc6gez6x9l0DMes+Zpmb+BnzVCZ1JbaVHSj/N+r5dYRIF+5GtkX1Fd42IeW8K
         Tpkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727766689; x=1728371489;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f5j8pXeTpP1J7tFjGmhfnuw1XIVE3NwwH4Cee95KIrQ=;
        b=hlDxYbtlC42NT4BsFofwKkqhyRG3Lx+uuv8Iyl9zYREf4Q40UrOVH1M1I8bZBiOn5N
         k771fDOIDeeTEXWm/q+w+4jqiriRFaXBUKE5i80kngT+f777x3Jta+1l0wUuDQWfCCpq
         32rWu/UGZ7TddNaaUO4yJwLje8CGMdeovEVjPFeNY4meIio3CdqSJRdf93iLEYZjyNyZ
         KyPN5QeuNyn+wKxM0+TmovtSVMcMButGV1Z9iskm4fZkJ3BdgD1jwBEuvQAMw7kpTV6G
         hbNiaqJMifYS6NKGL5x8k4EQWl/jS/2j5cxTnFkexLvsn+kbAVFPXS+uHn7DLtrSzN04
         lkZw==
X-Forwarded-Encrypted: i=1; AJvYcCXp2M6R1Pw9408e9ovYBwqJCzIZWjO2QJ8YpeDgsxOwoHDy2ximeoCiS7xuD1lNgLcVZY9KHZ9NNs8=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxAQDEAkUsaI0Zxrcz32SZdCyjIaT0ri20JrCNCbzBMFkEXuYhL
	FiTEOy49qtZLwV6gTj2Mu0yHttieRmDqZegcj5nExolmgiVO9F2ZlB86M9WNo3w7I6Ft9xY0IkA
	=
X-Google-Smtp-Source: AGHT+IFMSBsomuLjw+G2UfMZkYZqe5S9EgG5MkonLuzeOs5b8IPGch+b1kC6RDY1t+LFHTqYfG864g==
X-Received: by 2002:a17:907:948a:b0:a86:8917:fcd6 with SMTP id a640c23a62f3a-a93c4c2ef49mr1424803666b.60.1727766689157;
        Tue, 01 Oct 2024 00:11:29 -0700 (PDT)
Message-ID: <76819790-abde-4b61-8dd7-68dd9db8cfd1@suse.com>
Date: Tue, 1 Oct 2024 09:11:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] x86/pv: Rework guest_io_okay() to return X86EMUL_*
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20240930161837.1248144-1-andrew.cooper3@citrix.com>
 <20240930161837.1248144-2-andrew.cooper3@citrix.com>
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
In-Reply-To: <20240930161837.1248144-2-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 30.09.2024 18:18, Andrew Cooper wrote:
> In order to fix a bug with guest_io_okay() (subsequent patch), rework
> guest_io_okay() to take in an emulation context, and return X86EMUL_* rather
> than a boolean.
> 
> For the failing case, take the opporunity to inject #GP explicitly, rather
> than returning X86EMUL_UNHANDLEABLE.  There is a logical difference between
> "we know what this is, and it's #GP", vs "we don't know what this is".
> 
> There is no change in practice as emulation is the final step on general #GP
> resolution, but returning X86EMUL_UNHANDLEABLE would be a latent bug if a
> subsequent action were to appear.
> 
> No practical change.

I think there is a small functional difference, see below.

> --- a/xen/arch/x86/pv/emul-priv-op.c
> +++ b/xen/arch/x86/pv/emul-priv-op.c
> @@ -156,14 +156,16 @@ static bool iopl_ok(const struct vcpu *v, const struct cpu_user_regs *regs)
>  }
>  
>  /* Has the guest requested sufficient permission for this I/O access? */
> -static bool guest_io_okay(unsigned int port, unsigned int bytes,
> -                          struct vcpu *v, struct cpu_user_regs *regs)
> +static int guest_io_okay(unsigned int port, unsigned int bytes,
> +                         struct x86_emulate_ctxt *ctxt)
>  {
> +    struct cpu_user_regs *regs = ctxt->regs;

const?

> @@ -190,10 +192,12 @@ static bool guest_io_okay(unsigned int port, unsigned int bytes,
>              toggle_guest_pt(v);
>  
>          if ( (x.mask & (((1 << bytes) - 1) << (port & 7))) == 0 )
> -            return true;
> +            return X86EMUL_OKAY;
>      }
>  
> -    return false;
> +    x86_emul_hw_exception(X86_EXC_GP, 0, ctxt);

do_general_protection() has

    /* Pass on GPF as is. */
    pv_inject_hw_exception(X86_EXC_GP, regs->error_code);

which may make a difference in case the insn changes under our feet.
The new behavior may even be deemed better, but the description then
would want to admit to this slight functional change. Then
Reviewed-by: Jan Beulich <jbeulich@suse.com>

Jan

