Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DB3EFAE9D6B
	for <lists+xen-devel@lfdr.de>; Thu, 26 Jun 2025 14:26:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1026284.1401476 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uUlg0-0004on-WB; Thu, 26 Jun 2025 12:26:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1026284.1401476; Thu, 26 Jun 2025 12:26:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uUlg0-0004mz-TT; Thu, 26 Jun 2025 12:26:00 +0000
Received: by outflank-mailman (input) for mailman id 1026284;
 Thu, 26 Jun 2025 12:25:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/Scu=ZJ=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1uUlfz-0004mB-Iv
 for xen-devel@lists.xenproject.org; Thu, 26 Jun 2025 12:25:59 +0000
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [2a00:1450:4864:20::52c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b6c64ffd-5288-11f0-a30f-13f23c93f187;
 Thu, 26 Jun 2025 14:25:58 +0200 (CEST)
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-60c6fea6742so1139075a12.1
 for <xen-devel@lists.xenproject.org>; Thu, 26 Jun 2025 05:25:58 -0700 (PDT)
Received: from [192.168.1.5] (user-109-243-64-38.play-internet.pl.
 [109.243.64.38]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-60c2f484513sm3846246a12.63.2025.06.26.05.25.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 26 Jun 2025 05:25:56 -0700 (PDT)
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
X-Inumbo-ID: b6c64ffd-5288-11f0-a30f-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750940758; x=1751545558; darn=lists.xenproject.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EtVThhDR2ZkPKlPNqNM2MZDX8KfeUM3tCDZbDjHg4uw=;
        b=QHcVG1jYei95InxQJ0zJdAh+k1GsWsgZGGPyaFqa+Dx4bRWwhobV5DKUeKMTXma4u3
         v695+9nfArEMzkohT/7K3TRx4bJQfunW1rLdu8sp0OjQbLWAD9Oe96LWPguzqBU/LqlQ
         30NwrCCgH78Ga1+luKomZYDd3d3vyZW06t83wHIExzy7kgQzdZFrjWtJk/0SXkCMwhqJ
         9JKJLfkr7umdqpUMJMRjzkog8Vww4/XnmyPkQ/CeWYzhUkg/UUKyYum2e4N3CmJFfGDg
         xgcnmfLE6ub3myH+OeOmAEkjg/UIkf1T5vmYIrpSadx0Q0uw7m81XEnz02Okw7mp6tx0
         XRfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750940758; x=1751545558;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=EtVThhDR2ZkPKlPNqNM2MZDX8KfeUM3tCDZbDjHg4uw=;
        b=ieTSGKB/HjQ+VUPx1EI/N5KOTawv5AT2cfGOjqzdzpQu4IET3eJGsk2jOoBETgST5n
         wfL/QPSXrLY0oBDilHCHLULS3ILNRccCytCpVbQkeyqHVIZPE+UZKGC59B9wEdQlidKk
         fx4Nqn+sNPbHdTJY2gbHDgzHji3iLeTfgM1kzASrV9+SZVFqUwPTmgXaOfRXM78qT5D0
         FTMCLheM4/3WQ7Fhdt9QmzX+nKqRNaSxjTDSRXYfajIKzJqh4ZXzTuXw0p8W7OZTFQ3L
         wcCxe1JAUeJcERj+BdUQu3D4chwPqcP5zlBlqHGfaRZVNDajlxqK9pKRkrDzoP3ocGMj
         L2Ug==
X-Forwarded-Encrypted: i=1; AJvYcCW08me0XNGNjIEtB5Jg4BYMH74sDCnwGhokGS+zihcctntf8bRYgNQzxjrgxWRqtIpUm70GOz0mDcY=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzOCYhTAUYVxtUF5jCPNiq8lfa+ff6XFwKk0PlKL37c4ZhFD/WN
	5bcyWP0yM1AFozLIm8JsuJOOXCHiJvzgxXjGG3DQv/wxRRDNp3928XIu
X-Gm-Gg: ASbGncs8Yh+NuO9sCgUSFANQlnigKeJ/9G0W3DZAa0gms1TyJnWcfZ3UmYJlnnfMSoZ
	2ypcP9U2ydnemxDxhhZjrZMRlY65mMmz5QGgv8TjO4Sqyozl3CFJumA7KP3t2d27yho9OVUEvU8
	Nyi98xZ/JZrzhkFIizsBnjRHxdxkVD1GsUhrBVH+r1iSLrs9BSLPdeNW66T9n9I+FWdzK+vShhL
	XjUOC4w7NRgYskRrL4Qz/deYq/FEENNZNsG8HzQHd0fkyBs15ryZUNon/rHp7iftuSxapjOtMKA
	eEM9iMg0D22/ECuJhUfdb7P8YD68/Q9hfNNfWW3cAbyGUV4bx1SmrWbt9HV87jLpZrPyfiLzKXO
	KIaEfeOGmyKEDc9Jd03sn8GiuAart+qNy6no=
X-Google-Smtp-Source: AGHT+IEMop9OPusb263sBsJLaApm/zJD5bLdPhV0FRZOkQsGKx2Dy9lVFcaSNephjvwdtQwjC8Z2vA==
X-Received: by 2002:a05:6402:1ed4:b0:607:6fd3:374f with SMTP id 4fb4d7f45d1cf-60c4dd26e88mr6433457a12.20.1750940757650;
        Thu, 26 Jun 2025 05:25:57 -0700 (PDT)
Content-Type: multipart/alternative;
 boundary="------------N0HV02j0fnyagYQmqyOgJ6V9"
Message-ID: <e2f60dd0-0333-4fe8-898d-a4ac184c51d2@gmail.com>
Date: Thu, 26 Jun 2025 14:25:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 03/17] xen/riscv: introduce guest domain's VMID
 allocation and manegement
To: Jan Beulich <jbeulich@suse.com>
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
 <b521ef1a-03fb-4225-8d4d-5cffa65c0e93@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <b521ef1a-03fb-4225-8d4d-5cffa65c0e93@suse.com>

This is a multi-part message in MIME format.
--------------N0HV02j0fnyagYQmqyOgJ6V9
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 6/26/25 2:16 PM, Jan Beulich wrote:
> On 26.06.2025 13:34, Oleksii Kurochko wrote:
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
>>>>>>>>>> + * hgatp's VMID field is 7 or 14 bits. RV64 may support 14-bit VMID.
>>>>>>>>>> + * Using a bitmap here limits us to 127 (2^7 - 1) or 16383 (2^14 - 1)
>>>>>>>>>> + * concurrent domains.
>>>>>>>>> Which is pretty limiting especially in the RV32 case. Hence why we don't
>>>>>>>>> assign a permanent ID to VMs on x86, but rather manage IDs per-CPU (note:
>>>>>>>>> not per-vCPU).
>>>>>>>> Good point.
>>>>>>>>
>>>>>>>> I don't believe anyone will use RV32.
>>>>>>>> For RV64, the available ID space seems sufficiently large.
>>>>>>>>
>>>>>>>> However, if it turns out that the value isn't large enough even for RV64,
>>>>>>>> I can rework it to manage IDs per physical CPU.
>>>>>>>> Wouldn't that approach result in more TLB entries being flushed compared
>>>>>>>> to per-vCPU allocation, potentially leading to slightly worse performance?
>>>>>>> Depends on the condition for when to flush. Of course performance is
>>>>>>> unavoidably going to suffer if you have only very few VMIDs to use.
>>>>>>> Nevertheless, as indicated before, the model used on x86 may be a
>>>>>>> candidate to use here, too. See hvm_asid_handle_vmenter() for the
>>>>>>> core (and vendor-independent) part of it.
>>>>>> IIUC, so basically it is just a round-robin and when VMIDs are ran out
>>>>>> then just do full guest TLB flush and start to re-use VMIDs from the start.
>>>>>> It makes sense to me, I'll implement something similar. (as I'm not really
>>>>>> sure that we needdata->core_asid_generation, probably, I will understand it better when
>>>>>> start to implement it)
>>>>> Well. The fewer VMID bits you have the more quickly you will need a new
>>>>> generation. And keep track of the generation you're at you also need to
>>>>> track the present number somewhere.
>>>>>
>>>>>>>> What about then to allocate VMID per-domain?
>>>>>>> That's what you're doing right now, isn't it? And that gets problematic when
>>>>>>> you have only very few bits in hgatp.VMID, as mentioned below.
>>>>>> Right, I just phrased my question poorly—sorry about that.
>>>>>>
>>>>>> What I meant to ask is: does the approach described above actually depend on whether
>>>>>> VMIDs are allocated per-domain or per-pCPU? It seems that the main advantage of
>>>>>> allocating VMIDs per-pCPU is potentially reducing the number of TLB flushes,
>>>>>> since it's more likely that a platform will have more than|VMID_MAX| domains than
>>>>>> |VMID_MAX| physical CPUs—am I right?
>>>>> Seeing that there can be systems with hundreds or even thousands of CPUs,
>>>>> I don't think I can agree here. Plus per-pCPU allocation would similarly
>>>>> get you in trouble when you have only very few VMID bits.
>>>> But not so fast as in case of per-domain allocation, right?
>>>>
>>>> I mean that if we have only 4 bits, then in case of per-domain allocation we will
>>>> need to do TLB flush + VMID re-assigning when we have more then 16 domains.
>>>>
>>>> But in case of per-pCPU allocation we could run 16 domains on 1 pCPU and at the same
>>>> time in multiprocessor systems we have more pCPUs, which will allow us to run more
>>>> domains and avoid TLB flushes.
>>>> On other hand, it is needed to consider that it's unlikely that a domain will have
>>>> only one vCPU. And it is likely that amount of vCPUs will be bigger then an amount
>>>> of domains, so to have a round-robin approach (as x86) without permanent ID allocation
>>>> for each domain will work better then per-pCPU allocation.
>>> Here you (appear to) say one thing, ...
>>>
>>>> In other words, I'm not 100% sure that I get a point why x86 chose per-pCPU allocation
>>>> instead of per-domain allocation with having the same VMID for all vCPUs of domains.
>>> ... and then here the opposite. Overall I'm in severe trouble understanding this
>>> reply of yours as a whole, so I fear I can't really respond to it (or even just
>>> parts thereof).
>> IIUC, x86 allocates VMIDs per physical CPU (pCPU) "dynamically" — these are just
>> sequential numbers, and once VMIDs run out on a given pCPU, there's no guarantee
>> that a vCPU will receive the same VMID again.
>>
>> On the other hand, RISC-V currently allocates a single VMID per domain, and that
>> VMID is considered "permanent" until the domain is destroyed. This means we are
>> limited to at most VMID_MAX domains. To avoid this limitation, I plan to implement
>> a round-robin reuse approach: when no free VMIDs remain, we start a new generation
>> and begin reusing old VMIDs.
>>
>> The only remaining design question is whether we want RISC-V to follow a global
>> VMID allocation policy (i.e., one VMID per domain, shared across all of its vCPUs),
>> or adopt a policy similar to x86 with per-CPU VMID allocation (each vCPU gets its
>> own VMID, local to the CPU it's running on).
> Besides what Jürgen has said, what would this mean if you have 16 VMIDs and a 17th
> domain appears? You can't "take away" the VMID from any domain, unless you fully
> suspended it first (that is, all of its vCPU-s).

In this case, use of VMID could be dropped and just flush the guest TLB before entering
domain. Not efficient, but still an option.

>
>> Each policy has its own trade-offs. But in the case where the number of available
>> VMIDs is small (i.e., low VMIDLEN), a global allocation policy may be more suitable,
>> as it requires fewer VMIDs overall.
>>
>> So my main question was:
>> What are the advantages of per-pCPU VMID allocation in scenarios with limited VMID
>> space, and why did x86 choose that design?
>>
>>   From what I can tell, the benefits of per-pCPU VMID allocation include:
>> - Minimized inter-CPU TLB flushes — since VMIDs are local, TLB entries don’t need
>>     to be invalidated on other CPUs when reused.
>> - Better scalability — this approach works better on systems with a large number
>>     of CPUs.
>> - Frequent VM switches don’t require global TLB flushes — reducing the overhead
>>     of context switching.
>> However, the downside is that this model consumes more VMIDs. For example,
>> if a single domain runs on 4 vCPUs across 4 CPUs, it will consume 4 VMIDs instead
>> of just one.
> I don't understand this, nor why it's a downside. Looking at a domain as a whole
> simply doesn't make sense in this model. Or if you do, then you need to consider
> the system-wide number of VMIDs you have available:
> (1 << VMIDLEN) * num_online_cpus(). That is, in your calculation a domain with
> 4 vCPU-s may indeed use up to 4 VMIDs at a time, but out of a pool at least 4
> times the size of that of an individual pCPU.

Good point, I thought about that too.

~ Oleksii

--------------N0HV02j0fnyagYQmqyOgJ6V9
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
    <div class="moz-cite-prefix">On 6/26/25 2:16 PM, Jan Beulich wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:b521ef1a-03fb-4225-8d4d-5cffa65c0e93@suse.com">
      <pre wrap="" class="moz-quote-pre">On 26.06.2025 13:34, Oleksii Kurochko wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">
On 6/26/25 12:41 PM, Jan Beulich wrote:
</pre>
        <blockquote type="cite">
          <pre wrap="" class="moz-quote-pre">On 26.06.2025 12:05, Oleksii Kurochko wrote:
</pre>
          <blockquote type="cite">
            <pre wrap="" class="moz-quote-pre">On 6/24/25 4:01 PM, Jan Beulich wrote:
</pre>
            <blockquote type="cite">
              <pre wrap="" class="moz-quote-pre">On 24.06.2025 15:47, Oleksii Kurochko wrote:
</pre>
              <blockquote type="cite">
                <pre wrap="" class="moz-quote-pre">On 6/24/25 12:44 PM, Jan Beulich wrote:
</pre>
                <blockquote type="cite">
                  <pre wrap="" class="moz-quote-pre">On 24.06.2025 11:46, Oleksii Kurochko wrote:
</pre>
                  <blockquote type="cite">
                    <pre wrap="" class="moz-quote-pre">On 6/18/25 5:46 PM, Jan Beulich wrote:
</pre>
                    <blockquote type="cite">
                      <pre wrap="" class="moz-quote-pre">On 10.06.2025 15:05, Oleksii Kurochko wrote:
</pre>
                      <blockquote type="cite">
                        <pre wrap="" class="moz-quote-pre">--- /dev/null
+++ b/xen/arch/riscv/p2m.c
@@ -0,0 +1,115 @@
+#include &lt;xen/bitops.h&gt;
+#include &lt;xen/lib.h&gt;
+#include &lt;xen/sched.h&gt;
+#include &lt;xen/spinlock.h&gt;
+#include &lt;xen/xvmalloc.h&gt;
+
+#include &lt;asm/p2m.h&gt;
+#include &lt;asm/sbi.h&gt;
+
+static spinlock_t vmid_alloc_lock = SPIN_LOCK_UNLOCKED;
+
+/*
+ * hgatp's VMID field is 7 or 14 bits. RV64 may support 14-bit VMID.
+ * Using a bitmap here limits us to 127 (2^7 - 1) or 16383 (2^14 - 1)
+ * concurrent domains.
</pre>
                      </blockquote>
                      <pre wrap="" class="moz-quote-pre">Which is pretty limiting especially in the RV32 case. Hence why we don't
assign a permanent ID to VMs on x86, but rather manage IDs per-CPU (note:
not per-vCPU).
</pre>
                    </blockquote>
                    <pre wrap="" class="moz-quote-pre">Good point.

I don't believe anyone will use RV32.
For RV64, the available ID space seems sufficiently large.

However, if it turns out that the value isn't large enough even for RV64,
I can rework it to manage IDs per physical CPU.
Wouldn't that approach result in more TLB entries being flushed compared
to per-vCPU allocation, potentially leading to slightly worse performance?
</pre>
                  </blockquote>
                  <pre wrap="" class="moz-quote-pre">Depends on the condition for when to flush. Of course performance is
unavoidably going to suffer if you have only very few VMIDs to use.
Nevertheless, as indicated before, the model used on x86 may be a
candidate to use here, too. See hvm_asid_handle_vmenter() for the
core (and vendor-independent) part of it.
</pre>
                </blockquote>
                <pre wrap="" class="moz-quote-pre">IIUC, so basically it is just a round-robin and when VMIDs are ran out
then just do full guest TLB flush and start to re-use VMIDs from the start.
It makes sense to me, I'll implement something similar. (as I'm not really
sure that we needdata-&gt;core_asid_generation, probably, I will understand it better when
start to implement it)
</pre>
              </blockquote>
              <pre wrap="" class="moz-quote-pre">Well. The fewer VMID bits you have the more quickly you will need a new
generation. And keep track of the generation you're at you also need to
track the present number somewhere.

</pre>
              <blockquote type="cite">
                <blockquote type="cite">
                  <blockquote type="cite">
                    <pre wrap="" class="moz-quote-pre">What about then to allocate VMID per-domain?
</pre>
                  </blockquote>
                  <pre wrap="" class="moz-quote-pre">That's what you're doing right now, isn't it? And that gets problematic when
you have only very few bits in hgatp.VMID, as mentioned below.
</pre>
                </blockquote>
                <pre wrap="" class="moz-quote-pre">Right, I just phrased my question poorly—sorry about that.

What I meant to ask is: does the approach described above actually depend on whether
VMIDs are allocated per-domain or per-pCPU? It seems that the main advantage of
allocating VMIDs per-pCPU is potentially reducing the number of TLB flushes,
since it's more likely that a platform will have more than|VMID_MAX| domains than
|VMID_MAX| physical CPUs—am I right?
</pre>
              </blockquote>
              <pre wrap="" class="moz-quote-pre">Seeing that there can be systems with hundreds or even thousands of CPUs,
I don't think I can agree here. Plus per-pCPU allocation would similarly
get you in trouble when you have only very few VMID bits.
</pre>
            </blockquote>
            <pre wrap="" class="moz-quote-pre">But not so fast as in case of per-domain allocation, right?

I mean that if we have only 4 bits, then in case of per-domain allocation we will
need to do TLB flush + VMID re-assigning when we have more then 16 domains.

But in case of per-pCPU allocation we could run 16 domains on 1 pCPU and at the same
time in multiprocessor systems we have more pCPUs, which will allow us to run more
domains and avoid TLB flushes.
On other hand, it is needed to consider that it's unlikely that a domain will have
only one vCPU. And it is likely that amount of vCPUs will be bigger then an amount
of domains, so to have a round-robin approach (as x86) without permanent ID allocation
for each domain will work better then per-pCPU allocation.
</pre>
          </blockquote>
          <pre wrap="" class="moz-quote-pre">Here you (appear to) say one thing, ...

</pre>
          <blockquote type="cite">
            <pre wrap="" class="moz-quote-pre">In other words, I'm not 100% sure that I get a point why x86 chose per-pCPU allocation
instead of per-domain allocation with having the same VMID for all vCPUs of domains.
</pre>
          </blockquote>
          <pre wrap="" class="moz-quote-pre">... and then here the opposite. Overall I'm in severe trouble understanding this
reply of yours as a whole, so I fear I can't really respond to it (or even just
parts thereof).
</pre>
        </blockquote>
        <pre wrap="" class="moz-quote-pre">
IIUC, x86 allocates VMIDs per physical CPU (pCPU) "dynamically" — these are just
sequential numbers, and once VMIDs run out on a given pCPU, there's no guarantee
that a vCPU will receive the same VMID again.

On the other hand, RISC-V currently allocates a single VMID per domain, and that
VMID is considered "permanent" until the domain is destroyed. This means we are
limited to at most VMID_MAX domains. To avoid this limitation, I plan to implement
a round-robin reuse approach: when no free VMIDs remain, we start a new generation
and begin reusing old VMIDs.

The only remaining design question is whether we want RISC-V to follow a global
VMID allocation policy (i.e., one VMID per domain, shared across all of its vCPUs),
or adopt a policy similar to x86 with per-CPU VMID allocation (each vCPU gets its
own VMID, local to the CPU it's running on).
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Besides what Jürgen has said, what would this mean if you have 16 VMIDs and a 17th
domain appears? You can't "take away" the VMID from any domain, unless you fully
suspended it first (that is, all of its vCPU-s).</pre>
    </blockquote>
    <pre>In this case, use of VMID could be dropped and just flush the guest TLB before entering
domain. Not efficient, but still an option.

</pre>
    <blockquote type="cite"
      cite="mid:b521ef1a-03fb-4225-8d4d-5cffa65c0e93@suse.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">Each policy has its own trade-offs. But in the case where the number of available
VMIDs is small (i.e., low VMIDLEN), a global allocation policy may be more suitable,
as it requires fewer VMIDs overall.

So my main question was:
What are the advantages of per-pCPU VMID allocation in scenarios with limited VMID
space, and why did x86 choose that design?

 From what I can tell, the benefits of per-pCPU VMID allocation include:
- Minimized inter-CPU TLB flushes — since VMIDs are local, TLB entries don’t need
   to be invalidated on other CPUs when reused.
- Better scalability — this approach works better on systems with a large number
   of CPUs.
- Frequent VM switches don’t require global TLB flushes — reducing the overhead
   of context switching.
However, the downside is that this model consumes more VMIDs. For example,
if a single domain runs on 4 vCPUs across 4 CPUs, it will consume 4 VMIDs instead
of just one.
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
I don't understand this, nor why it's a downside. Looking at a domain as a whole
simply doesn't make sense in this model. Or if you do, then you need to consider
the system-wide number of VMIDs you have available:
(1 &lt;&lt; VMIDLEN) * num_online_cpus(). That is, in your calculation a domain with
4 vCPU-s may indeed use up to 4 VMIDs at a time, but out of a pool at least 4
times the size of that of an individual pCPU.</pre>
    </blockquote>
    <pre>Good point, I thought about that too.

~ Oleksii
</pre>
  </body>
</html>

--------------N0HV02j0fnyagYQmqyOgJ6V9--

