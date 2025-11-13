Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D0AACC58A9D
	for <lists+xen-devel@lfdr.de>; Thu, 13 Nov 2025 17:19:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1161867.1489699 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vJa2G-0001R6-FF; Thu, 13 Nov 2025 16:19:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1161867.1489699; Thu, 13 Nov 2025 16:19:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vJa2G-0001Oy-Bl; Thu, 13 Nov 2025 16:19:00 +0000
Received: by outflank-mailman (input) for mailman id 1161867;
 Thu, 13 Nov 2025 16:18:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Z8X8=5V=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1vJa2E-0001Om-PG
 for xen-devel@lists.xenproject.org; Thu, 13 Nov 2025 16:18:59 +0000
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [2a00:1450:4864:20::635])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 72a4f186-c0ac-11f0-980a-7dc792cee155;
 Thu, 13 Nov 2025 17:18:54 +0100 (CET)
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-b733707e0b5so148073866b.2
 for <xen-devel@lists.xenproject.org>; Thu, 13 Nov 2025 08:18:54 -0800 (PST)
Received: from [192.168.1.6] (user-109-243-71-38.play-internet.pl.
 [109.243.71.38]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b734fad41e5sm190198166b.19.2025.11.13.08.18.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Nov 2025 08:18:52 -0800 (PST)
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
X-Inumbo-ID: 72a4f186-c0ac-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763050733; x=1763655533; darn=lists.xenproject.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vfxp4umD1Xg05j/REVzb8M+UtMDlF3NACkCMxy5SXpY=;
        b=EwdsZSvrPh4cbYyTk+M89qQe2J1UssJ64//0LoolgNaXBp+OvJVKAg/goAL7yUq7AW
         JTFUHf20eqS043nWdS4swUBMYuUVONtMsF9l8n812Y93JlVGsk9r2im0L/NWi5fRPX5b
         XMFhP8542ael2qsdwpqsD6cEhPzzdkmoCJPhXRGRqIl45tIjXPjZDrHrPWOrxXs5JHaq
         hKbiQJIWAxGdBFAQZEeJRnt9eM3Eqt610rWV3E8z4WdIDy6a8b1g8tjnkI3Hd1kEDWzK
         R+PcR8HsiOTOju1QZ438xb1mFDHX54CKG9WrVCDhqGyastQ+Um3YMhXa3lyexiWd1W1/
         ebsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763050733; x=1763655533;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vfxp4umD1Xg05j/REVzb8M+UtMDlF3NACkCMxy5SXpY=;
        b=ETZgEDRsRT03SqThgz49jkqMV5giW75n8BVbKdmfFFWhNPy9Oll+W2nEiEQSzfXh7U
         DWeraUzr2tD0Lxg+JqCV4SfpTFaIQnk+APUm/hOZ2kYVzkh7ffCW5YmLZMO1gqsuzkXx
         99BIpqstZqinARred8CLLXmVk6oevUQjsXeYQoioa8bh182maG57X/VHeLYEXY0zTYX7
         IUSDeDevKnwaKI5jIVSJ/6T4FLjpnXptj1THqhWQ5wG69VOemG7OVDfyBcg5aJOM3Jsf
         FPSS2mu+QrDOFm+FptpUwC1BchOLswXskRfVvlc1UxZNz5x9ck3aGhleiEi76tCk68u4
         KTcg==
X-Forwarded-Encrypted: i=1; AJvYcCXoENyN1IS0TrxBLjmf2QcYPqYzWFGoMMUh0AuCLXAe3llPyL8HlHUhOSYgbmpf2fxIpYzAdTAHxGI=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxTbi0JNjujs0hCjbxOSnJdjUUfIUWNNs7SQq2l36BP8jiG68b1
	exrjXZqIGvagOBaTccaIdayHNjqn7zxu+sJucU72C13HgAfoudGYJN9q
X-Gm-Gg: ASbGncuYAquryPEIagjxiYKXGCmhWWqj3RlpfSYl34rqZzfp88Bvb7Qs58VPPg+Pr7U
	Oyx11grtJQzF8TNZ2HLp3f+dgyf0UjUwjF9vyQmb0aKLWqy1/W4mcAqW6j8g0h+RdcNhiBcsYXU
	jYeer6Qt4Syl09pFbO/vog+U56rVecJd15X/AHP8V0VrgEWNlPgJ8WzsM6kHJCehK2ySwSkGRyp
	82TEiLFtxmxbsrj+okkGkAzjh3JVePZt0gu3Xa4u85psKhJ0GMR5iS1pl2GrzaoOU7l9LT5iRGR
	tpoT6nnOnW5YEW6Zs8gNvGrjsUYL2kiP01wTfaVrKLYD3MZJFgu3HKKjKfR5aDb6Y26bR5hhwHY
	ObeLFrxIU51RvaSXyibe7iGs4K/ZgwNCcFUG0YG+tnYuvrbgr0q/KT4rufvjEQgH2oJXEzi7Z66
	/K9i7P+rXrUznQxVP2PTcicUWqIpoGAi8ccok2teHK23DrtJLaJfoPLoMh+xgK
X-Google-Smtp-Source: AGHT+IFVX9OoDnWAi3E9y1A2PuJ01WPuOHvpIiKdfj1hPiN6tRSF7DlZau77ouuvqea54rjUJNeiPw==
X-Received: by 2002:a17:907:781a:b0:b73:3ced:2f66 with SMTP id a640c23a62f3a-b733ced39f6mr418406466b.14.1763050733166;
        Thu, 13 Nov 2025 08:18:53 -0800 (PST)
Content-Type: multipart/alternative;
 boundary="------------iu02vib3uDmsZBA82REi1e6F"
Message-ID: <6938d333-816d-49f8-9945-db9d4b17f1f1@gmail.com>
Date: Thu, 13 Nov 2025 17:18:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [for 4.22 v5 01/18] xen/riscv: detect and initialize G-stage mode
To: Jan Beulich <jbeulich@suse.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1760974017.git.oleksii.kurochko@gmail.com>
 <2b21348b3300c741b276a47d5942e71d306846eb.1760974017.git.oleksii.kurochko@gmail.com>
 <8b204b21-80fb-408d-972e-8f183eb45dfc@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <8b204b21-80fb-408d-972e-8f183eb45dfc@suse.com>

This is a multi-part message in MIME format.
--------------iu02vib3uDmsZBA82REi1e6F
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 11/6/25 2:43 PM, Jan Beulich wrote:
> On 20.10.2025 17:57, Oleksii Kurochko wrote:
>> Changes in V5:
>>   - Add static and __initconst for local variable modes[] in
>>     gstage_mode_detect().
>>   - Change type for gstage_mode from 'unsigned long' to 'unsigned char'.
>>   - Update the comment inisde defintion if modes[] variable in
>>     gstage_mode_detect():
>>     - Add information about Bare mode.
>>     - Drop "a paged virtual-memory scheme described in Section 10.3" as it isn't
>>       relevant here.
>>   - Drop printing of function name when chosen G-stage mode message is printed.
>>   - Drop the call of gstage_mode_detect() from start_xen(). It will be added into
>>     p2m_init() when the latter will be introduced.
> Well, thanks, but ...
>
>>   - Introduce pre_gstage_init().
> ... the same comment that I gave before now applies here: This doesn't look to
> belong directly in start_xen(). In x86'es terms I'd say this is a tiny part of
> paging_init().

Does it only the question of function naming now?

IMO, ideally it would be nice to have it in p2m_init(), but there is no a lot of
sense to detect supported modes each time a domain is constructed. And it is the
reason why I put directly to start_xen().

>
>> --- a/xen/arch/riscv/include/asm/riscv_encoding.h
>> +++ b/xen/arch/riscv/include/asm/riscv_encoding.h
>> @@ -131,13 +131,16 @@
>>   #define HGATP_MODE_SV32X4		_UL(1)
>>   #define HGATP_MODE_SV39X4		_UL(8)
>>   #define HGATP_MODE_SV48X4		_UL(9)
>> +#define HGATP_MODE_SV57X4		_UL(10)
>>   
>>   #define HGATP32_MODE_SHIFT		31
>> +#define HGATP32_MODE_MASK		_UL(0x80000000)
> Please can we avoid redundant (and then not even connected) #define-s? I
> don't see why you would need HGATP32_MODE_SHIFT when you have
> HGATP32_MODE_MASK. Similarly ...
>
>>   #define HGATP32_VMID_SHIFT		22
>>   #define HGATP32_VMID_MASK		_UL(0x1FC00000)
> ... here, while ...
>
>>   #define HGATP32_PPN			_UL(0x003FFFFF)
> ... here the constant isn't even suffixed with _MASK.

I agree that it is enough to have only *_MASK.

I can do a separate cleanup patch (as what mentioned below were already introduced
before) which will drop:
  HGATP32_MODE_SHIFT, HGATP32_VMID_SHIFT, HGATP64_MODE_SHIFT, HGATP64_VMID_SHIFT
and rename:
  HGATP*_PPN to HGATP*_PPN_MASK

Does it make sense?

>
>> --- /dev/null
>> +++ b/xen/arch/riscv/p2m.c
>> @@ -0,0 +1,96 @@
>> +/* SPDX-License-Identifier: GPL-2.0-only */
>> +
>> +#include <xen/init.h>
>> +#include <xen/lib.h>
>> +#include <xen/macros.h>
>> +#include <xen/sections.h>
>> +
>> +#include <asm/csr.h>
>> +#include <asm/flushtlb.h>
>> +#include <asm/riscv_encoding.h>
>> +
>> +unsigned char __ro_after_init gstage_mode;
>> +
>> +static void __init gstage_mode_detect(void)
>> +{
>> +    static const struct {
>> +        unsigned char mode;
>> +        unsigned int paging_levels;
>> +        const char name[8];
>> +    } modes[] __initconst = {
>> +        /*
>> +         * Based on the RISC-V spec:
>> +         *   Bare mode is always supported, regardless of SXLEN.
>> +         *   When SXLEN=32, the only other valid setting for MODE is Sv32.
>> +         *   When SXLEN=64, three paged virtual-memory schemes are defined:
>> +         *   Sv39, Sv48, and Sv57.
>> +         */
>> +#ifdef CONFIG_RISCV_32
>> +        { HGATP_MODE_SV32X4, 2, "Sv32x4" }
>> +#else
>> +        { HGATP_MODE_SV39X4, 3, "Sv39x4" },
>> +        { HGATP_MODE_SV48X4, 4, "Sv48x4" },
>> +        { HGATP_MODE_SV57X4, 5, "Sv57x4" },
>> +#endif
>> +    };
>> +
>> +    unsigned int mode_idx;
>> +
>> +    gstage_mode = HGATP_MODE_OFF;
> Why is this not the variable's initializer?

Good point. It should be the variable's initializer.

>> +    for ( mode_idx = 0; mode_idx < ARRAY_SIZE(modes); mode_idx++ )
>> +    {
>> +        unsigned long mode = modes[mode_idx].mode;
>> +
>> +        csr_write(CSR_HGATP, MASK_INSR(mode, HGATP_MODE_MASK));
>> +
>> +        if ( MASK_EXTR(csr_read(CSR_HGATP), HGATP_MODE_MASK) == mode )
>> +        {
>> +            gstage_mode = mode;
>> +            break;
>> +        }
>> +    }
> I take it that using the first available mode is only transient. To support bigger
> guests, you may need to pick 48x4 or even 57x4 no matter that 39x4 is available.

I considered traversing the|modes[]| array in the opposite order so that the largest
mode would be checked first. However, I decided that 39x4 is sufficiently large and
provides a good balance between the number of page tables and supported address
space, at least for now.

> I wonder whether you wouldn't be better off recording all supported modes right
> away.

What would be the use case for recording and storing all supported modes?
For example, would it be used to indicate which mode is preferable for a guest
domain via the device tree?

Also, I’d like to note that it probably doesn’t make much sense to record all
supported modes. If we traverse the|modes[]| array in the opposite order—checking
|Sv57| first—then, according to the RISC-V specification:
- Implementations that support Sv57 must also support Sv48.
- Implementations that support Sv48 must also support Sv39.
So if Sv57 is supported then lower modes are supported too. (except Sv32 for RV32)

Based on this, it seems reasonable to start checking from Sv57, right?

Thanks.

~ Oleksii

--------------iu02vib3uDmsZBA82REi1e6F
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 11/6/25 2:43 PM, Jan Beulich wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:8b204b21-80fb-408d-972e-8f183eb45dfc@suse.com">
      <pre wrap="" class="moz-quote-pre">On 20.10.2025 17:57, Oleksii Kurochko wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">Changes in V5:
 - Add static and __initconst for local variable modes[] in
   gstage_mode_detect().
 - Change type for gstage_mode from 'unsigned long' to 'unsigned char'.
 - Update the comment inisde defintion if modes[] variable in
   gstage_mode_detect():
   - Add information about Bare mode.
   - Drop "a paged virtual-memory scheme described in Section 10.3" as it isn't
     relevant here.
 - Drop printing of function name when chosen G-stage mode message is printed.
 - Drop the call of gstage_mode_detect() from start_xen(). It will be added into
   p2m_init() when the latter will be introduced.
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Well, thanks, but ...

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre"> - Introduce pre_gstage_init().
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
... the same comment that I gave before now applies here: This doesn't look to
belong directly in start_xen(). In x86'es terms I'd say this is a tiny part of
paging_init().</pre>
    </blockquote>
    <pre>Does it only the question of function naming now?

IMO, ideally it would be nice to have it in p2m_init(), but there is no a lot of
sense to detect supported modes each time a domain is constructed. And it is the
reason why I put directly to start_xen().

</pre>
    <blockquote type="cite"
      cite="mid:8b204b21-80fb-408d-972e-8f183eb45dfc@suse.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">--- a/xen/arch/riscv/include/asm/riscv_encoding.h
+++ b/xen/arch/riscv/include/asm/riscv_encoding.h
@@ -131,13 +131,16 @@
 #define HGATP_MODE_SV32X4		_UL(1)
 #define HGATP_MODE_SV39X4		_UL(8)
 #define HGATP_MODE_SV48X4		_UL(9)
+#define HGATP_MODE_SV57X4		_UL(10)
 
 #define HGATP32_MODE_SHIFT		31
+#define HGATP32_MODE_MASK		_UL(0x80000000)
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Please can we avoid redundant (and then not even connected) #define-s? I
don't see why you would need HGATP32_MODE_SHIFT when you have
HGATP32_MODE_MASK. Similarly ...

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre"> #define HGATP32_VMID_SHIFT		22
 #define HGATP32_VMID_MASK		_UL(0x1FC00000)
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
... here, while ...

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre"> #define HGATP32_PPN			_UL(0x003FFFFF)
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
... here the constant isn't even suffixed with _MASK.</pre>
    </blockquote>
    <pre>I agree that it is enough to have only *_MASK.

I can do a separate cleanup patch (as what mentioned below were already introduced
before) which will drop:
 HGATP32_MODE_SHIFT, HGATP32_VMID_SHIFT, HGATP64_MODE_SHIFT, HGATP64_VMID_SHIFT
and rename:
 HGATP*_PPN to HGATP*_PPN_MASK

Does it make sense?

</pre>
    <blockquote type="cite"
      cite="mid:8b204b21-80fb-408d-972e-8f183eb45dfc@suse.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">--- /dev/null
+++ b/xen/arch/riscv/p2m.c
@@ -0,0 +1,96 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+
+#include &lt;xen/init.h&gt;
+#include &lt;xen/lib.h&gt;
+#include &lt;xen/macros.h&gt;
+#include &lt;xen/sections.h&gt;
+
+#include &lt;asm/csr.h&gt;
+#include &lt;asm/flushtlb.h&gt;
+#include &lt;asm/riscv_encoding.h&gt;
+
+unsigned char __ro_after_init gstage_mode;
+
+static void __init gstage_mode_detect(void)
+{
+    static const struct {
+        unsigned char mode;
+        unsigned int paging_levels;
+        const char name[8];
+    } modes[] __initconst = {
+        /*
+         * Based on the RISC-V spec:
+         *   Bare mode is always supported, regardless of SXLEN.
+         *   When SXLEN=32, the only other valid setting for MODE is Sv32.
+         *   When SXLEN=64, three paged virtual-memory schemes are defined:
+         *   Sv39, Sv48, and Sv57.
+         */
+#ifdef CONFIG_RISCV_32
+        { HGATP_MODE_SV32X4, 2, "Sv32x4" }
+#else
+        { HGATP_MODE_SV39X4, 3, "Sv39x4" },
+        { HGATP_MODE_SV48X4, 4, "Sv48x4" },
+        { HGATP_MODE_SV57X4, 5, "Sv57x4" },
+#endif
+    };
+
+    unsigned int mode_idx;
+
+    gstage_mode = HGATP_MODE_OFF;
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Why is this not the variable's initializer?</pre>
    </blockquote>
    <pre>Good point. It should be the variable's initializer.

</pre>
    <blockquote type="cite"
      cite="mid:8b204b21-80fb-408d-972e-8f183eb45dfc@suse.com">
      <pre wrap="" class="moz-quote-pre">
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+    for ( mode_idx = 0; mode_idx &lt; ARRAY_SIZE(modes); mode_idx++ )
+    {
+        unsigned long mode = modes[mode_idx].mode;
+
+        csr_write(CSR_HGATP, MASK_INSR(mode, HGATP_MODE_MASK));
+
+        if ( MASK_EXTR(csr_read(CSR_HGATP), HGATP_MODE_MASK) == mode )
+        {
+            gstage_mode = mode;
+            break;
+        }
+    }
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
I take it that using the first available mode is only transient. To support bigger
guests, you may need to pick 48x4 or even 57x4 no matter that 39x4 is available.</pre>
    </blockquote>
    <pre>I considered traversing the <code data-start="87" data-end="96">modes[]</code> array in the opposite order so that the largest
mode would be checked first. However, I decided that 39x4 is sufficiently large and
provides a good balance between the number of page tables and supported address
space, at least for now.

</pre>
    <blockquote type="cite"
      cite="mid:8b204b21-80fb-408d-972e-8f183eb45dfc@suse.com">
      <pre wrap="" class="moz-quote-pre">
I wonder whether you wouldn't be better off recording all supported modes right
away.</pre>
    </blockquote>
    <pre data-start="61" data-end="251">What would be the use case for recording and storing all supported modes?
For example, would it be used to indicate which mode is preferable for a guest
domain via the device tree?</pre>
    <pre data-start="253" data-end="473">Also, I’d like to note that it probably doesn’t make much sense to record all
supported modes. If we traverse the <code data-start="367"
    data-end="376">modes[]</code> array in the opposite order—checking
<code data-start="414" data-end="420">Sv57</code> first—then, according to the RISC-V specification:
- Implementations that support Sv57 must also support Sv48.
- Implementations that support Sv48 must also support Sv39.
So if Sv57 is supported then lower modes are supported too. (except Sv32 for RV32)</pre>
    <pre data-start="599" data-end="669" data-is-last-node=""
    data-is-only-node="">Based on this, it seems reasonable to start checking from Sv57, right?

Thanks.

~ Oleksii</pre>
  </body>
</html>

--------------iu02vib3uDmsZBA82REi1e6F--

