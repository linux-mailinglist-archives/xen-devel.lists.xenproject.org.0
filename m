Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4532CA306B5
	for <lists+xen-devel@lfdr.de>; Tue, 11 Feb 2025 10:16:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.885173.1294954 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1thmMy-0002su-Un; Tue, 11 Feb 2025 09:15:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 885173.1294954; Tue, 11 Feb 2025 09:15:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1thmMy-0002rS-S8; Tue, 11 Feb 2025 09:15:52 +0000
Received: by outflank-mailman (input) for mailman id 885173;
 Tue, 11 Feb 2025 09:15:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GN4I=VC=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1thmMx-0002rM-Nk
 for xen-devel@lists.xenproject.org; Tue, 11 Feb 2025 09:15:51 +0000
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [2a00:1450:4864:20::12a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c9850269-e858-11ef-a075-877d107080fb;
 Tue, 11 Feb 2025 10:15:50 +0100 (CET)
Received: by mail-lf1-x12a.google.com with SMTP id
 2adb3069b0e04-545054d78edso2944513e87.1
 for <xen-devel@lists.xenproject.org>; Tue, 11 Feb 2025 01:15:50 -0800 (PST)
Received: from [192.168.209.66] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54506ee6666sm849578e87.80.2025.02.11.01.15.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 Feb 2025 01:15:49 -0800 (PST)
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
X-Inumbo-ID: c9850269-e858-11ef-a075-877d107080fb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739265350; x=1739870150; darn=lists.xenproject.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tnYzHIfjDXyXPm4T62zwciqGyHPAuDuggikjMOx6hFY=;
        b=gC2H3bvo6LqG+1Bkstgxs/fmOaBOEo9ZuZuWrvo9FUoTHB3XV/5yKmYAkbEtPnm8WW
         X6sI6rN+eNgNR44OpEHRE306RTkmcHKeWb5SB2sKlMMYB0fdC1q4nhDxqTnZQykkkWGq
         +ZS8/5OGwxGpEBnnUNZLdz9BTRM6HqPUF2RiQVzihMO9v5n6KG1tAW1G/A/c5XT3BtK1
         354icp8lNb/tSfskZIQ7bkOejh7c5YpCVHQMCHH9pbd1hGb4pMtrpfRuyBkLTIvip/4D
         SkG1PbVLLjRv0RpQGu6jkpGnUXNI0vzBF/csUDJAZrkcXrHD9t6KmlaXXeuUPItH+G17
         MB3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739265350; x=1739870150;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=tnYzHIfjDXyXPm4T62zwciqGyHPAuDuggikjMOx6hFY=;
        b=JtfuLneY1gkJqFdOghOMPqYwfmUvK1c53irH0N9cTsA5VJ1mB55eTqQmpvhoZWYd3S
         koFcbKvDaflm+iaBEbjloN0rNa48ROhTFe9ef3QbV3wr0AfAmfzlgNyJlFm66FSkkwST
         QeSuHGo0nI6yQd0TbJo4zV13lw06zHgELvIACKifOOEL8s74aPp9RDcyaIAW5hbeLH6v
         ZvewbiSpSzWRdAFcvSUOBGKQMgCbCfj5RjBBrJRwgaZePc9T1VMJi/HxkEf2DZzpismO
         g1HNCYVQn57rZum+n1K82Rec8zse4kAaXSr7nJ4lrclwd5MfPRdPQMOkNshAfLLVlyuj
         Getg==
X-Forwarded-Encrypted: i=1; AJvYcCVB+6QaNIJosY2LQe02FoOtqKNp/T49Y87mE8Yqkhq4D8YJS1JDBs/cX14ausNp4hYxOUTGNQ3gBJ8=@lists.xenproject.org
X-Gm-Message-State: AOJu0YydUCpOmUM+YPVEEGj+ce1DzklG0sPG45QUuyOfiw/dNj9HGUQc
	yT3HDjMQ9E5aMGRqU6vQDveYlTpQQEhFY3Rr89PsHUQLih0cwDsi
X-Gm-Gg: ASbGncuqTEZC3DHL4XCsjRtfJOn2DWn62bSGsYGLh3nHX5thnmImPePadcUV+p0hlum
	uMzSwyTclEQYUUYR5beNJmGj48GaAi+cmfyrovDYuR4piBDy6FlS/1PAkvK1otWG5wq+IFvXmfG
	x8D68uSi7MFX8mA/gycG4yLto2VwrUWvDZJmqFceeL1kvCyu4XACMgPF4ks/Zo4FHyvYjI5gXwS
	kweg4hgcFglQn1ds3vYPfowqAbumpHITcRn6HiiNB7wN3jUUKnaVg7L4grmid494AB5ECYzVOW2
	AUdM5ip8UMkvRYsMgcOxAUDVZCY=
X-Google-Smtp-Source: AGHT+IE0npEeGOeWwA23iqKDsAxQfduilEDwNlyXNsV820VsNBBCDXFXVpjELMlsEMqwkAKS3GRtaw==
X-Received: by 2002:ac2:4c45:0:b0:545:e19:ba22 with SMTP id 2adb3069b0e04-5450e19bb19mr2359605e87.49.1739265349909;
        Tue, 11 Feb 2025 01:15:49 -0800 (PST)
Content-Type: multipart/alternative;
 boundary="------------gIoGyfuvsPn3JuGzc6kyen2S"
Message-ID: <95d4e3fe-5bdf-4072-b4b1-47968d128d4a@gmail.com>
Date: Tue, 11 Feb 2025 10:15:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for 4.20? v3 1/3] xen/riscv: implement software page table
 walking
