Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DAD4AAB334C
	for <lists+xen-devel@lfdr.de>; Mon, 12 May 2025 11:24:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.981044.1367440 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uEPOx-00055p-EE; Mon, 12 May 2025 09:24:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 981044.1367440; Mon, 12 May 2025 09:24:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uEPOx-00053m-BJ; Mon, 12 May 2025 09:24:47 +0000
Received: by outflank-mailman (input) for mailman id 981044;
 Mon, 12 May 2025 09:24:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aA1K=X4=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1uEPOw-0004jZ-0d
 for xen-devel@lists.xenproject.org; Mon, 12 May 2025 09:24:46 +0000
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [2a00:1450:4864:20::633])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f0c26652-2f12-11f0-9ffb-bf95429c2676;
 Mon, 12 May 2025 11:24:44 +0200 (CEST)
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-ad24b7e0331so188597766b.0
 for <xen-devel@lists.xenproject.org>; Mon, 12 May 2025 02:24:44 -0700 (PDT)
Received: from [192.168.1.5] (user-109-243-64-38.play-internet.pl.
 [109.243.64.38]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ad21985858asm595144466b.176.2025.05.12.02.24.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 May 2025 02:24:43 -0700 (PDT)
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
X-Inumbo-ID: f0c26652-2f12-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747041884; x=1747646684; darn=lists.xenproject.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r9qugMwnRVX+qcsYC3JfFHNgzHHnGrz9+0ecOMYkWLA=;
        b=AX2mUIU4YMA2Yy3NUL3c9q8pzmFN2osd+r2Bb0s13+jGnRW74KjrtHMsltsgnyHhNe
         jgPPVtpMQQCYh8zBb3gfL9XKaJmA+gDJn88Lr2jUJiv3AvAC+wkdwQl81mI8gnBi0k1D
         hJD7dOPXagQAkD2nWgVSeG0z0LyHlRe70iUdOIaDN/lQZJhIMmgpsk2m1KigcLl1C8Ee
         JFIfRGuzUKJEtLRqoEeQCnwPawZij21j1DNU3waiRD37UUdnSxpNvTDy+ZuKj/Z6ow5z
         /I/Zp5JH6zZS2B3vOOBe9uDb5eFIAqKVLSBISHg2uUoZ7LL0Yyx9YBBS3idfrJic0Whw
         BOrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747041884; x=1747646684;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=r9qugMwnRVX+qcsYC3JfFHNgzHHnGrz9+0ecOMYkWLA=;
        b=SWeHeoQ1E+DNyiLtYd00KCgYPIMXA3BgML9Okf8aGdeFIVO9oJzmXpwVnbnboj/Wyf
         wE7btsXYRbfxk1cZ+MzuU/TayThKp6ebEhuwEihgRD020/pbfyAJErq6DNoe4GDCxOHP
         U7Ge7gk0G2zow00COFoOUJzZlKqoc6pL2JU7/nh5mQT3r0wbjFB6Thyh7weSLKrE36gb
         KXKAvv8goY8MUAHu3LUES2LXFhPZ5fdOy3ZmNB7Y/v1hJMsPrVMiKAGJfluFcuK+5y8d
         LBWPmtAkiNvNXqbNHFvGDd8l1olzA4OR4i3grA8rfvJ38hjZep91OOu6Lt2om+euZJMw
         HosQ==
X-Forwarded-Encrypted: i=1; AJvYcCWKuHB+DI2ZGZHsUdl0gD+2MgMuaq0Jak07n4MNTL4mBiphaYhZgj3WHAkSNNORBNewFes3/ob1x5U=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwVknet4KSZqspFwyssJ3bwfDY8BRjWdfz/fwtkBzhQ7SPJ0S4u
	qbN4wfdcpWUYKCZHLrACT4kiSsPC8G8ixUlFDGNeJpJb+iTJUw2E
X-Gm-Gg: ASbGncuK2J4iR+WHad7R45JWWXYP1Dbapi/bVoNPou8EyIf0dqfS/seFyKroggj3XNQ
	f8z1L0avlC0zD0PCHWEzxGp5NLMSXdAKUgw8/pmWEc9PPWXYsjVCLgKovGNeVPzFBOWvzn8HelJ
	ycPYStLTYETipCjxrx1z3RtO3erGfUJ7dDS9cwiqOfdU6+X+TjUND2rwJGEYPyw4zfDLVqBbr7C
	3YGeSNP6vTvIKPfa5Hl6bWJxAOR8wRPqzUB48TEsTRRyqctryef7yRvu0JkGegVsr0KUwBv/2nJ
	FYfP/to9BdoXe7r7ugPTWWhC4mZNv/LXwlH5xpix8JMxuCMp2wyU5DSZfr1gWz9iRjUidkpv0Ds
	Y9mJDvD9wfpSihunLICyfl3C/
X-Google-Smtp-Source: AGHT+IE7fMnWzb0Qy9nz6fIVPdtrJztEhsel9pp2k58OsAli7qhhM4HLrWGvaUEvDfq6TDttp/sADQ==
X-Received: by 2002:a17:907:6d28:b0:ad2:500c:16c1 with SMTP id a640c23a62f3a-ad2500c2ademr383309266b.35.1747041883347;
        Mon, 12 May 2025 02:24:43 -0700 (PDT)
Content-Type: multipart/alternative;
 boundary="------------TjKqzAerYX0cDZ1Qo0v2QFZR"
Message-ID: <b7dc409e-d18c-40eb-bbdf-86ba43b5ce74@gmail.com>
Date: Mon, 12 May 2025 11:24:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/6] xen/riscv: introduce things necessary for p2m
 initialization
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
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <70186bd9-20b6-48a2-9dd0-25cdc30e81f0@citrix.com>

