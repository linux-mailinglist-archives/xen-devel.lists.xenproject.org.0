Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 61C60B26A1F
	for <lists+xen-devel@lfdr.de>; Thu, 14 Aug 2025 16:54:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1081846.1441809 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1umZLk-0000lH-3H; Thu, 14 Aug 2025 14:54:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1081846.1441809; Thu, 14 Aug 2025 14:54:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1umZLj-0000j5-Vh; Thu, 14 Aug 2025 14:54:39 +0000
Received: by outflank-mailman (input) for mailman id 1081846;
 Thu, 14 Aug 2025 14:54:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mOIo=22=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1umZLi-0000bR-TH
 for xen-devel@lists.xenproject.org; Thu, 14 Aug 2025 14:54:38 +0000
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [2a00:1450:4864:20::32a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 99a15c1c-791e-11f0-a328-13f23c93f187;
 Thu, 14 Aug 2025 16:54:38 +0200 (CEST)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-45a1b05fe23so5539755e9.1
 for <xen-devel@lists.xenproject.org>; Thu, 14 Aug 2025 07:54:38 -0700 (PDT)
Received: from [192.168.1.183] (host-195-149-20-212.as13285.net.
 [195.149.20.212]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45a1c718769sm24600525e9.30.2025.08.14.07.54.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Aug 2025 07:54:37 -0700 (PDT)
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
X-Inumbo-ID: 99a15c1c-791e-11f0-a328-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1755183278; x=1755788078; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=noOukp2jDrACz6eWCR9ThY7l9/cWKw/hN7a7w/5fP4o=;
        b=uRef+EhTobaUncSSwWFhhrmbDA1LIFmZJ4axSS5CWn8vM9ejsV9uzDzHjiV4+YVgg1
         409aJO35Jvmcg/ru+RLCSCarJEWrtdR8xokr5fQzmZ+TzL+E5d1Yl5woBT93qp4AT0RK
         UCFOntS2LfnpYJ5UJpKEyzOTzYP6FsoVMfwwE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755183278; x=1755788078;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=noOukp2jDrACz6eWCR9ThY7l9/cWKw/hN7a7w/5fP4o=;
        b=riDlzVNUt+p4e95/rtcONPLRidB+73B0z52WffzSxFTTTa9fVKEpREIgHH+VX0R3wq
         EuT47+X3L5eH33UUc/2vjEgsXAti0kAxYsV7/6V2KcLlEI5lHIyaQBYI7K07FUozgVrg
         diO6QXt5pP6jMudsPxHnOBNtR/FxylUDh8j4Oc8Qtg8vQvPe6GRQ2xNe/10LbT8kUMZu
         xCuFelp1awFIGzhr1+2Mm7ciuw8BNZRKJGC2tAjJDaJlJKHlI14rroJ+5X2uvsF2nNA8
         foTD0hUh0n8/Z1N4/fbGNubLDdR4QQwlfHzTfg+eqcAY0ilggMW2srDzs5HooJdzl/+M
         FmNA==
X-Forwarded-Encrypted: i=1; AJvYcCVrrlYpPMZIPScJIrBsGjS12TCKmPqYEcPK+oKlK9SOfsjcquNxcK487US4omba4xCdkd5bykxMqHU=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxJ1c6f8/zhjIQFsy3+cnLNRcn3ekfuA0ZR6PIFXX6+P6Cr8Sbl
	iQP7lIt3W05olauwgMYlmFFRPwItu2aRbuIoXEIUksCDuhEpr/QVXTl/hgcpzZDKexeGV/SjIyR
	Yt//J
X-Gm-Gg: ASbGncvBhzq1WnKumBlVQVZCv9nkdgKP8zc/wIgDoLECCts9hzotfiotipZ+V4U3m/g
	DG1UK0f1v/LGaIA6TVJuq7hUQZ6iX4UYEYQDlya1UnksshJL4B18y0Gk42NQnEn78mHgipb8/uB
	UHVfDrv5IsDP1OQA8/lhWRjpZcSOuGb7qLlI3sjUrbe9S8bLSjpfviXKGylQtGzLFqe56/0hLLW
	SkUbWonv7s3YibNgzkG3eFet7h5MQNoZpFBHR+qjpmxvZioPNzz71vQ7rYP+ocHzL/IsamYnVBr
	hYM+utEIMWjw8gvAAT7Eiw35jfDz/lmrYnbOp1BDZ+qne0O/uBBHQpxV2SGP+tzj8kU1nY14h+5
	gosA5lu+mL5mNQ6X96vYGiN6G2GNSRTR2KxcfwV0j3b7RO2jsCO6LTZ2rtMrFnVSNML31F8dZEm
	lkUlc=
X-Google-Smtp-Source: AGHT+IENA+pPX0GmZBF330AlPfOMc4o1QZYQgpriXEHrrD+CoZ9optytRhBoYh6pRiPZhYrhtLGrhw==
X-Received: by 2002:a05:600c:4449:b0:456:1e5a:885e with SMTP id 5b1f17b1804b1-45a1b605ab4mr33197735e9.3.1755183277489;
        Thu, 14 Aug 2025 07:54:37 -0700 (PDT)
Message-ID: <64dc9f62-b48e-400b-8840-feff2f688913@citrix.com>
Date: Thu, 14 Aug 2025 15:54:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 16/22] x86/boot: Adjust CR4 handling around
 ap_early_traps_init()
To: Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20250808202314.1045968-1-andrew.cooper3@citrix.com>
 <20250808202314.1045968-17-andrew.cooper3@citrix.com>
 <270b2ad1-fb8a-4a0a-8733-a8f3f8f25a94@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <270b2ad1-fb8a-4a0a-8733-a8f3f8f25a94@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 14/08/2025 3:47 pm, Jan Beulich wrote:
> On 08.08.2025 22:23, Andrew Cooper wrote:
>> ap_early_traps_init() will shortly be setting CR4.FRED.  This requires that
>> cpu_info->cr4 is already set up, and that the enablement of CET doesn't
>> truncate FRED back out because of it's 32bit logic.
>>
>> For __high_start(), defer re-loading XEN_MINIMAL_CR4 until after %rsp is set
>> up and we can store the result in the cr4 field too.
>>
>> For s3_resume(), explicitly re-load XEN_MINIMAL_CR4.  Later when loading all
>> features, use the mmu_cr4_features variable which is how the rest of Xen
>> performs this operation.
>>
>> No functional change, yet.
>>
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Reviewed-by: Jan Beulich <jbeulich@suse.com>

Thanks.

Unfortunately, ...

>
>> --- a/xen/arch/x86/acpi/wakeup_prot.S
>> +++ b/xen/arch/x86/acpi/wakeup_prot.S
>> @@ -63,6 +63,14 @@ LABEL(s3_resume)
>>          pushq   %rax
>>          lretq
>>  1:
>> +
>> +        GET_STACK_END(15)
>> +
>> +        /* Enable minimal CR4 features. */
>> +        mov     $XEN_MINIMAL_CR4, %eax
>> +        mov     %rax, STACK_CPUINFO_FIELD(cr4)(%r15)
> Strictly speaking this and ...
>
>> --- a/xen/arch/x86/boot/x86_64.S
>> +++ b/xen/arch/x86/boot/x86_64.S
>> @@ -11,16 +11,19 @@ ENTRY(__high_start)
>>          mov     %ecx,%gs
>>          mov     %ecx,%ss
>>  
>> -        /* Enable minimal CR4 features. */
>> -        mov     $XEN_MINIMAL_CR4,%rcx
>> -        mov     %rcx,%cr4
>> -
>>          mov     stack_start(%rip),%rsp
>>  
>>          /* Reset EFLAGS (subsumes CLI and CLD). */
>>          pushq   $0
>>          popf
>>  
>> +        GET_STACK_END(15)
>> +
>> +        /* Enable minimal CR4 features. */
>> +        mov     $XEN_MINIMAL_CR4, %eax
>> +        mov     %rax, STACK_CPUINFO_FIELD(cr4)(%r15)
> ... this could be 32-bit stores, even in the longer run.

... no, they can't.

The store also serves to clear out stale X86_CR4_FRED, prior to FRED
getting reconfigured again.

fatal_trap() uses info->cr4 to decide whether it's safe to look at the
extended FRED metadata.  Strictly speaking I probably ought to read the
real CR4 (in read_registers too), but using a 32bit store here would
extend a 1-instruction window into quite a larger window where exception
handling would not work quite right.

~Andrew

