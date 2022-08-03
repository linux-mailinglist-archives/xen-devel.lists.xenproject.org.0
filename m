Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EEE6588BAB
	for <lists+xen-devel@lfdr.de>; Wed,  3 Aug 2022 14:00:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.379831.613665 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oJD2d-00015d-9h; Wed, 03 Aug 2022 11:59:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 379831.613665; Wed, 03 Aug 2022 11:59:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oJD2c-0000y6-RF; Wed, 03 Aug 2022 11:59:58 +0000
Received: by outflank-mailman (input) for mailman id 379831;
 Wed, 03 Aug 2022 11:59:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=XCkI=YH=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1oJD2a-00008E-DA
 for xen-devel@lists.xenproject.org; Wed, 03 Aug 2022 11:59:56 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [2001:67c:2178:6::1c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c9a8122e-1323-11ed-924f-1f966e50362f;
 Wed, 03 Aug 2022 13:59:54 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 903F33FF3C;
 Wed,  3 Aug 2022 11:59:54 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 5039C13AD8;
 Wed,  3 Aug 2022 11:59:54 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id yM9fEjpj6mKNUgAAMHmgww
 (envelope-from <jgross@suse.com>); Wed, 03 Aug 2022 11:59:54 +0000
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
X-Inumbo-ID: c9a8122e-1323-11ed-924f-1f966e50362f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1659527994; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Ju0t3oFAsoHUjJP7gCi/QFhOCou8Zc/2Mo8LMbRpRtE=;
	b=C/DcFG2LOTnim5byXtdo+TwyDc0Jf3YlnvvOv5ExkqRv2Uh5O9sr7B/ybIp1Qv6bkKjdji
	R/MpdbnT7y8cA5ffEjuI+XA53eJubS0If3qc1OuVn9FSYv1E8tZVRZxIkcdk++Mbiz42+B
	TI4HYub05eWynHf4GKd+ytESPPg6k34=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v3 5/5] tools/xenstore: add migration stream extensions for new features
Date: Wed,  3 Aug 2022 13:59:50 +0200
Message-Id: <20220803115950.10904-6-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220803115950.10904-1-jgross@suse.com>
References: <20220803115950.10904-1-jgross@suse.com>
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
---
 docs/designs/xenstore-migration.md | 85 ++++++++++++++++++++++++++++--
 1 file changed, 82 insertions(+), 3 deletions(-)

diff --git a/docs/designs/xenstore-migration.md b/docs/designs/xenstore-migration.md
index efa526f420..b2b1d3d5c7 100644
--- a/docs/designs/xenstore-migration.md
+++ b/docs/designs/xenstore-migration.md
@@ -43,7 +43,13 @@ the setting of the endianness bit.
 |-----------|---------------------------------------------------|
 | `ident`   | 0x78656e73746f7265 ('xenstore' in ASCII)          |
 |           |                                                   |
-| `version` | 0x00000001 (the version of the specification)     |
+| `version` | The version of the specification, defined values: |
+|           | 0x00000001: all fields without any explicitly     |
+|           |             mentioned version dependency are      |
+|           |             valid.                                |
+|           | 0x00000002: all fields valid for version 1 plus   |
+|           |             fields explicitly stated to be        |
+|           |             supported in version 2 are valid.     |
 |           |                                                   |
 | `flags`   | 0 (LSB): Endianness: 0 = little, 1 = big          |
 |           |                                                   |
@@ -117,7 +123,17 @@ xenstored state that needs to be restored.
 | rw-socket-fd                  |
 +-------------------------------+
 | evtchn-fd                     |
++---------------+---------------+
+| n-dom-quota   | n-glob-quota  |
++---------------+---------------+
+| quota-val 1                   |
++-------------------------------+
+...
 +-------------------------------+
