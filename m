Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CB771E5AAA
	for <lists+xen-devel@lfdr.de>; Thu, 28 May 2020 10:23:25 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jeDnz-0006Hc-Ec; Thu, 28 May 2020 08:22:23 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=l/Gm=7K=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1jeDny-0006HX-Hd
 for xen-devel@lists.xenproject.org; Thu, 28 May 2020 08:22:22 +0000
X-Inumbo-ID: 59dcff30-a0bc-11ea-9947-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 59dcff30-a0bc-11ea-9947-bc764e2007e4;
 Thu, 28 May 2020 08:22:21 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 76405AF3E;
 Thu, 28 May 2020 08:22:22 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Subject: [PATCH v2] docs: update xenstore-migration.md
Date: Thu, 28 May 2020 10:22:17 +0200
Message-Id: <20200528082217.26057-1-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
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
V2:
- added out-resp-len to connection record
---
 docs/designs/xenstore-migration.md | 71 +++++++++++++++++-------------
 1 file changed, 40 insertions(+), 31 deletions(-)

diff --git a/docs/designs/xenstore-migration.md b/docs/designs/xenstore-migration.md
index 34a2afd17e..5736bbad94 100644
--- a/docs/designs/xenstore-migration.md
+++ b/docs/designs/xenstore-migration.md
@@ -147,43 +147,59 @@ the domain being migrated.
 ```
     0       1       2       3       4       5       6       7    octet
 +-------+-------+-------+-------+-------+-------+-------+-------+
-| conn-id                       | conn-type     | conn-spec
+| conn-id                       | conn-type     | flags         |
++-------------------------------+---------------+---------------+
+| conn-spec
 ...
-+-------------------------------+-------------------------------+
-| data-len                      | data
-+-------------------------------+
++---------------+---------------+-------------------------------+
+| in-data-len   | out-resp-len  | out-data-len                  |
++---------------+---------------+-------------------------------+
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
+| `out-resp-len` | The length (in octets) of a partial response |
+|                | not yet written to the connection (included  |
+|                | in the following `out-data-len`)             |
+|                |                                              |
+| `out-data-len` | The length (in octets) of any pending data   |
+|                | not yet written to the connection            |
+|                |                                              |
+| `data`         | Pending data, first read data, then written  |
+|                | data (any of both may be empty)              |
 
-The format of `conn-spec` is dependent upon `conn-type`.
+In case of live update the connection record for the connection via which
+the live update command was issued will contain the response for the live
+update command in the pending write data.
 
 \pagebreak
 
+The format of `conn-spec` is dependent upon `conn-type`.
+
 For `shared ring` connections it is as follows:
 
 
 ```
     0       1       2       3       4       5       6       7    octet
-                                                +-------+-------+
-                                                | flags         |
 +---------------+---------------+---------------+---------------+
 | domid         | tdomid        | evtchn                        |
 +-------------------------------+-------------------------------+
@@ -198,8 +214,6 @@ For `shared ring` connections it is as follows:
 |           | it has been subject to an SET_TARGET              |
 |           | operation [2] or DOMID_INVALID [3] otherwise      |
 |           |                                                   |
-| `flags`   | Must be zero                                      |
-|           |                                                   |
 | `evtchn`  | The port number of the interdomain channel used   |
 |           | by `domid` to communicate with xenstored          |
 |           |                                                   |
@@ -211,8 +225,6 @@ For `socket` connections it is as follows:
 
 
 ```
-                                                +-------+-------+
-                                                | flags         |
 +---------------+---------------+---------------+---------------+
 | socket-fd                     | pad                           |
 +-------------------------------+-------------------------------+
@@ -221,9 +233,6 @@ For `socket` connections it is as follows:
 
 | Field       | Description                                     |
 |-------------|-------------------------------------------------|
-| `flags`     | A bit-wise OR of:                               |
-|             | 0001: read-only                                 |
-|             |                                                 |
 | `socket-fd` | The file descriptor of the connected socket     |
 
 This type of connection is only relevant for live update, where the xenstored
@@ -398,4 +407,4 @@ explanation of node permissions.
 
 [3] See https://xenbits.xen.org/gitweb/?p=xen.git;a=blob;f=xen/include/public/xen.h;hb=HEAD#l612
 
-[4] https://wiki.xen.org/wiki/XenBus
\ No newline at end of file
+[4] https://wiki.xen.org/wiki/XenBus
-- 
2.26.2


