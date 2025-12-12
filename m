Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D710BCB99CE
	for <lists+xen-devel@lfdr.de>; Fri, 12 Dec 2025 20:00:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1185677.1507685 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vU8NQ-0001V7-Go; Fri, 12 Dec 2025 19:00:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1185677.1507685; Fri, 12 Dec 2025 19:00:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vU8NQ-0001Sj-D2; Fri, 12 Dec 2025 19:00:28 +0000
Received: by outflank-mailman (input) for mailman id 1185677;
 Fri, 12 Dec 2025 19:00:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SbWK=6S=citrix.com=andrew.cooper3@srs-se1.protection.inumbo.net>)
 id 1vU8NO-0000Sh-MF
 for xen-devel@lists.xenproject.org; Fri, 12 Dec 2025 19:00:26 +0000
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [2a00:1450:4864:20::32e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d1647683-d78c-11f0-b15b-2bf370ae4941;
 Fri, 12 Dec 2025 20:00:25 +0100 (CET)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-47774d3536dso15142255e9.0
 for <xen-devel@lists.xenproject.org>; Fri, 12 Dec 2025 11:00:25 -0800 (PST)
Received: from localhost.localdomain (host-92-26-102-188.as13285.net.
 [92.26.102.188]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47a8f4af065sm16863975e9.6.2025.12.12.11.00.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Dec 2025 11:00:24 -0800 (PST)
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
X-Inumbo-ID: d1647683-d78c-11f0-b15b-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1765566025; x=1766170825; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MVb9ekhD4Wc0C53D3BLiFybhruazQrTOGwycCd8VZjI=;
        b=vQHkVPmuXe+07aEa+5KlAoVUhkUDDCVP9QmqrO39t6ykjUGMUgJpNl2gKGJST4eORv
         qRggq52lKiUmpCeNSMK97W2fGDiGVN+AEwwDHWu7gzRfBGlNGLA+B2/vg33DUjW1oHGm
         6Jhucz3IJG3iTwVITkPEOwB6If46sACXv4gS0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765566025; x=1766170825;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=MVb9ekhD4Wc0C53D3BLiFybhruazQrTOGwycCd8VZjI=;
        b=GjuuRqA3hLQM3oKYs+8Ftls6piopu5XjAC2fYtIjAKdNIEUJcDYh2lwx2OJ5TwZsmo
         QCWoh5fews5bVvzT6rXNjYylCUsA2v6zDUKeTfYmEO7Qkh8nkBZBVHikWrZ+1LZhyW7u
         BWtFLed+UTYjl+o7HvUDWxQk/H8vWOjGMXcbYpjx/GMWUR9gqZ43GbOY+FTv/nnqHVaJ
         5YNCEYPlVeZVRIPW3AClGylSRPjgq+vdXbO4vRcpxNYe4Tb5qmxfYND/RlHGdf00Bl5K
         D5BK2CnxTA53N18MGOlLVs1b9OCwF0a71AXtOUzJz2MO4z5CAOrqxtFbdkYibB74cVfY
         LPow==
X-Gm-Message-State: AOJu0YwNEv6sBM4QOaLDVmPvyGj7q45LV/bVLPSYsEITg/98W/Lv1G3A
	R//YppDBLVnT2JUzkuVpfoxgCay5ItgUNqY3G3+t+OK3WO5VBlCeV7dYe/RlbSS5bp7RAnzss7k
	4CZt1
X-Gm-Gg: AY/fxX6S0USIIPlnlvXR7YsGimjExTsQVNzPo4aVaqe2YKm/lf0HEfLBLLp776q1oEP
	OGHAMqg6Dtb1jYvc99bLTl53p+G9v6WnlHKLG3f0ghU12Daxr/bkIyIVXwu2G8EOT2rWiykQq/T
	me4vIvEsCznD2kFEuKPnwe53QH/oaabXfTl8S5y5/pQ2Y549XSXm59HxsD3uMGdE4iMqo5CMoVL
	9mGLPnfeErNt83IKpTOlzo5SQuQthjWnafLJBZ2Vu3ODAD6s+Q3Edq3DdHYn5q8O3Qbsb0XPXDR
	u/fYzOcWUFSFA7fnkAeUheaGHr1ZA51H4fSblug3DAmKFLyAs7qUFTppGLo5AvHdTR3Q+I7+Nxf
	P4pACSCdeb6OpoHnx2/8Yd18CrIoDp+9jYJODBtm6ZFrjZdw/TAcXM0cN/jPuz8cZYRdUcPfPYp
	rSeS0PvWpPPzFU5eO76xBMn8JFcyQac/kAs11oAVanVNgfvhcODl9IQ32Gf5ek+g==
X-Google-Smtp-Source: AGHT+IEI+vKlzk2aTjGDWjBJULU4xgcp9jDk3EiraNPCvv45g3F7X85rp1tka0ppu18c6q/8apu/QQ==
X-Received: by 2002:a05:600c:4e45:b0:477:9d88:2da6 with SMTP id 5b1f17b1804b1-47a8faaf533mr26206265e9.0.1765566024938;
        Fri, 12 Dec 2025 11:00:24 -0800 (PST)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH 3/5] x86/svm: Introduce svm-types.h
Date: Fri, 12 Dec 2025 19:00:18 +0000
Message-Id: <20251212190020.2570076-4-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20251212190020.2570076-1-andrew.cooper3@citrix.com>
References: <20251212190020.2570076-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

In order to reduce the header tangle around xen/sched.h, we need to split
types away from other declarations.

Introduce a new svm/svm-types.h to do this, including it from hvm/domain.h and
hvm/vcpu.h, and dropping all other inclusions of svm/vmcb.h and
svm/nestedhvm.h

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/arch/x86/hvm/svm/emulate.c           |  1 -
 xen/arch/x86/hvm/svm/nestedsvm.c         |  1 -
 xen/arch/x86/hvm/svm/svm.c               |  1 -
 xen/arch/x86/hvm/svm/vmcb.c              |  1 -
 xen/arch/x86/include/asm/hvm/domain.h    |  2 +-
 xen/arch/x86/include/asm/hvm/svm-types.h | 11 +++++++++++
 xen/arch/x86/include/asm/hvm/vcpu.h      |  3 +--
 7 files changed, 13 insertions(+), 7 deletions(-)
 create mode 100644 xen/arch/x86/include/asm/hvm/svm-types.h

diff --git a/xen/arch/x86/hvm/svm/emulate.c b/xen/arch/x86/hvm/svm/emulate.c
index be3a710fa53d..1f5436c8ea5d 100644
--- a/xen/arch/x86/hvm/svm/emulate.c
+++ b/xen/arch/x86/hvm/svm/emulate.c
@@ -12,7 +12,6 @@
 #include <asm/hvm/emulate.h>
 #include <asm/hvm/hvm.h>
 #include <asm/hvm/svm.h>
-#include <asm/hvm/svm/vmcb.h>
 
 #include "svm.h"
 #include "vmcb.h"
diff --git a/xen/arch/x86/hvm/svm/nestedsvm.c b/xen/arch/x86/hvm/svm/nestedsvm.c
index 5718ca7f7f0f..a63ec613465f 100644
--- a/xen/arch/x86/hvm/svm/nestedsvm.c
+++ b/xen/arch/x86/hvm/svm/nestedsvm.c
@@ -7,7 +7,6 @@
 
 #include <asm/hvm/support.h>
 #include <asm/hvm/svm.h>
-#include <asm/hvm/svm/vmcb.h>
 #include <asm/hvm/nestedhvm.h>
 #include <asm/paging.h> /* paging_mode_hap */
 #include <asm/event.h> /* for local_event_delivery_(en|dis)able */
diff --git a/xen/arch/x86/hvm/svm/svm.c b/xen/arch/x86/hvm/svm/svm.c
index 86a030b02c27..1208999454d3 100644
--- a/xen/arch/x86/hvm/svm/svm.c
+++ b/xen/arch/x86/hvm/svm/svm.c
@@ -27,7 +27,6 @@
 #include <asm/hvm/nestedhvm.h>
 #include <asm/hvm/support.h>
 #include <asm/hvm/svm.h>
-#include <asm/hvm/svm/vmcb.h>
 #include <asm/i387.h>
 #include <asm/idt.h>
 #include <asm/iocap.h>
diff --git a/xen/arch/x86/hvm/svm/vmcb.c b/xen/arch/x86/hvm/svm/vmcb.c
index 463e527a7d98..cbee10d0463d 100644
--- a/xen/arch/x86/hvm/svm/vmcb.c
+++ b/xen/arch/x86/hvm/svm/vmcb.c
@@ -16,7 +16,6 @@
 
 #include <asm/guest-msr.h>
 #include <asm/hvm/svm.h>
-#include <asm/hvm/svm/vmcb.h>
 #include <asm/msr-index.h>
 #include <asm/p2m.h>
 #include <asm/spec_ctrl.h>
diff --git a/xen/arch/x86/include/asm/hvm/domain.h b/xen/arch/x86/include/asm/hvm/domain.h
index 83be2bd1c29c..be1a0d8c5b9f 100644
--- a/xen/arch/x86/include/asm/hvm/domain.h
+++ b/xen/arch/x86/include/asm/hvm/domain.h
@@ -15,7 +15,7 @@
 
 #include <asm/hvm/io.h>
 #include <asm/hvm/vmx/vmcs.h>
-#include <asm/hvm/svm/vmcb.h>
+#include <asm/hvm/svm-types.h>
 
 #ifdef CONFIG_MEM_SHARING
 struct mem_sharing_domain
diff --git a/xen/arch/x86/include/asm/hvm/svm-types.h b/xen/arch/x86/include/asm/hvm/svm-types.h
new file mode 100644
index 000000000000..1c26daa981a7
--- /dev/null
+++ b/xen/arch/x86/include/asm/hvm/svm-types.h
@@ -0,0 +1,11 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * SVM types needed to form struct domain/vcpu.
+ */
+#ifndef X86_SVM_TYPES_H
+#define X86_SVM_TYPES_H
+
+#include <asm/hvm/svm/vmcb.h>
+#include <asm/hvm/svm/nestedsvm.h>
+
+#endif /* X86_SVM_TYPES_H */
diff --git a/xen/arch/x86/include/asm/hvm/vcpu.h b/xen/arch/x86/include/asm/hvm/vcpu.h
index eae9ac53767b..836138a4a677 100644
--- a/xen/arch/x86/include/asm/hvm/vcpu.h
+++ b/xen/arch/x86/include/asm/hvm/vcpu.h
@@ -12,8 +12,7 @@
 #include <asm/hvm/vlapic.h>
 #include <asm/hvm/vmx/vmcs.h>
 #include <asm/hvm/vmx/vvmx.h>
-#include <asm/hvm/svm/vmcb.h>
-#include <asm/hvm/svm/nestedsvm.h>
+#include <asm/hvm/svm-types.h>
 #include <asm/mtrr.h>
 #include <public/hvm/ioreq.h>
 
-- 
2.39.5


