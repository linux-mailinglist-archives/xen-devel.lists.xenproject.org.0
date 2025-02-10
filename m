Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FABBA2E6C4
	for <lists+xen-devel@lfdr.de>; Mon, 10 Feb 2025 09:46:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.884417.1294121 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1thPQt-0005br-EY; Mon, 10 Feb 2025 08:46:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 884417.1294121; Mon, 10 Feb 2025 08:46:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1thPQt-0005Z7-Av; Mon, 10 Feb 2025 08:46:23 +0000
Received: by outflank-mailman (input) for mailman id 884417;
 Mon, 10 Feb 2025 08:46:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fMFa=VB=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1thPQr-0005Yz-NJ
 for xen-devel@lists.xenproject.org; Mon, 10 Feb 2025 08:46:21 +0000
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [2a00:1450:4864:20::134])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 80302715-e78b-11ef-a075-877d107080fb;
 Mon, 10 Feb 2025 09:46:20 +0100 (CET)
Received: by mail-lf1-x134.google.com with SMTP id
 2adb3069b0e04-54504f5cfe9so1606557e87.0
 for <xen-devel@lists.xenproject.org>; Mon, 10 Feb 2025 00:46:20 -0800 (PST)
Received: from [192.168.209.66] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5450b29eff6sm322829e87.191.2025.02.10.00.46.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 Feb 2025 00:46:19 -0800 (PST)
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
X-Inumbo-ID: 80302715-e78b-11ef-a075-877d107080fb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739177180; x=1739781980; darn=lists.xenproject.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hEebn1ngqTdBDgjie4K+90PEvpvvHcWRH9GxQ5O8rUE=;
        b=DoHYyh81VdAx1u2o3RbPV5/ZtzcV/LOikJTefTX0R5r1uNEg49JB5u/0I7jn/kqOWQ
         mkUTnVeVu0KBPngObzYD+ml1VlaMiIoJy3njtlDEQ1WCXKQi1OAeKmhUyJIFNJu+0PQW
         uwa+8lIs1fApuQq3LACBlOxTIqlhnI+a3ZHBq2ogWOPt6FKtobsa1GC9LAI3UTUpXtsJ
         0KVExvlAnH5ZBV3M7zePZNsqsMm8wh64W6phyTU1C+Gs88EdijwPs4vDbfZ5X0VQi8lg
         Yc8YN1Y5culsjUmu2B6DupSRGB3Rw86QyXUwNNA+2pW5awSmwfmTdfHHWNqZiAhmEPV9
         sNjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739177180; x=1739781980;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=hEebn1ngqTdBDgjie4K+90PEvpvvHcWRH9GxQ5O8rUE=;
        b=rUEnpOCFixiHR2Ga/ncBcxOWF+AZTVPPcuEyxdrQiiO1OtHwDGH9TeqzfZt0r2FYSV
         4q4/42aA22uMzP1iuv1mYD8GufLtc7EfUXDFgeYa+StroCxev6OHu/0CUio1r6sq18lA
         Wv5gRjoSPDrlNCiwOAjdusql9wCddSHl7ULywvzqA+cZRRJNmXlZia+7bWvBTeojQbJv
         aK1fqcNf8bvoVjCn1rL5D90ws0EKeTXmL9KeHiwVpY9jRtWwDU6bIqHd0bdF3pBu0/MP
         5o8jk3I9u4GWUF15pjd7hqTOmyfFnP5+nn4tW9uX9wJO64mUX2QhBrj6pAvQiqGaf56a
         PNRg==
X-Forwarded-Encrypted: i=1; AJvYcCW/N0B3LWkX4AsmKcGgBbdSppSXYJ71ueJfmcT7GUXHFUgjCtLTv9LVWH3UK98eWsXMFy3KJC6l3m0=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzAm9cAF49z2P8WHaRhV4WhFjwkG8fBXBYvFhwu/0lkN2DcSHDL
	LkmA3bohy7Bu1wV/tdi7/BEx2V+P6EppfUL2K3oZxH9fjryvNMlT
