Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 93CD0CFE399
	for <lists+xen-devel@lfdr.de>; Wed, 07 Jan 2026 15:17:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1196745.1514482 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vdULQ-0004N6-LC; Wed, 07 Jan 2026 14:17:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1196745.1514482; Wed, 07 Jan 2026 14:17:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vdULQ-0004Le-I4; Wed, 07 Jan 2026 14:17:04 +0000
Received: by outflank-mailman (input) for mailman id 1196745;
 Wed, 07 Jan 2026 14:17:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=AUe7=7M=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vdULP-0004De-AP
 for xen-devel@lists.xenproject.org; Wed, 07 Jan 2026 14:17:03 +0000
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [2a00:1450:4864:20::332])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8936668f-ebd3-11f0-b15e-2bf370ae4941;
 Wed, 07 Jan 2026 15:17:02 +0100 (CET)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-47d182a8c6cso13309445e9.1
 for <xen-devel@lists.xenproject.org>; Wed, 07 Jan 2026 06:17:02 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47d7f68f686sm99574385e9.3.2026.01.07.06.17.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 07 Jan 2026 06:17:01 -0800 (PST)
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
X-Inumbo-ID: 8936668f-ebd3-11f0-b15e-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1767795422; x=1768400222; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=SnLheoEW/Yh1PkgGyXZklN/D8HIZT01TyPTA06JIXwo=;
        b=XTyQD8+Dh3Qa01ZuAkXOwPbEprxD5E3Kd7JWldEpRpYl2I7eGN1g95unrDElV6d7/j
         kCYYPQ0w0KfLcYtO93Mc169fpig+wwzlFaUCPoH+BW1Qq5CHvL0lE1Bejnniu+l4ntvc
         ObZa3K1NisqENEEdiNxvf06amvqE8mMy+xwomua/v0CRvqxdV+ekUP6D7pdAqmFqHKfv
         s5mSnS7cbTVeeX6FZRok8f1XeaxZZ9FDKlXZixH4l6lW9RIB999yd1tIOB31RLHA17l4
         Qf5i78mVGODtWInNJjBBj2MxiSQhKV0MDI4lcPfEy2MErYvMvmZlXmFXeyKcTdgGWrXw
         RIdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767795422; x=1768400222;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SnLheoEW/Yh1PkgGyXZklN/D8HIZT01TyPTA06JIXwo=;
        b=qFhyPkHGbZUBjAExGR12OqwX5KkjZicAeqOOPYjSlQVG9p4f5LQ0nS8m50O5f0YXlY
         8p66HZPWhe9IocVw7oREHJfpl4V7d7EoMiLp0CeA4czrdoT5iaYPKQjRc0qLvLOMGgUC
         F3jmqaB9+FubQ8cR/45OKoORB4LgHtu4Yr/MicS5kbnqjrEQUOe0a3m3GSbkwygNb0xM
         9GOjIpJeZf9X9pVtjzQdvs/mU9vnH1bYBFM8QJziWHWhVMDduZ7exZPmpED5j+4NraLG
         8K8gC5NuuUKhPQ58YDmzsKMZPfVhk4bVYt+Y0gb0+begIp+h3LEWaS/3h08MxOgdcsLn
         0nZQ==
X-Gm-Message-State: AOJu0YxD8rJ6pZ417RctCpR85Cd630oo4sZKosllYCvX0AeCNhruSIrs
	gTVlTy62riHC1GaobnGlnPo84W2JKpZuScWU13uMAGPE/OqEeaCfv6quuaxX26U3EgsBDqEi8Fv
	SNHE=
