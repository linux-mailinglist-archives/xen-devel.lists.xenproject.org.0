Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 92D9B999F56
	for <lists+xen-devel@lfdr.de>; Fri, 11 Oct 2024 10:53:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.816775.1230885 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1szBON-0001ro-BB; Fri, 11 Oct 2024 08:52:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 816775.1230885; Fri, 11 Oct 2024 08:52:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1szBON-0001pv-6Y; Fri, 11 Oct 2024 08:52:59 +0000
Received: by outflank-mailman (input) for mailman id 816775;
 Fri, 11 Oct 2024 08:52:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rkux=RH=cloud.com=frediano.ziglio@srs-se1.protection.inumbo.net>)
 id 1szBOL-0001pc-OX
 for xen-devel@lists.xenproject.org; Fri, 11 Oct 2024 08:52:57 +0000
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [2a00:1450:4864:20::629])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 35500ee4-87ae-11ef-a0bd-8be0dac302b0;
 Fri, 11 Oct 2024 10:52:56 +0200 (CEST)
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-a99650da839so305799566b.2
 for <xen-devel@lists.xenproject.org>; Fri, 11 Oct 2024 01:52:56 -0700 (PDT)
Received: from fziglio-desktop.. ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a99a80dc290sm186131566b.155.2024.10.11.01.52.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Oct 2024 01:52:55 -0700 (PDT)
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
X-Inumbo-ID: 35500ee4-87ae-11ef-a0bd-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1728636775; x=1729241575; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=HJ+Hmzgm6Lu80wn8lj9wtFnGHhFIb7PPFMsadOvdVTk=;
        b=jJtTjvB2ob4eVCaxtmxVDuFPYETGe3Db6HL6MZPohnFmyOkXFLApeFzbMUUe7iiyRT
         MSrjOdDIz5cjqE2aEkCU2zL8OimPRbb4psnHgu2vEcx3qRc1QXjDZd5Y3CcXMgy/A9Np
         CVHD6oU6uVH7JRnpD54UAdjJJzh+bbasGe0xE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728636775; x=1729241575;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HJ+Hmzgm6Lu80wn8lj9wtFnGHhFIb7PPFMsadOvdVTk=;
        b=VWK3hrbQ/Yl+24+51f/rZqL+mcqibdyHyUm8oANsW7+oJqUFyU1ekw+Fgr/JkDBPZL
         yXWUTVvChU54n8DuK4pkGmxL2MKh1MYvBuxR76/phjkUkMQTbXZ2kgQ85H0NrgTygkvR
         R7TXjf0VRaF+PlqbQ2ysXCCpOEfK5jofF8Lqcwuv5NESZ617+ai3W9DGoYreWe6qMn0x
         1CXYs+qltxixX2vXbo25zeh3PQ/OvbjB/Rd+Z7vQ670jZFgT5nBpfhUX9bNPxI5E/K98
         AOTE/IqCAeM/zPm7ugo24Uf0abN19bJFAgis5T5WUawPgF2Nnddy4k/wT8w9Ac1SPVGh
         FMTg==
X-Gm-Message-State: AOJu0Yx8fOytBnTVk50DD5r0RRJSM0YgTrRAGKxIEkgUz1yiyRebOVXq
	Yt/+nbQdgQMAhGD5wfzxAoiS1/hIaEZoS1WfRx4td5co8p7jQVnVAQQ9l3wccQAFfrqa733b58O
	5
X-Google-Smtp-Source: AGHT+IGF4Bdjn9hWz8gtAdNBGAAzJvSr8/9SPH0DdES5OYVsaub5Wcy30spNuQ7iQpYu8uWlBfpwRQ==
X-Received: by 2002:a17:907:d2d4:b0:a99:76bc:d753 with SMTP id a640c23a62f3a-a99b958318amr161187366b.45.1728636775369;
        Fri, 11 Oct 2024 01:52:55 -0700 (PDT)
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
Subject: [PATCH v3 0/5] Reuse 32 bit C code more safely
Date: Fri, 11 Oct 2024 09:52:39 +0100
Message-Id: <20241011085244.432368-1-frediano.ziglio@cloud.com>
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
2b49ef4503e2c549c166f439cf0dd331d9a8874c.

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

Frediano Ziglio (5):
  x86/boot: create a C bundle for 32 bit boot code and use it
  x86/boot: Reuse code to relocate trampoline
  x86/boot: Use boot_vid_info variable directly from C code
  x86/boot: Use trampoline_phys variable directly from C code
  x86/boot: Clarify comment

 xen/arch/x86/boot/.gitignore                  |   5 +-
 xen/arch/x86/boot/Makefile                    |  62 ++++--
 .../x86/boot/{build32.lds => build32.lds.S}   |  49 ++++-
 xen/arch/x86/boot/cmdline.c                   |  12 --
 xen/arch/x86/boot/head.S                      |  49 +----
 xen/arch/x86/boot/reloc-trampoline.c          |  36 ++++
 xen/arch/x86/boot/reloc.c                     |  35 +---
 xen/arch/x86/efi/efi-boot.h                   |  15 +-
 xen/tools/combine_two_binaries                | 198 ++++++++++++++++++
 9 files changed, 344 insertions(+), 117 deletions(-)
 rename xen/arch/x86/boot/{build32.lds => build32.lds.S} (57%)
 create mode 100644 xen/arch/x86/boot/reloc-trampoline.c
 create mode 100755 xen/tools/combine_two_binaries

-- 
2.34.1


