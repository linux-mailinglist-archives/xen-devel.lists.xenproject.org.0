Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 44E129901C3
	for <lists+xen-devel@lfdr.de>; Fri,  4 Oct 2024 13:02:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.810287.1222979 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1swg4a-0001oU-CL; Fri, 04 Oct 2024 11:02:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 810287.1222979; Fri, 04 Oct 2024 11:02:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1swg4a-0001mz-9Z; Fri, 04 Oct 2024 11:02:12 +0000
Received: by outflank-mailman (input) for mailman id 810287;
 Fri, 04 Oct 2024 11:02:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6kl2=RA=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1swg4Y-0001mt-PB
 for xen-devel@lists.xenproject.org; Fri, 04 Oct 2024 11:02:10 +0000
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [2a00:1450:4864:20::633])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 19d78819-8240-11ef-a0bb-8be0dac302b0;
 Fri, 04 Oct 2024 13:02:09 +0200 (CEST)
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-a8d56155f51so216301466b.2
 for <xen-devel@lists.xenproject.org>; Fri, 04 Oct 2024 04:02:09 -0700 (PDT)
Received: from [10.125.226.166] ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a99102aa6d5sm210979666b.89.2024.10.04.04.02.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 04 Oct 2024 04:02:08 -0700 (PDT)
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
X-Inumbo-ID: 19d78819-8240-11ef-a0bb-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1728039729; x=1728644529; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=+UkraqdRUezPeXiqSz3SSh9ag+bN3N04aUU/U+zw/64=;
        b=Bo2g4ZxV4rTchpOE/2ONWkQCLdQdXAxXjvvOTN11ZTvMyxT5Fqhars4WJRc5UO2VRQ
         pwtK66NwHkRlMZRg1D4jAvMAlF9bI0AcvRKIRke2GyT7i9SRx3F7/S7gxNBNrnVnkXPI
         D6yX5WpbcpfiBdWdKnFJ9Lxn8eG9O0/eEjaB4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728039729; x=1728644529;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+UkraqdRUezPeXiqSz3SSh9ag+bN3N04aUU/U+zw/64=;
        b=c0g2UD6YX3T3VTMM/p6y50twdmWKOSyW0flKH80aJYwJXGTdlRyoh9u13v7PAhqSVR
         FByZKOgwUPoRagcJYfBmEo0p38cJBNwoXPrCFRHsymLscJ2Ku4glVJdUWhqu2Nu/wVrx
         6mxzoVuvq3vesqWAzwsNWkrIoShlNl75/WmQS7tvvnN4e2e5HN49tJDaqlPuLWxN11Mm
         v9vGM6y3slR0ctYqOBaXQoU8QadBA1qPq5w1mildUZ42eMTBP0vKMACvYVAyl8x8wFXx
         7ApXheBBTFwvTNwa4oyiC75LxM5cCXqOH41ppZBOyQxmZvrD/p8TRFqrPb1WJRRMgTZB
         De9w==
X-Forwarded-Encrypted: i=1; AJvYcCXiWLLWLh7YsSLSV7NqWaoK/HvngtzxddG3DKicz1lRk8J7WoSyL3SjhgKtpkycQ/BArEKu61zH1SY=@lists.xenproject.org
X-Gm-Message-State: AOJu0YztREOEERj266a4Tqub6Mc5i3MXTB1ZJsnfcciApd/pW3Ehz3sZ
	HLW+z0DuVi68BR/YsHep4dLfVAED8gBMudWcefqXDN6CPhOyLidcfPbmpYq2uXc=
X-Google-Smtp-Source: AGHT+IF5bqqh0yLfvGhTb66+Gp2/dK0gVTl2G6wuRl62ACSuZMAUUhgzzNeXs8OtVvwrf6aG1Ht30w==
X-Received: by 2002:a17:906:d555:b0:a8a:1ffe:70f1 with SMTP id a640c23a62f3a-a991bff46f0mr243673566b.50.1728039728939;
        Fri, 04 Oct 2024 04:02:08 -0700 (PDT)
Message-ID: <2b8cfee6-66f4-408c-b207-4f68acd2108b@citrix.com>
Date: Fri, 4 Oct 2024 12:02:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86: Introduce X86_ET_* constants in x86-defns.h
To: Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20241003170413.2227753-1-andrew.cooper3@citrix.com>
 <39fc1c44-ec09-4df2-86bc-c86717ef7a86@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <39fc1c44-ec09-4df2-86bc-c86717ef7a86@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 04/10/2024 7:43 am, Jan Beulich wrote:
> On 03.10.2024 19:04, Andrew Cooper wrote:
>> The FRED spec architecturalises the Event Type encoding, previously exposed
>> only in VMCB/VMCS fields.
>>
>> Introduce the constants in x86-defns.h, making them a bit more consice, and
>> retire enum x86_event_type.
>>
>> Take the opportunity to introduce X86_ET_OTHER.  It's absence appears to be a
>> bug in Introspection's Monitor Trap Flag support, when considering VECTORING
>> events during another VMExit.
>>
>> No functional change.
>>
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Reviewed-by: Jan Beulich <jbeulich@suse.com>

Thanks.

>
>> --- a/xen/arch/x86/include/asm/x86-defns.h
>> +++ b/xen/arch/x86/include/asm/x86-defns.h
>> @@ -204,4 +204,13 @@
>>  #define X86_MT_UCM    0x07 /* UC- */
>>  #define X86_NUM_MT    0x08
>>  
>> +/* Event Types. */
>> +#define X86_ET_EXT_INTR    0 /* External Interrupt */
>> +#define X86_ET_NMI         2 /* NMI */
>> +#define X86_ET_HW_EXC      3 /* Hardware Exception (#PF/#GP/etc) */
>> +#define X86_ET_SW_INT      4 /* Software Interrupt (INT $n) */
>> +#define X86_ET_PRIV_SW_EXC 5 /* Privileged Software Exception (ICEBP/INT1) */
>> +#define X86_ET_SW_EXC      6 /* Software Exception (INT3, INTO) */
>> +#define X86_ET_OTHER       7 /* Misc event: MTF=0, SYSCALL=1, SYSENTER=2 */
> ET could of course mean a lot of things; sadly no sufficiently short but
> still less ambiguous alternative comes to mind, so ET is going to be it.

Yeah, I considered this quite a lot before settling on X86_ET_*.  By
coincidence, X86_MT_* are visible in context, so we do have prior art here.

~Andrew

