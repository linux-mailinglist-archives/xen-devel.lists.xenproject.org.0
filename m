Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id bSZeHlEsNWqdnwYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 19 Jun 2026 13:47:29 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 04CB76A57C7
	for <lists+xen-devel@lfdr.de>; Fri, 19 Jun 2026 13:47:29 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=redhat.com header.s=mimecast20190719 header.b=hPP2zwXy;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=quarantine) header.from=redhat.com
Received: from list by lists.xenproject.org with outflank-mailman.1342124.1602389 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1waXgI-0005r4-36; Fri, 19 Jun 2026 11:46:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1342124.1602389; Fri, 19 Jun 2026 11:46:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1waXgI-0005pE-0M; Fri, 19 Jun 2026 11:46:42 +0000
Received: by outflank-mailman (input) for mailman id 1342124;
 Fri, 19 Jun 2026 11:46:40 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <thuth@redhat.com>) id 1waXgG-0005p8-CE
 for xen-devel@lists.xenproject.org; Fri, 19 Jun 2026 11:46:40 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1waXgE-0074DC-4t
 for xen-devel@lists.xenproject.org; Fri, 19 Jun 2026 13:46:38 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <thuth@redhat.com>)
 id 6a352c12-2eae-0a2a0a5409dd-0a2a450ac4f4-46
 for <xen-devel@lists.xenproject.org>; Fri, 19 Jun 2026 13:46:37 +0200
Received: from [170.10.133.124] (helo=us-smtp-delivery-124.mimecast.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.0)
 (envelope-from <thuth@redhat.com>)
 id 6a352c1c-93a5-0a2a450a0019-aa0a857c7959-3
 for <xen-devel@lists.xenproject.org>; Fri, 19 Jun 2026 13:46:37 +0200
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-456-RqXo4HBnMQiB0DNLrD7kpg-1; Fri,
 19 Jun 2026 07:46:32 -0400
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 522C0184556C; Fri, 19 Jun 2026 11:46:31 +0000 (UTC)
Received: from thuth-p1g4.redhat.corp
 (headnet04.pony-001.prod.iad2.dc.redhat.com [10.2.32.116])
 by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 90D95195604E; Fri, 19 Jun 2026 11:46:06 +0000 (UTC)
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
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1781869596;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=zuV9wleDPJXQ4MvGs+4yzuJAS7DRs0hr8UQ5BwqC7Iw=;
	b=hPP2zwXy8MQ5neq2S867fUY/M82SKEZ2I9v+/yWDXLAj/oELOYVcbpgaqV2DdK4jbsJOVS
	BS7eKhhkDUYdBG+0HDB2cFaapIVuXWbseZN3AiiM0S5TBFcjp2c9LmpkzcmK95VFe6vdDJ
	2Mi+aIF5rQqhqXbldcIm8Bi75LIqOWQ=
X-MC-Unique: RqXo4HBnMQiB0DNLrD7kpg-1
X-Mimecast-MFC-AGG-ID: RqXo4HBnMQiB0DNLrD7kpg_1781869591
From: Thomas Huth <thuth@redhat.com>
To: Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	xen-devel@lists.xenproject.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] xen: Replace __ASSEMBLY__ with __ASSEMBLER__ in header files
Date: Fri, 19 Jun 2026 13:45:47 +0200
Message-ID: <20260619114547.159637-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
X-Mimecast-MFC-PROC-ID: ldhh4FfenNwG1jh2FUlFU_JMjrQtS4TJRapnQBt0Ax8_1781869591
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
X-purgate-ID: tlsNG-4011c0/1781869597-2E1F6DB8-E5156560/0/0
X-purgate-type: clean
X-purgate-size: 2427
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.19 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[redhat.com,quarantine];
	R_DKIM_ALLOW(-0.20)[redhat.com:s=mimecast20190719];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jgross@suse.com,m:sstabellini@kernel.org,m:oleksandr_tyshchenko@epam.com,m:xen-devel@lists.xenproject.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[thuth@redhat.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[redhat.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[thuth@redhat.com,xen-devel-bounces@lists.xenproject.org];
	RCPT_COUNT_FIVE(0.00)[5];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[11]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 04CB76A57C7

From: Thomas Huth <thuth@redhat.com>

While the GCC and Clang compilers already define __ASSEMBLER__
automatically when compiling assembly code, __ASSEMBLY__ is a
macro that only gets defined by the Makefiles in the kernel.
This can be very confusing when switching between userspace
and kernelspace coding, or when dealing with uapi headers that
rather should use __ASSEMBLER__ instead. So let's standardize now
on the __ASSEMBLER__ macro that is provided by the compilers.

This is a completely mechanical patch (done with a simple "sed -i"
statement).

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 Note: This patch has been split from an earlier bigger patch of
 mine to ease reviewing.

 include/xen/interface/xen-mca.h | 4 ++--
 include/xen/interface/xen.h     | 8 ++++----
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/include/xen/interface/xen-mca.h b/include/xen/interface/xen-mca.h
index 1c9afbe8cc260..8f5815f1d3ab3 100644
--- a/include/xen/interface/xen-mca.h
+++ b/include/xen/interface/xen-mca.h
@@ -50,7 +50,7 @@
 /* OUT: There was no machine check data to fetch. */
 #define XEN_MC_NODATA		0x2
 
-#ifndef __ASSEMBLY__
+#ifndef __ASSEMBLER__
 /* vIRQ injected to Dom0 */
 #define VIRQ_MCA VIRQ_ARCH_0
 
@@ -388,5 +388,5 @@ struct xen_mce_log {
 #define MCE_GET_LOG_LEN      _IOR('M', 2, int)
 #define MCE_GETCLEAR_FLAGS   _IOR('M', 3, int)
 
-#endif /* __ASSEMBLY__ */
+#endif /* __ASSEMBLER__ */
 #endif /* __XEN_PUBLIC_ARCH_X86_MCA_H__ */
diff --git a/include/xen/interface/xen.h b/include/xen/interface/xen.h
index 0ca23eca2a9cc..40c9793e98805 100644
--- a/include/xen/interface/xen.h
+++ b/include/xen/interface/xen.h
@@ -337,7 +337,7 @@
 #define MMUEXT_MARK_SUPER       19
 #define MMUEXT_UNMARK_SUPER     20
 
-#ifndef __ASSEMBLY__
+#ifndef __ASSEMBLER__
 struct mmuext_op {
 	unsigned int cmd;
 	union {
@@ -415,7 +415,7 @@ DEFINE_GUEST_HANDLE_STRUCT(mmuext_op);
 
 #define MAX_VMASST_TYPE 5
 
-#ifndef __ASSEMBLY__
+#ifndef __ASSEMBLER__
 
 typedef uint16_t domid_t;
 
@@ -760,11 +760,11 @@ struct tmem_op {
 
 DEFINE_GUEST_HANDLE(u64);
 
-#else /* __ASSEMBLY__ */
+#else /* __ASSEMBLER__ */
 
 /* In assembly code we cannot use C numeric constant suffixes. */
 #define mk_unsigned_long(x) x
 
-#endif /* !__ASSEMBLY__ */
+#endif /* !__ASSEMBLER__ */
 
 #endif /* __XEN_PUBLIC_XEN_H__ */
-- 
2.54.0


