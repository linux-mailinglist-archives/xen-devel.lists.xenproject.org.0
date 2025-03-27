Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BE8CAA7364F
	for <lists+xen-devel@lfdr.de>; Thu, 27 Mar 2025 17:05:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.929675.1332430 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1txpjR-0006DC-FQ; Thu, 27 Mar 2025 16:05:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 929675.1332430; Thu, 27 Mar 2025 16:05:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1txpjR-0006BT-C3; Thu, 27 Mar 2025 16:05:25 +0000
Received: by outflank-mailman (input) for mailman id 929675;
 Thu, 27 Mar 2025 16:05:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Eznr=WO=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1txpjQ-0006BN-5v
 for xen-devel@lists.xenproject.org; Thu, 27 Mar 2025 16:05:24 +0000
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [2a00:1450:4864:20::52d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 498727c7-0b25-11f0-9ea3-5ba50f476ded;
 Thu, 27 Mar 2025 17:05:22 +0100 (CET)
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-5eb5ecf3217so2130520a12.3
 for <xen-devel@lists.xenproject.org>; Thu, 27 Mar 2025 09:05:22 -0700 (PDT)
Received: from [192.168.1.5] (user-109-243-64-225.play-internet.pl.
 [109.243.64.225]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5edc17dff16sm4767a12.67.2025.03.27.09.05.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Mar 2025 09:05:20 -0700 (PDT)
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
X-Inumbo-ID: 498727c7-0b25-11f0-9ea3-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743091522; x=1743696322; darn=lists.xenproject.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wO+wt6DrXguhKtyD31HtL0rruhHKVsvcQl5IUhCl60A=;
        b=BJOsRjR2vo1P+cQobidl7aj5kwC53SU0klB1PzbNtEyBT97//GDsSBkfAEvSEAP60P
         SjlsLwj2paCknLa3FajN+csHJY25zDUtYa2UgKHIZM5t5WAW7TAUS9vlXS2th4Zzl6M+
         2CjPWZriHX42ZqXcpLcDEgzP64xWi8s+3OdRLOuHzNJ/1eim/48xEbPqBApG7Raf1XXt
         6228VIquv4tYNxYZcBxtzysl2/k1RPKn+TkvH9V5wOmoEILbySYBSfBYko30Fw+Bxd4l
         FxuhhshGe69fRPxN9qbuIPXn3Ohv/hxvSo8MqMQ1GTIxbPtxVLo/7VGs6Bf6KO2wrqHg
         1m6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743091522; x=1743696322;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=wO+wt6DrXguhKtyD31HtL0rruhHKVsvcQl5IUhCl60A=;
        b=mwLNhs8l1W2naFQF+ZayfWEgQmAWFpeLt+ex8/BbCrSOIHqHfm4+zKtxum+Cihik7+
         alvjAtl23yGeQSBIgQLGhqkIQjPGUN81pOJFT8NsfbKIPSjU+OMZARTiPVEz2ARez7+Y
         GiE2252IfTo4DfoTgZPue6REdapAS9S5j8bzHa8juYSivFKxCedcvdE/a1+O9IqTwno+
         L+m2oPmwPyWMGRvJbILsfhCJJj2jV2JVi7Mujp6m6gDPSIrdAML4DZ8FLqevzPHwnI5l
         SZZgxqxgdzfRDrKj6udhiXHAawHop+EIVFfuDnsnaQJ4G1saApO7ZwksR19tcRCiSBTw
         cULA==
X-Forwarded-Encrypted: i=1; AJvYcCVJqEmqzVcD4S9aGLP5VsOB7vhdfzEmbgWhtwHgplhE1SIBjDd+So3qaRGyXMsSf/TGiDTkLFcofYo=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzANhQYYNEZ/c7CE1pv8bHtFHS0RCiQymdvSKBOXWCxU1nJ6Whz
	T21r0Gsy0uADjk9SAs/xJ/Bk6mt1BnXIgyb6QcPJ2baIPxxZT1zz
X-Gm-Gg: ASbGncuSHTlt6BFGpuz1mVQhnGfHEiK8dK4ewG1PuNWO6ggQt7/veeManW7ySEtrCYi
	awmDe7y902FWkOpB/bFCV0DFyygb/gk8Fpr4CWt72OiLkfkNbw8u3j5pz2V6wfaDodRAPEjmaEQ
	7fJfk407s9HUo0mmxyOIyaLHx7Y/zgBWJ74KXg24G1a/HzUkxL9dSAZ3MMcWFuMWGGX5Y/KUjTN
	84HEUMCiF6nvIf1cMokujmuSafeYAyZfv2Gupz0WG93M/Xyo6i+yBh+VY6eRaEFKRj50fwEtWoY
	R4fs5/QrrUdI0uQ+8Xj29Ll6H7A9aQDSXw3bH9OGc0pQGi7rr/qc4ZcNoOIcC4027aQj8q0Ytkf
	q7RlU9qk264Fi78SA3ymgmt+/0xYlldA=
X-Google-Smtp-Source: AGHT+IHE3OSOSZVXLgq0eCk41BH1kExTywHaKR1ZggygKUNRXotxO3LrKlB4CW2Jn9ViP9wTlbJzxw==
X-Received: by 2002:a05:6402:518b:b0:5e6:44d9:57f7 with SMTP id 4fb4d7f45d1cf-5ed8ec1ea14mr3781304a12.26.1743091520648;
        Thu, 27 Mar 2025 09:05:20 -0700 (PDT)
Content-Type: multipart/alternative;
 boundary="------------pU8EYQMgbsmGwc04BHiJZTpU"
Message-ID: <5d34510a-2f31-4295-b42d-a4e035dd4559@gmail.com>
Date: Thu, 27 Mar 2025 17:05:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] CHANGELOG: Minimum toolchain requirements for x86 and
 ARM
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>
References: <20250327153725.401451-1-andrew.cooper3@citrix.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <20250327153725.401451-1-andrew.cooper3@citrix.com>

This is a multi-part message in MIME format.
--------------pU8EYQMgbsmGwc04BHiJZTpU
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 3/27/25 4:37 PM, Andrew Cooper wrote:
> Signed-off-by: Andrew Cooper<andrew.cooper3@citrix.com>
> ---
> CC: Anthony PERARD<anthony.perard@vates.tech>
> CC: Michal Orzel<michal.orzel@amd.com>
> CC: Jan Beulich<jbeulich@suse.com>
> CC: Julien Grall<julien@xen.org>
> CC: Roger Pau Monné<roger.pau@citrix.com>
> CC: Stefano Stabellini<sstabellini@kernel.org>
> CC: Oleksii Kurochko<oleksii.kurochko@gmail.com>
>
> v2:
>   * State x86 and ARM, rather than implying all architectures.
> ---
>   CHANGELOG.md | 3 +++
>   1 file changed, 3 insertions(+)
>
> diff --git a/CHANGELOG.md b/CHANGELOG.md
> index 35ab6749241c..8f6afa5c858a 100644
> --- a/CHANGELOG.md
> +++ b/CHANGELOG.md
> @@ -7,6 +7,9 @@ The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
>   ## [4.21.0 UNRELEASED](https://xenbits.xenproject.org/gitweb/?p=xen.git;a=shortlog;h=staging) - TBD
>   
>   ### Changed
> + - The minimum toolchain requirements have increased for some architectures:
> +   - For x86, GCC 5.1 and Binutils 2.25, or Clang/LLVM 11
> +   - For ARM32 and ARM64, GCC 5.1 and Binutils 2.25
>   
>   ### Added
>    - On x86:

LKGTM: Oleksii Kurochko<oleksii.kurochko@gmail.com>

Thanks.

~ Oleksii

--------------pU8EYQMgbsmGwc04BHiJZTpU
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
    <div class="moz-cite-prefix">On 3/27/25 4:37 PM, Andrew Cooper
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:20250327153725.401451-1-andrew.cooper3@citrix.com">
      <pre wrap="" class="moz-quote-pre">Signed-off-by: Andrew Cooper <a class="moz-txt-link-rfc2396E" href="mailto:andrew.cooper3@citrix.com">&lt;andrew.cooper3@citrix.com&gt;</a>
---
CC: Anthony PERARD <a class="moz-txt-link-rfc2396E" href="mailto:anthony.perard@vates.tech">&lt;anthony.perard@vates.tech&gt;</a>
CC: Michal Orzel <a class="moz-txt-link-rfc2396E" href="mailto:michal.orzel@amd.com">&lt;michal.orzel@amd.com&gt;</a>
CC: Jan Beulich <a class="moz-txt-link-rfc2396E" href="mailto:jbeulich@suse.com">&lt;jbeulich@suse.com&gt;</a>
CC: Julien Grall <a class="moz-txt-link-rfc2396E" href="mailto:julien@xen.org">&lt;julien@xen.org&gt;</a>
CC: Roger Pau Monné <a class="moz-txt-link-rfc2396E" href="mailto:roger.pau@citrix.com">&lt;roger.pau@citrix.com&gt;</a>
CC: Stefano Stabellini <a class="moz-txt-link-rfc2396E" href="mailto:sstabellini@kernel.org">&lt;sstabellini@kernel.org&gt;</a>
CC: Oleksii Kurochko <a class="moz-txt-link-rfc2396E" href="mailto:oleksii.kurochko@gmail.com">&lt;oleksii.kurochko@gmail.com&gt;</a>

v2:
 * State x86 and ARM, rather than implying all architectures.
---
 CHANGELOG.md | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/CHANGELOG.md b/CHANGELOG.md
index 35ab6749241c..8f6afa5c858a 100644
--- a/CHANGELOG.md
+++ b/CHANGELOG.md
@@ -7,6 +7,9 @@ The format is based on [Keep a Changelog](<a class="moz-txt-link-freetext" href="https://keepachangelog.com/en/1.0.0/">https://keepachangelog.com/en/1.0.0/</a>)
 ## [4.21.0 UNRELEASED](<a class="moz-txt-link-freetext" href="https://xenbits.xenproject.org/gitweb/?p=xen.git;a=shortlog;h=staging">https://xenbits.xenproject.org/gitweb/?p=xen.git;a=shortlog;h=staging</a>) - TBD
 
 ### Changed
+ - The minimum toolchain requirements have increased for some architectures:
+   - For x86, GCC 5.1 and Binutils 2.25, or Clang/LLVM 11
+   - For ARM32 and ARM64, GCC 5.1 and Binutils 2.25
 
 ### Added
  - On x86:
</pre>
    </blockquote>
    <pre>LKGTM: Oleksii Kurochko <a class="moz-txt-link-rfc2396E" href="mailto:oleksii.kurochko@gmail.com">&lt;oleksii.kurochko@gmail.com&gt;</a>

Thanks.

~ Oleksii
</pre>
  </body>
</html>

--------------pU8EYQMgbsmGwc04BHiJZTpU--

