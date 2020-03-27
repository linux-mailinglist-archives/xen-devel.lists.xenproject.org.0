Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D6A119585D
	for <lists+xen-devel@lfdr.de>; Fri, 27 Mar 2020 14:49:57 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jHpJT-0005pT-BM; Fri, 27 Mar 2020 13:46:19 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=KiP0=5M=xen.org=paul@srs-us1.protection.inumbo.net>)
 id 1jHpJS-0005pJ-Be
 for xen-devel@lists.xenproject.org; Fri, 27 Mar 2020 13:46:18 +0000
X-Inumbo-ID: 552014ac-7031-11ea-8990-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 552014ac-7031-11ea-8990-12813bfff9fa;
 Fri, 27 Mar 2020 13:46:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=6ZY/qg1cA05lSDlhM70ybdVn0PwcaEuE6Tgz3eQyoYo=; b=tvKDiYuGakLDze3wWq6EAPmziu
 ImmVXzevcC70v7GwQOBaQVIF8HCDecqV+5oCHu282G8V+8QLgv8yp64sUdZEl2G27W7SDMD/v01/O
 9w+tPuHTvVEFieQDBf987VCuI+ZQe44NeqcF4sHAjSo4J+0wNR08EphAmSBaicG03ui8=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <paul@xen.org>)
 id 1jHpJQ-0001IL-JX; Fri, 27 Mar 2020 13:46:16 +0000
Received: from 54-240-197-232.amazon.com ([54.240.197.232]
 helo=u2f063a87eabd5f.cbg10.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.89)
 (envelope-from <paul@xen.org>)
 id 1jHpJQ-00066v-6c; Fri, 27 Mar 2020 13:46:16 +0000
From: Paul Durrant <paul@xen.org>
To: xen-devel@lists.xenproject.org
Date: Fri, 27 Mar 2020 13:46:10 +0000
Message-Id: <20200327134610.23387-3-paul@xen.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200327134610.23387-1-paul@xen.org>
References: <20200327134610.23387-1-paul@xen.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Xen-devel] [PATCH v8 2/2] docs/designs: Add a design document for
 migration of xenstore data
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Paul Durrant <paul@xen.org>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <pdurrant@amazon.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Jan Beulich <jbeulich@suse.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

From: Paul Durrant <pdurrant@amazon.com>

This patch details proposes extra migration data and xenstore protocol
extensions to support non-cooperative live migration of guests.

NOTE: doc/misc/xenstore.txt is also amended to replace the <mfn> term
      for the INTRODUCE operation with the <gfn>, since this is what
      it actually is.

Signed-off-by: Paul Durrant <paul@xen.org>
---
Cc: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: George Dunlap <George.Dunlap@eu.citrix.com>
Cc: Ian Jackson <ian.jackson@eu.citrix.com>
Cc: Jan Beulich <jbeulich@suse.com>
Cc: Julien Grall <julien@xen.org>
Cc: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>
Cc: Wei Liu <wl@xen.org>

v8:
 - Addressed further comments form Julien

v7:
 - Addressed further comments from Julien
 - Switched migration records to defined structures instead of tuples

v6:
 - Addressed comments from Julien

v5:
 - Add QUIESCE
 - Make semantics of <index> in GET_DOMAIN_WATCHES more clear

v4:
 - Drop the restrictions on special paths

v3:
 - New in v3
---
 docs/designs/xenstore-migration.md | 256 +++++++++++++++++++++++++++++
 docs/misc/xenstore.txt             |   6 +-
 2 files changed, 259 insertions(+), 3 deletions(-)
 create mode 100644 docs/designs/xenstore-migration.md

