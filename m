Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 406148071E6
	for <lists+xen-devel@lfdr.de>; Wed,  6 Dec 2023 15:12:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.649320.1013696 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rAscw-0007QI-Pp; Wed, 06 Dec 2023 14:11:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 649320.1013696; Wed, 06 Dec 2023 14:11:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rAscw-0007Nc-Mk; Wed, 06 Dec 2023 14:11:50 +0000
Received: by outflank-mailman (input) for mailman id 649320;
 Wed, 06 Dec 2023 14:11:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rHB2=HR=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1rAscv-0007ND-D4
 for xen-devel@lists.xenproject.org; Wed, 06 Dec 2023 14:11:49 +0000
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [2a00:1450:4864:20::334])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6496c083-9441-11ee-98e5-6d05b1d4d9a1;
 Wed, 06 Dec 2023 15:11:47 +0100 (CET)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-40a4848c6e1so75889535e9.1
 for <xen-devel@lists.xenproject.org>; Wed, 06 Dec 2023 06:11:47 -0800 (PST)
Received: from [10.80.67.30] (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 c1-20020adfa301000000b003333a216682sm11793864wrb.97.2023.12.06.06.11.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 06 Dec 2023 06:11:46 -0800 (PST)
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
X-Inumbo-ID: 6496c083-9441-11ee-98e5-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1701871907; x=1702476707; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/J/0AouVBy2ul+ViGYcNfPUia+BakLB5GkfP7lR2gNQ=;
        b=R+zl6g3KX2w7ErJdtsUjQqBN0m6GgeZISKelBZRxI/V73w79Htnh6c//pTYa/+jnV8
         Ph+k36JZw+UUvox0N+XwVlftY5So87DMJaYpmb+YS7fZHnX5nPF2OoJniManj3h3nlFZ
         nLlNzaFE+ru7FVjHBYgi2eWLOYZcZWa7DlBG4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701871907; x=1702476707;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/J/0AouVBy2ul+ViGYcNfPUia+BakLB5GkfP7lR2gNQ=;
        b=P/zFjbo/axd1rxHtodWBTrZQsx8EgIMoAZTVsTDEJ0JPx3pFqVGahVq4Ah8E9Qok7G
         IVzQBc6UkpY8s/cmDR2vzLFqJwYfKJmWWicGDQMsAkiy012ReWcHHbpHODTgFD2iefMw
         VSWxGy6Gjj5GqUtjmo94bHE6lyXKk5MrhLH1IPUljgBYRnNVnKVt16u2FCS2uus0HEjW
         V4g6tRCMgDJwtEb6H/pF+NJraRbd7mAp2g7VpJGHGLD/D8QX4wSIe5xf5KxTnykPZ7IO
         W4pT3j8wBtGkdsJhwr3gtsISlUo2JHTAnO/yqRLpbD4OrpwaXG4C5JrkeLByB8DYlaIz
         zFmQ==
X-Gm-Message-State: AOJu0YwteQjQyKt50I669yxqS5zvctdMuHLlsFc1rJH5snGCKiGl2h6f
	Bea/rOp1odHljErgsVHx3n9WAw==
X-Google-Smtp-Source: AGHT+IFNMx+Klo1CEPaJ26/dBlw3sjXlNL46V08+iyKrIoZzyUVgJsGVXWSyD7pSk5JuLC7WZwHGiw==
X-Received: by 2002:a05:600c:5253:b0:40b:5e4a:4081 with SMTP id fc19-20020a05600c525300b0040b5e4a4081mr623446wmb.161.1701871907211;
        Wed, 06 Dec 2023 06:11:47 -0800 (PST)
Message-ID: <4e41b658-f49e-424c-8a86-08c8ab8e384d@citrix.com>
Date: Wed, 6 Dec 2023 14:11:46 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v13 26/35] x86/fred: FRED entry/exit and dispatch code
Content-Language: en-GB
To: "Li, Xin3" <xin3.li@intel.com>,
 "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-edac@vger.kernel.org" <linux-edac@vger.kernel.org>,
 "linux-hyperv@vger.kernel.org" <linux-hyperv@vger.kernel.org>,
 "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: "tglx@linutronix.de" <tglx@linutronix.de>,
 "mingo@redhat.com" <mingo@redhat.com>, "bp@alien8.de" <bp@alien8.de>,
 "dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>,
 "x86@kernel.org" <x86@kernel.org>, "hpa@zytor.com" <hpa@zytor.com>,
 "Lutomirski, Andy" <luto@kernel.org>,
 "pbonzini@redhat.com" <pbonzini@redhat.com>,
 "seanjc@google.com" <seanjc@google.com>,
 "peterz@infradead.org" <peterz@infradead.org>,
 "Gross, Jurgen" <jgross@suse.com>, "Shankar, Ravi V"
 <ravi.v.shankar@intel.com>, "mhiramat@kernel.org" <mhiramat@kernel.org>,
 "jiangshanlai@gmail.com" <jiangshanlai@gmail.com>,
 "nik.borisov@suse.com" <nik.borisov@suse.com>,
 "Kang, Shan" <shan.kang@intel.com>
