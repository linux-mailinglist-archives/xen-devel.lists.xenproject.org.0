Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1658F5F25EB
	for <lists+xen-devel@lfdr.de>; Mon,  3 Oct 2022 00:21:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.414713.659074 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1of7KE-0005nu-RD; Sun, 02 Oct 2022 22:20:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 414713.659074; Sun, 02 Oct 2022 22:20:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1of7KE-0005kc-O9; Sun, 02 Oct 2022 22:20:42 +0000
Received: by outflank-mailman (input) for mailman id 414713;
 Sun, 02 Oct 2022 22:20:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=STlk=2D=runbox.com=m.v.b@srs-se1.protection.inumbo.net>)
 id 1of7KD-0005kR-0n
 for xen-devel@lists.xenproject.org; Sun, 02 Oct 2022 22:20:41 +0000
Received: from mailtransmit05.runbox.com (mailtransmit05.runbox.com
 [2a0c:5a00:149::26]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 71af7d7a-42a0-11ed-964a-05401a9f4f97;
 Mon, 03 Oct 2022 00:20:39 +0200 (CEST)
Received: from mailtransmit02.runbox ([10.9.9.162] helo=aibo.runbox.com)
 by mailtransmit05.runbox.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.93)
 (envelope-from <m.v.b@runbox.com>)
 id 1of7K9-009uTo-Fw; Mon, 03 Oct 2022 00:20:37 +0200
Received: from [10.9.9.74] (helo=submission03.runbox)
 by mailtransmit02.runbox with esmtp (Exim 4.86_2)
 (envelope-from <m.v.b@runbox.com>)
 id 1of7K8-0006iO-SE; Mon, 03 Oct 2022 00:20:37 +0200
Received: by submission03.runbox with esmtpsa [Authenticated ID (536975)]
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.90_1)
 id 1of7Jz-00061b-RQ; Mon, 03 Oct 2022 00:20:28 +0200
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
X-Inumbo-ID: 71af7d7a-42a0-11ed-964a-05401a9f4f97
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=runbox.com;
	 s=selector2; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To
	:Message-Id:Date:Subject:Cc:To:From;
	bh=IbJuVdq/QrQKAp9cm0ptCR4E1O6oLQr+Cte2Q8caJXI=; b=gZDesZiFM3cDQyvzP/+EZKGsLv
	VX3w8pGR4ncemINA23fRwh3L1UHLJqYcR+r/6gOT87AeeRBjL3ntG5JYS1YHObVtFYSJ63kBlecsL
	A9qJMgNRIIXClOqv8xTX03vROUmwQtk6nZI83NkpiMyGkQ+TvmbUCxrB8rwW2wJlxGLHHm9Z9CUPg
	8diqLHynunkM48gcmDXSRbInkXZZbnv5/jCrTHel5eVwi6p30URPPkU/G0ywkXSGRNvy3xHX1670a
	cWP1ABHyJ+SD/39QDsD3MuTo7UBdLy4TkqdOUmBlAG6q7DH5wLE7yk8MzIv62/REqrEV+x7CTbZBh
	UqzrzK9g==;
From: "M. Vefa Bicakci" <m.v.b@runbox.com>
To: xen-devel@lists.xenproject.org,
	linux-kernel@vger.kernel.org
Cc: m.v.b@runbox.com,
	Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	Demi Marie Obenour <demi@invisiblethingslab.com>,
	Gerd Hoffmann <kraxel@redhat.com>
Subject: [PATCH v2 2/2] xen/gntdev: Accommodate VMA splitting
Date: Sun,  2 Oct 2022 18:20:06 -0400
Message-Id: <20221002222006.2077-3-m.v.b@runbox.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221002222006.2077-1-m.v.b@runbox.com>
References: <20221002222006.2077-1-m.v.b@runbox.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Prior to this commit, the gntdev driver code did not handle the
following scenario correctly with paravirtualized (PV) Xen domains:

