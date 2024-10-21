Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A4549A60C3
	for <lists+xen-devel@lfdr.de>; Mon, 21 Oct 2024 11:55:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.823277.1237245 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t2p8F-00042H-9T; Mon, 21 Oct 2024 09:55:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 823277.1237245; Mon, 21 Oct 2024 09:55:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t2p8F-00040O-5j; Mon, 21 Oct 2024 09:55:23 +0000
Received: by outflank-mailman (input) for mailman id 823277;
 Mon, 21 Oct 2024 09:55:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dRMf=RR=bugseng.com=federico.serafini@srs-se1.protection.inumbo.net>)
 id 1t2p8C-00040H-AC
 for xen-devel@lists.xenproject.org; Mon, 21 Oct 2024 09:55:21 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 944a1479-8f92-11ef-a0be-8be0dac302b0;
 Mon, 21 Oct 2024 11:55:19 +0200 (CEST)
Received: from truciolo.bugseng.com (unknown [37.163.179.18])
 by support.bugseng.com (Postfix) with ESMTPSA id 822BB4EE0737;
 Mon, 21 Oct 2024 11:55:17 +0200 (CEST)
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
X-Inumbo-ID: 944a1479-8f92-11ef-a0be-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=bugseng.com; s=mail;
	t=1729504518; bh=Y+u7e5DLnPPoRwdo2M0VVHEj6Bi+ttyz8sg120Qh7JY=;
	h=From:To:Cc:Subject:Date:From;
	b=TaaTuVdqpMqxbAZfRhQG9tcmp9/aoWN7PHgZ4qL7Yxg27pP1hu1TXhagbhteYXpCe
	 YXBbX6txRlGRwwE+lDtu8nQSZWgARxaLcPH8/f6YBAm8GrDt8esGAhUNiJBQnzE4IO
	 lQRhsYuJ+fNbOypaILQ8Vxh0CxVRlJM8jNBJ6ripaG05TUHaBiT3hBF6XyEzw9ZHDv
	 8HU6InnMh19qpt4xp7cDBLbOxsqiUMXLmF57eY2ZCCwz7O7N9DbHE4LoN+6PCSc98A
	 PiCc8TBCmPpXwtmifkdOL66mY4QiPC8JdugGn8lP5NpTMBIMsTu6tjL6F1Y+y6Go2e
	 rYJhp3/3vfHgw==
From: Federico Serafini <federico.serafini@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com,
	Federico Serafini <federico.serafini@bugseng.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [XEN PATCH v3] x86/emul: address violations of MISRA C Rule 16.3
Date: Mon, 21 Oct 2024 11:55:10 +0200
Message-ID: <63d51d39995c8dbab6f02d74982287a238ee5353.1729500464.git.federico.serafini@bugseng.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add missing break statements to address violations of MISRA C:2012
Rule 16.3 (An unconditional `break' statement shall terminate
every switch-clause).

Make explicit unreachability of a program point with
ASSERT_UNREACHABLE() and add defensive code.

No functional change.

Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
---
Changes in v3:
- return error code from the ureachable path.
Changes in v2:
- unreachability made explicit.
---
 xen/arch/x86/x86_emulate/fpu.c         | 5 +++++
 xen/arch/x86/x86_emulate/x86_emulate.c | 1 +
 2 files changed, 6 insertions(+)

diff --git a/xen/arch/x86/x86_emulate/fpu.c b/xen/arch/x86/x86_emulate/fpu.c
index 480d879657..54c8621421 100644
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
 
@@ -457,6 +460,8 @@ int x86emul_fpu(struct x86_emulate_state *s,
             case 7: /* fistp m64i */
                 goto fpu_memdst64;
             }
+            ASSERT_UNREACHABLE();
+            return X86EMUL_UNHANDLEABLE;
         }
         break;
 
diff --git a/xen/arch/x86/x86_emulate/x86_emulate.c b/xen/arch/x86/x86_emulate/x86_emulate.c
index 6b6b8c8fe4..30674ec301 100644
--- a/xen/arch/x86/x86_emulate/x86_emulate.c
+++ b/xen/arch/x86/x86_emulate/x86_emulate.c
@@ -8310,6 +8310,7 @@ x86_emulate(
         }
         if ( rc != 0 )
             goto done;
+        break;
     default:
         break;
     }
-- 
2.43.0


