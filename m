Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D17BAF147B
	for <lists+xen-devel@lfdr.de>; Wed,  2 Jul 2025 13:48:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1030950.1404640 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uWvwu-0002ey-Vm; Wed, 02 Jul 2025 11:48:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1030950.1404640; Wed, 02 Jul 2025 11:48:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uWvwu-0002cm-Sm; Wed, 02 Jul 2025 11:48:24 +0000
Received: by outflank-mailman (input) for mailman id 1030950;
 Wed, 02 Jul 2025 11:48:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QWaS=ZP=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1uWvwt-0002cg-3j
 for xen-devel@lists.xenproject.org; Wed, 02 Jul 2025 11:48:23 +0000
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [2a00:1450:4864:20::530])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 73b8e61b-573a-11f0-b894-0df219b8e170;
 Wed, 02 Jul 2025 13:48:21 +0200 (CEST)
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-6099d89a19cso8366869a12.2
 for <xen-devel@lists.xenproject.org>; Wed, 02 Jul 2025 04:48:21 -0700 (PDT)
Received: from [192.168.1.5] (user-109-243-64-38.play-internet.pl.
 [109.243.64.38]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ae3ae415e23sm325723066b.83.2025.07.02.04.48.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Jul 2025 04:48:19 -0700 (PDT)
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
X-Inumbo-ID: 73b8e61b-573a-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751456900; x=1752061700; darn=lists.xenproject.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uD35An1eplV8yVaNIKpRE7EgU5yJZcKMai7vVGO4BRM=;
        b=LUrXdJ9qtRWGtzmNGm0AGfP675rxtiWcDpp2EAnky+kugHQ7g1Q1nsVNE/hh1+Xjr9
         6WTdNZncz3FiVk2zIYT9qBiC0r5+gl6oMz71IPMi9vZMcoCLsNpvnzcRmwo7bc7rPXFh
         iyX4SRWYb7LT/ma1/7tbPizs2tRSz12/7FeJCQlM9rerBawxnwGhXA9DHth8hh4J2SbQ
         4I0u1hW1UCxBUt2WTG5RAyRa7F3/Dh0bMQn2xDweZzoMi+6qpqzUfGdFFu7Agb+jLp5g
         3feYg4gntZrIQgaEC9rg2XxuJSk1GANTWIP0GRYOavIc5kRBFbnoHULzVOf8l6e6qVQA
         nFkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751456900; x=1752061700;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=uD35An1eplV8yVaNIKpRE7EgU5yJZcKMai7vVGO4BRM=;
        b=GT9kUlqKOywMaGe0VUYPZk+F+h0msFs9u6OU7S4PhCXUWql12zqfGdyrzzm31vHEVA
         NUmvuQcucTQo267Xw90cCRZuz8hLaw1IT82BQfhvWAIvDw6RI8QGmsTu3+yrzRzxfw9z
         lRnWqLWkNH2J1bFahdqaA9o7KHjjAGcwlGPqgtVnxfOeyMb7jfXsJclkQrM9GfY0RMPi
         kSyuFgHbn3oBTS/MyhuEYniobJmnk3XKwNS6cVDJAKwrRGw1SArecwIUJEKvif+MCwRQ
         +FjzRBMsL4rBeMXI/STClox2nIXolwOteFt6/N1/wHb/ZZ/wd2rVKElpsFXSLkX95VqQ
         cpeg==
X-Forwarded-Encrypted: i=1; AJvYcCX5GhrZiLKiHNJwnn+o/GYWpigzMqY0/Vu6aHtfugLLCtTqupaEsDnqhi85hibqgIGsFlEN8Q+52AM=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzgZXwZFaZV3aWkVXCI0Yr1llLh0h8OhjVnVcF/tiiZfuFDTk/e
	Pct4REYwGudqkl6x/GIzRVlNDJ/bmuTTdzkQy4olWwVPbGcbH/se3gYV
X-Gm-Gg: ASbGncu9gu65zGgGb3YsvGyLdeLGe/vr+pbbCZZBot/bhudm7hr2BgsdEQ3FcCB3mBX
	Kz2uwnHR2xZnPEaumhG/UuyDcsdA7dkntG7UkrgL/0CcBnUZtYFlKaXg8Vxw2JO+YOYPX6kt7Lw
	55IZ2aiB4ijQyoHDQU0aIV5LGmh/5j9fFQIWV+oDyiYNaPWBc60r+X2+3VVB/n1NhrW2HvfZi8A
	XUoVVtVsCteI3/p5dPmI/+xYZwXe2fgbWHBFyORhZ+JI7oCc5SLgNJvbl+6feMTwM1kYshxRSNC
	Mfx9wtrCCS7cS/09tlGX7cVqMQIs/Kt8ZuLaimEa//ur1tLHShlUoEKHbNQgq2YiEGxIm4uIiOL
	sn8qERC14UAxXGvzdb9GrUx4xw1b3WQcEDr7mNflBX7JM/A==
X-Google-Smtp-Source: AGHT+IENMYZSNjNcp+5JkkypB7OS6kXd+OKudYCBbRq7DeN0353DhpnGZhgNWwUqBRQt3nc2Ha18Mg==
X-Received: by 2002:a17:907:1c19:b0:ad8:89f8:3f51 with SMTP id a640c23a62f3a-ae3c2a91ac9mr246979466b.6.1751456899975;
        Wed, 02 Jul 2025 04:48:19 -0700 (PDT)
Content-Type: multipart/alternative;
 boundary="------------bELnexJohzKOcM1aRhruGIXn"
Message-ID: <564d3ea1-d79a-490f-a756-78a55b2befda@gmail.com>
Date: Wed, 2 Jul 2025 13:48:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 04/17] xen/riscv: construct the P2M pages pool for
 guests
