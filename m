Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A527A6BFCA
	for <lists+xen-devel@lfdr.de>; Fri, 21 Mar 2025 17:25:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.924301.1327574 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tvfB3-0006rk-KT; Fri, 21 Mar 2025 16:24:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 924301.1327574; Fri, 21 Mar 2025 16:24:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tvfB3-0006pV-H8; Fri, 21 Mar 2025 16:24:57 +0000
Received: by outflank-mailman (input) for mailman id 924301;
 Fri, 21 Mar 2025 16:24:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lMoj=WI=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1tvfB2-0006pP-5F
 for xen-devel@lists.xenproject.org; Fri, 21 Mar 2025 16:24:56 +0000
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [2a00:1450:4864:20::52e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0568f5c5-0671-11f0-9ffa-bf95429c2676;
 Fri, 21 Mar 2025 17:24:54 +0100 (CET)
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-5e5c9662131so3302218a12.3
 for <xen-devel@lists.xenproject.org>; Fri, 21 Mar 2025 09:24:54 -0700 (PDT)
Received: from [192.168.1.5] (user-109-243-64-225.play-internet.pl.
 [109.243.64.225]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5ebcd0df994sm1548828a12.70.2025.03.21.09.24.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 21 Mar 2025 09:24:52 -0700 (PDT)
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
X-Inumbo-ID: 0568f5c5-0671-11f0-9ffa-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742574293; x=1743179093; darn=lists.xenproject.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+OQEvtD/NMliw+TTK29g8C9huW7Rn6jdGBTLDZsNsaw=;
        b=cNLfagM8wKiHu8+vWwE+7Pz88yWuTNZnzEIKK6SwnxzitIVsTcrRQgcYBbcnGFyhW5
         fvcPG3yacB+nwM1aok6tTrXaHIAQPOcfFcHmdCz17NHkRFmOd4KKF8WggUuI/Q8/yRe3
         UqO/fvDT7oTNFzO2J9DZM+cYuwk3hGNLl1c1TDzqpx8K8cmSvBvVv1Ko6gZziIxco9DM
         Yzq9NcbNGowZxaWnKvO9oVewBPiFZz+aKqhHHcKT+xeZmUGQAIzpxWp2UXtclmo/hJHk
         Yh4Sl9KwKf2i3sPQhq5uBQC/0VB8BQRsA7mjSMV8AQaOzBYBbAnXzOeQIAsfXa+9lkQa
         eqjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742574293; x=1743179093;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+OQEvtD/NMliw+TTK29g8C9huW7Rn6jdGBTLDZsNsaw=;
        b=m7Y9VCdE1Llldg0qF9c3dwjRDZ9nZo6gRYz9FCeEE1WR0ddDS99VwRDFHcjxpxBRLa
         kM2FeE2EFqcwJG5DOGJhaCwbQjPvr99M6czRNWAE4g1D/CBpZLBSTRDU/ueC7abIQRvm
         rALzbsWZQPtLtTh0qozeV9/QEidVgPuPl3gIV9CwAYpd3OlqwNnovwM+xdWyRgTbAGzN
         YgpcOhb+pYf7eEpU8gBecazTcbLbcqZEqueNShyBI/yy+pn+X1Yb0H8+I5SD/sl2+pT/
         XJOO6A03+18/qbcTzZxB/nfE9jNgAaCJI/AIDc6U6Y8GV1+ASjYTvlmDhHDTxMSKbQ6U
         MONQ==
X-Forwarded-Encrypted: i=1; AJvYcCXvfy1tDjWsVe/5DkXvFNolcw/PIGD6GDFenYfk9joZlShX2RUxRqr3kuh86yhjlRg0QD6+LeMXU+0=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy9uNA1l8pDag5BRKEa/tTL0SwUSZpve8s7SxyEkMtREqItyRJc
	38QE0V/9iMdCKioNqcIyz1Ziw78TZ7t3MNOEKGyFdHsBDUlIIzUd
X-Gm-Gg: ASbGncsH1mRaBRvmU23U6VtsaWhTQshEtk+DDk4IeIkf+kkOYoegyEjS5JaN3995Kdz
	MwAWZMrSlmgWSYxq/I0DXkMNvGPsJhZp7MCuDDL13bBpwNFoD6ywQIah6+SH1IvOi3G2Q98y6O7
	nRH904DZbr9mueswUShPr+rrTMhBCNzw9lP5+VdP6BoDBRiPO5UUwaOEfStYXZojRxbCcKP8PX3
	6/lPz1kwR/3N+NxHbhofVGjwQTlBtbA0wuPAGlQIrDGJVAj6Rt4P22VD4t5L71qFeHb8vKc9gGp
	8YzmALR3xcZxALGQujpsBL5duMWLoGJwckhtjwZQeQBmTVMg2eewO7FQOWU5UEV+lvaLF0PY7aj
	RMkXNqOw2KypTSyf9UJZZ
X-Google-Smtp-Source: AGHT+IHEeG7re/vgBuNG/VPOTU+SAuYGkz10lZWaZtjzDL6J9BaKBliSOPkya3ixQUO0lGJxYEVSZA==
X-Received: by 2002:a17:906:dc89:b0:ac3:eb29:2aed with SMTP id a640c23a62f3a-ac3f210904emr378724566b.16.1742574293051;
        Fri, 21 Mar 2025 09:24:53 -0700 (PDT)
Content-Type: multipart/alternative;
 boundary="------------5F638A8gnnTXrNuVrdp0epDN"
Message-ID: <c901f573-97dc-4ad0-9974-847fc58a0d44@gmail.com>
Date: Fri, 21 Mar 2025 17:24:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] CHANGELOG: Minimum toolchain requirements
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>
References: <20250320155908.43885-1-andrew.cooper3@citrix.com>
 <20250320155908.43885-4-andrew.cooper3@citrix.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <20250320155908.43885-4-andrew.cooper3@citrix.com>

This is a multi-part message in MIME format.
--------------5F638A8gnnTXrNuVrdp0epDN
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 3/20/25 4:59 PM, Andrew Cooper wrote:
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

I think we want here to specify for which architectures it was done as RISC-V, for example, uses
different versions:
  - GCC 12.2 or later
  - GNU Binutils 2.39 or later
And for clang the version will be 17 as:
   f873029386dd415cd9caa78f600a593d9570c9ae("[BOLT] Add minimal RISC-V 64-bit support")
   $ git tag --contains f873029386dd415cd9caa78f600a593d9570c9ae
     llvmorg-17.0.0
   ...
I have some patch to build Xen RISC-V using clang-17 but I haven't sent to upstream yet as I am not
really sure that if we need (or why we need) clang support just from the start.

~ Oleksii

--------------5F638A8gnnTXrNuVrdp0epDN
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
    <div class="moz-cite-prefix">On 3/20/25 4:59 PM, Andrew Cooper
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:20250320155908.43885-4-andrew.cooper3@citrix.com">
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
    <pre>I think we want here to specify for which architectures it was done as RISC-V, for example, uses
different versions:
 - GCC 12.2 or later
 - GNU Binutils 2.39 or later
And for clang the version will be 17 as:
  f873029386dd415cd9caa78f600a593d9570c9ae("[BOLT] Add minimal RISC-V 64-bit support")
  $ git tag --contains f873029386dd415cd9caa78f600a593d9570c9ae
    llvmorg-17.0.0
  ...
I have some patch to build Xen RISC-V using clang-17 but I haven't sent to upstream yet as I am not
really sure that if we need (or why we need) clang support just from the start.
</pre>
    <pre>~ Oleksii</pre>
  </body>
</html>

--------------5F638A8gnnTXrNuVrdp0epDN--

