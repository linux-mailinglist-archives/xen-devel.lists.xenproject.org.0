Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E02B746D1A5
	for <lists+xen-devel@lfdr.de>; Wed,  8 Dec 2021 12:09:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.242141.418829 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muuoG-0006bO-VN; Wed, 08 Dec 2021 11:08:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 242141.418829; Wed, 08 Dec 2021 11:08:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muuoG-0006Yz-SR; Wed, 08 Dec 2021 11:08:28 +0000
Received: by outflank-mailman (input) for mailman id 242141;
 Wed, 08 Dec 2021 11:08:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KNkV=QZ=gmail.com=jiangshanlai@srs-se1.protection.inumbo.net>)
 id 1muuoF-0006Yt-1s
 for xen-devel@lists.xenproject.org; Wed, 08 Dec 2021 11:08:27 +0000
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com
 [2607:f8b0:4864:20::629])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 28fb83f5-5817-11ec-a831-37629979565c;
 Wed, 08 Dec 2021 12:08:25 +0100 (CET)
Received: by mail-pl1-x629.google.com with SMTP id u11so1313154plf.3
 for <xen-devel@lists.xenproject.org>; Wed, 08 Dec 2021 03:08:24 -0800 (PST)
Received: from localhost ([47.251.3.230])
 by smtp.gmail.com with ESMTPSA id h13sm3072127pfv.37.2021.12.08.03.08.21
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 08 Dec 2021 03:08:22 -0800 (PST)
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
X-Inumbo-ID: 28fb83f5-5817-11ec-a831-37629979565c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Vg9Y2qwD//mZgSKr3fZbhivDw/ZV22tqoORXTECSxD0=;
        b=itA2cU4V+5hxMb7u2gRFEQ1+caoQ2C6iLL4Fv57ZS4wZBzPvuhal8+Wof+IBV2ZzFb
         s2tdy0Tr/vbgqc2MIJigFoYeK2iyBV8JxxmYf5q/00Xg/nJbsoP4kmY/9BaWVuGvv2s2
         lLetMIdPIz5oRvlGXasZrXiq6C5QKp1frYuVwMsgnvETSMhtBF0wwrkQcW9lI86ig/FW
         7cskonVCDC3F55ogBf3ouGCxkQv7EJlkYJYn2787sM5cAs6rdlG8444budASlJXS7phF
         6YHtZaKt41EOOPo+aL15YJjiGRzr7l7dYwx/MybZUEc4N41Rgw7J4UKXwAxZZsXPeNft
         AJhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Vg9Y2qwD//mZgSKr3fZbhivDw/ZV22tqoORXTECSxD0=;
        b=MgxFa3Uam3xwcm6a7cwqA0AET/wJkgBzG8BvVx/GGqTJqdJJwSg4bAnH0KsdP/t4B5
         3a7gnRs/L/Koc7nonqKKmV5xy4Q5KDIuzmA7j7cZLpzP2AzeqaUJLEQMzsE+ZqPDeA8r
         11eupJaCS5+K8wqMY3QdQDi46GTk736W+QFUTqYvlFJLl08sqzTPfR1wh6GRLVR9ko57
         6RgqoG3usKvf9l3Wz8bkH8famzR+K0rCvNVKhmahMgHnjzbbWQujsPLkbwPAUdPfDrgv
         KdUzNhOVZRzGV9wzJkxx3T/mY4f3dk3KzJZDwXL3JbXYg86PEIhkCyKnxAbm2gxfMfY2
         m7bw==
X-Gm-Message-State: AOAM533MKjrf5Hw0KCrqdkECjokk6hkogFB0ABSe7gZsGUvFW29U5Lr6
	UKaLye079hucqRSssVcoxRwrwZLo814=
X-Google-Smtp-Source: ABdhPJyJqUq+r8DKUrbjm4AzKKBjH7UT96ssoju6KRFceh7AParCUM4v9ULbwlHtBmu1m5eyPpa1Ww==
X-Received: by 2002:a17:90a:384d:: with SMTP id l13mr6534667pjf.104.1638961702635;
        Wed, 08 Dec 2021 03:08:22 -0800 (PST)
From: Lai Jiangshan <jiangshanlai@gmail.com>
To: linux-kernel@vger.kernel.org
Cc: x86@kernel.org,
	xen-devel@lists.xenproject.org,
	Lai Jiangshan <laijs@linux.alibaba.com>
Subject: [PATCH 00/11] x86/entry: Clean up entry code
Date: Wed,  8 Dec 2021 19:08:22 +0800
Message-Id: <20211208110833.65366-1-jiangshanlai@gmail.com>
X-Mailer: git-send-email 2.19.1.6.gb485710b
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lai Jiangshan <laijs@linux.alibaba.com>

This patchset moves the stack-switch code to the place where
error_entry() return, distangles error_entry() from XENpv and makes
entry_INT80_compat use idtentry macro.

This patchset is highly related to XENpv, because it does the extra
cleanup to convert SWAPGS to swapgs after major cleanup is done.

After error_entry() is distangled from XENpv, a branch in sync_regs()
is removed to.

Patch 1-10 are picked from the patchset
https://lore.kernel.org/lkml/20211126101209.8613-1-jiangshanlai@gmail.com/
which coverts ASM code to C code.  These patches are prepared for that
purpose.  But this patchset has it own value: it simplifies the stack
switch, avoids leaving the old stack inside a function, and separates
XENpv code with native code without adding new code which can lead to
more cleanups.

Patch 11 is new in this patchset.

Lai Jiangshan (11):
  x86/entry: Use swapgs and native_iret directly in
    swapgs_restore_regs_and_return_to_usermode
  x86/traps: Move pt_regs only in fixup_bad_iret()
  x86/entry: Switch the stack after error_entry() returns
  x86/entry: move PUSH_AND_CLEAR_REGS out of error_entry
  x86/entry: Move cld to the start of idtentry
  x86/entry: Don't call error_entry for XENPV
  x86/entry: Convert SWAPGS to swapgs in error_entry()
  x86/entry: Use idtentry macro for entry_INT80_compat
  x86/entry: Convert SWAPGS to swapgs in entry_SYSENTER_compat()
  x86: Remove the definition of SWAPGS
  x86/entry: Remove the branch in sync_regs()

 arch/x86/entry/entry_64.S        |  65 +++++++++++++------
 arch/x86/entry/entry_64_compat.S | 104 +------------------------------
 arch/x86/include/asm/idtentry.h  |  47 ++++++++++++++
 arch/x86/include/asm/irqflags.h  |   2 -
 arch/x86/include/asm/proto.h     |   4 --
 arch/x86/include/asm/traps.h     |   2 +-
 arch/x86/kernel/traps.c          |  25 ++++----
 7 files changed, 107 insertions(+), 142 deletions(-)

-- 
2.19.1.6.gb485710b


