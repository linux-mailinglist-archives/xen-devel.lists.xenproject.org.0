Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F019A680835
	for <lists+xen-devel@lfdr.de>; Mon, 30 Jan 2023 10:10:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.486665.754089 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pMQAZ-0002PV-1l; Mon, 30 Jan 2023 09:09:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 486665.754089; Mon, 30 Jan 2023 09:09:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pMQAY-0002NE-Uu; Mon, 30 Jan 2023 09:09:42 +0000
Received: by outflank-mailman (input) for mailman id 486665;
 Mon, 30 Jan 2023 09:09:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ZQwi=53=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1pMQAY-0002JU-5l
 for xen-devel@lists.xenproject.org; Mon, 30 Jan 2023 09:09:42 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d3632d01-a07d-11ed-b8d1-410ff93cb8f0;
 Mon, 30 Jan 2023 10:09:39 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 535631FDF5;
 Mon, 30 Jan 2023 09:09:39 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 12CCB13A06;
 Mon, 30 Jan 2023 09:09:39 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id nwJLA1OJ12MwYgAAMHmgww
 (envelope-from <jgross@suse.com>); Mon, 30 Jan 2023 09:09:39 +0000
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
X-Inumbo-ID: d3632d01-a07d-11ed-b8d1-410ff93cb8f0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1675069779; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=ynzLcV94eyF20Xb/k83uxhmZy0ZHoXN+ElyJrQSwXnE=;
	b=Rlx7wGyQJ+zXIa0b/SlBBw44w4e11D4Kmb+vWVQhEy8oDKF8vr0N32sNmR+ixl7LRIVbRg
	zrf415SvccihsBR1BR2+icGcKuCN4EpqF2wqGU5bQD0ju0Z9wkT6ryTDUd94f2TafCboBj
	2GzTKt7an0yaEJBCZHgIv9PEdwxFQcs=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v3] xen/public: move xenstore related doc into 9pfs.h
Date: Mon, 30 Jan 2023 10:09:37 +0100
Message-Id: <20230130090937.31623-1-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Xenstore related documentation is currently to be found in
docs/misc/9pfs.pandoc, instead of the related header file
xen/include/public/io/9pfs.h like for most other paravirtualized
device protocols.

There is a comment in the header pointing at the document, but the
given file name is wrong. Additionally such headers are meant to be
copied into consuming projects (Linux kernel, qemu, etc.), so pointing
at a doc file in the Xen git repository isn't really helpful for the
consumers of the header.

This situation is far from ideal, which is already being proved by the
fact that neither qemu nor the Linux kernel are implementing the
device attach/detach protocol correctly. Additionally the documented
Xenstore entries are not matching the reality, as the "tag" Xenstore
entry is on the frontend side, not on the backend one.

There is another bug in the connection sequence: the frontend needs to
wait for the backend to have published its features before being able
to allocate its rings and event-channels.

Change that by moving the Xenstore related 9pfs documentation from
docs/misc/9pfs.pandoc into xen/include/public/io/9pfs.h while fixing
the wrong Xenstore entry detail and the connection sequence.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
V2:
- add reference to header in the pandoc document (Jan Beulich)
V3:
- fix flaw in the connection sequence
---
 docs/misc/9pfs.pandoc        | 153 +-----------------------------
 xen/include/public/io/9pfs.h | 178 ++++++++++++++++++++++++++++++++++-
 2 files changed, 181 insertions(+), 150 deletions(-)

diff --git a/docs/misc/9pfs.pandoc b/docs/misc/9pfs.pandoc
index b034fb5fa6..5c82625040 100644
--- a/docs/misc/9pfs.pandoc
+++ b/docs/misc/9pfs.pandoc
@@ -59,155 +59,10 @@ This document does not cover the 9pfs client/server design or
 implementation, only the transport for it.
 
 
-## Xenstore
+## Configuration
 
