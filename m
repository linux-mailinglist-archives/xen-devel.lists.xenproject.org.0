Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BC7DA7E2CB
	for <lists+xen-devel@lfdr.de>; Mon,  7 Apr 2025 16:57:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.940302.1340118 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u1nuZ-00089Y-OL; Mon, 07 Apr 2025 14:57:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 940302.1340118; Mon, 07 Apr 2025 14:57:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u1nuZ-00086Q-KD; Mon, 07 Apr 2025 14:57:19 +0000
Received: by outflank-mailman (input) for mailman id 940302;
 Mon, 07 Apr 2025 14:57:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZxXC=WZ=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1u1nuY-00086I-1h
 for xen-devel@lists.xenproject.org; Mon, 07 Apr 2025 14:57:18 +0000
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [2a00:1450:4864:20::332])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9850a1d9-13c0-11f0-9ffb-bf95429c2676;
 Mon, 07 Apr 2025 16:57:16 +0200 (CEST)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-43cef035a3bso30112175e9.1
 for <xen-devel@lists.xenproject.org>; Mon, 07 Apr 2025 07:57:16 -0700 (PDT)
Received: from [192.168.1.183] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39c30226acfsm12104940f8f.88.2025.04.07.07.57.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Apr 2025 07:57:14 -0700 (PDT)
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
X-Inumbo-ID: 9850a1d9-13c0-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1744037835; x=1744642635; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=QU8b84z/G2cMAzWzl2yvboV0TtpbhH4ahq/+4ph3FjU=;
        b=S0fWycpok9O/Vfo2Q4HDq65Z+IISFKPCbIRrDiohG+BvZiriKGc2/Dkgpqrb2KNzJL
         rInIf2DwXnFU2Y8yc2kUWkRbOgwM19waZWbM2hr5U7QsPdSHUXzlp0rX2g47ScW0Sc5g
         Oaun8V8mZkTovjXUlG6ipDD2CVVD+UuP6LvbI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744037835; x=1744642635;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QU8b84z/G2cMAzWzl2yvboV0TtpbhH4ahq/+4ph3FjU=;
        b=K1eYCMu+t1YjhCHO7BA7ww4KefLeNRI5Zp7IkWS5U8AbBjurTOFLTLoyr83/I1ArUv
         OBHO98KroBRlOnaMjSM/v8/A12uDxlNIh9tX7B5bGji7xy/hhblwdPzP/blKRURRmbbi
         HMg+1sQ+yQ+Xmv5kZ2Hzj3Yl8uyScXUZ7uM2MeteShvLkMdNDWuKlrirzS7Qbfk8Bygz
         dr3IjsaDqMvIU9shqj/Nn7P/FsgLmtpjVPXcBnVOeC2Id9jkthyunhqIYB9KUxQO+ZpY
         sJ+5blrPt2ufg0sISxS5AcIgovhUIutypH+9lVPV9t+KgNn1VchOtdLLDmEAf62lXLqS
         slnA==
X-Forwarded-Encrypted: i=1; AJvYcCW9ClEFJtpylf2p19WuJPdIjl7uEAqYd4By7AzxSAq+JCJpXtm3/VGngZCbrdFudR8lNNjQgHz6BQs=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwwZIBFwkevxkmBwjbwAnWGTEYPX35i75od+SESyJT8vnDY43fE
	ThtJutAsjyZHhKVCWDRHiSW2OhLapYyZcXsTEdAg7aDAyz4Qk6aw8DQ9DaRV4AI=
X-Gm-Gg: ASbGncuqMYvNM/+ol7MBbCY0wFulEhtV19NYVLP7zIzp4/iYBXIghUvP//mfP57HF9Y
	cEhloA30abx7VMzbguN1DDHVxUzl5cYL2IJHciuY9feBCtl6Ti7iDxMI6DrJQJBFEgkiFGV8wGr
	nBLZxvjvyTmKNk4MyNx3Z16Eus21/DbWfJBWTWnc9JfvuBjD2F/dYvg8p4YAfLctfRuNEIyWSzB
	zZaEA/Js3OWkP3EZQy9XXvEW6106bLXloI2ZKVsqqzWjXkAiIHI45mBFoPtNhzCWqO+HYzgtBok
	IYHaUOsZDX3Ve7wf+0hSbpVbNz27OgKw5LfYLBVwvyPIPQ+GjBm2ZOSWn3B369nsn9Yg3Uv/aHT
	WLZcvi803T4mIEOPVAkKq
