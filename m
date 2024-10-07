Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 35797992F45
	for <lists+xen-devel@lfdr.de>; Mon,  7 Oct 2024 16:29:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.812105.1224824 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sxojj-0004QG-Nl; Mon, 07 Oct 2024 14:29:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 812105.1224824; Mon, 07 Oct 2024 14:29:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sxojj-0004O9-KY; Mon, 07 Oct 2024 14:29:23 +0000
Received: by outflank-mailman (input) for mailman id 812105;
 Mon, 07 Oct 2024 14:29:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/gRD=RD=bugseng.com=federico.serafini@srs-se1.protection.inumbo.net>)
 id 1sxoXM-0002dC-8D
 for xen-devel@lists.xenproject.org; Mon, 07 Oct 2024 14:16:36 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c16f7f91-84b6-11ef-99a2-01e77a169b0f;
 Mon, 07 Oct 2024 16:16:33 +0200 (CEST)
Received: from truciolo.bugseng.com (unknown [37.162.58.49])
 by support.bugseng.com (Postfix) with ESMTPSA id ACA1E4EE0743;
 Mon,  7 Oct 2024 16:16:32 +0200 (CEST)
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
X-Inumbo-ID: c16f7f91-84b6-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=bugseng.com; s=mail;
	t=1728310593; bh=pkehAqIigHugA14oiN/kSXZIjXGX6ygiIRmSA9aEPl0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=DNsLZMClLCIOP+iP8GcTHaCg58dgwWfkO4r+WhG5ZXUvUN0XFBIc1ScaaIwfzRhfL
	 /odxlPhj6dvIpEFtVIF20a88aIPFblEWcM9g0rkadhHOmkTB3USqkpTDp7NgUBeY98
	 MTLbB+0j3XluWB88FxHjz3xVp9fqLMQ6qyJPvbUu7PfiJqqityPafRMrZwu69ubTxE
	 lIKwmy0JRR7Zzllp5I0yEmMUAevmpLiiC+TE4zq4Eu2Dx2CAwQheVCtNXeVZxWiLG0
	 152/2bXWyuG0avdiQDhlCSmOm7vhz6e0TVYB7cN0QiwA2KjZmGXLJRqaomAEafzt7V
	 iRuv3ufAY364Q==
From: Federico Serafini <federico.serafini@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com,
	Federico Serafini <federico.serafini@bugseng.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [XEN PATCH v2 1/4] x86/emul: add defensive code
Date: Mon,  7 Oct 2024 16:16:16 +0200
Message-ID: <063bd71b535825715bd54ee9238bec2fc87f0bba.1728308312.git.federico.serafini@bugseng.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1728308312.git.federico.serafini@bugseng.com>
References: <cover.1728308312.git.federico.serafini@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add defensive code after unreachable program points.
This also meets the requirements to deviate violations of MISRA C:2012
Rule 16.3: "An unconditional `break' statement shall terminate every
switch-clause".

Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
---
Changes in v2:
- use goto unhandleable.
---
 xen/arch/x86/x86_emulate/x86_emulate.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/xen/arch/x86/x86_emulate/x86_emulate.c b/xen/arch/x86/x86_emulate/x86_emulate.c
index 0ea0d5e67e..6b6b8c8fe4 100644
--- a/xen/arch/x86/x86_emulate/x86_emulate.c
+++ b/xen/arch/x86/x86_emulate/x86_emulate.c
@@ -6840,6 +6840,7 @@ x86_emulate(
             break;
         default:
             ASSERT_UNREACHABLE();
+            goto unhandleable;
         }
         break;
 #ifdef HAVE_AS_SSE4_2
@@ -6868,6 +6869,7 @@ x86_emulate(
 # endif
         default:
             ASSERT_UNREACHABLE();
+            goto unhandleable;
         }
         break;
 #endif
-- 
2.43.0


