Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FF293B92E7
	for <lists+xen-devel@lfdr.de>; Thu,  1 Jul 2021 16:10:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.148706.274832 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lyxOg-00061m-IJ; Thu, 01 Jul 2021 14:10:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 148706.274832; Thu, 01 Jul 2021 14:10:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lyxOg-0005yZ-EE; Thu, 01 Jul 2021 14:10:30 +0000
Received: by outflank-mailman (input) for mailman id 148706;
 Thu, 01 Jul 2021 14:10:28 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vXwC=LZ=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1lyxOe-0005tj-Qs
 for xen-devel@lists.xenproject.org; Thu, 01 Jul 2021 14:10:28 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4f84f67f-f63d-4cae-b70a-ea7d3a3e3488;
 Thu, 01 Jul 2021 14:10:27 +0000 (UTC)
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
X-Inumbo-ID: 4f84f67f-f63d-4cae-b70a-ea7d3a3e3488
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1625148627;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=p6A2leGuQ6JJnCHw9Z1yFaAvywh0FWS/+VLlHmt9w9U=;
  b=iZiJaWtS487i5ED1ZAtL/56t2zzQWIuZy1hlrXx6D2BibDt74kJajkrw
   vBJvOUuYDCh6CEbsAM8FC+kgoxMGAVkzhM+2XPH9FoRHRZXJm8NUQt2PS
   U5BlxW+HiaYzhPYRAlrXcbTOtyyGpyDNJP3O+mZ/z7G9BZAUjbEbfjUkq
   s=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: lpM6xOx65WR1xO9xPvAF4rH8L42azngx5PsW6pYxbGjjFYhFCC57hXKs7GPPlu4WVaDss+yIfs
 dZOSG6QaRCMZYkADD6HlldN3PzKiMAYzStupabtHI/mHcA1q1GlyAxtH8wGSFltma4xqLDN11p
 gDYd9ysXahhsx+DRr5tKSGulFaDV3fgyaOd3iMZR1BNo3qF8Gf3fTkGP6OOieOFJPznu4Oeh4x
 gFD2NAiiIL/tNb2y+M9OjKfRT1z30/ZCXFJl3x4w6xeoqXff3LmadGAgcmxWBZG4/MI+QVRE3V
 OJo=
X-SBRS: 5.1
X-MesageID: 49007452
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:1jaZlq2nFwHYrwlAs77h1gqjBGEkLtp133Aq2lEZdPWaSL36qy
 nIpoVh6fYuskdoZJhEo7u90ca7MBThHPJOjrX5eI3OYOCEghrQEGgB1/qG/9SIIUSXygce78
 tdmodFebnN5DNB4/oSjjPZLz6oq+PszEgn7d2uskuEkWlRGttdxjY8KAqWC3d7QxQuP/sE/O
 P23Lsgm9PZQwV0UviG
X-IronPort-AV: E=Sophos;i="5.83,314,1616472000"; 
   d="scan'208";a="49007452"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@citrix.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, "Ian
 Jackson" <iwj@xenproject.org>, Jan Beulich <jbeulich@suse.com>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu
	<wl@xen.org>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Tim Deegan <tim@xen.org>
Subject: [XEN PATCH v6 06/31] x86/mm: avoid building multiple .o from a single .c file
Date: Thu, 1 Jul 2021 15:09:46 +0100
Message-ID: <20210701141011.785641-7-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210701141011.785641-1-anthony.perard@citrix.com>
References: <20210701141011.785641-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

This replace the use of a single .c file use for multiple .o file by
creating multiple .c file including the first one.

There's quite a few issues with trying to build more than one object
file from a single source file: there's is a duplication of the make
rules to generate those targets; there is an additional ".file" symbol
added in order to differentiate between the object files; and the
tools/symbols have an heuristic to try to pick up the right ".file".

This patch adds new .c source file which avoid the need to add a
second ".file" symbol and thus avoid the need to deal with those
issues.

Also remove __OBJECT_FILE__ from $(CC) command line as it isn't used
anywhere anymore. And remove the macro "build-intermediate" since the
generic rules for single targets can be used.

Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
---

