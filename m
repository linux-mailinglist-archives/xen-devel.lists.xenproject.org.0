Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 894CD53E036
	for <lists+xen-devel@lfdr.de>; Mon,  6 Jun 2022 05:41:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.342164.567228 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ny3bk-0006Ho-CK; Mon, 06 Jun 2022 03:40:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 342164.567228; Mon, 06 Jun 2022 03:40:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ny3bk-0006Ca-7w; Mon, 06 Jun 2022 03:40:48 +0000
Received: by outflank-mailman (input) for mailman id 342164;
 Mon, 06 Jun 2022 03:40:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PxEH=WN=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1ny3bi-0006AI-Qm
 for xen-devel@lists.xenproject.org; Mon, 06 Jun 2022 03:40:46 +0000
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 722c1c16-e54a-11ec-b605-df0040e90b76;
 Mon, 06 Jun 2022 05:40:45 +0200 (CEST)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id 8FFC15C00E6;
 Sun,  5 Jun 2022 23:40:44 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Sun, 05 Jun 2022 23:40:44 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 5 Jun 2022 23:40:43 -0400 (EDT)
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
X-Inumbo-ID: 722c1c16-e54a-11ec-b605-df0040e90b76
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm1; t=1654486844; x=1654573244; bh=eX7fSKteqe
	onuY94tGwQDaahOOYr2OCH2EyjM2W2Mdk=; b=RTUScW8EXvoifl2aFua3yOjN42
	DoDd+q7Bz+sdizPVk8CdgetgBwlorqpm6CV4vSswMnEQt1hzdm5+XUWv8glK8aP3
	jJM42MJqK7vCSCzZCH2+jXYQHgrey8hsSzmER0IAfk2XfcPCFFMaC3XJdicCk+vu
	u/AuWuZ+PjptqKMwm/TNd1vl3SQWBYYAsYnsElV4iKnORt6Zp+SM60R3w4zlHK4J
	4mcSsDCdCo24dDP5tw8fkZcCxfxUTz+eH3M7KWl21Wiv7k6120fYrOhtzHEIIsMa
	9O5WZi01vfNohSlmSJhJnOfIpjc6CfTMSZjwFXsGCiCwgQQUImmT+F9QcW/w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1654486844; x=
	1654573244; bh=eX7fSKteqeonuY94tGwQDaahOOYr2OCH2EyjM2W2Mdk=; b=q
	KkPMpIyBeYquR/feUT4HEvTY3j2rB4kGyEEYqK57IYMRcH7f7dy81GXY3xfzLidO
	lmh0Uk/Eh2RB5EJ8f1ddxmFXYKQAYBKS83l6h2Bz1y+ntSzZEKQMcTOV+KaaLlMb
	1ZLnEBXvTuGxgieLWFqR9oi0cksjnZq0lIZHeKikn4NAlmDmfubAQ992ITYi9kR4
	1t62rdMP6/pBC3aQksattom/OiKqzUGK1uz4GVfExyLA0Ru7GkP0mJM8s3b50ZdO
	Gi1C5ZPQjJZFzkJzSyTrMszNXFB+8lJQdNHbHFYXX3XkVCxhUebqnBC9b8TacEMb
	wYbNwCC5rLr7GJ9sH9tHg==
X-ME-Sender: <xms:PHedYrB9lhcU2nf48qPphXHLhaSdPDz10fkHTBIN9rmJPHHWff3SJQ>
    <xme:PHedYhjANQaZZdnVDFcvoJfy_iiC6tWmjQ1lytv2AVDHiE5LexLYeEan_sS4kSawA
    gJvlH7Y4oaqxA>
X-ME-Received: <xmr:PHedYmmy-Myg-Zjr39809TmCApD8Nbf7yR4x4h5N2M4Bbia80bf8-jQy7sOEagZXIuejJ0cHiBLbQPzmtXI1ULAQMQM9TC6-tDn4zh47sDJr1gA3-L0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedruddtuddgjeegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofgjfhggtgfgsehtkeertdertdejnecuhfhrohhmpeforghr
    vghkucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesih
    hnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpefg
    ueduhefgvdefheehudejheefudevueeghfekhfehleegveduteeuiedugffgffenucevlh
    hushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrghrmhgrrhgv
    khesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhm
X-ME-Proxy: <xmx:PHedYty43YGeinW2J6q9np7DyOIIF9QL6pTUqru-4Dshalhbw21thA>
    <xmx:PHedYgQike4r9v2UjlKckAGj9CPJ95bGaYTO_VdW0V1Fu8vJnmC_iw>
    <xmx:PHedYgaw8Uw1EKLzqBE-eqSCj8nJmWddyqzPpmOFk8ayMNcewp4-uw>
    <xmx:PHedYlKTWovfNv5NizIRrGXFjU8VcwF65uvZcn5qjSQDzup3klmfWw>
Feedback-ID: i1568416f:Fastmail
From: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [RFC PATCH 02/12] xue: annotate functions with cf_check
Date: Mon,  6 Jun 2022 05:40:14 +0200
Message-Id: <7f248769d2e50077b8719f7524c607d843199951.1654486751.git-series.marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <cover.07846d9c1900bd8c905a05e7afb214b4cf4ab881.1654486751.git-series.marmarek@invisiblethingslab.com>
References: <cover.07846d9c1900bd8c905a05e7afb214b4cf4ab881.1654486751.git-series.marmarek@invisiblethingslab.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Annotate indirectly called functions for IBT.

Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
---
 xen/drivers/char/xue.c | 12 ++++++------
 xen/include/xue.h      | 24 ++++++++++++------------
 2 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/xen/drivers/char/xue.c b/xen/drivers/char/xue.c
