Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E1CCB09515
	for <lists+xen-devel@lfdr.de>; Thu, 17 Jul 2025 21:39:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1047314.1417762 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ucURv-0005u9-Bv; Thu, 17 Jul 2025 19:39:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1047314.1417762; Thu, 17 Jul 2025 19:39:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ucURv-0005rw-92; Thu, 17 Jul 2025 19:39:23 +0000
Received: by outflank-mailman (input) for mailman id 1047314;
 Thu, 17 Jul 2025 19:39:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ObpW=Z6=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1ucURt-0005rg-IB
 for xen-devel@lists.xenproject.org; Thu, 17 Jul 2025 19:39:21 +0000
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [2a00:1450:4864:20::344])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bb4b6052-6345-11f0-a319-13f23c93f187;
 Thu, 17 Jul 2025 21:39:20 +0200 (CEST)
Received: by mail-wm1-x344.google.com with SMTP id
 5b1f17b1804b1-455ecacfc32so6114375e9.3
 for <xen-devel@lists.xenproject.org>; Thu, 17 Jul 2025 12:39:20 -0700 (PDT)
Received: from [192.168.1.183] (host-195-149-20-212.as13285.net.
 [195.149.20.212]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4563b5b8475sm897105e9.12.2025.07.17.12.39.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 17 Jul 2025 12:39:18 -0700 (PDT)
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
X-Inumbo-ID: bb4b6052-6345-11f0-a319-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1752781159; x=1753385959; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=VL3OrOhrEalmKNbsU6brZZoAWUxAdgwWFt0mZAd0p0c=;
        b=BcAE0cniJ+UdU2J/sIuDWEe1gKuS9CtuJUS0R2kHwg0GXAULE1MSNHRVK/SJUWZXJj
         sTCzkmN0xBTY4BAutv6x3xdPkxjYJMAkbSh904iNSF+W+c24UpF7A7QxUvF2txXgu2ye
         uxf79a/AIeBYIivsb1YubmHeZpuPX2xYzYM3M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752781159; x=1753385959;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VL3OrOhrEalmKNbsU6brZZoAWUxAdgwWFt0mZAd0p0c=;
        b=H8eWZAV9VjrKgGczi306RPRkDb+zNzrITdrpQKhXoxC0PHAH36S4+bU8inlNKxyHAe
         UbXDDd3RUvUAaGjFxa8HuV08cr43Llir6ztz4hHG1EYxnR5JfRasvcicx6MwN9DFf5FP
         nnWO+19CXsaGXC/mmEaT6ifUn/qheVMHCV4R43cIC1Bia5KI3lF8C79q9czHwP+aaY+/
         tMugLekhwTfQdGPOq/TQf+024yvFP4nE8w/Mp8NGkGZulDs7g4cydpIC9Q+AWZ2JuJ7j
         egVh8LZyR6jSL7CMBrh8Av270KbEWQ5ZoboAfb2Z7ob1q4rUh+c4xU4SDAYZKVj1bXdW
         STGQ==
X-Forwarded-Encrypted: i=1; AJvYcCWDH72CVv/0SHFOlMlzLS86dVHIM7FfAmkHw0isEJeqeo/MPZ/ndGdrdlCdtXTI8aoK2xp38VHM7f4=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyqHoLskWAufRlfcrYJammRb57Z+yCzpCmR4q0l00FwLqfkr+6B
	s+2VyzOk88b2UeTgqKNpe43lp0EAaG/8ZAxsW+2lOspRFo6HrVsn8unnwUOJyMOSScc=
X-Gm-Gg: ASbGnct1TInT102hNlFfCTFzUHkBLT/ecYsUROkBRekQlFc5HEmRirFzxhD0SPtv+BV
	qke4euzSXN0W9cEjlmUD+zQifaiCUGTEQ9EHi1e44t/p0K5pe1/GmpLmaWHLJ7Y1Ls+tr99aL+4
	cgrraZbr5QGvfqvutpKhVy+xe0UxIwMTd9oFZb8nL5zXyfmbL9EmzzRk445C+m68AdkKW8rB6IU
	MSThoWp4W02nQmUNc0I517V+J6qIMkL134OsjZCl8KBH4I49O70yYM/5FNvG1oI4Lb1xRRIAXS9
	oSiXxyR1NULkDwvT95KL6dnVsOImDqPVsExEv5yodpf7Q3yDZQVyuTDDhCjqE51hbUTyeju53IM
	P8p1Hyvd4jaDCKpySt9RPR+7MFDLPuAw6ydPk2KJ8opDVumDN9ToRPyftoqipMtxI6UTKA4Rw29
	3K8a4=
X-Google-Smtp-Source: AGHT+IH0XlYS8UcE3cHB5AWgdKDxv8IIFLvkTPVm/iN/0Ugv0Mb/hye7K+7pyJVgFbbgDxCWBdnXLw==
X-Received: by 2002:a05:600c:64ca:b0:456:1d61:b0f2 with SMTP id 5b1f17b1804b1-45630b6d6dcmr73805115e9.30.1752781158857;
        Thu, 17 Jul 2025 12:39:18 -0700 (PDT)
Message-ID: <03ecaa72-2370-47f7-b84b-83831d188f4e@citrix.com>
Date: Thu, 17 Jul 2025 20:39:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/6] x86/match-cpu: Support matching on steppings
To: Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20250716173132.2213891-1-andrew.cooper3@citrix.com>
 <20250716173132.2213891-6-andrew.cooper3@citrix.com>
 <a6abcc07-535f-433b-948a-702dc33093fa@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <a6abcc07-535f-433b-948a-702dc33093fa@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 17/07/2025 9:11 am, Jan Beulich wrote:
