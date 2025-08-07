Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 50102B1D464
	for <lists+xen-devel@lfdr.de>; Thu,  7 Aug 2025 10:43:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1072636.1435643 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ujwDY-0000kR-Ml; Thu, 07 Aug 2025 08:43:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1072636.1435643; Thu, 07 Aug 2025 08:43:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ujwDY-0000hK-Jn; Thu, 07 Aug 2025 08:43:20 +0000
Received: by outflank-mailman (input) for mailman id 1072636;
 Thu, 07 Aug 2025 08:43:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=oMMd=2T=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1ujwDX-0000hE-3Y
 for xen-devel@lists.xenproject.org; Thu, 07 Aug 2025 08:43:19 +0000
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [2a00:1450:4864:20::635])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9067c58f-736a-11f0-a324-13f23c93f187;
 Thu, 07 Aug 2025 10:43:17 +0200 (CEST)
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-af9180a11bcso156328766b.0
 for <xen-devel@lists.xenproject.org>; Thu, 07 Aug 2025 01:43:17 -0700 (PDT)
Received: from [192.168.1.5] (user-109-243-64-38.play-internet.pl.
 [109.243.64.38]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-af91a076724sm1255969766b.23.2025.08.07.01.43.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 07 Aug 2025 01:43:14 -0700 (PDT)
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
X-Inumbo-ID: 9067c58f-736a-11f0-a324-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754556197; x=1755160997; darn=lists.xenproject.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7RqvFjCM2NDqqed3L4SquP7fLKhf9Kfwsc1lYa0G0gE=;
        b=NglBaWNCe2GoIkuZzsQdUzUU7U3R7q0cg0x7pt3vstE0ajQPtVKnWFfxaXQQWxo3cM
         4XvBbwXNBtz7bjVOfDTlN/fdmlnHWor+cjgwfwkn0iIXEj/1YK2aUOwIHy6iFuzMsZBs
         TDX5F6UGQ9g0Fi70KsV14dqTYbyE35JX94UnTcEGICO1yEMRb3ZPGSEMjGP+cUrtfDTa
         Zwd1wOnyOqCjZxxJCvVJCFY4nx9nLV3vF41Ds2dlFXXFbZZD8UsBHH93zGY8Blfk2yrx
         4PcWUav5MSNMU/WtM81Ja4ceECnX8VTA9LRXfF5JJweNaXLjNZpLcpsiyD8jcfFbJo3a
         Y/rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754556197; x=1755160997;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=7RqvFjCM2NDqqed3L4SquP7fLKhf9Kfwsc1lYa0G0gE=;
        b=iGsW+5DIo41fmvHhNcHTfkpN4C/XW7TFS8Ip3dK5KRrkg7GmLkeKnQwKZvJ1f4vloS
         zQNJVWSMgbOTVYFmqVBOl1Ee5P3semJ31PyUCxV6ir2OSDugtRis87he9Kp2fgK6ARQi
         002J1QgsW5Zqzystd9BCcldH8nvvWhaaJ5P910QDOTelXqBv4c8qeHjKUtRXMkCEBExB
         ooo4qSt9K+cwxwVcnRIGU2k9eU1EjJd0rbDbhpTKPk6WxIX1kW6vD8KrdeZkK18brCow
         0yUu6ohFxK3pidCGLcJDwuaHGYrqTYg6pyrVU1cwC+a+r7YzVtV9xhpvbbKIuLyw5MGN
         KcRQ==
X-Forwarded-Encrypted: i=1; AJvYcCW1kLa5PY/4VZwKFjE7Xz+kEXiswEmybzd2ioTIhc5rOq3lxiI5ThAVCuZdSPkCf5pi2nvj1G6FfA8=@lists.xenproject.org
X-Gm-Message-State: AOJu0YycVsjx4x9im1pKTAJVlTefzt66e14sI/8ABWXOq5H7Jg86WjYI
	7xI8S5c40O+w5sXMeu4cse8D3odyna637TCmZvc009fj7EfQykY03RhP
X-Gm-Gg: ASbGncsocKZuDyeDeatt1UXIPRgVygrj+6IH3jkRqMdIyrpeUL32FCg5oZc/qeFRDl9
	hDm56snXSYnFseOh6FXCiy5wZdCO4f4SYJQHfEYeWUbOLVSGywyVi4YZQUTsgxLznvDZ58ECBnx
	BRfBLcORQWvDGzw8uQlsaMhuAegEBxD7TQcdUpPZyWtFTm/ZunPYUa4fUQyrfHDSASaRDRgulVa
	dsduqopzgWX1REjsNrmJuf+rKK18+/NeMgTvZlDSXxl7yyP4SPL3tTlnMhPeRVYvLWe1Sfu0caD
	x+coSaBQwA/wfPtrHSpOsnfOroFk6+cWJE1vsP15rUbSAxJitUIRz3lSFo1AEb+wgPrTaVJih8K
	6a2RBwjKfQoYeBzOrSfu39TW9/cz20E1pzPDWudlQ0hEvIyXSVHYQkCXvGuKW75MALsDEypw=
X-Google-Smtp-Source: AGHT+IElBqpK52T+grYSN+cVh03ZeJF7KIbiuJyVXnWzeZIYNPLprV0dRt3dMSZvDwDwnBF7nbP1qQ==
X-Received: by 2002:a17:907:94c8:b0:af9:5f2a:6f5b with SMTP id a640c23a62f3a-af9a3c9accemr231805166b.9.1754556196635;
        Thu, 07 Aug 2025 01:43:16 -0700 (PDT)
Content-Type: multipart/alternative;
 boundary="------------fD8N5IalILLFp4Wq7DTsS7xq"
Message-ID: <e868dc1f-4492-4203-a0c6-c008f11e6f74@gmail.com>
Date: Thu, 7 Aug 2025 10:43:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 03/20] xen/riscv: introduce VMID allocation and
 manegement
