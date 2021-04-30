Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DE00236FCA2
	for <lists+xen-devel@lfdr.de>; Fri, 30 Apr 2021 16:44:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.120573.228021 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lcUN9-0002Zc-Km; Fri, 30 Apr 2021 14:44:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 120573.228021; Fri, 30 Apr 2021 14:44:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lcUN9-0002ZD-Hc; Fri, 30 Apr 2021 14:44:03 +0000
Received: by outflank-mailman (input) for mailman id 120573;
 Fri, 30 Apr 2021 14:44:02 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=T1Xz=J3=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lcUN8-0002Z8-4E
 for xen-devel@lists.xenproject.org; Fri, 30 Apr 2021 14:44:02 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c6a8a42e-123d-443f-948a-289655a324d8;
 Fri, 30 Apr 2021 14:44:00 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 1EC00B038;
 Fri, 30 Apr 2021 14:44:00 +0000 (UTC)
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
X-Inumbo-ID: c6a8a42e-123d-443f-948a-289655a324d8
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1619793840; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6oCDlYqqGUYNrVBiSX4LnnYH4/TGpQyc8Ua94Bo9cz4=;
	b=kh52rfQ1VbsqkBNHFH7MztwWog9cjV53kxOQg3f46X35nGXMQG7qgpiUB6nqUaQe1hv7/S
	Zcu36SmSsRzZra521hbcF9CLbPdkH9YmbQxWcW1o4/OCVfpbAk1IZ+l3EZvOPkhC73XG8+
	ltKwjMSAesnXsZCduLOdRo7fNlaacio=
Subject: [PATCH 1/3] firmware/shim: update linkfarm exclusions
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Ian Jackson <iwj@xenproject.org>
References: <19695ffc-34d8-b682-b092-668f872d4e57@suse.com>
Message-ID: <d6f37d26-a883-b194-07a9-1ab87d5961f7@suse.com>
Date: Fri, 30 Apr 2021 16:43:59 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <19695ffc-34d8-b682-b092-668f872d4e57@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Some intermediate files weren't considered at all at the time. Also
after its introduction, various changes to the build environment have
rendered the exclusion sets stale. For example, we now have some .*.cmd
files in the build tree.  Combine all respective patterns into a single
.* one, seeing that we don't have any actual source files matching this
pattern in the tree. Add other patterns as well as individual files.
Also introduce LINK_EXCLUDE_PATHS to deal with entire directories full
of generated headers as well as a few specific files the names of which
are too generic to list under LINK_EXCLUDES.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/tools/firmware/xen-dir/Makefile
+++ b/tools/firmware/xen-dir/Makefile
@@ -15,9 +15,19 @@ DEP_DIRS=$(foreach i, $(LINK_DIRS), $(XE
 DEP_FILES=$(foreach i, $(LINK_FILES), $(XEN_ROOT)/$(i))
 
 # Exclude some intermediate files and final build products
-LINK_EXCLUDES := '*.[isoa]' '.*.d' '.*.d2' '.config'
-LINK_EXCLUDES += '*.map' 'xen' 'xen.gz' 'xen.efi' 'xen-syms'
-LINK_EXCLUDES += '.*.tmp'
+LINK_EXCLUDES := '*.[isoa]' '*.bin' '*.chk' '*.lnk' '*.gz' '.*'
+LINK_EXCLUDES += lexer.lex.? parser.tab.? conf
+LINK_EXCLUDES += asm-offsets.h asm-macros.h compile.h '*-autogen.h'
+LINK_EXCLUDES += mkelf32 mkreloc symbols config_data.S xen.lds efi.lds
+LINK_EXCLUDES += '*.map' xen xen.gz xen.efi xen-syms check.efi
+
+# To exclude full subtrees or individual files of not sufficiently specific
+# names, regular expressions are used:
+LINK_EXCLUDE_PATHS := xen/include/compat/.*
+LINK_EXCLUDE_PATHS += xen/include/config/.*
+LINK_EXCLUDE_PATHS += xen/include/generated/.*
+LINK_EXCLUDE_PATHS += xen/arch/x86/boot/reloc[.]S
+LINK_EXCLUDE_PATHS += xen/arch/x86/boot/cmdline[.]S
 
 # This is all a giant mess and doesn't really work.
 #
@@ -32,9 +42,10 @@ LINK_EXCLUDES += '.*.tmp'
 # support easy development of the shim, but has a side effect of clobbering
 # the already-built shim.
 #
-# $(LINK_EXCLUDES) should be set such that a parallel build of shim and xen/
-# doesn't cause a subsequent `make install` to decide to regenerate the
-# linkfarm.  This means that all final build artefacts must be excluded.
+# $(LINK_EXCLUDES) and $(LINK_EXCLUDE_DIRS) should be set such that a parallel
+# build of shim and xen/ doesn't cause a subsequent `make install` to decide to
+# to regenerate the linkfarm.  This means that all intermediate and final build
+# artefacts must be excluded.
 linkfarm.stamp: $(DEP_DIRS) $(DEP_FILES) FORCE
 	mkdir -p $(D)
 	rm -f linkfarm.stamp.tmp
@@ -46,7 +57,8 @@ linkfarm.stamp: $(DEP_DIRS) $(DEP_FILES)
 			sed 's,^$(XEN_ROOT)/$(d)/,,g' | xargs mkdir -p .);) \
 	$(foreach d, $(LINK_DIRS), \
 		(cd $(XEN_ROOT); \
-		 find $(d) ! -type l -type f $(addprefix ! -name ,$(LINK_EXCLUDES))) \
+		 find $(d) ! -type l -type f $(addprefix ! -name ,$(LINK_EXCLUDES)) \
+		 | grep -v $(patsubst %,-e '^%$$',$(LINK_EXCLUDE_PATHS))) \
 		 >> linkfarm.stamp.tmp ; ) \
 	$(foreach f, $(LINK_FILES), \
 		echo $(f) >> linkfarm.stamp.tmp ;)