-The frontend and the backend connect via xenstore to exchange
-information. The toolstack creates front and back nodes with state
-[XenbusStateInitialising]. The protocol node name is **9pfs**.
-
-Multiple rings are supported for each frontend and backend connection.
-
-### Backend XenBus Nodes
-
-Backend specific properties, written by the backend, read by the
-frontend:
-
-    versions
-         Values:         <string>
-
-         List of comma separated protocol versions supported by the backend.
-         For example "1,2,3". Currently the value is just "1", as there is
-         only one version. N.B.: this is the version of the Xen trasport
-         protocol, not the version of 9pfs supported by the server.
-
-    max-rings
-         Values:         <uint32_t>
-
-         The maximum supported number of rings per frontend.
-
-    max-ring-page-order
-         Values:         <uint32_t>
-
-         The maximum supported size of a memory allocation in units of
-         log2n(machine pages), e.g. 1 = 2 pages, 2 == 4 pages, etc. It
-         must be at least 1.
-
-Backend configuration nodes, written by the toolstack, read by the
-backend:
-
-    path
-         Values:         <string>
-
-         Host filesystem path to share.
-
-    tag
-         Values:         <string>
-
-         Alphanumeric tag that identifies the 9pfs share. The client needs
-         to know the tag to be able to mount it.
-
-    security-model
-         Values:         "none"
-
-         *none*: files are stored using the same credentials as they are
-                 created on the guest (no user ownership squash or remap)
-         Only "none" is supported in this version of the protocol.
-
-### Frontend XenBus Nodes
-
-    version
-         Values:         <string>
-
-         Protocol version, chosen among the ones supported by the backend
-         (see **versions** under [Backend XenBus Nodes]). Currently the
-         value must be "1".
-
-    num-rings
-         Values:         <uint32_t>
-
-         Number of rings. It needs to be lower or equal to max-rings.
-
-    event-channel-<num> (event-channel-0, event-channel-1, etc)
-         Values:         <uint32_t>
-
-         The identifier of the Xen event channel used to signal activity
-         in the ring buffer. One for each ring.
-
-    ring-ref<num> (ring-ref0, ring-ref1, etc)
-         Values:         <uint32_t>
-
-         The Xen grant reference granting permission for the backend to
-         map a page with information to setup a share ring. One for each
-         ring.
-
-### State Machine
-
-Initialization:
-
-    *Front*                               *Back*
-    XenbusStateInitialising               XenbusStateInitialising
-    - Query virtual device                - Query backend device
-      properties.                           identification data.
-    - Setup OS device instance.           - Publish backend features
-    - Allocate and initialize the           and transport parameters
-      request ring.                                      |
-    - Publish transport parameters                       |
-      that will be in effect during                      V
-      this connection.                            XenbusStateInitWait
-                 |
-                 |
-                 V
-       XenbusStateInitialised
-
-                                          - Query frontend transport parameters.
-                                          - Connect to the request ring and
-                                            event channel.
-                                                         |
-                                                         |
-                                                         V
-                                                 XenbusStateConnected
-
-     - Query backend device properties.
-     - Finalize OS virtual device
-       instance.
-                 |
-                 |
-                 V
-        XenbusStateConnected
-
-Once frontend and backend are connected, they have a shared page per
-ring, which are used to setup the rings, and an event channel per ring,
-which are used to send notifications.
-
-Shutdown:
-
-    *Front*                            *Back*
-    XenbusStateConnected               XenbusStateConnected
-                |
-                |
-                V
-       XenbusStateClosing
-
-                                       - Unmap grants
-                                       - Unbind evtchns
-                                                 |
-                                                 |
-                                                 V
-                                         XenbusStateClosing
-
-    - Unbind evtchns
-    - Free rings
-    - Free data structures
-               |
-               |
-               V
-       XenbusStateClosed
-
-                                       - Free remaining data structures
-                                                 |
-                                                 |
-                                                 V
-                                         XenbusStateClosed
+The frontend and backend are configured via Xenstore. See [header] for
+the detailed Xenstore entries and the connection protocol.
 
 
 ## Ring Setup
@@ -415,5 +270,5 @@ the *size* field of the 9pfs header.
 
 [paper]: https://www.usenix.org/legacy/event/usenix05/tech/freenix/full_papers/hensbergen/hensbergen.pdf
 [website]: https://github.com/chaos/diod/blob/master/protocol.md
-[XenbusStateInitialising]: https://xenbits.xen.org/docs/unstable/hypercall/x86_64/include,public,io,xenbus.h.html
+[header]: https://xenbits.xen.org/gitweb/?p=xen.git;a=blob;f=xen/include/public/io/9pfs.h;hb=HEAD
 [ring.h]: https://xenbits.xen.org/gitweb/?p=xen.git;a=blob;f=xen/include/public/io/ring.h;hb=HEAD
diff --git a/xen/include/public/io/9pfs.h b/xen/include/public/io/9pfs.h
index ad26bd69eb..88c131820b 100644
--- a/xen/include/public/io/9pfs.h
+++ b/xen/include/public/io/9pfs.h
@@ -14,9 +14,185 @@
 #include "ring.h"
 
 /*
- * See docs/misc/9pfs.markdown in xen.git for the full specification:
+ * See docs/misc/9pfs.pandoc in xen.git for the full specification:
  * https://xenbits.xen.org/docs/unstable/misc/9pfs.html
  */
