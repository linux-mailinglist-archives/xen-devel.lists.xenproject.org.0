Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A1DE1B771C
	for <lists+xen-devel@lfdr.de>; Fri, 24 Apr 2020 15:38:17 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jRyWW-000889-F8; Fri, 24 Apr 2020 13:37:44 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=JRE+=6I=xen.org=paul@srs-us1.protection.inumbo.net>)
 id 1jRyWU-000884-JP
 for xen-devel@lists.xenproject.org; Fri, 24 Apr 2020 13:37:42 +0000
X-Inumbo-ID: c4d745f8-8630-11ea-b58d-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c4d745f8-8630-11ea-b58d-bc764e2007e4;
 Fri, 24 Apr 2020 13:37:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 MIME-Version:Content-Type:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=KQPSoJU+1HLvVZmw/z9kh1rKENGUJpf0myLlauD1kak=; b=Yhoq0zlTZ32pvbpo3T53XGsCb5
 OYEzJ7R1gV52rjkTlp8DLnJfJnERP5dK4axOONMat4g6uWbdfMsvvTEqcGOjTTLRht7F5Io1HlKHW
 KJ6FlmG9INmc6DYdiT2bLpYgnaBf/bVh/fFFw4Feyd8neMb/1Mz3/1bygtC8SyevkC0I=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <paul@xen.org>)
 id 1jRyWS-0000uC-E6; Fri, 24 Apr 2020 13:37:40 +0000
Received: from [54.239.6.185] (helo=CBG-R90WXYV0.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.89)
 (envelope-from <paul@xen.org>)
 id 1jRyWR-0007Oc-UR; Fri, 24 Apr 2020 13:37:40 +0000
From: Paul Durrant <paul@xen.org>
To: xen-devel@lists.xenproject.org
Subject: [PATCH] docs/designs: re-work the xenstore migration document...
Date: Fri, 24 Apr 2020 14:37:36 +0100
Message-Id: <20200424133736.737-1-paul@xen.org>
X-Mailer: git-send-email 2.17.1
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
Cc: Paul Durrant <pdurrant@amazon.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

From: Paul Durrant <pdurrant@amazon.com>

... to specify a separate migration stream that will also be suitable for
live update.

The original scope of the document was to support non-cooperative migration
of guests [1] but, since then, live update of xenstored has been brought into
scope. Thus it makes more sense to define a separate image format for
serializing xenstore state that is suitable for both purposes.

The document has been limited to specifying a new image format. The mechanism
for acquiring the image for live update or migration is not covered as that
is more appropriately dealt with by a patch to docs/misc/xenstore.txt. It is
also expected that, when the first implementation of live update or migration
making use of this specification is committed, that the document is moved from
docs/designs into docs/specs.

[1] See https://xenbits.xen.org/gitweb/?p=xen.git;a=blob;f=docs/designs/non-cooperative-migration.md

Signed-off-by: Paul Durrant <pdurrant@amazon.com>
---
Juergen Gross <jgross@suse.com>
Andrew Cooper <andrew.cooper3@citrix.com>
George Dunlap <george.dunlap@citrix.com>
Ian Jackson <ian.jackson@eu.citrix.com>
Jan Beulich <jbeulich@suse.com>
Julien Grall <julien@xen.org>
Stefano Stabellini <sstabellini@kernel.org>
Wei Liu <wl@xen.org>
---
 docs/designs/xenstore-migration.md | 472 +++++++++++++++++++----------
 1 file changed, 309 insertions(+), 163 deletions(-)

diff --git a/docs/designs/xenstore-migration.md b/docs/designs/xenstore-migration.md
index 6ab351e8fe..c96bad48eb 100644
--- a/docs/designs/xenstore-migration.md
+++ b/docs/designs/xenstore-migration.md
@@ -3,254 +3,400 @@
 ## Background
 
 The design for *Non-Cooperative Migration of Guests*[1] explains that extra
-save records are required in the migrations stream to allow a guest running
-PV drivers to be migrated without its co-operation. Moreover the save
-records must include details of registered xenstore watches as well as
-content; information that cannot currently be recovered from `xenstored`,
-and hence some extension to the xenstore protocol[2] will also be required.
-
-The *libxenlight Domain Image Format* specification[3] already defines a
-record type `EMULATOR_XENSTORE_DATA` but this is not suitable for
-transferring xenstore data pertaining to the domain directly as it is
-specified such that keys are relative to the path
-`/local/domain/$dm_domid/device-model/$domid`. Thus it is necessary to
-define at least one new save record type.
+save records are required in the migrations stream to allow a guest running PV
+drivers to be migrated without its co-operation. Moreover the save records must
+include details of registered xenstore watches as well ascontent; information
+that cannot currently be recovered from `xenstored`, and hence some extension
+to the xenstored implementations will also be required.
+
+As a similar set of data is needed for transferring xenstore data from one
+instance to another when live updating xenstored this document proposes an
+image format for a 'migration stream' suitable for both purposes.
 
 ## Proposal
 
