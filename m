Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C0661A7ADAC
	for <lists+xen-devel@lfdr.de>; Thu,  3 Apr 2025 22:10:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.937253.1338258 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u0QtG-0008U0-6L; Thu, 03 Apr 2025 20:10:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 937253.1338258; Thu, 03 Apr 2025 20:10:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u0QtG-0008SJ-3O; Thu, 03 Apr 2025 20:10:18 +0000
Received: by outflank-mailman (input) for mailman id 937253;
 Thu, 03 Apr 2025 20:10:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JbNy=WV=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1u0QtE-0008SD-Ls
 for xen-devel@lists.xenproject.org; Thu, 03 Apr 2025 20:10:16 +0000
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [2a00:1450:4864:20::435])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a836953b-10c7-11f0-9eaa-5ba50f476ded;
 Thu, 03 Apr 2025 22:10:15 +0200 (CEST)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-38f2f391864so735140f8f.3
 for <xen-devel@lists.xenproject.org>; Thu, 03 Apr 2025 13:10:15 -0700 (PDT)
Received: from [192.168.1.183] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39c3020da17sm2620159f8f.64.2025.04.03.13.10.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 03 Apr 2025 13:10:13 -0700 (PDT)
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
X-Inumbo-ID: a836953b-10c7-11f0-9eaa-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1743711015; x=1744315815; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=O42ZT6SypABuH8tKXzQofcKBmF5oCVLd6Sc/wOgFMxk=;
        b=IcEyaSHua5QAv4MYXuBE1YqM5BADKO9tP2Qq714DEX6dzZwuNr5GAn4w/6kYO9bCHz
         jb5gb4J3rrFnwpzn18+i1PlQloWvu6AvdscRjREWWHq40KzHTk2+8TAyB0lzh57c8OHD
         wxq/bGKwZwKwCk+n/acaBvJG1ZqkHou6GFcSw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743711015; x=1744315815;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O42ZT6SypABuH8tKXzQofcKBmF5oCVLd6Sc/wOgFMxk=;
        b=bqxA5Vn38y4FHGFUv0sR8L7Z/xI3ToBpGmpRdrZI5hcPPAFQQtJEUA/C7fpo4/B0yt
         Un7C330EMOvSW6LtjohTVojJcVyl+PJcXtQk1tTH4HjYUwyhAwxRkHbOJ2wfurOx5pGi
         Dzb8D8w2094XeFwlByg/fZfTVn42V2l91hfg7q1/SSHm1xQpFPaT3eQO55gaglhOS/cw
         AGVqYXwAnUutfOJmG+OmMiWkGjgF/YNrY96r2MK4SMWVdmh6Tg8fFs8z79ZBzMTb5I5V
         sKB4RleFuAJ1ykxjllO8JESCYXkGpB3q4lAmNdzaCOr+S5GJJa0g9hzcmPL/ceuQlT9f
         Xhsg==
X-Forwarded-Encrypted: i=1; AJvYcCWqEukHRtndqhbqNP1Du+fYy1DrpSr2jrnO6scHNSsNTDvt87u10JKW7oJTYfAtpONjj2ZNY50kdAg=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxeVWmsmbPume9AtZk9PycbCZS5la9r8EvIbnH94yz/u6WNcOmt
	L/8u3KBltm+hT8LwqeJiMBo39xoEaZ99gHsvdHXR5ZQ7NhxD9Q3R0TMuPc5Myjc=
X-Gm-Gg: ASbGncsTasnotmO0Ja6BNDhF5Zl/DkNQ9eaPkDT79teT2NwcbacpFQZKPn0Cy4kssN0
	WbTPvxAJX+UanSApcuLTTgMnnjWHvV892lTHq1+kRDbesAkUn6u/phK+yPsogVqsqMDOruydLA2
	8UChDHhf3mXNIRecc4Z4uyCPpePGPDnFdsT7TnHA3d7gcC0iyY3NU7tXUtkn72HlVqrFjWMLgvb
	teGBVyzlFu8MZYt52cz8l3xdA6mgbDOws+ZvQrIxZI/rGY8k2glOdN2rGMfGQ8gdXkP/E/dxIMG
	2IZutnj1JzNauMw1V5J4LWv7ehky/cNTEsF8aMnSBWLVrEJohYF7pgUkIMhqKa/v2bwfruOg2so
	qh7XtyBwc9g==
