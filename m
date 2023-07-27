Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7897E765190
	for <lists+xen-devel@lfdr.de>; Thu, 27 Jul 2023 12:46:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.571001.893771 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qOyVM-0005wx-RG; Thu, 27 Jul 2023 10:46:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 571001.893771; Thu, 27 Jul 2023 10:46:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qOyVM-0005uY-OX; Thu, 27 Jul 2023 10:46:00 +0000
Received: by outflank-mailman (input) for mailman id 571001;
 Thu, 27 Jul 2023 10:45:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mGGP=DN=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1qOyVL-0005uQ-Oo
 for xen-devel@lists.xenproject.org; Thu, 27 Jul 2023 10:45:59 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c42f73ef-2c6a-11ee-8613-37d641c3527e;
 Thu, 27 Jul 2023 12:45:57 +0200 (CEST)
Received: from nico.bugseng.com (unknown [37.161.207.213])
 by support.bugseng.com (Postfix) with ESMTPSA id B38DB4EE073F;
 Thu, 27 Jul 2023 12:45:54 +0200 (CEST)
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
X-Inumbo-ID: c42f73ef-2c6a-11ee-8613-37d641c3527e
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: simone.ballarin@bugseng.com,
	xen-devel@lists.xenproject.org
Cc: Nicola Vetrini <nicola.vetrini@bugseng.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [XEN PATCH 3/4] x86/mm: mechanically rename variable to avoid shadowing
Date: Thu, 27 Jul 2023 12:45:43 +0200
Message-Id: <62f4a9e7a19b37c970e52f138a6eeb8f7363b7bc.1690449587.git.nicola.vetrini@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1690449587.git.nicola.vetrini@bugseng.com>
References: <cover.1690449587.git.nicola.vetrini@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The rename s/p2mt/t/ is done to avoid shadowing the same declaration
in the enclosing scope.

Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
---
Is the semantics of the function altered if the inner declaration
is removed entirely?
---
 xen/arch/x86/mm/p2m.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/xen/arch/x86/mm/p2m.c b/xen/arch/x86/mm/p2m.c
index 714358f953..fa9f7616e8 100644
--- a/xen/arch/x86/mm/p2m.c
+++ b/xen/arch/x86/mm/p2m.c
@@ -2439,12 +2439,12 @@ int xenmem_add_to_physmap_one(
 
     case XENMAPSPACE_gmfn:
     {
-        p2m_type_t p2mt;
+        p2m_type_t t;
 
         gfn = idx;
-        mfn = get_gfn_unshare(d, gfn, &p2mt);
+        mfn = get_gfn_unshare(d, gfn, &t);
         /* If the page is still shared, exit early */
-        if ( p2m_is_shared(p2mt) )
+        if ( p2m_is_shared(t) )
         {
             put_gfn(d, gfn);
             return -ENOMEM;
-- 
2.34.1