-### New Save Record
+The image format consists of a _header_ followed by 1 or more _records_. Each
+record consists of a type and length field, followed by any data mandated by
+the record type. At minimum there will be a single record of type `END`
+(defined below).
 
-A new mandatory record type should be defined within the libxenlight Domain
-Image Format:
+### Header
 
-`0x00000007: DOMAIN_XENSTORE_DATA`
+The header identifies the stream as a `xenstore` stream, including the version
+of the specification that it complies with.
 
-An arbitrary number of these records may be present in the migration
-stream and may appear in any order. The format of each record should be as
-follows:
+All fields in this header must be in _big-endian_ byte order, regardless of
+the setting of the endianness bit.
 
 
 ```
     0       1       2       3       4       5       6       7    octet
 +-------+-------+-------+-------+-------+-------+-------+-------+
-| type                          | record specific data          |
-+-------------------------------+                               |
-...
-+---------------------------------------------------------------+
+| ident                                                         |
++-------------------------------+-------------------------------|
+| version                       | flags                         |
++-------------------------------+-------------------------------+
 ```
 
-where type is one of the following values
 
+| Field     | Description                                       |
+|-----------|---------------------------------------------------|
+| `ident`   | 0x78656e73746f7265 ('xenstore' in ASCII)          |
+|           |                                                   |
+| `version` | 0x00000001 (the version of the specification)     |
+|           |                                                   |
+| `flags`   | 0 (LSB): Endianness: 0 = little, 1 = big          |
+|           |                                                   |
+|           | 1-31: Reserved (must be zero)                     |
 
-| Field  | Description                                      |
-|--------|--------------------------------------------------|
-| `type` | 0x00000000: invalid                              |
-|        | 0x00000001: NODE_DATA                            |
-|        | 0x00000002: WATCH_DATA                           |
-|        | 0x00000003: TRANSACTION_DATA                     |
-|        | 0x00000004 - 0xFFFFFFFF: reserved for future use |
+### Records
 
+Records immediately follow the header and have the following format:
 
-and data is one of the record data formats described in the following
-sections.
 
+```
+    0       1       2       3       4       5       6       7    octet
++-------+-------+-------+-------+-------+-------+-------+-------+
+| type                          | len                           |
++-------------------------------+-------------------------------+
+| body
+...
+|       | padding (0 to 7 octets)                               |
++-------+-------------------------------------------------------+
+```
+
+NOTE: padding octets here and in all subsequent format specifications must be
+      zero, unless stated otherwise.
 
-NOTE: The record data does not contain an overall length because the
-libxenlight record header specifies the length.
 
+| Field  | Description                                          |
+|--------|------------------------------------------------------|
+| `type` | 0x00000000: END                                      |
+|        | 0x00000001: GLOBAL_DATA                              |
+|        | 0x00000002: CONNECTION_DATA                          |
+|        | 0x00000003: WATCH_DATA                               |
+|        | 0x00000004: TRANSACTION_DATA                         |
+|        | 0x00000005: NODE_DATA                                |
+|        | 0x00000006 - 0xFFFFFFFF: reserved for future use     |
+|        |                                                      |
+| `len`  | The length (in octets) of `body`                     |
+|        |                                                      |
+| `body` | The type-specific record data                        |
 
-**NODE_DATA**
+The various formats of the type-specific data are described in the following
+sections:
 
+\pagebreak
 
-Each NODE_DATA record specifies a single node in xenstore and is formatted
-as follows:
+### END
 
+The end record marks the end of the image, and is the final record
+in the stream.
 
 ```
-    0       1       2       3     octet
-+-------+-------+-------+-------+
-| NODE_DATA                     |
-+-------------------------------+
-| path length                   |
-+-------------------------------+
-| path data                     |
-...
-| pad (0 to 3 octets)           |
-+-------------------------------+
-| perm count (N)                |
-+-------------------------------+
-| perm0                         |
-+-------------------------------+
-...
-+-------------------------------+
-| permN                         |
-+-------------------------------+
-| value length                  |
-+-------------------------------+
-| value data                    |
-...
-| pad (0 to 3 octets)           |
-+-------------------------------+
+    0       1       2       3       4       5       6       7    octet
++-------+-------+-------+-------+-------+-------+-------+-------+
 ```
 
