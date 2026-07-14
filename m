Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id +P4oCYJAVmri2AAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 14 Jul 2026 15:58:26 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 792027556A2
	for <lists+xen-devel@lfdr.de>; Tue, 14 Jul 2026 15:58:25 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=suse.com header.s=google header.b=JmDCzoYn;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=quarantine) header.from=suse.com
Received: from list by lists.xenproject.org with outflank-mailman.1362408.1614235 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wjdeE-0004UN-8G; Tue, 14 Jul 2026 13:58:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1362408.1614235; Tue, 14 Jul 2026 13:58:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wjdeE-0004SD-4L; Tue, 14 Jul 2026 13:58:10 +0000
Received: by outflank-mailman (input) for mailman id 1362408;
 Tue, 14 Jul 2026 13:58:09 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wjdeD-0004S7-1j
 for xen-devel@lists.xenproject.org; Tue, 14 Jul 2026 13:58:09 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wjdeC-00816r-7U
 for xen-devel@lists.xenproject.org; Tue, 14 Jul 2026 15:58:08 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a564069-bab6-0a2a0a5309dd-0a2a4503da38-10
 for <xen-devel@lists.xenproject.org>; Tue, 14 Jul 2026 15:58:08 +0200
Received: from [209.85.128.41] (helo=mail-wm1-f41.google.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a56406f-fae8-0a2a45030019-d1558029d1f7-3
 for <xen-devel@lists.xenproject.org>; Tue, 14 Jul 2026 15:58:08 +0200
Received: by mail-wm1-f41.google.com with SMTP id
 5b1f17b1804b1-493f60208a5so37370245e9.3
 for <xen-devel@lists.xenproject.org>; Tue, 14 Jul 2026 06:58:08 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49506a1fbcesm80087315e9.0.2026.07.14.06.58.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Jul 2026 06:58:07 -0700 (PDT)
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
        d=suse.com; s=google; t=1784037487; x=1784642287; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:subject:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=XEf/AOPqS32wm5P7jaCi4Hz1U6Z2kQuPSSiw08HTP4A=;
        b=JmDCzoYnnUIg7BmgSP0YGXEcWKVY5ywH7pSwrZmpO2j+azb/QaoMeNxTeYFgxHg9bq
         +UhCp+vbFc3QQ7ok+WtFCZ2TP8ze1stdZQN/948qNkjjIm60X4RF0tLsiep7kKEPenff
         P9Tsu74bUeTwORFVevhD5mhlD3yUfN5oQH+kU4zxAhPo9UfZwiHhMAUcrlKioDVMcYBk
         ipcibQsHTPHBD7xMfjmMjX3E5Kb1BGjWNrRPbQu4N1FcWb0c7bmbR/LKrTsF9oZJ7eCK
         YB5FnHYMoZ53oxPBfdwUdUGqfIrpteUN7nCF0VHgF3u0dKNlR3kfF05kzp/sswCObW4j
         B+Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784037487; x=1784642287;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:subject:from:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=XEf/AOPqS32wm5P7jaCi4Hz1U6Z2kQuPSSiw08HTP4A=;
        b=CVFkePoYKKNnpPZTAfAO+4JeNI51hV2LbyJrh6mxLESC4Nu3Lh0gYct1nVPD7fFr5z
         Tpgu/Qb+UKmxjC/L5xGNvlVrZPMzcXe0cIoczSMpk0qjKjOY5Lu6Ry02+/tHFDg7zhJL
         LEM7BlotB+eUAGWZ5QqtQmFyNHUxv4L3Be5AkuQ8WYQCN0L3gMB4S4fMs+A75IgDQ9+j
         9k5ajVwWdarxhrUHmxHhf2VemcZBMmtVGEbHjwmbgQ02YBcqTRo0siCLZHb/N4GxnufR
         PH52VbDxYKGmdsRLrNmpIjViaAax46LSKqGU8yNp4Dd9b6FncquwcggRNRinXsz9qRVZ
         Kilg==
X-Gm-Message-State: AOJu0YzVYzZpWXYRCVpYV5H4iVumsxlcP9SCoHTi2YdIB5nexhH5wrPR
	Yob6pQo4KjO8tPGUdysynVSiy41cwayuz4RN26wqmbauadK1ZhaRgYf4xbBRSCmu+8rMJYGSGGV
	6WunGSQ==
X-Gm-Gg: AfdE7cmew4TCSD6Tu85YbJxu9PDeW/YtOemXHd4tp2ak1iYOuJRCBgjbH0DFhjB9DLN
	dh617r8NyX3XAHvmOUNQzt3qPmgGBqXu3ichb9FuZTvSr3+xREFU6MEl7mSF2ARuGzZSo56Zf4Y
	2aTweeo/IVomrKwvkXwJ8z9qLWkuK9acTArEV19m3P1aMuThF9BMENksW+xyuFot/E7C8Vjdy+f
	BG5iSElHeuPTP0JfYVnOJeLdnreCSCPVeEr0XSHAYgI9z9YNlJOYjvUd+JFkpGrcrKeGSfrugos
	GnXnUYY1XL0RwzL05tyLNjWT66Y9ZDTunL0ywKSd8u9UvaFr3mCDvIUCaXOIrHEjc73z2pdsAit
	6mbXY0L7NgUBOAeutCAWJARRMKLzOz0h9RTEF8ino+TSjMA/+0YpijtJ7NGApke87XolJ/pu+ip
	FcHn6v+2dylFXXQUppK4ndJaaii7Zj19nWIel0nwElsbfbVSwMJ4tSalg+ll54UM24MuQSF/2du
	0+d
X-Received: by 2002:a05:600c:1386:b0:490:5057:f5f7 with SMTP id 5b1f17b1804b1-493f87e5164mr143200715e9.11.1784037487417;
        Tue, 14 Jul 2026 06:58:07 -0700 (PDT)
Message-ID: <e482f2b5-382c-4fbb-b030-5cdaba362599@suse.com>
Date: Tue, 14 Jul 2026 15:58:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v1.1 1/2] x86emul: drop wrapper C file
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
X-purgate-ID: tlsNG-33051d/1784037488-6D2D84E9-51A897E4/0/0
X-purgate-type: clean
X-purgate-size: 6048
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:from_mime,suse.com:mid,suse.com:email,suse.com:dkim,gitlab.com:url,xen.org:email,lists.xenproject.org:from_smtp,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,s:lists@lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 792027556A2

