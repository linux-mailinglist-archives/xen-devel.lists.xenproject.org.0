Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id CBi/B1H7Q2oAmwoAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 30 Jun 2026 19:22:25 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E7276E6DBD
	for <lists+xen-devel@lfdr.de>; Tue, 30 Jun 2026 19:22:24 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("headers rsa verify failed") header.d=igalia.com header.s=20170329 header.b=BTkz3qCe;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=igalia.com (policy=none)
Received: from list by lists.xenproject.org with outflank-mailman.1349279.1607150 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wec9y-0001XO-Pg; Tue, 30 Jun 2026 17:22:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1349279.1607150; Tue, 30 Jun 2026 17:22:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wec9y-0001Tf-MF; Tue, 30 Jun 2026 17:22:10 +0000
Received: by outflank-mailman (input) for mailman id 1349279;
 Tue, 30 Jun 2026 17:22:09 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <mfo@igalia.com>) id 1wec9w-0001R6-Pa
 for xen-devel@lists.xenproject.org; Tue, 30 Jun 2026 17:22:09 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wec9v-005HYA-1V
 for xen-devel@lists.xenproject.org; Tue, 30 Jun 2026 19:22:07 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <mfo@igalia.com>)
 id 6a43fafe-e002-0a2a0a5209dd-0a2a4504b2be-46
 for <xen-devel@lists.xenproject.org>; Tue, 30 Jun 2026 19:22:06 +0200
Received: from [213.97.179.56] (helo=fanzine2.igalia.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <mfo@igalia.com>)
 id 6a43fb3d-a01d-0a2a45040019-d561b338dcb4-3
 for <xen-devel@lists.xenproject.org>; Tue, 30 Jun 2026 19:22:06 +0200
Received: from 186-249-148-121.shared.desktop.com.br ([186.249.148.121]
 helo=[127.0.1.1]) by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1wec9d-007CH3-5x; Tue, 30 Jun 2026 19:21:49 +0200
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Cc:To:In-Reply-To:References:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=cbo7APVGgkBxZ4BLzRh6ix97JTDWhDJxr3+WL6IL7Rs=; b=BTkz3qCey4JPMY//jgxOnO/7ot
	00QsFQ5llkizDf4B9od45FXxTfERTo7ucs2n6EAOLNf4qxJ01XoToOESTo62ghZ7ISObCZ0DiwLa6
	hlmpblEMqCpofaPwu1Ln2TUD160reIeEx3taO4ndLAaNoQL0tg2M1PEwGgz9LS//F47DCpiBm5SEb
	dktLMdqMWfuRuSimBgP6dTsdGwnC1M2CQm5Jq7cJzALB6JGwnBNjfrdZ+WEZL5uVingkzrV3tB5ol
	TqW/5mgh7EEjhGjhGp7ld+cFrBKZpL75CvuxWyr6DcE7DByK8yBeH9XNjO6p6Sg7iXwWnFxfJqQSd
	6Mf3TBDw==;
From: Mauricio Faria de Oliveira <mfo@igalia.com>
Date: Tue, 30 Jun 2026 14:21:46 -0300
Subject: [PATCH RESEND v5 1/3] x86/asm, x86/boot: expose inline memcmp
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260630-pvh-kasan-inline-v5-1-52afc979be81@igalia.com>
References: <20260630-pvh-kasan-inline-v5-0-52afc979be81@igalia.com>
In-Reply-To: <20260630-pvh-kasan-inline-v5-0-52afc979be81@igalia.com>
To: Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, 
 x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>, 
 Juergen Gross <jgross@suse.com>, Alexey Dobriyan <adobriyan@gmail.com>, 
 Boris Ostrovsky <boris.ostrovsky@oracle.com>
Cc: kernel-dev@igalia.com, linux-kernel@vger.kernel.org, 
 xen-devel@lists.xenproject.org, Mauricio Faria de Oliveira <mfo@igalia.com>
