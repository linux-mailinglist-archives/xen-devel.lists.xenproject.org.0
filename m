Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 02E50AE9AC4
	for <lists+xen-devel@lfdr.de>; Thu, 26 Jun 2025 12:06:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1026089.1401363 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uUjUY-0007Vo-Q8; Thu, 26 Jun 2025 10:06:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1026089.1401363; Thu, 26 Jun 2025 10:06:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uUjUY-0007St-ML; Thu, 26 Jun 2025 10:06:02 +0000
Received: by outflank-mailman (input) for mailman id 1026089;
 Thu, 26 Jun 2025 10:06:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/Scu=ZJ=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1uUjUW-0007Sn-RJ
 for xen-devel@lists.xenproject.org; Thu, 26 Jun 2025 10:06:01 +0000
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [2a00:1450:4864:20::531])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 28af76be-5275-11f0-a30f-13f23c93f187;
 Thu, 26 Jun 2025 12:05:59 +0200 (CEST)
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-604bff84741so1440777a12.2
 for <xen-devel@lists.xenproject.org>; Thu, 26 Jun 2025 03:05:59 -0700 (PDT)
Received: from [192.168.1.5] (user-109-243-64-38.play-internet.pl.
 [109.243.64.38]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ae0ab44620csm451043966b.163.2025.06.26.03.05.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 26 Jun 2025 03:05:58 -0700 (PDT)
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
X-Inumbo-ID: 28af76be-5275-11f0-a30f-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750932359; x=1751537159; darn=lists.xenproject.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+Lcbo0ciVhY04bYQvgNmQdQVatcke9QdNM6d3z3UZSU=;
        b=AU+k1RqrpSxUDTg6CLLcXjEJ2LrwcpaujgZbklAKFLFU+cjd0b0LmKFYI4ys6bnluo
         aKIwoLw2x4IXMpCnVI8gdzdKJeIeYJEvbyeDV9OhbX8RifVfOsszitfeY25TOxN0c+CX
         nXORUaF8Y8Qt5WpcxgifoK6t07sHGV8SpKe5EJd4fnitGKMsWGZsD/JTVDzMdsjXa8P2
         k6WsyYdZ6IzJZ2APuvi+jZk1vhR+D/Bxeb2PDwEFvkE02V2bRNHZquUSLOD1yLU/YDx4
         u0fQTR1lfzfTbBS/F+Ir51c6Axu3PD5Xjy/P/3OQtGwWSGzz3pE2hR1Ph/SdShWNK31A
         R4yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750932359; x=1751537159;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+Lcbo0ciVhY04bYQvgNmQdQVatcke9QdNM6d3z3UZSU=;
        b=quy7G40R/eIh1dtaawq2544sp2NbrtcpZVlcgqcvsMOZ5MPz1+G70+xoOosGxE+hU2
         /rda69z/DBT/5DNPp/jAgbvtJihznQjz7yowL0J+cKRD2FjD1GGOIXmYjQBFqWFhMtBV
         UWNxRVBU3hFSa7xsGRb4fDQBZbkeDYcnyctmEOzPENm+C/MSVf6gVB1XhaGhDJ/PlTtj
         +uIvGdR3Bz4Qr59CeDMgRhzYYCDZ76zgXTkW6FU7UHV2xfyI6H3qgfCewOe+1D5MW5CP
         Y5w8qh65Sbfkjz1CdCyziF0Appmk0U2wo8r+saPDZSPACTj7JT0wcBq38wyfjI2DeG7N
         Pv6A==
X-Forwarded-Encrypted: i=1; AJvYcCULACTJBj2+b3TTuUnA9ZHJD58xm5Fm1921sxpuBFJWkgrvo8u4xlNE40vz5Y2JS/XXC7SFbwDCGQA=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyDiUglmzwFplOcUppwHxFFkFnuHDVFJTBQh4rwqOKFugWWWaeF
	XK+Qg3wEOuzvhp1zqEsjTPNW506kNugob+C+MqcHBAVHLY/VGAh0o9BQ
X-Gm-Gg: ASbGncsrJFr0IjMD3Y9Bln1KCAncue8P62v9HnrDHlHSSvbKvRKKoC/JLeII3fkp6q3
	UTo1y8kXA1HTLnNkcCysJhYkZx/wWguRRiAGAaQcX+zxeIClAqn4tPhP71TqNBv+IMmz3TFWdAV
	xgttMVNpaTOyS47249/F6oeiCUGa8g0qVt1yee3ZwPqdawXeaLX68Bw06WQb+DqB9M5MpAsIUYU
	QESL1sk/ySJLQkgwjRzvrjoVd17h2If01lzRIphGcuglfknWY6euIDLiXlvrMUMVhNA1SyEfudr
	/Utpgi2GpEpudpqiLd0cW6EaLNk+74tAYi/1JyxhjnmfqvgWYGfO8z1Vyyu3BTRnPt3kaFpP8xF
	YxLPFfmrxkALwc4u5r7a3LFCl0HBO/0Bte5g8g1jqvqlEDQ==
X-Google-Smtp-Source: AGHT+IGe9SwppheZUjam/H8AswI2L0vhLXctkS2UfNnH08NIo77sgRy0d9XZOZ5bzb21Kk+nahdvew==
X-Received: by 2002:a17:907:72c6:b0:ae0:d332:f637 with SMTP id a640c23a62f3a-ae0d332fee5mr308556766b.31.1750932358577;
        Thu, 26 Jun 2025 03:05:58 -0700 (PDT)
Content-Type: multipart/alternative;
 boundary="------------VDEQ7fGcXo4njzSsfmj00UBY"
Message-ID: <1a570c32-e207-47f5-9702-a752246328a9@gmail.com>
Date: Thu, 26 Jun 2025 12:05:57 +0200
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
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <f5c14ffa-6314-4534-a83e-4024b379755c@suse.com>

This is a multi-part message in MIME format.
--------------VDEQ7fGcXo4njzSsfmj00UBY
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 6/24/25 4:01 PM, Jan Beulich wrote:
> On 24.06.2025 15:47, Oleksii Kurochko wrote:
>> On 6/24/25 12:44 PM, Jan Beulich wrote:
>>> On 24.06.2025 11:46, Oleksii Kurochko wrote:
>>>> On 6/18/25 5:46 PM, Jan Beulich wrote:
>>>>> On 10.06.2025 15:05, Oleksii Kurochko wrote:
>>>>>> --- /dev/null
>>>>>> +++ b/xen/arch/riscv/p2m.c
>>>>>> @@ -0,0 +1,115 @@
>>>>>> +#include <xen/bitops.h>
>>>>>> +#include <xen/lib.h>
>>>>>> +#include <xen/sched.h>
>>>>>> +#include <xen/spinlock.h>
>>>>>> +#include <xen/xvmalloc.h>
>>>>>> +
>>>>>> +#include <asm/p2m.h>
>>>>>> +#include <asm/sbi.h>
>>>>>> +
>>>>>> +static spinlock_t vmid_alloc_lock = SPIN_LOCK_UNLOCKED;
>>>>>> +
>>>>>> +/*
>>>>>> + * hgatp's VMID field is 7 or 14 bits. RV64 may support 14-bit VMID.
>>>>>> + * Using a bitmap here limits us to 127 (2^7 - 1) or 16383 (2^14 - 1)
>>>>>> + * concurrent domains.
>>>>> Which is pretty limiting especially in the RV32 case. Hence why we don't
>>>>> assign a permanent ID to VMs on x86, but rather manage IDs per-CPU (note:
>>>>> not per-vCPU).
>>>> Good point.
>>>>
>>>> I don't believe anyone will use RV32.
>>>> For RV64, the available ID space seems sufficiently large.
>>>>
>>>> However, if it turns out that the value isn't large enough even for RV64,
>>>> I can rework it to manage IDs per physical CPU.
>>>> Wouldn't that approach result in more TLB entries being flushed compared
>>>> to per-vCPU allocation, potentially leading to slightly worse performance?
>>> Depends on the condition for when to flush. Of course performance is
>>> unavoidably going to suffer if you have only very few VMIDs to use.
>>> Nevertheless, as indicated before, the model used on x86 may be a
>>> candidate to use here, too. See hvm_asid_handle_vmenter() for the
>>> core (and vendor-independent) part of it.
>> IIUC, so basically it is just a round-robin and when VMIDs are ran out
>> then just do full guest TLB flush and start to re-use VMIDs from the start.
>> It makes sense to me, I'll implement something similar. (as I'm not really
>> sure that we needdata->core_asid_generation, probably, I will understand it better when
>> start to implement it)
> Well. The fewer VMID bits you have the more quickly you will need a new
> generation. And keep track of the generation you're at you also need to
> track the present number somewhere.
>
>>>> What about then to allocate VMID per-domain?
>>> That's what you're doing right now, isn't it? And that gets problematic when
>>> you have only very few bits in hgatp.VMID, as mentioned below.
>> Right, I just phrased my question poorly—sorry about that.
>>
>> What I meant to ask is: does the approach described above actually depend on whether
>> VMIDs are allocated per-domain or per-pCPU? It seems that the main advantage of
>> allocating VMIDs per-pCPU is potentially reducing the number of TLB flushes,
>> since it's more likely that a platform will have more than|VMID_MAX| domains than
>> |VMID_MAX| physical CPUs—am I right?
> Seeing that there can be systems with hundreds or even thousands of CPUs,
> I don't think I can agree here. Plus per-pCPU allocation would similarly
> get you in trouble when you have only very few VMID bits.

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
In other words, I'm not 100% sure that I get a point why x86 chose per-pCPU allocation
instead of per-domain allocation with having the same VMID for all vCPUs of domains.

~ Oleksii

--------------VDEQ7fGcXo4njzSsfmj00UBY
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
    <div class="moz-cite-prefix">On 6/24/25 4:01 PM, Jan Beulich wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:f5c14ffa-6314-4534-a83e-4024b379755c@suse.com">
      <pre class="moz-quote-pre" wrap=""><pre wrap=""
      class="moz-quote-pre">On 24.06.2025 15:47, Oleksii Kurochko wrote:
</pre><blockquote type="cite" style="color: #007cff;"><pre wrap=""
      class="moz-quote-pre">On 6/24/25 12:44 PM, Jan Beulich wrote:
</pre><blockquote type="cite" style="color: #007cff;"><pre wrap=""
      class="moz-quote-pre">On 24.06.2025 11:46, Oleksii Kurochko wrote:
</pre><blockquote type="cite" style="color: #007cff;"><pre wrap=""
      class="moz-quote-pre">On 6/18/25 5:46 PM, Jan Beulich wrote:
</pre><blockquote type="cite" style="color: #007cff;"><pre wrap=""
      class="moz-quote-pre">On 10.06.2025 15:05, Oleksii Kurochko wrote:
</pre><blockquote type="cite" style="color: #007cff;"><pre wrap=""
      class="moz-quote-pre">--- /dev/null
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
+ * Using a bitmap here limits us to 127 (2<sup class="moz-txt-sup"><span
      style="display:inline-block;width:0;height:0;overflow:hidden">^</span>7</sup> - 1) or 16383 (2<sup
      class="moz-txt-sup"><span
      style="display:inline-block;width:0;height:0;overflow:hidden">^</span>14</sup> - 1)
+ * concurrent domains.
</pre></blockquote><pre wrap="" class="moz-quote-pre">Which is pretty limiting especially in the RV32 case. Hence why we don't
assign a permanent ID to VMs on x86, but rather manage IDs per-CPU (note:
not per-vCPU).
</pre></blockquote><pre wrap="" class="moz-quote-pre">Good point.

I don't believe anyone will use RV32.
For RV64, the available ID space seems sufficiently large.

However, if it turns out that the value isn't large enough even for RV64,
I can rework it to manage IDs per physical CPU.
Wouldn't that approach result in more TLB entries being flushed compared
to per-vCPU allocation, potentially leading to slightly worse performance?
</pre></blockquote><pre wrap="" class="moz-quote-pre">Depends on the condition for when to flush. Of course performance is
unavoidably going to suffer if you have only very few VMIDs to use.
Nevertheless, as indicated before, the model used on x86 may be a
candidate to use here, too. See hvm_asid_handle_vmenter() for the
core (and vendor-independent) part of it.
</pre></blockquote><pre wrap="" class="moz-quote-pre">IIUC, so basically it is just a round-robin and when VMIDs are ran out
then just do full guest TLB flush and start to re-use VMIDs from the start.
It makes sense to me, I'll implement something similar. (as I'm not really
sure that we needdata-&gt;core_asid_generation, probably, I will understand it better when 
start to implement it)
</pre></blockquote><pre wrap="" class="moz-quote-pre">Well. The fewer VMID bits you have the more quickly you will need a new
generation. And keep track of the generation you're at you also need to
track the present number somewhere.

</pre><blockquote type="cite" style="color: #007cff;"><blockquote
      type="cite" style="color: #007cff;"><blockquote type="cite"
      style="color: #007cff;"><pre wrap="" class="moz-quote-pre">What about then to allocate VMID per-domain?
</pre></blockquote><pre wrap="" class="moz-quote-pre">That's what you're doing right now, isn't it? And that gets problematic when
you have only very few bits in hgatp.VMID, as mentioned below.
</pre></blockquote><pre wrap="" class="moz-quote-pre">Right, I just phrased my question poorly—sorry about that.

What I meant to ask is: does the approach described above actually depend on whether
VMIDs are allocated per-domain or per-pCPU? It seems that the main advantage of
allocating VMIDs per-pCPU is potentially reducing the number of TLB flushes,
since it's more likely that a platform will have more than|VMID_MAX| domains than
<code class="moz-txt-verticalline"><span class="moz-txt-tag">|</span>VMID_MAX<span
      class="moz-txt-tag">|</span></code> physical CPUs—am I right?
</pre></blockquote><pre wrap="" class="moz-quote-pre">Seeing that there can be systems with hundreds or even thousands of CPUs,
I don't think I can agree here. Plus per-pCPU allocation would similarly
get you in trouble when you have only very few VMID bits.</pre></pre>
    </blockquote>
    <pre>But not so fast as in case of per-domain allocation, right?

I mean that if we have only 4 bits, then in case of per-domain allocation we will
need to do TLB flush + VMID re-assigning when we have more then 16 domains.

But in case of per-pCPU allocation we could run 16 domains on 1 pCPU and at the same
time in multiprocessor systems we have more pCPUs, which will allow us to run more
domains and avoid TLB flushes.
On other hand, it is needed to consider that it's unlikely that a domain will have
only one vCPU. And it is likely that amount of vCPUs will be bigger then an amount
of domains, so to have a round-robin approach (as x86) without permanent ID allocation
for each domain will work better then per-pCPU allocation.
In other words, I'm not 100% sure that I get a point why x86 chose per-pCPU allocation
instead of per-domain allocation with having the same VMID for all vCPUs of domains.

~ Oleksii

</pre>
  </body>
</html>

--------------VDEQ7fGcXo4njzSsfmj00UBY--

