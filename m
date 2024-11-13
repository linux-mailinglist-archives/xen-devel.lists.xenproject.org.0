Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C22CC9C6DAA
	for <lists+xen-devel@lfdr.de>; Wed, 13 Nov 2024 12:20:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.835393.1251261 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tBBPQ-0006cl-A0; Wed, 13 Nov 2024 11:19:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 835393.1251261; Wed, 13 Nov 2024 11:19:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tBBPQ-0006b4-6q; Wed, 13 Nov 2024 11:19:40 +0000
Received: by outflank-mailman (input) for mailman id 835393;
 Wed, 13 Nov 2024 11:19:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Gr6F=SI=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tBBPO-0006ay-IU
 for xen-devel@lists.xenproject.org; Wed, 13 Nov 2024 11:19:38 +0000
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [2a00:1450:4864:20::529])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 27afe738-a1b1-11ef-99a3-01e77a169b0f;
 Wed, 13 Nov 2024 12:19:32 +0100 (CET)
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-5cf6f7ee970so436625a12.3
 for <xen-devel@lists.xenproject.org>; Wed, 13 Nov 2024 03:19:32 -0800 (PST)
Received: from [10.125.226.166] ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9ee0def7ecsm848240266b.158.2024.11.13.03.19.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 13 Nov 2024 03:19:30 -0800 (PST)
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
X-Inumbo-ID: 27afe738-a1b1-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo1MjkiLCJoZWxvIjoibWFpbC1lZDEteDUyOS5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjI3YWZlNzM4LWExYjEtMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMxNDk2NzcyLjQ0MDYwOSwic2VuZGVyIjoiYW5kcmV3LmNvb3BlckBjbG91ZC5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1731496771; x=1732101571; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=vW4oNeHQKl5BwHakEplRGXg6msXn+kdcD1qtCew+gns=;
        b=HM/551UHNfDVHcarzi9YLiAKf3Z3RYv6PXjcoGsZIycAjA2X1igwBCi7EC45v62wgh
         CR8D7pEFOLEIs2iKbk3GbccaR4RaqH/HQLwfE45ShwTcjOljh9l9336fuLsj5h0fJwxo
         qyZ1cWzAWH6wv+IX+QjQ9M6U4zfuGPmZWq1cI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731496771; x=1732101571;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vW4oNeHQKl5BwHakEplRGXg6msXn+kdcD1qtCew+gns=;
        b=pwPmWcyyCudLEQDif2vAqvXJtdRWdTAJwutUwQT0QYdusg4zooosjwME+yyVxTXfGq
         1ubMDAZX17tKQ6NP0y2w06sxUbgpMe3A86NTUR0mHIBtxDtwkloTjwCI29IkGnFqGz2Y
         agvlRNpk31cA/CkdjmczzzXquKJLVmiYgPCChj+lanQNA3cUNFjxeP4wHxe3niL5HxnT
         4Ov/KurHkFcR9JuRGAhQC0wUSRMvopS3Gsm+hBIBi+GdkLX2w+bE9Ge9eEZJ+LoH4UVR
         iX3i0wptxQ8HVr5hvsfub8ESURuH655Xet9zvAhMjtPE1a4hPnxfgTkAhd+zL4peGA2z
         Pihw==
X-Forwarded-Encrypted: i=1; AJvYcCXpWNH5IBkm5j5v9wQcMcXPbE+y2eR6zT8cNMB46GHId4CE9C6wMVUbV/nFNnAgUEeNxGFVV4UwG5k=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxNQ+z7CKHYRU+pfbKegp4Eu7rgK0WZz0VfU9qMqnxqUPzY6GoQ
	SEwbOfK+vlQj6ynI+Uzx9anKVMCEmRgjNZgQWBe+GMuE9uPEiKXP1D74MORI4Ko=
X-Google-Smtp-Source: AGHT+IEezGIXRZqzThDP4WYtFQwarXymw5Gc5COEIalsqyb5M3JFQk08PKcAlH9/sb6ve2vSf33Z2A==
X-Received: by 2002:a17:906:ee81:b0:a9a:646e:d2f7 with SMTP id a640c23a62f3a-aa1c5824da2mr494766466b.61.1731496771416;
        Wed, 13 Nov 2024 03:19:31 -0800 (PST)
Message-ID: <db7d200d-a13c-4cb4-9860-5a40cc039db7@citrix.com>
Date: Wed, 13 Nov 2024 11:19:29 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] x86/trampoline: Document how the trampoline is laid
 out
