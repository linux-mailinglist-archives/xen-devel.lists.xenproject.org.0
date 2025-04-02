Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B6F0A79094
	for <lists+xen-devel@lfdr.de>; Wed,  2 Apr 2025 16:01:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.935781.1337175 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tzyet-0001Yh-Ay; Wed, 02 Apr 2025 14:01:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 935781.1337175; Wed, 02 Apr 2025 14:01:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tzyet-0001W7-7Y; Wed, 02 Apr 2025 14:01:35 +0000
Received: by outflank-mailman (input) for mailman id 935781;
 Wed, 02 Apr 2025 14:01:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=T645=WU=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tzycb-0005kV-EA
 for xen-devel@lists.xenproject.org; Wed, 02 Apr 2025 13:59:13 +0000
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [2a00:1450:4864:20::430])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a81e1e25-0fca-11f0-9ea9-5ba50f476ded;
 Wed, 02 Apr 2025 15:59:12 +0200 (CEST)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-39129fc51f8so5089913f8f.0
 for <xen-devel@lists.xenproject.org>; Wed, 02 Apr 2025 06:59:12 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43eb5fc1b9esm21848495e9.6.2025.04.02.06.59.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Apr 2025 06:59:11 -0700 (PDT)
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
X-Inumbo-ID: a81e1e25-0fca-11f0-9ea9-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1743602352; x=1744207152; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=5qdZYmy9cJ905wD0Otv7PRiJxoIoH9X0sUdlDkKSKcA=;
        b=Y84pn2cUzi96+haxqMOfvcQY7hcJR0PF0zrCRwraalJ+MEplLMb8frXZcRK/q4dzFc
         tw7cC97ABu7LrHAzEf8g9+0EQqYOs+FP8zPykniT5E4+i98cowy0ApG0VtO4u0pZEnCj
         9C0TCQNjuem8Xw48wvReDPsifSTV8tQOSz8u4KUtJ70bUWWKjTsS0EBCyiLcDS2LImYb
         8mpCfiVz6dJrGMb3eL5hi4OtMHuAOCaXccwkZS06aH/1x+i/o6d7Amlqz/46kGTL6COE
         9UnvFBQ+r9oUQLtfh7Y/tpEz+2YLaDIDOfDBNwPEaVTwDQ6fFi1iE9Bf6KEkTaXb+2Ja
         y0IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743602352; x=1744207152;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5qdZYmy9cJ905wD0Otv7PRiJxoIoH9X0sUdlDkKSKcA=;
        b=PtZX41/oyzKO1g1ANTB5eFjtw/XH3FcES9gEr6NMbRd4kumjzqS47ImKriMX/Fbc9o
         sYWG3kPDFnhmUnOOBknzZzL2iSEn/A9o9bw7ymvRvE+ja75IDJKXT8FxOMMBgkvYXpu8
         62zlwt28aEcr2XtZEf1WQqSmRCdOLDh459hhnLG0/MIg5Sc+UtUiaHXqt1Rt99ykX+RI
         cvpO38D5JL3JwQaXIkCCLn5Bk5vGSH9wIAiBqFKEAArO1h8NT0mCHC5Gem/DnzJcYDZc
         c1BBti2zIQEGF8RHjTIZ8TgB9wVqjK2Wi16uPBENDnECVxxrHtApMCKX9jMuWSvW1KJC
         NDDA==
X-Gm-Message-State: AOJu0YxSqYn+daXVCW+mrtv+1d3f+h4v9+UB4oEAfqqswb9D1knFRYJm
	K7lfv03gVsQc+GrzGIaSU22XO3/VDYEerxqgFy3c0TkmkNkushGpIQ7zwqq/pyEJRjzV08Vw6PA
	=
X-Gm-Gg: ASbGnctJN7ekac4qFAv16DXnPuxeYtQKJj2o3AYjA21OoELJx+aScjnVUzDM83VBA9V
	Pj18AvxvblVdJpklMDjxBr7Fwup7k6mtnmTxtiol5WTKXmKqv6BkCMvq8UvH7HMOdtc6Sj9BRB4
	23HOZItYHNAUkZ2z4iByDwl0zhOk9GjBP0jFmztzQKwFp/2ej2BPfy0IHtkv1JO6/dI03u//mHf
	bVdzCIjYYl9xZ1+5U9vs7CrVxaXTOVb6xBGI3/xp8bBd25pHAFFS7ggxJZDzwlM+tEV0Bz8rcnj
	U0wKxDBQMliJ1Tp+425f5I7H+9t6nj03oZx4lkYNgc88JZqdB61sEpdsewH7ozd5r3f7DwO93Ll
	PVaS+uAhIE+mrZ7Z15p2ZBzMin4DGGg==
