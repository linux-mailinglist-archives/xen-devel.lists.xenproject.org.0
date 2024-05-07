Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 84E498BE273
	for <lists+xen-devel@lfdr.de>; Tue,  7 May 2024 14:45:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.718064.1120576 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s4KBk-0003Ne-Qe; Tue, 07 May 2024 12:44:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 718064.1120576; Tue, 07 May 2024 12:44:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s4KBk-0003M4-N4; Tue, 07 May 2024 12:44:56 +0000
Received: by outflank-mailman (input) for mailman id 718064;
 Tue, 07 May 2024 12:44:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=w3sU=MK=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1s4KBj-0003AI-SJ
 for xen-devel@lists.xenproject.org; Tue, 07 May 2024 12:44:55 +0000
Received: from wfout4-smtp.messagingengine.com
 (wfout4-smtp.messagingengine.com [64.147.123.147])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 988f90d1-0c6f-11ef-909c-e314d9c70b13;
 Tue, 07 May 2024 14:44:53 +0200 (CEST)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailfout.west.internal (Postfix) with ESMTP id 7B30A1C001C3;
 Tue,  7 May 2024 08:44:50 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Tue, 07 May 2024 08:44:50 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 7 May 2024 08:44:48 -0400 (EDT)
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
X-Inumbo-ID: 988f90d1-0c6f-11ef-909c-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm3; t=1715085890; x=1715172290; bh=lLrdK6DtjD
	VUONkQTnGTL9QCNQzxUIg1GxNz3rQOZI8=; b=jlsdqPycvSAtttPd9k2N0Vf9MT
	tHInZyY+y8waJLqLJj2P2qjZ2AR+DKc/CGRh0sK5lBv7blTm4meaY75ktmcrsH5J
	g60hpl+ONHYI/PArkU5M9Bobhvi+hnjdk8HZD8qwR8uhnyQfyQAWZPZRCMk0mDdy
	H92K3moJcV6pEqikxnWzreihIOkjpKyit1ngF/pHl1UYoX4bxyU2xIIfuEuah3rj
	nFVV4bCbfR9aaW2QSOk7gpQttgnHPM9Cpap6fPYcOy46ZAurk7ZwDOmK3QUdjhFd
	Pda9fSgTc99UwIXUohJLZR8XtiVwyS1XIcQnNU1BVtuAHAH+Kqe5ZNCIUqEQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1715085890; x=
	1715172290; bh=lLrdK6DtjDVUONkQTnGTL9QCNQzxUIg1GxNz3rQOZI8=; b=B
	KpxfY/Wgp6m5U3JzKUOxzFk4TkNst2YgLI58YlZIQyRh1piAscLI+ZLhcgfLh+Eo
	UEnNVxh8+Aa2eTt1xpGLHFNpXQoKM5ZicKZAh5uBHefSr5aXhgVgKWpVSqNkgjX+
	xWPTbN/W3pjm8/XHGfYuu22dG9AVLOzfSV0OY6/1GFZMiC0xINJSn8SGbV75MLZJ
	fpzZpL5YUWVUv3ysiUjrUFOGrJaPXhNNnFeZhAl0zLoKAqvoNXY+R1R9uP8FeiyF
	ix41szVICf3bTz/7ilJ4zNwgE/beiX0rpSkinB35zbOIHRPL+W6rczGNIfrAyQUb
	pYKWyDjxaldRpxPs2Fo1Q==
X-ME-Sender: <xms:QSI6Zrl5bta65n9BYZFfnc3plhAdkB7qyvlQHGIGc3CZ8ZOneJrs0A>
    <xme:QSI6Zu0l6HrL6DMW8Z45SxilizYz2V7MAwlfSkakSbKK5smdPb54CQRP5eaO-WLMk
    B9GQdv23bFdQQ>
X-ME-Received: <xmr:QSI6Zhpsx1qVGEiEz7kpzU8Djzy8Lsf3CpUR3gACAPmGBjGxoCgIPaUvunlK-caY1aHFFjWLyv5QgCjdMHHgZiG_aNlf8BfAa4-aa4qwhKyq_l1OPn4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrvddvkedgheefucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofgjfhggtgfgsehtkeertdertdejnecuhfhrohhmpeforghr
    vghkucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesih
    hnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpefg
    ueduhefgvdefheehudejheefudevueeghfekhfehleegveduteeuiedugffgffenucevlh
    hushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrghrmhgrrhgv
    khesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhm
