Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F7D6A610BF
	for <lists+xen-devel@lfdr.de>; Fri, 14 Mar 2025 13:19:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.914509.1320252 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tt3zx-0006yz-IM; Fri, 14 Mar 2025 12:18:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 914509.1320252; Fri, 14 Mar 2025 12:18:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tt3zx-0006wi-FE; Fri, 14 Mar 2025 12:18:45 +0000
Received: by outflank-mailman (input) for mailman id 914509;
 Fri, 14 Mar 2025 12:18:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=LNZA=WB=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1tt3zw-0006wN-Ty
 for xen-devel@lists.xenproject.org; Fri, 14 Mar 2025 12:18:44 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de
 [2a07:de40:b251:101:10:150:64:2])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 78891e83-00ce-11f0-9898-31a8f345e629;
 Fri, 14 Mar 2025 13:18:43 +0100 (CET)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 286EA1F388;
 Fri, 14 Mar 2025 12:18:43 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id D409013A31;
 Fri, 14 Mar 2025 12:18:42 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id cxtWMqIe1GfACwAAD6G6ig
 (envelope-from <jgross@suse.com>); Fri, 14 Mar 2025 12:18:42 +0000
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
X-Inumbo-ID: 78891e83-00ce-11f0-9898-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1741954723; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=esiwXzc9PHfQnKlTtqU8EK6xpW0IzUDROStSboRbjcA=;
	b=PziASxT6u3BrusL8wM3c5F5qjsbxCj0dJFabUju7ttCnp/Wn86H9m5MPHA36wOEze/RYtQ
	+qczIu+wNrVBLi7sTQR565wd4xPYVrRUR8plAtdcu4QqSnJWPsKZtSlGzfkz2bx2UeQ9pd
	EZ2ikLcVPXFg0wbMVzcAfu9/wbf59Ew=
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1741954723; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=esiwXzc9PHfQnKlTtqU8EK6xpW0IzUDROStSboRbjcA=;
	b=PziASxT6u3BrusL8wM3c5F5qjsbxCj0dJFabUju7ttCnp/Wn86H9m5MPHA36wOEze/RYtQ
	+qczIu+wNrVBLi7sTQR565wd4xPYVrRUR8plAtdcu4QqSnJWPsKZtSlGzfkz2bx2UeQ9pd
	EZ2ikLcVPXFg0wbMVzcAfu9/wbf59Ew=
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
Subject: [PATCH v9 1/3] docs: update xenstore migration stream definition
Date: Fri, 14 Mar 2025 13:18:33 +0100
Message-ID: <20250314121835.1879-2-jgross@suse.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250314121835.1879-1-jgross@suse.com>
References: <20250314121835.1879-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.com:email,suse.com:mid];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Score: -2.80
X-Spam-Flag: NO

In order to close a race window for Xenstore live update when using
the new unique_id of domains, the migration stream needs to contain
this unique_id for each domain known by Xenstore.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
V8:
- new patch
V9:
- instead of using an offset, use a flag for unique_id presence
  (Julien Grall)
---
 docs/designs/xenstore-migration.md | 18 +++++++++++++++++-
 1 file changed, 17 insertions(+), 1 deletion(-)

diff --git a/docs/designs/xenstore-migration.md b/docs/designs/xenstore-migration.md
index 082314bf72..a0acd76ce1 100644
--- a/docs/designs/xenstore-migration.md
+++ b/docs/designs/xenstore-migration.md
@@ -156,7 +156,7 @@ the domain being migrated.
 ```
     0       1       2       3       4       5       6       7    octet
 +-------+-------+-------+-------+-------+-------+-------+-------+
-| conn-id                       | conn-type     |               |
+| conn-id                       | conn-type     | fields        |
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
 
 
@@ -178,6 +181,16 @@ the domain being migrated.
 |                | 0x0001: socket                               |
 |                | 0x0002 - 0xFFFF: reserved for future use     |
 |                |                                              |
+| `fields`       | A collection of flags indicating presence    |
+|                | of additional fields after the variable      |
+|                | length `data` part. The additional fields    |
+|                | will start after a possible padding for      |
+|                | aligning to a 8 octet boundary.              |
+|                | Defined flag values (to be or-ed):           |
+|                | 0x0001: `unique_id` present (only needed for |
+|                |         `shared ring` connection in live     |
+|                |         update streams).                     |
+|                |                                              |
 | `conn-spec`    | See below                                    |
 |                |                                              |
 | `in-data-len`  | The length (in octets) of any data read      |
@@ -193,6 +206,9 @@ the domain being migrated.
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