To: Demi Marie Obenour <demiobenour@gmail.com>,
 Jan Beulich <jbeulich@suse.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1753973161.git.oleksii.kurochko@gmail.com>
 <d61f5f831ac8045055a1775ee710d4f2fe8dcc26.1753973161.git.oleksii.kurochko@gmail.com>
 <cd1a0c64-49d7-4ae1-8dec-b3b1de3f1d09@suse.com>
 <bcf4c3aa-5c09-4171-a4f5-85110d6e634f@gmail.com>
 <6ddee574-6fe2-4de7-b000-a3af0b2c9d12@suse.com>
 <cc6bb8a7-ed22-4d3e-a352-fa305f0ea56a@gmail.com>
 <14e1c224-c648-41bb-97c6-ec63596bd38b@gmail.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <14e1c224-c648-41bb-97c6-ec63596bd38b@gmail.com>

This is a multi-part message in MIME format.
--------------fD8N5IalILLFp4Wq7DTsS7xq
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 8/6/25 6:50 PM, Demi Marie Obenour wrote:
> On 8/6/25 12:24, Oleksii Kurochko wrote:
>> On 8/6/25 2:05 PM, Jan Beulich wrote:
>>> On 06.08.2025 13:33, Oleksii Kurochko wrote:
>>>> On 8/4/25 5:19 PM, Jan Beulich wrote:
>>>>> On 31.07.2025 17:58, Oleksii Kurochko wrote:
>>>>>> @@ -148,6 +149,8 @@ void __init noreturn start_xen(unsigned long bootcpu_id,
>>>>>>     
>>>>>>         console_init_postirq();
>>>>>>     
>>>>>> +    vmid_init();
>>>>> This lives here only temporarily, I assume? Every hart will need to execute
>>>>> it, and hence (like we have it on x86) this may want to be a central place
>>>>> elsewhere.
>>>> I haven’t checked how it is done on x86; I probably should.
>>>>
>>>> I planned to call it for each hart separately during secondary hart bring-up,
>>>> since accessing the|hgatp| register of a hart is required to detect|VMIDLEN|.
>>>> Therefore,|vmid_init()| should be called for secondary harts when their
>>>> initialization code starts executing.
>>> But is this going to be the only per-hart thing that will need doing? Otherwise
>>> the same larger "container" function may want calling instead.
>> Yes, it is going to be the only per-hart operation.
>>
>> There is|__cpu_up()| (not yet upstreamed [1]), which calls
>> |sbi_hsm_hart_start(hartid, boot_addr, hsm_data)| to start a hart, and I planned
>> to place|vmid_init()| somewhere in the code executed at|boot_addr|.
>>
>> [1]https://gitlab.com/xen-project/people/olkur/xen/-/blob/latest/xen/arch/riscv/smpboot.c#L40
>>
>>>>>> +{
>>>>>> +    unsigned long vmid_bits;
>>>>> Why "long" (also for the function return type)?
>>>> Because csr_read() returns unsigned long as HGATP register has
>>>> 'unsigned long' length.
>>> Oh, right, I should have commented on the function return type only.
>>> Yet then I also can't resist stating that this kind of use of a variable,
>>> which initially is assigned a value that doesn't really fit its name, is
>>> easily misleading towards giving such comments.
>>>
>>>> But it could be done in this way:
>>>>        csr_write(CSR_HGATP, old | HGATP_VMID_MASK);
>>>>        vmid_bits =  MASK_EXTR(csr_read(CSR_HGATP), HGATP_VMID_MASK);
>>>>        vmid_bits = ffs_g(vmid_bits);
>>>>        csr_write(CSR_HGATP, old);
>>>> And then use uint16_t for vmid_bits and use uin16_t as a return type.
>>> Please check ./CODING_STYLE again as to the use of fixed-width types.
>> I meant unsigned short, uint16_t was just short to write. I'll try to be
>> more specific.
>>
>>>>>> +    unsigned long old;
>>>>>> +
>>>>>> +    /* Figure-out number of VMID bits in HW */
>>>>>> +    old = csr_read(CSR_HGATP);
>>>>>> +
>>>>>> +    csr_write(CSR_HGATP, old | HGATP_VMID_MASK);
>>>>>> +    vmid_bits = csr_read(CSR_HGATP);
>>>>>> +    vmid_bits =  MASK_EXTR(vmid_bits, HGATP_VMID_MASK);
>>>>> Nit: Stray blank.
>>>>>
>>>>>> +    vmid_bits = flsl(vmid_bits);
>>>>>> +    csr_write(CSR_HGATP, old);
>>>>>> +
>>>>>> +    /*
>>>>>> +     * We polluted local TLB so flush all guest TLB as
>>>>>> +     * a speculative access can happen at any time.
>>>>>> +     */
>>>>>> +    local_hfence_gvma_all();
>>>>> There's no guest running. If you wrote hgat.MODE as zero, as per my
>>>>> understanding now new TLB entries could even purely theoretically appear.
>>>> It could be an issue (or, at least, it is recommended) when hgatp.MODE is
>>>> changed:
>>>>     If hgatp.MODE is changed for a given VMID, an HFENCE.GVMA with rs1=x0
>>>>     (and rs2 set to either x0 or the VMID) must be executed to order subsequent
>>>>     guest translations with the MODE change—even if the old MODE or new MODE
>>>>     is Bare.
>>>> On other hand it is guaranteed that, at least, on Reset (and so I assume
>>>> for power on) that:
>>>>     If the hypervisor extension is implemented, the hgatp.MODE and vsatp.MODE
>>>>     fields are reset to 0.
>>>>
>>>> So it seems like if no guest is ran then there is no need even to write
>>>> hgatp.MODE as zero, but it might be sense to do that explicitly just to
>>>> be sure.
>>>>
>>>> I thought it was possible to have a running guest and perform a CPU hotplug.
>>> But that guest will run on another hart.
>>>
>>>> In that case, I expect that during the hotplug,|vmidlen_detect()| will be
>>>> called and return the|vmid_bits| value, which is used as the active VMID.
>>>> At that moment, the local TLB could be speculatively polluted, I think.
>>>> Likely, it makes sense to call vmidlen_detect() only once for each hart
>>>> during initial bringup.
>>> That may bring you more problems than it solves. You'd need to stash away
>>> the value originally read somewhere. And that somewhere isn't per-CPU data.
>>>
>>>>> In fact, with no guest running (yet) I'm having a hard time seeing why
>>>>> you shouldn't be able to simply write the register with just
>>>>> HGATP_VMID_MASK, i.e. without OR-ing in "old". It's even questionable
>>>>> whether "old" needs restoring; writing plain zero afterwards ought to
>>>>> suffice. You're in charcge of the register, after all.
>>>> It make sense (but I don't know if it is a possible case) to be sure that
>>>> HGATP.MODE remains the same, so there is no need to have TLB flush. If
>>>> HGATP.MODE is changed then it will be needed to do TLB flush as I mentioned
>>>> above.
>>>>
>>>> If we agreed to keep local_hfence_gvma_all() then I think it isn't really
>>>> any sense to restore 'old' or OR-ing it with HGATP_VMID_MASK.
>>>>
>>>> Generally if 'old' is guaranteed to be zero (and, probably, it makes sense
>>>> to check that in vmidlen_detect() and panic if it isn't zero) and if
>>>> vmidlen_detect() function will be called before any guest domain(s) will
>>>> be ran then I could agree that we don't need local_hfence_gvma_all() here.
>>>>
>>>> As an option we can do local_hfence_gvma_all() only if 'old' value wasn't
>>>> set to zero.
>>>>
>>>> Does it make sense?
>>> Well - I'd like the pre-conditions to be understood better. For example, can
>>> a hart really speculate into guest mode, when the hart is only in the
>>> process of being brought up?
>> I couldn't explicit words that a hart can't speculate into guest mode
>> either on bring up or during its work.
>>
>> But there are some moments in the spec which tells:
>>     Implementations with virtual memory are permitted to perform address
>>     translations speculatively and earlier than required by an explicit
>>     memory access, and are permitted to cache them in address translation
>>     cache structures—including possibly caching the identity mappings from
>>     effective address to physical address used in Bare translation modes and
>>     M-mode.
>> And here:
>>     Implementations may also execute the address-translation algorithm
>>     speculatively at any time, for any virtual address, as long as satp is
>>     active (as defined in Section 10.1.11). Such speculative executions have
>>     the effect of pre-populating the address-translation cache.
>> Where it is explicitly mentioned that speculation can happen in *any time*.
>> And at the same time:
>>     Speculative executions of the address-translation algorithm behave as
>>     non-speculative executions of the algorithm do, except that they must
>>     not set the dirty bit for a PTE, they must not trigger an exception,
>>     and they must not create address-translation cache entries if those
>>     entries would have been invalidated by any SFENCE.VMA instruction
>>     executed by the hart since the speculative execution of the algorithm began.
>> What I read as if TLB was empty before it will stay empty.
> I read that as "flushing the TLB invalidates entries created by speculative
> execution before the TLB flush".

But this part:
   they must not create address-translation cache entries if those entries
   would have been invalidated by any SFENCE.VMA instruction

Doesn't it mean that entries which was invalidated by SFENCE.VMA can't be
inserted into the TLB during speculative execution?

So, if the speculative page walk started before|SFENCE.VMA|,|SFENCE.VMA|
indicates: “All previous TLB entries might be invalid". Therefore, any
speculative TLB entry/that started before/ must*not* be inserted into the
TLB afterward.

So, hardware tracks if a|SFENCE.VMA| occurred/after/ speculation started.
If so, any speculative address translations must be*discarded* or
*not committed*.

>    That is the bare minimum needed for TLB
> flushing to work.  You have to do the TLB flush *after* changing the PTEs,
> not before.
>
> This is true on at least x86 but I expect it to hold in general.

Agree with that.

~ Oleksii

--------------fD8N5IalILLFp4Wq7DTsS7xq
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
    <div class="moz-cite-prefix">On 8/6/25 6:50 PM, Demi Marie Obenour
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:14e1c224-c648-41bb-97c6-ec63596bd38b@gmail.com">
      <pre wrap="" class="moz-quote-pre">On 8/6/25 12:24, Oleksii Kurochko wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">
On 8/6/25 2:05 PM, Jan Beulich wrote:
</pre>
        <blockquote type="cite">
          <pre wrap="" class="moz-quote-pre">On 06.08.2025 13:33, Oleksii Kurochko wrote:
</pre>
          <blockquote type="cite">
            <pre wrap="" class="moz-quote-pre">On 8/4/25 5:19 PM, Jan Beulich wrote:
</pre>
            <blockquote type="cite">
              <pre wrap="" class="moz-quote-pre">On 31.07.2025 17:58, Oleksii Kurochko wrote:
</pre>
              <blockquote type="cite">
                <pre wrap="" class="moz-quote-pre">@@ -148,6 +149,8 @@ void __init noreturn start_xen(unsigned long bootcpu_id,
   
       console_init_postirq();
   
+    vmid_init();
</pre>
              </blockquote>
              <pre wrap="" class="moz-quote-pre">This lives here only temporarily, I assume? Every hart will need to execute
it, and hence (like we have it on x86) this may want to be a central place
elsewhere.
</pre>
            </blockquote>
            <pre wrap="" class="moz-quote-pre">I haven’t checked how it is done on x86; I probably should.

I planned to call it for each hart separately during secondary hart bring-up,
since accessing the|hgatp| register of a hart is required to detect|VMIDLEN|.
Therefore,|vmid_init()| should be called for secondary harts when their
initialization code starts executing.
</pre>
          </blockquote>
          <pre wrap="" class="moz-quote-pre">But is this going to be the only per-hart thing that will need doing? Otherwise
the same larger "container" function may want calling instead.
</pre>
        </blockquote>
        <pre wrap="" class="moz-quote-pre">
Yes, it is going to be the only per-hart operation.

There is|__cpu_up()| (not yet upstreamed [1]), which calls
|sbi_hsm_hart_start(hartid, boot_addr, hsm_data)| to start a hart, and I planned
to place|vmid_init()| somewhere in the code executed at|boot_addr|.

[1]<a class="moz-txt-link-freetext" href="https://gitlab.com/xen-project/people/olkur/xen/-/blob/latest/xen/arch/riscv/smpboot.c#L40">https://gitlab.com/xen-project/people/olkur/xen/-/blob/latest/xen/arch/riscv/smpboot.c#L40</a>

</pre>
        <blockquote type="cite">
          <blockquote type="cite">
            <blockquote type="cite">
              <blockquote type="cite">
                <pre wrap="" class="moz-quote-pre">+{
+    unsigned long vmid_bits;
</pre>
              </blockquote>
              <pre wrap="" class="moz-quote-pre">Why "long" (also for the function return type)?
</pre>
            </blockquote>
            <pre wrap="" class="moz-quote-pre">Because csr_read() returns unsigned long as HGATP register has
'unsigned long' length.
</pre>
          </blockquote>
          <pre wrap="" class="moz-quote-pre">Oh, right, I should have commented on the function return type only.
Yet then I also can't resist stating that this kind of use of a variable,
which initially is assigned a value that doesn't really fit its name, is
easily misleading towards giving such comments.

</pre>
          <blockquote type="cite">
            <pre wrap="" class="moz-quote-pre">But it could be done in this way:
      csr_write(CSR_HGATP, old | HGATP_VMID_MASK);
      vmid_bits =  MASK_EXTR(csr_read(CSR_HGATP), HGATP_VMID_MASK);
      vmid_bits = ffs_g(vmid_bits);
      csr_write(CSR_HGATP, old);
And then use uint16_t for vmid_bits and use uin16_t as a return type.
</pre>
          </blockquote>
          <pre wrap="" class="moz-quote-pre">Please check ./CODING_STYLE again as to the use of fixed-width types.
</pre>
        </blockquote>
        <pre wrap="" class="moz-quote-pre">
I meant unsigned short, uint16_t was just short to write. I'll try to be
more specific.

</pre>
        <blockquote type="cite">
          <pre wrap="" class="moz-quote-pre">
</pre>
          <blockquote type="cite">
            <blockquote type="cite">
              <blockquote type="cite">
                <pre wrap="" class="moz-quote-pre">+    unsigned long old;
+
+    /* Figure-out number of VMID bits in HW */
+    old = csr_read(CSR_HGATP);
+
+    csr_write(CSR_HGATP, old | HGATP_VMID_MASK);
+    vmid_bits = csr_read(CSR_HGATP);
+    vmid_bits =  MASK_EXTR(vmid_bits, HGATP_VMID_MASK);
</pre>
              </blockquote>
              <pre wrap="" class="moz-quote-pre">Nit: Stray blank.

</pre>
              <blockquote type="cite">
                <pre wrap="" class="moz-quote-pre">+    vmid_bits = flsl(vmid_bits);
+    csr_write(CSR_HGATP, old);
+
+    /*
+     * We polluted local TLB so flush all guest TLB as
+     * a speculative access can happen at any time.
+     */
+    local_hfence_gvma_all();
</pre>
              </blockquote>
              <pre wrap="" class="moz-quote-pre">There's no guest running. If you wrote hgat.MODE as zero, as per my
understanding now new TLB entries could even purely theoretically appear.
</pre>
            </blockquote>
            <pre wrap="" class="moz-quote-pre">It could be an issue (or, at least, it is recommended) when hgatp.MODE is
changed:
   If hgatp.MODE is changed for a given VMID, an HFENCE.GVMA with rs1=x0
   (and rs2 set to either x0 or the VMID) must be executed to order subsequent
   guest translations with the MODE change—even if the old MODE or new MODE
   is Bare.
On other hand it is guaranteed that, at least, on Reset (and so I assume
for power on) that:
   If the hypervisor extension is implemented, the hgatp.MODE and vsatp.MODE
   fields are reset to 0.

So it seems like if no guest is ran then there is no need even to write
hgatp.MODE as zero, but it might be sense to do that explicitly just to
be sure.

I thought it was possible to have a running guest and perform a CPU hotplug.
</pre>
          </blockquote>
          <pre wrap="" class="moz-quote-pre">But that guest will run on another hart.

</pre>
          <blockquote type="cite">
            <pre wrap="" class="moz-quote-pre">In that case, I expect that during the hotplug,|vmidlen_detect()| will be
called and return the|vmid_bits| value, which is used as the active VMID.
At that moment, the local TLB could be speculatively polluted, I think.
Likely, it makes sense to call vmidlen_detect() only once for each hart
during initial bringup.
</pre>
          </blockquote>
          <pre wrap="" class="moz-quote-pre">That may bring you more problems than it solves. You'd need to stash away
the value originally read somewhere. And that somewhere isn't per-CPU data.

</pre>
          <blockquote type="cite">
            <blockquote type="cite">
              <pre wrap="" class="moz-quote-pre">In fact, with no guest running (yet) I'm having a hard time seeing why
you shouldn't be able to simply write the register with just
HGATP_VMID_MASK, i.e. without OR-ing in "old". It's even questionable
whether "old" needs restoring; writing plain zero afterwards ought to
suffice. You're in charcge of the register, after all.
</pre>
            </blockquote>
            <pre wrap="" class="moz-quote-pre">It make sense (but I don't know if it is a possible case) to be sure that
HGATP.MODE remains the same, so there is no need to have TLB flush. If
HGATP.MODE is changed then it will be needed to do TLB flush as I mentioned
above.

If we agreed to keep local_hfence_gvma_all() then I think it isn't really
any sense to restore 'old' or OR-ing it with HGATP_VMID_MASK.

Generally if 'old' is guaranteed to be zero (and, probably, it makes sense
to check that in vmidlen_detect() and panic if it isn't zero) and if
vmidlen_detect() function will be called before any guest domain(s) will
be ran then I could agree that we don't need local_hfence_gvma_all() here.

As an option we can do local_hfence_gvma_all() only if 'old' value wasn't
set to zero.

Does it make sense?
</pre>
          </blockquote>
          <pre wrap="" class="moz-quote-pre">Well - I'd like the pre-conditions to be understood better. For example, can
a hart really speculate into guest mode, when the hart is only in the
process of being brought up?
</pre>
        </blockquote>
        <pre wrap="" class="moz-quote-pre">
I couldn't explicit words that a hart can't speculate into guest mode
either on bring up or during its work.

But there are some moments in the spec which tells:
   Implementations with virtual memory are permitted to perform address
   translations speculatively and earlier than required by an explicit
   memory access, and are permitted to cache them in address translation
   cache structures—including possibly caching the identity mappings from
   effective address to physical address used in Bare translation modes and
   M-mode.
And here:
   Implementations may also execute the address-translation algorithm
   speculatively at any time, for any virtual address, as long as satp is
   active (as defined in Section 10.1.11). Such speculative executions have
   the effect of pre-populating the address-translation cache.
Where it is explicitly mentioned that speculation can happen in *any time*.
And at the same time:
   Speculative executions of the address-translation algorithm behave as
   non-speculative executions of the algorithm do, except that they must
   not set the dirty bit for a PTE, they must not trigger an exception,
   and they must not create address-translation cache entries if those
   entries would have been invalidated by any SFENCE.VMA instruction
   executed by the hart since the speculative execution of the algorithm began.
What I read as if TLB was empty before it will stay empty.
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
I read that as "flushing the TLB invalidates entries created by speculative
execution before the TLB flush".</pre>
    </blockquote>
    <pre>But this part:
  they must not create address-translation cache entries if those entries
  would have been invalidated by any SFENCE.VMA instruction

Doesn't it mean that entries which was invalidated by SFENCE.VMA can't be
inserted into the TLB during speculative execution?

So, if the speculative page walk started before <code data-start="1577"
    data-end="1589">SFENCE.VMA</code>, <code data-start="1593"
    data-end="1605">SFENCE.VMA</code>
indicates: “All previous TLB entries might be invalid". Therefore, any
speculative TLB entry <em data-start="1701" data-end="1722">that started before</em> must <strong
    data-start="1728" data-end="1735">not</strong> be inserted into the
TLB afterward.

So, hardware tracks if a <code data-start="1836" data-end="1848">SFENCE.VMA</code> occurred <em
    data-start="1858" data-end="1865">after</em> speculation started.
If so, any speculative address translations must be <strong
    data-start="1941" data-end="1954">discarded</strong> or
<strong data-start="1958" data-end="1975">not committed</strong>.</pre>
    <p></p>
    <blockquote type="cite"
      cite="mid:14e1c224-c648-41bb-97c6-ec63596bd38b@gmail.com">
      <pre wrap="" class="moz-quote-pre">  That is the bare minimum needed for TLB
flushing to work.  You have to do the TLB flush *after* changing the PTEs,
not before.

This is true on at least x86 but I expect it to hold in general.</pre>
    </blockquote>
    <pre>Agree with that.

~ Oleksii</pre>
  </body>
</html>

--------------fD8N5IalILLFp4Wq7DTsS7xq--