To: Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 "Daniel P . Smith" <dpsmith@apertussolutions.com>,
 Frediano Ziglio <frediano.ziglio@cloud.com>,
 Alejandro Vallejo <alejandro.vallejo@cloud.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20241113093058.1562447-1-andrew.cooper3@citrix.com>
 <20241113093058.1562447-2-andrew.cooper3@citrix.com>
 <5f58dda2-1619-4416-b711-c600367d6f47@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <5f58dda2-1619-4416-b711-c600367d6f47@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 13/11/2024 10:20 am, Jan Beulich wrote:
> On 13.11.2024 10:30, Andrew Cooper wrote:
>> This is, to the best of my knowledge, accurate.  I am providing no comment on
>> how sane I believe it to be.
>>
>> At the time of writing, the sizes of the regions are:
>>
>>           offset  size
>>   AP:     0x0000  0x00b0
>>   S3:     0x00b0  0x0140
>>   Boot:   0x01f0  0x1780
>>   Heap:   0x1970  0xe690
>>   Stack:  0xf000  0x1000
>>
>> and wakeup_stack overlays boot_edd_info.
>>
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>> ---
>> CC: Jan Beulich <JBeulich@suse.com>
>> CC: Roger Pau Monné <roger.pau@citrix.com>
>> CC: Daniel P. Smith <dpsmith@apertussolutions.com>
>> CC: Frediano Ziglio <frediano.ziglio@cloud.com>
>> CC: Alejandro Vallejo <alejandro.vallejo@cloud.com>
>> ---
>>  xen/arch/x86/include/asm/trampoline.h | 55 ++++++++++++++++++++++++++-
>>  1 file changed, 53 insertions(+), 2 deletions(-)
>>
>> diff --git a/xen/arch/x86/include/asm/trampoline.h b/xen/arch/x86/include/asm/trampoline.h
>> index 8c1e0b48c2c9..d801bea400dc 100644
>> --- a/xen/arch/x86/include/asm/trampoline.h
>> +++ b/xen/arch/x86/include/asm/trampoline.h
>> @@ -37,12 +37,63 @@
>>   * manually as part of placement.
>>   */
>>  
>> +/*
>> + * Layout of the trampoline.  Logical areas, in ascending order:
>> + *
>> + * 1) AP boot:
>> + *
>> + *    The INIT-SIPI-SIPI entrypoint.  This logic is stack-less so the identity
>> + *    mapping (which must be executable) can at least be Read Only.
>> + *
>> + * 2) S3 resume:
>> + *
>> + *    The S3 wakeup logic may need to interact with the BIOS, so needs a
>> + *    stack.  The stack pointer is set to trampoline_phys + 4k and clobbers an
>> + *    undefined part of the the boot trampoline.  The stack is only used with
>> + *    paging disabled.
>> + *
>> + * 3) Boot trampoline:
>> + *
>> + *    This region houses various data used by the AP/S3 paths too.
> This is confusing to have here - isn't the boot part (that isn't in the
> same page as the tail of the AP/S3 region) being boot-time only, and hence
> unavailable for S3 and post-boot AP bringup? Both here and with the numbers
> in the description - what position did you use as separator between 2) and
> 3)?
>
> Then again it may be just me who is confused: Didn't we, at some point, limit
> the resident trampoline to just one page? Was that only a plan, or a patch
> that never was committed?

The positioning of various things is rather complicated.

Only a single 4k page is mapped into idle_pg_table[].

But, the AP/S3 path use:
  trampoline_cpu_started
  idt_48
  gdt_48
  trampoline_xen_phys_start
  trampoline_misc_enable_off
  trampoline_efer

Which is beyond the content of wakeup.S.  The GDT in particular needs to
stay valid with paging enabled, to load __HYPERVISOR_CS.

We have /* From here on early boot only. */ in trampoline.S but that
seems to be the extent of checking.  Everything needed for AP/S3 is in
the first 0x229.

I'm open to suggestions for how to describe this better, although the
left hand side of the diagram is already very busy.

I suppose I could do AP+S3 as a single section, along their combined data?

>
>>  The boot
>> + *    trampoline collects data from the BIOS (E820/EDD/EDID/etc), so needs a
>> + *    stack.  The stack pointer is set to trampoline_phys + 64k and has 4k
>> + *    space reserved.
>> + *
>> + * 4) Heap space:
>> + *
>> + *    The first 1k of heap space is statically allocated for VESA information.
>> + *
>> + *    The remainder of the heap is used by reloc(), logic which is otherwise
>> + *    outside of the trampoline, to collect the bootloader metadata (cmdline,
>> + *    module list, etc).  It does so with a bump allocator starting from the
>> + *    end of the heap and allocating backwards.
>> + *
>> + * 5) Boot stack:
>> + *
>> + *    4k of space is reserved for the boot stack, at trampoline_phys + 64k.
> Perhaps add "ending" to clarify it doesn't go beyond +64k? It's being expressed
> ...

Ah yes.  That ended up less clear than I was intending.  I'll adjust.

~Andrew

