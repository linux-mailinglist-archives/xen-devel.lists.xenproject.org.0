Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C12D99F78B8
	for <lists+xen-devel@lfdr.de>; Thu, 19 Dec 2024 10:45:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.861016.1273018 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tOD5c-0008J9-18; Thu, 19 Dec 2024 09:45:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 861016.1273018; Thu, 19 Dec 2024 09:45:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tOD5b-0008Gh-UD; Thu, 19 Dec 2024 09:45:03 +0000
Received: by outflank-mailman (input) for mailman id 861016;
 Thu, 19 Dec 2024 09:45:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fj/B=TM=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1tOD5b-0008Gb-Ax
 for xen-devel@lists.xenproject.org; Thu, 19 Dec 2024 09:45:03 +0000
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [2a00:1450:4864:20::12c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ea424fbf-bded-11ef-99a3-01e77a169b0f;
 Thu, 19 Dec 2024 10:45:00 +0100 (CET)
Received: by mail-lf1-x12c.google.com with SMTP id
 2adb3069b0e04-540218726d5so461898e87.2
 for <xen-devel@lists.xenproject.org>; Thu, 19 Dec 2024 01:45:01 -0800 (PST)
Received: from [192.168.219.191] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-542238137e5sm121452e87.134.2024.12.19.01.44.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 Dec 2024 01:44:59 -0800 (PST)
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
X-Inumbo-ID: ea424fbf-bded-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734601500; x=1735206300; darn=lists.xenproject.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kuMsIvNropcp2fIWn9jDG/5G2IcB2qoWam1saEM0oPk=;
        b=GJjMLpuacuV7/1YlS6A2Fpw6gdTiSwOAvXISksnND7YmJgYPzPaHlWP+uJvYtc8LzP
         H4pfnbbx6YQuVOmDsxAUdERxAEJ1KRr9gNrD2cU13dOchXNgZTYy1EwCKkTGd+R2tsl0
         mkPRPB44LZaDzPx5wXXxAY7jzoSlfgsM4juoAiUVfzwTlLp5uVRNIDfgGPLP5/vZsljx
         NgXh4p0IttKx+ROnjYwPQ0WGHkBJsbSSr/QLPqc4MDkabR6gAeAqCb7t9VQ9196T2OJ4
         cdxIbKapx6ESUtu9iM7m3622S2G09FzsfFNx4tq+jDucNnw9UD/ImBUPmGHhWVNp8IYZ
         rhzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734601500; x=1735206300;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=kuMsIvNropcp2fIWn9jDG/5G2IcB2qoWam1saEM0oPk=;
        b=M4FVmkwfDMro/DK/FG6Oxke1w2YjGKQebkI74DxzYQZWv+dDz8Xa5p4bdGUZTw9Xp2
         jUXjiEs5uX3oiVy62qutpeyZcMiYqquLFZlyfi1YyFQSIzpghnn6LpH0kiBFmTDTgio2
         jtBj4yW0JALDRT0jBCdAPpY2xKDmrD+K4vW5wi00VWxISphZdScLjeCMlSyYf71yNDeZ
         uQZ5ZNQrmuTztIZ7rUJ8t++cracJFs+fviPolUJ8GfEys7BwBblQxVcHa1A2eTzocBvJ
         Y9VL4BanAG8n99MWwiJdw+kztC/kkRIO33XvpX08hpBujR5oewsOj8Oz3Rple96CaZ2/
         BWkA==
X-Forwarded-Encrypted: i=1; AJvYcCUCu7nc7u5eydq4aJRJ8HI9kKitbPNLnlDNc65j9gtKAq+BuAJ76Ntq21GcZ9vuKNzhN5jIDJccCIk=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxfspSmEaEmshZ8mNu8r9n63bhBF4zz9K7CXka7r0v23NWTpdNH
	q0gPT9BFfSeS53CDNvjSIxEoLU0L6ZHfkYvhL1PPYT9fninE0osY
X-Gm-Gg: ASbGncssB5CgqgAOmULenaIIE5NpChv36jmsjAFiMPffWm4UIRStA5aIfYRK0GXd3hh
	31hgrFNf8egZc3SyEFSL3LcCV9tcu4EWhUohHCClXzQT7TRL/71zufhuUvLjLdS9+pMdSpzltZL
	6OI8yXhTPS7vezIJTVMIxkwH50c7y4JkEsIukidYkd/no9MpCNfrTkLWOYetNa6e3Fd5UGQdkNF
	KolQbiozxYp9L71xmqljXZdXYLk0cmX0iMcsLarcgkfN0+znfsnsPSCzGkZmz5y1x/5Jg==
X-Google-Smtp-Source: AGHT+IHb2igBfeR9uahGL3/F9kdoQBpsUt7W9QDauB1Tp6QbH6C1e9/YseR24+AfOBUjwMiKyW40Lg==
X-Received: by 2002:a05:6512:3087:b0:540:2ef4:9cf0 with SMTP id 2adb3069b0e04-541ed8ec076mr2465803e87.18.1734601500113;
        Thu, 19 Dec 2024 01:45:00 -0800 (PST)
Content-Type: multipart/alternative;
 boundary="------------CVU5VXmeRdROzCYou6N0UNGN"
Message-ID: <5ce22b0d-ae01-404a-8bfe-d4891dd94555@gmail.com>
Date: Thu, 19 Dec 2024 10:44:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] tools/libxg: Don't gunzip the guests initrd
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Juergen Gross <jgross@suse.com>, Michal Orzel <michal.orzel@amd.com>,
 Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <20240904123121.3837140-1-andrew.cooper3@citrix.com>
 <20241218185453.367465-1-andrew.cooper3@citrix.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <20241218185453.367465-1-andrew.cooper3@citrix.com>

