Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BE0053BEB0
	for <lists+xen-devel@lfdr.de>; Thu,  2 Jun 2022 21:24:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.341181.566381 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nwqQg-0000G0-LD; Thu, 02 Jun 2022 19:24:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 341181.566381; Thu, 02 Jun 2022 19:24:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nwqQg-0000EB-E6; Thu, 02 Jun 2022 19:24:22 +0000
Received: by outflank-mailman (input) for mailman id 341181;
 Thu, 02 Jun 2022 19:24:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2EeJ=WJ=gmail.com=olekstysh@srs-se1.protection.inumbo.net>)
 id 1nwqQe-00089L-I9
 for xen-devel@lists.xenproject.org; Thu, 02 Jun 2022 19:24:20 +0000
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [2a00:1450:4864:20::62e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 99505fe7-e2a9-11ec-837f-e5687231ffcc;
 Thu, 02 Jun 2022 21:24:19 +0200 (CEST)
Received: by mail-ej1-x62e.google.com with SMTP id m20so11797117ejj.10
 for <xen-devel@lists.xenproject.org>; Thu, 02 Jun 2022 12:24:19 -0700 (PDT)
Received: from otyshchenko.router ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id
 eg13-20020a056402288d00b0042dce73168csm2938301edb.13.2022.06.02.12.24.17
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 02 Jun 2022 12:24:18 -0700 (PDT)
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
X-Inumbo-ID: 99505fe7-e2a9-11ec-837f-e5687231ffcc
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=atWo2NXjcz5EzUayOwhy3M2BlNEMIGiujbLV+faeIXM=;
        b=mP3vwQLwa0THZTdq8qiG3tbQqJFf1Xa1X4oAlyLR5UqR/h4POoo6cfg3UIa0R2wHNN
         dMbc9PL3Vw0pplOrQLrAJFVP2MRYdJ7pZQEZUfQyb2gubCPE5BhZOo3K4te6P553NKI4
         KIr9nRFzx1ipkPa3FhZCOv6jHUpYB4nbk9avk0iHRjtZIfEiXIl/l5nKooK2Rqf3tmrL
         XUHVs1LjD0B42IqgtkK/H4RW3sW8Cor3NF7n1RouI7Qn8mvA+EUGJLsHwIFeU4pVBr5s
         1virlHJv37c1XR+AUStA+w1ATBX/mCO80WCseY0IzT91IBJUCR9Goi/De/HPzRJ/3ZFH
         1RMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=atWo2NXjcz5EzUayOwhy3M2BlNEMIGiujbLV+faeIXM=;
        b=HstbzG1Z2VfvktAYSUuGDP/mhy8ahAIXpcRzxXxdvmcNnBXVxr39fvaYojgKxvvvMi
         ndQ+xt/yH5dsdqrrPuhPTlPwvnfBsqfOLPuGQfsWp0lxkzAC3wWK5ztmmJZcxJCgPI3P
         kuuYzdYy1+QUP8b5sh11AKKyu+bZe1vMNwKCgNEyrtB0AuWWU8tRr1B8NcIzgqDlMin+
         ZKSIcYG+CnCWztvEDgD4tkgW22/itMFEm0QushNtKiZBtxLm4T3IOYbjzDYr01akjNIi
         EeRHqFOPb0hpYM7DH5BmUUQ2WnHmN681GQN5dXdxDomORzX7HxpHpAZovvQ4aP9bT1u8
         dPeA==
X-Gm-Message-State: AOAM532RITUlcrAFhC6iMHg3IZ6dkew226GGCeb6NKJtOxGwa3i2Vtos
	xwrQANsjBuvwwS136ul0oBX5qgLRkhY=
X-Google-Smtp-Source: ABdhPJx/6ujytkYbLeLEkphxNTCLeRmoVTHOusFR7B4mHvxmoVacNzV7jZZx/LpplQtjtaYoF3cL+g==
X-Received: by 2002:a17:907:3f8b:b0:6ff:4721:3cf3 with SMTP id hr11-20020a1709073f8b00b006ff47213cf3mr5545696ejc.48.1654197858501;
        Thu, 02 Jun 2022 12:24:18 -0700 (PDT)
From: Oleksandr Tyshchenko <olekstysh@gmail.com>
To: xen-devel@lists.xenproject.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: Juergen Gross <jgross@suse.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Christoph Hellwig <hch@infradead.org>
Subject: [PATCH V4 2/8] xen/grants: support allocating consecutive grants
Date: Thu,  2 Jun 2022 22:23:47 +0300
Message-Id: <1654197833-25362-3-git-send-email-olekstysh@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1654197833-25362-1-git-send-email-olekstysh@gmail.com>
References: <1654197833-25362-1-git-send-email-olekstysh@gmail.com>

From: Juergen Gross <jgross@suse.com>

For support of virtio via grant mappings in rare cases larger mappings
using consecutive grants are needed. Support those by adding a bitmap
of free grants.

As consecutive grants will be needed only in very rare cases (e.g. when
configuring a virtio device with a multi-page ring), optimize for the
normal case of non-consecutive allocations.

Signed-off-by: Juergen Gross <jgross@suse.com>
Reviewed-by: Boris Ostrovsky <boris.ostrovsky@oracle.com>
---
Changes RFC -> V1:
   - no changes

Changes V1 -> V2:
   - no changes

Changes V2 -> V3:
   - rebase, move "if (unlikely(ref < GNTTAB_NR_RESERVED_ENTRIES))"
     to put_free_entry_locked()
   - do not overwrite "i" in gnttab_init(), introduce local max_nr_grefs
   - add a comment on top of "while (from < to)" in get_free_seq()
   - add Boris' R-b

Changes V3 -> V4:
   - no changes
---
 drivers/xen/grant-table.c | 251 +++++++++++++++++++++++++++++++++++++++-------
 include/xen/grant_table.h |   4 +
 2 files changed, 219 insertions(+), 36 deletions(-)

diff --git a/drivers/xen/grant-table.c b/drivers/xen/grant-table.c
index 7a18292..738029d 100644
--- a/drivers/xen/grant-table.c
+++ b/drivers/xen/grant-table.c
@@ -33,6 +33,7 @@
 
 #define pr_fmt(fmt) "xen:" KBUILD_MODNAME ": " fmt
 
+#include <linux/bitmap.h>
 #include <linux/memblock.h>
 #include <linux/sched.h>
 #include <linux/mm.h>
@@ -70,9 +71,32 @@
 
 static grant_ref_t **gnttab_list;
 static unsigned int nr_grant_frames;
+
+/*
+ * Handling of free grants:
+ *
+ * Free grants are in a simple list anchored in gnttab_free_head. They are
+ * linked by grant ref, the last element contains GNTTAB_LIST_END. The number
+ * of free entries is stored in gnttab_free_count.
+ * Additionally there is a bitmap of free entries anchored in
+ * gnttab_free_bitmap. This is being used for simplifying allocation of
+ * multiple consecutive grants, which is needed e.g. for support of virtio.
+ * gnttab_last_free is used to add free entries of new frames at the end of
+ * the free list.
+ * gnttab_free_tail_ptr specifies the variable which references the start
+ * of consecutive free grants ending with gnttab_last_free. This pointer is
+ * updated in a rather defensive way, in order to avoid performance hits in
+ * hot paths.
+ * All those variables are protected by gnttab_list_lock.
+ */
 static int gnttab_free_count;
-static grant_ref_t gnttab_free_head;
+static unsigned int gnttab_size;
+static grant_ref_t gnttab_free_head = GNTTAB_LIST_END;
+static grant_ref_t gnttab_last_free = GNTTAB_LIST_END;
+static grant_ref_t *gnttab_free_tail_ptr;
+static unsigned long *gnttab_free_bitmap;
 static DEFINE_SPINLOCK(gnttab_list_lock);
+
 struct grant_frames xen_auto_xlat_grant_frames;
 static unsigned int xen_gnttab_version;
 module_param_named(version, xen_gnttab_version, uint, 0);
@@ -168,16 +192,116 @@ static int get_free_entries(unsigned count)
 
 	ref = head = gnttab_free_head;
 	gnttab_free_count -= count;
-	while (count-- > 1)
-		head = gnttab_entry(head);
+	while (count--) {
+		bitmap_clear(gnttab_free_bitmap, head, 1);
+		if (gnttab_free_tail_ptr == __gnttab_entry(head))
+			gnttab_free_tail_ptr = &gnttab_free_head;
+		if (count)
+			head = gnttab_entry(head);
+	}
 	gnttab_free_head = gnttab_entry(head);
 	gnttab_entry(head) = GNTTAB_LIST_END;
 
+	if (!gnttab_free_count) {
+		gnttab_last_free = GNTTAB_LIST_END;
+		gnttab_free_tail_ptr = NULL;
+	}
+
 	spin_unlock_irqrestore(&gnttab_list_lock, flags);
 
 	return ref;
 }
 
