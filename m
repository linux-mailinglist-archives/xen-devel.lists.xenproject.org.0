Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2ECDB917C81
	for <lists+xen-devel@lfdr.de>; Wed, 26 Jun 2024 11:28:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.748598.1156443 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sMOwz-0007TH-Jn; Wed, 26 Jun 2024 09:28:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 748598.1156443; Wed, 26 Jun 2024 09:28:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sMOwz-0007GT-7y; Wed, 26 Jun 2024 09:28:25 +0000
Received: by outflank-mailman (input) for mailman id 748598;
 Wed, 26 Jun 2024 09:28:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=P08s=N4=bugseng.com=federico.serafini@srs-se1.protection.inumbo.net>)
 id 1sMOww-0004l5-M5
 for xen-devel@lists.xenproject.org; Wed, 26 Jun 2024 09:28:22 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6db3eddd-339e-11ef-b4bb-af5377834399;
 Wed, 26 Jun 2024 11:28:21 +0200 (CEST)
Received: from truciolo.bugseng.com (unknown [78.209.199.41])
 by support.bugseng.com (Postfix) with ESMTPSA id 3F0B44EE073D;
 Wed, 26 Jun 2024 11:28:20 +0200 (CEST)
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
X-Inumbo-ID: 6db3eddd-339e-11ef-b4bb-af5377834399
From: Federico Serafini <federico.serafini@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com,
	Federico Serafini <federico.serafini@bugseng.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [XEN PATCH v3 12/12] x86/vlapic: address a violation of MISRA C Rule 16.3
Date: Wed, 26 Jun 2024 11:28:05 +0200
Message-Id: <8cc3a42c2c73b21bb08d9140b274a7350c3b2d0b.1719383180.git.federico.serafini@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1719383180.git.federico.serafini@bugseng.com>
References: <cover.1719383180.git.federico.serafini@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add missing break statement to address a violation of MISRA C
Rule 16.3: "An unconditional `break' statement shall terminate every
switch-clause".

No functional change.

Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
Acked-by: Jan Beulich <jbeulich@suse.com>
---
 xen/arch/x86/hvm/vlapic.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/xen/arch/x86/hvm/vlapic.c b/xen/arch/x86/hvm/vlapic.c
index 9cfc82666a..2ec9594271 100644
--- a/xen/arch/x86/hvm/vlapic.c
+++ b/xen/arch/x86/hvm/vlapic.c
@@ -367,6 +367,7 @@ static void vlapic_accept_irq(struct vcpu *v, uint32_t icr_low)
         gdprintk(XENLOG_ERR, "TODO: unsupported delivery mode in ICR %x\n",
                  icr_low);
         domain_crash(v->domain);
+        break;
     }
 }
 
-- 
2.34.1


