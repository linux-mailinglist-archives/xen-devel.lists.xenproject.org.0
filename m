Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7798EADC2DE
	for <lists+xen-devel@lfdr.de>; Tue, 17 Jun 2025 09:09:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1017765.1394753 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uRQRh-0003p5-Ns; Tue, 17 Jun 2025 07:09:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1017765.1394753; Tue, 17 Jun 2025 07:09:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uRQRh-0003nE-LC; Tue, 17 Jun 2025 07:09:25 +0000
Received: by outflank-mailman (input) for mailman id 1017765;
 Tue, 17 Jun 2025 07:09:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Qu13=ZA=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1uRQRf-0003mM-UH
 for xen-devel@lists.xenproject.org; Tue, 17 Jun 2025 07:09:24 +0000
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [2a00:1450:4864:20::531])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fe03ae6b-4b49-11f0-b894-0df219b8e170;
 Tue, 17 Jun 2025 09:09:21 +0200 (CEST)
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-6097b404f58so2031422a12.3
 for <xen-devel@lists.xenproject.org>; Tue, 17 Jun 2025 00:09:21 -0700 (PDT)
Received: from [192.168.1.5] (user-109-243-64-38.play-internet.pl.
 [109.243.64.38]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-608b4adea28sm7349891a12.69.2025.06.17.00.09.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Jun 2025 00:09:20 -0700 (PDT)
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
X-Inumbo-ID: fe03ae6b-4b49-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750144161; x=1750748961; darn=lists.xenproject.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bEeP4aV8ba20MLCuov8VPQ/W6UufLD63nz1kwE8kDM8=;
        b=UrdYiyNN8x6PJfw6pWtVTEAanH14tEC+oYRJv31aOZY5plXikbY1BakTKx6z00xlYg
         JaTc1PGHT6zhLNrOeHx7jx5pYhs5CWGPK4cCKjjPtGpj2KgtcgnFv8YXrnRrREU2rR5s
         tRanvR2myXDd/BWmBiYeL4HBWkNeb7Ymr9mdKen2K20cBlyBfJG/8xnZggITlNPzvuj1
         BGZFkDkyEz7JshaGgSXCZM9lnMHJalweAPczZP6qg2JUdKb4JkA0zVf2UptbwC4MZPAK
         7mNZWYk3TnQyP74FSzKho3I7XN4IikShU98lg9Y4k8sR0ddZoiWPYY0rPn6vIDoZsVQQ
         RyDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750144161; x=1750748961;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=bEeP4aV8ba20MLCuov8VPQ/W6UufLD63nz1kwE8kDM8=;
        b=P9uXj+uM0hQgUqn2wYffNYrO90Hdzn5ZNOHW9ECCGzpslmup1y/1mg4ffhnblxUh1u
         oDKxBEdzD++KmRtjJMdq2QQTGyVs4jxq7fieBUbPXFu4w/HLEDk7L8mGuCP+fL2Zfy1c
         6H/6DmBHKp1xww0Onm1KuYO1MDQvqj2FErqP41lMYYjihEWU2p+VktfvVNrrqMFvPg65
         smEY/HIb2Oddc5oDGTk5Sn903RBVj2sdqdY7zQCD0AAuIjKZtH0YddDsy78dqzLYkkT9
         6I+DxPIwHLspHhZb1Sqm1/37c+8YW6CAr8cCP6H1r4KkcwKSNpQf4kzXiXwwBFssOpZd
         ADHg==
X-Forwarded-Encrypted: i=1; AJvYcCVTcdDOdRb04RNI7bpI8bsQLhZ1yRLyKScxKbbhQ8jr3YU0wojLxWwtYinAB+KgTosox2qJ/uSjA+c=@lists.xenproject.org
X-Gm-Message-State: AOJu0YySFJPHAPhZzVL6ykeXhw0E+HA9G/yVyp7/CCxOD8zantS/iYzr
	7jP5NVdrL9N6OR4OhgeKFHaYUcMdiJrPmT5ebcXw6y8bDxsPOjwWuJtG
X-Gm-Gg: ASbGncvHCCFtg175ClSdmoKiCdeLpx76wSXqvmhSj8L/opC9PKPGXopwlcj6MNfKuCA
	DVOBVLNpGeIBysdKC1DVk7y7GOJPT546aV7iHbAPsawWspvFbjdU6RhsuDw6D0kARyVAre7HsGO
	T40j6x1H05iCQstwJ1d0/6l4lqCxn7rEM6aVsjnQktECpKQY3n0cMKIASitWNUQOINpX+9owJSO
	2wOmBCPmA1K6VVTKJI54lRmskWzHp+bjwVlKODFBwI9mX/9eh4blEuJc9Cw5Y+AYtdSKJBNbbpU
	nUuNaqedozNkGkhiRuJQom8+orFzFVKv3BIaHZMI3uk6JeWzo2icIfxQIiwY4MLt/BtzXcbpzAh
	T/28BaTMntj9wVARFp2OdAtRLf1Yod6g9SBPq1cF1agceHg==
X-Google-Smtp-Source: AGHT+IFf9Lk4JFAOLQ9bBRkot0eXijwQ7ZtO0Uo9kGqH6jEbcELVSX8PwjSuaL3Ew85HiYtbHDtRvA==
X-Received: by 2002:a05:6402:26c7:b0:608:47ee:dc4 with SMTP id 4fb4d7f45d1cf-608d09cf155mr9933526a12.23.1750144160711;
        Tue, 17 Jun 2025 00:09:20 -0700 (PDT)
Content-Type: multipart/alternative;
 boundary="------------B0Qy7QKMeOBJiRuzXBIFI7sN"
Message-ID: <313996d5-8801-4aed-92f8-e96d57dd9429@gmail.com>
Date: Tue, 17 Jun 2025 09:09:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 8/8] pdx: introduce a command line option for offset
 compression
