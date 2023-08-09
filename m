Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C4E47759C2
	for <lists+xen-devel@lfdr.de>; Wed,  9 Aug 2023 13:03:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.580900.909406 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTgxw-00089m-B1; Wed, 09 Aug 2023 11:03:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 580900.909406; Wed, 09 Aug 2023 11:03:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTgxw-00085g-4C; Wed, 09 Aug 2023 11:03:00 +0000
Received: by outflank-mailman (input) for mailman id 580900;
 Wed, 09 Aug 2023 11:02:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hYF7=D2=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1qTgxu-0007Jy-AM
 for xen-devel@lists.xenproject.org; Wed, 09 Aug 2023 11:02:58 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4c3c12b6-36a4-11ee-b280-6b7b168915f2;
 Wed, 09 Aug 2023 13:02:57 +0200 (CEST)
Received: from nico.bugseng.com (unknown [147.123.100.131])
 by support.bugseng.com (Postfix) with ESMTPSA id D6B454EE0744;
 Wed,  9 Aug 2023 13:02:56 +0200 (CEST)
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
X-Inumbo-ID: 4c3c12b6-36a4-11ee-b280-6b7b168915f2
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org,
	michal.orzel@amd.com,
	xenia.ragiadakou@amd.com,
	ayan.kumar.halder@amd.com,
	consulting@bugseng.com,
	Nicola Vetrini <nicola.vetrini@bugseng.com>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Wei Liu <wl@xen.org>
Subject: [XEN PATCH 4/8] xen/arm: address MISRA C:2012 Rule 8.4
Date: Wed,  9 Aug 2023 13:02:37 +0200
Message-Id: <c2b0bb92a246e5cf149b1ec81c6ed635a275f9df.1691575243.git.nicola.vetrini@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1691575243.git.nicola.vetrini@bugseng.com>
References: <cover.1691575243.git.nicola.vetrini@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

'xen/hypercall.h' is included in 'xen/arch/arm/setup.c' to allow
the declaration of 'arch_get_xen_caps' to be visible when
defining the function.

The header 'xen/delay.h' is included in 'xen/arch/arm/time.c'
to allow the declaration of 'udelay' to be visible.

At the same time, a declaration for 'get_sec' is added in
'xen/include/xen/time.h' to be available for every call site
(in particular cper.h).

Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
---
 xen/arch/arm/setup.c   | 1 +
 xen/arch/arm/time.c    | 1 +
 xen/include/xen/cper.h | 3 +--
 xen/include/xen/time.h | 1 +
 4 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/xen/arch/arm/setup.c b/xen/arch/arm/setup.c
index bbf72b69aa..44ccea03ca 100644
--- a/xen/arch/arm/setup.c
+++ b/xen/arch/arm/setup.c
@@ -32,6 +32,7 @@
 #include <xen/libfdt/libfdt-xen.h>
 #include <xen/acpi.h>
 #include <xen/warning.h>
+#include <xen/hypercall.h>
 #include <asm/alternative.h>
 #include <asm/page.h>
 #include <asm/current.h>
diff --git a/xen/arch/arm/time.c b/xen/arch/arm/time.c
index 0b482d7db3..3535bd8ac7 100644
--- a/xen/arch/arm/time.c
+++ b/xen/arch/arm/time.c
@@ -17,6 +17,7 @@
 #include <xen/softirq.h>
 #include <xen/sched.h>
 #include <xen/time.h>
+#include <xen/delay.h>
 #include <xen/sched.h>
 #include <xen/event.h>
 #include <xen/acpi.h>
diff --git a/xen/include/xen/cper.h b/xen/include/xen/cper.h
index 7c6a4c45ce..de8f385bdd 100644
--- a/xen/include/xen/cper.h
+++ b/xen/include/xen/cper.h
@@ -23,8 +23,7 @@
 
 #include <xen/types.h>
 #include <xen/string.h>
-
-extern unsigned long get_sec(void);
+#include <xen/time.h>
 
 typedef struct {
 	uint8_t b[16];
diff --git a/xen/include/xen/time.h b/xen/include/xen/time.h
index 5aafdda4f3..67c586b736 100644
--- a/xen/include/xen/time.h
+++ b/xen/include/xen/time.h
@@ -36,6 +36,7 @@ s_time_t get_s_time_fixed(u64 at_tick);
 s_time_t get_s_time(void);
 unsigned long get_localtime(struct domain *d);
 uint64_t get_localtime_us(struct domain *d);
+unsigned long get_sec(void);
 
 struct tm {
     int     tm_sec;         /* seconds */
-- 
2.34.1


