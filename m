Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F94FA9AC4D
	for <lists+xen-devel@lfdr.de>; Thu, 24 Apr 2025 13:42:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.966219.1356509 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7uyF-0006b9-PI; Thu, 24 Apr 2025 11:42:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 966219.1356509; Thu, 24 Apr 2025 11:42:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7uyF-0006Z0-M1; Thu, 24 Apr 2025 11:42:23 +0000
Received: by outflank-mailman (input) for mailman id 966219;
 Thu, 24 Apr 2025 11:42:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Yjef=XK=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1u7uyE-000685-5p
 for xen-devel@lists.xenproject.org; Thu, 24 Apr 2025 11:42:22 +0000
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [2a00:1450:4864:20::530])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2edeffd1-2101-11f0-9eb2-5ba50f476ded;
 Thu, 24 Apr 2025 13:42:21 +0200 (CEST)
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-5e8be1c6ff8so1628557a12.1
 for <xen-devel@lists.xenproject.org>; Thu, 24 Apr 2025 04:42:21 -0700 (PDT)
Received: from [192.168.1.5] (user-109-243-64-225.play-internet.pl.
 [109.243.64.225]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5f6ed9df8f8sm1024280a12.68.2025.04.24.04.42.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 24 Apr 2025 04:42:19 -0700 (PDT)
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
X-Inumbo-ID: 2edeffd1-2101-11f0-9eb2-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745494941; x=1746099741; darn=lists.xenproject.org;
        h=in-reply-to:content-language:references:cc:to:subject:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lmuTrG0KdvxPYIi9Ia14fuQG9GhKduR1D6MgEml/ItQ=;
        b=l+MdjJoQPpwQCcoD9d/9j4BuNGF7F2KRtjkI6CTSO3nYL0n5x2cDlKW1IT+UeVxzI8
         MGqWqKQ9afJfRMe4pWBeCIMEg9KVMWnMu/fRlcx1XOPPXD7DAqdL2wTYO2kOy3T/hqj7
         TcOe25Xcafj0wJU2QlLMMpcuXEHoubFsVprTTiAV3ltoey9fHsThcgS5KbCell6QZmgs
         4HP8kWtR8qAJRY/mrG8XOIXDt3S78UN8xWfCqnmU+Wo14N1XranEvHF8m1a9G0rTWdOi
         ZGfwbcjD56HP/dv2BpX6o84As0h9XzAsBFHX+KtOoNYzeSSTqbTpE91v6U/5F5pJ+vWi
         1TzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745494941; x=1746099741;
        h=in-reply-to:content-language:references:cc:to:subject:from
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=lmuTrG0KdvxPYIi9Ia14fuQG9GhKduR1D6MgEml/ItQ=;
        b=xQpMTE135guqvoj2/jsLPh2WJxpYc16yPwij5VdpGo/lbwb7RUAlS+xsvRQRkfcDBB
         eXBFgwds9uFSBxHBZP8XSxN1FMHKL5ZqOOrUyuXmDkC+koOyJ4/sWh+F4Y+ecR6eJWH/
         aCjBNJ5rATi0XSlJfFZkbDRzGCAEASh50az0ngUL7JWspAL+We3Zwz8XoWsvP5Ezp8CS
         j4czyfD3ypCkbxok30zOm5bTlglD/QG7554FLvZNuKDUtq6u2puNSxpAyD2XCLpSk7c4
         Vv7xDjuHKiR2hbmR0Oxy7SoVwTBpMl1mCOBLRjOExwcdu2C/P2gbKruqHsRpD6z0PNGC
         98sw==
X-Forwarded-Encrypted: i=1; AJvYcCXNt9mJKa7gra6RmBPNC3A/8+fHZ2Gzz2raZlxpne8nL+3poehs2FOhv+rxzg2VtH30ntb3FIhWyXk=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwJFBf1l9X2wptUocHFaTASXIq82oNLvhulfHw4XQvHoKTDsIip
	lotz7DBTkWaKqJSFllxMi8ITj/EdwweCxR2TAva4UVfaBfa4v3ax
X-Gm-Gg: ASbGncthpfl5Q+S4v5yivjgKoZpN+3g/IW1DUvcEU7o636Non6TVe4F3/8RxWv+fVeZ
	MF6Tg1H4CYzmNbwc8B9R7qEIvFSfdHmQSQYxbzownMpxelW8iSbe/dA2OjTwgYIdZ8nEVYDxSQq
	d+3bcs04gQBd+YAW9yxx3St/gEDNuylCCP/fwLteDQcvA1BH8vtIBltsF+JJrdi+yfFrhuDGuK9
	acvLO/tBU+ha82o4j2yq1jhLZdL+/z1KgsQN3AhdGA2dhLida+gB9QISpBV4WE04t5BnbL9NsNC
	TRSn2y+i+fisHkx01E/8Rtp/TSo+wt8hUGp+1KaVM5taJLgCTSfySGj7EZestn7X1Q4KA+hFDbz
	Fi35b8SMQcwDWc03t
X-Google-Smtp-Source: AGHT+IEgZUspumxMo5/YANsRag03NGG3y4CoEz8EgjRdCbXES6quT6/opTZTOAJjBaqZsubmBLCynA==
X-Received: by 2002:a05:6402:2681:b0:5d3:cff5:634f with SMTP id 4fb4d7f45d1cf-5f6df82fdcemr2156194a12.24.1745494939930;
        Thu, 24 Apr 2025 04:42:19 -0700 (PDT)
Content-Type: multipart/alternative;
 boundary="------------fFxa0EaYfvbxfwTUNxpg0xLv"
Message-ID: <069de4f4-0618-4a64-bb0d-73eac409116c@gmail.com>
Date: Thu, 24 Apr 2025 13:42:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: Re: [PATCH v2 1/6] SUPPORT.md: make Linux based stubdom fully
 supported
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: Community Manager <community.manager@xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>
References: <20250408123526.14613-1-jgross@suse.com>
 <20250408123526.14613-2-jgross@suse.com>
Content-Language: en-US
In-Reply-To: <20250408123526.14613-2-jgross@suse.com>

This is a multi-part message in MIME format.
--------------fFxa0EaYfvbxfwTUNxpg0xLv
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 4/8/25 2:35 PM, Juergen Gross wrote:
> All patches needed for running with a Linux stubdom device model are
> in the tree and QubesOS is using and testing Linux stubdoms nowadays.
>
> Switch support from "Tech Preview" to "Supported, with caveats".
>
> Signed-off-by: Juergen Gross<jgross@suse.com>
> ---
> V2:
> - switch to "Supported, with caveats" (security team)
> ---
>   CHANGELOG.md | 1 +
>   SUPPORT.md   | 5 ++++-
>   2 files changed, 5 insertions(+), 1 deletion(-)
>
> diff --git a/CHANGELOG.md b/CHANGELOG.md
> index 8f6afa5c85..ce4fcf2feb 100644
> --- a/CHANGELOG.md
> +++ b/CHANGELOG.md
> @@ -10,6 +10,7 @@ The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
>    - The minimum toolchain requirements have increased for some architectures:
>      - For x86, GCC 5.1 and Binutils 2.25, or Clang/LLVM 11
>      - For ARM32 and ARM64, GCC 5.1 and Binutils 2.25
> + - Linux based device model stubdomains are now fully supported.

LGTM: Acked-By: Oleksii Kurochko<oleksii.kurochko@gmail.com>

Thanks.
~ Oleksii

>   
>   ### Added
>    - On x86:
> diff --git a/SUPPORT.md b/SUPPORT.md
> index 91cb6f8ed2..e8fd0c251e 100644
> --- a/SUPPORT.md
> +++ b/SUPPORT.md
> @@ -260,7 +260,10 @@ Go (golang) bindings for libxl
>   
>   Support for running qemu-xen device model in a linux stubdomain.
>   
> -    Status: Tech Preview
> +    Status: Supported, with caveats
> +
> +Any issue in the stubdomain affecting only the guest it is servicing
> +or itself will not be regarded a security issue.
>   
>   ## Xenstore
>   
--------------fFxa0EaYfvbxfwTUNxpg0xLv
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
    <div class="moz-cite-prefix">On 4/8/25 2:35 PM, Juergen Gross wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:20250408123526.14613-2-jgross@suse.com">
      <pre wrap="" class="moz-quote-pre">All patches needed for running with a Linux stubdom device model are
in the tree and QubesOS is using and testing Linux stubdoms nowadays.

Switch support from "Tech Preview" to "Supported, with caveats".

Signed-off-by: Juergen Gross <a class="moz-txt-link-rfc2396E"
      href="mailto:jgross@suse.com">&lt;jgross@suse.com&gt;</a>
---
V2:
- switch to "Supported, with caveats" (security team)
---
 CHANGELOG.md | 1 +
 SUPPORT.md   | 5 ++++-
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/CHANGELOG.md b/CHANGELOG.md
index 8f6afa5c85..ce4fcf2feb 100644
--- a/CHANGELOG.md
+++ b/CHANGELOG.md
@@ -10,6 +10,7 @@ The format is based on [Keep a Changelog](<a
      class="moz-txt-link-freetext"
      href="https://keepachangelog.com/en/1.0.0/">https://keepachangelog.com/en/1.0.0/</a>)
  - The minimum toolchain requirements have increased for some architectures:
    - For x86, GCC 5.1 and Binutils 2.25, or Clang/LLVM 11
    - For ARM32 and ARM64, GCC 5.1 and Binutils 2.25
+ - Linux based device model stubdomains are now fully supported.</pre>
    </blockquote>
    <pre>LGTM: Acked-By: Oleksii Kurochko <a
    class="moz-txt-link-rfc2396E"
    href="mailto:oleksii.kurochko@gmail.com">&lt;oleksii.kurochko@gmail.com&gt;</a>

Thanks.
~ Oleksii
</pre>
    <blockquote type="cite"
      cite="mid:20250408123526.14613-2-jgross@suse.com">
      <pre wrap="" class="moz-quote-pre"> 
 ### Added
  - On x86:
diff --git a/SUPPORT.md b/SUPPORT.md
index 91cb6f8ed2..e8fd0c251e 100644
--- a/SUPPORT.md
+++ b/SUPPORT.md
@@ -260,7 +260,10 @@ Go (golang) bindings for libxl
 
 Support for running qemu-xen device model in a linux stubdomain.
 
-    Status: Tech Preview
+    Status: Supported, with caveats
+
+Any issue in the stubdomain affecting only the guest it is servicing
+or itself will not be regarded a security issue.
 
 ## Xenstore
 
</pre>
    </blockquote>
  </body>
</html>

--------------fFxa0EaYfvbxfwTUNxpg0xLv--

