Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EF6BA2704E
	for <lists+xen-devel@lfdr.de>; Tue,  4 Feb 2025 12:35:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.881304.1291470 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tfHCg-0004Iu-Ai; Tue, 04 Feb 2025 11:34:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 881304.1291470; Tue, 04 Feb 2025 11:34:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tfHCg-0004G3-3N; Tue, 04 Feb 2025 11:34:54 +0000
Received: by outflank-mailman (input) for mailman id 881304;
 Tue, 04 Feb 2025 11:34:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ljwx=U3=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1tfHCe-0001MV-SQ
 for xen-devel@lists.xenproject.org; Tue, 04 Feb 2025 11:34:52 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0c031339-e2ec-11ef-99a4-01e77a169b0f;
 Tue, 04 Feb 2025 12:34:51 +0100 (CET)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 1EFAA1F365;
 Tue,  4 Feb 2025 11:34:51 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id BFEA21393E;
 Tue,  4 Feb 2025 11:34:50 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id nZgzLVr7oWfkLAAAD6G6ig
 (envelope-from <jgross@suse.com>); Tue, 04 Feb 2025 11:34:50 +0000
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
X-Inumbo-ID: 0c031339-e2ec-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1738668891; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=37fznkDcGt+q/sjDqcz4APQb1LMs6/0bVng6K5DZunQ=;
	b=fWdITqy/+xejRu/M+E6bxgohOlNgXwbnsx9wO39cD5MiaDEL0cN5tJqTBDEwliepv8fbxn
	Z8utEIKOqsoQ8D6FfD/Sxdxk2/FD0mMp6WtGXuTx7hTFFghpEU6Pj3qG/goac/0Bclzvkz
	f1tzf72yDi7Bz9nkKuXVXiXy00Q4rus=
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1738668891; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=37fznkDcGt+q/sjDqcz4APQb1LMs6/0bVng6K5DZunQ=;
	b=fWdITqy/+xejRu/M+E6bxgohOlNgXwbnsx9wO39cD5MiaDEL0cN5tJqTBDEwliepv8fbxn
	Z8utEIKOqsoQ8D6FfD/Sxdxk2/FD0mMp6WtGXuTx7hTFFghpEU6Pj3qG/goac/0Bclzvkz
	f1tzf72yDi7Bz9nkKuXVXiXy00Q4rus=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v8 7/9] docs: update xenstore migration stream definition
Date: Tue,  4 Feb 2025 12:34:05 +0100
Message-ID: <20250204113407.16839-8-jgross@suse.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250204113407.16839-1-jgross@suse.com>
References: <20250204113407.16839-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Score: -2.80
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:mid,suse.com:email,imap1.dmz-prg2.suse.org:helo];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Flag: NO
X-Spam-Level: 

In order to close a race window for Xenstore live update when using
the new unique_id of domains, the migration stream needs to contain
this unique_id for each domain known by Xenstore.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
V8:
- new patch
---
 docs/designs/xenstore-migration.md | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/docs/designs/xenstore-migration.md b/docs/designs/xenstore-migration.md
index 082314bf72..fba691ee0d 100644
--- a/docs/designs/xenstore-migration.md
+++ b/docs/designs/xenstore-migration.md
@@ -156,7 +156,7 @@ the domain being migrated.
 ```
     0       1       2       3       4       5       6       7    octet
 +-------+-------+-------+-------+-------+-------+-------+-------+
-| conn-id                       | conn-type     |               |
+| conn-id                       | conn-type     | uniq-id-off   |
 +-------------------------------+---------------+---------------+
 | conn-spec
 ...
@@ -165,6 +165,9 @@ the domain being migrated.
 +---------------+---------------+-------------------------------+
 | data
 ...
++---------------------------------------------------------------+
+| unique-id                                                     |
++---------------------------------------------------------------+
 ```
 
 
@@ -178,6 +181,12 @@ the domain being migrated.
 |                | 0x0001: socket                               |
 |                | 0x0002 - 0xFFFF: reserved for future use     |
 |                |                                              |
+| `uniq-id-off`  | The offset (in octets) of the `unique-id`    |
+|                | field from the start of the record body.     |
+|                | If 0, no `unique-id` field is present.       |
+|                | Only needed for `shared ring` connection in  |
+|                | live update streams.                         |
+|                |                                              |
 | `conn-spec`    | See below                                    |
 |                |                                              |
 | `in-data-len`  | The length (in octets) of any data read      |
@@ -193,6 +202,9 @@ the domain being migrated.
 | `data`         | Pending data: first in-data-len octets of    |
 |                | read data, then out-data-len octets of       |
 |                | written data (any of both may be empty)      |
+|                |                                              |
+| `unique-id`    | Unique identifier of a domain                |
+|                |                                              |
 
 In case of live update the connection record for the connection via which
 the live update command was issued will contain the response for the live
-- 
2.43.0


