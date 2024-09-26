Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 077F89871C2
	for <lists+xen-devel@lfdr.de>; Thu, 26 Sep 2024 12:42:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.805302.1216356 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1stlwW-0003SL-0i; Thu, 26 Sep 2024 10:41:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 805302.1216356; Thu, 26 Sep 2024 10:41:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1stlwV-0003Qb-Sq; Thu, 26 Sep 2024 10:41:51 +0000
Received: by outflank-mailman (input) for mailman id 805302;
 Thu, 26 Sep 2024 10:41:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7qt4=QY=flex--ardb.bounces.google.com=3bDr1ZggKCfMVmYW+bdobjjbgZ.XjhsZi-YZqZggdnon.sZikmjeZXo.jmb@srs-se1.protection.inumbo.net>)
 id 1stlwU-0003PD-N4
 for xen-devel@lists.xenproject.org; Thu, 26 Sep 2024 10:41:50 +0000
Received: from mail-ej1-x64a.google.com (mail-ej1-x64a.google.com
 [2a00:1450:4864:20::64a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ef70463b-7bf3-11ef-a0ba-8be0dac302b0;
 Thu, 26 Sep 2024 12:41:49 +0200 (CEST)
Received: by mail-ej1-x64a.google.com with SMTP id
 a640c23a62f3a-a8d2f475416so54094066b.0
 for <xen-devel@lists.xenproject.org>; Thu, 26 Sep 2024 03:41:49 -0700 (PDT)
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
X-Inumbo-ID: ef70463b-7bf3-11ef-a0ba-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1727347309; x=1727952109; darn=lists.xenproject.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ZSLBX9kmp1nbYan62YJy8OBvQyiXlF26r+PplytHp80=;
        b=CX4nJ2SlRV4SC2CPdtmmdFti4JWeNXFXmstXAK6SCZMZ8KRYb8XDW8s9yaKhUl1nUA
         sM4EUJOyVzN/hCWgcQS49U9R26URfSySwHqdoTVIIOsC6uArcXLPNg/uW5yhUsIQRsjJ
         dmkuR2LPDhOjkIGWFFFYUnHTzrbZ0OoQq7PelxP9A4ZlEk3KwXV57mZ1Y3q7LweWD1lu
         qwhT9J5h6E3sr0DVcvPCxnwhzUaTRwk9F2nLE2Jq4P3aq4vnue6EmIxhiWAFjY4oVJdY
         yyU1lrlGBrUxSccBdV1tW4AXEuIxigN3bWHahXXOaUXTw/wm7I9l3n/W6q0l6Zujul0z
         hhMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727347309; x=1727952109;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZSLBX9kmp1nbYan62YJy8OBvQyiXlF26r+PplytHp80=;
        b=EHEG6IvadTA/cZqf2mThXCz5uSfmZMbS5x8gHzYN+6wpTFhAY04mCSZdacdj2rvuyk
         zCvga3Q+Vo0KS/5bwcAn6Qj6tbZwjs0U1oltaUNzWKl69q3bGNkahxIvIB79mKZIUgTA
         AFAYijoTSXfg/zYXtrPzFZl4jH4cgyGTfiuFR2Et9C9Is80ITArE5rOO5UuwAMDmrFt/
         GBjssuMKB9jx9vjYKcfNluN00zWB5pRDuLPhtb1/s/dBa7FgqU6dcaURsIqEf6jUyadI
         xt4FOQuBaYKxElllP8Og84uxSYZKXvYkuwp54GxZioCQpYFjpz/4Wwe/L+S7S0Bf9hI5
         uL2A==
X-Forwarded-Encrypted: i=1; AJvYcCURR3XtesxFB9rMoSxiKS3XAuQpm7IOUimM8oPBVLzmAHXaDYAkeH3Tgg8/QQzTgniQkT3vt41qfFs=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwCKboNKEsHqk68z82ABtsKkdEr3JwDj2N5RAY+8n9x+DfZzmM2
	qwjYkFuEz/N9/WEEG6siO/zBKHj4D0qsRw5iFv0n40hULIBLd/PPhmPoTmxQ1EDv0owkzg==
X-Google-Smtp-Source: AGHT+IHnqm4XoQMPFbClWJRFC7BHLidpH9Q8eU25gNI0jgFL8aZqDFQy6hanTue4qdLPPwt/LZTQNTfO
X-Received: from palermo.c.googlers.com ([fda3:e722:ac3:cc00:7b:198d:ac11:8138])
 (user=ardb job=sendgmr) by 2002:a17:906:cf8a:b0:a8d:da3:dc with SMTP id
 a640c23a62f3a-a93a035ca9bmr300366b.4.1727347308814; Thu, 26 Sep 2024 03:41:48
 -0700 (PDT)
Date: Thu, 26 Sep 2024 12:41:14 +0200
Mime-Version: 1.0
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=4166; i=ardb@kernel.org;
 h=from:subject; bh=Uws/4OaEYtp6QUfD5Ms5Ag3QaKuSAmOS3eQ0kcg80f4=;
 b=owGbwMvMwCFmkMcZplerG8N4Wi2JIe2rlZcV4/v+gpv7xcz/NR3P2fp5y2zHt7vsF7psfBqlV
 Ji+5pVWRykLgxgHg6yYIovA7L/vdp6eKFXrPEsWZg4rE8gQBi5OAZjI8Q+MDLtPTb9VOblUzGLi
 3Q83zsrNkf57Ma2GY63zmRkTmZMi9oUzMvyTn73lYtxLq+lRQfU3LRLzWx4vzlnyIrVNtWdqskg JHx8A
X-Mailer: git-send-email 2.46.0.792.g87dc391469-goog
Message-ID: <20240926104113.80146-7-ardb+git@google.com>
Subject: [PATCH 0/5] x86/xen: Drop absolute references from startup code
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-kernel@vger.kernel.org
Cc: Ard Biesheuvel <ardb@kernel.org>, Jason Andryuk <jason.andryuk@amd.com>, 
	Juergen Gross <jgross@suse.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, x86@kernel.org, 
	xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"

From: Ard Biesheuvel <ardb@kernel.org>

This series was broken out of the series I sent yesterday [0], after
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

[0] https://lore.kernel.org/all/20240925150059.3955569-30-ardb+git@google.com

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

 arch/x86/kernel/vmlinux.lds.S | 12 +++++
 arch/x86/platform/pvh/head.S  | 49 +++++++++++---------
 arch/x86/tools/relocs.c       |  1 +
 arch/x86/xen/xen-head.S       |  6 ++-
 4 files changed, 44 insertions(+), 24 deletions(-)


base-commit: 47ffe0578aee45fed3a06d5dcff76cdebb303163
-- 
2.46.0.792.g87dc391469-goog


