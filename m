Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 40935524F35
	for <lists+xen-devel@lfdr.de>; Thu, 12 May 2022 16:02:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.327728.550625 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1np9OG-0002Bz-GA; Thu, 12 May 2022 14:02:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 327728.550625; Thu, 12 May 2022 14:02:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1np9OG-000288-At; Thu, 12 May 2022 14:02:04 +0000
Received: by outflank-mailman (input) for mailman id 327728;
 Thu, 12 May 2022 14:02:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FVjp=VU=linuxfoundation.org=gregkh@srs-se1.protection.inumbo.net>)
 id 1np9OF-0001rh-7R
 for xen-devel@lists.xenproject.org; Thu, 12 May 2022 14:02:03 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 11e0eeca-d1fc-11ec-8fc4-03012f2f19d4;
 Thu, 12 May 2022 16:01:50 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id C5CF4B8283A;
 Thu, 12 May 2022 14:02:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A014C34114;
 Thu, 12 May 2022 14:01:59 +0000 (UTC)
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
X-Inumbo-ID: 11e0eeca-d1fc-11ec-8fc4-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1652364119;
	bh=r9ta6P7ZRths+9S/6LdjeCw30mXxnb+dFJ5Xg+4yH1s=;
	h=Subject:To:Cc:From:Date:From;
	b=mCd+vYC3ZkawcmV7o+Y+NM5UgkuRmcMu2m3QTfB9N70iVs8JumaNameETgECwhPVm
	 Z8f5BU6iLUAar9tWAO44LfGDGqg7M+ezYG7aaTA3VTYOVuto3hv1RXWi7fGguUUpDK
	 ONv4RQUITdd4TULXAP2O3c7LXGS//QfF/TTAnyI4=
Subject: Patch "x86: kprobes: Prohibit probing on instruction which has emulate prefix" has been added to the 5.4-stable tree
To: andrew.cooper3@citrix.com,boris.ostrovsky@oracle.com,bp@alien8.de,gregkh@linuxfoundation.org,jgross@suse.com,jpoimboe@redhat.com,mheyne@amazon.de,mhiramat@kernel.org,mingo@kernel.org,peterz@infradead.org,rdunlap@infradead.org,sstabellini@kernel.org,x86@kernel.org,xen-devel@lists.xenproject.org
Cc: <stable-commits@vger.kernel.org>
From: <gregkh@linuxfoundation.org>
Date: Thu, 12 May 2022 16:01:38 +0200
Message-ID: <165236409813853@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=ANSI_X3.4-1968
Content-Transfer-Encoding: 8bit
X-stable: commit
X-Patchwork-Hint: ignore 


This is a note to let you know that I've just added the patch titled

    x86: kprobes: Prohibit probing on instruction which has emulate prefix

to the 5.4-stable tree which can be found at:
    http://www.kernel.org/git/?p=linux/kernel/git/stable/stable-queue.git;a=summary

The filename of the patch is:
     x86-kprobes-prohibit-probing-on-instruction-which-has-emulate-prefix.patch
and it can be found in the queue-5.4 subdirectory.

If you, or anyone else, feels it should not be added to the stable tree,
please let <stable@vger.kernel.org> know about it.


From 004e8dce9c5595697951f7cd0e9f66b35c92265e Mon Sep 17 00:00:00 2001
From: Masami Hiramatsu <mhiramat@kernel.org>
Date: Fri, 6 Sep 2019 22:14:20 +0900
Subject: x86: kprobes: Prohibit probing on instruction which has emulate prefix

From: Masami Hiramatsu <mhiramat@kernel.org>

commit 004e8dce9c5595697951f7cd0e9f66b35c92265e upstream.

Prohibit probing on instruction which has XEN_EMULATE_PREFIX
or KVM's emulate prefix. Since that prefix is a marker for Xen
and KVM, if we modify the marker by kprobe's int3, that doesn't
work as expected.

Signed-off-by: Masami Hiramatsu <mhiramat@kernel.org>
Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
Cc: Juergen Gross <jgross@suse.com>
Cc: x86@kernel.org
Cc: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Cc: Ingo Molnar <mingo@kernel.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Borislav Petkov <bp@alien8.de>
Cc: xen-devel@lists.xenproject.org
Cc: Randy Dunlap <rdunlap@infradead.org>
Cc: Josh Poimboeuf <jpoimboe@redhat.com>
Link: https://lkml.kernel.org/r/156777566048.25081.6296162369492175325.stgit@devnote2
Signed-off-by: Maximilian Heyne <mheyne@amazon.de>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 arch/x86/kernel/kprobes/core.c |    4 ++++
 1 file changed, 4 insertions(+)

--- a/arch/x86/kernel/kprobes/core.c
+++ b/arch/x86/kernel/kprobes/core.c
@@ -358,6 +358,10 @@ int __copy_instruction(u8 *dest, u8 *src
 	kernel_insn_init(insn, dest, MAX_INSN_SIZE);
 	insn_get_length(insn);
 
+	/* We can not probe force emulate prefixed instruction */
+	if (insn_has_emulate_prefix(insn))
+		return 0;
+
 	/* Another subsystem puts a breakpoint, failed to recover */
 	if (insn->opcode.bytes[0] == BREAKPOINT_INSTRUCTION)
 		return 0;


Patches currently in stable-queue which might be from mhiramat@kernel.org are

queue-5.4/x86-xen-kvm-gather-the-definition-of-emulate-prefixes.patch
queue-5.4/x86-xen-insn-decode-xen-and-kvm-emulate-prefix-signature.patch
queue-5.4/x86-asm-allow-to-pass-macros-to-__asm_form.patch
queue-5.4/x86-kprobes-prohibit-probing-on-instruction-which-has-emulate-prefix.patch

