Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 98FC4A736F9
	for <lists+xen-devel@lfdr.de>; Thu, 27 Mar 2025 17:37:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.929763.1332512 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1txqEk-0000oW-MQ; Thu, 27 Mar 2025 16:37:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 929763.1332512; Thu, 27 Mar 2025 16:37:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1txqEk-0000mQ-IH; Thu, 27 Mar 2025 16:37:46 +0000
Received: by outflank-mailman (input) for mailman id 929763;
 Thu, 27 Mar 2025 16:37:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Eznr=WO=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1txqEj-0000mK-Qf
 for xen-devel@lists.xenproject.org; Thu, 27 Mar 2025 16:37:45 +0000
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [2a00:1450:4864:20::530])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cf2859e3-0b29-11f0-9ea3-5ba50f476ded;
 Thu, 27 Mar 2025 17:37:44 +0100 (CET)
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-5dccaaca646so2279330a12.0
 for <xen-devel@lists.xenproject.org>; Thu, 27 Mar 2025 09:37:44 -0700 (PDT)
Received: from [192.168.1.5] (user-109-243-64-225.play-internet.pl.
 [109.243.64.225]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5edc17e0704sm40622a12.66.2025.03.27.09.37.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Mar 2025 09:37:43 -0700 (PDT)
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
X-Inumbo-ID: cf2859e3-0b29-11f0-9ea3-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743093464; x=1743698264; darn=lists.xenproject.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WpUu7g2gox+aEKkf2BsTiXiwxDGikVtv1LKxKBcEw4c=;
        b=NfNqUpSphH+8wtWV4/5N/KHvRFPSKOTsxjtvIfIZpr2DXvtCbn/1zRWokO5MSSWJOZ
         ulSl7tXrr7ei67XhqTxygBN6FCiqQFt7tOZKvEvlK+6rL+aGpk7agbWfP4ei+d0bV+FM
         FJOuCjBxB3uJHP2MYMnCWcFC19QcRGyY4/Iy3ukMENKCkhPPWj8TpmLvsdBYUdLi3Pxz
         G7UPLeCe2RQsZoX4GrjlD+lJzsgIJ4AQ89eJv4JCvqJU6Tlcybju/Ao3F1LHSMVQ5w44
         P/6BfCSl3DyjJolmvrkv46z5ssIjPPl+TI+3ApNkpoZpkErQ2V9LSLKVubjZJJeCsCBd
         64HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743093464; x=1743698264;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=WpUu7g2gox+aEKkf2BsTiXiwxDGikVtv1LKxKBcEw4c=;
        b=KKOIkqDgUMgintjGad9XciSGkhE0VpDzPmh/ApTmj4tbP1uE9vwsH19Kwcgz9SzTtm
         KQ3TCNd9NHmuWR4noJN3z/SNqCaVptg9KpidJcQvgj+FFn/+pUW+Tn06tWw4W5x9AlCu
         2GM1GNYDjluKwKa4Hqx+Etl3hl7vuwI+rbz2JC/D/XkLY9KsEz04VgJY8uMtAle419X3
         RupYPe3Sz7+ikT49XgVOq3+yLeUQ/MaTHwE7gN21PHUCXCaMavFTDGKS3O17TH3j2vII
         9lZSzVkAVVz6C4SBjsxRbnxCHESE9udRo5fqudSaC0O3YMZgrAOJ6ofVsZpOV3zrYyoM
         wJiA==
X-Forwarded-Encrypted: i=1; AJvYcCXoK8Rs+kpq16sF5hk0rLYA4rd7lzI5vuqRI3ipOq5eQ0VVdhsbTFgHRQLYC6lC0cywuCSOmTGFgrU=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzoCNopLEm+cL4YTWIkl10GTACzXvXMlwfSTFVScVMesTtTFZ0U
	17GEx7Nw29XbTaYLa34NA4l7x2/xRyTx0CyGmoqSlwKMs6twOJww
X-Gm-Gg: ASbGncu5Rul8cckZ/1ohJP8AWNZgjJ+6kWiawij7z58E2JXHmuKfrPMonneY6D1G76f
	VmkxCi3SxtnqiPaD7QmELBqg6seVNMOLwapJz/mNmadySgwU0xFYJgzYXWJ1JShu/TSc47Pr5Sf
	pFNadopDuVL6lcHGQ+abv06THROkViW9CGaoRQ47N0XQddlgf8hDPzrRCCpAJpwv13BCh/1Ct3z
	tE1g5e48ubbjvqHXBZXdmdPsa6LImKG4f/rNc57oAMkA3ZjiOY2biQyq0ZRO0+cJtXKlAP+/EHy
	5SO3rmLmDvcy0aD0Nsr+uzcNq5I8BKkS29kOjG2IlXsT0Dof4NMr7S2pKcdUfmqZQOUbgdp+QhM
	Nts7fHEH39DpWBRBsKs+X
X-Google-Smtp-Source: AGHT+IEpxAjU1UuPDfOon0eiJfSMKIAarthaYzP6vko3LF+A3BXObP6pzG2Wlt+4pBzEM7nR3QgJYw==
X-Received: by 2002:a05:6402:520c:b0:5e0:752a:1c7c with SMTP id 4fb4d7f45d1cf-5edbf30607fmr912653a12.1.1743093463796;
        Thu, 27 Mar 2025 09:37:43 -0700 (PDT)
Content-Type: multipart/alternative;
 boundary="------------BnFoJDXs0yQQDiNVMmI2hJdr"
Message-ID: <5dcde3f5-efcb-42a3-9281-886ce4d80fc4@gmail.com>
Date: Thu, 27 Mar 2025 17:37:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] Xen: Update compiler checks
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>
References: <20250327163114.405824-1-andrew.cooper3@citrix.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <20250327163114.405824-1-andrew.cooper3@citrix.com>

