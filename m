Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C3DBA42762
	for <lists+xen-devel@lfdr.de>; Mon, 24 Feb 2025 17:07:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.895263.1303858 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tmazD-0003rx-OR; Mon, 24 Feb 2025 16:07:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 895263.1303858; Mon, 24 Feb 2025 16:07:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tmazD-0003os-L8; Mon, 24 Feb 2025 16:07:15 +0000
Received: by outflank-mailman (input) for mailman id 895263;
 Mon, 24 Feb 2025 16:07:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=48j1=VP=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tmazB-0003oc-JR
 for xen-devel@lists.xenproject.org; Mon, 24 Feb 2025 16:07:13 +0000
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [2a00:1450:4864:20::32d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 68428f64-f2c9-11ef-9aae-95dc52dad729;
 Mon, 24 Feb 2025 17:07:12 +0100 (CET)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-43998deed24so43811935e9.2
 for <xen-devel@lists.xenproject.org>; Mon, 24 Feb 2025 08:07:12 -0800 (PST)
Received: from andrewcoop.eng.citrite.net (host-92-26-98-202.as13285.net.
 [92.26.98.202]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-439b02d6837sm109356675e9.13.2025.02.24.08.07.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Feb 2025 08:07:11 -0800 (PST)
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
X-Inumbo-ID: 68428f64-f2c9-11ef-9aae-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1740413231; x=1741018031; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=EcpIhIHKCIrpTwqtCwPu0fiKrCCeqwA5dji6sqDibh0=;
        b=oXdED/ql8Al/8X4jfRCq9m4UHKvXNbRLOGsdAyAVS8ExvggTLwtTDpH/O16hEiv7ye
         jDoLm4cfMGAZx2iPbSi1Nls6+d5zfKHPsziZRlgISw58eGw4xtGjk4VHY3mfOI+uZmGB
         LTFZKuc9vXJ9R8/oeMZX9VcjLaKcsMa5rqRbo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740413231; x=1741018031;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EcpIhIHKCIrpTwqtCwPu0fiKrCCeqwA5dji6sqDibh0=;
        b=DBoYE6ClaU/nouPrwFcaMmwiNAOXIA4qwnTQafSvn9tDcWswhcV3WQl/vADOslJObx
         b2Fj7wFNiPhyWZI3PevB5002kZN9QxB+HKVHlTcPhSyxyTiFOPptHrbA56gGUKMsGFir
         sq2C1tYQt1F2QRmeIe8TThXsfYEcO79Zzpqcy3Rw1vY0hRqkQCb0f65cYOzfXq2tOduG
         cLZ6f7izK8I46Ze55r7/PF2w0MCH/3P8Mq+NdEpoJR6NQ1U1P0J7IXqIkc/WeofSSaF0
         Qdf38nYQrK3eCTOO0S54JLTSCNh9LwZPWu0Ww0gVDPikawi84zDwCaWfPqhTDRaFlbK0
         gjNg==
X-Gm-Message-State: AOJu0Ywl6F5z1u64YfmM/pqq3XVPDTl9ytYr/0fspJ6tAVf2OWK2G3L/
	jqzQAbKlW4LMBAVOT8OZ1h+8l9Z571Yrr4WhWov2WiMsY1yyAibnlB7fZMUPtcsTGgsoXZepJIR
	l
X-Gm-Gg: ASbGncuU/x7yEeIA0fU+hRUgzarpE3czr7Qol10phURJLEbqh0L3Y3obAu/jyTzXGYg
	Dy1Z2ON4UY+sX0jIWHw5IjvvNmDMZai8dJfmPRZgOufCZRHrJJ6dLoqUGWzaCvy7BDH+v4NkQOL
	rwogqSXvoSrvKeSuRrwbb7YJDvimt5HoqKQoy2JY4+4rKKuVRw6JS6VHhJWFlJfmQkIrtRDZxZC
	HsVpxv/Ti+VQhpsP1d0IzpI69VRR0O4RYDlK3SF+RlknLtdwwVITmgNMDC1nQ9t8Up07HEHDt5B
	Eg9VOcd6444SyU275Me651o/HcSQc80rNrXKy/O5H9BdfxdrQMsOmSIiunuIF3DUlxOQYotw/Ar
	W09jKBw==
X-Google-Smtp-Source: AGHT+IGB2PPm3jbmoN4+9TyqP/ZjjyND4301n1J+egccwFKqSmjeQkMCFK/nc3oh+ZiMImZlTDaieg==
X-Received: by 2002:a05:600c:350a:b0:439:9b82:d6b2 with SMTP id 5b1f17b1804b1-439aeb34f86mr134142235e9.16.1740413231389;
        Mon, 24 Feb 2025 08:07:11 -0800 (PST)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH 0/8] x86/IDT: Generate the IDT at build time
Date: Mon, 24 Feb 2025 16:05:01 +0000
Message-Id: <20250224160509.1117847-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This is a chunk of the FRED work split out because it's pretty self contained.

It's mostly cleanup/refactoring, although patch

traps.c is already overly large and going to get larger with FRED, so I'm
splitting traps-init.c out of it, as the two have reasonably-different logic.
That's implemented in this series but not used in anger in this series.

Testing, including Eclair:

  https://gitlab.com/xen-project/people/andyhhp/xen/-/pipelines/1684170631
  https://cirrus-ci.com/build/6590097610506240

(Qubes ADL was offline at this time, but has passed on prior runs.  Also Zen3p
passing is good enough to prove the changes.)

Andrew Cooper (8):
  x86: Sort includes in various files
  x86/IDT: Collect IDT related content idt.h
  x86/IDT: Rename X86_NR_VECTORS to X86_IDT_VECTORS
  x86/IDT: Rename idt_table[] to bsp_idt[]
  x86/IDT: Make idt_tables[] be per_cpu(idt)
  x86/IDT: Generate bsp_idt[] at build time
  x86/IDT: Don't rewrite bsp_idt[] at boot time
  x86/traps: Convert pv_trap_init() to being an initcall

 xen/arch/x86/Makefile                   |   1 +
 xen/arch/x86/acpi/power.c               |  19 +--
 xen/arch/x86/cpu/common.c               |  23 ++--
 xen/arch/x86/crash.c                    |  41 +++---
 xen/arch/x86/domain.c                   |  87 ++++++------
 xen/arch/x86/hvm/svm/svm.c              |   5 +-
 xen/arch/x86/hvm/vlapic.c               |   4 +-
 xen/arch/x86/hvm/vmx/intr.c             |   4 +-
 xen/arch/x86/hvm/vmx/vmcs.c             |  30 +++--
 xen/arch/x86/hvm/vmx/vmx.c              |   6 +-
 xen/arch/x86/include/asm/desc.h         |  76 -----------
 xen/arch/x86/include/asm/gen-idt.h      | 121 +++++++++++++++++
 xen/arch/x86/include/asm/gen-idt.lds.h  |  27 ++++
 xen/arch/x86/include/asm/hvm/vmx/vmcs.h |   4 +-
 xen/arch/x86/include/asm/idt.h          | 109 +++++++++++++++
 xen/arch/x86/include/asm/irq.h          |   4 +-
 xen/arch/x86/include/asm/processor.h    |  37 ------
 xen/arch/x86/include/asm/pv/traps.h     |   4 -
 xen/arch/x86/include/asm/x86-defns.h    |   2 +-
 xen/arch/x86/io_apic.c                  |   2 +-
 xen/arch/x86/irq.c                      |  12 +-
 xen/arch/x86/machine_kexec.c            |  13 +-
 xen/arch/x86/mm.c                       |  58 ++++----
 xen/arch/x86/pv/callback.c              |   4 +-
 xen/arch/x86/pv/domain.c                |   4 +-
 xen/arch/x86/pv/traps.c                 |  19 +--
 xen/arch/x86/setup.c                    |  84 ++++++------
 xen/arch/x86/smpboot.c                  |  37 +++---
 xen/arch/x86/traps-init.c               |   7 +
 xen/arch/x86/traps.c                    | 169 +++++++-----------------
 xen/arch/x86/x86_64/entry.S             | 106 ++++++++-------
 xen/arch/x86/x86_64/traps.c             |  28 ++--
 xen/arch/x86/xen.lds.S                  |   2 +
 33 files changed, 625 insertions(+), 524 deletions(-)
 create mode 100644 xen/arch/x86/include/asm/gen-idt.h
 create mode 100644 xen/arch/x86/include/asm/gen-idt.lds.h
 create mode 100644 xen/arch/x86/include/asm/idt.h
 create mode 100644 xen/arch/x86/traps-init.c

-- 
2.39.5


