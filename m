Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 11AD1A43975
	for <lists+xen-devel@lfdr.de>; Tue, 25 Feb 2025 10:29:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.895548.1304206 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tmrFd-0005Om-6b; Tue, 25 Feb 2025 09:29:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 895548.1304206; Tue, 25 Feb 2025 09:29:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tmrFd-0005Lc-2e; Tue, 25 Feb 2025 09:29:17 +0000
Received: by outflank-mailman (input) for mailman id 895548;
 Tue, 25 Feb 2025 09:29:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=k2AW=VQ=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1tmrFb-0005LT-Sf
 for xen-devel@lists.xenproject.org; Tue, 25 Feb 2025 09:29:15 +0000
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [2a00:1450:4864:20::529])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f9ddbaa4-f35a-11ef-9897-31a8f345e629;
 Tue, 25 Feb 2025 10:29:13 +0100 (CET)
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-5e0505275b7so8624145a12.3
 for <xen-devel@lists.xenproject.org>; Tue, 25 Feb 2025 01:29:13 -0800 (PST)
Received: from [172.24.85.51] ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5e45b80b785sm921328a12.37.2025.02.25.01.29.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 Feb 2025 01:29:12 -0800 (PST)
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
X-Inumbo-ID: f9ddbaa4-f35a-11ef-9897-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740475753; x=1741080553; darn=lists.xenproject.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w4peud5O6/unVWYz5UTiFTz2z4jBleWsjfLFxVdgqAM=;
        b=JDeIDl6CCNgTpsBPHOAxdkZoz26LtVXoEToWmXD6lDrFzo1/x/OkI3Uq1vRqqMm6TX
         /yk9J9lA/fz/51/oDnzUVTHpCL6xdDjKVBv401viHVdxsHHEGqTf4+T14neFcz3RpK0U
         jQaLb70fzlJtkVoHe1kax2lS+ahonBr8z3QeeHlWnNweiQ68Cv23r2UpgHiokvqTLYRQ
         0MPgExfTs5jcMlegAzHc3XqOKxyj4OLkC7Qv0Y0PUnT+X46BRpUiGBuDJHcNrCfwB51Q
         /uz3hwpkQigcODIDCCTpPaakt16Y3L8R40qO8QFB/xQsq8V3RwImqEnq+xwrDSiNFCYR
         HgaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740475753; x=1741080553;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=w4peud5O6/unVWYz5UTiFTz2z4jBleWsjfLFxVdgqAM=;
        b=ZImhqTrBfJJ+Jwc+NIO6pq/CU9WzkBrfqqOjHtN28mZHIG7f2jV2pPtXaW5gWrOqFC
         XKkPXJexr4q9f7QrYGUfjnyuJQk87P4+rxVMO0kV6yleCsTgphTCP5wQ5rYroApxwHGq
         HsMafjWu+GUGK9ICG9psfZNpMLGNCjKOhA8PF8IZHn2Fkarirl7RZ34oGfGEbtTAcWc0
         5eXQbndRgWqqMTr0/gm1iozJWcB3M+sv/u84RxkRt5lOZoI+w+ImByt23ylsbvJGcYnR
         vpbDuEtHFZnEmHDoq9s7Z1832aWwg+qjVq09l1W/pLRhxTQ5PGnJjVFxbCIw2ftqP2Td
         6IlA==
X-Forwarded-Encrypted: i=1; AJvYcCWrUvMbvp8JXuWMlv6JkbLC8lKCkPga7Xqqu1Gh3uBHIkNOvKiczs70VJhWDN2w5hKQUe0C5Gw0YfE=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzUp8mEKXIoXyJe/4Guf4+rixZaLLsUIHsSA5VEmJDl9A7WPd14
	Sxo7sMyPLlzelA2Mr9kceMsrjyDx8qcE2vA/Tr0j/gsM89hIZjhd
X-Gm-Gg: ASbGnctdIIQuhLP1fEEmX50qOxd1yVn0Fh6F8VUdeLQXeI5HscrswTFxGCBKjaTXZBd
	/FLkRwxMGXE06ZXlxgBlmVoYiyFiOoFIEXNSfc52KcKInNAZQjGQ30z+kAw1os2UPYUUwGh2mjc
	Nvs54bqEhdtBTbqf+VGG+f2HGW+CeDPbxU2zS0/WaUaFLAPWYFh0Fmy20K5BAgbE/eLpaMIiya8
	DBbWOGXB/Creadsnohi0BflQP9Nc6RyWDwvmHQ1f5pArAiSV1lluXyvJ8QqPLml9/2zUCxT/LB6
	u2D5g31Yk8v6O4N5rbmGwOu8J17I8sWDAKA=