+| quota-val N                   |
++-------------------------------+
+| quota-names
+...
 ```
 
 
@@ -128,6 +144,22 @@ xenstored state that needs to be restored.
 |                |                                              |
 | `evtchn-fd`    | The file descriptor used to communicate with |
 |                | the event channel driver                     |
+|                |                                              |
+| `n-dom-quota`  | Number of quota values which apply per       |
+|                | domain. Valid only for version 2 and later.  |
+|                |                                              |
+| `n-glob-quota` | Number of quota values which apply globally  |
+|                | only. Valid only for version 2 and later.    |
+|                |                                              |
+| `quota-val`    | Quota values, first the ones applying per    |
+|                | domain, then the ones applying globally. A   |
+|                | value of 0 has the semantics of "unlimited". |
+|                | Valid only for version 2 and later.          |
+|                |                                              |
+| `quota-names`  | 0 delimited strings of the quota names in    |
+|                | the same sequence as the `quota-val` values. |
+|                | Valid only for version 2 and later.          |
+
 
 xenstored will resume in the original process context. Hence `rw-socket-fd`
 simply specifies the file descriptor of the socket. Sockets are not always
@@ -145,7 +177,7 @@ the domain being migrated.
 ```
     0       1       2       3       4       5       6       7    octet
 +-------+-------+-------+-------+-------+-------+-------+-------+
-| conn-id                       | conn-type     |               |
+| conn-id                       | conn-type     | n-quota       |
 +-------------------------------+---------------+---------------+
 | conn-spec
 ...
@@ -154,6 +186,17 @@ the domain being migrated.
 +---------------+---------------+-------------------------------+
 | data
 ...
++-------------------------------+
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
 ```
 
 
@@ -167,6 +210,10 @@ the domain being migrated.
 |                | 0x0001: socket                               |
 |                | 0x0002 - 0xFFFF: reserved for future use     |
 |                |                                              |
+| `n-quota`      | Number of quota values.                      |
+|                | Only for `conn-type` 0 (shared ring).        |
+|                | Only valid for version 2 and later.          |
+|                |                                              |
 | `conn-spec`    | See below                                    |
 |                |                                              |
 | `in-data-len`  | The length (in octets) of any data read      |
@@ -182,6 +229,22 @@ the domain being migrated.
 | `data`         | Pending data: first in-data-len octets of    |
 |                | read data, then out-data-len octets of       |
 |                | written data (any of both may be empty)      |
+|                |                                              |
+| `features`     | Value of the feature field visible by the    |
+|                | guest at offset 2064 of the ring page.       |
+|                | Aligned to the next 4 octet boundary.        |
+|                | Only for `conn-type` 0 (shared ring).        |
+|                | Only valid for version 2 and later.          |
+|                |                                              |
+| `quota-val`    | Quota values, a value of 0 has the semantics |
+|                | "unlimited".                                 |
+|                | Only for `conn-type` 0 (shared ring).        |
+|                | Only valid for version 2 and later.          |
+|                |                                              |
+| `quota-names`  | 0 delimited strings of the quota names in    |
+|                | the same sequence as the `quota-val` values. |
+|                | Only for `conn-type` 0 (shared ring).        |
+|                | Only valid for version 2 and later.          |
 
 In case of live update the connection record for the connection via which
 the live update command was issued will contain the response for the live
@@ -247,7 +310,7 @@ by a connection for which there is `CONNECTION_DATA` record previously present.
 
 ```
     0       1       2       3    octet
-+-------+-------+-------+-------+
++---------------+---------------+
 | conn-id                       |
 +---------------+---------------+
 | wpath-len     | token-len     |
@@ -256,6 +319,9 @@ by a connection for which there is `CONNECTION_DATA` record previously present.
 ...
 | token
 ...
++---------------+---------------+
+| depth         |               |
++---------------+---------------+
 ```
 
 
@@ -275,6 +341,13 @@ by a connection for which there is `CONNECTION_DATA` record previously present.
 |             |                                                 |
 | `token`     | The watch identifier token, as specified in the |
 |             | `WATCH` operation                               |
+|             |                                                 |
+| `depth`     | The number of directory levels below the        |
+|             | watched path to consider for a match. This      |
+|             | field is aligned to the next 4 octet boundary.  |
+|             | A value of 0xffff is used for unlimited depth.  |
+|             | This field is valid only for version 2 and      |
+|             | higher.                                         |
 
 \pagebreak
 
@@ -406,6 +479,12 @@ A node permission specifier has the following format:
 Note that perm1 defines the domain owning the node. See [4] for more
 explanation of node permissions.
 
+\pagebreak
+
+### DOMAIN_DATA
+
+
+
 * * *
 
 [1] See https://xenbits.xen.org/gitweb/?p=xen.git;a=blob;f=docs/designs/non-cooperative-migration.md
-- 
2.35.3


