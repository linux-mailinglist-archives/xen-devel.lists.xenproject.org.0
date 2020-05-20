Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FC9F1DAFE5
	for <lists+xen-devel@lfdr.de>; Wed, 20 May 2020 12:16:32 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jbLlj-0001W8-TE; Wed, 20 May 2020 10:16:11 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jY/2=7C=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1jbLli-0001W3-Jr
 for xen-devel@lists.xenproject.org; Wed, 20 May 2020 10:16:10 +0000
X-Inumbo-ID: ec8d1d96-9a82-11ea-b07b-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ec8d1d96-9a82-11ea-b07b-bc764e2007e4;
 Wed, 20 May 2020 10:16:09 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 431F8B1F2;
 Wed, 20 May 2020 10:16:11 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Subject: [PATCH] docs: update xenstore-migration.md
Date: Wed, 20 May 2020 12:16:05 +0200
Message-Id: <20200520101605.4263-1-jgross@suse.com>
X-Mailer: git-send-email 2.26.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Update connection record details: make flags common for sockets and
domains, and add pending incoming data.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 docs/designs/xenstore-migration.md | 63 ++++++++++++++++--------------
 1 file changed, 34 insertions(+), 29 deletions(-)

diff --git a/docs/designs/xenstore-migration.md b/docs/designs/xenstore-migration.md
index 34a2afd17e..e361d6b5e7 100644
--- a/docs/designs/xenstore-migration.md
+++ b/docs/designs/xenstore-migration.md
@@ -147,31 +147,45 @@ the domain being migrated.
 ```
     0       1       2       3       4       5       6       7    octet
 +-------+-------+-------+-------+-------+-------+-------+-------+
-| conn-id                       | conn-type     | conn-spec
+| conn-id                       | conn-type     | flags         |
++-------------------------------+---------------+---------------+
+| conn-spec
 ...
 +-------------------------------+-------------------------------+
-| data-len                      | data
-+-------------------------------+
+| in-data-len                   | out-data-len                  |
++-------------------------------+-------------------------------+
+| data
 ...
 ```
 
 
-| Field       | Description                                     |
-|-------------|-------------------------------------------------|
-| `conn-id`   | A non-zero number used to identify this         |
-|             | connection in subsequent connection-specific    |
-|             | records                                         |
-|             |                                                 |
-| `conn-type` | 0x0000: shared ring                             |
-|             | 0x0001: socket                                  |
-|             | 0x0002 - 0xFFFF: reserved for future use        |
-|             |                                                 |
-| `conn-spec` | See below                                       |
-|             |                                                 |
-| `data-len`  | The length (in octets) of any pending data not  |
-|             | yet written to the connection                   |
-|             |                                                 |
-| `data`      | Pending data (may be empty)                     |
+| Field          | Description                                  |
+|----------------|----------------------------------------------|
+| `conn-id`      | A non-zero number used to identify this      |
+|                | connection in subsequent connection-specific |
+|                | records                                      |
+|                |                                              |
+| `flags`        | A bit-wise OR of:                            |
+|                | 0001: read-only                              |
+|                |                                              |
+| `conn-type`    | 0x0000: shared ring                          |
+|                | 0x0001: socket                               |
+|                | 0x0002 - 0xFFFF: reserved for future use     |
+|                |                                              |
+| `conn-spec`    | See below                                    |
+|                |                                              |
+| `in-data-len`  | The length (in octets) of any data read      |
+|                | from the connection not yet processed        |
+|                |                                              |
+| `out-data-len` | The length (in octets) of any pending data   |
+|                | not yet written to the connection            |
+|                |                                              |
+| `data`         | Pending data, first read data, then written  |
+|                | data (any of both may be empty)              |
+
+In case of live update the connection record for the connection via which
+the live update command was issued will contain the response for the live
+update command in the pending write data.
 
 The format of `conn-spec` is dependent upon `conn-type`.
 
@@ -182,8 +196,6 @@ For `shared ring` connections it is as follows:
 
 ```
     0       1       2       3       4       5       6       7    octet
-                                                +-------+-------+
-                                                | flags         |
 +---------------+---------------+---------------+---------------+
 | domid         | tdomid        | evtchn                        |
 +-------------------------------+-------------------------------+
@@ -198,8 +210,6 @@ For `shared ring` connections it is as follows:
 |           | it has been subject to an SET_TARGET              |
 |           | operation [2] or DOMID_INVALID [3] otherwise      |
 |           |                                                   |
-| `flags`   | Must be zero                                      |
-|           |                                                   |
 | `evtchn`  | The port number of the interdomain channel used   |
 |           | by `domid` to communicate with xenstored          |
 |           |                                                   |
@@ -211,8 +221,6 @@ For `socket` connections it is as follows:
 
 
 ```
-                                                +-------+-------+
-                                                | flags         |
 +---------------+---------------+---------------+---------------+
 | socket-fd                     | pad                           |
 +-------------------------------+-------------------------------+
@@ -221,9 +229,6 @@ For `socket` connections it is as follows:
 
 | Field       | Description                                     |
 |-------------|-------------------------------------------------|
-| `flags`     | A bit-wise OR of:                               |
-|             | 0001: read-only                                 |
-|             |                                                 |
 | `socket-fd` | The file descriptor of the connected socket     |
 
 This type of connection is only relevant for live update, where the xenstored
@@ -398,4 +403,4 @@ explanation of node permissions.
 
 [3] See https://xenbits.xen.org/gitweb/?p=xen.git;a=blob;f=xen/include/public/xen.h;hb=HEAD#l612
 
-[4] https://wiki.xen.org/wiki/XenBus
\ No newline at end of file
+[4] https://wiki.xen.org/wiki/XenBus
-- 
2.26.1


