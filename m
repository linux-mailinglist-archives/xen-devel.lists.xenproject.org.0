Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 30E3352186C
	for <lists+xen-devel@lfdr.de>; Tue, 10 May 2022 15:32:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.325640.548319 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1noPyV-0001FB-7w; Tue, 10 May 2022 13:32:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 325640.548319; Tue, 10 May 2022 13:32:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1noPyV-0001Cj-4O; Tue, 10 May 2022 13:32:27 +0000
Received: by outflank-mailman (input) for mailman id 325640;
 Tue, 10 May 2022 13:32:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TIPV=VS=amazon.de=prvs=1222473b2=mheyne@srs-se1.protection.inumbo.net>)
 id 1noPyT-0007QY-Rf
 for xen-devel@lists.xenproject.org; Tue, 10 May 2022 13:32:25 +0000
Received: from smtp-fw-80007.amazon.com (smtp-fw-80007.amazon.com
 [99.78.197.218]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9f69fde0-d065-11ec-a406-831a346695d4;
 Tue, 10 May 2022 15:32:24 +0200 (CEST)
Received: from pdx4-co-svc-p1-lb2-vlan2.amazon.com (HELO
 email-inbound-relay-iad-1a-b27d4a00.us-east-1.amazon.com) ([10.25.36.210])
 by smtp-border-fw-80007.pdx80.corp.amazon.com with ESMTP;
 10 May 2022 13:31:25 +0000
Received: from EX13D08EUB001.ant.amazon.com
 (iad12-ws-svc-p26-lb9-vlan3.iad.amazon.com [10.40.163.38])
 by email-inbound-relay-iad-1a-b27d4a00.us-east-1.amazon.com (Postfix) with
 ESMTPS id 236BC81236; Tue, 10 May 2022 13:31:15 +0000 (UTC)
Received: from EX13MTAUEB002.ant.amazon.com (10.43.60.12) by
 EX13D08EUB001.ant.amazon.com (10.43.166.236) with Microsoft SMTP Server (TLS)
 id 15.0.1497.32; Tue, 10 May 2022 13:31:14 +0000
Received: from dev-dsk-mheyne-1b-c1524648.eu-west-1.amazon.com (10.15.60.66)
 by mail-relay.amazon.com (10.43.60.234) with Microsoft SMTP Server id
 15.0.1497.32 via Frontend Transport; Tue, 10 May 2022 13:31:14 +0000
Received: by dev-dsk-mheyne-1b-c1524648.eu-west-1.amazon.com (Postfix,
 from userid 5466572)
 id E83F641131; Tue, 10 May 2022 13:31:13 +0000 (UTC)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: 9f69fde0-d065-11ec-a406-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.de; i=@amazon.de; q=dns/txt; s=amazon201209;
  t=1652189544; x=1683725544;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=fXdsCza0w8qNDoFrKMYkMnUAwI+hskYjRxqBpTNbyyY=;
  b=Q+en0i+uN9Ewn4HE01M9eacVUESE3pgE5cwho5e5IWi62pH9e/u5Mfja
   mrtT5oOq4z60NqPkk4psDxexwiumYpTdv3Q9NxgWVMHg7CZaRXT9ahmi2
   UzXFeQN7WKSztv61XndBk4+G7gNYfKdXjfnDq3kKJHc2KsvBj/7XbCnQb
   g=;
X-IronPort-AV: E=Sophos;i="5.91,214,1647302400"; 
   d="scan'208";a="87035422"
From: Maximilian Heyne <mheyne@amazon.de>
To: 
CC: Masami Hiramatsu <mhiramat@kernel.org>, Peter Zijlstra
	<peterz@infradead.org>, Juergen Gross <jgross@suse.com>, <x86@kernel.org>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>, Ingo Molnar <mingo@kernel.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Borislav Petkov <bp@alien8.de>,
	<xen-devel@lists.xenproject.org>, Randy Dunlap <rdunlap@infradead.org>, Josh
 Poimboeuf <jpoimboe@redhat.com>, Maximilian Heyne <mheyne@amazon.de>,
	<stable@vger.kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar
	<mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>, Paolo Bonzini
	<pbonzini@redhat.com>, =?UTF-8?q?Radim=20Kr=C4=8Dm=C3=A1=C5=99?=
	<rkrcmar@redhat.com>, Sean Christopherson <sean.j.christopherson@intel.com>,
	Vitaly Kuznetsov <vkuznets@redhat.com>, Wanpeng Li <wanpengli@tencent.com>,
	Jim Mattson <jmattson@google.com>, Joerg Roedel <joro@8bytes.org>, Arnaldo
 Carvalho de Melo <acme@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa
	<jolsa@redhat.com>, Namhyung Kim <namhyung@kernel.org>, Sasha Levin
	<sashal@kernel.org>, <linux-kernel@vger.kernel.org>, <kvm@vger.kernel.org>
Subject: [PATCH 4/4] x86: kprobes: Prohibit probing on instruction which has emulate prefix
Date: Tue, 10 May 2022 13:30:33 +0000
Message-ID: <20220510133036.46767-5-mheyne@amazon.de>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220510133036.46767-1-mheyne@amazon.de>
References: <20220510133036.46767-1-mheyne@amazon.de>
MIME-Version: 1.0
Precedence: Bulk
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Masami Hiramatsu <mhiramat@kernel.org>

commit 004e8dce9c5595697951f7cd0e9f66b35c92265e upstream

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
Cc: stable@vger.kernel.org # 5.4.x
---
 arch/x86/kernel/kprobes/core.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/x86/kernel/kprobes/core.c b/arch/x86/kernel/kprobes/core.c
index c205d77d57da..3700dc94847c 100644
--- a/arch/x86/kernel/kprobes/core.c
+++ b/arch/x86/kernel/kprobes/core.c
@@ -358,6 +358,10 @@ int __copy_instruction(u8 *dest, u8 *src, u8 *real, struct insn *insn)
 	kernel_insn_init(insn, dest, MAX_INSN_SIZE);
 	insn_get_length(insn);
 
+	/* We can not probe force emulate prefixed instruction */
+	if (insn_has_emulate_prefix(insn))
+		return 0;
+
 	/* Another subsystem puts a breakpoint, failed to recover */
 	if (insn->opcode.bytes[0] == BREAKPOINT_INSTRUCTION)
 		return 0;
-- 
2.32.0




Amazon Development Center Germany GmbH
Krausenstr. 38
10117 Berlin
Geschaeftsfuehrung: Christian Schlaeger, Jonathan Weiss
Eingetragen am Amtsgericht Charlottenburg unter HRB 149173 B
Sitz: Berlin
Ust-ID: DE 289 237 879




