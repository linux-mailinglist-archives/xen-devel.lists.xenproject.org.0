Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3774F9A054C
	for <lists+xen-devel@lfdr.de>; Wed, 16 Oct 2024 11:22:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.819754.1233199 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t10EL-0001F4-VF; Wed, 16 Oct 2024 09:22:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 819754.1233199; Wed, 16 Oct 2024 09:22:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t10EL-0001C1-Rv; Wed, 16 Oct 2024 09:22:09 +0000
Received: by outflank-mailman (input) for mailman id 819754;
 Wed, 16 Oct 2024 09:22:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zOTK=RM=cloud.com=frediano.ziglio@srs-se1.protection.inumbo.net>)
 id 1t10EJ-0001Bq-Rd
 for xen-devel@lists.xenproject.org; Wed, 16 Oct 2024 09:22:07 +0000
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [2a00:1450:4864:20::133])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1cfb6a3a-8ba0-11ef-a0be-8be0dac302b0;
 Wed, 16 Oct 2024 11:22:06 +0200 (CEST)
Received: by mail-lf1-x133.google.com with SMTP id
 2adb3069b0e04-539e59dadebso5207882e87.0
 for <xen-devel@lists.xenproject.org>; Wed, 16 Oct 2024 02:22:06 -0700 (PDT)
Received: from fziglio-desktop.. ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c98d7b735dsm1500429a12.81.2024.10.16.02.22.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Oct 2024 02:22:05 -0700 (PDT)
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
X-Inumbo-ID: 1cfb6a3a-8ba0-11ef-a0be-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1729070526; x=1729675326; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=h+uOIbnyYxZ/WLhPfKo8hVQOG+Rxo/yE/F0IsZGaydY=;
        b=l2cuy58vKcX9FGuoPCMmkR2UiP27uh0K6qK5iSOFSD0MDcxZq/j6NvdTq5usELb/ta
         Pzy5OBc2OiNZc0J+oWghP1I0X4gRNUWbkNQT/v+1BFynQFva6ckMc2e1mlQXISe0gn0W
         PSWzrnfBXy8wXMJGgOUcvsMPRF6vLJsdr0LaQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729070526; x=1729675326;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=h+uOIbnyYxZ/WLhPfKo8hVQOG+Rxo/yE/F0IsZGaydY=;
        b=kTplmYMhL7I7F2SU3+dXFxB409gvPOLsE3R+RNa3PIFLopIXrMEcauQYDNZMbDlEPk
         GtzU4Imaa7q+RA128pEAhgrzDWNvnqRaBlWj5Da46OdsvnEYEKixvleE1+FmTUIgqiX7
         M/O3xAfkACKxdpi3AnEGmzNFlV9bqe7j2RnK+xiUhss+iV2DN1xIs7z9ZOr4RjBl7loG
         fXsO+GfoSesI1sAGywgCrf0E97z+BCc+DpETP3+zU21SELyr0m3YRZDayOwGjOZw/Eoy
         dHeLzJP8TuE6i0MgeNTqCbfNP4SOsFLDJL82/gA1GWiLUJCdrrIIJFLpUZgGZbYaHe4R
         WOzg==
X-Gm-Message-State: AOJu0YxiqSpFtSNAibTuANpC1onSD0dIP/z9wQH9yagw+Y+ugdhXyuGd
	wfDabrplH4jztMV05SSeU6JkDqdDPTTSh23F5QHdnrxqBXmGYYVmfrgWufP5VwWvY3zPtYkGLPa
	z
X-Google-Smtp-Source: AGHT+IE3kfc6ql6F3rMXWK2dycJ9PVsbboGylut87rU8ycpzzXulha+H48ehdThXLBWWR9CjMJwJwg==
X-Received: by 2002:a05:6512:1283:b0:539:fcb7:8d53 with SMTP id 2adb3069b0e04-53a03f7cf60mr2115338e87.46.1729070526045;
        Wed, 16 Oct 2024 02:22:06 -0700 (PDT)
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
Subject: [PATCH v5 0/5] Reuse 32 bit C code more safely
Date: Wed, 16 Oct 2024 10:21:49 +0100
Message-Id: <20241016092154.1493035-1-frediano.ziglio@cloud.com>
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
3f6ee3db2e878398cfcde725399b4d1b04e92269.

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

Frediano Ziglio (5):
  x86/boot: create a C bundle for 32 bit boot code and use it
  x86/boot: Reuse code to relocate trampoline
  x86/boot: Use boot_vid_info variable directly from C code
  x86/boot: Use trampoline_phys variable directly from C code
  x86/boot: Clarify comment

 xen/arch/x86/boot/.gitignore                  |   5 +-
 xen/arch/x86/boot/Makefile                    |  51 +++-
 .../x86/boot/{build32.lds => build32.lds.S}   |  41 +++-
 xen/arch/x86/boot/cmdline.c                   |  12 -
 xen/arch/x86/boot/head.S                      |  49 +---
 xen/arch/x86/boot/reloc-trampoline.c          |  36 +++
 xen/arch/x86/boot/reloc.c                     |  35 +--
 xen/arch/x86/efi/efi-boot.h                   |  15 +-
 xen/tools/combine_two_binaries.py             | 218 ++++++++++++++++++
 9 files changed, 348 insertions(+), 114 deletions(-)
 rename xen/arch/x86/boot/{build32.lds => build32.lds.S} (63%)
 create mode 100644 xen/arch/x86/boot/reloc-trampoline.c
 create mode 100755 xen/tools/combine_two_binaries.py

-- 
2.34.1


