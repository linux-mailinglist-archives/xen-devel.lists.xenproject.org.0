Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B6DC45DB99
	for <lists+xen-devel@lfdr.de>; Thu, 25 Nov 2021 14:48:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.231322.400413 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqF6i-0004xg-4d; Thu, 25 Nov 2021 13:48:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 231322.400413; Thu, 25 Nov 2021 13:48:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqF6h-0004YY-HT; Thu, 25 Nov 2021 13:48:11 +0000
Received: by outflank-mailman (input) for mailman id 231322;
 Thu, 25 Nov 2021 13:48:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Nd7+=QM=citrix.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1mqF0g-00076i-37
 for xen-devel@lists.xenproject.org; Thu, 25 Nov 2021 13:41:58 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 74b08918-4df5-11ec-a9d2-d9f7a1cc8784;
 Thu, 25 Nov 2021 14:41:56 +0100 (CET)
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
X-Inumbo-ID: 74b08918-4df5-11ec-a9d2-d9f7a1cc8784
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1637847716;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=84a5ACH3vmAplQpyvArcPgKE++VGrDYmdqQ8lZna65Y=;
  b=XmnRi66U57wVpGy2N8C9O9ZpxM/AHVygD4tWwRDQ+hBKZlJR1z4fmnDh
   vbNpk7VuoPqLK/y4hxC5cu34HXUThQiU7RqMuCNyYS3nvWSUDCDjWHMq1
   E4+xMIISi9sHsB6lXgEeKlbJ0U0ZLIohjC39jfdekZpypOiCRBO0gjRrV
   o=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: NHGO3+FqzGWJR3qr8dh1z4wByAV6s5GnusgFPkohcA9qRdv6G1CfCKN7ZBURhD4yH/c5u8FIo/
 SGHBggdKiwQvO1hN30KMLebjCjhjwwFG+pHnXmw/Sdfa8IMLZ1CvKUOxpEN5KON2FAmxJ+YG57
 h4OSpdS0+Zj2Q6EckDOOexSxPmXSKxFs1mhv/HUHHjM8d03ypUDFQTd/h80oF0seopIrVGOCQL
 rGc4AlX4ZYNJHcLWH4vPxuYxN0ck4+Boxs2w5Gq4KVoUn2m5FQ67hmIjuUfEIaLOl1NtDYf8FU
 d7J1QImx3gg7WDEWcFS+D+0P