X-Mailer: b4 0.14.2
X-purgate-ID: tlsNG-ebf023/1782840126-2D7AE1CC-60FD723E/0/0
X-purgate-type: clean
X-purgate-size: 2572
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.61 / 15.00];
	R_DKIM_REJECT(1.00)[igalia.com:s=20170329];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[igalia.com : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:tglx@kernel.org,m:mingo@redhat.com,m:bp@alien8.de,m:dave.hansen@linux.intel.com,m:x86@kernel.org,m:hpa@zytor.com,m:jgross@suse.com,m:adobriyan@gmail.com,m:boris.ostrovsky@oracle.com,m:kernel-dev@igalia.com,m:linux-kernel@vger.kernel.org,m:xen-devel@lists.xenproject.org,m:mfo@igalia.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[igalia.com:email,igalia.com:mid,igalia.com:from_mime];
	FREEMAIL_TO(0.00)[kernel.org,redhat.com,alien8.de,linux.intel.com,zytor.com,suse.com,gmail.com,oracle.com];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_SENDER(0.00)[mfo@igalia.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[igalia.com:-];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mfo@igalia.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9E7276E6DBD

Move the inline memcmp function currently only available in 'boot/string.c'
into the shared string function header <asm/shared/string.h> to be reused.

This is not done through <asm/string.h> to avoid pulling unnecessary code
in 'boot/string.c' that causes build errors in 'boot/compressed/string.c'
and 'purgatory/purgatory.ro'.

Note that the inline memcmp() returns 0/1, not -1/0/1 as regular memcmp()
(reported by David Laight <david.laight.linux@gmail.com>).

Signed-off-by: Mauricio Faria de Oliveira <mfo@igalia.com>
---
 arch/x86/boot/string.c               |  6 ++----
 arch/x86/include/asm/shared/string.h | 16 ++++++++++++++++
 arch/x86/include/asm/string.h        |  1 +
 3 files changed, 19 insertions(+), 4 deletions(-)

diff --git a/arch/x86/boot/string.c b/arch/x86/boot/string.c
index ac0f900ebc47efa81c92e1bb2010ea41677899c4..be454a6864225f3a972c3e81826b77ed4e8a57fe 100644
--- a/arch/x86/boot/string.c
+++ b/arch/x86/boot/string.c
@@ -15,6 +15,7 @@
 #include <linux/errno.h>
 #include <linux/limits.h>
 #include <asm/asm.h>
+#include <asm/shared/string.h>
 #include "ctype.h"
 #include "string.h"
 
@@ -31,10 +32,7 @@
 
 int memcmp(const void *s1, const void *s2, size_t len)
 {
-	bool diff;
-	asm("repe cmpsb"
-	    : "=@ccnz" (diff), "+D" (s1), "+S" (s2), "+c" (len));
-	return diff;
+	return __inline_memcmp(s1, s2, len);
 }
 
 /*
diff --git a/arch/x86/include/asm/shared/string.h b/arch/x86/include/asm/shared/string.h
new file mode 100644
index 0000000000000000000000000000000000000000..422952152f533ad75b98f3873297b39c4f5e2477
--- /dev/null
+++ b/arch/x86/include/asm/shared/string.h
@@ -0,0 +1,16 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef _ASM_X86_SHARED_STRING_H
+#define _ASM_X86_SHARED_STRING_H
+
+/* Note: this memcmp() returns 0/1, not -1/0/1 as regular memcmp(). */
+static __always_inline int __inline_memcmp(const void *s1, const void *s2, size_t len)
+{
+	bool diff;
+
+	asm("repe cmpsb"
+	    : "=@ccnz" (diff), "+D" (s1), "+S" (s2), "+c" (len));
+
+	return diff;
+}
+
+#endif /* _ASM_X86_SHARED_STRING_H */
diff --git a/arch/x86/include/asm/string.h b/arch/x86/include/asm/string.h
index 9cb5aae7fba9ffcf0f5af8f939d30467750ccaa9..f0f4fd8227bf992e78c69209efb31f0a9a0cc3b1 100644
--- a/arch/x86/include/asm/string.h
+++ b/arch/x86/include/asm/string.h
@@ -7,6 +7,7 @@
 #else
 # include <asm/string_64.h>
 #endif
+#include <asm/shared/string.h>
 
 static __always_inline void *__inline_memcpy(void *to, const void *from, size_t len)
 {

-- 
2.47.3