X-Gm-Gg: AY/fxX7rHwbpg5uNlGExmm904T1GkiHoDdHdsI5clb/hQPY1IcdCNHOatHNLmL6x+L0
	4namDBqy9wQb1qNYrM4Kj/fVb0NRMYqdcStNV3V8s4ctZS8I2R+ep5GZOOS9L5O9OHeOV8QqOfN
	oi5I45p9IDGfKxOx4voZ+lDoMqlyo5pzENqMGSzSDFz/g5gMquy9qpvoYX7lyYFT8ViJltarR61
	GYmTQb/mO9BdTBuLknApRxwdHy0289WanuOkpgfDtWpbM6V/sBinEP9NlVomEt+t45DRzjvEh63
	VogSQmOrI6piYNmZ3OEI0Xqkgtcx9HEyYJ2LszrDYncfs7g5dR9MgGxdMmCsa1duC1qhLNY+4FN
	qhxh9F1x2kKyvPqJHGC+RAwfRCEm5k5736VwjHSOQzm5oeDirnHT9/T4SQIY5vT1RVYmnUbdRDo
	BJ8UuRuiuZaGj4KC+7WjXYddSCF+lyhYlp2uMMPJsL/F2oyqsP4RcGg45WIMqLYBg4EIEZE8oYI
	cqHyhRnkUOfew==
X-Google-Smtp-Source: AGHT+IGCI7amaymcZdP7rEvrnNfioibzSU1rmbzl2BdIQYXYOc3pNz/MXDctUUt2rW1kjUO9JaL0bw==
X-Received: by 2002:a05:600c:3484:b0:479:2a0b:180d with SMTP id 5b1f17b1804b1-47d84b20fd7mr31986115e9.11.1767795421650;
        Wed, 07 Jan 2026 06:17:01 -0800 (PST)
Message-ID: <7c06bd5e-fad2-42cb-947f-6749f647b068@suse.com>
Date: Wed, 7 Jan 2026 15:17:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v2 1/2] x86/cpu-policy: move CPU policy library code
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <4bd68e41-e665-4992-9d3c-0086bb5195ef@suse.com>
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
In-Reply-To: <4bd68e41-e665-4992-9d3c-0086bb5195ef@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

... to a dedicated subdir of x86's private lib/ sub-tree.

For the CPU policy harnesses and libxenguest use $(lib-y) as set by the
new Makefile.common, whereas for the emulator harnesses stick to building
just cpuid.o for the time being.

Requested-by: Andrew Cooper <andrew.cooper3@citrix.com>
Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v2: New.
---
 tools/fuzz/cpu-policy/Makefile                     | 7 +++++--
 tools/fuzz/x86_instruction_emulator/Makefile       | 2 +-
 tools/libs/guest/Makefile.common                   | 7 +++++--
 tools/tests/cpu-policy/Makefile                    | 7 +++++--
 tools/tests/x86_emulator/Makefile                  | 2 +-
 xen/arch/x86/arch.mk                               | 1 +
 xen/arch/x86/lib/Makefile                          | 2 ++
 xen/arch/x86/lib/cpu-policy/Makefile               | 1 +
 xen/arch/x86/lib/cpu-policy/Makefile.common        | 3 +++
 xen/{lib/x86 => arch/x86/lib/cpu-policy}/cpuid.c   | 0
 xen/{lib/x86 => arch/x86/lib/cpu-policy}/msr.c     | 0
 xen/{lib/x86 => arch/x86/lib/cpu-policy}/policy.c  | 0
 xen/{lib/x86 => arch/x86/lib/cpu-policy}/private.h | 0
 xen/lib/Makefile                                   | 2 --
 xen/lib/x86/Makefile                               | 3 ---
 15 files changed, 24 insertions(+), 13 deletions(-)
 create mode 100644 xen/arch/x86/lib/cpu-policy/Makefile
 create mode 100644 xen/arch/x86/lib/cpu-policy/Makefile.common
 rename xen/{lib/x86 => arch/x86/lib/cpu-policy}/cpuid.c (100%)
 rename xen/{lib/x86 => arch/x86/lib/cpu-policy}/msr.c (100%)
 rename xen/{lib/x86 => arch/x86/lib/cpu-policy}/policy.c (100%)
 rename xen/{lib/x86 => arch/x86/lib/cpu-policy}/private.h (100%)
 delete mode 100644 xen/lib/x86/Makefile

