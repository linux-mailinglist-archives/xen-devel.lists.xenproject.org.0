Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A3D7B2814ED
	for <lists+xen-devel@lfdr.de>; Fri,  2 Oct 2020 16:22:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.2190.6480 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kOLx4-0007RW-Il; Fri, 02 Oct 2020 14:22:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 2190.6480; Fri, 02 Oct 2020 14:22:26 +0000
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
	id 1kOLx4-0007QC-98; Fri, 02 Oct 2020 14:22:26 +0000
Received: by outflank-mailman (input) for mailman id 2190;
 Fri, 02 Oct 2020 14:22:23 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=2E3y=DJ=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1kOLx1-0007Lm-Lf
 for xen-devel@lists.xenproject.org; Fri, 02 Oct 2020 14:22:23 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 6bcd64eb-b6be-4a07-a4af-1257aa1a8d7a;
 Fri, 02 Oct 2020 14:22:17 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id E0646AF9E;
 Fri,  2 Oct 2020 14:22:16 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=2E3y=DJ=suse.com=jgross@srs-us1.protection.inumbo.net>)
	id 1kOLx1-0007Lm-Lf
	for xen-devel@lists.xenproject.org; Fri, 02 Oct 2020 14:22:23 +0000
X-Inumbo-ID: 6bcd64eb-b6be-4a07-a4af-1257aa1a8d7a
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 6bcd64eb-b6be-4a07-a4af-1257aa1a8d7a;
	Fri, 02 Oct 2020 14:22:17 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1601648537;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=B0hKhMItdbTVWeOo4rAaRHPuJTQcqrPyKeVdwhrfnHU=;
	b=Q/soOzGRi3o/4B1TWIxWhWnRfSHi5vETOP8P1RfBQ25k4cokrJjYEKMawPAlwKR16XGPjf
	xvc4fVhl7zsCYwrchgZ9U2EEXsHASH/AEm+OX4Nxj4tGpGC6FSgmdVackChNa+CiPlnY+x
	mpT4/nEVfo0xEiIaazk+bCZsV2Tv9EA=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id E0646AF9E;
	Fri,  2 Oct 2020 14:22:16 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH 2/3] tools/libs/guest: don't use symbolic links for xenctrl headers
Date: Fri,  2 Oct 2020 16:22:13 +0200
Message-Id: <20201002142214.3438-3-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201002142214.3438-1-jgross@suse.com>
References: <20201002142214.3438-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Instead of using symbolic links for accessing the xenctrl private
headers use an include path instead.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 tools/libs/guest/Makefile | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/tools/libs/guest/Makefile b/tools/libs/guest/Makefile
index 5b4ad313cc..1c729040b3 100644
--- a/tools/libs/guest/Makefile
+++ b/tools/libs/guest/Makefile
@@ -6,11 +6,6 @@ ifeq ($(CONFIG_LIBXC_MINIOS),y)
 override CONFIG_MIGRATE := n
 endif
 
-LINK_FILES := xc_private.h xc_core.h xc_core_x86.h xc_core_arm.h xc_bitops.h
-
-$(LINK_FILES):
-	ln -sf $(XEN_ROOT)/tools/libs/ctrl/$(notdir $@) $@
-
 SRCS-y += xg_private.c
 SRCS-y += xg_domain.c
 SRCS-y += xg_suspend.c
@@ -29,6 +24,8 @@ else
 SRCS-y += xg_nomigrate.c
 endif
 
+CFLAGS += -I$(XEN_libxenctrl)
+
 vpath %.c ../../../xen/common/libelf
 CFLAGS += -I../../../xen/common/libelf
 
@@ -111,8 +108,6 @@ $(eval $(genpath-target))
 
 xc_private.h: _paths.h
 
-$(LIB_OBJS) $(PIC_OBJS): $(LINK_FILES)
-
 .PHONY: cleanlocal
 cleanlocal:
 	rm -f libxenguest.map
-- 
2.26.2


