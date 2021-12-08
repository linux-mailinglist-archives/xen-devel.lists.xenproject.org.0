Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E0D946D780
	for <lists+xen-devel@lfdr.de>; Wed,  8 Dec 2021 16:56:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.242357.419212 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muzIk-0001qf-Fn; Wed, 08 Dec 2021 15:56:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 242357.419212; Wed, 08 Dec 2021 15:56:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muzIk-0001gA-4S; Wed, 08 Dec 2021 15:56:14 +0000
Received: by outflank-mailman (input) for mailman id 242357;
 Wed, 08 Dec 2021 15:56:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=J2Or=QZ=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1muzIi-0001Lz-Ga
 for xen-devel@lists.xenproject.org; Wed, 08 Dec 2021 15:56:12 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5d38a5f9-583f-11ec-9d12-4777fae47e2b;
 Wed, 08 Dec 2021 16:56:11 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 1519A218A4;
 Wed,  8 Dec 2021 15:56:11 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id CCF3213C8E;
 Wed,  8 Dec 2021 15:56:10 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id QFTgMJrVsGHIXwAAMHmgww
 (envelope-from <jgross@suse.com>); Wed, 08 Dec 2021 15:56:10 +0000
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
X-Inumbo-ID: 5d38a5f9-583f-11ec-9d12-4777fae47e2b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1638978971; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uDgmq3e5kxnaWyOpwcnlt0BHxsMjaRjGQqbPnSZ9GF0=;
	b=stH2mzWlG4CKR9NjdwiHUBQ+EoTU9Vz5DsGuKvtdNthKTam502EsC7Qd8vhmE0ECMBaWE9
	k8+DFhFUVj3fuO0TX0m41q9aap2m4w2qSi8UfMHvZubYPGTjAdbxzvJ6wsEoyqflim+GZl
	7lcaMyXhxFlZddaLyWpTP8tMTFmvapE=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>,
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v3 04/13] xen: include compat/platform.h from hypercall.h
Date: Wed,  8 Dec 2021 16:55:57 +0100
Message-Id: <20211208155606.20029-5-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20211208155606.20029-1-jgross@suse.com>
References: <20211208155606.20029-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The definition of compat_platform_op_t is in compat/platform.h
already, so include that file from hypercall.h instead of repeating
the typedef.

This allows to remove the related include statement from
arch/x86/x86_64/platform_hypercall.c.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
V3:
- new patch
---
 xen/arch/x86/x86_64/platform_hypercall.c | 1 -
 xen/include/xen/hypercall.h              | 4 +++-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/xen/arch/x86/x86_64/platform_hypercall.c b/xen/arch/x86/x86_64/platform_hypercall.c
index f84252bac6..7631058cce 100644
--- a/xen/arch/x86/x86_64/platform_hypercall.c
+++ b/xen/arch/x86/x86_64/platform_hypercall.c
@@ -6,7 +6,6 @@ EMIT_FILE;
 
 #include <xen/hypercall.h>
 #include <xen/lib.h>
-#include <compat/platform.h>
 
 #define xen_platform_op     compat_platform_op
 #define xen_platform_op_t   compat_platform_op_t
diff --git a/xen/include/xen/hypercall.h b/xen/include/xen/hypercall.h
index 9266bc86e9..459172f6a5 100644
--- a/xen/include/xen/hypercall.h
+++ b/xen/include/xen/hypercall.h
@@ -15,6 +15,9 @@
 #include <public/version.h>
 #include <public/pmu.h>
 #include <public/hvm/dm_op.h>
+#ifdef CONFIG_COMPAT
+#include <compat/platform.h>
+#endif
 #include <asm/hypercall.h>
 #include <xsm/xsm.h>
 
@@ -207,7 +210,6 @@ extern int compat_multicall(
 
 int compat_physdev_op(int cmd, XEN_GUEST_HANDLE_PARAM(void) arg);
 
-typedef struct compat_platform_op compat_platform_op_t;
 DEFINE_XEN_GUEST_HANDLE(compat_platform_op_t);
 int compat_platform_op(XEN_GUEST_HANDLE_PARAM(compat_platform_op_t) u_xenpf_op);
 
-- 
2.26.2


