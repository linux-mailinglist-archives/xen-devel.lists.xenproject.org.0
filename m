Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 53B9023E4C7
	for <lists+xen-devel@lfdr.de>; Fri,  7 Aug 2020 01:49:56 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k3pdu-0004Mn-8U; Thu, 06 Aug 2020 23:49:50 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=flvv=BQ=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1k3pds-0004FC-KX
 for xen-devel@lists.xenproject.org; Thu, 06 Aug 2020 23:49:48 +0000
X-Inumbo-ID: 917eb6cc-950b-4155-96f7-ae1c6209ab86
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 917eb6cc-950b-4155-96f7-ae1c6209ab86;
 Thu, 06 Aug 2020 23:49:39 +0000 (UTC)
Received: from sstabellini-ThinkPad-T480s.hsd1.ca.comcast.net
 (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 7716522D01;
 Thu,  6 Aug 2020 23:49:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1596757778;
 bh=cE/8MB3BpG4nT+iCEeN/zJiUoBtOO+C3o59h9hTnhyw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=M6SOR+q4lzAjtT2DpFvyBZYneDI0oJyCm6ObiDP1yKWgGb+g/eSlfGCU1iRSyETJG
 g13bkWEkwfGFTQATeuYuqp+bEbEOsTvfI7yizT/6+/Ne2tmVt5ZPpQjtcYXjM9V8L2
 arEEh76pTWR0cq0bpV8wqWE/CO24PvhzjqY19QpU=
From: Stefano Stabellini <sstabellini@kernel.org>
To: xen-devel@lists.xenproject.org
Subject: [PATCH 04/14] kernel-doc: public/event_channel.h
Date: Thu,  6 Aug 2020 16:49:23 -0700
Message-Id: <20200806234933.16448-4-sstabellini@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <alpine.DEB.2.21.2008061605410.16004@sstabellini-ThinkPad-T480s>
References: <alpine.DEB.2.21.2008061605410.16004@sstabellini-ThinkPad-T480s>
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
Cc: sstabellini@kernel.org, julien@xen.org, wl@xen.org,
 andrew.cooper3@citrix.com, ian.jackson@eu.citrix.com, george.dunlap@citrix.com,
 jbeulich@suse.com, Stefano Stabellini <stefano.stabellini@xilinx.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

From: Stefano Stabellini <stefano.stabellini@xilinx.com>

Convert in-code comments to kernel-doc format wherever possible.

Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
---
 xen/include/public/event_channel.h | 188 +++++++++++++++++++----------
 1 file changed, 121 insertions(+), 67 deletions(-)

diff --git a/xen/include/public/event_channel.h b/xen/include/public/event_channel.h
index cfb7929fef..893ea744d4 100644
--- a/xen/include/public/event_channel.h
+++ b/xen/include/public/event_channel.h
@@ -29,8 +29,8 @@
 
 #include "xen.h"
 
-/*
- * `incontents 150 evtchn Event Channels
+/**
+ * DOC: Event Channels
  *
  * Event channels are the basic primitive provided by Xen for event
  * notifications. An event is the Xen equivalent of a hardware
@@ -79,27 +79,34 @@
 typedef uint32_t evtchn_port_t;
 DEFINE_XEN_GUEST_HANDLE(evtchn_port_t);
 
-/*
- * EVTCHNOP_alloc_unbound: Allocate a port in domain <dom> and mark as
- * accepting interdomain bindings from domain <remote_dom>. A fresh port
- * is allocated in <dom> and returned as <port>.
+/**
+ * struct evtchn_alloc_unbound - EVTCHNOP_alloc_unbound
+ *
+ * Allocate a port in domain <dom> and mark as accepting interdomain
+ * bindings from domain <remote_dom>. A fresh port is allocated in <dom>
+ * and returned as <port>.
+ *
  * NOTES:
  *  1. If the caller is unprivileged then <dom> must be DOMID_SELF.
  *  2. <remote_dom> may be DOMID_SELF, allowing loopback connections.
  */
 struct evtchn_alloc_unbound {
-    /* IN parameters */
-    domid_t dom, remote_dom;
-    /* OUT parameters */
+    /** @dom: IN parameter */
+    domid_t dom;
+    /** @remote_dom: IN parameter */
+    domid_t remote_dom;
+    /** @port: OUT parameter */
     evtchn_port_t port;
 };
 typedef struct evtchn_alloc_unbound evtchn_alloc_unbound_t;
 
-/*
- * EVTCHNOP_bind_interdomain: Construct an interdomain event channel between
- * the calling domain and <remote_dom>. <remote_dom,remote_port> must identify
- * a port that is unbound and marked as accepting bindings from the calling
- * domain. A fresh port is allocated in the calling domain and returned as
+/**
+ * struct evtchn_bind_interdomain - EVTCHNOP_bind_interdomain
+ *
+ * Construct an interdomain event channel between the calling domain and
+ * <remote_dom>. <remote_dom,remote_port> must identify a port that is
+ * unbound and marked as accepting bindings from the calling domain. A
+ * fresh port is allocated in the calling domain and returned as
  * <local_port>.
  *
  * In case the peer domain has already tried to set our event channel
@@ -116,17 +123,20 @@ typedef struct evtchn_alloc_unbound evtchn_alloc_unbound_t;
  *  1. <remote_dom> may be DOMID_SELF, allowing loopback connections.
  */
 struct evtchn_bind_interdomain {
-    /* IN parameters. */
+    /** @remote_dom: IN parameter */
     domid_t remote_dom;
+    /** @remote_port: IN parameter */
     evtchn_port_t remote_port;
-    /* OUT parameters. */
+    /** @local_port:OUT parameter */
     evtchn_port_t local_port;
 };
 typedef struct evtchn_bind_interdomain evtchn_bind_interdomain_t;
 
-/*
- * EVTCHNOP_bind_virq: Bind a local event channel to VIRQ <irq> on specified
- * vcpu.
+/**
+ * struct evtchn_bind_virq - EVTCHNOP_bind_virq
+ *
+ * Bind a local event channel to VIRQ <irq> on specified vcpu.
+ *
  * NOTES:
  *  1. Virtual IRQs are classified as per-vcpu or global. See the VIRQ list
  *     in xen.h for the classification of each VIRQ.
@@ -137,65 +147,78 @@ typedef struct evtchn_bind_interdomain evtchn_bind_interdomain_t;
  *     binding cannot be changed.
  */
 struct evtchn_bind_virq {
-    /* IN parameters. */
-    uint32_t virq; /* enum virq */
+    /** @virq: IN parameter, enum virq */
+    uint32_t virq;
+    /** @vcpu: IN parameter */
     uint32_t vcpu;
-    /* OUT parameters. */
+    /** @port: OUT parameter */
     evtchn_port_t port;
 };
 typedef struct evtchn_bind_virq evtchn_bind_virq_t;
 
-/*
- * EVTCHNOP_bind_pirq: Bind a local event channel to a real IRQ (PIRQ <irq>).
+/**
+ * struct evtchn_bind_pirq - EVTCHNOP_bind_pirq
+ *
+ * Bind a local event channel to a real IRQ (PIRQ <irq>).
  * NOTES:
  *  1. A physical IRQ may be bound to at most one event channel per domain.
  *  2. Only a sufficiently-privileged domain may bind to a physical IRQ.
  */
 struct evtchn_bind_pirq {
-    /* IN parameters. */
+    /** @pirq: IN parameter */
     uint32_t pirq;
+    /** @flags: IN parameter,  BIND_PIRQ__* */
 #define BIND_PIRQ__WILL_SHARE 1
-    uint32_t flags; /* BIND_PIRQ__* */
-    /* OUT parameters. */
+    uint32_t flags;
+    /** @port: OUT parameter */
     evtchn_port_t port;
 };
 typedef struct evtchn_bind_pirq evtchn_bind_pirq_t;
 
-/*
- * EVTCHNOP_bind_ipi: Bind a local event channel to receive events.
+/**
+ * struct struct evtchn_bind_ipi - EVTCHNOP_bind_ipi
+ *
+ * Bind a local event channel to receive events.
  * NOTES:
  *  1. The allocated event channel is bound to the specified vcpu. The binding
  *     may not be changed.
  */
 struct evtchn_bind_ipi {
+    /** @vcpu: IN parameter */
     uint32_t vcpu;
-    /* OUT parameters. */
+    /** @port: OUT parameter */
     evtchn_port_t port;
 };
 typedef struct evtchn_bind_ipi evtchn_bind_ipi_t;
 
-/*
- * EVTCHNOP_close: Close a local event channel <port>. If the channel is
- * interdomain then the remote end is placed in the unbound state
+/**
+ * struct evtchn_close - EVTCHNOP_close
+ *
+ * Close a local event channel <port>. If the channel is interdomain
+ * then the remote end is placed in the unbound state
  * (EVTCHNSTAT_unbound), awaiting a new connection.
  */
 struct evtchn_close {
-    /* IN parameters. */
+    /** @port: IN parameter */
     evtchn_port_t port;
 };
 typedef struct evtchn_close evtchn_close_t;
 
-/*
- * EVTCHNOP_send: Send an event to the remote end of the channel whose local
- * endpoint is <port>.
+/**
+ * struct evtchn_send - EVTCHNOP_send
+ *
+ * Send an event to the remote end of the channel whose local endpoint
+ * is <port>.
  */
 struct evtchn_send {
-    /* IN parameters. */
+    /** @port: IN parameter */
     evtchn_port_t port;
 };
 typedef struct evtchn_send evtchn_send_t;
 
-/*
+/**
+ * struct evtchn_status - EVTCHNOP_status
+ *
  * EVTCHNOP_status: Get the current status of the communication channel which
  * has an endpoint at <dom, port>.
  * NOTES:
@@ -204,10 +227,11 @@ typedef struct evtchn_send evtchn_send_t;
  *     channel for which <dom> is not DOMID_SELF.
  */
 struct evtchn_status {
-    /* IN parameters */
+    /** @dom: IN parameter */
     domid_t  dom;
+    /** @port: IN parameter */
     evtchn_port_t port;
-    /* OUT parameters */
+    /** @status: OUT parameter */
 #define EVTCHNSTAT_closed       0  /* Channel is not in use.                 */
 #define EVTCHNSTAT_unbound      1  /* Channel is waiting interdom connection.*/
 #define EVTCHNSTAT_interdomain  2  /* Channel is connected to remote domain. */
@@ -215,24 +239,39 @@ struct evtchn_status {
 #define EVTCHNSTAT_virq         4  /* Channel is bound to a virtual IRQ line */
 #define EVTCHNSTAT_ipi          5  /* Channel is bound to a virtual IPI line */
     uint32_t status;
-    uint32_t vcpu;                 /* VCPU to which this channel is bound.   */
+    /** @vcpu: OUT parameter, VCPU to which this channel is bound */
+    uint32_t vcpu;
+    /** @u: OUT parameter */
     union {
+        /**
+         * @u.unbound: EVTCHNSTAT_unbound
+         */
         struct {
             domid_t dom;
-        } unbound;                 /* EVTCHNSTAT_unbound */
+        } unbound;
+        /**
+         * @u.interdomain: EVTCHNSTAT_interdomain
+         */
         struct {
             domid_t dom;
             evtchn_port_t port;
-        } interdomain;             /* EVTCHNSTAT_interdomain */
-        uint32_t pirq;             /* EVTCHNSTAT_pirq        */
-        uint32_t virq;             /* EVTCHNSTAT_virq        */
+        } interdomain;
+        /**
+         * @u.pirq: EVTCHNSTAT_pirq
+         */
+        uint32_t pirq;
+        /**
+         * @u.virq: EVTCHNSTAT_virq
+         */
+        uint32_t virq;
     } u;
 };
 typedef struct evtchn_status evtchn_status_t;
 