-where perm0..N are formatted as follows:
 
+The end record contains no fields; its body length is 0.
+
+\pagebreak
+
+### GLOBAL_DATA
+
+This record is only relevant for live update. It contains details of global
+xenstored state that needs to be restored.
 
 ```
-    0       1       2       3     octet
+    0       1       2       3    octet
 +-------+-------+-------+-------+
-| perm  | pad   | domid         |
+| rw-socket-fd                  |
++-------------------------------+
+| ro-socket-fd                  |
 +-------------------------------+
 ```
 
 
-path length and value length are specified in octets (excluding the NUL
-terminator of the path). perm should be one of the ASCII values `w`, `r`,
-`b` or `n` as described in [2]. All pad values should be 0.
-All paths should be absolute (i.e. start with `/`) and as described in
-[2].
+| Field          | Description                                  |
+|----------------|----------------------------------------------|
+| `rw-socket-fd` | The file descriptor of the socket accepting  |
+|                | read-write connections                       |
+|                |                                              |
+| `ro-socket-fd` | The file descriptor of the socket accepting  |
+|                | read-only connections                        |
+
+xenstored will resume in the original process context. Hence `rw-socket-fd` and
+`ro-socket-fd` simply specify the file descriptors of the sockets.
 
 
-**WATCH_DATA**
+\pagebreak
 
+### CONNECTION_DATA
 
-Each WATCH_DATA record specifies a registered watch and is formatted as
-follows:
+For live update the image format will contain a `CONNECTION_DATA` record for
+each connection to xenstore. For migration it will only contain a record for
+the domain being migrated.
 
 
 ```
-    0       1       2       3     octet
-+-------+-------+-------+-------+
-| WATCH_DATA                    |
-+-------------------------------+
-| wpath length                  |
-+-------------------------------+
-| wpath data                    |
-...
-| pad (0 to 3 octets)           |
-+-------------------------------+
+    0       1       2       3       4       5       6       7    octet
++-------+-------+-------+-------+-------+-------+-------+-------+
+| conn-id                       | pad                           |
++---------------+-----------------------------------------------+
+| conn-type     | conn-spec
 ...
++-------------------------------+-------------------------------+
+| data-len                      | data
 +-------------------------------+
-| token length                  |
-+-------------------------------+
-| token data                    |
 ...
-| pad (0 to 3 octets)           |
-+-------------------------------+
 ```
 
-wpath length and token length are specified in octets (excluding the NUL
-terminator). The wpath should be as described for the `WATCH` operation in
-[2]. The token is an arbitrary string of octets not containing any NUL
-values.
 
+| Field       | Description                                     |
+|-------------|-------------------------------------------------|
+| `conn-id`   | A non-zero number used to identify this         |
+|             | connection in subsequent connection-specific    |
+|             | records                                         |
+|             |                                                 |
+| `conn-type` | 0x0000: shared ring                             |
+|             | 0x0001: socket                                  |
+|             |                                                 |
+| `conn-spec` | See below                                       |
+|             |                                                 |
+| `data-len`  | The length (in octets) of any pending data not  |
+|             | yet written to the connection                   |
+|             |                                                 |
+| `data`      | Pending data (may be empty)                     |
 
-**TRANSACTION_DATA**
+The format of `conn-spec` is dependent upon `conn-type`.
 
+\pagebreak
 
-Each TRANSACTION_DATA record specifies an open transaction and is formatted
-as follows:
+For `shared ring` connections it is as follows:
 
 
 ```
-    0       1       2       3     octet
-+-------+-------+-------+-------+
-| TRANSACTION_DATA              |
-+-------------------------------+
-| tx_id                         |
-+-------------------------------+
+    0       1       2       3       4       5       6       7    octet
+                +-------+-------+-------+-------+-------+-------+
+                | domid         | tdomid        | flags         |
++---------------+---------------+---------------+---------------+
+| revtchn                       | levtchn                       |
++-------------------------------+-------------------------------+
+| mfn                                                           |
++---------------------------------------------------------------+
 ```
 
-where tx_id is the non-zero identifier values of an open transaction.
-
 