* User process sets up a gntdev mapping composed of two grant mappings
  (i.e., two pages shared by another Xen domain).
* User process munmap()s one of the pages.
* User process munmap()s the remaining page.
* User process exits.

In the scenario above, the user process would cause the kernel to log
the following messages in dmesg for the first munmap(), and the second
munmap() call would result in similar log messages:

  BUG: Bad page map in process doublemap.test  pte:... pmd:...
  page:0000000057c97bff refcount:1 mapcount:-1 \
    mapping:0000000000000000 index:0x0 pfn:...
  ...
  page dumped because: bad pte
  ...
  file:gntdev fault:0x0 mmap:gntdev_mmap [xen_gntdev] readpage:0x0
  ...
  Call Trace:
   <TASK>
   dump_stack_lvl+0x46/0x5e
   print_bad_pte.cold+0x66/0xb6
   unmap_page_range+0x7e5/0xdc0
   unmap_vmas+0x78/0xf0
   unmap_region+0xa8/0x110
   __do_munmap+0x1ea/0x4e0
   __vm_munmap+0x75/0x120
   __x64_sys_munmap+0x28/0x40
   do_syscall_64+0x38/0x90
   entry_SYSCALL_64_after_hwframe+0x61/0xcb
   ...

For each munmap() call, the Xen hypervisor (if built with CONFIG_DEBUG)
would print out the following and trigger a general protection fault in
the affected Xen PV domain:

  (XEN) d0v... Attempt to implicitly unmap d0's grant PTE ...
  (XEN) d0v... Attempt to implicitly unmap d0's grant PTE ...

As of this writing, gntdev_grant_map structure's vma field (referred to
as map->vma below) is mainly used for checking the start and end
addresses of mappings. However, with split VMAs, these may change, and
there could be more than one VMA associated with a gntdev mapping.
Hence, remove the use of map->vma and rely on map->pages_vm_start for
the original start address and on (map->count << PAGE_SHIFT) for the
original mapping size. Let the invalidate() and find_special_page()
hooks use these.

Also, given that there can be multiple VMAs associated with a gntdev
mapping, move the "mmu_interval_notifier_remove(&map->notifier)" call to
the end of gntdev_put_map, so that the MMU notifier is only removed
after the closing of the last remaining VMA.

Finally, use an atomic to prevent inadvertent gntdev mapping re-use,
instead of using the map->live_grants atomic counter and/or the map->vma
pointer (the latter of which is now removed). This prevents the
userspace from mmap()'ing (with MAP_FIXED) a gntdev mapping over the
same address range as a previously set up gntdev mapping. This scenario
can be summarized with the following call-trace, which was valid prior
to this commit:

  mmap
    gntdev_mmap
  mmap (repeat mmap with MAP_FIXED over the same address range)
    gntdev_invalidate
      unmap_grant_pages (sets 'being_removed' entries to true)
        gnttab_unmap_refs_async
    unmap_single_vma
    gntdev_mmap (maps the shared pages again)
  munmap
    gntdev_invalidate
      unmap_grant_pages
        (no-op because 'being_removed' entries are true)
    unmap_single_vma (For PV domains, Xen reports that a granted page
      is being unmapped and triggers a general protection fault in the
      affected domain, if Xen was built with CONFIG_DEBUG)

The fix for this last scenario could be worth its own commit, but we
opted for a single commit, because removing the gntdev_grant_map
structure's vma field requires guarding the entry to gntdev_mmap(), and
the live_grants atomic counter is not sufficient on its own to prevent
the mmap() over a pre-existing mapping.

Link: https://github.com/QubesOS/qubes-issues/issues/7631
Fixes: ab31523c2fca ("xen/gntdev: allow usermode to map granted pages")
Cc: stable@vger.kernel.org
Signed-off-by: M. Vefa Bicakci <m.v.b@runbox.com>
---

Changes since v1:
- Amended the patch description to note that the reported issues affect
  paravirtualized (PV) Xen domains.
