Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AC55E69F3D4
	for <lists+xen-devel@lfdr.de>; Wed, 22 Feb 2023 13:01:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.499396.770513 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pUnnV-0000IR-U0; Wed, 22 Feb 2023 12:00:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 499396.770513; Wed, 22 Feb 2023 12:00:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pUnnV-0000FL-RB; Wed, 22 Feb 2023 12:00:33 +0000
Received: by outflank-mailman (input) for mailman id 499396;
 Wed, 22 Feb 2023 12:00:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0Q6c=6S=gmail.com=burzalodowa@srs-se1.protection.inumbo.net>)
 id 1pUnnT-0000FF-Pt
 for xen-devel@lists.xenproject.org; Wed, 22 Feb 2023 12:00:31 +0000
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [2a00:1450:4864:20::52c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 809f8dbd-b2a8-11ed-a089-e9535cc0f9c3;
 Wed, 22 Feb 2023 13:00:30 +0100 (CET)
Received: by mail-ed1-x52c.google.com with SMTP id da10so30583596edb.3
 for <xen-devel@lists.xenproject.org>; Wed, 22 Feb 2023 04:00:30 -0800 (PST)
Received: from uni.router.wind (adsl-161.109.242.137.tellas.gr.
 [109.242.137.161]) by smtp.googlemail.com with ESMTPSA id
 br4-20020a170906d14400b008de729c8a03sm2133171ejb.38.2023.02.22.04.00.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Feb 2023 04:00:28 -0800 (PST)
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
X-Inumbo-ID: 809f8dbd-b2a8-11ed-a089-e9535cc0f9c3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vctN9byLZ3zzX+3VJyfxjohjvmSQiMhPGUBNk/doJeU=;
        b=IznCQCRCnR2fPm5jak0+CYdnx7/Rjl+M1r781niBYAoNyTus693IF9EGbpNEEu3j8k
         ooT2RPBZmUZ6kc7NEXAgG2KN9RwRcbKX6+FCqNpJLn7TQjTDBJwiCva0HLrq/pAW5fCh
         2Fh1OKGa114KgoMTsKiWCUSAefgo9cdP1yH694O+4Da85Qq+awGlloPMEepyD6goIsLv
         ii3ZjWqYPd+b+pyo8v7Uyiv3vASf3e1TVrO70Va/L3wlc9X6Z+h11sPiesP+66R14Y1i
         D72aEJIaIeRuI5WyiqtTBx1bWiiqF+XkY3Q4mhf0RMW/tPouJ8EujKFfz2jlKc87P6Pc
         E2lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vctN9byLZ3zzX+3VJyfxjohjvmSQiMhPGUBNk/doJeU=;
        b=SaePBZSsJDD/WteJtFcKieeMMXQKH5Obm4GhJAFkZDCDVa8IZzweEWYnF3OthVuD1W
         LDIAXoF7gycBwaKLd2xK44KLTsVLUTHK+ooqV5vDbX2OPdUcXEYrDERIoT0qBtZ82d0k
         J0jybsdCFjxJ4dnQfGAfSSWoQUIv4spDD60XcLaE48CpI/7S6XJsKRI717vxDelMxM8c
         VFcyuBD4OkYIich7ZcwdwfnggLPKN2bpR8DfHeoPhbz2frPgou7SEzxu2bG+Wb6gPF/g
         IkHbqdjaZNTp/0gjregwF29BPX1Gyff918dsEaV2HPQL/xNDgcq9sWeGvRY7O+lLta+N
         NWbA==
X-Gm-Message-State: AO0yUKXGZnGkLwgtyKDZKkZEqelRWtGm+Hpv851+aIHlYP5prDZcdHgV
	kCm1cfCaf4g3naeFAJXzy3mN89olpMU=
X-Google-Smtp-Source: AK7set9qw2grfl40dxYJZ/ez6sUwMy1z/NWiRVGdfxseW35rfGF/sZ9crOu1dVjFngdF4b08gssBRw==
X-Received: by 2002:a17:907:7817:b0:8b1:3a23:8ec7 with SMTP id la23-20020a170907781700b008b13a238ec7mr14234567ejc.43.1677067229419;
        Wed, 22 Feb 2023 04:00:29 -0800 (PST)
From: Xenia Ragiadakou <burzalodowa@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>,
	Jun Nakajima <jun.nakajima@intel.com>,
	Kevin Tian <kevin.tian@intel.com>
Subject: [PATCH v2 0/9] x86/hvm: {svm,vmx}.{c,h} cleanup
Date: Wed, 22 Feb 2023 14:00:14 +0200
Message-Id: <20230222120023.3004624-1-burzalodowa@gmail.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series attempts a cleanup of files {svm,vmx}.{c,h} by removing
redundant headers and sorting the rest, reducing the scope of declarations
and definitions, moving functions used only by internal {svm,vmx} code to
private headers.

This series aims to address the comments made on the first version.

Main changes from the v1 series:
  - split the changes into smaller reviewable patches
  - drop the huge code rearrangment done in vmx.c
  - instead of spreading arround the declarations in c files to hide them,
    use private headers

There are more detailed per-patch changesets.

Xenia Ragiadakou (9):
  x86/svm: remove unused forward declaration of struct vcpu from svm.h
  x86/svm: opencode SVM_PAUSE{FILTER,THRESH}_INIT
  x86/svm: move declarations used only by svm code from svm.h to private
    header
  x86/vmx: remove unused included headers from vmx.h
  x86/vmx: reduce scope of GAS_VMX_OP definition
  x86/vmx: move declations used only by vmx code from vmx.h to private
    header
  x86/vmx: remove unused included headers from vmx.c
  x86/vmx: declare nvmx_enqueue_n2_exceptions() static
  x86/vmx: move vmx_update_debug_state() in vmcs.c and declare it static

 xen/arch/x86/hvm/svm/nestedsvm.c       |   1 +
 xen/arch/x86/hvm/svm/svm.c             |   2 +
 xen/arch/x86/hvm/svm/svm.h             |  40 +++
 xen/arch/x86/hvm/svm/vmcb.c            |   4 +-
 xen/arch/x86/hvm/vmx/intr.c            |   2 +
 xen/arch/x86/hvm/vmx/realmode.c        |   2 +
 xen/arch/x86/hvm/vmx/vmcs.c            |  14 +
 xen/arch/x86/hvm/vmx/vmx.c             |  73 ++--
 xen/arch/x86/hvm/vmx/vmx.h             | 458 ++++++++++++++++++++++++
 xen/arch/x86/hvm/vmx/vvmx.c            |   2 +
 xen/arch/x86/include/asm/hvm/svm/svm.h |  33 --
 xen/arch/x86/include/asm/hvm/vmx/vmx.h | 468 +------------------------
 12 files changed, 564 insertions(+), 535 deletions(-)
 create mode 100644 xen/arch/x86/hvm/svm/svm.h
 create mode 100644 xen/arch/x86/hvm/vmx/vmx.h

-- 
2.37.2


