Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id +LVVBP8WQmoY0AkAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 29 Jun 2026 08:55:59 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CDF86D69CE
	for <lists+xen-devel@lfdr.de>; Mon, 29 Jun 2026 08:55:58 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=suse.com header.s=susede1 header.b="Z+D/qS+Y";
	dkim=pass header.d=suse.com header.s=susede1 header.b="Z+D/qS+Y";
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=quarantine) header.from=suse.com
Received: from list by lists.xenproject.org with outflank-mailman.1347171.1605044 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1we5uI-0004qf-BE; Mon, 29 Jun 2026 06:55:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1347171.1605044; Mon, 29 Jun 2026 06:55:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1we5uI-0004oC-7y; Mon, 29 Jun 2026 06:55:50 +0000
Received: by outflank-mailman (input) for mailman id 1347171;
 Mon, 29 Jun 2026 06:55:49 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jgross@suse.com>) id 1we5uH-0004o6-5E
 for xen-devel@lists.xenproject.org; Mon, 29 Jun 2026 06:55:49 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1we5uF-00BYOP-Ua
 for xen-devel@lists.xenproject.org; Mon, 29 Jun 2026 08:55:47 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jgross@suse.com>)
 id 6a4216dc-5cb7-0a2a0a5109dd-0a2a4501ea40-44
 for <xen-devel@lists.xenproject.org>; Mon, 29 Jun 2026 08:55:47 +0200
Received: from [195.135.223.131] (helo=smtp-out2.suse.de)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jgross@suse.com>)
 id 6a4216f3-400f-0a2a45010019-c387df838446-3
 for <xen-devel@lists.xenproject.org>; Mon, 29 Jun 2026 08:55:47 +0200
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 05C8275D0F;
 Mon, 29 Jun 2026 06:55:47 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 0BA25779A8;
 Mon, 29 Jun 2026 06:55:46 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id 7iBnAfIWQmqKQQAAD6G6ig
 (envelope-from <jgross@suse.com>); Mon, 29 Jun 2026 06:55:46 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1782716147; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=BAupgZB0PJ1OqcpHo6tTgs6hcfKTzlVTTaz41IYB01Q=;
	b=Z+D/qS+Yw2rCgWCjViQmH/IbgyCidWrcLjn6j4Eqnyex37TFnfj3QGPpcG+MRBnSU+4eVT
	5buEr7Harwt4J/6W9JFtSA4Yti0vaAZtta9ceDeQic88uFsvFZedKIT2XDw1bz08qreUrL
	CLvALcSjtYTyU1YoVkY7rXgrRLpOboQ=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1782716147; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=BAupgZB0PJ1OqcpHo6tTgs6hcfKTzlVTTaz41IYB01Q=;
	b=Z+D/qS+Yw2rCgWCjViQmH/IbgyCidWrcLjn6j4Eqnyex37TFnfj3QGPpcG+MRBnSU+4eVT
	5buEr7Harwt4J/6W9JFtSA4Yti0vaAZtta9ceDeQic88uFsvFZedKIT2XDw1bz08qreUrL
	CLvALcSjtYTyU1YoVkY7rXgrRLpOboQ=
From: Juergen Gross <jgross@suse.com>
To: linux-kernel@vger.kernel.org,
	x86@kernel.org,
	linux-coco@lists.linux.dev,
	kvm@vger.kernel.org,
	linux-hyperv@vger.kernel.org,
	virtualization@lists.linux.dev,
	llvm@lists.linux.dev
Cc: Juergen Gross <jgross@suse.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Kiryl Shutsemau <kas@kernel.org>,
	Rick Edgecombe <rick.p.edgecombe@intel.com>,
	Sean Christopherson <seanjc@google.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	"K. Y. Srinivasan" <kys@microsoft.com>,
	Haiyang Zhang <haiyangz@microsoft.com>,
	Wei Liu <wei.liu@kernel.org>,
	Dexuan Cui <decui@microsoft.com>,
	Long Li <longli@microsoft.com>,
	Vitaly Kuznetsov <vkuznets@redhat.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	xen-devel@lists.xenproject.org,
	Ajay Kaher <ajay.kaher@broadcom.com>,
	Alexey Makhalov <alexey.makhalov@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Andy Lutomirski <luto@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Xin Li <xin@zytor.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Josh Poimboeuf <jpoimboe@kernel.org>
