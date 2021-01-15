Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E0EE22F747B
	for <lists+xen-devel@lfdr.de>; Fri, 15 Jan 2021 09:40:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.67822.121279 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l0Keq-0003cX-Dq; Fri, 15 Jan 2021 08:40:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 67822.121279; Fri, 15 Jan 2021 08:40:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l0Keq-0003bu-9n; Fri, 15 Jan 2021 08:40:36 +0000
Received: by outflank-mailman (input) for mailman id 67822;
 Fri, 15 Jan 2021 08:40:35 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=v6X5=GS=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1l0KVe-0008HA-OR
 for xen-devel@lists.xenproject.org; Fri, 15 Jan 2021 08:31:06 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id be665579-540d-4351-b7c0-854ce618ebc0;
 Fri, 15 Jan 2021 08:30:13 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 21C89B98D;
 Fri, 15 Jan 2021 08:30:07 +0000 (UTC)
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
X-Inumbo-ID: be665579-540d-4351-b7c0-854ce618ebc0
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1610699408; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9hLKS3tqGavquprb3POoginKf8qVTOiNwihT9d+dpjc=;
	b=csOG0wvPkcaYR/OnOv04ociOEy5DKGgtSVMnhfSHNbIgTydbM3UYRoe5yfyr7vwmKVXm/P
	IybJztmLLVuz59ofCp+d+f5DcQ4OGCtoIWoQo6Dm/iumemoOt/DIATVEmeSsCa4po+JfPP
	bM7H7h3+iK4kLbsUmFANfhgKwJ5RVv0=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Ian Jackson <iwj@xenproject.org>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>,
	Julien Grall <jgrall@amazon.com>
Subject: [PATCH v12 15/27] docs: update the xenstore migration stream documentation
Date: Fri, 15 Jan 2021 09:29:48 +0100
Message-Id: <20210115083000.14186-16-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210115083000.14186-1-jgross@suse.com>
References: <20210115083000.14186-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

For live update of Xenstore some records defined in the migration
stream document need to be changed:

- Support of the read-only socket has been dropped from all Xenstore
  implementations, so ro-socket-fd in the global record can be removed.

- Some guests require the event channel to Xenstore to remain the same
  on Xenstore side, so Xenstore has to keep the event channel interface
  open across a live update. For this purpose an evtchn-fd needs to be
  added to the global record.

- With no read-only support the flags field in the connection record
  can be dropped.

- The evtchn field in the connection record needs to be switched to
  hold the port of the Xenstore side of the event channel.

- A flags field needs to be added to permission specifiers in order to
  be able to mark a permission as stale (XSA-322).

Signed-off-by: Juergen Gross <jgross@suse.com>
Reviewed-by: Julien Grall <jgrall@amazon.com>
---
V8:
- split off from following patch (Julien Grall)
---
 docs/designs/xenstore-migration.md | 19 ++++++++++---------
 1 file changed, 10 insertions(+), 9 deletions(-)

diff --git a/docs/designs/xenstore-migration.md b/docs/designs/xenstore-migration.md
index 2ce2c836f5..1a5b94b31d 100644
--- a/docs/designs/xenstore-migration.md
+++ b/docs/designs/xenstore-migration.md
@@ -116,7 +116,7 @@ xenstored state that needs to be restored.
 +-------+-------+-------+-------+
 | rw-socket-fd                  |
 +-------------------------------+
-| ro-socket-fd                  |
+| evtchn-fd                     |
 +-------------------------------+
 ```
 
@@ -126,8 +126,8 @@ xenstored state that needs to be restored.
 | `rw-socket-fd` | The file descriptor of the socket accepting  |
 |                | read-write connections                       |
 |                |                                              |
-| `ro-socket-fd` | The file descriptor of the socket accepting  |
-|                | read-only connections                        |
+| `evtchn-fd`    | The file descriptor used to communicate with |
+|                | the event channel driver                     |
 
 xenstored will resume in the original process context. Hence `rw-socket-fd` and
 `ro-socket-fd` simply specify the file descriptors of the sockets. Sockets
@@ -147,7 +147,7 @@ the domain being migrated.
 ```
     0       1       2       3       4       5       6       7    octet
 +-------+-------+-------+-------+-------+-------+-------+-------+
-| conn-id                       | conn-type     | flags         |
+| conn-id                       | conn-type     |               |
 +-------------------------------+---------------+---------------+
 | conn-spec
 ...
@@ -169,9 +169,6 @@ the domain being migrated.
 |                | 0x0001: socket                               |
 |                | 0x0002 - 0xFFFF: reserved for future use     |
 |                |                                              |
-| `flags`        | A bit-wise OR of:                            |
-|                | 0001: read-only                              |
-|                |                                              |
 | `conn-spec`    | See below                                    |
 |                |                                              |
 | `in-data-len`  | The length (in octets) of any data read      |
@@ -216,7 +213,7 @@ For `shared ring` connections it is as follows:
 |           | operation [2] or DOMID_INVALID [3] otherwise      |
 |           |                                                   |
 | `evtchn`  | The port number of the interdomain channel used   |
-|           | by `domid` to communicate with xenstored          |
+|           | by xenstored to communicate with `domid`          |
 |           |                                                   |
 
 Since the ABI guarantees that entry 1 in `domid`'s grant table will always
@@ -386,7 +383,7 @@ A node permission specifier has the following format:
 ```
     0       1       2       3    octet
 +-------+-------+-------+-------+
-| perm  | pad   | domid         |
+| perm  | flags | domid         |
 +-------+-------+---------------+
 ```
 
@@ -395,6 +392,10 @@ A node permission specifier has the following format:
 | `perm`  | One of the ASCII values `w`, `r`, `b` or `n` as     |
 |         | specified for the `SET_PERMS` operation [2]         |
 |         |                                                     |
+| `flags` | A bit-wise OR of:                                   |
+|         | 0x01: stale permission, ignore when checking        |
+|         |       permissions                                   |
+|         |                                                     |
 | `domid` | The domain-id to which the permission relates       |
 
 Note that perm1 defines the domain owning the code. See [4] for more
-- 
2.26.2


