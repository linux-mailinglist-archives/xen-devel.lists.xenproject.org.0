Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C6FA8A7AA50
	for <lists+xen-devel@lfdr.de>; Thu,  3 Apr 2025 21:11:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.937157.1338199 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u0PxR-0007GL-Tq; Thu, 03 Apr 2025 19:10:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 937157.1338199; Thu, 03 Apr 2025 19:10:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u0PxR-0007D3-Po; Thu, 03 Apr 2025 19:10:33 +0000
Received: by outflank-mailman (input) for mailman id 937157;
 Thu, 03 Apr 2025 19:10:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JbNy=WV=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1u0PxQ-0007BV-B5
 for xen-devel@lists.xenproject.org; Thu, 03 Apr 2025 19:10:32 +0000
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [2a00:1450:4864:20::336])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4fca58ba-10bf-11f0-9eaa-5ba50f476ded;
 Thu, 03 Apr 2025 21:10:31 +0200 (CEST)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-43d0618746bso9147355e9.2
 for <xen-devel@lists.xenproject.org>; Thu, 03 Apr 2025 12:10:31 -0700 (PDT)
Received: from [192.168.1.183] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43ec1663053sm29317565e9.15.2025.04.03.12.10.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 03 Apr 2025 12:10:30 -0700 (PDT)
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
X-Inumbo-ID: 4fca58ba-10bf-11f0-9eaa-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1743707431; x=1744312231; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Jzuj1M8SOFjW4JeG6HeNXSF+X7+jyBYmetNErkmeqCc=;
        b=ANCa6yYWUlIqvpkOE/xFsiqaf4pQ6dnE1aoioveQa+c+8Hdeet2cLzEYzSEXO4u//b
         M4/OeKYN8p3MkbpMajbYOCn0NK8SCmKurYZCSk2Srlxy1tP5KXS/ilQ9QOjg2D4tXXk4
         ijx24cYpvMBgryMjIU6+Wdj01bK+yzaDem/DQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743707431; x=1744312231;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Jzuj1M8SOFjW4JeG6HeNXSF+X7+jyBYmetNErkmeqCc=;
        b=VuRi4h70sSfUXUa3tqN68kJUtoYbM6mxM34TbwteBtrfrp24wsiA6oQqQKpmiAjWC3
         B79/ZMz47FvyKyWgGPZwPbXNY37AoYC6Wy1cjA1cZVTywOSKp2kFxJyWoq57kCTsrsXs
         cKerEbaPrzKjelKvP7FEFHAN11AcSOH8ccKbJHGgd5CoXOAkvXCq5O/8RchZQp2m/ZsC
         loLQtxy3xHYyHKFaRn53A9z0Tt7juXEPLH7DZVZgyDrZs77sPYl0qL4Ez7XrWbNQqaP7
         gpOldE/2f+HnOqmZxtxrXiuvYyjofLx6vqHtx8JxgGS655cHWeCjBu1+pSSAcX8GmPWs
         rK5Q==
X-Forwarded-Encrypted: i=1; AJvYcCUaYGtorJxslVl89DbcRVRcxX/AcBxWJLyNwGoQd2pph+lHohtjN9g64JkaNrig7b5h2sHoikEUGP0=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yzkf3JSYd7ykz0XGaqdsRDAJlsJGIf6iCyes2czrNKlWPxA8YAz
	jAdRUQ/F7wf83Bs2VkGFXHDhh+jpfielDiK+wtzaglPG00c7jnvHo/T26/k6ub0=