diff --git a/tools/fuzz/cpu-policy/Makefile b/tools/fuzz/cpu-policy/Makefile
index 6e7743e0aa12..76ecf20e8dbd 100644
--- a/tools/fuzz/cpu-policy/Makefile
+++ b/tools/fuzz/cpu-policy/Makefile
@@ -20,9 +20,12 @@ install: all
 CFLAGS += $(CFLAGS_xeninclude) -D__XEN_TOOLS__
 CFLAGS += $(APPEND_CFLAGS) -Og
 
-vpath %.c ../../../xen/lib/x86
+vpath %.c $(XEN_ROOT)/xen/arch/x86/lib/cpu-policy
 
-afl-policy-fuzzer: afl-policy-fuzzer.o msr.o cpuid.o
+lib-y :=
+include $(XEN_ROOT)/xen/arch/x86/lib/cpu-policy/Makefile.common
+
+afl-policy-fuzzer: afl-policy-fuzzer.o $(lib-y)
 	$(CC) $(CFLAGS) $^ -o $@
 
 -include $(DEPS_INCLUDE)
diff --git a/tools/fuzz/x86_instruction_emulator/Makefile b/tools/fuzz/x86_instruction_emulator/Makefile
index d104b15f4fbf..4e4877a20322 100644
--- a/tools/fuzz/x86_instruction_emulator/Makefile
+++ b/tools/fuzz/x86_instruction_emulator/Makefile
@@ -21,7 +21,7 @@ vpath %.h ../../tests/x86_emulator
 CFLAGS += -iquote ../../tests/x86_emulator
 
 # Add libx86 to the build
-vpath %.c $(XEN_ROOT)/xen/lib/x86
+vpath %.c $(XEN_ROOT)/xen/arch/x86/lib/cpu-policy
 
 x86_emulate:
 	mkdir -p $@
diff --git a/tools/libs/guest/Makefile.common b/tools/libs/guest/Makefile.common
index a026a2f662b0..b928a4a246a9 100644
--- a/tools/libs/guest/Makefile.common
+++ b/tools/libs/guest/Makefile.common
@@ -33,9 +33,12 @@ LIBELF_OBJS += libelf-dominfo.o
 OBJS-y += $(LIBELF_OBJS)
 
 ifeq ($(CONFIG_X86),y) # Add libx86 to the build
-vpath %.c ../../../xen/lib/x86
+vpath %.c $(XEN_ROOT)/xen/arch/x86/lib/cpu-policy
 
-OBJS-y                 += cpuid.o msr.o policy.o
+lib-y :=
+include $(XEN_ROOT)/xen/arch/x86/lib/cpu-policy/Makefile.common
+
+OBJS-y                 += $(lib-y)
 endif
 
 # new domain builder
diff --git a/tools/tests/cpu-policy/Makefile b/tools/tests/cpu-policy/Makefile
index 24f87e2eca2a..d8e4d222f4e4 100644
--- a/tools/tests/cpu-policy/Makefile
+++ b/tools/tests/cpu-policy/Makefile
@@ -42,11 +42,14 @@ CFLAGS += $(APPEND_CFLAGS)
 
 LDFLAGS += $(APPEND_LDFLAGS)
 
-vpath %.c ../../../xen/lib/x86
+vpath %.c $(XEN_ROOT)/xen/arch/x86/lib/cpu-policy
+
+lib-y :=
+include $(XEN_ROOT)/xen/arch/x86/lib/cpu-policy/Makefile.common
 
 %.o: Makefile
 
-test-cpu-policy: test-cpu-policy.o msr.o cpuid.o policy.o
+test-cpu-policy: test-cpu-policy.o $(lib-y)
 	$(CC) $^ -o $@ $(LDFLAGS)
 
 -include $(DEPS_INCLUDE)
diff --git a/tools/tests/x86_emulator/Makefile b/tools/tests/x86_emulator/Makefile
index 376cfe244d1c..e18725d0c303 100644
--- a/tools/tests/x86_emulator/Makefile
+++ b/tools/tests/x86_emulator/Makefile
@@ -17,7 +17,7 @@ vpath x86_emulate/%.h $(XEN_ROOT)/xen/arch/x86
 HOSTCFLAGS += -iquote $(XEN_ROOT)/xen/arch/x86
 
 # Add libx86 to the build
