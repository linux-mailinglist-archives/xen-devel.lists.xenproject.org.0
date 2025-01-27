Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A96BBA1D636
	for <lists+xen-devel@lfdr.de>; Mon, 27 Jan 2025 13:51:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.877851.1288008 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tcOa4-000554-KR; Mon, 27 Jan 2025 12:51:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 877851.1288008; Mon, 27 Jan 2025 12:51:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tcOa4-00052y-HH; Mon, 27 Jan 2025 12:51:08 +0000
Received: by outflank-mailman (input) for mailman id 877851;
 Mon, 27 Jan 2025 12:51:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qVGR=UT=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1tcOa3-00052s-GO
 for xen-devel@lists.xenproject.org; Mon, 27 Jan 2025 12:51:07 +0000
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [2a00:1450:4864:20::136])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5f273fee-dcad-11ef-99a4-01e77a169b0f;
 Mon, 27 Jan 2025 13:51:05 +0100 (CET)
Received: by mail-lf1-x136.google.com with SMTP id
 2adb3069b0e04-53df80eeeedso4875215e87.2
 for <xen-devel@lists.xenproject.org>; Mon, 27 Jan 2025 04:51:05 -0800 (PST)
Received: from [192.168.219.191] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-543c8368537sm1279197e87.108.2025.01.27.04.51.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Jan 2025 04:51:04 -0800 (PST)
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
X-Inumbo-ID: 5f273fee-dcad-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737982265; x=1738587065; darn=lists.xenproject.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nKiWRlgC9unDB3h1nsQGLnmjm3RUS9cr34MuKcNsCBM=;
        b=NaRsG6uKNgbDJoHiJwVxcMqfZbbaKUxuMK+CQhgvyPYlNO4WXfg+Hh4Fg9LxfBRIxQ
         n98Qqwhhkj/wgoq3AC70ytFa67k+ZH6q49BZC/6/VpYNrHQJyWVt+Fye+qY8805hUCgH
         s0O90rwZAQysJDPNH+ekEtKMDjsQEhpbZvdlKIjdcEWJgIHRdC8gorpnL/pg43IhbYFg
         317jQfnt01aJeV80ZBFl8FqVHQtprUSa+sTP/A7OD3s5VhUkenIUNhNAhT3PRxOuqop5
         q1fhzAiN74Uo9+zOBhoTeQpdlYSBlIjbXAv7SSeNPHmaIasZQgt8fhNa11L5+lk5JXj0
         r35w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737982265; x=1738587065;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=nKiWRlgC9unDB3h1nsQGLnmjm3RUS9cr34MuKcNsCBM=;
        b=Joz2eegaCyAFLeU9xv8cP5L57tCfPQMwxeC5mQgEFkw8XZzwrsUX74uW7MJ5MOIsDp
         iTx0p80lfn3p7zs7KeteXCdOxdHKUdTzPJvXr4gTdjEjWK+ZJ4DrrdXbAvSGM3EqN1NT
         vZVFIGIjBwhn5DYiIxGuG6aAbK4FVC8+X1o/p4nUFwAvN0nW4a9tpFqXR22jRC2sZTuf
         EedWv9V+m9o7Byp/B0sGmBgPAWXgEPylICypRUCaxj85/eVfRgZFdMSCvApm5Lj4cNyC
         F7NruuPE2u+OxnQA8+YL37dT1M6xVi95INfm9/dCsqbWMuxVqGCt8/X5/WRVE31HwnPa
         lVJQ==
X-Forwarded-Encrypted: i=1; AJvYcCXZ9nCXYEQhTrSvd8dosF7W5Js4Ej+Xsw/5UOY8mEytVDqFP++i/VX92gE9eRHJWCp49GpMtDyqLPw=@lists.xenproject.org
X-Gm-Message-State: AOJu0YytxAlc373kays9rFpvhugHJ4klRgAXgtN6ccWc58B1B0urTFIq
	6oT2igFA5+wKxU+FB+2YaJ1tSGpp4aUcYaJ1+4OvJW9HLjPd4WJX
X-Gm-Gg: ASbGnctSCgHGzlKcH9d+6GoXXaWoItHVPvWTV4gTnXJv6xMtsMHYEs54x0g0EW/9TfG
	KbSB8432aK6ZLtEppBK6PmhqCd7FoonmBZgNuRljToUkFFiDp7aWLYMS5uFMKlpHARt4GqWHGpH
	aLU718szM7ixK1J9hf1pOBqXK1KhGuDb99g+Gj8oo+815sgALFUdbQUuln6bd/1AYyJ3JJpEZyV
	VCnSRO0CtPBl5sqQOtmRRUJJuGrQv1JXb4le597f3EqMqJHYEutoAj46Z430uRbmLg4DdLw2+Od
	4kKCLF0zgMGQVad+4g==
X-Google-Smtp-Source: AGHT+IGFR6hcTxr6SA1eBVTklRaJznZyQlE2IbX5CpAZphva/b9cshwMG/FycajoeeoKjLCNCQ+qCg==
X-Received: by 2002:ac2:4543:0:b0:542:29e5:731c with SMTP id 2adb3069b0e04-5439c21f202mr12480473e87.11.1737982264826;
        Mon, 27 Jan 2025 04:51:04 -0800 (PST)
Content-Type: multipart/alternative;
 boundary="------------6jrSlmCvCdxuWNEstkOWV6Gu"
Message-ID: <f3184cac-fbe3-463b-8354-136ff899b6d8@gmail.com>
Date: Mon, 27 Jan 2025 13:51:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 3/3] xen/riscv: update mfn calculation in
 pt_mapping_level()
