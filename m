Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9924F973132
	for <lists+xen-devel@lfdr.de>; Tue, 10 Sep 2024 12:09:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.795231.1204450 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1snxoB-0006lS-JP; Tue, 10 Sep 2024 10:09:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 795231.1204450; Tue, 10 Sep 2024 10:09:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1snxoB-0006ip-GL; Tue, 10 Sep 2024 10:09:15 +0000
Received: by outflank-mailman (input) for mailman id 795231;
 Tue, 10 Sep 2024 10:09:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hUAX=QI=bugseng.com=federico.serafini@srs-se1.protection.inumbo.net>)
 id 1snxoA-0006hI-Ki
 for xen-devel@lists.xenproject.org; Tue, 10 Sep 2024 10:09:14 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bacea9e5-6f5c-11ef-a0b5-8be0dac302b0;
 Tue, 10 Sep 2024 12:09:13 +0200 (CEST)
Received: from truciolo.homenet.telecomitalia.it
 (host-79-37-206-90.retail.telecomitalia.it [79.37.206.90])
 by support.bugseng.com (Postfix) with ESMTPSA id BF93C4EE07BC;
 Tue, 10 Sep 2024 12:09:12 +0200 (CEST)
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
X-Inumbo-ID: bacea9e5-6f5c-11ef-a0b5-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=bugseng.com; s=mail;
	t=1725962953; bh=jTJA4BcdbmYwNY5PeIySmsWvB5Kagg7ddYJ45zv3smo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=lgD6+TKfiAhYYmU+jw3nIUT+OXCDr+hz+1ilmmS6u9hv7mfNcN2o6UlenfgAqr278
	 tww83Y39WUz5VY29Eie1Uhx4lkMpfQvEzx1afY668dFnoPusz+pduZt57fdVbjzCSQ
	 TRoR+81AgL/cB8iI3qKhG86PukRr0sFkLZpuCSrDSU13rB14ayMZfcCHiFLYgv1vAA
	 tRsKJMzZzO1cGzbuqdCHjZ6jMdKmclvqQTqZwD8KBjT+vj2k8M+zxSIee31rTLPKaL
	 ma83PXrzlslM0Hu/m6lBcAOQbN6QU3CjGibzL3nCsQCvm89EgM/Bi/BMfXNXGfbsdI
	 oytlbYPLFeqJg==
From: Federico Serafini <federico.serafini@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com,
	Federico Serafini <federico.serafini@bugseng.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [XEN PATCH 01/12] x86/psr: address violation of MISRA C Rule 16.3
Date: Tue, 10 Sep 2024 12:08:53 +0200
Message-Id: <ae29b196cb3967b39796047997751324b8ce8a13.1725958416.git.federico.serafini@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1725958416.git.federico.serafini@bugseng.com>
References: <cover.1725958416.git.federico.serafini@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Address a violation of MISRA C:2012 Rule 16.3:
"An unconditional `break' statement shall terminate every
switch-clause".

No functional change.

Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
---
 xen/arch/x86/psr.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/xen/arch/x86/psr.c b/xen/arch/x86/psr.c
index 0b9631ac44..5815a35335 100644
--- a/xen/arch/x86/psr.c
+++ b/xen/arch/x86/psr.c
@@ -276,6 +276,7 @@ static enum psr_feat_type psr_type_to_feat_type(enum psr_type type)
 
     default:
         ASSERT_UNREACHABLE();
+        break;
     }
 
     return feat_type;
-- 
2.34.1