-### Protocol Extension
+| Field      | Description                                      |
+|------------|--------------------------------------------------|
+| `domid`    | The domain-id that owns the shared page          |
+|            |                                                  |
+| `tdomid`   | The domain-id that `domid` acts on behalf of if  |
+|            | it has been subject to an SET_TARGET             |
+|            | operation [2] or DOMID_INVALID otherwise         |
+|            |                                                  |
+| `flags`    | A bit-wise OR of:                                |
+|            | 0x0001: INTRODUCE has been issued                |
+|            | 0x0002: RELEASE has been issued                  |
+|            |                                                  |
+| `revtchn`  | The port number of the interdomain channel used  |
+|            | by `domid` to communicate with xenstored         |
+|            |                                                  |
+| `levtchn`  | For a live update this will be the port number   |
+|            | of the interdomain channel used by xenstored     |
+|            | itself otherwise, for migration, it will be -1   |
+|            |                                                  |
+| `mfn`      | The MFN of the shared page for a live update or  |
+|            | INVALID_MFN otherwise                            |
+
+Since the ABI guarantees that entry 1 in `domid`'s grant table will always
+contain the GFN of the shared page, so for a live update `mfn` can be used to
+give confidence that `domid` has not been re-cycled during the update.
+
+
+For `socket` connections it is as follows:
 
-Before xenstore state is migrated it is necessary to wait for any pending
-reads, writes, watch registrations etc. to complete, and also to make sure
-that xenstored does not start processing any new requests (so that new
-requests remain pending on the shared ring for subsequent processing on the
-new host). Hence the following operation is needed:
 
 ```
-QUIESCE                 <domid>|
-
-Complete processing of any request issued by the specified domain, and
-do not process any further requests from the shared ring.
+    0       1       2       3       4       5       6       7    octet
+                +-------+-------+-------+-------+-------+-------+
+                | flags         | socket-fd                     |
+                +---------------+-------------------------------+
 ```
 
-The `WATCH` operation does not allow specification of a `<domid>`; it is
-assumed that the watch pertains to the domain that owns the shared ring
-over which the operation is passed. Hence, for the tool-stack to be able
-to register a watch on behalf of a domain a new operation is needed:
 
-```
-ADD_DOMAIN_WATCHES      <domid>|<watch>|+
+| Field       | Description                                     |
+|-------------|-------------------------------------------------|
+| `flags`     | A bit-wise OR of:                               |
+|             | 0001: read-only                                 |
+|             |                                                 |
+| `socket-fd` | The file descriptor of the connected socket     |
 
-Adds watches on behalf of the specified domain.
+This type of connection is only relevant for live update, where the xenstored
+resumes in the original process context. Hence `socket-fd` simply specify
+the file descriptor of the socket connection.
 
-<watch> is a NUL separated tuple of <path>|<token>. The semantics of this
-operation are identical to the domain issuing WATCH <path>|<token>| for
-each <watch>.
-```
+\pagebreak
+
+### WATCH_DATA
+
+The image format will contain a `WATCH_DATA` record for each watch registered
+by a connection for which there is `CONNECTION_DATA` record previously present.
 
-The watch information for a domain also needs to be extracted from the
-sending xenstored so the following operation is also needed:
 
 ```
-GET_DOMAIN_WATCHES      <domid>|<index>   <gencnt>|<watch>|*
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
 
-Gets the list of watches that are currently registered for the domain.
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
+### TRANSACTION_DATA
+
+The image format will contain a `TRANSACTION_DATA` record for each transaction
+that is pending on a connection for which there is `CONNECTION_DATA` record
+previously present.
 
-<watch> is a NUL separated tuple of <path>|<token>. The sub-list returned
-will start at <index> items into the the overall list of watches and may
-be truncated (at a <watch> boundary) such that the returned data fits
-within XENSTORE_PAYLOAD_MAX.
 
-If <index> is beyond the end of the overall list then the returned sub-
-list will be empty. If the value of <gencnt> changes then it indicates
-that the overall watch list has changed and thus it may be necessary
-to re-issue the operation for previous values of <index>.
 ```
