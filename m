Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C4CE8B0A674
	for <lists+xen-devel@lfdr.de>; Fri, 18 Jul 2025 16:38:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1048868.1419078 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ucmDt-0002Ve-9o; Fri, 18 Jul 2025 14:38:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1048868.1419078; Fri, 18 Jul 2025 14:38:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ucmDt-0002Sh-6e; Fri, 18 Jul 2025 14:38:05 +0000
Received: by outflank-mailman (input) for mailman id 1048868;
 Fri, 18 Jul 2025 14:38:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pPPV=Z7=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1ucmDr-0002Sb-J6
 for xen-devel@lists.xenproject.org; Fri, 18 Jul 2025 14:38:03 +0000
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [2a00:1450:4864:20::52a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ce326689-63e4-11f0-b894-0df219b8e170;
 Fri, 18 Jul 2025 16:38:01 +0200 (CEST)
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-60780d74c8cso3789161a12.2
 for <xen-devel@lists.xenproject.org>; Fri, 18 Jul 2025 07:38:01 -0700 (PDT)
Received: from [192.168.1.5] (user-109-243-64-38.play-internet.pl.
 [109.243.64.38]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aec6ca7d347sm132421866b.128.2025.07.18.07.37.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 18 Jul 2025 07:37:59 -0700 (PDT)
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
X-Inumbo-ID: ce326689-63e4-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752849480; x=1753454280; darn=lists.xenproject.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=03Ry6CQUVYCbFEyrR8pT3iqiSroibe+Jq0S1Oyksd+k=;
        b=At+b/voZuoAoNULXYZISzJzpmY3Dt8jrplhMcSb2cIaYczXQ/OtYPRNVfPWfoZplX/
         eW1f/bgA1c36WcsKLyKPnUtNbqSZmnBBk7kS0EUjIPm3gIGv8xFUqdLtoVZb0jRX7Wup
         Jn/Jg2MtyK+mCYbhyW4ESH7MhzxvKOHqolowkou6G5ZdoCcb+D1Stel+tUDl5WCJ1cDq
         4Sc6J/Z877MK3yPMQQzWOoFaYS1mUzivwI+kBWsYklMB9MhMBOGg2S1MQoq1znK3SF6U
         7/VRrMBsAO4HfVdBsscXDOs15t7Ioki5101vZNi9eXdMkqdJXIIN6LIt/Nig3ZommAn9
         sgDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752849480; x=1753454280;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=03Ry6CQUVYCbFEyrR8pT3iqiSroibe+Jq0S1Oyksd+k=;
        b=CI8GM243mZOF8IDZ72nmCl3E+aegRSmKSgC3A/QtyKVn1o78NUldFqPmcDRZ8aiJoK
         HfTjCzBlo78UWDL7KTd9x2O5mFHAChSytu9lDjvwLTyDKTTKhtZXq8FcCTYiJC51oYzA
         DvHMYCvSGkcSpAC/6Oo/9DCr0icYIO+/De9/Vq/UkvDeNkt+UPDEEgJh8XIXu1EIhUwT
         jWVL/KP9ORjkjWfywApLndGU9V/V5UpCVdbsDEoaW+vH3m14UR+obNMrrtBcTzCcEVYb
         Wm1H648pxkTG79BR3naYWDHXdWdYpZNFQ8kj2ig0X9XxLhS6/sqzMCmwqHy0WyAqw9Jz
         vkDQ==
X-Forwarded-Encrypted: i=1; AJvYcCX0XMwY0+Zfiqz+PfoUJELG4Vd14zNUFFwtmYs5dXxAwXB2LV07Nx31+t8BjYPcqOrynkPKoTby+2A=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yx8zeDrim146jO5TITodx5Q7VOiGHKzRvJ4Zvtl5aj43ALqS5QI
	o3cHAOWEHSmtp7+1uQoR7fWrv+NKqmx9Qjq8AHRFE696UX5Rz6GJiglb
X-Gm-Gg: ASbGncsViad/Lhn6YLRLQyt3oPKtH05J5Vi7SUhoKgfXaJG5c9bBiP2uUvXc3RzmtCC
	BpkHSOKHGcUX/2w8ZuMrLNJJFlA787z1+QAxXdSef8wGsLWfFh+SGqJHXGui/5Nmb/Td0SsTDN0
	YjWMhBCHNkehrCdAM2OkcOvL/NUZ32qbKZRJkPZiluZCX2M2eHZejPquQWoEcoMZk5bQRvVGdUL
	seUTr2nekTw6swtm3rufnaaabcgbhYTVGBh128Yl4mXhuKyDSD8JnEofq0CTX2FiUhMOfGnBMDV
	Jl5gRWXkeSmfU1C69m4Fzkv0X6EmrIU1y+mDdBk3MIPoeHV0r6l8rO2+tb/l6io9yy7dNwcWHdw
	mzOVbEn6Oqtzw8zAk/D2O4CLrWJPCWL45ZZiomiLNIzAX2/RV2G+HZKKndXFiMuDD4qDZFN8=
X-Google-Smtp-Source: AGHT+IHNYZOBDlMJyVcyvTI7pFQ8cMLLFbB0BsNgdR6Dk5Mk17meWBrSn69pJZk3BRjdJkaygRcSEg==
X-Received: by 2002:a17:907:1c10:b0:ae3:7c8c:351d with SMTP id a640c23a62f3a-ae9ce1acb18mr1168583066b.56.1752849480193;
        Fri, 18 Jul 2025 07:38:00 -0700 (PDT)
Content-Type: multipart/alternative;
 boundary="------------VDxfmKkTIuFPWJPs4WReV8Em"
Message-ID: <9dfc64b3-7dda-4620-9da6-388cecc3b9ad@gmail.com>
Date: Fri, 18 Jul 2025 16:37:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 16/17] xen/riscv: implement mfn_valid() and page
 reference, ownership handling helpers
To: Jan Beulich <jbeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <cover.1749555949.git.oleksii.kurochko@gmail.com>
 <50159d05e75c14ca62ee6cab5a4d30645981827a.1749555949.git.oleksii.kurochko@gmail.com>
 <aa769aa7-739c-4e59-8aea-d07398025b2f@suse.com>
 <831c7c26-51e1-4834-b08e-03607cd438aa@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <831c7c26-51e1-4834-b08e-03607cd438aa@suse.com>

This is a multi-part message in MIME format.
--------------VDxfmKkTIuFPWJPs4WReV8Em
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 7/2/25 12:28 PM, Jan Beulich wrote:
> On 02.07.2025 12:09, Jan Beulich wrote:
>> On 10.06.2025 15:05, Oleksii Kurochko wrote:
>>> @@ -613,3 +612,91 @@ void __iomem *ioremap(paddr_t pa, size_t len)
>>>   {
>>>       return ioremap_attr(pa, len, PAGE_HYPERVISOR_NOCACHE);
>>>   }
>>> +
>>> +int page_is_ram_type(unsigned long mfn, unsigned long mem_type)
>>> +{
>>> +    ASSERT_UNREACHABLE();
>>> +
>>> +    return 0;
>>> +}
>>> +
>>> +static struct domain *page_get_owner_and_nr_reference(struct page_info *page,
>>> +                                                      unsigned long nr)
>>> +{
>>> +    unsigned long x, y = page->count_info;
>>> +    struct domain *owner;
>>> +
>>> +    /* Restrict nr to avoid "double" overflow */
>>> +    if ( nr >= PGC_count_mask )
>>> +    {
>>> +        ASSERT_UNREACHABLE();
>>> +        return NULL;
>>> +    }
>> I question the validity of this, already in the Arm original: I can't spot
>> how the caller guarantees to stay below that limit. Without such an
>> (attempted) guarantee, ASSERT_UNREACHABLE() is wrong to use. All I can see
>> is process_shm_node() incrementing shmem_extra[].nr_shm_borrowers, without
>> any limit check.
>>
>>> +    do {
>>> +        x = y;
>>> +        /*
>>> +         * Count ==  0: Page is not allocated, so we cannot take a reference.
>>> +         * Count == -1: Reference count would wrap, which is invalid.
>>> +         */
>> May I once again ask that you look carefully at comments (as much as at code)
>> you copy. Clearly this comment wasn't properly updated when the bumping by 1
>> was changed to bumping by nr.
>>
>>> +        if ( unlikely(((x + nr) & PGC_count_mask) <= nr) )
>>> +            return NULL;
>>> +    }
>>> +    while ( (y = cmpxchg(&page->count_info, x, x + nr)) != x );
>>> +
>>> +    owner = page_get_owner(page);
>>> +    ASSERT(owner);
>>> +
>>> +    return owner;
>>> +}
> There also looks to be a dead code concern here (towards the "nr" parameters
> here and elsewhere, when STATIC_SHM=n). Just that apparently we decided to
> leave out Misra rule 2.2 entirely.

I think that I didn't get what is an issue when STATIC_SHM=n, functions is still
going to be called through page_get_owner_and_reference(), at least, in page_alloc.c .

~ Oleksii

--------------VDxfmKkTIuFPWJPs4WReV8Em
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
    <div class="moz-cite-prefix">On 7/2/25 12:28 PM, Jan Beulich wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:831c7c26-51e1-4834-b08e-03607cd438aa@suse.com">
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
        <pre wrap="" class="moz-quote-pre">
I question the validity of this, already in the Arm original: I can't spot
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
        <pre wrap="" class="moz-quote-pre">
May I once again ask that you look carefully at comments (as much as at code)
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
      <pre wrap="" class="moz-quote-pre">
There also looks to be a dead code concern here (towards the "nr" parameters
here and elsewhere, when STATIC_SHM=n). Just that apparently we decided to
leave out Misra rule 2.2 entirely.</pre>
    </blockquote>
    <pre>I think that I didn't get what is an issue when STATIC_SHM=n, functions is still
going to be called through page_get_owner_and_reference(), at least, in page_alloc.c .
</pre>
    <pre>
~ Oleksii
</pre>
  </body>
</html>

--------------VDxfmKkTIuFPWJPs4WReV8Em--

