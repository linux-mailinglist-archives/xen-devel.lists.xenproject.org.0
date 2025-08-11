Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6095BB20801
	for <lists+xen-devel@lfdr.de>; Mon, 11 Aug 2025 13:39:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1077509.1438565 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ulQrX-0006Qh-Qv; Mon, 11 Aug 2025 11:38:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1077509.1438565; Mon, 11 Aug 2025 11:38:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ulQrX-0006PG-O4; Mon, 11 Aug 2025 11:38:47 +0000
Received: by outflank-mailman (input) for mailman id 1077509;
 Mon, 11 Aug 2025 11:38:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=92re=2X=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1ulQrW-0006P6-DW
 for xen-devel@lists.xenproject.org; Mon, 11 Aug 2025 11:38:46 +0000
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [2a00:1450:4864:20::333])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bc7719a4-76a7-11f0-b898-0df219b8e170;
 Mon, 11 Aug 2025 13:38:44 +0200 (CEST)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-459d62184c9so24453695e9.1
 for <xen-devel@lists.xenproject.org>; Mon, 11 Aug 2025 04:38:44 -0700 (PDT)
Received: from [192.168.1.183] (host-195-149-20-212.as13285.net.
 [195.149.20.212]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-459e585586esm266337595e9.13.2025.08.11.04.38.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Aug 2025 04:38:43 -0700 (PDT)
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
X-Inumbo-ID: bc7719a4-76a7-11f0-b898-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1754912323; x=1755517123; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=qqjOfXFMmZAfftxklX2kz4tF2SaqqC01TwGBHxbvoUo=;
        b=dXOqlR6No1YHqHSc3RLDg9YBElw1HesjbWJLS/P+d+RBAhRxfhGQU3khScsJCGfNcH
         ioXbF7n7aNZmbp38d0k5W5nzem620KgU/Fc1Zy/pYbw4KR1w5/VrjhswaZN53/fpupFo
         CF9jD9uEF41h7DR6v0WePYeP+//qCN4c/bpJc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754912323; x=1755517123;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qqjOfXFMmZAfftxklX2kz4tF2SaqqC01TwGBHxbvoUo=;
        b=E2yL1J0mI9DsvN83YFnAe+DYW0Fyfv+F5REf1zDfXZ/FjmXAmwCrzBScPmNbvbRfmn
         kQ3isHa9fKIFPr5on+eB0Nd/RZSYFAJJJPZjQ0HtzfsoTTvWhmuNi0AZXVDU2/mFi6bl
         zWRR+oeIcgKOnkqUeOdsM2ReomCGFsBF6CNgtedavwH/in2cz0r5az+xVpORbxgD7ZtO
         gZR4QGdZuB2TnGq8bNnEpbM/2FgdS1hOxTePsujmbaW2LAhRPn3yyzY73WbIPIQBZeeM
         7m2Fp5J5JPmw+Vps5LiuZo5KTkkk/Oqs4DrA1WaXUoiQxNNz5Sw1y+I5w3MNe+2nTDdX
         H1nw==
X-Gm-Message-State: AOJu0YyWsnbtGsEbED9LydwxsaqMhZGcT2/A360FsHR5STtIKWRXTWTH
	KtzwwQmbyNhZbQIcp9rDnkxQN0CS3DVAaEwjbMpUvFIv5lw4EsXgTzhElgnXlGG+CI2BO64rr93
	3tU2+5tE=
X-Gm-Gg: ASbGncs9J7N7KSqGjpYh+ONn/Hrhjrs81qzfPzfBfXJo5fvKjZzw+hM2htQ1UnjA0NK
	UjYTSKiTvn+526UZo/JT21LOOB0qTMvXHx4gNfYb/LVuHj4sUgH23PRM6i8G0OSwR0KMaYSjFx8
	PlpWb5CZo3kp2X9hQ0EZr4aWGvU1IoVeYP9ELyvWtPRBhqCiXPJQrG6XYeOydYL3DysBtG3fylF
	2M85YE7+hCUweDOSSCnm42NK4lotL3759J0/wYxBV7m0dDjlEEXOwgHeyREaIX8yi+cAa5WN/cA
	Zqm96QwtvIAG+tnNQPNiv7tXW36+pbtWbOxxKldLQQgKpBuSazq6IDCYT43LR2lPmlAYMapw85/
	iJMwsU0IDkCQPtO2tHWB+b/o7Ugxxh0L4VC7QzvZkSK3nN7v91PVfMqNfKt6KdYDKR6fK
X-Google-Smtp-Source: AGHT+IFZ7boyfhDojHkKAwsqaOJHH7JJU4Mv0CwImghiMqBQEgT3sMQ2pIoFwsUUykHqYzSPlr8N/Q==
X-Received: by 2002:a05:600c:310d:b0:459:aa0a:db2d with SMTP id 5b1f17b1804b1-459f4f141bdmr93580155e9.28.1754912323517;
        Mon, 11 Aug 2025 04:38:43 -0700 (PDT)
Message-ID: <59303864-c6c7-4d6c-be43-8cf9a887cfe2@citrix.com>
Date: Mon, 11 Aug 2025 12:38:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 21/22] x86/traps: Introduce FRED entrypoints
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Jan Beulich <JBeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>
References: <20250808202314.1045968-1-andrew.cooper3@citrix.com>
 <20250808202314.1045968-22-andrew.cooper3@citrix.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20250808202314.1045968-22-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 08/08/2025 9:23 pm, Andrew Cooper wrote:
> diff --git a/xen/arch/x86/traps.c b/xen/arch/x86/traps.c
> index 270b93ed623e..e67a428e4362 100644
> --- a/xen/arch/x86/traps.c
> +++ b/xen/arch/x86/traps.c
> @@ -2181,6 +2240,94 @@ void asmlinkage check_ist_exit(const struct cpu_user_regs *regs, bool ist_exit)
>  }
>  #endif
>  
> +void asmlinkage entry_from_pv(struct cpu_user_regs *regs)
> +{
> +    /* Copy fred_ss.vector into entry_vector as IDT delivery would have done. */
> +    regs->entry_vector = regs->fred_ss.vector;
> +
> +    switch ( regs->fred_ss.type )
> +    {
> +    case X86_ET_EXT_INTR:
> +        do_IRQ(regs);
> +        break;
> +
> +    case X86_ET_NMI:
> +        do_nmi(regs);
> +        break;
> +
> +    case X86_ET_HW_EXC:
> +    case X86_ET_SW_INT:
> +    case X86_ET_PRIV_SW_EXC:
> +    case X86_ET_SW_EXC:
> +        goto fatal;
> +
> +    default:
> +        goto fatal;
> +    }
> +
> +    return;
> +
> + fatal:
> +    fatal_trap(regs, false);
> +}
> +
> +void asmlinkage entry_from_xen(struct cpu_user_regs *regs)
> +{
> +    /* Copy fred_ss.vector into entry_vector as IDT delivery would have done. */
> +    regs->entry_vector = regs->fred_ss.vector;
> +
> +    switch ( regs->fred_ss.type )
> +    {
> +    case X86_ET_EXT_INTR:
> +        do_IRQ(regs);
> +        break;
> +
> +    case X86_ET_NMI:
> +        do_nmi(regs);
> +        break;
> +
> +    case X86_ET_HW_EXC:
> +    case X86_ET_SW_INT:
> +    case X86_ET_PRIV_SW_EXC:
> +    case X86_ET_SW_EXC:
> +        switch ( regs->fred_ss.vector )
> +        {
> +        case X86_EXC_PF:  do_page_fault(regs); break;
> +        case X86_EXC_GP:  do_general_protection(regs); break;
> +        case X86_EXC_UD:  do_invalid_op(regs); break;
> +        case X86_EXC_NM:  do_device_not_available(regs); break;
> +        case X86_EXC_BP:  do_int3(regs); break;
> +        case X86_EXC_DB:  do_debug(regs); break;
> +        case X86_EXC_DF:  do_double_fault(regs); break;
> +
> +        case X86_EXC_DE:
> +        case X86_EXC_OF:
> +        case X86_EXC_BR:
> +        case X86_EXC_NP:
> +        case X86_EXC_SS:
> +        case X86_EXC_MF:
> +        case X86_EXC_AC:
> +        case X86_EXC_XM:
> +            do_trap(regs);
> +            break;
> +
> +        case X86_EXC_CP:  do_entry_CP(regs); break;
> +
> +        default:
> +            goto fatal;
> +        }
> +        break;
> +
> +    default:
> +        goto fatal;
> +    }
> +
> +    return;
> +
> + fatal:
> +    fatal_trap(regs, false);
> +}

Having started work on the PV support, I think this patch needs to
change somewhat.

I've split #DB and #PF to have separate IDT prologues, which in turns
gives us uniform handling of IRQ re-enabling for synchronous actions. 
But, async still needs special handling.

I think we want something that looks more like:

    switch ( regs->fred_ss.type )
    {
    case X86_ET_EXT_INTR: return do_IRQ(regs);
    case X86_ET_NMI:      return do_nmi(regs);
    case X86_ET_HW_EXC:
        if ( regs->fred_ss.vector == X86_EXC_MC )
            return do_machine_check(regs);
        break;
    }

    if ( regs->eflags & X86_EFLAGS_IF ) // From Xen only
        local_irq_enable();             // From both

    switch ( regs->fred_ss.type )


Either way, it's probably not worth focusing too much on how the C in
this patch looks for now.

~Andrew

