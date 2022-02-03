Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A50F44A84F2
	for <lists+xen-devel@lfdr.de>; Thu,  3 Feb 2022 14:15:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.264731.457944 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nFbwR-0004yI-Gb; Thu, 03 Feb 2022 13:14:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 264731.457944; Thu, 03 Feb 2022 13:14:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nFbwR-0004tg-Bw; Thu, 03 Feb 2022 13:14:27 +0000
Received: by outflank-mailman (input) for mailman id 264731;
 Thu, 03 Feb 2022 13:14:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=nHU3=SS=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1nFbwQ-0004qx-Fk
 for xen-devel@lists.xenproject.org; Thu, 03 Feb 2022 13:14:26 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 290c58fa-84f3-11ec-8f75-fffcc8bd4f1a;
 Thu, 03 Feb 2022 14:14:04 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 55D051F440;
 Thu,  3 Feb 2022 13:14:24 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 1D5E913BC0;
 Thu,  3 Feb 2022 13:14:24 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id wDcMBjDV+2GZMQAAMHmgww
 (envelope-from <jgross@suse.com>); Thu, 03 Feb 2022 13:14:24 +0000
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
X-Inumbo-ID: 290c58fa-84f3-11ec-8f75-fffcc8bd4f1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1643894064; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=g+iDuOt8GAh3oeLO+lSu1uVXdxYbj9ZBe5nrAfLFutA=;
	b=H/w7s193JJpQkRZ5WNy37uQatu4tFWBkGTrdAEZmkWA1kenxfW1iy3qxlbSELOCnZ/xu+2
	qb0aYbUad/eRngcBEtS/CuGaERso/q3ZVbEwSTIxfX4t4wSTrNQJ0aI+58v6QGEY/Wg1bo
	4uomzOVlQl6c5LBjXRvCpPBBgu0zb5A=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v2 2/2] xen/include/public: deprecate GNTTABOP_transfer
Date: Thu,  3 Feb 2022 14:14:18 +0100
Message-Id: <20220203131418.1319-2-jgross@suse.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220203131418.1319-1-jgross@suse.com>
References: <20220203131418.1319-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a comment to include/public/grant_table.h that GNTTABOP_transfer
is deprecated, in order to discourage new use cases.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
v2:
- new patch
---
 xen/include/public/grant_table.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/xen/include/public/grant_table.h b/xen/include/public/grant_table.h
index 7934d7b718..7fbd1c6d10 100644
--- a/xen/include/public/grant_table.h
+++ b/xen/include/public/grant_table.h
@@ -417,6 +417,8 @@ DEFINE_XEN_GUEST_HANDLE(gnttab_dump_table_t);
  * GNTTABOP_transfer: Transfer <frame> to a foreign domain. The foreign domain
  * has previously registered its interest in the transfer via <domid, ref>.
  *
+ * This operation is deprecated! Please don't add new use cases!
+ *
  * Note that, even if the transfer fails, the specified page no longer belongs
  * to the calling domain *unless* the error is GNTST_bad_page.
  *
-- 
2.34.1


