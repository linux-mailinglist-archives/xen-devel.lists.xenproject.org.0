Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id k6MVIuWL5mmryAEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 20 Apr 2026 22:26:13 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A721433B46
	for <lists+xen-devel@lfdr.de>; Mon, 20 Apr 2026 22:26:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1286503.1567673 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wEvBb-00063U-TD; Mon, 20 Apr 2026 20:25:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1286503.1567673; Mon, 20 Apr 2026 20:25:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wEvBY-0005bS-AG; Mon, 20 Apr 2026 20:25:36 +0000
Received: by outflank-mailman (input) for mailman id 1286503;
 Mon, 20 Apr 2026 19:54:59 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Rose.Spangler@purelymail.com>) id 1wEuhv-0006SW-0I
 for xen-devel@lists.xenproject.org; Mon, 20 Apr 2026 19:54:59 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wEuhu-008XH6-Da
 for xen-devel@lists.xenproject.org; Mon, 20 Apr 2026 21:54:58 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Rose.Spangler@purelymail.com>)
 id 69e6843f-bab6-0a2a0a5309dd-0a2a4505bfc4-34
 for <xen-devel@lists.xenproject.org>; Mon, 20 Apr 2026 21:54:58 +0200
Received: from [34.202.193.197] (helo=sendmail.purelymail.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <Rose.Spangler@purelymail.com>)
 id 69e683a0-aaa8-0a2a45050019-22cac1c59978-3
 for <xen-devel@lists.xenproject.org>; Mon, 20 Apr 2026 21:50:57 +0200
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -306608446; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Mon, 20 Apr 2026 19:50:55 +0000 (UTC)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=purelymail1 header.d=purelymail.com header.i="@purelymail.com" header.h="Feedback-ID:Received:From:To:Subject:Date"
DKIM-Signature: a=rsa-sha256; b=Y1Z3a/0ZFeJbvvg34y5PogXq5DFlqhRhk10bT3/xkvHbswu1iULGf3KAjonxOYEKvO1wMItuikExB7MFJfMSHf08RSO7Nr0Kg1DijZTk9EWJbCXzTMbd2KHBIgPGiwXrzqjquOt0hDOXliLdjxvYCaVMIvqX54IroAh4XTPrvPS4UtzOsddwHbW7TkvSTPYcvwUjl9cOE28D/JBfTh0OFzYRXEpRRGdODGSk6Hr4k+Hk5hS/SzpkChktk0bNKfTSpFE6nepCNNLSNaCd2+3e2H1ld14+r/yTY1xVp/hNFfedRpr2E3+MtZcbbdBS7tCeS1x3RYw6NL11YvDLwKC+Ug==; s=purelymail1; d=purelymail.com; v=1; bh=e683LwwNMa3+lnrdWdK52Gu9IfTTlss7Pk0lZ8mbuPc=; h=Feedback-ID:Received:From:To:Subject:Date;
Feedback-ID: 685805:22403:null:purelymail
X-Pm-Original-To: xen-devel@lists.xenproject.org
From: Rose.Spangler@purelymail.com
To: xen-devel@lists.xenproject.org
Cc: Rose Spangler <Rose.Spangler@elektrobit.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Sergej Proskurin <proskurin@sec.in.tum.de>
Subject: [RFC PATCH v6 18/43] arm/p2m: Invalidate root page table entries and flush TLB in p2m_flush_table
Date: Mon, 20 Apr 2026 15:50:17 -0400
Message-Id: <20260420195042.207624-19-Rose.Spangler@purelymail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260420195042.207624-1-Rose.Spangler@purelymail.com>
References: <20260420195042.207624-1-Rose.Spangler@purelymail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by Purelymail
Content-Type: text/plain; charset=UTF-8
X-purgate-ID: tlsNG-c201ff/1776714657-2B762443-8C89B9DA/0/0
X-purgate-type: clean
X-purgate-size: 4946
X-Spamd-Result: default: False [3.51 / 15.00];
	DMARC_POLICY_REJECT(2.00)[purelymail.com : SPF not aligned (relaxed),reject];
	R_DKIM_REJECT(1.00)[purelymail.com:s=purelymail1];
	MID_CONTAINS_FROM(1.00)[];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:Rose.Spangler@elektrobit.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:proskurin@sec.in.tum.de,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[Rose.Spangler@purelymail.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[purelymail.com:-];
	FROM_NO_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	NEURAL_HAM(-0.00)[-0.877];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Rose.Spangler@purelymail.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCPT_COUNT_SEVEN(0.00)[8];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Queue-Id: 3A721433B46
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Rose Spangler <Rose.Spangler@elektrobit.com>

This commit invalidates the root page table entries and flushes the TLB
when the table is flushed. The TLB is flushed to ensure that altp2m views
after being reset or torn down. Previously, the code in p2m_flush_table was
only used to free p2m pages during domain teardown. This function will
later be used to teardown/reset altp2m views of a still-running domain, so
the page table entries must be properly invalidated.

Additionally, the p2m_invalidate_root function is split into
p2m_invalidate_root and p2m_invalidate_root_locked. The p2m_flush_table
function already holds the lock, so it calls p2m_invalidate_root_locked
directly, as opposed to the existing callers which don't already hold the
lock.

This is commit 7/12 of the altp2m_init/altp2m_teardown routines phase.

Signed-off-by: Rose Spangler <Rose.Spangler@elektrobit.com>
Signed-off-by: Sergej Proskurin <proskurin@sec.in.tum.de>
---
v3: Added a "p2m_flush_tlb" call in "p2m_flush_table". On altp2m reset
    in function "altp2m_reset", it is important to flush the TLBs after
    clearing the root table pages and before clearing the intermediate
    altp2m page tables to prevent illegal access to stalled TLB entries on
    currently active VCPUs.

v4: Replaced the former use of clear_and_clean_page in p2m_flush_table
    by a routine that invalidates every p2m entry atomically. This
    avoids inconsistencies on CPUs that continue to use the views that
    are to be flushed (e.g., see altp2m_reset).

v6: Introduced this patch. While the code in this patch is mostly new, it
    is the same in spirit as the p2m_flush_table additions in the original
    patch series, so the relevant comments have been reproduced above.

    In the v4/v5 versions of this patch series, this patch was a part of
    the previous patch. It has been split out to minimize the number of
    functionality changes in the previous patch.

    Additionally, the original patch series used a routine here which was
    nearly identical to p2m_invalidate_root, which was implemented a few
    years after the patch series. Therefore, the existing
    p2m_invalidate_root implementation is used here instead.

    Also, since the original patch series p2m_teardown (and by extension
    p2m_flush_table, as it was extracted from p2m_teardown) was made
    preemptible. As a consequence of this, introducing a call to
    p2m_invalidate_root here also means that p2m_invalidate_root and
    p2m_tlb_flush_sync is called each time p2m_flush_table is called, even
    if a previous call to p2m_flush_table was preempted. This might cause
    some additional overhead, as p2m_flush_table will iterate over the root
    page tables and flush the TLB before it can return to freeing p2m
    pages. I'm not sure if there's a better way of handling this, or if
    the overhead here is negligible/acceptable.

    I'm not sure how IOMMU interacts with altp2m here. I haven't looked
    into it extensively, so I would appreciate some feedback here. I've
    just copied over the iommu_use_hap_pt conditional from
    p2m_domain_creation_finished, but this is probably not the right
    behavior since we probably still need to invalidate the altp2m view
    page tables on flush somehow. Is the issue with invalidating root page
    tables when using IOMMU only relevant for the hostp2m, or is it also
    relevant for the altp2m views?
---
 xen/arch/arm/mmu/p2m.c | 16 +++++++++++++---
 1 file changed, 13 insertions(+), 3 deletions(-)

diff --git a/xen/arch/arm/mmu/p2m.c b/xen/arch/arm/mmu/p2m.c
index 1d598c66450b..51753bb2c34d 100644
--- a/xen/arch/arm/mmu/p2m.c
+++ b/xen/arch/arm/mmu/p2m.c
@@ -1271,17 +1271,20 @@ void p2m_clear_root_pages(struct p2m_domain *p2m)
  * p2m_invalid_root() should not be called when the P2M is shared with
  * the IOMMU because it will cause IOMMU fault.
  */
-static void p2m_invalidate_root(struct p2m_domain *p2m)
+static void p2m_invalidate_root_locked(struct p2m_domain *p2m)
 {
     unsigned int i;
=20
     ASSERT(!iommu_use_hap_pt(p2m->domain));
=20
-    p2m_write_lock(p2m);
-
     for ( i =3D 0; i < P2M_ROOT_PAGES; i++ )
         p2m_invalidate_table(p2m, page_to_mfn(p2m->root + i));
+}
=20
+static void p2m_invalidate_root(struct p2m_domain *p2m)
+{
+    p2m_write_lock(p2m);
+    p2m_invalidate_root_locked(p2m);
     p2m_write_unlock(p2m);
 }
=20
@@ -1449,6 +1452,13 @@ int p2m_flush_table(struct p2m_domain *p2m)
     unsigned long count =3D 0;
     struct page_info *pg;
=20
+    /* TODO: How does IOMMU interact with altp2m? */
+    if ( !iommu_use_hap_pt(p2m->domain) )
+    {
+        p2m_invalidate_root_locked(p2m);
+        p2m_tlb_flush_sync(p2m);
+    }
+
     while ( (pg =3D page_list_remove_head(&p2m->pages)) )
     {
         p2m_free_page(p2m->domain, pg);
--=20
2.34.1


