Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 82D87333A80
	for <lists+xen-devel@lfdr.de>; Wed, 10 Mar 2021 11:45:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.95984.181319 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lJwLK-0003o7-5b; Wed, 10 Mar 2021 10:45:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 95984.181319; Wed, 10 Mar 2021 10:45:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lJwLK-0003ng-26; Wed, 10 Mar 2021 10:45:30 +0000
Received: by outflank-mailman (input) for mailman id 95984;
 Wed, 10 Mar 2021 10:45:28 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=W5NQ=II=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lJwLI-0003nO-A8
 for xen-devel@lists.xenproject.org; Wed, 10 Mar 2021 10:45:28 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f13af8c0-4ab6-4ec7-b818-c98ca372a428;
 Wed, 10 Mar 2021 10:45:27 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 775B5AE7B;
 Wed, 10 Mar 2021 10:45:26 +0000 (UTC)
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
X-Inumbo-ID: f13af8c0-4ab6-4ec7-b818-c98ca372a428
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1615373126; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ril/4RPeyhImho9ia6AHwhyvGLcmYtjyWfmoZsXmzHI=;
	b=kCtLZPpVoqLhEwxjvs2rkNk3Vi8Dcw8h4kl3Q53Zz/olDnQvXyadOtBa1UcYJ+UR2wRg6s
	MDfx2tUyyPFIH4tDYXbp21bAlkf997nM7CnnudqZJOODWgbBWFJ3HmVv/puxnAokAC2hu0
	CDBjJ/doFJMCpVAi8LCiIUODcl8FYsY=
Subject: [PATCH 2/3] Xen/gnttab: introduce common INVALID_GRANT_{HANDLE,REF}
From: Jan Beulich <jbeulich@suse.com>
To: Juergen Gross <jgross@suse.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Stefano Stabellini <sstabellini@kernel.org>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <2b326dc6-c624-c97b-f9c4-4cc68dd013ba@suse.com>
Message-ID: <db7c38a5-0d75-d5d1-19de-e5fe9f0b9c48@suse.com>
Date: Wed, 10 Mar 2021 11:45:26 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <2b326dc6-c624-c97b-f9c4-4cc68dd013ba@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

