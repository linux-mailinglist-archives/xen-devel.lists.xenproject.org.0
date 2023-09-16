Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E39187A2E68
	for <lists+xen-devel@lfdr.de>; Sat, 16 Sep 2023 09:44:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.603526.940549 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qhPyN-0000hc-VU; Sat, 16 Sep 2023 07:44:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 603526.940549; Sat, 16 Sep 2023 07:44:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qhPyN-0000eu-Sa; Sat, 16 Sep 2023 07:44:11 +0000
Received: by outflank-mailman (input) for mailman id 603526;
 Sat, 16 Sep 2023 07:44:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=V1Uw=FA=gmail.com=jinoh.kang.kr@srs-se1.protection.inumbo.net>)
 id 1qhPyM-0000eo-BX
 for xen-devel@lists.xenproject.org; Sat, 16 Sep 2023 07:44:10 +0000
Received: from mail-pg1-x52a.google.com (mail-pg1-x52a.google.com
 [2607:f8b0:4864:20::52a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d1807990-5464-11ee-8788-cb3800f73035;
 Sat, 16 Sep 2023 09:44:09 +0200 (CEST)
Received: by mail-pg1-x52a.google.com with SMTP id
 41be03b00d2f7-573ccec985dso2328845a12.2
 for <xen-devel@lists.xenproject.org>; Sat, 16 Sep 2023 00:44:09 -0700 (PDT)
Received: from [10.137.0.57] ([14.33.99.107]) by smtp.gmail.com with ESMTPSA id
 s8-20020a17090a764800b0026b50d9aee6sm3979212pjl.25.2023.09.16.00.44.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 16 Sep 2023 00:44:07 -0700 (PDT)
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
X-Inumbo-ID: d1807990-5464-11ee-8788-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1694850248; x=1695455048; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RyuT4kdZ2116u9L0YxuBdo/Qb02fPEko0CzEQ4I9mNs=;
        b=Pkz93Bxh5ZKymz6t1AaNqiiu2AYoJ4ibIDLp8aI7DJk6EsIgrR3YTVN5ciCfhMixti
         4JIUxtFHWa6wMMJ/basiGkzb7b637cL4M2THUgzTC6UzVoTP3QSE4KxbqSDwACTJvY+a
         Go0JKWSkSXr/ApK4rDXykd264uMXcBzsb98wekc/4xzHIUkEZPVJz1F2QXO1sxFP6+vp
         efnKP4k+bjgVrT6pS8e+dAYqzyqhI43wEzElPmoFEvti4uejnfUGSvsf4uOoXVHgt0bu
         RQUSYitkv4zCy9Yk6nQja2y96YD2alQW7Xr2yKCVSgVpDvilSx8SphPF1ZP7FLT5Z54l
         frZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694850248; x=1695455048;
        h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RyuT4kdZ2116u9L0YxuBdo/Qb02fPEko0CzEQ4I9mNs=;
        b=cLgfn45Yn2GDmYzZ5ZIkBIZkwDGVM+pbpkS2vUlGG8L1/nu5YczwJafr16PGd6uYRJ
         ofUWz/VFthGnjkggGwxUlr/RGa7RDUKZTkIDnxZQjpCibbF8wYu+fT+mbUDyvM27+szn
         wJOqMMfXukAzDF5WRfJ36T8r2dh9brFQGnkSwHpYXXk0KGlzpQ9eXdu3mrvyQADtXljK
         qK6H/GSXi3Y2uG2dHfncfyxV8d6KPeVK7WYU7pDdL9olMqLa/lPIhYtqhWHitK8Z5ODI
         vZqLqv2sUUOUGhvVN9IAfjGuGViidiS7kDVEg34A6TQEvxIF7UdxpCITVhJ53lQxXLCd
         O/1A==
X-Gm-Message-State: AOJu0YyA9Xx55rCi+e+HVlh7fX98RtmFQOC1wlQpLPWCnhaelrgfyMox
	jV8xcs876z7XR8In00NK3X8=
X-Google-Smtp-Source: AGHT+IHAjuXw/InLndBQl1FDBBuA5PKvkcd4Iz+lQlW7CXct74zLZSoJqThu6vEmxX224lwLF0dBSQ==
X-Received: by 2002:a05:6a20:d405:b0:13a:6bca:7a84 with SMTP id il5-20020a056a20d40500b0013a6bca7a84mr4014052pzb.44.1694850247629;
        Sat, 16 Sep 2023 00:44:07 -0700 (PDT)
Message-ID: <b9115a81-f46f-129f-8075-5775f4da56dc@gmail.com>
Date: Sat, 16 Sep 2023 16:44:03 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: Jan Beulich <JBeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Wei Liu <wl@xen.org>
References: <20230915203628.837732-1-andrew.cooper3@citrix.com>
 <20230915203628.837732-7-andrew.cooper3@citrix.com>
From: Jinoh Kang <jinoh.kang.kr@gmail.com>
Subject: Re: [PATCH 6/7] x86: Extend x86_event with a pending_dbg field
In-Reply-To: <20230915203628.837732-7-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 9/16/23 05:36, Andrew Cooper wrote:
> ... using the Intel VMCS PENDING_DBG semantics, and sharing storage with cr2.
> 
> This requires working around anonymous union bugs in obsolete versions of GCC,
> which in turn needs to drop unnecessary const qualifiers.

I'd write this as a inline comment as long as it doesn't make the code
too verbose.

Please disregard this if it doesn't match our coding style.

> 
> Also introduce a pv_inject_DB() wrapper use this field nicely.

Minor nit: Also introduce a pv_inject_DB() wrapper to* use this field nicely.

> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> CC: Jan Beulich <JBeulich@suse.com>
> CC: Roger Pau Monné <roger.pau@citrix.com>
> CC: Wei Liu <wl@xen.org>
> CC: Jinoh Kang <jinoh.kang.kr@gmail.com>
> 
> v2:
>  * Split out of prior patch.
> ---
>  xen/arch/x86/include/asm/domain.h      | 18 ++++++++++++++++--
>  xen/arch/x86/include/asm/hvm/hvm.h     |  3 ++-
>  xen/arch/x86/x86_emulate/x86_emulate.h |  5 ++++-
>  3 files changed, 22 insertions(+), 4 deletions(-)
> 
> diff --git a/xen/arch/x86/include/asm/domain.h b/xen/arch/x86/include/asm/domain.h
> index c2d9fc333be5..fd1f306222be 100644
> --- a/xen/arch/x86/include/asm/domain.h
> +++ b/xen/arch/x86/include/asm/domain.h
> @@ -729,15 +729,29 @@ static inline void pv_inject_hw_exception(unsigned int vector, int errcode)
>      pv_inject_event(&event);
>  }
>  
> +static inline void pv_inject_DB(unsigned long pending_dbg)
> +{
> +    struct x86_event event = {
> +        .vector      = X86_EXC_DB,
> +        .type        = X86_EVENTTYPE_HW_EXCEPTION,
> +        .error_code  = X86_EVENT_NO_EC,
> +    };
> +
> +    event.pending_dbg = pending_dbg;
> +
> +    pv_inject_event(&event);
> +}
> +
>  static inline void pv_inject_page_fault(int errcode, unsigned long cr2)
>  {
> -    const struct x86_event event = {
> +    struct x86_event event = {
>          .vector = X86_EXC_PF,
>          .type = X86_EVENTTYPE_HW_EXCEPTION,
>          .error_code = errcode,
> -        .cr2 = cr2,
>      };
>  
> +    event.cr2 = cr2;
> +
>      pv_inject_event(&event);
>  }
>  
> diff --git a/xen/arch/x86/include/asm/hvm/hvm.h b/xen/arch/x86/include/asm/hvm/hvm.h
> index 6d53713fc3a9..ea966f4429f9 100644
> --- a/xen/arch/x86/include/asm/hvm/hvm.h
> +++ b/xen/arch/x86/include/asm/hvm/hvm.h
> @@ -532,9 +532,10 @@ static inline void hvm_inject_page_fault(int errcode, unsigned long cr2)
>          .vector = X86_EXC_PF,
>          .type = X86_EVENTTYPE_HW_EXCEPTION,
>          .error_code = errcode,
> -        .cr2 = cr2,
>      };
>  
> +    event.cr2 = cr2;
> +
>      hvm_inject_event(&event);
>  }
>  
> diff --git a/xen/arch/x86/x86_emulate/x86_emulate.h b/xen/arch/x86/x86_emulate/x86_emulate.h
> index fbc023c37e34..e567a9b635d9 100644
> --- a/xen/arch/x86/x86_emulate/x86_emulate.h
> +++ b/xen/arch/x86/x86_emulate/x86_emulate.h
> @@ -78,7 +78,10 @@ struct x86_event {
>      uint8_t       type;         /* X86_EVENTTYPE_* */
>      uint8_t       insn_len;     /* Instruction length */
>      int32_t       error_code;   /* X86_EVENT_NO_EC if n/a */
> -    unsigned long cr2;          /* Only for X86_EXC_PF h/w exception */
> +    union {
> +        unsigned long cr2;         /* #PF */
> +        unsigned long pending_dbg; /* #DB (new DR6 bits, positive polarity) */
> +    };
>  };
>  
>  /*

-- 
Sincerely,
Jinoh Kang


