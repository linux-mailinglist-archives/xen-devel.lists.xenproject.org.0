Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 33DFBB0D8D8
	for <lists+xen-devel@lfdr.de>; Tue, 22 Jul 2025 14:03:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1052459.1421195 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ueBiZ-0002Lj-Op; Tue, 22 Jul 2025 12:03:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1052459.1421195; Tue, 22 Jul 2025 12:03:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ueBiZ-0002IZ-LD; Tue, 22 Jul 2025 12:03:35 +0000
Received: by outflank-mailman (input) for mailman id 1052459;
 Tue, 22 Jul 2025 12:03:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BNGt=2D=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1ueBiX-00024L-Vt
 for xen-devel@lists.xenproject.org; Tue, 22 Jul 2025 12:03:34 +0000
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [2a00:1450:4864:20::52c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e3173a71-66f3-11f0-b894-0df219b8e170;
 Tue, 22 Jul 2025 14:03:32 +0200 (CEST)
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-6097d144923so11518317a12.1
 for <xen-devel@lists.xenproject.org>; Tue, 22 Jul 2025 05:03:32 -0700 (PDT)
Received: from [192.168.1.5] (user-109-243-64-38.play-internet.pl.
 [109.243.64.38]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-612c8f37064sm6832375a12.28.2025.07.22.05.03.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Jul 2025 05:03:30 -0700 (PDT)
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
X-Inumbo-ID: e3173a71-66f3-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753185812; x=1753790612; darn=lists.xenproject.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8SCf6mIWvVeYcXhvaw2+nU/Mjs2fT8Wg1c58D6TrT/A=;
        b=GuSpxbO1nAAQHTneLb6AgcBIxW4VZOaKFqmBLb5IH+OI3FwpP0lGUXSVGF5E3oL1is
         WdQTG8LCEQoMU3wBzxwgOAK+qMteKiQ0UZpSkT/a+zyx7LZGJ2kVuD/eV/DuptSYGwcC
         M/SidPOlHmxmjNvFEBNkw+h818NhpsFNQvgitDLGN/spLdDX3Jx1OYdDvOXb5Nff5Bh6
         X0OfQUznVX+y4JRb4MPJS/0zmlT/KZY29juLC+00OSAnpwyr7hKw4mCJMfDxpRUv9QbK
         0FTwScT1gNr33Lg3X9x55+qa46bj2Mf+4p7i3wgvKDWu430ydAvHW2x8d6EOBdnAjVEz
         xluQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753185812; x=1753790612;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=8SCf6mIWvVeYcXhvaw2+nU/Mjs2fT8Wg1c58D6TrT/A=;
        b=ehZnY4RpB6sgY+P/EvplUOYdISIvN3O5PoIBMtPyMNXwJz+9SQvnQ4V9ZDr9SWsm1p
         a5dGsQbJi7JwvRJdc7mt4xBlVIDSo/gMs2oiFAxfskTw0xFJq9NDHilZ3XXXgg8eaM4f
         gpVFGDKiK+t7Dm47n8iQrgupZtggfk2PXvHEY2J/DDOT2R3QHygkf4ilZItH679F6Lu9
         FT5PI939Nfs202viZz6nlu3LLdCdECEn47fntdsCrX1Zyiti7dJoXqsSz6DYfy4g++wS
         E/e2Vcg2r8KUREMBll8nGsfv3urMMlEFn7nSqfMHxbnogbM9Y157qKCSWR292gcKzwcl
         6jbw==
X-Forwarded-Encrypted: i=1; AJvYcCXtDl3HGCAon3ogUCfB3wufapDLA6TzAh51y11U/KO1GehcUOYJohT9Fnyp72BWFLt7ervN/tz1AWY=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yxph/pMQb4mia+CQYYjD1EPLsjDyCj8hofell5PXzAM80uxL8sh
	60K1hWna0n0jNUqSxs4i0SkgbvIp7IM9t13NU/HHSEMiWQPfI+7rZY+d
X-Gm-Gg: ASbGncsE8WJ/BSSkvt8tTNV7ktOLO1bN+FfiBX4ggputjM7x6SHtGd968LxuQA+KqH/
	VLf2QiDrF92pVbad3Ka9ODBuNW00QXXCb37h6ePufQkKF3Z+guSejxN+YSoNsi7/FPXs6FLp85T
	G5fXP2Q02y4b2EBEBI54VKVmlNeoXSn42x/KXhxvskdO1TksJUzNJULeMOHXzOrmkEbZBKistdF
	pb0+RKXmTAP4aqM+pUhC3nudOUNDr6R6ELZIx1h+F/xN7A8m2cXFvveVB2PN+TCIKc9rsIt65Nw
	CyTF4K2gTpzsfjRUsS2hka14xv32TTokIOYzm0ibdfgIbBXNcahzNdjQ+r9Gt8OC4ekEI9nfIqr
	lo2NRfdtviMBVCDpp20UxR3Xuux2YVTUCxaF+o2WaUY2GRVCJGDVhuEDM94ZTCBgrMFpX+70=
X-Google-Smtp-Source: AGHT+IE44zUA6aMe9jdQFSbp2HDrKmG1uZprSO+/uIG7maFNE//flgzJ9U+6y8fCVn6JxcmxnWiYZQ==
X-Received: by 2002:a05:6402:35d4:b0:602:427c:452b with SMTP id 4fb4d7f45d1cf-61346c91e67mr3161670a12.3.1753185811335;
        Tue, 22 Jul 2025 05:03:31 -0700 (PDT)
Content-Type: multipart/alternative;
 boundary="------------begog9NdKk6YXoEFN9iQ8OZ3"
Message-ID: <52accd52-a363-4545-8e5c-0a5de3ca8eeb@gmail.com>
Date: Tue, 22 Jul 2025 14:03:29 +0200
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
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <b669f089-f0a1-4d46-a508-d8be8ea28975@suse.com>

This is a multi-part message in MIME format.
--------------begog9NdKk6YXoEFN9iQ8OZ3
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 7/21/25 3:39 PM, Jan Beulich wrote:
> On 18.07.2025 16:37, Oleksii Kurochko wrote:
>> On 7/2/25 12:28 PM, Jan Beulich wrote:
>>> On 02.07.2025 12:09, Jan Beulich wrote:
>>>> On 10.06.2025 15:05, Oleksii Kurochko wrote:
>>>>> @@ -613,3 +612,91 @@ void __iomem *ioremap(paddr_t pa, size_t len)
>>>>>    {
>>>>>        return ioremap_attr(pa, len, PAGE_HYPERVISOR_NOCACHE);
>>>>>    }
>>>>> +
>>>>> +int page_is_ram_type(unsigned long mfn, unsigned long mem_type)
>>>>> +{
>>>>> +    ASSERT_UNREACHABLE();
>>>>> +
>>>>> +    return 0;
>>>>> +}
>>>>> +
>>>>> +static struct domain *page_get_owner_and_nr_reference(struct page_info *page,
>>>>> +                                                      unsigned long nr)
>>>>> +{
>>>>> +    unsigned long x, y = page->count_info;
>>>>> +    struct domain *owner;
>>>>> +
>>>>> +    /* Restrict nr to avoid "double" overflow */
>>>>> +    if ( nr >= PGC_count_mask )
>>>>> +    {
>>>>> +        ASSERT_UNREACHABLE();
>>>>> +        return NULL;
>>>>> +    }
>>>> I question the validity of this, already in the Arm original: I can't spot
>>>> how the caller guarantees to stay below that limit. Without such an
>>>> (attempted) guarantee, ASSERT_UNREACHABLE() is wrong to use. All I can see
>>>> is process_shm_node() incrementing shmem_extra[].nr_shm_borrowers, without
>>>> any limit check.
>>>>
>>>>> +    do {
>>>>> +        x = y;
>>>>> +        /*
>>>>> +         * Count ==  0: Page is not allocated, so we cannot take a reference.
>>>>> +         * Count == -1: Reference count would wrap, which is invalid.
>>>>> +         */
>>>> May I once again ask that you look carefully at comments (as much as at code)
>>>> you copy. Clearly this comment wasn't properly updated when the bumping by 1
>>>> was changed to bumping by nr.
>>>>
>>>>> +        if ( unlikely(((x + nr) & PGC_count_mask) <= nr) )
>>>>> +            return NULL;
>>>>> +    }
>>>>> +    while ( (y = cmpxchg(&page->count_info, x, x + nr)) != x );
>>>>> +
>>>>> +    owner = page_get_owner(page);
>>>>> +    ASSERT(owner);
>>>>> +
>>>>> +    return owner;
>>>>> +}
>>> There also looks to be a dead code concern here (towards the "nr" parameters
>>> here and elsewhere, when STATIC_SHM=n). Just that apparently we decided to
>>> leave out Misra rule 2.2 entirely.
>> I think that I didn't get what is an issue when STATIC_SHM=n, functions is still
>> going to be called through page_get_owner_and_reference(), at least, in page_alloc.c .
> Yes, but will "nr" ever be anything other than 1 then? IOW omitting the parameter
> would be fine. And that's what "dead code" is about.

Got it.

So we don't have any SAF-x tag to mark this function as safe. What is the best one
solution for now if nr argument will be needed in the future for STATIC_SHM=y?

~ Oleksii

--------------begog9NdKk6YXoEFN9iQ8OZ3
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
    <div class="moz-cite-prefix">On 7/21/25 3:39 PM, Jan Beulich wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:b669f089-f0a1-4d46-a508-d8be8ea28975@suse.com">
      <pre wrap="" class="moz-quote-pre">On 18.07.2025 16:37, Oleksii Kurochko wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">
On 7/2/25 12:28 PM, Jan Beulich wrote:
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
        <pre wrap="" class="moz-quote-pre">
I think that I didn't get what is an issue when STATIC_SHM=n, functions is still
going to be called through page_get_owner_and_reference(), at least, in page_alloc.c .
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Yes, but will "nr" ever be anything other than 1 then? IOW omitting the parameter
would be fine. And that's what "dead code" is about.</pre>
    </blockquote>
    <pre>Got it.

So we don't have any SAF-x tag to mark this function as safe. What is the best one
solution for now if nr argument will be needed in the future for STATIC_SHM=y?

~ Oleksii</pre>
  </body>
</html>

--------------begog9NdKk6YXoEFN9iQ8OZ3--

