Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 28807441D51
	for <lists+xen-devel@lfdr.de>; Mon,  1 Nov 2021 16:20:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.219249.380049 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mhZ7A-0003gc-Je; Mon, 01 Nov 2021 15:20:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 219249.380049; Mon, 01 Nov 2021 15:20:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mhZ7A-0003bU-Cm; Mon, 01 Nov 2021 15:20:48 +0000
Received: by outflank-mailman (input) for mailman id 219249;
 Mon, 01 Nov 2021 15:20:46 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=rWtG=PU=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1mhZ78-0008DA-Lt
 for xen-devel@lists.xenproject.org; Mon, 01 Nov 2021 15:20:46 +0000
Received: from smtp-out1.suse.de (unknown [195.135.220.28])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7c7e07be-614e-4e1f-8d60-617c344bf99b;
 Mon, 01 Nov 2021 15:20:24 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 4DB092196F;
 Mon,  1 Nov 2021 15:20:23 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 2216413A4A;
 Mon,  1 Nov 2021 15:20:23 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id cM0LB7cFgGFzNwAAMHmgww
 (envelope-from <jgross@suse.com>); Mon, 01 Nov 2021 15:20:23 +0000
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
X-Inumbo-ID: 7c7e07be-614e-4e1f-8d60-617c344bf99b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1635780023; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=H629Skc+4HUyFvxQxJWzVqDkNXqgQ0ZyU5Da5yGGsZY=;
	b=SpiH1gw91xN4jGcy6lMLTFgnciz4R7VV6l3QNBg2NZlNiVNVqKucGAhVx+h681W3VrPGDc
	LBvoNlUssn3sF0wnC2vLfquJZYGQfkdAiii5n+aMLkTtE3kNIQQmE/4zY4aOe51KaPuS+Z
	XhEA5HsnGJHGgo2q98UqXb/W+yQeP60=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v2 15/15] tools/xenperf: update hypercall names
Date: Mon,  1 Nov 2021 16:20:15 +0100
Message-Id: <20211101152015.28488-16-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20211101152015.28488-1-jgross@suse.com>
References: <20211101152015.28488-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The hypercall names need some update.

Signed-off-by: Juergen Gross <jgross@suse.com>
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


