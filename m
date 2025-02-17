Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E915BA38ABF
	for <lists+xen-devel@lfdr.de>; Mon, 17 Feb 2025 18:40:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.890779.1299915 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tk56P-00066t-2l; Mon, 17 Feb 2025 17:40:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 890779.1299915; Mon, 17 Feb 2025 17:40:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tk56O-00064x-VO; Mon, 17 Feb 2025 17:40:16 +0000
Received: by outflank-mailman (input) for mailman id 890779;
 Mon, 17 Feb 2025 17:40:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xGAw=VI=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tk56O-00064r-4N
 for xen-devel@lists.xenproject.org; Mon, 17 Feb 2025 17:40:16 +0000
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [2a00:1450:4864:20::32f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3c45a0e4-ed56-11ef-9896-31a8f345e629;
 Mon, 17 Feb 2025 18:40:10 +0100 (CET)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-4396f579634so12597175e9.1
 for <xen-devel@lists.xenproject.org>; Mon, 17 Feb 2025 09:40:10 -0800 (PST)
Received: from [192.168.1.10] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4395a1b8397sm158542855e9.36.2025.02.17.09.40.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Feb 2025 09:40:09 -0800 (PST)
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
X-Inumbo-ID: 3c45a0e4-ed56-11ef-9896-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1739814010; x=1740418810; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=+0AR72ezpvuS9woD+ZYrlBsYsyW0ZagCSbXqzZ89EG4=;
        b=exOFXsGi33I5CLeQRw6T3fRQYA/+Xd367HuC5waBn9gYiyDTsDSjLVMxSwsb8BaRbI
         oyu77Yl5e4FWXE9t6PBF6mY6tgjipWdL9UAbAzeBlJ7ARNOD7O62oWmBgiLMTds5XM1L
         ZXgacozyomXp9Uk1ENGORTyFY4c0oQwuv2Hww=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739814010; x=1740418810;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+0AR72ezpvuS9woD+ZYrlBsYsyW0ZagCSbXqzZ89EG4=;
        b=C983GxiFdA9grXLu19qEvQesv3KaXHcbqFyPeTJwoRhc5Np2PV4LSwD3BiVGIql7ED
         qcuj65RRVrd153vzss2UjSSLRONUeamKDpo1Nr6Sy+u2wrk3eh7NO32S0JMk5098NvYU
         AR8AUnel0e3rdMjQth7BTK6kn2Msrd/46s/t3wP6Y8s1/rIVCyGm3vsGtbq6NOdTdf1x
         m8GMLhrdbd1JosF+iUQb8VujX9DQ6opZjl9x/WLj+0dlLa1oqXcmxb/itvHyLrDGvawU
         Ob/nNK2w8TzW+7wRhdR3vjCnQdnbwD9PdHL3bnj6MAIT7PAKgNtOXUAXwSEPQcjcp0Wx
         h6cA==
X-Forwarded-Encrypted: i=1; AJvYcCXp6ho1gDcWFoHTRzNwY3KusPKgtFTM2bnHO8CRZe67LqTxQAuBXqtAb411MMzTcua+4PkG4RgMC4k=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzHwIfM+xKaMT3XxN2V6uukswTEfrLGHiYSemGMVgRKh4o/axep
	RRDAib3omopKIYrue61H6uyBvqnhNSLlXS7JGO3lPZQVOKSVAhrccRU4Fr+HSuQ=
X-Gm-Gg: ASbGncts7MCIZziCFWVT8Vy++wju6Ay4t3WWM8dNTyHzb9EDSWKekwqqhImOslEoFKx
	I5iroabYF9IMahNVxAHdpciahe1eyEMRKsuMrCO1eC9c0nuah7R0i2t8fUCERgVAeibYhQjROZJ
	Srt3O4KWELdOxBZ6M9TN131GGWp7471oicHcdi9vuFQbqSWnk3pPnaEawg/kYGedn60TD0XAwWF
	JZvCfiBoDC7WW7dmEzTCR8PDkTNXiJ/xnubci3O9JzC6PbNmawwPVjU0nQt2MAGvb2RJ7h2ZA5y
	ZYitqi5vFRv5nBYk4yvc540X09xa7FbS73qARylPbEEW2HWsfzQoiEM=
X-Google-Smtp-Source: AGHT+IEycQyvE6Q5D0SifwadtMGlxZh0IYLfqeY8OMAq2N433lCELeMgjCiO4neN8ogq8M5PNJCJ+g==
X-Received: by 2002:a05:600c:3c9d:b0:439:6ab6:5d46 with SMTP id 5b1f17b1804b1-4396e74b143mr93231235e9.27.1739814010106;
        Mon, 17 Feb 2025 09:40:10 -0800 (PST)
Message-ID: <8edb290a-ed47-42c5-b809-5ec73fb2bd3e@citrix.com>
Date: Mon, 17 Feb 2025 17:40:09 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/svm: Separate STI and VMRUN instructions in
 svm_asm_do_resume()
To: Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20250217161241.537168-1-andrew.cooper3@citrix.com>
 <7763e57c-a2d2-4642-b613-8628ae4c55da@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <7763e57c-a2d2-4642-b613-8628ae4c55da@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 17/02/2025 4:51 pm, Jan Beulich wrote:
> On 17.02.2025 17:12, Andrew Cooper wrote:
>> There is a corner case in the VMRUN instruction where its INTR_SHADOW state
>> leaks into guest state if a VMExit occurs before the VMRUN is complete.  An
>> example of this could be taking #NPF due to event injection.
> Ouch.

Yeah.  Intel go out of their way to make VM{LAUNCH,RESUME} fail if
they're executed in a shadow.

>
>> --- a/xen/arch/x86/hvm/svm/entry.S
>> +++ b/xen/arch/x86/hvm/svm/entry.S
>> @@ -57,6 +57,14 @@ __UNLIKELY_END(nsvm_hap)
>>  
>>          clgi
>>  
>> +        /*
>> +         * Set EFLAGS.IF, after CLGI covers us from real interrupts, but not
>> +         * immediately prior to VMRUN.  AMD CPUs leak Xen's INTR_SHADOW from
>> +         * the STI into guest state if a VMExit occurs during VMEntry
>> +         * (e.g. taking #NPF during event injecting.)
>> +         */
>> +        sti
>> +
>>          /* WARNING! `ret`, `call *`, `jmp *` not safe beyond this point. */
>>          /* SPEC_CTRL_EXIT_TO_SVM       Req: b=curr %rsp=regs/cpuinfo, Clob: acd */
>>          .macro svm_vmentry_spec_ctrl
> I'm mildly worried to see it moved this high up. Any exception taken in
> this exit code would consider the system to have interrupts enabled, when
> we have more restrictive handling for the IF=0 case. Could we meet in the
> middle and have STI before we start popping registers off the stack, but
> after all the speculation machinery?

Any exception taken here is fatal, and going to fail in weird ways. 
e.g. we don't clean up GIF before entering the crash kernel.

But yes, we probably should take steps to avoid the interrupted context
from looking even more weird than usual.

I'll put it above the line of pops.  They're going to turn into a single
macro when I can dust off that series.

~Andrew

