Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5204F3006E7
	for <lists+xen-devel@lfdr.de>; Fri, 22 Jan 2021 16:15:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.72842.131274 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l2y8w-0008B5-Tw; Fri, 22 Jan 2021 15:14:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 72842.131274; Fri, 22 Jan 2021 15:14:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l2y8w-0008Af-QT; Fri, 22 Jan 2021 15:14:34 +0000
Received: by outflank-mailman (input) for mailman id 72842;
 Fri, 22 Jan 2021 15:14:32 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=83/a=GZ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1l2y8u-00089m-GL
 for xen-devel@lists.xenproject.org; Fri, 22 Jan 2021 15:14:32 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 04219876-0b43-4dce-9aec-d4dc72feeec3;
 Fri, 22 Jan 2021 15:14:31 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 6C80CB7CA;
 Fri, 22 Jan 2021 15:14:30 +0000 (UTC)
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
X-Inumbo-ID: 04219876-0b43-4dce-9aec-d4dc72feeec3
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1611328470; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=o77QcCORTwruCKZaKWE882+Adk7xW9OlbIdyAQkRSHM=;
	b=Ogxf5+SJzDH/p+5Jy7JXGA5+x+BO4f+UJ+F+noHatD+gOT07yv1IPbOmhi3ba081L0i81c
	aKR2nDZsp9PIVlnVETa1Si6E4oAEaozwkO02+donzeXZOz1HsSEAlfRnmyIhpCs+EV9X6L
	TTf4RXwU5qjoMumU6PXiPlRq0MuVZV4=
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
 Anthony Perard <anthony.perard@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] tools/libs: honor build dependencies for recently moved
 subdirs
Message-ID: <42328c2a-0c4a-af4b-4fad-349e16bd45c3@suse.com>
Date: Fri, 22 Jan 2021 16:14:30 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

While the lack of proper dependency tracking of #include-d files is
wider than just the libs/ subtree, dealing with the problem universally
there or  in tools/Rules.mk is too much of a risk at this point in the
release cycle. Add the missing inclusion of $(DEPS_INCLUDE) only in the
specific Makefile-s, after having checked that their prior Makefile-s
had such includes.

Interestingly the $(DEPS_RM) use is present in tools/libs/libs.mk's
clean target, so doesn't need taking care of in individual Makefile-s.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
Release-acked-by: Ian Jackson <iwj@xenproject.org>

--- a/tools/libs/ctrl/Makefile
+++ b/tools/libs/ctrl/Makefile
@@ -62,6 +62,8 @@ $(eval $(genpath-target))
 
 $(LIB_OBJS) $(PIC_OBJS): _paths.h
 
+-include $(DEPS_INCLUDE)
+
 clean: cleanlocal
 
 .PHONY: cleanlocal
--- a/tools/libs/guest/Makefile
+++ b/tools/libs/guest/Makefile
@@ -108,6 +108,8 @@ $(eval $(genpath-target))
 
 xc_private.h: _paths.h
 
+-include $(DEPS_INCLUDE)
+
 .PHONY: cleanlocal
 cleanlocal:
 	rm -f libxenguest.map
--- a/tools/libs/light/Makefile
+++ b/tools/libs/light/Makefile
@@ -271,3 +271,5 @@ cleanlocal:
 	$(RM) -f libxenlight.map
 	$(RM) -f $(AUTOSRCS) $(AUTOINCS)
 	$(MAKE) -C $(ACPI_PATH) ACPI_BUILD_DIR=$(CURDIR) clean
+
+-include $(DEPS_INCLUDE)
--- a/tools/libs/store/Makefile
+++ b/tools/libs/store/Makefile
@@ -31,6 +31,8 @@ else
 PKG_CONFIG_REMOVE += -ldl
 endif
 
+-include $(DEPS_INCLUDE)
+
 .PHONY: install
 install: install-headers
 
--- a/tools/libs/util/Makefile
+++ b/tools/libs/util/Makefile
@@ -52,6 +52,8 @@ $(LIB_OBJS) $(PIC_OBJS): $(AUTOINCS) _pa
 genpath-target = $(call buildmakevars2header,_paths.h)
 $(eval $(genpath-target))
 
+-include $(DEPS_INCLUDE)
+
 clean: cleanlocal
 
 .PHONY: cleanlocal
--- a/tools/libs/vchan/Makefile
+++ b/tools/libs/vchan/Makefile
@@ -11,6 +11,7 @@ SRCS-y += io.c
 NO_HEADERS_CHK := y
 
 include $(XEN_ROOT)/tools/libs/libs.mk
+-include $(DEPS_INCLUDE)
 
 clean: cleanlocal
 

