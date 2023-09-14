Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 489017A1202
	for <lists+xen-devel@lfdr.de>; Fri, 15 Sep 2023 01:46:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.602780.939524 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qgw2e-0004XI-Jh; Thu, 14 Sep 2023 23:46:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 602780.939524; Thu, 14 Sep 2023 23:46:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qgw2e-0004VN-H1; Thu, 14 Sep 2023 23:46:36 +0000
Received: by outflank-mailman (input) for mailman id 602780;
 Thu, 14 Sep 2023 23:46:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uqVP=E6=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1qgw2c-0004VH-VQ
 for xen-devel@lists.xenproject.org; Thu, 14 Sep 2023 23:46:35 +0000
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [2a00:1450:4864:20::635])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id eeba03a0-5358-11ee-9b0d-b553b5be7939;
 Fri, 15 Sep 2023 01:46:32 +0200 (CEST)
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-9a9d6b98845so588666166b.0
 for <xen-devel@lists.xenproject.org>; Thu, 14 Sep 2023 16:46:32 -0700 (PDT)
Received: from [192.168.1.10] (host-92-12-44-130.as13285.net. [92.12.44.130])
 by smtp.gmail.com with ESMTPSA id
 m21-20020a1709060d9500b009937dbabbd5sm1623158eji.220.2023.09.14.16.46.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Sep 2023 16:46:31 -0700 (PDT)
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
X-Inumbo-ID: eeba03a0-5358-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1694735192; x=1695339992; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:references:cc:to
         :content-language:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=jEsOE3VahVBRrZQB+F/BuNrsfqTbbzggGN9bcwX+LFw=;
        b=lT5FHXCeAL6Rr0+7yJX7HnM1I43JN1zkZ2cZ01S7IH34g9/oKj9U1xpgXoauUcpIIp
         uvfkLHgIC9D8YAJGNjffdCJJL00QAwOKLmysy6/467BzxPQSyIyyeo93ETLwQVbfJynT
         YaeyQf/YMy4X+xtc0sYaRRe0d8iaLTGfmTgwU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694735192; x=1695339992;
        h=content-transfer-encoding:in-reply-to:references:cc:to
         :content-language:subject:from:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jEsOE3VahVBRrZQB+F/BuNrsfqTbbzggGN9bcwX+LFw=;
        b=l/M2OlR610l+TV1PzdzSZuV3o3nJdOkXnauHnAg/AIHmB3sBQhT8Nz+lKQkrqNvuYc
         +LNWBrEbhjzuPFque5pWuFI1W9LxuRLGYGwLuzB1UVbAs7ylnzHez7kbPuL/6T2j+0Eh
         to9gX4MgDX6Ulcfol8nToNipfvjWnJhT/N70gE6YUd4Oe4mZhqeTu66d+6xphbzZSmlP
         PBaLwZV/WMlAxgGcVlu1buGmM+uj9dkI7H/bZu/81iuEWbgSYMnwNJ/1tBAKLzw3lL2q
         pBhNldtOFAZXjSg2PaJnFmX2bgquNcaot3qXRj6xcmhbPoVNPs/80fEMYnTuYhenKSqm
         zoFA==
X-Gm-Message-State: AOJu0YzCurw6zTnDzncN6avOYEiH9LJev/6x4DDAweRnwnSjddSeOINE
	fLiTFe1cGFCMC2rL+WcMzxy7VA==
X-Google-Smtp-Source: AGHT+IFdLzHxkpcWBSKfZyEmhUJiAzFwTc5lp2rJbnp1c8teqkmJckhwUBhX6fJYxYR6W8lj/upGVQ==
X-Received: by 2002:a17:906:51d0:b0:9a1:fda6:2e2a with SMTP id v16-20020a17090651d000b009a1fda62e2amr179416ejk.9.1694735191861;
        Thu, 14 Sep 2023 16:46:31 -0700 (PDT)
Message-ID: <7ba4ae3e-f75d-66a8-7669-b6eb17c1aa1c@citrix.com>
Date: Fri, 15 Sep 2023 00:46:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
From: andrew.cooper3@citrix.com
Subject: Re: [PATCH v10 03/38] x86/msr: Add the WRMSRNS instruction support
Content-Language: en-GB
To: Thomas Gleixner <tglx@linutronix.de>, Xin Li <xin3.li@intel.com>,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-edac@vger.kernel.org, linux-hyperv@vger.kernel.org,
 kvm@vger.kernel.org, xen-devel@lists.xenproject.org
Cc: mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com,
 x86@kernel.org, hpa@zytor.com, luto@kernel.org, pbonzini@redhat.com,
 seanjc@google.com, peterz@infradead.org, jgross@suse.com,
 ravi.v.shankar@intel.com, mhiramat@kernel.org, jiangshanlai@gmail.com
