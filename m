Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 4STmOMmMT2rvjQIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 09 Jul 2026 13:58:01 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 53AC1730BB1
	for <lists+xen-devel@lfdr.de>; Thu, 09 Jul 2026 13:58:01 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=suse.com header.s=google header.b=GtSraSG+;
	dmarc=pass (policy=quarantine) header.from=suse.com;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.1358035.1612331 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1whnO2-0001cH-Sv; Thu, 09 Jul 2026 11:57:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1358035.1612331; Thu, 09 Jul 2026 11:57:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1whnO2-0001Zl-Pi; Thu, 09 Jul 2026 11:57:50 +0000
Received: by outflank-mailman (input) for mailman id 1358035;
 Thu, 09 Jul 2026 11:57:49 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1whnO1-0001Z6-Gd
 for xen-devel@lists.xenproject.org; Thu, 09 Jul 2026 11:57:49 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1whnO0-0031xT-Ti
 for xen-devel@lists.xenproject.org; Thu, 09 Jul 2026 13:57:48 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a4f8cb2-5cb7-0a2a0a5109dd-0a2a4504b88a-34
 for <xen-devel@lists.xenproject.org>; Thu, 09 Jul 2026 13:57:48 +0200
Received: from [209.85.221.51] (helo=mail-wr1-f51.google.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.2)
 (envelope-from <jbeulich@suse.com>)
 id 6a4f8cbc-b1e5-0a2a45040019-d155dd33c57f-3
 for <xen-devel@lists.xenproject.org>; Thu, 09 Jul 2026 13:57:48 +0200
Received: by mail-wr1-f51.google.com with SMTP id
 ffacd0b85a97d-47640541585so921133f8f.1
 for <xen-devel@lists.xenproject.org>; Thu, 09 Jul 2026 04:57:48 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47df6a31dd5sm6006521f8f.16.2026.07.09.04.57.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Jul 2026 04:57:47 -0700 (PDT)
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
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1783598268; x=1784203068; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=pkUAVKs33bA6SLQQzFxld3LyajDuArKAYW5xh+oIJ88=;
        b=GtSraSG+4f2DAq3lJJ+EwDEQbyPIrPIVefm+CDDa+nilnY389IdmL3sVGPUBx1aBVP
         zLZ0pMz8RqQTTUJ+QudMzvQgE1UToOwMyc6875capr/3sEcdk/EgkFAH9tRIxUiuzvhW
         0ksO6oCHwpDXxtRGmsiQpYAMbFB+V/knyrcRAs/s9Rb8r3YFD6hzWfPHDXZz/2yxK1k6
         6UxMKfbpVYO/X61WyLnl5dBrCeC//fLWwHhXtcoru2yqPsi1ZzZgJP9WV07+s9N94GFW
         DBU8PvykfghCGUiHxhU2uqrq+Nv0VAOs7nVjEqGBEYYWW3080AhWiNgbBGF1A2br0gVV
         vZhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783598268; x=1784203068;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=pkUAVKs33bA6SLQQzFxld3LyajDuArKAYW5xh+oIJ88=;
        b=DiZlHbIBCPxzVCO4HHD6cvoBBfnYciOH9O4ymsJSWEoKog/6XPddWR8soAmI499e+V
         1K93F/3NAQ110zNqMaVJx1+U/rxYG4OQ6s2N+nHify3AxjRYQgZOwW9PJKdzCkgHjw+5
         POQZmYCvgR7QJLqK011520hZxBddDfOx5uJZRDe0fYTHR0BVIe5JSLxYkIybmx9MAmOT
         TihdUkbnzCLywy+0nxGVLTy8648A0lKS6UJUHbtxRP9HXnLVgcFZcvaOi8MxlwJOPNsQ
         LFJhGxZXoT1zsmq8fDXm+rvmEQik23yTarpEhDT82I9ou1ZaDk1eJyi6RVJtu0m4sRCn
         UGGQ==
X-Gm-Message-State: AOJu0YwL6Ed4JjzsunqLsk2Z394N4iwKGJS5a8LDEpDCfECub8PSFua9
	Sa7fe/O+PYnvf8kruxJ82ggYngVVBXSZS6AwsdmBEGYbrknQ/tehCa7UZa42IKsPWWaqjV0m7gi
	Y0RLRlw==
