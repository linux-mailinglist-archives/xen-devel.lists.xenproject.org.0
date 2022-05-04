Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D415951A4BE
	for <lists+xen-devel@lfdr.de>; Wed,  4 May 2022 17:57:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.320871.541850 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nmHNH-0004EW-MC; Wed, 04 May 2022 15:57:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 320871.541850; Wed, 04 May 2022 15:57:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nmHNH-0004CV-GH; Wed, 04 May 2022 15:57:11 +0000
Received: by outflank-mailman (input) for mailman id 320871;
 Wed, 04 May 2022 15:57:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=TQSl=VM=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1nmHNF-0003wP-6r
 for xen-devel@lists.xenproject.org; Wed, 04 May 2022 15:57:09 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d98c4a11-cbc2-11ec-a406-831a346695d4;
 Wed, 04 May 2022 17:57:07 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 641FE210E1;
 Wed,  4 May 2022 15:57:07 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id AF262132C4;
 Wed,  4 May 2022 15:57:06 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id GLt2KVKicmLWPAAAMHmgww
 (envelope-from <jgross@suse.com>); Wed, 04 May 2022 15:57:06 +0000
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
X-Inumbo-ID: d98c4a11-cbc2-11ec-a406-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1651679827; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Nu4FNczpZovRCMLybZ5k5rdDCEUYi3yOv4DX+sivCNc=;
	b=YaaUVhSRP5GfOdY2LJNhrw0zcyHIdbiTMz0zj9Uc7X0cg8wRTltA+1tJX8+n+pE3HmN/96
	GCQ4MBEVKbCBpzNefZPdi8vvKmVmniACzN6LXAmRJGwENURN4ArHLM2iHP3MAqfwFoO41q
	WQJiMyj03IXIYJcUR850l7JEgifK4ZA=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org,
	linux-kernel@vger.kernel.org,
	linux-arch@vger.kernel.org,
	x86@kernel.org,
	linux-s390@vger.kernel.org,
	virtualization@lists.linux-foundation.org
Cc: Juergen Gross <jgross@suse.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Andy Lutomirski <luto@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Jason Wang <jasowang@redhat.com>,
	Christoph Hellwig <hch@infradead.org>,
	Oleksandr Tyshchenko <olekstysh@gmail.com>
Subject: [PATCH v3 1/2] kernel: add platform_has() infrastructure
Date: Wed,  4 May 2022 17:57:02 +0200
Message-Id: <20220504155703.13336-2-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220504155703.13336-1-jgross@suse.com>
References: <20220504155703.13336-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a simple infrastructure for setting, resetting and querying
platform feature flags.

Flags can be either global or architecture specific.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
V2:
- rename set/reset functions to platform_[set|clear]() (Boris Petkov,
  Heiko Carstens)
- move function implementations to c file (Boris Petkov)
---
 MAINTAINERS                            |  8 ++++++++
 include/asm-generic/Kbuild             |  1 +
 include/asm-generic/platform-feature.h |  8 ++++++++
 include/linux/platform-feature.h       | 15 ++++++++++++++
 kernel/Makefile                        |  2 +-
 kernel/platform-feature.c              | 27 ++++++++++++++++++++++++++
 6 files changed, 60 insertions(+), 1 deletion(-)
 create mode 100644 include/asm-generic/platform-feature.h
 create mode 100644 include/linux/platform-feature.h
 create mode 100644 kernel/platform-feature.c

diff --git a/MAINTAINERS b/MAINTAINERS
index edc96cdb85e8..2749a88d75f2 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -15657,6 +15657,14 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/iio/chemical/plantower,pms7003.yaml
 F:	drivers/iio/chemical/pms7003.c
 