This is a multi-part message in MIME format.
--------------BnFoJDXs0yQQDiNVMmI2hJdr
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 3/27/25 5:31 PM, Andrew Cooper wrote:
> We have checks in both xen/compiler.h, and Config.mk.  Both are incomplete.
> Remove the one from compiler.h, as it's pointless to perform in addition to
> the xen.git-wide one as well.
>
> Expand the checks to cover RISCV wanting GCC 11.1, and to cover Clang on x86.

Why GCC 11.1 for RISC-V? We declared in ./README that 12.2.

~ Oleksii

>
> PPC still is unspecified, and inherits the GCC 5.1 global baseline.
>
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
>   * Change to altering Config.mk
>
> https://gitlab.com/xen-project/people/andyhhp/xen/-/pipelines/1738628602 with
> the CI changes reverted, so as to expect failures for CentOS 7 and earlier
> Ubuntu Clangs.
>
> The $(eval $(check-y)) is badly positioned:
>
>    xen.git/xen$ make
>    *** FATAL BUILD ERROR: Xen requires at least GCC 0x150100
>    *** FATAL BUILD ERROR: Xen requires at least GCC 0x150100
>    *** FATAL BUILD ERROR: Xen requires at least GCC 0x150100
>    *** FATAL BUILD ERROR: Xen requires at least GCC 0x150100
>    *** FATAL BUILD ERROR: Xen requires at least GCC 0x150100
>    *** FATAL BUILD ERROR: Xen requires at least GCC 0x150100
>    *** FATAL BUILD ERROR: Xen requires at least GCC 0x150100
>    *** FATAL BUILD ERROR: Xen requires at least GCC 0x150100
>    *** FATAL BUILD ERROR: Xen requires at least GCC 0x150100
>    *** FATAL BUILD ERROR: Xen requires at least GCC 0x150100
>    *** FATAL BUILD ERROR: Xen requires at least GCC 0x150100
>    *** FATAL BUILD ERROR: Xen requires at least GCC 0x150100
>    *** FATAL BUILD ERROR: Xen requires at least GCC 0x150100
>    *** FATAL BUILD ERROR: Xen requires at least GCC 0x150100
>    *** FATAL BUILD ERROR: Xen requires at least GCC 0x150100
>      HOSTCC  tools/fixdep
>    *** FATAL BUILD ERROR: Xen requires at least GCC 0x150100
>    make[1]: *** [scripts/Makefile.host:108: tools/fixdep] Error 1
>      HOSTCC  tools/symbols
>    *** FATAL BUILD ERROR: Xen requires at least GCC 0x150100
>    make[1]: *** [scripts/Makefile.host:108: tools/symbols] Error 1
>    make: *** [Makefile:610: xen] Error 2
>
> It is involved every time Config.mk is included, rather than once per `make`
> invocation.
> ---
>   Config.mk                  | 14 ++++++++++++--
>   xen/include/xen/compiler.h | 14 --------------
>   2 files changed, 12 insertions(+), 16 deletions(-)
>
> diff --git a/Config.mk b/Config.mk
> index 8a73f3da62b4..a9d62fc10cfa 100644
> --- a/Config.mk
> +++ b/Config.mk
> @@ -125,8 +125,18 @@ define cc-ver-check-closure
>       endif
>   endef
>   
> -# Require GCC v4.1+
> -check-$(gcc) = $(call cc-ver-check,CC,0x040100,"Xen requires at least gcc-4.1")
> +# Minimum GCC version: 5.1, except for RISCV which needs 11.1
> +ifeq ($(XEN_TARGET_ARCH),riscv64)
> +check-$(gcc) = $(call cc-ver-check,CC,0x110100,"Xen requires at least GCC 11.1")
> +else
> +check-$(gcc) = $(call cc-ver-check,CC,0x050100,"Xen requires at least GCC 5.1")
> +endif
> +
> +# Minimum Clang version: 11, x86 only
> +ifeq ($(XEN_TARGET_ARCH),x86_64)
> +check-$(clang) = $(call cc-ver-check,CC,0x110000,"Xen requires at least Clang 11")
> +endif
> +
>   $(eval $(check-y))
>   
>   ld-ver-build-id = $(shell $(1) --build-id 2>&1 | \
> diff --git a/xen/include/xen/compiler.h b/xen/include/xen/compiler.h
> index 636a85bc417d..43b666133a92 100644
> --- a/xen/include/xen/compiler.h
> +++ b/xen/include/xen/compiler.h
> @@ -1,20 +1,6 @@
>   #ifndef __LINUX_COMPILER_H
>   #define __LINUX_COMPILER_H
>   
> -#if !defined(__GNUC__) || (__GNUC__ < 4)
> -#error Sorry, your compiler is too old/not recognized.
> -#elif CONFIG_CC_IS_GCC
> -# if defined(CONFIG_ARM_32) && CONFIG_GCC_VERSION < 40900
> -#  error Sorry, your version of GCC is too old - please use 4.9 or newer.
> -# elif defined(CONFIG_ARM_64) && CONFIG_GCC_VERSION < 50100
> -/*
> - *https://gcc.gnu.org/bugzilla/show_bug.cgi?id=63293
> - *https://lore.kernel.org/r/20210107111841.GN1551@shell.armlinux.org.uk
> - */
> -#  error Sorry, your version of GCC is too old - please use 5.1 or newer.
> -# endif
> -#endif
> -
>   #ifdef CONFIG_CC_HAS_VISIBILITY_ATTRIBUTE
>   /* Results in more efficient PIC code (no indirections through GOT or PLT). */
>   #pragma GCC visibility push(hidden)
--------------BnFoJDXs0yQQDiNVMmI2hJdr
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
    <div class="moz-cite-prefix">On 3/27/25 5:31 PM, Andrew Cooper
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:20250327163114.405824-1-andrew.cooper3@citrix.com">
      <pre wrap="" class="moz-quote-pre">We have checks in both xen/compiler.h, and Config.mk.  Both are incomplete.
Remove the one from compiler.h, as it's pointless to perform in addition to
the xen.git-wide one as well.

Expand the checks to cover RISCV wanting GCC 11.1, and to cover Clang on x86.</pre>
    </blockquote>
    <pre>Why GCC 11.1 for RISC-V? We declared in ./README that 12.2.

~ Oleksii
</pre>
    <blockquote type="cite"
      cite="mid:20250327163114.405824-1-andrew.cooper3@citrix.com">
      <pre wrap="" class="moz-quote-pre">

PPC still is unspecified, and inherits the GCC 5.1 global baseline.

Signed-off-by: Andrew Cooper <a class="moz-txt-link-rfc2396E" href="mailto:andrew.cooper3@citrix.com">&lt;andrew.cooper3@citrix.com&gt;</a>
---
CC: Anthony PERARD <a class="moz-txt-link-rfc2396E" href="mailto:anthony.perard@vates.tech">&lt;anthony.perard@vates.tech&gt;</a>
CC: Michal Orzel <a class="moz-txt-link-rfc2396E" href="mailto:michal.orzel@amd.com">&lt;michal.orzel@amd.com&gt;</a>
CC: Jan Beulich <a class="moz-txt-link-rfc2396E" href="mailto:jbeulich@suse.com">&lt;jbeulich@suse.com&gt;</a>
CC: Julien Grall <a class="moz-txt-link-rfc2396E" href="mailto:julien@xen.org">&lt;julien@xen.org&gt;</a>
CC: Roger Pau Monné <a class="moz-txt-link-rfc2396E" href="mailto:roger.pau@citrix.com">&lt;roger.pau@citrix.com&gt;</a>
CC: Stefano Stabellini <a class="moz-txt-link-rfc2396E" href="mailto:sstabellini@kernel.org">&lt;sstabellini@kernel.org&gt;</a>
CC: Oleksii Kurochko <a class="moz-txt-link-rfc2396E" href="mailto:oleksii.kurochko@gmail.com">&lt;oleksii.kurochko@gmail.com&gt;</a>

v2:
 * Change to altering Config.mk

<a class="moz-txt-link-freetext" href="https://gitlab.com/xen-project/people/andyhhp/xen/-/pipelines/1738628602">https://gitlab.com/xen-project/people/andyhhp/xen/-/pipelines/1738628602</a> with
the CI changes reverted, so as to expect failures for CentOS 7 and earlier
Ubuntu Clangs.

The $(eval $(check-y)) is badly positioned:

  xen.git/xen$ make
  *** FATAL BUILD ERROR: Xen requires at least GCC 0x150100
  *** FATAL BUILD ERROR: Xen requires at least GCC 0x150100
  *** FATAL BUILD ERROR: Xen requires at least GCC 0x150100
  *** FATAL BUILD ERROR: Xen requires at least GCC 0x150100
  *** FATAL BUILD ERROR: Xen requires at least GCC 0x150100
  *** FATAL BUILD ERROR: Xen requires at least GCC 0x150100
  *** FATAL BUILD ERROR: Xen requires at least GCC 0x150100
  *** FATAL BUILD ERROR: Xen requires at least GCC 0x150100
  *** FATAL BUILD ERROR: Xen requires at least GCC 0x150100
  *** FATAL BUILD ERROR: Xen requires at least GCC 0x150100
  *** FATAL BUILD ERROR: Xen requires at least GCC 0x150100
  *** FATAL BUILD ERROR: Xen requires at least GCC 0x150100
  *** FATAL BUILD ERROR: Xen requires at least GCC 0x150100
  *** FATAL BUILD ERROR: Xen requires at least GCC 0x150100
  *** FATAL BUILD ERROR: Xen requires at least GCC 0x150100
    HOSTCC  tools/fixdep
  *** FATAL BUILD ERROR: Xen requires at least GCC 0x150100
  make[1]: *** [scripts/Makefile.host:108: tools/fixdep] Error 1
    HOSTCC  tools/symbols
  *** FATAL BUILD ERROR: Xen requires at least GCC 0x150100
  make[1]: *** [scripts/Makefile.host:108: tools/symbols] Error 1
  make: *** [Makefile:610: xen] Error 2

It is involved every time Config.mk is included, rather than once per `make`
invocation.
---
 Config.mk                  | 14 ++++++++++++--
 xen/include/xen/compiler.h | 14 --------------
 2 files changed, 12 insertions(+), 16 deletions(-)

diff --git a/Config.mk b/Config.mk
index 8a73f3da62b4..a9d62fc10cfa 100644
--- a/Config.mk
+++ b/Config.mk
@@ -125,8 +125,18 @@ define cc-ver-check-closure
     endif
 endef
 
-# Require GCC v4.1+
-check-$(gcc) = $(call cc-ver-check,CC,0x040100,"Xen requires at least gcc-4.1")
+# Minimum GCC version: 5.1, except for RISCV which needs 11.1
+ifeq ($(XEN_TARGET_ARCH),riscv64)
+check-$(gcc) = $(call cc-ver-check,CC,0x110100,"Xen requires at least GCC 11.1")
+else
+check-$(gcc) = $(call cc-ver-check,CC,0x050100,"Xen requires at least GCC 5.1")
+endif
+
+# Minimum Clang version: 11, x86 only
+ifeq ($(XEN_TARGET_ARCH),x86_64)
+check-$(clang) = $(call cc-ver-check,CC,0x110000,"Xen requires at least Clang 11")
+endif
+
 $(eval $(check-y))
 
 ld-ver-build-id = $(shell $(1) --build-id 2&gt;&amp;1 | \
diff --git a/xen/include/xen/compiler.h b/xen/include/xen/compiler.h
index 636a85bc417d..43b666133a92 100644
--- a/xen/include/xen/compiler.h
+++ b/xen/include/xen/compiler.h
@@ -1,20 +1,6 @@
 #ifndef __LINUX_COMPILER_H
 #define __LINUX_COMPILER_H
 
-#if !defined(__GNUC__) || (__GNUC__ &lt; 4)
-#error Sorry, your compiler is too old/not recognized.
-#elif CONFIG_CC_IS_GCC
-# if defined(CONFIG_ARM_32) &amp;&amp; CONFIG_GCC_VERSION &lt; 40900
-#  error Sorry, your version of GCC is too old - please use 4.9 or newer.
-# elif defined(CONFIG_ARM_64) &amp;&amp; CONFIG_GCC_VERSION &lt; 50100
-/*
- * <a class="moz-txt-link-freetext" href="https://gcc.gnu.org/bugzilla/show_bug.cgi?id=63293">https://gcc.gnu.org/bugzilla/show_bug.cgi?id=63293</a>
- * <a class="moz-txt-link-freetext" href="https://lore.kernel.org/r/20210107111841.GN1551@shell.armlinux.org.uk">https://lore.kernel.org/r/20210107111841.GN1551@shell.armlinux.org.uk</a>
- */
-#  error Sorry, your version of GCC is too old - please use 5.1 or newer.
-# endif
-#endif
-
 #ifdef CONFIG_CC_HAS_VISIBILITY_ATTRIBUTE
 /* Results in more efficient PIC code (no indirections through GOT or PLT). */
 #pragma GCC visibility push(hidden)
</pre>
    </blockquote>
  </body>
</html>

--------------BnFoJDXs0yQQDiNVMmI2hJdr--