To: Roger Pau Monne <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
Cc: Community Manager <community.manager@xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
References: <20250611171636.5674-1-roger.pau@citrix.com>
 <20250611171636.5674-9-roger.pau@citrix.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <20250611171636.5674-9-roger.pau@citrix.com>

This is a multi-part message in MIME format.
--------------B0Qy7QKMeOBJiRuzXBIFI7sN
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 6/11/25 7:16 PM, Roger Pau Monne wrote:
> Allow controlling whether to attempt PDX compression, and which algorithm
> to use to calculate the coefficients.  Document the option and also add a
> CHANGELOG entry for the newly added feature.
>
> Note the work has been originally done to cope with the new Intel
> Sapphire/Granite Rapids, however the compression is not explicitly tied to
> Intel or x86, and hence could be helpful on other architectures.
>
> Signed-off-by: Roger Pau Monné<roger.pau@citrix.com>
> ---
>   CHANGELOG.md                      |  3 +++
>   docs/misc/xen-command-line.pandoc | 22 ++++++++++++++++++
>   xen/common/pdx.c                  | 38 +++++++++++++++++++++++++++----
>   3 files changed, 59 insertions(+), 4 deletions(-)

LGTM: Reviewed-by: Oleksii Kurochko<oleksii.kurochko@gmail.com>

Thanks.

~ Oleksii

