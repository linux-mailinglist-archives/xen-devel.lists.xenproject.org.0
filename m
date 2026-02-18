Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id FlvrB9R2lWl8RwIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 18 Feb 2026 09:22:44 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AD496153F78
	for <lists+xen-devel@lfdr.de>; Wed, 18 Feb 2026 09:22:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1235313.1538287 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vscob-0008VL-F9; Wed, 18 Feb 2026 08:21:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1235313.1538287; Wed, 18 Feb 2026 08:21:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vscob-0008TF-BN; Wed, 18 Feb 2026 08:21:45 +0000
Received: by outflank-mailman (input) for mailman id 1235313;
 Wed, 18 Feb 2026 08:21:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=RtAK=AW=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1vscoZ-0008T9-96
 for xen-devel@lists.xenproject.org; Wed, 18 Feb 2026 08:21:43 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d7de64d8-0ca2-11f1-9ccf-f158ae23cfc8;
 Wed, 18 Feb 2026 09:21:37 +0100 (CET)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 5925B3E6D0;
 Wed, 18 Feb 2026 08:21:36 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 893403EA65;
 Wed, 18 Feb 2026 08:21:35 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id HcFZII92lWkvHQAAD6G6ig
 (envelope-from <jgross@suse.com>); Wed, 18 Feb 2026 08:21:35 +0000
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
X-Inumbo-ID: d7de64d8-0ca2-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1771402896; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=OYoDmUH9lbkTBURMFRYZYYI6iouhuBtpfCapQgEqDZ8=;
	b=mumQ2dSroxqx6zt+Ap8HTM0DwIHDjYg5G2rkTfGqr0XF50J9oS7P1iax3mkDWYDGIX05mq
	VX/pMUcA0pFYr7ZTj5XfgBOOOEBabHE1Wg4S0+rOQYd/osFxFh8Tnl1dVhywbfaL5k3mSq
	YTambJKAYcAGVGpkGonRfwPP/SogtlM=
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1771402896; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=OYoDmUH9lbkTBURMFRYZYYI6iouhuBtpfCapQgEqDZ8=;
	b=mumQ2dSroxqx6zt+Ap8HTM0DwIHDjYg5G2rkTfGqr0XF50J9oS7P1iax3mkDWYDGIX05mq
	VX/pMUcA0pFYr7ZTj5XfgBOOOEBabHE1Wg4S0+rOQYd/osFxFh8Tnl1dVhywbfaL5k3mSq
	YTambJKAYcAGVGpkGonRfwPP/SogtlM=
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
Subject: [PATCH v3 00/16] x86/msr: Inline rdmsr/wrmsr instructions
Date: Wed, 18 Feb 2026 09:21:17 +0100
Message-ID: <20260218082133.400602-1-jgross@suse.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Flag: NO
X-Spam-Score: -1.30
X-Spam-Level: 
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.81 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=susede1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[jgross@suse.com,xen-devel-bounces@lists.xenproject.org];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[36];
	FORGED_RECIPIENTS(0.00)[m:linux-kernel@vger.kernel.org,m:x86@kernel.org,m:linux-coco@lists.linux.dev,m:kvm@vger.kernel.org,m:linux-hyperv@vger.kernel.org,m:virtualization@lists.linux.dev,m:llvm@lists.linux.dev,m:jgross@suse.com,m:tglx@kernel.org,m:mingo@redhat.com,m:bp@alien8.de,m:dave.hansen@linux.intel.com,m:hpa@zytor.com,m:kas@kernel.org,m:rick.p.edgecombe@intel.com,m:seanjc@google.com,m:pbonzini@redhat.com,m:kys@microsoft.com,m:haiyangz@microsoft.com,m:wei.liu@kernel.org,m:decui@microsoft.com,m:longli@microsoft.com,m:vkuznets@redhat.com,m:boris.ostrovsky@oracle.com,m:xen-devel@lists.xenproject.org,m:ajay.kaher@broadcom.com,m:alexey.makhalov@broadcom.com,m:bcm-kernel-feedback-list@broadcom.com,m:luto@kernel.org,m:peterz@infradead.org,m:xin@zytor.com,m:nathan@kernel.org,m:nick.desaulniers+lkml@gmail.com,m:morbo@google.com,m:justinstitt@google.com,m:jpoimboe@kernel.org,m:nickdesaulniers@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	FREEMAIL_CC(0.00)[suse.com,kernel.org,redhat.com,alien8.de,linux.intel.com,zytor.com,intel.com,google.com,microsoft.com,oracle.com,lists.xenproject.org,broadcom.com,infradead.org,gmail.com];
	DKIM_TRACE(0.00)[suse.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jgross@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel,lkml];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Queue-Id: AD496153F78
X-Rspamd-Action: no action

When building a kernel with CONFIG_PARAVIRT_XXL the paravirt
infrastructure will always use functions for reading or writing MSRs,
even when running on bare metal.

Switch to inline RDMSR/WRMSR instructions in this case, reducing the
paravirt overhead.

The first patch is a prerequisite fix for alternative patching. Its
is needed due to the initial indirect call needs to be padded with
NOPs in some cases with the following patches.

In order to make this less intrusive, some further reorganization of
the MSR access helpers is done in the patches 1-6.

The next 4 patches are converting the non-paravirt case to use direct
inlining of the MSR access instructions, including the WRMSRNS
instruction and the immediate variants of RDMSR and WRMSR if possible.

Patches 11-13 are some further preparations for making the real switch
to directly patch in the native MSR instructions easier.

Patch 14 is switching the paravirt MSR function interface from normal
call ABI to one more similar to the native MSR instructions.

Patch 15 is a little cleanup patch.

Patch 16 is the final step for patching in the native MSR instructions
when not running as a Xen PV guest.

This series has been tested to work with Xen PV and on bare metal.

Note that there is more room for improvement. This series is sent out
to get a first impression how the code will basically look like.

Right now the same problem is solved differently for the paravirt and
the non-paravirt cases. In case this is not desired, there are two
possibilities to merge the two implementations. Both solutions have
the common idea to have rather similar code for paravirt and
non-paravirt variants, but just use a different main macro for
generating the respective code. For making the code of both possible
scenarios more similar, the following variants are possible:

1. Remove the micro-optimizations of the non-paravirt case, making
   it similar to the paravirt code in my series. This has the
   advantage of being more simple, but might have a very small
   negative performance impact (probably not really detectable).

2. Add the same micro-optimizations to the paravirt case, requiring
   to enhance paravirt patching to support a to be patched indirect
   call in the middle of the initial code snipplet.

In both cases the native MSR function variants would no longer be
usable in the paravirt case, but this would mostly affect Xen, as it
would need to open code the WRMSR/RDMSR instructions to be used
instead the native_*msr*() functions.

Changes since V2:
- switch back to the paravirt approach

Changes since V1:
- Use Xin Li's approach for inlining
- Several new patches

Juergen Gross (16):
  x86/alternative: Support alt_replace_call() with instructions after
    call
  coco/tdx: Rename MSR access helpers
  x86/sev: Replace call of native_wrmsr() with native_wrmsrq()
  KVM: x86: Remove the KVM private read_msr() function
  x86/msr: Minimize usage of native_*() msr access functions
  x86/msr: Move MSR trace calls one function level up
  x86/opcode: Add immediate form MSR instructions
  x86/extable: Add support for immediate form MSR instructions
  x86/msr: Use the alternatives mechanism for WRMSR
  x86/msr: Use the alternatives mechanism for RDMSR
  x86/alternatives: Add ALTERNATIVE_4()
  x86/paravirt: Split off MSR related hooks into new header
  x86/paravirt: Prepare support of MSR instruction interfaces
  x86/paravirt: Switch MSR access pv_ops functions to instruction
    interfaces
  x86/msr: Reduce number of low level MSR access helpers
  x86/paravirt: Use alternatives for MSR access with paravirt

 arch/x86/coco/sev/internal.h              |   7 +-
 arch/x86/coco/tdx/tdx.c                   |   8 +-
 arch/x86/hyperv/ivm.c                     |   2 +-
 arch/x86/include/asm/alternative.h        |   6 +
 arch/x86/include/asm/fred.h               |   2 +-
 arch/x86/include/asm/kvm_host.h           |  10 -
 arch/x86/include/asm/msr.h                | 345 ++++++++++++++++------
 arch/x86/include/asm/paravirt-msr.h       | 148 ++++++++++
 arch/x86/include/asm/paravirt.h           |  67 -----
 arch/x86/include/asm/paravirt_types.h     |  57 ++--
 arch/x86/include/asm/qspinlock_paravirt.h |   4 +-
 arch/x86/kernel/alternative.c             |   5 +-
 arch/x86/kernel/cpu/mshyperv.c            |   7 +-
 arch/x86/kernel/kvmclock.c                |   2 +-
 arch/x86/kernel/paravirt.c                |  42 ++-
 arch/x86/kvm/svm/svm.c                    |  16 +-
 arch/x86/kvm/vmx/tdx.c                    |   2 +-
 arch/x86/kvm/vmx/vmx.c                    |   8 +-
 arch/x86/lib/x86-opcode-map.txt           |   5 +-
 arch/x86/mm/extable.c                     |  35 ++-
 arch/x86/xen/enlighten_pv.c               |  52 +++-
 arch/x86/xen/pmu.c                        |   4 +-
 tools/arch/x86/lib/x86-opcode-map.txt     |   5 +-
 tools/objtool/check.c                     |   1 +
 24 files changed, 576 insertions(+), 264 deletions(-)
 create mode 100644 arch/x86/include/asm/paravirt-msr.h

-- 
2.53.0


