Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FCD5939342
	for <lists+xen-devel@lfdr.de>; Mon, 22 Jul 2024 19:38:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.762303.1172465 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sVwzZ-0001Bi-Pt; Mon, 22 Jul 2024 17:38:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 762303.1172465; Mon, 22 Jul 2024 17:38:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sVwzZ-00019C-Mq; Mon, 22 Jul 2024 17:38:33 +0000
Received: by outflank-mailman (input) for mailman id 762303;
 Mon, 22 Jul 2024 17:38:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QQNa=OW=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1sVwzY-00018Y-31
 for xen-devel@lists.xenproject.org; Mon, 22 Jul 2024 17:38:32 +0000
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [2a00:1450:4864:20::533])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 355dd55c-4851-11ef-8776-851b0ebba9a2;
 Mon, 22 Jul 2024 19:38:30 +0200 (CEST)
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-5a1fcb611baso3756703a12.1
 for <xen-devel@lists.xenproject.org>; Mon, 22 Jul 2024 10:38:30 -0700 (PDT)
Received: from [10.125.226.166] ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5a30af84673sm6472429a12.50.2024.07.22.10.38.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Jul 2024 10:38:28 -0700 (PDT)
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
X-Inumbo-ID: 355dd55c-4851-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1721669909; x=1722274709; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=70KRp6vJHVzCwRjJXSAkjbmXNx7Fa+O3A7nOW3ycLN8=;
        b=ndfm/4fvVjJrP7dtNo5ChsCyMdJp45Y1Oc+X+LUzoXqKTvSAYloXikY13bW/TWCeRP
         ZleBLkK8NVPuV1DR5vjncHiHqDIA3NqZNCzsyBognr2JavYP821kNwsfSdTsjZt0IgPx
         Ny/2i9HCzYDjm54hQWvUSw8TcZZtk5yrX4xGE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721669909; x=1722274709;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=70KRp6vJHVzCwRjJXSAkjbmXNx7Fa+O3A7nOW3ycLN8=;
        b=Mdctun1x99Arc07iNJGS9AULkLEEqJr6Vg1xAMvdMYkJcn+K3F9lTQU6q5fDXL/uP9
         3SCRJ6zucxe3YAyAU+yN2w6UOWkvS7oR0LC/+ITf8s6VqHl8IJwn4TdDqHNmsOlrhnE5
         Dfib/ohxIRWCy6PqANVAdbtuKzNdVq4GBBOfIfF13/p4pDbiY8HPCrrXSWBoe+LZ5w27
         02+i9KT4J+kXesc7J4bEnjdp8/aYYbu6ymvi67nTkxWI1c/qTUw4UdM94fG0j9b66D4s
         c2lPBxvhdIqb/czSarxHNAqC3hCRC5v7Jgis4eCMHBtp809BZcCUNNzKbFPSAt9PtuvD
         Bo1A==
X-Forwarded-Encrypted: i=1; AJvYcCWJeNglOkzRA2VUn5V+At3c/MK1AqQM7ypv0ug4AClMf9ciAhLcg42Ms4kP0MpCB57HrioSgk0B9kDNoDzrbB0dvbLN17NpyJbxIMpSZAw=
X-Gm-Message-State: AOJu0Yw6ZwGQCKWCNNITjh+g1T9zBCucMuf+4OYQymWQTGtQ+FGpUolR
	rIFAKwAhyrgOZHAq5Kf2JxgPDyb/dA6cxrO/aTfgFiCjjBqQ3sMxB7ulkc2lVVw=
X-Google-Smtp-Source: AGHT+IG1Ti6IBgDDGaOCOX59EjONe5HuXZOCrlwA/NQNi9y2ULxfjMVGY0KJFhO9kls2RKioY8e/iQ==
X-Received: by 2002:a05:6402:350e:b0:5a2:1693:1a2f with SMTP id 4fb4d7f45d1cf-5a479d6257amr5346860a12.12.1721669909195;
        Mon, 22 Jul 2024 10:38:29 -0700 (PDT)
Message-ID: <243d89c1-4e23-4ecb-be4a-0ab1e09e0938@citrix.com>
Date: Mon, 22 Jul 2024 18:38:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] x86/efi: Unlock NX if necessary
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Gene Bright <gene@cyberlight.us>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, "Daniel P . Smith" <dpsmith@apertussolutions.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>,
 Alejandro Vallejo <alejandro.vallejo@cloud.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20240722101838.3946983-1-andrew.cooper3@citrix.com>
 <20240722101838.3946983-3-andrew.cooper3@citrix.com>
 <9123e966-1ec6-4853-b6a2-f92e21dc784c@suse.com>
 <f53e8b5b-1a89-4190-a6bc-495e8487384f@citrix.com>
Content-Language: en-GB
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <f53e8b5b-1a89-4190-a6bc-495e8487384f@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 22/07/2024 6:04 pm, Andrew Cooper wrote:
> On 22/07/2024 11:43 am, Jan Beulich wrote:
>> On 22.07.2024 12:18, Andrew Cooper wrote:
>>> --- a/xen/arch/x86/efi/efi-boot.h
>>> +++ b/xen/arch/x86/efi/efi-boot.h
>>> @@ -736,13 +736,33 @@ static void __init efi_arch_handle_module(const struct file *file,
>>>      efi_bs->FreePool(ptr);
>>>  }
>>>  
>>> +static bool __init intel_unlock_nx(void)
>>> +{
>>> +    uint64_t val, disable;
>>> +
>>> +    rdmsrl(MSR_IA32_MISC_ENABLE, val);
>>> +
>>> +    disable = val & MSR_IA32_MISC_ENABLE_XD_DISABLE;
>>> +
>>> +    if ( !disable )
>>> +        return false;
>>> +
>>> +    wrmsrl(MSR_IA32_MISC_ENABLE, val & ~disable);
>> The base ISA not having ANDN or NAND (and a prereq to my patch to add
>> minimum-ABI-level control to the build machinery still sitting there
>> unreviewed), using "val ^ disable" here would likely produce slightly
>> better code for the time being.
> While that might technically be true, you're assuming that everyone
> reading the code can de-obfuscate ^ back into &~, and that the compiler
> hasn't made its own alternative arrangements.

In fact, the compiler sees through this "clever" trick and undoes the XOR.

Swapping &~ for ^ makes no change in the compiled binary, because in
both cases GCC chooses a BTR instruction instead.


While BTR might be a poor choice of instruction for this purpose, it
reinforces my opinion that trickery such as this is not something we
want to do.

If you want a more useful optimisation task, we should figure out how to
write rdmsrl()/wrmsrl() better so GCC is happy working on %edx in
isolation, rather than always merging it into %rax to be operated on. 
The rdmsr()/wrmsr() helpers taking a split hi and lo generate far better
code, even if they are much more awkward to use at a C level.

~Andrew

