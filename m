Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EFA80B245F5
	for <lists+xen-devel@lfdr.de>; Wed, 13 Aug 2025 11:48:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1079659.1440398 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1um85X-0002EO-Nm; Wed, 13 Aug 2025 09:48:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1079659.1440398; Wed, 13 Aug 2025 09:48:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1um85X-0002CS-KN; Wed, 13 Aug 2025 09:48:07 +0000
Received: by outflank-mailman (input) for mailman id 1079659;
 Wed, 13 Aug 2025 09:48:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2/kn=2Z=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1um85W-0002CK-8Z
 for xen-devel@lists.xenproject.org; Wed, 13 Aug 2025 09:48:06 +0000
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [2a00:1450:4864:20::430])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9b6b2945-782a-11f0-b898-0df219b8e170;
 Wed, 13 Aug 2025 11:48:04 +0200 (CEST)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-3b914186705so899621f8f.0
 for <xen-devel@lists.xenproject.org>; Wed, 13 Aug 2025 02:48:04 -0700 (PDT)
Received: from [192.168.1.183] (host-195-149-20-212.as13285.net.
 [195.149.20.212]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b91b05b28fsm756500f8f.21.2025.08.13.02.48.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 13 Aug 2025 02:48:03 -0700 (PDT)
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
X-Inumbo-ID: 9b6b2945-782a-11f0-b898-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1755078483; x=1755683283; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=BZhUXmvGsweVxDlUvIIfYw41CEU7F3yCXCsBPcp9wmc=;
        b=HFePHmbbQ+2faky0GqCyjMC7BVk5hG1eaSwH0gFsk9mu1P67TOcnOFPq2II564PAV3
         L4KhZ0gYysAk7EU29RPhIJAyZlVP84tz+jmLhQvPFnNI4zrlNNtG5dP35EJbQkctU9ry
         4BjBJTcHoOXe5SFthoRTXUW5guNH1+rZCCLX4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755078483; x=1755683283;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BZhUXmvGsweVxDlUvIIfYw41CEU7F3yCXCsBPcp9wmc=;
        b=dV3SMlYoLOTk9L51HebcUusgjilenfOKjIFmRN4EWs2BpM61S+l1hNiFweC9jODWOg
         7IjP9/+Wl0bcufvub3XUa+vMXIb3evlpct2mXeA5/9J0uDqnJl1rXpeWiI9ZrQpW356x
         GydwEvQ5sjyEj1vtJjVJMRtgqkQRgL716uS23ybyKWnld+RXDspXGRIfsqS9LWGybx1s
         jJI17FpNYls3Qmu4aFxtuxkjuNZ78mm9nGgf671ZzSrFOwq6ZiTdYLcG4NkcrH4wPFqC
         kDUZTmZJWe0DIAzqcGfLtoy+LlXWJpgIdC+ISw2bh4kIqht+XFj5/sE0WVyJTToDcG+1
         DSGg==
X-Forwarded-Encrypted: i=1; AJvYcCX+qIZJW9eHZFe8OAdTOD8oHhWEZT5wrLd32N+1X+4HogkXtTLeMinoDcCybJ5phcC46n+/CVfqqK0=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwHALxhIo1jgveIwuaGcr9zK/A0qd6Cet54B+2nK+GM2uW/zEG2
	OA+Bq7aQrjG/n1bOpt1ria7/h8XXsTtXkESxtxGrn5vUmms3iHq1KUg7vRrRyiIFFL0=
X-Gm-Gg: ASbGncsHr9tjps1/R1F636DD3t+NuDKLrE8Ri77V1WAR89/DWK+ESCMk/7g7juu+A21
	IEytOm9AqdONZ+wihuj3IJq3pysJjxaENmkpm1K+TAwdCTeSTiMWVxa+LDCd7L6e+hdXsQlI4Av
	AROFzDlLWLooLuo+KVDFyUCcVoTPweV4BrPXK7OXLj5IcFFKKTNrdIJwXXO1sJpdpyErNZlLT0g
	vQD/cSLGYbyJFsM/wLHPX+KcrNHZLx2s6RaYcNniTyr+1rxFdL9NcFK1R9SASZFafoGZcdS/aW+
	4zUsiTjiiUeLDGuSFbC8QEOQkTHfpU00NhGnh79AhrWKk/4M4YzsE7gUxzPAPkf1UPipuBuhQ7b
	ANf2f+7xaGF+YCyBXuB/YT35mngxZDBoGDTN5zDPH40uHt2ZW3xqf8bODgpEp+NS3KevG
X-Google-Smtp-Source: AGHT+IEJrI3WRcgzKKf/ZQPdS/InPscCtmR5EQbFmKDe5ovJN02yXZSP/gSeImRflHt38z5wWP1FPA==
X-Received: by 2002:a5d:5f48:0:b0:3b7:9bfe:4f64 with SMTP id ffacd0b85a97d-3b917edd0cfmr1719437f8f.54.1755078483413;
        Wed, 13 Aug 2025 02:48:03 -0700 (PDT)
Message-ID: <45afcbee-63f3-489d-8f68-ca962646ef7c@citrix.com>
Date: Wed, 13 Aug 2025 10:48:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 04/22] x86/idt: Minor improvements to
 _update_gate_addr_lower()
