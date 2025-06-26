Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 23E8CAE9D2D
	for <lists+xen-devel@lfdr.de>; Thu, 26 Jun 2025 14:06:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1026235.1401437 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uUlMc-0008TQ-Mh; Thu, 26 Jun 2025 12:05:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1026235.1401437; Thu, 26 Jun 2025 12:05:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uUlMc-0008Rx-JE; Thu, 26 Jun 2025 12:05:58 +0000
Received: by outflank-mailman (input) for mailman id 1026235;
 Thu, 26 Jun 2025 12:05:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/Scu=ZJ=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1uUlMa-0008Rr-MI
 for xen-devel@lists.xenproject.org; Thu, 26 Jun 2025 12:05:56 +0000
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [2a00:1450:4864:20::62d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e91f9df0-5285-11f0-b894-0df219b8e170;
 Thu, 26 Jun 2025 14:05:54 +0200 (CEST)
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-adfb562266cso177496366b.0
 for <xen-devel@lists.xenproject.org>; Thu, 26 Jun 2025 05:05:54 -0700 (PDT)
Received: from [192.168.1.5] (user-109-243-64-38.play-internet.pl.
 [109.243.64.38]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ae086a98f6dsm786885966b.32.2025.06.26.05.05.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 26 Jun 2025 05:05:49 -0700 (PDT)
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
X-Inumbo-ID: e91f9df0-5285-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750939554; x=1751544354; darn=lists.xenproject.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JvqOUCz6CM/70Tu4cQNcQFaup+NPkqjq/GUJGfkTCzk=;
        b=EM2c4yh4Do0yA/3RAPZmRjagnQGWjESS865iX+SoRmYlS7GH6fjkPKvo9FXEaQELis
         dZxwLrneM3qBF1sYUS9Cjyz1EH1sAUd8f1KdIpU5BakzAEokrvYsEYmwnANR1zdtxEBf
         lGZnk8tqJhB1BM/ApTIHvpBX+A0GdFrnY7sLIndpiwKuMTiZoR/q5mA8BpnXe/FLU139
         ueQ1fwNn5TdX55NqgRVAXY88bIC5t7NzQzbohIkqDSyyRu8DVHZN/un/1JnY7GgDTV12
         9NA9Dm1wNcw2OmywasIGRTAkX3UiHPzNE4JZmc4VflrCMBbSVELEh4nMbzX0gBFiop6X
         GAKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750939554; x=1751544354;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=JvqOUCz6CM/70Tu4cQNcQFaup+NPkqjq/GUJGfkTCzk=;
        b=Dv1oA4LK3J3FpXgYvLdZ/iw5TzaWhuiEgnFe8SDzmovPccQavDxOGhyV5+xnHGgDTh
         QV4Mw3H/SlIioOVYJaIN/XnKWD00lJIBFGc0uSjMsL/xxG1T+qE+LHGkz9wh7LnxWWCC
         qv305EZz+6jS9fV9PpmAiUwziVLoO2uXA22Hn1jM429p/r5Od184VSfDAeVHC/hU0mhY
         uZpcN3nlanIERxwUUnqLX3sNMXk1oRF2RGL2tux71CuMKCjdiW+P8+8bmLQJ3kjauSMq
         rRiyVfih/4H/N6xcS0VGSUyM2PlM/57c5OG7Smmt3VbQNtJSCsa5E4NhkqNvIKEKS00F
         +TfA==
X-Forwarded-Encrypted: i=1; AJvYcCXxa5o8YW/r8W2ys/kCFMamdehlHM+xMcS/qJcGX8E7yYKoFonENm4WbDP/OVYzGTKbmjAgBZJdIfk=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzqwH06tbh+5JxmVXctTj45q6wMwlzr7YQ6ouNfgW0lOlBr1Nuv
	lF0NHoIYkVR/oE0fvJwToHlsDZ1MPzLLBqtaw60NcvDSHJ0dB/FWt6OT
X-Gm-Gg: ASbGncsP2oACo3czFcKD7OgLlhy40/RrZPB9W33/+/hV9c7//QWkfFIDHKa9mUCxXmy
	r1FTkoxoTNtaNAofPUSmBdLP/x0lVIHBxtA/ZVvd7aPT81Imq8434cK8vyVNU5yIWjY1SzsD6KH
	glgvs9xY4CGsLabMOOS1IOVZfmFx4YVA9VOIm06R7vkaKFc3yukAxVqIOuTIiA4OnjRSaH/aBHp
	eNiAzlsD7SHDMvnM+WdqRm2mvW95BWFhNicqAFS8W+Dy2ZfuWnAKoMr3pl0V7lmHlNhy+0NxBHN
	rOvfVBL3Q3NHDAj+QczBFmhjwzWkmB5ypkxWQ54SBBPvNFM5+AIzMselE5D1S1PBKqX34M2QTd4
	NVMwzzpptmMuCQycporDSQNC7V/7DlLA4Ozo=
X-Google-Smtp-Source: AGHT+IFjCXcb0Cb3YkACgioKxbZYK9NGSnJYxawKvdBT4aUlDIWGJgMaH8jopo/yhCunOc9IZvVqzg==
X-Received: by 2002:a17:907:7e82:b0:ad8:9b5d:2c16 with SMTP id a640c23a62f3a-ae0bebe9319mr683549066b.11.1750939551748;
        Thu, 26 Jun 2025 05:05:51 -0700 (PDT)
Content-Type: multipart/alternative;
 boundary="------------7TZvkuo8fanFMXJhoM8Z9Rxa"
Message-ID: <817a318b-ec0d-4f1e-b29e-5f0b624a89f3@gmail.com>
Date: Thu, 26 Jun 2025 14:05:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 03/17] xen/riscv: introduce guest domain's VMID
 allocation and manegement
To: Juergen Gross <jgross@suse.com>, Jan Beulich <jbeulich@suse.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1749555949.git.oleksii.kurochko@gmail.com>
 <abbf1c30c485d4baae25d4c1fb26942f60015403.1749555949.git.oleksii.kurochko@gmail.com>
 <d747fd23-9ac3-49d2-8a5e-699290cef3f4@suse.com>
 <145f71c2-643e-4839-a2ae-0bc1f049db74@gmail.com>
 <80223fe3-7403-4026-9505-8826c318fabb@suse.com>
 <a692d449-4101-498e-a460-33e4b2fb7176@gmail.com>
 <f5c14ffa-6314-4534-a83e-4024b379755c@suse.com>
 <1a570c32-e207-47f5-9702-a752246328a9@gmail.com>
 <f4a20826-0949-4bf0-a8e8-eecd1428f739@suse.com>
 <264db0b0-43bf-4829-a5cc-ca696601349c@gmail.com>
 <7c5761b5-805c-4d56-ad8c-1746540423e4@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <7c5761b5-805c-4d56-ad8c-1746540423e4@suse.com>

This is a multi-part message in MIME format.
--------------7TZvkuo8fanFMXJhoM8Z9Rxa
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 6/26/25 1:43 PM, Juergen Gross wrote:
> On 26.06.25 13:34, Oleksii Kurochko wrote:
>>
>> On 6/26/25 12:41 PM, Jan Beulich wrote:
>>> On 26.06.2025 12:05, Oleksii Kurochko wrote:
>>>> On 6/24/25 4:01 PM, Jan Beulich wrote:
>>>>> On 24.06.2025 15:47, Oleksii Kurochko wrote:
>>>>>> On 6/24/25 12:44 PM, Jan Beulich wrote:
>>>>>>> On 24.06.2025 11:46, Oleksii Kurochko wrote:
>>>>>>>> On 6/18/25 5:46 PM, Jan Beulich wrote:
>>>>>>>>> On 10.06.2025 15:05, Oleksii Kurochko wrote:
>>>>>>>>>> --- /dev/null
>>>>>>>>>> +++ b/xen/arch/riscv/p2m.c
>>>>>>>>>> @@ -0,0 +1,115 @@
>>>>>>>>>> +#include <xen/bitops.h>
>>>>>>>>>> +#include <xen/lib.h>
>>>>>>>>>> +#include <xen/sched.h>
>>>>>>>>>> +#include <xen/spinlock.h>
>>>>>>>>>> +#include <xen/xvmalloc.h>
>>>>>>>>>> +
>>>>>>>>>> +#include <asm/p2m.h>
>>>>>>>>>> +#include <asm/sbi.h>
>>>>>>>>>> +
>>>>>>>>>> +static spinlock_t vmid_alloc_lock = SPIN_LOCK_UNLOCKED;
>>>>>>>>>> +
>>>>>>>>>> +/*
>>>>>>>>>> + * hgatp's VMID field is 7 or 14 bits. RV64 may support 
>>>>>>>>>> 14-bit VMID.
>>>>>>>>>> + * Using a bitmap here limits us to 127 (2^7 - 1) or 16383 
>>>>>>>>>> (2^14 - 1)
>>>>>>>>>> + * concurrent domains.
>>>>>>>>> Which is pretty limiting especially in the RV32 case. Hence 
>>>>>>>>> why we don't
>>>>>>>>> assign a permanent ID to VMs on x86, but rather manage IDs 
>>>>>>>>> per-CPU (note:
>>>>>>>>> not per-vCPU).
>>>>>>>> Good point.
>>>>>>>>
>>>>>>>> I don't believe anyone will use RV32.
>>>>>>>> For RV64, the available ID space seems sufficiently large.
>>>>>>>>
>>>>>>>> However, if it turns out that the value isn't large enough even 
>>>>>>>> for RV64,
>>>>>>>> I can rework it to manage IDs per physical CPU.
>>>>>>>> Wouldn't that approach result in more TLB entries being flushed 
>>>>>>>> compared
>>>>>>>> to per-vCPU allocation, potentially leading to slightly worse 
>>>>>>>> performance?
>>>>>>> Depends on the condition for when to flush. Of course 
>>>>>>> performance is
>>>>>>> unavoidably going to suffer if you have only very few VMIDs to use.
>>>>>>> Nevertheless, as indicated before, the model used on x86 may be a
>>>>>>> candidate to use here, too. See hvm_asid_handle_vmenter() for the
>>>>>>> core (and vendor-independent) part of it.
>>>>>> IIUC, so basically it is just a round-robin and when VMIDs are 
>>>>>> ran out
>>>>>> then just do full guest TLB flush and start to re-use VMIDs from 
>>>>>> the start.
>>>>>> It makes sense to me, I'll implement something similar. (as I'm 
>>>>>> not really
>>>>>> sure that we needdata->core_asid_generation, probably, I will 
>>>>>> understand it better when
>>>>>> start to implement it)
>>>>> Well. The fewer VMID bits you have the more quickly you will need 
>>>>> a new
>>>>> generation. And keep track of the generation you're at you also 
>>>>> need to
>>>>> track the present number somewhere.
>>>>>
>>>>>>>> What about then to allocate VMID per-domain?
>>>>>>> That's what you're doing right now, isn't it? And that gets 
>>>>>>> problematic when
>>>>>>> you have only very few bits in hgatp.VMID, as mentioned below.
>>>>>> Right, I just phrased my question poorly—sorry about that.
>>>>>>
>>>>>> What I meant to ask is: does the approach described above 
>>>>>> actually depend on whether
>>>>>> VMIDs are allocated per-domain or per-pCPU? It seems that the 
>>>>>> main advantage of
>>>>>> allocating VMIDs per-pCPU is potentially reducing the number of 
>>>>>> TLB flushes,
>>>>>> since it's more likely that a platform will have more 
>>>>>> than|VMID_MAX| domains than
>>>>>> |VMID_MAX| physical CPUs—am I right?
>>>>> Seeing that there can be systems with hundreds or even thousands 
>>>>> of CPUs,
>>>>> I don't think I can agree here. Plus per-pCPU allocation would 
>>>>> similarly
>>>>> get you in trouble when you have only very few VMID bits.
>>>> But not so fast as in case of per-domain allocation, right?
>>>>
>>>> I mean that if we have only 4 bits, then in case of per-domain 
>>>> allocation we will
>>>> need to do TLB flush + VMID re-assigning when we have more then 16 
>>>> domains.
>>>>
>>>> But in case of per-pCPU allocation we could run 16 domains on 1 
>>>> pCPU and at the same
>>>> time in multiprocessor systems we have more pCPUs, which will allow 
>>>> us to run more
>>>> domains and avoid TLB flushes.
>>>> On other hand, it is needed to consider that it's unlikely that a 
>>>> domain will have
>>>> only one vCPU. And it is likely that amount of vCPUs will be bigger 
>>>> then an amount
>>>> of domains, so to have a round-robin approach (as x86) without 
>>>> permanent ID allocation
>>>> for each domain will work better then per-pCPU allocation.
>>> Here you (appear to) say one thing, ...
>>>
>>>> In other words, I'm not 100% sure that I get a point why x86 chose 
>>>> per-pCPU allocation
>>>> instead of per-domain allocation with having the same VMID for all 
>>>> vCPUs of domains.
>>> ... and then here the opposite. Overall I'm in severe trouble 
>>> understanding this
>>> reply of yours as a whole, so I fear I can't really respond to it 
>>> (or even just
>>> parts thereof).
>>
>> IIUC, x86 allocates VMIDs per physical CPU (pCPU) "dynamically" — 
>> these are just
>> sequential numbers, and once VMIDs run out on a given pCPU, there's 
>> no guarantee
>> that a vCPU will receive the same VMID again.
>>
>> On the other hand, RISC-V currently allocates a single VMID per 
>> domain, and that
>> VMID is considered "permanent" until the domain is destroyed. This 
>> means we are
>> limited to at most VMID_MAX domains. To avoid this limitation, I plan 
>> to implement
>> a round-robin reuse approach: when no free VMIDs remain, we start a 
>> new generation
>> and begin reusing old VMIDs.
>>
>> The only remaining design question is whether we want RISC-V to 
>> follow a global
>> VMID allocation policy (i.e., one VMID per domain, shared across all 
>> of its vCPUs),
>> or adopt a policy similar to x86 with per-CPU VMID allocation (each 
>> vCPU gets its
>> own VMID, local to the CPU it's running on).
>>
>> Each policy has its own trade-offs. But in the case where the number 
>> of available
>> VMIDs is small (i.e., low VMIDLEN), a global allocation policy may be 
>> more suitable,
>> as it requires fewer VMIDs overall.
>>
>> So my main question was:
>> What are the advantages of per-pCPU VMID allocation in scenarios with 
>> limited VMID
>> space, and why did x86 choose that design?
>>
>>> From what I can tell, the benefits of per-pCPU VMID allocation include:
>> - Minimized inter-CPU TLB flushes — since VMIDs are local, TLB 
>> entries don’t need
>>    to be invalidated on other CPUs when reused.
>> - Better scalability — this approach works better on systems with a 
>> large number
>>    of CPUs.
>> - Frequent VM switches don’t require global TLB flushes — reducing 
>> the overhead
>>    of context switching.
>> However, the downside is that this model consumes more VMIDs. For 
>> example,
>> if a single domain runs on 4 vCPUs across 4 CPUs, it will consume 4 
>> VMIDs instead
>> of just one.
>
> Consider you have 4 bits for VMIDs, resulting in 16 VMID values.
>
> If you have a system with 32 physical CPUs and 32 domains with 1 vcpu 
> each
> on that system, your scheme would NOT allow to keep each physical cpu 
> busy
> by running a domain on it, as only 16 domains could be active at the same
> time.

It makes sense to me.

Thanks.

~ Oleksii

--------------7TZvkuo8fanFMXJhoM8Z9Rxa
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 6/26/25 1:43 PM, Juergen Gross
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:7c5761b5-805c-4d56-ad8c-1746540423e4@suse.com">On
      26.06.25 13:34, Oleksii Kurochko wrote:
      <br>
      <blockquote type="cite">
        <br>
        On 6/26/25 12:41 PM, Jan Beulich wrote:
        <br>
        <blockquote type="cite">On 26.06.2025 12:05, Oleksii Kurochko
          wrote:
          <br>
          <blockquote type="cite">On 6/24/25 4:01 PM, Jan Beulich wrote:
            <br>
            <blockquote type="cite">On 24.06.2025 15:47, Oleksii
              Kurochko wrote:
              <br>
              <blockquote type="cite">On 6/24/25 12:44 PM, Jan Beulich
                wrote:
                <br>
                <blockquote type="cite">On 24.06.2025 11:46, Oleksii
                  Kurochko wrote:
                  <br>
                  <blockquote type="cite">On 6/18/25 5:46 PM, Jan
                    Beulich wrote:
                    <br>
                    <blockquote type="cite">On 10.06.2025 15:05, Oleksii
                      Kurochko wrote:
                      <br>
                      <blockquote type="cite">--- /dev/null
                        <br>
                        +++ b/xen/arch/riscv/p2m.c
                        <br>
                        @@ -0,0 +1,115 @@
                        <br>
                        +#include &lt;xen/bitops.h&gt;
                        <br>
                        +#include &lt;xen/lib.h&gt;
                        <br>
                        +#include &lt;xen/sched.h&gt;
                        <br>
                        +#include &lt;xen/spinlock.h&gt;
                        <br>
                        +#include &lt;xen/xvmalloc.h&gt;
                        <br>
                        +
                        <br>
                        +#include &lt;asm/p2m.h&gt;
                        <br>
                        +#include &lt;asm/sbi.h&gt;
                        <br>
                        +
                        <br>
                        +static spinlock_t vmid_alloc_lock =
                        SPIN_LOCK_UNLOCKED;
                        <br>
                        +
                        <br>
                        +/*
                        <br>
                        + * hgatp's VMID field is 7 or 14 bits. RV64 may
                        support 14-bit VMID.
                        <br>
                        + * Using a bitmap here limits us to 127 (2^7 -
                        1) or 16383 (2^14 - 1)
                        <br>
                        + * concurrent domains.
                        <br>
                      </blockquote>
                      Which is pretty limiting especially in the RV32
                      case. Hence why we don't
                      <br>
                      assign a permanent ID to VMs on x86, but rather
                      manage IDs per-CPU (note:
                      <br>
                      not per-vCPU).
                      <br>
                    </blockquote>
                    Good point.
                    <br>
                    <br>
                    I don't believe anyone will use RV32.
                    <br>
                    For RV64, the available ID space seems sufficiently
                    large.
                    <br>
                    <br>
                    However, if it turns out that the value isn't large
                    enough even for RV64,
                    <br>
                    I can rework it to manage IDs per physical CPU.
                    <br>
                    Wouldn't that approach result in more TLB entries
                    being flushed compared
                    <br>
                    to per-vCPU allocation, potentially leading to
                    slightly worse performance?
                    <br>
                  </blockquote>
                  Depends on the condition for when to flush. Of course
                  performance is
                  <br>
                  unavoidably going to suffer if you have only very few
                  VMIDs to use.
                  <br>
                  Nevertheless, as indicated before, the model used on
                  x86 may be a
                  <br>
                  candidate to use here, too. See
                  hvm_asid_handle_vmenter() for the
                  <br>
                  core (and vendor-independent) part of it.
                  <br>
                </blockquote>
                IIUC, so basically it is just a round-robin and when
                VMIDs are ran out
                <br>
                then just do full guest TLB flush and start to re-use
                VMIDs from the start.
                <br>
                It makes sense to me, I'll implement something similar.
                (as I'm not really
                <br>
                sure that we needdata-&gt;core_asid_generation,
                probably, I will understand it better when
                <br>
                start to implement it)
                <br>
              </blockquote>
              Well. The fewer VMID bits you have the more quickly you
              will need a new
              <br>
              generation. And keep track of the generation you're at you
              also need to
              <br>
              track the present number somewhere.
              <br>
              <br>
              <blockquote type="cite">
                <blockquote type="cite">
                  <blockquote type="cite">What about then to allocate
                    VMID per-domain?
                    <br>
                  </blockquote>
                  That's what you're doing right now, isn't it? And that
                  gets problematic when
                  <br>
                  you have only very few bits in hgatp.VMID, as
                  mentioned below.
                  <br>
                </blockquote>
                Right, I just phrased my question poorly—sorry about
                that.
                <br>
                <br>
                What I meant to ask is: does the approach described
                above actually depend on whether
                <br>
                VMIDs are allocated per-domain or per-pCPU? It seems
                that the main advantage of
                <br>
                allocating VMIDs per-pCPU is potentially reducing the
                number of TLB flushes,
                <br>
                since it's more likely that a platform will have more
                than|VMID_MAX| domains than
                <br>
                |VMID_MAX| physical CPUs—am I right?
                <br>
              </blockquote>
              Seeing that there can be systems with hundreds or even
              thousands of CPUs,
              <br>
              I don't think I can agree here. Plus per-pCPU allocation
              would similarly
              <br>
              get you in trouble when you have only very few VMID bits.
              <br>
            </blockquote>
            But not so fast as in case of per-domain allocation, right?
            <br>
            <br>
            I mean that if we have only 4 bits, then in case of
            per-domain allocation we will
            <br>
            need to do TLB flush + VMID re-assigning when we have more
            then 16 domains.
            <br>
            <br>
            But in case of per-pCPU allocation we could run 16 domains
            on 1 pCPU and at the same
            <br>
            time in multiprocessor systems we have more pCPUs, which
            will allow us to run more
            <br>
            domains and avoid TLB flushes.
            <br>
            On other hand, it is needed to consider that it's unlikely
            that a domain will have
            <br>
            only one vCPU. And it is likely that amount of vCPUs will be
            bigger then an amount
            <br>
            of domains, so to have a round-robin approach (as x86)
            without permanent ID allocation
            <br>
            for each domain will work better then per-pCPU allocation.
            <br>
          </blockquote>
          Here you (appear to) say one thing, ...
          <br>
          <br>
          <blockquote type="cite">In other words, I'm not 100% sure that
            I get a point why x86 chose per-pCPU allocation
            <br>
            instead of per-domain allocation with having the same VMID
            for all vCPUs of domains.
            <br>
          </blockquote>
          ... and then here the opposite. Overall I'm in severe trouble
          understanding this
          <br>
          reply of yours as a whole, so I fear I can't really respond to
          it (or even just
          <br>
          parts thereof).
          <br>
        </blockquote>
        <br>
        IIUC, x86 allocates VMIDs per physical CPU (pCPU) "dynamically"
        — these are just
        <br>
        sequential numbers, and once VMIDs run out on a given pCPU,
        there's no guarantee
        <br>
        that a vCPU will receive the same VMID again.
        <br>
        <br>
        On the other hand, RISC-V currently allocates a single VMID per
        domain, and that
        <br>
        VMID is considered "permanent" until the domain is destroyed.
        This means we are
        <br>
        limited to at most VMID_MAX domains. To avoid this limitation, I
        plan to implement
        <br>
        a round-robin reuse approach: when no free VMIDs remain, we
        start a new generation
        <br>
        and begin reusing old VMIDs.
        <br>
        <br>
        The only remaining design question is whether we want RISC-V to
        follow a global
        <br>
        VMID allocation policy (i.e., one VMID per domain, shared across
        all of its vCPUs),
        <br>
        or adopt a policy similar to x86 with per-CPU VMID allocation
        (each vCPU gets its
        <br>
        own VMID, local to the CPU it's running on).
        <br>
        <br>
        Each policy has its own trade-offs. But in the case where the
        number of available
        <br>
        VMIDs is small (i.e., low VMIDLEN), a global allocation policy
        may be more suitable,
        <br>
        as it requires fewer VMIDs overall.
        <br>
        <br>
        So my main question was:
        <br>
        What are the advantages of per-pCPU VMID allocation in scenarios
        with limited VMID
        <br>
        space, and why did x86 choose that design?
        <br>
        <br>
        <blockquote type="cite">From what I can tell, the benefits of
          per-pCPU VMID allocation include:
          <br>
        </blockquote>
        - Minimized inter-CPU TLB flushes — since VMIDs are local, TLB
        entries don’t need
        <br>
           to be invalidated on other CPUs when reused.
        <br>
        - Better scalability — this approach works better on systems
        with a large number
        <br>
           of CPUs.
        <br>
        - Frequent VM switches don’t require global TLB flushes —
        reducing the overhead
        <br>
           of context switching.
        <br>
        However, the downside is that this model consumes more VMIDs.
        For example,
        <br>
        if a single domain runs on 4 vCPUs across 4 CPUs, it will
        consume 4 VMIDs instead
        <br>
        of just one.
        <br>
      </blockquote>
      <br>
      Consider you have 4 bits for VMIDs, resulting in 16 VMID values.
      <br>
      <br>
      If you have a system with 32 physical CPUs and 32 domains with 1
      vcpu each
      <br>
      on that system, your scheme would NOT allow to keep each physical
      cpu busy
      <br>
      by running a domain on it, as only 16 domains could be active at
      the same
      <br>
      time.
      <br>
    </blockquote>
    <pre>It makes sense to me.

Thanks.
</pre>
    <pre>~ Oleksii
</pre>
  </body>
</html>

--------------7TZvkuo8fanFMXJhoM8Z9Rxa--