X-Google-Smtp-Source: AGHT+IHOd3wRqTHID5d6KPFa4btlsYknPWJ6RTcqPa2SHO6OnvcQROz0ypVVkXn5/L2ZVZwycctLHQ==
X-Received: by 2002:a05:6000:1862:b0:390:f6aa:4e7c with SMTP id ffacd0b85a97d-39c120e0bc1mr13767984f8f.28.1743602352238;
        Wed, 02 Apr 2025 06:59:12 -0700 (PDT)
Message-ID: <5a77bb51-22d1-4956-8e45-c2412c413766@suse.com>
Date: Wed, 2 Apr 2025 15:59:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v2 4/5] symbols: centralize and re-arrange $(all_symbols)
 calculation
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>
References: <ceef1876-8759-465c-9a74-309b6b92f773@suse.com>
Content-Language: en-US
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
In-Reply-To: <ceef1876-8759-465c-9a74-309b6b92f773@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

For one there's no need for each architecture to have the same logic.
Move to the root Makefile, also to calculate just once.

And then re-arrange to permit FAST_SYMBOL_LOOKUP to be independent of
LIVEPATCH, which may be useful in (at least) debugging.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
Likely syms-warn-dup-y wants to follow suit; it doesn't even have an Arm
counterpart right now.

--- a/xen/Makefile
+++ b/xen/Makefile
@@ -460,6 +460,10 @@ ALL_OBJS-$(CONFIG_CRYPTO) += crypto/buil
 
 ALL_LIBS-y                := lib/lib.a
 
+all-symbols-y :=
+all-symbols-$(CONFIG_LIVEPATCH) += --all-symbols
+all-symbols-$(CONFIG_FAST_SYMBOL_LOOKUP) += --sort-by-name
+
 include $(srctree)/arch/$(SRCARCH)/arch.mk
 
 # define new variables to avoid the ones defined in Config.mk
@@ -612,7 +616,8 @@ $(TARGET): outputmakefile asm-generic FO
 	$(Q)$(MAKE) $(build)=include all
 	$(Q)$(MAKE) $(build)=arch/$(SRCARCH) include
 	$(Q)$(MAKE) $(build)=. arch/$(SRCARCH)/include/asm/asm-offsets.h
-	$(Q)$(MAKE) $(build)=. MKRELOC=$(MKRELOC) 'ALL_OBJS=$(ALL_OBJS-y)' 'ALL_LIBS=$(ALL_LIBS-y)' $@
+	$(Q)$(MAKE) $(build)=. MKRELOC=$(MKRELOC) 'ALL_OBJS=$(ALL_OBJS-y)' \
+	            'ALL_LIBS=$(ALL_LIBS-y)' 'all_symbols=$(all-symbols-y)' $@
 
 SUBDIRS = xsm arch common crypto drivers lib test
 define all_sources
--- a/xen/arch/arm/Makefile
+++ b/xen/arch/arm/Makefile
@@ -81,15 +81,6 @@ ifneq ($(CONFIG_DTB_FILE),"")
 obj-y += dtb.o
 endif
 
-ifdef CONFIG_LIVEPATCH
-all_symbols = --all-symbols
-ifdef CONFIG_FAST_SYMBOL_LOOKUP
-all_symbols = --all-symbols --sort-by-name
-endif
-else
-all_symbols =
-endif
-
 $(TARGET): $(TARGET)-syms
 	$(OBJCOPY) -O binary -S $< $@
 ifeq ($(CONFIG_ARM_64),y)
--- a/xen/arch/x86/Makefile
+++ b/xen/arch/x86/Makefile
@@ -111,15 +111,6 @@ notes_phdrs = --notes
 endif
 endif
 
-ifdef CONFIG_LIVEPATCH
-all_symbols = --all-symbols
-ifdef CONFIG_FAST_SYMBOL_LOOKUP
-all_symbols = --all-symbols --sort-by-name
-endif
-else
-all_symbols =
-endif
-
 syms-warn-dup-y := --warn-dup
 syms-warn-dup-$(CONFIG_SUPPRESS_DUPLICATE_SYMBOL_WARNINGS) :=
 syms-warn-dup-$(CONFIG_ENFORCE_UNIQUE_SYMBOLS) := --error-dup