This is a multi-part message in MIME format.
--------------CVU5VXmeRdROzCYou6N0UNGN
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 12/18/24 7:54 PM, Andrew Cooper wrote:
> Decompressing the kernel is necessary to inspect the ELF notes, but the
> dombuilder will gunzip() secondary modules too.  Specifically gunzip(), no
> other decompression algorithms.
>
> This may have been necessary in the dim and distant past, but it is broken
> today.  Linux specifically supports concatenating CPIO fragments of differing
> compressions, and any attempt to interpret it with a single algorithm may
> corrupt later parts.
>
> This was an unexpected discovery while trying to test Xen's gunzip()
> logic (Xen as a PVH guest, with a gzipped XTF kernel as dom0).
>
> Intepreting secondary modules *should* be left as an exersize to the guest.
> This reduces work done in dom0.
>
> This is not expected to cause a practical different to guests these days.
>
> Signed-off-by: Andrew Cooper<andrew.cooper3@citrix.com>
> ---
> CC: Anthony PERARD<anthony.perard@vates.tech>
> CC: Juergen Gross<jgross@suse.com>
> CC: Anthony PERARD<anthony.perard@vates.tech>
> CC: Michal Orzel<michal.orzel@amd.com>
> CC: Jan Beulich<jbeulich@suse.com>
> CC: Julien Grall<julien@xen.org>
> CC: Roger Pau Monné<roger.pau@citrix.com>
> CC: Stefano Stabellini<sstabellini@kernel.org>
> CC: Oleksii Kurochko<oleksii.kurochko@gmail.com>
>
> v2:
>   * Rewrite the commit message.
>
> If this does cause a problem, we can reintroduce it, but behind a config
> option because it needs to not be on by default.
>
> Linux's habit of prepending an uncompressed CPIO containing microcode is
> likely to cause this logic to be skipped anyway.
> ---
>   CHANGELOG.md                   |  2 ++

Acked-By: Oleksii Kurochko <oleksii.kurochko@gmail.com>

Thanks.

~ Oleksii


