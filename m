Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 45D064D2E29
	for <lists+xen-devel@lfdr.de>; Wed,  9 Mar 2022 12:35:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.287766.487950 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nRuaf-0003ph-6D; Wed, 09 Mar 2022 11:34:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 287766.487950; Wed, 09 Mar 2022 11:34:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nRuaf-0003nT-2f; Wed, 09 Mar 2022 11:34:49 +0000
Received: by outflank-mailman (input) for mailman id 287766;
 Wed, 09 Mar 2022 11:34:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=MORj=TU=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1nRuae-0003nN-61
 for xen-devel@lists.xenproject.org; Wed, 09 Mar 2022 11:34:48 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ec02f229-9f9c-11ec-8eba-a37418f5ba1a;
 Wed, 09 Mar 2022 12:34:46 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 4DA1B1F380;
 Wed,  9 Mar 2022 11:34:46 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 12BC413B71;
 Wed,  9 Mar 2022 11:34:46 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id cxVRA9aQKGLTZwAAMHmgww
 (envelope-from <jgross@suse.com>); Wed, 09 Mar 2022 11:34:46 +0000
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
X-Inumbo-ID: ec02f229-9f9c-11ec-8eba-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1646825686; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=EaW2Rn3nSwafRMyKlhwOnRqR+P68wtH+4aeBkRvz8RA=;
	b=N5HN3htVwOzb/U332tyS/LASi4PDOt1MCVcxqt/xBYte7ZjfWISiN5plg149//hnF02QP1
	ioAjM+CRAQGej01IpQyWYaSvOqk185Ex7eQAKBTC2T+0q3kiuSy0Jz1DL37dIL/0bd5b5a
	9PGwerIDcLWv/K20O9Mw3l70qf/OP0o=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [PATCH] xen/x86: drop dependency of XEN_SHSTK on EXPERT
Date: Wed,  9 Mar 2022 12:34:41 +0100
Message-Id: <20220309113441.22746-1-jgross@suse.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

XEN_SHSTK should be on per default now that it is supported officially.
Only let the prompt depend on EXPERT.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 xen/arch/x86/Kconfig | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/xen/arch/x86/Kconfig b/xen/arch/x86/Kconfig
index 83d0f317ec..c166db3499 100644
--- a/xen/arch/x86/Kconfig
+++ b/xen/arch/x86/Kconfig
@@ -117,8 +117,8 @@ config HVM
 	  If unsure, say Y.
 
 config XEN_SHSTK
-	bool "Supervisor Shadow Stacks (EXPERT)"
-	depends on HAS_AS_CET_SS && EXPERT
+	bool "Supervisor Shadow Stacks" if EXPERT
+	depends on HAS_AS_CET_SS
 	default y
 	---help---
 	  Control-flow Enforcement Technology (CET) is a set of features in
-- 
2.34.1