X-Gm-Gg: ASbGncvv3ZSvJkWg+ENxnhywEkDDIEmEcf3pKHH6oEvmDj+mBzFAghxjskReRAYMSju
	/MzvnA8IHUlVd4jKheBHmWmET+uMkn7gFi+1TwTsXQXrqF5UtPDt/vjbv1OOvwrJ18MKE3P4sX0
	TpuaSBXNzDbsGL+ntNvV10FkKFfbLdZc38QXQcQTbZYO1UCLTG5MX1ftfYmW9MNtx9jI/NxS5fF
	sPX5vKwtoYneBS3yg3ZRlNzXecIDUqARMZMTWJUQ6R8x1BPl8dN1aCsvV6DSOoMB3lcRn7K2eOq
	YJxmRsbfIzp+dIK5RCc7H56HEs+cK6G1Yl1Ew5Dx3GUO6j+3tIyLxzlMIfU0aCGmsVxk6DPjdM8
	YhZ25euwJaFbdwD4A3VyR
X-Google-Smtp-Source: AGHT+IEY8RH13JnZ9zEAewyZcY17wd7nDi/+zKodTU+dQ0iFeN1LtUPvT9J1qSUdv2J+XDMo3W5eVw==
X-Received: by 2002:a05:600c:3487:b0:43c:f3e4:d6f6 with SMTP id 5b1f17b1804b1-43ecfa19260mr2824895e9.31.1743707430640;
        Thu, 03 Apr 2025 12:10:30 -0700 (PDT)
Message-ID: <9079e1dd-3c2c-43e3-8afb-bf92fd13d3ee@citrix.com>
Date: Thu, 3 Apr 2025 20:10:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/6] x86/vmx: remove HAVE_AS_{EPT,VMX}, GAS_VMX_OP()
 and *_OPCODE
To: dmkhn@proton.me, xen-devel@lists.xenproject.org
Cc: anthony.perard@vates.tech, jbeulich@suse.com, julien@xen.org,
 michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org,
 dmukhin@ford.com
References: <20250403182250.3329498-1-dmukhin@ford.com>
 <20250403182250.3329498-2-dmukhin@ford.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20250403182250.3329498-2-dmukhin@ford.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 03/04/2025 7:23 pm, dmkhn@proton.me wrote:
> From: Denis Mukhin <dmukhin@ford.com>
>
> The new toolchain baseline knows the VMX instructions,
> no need to carry the workaround in the code.
>
> Move asm for vmxoff directly on the only callsite in vmcs.c

Ideally VMXOFF in capitals as it's an instruction name.  But, this type
of thing is more commonly phrased as "Inline __vmxoff() into it's single
caller", or so.

>
> Updated formatting for all __xxx() calls to be consistent.

I'd suggest "for the other wrappers to be".

>
> Resolves: https://gitlab.com/xen-project/xen/-/work_items/202
> Signed-off-by: Denis Mukhin <dmukhin@ford.com>
> ---
>  xen/arch/x86/arch.mk                   |   4 +-
>  xen/arch/x86/hvm/vmx/vmcs.c            |   2 +-
>  xen/arch/x86/include/asm/hvm/vmx/vmx.h | 119 ++++---------------------

Just as a note, you're CC-ing The Rest, but this is an x86-only change,
so should really only be CCing myself, Jan and Roger.

> diff --git a/xen/arch/x86/hvm/vmx/vmcs.c b/xen/arch/x86/hvm/vmx/vmcs.c
> index 1d427100ce..aef746a293 100644
> --- a/xen/arch/x86/hvm/vmx/vmcs.c
> +++ b/xen/arch/x86/hvm/vmx/vmcs.c
> @@ -811,7 +811,7 @@ void cf_check vmx_cpu_down(void)
>  
>      BUG_ON(!(read_cr4() & X86_CR4_VMXE));
>      this_cpu(vmxon) = 0;
> -    __vmxoff();
> +    asm volatile ("vmxoff" : : : "memory");

asm volatile ( "vmxoff" ::: "memory" );

