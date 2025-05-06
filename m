Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AD43DAABF12
	for <lists+xen-devel@lfdr.de>; Tue,  6 May 2025 11:20:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.976922.1364025 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uCETW-0002W3-Es; Tue, 06 May 2025 09:20:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 976922.1364025; Tue, 06 May 2025 09:20:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uCETW-0002Ti-CC; Tue, 06 May 2025 09:20:30 +0000
Received: by outflank-mailman (input) for mailman id 976922;
 Tue, 06 May 2025 09:20:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Rbpq=XW=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1uCETU-0002Tc-W4
 for xen-devel@lists.xenproject.org; Tue, 06 May 2025 09:20:29 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de
 [2a07:de40:b251:101:10:150:64:2])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 56e0d9f0-2a5b-11f0-9ffb-bf95429c2676;
 Tue, 06 May 2025 11:20:24 +0200 (CEST)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 3906C1F395;
 Tue,  6 May 2025 09:20:23 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 67499137CF;
 Tue,  6 May 2025 09:20:22 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id aNu9F1bUGWgBbAAAD6G6ig
 (envelope-from <jgross@suse.com>); Tue, 06 May 2025 09:20:22 +0000
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
X-Inumbo-ID: 56e0d9f0-2a5b-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1746523223; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=SOSwn+O7fzFgeK18tfEQyq0imvcETcUg8KBVasQSn4w=;
	b=kriZpqdhOLBPPcruOud6UNmVzlEUq2xRjIwz8bZZFAG+0IQ5YwsePmFs/IObVQ5uX+3Bte
	GWUV+IhgDAcRFRchqFV+riec8rrlg/N9toymI+5EMWGjsxZHeP5YYMLN1WlStdR21cnlWk
	LAaqaoRE1YHJp6Eh3MpIfn/2a8tqxB8=
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1746523223; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=SOSwn+O7fzFgeK18tfEQyq0imvcETcUg8KBVasQSn4w=;
	b=kriZpqdhOLBPPcruOud6UNmVzlEUq2xRjIwz8bZZFAG+0IQ5YwsePmFs/IObVQ5uX+3Bte
	GWUV+IhgDAcRFRchqFV+riec8rrlg/N9toymI+5EMWGjsxZHeP5YYMLN1WlStdR21cnlWk
	LAaqaoRE1YHJp6Eh3MpIfn/2a8tqxB8=
From: Juergen Gross <jgross@suse.com>
To: linux-kernel@vger.kernel.org,
	x86@kernel.org,
	linux-coco@lists.linux.dev,
	kvm@vger.kernel.org,
	linux-hyperv@vger.kernel.org,
	virtualization@lists.linux.dev
Cc: xin@zytor.com,
	Juergen Gross <jgross@suse.com>,
	"Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Sean Christopherson <seanjc@google.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	"K. Y. Srinivasan" <kys@microsoft.com>,
	Haiyang Zhang <haiyangz@microsoft.com>,
	Wei Liu <wei.liu@kernel.org>,
	Dexuan Cui <decui@microsoft.com>,
	Vitaly Kuznetsov <vkuznets@redhat.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	xen-devel@lists.xenproject.org,
	Ajay Kaher <ajay.kaher@broadcom.com>,
	Alexey Makhalov <alexey.amakhalov@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Subject: [PATCH 0/6] x86/msr: let paravirt inline rdmsr/wrmsr instructions
Date: Tue,  6 May 2025 11:20:09 +0200
Message-ID: <20250506092015.1849-1-jgross@suse.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[26];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	R_RATELIMIT(0.00)[to_ip_from(RLfdszjqhz8kzzb9uwpzdm8png)];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Score: -2.80
X-Spam-Flag: NO

When building a kernel with CONFIG_PARAVIRT_XXL the paravirt
infrastructure will always use functions for reading or writing MSRs,
even when running on bare metal.

Switch to inline RDMSR/WRMSR instructions in this case, reducing the
paravirt overhead.

In order to make this less intrusive, some further reorganization of
the MSR access helpers is done in the first 4 patches.

This series has been tested to work with Xen PV and on bare metal.

There has been another approach by Xin Li, which used dedicated #ifdef
and removing the MSR related paravirt hooks instead of just modifying
the paravirt code generation.

Please note that I haven't included the use of WRMSRNS or the
immediate forms of WRMSR and RDMSR, because I wanted to get some
feedback on my approach first. Enhancing paravirt for those cases
is not very complicated, as the main base is already prepared for
that enhancement.

This series is based on the x86/msr branch of the tip tree.

Juergen Gross (6):
  coco/tdx: Rename MSR access helpers
  x86/kvm: Rename the KVM private read_msr() function
  x86/msr: minimize usage of native_*() msr access functions
  x86/msr: Move MSR trace calls one function level up
  x86/paravirt: Switch MSR access pv_ops functions to instruction
    interfaces
  x86/msr: reduce number of low level MSR access helpers

 arch/x86/coco/tdx/tdx.c                   |   8 +-
 arch/x86/hyperv/ivm.c                     |   2 +-
 arch/x86/include/asm/kvm_host.h           |   2 +-
 arch/x86/include/asm/msr.h                | 116 ++++++++++-------
 arch/x86/include/asm/paravirt.h           | 152 ++++++++++++++--------
 arch/x86/include/asm/paravirt_types.h     |  13 +-
 arch/x86/include/asm/qspinlock_paravirt.h |   5 +-
 arch/x86/kernel/kvmclock.c                |   2 +-
 arch/x86/kernel/paravirt.c                |  26 +++-
 arch/x86/kvm/svm/svm.c                    |  16 +--
 arch/x86/kvm/vmx/vmx.c                    |   4 +-
 arch/x86/xen/enlighten_pv.c               |  60 ++++++---
 arch/x86/xen/pmu.c                        |   4 +-
 13 files changed, 262 insertions(+), 148 deletions(-)

-- 
2.43.0


