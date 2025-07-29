Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AE3ABB14EAC
	for <lists+xen-devel@lfdr.de>; Tue, 29 Jul 2025 15:48:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1062718.1428447 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ugkgP-0000Ab-4p; Tue, 29 Jul 2025 13:47:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1062718.1428447; Tue, 29 Jul 2025 13:47:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ugkgP-00008K-2F; Tue, 29 Jul 2025 13:47:57 +0000
Received: by outflank-mailman (input) for mailman id 1062718;
 Tue, 29 Jul 2025 13:47:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jUB3=2K=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1ugkgN-00008E-AK
 for xen-devel@lists.xenproject.org; Tue, 29 Jul 2025 13:47:55 +0000
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [2a00:1450:4864:20::62d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9f9815b4-6c82-11f0-b895-0df219b8e170;
 Tue, 29 Jul 2025 15:47:52 +0200 (CEST)
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-ae9be1697easo181811666b.1
 for <xen-devel@lists.xenproject.org>; Tue, 29 Jul 2025 06:47:52 -0700 (PDT)
Received: from [192.168.1.5] (user-109-243-64-38.play-internet.pl.
 [109.243.64.38]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-af635acde35sm581532666b.116.2025.07.29.06.47.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 29 Jul 2025 06:47:50 -0700 (PDT)
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
X-Inumbo-ID: 9f9815b4-6c82-11f0-b895-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753796872; x=1754401672; darn=lists.xenproject.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kNSojHiSVuZCc/60ltEKX8BpShXdaV8C4LMTmVnPd6c=;
        b=FLb9F95MzwcGclQri/GjfL9EoTNC+dmIKuLf/xUlbq3eHthk628mXc/qRQAEVylbse
         ndQfwuo4dCH94eXIoRLeL1/VBt7rX7T9F6fou8C9hMM3w5gZj1VWz3yaW1a1hA99uEtW
         DGDtPjsEDcc8IUz/jWTaPSlUFkh3wpmLcd37XKn+foJ0onhIwTxp/Zeg+P6z8WZPH3O1
         xEeVBg674OgBWtZtU2JEmgxMmu9RFCzU+jVzj+9v+l6nQP7GAV70qghthvTymevM0jfP
         fOkoBa7XQtsoAvFhCGIsuFfE86gvYkZzzInf6oIOOdMFIb3uGqpvg7hVgAhCHlTrNT3s
         dwRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753796872; x=1754401672;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=kNSojHiSVuZCc/60ltEKX8BpShXdaV8C4LMTmVnPd6c=;
        b=eA07IZ+NJVo0g5xzbGuRcxd7/i2D9TxZzh7cULqQ2POCHHWQ1UJx1HetpktMXJUXBA
         uz84gPO52xA1WzyANn3piOUhxvRVIoVuiTi7pFsBhWgjjWtWZRG66lRnk8n3k2ewIHbW
         m5l4Ur7yOvRPEUm2SE4bmCUlqD3CUff8P9H0ysv9yra9IRKaHST9YACpcr4D33bb7Dw4
         X3DV8ccTJ8u0Jzxy/D+xlmZLKVo6Vd5z/6yJ5N8lJVTNjDRlfujwPLX/gwRBkRiW8Ohr
         +ToOKFeR4os4CbmagOEVNCge6Y6UQG2Y9UYR4Ic60rNUnB2MmPf6V4OLg7WHB2yqMUsL
         pjPA==
X-Forwarded-Encrypted: i=1; AJvYcCV+b3QQyqXtRNZL+v6YiaMM3VV8rWJ/AFvp+YHjX1go2ASDOphm2bK8k9p4De+IoC72Xbjb5+Nfepk=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyBmTf67hgvXf2cMWust52ykcij8Fhx1X4Ao5yoR1eKS4xa4NQt
	3GmWbhw0mlJP20JGjnvnf3FyHJlkxrUH1k//h0Ki3nAaPVNPquOjbcES
X-Gm-Gg: ASbGncvlJJQIqlofd+rtqAcprtxfuaUQWifcig2EvQuX+AfOF9Acw/WkXUAa86Okxkh
	2n63tCSKndadZqlCRew7caITzh2DcTeatg0u4LispVYuz+sHMmnMTD+1T9bRsDeVClOPTea4THM
	ffqkDStcdb2kpM45N23VfSwt7vEj3UX4Xo4jpy2C1DFsnJAkO5BE7LAzgRigRpjNpuIWkIUNTuw
	LVWUkg+jgCKkTfvZPgRlwW+p8Up9nuAuCp4IpT+QTX7Spd6XStGPkC6K5+G0Z77v9gdT1W4Qbyo
	RVNwFktJoqBqVLHHfK9nN1t5YLtNnrsu6o1cHM7FM646F+kD47BOAjo+/4NOM5oniJDhgZV4GJa
	2w3FC7JhnzSRDa+YaHMpWN19ms/YRK0ilqR2d4XWX3g0j+EbdDn5pyHMQ9tkhGT233eahzss=
X-Google-Smtp-Source: AGHT+IEx5yfWSYe27MiNnlTx0vKI+6hF0A5sJZbPX39ekBunc5ZO5CxarfUvsBIgQ0zpw27m49uV2g==
X-Received: by 2002:a17:907:86a1:b0:ae9:cd0a:5827 with SMTP id a640c23a62f3a-af7bfd40adcmr401831266b.20.1753796871898;
        Tue, 29 Jul 2025 06:47:51 -0700 (PDT)
Content-Type: multipart/alternative;
 boundary="------------0oN9KqlsgIWkUhsEtceuOa1O"
Message-ID: <616c30ed-72c1-449d-bbe1-1ad263bb2d50@gmail.com>
Date: Tue, 29 Jul 2025 15:47:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 16/17] xen/riscv: implement mfn_valid() and page
 reference, ownership handling helpers
To: Jan Beulich <jbeulich@suse.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org, Stefano Stabellini <sstabellini@kernel.org>
References: <cover.1749555949.git.oleksii.kurochko@gmail.com>
 <50159d05e75c14ca62ee6cab5a4d30645981827a.1749555949.git.oleksii.kurochko@gmail.com>
 <aa769aa7-739c-4e59-8aea-d07398025b2f@suse.com>
 <831c7c26-51e1-4834-b08e-03607cd438aa@suse.com>
 <9dfc64b3-7dda-4620-9da6-388cecc3b9ad@gmail.com>
 <b669f089-f0a1-4d46-a508-d8be8ea28975@suse.com>
 <52accd52-a363-4545-8e5c-0a5de3ca8eeb@gmail.com>
 <db9e161a-4eb4-4806-857a-abced7bad304@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <db9e161a-4eb4-4806-857a-abced7bad304@suse.com>

This is a multi-part message in MIME format.
--------------0oN9KqlsgIWkUhsEtceuOa1O
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 7/22/25 2:05 PM, Jan Beulich wrote:
> On 22.07.2025 14:03, Oleksii Kurochko wrote:
>> On 7/21/25 3:39 PM, Jan Beulich wrote:
>>> On 18.07.2025 16:37, Oleksii Kurochko wrote:
>>>> On 7/2/25 12:28 PM, Jan Beulich wrote:
>>>>> On 02.07.2025 12:09, Jan Beulich wrote:
>>>>>> On 10.06.2025 15:05, Oleksii Kurochko wrote:
>>>>>>> @@ -613,3 +612,91 @@ void __iomem *ioremap(paddr_t pa, size_t len)
>>>>>>>     {
>>>>>>>         return ioremap_attr(pa, len, PAGE_HYPERVISOR_NOCACHE);
>>>>>>>     }
>>>>>>> +
>>>>>>> +int page_is_ram_type(unsigned long mfn, unsigned long mem_type)
>>>>>>> +{
>>>>>>> +    ASSERT_UNREACHABLE();
>>>>>>> +
>>>>>>> +    return 0;
>>>>>>> +}
>>>>>>> +
>>>>>>> +static struct domain *page_get_owner_and_nr_reference(struct page_info *page,
>>>>>>> +                                                      unsigned long nr)
>>>>>>> +{
>>>>>>> +    unsigned long x, y = page->count_info;
>>>>>>> +    struct domain *owner;
>>>>>>> +
>>>>>>> +    /* Restrict nr to avoid "double" overflow */
>>>>>>> +    if ( nr >= PGC_count_mask )
>>>>>>> +    {
>>>>>>> +        ASSERT_UNREACHABLE();
>>>>>>> +        return NULL;
>>>>>>> +    }
>>>>>> I question the validity of this, already in the Arm original: I can't spot
>>>>>> how the caller guarantees to stay below that limit. Without such an
>>>>>> (attempted) guarantee, ASSERT_UNREACHABLE() is wrong to use. All I can see
>>>>>> is process_shm_node() incrementing shmem_extra[].nr_shm_borrowers, without
>>>>>> any limit check.
>>>>>>
>>>>>>> +    do {
>>>>>>> +        x = y;
>>>>>>> +        /*
>>>>>>> +         * Count ==  0: Page is not allocated, so we cannot take a reference.
>>>>>>> +         * Count == -1: Reference count would wrap, which is invalid.
>>>>>>> +         */
>>>>>> May I once again ask that you look carefully at comments (as much as at code)
>>>>>> you copy. Clearly this comment wasn't properly updated when the bumping by 1
>>>>>> was changed to bumping by nr.
>>>>>>
>>>>>>> +        if ( unlikely(((x + nr) & PGC_count_mask) <= nr) )
>>>>>>> +            return NULL;
>>>>>>> +    }
>>>>>>> +    while ( (y = cmpxchg(&page->count_info, x, x + nr)) != x );
>>>>>>> +
>>>>>>> +    owner = page_get_owner(page);
>>>>>>> +    ASSERT(owner);
>>>>>>> +
>>>>>>> +    return owner;
>>>>>>> +}
>>>>> There also looks to be a dead code concern here (towards the "nr" parameters
>>>>> here and elsewhere, when STATIC_SHM=n). Just that apparently we decided to
>>>>> leave out Misra rule 2.2 entirely.
>>>> I think that I didn't get what is an issue when STATIC_SHM=n, functions is still
>>>> going to be called through page_get_owner_and_reference(), at least, in page_alloc.c .
>>> Yes, but will "nr" ever be anything other than 1 then? IOW omitting the parameter
>>> would be fine. And that's what "dead code" is about.
>> Got it.
>>
>> So we don't have any SAF-x tag to mark this function as safe. What is the best one
>> solution for now if nr argument will be needed in the future for STATIC_SHM=y?
> Add the parameter at that point. Just like was done for Arm.

Hmm, it seems like I am confusing something... Arm has the same defintion and declaration
of page_get_owner_and_nr_reference().

~ Oleksii

--------------0oN9KqlsgIWkUhsEtceuOa1O
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
    <div class="moz-cite-prefix">On 7/22/25 2:05 PM, Jan Beulich wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:db9e161a-4eb4-4806-857a-abced7bad304@suse.com">
      <pre wrap="" class="moz-quote-pre">On 22.07.2025 14:03, Oleksii Kurochko wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">On 7/21/25 3:39 PM, Jan Beulich wrote:
</pre>
        <blockquote type="cite">
          <pre wrap="" class="moz-quote-pre">On 18.07.2025 16:37, Oleksii Kurochko wrote:
</pre>
          <blockquote type="cite">
            <pre wrap="" class="moz-quote-pre">On 7/2/25 12:28 PM, Jan Beulich wrote:
</pre>
            <blockquote type="cite">
              <pre wrap="" class="moz-quote-pre">On 02.07.2025 12:09, Jan Beulich wrote:
</pre>
              <blockquote type="cite">
                <pre wrap="" class="moz-quote-pre">On 10.06.2025 15:05, Oleksii Kurochko wrote:
</pre>
                <blockquote type="cite">
                  <pre wrap="" class="moz-quote-pre">@@ -613,3 +612,91 @@ void __iomem *ioremap(paddr_t pa, size_t len)
   {
       return ioremap_attr(pa, len, PAGE_HYPERVISOR_NOCACHE);
   }
+
+int page_is_ram_type(unsigned long mfn, unsigned long mem_type)
+{
+    ASSERT_UNREACHABLE();
+
+    return 0;
+}
+
+static struct domain *page_get_owner_and_nr_reference(struct page_info *page,
+                                                      unsigned long nr)
+{
+    unsigned long x, y = page-&gt;count_info;
+    struct domain *owner;
+
+    /* Restrict nr to avoid "double" overflow */
+    if ( nr &gt;= PGC_count_mask )
+    {
+        ASSERT_UNREACHABLE();
+        return NULL;
+    }
</pre>
                </blockquote>
                <pre wrap="" class="moz-quote-pre">I question the validity of this, already in the Arm original: I can't spot
how the caller guarantees to stay below that limit. Without such an
(attempted) guarantee, ASSERT_UNREACHABLE() is wrong to use. All I can see
is process_shm_node() incrementing shmem_extra[].nr_shm_borrowers, without
any limit check.

</pre>
                <blockquote type="cite">
                  <pre wrap="" class="moz-quote-pre">+    do {
+        x = y;
+        /*
+         * Count ==  0: Page is not allocated, so we cannot take a reference.
+         * Count == -1: Reference count would wrap, which is invalid.
+         */
</pre>
                </blockquote>
                <pre wrap="" class="moz-quote-pre">May I once again ask that you look carefully at comments (as much as at code)
you copy. Clearly this comment wasn't properly updated when the bumping by 1
was changed to bumping by nr.

</pre>
                <blockquote type="cite">
                  <pre wrap="" class="moz-quote-pre">+        if ( unlikely(((x + nr) &amp; PGC_count_mask) &lt;= nr) )
+            return NULL;
+    }
+    while ( (y = cmpxchg(&amp;page-&gt;count_info, x, x + nr)) != x );
+
+    owner = page_get_owner(page);
+    ASSERT(owner);
+
+    return owner;
+}
</pre>
                </blockquote>
              </blockquote>
              <pre wrap="" class="moz-quote-pre">There also looks to be a dead code concern here (towards the "nr" parameters
here and elsewhere, when STATIC_SHM=n). Just that apparently we decided to
leave out Misra rule 2.2 entirely.
</pre>
            </blockquote>
            <pre wrap="" class="moz-quote-pre">I think that I didn't get what is an issue when STATIC_SHM=n, functions is still
going to be called through page_get_owner_and_reference(), at least, in page_alloc.c .
</pre>
          </blockquote>
          <pre wrap="" class="moz-quote-pre">Yes, but will "nr" ever be anything other than 1 then? IOW omitting the parameter
would be fine. And that's what "dead code" is about.
</pre>
        </blockquote>
        <pre wrap="" class="moz-quote-pre">
Got it.

So we don't have any SAF-x tag to mark this function as safe. What is the best one
solution for now if nr argument will be needed in the future for STATIC_SHM=y?
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Add the parameter at that point. Just like was done for Arm.</pre>
    </blockquote>
    <pre>Hmm, it seems like I am confusing something... Arm has the same defintion and declaration
of page_get_owner_and_nr_reference().

~ Oleksii</pre>
  </body>
</html>

--------------0oN9KqlsgIWkUhsEtceuOa1O--

