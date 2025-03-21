Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D5EAA6BFAE
	for <lists+xen-devel@lfdr.de>; Fri, 21 Mar 2025 17:20:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.924286.1327564 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tvf70-0006Cn-01; Fri, 21 Mar 2025 16:20:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 924286.1327564; Fri, 21 Mar 2025 16:20:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tvf6z-0006Ac-So; Fri, 21 Mar 2025 16:20:45 +0000
Received: by outflank-mailman (input) for mailman id 924286;
 Fri, 21 Mar 2025 16:20:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lMoj=WI=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1tvf6y-0006AW-5j
 for xen-devel@lists.xenproject.org; Fri, 21 Mar 2025 16:20:44 +0000
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [2a00:1450:4864:20::634])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6ee78acc-0670-11f0-9ea1-5ba50f476ded;
 Fri, 21 Mar 2025 17:20:43 +0100 (CET)
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-ac28e66c0e1so333450966b.0
 for <xen-devel@lists.xenproject.org>; Fri, 21 Mar 2025 09:20:41 -0700 (PDT)
Received: from [192.168.1.5] (user-109-243-64-225.play-internet.pl.
 [109.243.64.225]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ac3efb6483fsm178055366b.112.2025.03.21.09.20.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 21 Mar 2025 09:20:39 -0700 (PDT)
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
X-Inumbo-ID: 6ee78acc-0670-11f0-9ea1-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742574041; x=1743178841; darn=lists.xenproject.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3N8BHOXtSgZFGOoLKVMk6q1cjSMenxrnzi9YbHAVyro=;
        b=MXGPUH0vNhpDoNLhcSUQhTRkmvifYuD1RpNAG5P9kCiXshM1XgQZe+IgXYNt4+2Oa6
         hWC7E/YHnEpIf4W6N/IgHbSPc7gqSlQdXpOu8g85v22cykyMxRbtYzvvo3/AWrb7vRep
         JEHd4fGpxUkli5BS2fbG5HmYL8uFxUw5Zd30q8QFiAKmuBuQ5zTlXDzVf9hLMHNp1eoO
         c44y6prOfOU4HzbOEkqJX2XUuwLit7lrrXohz3RphzsoBpFsgPt5Bdvjv5A++S6nbY+q
         3MNq9O+y4Tz8JZgrkriedW4MTxUUnykdJmEGPdFUDhA8Mf69RmomybCbxCSqjtgeMptc
         f4Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742574041; x=1743178841;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=3N8BHOXtSgZFGOoLKVMk6q1cjSMenxrnzi9YbHAVyro=;
        b=rfKm60yA3cQTvExR1/1VauQUiDKiPrUY+PQs9tvW7+AYyUEfnN5FrGH38g+28Aio0b
         b7oK8xstou74cLxyu3/V0gDVCmnOKHIXM2oM0uRDKnLZdDNxHBYN8Wbc2hjcG10oQVCL
         oEeLjuy3yIkYg1r/DDyObpMjx32lm6GRITRqnGngBh4+kjOYCVMiyj0RVn9xFkhS+s7x
         Fv9xPTgGx7PSVWYXJtcuputFcRxs+CRM0qr7ujafIrIinQGVsvm+VSPwaplarrYJRx0u
         XdGPL2dpAvO5rNPxSBiIYL0mHMbpbpD/cfutmo8owhiSLgEQ6z3hbDZnEUQGapC8zYIH
         /9yw==
X-Forwarded-Encrypted: i=1; AJvYcCUVK625c4p5X+9xHIhBjzZStwZObAs1G9agy8JeRUUZuMkxiLwQvwcJ5OO4M4PwZopb3v1ENfzYVBY=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzyN9TbRp7HbKMa4e4jiRpIsE63PzbCRhMNb4QhRk0Yp6+3h5BF
	rgLwDhf6vDUFMCS1ZUY/SfjFAp8IfdmKVM+MByW0RX2HEbYDjzGB
X-Gm-Gg: ASbGncsUeyCNJzIJA6DBWLCBwW3nko8feP/XURB9E2wcSF8lXyJMrwpr4iIU1xKiCz4
	wU6oemcnVWGJD68mZ/bN+bk+PUjYvmDq0EJap/ZrGWBNighyxjigNS3UpOwDvRBpQqsYZ8JNBcz
	w5HL9/J13wDeiSrRY6JZ90FhJtW+78NMDI7K/AKwkKIVo3z2TrpP8X13gePlV0vEKwAOF4ALhap
	kTz+Kgqk5PzU0Rp0u4Yub39AkAkUUbAlpraGOHn2L/53sijpWF0iVGHx1HSOov3O5jKJQ6W/T/w
	3WBtdF7Cwt2bLK6wblDhbMVNBMdUbJN9NaHtrERz6fV6kBkKgqYnq975f9h55Mzfrul1X34AF9i
	t40z8QC0So7zWvzKDXTec
X-Google-Smtp-Source: AGHT+IGjZEWpVywPGgDP/69Vp73vCs7JnDpiv0WsNs8fSpmH6t76Zuqf/WUsJ2qQsdEoG71EQnz1CA==
X-Received: by 2002:a17:907:968b:b0:ac2:912d:5a80 with SMTP id a640c23a62f3a-ac3f20b6561mr368276766b.5.1742574040060;
        Fri, 21 Mar 2025 09:20:40 -0700 (PDT)
Content-Type: multipart/alternative;
 boundary="------------sqElReutriTsddI4K9AZ2cHo"
Message-ID: <ebe15fc1-e3e0-44f7-a5b7-6546df272c50@gmail.com>
Date: Fri, 21 Mar 2025 17:20:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] CHANGELOG: Minimum toolchain requirements
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>
References: <20250320153241.43809-1-andrew.cooper3@citrix.com>
 <20250320153241.43809-4-andrew.cooper3@citrix.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <20250320153241.43809-4-andrew.cooper3@citrix.com>

