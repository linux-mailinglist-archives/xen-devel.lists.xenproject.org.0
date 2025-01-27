Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 210C3A1D4D5
	for <lists+xen-devel@lfdr.de>; Mon, 27 Jan 2025 11:52:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.877680.1287817 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tcMix-0006C6-AQ; Mon, 27 Jan 2025 10:52:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 877680.1287817; Mon, 27 Jan 2025 10:52:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tcMix-0006AR-7q; Mon, 27 Jan 2025 10:52:11 +0000
Received: by outflank-mailman (input) for mailman id 877680;
 Mon, 27 Jan 2025 10:52:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qVGR=UT=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1tcMdY-0001ah-4o
 for xen-devel@lists.xenproject.org; Mon, 27 Jan 2025 10:46:36 +0000
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [2a00:1450:4864:20::229])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fa7e16e0-dc9b-11ef-a0e6-8be0dac302b0;
 Mon, 27 Jan 2025 11:46:35 +0100 (CET)
Received: by mail-lj1-x229.google.com with SMTP id
 38308e7fff4ca-30613802a04so44033881fa.2
 for <xen-devel@lists.xenproject.org>; Mon, 27 Jan 2025 02:46:35 -0800 (PST)
Received: from [192.168.219.191] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-3076bc19614sm14251691fa.69.2025.01.27.02.46.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Jan 2025 02:46:34 -0800 (PST)
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
X-Inumbo-ID: fa7e16e0-dc9b-11ef-a0e6-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737974795; x=1738579595; darn=lists.xenproject.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k5lEUWzgXvLvxqvn90u0nUXpGS3fDaQopw24r12oRWw=;
        b=bj6+t24hqtODBimktizGlNs3xLRF4Oj4rtGI0hnQ0F4ku/a34MjtjCkbz68YTZGFSI
         x+/Y9XKhGX6fG86UlQiWCK1TTEbVAfWPGkbbShf143xgweRlGVWiJSKP5uknN8Xp4gTB
         nSqrQ+TxiOeTMviWJ6MostWvP1zrzUPyUrulY0JyVYHBNb/MsL885YXYLfAAsvt6KS+k
         SStPBKYBGN8GtbVTUPOsfA3L0CVOkQ3c4S3o7BNyIKd3QuaJIs74FaN1LpeSSnFIC+oC
         lHhcyaYppFyWQR3UE15/a6RWq6DV9Bx/UkYvVfS7REAn4LI4ynfhSbGoJKVGqKFS2BuE
         3tJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737974795; x=1738579595;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=k5lEUWzgXvLvxqvn90u0nUXpGS3fDaQopw24r12oRWw=;
        b=EhUBVbjl7rQWio74Q4bzlgumMT8sxtD4PB0m6CCLuYoR8OUklr3Ypr3Ccv6XUqIR8n
         hrQ9vFE2xa9icl1tKPfhTFNJR5Cju83a13Oyww5Bu1Locz3y2xSA+IguTz1oF7P5CM4w
         GF6awJz9PVYAlFwGEcVI5GMZxqENePLGqRp4CZAFnJqESjXoK0MKTzSJYW0pXV10VBFl
         Rpp9yETuEPPBy2Kq+M6z2LRVHFCexAQnfKe8WknlKgiFeltGxfvD3FQVQ9RbI8nRNkge
         MZjRfp1XZL3h58uUZtEdnWOuTRMaPOGByxFDzEzwfHMDRsPslnXzzQrEXTKJPWPRDJZH
         NbHw==
X-Forwarded-Encrypted: i=1; AJvYcCUQzQIWv+HFtucG3U3LmRTHGQddus2IhYTAD/Q4DvP+NcQWX/DmynqBXE54n/F08w6ehgKs1sSvpog=@lists.xenproject.org
X-Gm-Message-State: AOJu0Ywzz7nhS5617HYFTor5mMXolSZyiL2hxqHau4Ox3DyxzBCFimPW
	sd/CbQzycpnMDGJEjwtpAFRR5Obb7gu4+g962FfPSpYABhj2LWdt