X-SBRS: 5.1
X-MesageID: 58617708
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:oFz2fKDTA3Y1GxVW/4nkw5YqxClBgxIJ4kV8jS/XYbTApDoh1DRRy
 2scUWDXO6qNZTTzfY8gYd6x/BsGuZ6Ey9FgQQY4rX1jcSlH+JHPbTi7wuYcHM8wwunrFh8PA
 xA2M4GYRCwMo/u1Si6FatANl1ElvU2zbue6WLGs1hxZH1c+EX540087wYbVv6Yz6TSHK1LV0
 T/Ni5W31G+Ng1aY5UpNtspvADs21BjDkGtwUm4WPJinj3eH/5UhN7oNJLnZEpfNatI88thW5
 Qr05OrREmvxp3/BAz4++1rxWhVirrX6ZWBihpfKMkQLb9crSiEai84G2PQghUh/lSmEuv1Sz
 dt2usarWwI0JOrGxOM4akwNe81+FfUuFL7vJHG+tYqYzlHccmuqyPJrZK00FdRGoKAtWzgIr
 KFGbmBWBvyAr7veLLaTQ+9whsMlPY/zMZkWoH1IxjDFF/c2B5vERs0m4PcFjGlp2Z8WTZ4yY
 eIgRjdtKw79OSF1O1QYU6kjxeaavlLWJmgwRFW9+vNsvjm7IBZK+KP2LNPfd9iORMNUtkWVv
 GTL+yL+GB5yHN6CzTuI9Fq8i+mJmjn0MKoZHae08fNCi1SJymseThYRUDOTvv2RmkO4HdVFJ
 CQ88ywyra805QqzQ8P0RRGQr3uNvxpaUN1Ve8Uq5QfIxqfK7gKxAmkfUiUHeNEgrNUxRzEhy
 hmOhdyBLT5lvaCRSHmd3qyJtj70Mi8QRUcDei0sXQYD+8Pkoow4klTIVNkLLUKupoSrQ3eqm
 WnM9XVgweVI5SIW60ml1U7bjheBhZ3HdQFv/RfSQ3ji5F9+QbfwMuRE9mPnxfpHKY+YSHyIs
 34Fh9WS4YgyMH2dqMCeaL5TRe/0vp5pJBWZ2AcyRMd5q1xB7lb6JdgIiAySMnuFJSrtldXBR
 EbI8T1c65ZIVJdBRf8mOtnhYyjGIEWJKDgEahw2RoYRCnSSXFXelM2LWaJ39zqw+HXAaYllZ
 f+mnT+EVB7285hPwjusXPs62rQ23C04zm67bcmllEv4juvONC/PF+Zt3L6yggcRtv3sneko2
 4wHa5viJ+t3DIUSnRU7AaZMdAtXfBDX9Lj9qtBNd/7rH+aVMDpJNhMl+pt4I9YNt/0Mzo/gp
 yjhMmcFmAuXrSCWcm2iNyE8AI4DqL4i9BrXywR3Zg32s5XiCK7yhJoim2wfIeN6qbc9lKEsF
 JHouayoW5xyd9gOwBxFBbGVkWCoXEjDadumM3X3bT4hUYRnQgCVqNbochG2rHsFDzattNt4q
 Lqlj1uJTZ0GTgVkLcDXdPPwkA/h4SlDwLp/DxnSP91eWETw64w2eSb/ueA6fpMXIhLZyzrEi
 wvPWUUEpfPAqpMe+cXSgfzWtJ+gFuZzRxIIH2TS4busGzPd+26vnd1JXOqSJGiPX2Lo4qSyI
 +5SyqikYvEAmV9Ltat6Eqpqkv1it4e++ecCw109TnvRblmtBrdxGVW83JFC5v9X27tUmQqqQ
 UbTqNNUDqqEZZH+G1kLKQt7MunajaMImiPf5OgeKVnh4HMl56KOVEhfMkXeiCFZK7cpYoopz
 f145ZwT4g27zBErLsyHnmZf8GHVdi4MVKAut5c7Bo73i1V0lgEeMMKEUiKmsouSb9hsM1UxJ
 m7GjaXPsL1Q207efidhDnPKx+dc2cwDtR0iIIXu/LhVdg4pXsMK4SA=
IronPort-HdrOrdr: A9a23:YLJgla9abbmZx1nCxcBuk+DeI+orL9Y04lQ7vn2YSXRuHfBw8P
 re+8jztCWE8Qr5N0tApTntAsS9qDbnhPxICOoqTNOftWvd2FdARbsKheCJ/9SjIVyaygc079
 YHT0EUMrPN5DZB4foSmDPIcOod/A==
X-IronPort-AV: E=Sophos;i="5.87,263,1631592000"; 
   d="scan'208";a="58617708"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@citrix.com>, Anthony PERARD
	<anthony.perard@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	"George Dunlap" <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
	"Jan Beulich" <jbeulich@suse.com>, Julien Grall <julien@xen.org>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, Doug Goldstein
	<cardoe@cardoe.com>
Subject: [XEN PATCH v8 38/47] WIP, no-VPATH: rework Makefile.host
Date: Thu, 25 Nov 2021 13:39:57 +0000
Message-ID: <20211125134006.1076646-39-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.34.0
In-Reply-To: <20211125134006.1076646-1-anthony.perard@citrix.com>
References: <20211125134006.1076646-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Anthony PERARD <anthony.perard@gmail.com>

