Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F9B44BD9BB
	for <lists+xen-devel@lfdr.de>; Mon, 21 Feb 2022 13:43:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.276265.472377 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nM81J-0003sl-Vs; Mon, 21 Feb 2022 12:42:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 276265.472377; Mon, 21 Feb 2022 12:42:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nM81J-0003qv-Sd; Mon, 21 Feb 2022 12:42:25 +0000
Received: by outflank-mailman (input) for mailman id 276265;
 Mon, 21 Feb 2022 12:42:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=tDfV=TE=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1nM81J-0003qp-1V
 for xen-devel@lists.xenproject.org; Mon, 21 Feb 2022 12:42:25 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b78a7eeb-9313-11ec-8539-5f4723681683;
 Mon, 21 Feb 2022 13:42:23 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 0A06F21129;
 Mon, 21 Feb 2022 12:42:23 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id B822413AC3;
 Mon, 21 Feb 2022 12:42:22 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id xmyHK66IE2KGawAAMHmgww
 (envelope-from <jgross@suse.com>); Mon, 21 Feb 2022 12:42:22 +0000
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
X-Inumbo-ID: b78a7eeb-9313-11ec-8539-5f4723681683
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1645447343; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=s5Ju/wj4WZBBr1h9srFDpm+oLA9XY5iSYL7QmbanTmQ=;
	b=cnaBYxgLooyCQggVuLUms0pmbYofbYEuILXoLP4NSurvgbTEGQTdxVjF+/5jqfsOFetbxF
	VJjD6XSpwUWDfIaN++T17mLPuTdkMKBMjqn0TW+U3xBSe0JKUirKgaMjPJUzvMxvm9uaVM
	h9+oxdeNH17E9VlTznRQkGJAZzPpPvk=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH] xen/include/public: add macro for invalid grant reference
Date: Mon, 21 Feb 2022 13:42:21 +0100
Message-Id: <20220221124221.10245-1-jgross@suse.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Providing a macro for an invalid grant reference would be beneficial
for users, especially as some are using the wrong value "0" for that
purpose.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 xen/include/public/grant_table.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/xen/include/public/grant_table.h b/xen/include/public/grant_table.h
index 7fbd1c6d10..af00aacfd3 100644
--- a/xen/include/public/grant_table.h
+++ b/xen/include/public/grant_table.h
@@ -113,6 +113,8 @@
  */
 typedef uint32_t grant_ref_t;
 
+#define XEN_GRANT_REF_INVALID  ~0U
+
 /*
  * A grant table comprises a packed array of grant entries in one or more
  * page frames shared between Xen and a guest.
-- 
2.34.1