-/*
- * EVTCHNOP_bind_vcpu: Specify which vcpu a channel should notify when an
- * event is pending.
+/**
+ * struct evtchn_bind_vcpu - EVTCHNOP_bind_vcpu
+ *
+ * Specify which vcpu a channel should notify when an event is pending.
  * NOTES:
  *  1. IPI-bound channels always notify the vcpu specified at bind time.
  *     This binding cannot be changed.
@@ -243,24 +282,29 @@ typedef struct evtchn_status evtchn_status_t;
  *     has its binding reset to vcpu0).
  */
 struct evtchn_bind_vcpu {
-    /* IN parameters. */
+    /** @port: IN parameter */
     evtchn_port_t port;
+    /** @vcpu: IN parameter */
     uint32_t vcpu;
 };
 typedef struct evtchn_bind_vcpu evtchn_bind_vcpu_t;
 
-/*
- * EVTCHNOP_unmask: Unmask the specified local event-channel port and deliver
- * a notification to the appropriate VCPU if an event is pending.
+/**
+ * struct evtchn_unmask - EVTCHNOP_unmask
+ *
+ * Unmask the specified local event-channel port and deliver a
+ * notification to the appropriate VCPU if an event is pending.
  */
 struct evtchn_unmask {
-    /* IN parameters. */
+    /** @port: IN parameter */
     evtchn_port_t port;
 };
 typedef struct evtchn_unmask evtchn_unmask_t;
 
