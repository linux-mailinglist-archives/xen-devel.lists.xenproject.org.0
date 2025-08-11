Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DA757B201D0
	for <lists+xen-devel@lfdr.de>; Mon, 11 Aug 2025 10:27:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1077076.1438169 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ulNsa-00020c-Qr; Mon, 11 Aug 2025 08:27:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1077076.1438169; Mon, 11 Aug 2025 08:27:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ulNsa-0001xg-Me; Mon, 11 Aug 2025 08:27:40 +0000
Received: by outflank-mailman (input) for mailman id 1077076;
 Mon, 11 Aug 2025 08:27:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MOyo=2X=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1ulNsZ-0001xa-C8
 for xen-devel@lists.xenproject.org; Mon, 11 Aug 2025 08:27:39 +0000
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [2a00:1450:4864:20::52e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 099f5b71-768d-11f0-b898-0df219b8e170;
 Mon, 11 Aug 2025 10:27:37 +0200 (CEST)
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-6154d14d6b7so4753690a12.2
 for <xen-devel@lists.xenproject.org>; Mon, 11 Aug 2025 01:27:37 -0700 (PDT)
Received: from [192.168.1.5] (user-109-243-64-38.play-internet.pl.
 [109.243.64.38]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-af91a23fec4sm1984307966b.121.2025.08.11.01.27.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Aug 2025 01:27:35 -0700 (PDT)
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
X-Inumbo-ID: 099f5b71-768d-11f0-b898-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754900857; x=1755505657; darn=lists.xenproject.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7H+n72LjNEssch+2Htm6ggRF93EOIzn/BLE/Hvkm6/w=;
        b=klJ21eNxt0y7zNL3ki1hIF2JIbJ6oBu+nTjfvak7OO/iBhTLcrzgp2tEsO3VC6mhS9
         U9PJMX63ChbNONxCSMqqBiIolnqBGGNHshVtV9VkXgsbHA05W4RQdKQCMlcI9YLdZ/6l
         H75VYnwUQfX64UlaTouEhiuHKt55TIAFJQ+IkzvY3UQXx+cWOzRs0AtT3MfQ1YscW2zk
         z3iOZesWAVBOyxWcqN2KjoWcQC3DFFf+qcpQ314T8JtP3khNeHsu/y0mZa/1VFSpbxvf
         HuAc8/h7VHZo7HEY/9GkEgUYZwFMXl19HA+9fCDB+nHzkZc/dJk31hjJgJl7uCjjBIYr
         m4sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754900857; x=1755505657;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=7H+n72LjNEssch+2Htm6ggRF93EOIzn/BLE/Hvkm6/w=;
        b=NhMfb/BEKCBikTHvSBJ93+QtQNCAfA3n67hRUBQg8dv3iMbUql8g60JzmwYvRPGEN0
         G98Oy11NzPRIns7o9B52c1PdfRUbs56Lz9kLL+Aa6Hm+BVvt0kEyTpbhArBNQKEj5TWt
         9dE9GFLMvzLSVy2oWUkP/rXPDSVEguSKZ3Qd1KDrKWB0VvedhdByFFariSHE9B3WrbBg
         myD/QUUXyOoLefWa+Jd/YJe8HSpwUDoEPNQyzgCa/q9K6TfYq8+tyuxQO48BFIyRzVe/
         uwiVG+0NL0EnpXlnRrSyB9xPn3RpkLvs5ZxS/EpHuKhiU8xhYJqXuT5x/TNCnWXEt5Gl
         26Eg==
X-Forwarded-Encrypted: i=1; AJvYcCWodYKcnWFGDMc6eGLmdy0SxLlcqyZROiv3x13CRfEpYPQWA48flIbabthv9bo6sJjybY3Ud6bquY8=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzmPResL6G9g6y9pwmoIwntj7RpcBzlU2lnTpfMuzmN6PnJtnJP
	gkYR7rGWlf9sCAQj+hAcLxilZuC92TY4Z8aWRsZPr8ZcqagpbbvzzaAx
X-Gm-Gg: ASbGncsG5NjgBBtp+D4q0HW8SL3ft5WSRvf84I9F0Psea87nCLO4PKSNx+tj9WWdSm4
	+n9w+LiZnGE1OX/mYUVS7800RKradjmeG3TjmGxuP4KMnKuZKggbldYRyobsLTrphGC+lCEaWOT
	b4/Rp4v5r481u5Y/CgkOq6R7oNSUtqp0BA3KCZP96Rkedm9YV7KahmOs6tW0WRMIoz5JPBe8rGw
	7ntsbnMeb6sStmK1LYq7T5uJedruJHcsKM7evJ6q9c8lLfYcL9SLNYaHPhzL0OHlGahvQbhk/63
	yM4k0y7WNRVjx9hkzhx6DDRiWtndAknn2SKMY7lnpXsgOtxHpcHW42Y4SlKTHUQl2Q2jib+6zve
	CG0Knyo1tU64TpoVSWPO95KlEsk5s5JMUpZGvpMJQWkiU/jOkQ4ZhHg0GfrZLnnW/Hl6NYsk=
X-Google-Smtp-Source: AGHT+IFh0g7OiWOqykr+/q27GAFm7PAn8kbFCE6Kj8XIA2Orvf2v1pvFV49P/+tQVHYPMs8omPf6Lw==
X-Received: by 2002:a17:907:6eab:b0:add:fe17:e970 with SMTP id a640c23a62f3a-af9c63b12f4mr1116210166b.14.1754900856479;
        Mon, 11 Aug 2025 01:27:36 -0700 (PDT)
Content-Type: multipart/alternative;
 boundary="------------HWaOhxSqo62uZovjrqlsQOyW"
Message-ID: <10097ea3-f0a6-45cb-971f-a9c342bc4589@gmail.com>
Date: Mon, 11 Aug 2025 10:27:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH 11/11] Update CHANGELOG and README with dependency on
 json-c
To: Anthony PERARD <anthony@xenproject.org>, xen-devel@lists.xenproject.org
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Community Manager <community.manager@xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>
References: <20250808145602.41716-1-anthony@xenproject.org>
 <20250808145602.41716-12-anthony@xenproject.org>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <20250808145602.41716-12-anthony@xenproject.org>

This is a multi-part message in MIME format.
--------------HWaOhxSqo62uZovjrqlsQOyW
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 8/8/25 4:56 PM, Anthony PERARD wrote:
> From: Anthony PERARD<anthony.perard@vates.tech>
>
> Signed-off-by: Anthony PERARD<anthony.perard@vates.tech>

LGTM: Acked-by: Oleksii Kurochko <oleksii.kurochko@gmail>
With one question ...


> ---
>   CHANGELOG.md | 2 ++
>   README       | 2 +-
>   2 files changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/CHANGELOG.md b/CHANGELOG.md
> index 5f31ca08fe..83195e2dae 100644
> --- a/CHANGELOG.md
> +++ b/CHANGELOG.md
> @@ -11,6 +11,8 @@ The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
>      - For x86, GCC 5.1 and Binutils 2.25, or Clang/LLVM 11
>      - For ARM32 and ARM64, GCC 5.1 and Binutils 2.25
>    - Linux based device model stubdomains are now fully supported.
> + - New dependency on library json-c, the toolstack will prefer it to `YAJL`
> +   when available.
>   
>    - On x86:
>      - Restrict the cache flushing done as a result of guest physical memory map
> diff --git a/README b/README
> index 6ee58f7b35..9329f30e13 100644
> --- a/README
> +++ b/README
> @@ -53,7 +53,7 @@ provided by your OS distributor:
>       * Development install of Python 2.7 or later (e.g., python-dev)
>       * Development install of curses (e.g., libncurses-dev)
>       * Development install of uuid (e.g. uuid-dev)
> -    * Development install of yajl (e.g. libyajl-dev)
> +    * Development install of json-c (e.g. libjson-c-dev) or yajl (e.g. libyajl-dev)

... as you mentioned in the cover letter libyajl-dev is unmaintained for several years. Do any plans
exist to drop libyajl-dev at all? Can't it be dropped now?

~ Oleksii

>       * Development install of libaio (e.g. libaio-dev) version 0.3.107 or
>         greater.
>       * Development install of GLib v2.0 (e.g. libglib2.0-dev)
--------------HWaOhxSqo62uZovjrqlsQOyW
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
    <div class="moz-cite-prefix">On 8/8/25 4:56 PM, Anthony PERARD
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:20250808145602.41716-12-anthony@xenproject.org">
      <pre wrap="" class="moz-quote-pre">From: Anthony PERARD <a class="moz-txt-link-rfc2396E" href="mailto:anthony.perard@vates.tech">&lt;anthony.perard@vates.tech&gt;</a>

Signed-off-by: Anthony PERARD <a class="moz-txt-link-rfc2396E" href="mailto:anthony.perard@vates.tech">&lt;anthony.perard@vates.tech&gt;</a></pre>
    </blockquote>
    <pre>LGTM: Acked-by: Oleksii Kurochko &lt;oleksii.kurochko@gmail&gt;
With one question ...
</pre>
    <p><br>
    </p>
    <blockquote type="cite"
      cite="mid:20250808145602.41716-12-anthony@xenproject.org">
      <pre wrap="" class="moz-quote-pre">
---
 CHANGELOG.md | 2 ++
 README       | 2 +-
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/CHANGELOG.md b/CHANGELOG.md
index 5f31ca08fe..83195e2dae 100644
--- a/CHANGELOG.md
+++ b/CHANGELOG.md
@@ -11,6 +11,8 @@ The format is based on [Keep a Changelog](<a class="moz-txt-link-freetext" href="https://keepachangelog.com/en/1.0.0/">https://keepachangelog.com/en/1.0.0/</a>)
    - For x86, GCC 5.1 and Binutils 2.25, or Clang/LLVM 11
    - For ARM32 and ARM64, GCC 5.1 and Binutils 2.25
  - Linux based device model stubdomains are now fully supported.
+ - New dependency on library json-c, the toolstack will prefer it to `YAJL`
+   when available.
 
  - On x86:
    - Restrict the cache flushing done as a result of guest physical memory map
diff --git a/README b/README
index 6ee58f7b35..9329f30e13 100644
--- a/README
+++ b/README
@@ -53,7 +53,7 @@ provided by your OS distributor:
     * Development install of Python 2.7 or later (e.g., python-dev)
     * Development install of curses (e.g., libncurses-dev)
     * Development install of uuid (e.g. uuid-dev)
-    * Development install of yajl (e.g. libyajl-dev)
+    * Development install of json-c (e.g. libjson-c-dev) or yajl (e.g. libyajl-dev)</pre>
    </blockquote>
    <pre>... as you mentioned in the cover letter libyajl-dev is unmaintained for several years. Do any plans
exist to drop libyajl-dev at all? Can't it be dropped now?

~ Oleksii
</pre>
    <blockquote type="cite"
      cite="mid:20250808145602.41716-12-anthony@xenproject.org">
      <pre wrap="" class="moz-quote-pre">
     * Development install of libaio (e.g. libaio-dev) version 0.3.107 or
       greater.
     * Development install of GLib v2.0 (e.g. libglib2.0-dev)
</pre>
    </blockquote>
  </body>
</html>

--------------HWaOhxSqo62uZovjrqlsQOyW--