References: <20230914044805.301390-1-xin3.li@intel.com>
 <20230914044805.301390-4-xin3.li@intel.com>
 <6f5678ff-f8b1-9ada-c8c7-f32cfb77263a@citrix.com> <87y1h81ht4.ffs@tglx>
In-Reply-To: <87y1h81ht4.ffs@tglx>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 15/09/2023 12:00 am, Thomas Gleixner wrote:
>> and despite what Juergen said, I'm going to recommend that you do wire
>> this through the paravirt infrastructure, for the benefit of regular
>> users having a nice API, not because XenPV is expecting to do something
>> wildly different here.
> I fundamentaly hate adding this to the PV infrastructure. We don't want
> more PV ops, quite the contrary.

What I meant was "there should be the two top-level APIs, and under the
covers they DTRT".  Part of doing the right thing is to wire up paravirt
for configs where that is specified.

Anything else is going to force people to write logic of the form:

    if (WRMSRNS && !XENPV)
        wrmsr_ns(...)
    else
        wrmsr(...)

which is going to be worse overall.  And there really is one example of
this antipattern already in the series.


> For the initial use case at hand, there is an explicit FRED dependency
> and the code in question really wants to use WRMSRNS directly and not
> through a PV function call.
>
> I agree with your reasoning for the more generic use case where we can
> gain performance independent of FRED by using WRMSRNS for cases where
> the write has no serialization requirements.
>
> But this made me look into PV ops some more. For actual performance
> relevant code the current PV ops mechanics are a horrorshow when the op
> defaults to the native instruction.
>
> Let's look at wrmsrl():
>
> wrmsrl(msr, val
>  wrmsr(msr, (u32)val, (u32)val >> 32))
>   paravirt_write_msr(msr, low, high)
>     PVOP_VCALL3(cpu.write_msr, msr, low, high)
>
> Which results in
>
> 	mov	$msr, %edi
> 	mov	$val, %rdx
> 	mov	%edx, %esi
> 	shr	$0x20, %rdx
> 	call	native_write_msr
>
> and native_write_msr() does at minimum:
>
> 	mov    %edi,%ecx
> 	mov    %esi,%eax
> 	wrmsr
>         ret

Yeah, this is daft.  But it can also be fixed irrespective of WRMSRNS.

WRMSR has one complexity that most other PV-ops don't, and that's the
exception table reference for the instruction itself.

In a theoretical future ought to look like:

    mov    $msr, %ecx
    mov    $lo, %eax
    mov    $hi, %edx
    1: {call paravirt_blah(%rip) | cs...cs wrmsr | cs...cs wrmsrns }
    _ASM_EXTABLE(1b, ...)

In paravirt builds, the CALL needs to be the emitted form, because it
needs to function in very early boot.

But once the paravirt-ness has been chosen and alternatives run, the
as-native paths are fully inline.

The alternative which processes this site wants to conclude that, in the
case it does not alter from the CALL, to clobber the EXTABLE reference. 
CALL instructions can #GP, and you don't want to end up thinking you're
handling a WRMSR #GP when in fact it was a non-canonical function pointer.

> In the worst case 'ret' is going through the return thunk. Not to talk
> about function prologues and whatever.
>
> This becomes even more silly for trivial instructions like STI/CLI or in
> the worst case paravirt_nop().

STI/CLI are already magic.  Are they not inlined?

> The call makes only sense, when the native default is an actual
> function, but for the trivial cases it's a blatant engineering
> trainwreck.
>
> I wouldn't care at all if CONFIG_PARAVIRT_XXL would be the esoteric use
> case, but AFAICT it's default enabled on all major distros.
>
> So no. I'm fundamentally disagreeing with your recommendation. The way
> forward is:
>
>   1) Provide the native variant for wrmsrns(), i.e. rename the proposed
>      wrmsrns() to native_wrmsr_ns() and have the X86_FEATURE_WRMSRNS
>      safety net as you pointed out.
>
>      That function can be used in code which is guaranteed to be not
>      affected by the PV_XXL madness.
>
>   2) Come up with a sensible solution for the PV_XXL horrorshow
>
>   3) Implement a sane general variant of wrmsr_ns() which handles
>      both X86_FEATURE_WRMSRNS and X86_MISFEATURE_PV_XXL
>
>   4) Convert other code which benefits from the non-serializing variant
>      to wrmsr_ns()

Well - point 1 is mostly work that needs reverting as part of completing
point 3, and point 2 clearly needs doing irrespective of anything else.

Thanks,

~Andrew

