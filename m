Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4463945DB86
	for <lists+xen-devel@lfdr.de>; Thu, 25 Nov 2021 14:47:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.231280.400224 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqF63-0003sl-Lk; Thu, 25 Nov 2021 13:47:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 231280.400224; Thu, 25 Nov 2021 13:47:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqF63-0003oC-Dw; Thu, 25 Nov 2021 13:47:31 +0000
Received: by outflank-mailman (input) for mailman id 231280;
 Thu, 25 Nov 2021 13:47:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Nd7+=QM=citrix.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1mqF11-0007NX-UI
 for xen-devel@lists.xenproject.org; Thu, 25 Nov 2021 13:42:20 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 815005b7-4df5-11ec-9787-a32c541c8605;
 Thu, 25 Nov 2021 14:42:18 +0100 (CET)
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
X-Inumbo-ID: 815005b7-4df5-11ec-9787-a32c541c8605
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1637847738;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=wkmmiuAD5A/O6wcnuJk4gUEzCv+65h31hRHwc6XHY2w=;
  b=iH/P2RzQoGeJIA+Ew9BWhtKj9PUUCyidqnwFIdsS3F/FfUa4M5nY4sBz
   CoXCKBXA0u4+c5s8vaN4fI9Arg2GmtfEiw/ncbjn+wyp1LzFxrIy+cykU
   2LHMVsmsZOr7306Uz3on4jroU3pIZM86veo9M1KAgJv1ISsnCY/YG/PpA
   I=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: R82v6C2kRPXf0jXbtE48KEQxG+CWaoeMQ5FnYNrQlUFHbAfGUHs+G0utV/8rwDI+ccNgQebkTI
 VqkFzV78T12ra6gTwelPh9pAAdW9qr4w3N8xtB60cM8af3HSgd/4OLHJBZAED2uVLdy6x12r/1
 ClmkbVcznAUnYJ6eeavffD3K/jt5IEzQjGoLfiwaM/xDIkV7XqWSlnakcllA0Q7SRfxt/si2Li
 YkAojBWDIP3IgHTblx7/WDAh6+GZGa3fEL1jFuh1DgqTQvHjLfq+yxLPu6POPGlloVlhIlhXaD
 Z+WJweHl5XffGNny2kvyBQV3