X-Google-Smtp-Source: AGHT+IGOsF7nkmH3dR1t2H/bG9Wtg2dzQMaqDBl+c0+sCSB1MzKTln4kaIwSb45vzvI0Bm+IEtHiDQ==
X-Received: by 2002:a05:600c:474e:b0:43d:fa5d:9315 with SMTP id 5b1f17b1804b1-43ecfa07060mr93759575e9.33.1744037835346;
        Mon, 07 Apr 2025 07:57:15 -0700 (PDT)
Message-ID: <20c0d40a-881b-489f-b4da-ed052ede29de@citrix.com>
Date: Mon, 7 Apr 2025 15:57:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/vmx: Drop memory clobbers on VMX instruction wrappers
To: Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20250407104544.1823150-1-andrew.cooper3@citrix.com>
 <b400a011-e173-4d6f-b0b7-bcbe59e994cd@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <b400a011-e173-4d6f-b0b7-bcbe59e994cd@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 07/04/2025 1:00 pm, Jan Beulich wrote:
> On 07.04.2025 12:45, Andrew Cooper wrote:
>> The use, or not, of memory clobbers on the VMX instructions is complicated.
>>
>> There are two separate aspects to consider:
>>
>> 1. Originally, the VMX instructions used hardcoded bytes, including memory
>>    encodings.  Therefore, the compiler couldn't see the correct relationship
>>    between parameters.  The memory clobber for this purpose should have been
>>    dropped when switching to mnemonics.
>>
>>    This covers INVEPT and INVVPID, each of which has no change in memory, nor
>>    in fact the current address space in use.
> Yet then they need to come after respective table modifications.

They don't AFAICT, but the reasoning is complicated.  I'll expand on it
in v2.

>
>> 2. Most of these instructions operate on a VMCS region.  This is a (mostly)
>>    opaque data structure, operated on by physical address.  Again, this hides
>>    the relationship between the instructions and the VMCS from the compiler.
>>
>>    The processor might use internal state to cache the VMCS (writing it back
>>    to memory on VMCLEAR), or it might operate on memory directly.
>>
>>    Because the VMCS is opaque (so the compiler has nothing interesting to know
>>    about it), and because VMREAD/VMWRITE have chosen not to use a memory
>>    clobber (to tell the compiler that something changed), none of the other
>>    VMX instructions should use a memory clobber either.
> For this, there's actually a good example below, with everything needed in
> context.
>
>>    This covers VMXON, VMXOFF, VMPTRLD and VMPTCLEAR.
> Nit: The last insn is VMCLEAR.

Oh, so it is, and we've got an incorrectly named wrapper.

>
>> --- a/xen/arch/x86/hvm/vmx/vmcs.c
>> +++ b/xen/arch/x86/hvm/vmx/vmcs.c
>> @@ -754,7 +754,7 @@ static int _vmx_cpu_up(bool bsp)
>>                 _ASM_EXTABLE(1b, %l[vmxon_fault])
>>                 :
>>                 : [addr] "m" (this_cpu(vmxon_region))
>> -               : "memory"
>> +               :
>>                 : vmxon_fail, vmxon_fault );
>>  
>>      this_cpu(vmxon) = 1;
>> @@ -811,7 +811,7 @@ void cf_check vmx_cpu_down(void)
>>  
>>      BUG_ON(!(read_cr4() & X86_CR4_VMXE));
>>      this_cpu(vmxon) = 0;
>> -    asm volatile ( "vmxoff" ::: "memory" );
>> +    asm volatile ( "vmxoff" );
> With the clobber dropped, the compiler is free to re-order the prior store
> with the asm(), despite the "volatile", isn't it? [1] This may then be
> applicable elsewhere as well.

Yeah, these might better stay as they are.

~Andrew

