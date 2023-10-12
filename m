Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C74417C77C3
	for <lists+xen-devel@lfdr.de>; Thu, 12 Oct 2023 22:18:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.616001.957646 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qr286-00068d-0G; Thu, 12 Oct 2023 20:17:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 616001.957646; Thu, 12 Oct 2023 20:17:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qr285-00065h-Sn; Thu, 12 Oct 2023 20:17:57 +0000
Received: by outflank-mailman (input) for mailman id 616001;
 Thu, 12 Oct 2023 20:17:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Qqh1=F2=gmail.com=ubizjak@srs-se1.protection.inumbo.net>)
 id 1qr284-00065W-9G
 for xen-devel@lists.xenproject.org; Thu, 12 Oct 2023 20:17:56 +0000
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [2a00:1450:4864:20::62c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6d80738e-693c-11ee-98d4-6d05b1d4d9a1;
 Thu, 12 Oct 2023 22:17:55 +0200 (CEST)
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-9936b3d0286so230652866b.0
 for <xen-devel@lists.xenproject.org>; Thu, 12 Oct 2023 13:17:55 -0700 (PDT)
Received: from localhost.localdomain ([46.248.82.114])
 by smtp.gmail.com with ESMTPSA id
 i3-20020a1709064ec300b00997d7aa59fasm11692552ejv.14.2023.10.12.13.17.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Oct 2023 13:17:54 -0700 (PDT)
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
X-Inumbo-ID: 6d80738e-693c-11ee-98d4-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697141875; x=1697746675; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WEFicMsW4s3skYy4mNr+LHCDs51WUiGt3MBVpKqJRSI=;
        b=J8unfYQ81dUQvqq9Fn2m++xjFelS3IwDbLDZ4qjrb0ss9KCn7bqWU0x6Tog5o4Ltya
         hAevEPswrUCFgsXLcnAprS38leDEPC4P/rEFDWmkWNkcSFbu/hcyRhIUGdqRIGe4MmeQ
         uiw9lRuZlcKq+w54jCKtBvh5u9umKJ3eskoV6pQ27xTF2LtgJI09fCRC9elOkXsly695
         PRWWEABCVJZbKN14BEEHW7W+gI3Ry5B4bVR9qFYf3wZ3yp2so7eWCAsmJdwOcUAszukA
         vm77XVhccuCFtIyk2mBV6LZS6PqJI+2az4GR/d6HYJSUXL/J+9ZAqJ36NiXUnZRxLxIc
         641A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697141875; x=1697746675;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WEFicMsW4s3skYy4mNr+LHCDs51WUiGt3MBVpKqJRSI=;
        b=aRIaTx069VUuJWQx0bj5a0fZhyJQOprd84QQqQ2CmAkWjzpCG40N4DTTAQtUKDTPb1
         D9jUFuFh3mi4dZD0SghoI5ugD8rJ5QO0eAFPm2GShmM7hOqkyB8LJGdL1fwG7qKRXgVa
         Nn5r5T2yMKDaECFVukkOKUY2RM3rbsh9u8G7FMVoxbwclzHdTh5U/p5Xb5xov6hP4wqT
         8xXcptOOqgTq1WiuPRbxTU8vI8M71HDj1dBFg81VrNJNn25YZGLAtLrQvtUA0G7Qmud4
         SWpEfRZ9ZVMocRGTanEI8/nL6H0SlF/TGE6sejWfmo9sgSTNc0bX7vFD2qsseN693d1i
         A88A==
X-Gm-Message-State: AOJu0Yzwzj7XWF+1h0QuPWQh2RBBHUZjcFb3j9JStsdlc0rYTKxf4DDe
	ld450dzcmgkZnZNjL/dine0=
X-Google-Smtp-Source: AGHT+IHCzOG5Qj1uWOXe+fHsuoCjTwSpfunPEUadKxQrsehhq/m4xv7XrF8ve3tA1LAlh7XjukB2Ww==
X-Received: by 2002:a17:906:73db:b0:9ae:6a9b:274e with SMTP id n27-20020a17090673db00b009ae6a9b274emr24705973ejl.8.1697141874375;
        Thu, 12 Oct 2023 13:17:54 -0700 (PDT)
From: Uros Bizjak <ubizjak@gmail.com>
To: x86@kernel.org,
	xen-devel@lists.xenproject.org,
	linux-kernel@vger.kernel.org
Cc: Uros Bizjak <ubizjak@gmail.com>,
	Juergen Gross <jgross@suse.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>
Subject: [PATCH v2 0/4]  Introduce %rip-relative addressing to PER_CPU_VAR macro
Date: Thu, 12 Oct 2023 22:12:03 +0200
Message-ID: <20231012201743.292149-1-ubizjak@gmail.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following patch series introduces %rip-relative addressing to
PER_CPU_VAR macro. Instruction with %rip-relative address operand is
one byte shorter than its absolute address counterpart and is also
compatible with position independent executable (-fpie) build.

The first three patches are cleanups that fix various inconsistencies
throughout the assembly code.

The last patch introduces (%rip) suffix and uses it for x86_64 target,
resulting in a small code size decrease:

   text    data     bss     dec     hex filename
25510677        4386685  808388 30705750        1d48856 vmlinux-new.o
25510629        4386685  808388 30705702        1d48826 vmlinux-old.o

Patch series is against current mainline and can be applied independently
of ongoing percpu work.

v2: Introduce PER_CPU_ARG macro to conditionally enable
    segment registers in cmpxchg{8,16}b_emu.S for CONFIG_SMP.

Cc: Juergen Gross <jgross@suse.com>
Cc: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Ingo Molnar <mingo@redhat.com>
Cc: Borislav Petkov <bp@alien8.de>
Cc: Dave Hansen <dave.hansen@linux.intel.com>
Cc: "H. Peter Anvin" <hpa@zytor.com>

Uros Bizjak (4):
  x86/percpu: Introduce PER_CPU_ARG and use it in cmpxchg{8,16}b_emu.S
  x86/percpu: Correct PER_CPU_VAR usage to include symbol and its addend
  x86/percpu, xen: Correct PER_CPU_VAR usage to include symbol and its
    addend
  x86/percpu: Introduce %rip-relative addressing to PER_CPU_VAR macro

 arch/x86/entry/calling.h      |  2 +-
 arch/x86/entry/entry_32.S     |  2 +-
 arch/x86/entry/entry_64.S     |  2 +-
 arch/x86/include/asm/percpu.h | 10 +++++++---
 arch/x86/kernel/head_64.S     |  2 +-
 arch/x86/lib/cmpxchg16b_emu.S | 12 ++++++------
 arch/x86/lib/cmpxchg8b_emu.S  | 24 ++++++++++++++++++------
 arch/x86/xen/xen-asm.S        | 10 +++++-----
 8 files changed, 40 insertions(+), 24 deletions(-)

-- 
2.41.0


