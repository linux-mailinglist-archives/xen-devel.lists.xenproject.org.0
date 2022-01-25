Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D876749B29E
	for <lists+xen-devel@lfdr.de>; Tue, 25 Jan 2022 12:07:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.260094.449235 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nCJfe-00065j-9T; Tue, 25 Jan 2022 11:07:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 260094.449235; Tue, 25 Jan 2022 11:07:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nCJfd-0005xw-Sf; Tue, 25 Jan 2022 11:07:29 +0000
Received: by outflank-mailman (input) for mailman id 260094;
 Tue, 25 Jan 2022 11:07:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rP4T=SJ=citrix.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1nCJa1-0006Mn-LD
 for xen-devel@lists.xenproject.org; Tue, 25 Jan 2022 11:01:41 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2b4f0851-7dce-11ec-8fa7-f31e035a9116;
 Tue, 25 Jan 2022 12:01:40 +0100 (CET)
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
X-Inumbo-ID: 2b4f0851-7dce-11ec-8fa7-f31e035a9116
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1643108500;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=wYkW2R8tFzs0d+phAlxL/mveB4q9AisvIAMEj4v2JKA=;
  b=CmT8YJCvrDef3EvEGQb9J4uDE0NVlNlTRenlD6syW6m3AKphD0Dyfilx
   /o8VU4A711R64t3JBhzPQLmF1NH8dC6x8QQZd6OdK1M9Tdq6wwcwhS8oy
   IsabeXlkt5ZSHh4UqO8qW4Y1pF5MGUd6Fp52dGlCPjexIf+RLzYd5/4tj
   0=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: ex+Ftle9QWnRD8zNv06SqNd7o1++/4oW7KRz0WYbT6Nm8jmN5oTDqchQ7jpCxSk1PjvlAca7M0
 2bgVAqXTpA+UBqDEYADn/3Zi+XR2CGPQs2KBxWpMhmxkSlsQnqx8we1rnWTxyqLgLttFub+xiF
 mwtSANufIeQpdO7DgEFpFHF60wIVA5/tWSQ7Zl9LN2TOXTCkvwF1zRjyfPJQSesobolkMKDfdF
 iwvA3bgOxn1y6XlmZR8dLDQwwPPtkzZl1rRIqVj3LvgIVFshjCKhuhm0s+5r2MzSvN3Ac9maSz
 8Ra0lgxLWqKPZhRoQ7u0o+oN
X-SBRS: 5.2
X-MesageID: 62170359
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:NV5YDq8CJPNy8RLVe9AGDrUDx3iTJUtcMsCJ2f8bNWPcYEJGY0x3n
 GAWWm2FOquDMzSkf9twbt+z9hsGu5TSmoA3TVRqpHg8E34SpcT7XtnIdU2Y0wF+jyHgoOCLy
 +1EN7Es+ehtFie0Si9AttENlFEkvU2ybuOU5NXsZ2YhFWeIdA970Ug5w7dj39Yx6TSEK1jlV
 e3a8pW31GCNg1aYAkpMg05UgEoy1BhakGpwUm0WPZinjneH/5UmJMt3yZWKB2n5WuFp8tuSH
 I4v+l0bElTxpH/BAvv9+lryn9ZjrrT6ZWBigVIOM0Sub4QrSoXfHc/XOdJFAXq7hQllkPh+0
 /RT7ZuwVzwCGb/KwPoeCjV8NyVxaPguFL/veRBTsOSWxkzCNXDt3+9vHAc9OohwFuRfWD8Us
 6ZCcXZUM07F17neLLGTE4GAguwqKtXrO4UO/Glt1zjDAd4tQIzZQrWM7thdtNs1rp4URKmGP
 JdIAdZpRDrNUyJXEBBMMbsdxrmRplv2fBECkl3A8MLb5ECMlVcsgdABKuH9ZdiiVchT2EGCq
 Qru5H/lCxsXMNiezzut8X+2gOLL2yThV+o6HrCi6uRjhlHVw2UJEQAXTnOyu/z/gUm7M/phL
 EgT9jsrvLIF3kWhRdngXDW1uHeB+BUbXrJ4Eec39QWMwar8+BuCCy4PSTspQMwrsoo6SCIn0
 neNnsj1Hnp/vbuNU3Wf+7yI6zSoNkA9L3IGZCICZRsI5Z/kuo5bphDAVN9nFIa8i9TnHje2y
 DePxBXSnJ1K05RNjf/iuwma3XT8/fAlUzLZ+C3YRUO7tgR5erWOQJ6usUbYtNpkCIKWGwzpU
 Gc/p+CS6+UHDJeonSOLQfkQELzB28tpIAEwknY0QcB/qm3FF2qLONkJvWogfBsB3tMsJGexC
 HI/rz+983O60JGCSaZsK7y8BM0xpUQLPYS0D6uEBjaij3UYSeNmwM2MTRPIt4wOuBJ1+U3aB
 Xt9WZzwZZr9If8/pAdav89HjdcWKtkWnAs/v6zTwRW9yqa5b3WIU7oDO1bmRrlnsPjc/FSKr
 IgOZpPiJ/BjvAvWOHW/HWk7dghiEJTGLcqu95w/mhCrfGKK513N+9eOmOh8KuSJboxel/vS/
 2HVZ6Or4AGXuJEzEi3TMioLQOq2Bf5X9CtnVQRxYwrA8yV9MO6HsfdOH7NqLOJP3LEykpZJo
 wwtJp/o7gJnEGqXolzwrPDV8eRfSfhcrVveZnX+OGlmIccIqs6g0oaMQzYDPRImVkKf3fbSa
 ZX6vu8CaZZcFQlkEujMb/ejkwG4sXQHwbogVErUONhDPk7r9dEyeSD2i/Y2JeAKKAnCmWTGh
 1rHX09AqLmfuZIx/fnImbuA89WjHdxhExcIBGLc97u3a3XXpzLx3Y9aXe+UVjnBT2eoqr66b
 OBYwqikYv0KlVpHqaRmFLNvwf5s7tfjveYCnA9lAG/KfxKgDbY5eiuK2sxGt6tswL5FuFTpB
 hLTq4cCYbjQYZHrCl8cIgYhf9+v7/BMl2mA9+kxLWX7+DRzoOiNX3JNMkTekydaNrZ0bt8om
 L9zpM4M5gWjoRM2KdLa3DtM/mGBI3FcAaUqspYWXN3ihgYxkwwQZJXdDmn94Y2VasUKOU4ve
 2fGiK3HjrVa50zDb3tsSiSdgbsD3cwD6EJQ0VsPB1WVgd6U1PY40SpY/SkzUgkInA5M1Ph+O
 zQzOkB4TUlUE+yEWCSXs7iQJjx8
