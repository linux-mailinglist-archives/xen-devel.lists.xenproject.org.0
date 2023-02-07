Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E859C68CBFD
	for <lists+xen-devel@lfdr.de>; Tue,  7 Feb 2023 02:40:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.490770.759612 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pPCwx-0003uC-O0; Tue, 07 Feb 2023 01:39:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 490770.759612; Tue, 07 Feb 2023 01:39:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pPCwx-0003sA-K3; Tue, 07 Feb 2023 01:39:11 +0000
Received: by outflank-mailman (input) for mailman id 490770;
 Tue, 07 Feb 2023 01:39:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UaN9=6D=invisiblethingslab.com=demi@srs-se1.protection.inumbo.net>)
 id 1pPCwv-0003s4-Q5
 for xen-devel@lists.xenproject.org; Tue, 07 Feb 2023 01:39:10 +0000
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 34df7b83-a688-11ed-933c-83870f6b2ba8;
 Tue, 07 Feb 2023 02:39:06 +0100 (CET)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id C118C5C0176;
 Mon,  6 Feb 2023 20:39:04 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Mon, 06 Feb 2023 20:39:04 -0500
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 6 Feb 2023 20:39:03 -0500 (EST)
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
X-Inumbo-ID: 34df7b83-a688-11ed-933c-83870f6b2ba8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding:date
	:date:from:from:in-reply-to:message-id:mime-version:reply-to
	:sender:subject:subject:to:to; s=fm3; t=1675733944; x=
	1675820344; bh=E77I4hzJ5OTSfxMPHbdAio8DoXPAgvCkC3DV+Z4FNik=; b=J
	yusuLB9XWJz/Qxu6kslR1fuSua7vWyQ54j9P3Rs7PS+T//fXoFg2QxbJ6wwVh40C
	1uL50HMkyZaCBf0TxEzcX9Lu/3SvaaWxgYkYctL/MbDIxeJTvGzQZgsrjckiJ/y0
	ud3FpVhmnotDLzTsgcBdpHyupVZkaZ0fG98kAGqwjEvZADqR/t2JEWuqo6CI8+oD
	A/xMPgkl896EmEHc98jCqceAh4v5fvZXjIeaWAg/uvSR2Lxi7LpXqxJ5LFqqJ5zo
	Pkr8oxlL+1aAhfqv5tlbuY9gSn0aq9gL1XsKU8waxK4GcAOz+kd+2aWYAlztBkWi
	tICXOBn2XhnTch9l+moSA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:message-id
	:mime-version:reply-to:sender:subject:subject:to:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1675733944; x=1675820344; bh=E77I4hzJ5OTSfxMPHbdAio8DoXPAgvCkC3D
	V+Z4FNik=; b=RPb59f+bXTM7Z6jyL/zagY5/QrAnovigvVvk9mk0IRKWrp09bBt
	yMWhJW07bQH7IdQrbtvZow4fI2OfEP3gAzthojHEdmwgVEecisfiWxPdECr6Oj89
	Lh7OWEA1Dd7S8QEsys5tm2fkugVYFhDYOXwfFGQ+15Vt/hu7A4uT8wy1PYGnNNHK
	5XnwEwpYRoMAydK0uf70SJo+tdTt64rQ4s+OxnOyTsORyhNDppVNyK4730a3nqzv
	3EKlEd6t7z/9Y5K8V27WZKOW+TFec/rpbYZK05Xo4gIns6W8m4jdVuiK5VCn5ZRA
	OhAcotsxj4njp1NGwjktiUnavSe7OTbHnnA==
X-ME-Sender: <xms:uKvhY5bH24OuiGjPFmhamXM2R9VKeTGXheyACO_FyHvrSiVjM9_fwg>
    <xme:uKvhYwbbIvTDHC2V_EK2CwJHfus6ku71lw0TJ7cONYldz1FairrCUNxckI5MNyqQr
    56YnsgFB0mJ9Tg>
X-ME-Received: <xmr:uKvhY7_9hlgP5_uIKhj5TZo0XkO_fWKAr_ej9nOFExW4U6fz_Wpsybh1ovo1qLaqIVGoX5jEuyA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrudegjedgfeeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofgggfestdekredtredttdenucfhrhhomhepffgvmhhiucfo
    rghrihgvucfqsggvnhhouhhruceouggvmhhisehinhhvihhsihgslhgvthhhihhnghhslh
    grsgdrtghomheqnecuggftrfgrthhtvghrnhepvdefgeekvdekgfffgeekhfeijedtffek
    hefhleehfeejueetgfelgefgtdevieelnecuvehluhhsthgvrhfuihiivgeptdenucfrrg
    hrrghmpehmrghilhhfrhhomhepuggvmhhisehinhhvihhsihgslhgvthhhihhnghhslhgr
    sgdrtghomh
X-ME-Proxy: <xmx:uKvhY3oQa8wYczDpKwbrarY2d0Ly_YGfQGasjtZ751z9td-iwQuTKw>
    <xmx:uKvhY0pkH3P7t9I-8MiYBOKtPOxSbRTQhabgkLjV8NOVwS5pR04MvA>
    <xmx:uKvhY9TLllkVafCB3_bXIULjSmVC1tyRWybk7H1MjC6RgThA1x_ftA>
    <xmx:uKvhY9kwzMFbTlud-IAcZzafbW1sdy8FV_4e7Q6_rqnUZeUBgLSAfw>
Feedback-ID: iac594737:Fastmail
From: Demi Marie Obenour <demi@invisiblethingslab.com>
To: Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Cc: Demi Marie Obenour <demi@invisiblethingslab.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	xen-devel@lists.xenproject.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] xen: speed up grant-table reclaim
Date: Mon,  6 Feb 2023 20:38:56 -0500
Message-Id: <20230207013856.1508-1-demi@invisiblethingslab.com>
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

Fixes QubesOS/qubes-issues#7410 (memory leak)
Fixes QubesOS/qubes-issues#7359 (excessive logging)
---
Anyone have suggestions for improving the grant mechanism?  Argo isn't
a good option, as in the GUI protocol there are substantial performance
wins to be had by using true shared memory.

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

