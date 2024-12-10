Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CDE929EAEBE
	for <lists+xen-devel@lfdr.de>; Tue, 10 Dec 2024 11:55:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.852082.1265989 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tKxtv-0006A7-8S; Tue, 10 Dec 2024 10:55:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 852082.1265989; Tue, 10 Dec 2024 10:55:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tKxtv-00066z-4v; Tue, 10 Dec 2024 10:55:35 +0000
Received: by outflank-mailman (input) for mailman id 852082;
 Tue, 10 Dec 2024 10:55:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zYqq=TD=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1tKxtt-00066r-1T
 for xen-devel@lists.xenproject.org; Tue, 10 Dec 2024 10:55:33 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 469137f3-b6e5-11ef-a0d5-8be0dac302b0;
 Tue, 10 Dec 2024 11:55:32 +0100 (CET)
Received: from nico.bugseng.com (unknown [46.228.253.214])
 by support.bugseng.com (Postfix) with ESMTPSA id 440BC4EE0738;
 Tue, 10 Dec 2024 11:55:30 +0100 (CET)
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
X-Inumbo-ID: 469137f3-b6e5-11ef-a0d5-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=bugseng.com; s=mail;
	t=1733828131; bh=u5yI1U7QpCEc+V1D8jZzLmbdJwaI+XFI2TgvkxNxhqI=;
	h=From:To:Cc:Subject:Date:From;
	b=Pty/NXKj9MrTQYz2nCS7fwAzCDxVsujkExwwPeo3xaNsu+NEfeRtdkGjU1z9K1ioh
	 h2Ni5n7DOOGqevwySZY+gbV+hGH8qVNPoYbZSsGHEyXwM3PPOn6IzB8EWEirdw1O1T
	 9JGTsBjtLR39tjy49TabP01mm4gwYZrhVPgXjG40kM4rKtPjc+21xljgHSoh3p7FYD
	 8hJlPJ402lVTSiWv8CPbkXcQEaImFIsJkqyoe70sWRqxAsNP4DKvjfWgw+F8JU8WZS
	 x/bv11b/2uoCu0WdL4e7nAAdNg992vRQEOI2b+w2Le6U6suMC5xS54gWErnZMrJM0b
	 T8W8/VFIpekxg==
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org,
	michal.orzel@amd.com,
	xenia.ragiadakou@amd.com,
	ayan.kumar.halder@amd.com,
	consulting@bugseng.com,
	Nicola Vetrini <nicola.vetrini@bugseng.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [XEN PATCH v3] x86: p2m-pod: address violation of MISRA C Rule 2.1
Date: Tue, 10 Dec 2024 11:54:59 +0100
Message-ID: <05b5fd3a85d033adacd5aa08ca81ce579cb1a120.1733827766.git.nicola.vetrini@bugseng.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rule 2.1 states: "A project shall not contain unreachable code".

The placement of the loop after "out_unmap" can be moved earlier
in order to avoid the unconditional return to be marked as a cause of
unreachability for the loop, as this is a consequence of
"__builtin_unreachable" being configured in ECLAIR as being deliberately
unreachable, and therefore not reported as causing the code after the
"out_unmap" label to be unreachable.

Replacing one instance of "goto out_unmap" with the loop avoids
considering the unconditional return at the end of the function as a cause
of unreachability, while preserving the semantics of the function.

No functional change intended.

Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
---
Changes in v2:
- rebased against current staging
Changes in v3:
- move the loop inside the if and avoid one goto
---
 xen/arch/x86/mm/p2m-pod.c | 20 ++++++++------------
 1 file changed, 8 insertions(+), 12 deletions(-)

diff --git a/xen/arch/x86/mm/p2m-pod.c b/xen/arch/x86/mm/p2m-pod.c
index bd84fe9e27ee..8b6f9909c5a1 100644
--- a/xen/arch/x86/mm/p2m-pod.c
+++ b/xen/arch/x86/mm/p2m-pod.c
@@ -1005,7 +1005,14 @@ p2m_pod_zero_check(struct p2m_domain *p2m, const gfn_t *gfns, unsigned int count
             {
                 ASSERT_UNREACHABLE();
                 domain_crash(d);
-                goto out_unmap;
+out_unmap:
+                /*
+                 * Something went wrong, probably crashing the domain.  Unmap
+                 * everything and return.
+                 */
+                for ( i = 0; i < count; i++ )
+                    if ( map[i] )
+                        unmap_domain_page(map[i]);
             }
         }
         else
@@ -1032,17 +1039,6 @@ p2m_pod_zero_check(struct p2m_domain *p2m, const gfn_t *gfns, unsigned int count
             ioreq_request_mapcache_invalidate(d);
         }
     }
-
-    return;
-
-out_unmap:
-    /*
-     * Something went wrong, probably crashing the domain.  Unmap
-     * everything and return.
-     */
-    for ( i = 0; i < count; i++ )
-        if ( map[i] )
-            unmap_domain_page(map[i]);
 }

 static void
--
2.43.0

