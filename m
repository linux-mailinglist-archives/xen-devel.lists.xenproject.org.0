Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D42F87357B
	for <lists+xen-devel@lfdr.de>; Wed,  6 Mar 2024 12:17:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.689063.1073993 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rhpGJ-00035t-2j; Wed, 06 Mar 2024 11:16:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 689063.1073993; Wed, 06 Mar 2024 11:16:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rhpGI-00034M-VY; Wed, 06 Mar 2024 11:16:38 +0000
Received: by outflank-mailman (input) for mailman id 689063;
 Wed, 06 Mar 2024 11:16:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=frGc=KM=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1rhpGH-00034G-Po
 for xen-devel@lists.xenproject.org; Wed, 06 Mar 2024 11:16:37 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de
 [2a07:de40:b251:101:10:150:64:1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fec9580d-dbaa-11ee-afda-a90da7624cb6;
 Wed, 06 Mar 2024 12:16:36 +0100 (CET)
Received: from imap2.dmz-prg2.suse.org (imap2.dmz-prg2.suse.org [10.150.64.98])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 851D1224DB;
 Wed,  6 Mar 2024 11:16:34 +0000 (UTC)
Received: from imap2.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap2.dmz-prg2.suse.org (Postfix) with ESMTPS id 30C7313A79;
 Wed,  6 Mar 2024 11:16:34 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap2.dmz-prg2.suse.org with ESMTPSA id XCQbCpJQ6GWAPgAAn2gu4w
 (envelope-from <jgross@suse.com>); Wed, 06 Mar 2024 11:16:34 +0000
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
X-Inumbo-ID: fec9580d-dbaa-11ee-afda-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1709723795; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=HJD9NQU4GT2PqKcUt8lgFTWuNUHKLP/7bYpY6Dky8iA=;
	b=OqYSsFvurkbpWAFqzH0FyBXUazDIGmT4LZXc5muuobKIfBIh8diXII2tzqtIzLbjONDXj+
	1wVnydbjUOuaEQZ6YTr094Inve0EnFA6tuX/cstQLeUw6qypypd5VOaeX2/OV3Kjp/Ncbp
	21diHTJatA9zSylPLU2NdVT4v9vTv/o=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1709723794; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=HJD9NQU4GT2PqKcUt8lgFTWuNUHKLP/7bYpY6Dky8iA=;
	b=PBN16UXLfCAtRWwP6vyUdKibqBWh6xYB3aWdvnBkrBk9nGnjK26gPKx1vqpHhxE8hjg2yV
	iRuz53l0mcdNH2OLnAoLwDk3QKY2icy8B6AyVATXchKzrPnRTM804FloX0++Zf3CEJSLtY
	uc1uazISY58QixwwLMZh65uRWNlLxNM=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH] MAINTAINERS: add an entry for tools/9pfsd
Date: Wed,  6 Mar 2024 12:16:31 +0100
Message-Id: <20240306111631.1696-1-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Authentication-Results: smtp-out1.suse.de;
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
	 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,citrix.com:email];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 RCVD_TLS_ALL(0.00)[];
	 BAYES_HAM(-0.00)[31.20%]
X-Spam-Level: ****
X-Spam-Score: 4.90
X-Spam-Flag: NO

Add me as the maintainer for the tools/9pfsd directory.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 MAINTAINERS | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 076cf1e141..28fb35582b 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -206,6 +206,12 @@ Maintainers List (try to look for most precise areas first)
 
 		-----------------------------------
 
+9PFSD
+M:	Juergen Gross <jgross@suse.com>
+M:	Anthony PERARD <anthony.perard@citrix.com>
+S:	Supported
+F:	tools/9pfsd
+
 ACPI
 M:	Jan Beulich <jbeulich@suse.com>
 S:	Supported
-- 
2.35.3


