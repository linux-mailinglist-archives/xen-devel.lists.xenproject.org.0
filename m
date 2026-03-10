Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +PysHJnRr2kfcgIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 10 Mar 2026 09:08:57 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 15EC1246FCF
	for <lists+xen-devel@lfdr.de>; Tue, 10 Mar 2026 09:08:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1249837.1547222 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vzs8e-0007ZN-7v; Tue, 10 Mar 2026 08:08:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1249837.1547222; Tue, 10 Mar 2026 08:08:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vzs8e-0007Ww-4H; Tue, 10 Mar 2026 08:08:24 +0000
Received: by outflank-mailman (input) for mailman id 1249837;
 Tue, 10 Mar 2026 08:08:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=AZzR=BK=isrc.iscas.ac.cn=pengpeng.hou@srs-se1.protection.inumbo.net>)
 id 1vzs8c-0007Wo-VS
 for xen-devel@lists.xenproject.org; Tue, 10 Mar 2026 08:08:22 +0000
Received: from cstnet.cn (smtp81.cstnet.cn [159.226.251.81])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 48d4b70a-1c58-11f1-b164-2bf370ae4941;
 Tue, 10 Mar 2026 09:08:17 +0100 (CET)
Received: from localhost.localdomain (unknown [210.73.43.101])
 by APP-03 (Coremail) with SMTP id rQCowAD3E9to0a9pDDQ7Cg--.45464S2;
 Tue, 10 Mar 2026 16:08:09 +0800 (CST)
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
X-Inumbo-ID: 48d4b70a-1c58-11f1-b164-2bf370ae4941
From: Pengpeng Hou <pengpeng.hou@isrc.iscas.ac.cn>
To: Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Cc: xen-devel@lists.xenproject.org,
	linux-kernel@vger.kernel.org,
	Pengpeng Hou <pengpeng.hou@isrc.iscas.ac.cn>
Subject: [PATCH v2] xen/grant-table: guard gnttab_suspend/resume with CONFIG_HIBERNATE_CALLBACKS
Date: Tue, 10 Mar 2026 08:08:00 +0000
Message-Id: <20260310080800.742223-1-pengpeng.hou@isrc.iscas.ac.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:rQCowAD3E9to0a9pDDQ7Cg--.45464S2
X-Coremail-Antispam: 1UD129KBjvJXoW7Zr15ZFWDtrW5uFyfXw4Utwb_yoW8tF4xpF
	Z8JrWqyr95Ja4SyFWaya9YkFy5ua93J3yxGr4Y9rZxZan7Gr17ArWSqFyjvr1kWrW8Jr4v
	vF4qgrW3Cr4UuaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUvv14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r1j6r1xM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r1j
	6r4UM28EF7xvwVC2z280aVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv6xkF7I0E14v26r4j6r
	4UJwAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
	I7IYx2IY67AKxVWUAVWUtwAv7VC2z280aVAFwI0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r1j6r
	4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCY1x0262kKe7AKxVWU
	AVWUtwCY02Avz4vE14v_GFyl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr
	1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE
	14v26r126r1DMIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7
	IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E
	87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73Uj
	IFyTuYvjfUjkucDUUUU
X-Originating-IP: [210.73.43.101]
X-CM-SenderInfo: pshqw1hhqjhx1rx6x21ufox2xfdvhtffof0/
X-Rspamd-Queue-Id: 15EC1246FCF
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.01 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DMARC_NA(0.00)[iscas.ac.cn];
	FORGED_RECIPIENTS(0.00)[m:jgross@suse.com,m:sstabellini@kernel.org,m:oleksandr_tyshchenko@epam.com,m:xen-devel@lists.xenproject.org,m:linux-kernel@vger.kernel.org,m:pengpeng.hou@isrc.iscas.ac.cn,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	FORGED_SENDER(0.00)[pengpeng.hou@isrc.iscas.ac.cn,xen-devel-bounces@lists.xenproject.org];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[mailman];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_FIVE(0.00)[6];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7];
	FROM_NEQ_ENVFROM(0.00)[pengpeng.hou@isrc.iscas.ac.cn,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	HAS_XOIP(0.00)[];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.994];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[isrc.iscas.ac.cn:mid]
X-Rspamd-Action: no action

In current linux.git, gnttab_suspend() and gnttab_resume() are defined
and declared unconditionally. However, their only in-tree callers reside
in drivers/xen/manage.c, which are guarded by CONFIG_HIBERNATE_CALLBACKS.

Match the helper scope to their callers by wrapping the definitions in
CONFIG_HIBERNATE_CALLBACKS and providing no-op stubs in the header. This
fixes the config-scope mismatch and reduces the code footprint when
hibernation callbacks are disabled.

Signed-off-by: Pengpeng Hou <pengpeng.hou@isrc.iscas.ac.cn>
---
Hi Juergen,

Thank you for the feedback. I apologize for the non-standard patch format 
in the previous version. 

As requested, I have regenerated this patch using `git format-patch` to 
ensure proper hunk headers and context line numbers are included.

Changes in v2:
- Re-generated with proper git formatting (line numbers and context).
- No functional changes from v1.

 drivers/xen/grant-table.c |  3 ++-
 include/xen/grant_table.h | 12 ++++++++++++
 2 files changed, 14 insertions(+), 1 deletion(-)

diff --git a/drivers/xen/grant-table.c b/drivers/xen/grant-table.c
index 97e27f754d396..a6abf1ccd54ce 100644
--- a/drivers/xen/grant-table.c
+++ b/drivers/xen/grant-table.c
@@ -1579,7 +1579,7 @@ static int gnttab_setup(void)
 	}
 	return gnttab_map(0, nr_grant_frames - 1);
 }
-
+#ifdef CONFIG_HIBERNATE_CALLBACKS
 int gnttab_resume(void)
 {
 	gnttab_request_version();
@@ -1592,6 +1592,7 @@ int gnttab_suspend(void)
 		gnttab_interface->unmap_frames();
 	return 0;
 }
+#endif
 
 static int gnttab_expand(unsigned int req_entries)
 {
diff --git a/include/xen/grant_table.h b/include/xen/grant_table.h
index 69ac6d80a006b..a33a60a2ea72d 100644
--- a/include/xen/grant_table.h
+++ b/include/xen/grant_table.h
@@ -84,8 +84,20 @@ struct gntab_unmap_queue_data
 };
 
 int gnttab_init(void);
+#ifdef CONFIG_HIBERNATE_CALLBACKS
 int gnttab_suspend(void);
 int gnttab_resume(void);
+#else
+static inline int gnttab_suspend(void)
+{
+	return 0;
+}
+
+static inline int gnttab_resume(void)
+{
+	return 0;
+}
+#endif
 
 int gnttab_grant_foreign_access(domid_t domid, unsigned long frame,
 				int readonly);
-- 
2.25.1