+    0       1       2       3    octet
++-------+-------+-------+-------+
+| conn-id                       |
++-------------------------------+
+| tx-id                         |
++-------------------------------+
+```
+
+
+| Field          | Description                                  |
+|----------------|----------------------------------------------|
+| `conn-id`      | The connection that issued the               |
+|                | `TRANSACTION_START` operation [2]            |
+|                |                                              |
+| `tx-id`        | The transaction id passed back to the domain |
+|                | by the `TRANSACTION_START` operation         |
+
+\pagebreak
 
-To deal with transactions that were pending when the domain is migrated
-it is necessary to start transactions with the same tx_id on behalf of the
-domain in the receiving xenstored.
+### NODE_DATA
 
-NOTE: For safety each such transaction should result in an `EAGAIN` when
-the `TRANSACTION_END` operation is performed, as modifications made under
-the tx_id will not be part of the migration stream.
+For live update the image format will contain a `NODE_DATA` record for each
+node in xenstore. For migration it will only contain a record for the nodes
+relating to the domain being migrated. The `NODE_DATA` may be related to
+a _committed_ node (globally visible in xenstored) or a _pending_ node (created
+or modified by a transaction for which there is also a `TRANSACTION_DATA`
+record previously present).
 
-The `TRANSACTION_START` operation does not allow specification of a
-`<domid>`; it is assumed that the transaction pertains to the domain that
-owns the shared ring over which the operation is passed. Neither does it
-allow a `<transid>` to be specified; it is always chosen by xenstored.
-Hence, for the tool-stack to be able to open a transaction on behalf of a
-domain a new operation is needed:
 
 ```
-START_DOMAIN_TRANSACTION    <domid>|<transid>|
+    0       1       2       3    octet
++-------+-------+-------+-------+
+| conn-id                       |
++-------------------------------+
+| tx-id                         |
++---------------+---------------+
+| access        | perm-count    |
++---------------+---------------+
+| perm1                         |
++-------------------------------+
+...
++-------------------------------+
+| permN                         |
++---------------+---------------+
+| path-len      | value-len     |
++---------------+---------------+
+| path
+...
+| value
+...
+```
+
+
+| Field        | Description                                    |
+|--------------|------------------------------------------------|
+| `conn-id`    | If this value is non-zero then this record     |
+|              | related to a pending transaction               |
+|              |                                                |
+| `tx-id`      | This value should be ignored if `conn-id` is   |
+|              | zero. Otherwise it specifies the id of the     |
+|              | pending transaction                            |
+|              |                                                |
+| `access`     | This value should be ignored if this record    |
+|              | does not relate to a pending transaction,      |
+|              | otherwise it specifies the accesses made to    |
+|              | the node and hence is a bitwise OR of:         |
+|              |                                                |
+|              | 0x0001: read                                   |
+|              | 0x0002: written                                |
+|              |                                                |
+|              | The value will be zero for a deleted node      |
+|              |                                                |
+| `perm-count` | The number (N) of node permission specifiers   |
+|              | (which will be 0 for a node deleted in a       |
+|              | pending transaction)                           |
+|              |                                                |
+| `perm1..N`   | A list of zero or more node permission         |
+|              | specifiers (see below)                         |
+|              |                                                |
+| `path-len`   | The length (in octets) of `path` including the |
+|              | NUL terminator                                 |
+|              |                                                |
+| `value-len`  | The length (in octets) of `value` (which will  |
+|              | be zero for a deleted node)                    |
+|              |                                                |
+| `path`       | The absolute path of the node                  |
+|              |                                                |
+| `value`      | The node value (which may be empty or contain  |
+|              | NUL octets)                                    |
+
+
+A node permission specifier has the following format:
 
-Starts a transaction on behalf of a domain.
 
-The semantics of this are similar to the domain issuing
-TRANSACTION_START and receiving the specified <transid> as the response.
-The main difference is that the transaction will be immediately marked as
-'conflicting' such that when the domain issues TRANSACTION_END T|, it will
-result in EAGAIN.
+```
+    0       1       2       3    octet
++-------+-------+-------+-------+
+| perm  | pad   | domid         |
++-------+-------+---------------+
 ```
 
-It may also be desirable to state in the protocol specification that
-the `INTRODUCE` operation should not clear the `<gfn>` specified such that
-a `RELEASE` operation followed by an `INTRODUCE` operation form an
-idempotent pair. The current implementation of *C xentored* does this
-(in the `domain_conn_reset()` function) but this could be dropped as this
-behaviour is not currently specified and the page will always be zeroed
-for a newly created domain.
+| Field   | Description                                         |
+|---------|-----------------------------------------------------|
+| `perm`  | One of the ASCII values `w`, `r`, `b` or `n` as     |
+|         | specified for the `SET_PERMS` operation [2]         |
+|         |                                                     |
+| `domid` | The domain-id to which the permission relates       |
 
 
 * * *
 
 [1] See https://xenbits.xen.org/gitweb/?p=xen.git;a=blob;f=docs/designs/non-cooperative-migration.md
+
 [2] See https://xenbits.xen.org/gitweb/?p=xen.git;a=blob;f=docs/misc/xenstore.txt
-[3] See https://xenbits.xen.org/gitweb/?p=xen.git;a=blob;f=docs/specs/libxl-migration-stream.pandoc
-- 
2.17.1