>  
>      local_irq_restore(flags);
>  }
> diff --git a/xen/arch/x86/include/asm/hvm/vmx/vmx.h b/xen/arch/x86/include/asm/hvm/vmx/vmx.h
> index 7c6ba73407..ed6a6986b9 100644
> --- a/xen/arch/x86/include/asm/hvm/vmx/vmx.h
> +++ b/xen/arch/x86/include/asm/hvm/vmx/vmx.h
> @@ -310,97 +292,54 @@ extern uint8_t posted_intr_vector;
>  #define INVVPID_ALL_CONTEXT                     2
>  #define INVVPID_SINGLE_CONTEXT_RETAINING_GLOBAL 3
>  
> -#ifdef HAVE_AS_VMX
> -# define GAS_VMX_OP(yes, no) yes
> -#else
> -# define GAS_VMX_OP(yes, no) no
> -#endif
> -
>  static always_inline void __vmptrld(u64 addr)
>  {
> -    asm volatile (
> -#ifdef HAVE_AS_VMX
> -                   "vmptrld %0\n"
> -#else
> -                   VMPTRLD_OPCODE MODRM_EAX_06
> -#endif
> +    asm volatile ( "vmptrld %0\n"

As you're changing the line anyway, this ought to be \n\t.  It's
cosmetic, but comes in handy if you need to read the intermediate assembly.

>                     /* CF==1 or ZF==1 --> BUG() */
>                     UNLIKELY_START(be, vmptrld)
>                     _ASM_BUGFRAME_TEXT(0)
>                     UNLIKELY_END_SECTION
>                     :
> -#ifdef HAVE_AS_VMX
>                     : "m" (addr),
> -#else
> -                   : "a" (&addr),
> -#endif
>                       _ASM_BUGFRAME_INFO(BUGFRAME_bug, __LINE__, __FILE__, 0)
> -                   : "memory");
> +                   : "memory" );
>  }
>  
>  static always_inline void __vmpclear(u64 addr)
>  {
> -    asm volatile (
> -#ifdef HAVE_AS_VMX
> -                   "vmclear %0\n"
> -#else
> -                   VMCLEAR_OPCODE MODRM_EAX_06
> -#endif
> +    asm volatile ( "vmclear %0\n"
>                     /* CF==1 or ZF==1 --> BUG() */
>                     UNLIKELY_START(be, vmclear)
>                     _ASM_BUGFRAME_TEXT(0)
>                     UNLIKELY_END_SECTION
>                     :
> -#ifdef HAVE_AS_VMX
>                     : "m" (addr),
> -#else
> -                   : "a" (&addr),
> -#endif
>                       _ASM_BUGFRAME_INFO(BUGFRAME_bug, __LINE__, __FILE__, 0)
> -                   : "memory");
> +                   : "memory" );
>  }
>  
>  static always_inline void __vmread(unsigned long field, unsigned long *value)
>  {
> -    asm volatile (
> -#ifdef HAVE_AS_VMX
> -                   "vmread %1, %0\n\t"
> -#else
> -                   VMREAD_OPCODE MODRM_EAX_ECX
> -#endif
> +    asm volatile ( "vmread %1, %0\n\t"
>                     /* CF==1 or ZF==1 --> BUG() */
>                     UNLIKELY_START(be, vmread)
>                     _ASM_BUGFRAME_TEXT(0)
>                     UNLIKELY_END_SECTION
> -#ifdef HAVE_AS_VMX
>                     : "=rm" (*value)
>                     : "r" (field),
> -#else
> -                   : "=c" (*value)
> -                   : "a" (field),
> -#endif
>                       _ASM_BUGFRAME_INFO(BUGFRAME_bug, __LINE__, __FILE__, 0)
>          );

Fold this onto the previous line, as you're fixing up all the other
closing brackets.

> @@ -494,24 +422,14 @@ static always_inline void __invvpid(unsigned long type, u16 vpid, u64 gva)
>      }  operand = {vpid, 0, gva};
>  
>      /* Fix up #UD exceptions which occur when TLBs are flushed before VMXON. */

I find this comment deeply troubling, but lets not go changing that
right now.

I'm happy to fix this all on commit.

~Andrew

