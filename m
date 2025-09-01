Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 92DD5B3E520
	for <lists+xen-devel@lfdr.de>; Mon,  1 Sep 2025 15:35:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1104793.1455832 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ut4gO-0002gL-7u; Mon, 01 Sep 2025 13:34:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1104793.1455832; Mon, 01 Sep 2025 13:34:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ut4gO-0002df-4R; Mon, 01 Sep 2025 13:34:52 +0000
Received: by outflank-mailman (input) for mailman id 1104793;
 Mon, 01 Sep 2025 13:34:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gOk3=3M=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1ut4gM-0002dZ-PW
 for xen-devel@lists.xenproject.org; Mon, 01 Sep 2025 13:34:50 +0000
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [2a00:1450:4864:20::62e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6e3c4ff3-8738-11f0-8dd7-1b34d833f44b;
 Mon, 01 Sep 2025 15:34:48 +0200 (CEST)
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-b0411b83aafso250023066b.1
 for <xen-devel@lists.xenproject.org>; Mon, 01 Sep 2025 06:34:48 -0700 (PDT)
Received: from [192.168.1.5] (user-109-243-64-38.play-internet.pl.
 [109.243.64.38]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b0421939da1sm325247266b.27.2025.09.01.06.34.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 Sep 2025 06:34:47 -0700 (PDT)
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
X-Inumbo-ID: 6e3c4ff3-8738-11f0-8dd7-1b34d833f44b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756733688; x=1757338488; darn=lists.xenproject.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AcZq/b2ed7pzoBGIlt8Bibb6w3RcGPDodW5v11XHdWk=;
        b=bLVg5qRe6f9Ev/jdHIQ9Gdw6GS5FKdYkA2MBCvmyp0W8opEjn0TrUghW0ENL+EJh+A
         fOy9BHWWiqxQpOg6WwoD6U0cYf7GCq8hwaMNlQFSMF5HyF2J2vIYxCbDNC+fpRWZniBx
         oqmICEiLUgRFKIRZ0VUyPXzja7pZIflVFNjpHEWGIOi/v6sF1UX0NfNMVs/9F7KiDCmu
         4RHaBBBv1yK+RITc+Yp9t0zpXA9HUZ5/8MsfeOmxr1XttwoMe8YWgXR0QVvb3eqC9PoJ
         uT87aPsEE9G8RGwbW7tr9MtmDQnbTKV92qrbGSFkSGC7Mokjp8i/mTSR89JGQYmP0cFw
         3gXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756733688; x=1757338488;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=AcZq/b2ed7pzoBGIlt8Bibb6w3RcGPDodW5v11XHdWk=;
        b=muSo17o4piZ4cN7Gu6CqZkoxDrWV6efBBlOaC0JDAK9JxhhGoft8SwAnn8BjbSS23G
         1zi+mPAg9fVKiOYzxPk9oM3fTz4RI2AdTm6pDVK8JsXfspfrKDvz4O1M7fUlVdfDP+PV
         5yxzVNf6ZP4aLfaNYMVZAZVcXXD2UuvadEiTlseN/WvSJUcycDo5LBLEam9BS+JxGinC
         TqCz14Lm4FDjGC1iZ6xX8dchzi5eGmN2ujcvkNPn3ForcEkAlo5J3nSNjDXSrJlsxnzE
         QpELqURXAqamHshHlArprSRTXBvMJh3T2ApHokskxwfPvfKGldX0SrYfgXGBBkyE7qHk
         HvkA==
X-Forwarded-Encrypted: i=1; AJvYcCVWZ5Wx6RtnmNYJ8pj3UToxv2JK0lg+GXozowKXbdkBkEG6rElANHYfWEyMneXYwWAjru6K6ix6GeM=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyjPFwX8AKVkL8Ut0LvhEe9cVv79PCy9ix/1BHhB7cPUu8ojK+U
	VYTJnv7XoBYX68PlUeB6TgofDRnQvoLF0onFaciP7QOLfCUPOM63kDnU
X-Gm-Gg: ASbGncvhxDKPvg5ZjJK2F8Sci4gUIqSrUR1judCGWN2kltbpR5sYHYLyGHV68Mgy7uX
	ARGfGrr62D1RqPXXC8BYNsTbaF/smnF0BXfiXPJm/mhXugec+++VVWZ1sVbOuW6JzvZQYUh+HUv
	fxecVS3b0QaCOmMqq/O1AdOlEl3Ucyx53TXWQffISql5JZZP7YsAS43TJBa9zNMxIz2momFiBGZ
	udipinjj8NIfifl+Q9YTZq/TWyl0frUJjJ22oCAPhZNA1TbN+Z+qXUPao2z9HLQy+Jus6vH4x+z
	iq29vU2x6m2CvZBtFa97GG06Hc5psOlPSORu+Aev7NGmC0kcBpPeQc3fQFo7aSKfeTLuhB4wfDO
	nxMmTBFoZxfrjTHOg6GXx1SynPUoz6DAvgd76wQREk5nOhNZs/JYrS9Hu0Ukg7bdZHG07lZI=
X-Google-Smtp-Source: AGHT+IGZqvtTDV14xsHPjWFEFz8V7RnAOGKikzXl84UW5RCrNGk3M7agEjYEI0TZzmtSw1XqCN5DHg==
X-Received: by 2002:a17:906:f59d:b0:afe:ae99:9d23 with SMTP id a640c23a62f3a-b01ec52d58dmr727181066b.61.1756733687631;
        Mon, 01 Sep 2025 06:34:47 -0700 (PDT)
Content-Type: multipart/alternative;
 boundary="------------cySU0ii2DAaFMPoTVcCZBC9V"
Message-ID: <394c7670-7106-4329-a8ac-d31057c8f2a2@gmail.com>
Date: Mon, 1 Sep 2025 15:34:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RESEND PATCH v2 1/3] xen: Define xen_domain_handle_t encoding
 and formatting
To: Teddy Astie <teddy.astie@vates.tech>, xen-devel@lists.xenproject.org
Cc: Community Manager <community.manager@xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>
References: <cover.1756460430.git.teddy.astie@vates.tech>
 <a12f705dae18ae2b87c9e21027d14c4e60bff146.1756460430.git.teddy.astie@vates.tech>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <a12f705dae18ae2b87c9e21027d14c4e60bff146.1756460430.git.teddy.astie@vates.tech>

This is a multi-part message in MIME format.
--------------cySU0ii2DAaFMPoTVcCZBC9V
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 8/29/25 11:58 AM, Teddy Astie wrote:
> xen_domain_handle_t is defined as a opaque 16-bytes blob, but is
> commonly used by toolstack and guest as a big-endian encoded and
> formatted UUID (alike RFC 9562).
>
> Clarify the definition of the type to ensure the guest and toolstack
> interprets this value correctly in a way consistent with existing users
> (at least with XAPI, xl, libvirt, hvmloader and Linux).
>
> Fixes: 30ce2a9295a5 ("Store an opaque handle (tools uuid) in the domain structure")
> Suggested-by: Andrew Cooper<andrew.cooper3@citrix.com>
> Signed-off-by: Teddy Astie<teddy.astie@vates.tech>

LGTM: Acked-by: Oleksii Kurochko<oleksii.kurochko@gmail.com>

Thanks.

~ Oleksii

> ---
> v2:
>   - introduced
> ---
>   CHANGELOG.md             | 1 +
>   xen/include/public/xen.h | 7 +++++++
>   2 files changed, 8 insertions(+)
>
> diff --git a/CHANGELOG.md b/CHANGELOG.md
> index cd34ea87b8..8c4435c181 100644
> --- a/CHANGELOG.md
> +++ b/CHANGELOG.md
> @@ -11,6 +11,7 @@ The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
>      - For x86, GCC 5.1 and Binutils 2.25, or Clang/LLVM 11
>      - For ARM32 and ARM64, GCC 5.1 and Binutils 2.25
>    - Linux based device model stubdomains are now fully supported.
> + - Clarify guest UUIDs as being big-endian encoded.
>   
>    - On x86:
>      - Restrict the cache flushing done as a result of guest physical memory map
> diff --git a/xen/include/public/xen.h b/xen/include/public/xen.h
> index 82b9c05a76..a219ef870f 100644
> --- a/xen/include/public/xen.h
> +++ b/xen/include/public/xen.h
> @@ -973,6 +973,13 @@ typedef struct dom0_vga_console_info {
>   #define xen_vga_console_info dom0_vga_console_info
>   #define xen_vga_console_info_t dom0_vga_console_info_t
>   
> +/*
> + * The domain handle is chosen by the toolstack, and intended to hold a UUID
> + * conforming to RFC 9562 (i.e. big endian).
> + *
> + * Certain cases (e.g. SMBios) transform it to a Microsoft GUID (little
> + * endian) for presentation to the guest.
> + */
>   typedef uint8_t xen_domain_handle_t[16];
>   
>   __DEFINE_XEN_GUEST_HANDLE(uint8,  uint8_t);
--------------cySU0ii2DAaFMPoTVcCZBC9V
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
    <div class="moz-cite-prefix">On 8/29/25 11:58 AM, Teddy Astie wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:a12f705dae18ae2b87c9e21027d14c4e60bff146.1756460430.git.teddy.astie@vates.tech">
      <pre wrap="" class="moz-quote-pre">xen_domain_handle_t is defined as a opaque 16-bytes blob, but is
commonly used by toolstack and guest as a big-endian encoded and
formatted UUID (alike RFC 9562).

Clarify the definition of the type to ensure the guest and toolstack
interprets this value correctly in a way consistent with existing users
(at least with XAPI, xl, libvirt, hvmloader and Linux).

Fixes: 30ce2a9295a5 ("Store an opaque handle (tools uuid) in the domain structure")
Suggested-by: Andrew Cooper <a class="moz-txt-link-rfc2396E" href="mailto:andrew.cooper3@citrix.com">&lt;andrew.cooper3@citrix.com&gt;</a>
Signed-off-by: Teddy Astie <a class="moz-txt-link-rfc2396E" href="mailto:teddy.astie@vates.tech">&lt;teddy.astie@vates.tech&gt;</a></pre>
    </blockquote>
    <pre>LGTM: Acked-by: Oleksii Kurochko <a class="moz-txt-link-rfc2396E" href="mailto:oleksii.kurochko@gmail.com">&lt;oleksii.kurochko@gmail.com&gt;</a>

Thanks.

~ Oleksii
</pre>
    <blockquote type="cite"
cite="mid:a12f705dae18ae2b87c9e21027d14c4e60bff146.1756460430.git.teddy.astie@vates.tech">
      <pre wrap="" class="moz-quote-pre">
---
v2:
 - introduced
---
 CHANGELOG.md             | 1 +
 xen/include/public/xen.h | 7 +++++++
 2 files changed, 8 insertions(+)

diff --git a/CHANGELOG.md b/CHANGELOG.md
index cd34ea87b8..8c4435c181 100644
--- a/CHANGELOG.md
+++ b/CHANGELOG.md
@@ -11,6 +11,7 @@ The format is based on [Keep a Changelog](<a class="moz-txt-link-freetext" href="https://keepachangelog.com/en/1.0.0/">https://keepachangelog.com/en/1.0.0/</a>)
    - For x86, GCC 5.1 and Binutils 2.25, or Clang/LLVM 11
    - For ARM32 and ARM64, GCC 5.1 and Binutils 2.25
  - Linux based device model stubdomains are now fully supported.
+ - Clarify guest UUIDs as being big-endian encoded.
 
  - On x86:
    - Restrict the cache flushing done as a result of guest physical memory map
diff --git a/xen/include/public/xen.h b/xen/include/public/xen.h
index 82b9c05a76..a219ef870f 100644
--- a/xen/include/public/xen.h
+++ b/xen/include/public/xen.h
@@ -973,6 +973,13 @@ typedef struct dom0_vga_console_info {
 #define xen_vga_console_info dom0_vga_console_info
 #define xen_vga_console_info_t dom0_vga_console_info_t
 
+/*
+ * The domain handle is chosen by the toolstack, and intended to hold a UUID
+ * conforming to RFC 9562 (i.e. big endian).
+ *
+ * Certain cases (e.g. SMBios) transform it to a Microsoft GUID (little
+ * endian) for presentation to the guest.
+ */
 typedef uint8_t xen_domain_handle_t[16];
 
 __DEFINE_XEN_GUEST_HANDLE(uint8,  uint8_t);
</pre>
    </blockquote>
  </body>
</html>

--------------cySU0ii2DAaFMPoTVcCZBC9V--

