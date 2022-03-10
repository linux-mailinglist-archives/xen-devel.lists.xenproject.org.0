Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B9C514D41E3
	for <lists+xen-devel@lfdr.de>; Thu, 10 Mar 2022 08:34:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.288154.488658 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nSDJf-0001cj-FB; Thu, 10 Mar 2022 07:34:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 288154.488658; Thu, 10 Mar 2022 07:34:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nSDJf-0001TT-1Y; Thu, 10 Mar 2022 07:34:31 +0000
Received: by outflank-mailman (input) for mailman id 288154;
 Thu, 10 Mar 2022 07:34:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=QHx9=TV=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1nSDJc-0000ZP-0K
 for xen-devel@lists.xenproject.org; Thu, 10 Mar 2022 07:34:28 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8127106d-a044-11ec-8539-5f4723681683;
 Thu, 10 Mar 2022 08:34:22 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 43FA81F449;
 Thu, 10 Mar 2022 07:34:26 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 06A5713FA3;
 Thu, 10 Mar 2022 07:34:26 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id IBpcAAKqKWIkIAAAMHmgww
 (envelope-from <jgross@suse.com>); Thu, 10 Mar 2022 07:34:26 +0000
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
X-Inumbo-ID: 8127106d-a044-11ec-8539-5f4723681683
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1646897666; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IfItSZSW0o2H4xQgtklqjsDZtwba90rKZ+jpu4SrJ+k=;
	b=bwX/wwPLDXizevHSvyvYUqd3Q6vxqhy4TKLY7SIiCmojlNVRup3Vx7kZsA445mROLAAOot
	due1yHXGaln/jlbRCChInS8KOt9h98MiODFgi1oc/Euc/Q3GLt9MisnnJx/Let3SifEMrh
	rcyRPrm84Y1DKyNf9mKlj3CAAQwG7lo=
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
Subject: [PATCH v4 06/11] xen: include compat/platform.h from hypercall.h
Date: Thu, 10 Mar 2022 08:34:15 +0100
Message-Id: <20220310073420.15622-7-jgross@suse.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220310073420.15622-1-jgross@suse.com>
References: <20220310073420.15622-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The definition of compat_platform_op_t is in compat/platform.h
already, so include that file from hypercall.h instead of repeating
the typedef.

This allows to remove the related include statement from
arch/x86/x86_64/platform_hypercall.c.

Signed-off-by: Juergen Gross <jgross@suse.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
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
index a032ba2b4a..ca8ee22717 100644
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
 
@@ -206,7 +209,6 @@ extern int cf_check compat_multicall(
 
 int compat_physdev_op(int cmd, XEN_GUEST_HANDLE_PARAM(void) arg);
 
-typedef struct compat_platform_op compat_platform_op_t;
 DEFINE_XEN_GUEST_HANDLE(compat_platform_op_t);
 int compat_platform_op(XEN_GUEST_HANDLE_PARAM(compat_platform_op_t) u_xenpf_op);
 
-- 
2.34.1


