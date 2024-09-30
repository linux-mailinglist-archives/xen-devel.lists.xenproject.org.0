Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 917A2989B22
	for <lists+xen-devel@lfdr.de>; Mon, 30 Sep 2024 09:15:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.807021.1218175 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1svAcz-0007fB-UP; Mon, 30 Sep 2024 07:15:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 807021.1218175; Mon, 30 Sep 2024 07:15:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1svAcz-0007cj-Rl; Mon, 30 Sep 2024 07:15:29 +0000
Received: by outflank-mailman (input) for mailman id 807021;
 Mon, 30 Sep 2024 07:15:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qT/C=Q4=flex--ardb.bounces.google.com=3DVD6ZggKCdQ0H31+68J6EE6B4.2ECN4D-34L4BB8IJI.N4DFHE942J.EH6@srs-se1.protection.inumbo.net>)
 id 1svAcy-0007Ms-Nh
 for xen-devel@lists.xenproject.org; Mon, 30 Sep 2024 07:15:28 +0000
Received: from mail-yw1-x1149.google.com (mail-yw1-x1149.google.com
 [2607:f8b0:4864:20::1149])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c4034e72-7efb-11ef-99a2-01e77a169b0f;
 Mon, 30 Sep 2024 09:15:26 +0200 (CEST)
Received: by mail-yw1-x1149.google.com with SMTP id
 00721157ae682-6dbbeee08f0so69846447b3.0
 for <xen-devel@lists.xenproject.org>; Mon, 30 Sep 2024 00:15:26 -0700 (PDT)
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
X-Inumbo-ID: c4034e72-7efb-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1727680526; x=1728285326; darn=lists.xenproject.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=dd2dU9j63HpFzKeIXYCV0ITt+nTkDZ82tpZxGhtecTo=;
        b=jfii4rX6lLQuTHA2VVMfinv4CVY2i5QC53ZpaHowd1yMAaTQRWvOUKH1Uo+zaZHAKD
         cFyq83B06nCLG4z+x0PasLqgafDw0t6tFHN8Bhr+z4aPluWPXVUpde1RMn1hZuRFS5QQ
         mZLeeo6vj8SfA1YBpoUMF1P2vH1q8lIFEBKmWKvzHtoE1mHn4Osuet+GSTTV6EgzrDxb
         o6Zqk8WU3QTB1FtiWmbobB/rWJlA/PeW3veHpCYX3e9pSDTDQ7TjxGZByplTA2WgdmVe
         JEbifqW4NMazBZQ98l0VN9/CQm/RBcaFC84prsmNEcWBalNUvnCGjqgW8N4Vpc6y75Jz
         0x8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727680526; x=1728285326;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dd2dU9j63HpFzKeIXYCV0ITt+nTkDZ82tpZxGhtecTo=;
        b=i7N2OaQjpezkrzcv35oys37GjS5tskfcOhrX0DgFT60w3EVpthZhbNgHBlpFQR71rU
         NQbnerDKRtHCnW5CPmHuEyfdMxiQD/MAxNVdZMdzkcPzbB5KLAryyCkCnDtw47mUo/xZ
         jbfILmOKSkIFL7xmuCSkCNXRvMp14eb/syI1v50Wk3HuuU4kTqC1d+Edj9YTOyoRSfmO
         DooDJAzXRQ2zZmTxRJR8eKsvv0qehQtdOSlI1LHhmb+fZeVnKtZSjuLM6TNhlX6yxV96
         tcszqRhrud/7Oz7a21CwqID3GQuuENk43/F3zvJOoYUN1ZM4rDvZxz3Sk+09jHbYXBMv
         PWDw==
X-Forwarded-Encrypted: i=1; AJvYcCV7XxAvkihiKO9QfRccPLNtlJjxUresy5Ss5s/HrH9mqPuo+MBhvlGDYFfDuiOIYOkpUE7sBvlvPao=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yzv/pPR5fy9wqww9HwtWlMTsFk4m225wqu7GsbDGALg/IBWXBuO
	o8FBhRT9oMjUz2Yp7V9BSmhovCyD0Kqnl6RGxsuWuo87B9E2DQCdlp5sBzlP5/4JJWTgZw==
X-Google-Smtp-Source: AGHT+IFgoJFdvUw1WZNNF4OsQs1dOK1QNV7js/Ei9XHiPgieX4mGBxnaX8R4ucwmBMQxn1XQRmJxJa1I
X-Received: from palermo.c.googlers.com ([fda3:e722:ac3:cc00:7b:198d:ac11:8138])
 (user=ardb job=sendgmr) by 2002:a05:690c:2c11:b0:6d3:e7e6:8462 with SMTP id
 00721157ae682-6e22eda4173mr625237b3.1.1727680525612; Mon, 30 Sep 2024
 00:15:25 -0700 (PDT)
Date: Mon, 30 Sep 2024 09:15:14 +0200
Mime-Version: 1.0
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=4492; i=ardb@kernel.org;
 h=from:subject; bh=rUUiEoTKPN8ZdAnAJkMvJAt9AG57D9uPhDvEs+Q7iyc=;
 b=owGbwMvMwCFmkMcZplerG8N4Wi2JIe1XANMElzk/FE8WFsZEGh29Enkt2nPf29S7Oaa1xkt0Q
 vpS/Dd0lLIwiHEwyIopsgjM/vtu5+mJUrXOs2Rh5rAygQxh4OIUgInsWcbwP6g9eeVn91f+B5vu
 r5uwsuinoIt+p1qCT2uM/YVdQUeVqhkZNj7b9m3aogObjI6or55vytk+uX/KN60Q67eSB66bz51 7jAcA
