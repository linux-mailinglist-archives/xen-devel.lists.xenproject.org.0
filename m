Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 09E79910741
	for <lists+xen-devel@lfdr.de>; Thu, 20 Jun 2024 16:02:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.744614.1151737 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sKIN7-0000vg-Ak; Thu, 20 Jun 2024 14:02:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 744614.1151737; Thu, 20 Jun 2024 14:02:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sKIN7-0000sr-6K; Thu, 20 Jun 2024 14:02:41 +0000
Received: by outflank-mailman (input) for mailman id 744614;
 Thu, 20 Jun 2024 14:02:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fPla=NW=bugseng.com=federico.serafini@srs-se1.protection.inumbo.net>)
 id 1sKIN5-0007p2-4n
 for xen-devel@lists.xenproject.org; Thu, 20 Jun 2024 14:02:39 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c0ac3d35-2f0d-11ef-90a3-e314d9c70b13;
 Thu, 20 Jun 2024 16:02:38 +0200 (CEST)
Received: from truciolo.bugseng.com (unknown [78.208.165.219])
 by support.bugseng.com (Postfix) with ESMTPSA id CC3CC4EE0756;
 Thu, 20 Jun 2024 16:02:37 +0200 (CEST)
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
X-Inumbo-ID: c0ac3d35-2f0d-11ef-90a3-e314d9c70b13
From: Federico Serafini <federico.serafini@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com,
	Federico Serafini <federico.serafini@bugseng.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [XEN PATCH 08/13] x86/vpt: address a violation of MISRA C Rule 16.3
Date: Thu, 20 Jun 2024 16:02:19 +0200
Message-Id: <5b9dbf5595a0aa8d7454dcd7be9fae3a12bf2630.1718892030.git.federico.serafini@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1718892030.git.federico.serafini@bugseng.com>
References: <cover.1718892030.git.federico.serafini@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add pseudo keyword fallthrough to meet the requirements to deviate
a violation of MISRA C Rule 16.3 ("An unconditional `break'
statement shall terminate every switch-clause").

No functional change.

Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
---
 xen/arch/x86/hvm/vpt.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/xen/arch/x86/hvm/vpt.c b/xen/arch/x86/hvm/vpt.c
index e1d6845a28..c76a9a272b 100644
--- a/xen/arch/x86/hvm/vpt.c
+++ b/xen/arch/x86/hvm/vpt.c
@@ -121,6 +121,8 @@ static int pt_irq_masked(struct periodic_time *pt)
     }
 
     /* Fallthrough to check if the interrupt is masked on the IO APIC. */
+    fallthrough;
+
     case PTSRC_ioapic:
     {
         int mask = vioapic_get_mask(v->domain, gsi);
-- 
2.34.1