>   tools/libs/guest/xg_dom_core.c | 40 ++++++----------------------------
>   2 files changed, 9 insertions(+), 33 deletions(-)
>
> diff --git a/CHANGELOG.md b/CHANGELOG.md
> index 15f681459f22..61510e6a11c0 100644
> --- a/CHANGELOG.md
> +++ b/CHANGELOG.md
> @@ -8,6 +8,8 @@ The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
>   
>   ### Changed
>    - Fixed blkif protocol specification for sector sizes different than 512b.
> + - The dombuilder in libxenguest no longer un-gzips secondary modules, instead
> +   leaving this to the guest kernel to do in guest context.
>    - On x86:
>      - Prefer ACPI reboot over UEFI ResetSystem() run time service call.
>      - Switched the xAPIC flat driver to use physical destination mode for external
> diff --git a/tools/libs/guest/xg_dom_core.c b/tools/libs/guest/xg_dom_core.c
> index f5521d528be1..595b0a667c03 100644
> --- a/tools/libs/guest/xg_dom_core.c
> +++ b/tools/libs/guest/xg_dom_core.c
> @@ -980,37 +980,24 @@ int xc_dom_mem_init(struct xc_dom_image *dom, unsigned int mem_mb)
>   
>   static int xc_dom_build_module(struct xc_dom_image *dom, unsigned int mod)
>   {
> -    size_t unziplen, modulelen;
> +    size_t modulelen;
>       void *modulemap;
>       char name[10];
>   
> -    if ( !dom->modules[mod].seg.vstart )
> -        unziplen = xc_dom_check_gzip(dom->xch,
> -                                     dom->modules[mod].blob, dom->modules[mod].size);
> -    else
> -        unziplen = 0;
> +    modulelen = dom->modules[mod].size;
>   
> -    modulelen = max(unziplen, dom->modules[mod].size);
> -    if ( dom->max_module_size )
> +    if ( dom->max_module_size && modulelen > dom->max_module_size )
>       {
> -        if ( unziplen && modulelen > dom->max_module_size )
> -        {
> -            modulelen = min(unziplen, dom->modules[mod].size);
> -            if ( unziplen > modulelen )
> -                unziplen = 0;
> -        }
> -        if ( modulelen > dom->max_module_size )
> -        {
> -            xc_dom_panic(dom->xch, XC_INVALID_KERNEL,
> -                         "module %u image too large", mod);
> -            goto err;
> -        }
> +        xc_dom_panic(dom->xch, XC_INVALID_KERNEL,
> +                     "module %u image too large", mod);
> +        goto err;
>       }
>   
>       snprintf(name, sizeof(name), "module%u", mod);
>       if ( xc_dom_alloc_segment(dom, &dom->modules[mod].seg, name,
>                                 dom->modules[mod].seg.vstart, modulelen) != 0 )
>           goto err;
> +
>       modulemap = xc_dom_seg_to_ptr(dom, &dom->modules[mod].seg);
>       if ( modulemap == NULL )
>       {
> @@ -1018,21 +1005,8 @@ static int xc_dom_build_module(struct xc_dom_image *dom, unsigned int mod)
>                     __FUNCTION__, mod);
>           goto err;
>       }
> -    if ( unziplen )
> -    {
> -        if ( xc_dom_do_gunzip(dom->xch, dom->modules[mod].blob, dom->modules[mod].size,
> -                              modulemap, unziplen) != -1 )
> -            return 0;
> -        if ( dom->modules[mod].size > modulelen )
> -            goto err;
> -    }
>   
> -    /* Fall back to handing over the raw blob. */
>       memcpy(modulemap, dom->modules[mod].blob, dom->modules[mod].size);
> -    /* If an unzip attempt was made, the buffer may no longer be all zero. */
> -    if ( unziplen > dom->modules[mod].size )
> -        memset(modulemap + dom->modules[mod].size, 0,
> -               unziplen - dom->modules[mod].size);
>   
>       return 0;
>   
--------------CVU5VXmeRdROzCYou6N0UNGN
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
    <div class="moz-cite-prefix">On 12/18/24 7:54 PM, Andrew Cooper
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:20241218185453.367465-1-andrew.cooper3@citrix.com">
      <pre wrap="" class="moz-quote-pre">Decompressing the kernel is necessary to inspect the ELF notes, but the