+static int get_seq_entry_count(void)
+{
+	if (gnttab_last_free == GNTTAB_LIST_END || !gnttab_free_tail_ptr ||
+	    *gnttab_free_tail_ptr == GNTTAB_LIST_END)
+		return 0;
+
+	return gnttab_last_free - *gnttab_free_tail_ptr + 1;
+}
+
+/* Rebuilds the free grant list and tries to find count consecutive entries. */
+static int get_free_seq(unsigned int count)
+{
+	int ret = -ENOSPC;
+	unsigned int from, to;
+	grant_ref_t *last;
+
+	gnttab_free_tail_ptr = &gnttab_free_head;
+	last = &gnttab_free_head;
+
+	for (from = find_first_bit(gnttab_free_bitmap, gnttab_size);
+	     from < gnttab_size;
+	     from = find_next_bit(gnttab_free_bitmap, gnttab_size, to + 1)) {
+		to = find_next_zero_bit(gnttab_free_bitmap, gnttab_size,
+					from + 1);
+		if (ret < 0 && to - from >= count) {
+			ret = from;
+			bitmap_clear(gnttab_free_bitmap, ret, count);
+			from += count;
+			gnttab_free_count -= count;
+			if (from == to)
+				continue;
+		}
+
+		/*
+		 * Recreate the free list in order to have it properly sorted.
+		 * This is needed to make sure that the free tail has the maximum
+		 * possible size.
+		 */
+		while (from < to) {
+			*last = from;
+			last = __gnttab_entry(from);
+			gnttab_last_free = from;
+			from++;
+		}
+		if (to < gnttab_size)
+			gnttab_free_tail_ptr = __gnttab_entry(to - 1);
+	}
+
+	*last = GNTTAB_LIST_END;
+	if (gnttab_last_free != gnttab_size - 1)
+		gnttab_free_tail_ptr = NULL;
+
+	return ret;
+}
+
+static int get_free_entries_seq(unsigned int count)
+{
+	unsigned long flags;
+	int ret = 0;
+
+	spin_lock_irqsave(&gnttab_list_lock, flags);
+
+	if (gnttab_free_count < count) {
+		ret = gnttab_expand(count - gnttab_free_count);
+		if (ret < 0)
+			goto out;
+	}
+
+	if (get_seq_entry_count() < count) {
+		ret = get_free_seq(count);
+		if (ret >= 0)
+			goto out;
+		ret = gnttab_expand(count - get_seq_entry_count());
+		if (ret < 0)
+			goto out;
+	}
+
+	ret = *gnttab_free_tail_ptr;
+	*gnttab_free_tail_ptr = gnttab_entry(ret + count - 1);
+	gnttab_free_count -= count;
+	if (!gnttab_free_count)
+		gnttab_free_tail_ptr = NULL;
+	bitmap_clear(gnttab_free_bitmap, ret, count);
+
+ out:
+	spin_unlock_irqrestore(&gnttab_list_lock, flags);
+
+	return ret;
+}
+
 static void do_free_callbacks(void)
 {
 	struct gnttab_free_callback *callback, *next;
@@ -204,21 +328,51 @@ static inline void check_free_callbacks(void)
 		do_free_callbacks();
 }
 
