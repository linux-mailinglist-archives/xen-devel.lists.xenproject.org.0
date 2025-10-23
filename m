Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ED5D2C02155
	for <lists+xen-devel@lfdr.de>; Thu, 23 Oct 2025 17:22:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1149316.1480989 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vBx9H-0006SV-32; Thu, 23 Oct 2025 15:22:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1149316.1480989; Thu, 23 Oct 2025 15:22:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vBx9H-0006Q2-05; Thu, 23 Oct 2025 15:22:43 +0000
Received: by outflank-mailman (input) for mailman id 1149316;
 Thu, 23 Oct 2025 15:22:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Pfyu=5A=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1vBx9F-0006Pw-Va
 for xen-devel@lists.xenproject.org; Thu, 23 Oct 2025 15:22:41 +0000
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [2a00:1450:4864:20::62a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1d633110-b024-11f0-9d15-b5c5bf9af7f9;
 Thu, 23 Oct 2025 17:22:40 +0200 (CEST)
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-b5a8184144dso157933866b.1
 for <xen-devel@lists.xenproject.org>; Thu, 23 Oct 2025 08:22:40 -0700 (PDT)
Received: from [192.168.1.5] (user-109-243-71-38.play-internet.pl.
 [109.243.71.38]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b6d5130d570sm236629866b.10.2025.10.23.08.22.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Oct 2025 08:22:39 -0700 (PDT)
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
X-Inumbo-ID: 1d633110-b024-11f0-9d15-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761232960; x=1761837760; darn=lists.xenproject.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uOqBEfEaONqTDbPzcyNxVdaTcrM3D1QJ3UqLDzuPDoY=;
        b=MuKBBz/R8VWGpinhdMX8/x0OLT61ba8aV+XVyjWWRmxqGDcNMBEX2US9sbmJDG2avp
         KrO8/QNyJei6lE6WYvFSc9jMPJj2dTOsjdJ32WA/1vVnyQd4HlBNSUcptLxE2cj1qAtS
         3h0PD8/IuA+TGaBEF1Up+JED+vywmAauoMcpTw8fv96JtBzcQj3a/woKNydehwn1dMae
         BnVcN2umncQRzLL0FZJGe4WXInBZ98fE91x/ZSFmLd9XB4JN489mofFl3TBjWmtSzalD
         6keUFz1TVn00RNYD0/ZGlGMm8vP3gP7aI+qRcEeEhflbdTiYgzDAmyw2o9ivuqCrqcgw
         7KPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761232960; x=1761837760;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=uOqBEfEaONqTDbPzcyNxVdaTcrM3D1QJ3UqLDzuPDoY=;
        b=KKa8RMlu2walMJFipR9pctsW7iY0lC8oPZnQWagvLdEOschaIPG1KWqoDOXJ7kM+TM
         6d+eNQXVB6SaS75QTRupB+9E9I6rESWJqL464dH6fHx13vsnw4ZLCJLHOi4eetDFqpDn
         ofHcrIIGAwjEVqVFWsxaNdlWGV/5PdUnVYvh/5BAi/xk3JJ23cFdGWtu4ytCO03oL7Mh
         qHwQf6FCi9fU+sNERAwhjnMhQEtz9/eakLzHoPupN9OK4K23PVYtfOBFaqfWAxHIjtaf
         XEw4kMm4I1M2RXVGdAjANxAfChqKqiVBc1u7UlsxbD6sVw48nCXx0+61LEhQGv1j1ur3
         frDQ==
X-Gm-Message-State: AOJu0Yxa9rcJh0er35aswHJSlDolbjBmpNlLOiYP+oLlvGtyf2g7seGn
	2DE48hKZdl0hYKeoL6TuwhR22gjQ38WHk0iEF9jo73Q9XfD50L0NMC5v
X-Gm-Gg: ASbGncv1ZD1wtEd675fslo82r9Oy06S1Xrw73jUJgETF5bBx8NvJIV4DEjWNE8/S7+c
	7xyuajDmProcI0aT5d7T9NWVUa6lwqb+7762w/P/Yc1U4Bvk88jTFqCCoSus0Bt208Wek2N10ur
	4x0mDqV+bjvSYmn5rxJXMuRcVLB7zhJxVL4+wTNgxt2Q4L4mIjwNtSPU3fTUkMRS7jt8wjDV/zP
	816fkV6sguwK+eQhzyAjJqkczTZJk7M9X3ZC1WghoJznrwUV2ng8uhKw9Mn9znxhPxlOGQ8rfNS
	/UQFos1CIHemqA7WIPVrcBJ9fXbT36ofibQ06vUbQx2s+MQU2KsgwbginFORe2oK4yHzVPKvu1R
	+f/eJjKEPYHtcGMCYg82YbhOFdhsnPLBzVZHyXwZIeN9WQG1Ys4il7NWDal/KXq2ljzrhYkgAa5
	svinN8TI3Bx0alVHORSL+v4JtD1hT5K0HJHqi6LVq7yXSyDQvewiTCDg==
X-Google-Smtp-Source: AGHT+IHZNyWQ2v1/GJ5HLMe/HCSqR1+NZQ4hVy0/CACkQQWUTZRyBBl9FNlCx1mv+BozVZTgSZ9EHQ==
X-Received: by 2002:a17:907:2d09:b0:b40:6e13:1a7f with SMTP id a640c23a62f3a-b6474b3140amr3165501566b.27.1761232959900;
        Thu, 23 Oct 2025 08:22:39 -0700 (PDT)
Content-Type: multipart/alternative;
 boundary="------------Rl00sHTIiDyRHivOf9VZa0Zi"
Message-ID: <d9924b94-36d0-4d7e-9a9b-bd4ea38f538d@gmail.com>
Date: Thu, 23 Oct 2025 17:22:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH for-4.21] tools: require at least json-c 0.15
To: Anthony PERARD <anthony@xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>,
 Anthony PERARD <anthony.perard@vates.tech>
References: <20251023085730.36628-1-anthony@xenproject.org>
 <bd6c0e3f-f2bc-4399-adf6-d2dc18b06982@citrix.com> <aPpD_G_oULdfeWbf@l14>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <aPpD_G_oULdfeWbf@l14>

This is a multi-part message in MIME format.
--------------Rl00sHTIiDyRHivOf9VZa0Zi
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 10/23/25 5:04 PM, Anthony PERARD wrote:
> On Thu, Oct 23, 2025 at 03:45:55PM +0100, Andrew Cooper wrote:
>> On 23/10/2025 9:57 am, Anthony PERARD wrote:
>>> From: Anthony PERARD<anthony.perard@vates.tech>
>>>
>>> If not available, fallback to using YAJL.
>>>
>>> The code is using json_c_visit() which was introduced in 0.13.
>>> json_object_new_null() and json_object_new_uint64() where added to
>>> 0.14. And the last one json_object_new_array_ext() was introduced in
>>> 0.15.
>>>
>>> Signed-off-by: Anthony PERARD<anthony.perard@vates.tech>
>> Acked-by: Andrew Cooper<andrew.cooper3@citrix.com>
>>
>> However, you should adjust README and possibly Changelog.md to give this
>> new minimum version.
>
> Will this do?
>
> diff --git a/CHANGELOG.md b/CHANGELOG.md
> index 0cf9ad2d95..fc4f6d7c8a 100644
> --- a/CHANGELOG.md
> +++ b/CHANGELOG.md
> @@ -14,8 +14,8 @@ The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
>    - Debian Trixie added to CI.  Debian Bullseye retired from CI for RISC-V due
>      to the baseline change.
>    - Linux based device model stubdomains are now fully supported.
> - - New dependency on library json-c, the toolstack will prefer it to `YAJL`
> -   when available.
> + - New dependency on library json-c 0.15 or later, the toolstack will prefer it
> +   to `YAJL` when available.
>
>    - On x86:
>      - Restrict the cache flushing done as a result of guest physical memory map
> diff --git a/README b/README
> index eaee78bd73..53a4d5c2ae 100644
> --- a/README
> +++ b/README
> @@ -53,7 +53,8 @@ provided by your OS distributor:
>       * Development install of Python 2.7 or later (e.g., python-dev)
>       * Development install of curses (e.g., libncurses-dev)
>       * Development install of uuid (e.g. uuid-dev)
> -    * Development install of json-c (e.g. libjson-c-dev) or yajl (e.g. libyajl-dev)
> +    * Development install of json-c 0.15 or later (e.g. libjson-c-dev)
> +      or yajl (e.g. libyajl-dev)
>       * Development install of libaio (e.g. libaio-dev) version 0.3.107 or
>         greater.
>       * Development install of GLib v2.0 (e.g. libglib2.0-dev)
>
> Cheers,

LGTM. Free to add my:

  Acked-by: Oleksii Kurochko<oleksii.kurochko@gmail.com>

~ Oleksii

>
--------------Rl00sHTIiDyRHivOf9VZa0Zi
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
    <div class="moz-cite-prefix">On 10/23/25 5:04 PM, Anthony PERARD
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:aPpD_G_oULdfeWbf@l14">
      <pre wrap="" class="moz-quote-pre">On Thu, Oct 23, 2025 at 03:45:55PM +0100, Andrew Cooper wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">On 23/10/2025 9:57 am, Anthony PERARD wrote:
</pre>
        <blockquote type="cite">
          <pre wrap="" class="moz-quote-pre">From: Anthony PERARD <a class="moz-txt-link-rfc2396E" href="mailto:anthony.perard@vates.tech">&lt;anthony.perard@vates.tech&gt;</a>

If not available, fallback to using YAJL.

The code is using json_c_visit() which was introduced in 0.13.
json_object_new_null() and json_object_new_uint64() where added to
0.14. And the last one json_object_new_array_ext() was introduced in
0.15.

Signed-off-by: Anthony PERARD <a class="moz-txt-link-rfc2396E" href="mailto:anthony.perard@vates.tech">&lt;anthony.perard@vates.tech&gt;</a>
</pre>
        </blockquote>
        <pre wrap="" class="moz-quote-pre">
Acked-by: Andrew Cooper <a class="moz-txt-link-rfc2396E" href="mailto:andrew.cooper3@citrix.com">&lt;andrew.cooper3@citrix.com&gt;</a>

However, you should adjust README and possibly Changelog.md to give this
new minimum version.
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">

Will this do?

diff --git a/CHANGELOG.md b/CHANGELOG.md
index 0cf9ad2d95..fc4f6d7c8a 100644
--- a/CHANGELOG.md
+++ b/CHANGELOG.md
@@ -14,8 +14,8 @@ The format is based on [Keep a Changelog](<a class="moz-txt-link-freetext" href="https://keepachangelog.com/en/1.0.0/">https://keepachangelog.com/en/1.0.0/</a>)
  - Debian Trixie added to CI.  Debian Bullseye retired from CI for RISC-V due
    to the baseline change.
  - Linux based device model stubdomains are now fully supported.
- - New dependency on library json-c, the toolstack will prefer it to `YAJL`
-   when available.
+ - New dependency on library json-c 0.15 or later, the toolstack will prefer it
+   to `YAJL` when available.

  - On x86:
    - Restrict the cache flushing done as a result of guest physical memory map
diff --git a/README b/README
index eaee78bd73..53a4d5c2ae 100644
--- a/README
+++ b/README
@@ -53,7 +53,8 @@ provided by your OS distributor:
     * Development install of Python 2.7 or later (e.g., python-dev)
     * Development install of curses (e.g., libncurses-dev)
     * Development install of uuid (e.g. uuid-dev)
-    * Development install of json-c (e.g. libjson-c-dev) or yajl (e.g. libyajl-dev)
+    * Development install of json-c 0.15 or later (e.g. libjson-c-dev)
+      or yajl (e.g. libyajl-dev)
     * Development install of libaio (e.g. libaio-dev) version 0.3.107 or
       greater.
     * Development install of GLib v2.0 (e.g. libglib2.0-dev)

Cheers,</pre>
    </blockquote>
    <pre>LGTM. Free to add my:

 Acked-by: Oleksii Kurochko <a class="moz-txt-link-rfc2396E" href="mailto:oleksii.kurochko@gmail.com">&lt;oleksii.kurochko@gmail.com&gt;</a>

~ Oleksii</pre>
    <blockquote type="cite" cite="mid:aPpD_G_oULdfeWbf@l14">
      <pre wrap="" class="moz-quote-pre">

</pre>
    </blockquote>
  </body>
</html>

--------------Rl00sHTIiDyRHivOf9VZa0Zi--