To: Jan Beulich <jbeulich@suse.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1738933678.git.oleksii.kurochko@gmail.com>
 <e78679b00df63bde40eb3a4d97e3ab9d1faf9382.1738933678.git.oleksii.kurochko@gmail.com>
 <c6916159-d314-4121-b1aa-f5fd26bdb7b1@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <c6916159-d314-4121-b1aa-f5fd26bdb7b1@suse.com>

This is a multi-part message in MIME format.
--------------gIoGyfuvsPn3JuGzc6kyen2S
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 2/10/25 5:32 PM, Jan Beulich wrote:
> On 07.02.2025 14:13, Oleksii Kurochko wrote:
>> --- a/xen/arch/riscv/pt.c
>> +++ b/xen/arch/riscv/pt.c
>> @@ -185,6 +185,57 @@ static int pt_next_level(bool alloc_tbl, pte_t **table, unsigned int offset)
>>       return XEN_TABLE_NORMAL;
>>   }
>>   
>> +/*
>> + * _pt_walk() performs software page table walking and returns the pte_t of
>> + * a leaf node or the leaf-most not-present pte_t if no leaf node is found
>> + * for further analysis.
>> + * Additionally, _pt_walk() returns the level of the found pte.
> That's optional, which I think wants expressing here.
>
>> + */
>> +static pte_t *_pt_walk(vaddr_t va, unsigned int *pte_level)
>> +{
>> +    const mfn_t root = get_root_page();
>> +    unsigned int level;
>> +    pte_t *table;
>> +
>> +    DECLARE_OFFSETS(offsets, va);
>> +
>> +    table = map_table(root);
> This mapping operation doesn't look to have a counterpart. Aiui ...
>
>> +    /*
>> +     * Find `table` of an entry which corresponds to `va` by iterating for each
>> +     * page level and checking if the entry points to a next page table or
>> +     * to a page.
>> +     *
>> +     * Two cases are possible:
>> +     * - ret == XEN_TABLE_SUPER_PAGE means that the entry was found;
>> +     *   (Despite the name) XEN_TABLE_SUPER_PAGE also covers 4K mappings. If
>> +     *   pt_next_level() is called for page table level 0, it results in the
>> +     *   entry being a pointer to a leaf node, thereby returning
>> +     *   XEN_TABLE_SUPER_PAGE, despite of the fact this leaf covers 4k mapping.
>> +     * - ret == XEN_TABLE_MAP_NONE means that requested `va` wasn't actually
>> +     *   mapped.
>> +     */
>> +    for ( level = HYP_PT_ROOT_LEVEL; ; --level )
>> +    {
>> +        int ret = pt_next_level(false, &table, offsets[level]);
> ... the mapping may be replaced here, but a new mapping will then still
> be held by this function and ...
>
>> +        if ( ret == XEN_TABLE_MAP_NONE || ret == XEN_TABLE_SUPER_PAGE )
>> +            break;
>> +
>> +        ASSERT(level);
>> +    }
>> +
>> +    if ( pte_level )
>> +        *pte_level = level;
>> +
>> +    return table + offsets[level];
>> +}
> ... the final one then be transferred to the caller.
>
>> +pte_t pt_walk(vaddr_t va, unsigned int *pte_level)
>> +{
>> +    return *_pt_walk(va, pte_level);
>> +}
> Hence aiui there needs to be an unmap operation here.

