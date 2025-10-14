Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C582EBDB135
	for <lists+xen-devel@lfdr.de>; Tue, 14 Oct 2025 21:37:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1143015.1476879 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v8kox-0000ev-Eh; Tue, 14 Oct 2025 19:36:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1143015.1476879; Tue, 14 Oct 2025 19:36:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v8kox-0000c3-BR; Tue, 14 Oct 2025 19:36:31 +0000
Received: by outflank-mailman (input) for mailman id 1143015;
 Tue, 14 Oct 2025 19:36:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/xUX=4X=citrix.com=andrew.cooper3@srs-se1.protection.inumbo.net>)
 id 1v8kow-0000bx-4D
 for xen-devel@lists.xenproject.org; Tue, 14 Oct 2025 19:36:30 +0000
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [2a00:1450:4864:20::336])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 145ef198-a935-11f0-9d15-b5c5bf9af7f9;
 Tue, 14 Oct 2025 21:36:29 +0200 (CEST)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-46e34bd8eb2so58516015e9.3
 for <xen-devel@lists.xenproject.org>; Tue, 14 Oct 2025 12:36:29 -0700 (PDT)
Received: from [192.168.1.183] (host-92-22-57-86.as13285.net. [92.22.57.86])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-46fc155143fsm210087795e9.11.2025.10.14.12.36.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Oct 2025 12:36:27 -0700 (PDT)
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
X-Inumbo-ID: 145ef198-a935-11f0-9d15-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1760470588; x=1761075388; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=E3bECPcy+WbjoF33XO56boMzJxiI5m14zSNo7SVvEaw=;
        b=R3BVcBGBrr+Pn985E4IondbkQaPWACASwVhcdeU04mw7GutiKWjTq28FumgxP6oZ6L
         2hllBVBsb+dlkq0JZo9sk4RjeYbbAjMdHKu7lseG62W4YhgRpAHwJYjFSc3Y9zEW9+tI
         4b2xGC0u1APJ44Wcezcwq0zPH5fe+6fUHvZXQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760470588; x=1761075388;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E3bECPcy+WbjoF33XO56boMzJxiI5m14zSNo7SVvEaw=;
        b=smFB9nslSBaaLDAWmoKBnzk47n+K22ILsps2Hmy4WECbgeisU3RE1ff4FnOBuPY74P
         PbKmwAGW0dlkUanhTvSqr1qBgIopjlCTi9oN7w5Jwk/EB1DrVhpqVwoUpjPoBB5VZ+9u
         G/w5/SYAZv0dvsPB0DtY1FByD2kUBSQmYJoFmfFmVs0k3TcK0ovEXrPP3/UoitU9KY/n
         5F81uqqPMO62u8Dm0opQMDv3aPGFpcWtvO9Lh/yjUx30/v5fTm53L0qmNnuDUvsTL7ED
         /kdQebAUkIJvPAuOroqZkSPafQLtUh+qeSouIOET7r3cUkezRO0N0XikxOS3JDk/g+na
         331Q==
X-Forwarded-Encrypted: i=1; AJvYcCXW0c+8ff4NNQZTHZ8KL6JHFodn7KV7DmOvuLtaHV3FqYQt9mo8eGy2b3KphRbmimIRLXt946z7PJc=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzAJYcHABcEB8vFUIE1aLESVp5jiqRwkxOGQoIZIo2RCE8BVsFU
	20unYW+Gl21CO8ET31FBXGmg1D9U/J+etVTEpU0UryuWCLhAtLKp5zdxSmTxIULPNOc=
X-Gm-Gg: ASbGncvKCsRHqukif8mIfYrqjJxXi5WvSzkV5Xqy0lEKHlKIDVrmTPR3dj2FWvsQCoQ
	EFVgU5OA1v6j5vFdgveWX6l7X4ODLP7B7I0OfIMz7I7+vhzHaqYy3DWlKsb31roTYEpFF4MU1DY
	WLrqf9uU/FfozCBb8RuRlh/SdDWQnRfpLYZTMM0iLzY5PdK55srZbzuWTReq+ZrU967kIL5M87w
	4N2vD/n3Ar3S36CKxPM4E5iShAoP8FL8b8WB/CqqF5D7jOba546t6c7LplolMzpoFnP5NvhPy5f
	PlRkLceGdv7kEN76HBRYeC3JkWejRO6f4M5LKpTbb5TydnUJC9nTNVQekoOMAmBTWzOJjOS45/N
	Ap9xqWExxFMGrCmnEgtLOXqEgduwDOLht8CEy5GKXThbe/5ECD/jaAYJ7L9IBwwD2Qu+kEoGvn5
	Uo5PqLA3dvxf45lQ==
