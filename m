Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 483CE992E9C
	for <lists+xen-devel@lfdr.de>; Mon,  7 Oct 2024 16:16:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.812032.1224693 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sxoWm-00039i-1C; Mon, 07 Oct 2024 14:16:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 812032.1224693; Mon, 07 Oct 2024 14:16:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sxoWl-00037M-UL; Mon, 07 Oct 2024 14:15:59 +0000
Received: by outflank-mailman (input) for mailman id 812032;
 Mon, 07 Oct 2024 14:15:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aWQm=RD=cloud.com=frediano.ziglio@srs-se1.protection.inumbo.net>)
 id 1sxoWl-0002dC-Bi
 for xen-devel@lists.xenproject.org; Mon, 07 Oct 2024 14:15:59 +0000
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [2a00:1450:4864:20::532])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ac0e4b21-84b6-11ef-99a2-01e77a169b0f;
 Mon, 07 Oct 2024 16:15:57 +0200 (CEST)
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-5c903f5bd0eso489154a12.3
 for <xen-devel@lists.xenproject.org>; Mon, 07 Oct 2024 07:15:57 -0700 (PDT)
Received: from fziglio-desktop.. ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c8e05c119esm3386204a12.55.2024.10.07.07.15.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Oct 2024 07:15:56 -0700 (PDT)
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
X-Inumbo-ID: ac0e4b21-84b6-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1728310557; x=1728915357; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3VCbuxC6JGJm8j1BwRkys9Y1PD6avfaNtISsr+2/hAU=;
        b=RQdXaZSfXU7maCCuR3W2wES031/535CsK1DGGSrXixDdvztAYdUkA6UF+aEOYiNcYO
         EPblOtpH46NnI7htm4GCgE4GZRHcKugiCuuMPwhQe23dGDUxXQePHS35zTZXctxEqf+h
         9dVXkOnYj4VOH6LwQtR3733Gqk7kp/RDWlRro=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728310557; x=1728915357;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3VCbuxC6JGJm8j1BwRkys9Y1PD6avfaNtISsr+2/hAU=;
        b=ZMbj3kAaoBq0EreWSF3R85EjfkaaRzPIY4GE+s0lc/2Z9NSu6KLDWRAECHMmQbHDyZ
         0bFFkLgg7e6PF2bstMqOJreuf1LmR3c6XBwPRhPtIR5Ryfvc86HmBN4uHO3mGX8rFldH
         RH9eWKh1ysocj/6VrCaxPg7spy2/orLwlYV3MgEFv3nboRZXiRQs/OeqhfVgKKPZyZI5
         ww4xGClJkrVhwAGx4ZQ8GIGMgZc3wtFpQYM1dDU5wdK8oueCIVgqDWID2J8Ijd55zWRg
         lUNB5l/N8lSi0e9RA0mZJMV7Opsqrahy0RI5r099gomXSy+lFgYbcvBTz/xM+jdbjqIl
         B/0w==
X-Gm-Message-State: AOJu0Yzso9ocM9zVCtAgMfSnhY34ohyMJR0WzVrOCLDNJ6QLkDE2wyxt
	zc9H4qoYP4AOzevbLExN7zFVFFsN6jwNue1FC6F8ZaL1jwo6OcXR2p/9jirtndJFJT0S1o4NIkp
	Y
X-Google-Smtp-Source: AGHT+IGUmKrNBklvvNLErYZY3uJFOI579Vy2t8yLFBBWim+kwzXsY857xkGf5BHjOp+A9Az492dKJg==
X-Received: by 2002:a05:6402:40cf:b0:5c2:4cbe:ac1c with SMTP id 4fb4d7f45d1cf-5c8d2d00f16mr10677343a12.4.1728310556988;
        Mon, 07 Oct 2024 07:15:56 -0700 (PDT)
From: Frediano Ziglio <frediano.ziglio@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Frediano Ziglio <frediano.ziglio@cloud.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Subject: [PATCH v2 0/6] Reuse 32 bit C code more safely
Date: Mon,  7 Oct 2024 15:15:33 +0100
Message-Id: <20241007141539.1899350-1-frediano.ziglio@cloud.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series attempt to:
- use more C code, that is replace some assembly code with C;
- avoid some code duplication between C and assembly;
- prevent some issues having relocations in C code.

The idea is extending the current C to binary code conversion
done for 32 bit C code called from head.S making sure relocations
are safe and allowing external symbols usage from C code.

Note that, as an addition, scripts generating code check for no
data to allow code and data separation.

More details of the implementation are in commit message 3/6,
which is the largest patch.
Patch 4/6 reuses code to relocate the trampoline between 32 and 64 bit.
Patches 5/6 and 6/6 move some code from assembly to C.

Other RFC commits were excluded, I didn't manage to entangle the issues
sharing headers between 32 and 64 bits.
Since RFC code was more tested, also with CI and some incompatibility
were fixed. On that it's weird that we need Python 3.8 for Qemu but we
still use Python 2 for Xen. Shouldn't we bump requirement to Python 3
even for Xen?

Code boot successfully using:
- BIOS boot;
- EFI boot with Grub2 and ELF file;
- direct EFI boot without Grub.

Code is currently based on "master" branch, currently commit
6b20755c24ccd69d2482b45dfb9193940cdc346e.

Changes since v1:
- 2 preliminary commits for adjust .gitignore;
- last commit split (one variable at a time);
- lot of style and names changes;
- first commit, now 3/6 had some build changes, more details on
  commit message.

Frediano Ziglio (6):
  .gitignore: Remove not generated files
  x86/boot: Rationalise .gitignore
  x86/boot: create a C bundle for 32 bit boot code and use it
  x86/boot: Reuse code to relocate trampoline
  x86/boot: Use trampoline_phys variable directly from C code
  x86/boot: Use boot_vid_info variable directly from C code

 .gitignore                                    |   5 -
 xen/arch/x86/boot/.gitignore                  |   4 +
 xen/arch/x86/boot/Makefile                    |  62 ++++--
 .../x86/boot/{build32.lds => build32.lds.S}   |  49 ++++-
 xen/arch/x86/boot/cmdline.c                   |  12 --
 xen/arch/x86/boot/head.S                      |  49 +----
 xen/arch/x86/boot/reloc-trampoline.c          |  36 ++++
 xen/arch/x86/boot/reloc.c                     |  33 +--
 xen/arch/x86/efi/efi-boot.h                   |  15 +-
 xen/tools/combine_two_binaries                | 198 ++++++++++++++++++
 10 files changed, 344 insertions(+), 119 deletions(-)
 create mode 100644 xen/arch/x86/boot/.gitignore
 rename xen/arch/x86/boot/{build32.lds => build32.lds.S} (57%)
 create mode 100644 xen/arch/x86/boot/reloc-trampoline.c
 create mode 100755 xen/tools/combine_two_binaries

-- 
2.34.1