index 8aefae482b71..98334090c078 100644
--- a/xen/drivers/char/xue.c
+++ b/xen/drivers/char/xue.c
@@ -39,7 +39,7 @@ struct xue_uart {
 static struct xue_uart xue_uart;
 static struct xue_ops xue_ops;
 
-static void xue_uart_poll(void *data)
+static void cf_check xue_uart_poll(void *data)
 {
     struct serial_port *port = data;
     struct xue_uart *uart = port->uart;
@@ -56,13 +56,13 @@ static void xue_uart_poll(void *data)
     set_timer(&uart->timer, NOW() + MICROSECS(XUE_POLL_INTERVAL));
 }
 
-static void __init xue_uart_init_preirq(struct serial_port *port)
+static void __init cf_check xue_uart_init_preirq(struct serial_port *port)
 {
     struct xue_uart *uart = port->uart;
     uart->lock = &port->tx_lock;
 }
 
-static void __init xue_uart_init_postirq(struct serial_port *port)
+static void __init cf_check xue_uart_init_postirq(struct serial_port *port)
 {
     struct xue_uart *uart = port->uart;
 
@@ -71,7 +71,7 @@ static void __init xue_uart_init_postirq(struct serial_port *port)
     set_timer(&uart->timer, NOW() + MILLISECS(1));
 }
 
-static int xue_uart_tx_ready(struct serial_port *port)
+static int cf_check xue_uart_tx_ready(struct serial_port *port)
 {
     struct xue_uart *uart = port->uart;
     struct xue *xue = &uart->xue;
@@ -79,13 +79,13 @@ static int xue_uart_tx_ready(struct serial_port *port)
     return XUE_WORK_RING_CAP - xue_work_ring_size(&xue->dbc_owork);
 }
 
-static void xue_uart_putc(struct serial_port *port, char c)
+static void cf_check xue_uart_putc(struct serial_port *port, char c)
 {
     struct xue_uart *uart = port->uart;
     xue_putc(&uart->xue, c);
 }
 
-static inline void xue_uart_flush(struct serial_port *port)
+static inline void cf_check xue_uart_flush(struct serial_port *port)
 {
     s_time_t goal;
     struct xue_uart *uart = port->uart;
diff --git a/xen/include/xue.h b/xen/include/xue.h
index 66f7d66447f3..7515244f6af3 100644
--- a/xen/include/xue.h
+++ b/xen/include/xue.h
@@ -684,45 +684,45 @@ static inline void xue_sys_clflush(void *sys, void *ptr)
 #define xue_error(...) printk("xue error: " __VA_ARGS__)
 #define XUE_SYSID xue_sysid_xen
 
-static inline int xue_sys_init(void *sys) { return 1; }
-static inline void xue_sys_sfence(void *sys) { wmb(); }
-static inline void xue_sys_lfence(void *sys) { rmb(); }
-static inline void xue_sys_unmap_xhc(void *sys, void *virt, uint64_t count) {}
-static inline void xue_sys_free_dma(void *sys, void *addr, uint64_t order) {}
+static inline int cf_check xue_sys_init(void *sys) { return 1; }
+static inline void cf_check xue_sys_sfence(void *sys) { wmb(); }
+static inline void cf_check xue_sys_lfence(void *sys) { rmb(); }
+static inline void cf_check xue_sys_unmap_xhc(void *sys, void *virt, uint64_t count) {}
+static inline void cf_check xue_sys_free_dma(void *sys, void *addr, uint64_t order) {}
 
-static inline void xue_sys_pause(void *sys)
+static inline void cf_check xue_sys_pause(void *sys)
 {
     (void)sys;
     __asm volatile("pause" ::: "memory");
 }
 
-static inline void xue_sys_clflush(void *sys, void *ptr)
+static inline void cf_check xue_sys_clflush(void *sys, void *ptr)
 {
     (void)sys;
     __asm volatile("clflush %0" : "+m"(*(volatile char *)ptr));
 }
 
-static inline void *xue_sys_alloc_dma(void *sys, uint64_t order)
+static inline void *cf_check xue_sys_alloc_dma(void *sys, uint64_t order)
 {
     return NULL;
 }
 
-static inline uint32_t xue_sys_ind(void *sys, uint32_t port)
+static inline uint32_t cf_check xue_sys_ind(void *sys, uint32_t port)
 {
     return inl(port);
 }
 
-static inline void xue_sys_outd(void *sys, uint32_t port, uint32_t data)
+static inline void cf_check xue_sys_outd(void *sys, uint32_t port, uint32_t data)
 {
     outl(data, port);
 }
 
-static inline uint64_t xue_sys_virt_to_dma(void *sys, const void *virt)
+static inline uint64_t cf_check xue_sys_virt_to_dma(void *sys, const void *virt)
 {
     return virt_to_maddr(virt);
 }
 
-static void *xue_sys_map_xhc(void *sys, uint64_t phys, uint64_t size)
+static void *cf_check xue_sys_map_xhc(void *sys, uint64_t phys, uint64_t size)
 {
     size_t i;
 
-- 
git-series 0.9.1

