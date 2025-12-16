Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 910D3CC3F84
	for <lists+xen-devel@lfdr.de>; Tue, 16 Dec 2025 16:34:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1188052.1509312 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vVX4O-00011W-AL; Tue, 16 Dec 2025 15:34:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1188052.1509312; Tue, 16 Dec 2025 15:34:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vVX4O-0000yP-6T; Tue, 16 Dec 2025 15:34:36 +0000
Received: by outflank-mailman (input) for mailman id 1188052;
 Tue, 16 Dec 2025 15:34:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=t3Kb=6W=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vVX4N-0000yE-3v
 for xen-devel@lists.xenproject.org; Tue, 16 Dec 2025 15:34:35 +0000
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [2a00:1450:4864:20::433])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b8808e10-da94-11f0-b15b-2bf370ae4941;
 Tue, 16 Dec 2025 16:34:33 +0100 (CET)
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-430fbb6012bso1877175f8f.1
 for <xen-devel@lists.xenproject.org>; Tue, 16 Dec 2025 07:34:33 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-430f280cf30sm22244277f8f.3.2025.12.16.07.34.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 16 Dec 2025 07:34:32 -0800 (PST)
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
X-Inumbo-ID: b8808e10-da94-11f0-b15b-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1765899273; x=1766504073; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jyDu0R0y4CDkRDP5L5H78hsWRDWuuN5pDC8niur8NqU=;
        b=W1E3pJ+e+fcQ0HxV/0XugWEOH+H5O/acOJUL+Dw87M/eQCL0Jmt1SqQmy4fMozKYtO
         pYY54WSzojpvY5UmD6rOG8YdQAnwRfdX3Fc7cYcQqwV/jl77cTBkVgK6tRvlw2Ku7R9C
         vQjff2CGmofiHx74ecvFMB4Extnq/rhP8XFMmaAYRl191ilX0no6TNpZy1d/xCsR0JH8
         wzD9ur6ofDhZOfxgrWG0U85Gbj3ld141XOofcRJfbqAkByuOZDEu0VDczwem/MIYqV40
         BJu1wIvP2RlSDfS/oyvGtPYS+zgPjYIZ3Hsva8eaXb7kgn6YWPHJ40dHneW05wUu04+n
         0LQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765899273; x=1766504073;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jyDu0R0y4CDkRDP5L5H78hsWRDWuuN5pDC8niur8NqU=;
        b=QYzxHfeXH8M/KH8rROSeBMrXpqXq+J5YEQqPY7Spmcp+As+78EGrAw8eYXvo4JOvpI
         pk4aazAXDGVGgtWsOe38143wwMNRjpwk11t4QAEm3GwBjczCwP+4dJvB482S36WBMM1l
         /DqbY3w3nw32Ron2NuvoYeQYBNVr4a2GEnjmMEM27uzMLMje0+0qcEFAPTEACpcHHEOC
         nMjoZK8kgzEhFQPpWCf6XWNUUjyecf7BJNIPWCAWANVf98gE9QENahGjYA4jFSdMh4Fu
         jpHa/j+L1BEaAUfHBtICFUIfoeMeNGfxjUgi1UayJhvsXQ1uG7RGTSg84vaM+Wbyt7a8
         FSYw==
X-Gm-Message-State: AOJu0YzcMkuDtAX3HfE5Iq3IgwtkEtlW04A0ygBtZyHVHk5jNfikoxgX
	yNvECIfYR2TgG5f21u/INZy8zUiOUZEl78u9w4718PwEz9NPkSbmblZP1eYo0hGNCJRgrzQUPzQ
	8Y0M=
X-Gm-Gg: AY/fxX4W16eE7xkpKwZ3PErECL0LNTA66J42Ku9CG/wt/3Y0i3neO25lDxDc7FACFdI
	ceMePUhPRALfWzRUExExJuLR3Cq+oOdS1qCVykEpQuWWnNoZIqLhR1ih/B3SfWTmMitetdLfG7W
	NS84BH6zQ9gMGcrkmKScay/QtV8RWdFY9q/Bpvy4T3urt8NRr/L8uDFGCB+q6qIFzv9Br/ahpBB
	Pl4xidzpow0Dj3HL6ohisfVrfbbG6682B+sJTW7efsXC/70zDuEkO6x9hrRcL+ktN/3l00QbzF9
	kGLKlaV6XTSAmpgPPYnZkX/2VjNeNs7ZST5Qljsy4+l3n14T2dMBREn7hYA5XFpBGVz2uUPFIt1
	PGAdLLZ/GCpinEAgtsh0wHY6ByUzipC3mlN3CexVkETCvemcKCyaZxhK2kzLO7afYdIEHo9lBZF
	eEbooV6Lyr80KpWFMuXBju6YwekdnmO3VG2cC3zQE1avFvZOC3SRHfafqUsb0tBeIYz+jBOe+34
	VfmtmhhMb+Pmw==