X-Mailer: git-send-email 2.46.1.824.gd892dcdcdd-goog
Message-ID: <20240930071513.909462-7-ardb+git@google.com>
Subject: [PATCH v2 0/5] x86/xen: Drop absolute references from startup code
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-kernel@vger.kernel.org
Cc: Ard Biesheuvel <ardb@kernel.org>, Jason Andryuk <jason.andryuk@amd.com>, 
	Juergen Gross <jgross@suse.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, x86@kernel.org, 
	xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"

From: Ard Biesheuvel <ardb@kernel.org>

This series was broken out of the series I sent last week [0], after
Jason pointed out that my Xen startup code changes conflict with his
changes to make the PVH startup code position independent.

Jason's work reduces the delta of my changes, and given that my other
series will likely advance at a much slower pace, the Xen changes are
presented here so they can be merged independently.

The end result after applying this series (see below) is that there are
no longer any Xen-related absolute relocations that need to be applied
to .head.text, which carries code that may be invoked from the 1:1
mapping of memory before the kernel virtual mapping is up.  The use of
absolute references in this code section has resulted in a few boot
issues that were very hard to track down (Clang built kernels running
under SEV-SNP in particular, which does not provide the best debug
experience).

Even though the occurrences in the Xen startup code were fine, there is
now a lot of C code emitted into .head.text as well, and so it would be
helpful to teach objtool to reject absolute references entirely in this
section (or rely on the linker for that). Therefore, not relying on them
in the first place is a step towards that goal.

Changes wrt [0]:
- add Jason's Rb to patch #1
- rebase onto xen/tip's linux-next branch
- split out fix for GDT descriptor size field
- add patch to remove the zeroing of phys_base, which is no longer
  needed
- use a 32-bit field for XEN_ELFNOTE_PHYS32_ENTRY, and use its contents
  to obtain the build time physical address of pvh_startup_xen()

Changes since v1 [1]:
- add Jason's Rb to patches #2, #3 and #5
- drop the use of a 32-bit field for the ELF note- QEMU reads a u64 and
  so the top word needs to remain 0x0
- tweak #ifdefs in patch #4 so the hypercall_page linker symbol does not
  depend on CONFIG_XEN_PV
- rebase onto v6.12-rc1

[0] https://lore.kernel.org/all/20240925150059.3955569-30-ardb+git@google.com
[1] https://lore.kernel.org/all/20240926104113.80146-7-ardb+git@google.com/

Relocation section '.rela.head.text' at offset 0xb428 contains 15 entries:
  Offset          Info           Type           Sym. Value    Sym. Name + Addend
000000000018  000800000002 R_X86_64_PC32     0000000000000000 .init.data + 18
00000000002f  000e00000002 R_X86_64_PC32     0000000000000000 pvh_start_info + 2f
000000000037  000f00000002 R_X86_64_PC32     0000000000000000 pvh_start_info_sz + 37
000000000042  000800000002 R_X86_64_PC32     0000000000000000 .init.data + 4092
000000000060  001000000002 R_X86_64_PC32     000000000000002c xen_elfnote_phys3[...] + 60
000000000068  001100000002 R_X86_64_PC32     0000000000000000 phys_base + 68
00000000006e  001200000002 R_X86_64_PC32     0000000000005000 pvh_init_top_pgt + 6e
000000000089  001300000002 R_X86_64_PC32     0000000000006000 pvh_level3_ident_pgt + 89
000000000091  001400000002 R_X86_64_PC32     0000000000008000 pvh_level3_kernel_pgt + 91
0000000000a3  001500000002 R_X86_64_PC32     0000000000009000 pvh_level2_kernel_pgt + a3
0000000000be  001200000002 R_X86_64_PC32     0000000000005000 pvh_init_top_pgt + be
0000000000de  000800000002 R_X86_64_PC32     0000000000000000 .init.data + 1c
0000000000e9  001600000002 R_X86_64_PC32     0000000000000000 xen_prepare_pvh - 4
0000000000f8  001700000002 R_X86_64_PC32     0000000000000000 pvh_bootparams - 4
0000000000fd  001800000004 R_X86_64_PLT32    0000000000000000 startup_64 - 4

Relocation section '.rela.note.Xen' at offset 0xb668 contains 1 entry:
  Offset          Info           Type           Sym. Value    Sym. Name + Addend
00000000002c  001a00000002 R_X86_64_PC32     0000000000000000 xen_elfnote_phys3[...] + 0

Cc: Jason Andryuk <jason.andryuk@amd.com>
Cc: Juergen Gross <jgross@suse.com>
Cc: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Cc: x86@kernel.org
Cc: xen-devel@lists.xenproject.org

Ard Biesheuvel (5):
  x86/pvh: Call C code via the kernel virtual mapping
  x86/pvh: Use correct size value in GDT descriptor
  x86/pvh: Omit needless clearing of phys_base
  x86/xen: Avoid relocatable quantities in Xen ELF notes
  x86/pvh: Avoid absolute symbol references in .head.text

 arch/x86/kernel/vmlinux.lds.S | 13 +++++
 arch/x86/platform/pvh/head.S  | 50 +++++++++++---------
 arch/x86/tools/relocs.c       |  1 +
 arch/x86/xen/xen-head.S       |  6 ++-
 4 files changed, 46 insertions(+), 24 deletions(-)

-- 
2.46.1.824.gd892dcdcdd-goog