X-Google-Smtp-Source: AGHT+IHdEI200jVEWyXs19WBQinjMOaqrnF9TAzBrSrED0mAwRpb520FNNt8xBBBNEaUb4ApstQx2g==
X-Received: by 2002:a5d:6d82:0:b0:39c:310a:f87e with SMTP id ffacd0b85a97d-39d0de16301mr149238f8f.16.1743711014866;
        Thu, 03 Apr 2025 13:10:14 -0700 (PDT)
Message-ID: <c452a1d7-4a57-4c5f-8a83-36a74ff228ec@citrix.com>
Date: Thu, 3 Apr 2025 21:10:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 6/6] x86/vmx: rework VMX wrappers to use `asm goto()`
To: dmkhn@proton.me, xen-devel@lists.xenproject.org
Cc: anthony.perard@vates.tech, jbeulich@suse.com, julien@xen.org,
 michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org,
 dmukhin@ford.com
References: <20250403182250.3329498-1-dmukhin@ford.com>
 <20250403182250.3329498-7-dmukhin@ford.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20250403182250.3329498-7-dmukhin@ford.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 03/04/2025 7:23 pm, dmkhn@proton.me wrote:
> From: Denis Mukhin <dmukhin@ford.com>
>
> Improve error handling in VMX wrappers by switching to `asm goto()` where
> possible.
>
> vmread_safe() kept as is because the minimally required baseline GCC does
> not support output operands in `asm goto`.
>
> Resolves: https://gitlab.com/xen-project/xen/-/work_items/210
> Signed-off-by: Denis Mukhin <dmukhin@ford.com>

I'd suggest limiting this patch to the asm-goto transformations only.

