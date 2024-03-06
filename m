Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 89758873592
	for <lists+xen-devel@lfdr.de>; Wed,  6 Mar 2024 12:27:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.689077.1074032 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rhpR0-0006yS-Kx; Wed, 06 Mar 2024 11:27:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 689077.1074032; Wed, 06 Mar 2024 11:27:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rhpR0-0006wQ-I2; Wed, 06 Mar 2024 11:27:42 +0000
Received: by outflank-mailman (input) for mailman id 689077;
 Wed, 06 Mar 2024 11:27:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=frGc=KM=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1rhpQz-0006wK-Cx
 for xen-devel@lists.xenproject.org; Wed, 06 Mar 2024 11:27:41 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 89ff522e-dbac-11ee-a1ee-f123f15fe8a2;
 Wed, 06 Mar 2024 12:27:39 +0100 (CET)
Received: from imap2.dmz-prg2.suse.org (imap2.dmz-prg2.suse.org [10.150.64.98])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id B994268904;
 Wed,  6 Mar 2024 11:27:38 +0000 (UTC)
Received: from imap2.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap2.dmz-prg2.suse.org (Postfix) with ESMTPS id 6A66513A79;
 Wed,  6 Mar 2024 11:27:38 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap2.dmz-prg2.suse.org with ESMTPSA id p213GCpT6GXYQAAAn2gu4w
 (envelope-from <jgross@suse.com>); Wed, 06 Mar 2024 11:27:38 +0000
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
X-Inumbo-ID: 89ff522e-dbac-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1709724458; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=2tOUi2pLz/KlGD5TleWt7y59TdOBtrIZ9jq3gi4MeVc=;
	b=pIptgjxxz/NnxZ8pRCxuuzy8so1oZCfimeSzYbLfw6xs+dnGpPVezMVbsjoCYzI8h7LtDn
	cY8kEqANnDI+BeW6oDqVgU6N9Vmr64zQaQRpSkJevtjrWhVf4dP0XlYOAxHL7DtmZpLwzu
	udjudf/zdX6ejcdiEH2eSyaaddbsf6g=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1709724458; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=2tOUi2pLz/KlGD5TleWt7y59TdOBtrIZ9jq3gi4MeVc=;
	b=pIptgjxxz/NnxZ8pRCxuuzy8so1oZCfimeSzYbLfw6xs+dnGpPVezMVbsjoCYzI8h7LtDn
	cY8kEqANnDI+BeW6oDqVgU6N9Vmr64zQaQRpSkJevtjrWhVf4dP0XlYOAxHL7DtmZpLwzu
	udjudf/zdX6ejcdiEH2eSyaaddbsf6g=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH] SUPPORT.md: add xen-9pfsd
Date: Wed,  6 Mar 2024 12:27:36 +0100
Message-Id: <20240306112736.2546-1-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Authentication-Results: smtp-out2.suse.de;
	none
X-Spamd-Result: default: False [4.90 / 50.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 FROM_HAS_DN(0.00)[];
	 TO_DN_SOME(0.00)[];
	 R_MISSING_CHARSET(2.50)[];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 MIME_GOOD(-0.10)[text/plain];
	 BROKEN_CONTENT_TYPE(1.50)[];
	 RCVD_COUNT_THREE(0.00)[3];
	 DKIM_SIGNED(0.00)[suse.com:s=susede1];
	 RCPT_COUNT_SEVEN(0.00)[8];
	 MID_CONTAINS_FROM(1.00)[];
	 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 RCVD_TLS_ALL(0.00)[];
	 BAYES_HAM(-0.00)[39.12%]
X-Spam-Level: ****
X-Spam-Score: 4.90
X-Spam-Flag: NO

Add a support statement for the new xen-9pfsd backend. Set it to
"Experimental", as some functionality for Linux guests is missing
(only tested to work with Xenstore-stubdom).

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 SUPPORT.md | 1 +
 1 file changed, 1 insertion(+)

diff --git a/SUPPORT.md b/SUPPORT.md
index a90d1108c9..8d21bc7945 100644
--- a/SUPPORT.md
+++ b/SUPPORT.md
@@ -664,6 +664,7 @@ there is currently no xl support.
 ### PV 9pfs (backend)
 
     Status, QEMU: Tech Preview
+    Status, xen-9pfsd: Experimental
 
 ### PVCalls (backend)
 
-- 
2.35.3