> On 16.07.2025 19:31, Andrew Cooper wrote:
>> --- a/xen/arch/x86/cpu/common.c
>> +++ b/xen/arch/x86/cpu/common.c
>> @@ -1003,13 +1003,15 @@ const struct x86_cpu_id *x86_match_cpu(const struct x86_cpu_id table[])
>>  	const struct x86_cpu_id *m;
>>  	const struct cpuinfo_x86 *c = &boot_cpu_data;
>>  
>> -	for (m = table; m->vendor | m->family | m->model | m->feature; m++) {
>> +	for (m = table; m->vendor | m->family | m->model | m->steppings | m->feature; m++) {
> Nit: Line length. But - do we need the change at all? It looks entirely
> implausible to me to use ->steppings with all of vendor, family, and
> model being *_ANY (if, as per below, they would be 0 in the first place).

I do keep on saying that | like this is pure obfuscation.  This is an
excellent example.

It's looking for the {} entry, by looking for 0's in all of the metadata
fields.  A better check would be *(uint64_t *)m, or perhaps a unioned
metadata field, but..

This is also a good demonstration of binary | is a bad thing to use, not
only for legibility.  Swapping | for || lets the compiler do:

add/remove: 0/0 grow/shrink: 0/1 up/down: 0/-76 (-76)
Function                                     old     new   delta
x86_match_cpu                                243     167     -76

and the code generation looks much better too:

https://termbin.com/c4m9

Although I'm a little confused as to why it's still done a split cmpw
$0x0,(%rax) and cmpq $0xffff,(%rax) for the loop entry condition, when
cmpq $0 would be the right one.


>
> Tangential: The ->feature check is slightly odd here. With everything
> else being a wildcard (assuming these are 0; I can't find any X86_*_ANY
> in the code base; INTEL_FAM6_ANY expands to X86_MODEL_ANY, but is itself
> also not used anywhere), one wouldn't be able to use FPU, as that's
> feature index 0. I notice though that ...
>
>>  		if (c->x86_vendor != m->vendor)
>>  			continue;
>>  		if (c->x86 != m->family)
>>  			continue;
>>  		if (c->x86_model != m->model)
>>  			continue;
> ... X86_*_ANY also aren't catered for here. Hence it remains unclear
> what value those constants would actually be meant to have.
>
> Further tangential: The vendor check could in principle permit for
> multiple vendors (e.g. AMD any Hygon at the same time), considering that
> we use bit masks now. That would require the != there to change, though.

In Linux, x86_cpu_id is a module ABI and has wildcards on all fields,
because "please load me on any AMD Fam10 CPU" is something they want to
express.

In Xen, we only use it model/stepping specific lookup tables, so we
don't need wildcards for V/F/M like Linux does.

We do have a different layout of X86_VENDOR to Intel, and while that
would allow us to merge an AMD and a Hygon row, I don't think anything
good could come of trying.

One problem Linux has is that X86_VENDOR_INTEL is 0, so they introduced
a flags field with a VALID bit that now replaces the line of |'s.  I do
not see any need for that in Xen.



>
>> --- a/xen/arch/x86/include/asm/match-cpu.h
>> +++ b/xen/arch/x86/include/asm/match-cpu.h
>> @@ -8,28 +8,32 @@
>>  #include <asm/intel-family.h>
>>  #include <asm/x86-vendors.h>
>>  
>> +#define X86_STEPPINGS_ANY 0
> Given the (deliberate aiui) plural, maybe better X86_STEPPINGS_ALL?

Hmm, yeah, that's not great grammar.  I think I prefer X86_STEPPING_ANY
to X86_STEPPINGS_ALL.

> Also perhaps use 0xffff as the value, allowing to drop part of the
> conditional in x86_match_cpu()?

Interestingly, while it simplifies the C, it undoes most of the code
generation improvements from switching | to ||.

https://termbin.com/h0iu

By removing the "m->steppings &&", gcc has now hoisted the load of
c->stepping out of the loop (in fact, the whole 1U << c->stepping
calculation), but that's now resulted in a spill/restore of %rbx in the
loop, and also doubled up most of the loop.  I have no idea what it's
trying to do here...

>
>>  #define X86_FEATURE_ANY X86_FEATURE_LM
>>  
>>  struct x86_cpu_id {
>> -    uint16_t vendor;
>> -    uint16_t family;
>> +    uint8_t vendor;
> Is shrinking this to 8 bits a good idea? We use 5 of them already. (Of
> course we can re-enlarge later, if and when the need arises.)

It's the same size as cpuinfo_x86's field has been for 2 decades.

>
>> +    uint8_t family;
> The family formula allows the value to be up to 0x10e. The return type
> of get_cpu_family() is therefore wrong too, strictly speaking. As is
> struct cpuinfo_x86's x86 field.

Again, this is the size of the field in cpuinfo_x86.  I don't think
0x10e is anything we're going to have to worry about any time soon.

>
>>      uint16_t model;
> Whereas the model is strictly limited to 8 bits.

There is space in here, if we need it, but you can't shrink it without
breaking the check for the NULL entry (going back to the first obfuscation).

~Andrew

