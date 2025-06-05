Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C3E5ACF1A5
	for <lists+xen-devel@lfdr.de>; Thu,  5 Jun 2025 16:23:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1006953.1386213 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uNBUb-0003vw-Oi; Thu, 05 Jun 2025 14:22:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1006953.1386213; Thu, 05 Jun 2025 14:22:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uNBUb-0003td-LV; Thu, 05 Jun 2025 14:22:53 +0000
Received: by outflank-mailman (input) for mailman id 1006953;
 Thu, 05 Jun 2025 14:22:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EkoY=YU=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1uNBUa-0003tX-U4
 for xen-devel@lists.xenproject.org; Thu, 05 Jun 2025 14:22:53 +0000
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [2a00:1450:4864:20::62c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8fb3b2d4-4218-11f0-b894-0df219b8e170;
 Thu, 05 Jun 2025 16:22:50 +0200 (CEST)
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-acb39c45b4eso165969866b.1
 for <xen-devel@lists.xenproject.org>; Thu, 05 Jun 2025 07:22:50 -0700 (PDT)
Received: from [192.168.1.5] (user-109-243-64-38.play-internet.pl.
 [109.243.64.38]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ada5e878152sm1273046866b.107.2025.06.05.07.22.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Jun 2025 07:22:49 -0700 (PDT)
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
X-Inumbo-ID: 8fb3b2d4-4218-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749133370; x=1749738170; darn=lists.xenproject.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Vh8RoyS43ThBKLQ/gHpTQbTpGCpGou6sj6M4xPMbD98=;
        b=F2bMDftxMwFgMNLWMBKjC+WyJ9ow7Ah22I6xDof/fFTevcmoZmnNvbWNKXZNiEOntN
         7w/l7Dw4z6v1qwdtngcrKzEfCr5ZltWCs1q4bYsgqjDq4rDlaxrneLPWRpP1yyiwZoDP
         Bupz4lsrcOKVrcqArFxoWZ82pDT5TUduBsrT+ij4dP1ONuTXKVHzm/IpaFNbYrdVF1tM
         IrzY9XVjXqISZGsD4OWYodyFBXPmTw422TTZ4yG5nh/B6kydbhoOz0u7CPQ5skyNF9kt
         D1q6veH8eGuT6RFSW8WROaR49EPvxr3VLscNRjjzHPZOIzGMeLS9wwubU/ahdAr5AyI+
         7SIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749133370; x=1749738170;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Vh8RoyS43ThBKLQ/gHpTQbTpGCpGou6sj6M4xPMbD98=;
        b=eG3a8pMuGYBwccOaxqLy4kLMJJkfOv+r/v2yfN3RmPAEm3n4sZ/K7XzFHn8ghUmSN4
         1eeqDGYEerA1hIeOM4qHQz7YGnUp/KGtiDTis8C7Bfac88PaK5Nn7vRqLFM1+ZOZh85i
         wGTbsvnuM5mOYo4YiOmDzJXT31tl2Z5aM4M3M3J4we852anH2BRoYpUwAYvuQ+ew0cic
         Cc1+d/w9Ilogj2IhaTb2/i3IW/1+V2w3xnMHR+NlVSbMOO7BsVk4/tFbfOqOwUDpdi1I
         3+eOEhqOXBXVO8a8uqNXBHAmlx7w3TjWxlttEYvCqjY1JVHZop1ylCf9PRDWAsfolwJX
         vYVg==
X-Forwarded-Encrypted: i=1; AJvYcCWBFC7VA8w/tMS6SnEzbGgSIP31grlqadiGj61L0sbnxE5maGJIDwj2VIsldt/rP7sPMbJJQgPPXJA=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yz0S/MAIu+ejOQc5TyjmmcLslAsc9HgvFHY7Wc5sCueQweIIiHs
	lkfw50VFHIq+IKYQ4erCyb7duLsYAHzV4QnY2s7GEgaiYAmYXBD57fgf
X-Gm-Gg: ASbGncvtZjMZpxzJb6eWtdCrqvUc3YNn9Ypew+h9B2MVh05eUTzETwni15O0xsSu96x
	19abI6l58bjvTKevSJSEmiQ2+iXn7BtmROSDeK2ykaYaeo3nQC1TYZYjW/7c7KTxazJ72vpUu4P
	ttNWUJK3uXdpuY5hLwyUQ247TawMSLqwpybXyTZMtIQQ6+RugFjorz8Yl6PWZhCQU1l/SsdfnPT
	VfZCO333Ry8DgkBc69tF2vRjXFYJl5H0fcUvzAlArDBpHyyxg0eXbZpLhxY1db5NSUG+ZlzFiHo
	ojy5K40MO6ZpmrBXPjECw19zNTnkg/KuPHskdX835986CEBx4eY2+aTrC1FawHYvdBCbX+FdoPJ
	8iHG7ib0N/1e8d6z1Q15iHN2N
X-Google-Smtp-Source: AGHT+IEZaZe772STO1YoaJy3ybnIxxMxK8wqVE75Kf+2Dj9nd4QYZVxmheF2bkreCx/uVO3qs5F+9Q==
X-Received: by 2002:a17:907:86a7:b0:add:ede0:b9d4 with SMTP id a640c23a62f3a-addf89e8fe6mr631997866b.0.1749133369779;
        Thu, 05 Jun 2025 07:22:49 -0700 (PDT)
Content-Type: multipart/alternative;
 boundary="------------FcvKDYp52KLyHVM0U0MgvD0D"
Message-ID: <59b5d40e-8db8-4380-9cb9-b7fae8bac05d@gmail.com>
Date: Thu, 5 Jun 2025 16:22:47 +0200
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
 <4a6136c3-4146-48e6-85d5-4a6f30bc9920@gmail.com>
 <5ce4c4a6-8e2e-4b4e-9cec-03a78d1d0173@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <5ce4c4a6-8e2e-4b4e-9cec-03a78d1d0173@suse.com>

This is a multi-part message in MIME format.
--------------FcvKDYp52KLyHVM0U0MgvD0D
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 6/2/25 1:08 PM, Jan Beulich wrote:
> On 23.05.2025 12:27, Oleksii Kurochko wrote:
>> On 5/20/25 4:38 PM, Jan Beulich wrote:
>>> On 09.05.2025 17:57, Oleksii Kurochko wrote:
>>>> --- a/xen/arch/riscv/p2m.c
>>>> +++ b/xen/arch/riscv/p2m.c
>>>> @@ -1,4 +1,12 @@
>>>>    #include <xen/domain_page.h>
>>>> +/*
>>>> + * Because of general_preempt_check() from xen/sched.h which uses
>>>> + * local_events_need_delivery() but latter is declared in <asm/event.h>.
>>>> + * Thereby it is needed to icnlude <xen/event.h> here before xen/sched.h.
>>>> + *
>>>> + * Shouldn't be xen/event.h be included in <xen/sched.h>?
>>>> + */
>>>> +#include <xen/event.h>
>>> The question doesn't belong here; such could be put in the post-commit-
>>> message area. And the answer depends on what dependency you found missing.
>> It is needed for local_events_need_delivery() which is used by general_preempt_check()
>> in p2m_set_allocation(). Otherwise, the following issue will occur:
>>
>> In file included from ././include/xen/config.h:17,
>>                    from <command-line>:
>> arch/riscv/p2m.c: In function 'p2m_set_allocation':
>> ./include/xen/sched.h:941:36: error: implicit declaration of function 'local_events_need_delivery' [-Werror=implicit-function-declaration]
>>     941 |         (!is_idle_vcpu(current) && local_events_need_delivery())    \
>>         |                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~
>> ./include/xen/compiler.h:26:43: note: in definition of macro 'unlikely'
>>      26 | #define unlikely(x)   __builtin_expect(!!(x),0)
>>         |                                           ^
>> arch/riscv/p2m.c:244:27: note: in expansion of macro 'general_preempt_check'
>>     244 |         if ( preempted && general_preempt_check() )
>>         |                           ^~~~~~~~~~~~~~~~~~~~~
>> cc1: all warnings being treated as errors
> In which case my answer to your question is "No". Others may take a different
> perspective. (xen/sched.h being included virtually everywhere, imo we want to
> avoid adding dependencies there which aren't strictly necessary to keep things
> building.)

Okay, then I will just update the comment and leave inclusion of xen/event.h in riscv/p2mc.

>
>>>> @@ -166,3 +176,60 @@ int p2m_init(struct domain *d)
>>>>    
>>>>        return 0;
>>>>    }
>>>> +
>>>> +/*
>>>> + * Set the pool of pages to the required number of pages.
>>>> + * Returns 0 for success, non-zero for failure.
>>>> + * Call with d->arch.paging.lock held.
>>>> + */
>>>> +int p2m_set_allocation(struct domain *d, unsigned long pages, bool *preempted)
>>>> +{
>>>> +    struct page_info *pg;
>>>> +
>>>> +    ASSERT(spin_is_locked(&d->arch.paging.lock));
>>>> +
>>>> +    for ( ; ; )
>>>> +    {
>>>> +        if ( d->arch.paging.p2m_total_pages < pages )
>>>> +        {
>>>> +            /* Need to allocate more memory from domheap */
>>>> +            pg = alloc_domheap_page(d, MEMF_no_owner);
>>>> +            if ( pg == NULL )
>>>> +            {
>>>> +                printk(XENLOG_ERR "Failed to allocate P2M pages.\n");
>>>> +                return -ENOMEM;
>>>> +            }
>>>> +            ACCESS_ONCE(d->arch.paging.p2m_total_pages) =
>>>> +                d->arch.paging.p2m_total_pages + 1;
>>> Looks like you copied this from Arm, but this code is bogus: Using
>>> ACCESS_ONCE() just on the lhs is pretty pointless. Once also used on the
>>> rhs the expression can easily become
>>>
>>>                   ACCESS_ONCE(d->arch.paging.p2m_total_pages) += 1;
>>>
>>> or even
>>>
>>>                   ACCESS_ONCE(d->arch.paging.p2m_total_pages)++;
>>>
>>> .
>>>
>>>> +            page_list_add_tail(pg, &d->arch.paging.p2m_freelist);
>>>> +        }
>>>> +        else if ( d->arch.paging.p2m_total_pages > pages )
>>>> +        {
>>>> +            /* Need to return memory to domheap */
>>>> +            pg = page_list_remove_head(&d->arch.paging.p2m_freelist);
>>>> +            if( pg )
>>>> +            {
>>>> +                ACCESS_ONCE(d->arch.paging.p2m_total_pages) =
>>>> +                    d->arch.paging.p2m_total_pages - 1;
>>> Same here then, obviously.
>>>
>>>> +                free_domheap_page(pg);
>>>> +            }
>>>> +            else
>>>> +            {
>>>> +                printk(XENLOG_ERR
>>>> +                       "Failed to free P2M pages, P2M freelist is empty.\n");
>>>> +                return -ENOMEM;
>>>> +            }
>>>> +        }
>>>> +        else
>>>> +            break;
>>>> +
>>>> +        /* Check to see if we need to yield and try again */
>>>> +        if ( preempted && general_preempt_check() )
>>> While it's this way on both Arm and x86, I wonder how useful it is
>>> to check on every iteration, especially when freeing pages back to the
>>> buddy allocator.
>> IIUC, but a preemption request could happen for both cases. And destroying of
>> a domain could also consume long time and so not to block hypervisor if something
>> more urgent should be handled it could be also have this check for the case of
>> freeng pages back to the buddy allocator.
> The question wasn't whether to check, but how frequently. The check itself is
> consuming processing time, too, so one generally wants to balance the number
> of checks against the size of the resulting time window without any check.

So you are expecting something like this:
         /* Check to see if we need to yield and try again */
         if ( !(d->arch.paging.p2m_total_pages % 30) && preempted &&
              general_preempt_check() )
         {
             *preempted = true;
             return -ERESTART;
         }
It still requires, at least, one check, but this check isn't so long as
general_preempt_check() could be.

~ Oleksii

--------------FcvKDYp52KLyHVM0U0MgvD0D
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
    <div class="moz-cite-prefix">On 6/2/25 1:08 PM, Jan Beulich wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:5ce4c4a6-8e2e-4b4e-9cec-03a78d1d0173@suse.com">
      <pre wrap="" class="moz-quote-pre">On 23.05.2025 12:27, Oleksii Kurochko wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">On 5/20/25 4:38 PM, Jan Beulich wrote:
</pre>
        <blockquote type="cite">
          <pre wrap="" class="moz-quote-pre">On 09.05.2025 17:57, Oleksii Kurochko wrote:
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
          <pre wrap="" class="moz-quote-pre">The question doesn't belong here; such could be put in the post-commit-
message area. And the answer depends on what dependency you found missing.
</pre>
        </blockquote>
        <pre wrap="" class="moz-quote-pre">
It is needed for local_events_need_delivery() which is used by general_preempt_check()
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
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
In which case my answer to your question is "No". Others may take a different
perspective. (xen/sched.h being included virtually everywhere, imo we want to
avoid adding dependencies there which aren't strictly necessary to keep things
building.)</pre>
    </blockquote>
    <pre>Okay, then I will just update the comment and leave inclusion of xen/event.h in riscv/p2mc.

</pre>
    <blockquote type="cite"
      cite="mid:5ce4c4a6-8e2e-4b4e-9cec-03a78d1d0173@suse.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <blockquote type="cite">
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
          <pre wrap="" class="moz-quote-pre">Looks like you copied this from Arm, but this code is bogus: Using
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
          <pre wrap="" class="moz-quote-pre">Same here then, obviously.

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
          <pre wrap="" class="moz-quote-pre">While it's this way on both Arm and x86, I wonder how useful it is
to check on every iteration, especially when freeing pages back to the
buddy allocator.
</pre>
        </blockquote>
        <pre wrap="" class="moz-quote-pre">
IIUC, but a preemption request could happen for both cases. And destroying of
a domain could also consume long time and so not to block hypervisor if something
more urgent should be handled it could be also have this check for the case of
freeng pages back to the buddy allocator.
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
The question wasn't whether to check, but how frequently. The check itself is
consuming processing time, too, so one generally wants to balance the number
of checks against the size of the resulting time window without any check.</pre>
    </blockquote>
    <pre>So you are expecting something like this:
        /* Check to see if we need to yield and try again */
        if ( !(d-&gt;arch.paging.p2m_total_pages % 30) &amp;&amp; preempted &amp;&amp;
             general_preempt_check() )
        {
            *preempted = true;
            return -ERESTART;
        }
It still requires, at least, one check, but this check isn't so long as 
general_preempt_check() could be.</pre>
    <pre>~ Oleksii
</pre>
  </body>
</html>

--------------FcvKDYp52KLyHVM0U0MgvD0D--

