Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 20AFF596BE9
	for <lists+xen-devel@lfdr.de>; Wed, 17 Aug 2022 11:16:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.388781.625533 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oOF9a-0007Wr-SR; Wed, 17 Aug 2022 09:15:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 388781.625533; Wed, 17 Aug 2022 09:15:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oOF9a-0007UH-PN; Wed, 17 Aug 2022 09:15:58 +0000
Received: by outflank-mailman (input) for mailman id 388781;
 Wed, 17 Aug 2022 09:15:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2RHf=YV=citrix.com=prvs=221cc9648=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1oOF9Z-0007Qg-0c
 for xen-devel@lists.xenproject.org; Wed, 17 Aug 2022 09:15:57 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 30be0152-1e0d-11ed-9250-1f966e50362f;
 Wed, 17 Aug 2022 11:15:54 +0200 (CEST)
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
X-Inumbo-ID: 30be0152-1e0d-11ed-9250-1f966e50362f
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1660727755;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=KCAcD+UKo82iqQPr87UA/LrUCOjKfXas5S4dRUVcBYg=;
  b=T0JsJo66qTcw9iQwSbEDzUT25kNyTn6QBTqdIA4gKl8HB7mMu7zSXKce
   29FIHhJzGOB4ahOEaf9lsCjZ96mHz1ivH2Y/M0CTQrF9sz8BI8UOorzEC
   svVvJue1WNy5IWmgKDpa1h5bX7uEAJRYg5AD+524H3Kw7w/ysPPd9jm9H
   g=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 2.7