It's not helpful if every driver has to cook its own. Generalize
xenbus'es INVALID_GRANT_HANDLE and pcifront's INVALID_GRANT_REF (which
shouldn't have expanded to zero to begin with). Use the constants in
p2m.c and gntdev.c right away, and update field types where necessary so
they would match with the constants' types (albeit without touching
struct ioctl_gntdev_grant_ref's ref field, as that's part of the public
interface of the kernel and would require introducing a dependency on
Xen's grant_table.h public header).

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/arch/arm/xen/p2m.c
+++ b/arch/arm/xen/p2m.c
@@ -11,6 +11,7 @@
 
 #include <xen/xen.h>
 #include <xen/interface/memory.h>
+#include <xen/grant_table.h>
 #include <xen/page.h>
 #include <xen/swiotlb-xen.h>
 
@@ -109,7 +110,7 @@ int set_foreign_p2m_mapping(struct gntta
 		map_ops[i].status = GNTST_general_error;
 		unmap.host_addr = map_ops[i].host_addr,
 		unmap.handle = map_ops[i].handle;
-		map_ops[i].handle = ~0;
+		map_ops[i].handle = INVALID_GRANT_HANDLE;
 		if (map_ops[i].flags & GNTMAP_device_map)
 			unmap.dev_bus_addr = map_ops[i].dev_bus_addr;
 		else
--- a/arch/x86/xen/p2m.c
+++ b/arch/x86/xen/p2m.c
@@ -741,7 +741,7 @@ int set_foreign_p2m_mapping(struct gntta
 		map_ops[i].status = GNTST_general_error;
 		unmap[0].host_addr = map_ops[i].host_addr,
 		unmap[0].handle = map_ops[i].handle;
-		map_ops[i].handle = ~0;
+		map_ops[i].handle = INVALID_GRANT_HANDLE;
 		if (map_ops[i].flags & GNTMAP_device_map)
 			unmap[0].dev_bus_addr = map_ops[i].dev_bus_addr;
 		else
@@ -751,7 +751,7 @@ int set_foreign_p2m_mapping(struct gntta
 			kmap_ops[i].status = GNTST_general_error;
 			unmap[1].host_addr = kmap_ops[i].host_addr,
 			unmap[1].handle = kmap_ops[i].handle;
-			kmap_ops[i].handle = ~0;
+			kmap_ops[i].handle = INVALID_GRANT_HANDLE;
 			if (kmap_ops[i].flags & GNTMAP_device_map)
 				unmap[1].dev_bus_addr = kmap_ops[i].dev_bus_addr;
 			else
--- a/drivers/pci/xen-pcifront.c
+++ b/drivers/pci/xen-pcifront.c
@@ -26,7 +26,7 @@
 #include <xen/platform_pci.h>
 
 #include <asm/xen/swiotlb-xen.h>
-#define INVALID_GRANT_REF (0)
+
 #define INVALID_EVTCHN    (-1)
 
 struct pci_bus_entry {
@@ -42,7 +42,7 @@ struct pcifront_device {
 	struct list_head root_buses;
 
 	int evtchn;
-	int gnt_ref;
+	grant_ref_t gnt_ref;
 
 	int irq;
 
--- a/drivers/xen/gntdev.c
+++ b/drivers/xen/gntdev.c
@@ -186,11 +186,11 @@ struct gntdev_grant_map *gntdev_alloc_ma
 		goto err;
 
 	for (i = 0; i < count; i++) {
-		add->map_ops[i].handle = -1;
-		add->unmap_ops[i].handle = -1;
+		add->map_ops[i].handle = INVALID_GRANT_HANDLE;
+		add->unmap_ops[i].handle = INVALID_GRANT_HANDLE;
 		if (use_ptemod) {
-			add->kmap_ops[i].handle = -1;
-			add->kunmap_ops[i].handle = -1;
+			add->kmap_ops[i].handle = INVALID_GRANT_HANDLE;
+			add->kunmap_ops[i].handle = INVALID_GRANT_HANDLE;
 		}
 	}
 
@@ -279,7 +279,7 @@ static int find_grant_ptes(pte_t *pte, u
 			  map->grants[pgnr].ref,
 			  map->grants[pgnr].domid);
 	gnttab_set_unmap_op(&map->unmap_ops[pgnr], pte_maddr, flags,
-			    -1 /* handle */);
+			    INVALID_GRANT_HANDLE);
 	return 0;
 }
 
@@ -297,7 +297,7 @@ int gntdev_map_grant_pages(struct gntdev
 
 	if (!use_ptemod) {
 		/* Note: it could already be mapped */
-		if (map->map_ops[0].handle != -1)
+		if (map->map_ops[0].handle != INVALID_GRANT_HANDLE)
 			return 0;
 		for (i = 0; i < map->count; i++) {
 			unsigned long addr = (unsigned long)
@@ -306,7 +306,7 @@ int gntdev_map_grant_pages(struct gntdev
 				map->grants[i].ref,
 				map->grants[i].domid);
 			gnttab_set_unmap_op(&map->unmap_ops[i], addr,
-				map->flags, -1 /* handle */);
+				map->flags, INVALID_GRANT_HANDLE);
 		}
 	} else {
 		/*
@@ -332,7 +332,7 @@ int gntdev_map_grant_pages(struct gntdev
 				map->grants[i].ref,
 				map->grants[i].domid);
 			gnttab_set_unmap_op(&map->kunmap_ops[i], address,
-				flags, -1);
+				flags, INVALID_GRANT_HANDLE);
 		}
 	}
 
@@ -390,7 +390,7 @@ static int __unmap_grant_pages(struct gn
 		pr_debug("unmap handle=%d st=%d\n",
 			map->unmap_ops[offset+i].handle,
 			map->unmap_ops[offset+i].status);
-		map->unmap_ops[offset+i].handle = -1;
+		map->unmap_ops[offset+i].handle = INVALID_GRANT_HANDLE;
 	}
 	return err;
 }
@@ -406,13 +406,15 @@ static int unmap_grant_pages(struct gntd
 	 * already unmapped some of the grants. Only unmap valid ranges.
 	 */
 	while (pages && !err) {
-		while (pages && map->unmap_ops[offset].handle == -1) {
+		while (pages &&
+		       map->unmap_ops[offset].handle == INVALID_GRANT_HANDLE) {
 			offset++;
 			pages--;
 		}
 		range = 0;
 		while (range < pages) {
-			if (map->unmap_ops[offset+range].handle == -1)
+			if (map->unmap_ops[offset + range].handle ==
+			    INVALID_GRANT_HANDLE)
 				break;
 			range++;
 		}
--- a/include/xen/grant_table.h
+++ b/include/xen/grant_table.h
@@ -50,6 +50,13 @@
 #include <linux/page-flags.h>
 #include <linux/kernel.h>
 
+/*
+ * Technically there's no reliably invalid grant reference or grant handle,
+ * so pick the value that is the most unlikely one to be observed valid.
+ */
+#define INVALID_GRANT_REF          ((grant_ref_t)-1)
+#define INVALID_GRANT_HANDLE       ((grant_handle_t)-1)
+
 #define GNTTAB_RESERVED_XENSTORE 1
 
 /* NR_GRANT_FRAMES must be less than or equal to that configured in Xen */
--- a/include/xen/xenbus.h
+++ b/include/xen/xenbus.h
@@ -51,7 +51,6 @@
 
 #define XENBUS_MAX_RING_GRANT_ORDER 4
 #define XENBUS_MAX_RING_GRANTS      (1U << XENBUS_MAX_RING_GRANT_ORDER)
-#define INVALID_GRANT_HANDLE       (~0U)
 
 /* Register callback to watch this node. */
 struct xenbus_watch


