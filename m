Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A867EAE66F0
	for <lists+xen-devel@lfdr.de>; Tue, 24 Jun 2025 15:48:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1023725.1399781 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uU3zu-00073t-6h; Tue, 24 Jun 2025 13:47:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1023725.1399781; Tue, 24 Jun 2025 13:47:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uU3zu-00072I-3d; Tue, 24 Jun 2025 13:47:38 +0000
Received: by outflank-mailman (input) for mailman id 1023725;
 Tue, 24 Jun 2025 13:47:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ctQ0=ZH=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1uU3zt-00072C-2a
 for xen-devel@lists.xenproject.org; Tue, 24 Jun 2025 13:47:37 +0000
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [2a00:1450:4864:20::62f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c86b4392-5101-11f0-b894-0df219b8e170;
 Tue, 24 Jun 2025 15:47:34 +0200 (CEST)
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-adeaa4f3d07so1049350666b.0
 for <xen-devel@lists.xenproject.org>; Tue, 24 Jun 2025 06:47:34 -0700 (PDT)
Received: from [192.168.1.5] (user-109-243-64-38.play-internet.pl.
 [109.243.64.38]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ae053e7b3e7sm870915966b.21.2025.06.24.06.47.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 24 Jun 2025 06:47:33 -0700 (PDT)
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
X-Inumbo-ID: c86b4392-5101-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750772854; x=1751377654; darn=lists.xenproject.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/Ai2DEdThYtvB4OnOVTmqoinG56rBRphx6IqrHmJBBU=;
        b=XCrFtvndgpN3Qiz3RBvbQdWNtrjZIaAX4aixzXkz2/aB6omkDlq9qWLcsrULHwTHC5
         OUNN6bkxsx/4/bbnI3Hdn5gSLnbp48xB3VClPcJ+PfROtNN2Jtb7d1yEskm6vVJQoISo
         SwAyYKMhHIWvmEd7nOT0Ku+DRSocxwGfgbgLhZ5t99G56dhfV+cAgTJJy0X8eRtKoyRe
         xWDGFOCmlsLK14B1bnx2bt3Hd8yiaJ3L9uvxFju/LZZHkBLp7VaVTye1EYaLyl2qzSZ7
         fP7F8zYWwEV1SRYrYrkR/0K9Zp7G6VjWKPVsJFDA6QJBp9m69/7mJrSEJRfKVc6EQmQ+
         mJzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750772854; x=1751377654;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/Ai2DEdThYtvB4OnOVTmqoinG56rBRphx6IqrHmJBBU=;
        b=sfrFotj+FsQyTeL2dI61IPK702nNX1AMjqwFKeLgKNg658lUWtYj2o2p4dTCXkrP8g
         BoBFmm8V4ofrVCZ6m5W1SJ8bRYCXv0AFmswrcMWrOSmURVHrMZGIxq7/IjST0dykSfgy
         RKNETbmwAgTg8R67KTrOaTV2K8kyGuH9WuAaTnKplfT+qfftJbZ7rMLADhLuynkZCQuI
         EPmRo/iN9bT03rkVAIBXX1Ql2V/prSXkR2ZAdBE5nlptjDpiRUQaLVHcQ62ed2ohXaXG
         T/6vzM0KHFJ7ZcvQTitkW+RXGVZ8oO9T5gpDUD36b3xyQcYvHvyI2Xh7pGjQxg1P3UJk
         sAyA==
X-Forwarded-Encrypted: i=1; AJvYcCXlwFLyca6F9+HLrIEEIbyk2leQqkweGntGiEuEKE6/DWKP4J5xBGXY5s2RUIAHI/yVcR0lPt6YGck=@lists.xenproject.org
X-Gm-Message-State: AOJu0YywFsEgKmBLfxjEF/opHGqNBcZ2sm9nTaRv3+Gr5KZ2kvshoToE
	GABmAcK3tGv2PxoRwv8xZ/Dd0W2eYAZmtFQxAFrR6W7SpN3dSfaZR+/+
X-Gm-Gg: ASbGncvTBYkg4d9P5oKNFfYP3Vv3kBpMVPCnAy8tI5v4Z6nPVI1pOdRQe5GAY/stIhz
	6Cfgj8ziUN0wDmhwYIcbFrsjSIPVul4IH52IonJt58h1V3D7aQSe5z0C6Dvo9CTFQ+HKLLFYFl8
	emckbz1SK6xJyauFJH+qHyfp0ga/K+wvVS9JbTC6nHrxu1OQT7ZiRtKKpUGUYV6kWPHml0bSc0U
	/AYRosNxtGWWUhLa4N7QTRf6LOtaqkDBmHVghnEAxrNyLzzGDqYacMVK9DZYRcnU+wNoAi+p4E/
	UsgXnFHsz9XsM+T/nOmtNyzJTq3Y9y/+b5mcdtfJ6EmhkASYOSUxM8ilCrXUcQTp3pnG3ujZyrb
	f6Q4ZKTch2zhP4gX2S/7rdEMkOVx+r/W/s1s=
X-Google-Smtp-Source: AGHT+IEYpeiT5h57/uThAquKzfMUKaSUNJ3mRBUymbfVP6sBdBP/86eYPNITDduPMISfA3v1lqO9fQ==
X-Received: by 2002:a17:907:9603:b0:ad8:9c97:c2da with SMTP id a640c23a62f3a-ae057f6473bmr1576443866b.40.1750772853811;
        Tue, 24 Jun 2025 06:47:33 -0700 (PDT)
Content-Type: multipart/alternative;
 boundary="------------egtLgrWjPl4TsCOGsEkn1syp"
Message-ID: <a692d449-4101-498e-a460-33e4b2fb7176@gmail.com>
Date: Tue, 24 Jun 2025 15:47:32 +0200
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
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <80223fe3-7403-4026-9505-8826c318fabb@suse.com>

This is a multi-part message in MIME format.
--------------egtLgrWjPl4TsCOGsEkn1syp
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 6/24/25 12:44 PM, Jan Beulich wrote:
> On 24.06.2025 11:46, Oleksii Kurochko wrote:
>> On 6/18/25 5:46 PM, Jan Beulich wrote:
>>> On 10.06.2025 15:05, Oleksii Kurochko wrote:
>>>> --- /dev/null
>>>> +++ b/xen/arch/riscv/p2m.c
>>>> @@ -0,0 +1,115 @@
>>>> +#include <xen/bitops.h>
>>>> +#include <xen/lib.h>
>>>> +#include <xen/sched.h>
>>>> +#include <xen/spinlock.h>
>>>> +#include <xen/xvmalloc.h>
>>>> +
>>>> +#include <asm/p2m.h>
>>>> +#include <asm/sbi.h>
>>>> +
>>>> +static spinlock_t vmid_alloc_lock = SPIN_LOCK_UNLOCKED;
>>>> +
>>>> +/*
>>>> + * hgatp's VMID field is 7 or 14 bits. RV64 may support 14-bit VMID.
>>>> + * Using a bitmap here limits us to 127 (2^7 - 1) or 16383 (2^14 - 1)
>>>> + * concurrent domains.
>>> Which is pretty limiting especially in the RV32 case. Hence why we don't
>>> assign a permanent ID to VMs on x86, but rather manage IDs per-CPU (note:
>>> not per-vCPU).
>> Good point.
>>
>> I don't believe anyone will use RV32.
>> For RV64, the available ID space seems sufficiently large.
>>
>> However, if it turns out that the value isn't large enough even for RV64,
>> I can rework it to manage IDs per physical CPU.
>> Wouldn't that approach result in more TLB entries being flushed compared
>> to per-vCPU allocation, potentially leading to slightly worse performance?
> Depends on the condition for when to flush. Of course performance is
> unavoidably going to suffer if you have only very few VMIDs to use.
> Nevertheless, as indicated before, the model used on x86 may be a
> candidate to use here, too. See hvm_asid_handle_vmenter() for the
> core (and vendor-independent) part of it.

Thanks.

IIUC, so basically it is just a round-robin and when VMIDs are ran out
then just do full guest TLB flush and start to re-use VMIDs from the start.
It makes sense to me, I'll implement something similar. (as I'm not really
sure that we needdata->core_asid_generation, probably, I will understand it better when 
start to implement it)

>
>> What about then to allocate VMID per-domain?
> That's what you're doing right now, isn't it? And that gets problematic when
> you have only very few bits in hgatp.VMID, as mentioned below.

Right, I just phrased my question poorly—sorry about that.

What I meant to ask is: does the approach described above actually depend on whether
VMIDs are allocated per-domain or per-pCPU? It seems that the main advantage of
allocating VMIDs per-pCPU is potentially reducing the number of TLB flushes,
since it's more likely that a platform will have more than|VMID_MAX| domains than
|VMID_MAX| physical CPUs—am I right?


>
>>>> The bitmap space will be allocated dynamically
>>>> + * based on whether 7 or 14 bit VMIDs are supported.
>>>> + */
>>>> +static unsigned long *vmid_mask;
>>>> +static unsigned long *vmid_flushing_needed;
>>>> +
>>>> +/*
>>>> + * -2 here because:
>>>> + *    - -1 is needed to get the maximal possible VMID
>>> I don't follow this part.
>> Probably, I'm missing something.
>>
>> hgat.vmid is 7 bit long. BIT(7,U) = 1 << 7 = 128 which is bigger
>> then 7 bit can cover (0b1000_0000 and 0x111_1111). Thereby the MAX_VMID is:
>>    BIT(7, U) - 1 (in case of RV32).
> Right, but then why -2? (Maybe this is moot now that you agreed that
> INVALID_VMID can be defined differently.

Yes, another one -1 was because how INVALID_VMID was defined.

>
>>> VMIDLEN being permitted to be 0, how would you run more than one VM (e.g. Dom0)
>>> on such a system?
>> Hmm, good question.
>>
>> Then it will be needed to flush TLB on each VM switch by using
>> sbi_remote_hfence_gvma().
> Right, but just to be clear: That flush should not be conditional upon
> VMIDLEN being 0. In whatever model you chose, the handling of this special
> case should come out "natural".

Sure. I have some ideas how to do it natural.

>
>>>> +        sbi_remote_hfence_gvma_vmid(d->dirty_cpumask, 0, 0, p2m->vmid);
>>> You're creating d; it cannot possibly have run on any CPU yet. IOW
>>> d->dirty_cpumask will be reliably empty here. I think it would be hard to
>>> avoid issuing the flush to all CPUs here in this scheme.
>> I didn't double check, but I was sure that in case d->dirty_cpumask is empty then
>> rfence for all CPUs will be send. But I was wrong about that.
>>
>> What about just update a code of sbi_rfence_v02()?
> I don't know, but dealing with the issue there feels wrong. However,
> before deciding where to do something, it needs to be clear what you
> actually want to achieve. To me at least, that's not clear at all.

I want to achieve the following behavior: if a mask is empty
(specifically, in our case|d->dirty_cpumask|), then perform the flush
on all CPUs.

If you think it's not a good idea to change the current implementation
of|sbi_rfence_v02()|, then I’ll just check if|d->dirty_cpumask| is empty
before calling|sbi_remote_hfence_gvma_vmid(d->dirty_cpumask, 0, 0, p2m->vmid)|.

If it is empty, I’ll call|sbi_remote_hfence_gvma()| instead:
|if( !cpumask_empty(d->dirty_cpumask) ) 
sbi_remote_hfence_gvma_vmid(d->dirty_cpumask, 0, 0, p2m->vmid); 
elsesbi_remote_hfence_gvma(NULL, 0, 0); |

A similar check will be needed in|p2m_force_tlb_flush_sync()|, which is
implemented in one of the following patches in this series.

However, if we instead move the|if ( !cpumask_empty(d->dirty_cpumask) ) |check into||https://gitlab.com/xen-project/xen/-/blob/staging/xen/arch/riscv/sbi.c?ref_type=heads#L178,
we could call only:
   |sbi_remote_hfence_gvma_vmid(d->dirty_cpumask, 0, 0, p2m->vmid); |and get the same effect, which might result in cleaner code overall
as we already have a similar check (cpumask == NULL)|sbi_rfence_v02|() and a result of which
is just to send rfence operation to all CPUs.

>
>>>> +    spin_unlock(&vmid_alloc_lock);
>>>> +    return rc;
>>>> +}
>>>> +
>>>> +void p2m_free_vmid(struct domain *d)
>>>> +{
>>>> +    struct p2m_domain *p2m = p2m_get_hostp2m(d);
>>>> +
>>>> +    spin_lock(&vmid_alloc_lock);
>>>> +
>>>> +    if ( p2m->vmid != INVALID_VMID )
>>>> +    {
>>>> +        clear_bit(p2m->vmid, vmid_mask);
>>>> +        set_bit(p2m->vmid, vmid_flushing_needed);
>>> Does this scheme really avoid any flushes (except near when the system is
>>> about to go down)?
>>>
>>> As to choice of functions - see above.
>> I think yes, so my idea was that if vmid isn't freed then we have enough free VMID
>> and in this case flush isn't needed as each vcpu has unique not-used yet VMID,
>> and if there is no free VMID then and error will return in p2m_alloc_vmid():
>>       if ( nr == MAX_VMID )
>>       {
>>           rc = -EBUSY;
>>           printk(XENLOG_ERR "p2m.c: dom%pd: VMID pool exhausted\n", d->domain_id);
>>           goto out;
>>       }
> Which, as said, is a problem when there are only very few VMIDs.
>
>> On other hand, if VMID was freed and then re-used in p2m_alloc_vmid(), then it means
>> that vmid_flushing_needed will have VMID bit set, what means that a TLB flush is needed.
> Let's assume over the uptime of a system you cycle through all VMIDs a thousand
> times. While you manage to delay some TLB flushes, the percentage of ones actually
> saved is going to be very low then.

Then it is just better to update VMID allocation algo.

>
>>>> +    }
>>>> +
>>>> +    spin_unlock(&vmid_alloc_lock);
>>>> +}
>>>> +
>>>> +int p2m_init(struct domain *d)
>>>> +{
>>>> +    struct p2m_domain *p2m = p2m_get_hostp2m(d);
>>>> +    int rc;
>>>> +
>>>> +    p2m->vmid = INVALID_VMID;
>>> Given the absence of callers of p2m_free_vmid() it's also not clear what use
>>> this is.
>> Just mark that VMID for this domain wasn't yet allocated.
>>
>> Anyway, it will be called from arch_domain_create() by arch_domain_destroy() so if the some
>> error happens during arch_domain_create() and p2m->vmid wasn't allocated yet (so is equal to
>> INVALID_VMID), it means that there is no sense to update vmid_mask or vmid_flushing_needed.
> But only if you actually came through p2m_init() prior to the error. My point
> is: If you allocate a VMID here anyway, why first set the field like this?

Oh, got your point. Indeed, there is no sense.

> (Again, this is likely moot since the allocation scheme is likely to change
> altogether.)

Yes, it won't be really needed in the new allocation scheme.

Thanks.

~ Oleksii

--------------egtLgrWjPl4TsCOGsEkn1syp
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
    <div class="moz-cite-prefix">On 6/24/25 12:44 PM, Jan Beulich wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:80223fe3-7403-4026-9505-8826c318fabb@suse.com">
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
        <pre wrap="" class="moz-quote-pre">
Good point.

I don't believe anyone will use RV32.
For RV64, the available ID space seems sufficiently large.

However, if it turns out that the value isn't large enough even for RV64,
I can rework it to manage IDs per physical CPU.
Wouldn't that approach result in more TLB entries being flushed compared
to per-vCPU allocation, potentially leading to slightly worse performance?
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Depends on the condition for when to flush. Of course performance is
unavoidably going to suffer if you have only very few VMIDs to use.
Nevertheless, as indicated before, the model used on x86 may be a
candidate to use here, too. See hvm_asid_handle_vmenter() for the
core (and vendor-independent) part of it.</pre>
    </blockquote>
    <pre>Thanks.

IIUC, so basically it is just a round-robin and when VMIDs are ran out
then just do full guest TLB flush and start to re-use VMIDs from the start.
It makes sense to me, I'll implement something similar. (as I'm not really
sure that we need <span
style="color: rgb(36, 41, 46); font-family: Menlo, Monaco, Consolas, &quot;Courier New&quot;, monospace; font-size: 13px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: left; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: pre-wrap; background-color: rgb(255, 255, 255); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; display: inline !important; float: none;">data-&gt;core_asid_generation, probably, I will understand
it better when start to implement it)</span>

</pre>
    <blockquote type="cite"
      cite="mid:80223fe3-7403-4026-9505-8826c318fabb@suse.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">What about then to allocate VMID per-domain?
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
That's what you're doing right now, isn't it? And that gets problematic when
you have only very few bits in hgatp.VMID, as mentioned below.</pre>
    </blockquote>
    <pre data-start="62" data-end="120">Right, I just phrased my question poorly—sorry about that.</pre>
    <pre data-start="122" data-end="483">What I meant to ask is: does the approach described above actually depend on whether
VMIDs are allocated per-domain or per-pCPU? It seems that the main advantage of
allocating VMIDs per-pCPU is potentially reducing the number of TLB flushes,
since it's more likely that a platform will have more than <code
    data-start="423" data-end="433">VMID_MAX</code> domains than
<code data-start="447" data-end="457">VMID_MAX</code> physical CPUs—am I right?</pre>
    <pre>

</pre>
    <blockquote type="cite"
      cite="mid:80223fe3-7403-4026-9505-8826c318fabb@suse.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <blockquote type="cite">
          <blockquote type="cite">
            <pre wrap="" class="moz-quote-pre">The bitmap space will be allocated dynamically
+ * based on whether 7 or 14 bit VMIDs are supported.
+ */
+static unsigned long *vmid_mask;
+static unsigned long *vmid_flushing_needed;
+
+/*
+ * -2 here because:
+ *    - -1 is needed to get the maximal possible VMID
</pre>
          </blockquote>
          <pre wrap="" class="moz-quote-pre">I don't follow this part.
</pre>
        </blockquote>
        <pre wrap="" class="moz-quote-pre">
Probably, I'm missing something.

hgat.vmid is 7 bit long. BIT(7,U) = 1 &lt;&lt; 7 = 128 which is bigger
then 7 bit can cover (0b1000_0000 and 0x111_1111). Thereby the MAX_VMID is:
  BIT(7, U) - 1 (in case of RV32).
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Right, but then why -2? (Maybe this is moot now that you agreed that
INVALID_VMID can be defined differently.</pre>
    </blockquote>
    <pre>Yes, another one -1 was because how INVALID_VMID was defined.

</pre>
    <blockquote type="cite"
      cite="mid:80223fe3-7403-4026-9505-8826c318fabb@suse.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <blockquote type="cite">
          <pre wrap="" class="moz-quote-pre">VMIDLEN being permitted to be 0, how would you run more than one VM (e.g. Dom0)
on such a system?
</pre>
        </blockquote>
        <pre wrap="" class="moz-quote-pre">
Hmm, good question.

Then it will be needed to flush TLB on each VM switch by using
sbi_remote_hfence_gvma().
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Right, but just to be clear: That flush should not be conditional upon
VMIDLEN being 0. In whatever model you chose, the handling of this special
case should come out "natural".</pre>
    </blockquote>
    <pre>Sure. I have some ideas how to do it natural.

</pre>
    <blockquote type="cite"
      cite="mid:80223fe3-7403-4026-9505-8826c318fabb@suse.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <blockquote type="cite">
          <blockquote type="cite">
            <pre wrap="" class="moz-quote-pre">+        sbi_remote_hfence_gvma_vmid(d-&gt;dirty_cpumask, 0, 0, p2m-&gt;vmid);
</pre>
          </blockquote>
          <pre wrap="" class="moz-quote-pre">You're creating d; it cannot possibly have run on any CPU yet. IOW
d-&gt;dirty_cpumask will be reliably empty here. I think it would be hard to
avoid issuing the flush to all CPUs here in this scheme.
</pre>
        </blockquote>
        <pre wrap="" class="moz-quote-pre">
I didn't double check, but I was sure that in case d-&gt;dirty_cpumask is empty then
rfence for all CPUs will be send. But I was wrong about that.

What about just update a code of sbi_rfence_v02()?
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
I don't know, but dealing with the issue there feels wrong. However,
before deciding where to do something, it needs to be clear what you
actually want to achieve. To me at least, that's not clear at all.</pre>
    </blockquote>
    <pre data-start="127" data-end="271">I want to achieve the following behavior: if a mask is empty
(specifically, in our case <code data-start="215" data-end="233">d-&gt;dirty_cpumask</code>), then perform the flush
on all CPUs.</pre>
    <pre data-start="273" data-end="561">If you think it's not a good idea to change the current implementation
of <code data-start="347" data-end="365">sbi_rfence_v02()</code>, then I’ll just check if <code
    data-start="391" data-end="409">d-&gt;dirty_cpumask</code> is empty
before calling <code data-start="434" data-end="498">sbi_remote_hfence_gvma_vmid(d-&gt;dirty_cpumask, 0, 0, p2m-&gt;vmid)</code>.

If it is empty, I’ll call <code data-start="526" data-end="552">sbi_remote_hfence_gvma()</code> instead:
<div class="overflow-y-auto p-4" dir="ltr"><code
    class="whitespace-pre! language-c"><span><span><span
    class="hljs-keyword">  if</span></span><span> ( !cpumask_empty(d-&gt;dirty_cpumask) )
      sbi_remote_hfence_gvma_vmid(d-&gt;dirty_cpumask, </span><span><span
    class="hljs-number">0</span></span><span>, </span><span><span
    class="hljs-number">0</span></span><span>, p2m-&gt;vmid);
</span><span><span class="hljs-keyword">  else</span></span><span>
      sbi_remote_hfence_gvma(</span><span><span class="hljs-literal">NULL</span></span><span>, </span><span><span
    class="hljs-number">0</span></span><span>, </span><span><span
    class="hljs-number">0</span></span><span>);
</span></span></code></div></pre>
    <pre data-start="726" data-end="858">A similar check will be needed in <code
    data-start="760" data-end="788">p2m_force_tlb_flush_sync()</code>, which is
implemented in one of the following patches in this series.</pre>
    <pre data-start="860" data-end="1078">However, if we instead move the <code
    data-start="892" data-end="933">if ( !cpumask_empty(d-&gt;dirty_cpumask) )
</code>check into<code> </code><a class="moz-txt-link-freetext" href="https://gitlab.com/xen-project/xen/-/blob/staging/xen/arch/riscv/sbi.c?ref_type=heads#L178">https://gitlab.com/xen-project/xen/-/blob/staging/xen/arch/riscv/sbi.c?ref_type=heads#L178</a>,
we could call only:
  <code class="whitespace-pre! language-c"><span><span>sbi_remote_hfence_gvma_vmid(d-&gt;dirty_cpumask, </span><span><span
    class="hljs-number">0</span></span><span>, </span><span><span
    class="hljs-number">0</span></span><span>, p2m-&gt;vmid);
</span></span></code>and get the same effect, which might result in cleaner code overall
as we already have a similar check (cpumask == NULL) <code
    data-start="347" data-end="365">sbi_rfence_v02</code>() and a result of which
is just to send rfence operation to all CPUs.
</pre>
    <pre>
</pre>
    <blockquote type="cite"
      cite="mid:80223fe3-7403-4026-9505-8826c318fabb@suse.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <blockquote type="cite">
          <blockquote type="cite">
            <pre wrap="" class="moz-quote-pre">+    spin_unlock(&amp;vmid_alloc_lock);
+    return rc;
+}
+
+void p2m_free_vmid(struct domain *d)
+{
+    struct p2m_domain *p2m = p2m_get_hostp2m(d);
+
+    spin_lock(&amp;vmid_alloc_lock);
+
+    if ( p2m-&gt;vmid != INVALID_VMID )
+    {
+        clear_bit(p2m-&gt;vmid, vmid_mask);
+        set_bit(p2m-&gt;vmid, vmid_flushing_needed);
</pre>
          </blockquote>
          <pre wrap="" class="moz-quote-pre">Does this scheme really avoid any flushes (except near when the system is
about to go down)?

As to choice of functions - see above.
</pre>
        </blockquote>
        <pre wrap="" class="moz-quote-pre">
I think yes, so my idea was that if vmid isn't freed then we have enough free VMID
and in this case flush isn't needed as each vcpu has unique not-used yet VMID,
and if there is no free VMID then and error will return in p2m_alloc_vmid():
     if ( nr == MAX_VMID )
     {
         rc = -EBUSY;
         printk(XENLOG_ERR "p2m.c: dom%pd: VMID pool exhausted\n", d-&gt;domain_id);
         goto out;
     }
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Which, as said, is a problem when there are only very few VMIDs.

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">On other hand, if VMID was freed and then re-used in p2m_alloc_vmid(), then it means
that vmid_flushing_needed will have VMID bit set, what means that a TLB flush is needed.
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Let's assume over the uptime of a system you cycle through all VMIDs a thousand
times. While you manage to delay some TLB flushes, the percentage of ones actually
saved is going to be very low then.</pre>
    </blockquote>
    <pre>Then it is just better to update VMID allocation algo.

</pre>
    <blockquote type="cite"
      cite="mid:80223fe3-7403-4026-9505-8826c318fabb@suse.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <blockquote type="cite">
          <blockquote type="cite">
            <pre wrap="" class="moz-quote-pre">+    }
+
+    spin_unlock(&amp;vmid_alloc_lock);
+}
+
+int p2m_init(struct domain *d)
+{
+    struct p2m_domain *p2m = p2m_get_hostp2m(d);
+    int rc;
+
+    p2m-&gt;vmid = INVALID_VMID;
</pre>
          </blockquote>
          <pre wrap="" class="moz-quote-pre">Given the absence of callers of p2m_free_vmid() it's also not clear what use
this is.
</pre>
        </blockquote>
        <pre wrap="" class="moz-quote-pre">
Just mark that VMID for this domain wasn't yet allocated.

Anyway, it will be called from arch_domain_create() by arch_domain_destroy() so if the some
error happens during arch_domain_create() and p2m-&gt;vmid wasn't allocated yet (so is equal to
INVALID_VMID), it means that there is no sense to update vmid_mask or vmid_flushing_needed.
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
But only if you actually came through p2m_init() prior to the error. My point
is: If you allocate a VMID here anyway, why first set the field like this?</pre>
    </blockquote>
    <pre>Oh, got your point. Indeed, there is no sense.

</pre>
    <blockquote type="cite"
      cite="mid:80223fe3-7403-4026-9505-8826c318fabb@suse.com">
      <pre wrap="" class="moz-quote-pre">(Again, this is likely moot since the allocation scheme is likely to change
altogether.)</pre>
    </blockquote>
    <pre>Yes, it won't be really needed in the new allocation scheme.

Thanks.

~ Oleksii
</pre>
  </body>
</html>

--------------egtLgrWjPl4TsCOGsEkn1syp--

