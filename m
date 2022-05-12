Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D665E524F09
	for <lists+xen-devel@lfdr.de>; Thu, 12 May 2022 15:58:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.327695.550558 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1np9Kr-0006dJ-Ew; Thu, 12 May 2022 13:58:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 327695.550558; Thu, 12 May 2022 13:58:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1np9Kr-0006ZP-BF; Thu, 12 May 2022 13:58:33 +0000
Received: by outflank-mailman (input) for mailman id 327695;
 Thu, 12 May 2022 13:58:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ErCJ=VU=amazon.de=prvs=124fe2d2c=mheyne@srs-se1.protection.inumbo.net>)
 id 1np9Kq-0005De-67
 for xen-devel@lists.xenproject.org; Thu, 12 May 2022 13:58:32 +0000
Received: from smtp-fw-6001.amazon.com (smtp-fw-6001.amazon.com [52.95.48.154])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 94166ddc-d1fb-11ec-8fc4-03012f2f19d4;
 Thu, 12 May 2022 15:58:20 +0200 (CEST)
Received: from iad12-co-svc-p1-lb1-vlan3.amazon.com (HELO
 email-inbound-relay-pdx-2a-ff3df2fe.us-west-2.amazon.com) ([10.43.8.6])
 by smtp-border-fw-6001.iad6.amazon.com with ESMTP; 12 May 2022 13:58:15 +0000
Received: from EX13D08EUC002.ant.amazon.com
 (pdx1-ws-svc-p6-lb9-vlan2.pdx.amazon.com [10.236.137.194])
 by email-inbound-relay-pdx-2a-ff3df2fe.us-west-2.amazon.com (Postfix) with
 ESMTPS id BF6FC41E0E; Thu, 12 May 2022 13:58:06 +0000 (UTC)
Received: from EX13MTAUEB002.ant.amazon.com (10.43.60.12) by
 EX13D08EUC002.ant.amazon.com (10.43.164.124) with Microsoft SMTP Server (TLS)
 id 15.0.1497.32; Thu, 12 May 2022 13:58:04 +0000
Received: from dev-dsk-mheyne-1b-c1524648.eu-west-1.amazon.com (10.15.60.66)
 by mail-relay.amazon.com (10.43.60.234) with Microsoft SMTP Server id
 15.0.1497.32 via Frontend Transport; Thu, 12 May 2022 13:58:04 +0000
Received: by dev-dsk-mheyne-1b-c1524648.eu-west-1.amazon.com (Postfix,
 from userid 5466572)
 id E90A841131; Thu, 12 May 2022 13:58:03 +0000 (UTC)
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
X-Inumbo-ID: 94166ddc-d1fb-11ec-8fc4-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.de; i=@amazon.de; q=dns/txt; s=amazon201209;
  t=1652363911; x=1683899911;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=fXdsCza0w8qNDoFrKMYkMnUAwI+hskYjRxqBpTNbyyY=;
  b=T1LDzVLXLuacWaHxogaYGICrW1r2tquL/p/GrpOGRpHF89nGsI+Sg7fm
   RLytGpFR1FKfC2gxRe4WJLjMThdpnhQ1uLcN5Iu6p4aiN4h829IHUvpE7
   PH7pkWUdw3729vE+kW8/XTp5VMDT3UDuQXOcl/9I82iXLS6cZJL0OjTu4
   s=;
X-IronPort-AV: E=Sophos;i="5.91,220,1647302400"; 
   d="scan'208";a="202425735"
From: Maximilian Heyne <mheyne@amazon.de>
To: <stable@vger.kernel.org>
CC: Masami Hiramatsu <mhiramat@kernel.org>, Peter Zijlstra
	<peterz@infradead.org>, Juergen Gross <jgross@suse.com>, <x86@kernel.org>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>, Ingo Molnar <mingo@kernel.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Borislav Petkov <bp@alien8.de>,
	<xen-devel@lists.xenproject.org>, Randy Dunlap <rdunlap@infradead.org>, Josh
 Poimboeuf <jpoimboe@redhat.com>, Maximilian Heyne <mheyne@amazon.de>, Thomas
 Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, "H. Peter
 Anvin" <hpa@zytor.com>, Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Radim=20Kr=C4=8Dm=C3=A1=C5=99?= <rkrcmar@redhat.com>, Sean
 Christopherson <sean.j.christopherson@intel.com>, Vitaly Kuznetsov
	<vkuznets@redhat.com>, Wanpeng Li <wanpengli@tencent.com>, Jim Mattson
	<jmattson@google.com>, Joerg Roedel <joro@8bytes.org>, Arnaldo Carvalho de
 Melo <acme@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Alexander
 Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@redhat.com>,
	Namhyung Kim <namhyung@kernel.org>, Sasha Levin <sashal@kernel.org>,
	<linux-kernel@vger.kernel.org>, <kvm@vger.kernel.org>
Subject: [PATCH 4/4] x86: kprobes: Prohibit probing on instruction which has emulate prefix
Date: Thu, 12 May 2022 13:56:51 +0000
Message-ID: <20220512135654.119791-5-mheyne@amazon.de>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220512135654.119791-1-mheyne@amazon.de>
References: <20220512135654.119791-1-mheyne@amazon.de>
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




