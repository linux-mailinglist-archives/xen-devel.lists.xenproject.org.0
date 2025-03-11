Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B707BA5D173
	for <lists+xen-devel@lfdr.de>; Tue, 11 Mar 2025 22:13:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.909295.1316267 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ts6uB-00005D-6I; Tue, 11 Mar 2025 21:12:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 909295.1316267; Tue, 11 Mar 2025 21:12:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ts6uB-0008VM-2b; Tue, 11 Mar 2025 21:12:51 +0000
Received: by outflank-mailman (input) for mailman id 909295;
 Tue, 11 Mar 2025 21:12:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=isYZ=V6=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1ts6u9-0008V9-Ov
 for xen-devel@lists.xenproject.org; Tue, 11 Mar 2025 21:12:49 +0000
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [2a00:1450:4864:20::435])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 95198016-febd-11ef-9898-31a8f345e629;
 Tue, 11 Mar 2025 22:12:47 +0100 (CET)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-390e3b3d3f4so2962155f8f.2
 for <xen-devel@lists.xenproject.org>; Tue, 11 Mar 2025 14:12:47 -0700 (PDT)
Received: from andrewcoop.eng.citrite.net (host-92-26-98-202.as13285.net.
 [92.26.98.202]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3912bfdfba9sm19480872f8f.39.2025.03.11.14.12.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Mar 2025 14:12:45 -0700 (PDT)
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
X-Inumbo-ID: 95198016-febd-11ef-9898-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1741727567; x=1742332367; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=I1kFjBuIASLmCG10NTTQBJ4txzWJ0ch7ykueDsSbR6s=;
        b=hUp6vESAfuEDbKKuMpq8lS+qh/Ew8K3x3SaJcUFxY7UHTtiI8VQJRxMeFtAsvWi3IX
         zQ3RTEIx+wnD7Lv6E8Gf3A8xpnBuIpiCGT9ubY70iZ3ID4ZpIHqxp9McChkrpwPwoZS8
         EhO0ScoHXMklfsvMzZTob6YE+P2mD4i+Akthk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741727567; x=1742332367;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=I1kFjBuIASLmCG10NTTQBJ4txzWJ0ch7ykueDsSbR6s=;
        b=NWqF8non1wl3OldFO2l8Ax9v9R21TmIrHXsjJ6B5UG2FBL0vVo/nvQOUI4AvbUf3yl
         nIafWB6IjkknpdJrepNaf0XQ1NCuzVp77kkvaJpevYwP87GkaDGbyFRcaXApSdnt1okR
         /3piULFdOlZtIB1I4cWOydkn+qlRNmjcsbi9cL1PSgeTonVry7W3rzVFgMSZHW6ASORy
         PCBV0C0G72aaGtjXK2DrRybn2ySsbj046IdgMbPIda88RUh6DvLpQLHoEjB7BSpFj1Jz
         zGjNUKXClBjfAQ8XO3LTVZuxxjVN/E4mRolKDgM/6Impg9LOirhZy8gVhS62zoFE7pjf
         6IFQ==
X-Gm-Message-State: AOJu0YyHpGUm3Ao7BbDIjkAOS+diQX9GHp5hRUQ8h44TnTXTtYE5ux2r
	nQnTtemlzv4uPsc1hYo5M+iEntM5N8u4I0Gw9LkZiX4Sx0NZJ1pjvN6k7Fm8QvcRBmI4Qe3rTcj
	K
X-Gm-Gg: ASbGncv7wZZy9wHROKamXN2faDqRHRWnYYCJ+LTXBcX9sgd28gdLhFH/MWbrcjAqa3+
	NUGs86qp5vxbxmEb/BMucb+4BgxMDYFums8JBgOSZBSPbjOMCpnh8yAjeladPNEXVFBB4o8CuWR
	402YeL5p+cGXo6qDBPtaV7InAispbPl+ivQk5HIHSIIHk7oLKqHIYq2t/5u0YW5H5kqIl6asetb
	pI26sOaUMDLYJ+BFne8xVzulE9vvUMzcZL40WoJ3kZL2X0yGyC8gPuULw8F3Jf+uarJaRM2k4Il
	d42pGjF3ewsjHdtZxRPiRn2q2U0Eb1iD7wC3iAxC6r6B1G5WeqEPMSgkhgqIU6RLgieO5E6O/+g
	rbKwzvc/NSnvYUunrmyXZIPM5
X-Google-Smtp-Source: AGHT+IHvE0opfp4owT/k0/vfZ+AgBORwYV/A9YG+T57Es3Dxs3szSsgH+FC84OzC47NHVbYMkMJc0g==
X-Received: by 2002:a5d:6d8c:0:b0:391:952:c728 with SMTP id ffacd0b85a97d-39132d77544mr12612565f8f.4.1741727566870;
        Tue, 11 Mar 2025 14:12:46 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH 0/8] x86: Drop the vm86 segments selectors from struct cpu_user_regs
Date: Tue, 11 Mar 2025 21:10:35 +0000
Message-Id: <20250311211043.3629696-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This is the next chunk of work in order to support FRED.

https://gitlab.com/xen-project/people/andyhhp/xen/-/pipelines/1711534693
https://cirrus-ci.com/build/6031265616363520

Andrew Cooper (8):
  x86/regs: Fold x86_64/regs.h into it's single includer
  x86/traps: Rework register state printing to use a struct
  x86/traps: Avoid OoB accesses to print the data selectors
  Revert "x86/traps: 'Fix' safety of read_registers() in #DF path"
  x86/domctl: Stop using XLAT_cpu_user_regs()
  x86/pv: Store the data segment selectors outside of cpu_user_regs
  x86/public: Split the struct cpu_user_regs type
  x86: Drop the vm86 segments selectors from struct cpu_user_regs

 xen/arch/x86/cpu/common.c                |  10 +-
 xen/arch/x86/domain.c                    |  96 ++++++++++++------
 xen/arch/x86/domctl.c                    |  42 +++++++-
 xen/arch/x86/include/asm/cpu-user-regs.h |  65 +++++++++++++
 xen/arch/x86/include/asm/current.h       |  11 ++-
 xen/arch/x86/include/asm/domain.h        |   2 +
 xen/arch/x86/include/asm/hvm/hvm.h       |   4 -
 xen/arch/x86/include/asm/regs.h          |  28 ++++--
 xen/arch/x86/include/asm/x86_64/regs.h   |  28 ------
 xen/arch/x86/pv/dom0_build.c             |   6 +-
 xen/arch/x86/traps.c                     |   2 +-
 xen/arch/x86/x86_64/asm-offsets.c        |   2 +-
 xen/arch/x86/x86_64/traps.c              | 119 +++++++++++++----------
 xen/arch/x86/x86_emulate/private.h       |   2 +
 xen/include/public/arch-x86/xen-x86_32.h |   8 ++
 xen/include/public/arch-x86/xen-x86_64.h |   8 ++
 xen/include/public/arch-x86/xen.h        |   6 ++
 xen/include/xlat.lst                     |   2 -
 18 files changed, 301 insertions(+), 140 deletions(-)
 create mode 100644 xen/arch/x86/include/asm/cpu-user-regs.h
 delete mode 100644 xen/arch/x86/include/asm/x86_64/regs.h

-- 
2.39.5