-static void put_free_entry(grant_ref_t ref)
+static void put_free_entry_locked(grant_ref_t ref)
 {
-	unsigned long flags;
-
 	if (unlikely(ref < GNTTAB_NR_RESERVED_ENTRIES))
 		return;
 
-	spin_lock_irqsave(&gnttab_list_lock, flags);
 	gnttab_entry(ref) = gnttab_free_head;
 	gnttab_free_head = ref;
+	if (!gnttab_free_count)
+		gnttab_last_free = ref;
+	if (gnttab_free_tail_ptr == &gnttab_free_head)
+		gnttab_free_tail_ptr = __gnttab_entry(ref);
 	gnttab_free_count++;
+	bitmap_set(gnttab_free_bitmap, ref, 1);
+}
+
+static void put_free_entry(grant_ref_t ref)
+{
+	unsigned long flags;
+
+	spin_lock_irqsave(&gnttab_list_lock, flags);
+	put_free_entry_locked(ref);
 	check_free_callbacks();
 	spin_unlock_irqrestore(&gnttab_list_lock, flags);
 }
 
+static void gnttab_set_free(unsigned int start, unsigned int n)
+{
+	unsigned int i;
+
+	for (i = start; i < start + n - 1; i++)
+		gnttab_entry(i) = i + 1;
+
+	gnttab_entry(i) = GNTTAB_LIST_END;
+	if (!gnttab_free_count) {
+		gnttab_free_head = start;
+		gnttab_free_tail_ptr = &gnttab_free_head;
+	} else {
+		gnttab_entry(gnttab_last_free) = start;
+	}
+	gnttab_free_count += n;
+	gnttab_last_free = i;
+
+	bitmap_set(gnttab_free_bitmap, start, n);
+}
+
 /*
  * Following applies to gnttab_update_entry_v1 and gnttab_update_entry_v2.
  * Introducing a valid entry into the grant table:
@@ -450,23 +604,31 @@ void gnttab_free_grant_references(grant_ref_t head)
 {
 	grant_ref_t ref;
 	unsigned long flags;
-	int count = 1;
-	if (head == GNTTAB_LIST_END)
-		return;
+
 	spin_lock_irqsave(&gnttab_list_lock, flags);
-	ref = head;
-	while (gnttab_entry(ref) != GNTTAB_LIST_END) {
-		ref = gnttab_entry(ref);
-		count++;
+	while (head != GNTTAB_LIST_END) {
+		ref = gnttab_entry(head);
+		put_free_entry_locked(head);
+		head = ref;
 	}
-	gnttab_entry(ref) = gnttab_free_head;
-	gnttab_free_head = head;
-	gnttab_free_count += count;
 	check_free_callbacks();
 	spin_unlock_irqrestore(&gnttab_list_lock, flags);
 }
 EXPORT_SYMBOL_GPL(gnttab_free_grant_references);
 
+void gnttab_free_grant_reference_seq(grant_ref_t head, unsigned int count)
+{
+	unsigned long flags;
+	unsigned int i;
+
+	spin_lock_irqsave(&gnttab_list_lock, flags);
+	for (i = count; i > 0; i--)
+		put_free_entry_locked(head + i - 1);
+	check_free_callbacks();
+	spin_unlock_irqrestore(&gnttab_list_lock, flags);
+}
+EXPORT_SYMBOL_GPL(gnttab_free_grant_reference_seq);
+
 int gnttab_alloc_grant_references(u16 count, grant_ref_t *head)
 {
 	int h = get_free_entries(count);
@@ -480,6 +642,24 @@ int gnttab_alloc_grant_references(u16 count, grant_ref_t *head)
 }
 EXPORT_SYMBOL_GPL(gnttab_alloc_grant_references);
 
+int gnttab_alloc_grant_reference_seq(unsigned int count, grant_ref_t *first)
+{
+	int h;
+
+	if (count == 1)
+		h = get_free_entries(1);
+	else
+		h = get_free_entries_seq(count);
+
+	if (h < 0)
+		return -ENOSPC;
+
+	*first = h;
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(gnttab_alloc_grant_reference_seq);
+
 int gnttab_empty_grant_references(const grant_ref_t *private_head)
 {
 	return (*private_head == GNTTAB_LIST_END);
@@ -572,16 +752,13 @@ static int grow_gnttab_list(unsigned int more_frames)
 			goto grow_nomem;
 	}
 
+	gnttab_set_free(gnttab_size, extra_entries);
 
-	for (i = grefs_per_frame * nr_grant_frames;
-	     i < grefs_per_frame * new_nr_grant_frames - 1; i++)
-		gnttab_entry(i) = i + 1;
-
-	gnttab_entry(i) = gnttab_free_head;
-	gnttab_free_head = grefs_per_frame * nr_grant_frames;
-	gnttab_free_count += extra_entries;
+	if (!gnttab_free_tail_ptr)
+		gnttab_free_tail_ptr = __gnttab_entry(gnttab_size);
 
 	nr_grant_frames = new_nr_grant_frames;
+	gnttab_size += extra_entries;
 
 	check_free_callbacks();
 
@@ -1424,20 +1601,20 @@ static int gnttab_expand(unsigned int req_entries)
 int gnttab_init(void)
 {
 	int i;
-	unsigned long max_nr_grant_frames;
+	unsigned long max_nr_grant_frames, max_nr_grefs;
 	unsigned int max_nr_glist_frames, nr_glist_frames;
-	unsigned int nr_init_grefs;
 	int ret;
 
 	gnttab_request_version();
 	max_nr_grant_frames = gnttab_max_grant_frames();
+	max_nr_grefs = max_nr_grant_frames *
+			gnttab_interface->grefs_per_grant_frame;
 	nr_grant_frames = 1;
 
 	/* Determine the maximum number of frames required for the
 	 * grant reference free list on the current hypervisor.
 	 */
