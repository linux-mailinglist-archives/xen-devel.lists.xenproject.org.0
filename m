Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 581CA763CFE
	for <lists+xen-devel@lfdr.de>; Wed, 26 Jul 2023 18:55:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.570619.892564 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qOhmD-0002Cc-Tg; Wed, 26 Jul 2023 16:54:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 570619.892564; Wed, 26 Jul 2023 16:54:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qOhmD-0002Aq-Qa; Wed, 26 Jul 2023 16:54:17 +0000
Received: by outflank-mailman (input) for mailman id 570619;
 Wed, 26 Jul 2023 16:54:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QPkR=DM=invisiblethingslab.com=demi@srs-se1.protection.inumbo.net>)
 id 1qOhmB-0002Ak-6e
 for xen-devel@lists.xenproject.org; Wed, 26 Jul 2023 16:54:15 +0000
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0a3eefee-2bd5-11ee-8613-37d641c3527e;
 Wed, 26 Jul 2023 18:54:11 +0200 (CEST)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id 8E4515C0198;
 Wed, 26 Jul 2023 12:54:09 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Wed, 26 Jul 2023 12:54:09 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 26 Jul 2023 12:54:08 -0400 (EDT)
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
X-Inumbo-ID: 0a3eefee-2bd5-11ee-8613-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm3; t=1690390449; x=1690476849; bh=ZSGL4tfDeh
	02pkZ94/2tVJRMmAk+Vt00ZLy1MQBP55Y=; b=pYszA4HxujdUCNeHbCaGgqeAQO
	7OxCMPtp39OADgyPrJ6IGJ3WDJaUUCQkw8W4IeToBQ6U4npachIhLOcYUEccTkHl
	qwxZYsglorioRcl0KRpIUKpXyip8suW05TtFMYr1bMH+QKswOV4d9LwXFvry/Xqg
	3oGtzYH6hzJsEQMNzoghVgTZbVv5cXGYVVBFzbpOnwwA/OILuUYNbEc0j8Efosv4
	9uyrpqIPgliYk7JCXuYe8+oaUI3ZpqLm3gMS5amW6wQbBYkNgv2zKepmA9xW4uIA
	9x7mlKYcI/Ut2b66V4Iyh7mb65OBOckVpOgTewFszt3A6YWEbnJnJU/utLfQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1690390449; x=
	1690476849; bh=ZSGL4tfDeh02pkZ94/2tVJRMmAk+Vt00ZLy1MQBP55Y=; b=p
	6FSQOuj/2H3hSBngWtVOKyF58NPGfdIzkHe6K93sZ3hfbatPDPmekGd2XGMw5Ah9
	3gW25iltNtEqN1Box5KAUKiZ+4MHJxflrNs/41tqdzMPmO60q3wmDwTTZnIdR5uw
	Vk+PPTPEHATApmQN8Tq/vdpvUx+nPf11G0pPsKRym/fJ2l3lZfg0ZqvGF6Z6XTtg
	NLxi/VAz3s8Tee8l05WxbQvqPPuhFYMWdHlV9MTNQZopu1SKZ9bUtPRTbFD1gHgn
	r02JTsH9aMaD+mBvaoJHFXdlcafXRZzBa9GPodVTznA88drZPOO/OidmXIJ4LxUM
	L4iUUdL27Um39/kAps+Qg==
X-ME-Sender: <xms:sU_BZDVanUH1yxDKB6VmX3u-TXXoyxnMdmkrbZ5tFPl4usVaxA_VTg>
    <xme:sU_BZLki3bVKhpGN6QQuXJgCS8krimxJhOyLwUPlkviarwwgJ9I2aEAlL4YARhBfi
    r9L0C3Frfa_FdY>
X-ME-Received: <xmr:sU_BZPZWRoRDmNl96z1D2Kl0ydEC3gzDR2om4Pn6Mn6UNbD-ORKbbM34bd9aZGG3lubCRSqXH-s>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedviedriedvgddutdehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepffgvmhhi
    ucforghrihgvucfqsggvnhhouhhruceouggvmhhisehinhhvihhsihgslhgvthhhihhngh
    hslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepgefhffegieektedtgfffvdfhhfdt
    veeiieeuffduvdehieehjeekhfelieehkeelnecuffhomhgrihhnpehquhgsvghsqdhosh
    drohhrghenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhm
    peguvghmihesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhm
X-ME-Proxy: <xmx:sU_BZOV2v0ctPrKU6GoLv_zHGVZq5Zp0SlKSNGomctJo6_eWv_muyA>
    <xmx:sU_BZNkht_7Ir8BBPzKzBddfkdmBcXTmWsPqS_Imo8MMQ6ttIwVfVw>
    <xmx:sU_BZLf7VN-6yIGWIZglx92ys71yADS85Ww7VdyGX2cggU-IHARG5Q>
    <xmx:sU_BZGD08CUwH15ywy98aCsXj9BdYpf1yKfWakXHMXnutqeuv3OXUA>
Feedback-ID: iac594737:Fastmail
From: Demi Marie Obenour <demi@invisiblethingslab.com>
To: Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Cc: Demi Marie Obenour <demi@invisiblethingslab.com>,
	Xen developer discussion <xen-devel@lists.xenproject.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	stable@vger.kernel.org
Subject: [PATCH v4] xen: speed up grant-table reclaim
Date: Wed, 26 Jul 2023 12:52:41 -0400
Message-ID: <20230726165354.1252-1-demi@invisiblethingslab.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230627172216.1359-1-demi@invisiblethingslab.com>
References: <20230627172216.1359-1-demi@invisiblethingslab.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When a grant entry is still in use by the remote domain, Linux must put
it on a deferred list.  Normally, this list is very short, because
the PV network and block protocols expect the backend to unmap the grant
first.  However, Qubes OS's GUI protocol is subject to the constraints
of the X Window System, and as such winds up with the frontend unmapping
the window first.  As a result, the list can grow very large, resulting
in a massive memory leak and eventual VM freeze.

To partially solve this problem, make the number of entries that the VM
will attempt to free at each iteration tunable.  The default is still
10, but it can be overridden via a module parameter.

This is Cc: stable because (when combined with appropriate userspace
changes) it fixes a severe performance and stability problem for Qubes
OS users.

Cc: stable@vger.kernel.org
Signed-off-by: Demi Marie Obenour <demi@invisiblethingslab.com>
---
 Documentation/ABI/testing/sysfs-module | 11 +++++++
 drivers/xen/grant-table.c              | 40 +++++++++++++++++++-------
 2 files changed, 40 insertions(+), 11 deletions(-)

Changes since v3:
- do not mention Kconfig in the commit message.
- add entry to Documentation/ABI for the new sysfs entry.

Changes since v2:
- use atomic_inc_return(x) and atomic_dec_return(x) instead of
  atomic_add_return(1, x) and atomic_sub_return(1, x) respectively.
- move module_param macro closer to the definition of
  free_per_iteration.
- add blank line between declarations and statements.

Changes since v1:
- drop setting default via Kconfig

diff --git a/Documentation/ABI/testing/sysfs-module b/Documentation/ABI/testing/sysfs-module
index 08886367d0470e8d8922703a7d5174077801c2a8..62addab47d0c5908d26ec2f5d07db5ce21833566 100644
--- a/Documentation/ABI/testing/sysfs-module
+++ b/Documentation/ABI/testing/sysfs-module
@@ -60,3 +60,14 @@ Description:	Module taint flags:
 			C   staging driver module
 			E   unsigned module
 			==  =====================
