Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A7D18AC2118
	for <lists+xen-devel@lfdr.de>; Fri, 23 May 2025 12:28:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.995540.1377897 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uIPcM-0004q7-NM; Fri, 23 May 2025 10:27:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 995540.1377897; Fri, 23 May 2025 10:27:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uIPcM-0004nl-Kk; Fri, 23 May 2025 10:27:10 +0000
Received: by outflank-mailman (input) for mailman id 995540;
 Fri, 23 May 2025 10:27:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=59Zg=YH=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1uIPcL-0004nf-Jn
 for xen-devel@lists.xenproject.org; Fri, 23 May 2025 10:27:09 +0000
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [2a00:1450:4864:20::62a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7833a52c-37c0-11f0-b892-0df219b8e170;
 Fri, 23 May 2025 12:27:04 +0200 (CEST)
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-ace94273f0dso1580986166b.3
 for <xen-devel@lists.xenproject.org>; Fri, 23 May 2025 03:27:03 -0700 (PDT)
Received: from [192.168.1.5] (user-109-243-64-38.play-internet.pl.
 [109.243.64.38]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ad52d08058bsm1214064066b.68.2025.05.23.03.27.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 23 May 2025 03:27:02 -0700 (PDT)
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
X-Inumbo-ID: 7833a52c-37c0-11f0-b892-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747996023; x=1748600823; darn=lists.xenproject.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PQixmKowOgi/xT5sg3HR+0dsIMV2HyQ1ZDXzHmr7bCs=;
        b=GG6QKgvi8o8oAmxqkej3uRBKU5aQf9VnFaCLMQ7EZgrXT/8BCExYbjsD3QgCAGKcki
         KFu/d4/1He8WIF6DrxnrGYJTo/S9B3lvu23tW015sReqgOX0Qvn/wW4ci+04n3LQ5exI
         qOjo037ybNdLl2u44kdodGCdpAdagCu600CqCSDNoFXikjwJuLlAY+KPNJ022Kl85lyn
         nJYoP+1Uyg72fRvwet6M4zPpVsYHkcrMYg8aJp/jFWayhQP+TZN5kFoJqS7rCzfSQwaH
         WEjLtaZjFzuSdp5iZka7yw9RZplRiJy52+ED5d0ldqnfGwMVsQcAIMgtfblvZa30ewFi
         vB9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747996023; x=1748600823;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=PQixmKowOgi/xT5sg3HR+0dsIMV2HyQ1ZDXzHmr7bCs=;
        b=TFHkmgK4WHlFF+Yk+9Ga8piHfdvPam09/CoZ2M1+rNs+isMLoGuPbBo7IomRUoGZT2
         v/eSncnQbF5doFVEvymAF99oueO0EH4t/QvSpkv6DhFRDU7HPX/4aSAR/EM18j4vpuo9
         qc9IuViniqMlrrMj6yux87Qws/xenCtftuFoC8rC6PqV4AcQAYmme4Zd8DZqmcrKrX2h
         +gowuvATFDM8r3ukr+Q7yN+iElRcjjjjqTiFwUgl4HfL/LZixTVvI/U3oWcb/Y2sd+d6
         YnNO81aO4wqHUazZKoK64D7dPyaow9yuAzHZEpn3G/UVSL9kFM6aUn4mF845b7n0zZBY
         BzYg==
X-Forwarded-Encrypted: i=1; AJvYcCVNKmt0MCfwcTTG+nXItGcAq8OC5c2MAXReTYxez0MErXCuBy6pNU9YOt8+Uy39svNMC42HAtiW41k=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yx2SrMN1doWZKewjPR9voYya3c17CRnUi+rlZiT/j5ntPZuGKqE
	GInw1LISoiMdrY/WfecwbFFFWSOHbeRfGIylW/K4vLCnBPrZoNJ07C3L
X-Gm-Gg: ASbGncv2SXCdWojolW+kK3e/Q3HlBYzx4cjcl1S6funTBW3GdDx5DDaiJiTUT2q4nLM
	gkZWKQFs5+A4pTdpXqftQ+aer80qAesAxrDcx2jTVhyLIctM062wvuhbB6S6Ot+gyZZkDzsES30
	9jA5Iyabfp8pXeoPaDxTPQDaD7YNgDblSrJbtDNMlpAgylJVtjgQcHYd+qzpLIoq75SlUsaJfnB
	GaVP6GRy8uM+s0pf03bGz4CafBKs18V9tx1hBJjyYsFamEbxyIF4zZjz9DoDI3IfAd7YM8zvl0V
	zi0SSgi7ocqgZSNkYTlnxIDG9F2eTo+oh4KXddadVD9AYgesXbpJLj5GDJTNh9/vMO6GOJjSafM
	upTUR6y/J7hyZxVjsiKILlaJw
X-Google-Smtp-Source: AGHT+IFrfMKLMXqHcxme/UtexrlHdSez1xPTYQqEGN9hWt8Dvq99V74yipb53e4USELAJmArdHo/sA==
X-Received: by 2002:a17:907:7e8b:b0:ad2:35db:a732 with SMTP id a640c23a62f3a-ad7083c5e02mr215299566b.22.1747996023007;
        Fri, 23 May 2025 03:27:03 -0700 (PDT)
Content-Type: multipart/alternative;
 boundary="------------S4txwQopjWVzSFoXxOBkm2ib"
Message-ID: <4a6136c3-4146-48e6-85d5-4a6f30bc9920@gmail.com>
Date: Fri, 23 May 2025 12:27:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 3/6] xen/riscv: construct the P2M pages pool for guests
To: Jan Beulich <jbeulich@suse.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1746805907.git.oleksii.kurochko@gmail.com>
 <c9c60bb73fcae0b72d3bc18c10f5ca6cccc5a676.1746805907.git.oleksii.kurochko@gmail.com>
 <b0b4348e-38e5-4138-9e0b-3378f1207bfe@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <b0b4348e-38e5-4138-9e0b-3378f1207bfe@suse.com>

This is a multi-part message in MIME format.
--------------S4txwQopjWVzSFoXxOBkm2ib
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 5/20/25 4:38 PM, Jan Beulich wrote:
> On 09.05.2025 17:57, Oleksii Kurochko wrote:
>> Implement p2m_set_allocation() to construct p2m pages pool for guests
>> based on required number of pages.
>>
>> This is implemented by:
>> - Adding a `struct paging_domain` which contains a freelist, a
>>    counter variable and a spinlock to `struct arch_domain` to
>>    indicate the free p2m pages and the number of p2m total pages in
>>    the p2m pages pool.
>> - Adding a helper `p2m_set_allocation` to set the p2m pages pool
>>    size. This helper should be called before allocating memory for
>>    a guest and is called from domain_p2m_set_allocation(), the latter
>>    is a part of common dom0less code.
>>
>> Signed-off-by: Oleksii Kurochko<oleksii.kurochko@gmail.com>
> As already indicated in reply to patch 2, I expect this pool will want
> introducing ahead of that.
>
>> --- a/xen/arch/riscv/p2m.c
>> +++ b/xen/arch/riscv/p2m.c
>> @@ -1,4 +1,12 @@
>>   #include <xen/domain_page.h>
>> +/*
>> + * Because of general_preempt_check() from xen/sched.h which uses
>> + * local_events_need_delivery() but latter is declared in <asm/event.h>.
>> + * Thereby it is needed to icnlude <xen/event.h> here before xen/sched.h.
>> + *
>> + * Shouldn't be xen/event.h be included in <xen/sched.h>?
>> + */
>> +#include <xen/event.h>
> The question doesn't belong here; such could be put in the post-commit-
> message area. And the answer depends on what dependency you found missing.

It is needed for local_events_need_delivery() which is used by general_preempt_check()
in p2m_set_allocation(). Otherwise, the following issue will occur:

In file included from ././include/xen/config.h:17,
                  from <command-line>:
arch/riscv/p2m.c: In function 'p2m_set_allocation':
./include/xen/sched.h:941:36: error: implicit declaration of function 'local_events_need_delivery' [-Werror=implicit-function-declaration]
   941 |         (!is_idle_vcpu(current) && local_events_need_delivery())    \
       |                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~
./include/xen/compiler.h:26:43: note: in definition of macro 'unlikely'
    26 | #define unlikely(x)   __builtin_expect(!!(x),0)
       |                                           ^
arch/riscv/p2m.c:244:27: note: in expansion of macro 'general_preempt_check'
   244 |         if ( preempted && general_preempt_check() )
       |                           ^~~~~~~~~~~~~~~~~~~~~
cc1: all warnings being treated as errors

>
>> @@ -166,3 +176,60 @@ int p2m_init(struct domain *d)
>>   
>>       return 0;
>>   }
>> +
>> +/*
>> + * Set the pool of pages to the required number of pages.
>> + * Returns 0 for success, non-zero for failure.
>> + * Call with d->arch.paging.lock held.
>> + */
>> +int p2m_set_allocation(struct domain *d, unsigned long pages, bool *preempted)
>> +{
>> +    struct page_info *pg;
>> +
>> +    ASSERT(spin_is_locked(&d->arch.paging.lock));
>> +
>> +    for ( ; ; )
>> +    {
>> +        if ( d->arch.paging.p2m_total_pages < pages )
>> +        {
>> +            /* Need to allocate more memory from domheap */
>> +            pg = alloc_domheap_page(d, MEMF_no_owner);
>> +            if ( pg == NULL )
>> +            {
>> +                printk(XENLOG_ERR "Failed to allocate P2M pages.\n");
>> +                return -ENOMEM;
>> +            }
>> +            ACCESS_ONCE(d->arch.paging.p2m_total_pages) =
>> +                d->arch.paging.p2m_total_pages + 1;
> Looks like you copied this from Arm, but this code is bogus: Using
> ACCESS_ONCE() just on the lhs is pretty pointless. Once also used on the
> rhs the expression can easily become
>
>                  ACCESS_ONCE(d->arch.paging.p2m_total_pages) += 1;
>
> or even
>
>                  ACCESS_ONCE(d->arch.paging.p2m_total_pages)++;
>
> .
>
>> +            page_list_add_tail(pg, &d->arch.paging.p2m_freelist);
>> +        }
>> +        else if ( d->arch.paging.p2m_total_pages > pages )
>> +        {
>> +            /* Need to return memory to domheap */
>> +            pg = page_list_remove_head(&d->arch.paging.p2m_freelist);
>> +            if( pg )
>> +            {
>> +                ACCESS_ONCE(d->arch.paging.p2m_total_pages) =
>> +                    d->arch.paging.p2m_total_pages - 1;
> Same here then, obviously.
>
>> +                free_domheap_page(pg);
>> +            }
>> +            else
>> +            {
>> +                printk(XENLOG_ERR
>> +                       "Failed to free P2M pages, P2M freelist is empty.\n");
>> +                return -ENOMEM;
>> +            }
>> +        }
>> +        else
>> +            break;
>> +
>> +        /* Check to see if we need to yield and try again */
>> +        if ( preempted && general_preempt_check() )
> While it's this way on both Arm and x86, I wonder how useful it is
> to check on every iteration, especially when freeing pages back to the
> buddy allocator.

IIUC, but a preemption request could happen for both cases. And destroying of
a domain could also consume long time and so not to block hypervisor if something
more urgent should be handled it could be also have this check for the case of
freeng pages back to the buddy allocator.

~ Oleksii

--------------S4txwQopjWVzSFoXxOBkm2ib
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
    <div class="moz-cite-prefix">On 5/20/25 4:38 PM, Jan Beulich wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:b0b4348e-38e5-4138-9e0b-3378f1207bfe@suse.com">
      <pre wrap="" class="moz-quote-pre">On 09.05.2025 17:57, Oleksii Kurochko wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">Implement p2m_set_allocation() to construct p2m pages pool for guests
based on required number of pages.

This is implemented by:
- Adding a `struct paging_domain` which contains a freelist, a
  counter variable and a spinlock to `struct arch_domain` to
  indicate the free p2m pages and the number of p2m total pages in
  the p2m pages pool.
- Adding a helper `p2m_set_allocation` to set the p2m pages pool
  size. This helper should be called before allocating memory for
  a guest and is called from domain_p2m_set_allocation(), the latter
  is a part of common dom0less code.

Signed-off-by: Oleksii Kurochko <a class="moz-txt-link-rfc2396E" href="mailto:oleksii.kurochko@gmail.com">&lt;oleksii.kurochko@gmail.com&gt;</a>
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
As already indicated in reply to patch 2, I expect this pool will want
introducing ahead of that.

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">--- a/xen/arch/riscv/p2m.c
+++ b/xen/arch/riscv/p2m.c
@@ -1,4 +1,12 @@
 #include &lt;xen/domain_page.h&gt;
+/*
+ * Because of general_preempt_check() from xen/sched.h which uses
+ * local_events_need_delivery() but latter is declared in &lt;asm/event.h&gt;.
+ * Thereby it is needed to icnlude &lt;xen/event.h&gt; here before xen/sched.h.
+ *
+ * Shouldn't be xen/event.h be included in &lt;xen/sched.h&gt;?
+ */
+#include &lt;xen/event.h&gt;
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
The question doesn't belong here; such could be put in the post-commit-
message area. And the answer depends on what dependency you found missing.</pre>
    </blockquote>
    <pre>It is needed for local_events_need_delivery() which is used by general_preempt_check()
in p2m_set_allocation(). Otherwise, the following issue will occur:

In file included from ././include/xen/config.h:17,
                 from &lt;command-line&gt;:
arch/riscv/p2m.c: In function 'p2m_set_allocation':
./include/xen/sched.h:941:36: error: implicit declaration of function 'local_events_need_delivery' [-Werror=implicit-function-declaration]
  941 |         (!is_idle_vcpu(current) &amp;&amp; local_events_need_delivery())    \
      |                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~
./include/xen/compiler.h:26:43: note: in definition of macro 'unlikely'
   26 | #define unlikely(x)   __builtin_expect(!!(x),0)
      |                                           ^
arch/riscv/p2m.c:244:27: note: in expansion of macro 'general_preempt_check'
  244 |         if ( preempted &amp;&amp; general_preempt_check() )
      |                           ^~~~~~~~~~~~~~~~~~~~~
cc1: all warnings being treated as errors

</pre>
    <blockquote type="cite"
      cite="mid:b0b4348e-38e5-4138-9e0b-3378f1207bfe@suse.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">@@ -166,3 +176,60 @@ int p2m_init(struct domain *d)
 
     return 0;
 }
+
+/*
+ * Set the pool of pages to the required number of pages.
+ * Returns 0 for success, non-zero for failure.
+ * Call with d-&gt;arch.paging.lock held.
+ */
+int p2m_set_allocation(struct domain *d, unsigned long pages, bool *preempted)
+{
+    struct page_info *pg;
+
+    ASSERT(spin_is_locked(&amp;d-&gt;arch.paging.lock));
+
+    for ( ; ; )
+    {
+        if ( d-&gt;arch.paging.p2m_total_pages &lt; pages )
+        {
+            /* Need to allocate more memory from domheap */
+            pg = alloc_domheap_page(d, MEMF_no_owner);
+            if ( pg == NULL )
+            {
+                printk(XENLOG_ERR "Failed to allocate P2M pages.\n");
+                return -ENOMEM;
+            }
+            ACCESS_ONCE(d-&gt;arch.paging.p2m_total_pages) =
+                d-&gt;arch.paging.p2m_total_pages + 1;
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Looks like you copied this from Arm, but this code is bogus: Using
ACCESS_ONCE() just on the lhs is pretty pointless. Once also used on the
rhs the expression can easily become

                ACCESS_ONCE(d-&gt;arch.paging.p2m_total_pages) += 1;

or even

                ACCESS_ONCE(d-&gt;arch.paging.p2m_total_pages)++;

.

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+            page_list_add_tail(pg, &amp;d-&gt;arch.paging.p2m_freelist);
+        }
+        else if ( d-&gt;arch.paging.p2m_total_pages &gt; pages )
+        {
+            /* Need to return memory to domheap */
+            pg = page_list_remove_head(&amp;d-&gt;arch.paging.p2m_freelist);
+            if( pg )
+            {
+                ACCESS_ONCE(d-&gt;arch.paging.p2m_total_pages) =
+                    d-&gt;arch.paging.p2m_total_pages - 1;
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Same here then, obviously.

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+                free_domheap_page(pg);
+            }
+            else
+            {
+                printk(XENLOG_ERR
+                       "Failed to free P2M pages, P2M freelist is empty.\n");
+                return -ENOMEM;
+            }
+        }
+        else
+            break;
+
+        /* Check to see if we need to yield and try again */
+        if ( preempted &amp;&amp; general_preempt_check() )
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
While it's this way on both Arm and x86, I wonder how useful it is
to check on every iteration, especially when freeing pages back to the
buddy allocator.</pre>
    </blockquote>
    <pre>IIUC, but a preemption request could happen for both cases. And destroying of
a domain could also consume long time and so not to block hypervisor if something
more urgent should be handled it could be also have this check for the case of
freeng pages back to the buddy allocator.

~ Oleksii
</pre>
  </body>
</html>

--------------S4txwQopjWVzSFoXxOBkm2ib--

