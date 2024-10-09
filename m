Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 40F2E9970A1
	for <lists+xen-devel@lfdr.de>; Wed,  9 Oct 2024 18:09:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.814886.1228581 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1syZFN-0004Qw-Cp; Wed, 09 Oct 2024 16:09:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 814886.1228581; Wed, 09 Oct 2024 16:09:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1syZFN-0004OP-8l; Wed, 09 Oct 2024 16:09:09 +0000
Received: by outflank-mailman (input) for mailman id 814886;
 Wed, 09 Oct 2024 16:09:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4orL=RF=flex--ardb.bounces.google.com=3n6oGZwgKCU4q7tr+wy9w44w1u.s42Du3-tuBu11y898.Du3574zus9.47w@srs-se1.protection.inumbo.net>)
 id 1syZFL-0004OD-4w
 for xen-devel@lists.xenproject.org; Wed, 09 Oct 2024 16:09:07 +0000
Received: from mail-yb1-xb4a.google.com (mail-yb1-xb4a.google.com
 [2607:f8b0:4864:20::b4a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ce26bb22-8658-11ef-99a2-01e77a169b0f;
 Wed, 09 Oct 2024 18:09:05 +0200 (CEST)
Received: by mail-yb1-xb4a.google.com with SMTP id
 3f1490d57ef6-e290a9a294fso240842276.2
 for <xen-devel@lists.xenproject.org>; Wed, 09 Oct 2024 09:09:05 -0700 (PDT)
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
X-Inumbo-ID: ce26bb22-8658-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1728490144; x=1729094944; darn=lists.xenproject.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ihUuPfSAQAcR0+bkMhCvtEzjM7mpMFX5i7pmWzbSWjc=;
        b=R1yml1W4LXWWKpIYXbi9WRPtkxtqfISXdLfk9pNL/NSGLz7LUtm5QjQr2Dp8K0uiFu
         WfxfIHr8Ho85GKkVc9jwVwDN7amEbIEUXHzlkDGbAQuGu3NJp+3ddnznEkBkeufFqaYV
         LlJrCsjAMTVTQCE0Mww7GB7tXr4GTB06t5wOzv+6x+HLmV5u2uY8NAhaVqG9+iIav1+F
         AxjHkiMmftvKF6rxV0ZpwJxhIFq3Pbk6TaIE//b6tFWanuh4gZXZ1CUD73uVDcwfVkoD
         sNTXgLTtBoi3hdPVdavUJknYSHkcMCZm5CDx9E7V4DHnbaN0BtEYRF6agpga6nnAg590
         mAFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728490144; x=1729094944;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ihUuPfSAQAcR0+bkMhCvtEzjM7mpMFX5i7pmWzbSWjc=;
        b=N+A3NkKGaHdpxQ5EOtkr7XfQckfo4/07p56FTVwaYMUOI1B3pXR5maIDiPkwpX/l3G
         QRjL++5XvylBrOdxeTQfoopgf/i8A4daRA04rlfk8O1kzEtPO2vkjsdM9TC6rJkbsg6V
         +hNkj0295yPzoBC9R6uMdX7EEA0De4kofOrEv4B0GgVPv+6MtPtwxS1VjnwgzjmjlbTr
         XA1eNZLIhKjAcw85nC/cJE9mmIoWwwpvRQtq92hb+Hwh0sSs9X1F+w+t7SUluXzR1uke
         AQOlSO5zyFPVOs7C0nas/zX+xxSZoTrle5n6IH3u7U9RkvGBl0od59NAL4iynQL07xcq
         2ZzQ==
X-Forwarded-Encrypted: i=1; AJvYcCUy5Xz5z6YT0QGQrVFTtOimU7ASsRhP9QkksviA/E3ZHsUiitWwbZUnFjdYn08H7p+kgfEyv6AUp04=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yw+zdbwcOEC4YdGro9aiVBBmcX8lE0dRGkqsDhodVQ3UgP8CuGU
	ryZ0w/ysWEqZ55yiWVQHfiqVnx7hlVgYzLVYEwFfVyqH9LztjJstS26CZq3Cwi3ZE1WGTQ==
X-Google-Smtp-Source: AGHT+IEIxpbQfQQkvY9ZXHbacw3miId8a+O5WNpa3HE+ve/Un0kg4t6qYCHSzqoicfWVZn+irr7o5Cut
X-Received: from palermo.c.googlers.com ([fda3:e722:ac3:cc00:7b:198d:ac11:8138])
 (user=ardb job=sendgmr) by 2002:a25:9105:0:b0:e20:25f5:a889 with SMTP id
 3f1490d57ef6-e28fe4a5550mr2103276.5.1728490143922; Wed, 09 Oct 2024 09:09:03
 -0700 (PDT)
Date: Wed,  9 Oct 2024 18:04:39 +0200
Mime-Version: 1.0
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=4871; i=ardb@kernel.org;
 h=from:subject; bh=tMu7HK8XnBJOEjLli1NIwyalC9VG3W6HEH9wUQOYTH0=;
 b=owGbwMvMwCFmkMcZplerG8N4Wi2JIZ1t5XS+J7quVVZTrJ7cil4T81dtaszZE44H8pKZf3C/Z
 bxXv3RXRykLgxgHg6yYIovA7L/vdp6eKFXrPEsWZg4rE8gQBi5OAZjI3U6GPzwNvgynJjYJJMWH
 J1Qs27DUwe/Peq7CJalLHxTEXs3uZmFk+CeY0/xMVeYARzhPfu7DSw/9vxl//PmwcamGgcn3C4p aDAA=
X-Mailer: git-send-email 2.47.0.rc0.187.ge670bccf7e-goog
Message-ID: <20241009160438.3884381-7-ardb+git@google.com>
Subject: [PATCH v3 0/5] x86/xen: Drop absolute references from startup code
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-kernel@vger.kernel.org
Cc: Ard Biesheuvel <ardb@kernel.org>, Jason Andryuk <jason.andryuk@amd.com>, 
	Juergen Gross <jgross@suse.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, x86@kernel.org, 
	xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"

From: Ard Biesheuvel <ardb@kernel.org>

This series was broken out of the series I sent recently [0], after
Jason pointed out that my Xen startup code changes conflict with his
changes to make the PVH startup code position independent.

Jason's work reduces the delta of my changes, and given that my other
series will likely advance at a much slower pace, the Xen changes are
presented here so they can be merged independently.

The end result after applying this series (see below) is that there are
no longer any Xen-related absolute relocations that need to be applied
to .head.text, a section which carries code that may be invoked from the
1:1 mapping of memory before the kernel virtual mapping is up.  The use
of absolute references in this code section has resulted in a few boot
issues that were very hard to track down (Clang built kernels running
under SEV-SNP in particular, which does not provide the best debug
experience).

Even though the occurrences in the Xen startup code were fine, there is
now a lot of C code emitted into .head.text as well, and so it would be
helpful to teach objtool to reject absolute references entirely in this
section (or rely on the linker for that). Therefore, not relying on them
in the first place is a step towards that goal.

Changes since v2 [2]:
- add Jason's Tested-by to patch #4
- use a better name for the linker defined symbols used in the ELF notes
  (patch #4)
- add a comment in the linker script explaining why the symbol values
  are constructed in the way they are
- rebase onto v6.12-rc2

Changes since v1 [1]:
- add Jason's Rb to patches #2, #3 and #5
- drop the use of a 32-bit field for the ELF note- QEMU reads a u64 and
  so the top word needs to remain 0x0
- tweak #ifdefs in patch #4 so the hypercall_page linker symbol does not
  depend on CONFIG_XEN_PV
- rebase onto v6.12-rc1

Changes wrt [0]:
- add Jason's Rb to patch #1
- rebase onto xen/tip's linux-next branch
- split out fix for GDT descriptor size field
- add patch to remove the zeroing of phys_base, which is no longer
  needed
- use a 32-bit field for XEN_ELFNOTE_PHYS32_ENTRY, and use its contents
  to obtain the build time physical address of pvh_startup_xen()

[0] https://lore.kernel.org/all/20240925150059.3955569-30-ardb+git@google.com
[1] https://lore.kernel.org/all/20240926104113.80146-7-ardb+git@google.com/
[2] https://lore.kernel.org/all/20240930071513.909462-7-ardb+git@google.com/

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

 arch/x86/kernel/vmlinux.lds.S | 19 ++++++++
 arch/x86/platform/pvh/head.S  | 50 +++++++++++---------
 arch/x86/tools/relocs.c       |  1 +
 arch/x86/xen/xen-head.S       |  6 ++-
 4 files changed, 52 insertions(+), 24 deletions(-)

-- 
2.47.0.rc0.187.ge670bccf7e-goog