X-SBRS: 5.1
X-MesageID: 59006070
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:OMZmz6+/iCywXLrmYY/8DrUDuHmTJUtcMsCJ2f8bNWPcYEJGY0x3z
 WdKD23UbvbeZTHzfNkkPo20px4EsZ6DmIMxGgU9/Cg8E34SpcT7XtnIdU2Y0wF+jyHgoOCLy
 +1EN7Es+ehtFie0Si9AttENlFEkvU2ybuOU5NXsZ2YhGmeIdA970Ug6wrdj39Yy6TSEK1jlV
 e3a8pW31GCNg1aYAkpMg05UgEoy1BhakGpwUm0WPZinjneH/5UmJMt3yZWKB2n5WuFp8tuSH
 I4v+l0bElTxpH/BAvv9+lryn9ZjrrT6ZWBigVIOM0Sub4QrSoXfHc/XOdJFAXq7hQllkPg22
 M9Dm6GNbD5zGYzyk/tCdBJ8UAthaPguFL/veRBTsOSWxkzCNXDt3+9vHAc9OohwFuRfWD8Us
 6ZCcXZUM07F17neLLGTE4GAguwqKtXrO4UO/Glt1zjDAd4tQIzZQrWM7thdtNs1rp0fRa6AP
 5VBAdZpRD6RcSYIFU0UMrI3rOz0uVTxKgJCmHvA8MLb5ECMlVcsgdABKuH9ZdiiVchT2EGCq
 Qru/nv7KgEXMsSFzjiI+W7qgfXA9QvrVYRXGLCm+/pChFyI2ndVGBAQTUG8o/Sylgi5Qd03F
 qAP0nNw9+5orhXtF4SjGU3jyJKZgvICc51ACeMU1Tyo8/DzwjiSGTcjRRoCQsNz4afaWgcW/
 lOOmtroAxlmv7uUVW+R+9+okN+iBcQGBTRcPHFZFGPp9/Gm+dhu1UyXEr6PBYbs1oWtcQwc1
 Qxmu8TXa187qccQn5u28lnc695HjsiYF1Vljuk7s4/M0++YWGJHT9D3gbQ4xawZRGp8crVml
 CJZ8/VyFMhUUfmweNWlGY3h5o2B6fefKyH7ilVyBZQn/DnF0yf9Jt8Pv2AudBYzbJdsldrVj
 Kj741052XOuFCHyMf8fj3yZV6zGMpQM5fy6D6uJP7Kik7B6dROd/TEGWKJj9zuFraTYqolmY
 c3zWZ/1VR4yUP07pBLrF7Z1+eJ6nUgWmDKMLa0XOjz6iNJyklbOEuxbWLZPB8hkhJ65TPL9r
 4wCapDUkkoHC4UToED/qOYuELzDFlBjbbieliCdXrTrztNOFD5zBvnP76kmfoA5za1Zmv2Rp
 iO2W1NCyUq5jnrCcF3YZndmYbLpfJB+sXNkYnB8YQf2gyAuMdS18aMSV5orZr17puZt+uF5E
 qsecMKaD/URFjmeo2YBbYPwpZBJfQiwgV7cJDKsZTUyJsYyRwHA9tL+UBHo8S0CUni+ucck+
 uXy3QLHW5sTAQ9lCZ+OOv6oylqwu1kbmf5zABSUcoUCJh20/dEzeSLrj/IxL8UdEjn5x2OXh
 1SMHBMVhejRuItpotPHsr+J8tWyGOxkE0sEQ2SCteSqNTPX93aIyJNbVLraZijUUW759fnwZ
 ehRyP2gYvQLkEwT7th5Grdvi6k/+8Hut/lRyQE9RCfHaFGiC7VBJHia3JYQ6v0Rl+EB4QbmC
 FiS/tR6OKmSPJK3GVEcEwMpc+Cf2KxGgTLV9/k0fB336SIfEGBriqmO081gUBBgEYY=
IronPort-HdrOrdr: A9a23:237/UaiMNNsVv/Umq9CySerEk3BQXhIji2hC6mlwRA09TyXPrb
 HJoB17726NtN9/YgBCpTntAtjjfZq+z/JICOsqU4tKjDOIhILyFuBfBOLZqlWKcUDDH4ZmpN
 xdmsNFaOEYY2IK6voTt2KDYqsdKIbtytHV9JnjJ0kGd3APV0gZ1XYdNu8wKDwINXh77M0CZe
 Chz/sCnjy/dW8aY4CRNhA+LpH+m+E=
X-IronPort-AV: E=Sophos;i="5.87,263,1631592000"; 
   d="scan'208";a="59006070"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@citrix.com>, Ian Jackson
	<iwj@xenproject.org>, Wei Liu <wl@xen.org>
Subject: [XEN PATCH v8 47/47] WIP: no more link farming for xen-shim
Date: Thu, 25 Nov 2021 13:40:06 +0000
Message-ID: <20211125134006.1076646-48-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.34.0
In-Reply-To: <20211125134006.1076646-1-anthony.perard@citrix.com>
References: <20211125134006.1076646-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

---
 tools/firmware/xen-dir/Makefile | 71 ++-------------------------------
 1 file changed, 3 insertions(+), 68 deletions(-)

diff --git a/tools/firmware/xen-dir/Makefile b/tools/firmware/xen-dir/Makefile
index 6f5e208ab413..a50fdcbb8b17 100644
--- a/tools/firmware/xen-dir/Makefile
+++ b/tools/firmware/xen-dir/Makefile
@@ -7,74 +7,9 @@ FORCE:
 
 D=xen-root
 