Notes:
    v6:
    - new patch
      to replace both from v5:
        xen,symbols: rework file symbols selection
        build: use if_changed to build mm/*/guest_%.o
    
    The changes in the patch for symbols.c was too complicated to explain,
    and I probably didn't realize one important fact about the tool: it deal
    with all *.o been concatenated to each other, without a way to figure
    out which symbol belong to which original file, and certainly no way to
    figure out if there's more than one ".file" symbol to choose from beside
    some fragile heuristic.

 xen/Makefile                            | 11 -----------
 xen/Rules.mk                            |  2 +-
 xen/arch/x86/mm/Makefile                |  9 ---------
 xen/arch/x86/mm/guest_walk.c            |  3 ---
 xen/arch/x86/mm/guest_walk_2.c          |  2 ++
 xen/arch/x86/mm/guest_walk_3.c          |  2 ++
 xen/arch/x86/mm/guest_walk_4.c          |  2 ++
 xen/arch/x86/mm/hap/Makefile            |  9 ---------
 xen/arch/x86/mm/hap/guest_walk.c        |  3 ---
 xen/arch/x86/mm/hap/guest_walk_2level.c |  2 ++
 xen/arch/x86/mm/hap/guest_walk_3level.c |  2 ++
 xen/arch/x86/mm/hap/guest_walk_4level.c |  2 ++
 xen/arch/x86/mm/shadow/Makefile         |  9 ---------
 xen/arch/x86/mm/shadow/guest_2.c        |  2 ++
 xen/arch/x86/mm/shadow/guest_3.c        |  2 ++
 xen/arch/x86/mm/shadow/guest_4.c        |  2 ++
 xen/arch/x86/mm/shadow/multi.c          |  3 ---
 xen/tools/symbols.c                     | 18 ++----------------
 18 files changed, 21 insertions(+), 64 deletions(-)
 create mode 100644 xen/arch/x86/mm/guest_walk_2.c
 create mode 100644 xen/arch/x86/mm/guest_walk_3.c
 create mode 100644 xen/arch/x86/mm/guest_walk_4.c
 create mode 100644 xen/arch/x86/mm/hap/guest_walk_2level.c
 create mode 100644 xen/arch/x86/mm/hap/guest_walk_3level.c
 create mode 100644 xen/arch/x86/mm/hap/guest_walk_4level.c
 create mode 100644 xen/arch/x86/mm/shadow/guest_2.c
 create mode 100644 xen/arch/x86/mm/shadow/guest_3.c
 create mode 100644 xen/arch/x86/mm/shadow/guest_4.c

diff --git a/xen/Makefile b/xen/Makefile
index 89879fad4cb2..360b4a1d1867 100644
--- a/xen/Makefile
+++ b/xen/Makefile
@@ -476,17 +476,6 @@ _MAP:
 %/: FORCE
 	$(MAKE) -f $(BASEDIR)/Rules.mk -C $* built_in.o built_in_bin.o
 
-build-intermediate = $(eval $(call build-intermediate-closure,$(1)))
-define build-intermediate-closure
-$(1): FORCE
-	$(MAKE) -f $(BASEDIR)/Rules.mk -C $$(@D) $$(@F)
-endef
-
-$(foreach base,arch/x86/mm/guest_walk_% \
-               arch/x86/mm/hap/guest_walk_%level \
-               arch/x86/mm/shadow/guest_%, \
-    $(foreach ext,o i s,$(call build-intermediate,$(base).$(ext))))
-
 .PHONY: cloc
 cloc:
 	$(eval tmpfile := $(shell mktemp))
diff --git a/xen/Rules.mk b/xen/Rules.mk
index f05b2d3f0399..ede408efc515 100644
--- a/xen/Rules.mk
+++ b/xen/Rules.mk
@@ -139,7 +139,7 @@ cpp_flags = $(filter-out -Wa$(comma)%,$(1))
 # Calculation of flags, first the generic flags, then the arch specific flags,
 # and last the flags modified for a target or a directory.
 
-c_flags = -MMD -MP -MF $(@D)/.$(@F).d $(XEN_CFLAGS) '-D__OBJECT_FILE__="$@"'
+c_flags = -MMD -MP -MF $(@D)/.$(@F).d $(XEN_CFLAGS)
 a_flags = -MMD -MP -MF $(@D)/.$(@F).d $(XEN_AFLAGS)
 
 include $(BASEDIR)/arch/$(TARGET_ARCH)/Rules.mk
diff --git a/xen/arch/x86/mm/Makefile b/xen/arch/x86/mm/Makefile
index 2818c066f76a..6b7882d992bb 100644
--- a/xen/arch/x86/mm/Makefile
+++ b/xen/arch/x86/mm/Makefile
@@ -10,12 +10,3 @@ obj-$(CONFIG_MEM_SHARING) += mem_sharing.o
 obj-y += p2m.o
 obj-$(CONFIG_HVM) += p2m-ept.o p2m-pod.o p2m-pt.o
 obj-y += paging.o
-
-guest_walk_%.o: guest_walk.c Makefile
-	$(CC) $(c_flags) -DGUEST_PAGING_LEVELS=$* -c $< -o $@
-
-guest_walk_%.i: guest_walk.c Makefile
-	$(CPP) $(call cpp_flags,$(c_flags)) -DGUEST_PAGING_LEVELS=$* -c $< -o $@
-
-guest_walk_%.s: guest_walk.c Makefile
-	$(CC) $(filter-out -Wa$(comma)%,$(c_flags)) -DGUEST_PAGING_LEVELS=$* -S $< -o $@
diff --git a/xen/arch/x86/mm/guest_walk.c b/xen/arch/x86/mm/guest_walk.c
index 30d83cf1e0e6..b9f607272c39 100644
--- a/xen/arch/x86/mm/guest_walk.c
+++ b/xen/arch/x86/mm/guest_walk.c
@@ -21,9 +21,6 @@
  * along with this program; If not, see <http://www.gnu.org/licenses/>.
  */
 
