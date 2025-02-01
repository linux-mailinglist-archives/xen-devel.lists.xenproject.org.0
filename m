Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B6297A24686
	for <lists+xen-devel@lfdr.de>; Sat,  1 Feb 2025 03:18:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.880050.1290208 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1te34e-0002kc-R9; Sat, 01 Feb 2025 02:17:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 880050.1290208; Sat, 01 Feb 2025 02:17:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1te34e-0002ip-KX; Sat, 01 Feb 2025 02:17:32 +0000
Received: by outflank-mailman (input) for mailman id 880050;
 Sat, 01 Feb 2025 02:17:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=b9ke=UY=flex--seanjc.bounces.google.com=3N4SdZwYKCfgxjfsohlttlqj.htr2js-ij0jqqnxyx.2jsuwtojhy.twl@srs-se1.protection.inumbo.net>)
 id 1te34d-0002if-Bh
 for xen-devel@lists.xenproject.org; Sat, 01 Feb 2025 02:17:31 +0000
Received: from mail-pj1-x104a.google.com (mail-pj1-x104a.google.com
 [2607:f8b0:4864:20::104a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id af157f97-e042-11ef-99a4-01e77a169b0f;
 Sat, 01 Feb 2025 03:17:29 +0100 (CET)
Received: by mail-pj1-x104a.google.com with SMTP id
 98e67ed59e1d1-2ee5616e986so7262646a91.2
 for <xen-devel@lists.xenproject.org>; Fri, 31 Jan 2025 18:17:29 -0800 (PST)
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
X-Inumbo-ID: af157f97-e042-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738376247; x=1738981047; darn=lists.xenproject.org;
        h=cc:to:from:subject:message-id:mime-version:date:reply-to:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Cq2j2i7xKbEmxmaKlx5ycVjsc6NUu7PBqfSVX6ZfTN4=;
        b=AmgjInzCZTtMueEhKHRv1q62pJoxPdl0j8Q/whlqtunqzZ3+aRBLzPjuCrEnLmqspI
         JTa/7MXb7ICCzZoBpF1CumNUBLcmyg+hf1+2FIxoP29bsF7qstTyK59WVliHRJS1RFpw
         9tuAD1oAl0YfUZHMwGgEuTf+p+Or4uiLLMG0uNADXH1dRTP9J4zD/Onfzbp7knKN553P
         3+zvS2i0k0jYip1be7m2rzvC6oTjoJBsZLVlyjQW4KG2pZdblqQJOFa6FgA+AEJz3DgR
         yMXea+Zjo1sYahVemQJTJd+mHcnRXZe3sTU/VIbruXySLQVmQnlLpiV5cikv3Y806rqk
         omkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738376247; x=1738981047;
        h=cc:to:from:subject:message-id:mime-version:date:reply-to
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Cq2j2i7xKbEmxmaKlx5ycVjsc6NUu7PBqfSVX6ZfTN4=;
        b=khG5ftdGd9tMSwmc8JtkS9bPLC8Udv5ZA+48dwn3Kc+joqngUOAquRzkUcqFrYR5zS
         MHcfcovccwn/n9LvEmFNRZOUNVpimLRYkaDfyXqqBgRUXjj5jHKTnL5WkxFdK/U78Pnn
         mHGfGwgUGPBycy+Xibp/JEMWDtUSdAuVVi+SCTGR1U4JJwkxzMntAZX/BEYaaBuPl9Be
         unZO9zRleyeh5rYCJPrun6zBQpeyXm3wVQra9hH5dMRNwLwQRzpGMWxXmtHorcH8m9Eo
         57+SIkld9HbIaWzDzRQQMvphsOojL8EKwbbuUY/yfBI6Bv422iZ2VHbCFNUNh9j13ad8
         LBTw==
X-Forwarded-Encrypted: i=1; AJvYcCXyN0NaJEIgCpU17JRBcGJZ1BOkoj9lowGwUpEUr6YYJkz6+aDnibHvG2VDx7UUmeiSNIi349RP5Ao=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyaUCC9NH3/p7ip3AjgyDlnf1NAY6DRq7VYCsNBlWkfi9bWrCop
	tEARnHajj0iFDXbsueToJ99utOLXTJWQZhTCZZAti5btbNUT2TmXpQ0N8lqpV4JWdLVkfEApZcV
	MwQ==
X-Google-Smtp-Source: AGHT+IEXms2W7h6OPbgfhbPe+T0bjO3rPyG4kBeOBL1XLya2FJ/dryX9qDtrHv/AVlJBJdJ2J5PBFLJRbi4=
X-Received: from pjbsw11.prod.google.com ([2002:a17:90b:2c8b:b0:2ef:a732:f48d])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:258c:b0:2ee:f687:6acb
 with SMTP id 98e67ed59e1d1-2f83abd9998mr19471173a91.13.1738376247517; Fri, 31
 Jan 2025 18:17:27 -0800 (PST)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Fri, 31 Jan 2025 18:17:02 -0800
Mime-Version: 1.0
X-Mailer: git-send-email 2.48.1.362.g079036d154-goog
Message-ID: <20250201021718.699411-1-seanjc@google.com>
Subject: [PATCH 00/16] x86/tsc: Try to wrangle PV clocks vs. TSC
From: Sean Christopherson <seanjc@google.com>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, Juergen Gross <jgross@suse.com>, 
	"K. Y. Srinivasan" <kys@microsoft.com>, Haiyang Zhang <haiyangz@microsoft.com>, Wei Liu <wei.liu@kernel.org>, 
	Dexuan Cui <decui@microsoft.com>, Ajay Kaher <ajay.kaher@broadcom.com>, 
	Alexey Makhalov <alexey.amakhalov@broadcom.com>, Jan Kiszka <jan.kiszka@siemens.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, Andy Lutomirski <luto@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>
Cc: linux-kernel@vger.kernel.org, linux-coco@lists.linux.dev, 
	virtualization@lists.linux.dev, linux-hyperv@vger.kernel.org, 
	jailhouse-dev@googlegroups.com, kvm@vger.kernel.org, 
	xen-devel@lists.xenproject.org, Sean Christopherson <seanjc@google.com>, 
	Nikunj A Dadhania <nikunj@amd.com>, Tom Lendacky <thomas.lendacky@amd.com>
Content-Type: text/plain; charset="UTF-8"

Attempt to bring some amount of order to the PV clocks vs. TSC madness in
the kernel.  The primary goal of this series is to fix flaws with SNP
and TDX guests where a PV clock provided by the untrusted hypervisor is
used instead of the secure/trusted TSC that is controlled by trusted
firmware.

The secondary goal (last few patches) is to draft off of the SNP and TDX
changes to slightly modernize running under KVM.  Currently, KVM guests
will use TSC for clocksource, but not sched_clock.  And they ignore Intel's
CPUID-based TSC and CPU frequency enumeration, even when using the TSC
instead of kvmclock.  And if the host provides the core crystal frequency
in CPUID.0x15, then KVM guests can use that for the APIC timer period
instead of manually calibrating the frequency.

Lots more background: https://lore.kernel.org/all/20250106124633.1418972-13-nikunj@amd.com

This is all *very* lightly tested (borderline RFC).

Sean Christopherson (16):
  x86/tsc: Add a standalone helpers for getting TSC info from CPUID.0x15
  x86/tsc: Add standalone helper for getting CPU frequency from CPUID
  x86/tsc: Add helper to register CPU and TSC freq calibration routines
  x86/sev: Mark TSC as reliable when configuring Secure TSC
  x86/sev: Move check for SNP Secure TSC support to tsc_early_init()
  x86/tdx: Override PV calibration routines with CPUID-based calibration
  x86/acrn: Mark TSC frequency as known when using ACRN for calibration
  x86/tsc: Pass KNOWN_FREQ and RELIABLE as params to registration
  x86/tsc: Rejects attempts to override TSC calibration with lesser
    routine
  x86/paravirt: Move handling of unstable PV clocks into
    paravirt_set_sched_clock()
  x86/paravirt: Don't use a PV sched_clock in CoCo guests with trusted
    TSC
  x86/kvmclock: Mark TSC as reliable when it's constant and nonstop
  x86/kvmclock: Get CPU base frequency from CPUID when it's available
  x86/kvmclock: Get TSC frequency from CPUID when its available
  x86/kvmclock: Stuff local APIC bus period when core crystal freq comes
    from CPUID
  x86/kvmclock: Use TSC for sched_clock if it's constant and non-stop

 arch/x86/coco/sev/core.c        |  9 ++--
 arch/x86/coco/tdx/tdx.c         | 27 ++++++++--
 arch/x86/include/asm/paravirt.h |  7 ++-
 arch/x86/include/asm/tdx.h      |  2 +
 arch/x86/include/asm/tsc.h      | 67 +++++++++++++++++++++++++
 arch/x86/kernel/cpu/acrn.c      |  5 +-
 arch/x86/kernel/cpu/mshyperv.c  | 11 +++--
 arch/x86/kernel/cpu/vmware.c    |  9 ++--
 arch/x86/kernel/jailhouse.c     |  6 +--
 arch/x86/kernel/kvmclock.c      | 88 +++++++++++++++++++++++----------
 arch/x86/kernel/paravirt.c      | 15 +++++-
 arch/x86/kernel/tsc.c           | 74 ++++++++++++++++-----------
 arch/x86/mm/mem_encrypt_amd.c   |  3 --
 arch/x86/xen/time.c             |  4 +-
 14 files changed, 243 insertions(+), 84 deletions(-)


base-commit: ebbb8be421eefbe2d47b99c2e1a6dd840d7930f9
-- 
2.48.1.362.g079036d154-goog