X-Gm-Gg: ASbGncsDBCnNTw58OqYqezTBBK0mYpsC5enbUBapn6Hh+/6PfoxeGXATErchOxuJZCR
	rYm6C3TZoZ9hzElcXPNXt2W221c+yIUFL1qfbpR+BU+9mYCLkpC0UYJzu98zYcqiJ2QzTxHqgaO
	gqYYMnTRCGSbDrFH4ReDgG1/S5o1uts45mPqzNOC34E6//5z7n11bsqiIU/QXsTyI9LmBuKGFAn
	IRWDi2vUD1uQmFToM+pIjYIOhIBOvubIUzmr9oI2B0R/QH0ddU/4KgYpKpJBsxTL7PzTyhglsR6
	eOHiq522ykqSedsFcA==
X-Google-Smtp-Source: AGHT+IFjPFW1ByP4+7nnOXYgAfCAVV6ahZA2UqGgf1/6HRADwylGqoyRLFaWpi3ae3WG3+uz0ukhiQ==
X-Received: by 2002:a2e:a54a:0:b0:300:43cd:3b18 with SMTP id 38308e7fff4ca-3072cb3a76dmr144956561fa.36.1737974794518;
        Mon, 27 Jan 2025 02:46:34 -0800 (PST)
Content-Type: multipart/alternative;
 boundary="------------MeY1ENnMmOw4u2oSx5g6K1Ws"
Message-ID: <b6d21569-c692-4270-ae0f-137246881a8a@gmail.com>
Date: Mon, 27 Jan 2025 11:46:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.20] x86/PV: further harden guest memory accesses
 against speculative abuse
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <a615a96e-95d2-442f-b57d-0bb51142c977@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <a615a96e-95d2-442f-b57d-0bb51142c977@suse.com>