To: Jan Beulich <jbeulich@suse.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1737391102.git.oleksii.kurochko@gmail.com>
 <a4a970490471035bf49a97257b400da23091fb9a.1737391102.git.oleksii.kurochko@gmail.com>
 <f244ed32-cf27-452f-8c92-206f892f809c@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <f244ed32-cf27-452f-8c92-206f892f809c@suse.com>

This is a multi-part message in MIME format.
--------------6jrSlmCvCdxuWNEstkOWV6Gu
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 1/27/25 11:24 AM, Jan Beulich wrote:
> On 20.01.2025 17:54, Oleksii Kurochko wrote:
>> --- a/xen/arch/riscv/pt.c
>> +++ b/xen/arch/riscv/pt.c
>> @@ -346,9 +346,33 @@ static int pt_mapping_level(unsigned long vfn, mfn_t mfn, unsigned long nr,
>>           return level;
>>   
>>       /*
>> -     * Don't take into account the MFN when removing mapping (i.e
>> -     * MFN_INVALID) to calculate the correct target order.
>> +     * `mfn` should be set properly in cases when modifying/destroying a
>> +     * mapping to ensure the correct page table `level` is received. In the
>> +     * case of `mfn` == INVALID_MFN, the `mask` will take into account only
>> +     * `vfn` and could accidentally return an incorrect level. For example,
>> +     * if `vfn` is page table level 1 aligned, but it was mapped as page table
>> +     * level 0, then without the check below it will return `level` = 1
>> +     * because only `vfn`, which is page table level 1 aligned, is taken into
>> +     * account when `mfn` == INVALID_MFN.
>>        *
>> +     * POPULATE shouldn't be considered as `va` hasn't been mapped yet.
>> +     */
>> +    if ( mfn_eq(mfn, INVALID_MFN) && !(flags & PTE_POPULATE) )
>> +    {
>> +        vaddr_t va = vfn << PAGE_SHIFT;
>> +        paddr_t pa;
>> +        unsigned long xen_virt_end = (XEN_VIRT_START + XEN_VIRT_SIZE - 1);
>> +
>> +        if ( ((va >= DIRECTMAP_VIRT_START) && (va <= DIRECTMAP_VIRT_END)) ||
>> +             ((va >= XEN_VIRT_START) && (va <= xen_virt_end)) )
>> +            pa = virt_to_maddr(va);
>> +        else
>> +            pa = pt_walk(va);
>> +
>> +        mfn = _mfn(paddr_to_pfn(pa));
>> +    }
> Doing a walk here and then another in pt_update() feels wasteful.

I agree that it is wasteful but, at that moment, it seemed to me the faster way to resolve that.

>   I
> wonder whether the overall approach to page table updating doesn't want
> changing. It ought to be possible to tell an "update" operation to walk
> down to wherever the leaf entry is, and update there.

I think I got your idea. I will try to implement that.

Thanks!

~ Oleksii



--------------6jrSlmCvCdxuWNEstkOWV6Gu
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
    <div class="moz-cite-prefix">On 1/27/25 11:24 AM, Jan Beulich wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:f244ed32-cf27-452f-8c92-206f892f809c@suse.com">
      <pre wrap="" class="moz-quote-pre">On 20.01.2025 17:54, Oleksii Kurochko wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">--- a/xen/arch/riscv/pt.c
+++ b/xen/arch/riscv/pt.c
@@ -346,9 +346,33 @@ static int pt_mapping_level(unsigned long vfn, mfn_t mfn, unsigned long nr,
         return level;
 
     /*
-     * Don't take into account the MFN when removing mapping (i.e
-     * MFN_INVALID) to calculate the correct target order.
+     * `mfn` should be set properly in cases when modifying/destroying a
+     * mapping to ensure the correct page table `level` is received. In the
+     * case of `mfn` == INVALID_MFN, the `mask` will take into account only
+     * `vfn` and could accidentally return an incorrect level. For example,
+     * if `vfn` is page table level 1 aligned, but it was mapped as page table
+     * level 0, then without the check below it will return `level` = 1
+     * because only `vfn`, which is page table level 1 aligned, is taken into
+     * account when `mfn` == INVALID_MFN.
      *
+     * POPULATE shouldn't be considered as `va` hasn't been mapped yet.
+     */
+    if ( mfn_eq(mfn, INVALID_MFN) &amp;&amp; !(flags &amp; PTE_POPULATE) )
+    {
+        vaddr_t va = vfn &lt;&lt; PAGE_SHIFT;
+        paddr_t pa;
+        unsigned long xen_virt_end = (XEN_VIRT_START + XEN_VIRT_SIZE - 1);
+
+        if ( ((va &gt;= DIRECTMAP_VIRT_START) &amp;&amp; (va &lt;= DIRECTMAP_VIRT_END)) ||
+             ((va &gt;= XEN_VIRT_START) &amp;&amp; (va &lt;= xen_virt_end)) )
+            pa = virt_to_maddr(va);
+        else
+            pa = pt_walk(va);
+
+        mfn = _mfn(paddr_to_pfn(pa));
+    }
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Doing a walk here and then another in pt_update() feels wasteful.</pre>
    </blockquote>
    <pre>I agree that it is wasteful but, at that moment, it seemed to me the faster way to resolve that.

</pre>
    <blockquote type="cite"
      cite="mid:f244ed32-cf27-452f-8c92-206f892f809c@suse.com">
      <pre wrap="" class="moz-quote-pre"> I
wonder whether the overall approach to page table updating doesn't want
changing. It ought to be possible to tell an "update" operation to walk
down to wherever the leaf entry is, and update there.</pre>
    </blockquote>
    <pre>I think I got your idea. I will try to implement that.

Thanks!

~ Oleksii



</pre>
  </body>
</html>

--------------6jrSlmCvCdxuWNEstkOWV6Gu--

