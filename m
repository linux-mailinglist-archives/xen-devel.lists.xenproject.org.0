Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7758249B7BC
	for <lists+xen-devel@lfdr.de>; Tue, 25 Jan 2022 16:37:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.260484.450037 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nCNsn-0003qv-H9; Tue, 25 Jan 2022 15:37:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 260484.450037; Tue, 25 Jan 2022 15:37:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nCNsn-0003o1-Dw; Tue, 25 Jan 2022 15:37:21 +0000
Received: by outflank-mailman (input) for mailman id 260484;
 Tue, 25 Jan 2022 15:37:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YAYL=SJ=gmail.com=xadimgnik@srs-se1.protection.inumbo.net>)
 id 1nCNsm-0003nv-8b
 for xen-devel@lists.xenproject.org; Tue, 25 Jan 2022 15:37:20 +0000
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [2a00:1450:4864:20::42c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ae4e0cda-7df4-11ec-8fa7-f31e035a9116;
 Tue, 25 Jan 2022 16:37:19 +0100 (CET)
Received: by mail-wr1-x42c.google.com with SMTP id s18so20616797wrv.7
 for <xen-devel@lists.xenproject.org>; Tue, 25 Jan 2022 07:37:19 -0800 (PST)
Received: from ?IPV6:2a00:23c5:5785:9a01:ad9a:ab78:5748:a7ec?
 ([2a00:23c5:5785:9a01:ad9a:ab78:5748:a7ec])
 by smtp.gmail.com with ESMTPSA id b1sm757740wrd.12.2022.01.25.07.37.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 Jan 2022 07:37:18 -0800 (PST)
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
X-Inumbo-ID: ae4e0cda-7df4-11ec-8fa7-f31e035a9116
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:reply-to:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=+gf6bRB0UAAAOcg6ABVdFBIGghqpevaVgIhZPECDmfs=;
        b=ZGcNSBeX3ob/+Lz2stfqOkY3/v7yqU9+hQ8lRvcsiZ+31m+JMT8PxpxnfpH9WjxPO2
         zVXUzNH+pBHubLqd6NYnIfbDdCVrl6InrmjdKco5RIeuUMbzb3Ek40nCAnbvYI5+45/J
         eLLc3S16gEWOFCl4SJ9CDJTxQi9IP5urxBEwwiArdXaiHoBMfJUuwEw0e43BOd1XqfW5
         nSzmNbOkrtgbfaIzwWVJILyglLwBJVPQpEEQM9JvyGDvneWBJ5EtDWckcIx1j4vz6kUL
         jpdg++nea9JaNjYnBgtjKmyIkvF5rppys1CeRc8gZxRjZD/cuf76cyZc9xGvAhZuC2hT
         bBVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:reply-to
         :subject:content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=+gf6bRB0UAAAOcg6ABVdFBIGghqpevaVgIhZPECDmfs=;
        b=BCXeFMrlgChr2tlWEGPp8JzLMKaq2YCRdK8InlYojNaNhZJIrqRGmJP4mxYKqSY8Pd
         HtkElWUuib6EohO/i03oGQpJ8cu9Mv7cypgUMysAK+cfdGSIyh0Ew8sKsUcbtnOHn7JW
         A+FmQeVl9Onzt1xYFDq7qswL52Zc+sCmhxQkOxzB2T2FJKRrw80WCXui0Y23A7c1GApz
         Act44Y79tbZWTJvGddp8ibODe4nXRg6RCZdZ8Ug2uEt7ZyFNmxioHZ35MT+/KqR3A9l9
         H7/LRvB21vOUVU/JSGWKM1t7lrOhIvgpT65BEcQSZna2AfRW1oohdZ/8m/c/FSAKSYuI
         lAjg==
X-Gm-Message-State: AOAM533wl6ln73dJxM+kgN7Y6ojp+DdmSgXD1u6WTFWyga4WRyFS88/m
	OnfxCF1vW8n7jC2gpvYGrfU=
X-Google-Smtp-Source: ABdhPJwNxkT43F+t57qqDtqfyKZvEOVOadtSbT83tfoPq6v+hG1jMwL5Y11iTVKgSwB0NlI4xw7pvA==
X-Received: by 2002:a5d:61c6:: with SMTP id q6mr11712739wrv.667.1643125038666;
        Tue, 25 Jan 2022 07:37:18 -0800 (PST)
Message-ID: <85cc1048-3b81-d08a-de24-5ea841271727@gmail.com>
Date: Tue, 25 Jan 2022 15:37:17 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Reply-To: paul@xen.org
Subject: Re: [PATCH] x86emul: recognize CLDEMOTE
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Paul Durrant <paul@xen.org>
References: <5812dc8e-d77d-f9de-4f37-b0ef094c5c09@suse.com>
 <d8a339f7-b875-492a-8697-1195aeffd8db@suse.com>
From: "Durrant, Paul" <xadimgnik@gmail.com>
In-Reply-To: <d8a339f7-b875-492a-8697-1195aeffd8db@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 25/01/2022 15:08, Jan Beulich wrote:
> On 25.01.2022 15:22, Jan Beulich wrote:
>> We claim to support the insn, but so far the emulator has been handling
>> it as a NOP.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> I'm sorry, I should have Cc-ed Paul here as well.
> 

Acked-by: Paul Durrant <paul@xen.org>

> Jan
> 
>> ---
>> While handling x86emul_cldemote separately in hvmemul_cache_op() means
>> to carry some redundant code, folding it with CLFLUSH{,OPT} / CLWB
>> didn't seem very attractive either.
>>
>> --- a/xen/arch/x86/arch.mk
>> +++ b/xen/arch/x86/arch.mk
>> @@ -23,6 +23,7 @@ $(call as-option-add,CFLAGS,CC,"xsaveopt
>>   $(call as-option-add,CFLAGS,CC,"rdseed %eax",-DHAVE_AS_RDSEED)
>>   $(call as-option-add,CFLAGS,CC,"clac",-DHAVE_AS_CLAC_STAC)
>>   $(call as-option-add,CFLAGS,CC,"clwb (%rax)",-DHAVE_AS_CLWB)
>> +$(call as-option-add,CFLAGS,CC,"cldemote (%rax)",-DHAVE_AS_CLDEMOTE)
>>   $(call as-option-add,CFLAGS,CC,".equ \"x\"$$(comma)1",-DHAVE_AS_QUOTED_SYM)
>>   $(call as-option-add,CFLAGS,CC,"invpcid (%rax)$$(comma)%rax",-DHAVE_AS_INVPCID)
>>   $(call as-option-add,CFLAGS,CC,"movdiri %rax$$(comma)(%rax)",-DHAVE_AS_MOVDIR)
>> --- a/xen/arch/x86/hvm/emulate.c
>> +++ b/xen/arch/x86/hvm/emulate.c
>> @@ -2351,6 +2351,28 @@ static int hvmemul_cache_op(
>>            * to be sensibly used is in (virtualization unaware) firmware.
>>            */
>>           break;
>> +
>> +    case x86emul_cldemote:
>> +        ASSERT(!is_x86_system_segment(seg));
>> +
>> +        if ( !boot_cpu_has(X86_FEATURE_CLDEMOTE) ||
>> +             hvmemul_virtual_to_linear(seg, offset, 0, NULL, hvm_access_none,
>> +                                       hvmemul_ctxt, &addr) != X86EMUL_OKAY )
>> +            break;
>> +
>> +        if ( hvmemul_ctxt->seg_reg[x86_seg_ss].dpl == 3 )
>> +            pfec |= PFEC_user_mode;
>> +
>> +        mapping = hvmemul_map_linear_addr(addr, 0, pfec, hvmemul_ctxt);
>> +        if ( mapping == ERR_PTR(~X86EMUL_EXCEPTION) )
>> +            x86_emul_reset_event(&hvmemul_ctxt->ctxt);
>> +        if ( IS_ERR_OR_NULL(mapping) )
>> +            break;
>> +
>> +        cldemote(mapping);
>> +
>> +        hvmemul_unmap_linear_addr(mapping, addr, 0, hvmemul_ctxt);
>> +        break;
>>       }
>>   
>>       return X86EMUL_OKAY;
>> --- a/xen/arch/x86/include/asm/system.h
>> +++ b/xen/arch/x86/include/asm/system.h
>> @@ -37,6 +37,16 @@ static inline void clwb(const void *p)
>>   #endif
>>   }
>>   
>> +static inline void cldemote(const void *p)
>> +{
>> +#if defined(HAVE_AS_CLDEMOTE)
>> +    asm volatile ( "cldemote %0" :: "m" (*(const char *)p) );
>> +#else
>> +    asm volatile ( ".byte 0x0f, 0x1c, 0x02"
>> +                   :: "d" (p), "m" (*(const char *)p) );
>> +#endif
>> +}
>> +
>>   #define xchg(ptr,v) \
>>       ((__typeof__(*(ptr)))__xchg((unsigned long)(v),(ptr),sizeof(*(ptr))))
>>   
>> --- a/xen/arch/x86/x86_emulate/x86_emulate.c
>> +++ b/xen/arch/x86/x86_emulate/x86_emulate.c
>> @@ -6290,7 +6290,8 @@ x86_emulate(
>>   
>>       case X86EMUL_OPC(0x0f, 0x0d): /* GrpP (prefetch) */
>>       case X86EMUL_OPC(0x0f, 0x18): /* Grp16 (prefetch/nop) */
>> -    case X86EMUL_OPC(0x0f, 0x19) ... X86EMUL_OPC(0x0f, 0x1f): /* nop */
>> +    case X86EMUL_OPC(0x0f, 0x19) ... X86EMUL_OPC(0x0f, 0x1b): /* nop */
>> +    case X86EMUL_OPC(0x0f, 0x1d) ... X86EMUL_OPC(0x0f, 0x1f): /* nop */
>>           break;
>>   
>>   #ifndef X86EMUL_NO_MMX
>> @@ -6627,6 +6628,12 @@ x86_emulate(
>>   
>>   #endif /* !X86EMUL_NO_SIMD */
>>   
>> +    case X86EMUL_OPC(0x0f, 0x1c): /* cldemote / nop */
>> +        if ( ctxt->cpuid->feat.cldemote && !vex.pfx && !modrm_reg &&
>> +             ops->cache_op )
>> +            ops->cache_op(x86emul_cldemote, ea.mem.seg, ea.mem.off, ctxt);
>> +        break;
>> +
>>       case X86EMUL_OPC(0x0f, 0x20): /* mov cr,reg */
>>       case X86EMUL_OPC(0x0f, 0x21): /* mov dr,reg */
>>       case X86EMUL_OPC(0x0f, 0x22): /* mov reg,cr */
>> --- a/xen/arch/x86/x86_emulate/x86_emulate.h
>> +++ b/xen/arch/x86/x86_emulate/x86_emulate.h
>> @@ -177,6 +177,7 @@ enum x86_emulate_fpu_type {
>>   };
>>   
>>   enum x86emul_cache_op {
>> +    x86emul_cldemote,
>>       x86emul_clflush,
>>       x86emul_clflushopt,
>>       x86emul_clwb,
>>
>>
> 