- Note that Juergen Gross reviewed the first version of this patch.
  (Thanks!) I did not add a Reviewed-by tag in v2, because I have
  since amended the patch description.
- No source code changes.

My original note follows.

Note for reviewers:

I am not 100% sure if the "Fixes" tag is correct. Based on a quick look
at the history of the modified file, I am under the impression that VMA
splits could be broken for the Xen gntdev driver since day 1 (i.e.,
v2.6.38), but I did not yet attempt to verify this by testing older
kernels where the gntdev driver's code is sufficiently similar.

Also, resetting the being_removed flags to false after the completion of
unmap operation could be another potential solution (that I have not yet
tested in the context of this change) to the mmap and MAP_FIXED issue
discussed at the end of the patch description.
---
 drivers/xen/gntdev-common.h |  3 +-
 drivers/xen/gntdev.c        | 58 ++++++++++++++++---------------------
 2 files changed, 27 insertions(+), 34 deletions(-)

diff --git a/drivers/xen/gntdev-common.h b/drivers/xen/gntdev-common.h
index 40ef379c28ab..9c286b2a1900 100644
--- a/drivers/xen/gntdev-common.h
+++ b/drivers/xen/gntdev-common.h
@@ -44,9 +44,10 @@ struct gntdev_unmap_notify {
 };
 
 struct gntdev_grant_map {
+	atomic_t in_use;
 	struct mmu_interval_notifier notifier;
+	bool notifier_init;
 	struct list_head next;
-	struct vm_area_struct *vma;
 	int index;
 	int count;
 	int flags;
diff --git a/drivers/xen/gntdev.c b/drivers/xen/gntdev.c
index eb0586b9767d..4d9a3050de6a 100644
--- a/drivers/xen/gntdev.c
+++ b/drivers/xen/gntdev.c
@@ -286,6 +286,9 @@ void gntdev_put_map(struct gntdev_priv *priv, struct gntdev_grant_map *map)
 		 */
 	}
 
+	if (use_ptemod && map->notifier_init)
+		mmu_interval_notifier_remove(&map->notifier);
+
 	if (map->notify.flags & UNMAP_NOTIFY_SEND_EVENT) {
 		notify_remote_via_evtchn(map->notify.event);
 		evtchn_put(map->notify.event);
@@ -298,7 +301,7 @@ void gntdev_put_map(struct gntdev_priv *priv, struct gntdev_grant_map *map)
 static int find_grant_ptes(pte_t *pte, unsigned long addr, void *data)
 {
 	struct gntdev_grant_map *map = data;
-	unsigned int pgnr = (addr - map->vma->vm_start) >> PAGE_SHIFT;
+	unsigned int pgnr = (addr - map->pages_vm_start) >> PAGE_SHIFT;
 	int flags = map->flags | GNTMAP_application_map | GNTMAP_contains_pte |
 		    (1 << _GNTMAP_guest_avail0);
 	u64 pte_maddr;
@@ -508,11 +511,7 @@ static void gntdev_vma_close(struct vm_area_struct *vma)
 	struct gntdev_priv *priv = file->private_data;
 
 	pr_debug("gntdev_vma_close %p\n", vma);
-	if (use_ptemod) {
-		WARN_ON(map->vma != vma);
-		mmu_interval_notifier_remove(&map->notifier);
-		map->vma = NULL;
-	}
+
 	vma->vm_private_data = NULL;
 	gntdev_put_map(priv, map);
 }
@@ -540,29 +539,30 @@ static bool gntdev_invalidate(struct mmu_interval_notifier *mn,
 	struct gntdev_grant_map *map =
 		container_of(mn, struct gntdev_grant_map, notifier);
 	unsigned long mstart, mend;
+	unsigned long map_start, map_end;
 
 	if (!mmu_notifier_range_blockable(range))
 		return false;
 
+	map_start = map->pages_vm_start;
+	map_end = map->pages_vm_start + (map->count << PAGE_SHIFT);
+
 	/*
 	 * If the VMA is split or otherwise changed the notifier is not
 	 * updated, but we don't want to process VA's outside the modified
 	 * VMA. FIXME: It would be much more understandable to just prevent
 	 * modifying the VMA in the first place.
 	 */
-	if (map->vma->vm_start >= range->end ||
-	    map->vma->vm_end <= range->start)
+	if (map_start >= range->end || map_end <= range->start)
 		return true;
 
-	mstart = max(range->start, map->vma->vm_start);
-	mend = min(range->end, map->vma->vm_end);
+	mstart = max(range->start, map_start);
+	mend = min(range->end, map_end);
 	pr_debug("map %d+%d (%lx %lx), range %lx %lx, mrange %lx %lx\n",
-			map->index, map->count,
-			map->vma->vm_start, map->vma->vm_end,
-			range->start, range->end, mstart, mend);
-	unmap_grant_pages(map,
-				(mstart - map->vma->vm_start) >> PAGE_SHIFT,
-				(mend - mstart) >> PAGE_SHIFT);
+		 map->index, map->count, map_start, map_end,
+		 range->start, range->end, mstart, mend);
+	unmap_grant_pages(map, (mstart - map_start) >> PAGE_SHIFT,
+			  (mend - mstart) >> PAGE_SHIFT);
 
 	return true;
 }