X-Google-Smtp-Source: AGHT+IHmI0+87hMOqdGhISarDZ7K86/Jt0oIam8CamDw6TeuJnRBU+uwmSat/243TaOJqlWEzvZT2g==
X-Received: by 2002:a05:600c:c091:b0:46e:59bd:f7d3 with SMTP id 5b1f17b1804b1-46fae33dffamr103194315e9.20.1760470588457;
        Tue, 14 Oct 2025 12:36:28 -0700 (PDT)
Message-ID: <bb9dba9c-3011-4c1a-917d-9d83fcc2c967@citrix.com>
Date: Tue, 14 Oct 2025 20:36:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.21??? 3/3] x86/vLAPIC: properly support the CMCI LVT
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Grygorii Strashko <grygorii_strashko@epam.com>
References: <265d5053-af61-42cb-a3b9-ef60df39c21b@suse.com>
 <61a05ec1-aca7-4c3f-be6f-1bb053b2cd00@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <61a05ec1-aca7-4c3f-be6f-1bb053b2cd00@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 08/10/2025 1:09 pm, Jan Beulich wrote:
> --- a/xen/arch/x86/hvm/vlapic.c
> +++ b/xen/arch/x86/hvm/vlapic.c
> @@ -697,8 +701,17 @@ int guest_rdmsr_x2apic(const struct vcpu
>          return X86EMUL_EXCEPTION;
>  
>      offset = reg << 4;
> -    if ( offset == APIC_ICR )
> +    switch ( offset )
> +    {
> +    case APIC_ICR:
>          high = (uint64_t)vlapic_read_aligned(vlapic, APIC_ICR2) << 32;
> +        break;
> +
> +    case APIC_CMCI:
> +        if ( !(v->arch.vmce.mcg_cap & MCG_CMCI_P) )
> +            return X86EMUL_EXCEPTION;
> +        break;
> +    }
>  
>      *val = high | vlapic_read_aligned(vlapic, offset);
>  
> @@ -868,6 +881,10 @@ void vlapic_reg_write(struct vcpu *v, un
>          vlapic_set_reg(vlapic, APIC_ICR2, val & 0xff000000U);
>          break;
>  
> +    case APIC_CMCI:         /* LVT CMCI */
> +        if ( !(v->arch.vmce.mcg_cap & MCG_CMCI_P) )
> +            break;
> +        fallthrough;
>      case APIC_LVTT:         /* LVT Timer Reg */
>          if ( vlapic_lvtt_tdt(vlapic) !=
>               ((val & APIC_TIMER_MODE_MASK) == APIC_TIMER_MODE_TSC_DEADLINE) )
> @@ -1024,9 +1041,12 @@ int guest_wrmsr_x2apic(struct vcpu *v, u
>              return X86EMUL_EXCEPTION;
>          break;
>  
> +    case APIC_CMCI:
> +        if ( !(v->arch.vmce.mcg_cap & MCG_CMCI_P) )
> +            return X86EMUL_EXCEPTION;
> +        fallthrough;
>      case APIC_LVTTHMR:
>      case APIC_LVTPC:
> -    case APIC_CMCI:
>          if ( val & ~(LVT_MASK | APIC_DM_MASK) )
>              return X86EMUL_EXCEPTION;
>          break;

This is almost certainly not how real hardware behaves.

The APIC is a discrete block of logic, whether it's integrated into the
core or not.  A new LVT is "just" another interrupt source, and if
nothing is wired into that pin, then it's just a register which never
produces an interrupt.

Accessibility of LVT_CMCI will depend on MAXLVT and nothing else.  In
silicon, I'm pretty sure it will be hardcoded as fully absent or
present, because I can't see any reason to make this configurable.

At this point, things get more complicated.

On Intel, there's no such thing as x2APIC capable (irrespective of
x2APIC enabled) without LVT_CMCI which is why there are no additional
access constraints on the register.

On AMD, there's no LVT_CMCI even on systems which support x2APIC. 
Instead, ELVTs are used and it is MCE-configuration based which ELVT the
interrupt is delivered through.

Choosing a default MAXLVT based on MCG_CMCI_P is probably fine (although
it certainly is ugly to tie APIC and vMCE together), but controls on the
access to APIC_CMCI should be based on MAXLVT.

~Andrew