-vpath %.c $(XEN_ROOT)/xen/lib/x86
+vpath %.c $(XEN_ROOT)/xen/arch/x86/lib/cpu-policy
 
 CFLAGS += $(CFLAGS_xeninclude)
 
diff --git a/xen/arch/x86/arch.mk b/xen/arch/x86/arch.mk
index 0203138a819a..be6c76d2934b 100644
--- a/xen/arch/x86/arch.mk
+++ b/xen/arch/x86/arch.mk
@@ -4,6 +4,7 @@
 export XEN_IMG_OFFSET := 0x200000
 
 ARCH_LIBS-y += arch/x86/lib/lib.a
+ALL_LIBS-y += arch/x86/lib/cpu-policy/lib.a
 
 CFLAGS += -DXEN_IMG_OFFSET=$(XEN_IMG_OFFSET)
 
diff --git a/xen/arch/x86/lib/Makefile b/xen/arch/x86/lib/Makefile
index b9a65c662a56..fe9a27187992 100644
--- a/xen/arch/x86/lib/Makefile
+++ b/xen/arch/x86/lib/Makefile
@@ -6,3 +6,5 @@ lib-y += generic-hweightl.o
 lib-y += memcpy.o
 lib-y += memset.o
 lib-y += scrub-page.o
+
+obj-y += cpu-policy/
diff --git a/xen/arch/x86/lib/cpu-policy/Makefile b/xen/arch/x86/lib/cpu-policy/Makefile
new file mode 100644
index 000000000000..b12cf7836d4c
--- /dev/null
+++ b/xen/arch/x86/lib/cpu-policy/Makefile
@@ -0,0 +1 @@
+include $(srcdir)/Makefile.common
diff --git a/xen/arch/x86/lib/cpu-policy/Makefile.common b/xen/arch/x86/lib/cpu-policy/Makefile.common
new file mode 100644
index 000000000000..35475af78048
--- /dev/null
+++ b/xen/arch/x86/lib/cpu-policy/Makefile.common
@@ -0,0 +1,3 @@
+lib-y += cpuid.o
+lib-y += msr.o
+lib-y += policy.o
diff --git a/xen/lib/x86/cpuid.c b/xen/arch/x86/lib/cpu-policy/cpuid.c
similarity index 100%
rename from xen/lib/x86/cpuid.c
rename to xen/arch/x86/lib/cpu-policy/cpuid.c
diff --git a/xen/lib/x86/msr.c b/xen/arch/x86/lib/cpu-policy/msr.c
similarity index 100%
rename from xen/lib/x86/msr.c
rename to xen/arch/x86/lib/cpu-policy/msr.c
diff --git a/xen/lib/x86/policy.c b/xen/arch/x86/lib/cpu-policy/policy.c
similarity index 100%
rename from xen/lib/x86/policy.c
rename to xen/arch/x86/lib/cpu-policy/policy.c
diff --git a/xen/lib/x86/private.h b/xen/arch/x86/lib/cpu-policy/private.h
similarity index 100%
rename from xen/lib/x86/private.h
rename to xen/arch/x86/lib/cpu-policy/private.h
diff --git a/xen/lib/Makefile b/xen/lib/Makefile
index efca830d924c..850efeb4c570 100644
--- a/xen/lib/Makefile
+++ b/xen/lib/Makefile
@@ -1,5 +1,3 @@
-obj-$(CONFIG_X86) += x86/
-
 lib-y += bsearch.o
 lib-y += ctors.o
 lib-y += ctype.o
diff --git a/xen/lib/x86/Makefile b/xen/lib/x86/Makefile
deleted file mode 100644
index 780ea05db158..000000000000
--- a/xen/lib/x86/Makefile
+++ /dev/null
@@ -1,3 +0,0 @@
-obj-y += cpuid.o
-obj-y += msr.o
-obj-y += policy.o