+PLATFORM FEATURE INFRASTRUCTURE
+M:	Juergen Gross <jgross@suse.com>
+S:	Maintained
+F:	arch/*/include/asm/platform-feature.h
+F:	include/asm-generic/platform-feature.h
+F:	include/linux/platform-feature.h
+F:	kernel/platform-feature.c
+
 PLDMFW LIBRARY
 M:	Jacob Keller <jacob.e.keller@intel.com>
 S:	Maintained
diff --git a/include/asm-generic/Kbuild b/include/asm-generic/Kbuild
index 302506bbc2a4..8e47d483b524 100644
--- a/include/asm-generic/Kbuild
+++ b/include/asm-generic/Kbuild
@@ -44,6 +44,7 @@ mandatory-y += msi.h
 mandatory-y += pci.h
 mandatory-y += percpu.h
 mandatory-y += pgalloc.h
+mandatory-y += platform-feature.h
 mandatory-y += preempt.h
 mandatory-y += rwonce.h
 mandatory-y += sections.h
diff --git a/include/asm-generic/platform-feature.h b/include/asm-generic/platform-feature.h
new file mode 100644
index 000000000000..4b0af3d51588
--- /dev/null
+++ b/include/asm-generic/platform-feature.h
@@ -0,0 +1,8 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef _ASM_GENERIC_PLATFORM_FEATURE_H
+#define _ASM_GENERIC_PLATFORM_FEATURE_H
+
+/* Number of arch specific feature flags. */
+#define PLATFORM_ARCH_FEAT_N	0
+
+#endif /* _ASM_GENERIC_PLATFORM_FEATURE_H */
diff --git a/include/linux/platform-feature.h b/include/linux/platform-feature.h
new file mode 100644
index 000000000000..6ed859928b97
--- /dev/null
+++ b/include/linux/platform-feature.h
@@ -0,0 +1,15 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef _PLATFORM_FEATURE_H
+#define _PLATFORM_FEATURE_H
+
+#include <linux/bitops.h>
+#include <asm/platform-feature.h>
+
+/* The platform features are starting with the architecture specific ones. */
+#define PLATFORM_FEAT_N				(0 + PLATFORM_ARCH_FEAT_N)
+
+void platform_set(unsigned int feature);
+void platform_clear(unsigned int feature);
+bool platform_has(unsigned int feature);
+
+#endif /* _PLATFORM_FEATURE_H */
diff --git a/kernel/Makefile b/kernel/Makefile
index 847a82bfe0e3..2f412f80110d 100644
--- a/kernel/Makefile
+++ b/kernel/Makefile
@@ -7,7 +7,7 @@ obj-y     = fork.o exec_domain.o panic.o \
 	    cpu.o exit.o softirq.o resource.o \
 	    sysctl.o capability.o ptrace.o user.o \
 	    signal.o sys.o umh.o workqueue.o pid.o task_work.o \
-	    extable.o params.o \
+	    extable.o params.o platform-feature.o \
 	    kthread.o sys_ni.o nsproxy.o \
 	    notifier.o ksysfs.o cred.o reboot.o \
 	    async.o range.o smpboot.o ucount.o regset.o
diff --git a/kernel/platform-feature.c b/kernel/platform-feature.c
new file mode 100644
index 000000000000..cb6a6c3e4fed
--- /dev/null
+++ b/kernel/platform-feature.c
@@ -0,0 +1,27 @@
+// SPDX-License-Identifier: GPL-2.0
+
+#include <linux/bitops.h>
+#include <linux/cache.h>
+#include <linux/export.h>
+#include <linux/platform-feature.h>
+
+#define PLATFORM_FEAT_ARRAY_SZ  BITS_TO_LONGS(PLATFORM_FEAT_N)
+static unsigned long __read_mostly platform_features[PLATFORM_FEAT_ARRAY_SZ];
+
+void platform_set(unsigned int feature)
+{
+	set_bit(feature, platform_features);
+}
+EXPORT_SYMBOL_GPL(platform_set);
+
+void platform_clear(unsigned int feature)
+{
+	clear_bit(feature, platform_features);
+}
+EXPORT_SYMBOL_GPL(platform_clear);
+
+bool platform_has(unsigned int feature)
+{
+	return test_bit(feature, platform_features);
+}
+EXPORT_SYMBOL_GPL(platform_has);
-- 
2.35.3


