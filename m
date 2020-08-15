Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AC8562450E7
	for <lists+xen-devel@lfdr.de>; Sat, 15 Aug 2020 13:14:21 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k6u7U-0005P2-Gl; Sat, 15 Aug 2020 11:13:04 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ceF6=BZ=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1k6u7S-0005Ou-C1
 for xen-devel@lists.xenproject.org; Sat, 15 Aug 2020 11:13:02 +0000
X-Inumbo-ID: bec9e6c2-0101-4a2d-b2ac-ccec9bdfda77
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id bec9e6c2-0101-4a2d-b2ac-ccec9bdfda77;
 Sat, 15 Aug 2020 11:13:00 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 7987EB73B;
 Sat, 15 Aug 2020 11:13:23 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: minios-devel@lists.xenproject.org,
	xen-devel@lists.xenproject.org
Cc: samuel.thibault@ens-lyon.org, wl@xen.org, Juergen Gross <jgross@suse.com>
Subject: [PATCH] mini-os: fix do_map_frames() for pvh
Date: Sat, 15 Aug 2020 13:12:57 +0200
Message-Id: <20200815111257.29302-1-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

In case ov PVH dom_map_frames() is missing to increment the virtual
address. This leads to writing only the first page table entry multiple
times.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 arch/x86/mm.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/x86/mm.c b/arch/x86/mm.c
index ea58444..8ba14a5 100644
--- a/arch/x86/mm.c
+++ b/arch/x86/mm.c
@@ -695,6 +695,7 @@ int do_map_frames(unsigned long va,
         pgt[l1_table_offset(va)] = (pgentry_t)
             (((mfns[done * stride] + done * incr) << PAGE_SHIFT) | prot);
         done++;
+        va += PAGE_SIZE;
 #endif
     }
 
-- 
2.26.2


