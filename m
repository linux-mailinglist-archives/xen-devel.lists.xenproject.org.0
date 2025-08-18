Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D607B2AF37
	for <lists+xen-devel@lfdr.de>; Mon, 18 Aug 2025 19:19:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1086213.1444414 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uo3Ve-0001ZR-Mp; Mon, 18 Aug 2025 17:19:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1086213.1444414; Mon, 18 Aug 2025 17:19:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uo3Ve-0001Xy-Jd; Mon, 18 Aug 2025 17:19:02 +0000
Received: by outflank-mailman (input) for mailman id 1086213;
 Mon, 18 Aug 2025 17:19:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GLF1=26=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1uo3Vd-0001Xs-Hg
 for xen-devel@lists.xenproject.org; Mon, 18 Aug 2025 17:19:01 +0000
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [2a00:1450:4864:20::32f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6e33ebb8-7c57-11f0-a32a-13f23c93f187;
 Mon, 18 Aug 2025 19:19:00 +0200 (CEST)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-45a1b05fe23so26263755e9.1
 for <xen-devel@lists.xenproject.org>; Mon, 18 Aug 2025 10:19:00 -0700 (PDT)
Received: from [192.168.1.183] (host-195-149-20-212.as13285.net.
 [195.149.20.212]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45b42a84417sm6984635e9.13.2025.08.18.10.18.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 18 Aug 2025 10:18:59 -0700 (PDT)
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
X-Inumbo-ID: 6e33ebb8-7c57-11f0-a32a-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1755537540; x=1756142340; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=dWRYqud6Lb4cUDIwuvnzoqgDZEUinYxens6/Ehw6Yfg=;
        b=RMcRLhSscNr41a+A4JTm1gt1KGONWXwnIuse5QXZ2RlTyY1noMi5gJDmYxurYnwaNt
         CIl0gfchqGLGc9Kq5OzIXr2LoVmJzD71eWu4OskCucA422NxELRdeb1ctglywQLps6wd
         r88xM5SiVXBP+rjxSbwnefxCIF/U4wQqH1ZiM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755537540; x=1756142340;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dWRYqud6Lb4cUDIwuvnzoqgDZEUinYxens6/Ehw6Yfg=;
        b=YtMJIBkapNRoapiwojbWj0UA0ElsDEzYQUDOGXWECfgewH9LCfnHzE6ZKhi5Exgvxp
         1YRCBF7PqFjNaMcVLXsgMt+KYqkTNS/qIHFTcmerUxD4D23zfOjhxjyAwiUsY9qACeG5
         6AHLvo5lPHGfaDDh27H7y+8b3WrXAToFKz8wN+SQM48ijBJmEPJ4wMtiJ962DJkwWtJz
         s+NZM4bK1/JhMu6BZTwxH2ypULk8LHwgAbv/j/YnmyOyIFk06znY2d8pKK8Ktn/avT5U
         Ez7XWAJw8hDwEjTeDq2WONo6lRPJ5yD25CQA8/OgjDULP69moZwgYGApbDE0dC0+Plkb
         feQA==
X-Forwarded-Encrypted: i=1; AJvYcCXUpEfqINGduNKX30QDXJIaL5xyFddk8K2T6dZHhxyrAkrQfBggXqlGZyPG6ghMbVV9RqFH8Taoef0=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzXnksrmFIhjO/GvbhjC7gdBK8LVFZoFBhvKP3UJLdHpWYXpPz2
	8dvfmUslH3WSRoBhMlYA9Si2kwqfTBKRRlfcQOzrHWOmKE85m6P0/LiOHyE+gTvPr00=
X-Gm-Gg: ASbGncvdakiEoDoN3fHakEkEErN08rM9hDAw66VsFW69I+wVQpi1dOAx6JhBdhIzL9B
	Okfi/dvYm/ZOMGexb1EGn7a4CHdYGWoXVjQ/pJnu1+gcdSgsWn+xNFOFyrfAHwkxdXGWvT+ND2y
	jZvc2P1HeFZi/bErqG8Gr3qPzCfaBzn+yXhAYWxNUMiP+yKhDwb+ZHCuqw67NyxQg4wdvfFPfR4
	AR4eA70APqBNZn0HPErBVlhhvmVHkpwA7SHNL0z+dTSnOqDt2/2wetMuzIJ3XmH4YaVlZWCzt1z
	N8OTAoksR4cVdTvCZ0URxPIBJqQ1wu+BYF/+eXCJOQqGcU0OW6cSU5NiJcVWlu2DckmnUpQO9Fz
	4CF85VDsHgLrWkLoJ4uHY/UA59WjV/gihS2SKMGV2l3ST9xe8m0+D+h0V+iwUoGdmevCG
X-Google-Smtp-Source: AGHT+IHzzkl6vrQtNGNhdjbA8oz36nj+jXJ/KY9YhKjKlz/e0vzCD3dUUQoWokQ2ohP5OX5BTxKe1A==
X-Received: by 2002:a05:600c:470d:b0:458:a7fa:211d with SMTP id 5b1f17b1804b1-45a21868bd2mr103764485e9.29.1755537539610;
        Mon, 18 Aug 2025 10:18:59 -0700 (PDT)
Message-ID: <9657758b-6f10-46c6-84cb-14f425f412b8@citrix.com>
Date: Mon, 18 Aug 2025 18:18:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 23/22] x86/vmx: Adjust NMI handling for FRED
To: Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20250808202314.1045968-1-andrew.cooper3@citrix.com>
 <20250808234920.1214924-1-andrew.cooper3@citrix.com>
 <d1a49f35-250a-4db5-88f7-fd0b8e6d1a1c@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <d1a49f35-250a-4db5-88f7-fd0b8e6d1a1c@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 18/08/2025 11:02 am, Jan Beulich wrote:
> On 09.08.2025 01:49, Andrew Cooper wrote:
>> --- a/xen/arch/x86/hvm/vmx/vmx.c
>> +++ b/xen/arch/x86/hvm/vmx/vmx.c
>> @@ -4209,8 +4209,18 @@ void asmlinkage vmx_vmexit_handler(struct cpu_user_regs *regs)
>>               ((intr_info & INTR_INFO_INTR_TYPE_MASK) ==
>>                MASK_INSR(X86_ET_NMI, INTR_INFO_INTR_TYPE_MASK)) )
>>          {
>> -            do_nmi(regs);
>> -            enable_nmis();
>> +            /*
>> +             * If we exited because of an NMI, NMIs are blocked in hardware,
>> +             * but software is expected to invoke the handler.
>> +             *
>> +             * Use INT $2.  Combined with the current state, it is the correct
>> +             * architectural state for the NMI handler,
> Not quite, I would say: For profiling (and anything else which may want to
> look at the outer context's register state from within the handler) we'd
> always appear to have been in Xen when the NMI "occurred".

We are always inside Xen when the NMI "occurred".

In fact there's a latent bug I didn't spot before.  Nothing appears to,
but if anything in do_nmi() were to to look at regs->entry_vector, it
will see stack rubble (release build) or poison (debug build).

Having gone searching, it's only the watchdog and oprofile which
configure perf counters with NMIs.  vPMU uses fixed interrupts, which
further calls into question it's utility.

>
>> and the IRET on the
>> +             * way back out will unblock NMIs.
>> +             *
>> +             * In FRED mode, we can spot this trick and cause the ERETS to
>> +             * unblock NMIs too.
>> +             */
>> +            asm ("int $2");
>>          }
>>          break;
>>      case EXIT_REASON_MCE_DURING_VMENTRY:
>> --- a/xen/arch/x86/traps.c
>> +++ b/xen/arch/x86/traps.c
>> @@ -2285,8 +2285,22 @@ void asmlinkage entry_from_xen(struct cpu_user_regs *regs)
>>          do_nmi(regs);
>>          break;
>>  
>> -    case X86_ET_HW_EXC:
>>      case X86_ET_SW_INT:
>> +        if ( regs->fred_ss.vector == 2 )
>> +        {
>> +            /*
>> +             * Explicit request from the the VMExit handler.  Rewrite the FRED
>> +             * frame to look like it was a real NMI, and go around again.
>> +             */
>> +            regs->fred_ss.swint = false;
>> +            regs->fred_ss.nmi = true;
>> +            regs->fred_ss.type = X86_ET_NMI;
>> +            regs->fred_ss.insnlen = 0;
>> +
>> +            return entry_from_xen(regs);
> Any particular reason to use recursion here (which the compiler may or may
> not transform)? In fact I'm having trouble seeing why you couldn't invoke
> do_nmi() here directly.

The first way I had entry_from_xen(), this was necessary to get the
right behaviour.  GCC did manage to transform it into a call to do_nmi().

But this has changed somewhat now so I think I can do it with a fallthrough.

~Andrew