@@ -1042,18 +1042,15 @@ static int gntdev_mmap(struct file *flip, struct vm_area_struct *vma)
 		return -EINVAL;
 
 	pr_debug("map %d+%d at %lx (pgoff %lx)\n",
-			index, count, vma->vm_start, vma->vm_pgoff);
+		 index, count, vma->vm_start, vma->vm_pgoff);
 
 	mutex_lock(&priv->lock);
 	map = gntdev_find_map_index(priv, index, count);
 	if (!map)
 		goto unlock_out;
-	if (use_ptemod && map->vma)
-		goto unlock_out;
-	if (atomic_read(&map->live_grants)) {
-		err = -EAGAIN;
+	if (!atomic_add_unless(&map->in_use, 1, 1))
 		goto unlock_out;
-	}
+
 	refcount_inc(&map->users);
 
 	vma->vm_ops = &gntdev_vmops;
@@ -1074,15 +1071,16 @@ static int gntdev_mmap(struct file *flip, struct vm_area_struct *vma)
 			map->flags |= GNTMAP_readonly;
 	}
 
+	map->pages_vm_start = vma->vm_start;
+
 	if (use_ptemod) {
-		map->vma = vma;
 		err = mmu_interval_notifier_insert_locked(
 			&map->notifier, vma->vm_mm, vma->vm_start,
 			vma->vm_end - vma->vm_start, &gntdev_mmu_ops);
-		if (err) {
-			map->vma = NULL;
+		if (err)
 			goto out_unlock_put;
-		}
+
+		map->notifier_init = true;
 	}
 	mutex_unlock(&priv->lock);
 
@@ -1099,7 +1097,6 @@ static int gntdev_mmap(struct file *flip, struct vm_area_struct *vma)
 		 */
 		mmu_interval_read_begin(&map->notifier);
 
-		map->pages_vm_start = vma->vm_start;
 		err = apply_to_page_range(vma->vm_mm, vma->vm_start,
 					  vma->vm_end - vma->vm_start,
 					  find_grant_ptes, map);
@@ -1128,13 +1125,8 @@ static int gntdev_mmap(struct file *flip, struct vm_area_struct *vma)
 out_unlock_put:
 	mutex_unlock(&priv->lock);
 out_put_map:
-	if (use_ptemod) {
+	if (use_ptemod)
 		unmap_grant_pages(map, 0, map->count);
-		if (map->vma) {
-			mmu_interval_notifier_remove(&map->notifier);
-			map->vma = NULL;
-		}
-	}
 	gntdev_put_map(priv, map);
 	return err;
 }
-- 
2.37.3


