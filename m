Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DD34CCB838
	for <lists+xen-devel@lfdr.de>; Thu, 18 Dec 2025 11:59:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1189437.1510187 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vWBjC-0008Rb-CP; Thu, 18 Dec 2025 10:59:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1189437.1510187; Thu, 18 Dec 2025 10:59:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vWBjC-0008OX-9Y; Thu, 18 Dec 2025 10:59:26 +0000
Received: by outflank-mailman (input) for mailman id 1189437;
 Thu, 18 Dec 2025 10:59:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=rjMb=6Y=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vWBjB-0008OJ-AZ
 for xen-devel@lists.xenproject.org; Thu, 18 Dec 2025 10:59:25 +0000
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [2a00:1450:4864:20::336])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9caabaac-dc00-11f0-b15b-2bf370ae4941;
 Thu, 18 Dec 2025 11:59:23 +0100 (CET)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-47774d3536dso4131015e9.0
 for <xen-devel@lists.xenproject.org>; Thu, 18 Dec 2025 02:59:23 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4324498f95asm4420281f8f.22.2025.12.18.02.59.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 18 Dec 2025 02:59:23 -0800 (PST)
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
X-Inumbo-ID: 9caabaac-dc00-11f0-b15b-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1766055563; x=1766660363; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=BXy80KxmNAHr1VNz3GxIhKBmxQj+zVGkXXH4ZO7kVPc=;
        b=YWRQ0eRylZ5hJTX7BaBTxsJgMJ39NwDy/gSUZFNqbMXDOjCqL+36mbDEKXXBYOIzVB
         L0PcOvJYNlYqBUtU8yqOViSFepZbMqQOnM+DeuME5DnLdYpHEicrOWgBNRT6AYIZ3Oeo
         pj8cIoRS+rcaPVTYZC/mR2X70AckdT82t+gRtE+nHtXNh705bhNLZVscpbFeji2J+z8p
         3K2PSwCr4SD0koLY0RTGDdn1qRLxw8ymwU3edr3sDtaiF8MJMGX4Ty8VSHy+X1xEJAZz
         YmE6+4qWqdxz+J7ZVPWdo1ClsAfcnWgPIh+rwMSZlkuawzQ/FWZoTZg5JhWmC+NoOWJN
         pvVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766055563; x=1766660363;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BXy80KxmNAHr1VNz3GxIhKBmxQj+zVGkXXH4ZO7kVPc=;
        b=dt21IpdUAmog2ReJjWY1ZC/ityyGnFiIF+n62YfpTJrSh032weWJ3pu2J4p2gQCxgp
         Q52PnHLqKicDJRMJ+QSCGuCK70YhwRIwgHku6reNce0trjS7xRaZgheDIs6nZUf/vOz1
         hygkXfYy4CBeyZGhUwDTCG+mABBoVp8x2mRl1DKr3+qrt43VvJbGX0a76yY6Vd81tT2u
         tNNDz5ew4eqPk4MEn7YoaIY9Oou8qVe1Uj0Ft4aECiMP2VSPD9mJX2ib8CNxq5/sLQPp
         JC74SKrLrDbRhupAGgAnYPxBSU8RIVz4u8sRvPzQkKWej0ab09MsFvzBDs7b567znGnV
         II1A==
X-Gm-Message-State: AOJu0YwOMRB0Co67lgP6lA6y32CWFbE8ma0zVcAqwBzZqiih5fg2d+rA
	ix9qEs/dbymXw1UviotuCOFZAR9ean9TICK6uG/8rhf4FiwrcLxzA7HmIoDD1avepZFrkwI0HZk
	u8rI=
X-Gm-Gg: AY/fxX6E8GtBzAhJR8ukwP9zJ1OeBCFjQJBtZU1iy1QZn5dAauKF8lWOgFbUkHzZGz2
	ayeS3u7X/QW9fTKOjW6Jb3mp6NmDy0ey7lHE6o7mTzMsVC8VXPqLLqO4FPlZPFKdwHnI+X8KVjj
	CK4p7Bqhbit4frX0OOhk8Y4JqjWdGT40yCrvdrFgh/a5QmmnFHphleyfvG5snUJ4Z2OMDc8qFTO
	juTfbyyAhaA+0T+/LSWiJR7dSCkIGGWOpb3mat6KSZHexsNXn1KRLfpGgcMW1XZmGXZcNu8eDBd
	JXCANU561yRF1hpqbUyVKsGm7q/1Y8Sj6gvS6MPsBZADL0IiqiRDtI5VghdhgZYZK7a+BrVPgdg
	G+6CsV1esrRjiVtYATxMebbfGU6G0zpziqP68nxc1zja3Lw+CZzP1BwuJo8D3dokq/Q185q9rFL
	8ZlPxSl1O3GaCAqruRgp3brMItepzX+trZrIoxnKfjs9EN5Mf0b10Z3VAepy8Z3JfGDLuivUh1s
	NI=