-	max_nr_glist_frames = (max_nr_grant_frames *
-			       gnttab_interface->grefs_per_grant_frame / RPP);
+	max_nr_glist_frames = max_nr_grefs / RPP;
 
 	gnttab_list = kmalloc_array(max_nr_glist_frames,
 				    sizeof(grant_ref_t *),
@@ -1454,6 +1631,12 @@ int gnttab_init(void)
 		}
 	}
 
+	gnttab_free_bitmap = bitmap_zalloc(max_nr_grefs, GFP_KERNEL);
+	if (!gnttab_free_bitmap) {
+		ret = -ENOMEM;
+		goto ini_nomem;
+	}
+
 	ret = arch_gnttab_init(max_nr_grant_frames,
 			       nr_status_frames(max_nr_grant_frames));
 	if (ret < 0)
@@ -1464,15 +1647,10 @@ int gnttab_init(void)
 		goto ini_nomem;
 	}
 
-	nr_init_grefs = nr_grant_frames *
-			gnttab_interface->grefs_per_grant_frame;
-
-	for (i = GNTTAB_NR_RESERVED_ENTRIES; i < nr_init_grefs - 1; i++)
-		gnttab_entry(i) = i + 1;
+	gnttab_size = nr_grant_frames * gnttab_interface->grefs_per_grant_frame;
 
