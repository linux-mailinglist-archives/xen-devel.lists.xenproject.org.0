Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3093AAF15C4
	for <lists+xen-devel@lfdr.de>; Wed,  2 Jul 2025 14:34:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1031061.1404761 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uWwfh-0007b5-B5; Wed, 02 Jul 2025 12:34:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1031061.1404761; Wed, 02 Jul 2025 12:34:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uWwfh-0007Yd-7m; Wed, 02 Jul 2025 12:34:41 +0000
Received: by outflank-mailman (input) for mailman id 1031061;
 Wed, 02 Jul 2025 12:34:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QWaS=ZP=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1uWwff-0007YX-4f
 for xen-devel@lists.xenproject.org; Wed, 02 Jul 2025 12:34:39 +0000
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [2a00:1450:4864:20::533])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ea5f4fff-5740-11f0-b894-0df219b8e170;
 Wed, 02 Jul 2025 14:34:37 +0200 (CEST)
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-60700a745e5so8753704a12.3
 for <xen-devel@lists.xenproject.org>; Wed, 02 Jul 2025 05:34:37 -0700 (PDT)
Received: from [192.168.1.5] (user-109-243-64-38.play-internet.pl.
 [109.243.64.38]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ae353c0427bsm1055865566b.84.2025.07.02.05.34.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Jul 2025 05:34:35 -0700 (PDT)
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
X-Inumbo-ID: ea5f4fff-5740-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751459676; x=1752064476; darn=lists.xenproject.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YsDaQRhjxRorBrLOSdNrbtiK1MljTSIGfp+ddu2H/wA=;
        b=IVkpcIcFawAMoOVjLb9MY6zsDSr82IZ8TYDm05h7+/sZBuJmxWznO1/b9zBcZmjiUm
         j2l5brBeTEwExE86mrwKvt2yjrqkIuaKQlUBULFLI8indPio9Y7D17gBoDy78FHMRPnj
         H1Suq11mzvgyBh0BnVEmTWSkDmRs9TvOqLw7EZaYzo9GlhSMJSg+cppk+Ccwhg/D8QN+
         aifvFi5XYLdDY4DrwI8TaIqJAwDkCZOFPxBSBBcqOxpGpjMH556h/u8NtZ3TtCKcaPG9
         x2fs4Uq5KPonG0O+abq/wyNky97Xd4IYVR30FhnFwh+Co/GGQKC4pogvZD+m3nPumf6o
         3AzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751459676; x=1752064476;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=YsDaQRhjxRorBrLOSdNrbtiK1MljTSIGfp+ddu2H/wA=;
        b=DnEkssBDvDf2dSgdu3hRxxMsEdtOUsVGCHdBpNqd4Hch+VXuAjrD/FTCo4RLT+Ss+w
         9onC1jfkOstmDSdNR0eVjTTZk2NDfPDHu745/R7sAqk5U7GivGgIo0gljEZyJqWmiO8Z
         Rrr6/HIW19mVuXsuHgSDlit5aKFZlfN5yzOt2Z6nsn56OB9x9RG5zbO8GzkrcVC/Km0X
         Xlb7crX0Xu2DW+6TuZCe6xOe1Rv6Sb7yMJl7c5hQKr1MTN5kyfWGOArkbGi85/NeN3vJ
         Xf9jsu3BXpzEJGkNZ2Nz+HDvM23JoVhfQ6WJa9mjeM3Vn55QYZALlcliAiDpnIJ39cQl
         rybA==
X-Forwarded-Encrypted: i=1; AJvYcCXy03qJe4KA8sdcojU4wtFPjRdVvZfB87gkaWBfiTlxZqIVudRqqx0NLAnfJbADmbW8Z2wXenanY8c=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyWGdmSMIQnCIGgA20Htd4ml6Gm/x8uab4pUDvlrDuB0AcqSrtA
	5gDF//oEt4DuQkSDKvXsctmaXZfdeyQGTBflAHf2d4tB7gr/xoRINthb
X-Gm-Gg: ASbGncus1Dh5IeMCOqEcHCr46k6nrStQUnTfJHcw1G6CMAOBghteQFfZHI6vYfsUo+W
	kMFoMnY+9hxLnop9tPKGMGB8YWTHPBCDHYYS24zG1zeOeLTVysVMr3qldlcBX02Bp5lZKKOSYQp
	UNiWUrr5hjQlbMOl1nXiQUYI8XU6b4I48WaKQWvfjL1M7TbjaqRrAn49lvDP/2JCUd6ffkvjNbV
	Kmc5ZBBH0fHt7tP5KMqr6Xce6bGC1wGAg87VVY1iH0Bj3CT4YBkjsysKwyw59yR6eC47XedKHfc
	UiJyXntJosZjl2UA84UWrD4G5yL3sLJAuh7GyokeKAwOyElE+uwroTR+2kT6W7FlX1gCu+oPLdC
	gf8nsfaS7MPxaLXSBTb2I6Bz/y0A0MUSWo94=
X-Google-Smtp-Source: AGHT+IH7YhndhC69dWuVU98BaWJ51nk20+rxv75pn8qJbPAqi1OPjQDxxgf1/QcWOHUajqksPXScbg==
X-Received: by 2002:a17:907:7f05:b0:ae0:dfa5:3520 with SMTP id a640c23a62f3a-ae3c2c53817mr271096966b.31.1751459676051;
        Wed, 02 Jul 2025 05:34:36 -0700 (PDT)
Content-Type: multipart/alternative;
 boundary="------------A1396iySGlYmqurO6Kp00DG1"
Message-ID: <71c8627b-6a43-457b-964f-4fa5269f2dba@gmail.com>
Date: Wed, 2 Jul 2025 14:34:34 +0200
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
 <564d3ea1-d79a-490f-a756-78a55b2befda@gmail.com>
 <cef99e20-7585-4de7-84fb-a17bd1bd9a1a@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <cef99e20-7585-4de7-84fb-a17bd1bd9a1a@suse.com>

This is a multi-part message in MIME format.
--------------A1396iySGlYmqurO6Kp00DG1
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 7/2/25 1:56 PM, Jan Beulich wrote:
> On 02.07.2025 13:48, Oleksii Kurochko wrote:
>> On 7/1/25 3:04 PM, Jan Beulich wrote:
>>> On 10.06.2025 15:05, Oleksii Kurochko wrote:
>>>> @@ -113,3 +117,58 @@ int p2m_init(struct domain *d)
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
>>>> +            ACCESS_ONCE(d->arch.paging.p2m_total_pages)++;
>>>> +            page_list_add_tail(pg, &d->arch.paging.p2m_freelist);
>>>> +        }
>>>> +        else if ( d->arch.paging.p2m_total_pages > pages )
>>>> +        {
>>>> +            /* Need to return memory to domheap */
>>>> +            pg = page_list_remove_head(&d->arch.paging.p2m_freelist);
>>>> +            if( pg )
>>>> +            {
>>>> +                ACCESS_ONCE(d->arch.paging.p2m_total_pages)--;
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
>>>> +        {
>>>> +            *preempted = true;
>>>> +            return -ERESTART;
>>>> +        }
>>>> +    }
>>>> +
>>>> +    return 0;
>>>> +}
>>> Btw, with the order-2 requirement for the root page table, you may want to
>>> consider an alternative approach: Here you could allocate some order-2
>>> pages (possibly up to as many as a domain might need, which right now
>>> would be exactly one), put them on a separate list, and consume the root
>>> table(s) from there. If you run out of pages on the order-0 list, you
>>> could shatter a page from the order-2 one (as long as that's still non-
>>> empty). The difficulty would be with freeing, where a previously shattered
>>> order-2 page would be nice to re-combine once all of its constituents are
>>> free again.
>> Do we really need to re-combine shattered order-2 pages?
>> It seems like the only usage for this order-2-list is to have 1 order-2 page
>> for root page table. All other pages are 4k pages so even if we won't re-combine
>> them, nothing serious will happen.
> That's true as long as you have only the host-P2M for each domain. Once you
> have alternative or nested ones, things may change (unless they all have
> their roots also set up right during domain creation, which would seem
> wasteful to me).