This is a multi-part message in MIME format.
--------------MeY1ENnMmOw4u2oSx5g6K1Ws
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 1/27/25 11:15 AM, Jan Beulich wrote:
> The original implementation has two issues: For one it doesn't preserve
> non-canonical-ness of inputs in the range 0x8000000000000000 through
> 0x80007fffffffffff. Bogus guest pointers in that range would not cause a
> (#GP) fault upon access, when they should.
>
> And then there is an AMD-specific aspect, where only the low 48 bits of
> an address are used for speculative execution; the architecturally
> mandated #GP for non-canonical addresses would be raised at a later
> execution stage. Therefore to prevent Xen controlled data to make it
> into any of the caches in a guest controllable manner, we need to
> additionally ensure that for non-canonical inputs bit 47 would be clear.
>
> See the code comment for how addressing both is being achieved.
>
> Fixes: 4dc181599142 ("x86/PV: harden guest memory accesses against speculative abuse")
> Signed-off-by: Jan Beulich<jbeulich@suse.com>

With getting proper Acked-by/Reviewed-by:
   R-Acked-by: Oleksii Kurochko<oleksii.kurochko@gmail.com>

Thanks.

~ Oleksii

> ---
> RFC: When scratch2 isn't %r8...%r15, the MOV, CMOVNB, and XOR will have
>       unnecessary REX prefixes emitted, as users of the macro pass in 64-
>       bit registers. Similar to what was done to be able to use SETcc (in
>       the earlier alternative code sequence), we could derive %e.. from
>       %r.. to shrink code size some; there are a few dozen instances of
>       this code, after all. (An alternative, requiring to touch the use
>       sites, would be to constrain the scratch registers to rAX...rDI and
>       pass in only the last two characters of the names [e.g. "di", i.e.
>       also without the leading %]. That would make it straightforward to
>       use both %r.. and %e.. at the same time.)
> ---
> v2: Drop the non-RCR alternative.
>
> --- a/xen/arch/x86/include/asm/asm-defns.h
> +++ b/xen/arch/x86/include/asm/asm-defns.h
> @@ -1,3 +1,5 @@
> +#include <asm/page-bits.h>
> +
>   #ifndef HAVE_AS_CLAC_STAC
>   .macro clac
>       .byte 0x0f, 0x01, 0xca
> @@ -65,17 +67,36 @@
>   .macro guest_access_mask_ptr ptr:req, scratch1:req, scratch2:req
>   #if defined(CONFIG_SPECULATIVE_HARDEN_GUEST_ACCESS)
>       /*
> -     * Here we want
> -     *
> -     * ptr &= ~0ull >> (ptr < HYPERVISOR_VIRT_END);
> -     *
> +     * Here we want to adjust \ptr such that
> +     * - if it's within Xen range, it becomes non-canonical,
> +     * - otherwise if it's (non-)canonical on input, it retains that property,
> +     * - if the result is non-canonical, bit 47 is clear (to avoid
> +     *   potentially populating the cache with Xen data),
>        * but guaranteed without any conditional branches (hence in assembly).
> +     *
> +     * To achieve this we determine which bit to forcibly clear: Either bit 47
> +     * (in case the address is below HYPERVISOR_VIRT_END) or bit 63.  Further
> +     * we determine whether for forcably set bit 63: In case we first cleared
> +     * it, we'll merely restore the original address.  In case we ended up
> +     * clearing bit 47 (i.e. the address was either non-canonical or within Xen
> +     * range), setting the bit will yield a guaranteed non-canonical address.
> +     * If we didn't clear a bit, we also won't set one: The address was in the
> +     * low half of address space in that case with bit 47 already clear.  The
> +     * address can thus be left unchanged, whether canonical or not.
>        */
>       mov $(HYPERVISOR_VIRT_END - 1), \scratch1
> -    mov $~0, \scratch2
> +    mov $(VADDR_BITS - 1), \scratch2
>       cmp \ptr, \scratch1
> +    /*
> +     * Not needed: The value we have in \scratch1 will be truncated to 6 bits,
> +     * thus yielding the value we need.
> +    mov $63, \scratch1
> +     */
> +    cmovnb \scratch2, \scratch1
> +    xor \scratch2, \scratch2
> +    btr \scratch1, \ptr
>       rcr $1, \scratch2
> -    and \scratch2, \ptr
> +    or \scratch2, \ptr
>   #elif defined(CONFIG_DEBUG) && defined(CONFIG_PV)
>       xor $~\@, \scratch1
>       xor $~\@, \scratch2
--------------MeY1ENnMmOw4u2oSx5g6K1Ws
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
    <div class="moz-cite-prefix">On 1/27/25 11:15 AM, Jan Beulich wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:a615a96e-95d2-442f-b57d-0bb51142c977@suse.com">
      <pre wrap="" class="moz-quote-pre">The original implementation has two issues: For one it doesn't preserve
non-canonical-ness of inputs in the range 0x8000000000000000 through
0x80007fffffffffff. Bogus guest pointers in that range would not cause a
(#GP) fault upon access, when they should.

And then there is an AMD-specific aspect, where only the low 48 bits of
an address are used for speculative execution; the architecturally
mandated #GP for non-canonical addresses would be raised at a later
execution stage. Therefore to prevent Xen controlled data to make it
into any of the caches in a guest controllable manner, we need to
additionally ensure that for non-canonical inputs bit 47 would be clear.

See the code comment for how addressing both is being achieved.

Fixes: 4dc181599142 ("x86/PV: harden guest memory accesses against speculative abuse")
Signed-off-by: Jan Beulich <a class="moz-txt-link-rfc2396E" href="mailto:jbeulich@suse.com">&lt;jbeulich@suse.com&gt;</a></pre>
    </blockquote>
    <pre>With getting proper Acked-by/Reviewed-by:
  R-Acked-by: Oleksii Kurochko<a class="moz-txt-link-rfc2396E" href="mailto:oleksii.kurochko@gmail.com">&lt;oleksii.kurochko@gmail.com&gt;</a></pre>
    <pre>Thanks.</pre>
    <pre>~ Oleksii
</pre>
    <blockquote type="cite"
      cite="mid:a615a96e-95d2-442f-b57d-0bb51142c977@suse.com">
      <pre wrap="" class="moz-quote-pre">
---
RFC: When scratch2 isn't %r8...%r15, the MOV, CMOVNB, and XOR will have
     unnecessary REX prefixes emitted, as users of the macro pass in 64-
     bit registers. Similar to what was done to be able to use SETcc (in
     the earlier alternative code sequence), we could derive %e.. from
     %r.. to shrink code size some; there are a few dozen instances of
     this code, after all. (An alternative, requiring to touch the use
     sites, would be to constrain the scratch registers to rAX...rDI and
     pass in only the last two characters of the names [e.g. "di", i.e.
     also without the leading %]. That would make it straightforward to
     use both %r.. and %e.. at the same time.)
---
v2: Drop the non-RCR alternative.

--- a/xen/arch/x86/include/asm/asm-defns.h
+++ b/xen/arch/x86/include/asm/asm-defns.h
@@ -1,3 +1,5 @@
+#include &lt;asm/page-bits.h&gt;
+
 #ifndef HAVE_AS_CLAC_STAC
 .macro clac
     .byte 0x0f, 0x01, 0xca
@@ -65,17 +67,36 @@
 .macro guest_access_mask_ptr ptr:req, scratch1:req, scratch2:req
 #if defined(CONFIG_SPECULATIVE_HARDEN_GUEST_ACCESS)
     /*
-     * Here we want
-     *
-     * ptr &amp;= ~0ull &gt;&gt; (ptr &lt; HYPERVISOR_VIRT_END);
-     *
+     * Here we want to adjust \ptr such that
+     * - if it's within Xen range, it becomes non-canonical,
+     * - otherwise if it's (non-)canonical on input, it retains that property,
+     * - if the result is non-canonical, bit 47 is clear (to avoid
+     *   potentially populating the cache with Xen data),
      * but guaranteed without any conditional branches (hence in assembly).
+     *
+     * To achieve this we determine which bit to forcibly clear: Either bit 47
+     * (in case the address is below HYPERVISOR_VIRT_END) or bit 63.  Further
+     * we determine whether for forcably set bit 63: In case we first cleared
+     * it, we'll merely restore the original address.  In case we ended up
+     * clearing bit 47 (i.e. the address was either non-canonical or within Xen
+     * range), setting the bit will yield a guaranteed non-canonical address.
+     * If we didn't clear a bit, we also won't set one: The address was in the
+     * low half of address space in that case with bit 47 already clear.  The
+     * address can thus be left unchanged, whether canonical or not.
      */
     mov $(HYPERVISOR_VIRT_END - 1), \scratch1
-    mov $~0, \scratch2
+    mov $(VADDR_BITS - 1), \scratch2
     cmp \ptr, \scratch1
+    /*
+     * Not needed: The value we have in \scratch1 will be truncated to 6 bits,
+     * thus yielding the value we need.
+    mov $63, \scratch1
+     */
+    cmovnb \scratch2, \scratch1
+    xor \scratch2, \scratch2
+    btr \scratch1, \ptr
     rcr $1, \scratch2
-    and \scratch2, \ptr
+    or \scratch2, \ptr
 #elif defined(CONFIG_DEBUG) &amp;&amp; defined(CONFIG_PV)
     xor $~\@, \scratch1
     xor $~\@, \scratch2
</pre>
    </blockquote>
  </body>
</html>

--------------MeY1ENnMmOw4u2oSx5g6K1Ws--