Subject: [PATCH v4 00/18] x86/msr: Inline rdmsr/wrmsr instructions
Date: Mon, 29 Jun 2026 08:55:26 +0200
Message-ID: <20260629065544.3643253-1-jgross@suse.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Flag: NO
X-Spam-Score: -1.30
X-Spam-Level: 
X-purgate-ID: tlsNG-d62444/1782716147-83CCE1E0-7FB0D8F3/0/0
X-purgate-type: clean
X-purgate-size: 4243
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.81 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[suse.com:s=susede1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER(0.00)[jgross@suse.com,xen-devel-bounces@lists.xenproject.org];
	RCPT_COUNT_TWELVE(0.00)[36];
	FREEMAIL_CC(0.00)[suse.com,kernel.org,redhat.com,alien8.de,linux.intel.com,zytor.com,intel.com,google.com,microsoft.com,oracle.com,lists.xenproject.org,broadcom.com,infradead.org,gmail.com];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	ARC_NA(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:linux-kernel@vger.kernel.org,m:x86@kernel.org,m:linux-coco@lists.linux.dev,m:kvm@vger.kernel.org,m:linux-hyperv@vger.kernel.org,m:virtualization@lists.linux.dev,m:llvm@lists.linux.dev,m:jgross@suse.com,m:tglx@kernel.org,m:mingo@redhat.com,m:bp@alien8.de,m:dave.hansen@linux.intel.com,m:hpa@zytor.com,m:kas@kernel.org,m:rick.p.edgecombe@intel.com,m:seanjc@google.com,m:pbonzini@redhat.com,m:kys@microsoft.com,m:haiyangz@microsoft.com,m:wei.liu@kernel.org,m:decui@microsoft.com,m:longli@microsoft.com,m:vkuznets@redhat.com,m:boris.ostrovsky@oracle.com,m:xen-devel@lists.xenproject.org,m:ajay.kaher@broadcom.com,m:alexey.makhalov@broadcom.com,m:bcm-kernel-feedback-list@broadcom.com,m:luto@kernel.org,m:peterz@infradead.org,m:xin@zytor.com,m:nathan@kernel.org,m:nick.desaulniers+lkml@gmail.com,m:morbo@google.com,m:justinstitt@google.com,m:jpoimboe@kernel.org,m:nickdesaulniers@gmail.com,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:mid,suse.com:from_mime];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jgross@suse.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[suse.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel,lkml];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[11]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 6CDF86D69CE

When building a kernel with CONFIG_PARAVIRT_XXL the paravirt
infrastructure will always use functions for reading or writing MSRs,
even when running on bare metal.

Switch to inline RDMSR/WRMSR instructions in this case, reducing the
paravirt overhead.

The first patch is a prerequisite fix for alternative patching. Its
is needed due to the initial indirect call needs to be padded with
NOPs in some cases with the following patches.

In order to make this less intrusive, some further reorganization of
the MSR access helpers is done in the patches 2-6.

The next 5 patches are converting the non-paravirt case to use direct
inlining of the MSR access instructions, including the WRMSRNS
instruction and the immediate variants of RDMSR and WRMSR if possible.

Patches 12-14 are some further preparations for making the real switch
to directly patch in the native MSR instructions easier.

Patch 15 is switching the paravirt MSR function interface from normal
call ABI to one more similar to the native MSR instructions.

Patch 16 is a little cleanup patch.

Patch 17 is the final step for patching in the native MSR instructions
when not running as a Xen PV guest.

Patch 18 converts the rest of the MSR helpers to __always_inline.

This series has been tested to work with Xen PV and on bare metal.

Based on [1] and [2].

Changes since V3:
- Rebase
- wrmsrns() related changes (patches 9+10)

Changes since V2:
- switch back to the paravirt approach

Changes since V1:
- Use Xin Li's approach for inlining
- Several new patches

[1]: https://lore.kernel.org/lkml/20260629060526.3638272-1-jgross@suse.com/T/#t
[2]: https://lore.kernel.org/lkml/20260629063943.3641266-1-jgross@suse.com/T/#t

Juergen Gross (18):
  x86/alternative: Support alt_replace_call() with instructions after
    call
  coco/tdx: Rename MSR access helpers
  KVM: x86: Remove the KVM private read_msr() function
  x86/msr: Minimize usage of native_*() msr access functions
  x86/msr: Move MSR trace calls one function level up
  x86/hyperv: Switch from __rdmsr() to native_rdmsrq()
  x86/opcode: Add immediate form MSR instructions
  x86/extable: Add support for immediate form MSR instructions
  x86/msr: Make wrmsrns() a first class citizen
  x86/msr: Introduce sync_cpu_after_wrmsrns()
  x86/msr: Use the alternatives mechanism for RDMSR
  x86/alternatives: Add ALTERNATIVE_4()
  x86/paravirt: Split off MSR related hooks into new header
  x86/paravirt: Prepare support of MSR instruction interfaces
  x86/paravirt: Switch MSR access pv_ops functions to instruction
    interfaces
  x86/msr: Reduce number of low level MSR access helpers
  x86/paravirt: Use alternatives for MSR access with paravirt
  x86/msr: Make all MSR access functions __always_inline

 arch/x86/coco/tdx/tdx.c                   |   8 +-
 arch/x86/hyperv/hv_crash.c                |   6 +-
 arch/x86/hyperv/ivm.c                     |   2 +-
 arch/x86/include/asm/alternative.h        |   6 +
 arch/x86/include/asm/fred.h               |   2 +-
 arch/x86/include/asm/kvm_host.h           |   7 -
 arch/x86/include/asm/msr.h                | 340 +++++++++++++++++-----
 arch/x86/include/asm/paravirt-msr.h       | 180 ++++++++++++
 arch/x86/include/asm/paravirt.h           |  45 ---
 arch/x86/include/asm/paravirt_types.h     |  57 ++--
 arch/x86/include/asm/qspinlock_paravirt.h |   4 +-
 arch/x86/kernel/alternative.c             |   5 +-
 arch/x86/kernel/cpu/mshyperv.c            |   4 +-
 arch/x86/kernel/kvmclock.c                |   2 +-
 arch/x86/kernel/paravirt.c                |  42 ++-
 arch/x86/kvm/svm/svm.c                    |  16 +-
 arch/x86/kvm/vmx/tdx.c                    |   2 +-
 arch/x86/kvm/vmx/vmx.c                    |   6 +-
 arch/x86/lib/x86-opcode-map.txt           |   5 +-
 arch/x86/mm/extable.c                     |  46 ++-
 arch/x86/xen/enlighten_pv.c               |  52 +++-
 arch/x86/xen/pmu.c                        |   4 +-
 tools/arch/x86/lib/x86-opcode-map.txt     |   5 +-
 tools/objtool/check.c                     |   1 +
 24 files changed, 641 insertions(+), 206 deletions(-)
 create mode 100644 arch/x86/include/asm/paravirt-msr.h

-- 
2.54.0


