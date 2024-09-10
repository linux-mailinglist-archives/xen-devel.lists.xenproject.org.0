Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B0B2F97312A
	for <lists+xen-devel@lfdr.de>; Tue, 10 Sep 2024 12:09:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.795240.1204525 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1snxoI-0008Sc-5X; Tue, 10 Sep 2024 10:09:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 795240.1204525; Tue, 10 Sep 2024 10:09:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1snxoH-0008Cb-Jc; Tue, 10 Sep 2024 10:09:21 +0000
Received: by outflank-mailman (input) for mailman id 795240;
 Tue, 10 Sep 2024 10:09:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hUAX=QI=bugseng.com=federico.serafini@srs-se1.protection.inumbo.net>)
 id 1snxoF-0006in-7M
 for xen-devel@lists.xenproject.org; Tue, 10 Sep 2024 10:09:19 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bc8f407b-6f5c-11ef-99a1-01e77a169b0f;
 Tue, 10 Sep 2024 12:09:16 +0200 (CEST)
Received: from truciolo.homenet.telecomitalia.it
 (host-79-37-206-90.retail.telecomitalia.it [79.37.206.90])
 by support.bugseng.com (Postfix) with ESMTPSA id E10C04EE0CC2;
 Tue, 10 Sep 2024 12:09:15 +0200 (CEST)
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
X-Inumbo-ID: bc8f407b-6f5c-11ef-99a1-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=bugseng.com; s=mail;
	t=1725962956; bh=7STVOBIhCgKWpEDLBjJ3I3pd4DCbTs6VnI7lN8dRmpo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=NF75lBMMwFAKjJlCteFveEQkKfAAauNEwayIQPtDG4Zpta6Q5xTzOMoSNJ8SBTHWn
	 KLDgdfAWHo+ohBzitH+cGqA1/xgmE0iwBs14q1VlFMhk+E11NWzVM9pRRQM7DhA/3Z
	 xiVcCkpuF6C+TvkxWF/9c92T0jjjvDSxTI39zGTdvp1D9wgwaGEhwk+r1A54kfYYIl
	 UAfFEZQCCrp1eX/2b979PNqS6Dnh38XYdYmlPHOta0lR+v65oYlvfeQwowX5CNfX/K
	 WN68ZXCo5IaKbjbFGmQ6AcRh50JGIpAHZr3CvCQte4yQENrjb+lHknFVAYx2akS77y
	 V9T39h1uLgt1w==
From: Federico Serafini <federico.serafini@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com,
	Federico Serafini <federico.serafini@bugseng.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [XEN PATCH 08/12] x86/emul: add defensive code
Date: Tue, 10 Sep 2024 12:09:00 +0200
Message-Id: <f5d7929f8919eda3914bcf566d7538e64487cc2d.1725958416.git.federico.serafini@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1725958416.git.federico.serafini@bugseng.com>
References: <cover.1725958416.git.federico.serafini@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add defensive code after unreachable program points.
This also meets the requirements to deviate a violation of MISRA C:2012
Rule 16.3: "An unconditional `break' statement shall terminate every
switch-clause".

Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
---
 xen/arch/x86/x86_emulate/x86_emulate.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/xen/arch/x86/x86_emulate/x86_emulate.c b/xen/arch/x86/x86_emulate/x86_emulate.c
index e12fbe3100..2b03d65fce 100644
--- a/xen/arch/x86/x86_emulate/x86_emulate.c
+++ b/xen/arch/x86/x86_emulate/x86_emulate.c
@@ -6831,6 +6831,8 @@ x86_emulate(
             break;
         default:
             ASSERT_UNREACHABLE();
+            rc = X86EMUL_UNHANDLEABLE;
+            goto done;
         }
         break;
 #ifdef HAVE_AS_SSE4_2
@@ -6859,6 +6861,8 @@ x86_emulate(
 # endif
         default:
             ASSERT_UNREACHABLE();
+            rc = X86EMUL_UNHANDLEABLE;
+            goto done;
         }
         break;
 #endif
-- 
2.34.1