X-ME-Proxy: <xmx:QSI6ZjnP40qUKd4Z-XLB0DdrVW5AIzH-b0YZb-7-OK0a_oWg7Kra1g>
    <xmx:QSI6Zp01_EFaxsrcW55OjdzikrKFdo3zLwiBKxpYC_zkkqH0QiIibw>
    <xmx:QSI6Zit-MMSZKwj_JhyzEJ5dPNizBiXVXyY-jBCRiGbH4rIbqMjEBQ>
    <xmx:QSI6ZtXrQSZDtL12vC6ohMifrP66wHgnz2Ia85qLIm_GEODh4aGWew>
    <xmx:QiI6ZkRAs5VXOv_jKFLCNsD9pNSZZqNtRA5tpum0T5bIFAKh4GLXzCAv>
Feedback-ID: i1568416f:Fastmail
From: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v7 1/6] x86/msi: Extend per-domain/device warning mechanism
Date: Tue,  7 May 2024 14:44:01 +0200
Message-ID: <0ff02aa7d6f78106a69158794d51c0b32a75431d.1715085837.git-series.marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <cover.a422810661b997e9edf5f8bf5258a4422d9fa3ea.1715085837.git-series.marmarek@invisiblethingslab.com>
References: <cover.a422810661b997e9edf5f8bf5258a4422d9fa3ea.1715085837.git-series.marmarek@invisiblethingslab.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The arch_msix struct had a single "warned" field with a domid for which
warning was issued. Upcoming patch will need similar mechanism for few
more warnings, so change it to save a bit field of issued warnings.

Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
Reviewed-by: Jan Beulich <jbeulich@suse.com>
---
Changes in v6:
- add MSIX_CHECK_WARN macro (Jan)
- drop struct name from warned_kind union (Jan)

New in v5
---
 xen/arch/x86/include/asm/msi.h | 17 ++++++++++++++++-
 xen/arch/x86/msi.c             |  5 +----
 2 files changed, 17 insertions(+), 5 deletions(-)

diff --git a/xen/arch/x86/include/asm/msi.h b/xen/arch/x86/include/asm/msi.h
index 997ccb87be0c..bcfdfd35345d 100644
--- a/xen/arch/x86/include/asm/msi.h
+++ b/xen/arch/x86/include/asm/msi.h
@@ -208,6 +208,15 @@ struct msg_address {
                                        PCI_MSIX_ENTRY_SIZE + \
                                        (~PCI_MSIX_BIRMASK & (PAGE_SIZE - 1)))
 
+#define MSIX_CHECK_WARN(msix, domid, which) ({ \
+    if ( (msix)->warned_domid != (domid) ) \
+    { \
+        (msix)->warned_domid = (domid); \
+        (msix)->warned_kind.all = 0; \
+    } \
+    (msix)->warned_kind.which ? false : ((msix)->warned_kind.which = true); \
+})
+
 struct arch_msix {
     unsigned int nr_entries, used_entries;
     struct {
@@ -217,7 +226,13 @@ struct arch_msix {
     int table_idx[MAX_MSIX_TABLE_PAGES];
     spinlock_t table_lock;
     bool host_maskall, guest_maskall;
-    domid_t warned;
+    domid_t warned_domid;
+    union {
+        uint8_t all;
+        struct {
+            bool maskall                   : 1;
+        };
+    } warned_kind;
 };
 
 void early_msi_init(void);
diff --git a/xen/arch/x86/msi.c b/xen/arch/x86/msi.c
index e721aaf5c001..42c793426da3 100644
--- a/xen/arch/x86/msi.c
+++ b/xen/arch/x86/msi.c
@@ -364,13 +364,10 @@ static bool msi_set_mask_bit(struct irq_desc *desc, bool host, bool guest)
             domid_t domid = pdev->domain->domain_id;
 
             maskall = true;
-            if ( pdev->msix->warned != domid )
-            {
-                pdev->msix->warned = domid;
+            if ( MSIX_CHECK_WARN(pdev->msix, domid, maskall) )
                 printk(XENLOG_G_WARNING
                        "cannot mask IRQ %d: masking MSI-X on Dom%d's %pp\n",
                        desc->irq, domid, &pdev->sbdf);
-            }
         }
         pdev->msix->host_maskall = maskall;
         if ( maskall || pdev->msix->guest_maskall )
-- 
git-series 0.9.1

