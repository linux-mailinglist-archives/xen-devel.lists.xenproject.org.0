Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 95E2A78612E
	for <lists+xen-devel@lfdr.de>; Wed, 23 Aug 2023 22:08:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.589517.921497 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qYu8j-0005ip-57; Wed, 23 Aug 2023 20:07:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 589517.921497; Wed, 23 Aug 2023 20:07:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qYu8i-0005cc-VX; Wed, 23 Aug 2023 20:07:40 +0000
Received: by outflank-mailman (input) for mailman id 589517;
 Wed, 23 Aug 2023 20:07:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Z2Dg=EI=raptorengineering.com=sanastasio@srs-se1.protection.inumbo.net>)
 id 1qYu8h-0004Vt-AL
 for xen-devel@lists.xenproject.org; Wed, 23 Aug 2023 20:07:39 +0000
Received: from raptorengineering.com (mail.raptorengineering.com
 [23.155.224.40]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b332a71c-41f0-11ee-9b0c-b553b5be7939;
 Wed, 23 Aug 2023 22:07:35 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id B8ED582869C3;
 Wed, 23 Aug 2023 15:07:34 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id i6-Th2QQ6sdT; Wed, 23 Aug 2023 15:07:34 -0500 (CDT)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id 0B02782869DC;
 Wed, 23 Aug 2023 15:07:34 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id ClzfHwa3dJBs; Wed, 23 Aug 2023 15:07:33 -0500 (CDT)
Received: from raptor-ewks-026.rptsys.com (5.edge.rptsys.com [23.155.224.38])
 by mail.rptsys.com (Postfix) with ESMTPSA id B696982869C8;
 Wed, 23 Aug 2023 15:07:33 -0500 (CDT)
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
X-Inumbo-ID: b332a71c-41f0-11ee-9b0c-b553b5be7939
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.rptsys.com 0B02782869DC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=raptorengineering.com; s=B8E824E6-0BE2-11E6-931D-288C65937AAD;
	t=1692821254; bh=5754nu+iJhBZxY2tO6d/yrG6Rc1radbJWoxq94901VU=;
	h=From:To:Date:Message-Id:MIME-Version;
	b=f22hjpPz42WvZjFyJa3bBUWF1e2GRayw9/iLIcXAQXfQGRI+u/SDwvbW8RJcnRV4n
	 RjpGUPAIRZNnTcnqiySQtb7uxhioippfdHgKEhEzsCpfIhuhO1EIbJA8ZIuahulRrp
	 FM4IF53Z+6DGdgkreRp3sFJja3Pc7s1rq7HYztVQ=
X-Virus-Scanned: amavisd-new at rptsys.com
From: Shawn Anastasio <sanastasio@raptorengineering.com>
To: xen-devel@lists.xenproject.org
Cc: Timothy Pearson <tpearson@raptorengineering.com>,
	Jan Beulich <jbeulich@suse.com>,
	Shawn Anastasio <sanastasio@raptorengineering.com>
Subject: [PATCH v2 8/8] xen/ppc: Enable full Xen build
Date: Wed, 23 Aug 2023 15:07:19 -0500
Message-Id: <95e3590bb5d70ff718a3e13999d86beda27d8066.1692816595.git.sanastasio@raptorengineering.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1692816595.git.sanastasio@raptorengineering.com>
References: <cover.1692816595.git.sanastasio@raptorengineering.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Bring ppc's Makefile and arch.mk in line with arm and x86 to disable the
build overrides and enable the full Xen build.

Signed-off-by: Shawn Anastasio <sanastasio@raptorengineering.com>
Reviewed-by: Jan Beulich <jbeulich@suse.com>
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

 $(obj)/xen.lds: $(src)/xen.lds.S FORCE
 	$(call if_changed_dep,cpp_lds_S)
diff --git a/xen/arch/ppc/arch.mk b/xen/arch/ppc/arch.mk
index d05cbf1df5..917ad0e6a8 100644
--- a/xen/arch/ppc/arch.mk
+++ b/xen/arch/ppc/arch.mk
@@ -7,6 +7,3 @@ CFLAGS +=3D -m64 -mlittle-endian -mcpu=3D$(ppc-march-y)
 CFLAGS +=3D -mstrict-align -mcmodel=3Dmedium -mabi=3Delfv2 -fPIC -mno-al=
tivec -mno-vsx -msoft-float

 LDFLAGS +=3D -m elf64lppc
-
-# TODO: Drop override when more of the build is working
-override ALL_OBJS-y =3D arch/$(SRCARCH)/built_in.o common/libfdt/built_i=
n.o lib/built_in.o
--
2.30.2