+
+What:		/sys/module/grant_table/parameters/free_per_iteration
+Date:		July 2023
+KernelVersion:	6.5 but backported to all supported stable branches
+Contact:	Xen developer discussion <xen-devel@lists.xenproject.org>
+Description:	Read and write number of grant entries to attempt to free per iteration.
+
+		Note: Future versions of Xen and Linux may provide a better
+		interface for controlling the rate of deferred grant reclaim
+		or may not need it at all.
+Users:		Qubes OS (https://www.qubes-os.org)
diff --git a/drivers/xen/grant-table.c b/drivers/xen/grant-table.c
index e1ec725c2819d4d5dede063eb00d86a6d52944c0..f13c3b76ad1eb7110e2a2981e9fa4e504174e431 100644
--- a/drivers/xen/grant-table.c
+++ b/drivers/xen/grant-table.c
@@ -498,14 +498,21 @@ static LIST_HEAD(deferred_list);
 static void gnttab_handle_deferred(struct timer_list *);
 static DEFINE_TIMER(deferred_timer, gnttab_handle_deferred);
 
+static atomic64_t deferred_count;
+static atomic64_t leaked_count;
+static unsigned int free_per_iteration = 10;
+module_param(free_per_iteration, uint, 0600);
+
 static void gnttab_handle_deferred(struct timer_list *unused)
 {
-	unsigned int nr = 10;
+	unsigned int nr = READ_ONCE(free_per_iteration);
+	const bool ignore_limit = nr == 0;
 	struct deferred_entry *first = NULL;
 	unsigned long flags;
+	size_t freed = 0;
 
 	spin_lock_irqsave(&gnttab_list_lock, flags);
-	while (nr--) {
+	while ((ignore_limit || nr--) && !list_empty(&deferred_list)) {
 		struct deferred_entry *entry
 			= list_first_entry(&deferred_list,
 					   struct deferred_entry, list);
@@ -515,10 +522,14 @@ static void gnttab_handle_deferred(struct timer_list *unused)
 		list_del(&entry->list);
 		spin_unlock_irqrestore(&gnttab_list_lock, flags);
 		if (_gnttab_end_foreign_access_ref(entry->ref)) {
+			uint64_t ret = atomic64_dec_return(&deferred_count);
+
 			put_free_entry(entry->ref);
-			pr_debug("freeing g.e. %#x (pfn %#lx)\n",
-				 entry->ref, page_to_pfn(entry->page));
+			pr_debug("freeing g.e. %#x (pfn %#lx), %llu remaining\n",
+				 entry->ref, page_to_pfn(entry->page),
+				 (unsigned long long)ret);
 			put_page(entry->page);
+			freed++;
 			kfree(entry);
 			entry = NULL;
 		} else {
@@ -530,21 +541,22 @@ static void gnttab_handle_deferred(struct timer_list *unused)
 		spin_lock_irqsave(&gnttab_list_lock, flags);
 		if (entry)
 			list_add_tail(&entry->list, &deferred_list);
-		else if (list_empty(&deferred_list))
-			break;
 	}
-	if (!list_empty(&deferred_list) && !timer_pending(&deferred_timer)) {
+	if (list_empty(&deferred_list))
+		WARN_ON(atomic64_read(&deferred_count));
+	else if (!timer_pending(&deferred_timer)) {
 		deferred_timer.expires = jiffies + HZ;
 		add_timer(&deferred_timer);
 	}
 	spin_unlock_irqrestore(&gnttab_list_lock, flags);
+	pr_debug("Freed %zu references", freed);
 }
 
 static void gnttab_add_deferred(grant_ref_t ref, struct page *page)
 {
 	struct deferred_entry *entry;
 	gfp_t gfp = (in_atomic() || irqs_disabled()) ? GFP_ATOMIC : GFP_KERNEL;
-	const char *what = KERN_WARNING "leaking";
+	uint64_t leaked, deferred;
 
 	entry = kmalloc(sizeof(*entry), gfp);
 	if (!page) {
@@ -567,10 +579,16 @@ static void gnttab_add_deferred(grant_ref_t ref, struct page *page)
 			add_timer(&deferred_timer);
 		}
 		spin_unlock_irqrestore(&gnttab_list_lock, flags);
-		what = KERN_DEBUG "deferring";
+		deferred = atomic64_inc_return(&deferred_count);
+		leaked = atomic64_read(&leaked_count);
+		pr_debug("deferring g.e. %#x (pfn %#lx) (total deferred %llu, total leaked %llu)\n",
+			 ref, page ? page_to_pfn(page) : -1, deferred, leaked);
+	} else {
+		deferred = atomic64_read(&deferred_count);
+		leaked = atomic64_inc_return(&leaked_count);
+		pr_warn("leaking g.e. %#x (pfn %#lx) (total deferred %llu, total leaked %llu)\n",
+			ref, page ? page_to_pfn(page) : -1, deferred, leaked);
 	}
-	printk("%s g.e. %#x (pfn %#lx)\n",
-	       what, ref, page ? page_to_pfn(page) : -1);
 }
 
 int gnttab_try_end_foreign_access(grant_ref_t ref)
-- 
Sincerely,
Demi Marie Obenour (she/her/hers)
Invisible Things Lab