-/*
- * EVTCHNOP_reset: Close all event channels associated with specified domain.
+/**
+ * struct evtchn_reset - EVTCHNOP_reset
+ *
+ * Close all event channels associated with specified domain.
  * NOTES:
  *  1. <dom> may be specified as DOMID_SELF.
  *  2. Only a sufficiently-privileged domain may specify other than DOMID_SELF.
@@ -270,44 +314,54 @@ typedef struct evtchn_unmask evtchn_unmask_t;
  *     as these events are likely to be lost.
  */
 struct evtchn_reset {
-    /* IN parameters. */
+    /** @dom: IN parameter */
     domid_t dom;
 };
 typedef struct evtchn_reset evtchn_reset_t;
 
-/*
- * EVTCHNOP_init_control: initialize the control block for the FIFO ABI.
+/**
+ * struct evtchn_init_control - EVTCHNOP_init_control
+ *
+ * Initialize the control block for the FIFO ABI.
  *
  * Note: any events that are currently pending will not be resent and
  * will be lost.  Guests should call this before binding any event to
  * avoid losing any events.
  */
 struct evtchn_init_control {
-    /* IN parameters. */
+    /** @control_gfn: IN parameter */
     uint64_t control_gfn;
+    /** @offset: IN parameter */
     uint32_t offset;
+    /** @vcpu: IN parameter */
     uint32_t vcpu;
-    /* OUT parameters. */
+    /** @link_bits: OUT parameter */
     uint8_t link_bits;
+    /** @_pad: padding */
     uint8_t _pad[7];
 };
 typedef struct evtchn_init_control evtchn_init_control_t;
 
-/*
- * EVTCHNOP_expand_array: add an additional page to the event array.
+/**
+ * struct evtchn_expand_array - EVTCHNOP_expand_array
+ *
+ * Add an additional page to the event array.
  */
 struct evtchn_expand_array {
-    /* IN parameters. */
+    /** @array_gfn: IN parameter */
     uint64_t array_gfn;
 };
 typedef struct evtchn_expand_array evtchn_expand_array_t;
 
-/*
- * EVTCHNOP_set_priority: set the priority for an event channel.
+/**
+ * struct evtchn_set_priority - EVTCHNOP_set_priority
+ *
+ * Set the priority for an event channel.
  */
 struct evtchn_set_priority {
-    /* IN parameters. */
+    /** @port: IN parameter */
     evtchn_port_t port;
+    /** @priority: IN parameter */
     uint32_t priority;
 };
 typedef struct evtchn_set_priority evtchn_set_priority_t;
-- 
2.17.1


