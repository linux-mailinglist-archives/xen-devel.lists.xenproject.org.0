Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aBo8AOSL5mmbyAEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 20 Apr 2026 22:26:12 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E262E433ADB
	for <lists+xen-devel@lfdr.de>; Mon, 20 Apr 2026 22:26:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1286464.1567515 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wEvBH-0001ns-Ra; Mon, 20 Apr 2026 20:25:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1286464.1567515; Mon, 20 Apr 2026 20:25:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wEvBH-0001kw-MU; Mon, 20 Apr 2026 20:25:19 +0000
Received: by outflank-mailman (input) for mailman id 1286464;
 Mon, 20 Apr 2026 19:50:49 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Rose.Spangler@purelymail.com>) id 1wEudt-0006FL-Mq
 for xen-devel@lists.xenproject.org; Mon, 20 Apr 2026 19:50:49 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wEuds-00C1KL-LV
 for xen-devel@lists.xenproject.org; Mon, 20 Apr 2026 21:50:48 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Rose.Spangler@purelymail.com>)
 id 69e68373-5cb7-0a2a0a5109dd-0a2a4502cd0c-12
 for <xen-devel@lists.xenproject.org>; Mon, 20 Apr 2026 21:50:48 +0200
Received: from [34.202.193.197] (helo=sendmail.purelymail.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <Rose.Spangler@purelymail.com>)
 id 69e68397-af86-0a2a45020019-22cac1c584b6-3
 for <xen-devel@lists.xenproject.org>; Mon, 20 Apr 2026 21:50:48 +0200
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -306608446; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Mon, 20 Apr 2026 19:50:46 +0000 (UTC)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=purelymail1 header.d=purelymail.com header.i="@purelymail.com" header.h="Feedback-ID:Received:From:To:Subject:Date"
DKIM-Signature: a=rsa-sha256; b=U7Aj0TmlQMo2OaiARr833Wx8B5UJDkYDILENNQJui75UvlKQU6oEmzSiJ0BjFolip1mlZN84vjT4JUXT3hFYofgGxRdHZabD55DYLpNNaU9qn5va7KJ+gXZsQ5CkYM12zHkn7pmU/DGMCJzbP71DPD1zU7eZqQfq7fJvjOow0VI1ZdT3MKcEpN25tTXVyL2jeLQSxEgcj/27rVu3kmzo8J2dIfDBguYa37GP47bnO4Q6u7aKJX6gJq7ycGXlBbp33jEEjrHIbSvVsKjKwyJTwkSmYl0/ACeYhXiZpjdBeUIEc0N7J0pYgJLC6a6le5OeDibjUnB2qPRAgvdpvuCgGQ==; s=purelymail1; d=purelymail.com; v=1; bh=F9DP5LK5B/VL9yfk52EOu4d/RW0pXvXOczcYQ78lIz8=; h=Feedback-ID:Received:From:To:Subject:Date;
Feedback-ID: 685805:22403:null:purelymail
X-Pm-Original-To: xen-devel@lists.xenproject.org
From: Rose.Spangler@purelymail.com
To: xen-devel@lists.xenproject.org
Cc: Rose Spangler <Rose.Spangler@elektrobit.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [RFC PATCH v6 01/43] altp2m: Add template common altp2m.c/altp2m.h
Date: Mon, 20 Apr 2026 15:50:00 -0400
Message-Id: <20260420195042.207624-2-Rose.Spangler@purelymail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260420195042.207624-1-Rose.Spangler@purelymail.com>
References: <20260420195042.207624-1-Rose.Spangler@purelymail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by Purelymail
Content-Type: text/plain; charset=UTF-8
X-purgate-ID: tlsNG-720697/1776714648-81971161-87202937/0/0
X-purgate-type: clean
X-purgate-size: 1865
X-Spamd-Result: default: False [3.51 / 15.00];
	DMARC_POLICY_REJECT(2.00)[purelymail.com : SPF not aligned (relaxed),reject];
	R_DKIM_REJECT(1.00)[purelymail.com:s=purelymail1];
	MID_CONTAINS_FROM(1.00)[];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:Rose.Spangler@elektrobit.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[Rose.Spangler@purelymail.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[purelymail.com:-];
	FROM_NO_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	NEURAL_HAM(-0.00)[-0.901];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Rose.Spangler@purelymail.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCPT_COUNT_SEVEN(0.00)[9];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Queue-Id: E262E433ADB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Rose Spangler <Rose.Spangler@elektrobit.com>

This commit adds an empty common altp2m.c and altp2m.h file to be added to
in later commits. Creating a commit with just the empty file additions
makes it easier to reorder later commits which add to these files.

This commit can be squashed into the first commit which actually adds
something to altp2m.c/altp2m.h for the actual submission if that would be
preferred.

This is commit 1/8 of the preparation phase.

Signed-off-by: Rose Spangler <Rose.Spangler@elektrobit.com>
---
v6: Introduced this patch.
---
 xen/common/Makefile      |  1 +
 xen/common/altp2m.c      | 12 ++++++++++++
 xen/include/xen/altp2m.h |  5 +++++
 3 files changed, 18 insertions(+)
 create mode 100644 xen/common/altp2m.c
 create mode 100644 xen/include/xen/altp2m.h

diff --git a/xen/common/Makefile b/xen/common/Makefile
index 6018e256147f..dbe0094006df 100644
--- a/xen/common/Makefile
+++ b/xen/common/Makefile
@@ -1,3 +1,4 @@
+obj-$(CONFIG_ALTP2M) +=3D altp2m.o
 obj-$(CONFIG_ARGO) +=3D argo.o
 obj-y +=3D bitmap.o
 obj-bin-$(CONFIG_SELF_TESTS) +=3D bitops.init.o
diff --git a/xen/common/altp2m.c b/xen/common/altp2m.c
new file mode 100644
index 000000000000..1a4e102324d4
--- /dev/null
+++ b/xen/common/altp2m.c
@@ -0,0 +1,12 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+#include <xen/altp2m.h>
+
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: "BSD"
+ * c-basic-offset: 4
+ * tab-width: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
diff --git a/xen/include/xen/altp2m.h b/xen/include/xen/altp2m.h
new file mode 100644
index 000000000000..520328fd3fa8
--- /dev/null
+++ b/xen/include/xen/altp2m.h
@@ -0,0 +1,5 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+#ifndef __XEN_ALTP2M_H__
+#define __XEN_ALTP2M_H__
+
+#endif /* __XEN_ALTP2M_H__ */
--=20
2.34.1


