Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E86C34DA633
	for <lists+xen-devel@lfdr.de>; Wed, 16 Mar 2022 00:20:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.290973.493651 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nUGSa-0001oM-HQ; Tue, 15 Mar 2022 23:20:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 290973.493651; Tue, 15 Mar 2022 23:20:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nUGSa-0001lY-EQ; Tue, 15 Mar 2022 23:20:12 +0000
Received: by outflank-mailman (input) for mailman id 290973;
 Tue, 15 Mar 2022 23:20:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4IiT=T2=tklengyel.com=tamas@srs-se1.protection.inumbo.net>)
 id 1nUGSZ-0001lS-56
 for xen-devel@lists.xenproject.org; Tue, 15 Mar 2022 23:20:11 +0000
Received: from MTA-14-4.privateemail.com (mta-14-4.privateemail.com
 [198.54.118.206]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 74490d9a-a4b6-11ec-8eba-a37418f5ba1a;
 Wed, 16 Mar 2022 00:20:09 +0100 (CET)
Received: from mta-14.privateemail.com (localhost [127.0.0.1])
 by mta-14.privateemail.com (Postfix) with ESMTP id AEB3C18000A4;
 Tue, 15 Mar 2022 19:20:07 -0400 (EDT)
Received: from toma-xps.localdomain (unknown [10.20.151.199])
 by mta-14.privateemail.com (Postfix) with ESMTPA id C928F18000A5;
 Tue, 15 Mar 2022 19:20:02 -0400 (EDT)
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
X-Inumbo-ID: 74490d9a-a4b6-11ec-8eba-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=tklengyel.com;
	s=default; t=1647386407;
	bh=MzJE/NNvN5RBHoVLDcrekrjcRxeVw3x+iltc0TQduGY=;
	h=From:To:Cc:Subject:Date:From;
	b=jVcfeP5Dp0jTI6CRndoGVTOUGVM7I95IaXPHT57ZjXENdQWj44bEYpeXAEgTPeCK5
	 bho5WSrjbquXejyF+9+fV3FjJJJSyqOUhY78hhMBr+mepqVVdIDbGUjxTMslKpZ92L
	 Muntt/XJYdJa7xTh1jDnI7lqyQf6jU0vrCleGzsBacveymm9fnFk+2u60H+UCfeGwi
	 T1PnvlrCEXgPCEJdxti2CtPGgqQgzC3bCN+Up+KuyxllKn5lQvGBTIqK/xOch79P2i
	 Mu9ZVT7eNqhzme2xfWzcKJcDKbnet1cRJCW55wwH6ceeb/xtn2tDFFM7N+WAe8KRKi
	 3cDlxkeEF+Qyw==
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=tklengyel.com;
	s=default; t=1647386407;
	bh=MzJE/NNvN5RBHoVLDcrekrjcRxeVw3x+iltc0TQduGY=;
	h=From:To:Cc:Subject:Date:From;
	b=jVcfeP5Dp0jTI6CRndoGVTOUGVM7I95IaXPHT57ZjXENdQWj44bEYpeXAEgTPeCK5
	 bho5WSrjbquXejyF+9+fV3FjJJJSyqOUhY78hhMBr+mepqVVdIDbGUjxTMslKpZ92L
	 Muntt/XJYdJa7xTh1jDnI7lqyQf6jU0vrCleGzsBacveymm9fnFk+2u60H+UCfeGwi
	 T1PnvlrCEXgPCEJdxti2CtPGgqQgzC3bCN+Up+KuyxllKn5lQvGBTIqK/xOch79P2i
	 Mu9ZVT7eNqhzme2xfWzcKJcDKbnet1cRJCW55wwH6ceeb/xtn2tDFFM7N+WAe8KRKi
	 3cDlxkeEF+Qyw==
From: Tamas K Lengyel <tamas@tklengyel.com>
To: xen-devel@lists.xenproject.org
Cc: Tamas K Lengyel <tamas@tklengyel.com>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH] tools/ctrl: add xc_domain_hvm_getcontext_size
Date: Tue, 15 Mar 2022 19:19:52 -0400
Message-Id: <20220315231952.7831-1-tamas@tklengyel.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: ClamAV using ClamSMTP