To: Jan Beulich <jbeulich@suse.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1749555949.git.oleksii.kurochko@gmail.com>
 <bdde7c97df218d3ac65f9e719c5777401da80495.1749555949.git.oleksii.kurochko@gmail.com>
 <f3761f21-1a7d-4820-ba74-31fb9becf36d@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <f3761f21-1a7d-4820-ba74-31fb9becf36d@suse.com>

This is a multi-part message in MIME format.
--------------bELnexJohzKOcM1aRhruGIXn
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 7/1/25 3:04 PM, Jan Beulich wrote:
> On 10.06.2025 15:05, Oleksii Kurochko wrote:
>> @@ -113,3 +117,58 @@ int p2m_init(struct domain *d)
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
>> +            ACCESS_ONCE(d->arch.paging.p2m_total_pages)++;
>> +            page_list_add_tail(pg, &d->arch.paging.p2m_freelist);
>> +        }
>> +        else if ( d->arch.paging.p2m_total_pages > pages )
>> +        {
>> +            /* Need to return memory to domheap */
>> +            pg = page_list_remove_head(&d->arch.paging.p2m_freelist);
>> +            if( pg )
>> +            {
>> +                ACCESS_ONCE(d->arch.paging.p2m_total_pages)--;
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
>> +        {
>> +            *preempted = true;
>> +            return -ERESTART;
>> +        }
>> +    }
>> +
>> +    return 0;
>> +}
> Btw, with the order-2 requirement for the root page table, you may want to
> consider an alternative approach: Here you could allocate some order-2
> pages (possibly up to as many as a domain might need, which right now
> would be exactly one), put them on a separate list, and consume the root
> table(s) from there. If you run out of pages on the order-0 list, you
> could shatter a page from the order-2 one (as long as that's still non-
> empty). The difficulty would be with freeing, where a previously shattered
> order-2 page would be nice to re-combine once all of its constituents are
> free again.

Do we really need to re-combine shattered order-2 pages?
It seems like the only usage for this order-2-list is to have 1 order-2 page
for root page table. All other pages are 4k pages so even if we won't re-combine
them, nothing serious will happen.

And if we aren't going to have more usages of order-2 pages list then do we
really need a separate order-2 list just basically for root page table?

...

>   The main benefit would be avoiding the back and forth in patch
> 6.

...
Can’t we just avoid putting the pages (which will get back) for the root page table into the
freelist at all? That way, there would be no need to return them
later—something like:

Something like:
int p2m_set_allocation(struct domain *d, unsigned long pages, bool *preempted)
{
     struct page_info *pg;

     ASSERT(spin_is_locked(&d->arch.paging.lock));

     pages -= root_page_table_num;
     
     for ( ; ; )
     {
         if ( d->arch.paging.p2m_total_pages < pages )
         {
    ...
}

~ Oleksii


--------------bELnexJohzKOcM1aRhruGIXn
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
    <div class="moz-cite-prefix">On 7/1/25 3:04 PM, Jan Beulich wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:f3761f21-1a7d-4820-ba74-31fb9becf36d@suse.com">
      <pre wrap="" class="moz-quote-pre">On 10.06.2025 15:05, Oleksii Kurochko wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">@@ -113,3 +117,58 @@ int p2m_init(struct domain *d)
 
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
+            ACCESS_ONCE(d-&gt;arch.paging.p2m_total_pages)++;
+            page_list_add_tail(pg, &amp;d-&gt;arch.paging.p2m_freelist);
+        }
+        else if ( d-&gt;arch.paging.p2m_total_pages &gt; pages )
+        {
+            /* Need to return memory to domheap */
+            pg = page_list_remove_head(&amp;d-&gt;arch.paging.p2m_freelist);
+            if( pg )
+            {
+                ACCESS_ONCE(d-&gt;arch.paging.p2m_total_pages)--;
+                free_domheap_page(pg);
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
+        {
+            *preempted = true;
+            return -ERESTART;
+        }
+    }
+
+    return 0;
+}
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Btw, with the order-2 requirement for the root page table, you may want to
consider an alternative approach: Here you could allocate some order-2
pages (possibly up to as many as a domain might need, which right now
would be exactly one), put them on a separate list, and consume the root
table(s) from there. If you run out of pages on the order-0 list, you
could shatter a page from the order-2 one (as long as that's still non-
empty). The difficulty would be with freeing, where a previously shattered
order-2 page would be nice to re-combine once all of its constituents are
free again.</pre>
    </blockquote>
    <pre>Do we really need to re-combine shattered order-2 pages?
It seems like the only usage for this order-2-list is to have 1 order-2 page
for root page table. All other pages are 4k pages so even if we won't re-combine
them, nothing serious will happen.

And if we aren't going to have more usages of order-2 pages list then do we
really need a separate order-2 list just basically for root page table?

...

</pre>
    <blockquote type="cite"
      cite="mid:f3761f21-1a7d-4820-ba74-31fb9becf36d@suse.com">
      <pre wrap="" class="moz-quote-pre"> The main benefit would be avoiding the back and forth in patch
6.</pre>
    </blockquote>
    <pre>...
Can’t we just avoid putting the pages (which will get back) for the root page table into the
freelist at all? That way, there would be no need to return them
later—something like:

Something like:
int p2m_set_allocation(struct domain *d, unsigned long pages, bool *preempted)
{
    struct page_info *pg;

    ASSERT(spin_is_locked(&amp;d-&gt;arch.paging.lock));

    pages -= root_page_table_num;
    
    for ( ; ; )
    {
        if ( d-&gt;arch.paging.p2m_total_pages &lt; pages )
        {
   ...
}

~ Oleksii


</pre>
  </body>
</html>

--------------bELnexJohzKOcM1aRhruGIXn--

