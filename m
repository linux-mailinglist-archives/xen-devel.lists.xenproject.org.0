Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 85E0C98FB61
	for <lists+xen-devel@lfdr.de>; Fri,  4 Oct 2024 02:04:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.809909.1222481 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1swVo0-0003dN-97; Fri, 04 Oct 2024 00:04:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 809909.1222481; Fri, 04 Oct 2024 00:04:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1swVo0-0003ao-66; Fri, 04 Oct 2024 00:04:24 +0000
Received: by outflank-mailman (input) for mailman id 809909;
 Fri, 04 Oct 2024 00:04:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6kl2=RA=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1swVnz-0003ai-KT
 for xen-devel@lists.xenproject.org; Fri, 04 Oct 2024 00:04:23 +0000
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [2a00:1450:4864:20::62d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 34ecf926-81e4-11ef-99a2-01e77a169b0f;
 Fri, 04 Oct 2024 02:04:21 +0200 (CEST)
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-a7a843bef98so201179166b.2
 for <xen-devel@lists.xenproject.org>; Thu, 03 Oct 2024 17:04:21 -0700 (PDT)
Received: from [192.168.1.10] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a99102a5826sm147243366b.75.2024.10.03.17.04.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 03 Oct 2024 17:04:20 -0700 (PDT)
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
X-Inumbo-ID: 34ecf926-81e4-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1728000261; x=1728605061; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=oieaasUCTDiXWxIFmQ51JMO7kNecMcKXsjoJ87ii7BQ=;
        b=cOSrewVaFdEiP+UhmkT4pwksx1EAIdvdbjejVogyorPhkLPF35iYUTgeQq0vQL7Ox9
         lk99TnxUw8s0OYCpfKM1GrfDHt/sW56ZYOBTOXy4e+dI5dnb2/fqLead67qAewjbfw6z
         ullSm/mS1QTvVFI3pvZzeSvfTgs60UFwR+8As=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728000261; x=1728605061;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oieaasUCTDiXWxIFmQ51JMO7kNecMcKXsjoJ87ii7BQ=;
        b=cnYGYh0UV/lBsSW1SomvpNzA/zzrHbdBHYcDHtW9p6YcsPdxhC2w9SoYpVW8Mv8CgP
         G8QLhM/GzZjyQ2tWUHOHYRtmZva3JKqEi6P1tyDKNugTeGdqCM+hcv35NuQn2FAX3pmW
         9mxA/kqRz2BY2jCaiUiS53CknI6XeoJY+8ioJGhdctMpxuZ9Qg644jo5XnVqUjESPO7x
         WOTpiK1XYAfqeC34H38CyQ9ue0w7ONSutSxo5tIk7zx6vEiVuI6SzhJB7ohbqytHjeQX
         +cF85X85uUEF8wAg4ogPdeHimHBl/MWhVSus665gxC953wWtjEERHRmqy4M1GD3CPRyH
         6vNg==
X-Forwarded-Encrypted: i=1; AJvYcCW+dQmdG4Gj3E6gb9y70Gjcg7A7Egn+TSs4kp4HkgQDOtXRlizsdZUyraoRO0Z5F3bBTRM9HdUehJo=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzF2zPCH1DF1OgvrEGegUkom7azIb+Cq2oXO46BvA56NueqD31K
	pG/FLY4bZH32iYufjPP3isOnd91gOnw+Jd5ICBqBPwaVm/xDc8kyFkQlbW7ylYc=
X-Google-Smtp-Source: AGHT+IFkzo/GtJJ6PXpOBF8/aIy1GKO1LA/jxZ3s9koIWSuQnyuVT3qjv3/88E+UO1vBgLL+2cdBog==
X-Received: by 2002:a17:907:d857:b0:a8d:29b7:ecea with SMTP id a640c23a62f3a-a991bff2bb5mr77188566b.61.1728000260571;
        Thu, 03 Oct 2024 17:04:20 -0700 (PDT)
Message-ID: <b94f3e2f-651f-4806-979b-61fcbe582d38@citrix.com>
Date: Fri, 4 Oct 2024 01:04:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] x86/fpu: Split fpu_setup_fpu() in three
To: Alejandro Vallejo <alejandro.vallejo@cloud.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>
References: <20240813142119.29012-1-alejandro.vallejo@cloud.com>
 <20240813142119.29012-3-alejandro.vallejo@cloud.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20240813142119.29012-3-alejandro.vallejo@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 13/08/2024 3:21 pm, Alejandro Vallejo wrote:
> It was trying to do too many things at once and there was no clear way of
> defining what it was meant to do. This commit splits the function in three.
>
>   1. A function to return the FPU to power-on reset values.
>   2. A function to return the FPU to default values.
>   3. A x87/SSE state loader (equivalent to the old function when it took a data
>      pointer).
>
> While at it, make sure the abridged tag is consistent with the manuals and
> start as 0xFF.
>
> Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>

fpu_setup_fpu() definitely needs splitting, and it was doing many things
before, but...

