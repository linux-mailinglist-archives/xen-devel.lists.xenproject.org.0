Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 25E919E665D
	for <lists+xen-devel@lfdr.de>; Fri,  6 Dec 2024 05:42:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.849418.1264105 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tJQA4-0006tA-Ih; Fri, 06 Dec 2024 04:41:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 849418.1264105; Fri, 06 Dec 2024 04:41:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tJQA3-0006fj-Nn; Fri, 06 Dec 2024 04:41:51 +0000
Received: by outflank-mailman (input) for mailman id 849418;
 Fri, 06 Dec 2024 04:41:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5aHD=S7=kernel.org=devnull+dmukhin.ford.com@srs-se1.protection.inumbo.net>)
 id 1tJQ9y-0004Ka-MH
 for xen-devel@lists.xenproject.org; Fri, 06 Dec 2024 04:41:46 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 631e1280-b38c-11ef-a0d5-8be0dac302b0;
 Fri, 06 Dec 2024 05:41:42 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id C776E5C7313;
 Fri,  6 Dec 2024 04:40:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 680C5C4CEE2;
 Fri,  6 Dec 2024 04:41:38 +0000 (UTC)
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id 5C123E77175;
 Fri,  6 Dec 2024 04:41:38 +0000 (UTC)
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
X-Inumbo-ID: 631e1280-b38c-11ef-a0d5-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733460098;
	bh=xTYc/Qlg0H7wze8ET4iZ+jZPU60Pxe70nfmD2bNhJJc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=HmxMoZEM1burY3Rn3ELAcCBBQCqV6gh5CTS8conK3YXZJBM2SuvqT3BYQwzx/imP4
	 JdbAbm3TTRVp7cNBAehwNLOXcvG0i9FhvdJ8cwPYl6+xvu+KEgJspDo5jCcw9+DqGA
	 +xPtoAINRl2RVfHtHfFVSK5+YcKjaOszAlf4chNs2TaAONwcn7C9zM3amQtuu+5xs2
	 KpbAmhuhPVNdt/wUoJljwjkzp7jY3r6YEdyMsDlE9yJS2opANb2Y81Y32je1VzD3XN
	 W1NnfFb5NBfCyyjCqeRtYIJ7vQGZGxxTIvcXj90RNxabz0NSpflhPq5+uTd1vgJ9KF
	 S6eZvc8UU2JNg==
From: Denis Mukhin via B4 Relay <devnull+dmukhin.ford.com@kernel.org>
Date: Thu, 05 Dec 2024 20:41:46 -0800
Subject: [PATCH v2 16/35] xen/console: introduce printk_common()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241205-vuart-ns8250-v1-16-e9aa923127eb@ford.com>
References: <20241205-vuart-ns8250-v1-0-e9aa923127eb@ford.com>
In-Reply-To: <20241205-vuart-ns8250-v1-0-e9aa923127eb@ford.com>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, 
 Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, 
 Stefano Stabellini <sstabellini@kernel.org>, 
 Denis Mukhin <dmukhin@ford.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1733460094; l=2804;
 i=dmukhin@ford.com; s=20241125; h=from:subject:message-id;
 bh=0ZbhB6X3j//rZlvA+RHGboOQv/T4QXzBiywEl761Zm0=;
 b=mvzE8dnFdKifjiI0dNonuR4BBXjCK1QgfdIVHGd90YVxQ4pyP2joNBy5YkM/E0s0jgY0pCc59
 ZutJT2tuuA5B0gthGeK0qfNuZBTsquHOQi7NQWwUpYzKUjR3VI2XKEp
X-Developer-Key: i=dmukhin@ford.com; a=ed25519;
 pk=SsDZ9p39s0fqcpUKQuqKqrbn0rq6EtEAClvpOpzx6+U=
X-Endpoint-Received: by B4 Relay for dmukhin@ford.com/20241125 with
 auth_id=287
X-Original-From: Denis Mukhin <dmukhin@ford.com>
Reply-To: dmukhin@ford.com

From: Denis Mukhin <dmukhin@ford.com>

Introduce new printk() variant for convenient printouts which skip '(XEN)'
prefix on xen console. This is needed for the case when physical console is
owned by a domain w/ in-hypervisor UART emulation enabled.

Signed-off-by: Denis Mukhin <dmukhin@ford.com>
---
 automation/eclair_analysis/ECLAIR/deviations.ecl | 2 +-
 xen/drivers/char/console.c                       | 8 ++++++++
 xen/include/xen/lib.h                            | 3 +++
 3 files changed, 12 insertions(+), 1 deletion(-)

diff --git a/automation/eclair_analysis/ECLAIR/deviations.ecl b/automation/eclair_analysis/ECLAIR/deviations.ecl
index 2f58f292036e3561118ce9664a92756b1b938739..c59d075262e9e6618ea2a2d27611a537ded3a776 100644
--- a/automation/eclair_analysis/ECLAIR/deviations.ecl
+++ b/automation/eclair_analysis/ECLAIR/deviations.ecl
@@ -522,7 +522,7 @@ safe."
 -config=MC3R1.R17.1,reports+={deliberate,"any_area(^.*va_list.*$&&context(ancestor_or_self(^.*printf\\(.*\\)$)))"}
 -config=MC3R1.R17.1,reports+={deliberate,"any_area(^.*va_list.*$&&context(ancestor_or_self(name(panic)&&kind(function))))"}
 -config=MC3R1.R17.1,reports+={deliberate,"any_area(^.*va_list.*$&&context(ancestor_or_self(name(elf_call_log_callback)&&kind(function))))"}
--config=MC3R1.R17.1,reports+={deliberate,"any_area(^.*va_list.*$&&context(ancestor_or_self(name(vprintk_common)&&kind(function))))"}
+-config=MC3R1.R17.1,reports+={deliberate,"any_area(^.*va_list.*$&&context(ancestor_or_self(name(^v?printk_common)&&kind(function))))"}
 -config=MC3R1.R17.1,macros+={hide , "^va_(arg|start|copy|end)$"}
 -doc_end
 
diff --git a/xen/drivers/char/console.c b/xen/drivers/char/console.c
index 86bf899ada8f8221ffc77bcffb1f58777a22198e..f034ce5aab3f3bf59b0df9fa583ee9ce32dbf665 100644
--- a/xen/drivers/char/console.c
+++ b/xen/drivers/char/console.c
@@ -968,6 +968,14 @@ void printk(const char *fmt, ...)
     va_end(args);
 }
 
+void printk_common(const char *fmt, ...)
+{
+    va_list args;
+    va_start(args, fmt);
+    vprintk_common("", fmt, args);
+    va_end(args);
+}
+
 void guest_printk(const struct domain *d, const char *fmt, ...)
 {
     va_list args;
diff --git a/xen/include/xen/lib.h b/xen/include/xen/lib.h
index 81b722ea3e801e9089aaf8758249feb3a758c4f7..8a7ff2e8af9089796ff28ef8d01c00e9845782ca 100644
--- a/xen/include/xen/lib.h
+++ b/xen/include/xen/lib.h
@@ -61,6 +61,9 @@ debugtrace_printk(const char *fmt, ...) {}
 extern void printk(const char *fmt, ...)
     __attribute__ ((format (printf, 1, 2), cold));
 
+extern void printk_common(const char *fmt, ...)
+    __attribute__ ((format (printf, 1, 2)));
+
 #define printk_once(fmt, args...)               \
 ({                                              \
     static bool __read_mostly once_;            \

-- 
2.34.1



