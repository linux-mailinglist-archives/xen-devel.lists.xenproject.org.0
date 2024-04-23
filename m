Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 680278AE544
	for <lists+xen-devel@lfdr.de>; Tue, 23 Apr 2024 14:01:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.710551.1109791 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rzEpm-0005nF-AY; Tue, 23 Apr 2024 12:01:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 710551.1109791; Tue, 23 Apr 2024 12:01:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rzEpm-0005kb-7O; Tue, 23 Apr 2024 12:01:14 +0000
Received: by outflank-mailman (input) for mailman id 710551;
 Tue, 23 Apr 2024 12:01:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=L0uI=L4=antgroup.com=houwenlong.hwl@srs-se1.protection.inumbo.net>)
 id 1rzEpj-0005kV-TD
 for xen-devel@lists.xenproject.org; Tue, 23 Apr 2024 12:01:12 +0000
Received: from out0-217.mail.aliyun.com (out0-217.mail.aliyun.com
 [140.205.0.217]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 299b52be-0169-11ef-909a-e314d9c70b13;
 Tue, 23 Apr 2024 14:01:08 +0200 (CEST)
Received: from localhost(mailfrom:houwenlong.hwl@antgroup.com
 fp:SMTPD_---.XJWBgvy_1713873662) by smtp.aliyun-inc.com;
 Tue, 23 Apr 2024 20:01:03 +0800
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
X-Inumbo-ID: 299b52be-0169-11ef-909a-e314d9c70b13
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=antgroup.com; s=default;
	t=1713873664; h=From:To:Subject:Date:Message-Id:MIME-Version;
	bh=fZ3yJhfmevqTNF6DwN5orHbyXoVhDRkMA3HeGG/5QSU=;
	b=ObkvEPuhWgrfYLfD1cdS/CSc+PIZXHcqGF8n9vh+BtItKn8PJWZKBhlPgl6i/KRKiMpZz+UjJpdT/gjtV8FZ3LBzHJzRJordXD4TaAMITnUUb1ddPhh+fCSx1dRlU/TRNvcVaEc4hJQ70wLQCcFOH66be+JVGQyxXvvf0c0QIgs=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R721e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=ay29a033018047201;MF=houwenlong.hwl@antgroup.com;NM=1;PH=DS;RN=11;SR=0;TI=SMTPD_---.XJWBgvy_1713873662;
From: "Hou Wenlong" <houwenlong.hwl@antgroup.com>
To: linux-kernel@vger.kernel.org
Cc: "Hou Wenlong" <houwenlong.hwl@antgroup.com>,
  "Juergen Gross" <jgross@suse.com>,
  "Boris Ostrovsky" <boris.ostrovsky@oracle.com>,
  "Thomas Gleixner" <tglx@linutronix.de>,
  "Ingo Molnar" <mingo@redhat.com>,
  "Borislav Petkov" <bp@alien8.de>,
  "Dave Hansen" <dave.hansen@linux.intel.com>,
   <x86@kernel.org>,
  "H. Peter Anvin" <hpa@zytor.com>,
   <xen-devel@lists.xenproject.org>
Subject: [PATCH v2] x86/xen/pvh: Enable PAE mode for 32-bit guest only when CONFIG_X86_PAE is set
Date: Tue, 23 Apr 2024 20:00:58 +0800
Message-Id: <0469c27833be58aa66471920aa77922489d86c63.1713873613.git.houwenlong.hwl@antgroup.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The PVH entry is available for 32-bit KVM guests, and 32-bit KVM guests
do not depend on CONFIG_X86_PAE. However, mk_early_pgtbl_32() builds
different pagetables depending on whether CONFIG_X86_PAE is set.
Therefore, enabling PAE mode for 32-bit KVM guests without
CONFIG_X86_PAE being set would result in a boot failure during CR3
loading.

Signed-off-by: Hou Wenlong <houwenlong.hwl@antgroup.com>
Reviewed-by: Juergen Gross <jgross@suse.com>
---
v1 -> v2: Add the "Reviewed-by" tag from Juergen
v1: https://lore.kernel.org/lkml/8c5448eeebbba998a7fff9ed9b2f7e7f3e437967.1697792461.git.houwenlong.hwl@antgroup.com
---
 arch/x86/platform/pvh/head.S | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/x86/platform/pvh/head.S b/arch/x86/platform/pvh/head.S
index f7235ef87bc3..18c69d213458 100644
--- a/arch/x86/platform/pvh/head.S
+++ b/arch/x86/platform/pvh/head.S
@@ -71,10 +71,12 @@ SYM_CODE_START_LOCAL(pvh_start_xen)
 
 	mov $_pa(early_stack_end), %esp
 
+#if defined(CONFIG_X86_64) || defined(CONFIG_X86_PAE)
 	/* Enable PAE mode. */
 	mov %cr4, %eax
 	orl $X86_CR4_PAE, %eax
 	mov %eax, %cr4
+#endif
 
 #ifdef CONFIG_X86_64
 	/* Enable Long mode. */
-- 
2.31.1