X-MesageID: 78281549
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: =?us-ascii?q?A9a23=3AwmV5nqzFDnRstwQsvLl6t4n5zX0MlO8/Zkaqj?=
 =?us-ascii?q?3rN1gqbGZ9vWEDxbLELH0zjGilYHrxVUuWl2OLUd19UmH8XppARgMhhcNlgT?=
 =?us-ascii?q?fXOL6GESclGCLD2DgwoyX8NtKZKJUYyU+cCqjQNtb8EO+wbkJmtMEet0/VuL?=
 =?us-ascii?q?B0PhlULixArjPMYQd52BMTswC/3dHzKmZzskv8f+0/pJeINQVnuVwgngRRLL?=
 =?us-ascii?q?doeBpJQcQWtTl6jX9a6acqqQ3oTYwImEciXE/G8RkSuoYnRdVF0QANwkHOsI?=
 =?us-ascii?q?dyNx0NdzsnmdSHPfbvFuowPQPtbiI+IxuSoCWE1tyUOT2iAWNm3ZzMKTsicJ?=
 =?us-ascii?q?tWH5BjorO7xBqFLsyVJlDckjrm96dMHOaK1Qu1jJGV6B6d4OHRGqPP5fpXRC?=
 =?us-ascii?q?Z36Id2H9OL9kINfDP809XEvU5TfKXS3dIJ0GTxT1KhfOjvw6YAjAwiwlSssS?=
 =?us-ascii?q?NRK/T1tomeTl+xLntNiDgJPbrHUvKqYbt6yv8Jxf8915NBLa9IprueVXQBfg?=
 =?us-ascii?q?3xoLtfuh+FomQSjpb8PWQ4jo3x/OqjkCg2xDo9RtCPi2MWriT7d5uUkwCg2g?=
 =?us-ascii?q?z4HU+ZXqoBqJknILurNQeraIZKuQXGLv7M2kfDts6fIsS/xXGmwFVMWuvG4v?=
 =?us-ascii?q?nZxxwF5ERlLDPlnEZmkujrlVWMZFFTEDZ+0qRP4FFCMhKqK9W1qhWX+w54Fw?=
 =?us-ascii?q?QSIPf1mLjRrfjabVE/XQnH8BVAto4CxmIeszp8Uk3vGjieSau5Cbv2tA4G4o?=
 =?us-ascii?q?U14iOhoOl0nwUySI5Ck2MEu80ixveAeEwB7RWUEtBx0L8i+BusQduXMAGgM4?=
 =?us-ascii?q?l/iXasgOcyt78vpixsK8yOiLbbJlif4RZ549IAiTtbbfr20jSj7uiFNin39Z?=
 =?us-ascii?q?AHaEjg/v27aUKJyWvs9u4WWL6DrE4QrhjDzXnVaZhBfF5cZkPmyB652YmING?=
 =?us-ascii?q?be2MwLFFvv8luV/w3KQS+LAe2RPy9wD+jeRMAI/S3D8QJlfgv7IJgI+/mUpC?=
 =?us-ascii?q?GShv2qAXOkC0ddZTo4m8j45GrwllEdmwVL6cuZZW/pMf+J6zeI/u1OP0hyh1?=
 =?us-ascii?q?urx5QjsxHQpYMrUhEsuNosKNYPme18XhyMNF73LGXj4ZhdbZiyAaUY+UemIc?=
 =?us-ascii?q?LmgcgjEAgb1u9XF5/GwwupJIsMll+F8Ijt3xYScFqMrvaEH6vdVru7v5wQla?=
 =?us-ascii?q?iowIAxjSjPT1YuJnmkzCW+5i2qJ4k188AsIqs8iJK23cUOwH4l3FG5P9vU7+?=
 =?us-ascii?q?WW+IIIab7tCPI7yAw9lYYSD7vilsuwerijO2n1/Nb9fkauW1fsUkSJGKlfoD?=
 =?us-ascii?q?Rk6FrMKnzxHMt37gO6ZNhr3kra+M0SFuxJfe15BY1aQaZ6v0l8KUxVAkLxsJ?=
 =?us-ascii?q?ohAiJyHBLa3VRHPCC/e2a8EtK7KXJdAMfD08W6g5lYlWk1E/OxZBtOMI/vIQ?=
 =?us-ascii?q?tu/V+oyDLiL0e1qBTcMabpu3COt6HxYp80Ms5qD7hvVrm0JkJBDzR1w+1UT5?=
 =?us-ascii?q?1mCZWcnUKJHM2hHJN/17p4JoaQph+gwKaWV3M+GUZYgeIWksBdDJcKdAlEsY?=
 =?us-ascii?q?JjzfzC75iy1T51z+N9v6GJidHpyGlYrDmbBFKzQE6J9My1D9RYwZz5OQeh71?=
 =?us-ascii?q?1xVL0l2FhNL2Jt23DzVBopJhzhsgwYVI7qazJTiNi4Gpjkh6B6Iwiq57bl+i?=
 =?us-ascii?q?F9puzIqHemiLVo7VpY0givK8cwkEYmpVPbLCNuYzPPL5QKthAbK/fKLpfAPt?=
 =?us-ascii?q?dwZr4uPFPgoyGoxOZQS8FI7XQNmERiD2fWX5xpnYqw74o1wqYP4YSu/uHqHN?=
 =?us-ascii?q?2/xtA4YN3TIXth4kaArQXColtu3nGdwGOrtkRlrL4O17UspKL2uD4qql4J6X?=
 =?us-ascii?q?jwRg4o0ljwmKigyglX1Dt8kSDzEclCFIYu09BvzWqX5uvi/vAdVo4730Icvh?=
 =?us-ascii?q?C1Ba0UIyP+ZjG/aroDnjGZDpUTNBD38XXUsdIXZY21oNetdWANjdNDuU2XTd?=
 =?us-ascii?q?8FJ8F15moepyA1wE2kfRP1CAEBJi7AOyOT+hP/PHljk6cpzhstB/itHNja9J?=
 =?us-ascii?q?y0xMvnD7neXVuBTWP3h1WeEQUUMKzVKsSbZlQQvPAJGs9jrfQgKbM3EQR8VH?=
 =?us-ascii?q?GSKTqkN2cybwwwcuuFjF5BjsSsYdrYQI2bt64ZdX3CZra/ANYsUrKc9sgIc7?=
 =?us-ascii?q?ClrKMpnNnQs8BJF/8kQGeienIWJYJ5O0/p1o1/VI3EUwyhInpjJdiDcsLImZ?=
 =?us-ascii?q?HXNoW/Tm0BiQnHohFEzPxWhCMwiJRQTT5T0rTZtr8/RDBVIbNjqYIS7CFOxc?=
 =?us-ascii?q?sUwurUl70Kvs0nVOMuGm8xIBJhB6D0S+U84Yg2L1IERsNz/RywIEUYq/qwy+?=
 =?us-ascii?q?Uj8wOixATMzROVXAX9E3pccQ6rhNw8lYFPDWFoL3YHIAPzggWe73BxYKGKu1?=
 =?us-ascii?q?zwurLsqC2pEt8HkP6DzuEWnxBEjam3+xSaztEQH2A9LTf8xnc7lT+PmZv4JP?=
 =?us-ascii?q?4lqbgFguws0VHS77EWMC+lNzzvnanW7NLpeULjOFiNFAueS0vOBRNh/UuQx5?=
 =?us-ascii?q?UB1HxNxWnBXhY5d5/tpk65JmK4gfho8aJnNTB9wjGU+8enIe4Q4+BumIkvk3?=
 =?us-ascii?q?ZpXN5zSphzi4tAb1iERDITCpkgndJ7m3MQjD369mJT1bekXb+7Q/Hw9uI0qK?=
 =?us-ascii?q?TuNy2g2kpw4wxxBsfxDegHYz7sRcvG4pA/uptO6ZuB/yVP77S071semcPREj?=
 =?us-ascii?q?/jTIKoYkC5q5fOxxG6pWVp3JLjDf343u+yJLuNSOpawl5Y1iqPqCZ2UNxHbI?=
 =?us-ascii?q?Tt3MTAF+5tqcjT3E7MAK10dVEF1rInvJ3onu4xsZcDu9FRTviO1pDJ91O8JF?=
 =?us-ascii?q?I5mxrXbb/OBCLyhxhuF910/AIDqCa5pO3/Jv+Xc03oCLJMpQ73Y+TU9aIGTO?=
 =?us-ascii?q?4sAEUgOf/Si7k/h8xWHNgTX8AJgR6p1bj84QvXvczISjccGAEIgZ6uePivqH?=
 =?us-ascii?q?7MMnGRAPPJ2MtQvvagA+u0cP/cg35V5zNTllt3xi6L+gIjzb2VRXS/6F8o80?=
 =?us-ascii?q?tc=3D?=
