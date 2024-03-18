Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6519687EDA9
	for <lists+xen-devel@lfdr.de>; Mon, 18 Mar 2024 17:36:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.694897.1084175 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmFy4-0007AU-QT; Mon, 18 Mar 2024 16:36:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 694897.1084175; Mon, 18 Mar 2024 16:36:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmFy4-00074q-K3; Mon, 18 Mar 2024 16:36:08 +0000
Received: by outflank-mailman (input) for mailman id 694897;
 Mon, 18 Mar 2024 16:36:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=we9v=KY=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1rmFy3-0005JN-DY
 for xen-devel@lists.xenproject.org; Mon, 18 Mar 2024 16:36:07 +0000
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [2a00:1450:4864:20::630])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9d9b2ef8-e545-11ee-a1ee-f123f15fe8a2;
 Mon, 18 Mar 2024 17:36:05 +0100 (CET)
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-a46cd9e7fcaso106121166b.1
 for <xen-devel@lists.xenproject.org>; Mon, 18 Mar 2024 09:36:05 -0700 (PDT)
Received: from andrewcoop.citrite.net (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 j22-20020a170906051600b00a441a7a75b5sm4988894eja.209.2024.03.18.09.36.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Mar 2024 09:36:03 -0700 (PDT)
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
X-Inumbo-ID: 9d9b2ef8-e545-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1710779764; x=1711384564; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PINeZIOEWeXs0aAyqXBWjda/ShH0F0UcrolT6+Sh/5w=;
        b=dEZS4AgTv8Z87yqX0To8RcxHntjxQEEMNGoDtmQN3WeHqQ/RNiDotfPwYL8EbHk74M
         OaTsjTQLuaHgZ+QDZVW8VvbcGb2f5gLSZ6GnQ1tIXyuFvmbMrDMoUgFXwr6mSZg4+urC
         Ntqoh+fcUqJaoC3HrrDVcDffzoMPdGP5la0oo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710779764; x=1711384564;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PINeZIOEWeXs0aAyqXBWjda/ShH0F0UcrolT6+Sh/5w=;
        b=sUDC6paG924YFMEaF/Rnke/4VFb2HBfjL0prwp5rtmEDRTFAHKmgeQBJgnEvBUSvD4
         ccQiJdyh7G1cPXHFJZ492RpSe576lQ/PgBxRKTmViOqI38TyNejoFwe1JZvi/nqt4f4g
         6zjhaMQ+awqbSUVVmbrQStG7X6QHnAl7BbB6QCZEpk4CfGO5YPfMXV2opq8r84nkf2dM
         BHi8xluUU7TfNo0KY19BJdDZSkOgER19Mx2MZ6SP9fsqg0Vh86iy/x/nnFNwsaq+xzKY
         5ZahwT8ix/VgUI9YeR8KUmKeO9if082tRRvi2N0Py92P0eiPThl8AUsBqkD90XvEQ8Kr
         X7Vg==
X-Gm-Message-State: AOJu0YzwuZ0jtuyjPc+tNzOBANun7cUDGEbSyNNWlH/tev+6spLkaTPc
	W0GB7Z+ozdqoHgpshi+OpMNEzOjbCY1zZeyZUlRJQowE7c7YCpPEC3VaZ48wRpn8vUsluDzL/V6
	c
X-Google-Smtp-Source: AGHT+IGP+9zN7xY7mThQWojYYbsKhTiU1tp+r4cl/2ev977sOFuznyozo9OoqQrM7KtJyUqm8N1VNw==
X-Received: by 2002:a17:906:6a16:b0:a46:954a:aa14 with SMTP id qw22-20020a1709066a1600b00a46954aaa14mr6404141ejc.67.1710779764631;
        Mon, 18 Mar 2024 09:36:04 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	George Dunlap <George.Dunlap@eu.citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Nicola Vetrini <nicola.vetrini@bugseng.com>,
	"consulting @ bugseng . com" <consulting@bugseng.com>
Subject: [PATCH 7/7] xen/trace: Drop old trace API
Date: Mon, 18 Mar 2024 16:35:52 +0000
Message-Id: <20240318163552.3808695-8-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240318163552.3808695-1-andrew.cooper3@citrix.com>
References: <20240318163552.3808695-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

With all users updated to the new API, drop the old API.  This includes all of
asm/hvm/trace.h, which allows us to drop some includes.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: George Dunlap <George.Dunlap@eu.citrix.com>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Julien Grall <julien@xen.org>
CC: Nicola Vetrini <nicola.vetrini@bugseng.com>
CC: consulting@bugseng.com <consulting@bugseng.com>

v2.1:
 * New
v3:
 * Extend to drop __trace_var() too
---
 xen/arch/x86/hvm/emulate.c             |   1 -
 xen/arch/x86/hvm/hpet.c                |   1 -
 xen/arch/x86/hvm/hvm.c                 |   1 -
 xen/arch/x86/hvm/io.c                  |   1 -
 xen/arch/x86/hvm/svm/intr.c            |   1 -
 xen/arch/x86/hvm/svm/svm.c             |   1 -
 xen/arch/x86/hvm/vlapic.c              |   1 -
 xen/arch/x86/hvm/vmx/intr.c            |   1 -
 xen/arch/x86/hvm/vmx/vmx.c             |   1 -
 xen/arch/x86/include/asm/hvm/trace.h   | 114 -------------------------
 xen/arch/x86/include/asm/hvm/vmx/vmx.h |   1 -
 xen/common/trace.c                     |  12 +--
 xen/include/xen/trace.h                |  47 ----------
 13 files changed, 3 insertions(+), 180 deletions(-)
 delete mode 100644 xen/arch/x86/include/asm/hvm/trace.h

diff --git a/xen/arch/x86/hvm/emulate.c b/xen/arch/x86/hvm/emulate.c
index a37525316c6e..02e378365b40 100644
--- a/xen/arch/x86/hvm/emulate.c
+++ b/xen/arch/x86/hvm/emulate.c
@@ -22,7 +22,6 @@
 #include <asm/hvm/emulate.h>
 #include <asm/hvm/hvm.h>
 #include <asm/hvm/monitor.h>
-#include <asm/hvm/trace.h>
 #include <asm/hvm/support.h>
 #include <asm/iocap.h>
 #include <asm/vm_event.h>
diff --git a/xen/arch/x86/hvm/hpet.c b/xen/arch/x86/hvm/hpet.c
index 0356ade5957b..dd85e46d4001 100644
--- a/xen/arch/x86/hvm/hpet.c
+++ b/xen/arch/x86/hvm/hpet.c
@@ -8,7 +8,6 @@
 #include <asm/hvm/vpt.h>
 #include <asm/hvm/io.h>
 #include <asm/hvm/save.h>
-#include <asm/hvm/trace.h>
 #include <asm/current.h>
 #include <asm/hpet.h>
 #include <asm/mc146818rtc.h>
diff --git a/xen/arch/x86/hvm/hvm.c b/xen/arch/x86/hvm/hvm.c
index bb4eda4ecde2..cedaf428b400 100644
--- a/xen/arch/x86/hvm/hvm.c
+++ b/xen/arch/x86/hvm/hvm.c
@@ -51,7 +51,6 @@
 #include <asm/hvm/vpt.h>
 #include <asm/hvm/support.h>
 #include <asm/hvm/cacheattr.h>
-#include <asm/hvm/trace.h>
 #include <asm/hvm/nestedhvm.h>
 #include <asm/hvm/monitor.h>
 #include <asm/hvm/viridian.h>
diff --git a/xen/arch/x86/hvm/io.c b/xen/arch/x86/hvm/io.c
index 06283b41c463..db726b38177b 100644
--- a/xen/arch/x86/hvm/io.c
+++ b/xen/arch/x86/hvm/io.c
@@ -28,7 +28,6 @@
 #include <asm/hvm/vpt.h>
 #include <asm/hvm/vpic.h>
 #include <asm/hvm/vlapic.h>
-#include <asm/hvm/trace.h>
 #include <asm/hvm/emulate.h>
 #include <public/sched.h>
 #include <xen/iocap.h>
diff --git a/xen/arch/x86/hvm/svm/intr.c b/xen/arch/x86/hvm/svm/intr.c
index dc684fdc843e..780c7e178a52 100644
--- a/xen/arch/x86/hvm/svm/intr.c
+++ b/xen/arch/x86/hvm/svm/intr.c
@@ -24,7 +24,6 @@
 #include <xen/kernel.h>
 #include <public/hvm/ioreq.h>
 #include <xen/domain_page.h>
-#include <asm/hvm/trace.h>
 
 #include "nestedhvm.h"
 
diff --git a/xen/arch/x86/hvm/svm/svm.c b/xen/arch/x86/hvm/svm/svm.c
index 2d0c8762359f..c94b83dc22f7 100644
--- a/xen/arch/x86/hvm/svm/svm.c
+++ b/xen/arch/x86/hvm/svm/svm.c
@@ -28,7 +28,6 @@
 #include <asm/hvm/svm/svm.h>
 #include <asm/hvm/svm/svmdebug.h>
 #include <asm/hvm/svm/vmcb.h>
-#include <asm/hvm/trace.h>
 #include <asm/iocap.h>
 #include <asm/i387.h>
 #include <asm/monitor.h>
diff --git a/xen/arch/x86/hvm/vlapic.c b/xen/arch/x86/hvm/vlapic.c
index 65e171d4751f..7a971470537e 100644
--- a/xen/arch/x86/hvm/vlapic.c
+++ b/xen/arch/x86/hvm/vlapic.c
@@ -27,7 +27,6 @@
 #include <asm/hvm/io.h>
 #include <asm/hvm/support.h>
 #include <asm/hvm/nestedhvm.h>
-#include <asm/hvm/trace.h>
 #include <asm/hvm/viridian.h>
 #include <public/hvm/ioreq.h>
 #include <public/hvm/params.h>
diff --git a/xen/arch/x86/hvm/vmx/intr.c b/xen/arch/x86/hvm/vmx/intr.c
index d36498d83104..1a4dfb499bcd 100644
--- a/xen/arch/x86/hvm/vmx/intr.c
+++ b/xen/arch/x86/hvm/vmx/intr.c
@@ -24,7 +24,6 @@
 #include <asm/hvm/vlapic.h>
 #include <asm/hvm/nestedhvm.h>
 #include <public/hvm/ioreq.h>
-#include <asm/hvm/trace.h>
 #include <asm/vm_event.h>
 
 /*
diff --git a/xen/arch/x86/hvm/vmx/vmx.c b/xen/arch/x86/hvm/vmx/vmx.c
index 255c97f18162..3fbbd44a6b45 100644
--- a/xen/arch/x86/hvm/vmx/vmx.c
+++ b/xen/arch/x86/hvm/vmx/vmx.c
@@ -37,7 +37,6 @@
 #include <asm/x86_emulate.h>
 #include <asm/hvm/vpt.h>
 #include <public/hvm/save.h>
-#include <asm/hvm/trace.h>
 #include <asm/hvm/monitor.h>
 #include <asm/xenoprof.h>
 #include <asm/gdbsx.h>
diff --git a/xen/arch/x86/include/asm/hvm/trace.h b/xen/arch/x86/include/asm/hvm/trace.h
deleted file mode 100644
index 22eadbdd4720..000000000000
--- a/xen/arch/x86/include/asm/hvm/trace.h
+++ /dev/null
@@ -1,114 +0,0 @@
-#ifndef __ASM_X86_HVM_TRACE_H__
-#define __ASM_X86_HVM_TRACE_H__
-
-#include <xen/trace.h>
-
-#define DEFAULT_HVM_TRACE_ON  1
-#define DEFAULT_HVM_TRACE_OFF 0
-
-#define DEFAULT_HVM_VMSWITCH   DEFAULT_HVM_TRACE_ON
-#define DEFAULT_HVM_PF         DEFAULT_HVM_TRACE_ON
-#define DEFAULT_HVM_INJECT     DEFAULT_HVM_TRACE_ON
-#define DEFAULT_HVM_IO         DEFAULT_HVM_TRACE_ON
-#define DEFAULT_HVM_REGACCESS  DEFAULT_HVM_TRACE_ON
-#define DEFAULT_HVM_MISC       DEFAULT_HVM_TRACE_ON
-#define DEFAULT_HVM_INTR       DEFAULT_HVM_TRACE_ON
-
-#define DO_TRC_HVM_VMENTRY     DEFAULT_HVM_VMSWITCH
-#define DO_TRC_HVM_VMEXIT      DEFAULT_HVM_VMSWITCH
-#define DO_TRC_HVM_VMEXIT64    DEFAULT_HVM_VMSWITCH
-#define DO_TRC_HVM_PF_XEN      DEFAULT_HVM_PF
-#define DO_TRC_HVM_PF_XEN64    DEFAULT_HVM_PF
-#define DO_TRC_HVM_PF_INJECT   DEFAULT_HVM_PF
-#define DO_TRC_HVM_PF_INJECT64 DEFAULT_HVM_PF
-#define DO_TRC_HVM_INJ_EXC     DEFAULT_HVM_INJECT
-#define DO_TRC_HVM_INJ_VIRQ    DEFAULT_HVM_INJECT
-#define DO_TRC_HVM_REINJ_VIRQ  DEFAULT_HVM_INJECT
-#define DO_TRC_HVM_INTR_WINDOW DEFAULT_HVM_INJECT
-#define DO_TRC_HVM_IO_READ     DEFAULT_HVM_IO
-#define DO_TRC_HVM_IO_WRITE    DEFAULT_HVM_IO
-#define DO_TRC_HVM_CR_READ     DEFAULT_HVM_REGACCESS
-#define DO_TRC_HVM_CR_READ64   DEFAULT_HVM_REGACCESS
-#define DO_TRC_HVM_CR_WRITE    DEFAULT_HVM_REGACCESS
-#define DO_TRC_HVM_CR_WRITE64  DEFAULT_HVM_REGACCESS
-#define DO_TRC_HVM_DR_READ     DEFAULT_HVM_REGACCESS
-#define DO_TRC_HVM_DR_WRITE    DEFAULT_HVM_REGACCESS
-#define DO_TRC_HVM_XCR_READ64  DEFAULT_HVM_REGACCESS
-#define DO_TRC_HVM_XCR_WRITE64 DEFAULT_HVM_REGACCESS
-#define DO_TRC_HVM_MSR_READ    DEFAULT_HVM_REGACCESS
-#define DO_TRC_HVM_MSR_WRITE   DEFAULT_HVM_REGACCESS
-#define DO_TRC_HVM_RDTSC       DEFAULT_HVM_REGACCESS
-#define DO_TRC_HVM_CPUID       DEFAULT_HVM_MISC
-#define DO_TRC_HVM_INTR        DEFAULT_HVM_INTR
-#define DO_TRC_HVM_NMI         DEFAULT_HVM_INTR
-#define DO_TRC_HVM_MCE         DEFAULT_HVM_INTR
-#define DO_TRC_HVM_SMI         DEFAULT_HVM_INTR
-#define DO_TRC_HVM_VMMCALL     DEFAULT_HVM_MISC
-#define DO_TRC_HVM_HLT         DEFAULT_HVM_MISC
-#define DO_TRC_HVM_INVLPG      DEFAULT_HVM_MISC
-#define DO_TRC_HVM_INVLPG64    DEFAULT_HVM_MISC
-#define DO_TRC_HVM_IO_ASSIST   DEFAULT_HVM_MISC
-#define DO_TRC_HVM_MMIO_ASSIST DEFAULT_HVM_MISC
-#define DO_TRC_HVM_CLTS        DEFAULT_HVM_MISC
-#define DO_TRC_HVM_LMSW        DEFAULT_HVM_MISC
-#define DO_TRC_HVM_LMSW64      DEFAULT_HVM_MISC
-#define DO_TRC_HVM_REALMODE_EMULATE DEFAULT_HVM_MISC
-#define DO_TRC_HVM_TRAP             DEFAULT_HVM_MISC
-#define DO_TRC_HVM_TRAP_DEBUG       DEFAULT_HVM_MISC
-#define DO_TRC_HVM_VLAPIC           DEFAULT_HVM_MISC
-
-
-#define TRC_PAR_LONG(par) ((uint32_t)(par)), ((par) >> 32)
-
-#define TRACE_2_LONG_2D(_e, d1, d2, ...) \
-    TRACE_4D(_e, d1, d2)
-#define TRACE_2_LONG_3D(_e, d1, d2, d3, ...) \
-    TRACE_5D(_e, d1, d2, d3)
-#define TRACE_2_LONG_4D(_e, d1, d2, d3, d4, ...) \
-    TRACE_6D(_e, d1, d2, d3, d4)
-
-#define HVMTRACE_ND(evt, modifier, cycles, ...)                           \
-    do {                                                                  \
-        if ( unlikely(tb_init_done) && DO_TRC_HVM_ ## evt )               \
-        {                                                                 \
-            uint32_t _d[] = { __VA_ARGS__ };                              \
-            __trace_var(TRC_HVM_ ## evt | (modifier), cycles,             \
-                        sizeof(_d), sizeof(_d) ? _d : NULL);              \
-        }                                                                 \
-    } while(0)
-
-#define HVMTRACE_6D(evt, d1, d2, d3, d4, d5, d6)    \
-    HVMTRACE_ND(evt, 0, 0, d1, d2, d3, d4, d5, d6)
-#define HVMTRACE_5D(evt, d1, d2, d3, d4, d5)        \
-    HVMTRACE_ND(evt, 0, 0, d1, d2, d3, d4, d5)
-#define HVMTRACE_4D(evt, d1, d2, d3, d4)            \
-    HVMTRACE_ND(evt, 0, 0, d1, d2, d3, d4)
-#define HVMTRACE_3D(evt, d1, d2, d3)                \
-    HVMTRACE_ND(evt, 0, 0, d1, d2, d3)
-#define HVMTRACE_2D(evt, d1, d2)                    \
-    HVMTRACE_ND(evt, 0, 0, d1, d2)
-#define HVMTRACE_1D(evt, d1)                        \
-    HVMTRACE_ND(evt, 0, 0, d1)
-#define HVMTRACE_0D(evt)                            \
-    HVMTRACE_ND(evt, 0, 0)
-
-#define HVMTRACE_LONG_1D(evt, d1)                  \
-                   HVMTRACE_2D(evt ## 64, (uint32_t)(d1), (d1) >> 32)
-#define HVMTRACE_LONG_2D(evt, d1, d2, ...)              \
-                   HVMTRACE_3D(evt ## 64, d1, d2)
-#define HVMTRACE_LONG_3D(evt, d1, d2, d3, ...)      \
-                   HVMTRACE_4D(evt ## 64, d1, d2, d3)
-#define HVMTRACE_LONG_4D(evt, d1, d2, d3, d4, ...)  \
-                   HVMTRACE_5D(evt ## 64, d1, d2, d3, d4)
-
-#endif /* __ASM_X86_HVM_TRACE_H__ */
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
diff --git a/xen/arch/x86/include/asm/hvm/vmx/vmx.h b/xen/arch/x86/include/asm/hvm/vmx/vmx.h
index 8ffab7d94c26..1489dd05c2a1 100644
--- a/xen/arch/x86/include/asm/hvm/vmx/vmx.h
+++ b/xen/arch/x86/include/asm/hvm/vmx/vmx.h
@@ -15,7 +15,6 @@
 #include <asm/processor.h>
 #include <asm/p2m.h>
 #include <asm/i387.h>
-#include <asm/hvm/trace.h>
 #include <asm/hvm/vmx/vmcs.h>
 
 extern int8_t opt_ept_exec_sp;
diff --git a/xen/common/trace.c b/xen/common/trace.c
index 27c8a19f0549..c9c555094bf7 100644
--- a/xen/common/trace.c
+++ b/xen/common/trace.c
@@ -666,22 +666,21 @@ static DECLARE_SOFTIRQ_TASKLET(trace_notify_dom0_tasklet,
                                trace_notify_dom0, NULL);
 
 /**
- * __trace_var - Enters a trace tuple into the trace buffer for the current CPU.
+ * trace - Enters a trace tuple into the trace buffer for the current CPU.
  * @event: the event type being logged
- * @cycles: include tsc timestamp into trace record
  * @extra: size of additional trace data in bytes
  * @extra_data: pointer to additional trace data
  *
  * Logs a trace record into the appropriate buffer.
  */
-void __trace_var(u32 event, bool cycles, unsigned int extra,
-                 const void *extra_data)
+void trace(uint32_t event, unsigned int extra, const void *extra_data)
 {
     struct t_buf *buf;
     unsigned long flags;
     u32 bytes_to_tail, bytes_to_wrap;
     unsigned int rec_size, total_size;
     bool started_below_highwater;
+    bool cycles = event & TRC_HD_CYCLE_FLAG;
 
     if( !tb_init_done )
         return;
@@ -808,11 +807,6 @@ void __trace_var(u32 event, bool cycles, unsigned int extra,
         tasklet_schedule(&trace_notify_dom0_tasklet);
 }
 
-void trace(uint32_t event, unsigned int extra, const void *extra_data)
-{
-    __trace_var(event, event & TRC_HD_CYCLE_FLAG, extra, extra_data);
-}
-
 void __trace_hypercall(uint32_t event, unsigned long op,
                        const xen_ulong_t *args)
 {
diff --git a/xen/include/xen/trace.h b/xen/include/xen/trace.h
index f184844e1b55..b39a286d2a8e 100644
--- a/xen/include/xen/trace.h
+++ b/xen/include/xen/trace.h
@@ -40,15 +40,6 @@ int trace_will_trace_event(u32 event);
 /* Create a trace record, with pre-constructed additional parameters. */
 void trace(uint32_t event, unsigned int extra, const void *extra_data);
 
-void __trace_var(uint32_t event, bool cycles, unsigned int extra, const void *);
-
-static inline void trace_var(uint32_t event, bool cycles, unsigned int extra,
-                             const void *extra_data)
-{
-    if ( unlikely(tb_init_done) )
-        __trace_var(event, cycles, extra, extra_data);
-}
-
 void __trace_hypercall(uint32_t event, unsigned long op,
                        const xen_ulong_t *args);
 
@@ -72,10 +63,6 @@ static inline int trace_will_trace_event(uint32_t event)
 static inline void trace(
     uint32_t event, unsigned int extra, const void *extra_data) {}
 
-static inline void trace_var(uint32_t event, bool cycles, unsigned int extra,
-                             const void *extra_data) {}
-static inline void __trace_var(uint32_t event, bool cycles, unsigned int extra,
-                               const void *extra_data) {}
 static inline void __trace_hypercall(uint32_t event, unsigned long op,
                                      const xen_ulong_t *args) {}
 #endif /* CONFIG_TRACEBUFFER */
@@ -104,38 +91,4 @@ static inline void trace_time(
 /* Create a trace record with time included. */
 #define TRACE_TIME(_e, ...) TRACE((_e) | TRC_HD_CYCLE_FLAG, ##__VA_ARGS__)
 
-/* Convenience macros for calling the trace function. */
-#define TRACE_0D(_e)                            \
-    do {                                        \
-        trace_var(_e, 1, 0, NULL);              \
-    } while ( 0 )
-
-/* Common helper for TRACE_{1..6}D() below. */
-#define TRACE_varD(_e, ...)                             \
-    do {                                                \
-        if ( unlikely(tb_init_done) )                   \
-        {                                               \
-            uint32_t _d[] = { __VA_ARGS__ };            \
-            __trace_var(_e, true, sizeof(_d), _d);      \
-        }                                               \
-    } while ( 0 )
-
-#define TRACE_1D(_e, d1) \
-    TRACE_varD(_e, d1)
-
-#define TRACE_2D(_e, d1, d2) \
-    TRACE_varD(_e, d1, d2)
-
-#define TRACE_3D(_e, d1, d2, d3) \
-    TRACE_varD(_e, d1, d2, d3)
-
-#define TRACE_4D(_e, d1, d2, d3, d4) \
-    TRACE_varD(_e, d1, d2, d3, d4)
-
-#define TRACE_5D(_e, d1, d2, d3, d4, d5) \
-    TRACE_varD(_e, d1, d2, d3, d4, d5)
-
-#define TRACE_6D(_e, d1, d2, d3, d4, d5, d6) \
-    TRACE_varD(_e, d1, d2, d3, d4, d5, d6)
-
 #endif /* __XEN_TRACE_H__ */
-- 
2.30.2


