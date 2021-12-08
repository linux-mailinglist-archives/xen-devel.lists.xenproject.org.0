Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E548246D78C
	for <lists+xen-devel@lfdr.de>; Wed,  8 Dec 2021 16:56:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.242366.419300 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muzIw-0004QO-E0; Wed, 08 Dec 2021 15:56:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 242366.419300; Wed, 08 Dec 2021 15:56:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muzIv-0003y7-3P; Wed, 08 Dec 2021 15:56:25 +0000
Received: by outflank-mailman (input) for mailman id 242366;
 Wed, 08 Dec 2021 15:56:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=J2Or=QZ=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1muzIn-0001LM-76
 for xen-devel@lists.xenproject.org; Wed, 08 Dec 2021 15:56:17 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5e8c5538-583f-11ec-a831-37629979565c;
 Wed, 08 Dec 2021 16:56:13 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 518E22113A;
 Wed,  8 Dec 2021 15:56:13 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 23FF013C8E;
 Wed,  8 Dec 2021 15:56:13 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id wNGTB53VsGHIXwAAMHmgww
 (envelope-from <jgross@suse.com>); Wed, 08 Dec 2021 15:56:13 +0000
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
X-Inumbo-ID: 5e8c5538-583f-11ec-a831-37629979565c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1638978973; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZW7CF/kM5fAK9CnX8HECoM3KdS2qty2F3E2zABI0ze4=;
	b=jm+mLf5mJ6XLyj6H6NUQFb9MiFSpRUc3FjYwvvqh8Wqp5Rp6Rmsmb/vQ6ssFAOSMy5ZOG4
	axriK8aY9HQlQmE06hSb9OrMTu452eZdq7xP0hc+wDkPtAfNa8wZ5eMUB6+Q0A1ewCuUeC
	i6dRxv9WLTAQik70wZyjbts3gPd5FmA=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Wei Liu <wl@xen.org>,
	Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v3 13/13] tools/xenperf: update hypercall names
Date: Wed,  8 Dec 2021 16:56:06 +0100
Message-Id: <20211208155606.20029-14-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20211208155606.20029-1-jgross@suse.com>
References: <20211208155606.20029-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The hypercall names need some update.

Signed-off-by: Juergen Gross <jgross@suse.com>
Reviewed-by: Jan Beulich <jbeulich@suse.com>
---
V2:
- new patch
---
 tools/misc/xenperf.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/tools/misc/xenperf.c b/tools/misc/xenperf.c
index a5fbdaa45f..2ad737e661 100644
--- a/tools/misc/xenperf.c
+++ b/tools/misc/xenperf.c
@@ -57,6 +57,11 @@ const char *hypercall_name_table[64] =
     X(sysctl),
     X(domctl),
     X(kexec_op),
+    X(tmem_op),
+    X(argo_op),
+    X(xenpmu_op),
+    X(dm_op),
+    X(hypfs_op),
     X(arch_0),
     X(arch_1),
     X(arch_2),
-- 
2.26.2


