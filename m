Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 53F23AE611A
	for <lists+xen-devel@lfdr.de>; Tue, 24 Jun 2025 11:47:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1023501.1399487 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uU0EZ-0006N8-Uc; Tue, 24 Jun 2025 09:46:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1023501.1399487; Tue, 24 Jun 2025 09:46:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uU0EZ-0006LR-Pz; Tue, 24 Jun 2025 09:46:31 +0000
Received: by outflank-mailman (input) for mailman id 1023501;
 Tue, 24 Jun 2025 09:46:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ctQ0=ZH=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1uU0EY-0006LJ-Kn
 for xen-devel@lists.xenproject.org; Tue, 24 Jun 2025 09:46:30 +0000
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [2a00:1450:4864:20::634])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 141d5549-50e0-11f0-b894-0df219b8e170;
 Tue, 24 Jun 2025 11:46:19 +0200 (CEST)
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-addda47ebeaso47655666b.1
 for <xen-devel@lists.xenproject.org>; Tue, 24 Jun 2025 02:46:19 -0700 (PDT)
Received: from [192.168.1.5] (user-109-243-64-38.play-internet.pl.
 [109.243.64.38]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ae054083c87sm841373066b.89.2025.06.24.02.46.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 24 Jun 2025 02:46:17 -0700 (PDT)
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
X-Inumbo-ID: 141d5549-50e0-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750758378; x=1751363178; darn=lists.xenproject.org;
        h=in-reply-to:content-language:references:cc:to:subject:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1Q7zDaHi7VY/WUKV4VqHjUqLF+P4rmn96cO/MBcraAg=;
        b=iN8DaMggKRIazQnTwB3x6GBKlFiAIWh4D4/Q1gwpXVOwsG9CS4dLgvKGt5gjt6Np/8
         VpwpdE8x6AKOdk76G8G7BBTYqeOdjsAIRj81ioRF2hBofwVKROC5UMNb49XoQjUk54Tw
         TEM55K4bjGEghbzo77ioyeQhwNfmrfsIYOzs5srG0NiHo31idUYZYW5epbJ60Qepu+Kb
         gDMs6iMXCZDGCZeL6NE0Ox3H/w1Xtv60OCct4vh4k+OgBljco9D8uQ2QZylYaEuqXrWZ
         lr66jgCVU0DCUo5muZYbKIuI6l2REzWO70KXjSYtVHvJbNq9fkhyCP0TdGmszFhsM6E2
         I4Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750758378; x=1751363178;
        h=in-reply-to:content-language:references:cc:to:subject:from
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=1Q7zDaHi7VY/WUKV4VqHjUqLF+P4rmn96cO/MBcraAg=;
        b=JmcySxZUAfMGlRZ9ScPUxXR9Querhz/AneqaXoHQLmVD5+N6xYBqNe/Vz1b944uhZe
         D0sVKzJdsRPPHW/tvDTX5pRvGgTx2cWwywGHAki0uWGpAaaGRqOEQCaHx5K05+rE+yGh
         dqjfN46xW3fktqYEkgnMqhOSqakFv8rjqToGrd1jFWD43KECZsSauBZZCH3zsuUPx0RM
         2ypSVxfpDMtzewJs3GP2rlQbLezKtDyNjaLOMwqejlgvcYc6w+XnHfmTgniPA3zVj+uH
         CoSjHsg7Pcwrkh/QVIs9drPEgcaZpx6bDxcZhxJYkI60JpE3gQ50Tqk259K0aFxknu9E
         PO1w==
X-Forwarded-Encrypted: i=1; AJvYcCWQkGFltJFNp7liDT5V6hTjKQnrxYwHYgkw4A4+VEMQyGtP5//C5Od+2PMfJjWMCOmznP2Pxgh1TjA=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzF04Kk1uREThB2JzUsCMb79hzNzinIJS7rAVP9xgKqV7juo+cl
	fS/7/YiUwe4u1HO+IwQqk77IRDixByEK6SaXiTwo3lqCChD6dntO44OK
X-Gm-Gg: ASbGncuw+mYeeO7cyme4hpasFeEkXoIPWPrAUi2PVfazc5kWJ+lF+tIOpt9oyYqJxhc
	q921cE5U9hlptST2u/u2hEobMr9G2ZGByi6HpOdN0FAPdqiuQI9mUHN48a8yTDms3TLkkwmHBrs
	lnuQXT6ocfu0vzY2O+yifPPHp6jjhWa1I5OS2XtxbAn0uS28rVmgH7yco0VNgrXovcFGHIPmbpt
	kXk21/7K0u05cW5hpOEybMH+t84sVhgVpMGK9ajpF6YK0bzotnmMsI0aeASuNbSORUMmllpxDOK
	/pFeQiSJHD1knMHo2M9bzZXb9Tqe3K7LrKStin8NH7hD8rHZyekJOhBuk3j8ynEel9R07nMit7o
	QjVdiKf1y1cMelGFsQmfhloTfI8gQ0ddUVhk=
X-Google-Smtp-Source: AGHT+IHS9fMjQsyWzq24b1arCff0vE8jvrYpPJ+OyJbOOv1TcUfbFCQB7SQ3yjB3SzQWA6f3P2wNaQ==
X-Received: by 2002:a17:907:3da3:b0:ad4:f517:ca3 with SMTP id a640c23a62f3a-ae05794251bmr1633320766b.20.1750758377877;
        Tue, 24 Jun 2025 02:46:17 -0700 (PDT)
Content-Type: multipart/alternative;
 boundary="------------0njIQvGmM3eD3vN4bb8on5El"
Message-ID: <145f71c2-643e-4839-a2ae-0bc1f049db74@gmail.com>
Date: Tue, 24 Jun 2025 11:46:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
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
Content-Language: en-US
In-Reply-To: <d747fd23-9ac3-49d2-8a5e-699290cef3f4@suse.com>

This is a multi-part message in MIME format.
--------------0njIQvGmM3eD3vN4bb8on5El
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 6/18/25 5:46 PM, Jan Beulich wrote:
> On 10.06.2025 15:05, Oleksii Kurochko wrote:
>> Implementation is based on Arm code with some minor changes:
>>   - Re-define INVALID_VMID.
>>   - Re-define MAX_VMID.
>>   - Add TLB flushing when VMID is re-used.
>>
>> Also, as a part of this path structure p2m_domain is introduced with
>> vmid member inside it. It is necessary for VMID management functions.
>>
>> Add a bitmap-based allocator to manage VMID space, supporting up to 127
>> VMIDs on RV32 and 16,383 on RV64 platforms, in accordance with the
>> architecture's hgatp VMID field (RV32 - 7 bit long, others - 14 bit long).
>>
>> Reserve the highest VMID as INVALID_VMID to ensure it's not reused.
> Why must that VMID not be (re)used? INVALID_VMID can be any value wider
> than the hgatp.VMID field.

Oh, agree it could be just any value wider tan hgatp.VMID filed. I forgot
about that hgatp.VMID is only 14-bit long value. So we have two extra bits
in uint16_t.

>> --- /dev/null
>> +++ b/xen/arch/riscv/p2m.c
>> @@ -0,0 +1,115 @@
>> +#include <xen/bitops.h>
>> +#include <xen/lib.h>
>> +#include <xen/sched.h>
>> +#include <xen/spinlock.h>
>> +#include <xen/xvmalloc.h>
>> +
>> +#include <asm/p2m.h>
>> +#include <asm/sbi.h>
>> +
>> +static spinlock_t vmid_alloc_lock = SPIN_LOCK_UNLOCKED;
>> +
>> +/*
>> + * hgatp's VMID field is 7 or 14 bits. RV64 may support 14-bit VMID.
>> + * Using a bitmap here limits us to 127 (2^7 - 1) or 16383 (2^14 - 1)
>> + * concurrent domains.
> Which is pretty limiting especially in the RV32 case. Hence why we don't
> assign a permanent ID to VMs on x86, but rather manage IDs per-CPU (note:
> not per-vCPU).

Good point.

I don't believe anyone will use RV32.
For RV64, the available ID space seems sufficiently large.

However, if it turns out that the value isn't large enough even for RV64,
I can rework it to manage IDs per physical CPU.
Wouldn't that approach result in more TLB entries being flushed compared
to per-vCPU allocation, potentially leading to slightly worse performance?

What about then to allocate VMID per-domain?

>> The bitmap space will be allocated dynamically
>> + * based on whether 7 or 14 bit VMIDs are supported.
>> + */
>> +static unsigned long *vmid_mask;
>> +static unsigned long *vmid_flushing_needed;
>> +
>> +/*
>> + * -2 here because:
>> + *    - -1 is needed to get the maximal possible VMID
> I don't follow this part.

Probably, I'm missing something.

hgat.vmid is 7 bit long. BIT(7,U) = 1 << 7 = 128 which is bigger
then 7 bit can cover (0b1000_0000 and 0x111_1111). Thereby the MAX_VMID is:
  BIT(7, U) - 1 (in case of RV32).

>> + */
>> +#ifdef CONFIG_RISCV_32
>> +#define MAX_VMID (BIT(7, U) - 2)
>> +#else
> Better "#elif defined(CONFIG_RISCV_64)"?

First, I read the spec as for other bitness except 32 it will be 14 bit long, but I re-read it and
it is true only for HSXLEN=64, so RV128 will/can have different amount of bit for VMID. I will
update to "#elif defined(CONFIG_RISCV_64)" + #error "Define MAX_VMID" if bitness isn't 32 or 64.


>> +{
>> +    /*
>> +     * Allocate space for vmid_mask and vmid_flushing_needed
>> +     * based on INVALID_VMID as it is the max possible VMID which just
>> +     * was reserved to be INVALID_VMID.
>> +     */
>> +    vmid_mask = xvzalloc_array(unsigned long, BITS_TO_LONGS(INVALID_VMID));
>> +    vmid_flushing_needed =
>> +        xvzalloc_array(unsigned long, BITS_TO_LONGS(INVALID_VMID));
> These both want to use MAX_VMID + 1; there's no logical connection here to
> INVALID_VMID.
>
> Furthermore don't you first need to determine how many bits hgatp.VMID actually
> implements? The 7 and 14 bits respectively are maximum values only, after all.

I missed that it depends on VMIDLEN:
```
The number of VMID bits is UNSPECIFIED and may be zero. The number of implemented VMID bits,
termed VMIDLEN, may be determined by writing one to every bit position in the VMID field, then
reading back the value in hgatp to see which bit positions in the VMID field hold a one. The least-
significant bits of VMID are implemented first: that is, if VMIDLEN > 0, VMID[VMIDLEN-1:0] is
writable. The maximal value of VMIDLEN, termed VMIDMAX, is 7 for Sv32x4 or 14 for Sv39x4,
Sv48x4, and Sv57x4.
```
So yes, I have to determine first how many bits are supported by an implementation.

> VMIDLEN being permitted to be 0, how would you run more than one VM (e.g. Dom0)
> on such a system?

Hmm, good question.

Then it will be needed to flush TLB on each VM switch by using
sbi_remote_hfence_gvma().

>> +    if ( !vmid_mask || !vmid_flushing_needed )
>> +        panic("Could not allocate VMID bitmap space or VMID flushing map\n");
>> +
>> +    set_bit(INVALID_VMID, vmid_mask);
> If (see above) this is really needed, __set_bit() please.
>
>> +}
>> +
>> +int p2m_alloc_vmid(struct domain *d)
> Looks like this can be static? (p2m_free_vmid() has no caller at all, so
> it's not clear what use it is going to be.)

It really can be static. And p2m_free_vmid() too, but as there is no caller
of p2m_free_vmid() probably it makes sense to do in the following way:
   /* Uncomment static when p2m_free_vmid() will be called. */
   /* static */ void p2m_free_vmid(struct domain *d)
Or just drop for the moment when it will be really needed.



>> +        goto out;
>> +    }
>> +
>> +    set_bit(nr, vmid_mask);
> Since you do this under lock, even here __set_bit() ought to be sufficient.
>
>> +    if ( test_bit(p2m->vmid, vmid_flushing_needed) )
>> +    {
>> +        clear_bit(p2m->vmid, vmid_flushing_needed);
> And __clear_bit() here, or yet better use __test_and_clear_bit() in the if().
>
>> +        sbi_remote_hfence_gvma_vmid(d->dirty_cpumask, 0, 0, p2m->vmid);
> You're creating d; it cannot possibly have run on any CPU yet. IOW
> d->dirty_cpumask will be reliably empty here. I think it would be hard to
> avoid issuing the flush to all CPUs here in this scheme.

I didn't double check, but I was sure that in case d->dirty_cpumask is empty then
rfence for all CPUs will be send. But I was wrong about that.

What about just update a code of sbi_rfence_v02()?

At the moment, we have check if a pointer to cpu_mask isn't NULL and if NULL then
do rfence for all CPUs:

static int cf_check sbi_rfence_v02(unsigned long fid,
                                    const cpumask_t *cpu_mask,
                                    vaddr_t start, size_t size,
                                    unsigned long arg4, unsigned long arg5)
{
    ...

     /*
      * hart_mask_base can be set to -1 to indicate that hart_mask can be
      * ignored and all available harts must be considered.
      */
     if ( !cpu_mask )
         return sbi_rfence_v02_real(fid, 0UL, -1UL, start, size, arg4);
    ...

What about  just to add here:
     if ( !cpu_mask || cpumask_empty(cpu_mask) )

Does it make sense?

>> +    spin_unlock(&vmid_alloc_lock);
>> +    return rc;
>> +}
>> +
>> +void p2m_free_vmid(struct domain *d)
>> +{
>> +    struct p2m_domain *p2m = p2m_get_hostp2m(d);
>> +
>> +    spin_lock(&vmid_alloc_lock);
>> +
>> +    if ( p2m->vmid != INVALID_VMID )
>> +    {
>> +        clear_bit(p2m->vmid, vmid_mask);
>> +        set_bit(p2m->vmid, vmid_flushing_needed);
> Does this scheme really avoid any flushes (except near when the system is
> about to go down)?
>
> As to choice of functions - see above.

I think yes, so my idea was that if vmid isn't freed then we have enough free VMID
and in this case flush isn't needed as each vcpu has unique not-used yet VMID,
and if there is no free VMID then and error will return in p2m_alloc_vmid():
     if ( nr == MAX_VMID )
     {
         rc = -EBUSY;
         printk(XENLOG_ERR "p2m.c: dom%pd: VMID pool exhausted\n", d->domain_id);
         goto out;
     }

On other hand, if VMID was freed and then re-used in p2m_alloc_vmid(), then it means
that vmid_flushing_needed will have VMID bit set, what means that a TLB flush is needed.

>
>> +    }
>> +
>> +    spin_unlock(&vmid_alloc_lock);
>> +}
>> +
>> +int p2m_init(struct domain *d)
>> +{
>> +    struct p2m_domain *p2m = p2m_get_hostp2m(d);
>> +    int rc;
>> +
>> +    p2m->vmid = INVALID_VMID;
> Given the absence of callers of p2m_free_vmid() it's also not clear what use
> this is.

Just mark that VMID for this domain wasn't yet allocated.

Anyway, it will be called from arch_domain_create() by arch_domain_destroy() so if the some
error happens during arch_domain_create() and p2m->vmid wasn't allocated yet (so is equal to
INVALID_VMID), it means that there is no sense to update vmid_mask or vmid_flushing_needed.

~ Oleksii


--------------0njIQvGmM3eD3vN4bb8on5El
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 6/18/25 5:46 PM, Jan Beulich wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:d747fd23-9ac3-49d2-8a5e-699290cef3f4@suse.com">
      <pre wrap="" class="moz-quote-pre">On 10.06.2025 15:05, Oleksii Kurochko wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">Implementation is based on Arm code with some minor changes:
 - Re-define INVALID_VMID.
 - Re-define MAX_VMID.
 - Add TLB flushing when VMID is re-used.

Also, as a part of this path structure p2m_domain is introduced with
vmid member inside it. It is necessary for VMID management functions.

Add a bitmap-based allocator to manage VMID space, supporting up to 127
VMIDs on RV32 and 16,383 on RV64 platforms, in accordance with the
architecture's hgatp VMID field (RV32 - 7 bit long, others - 14 bit long).

Reserve the highest VMID as INVALID_VMID to ensure it's not reused.
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">Why must that VMID not be (re)used? INVALID_VMID can be any value wider
than the hgatp.VMID field.</pre>
    </blockquote>
    <pre>Oh, agree it could be just any value wider tan hgatp.VMID filed. I forgot
about that hgatp.VMID is only 14-bit long value. So we have two extra bits
in uint16_t.
</pre>
    <blockquote type="cite"
      cite="mid:d747fd23-9ac3-49d2-8a5e-699290cef3f4@suse.com">
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
not per-vCPU).</pre>
    </blockquote>
    <pre data-start="62" data-end="73">Good point.</pre>
    <pre data-start="75" data-end="295">I don't believe anyone will use RV32.
For RV64, the available ID space seems sufficiently large.

However, if it turns out that the value isn't large enough even for RV64,
I can rework it to manage IDs per physical CPU.
Wouldn't that approach result in more TLB entries being flushed compared
to per-vCPU allocation, potentially leading to slightly worse performance?

What about then to allocate VMID per-domain?
</pre>
    <blockquote type="cite"
      cite="mid:d747fd23-9ac3-49d2-8a5e-699290cef3f4@suse.com">
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
    <pre>Probably, I'm missing something.

hgat.vmid is 7 bit long. BIT(7,U) = 1 &lt;&lt; 7 = 128 which is bigger
then 7 bit can cover (0b1000_0000 and 0x111_1111). Thereby the MAX_VMID is:
 BIT(7, U) - 1 (in case of RV32).

</pre>
    <blockquote type="cite"
      cite="mid:d747fd23-9ac3-49d2-8a5e-699290cef3f4@suse.com">
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+ */
+#ifdef CONFIG_RISCV_32
+#define MAX_VMID (BIT(7, U) - 2)
+#else
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">Better "#elif defined(CONFIG_RISCV_64)"?</pre>
    </blockquote>
    <pre>First, I read the spec as for other bitness except 32 it will be 14 bit long, but I re-read it and
it is true only for HSXLEN=64, so RV128 will/can have different amount of bit for VMID. I will
update to "#elif defined(CONFIG_RISCV_64)" + #error "Define MAX_VMID" if bitness isn't 32 or 64.


</pre>
    <blockquote type="cite"
      cite="mid:d747fd23-9ac3-49d2-8a5e-699290cef3f4@suse.com">
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+{
+    /*
+     * Allocate space for vmid_mask and vmid_flushing_needed
+     * based on INVALID_VMID as it is the max possible VMID which just
+     * was reserved to be INVALID_VMID.
+     */
+    vmid_mask = xvzalloc_array(unsigned long, BITS_TO_LONGS(INVALID_VMID));
+    vmid_flushing_needed =
+        xvzalloc_array(unsigned long, BITS_TO_LONGS(INVALID_VMID));
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">These both want to use MAX_VMID + 1; there's no logical connection here to
INVALID_VMID.

Furthermore don't you first need to determine how many bits hgatp.VMID actually
implements? The 7 and 14 bits respectively are maximum values only, after all.</pre>
    </blockquote>
    <pre>I missed that it depends on VMIDLEN:
```
The number of VMID bits is UNSPECIFIED and may be zero. The number of implemented VMID bits,
termed VMIDLEN, may be determined by writing one to every bit position in the VMID field, then
reading back the value in hgatp to see which bit positions in the VMID field hold a one. The least-
significant bits of VMID are implemented first: that is, if VMIDLEN &gt; 0, VMID[VMIDLEN-1:0] is
writable. The maximal value of VMIDLEN, termed VMIDMAX, is 7 for Sv32x4 or 14 for Sv39x4,
Sv48x4, and Sv57x4.
```
So yes, I have to determine first how many bits are supported by an implementation.

</pre>
    <blockquote type="cite"
      cite="mid:d747fd23-9ac3-49d2-8a5e-699290cef3f4@suse.com">
      <pre wrap="" class="moz-quote-pre">VMIDLEN being permitted to be 0, how would you run more than one VM (e.g. Dom0)
on such a system?</pre>
    </blockquote>
    <pre>Hmm, good question.

Then it will be needed to flush TLB on each VM switch by using
sbi_remote_hfence_gvma().

</pre>
    <blockquote type="cite"
      cite="mid:d747fd23-9ac3-49d2-8a5e-699290cef3f4@suse.com">
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+    if ( !vmid_mask || !vmid_flushing_needed )
+        panic("Could not allocate VMID bitmap space or VMID flushing map\n");
+
+    set_bit(INVALID_VMID, vmid_mask);
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">If (see above) this is really needed, __set_bit() please.

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+}
+
+int p2m_alloc_vmid(struct domain *d)
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">Looks like this can be static? (p2m_free_vmid() has no caller at all, so
it's not clear what use it is going to be.)</pre>
    </blockquote>
    <pre>It really can be static. And p2m_free_vmid() too, but as there is no caller
of p2m_free_vmid() probably it makes sense to do in the following way:
  /* Uncomment static when p2m_free_vmid() will be called. */
  /* static */ void p2m_free_vmid(struct domain *d)
Or just drop for the moment when it will be really needed.



</pre>
    <blockquote type="cite"
      cite="mid:d747fd23-9ac3-49d2-8a5e-699290cef3f4@suse.com">
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+        goto out;
+    }
+
+    set_bit(nr, vmid_mask);
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">Since you do this under lock, even here __set_bit() ought to be sufficient.

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+    if ( test_bit(p2m-&gt;vmid, vmid_flushing_needed) )
+    {
+        clear_bit(p2m-&gt;vmid, vmid_flushing_needed);
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">And __clear_bit() here, or yet better use __test_and_clear_bit() in the if().

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+        sbi_remote_hfence_gvma_vmid(d-&gt;dirty_cpumask, 0, 0, p2m-&gt;vmid);
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">You're creating d; it cannot possibly have run on any CPU yet. IOW
d-&gt;dirty_cpumask will be reliably empty here. I think it would be hard to
avoid issuing the flush to all CPUs here in this scheme.</pre>
    </blockquote>
    <pre>I didn't double check, but I was sure that in case d-&gt;dirty_cpumask is empty then
rfence for all CPUs will be send. But I was wrong about that.

What about just update a code of sbi_rfence_v02()?

At the moment, we have check if a pointer to cpu_mask isn't NULL and if NULL then
do rfence for all CPUs:

static int cf_check sbi_rfence_v02(unsigned long fid,
                                   const cpumask_t *cpu_mask,
                                   vaddr_t start, size_t size,
                                   unsigned long arg4, unsigned long arg5)
{
   ...

    /*
     * hart_mask_base can be set to -1 to indicate that hart_mask can be
     * ignored and all available harts must be considered.
     */
    if ( !cpu_mask )
        return sbi_rfence_v02_real(fid, 0UL, -1UL, start, size, arg4);
   ...

What about  just to add here:
    if ( !cpu_mask || cpumask_empty(cpu_mask) )

Does it make sense?

</pre>
    <blockquote type="cite"
      cite="mid:d747fd23-9ac3-49d2-8a5e-699290cef3f4@suse.com">
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

As to choice of functions - see above.</pre>
    </blockquote>
    <pre>I think yes, so my idea was that if vmid isn't freed then we have enough free VMID
and in this case flush isn't needed as each vcpu has unique not-used yet VMID,
and if there is no free VMID then and error will return in p2m_alloc_vmid():
    if ( nr == MAX_VMID )
    {
        rc = -EBUSY;
        printk(XENLOG_ERR "p2m.c: dom%pd: VMID pool exhausted\n", d-&gt;domain_id);
        goto out;
    }

On other hand, if VMID was freed and then re-used in p2m_alloc_vmid(), then it means
that vmid_flushing_needed will have VMID bit set, what means that a TLB flush is needed.

</pre>
    <blockquote type="cite"
      cite="mid:d747fd23-9ac3-49d2-8a5e-699290cef3f4@suse.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
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
this is.</pre>
    </blockquote>
    <pre>Just mark that VMID for this domain wasn't yet allocated.

Anyway, it will be called from arch_domain_create() by arch_domain_destroy() so if the some
error happens during arch_domain_create() and p2m-&gt;vmid wasn't allocated yet (so is equal to
INVALID_VMID), it means that there is no sense to update vmid_mask or vmid_flushing_needed.

~ Oleksii</pre>
    <br>
  </body>
</html>

--------------0njIQvGmM3eD3vN4bb8on5El--

