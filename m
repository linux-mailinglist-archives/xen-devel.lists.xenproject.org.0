Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 52D4E5AD302
	for <lists+xen-devel@lfdr.de>; Mon,  5 Sep 2022 14:48:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.398803.639784 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVBW6-0001IV-Nq; Mon, 05 Sep 2022 12:47:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 398803.639784; Mon, 05 Sep 2022 12:47:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVBW6-00018e-Hi; Mon, 05 Sep 2022 12:47:54 +0000
Received: by outflank-mailman (input) for mailman id 398803;
 Mon, 05 Sep 2022 12:47:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=XgUS=ZI=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1oVBW4-0000jq-Uc
 for xen-devel@lists.xenproject.org; Mon, 05 Sep 2022 12:47:53 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f3785bfc-2d18-11ed-af93-0125da4c0113;
 Mon, 05 Sep 2022 14:47:50 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 76AE8388A4;
 Mon,  5 Sep 2022 12:47:50 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 3C18513A66;
 Mon,  5 Sep 2022 12:47:50 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 4DyADfbvFWO1DAAAMHmgww
 (envelope-from <jgross@suse.com>); Mon, 05 Sep 2022 12:47:50 +0000
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
X-Inumbo-ID: f3785bfc-2d18-11ed-af93-0125da4c0113
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1662382070; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VlJ/HKfnDfMr+Qyu9LFLpf4AfrG79Ga4xwdEyjPTosw=;
	b=j7Ae712dtB3caWIdV+8Zumb/9QfV01+4kmqe968UZlkyj4mD5k3mOyZyNbouu0PldNByAe
	HVmJ411vtQlzmvAwV6XXPTZG9zD2QisJ2IXoPCx90NFGHzS8wyu/a+bOW735PcndUcUaCf
	zbxJB/LdYI0E0y9QTZ4F/jpLhQt/W9k=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Henry.Wang@arm.com,
	Juergen Gross <jgross@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v4 4/4] tools/xenstore: add migration stream extensions for new features
Date: Mon,  5 Sep 2022 14:47:46 +0200
Message-Id: <20220905124746.1975-5-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220905124746.1975-1-jgross@suse.com>
References: <20220905124746.1975-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Extend the definition of the Xenstore migration stream to cover new
features:

- per domain features
- extended watches (watch depth)
- per domain quota

Signed-off-by: Juergen Gross <jgross@suse.com>
---
V3:
- new patch
V4:
- add new record types instead of modifying the existing ones
  (Julien Grall)
---
 docs/designs/xenstore-migration.md | 160 ++++++++++++++++++++++++++++-
 1 file changed, 155 insertions(+), 5 deletions(-)

diff --git a/docs/designs/xenstore-migration.md b/docs/designs/xenstore-migration.md
index efa526f420..c70505c43a 100644
--- a/docs/designs/xenstore-migration.md
+++ b/docs/designs/xenstore-migration.md
@@ -43,7 +43,14 @@ the setting of the endianness bit.
 |-----------|---------------------------------------------------|
 | `ident`   | 0x78656e73746f7265 ('xenstore' in ASCII)          |
 |           |                                                   |
-| `version` | 0x00000001 (the version of the specification)     |
+| `version` | The version of the specification, defined values: |
+|           | 0x00000001: all fields and records without any    |
+|           |             explicitly mentioned version          |
+|           |             dependency are valid.                 |
+|           | 0x00000002: all fields and records valid for      |
+|           |             version 1 plus fields and records     |
+|           |             explicitly stated to be supported in  |
+|           |             version 2 are valid.                  |
 |           |                                                   |
 | `flags`   | 0 (LSB): Endianness: 0 = little, 1 = big          |
 |           |                                                   |
@@ -77,7 +84,10 @@ NOTE: padding octets here and in all subsequent format specifications must be
 |        | 0x00000003: WATCH_DATA                               |
 |        | 0x00000004: TRANSACTION_DATA                         |
 |        | 0x00000005: NODE_DATA                                |
-|        | 0x00000006 - 0xFFFFFFFF: reserved for future use     |
+|        | 0x00000006: GLOBAL_QUOTA_DATA                        |
+|        | 0x00000007: DOMAIN_DATA                              |
+|        | 0x00000008: WATCH_DATA_EXTENDED (version 2 and up)   |
+|        | 0x00000009 - 0xFFFFFFFF: reserved for future use     |
 |        |                                                      |
 | `len`  | The length (in octets) of `body`                     |
 |        |                                                      |
@@ -129,6 +139,7 @@ xenstored state that needs to be restored.
 | `evtchn-fd`    | The file descriptor used to communicate with |
 |                | the event channel driver                     |
 
+
 xenstored will resume in the original process context. Hence `rw-socket-fd`
 simply specifies the file descriptor of the socket. Sockets are not always
 used, however, and so -1 will be used to denote an unused socket.
@@ -241,9 +252,9 @@ the file descriptor of the socket connection.
 
 ### WATCH_DATA
 
