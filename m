Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DC4E68CC75
	for <lists+xen-devel@lfdr.de>; Tue,  7 Feb 2023 03:11:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.490786.759634 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pPDRX-0000uG-BU; Tue, 07 Feb 2023 02:10:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 490786.759634; Tue, 07 Feb 2023 02:10:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pPDRX-0000sL-8F; Tue, 07 Feb 2023 02:10:47 +0000
Received: by outflank-mailman (input) for mailman id 490786;
 Tue, 07 Feb 2023 02:10:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UaN9=6D=invisiblethingslab.com=demi@srs-se1.protection.inumbo.net>)
 id 1pPDRV-0000sF-5Q
 for xen-devel@lists.xenproject.org; Tue, 07 Feb 2023 02:10:45 +0000
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9f37da52-a68c-11ed-93b5-47a8fe42b414;
 Tue, 07 Feb 2023 03:10:42 +0100 (CET)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
 by mailout.nyi.internal (Postfix) with ESMTP id 2898B5C0172;
 Mon,  6 Feb 2023 21:10:41 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Mon, 06 Feb 2023 21:10:41 -0500
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 6 Feb 2023 21:10:39 -0500 (EST)
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
X-Inumbo-ID: 9f37da52-a68c-11ed-93b5-47a8fe42b414
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding:date
	:date:from:from:in-reply-to:message-id:mime-version:reply-to
	:sender:subject:subject:to:to; s=fm3; t=1675735841; x=
	1675822241; bh=0/QcbN0ctdlX8hZfS9z2Phx50pOCQWlpB7rg/xsi3T8=; b=g
	KIMsGmT/w5H9y1dmBcwk3+EuiJVcncOMk+yfPyNXHgrIcp4CDmqk2RFQQy4RJwhB
	FVtgklsUkVPcUHpc063Zw7r4pKQCr0mDeKglx3SMNE19OXcbccjitm09hHq5aFYe
	QA0LPGu1N8xInLYh2QLzBj0CVo4eioeTLPVHXbnEElLcrJ1IFMH8Czc/IPmnZkrH
	cEoSnslw4s4aII+uGqT+wIuHnUhTO8rpJWqnac1eaydxzI67KGQ7sEmWryf0UznS
	cnCZgyikSbrkOOt71NO0EGTNZnniIs673RSLus88v8A6XnD1fS4ixVJgeRRybNdQ
	wMQiRa4k8DBuU4cEJN8Ow==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:message-id
	:mime-version:reply-to:sender:subject:subject:to:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1675735841; x=1675822241; bh=0/QcbN0ctdlX8hZfS9z2Phx50pOCQWlpB7r
	g/xsi3T8=; b=hb2PbVPN3WfbPNLBQ9T4tGr5IrsBE7dbEnpTs8tq9aMNH8NkGVP
	JY+CW8PDPHWa76W7eElX52MQRkTtijle4Q7tOsCeHQLZgDdZQXu8R2ZHnkBh9pH5
	GtkhocApSdYzy2ig8uylwpG41Kj+zTP/Ym7Hb2nvtzxvvyzOmIF/t1I3wesrCvSp
	GP4McVSIEJJaM44SuiOUdMKfZSmUjlr0WZ/8f98fO1JjmXHBbFdLTrKbuKXtBcKx
	cTaA/Ck7UoX6QmVeNlSjLycSJq2eYLJdgObIur+bzJCSGPU/dOdgsr7DjfJi1iFM
	6mq2T+vgHNxmpAEzaNHXUl9Kq0lERwJN0fw==
X-ME-Sender: <xms:ILPhYwW6IVh371s97hKzZR9Qk2Q6VUR5aXwNH-6kQ7YujiRXB63qcg>
    <xme:ILPhY0nODu7lloNRzrN9dNHjcgPcAuX9C3HoUwaw_5GmfUMYsbjqG9Kk-hqIF9jtp
    l8HXlWXTw0rXgc>