-# Minimun set of files / directories go get Xen to build
-LINK_DIRS=config xen
-LINK_FILES=Config.mk
-
-DEP_DIRS=$(foreach i, $(LINK_DIRS), $(XEN_ROOT)/$(i))
-DEP_FILES=$(foreach i, $(LINK_FILES), $(XEN_ROOT)/$(i))
-
-# Exclude some intermediate files and final build products
-LINK_EXCLUDES := '*.[isoa]' '*.bin' '*.chk' '*.lnk' '*.gz' '.*'
-LINK_EXCLUDES += lexer.lex.? parser.tab.? conf
-LINK_EXCLUDES += asm-offsets.h asm-macros.h compile.h '*-autogen.h'
-LINK_EXCLUDES += mkelf32 mkreloc symbols config_data.S xen.lds efi.lds
-LINK_EXCLUDES += '*.map' xen xen.gz xen.efi xen-syms check.efi
-
-# To exclude full subtrees or individual files of not sufficiently specific
-# names, regular expressions are used:
-LINK_EXCLUDE_PATHS := xen/include/compat/.*
-LINK_EXCLUDE_PATHS += xen/include/config/.*
-LINK_EXCLUDE_PATHS += xen/include/generated/.*
-LINK_EXCLUDE_PATHS += xen/arch/x86/boot/reloc[.]S
-LINK_EXCLUDE_PATHS += xen/arch/x86/boot/cmdline[.]S
-
-# This is all a giant mess and doesn't really work.
-#
-# The correct solution is to fix Xen to be able to do out-of-tree builds.
-#
-# Until that happens, we set up a linkfarm by iterating over the xen/ tree,
-# linking source files.  This is repeated each time we enter this directory,
-# which poses a problem for a two-step "make; make install" build process.
-#
-# Any time the list of files to link changes, we relink all files, then
-# distclean to take out not-easy-to-classify intermediate files.  This is to
-# support easy development of the shim, but has a side effect of clobbering
-# the already-built shim.
-#
-# $(LINK_EXCLUDES) and $(LINK_EXCLUDE_DIRS) should be set such that a parallel
-# build of shim and xen/ doesn't cause a subsequent `make install` to decide to
-# regenerate the linkfarm.  This means that all intermediate and final build
-# artefacts must be excluded.
-linkfarm.stamp: $(DEP_DIRS) $(DEP_FILES) FORCE
-	mkdir -p $(D)
-	rm -f linkfarm.stamp.tmp
-	set -e; \
-	$(foreach d, $(LINK_DIRS), \
-		 (mkdir -p $(D)/$(d); \
-		  cd $(D)/$(d); \
-		  find $(XEN_ROOT)/$(d)/ -type d |\
-			sed 's,^$(XEN_ROOT)/$(d)/,,g' | xargs mkdir -p .);) \
-	$(foreach d, $(LINK_DIRS), \
-		(cd $(XEN_ROOT); \
-		 find $(d) ! -type l -type f $(addprefix ! -name ,$(LINK_EXCLUDES)) \
-		 | grep -v $(patsubst %,-e '^%$$',$(LINK_EXCLUDE_PATHS))) \
-		 >> linkfarm.stamp.tmp ; ) \
-	$(foreach f, $(LINK_FILES), \
-		echo $(f) >> linkfarm.stamp.tmp ;)
-	cmp -s linkfarm.stamp.tmp linkfarm.stamp && \
-		rm linkfarm.stamp.tmp || { \
-		cat linkfarm.stamp.tmp | while read f; \
-		  do rm -f "$(D)/$$f"; ln -s "$(XEN_ROOT)/$$f" "$(D)/$$f"; done; \
-		mv linkfarm.stamp.tmp linkfarm.stamp; \
-		}
-
-# Copy enough of the tree to build the shim hypervisor
-$(D): linkfarm.stamp
-	$(MAKE) -C $(D)/xen distclean
-
-$(D)/xen/.config: $(D)
-	$(MAKE) -C $(@D) KBUILD_DEFCONFIG=pvshim_defconfig defconfig
+$(D)/xen/.config: FORCE
+	mkdir -p $(@D)
+	$(MAKE) -f $(XEN_ROOT)/xen/Makefile -C $(@D) KBUILD_DEFCONFIG=pvshim_defconfig defconfig
 
 xen-shim: $(D)/xen/.config
 	$(MAKE) -C $(<D) build
-- 
Anthony PERARD


