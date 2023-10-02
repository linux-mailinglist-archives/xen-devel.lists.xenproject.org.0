Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 838757B4CCD
	for <lists+xen-devel@lfdr.de>; Mon,  2 Oct 2023 09:50:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.611149.950632 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qnDgx-0008Jm-Ry; Mon, 02 Oct 2023 07:50:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 611149.950632; Mon, 02 Oct 2023 07:50:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qnDgx-0008B4-Ld; Mon, 02 Oct 2023 07:50:11 +0000
Received: by outflank-mailman (input) for mailman id 611149;
 Mon, 02 Oct 2023 07:50:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uL8T=FQ=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1qnDgw-0006dn-1N
 for xen-devel@lists.xenproject.org; Mon, 02 Oct 2023 07:50:10 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4dd87652-60f8-11ee-9b0d-b553b5be7939;
 Mon, 02 Oct 2023 09:50:07 +0200 (CEST)
Received: from nico.bugseng.com (unknown [147.123.100.131])
 by support.bugseng.com (Postfix) with ESMTPSA id AA5634EE073E;
 Mon,  2 Oct 2023 09:50:06 +0200 (CEST)
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
X-Inumbo-ID: 4dd87652-60f8-11ee-9b0d-b553b5be7939
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
	Henry.Wang@arm.com,
	Nicola Vetrini <nicola.vetrini@bugseng.com>,
	Tamas K Lengyel <tamas@tklengyel.com>,
	Alexandru Isaila <aisaila@bitdefender.com>,
	Petre Pircalabu <ppircalabu@bitdefender.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [XEN PATCH 7/7] x86/mem_access: make function static
Date: Mon,  2 Oct 2023 09:49:50 +0200
Message-Id: <f51f4728afe75eda0382c902ebc703c7d386559b.1696232393.git.nicola.vetrini@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1696232393.git.nicola.vetrini@bugseng.com>
References: <cover.1696232393.git.nicola.vetrini@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The function is used only within this file, and therefore can be static.

No functional change.

Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
---
 xen/arch/x86/mm/mem_access.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/arch/x86/mm/mem_access.c b/xen/arch/x86/mm/mem_access.c
index c472fa1ee58b..78633d335d72 100644
--- a/xen/arch/x86/mm/mem_access.c
+++ b/xen/arch/x86/mm/mem_access.c
@@ -249,7 +249,7 @@ bool p2m_mem_access_check(paddr_t gpa, unsigned long gla,
     return (p2ma != p2m_access_n2rwx);
 }
 
-int p2m_set_altp2m_mem_access(struct domain *d, struct p2m_domain *hp2m,
+static int p2m_set_altp2m_mem_access(struct domain *d, struct p2m_domain *hp2m,
                               struct p2m_domain *ap2m, p2m_access_t a,
                               gfn_t gfn)
 {
-- 
2.34.1