X-Google-Smtp-Source: AGHT+IGqlbXdwYB/7DgAYKcvrtkEBl/q85kDji7Rg1sFawi3G2Mv3KCZAuftsUFs1MkTS4BAjff1UQ==
X-Received: by 2002:a05:6402:4305:b0:5da:a97:ad73 with SMTP id 4fb4d7f45d1cf-5e0b70f6d0bmr16092297a12.13.1740475752807;
        Tue, 25 Feb 2025 01:29:12 -0800 (PST)
Content-Type: multipart/alternative;
 boundary="------------fX0MCGDNRyEh502Uvdpvskkw"
Message-ID: <3600c79c-f908-481a-8834-8a011bd88e05@gmail.com>
Date: Tue, 25 Feb 2025 10:29:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for 4.21 v5 3/3] xen/riscv: update mfn calculation in
 pt_mapping_level()
To: Jan Beulich <jbeulich@suse.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1739985805.git.oleksii.kurochko@gmail.com>
 <f474bdd1393d376111559fc5b7b01f035d52dd44.1739985805.git.oleksii.kurochko@gmail.com>
 <cb1c97db-dba4-4dd4-bf93-7042b6edd20e@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <cb1c97db-dba4-4dd4-bf93-7042b6edd20e@suse.com>

This is a multi-part message in MIME format.
--------------fX0MCGDNRyEh502Uvdpvskkw
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 2/25/25 8:59 AM, Jan Beulich wrote:
> On 20.02.2025 18:44, Oleksii Kurochko wrote:
>> When pt_update() is called with arguments (..., INVALID_MFN, ..., 0 or 1),
>> it indicates that a mapping is being destroyed/modifyed.
>>
>> In the case when modifying or destroying a mapping, it is necessary to
>> search until a leaf node is found, instead of searching for a page table
>> entry based on the precalculated `level` and `order`(look at pt_update()).
>> This is because when `mfn` == INVALID_MFN, the `mask` (in pt_mapping_level())
>> will take into account only `vfn`, which could accidentally return an
>> incorrect level, leading to the discovery of an incorrect page table entry.
>>
>> For example, if `vfn` is page table level 1 aligned, but it was mapped as
>> page table level 0, then pt_mapping_level() will return `level` = 1, since
>> only `vfn` (which is page table level 1 aligned) is taken into account when
>> `mfn` == INVALID_MFN (look at pt_mapping_level()).
>>
>> Fixes: c2f1ded524 ("xen/riscv: page table handling")
>> Signed-off-by: Oleksii Kurochko<oleksii.kurochko@gmail.com>
>> ---
>> Changes in v5:
>> - Rename *entry to *ptep in pt_update_entry().
>> - Fix code style issue in the comment.
>> - Move NULL check of pointer to `table` inside unmap_table and then drop
>>    it in pt_update_entry().
> Imo this last aspect wants mentioning in the description.

Agree, considering that it is a change in the code of previously introduced function,
it makes to mention that.

