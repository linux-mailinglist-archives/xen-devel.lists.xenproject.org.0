Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 20860521869
	for <lists+xen-devel@lfdr.de>; Tue, 10 May 2022 15:31:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.325623.548296 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1noPxt-000888-J2; Tue, 10 May 2022 13:31:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 325623.548296; Tue, 10 May 2022 13:31:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1noPxt-00085U-Fg; Tue, 10 May 2022 13:31:49 +0000
Received: by outflank-mailman (input) for mailman id 325623;
 Tue, 10 May 2022 13:31:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TIPV=VS=amazon.de=prvs=1222473b2=mheyne@srs-se1.protection.inumbo.net>)
 id 1noPxr-0007IC-Ip
 for xen-devel@lists.xenproject.org; Tue, 10 May 2022 13:31:47 +0000
Received: from smtp-fw-6002.amazon.com (smtp-fw-6002.amazon.com [52.95.49.90])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8953d80f-d065-11ec-8fc4-03012f2f19d4;
 Tue, 10 May 2022 15:31:46 +0200 (CEST)
Received: from iad12-co-svc-p1-lb1-vlan2.amazon.com (HELO
 email-inbound-relay-iad-1e-90d70b14.us-east-1.amazon.com) ([10.43.8.2])
 by smtp-border-fw-6002.iad6.amazon.com with ESMTP; 10 May 2022 13:31:31 +0000
Received: from EX13D08EUB003.ant.amazon.com
 (iad12-ws-svc-p26-lb9-vlan3.iad.amazon.com [10.40.163.38])
 by email-inbound-relay-iad-1e-90d70b14.us-east-1.amazon.com (Postfix) with
 ESMTPS id 14F59C08D3; Tue, 10 May 2022 13:31:23 +0000 (UTC)
Received: from EX13MTAUEA001.ant.amazon.com (10.43.61.82) by
 EX13D08EUB003.ant.amazon.com (10.43.166.117) with Microsoft SMTP Server (TLS)
 id 15.0.1497.32; Tue, 10 May 2022 13:31:03 +0000
Received: from dev-dsk-mheyne-1b-c1524648.eu-west-1.amazon.com (10.15.60.66)
 by mail-relay.amazon.com (10.43.61.243) with Microsoft SMTP Server id
 15.0.1497.32 via Frontend Transport; Tue, 10 May 2022 13:31:02 +0000
Received: by dev-dsk-mheyne-1b-c1524648.eu-west-1.amazon.com (Postfix,
 from userid 5466572)
 id 3590B41131; Tue, 10 May 2022 13:31:02 +0000 (UTC)
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
X-Inumbo-ID: 8953d80f-d065-11ec-8fc4-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.de; i=@amazon.de; q=dns/txt; s=amazon201209;
  t=1652189507; x=1683725507;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=ZcFtI8jvSLQdq7u3zXtig0/LPNcCJ80T1zsBtiZt0Y0=;
  b=lOiTCicUUZUUf+HCag81O0D02YFgU8DEUEpPd0EAWUa5A7RPHzV4BfT2
   qF37xbVu5LMuDvsFsvRHWuc7RUrIMDwYsPiBlTlCDPLsWZ1UQV4tsYB8z
   2aH5tzgVKFN9oqy3FtlQOcS0v2dHFC/UUlanBOflNJpFxtBMrN6l5WAqO
   o=;
X-IronPort-AV: E=Sophos;i="5.91,214,1647302400"; 
   d="scan'208";a="200152145"
From: Maximilian Heyne <mheyne@amazon.de>
To: 
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
Date: Tue, 10 May 2022 13:30:29 +0000
Message-ID: <20220510133036.46767-1-mheyne@amazon.de>
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




