Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B0DFB3F5CBA
	for <lists+xen-devel@lfdr.de>; Tue, 24 Aug 2021 13:02:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.171088.312397 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mIUCP-0002Qp-TN; Tue, 24 Aug 2021 11:02:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 171088.312397; Tue, 24 Aug 2021 11:02:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mIUCP-0002Ns-8f; Tue, 24 Aug 2021 11:02:33 +0000
Received: by outflank-mailman (input) for mailman id 171088;
 Tue, 24 Aug 2021 11:02:31 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MxNM=NP=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1mIU30-0003Ux-By
 for xen-devel@lists.xenproject.org; Tue, 24 Aug 2021 10:52:50 +0000
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 4ac0e288-04c9-11ec-a8c5-12813bfff9fa;
 Tue, 24 Aug 2021 10:51:53 +0000 (UTC)
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
X-Inumbo-ID: 4ac0e288-04c9-11ec-a8c5-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1629802313;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=3LBoylve6KlgEvEe96sCcK1Vf+QUAlZ8fbrbugBiOU8=;
  b=ILl5U66ImYEtUit2g3RKD2O0gx9AbhE7FHz54iadaqu1/NlLT77QOH93
   mu/6wjqHPNSAuJw/wdy38IKUcBm3MJXKdYelcoQs30F/LYI2CK0ys9lh6
   ioysvqhf4I04CLWNEW5906SeO2SpMkdHB8ODDdZsCY5gtJ6F5A7l6RJ1n
   M=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: RvwBttLgcRs/3mqKVUcYXvDwJUU4TpFPDc4SKEUbMFYI2GUFJuKf/RF4OcCOH4uVtkwuedPgDv
 n9vZBxdDQcsIPzuH5/ZaOaQrNg4bwAs9IfNpyS5djdhUp488pCU/Z0oQY/kq7ZA7sl7Rv+UV2l
 8IDghnXJVqnnF10go4VIyOuyoicIZtcKZnWSw9yqHIXuZX7O/aRIuECHfchroESDA3YJs3DX3q
 wvsrikqcPiUuRoUwbp0ItK4SLn4ww7bBZgLDfrJterQFuPOgnhfvG3HOUaiZERiQQSpX0L7gYD
 u0SlaERXl+nQbJPoapQ4JYVA
X-SBRS: 5.1
X-MesageID: 51130781
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:7WknQaEPu3uoe5RdpLqFVJHXdLJyesId70hD6qkvc3Fom52j/f
 xGws5x6fatskd2ZJkh8erhBEDyewKkyXcV2/hbAV7MZniDhILFFu9fBOjZsnfd8k/Fh4lgPM
 5bGsATZ+EYZmIK7voSlTPIdurIt+P3kpxA692+815dCSVRL41w5QZwDQiWVmdsQhNdOJY/HJ
 2AouJaujuJYx0sH4iGL0hAe9KGi8zAlZrgbxJDLQUg8hOygTSh76O/OwSE3y0ZTyhEzd4ZgC
 f4ek3Cl+ueWsOAu1/hPlzontdrcRzau5l+7fm3+4kow/PX+0OVjcpaKvm/VXsO0ZmSAR4R4a
 LxSlEbTolOAjrqDxuIiAqo1A/63Dk07Xj+jVeenHv4uMT8ACk3EsxbmOtiA23kAmcbzaVBOZ
 hwrhWkXltsfGL9tTW448KNWwBhl0Kyr3ZnmekPj2ZHWY9bbLNKt4QQ8E5cDZ9FRUvBmcgaOf
 grCNuZ6OddcFucYXyctm5zwMa0VnB2GhudWEANtsGczjATlnFkyEkTwtAZgx47hdsAYogB4/
 6BPrVjlblIQMNTZaVhBP0ZSc/yEWDJSQKkChPmHb0mLtB0B5vpke+I3FwY3pDXRHU49upApH
 2aaiIkiYcbQTOQNeSemIZM7g3ABH6gWDiF8LAv26RE
X-IronPort-AV: E=Sophos;i="5.84,347,1620705600"; 
   d="scan'208";a="51130781"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@citrix.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, "Ian
 Jackson" <iwj@xenproject.org>, Jan Beulich <jbeulich@suse.com>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu
	<wl@xen.org>
Subject: [XEN PATCH v7 32/51] build: Remove KBUILD_ specific from Makefile.host
Date: Tue, 24 Aug 2021 11:50:19 +0100
Message-ID: <20210824105038.1257926-33-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210824105038.1257926-1-anthony.perard@citrix.com>
References: <20210824105038.1257926-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

This will allow $(HOSTCFLAGS) to actually be used when building
programmes for the build-host.

The other variable don't exist in our build system.

Also remove $(KBUILD_EXTMOD) since it should always be empty.

Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
---
 xen/scripts/Makefile.host | 26 ++++++++++++--------------
 1 file changed, 12 insertions(+), 14 deletions(-)

diff --git a/xen/scripts/Makefile.host b/xen/scripts/Makefile.host
index 61c7bff7a9bb..9d3730d28950 100644
--- a/xen/scripts/Makefile.host
+++ b/xen/scripts/Makefile.host
@@ -82,18 +82,16 @@ host-cxxshobjs	:= $(addprefix $(obj)/,$(host-cxxshobjs))
 #####
 # Handle options to gcc. Support building with separate output directory
 
-_hostc_flags   = $(KBUILD_HOSTCFLAGS)   $(HOST_EXTRACFLAGS)   \
+_hostc_flags   = $(HOSTCFLAGS)   $(HOST_EXTRACFLAGS)   \
                  $(HOSTCFLAGS_$(target-stem).o)
