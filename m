Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 711AAA9EE31
	for <lists+xen-devel@lfdr.de>; Mon, 28 Apr 2025 12:44:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.970455.1359143 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u9Lxo-0002rp-W5; Mon, 28 Apr 2025 10:43:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 970455.1359143; Mon, 28 Apr 2025 10:43:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u9Lxo-0002pH-TM; Mon, 28 Apr 2025 10:43:52 +0000
Received: by outflank-mailman (input) for mailman id 970455;
 Mon, 28 Apr 2025 10:43:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=eVdf=XO=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1u9Lxn-0002p7-LV
 for xen-devel@lists.xenproject.org; Mon, 28 Apr 2025 10:43:51 +0000
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [2a00:1450:4864:20::62d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id abc99375-241d-11f0-9eb4-5ba50f476ded;
 Mon, 28 Apr 2025 12:43:50 +0200 (CEST)
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-ac339f53df9so885044066b.1
 for <xen-devel@lists.xenproject.org>; Mon, 28 Apr 2025 03:43:50 -0700 (PDT)
Received: from [192.168.1.5] (user-109-243-64-225.play-internet.pl.
 [109.243.64.225]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ace6ed701eesm612694366b.140.2025.04.28.03.43.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Apr 2025 03:43:48 -0700 (PDT)
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
X-Inumbo-ID: abc99375-241d-11f0-9eb4-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745837030; x=1746441830; darn=lists.xenproject.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dKYHVlsYAn/u6PbxnH1eTgKymTUjTDlYUpThEPg7TZI=;
        b=EyQQ8LYu4qOJe0HRe4aVIDK52zSSU0x2vaA45CvleOV2pjIEr4k8baVZ1ocGyYcXzU
         UpaFRPQS2fGYGY0qc326FubcBeVoi9VIrCbHlDrZkQB4wwtJTD31h/uvU7Nce1Zu2wlH
         xl+rU0nO2W0iFndSOk7/uOvXHUKGALTopBw7tcCAg7GtnnnPdpYANFewRJwg23l2Qppm
         /fxUAIud+8ynjsPhUR00+r0N2q601lOdZUWw2uwb0SmZ+FNrzv+HybV3v3B/uj/yReIa
         HvAAecM6KGvkvLajDdL5sorSmWMPFFtIpwxIS8gqzlC3jKTKP2x368u8bXPG0IMLLhGs
         IwUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745837030; x=1746441830;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=dKYHVlsYAn/u6PbxnH1eTgKymTUjTDlYUpThEPg7TZI=;
        b=AwmuEx3zh72D0IP3sLFsw2OvNok+rVGYC/HAp7Zj8P/haVikSpZbzEnDQ7VtICzjOl
         ivI5plZKOkBx5oLNzy1OqfApK2e1YRrScIXbD9WRWDu8p2kW2vDqo6PZgsXsUUxChHpH
         WDioBbPQSlwXl5g7xvBOFG+jZHy4w9JsbMYO0TU8elGhb5lJO1Qr5Zpapl/iZPDM5rha
         7dDugKiyGUWfHfM8qLLv0tJjVyChMCAIrrzj3gOqdZF6HJDlGJyVGQxNB5KiqmoQe5rW
         rXGtArJdedcWEDdgXh0CWPm3gi8ij8pZSD8Dt8IzMBpj/Q4pfNqXNQ/AXwmU8b+tF+YS
         O8Sw==
X-Forwarded-Encrypted: i=1; AJvYcCVkqlSbg39Hd3KeEsp6xquvyP2Pxgu3jDcmmwCKcwZHgyZSAlSQxHIhs1qy05kUMNW63bhDZIZpH8k=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxsfYgmLWCigOJWsiT8suXQT+bWwajQX9g2TMCAHj1dcmZbetSU
	AHrT35/FS9tZ5S74eaduX1MpPmBVzKC6/8Nxavqp7yglto/NI4x5
X-Gm-Gg: ASbGncvcaq6bCqH2OQ+SeX7nZdXU5e6Jw9fv5PlABas+wf3r1YrchsgUgOMOBtbzQDg
	qZTwGxgkuUr6l/KXegklR0g/EjSDo3kZrsV++Zx04THFr0Xo5EIVx1hmgsiOShZxelKN7XW2aU5
	bkYAHhHHEsV6oqmkCwRL1wnLYKHn/Bc/pTp2cJFtVDnuf+Tc6NwL7P8lBmwNsYkVB4Kq/qX7saA
	6s4BT4G3zgPIjmRAAsPMLgU4Uy4rmDKO1shoUKsGorhAdDiBCLaWi0tN5L0J2woiX98xLYQw62m
	9uIo9qXiv3XuYi7IVQ2QnUuw4eHeKYJEuNFOE36LlT61p39d8KEwBn3aVuEjHVP1M/dIyq4wtX+
	pXyFJD6QYhvHQz6tf
X-Google-Smtp-Source: AGHT+IFdmSMsvWaGqIZWr3IH8leNia5KI+pwv58bsgcQETH8KRBI5DglKBbuK/TIPztrMgqGp+H6mQ==
X-Received: by 2002:a17:907:86ac:b0:abf:19ac:771 with SMTP id a640c23a62f3a-ace848c03c8mr748130566b.2.1745837029392;
        Mon, 28 Apr 2025 03:43:49 -0700 (PDT)
Content-Type: multipart/alternative;
 boundary="------------0vhNBwspiOB0Ac0cD0ngl8cE"
Message-ID: <e5884aac-1b55-44c8-aa51-c275f6eed828@gmail.com>
Date: Mon, 28 Apr 2025 12:43:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 06/14] xen/riscv: riscv_of_processor_hartid()
 implementation
To: Jan Beulich <jbeulich@suse.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1744126720.git.oleksii.kurochko@gmail.com>
 <ab592d50ad161ffed3950bdf58ade49ae90a3c0e.1744126720.git.oleksii.kurochko@gmail.com>
 <65f5952a-8d2a-499c-bd66-53e9e2fbfa9c@suse.com>
 <d10323b7-d95d-4b96-9bf1-7ae8edda153e@gmail.com>
 <859d0c87-dc90-44c2-ab30-5164eec0705c@suse.com>
 <83fc1566-ad4f-489d-a432-01ec638cbc21@gmail.com>
 <39f0a475-6eea-4c08-abb1-f3de25c5a549@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <39f0a475-6eea-4c08-abb1-f3de25c5a549@suse.com>

This is a multi-part message in MIME format.
--------------0vhNBwspiOB0Ac0cD0ngl8cE
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 4/28/25 8:31 AM, Jan Beulich wrote:
> On 25.04.2025 19:07, Oleksii Kurochko wrote:
>> On 4/15/25 3:45 PM, Jan Beulich wrote:
>>> On 15.04.2025 15:39, Oleksii Kurochko wrote:
>>>> On 4/10/25 5:53 PM, Jan Beulich wrote:
>>>>> On 08.04.2025 17:57, Oleksii Kurochko wrote:
>>>>>> +{
>>>>>> +    const __be32 *cell;
>>>>>> +    int ac;
>>>>>> +    uint32_t len;
>>>>>> +
>>>>>> +    ac = dt_n_addr_cells(cpun);
>>>>>> +    cell = dt_get_property(cpun, "reg", &len);
>>>>>> +    if ( !cell || !ac || ((sizeof(*cell) * ac * (thread + 1)) > len) )
>>>>>> +        return ~0ULL;
>>>>> I'm sorry for my lack of DT knowledge, but what's "thread" representing here?
>>>>> You only pass in 0 below, so it's unclear whether it's what one might expect
>>>>> (the thread number on a multi-threaded core).
>>>> Based on the DT specification alone, the|`reg`| value could refer to either a CPU or a thread ID:
>>>> ```
>>>> The value of reg is a <prop-encoded-array> that defines a unique CPU/thread id for
>>>> the CPU/threads represented by the CPU node. If a CPU supports more than one thread
>>>> (i.e. multiple streams of execution) the reg prop-erty is an array with 1 element
>>>> per thread.
>>>> ```
>>>>
>>>> My understanding is that the term/thread/ was used in the Linux kernel to cover both
>>>> cases.
>>>> When SMT isn't supported, the CPU can be considered to have a single thread.
>>>> For example, RISC-V uses the term/hardware thread/ to describe a hart (i.e., a CPU).
> Note the terminology ("CPU") you used here.
>
>>>> Interestingly, the Linux kernel always uses|thread = 0|.
>>>>
>>>> We could potentially drop this ambiguity and introduce an|ASSERT()| to check that
>>>> the|`reg`| property contains only one entry, representing the HART (CPU) ID:
>>>> ```
>>>>      Software can determine the number of threads by dividing the size of reg by the parent
>>>>      node’s #address-cells. If `|reg`| has more than one entry, it would simply SMT support
>>>>      is required.
>>>> ```
>>>>
>>>> Does that approach make sense, or should we stick with the current implementation?
>>> If extra enabling is required to make multi-thread CPUs work, then panic()ing
>>> (not so much ASSERT()ing) may make sense, for the time being. Better would be
>>> if we could use all threads in a system right away.
>> Actually, this function is ready to be used for multi-thread CPUs. A caller can request hardware id
>> by passing `thread` argument (`thread` -> the local thread number to get the hardware ID for).
>> So by calling:
>>    dt_get_cpu_hwid(cpu0, 0) -> it will return hardware id of thread 0 of cpu0
>>    dt_get_cpu_hwid(cpu0, 1) -> it will return hardware id of thread 1 of cpu0
>>    ...
>>
>> In our case we assume that SMP isn't supported so that is why it is used only dt_get_cpu_hwid(cpu0, 0).
>>
>> If one day, SMP will be enabled then it will be needed to change a callers of dt_get_cpu_hwid().
> I assume you meant SMT in both places you wrote SMP?

Yes, it should be SMT.

>   But my main point here is:
> If enumeration gives you "thread <N> of core <M>" (using x86 terminology), you
> need to be quite careful with what you call "CPU". Things need to be entirely
> unambiguous, taking into account what internally in (common code) Xen we call a
> "CPU". You certainly may call "CPU" what is a collection of threads / harts,
> but you then need to clarify this in a prominent comment somewhere, and you
> need to be entirely consistent throughout the RISC-V sub-tree.

╭────────────────────╮
│        CPU          │  ← 1 physical processor (chip)
│ ┌───────┬─────────┐ │
│ │ Core 0│ Core 1  │ │  ← 2 cores (for example)
│ │ ┌──┬──┐ ┌──┬──┐ │ │
│ │Thr0 Thr1 Thr0 Thr1│ ← 2 threads on each core (SMT)
│ └───────┴─────────┘ │
╰────────────────────╯
I want to double check what Xen call a "CPU". I thought that Xen uses word
CPU to describe a core, right?

What you wrote above "thread <N> of core <M> (using x86 terminology)" is also correlated
with RISC-V terminology:
   A component is termed a core if it contains an independent instruction fetch unit.
   A RISC-V-compatible core might support multiple RISC-V-compatible hardware threads,
   or harts, through multithreading

I checked RISC-V's DTS binding and it seems it is a little bit contradictory to DTS spec,
where it is mentioned that reg property is used to describe how many threads a cpu  has
when SMP is used, but in RISC-V's dts binding they are describing a hardware execution
context:
   This document uses some terminology common to the RISC-V community
   that is not widely used, the definitions of which are listed here:

   hart: A hardware execution context, which contains all the state
   mandated by the RISC-V ISA: a PC and some registers.  This
   terminology is designed to disambiguate software's view of execution
   contexts from any particular microarchitectural implementation
   strategy.  For example, an Intel laptop containing one socket with
   two cores, each of which has two hyperthreads, could be described as
   having four harts.

So in RISC-V's DTS binding they are describing only hardware threads what makes things more
confusing in terms what kind terminology from Xen point of view should be used.

And based on what is written in RISC-V's dts binding:
  For example, an Intel laptop containing one socket with
  two cores, each of which has two hyperthreads, could be described as
  having four harts.
It would be more logical to drop 'thread' argument of riscv_of_get_cpu_hwid(const struct dt_device_node *cpun).
And then the question is what to do with the name of variable cpun? As it could be still confusing. Or, at least,
I can add the comment that CPUn in terms of RISC-V means hart (hardware thread). And then will it be needed to
add such comment for each usage of word "CPU"?

~ Oleksii



--------------0vhNBwspiOB0Ac0cD0ngl8cE
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
    <div class="moz-cite-prefix">On 4/28/25 8:31 AM, Jan Beulich wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:39f0a475-6eea-4c08-abb1-f3de25c5a549@suse.com">
      <pre wrap="" class="moz-quote-pre">On 25.04.2025 19:07, Oleksii Kurochko wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">
On 4/15/25 3:45 PM, Jan Beulich wrote:
</pre>
        <blockquote type="cite">
          <pre wrap="" class="moz-quote-pre">On 15.04.2025 15:39, Oleksii Kurochko wrote:
</pre>
          <blockquote type="cite">
            <pre wrap="" class="moz-quote-pre">On 4/10/25 5:53 PM, Jan Beulich wrote:
</pre>
            <blockquote type="cite">
              <pre wrap="" class="moz-quote-pre">On 08.04.2025 17:57, Oleksii Kurochko wrote:
</pre>
              <blockquote type="cite">
                <pre wrap="" class="moz-quote-pre">+{
+    const __be32 *cell;
+    int ac;
+    uint32_t len;
+
+    ac = dt_n_addr_cells(cpun);
+    cell = dt_get_property(cpun, "reg", &amp;len);
+    if ( !cell || !ac || ((sizeof(*cell) * ac * (thread + 1)) &gt; len) )
+        return ~0ULL;
</pre>
              </blockquote>
              <pre wrap="" class="moz-quote-pre">I'm sorry for my lack of DT knowledge, but what's "thread" representing here?
You only pass in 0 below, so it's unclear whether it's what one might expect
(the thread number on a multi-threaded core).
</pre>
            </blockquote>
            <pre wrap="" class="moz-quote-pre">Based on the DT specification alone, the|`reg`| value could refer to either a CPU or a thread ID:
```
The value of reg is a &lt;prop-encoded-array&gt; that defines a unique CPU/thread id for
the CPU/threads represented by the CPU node. If a CPU supports more than one thread
(i.e. multiple streams of execution) the reg prop-erty is an array with 1 element
per thread.
```

My understanding is that the term/thread/ was used in the Linux kernel to cover both
cases.
When SMT isn't supported, the CPU can be considered to have a single thread.
For example, RISC-V uses the term/hardware thread/ to describe a hart (i.e., a CPU).
</pre>
          </blockquote>
        </blockquote>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Note the terminology ("CPU") you used here.

</pre>
      <blockquote type="cite">
        <blockquote type="cite">
          <blockquote type="cite">
            <pre wrap="" class="moz-quote-pre">Interestingly, the Linux kernel always uses|thread = 0|.

We could potentially drop this ambiguity and introduce an|ASSERT()| to check that
the|`reg`| property contains only one entry, representing the HART (CPU) ID:
```
    Software can determine the number of threads by dividing the size of reg by the parent
    node’s #address-cells. If `|reg`| has more than one entry, it would simply SMT support
    is required.
```

Does that approach make sense, or should we stick with the current implementation?
</pre>
          </blockquote>
          <pre wrap="" class="moz-quote-pre">If extra enabling is required to make multi-thread CPUs work, then panic()ing
(not so much ASSERT()ing) may make sense, for the time being. Better would be
if we could use all threads in a system right away.
</pre>
        </blockquote>
        <pre wrap="" class="moz-quote-pre">
Actually, this function is ready to be used for multi-thread CPUs. A caller can request hardware id
by passing `thread` argument (`thread` -&gt; the local thread number to get the hardware ID for).
So by calling:
  dt_get_cpu_hwid(cpu0, 0) -&gt; it will return hardware id of thread 0 of cpu0
  dt_get_cpu_hwid(cpu0, 1) -&gt; it will return hardware id of thread 1 of cpu0
  ...

In our case we assume that SMP isn't supported so that is why it is used only dt_get_cpu_hwid(cpu0, 0).

If one day, SMP will be enabled then it will be needed to change a callers of dt_get_cpu_hwid().
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
I assume you meant SMT in both places you wrote SMP?</pre>
    </blockquote>
    <pre>Yes, it should be SMT.
</pre>
    <blockquote type="cite"
      cite="mid:39f0a475-6eea-4c08-abb1-f3de25c5a549@suse.com">
      <pre wrap="" class="moz-quote-pre"> But my main point here is:
If enumeration gives you "thread &lt;N&gt; of core &lt;M&gt;" (using x86 terminology), you
need to be quite careful with what you call "CPU". Things need to be entirely
unambiguous, taking into account what internally in (common code) Xen we call a
"CPU". You certainly may call "CPU" what is a collection of threads / harts,
but you then need to clarify this in a prominent comment somewhere, and you
need to be entirely consistent throughout the RISC-V sub-tree.</pre>
    </blockquote>
    <pre>╭────────────────────╮
│        CPU          │  ← 1 physical processor (chip)
│ ┌───────┬─────────┐ │
│ │ Core 0│ Core 1  │ │  ← 2 cores (for example)
│ │ ┌──┬──┐ ┌──┬──┐ │ │
│ │Thr0 Thr1 Thr0 Thr1│ ← 2 threads on each core (SMT)
│ └───────┴─────────┘ │
╰────────────────────╯
I want to double check what Xen call a "CPU". I thought that Xen uses word
CPU to describe a core, right?

What you wrote above "thread &lt;N&gt; of core &lt;M&gt; (using x86 terminology)" is also correlated
with RISC-V terminology:
  A component is termed a core if it contains an independent instruction fetch unit.
  A RISC-V-compatible core might support multiple RISC-V-compatible hardware threads,
  or harts, through multithreading

I checked RISC-V's DTS binding and it seems it is a little bit contradictory to DTS spec,
where it is mentioned that reg property is used to describe how many threads a cpu  has
when SMP is used, but in RISC-V's dts binding they are describing a hardware execution
context:
  This document uses some terminology common to the RISC-V community
  that is not widely used, the definitions of which are listed here:

  hart: A hardware execution context, which contains all the state
  mandated by the RISC-V ISA: a PC and some registers.  This
  terminology is designed to disambiguate software's view of execution
  contexts from any particular microarchitectural implementation
  strategy.  For example, an Intel laptop containing one socket with
  two cores, each of which has two hyperthreads, could be described as
  having four harts.

So in RISC-V's DTS binding they are describing only hardware threads what makes things more
confusing in terms what kind terminology from Xen point of view should be used.

And based on what is written in RISC-V's dts binding:
 For example, an Intel laptop containing one socket with
 two cores, each of which has two hyperthreads, could be described as
 having four harts.
It would be more logical to drop 'thread' argument of riscv_of_get_cpu_hwid(const struct dt_device_node *cpun).
And then the question is what to do with the name of variable cpun? As it could be still confusing. Or, at least,
I can add the comment that CPUn in terms of RISC-V means hart (hardware thread). And then will it be needed to
add such comment for each usage of word "CPU"?
</pre>
    <pre>
~ Oleksii



</pre>
  </body>
</html>

--------------0vhNBwspiOB0Ac0cD0ngl8cE--

