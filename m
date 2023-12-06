Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DB216807766
	for <lists+xen-devel@lfdr.de>; Wed,  6 Dec 2023 19:18:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.649391.1013869 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rAwSk-0000tI-3c; Wed, 06 Dec 2023 18:17:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 649391.1013869; Wed, 06 Dec 2023 18:17:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rAwSk-0000rN-0j; Wed, 06 Dec 2023 18:17:34 +0000
Received: by outflank-mailman (input) for mailman id 649391;
 Wed, 06 Dec 2023 18:17:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+svz=HR=infradead.org=rdunlap@srs-se1.protection.inumbo.net>)
 id 1rAwSh-0000rH-Od
 for xen-devel@lists.xenproject.org; Wed, 06 Dec 2023 18:17:32 +0000
Received: from bombadil.infradead.org (bombadil.infradead.org
 [2607:7c80:54:3::133])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b746988c-9463-11ee-98e5-6d05b1d4d9a1;
 Wed, 06 Dec 2023 19:17:30 +0100 (CET)
Received: from [50.53.46.231] (helo=bombadil.infradead.org)
 by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
 id 1rAwSa-00B19I-1p; Wed, 06 Dec 2023 18:17:24 +0000
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
X-Inumbo-ID: b746988c-9463-11ee-98e5-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=KHQ2Hp/i+miJGxn9MDdhqx+iMrXntqUvbNQTqDYCu+Q=; b=sdca+CettaGkArobSwa1TQJxGY
	sJ0R6nyCFx31g3zwzrCDrpv3QIMLAUwPur6QhkrjZO2pJL9z/gYk3T3w9ZyuLd09Nw1B16TTWg13d
	las6FS00BUiXRoiHHDlgWFTUL6gWma1z4r9ABRREaZgUcneGEDST3B8SULyEAbnli2S2+bd0yISsV
	coD98Vot8UcPNg4cii9HOxhvVY1N2kGFOWDE7+T4iNDCbuNsPQIERju/4GN7WrtvbTVklWtGT4rYi
	DRYcP4rd2z1F8kTvNVjv7y5CInCmxbuDuufQ0+/DKH3qKXrTWP+61PCu5aHfxuh4Q3L3w6TFFjuq7
	GrF8LcGw==;
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-kernel@vger.kernel.org
Cc: Randy Dunlap <rdunlap@infradead.org>,
	Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	xen-devel@lists.xenproject.org
Subject: [PATCH] xen/xenbus: client: fix kernel-doc comments
Date: Wed,  6 Dec 2023 10:17:24 -0800
Message-ID: <20231206181724.27767-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Correct function kernel-doc notation to prevent warnings from
scripts/kernel-doc.

xenbus_client.c:134: warning: No description found for return value of 'xenbus_watch_path'
xenbus_client.c:177: warning: No description found for return value of 'xenbus_watch_pathfmt'
xenbus_client.c:258: warning: missing initial short description on line:
 * xenbus_switch_state
xenbus_client.c:267: warning: No description found for return value of 'xenbus_switch_state'
xenbus_client.c:308: warning: missing initial short description on line:
 * xenbus_dev_error
xenbus_client.c:327: warning: missing initial short description on line:
 * xenbus_dev_fatal
xenbus_client.c:350: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
 * Equivalent to xenbus_dev_fatal(dev, err, fmt, args), but helps
xenbus_client.c:457: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
 * Allocate an event channel for the given xenbus_device, assigning the newly
xenbus_client.c:486: warning: expecting prototype for Free an existing event channel. Returns 0 on success or(). Prototype was for xenbus_free_evtchn() instead
xenbus_client.c:502: warning: missing initial short description on line:
 * xenbus_map_ring_valloc
xenbus_client.c:517: warning: No description found for return value of 'xenbus_map_ring_valloc'
xenbus_client.c:602: warning: missing initial short description on line:
 * xenbus_unmap_ring
xenbus_client.c:614: warning: No description found for return value of 'xenbus_unmap_ring'
xenbus_client.c:715: warning: missing initial short description on line:
 * xenbus_unmap_ring_vfree
