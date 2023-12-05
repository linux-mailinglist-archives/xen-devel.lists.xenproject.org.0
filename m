Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 671108059FA
	for <lists+xen-devel@lfdr.de>; Tue,  5 Dec 2023 17:31:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.648134.1012172 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rAYKZ-0006Ga-KS; Tue, 05 Dec 2023 16:31:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 648134.1012172; Tue, 05 Dec 2023 16:31:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rAYKZ-0006Eq-HR; Tue, 05 Dec 2023 16:31:31 +0000
Received: by outflank-mailman (input) for mailman id 648134;
 Tue, 05 Dec 2023 16:31:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tw6T=HQ=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1rAYKY-0006Eh-5e
 for xen-devel@lists.xenproject.org; Tue, 05 Dec 2023 16:31:30 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bd2a082d-938b-11ee-9b0f-b553b5be7939;
 Tue, 05 Dec 2023 17:31:28 +0100 (CET)
Received: from nico.bugseng.com (unknown [147.123.100.131])
 by support.bugseng.com (Postfix) with ESMTPSA id 997614EE0741;
 Tue,  5 Dec 2023 17:31:26 +0100 (CET)
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
X-Inumbo-ID: bd2a082d-938b-11ee-9b0f-b553b5be7939
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com,
	Nicola Vetrini <nicola.vetrini@bugseng.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [XEN PATCH] ns16550: remove partial explicit initializer
Date: Tue,  5 Dec 2023 17:31:23 +0100
Message-Id: <89f9aebddac56c034aace59c5b910ad4bef701c5.1701793717.git.nicola.vetrini@bugseng.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The initializer of 'ns16550_com' violates MISRA C Rule 9.3
because it explicitly initializes only the first element of the array,
but the semantics is the same if the explicit initialization is
omitted.

No functional change.

Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
---
In the context of the rule ("Arrays shall not be partially initialized"),
the initialization shall either be fully explicit or implicit.
---
 xen/drivers/char/ns16550.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/drivers/char/ns16550.c b/xen/drivers/char/ns16550.c
index ddf2a48be6e7..a21c1d8c3402 100644
--- a/xen/drivers/char/ns16550.c
+++ b/xen/drivers/char/ns16550.c
@@ -73,7 +73,7 @@ static struct ns16550 {
     bool msi;
     const struct ns16550_config_param *param; /* Points into .init.*! */
 #endif
-} ns16550_com[2] = { { 0 } };
+} ns16550_com[2] = { };
 
 #ifdef NS16550_PCI
 struct ns16550_config {
-- 
2.34.1

