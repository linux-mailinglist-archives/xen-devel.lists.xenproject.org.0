Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C87C9B3766
	for <lists+xen-devel@lfdr.de>; Mon, 28 Oct 2024 18:13:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.826884.1241321 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t5TIO-0000ZS-Js; Mon, 28 Oct 2024 17:12:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 826884.1241321; Mon, 28 Oct 2024 17:12:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t5TIO-0000XO-HJ; Mon, 28 Oct 2024 17:12:48 +0000
Received: by outflank-mailman (input) for mailman id 826884;
 Mon, 28 Oct 2024 17:12:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/lrK=RY=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1t5TIN-0000XI-JC
 for xen-devel@lists.xenproject.org; Mon, 28 Oct 2024 17:12:47 +0000
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [2a00:1450:4864:20::633])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d97be184-954f-11ef-99a3-01e77a169b0f;
 Mon, 28 Oct 2024 18:12:45 +0100 (CET)
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-a9a4031f69fso615975766b.0
 for <xen-devel@lists.xenproject.org>; Mon, 28 Oct 2024 10:12:45 -0700 (PDT)
Received: from [10.125.226.166] ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9b3a086de0sm393423666b.218.2024.10.28.10.12.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Oct 2024 10:12:44 -0700 (PDT)
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
X-Inumbo-ID: d97be184-954f-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1730135565; x=1730740365; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=meTor9NRAUC6zbNwH9uIfOpXO8HifutLAt1c+xxhuNw=;
        b=v8/l1DbD+gkdqKSySdJxBmrVzyhqjiJ57+pmsYam2FVM9ZPd6GcXgdyMdVQNxMXDDA
         DGqDgFzxLyzpJUFKXCVaqxDlxKX3l1wrqkDGhvfbd+Qk6MH20Wk3kgpiMSbnB7LdNjGv
         y7XUK/l3K9PhkzVOXrZDG6euRDOxxulOH+fAM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730135565; x=1730740365;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=meTor9NRAUC6zbNwH9uIfOpXO8HifutLAt1c+xxhuNw=;
        b=JocySwBSmR3hFMZYPndHaAItBVPbq+NM+8FKiot8n6E9Hs1epdtucZ9960wiTHiMLJ
         mmXbgwPSjKMxlbPFzmaKFEp/6zmhAdJcdt9fsY7kixN3wBT2iptSpLVUB8K8QwG7b1kM
         mmqIGpjDhm3CPqSYWzDcX6C88iZWTllcm7lJsVF1JDwkml78hkn5y1cGfSoSlJLTHO4l
         zzbiMe8jNhKU21x20SY+S3+Vd8Cn//p023//W0EjXsj3k8NRbnZF/nz74krcF0+xxJ4c
         aWwanMl5PnNxh4wRDTpDMzfKhyNX76byPt66ZRDRatUoGS9zBlWCTMBQ0jdLzoJjxpjS
         NjDw==
X-Forwarded-Encrypted: i=1; AJvYcCW9KlorCoIgK0oAGTQifdHKmt/GZAyC+dzpCEL5Cf2tfouy34mDL7DQquZjSljyZRu54xp/8W81lSQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yzb8i1AfteC+9jGfqQhkkhOvfSZZVAq5lCUkHiKWk6h65C5XwDG
	pCBtTKtD7Eez0ioPWmX2AM79yVc3fGVT9H0ZdYN0c9XPFJuyVMBO9jvdRea3zXk=
X-Google-Smtp-Source: AGHT+IHh9ohwgU3CmJ/KjghIMsivPWJ48M/7H7FNreCk/Aad/ubXFUDzYIWPV8I37ZdFT7VN3kj/Jg==
X-Received: by 2002:a17:907:7f13:b0:a99:5f2a:444d with SMTP id a640c23a62f3a-a9de61a0feemr823556366b.56.1730135564978;
        Mon, 28 Oct 2024 10:12:44 -0700 (PDT)
Message-ID: <d7f9489d-8031-493b-bf36-b009d5536b0c@citrix.com>
Date: Mon, 28 Oct 2024 17:12:43 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/10] x86/ucode: Delete the microcode_init() initcall
To: Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 "Daniel P . Smith" <dpsmith@apertussolutions.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20241028091856.2151603-1-andrew.cooper3@citrix.com>
 <20241028091856.2151603-3-andrew.cooper3@citrix.com>
 <99ba9bcf-f356-416a-b355-f32e622d1406@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <99ba9bcf-f356-416a-b355-f32e622d1406@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 28/10/2024 1:38 pm, Jan Beulich wrote:
> On 28.10.2024 10:18, Andrew Cooper wrote:
>> The comment highlights just how bogus this really is.  Being an initcall, the
>> boot allocator is long gone, and bootstrap_unmap() is a no-op.
> How's the boot allocator coming into the picture here? This is all about
> (un)mapping, not allocating.
>
>> The fact there is nothing to do should be a giant red flag about the validity
>> of the mappings "being freed".  Indeed, they both constitute use-after-frees.
> I can't spot any use-after-free; the pointers in question ...
>
>> --- a/xen/arch/x86/cpu/microcode/core.c
>> +++ b/xen/arch/x86/cpu/microcode/core.c
>> @@ -758,28 +758,6 @@ int microcode_update(XEN_GUEST_HANDLE(const_void) buf,
>>      return continue_hypercall_on_cpu(0, microcode_update_helper, buffer);
>>  }
>>  
>> -static int __init cf_check microcode_init(void)
>> -{
>> -    /*
>> -     * At this point, all CPUs should have updated their microcode
>> -     * via the early_microcode_* paths so free the microcode blob.
>> -     */
>> -    if ( ucode_blob.size )
>> -    {
>> -        bootstrap_unmap();
>> -        ucode_blob.size = 0;
>> -        ucode_blob.data = NULL;
>> -    }
>> -    else if ( ucode_mod.mod_end )
>> -    {
>> -        bootstrap_unmap();
>> -        ucode_mod.mod_end = 0;
>> -    }
>> -
>> -    return 0;
>> -}
>> -__initcall(microcode_init);
> ... aren't used anywhere. bootstrap_unmap() is "just in case" (perhaps indeed
> a no-op at least nowadays), and the rest is field clobbering. I'm okay with the
> code change, so
> Acked-by: Jan Beulich <jbeulich@suse.com>
> yet I'd like to ask for the description to be "softened" some.

As I said, this could be folded into patch 9, given this particular
arrangement of the series.

The UAFs are apparent *because* the comment demonstrates a false line of
reasoning.

ucode_mod literally is used after free.  ucode=$n is genuinely buggy
today, because its a stash of a physical pointer across move_xen().

ucode_blob stashes a virtual pointer.  This was even noticed in
dc380df12acf ("x86/ucode: load microcode earlier on boot CPU")

---
It needs to rescan the modules in order to find the new virtual address
of the ucode blob because it changes during the boot process, e.g.
from 0x00000000010802fc to 0xffff83204dac52fc.
---

which highlighted the problem but duct-taped over it.

~Andrew