X-Google-Smtp-Source: AGHT+IFiwc/EwUNKeDcHhfdE1D1x7NjkF8HgnuN9lp1ZfYQq3ua5MCenvqxGmoBFkQbCcvhrjhpRpA==
X-Received: by 2002:a05:600c:4e42:b0:477:a219:cdc3 with SMTP id 5b1f17b1804b1-47be29d7cf4mr22421255e9.12.1766055563196;
        Thu, 18 Dec 2025 02:59:23 -0800 (PST)
Message-ID: <5704d0a6-4428-4930-81a4-5f9504168011@suse.com>
Date: Thu, 18 Dec 2025 11:59:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH 2/2] x86emul/fuzz: use vpath uniformly for access to code
 living elsewhere
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>
References: <4c2a53b1-7133-4900-8bc8-26fc97aa1702@suse.com>
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
In-Reply-To: <4c2a53b1-7133-4900-8bc8-26fc97aa1702@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Replace the remaining symlink-ing (of test harness and core emulator
files) as well, to avoid mixing approaches. This way various explicit
dependencies can also go away.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/tools/fuzz/x86_instruction_emulator/Makefile
+++ b/tools/fuzz/x86_instruction_emulator/Makefile
@@ -8,22 +8,23 @@ else
 x86-insn-fuzz-all:
 endif
 
+CFLAGS += $(CFLAGS_xeninclude) -D__XEN_TOOLS__
+
+# Add the core emulator to the build
+vpath x86_emulate/%.c $(XEN_ROOT)/xen/arch/x86
+vpath x86_emulate/%.h $(XEN_ROOT)/xen/arch/x86
+CFLAGS += -iquote $(XEN_ROOT)/xen/arch/x86
+
+# Add the emulator test harness to the build
+vpath %.c ../../tests/x86_emulator
+vpath %.h ../../tests/x86_emulator
+CFLAGS += -iquote ../../tests/x86_emulator
+
 # Add libx86 to the build
 vpath %.c $(XEN_ROOT)/xen/lib/x86
 
-x86_emulate: FORCE
+x86_emulate:
 	mkdir -p $@
-	ln -sf $(XEN_ROOT)/xen/arch/x86/$@/*.[ch] $@/
-
-x86_emulate/%.c: x86_emulate ;
-x86_emulate/%.h: x86_emulate ;
-
-%.c: $(XEN_ROOT)/tools/tests/x86_emulator/%.c FORCE
-	ln -nsf $< $@
-%.h: $(XEN_ROOT)/tools/tests/x86_emulator/%.h FORCE
-	ln -nsf $< $@
-
-CFLAGS += $(CFLAGS_xeninclude) -D__XEN_TOOLS__ -iquote .
 
 GCOV_FLAGS := --coverage
 %-cov.o: %.c
@@ -33,18 +34,13 @@ OBJS := fuzz-emul.o x86-emulate.o
 OBJS += x86_emulate/0f01.o x86_emulate/0fae.o x86_emulate/0fc7.o
 OBJS += x86_emulate/decode.o x86_emulate/fpu.o
 
-WRAPPED = $(shell sed -n 's,^ *WRAP(\([[:alnum:]_]*\));,\1,p' x86-emulate.h)
-
-private.h := x86-emulate.h x86_emulate/x86_emulate.h x86_emulate/private.h
-
-x86-emulate.h: x86_emulate/x86_emulate.h
-x86-emulate.o x86-emulate-cov.o: x86_emulate/x86_emulate.c $(private.h)
-fuzz-emul.o fuzz-emul-cov.o wrappers.o: x86-emulate.h
+WRAPPED = $(shell sed -n 's,^ *WRAP(\([[:alnum:]_]*\));,\1,p' \
+                      ../../tests/x86_emulator/x86-emulate.h)
 
-$(filter x86_emulate/%.o,$(OBJS)): x86_emulate/%.o: x86_emulate/%.c $(private.h)
+$(filter x86_emulate/%.o,$(OBJS)): x86_emulate/%.o: x86_emulate/%.c x86_emulate
 	$(CC) $(CPPFLAGS) $(CFLAGS) $(CFLAGS_$*.o) -c -o $@ $< $(APPEND_CFLAGS)
 
-$(patsubst %.o,%-cov.o,$(filter x86_emulate/%.o,$(OBJS))): x86_emulate/%-cov.o: x86_emulate/%.c $(private.h)
+$(patsubst %.o,%-cov.o,$(filter x86_emulate/%.o,$(OBJS))): x86_emulate/%-cov.o: x86_emulate/%.c x86_emulate
 	$(CC) $(CPPFLAGS) $(CFLAGS) $(CFLAGS_$*.o) $(GCOV_FLAGS) -c -o $@ $< $(APPEND_CFLAGS)
 
 x86-insn-fuzzer.a: $(OBJS) cpuid.o
@@ -70,7 +66,7 @@ distclean: clean
 clean:
 	rm -f *.a *.o $(DEPS_RM) *.gcda *.gcno *.gcov
 	rm -f afl-harness afl-harness-cov libfuzzer-harness
-	rm -rf x86_emulate x86-emulate.c x86-emulate.h wrappers.c
+	rm -rf x86_emulate
 
 .PHONY: install
 install: all


