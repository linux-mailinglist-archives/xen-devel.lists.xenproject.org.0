Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EA995B038F
	for <lists+xen-devel@lfdr.de>; Wed,  7 Sep 2022 14:05:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.401431.643271 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVtnF-0006EY-N4; Wed, 07 Sep 2022 12:04:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 401431.643271; Wed, 07 Sep 2022 12:04:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVtnF-0006CI-JZ; Wed, 07 Sep 2022 12:04:33 +0000
Received: by outflank-mailman (input) for mailman id 401431;
 Wed, 07 Sep 2022 12:04:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uZ2f=ZK=linaro.org=leo.yan@srs-se1.protection.inumbo.net>)
 id 1oVtnD-0006CC-8J
 for xen-devel@lists.xenproject.org; Wed, 07 Sep 2022 12:04:31 +0000
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com
 [2607:f8b0:4864:20::102e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 389363e0-2ea5-11ed-af93-0125da4c0113;
 Wed, 07 Sep 2022 14:04:28 +0200 (CEST)
Received: by mail-pj1-x102e.google.com with SMTP id
 t11-20020a17090a510b00b001fac77e9d1fso18039197pjh.5
 for <xen-devel@lists.xenproject.org>; Wed, 07 Sep 2022 05:04:29 -0700 (PDT)
Received: from leoy-yangtze.lan (45.78.11.189.16clouds.com. [45.78.11.189])
 by smtp.gmail.com with ESMTPSA id
 cp14-20020a170902e78e00b0016db6bd77f4sm11941368plb.117.2022.09.07.05.04.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Sep 2022 05:04:26 -0700 (PDT)
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
X-Inumbo-ID: 389363e0-2ea5-11ed-af93-0125da4c0113
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=CVS4g1G5f5Acs5BUOcyD8RXh3Tkktm3N5arKG4wCzP0=;
        b=vWxULQZGwptRpSi7xB4xcNa/YRPrBT/3cWlXzL1nHwmU3OLNSgKZQiKqAjcH6FAdEZ
         mNDbCnvFxnsP49Dv+Y9WlXGhlOFD+vQB0FSJAWVYY0t2eQzL8+C39f8zCwT4qlVmhbkb
         o7vpRKwTskftWxonh01V0KdHKVcBOGi75i4yzjkNfjm3PEigvHNNV+t0Oe1heDDSRkXL
         M0xQX/VCa/VeeS6VuUzKurvYH3pO0JBCmkCBtoXkM90UqDnrsZGVsaRZgWM1TB9yu5yr
         r6X8QZN8rTQ3s/NdOIQbM1coAoWDz2VjYID3rCqFEwdoGvcidsOrHe/h8lN+nmF7Bd7l
         SKPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=CVS4g1G5f5Acs5BUOcyD8RXh3Tkktm3N5arKG4wCzP0=;
        b=n7yY6zGzTAeUiEHjoZNoMqSPICSo3EqTDyBAn9DJplPnRjd7S4kqv4Lko9hZyfElzx
         9Vz33XixeNlvQa1g7fm3aihLC9orF78BVdp+63hVfBYWw6gHjR8KyLxr0O2upuq9/+Wx
         TOWzGnekTSLv2lscKWUCEwGRrFjC5uY7y7T9+VMdOw8b72dAhm+oQ0Ys6Hn7XkJAypvv
         3tC8oaH3x+p5Kw8RTX/0dFkyD8UeWwxhq6HoT6bFLrVFJJEXU/rrVGFWkztwfaAUg8PC
         d4tHD4+6LmcTXHGBO67fIoN3WGct6dd9BMTey/UnKfkG2qwKZapGfxxWx+k1fHLgO6e+
         fq+g==
X-Gm-Message-State: ACgBeo3y8uIdK9pGTMpfiROV6qd17A34YRaRuZSh/ZcOAjsDQxpgOZjE
	RfFFsN/bOGlZRvQoHJMzHIYxJg==
X-Google-Smtp-Source: AA6agR4Gbp+DTfeQFU6CA9blRyoaQKNs4aO0Qk/dQVHQn9ksmxxxX6Ybr2zHuP4rTZ4IrU2C78Bryw==
X-Received: by 2002:a17:90b:38d2:b0:1fe:30c1:9384 with SMTP id nn18-20020a17090b38d200b001fe30c19384mr3703765pjb.109.1662552267418;
        Wed, 07 Sep 2022 05:04:27 -0700 (PDT)
From: Leo Yan <leo.yan@linaro.org>
To: Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Wei Liu <wl@xen.org>,
	xen-devel@lists.xenproject.org
Cc: Leo Yan <leo.yan@linaro.org>
Subject: [PATCH] xen: Add macro for version number string
Date: Wed,  7 Sep 2022 20:04:20 +0800
Message-Id: <20220907120420.387771-1-leo.yan@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Arm64 Linux kernel prints log for Xen version number:

  Xen XEN_VERSION.XEN_SUBVERSION support found

The header file "xen/compile.h" is missed so that XEN_VERSION and
XEN_SUBVERSION are not defined, __stringify() wrongly converts them as
strings and concatenate to string "XEN_VERSION.XEN_SUBVERSION".

This patch introduces a string macro XEN_VERSION_STRING, we can directly
use it as version number string, as a result it drops to use of
__stringify() to make the code more readable.

The change has been tested on Ampere AVA Arm64 platform.

Fixes: 5d797ee199b3 ("xen/arm: split domain_build.c")
Suggested-by: Bertrand Marquis <bertrand.marquis@arm.com>
Signed-off-by: Leo Yan <leo.yan@linaro.org>
---
 xen/arch/arm/acpi/domain_build.c | 3 ++-
 xen/arch/arm/domain_build.c      | 2 +-
 xen/common/efi/boot.c            | 4 ++--
 xen/include/xen/compile.h.in     | 1 +
 4 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/xen/arch/arm/acpi/domain_build.c b/xen/arch/arm/acpi/domain_build.c
index bbdc90f92c..b23c7cad7a 100644
--- a/xen/arch/arm/acpi/domain_build.c
+++ b/xen/arch/arm/acpi/domain_build.c
@@ -9,6 +9,7 @@
  * GNU General Public License for more details.
  */
 
+#include <xen/compile.h>
 #include <xen/mm.h>
 #include <xen/sched.h>
 #include <xen/acpi.h>
@@ -91,7 +92,7 @@ static int __init acpi_make_hypervisor_node(const struct kernel_info *kinfo,
                                             struct membank tbl_add[])
 {
     const char compat[] =
-        "xen,xen-"__stringify(XEN_VERSION)"."__stringify(XEN_SUBVERSION)"\0"
+        "xen,xen-"XEN_VERSION_STRING"\0"
         "xen,xen";
     int res;
     /* Convenience alias */
diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index 3fd1186b53..62602d2b86 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -1367,7 +1367,7 @@ static int __init make_hypervisor_node(struct domain *d,
                                        int addrcells, int sizecells)
 {
     const char compat[] =
-        "xen,xen-"__stringify(XEN_VERSION)"."__stringify(XEN_SUBVERSION)"\0"
+        "xen,xen-"XEN_VERSION_STRING"\0"
         "xen,xen";
     __be32 *reg, *cells;
     gic_interrupt_t intr;
diff --git a/xen/common/efi/boot.c b/xen/common/efi/boot.c
index a5b2d6ddb8..db0340c8e2 100644
--- a/xen/common/efi/boot.c
+++ b/xen/common/efi/boot.c
@@ -1341,8 +1341,8 @@ efi_start(EFI_HANDLE ImageHandle, EFI_SYSTEM_TABLE *SystemTable)
             efi_console_set_mode();
     }
 
-    PrintStr(L"Xen " __stringify(XEN_VERSION) "." __stringify(XEN_SUBVERSION)
-             XEN_EXTRAVERSION " (c/s " XEN_CHANGESET ") EFI loader\r\n");
+    PrintStr(L"Xen " XEN_VERSION_STRING XEN_EXTRAVERSION
+	     " (c/s " XEN_CHANGESET ") EFI loader\r\n");
 
     efi_arch_relocate_image(0);
 
diff --git a/xen/include/xen/compile.h.in b/xen/include/xen/compile.h.in
index 440ecb25c1..3151d1e7d1 100644
--- a/xen/include/xen/compile.h.in
+++ b/xen/include/xen/compile.h.in
@@ -7,6 +7,7 @@
 
 #define XEN_VERSION		@@version@@
 #define XEN_SUBVERSION		@@subversion@@
+#define XEN_VERSION_STRING	"@@version@@.@@subversion@@"
 #define XEN_EXTRAVERSION	"@@extraversion@@"
 
 #define XEN_CHANGESET		"@@changeset@@"
-- 
2.34.1


