Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 504627D2F31
	for <lists+xen-devel@lfdr.de>; Mon, 23 Oct 2023 11:57:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.621185.967444 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qurgE-0001Cs-Dk; Mon, 23 Oct 2023 09:57:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 621185.967444; Mon, 23 Oct 2023 09:57:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qurgE-0000zJ-3f; Mon, 23 Oct 2023 09:57:02 +0000
Received: by outflank-mailman (input) for mailman id 621185;
 Mon, 23 Oct 2023 09:56:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gXaf=GF=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1qurgB-0007mu-JP
 for xen-devel@lists.xenproject.org; Mon, 23 Oct 2023 09:56:59 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 80c89818-718a-11ee-9b0e-b553b5be7939;
 Mon, 23 Oct 2023 11:56:57 +0200 (CEST)
Received: from nico.bugseng.com (unknown [147.123.100.131])
 by support.bugseng.com (Postfix) with ESMTPSA id AB3D84EE074B;
 Mon, 23 Oct 2023 11:56:56 +0200 (CEST)
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
X-Inumbo-ID: 80c89818-718a-11ee-9b0e-b553b5be7939
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org,
	michal.orzel@amd.com,
	xenia.ragiadakou@amd.com,
	ayan.kumar.halder@amd.com,
	consulting@bugseng.com,
	jbeulich@suse.com,
	andrew.cooper3@citrix.com,
	roger.pau@citrix.com,
	Nicola Vetrini <nicola.vetrini@bugseng.com>,
	Tamas K Lengyel <tamas@tklengyel.com>,
	Alexandru Isaila <aisaila@bitdefender.com>,
	Petre Pircalabu <ppircalabu@bitdefender.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [XEN PATCH][for-4.19 v4 7/8] x86/mem_access: make function static
Date: Mon, 23 Oct 2023 11:56:44 +0200
Message-Id: <dedbd3bfc9338770f809da3b7d06275d89917be1.1698053876.git.nicola.vetrini@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1698053876.git.nicola.vetrini@bugseng.com>
References: <cover.1698053876.git.nicola.vetrini@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The function is used only within this file, and therefore can be static.

No functional change.

Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
Acked-by: Tamas K Lengyel <tamas@tklengyel.com>
---
Changes in v3:
- style fix
---
 xen/arch/x86/mm/mem_access.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/xen/arch/x86/mm/mem_access.c b/xen/arch/x86/mm/mem_access.c
index c472fa1ee58b..d3dd5ab5ef8b 100644
--- a/xen/arch/x86/mm/mem_access.c
+++ b/xen/arch/x86/mm/mem_access.c
@@ -249,9 +249,9 @@ bool p2m_mem_access_check(paddr_t gpa, unsigned long gla,
     return (p2ma != p2m_access_n2rwx);
 }
 
-int p2m_set_altp2m_mem_access(struct domain *d, struct p2m_domain *hp2m,
-                              struct p2m_domain *ap2m, p2m_access_t a,
-                              gfn_t gfn)
+static int p2m_set_altp2m_mem_access(struct domain *d, struct p2m_domain *hp2m,
+                                     struct p2m_domain *ap2m, p2m_access_t a,
+                                     gfn_t gfn)
 {
     mfn_t mfn;
     p2m_type_t t;
-- 
2.34.1


