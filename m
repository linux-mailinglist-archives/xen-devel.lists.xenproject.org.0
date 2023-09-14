Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 293BD7A0DC4
	for <lists+xen-devel@lfdr.de>; Thu, 14 Sep 2023 21:04:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.602642.939349 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qgrd0-0002fc-90; Thu, 14 Sep 2023 19:03:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 602642.939349; Thu, 14 Sep 2023 19:03:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qgrd0-0002ca-3b; Thu, 14 Sep 2023 19:03:50 +0000
Received: by outflank-mailman (input) for mailman id 602642;
 Thu, 14 Sep 2023 19:03:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PYVF=E6=raptorengineering.com=sanastasio@srs-se1.protection.inumbo.net>)
 id 1qgrcy-0002IU-BO
 for xen-devel@lists.xenproject.org; Thu, 14 Sep 2023 19:03:48 +0000
Received: from raptorengineering.com (mail.raptorengineering.com
 [23.155.224.40]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6d95965e-5331-11ee-9b0d-b553b5be7939;
 Thu, 14 Sep 2023 21:03:45 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id 04AF98285A2E;
 Thu, 14 Sep 2023 14:03:45 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id 9cPvSY9x485Z; Thu, 14 Sep 2023 14:03:44 -0500 (CDT)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id 572B48285972;
 Thu, 14 Sep 2023 14:03:44 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id zR5FLeRV9JEH; Thu, 14 Sep 2023 14:03:44 -0500 (CDT)
Received: from raptor-ewks-026.rptsys.com (5.edge.rptsys.com [23.155.224.38])
 by mail.rptsys.com (Postfix) with ESMTPSA id DB1668285899;
 Thu, 14 Sep 2023 14:03:43 -0500 (CDT)
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
X-Inumbo-ID: 6d95965e-5331-11ee-9b0d-b553b5be7939
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.rptsys.com 572B48285972
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=raptorengineering.com; s=B8E824E6-0BE2-11E6-931D-288C65937AAD;
	t=1694718224; bh=cF5IvHr5u7imGadcwYNiu5y563SLZGH4suAc9S6xZk0=;
	h=From:To:Date:Message-Id:MIME-Version;
	b=KWDQbCV9ocOyFIVElNWjobXz/rH9Ru5+Wn0XCxDofZRZ1ZaBRHqk9Go7jIpbbHSqO
	 lRiLx01n1TEd7edDAk77VHIR2phkFhXzwTMMyErUD8rwcVxenVMHrOVUFLaRTJarYV
	 MV9X0WUjdfgnTMr8iOOv2dcBo5hUo79eyHIpusa8=
X-Virus-Scanned: amavisd-new at rptsys.com
From: Shawn Anastasio <sanastasio@raptorengineering.com>
To: xen-devel@lists.xenproject.org
Cc: Timothy Pearson <tpearson@raptorengineering.com>,
	Jan Beulich <jbeulich@suse.com>,
	Shawn Anastasio <sanastasio@raptorengineering.com>
Subject: [PATCH v6 4/4] xen/ppc: Enable full Xen build
Date: Thu, 14 Sep 2023 14:03:34 -0500
Message-Id: <ae5a07b0c1761d79d111e1fc1d0f911425ea191a.1694717278.git.sanastasio@raptorengineering.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1694717278.git.sanastasio@raptorengineering.com>
References: <cover.1694717278.git.sanastasio@raptorengineering.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Bring ppc's Makefile and arch.mk in line with arm and x86 to disable the
build overrides and enable the full Xen build.

Signed-off-by: Shawn Anastasio <sanastasio@raptorengineering.com>
Reviewed-by: Jan Beulich <jbeulich@suse.com>
---
 xen/arch/ppc/Makefile | 16 +++++++++++++++-
 xen/arch/ppc/arch.mk  |  3 ---
 2 files changed, 15 insertions(+), 4 deletions(-)

diff --git a/xen/arch/ppc/Makefile b/xen/arch/ppc/Makefile
index 6d5569ff64..71feb5e2c4 100644
--- a/xen/arch/ppc/Makefile
+++ b/xen/arch/ppc/Makefile
@@ -11,10 +11,24 @@ $(TARGET): $(TARGET)-syms
 	cp -f $< $@
 
 $(TARGET)-syms: $(objtree)/prelink.o $(obj)/xen.lds
-	$(LD) $(XEN_LDFLAGS) -T $(obj)/xen.lds -N $< $(build_id_linker) -o $@
+	$(LD) $(XEN_LDFLAGS) -T $(obj)/xen.lds -N $< \
+	    $(objtree)/common/symbols-dummy.o -o $(dot-target).0
+	$(NM) -pa --format=sysv $(dot-target).0 \
+		| $(objtree)/tools/symbols $(all_symbols) --sysv --sort \
+		> $(dot-target).0.S
+	$(MAKE) $(build)=$(@D) $(dot-target).0.o
+	$(LD) $(XEN_LDFLAGS) -T $(obj)/xen.lds -N $< \
+	    $(dot-target).0.o -o $(dot-target).1
+	$(NM) -pa --format=sysv $(dot-target).1 \
+		| $(objtree)/tools/symbols $(all_symbols) --sysv --sort \
+		> $(dot-target).1.S
+	$(MAKE) $(build)=$(@D) $(dot-target).1.o
+	$(LD) $(XEN_LDFLAGS) -T $(obj)/xen.lds -N $< $(build_id_linker) \
+	    $(dot-target).1.o -o $@
 	$(NM) -pa --format=sysv $@ \
 		| $(objtree)/tools/symbols --all-symbols --xensyms --sysv --sort \
 		> $@.map
+	rm -f $(@D)/.$(@F).[0-9]*
 
 $(obj)/xen.lds: $(src)/xen.lds.S FORCE
 	$(call if_changed_dep,cpp_lds_S)
diff --git a/xen/arch/ppc/arch.mk b/xen/arch/ppc/arch.mk
index d05cbf1df5..917ad0e6a8 100644
--- a/xen/arch/ppc/arch.mk
+++ b/xen/arch/ppc/arch.mk
@@ -7,6 +7,3 @@ CFLAGS += -m64 -mlittle-endian -mcpu=$(ppc-march-y)
 CFLAGS += -mstrict-align -mcmodel=medium -mabi=elfv2 -fPIC -mno-altivec -mno-vsx -msoft-float
 
 LDFLAGS += -m elf64lppc
-
-# TODO: Drop override when more of the build is working
-override ALL_OBJS-y = arch/$(SRCARCH)/built_in.o common/libfdt/built_in.o lib/built_in.o
-- 
2.30.2