X-Gm-Gg: ASbGnctvsJbN0uRTgd3xcKGizIlNrCZrLt9df29lG8Omj924Al9aY+SP7oUO7YKoBA9
	3fS/VcHNUXxfkwzkqL7RVhRjwbHEgLAY0cqkybdIX978flRHi7BDP5kG0ZjLqxLyHlSiYCmV433
	UOLs4nAZhtK4k/4FUjyQN8u0oFBFVa7WuXgyyAsbtrRN9Bi8mIz3GHRE7uz116Y5fY+md+w9tgP
	A4GPgMUa1S4egtVbrTy1f66bONYoCozi2KX+moAtLqF0EbWMT58wGCDs74ZzB3wcFW6QWDioSps
	I7VMeLA8uGuSfwvnSOv1xcX44YI=
X-Google-Smtp-Source: AGHT+IFu1sBRFdexNvQpat/byr63FSh7VJedK1k/8Vkz4v59S5nHB1ODCw52YCkSJcZC/cq1QS67uw==
X-Received: by 2002:a05:6512:10cf:b0:545:ec1:9fd3 with SMTP id 2adb3069b0e04-5450ec1a033mr402013e87.9.1739177180003;
        Mon, 10 Feb 2025 00:46:20 -0800 (PST)
Content-Type: multipart/alternative;
 boundary="------------k0PR9etEMrto89tCj6YZ9BCZ"
Message-ID: <e7e94ad8-cf68-444c-8e09-7c622620a5ee@gmail.com>
Date: Mon, 10 Feb 2025 09:46:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for 4.20? v3 2/3] xen/riscv: update defintion of
 vmap_to_mfn()
To: Jan Beulich <jbeulich@suse.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1738933678.git.oleksii.kurochko@gmail.com>
 <bbea545c2ca25f5e827e4d3b4cb2466478791480.1738933678.git.oleksii.kurochko@gmail.com>
 <26deedab-b48c-4000-9937-b6b168fd590b@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <26deedab-b48c-4000-9937-b6b168fd590b@suse.com>

This is a multi-part message in MIME format.
--------------k0PR9etEMrto89tCj6YZ9BCZ
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 2/7/25 2:30 PM, Jan Beulich wrote:
> On 07.02.2025 14:13, Oleksii Kurochko wrote:
>> vmap_to_mfn() uses virt_to_maddr(), which is designed to work with VA from
>> either the direct map region or Xen's linkage region (XEN_VIRT_START).
>> An assertion will occur if it is used with other regions, in particular for
>> the VMAP region.
>>
>> Since RISC-V lacks a hardware feature to request the MMU to translate a VA to
>> a PA (as Arm does, for example), software page table walking (pt_walk()) is
>> used for the VMAP region to obtain the mfn from pte_t.
>>
>> To avoid introduce a circular dependency between asm/mm.h and asm/page.h by
>> including each other, the macro _vmap_to_mfn() is introduced in asm/page.h,
>> as it uses struct pte_t and pte_is_mapping() from asm/page.h. _vmap_to_mfn()
>> macro is then reused in the definition of vmap_to_mfn() macro in asm/mm.h.
>>
>> Fixes: 7db8d2bd9b ("xen/riscv: add minimal stuff to mm.h to build full Xen")
>> Signed-off-by: Oleksii Kurochko<oleksii.kurochko@gmail.com>
>> ---
>> Changes in v3:
>> - Move vmap_to_mfn_ to asm/page.h to deal with circular dependency.
>> - Convert vmap_to_mfn_() to macros.
> Why both?

Just for consistency. vmap_to_mfn_() could be defined as static inline, I can
send the new patch version with such changes, probably, static inline would be
better in this case.