diff --git a/docs/designs/xenstore-migration.md b/docs/designs/xenstore-migration.md
new file mode 100644
index 0000000000..97695f3ec9
--- /dev/null
+++ b/docs/designs/xenstore-migration.md
@@ -0,0 +1,256 @@
+# Xenstore Migration
+
+## Background
+
+The design for *Non-Cooperative Migration of Guests*[1] explains that extra
+save records are required in the migrations stream to allow a guest running
+PV drivers to be migrated without its co-operation. Moreover the save
+records must include details of registered xenstore watches as well as
+content; information that cannot currently be recovered from `xenstored`,
+and hence some extension to the xenstore protocol[2] will also be required.
+
+The *libxenlight Domain Image Format* specification[3] already defines a
+record type `EMULATOR_XENSTORE_DATA` but this is not suitable for
+transferring xenstore data pertaining to the domain directly as it is
+specified such that keys are relative to the path
+`/local/domain/$dm_domid/device-model/$domid`. Thus it is necessary to
+define at least one new save record type.
+
+## Proposal
+
+### New Save Record
+
+A new mandatory record type should be defined within the libxenlight Domain
+Image Format:
+
+`0x00000007: DOMAIN_XENSTORE_DATA`
+
+An arbitrary number of these records may be present in the migration
+stream and may appear in any order. The format of each record should be as
+follows:
+
+
+```
+    0       1       2       3       4       5       6       7    octet
++-------+-------+-------+-------+-------+-------+-------+-------+
+| type                          | record specific data          |
++-------------------------------+                               |
+...
++---------------------------------------------------------------+
+```
+
+where type is one of the following values
+
+
+| Field  | Description                                      |
+|--------|--------------------------------------------------|
+| `type` | 0x00000000: invalid                              |
+|        | 0x00000001: NODE_DATA                            |
+|        | 0x00000002: WATCH_DATA                           |
+|        | 0x00000003: TRANSACTION_DATA                     |
+|        | 0x00000004 - 0xFFFFFFFF: reserved for future use |
+
+
+and data is one of the record data formats described in the following
+sections.
+
+
+NOTE: The record data does not contain an overall length because the
+libxenlight record header specifies the length.
+
+
+**NODE_DATA**
+
+
+Each NODE_DATA record specifies a single node in xenstore and is formatted
+as follows:
+
+
+```
+    0       1       2       3     octet
++-------+-------+-------+-------+
+| NODE_DATA                     |
++-------------------------------+
+| path length                   |
++-------------------------------+
+| path data                     |
+...
+| pad (0 to 3 octets)           |
++-------------------------------+
+| perm count (N)                |
++-------------------------------+
+| perm0                         |
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
+where perm0..N are formatted as follows:
+
+
+```
+    0       1       2       3     octet
++-------+-------+-------+-------+
+| perm  | pad   | domid         |
++-------------------------------+
+```
+
+
+path length and value length are specified in octets (excluding the NUL
+terminator of the path). perm should be one of the ASCII values `w`, `r`,
+`b` or `n` as described in [2]. All pad values should be 0.
+All paths should be absolute (i.e. start with `/`) and as described in
+[2].
+
+
+**WATCH_DATA**
+
+
+Each WATCH_DATA record specifies a registered watch and is formatted as
+follows:
+
+
+```
+    0       1       2       3     octet
++-------+-------+-------+-------+
+| WATCH_DATA                    |
++-------------------------------+
+| wpath length                  |
++-------------------------------+
+| wpath data                    |
+...
+| pad (0 to 3 octets)           |
++-------------------------------+
+...
++-------------------------------+
+| token length                  |
++-------------------------------+
+| token data                    |
+...
+| pad (0 to 3 octets)           |
++-------------------------------+
+```
+
+wpath length and token length are specified in octets (excluding the NUL
+terminator). The wpath should be as described for the `WATCH` operation in
+[2]. The token is an arbitrary string of octets not containing any NUL
+values.
+
+
+**TRANSACTION_DATA**
+
+
+Each TRANSACTION_DATA record specifies an open transaction and is formatted
+as follows:
+
+
+```
+    0       1       2       3     octet
++-------+-------+-------+-------+
+| TRANSACTION_DATA              |
++-------------------------------+
+| tx_id                         |
++-------------------------------+
+```
+
+where tx_id is the non-zero identifier values of an open transaction.
+
+
+### Protocol Extension
+
+Before xenstore state is migrated it is necessary to wait for any pending
+reads, writes, watch registrations etc. to complete, and also to make sure
+that xenstored does not start processing any new requests (so that new
+requests remain pending on the shared ring for subsequent processing on the
+new host). Hence the following operation is needed:
+
+```
+QUIESCE                 <domid>|
+
+Complete processing of any request issued by the specified domain, and
+do not process any further requests from the shared ring.
+```
+
+The `WATCH` operation does not allow specification of a `<domid>`; it is
+assumed that the watch pertains to the domain that owns the shared ring
+over which the operation is passed. Hence, for the tool-stack to be able
+to register a watch on behalf of a domain a new operation is needed:
+
+```
+ADD_DOMAIN_WATCHES      <domid>|<watch>|+
+
+Adds watches on behalf of the specified domain.
+
+<watch> is a NUL separated tuple of <path>|<token>. The semantics of this
+operation are identical to the domain issuing WATCH <path>|<token>| for
+each <watch>.
+```
+
+The watch information for a domain also needs to be extracted from the
+sending xenstored so the following operation is also needed:
+
+```
+GET_DOMAIN_WATCHES      <domid>|<index>   <gencnt>|<watch>|*
+
+Gets the list of watches that are currently registered for the domain.
+
+<watch> is a NUL separated tuple of <path>|<token>. The sub-list returned
+will start at <index> items into the the overall list of watches and may
+be truncated (at a <watch> boundary) such that the returned data fits
+within XENSTORE_PAYLOAD_MAX.
+
+If <index> is beyond the end of the overall list then the returned sub-
+list will be empty. If the value of <gencnt> changes then it indicates
+that the overall watch list has changed and thus it may be necessary
+to re-issue the operation for previous values of <index>.
+```
+
+To deal with transactions that were pending when the domain is migrated
+it is necessary to start transactions with the same tx_id on behalf of the
+domain in the receiving xenstored.
+
+NOTE: For safety each such transaction should result in an `EAGAIN` when
+the `TRANSACTION_END` operation is performed, as modifications made under
+the tx_id will not be part of the migration stream.
+
+The `TRANSACTION_START` operation does not allow specification of a
+`<domid>`; it is assumed that the transaction pertains to the domain that
+owns the shared ring over which the operation is passed. Neither does it
+allow a `<transid>` to be specified; it is always chosen by xenstored.
+Hence, for the tool-stack to be able to open a transaction on behalf of a
+domain a new operation is needed:
+
+```
+START_DOMAIN_TRANSACTION    <domid>|<transid>|
+
+Starts a transaction on behalf of a domain.
+
+The semantics of this are similar to the domain issuing
+TRANSACTION_START and receiving the specified <transid> as the response.
+The main difference is that the transaction will be immediately marked as
+'conflicting' such that when the domain isses TRANSACTION_END T|, it will
+result in EAGAIN.
+```
+
+It may also be desirable to state in the protocol specification that
+the `INTRODUCE` operation should not clear the `<gfn>` specified such that
+a `RELEASE` operation followed by an `INTRODUCE` operation form an
+idempotent pair. The current implementation of *C xentored* does this
+(in the `domain_conn_reset()` function) but this could be dropped as this
+behaviour is not currently specified and the page will always be zeroed
+for a newly created domain.
+
+
+* * *
+
+[1] See https://xenbits.xen.org/gitweb/?p=xen.git;a=blob;f=docs/designs/non-cooperative-migration.md
+[2] See https://xenbits.xen.org/gitweb/?p=xen.git;a=blob;f=docs/misc/xenstore.txt
+[3] See https://xenbits.xen.org/gitweb/?p=xen.git;a=blob;f=docs/specs/libxl-migration-stream.pandoc
diff --git a/docs/misc/xenstore.txt b/docs/misc/xenstore.txt
index 6f8569d576..7f2b388dd5 100644
--- a/docs/misc/xenstore.txt
+++ b/docs/misc/xenstore.txt
@@ -254,7 +254,7 @@ TRANSACTION_END		F|
 
 ---------- Domain management and xenstored communications ----------
 
-INTRODUCE		<domid>|<mfn>|<evtchn>|?
+INTRODUCE		<domid>|<gfn>|<evtchn>|?
 	Notifies xenstored to communicate with this domain.
 
 	INTRODUCE is currently only used by xend (during domain
@@ -262,12 +262,12 @@ INTRODUCE		<domid>|<mfn>|<evtchn>|?
 	xenstored prevents its use other than by dom0.
 
 	<domid> must be a real domain id (not 0 and not a special
-	DOMID_... value).  <mfn> must be a machine page in that domain
+	DOMID_... value).  <gfn> must be a page in that domain
 	represented in signed decimal (!).  <evtchn> must be event
 	channel is an unbound event channel in <domid> (likewise in
 	decimal), on which xenstored will call bind_interdomain.
 	Violations of these rules may result in undefined behaviour;
-	for example passing a high-bit-set 32-bit mfn as an unsigned
+	for example passing a high-bit-set 32-bit gfn as an unsigned
 	decimal will attempt to use 0x7fffffff instead (!).
 
 RELEASE			<domid>|
-- 
2.20.1


