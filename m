Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 755CA76DB32
	for <lists+xen-devel@lfdr.de>; Thu,  3 Aug 2023 01:03:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.575868.901417 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRKsM-0004mI-2k; Wed, 02 Aug 2023 23:03:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 575868.901417; Wed, 02 Aug 2023 23:03:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRKsL-0004ez-QO; Wed, 02 Aug 2023 23:03:29 +0000
Received: by outflank-mailman (input) for mailman id 575868;
 Wed, 02 Aug 2023 23:03:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SOIS=DT=raptorengineering.com=sanastasio@srs-se1.protection.inumbo.net>)
 id 1qRKsI-0002ha-KR
 for xen-devel@lists.xenproject.org; Wed, 02 Aug 2023 23:03:26 +0000
Received: from raptorengineering.com (mail.raptorengineering.com
 [23.155.224.40]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c638a8ca-3188-11ee-8613-37d641c3527e;
 Thu, 03 Aug 2023 01:03:21 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id 5EAF38285801;
 Wed,  2 Aug 2023 18:03:20 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id xhEj096is2P6; Wed,  2 Aug 2023 18:03:19 -0500 (CDT)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id CC73F8286986;
 Wed,  2 Aug 2023 18:03:19 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id m71qTlx5EDTo; Wed,  2 Aug 2023 18:03:19 -0500 (CDT)
Received: from raptor-ewks-026.lan (5.edge.rptsys.com [23.155.224.38])
 by mail.rptsys.com (Postfix) with ESMTPSA id 0E9CE8285801;
 Wed,  2 Aug 2023 18:03:19 -0500 (CDT)
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
X-Inumbo-ID: c638a8ca-3188-11ee-8613-37d641c3527e
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.rptsys.com CC73F8286986
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=raptorengineering.com; s=B8E824E6-0BE2-11E6-931D-288C65937AAD;
	t=1691017399; bh=YjlYohwL3eAJPEYKReeeAY3HrxNXgmlGT5VKjdLta3c=;
	h=From:To:Date:Message-Id:MIME-Version;
	b=cdIn5slO1nJk9TEPSLCT2MK526NhohahrjwqqMD+D0nH3+kpBVWPq0tgFcLtwlkNW
	 PdJNv2xsda1QqN3Km60VKIu8kUgbjBFGr2PjBiKgAdYxWqJQCXJXz6ZD/JwARqZgN8
	 WJFDkceDmuzGuglyDWW5NjX2OYomgLbaMTAWZXC0=
X-Virus-Scanned: amavisd-new at rptsys.com
From: Shawn Anastasio <sanastasio@raptorengineering.com>
To: xen-devel@lists.xenproject.org
Cc: Timothy Pearson <tpearson@raptorengineering.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Shawn Anastasio <sanastasio@raptorengineering.com>
Subject: [PATCH 9/9] xen/ppc: Enable full Xen build
Date: Wed,  2 Aug 2023 18:03:05 -0500
Message-Id: <44fe62a196e2621ac88d0f4b9e7ee97bf1874d59.1691016993.git.sanastasio@raptorengineering.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1691016993.git.sanastasio@raptorengineering.com>
References: <cover.1691016993.git.sanastasio@raptorengineering.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Bring ppc's Makefile and arch.mk in line with arm and x86 to disable the
build overrides and enable the full Xen build.

Signed-off-by: Shawn Anastasio <sanastasio@raptorengineering.com>
---
 xen/arch/ppc/Makefile | 16 +++++++++++++++-
 xen/arch/ppc/arch.mk  |  3 ---
 2 files changed, 15 insertions(+), 4 deletions(-)

diff --git a/xen/arch/ppc/Makefile b/xen/arch/ppc/Makefile
index 969910b3b6..7b68b5ace2 100644
--- a/xen/arch/ppc/Makefile
+++ b/xen/arch/ppc/Makefile
@@ -12,10 +12,24 @@ $(TARGET): $(TARGET)-syms
 	cp -f $< $@
=20
 $(TARGET)-syms: $(objtree)/prelink.o $(obj)/xen.lds
-	$(LD) $(XEN_LDFLAGS) -T $(obj)/xen.lds -N $< $(build_id_linker) -o $@
+	$(LD) $(XEN_LDFLAGS) -T $(obj)/xen.lds -N $< \
+	    $(objtree)/common/symbols-dummy.o -o $(dot-target).0
+	$(NM) -pa --format=3Dsysv $(dot-target).0 \
+		| $(objtree)/tools/symbols $(all_symbols) --sysv --sort \
+		> $(dot-target).0.S
+	$(MAKE) $(build)=3D$(@D) $(dot-target).0.o
+	$(LD) $(XEN_LDFLAGS) -T $(obj)/xen.lds -N $< \
+	    $(dot-target).0.o -o $(dot-target).1
+	$(NM) -pa --format=3Dsysv $(dot-target).1 \
+		| $(objtree)/tools/symbols $(all_symbols) --sysv --sort \
+		> $(dot-target).1.S
+	$(MAKE) $(build)=3D$(@D) $(dot-target).1.o
+	$(LD) $(XEN_LDFLAGS) -T $(obj)/xen.lds -N $< $(build_id_linker) \
+	    $(dot-target).1.o -o $@
 	$(NM) -pa --format=3Dsysv $@ \
 		| $(objtree)/tools/symbols --all-symbols --xensyms --sysv --sort \
 		> $@.map
+	rm -f $(@D)/.$(@F).[0-9]*
=20
 $(obj)/xen.lds: $(src)/xen.lds.S FORCE
 	$(call if_changed_dep,cpp_lds_S)
diff --git a/xen/arch/ppc/arch.mk b/xen/arch/ppc/arch.mk
index d05cbf1df5..917ad0e6a8 100644
--- a/xen/arch/ppc/arch.mk
+++ b/xen/arch/ppc/arch.mk
@@ -7,6 +7,3 @@ CFLAGS +=3D -m64 -mlittle-endian -mcpu=3D$(ppc-march-y)
 CFLAGS +=3D -mstrict-align -mcmodel=3Dmedium -mabi=3Delfv2 -fPIC -mno-al=
tivec -mno-vsx -msoft-float
=20
 LDFLAGS +=3D -m elf64lppc
-
-# TODO: Drop override when more of the build is working
-override ALL_OBJS-y =3D arch/$(SRCARCH)/built_in.o common/libfdt/built_i=
n.o lib/built_in.o
--=20
2.30.2