dombuilder will gunzip() secondary modules too.  Specifically gunzip(), no
other decompression algorithms.

This may have been necessary in the dim and distant past, but it is broken
today.  Linux specifically supports concatenating CPIO fragments of differing
compressions, and any attempt to interpret it with a single algorithm may
corrupt later parts.

This was an unexpected discovery while trying to test Xen's gunzip()
logic (Xen as a PVH guest, with a gzipped XTF kernel as dom0).

Intepreting secondary modules *should* be left as an exersize to the guest.
This reduces work done in dom0.

This is not expected to cause a practical different to guests these days.

Signed-off-by: Andrew Cooper <a class="moz-txt-link-rfc2396E" href="mailto:andrew.cooper3@citrix.com">&lt;andrew.cooper3@citrix.com&gt;</a>
---
CC: Anthony PERARD <a class="moz-txt-link-rfc2396E" href="mailto:anthony.perard@vates.tech">&lt;anthony.perard@vates.tech&gt;</a>
CC: Juergen Gross <a class="moz-txt-link-rfc2396E" href="mailto:jgross@suse.com">&lt;jgross@suse.com&gt;</a>
CC: Anthony PERARD <a class="moz-txt-link-rfc2396E" href="mailto:anthony.perard@vates.tech">&lt;anthony.perard@vates.tech&gt;</a>
CC: Michal Orzel <a class="moz-txt-link-rfc2396E" href="mailto:michal.orzel@amd.com">&lt;michal.orzel@amd.com&gt;</a>
CC: Jan Beulich <a class="moz-txt-link-rfc2396E" href="mailto:jbeulich@suse.com">&lt;jbeulich@suse.com&gt;</a>
CC: Julien Grall <a class="moz-txt-link-rfc2396E" href="mailto:julien@xen.org">&lt;julien@xen.org&gt;</a>
CC: Roger Pau Monné <a class="moz-txt-link-rfc2396E" href="mailto:roger.pau@citrix.com">&lt;roger.pau@citrix.com&gt;</a>
CC: Stefano Stabellini <a class="moz-txt-link-rfc2396E" href="mailto:sstabellini@kernel.org">&lt;sstabellini@kernel.org&gt;</a>
CC: Oleksii Kurochko <a class="moz-txt-link-rfc2396E" href="mailto:oleksii.kurochko@gmail.com">&lt;oleksii.kurochko@gmail.com&gt;</a>

v2:
 * Rewrite the commit message.

If this does cause a problem, we can reintroduce it, but behind a config
option because it needs to not be on by default.

Linux's habit of prepending an uncompressed CPIO containing microcode is
likely to cause this logic to be skipped anyway.
---
 CHANGELOG.md                   |  2 ++</pre>
    </blockquote>
    <p>Acked-By: <span style="white-space: pre-wrap">Oleksii Kurochko <a class="moz-txt-link-rfc2396E" href="mailto:oleksii.kurochko@gmail.com">&lt;oleksii.kurochko@gmail.com&gt;</a></span></p>
    <p><span style="white-space: pre-wrap">Thanks.</span></p>
    <p><span style="white-space: pre-wrap">~ Oleksii
</span></p>
    <br>
    <blockquote type="cite"
      cite="mid:20241218185453.367465-1-andrew.cooper3@citrix.com">
      <pre wrap="" class="moz-quote-pre">
 tools/libs/guest/xg_dom_core.c | 40 ++++++----------------------------
 2 files changed, 9 insertions(+), 33 deletions(-)

