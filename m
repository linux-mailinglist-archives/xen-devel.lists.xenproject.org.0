Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 961A3798496
	for <lists+xen-devel@lfdr.de>; Fri,  8 Sep 2023 11:10:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.597890.932302 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qeXVf-0006zf-0k; Fri, 08 Sep 2023 09:10:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 597890.932302; Fri, 08 Sep 2023 09:10:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qeXVe-0006wr-SJ; Fri, 08 Sep 2023 09:10:38 +0000
Received: by outflank-mailman (input) for mailman id 597890;
 Fri, 08 Sep 2023 09:10:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qS4c=EY=bugseng.com=federico.serafini@srs-se1.protection.inumbo.net>)
 id 1qeXVd-0006vo-18
 for xen-devel@lists.xenproject.org; Fri, 08 Sep 2023 09:10:37 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 92194897-4e27-11ee-8783-cb3800f73035;
 Fri, 08 Sep 2023 11:10:35 +0200 (CEST)
Received: from Dell.bugseng.com (unknown [37.160.105.86])
 by support.bugseng.com (Postfix) with ESMTPSA id B95484EE0738;
 Fri,  8 Sep 2023 11:10:33 +0200 (CEST)
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
X-Inumbo-ID: 92194897-4e27-11ee-8783-cb3800f73035
From: Federico Serafini <federico.serafini@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com,
	Federico Serafini <federico.serafini@bugseng.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [XEN PATCH] x86: change parameter name in {hap,shadow}_track_dirty_vram()
Date: Fri,  8 Sep 2023 11:10:27 +0200
Message-Id: <d9bf20e655cc5940aad21bcf43c53fe2d2e0ca58.1694164086.git.federico.serafini@bugseng.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Make function declarations consistent with the corresponding
definitions to address violations of MISRA C:2012 Rule 8.3.
No functional change.

Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
---
 xen/arch/x86/include/asm/hap.h    | 2 +-
 xen/arch/x86/include/asm/shadow.h | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/xen/arch/x86/include/asm/hap.h b/xen/arch/x86/include/asm/hap.h
index 9d12327b12..05e124ad57 100644
--- a/xen/arch/x86/include/asm/hap.h
+++ b/xen/arch/x86/include/asm/hap.h
@@ -30,7 +30,7 @@ void  hap_vcpu_init(struct vcpu *v);
 int   hap_track_dirty_vram(struct domain *d,
                            unsigned long begin_pfn,
                            unsigned int nr_frames,
-                           XEN_GUEST_HANDLE(void) dirty_bitmap);
+                           XEN_GUEST_HANDLE(void) guest_dirty_bitmap);
 
 extern const struct paging_mode *hap_paging_get_mode(struct vcpu *);
 int hap_set_allocation(struct domain *d, unsigned int pages, bool *preempted);
diff --git a/xen/arch/x86/include/asm/shadow.h b/xen/arch/x86/include/asm/shadow.h
index ba2b0e170b..20df34d0a8 100644
--- a/xen/arch/x86/include/asm/shadow.h
+++ b/xen/arch/x86/include/asm/shadow.h
@@ -65,7 +65,7 @@ int shadow_enable(struct domain *d, u32 mode);
 int shadow_track_dirty_vram(struct domain *d,
                             unsigned long first_pfn,
                             unsigned int nr_frames,
-                            XEN_GUEST_HANDLE(void) dirty_bitmap);
+                            XEN_GUEST_HANDLE(void) guest_dirty_bitmap);
 
 /* Handler for shadow control ops: operations from user-space to enable
  * and disable ephemeral shadow modes (test mode and log-dirty mode) and
-- 
2.34.1