> ---
>  xen/arch/x86/include/asm/hvm/vmx/vmx.h | 141 +++++++++++++------------
>  1 file changed, 73 insertions(+), 68 deletions(-)
>
> diff --git a/xen/arch/x86/include/asm/hvm/vmx/vmx.h b/xen/arch/x86/include/asm/hvm/vmx/vmx.h
> index ed6a6986b9..19d41f7b90 100644
> --- a/xen/arch/x86/include/asm/hvm/vmx/vmx.h
> +++ b/xen/arch/x86/include/asm/hvm/vmx/vmx.h
> @@ -294,54 +294,57 @@ extern uint8_t posted_intr_vector;
>  
>  static always_inline void __vmptrld(u64 addr)
>  {
> -    asm volatile ( "vmptrld %0\n"
> -                   /* CF==1 or ZF==1 --> BUG() */
> -                   UNLIKELY_START(be, vmptrld)
> -                   _ASM_BUGFRAME_TEXT(0)
> -                   UNLIKELY_END_SECTION
> -                   :
> -                   : "m" (addr),
> -                     _ASM_BUGFRAME_INFO(BUGFRAME_bug, __LINE__, __FILE__, 0)
> -                   : "memory" );
> +    asm goto ( "vmptrld %[addr]\n"
> +               "jbe %l[vmfail]\n\t"

Also cosmetic, but the very final line in the asm block ideally doesn't
want the \n\t.  Except, this tends to be hard to spot because of the way
we use macros such as UNLIKELY_START() or _ASM_EXTABLE() which do just
expand to more strings under the hood.

> +               :
> +               : [addr] "m" (addr)
> +               : "memory"
> +               : vmfail );
> +    return;
> +
> + vmfail:
> +    BUG();
>  }
>  
>  static always_inline void __vmpclear(u64 addr)
>  {
> -    asm volatile ( "vmclear %0\n"
> -                   /* CF==1 or ZF==1 --> BUG() */
> -                   UNLIKELY_START(be, vmclear)
> -                   _ASM_BUGFRAME_TEXT(0)
> -                   UNLIKELY_END_SECTION
> -                   :
> -                   : "m" (addr),
> -                     _ASM_BUGFRAME_INFO(BUGFRAME_bug, __LINE__, __FILE__, 0)
> -                   : "memory" );
> +    asm goto ( "vmclear %[addr]\n"
> +               "jbe %l[vmfail]\n\t"
> +               :
> +               : [addr] "m" (addr)
> +               : "memory"
> +               : vmfail );
> +    return;
> +
> + vmfail:
> +    BUG();
>  }
>  
>  static always_inline void __vmread(unsigned long field, unsigned long *value)
>  {
> -    asm volatile ( "vmread %1, %0\n\t"
> -                   /* CF==1 or ZF==1 --> BUG() */
> -                   UNLIKELY_START(be, vmread)
> -                   _ASM_BUGFRAME_TEXT(0)
> -                   UNLIKELY_END_SECTION
> -                   : "=rm" (*value)
> -                   : "r" (field),
> -                     _ASM_BUGFRAME_INFO(BUGFRAME_bug, __LINE__, __FILE__, 0)
> -        );
> +    bool vmfail;
> +
> +    asm volatile ( "vmread %[field], %[value]\n\t"
> +                    "setbe %[vmfail]\n\t"
> +                    : [value] "=rm" (*value), [vmfail] "=rm" (vmfail)
> +                    : [field] "r" (field)
> +                    : "cc" );
> +    if ( vmfail )
> +        BUG();

This is almost certainly not an improvement in generated code.  You now
need register to hold the boolean, where previously there was a jbe to a
ud2 and no extra state required.

Here's an example https://godbolt.org/z/GG4r1c7bK showing the
difference.   (It also shows up the Clang "rm" constraint bug.  Change
vmfail from "=rm" to "=r" to get sane(er) code generation.)

Also, you've added a "cc" clobber.  This is one thing you don't need on
x86; it's simply assumed, given how many instructions update flags
naturally.

> @@ -369,22 +372,22 @@ static inline enum vmx_insn_errno vmread_safe(unsigned long field,
>  static inline enum vmx_insn_errno vmwrite_safe(unsigned long field,
>                                                 unsigned long value)
>  {
> -    unsigned long ret = VMX_INSN_SUCCEED;
> -    bool fail_invalid, fail_valid;
> +    unsigned long ret;
>  
> -    asm volatile ( "vmwrite %[value], %[field]\n\t"
> -                   ASM_FLAG_OUT(, "setc %[invalid]\n\t")
> -                   ASM_FLAG_OUT(, "setz %[valid]\n\t")
> -                   : ASM_FLAG_OUT("=@ccc", [invalid] "=rm") (fail_invalid),
> -                     ASM_FLAG_OUT("=@ccz", [valid] "=rm") (fail_valid)
> -                   : [field] "r" (field),
> -                     [value] "rm" (value) );
> +    asm goto ( "vmwrite %[value], %[field]\n\t"
> +               "jc %l[vmfail_invalid]\n\t"
> +               "jz %l[vmfail_error]\n\t"
> +               :
> +               : [field] "r" (field), [value] "rm" (value)
> +               :
> +               : vmfail_invalid, vmfail_error );
> +    return VMX_INSN_SUCCEED;
>  
> -    if ( unlikely(fail_invalid) )
> -        ret = VMX_INSN_FAIL_INVALID;
> -    else if ( unlikely(fail_valid) )
> -        __vmread(VM_INSTRUCTION_ERROR, &ret);
> + vmfail_invalid:
> +    return VMX_INSN_FAIL_INVALID;
>  
> + vmfail_error:
> +    __vmread(VM_INSTRUCTION_ERROR, &ret);

Something not technically toolchain cleanup, but is in desperate need of
doing.

__vmread() being void and producing an output by pointer is insane, and
leads to ugly code such as this, even if the compiler can usually fix up
behind the scenes.

It would be lovely to have:

unsigned long vmread(unsigned int field)

which can be wrapped by __vmread() with "*value = vmread(field);" or
so.  (Don't go converting all users; that's a huge task).

Then, this vmfail_error can be simply "return
vmread(VM_INSTRUCTION_ERROR);" and you can drop the ret variable.

~Andrew

