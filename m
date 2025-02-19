Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 75C02A3C26D
	for <lists+xen-devel@lfdr.de>; Wed, 19 Feb 2025 15:46:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.893052.1301985 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tklL2-0005Xb-Up; Wed, 19 Feb 2025 14:46:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 893052.1301985; Wed, 19 Feb 2025 14:46:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tklL2-0005UT-Ry; Wed, 19 Feb 2025 14:46:12 +0000
Received: by outflank-mailman (input) for mailman id 893052;
 Wed, 19 Feb 2025 14:46:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GJ0s=VK=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1tklL1-0005UN-So
 for xen-devel@lists.xenproject.org; Wed, 19 Feb 2025 14:46:11 +0000
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [2a00:1450:4864:20::12d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 41ba3199-eed0-11ef-9896-31a8f345e629;
 Wed, 19 Feb 2025 15:46:09 +0100 (CET)
Received: by mail-lf1-x12d.google.com with SMTP id
 2adb3069b0e04-5452ed5b5b2so4954398e87.0
 for <xen-devel@lists.xenproject.org>; Wed, 19 Feb 2025 06:46:09 -0800 (PST)
Received: from [172.24.85.51] ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5462ff361ebsm219698e87.187.2025.02.19.06.46.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 Feb 2025 06:46:08 -0800 (PST)
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
X-Inumbo-ID: 41ba3199-eed0-11ef-9896-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739976369; x=1740581169; darn=lists.xenproject.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z2F5t3qJz1OOjynsRlU6ICnHq9JKzdjSjRBTCUncKzs=;
        b=mP+1yPNZhWyAkZRavSUGXO+HiKkgFuJXwU/9B00EHDsygkaGOgEtxlrsH2GyGEaQis
         J2s3UsJ+09ZK5kwVPLzQfbkVjoyGd1qULTu41n0zudCuqhZ/JsG0I4HVtRF4cV1+y/om
         zqnumXBisvo5HcdUJ394HiUch2jj7YjA3Hkk1BbfvbByL4PNu/u9YZF/vC3bHyvopnBe
         ShgyZ1XKiPcmFRDmnsJu30Kb9P21D1KBn33vr6+aF/Li/fRDBHxe+CkUbl0HLtynSEZy
         T1HYowAlWtA2F77LqXj8zu94p3QeM83dxz9o1H5vcl2aRCV3m+BB37YGVgGGeSLoUwak
         /E1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739976369; x=1740581169;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=z2F5t3qJz1OOjynsRlU6ICnHq9JKzdjSjRBTCUncKzs=;
        b=ZgTjs0Yd90zGsBwOTD2hCZtOaCLEv+YaOxU3HwgMU52k5l7c9Kb1bvPliEdzGXnEL2
         z4XTOMKRVqcNpBcRt6E6XHpBWwe4HAupt/0YyBTKWcutrqR9om0ddsnAJGY3c3nCI9UM
         s8ySWDaKZuh8cUIATIBz2NDOMBRiG7X0zbSxY/rWSGldo269dzYEMyObB+aJlwo0N3tO
         8MzGRfUhoXWqfCkPHY3CbrVavWB6uzfbLUVYaQ1doVhPi4eyxTL4gnEQiENkK49Lgoq1
         9Si98YXrfYPA9kMxoZamIOLN9OVHOfXWpJqWHb24Ex8V38zZqdyQ5gw7T3ZU7BlYp4d0
         XR7g==
X-Forwarded-Encrypted: i=1; AJvYcCWe0/WWOO+Vc4fcc2/O7d365JkbIQnD2Kxgakgucmrq1Xv/2WDQAkNHLTJQbzO6o2OSRnLraEcIu0k=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yw+N7lhSQuErpQXCiB282V0PW8Vkqp8beIXSxCPNgeyyTp1lsrS
	bDXhs6IJXlRGdlTNlqLeGB6uzbrll5kDg5TLhil52VSRq/QXQUxx
X-Gm-Gg: ASbGncvfa6SOy5skBZavoPuxU+4wWJI0UTabAToqq7qbRD+F8QtK0q1/cR5fBXG/k53
	7ykjF61OU3PKzqlmO2PMkk6cyw0GJlqbD8Z6MtbXQ4S5rf52sTndInQE3KL0KK9517xJG2tZpXX
	JmEyGmqoXEPf6DiUIniqPpEFy+m9jUpkoC2lNzQIpouRZhBfi8mG0ePEWgkaKoQGVLz+3RALpRt
	75nwoKycxNj+vyUmsWfIcS1MYhTA6VGDXvUVADTyJ6Ezo+2lf42VH0AQJSGefaiis3YuRwsBTx9
	rsotF+zYXAxDc2zvB5/afgXn
X-Google-Smtp-Source: AGHT+IHseUSOjZYXmPSHRXyQcFPWzRWTHu3coLZqGkG0OHkt0Im+gtxHutzlCl26SSkNPLmqA209wQ==
X-Received: by 2002:a19:5f1e:0:b0:546:2ea4:8e72 with SMTP id 2adb3069b0e04-5462ea490bamr1655045e87.49.1739976368777;
        Wed, 19 Feb 2025 06:46:08 -0800 (PST)
Content-Type: multipart/alternative;
 boundary="------------hni79qEeg8gBYAtWvKtzMPPh"
Message-ID: <d398d595-74b3-424a-bab9-992653cdca95@gmail.com>
Date: Wed, 19 Feb 2025 15:46:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for 4.20? v4 3/3] xen/riscv: update mfn calculation in
 pt_mapping_level()
