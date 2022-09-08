Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D3CA5B16B3
	for <lists+xen-devel@lfdr.de>; Thu,  8 Sep 2022 10:16:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.402816.644697 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oWChd-0002Wa-On; Thu, 08 Sep 2022 08:16:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 402816.644697; Thu, 08 Sep 2022 08:16:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oWChd-0002UZ-LZ; Thu, 08 Sep 2022 08:16:01 +0000
Received: by outflank-mailman (input) for mailman id 402816;
 Thu, 08 Sep 2022 08:16:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=wZDO=ZL=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1oWChc-0002UT-6R
 for xen-devel@lists.xenproject.org; Thu, 08 Sep 2022 08:16:00 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [2001:67c:2178:6::1d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 776fceab-2f4e-11ed-a31c-8f8a9ae3403f;
 Thu, 08 Sep 2022 10:15:58 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 4ED69209E6;
 Thu,  8 Sep 2022 08:15:57 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 117F21322C;
 Thu,  8 Sep 2022 08:15:57 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id JhsAA72kGWMFJgAAMHmgww
 (envelope-from <jgross@suse.com>); Thu, 08 Sep 2022 08:15:57 +0000
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
X-Inumbo-ID: 776fceab-2f4e-11ed-a31c-8f8a9ae3403f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1662624957; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=VutynQ6XmRpsSDcF0eovDd0AQCocI4CKzQ/c4tYO0nc=;
	b=qnPTcSEFgIYj9/edz6qzXIFvh7Y7yFGg7DDOaQmhhaQPD8h2Rjr/hMgoWBJMJQi3PG8zwP
	Vo3xZWV7VOG4+d8ZI82GH0IZQeDdWrbWr7rzJJcWj463GORxohnnYHjMCPguMk9Pk3KAoj
	vCQ23hd+QVGJEJ99k0QRy5GMQCJJJx8=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v5] tools/xenstore: add migration stream extensions for new features
Date: Thu,  8 Sep 2022 10:15:52 +0200
Message-Id: <20220908081552.19889-1-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Extend the definition of the Xenstore migration stream to cover new
features:

- per domain features
- extended watches (watch depth)
- per domain quota

Some of those additions (per domain features and extended watches)
require bumping the migration stream version to "2", as usage of those
features will require to transport mandatory new information in the
migration stream.

One note regarding the GLOBAL_QUOTA_DATA record: the split of quota
between global and per-domain ones is meant to support the possibility
to pass on unknown quota settings for newly created domains to other
Xenstore instances:

Imagine Xenstore A knows about global quota g and domain quota d, while
Xenstore B doesn't know both. Initially I'm running Xenstore A on a
host, then I'm live-updating to B.

B gets the information that g is global, and d is per-domain, but has
no other idea what to do with the values of g and d. OTOH it knows that
each new domain should get d with the related value, so it can set d
for each newly created domain.

When B is either downgraded to A again, or a domain is migrated to
another host running A, B can add the quota information of d for all
domains.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
V3:
- new patch
V4:
- add new record types instead of modifying the existing ones
  (Julien Grall)
V5:
- addressed comments of Julien Grall
---
 docs/designs/xenstore-migration.md | 165 +++++++++++++++++++++++++++--
 1 file changed, 159 insertions(+), 6 deletions(-)

diff --git a/docs/designs/xenstore-migration.md b/docs/designs/xenstore-migration.md
index efa526f420..5022268386 100644
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
@@ -65,8 +72,9 @@ Records immediately follow the header and have the following format:
 +-------+-------------------------------------------------------+
 ```
 
-NOTE: padding octets here and in all subsequent format specifications must be
-      written as zero and should be ignored when the stream is read.
+NOTE: padding octets or fields not valid in the used version here and in all
+      subsequent format specifications must be written as zero and should be
+      ignored when the stream is read.
 
 
 | Field  | Description                                          |
@@ -77,7 +85,10 @@ NOTE: padding octets here and in all subsequent format specifications must be
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
@@ -241,9 +252,49 @@ the file descriptor of the socket connection.
 
 ### WATCH_DATA
 
-The image format will contain a `WATCH_DATA` record for each watch registered
-by a connection for which there is `CONNECTION_DATA` record previously present.
+The image format will contain either a `WATCH_DATA` or a `WATCH_DATA_EXTENDED`
+record for each watch registered by a connection for which there is
+`CONNECTION_DATA` record previously present.
 
+```
+    0       1       2       3    octet
++-------+-------+-------+-------+
+| conn-id                       |
++---------------+---------------+
+| wpath-len     | token-len     |
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
+| `wpath`     | The watch path, as specified in the `WATCH`     |
+|             | operation                                       |
+|             |                                                 |
+| `token`     | The watch identifier token, as specified in the |
+|             | `WATCH` operation                               |
+
+\pagebreak
+
+### WATCH_DATA_EXTENDED
+
+The image format will contain either a `WATCH_DATA` or a `WATCH_DATA_EXTENDED`
+record for each watch registered by a connection for which there is
+`CONNECTION_DATA` record previously present. The `WATCH_DATA_EXTENDED` record
+type is valid only in version 2 and later.
 
 ```
     0       1       2       3    octet
@@ -252,6 +303,8 @@ by a connection for which there is `CONNECTION_DATA` record previously present.
 +---------------+---------------+
 | wpath-len     | token-len     |
 +---------------+---------------+
+| depth         | pad           |
++---------------+---------------+
 | wpath
 ...
 | token
@@ -270,6 +323,10 @@ by a connection for which there is `CONNECTION_DATA` record previously present.
 | `token-len` | The length (in octets) of `token` including the |
 |             | NUL terminator                                  |
 |             |                                                 |
+| `depth`     | The number of directory levels below the        |
+|             | watched path to consider for a match.           |
+|             | A value of 0xffff is used for unlimited depth.  |
+|             |                                                 |
 | `wpath`     | The watch path, as specified in the `WATCH`     |
 |             | operation                                       |
 |             |                                                 |
@@ -406,6 +463,102 @@ A node permission specifier has the following format:
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
+|                | domain by default.                                      |
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
+recognized by the receiving side should not have any effect on behavior for
+the receiving side (they can be ignored or preserved for inclusion in
+future live migration/update streams).
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
+recognized by the receiving side should not have any effect on behavior for
+the receiving side (they can be ignored or preserved for inclusion in
+future live migration/update streams).
+
+\pagebreak
+
+
 * * *
 
 [1] See https://xenbits.xen.org/gitweb/?p=xen.git;a=blob;f=docs/designs/non-cooperative-migration.md
-- 
2.35.3