IronPort-HdrOrdr: A9a23:/wa/9KHdLB7BstDjpLqE0MeALOsnbusQ8zAXP0AYc3Jom6uj5q
 aTdZUgpGfJYVkqOE3I9ertBEDEewK4yXcX2/h3AV7BZniEhILAFugLhuGO/9SjIVybygc079
 YYT0EUMrzN5DZB4voSmDPIceod/A==
X-IronPort-AV: E=Sophos;i="5.88,314,1635220800"; 
   d="scan'208";a="62170359"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@citrix.com>, Jan Beulich
	<jbeulich@suse.com>, Julien Grall <jgrall@amazon.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>,
	"Julien Grall" <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	"Bertrand Marquis" <bertrand.marquis@arm.com>
Subject: [XEN PATCH v9 11/30] build: rename __LINKER__ to LINKER_SCRIPT
Date: Tue, 25 Jan 2022 11:00:44 +0000
Message-ID: <20220125110103.3527686-12-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220125110103.3527686-1-anthony.perard@citrix.com>
References: <20220125110103.3527686-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

For two reasons: this macro is used to generate a "linker script" and
is not by the linker, and name starting with an underscore '_' are
supposed to be reserved, so better avoid them when not needed.

Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
Reviewed-by: Jan Beulich <jbeulich@suse.com>
Acked-by: Julien Grall <jgrall@amazon.com>
---
 xen/Rules.mk                      | 2 +-
 xen/arch/arm/include/asm/config.h | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/xen/Rules.mk b/xen/Rules.mk
index 567a23a54cd9..fea3f70cdb72 100644
--- a/xen/Rules.mk
+++ b/xen/Rules.mk
@@ -256,7 +256,7 @@ $(obj)/%.s: $(src)/%.S FORCE
 
 # Linker scripts, .lds.S -> .lds
 quiet_cmd_cpp_lds_S = LDS     $@
-cmd_cpp_lds_S = $(CPP) -P $(call cpp_flags,$(a_flags)) -D__LINKER__ -MQ $@ -o $@ $<
+cmd_cpp_lds_S = $(CPP) -P $(call cpp_flags,$(a_flags)) -DLINKER_SCRIPT -MQ $@ -o $@ $<
 
 targets := $(filter-out $(PHONY), $(targets))
 
diff --git a/xen/arch/arm/include/asm/config.h b/xen/arch/arm/include/asm/config.h
index c7b77912013e..2aced0bc3b8b 100644
--- a/xen/arch/arm/include/asm/config.h
+++ b/xen/arch/arm/include/asm/config.h
@@ -191,7 +191,7 @@ extern unsigned long frametable_virt_end;
 #define watchdog_disable() ((void)0)
 #define watchdog_enable()  ((void)0)
 
-#if defined(__ASSEMBLY__) && !defined(__LINKER__)
+#if defined(__ASSEMBLY__) && !defined(LINKER_SCRIPT)
 #include <asm/asm_defns.h>
 #include <asm/macros.h>
 #endif
-- 
Anthony PERARD