X-Gm-Gg: AfdE7ckRKbWzpxKf6MKITZs97k3+j7YRlgk4OpJRhDAqeVAR6KJuSLVj1pmRP+j8PqH
	kKbFAJzNuhPdS80uhdBdUoWZ22Sx6LMp5XULVTC+uPMfUxZ2ABCdoZmeWZH2UNaV94OdNma6zuf
	p0O0raOhZUSUWQtZjxlR/nA0iKyLjWMEFSkQZ+4wc9eERHBpMpA1DK4IWrOhj2AQWlCctWVTuJS
	c+4oZpC+xKQQaqygrc4g6fOIy3OfoF4zcmATmR92lc9qi/PmX4qbBuzr7cW7qIfZ3qxpMm5FhkA
	trpNlMnLWt/Ak19hiXcVDy/W13rxfl4GfmrUVL4sdpbDjdQPaEVm24RlXdhYCasKxZlS0JNlvHc
	W79xm+XMnJ1QubJsryakyCL0N6s3/5uEvipUu/kYHNtCm0LXBSvcTdCX/sVgiesxY67nSsVGe3g
	X3YXFznFchskaQYdkwYot9padEW0uV2Q5UjtVcDMZwKxzElVb5HA+9gfXUPRHr5IGutIPWDkJqH
	9cJ
X-Received: by 2002:a05:6000:2482:b0:477:6874:5415 with SMTP id ffacd0b85a97d-47df074605amr7223834f8f.26.1783598267624;
        Thu, 09 Jul 2026 04:57:47 -0700 (PDT)
Message-ID: <c0f1b254-b02b-44b5-8414-37b459fa5b79@suse.com>
Date: Thu, 9 Jul 2026 13:57:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH 1/2] x86emul: drop wrapper C file
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>
References: <8a3ee9c3-489a-4dbf-b61b-cd078322b786@suse.com>
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
In-Reply-To: <8a3ee9c3-489a-4dbf-b61b-cd078322b786@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-ebf023/1783598268-775A8FE7-4783F6AD/0/0
X-purgate-type: clean
X-purgate-size: 4989
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 53AC1730BB1

Move the little bit that's still left in x86/x86_emulate.c into a __XEN__
conditional in x86/x86_emulate/x86_emulate.c. Move what are roughly the
test/fuzzing harness counterparts from there into the corresponding #else.

Requested-by: Andrew Cooper <andrew.cooper3@citrix.com>
Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/tools/tests/x86_emulator/x86-emulate.c
+++ b/tools/tests/x86_emulator/x86-emulate.c
@@ -3,27 +3,6 @@
 #include <errno.h>
 #include <sys/mman.h>
 
-/* See gcc bug 100680, but here don't bother making this version dependent. */
-#define gcc11_wrap(x) ({                  \
-    unsigned long x_;                     \
-    __asm__ ( "" : "=g" (x_) : "0" (x) ); \
-    (typeof(x))x_;                        \
-})
-
-#define cpu_has_amd_erratum(nr) 0
-#define cpu_has_mpx false
-#define read_bndcfgu() 0
-#define xstate_set_init(what)
-
-/* For generic assembly code: use macros to define operation/operand sizes. */
-#ifdef __i386__
-# define __OS          "l"  /* Operation Suffix */
-# define __OP          "e"  /* Operand Prefix */
-#else
-# define __OS          "q"  /* Operation Suffix */
-# define __OP          "r"  /* Operand Prefix */
-#endif
-
 uint32_t mxcsr_mask = 0x0000ffbf;
 struct cpu_policy cpu_policy;
 
--- a/xen/arch/x86/Makefile
+++ b/xen/arch/x86/Makefile
@@ -69,7 +69,6 @@ obj-y += traps-setup.o
 obj-y += traps.o
 obj-$(CONFIG_INTEL) += tsx.o
 obj-$(CONFIG_VM_EVENT) += vm_event.o
-obj-y += x86_emulate.o
 obj-y += xstate.o
 
 ifneq ($(CONFIG_PV_SHIM_EXCLUSIVE),y)
@@ -86,13 +85,6 @@ hostprogs-y += efi/mkreloc
 
 $(obj)/efi/mkreloc: HOSTCFLAGS += -I$(srctree)/include
 