I don't know how it is implemented on x86, but I thought that if it is needed alternative
or nested P2Ms then it is needed to provide separated from host-P2M page tables (root page
table including).

~ Oleksii

>
>>>    The main benefit would be avoiding the back and forth in patch
>>> 6.
>> ...
>> Can’t we just avoid putting the pages (which will get back) for the root page table into the
>> freelist at all?
> Again, this may be fine as long as there's only the host-P2M. That sole root
> won't ever be freed anyway during the lifetime of a domain.
>
> Jan
--------------A1396iySGlYmqurO6Kp00DG1
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
    <div class="moz-cite-prefix">On 7/2/25 1:56 PM, Jan Beulich wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:cef99e20-7585-4de7-84fb-a17bd1bd9a1a@suse.com">
      <pre wrap="" class="moz-quote-pre">On 02.07.2025 13:48, Oleksii Kurochko wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">On 7/1/25 3:04 PM, Jan Beulich wrote:
</pre>
        <blockquote type="cite">
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
          <pre wrap="" class="moz-quote-pre">Btw, with the order-2 requirement for the root page table, you may want to
consider an alternative approach: Here you could allocate some order-2
pages (possibly up to as many as a domain might need, which right now
would be exactly one), put them on a separate list, and consume the root
table(s) from there. If you run out of pages on the order-0 list, you
could shatter a page from the order-2 one (as long as that's still non-
empty). The difficulty would be with freeing, where a previously shattered
order-2 page would be nice to re-combine once all of its constituents are
free again.
</pre>
        </blockquote>
        <pre wrap="" class="moz-quote-pre">
Do we really need to re-combine shattered order-2 pages?
It seems like the only usage for this order-2-list is to have 1 order-2 page
for root page table. All other pages are 4k pages so even if we won't re-combine
them, nothing serious will happen.
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
That's true as long as you have only the host-P2M for each domain. Once you
have alternative or nested ones, things may change (unless they all have
their roots also set up right during domain creation, which would seem
wasteful to me).</pre>
    </blockquote>
    <pre>I don't know how it is implemented on x86, but I thought that if it is needed alternative
or nested P2Ms then it is needed to provide separated from host-P2M page tables (root page
table including).

~ Oleksii
</pre>
    <blockquote type="cite"
      cite="mid:cef99e20-7585-4de7-84fb-a17bd1bd9a1a@suse.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <blockquote type="cite">
          <pre wrap="" class="moz-quote-pre">  The main benefit would be avoiding the back and forth in patch
6.
</pre>
        </blockquote>
        <pre wrap="" class="moz-quote-pre">
...
Can’t we just avoid putting the pages (which will get back) for the root page table into the
freelist at all?
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Again, this may be fine as long as there's only the host-P2M. That sole root
won't ever be freed anyway during the lifetime of a domain.

Jan
</pre>
    </blockquote>
  </body>
</html>

--------------A1396iySGlYmqurO6Kp00DG1--

