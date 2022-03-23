Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CC6D4E558B
	for <lists+xen-devel@lfdr.de>; Wed, 23 Mar 2022 16:44:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.293936.499532 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nX38n-0006ya-DL; Wed, 23 Mar 2022 15:43:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 293936.499532; Wed, 23 Mar 2022 15:43:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nX38n-0006wH-AB; Wed, 23 Mar 2022 15:43:17 +0000
Received: by outflank-mailman (input) for mailman id 293936;
 Wed, 23 Mar 2022 15:43:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pbLi=UC=arm.com=rahul.singh@srs-se1.protection.inumbo.net>)
 id 1nX38l-0006wB-Ex
 for xen-devel@lists.xenproject.org; Wed, 23 Mar 2022 15:43:15 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id f2de4a28-aabf-11ec-8fbc-03012f2f19d4;
 Wed, 23 Mar 2022 16:43:13 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BB840D6E;
 Wed, 23 Mar 2022 08:43:12 -0700 (PDT)
Received: from e109506.cambridge.arm.com (e109506.cambridge.arm.com
 [10.1.199.62])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8B50A3F73D;
 Wed, 23 Mar 2022 08:43:11 -0700 (PDT)
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
X-Inumbo-ID: f2de4a28-aabf-11ec-8fbc-03012f2f19d4
From: Rahul Singh <rahul.singh@arm.com>
To: xen-devel@lists.xenproject.org
Cc: bertrand.marquis@arm.com,
	rahul.singh@arm.com,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH] xen/evtchn: Add design for static event channel signaling for domUs..
Date: Wed, 23 Mar 2022 15:43:03 +0000
Message-Id: <4836304496e6fbbea41348ed8cc9fcf6b0f3e893.1648049827.git.rahul.singh@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

in dom0less system. This patch introduce the new feature to support the
signaling between two domUs in dom0less system.

Signed-off-by: Rahul Singh <rahul.singh@arm.com>
---
 docs/designs/dom0less-evtchn.md | 96 +++++++++++++++++++++++++++++++++
 1 file changed, 96 insertions(+)
 create mode 100644 docs/designs/dom0less-evtchn.md

diff --git a/docs/designs/dom0less-evtchn.md b/docs/designs/dom0less-evtchn.md
new file mode 100644
index 0000000000..6a1b7e8c22
--- /dev/null
+++ b/docs/designs/dom0less-evtchn.md
@@ -0,0 +1,96 @@
+# Signaling support between two domUs on dom0less system
+
+## Current state: Draft version
+
+## Proposer(s): Rahul Singh, Bertrand Marquis
+
+## Problem Statement:
+
+The goal of this work is to define a simple signaling system between Xen guests
+in dom0less systems.
+
+In dom0less system, we cannot make use of xenbus and xenstore that are used in
+normal systems with dynamic VMs to communicate between domains by providing a
+bus abstraction for paravirtualized drivers.
+
+One possible solution to implement the signaling system between domUs is based
+on event channels.
+
+## Proposal:
+
+Event channels are the basic primitive provided by Xen for event notifications.
+An event channel is a logical connection between 2 domains (more specifically
+between dom1,port1 and dom2,port2). They essentially store one bit of
+information, the event of interest is signalled by transitioning this bit from
+0 to 1. An event is an equivalent of a hardware interrupt.
+
+Notifications are received by a guest via an interrupt from Xen to the guest,
+indicating when an event arrives (setting the bit). Further notifications are
+masked until the bit is cleared again. When a domain wants to wait for data it
+will block until an event arrives, and then send an event to signal that data
+has been consumed. Events are delivered asynchronously to guests and are
+enqueued when the guest is not running.
+
+Event channel communication will be established statically between two domU
+guests before unpausing the domains after domain creation. Event channel
+connection information between domUs will be passed to XEN via device tree
+node.
+
+Under the /chosen node, there needs to be sub nodes with compatible
+"xen,evtchn" that descibes the event channel connection between two domUs.
+
+The event channel sub-node has the following properties:
+
+- compatible
+
+    "xen,evtchn"
+
+- xen,evtchn
+
+    The property is four numbers of tuples of
+    (local-port-domU1,domU1-phandle,local-port-domU2,domU2-phandle) where:
+
+    local-port-domU1 is an integer value that will be used to allocte local
+    port for domU1 to send an event notification to the remote domain.
+
+    domU1-phandle is a single phandle to an domain to which local-port-domU1
+    will be allocated.
+
+    local-port-domU2 is an integer value that will be used to allocte local
+    port for domU2 to send an event notification to the remote domain.
+
+    domU2-phandle is a single phandle to an domain to which local-port-domU2
+    will be allocated.
+
+Example:
+
+    chosen {
+        ....
+
+        domU1: domU1 {
+            ......
+        };
+
+        domU2: domU2 {
+            ......
+        };
+
+        evtchn@1 {
+            compatible = "xen,evtchn";
+            xen,evtchn = <0xa &domU1 0xb &domU2>;
+        };
+
+        evtchn@2 {
+            compatible = "xen,evtchn";
+            xen,evtchn = <0xc &domU1 0xd &domU2>;
+        };
+    };
+
+In above example two event channel comunication will be established between
+domU1 and domU2.
+
+    domU1 (port 0xa) <-----------------> domU2 (port 0xb)
+    domU1 (port 0xc) <-----------------> domU2 (port 0xd)
+
+domU1 and domU2 can send the signal to remote domain via hypercall
+EVTCHNOP_send(.) on local port.
-- 
2.25.1


