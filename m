Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 68853AB399B
	for <lists+xen-devel@lfdr.de>; Mon, 12 May 2025 15:48:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.981492.1367889 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uETW9-0006L6-Q3; Mon, 12 May 2025 13:48:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 981492.1367889; Mon, 12 May 2025 13:48:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uETW9-0006JG-Mz; Mon, 12 May 2025 13:48:29 +0000
Received: by outflank-mailman (input) for mailman id 981492;
 Mon, 12 May 2025 13:48:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=oz7/=X4=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1uETW8-0006J2-CJ
 for xen-devel@lists.xenproject.org; Mon, 12 May 2025 13:48:28 +0000
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [2a00:1450:4864:20::42f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c72b98ee-2f37-11f0-9ffb-bf95429c2676;
 Mon, 12 May 2025 15:48:26 +0200 (CEST)
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-3a0bdcd7357so3043452f8f.1
 for <xen-devel@lists.xenproject.org>; Mon, 12 May 2025 06:48:26 -0700 (PDT)
Received: from [192.168.1.183] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a1f58f2961sm12513417f8f.45.2025.05.12.06.48.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 May 2025 06:48:25 -0700 (PDT)
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
X-Inumbo-ID: c72b98ee-2f37-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1747057705; x=1747662505; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=467QYmVq6MMhKVSE/NeASZW0c+Ge2q/6FRFA94JDfFw=;
        b=B4TyFm2tjqw0jqRR73hqJfQZZWoFZEnZo+MgI9MRrPI39xvklcgkD9UwHPjYCbVnaI
         Q+6hwcTRwc9wV3IEXYgFBIpKhYdp/+iVxPa+VfIs38wgSbA59GIB9JLm4u691F6xdJ70
         ctteQxYbZwtcNulw0EyoDJUgrVyWKqEc3A+sw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747057705; x=1747662505;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=467QYmVq6MMhKVSE/NeASZW0c+Ge2q/6FRFA94JDfFw=;
        b=lRMVOqQfEuqwOak3M7pThohx07zc8f4+MIulzbz66kZ/gYWNNO582Ixgt5IhEVS3TT
         +o9P1S0rfVwXteivxrrgcrBakh0yMAVr1Rw5JNa6MIa4RtJ6kejXudlr8TcrYi13EMVM
         8LDnVYllYse/3Hf5wwSaYvg2gP/oR/9zv+ZllQftGfTDAV3aSSSG04PuLFuVmsuDhLLh
         FFCGvAZAQB10oi1O1Ldt+lzP5k+NvRjJ1+aHGMgHF+VAMRdIr5fi4AkjfChegRoNKhkf
         5ai1l3PCULTGBynlT+0rxI13FFA5xL0Ih1ITMLIu4pE4oAR+f25u2+x5vGwEK7TTaIRd
         8yYw==
X-Forwarded-Encrypted: i=1; AJvYcCX5CWwzmgIIu0Gsy2lbioLLHEi8dBsHQVNu2onPr8ZujRMFuwIrUYc76Liqbsv0KcSs6H8o1x01jCI=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yx9EPmQLvcmN086w2OwwxoLiAOGMEuGKq83lUwOGJyNeY7lNevA
	NAisZdcIIKjFoQmYG4Vh/AQtWZ5iyWxgHdPR4LiXM0fq0ndpgrkY/6cE8zCaBMk=
X-Gm-Gg: ASbGnctDMqEFKBTVI6jGFinnUmywuZS1+XGvCg9IhY0D4mCuLYco80KRj7LxAUe/Tmu
	64bIh4DebSt/uju2E4NynHt5wM19Z7gmRwdnWSIL/cOMu7XNJu3r2GSuoRHf6FyAFsS+GwF3sMU
	WnEZqJ4AxOce4k34/6QgDcm87SxfSbaao7MmvEOnyQx5enJRn3IPaUTP2LbIWy3Qz9pNq0GQ8pb
	ISASrUTVNezgg0BdQ4QYUMnIepnnW3RsR1dRfcK6Gx/3FoSMES7J2H7kNYg+HP0DgFyvTz7cNSN
	4BO8lGv5Ip7KNHnu/MD3qpUPnkWxZyq3n+IAo0NsGmQkZMeGrEMr04zyJQct5SWlnA7QVLlUe+v
	4+NCs+02J6bAB/oVJ
X-Google-Smtp-Source: AGHT+IEzMHLH1f8ck8j+fXIgJfou97bpMdBCAbYmyAbTEL501SxMD395Ao29oXIhU9IYD3M0BTC5BA==
X-Received: by 2002:a05:6000:1ac6:b0:39e:dbee:f644 with SMTP id ffacd0b85a97d-3a1f64b5a71mr10093478f8f.46.1747057705631;
        Mon, 12 May 2025 06:48:25 -0700 (PDT)
Message-ID: <c7d2a090-dc03-449a-bf6c-10479cbf1ec7@citrix.com>
Date: Mon, 12 May 2025 14:48:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/idt: Minor improvements to _update_gate_addr_lower()
To: Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20250512115821.3444375-1-andrew.cooper3@citrix.com>
 <af50a50c-599f-4cf9-92db-7d2aee8cedec@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <af50a50c-599f-4cf9-92db-7d2aee8cedec@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 12/05/2025 2:21 pm, Jan Beulich wrote:
> On 12.05.2025 13:58, Andrew Cooper wrote:
>> --- a/xen/arch/x86/include/asm/idt.h
>> +++ b/xen/arch/x86/include/asm/idt.h
>> @@ -92,15 +92,16 @@ static inline void _set_gate_lower(idt_entry_t *gate, unsigned long type,
>>   * Update the lower half handler of an IDT entry, without changing any other
>>   * configuration.
>>   */
>> -static inline void _update_gate_addr_lower(idt_entry_t *gate, void *addr)
>> +static inline void _update_gate_addr_lower(idt_entry_t *gate, void *_addr)
> Considering comment and name of the function, ...
>
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
> ... doesn't this line want dropping altogether? Or at best be an assertion?

That's what _write_gate_lower() does, hence why
_update_gate_addr_lower() needs to calculate .b.

~Andrew

