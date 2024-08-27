Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CB0229609F2
	for <lists+xen-devel@lfdr.de>; Tue, 27 Aug 2024 14:21:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.783920.1193238 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sivBP-0006ey-OT; Tue, 27 Aug 2024 12:20:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 783920.1193238; Tue, 27 Aug 2024 12:20:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sivBP-0006bu-Lg; Tue, 27 Aug 2024 12:20:23 +0000
Received: by outflank-mailman (input) for mailman id 783920;
 Tue, 27 Aug 2024 12:20:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ovuO=P2=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1sivBN-0006bo-CJ
 for xen-devel@lists.xenproject.org; Tue, 27 Aug 2024 12:20:21 +0000
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [2a00:1450:4864:20::52e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b96c172f-646e-11ef-99a0-01e77a169b0f;
 Tue, 27 Aug 2024 14:20:19 +0200 (CEST)
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-5bec87ececeso5909753a12.0
 for <xen-devel@lists.xenproject.org>; Tue, 27 Aug 2024 05:20:19 -0700 (PDT)
Received: from [10.125.226.166] ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a86e582d57fsm103089266b.116.2024.08.27.05.20.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 27 Aug 2024 05:20:17 -0700 (PDT)
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
X-Inumbo-ID: b96c172f-646e-11ef-99a0-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1724761219; x=1725366019; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Xckl3ar8HgogLNADv6d+Aj8eU2bgnOq0Jsczz3Eh6QM=;
        b=Ft6/4tAd0jw2LYmM+8t0SxrLEkxLcVxj9+lmjNfRkh0/+9zEDaXZ8rWDcYCVqnPbn4
         jSq9ekc6g/Zw0TqO97au/ILQQBeQERJe7aA/KcD/KO6aQVi1f25a3geSiaAZKMcQbEUw
         I4nDnwwSpd5fbMem1sDnCMZzLs8g/eHRkf9KE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724761219; x=1725366019;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Xckl3ar8HgogLNADv6d+Aj8eU2bgnOq0Jsczz3Eh6QM=;
        b=CGeLe4IBBtEQ708ZrRYUA814E7yCBqMZ8Asp1F+no+afqpXx+foSha7erqDqr99LzN
         gtShAnKx3ZqfptqyuiK2QaSKjIkIdv2E8YK8LmA8a0UZvxok0BqH1JQfJsZ9oXZB0sTl
         NYq3cbn3Dg0/W47YAWcalblw6fFcvhCxE774LjC0Iytq0UnSkTQESjMVm1kBlPCIIH3J
         tBiZ+y7diQCwfS7jBvBhczBjptvtWWVF/+30bX8VXGv+415XVss/YfDBiIfxoTzjcEX2
         5T7zY7+Gkbr4ZgXFnJ6f9X4mSRnOxn9v7Vd2TIZJyoQjlsVMFSXibllaCjjOh/3iDn3h
         X4Cg==
X-Forwarded-Encrypted: i=1; AJvYcCUlGLoNmT7ObyZ/Y1Vqz5We5SJSdyZdFbvHbGbgNzD1YFWQH3IoTgcGfbgTPeNfCAeNfxRuLtojTI4=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwuglKeFuwhf8ZGMFFBL0/hTlh8vHABuxnD1IcHCGIG3Sd3HyzH
	YYfVpK2Oa7nPPeg2CuttbGylzee1kSURHdhZprmskw3ZTij9CiIZ24Fw20Yt+sw=
X-Google-Smtp-Source: AGHT+IGoOHG4eXgQLpczX41NfMyt4H1kyb/AHjSsv7UsesnUEH9u3xdZtK2Uwf4aTHbko3C2gZ7qPA==
X-Received: by 2002:a17:907:948b:b0:a7a:be79:ca1e with SMTP id a640c23a62f3a-a86e39dcfcdmr193279366b.20.1724761218132;
        Tue, 27 Aug 2024 05:20:18 -0700 (PDT)
Message-ID: <a4c0b1d3-ff7a-4ea5-bffb-756125a434af@citrix.com>
Date: Tue, 27 Aug 2024 13:20:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ARM/vgic: Use for_each_set_bit() in vgic_to_sgi()
To: Michal Orzel <michal.orzel@amd.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>, Jan Beulich <JBeulich@suse.com>
References: <20240823230100.1581448-1-andrew.cooper3@citrix.com>
 <6513e2ea-0471-41ca-b328-ce1bc1deddaf@amd.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <6513e2ea-0471-41ca-b328-ce1bc1deddaf@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 27/08/2024 1:13 pm, Michal Orzel wrote:
>
> On 24/08/2024 01:01, Andrew Cooper wrote:
>>
>> The existing expression is just a very complicated way of expressing a loop
>> over all bits of target->list.  Simplify the expression.
>>
>> While here, fix the two gprintk()'s.  Because of a quotes vs line continuation
>> issue, there's a long string of spaces in the middle of the format string.
>>
>>   $ strings xen-syms-arm32 | grep -e VGIC -e GICD_SGIR
>>   <G><1>%pv VGIC: write r=%08x                         target->list=%hx, wrong CPUTargetList
>>   <G><1>%pv vGICD:unhandled GICD_SGIR write %08x                  with wrong mode
>>
>> not to mention trailing whitespace too.
>>
>> Rewrite them to be more consise and more useful.  Use 0x prefixes for hex,
> s/consise/concise
>
>> rather than ambigous, and identify the problem target vCPU / mode, rather than
> s/ambigous/ambiguous
>
>> simply saying somethign was wrong.
> s/somethign/something/
>
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>> ---
>> CC: Stefano Stabellini <sstabellini@kernel.org>
>> CC: Julien Grall <julien@xen.org>
>> CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
>> CC: Bertrand Marquis <bertrand.marquis@arm.com>
>> CC: Michal Orzel <michal.orzel@amd.com>
>> CC: Jan Beulich <JBeulich@suse.com>
>>
>> In a fun twist, we can't use target->list directly in the expresion, because
>> the typeof() picks up constness from the pointer, and we get:
>>
>>   In file included from arch/arm/vgic.c:11:
>>   arch/arm/vgic.c: In function ‘vgic_to_sgi’:
>>   ./include/xen/bitops.h:305:19: error: assignment of read-only variable ‘__v’
>>     305 |               __v &= __v - 1 )
>>         |                   ^~
>>   arch/arm/vgic.c:483:9: note: in expansion of macro ‘for_each_set_bit’
>>     483 |         for_each_set_bit ( i, target->list )
>>         |         ^~~~~~~~~~~~~~~~
>>
>> Sadly we need -std=c23 before we can use typeof_unqual() which is what we
>> actually want here.
>> ---
>>  xen/arch/arm/vgic.c | 16 ++++++++--------
>>  1 file changed, 8 insertions(+), 8 deletions(-)
>>
>> diff --git a/xen/arch/arm/vgic.c b/xen/arch/arm/vgic.c
>> index 7b54ccc7cbfa..081cbb67fb52 100644
>> --- a/xen/arch/arm/vgic.c
>> +++ b/xen/arch/arm/vgic.c
>> @@ -470,8 +470,7 @@ bool vgic_to_sgi(struct vcpu *v, register_t sgir, enum gic_sgi_mode irqmode,
>>      struct domain *d = v->domain;
>>      int vcpuid;
>>      int i;
>> -    unsigned int base;
>> -    unsigned long int bitmap;
>> +    unsigned int base, bitmap;
>>
>>      ASSERT( virq < 16 );
>>
>> @@ -481,15 +480,16 @@ bool vgic_to_sgi(struct vcpu *v, register_t sgir, enum gic_sgi_mode irqmode,
>>          perfc_incr(vgic_sgi_list);
>>          base = target->aff1 << 4;
>>          bitmap = target->list;
>> -        bitmap_for_each ( i, &bitmap, sizeof(target->list) * 8 )
>> +
>> +        for_each_set_bit ( i, bitmap )
>>          {
>>              vcpuid = base + i;
>>              if ( vcpuid >= d->max_vcpus || d->vcpu[vcpuid] == NULL ||
>>                   !is_vcpu_online(d->vcpu[vcpuid]) )
>>              {
>> -                gprintk(XENLOG_WARNING, "VGIC: write r=%"PRIregister" \
>> -                        target->list=%hx, wrong CPUTargetList \n",
>> -                        sgir, target->list);
>> +                gprintk(XENLOG_WARNING,
>> +                        "vGIC: write %#"PRIregister", target->list=%#x, bad target v%d\n",
> Sth like "bad target v2" where the word vcpu does not occur anywhere in the msg can be ambiguous.
> Can you add the word vcpu e.g. "bad vcpu target v%d" or "bad target vcpu %d"

Hmm yeah, v%d doesn't work quite so well when it's not prefixed with d%d.

Would you be happy with d%dv%d?  It's marginally more informative and
shorter.

>
>> +                        sgir, target->list, vcpuid);
>>                  continue;
>>              }
>>              vgic_inject_irq(d, d->vcpu[vcpuid], virq, true);
>> @@ -510,8 +510,8 @@ bool vgic_to_sgi(struct vcpu *v, register_t sgir, enum gic_sgi_mode irqmode,
>>          break;
>>      default:
>>          gprintk(XENLOG_WARNING,
>> -                "vGICD:unhandled GICD_SGIR write %"PRIregister" \
>> -                 with wrong mode\n", sgir);
>> +                "vGICD: GICD_SGIR write %#"PRIregister" with unhangled mode %d\n",
> s/unhangled/unhandled/
>
>> +                sgir, irqmode);
>>          return false;
>>      }
>>
>> --
>> 2.39.2
>>
> Otherwise:
> Reviewed-by: Michal Orzel <michal.orzel@amd.com>

Bah, I really was asleep when writing this.  I spotted 2 of the typos,
but not all of them.

I'll fix them all up.  Thanks.

~Andrew