-	gnttab_entry(nr_init_grefs - 1) = GNTTAB_LIST_END;
-	gnttab_free_count = nr_init_grefs - GNTTAB_NR_RESERVED_ENTRIES;
-	gnttab_free_head  = GNTTAB_NR_RESERVED_ENTRIES;
+	gnttab_set_free(GNTTAB_NR_RESERVED_ENTRIES,
+			gnttab_size - GNTTAB_NR_RESERVED_ENTRIES);
 
 	printk("Grant table initialized\n");
 	return 0;
@@ -1481,6 +1659,7 @@ int gnttab_init(void)
 	for (i--; i >= 0; i--)
 		free_page((unsigned long)gnttab_list[i]);
 	kfree(gnttab_list);
+	bitmap_free(gnttab_free_bitmap);
 	return ret;
 }
 EXPORT_SYMBOL_GPL(gnttab_init);
diff --git a/include/xen/grant_table.h b/include/xen/grant_table.h
index 527c990..e279be3 100644
--- a/include/xen/grant_table.h
+++ b/include/xen/grant_table.h
@@ -127,10 +127,14 @@ int gnttab_try_end_foreign_access(grant_ref_t ref);
  */
 int gnttab_alloc_grant_references(u16 count, grant_ref_t *pprivate_head);
 
+int gnttab_alloc_grant_reference_seq(unsigned int count, grant_ref_t *first);
+
 void gnttab_free_grant_reference(grant_ref_t ref);
 
 void gnttab_free_grant_references(grant_ref_t head);
 
+void gnttab_free_grant_reference_seq(grant_ref_t head, unsigned int count);
+
 int gnttab_empty_grant_references(const grant_ref_t *pprivate_head);
 
 int gnttab_claim_grant_reference(grant_ref_t *pprivate_head);
-- 
2.7.4