>
> diff --git a/CHANGELOG.md b/CHANGELOG.md
> index 23215a8cc1e6..48327f03078f 100644
> --- a/CHANGELOG.md
> +++ b/CHANGELOG.md
> @@ -20,6 +20,9 @@ The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
>        table or foreign memory.
>   
>   ### Added
> + - Introduce new PDX compression algorithm to cope with Intel Sapphire and
> +   Granite Rapids having sparse memory maps.
> +
>    - On x86:
>      - Option to attempt to fixup p2m page-faults on PVH dom0.
>      - Resizable BARs is supported for PVH dom0.
> diff --git a/docs/misc/xen-command-line.pandoc b/docs/misc/xen-command-line.pandoc
> index b0eadd2c5d58..06819576a06b 100644
> --- a/docs/misc/xen-command-line.pandoc
> +++ b/docs/misc/xen-command-line.pandoc
> @@ -2072,6 +2072,28 @@ for all of them (`true`), only for those subject to XPTI (`xpti`) or for
>   those not subject to XPTI (`no-xpti`). The feature is used only in case
>   INVPCID is supported and not disabled via `invpcid=false`.
>   
> +### pdx-compress
> +> `= <boolean> | auto | fast | slow`
> +
> +> Default: `auto`
> +
> +Only relevant when hypervisor is build with PFN PDX offset compression
> +`CONFIG_PDX_OFFSET_COMPRESSION`.
> +
> +Controls whether Xen will engage in PFN compression, and which algorithm will
> +be used to calculate the compression coefficients:
> +
> +* `auto`: default choice, attempt fast calculation of compression
> +  coefficients, if that's not successful fallback to slow calculation.
> +
> +* `fast`: only attempt fast calculation of coefficients, if it fails PFN PDX
> +  compression will be disabled.
> +
> +* `slow`: only attempt slow calculation of coefficients, if it fails PFN PDX
> +  compression will be disabled.
> +
> +Note `pdx-compress=true` is equivalent to `pdx-compress=auto`.
> +
>   ### ple_gap
>   > `= <integer>`
>   
> diff --git a/xen/common/pdx.c b/xen/common/pdx.c
> index feabdcded804..5fd01305a7be 100644
> --- a/xen/common/pdx.c
> +++ b/xen/common/pdx.c
> @@ -19,6 +19,7 @@
>   #include <xen/mm.h>
>   #include <xen/bitops.h>
>   #include <xen/nospec.h>
> +#include <xen/param.h>
>   #include <xen/pfn.h>
>   #include <xen/sections.h>
>   #include <xen/sort.h>
> @@ -468,11 +469,40 @@ STATIC void __init pfn_offset_sanitize_ranges(void)
>   }
>   
>   #ifdef __XEN__
> +static enum {
> +    PDX_AUTO, /* Fast first, fallback to slow if fast is not successful. */
> +    PDX_NO,   /* Do not attempt compression. */
> +    PDX_FAST, /* Only attempt fast calculation of compression parameters. */
> +    PDX_SLOW, /* Only attempt slow calculation of compression parameters. */
> +} compress_mode __initdata;
> +
> +static int __init cf_check parse_pdx_param(const char *arg)
> +{
> +    int val;
> +
> +    if ( !arg )
> +        return -EINVAL;
> +
> +    if ( (val = parse_bool(arg, NULL)) != -1 )
> +        compress_mode = val ? PDX_AUTO : PDX_NO;
> +    else if ( !strcmp(arg, "auto") )
> +        compress_mode = PDX_AUTO;
> +    else if ( !strcmp(arg, "fast") )
> +        compress_mode = PDX_FAST;
> +    else if ( !strcmp(arg, "slow") )
> +        compress_mode = PDX_SLOW;
> +    else
> +        return -EINVAL;
> +
> +    return 0;
> +}
> +custom_param("pdx-compress", parse_pdx_param);
> +
>   bool __init pfn_pdx_compression_setup(paddr_t base)
>   {
> -    bool use_slow = false;
> +    bool use_slow = compress_mode == PDX_SLOW;
>   
> -    if ( nr <= 1 )
> +    if ( nr <= 1 || compress_mode == PDX_NO )
>           return false;
>   
>       if ( nr > ARRAY_SIZE(ranges) )
> @@ -507,11 +537,11 @@ bool __init pfn_pdx_compression_setup(paddr_t base)
>               dprintk(XENLOG_DEBUG,
>                       "Find PFN compression coefficients using %s algorithm failed\n",
>                       use_slow ? "slow" : "fast");
> -            if ( use_slow )
> +            if ( compress_mode == PDX_FAST || use_slow )
>                   return false;
>           }
>   
> -        if ( use_slow )
> +        if ( compress_mode == PDX_FAST || use_slow )
>               break;
>       }
>   
--------------B0Qy7QKMeOBJiRuzXBIFI7sN
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
    <div class="moz-cite-prefix">On 6/11/25 7:16 PM, Roger Pau Monne
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:20250611171636.5674-9-roger.pau@citrix.com">
      <pre wrap="" class="moz-quote-pre">Allow controlling whether to attempt PDX compression, and which algorithm
to use to calculate the coefficients.  Document the option and also add a
CHANGELOG entry for the newly added feature.

Note the work has been originally done to cope with the new Intel
Sapphire/Granite Rapids, however the compression is not explicitly tied to
Intel or x86, and hence could be helpful on other architectures.

Signed-off-by: Roger Pau Monné <a class="moz-txt-link-rfc2396E" href="mailto:roger.pau@citrix.com">&lt;roger.pau@citrix.com&gt;</a></pre>
    </blockquote>
    <blockquote type="cite"
      cite="mid:20250611171636.5674-9-roger.pau@citrix.com">
      <pre wrap="" class="moz-quote-pre">
---
 CHANGELOG.md                      |  3 +++
 docs/misc/xen-command-line.pandoc | 22 ++++++++++++++++++
 xen/common/pdx.c                  | 38 +++++++++++++++++++++++++++----
 3 files changed, 59 insertions(+), 4 deletions(-)</pre>
    </blockquote>
    <pre>LGTM: Reviewed-by: Oleksii Kurochko <a class="moz-txt-link-rfc2396E" href="mailto:oleksii.kurochko@gmail.com">&lt;oleksii.kurochko@gmail.com&gt;</a>

Thanks.

~ Oleksii
</pre>
    <blockquote type="cite"
      cite="mid:20250611171636.5674-9-roger.pau@citrix.com">
      <pre wrap="" class="moz-quote-pre">

