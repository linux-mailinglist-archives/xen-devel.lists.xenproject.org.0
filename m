Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E33C296C9E
	for <lists+xen-devel@lfdr.de>; Fri, 23 Oct 2020 12:17:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.10836.28935 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kVu8d-0000sd-Kl; Fri, 23 Oct 2020 10:17:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 10836.28935; Fri, 23 Oct 2020 10:17:35 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kVu8d-0000sC-Gx; Fri, 23 Oct 2020 10:17:35 +0000
Received: by outflank-mailman (input) for mailman id 10836;
 Fri, 23 Oct 2020 10:17:33 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=gNxR=D6=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kVu8b-0000rz-Mz
 for xen-devel@lists.xenproject.org; Fri, 23 Oct 2020 10:17:33 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 779ed0c8-ef0a-479e-af2a-b6385233ac17;
 Fri, 23 Oct 2020 10:17:32 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 79572ACE5;
 Fri, 23 Oct 2020 10:17:31 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=gNxR=D6=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kVu8b-0000rz-Mz
	for xen-devel@lists.xenproject.org; Fri, 23 Oct 2020 10:17:33 +0000
X-Inumbo-ID: 779ed0c8-ef0a-479e-af2a-b6385233ac17
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 779ed0c8-ef0a-479e-af2a-b6385233ac17;
	Fri, 23 Oct 2020 10:17:32 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1603448251;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AnVuJHJ9HHCqUnhfZFlaHrQ/ZUOGi/mDmoJBR1ZocoE=;
	b=MXE0qkjidzOX8LMSTweK1pL/nRHWpAyJxJiQxNR2DU4zXuTptwhOAlz0mvSXErqEdBFYSe
	hgH/MZGTrWlQ+rPQVJKB5YkuRGqqayKi69AsA8acgDR0F8bIaK2fvDHm+YmojMDIW7DqV4
	7gjxTKRB/BsK5CW7kj2kRcLWXYKGXEQ=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 79572ACE5;
	Fri, 23 Oct 2020 10:17:31 +0000 (UTC)
Subject: [PATCH v2 3/8] lib: move list sorting code
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>, Ian Jackson
 <iwj@xenproject.org>, Julien Grall <julien@xen.org>, Wei Liu <wl@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <aa1ca5da-3ecf-8721-63f9-b86ebbc64330@suse.com>
Message-ID: <19d28bcc-9e5b-4902-8e8d-ae95fbc560a6@suse.com>
Date: Fri, 23 Oct 2020 12:17:33 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.1
MIME-Version: 1.0
In-Reply-To: <aa1ca5da-3ecf-8721-63f9-b86ebbc64330@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Build the source file always, as by putting it into an archive it still
won't be linked into final binaries when not needed. This way possible
build breakage will be easier to notice, and it's more consistent with
us unconditionally building other library kind of code (e.g. sort() or
bsearch()).

While moving the source file, take the opportunity and drop the
pointless EXPORT_SYMBOL().

Signed-off-by: Jan Beulich <jbeulich@suse.com>

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
index 3e2cf2508899..0661328a99e7 100644
--- a/xen/common/Kconfig
+++ b/xen/common/Kconfig
@@ -66,9 +66,6 @@ config MEM_ACCESS
 config NEEDS_LIBELF
 	bool
 
-config NEEDS_LIST_SORT
-	bool
-
 menu "Speculative hardening"
 
 config SPECULATIVE_HARDEN_ARRAY
diff --git a/xen/common/Makefile b/xen/common/Makefile
index 083f62acb634..52d3c2aa9384 100644
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