-_hostcxx_flags = $(KBUILD_HOSTCXXFLAGS) $(HOST_EXTRACXXFLAGS) \
+_hostcxx_flags = $(HOSTCXXFLAGS) $(HOST_EXTRACXXFLAGS) \
                  $(HOSTCXXFLAGS_$(target-stem).o)
 
 # $(objtree)/$(obj) for including generated headers from checkin source files
-ifeq ($(KBUILD_EXTMOD),)
 ifdef building_out_of_srctree
 _hostc_flags   += -I $(objtree)/$(obj)
 _hostcxx_flags += -I $(objtree)/$(obj)
 endif
-endif
 
 hostc_flags    = -Wp,-MD,$(depfile) $(_hostc_flags)
 hostcxx_flags  = -Wp,-MD,$(depfile) $(_hostcxx_flags)
@@ -104,17 +102,17 @@ hostcxx_flags  = -Wp,-MD,$(depfile) $(_hostcxx_flags)
 # Create executable from a single .c file
 # host-csingle -> Executable
 quiet_cmd_host-csingle 	= HOSTCC  $@
-      cmd_host-csingle	= $(HOSTCC) $(hostc_flags) $(KBUILD_HOSTLDFLAGS) -o $@ $< \
-		$(KBUILD_HOSTLDLIBS) $(HOSTLDLIBS_$(target-stem))
+      cmd_host-csingle	= $(HOSTCC) $(hostc_flags) $(HOSTLDFLAGS) -o $@ $< \
+		$(HOSTLDLIBS) $(HOSTLDLIBS_$(target-stem))
 $(host-csingle): $(obj)/%: $(src)/%.c FORCE
 	$(call if_changed_dep,host-csingle)
 
 # Link an executable based on list of .o files, all plain c
 # host-cmulti -> executable
 quiet_cmd_host-cmulti	= HOSTLD  $@
-      cmd_host-cmulti	= $(HOSTCC) $(KBUILD_HOSTLDFLAGS) -o $@ \
+      cmd_host-cmulti	= $(HOSTCC) $(HOSTLDFLAGS) -o $@ \
 			  $(addprefix $(obj)/, $($(target-stem)-objs)) \
-			  $(KBUILD_HOSTLDLIBS) $(HOSTLDLIBS_$(target-stem))
+			  $(HOSTLDLIBS) $(HOSTLDLIBS_$(target-stem))
 $(host-cmulti): FORCE
 	$(call if_changed,host-cmulti)
 $(call multi_depend, $(host-cmulti), , -objs)
@@ -129,10 +127,10 @@ $(host-cobjs): $(obj)/%.o: $(src)/%.c FORCE
 # Link an executable based on list of .o files, a mixture of .c and .cc
 # host-cxxmulti -> executable
 quiet_cmd_host-cxxmulti	= HOSTLD  $@
-      cmd_host-cxxmulti	= $(HOSTCXX) $(KBUILD_HOSTLDFLAGS) -o $@ \
+      cmd_host-cxxmulti	= $(HOSTCXX) $(HOSTLDFLAGS) -o $@ \
 			  $(foreach o,objs cxxobjs,\
 			  $(addprefix $(obj)/, $($(target-stem)-$(o)))) \
-			  $(KBUILD_HOSTLDLIBS) $(HOSTLDLIBS_$(target-stem))
+			  $(HOSTLDLIBS) $(HOSTLDLIBS_$(target-stem))
 $(host-cxxmulti): FORCE
 	$(call if_changed,host-cxxmulti)
 $(call multi_depend, $(host-cxxmulti), , -objs -cxxobjs)
@@ -163,9 +161,9 @@ $(host-cxxshobjs): $(obj)/%.o: $(src)/%.c FORCE
 # Link a shared library, based on position independent .o files
 # *.o -> .so shared library (host-cshlib)
 quiet_cmd_host-cshlib	= HOSTLLD -shared $@
-      cmd_host-cshlib	= $(HOSTCC) $(KBUILD_HOSTLDFLAGS) -shared -o $@ \
+      cmd_host-cshlib	= $(HOSTCC) $(HOSTLDFLAGS) -shared -o $@ \
 			  $(addprefix $(obj)/, $($(target-stem)-objs)) \
-			  $(KBUILD_HOSTLDLIBS) $(HOSTLDLIBS_$(target-stem).so)
+			  $(HOSTLDLIBS) $(HOSTLDLIBS_$(target-stem).so)
 $(host-cshlib): FORCE
 	$(call if_changed,host-cshlib)
 $(call multi_depend, $(host-cshlib), .so, -objs)
@@ -173,9 +171,9 @@ $(call multi_depend, $(host-cshlib), .so, -objs)
 # Link a shared library, based on position independent .o files
 # *.o -> .so shared library (host-cxxshlib)
 quiet_cmd_host-cxxshlib	= HOSTLLD -shared $@
-      cmd_host-cxxshlib	= $(HOSTCXX) $(KBUILD_HOSTLDFLAGS) -shared -o $@ \
+      cmd_host-cxxshlib	= $(HOSTCXX) $(HOSTLDFLAGS) -shared -o $@ \
 			  $(addprefix $(obj)/, $($(target-stem)-objs)) \
-			  $(KBUILD_HOSTLDLIBS) $(HOSTLDLIBS_$(target-stem).so)
+			  $(HOSTLDLIBS) $(HOSTLDLIBS_$(target-stem).so)
 $(host-cxxshlib): FORCE
 	$(call if_changed,host-cxxshlib)
 $(call multi_depend, $(host-cxxshlib), .so, -objs)
-- 
Anthony PERARD