Allow to build 'defconfig' target without VPATH in out-of-tree build

Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
---
 xen/scripts/Makefile.host  | 34 +++++++++++++++++++++++++---------
 xen/tools/kconfig/Makefile | 12 +++++++++---
 2 files changed, 34 insertions(+), 12 deletions(-)

diff --git a/xen/scripts/Makefile.host b/xen/scripts/Makefile.host
index d6c358095ee8..d083c6dbca76 100644
--- a/xen/scripts/Makefile.host
+++ b/xen/scripts/Makefile.host
@@ -8,7 +8,7 @@ target-stem = $(basename $(patsubst $(obj)/%,%,$@))
 quiet_cmd_flex = LEX     $@
       cmd_flex = $(LEX) -o$@ -L $<
 
-$(obj)/%.lex.c: $(src)/%.l FORCE
+$(obj)/%.lex.c: $(srctree)/$(src)/%.l FORCE
 	$(call if_changed,flex)
 
 # YACC
@@ -16,7 +16,7 @@ $(obj)/%.lex.c: $(src)/%.l FORCE
 quiet_cmd_bison = YACC    $(basename $@).[ch]
       cmd_bison = $(YACC) -o $(basename $@).c --defines=$(basename $@).h -t -l $<
 
-$(obj)/%.tab.c $(obj)/%.tab.h: $(src)/%.y FORCE
+$(obj)/%.tab.c $(obj)/%.tab.h: $(srctree)/$(src)/%.y FORCE
 	$(call if_changed,bison)
 
 # ==========================================================================
