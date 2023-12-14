Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EA5C1812F0D
	for <lists+xen-devel@lfdr.de>; Thu, 14 Dec 2023 12:44:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.654487.1021404 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rDk8X-0001Ba-3V; Thu, 14 Dec 2023 11:44:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 654487.1021404; Thu, 14 Dec 2023 11:44:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rDk8W-00019O-Uu; Thu, 14 Dec 2023 11:44:16 +0000
Received: by outflank-mailman (input) for mailman id 654487;
 Thu, 14 Dec 2023 11:44:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=57RS=HZ=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1rDk8V-0000uU-Oq
 for xen-devel@lists.xenproject.org; Thu, 14 Dec 2023 11:44:15 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1b22bd8e-9a76-11ee-98e9-6d05b1d4d9a1;
 Thu, 14 Dec 2023 12:44:14 +0100 (CET)
Received: from nico.bugseng.com (unknown [147.123.100.131])
 by support.bugseng.com (Postfix) with ESMTPSA id 3BE0F4EE0744;
 Thu, 14 Dec 2023 12:44:14 +0100 (CET)
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
X-Inumbo-ID: 1b22bd8e-9a76-11ee-98e9-6d05b1d4d9a1
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com,
	Nicola Vetrini <nicola.vetrini@bugseng.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [XEN PATCH 2/5] x86/ioapic: use NULL as a null pointer constant
Date: Thu, 14 Dec 2023 12:44:07 +0100
Message-Id: <01968117d9fc3eee6d6eca0d340d9d2edd4d6dd4.1702553835.git.nicola.vetrini@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1702553835.git.nicola.vetrini@bugseng.com>
References: <cover.1702553835.git.nicola.vetrini@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Resolves violations of MISRA C Rule 11.9.
No functional change.

Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
---
 xen/arch/x86/io_apic.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/xen/arch/x86/io_apic.c b/xen/arch/x86/io_apic.c
index d11c880544e6..dd25ba394301 100644
--- a/xen/arch/x86/io_apic.c
+++ b/xen/arch/x86/io_apic.c
@@ -207,7 +207,7 @@ struct IO_APIC_route_entry **alloc_ioapic_entries(void)
 
     ioapic_entries = xmalloc_array(struct IO_APIC_route_entry *, nr_ioapics);
     if (!ioapic_entries)
-        return 0;
+        return NULL;
 
     for (apic = 0; apic < nr_ioapics; apic++) {
         ioapic_entries[apic] =
@@ -224,7 +224,7 @@ nomem:
         xfree(ioapic_entries[apic]);
     xfree(ioapic_entries);
 
-    return 0;
+    return NULL;
 }
 
 union entry_union {
-- 
2.34.1