-The image format will contain a `WATCH_DATA` record for each watch registered
-by a connection for which there is `CONNECTION_DATA` record previously present.
-
+The image format will contain either a `WATCH_DATA` or a `WATCH_DATA_EXTENDED`
+record for each watch registered by a connection for which there is
+`CONNECTION_DATA` record previously present.
 
 ```
     0       1       2       3    octet
@@ -406,6 +417,145 @@ A node permission specifier has the following format:
 Note that perm1 defines the domain owning the node. See [4] for more
 explanation of node permissions.
 
+\pagebreak
+
+### GLOBAL_QUOTA_DATA
+
+This record is only relevant for live update. It contains the global settings
+of xenstored quota.
+
+```
+    0       1       2       3    octet
++-------+-------+-------+-------+
+| n-dom-quota   | n-glob-quota  |
++---------------+---------------+
+| quota-val 1                   |
++-------------------------------+
+...
++-------------------------------+
+| quota-val N                   |
++-------------------------------+
+| quota-names
+...
+```
+
+
+| Field          | Description                                  |
+|----------------|----------------------------------------------|
+| `n-dom-quota`  | Number of quota values which apply per       |
+|                | domain.                                      |
+|                |                                              |
+| `n-glob-quota` | Number of quota values which apply globally  |
+|                | only.                                        |
+|                |                                              |
+| `quota-val`    | Quota values, first the ones applying per    |
+|                | domain, then the ones applying globally. A   |
+|                | value of 0 has the semantics of "unlimited". |
+|                |                                              |
+| `quota-names`  | 0 delimited strings of the quota names in    |
+|                | the same sequence as the `quota-val` values. |
+
+
+Allowed quota names are those explicitly named in [2] for the `GET_QUOTA`
+and `SET_QUOTA` commands, plus implementation specific ones. Quota names not
+recognized by the receiving side must be ignored.
+
+\pagebreak
+
+### DOMAIN_DATA
+
+This record is optional and can be present once for each domain.
+
+
+```
+    0       1       2       3     octet
++-------+-------+-------+-------+
+| domain-id     | n-quota       |
++---------------+---------------+
+| features                      |
++-------------------------------+
+| quota-val 1                   |
++-------------------------------+
+...
++-------------------------------+
+| quota-val N                   |
++-------------------------------+
+| quota-names
+...
+```
+
+
+| Field          | Description                                  |
+|----------------|----------------------------------------------|
+| `domain-id`    | The domain-id of the domain this record      |
+|                | belongs to.                                  |
+|                |                                              |
+| `n-quota`      | Number of quota values.                      |
+|                |                                              |
+| `features`     | Value of the feature field visible by the    |
+|                | guest at offset 2064 of the ring page.       |
+|                | Aligned to the next 4 octet boundary.        |
+|                | Only valid for version 2 and later.          |
+|                |                                              |
+| `quota-val`    | Quota values, a value of 0 has the semantics |
+|                | "unlimited".                                 |
+|                |                                              |
+| `quota-names`  | 0 delimited strings of the quota names in    |
+|                | the same sequence as the `quota-val` values. |
+
+Allowed quota names are those explicitly named in [2] for the `GET_QUOTA`
+and `SET_QUOTA` commands, plus implementation specific ones. Quota names not
+recognized by the receiving side must be ignored.
+
+\pagebreak
+
+### WATCH_DATA_EXTENDED
+
+The image format will contain either a `WATCH_DATA` or a `WATCH_DATA_EXTENDED`
+record for each watch registered by a connection for which there is
+`CONNECTION_DATA` record previously present. The `WATCH_DATA_EXTENDED` record
+type is valid only in version 2 and later.
+
+```
+    0       1       2       3    octet
++-------+-------+-------+-------+
+| conn-id                       |
++---------------+---------------+
+| wpath-len     | token-len     |
++---------------+---------------+
+| depth         |               |
++---------------+---------------+
+| wpath
+...
+| token
+...
+```
+
+
+| Field       | Description                                     |
+|-------------|-------------------------------------------------|
+| `conn-id`   | The connection that issued the `WATCH`          |
+|             | operation [2]                                   |
+|             |                                                 |
+| `wpath-len` | The length (in octets) of `wpath` including the |
+|             | NUL terminator                                  |
+|             |                                                 |
+| `token-len` | The length (in octets) of `token` including the |
+|             | NUL terminator                                  |
+|             |                                                 |
+| `depth`     | The number of directory levels below the        |
+|             | watched path to consider for a match.           |
+|             | A value of 0xffff is used for unlimited depth.  |
+|             |                                                 |
+| `wpath`     | The watch path, as specified in the `WATCH`     |
+|             | operation                                       |
+|             |                                                 |
+| `token`     | The watch identifier token, as specified in the |
+|             | `WATCH` operation                               |
+
+\pagebreak
+
+
 * * *
 
 [1] See https://xenbits.xen.org/gitweb/?p=xen.git;a=blob;f=docs/designs/non-cooperative-migration.md
-- 
2.35.3


