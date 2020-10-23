Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D4110297136
	for <lists+xen-devel@lfdr.de>; Fri, 23 Oct 2020 16:20:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.11016.29269 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kVxv4-0000v3-I5; Fri, 23 Oct 2020 14:19:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 11016.29269; Fri, 23 Oct 2020 14:19:50 +0000
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
	id 1kVxv4-0000uW-Dd; Fri, 23 Oct 2020 14:19:50 +0000
Received: by outflank-mailman (input) for mailman id 11016;
 Fri, 23 Oct 2020 14:19:48 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=H00l=D6=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1kVxv2-0000me-Lx
 for xen-devel@lists.xenproject.org; Fri, 23 Oct 2020 14:19:48 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1913b86f-e79a-4782-aa59-63cfb60638e9;
 Fri, 23 Oct 2020 14:19:38 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 7F4C2B2B0;
 Fri, 23 Oct 2020 14:19:37 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=H00l=D6=suse.com=jgross@srs-us1.protection.inumbo.net>)
	id 1kVxv2-0000me-Lx
	for xen-devel@lists.xenproject.org; Fri, 23 Oct 2020 14:19:48 +0000
X-Inumbo-ID: 1913b86f-e79a-4782-aa59-63cfb60638e9
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 1913b86f-e79a-4782-aa59-63cfb60638e9;
	Fri, 23 Oct 2020 14:19:38 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1603462777;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bpbKlAusw8M3iIDqGNsPUH+GZlGUA08Dg8QDzb3c4FQ=;
	b=PRNm5DbdDC2YY7W6D25UhZWCQG09mMtqjfr2R1uLjAIkh8IVVobCZjtNLxlTbw8nMYdvw4
	xJ4p25F/Yr/Uzw04O5xvFdEy1JbGUV5WvOCQUcqfcH1H8hyEvVLiPyQoN4fsjVC08MoU2S
	tpUEaAD0+SixDAuNJsYuo8LSK4mcvKk=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 7F4C2B2B0;
	Fri, 23 Oct 2020 14:19:37 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>,
	Christian Lindig <christian.lindig@citrix.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>
Subject: [PATCH v2 3/3] tools/libs/store: don't use symbolic links for external files
Date: Fri, 23 Oct 2020 16:19:34 +0200
Message-Id: <20201023141934.20062-4-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201023141934.20062-1-jgross@suse.com>
References: <20201023141934.20062-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Instead of using symbolic links to include files from xenstored use
the vpath directive and an include path.

Signed-off-by: Juergen Gross <jgross@suse.com>
Acked-by: Christian Lindig <christian.lindig@citrix.com>
Tested-by: Bertrand Marquis <bertrand.marquis@arm.com>
---
 tools/libs/store/Makefile | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/tools/libs/store/Makefile b/tools/libs/store/Makefile
index 930e763de9..bc89b9cd70 100644
--- a/tools/libs/store/Makefile
+++ b/tools/libs/store/Makefile
@@ -21,12 +21,8 @@ CFLAGS += $(CFLAGS_libxentoolcore)
 CFLAGS += -DXEN_LIB_STORED="\"$(XEN_LIB_STORED)\""
 CFLAGS += -DXEN_RUN_STORED="\"$(XEN_RUN_STORED)\""
 
-LINK_FILES = xs_lib.c list.h utils.h
-
-$(LIB_OBJS): $(LINK_FILES)
-
-$(LINK_FILES):
-	ln -sf $(XEN_ROOT)/tools/xenstore/$@ $@
+vpath xs_lib.c $(XEN_ROOT)/tools/xenstore
+CFLAGS += -I $(XEN_ROOT)/tools/xenstore
 
 xs.opic: CFLAGS += -DUSE_PTHREAD
 ifeq ($(CONFIG_Linux),y)
-- 
2.26.2


