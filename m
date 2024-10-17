Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 069449A23D4
	for <lists+xen-devel@lfdr.de>; Thu, 17 Oct 2024 15:31:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.820589.1234109 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t1QbJ-0007BE-AF; Thu, 17 Oct 2024 13:31:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 820589.1234109; Thu, 17 Oct 2024 13:31:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t1QbJ-00079j-6O; Thu, 17 Oct 2024 13:31:37 +0000
Received: by outflank-mailman (input) for mailman id 820589;
 Thu, 17 Oct 2024 13:31:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZcP3=RN=cloud.com=frediano.ziglio@srs-se1.protection.inumbo.net>)
 id 1t1QbH-00079Y-Ir
 for xen-devel@lists.xenproject.org; Thu, 17 Oct 2024 13:31:35 +0000
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [2a00:1450:4864:20::631])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 20be2bbc-8c8c-11ef-a0be-8be0dac302b0;
 Thu, 17 Oct 2024 15:31:34 +0200 (CEST)
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-a9a0ec0a94fso107849366b.1
 for <xen-devel@lists.xenproject.org>; Thu, 17 Oct 2024 06:31:34 -0700 (PDT)
Received: from fziglio-desktop.. ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9a29817036sm299115166b.124.2024.10.17.06.31.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Oct 2024 06:31:33 -0700 (PDT)
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
X-Inumbo-ID: 20be2bbc-8c8c-11ef-a0be-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1729171894; x=1729776694; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=SP6seo58K4cH9wg+ocd7+U6wN3oOt+d1Z2RdEKLkXDs=;
        b=SfsW/BhVcaIjubR2D4NQEfCun7weFKhg+Oc7ELPK9d0y63wkR/8Wz0p9RTXsttqhZT
         wbbORCcoeVlHnnQASE4eyHUFR8O/OgJAnkGeoXHOS/NbJVSEZdHjQPYjbENkQ0zJE5mz
         3LdLxyNg6duAIfXOTArioSwzZErzqhNjzhYS0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729171894; x=1729776694;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SP6seo58K4cH9wg+ocd7+U6wN3oOt+d1Z2RdEKLkXDs=;
        b=bMicwqWzMoNYlTk/FkztXuCzt6aG3brGMRXrlJbQ/A8EeAHpjr32nhElIib23w/vvo
         QJJO5W1AITxbIv/b36H2O5mUJ9VeiLAIn1BooajhYKqhGEi+GeVHvl9jTB5hHIfpFEmv
         45Rcg3niIy0t7o06SKAJEC0rYDRa2D29qJorl/h6Haz2bznsBDYrumu3ZTnY0vVimtxg
         0R4v679JxcLw85F8fgFYjerz8wF6Ta8hTh6oUdj3F/UdBi6BnPbqp17qH3Ld6eKHjTKP
         hGps7/hHh1PSLQk2Q7q3ZyOjNiZ8QNaNdogrtka9GZemPeL5MkLFWp3BUnnqhDsNZUs3
         sBpw==
X-Gm-Message-State: AOJu0YygI9ITYrQGN6kCjZE1Q9HlzaIAJufhgkWinrZCol3ZF2nBUYO3
	gNovgMWMy80+ZAI26EU10ZwWK32LvHqHnmIoFpQy79WIgAjzHZ6ns6vX4ibbN/TRMCJrtRNSkdh
	j
X-Google-Smtp-Source: AGHT+IF4lJImkM6oBHMVbUFsEFD3MuknR5bb55goIWcdD92rIhqDNn0MthS99UDP6IYwoJTNyOjrtw==
X-Received: by 2002:a17:907:e2cd:b0:a9a:c0b:d21c with SMTP id a640c23a62f3a-a9a34cb7ef2mr612849066b.18.1729171893568;
        Thu, 17 Oct 2024 06:31:33 -0700 (PDT)
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
Subject: [PATCH v6 0/5] Reuse 32 bit C code more safely
Date: Thu, 17 Oct 2024 14:31:18 +0100
Message-Id: <20241017133123.1946204-1-frediano.ziglio@cloud.com>
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
47990ecef286606794d607d4ca8703d71c98d659.

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

Frediano Ziglio (5):
  x86/boot: create a C bundle for 32 bit boot code and use it
  x86/boot: Reuse code to relocate trampoline
  x86/boot: Use boot_vid_info variable directly from C code
  x86/boot: Use trampoline_phys variable directly from C code
  x86/boot: Clarify comment

 xen/arch/x86/boot/.gitignore                  |   5 +-
 xen/arch/x86/boot/Makefile                    |  55 ++++-
 .../x86/boot/{build32.lds => build32.lds.S}   |  41 +++-
 xen/arch/x86/boot/cmdline.c                   |  12 -
 xen/arch/x86/boot/head.S                      |  49 +---
 xen/arch/x86/boot/reloc-trampoline.c          |  36 +++
 xen/arch/x86/boot/reloc.c                     |  35 +--
 xen/arch/x86/efi/efi-boot.h                   |  15 +-
 xen/tools/combine_two_binaries.py             | 220 ++++++++++++++++++
 9 files changed, 355 insertions(+), 113 deletions(-)
 rename xen/arch/x86/boot/{build32.lds => build32.lds.S} (63%)
 create mode 100644 xen/arch/x86/boot/reloc-trampoline.c
 create mode 100755 xen/tools/combine_two_binaries.py

-- 
2.34.1