X-ME-Received: <xmr:ILPhY0bDTxqObbKtkCmBCDiKWIlNd1U8mWQf1n4xL45YzHvc7tLNoxuvuOtV4TIVbTLqf044ZEw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrudegjedggeefucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofgggfestdekredtredttdenucfhrhhomhepffgvmhhiucfo
    rghrihgvucfqsggvnhhouhhruceouggvmhhisehinhhvihhsihgslhgvthhhihhnghhslh
    grsgdrtghomheqnecuggftrfgrthhtvghrnhepvdefgeekvdekgfffgeekhfeijedtffek
    hefhleehfeejueetgfelgefgtdevieelnecuvehluhhsthgvrhfuihiivgeptdenucfrrg
    hrrghmpehmrghilhhfrhhomhepuggvmhhisehinhhvihhsihgslhgvthhhihhnghhslhgr
    sgdrtghomh
X-ME-Proxy: <xmx:ILPhY_V00totKS0BxZ9aPl3vGK_XxsAoFh5J5bn-KwA5HVXTPynsIA>
    <xmx:ILPhY6muz8TUys675Pbn432iQu2vAUNNBaIALvKSUMO_RhHWSUt4Sw>
    <xmx:ILPhY0fQC3ZFSDslt0dVPU7HHRqKZsU7vqzUrxDd0I9b-p0yLCFeYw>
    <xmx:IbPhYxvkfghLLdHssaNt15xVJBMOLagcX9PELBFZgGWZQsP8trFrJA>
Feedback-ID: iac594737:Fastmail
From: Demi Marie Obenour <demi@invisiblethingslab.com>
To: Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Cc: Demi Marie Obenour <demi@invisiblethingslab.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	xen-devel@lists.xenproject.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH] xen: speed up grant-table reclaim
Date: Mon,  6 Feb 2023 21:10:33 -0500
Message-Id: <20230207021033.1797-1-demi@invisiblethingslab.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When a grant entry is still in use by the remote domain, Linux must put
it on a deferred list.  Normally, this list is very short, because
the PV network and block protocols expect the backend to unmap the grant
first.  However, Qubes OS's GUI protocol is subject to the constraints
of the X Window System, and as such winds up with the frontend unmapping
the window first.  As a result, the list can grow very large, resulting
in a massive memory leak and eventual VM freeze.

Fix this problem by bumping the number of entries that the VM will
attempt to free at each iteration to 10000.  This is an ugly hack that
may well make a denial of service easier, but for Qubes OS that is less
bad than the problem Qubes OS users are facing today.  There really
needs to be a way for a frontend to be notified when the backend has
unmapped the grants.  Additionally, a module parameter is provided to
allow tuning the reclaim speed.

The code previously used printk(KERN_DEBUG) whenever it had to defer
reclaiming a page because the grant was still mapped.  This resulted in
a large volume of log messages that bothered users.  Use pr_debug
instead, which suppresses the messages by default.  Developers can
enable them using the dynamic debug mechanism.

Fixes: QubesOS/qubes-issues#7410 (memory leak)
Fixes: QubesOS/qubes-issues#7359 (excessive logging)
Fixes: 569ca5b3f94c ("xen/gnttab: add deferred freeing logic")
Cc: stable@vger.kernel.org
Signed-off-by: Demi Marie Obenour <demi@invisiblethingslab.com>
---
Anyone have suggestions for improving the grant mechanism?  Argo isn't
a good option, as in the GUI protocol there are substantial performance
wins to be had by using true shared memory.  Resending as I forgot the
Signed-off-by on the first submission.  Sorry about that.

 drivers/xen/grant-table.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/xen/grant-table.c b/drivers/xen/grant-table.c
index 5c83d41..2c2faa7 100644
--- a/drivers/xen/grant-table.c
+++ b/drivers/xen/grant-table.c
@@ -355,14 +355,20 @@
 static void gnttab_handle_deferred(struct timer_list *);
 static DEFINE_TIMER(deferred_timer, gnttab_handle_deferred);
 
+static atomic64_t deferred_count;
+static atomic64_t leaked_count;
+static unsigned int free_per_iteration = 10000;
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
@@ -372,10 +378,13 @@
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
@@ -387,14 +396,15 @@
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
@@ -402,7 +412,7 @@
 {
 	struct deferred_entry *entry;
 	gfp_t gfp = (in_atomic() || irqs_disabled()) ? GFP_ATOMIC : GFP_KERNEL;
-	const char *what = KERN_WARNING "leaking";
+	uint64_t leaked, deferred;
 
 	entry = kmalloc(sizeof(*entry), gfp);
 	if (!page) {
@@ -426,12 +436,20 @@
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

