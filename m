Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E779991537
	for <lists+xen-devel@lfdr.de>; Sat,  5 Oct 2024 10:03:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.810793.1223533 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1swzkY-0004lO-Ex; Sat, 05 Oct 2024 08:02:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 810793.1223533; Sat, 05 Oct 2024 08:02:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1swzkY-0004jb-Bl; Sat, 05 Oct 2024 08:02:50 +0000
Received: by outflank-mailman (input) for mailman id 810793;
 Sat, 05 Oct 2024 08:02:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+Cfp=RB=cloud.com=frediano.ziglio@srs-se1.protection.inumbo.net>)
 id 1swzkW-0004jU-5l
 for xen-devel@lists.xenproject.org; Sat, 05 Oct 2024 08:02:48 +0000
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [2a00:1450:4864:20::632])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 34d09608-82f0-11ef-99a2-01e77a169b0f;
 Sat, 05 Oct 2024 10:02:46 +0200 (CEST)
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-a93c1cc74fdso484341366b.3
 for <xen-devel@lists.xenproject.org>; Sat, 05 Oct 2024 01:02:46 -0700 (PDT)
Received: from fziglio-desktop.. ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9933db9c5bsm84152366b.162.2024.10.05.01.02.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 05 Oct 2024 01:02:44 -0700 (PDT)
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
X-Inumbo-ID: 34d09608-82f0-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1728115365; x=1728720165; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=DSOSkFDzcZVeK0xanaV/TWfr6wgMeDJVU7sjkkJBLCI=;
        b=RhpQRZQ6aVKO2lvMav6OZuSzKiKxvW5SG5F5bTcJ0CWFkh40HUr96iCdGVTPA3Z0PO
         r92HngNbcc7XTbQu2V5M9OwvMrFLx5kSl0VpfzNkViSb3FSz+xRj6TrTBVTOhvmgn114
         Bmy5elgq/1BMP5qP3wDgtStgDhshQFc4Dh6jk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728115365; x=1728720165;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DSOSkFDzcZVeK0xanaV/TWfr6wgMeDJVU7sjkkJBLCI=;
        b=nYynnyDBtXI7pmy9+ZYjozheXwynZrhzeueVytK389zE6LAmSr6+m4drifsus+I+19
         ft96HjUXCRBqddgTah19beg6aa/t4vFUDw4tbQEWSAwXEI2Ust4IGBA7nS9uYrjbZn4v
         gOgaudFvIVqZrJ8OpeG9wi1sDogXySZw/988m+juuyezyVaBptbOD/UDqCttuvAb6h4E
         cXBLJZxBM05wIuzhlbZAN7dyLbGe38diDJrdUNBRReH6dX9HuzKj1T8BwoTNWT5gF3r3
         8qjWP9ACCHBAaVfciBhB3qxohJ+JDTs8cHRB1cN4lZp9xPwRnr7KAH513wIer772lPrv
         TSCQ==
X-Gm-Message-State: AOJu0YygxbqgmGMXPokz/iTnYvIE0BEy6nSwm3kEvgNstRgthDyhZDtp
	B+tP85wkdQLohIoQtyvD931GwVuYB0PeoOPOcixz++4vV5vYDCu7Do5rqZf6TBHpLr1Zc0+sxe2
	b
X-Google-Smtp-Source: AGHT+IFBF06wYetgIb/JTVH0ZkrEvUcoroa1qpDzGu8T94L2bnAAyBhe6/C9X2lZjMSx0x5PMUFYgg==
X-Received: by 2002:a17:907:9281:b0:a90:c411:24e0 with SMTP id a640c23a62f3a-a991bd0bbf8mr528524066b.23.1728115365220;
        Sat, 05 Oct 2024 01:02:45 -0700 (PDT)
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
Subject: [PATCH 0/3] Reuse 32 bit C code more safely
Date: Sat,  5 Oct 2024 09:02:30 +0100
Message-Id: <20241005080233.1248850-1-frediano.ziglio@cloud.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

First version as no RFC.

This series attempt to:
- use more C code, that is replace some assembly code with C;
- avoid some code duplication between C and assembly;
- prevent some issues having relocations in C code.

The idea is extending the current C to binary code conversion
done for 32 bit C code called from head.S making sure relocations
are safe and allowing external symbols usage from C code.

Note that, as an addition, scripts generating code check for no
data to allow code and data separation.

More details of the implementation are in commit message 1/3,
which is the largest patch.
Patch 2/3 reuses code to relocate the trampoline between 32 and 64 bit.
Patch 3/3 moves some code from assembly to C.

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

Code is currently based on "staging" branch, currently commit
6b20755c24ccd69d2482b45dfb9193940cdc346e.

Frediano Ziglio (3):
  x86/boot: create a C bundle for 32 bit boot code and use it
  x86/boot: Reuse code to relocate trampoline
  x86/boot: Use boot_vid_info and trampoline_phys variables directly
    from C code

 .gitignore                                    |   5 +-
 xen/arch/x86/boot/Makefile                    |  38 +++-
 .../x86/boot/{build32.lds => build32.lds.S}   |  51 ++++-
 xen/arch/x86/boot/cmdline.c                   |  12 --
 xen/arch/x86/boot/head.S                      |  49 +----
 xen/arch/x86/boot/reloc-trampoline.c          |  30 +++
 xen/arch/x86/boot/reloc.c                     |  33 +--
 xen/arch/x86/efi/efi-boot.h                   |  15 +-
 xen/tools/combine_two_binaries                | 195 ++++++++++++++++++
 9 files changed, 314 insertions(+), 114 deletions(-)
 rename xen/arch/x86/boot/{build32.lds => build32.lds.S} (57%)
 create mode 100644 xen/arch/x86/boot/reloc-trampoline.c
 create mode 100755 xen/tools/combine_two_binaries

-- 
2.34.1


