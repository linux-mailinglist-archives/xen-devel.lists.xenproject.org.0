Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 781D6524F00
	for <lists+xen-devel@lfdr.de>; Thu, 12 May 2022 15:58:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.327684.550538 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1np9KW-0005SI-15; Thu, 12 May 2022 13:58:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 327684.550538; Thu, 12 May 2022 13:58:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1np9KV-0005MP-RO; Thu, 12 May 2022 13:58:11 +0000
Received: by outflank-mailman (input) for mailman id 327684;
 Thu, 12 May 2022 13:58:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ErCJ=VU=amazon.de=prvs=124fe2d2c=mheyne@srs-se1.protection.inumbo.net>)
 id 1np9KU-0005Dn-Gp
 for xen-devel@lists.xenproject.org; Thu, 12 May 2022 13:58:10 +0000
Received: from smtp-fw-9103.amazon.com (smtp-fw-9103.amazon.com
 [207.171.188.200]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8bf77f1a-d1fb-11ec-a406-831a346695d4;
 Thu, 12 May 2022 15:58:07 +0200 (CEST)
Received: from pdx4-co-svc-p1-lb2-vlan2.amazon.com (HELO
 email-inbound-relay-pdx-2a-ff3df2fe.us-west-2.amazon.com) ([10.25.36.210])
 by smtp-border-fw-9103.sea19.amazon.com with ESMTP; 12 May 2022 13:57:47 +0000
Received: from EX13D08EUC002.ant.amazon.com
 (pdx1-ws-svc-p6-lb9-vlan2.pdx.amazon.com [10.236.137.194])
 by email-inbound-relay-pdx-2a-ff3df2fe.us-west-2.amazon.com (Postfix) with
 ESMTPS id A107B41E0F; Thu, 12 May 2022 13:57:40 +0000 (UTC)
Received: from EX13MTAUWA001.ant.amazon.com (10.43.160.58) by
 EX13D08EUC002.ant.amazon.com (10.43.164.124) with Microsoft SMTP Server (TLS)
 id 15.0.1497.32; Thu, 12 May 2022 13:57:38 +0000
Received: from dev-dsk-mheyne-1b-c1524648.eu-west-1.amazon.com (10.15.60.66)
 by mail-relay.amazon.com (10.43.160.118) with Microsoft SMTP Server id
 15.0.1497.32 via Frontend Transport; Thu, 12 May 2022 13:57:37 +0000
Received: by dev-dsk-mheyne-1b-c1524648.eu-west-1.amazon.com (Postfix,
 from userid 5466572)
 id 102D441131; Thu, 12 May 2022 13:57:36 +0000 (UTC)
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
X-Inumbo-ID: 8bf77f1a-d1fb-11ec-a406-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.de; i=@amazon.de; q=dns/txt; s=amazon201209;
  t=1652363887; x=1683899887;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=ZcFtI8jvSLQdq7u3zXtig0/LPNcCJ80T1zsBtiZt0Y0=;
  b=Giqxwa994vrnt/1i9bqP2tgMvznLTVaX0sVNaUpj0yiAKXykv1Attmms
   fGY6YKGRu0smYG4Bi9oBCX1zBe1fQjRI3sNxKJxmjjkXq+aOne9/Q1R2y
   YMYd279pXKnaAhzoWdouUv5t1lpVb77WcpVHLLF54bFDJO0jyd5nGhQyZ
   E=;
X-IronPort-AV: E=Sophos;i="5.91,220,1647302400"; 
   d="scan'208";a="1015112248"
From: Maximilian Heyne <mheyne@amazon.de>
To: <stable@vger.kernel.org>
CC: Maximilian Heyne <mheyne@amazon.de>, Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, "H. Peter
 Anvin" <hpa@zytor.com>, <x86@kernel.org>, Boris Ostrovsky
	<boris.ostrovsky@oracle.com>, Juergen Gross <jgross@suse.com>, Stefano
 Stabellini <sstabellini@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Radim=20Kr=C4=8Dm=C3=A1=C5=99?= <rkrcmar@redhat.com>, Sean
 Christopherson <sean.j.christopherson@intel.com>, Vitaly Kuznetsov
	<vkuznets@redhat.com>, Wanpeng Li <wanpengli@tencent.com>, Jim Mattson
	<jmattson@google.com>, Joerg Roedel <joro@8bytes.org>, Josh Poimboeuf
	<jpoimboe@redhat.com>, Peter Zijlstra <peterz@infradead.org>, Arnaldo
 Carvalho de Melo <acme@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa
	<jolsa@redhat.com>, Namhyung Kim <namhyung@kernel.org>, Masami Hiramatsu
	<mhiramat@kernel.org>, Sasha Levin <sashal@kernel.org>,
	<linux-kernel@vger.kernel.org>, <xen-devel@lists.xenproject.org>,
	<kvm@vger.kernel.org>
Subject: [PATCH 0/4] x86: decode Xen/KVM emulate prefixes
Date: Thu, 12 May 2022 13:56:47 +0000
Message-ID: <20220512135654.119791-1-mheyne@amazon.de>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Precedence: Bulk
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

This is a backport of a patch series for 5.4.x.

The patch series allows the x86 decoder to decode the Xen and KVM emulate
prefixes.

In particular this solves the following issue that appeared when commit
db6c6a0df840 ("objtool: Fix noreturn detection for ignored functions") was
backported to 5.4.69:

  arch/x86/xen/enlighten_pv.o: warning: objtool: xen_cpuid()+0x25: can't find jump dest instruction at .text+0x9c

Also now that this decoding is possible, also backport the commit which prevents
kprobes on probing such prefixed instructions. This was also part of the
original series.

The series applied mostly cleanly on 5.4.192 except for a contextual problem in
the 3rd patch ("x86: xen: insn: Decode Xen and KVM emulate-prefix signature").

Masami Hiramatsu (4):
  x86/asm: Allow to pass macros to __ASM_FORM()
  x86: xen: kvm: Gather the definition of emulate prefixes
  x86: xen: insn: Decode Xen and KVM emulate-prefix signature
  x86: kprobes: Prohibit probing on instruction which has emulate prefix

 arch/x86/include/asm/asm.h                  |  8 +++--
 arch/x86/include/asm/emulate_prefix.h       | 14 +++++++++
 arch/x86/include/asm/insn.h                 |  6 ++++
 arch/x86/include/asm/xen/interface.h        | 11 +++----
 arch/x86/kernel/kprobes/core.c              |  4 +++
 arch/x86/kvm/x86.c                          |  4 ++-
 arch/x86/lib/insn.c                         | 34 +++++++++++++++++++++
 tools/arch/x86/include/asm/emulate_prefix.h | 14 +++++++++
 tools/arch/x86/include/asm/insn.h           |  6 ++++
 tools/arch/x86/lib/insn.c                   | 34 +++++++++++++++++++++
 tools/objtool/sync-check.sh                 |  3 +-
 tools/perf/check-headers.sh                 |  3 +-
 12 files changed, 128 insertions(+), 13 deletions(-)
 create mode 100644 arch/x86/include/asm/emulate_prefix.h
 create mode 100644 tools/arch/x86/include/asm/emulate_prefix.h


base-commit: 1d72b776f6dc973211f5d153453cf8955fb3d70a
-- 
2.32.0




Amazon Development Center Germany GmbH
Krausenstr. 38
10117 Berlin
Geschaeftsfuehrung: Christian Schlaeger, Jonathan Weiss
Eingetragen am Amtsgericht Charlottenburg unter HRB 149173 B
Sitz: Berlin
Ust-ID: DE 289 237 879




