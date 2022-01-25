Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BD9D049B2A6
	for <lists+xen-devel@lfdr.de>; Tue, 25 Jan 2022 12:07:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.260105.449322 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nCJfs-0000Rz-QX; Tue, 25 Jan 2022 11:07:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 260105.449322; Tue, 25 Jan 2022 11:07:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nCJfr-00005N-Ca; Tue, 25 Jan 2022 11:07:43 +0000
Received: by outflank-mailman (input) for mailman id 260105;
 Tue, 25 Jan 2022 11:07:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rP4T=SJ=citrix.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1nCJa8-0006Mn-KJ
 for xen-devel@lists.xenproject.org; Tue, 25 Jan 2022 11:01:48 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2e54dec3-7dce-11ec-8fa7-f31e035a9116;
 Tue, 25 Jan 2022 12:01:45 +0100 (CET)
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
X-Inumbo-ID: 2e54dec3-7dce-11ec-8fa7-f31e035a9116
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1643108505;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=sxCVIENXL7U4uJ6PAJaPF/nE5SLDBzALYwkN0k1BGWI=;
  b=G34dYyxAmOvPscub6HIVmNp4MRhbxMbh58A1b1F3dT7LGcJm+o4JGlme
   FRB8u8jhT/xxBbLL/6EFctepz47i4BzK3Ar7FgRFiHDAEeKEF1krrBae3
   3B2aVHQYNyAbCYvHQK34kvaHH/Mm1iscQw+1REjYapen0oPbeU7uOFGQN
   M=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: jYtfUwYAyD11jI1O9Q6jMpLDyo3cMN+utrBBigaPmaXPFMMH843yAFqhvnVq6fP6En3+NIONg0
 wsCtB+MyX2bwKcL21k3/PUo+DN3GBbqywQVc616DnydXrZ0hk3wIKWk+Y2TD2oT6yqCmVdJ7TD
 ZLtMGZO7acVg0MJ5xme9YNdl2AR+Rk1LmwWD0HK3mGTKOBD95qexYVHhz/Ka5I7yZk8yHY1HBR
 suPMf1Wsxxtd3UIJhSE1G4RbBqIfMvJjxGIj7vDc4Nbh4ANeJ8Pzdc0piDXZcNXVQXes1nLGz7
 iRviqRwTZROSZkbCFOtbAYyi