-/* Allow uniquely identifying static symbols in the 3 generated objects. */
-asm(".file \"" __OBJECT_FILE__ "\"");
-
 #include <xen/types.h>
 #include <xen/mm.h>
 #include <xen/paging.h>
diff --git a/xen/arch/x86/mm/guest_walk_2.c b/xen/arch/x86/mm/guest_walk_2.c
new file mode 100644
index 000000000000..defcd59bc260
--- /dev/null
+++ b/xen/arch/x86/mm/guest_walk_2.c
@@ -0,0 +1,2 @@
+#define GUEST_PAGING_LEVELS 2
+#include "guest_walk.c"
diff --git a/xen/arch/x86/mm/guest_walk_3.c b/xen/arch/x86/mm/guest_walk_3.c
new file mode 100644
index 000000000000..1c9eca37741e
--- /dev/null
+++ b/xen/arch/x86/mm/guest_walk_3.c
@@ -0,0 +1,2 @@
+#define GUEST_PAGING_LEVELS 3
+#include "guest_walk.c"
diff --git a/xen/arch/x86/mm/guest_walk_4.c b/xen/arch/x86/mm/guest_walk_4.c
new file mode 100644
index 000000000000..aa3900338a2d
--- /dev/null
+++ b/xen/arch/x86/mm/guest_walk_4.c
@@ -0,0 +1,2 @@
+#define GUEST_PAGING_LEVELS 4
+#include "guest_walk.c"
diff --git a/xen/arch/x86/mm/hap/Makefile b/xen/arch/x86/mm/hap/Makefile
index c6d296b51720..32aef9b4ba26 100644
--- a/xen/arch/x86/mm/hap/Makefile
+++ b/xen/arch/x86/mm/hap/Makefile
@@ -4,12 +4,3 @@ obj-y += guest_walk_3level.o
 obj-y += guest_walk_4level.o
 obj-y += nested_hap.o
 obj-y += nested_ept.o
-
-guest_walk_%level.o: guest_walk.c Makefile
-	$(CC) $(c_flags) -DGUEST_PAGING_LEVELS=$* -c $< -o $@
-
-guest_walk_%level.i: guest_walk.c Makefile
-	$(CPP) $(call cpp_flags,$(c_flags)) -DGUEST_PAGING_LEVELS=$* -c $< -o $@
-
-guest_walk_%level.s: guest_walk.c Makefile
-	$(CC) $(filter-out -Wa$(comma)%,$(c_flags)) -DGUEST_PAGING_LEVELS=$* -S $< -o $@
diff --git a/xen/arch/x86/mm/hap/guest_walk.c b/xen/arch/x86/mm/hap/guest_walk.c
index f59ebc84a290..832a8058471e 100644
--- a/xen/arch/x86/mm/hap/guest_walk.c
+++ b/xen/arch/x86/mm/hap/guest_walk.c
@@ -18,9 +18,6 @@
  * this program; If not, see <http://www.gnu.org/licenses/>.
  */
 
-/* Allow uniquely identifying static symbols in the 3 generated objects. */
-asm(".file \"" __OBJECT_FILE__ "\"");
-
 #include <xen/domain_page.h>
 #include <xen/paging.h>
 #include <xen/sched.h>
diff --git a/xen/arch/x86/mm/hap/guest_walk_2level.c b/xen/arch/x86/mm/hap/guest_walk_2level.c
new file mode 100644
index 000000000000..defcd59bc260
--- /dev/null
+++ b/xen/arch/x86/mm/hap/guest_walk_2level.c
@@ -0,0 +1,2 @@
+#define GUEST_PAGING_LEVELS 2
+#include "guest_walk.c"
diff --git a/xen/arch/x86/mm/hap/guest_walk_3level.c b/xen/arch/x86/mm/hap/guest_walk_3level.c
new file mode 100644
index 000000000000..1c9eca37741e
--- /dev/null
+++ b/xen/arch/x86/mm/hap/guest_walk_3level.c
@@ -0,0 +1,2 @@
+#define GUEST_PAGING_LEVELS 3
+#include "guest_walk.c"
diff --git a/xen/arch/x86/mm/hap/guest_walk_4level.c b/xen/arch/x86/mm/hap/guest_walk_4level.c
new file mode 100644
index 000000000000..aa3900338a2d
--- /dev/null
+++ b/xen/arch/x86/mm/hap/guest_walk_4level.c
@@ -0,0 +1,2 @@
+#define GUEST_PAGING_LEVELS 4
+#include "guest_walk.c"
diff --git a/xen/arch/x86/mm/shadow/Makefile b/xen/arch/x86/mm/shadow/Makefile
index fd64b4dda925..b4a1620b6920 100644
--- a/xen/arch/x86/mm/shadow/Makefile
+++ b/xen/arch/x86/mm/shadow/Makefile
@@ -5,12 +5,3 @@ obj-$(CONFIG_PV) += pv.o guest_4.o
 else
 obj-y += none.o
 endif
