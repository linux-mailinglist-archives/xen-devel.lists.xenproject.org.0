Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 34FE399C427
	for <lists+xen-devel@lfdr.de>; Mon, 14 Oct 2024 10:54:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.818518.1231816 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t0Gpn-00088k-Ip; Mon, 14 Oct 2024 08:53:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 818518.1231816; Mon, 14 Oct 2024 08:53:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t0Gpn-00086I-Do; Mon, 14 Oct 2024 08:53:47 +0000
Received: by outflank-mailman (input) for mailman id 818518;
 Mon, 14 Oct 2024 08:53:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qGCd=RK=cloud.com=frediano.ziglio@srs-se1.protection.inumbo.net>)
 id 1t0Gpk-000862-VY
 for xen-devel@lists.xenproject.org; Mon, 14 Oct 2024 08:53:45 +0000
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [2a00:1450:4864:20::62d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d15aa38a-8a09-11ef-a0be-8be0dac302b0;
 Mon, 14 Oct 2024 10:53:44 +0200 (CEST)
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-a9a0c40849cso113822866b.3
 for <xen-devel@lists.xenproject.org>; Mon, 14 Oct 2024 01:53:44 -0700 (PDT)
Received: from fziglio-desktop.. ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a99a80f2446sm551817766b.206.2024.10.14.01.53.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Oct 2024 01:53:43 -0700 (PDT)
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
X-Inumbo-ID: d15aa38a-8a09-11ef-a0be-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1728896023; x=1729500823; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Z0SbD6K0VhNzz991Asvv/NQq5tMeRvCT6g5hWmRMink=;
        b=YUfhzHY3qMwqxP0KNIeFgP+ZN1c5Rfb3A3WhpyHP+719Arzq6TRNLOK87ROVARujdM
         sNOnAYrtsMiXg6ygmd8mUu44kI/BZbDl1xT4aqJjgTzBEaSAgS9ym7/LkkKiACdl0cOt
         tLJY2QRG4ye7PQmySp8/UOfxGRS597NW1rK6M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728896023; x=1729500823;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Z0SbD6K0VhNzz991Asvv/NQq5tMeRvCT6g5hWmRMink=;
        b=OQKL3wSBRYmmKD+Qa7IWx2+1Dh4t2gH/7wZBaTNjZikZyup3zDoiA70/lf23R+6J8Q
         SJM4ja5oNcPxhQNykJle7NS+DA6YR+MbdQDGUR8nsa9f52mwnUFvMWPEP61leTTi/Vs/
         ogcpZz+0FQjCl85JJYqiY6dcXtYHhYR75i+vrxlbFfl+CY7JjA9k+VWrDve3wSyzOaoy
         mV8FshIEwdfRrGPu1V21b56mcE5LjGy7cT/uLRWaQPFFqfA86Yx3A99lUihNK26EHZPy
         FxFxS1mEV95Q2MJ90PNWObxFIC1o8AJEwIPvtm1NX0qXF8jf4OiTZpvktKFyKpzhBmsy
         Q21A==
X-Gm-Message-State: AOJu0YweL3IzXR/kQt5ZNAsMw+lrRsjIGv3gIEBmylVBMc+m0QZohrof
	xLghVOR0CJD+Ttf4WpW7y9kVfzVmDmpKC9c7zRq4vDhtEEPJAZAyisoXLuggq2vr3wGAh+IwQGF
	1
X-Google-Smtp-Source: AGHT+IEEWhjkBCB83qt1pQ52pEobZ+NG1m4GtUG98xhUSpJNBJyLyeFmsf3AGmObEW4pLwo0wnc2TA==
X-Received: by 2002:a17:906:4fc8:b0:a8a:6c5d:63b2 with SMTP id a640c23a62f3a-a99b937a6d4mr881380366b.18.1728896023551;
        Mon, 14 Oct 2024 01:53:43 -0700 (PDT)
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
Subject: [PATCH v4 0/6] Reuse 32 bit C code more safely
Date: Mon, 14 Oct 2024 09:53:26 +0100
Message-Id: <20241014085332.3254546-1-frediano.ziglio@cloud.com>
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

More details of the implementation are in commit message 2/6,
which is the largest patch.
Patch 3/6 reuses code to relocate the trampoline between 32 and 64 bit.
Patches 4/6 and 5/6 move some code from assembly to C.

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
76a54badf890f56ff72644593c0fbc72138e13aa.

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

Frediano Ziglio (6):
  x86/boot: Prep work for 32bit object changes
  x86/boot: create a C bundle for 32 bit boot code and use it
  x86/boot: Reuse code to relocate trampoline
  x86/boot: Use boot_vid_info variable directly from C code
  x86/boot: Use trampoline_phys variable directly from C code
  x86/boot: Clarify comment

 xen/arch/x86/boot/.gitignore                  |   5 +-
 xen/arch/x86/boot/Makefile                    |  61 ++++--
 .../x86/boot/{build32.lds => build32.lds.S}   |  41 +++-
 xen/arch/x86/boot/cmdline.c                   |  12 -
 xen/arch/x86/boot/head.S                      |  49 +----
 xen/arch/x86/boot/reloc-trampoline.c          |  36 +++
 xen/arch/x86/boot/reloc.c                     |  35 +--
 xen/arch/x86/efi/efi-boot.h                   |  15 +-
 xen/tools/combine_two_binaries.py             | 207 ++++++++++++++++++
 9 files changed, 341 insertions(+), 120 deletions(-)
 rename xen/arch/x86/boot/{build32.lds => build32.lds.S} (63%)
 create mode 100644 xen/arch/x86/boot/reloc-trampoline.c
 create mode 100755 xen/tools/combine_two_binaries.py

-- 
2.34.1


