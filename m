Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ECE86C6F3A
	for <lists+xen-devel@lfdr.de>; Thu, 23 Mar 2023 18:36:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.514000.795861 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pfOqp-0000V3-Ab; Thu, 23 Mar 2023 17:35:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 514000.795861; Thu, 23 Mar 2023 17:35:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pfOqp-0000TL-70; Thu, 23 Mar 2023 17:35:47 +0000
Received: by outflank-mailman (input) for mailman id 514000;
 Thu, 23 Mar 2023 17:35:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JuTy=7P=linux.intel.com=andriy.shevchenko@srs-se1.protection.inumbo.net>)
 id 1pfOqn-0000TF-Ru
 for xen-devel@lists.xenproject.org; Thu, 23 Mar 2023 17:35:46 +0000
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 20e33923-c9a1-11ed-85db-49a42c6b2330;
 Thu, 23 Mar 2023 18:35:42 +0100 (CET)
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Mar 2023 10:35:37 -0700
Received: from black.fi.intel.com ([10.237.72.28])
 by orsmga007.jf.intel.com with ESMTP; 23 Mar 2023 10:35:25 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
 id AF393D0; Thu, 23 Mar 2023 19:36:11 +0200 (EET)
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
X-Inumbo-ID: 20e33923-c9a1-11ed-85db-49a42c6b2330
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679592942; x=1711128942;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=vwh9ptbMJOXQlZJdSj8+frJlz0P5NOeD/IEPLf/bFeA=;
  b=elih54Qcljimx3sGMruBQqztrNWSxynbyKa/PT+CigKI4GE7WTzwnfAq
   p13wnPnhYhU/uf9+ItqXIZ/kYjXpEZG4y0/eXoUYkQupTt6YeevJe3+W6
   76D9XowzPj3vuwEs++OL/lyf/BDvkI4sVjBsjdPmEm4pymvE49iImM9Ta
   Kpy7loB9bawZeAdSi+waaHYCmZrnKtwf6kFnxM6p3wZXy+hh94Dus1eqw
   EGOsYrvE44QhLIt5QWHEIPQa7An6uNBuKmyXAbjL1TGeJyrSyxjw0QZPT
   O8+IIuE4wMZ2HlRl0Ete5ELf66yRCPUtziDxm9eDEg/3yVS0Z+2daKLY7
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10658"; a="327969589"
X-IronPort-AV: E=Sophos;i="5.98,285,1673942400"; 
   d="scan'208";a="327969589"
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10658"; a="675794215"
X-IronPort-AV: E=Sophos;i="5.98,285,1673942400"; 
   d="scan'208";a="675794215"
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: =?UTF-8?q?Micka=C3=ABl=20Sala=C3=BCn?= <mic@digikod.net>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Randy Dunlap <rdunlap@infradead.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Niklas Schnelle <schnelle@linux.ibm.com>,
	Bjorn Helgaas <helgaas@kernel.org>,
	"Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
	=?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>,
	"Maciej W. Rozycki" <macro@orcam.me.uk>,
	Juergen Gross <jgross@suse.com>,
	Dominik Brodowski <linux@dominikbrodowski.net>,
	linux-kernel@vger.kernel.org,
	linux-alpha@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mips@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-sh@vger.kernel.org,
	sparclinux@vger.kernel.org,
	linux-pci@vger.kernel.org,
	xen-devel@lists.xenproject.org,
	linux-acpi@vger.kernel.org
Cc: Miguel Ojeda <ojeda@kernel.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
	Matt Turner <mattst88@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Andrew Lunn <andrew@lunn.ch>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Gregory Clement <gregory.clement@bootlin.com>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Anatolij Gustschin <agust@denx.de>,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	Rich Felker <dalias@libc.org>,
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
	"David S. Miller" <davem@davemloft.net>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Subject: [PATCH v7 1/6] kernel.h: Split out COUNT_ARGS() and CONCATENATE()
Date: Thu, 23 Mar 2023 19:36:05 +0200
Message-Id: <20230323173610.60442-2-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.40.0.1.gaa8946217a0b
In-Reply-To: <20230323173610.60442-1-andriy.shevchenko@linux.intel.com>
References: <20230323173610.60442-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

kernel.h is being used as a dump for all kinds of stuff for a long time.
The COUNT_ARGS() and CONCATENATE() macros may be used in some places
without need of the full kernel.h dependency train with it.

Here is the attempt on cleaning it up by splitting out these macros().

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 include/linux/args.h   | 13 +++++++++++++
 include/linux/kernel.h |  8 +-------
 2 files changed, 14 insertions(+), 7 deletions(-)
 create mode 100644 include/linux/args.h

diff --git a/include/linux/args.h b/include/linux/args.h
new file mode 100644
index 000000000000..16ef6fad8add
--- /dev/null
+++ b/include/linux/args.h
@@ -0,0 +1,13 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+
+#ifndef _LINUX_ARGS_H
+#define _LINUX_ARGS_H
+
+/* This counts to 12. Any more, it will return 13th argument. */
+#define __COUNT_ARGS(_0, _1, _2, _3, _4, _5, _6, _7, _8, _9, _10, _11, _12, _n, X...) _n
+#define COUNT_ARGS(X...) __COUNT_ARGS(, ##X, 12, 11, 10, 9, 8, 7, 6, 5, 4, 3, 2, 1, 0)
+
+#define __CONCAT(a, b) a ## b
+#define CONCATENATE(a, b) __CONCAT(a, b)
+
+#endif	/* _LINUX_ARGS_H */
diff --git a/include/linux/kernel.h b/include/linux/kernel.h
index 40bce7495af8..c049d3394425 100644
--- a/include/linux/kernel.h
+++ b/include/linux/kernel.h
@@ -13,6 +13,7 @@
 
 #include <linux/stdarg.h>
 #include <linux/align.h>
+#include <linux/args.h>
 #include <linux/limits.h>
 #include <linux/linkage.h>
 #include <linux/stddef.h>
@@ -484,13 +485,6 @@ ftrace_vprintk(const char *fmt, va_list ap)
 static inline void ftrace_dump(enum ftrace_dump_mode oops_dump_mode) { }
 #endif /* CONFIG_TRACING */
 
-/* This counts to 12. Any more, it will return 13th argument. */
-#define __COUNT_ARGS(_0, _1, _2, _3, _4, _5, _6, _7, _8, _9, _10, _11, _12, _n, X...) _n
-#define COUNT_ARGS(X...) __COUNT_ARGS(, ##X, 12, 11, 10, 9, 8, 7, 6, 5, 4, 3, 2, 1, 0)
-
-#define __CONCAT(a, b) a ## b
-#define CONCATENATE(a, b) __CONCAT(a, b)
-
 /* Rebuild everything on CONFIG_FTRACE_MCOUNT_RECORD */
 #ifdef CONFIG_FTRACE_MCOUNT_RECORD
 # define REBUILD_DUE_TO_FTRACE_MCOUNT_RECORD
-- 
2.40.0.1.gaa8946217a0b


