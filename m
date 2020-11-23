Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AFB72C0EB2
	for <lists+xen-devel@lfdr.de>; Mon, 23 Nov 2020 16:21:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.34637.65800 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1khDee-0006eU-6l; Mon, 23 Nov 2020 15:21:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 34637.65800; Mon, 23 Nov 2020 15:21:24 +0000
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
	id 1khDee-0006e5-2S; Mon, 23 Nov 2020 15:21:24 +0000
Received: by outflank-mailman (input) for mailman id 34637;
 Mon, 23 Nov 2020 15:21:22 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qJrE=E5=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1khDec-0006du-J9
 for xen-devel@lists.xenproject.org; Mon, 23 Nov 2020 15:21:22 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1625aba3-5ee8-4a01-9fc2-df14e972cbcb;
 Mon, 23 Nov 2020 15:21:21 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 91B61AF9E;
 Mon, 23 Nov 2020 15:21:20 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=qJrE=E5=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1khDec-0006du-J9
	for xen-devel@lists.xenproject.org; Mon, 23 Nov 2020 15:21:22 +0000
X-Inumbo-ID: 1625aba3-5ee8-4a01-9fc2-df14e972cbcb
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 1625aba3-5ee8-4a01-9fc2-df14e972cbcb;
	Mon, 23 Nov 2020 15:21:21 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1606144880; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cuO4qVJ1llY0PSDhrVuUhRfZB05Gf7cWsKZi8aM03oE=;
	b=lVpak4STOi/mO4KPxsT9oV8uBjAXmOU+ouQke8fqwI3v8KtrGsZapuH4IfJ5hsAU4Vfjfo
	DEUo7okw7j6LVAog0Yj37lAwfnK8iqAkFv2dfOhMxt3R8pcwQCYOAWnA0NL8qz/kz+CRXB
	RCMrQGqh//x4DRVBkB7na8+qka856E8=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 91B61AF9E;
	Mon, 23 Nov 2020 15:21:20 +0000 (UTC)
Subject: [PATCH v3 2/8] lib: collect library files in an archive
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>, Ian Jackson
 <iwj@xenproject.org>, Julien Grall <julien@xen.org>, Wei Liu <wl@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony Perard <anthony.perard@citrix.com>
References: <1a6bac6a-7d83-f5b6-c5b9-8b3b39824d40@suse.com>
Message-ID: <21714b83-8619-5aa9-be5b-3015d05a26a4@suse.com>
Date: Mon, 23 Nov 2020 16:21:19 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <1a6bac6a-7d83-f5b6-c5b9-8b3b39824d40@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

In order to (subsequently) drop odd things like CONFIG_NEEDS_LIST_SORT
just to avoid bloating binaries when only some arch-es and/or
configurations need generic library routines, combine objects under lib/
into an archive, which the linker then can pick the necessary objects
out of.

Note that we can't use thin archives just yet, until we've raised the
minimum required binutils version suitably.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
 xen/Rules.mk          | 29 +++++++++++++++++++++++++----
 xen/arch/arm/Makefile |  6 +++---
 xen/arch/x86/Makefile |  8 ++++----
 xen/lib/Makefile      |  3 ++-
 4 files changed, 34 insertions(+), 12 deletions(-)

diff --git a/xen/Rules.mk b/xen/Rules.mk
index d5e5eb33de39..aba6ca2a90f5 100644
--- a/xen/Rules.mk
+++ b/xen/Rules.mk
@@ -41,12 +41,16 @@ ALL_OBJS-y               += $(BASEDIR)/xsm/built_in.o
 ALL_OBJS-y               += $(BASEDIR)/arch/$(TARGET_ARCH)/built_in.o
 ALL_OBJS-$(CONFIG_CRYPTO)   += $(BASEDIR)/crypto/built_in.o
 
+ALL_LIBS-y               := $(BASEDIR)/lib/lib.a
+
 # Initialise some variables
+lib-y :=
 targets :=
 CFLAGS-y :=
 AFLAGS-y :=
 
 ALL_OBJS := $(ALL_OBJS-y)
