Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 79B86AF11E7
	for <lists+xen-devel@lfdr.de>; Wed,  2 Jul 2025 12:30:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1030898.1404581 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uWujQ-0006Zv-D4; Wed, 02 Jul 2025 10:30:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1030898.1404581; Wed, 02 Jul 2025 10:30:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uWujQ-0006Xd-87; Wed, 02 Jul 2025 10:30:24 +0000
Received: by outflank-mailman (input) for mailman id 1030898;
 Wed, 02 Jul 2025 10:30:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QWaS=ZP=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1uWujO-0006XT-Ce
 for xen-devel@lists.xenproject.org; Wed, 02 Jul 2025 10:30:22 +0000
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [2a00:1450:4864:20::531])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8e67e135-572f-11f0-a313-13f23c93f187;
 Wed, 02 Jul 2025 12:30:21 +0200 (CEST)
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-60702d77c60so13412409a12.3
 for <xen-devel@lists.xenproject.org>; Wed, 02 Jul 2025 03:30:21 -0700 (PDT)
Received: from [192.168.1.5] (user-109-243-64-38.play-internet.pl.
 [109.243.64.38]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-60c8320b5aasm8749241a12.76.2025.07.02.03.30.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Jul 2025 03:30:20 -0700 (PDT)
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
X-Inumbo-ID: 8e67e135-572f-11f0-a313-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751452221; x=1752057021; darn=lists.xenproject.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0NVSTMNC3j8pm5jNV++VC2+3SwLAi/OqSmnxCIZ04P4=;
        b=JV+0SpY7y3UvP9REmE2VcuVeo7hlCIXjfnfElMKZyJWliW+aYQcbvp/2LNwF5vwu8i
         FkQOA/fVsGXZ/eD7XDi1ezZZ3gzF2xIHqNWnXDpWo4S4UYPbvqMvlPJqe3I2O1fv8/GR
         6aNWtX7XB6YWCDV8aafLoqpMnhKk15uOdCB/NO19L55hsr1ouAkRhbG4PxUyjrcaInuc
         MwqHfAdLeNRCl++LKwMTbB3w08oBUMhKG5YNoKf+Nhrah6ajt+uStga6eFsc2jYUQeR+
         5pry+pzx+0PNf7Uceq4GfgqXq7UiCgMAtSQdQwtOmUV68Z8+OCpliPGfHb7zOayEPnaI
         jhVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751452221; x=1752057021;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=0NVSTMNC3j8pm5jNV++VC2+3SwLAi/OqSmnxCIZ04P4=;
        b=V+Mi9SdHKUBDpsh81jsgGduxeQ6x8egDq0rQnHwott+Uo2yPsBRBDfnro3+fZ2lUQ2
         TTYIi941iNbWg2ov+RxdD1iYNcohkVLgUsQe0LG6/BH+n2WRXoykba51DssmTsgxhbjY
         TNj1w9EEj4bXB8hNX7FlJyhCM+7fBpch90rIea4rtmSWdB9i+cIzUXqaav5/N0MSQoFz
         jp/AzvEnSvrQUsz6dtAnUY/MD/16kx7NJxZ3i0qHpx2XSllvdCxrxw8+0pKbEfs3tQzR
         GQVa5/I1MrGu2zw/OY9nEJBtDnZyqpvVkp3r6vuYHWPVrTkhu9oXSOseMZtroOshQLVn
         O3bg==
X-Forwarded-Encrypted: i=1; AJvYcCVnIwHbR+FBzzdM5NKJ4Ff+7OZvlQvFA+Pm4eSLvLFhzOc6+RAwu+kKMoXDyUl8bfps7f7AkSOSd4o=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyBKSXan4Kh7FT79MspPwS905iHYeRVWPTpiyohSy74QSIpoGri
	VOgMyvqRGg4rfoEL1bxd0dVuKoSL76WNK2LcRRDWLPEC1QKZQC4Y06FS
X-Gm-Gg: ASbGncsZ5OViyLCD1NHtOh9ZEFpqy7Ob1g6ctQSq8BWSoBkEh3xirnSnIf9ihsr+esm
	XqWijqlFx1el6tuXalFH8VM3k0DjU9We8qgmzfmbzdadzi963Pqgx0YKmmvjNtPufPkWgw/Jco/
	2XutDL5MYIFpKkl1zzjoN/zDM6Y4/XOXjh17S3Kr6rjEHrSScCFhvNix5H2cgobeLDcr6gTTeUw
	dfqV7e8qgHPBRbAmPhZMnSX70OyW77ih8i8ZBDJQzAYSVQReKMlewW+rtBFgn+xGhHYy/2HMs74
	q7ReIcJNEAPvx6c+xuKXHJMU2DMnHrrqg1lMuJSIa8PhtJCs+3VyC+wUHeInATh92Cus0rgwjCh
	wy2SQiAgYHhWOOBSnDUbmxGZJbha8eeITBjo=
X-Google-Smtp-Source: AGHT+IHLj+ITI9NVdg2n3hfLRnoGSX31ytqgIU1qLoT+i5sXn3coIzE5m+4xwzTassuiF9sjEetZZw==
X-Received: by 2002:a05:6402:1d50:b0:606:b4de:f72c with SMTP id 4fb4d7f45d1cf-60e52c13939mr1919952a12.0.1751452220610;
        Wed, 02 Jul 2025 03:30:20 -0700 (PDT)
Content-Type: multipart/alternative;
 boundary="------------Mwjxg0GwoR7kjzjGE0V9PMrY"
Message-ID: <5bcdd74e-a76b-4ddd-97bc-d6ed973630c8@gmail.com>
Date: Wed, 2 Jul 2025 12:30:19 +0200
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
--------------Mwjxg0GwoR7kjzjGE0V9PMrY
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
> free again. The main benefit would be avoiding the back and forth in patch
> 6.

It is an option.

But I'm still not 100% sure it's necessary to allocate the root page table
from the freelist. We could simply allocate the root page table from the
domheap (as is done for hardware domains) and reserve the freelist for other
pages.
The freelist is specific to Dom0less guest domains and is primarily used to
limit the amount of memory available for the guest—essentially for static
configurations where you want a clear and fixed limit on p2m allocations.

~ Oleksii


--------------Mwjxg0GwoR7kjzjGE0V9PMrY
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
free again. The main benefit would be avoiding the back and forth in patch
6.</pre>
    </blockquote>
    <pre>It is an option.

But I'm still not 100% sure it's necessary to allocate the root page table
from the freelist. We could simply allocate the root page table from the
domheap (as is done for hardware domains) and reserve the freelist for other
pages.
The freelist is specific to Dom0less guest domains and is primarily used to
limit the amount of memory available for the guest—essentially for static
configurations where you want a clear and fixed limit on p2m allocations.

~ Oleksii
</pre>
    <br>
  </body>
</html>

--------------Mwjxg0GwoR7kjzjGE0V9PMrY--

