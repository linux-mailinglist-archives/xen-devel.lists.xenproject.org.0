Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B4BD9B28737
	for <lists+xen-devel@lfdr.de>; Fri, 15 Aug 2025 22:41:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1083883.1443318 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1un1Ep-0005G5-Ml; Fri, 15 Aug 2025 20:41:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1083883.1443318; Fri, 15 Aug 2025 20:41:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1un1Ep-0005EE-K0; Fri, 15 Aug 2025 20:41:23 +0000
Received: by outflank-mailman (input) for mailman id 1083883;
 Fri, 15 Aug 2025 20:41:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=oFbR=23=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1un1Eo-0005E7-0C
 for xen-devel@lists.xenproject.org; Fri, 15 Aug 2025 20:41:22 +0000
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [2a00:1450:4864:20::331])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 33771dd2-7a18-11f0-a328-13f23c93f187;
 Fri, 15 Aug 2025 22:41:21 +0200 (CEST)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-45a23def5f2so2948035e9.0
 for <xen-devel@lists.xenproject.org>; Fri, 15 Aug 2025 13:41:21 -0700 (PDT)
Received: from localhost.localdomain (host-195-149-20-212.as13285.net.
 [195.149.20.212]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3bb5d089e07sm3153924f8f.0.2025.08.15.13.41.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Aug 2025 13:41:19 -0700 (PDT)
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
X-Inumbo-ID: 33771dd2-7a18-11f0-a328-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1755290480; x=1755895280; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8yEpVab4fGkYl1BhvVp/pjwz3h/lJ6YiQVMI8fiwlKM=;
        b=i55apf/8QcMpJMJ3SV43JSj4wWyG0rufK7kxMrXZQAMF1FEOj9CJgXggq66jgSuWfX
         AZ8AkqAwAXZ1e2hvt9g9k7d7g9caG6NEHEhUgY05pDUuDkOXZ1jsBODNSOAFJVqxsiDV
         DSK3M49h8pz3ipnBkdH1mz4+AdoN6aj1xVAqc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755290480; x=1755895280;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8yEpVab4fGkYl1BhvVp/pjwz3h/lJ6YiQVMI8fiwlKM=;
        b=HK5UG7ZfU+M6Ke4FcLilDRHCuY9KxzGfJH4Qmh6wofrpj2VJu9eIya5j1U2YdG/l0F
         ELpCdbY85x9AGP3hh1B70bwcpk3f3aP4OLZlKPUh0ioTik7biuWsCz3Vt5AFRfa5xpK0
         6qp2Iy1RWd4xJEEaGN0EFZurj2kyLGWEPgC3G2ADqeoCL29RabJgzTq26y9GrN3k/Apr
         tBaPJlCAiqNSJ5wEEYOJXsAydgGFSpOaz6TAxbXZFG1Z7fi5mR9JeaLCYYorMCWwCEOB
         /LXB9S0XlK5vyLF+sbhV0M2JC2F1t25eo3WdfoVZACmg1KuITTpCRbAE3vDRPjXh5o8S
         DllA==
X-Gm-Message-State: AOJu0YwRWI8h8FvX8pp2VzDfpsJeCIGYkUh/XDzBv/RneIF3d5ZgfNyb
	tBGexksAOC4XKElxbVsT6u6y3OMuLyg7kczETbfK611K8VB4Uf0mMZz1HxsusoxrctG4KsGzAcm
	z5Pni
X-Gm-Gg: ASbGnctu3DQkF6FzJzptP6P7T+g7zocmyHEmyaFpGNLEAb0wCygUafg+fGrlqvklAUf
	EUj2i1wAIUvDLZ+GIx8TJqU07lgWfgBxrudK80O2WG3KLiA8zTTH1FTutJKBNJ8X2872uoD0gCZ
	PuP+zzgshbHTRGDoT6XhpfjAIHvkbmE9NyBRIn9sJ4nX19pBe6UaGJLXTpsXWbvYDCnCOqlWYHy
	b5tsMJf+o6SBzz1gSPeBxIFsXN7YTs7d7LfBRvWOIF5O+HWKAdIT6ZaL8UjhrFK52xxv0fUqsmo
	Tx3fhxb7x49rCuJPHAzk73sP6X7VY13UygyTjknUESdadlipBcdns+sMPao7dkPC929CAD+ivOi
	iILhS2fBQAS5epRKjDRU8xQ0boY8r3OGiz8G9RHeQlUOCY9WMIIS7jgssBtN852Lt0vr3mYEq/S
	xL
X-Google-Smtp-Source: AGHT+IGcSRXUq/l/xq9zlepAhbaICE0P8n4Z1iR9KbIAbLQVO9o9UlNfrxl3Keu+eRHJmrvZO0slZA==
X-Received: by 2002:a05:600c:b8d:b0:458:bd31:2c27 with SMTP id 5b1f17b1804b1-45a21848eb0mr22915175e9.23.1755290480092;
        Fri, 15 Aug 2025 13:41:20 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v2 00/16] x86/msr: Cleanup and FRED prep
Date: Fri, 15 Aug 2025 21:41:01 +0100
Message-Id: <20250815204117.3312742-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This started as the final couple of patches, and escalated...

Some has been posted before, two even back in 2018 (work literally done in
Nanjing airport leaving XenSummit, and there was an 8h delay).  The rest is
FRED prep work, targetted for 4.21.

https://gitlab.com/xen-project/hardware/xen-staging/-/pipelines/1986711791