@@ -56,6 +56,11 @@ host-cmulti	:= $(foreach m,$(__hostprogs),\
 
 # Object (.o) files compiled from .c files
 host-cobjs	:= $(sort $(foreach m,$(__hostprogs),$($(m)-objs)))
+# from generated .c files
+host-cobjs-generated	:= $(sort $(foreach m,$(__hostprogs),$($(m)-objs-generated)))
+ifndef building_out_of_srctree
+host-cobjs += $(host-cobjs-generated)
+endif
 
 # C++ code
 # C++ executables compiled from at least one .cc file
@@ -72,6 +77,9 @@ host-cxxshobjs	:= $(sort $(foreach m,$(host-cxxshlib),$($(m:.so=-objs))))
 host-csingle	:= $(addprefix $(obj)/,$(host-csingle))
 host-cmulti	:= $(addprefix $(obj)/,$(host-cmulti))
 host-cobjs	:= $(addprefix $(obj)/,$(host-cobjs))
+ifdef building_out_of_srctree
+host-cobjs-generated	:= $(addprefix $(obj)/,$(host-cobjs-generated))
+endif
 host-cxxmulti	:= $(addprefix $(obj)/,$(host-cxxmulti))
 host-cxxobjs	:= $(addprefix $(obj)/,$(host-cxxobjs))
 host-cshlib	:= $(addprefix $(obj)/,$(host-cshlib))
@@ -104,25 +112,30 @@ hostcxx_flags  = -Wp,-MD,$(depfile) $(_hostcxx_flags)
 quiet_cmd_host-csingle 	= HOSTCC  $@
       cmd_host-csingle	= $(HOSTCC) $(hostc_flags) $(HOSTLDFLAGS) -o $@ $< \
 		$(HOSTLDLIBS) $(HOSTLDLIBS_$(target-stem))
-$(host-csingle): $(obj)/%: $(src)/%.c FORCE
+$(host-csingle): $(obj)/%: $(srctree)/$(src)/%.c FORCE
 	$(call if_changed_dep,host-csingle)
 
 # Link an executable based on list of .o files, all plain c
 # host-cmulti -> executable
 quiet_cmd_host-cmulti	= HOSTLD  $@
       cmd_host-cmulti	= $(HOSTCC) $(HOSTLDFLAGS) -o $@ \
-			  $(addprefix $(obj)/, $($(target-stem)-objs)) \
+			  $(foreach o,objs objs-generated, \
+			  $(addprefix $(obj)/, $($(target-stem)-$(o)))) \
 			  $(HOSTLDLIBS) $(HOSTLDLIBS_$(target-stem))
 $(host-cmulti): FORCE
 	$(call if_changed,host-cmulti)
-$(call multi-depend, $(host-cmulti), , -objs)
+$(call multi-depend, $(host-cmulti), , -objs -objs-generated)
 
 # Create .o file from a single .c file
 # host-cobjs -> .o
 quiet_cmd_host-cobjs	= HOSTCC  $@
       cmd_host-cobjs	= $(HOSTCC) $(hostc_flags) -c -o $@ $<
-$(host-cobjs): $(obj)/%.o: $(src)/%.c FORCE
+$(host-cobjs): $(obj)/%.o: $(srctree)/$(src)/%.c FORCE
 	$(call if_changed_dep,host-cobjs)
+ifdef building_out_of_srctree
+$(host-cobjs-generated): $(obj)/%.o: $(obj)/%.c FORCE
+	$(call if_changed_dep,host-cobjs)
+endif
 
 # Link an executable based on list of .o files, a mixture of .c and .cc
 # host-cxxmulti -> executable
@@ -138,14 +151,14 @@ $(call multi-depend, $(host-cxxmulti), , -objs -cxxobjs)
 # Create .o file from a single .cc (C++) file
 quiet_cmd_host-cxxobjs	= HOSTCXX $@
       cmd_host-cxxobjs	= $(HOSTCXX) $(hostcxx_flags) -c -o $@ $<
-$(host-cxxobjs): $(obj)/%.o: $(src)/%.cc FORCE
+$(host-cxxobjs): $(obj)/%.o: $(srctree)/$(src)/%.cc FORCE
 	$(call if_changed_dep,host-cxxobjs)
 
 # Compile .c file, create position independent .o file
 # host-cshobjs -> .o
 quiet_cmd_host-cshobjs	= HOSTCC  -fPIC $@
       cmd_host-cshobjs	= $(HOSTCC) $(hostc_flags) -fPIC -c -o $@ $<
-$(host-cshobjs): $(obj)/%.o: $(src)/%.c FORCE
+$(host-cshobjs): $(obj)/%.o: $(srctree)/$(src)/%.c FORCE
 	$(call if_changed_dep,host-cshobjs)
 
 # Compile .c file, create position independent .o file
@@ -155,7 +168,7 @@ $(host-cshobjs): $(obj)/%.o: $(src)/%.c FORCE
 # host-cxxshobjs -> .o
 quiet_cmd_host-cxxshobjs	= HOSTCXX -fPIC $@
       cmd_host-cxxshobjs	= $(HOSTCXX) $(hostcxx_flags) -fPIC -c -o $@ $<
-$(host-cxxshobjs): $(obj)/%.o: $(src)/%.c FORCE
+$(host-cxxshobjs): $(obj)/%.o: $(srctree)/$(src)/%.c FORCE
 	$(call if_changed_dep,host-cxxshobjs)
 
 # Link a shared library, based on position independent .o files
@@ -180,3 +193,6 @@ $(call multi-depend, $(host-cxxshlib), .so, -objs)
 
 targets += $(host-csingle)  $(host-cmulti) $(host-cobjs)\
 	   $(host-cxxmulti) $(host-cxxobjs) $(host-cshlib) $(host-cshobjs) $(host-cxxshlib) $(host-cxxshobjs)
+ifdef building_out_of_srctree
+targets += $(host-cobjs-generated)
+endif
diff --git a/xen/tools/kconfig/Makefile b/xen/tools/kconfig/Makefile
index b7b9a419ad59..c2ecf4b36652 100644
--- a/xen/tools/kconfig/Makefile
+++ b/xen/tools/kconfig/Makefile
@@ -146,8 +146,9 @@ help:
 
 # ===========================================================================
 # object files used by all kconfig flavours
-common-objs	:= confdata.o expr.o lexer.lex.o parser.tab.o preprocess.o \
+common-objs	:= confdata.o expr.o  preprocess.o \
 		   symbol.o
+common-objs-generated := lexer.lex.o parser.tab.o
 
 $(obj)/lexer.lex.o: $(obj)/parser.tab.h
 HOSTCFLAGS_lexer.lex.o	:= -I $(srctree)/$(src)
@@ -156,10 +157,12 @@ HOSTCFLAGS_parser.tab.o	:= -I $(srctree)/$(src)
 # conf: Used for defconfig, oldconfig and related targets
 hostprogs-y	+= conf
 conf-objs	:= conf.o $(common-objs)
+conf-objs-generated := $(common-objs-generated)
 
 # nconf: Used for the nconfig target based on ncurses
 hostprogs-y	+= nconf
 nconf-objs	:= nconf.o nconf.gui.o $(common-objs)
+nconf-objs-generated := $(common-objs-generated)
 
 HOSTLDLIBS_nconf	= $(shell . $(obj)/nconf-cfg && echo $$libs)
 HOSTCFLAGS_nconf.o	= $(shell . $(obj)/nconf-cfg && echo $$cflags)
@@ -172,6 +175,7 @@ hostprogs-y	+= mconf
 lxdialog	:= $(addprefix lxdialog/, \
 		     checklist.o inputbox.o menubox.o textbox.o util.o yesno.o)
 mconf-objs	:= mconf.o $(lxdialog) $(common-objs)
+mconf-objs-generated	:= $(common-objs-generated)
 
 HOSTLDLIBS_mconf = $(shell . $(obj)/mconf-cfg && echo $$libs)
 $(foreach f, mconf.o $(lxdialog), \
@@ -183,6 +187,7 @@ $(addprefix $(obj)/, mconf.o $(lxdialog)): $(obj)/mconf-cfg
 hostprogs-y	+= qconf
 qconf-cxxobjs	:= qconf.o
 qconf-objs	:= images.o $(common-objs)
+qconf-objs-generated	:= $(common-objs-generated)
 
 HOSTLDLIBS_qconf	= $(shell . $(obj)/qconf-cfg && echo $$libs)
 HOSTCXXFLAGS_qconf.o	= $(shell . $(obj)/qconf-cfg && echo $$cflags)
@@ -192,12 +197,13 @@ $(obj)/qconf.o: $(obj)/qconf-cfg $(obj)/qconf.moc
 quiet_cmd_moc = MOC     $@
       cmd_moc = $(shell . $(obj)/qconf-cfg && echo $$moc) -i $< -o $@
 
-$(obj)/%.moc: $(src)/%.h $(obj)/qconf-cfg
+$(obj)/%.moc: $(srctree)/$(src)/%.h $(obj)/qconf-cfg
 	$(call cmd,moc)
 
 # gconf: Used for the gconfig target based on GTK+
 hostprogs-y	+= gconf
 gconf-objs	:= gconf.o images.o $(common-objs)
+gconf-objs-generated	:= $(common-objs-generated)
 
 HOSTLDLIBS_gconf    = $(shell . $(obj)/gconf-cfg && echo $$libs)
 HOSTCFLAGS_gconf.o  = $(shell . $(obj)/gconf-cfg && echo $$cflags)
@@ -207,7 +213,7 @@ $(obj)/gconf.o: $(obj)/gconf-cfg
 # check if necessary packages are available, and configure build flags
 filechk_conf_cfg = $(CONFIG_SHELL) $<
 
-$(obj)/%conf-cfg: $(src)/%conf-cfg.sh FORCE
+$(obj)/%conf-cfg: $(srctree)/$(src)/%conf-cfg.sh FORCE
 	$(call filechk,conf_cfg)
 
 clean-files += *conf-cfg
-- 
Anthony PERARD


