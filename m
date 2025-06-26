Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 01D4DAE9CA6
	for <lists+xen-devel@lfdr.de>; Thu, 26 Jun 2025 13:35:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1026172.1401407 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uUksd-00037p-MT; Thu, 26 Jun 2025 11:34:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1026172.1401407; Thu, 26 Jun 2025 11:34:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uUksd-00035Z-JI; Thu, 26 Jun 2025 11:34:59 +0000
Received: by outflank-mailman (input) for mailman id 1026172;
 Thu, 26 Jun 2025 11:34:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/Scu=ZJ=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1uUksb-00035T-O2
 for xen-devel@lists.xenproject.org; Thu, 26 Jun 2025 11:34:57 +0000
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [2a00:1450:4864:20::52d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 95670877-5281-11f0-a30f-13f23c93f187;
 Thu, 26 Jun 2025 13:34:56 +0200 (CEST)
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-60780d74c85so1302513a12.2
 for <xen-devel@lists.xenproject.org>; Thu, 26 Jun 2025 04:34:56 -0700 (PDT)
Received: from [192.168.1.5] (user-109-243-64-38.play-internet.pl.
 [109.243.64.38]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-60c2f4812a6sm3809620a12.60.2025.06.26.04.34.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 26 Jun 2025 04:34:54 -0700 (PDT)
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
X-Inumbo-ID: 95670877-5281-11f0-a30f-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750937695; x=1751542495; darn=lists.xenproject.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c43Gu5XtzSkIfMKI2APDEJf2hd+ypM6IFOU4O6EScPA=;
        b=Me7Khi7nYCZ7i8uDM54B8nf0r5txP50F07RldWABsKeSE+AKHTMYMv+Zn11XIbnZkk
         GzM3sJD5APm4TSySgR6g6oyxMs4hSASWEtFvAii1p1downFvUcLwpQOoXFXeGikx6jIu
         pkDCDT0wf6PonLBW+INRotNXfJQFzmj0aZhJxkn5zT8A+qHqkthT42oPxc/0+y1pQ7gh
         J8eevcHDNw3o/6TX0yc/Bj8Hha0V40ZB9VGkdbYSdl/ieSIxFNnWNERIx5fppXVoeT80
         +ZqjRimR//fo3h2Kog0FuAg8zhASq/oQe/DObmbuWDTl8F1iNDL8YOdjgk7tcQbC/Dxq
         3rzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750937695; x=1751542495;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=c43Gu5XtzSkIfMKI2APDEJf2hd+ypM6IFOU4O6EScPA=;
        b=rzkp2m14R/Nl7vApZKAgrsg+66Mad/N0O78AaE8SDXNonlzuaanjUF1h7YnMR39g6V
         obmAgcd40nY231/Ndp7zfNss39FEmBJF3bEk24ZoyQX0Py0KOq6NQvNMgacauifqmVgb
         vfBG+XwDE7bNV0mTzvSRcPIk6h1o3jjbrZP4x0enbhLxjf9oJ2PgdA9s+EBHPlyw6vkN
         7aW7ZRQWs02iKFb/OxEl045rDl1F0O04MZMN/+Cp0C4YODQh25HhUbprK/PN416BgCOm
         EwQ/4iCThnPoudFdEK5OhyxbnISE8/qKKRKP/I6UflWeibIyubkGixpOo95qW6kktw8X
         rfsg==
X-Forwarded-Encrypted: i=1; AJvYcCXh7cVSp3NmT17mn/W56Z1APOQG5LabBKo1ImJrmTFej34LGsDve+NY2nigiOOoR8v0kzJp4DqwURY=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy5coDiUoDjYkGj2EIyuDb/Bn5uAw/AFVLkGDTJWnou+EZj/eEb
	xK66u5Dyx3s0GDU5M2aJd3wDhphDAHFy4asqJ++cvga2zXMsavt5pPw3
X-Gm-Gg: ASbGncvSrM6cGWvcYh8NgN4uBQQKZXQdL0nvyvcLxX7o+Lf+pRYWF1mIkdhLWb+/dYF
	FPVgDWt4hxDtoeVF7XJ26L3G3WnoKM1hgk7iHQfHYtjfVh+zFKOoaNmwe3FcCg6VrV09vP4T+Hw
	ceJVRcUEiE0NVKaC0e75tlK0KAXkelA0cTF8B47LRqOEoXLNtyOf6h6CuLoU/9eOg8lMDvZf1yG
	GeGRBKid4gDhEweC6s2MLT9otmli5kg51gRzs96duRv9eX5A4Hno1DCVy+u3gWFd+am9iKBED50
	RlJbk0i7muqLUTXK2MufJ2XiKMKAIXVjSVTOk1JXfybTXSJdmMyPAcIgCza2b4ZtdjLwV32znht
	eRC25I17spQfMCX6AB0sYbHd6rK66Cum+cn8=
X-Google-Smtp-Source: AGHT+IFY2KYhNC3wd+6m1ev6CZTO+3Azx9n8u/4uCB9ax2OPBocdwr6Vj+c9OJqP7ZJRxm176o87gA==
X-Received: by 2002:a05:6402:5cd:b0:60c:3a86:e117 with SMTP id 4fb4d7f45d1cf-60c4df1890emr5164619a12.34.1750937695112;
        Thu, 26 Jun 2025 04:34:55 -0700 (PDT)
Content-Type: multipart/alternative;
 boundary="------------Mw32BkD2nR21rsGAgsMukTKb"
Message-ID: <264db0b0-43bf-4829-a5cc-ca696601349c@gmail.com>
Date: Thu, 26 Jun 2025 13:34:52 +0200
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
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <f4a20826-0949-4bf0-a8e8-eecd1428f739@suse.com>

This is a multi-part message in MIME format.
--------------Mw32BkD2nR21rsGAgsMukTKb
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 6/26/25 12:41 PM, Jan Beulich wrote:
> On 26.06.2025 12:05, Oleksii Kurochko wrote:
>> On 6/24/25 4:01 PM, Jan Beulich wrote:
>>> On 24.06.2025 15:47, Oleksii Kurochko wrote:
>>>> On 6/24/25 12:44 PM, Jan Beulich wrote:
>>>>> On 24.06.2025 11:46, Oleksii Kurochko wrote:
>>>>>> On 6/18/25 5:46 PM, Jan Beulich wrote:
>>>>>>> On 10.06.2025 15:05, Oleksii Kurochko wrote:
>>>>>>>> --- /dev/null
>>>>>>>> +++ b/xen/arch/riscv/p2m.c
>>>>>>>> @@ -0,0 +1,115 @@
>>>>>>>> +#include <xen/bitops.h>
>>>>>>>> +#include <xen/lib.h>
>>>>>>>> +#include <xen/sched.h>
>>>>>>>> +#include <xen/spinlock.h>
>>>>>>>> +#include <xen/xvmalloc.h>
>>>>>>>> +
>>>>>>>> +#include <asm/p2m.h>
>>>>>>>> +#include <asm/sbi.h>
>>>>>>>> +
>>>>>>>> +static spinlock_t vmid_alloc_lock = SPIN_LOCK_UNLOCKED;
>>>>>>>> +
>>>>>>>> +/*
>>>>>>>> + * hgatp's VMID field is 7 or 14 bits. RV64 may support 14-bit VMID.
>>>>>>>> + * Using a bitmap here limits us to 127 (2^7 - 1) or 16383 (2^14 - 1)
>>>>>>>> + * concurrent domains.
>>>>>>> Which is pretty limiting especially in the RV32 case. Hence why we don't
>>>>>>> assign a permanent ID to VMs on x86, but rather manage IDs per-CPU (note:
>>>>>>> not per-vCPU).
>>>>>> Good point.
>>>>>>
>>>>>> I don't believe anyone will use RV32.
>>>>>> For RV64, the available ID space seems sufficiently large.
>>>>>>
>>>>>> However, if it turns out that the value isn't large enough even for RV64,
>>>>>> I can rework it to manage IDs per physical CPU.
>>>>>> Wouldn't that approach result in more TLB entries being flushed compared
>>>>>> to per-vCPU allocation, potentially leading to slightly worse performance?
>>>>> Depends on the condition for when to flush. Of course performance is
>>>>> unavoidably going to suffer if you have only very few VMIDs to use.
>>>>> Nevertheless, as indicated before, the model used on x86 may be a
>>>>> candidate to use here, too. See hvm_asid_handle_vmenter() for the
>>>>> core (and vendor-independent) part of it.
>>>> IIUC, so basically it is just a round-robin and when VMIDs are ran out
>>>> then just do full guest TLB flush and start to re-use VMIDs from the start.
>>>> It makes sense to me, I'll implement something similar. (as I'm not really
>>>> sure that we needdata->core_asid_generation, probably, I will understand it better when
>>>> start to implement it)
>>> Well. The fewer VMID bits you have the more quickly you will need a new
>>> generation. And keep track of the generation you're at you also need to
>>> track the present number somewhere.
>>>
>>>>>> What about then to allocate VMID per-domain?
>>>>> That's what you're doing right now, isn't it? And that gets problematic when
>>>>> you have only very few bits in hgatp.VMID, as mentioned below.
>>>> Right, I just phrased my question poorly—sorry about that.
>>>>
>>>> What I meant to ask is: does the approach described above actually depend on whether
>>>> VMIDs are allocated per-domain or per-pCPU? It seems that the main advantage of
>>>> allocating VMIDs per-pCPU is potentially reducing the number of TLB flushes,
>>>> since it's more likely that a platform will have more than|VMID_MAX| domains than
>>>> |VMID_MAX| physical CPUs—am I right?
>>> Seeing that there can be systems with hundreds or even thousands of CPUs,
>>> I don't think I can agree here. Plus per-pCPU allocation would similarly
>>> get you in trouble when you have only very few VMID bits.
>> But not so fast as in case of per-domain allocation, right?
>>
>> I mean that if we have only 4 bits, then in case of per-domain allocation we will
>> need to do TLB flush + VMID re-assigning when we have more then 16 domains.
>>
>> But in case of per-pCPU allocation we could run 16 domains on 1 pCPU and at the same
>> time in multiprocessor systems we have more pCPUs, which will allow us to run more
>> domains and avoid TLB flushes.
>> On other hand, it is needed to consider that it's unlikely that a domain will have
>> only one vCPU. And it is likely that amount of vCPUs will be bigger then an amount
>> of domains, so to have a round-robin approach (as x86) without permanent ID allocation
>> for each domain will work better then per-pCPU allocation.
> Here you (appear to) say one thing, ...
>
>> In other words, I'm not 100% sure that I get a point why x86 chose per-pCPU allocation
>> instead of per-domain allocation with having the same VMID for all vCPUs of domains.
> ... and then here the opposite. Overall I'm in severe trouble understanding this
> reply of yours as a whole, so I fear I can't really respond to it (or even just
> parts thereof).

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

Each policy has its own trade-offs. But in the case where the number of available
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

~ Oleksii

--------------Mw32BkD2nR21rsGAgsMukTKb
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
    <div class="moz-cite-prefix">On 6/26/25 12:41 PM, Jan Beulich wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:f4a20826-0949-4bf0-a8e8-eecd1428f739@suse.com">
      <pre wrap="" class="moz-quote-pre">On 26.06.2025 12:05, Oleksii Kurochko wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">
On 6/24/25 4:01 PM, Jan Beulich wrote:
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
        <pre wrap="" class="moz-quote-pre">
But not so fast as in case of per-domain allocation, right?

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
      <pre wrap="" class="moz-quote-pre">
Here you (appear to) say one thing, ...

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">In other words, I'm not 100% sure that I get a point why x86 chose per-pCPU allocation
instead of per-domain allocation with having the same VMID for all vCPUs of domains.
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
... and then here the opposite. Overall I'm in severe trouble understanding this
reply of yours as a whole, so I fear I can't really respond to it (or even just
parts thereof).</pre>
    </blockquote>
    <pre>IIUC, x86 allocates VMIDs per physical CPU (pCPU) "dynamically" — these are just
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

Each policy has its own trade-offs. But in the case where the number of available
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

~ Oleksii
</pre>
  </body>
</html>

--------------Mw32BkD2nR21rsGAgsMukTKb--