xenbus_client.c:727: warning: No description found for return value of 'xenbus_unmap_ring_vfree'
xenbus_client.c:919: warning: missing initial short description on line:
 * xenbus_read_driver_state
xenbus_client.c:926: warning: No description found for return value of 'xenbus_read_driver_state'

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: Juergen Gross <jgross@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Cc: xen-devel@lists.xenproject.org
---
 drivers/xen/xenbus/xenbus_client.c |   59 +++++++++++++++------------
 1 file changed, 34 insertions(+), 25 deletions(-)

diff -- a/drivers/xen/xenbus/xenbus_client.c b/drivers/xen/xenbus/xenbus_client.c
--- a/drivers/xen/xenbus/xenbus_client.c
+++ b/drivers/xen/xenbus/xenbus_client.c
@@ -119,11 +119,13 @@ EXPORT_SYMBOL_GPL(xenbus_strstate);
  * @callback: callback to register
  *
  * Register a @watch on the given path, using the given xenbus_watch structure
- * for storage, and the given @callback function as the callback.  Return 0 on
- * success, or -errno on error.  On success, the given @path will be saved as
- * @watch->node, and remains the caller's to free.  On error, @watch->node will
+ * for storage, and the given @callback function as the callback.  On success,
+ * the given @path will be saved as @watch->node, and remains the
+ * caller's to free.  On error, @watch->node will
  * be NULL, the device will switch to %XenbusStateClosing, and the error will
  * be saved in the store.
