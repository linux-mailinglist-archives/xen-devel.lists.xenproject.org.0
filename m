Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 36E545542F7
	for <lists+xen-devel@lfdr.de>; Wed, 22 Jun 2022 08:39:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.353465.580388 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o3u0m-0003O7-32; Wed, 22 Jun 2022 06:38:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 353465.580388; Wed, 22 Jun 2022 06:38:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o3u0l-0003Ky-Ue; Wed, 22 Jun 2022 06:38:47 +0000
Received: by outflank-mailman (input) for mailman id 353465;
 Wed, 22 Jun 2022 06:38:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=zPYt=W5=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1o3u0j-0003Kb-Vb
 for xen-devel@lists.xenproject.org; Wed, 22 Jun 2022 06:38:46 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f5df2146-f1f5-11ec-bd2d-47488cf2e6aa;
 Wed, 22 Jun 2022 08:38:44 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id B7C881FA5C;
 Wed, 22 Jun 2022 06:38:43 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 8B0E313AC7;
 Wed, 22 Jun 2022 06:38:43 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id UEeiIPO4smKNUAAAMHmgww
 (envelope-from <jgross@suse.com>); Wed, 22 Jun 2022 06:38:43 +0000
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
X-Inumbo-ID: f5df2146-f1f5-11ec-bd2d-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1655879923; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+Mw0ys4QNDOfeayffGgMX8B88kpTSJxdLQDajglpGuY=;
	b=LCVs0MbvhQNUhVhcKw0Gx4BjRA6mFWwQEuAQj795WvsjaDx3XJz3qFtwMtTQPA5LbOyk87
	OoFglCNqL6Ouf6H3tU0YIMkaGx7B1rjpMdezz+TLJhEgpKvqmNmNXpBs3CC+xZlzR9/MnE
	T67fj5LW4wb7JP9B0hROZTNq/kZYhU4=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org,
	linux-kernel@vger.kernel.org,
	linux-arch@vger.kernel.org
Cc: Juergen Gross <jgross@suse.com>,
	Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH v3 2/3] kernel: remove platform_has() infrastructure
Date: Wed, 22 Jun 2022 08:38:37 +0200
Message-Id: <20220622063838.8854-3-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220622063838.8854-1-jgross@suse.com>
References: <20220622063838.8854-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The only use case of the platform_has() infrastructure has been
removed again, so remove the whole feature.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 MAINTAINERS                            |  8 --------
 include/asm-generic/Kbuild             |  1 -
 include/asm-generic/platform-feature.h |  8 --------
 include/linux/platform-feature.h       | 15 --------------
 kernel/Makefile                        |  2 +-
 kernel/platform-feature.c              | 27 --------------------------
 6 files changed, 1 insertion(+), 60 deletions(-)
 delete mode 100644 include/asm-generic/platform-feature.h
 delete mode 100644 include/linux/platform-feature.h
 delete mode 100644 kernel/platform-feature.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 3cf9842d9233..1a800f6becd2 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -15835,14 +15835,6 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/iio/chemical/plantower,pms7003.yaml
 F:	drivers/iio/chemical/pms7003.c
 
-PLATFORM FEATURE INFRASTRUCTURE
-M:	Juergen Gross <jgross@suse.com>
-S:	Maintained
-F:	arch/*/include/asm/platform-feature.h
-F:	include/asm-generic/platform-feature.h
-F:	include/linux/platform-feature.h
-F:	kernel/platform-feature.c
-
 PLDMFW LIBRARY
 M:	Jacob Keller <jacob.e.keller@intel.com>
 S:	Maintained
diff --git a/include/asm-generic/Kbuild b/include/asm-generic/Kbuild
index 8e47d483b524..302506bbc2a4 100644
--- a/include/asm-generic/Kbuild
+++ b/include/asm-generic/Kbuild
@@ -44,7 +44,6 @@ mandatory-y += msi.h
 mandatory-y += pci.h
 mandatory-y += percpu.h
 mandatory-y += pgalloc.h
-mandatory-y += platform-feature.h
 mandatory-y += preempt.h
 mandatory-y += rwonce.h
 mandatory-y += sections.h
diff --git a/include/asm-generic/platform-feature.h b/include/asm-generic/platform-feature.h
deleted file mode 100644
index 4b0af3d51588..000000000000
--- a/include/asm-generic/platform-feature.h
+++ /dev/null
@@ -1,8 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-#ifndef _ASM_GENERIC_PLATFORM_FEATURE_H
-#define _ASM_GENERIC_PLATFORM_FEATURE_H
-
-/* Number of arch specific feature flags. */
-#define PLATFORM_ARCH_FEAT_N	0
-
-#endif /* _ASM_GENERIC_PLATFORM_FEATURE_H */
diff --git a/include/linux/platform-feature.h b/include/linux/platform-feature.h
deleted file mode 100644
index 6ed859928b97..000000000000
--- a/include/linux/platform-feature.h
+++ /dev/null
@@ -1,15 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-#ifndef _PLATFORM_FEATURE_H
-#define _PLATFORM_FEATURE_H
-
-#include <linux/bitops.h>
-#include <asm/platform-feature.h>
-
-/* The platform features are starting with the architecture specific ones. */
-#define PLATFORM_FEAT_N				(0 + PLATFORM_ARCH_FEAT_N)
-
-void platform_set(unsigned int feature);
-void platform_clear(unsigned int feature);
-bool platform_has(unsigned int feature);
-
-#endif /* _PLATFORM_FEATURE_H */
diff --git a/kernel/Makefile b/kernel/Makefile
index a7e1f49ab2b3..318789c728d3 100644
--- a/kernel/Makefile
+++ b/kernel/Makefile
@@ -7,7 +7,7 @@ obj-y     = fork.o exec_domain.o panic.o \
 	    cpu.o exit.o softirq.o resource.o \
 	    sysctl.o capability.o ptrace.o user.o \
 	    signal.o sys.o umh.o workqueue.o pid.o task_work.o \
-	    extable.o params.o platform-feature.o \
+	    extable.o params.o \
 	    kthread.o sys_ni.o nsproxy.o \
 	    notifier.o ksysfs.o cred.o reboot.o \
 	    async.o range.o smpboot.o ucount.o regset.o
diff --git a/kernel/platform-feature.c b/kernel/platform-feature.c
deleted file mode 100644
index cb6a6c3e4fed..000000000000
--- a/kernel/platform-feature.c
+++ /dev/null
@@ -1,27 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0
-
-#include <linux/bitops.h>
-#include <linux/cache.h>
-#include <linux/export.h>
-#include <linux/platform-feature.h>
-
-#define PLATFORM_FEAT_ARRAY_SZ  BITS_TO_LONGS(PLATFORM_FEAT_N)
-static unsigned long __read_mostly platform_features[PLATFORM_FEAT_ARRAY_SZ];
-
-void platform_set(unsigned int feature)
-{
-	set_bit(feature, platform_features);
-}
-EXPORT_SYMBOL_GPL(platform_set);
-
-void platform_clear(unsigned int feature)
-{
-	clear_bit(feature, platform_features);
-}
-EXPORT_SYMBOL_GPL(platform_clear);
-
-bool platform_has(unsigned int feature)
-{
-	return test_bit(feature, platform_features);
-}
-EXPORT_SYMBOL_GPL(platform_has);
-- 
2.35.3