> diff --git a/xen/arch/x86/include/asm/i387.h b/xen/arch/x86/include/asm/i387.h
> index a783549db991..7a69577de45b 100644
> --- a/xen/arch/x86/include/asm/i387.h
> +++ b/xen/arch/x86/include/asm/i387.h
> @@ -31,10 +31,30 @@ void vcpu_restore_fpu_nonlazy(struct vcpu *v, bool need_stts);
>  void vcpu_restore_fpu_lazy(struct vcpu *v);
>  void vcpu_save_fpu(struct vcpu *v);
>  void save_fpu_enable(void);
> -
>  int vcpu_init_fpu(struct vcpu *v);
> -struct xsave_struct;
> -void vcpu_setup_fpu(struct vcpu *v, struct xsave_struct *xsave_area,
> -                    const void *data, unsigned int fcw_default);
>  void vcpu_destroy_fpu(struct vcpu *v);
> +
> +/*
> + * Restore v's FPU to power-on reset values
> + *
> + * @param v vCPU containing the FPU
> + */
> +void vcpu_reset_fpu(struct vcpu *v);
> +
> +/*
> + * Restore v's FPU to default values
> + *
> + * @param v vCPU containing the FPU
> + */
> +void vcpu_default_fpu(struct vcpu *v);

... whether this is an accurate transform of the logic or not, we
oughtn't to have both.

AFAICT, these two functions differ only in the choice of FCW constant,
and whether FTW gets a nonzero value or not.


The x86 architecture has #RESET and #INIT states (and Xen is especially
bad at these right now).  They're well defined in the SDM/APM;  #RESET
zeroes most things but leaves FCW=0x40 and FTW=0x5555 (for which the
FXSAVE mapping is 0xFF).  #INIT leaves everything unmodified.

[After a very long manual-diving session.  Thankyou Christian]


The 80287's #RESET and F(N)INIT instructions were broadly similar.  They
differed on whether they changed the addressing mode[1] but both cases
set FCW=0x37f and FTW=0x5555.

The 80387 intentionally diverged #RESET and FNINIT, with #RESET setting
FCW=0x40.  This had a side effect of asserting #ERROR, and software is
required to execute FNINIT which sets FCW=0x37f and de-asserts #ERROR

Why?  From the 387's programmers reference:

---%<---
6.2.2  Hardware Recognition of the NPX

The 80386 identifies the type of its coprocessor (80287 or 80387) by
sampling its ERROR# input some time after the falling edge of RESET and
before executing the first ESC instruction. The 80287 keeps its ERROR#
output in inactive state after hardware reset; the 80387 keeps its
ERROR# output in active state after hardware reset. The 80386 records
this difference in the ET bit of control register zero (CR0). The 80386
subsequently uses ET to control its interface with the coprocessor. If
ET is set, it employs the 32-bit protocol of the 80387; if ET is not
set, it employs the 16-bit protocol of the 80287.

<snip>

6.2.5  Initializing the 80387

Initializing the 80387 NPX simply means placing the NPX in a known state
unaffected by any activity performed earlier. A single FNINIT
instruction performs this initialization. All the error masks are set,
all registers are tagged empty, TOP is set to zero, and default rounding
and precision controls are set. Table 6-1 shows the state of the 80387
NPX following FINIT or FNINIT. This state is compatible with that of the
80287 after FINIT or after hardware RESET.
---%<---

The 486 gets even more complicated, but I've been writing this email for
long enough.

So, 0x40 is the correct reset value for the 386/387 and later, hence why
that's what the SDM/APM say these days.


As for Xen.  For HVM guests, setting FCW=0x37f is definitely wrong.

For PV guests, things are ill-defined, but software has been required to
issue FNINIT for 4 decades already (even MiniOS does!) so I find myself
dis-interested in trying to maintain compatibility for coprocessor which
predates Xen by ~15y.

You're already playing with FTW too (vs the old logic), so please drop
vcpu_default_fpu() and just use vcpu_reset_fpu() instead.

As a bonus, it lets you delete yet-more code, but it also needs to come
with a rework of the commit message.  I'd aim for less "split in 3" and
more "delete and write something sane". 


> +
> +/*
> + * Load x87/SSE state into v's FPU
> + *
> + * Overrides the XSAVE header to set the state components to be x87 and SSE.
> + *
> + * @param v    vCPU containing the FPU
> + * @param data 512-octet blob for x87/SSE state
> + */
> +void vcpu_setup_fpu(struct vcpu *v, const void *data);
>  #endif /* __ASM_I386_I387_H */
> diff --git a/xen/arch/x86/include/asm/xstate.h b/xen/arch/x86/include/asm/xstate.h
> index ebeb2a3dcaf9..6144ed6f8551 100644
> --- a/xen/arch/x86/include/asm/xstate.h
> +++ b/xen/arch/x86/include/asm/xstate.h
> @@ -14,6 +14,7 @@
>  
>  #define FCW_DEFAULT               0x037f
>  #define FCW_RESET                 0x0040
> +#define FTW_RESET                 0xFF

This isn't a tag word reset value.  The value for that would be 0x5555.

I'd suggest:

#define FXSAVE_FTW_RESET   0xff /* Abridged Tag Word format */

for want of anything better.  At least this name makes it clear it's
specifically for the FXSAVE format.

~Andrew

[1] the 286, (in)famously couldn't leave protected mode, and neither
could the 287 it seems.

