Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B4DE992F39
	for <lists+xen-devel@lfdr.de>; Mon,  7 Oct 2024 16:28:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.812092.1224814 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sxoiy-0002bJ-EZ; Mon, 07 Oct 2024 14:28:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 812092.1224814; Mon, 07 Oct 2024 14:28:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sxoiy-0002YB-Bc; Mon, 07 Oct 2024 14:28:36 +0000
Received: by outflank-mailman (input) for mailman id 812092;
 Mon, 07 Oct 2024 14:28:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/gRD=RD=bugseng.com=federico.serafini@srs-se1.protection.inumbo.net>)
 id 1sxoXL-0002yM-TY
 for xen-devel@lists.xenproject.org; Mon, 07 Oct 2024 14:16:35 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c25ca249-84b6-11ef-a0bb-8be0dac302b0;
 Mon, 07 Oct 2024 16:16:35 +0200 (CEST)
Received: from truciolo.bugseng.com (unknown [37.162.58.49])
 by support.bugseng.com (Postfix) with ESMTPSA id D37314EE0745;
 Mon,  7 Oct 2024 16:16:33 +0200 (CEST)
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
X-Inumbo-ID: c25ca249-84b6-11ef-a0bb-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=bugseng.com; s=mail;
	t=1728310595; bh=bPGNGs/7gKws9KC4a8OFYQw2+N/QcDxZjIxN7dUNgMw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=kNh/5lISmIQ1gmhVCXsh3Ez15sbICvQAm7ysmvf676GQzNBIlv2V2aSe2xHDGo4sP
	 wpMcgMFqQnALlSIk2QY9IIUG/O/+o7g8lL1lQjw4EdlaTtR+h1pEWtZFmMlpOiitUe
	 ihO3ihs9V3gfIXk4jPbloTuP45zJ+Nz+bmCPE6keWYqjmGBlQHMzu9jX7WKKj1hw9W
	 7Jxnt4WVAeh0EG3Az1cmMGCqfGi5DGFoD1sygqxPloAbZtZZzTVEE8DaHBCeOzn5WT
	 lNeJNlRFbF8UuGpFzvDqgt3pOWIXySZzTCl9/+3IsSxKovXJMrJabk0nXwUwK2PVZL
	 ivq6qW/m4a2Yg==
From: Federico Serafini <federico.serafini@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com,
	Federico Serafini <federico.serafini@bugseng.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [XEN PATCH v2 2/4] x86/emul: address violations of MISRA C Rule 16.3
Date: Mon,  7 Oct 2024 16:16:17 +0200
Message-ID: <662440bc082fcb91ad9489999add02fc71416d45.1728308312.git.federico.serafini@bugseng.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1728308312.git.federico.serafini@bugseng.com>
References: <cover.1728308312.git.federico.serafini@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add missing break statements to address violations of MISRA C:2012
Rule 16.3 (An unconditional `break' statement shall terminate
every switch-clause).

Make explicit unreachability of a program points with
ASSERT_UNREACHABLE().

No functional change.

Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
---
Changes in v2:
- unreachability made explicit.
---
 xen/arch/x86/x86_emulate/fpu.c         | 5 +++++
 xen/arch/x86/x86_emulate/x86_emulate.c | 1 +
 2 files changed, 6 insertions(+)

diff --git a/xen/arch/x86/x86_emulate/fpu.c b/xen/arch/x86/x86_emulate/fpu.c
index 480d879657..f0dab346e0 100644
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
+            break;
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


