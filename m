Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1831DAB33A6
	for <lists+xen-devel@lfdr.de>; Mon, 12 May 2025 11:33:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.981063.1367449 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uEPXa-0007DC-By; Mon, 12 May 2025 09:33:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 981063.1367449; Mon, 12 May 2025 09:33:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uEPXa-0007Bv-94; Mon, 12 May 2025 09:33:42 +0000
Received: by outflank-mailman (input) for mailman id 981063;
 Mon, 12 May 2025 09:33:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aA1K=X4=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1uEPXY-0007Bp-Tp
 for xen-devel@lists.xenproject.org; Mon, 12 May 2025 09:33:40 +0000
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [2a00:1450:4864:20::52d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2a87b79d-2f14-11f0-9ffb-bf95429c2676;
 Mon, 12 May 2025 11:33:30 +0200 (CEST)
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-5f63ac6ef0fso77360a12.1
 for <xen-devel@lists.xenproject.org>; Mon, 12 May 2025 02:33:30 -0700 (PDT)
Received: from [192.168.1.5] (user-109-243-64-38.play-internet.pl.
 [109.243.64.38]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5fe43357d45sm1697733a12.54.2025.05.12.02.33.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 May 2025 02:33:29 -0700 (PDT)
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
X-Inumbo-ID: 2a87b79d-2f14-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747042410; x=1747647210; darn=lists.xenproject.org;
        h=in-reply-to:content-language:references:cc:to:from:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0ln4VS6DP23i5PPDPc9eIW9sj98gvcZ5kmyUqXZJHQw=;
        b=Y4P8EEJzwgIabhsQydAy5Rap736NxzKJBKrpctMlExqins/N6cR5gCc0EuvXl97JnQ
         IsQ0SPs42mFo54ZC/sBgkAmSuv6zgxtvkzgGWsa5a7ZKcLSt9AHr7l+yoislZ6hQ/FU+
         9bsrgO7eLMVAAr+5NNH+I6GAmUmx3MJ6PUrmQ3iPYIss3HvZAWFQqQN3RSdYDfrcf0JW
         zvK+cA1AlRZXZuOOLKFMQXiSJR8/xqCW9pPrn1sBz+4rtYaKNzyUmD2AMCJh4jLhZwI3
         b/ZGrT6YH2X720CAy/zZe+Z8f7KMbluEL9rNyYy/ePstO1LAIsoqRcAZLm+VJSgZ879q
         OlEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747042410; x=1747647210;
        h=in-reply-to:content-language:references:cc:to:from:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=0ln4VS6DP23i5PPDPc9eIW9sj98gvcZ5kmyUqXZJHQw=;
        b=go1OXlsOdgpbX0iFS3DEVmgUaUYgqr3hILyJbDvyChjOZWRR68eVDltqTXcuJsvZyv
         mDRkI2Yz47j16ycBLhnnJCasOz9jFKTQRHwida23ux43SxUamWZI/dE8mXJ4Om75EQ68
         mBqtCRKXDdMPLQdJdW5kuZNL2/9GBUgEoJlHvt4HLDcpg3k+8RkhOS7/SOjUmRy3IEqN
         D4tVdVXHmS7laARN2g5YvsC9b9MtAosfd9QLgtB/8AzOoujr7ToKzvs++TPb7gOXugqY
         i+s0pUbtGGlx18OAYIlx+j2ZfE6OWPEUfN+Mey5OSS6WdqV47cAEmqrUWVh+oyqXvsqX
         kqSQ==
X-Forwarded-Encrypted: i=1; AJvYcCUkoOI0VWJ5LNyPkCHWkefqaknpByStRS/yKZGonxqPqoqK7h3eOcTeCz84bpbcR92i3pZoWA3fYEc=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxqBosy7YEOdjtjh3hAQIsEyEVUAau1istkfc4SAYMWUpihOeBb
	7QHt/xa3Qi/Hwt4xjXj4WngnGnVixgbJaqR0k5dzk8avMQctHIE8
X-Gm-Gg: ASbGncvIyF23H7jEUW1/k8nssNA4nV/SMd6r1G+ptTOXYjb4dyuxONcibeuJGIMtffS
	LBcp6KP9iW5Qp0DYuwMfnd56AYXYVnOVctRNvMROcz8QkirrAFFk85yYTVEwyWJIbH1hFTY8fEf
	P7JAC1J8be4Cwu7OlKUk2rIj5CUkXaBVgQ7XtMAu5jjXZBRO9lQJQREbIW4Jcmk+PXboxT7eXgC
	myoOBsLYgQpQ8+3+SdUe6JiWBZQdWfp3SAdkzLCrtIg5GhXpu0yEitMZNMfgESDc5lzk3wUc/Oh
	8y0XuKbYyl3Dplxx228+VazqeNYPQ+ZvjMU5TEOZh//0TqGYRKgSwX280Cti9qqZ7Q/GTYYxJze
	d+JW/Y57PbnxuVyZUqDqxXNTk
X-Google-Smtp-Source: AGHT+IG0EDu/7Ch8JdgS5A9imZV1onvlMNgrzOXTVC3oCUw/B2X1nXdQ8L/dXjFr0e6jF2RWYBkXuQ==
X-Received: by 2002:a05:6402:1ecd:b0:5fa:bb9d:9677 with SMTP id 4fb4d7f45d1cf-5fca1619c99mr8926539a12.11.1747042409932;
        Mon, 12 May 2025 02:33:29 -0700 (PDT)
Content-Type: multipart/alternative;
 boundary="------------BRwNd3NIEZU91JKGntAS0xEt"
Message-ID: <7aa60d22-b2c6-4e11-bb40-c5d6d66a6182@gmail.com>
Date: Mon, 12 May 2025 11:33:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/6] xen/riscv: introduce things necessary for p2m
 initialization
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>
References: <cover.1746805907.git.oleksii.kurochko@gmail.com>
 <0a03d1f38649cfd8656147f209652dff0f9d170c.1746805907.git.oleksii.kurochko@gmail.com>
 <70186bd9-20b6-48a2-9dd0-25cdc30e81f0@citrix.com>
 <b7dc409e-d18c-40eb-bbdf-86ba43b5ce74@gmail.com>
Content-Language: en-US
In-Reply-To: <b7dc409e-d18c-40eb-bbdf-86ba43b5ce74@gmail.com>

This is a multi-part message in MIME format.
--------------BRwNd3NIEZU91JKGntAS0xEt
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 5/12/25 11:24 AM, Oleksii Kurochko wrote:
>
>
> On 5/9/25 6:14 PM, Andrew Cooper wrote:
>> On 09/05/2025 4:57 pm, Oleksii Kurochko wrote:
>>> diff --git a/xen/arch/riscv/p2m.c b/xen/arch/riscv/p2m.c
>>> new file mode 100644
>>> index 0000000000..ad4beef8f9
>>> --- /dev/null
>>> +++ b/xen/arch/riscv/p2m.c
>>> @@ -0,0 +1,168 @@
>>> +#include <xen/domain_page.h>
>>> +#include <xen/iommu.h>
>>> +#include <xen/lib.h>
>>> +#include <xen/mm.h>
>>> +#include <xen/pfn.h>
>>> +#include <xen/rwlock.h>
>>> +#include <xen/sched.h>
>>> +#include <xen/spinlock.h>
>>> +
>>> +#include <asm/page.h>
>>> +#include <asm/p2m.h>
>>> +
>>> +/*
>>> + * Force a synchronous P2M TLB flush.
>>> + *
>>> + * Must be called with the p2m lock held.
>>> + *
>>> + * TODO: add support of flushing TLB connected to VMID.
>>> + */
>>> +static void p2m_force_tlb_flush_sync(struct p2m_domain *p2m)
>>> +{
>>> +    ASSERT(p2m_is_write_locked(p2m));
>>> +
>>> +    /*
>>> +     * TODO: shouldn't be this flush done for each physical CPU?
>>> +     *       If yes, then SBI call sbi_remote_hfence_gvma() could
>>> +     *       be used for that.
>>> +     */
>>> +#if defined(__riscv_hh) || defined(__riscv_h)
>>> +    asm volatile ( "hfence.gvma" ::: "memory" );
>>> +#else
>>> +    asm volatile ( ".insn r 0x73, 0x0, 0x31, x0, x0, x0" ::: "memory" );
>>> +#endif
>> TLB flushing needs to happen for each pCPU which potentially has cached
>> a mapping.
>>
>> In other arches, this is tracked by d->dirty_cpumask which is the bitmap
>> of pCPUs where this domain is scheduled.
> I could only find usage of|d->dirty_cpumask| in x86 and common code (grant
> tables) for flushing the TLB. However, it seems that|d->dirty_cpumask| is
> not set anywhere for ARM. Is it sufficient to set a bit in|d->dirty_cpumask|
> in|startup_cpu_idle_loop()|?

And one more thing.
If|d->dirty_cpumask| is empty (for example, on p2m initialization stage) then
p2m TLB flush could be skipped at all, right?

~ Oleksii

> In addition, it’s also necessary to set and clear bits in|d->dirty_cpumask|
> during|context_switch|, correct? Set it before switching from the previous
> domain, and clear it after switching to the new domain?
> Also, when a bit is set in|d->dirty_cpumask|, the|v->processor| value is also
> stored in|v->dirty_cpu|. Is this needed to track which processor is
> currently being used for the vCPU?
>> CPUs need to flush their TLBs before removing themselves from
>> d->dirty_cpumask, which is typically done during context switch, but it
>> means that to flush the P2M, you only need to IPI a subset of CPUs.
> I can't find where the P2M flush happens for x86/ARM. Could you please point me
> to where it is handled?
>
> Also, I found guest_flush_tlb_mask() for x86. I assume that it is x86 specific
> and generally it is enough to have only flush_tlb_mask(), right?
>
> Thanks in advance for the answers.
> ~ Oleksii
--------------BRwNd3NIEZU91JKGntAS0xEt
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
    <div class="moz-cite-prefix">On 5/12/25 11:24 AM, Oleksii Kurochko
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:b7dc409e-d18c-40eb-bbdf-86ba43b5ce74@gmail.com">
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      <p><br>
      </p>
      <div class="moz-cite-prefix">On 5/9/25 6:14 PM, Andrew Cooper
        wrote:<br>
      </div>
      <blockquote type="cite"
        cite="mid:70186bd9-20b6-48a2-9dd0-25cdc30e81f0@citrix.com">
        <pre wrap="" class="moz-quote-pre">On 09/05/2025 4:57 pm, Oleksii Kurochko wrote:
</pre>
        <blockquote type="cite">
          <pre wrap="" class="moz-quote-pre">diff --git a/xen/arch/riscv/p2m.c b/xen/arch/riscv/p2m.c
new file mode 100644
index 0000000000..ad4beef8f9
--- /dev/null
+++ b/xen/arch/riscv/p2m.c
@@ -0,0 +1,168 @@
+#include &lt;xen/domain_page.h&gt;
+#include &lt;xen/iommu.h&gt;
+#include &lt;xen/lib.h&gt;
+#include &lt;xen/mm.h&gt;
+#include &lt;xen/pfn.h&gt;
+#include &lt;xen/rwlock.h&gt;
+#include &lt;xen/sched.h&gt;
+#include &lt;xen/spinlock.h&gt;
+
+#include &lt;asm/page.h&gt;
+#include &lt;asm/p2m.h&gt;
+
+/*
+ * Force a synchronous P2M TLB flush.
+ *
+ * Must be called with the p2m lock held.
+ *
+ * TODO: add support of flushing TLB connected to VMID.
+ */
+static void p2m_force_tlb_flush_sync(struct p2m_domain *p2m)
+{
+    ASSERT(p2m_is_write_locked(p2m));
+
+    /*
+     * TODO: shouldn't be this flush done for each physical CPU?
+     *       If yes, then SBI call sbi_remote_hfence_gvma() could
+     *       be used for that.
+     */
+#if defined(__riscv_hh) || defined(__riscv_h)
+    asm volatile ( "hfence.gvma" ::: "memory" );
+#else
+    asm volatile ( ".insn r 0x73, 0x0, 0x31, x0, x0, x0" ::: "memory" );
+#endif
</pre>
        </blockquote>
        <pre wrap="" class="moz-quote-pre">TLB flushing needs to happen for each pCPU which potentially has cached
a mapping.

In other arches, this is tracked by d-&gt;dirty_cpumask which is the bitmap
of pCPUs where this domain is scheduled.</pre>
      </blockquote>
      <pre data-start="59" data-end="317" class="">I could only find usage of <code
      data-start="86" data-end="104">d-&gt;dirty_cpumask</code> in x86 and common code (grant
tables) for flushing the TLB. However, it seems that <code
      data-start="188" data-end="206">d-&gt;dirty_cpumask</code> is
not set anywhere for ARM. Is it sufficient to set a bit in <code
      data-start="269" data-end="287">d-&gt;dirty_cpumask</code>
in <code data-start="291" data-end="316">startup_cpu_idle_loop()</code>?</pre>
    </blockquote>
    <pre>And one more thing.
If <code data-start="188" data-end="206">d-&gt;dirty_cpumask</code> is empty (for example, on p2m initialization stage) then
p2m TLB flush could be skipped at all, right?

~ Oleksii
</pre>
    <blockquote type="cite"
      cite="mid:b7dc409e-d18c-40eb-bbdf-86ba43b5ce74@gmail.com">
      <pre data-start="319" data-end="527" class="">In addition, it’s also necessary to set and clear bits in <code
      data-start="377" data-end="395">d-&gt;dirty_cpumask</code>
during <code data-start="403" data-end="419">context_switch</code>, correct? Set it before switching from the previous
domain, and clear it after switching to the new domain?</pre>
      <pre data-start="529" data-end="712" class="">Also, when a bit is set in <code
      data-start="556" data-end="574">d-&gt;dirty_cpumask</code>, the <code
      data-start="580" data-end="594">v-&gt;processor</code> value is also
stored in <code data-start="619" data-end="633">v-&gt;dirty_cpu</code>. Is this needed to track which processor is
currently being used for the vCPU?</pre>
      <blockquote type="cite"
        cite="mid:70186bd9-20b6-48a2-9dd0-25cdc30e81f0@citrix.com">
        <pre wrap="" class="moz-quote-pre">CPUs need to flush their TLBs before removing themselves from
d-&gt;dirty_cpumask, which is typically done during context switch, but it
means that to flush the P2M, you only need to IPI a subset of CPUs.</pre>
      </blockquote>
      <pre>I can't find where the P2M flush happens for x86/ARM. Could you please point me
to where it is handled?

Also, I found guest_flush_tlb_mask() for x86. I assume that it is x86 specific
and generally it is enough to have only flush_tlb_mask(), right?

Thanks in advance for the answers.
</pre>
      <pre>~ Oleksii
</pre>
    </blockquote>
  </body>
</html>

--------------BRwNd3NIEZU91JKGntAS0xEt--

