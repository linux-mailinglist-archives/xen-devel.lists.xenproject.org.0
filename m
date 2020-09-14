Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E5E05268917
	for <lists+xen-devel@lfdr.de>; Mon, 14 Sep 2020 12:17:19 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kHlXo-0004Wm-L6; Mon, 14 Sep 2020 10:17:08 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=dIgq=CX=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kHlXn-0004WZ-E2
 for xen-devel@lists.xenproject.org; Mon, 14 Sep 2020 10:17:07 +0000
X-Inumbo-ID: 22761388-79e4-45a8-a872-1e745a4504cb
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 22761388-79e4-45a8-a872-1e745a4504cb;
 Mon, 14 Sep 2020 10:16:56 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 638C9B265;
 Mon, 14 Sep 2020 10:17:11 +0000 (UTC)
Subject: [PATCH 4/9] lib: move list sorting code
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>, Ian Jackson
 <iwj@xenproject.org>, Julien Grall <julien@xen.org>, Wei Liu <wl@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <aabca463-21ed-3755-0e8d-908069f40d6e@suse.com>
Message-ID: <c6a00955-3b4f-c864-16f5-4a344f303ed2@suse.com>
Date: Mon, 14 Sep 2020 12:16:55 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <aabca463-21ed-3755-0e8d-908069f40d6e@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Build the source file always, as by putting it into an archive it still
won't be linked into final binaries when not needed. This way possible
build breakage will be easier to notice, and it's more consistent with
us unconditionally building other library kind of code (e.g. sort() or
bsearch()).

While moving the source file, take the opportunity and drop the
pointless EXPORT_SYMBOL().

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
 xen/arch/arm/Kconfig                        | 4 +---
 xen/common/Kconfig                          | 3 ---
 xen/common/Makefile                         | 1 -
 xen/lib/Makefile                            | 1 +
 xen/{common/list_sort.c => lib/list-sort.c} | 2 --
 5 files changed, 2 insertions(+), 9 deletions(-)
 rename xen/{common/list_sort.c => lib/list-sort.c} (98%)

diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
index 277738826581..cb7e2523b6de 100644
--- a/xen/arch/arm/Kconfig
+++ b/xen/arch/arm/Kconfig
@@ -56,9 +56,7 @@ config HVM
         def_bool y
 
 config NEW_VGIC
-	bool
-	prompt "Use new VGIC implementation"
-	select NEEDS_LIST_SORT
+	bool "Use new VGIC implementation"
 	---help---
 
 	This is an alternative implementation of the ARM GIC interrupt
diff --git a/xen/common/Kconfig b/xen/common/Kconfig
index 15e3b79ff57f..87e99d4ba2f7 100644
--- a/xen/common/Kconfig
+++ b/xen/common/Kconfig
@@ -66,9 +66,6 @@ config HAS_SCHED_GRANULARITY
 config NEEDS_LIBELF
 	bool
 
-config NEEDS_LIST_SORT
-	bool
-
 menu "Speculative hardening"
 
 config SPECULATIVE_HARDEN_ARRAY
diff --git a/xen/common/Makefile b/xen/common/Makefile
index b3b60a1ba25b..958ad8c7d946 100644
--- a/xen/common/Makefile
+++ b/xen/common/Makefile
@@ -21,7 +21,6 @@ obj-y += keyhandler.o
 obj-$(CONFIG_KEXEC) += kexec.o
 obj-$(CONFIG_KEXEC) += kimage.o
 obj-y += lib.o
-obj-$(CONFIG_NEEDS_LIST_SORT) += list_sort.o
 obj-$(CONFIG_LIVEPATCH) += livepatch.o livepatch_elf.o
 obj-$(CONFIG_MEM_ACCESS) += mem_access.o
 obj-y += memory.o
diff --git a/xen/lib/Makefile b/xen/lib/Makefile
index b8814361d63e..764f3624b5f9 100644
--- a/xen/lib/Makefile
+++ b/xen/lib/Makefile
@@ -1,3 +1,4 @@
 obj-$(CONFIG_X86) += x86/
 
 lib-y += ctype.o
+lib-y += list-sort.o
diff --git a/xen/common/list_sort.c b/xen/lib/list-sort.c
similarity index 98%
rename from xen/common/list_sort.c
rename to xen/lib/list-sort.c
index af2b2f6519f1..f8d8bbf28178 100644
--- a/xen/common/list_sort.c
+++ b/xen/lib/list-sort.c
@@ -15,7 +15,6 @@
  * this program; If not, see <http://www.gnu.org/licenses/>.
  */
 
-#include <xen/lib.h>
 #include <xen/list.h>
 
 #define MAX_LIST_LENGTH_BITS 20
@@ -154,4 +153,3 @@ void list_sort(void *priv, struct list_head *head,
 
 	merge_and_restore_back_links(priv, cmp, head, part[max_lev], list);
 }
-EXPORT_SYMBOL(list_sort);
-- 
2.22.0