References: <20231205105030.8698-1-xin3.li@intel.com>
 <20231205105030.8698-27-xin3.li@intel.com>
 <f260ddf9-be67-48e0-8121-6f58d46f7978@citrix.com>
 <SA1PR11MB67343544B0CEB6C82002790DA884A@SA1PR11MB6734.namprd11.prod.outlook.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <SA1PR11MB67343544B0CEB6C82002790DA884A@SA1PR11MB6734.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 06/12/2023 7:45 am, Li, Xin3 wrote:
>>> +	case X86_TRAP_OF:
>>> +		exc_overflow(regs);
>>> +		return;
>>> +
>>> +	/* INT3 */
>>> +	case X86_TRAP_BP:
>>> +		exc_int3(regs);
>>> +		return;
>> ... neither OF nor BP will ever enter fred_intx() because they're type SWEXC not
>> SWINT.
> Per FRED spec 5.0, section 7.3 Software Interrupts and Related Instructions:
> INT n (opcode CD followed by an immediate byte): There are 256 such
> software interrupt instructions, one for each value n of the immediate
> byte (0–255).
>
> And appendix B Event Stack Levels:
> If the event is an execution of INT n (opcode CD n for 8-bit value n),
> the event stack level is 0. The event type is 4 (software interrupt)
> and the vector is n.
>
> So int $0x4 and int $0x3 (use asm(".byte 0xCD, 0x03")) get here.
>
> But into (0xCE) and int3 (0xCC) do use event type SWEXC. 
>
> BTW, into is NOT allowed in 64-bit mode but "int $0x4" is allowed.

There is certainly fun to be had with CD 03 and CD 04 byte patterns, but
if you meant to mean those here, then the comments are wrong.

Vectors 3 and 4 are installed with DPL3 because that is necessary to
make CC and CE function in userspace.  It also suggests that the SWINT
vs SWEXC distinction was retrofitted to architecture after the 286,
because exceptions don't check DPL and ICEBP delivers #DB from userspace
even when Vector 1 has a DPL of 0.

While CC is for most cases indistinguishable from CD 03, CE behaves
entirely differently to CD 04.  CD 04 doesn't #UD in 64bit mode, and
will trigger exc_overflow() irrespective of the state of EFLAGS.OF.


The SDM goes out of it's way to say not to use the CD 03 byte pattern
(and it does take effort to emit this byte pattern - e.g. GAS will
silently translate "int $3" to "int3"), and there's no plausible way
software is using CD 04 in place of CE.

So why do we care about containing to make mistakes of the IDT era work
in a FRED world?

Is there anything (other than perhaps the selftests) which would even
notice?

>>> +		instrumentation_end();
>>> +		irqentry_exit(regs, state);
>>> +	} else {
>>> +		common_interrupt(regs, vector);
>>> +	}
>>> +}
>>> +
>>> +static noinstr void fred_exception(struct pt_regs *regs, unsigned
>>> +long error_code) {
>>> +	/* Optimize for #PF. That's the only exception which matters performance
>> wise */
>>> +	if (likely(regs->fred_ss.vector == X86_TRAP_PF)) {
>>> +		exc_page_fault(regs, error_code);
>>> +		return;
>>> +	}
>>> +
>>> +	switch (regs->fred_ss.vector) {
>>> +	case X86_TRAP_DE: return exc_divide_error(regs);
>>> +	case X86_TRAP_DB: return fred_exc_debug(regs);
>>> +	case X86_TRAP_BP: return exc_int3(regs);
>>> +	case X86_TRAP_OF: return exc_overflow(regs);
>> Depending on what you want to do with BP/OF vs fred_intx(), this may need
>> adjusting.
>>
>> If you are cross-checking type and vector, then these should be rejected for not
>> being of type HWEXC.
> You're right, the event type needs to be SWEXC for into and int3.
>
> However, would it be overkilling?  Assuming hardware and VMM are sane.

You either care about cross checking, or not.  Right now, this patch is
a mix of the two approaches.

In my opinion, cross-checking is the better approach, because it means
that violations of the assumptions get noticed more quickly, and
hopefully by whomever is working on the new feature which alters the
assumptions.

~Andrew