To: Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20250808202314.1045968-1-andrew.cooper3@citrix.com>
 <20250808202314.1045968-5-andrew.cooper3@citrix.com>
 <44c9a7ba-8e01-41cc-8c93-32b022885439@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <44c9a7ba-8e01-41cc-8c93-32b022885439@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 12/08/2025 9:16 am, Jan Beulich wrote:
> On 08.08.2025 22:22, Andrew Cooper wrote:
>> After some experimentation, using .a/.b makes far better logic than using the
>> named fields, as both Clang and GCC spill idte to the stack when named fields
>> are used.
>>
>> GCC seems to do something very daft for the addr1 field.  It takes addr,
>> shifts it by 32, then ANDs with 0xffff0000000000000UL, which requires
>> manifesting a MOVABS.
>>
>> Clang follows the C, whereby it ANDs with $imm32, then shifts, avoiding the
>> MOVABS entirely.
>>
>> No functional change.
>>
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Acked-by: Jan Beulich <jbeulich@suse.com>

Thanks.

> albeit I have to admit that I'm not quite happy about ...
>
>> --- a/xen/arch/x86/include/asm/idt.h
>> +++ b/xen/arch/x86/include/asm/idt.h
>> @@ -92,15 +92,16 @@ static inline void _set_gate_lower(idt_entry_t *gate, unsigned long type,
>>   * Update the lower half handler of an IDT entry, without changing any other
>>   * configuration.
>>   */
>> -static inline void _update_gate_addr_lower(idt_entry_t *gate, void *addr)
>> +static inline void _update_gate_addr_lower(idt_entry_t *gate, void *_addr)
>>  {
>> +    unsigned long addr = (unsigned long)_addr;
>> +    unsigned int addr1 = addr & 0xffff0000U; /* GCC force better codegen. */
>>      idt_entry_t idte;
>> -    idte.a = gate->a;
>>  
>> -    idte.b = ((unsigned long)(addr) >> 32);
>> -    idte.a &= 0x0000FFFFFFFF0000ULL;
>> -    idte.a |= (((unsigned long)(addr) & 0xFFFF0000UL) << 32) |
>> -        ((unsigned long)(addr) & 0xFFFFUL);
>> +    idte.b = addr >> 32;
>> +    idte.a = gate->a & 0x0000ffffffff0000UL;
>> +    idte.a |= (unsigned long)addr1 << 32;
> ... the cast here. Yet perhaps gcc still generates a MOVABS when you make
> addr1 unsigned long?

Correct.  Forcing the mask operation to be 32bit is the only way I found
of avoiding the MOVABS.

>
> As to the comment next to the variable declaration: Could I talk you into
> adding a colon after "GCC"? Without one, the comment reads somewhat
> ambiguously to me.

Ok.

~Andrew

