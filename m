Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AFCA5A306D6
	for <lists+xen-devel@lfdr.de>; Tue, 11 Feb 2025 10:22:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.885201.1294994 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1thmTW-00061l-AO; Tue, 11 Feb 2025 09:22:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 885201.1294994; Tue, 11 Feb 2025 09:22:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1thmTW-0005zp-70; Tue, 11 Feb 2025 09:22:38 +0000
Received: by outflank-mailman (input) for mailman id 885201;
 Tue, 11 Feb 2025 09:22:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GN4I=VC=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1thmTV-0005YP-9a
 for xen-devel@lists.xenproject.org; Tue, 11 Feb 2025 09:22:37 +0000
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [2a00:1450:4864:20::12f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bb64647a-e859-11ef-a075-877d107080fb;
 Tue, 11 Feb 2025 10:22:36 +0100 (CET)
Received: by mail-lf1-x12f.google.com with SMTP id
 2adb3069b0e04-54505c79649so2513689e87.3
 for <xen-devel@lists.xenproject.org>; Tue, 11 Feb 2025 01:22:36 -0800 (PST)
Received: from [192.168.209.66] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54505438d10sm918858e87.147.2025.02.11.01.22.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 Feb 2025 01:22:35 -0800 (PST)
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
X-Inumbo-ID: bb64647a-e859-11ef-a075-877d107080fb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739265756; x=1739870556; darn=lists.xenproject.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M5+0ViHy6MRAK4ZW2QE6I99XREgC5Ie0DNzlhVmGiwY=;
        b=VlMoZLVdyTfmBSRsmvvanY+8ttekV4cX1wjj4CvvK1VpHIKjKFpCI0dR/RSI7A6b1s
         KyiUFhJyHFx3OHnRwcbNxuMxpsGq/rs9fqfwe7LYb7ZZC9o4hKdkCH4XGtpXhfeSDd38
         MLdmQEybOye7Jv7dBQy3WTOi5nrmdUpv1outcCy3xi0H7DUeFNQKgLb60yvwnBnssAAM
         mVG0rRRCD4oobUqoo3nvFQ/NUiN4tw3jAze9WadhXQqQ4rmtCyIAobP2Un+oHIlbalCy
         oB+K+am8JlDr/NtLHUT4qwoSHV0bNskT4CpNTkXcSs7SbetFNNKbW6fMNbrcgQGBI7k3
         14XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739265756; x=1739870556;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=M5+0ViHy6MRAK4ZW2QE6I99XREgC5Ie0DNzlhVmGiwY=;
        b=JqMFClIsZKJDe99gPMIjdKNqxIvLRjacBXtrZlvz6S5Y0vOfKHW2CLIop0CxIljMMt
         hAZNigwKeqPZCrqcJLPhmVmXler56m5HATFhRtoc2/f6Jiots3CUThPJFuT4Cbm9C8h6
         rpMN+N763ZZ+B5dh63dgQ/4sxzTZfUkydeVEPxwnJoP/eF4hazlZ4MUUoytYGyBoBKRd
         t2R9PeqhOYxWe1ggokvZsyS0O4w3haPT5t9scqd/2FZPgsjWpmpgxYl04UFKXFTiS3Ot
         WD0jLVvRHnw803THCO37gZE7Q5aIyQlHROanoccseZJj4this5v+VbqON7oHZvMUH9nb
         UQbg==
X-Forwarded-Encrypted: i=1; AJvYcCVcdmWFe9aONa7k7LbP/7u19eMHmtJdVV/bvxqm8MU335L0deg5puetvGC1rodwStpxLJrWbP9lsrc=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwIggWv2iLCzuiETIuz8fRsoaro91M1ay/cCjhT8gOrZKqaFsT2
	7+/2XQFjyyEmrdzEiNzpk3K8azeHkKME+HrZtDj4oWZS54+CHICd
X-Gm-Gg: ASbGncuz1vGKY9RndJtzPPDYGitRGNpPrV0Wc1Mamg9shQTcKRopCGC3rhTRVkLK8hs
	cqPt9tP7D8Bj1rjxQ8HUMT+Oa3wnPElONEEgXNQ8/FlLCiuAi8I8QH6aEzMYEFv7wDWJmdVghSh
	O9jLCdXqC+OFeYHOvjfqahGkwOXw9A2Nm1C1mVCeyrnehIst/0vj5tryWRqzaQQReM9h3ZLVvXx
	L4W481p7KKmoV6wNkxsMYpjc5bJ0M5jidaawZq+6IG2OkGDtOhS3ssI9UDKQlTlBiDHHjEJoNU1
	jjcvV+0RGX9bsq2T0FRzugV7byU=
X-Google-Smtp-Source: AGHT+IFjxtrcir7uz0KG3L6OsrS/X7lFVLKzqOr7qzHhGsnv1p2fGgUbouzrLiUZfrqvCG3559P6gQ==
X-Received: by 2002:ac2:4c4a:0:b0:545:aaf:1404 with SMTP id 2adb3069b0e04-5450aaf18afmr2742244e87.47.1739265755700;
        Tue, 11 Feb 2025 01:22:35 -0800 (PST)
Content-Type: multipart/alternative;
 boundary="------------PeuDUanFrftWHqIvk5ri0Fof"
Message-ID: <05508d95-8111-447f-ab8c-574b7709d53c@gmail.com>
Date: Tue, 11 Feb 2025 10:22:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for 4.20? v3 3/3] xen/riscv: update mfn calculation in
 pt_mapping_level()
