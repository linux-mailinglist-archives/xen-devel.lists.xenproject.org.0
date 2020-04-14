Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 54C4A1A8409
	for <lists+xen-devel@lfdr.de>; Tue, 14 Apr 2020 18:00:51 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jONyV-0006VT-S7; Tue, 14 Apr 2020 15:59:47 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Lvws=56=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1jONyV-0006VO-6S
 for xen-devel@lists.xenproject.org; Tue, 14 Apr 2020 15:59:47 +0000
X-Inumbo-ID: f61640bc-7e68-11ea-b58d-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f61640bc-7e68-11ea-b58d-bc764e2007e4;
 Tue, 14 Apr 2020 15:59:46 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 41056ABCE;
 Tue, 14 Apr 2020 15:59:44 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Subject: [PATCH] docs: update xenstore migration design document
Date: Tue, 14 Apr 2020 17:59:42 +0200
Message-Id: <20200414155942.3347-1-jgross@suse.com>
X-Mailer: git-send-email 2.16.4
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
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

In the past there have been several attempts to make Xenstore
restartable. This requires to transfer the internal Xenstore state to
the new instance. With the Xenstore migration protocol added recently
to Xen's documentation a first base has been defined to represent the
state of Xenstore. This can be expanded a little bit in order to have
a full state representation which is needed as a first step for live
updating Xenstore.

Add some definitions to designs/xenstore-migration.md which are needed
for live update of xenstored.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 docs/designs/xenstore-migration.md | 90 ++++++++++++++++++++++++++++++++++++--
 1 file changed, 87 insertions(+), 3 deletions(-)

diff --git a/docs/designs/xenstore-migration.md b/docs/designs/xenstore-migration.md
index 6ab351e8fe..09bb4700b4 100644
--- a/docs/designs/xenstore-migration.md
+++ b/docs/designs/xenstore-migration.md
@@ -9,6 +9,10 @@ records must include details of registered xenstore watches as well as
 content; information that cannot currently be recovered from `xenstored`,
 and hence some extension to the xenstore protocol[2] will also be required.
 
+As a similar set of data is needed for transferring xenstore data from
+one instance to another when live updating xenstored the same definitions
+are being used.
+
 The *libxenlight Domain Image Format* specification[3] already defines a
 record type `EMULATOR_XENSTORE_DATA` but this is not suitable for
 transferring xenstore data pertaining to the domain directly as it is
@@ -48,7 +52,10 @@ where type is one of the following values
 |        | 0x00000001: NODE_DATA                            |
 |        | 0x00000002: WATCH_DATA                           |
 |        | 0x00000003: TRANSACTION_DATA                     |
-|        | 0x00000004 - 0xFFFFFFFF: reserved for future use |
+|        | 0x00000004: TRANSACTION_NODE_DATA                |
+|        | 0x00000005: GUEST_RING_DATA                      |
+|        | 0x00000006: DOMAIN_START (live update only)      |
+|        | 0x00000007 - 0xFFFFFFFF: reserved for future use |
 
 
 and data is one of the record data formats described in the following
@@ -79,7 +86,7 @@ as follows:
 +-------------------------------+
 | perm count (N)                |
 +-------------------------------+
-| perm0                         |
+| perm1                         |
 +-------------------------------+
 ...
 +-------------------------------+
@@ -93,7 +100,7 @@ as follows:
 +-------------------------------+
 ```
 
-where perm0..N are formatted as follows:
+where perm1..N are formatted as follows:
 
 
 ```
@@ -164,6 +171,83 @@ as follows:
 where tx_id is the non-zero identifier values of an open transaction.
 
 
+**TRANSACTION_NODE_DATA**
+
+
+Each TRANSACTION_NODE_DATA record specifies a transaction local xenstore
+node. Its is similar to the NODE_DATA record with the addition of a
+transaction id:
+
+```
+    0       1       2       3     octet
++-------+-------+-------+-------+
+| TRANSACTION_NODE_DATA         |
++-------------------------------+
+| tx_id                         |
++-------------------------------+
+| path length                   |
++-------------------------------+
+| path data                     |
+...
+| pad (0 to 3 octets)           |
++-------------------------------+
+| perm count (N)                |
++-------------------------------+
+| perm1                         |
++-------------------------------+
+...
++-------------------------------+
+| permN                         |
++-------------------------------+
+| value length                  |
++-------------------------------+
+| value data                    |
+...
+| pad (0 to 3 octets)           |
++-------------------------------+
+```
+
+where perm1..N are formatted as specified in the NODE_DATA record. A perm
+count of 0 denotes a node having been deleted in the transaction.
+
+
+**GUEST_RING_DATA**
+
+
+The GUEST_RING_DATA record is used to transfer data which is pending to be
+written to the guest's xenstore ring buffer. It si formatted as follows:
+
+
+```
++-------+-------+-------+-------+
+| GUEST_RING_DATA               |
++-------------------------------+
+| value length                  |
++-------------------------------+
+| value data                    |
+...
+| pad (0 to 3 octets)           |
++-------------------------------+
+```
+
+**DOMAIN_START**
+
+
+For live updating xenstored data of multiple domains needs to be transferred.
+For this purpose the DOMAIN_START record is being used. All records of types
+other than NODE_DATA always relate to the last DOMAIN_START record in the
+stream. A DOMAIN_START record just contains a domain-id:
+
+
+```
++-------+-------+-------+-------+
+| DOMAIN_START                  |
++-------------------------------+
+| domid         | pad           |
++-------------------------------+
+```
+
+
 ### Protocol Extension
 
 Before xenstore state is migrated it is necessary to wait for any pending
-- 
2.16.4