X-IronPort-AV: E=Sophos;i="5.93,242,1654574400"; 
   d="scan'208";a="78281549"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@citrix.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, "Jan
 Beulich" <jbeulich@suse.com>, Julien Grall <julien@xen.org>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [XEN PATCH v2] build: Fix x86 out-of-tree build without EFI
Date: Wed, 17 Aug 2022 10:15:40 +0100
Message-ID: <20220817091540.18949-1-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220816103043.32662-1-anthony.perard@citrix.com>
References: <20220816103043.32662-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

We can't have a source file with the same name that exist in both the
common code and in the arch specific code for efi/. This can lead to
comfusion in make and it can pick up the wrong source file. This issue
lead to a failure to build a pv-shim for x86 out-of-tree, as this is
one example of an x86 build using the efi/stub.c.

The issue is that in out-of-tree, make might find x86/efi/stub.c via
VPATH, but as the target needs to be rebuilt due to FORCE, make
actually avoid changing the source tree and rebuilt the target with
VPATH ignored, so $@ lead to the build tree where "stub.c" dosen't
exist yet so a link is made to "common/stub.c".

Rework the new common/stub.c file to have a different name than the
already existing one, by renaming the existing one. We will take
example of efi/boot.c and have the common stub.c include a per-arch
stub.h. This at least avoid the need to expose to Arm both alias
efi_compat_get_info and efi_compat_runtime_call.

Avoid using $(EFIOBJ-y) as an alias for $(clean-files), add
"stub.c" directly to $(clean-files).

Also update .gitignore as this was also missing from the original
patch.

Fixes: 7f96859b0d00 ("xen: reuse x86 EFI stub functions for Arm")
Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
---

