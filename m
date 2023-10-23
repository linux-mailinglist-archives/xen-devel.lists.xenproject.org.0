Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 030647D2DB1
	for <lists+xen-devel@lfdr.de>; Mon, 23 Oct 2023 11:10:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.621107.967202 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1quqww-0004bM-An; Mon, 23 Oct 2023 09:10:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 621107.967202; Mon, 23 Oct 2023 09:10:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1quqww-0004Xi-7b; Mon, 23 Oct 2023 09:10:14 +0000
Received: by outflank-mailman (input) for mailman id 621107;
 Mon, 23 Oct 2023 09:10:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DOxK=GF=antgroup.com=houwenlong.hwl@srs-se1.protection.inumbo.net>)
 id 1quqwu-0003eK-Ns
 for xen-devel@lists.xenproject.org; Mon, 23 Oct 2023 09:10:12 +0000
Received: from out0-194.mail.aliyun.com (out0-194.mail.aliyun.com
 [140.205.0.194]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f0d6f75c-7183-11ee-9b0e-b553b5be7939;
 Mon, 23 Oct 2023 11:10:10 +0200 (CEST)
Received: from localhost(mailfrom:houwenlong.hwl@antgroup.com
 fp:SMTPD_---.V5qfj36_1698052195) by smtp.aliyun-inc.com;
 Mon, 23 Oct 2023 17:09:56 +0800
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
X-Inumbo-ID: f0d6f75c-7183-11ee-9b0e-b553b5be7939
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R541e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=ay29a033018047204;MF=houwenlong.hwl@antgroup.com;NM=1;PH=DS;RN=14;SR=0;TI=SMTPD_---.V5qfj36_1698052195;
From: "Hou Wenlong" <houwenlong.hwl@antgroup.com>
To: linux-kernel@vger.kernel.org
Cc: "Hou Wenlong" <houwenlong.hwl@antgroup.com>,
  "Juergen Gross" <jgross@suse.com>,
  "Boris Ostrovsky" <boris.ostrovsky@oracle.com>,
  "Darren Hart" <dvhart@infradead.org>,
  "Andy Shevchenko" <andy@infradead.org>,
  "Thomas Gleixner" <tglx@linutronix.de>,
  "Ingo Molnar" <mingo@redhat.com>,
  "Borislav Petkov" <bp@alien8.de>,
  "Dave Hansen" <dave.hansen@linux.intel.com>,
  "=?UTF-8?B?bWFpbnRhaW5lcjpYODYgQVJDSElURUNUVVJFIDMyLUJJVCBBTkQgNjQtQklU?=" <x86@kernel.org>,
  "H. Peter Anvin" <hpa@zytor.com>,
  "=?UTF-8?B?bW9kZXJhdGVkIGxpc3Q6WEVOIEhZUEVSVklTT1IgWDg2?=" <xen-devel@lists.xenproject.org>,
  "=?UTF-8?B?b3BlbiBsaXN0Olg4NiBQTEFURk9STSBEUklWRVJTIC0gQVJDSA==?=" <platform-driver-x86@vger.kernel.org>
Subject: [PATCH 1/2] x86/xen/pvh: Set up percpu for stack canary in 32-bit kernel entry
Date: Mon, 23 Oct 2023 17:09:38 +0800
Message-Id: <90df6cf5674241a85ac7dfe0a1558f1fd025cc17.1698051454.git.houwenlong.hwl@antgroup.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1698051454.git.houwenlong.hwl@antgroup.com>
References: <cover.1698051454.git.houwenlong.hwl@antgroup.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In a 32-bit SMP kernel, the stack canary is a percpu variable accessed
as %fs:__stack_chk_guard. However, the ABI for PVH entry does not
specify the %fs register state. It currently works because the initial
%fs register is 0x10 for QEMU, which is the same as $PVH_DS_SEL.
%However, for added safety, the percpu should be set up explicitly
%before calling xen_prepare_pvh(), which accesses the stack canary.

Signed-off-by: Hou Wenlong <houwenlong.hwl@antgroup.com>
---
 arch/x86/platform/pvh/head.S | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/x86/platform/pvh/head.S b/arch/x86/platform/pvh/head.S
index c4365a05ab83..cee4dadf5344 100644
--- a/arch/x86/platform/pvh/head.S
+++ b/arch/x86/platform/pvh/head.S
@@ -121,6 +121,10 @@ SYM_CODE_START_LOCAL(pvh_start_xen)
 
 	ljmp $PVH_CS_SEL, $1f
 1:
+	/* Set percpu for stack canary. */
+	mov $PVH_DS_SEL,%eax
+	mov %eax, %fs
+
 	call xen_prepare_pvh
 	mov $_pa(pvh_bootparams), %esi
 
-- 
2.31.1