This is a multi-part message in MIME format.
--------------sqElReutriTsddI4K9AZ2cHo
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 3/20/25 4:32 PM, Andrew Cooper wrote:
> Signed-off-by: Andrew Cooper<andrew.cooper3@citrix.com>
> ---
> CC: Anthony PERARD<anthony.perard@vates.tech>
> CC: Michal Orzel<michal.orzel@amd.com>
> CC: Jan Beulich<jbeulich@suse.com>
> CC: Julien Grall<julien@xen.org>
> CC: Roger Pau Monné<roger.pau@citrix.com>
> CC: Stefano Stabellini<sstabellini@kernel.org>
> CC: Oleksii Kurochko<oleksii.kurochko@gmail.com>
> ---
>   CHANGELOG.md | 3 +++
>   1 file changed, 3 insertions(+)
>
> diff --git a/CHANGELOG.md b/CHANGELOG.md
> index 9a5919585d43..4e333e608a96 100644
> --- a/CHANGELOG.md
> +++ b/CHANGELOG.md
> @@ -7,6 +7,9 @@ The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
>   ## [4.21.0 UNRELEASED](https://xenbits.xenproject.org/gitweb/?p=xen.git;a=shortlog;h=staging) - TBD
>   
>   ### Changed
> + - The minimum toolchain requirements have been increased to either:
> +   - GCC 5.1 and Binutils 2.25, or
> +   - Clang/LLVM 11

I think we have to specify here for which architectures as RISC-V support different minimal versions.


>   
>   ### Added
>    - On x86:
--------------sqElReutriTsddI4K9AZ2cHo
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
    <div class="moz-cite-prefix">On 3/20/25 4:32 PM, Andrew Cooper
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:20250320153241.43809-4-andrew.cooper3@citrix.com">
      <pre wrap="" class="moz-quote-pre">Signed-off-by: Andrew Cooper <a class="moz-txt-link-rfc2396E" href="mailto:andrew.cooper3@citrix.com">&lt;andrew.cooper3@citrix.com&gt;</a>
---
CC: Anthony PERARD <a class="moz-txt-link-rfc2396E" href="mailto:anthony.perard@vates.tech">&lt;anthony.perard@vates.tech&gt;</a>
CC: Michal Orzel <a class="moz-txt-link-rfc2396E" href="mailto:michal.orzel@amd.com">&lt;michal.orzel@amd.com&gt;</a>
CC: Jan Beulich <a class="moz-txt-link-rfc2396E" href="mailto:jbeulich@suse.com">&lt;jbeulich@suse.com&gt;</a>
CC: Julien Grall <a class="moz-txt-link-rfc2396E" href="mailto:julien@xen.org">&lt;julien@xen.org&gt;</a>
CC: Roger Pau Monné <a class="moz-txt-link-rfc2396E" href="mailto:roger.pau@citrix.com">&lt;roger.pau@citrix.com&gt;</a>
CC: Stefano Stabellini <a class="moz-txt-link-rfc2396E" href="mailto:sstabellini@kernel.org">&lt;sstabellini@kernel.org&gt;</a>
CC: Oleksii Kurochko <a class="moz-txt-link-rfc2396E" href="mailto:oleksii.kurochko@gmail.com">&lt;oleksii.kurochko@gmail.com&gt;</a>
---
 CHANGELOG.md | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/CHANGELOG.md b/CHANGELOG.md
index 9a5919585d43..4e333e608a96 100644
--- a/CHANGELOG.md
+++ b/CHANGELOG.md
@@ -7,6 +7,9 @@ The format is based on [Keep a Changelog](<a class="moz-txt-link-freetext" href="https://keepachangelog.com/en/1.0.0/">https://keepachangelog.com/en/1.0.0/</a>)
 ## [4.21.0 UNRELEASED](<a class="moz-txt-link-freetext" href="https://xenbits.xenproject.org/gitweb/?p=xen.git;a=shortlog;h=staging">https://xenbits.xenproject.org/gitweb/?p=xen.git;a=shortlog;h=staging</a>) - TBD
 
 ### Changed
+ - The minimum toolchain requirements have been increased to either:
+   - GCC 5.1 and Binutils 2.25, or
+   - Clang/LLVM 11</pre>
    </blockquote>
    <pre>I think we have to specify here for which architectures as RISC-V support different minimal versions.</pre>
    <p><br>
    </p>
    <blockquote type="cite"
      cite="mid:20250320153241.43809-4-andrew.cooper3@citrix.com">
      <pre wrap="" class="moz-quote-pre">
 
 ### Added
  - On x86:
</pre>
    </blockquote>
  </body>
</html>

--------------sqElReutriTsddI4K9AZ2cHo--