Notes:
    v2:
    - instead of renaming common/efi/stub.c to common_stub.c; we rename
      arch/*/efi/stub.c to stub.h and include it from common/stub.c
    - update .gitignore
    
    CC: Jan Beulich <jbeulich@suse.com>
    CC: Wei Chen <wei.chen@arm.com>

 xen/arch/arm/efi/Makefile           | 4 ----
 xen/common/efi/efi-common.mk        | 4 ++--
 xen/arch/arm/efi/stub.h             | 4 ++++
 xen/arch/x86/efi/{stub.c => stub.h} | 5 ++++-
 xen/common/efi/stub.c               | 5 +++++
 .gitignore                          | 1 +
 6 files changed, 16 insertions(+), 7 deletions(-)
 create mode 100644 xen/arch/arm/efi/stub.h
 rename xen/arch/x86/efi/{stub.c => stub.h} (93%)

diff --git a/xen/arch/arm/efi/Makefile b/xen/arch/arm/efi/Makefile
index bd954a3b2d..ff1bcd6c50 100644
--- a/xen/arch/arm/efi/Makefile
+++ b/xen/arch/arm/efi/Makefile
@@ -4,10 +4,6 @@ ifeq ($(CONFIG_ARM_EFI),y)
 obj-y += $(EFIOBJ-y)
 obj-$(CONFIG_ACPI) +=  efi-dom0.init.o
 else
-# Add stub.o to EFIOBJ-y to re-use the clean-files in
-# efi-common.mk. Otherwise the link of stub.c in arm/efi
-# will not be cleaned in "make clean".
-EFIOBJ-y += stub.o
 obj-y += stub.o
 
 $(obj)/stub.o: CFLAGS-y += -fno-short-wchar
diff --git a/xen/common/efi/efi-common.mk b/xen/common/efi/efi-common.mk
index ec2c34f198..950f564575 100644
--- a/xen/common/efi/efi-common.mk
+++ b/xen/common/efi/efi-common.mk
@@ -9,9 +9,9 @@ CFLAGS-y += -iquote $(srcdir)
 # e.g.: It transforms "dir/foo/bar" into successively
 #       "dir foo bar", ".. .. ..", "../../.."
 $(obj)/%.c: $(srctree)/common/efi/%.c FORCE
-	$(Q)test -f $@ || \
-	    ln -nfs $(subst $(space),/,$(patsubst %,..,$(subst /, ,$(obj))))/source/common/efi/$(<F) $@
+	$(Q)ln -nfs $(subst $(space),/,$(patsubst %,..,$(subst /, ,$(obj))))/source/common/efi/$(<F) $@
 
 clean-files += $(patsubst %.o, %.c, $(EFIOBJ-y:.init.o=.o) $(EFIOBJ-))
+clean-files += stub.c
 
 .PRECIOUS: $(obj)/%.c
diff --git a/xen/arch/arm/efi/stub.h b/xen/arch/arm/efi/stub.h
new file mode 100644
index 0000000000..b0a9b03e59
--- /dev/null
+++ b/xen/arch/arm/efi/stub.h
@@ -0,0 +1,4 @@
+/*
+ * Architecture specific implementation for EFI stub code.  This file
+ * is intended to be included by common/efi/stub.c _only_.
+ */
diff --git a/xen/arch/x86/efi/stub.c b/xen/arch/x86/efi/stub.h
similarity index 93%
rename from xen/arch/x86/efi/stub.c
rename to xen/arch/x86/efi/stub.h
index f2365bc041..9d2845b833 100644
--- a/xen/arch/x86/efi/stub.c
+++ b/xen/arch/x86/efi/stub.h
@@ -1,3 +1,7 @@
+/*
+ * Architecture specific implementation for EFI stub code.  This file
+ * is intended to be included by common/efi/stub.c _only_.
+ */
 #include <xen/efi.h>
 #include <xen/init.h>
 #include <asm/asm_defns.h>
@@ -8,7 +12,6 @@
 #include <efi/eficon.h>
 #include <efi/efidevp.h>
 #include <efi/efiapi.h>
-#include "../../../common/efi/stub.c"
 
 /*
  * Here we are in EFI stub. EFI calls are not supported due to lack
diff --git a/xen/common/efi/stub.c b/xen/common/efi/stub.c
index 15694632c2..854efd9c99 100644
--- a/xen/common/efi/stub.c
+++ b/xen/common/efi/stub.c
@@ -30,3 +30,8 @@ int efi_runtime_call(struct xenpf_efi_runtime_call *op)
 {
     return -ENOSYS;
 }
+
+/*
+ * Include architecture specific implementation here.
+ */
+#include "stub.h"
diff --git a/.gitignore b/.gitignore
index ed7bd8bdc7..3a91e79672 100644
--- a/.gitignore
+++ b/.gitignore
@@ -311,6 +311,7 @@ xen/arch/*/efi/ebmalloc.c
 xen/arch/*/efi/efi.h
 xen/arch/*/efi/pe.c
 xen/arch/*/efi/runtime.c
+xen/arch/*/efi/stub.c
 xen/arch/*/include/asm/asm-offsets.h
 xen/common/config_data.S
 xen/common/config.gz
-- 
Anthony PERARD


