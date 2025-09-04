Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 39992B43C45
	for <lists+xen-devel@lfdr.de>; Thu,  4 Sep 2025 14:59:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1110044.1459365 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uu9Xm-0003gr-VW; Thu, 04 Sep 2025 12:58:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1110044.1459365; Thu, 04 Sep 2025 12:58:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uu9Xm-0003eU-RV; Thu, 04 Sep 2025 12:58:26 +0000
Received: by outflank-mailman (input) for mailman id 1110044;
 Thu, 04 Sep 2025 12:58:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=iTa/=3P=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uu9Xl-0003eE-Q6
 for xen-devel@lists.xenproject.org; Thu, 04 Sep 2025 12:58:25 +0000
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [2a00:1450:4864:20::62f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d703a398-898e-11f0-9809-7dc792cee155;
 Thu, 04 Sep 2025 14:58:23 +0200 (CEST)
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-afeec747e60so182472766b.0
 for <xen-devel@lists.xenproject.org>; Thu, 04 Sep 2025 05:58:23 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b0424cc1698sm1038740866b.21.2025.09.04.05.58.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Sep 2025 05:58:22 -0700 (PDT)
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
X-Inumbo-ID: d703a398-898e-11f0-9809-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1756990703; x=1757595503; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ncs+StciXQshjJrmPuF0PSOBMkl7D6bmlZl6UnBxWtE=;
        b=DUbXo+kUt95PAJ17kEfdfz092Zw/QdzFrfDt9AJ4aMomB0g7P0En+ulrs4kNh0U3Qf
         JT1rzGSLikoakPcRO/whuxSsf+CeNLM2C+p+60nFx/vq+6J2N+RFURETHstYLjoCn3e7
         DyOYmDimZpTZg/hdDs0rs0+kKOLQnC3Ht9PdXaGcWhcpg3jOIYAvlsUbFpAE8rh2uzvV
         lHFzr7awdoVO9TpR9JNw7Msi9iUQmRldJUAfK20OkWphCUcSjUHUc7PuS2yu4UKna2bY
         OgpgMhTHbDXczuKWIjD2seQoiiOAnN10rNgtj+BlRvc7HoHcaF7Z7GWGjST1bLOf8ngS
         TD6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756990703; x=1757595503;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ncs+StciXQshjJrmPuF0PSOBMkl7D6bmlZl6UnBxWtE=;
        b=r8bfCuIYEBTYoMjaRvZtuz/2ksMs0V8yxsAMfbX4lAk3UjrNYwep3Oeu+Mtxvq24Tc
         XVaaMsqgiG0isIV7m4kjq5fvpvL5O+10nfyg8uXdk92lAJoOWJdXHWM8zBA0nwLsSgfr
         cSTij2ynR9EOLISS7CWRXgVQq7WyNnsuf3Kp2z4VjPyeNsZrO9APBQykfVLgbW5Gv3//
         /t5ulEQSu/5cOD8mvOB+pl7jKYjqsgZXxPlvWsY5F6Cjm93UBDprCi/uEsvM8agDW2ay
         lrW/HjFrENG/+MQOGjqM9O8uCx66bbcJ9G4ThRMfJf0JhjmnkKLd0rWBLtVlrrhcnpFA
         vP4w==
X-Forwarded-Encrypted: i=1; AJvYcCWHDcP8ZUHdc+i/aGOyDkOvLzBewk4QvTtNgw8cowc0G9ziYG2bxLdUr8VmB5ol9mgfrnOJnJ0HgYc=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxaAKfT0V0xTNrjry+yB1HuQjlsBppnBE86MGItn4nCOQ5VMQYG
	Wu7USL9cKrrlaoCQ45z+wQa5T3Kjai+S5Ief6nKANH3XJ4/GUJu4dVceFxkoe0BuiA==
X-Gm-Gg: ASbGnctdx23MRxWjjuuy51pLMDRJijH3VzPOyv50EhykiMXQLgfcUwutVfOnCneOSYG
	bGu7bLoyxtyg0qfa4JXPlc0MNxAi19YaZ+0r0JwfX2zKYkpDKsjS9wkNpjrkUwXKGxU+tfN0D3Q
	2YDHQOaBy/D00Y4HTY155dgMMD5gCa1cOxdMejBAp7LtOvRurKGjWWJ1c+rpHg6bEoi266Iqzy/
	ssQcYbcdcddUEFB2iGk1alKJudAS0LW/liUi1FEdyhUySX8ynqOj9CJJBRnt5rmrkVcNZSaOfc7
	AA6BBIr8AWfb5J8mpIbVN/KxtthmhvjnjwAzD5kXhNMVLwbMJDGsyFwjNMI7YPYGVfnIQEes0eN
	idDlgbAQYnegSMofcO4uklI2mU2kb7yRqEc60lRUCjy4rhbUfWUJ+2JQnXyLRSn3laYAbU3fUgS
	iudBifS2Q=
X-Google-Smtp-Source: AGHT+IGBgGarIys1DEkp2vb0GnrmMkNM15916guNksS18bEAE1VK1EibLG4Qpa157pepvTFC1/umzw==
X-Received: by 2002:a17:906:c114:b0:b04:79e1:a08e with SMTP id a640c23a62f3a-b0479e1a68amr351894466b.24.1756990702839;
        Thu, 04 Sep 2025 05:58:22 -0700 (PDT)
Message-ID: <488408be-4728-4666-89a5-ac5b438bdbf5@suse.com>
Date: Thu, 4 Sep 2025 14:58:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] Strip build path directories in tools and hypervisor
To: =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20250904114202.2722478-1-marmarek@invisiblethingslab.com>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
Autocrypt: addr=jbeulich@suse.com; keydata=
 xsDiBFk3nEQRBADAEaSw6zC/EJkiwGPXbWtPxl2xCdSoeepS07jW8UgcHNurfHvUzogEq5xk
 hu507c3BarVjyWCJOylMNR98Yd8VqD9UfmX0Hb8/BrA+Hl6/DB/eqGptrf4BSRwcZQM32aZK
 7Pj2XbGWIUrZrd70x1eAP9QE3P79Y2oLrsCgbZJfEwCgvz9JjGmQqQkRiTVzlZVCJYcyGGsD
 /0tbFCzD2h20ahe8rC1gbb3K3qk+LpBtvjBu1RY9drYk0NymiGbJWZgab6t1jM7sk2vuf0Py
 O9Hf9XBmK0uE9IgMaiCpc32XV9oASz6UJebwkX+zF2jG5I1BfnO9g7KlotcA/v5ClMjgo6Gl
 MDY4HxoSRu3i1cqqSDtVlt+AOVBJBACrZcnHAUSuCXBPy0jOlBhxPqRWv6ND4c9PH1xjQ3NP
 nxJuMBS8rnNg22uyfAgmBKNLpLgAGVRMZGaGoJObGf72s6TeIqKJo/LtggAS9qAUiuKVnygo
 3wjfkS9A3DRO+SpU7JqWdsveeIQyeyEJ/8PTowmSQLakF+3fote9ybzd880fSmFuIEJldWxp
 Y2ggPGpiZXVsaWNoQHN1c2UuY29tPsJgBBMRAgAgBQJZN5xEAhsDBgsJCAcDAgQVAggDBBYC
 AwECHgECF4AACgkQoDSui/t3IH4J+wCfQ5jHdEjCRHj23O/5ttg9r9OIruwAn3103WUITZee
 e7Sbg12UgcQ5lv7SzsFNBFk3nEQQCACCuTjCjFOUdi5Nm244F+78kLghRcin/awv+IrTcIWF
 hUpSs1Y91iQQ7KItirz5uwCPlwejSJDQJLIS+QtJHaXDXeV6NI0Uef1hP20+y8qydDiVkv6l
 IreXjTb7DvksRgJNvCkWtYnlS3mYvQ9NzS9PhyALWbXnH6sIJd2O9lKS1Mrfq+y0IXCP10eS
 FFGg+Av3IQeFatkJAyju0PPthyTqxSI4lZYuJVPknzgaeuJv/2NccrPvmeDg6Coe7ZIeQ8Yj
 t0ARxu2xytAkkLCel1Lz1WLmwLstV30g80nkgZf/wr+/BXJW/oIvRlonUkxv+IbBM3dX2OV8
 AmRv1ySWPTP7AAMFB/9PQK/VtlNUJvg8GXj9ootzrteGfVZVVT4XBJkfwBcpC/XcPzldjv+3
 HYudvpdNK3lLujXeA5fLOH+Z/G9WBc5pFVSMocI71I8bT8lIAzreg0WvkWg5V2WZsUMlnDL9
 mpwIGFhlbM3gfDMs7MPMu8YQRFVdUvtSpaAs8OFfGQ0ia3LGZcjA6Ik2+xcqscEJzNH+qh8V
 m5jjp28yZgaqTaRbg3M/+MTbMpicpZuqF4rnB0AQD12/3BNWDR6bmh+EkYSMcEIpQmBM51qM
 EKYTQGybRCjpnKHGOxG0rfFY1085mBDZCH5Kx0cl0HVJuQKC+dV2ZY5AqjcKwAxpE75MLFkr
 wkkEGBECAAkFAlk3nEQCGwwACgkQoDSui/t3IH7nnwCfcJWUDUFKdCsBH/E5d+0ZnMQi+G0A
 nAuWpQkjM1ASeQwSHEeAWPgskBQL
