Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 05768973131
	for <lists+xen-devel@lfdr.de>; Tue, 10 Sep 2024 12:09:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.795241.1204533 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1snxoI-0000C1-Qe; Tue, 10 Sep 2024 10:09:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 795241.1204533; Tue, 10 Sep 2024 10:09:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1snxoI-0008SZ-7H; Tue, 10 Sep 2024 10:09:22 +0000
Received: by outflank-mailman (input) for mailman id 795241;
 Tue, 10 Sep 2024 10:09:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hUAX=QI=bugseng.com=federico.serafini@srs-se1.protection.inumbo.net>)
 id 1snxoG-0006in-7K
 for xen-devel@lists.xenproject.org; Tue, 10 Sep 2024 10:09:20 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bccaf5ba-6f5c-11ef-99a1-01e77a169b0f;
 Tue, 10 Sep 2024 12:09:16 +0200 (CEST)
Received: from truciolo.homenet.telecomitalia.it
 (host-79-37-206-90.retail.telecomitalia.it [79.37.206.90])
 by support.bugseng.com (Postfix) with ESMTPSA id 4BEED4EE07BE;
 Tue, 10 Sep 2024 12:09:16 +0200 (CEST)
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
X-Inumbo-ID: bccaf5ba-6f5c-11ef-99a1-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=bugseng.com; s=mail;
	t=1725962956; bh=uy8RzmNPWe8sN7uF0NONIzcrXeo4qTykXjJvLpaUdFY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=j9uWRD21docJyr5AGSepOo5zOUTZXlr3xMf3M7p44ORvblAyhRkDy/i40/WvA6RJs
	 DMPUGn2NUqw7aIFJIEQ1wuzYpNdX+xQZMn/TR5XEPeiTvDbEq+ZLxRLYqqV1YuItwJ
	 ShLhJxrCVN9TUNNd3/H/pFF89yQ7kK8dm3n9OUD2YIiNPM7YAsdv0k3nkt+K+c65oZ
	 WpKPHKSi7pqUXzO9mLnZzlz8jCj9MKK3OyxtoSaWuYziEZhRQLp7VSPqW1SMJy1E+k
	 FAcV70IXvs3Sxo8uve2NyblWLFCtKy7lOMqrh5ycQVV9LZF0Y45VwvCFPX8irrgSzX
	 ZvMmh2yFbLm8w==
From: Federico Serafini <federico.serafini@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com,
	Federico Serafini <federico.serafini@bugseng.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [XEN PATCH 09/12] x86/emul: address violations of MISRA C Rule 16.3
Date: Tue, 10 Sep 2024 12:09:01 +0200
Message-Id: <0fa68b9aee5a7a3f1b696bfc6b18ecc826663212.1725958417.git.federico.serafini@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1725958416.git.federico.serafini@bugseng.com>
References: <cover.1725958416.git.federico.serafini@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Address violations of MISRA C:2012 Rule 16.3:
"An unconditional `break' statement shall terminate every
switch-clause".

No functional change.

Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
---
 xen/arch/x86/x86_emulate/fpu.c         | 4 ++++
 xen/arch/x86/x86_emulate/x86_emulate.c | 1 +
 2 files changed, 5 insertions(+)

diff --git a/xen/arch/x86/x86_emulate/fpu.c b/xen/arch/x86/x86_emulate/fpu.c
index 480d879657..3351f549e7 100644
--- a/xen/arch/x86/x86_emulate/fpu.c
+++ b/xen/arch/x86/x86_emulate/fpu.c
@@ -218,6 +218,7 @@ int x86emul_fpu(struct x86_emulate_state *s,
              */
             if ( dst->type == OP_MEM && !s->fpu_ctrl && !fpu_check_write() )
                 dst->type = OP_NONE;
+            break;
         }
         break;
 
@@ -296,6 +297,7 @@ int x86emul_fpu(struct x86_emulate_state *s,
             default:
                 generate_exception(X86_EXC_UD);
             }
+            break;
         }
         break;
 
@@ -386,6 +388,7 @@ int x86emul_fpu(struct x86_emulate_state *s,
              */
             if ( dst->type == OP_MEM && !s->fpu_ctrl && !fpu_check_write() )
                 dst->type = OP_NONE;
+            break;
         }
         break;
 
@@ -457,6 +460,7 @@ int x86emul_fpu(struct x86_emulate_state *s,
             case 7: /* fistp m64i */
                 goto fpu_memdst64;
             }
+            break;
         }
         break;
 
diff --git a/xen/arch/x86/x86_emulate/x86_emulate.c b/xen/arch/x86/x86_emulate/x86_emulate.c
index 2b03d65fce..9fb316e0d7 100644
--- a/xen/arch/x86/x86_emulate/x86_emulate.c
+++ b/xen/arch/x86/x86_emulate/x86_emulate.c
@@ -8297,6 +8297,7 @@ x86_emulate(
         }
         if ( rc != 0 )
             goto done;
+        break;
     default:
         break;
     }
-- 
2.34.1


