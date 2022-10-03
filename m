Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B6C25F3367
	for <lists+xen-devel@lfdr.de>; Mon,  3 Oct 2022 18:23:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.414962.659415 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ofODG-0000il-2j; Mon, 03 Oct 2022 16:22:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 414962.659415; Mon, 03 Oct 2022 16:22:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ofODG-0000fT-03; Mon, 03 Oct 2022 16:22:38 +0000
Received: by outflank-mailman (input) for mailman id 414962;
 Mon, 03 Oct 2022 16:22:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7JV9=2E=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1ofODE-0000fN-6Q
 for xen-devel@lists.xenproject.org; Mon, 03 Oct 2022 16:22:36 +0000
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9564fcfb-4337-11ed-9377-c1cf23e5d27e;
 Mon, 03 Oct 2022 18:22:33 +0200 (CEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 086BD32007E8;
 Mon,  3 Oct 2022 12:22:30 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Mon, 03 Oct 2022 12:22:31 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 3 Oct 2022 12:22:28 -0400 (EDT)
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
X-Inumbo-ID: 9564fcfb-4337-11ed-9377-c1cf23e5d27e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:from:from:in-reply-to:message-id
	:mime-version:reply-to:sender:subject:subject:to:to; s=fm2; t=
	1664814150; x=1664900550; bh=VUR8i+Yav/xwTfqV32RAVYeUwSbqqG2W50q
	eOLKdIuI=; b=VOxoQHX2n8Yru8vF7Qzuuqmnmfi6FgC96MP/CMtUVZJFfjAY/++
	X0CmK+00HoOgS2aYtLIFL7kL1GvzqDAN696v1j96Yqqaxcj2jNDBo5n0KZeuDhc3
	YeYIql7qp/rs3mwHnS7jr1B9l/rsd5/KZc8fwGm/vvXHbZqABfueRfqyGS1PuC4B
	auL2FupIsXjK95NzxS72Z8A7W7oHqvH8QYkc6nD51yNjEa3+ZNjfnjtUluY6VXXu
	cNPXJH1FWUmiZYlBOWaQ70BGvyT3qyaaPCHCY/ukPX83qwAcskagLK1du1dRosJu
	0pR4zA+l02MV4SIm6XQEX9fyDHG/hC8NW2g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm2; t=1664814150; x=1664900550; bh=VUR8i+Yav/xwT
	fqV32RAVYeUwSbqqG2W50qeOLKdIuI=; b=zcUt0P+cAcKtYlSyB/HANsgr9YUNN
	TTD9IIQdUpykiuiRDW6/VE3pKiDSsz2nJ5io2lssNa8MG3TO1/+I5ZpTd8Zy5G2+
	bq2H7nbPjldyCo3lzqFd8v9E9lxnPbD0U0hwzjK9R4cfnWMcboi+gGDrxMeoxfl3
	o1jyKtR1qqgjosMnbO7iANY4m3fAxaCZOxSlpbsHyBjOfnr2hnPBL8I110ZVnYwI
	0ReJrHPhCAZtFnMSbpblpUexeaLWqq7w8tWkMk2Wbb/oYJCNX9vpSw0RmhfpvJ7J
	lAEERaGT4l0ccd5kqOZW0Vxkeje9sPXAEd2TMF8beu+KElXOuQtFHnL/A==
X-ME-Sender: <xms:Rgw7Y1Byut7S31aikuIYgUArcXUo4EGhqVQJEvOf4dnnXJIckkcqTQ>
    <xme:Rgw7YziozGHj8H7WHvctFxKLoVawPL_t2X5sc5_U8c4fLPuarmw1R8jw4_l1OHr2x
    xXFeAD7skc96w>
X-ME-Received: <xmr:Rgw7YwlIRh6MS6vD8eI0l9DyDrvOD9_5z4gFMbhCTc5jfquvzzZz-OjMCAyLrS2qF2BmWXNfC4ybfBpfeKfCnbW27goDplwBxUZt5-O7GIngP5YvCtNqJg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfeehledgleelucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofggtgfgsehtkeertdertdejnecuhfhrohhmpeforghrvghk
    ucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesihhnvh
    hishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpeelkefh
    udelteelleelteetveeffeetffekteetjeehlefggeekleeghefhtdehvdenucevlhhush
    htvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrghrmhgrrhgvkhes
    ihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhm
X-ME-Proxy: <xmx:Rgw7Y_wt1INIsgrKVhvzbfHEJDkD9Y72CAWJedm4psGZMogJIvJYmA>
    <xmx:Rgw7Y6TAO-vh3wCoRiE-3LRyELoqhrwgXIS9LGwEYo-ECAG2INFEAg>
    <xmx:Rgw7Yyb6middlHBvDYhxf2nhzFjjrEMzcRYEwaqXB2kHR68BToAIpA>
    <xmx:Rgw7Y3SwEJrEQwYknpj_K_ae0b1jds1Z1kOUn7nFtBOrJCvtAThX0g>
Feedback-ID: i1568416f:Fastmail
From: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Juergen Gross <jgross@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>,
	Dario Faggioli <dfaggioli@suse.com>
Subject: [PATCH v2] xen: credit2: respect credit2_runqueue=all when arranging runqueues
Date: Mon,  3 Oct 2022 18:21:58 +0200
Message-Id: <20221003162158.2042-1-marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Documentation for credit2_runqueue=all says it should create one queue
for all pCPUs on the host. But since introduction
sched_credit2_max_cpus_runqueue, it actually created separate runqueue
per socket, even if the CPUs count is below
sched_credit2_max_cpus_runqueue.

Adjust the condition to skip syblink check in case of
credit2_runqueue=all.

Fixes: 8e2aa76dc167 ("xen: credit2: limit the max number of CPUs in a runqueue")
Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
Reviewed-by: Juergen Gross <jgross@suse.com>
---
Changes in v2:
 - fix indentation
 - adjust doc

The whole thing is under cpu_runqueue_match() already, so maybe
cpu_runqueue_siblings_match() isn't needed at all?
---
 docs/misc/xen-command-line.pandoc | 5 +++++
 xen/common/sched/credit2.c        | 9 +++++++--
 2 files changed, 12 insertions(+), 2 deletions(-)

diff --git a/docs/misc/xen-command-line.pandoc b/docs/misc/xen-command-line.pandoc
index 74b519f0c5bd..057cdb903042 100644
--- a/docs/misc/xen-command-line.pandoc
+++ b/docs/misc/xen-command-line.pandoc
@@ -724,6 +724,11 @@ Available alternatives, with their meaning, are:
 * `all`: just one runqueue shared by all the logical pCPUs of
          the host
 
+Regardless of the above choice, Xen attempts to respect
+`sched_credit2_max_cpus_runqueue` limit, which may mean more than one runqueue
+for the `all` value. If that isn't intended, raise
+the `sched_credit2_max_cpus_runqueue` value.
+
 ### dbgp
 > `= ehci[ <integer> | @pci<bus>:<slot>.<func> ]`
 > `= xhci[ <integer> | @pci<bus>:<slot>.<func> ][,share=<bool>|hwdom]`
diff --git a/xen/common/sched/credit2.c b/xen/common/sched/credit2.c
index 0e3f89e5378e..afff23b56238 100644
--- a/xen/common/sched/credit2.c
+++ b/xen/common/sched/credit2.c
@@ -996,9 +996,14 @@ cpu_add_to_runqueue(const struct scheduler *ops, unsigned int cpu)
              *
              * Otherwise, let's try to make sure that siblings stay in the
              * same runqueue, pretty much under any cinrcumnstances.
+             *
+             * Furthermore, try to respect credit2_runqueue=all, as long as
+             * max_cpus_runq isn't violated.
              */
-            if ( rqd->refcnt < max_cpus_runq && (ops->cpupool->gran != SCHED_GRAN_cpu ||
-                  cpu_runqueue_siblings_match(rqd, cpu, max_cpus_runq)) )
+            if ( rqd->refcnt < max_cpus_runq &&
+                    (ops->cpupool->gran != SCHED_GRAN_cpu ||
+                     cpu_runqueue_siblings_match(rqd, cpu, max_cpus_runq) ||
+                     opt_runqueue == OPT_RUNQUEUE_ALL) )
             {
                 /*
                  * This runqueue is ok, but as we said, we also want an even
-- 
2.37.3