To: Jan Beulich <jbeulich@suse.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1739363240.git.oleksii.kurochko@gmail.com>
 <38093d9843afbba9dda7326ee6e8cc3c99343cf6.1739363240.git.oleksii.kurochko@gmail.com>
 <2cee5ebc-cae7-4da8-9b7d-bb55cc907570@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <2cee5ebc-cae7-4da8-9b7d-bb55cc907570@suse.com>

This is a multi-part message in MIME format.
--------------hni79qEeg8gBYAtWvKtzMPPh
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 2/19/25 12:28 PM, Jan Beulich wrote:
> On 12.02.2025 17:50, Oleksii Kurochko wrote:
>> --- a/xen/arch/riscv/pt.c
>> +++ b/xen/arch/riscv/pt.c
>> @@ -249,12 +249,10 @@ pte_t pt_walk(vaddr_t va, unsigned int *pte_level)
>>   
>>   /* Update an entry at the level @target. */
>>   static int pt_update_entry(mfn_t root, vaddr_t virt,
>> -                           mfn_t mfn, unsigned int target,
>> +                           mfn_t mfn, unsigned int *target,
>>                              unsigned int flags)
>>   {
>>       int rc;
>> -    unsigned int level = HYP_PT_ROOT_LEVEL;
>> -    pte_t *table;
>>       /*
>>        * The intermediate page table shouldn't be allocated when MFN isn't
>>        * valid and we are not populating page table.
>> @@ -265,41 +263,48 @@ static int pt_update_entry(mfn_t root, vaddr_t virt,
>>        * combinations of (mfn, flags).
>>       */
>>       bool alloc_tbl = !mfn_eq(mfn, INVALID_MFN) || (flags & PTE_POPULATE);
>> -    pte_t pte, *entry;
>> -
>> -    /* convenience aliases */
>> -    DECLARE_OFFSETS(offsets, virt);
>> +    pte_t pte, *entry = NULL;
> With there also being "table" below, "entry" isn't quite as bad as in the
> other patch. Yet I'd still like to ask that you consider renaming.
>
>> -    table = map_table(root);
>> -    for ( ; level > target; level-- )
>> +    if ( *target == CONFIG_PAGING_LEVELS )
>> +        entry = _pt_walk(virt, target);
> Imo it's quite important for the comment ahead of the function to be updated
> to mention this special case.
>
>> +    else
>>       {
>> -        rc = pt_next_level(alloc_tbl, &table, offsets[level]);
>> -        if ( rc == XEN_TABLE_MAP_NOMEM )
>> +        pte_t *table;
>> +        unsigned int level = HYP_PT_ROOT_LEVEL;
>> +        /* convenience aliases */
> Nit: Style.

 From the 'Comments' section of CODING_STYLE, I see that the comment should start
with capital letter. Do you mean that?

>
>> @@ -331,7 +336,8 @@ static int pt_update_entry(mfn_t root, vaddr_t virt,
>>       rc = 0;
>>   
>>    out:
>> -    unmap_table(table);
>> +    if ( entry )
>> +        unmap_table(entry);
> Would it perhaps be worth for unmap_table() to gracefully handle being passed
> NULL, to avoid such conditionals (there may be more in the future)?

Agree, it would be more safe to move this check inside unmap_table(). I will update
that.

Thanks.

~ Oleksii

--------------hni79qEeg8gBYAtWvKtzMPPh
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
    <div class="moz-cite-prefix">On 2/19/25 12:28 PM, Jan Beulich wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:2cee5ebc-cae7-4da8-9b7d-bb55cc907570@suse.com">
      <pre wrap="" class="moz-quote-pre">On 12.02.2025 17:50, Oleksii Kurochko wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">--- a/xen/arch/riscv/pt.c
+++ b/xen/arch/riscv/pt.c
@@ -249,12 +249,10 @@ pte_t pt_walk(vaddr_t va, unsigned int *pte_level)
 
 /* Update an entry at the level @target. */
 static int pt_update_entry(mfn_t root, vaddr_t virt,
-                           mfn_t mfn, unsigned int target,
+                           mfn_t mfn, unsigned int *target,
                            unsigned int flags)
 {
     int rc;
-    unsigned int level = HYP_PT_ROOT_LEVEL;
-    pte_t *table;
     /*
      * The intermediate page table shouldn't be allocated when MFN isn't
      * valid and we are not populating page table.
@@ -265,41 +263,48 @@ static int pt_update_entry(mfn_t root, vaddr_t virt,
      * combinations of (mfn, flags).
     */
     bool alloc_tbl = !mfn_eq(mfn, INVALID_MFN) || (flags &amp; PTE_POPULATE);
-    pte_t pte, *entry;
-
-    /* convenience aliases */
-    DECLARE_OFFSETS(offsets, virt);
+    pte_t pte, *entry = NULL;
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
With there also being "table" below, "entry" isn't quite as bad as in the
other patch. Yet I'd still like to ask that you consider renaming.

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">-    table = map_table(root);
-    for ( ; level &gt; target; level-- )
+    if ( *target == CONFIG_PAGING_LEVELS )
+        entry = _pt_walk(virt, target);
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Imo it's quite important for the comment ahead of the function to be updated
to mention this special case.

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+    else
     {
-        rc = pt_next_level(alloc_tbl, &amp;table, offsets[level]);
-        if ( rc == XEN_TABLE_MAP_NOMEM )
+        pte_t *table;
+        unsigned int level = HYP_PT_ROOT_LEVEL;
+        /* convenience aliases */
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Nit: Style.</pre>
    </blockquote>
    <pre>From the 'Comments' section of CODING_STYLE, I see that the comment should start
with capital letter. Do you mean that?

</pre>
    <blockquote type="cite"
      cite="mid:2cee5ebc-cae7-4da8-9b7d-bb55cc907570@suse.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">@@ -331,7 +336,8 @@ static int pt_update_entry(mfn_t root, vaddr_t virt,
     rc = 0;
 
  out:
-    unmap_table(table);
+    if ( entry )
+        unmap_table(entry);
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Would it perhaps be worth for unmap_table() to gracefully handle being passed
NULL, to avoid such conditionals (there may be more in the future)?</pre>
    </blockquote>
    <pre>Agree, it would be more safe to move this check inside unmap_table(). I will update
that.

Thanks.</pre>
    <pre>~ Oleksii</pre>
  </body>
</html>

--------------hni79qEeg8gBYAtWvKtzMPPh--

