Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 025647C722B
	for <lists+xen-devel@lfdr.de>; Thu, 12 Oct 2023 18:13:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.615914.957462 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qqyIt-0003Hw-57; Thu, 12 Oct 2023 16:12:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 615914.957462; Thu, 12 Oct 2023 16:12:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qqyIt-0003BY-12; Thu, 12 Oct 2023 16:12:51 +0000
Received: by outflank-mailman (input) for mailman id 615914;
 Thu, 12 Oct 2023 16:12:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Qqh1=F2=gmail.com=ubizjak@srs-se1.protection.inumbo.net>)
 id 1qqyIs-00039J-0i
 for xen-devel@lists.xenproject.org; Thu, 12 Oct 2023 16:12:50 +0000
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [2a00:1450:4864:20::629])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2f5c8eee-691a-11ee-9b0e-b553b5be7939;
 Thu, 12 Oct 2023 18:12:48 +0200 (CEST)
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-9ad8a822508so192351966b.0
 for <xen-devel@lists.xenproject.org>; Thu, 12 Oct 2023 09:12:48 -0700 (PDT)
Received: from localhost.localdomain ([46.248.82.114])
 by smtp.gmail.com with ESMTPSA id
 ci24-20020a170906c35800b009a2235ed496sm11414461ejb.141.2023.10.12.09.12.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Oct 2023 09:12:47 -0700 (PDT)
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
X-Inumbo-ID: 2f5c8eee-691a-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697127167; x=1697731967; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=m324SzpB4tRrNifTcRyeznzQLigWiB6PcnuW2+zuICA=;
        b=NLxdhPFzKozxRqzCDwaBPDK5+ciYKuuU5fKrbY5WLqxhGLJ+M517ca1JaaVw/BoelN
         2RY4VibWkvkD5fRr03aEjFo7RzismvQDu1/aYA7+QQaOTKIx08PuLWHG4nj4kOdeB73T
         wMIwOvSqMNeuZBEk2EXbJyWRrNu+y2XtgvG7pXLUHmb1IphPUcHdu7yWYmcZVQa8UhF5
         aXHHR8yE8QhB/CdEsejgYefwZfLyvKzvLr40MJ3jBAEfYoBlLfBB2pb4evLTo4B1GE4V
         Z7M6Q1+IjzTWchZlI2zJ4+F1Z+0lXHpZB1voBQh14t8GR54NwWomNMfd7+fZzBYwv4Dk
         yDbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697127167; x=1697731967;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=m324SzpB4tRrNifTcRyeznzQLigWiB6PcnuW2+zuICA=;
        b=B9L8/g7Xhg3cCmRulQ4/uiqa11ZuB0BsSmnP3M7S0dIBfTCR9yQNwnmAyyvtXy2cC2
         Rcj3arDZrZyklWQyUQFERgyEPiKFTY9yOQ/BVx368Khgpfny67bPyhaNgA0dvrx6AOxy
         vpqLqOiZEo28UxlyhKoCDcXEd/XC9WJ5yrp54OcM86hPJ1MvQxUD9ocxSjpMhV8SQNpS
         PeQt7hQGiPO3/OiJTcQ24grCAP7zh3cykMzA3JIrDeib/4/R7pmeAPwz67jwixdBAxTw
         GZO/2z1dDxcB2fUQTVs8C3VS8ea5DAQZJCA7KZbGRUJhLZkRltd/hSDNjI3lmmJbu8m3
         mclw==
X-Gm-Message-State: AOJu0YwphKpq9gPJXw+DFSeykrL1kJjGqKEaejMZt84nT2TUKv10hgPe
	FvKenAsnmGPTtmrIgJvOXF8=
X-Google-Smtp-Source: AGHT+IG3OATQwvAdDylZaY+NQE8rIqD1qHAB+PgGQkf9k1iPsawqa69X3y4KQT9BWLEr8K6NDqfqoQ==
X-Received: by 2002:a17:906:290:b0:9b2:89eb:79b5 with SMTP id 16-20020a170906029000b009b289eb79b5mr24236684ejf.35.1697127167247;
        Thu, 12 Oct 2023 09:12:47 -0700 (PDT)
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
Subject: [PATCH 0/4]  [PATCH 0/4] Introduce %rip-relative addressing to PER_CPU_VAR macro
Date: Thu, 12 Oct 2023 18:10:35 +0200
Message-ID: <20231012161237.114733-1-ubizjak@gmail.com>
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
of the ongoing percpu work.

Cc: Juergen Gross <jgross@suse.com>
Cc: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Ingo Molnar <mingo@redhat.com>
Cc: Borislav Petkov <bp@alien8.de>
Cc: Dave Hansen <dave.hansen@linux.intel.com>
Cc: "H. Peter Anvin" <hpa@zytor.com>

Uros Bizjak (4):
  x86/percpu: Use explicit segment registers in lib/cmpxchg{8,16}b_emu.S
  x86/percpu: Correct PER_CPU_VAR usage to include symbol and its addend
  x86/percpu, xen: Correct PER_CPU_VAR usage to include symbol and its
    addend
  x86/percpu: Introduce %rip-relative addressing to PER_CPU_VAR macro

 arch/x86/entry/calling.h      |  2 +-
 arch/x86/entry/entry_32.S     |  2 +-
 arch/x86/entry/entry_64.S     |  2 +-
 arch/x86/include/asm/percpu.h |  6 ++++--
 arch/x86/kernel/head_64.S     |  2 +-
 arch/x86/lib/cmpxchg16b_emu.S | 12 ++++++------
 arch/x86/lib/cmpxchg8b_emu.S  | 30 +++++++++++++++++++++---------
 arch/x86/xen/xen-asm.S        | 10 +++++-----
 8 files changed, 40 insertions(+), 26 deletions(-)

-- 
2.41.0