Agree, it should be an unmap here. I will update that in the next patch version.

Thanks.

~ Oleksii

--------------gIoGyfuvsPn3JuGzc6kyen2S
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
    <div class="moz-cite-prefix">On 2/10/25 5:32 PM, Jan Beulich wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:c6916159-d314-4121-b1aa-f5fd26bdb7b1@suse.com">
      <pre wrap="" class="moz-quote-pre">On 07.02.2025 14:13, Oleksii Kurochko wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">--- a/xen/arch/riscv/pt.c
+++ b/xen/arch/riscv/pt.c
@@ -185,6 +185,57 @@ static int pt_next_level(bool alloc_tbl, pte_t **table, unsigned int offset)
     return XEN_TABLE_NORMAL;
 }
 
+/*
+ * _pt_walk() performs software page table walking and returns the pte_t of
+ * a leaf node or the leaf-most not-present pte_t if no leaf node is found
+ * for further analysis.
+ * Additionally, _pt_walk() returns the level of the found pte.
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
That's optional, which I think wants expressing here.

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+ */
+static pte_t *_pt_walk(vaddr_t va, unsigned int *pte_level)
+{
+    const mfn_t root = get_root_page();
+    unsigned int level;
+    pte_t *table;
+
+    DECLARE_OFFSETS(offsets, va);
+
+    table = map_table(root);
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
This mapping operation doesn't look to have a counterpart. Aiui ...

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+    /*
+     * Find `table` of an entry which corresponds to `va` by iterating for each
+     * page level and checking if the entry points to a next page table or
+     * to a page.
+     *
+     * Two cases are possible:
+     * - ret == XEN_TABLE_SUPER_PAGE means that the entry was found;
+     *   (Despite the name) XEN_TABLE_SUPER_PAGE also covers 4K mappings. If
+     *   pt_next_level() is called for page table level 0, it results in the
+     *   entry being a pointer to a leaf node, thereby returning
+     *   XEN_TABLE_SUPER_PAGE, despite of the fact this leaf covers 4k mapping.
+     * - ret == XEN_TABLE_MAP_NONE means that requested `va` wasn't actually
+     *   mapped.
+     */
+    for ( level = HYP_PT_ROOT_LEVEL; ; --level )
+    {
+        int ret = pt_next_level(false, &amp;table, offsets[level]);
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
... the mapping may be replaced here, but a new mapping will then still
be held by this function and ...

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+        if ( ret == XEN_TABLE_MAP_NONE || ret == XEN_TABLE_SUPER_PAGE )
+            break;
+
+        ASSERT(level);
+    }
+
+    if ( pte_level )
+        *pte_level = level;
+
+    return table + offsets[level];
+}
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
... the final one then be transferred to the caller.

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+pte_t pt_walk(vaddr_t va, unsigned int *pte_level)
+{
+    return *_pt_walk(va, pte_level);
+}
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Hence aiui there needs to be an unmap operation here.</pre>
    </blockquote>
    <pre>Agree, it should be an unmap here. I will update that in the next patch version.

Thanks.

~ Oleksii
</pre>
    <pre>
</pre>
  </body>
</html>

--------------gIoGyfuvsPn3JuGzc6kyen2S--