-
-guest_%.o: multi.c Makefile
-	$(CC) $(c_flags) -DGUEST_PAGING_LEVELS=$* -c $< -o $@
-
-guest_%.i: multi.c Makefile
-	$(CPP) $(call cpp_flags,$(c_flags)) -DGUEST_PAGING_LEVELS=$* -c $< -o $@
-
-guest_%.s: multi.c Makefile
-	$(CC) $(filter-out -Wa$(comma)%,$(c_flags)) -DGUEST_PAGING_LEVELS=$* -S $< -o $@
diff --git a/xen/arch/x86/mm/shadow/guest_2.c b/xen/arch/x86/mm/shadow/guest_2.c
new file mode 100644
index 000000000000..288b229982b0
--- /dev/null
+++ b/xen/arch/x86/mm/shadow/guest_2.c
@@ -0,0 +1,2 @@
+#define GUEST_PAGING_LEVELS 2
+#include "multi.c"
diff --git a/xen/arch/x86/mm/shadow/guest_3.c b/xen/arch/x86/mm/shadow/guest_3.c
new file mode 100644
index 000000000000..04e17b0b8adc
--- /dev/null
+++ b/xen/arch/x86/mm/shadow/guest_3.c
@@ -0,0 +1,2 @@
+#define GUEST_PAGING_LEVELS 3
+#include "multi.c"
diff --git a/xen/arch/x86/mm/shadow/guest_4.c b/xen/arch/x86/mm/shadow/guest_4.c
new file mode 100644
index 000000000000..c0c5d3cb11ad
--- /dev/null
+++ b/xen/arch/x86/mm/shadow/guest_4.c
@@ -0,0 +1,2 @@
+#define GUEST_PAGING_LEVELS 4
+#include "multi.c"
diff --git a/xen/arch/x86/mm/shadow/multi.c b/xen/arch/x86/mm/shadow/multi.c
index 8bb028c2e2fa..7207fcf9e75f 100644
--- a/xen/arch/x86/mm/shadow/multi.c
+++ b/xen/arch/x86/mm/shadow/multi.c
@@ -20,9 +20,6 @@
  * along with this program; If not, see <http://www.gnu.org/licenses/>.
  */
 
-/* Allow uniquely identifying static symbols in the 3 generated objects. */
-asm(".file \"" __OBJECT_FILE__ "\"");
-
 #include <xen/types.h>
 #include <xen/mm.h>
 #include <xen/trace.h>
diff --git a/xen/tools/symbols.c b/xen/tools/symbols.c
index 0b124526165d..710e9785d348 100644
--- a/xen/tools/symbols.c
+++ b/xen/tools/symbols.c
@@ -84,7 +84,6 @@ static int read_symbol(FILE *in, struct sym_entry *s)
 {
 	char str[500], type[20] = "";
 	char *sym, stype;
-	static enum { symbol, single_source, multi_source } last;
 	static char *filename;
 	int rc = -1;
 
@@ -118,24 +117,11 @@ static int read_symbol(FILE *in, struct sym_entry *s)
 	      */
 	     input_format == fmt_sysv && !*type && stype == '?' && sym &&
 	     sym[1] && strchr("cSsoh", sym[1]) && !sym[2])) {
-		/*
-		 * gas prior to binutils commit fbdf9406b0 (expected to appear
-		 * in 2.27) outputs symbol table entries resulting from .file
-		 * in reverse order. If we get two consecutive file symbols,
-		 * prefer the first one if that names an object file or has a
-		 * directory component (to cover multiply compiled files).
-		 */
-		bool multi = strchr(str, '/') || (sym && sym[1] == 'o');
-
-		if (multi || last != multi_source) {
-			free(filename);
-			filename = *str ? strdup(str) : NULL;
-		}
-		last = multi ? multi_source : single_source;
+		free(filename);
+		filename = *str ? strdup(str) : NULL;
 		goto skip_tail;
 	}
 
-	last = symbol;
 	rc = -1;
 
 	sym = str;
-- 
Anthony PERARD


