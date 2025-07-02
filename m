Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 90468AF1381
	for <lists+xen-devel@lfdr.de>; Wed,  2 Jul 2025 13:18:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1030936.1404621 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uWvSj-0006Km-Fk; Wed, 02 Jul 2025 11:17:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1030936.1404621; Wed, 02 Jul 2025 11:17:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uWvSj-0006Hw-CJ; Wed, 02 Jul 2025 11:17:13 +0000
Received: by outflank-mailman (input) for mailman id 1030936;
 Wed, 02 Jul 2025 11:17:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QWaS=ZP=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1uWvSh-0006Hq-Tx
 for xen-devel@lists.xenproject.org; Wed, 02 Jul 2025 11:17:11 +0000
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [2a00:1450:4864:20::52f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 18ee9f24-5736-11f0-a313-13f23c93f187;
 Wed, 02 Jul 2025 13:17:10 +0200 (CEST)
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-60c79bedc19so6881787a12.3
 for <xen-devel@lists.xenproject.org>; Wed, 02 Jul 2025 04:17:10 -0700 (PDT)
Received: from [192.168.1.5] (user-109-243-64-38.play-internet.pl.
 [109.243.64.38]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-60c832165b2sm9065340a12.77.2025.07.02.04.17.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Jul 2025 04:17:09 -0700 (PDT)
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
X-Inumbo-ID: 18ee9f24-5736-11f0-a313-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751455030; x=1752059830; darn=lists.xenproject.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0kAiQplcTYV/4LTU0V+kILwyX4JsHV1vaG0H0TJNdEc=;
        b=URiHdsJ+yeXivYW/1Xu35OryCU1blWJs2QQYoIii8DRjeKF+77O9dYak39LmDBa+tg
         t3y/n7HYJAbJsbdn4LeEFLJH1UHLd34DNdQmGSTcL5J0N1qYCfYlXXCxYQJS4OJRg6kp
         jWLRdtoOCzUlxHswsJD7AqdLmj7UxKs0zyGSFu9cTkiWi7HfhA7crPPGTiQccpImf4x2
         /zQRb5NhT6rf1G57A0aKTfGMFu8fAg36GZXROM0bTQq6yYoIFsiT//tBy/6+8wCMDw3t
         mNdKhY2SrWaKarc2jJGTDnWr0ndfqcbSe50eUCdVGgUxdGFwYtENQmMYvDQSTm6OQnPP
         LGUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751455030; x=1752059830;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=0kAiQplcTYV/4LTU0V+kILwyX4JsHV1vaG0H0TJNdEc=;
        b=VhckDdi8MMFIg+ElTQp1k1sLcZ5/WyvuO/Y6M0SHvd8ZYXy7nTdgigiskPYzRP1q5/
         zmehbpgZ53XYM0sFlhryJUHaOnURXebnXBhs96aY2vUQpPuzENIH7bXCSPj5h2wnZyWm
         0SZ5jBh9z4ILLF1jVuMafPwJ522N0QSTkpw7PJToV6vFwu/p8/LWmB/QK0MTrbc85gGq
         96aZsLwJKkGQvVvX07L53tNAUCFJcgR+EcH0tHSq3xjNygNYI52lbSS5AiycJKSFv/eL
         K2li6n2wGZUEsjp6cNawXkjDbX1/CphRTiPgDWDX2b5i9nM7LL03nE6c1KA2ESD5/S3o
         oq1w==
X-Forwarded-Encrypted: i=1; AJvYcCV5cAx8jgDUDUiR/koqp6U1Tr8lEMCHtBOEp0eTsjB2rBQ9kHAFLabrO7PWYRA9Ilw85Awb11qzAkY=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzgbaefHbup2Yc5F1hbtikl4sKDtNBHukriqQ+7CrkfvlMw28hr
	BZcleXKNphUfpJuFoj8rx97psqAA9knVgrl60Iur+3P978wSCtL2WihH
X-Gm-Gg: ASbGnctF/hvPeC/prnYdRAZxqLM9ylfcXvF1+uQOCKCqlA7rfAQEMB01nmFUlClDxQy
	uczEfU+gxKYRBUfXSP9/khvDKAw75hWE0gpyAjEbGr5sQyYVMpDkDtO/2amHhXjrtbJIDFjnZ2G
	YZKwfoBqx+QPia3kcGgUnKvRZapQAK0IlaRMyq8Ov6AZ90EJhg6NSqFusqEqZx7yCNU/1uaiptv
	peRFXHW+DFCpvwKJEYapVjERa3pGxGHKwAAeVzdTeeCGKwcsezcNRQOdMUZYdsYL/Ml2OieQCNB
	7u8zS67akkwDHNara/94okmcbcDHCUrP3GDCQerwgxyC4fXR1Dv+TKRyvK3S/onakgXrlzaR37h
	4RhDOF4a0jxEgYRBtFL3s4ukxuwbhyYyUFPc=
X-Google-Smtp-Source: AGHT+IEXLFt6I3zGgbEv4nHVaNkJo0tSpRcNSdMvOYB+7Y/FgGwTesaaN5dmTeJPw9h+Hk7Wz6A/uA==
X-Received: by 2002:a05:6402:3229:b0:606:c8fa:d059 with SMTP id 4fb4d7f45d1cf-60e52ce947amr1792411a12.14.1751455029780;
        Wed, 02 Jul 2025 04:17:09 -0700 (PDT)
Content-Type: multipart/alternative;
 boundary="------------AXN9ftRTYo3kin0v2pq0I3mz"
Message-ID: <d1eea928-0275-467a-a177-6f675efdbd52@gmail.com>
Date: Wed, 2 Jul 2025 13:17:08 +0200
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
 <5bcdd74e-a76b-4ddd-97bc-d6ed973630c8@gmail.com>
 <44719b33-e770-4d2c-a063-77f35e413c77@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <44719b33-e770-4d2c-a063-77f35e413c77@suse.com>

This is a multi-part message in MIME format.
--------------AXN9ftRTYo3kin0v2pq0I3mz
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 7/2/25 12:34 PM, Jan Beulich wrote:
> On 02.07.2025 12:30, Oleksii Kurochko wrote:
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
>>> free again. The main benefit would be avoiding the back and forth in patch
>>> 6.
>> It is an option.
>>
>> But I'm still not 100% sure it's necessary to allocate the root page table
>> from the freelist. We could simply allocate the root page table from the
>> domheap (as is done for hardware domains) and reserve the freelist for other
>> pages.
>> The freelist is specific to Dom0less guest domains and is primarily used to
>> limit the amount of memory available for the guest—essentially for static
>> configurations where you want a clear and fixed limit on p2m allocations.
> Is that true? My understanding is that this pre-populated pool is used by
> all DomU-s, whether or not under dom0less.

I think you are right, I just automatically decided so as this pre-populated
pool is set now only in dom0less.

~ Oleksii

>
> Plus we're meaning to move towards better accounting of memory used by a
> domain (besides its actual allocation). Allocating the root table from the
> domain heap would move us one small step farther away from there.
>
> Jan
--------------AXN9ftRTYo3kin0v2pq0I3mz
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
    <div class="moz-cite-prefix">On 7/2/25 12:34 PM, Jan Beulich wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:44719b33-e770-4d2c-a063-77f35e413c77@suse.com">
      <pre wrap="" class="moz-quote-pre">On 02.07.2025 12:30, Oleksii Kurochko wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">
On 7/1/25 3:04 PM, Jan Beulich wrote:
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
free again. The main benefit would be avoiding the back and forth in patch
6.
</pre>
        </blockquote>
        <pre wrap="" class="moz-quote-pre">
It is an option.

But I'm still not 100% sure it's necessary to allocate the root page table
from the freelist. We could simply allocate the root page table from the
domheap (as is done for hardware domains) and reserve the freelist for other
pages.
The freelist is specific to Dom0less guest domains and is primarily used to
limit the amount of memory available for the guest—essentially for static
configurations where you want a clear and fixed limit on p2m allocations.
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Is that true? My understanding is that this pre-populated pool is used by
all DomU-s, whether or not under dom0less.</pre>
    </blockquote>
    <pre>I think you are right, I just automatically decided so as this pre-populated
pool is set now only in dom0less.

~ Oleksii

</pre>
    <blockquote type="cite"
      cite="mid:44719b33-e770-4d2c-a063-77f35e413c77@suse.com">
      <pre wrap="" class="moz-quote-pre">

Plus we're meaning to move towards better accounting of memory used by a
domain (besides its actual allocation). Allocating the root table from the
domain heap would move us one small step farther away from there.

Jan
</pre>
    </blockquote>
  </body>
</html>

--------------AXN9ftRTYo3kin0v2pq0I3mz--