+ *
+ * Returns: %0 on success or -errno on error
  */
 int xenbus_watch_path(struct xenbus_device *dev, const char *path,
 		      struct xenbus_watch *watch,
@@ -160,12 +162,14 @@ EXPORT_SYMBOL_GPL(xenbus_watch_path);
  * @pathfmt: format of path to watch
  *
  * Register a watch on the given @path, using the given xenbus_watch
- * structure for storage, and the given @callback function as the callback.
- * Return 0 on success, or -errno on error.  On success, the watched path
- * (@path/@path2) will be saved as @watch->node, and becomes the caller's to
- * kfree().  On error, watch->node will be NULL, so the caller has nothing to
+ * structure for storage, and the given @callback function as the
+ * callback.  On success, the watched path (@path/@path2) will be saved
+ * as @watch->node, and becomes the caller's to kfree().
+ * On error, watch->node will be NULL, so the caller has nothing to
  * free, the device will switch to %XenbusStateClosing, and the error will be
  * saved in the store.
+ *
+ * Returns: %0 on success or -errno on error
  */
 int xenbus_watch_pathfmt(struct xenbus_device *dev,
 			 struct xenbus_watch *watch,
@@ -255,13 +259,15 @@ abort:
 }
 
 /**
- * xenbus_switch_state
+ * xenbus_switch_state - save the new state of a driver
  * @dev: xenbus device
  * @state: new state
  *
  * Advertise in the store a change of the given driver to the given new_state.
- * Return 0 on success, or -errno on error.  On error, the device will switch
- * to XenbusStateClosing, and the error will be saved in the store.
+ * On error, the device will switch to XenbusStateClosing, and the error
+ * will be saved in the store.
+ *
+ * Returns: %0 on success or -errno on error
  */
 int xenbus_switch_state(struct xenbus_device *dev, enum xenbus_state state)
 {
@@ -305,7 +311,7 @@ static void xenbus_va_dev_error(struct x
 }
 
 /**
- * xenbus_dev_error
+ * xenbus_dev_error - place an error message into the store
  * @dev: xenbus device
  * @err: error to report
  * @fmt: error message format
@@ -324,7 +330,7 @@ void xenbus_dev_error(struct xenbus_devi
 EXPORT_SYMBOL_GPL(xenbus_dev_error);
 
 /**
- * xenbus_dev_fatal
+ * xenbus_dev_fatal - put an error messages into the store and then shutdown
  * @dev: xenbus device
  * @err: error to report
  * @fmt: error message format
@@ -346,7 +352,7 @@ void xenbus_dev_fatal(struct xenbus_devi
 }
 EXPORT_SYMBOL_GPL(xenbus_dev_fatal);
 
-/**
+/*
  * Equivalent to xenbus_dev_fatal(dev, err, fmt, args), but helps
  * avoiding recursion within xenbus_switch_state.
  */
@@ -453,7 +459,7 @@ void xenbus_teardown_ring(void **vaddr,
 }
 EXPORT_SYMBOL_GPL(xenbus_teardown_ring);
 
-/**
+/*
  * Allocate an event channel for the given xenbus_device, assigning the newly
  * created local port to *port.  Return 0 on success, or -errno on error.  On
  * error, the device will switch to XenbusStateClosing, and the error will be
@@ -479,7 +485,7 @@ int xenbus_alloc_evtchn(struct xenbus_de
 EXPORT_SYMBOL_GPL(xenbus_alloc_evtchn);
 
 
-/**
+/*
  * Free an existing event channel. Returns 0 on success or -errno on error.
  */
 int xenbus_free_evtchn(struct xenbus_device *dev, evtchn_port_t port)
@@ -499,7 +505,7 @@ EXPORT_SYMBOL_GPL(xenbus_free_evtchn);
 
 
 /**
- * xenbus_map_ring_valloc
+ * xenbus_map_ring_valloc - allocate & map pages of VA space
  * @dev: xenbus device
  * @gnt_refs: grant reference array
  * @nr_grefs: number of grant references
@@ -507,10 +513,11 @@ EXPORT_SYMBOL_GPL(xenbus_free_evtchn);
  *
  * Map @nr_grefs pages of memory into this domain from another
  * domain's grant table.  xenbus_map_ring_valloc allocates @nr_grefs
- * pages of virtual address space, maps the pages to that address, and
- * sets *vaddr to that address.  Returns 0 on success, and -errno on
- * error. If an error is returned, device will switch to
+ * pages of virtual address space, maps the pages to that address, and sets
+ * *vaddr to that address.  If an error is returned, device will switch to
  * XenbusStateClosing and the error message will be saved in XenStore.
+ *
+ * Returns: %0 on success or -errno on error
  */
 int xenbus_map_ring_valloc(struct xenbus_device *dev, grant_ref_t *gnt_refs,
 			   unsigned int nr_grefs, void **vaddr)
@@ -599,14 +606,15 @@ static int __xenbus_map_ring(struct xenb
 }
 
 /**
- * xenbus_unmap_ring
+ * xenbus_unmap_ring - unmap memory from another domain
  * @dev: xenbus device
  * @handles: grant handle array
  * @nr_handles: number of handles in the array
  * @vaddrs: addresses to unmap
  *
  * Unmap memory in this domain that was imported from another domain.
- * Returns 0 on success and returns GNTST_* on error
+ *
+ * Returns: %0 on success or GNTST_* on error
  * (see xen/include/interface/grant_table.h).
  */
 static int xenbus_unmap_ring(struct xenbus_device *dev, grant_handle_t *handles,
@@ -712,7 +720,7 @@ static int xenbus_map_ring_hvm(struct xe
 }
 
 /**
- * xenbus_unmap_ring_vfree
+ * xenbus_unmap_ring_vfree - unmap a page of memory from another domain
  * @dev: xenbus device
  * @vaddr: addr to unmap
  *
@@ -720,7 +728,8 @@ static int xenbus_map_ring_hvm(struct xe
  * Unmap a page of memory in this domain that was imported from another domain.
  * Use xenbus_unmap_ring_vfree if you mapped in your memory with
  * xenbus_map_ring_valloc (it will free the virtual address space).
- * Returns 0 on success and returns GNTST_* on error
+ *
+ * Returns: %0 on success or GNTST_* on error
  * (see xen/include/interface/grant_table.h).
  */
 int xenbus_unmap_ring_vfree(struct xenbus_device *dev, void *vaddr)
@@ -916,10 +925,10 @@ static int xenbus_unmap_ring_hvm(struct
 }
 
 /**
- * xenbus_read_driver_state
+ * xenbus_read_driver_state - read from state from a store path
  * @path: path for driver
  *
- * Return the state of the driver rooted at the given store path, or
+ * Returns: the state of the driver rooted at the given store path, or
  * XenbusStateUnknown if no state can be read.
  */
 enum xenbus_state xenbus_read_driver_state(const char *path)

