Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CE3DA51AAF8
	for <lists+xen-devel@lfdr.de>; Wed,  4 May 2022 19:35:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.320950.541934 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nmItj-0002Fh-M1; Wed, 04 May 2022 17:34:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 320950.541934; Wed, 04 May 2022 17:34:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nmItj-0002DZ-Hg; Wed, 04 May 2022 17:34:47 +0000
Received: by outflank-mailman (input) for mailman id 320950;
 Wed, 04 May 2022 17:34:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mWz8=VM=arm.com=rahul.singh@srs-se1.protection.inumbo.net>)
 id 1nmIth-0002DT-Q2
 for xen-devel@lists.xenproject.org; Wed, 04 May 2022 17:34:45 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id 7c2347b9-cbd0-11ec-8fc4-03012f2f19d4;
 Wed, 04 May 2022 19:34:44 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 629991042;
 Wed,  4 May 2022 10:34:43 -0700 (PDT)
Received: from e109506.cambridge.arm.com (e109506.cambridge.arm.com
 [10.1.199.62])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 22FB93FA27;
 Wed,  4 May 2022 10:34:42 -0700 (PDT)
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
X-Inumbo-ID: 7c2347b9-cbd0-11ec-8fc4-03012f2f19d4
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
Subject: [PATCH v2] xen/evtchn: Add design for static event channel signaling
Date: Wed,  4 May 2022 18:34:32 +0100
Message-Id: <10d83478f116c923271a6c2f7d413f6ec117598d.1651685393.git.rahul.singh@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=y
Content-Transfer-Encoding: 8bit

This patch introduces a new feature to support the signaling between
two domains in dom0less system.

Signed-off-by: Rahul Singh <rahul.singh@arm.com>
---
v2 changes:
- switch to the one-subnode-per-evtchn under xen,domain" compatible node.
- Add more detail about event-channel 
---
 docs/designs/dom0less-evtchn.md | 126 ++++++++++++++++++++++++++++++++
 1 file changed, 126 insertions(+)
 create mode 100644 docs/designs/dom0less-evtchn.md

diff --git a/docs/designs/dom0less-evtchn.md b/docs/designs/dom0less-evtchn.md
new file mode 100644
index 0000000000..62ec8a4009
--- /dev/null
+++ b/docs/designs/dom0less-evtchn.md
@@ -0,0 +1,126 @@
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
+0 → 1 transition on the pending bits and does not touch the mask bit. The
+domain may toggle masked bits in the masked bit field and should clear the
+pending bit when an event has been processed
+
+Events are received by a domain via an interrupt from Xen to the domain,
+indicating when an event arrives (setting the bit). Further notifications are
+blocked until the bit is cleared again. Events are delivered asynchronously to
+a domain and are enqueued when the domain is not running.
+More information about FIFO based event channel can be found at:
+https://xenbits.xen.org/people/dvrabel/event-channels-H.pdf
+
+The event channel communication will be established statically between two
+domains (dom0 and domU also) before unpausing the domains after domain creation.
+Event channel connection information between domains will be passed to XEN via
+the device tree node. The event channel will be created and established
+beforehand in XEN before the domain started. The domain doesn’t need to do any
+operation to establish a connection. Domain only needs hypercall
+EVTCHNOP_send(local port) to send notifications to the remote guest.
+
+There is no need to describe the static event channel info in the domU device
+tree. Static event channels are only useful in fully static configurations,
+and in those configurations the domU device tree dynamically generated by Xen
+is not needed.
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
+    domain.
+
+    link-to-foreign-evtchn is a single phandle to a remote evtchn to which
+    local-evtchn will be connected.
+
+
+Example:
+
+    chosen {
+        ....
+
+        domU1: domU1 {
+            compatible = "xen,domain";
+
+            /* one sub-node per local event channel */
+            ec1: evtchn@1 {
+                compatible = "xen,evtchn-v1";
+                /* local-evtchn link-to-foreign-evtchn */
+                xen,evtchn = <0xa &ec3>;
+            };
+
+            ec2: evtchn@2 {
+                compatible = "xen,evtchn-v1";
+                xen,evtchn = <0xc &ec4>;
+            };
+            ....
+        };
+
+        domU2: domU2 {
+            compatible = "xen,domain";
+
+            /* one sub-node per local event channel */
+            ec3: evtchn@3 {
+                compatible = "xen,evtchn-v1";
+                /* local-evtchn link-to-foreign-evtchn */
+                xen,evtchn = <0xb &ec1>;
+            };
+
+            ec4: evtchn@4 {
+                compatible = "xen,evtchn-v1";
+                xen,evtchn = <0xd &ec2>;
+            };
+            ....
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