+ALL_LIBS := $(ALL_LIBS-y)
 
 SPECIAL_DATA_SECTIONS := rodata $(foreach a,1 2 4 8 16, \
                                             $(foreach w,1 2 4, \
@@ -60,7 +64,14 @@ include Makefile
 # ---------------------------------------------------------------------------
 
 quiet_cmd_ld = LD      $@
-cmd_ld = $(LD) $(XEN_LDFLAGS) -r -o $@ $(real-prereqs)
+cmd_ld = $(LD) $(XEN_LDFLAGS) -r -o $@ $(filter-out %.a,$(real-prereqs)) \
+               --start-group $(filter %.a,$(real-prereqs)) --end-group
+
+# Archive
+# ---------------------------------------------------------------------------
+
+quiet_cmd_ar = AR      $@
+cmd_ar = rm -f $@; $(AR) cPrs $@ $(real-prereqs)
 
 # Objcopy
 # ---------------------------------------------------------------------------
@@ -86,6 +97,10 @@ obj-y    := $(patsubst %/, %/built_in.o, $(obj-y))
 # tell kbuild to descend
 subdir-obj-y := $(filter %/built_in.o, $(obj-y))
 
+# Libraries are always collected in one lib file.
+# Filter out objects already built-in
+lib-y := $(filter-out $(obj-y), $(sort $(lib-y)))
+
 $(filter %.init.o,$(obj-y) $(obj-bin-y) $(extra-y)): CFLAGS-y += -DINIT_SECTIONS_ONLY
 
 ifeq ($(CONFIG_COVERAGE),y)
@@ -129,7 +144,7 @@ include $(BASEDIR)/arch/$(TARGET_ARCH)/Rules.mk
 c_flags += $(CFLAGS-y)
 a_flags += $(CFLAGS-y) $(AFLAGS-y)
 
-built_in.o: $(obj-y) $(extra-y)
+built_in.o: $(obj-y) $(if $(strip $(lib-y)),lib.a) $(extra-y)
 ifeq ($(strip $(obj-y)),)
 	$(CC) $(c_flags) -c -x c /dev/null -o $@
 else
@@ -140,8 +155,14 @@ else
 endif
 endif
 
+lib.a: $(lib-y) FORCE
+	$(call if_changed,ar)
+
 targets += built_in.o
-targets += $(filter-out $(subdir-obj-y), $(obj-y)) $(extra-y)
+ifneq ($(strip $(lib-y)),)
+targets += lib.a
+endif
+targets += $(filter-out $(subdir-obj-y), $(obj-y) $(lib-y)) $(extra-y)
 targets += $(MAKECMDGOALS)
 
 built_in_bin.o: $(obj-bin-y) $(extra-y)
@@ -155,7 +176,7 @@ endif
 PHONY += FORCE
 FORCE:
 
-%/built_in.o: FORCE
+%/built_in.o %/lib.a: FORCE
 	$(MAKE) -f $(BASEDIR)/Rules.mk -C $* built_in.o
 
 %/built_in_bin.o: FORCE
diff --git a/xen/arch/arm/Makefile b/xen/arch/arm/Makefile
index 296c5e68bbc3..612a83b315c8 100644
--- a/xen/arch/arm/Makefile
+++ b/xen/arch/arm/Makefile
@@ -90,14 +90,14 @@ endif
 
 ifeq ($(CONFIG_LTO),y)
 # Gather all LTO objects together
-prelink_lto.o: $(ALL_OBJS)
-	$(LD_LTO) -r -o $@ $^
+prelink_lto.o: $(ALL_OBJS) $(ALL_LIBS)
+	$(LD_LTO) -r -o $@ $(filter-out %.a,$^) --start-group $(filter %.a,$^) --end-group
 
 # Link it with all the binary objects
 prelink.o: $(patsubst %/built_in.o,%/built_in_bin.o,$(ALL_OBJS)) prelink_lto.o
 	$(call if_changed,ld)
 else
-prelink.o: $(ALL_OBJS) FORCE
+prelink.o: $(ALL_OBJS) $(ALL_LIBS) FORCE
 	$(call if_changed,ld)
 endif
 
diff --git a/xen/arch/x86/Makefile b/xen/arch/x86/Makefile
index 9b368632fb43..8f2180485b2b 100644
--- a/xen/arch/x86/Makefile
+++ b/xen/arch/x86/Makefile
@@ -132,8 +132,8 @@ EFI_OBJS-$(XEN_BUILD_EFI) := efi/relocs-dummy.o
 
 ifeq ($(CONFIG_LTO),y)
 # Gather all LTO objects together
-prelink_lto.o: $(ALL_OBJS)
-	$(LD_LTO) -r -o $@ $^
+prelink_lto.o: $(ALL_OBJS) $(ALL_LIBS)
+	$(LD_LTO) -r -o $@ $(filter-out %.a,$^) --start-group $(filter %.a,$^) --end-group
 
 # Link it with all the binary objects
 prelink.o: $(patsubst %/built_in.o,%/built_in_bin.o,$(ALL_OBJS)) prelink_lto.o $(EFI_OBJS-y) FORCE
@@ -142,10 +142,10 @@ prelink.o: $(patsubst %/built_in.o,%/built_in_bin.o,$(ALL_OBJS)) prelink_lto.o $
 prelink-efi.o: $(patsubst %/built_in.o,%/built_in_bin.o,$(ALL_OBJS)) prelink_lto.o FORCE
 	$(call if_changed,ld)
 else
-prelink.o: $(ALL_OBJS) $(EFI_OBJS-y) FORCE
+prelink.o: $(ALL_OBJS) $(ALL_LIBS) $(EFI_OBJS-y) FORCE
 	$(call if_changed,ld)
 
-prelink-efi.o: $(ALL_OBJS) FORCE
+prelink-efi.o: $(ALL_OBJS) $(ALL_LIBS) FORCE
 	$(call if_changed,ld)
 endif
 
diff --git a/xen/lib/Makefile b/xen/lib/Makefile
index 53b1da025e0d..b8814361d63e 100644
--- a/xen/lib/Makefile
+++ b/xen/lib/Makefile
@@ -1,2 +1,3 @@
-obj-y += ctype.o
 obj-$(CONFIG_X86) += x86/
+
+lib-y += ctype.o


