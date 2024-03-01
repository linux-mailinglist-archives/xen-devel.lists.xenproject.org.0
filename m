Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EB9586E0C4
	for <lists+xen-devel@lfdr.de>; Fri,  1 Mar 2024 12:59:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.687625.1071313 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rg1XM-0001hk-PQ; Fri, 01 Mar 2024 11:58:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 687625.1071313; Fri, 01 Mar 2024 11:58:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rg1XM-0001fH-Mi; Fri, 01 Mar 2024 11:58:48 +0000
Received: by outflank-mailman (input) for mailman id 687625;
 Fri, 01 Mar 2024 11:58:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=do9M=KH=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1rg1XK-0001es-UD
 for xen-devel@lists.xenproject.org; Fri, 01 Mar 2024 11:58:46 +0000
Received: from mail-qk1-x72e.google.com (mail-qk1-x72e.google.com
 [2607:f8b0:4864:20::72e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0df2a087-d7c3-11ee-afd8-a90da7624cb6;
 Fri, 01 Mar 2024 12:58:45 +0100 (CET)
Received: by mail-qk1-x72e.google.com with SMTP id
 af79cd13be357-787c900af02so150582285a.1
 for <xen-devel@lists.xenproject.org>; Fri, 01 Mar 2024 03:58:45 -0800 (PST)
Received: from [10.80.67.149] (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 po10-20020a05620a384a00b00787bb956e07sm1568460qkn.76.2024.03.01.03.58.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 01 Mar 2024 03:58:43 -0800 (PST)
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
X-Inumbo-ID: 0df2a087-d7c3-11ee-afd8-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1709294324; x=1709899124; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Q0uBECgOumcLo4ycKlv0F8SbxteGojvvBk2nW0PcJlI=;
        b=JP9pyxz09QfRQZQjspyq83y5naTA18C7bAutnSnwE0cENTVEadL85/M/aiLuW50Ac/
         mMKmTWadCIOZscjFaoUhxv8PCGCLtcujZWK/Ih5ljPMRPJepZMzwwQwQXA7givpbsJSg
         KSDg1gbUcGv2V5zddhtz0LI2FazkT5DasvRvc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709294324; x=1709899124;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Q0uBECgOumcLo4ycKlv0F8SbxteGojvvBk2nW0PcJlI=;
        b=WuU8IB6iV4ZLEIYOfi02alOXmAVHorxd9NY+TKZBsTF30Yaiex3lawobj1HiAI3lEG
         QGbPzP1pqAg2bpZiE7y2An02y56+y4oQyEBSLebEiHndVrPjIgrck/8rEEfAC33u6nVS
         wxwF46Oet6Coh7g3NW7HM7QZrpTsZtUWjyTBV9BRj2YLwMNDJ9hOjeiI9OoWPTIM0JXb
         eRRZaFsjAq+OonJ8NvTMnSrHf/rfmQRHvI1y2zrm1E+Okpt8c7EaY8U/Vm3hjYslAPpC
         cjP0ejKgBCymE7D3zwww/7zOMa1GZLokaFornQYluXDC4dmJfU50Ym+de+SBDUyWHCji
         RIzA==
X-Forwarded-Encrypted: i=1; AJvYcCUk4MOEHltYDywcwc0j+SYI3rF+kV/klF6JaRbsjhqW3hoy49k0q+hnJrGQxBU6Nuz/7fjBmLtSCRtNykkObRb8oWm2CinsRU8t1xMGN7o=
X-Gm-Message-State: AOJu0Yyhjd7mVLn7TYMNmxMV8INbc7Y4C1NfBzwaUAyNlcRT+I4tvVOu
	O4WNPcHOdYn2Eg/gRFa3rEUa6n8LJ077YWasi+hrYfmrMStWBaXxP3RGYuZMeGU=
X-Google-Smtp-Source: AGHT+IGQlTqkV8d/1sludf0XM1jEEUksJottcjFTVBoK6NqUQATzkDovRkBDALMBL+kpglSMgBu5MQ==
X-Received: by 2002:a05:620a:45a0:b0:788:2d3:8c9c with SMTP id bp32-20020a05620a45a000b0078802d38c9cmr5467858qkb.27.1709294324292;
        Fri, 01 Mar 2024 03:58:44 -0800 (PST)
Message-ID: <24db0ffc-fdab-4368-8a97-5c8fb8c2b779@citrix.com>
Date: Fri, 1 Mar 2024 11:58:41 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Violations of MISRA C Rule 20.7 in
 xen/arch/x86/include/asm/hvm/trace.h
Content-Language: en-GB
To: Nicola Vetrini <nicola.vetrini@bugseng.com>,
 Xen Devel <xen-devel@lists.xenproject.org>
Cc: George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Jbeulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, Wei Liu <wl@xen.org>,
 Roger Pau <roger.pau@citrix.com>, Consulting <consulting@bugseng.com>
References: <f4d01f28c7041359df0e256f819bcd31@bugseng.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <f4d01f28c7041359df0e256f819bcd31@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 01/03/2024 11:43 am, Nicola Vetrini wrote:
> Reporting the discussion that took place on Matrix on the matter, so
> that it can carry on here with all interested parties:
>
>> Hi everyone. I was looking at MISRA violations for Rule 20.7
>> ("Expressions resulting from the expansion of macro parameters shall
>> be enclosed in parentheses") generated by
>>
>>     #define TRC_PAR_LONG(par) ((uint32_t)(par)), ((par) >> 32)
>>
>> The thing here is this: the simplest fix is
>>
>>     -#define TRC_PAR_LONG(par) ((uint32_t)(par)), ((par) >> 32)
>>     +#define TRC_PAR_LO(par) ((uint32_t)(par))
>>     +#define TRC_PAR_HI(par) ((par) >> 32)
>>
>> and then replace all call sites accordingly. However, in certain
>> places (e.g., svm.c:1445), this causes a build error:
>>
>>     arch/x86/hvm/svm/svm.c: In function ‘svm_inject_event’:
>>     arch/x86/hvm/svm/svm.c:1445:1: error: macro "HVMTRACE_3D"
>> requires 4 arguments, but only 3 given
>>     1445 | TRC_PAR_LO(_event.cr2), TRC_PAR_HI(_event.cr2));
>>     | ^
>>     In file included from arch/x86/hvm/svm/svm.c:31:
>>
>> this is due to the somewhat strange definition of HVMTRACE_3D which
>> works with the previous form of the macro, but not the current one,
>> as the macro argument in HVMTRACE_LONG_2D is now split (_LO is d2 and
>> _HI is variadic), and therefore it's not passed to HVMTRACE_3D
>> anymore as two arguments.
>> I have a proposal: introduce a d3 argument to HVMTRACE_LONG_2D to
>> supply the additional argument and/or make HVMTRACE_LONG_2D
>> non-variadic. This would of course apply to the similarly named
>> macros in xen/arch/x86/include/asm/hvm/trace.h
>
> Andrew Cooper:
>> sigh - I'm half way through deleting all of that
>> guess I ought to finish
>
> Andrew Cooper:
>> @Nicola Vetrini:
>> https://xenbits.xen.org/gitweb/?p=people/andrewcoop/xen.git;a=shortlog;h=refs/heads/xen-trace
>> On second thoughts I'm not sure it fixes the problem
>> just changes it.  The problem is the use of macros to split a 64bit
>> quantity across two 32bit fields
>
> Nicola Vetrini:
>> It seems so, yes. But afaict this can be fixed by splitting the macro
>> definition in two, as done above, which wouldn't incur in the
>> compilation error on the new API
>
> Andrew Cooper:
>> given the users of TRACE_PARAM64() by the end, I'd prefer to do that
>> with real structs rather than perpetuating the macro mess
>
> George Dunlap:
>> It's been a long time since I looked at all this, but FWIW I
>> inherited all the weird macro stuff, never liked it, and myself used
>> structs for all new traces. So without having looked at the code at
>> all, I'm predisposed to agree w/ Andy's assessment that we should
>> just rip out the offending macros and replace them with structs.
>
> @gwd: I believe the file that I was concerned about does not fall
> under the XENTRACE entry in MAINTAINERS; you may want to rectify that.
>

My vague plan to fix this is to still take
https://xenbits.xen.org/gitweb/?p=people/andrewcoop/xen.git;a=commitdiff;h=8636f0eaa0f163f8a433eb17b9e0d2e87db284b6
but not introduce TRACE_PARAM64

The users are as follows:

xen.git/xen$ git grep TRACE_PARAM64
arch/x86/hvm/emulate.c:2183:        TRACE(TRC_HVM_CR_READ64, reg,
TRACE_PARAM64(*val));
arch/x86/hvm/emulate.c:2199:    TRACE(TRC_HVM_CR_WRITE64, reg,
TRACE_PARAM64(val));
arch/x86/hvm/emulate.c:2244:        TRACE(TRC_HVM_XCR_READ64, reg,
TRACE_PARAM64(*val));
arch/x86/hvm/emulate.c:2254:    TRACE(TRC_HVM_XCR_WRITE64, reg,
TRACE_PARAM64(val));
arch/x86/hvm/hpet.c:308:               TRACE_PARAM64(diff_ns),
TRACE_PARAM64(period_ns));
arch/x86/hvm/hvm.c:2155:    TRACE(TRC_HVM_CR_WRITE64, cr,
TRACE_PARAM64(val));
arch/x86/hvm/hvm.c:2220:    TRACE(TRC_HVM_CR_READ64, cr,
TRACE_PARAM64(val));
arch/x86/hvm/hvm.c:3631:    TRACE(TRC_HVM_MSR_READ, msr,
TRACE_PARAM64(*msr_content));
arch/x86/hvm/hvm.c:3647:    TRACE(TRC_HVM_MSR_WRITE, msr,
TRACE_PARAM64(msr_content));
arch/x86/hvm/svm/svm.c:1442:              TRACE_PARAM64(_event.cr2));
arch/x86/hvm/svm/svm.c:2402:    TRACE(TRC_HVM_INVLPG64, 0,
TRACE_PARAM64(linear));
arch/x86/hvm/svm/svm.c:2630:                   exit_reason,
TRACE_PARAM64(regs->rip));
arch/x86/hvm/svm/svm.c:2826:                TRACE(TRC_HVM_PF_XEN64,
regs->error_code, TRACE_PARAM64(va));
arch/x86/hvm/vlapic.c:738:       
TRACE_TIME(TRC_HVM_EMUL_LAPIC_START_TIMER, TRACE_PARAM64(delta),
arch/x86/hvm/vlapic.c:739:                   TRACE_PARAM64(is_periodic ?
period : 0), vlapic->pt.irq);
arch/x86/hvm/vlapic.c:1209:       
TRACE_TIME(TRC_HVM_EMUL_LAPIC_START_TIMER, TRACE_PARAM64(delta),
arch/x86/hvm/vlapic.c:1210:                   TRACE_PARAM64(0LL),
vlapic->pt.irq);
arch/x86/hvm/vlapic.c:1223:           
TRACE_TIME(TRC_HVM_EMUL_LAPIC_START_TIMER, TRACE_PARAM64(0LL),
arch/x86/hvm/vlapic.c:1224:                       TRACE_PARAM64(0LL),
vlapic->pt.irq);
arch/x86/hvm/vlapic.c:1477:   
TRACE_TIME(TRC_HVM_EMUL_LAPIC_START_TIMER, TRACE_PARAM64(period),
arch/x86/hvm/vlapic.c:1478:               TRACE_PARAM64(is_periodic ?
period : 0LL), s->pt.irq);
arch/x86/hvm/vmx/vmx.c:2093:             
TRACE_PARAM64(curr->arch.hvm.guest_cr[2]));
arch/x86/hvm/vmx/vmx.c:3099:    TRACE(TRC_HVM_INVLPG64, /*invlpga=*/ 0,
TRACE_PARAM64(linear));
arch/x86/hvm/vmx/vmx.c:3160:        TRACE(TRC_HVM_LMSW64,
TRACE_PARAM64(value));
arch/x86/hvm/vmx/vmx.c:4064:        TRACE_TIME(TRC_HVM_VMEXIT64,
exit_reason, TRACE_PARAM64(regs->rip));
arch/x86/hvm/vmx/vmx.c:4346:                         
TRACE_PARAM64(exit_qualification));
include/xen/trace.h:87:#define TRACE_PARAM64(p)    (uint32_t)(p), ((p)
>> 32)

and there are probably enough examples of "reg32, val64" to justify
making a helper.  We're touching every site anyway, so adjudging for the
next version of the series is easy.

I might repost the first few patches right now.  All the fixes in the
scheduler have been reviewed and ready to go for 3 release of Xen already...

~Andrew