diff --git a/CHANGELOG.md b/CHANGELOG.md
index 23215a8cc1e6..48327f03078f 100644
--- a/CHANGELOG.md
+++ b/CHANGELOG.md
@@ -20,6 +20,9 @@ The format is based on [Keep a Changelog](<a class="moz-txt-link-freetext" href="https://keepachangelog.com/en/1.0.0/">https://keepachangelog.com/en/1.0.0/</a>)
      table or foreign memory.
 
 ### Added
+ - Introduce new PDX compression algorithm to cope with Intel Sapphire and
+   Granite Rapids having sparse memory maps.
+
  - On x86:
    - Option to attempt to fixup p2m page-faults on PVH dom0.
    - Resizable BARs is supported for PVH dom0.
diff --git a/docs/misc/xen-command-line.pandoc b/docs/misc/xen-command-line.pandoc
index b0eadd2c5d58..06819576a06b 100644
--- a/docs/misc/xen-command-line.pandoc
+++ b/docs/misc/xen-command-line.pandoc
@@ -2072,6 +2072,28 @@ for all of them (`true`), only for those subject to XPTI (`xpti`) or for
 those not subject to XPTI (`no-xpti`). The feature is used only in case
 INVPCID is supported and not disabled via `invpcid=false`.
 
+### pdx-compress
+&gt; `= &lt;boolean&gt; | auto | fast | slow`
+
+&gt; Default: `auto`
+
+Only relevant when hypervisor is build with PFN PDX offset compression
+`CONFIG_PDX_OFFSET_COMPRESSION`.
+
+Controls whether Xen will engage in PFN compression, and which algorithm will
+be used to calculate the compression coefficients:
+
+* `auto`: default choice, attempt fast calculation of compression
+  coefficients, if that's not successful fallback to slow calculation.
+
+* `fast`: only attempt fast calculation of coefficients, if it fails PFN PDX
+  compression will be disabled.
+
+* `slow`: only attempt slow calculation of coefficients, if it fails PFN PDX
+  compression will be disabled.
+
+Note `pdx-compress=true` is equivalent to `pdx-compress=auto`.
+
 ### ple_gap
 &gt; `= &lt;integer&gt;`
 
diff --git a/xen/common/pdx.c b/xen/common/pdx.c
index feabdcded804..5fd01305a7be 100644
--- a/xen/common/pdx.c
+++ b/xen/common/pdx.c
@@ -19,6 +19,7 @@
 #include &lt;xen/mm.h&gt;
 #include &lt;xen/bitops.h&gt;
 #include &lt;xen/nospec.h&gt;
+#include &lt;xen/param.h&gt;
 #include &lt;xen/pfn.h&gt;
 #include &lt;xen/sections.h&gt;
 #include &lt;xen/sort.h&gt;
@@ -468,11 +469,40 @@ STATIC void __init pfn_offset_sanitize_ranges(void)
 }
 
 #ifdef __XEN__
+static enum {
+    PDX_AUTO, /* Fast first, fallback to slow if fast is not successful. */
+    PDX_NO,   /* Do not attempt compression. */
+    PDX_FAST, /* Only attempt fast calculation of compression parameters. */
+    PDX_SLOW, /* Only attempt slow calculation of compression parameters. */
+} compress_mode __initdata;
+
+static int __init cf_check parse_pdx_param(const char *arg)
+{
+    int val;
+
+    if ( !arg )
+        return -EINVAL;
+
+    if ( (val = parse_bool(arg, NULL)) != -1 )
+        compress_mode = val ? PDX_AUTO : PDX_NO;
+    else if ( !strcmp(arg, "auto") )
+        compress_mode = PDX_AUTO;
+    else if ( !strcmp(arg, "fast") )
+        compress_mode = PDX_FAST;
+    else if ( !strcmp(arg, "slow") )
+        compress_mode = PDX_SLOW;
+    else
+        return -EINVAL;
+
+    return 0;
+}
+custom_param("pdx-compress", parse_pdx_param);
+
 bool __init pfn_pdx_compression_setup(paddr_t base)
 {
-    bool use_slow = false;
+    bool use_slow = compress_mode == PDX_SLOW;
 
-    if ( nr &lt;= 1 )
+    if ( nr &lt;= 1 || compress_mode == PDX_NO )
         return false;
 
     if ( nr &gt; ARRAY_SIZE(ranges) )
@@ -507,11 +537,11 @@ bool __init pfn_pdx_compression_setup(paddr_t base)
             dprintk(XENLOG_DEBUG,
                     "Find PFN compression coefficients using %s algorithm failed\n",
                     use_slow ? "slow" : "fast");
-            if ( use_slow )
+            if ( compress_mode == PDX_FAST || use_slow )
                 return false;
         }
 
-        if ( use_slow )
+        if ( compress_mode == PDX_FAST || use_slow )
             break;
     }
 
</pre>
    </blockquote>
  </body>
</html>

--------------B0Qy7QKMeOBJiRuzXBIFI7sN--

