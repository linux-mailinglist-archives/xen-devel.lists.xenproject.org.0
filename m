Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 67574886816
	for <lists+xen-devel@lfdr.de>; Fri, 22 Mar 2024 09:17:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.696704.1087830 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rna5B-0002NR-28; Fri, 22 Mar 2024 08:16:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 696704.1087830; Fri, 22 Mar 2024 08:16:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rna5A-0002Lt-VV; Fri, 22 Mar 2024 08:16:56 +0000
Received: by outflank-mailman (input) for mailman id 696704;
 Fri, 22 Mar 2024 08:16:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=aIP5=K4=zytor.com=xin@srs-se1.protection.inumbo.net>)
 id 1rna59-0002LY-8A
 for xen-devel@lists.xenproject.org; Fri, 22 Mar 2024 08:16:55 +0000
Received: from mail.zytor.com (unknown [2607:7c80:54:3::138])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8782feda-e824-11ee-a1ee-f123f15fe8a2;
 Fri, 22 Mar 2024 09:16:49 +0100 (CET)
Received: from terminus.zytor.com (terminus.zytor.com
 [IPv6:2607:7c80:54:3:0:0:0:136]) (authenticated bits=0)
 by mail.zytor.com (8.17.2/8.17.1) with ESMTPSA id 42M8GG9e3346191
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
 Fri, 22 Mar 2024 01:16:20 -0700
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
X-Inumbo-ID: 8782feda-e824-11ee-a1ee-f123f15fe8a2
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com 42M8GG9e3346191
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
	s=2024031401; t=1711095381;
	bh=k7eKfOcnuljC+WdHZ/WvG4Vv4XD7QPRuthF5whrgwF8=;
	h=From:To:Cc:Subject:Date:From;
	b=JuGtM0tfu2fMqhIFFArB2uZWF+01NrS3nd8DhPk1sXKePwN4vKwJm70aIdLap8sMt
	 bkSNerFhQQ257nyuye8Hd7DP+r2vcORa1bihR1bPrvDALT+J0KqxlXfg3hMFq3O4Fn
	 t1ynGTKCsGGFMh9bW0TCO/Q/8aeRhcN8ukr86ksHcMHFWq5eCvQVbXSDmR6tc8AjDE
	 TvuAclOnO93GMlohYvihnxb4fYZGdocn71wWdH6CqZXO9bISwZKIueiEhP33jCXTI/
	 bYTu7XZjgnuBvcECdB72tegow3CsDLVhb47IYC65XMLvkT7rYAX6zhyjMzNhuM8DP4
	 gh3QA90BSWvWA==
From: "Xin Li (Intel)" <xin@zytor.com>
To: linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org,
        linux-arch@vger.kernel.org
Cc: tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
        dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com,
        jgross@suse.com, boris.ostrovsky@oracle.com, arnd@arndb.de
Subject: [PATCH v3 1/1] x86: Rename __{start,end}_init_task to __{start,end}_init_stack
Date: Fri, 22 Mar 2024 01:16:16 -0700
Message-ID: <20240322081616.3346181-1-xin@zytor.com>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The stack of a task has been separated from the memory of a task_struct
struture for a long time on x86, as a result __{start,end}_init_task no
longer mark the start and end of the init_task structure, but its stack
only.

Rename __{start,end}_init_task to __{start,end}_init_stack.

Note other architectures are not affected because __{start,end}_init_task
are used on x86 only.

Reviewed-by: Juergen Gross <jgross@suse.com>
Signed-off-by: Xin Li (Intel) <xin@zytor.com>
---

Change since v2:
* Rebase to the latest tip master branch.

Change since v1:
* Revert an accident insane change, init_task to init_stack (Jürgen Groß).
---
 arch/x86/kernel/vmlinux.lds.S     | 2 +-
 include/asm-generic/vmlinux.lds.h | 6 +++---
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/x86/kernel/vmlinux.lds.S b/arch/x86/kernel/vmlinux.lds.S
index d430880175f2..3509afc6a672 100644
--- a/arch/x86/kernel/vmlinux.lds.S
+++ b/arch/x86/kernel/vmlinux.lds.S
@@ -168,7 +168,7 @@ SECTIONS
 		INIT_TASK_DATA(THREAD_SIZE)
 
 		/* equivalent to task_pt_regs(&init_task) */
-		__top_init_kernel_stack = __end_init_task - TOP_OF_KERNEL_STACK_PADDING - PTREGS_SIZE;
+		__top_init_kernel_stack = __end_init_stack - TOP_OF_KERNEL_STACK_PADDING - PTREGS_SIZE;
 
 #ifdef CONFIG_X86_32
 		/* 32 bit has nosave before _edata */
diff --git a/include/asm-generic/vmlinux.lds.h b/include/asm-generic/vmlinux.lds.h
index cb46306d8305..9752eb420ffa 100644
--- a/include/asm-generic/vmlinux.lds.h
+++ b/include/asm-generic/vmlinux.lds.h
@@ -399,13 +399,13 @@
 
 #define INIT_TASK_DATA(align)						\
 	. = ALIGN(align);						\
-	__start_init_task = .;						\
+	__start_init_stack = .;						\
 	init_thread_union = .;						\
 	init_stack = .;							\
 	KEEP(*(.data..init_task))					\
 	KEEP(*(.data..init_thread_info))				\
-	. = __start_init_task + THREAD_SIZE;				\
-	__end_init_task = .;
+	. = __start_init_stack + THREAD_SIZE;				\
+	__end_init_stack = .;
 
 #define JUMP_TABLE_DATA							\
 	. = ALIGN(8);							\

base-commit: 93387dba36cc9033724d8b874a5cf6779ef084ab
-- 
2.44.0