>
>> @@ -422,17 +439,40 @@ static int pt_update(vaddr_t virt, mfn_t mfn,
>>   
>>       while ( left )
>>       {
>> -        unsigned int order, level;
>> -
>> -        level = pt_mapping_level(vfn, mfn, left, flags);
>> -        order = XEN_PT_LEVEL_ORDER(level);
>> +        unsigned int order, level = CONFIG_PAGING_LEVELS;
>>   
>> -        ASSERT(left >= BIT(order, UL));
>> +        /*
>> +         * In the case when modifying or destroying a mapping, it is necessary
>> +         * to search until a leaf node is found, instead of searching for
>> +         * a page table entry based on the precalculated `level` and `order`
>> +         * (look at pt_update()).
>> +         * This is because when `mfn` == INVALID_MFN, the `mask`(in
>> +         * pt_mapping_level()) will take into account only `vfn`, which could
>> +         * accidentally return an incorrect level, leading to the discovery of
>> +         * an incorrect page table entry.
>> +         *
>> +         * For example, if `vfn` is page table level 1 aligned, but it was
>> +         * mapped as page table level 0, then pt_mapping_level() will return
>> +         * `level` = 1, since only `vfn` (which is page table level 1 aligned)
>> +         * is taken into account when `mfn` == INVALID_MFN
>> +         * (look at pt_mapping_level()).
>> +         *
>> +         * To force searching until a leaf node is found is necessary to have
>> +         * `level` == CONFIG_PAGING_LEVELS which is a default value for
>> +         * `level`.
> There looks to be an "it" missing before the 2nd "is". I'm also unconvinced the
> part starting with "which" is really necessary.

Lets then just drop this part. I added only to explicitly show that it is the value
which is used to define `level`.

>
> Preferably with these small adjustments (I'd be happy to do so while committing)
> Reviewed-by: Jan Beulich<jbeulich@suse.com>

Thanks!

~ Oleksii


--------------fX0MCGDNRyEh502Uvdpvskkw
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
    <div class="moz-cite-prefix">On 2/25/25 8:59 AM, Jan Beulich wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:cb1c97db-dba4-4dd4-bf93-7042b6edd20e@suse.com">
      <pre wrap="" class="moz-quote-pre">On 20.02.2025 18:44, Oleksii Kurochko wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">When pt_update() is called with arguments (..., INVALID_MFN, ..., 0 or 1),
it indicates that a mapping is being destroyed/modifyed.

In the case when modifying or destroying a mapping, it is necessary to
search until a leaf node is found, instead of searching for a page table
entry based on the precalculated `level` and `order`(look at pt_update()).
This is because when `mfn` == INVALID_MFN, the `mask` (in pt_mapping_level())
will take into account only `vfn`, which could accidentally return an
incorrect level, leading to the discovery of an incorrect page table entry.

For example, if `vfn` is page table level 1 aligned, but it was mapped as
page table level 0, then pt_mapping_level() will return `level` = 1, since
only `vfn` (which is page table level 1 aligned) is taken into account when
`mfn` == INVALID_MFN (look at pt_mapping_level()).

Fixes: c2f1ded524 ("xen/riscv: page table handling")
Signed-off-by: Oleksii Kurochko <a class="moz-txt-link-rfc2396E" href="mailto:oleksii.kurochko@gmail.com">&lt;oleksii.kurochko@gmail.com&gt;</a>
---
Changes in v5:
- Rename *entry to *ptep in pt_update_entry().
- Fix code style issue in the comment.
- Move NULL check of pointer to `table` inside unmap_table and then drop
  it in pt_update_entry().
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Imo this last aspect wants mentioning in the description.</pre>
    </blockquote>
    <pre>Agree, considering that it is a change in the code of previously introduced function,
it makes to mention that.</pre>
    <blockquote type="cite"
      cite="mid:cb1c97db-dba4-4dd4-bf93-7042b6edd20e@suse.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">@@ -422,17 +439,40 @@ static int pt_update(vaddr_t virt, mfn_t mfn,
 
     while ( left )
     {
-        unsigned int order, level;
-
-        level = pt_mapping_level(vfn, mfn, left, flags);
-        order = XEN_PT_LEVEL_ORDER(level);
+        unsigned int order, level = CONFIG_PAGING_LEVELS;
 
-        ASSERT(left &gt;= BIT(order, UL));
+        /*
+         * In the case when modifying or destroying a mapping, it is necessary
+         * to search until a leaf node is found, instead of searching for
+         * a page table entry based on the precalculated `level` and `order`
+         * (look at pt_update()).
+         * This is because when `mfn` == INVALID_MFN, the `mask`(in
+         * pt_mapping_level()) will take into account only `vfn`, which could
+         * accidentally return an incorrect level, leading to the discovery of
+         * an incorrect page table entry.
+         *
+         * For example, if `vfn` is page table level 1 aligned, but it was
+         * mapped as page table level 0, then pt_mapping_level() will return
+         * `level` = 1, since only `vfn` (which is page table level 1 aligned)
+         * is taken into account when `mfn` == INVALID_MFN
+         * (look at pt_mapping_level()).
+         *
+         * To force searching until a leaf node is found is necessary to have
+         * `level` == CONFIG_PAGING_LEVELS which is a default value for
+         * `level`.
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
There looks to be an "it" missing before the 2nd "is". I'm also unconvinced the
part starting with "which" is really necessary.</pre>
    </blockquote>
    <pre>Lets then just drop this part. I added only to explicitly show that it is the value
which is used to define `level`.
</pre>
    <blockquote type="cite"
      cite="mid:cb1c97db-dba4-4dd4-bf93-7042b6edd20e@suse.com">
      <pre wrap="" class="moz-quote-pre">

Preferably with these small adjustments (I'd be happy to do so while committing)
Reviewed-by: Jan Beulich <a class="moz-txt-link-rfc2396E" href="mailto:jbeulich@suse.com">&lt;jbeulich@suse.com&gt;</a></pre>
    </blockquote>
    <pre>Thanks!</pre>
    <pre>~ Oleksii
</pre>
    <p><br>
    </p>
  </body>
</html>

--------------fX0MCGDNRyEh502Uvdpvskkw--