X-SBRS: 5.2
X-MesageID: 63106969
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:XMuavaghgLsXxQaTbFxIR8cQX161nBcKZh0ujC45NGQN5FlHY01je
 htvXGuDaPbYMzTxeNFza9ji8RtVuMTQmIRlHQY/rnwwFnsb9cadCdqndUqhZCn6wu8v7a5EA
 2fyTvGacajYm1eF/k/F3oAMKRCQ7InQLlbGILes1htZGEk0GE/NtTo5w7Rj2tcy3IDga++wk
 YiaT/P3aQfNNwFcagr424rbwP+4lK2v0N+wlgVWicFj5DcypVFMZH4sDfjZw0/DaptVBoaHq
 9Prl9lVyI97EyAFUbtJmp6jGqEDryW70QKm0hK6UID66vROS7BbPg/W+5PwZG8O4whlkeydx
 /10ksSydBUxJZbjv/88SjgHCg9SN6N/reqvzXiX6aR/zmXDenrohf5vEFs3LcsT/eMf7WNmr
 KJCbmpXN1ba2rzwkOnTpupE36zPKOHiOp8fvXdxiynUF/88TbjIQrnQ5M8e1zA17ixLNaiFP
 pJHOGQ+BPjGSxpqGFozNrMGp8z2p1vQYgBYqUKEpZNitgA/yyQuieOwYbI5YOeiXt5Jl0yVo
 mbH+WXRARwAMtGbjz2f/RqEmevnjS79HoUIG9WQ9ONugVCV7nweDlsRT1TTiem0jAuyVsxSL
 2QQ+zEytu4i+UqzVN7/Uhak5nmesXY0WdBdDuk74wGl0bfP7kCSAW1sc9JaQIV47olsH2Vsj
 wLX2YOybdByjFGLYUu6rrWpvyupAgcyNk4bRHAdYycP7eC29enfkSnzZtpkFae0iPj8Fjfx3
 y2GoUACulkDsSIY//7lpA6a2lpAsrCMF1dovVuPAgpJ+yskPNbNWmC+1bTMAR+sxq69R0LJg
 nULktP2AAsmXcDUz3zlrAng8diUCxe53N/03AYH83oJrW3FF5ufkWZ4um0WyKBBaZ5sRNMRS
 BWP0T69HbcKVJdQUYd5YpiqF+MhxrX6GNLuW5j8N4QSOcAtJVDYonA/PSZ8OlwBdmB2zcnT3
 r/AKa6R4YsyU/w7nFJauc9DuVPU+szO7TyKHs2qp/hW+bGfeGSUWd843KimNYgEAFe/iFyNq
 b53bpLSoz0GCbGWSnSJreY7cA5bRVBmVcGeg5EGLYarf1s5cFzN/teMm9vNjaQ/wfQM/goJl
 1ngMnJlJK3X3C2edl7SOyk9MdsCn/9X9BoGAMDlBn7ws1BLXGplxP13m0IfceZ1+ep94+RzS
 vVZKcyMDu4WEmbM+igHbIm7p4tnLUz5iQWLNiujQT4+Y58/GFCZpo66JlPipHsUEy66lcoiu
 Ln8hAnVdoUOGlZ5B8HMZfPxk17o5SoBmPh/VlfjK8VIfBm+65BjLiH816dlI8wFJRjZ6CGd0
 gKaXUURqeXX+tdn+9jVn6GU6YyuFrImTEZdGmDa65ewNDXboTX/kdMRDr7QcGmEBm3u+aika
 eFE9N3GMaUKzARQro5xM7d31qZitdHhkKBXk1Z/F3LRYlX1Vr45eiua3dNCv7Fmz6NCvVfkQ
 VqG/9RXNOnbOM7hF1JNdgMpYv7aiKMRkzjWq/80PF/79Gl8+7/eCRdeOByFiSp8KrppMdx6n
 bd96ZBOswHv2AA3NtumjzxP8zXeJ3MNZKwrq5UGDdK5kQEs0FxDPcTRByKeDEtjsDmQ3p3G+
 gOpuZc=
IronPort-HdrOrdr: A9a23:VEFAiKB0aIsnSPrlHemQ55DYdb4zR+YMi2TDsHoBLSC9E/bo8v
 xG885rtiMc5AxxZJhCo7690cu7MBThHPdOiOF6UItKNDOW3ldAR7sSj7cKrQeBJ8TWzJ8l6U
 8+GJIUNDSLNzdHZGzBkXGF+q0brOW6zA==
X-IronPort-AV: E=Sophos;i="5.88,314,1635220800"; 
   d="scan'208";a="63106969"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@citrix.com>, Jan Beulich
	<jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Subject: [XEN PATCH v9 14/30] build: remove KBUILD_ specific from Makefile.host
Date: Tue, 25 Jan 2022 11:00:47 +0000
Message-ID: <20220125110103.3527686-15-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220125110103.3527686-1-anthony.perard@citrix.com>
References: <20220125110103.3527686-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

This will allow $(HOSTCFLAGS) to actually be used when building
programmes for the build-host.

The other variable don't exist in our build system.

Also remove $(KBUILD_EXTMOD) since it should always be empty.

Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
---
 xen/scripts/Makefile.host | 26 ++++++++++++--------------
 1 file changed, 12 insertions(+), 14 deletions(-)

diff --git a/xen/scripts/Makefile.host b/xen/scripts/Makefile.host
index 8a85f94316bc..d6c358095ee8 100644
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
 $(call multi-depend, $(host-cmulti), , -objs)
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
 $(call multi-depend, $(host-cxxmulti), , -objs -cxxobjs)
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
 $(call multi-depend, $(host-cshlib), .so, -objs)
@@ -173,9 +171,9 @@ $(call multi-depend, $(host-cshlib), .so, -objs)
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
 $(call multi-depend, $(host-cxxshlib), .so, -objs)
-- 
Anthony PERARD