X-Google-Smtp-Source: AGHT+IHgzKOlvuGH7oSiMlgU6C9MhgTzDE/90ysOqJCszb1WGVRDV4uetG+4V22jNd+ncOlSMYumlw==
X-Received: by 2002:a05:6000:250c:b0:431:8f8:7f2e with SMTP id ffacd0b85a97d-43108f8814emr1840184f8f.33.1765899272872;
        Tue, 16 Dec 2025 07:34:32 -0800 (PST)
Message-ID: <0cdf924a-2e9b-4997-a01d-6d8b2f711104@suse.com>
Date: Tue, 16 Dec 2025 16:34:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] tools/fuzz: use vpath uniformly for access to hypervisor
 library code
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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

It's not quite clear why for libelf and the emulator we use symlink-ing,
while elsewhere we use vpath. Do so for these two as well, thus also
eliminating the need for custom -iquote options and custom cleaning.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
Of course for the emulator fuzzer we could go farther and use vpath also
for the references into the test harness dir as well as the core emulator
one.

--- a/tools/fuzz/libelf/Makefile
+++ b/tools/fuzz/libelf/Makefile
@@ -1,17 +1,15 @@
 XEN_ROOT = $(CURDIR)/../../..
 include $(XEN_ROOT)/tools/Rules.mk
 
+vpath %.c $(XEN_ROOT)/xen/common/libelf
+
 LIBELF_OBJS := libelf-tools.o libelf-loader.o libelf-dominfo.o
 
-CFLAGS += -iquote ../../../xen/common/libelf
 $(LIBELF_OBJS): CFLAGS += -Wno-pointer-sign
 $(LIBELF_OBJS): CFLAGS += -DFUZZ_NO_LIBXC $(CFLAGS_xeninclude)
 
 libelf-fuzzer.o: CFLAGS += $(CFLAGS_xeninclude)
 
-$(LIBELF_OBJS:.o=.c): libelf-%.c: ../../../xen/common/libelf/libelf-%.c FORCE
-	ln -nsf $< $@
-
 libelf.a: libelf-fuzzer.o $(LIBELF_OBJS)
 	$(AR) rc $@ $^
 
@@ -30,7 +28,7 @@ distclean: clean
 
 .PHONY: clean
 clean:
-	rm -f *.o .*.d *.a *-libelf-fuzzer $(LIBELF_OBJS:.o=.c)
+	rm -f *.o .*.d *.a *-libelf-fuzzer
 
 .PHONY: install
 install: all
--- a/tools/fuzz/x86_instruction_emulator/Makefile
+++ b/tools/fuzz/x86_instruction_emulator/Makefile
@@ -9,8 +9,7 @@ x86-insn-fuzz-all:
 endif
 
 # Add libx86 to the build
-%.c: $(XEN_ROOT)/xen/lib/x86/%.c FORCE
-	ln -nsf $< $@
+vpath %.c $(XEN_ROOT)/xen/lib/x86
 
 x86_emulate: FORCE
 	mkdir -p $@
@@ -25,7 +24,6 @@ x86_emulate/%.h: x86_emulate ;
 	ln -nsf $< $@
 
 CFLAGS += $(CFLAGS_xeninclude) -D__XEN_TOOLS__ -iquote .
-cpuid.o: CFLAGS += -iquote $(XEN_ROOT)/xen/lib/x86
 
 GCOV_FLAGS := --coverage
 %-cov.o: %.c
@@ -72,7 +70,7 @@ distclean: clean
 clean:
 	rm -f *.a *.o $(DEPS_RM) *.gcda *.gcno *.gcov
 	rm -f afl-harness afl-harness-cov libfuzzer-harness
-	rm -rf x86_emulate x86-emulate.c x86-emulate.h wrappers.c cpuid.c
+	rm -rf x86_emulate x86-emulate.c x86-emulate.h wrappers.c
 
 .PHONY: install
 install: all

