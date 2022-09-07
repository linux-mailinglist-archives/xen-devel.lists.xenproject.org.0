Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E33045B0434
	for <lists+xen-devel@lfdr.de>; Wed,  7 Sep 2022 14:48:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.401609.643479 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVuTd-00056W-OG; Wed, 07 Sep 2022 12:48:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 401609.643479; Wed, 07 Sep 2022 12:48:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVuTd-00053k-L7; Wed, 07 Sep 2022 12:48:21 +0000
Received: by outflank-mailman (input) for mailman id 401609;
 Wed, 07 Sep 2022 12:48:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uZ2f=ZK=linaro.org=leo.yan@srs-se1.protection.inumbo.net>)
 id 1oVuTc-0004ym-5h
 for xen-devel@lists.xenproject.org; Wed, 07 Sep 2022 12:48:20 +0000
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com
 [2607:f8b0:4864:20::1032])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 58b856e3-2eab-11ed-a016-b9edf5238543;
 Wed, 07 Sep 2022 14:48:19 +0200 (CEST)
Received: by mail-pj1-x1032.google.com with SMTP id
 x1-20020a17090ab00100b001fda21bbc90so18182397pjq.3
 for <xen-devel@lists.xenproject.org>; Wed, 07 Sep 2022 05:48:19 -0700 (PDT)
Received: from leoy-yangtze.lan (n058152048222.netvigator.com. [58.152.48.222])
 by smtp.gmail.com with ESMTPSA id
 a8-20020a170902ecc800b00176b3d7db49sm6575023plh.0.2022.09.07.05.48.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Sep 2022 05:48:17 -0700 (PDT)
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
X-Inumbo-ID: 58b856e3-2eab-11ed-a016-b9edf5238543
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=9G8x9ah2xvnNrCAeq9bbiuzFgx8g7W9WKp+Mj/GfpZU=;
        b=BtpFVA9+BQt5KYlrT4niUqaQWRZP9BHnx4Ew6NOxTULZE0EjbnplPvidI5lC0QFf8/
         E8Wiuk7IJ6W2u+yfXVYDOKW1/q487J0dIp6NBh4r63AVcZ7tPdROaX4d9gYle8RUXPz5
         cwe8SCTexvoCbPa5PNDDxEsG5XMgRd4OhvzMvyMwyuLHqjMchNxTcjMu94ijLJ7nFlo3
         HOWgYbhPK5NMj2cKrCOUhnpiWgSLjIQZgjBGSxZnt4unc9SH5O1/5g2BQtpVBudPw2oZ
         DELHvZsH14fuU/4cL1l7XCBrnqyTL8NLDpwZdfP2N88ROvUU1j+y0hzDGPd4fX68m90i
         2rgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=9G8x9ah2xvnNrCAeq9bbiuzFgx8g7W9WKp+Mj/GfpZU=;
        b=WdctRRH227A0xjEXHU5GUap72khcXFti/Ns1HeUqAudNQUsvpDtZuXpoPDx5lASq4t
         xy268rCpQmX/DdB5hT+DT0pVgGR+ftyNml2Ka5tNniFN7rVl4S64YEIRVVE6CgherWz5
         dzFF7LYaUmysQjzoaJFLhgCsr1LPEhmqs9ZN0i9i9YHq35NJY4OLM76NH7aCi0oe+eYU
         JbhJ812mra+PKI5NH95vdPUCgC5tjYRvWZjyh/9z/kfqcg2bNuhCijLJpCJpuseC7cQA
         HHPy6U+exVT6Q9Y+A1QhuOa+WAAcvHFdBCxuYTIobYCS5lX1YeXYPfmeINGTaMx7gDpi
         EMuA==
X-Gm-Message-State: ACgBeo0CXlh5OyvezhkQa60XQvgWnBUw+HyLw6K1GZiGyAqg6S7J42IK
	5z1W6KPexddaVspKbPk8p3D20d+KB2GYiSg5cXo=
X-Google-Smtp-Source: AA6agR7nZafiL6ynYhvZz840gAA9R7ZjYjXovaW9bQtlOMu5u0HOMDDPt9JCcDbXCpPGK+ujvdzulA==
X-Received: by 2002:a17:90b:3912:b0:1fe:34a0:e74c with SMTP id ob18-20020a17090b391200b001fe34a0e74cmr31029530pjb.233.1662554897765;
        Wed, 07 Sep 2022 05:48:17 -0700 (PDT)
From: Leo Yan <leo.yan@linaro.org>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Wei Liu <wl@xen.org>,
	Leo Yan <leo.yan@linaro.org>
Subject: [PATCH v2] xen: Add macro for version number string
Date: Wed,  7 Sep 2022 20:48:08 +0800
Message-Id: <20220907124808.403697-1-leo.yan@linaro.org>
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
Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>
Reviewed-by: Jan Beulich <jbeulich@suse.com>
---

Changes from v1:
Added blanks around XEN_VERSION_STRING (Jan);
Added Bertrand's and Jan's reviewed tags.

 xen/arch/arm/acpi/domain_build.c | 3 ++-
 xen/arch/arm/domain_build.c      | 2 +-
 xen/common/efi/boot.c            | 4 ++--
 xen/include/xen/compile.h.in     | 1 +
 4 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/xen/arch/arm/acpi/domain_build.c b/xen/arch/arm/acpi/domain_build.c
index bbdc90f92c..ed824c0178 100644
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
+        "xen,xen-" XEN_VERSION_STRING "\0"
         "xen,xen";
     int res;
     /* Convenience alias */
diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index 3fd1186b53..d242c542c6 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -1367,7 +1367,7 @@ static int __init make_hypervisor_node(struct domain *d,
                                        int addrcells, int sizecells)
 {
     const char compat[] =
-        "xen,xen-"__stringify(XEN_VERSION)"."__stringify(XEN_SUBVERSION)"\0"
+        "xen,xen-" XEN_VERSION_STRING "\0"
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