In-Reply-To: <20250904114202.2722478-1-marmarek@invisiblethingslab.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 04.09.2025 13:41, Marek Marczykowski-Górecki wrote:
> Use -fdebug-prefix-map in preference to -ffile-prefix-map, as it's
> available in earlier toolchain versions. But use it together with
> -fmacro-prefix-map (if available) for hypervisor build, otherwise it
> still contains some paths in out-of-tree builds.

I consider it wrong not to use -ffile-prefix-map when available. That
already covers more than "debug" and "macro", and it may gain further
functionality.

> The out of tree build requires -fdebug-prefix-map mapping for both source
> dir and object dir - otherwise the latter is included (2 occurrences) in
> xen-syms.

As indicated in a reply to Andrew on the thread hanging off of my
patch - I think whether to remove those wants to be left to the user.

> --- a/tools/Makefile
> +++ b/tools/Makefile
> @@ -1,4 +1,4 @@
> -XEN_ROOT = $(CURDIR)/..
> +XEN_ROOT = $(realpath $(CURDIR)/..)
>  
>  export PKG_CONFIG_DIR = $(CURDIR)/pkg-config
>  
> diff --git a/tools/Rules.mk b/tools/Rules.mk
> index 725c3c32e9a2..428fce094819 100644
> --- a/tools/Rules.mk
> +++ b/tools/Rules.mk
> @@ -166,6 +166,8 @@ endif
>  CFLAGS-$(CONFIG_X86_32) += $(call cc-option,$(CC),-mno-tls-direct-seg-refs)
>  CFLAGS += $(CFLAGS-y)
>  
> +$(call cc-option-add,CFLAGS,CC,-fdebug-prefix-map=$(realpath $(XEN_ROOT))=.)