>> --- a/xen/arch/riscv/include/asm/page.h
>> +++ b/xen/arch/riscv/include/asm/page.h
>> @@ -210,6 +210,13 @@ static inline pte_t pte_from_mfn(mfn_t mfn, unsigned int flags)
>>   
>>   pte_t pt_walk(vaddr_t va, unsigned int *pte_level);
>>   
>> +#define _vmap_to_mfn(va)                \
>> +({                                      \
>> +    pte_t entry = pt_walk((va), NULL);  \
> If this is to remain a macro, va doesn't need parenthesizing (as the argument
> passed is just the identifier, not an expression.
>
> Be careful with the naming of macro local variables. Consider a use size (for
> whatever reason) having
>
>      unsigned long entry;
>      ...
>      mfn = vmap_to_mfn(entry);
>
> This is where appending an underscore comes into play.

This could be another reason to use|static inline _vmap_to_mfn(...)| instead of a macro.

I think I will rewrite the|_vmap_to_mfn()| macro as a|static inline| function in the next
patch series version. I'll send it after receiving comments on the entire patch series.

Thanks.

~ Oleksii

--------------k0PR9etEMrto89tCj6YZ9BCZ
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
    <div class="moz-cite-prefix">On 2/7/25 2:30 PM, Jan Beulich wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:26deedab-b48c-4000-9937-b6b168fd590b@suse.com">
      <pre wrap="" class="moz-quote-pre">On 07.02.2025 14:13, Oleksii Kurochko wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">vmap_to_mfn() uses virt_to_maddr(), which is designed to work with VA from
either the direct map region or Xen's linkage region (XEN_VIRT_START).
An assertion will occur if it is used with other regions, in particular for
the VMAP region.

Since RISC-V lacks a hardware feature to request the MMU to translate a VA to
a PA (as Arm does, for example), software page table walking (pt_walk()) is
used for the VMAP region to obtain the mfn from pte_t.

To avoid introduce a circular dependency between asm/mm.h and asm/page.h by
including each other, the macro _vmap_to_mfn() is introduced in asm/page.h,
as it uses struct pte_t and pte_is_mapping() from asm/page.h. _vmap_to_mfn()
macro is then reused in the definition of vmap_to_mfn() macro in asm/mm.h.

Fixes: 7db8d2bd9b ("xen/riscv: add minimal stuff to mm.h to build full Xen")
Signed-off-by: Oleksii Kurochko <a class="moz-txt-link-rfc2396E" href="mailto:oleksii.kurochko@gmail.com">&lt;oleksii.kurochko@gmail.com&gt;</a>
---
Changes in v3:
- Move vmap_to_mfn_ to asm/page.h to deal with circular dependency.
- Convert vmap_to_mfn_() to macros.
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Why both?</pre>
    </blockquote>
    <pre>Just for consistency. vmap_to_mfn_() could be defined as static inline, I can
send the new patch version with such changes, probably, static inline would be
better in this case.

</pre>
    <blockquote type="cite"
      cite="mid:26deedab-b48c-4000-9937-b6b168fd590b@suse.com">
      <pre wrap="" class="moz-quote-pre">
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">--- a/xen/arch/riscv/include/asm/page.h
+++ b/xen/arch/riscv/include/asm/page.h
@@ -210,6 +210,13 @@ static inline pte_t pte_from_mfn(mfn_t mfn, unsigned int flags)
 
 pte_t pt_walk(vaddr_t va, unsigned int *pte_level);
 
+#define _vmap_to_mfn(va)                \
+({                                      \
+    pte_t entry = pt_walk((va), NULL);  \
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
If this is to remain a macro, va doesn't need parenthesizing (as the argument
passed is just the identifier, not an expression.

Be careful with the naming of macro local variables. Consider a use size (for
whatever reason) having

    unsigned long entry;
    ...
    mfn = vmap_to_mfn(entry);

This is where appending an underscore comes into play.</pre>
    </blockquote>
    <pre>This could be another reason to use <code>static inline _vmap_to_mfn(...)</code> instead of a macro.

I think I will rewrite the <code>_vmap_to_mfn()</code> macro as a <code>static inline</code> function in the next
patch series version. I'll send it after receiving comments on the entire patch series.

Thanks.

~ Oleksii
</pre>
  </body>
</html>

--------------k0PR9etEMrto89tCj6YZ9BCZ--

