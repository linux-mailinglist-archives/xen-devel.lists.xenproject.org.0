Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F211B3C6D30
	for <lists+xen-devel@lfdr.de>; Tue, 13 Jul 2021 11:20:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.155219.286575 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m3EaX-0001Pe-Az; Tue, 13 Jul 2021 09:20:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 155219.286575; Tue, 13 Jul 2021 09:20:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m3EaX-0001Nr-6q; Tue, 13 Jul 2021 09:20:25 +0000
Received: by outflank-mailman (input) for mailman id 155219;
 Tue, 13 Jul 2021 09:20:23 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1m3EaV-0001Nl-Tn
 for xen-devel@lists.xenproject.org; Tue, 13 Jul 2021 09:20:23 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1m3EaU-0001ki-LP; Tue, 13 Jul 2021 09:20:22 +0000
Received: from 54-240-197-235.amazon.com ([54.240.197.235]
 helo=ufe34d9ed68d054.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1m3EaU-00010t-CH; Tue, 13 Jul 2021 09:20:22 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	Message-Id:Date:Subject:Cc:To:From;
	bh=4Od6Pp7OPQpJU9KVHYnFK3cfHd/Ra2FO/b82se4czDI=; b=UJuCeKN/zRu+A1Lh51BJkR0udY
	6W7AtHxa66Iso05z7vd4S0bR4oZnrU18bciqNQAcx+LXxZPUf9OuefPMbofyHZS2LP+HfXbEGpbax
	60/YZ7Yscos6S5rok7RDJlhfPekx5grab3EnYnySCXtVaSj1ODsSUwItNeCJS8ACNxUM=;
From: Julien Grall <julien@xen.org>
To: xen-devel@lists.xenproject.org
Cc: julien@xen.org,
	Julien Grall <jgrall@amazon.com>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>,
	Juergen Gross <jgross@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH] stubdom: foreignmemory: Fix build after 0dbb4be739c5
Date: Tue, 13 Jul 2021 10:20:19 +0100
Message-Id: <20210713092019.7379-1-julien@xen.org>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Julien Grall <jgrall@amazon.com>

Commit 0dbb4be739c5 add the inclusion of xenctrl.h from private.h and
wreck the build in an interesting way:

In file included from xen/stubdom/include/xen/domctl.h:39:0,
                 from xen/tools/include/xenctrl.h:36,
                 from private.h:4,
                 from minios.c:29:
xen/include/public/memory.h:407:5: error: expected specifier-qualifier-list before ‘XEN_GUEST_HANDLE_64’
     XEN_GUEST_HANDLE_64(const_uint8) buffer;
     ^~~~~~~~~~~~~~~~~~~

This is happening because xenctrl.h defines __XEN_TOOLS__ and therefore
the public headers will start to expose the non-stable ABI. However,
xen.h has already been included by a mini-OS header before hand. So
there is a mismatch in the way the headers are included.

For now solve it in a very simple (and gross) way by including
xenctrl.h before the mini-os headers.

Fixes: 0dbb4be739c5 ("tools/libs/foreignmemory: Fix PAGE_SIZE redefinition error")
Signed-off-by: Julien Grall <jgrall@amazon.com>

---

Cc: Andrew Cooper <andrew.cooper3@citrix.com>

I couldn't find a better way with would not result to revert the patch
(and break build on some system) or involve a longer rework of the
headers.
---
 tools/libs/foreignmemory/minios.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/tools/libs/foreignmemory/minios.c b/tools/libs/foreignmemory/minios.c
index c5453736d598..d7b3f0e1c823 100644
--- a/tools/libs/foreignmemory/minios.c
+++ b/tools/libs/foreignmemory/minios.c
@@ -17,6 +17,14 @@
  * Copyright 2007-2008 Samuel Thibault <samuel.thibault@eu.citrix.com>.
  */
 
+/*
+ * xenctlr.h currently defines __XEN_TOOLS__ which affects what is
+ * exposed by Xen headers. As the define needs to be set consistently,
+ * we want to include xenctrl.h before the mini-os headers (they include
+ * public headers).
+ */
+#include <xenctrl.h>
+
 #include <mini-os/types.h>
 #include <mini-os/os.h>
 #include <mini-os/mm.h>
-- 
2.17.1


