Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 12DBF5264E4
	for <lists+xen-devel@lfdr.de>; Fri, 13 May 2022 16:39:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.328548.551601 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1npWRp-0002BZ-Aq; Fri, 13 May 2022 14:39:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 328548.551601; Fri, 13 May 2022 14:39:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1npWRp-00029l-7o; Fri, 13 May 2022 14:39:17 +0000
Received: by outflank-mailman (input) for mailman id 328548;
 Fri, 13 May 2022 14:39:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=m4UN=VV=arm.com=rahul.singh@srs-se1.protection.inumbo.net>)
 id 1npWRn-00029d-UO
 for xen-devel@lists.xenproject.org; Fri, 13 May 2022 14:39:15 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id 755d8d63-d2ca-11ec-aa76-f101dd46aeb6;
 Fri, 13 May 2022 16:39:14 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 23E88113E;
 Fri, 13 May 2022 07:39:13 -0700 (PDT)
Received: from e109506.cambridge.arm.com (e109506.cambridge.arm.com
 [10.1.199.62])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D85F93F5A1;
 Fri, 13 May 2022 07:39:11 -0700 (PDT)
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
X-Inumbo-ID: 755d8d63-d2ca-11ec-aa76-f101dd46aeb6
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
Subject: [PATCH v3] xen/evtchn: Add design for static event channel signaling
Date: Fri, 13 May 2022 15:38:57 +0100
Message-Id: <bb77b88185e26010d0502ce38940d2d5f7d28464.1652452306.git.rahul.singh@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This patch introduces a new feature to support the signaling between
two domains in dom0less system.

Signed-off-by: Rahul Singh <rahul.singh@arm.com>
---
v3 changes:
- add dt node example for dom0 and domU.
- add info about "xen,enhanced" property to enable the event-channel interface
  for domU guests.

v2 changes:
- switch to the one-subnode-per-evtchn under xen,domain" compatible node.
- Add more detail about event-channel.
---
 docs/designs/dom0less-evtchn.md | 144 ++++++++++++++++++++++++++++++++
 1 file changed, 144 insertions(+)
 create mode 100644 docs/designs/dom0less-evtchn.md

diff --git a/docs/designs/dom0less-evtchn.md b/docs/designs/dom0less-evtchn.md
new file mode 100644
index 0000000000..3c89a9fb7d
--- /dev/null
+++ b/docs/designs/dom0less-evtchn.md
@@ -0,0 +1,144 @@
+# Signaling support between two domUs on dom0less system
+
+## Current state: Draft version
+
+## Proposer(s): Rahul Singh, Bertrand Marquis
+
+## Problem Statement:
+
+Dom0less guests would benefit from a statically-defined memory sharing and
+signally system for communication. One that would be immediately available at
+boot without any need for dynamic configurations.
+
+In embedded a great variety of guest operating system kernels exist, many of
+which don't have support for xenstore, grant table, or other complex drivers.
+Some of them are small kernel-space applications (often called "baremetal",
+not to be confused with the term "baremetal" used in the data center which
+means "without hypervisors") or RTOSes. Additionally, for safety reasons, users
+often need to be able to configure the full system statically so that it can
+be verified statically.
+
+Event channels are very simple and can be added even to baremetal applications.
+This proposal introduces a way to define them statically to make them suitable
+for dom0less embedded deployments.
+
+## Proposal:
+
+Event channels are the basic primitive provided by Xen for event notifications.
+An event channel is a logical connection between 2 domains (more specifically
+between dom1,port1, and dom2,port2). Each event has a pending and a masked bit.
+The pending bit indicates the event has been raised. The masked bit is used by
+the domain to prevent the delivery of that specific event. Xen only performs a
+0 -> 1 transition on the pending bits and does not touch the mask bit. The
+domain may toggle masked bits in the masked bit field and should clear the
+pending bit when an event has been processed
+
+Events are received by a domain via an interrupt from Xen to the domain,
+indicating when an event arrives (setting the bit). Further notifications are
+blocked until the bit is cleared again. Events are delivered asynchronously to
+a domain and are enqueued when the domain is not running. Xen supports two
+different ABIs for event channel: FIFO and 2L.
+
+The event channel communication will be established statically between two
+domains (dom0 and domU also) before unpausing the domains after domain creation.
+Event channel connection information between domains will be passed to Xen via
+the device tree node. The event channel will be created and established
+in Xen before the domain started. The domain doesn’t need to do any operation
+to establish a connection. Domain only needs hypercall
+EVTCHNOP_send(local port) to send notifications to the remote guest.
+
+There is no need to describe the static event channel info in the domU device
+tree. Static event channels are only useful in fully static configurations,
+and in those configurations the domU device tree dynamically generated by Xen
+is not needed.
+
+To enable the event-channel interface for domU guests include the
+"xen,enhanced" property with an empty string ( or with the value
+"enabled” or "evtchn") in domU Xen device tree node.
+
+Under the "xen,domain" compatible node, there need to be sub-nodes with
+compatible "xen,evtchn" that describe the event channel connection between two
+domains(dom0 and domU also).
+
+The event channel sub-node has the following properties:
+
+- compatible
+
+    "xen,evtchn"
+
+- xen,evtchn
+
+    The property is tuples of two numbers
+    (local-evtchn link-to-foreign-evtchn) where:
+
+    local-evtchn is an integer value that will be used to allocate local port
+    for a domain to send and receive event notifications to/from the remote
+    domain. Maximum supported value is 2^17 for FIFO ABI and 4096 for 2L ABI.
+
+    link-to-foreign-evtchn is a single phandle to a foreign evtchn to which
+    local-evtchn will be connected.
+
+
+Example:
+
+    chosen {
+        ....
+
+        module@0 {
+            compatible = "multiboot,kernel", "multiboot,module";
+            xen,uefi-binary = "...";
+            bootargs = "...";
+
+            /* one sub-node per local event channel */
+            ec1: evtchn@1 {
+                compatible = "xen,evtchn-v1";
+                /* local-evtchn link-to-foreign-evtchn */
+                xen,evtchn = <0xa &ec2>;
+            };
+        };
+
+        domU1: domU1 {
+            compatible = "xen,domain";
+
+            /* one sub-node per local event channel */
+            ec2: evtchn@2 {
+                compatible = "xen,evtchn-v1";
+                /* local-evtchn link-to-foreign-evtchn */
+                xen,evtchn = <0xa &ec1>;
+            };
+
+            ec3: evtchn@3 {
+                compatible = "xen,evtchn-v1";
+                xen,evtchn = <0xb &ec5>;
+            };
+
+            ec4: evtchn@4 {
+                compatible = "xen,evtchn-v1";
+                xen,evtchn = <0xc &ec6>;
+            };
+            ....
+        };
+
+        domU2: domU2 {
+            compatible = "xen,domain";
+
+            /* one sub-node per local event channel */
+            ec5: evtchn@5 {
+                compatible = "xen,evtchn-v1";
+                /* local-evtchn link-to-foreign-evtchn */
+                xen,evtchn = <0xa &ec3>;
+            };
+
+            ec6: evtchn@6 {
+                compatible = "xen,evtchn-v1";
+                xen,evtchn = <0xb &ec4>;
+            };
+            ....
+        };
+    };
+
+In above example three event channel comunications will be established:
+
+    dom0  (port 0xa) <-----------------> domU1 (port 0xa)
+    domU1 (port 0xb) <-----------------> domU2 (port 0xa)
+    domU1 (port 0xc) <-----------------> domU2 (port 0xb)
-- 
2.25.1