This is a multi-part message in MIME format.
--------------TjKqzAerYX0cDZ1Qo0v2QFZR
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 5/9/25 6:14 PM, Andrew Cooper wrote:
> On 09/05/2025 4:57 pm, Oleksii Kurochko wrote:
>> diff --git a/xen/arch/riscv/p2m.c b/xen/arch/riscv/p2m.c
>> new file mode 100644
>> index 0000000000..ad4beef8f9
>> --- /dev/null
>> +++ b/xen/arch/riscv/p2m.c
>> @@ -0,0 +1,168 @@
>> +#include <xen/domain_page.h>
>> +#include <xen/iommu.h>
>> +#include <xen/lib.h>
>> +#include <xen/mm.h>
>> +#include <xen/pfn.h>
>> +#include <xen/rwlock.h>
>> +#include <xen/sched.h>
>> +#include <xen/spinlock.h>
>> +
>> +#include <asm/page.h>
>> +#include <asm/p2m.h>
>> +
>> +/*
>> + * Force a synchronous P2M TLB flush.
>> + *
>> + * Must be called with the p2m lock held.
>> + *
>> + * TODO: add support of flushing TLB connected to VMID.
>> + */
>> +static void p2m_force_tlb_flush_sync(struct p2m_domain *p2m)
>> +{
>> +    ASSERT(p2m_is_write_locked(p2m));
>> +
>> +    /*
>> +     * TODO: shouldn't be this flush done for each physical CPU?
>> +     *       If yes, then SBI call sbi_remote_hfence_gvma() could
>> +     *       be used for that.
>> +     */
>> +#if defined(__riscv_hh) || defined(__riscv_h)
>> +    asm volatile ( "hfence.gvma" ::: "memory" );
>> +#else
>> +    asm volatile ( ".insn r 0x73, 0x0, 0x31, x0, x0, x0" ::: "memory" );
>> +#endif
> TLB flushing needs to happen for each pCPU which potentially has cached
> a mapping.
>
> In other arches, this is tracked by d->dirty_cpumask which is the bitmap
> of pCPUs where this domain is scheduled.

I could only find usage of|d->dirty_cpumask| in x86 and common code (grant
tables) for flushing the TLB. However, it seems that|d->dirty_cpumask| is
not set anywhere for ARM. Is it sufficient to set a bit in|d->dirty_cpumask|
in|startup_cpu_idle_loop()|?

In addition, it’s also necessary to set and clear bits in|d->dirty_cpumask|
during|context_switch|, correct? Set it before switching from the previous
domain, and clear it after switching to the new domain?

Also, when a bit is set in|d->dirty_cpumask|, the|v->processor| value is also
stored in|v->dirty_cpu|. Is this needed to track which processor is
currently being used for the vCPU?

> CPUs need to flush their TLBs before removing themselves from
> d->dirty_cpumask, which is typically done during context switch, but it
> means that to flush the P2M, you only need to IPI a subset of CPUs.

I can't find where the P2M flush happens for x86/ARM. Could you please point me
to where it is handled?

Also, I found guest_flush_tlb_mask() for x86. I assume that it is x86 specific
and generally it is enough to have only flush_tlb_mask(), right?

Thanks in advance for the answers.

~ Oleksii

--------------TjKqzAerYX0cDZ1Qo0v2QFZR
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
    <div class="moz-cite-prefix">On 5/9/25 6:14 PM, Andrew Cooper wrote:<br>
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
      <pre wrap="" class="moz-quote-pre">
TLB flushing needs to happen for each pCPU which potentially has cached
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
      <pre wrap="" class="moz-quote-pre">
CPUs need to flush their TLBs before removing themselves from
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
  </body>
</html>

--------------TjKqzAerYX0cDZ1Qo0v2QFZR--