Andrew Cooper (16):
  x86/msr: Implement rdmsr_safe() in C
  x86/msr: Rework rdmsr_safe() using asm goto()
  x86: Sort headers
  x86/msr: Split out guest-msr.h
  x86/msr: Split out fsgsbase.h
  x86/msr: Split out tsc.h
  x86/msr: Move msr_{split,fold}() into asm/cpu-user-regs.h
  x86: Clean up asm/time.h
  x86: Clean up asm/msr.h
  x86/svm: Rename variable in svm_msr_write_intercept()
  x86/msr: Change rdmsr() to have normal API
  x86/msr: Change wrmsr() to take a single parameter
  x86/msr: Use MSR_IMM when available
  x86/fsgsbase: Split out __{rd,wr}gskern() helpers
  x86/fsgsbase: Update fs/gs helpers to use wrmsrns()
  x86/fsgsbase: Improve code generation in read_registers()

 xen/arch/x86/acpi/cpufreq/acpi.c            |   7 +-
 xen/arch/x86/acpi/cpufreq/cpufreq.c         |   3 +
 xen/arch/x86/acpi/cpufreq/hwp.c             |  18 +-
 xen/arch/x86/acpi/cpufreq/powernow.c        |  12 +-
 xen/arch/x86/apic.c                         |   2 +-
 xen/arch/x86/cpu/amd.c                      |  33 +-
 xen/arch/x86/cpu/common.c                   |  27 +-
 xen/arch/x86/cpu/intel.c                    |  38 +-
 xen/arch/x86/cpu/mcheck/mce.h               |   3 +-
 xen/arch/x86/cpu/mcheck/mce_amd.c           |   2 +-
 xen/arch/x86/cpu/mcheck/mce_intel.c         |   6 +-
 xen/arch/x86/cpu/microcode/intel.c          |   4 +
 xen/arch/x86/cpuid.c                        |   1 +
 xen/arch/x86/debug.c                        |   2 +
 xen/arch/x86/domain.c                       |  16 +-
 xen/arch/x86/domctl.c                       |  45 +-
 xen/arch/x86/genapic/x2apic.c               |   5 +-
 xen/arch/x86/guest/hyperv/hyperv.c          |   1 +
 xen/arch/x86/hvm/hvm.c                      |  77 +--
 xen/arch/x86/hvm/ioreq.c                    |   3 +-
 xen/arch/x86/hvm/svm/svm.c                  |  31 +-
 xen/arch/x86/hvm/svm/vmcb.c                 |   5 +-
 xen/arch/x86/hvm/vmx/vmcs.c                 |  32 +-
 xen/arch/x86/hvm/vmx/vmx.c                  |  64 +--
 xen/arch/x86/hvm/vmx/vvmx.c                 |   8 +-
 xen/arch/x86/include/asm/alternative.h      |   7 +
 xen/arch/x86/include/asm/cpu-user-regs.h    |  11 +
 xen/arch/x86/include/asm/fsgsbase.h         | 112 +++++
 xen/arch/x86/include/asm/guest-msr.h        | 155 ++++++
 xen/arch/x86/include/asm/hvm/hvm.h          |   3 +-
 xen/arch/x86/include/asm/msr.h              | 502 +++++++-------------
 xen/arch/x86/include/asm/prot-key.h         |   6 +-
 xen/arch/x86/include/asm/time.h             |  13 +-
 xen/arch/x86/include/asm/tsc.h              |  46 ++
 xen/arch/x86/machine_kexec.c                |   1 +
 xen/arch/x86/msr.c                          |   9 +-
 xen/arch/x86/nmi.c                          |  18 +-
 xen/arch/x86/oprofile/op_model_athlon.c     |   2 +-
 xen/arch/x86/platform_hypercall.c           |   2 +-
 xen/arch/x86/psr.c                          |   2 +
 xen/arch/x86/pv/domain.c                    |   1 +
 xen/arch/x86/pv/emul-priv-op.c              |  22 +-
 xen/arch/x86/pv/emulate.h                   |   1 +
 xen/arch/x86/pv/misc-hypercalls.c           |   1 +
 xen/arch/x86/spec_ctrl.c                    |   2 +-
 xen/arch/x86/tboot.c                        |  16 +-
 xen/arch/x86/traps.c                        |  16 +-
 xen/arch/x86/tsx.c                          |  29 +-
 xen/arch/x86/x86_64/asm-offsets.c           |   1 +
 xen/arch/x86/x86_64/mmconfig-shared.c       |   2 +-
 xen/arch/x86/xstate.c                       |   5 +-
 xen/common/efi/runtime.c                    |   1 +
 xen/common/ubsan/ubsan.c                    |   2 +
 xen/drivers/acpi/apei/apei-base.c           |  15 +-
 xen/drivers/acpi/tables/tbfadt.c            |   2 +
 xen/drivers/acpi/utilities/utmisc.c         |   3 +
 xen/drivers/passthrough/vtd/iommu.c         |   2 +-
 xen/include/public/arch-x86/cpufeatureset.h |   1 +
 xen/lib/x86/private.h                       |   2 +-
 59 files changed, 846 insertions(+), 612 deletions(-)
 create mode 100644 xen/arch/x86/include/asm/fsgsbase.h
 create mode 100644 xen/arch/x86/include/asm/guest-msr.h
 create mode 100644 xen/arch/x86/include/asm/tsc.h

-- 
2.39.5