Here and below - no need to use cc-option-add for -fdebug-prefix-map,
which all permissible compilers support.

Further, again as per reply to Andrew on the thread hanging off of my
patch - I don't view it as desirable to leave the tools/ prefix in
place, or e.g. for libraries, the entire tools/libs/<subdir>/ part.
Imo every binary should have only the path (if any) from its own source
root left. (And yes, how to deal with e.g. shared include files isn't
quite clear to me, yet. Maybe we actually need to pass two options.)

> --- a/xen/Makefile
> +++ b/xen/Makefile
> @@ -208,7 +208,7 @@ VPATH := $(srctree)
>  
>  export srctree objtree VPATH
>  
> -export XEN_ROOT := $(abs_srctree)/..
> +export XEN_ROOT := $(patsubst %/xen,%,$(abs_srctree))

Unlike for tools/, is this still needed here? You don't use XEN_ROOT below.

> @@ -412,6 +412,10 @@ ifneq ($(CONFIG_CC_IS_CLANG),y)
>  CFLAGS += -Wa,--strip-local-absolute
>  endif
>  
> +$(call cc-option-add,CFLAGS,CC,-fdebug-prefix-map=$(abs_objtree)=./xen)
> +$(call cc-option-add,CFLAGS,CC,-fdebug-prefix-map=$(abs_srctree)=./xen)
> +$(call cc-option-add,CFLAGS,CC,-fmacro-prefix-map=$(abs_srctree)=./xen)