To: Jan Beulich <jbeulich@suse.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1738933678.git.oleksii.kurochko@gmail.com>
 <0290ae707cdd98d57714afb9bc4c3386683c1190.1738933678.git.oleksii.kurochko@gmail.com>
 <3786ac96-c153-45d5-b70e-3bdb8900024f@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <3786ac96-c153-45d5-b70e-3bdb8900024f@suse.com>

This is a multi-part message in MIME format.
--------------PeuDUanFrftWHqIvk5ri0Fof
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 2/10/25 5:53 PM, Jan Beulich wrote:
> On 07.02.2025 14:13, Oleksii Kurochko wrote:
>> --- a/xen/arch/riscv/pt.c
>> +++ b/xen/arch/riscv/pt.c
>> @@ -238,11 +238,10 @@ pte_t pt_walk(vaddr_t va, unsigned int *pte_level)
>>   
>>   /* Update an entry at the level @target. */
>>   static int pt_update_entry(mfn_t root, vaddr_t virt,
>> -                           mfn_t mfn, unsigned int target,
>> +                           mfn_t mfn, unsigned int *target,
>>                              unsigned int flags)
>>   {
>>       int rc;
>> -    unsigned int level = HYP_PT_ROOT_LEVEL;
>>       pte_t *table;
> Considering the lack of an initializer here, ...
>
>> @@ -256,39 +255,45 @@ static int pt_update_entry(mfn_t root, vaddr_t virt,
>>       bool alloc_tbl = !mfn_eq(mfn, INVALID_MFN) || (flags & PTE_POPULATE);
>>       pte_t pte, *entry;
>>   
>> -    /* convenience aliases */
>> -    DECLARE_OFFSETS(offsets, virt);
>> -
>> -    table = map_table(root);
>> -    for ( ; level > target; level-- )
>> +    if ( *target == CONFIG_PAGING_LEVELS )
>> +        entry = _pt_walk(virt, target);
>> +    else
>>       {
>> -        rc = pt_next_level(alloc_tbl, &table, offsets[level]);
>> -        if ( rc == XEN_TABLE_MAP_NOMEM )
>> +        unsigned int level = HYP_PT_ROOT_LEVEL;
>> +        /* convenience aliases */
>> +        DECLARE_OFFSETS(offsets, virt);
>> +
>> +        table = map_table(root);
>> +        for ( ; level > *target; level-- )
>>           {
>> -            rc = -ENOMEM;
>> -            goto out;
>> +            rc = pt_next_level(alloc_tbl, &table, offsets[level]);
>> +            if ( rc == XEN_TABLE_MAP_NOMEM )
>> +            {
>> +                rc = -ENOMEM;
>> +                goto out;
>> +            }
>> +
>> +            if ( rc == XEN_TABLE_MAP_NONE )
>> +            {
>> +                rc = 0;
>> +                goto out;
>> +            }
>> +
>> +            if ( rc != XEN_TABLE_NORMAL )
>> +                break;
>>           }
>>   
>> -        if ( rc == XEN_TABLE_MAP_NONE )
>> +        if ( level != *target )
>>           {
>> -            rc = 0;
>> +            dprintk(XENLOG_ERR,
>> +                    "%s: Shattering superpage is not supported\n", __func__);
>> +            rc = -EOPNOTSUPP;
>>               goto out;
>>           }
>>   
>> -        if ( rc != XEN_TABLE_NORMAL )
>> -            break;
>> -    }
>> -
>> -    if ( level != target )
>> -    {
>> -        dprintk(XENLOG_ERR,
>> -                "%s: Shattering superpage is not supported\n", __func__);
>> -        rc = -EOPNOTSUPP;
>> -        goto out;
>> +        entry = table + offsets[level];
>>       }
>>   
>> -    entry = table + offsets[level];
>> -
>>       rc = -EINVAL;
>>       if ( !pt_check_entry(*entry, mfn, flags) )
>>           goto out;
> ... I'm surprised the compiler doesn't complain about use of a possibly
> uninitialized variable at
>
>   out:
>      unmap_table(table);
>
> For the new path you're adding the variable is uninitialized afaict.
> Which implies that you're again failing to unmap what _pt_walk() has
> handed you.

Thanks, unmapping of table and entry (in the case of the new patch) should be
really updated. I'll take care of it in the next patch version.

~ Oleksii

--------------PeuDUanFrftWHqIvk5ri0Fof
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
    <div class="moz-cite-prefix">On 2/10/25 5:53 PM, Jan Beulich wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:3786ac96-c153-45d5-b70e-3bdb8900024f@suse.com">
      <pre wrap="" class="moz-quote-pre">On 07.02.2025 14:13, Oleksii Kurochko wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">--- a/xen/arch/riscv/pt.c
+++ b/xen/arch/riscv/pt.c
@@ -238,11 +238,10 @@ pte_t pt_walk(vaddr_t va, unsigned int *pte_level)
 
 /* Update an entry at the level @target. */
 static int pt_update_entry(mfn_t root, vaddr_t virt,
-                           mfn_t mfn, unsigned int target,
+                           mfn_t mfn, unsigned int *target,
                            unsigned int flags)
 {
     int rc;
-    unsigned int level = HYP_PT_ROOT_LEVEL;
     pte_t *table;
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Considering the lack of an initializer here, ...

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">@@ -256,39 +255,45 @@ static int pt_update_entry(mfn_t root, vaddr_t virt,
     bool alloc_tbl = !mfn_eq(mfn, INVALID_MFN) || (flags &amp; PTE_POPULATE);
     pte_t pte, *entry;
 
-    /* convenience aliases */
-    DECLARE_OFFSETS(offsets, virt);
-
-    table = map_table(root);
-    for ( ; level &gt; target; level-- )
+    if ( *target == CONFIG_PAGING_LEVELS )
+        entry = _pt_walk(virt, target);
+    else
     {
-        rc = pt_next_level(alloc_tbl, &amp;table, offsets[level]);
-        if ( rc == XEN_TABLE_MAP_NOMEM )
+        unsigned int level = HYP_PT_ROOT_LEVEL;
+        /* convenience aliases */
+        DECLARE_OFFSETS(offsets, virt);
+
+        table = map_table(root);
+        for ( ; level &gt; *target; level-- )
         {
-            rc = -ENOMEM;
-            goto out;
+            rc = pt_next_level(alloc_tbl, &amp;table, offsets[level]);
+            if ( rc == XEN_TABLE_MAP_NOMEM )
+            {
+                rc = -ENOMEM;
+                goto out;
+            }
+
+            if ( rc == XEN_TABLE_MAP_NONE )
+            {
+                rc = 0;
+                goto out;
+            }
+
+            if ( rc != XEN_TABLE_NORMAL )
+                break;
         }
 
-        if ( rc == XEN_TABLE_MAP_NONE )
+        if ( level != *target )
         {
-            rc = 0;
+            dprintk(XENLOG_ERR,
+                    "%s: Shattering superpage is not supported\n", __func__);
+            rc = -EOPNOTSUPP;
             goto out;
         }
 
-        if ( rc != XEN_TABLE_NORMAL )
-            break;
-    }
-
-    if ( level != target )
-    {
-        dprintk(XENLOG_ERR,
-                "%s: Shattering superpage is not supported\n", __func__);
-        rc = -EOPNOTSUPP;
-        goto out;
+        entry = table + offsets[level];
     }
 
-    entry = table + offsets[level];
-
     rc = -EINVAL;
     if ( !pt_check_entry(*entry, mfn, flags) )
         goto out;
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
... I'm surprised the compiler doesn't complain about use of a possibly
uninitialized variable at

 out:
    unmap_table(table);

For the new path you're adding the variable is uninitialized afaict.
Which implies that you're again failing to unmap what _pt_walk() has
handed you.
</pre>
    </blockquote>
    <pre>Thanks, unmapping of table and entry (in the case of the new patch) should be
really updated. I'll take care of it in the next patch version.

~ Oleksii
</pre>
  </body>
</html>

--------------PeuDUanFrftWHqIvk5ri0Fof--