+
+/*
+ ******************************************************************************
+ *                                  Xenstore
+ ******************************************************************************
+ *
+ * The frontend and the backend connect via xenstore to exchange
+ * information. The toolstack creates front and back nodes with state
+ * XenbusStateInitialising. The protocol node name is **9pfs**.
+ *
+ * Multiple rings are supported for each frontend and backend connection.
+ *
+ ******************************************************************************
+ *                            Backend XenBus Nodes
+ ******************************************************************************
+ *
+ * Backend specific properties, written by the backend, read by the
+ * frontend:
+ *
+ *    versions
+ *         Values:         <string>
+ *
+ *         List of comma separated protocol versions supported by the backend.
+ *         For example "1,2,3". Currently the value is just "1", as there is
+ *         only one version. N.B.: this is the version of the Xen transport
+ *         protocol, not the version of 9pfs supported by the server.
+ *
+ *    max-rings
+ *         Values:         <uint32_t>
+ *
+ *         The maximum supported number of rings per frontend.
+ *
+ *    max-ring-page-order
+ *         Values:         <uint32_t>
+ *
+ *         The maximum supported size of a memory allocation in units of
+ *         log2n(machine pages), e.g. 1 = 2 pages, 2 == 4 pages, etc. It
+ *         must be at least 1.
+ *
+ * Backend configuration nodes, written by the toolstack, read by the
+ * backend:
+ *
+ *    path
+ *         Values:         <string>
+ *
+ *         Host filesystem path to share.
+ *
+ *    security-model
+ *         Values:         "none"
+ *
+ *         *none*: files are stored using the same credentials as they are
+ *                 created on the guest (no user ownership squash or remap)
+ *         Only "none" is supported in this version of the protocol.
+ *
+ ******************************************************************************
+ *                            Frontend XenBus Nodes
+ ******************************************************************************
+ *
+ *    version
+ *         Values:         <string>
+ *
+ *         Protocol version, chosen among the ones supported by the backend
+ *         (see **versions** under [Backend XenBus Nodes]). Currently the
+ *         value must be "1".
+ *
+ *    num-rings
+ *         Values:         <uint32_t>
+ *
+ *         Number of rings. It needs to be lower or equal to max-rings.
+ *
+ *    event-channel-<num> (event-channel-0, event-channel-1, etc)
+ *         Values:         <uint32_t>
+ *
+ *         The identifier of the Xen event channel used to signal activity
+ *         in the ring buffer. One for each ring.
+ *
+ *    ring-ref<num> (ring-ref0, ring-ref1, etc)
+ *         Values:         <uint32_t>
+ *
+ *         The Xen grant reference granting permission for the backend to
+ *         map a page with information to setup a share ring. One for each
+ *         ring.
+ *
+ *    tag
+ *         Values:         <string>
+ *
+ *         Alphanumeric tag that identifies the 9pfs share. The client needs
+ *         to know the tag to be able to mount it.
+ *
+ ******************************************************************************
+ *                              State Machine
+ ******************************************************************************
+ *
+ * Initialization:
+ *
+ *    *Front*                               *Back*
+ *    XenbusStateInitialising               XenbusStateInitialising
+ *                                          - Query backend device
+ *                                            identification data.
+ *                                          - Publish backend features
+ *                                            and transport parameters.
+ *                                                         |
+ *                                                         |
+ *                                                         V
+ *                                                  XenbusStateInitWait
+ *
+ *    - Query virtual device
+ *      properties.
+ *    - Query backend features and
+ *      transport parameters.
+ *    - Setup OS device instance.
+ *    - Allocate and initialize the
+ *      request ring(s) and
+ *      event-channel(s).
+ *    - Publish transport parameters
+ *      that will be in effect during
+ *      this connection.
+ *                 |
+ *                 |
+ *                 V
+ *       XenbusStateInitialised
+ *
+ *                                          - Query frontend transport
+ *                                            parameters.
+ *                                          - Connect to the request ring(s)
+ *                                            and event channel(s).
+ *                                                         |
+ *                                                         |
+ *                                                         V
+ *                                                 XenbusStateConnected
+ *
+ *     - Query backend device properties.
+ *     - Finalize OS virtual device
+ *       instance.
+ *                 |
+ *                 |
+ *                 V
+ *        XenbusStateConnected
+ *
+ * Once frontend and backend are connected, they have a shared page per
+ * ring, which are used to setup the rings, and an event channel per ring,
+ * which are used to send notifications.
+ *
+ * Shutdown:
+ *
+ *    *Front*                            *Back*
+ *    XenbusStateConnected               XenbusStateConnected
+ *                |
+ *                |
+ *                V
+ *       XenbusStateClosing
+ *
+ *                                       - Unmap grants
+ *                                       - Unbind evtchns
+ *                                                 |
+ *                                                 |
+ *                                                 V
+ *                                         XenbusStateClosing
+ *
+ *    - Unbind evtchns
+ *    - Free rings
+ *    - Free data structures
+ *               |
+ *               |
+ *               V
+ *       XenbusStateClosed
+ *
+ *                                       - Free remaining data structures
+ *                                                 |
+ *                                                 |
+ *                                                 V
+ *                                         XenbusStateClosed
+ *
+ ******************************************************************************
+ */
+
 DEFINE_XEN_FLEX_RING_AND_INTF(xen_9pfs);
 
 #endif
-- 
2.35.3


