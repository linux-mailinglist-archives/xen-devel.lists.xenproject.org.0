Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3611E6184D6
	for <lists+xen-devel@lfdr.de>; Thu,  3 Nov 2022 17:38:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.436879.691070 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oqdCo-0007nG-01; Thu, 03 Nov 2022 16:36:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 436879.691070; Thu, 03 Nov 2022 16:36:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oqdCn-0007kF-Td; Thu, 03 Nov 2022 16:36:37 +0000
Received: by outflank-mailman (input) for mailman id 436879;
 Thu, 03 Nov 2022 16:36:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=2XF3=3D=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1oqdCl-0007k8-UH
 for xen-devel@lists.xenproject.org; Thu, 03 Nov 2022 16:36:35 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ad908be4-5b95-11ed-91b5-6bf2151ebd3b;
 Thu, 03 Nov 2022 17:36:34 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 8A1CA1F385;
 Thu,  3 Nov 2022 16:36:33 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 3EA7213480;
 Thu,  3 Nov 2022 16:36:33 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id BTUmDRHuY2NdSAAAMHmgww
 (envelope-from <jgross@suse.com>); Thu, 03 Nov 2022 16:36:33 +0000
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
X-Inumbo-ID: ad908be4-5b95-11ed-91b5-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1667493393; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=N8W4oIeALHkDkc0s+2qqiC97IZ8xBjyHM6ZTLQ6KBMQ=;
	b=m+e4pIr7U1jmpOa9v53WsjZG5ot6rqm9m/CUraOhoWrv5DnAW1oMk5PYFF3DEkwmB25rY9
	uZzC8NUyEz1LPuYM7mJPEZXEKDLRmpkUJayONEyKFrkC0M7FeRkig2CytY84o80gs0+4pt
	jQzpbP2VF0D7By95XbveBatqDk+/Lgw=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>,
	Henry Wang <Henry.Wang@arm.com>
Subject: [PATCH-for-4.17] xen: fix generated code for calling hypercall handlers
Date: Thu,  3 Nov 2022 17:36:31 +0100
Message-Id: <20221103163631.13145-1-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The code generated for the call_handlers_*() macros needs to avoid
undefined behavior when multiple handlers share the same priority.
The issue is the hypercall number being unverified fed into the macros
and then used to set a mask via "mask = 1ULL << <hypercall-number>".

Avoid a shift amount of more than 63 by setting mask to zero in case
the hypercall number is too large.

Fixes: eca1f00d0227 ("xen: generate hypercall interface related code")
Signed-off-by: Juergen Gross <jgross@suse.com>
---
 xen/scripts/gen_hypercall.awk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/scripts/gen_hypercall.awk b/xen/scripts/gen_hypercall.awk
index 34840c514f..08b2f70bdb 100644
--- a/xen/scripts/gen_hypercall.awk
+++ b/xen/scripts/gen_hypercall.awk
@@ -263,7 +263,7 @@ END {
         printf("#define call_handlers_%s(num, ret, a1, a2, a3, a4, a5) \\\n", ca);
         printf("({ \\\n");
         if (need_mask)
-            printf("    uint64_t mask = 1ULL << num; \\\n");
+            printf("    uint64_t mask = (num > 63) ? 0 : 1ULL << num; \\\n");
         printf("    ");
         for (pl = 1; pl <= n_prios[ca]; pl++) {
             if (prios[ca, p_list[pl]] > 1) {
-- 
2.35.3