diff --git a/CHANGELOG.md b/CHANGELOG.md
index 15f681459f22..61510e6a11c0 100644
--- a/CHANGELOG.md
+++ b/CHANGELOG.md
@@ -8,6 +8,8 @@ The format is based on [Keep a Changelog](<a class="moz-txt-link-freetext" href="https://keepachangelog.com/en/1.0.0/">https://keepachangelog.com/en/1.0.0/</a>)
 
 ### Changed
  - Fixed blkif protocol specification for sector sizes different than 512b.
+ - The dombuilder in libxenguest no longer un-gzips secondary modules, instead
+   leaving this to the guest kernel to do in guest context.
  - On x86:
    - Prefer ACPI reboot over UEFI ResetSystem() run time service call.
    - Switched the xAPIC flat driver to use physical destination mode for external
diff --git a/tools/libs/guest/xg_dom_core.c b/tools/libs/guest/xg_dom_core.c
index f5521d528be1..595b0a667c03 100644
--- a/tools/libs/guest/xg_dom_core.c
+++ b/tools/libs/guest/xg_dom_core.c
@@ -980,37 +980,24 @@ int xc_dom_mem_init(struct xc_dom_image *dom, unsigned int mem_mb)
 
 static int xc_dom_build_module(struct xc_dom_image *dom, unsigned int mod)
 {
-    size_t unziplen, modulelen;
+    size_t modulelen;
     void *modulemap;
     char name[10];
 
-    if ( !dom-&gt;modules[mod].seg.vstart )
-        unziplen = xc_dom_check_gzip(dom-&gt;xch,
-                                     dom-&gt;modules[mod].blob, dom-&gt;modules[mod].size);
-    else
-        unziplen = 0;
+    modulelen = dom-&gt;modules[mod].size;
 
-    modulelen = max(unziplen, dom-&gt;modules[mod].size);
-    if ( dom-&gt;max_module_size )
+    if ( dom-&gt;max_module_size &amp;&amp; modulelen &gt; dom-&gt;max_module_size )
     {
-        if ( unziplen &amp;&amp; modulelen &gt; dom-&gt;max_module_size )
-        {
-            modulelen = min(unziplen, dom-&gt;modules[mod].size);
-            if ( unziplen &gt; modulelen )
-                unziplen = 0;
-        }
-        if ( modulelen &gt; dom-&gt;max_module_size )
-        {
-            xc_dom_panic(dom-&gt;xch, XC_INVALID_KERNEL,
-                         "module %u image too large", mod);
-            goto err;
-        }
+        xc_dom_panic(dom-&gt;xch, XC_INVALID_KERNEL,
+                     "module %u image too large", mod);
+        goto err;
     }
 
     snprintf(name, sizeof(name), "module%u", mod);
     if ( xc_dom_alloc_segment(dom, &amp;dom-&gt;modules[mod].seg, name,
                               dom-&gt;modules[mod].seg.vstart, modulelen) != 0 )
         goto err;
+
     modulemap = xc_dom_seg_to_ptr(dom, &amp;dom-&gt;modules[mod].seg);
     if ( modulemap == NULL )
     {
@@ -1018,21 +1005,8 @@ static int xc_dom_build_module(struct xc_dom_image *dom, unsigned int mod)
                   __FUNCTION__, mod);
         goto err;
     }
-    if ( unziplen )
-    {
-        if ( xc_dom_do_gunzip(dom-&gt;xch, dom-&gt;modules[mod].blob, dom-&gt;modules[mod].size,
-                              modulemap, unziplen) != -1 )
-            return 0;
-        if ( dom-&gt;modules[mod].size &gt; modulelen )
-            goto err;
-    }
 
-    /* Fall back to handing over the raw blob. */
     memcpy(modulemap, dom-&gt;modules[mod].blob, dom-&gt;modules[mod].size);
-    /* If an unzip attempt was made, the buffer may no longer be all zero. */
-    if ( unziplen &gt; dom-&gt;modules[mod].size )
-        memset(modulemap + dom-&gt;modules[mod].size, 0,
-               unziplen - dom-&gt;modules[mod].size);
 
     return 0;
 
</pre>
    </blockquote>
  </body>
</html>

--------------CVU5VXmeRdROzCYou6N0UNGN--