-ifneq ($(CONFIG_HVM),y)
-$(obj)/x86_emulate.o: CFLAGS-y += -Wno-unused-label
-endif
-ifeq ($(CONFIG_CONDITION_COVERAGE)$(CONFIG_CC_IS_GCC),yy)
-$(obj)/x86_emulate.o: CFLAGS-y += -Wno-error=coverage-too-many-conditions
-endif
-
 efi-y := $(shell if [ ! -r $(objtree)/include/xen/compile.h -o \
                       -O $(objtree)/include/xen/compile.h ]; then \
                          echo '$(TARGET).efi'; fi) \
--- a/xen/arch/x86/x86_emulate.c
+++ /dev/null
@@ -1,37 +0,0 @@
-/******************************************************************************
- * x86_emulate.c
- * 
- * Wrapper for generic x86 instruction decoder and emulator.
- * 
- * Copyright (c) 2008, Citrix Systems, Inc.
- * 
- * Authors:
- *    Keir Fraser <keir@xen.org>
- */
-
-#include <xen/event.h>
-
-#include <asm/x86_emulate.h>
-#include <asm/processor.h> /* current_cpu_info */
-#include <asm/xstate.h>
-#include <asm/amd.h> /* cpu_has_amd_erratum() */
-
-/* Avoid namespace pollution. */
-#undef cmpxchg
-#undef cpuid
-#undef wbinvd
-
-#define cpu_has_amd_erratum(nr) \
-        cpu_has_amd_erratum(&current_cpu_data, AMD_ERRATUM_##nr)
-
-#include "x86_emulate/x86_emulate.c"
-
-/*
- * Local variables:
- * mode: C
- * c-file-style: "BSD"
- * c-basic-offset: 4
- * tab-width: 4
- * indent-tabs-mode: nil
- * End:
- */
--- a/xen/arch/x86/x86_emulate/Makefile
+++ b/xen/arch/x86/x86_emulate/Makefile
@@ -1,3 +1,14 @@
+# Put this ahead of the sorted list below, as it takes long to build and hence
+# we'd like parallel make to schedule its building early.
+obj-y += x86_emulate.o
+
+ifneq ($(CONFIG_HVM),y)
+$(obj)/x86_emulate.o: CFLAGS-y += -Wno-unused-label
+endif
+ifeq ($(CONFIG_CONDITION_COVERAGE)$(CONFIG_CC_IS_GCC),yy)
+$(obj)/x86_emulate.o: CFLAGS-y += -Wno-error=coverage-too-many-conditions
+endif
+
 obj-y += 0f01.o
 obj-y += 0fae.o
 obj-y += 0fc7.o
--- a/xen/arch/x86/x86_emulate/x86_emulate.c
+++ b/xen/arch/x86/x86_emulate/x86_emulate.c
@@ -8,6 +8,48 @@
  * Copyright (c) 2005-2007 XenSource Inc.
  */
 
+#ifdef __XEN__
+
+# include <xen/event.h>
+
+# include <asm/amd.h> /* cpu_has_amd_erratum() */
+# include <asm/processor.h> /* current_cpu_info */
+# include <asm/x86_emulate.h>
+# include <asm/xstate.h>
+
+/* Avoid namespace pollution. */
+# undef cmpxchg
+# undef cpuid
+# undef wbinvd
+
+# define cpu_has_amd_erratum(nr) \
+         cpu_has_amd_erratum(&current_cpu_data, AMD_ERRATUM_##nr)
+
+#else /* !__XEN__ */
+
+/* See gcc bug 100680, but here don't bother making this version dependent. */
+# define gcc11_wrap(x) ({                  \
+     unsigned long x_;                     \
+     __asm__ ( "" : "=g" (x_) : "0" (x) ); \
+     (typeof(x))x_;                        \
+})
+
+# define cpu_has_amd_erratum(nr) 0
+# define cpu_has_mpx false
+# define read_bndcfgu() 0
+# define xstate_set_init(what)
+
+/* For generic assembly code: use macros to define operation/operand sizes. */
+# ifdef __i386__
+#  define __OS          "l"  /* Operation Suffix */
+#  define __OP          "e"  /* Operand Prefix */
+# else
+#  define __OS          "q"  /* Operation Suffix */
+#  define __OP          "r"  /* Operand Prefix */
+# endif
+
+#endif /* __XEN__ */
+
 #include "private.h"
 
 /*