Move the little bit that's still left in x86/x86_emulate.c into a __XEN__
conditional in x86/x86_emulate/x86_emulate.c. Move what are roughly the
test/fuzzing harness counterparts from there into the corresponding #else.

Interestingly more recent gcc takes issue with three static const arrays
which are unused when HVM=n (noticeable in particule in the shim build).
Apparently such are diagnosed only when present in the top-level file, but
not when living in an #include-d one.

Requested-by: Andrew Cooper <andrew.cooper3@citrix.com>
Signed-off-by: Jan Beulich <jbeulich@suse.com>
Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
v1.1: Address HVM=n build issues. See
      https://gitlab.com/xen-project/hardware/xen-staging/-/pipelines/2674985992.

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
@@ -8,8 +8,52 @@
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
 
+#ifndef X86EMUL_NO_MMX
+
 /*
  * The next two tables are indexed by high opcode extension byte (the one
  * that's encoded like an immediate) nibble, with each table element then
@@ -45,9 +89,15 @@ static const uint16_t _3dnow_ext_table[1
     [0xb] = (1 << 0xb) /* pswapd */,
 };
 
+#endif /* !X86EMUL_NO_MMX */
+
+#ifndef X86EMUL_NO_SIMD
+
 /* Shift values between src and dst sizes of pmov{s,z}x{b,w,d}{w,d,q}. */
 static const uint8_t pmov_convert_delta[] = { 1, 2, 3, 1, 2, 1 };
 
+#endif /* !X86EMUL_NO_SIMD */
+
 static const uint8_t sse_prefix[] = { 0x66, 0xf3, 0xf2 };
 
 #ifdef __x86_64__

