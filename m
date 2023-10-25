Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E1FF7D6D08
	for <lists+xen-devel@lfdr.de>; Wed, 25 Oct 2023 15:23:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.622877.970106 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvdqK-00071n-S9; Wed, 25 Oct 2023 13:22:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 622877.970106; Wed, 25 Oct 2023 13:22:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvdqK-0006yx-PE; Wed, 25 Oct 2023 13:22:40 +0000
Received: by outflank-mailman (input) for mailman id 622877;
 Wed, 25 Oct 2023 13:22:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Kl7N=GH=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1qvdqJ-0006iv-Di
 for xen-devel@lists.xenproject.org; Wed, 25 Oct 2023 13:22:39 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 90eed7f3-7339-11ee-9b0e-b553b5be7939;
 Wed, 25 Oct 2023 15:22:37 +0200 (CEST)
Received: from nico.bugseng.com (unknown [147.123.100.131])
 by support.bugseng.com (Postfix) with ESMTPSA id DA8CE4EE073A;
 Wed, 25 Oct 2023 15:22:35 +0200 (CEST)
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
X-Inumbo-ID: 90eed7f3-7339-11ee-9b0e-b553b5be7939
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org,
	michal.orzel@amd.com,
	xenia.ragiadakou@amd.com,
	ayan.kumar.halder@amd.com,
	consulting@bugseng.com,
	jbeulich@suse.com,
	andrew.cooper3@citrix.com,
	roger.pau@citrix.com,
	Nicola Vetrini <nicola.vetrini@bugseng.com>,
	Wei Liu <wl@xen.org>,
	Paul Durrant <paul@xen.org>,
	George Dunlap <george.dunlap@citrix.com>
Subject: [RFC PATCH] x86/vlapic: address a violation of MISRA C:2012 Rule 16.2
Date: Wed, 25 Oct 2023 15:22:32 +0200
Message-Id: <99114c15a4256e6a0f39bd6de232ee4b8ad9b587.1698239734.git.nicola.vetrini@bugseng.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The clauses of a switch should be enclosed directly by a switch
statement to make the code more easily understandable and less
prone to errors.

Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
---
This patch is mainly indended to probe how the community, especially the
maintainers, would receive such modifications to the code, and whether there
would be consensus on the rule's adoption. Anyone is welcome to
give feedback on this, especially on the x86 side, where this pattern
is used more frequently.
---
 xen/arch/x86/hvm/vlapic.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/xen/arch/x86/hvm/vlapic.c b/xen/arch/x86/hvm/vlapic.c
index c7ce82d0649a..318dd48577e2 100644
--- a/xen/arch/x86/hvm/vlapic.c
+++ b/xen/arch/x86/hvm/vlapic.c
@@ -1034,10 +1034,10 @@ int guest_wrmsr_x2apic(struct vcpu *v, uint32_t msr, uint64_t val)
     case APIC_EOI:
     case APIC_ESR:
         if ( val )
-        {
-    default:
             return X86EMUL_EXCEPTION;
-        }
+        break;
+    default:
+        return X86EMUL_EXCEPTION;
     }
 
     vlapic_reg_write(v, array_index_nospec(offset, PAGE_SIZE), val);
-- 
2.34.1

