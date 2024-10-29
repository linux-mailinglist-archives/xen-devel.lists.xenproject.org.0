Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A2DE9B46D9
	for <lists+xen-devel@lfdr.de>; Tue, 29 Oct 2024 11:30:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.827207.1241752 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t5jU8-0006uw-Vq; Tue, 29 Oct 2024 10:30:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 827207.1241752; Tue, 29 Oct 2024 10:30:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t5jU8-0006tH-Sy; Tue, 29 Oct 2024 10:30:00 +0000
Received: by outflank-mailman (input) for mailman id 827207;
 Tue, 29 Oct 2024 10:29:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/WX/=RZ=cloud.com=frediano.ziglio@srs-se1.protection.inumbo.net>)
 id 1t5jU7-0006t0-MN
 for xen-devel@lists.xenproject.org; Tue, 29 Oct 2024 10:29:59 +0000
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [2a00:1450:4864:20::62b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bbedd7c9-95e0-11ef-99a3-01e77a169b0f;
 Tue, 29 Oct 2024 11:29:53 +0100 (CET)
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-a9a2cdc6f0cso709601066b.2
 for <xen-devel@lists.xenproject.org>; Tue, 29 Oct 2024 03:29:53 -0700 (PDT)
Received: from fziglio-desktop.. ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9b1dfbc7e8sm458495466b.31.2024.10.29.03.29.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Oct 2024 03:29:51 -0700 (PDT)
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
X-Inumbo-ID: bbedd7c9-95e0-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo2MmIiLCJoZWxvIjoibWFpbC1lajEteDYyYi5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6ImJiZWRkN2M5LTk1ZTAtMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMwMTk3NzkzLjE3ODU3Mywic2VuZGVyIjoiZnJlZGlhbm8uemlnbGlvQGNsb3VkLmNvbSIsInJlY2lwaWVudCI6Inhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZyJ9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1730197792; x=1730802592; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hS8svhkyol/S1baufHVWpKnQCinKqO3REziB/hW8L1k=;
        b=bY9+QFqZ1lx/Ko2D3g+gUdyL+3coc8ZMWdERW9okK3vDQa4lzUgJkmv/8z9KgukI1M
         x+3jmNI4IlF2aJxQ4hoaenMjy5JWicJlsSisP2qhxqtMk5Y1/++6JrR+Lx1cj/1R+6A/
         4/gcqiZ64FvHfvHPkoklUhbod3ob3akjvmuGY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730197792; x=1730802592;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hS8svhkyol/S1baufHVWpKnQCinKqO3REziB/hW8L1k=;
        b=i6XkMLJaBMXXzUIZz/YuFLeMFDxa/4jrtb2m0DYdzuZ0moPlAhGElQjn1Ku5XjSYCA
         z+L+ZZIJk1hKxNnGqHr/WbKlSsb+8AVH8dxjBGOyreIrZOP9k/sVsYiOInilJnDZ23eR
         OuW8jqSC4+VX1PoSRO90NnZfbLbpQzwTJgzvbO+SzNbgLTQ97mfb5SbZb3mOmPwTjPWg
         sBj/2URP0iT7vsuDicyzxWO7A0qw4A1nEP45lvuzsC5S1JfHgRjJMlW56M4qeoMPWF03
         MPgSzQhEFvkiSLnJcML+W+LjlGn3Q+DUmDY27e+bB790AEe8MPGjIVhNzdGRLnJvvaWK
         jJSw==
X-Gm-Message-State: AOJu0YzdykjYB82BZZLtRyD1oHz6gSqerB5vfR67+MjrXSZ4kMJSLxnw
	9/p4E8xrTy43Xg12+Xh9Ri379kSXYmmvh0RWmIjSmUnin1C7Ydf7y2it73rTOIiLRTp9ExtCtoe
	G
X-Google-Smtp-Source: AGHT+IG6JXUIUp9q740dSC51DhUmVkuxn7j/9gQQsQET5h6gepj8xqjZEQOgKb5PjQ/i4f0EtOhzew==
X-Received: by 2002:a17:907:728e:b0:a9a:4eac:a2a5 with SMTP id a640c23a62f3a-a9de619bb5bmr1014625566b.63.1730197792189;
        Tue, 29 Oct 2024 03:29:52 -0700 (PDT)
From: Frediano Ziglio <frediano.ziglio@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Frediano Ziglio <frediano.ziglio@cloud.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Subject: [PATCH v7 0/5] Reuse 32 bit C code more safely
Date: Tue, 29 Oct 2024 10:29:37 +0000
Message-Id: <20241029102942.162912-1-frediano.ziglio@cloud.com>
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

More details of the implementation are in commit message 1/5,
which is the largest patch.
Patch 2/5 reuses code to relocate the trampoline between 32 and 64 bit.
Patches 3/5 and 4/5 move some code from assembly to C.

Other RFC commits were excluded, I didn't manage to entangle the issues
sharing headers between 32 and 64 bits.
Since RFC code was more tested, also with CI and some incompatibility
were fixed. On that it's weird that we need Python 3.8 for Qemu but we
still use Python 2 for Xen. Shouldn't we bump requirement to Python 3
even for Xen?

Code boots successfully using:
- BIOS boot;
- EFI boot with Grub2 and ELF file;
- direct EFI boot without Grub.

Code is currently based on "master" branch, currently commit
fa1463cecf59d7419e4c83ed30360c4eb83bde41.

Changes since v1:
- 2 preliminary commits for adjust .gitignore;
- last commit split (one variable at a time);
- lot of style and names changes;
- first commit, now 3/6 had some build changes, more details on
  commit message.

Changes since v2:
- removed merged commits;
- reverted order of 2 commits;
- remove some useless casts;
- added change to comment.

Changes since v3:
- added a preparation commit for Makefiles (mainly written by Andrew Cooper);
- added a comment improvement commit;
- allows also data;
- other minor style changes;
- added some Reviewed-by.

Changes since v4:
- add build32.final.lds build32.other.lds to targets macro;
- place some comments over a rule, not inside;
- simplified linking and producing binary rule;
- renamed built_in_32 to built-in-32, coding style;
- fix minor indentation;
- put magic numbers in Makefile and propagate them;
- minor variable clanups in Python script;
- add dependency to Python script.

Changes since v5:
- all Makefile changes;
- renamed "other" and "final" phases to "base" and "offset";
- use if_changed macro to generate built-in-32.S;
- do not add obj64 to targets, already done adding it to obj-bin-y.

Changes since v6:
- lot of style and comments, see details on 1/5.

Frediano Ziglio (5):
  x86/boot: Rework how 32bit C is linked/included for early boot
  x86/boot: Reuse code to relocate trampoline
  x86/boot: Use boot_vid_info variable directly from C code
  x86/boot: Use trampoline_phys variable directly from C code
  x86/boot: Clarify comment

 xen/arch/x86/boot/.gitignore                  |   6 +-
 xen/arch/x86/boot/Makefile                    |  74 +++++-
 .../x86/boot/{build32.lds => build32.lds.S}   |  41 +++-
 xen/arch/x86/boot/cmdline.c                   |  12 -
 xen/arch/x86/boot/head.S                      |  49 +---
 xen/arch/x86/boot/reloc-trampoline.c          |  36 +++
 xen/arch/x86/boot/reloc.c                     |  35 +--
 xen/arch/x86/efi/efi-boot.h                   |  15 +-
 xen/tools/combine_two_binaries.py             | 220 ++++++++++++++++++
 9 files changed, 377 insertions(+), 111 deletions(-)
 rename xen/arch/x86/boot/{build32.lds => build32.lds.S} (60%)
 create mode 100644 xen/arch/x86/boot/reloc-trampoline.c
 create mode 100755 xen/tools/combine_two_binaries.py

-- 
2.34.1