Current users of xc_domain_hvm_getcontext_partial rely on knowing ahead of time
the size of the requested HVM context. This isn't exactly prudent as the size
may change across Xen versions, requiring callers to re-compile in lockstep
with the Xen headers. This isn't an issue for in-tree tools and libraries,
but out-of-tree tools that supposed to work across all Xen versions, like
LibVMI, would fail to work after a size change to any of the HVM contexts.

Add xc_domain_hvm_getcontext_size so that external callers can at least be
backwards compatible with various HVM context sizes by maintaining their
own internal definitions of them and not relying on the current Xen header. It
is preferred to know the exact size Xen is going to return instead of guessing
by associating the HVM context sizes with Xen releases. The underlying domctl
has supported returning the context size to begin with, so with this change
we are just exposing that functionality to the users of libxc.

Signed-off-by: Tamas K Lengyel <tamas@tklengyel.com>
---
 tools/include/xenctrl.h     | 12 ++++++++++++
 tools/libs/ctrl/xc_domain.c | 21 +++++++++++++++++++++
 2 files changed, 33 insertions(+)

diff --git a/tools/include/xenctrl.h b/tools/include/xenctrl.h
index 95bd5eca67..ee5095a892 100644
--- a/tools/include/xenctrl.h
+++ b/tools/include/xenctrl.h
@@ -787,6 +787,18 @@ int xc_domain_hvm_getcontext_partial(xc_interface *xch,
                                      uint16_t instance,
                                      void *ctxt_buf,
                                      uint32_t size);
+/**
+ * This function returns the size of the specified context of a hvm domain
+ * @parm xch a handle to an open hypervisor interface
+ * @parm domid the domain to get information from
+ * @parm typecode which type of elemnt required
+ * @parm instance which instance of the type
+ * @return size on success, 0 on failure
+ */
+unsigned long xc_domain_hvm_getcontext_size(xc_interface *xch,
+                                            uint32_t domid,
+                                            uint16_t typecode,
+                                            uint16_t instance);
 
 /**
  * This function will set the context for hvm domain
diff --git a/tools/libs/ctrl/xc_domain.c b/tools/libs/ctrl/xc_domain.c
index ef62f66009..f52d089999 100644
--- a/tools/libs/ctrl/xc_domain.c
+++ b/tools/libs/ctrl/xc_domain.c
@@ -510,6 +510,27 @@ int xc_domain_hvm_getcontext_partial(xc_interface *xch,
     return ret ? -1 : 0;
 }
 
+unsigned long xc_domain_hvm_getcontext_size(xc_interface *xch,
+                                            uint32_t domid,
+                                            uint16_t typecode,
+                                            uint16_t instance)
+{
+    int ret;
+    void *p = NULL;
+    DECLARE_DOMCTL;
+    DECLARE_HYPERCALL_BOUNCE(p, 0, XC_HYPERCALL_BUFFER_BOUNCE_OUT);
+
+    domctl.cmd = XEN_DOMCTL_gethvmcontext_partial;
+    domctl.domain = domid;
+    domctl.u.hvmcontext_partial.type = typecode;
+    domctl.u.hvmcontext_partial.instance = instance;
+    set_xen_guest_handle(domctl.u.hvmcontext_partial.buffer, p);
+
+    ret = do_domctl(xch, &domctl);
+
+    return ret ? 0 : domctl.u.hvmcontext_partial.bufsz;
+}
+
 /* set info to hvm guest for restore */
 int xc_domain_hvm_setcontext(xc_interface *xch,
                              uint32_t domid,
-- 
2.32.0