I disagree with leaving any xen/ prefix there. That's not how in-tree builds
name files; everything there is relative to xen/.

I also don't really see a point in using . in the substitution (similarly
for the toolstack, but there I have less to say).

Finally, why pass two identical, possibly long options for in-tree builds
(where $(abs_objtree) == $(abs_srctree))?

Below I'll reproduce my own further re-worked patch. It's not quite ready
for v2 submission yet, I expect though. For example, the actual Kconfig
portion is still missing. Whether the @SRC@ and @BLD@ parts actually make
sense (or what to replace them by) I'm also unsure about. If nothing else
they may need replacing by plain .

Jan

build: avoid absolute paths in executables

For in-tree builds relative paths are used in most cases, whereas for out-
of-tree builds in various situations absolute ones come into play. The
extra paths can be long, wasting space and e.g. serial line bandwidth.
They would also get in the way of location-independent reproducible
builds. Leverage newer gcc's (and Clang's) ability to "remap" file names.
For older gcc fall back to using the option affecting debug info only.

For the few absolute paths appearing in in-tree builds' debug info, use
the generally available option, conditional upon a new Kconfig control

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
Of course we may want to consider putting this in the top-level Config.mk,
to also affect other sub-trees (presently mainly/only affecting debug
info, for which even gcc5 already supports -fdebug-prefix-remap=).

As to a Fixes: tag, I wasn't quite sure whether to "blame" the
introduction of out-of-tree builds.

Note that at least in the gcc5 I'm testing with the (limited) effect is
further undermined by the compiler emitting the specified command line
options into debug info, thus still leaving references to the absolute
directories in place.

For the mentioned gcc15 issue see
https://gcc.gnu.org/bugzilla/show_bug.cgi?id=121788.
---
v2: Use $(abs_srctree). Introduce DEBUG_INFO_REL_PATHS.

--- a/xen/Makefile
+++ b/xen/Makefile
@@ -461,7 +461,21 @@ CFLAGS += -flto
 LDFLAGS-$(CONFIG_CC_IS_CLANG) += -plugin LLVMgold.so
 endif
 
+CFLAGS-$(CONFIG_DEBUG_INFO_REL_PATHS) += -fdebug-prefix-map=$(abs_srctree)=@SRC@
+
 ifdef building_out_of_srctree
+    # Need to add to CFLAGS-y here, as gcc checks later options before earlier
+    # ones, and we want in particular the latter one(s) here to be checked
+    # first.
+    CFLAGS-$(CONFIG_DEBUG_INFO_REL_PATHS) += -fdebug-prefix-map=$(abs_objtree)=@BLD@
+    CFLAGS-y += $(call cc-option,$(CC),-ffile-prefix-map=$(abs_srctree)/=)
+    # While -ffile-prefix-map= implies -fdebug-prefix-map=, we need to use the
+    # latter explicitly: Up to at least gcc15 the compiler specs translate all
+    # -ffile-prefix-map= ahead of all -fdebug-prefix-map= when invoking the
+    # the assembler for *.S files, thus breaking our intended ordering.
+    # (Otherwise the option below could be passed as 3rd [fallback] argument to
+    # cc-option above.)
+    CFLAGS-y += -fdebug-prefix-map=$(abs_srctree)/=
     CFLAGS += -I$(objtree)/include
     CFLAGS += -I$(objtree)/arch/$(SRCARCH)/include
 endif


