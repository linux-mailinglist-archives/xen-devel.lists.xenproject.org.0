Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AB55A742A04
	for <lists+xen-devel@lfdr.de>; Thu, 29 Jun 2023 17:56:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.556956.869889 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qEtzq-00017F-34; Thu, 29 Jun 2023 15:55:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 556956.869889; Thu, 29 Jun 2023 15:55:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qEtzp-00012F-Uf; Thu, 29 Jun 2023 15:55:49 +0000
Received: by outflank-mailman (input) for mailman id 556956;
 Thu, 29 Jun 2023 15:55:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=T6tI=CR=bugseng.com=federico.serafini@srs-se1.protection.inumbo.net>)
 id 1qEtzo-0000zP-Ne
 for xen-devel@lists.xenproject.org; Thu, 29 Jun 2023 15:55:48 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6a12ee5c-1695-11ee-b237-6b7b168915f2;
 Thu, 29 Jun 2023 17:55:48 +0200 (CEST)
Received: from Dell.bugseng.com (unknown [37.160.192.186])
 by support.bugseng.com (Postfix) with ESMTPSA id E7F574EE073C;
 Thu, 29 Jun 2023 17:55:46 +0200 (CEST)
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
X-Inumbo-ID: 6a12ee5c-1695-11ee-b237-6b7b168915f2
From: Federico Serafini <federico.serafini@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com,
	Federico Serafini <federico.serafini@bugseng.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Michal Orzel <michal.orzel@amd.com>,
	Xenia Ragiadakou <xenia.ragiadakou@amd.com>,
	Ayan Kumar Halder <ayan.kumar.halder@amd.com>
Subject: [XEN PATCH 2/5] x86: change parameter names of nestedhvm_vcpu_iomap_get() definition
Date: Thu, 29 Jun 2023 17:55:30 +0200
Message-Id: <7392b1adc50c77855bec846f1a14e30f6a8ae1d6.1688049495.git.federico.serafini@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1688049494.git.federico.serafini@bugseng.com>
References: <cover.1688049494.git.federico.serafini@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Change parameter names of nestedhvm_vcpu_iomap_get() definition to
those used in the function declaration in order to:
1) improve readability;
2) fix violations of MISRA C:2012 Rule 8.3.

Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
---
 xen/arch/x86/hvm/nestedhvm.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/xen/arch/x86/hvm/nestedhvm.c b/xen/arch/x86/hvm/nestedhvm.c
index ec68551127..64d7eec9a1 100644
--- a/xen/arch/x86/hvm/nestedhvm.c
+++ b/xen/arch/x86/hvm/nestedhvm.c
@@ -155,19 +155,19 @@ static int __init cf_check nestedhvm_setup(void)
 __initcall(nestedhvm_setup);
 
 unsigned long *
-nestedhvm_vcpu_iomap_get(bool_t port_80, bool_t port_ed)
+nestedhvm_vcpu_iomap_get(bool_t ioport_80, bool_t ioport_ed)
 {
     int i;
 
     if (!hvm_port80_allowed)
-        port_80 = 1;
+        ioport_80 = 1;
 
-    if (port_80 == 0) {
-        if (port_ed == 0)
+    if (ioport_80 == 0) {
+        if (ioport_ed == 0)
             return hvm_io_bitmap;
         i = 0;
     } else {
-        if (port_ed == 0)
+        if (ioport_ed == 0)
             i = 1;
         else
             i = 2;
-- 
2.34.1


