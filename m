Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 16ECB73CCBA
	for <lists+xen-devel@lfdr.de>; Sat, 24 Jun 2023 22:58:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.554723.866110 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qDAJM-0003YW-NP; Sat, 24 Jun 2023 20:56:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 554723.866110; Sat, 24 Jun 2023 20:56:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qDAJM-0003WG-Iv; Sat, 24 Jun 2023 20:56:48 +0000
Received: by outflank-mailman (input) for mailman id 554723;
 Sat, 24 Jun 2023 20:56:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HxfM=CM=invisiblethingslab.com=demi@srs-se1.protection.inumbo.net>)
 id 1qDAJL-0003WA-1W
 for xen-devel@lists.xenproject.org; Sat, 24 Jun 2023 20:56:47 +0000
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com
 [64.147.123.19]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9ca8593c-12d1-11ee-8611-37d641c3527e;
 Sat, 24 Jun 2023 22:56:41 +0200 (CEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 088F3320005D;
 Sat, 24 Jun 2023 16:56:35 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Sat, 24 Jun 2023 16:56:36 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 24 Jun 2023 16:56:34 -0400 (EDT)
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
X-Inumbo-ID: 9ca8593c-12d1-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:from:from:in-reply-to:message-id
	:mime-version:reply-to:sender:subject:subject:to:to; s=fm2; t=
	1687640195; x=1687726595; bh=aTk/llGT6CDFgEyN9hwEaJy+86atLHKKPsv
	mBAPjgoI=; b=fyMhMcfww/xTkjO40U1PRouf/cP4p09aJoUZE4MMa9yghcSCirW
	7UhJhZT0zNY0WltKQnh35PIvYvGGbEZ+i+ryRtrAPNs6OkOisr5tMzLw9/gORTX/
	F5vPvrCAGF1qBYdyp1L2WXsgHEO/8RR3yJG7y1PFsZfXyCwAuNIe0n7CvZFw/e8T
	YCk2lpjTG1mlvGIJD2JYYPHSas6RdpPpuUUNhm2zTskIsYC5n6LoVb2UIzXhKx+T
	7tlmD4XOo11ozSXNakt0mfwmRBnzKPws4MXB/lD02BaFNmzvmIxuzTKhctjXm8hC
	YUceEjpRRFs7ESg6WppzCpSjC52+iguZOfA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm2; t=1687640195; x=1687726595; bh=aTk/llGT6CDFg
	EyN9hwEaJy+86atLHKKPsvmBAPjgoI=; b=ivb94SJsXamChFqJteILHqJU/fr28
	VyX3tHydhyEw+jTyLFTCCXbrKV0WkdAvAUhPJ6hATPN492d6RtAq3TNkgkjRQxXt
	iuuQTo3ImKNZQ0zcI0JbICYIrEnKPmEOH1V1GPtxDI/5YoeKuOhdJK/vIRaEDAIf
	bOimXxC5laS/JBUcbBctecsP0+M6Owpo+qbdYzmMvkzTU2DDQdoUV948FJH1Jifa
	S0khYuSQSHqclJ2hJ9JL+L835k6iDDaM+KMu2NzX3McuT5zM3s+xcHOP3jwSv4U8
	IzbJIcmP45vRM93XTinU7XUtjhKD5WV41TR284jhtlm8amh9iRN4Px0SQ==
X-ME-Sender: <xms:g1iXZLPnD7ffTl6RBBn7Yt601GHwbFQy8nFtU0-jht6mnj9lV6HAjg>
    <xme:g1iXZF-V6lZsIxn2Dv1XqFff_B9BsN4dPeQbqK_0ixJUIkqQb-SJrR22ovX0RX1K3
    Q0awKBGFXsiNeA>
X-ME-Received: <xmr:g1iXZKRLCdHtnb8qB3P40XRenr8Ln5luAUunwkohcH2tCAC7yGUvRUXMgTa4RIu1W-ORu2uKRFA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrgeegjedgudehgecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpefhvfevufffkffoggfgsedtkeertdertddtnecuhfhrohhmpeffvghmihcu
    ofgrrhhivgcuqfgsvghnohhurhcuoeguvghmihesihhnvhhishhisghlvghthhhinhhgsh
    hlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpedvfeegkedvkefgffegkefhieejtdff
    keehhfelheefjeeutefgleeggfdtveeileenucevlhhushhtvghrufhiiigvpedtnecurf
    grrhgrmhepmhgrihhlfhhrohhmpeguvghmihesihhnvhhishhisghlvghthhhinhhgshhl
    rggsrdgtohhm
X-ME-Proxy: <xmx:g1iXZPv4_ZJiUfO-u9rr0-Cv_fVhGsZR53_l9RdN4GiZSMcB0awJSQ>
    <xmx:g1iXZDdJfDFNf6q3tZH3DPxOAlyBqOg2KciYJU_QvzPxQlnbk8c47A>
    <xmx:g1iXZL0yTW0OTBS3lNtaL_KYA8HByBogtW4XRqH134aoSnv9J-9cbw>
    <xmx:g1iXZFs1MCjPPunGcWBhMOEilYWSVhSB7UdcKLKy1GbDj6C57Ye_NA>
Feedback-ID: iac594737:Fastmail
From: Demi Marie Obenour <demi@invisiblethingslab.com>
To: Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	Jan Beulich <JBeulich@suse.com>,
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Cc: Demi Marie Obenour <demi@invisiblethingslab.com>,
	Xen developer discussion <xen-devel@lists.xenproject.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	stable@vger.kernel.org
Subject: [PATCH v3] xen: speed up grant-table reclaim
Date: Sat, 24 Jun 2023 16:56:22 -0400
Message-ID: <20230624205624.1817-1-demi@invisiblethingslab.com>
X-Mailer: git-send-email 2.41.0
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
10, but it can be overridden at compile-time (via Kconfig), boot-time
(via a kernel command-line option), or runtime (via sysfs).

This is Cc: stable because (when combined with appropriate userspace
changes) it fixes a severe performance and stability problem for Qubes
OS users.

Cc: stable@vger.kernel.org
Signed-off-by: Demi Marie Obenour <demi@invisiblethingslab.com>
---
 drivers/xen/grant-table.c | 40 ++++++++++++++++++++++++++++-----------
 2 files changed, 41 insertions(+), 11 deletions(-)

diff --git a/drivers/xen/grant-table.c b/drivers/xen/grant-table.c
index e1ec725c2819d4d5dede063eb00d86a6d52944c0..fa666aa6abc3e786dddc94f895641505ec0b23d8 100644
--- a/drivers/xen/grant-table.c
+++ b/drivers/xen/grant-table.c
@@ -498,14 +498,20 @@ static LIST_HEAD(deferred_list);
 static void gnttab_handle_deferred(struct timer_list *);
 static DEFINE_TIMER(deferred_timer, gnttab_handle_deferred);
 
+static atomic64_t deferred_count;
+static atomic64_t leaked_count;
+static unsigned int free_per_iteration = 10;
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
@@ -515,10 +521,13 @@ static void gnttab_handle_deferred(struct timer_list *unused)
 		list_del(&entry->list);
 		spin_unlock_irqrestore(&gnttab_list_lock, flags);
 		if (_gnttab_end_foreign_access_ref(entry->ref)) {
+			uint64_t ret = atomic64_sub_return(1, &deferred_count);
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
@@ -530,21 +539,22 @@ static void gnttab_handle_deferred(struct timer_list *unused)
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
@@ -567,12 +577,20 @@ static void gnttab_add_deferred(grant_ref_t ref, struct page *page)
 			add_timer(&deferred_timer);
 		}
 		spin_unlock_irqrestore(&gnttab_list_lock, flags);
-		what = KERN_DEBUG "deferring";
+		deferred = atomic64_add_return(1, &deferred_count);
+		leaked = atomic64_read(&leaked_count);
+		pr_debug("deferring g.e. %#x (pfn %#lx) (total deferred %llu, total leaked %llu)\n",
+			 ref, page ? page_to_pfn(page) : -1, deferred, leaked);
+	} else {
+		deferred = atomic64_read(&deferred_count);
+		leaked = atomic64_add_return(1, &leaked_count);
+		pr_warn("leaking g.e. %#x (pfn %#lx) (total deferred %llu, total leaked %llu)\n",
+			ref, page ? page_to_pfn(page) : -1, deferred, leaked);
 	}
-	printk("%s g.e. %#x (pfn %#lx)\n",
-	       what, ref, page ? page_to_pfn(page) : -1);
 }
 
+module_param(free_per_iteration, uint, 0600);
+
 int gnttab_try_end_foreign_access(grant_ref_t ref)
 {
 	int ret = _gnttab_end_foreign_access_ref(ref);
-- 
Sincerely,
Demi Marie Obenour (she/her/hers)
Invisible Things Lab

