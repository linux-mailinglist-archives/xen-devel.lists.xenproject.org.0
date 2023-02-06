Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C53A68BD20
	for <lists+xen-devel@lfdr.de>; Mon,  6 Feb 2023 13:43:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.490353.758999 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pP0pq-000539-Tn; Mon, 06 Feb 2023 12:43:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 490353.758999; Mon, 06 Feb 2023 12:43:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pP0pq-00050W-R3; Mon, 06 Feb 2023 12:43:02 +0000
Received: by outflank-mailman (input) for mailman id 490353;
 Mon, 06 Feb 2023 12:43:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cvBD=6C=gmail.com=burzalodowa@srs-se1.protection.inumbo.net>)
 id 1pP0pp-00050Q-C8
 for xen-devel@lists.xenproject.org; Mon, 06 Feb 2023 12:43:01 +0000
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [2a00:1450:4864:20::429])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ca23eac8-a61b-11ed-933c-83870f6b2ba8;
 Mon, 06 Feb 2023 13:43:00 +0100 (CET)
Received: by mail-wr1-x429.google.com with SMTP id i5so3061291wrc.0
 for <xen-devel@lists.xenproject.org>; Mon, 06 Feb 2023 04:43:00 -0800 (PST)
Received: from uni.router.wind (adsl-89.109.242.139.tellas.gr.
 [109.242.139.89]) by smtp.googlemail.com with ESMTPSA id
 o15-20020adfa10f000000b002bddaea7a0bsm8881450wro.57.2023.02.06.04.42.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Feb 2023 04:42:59 -0800 (PST)
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
X-Inumbo-ID: ca23eac8-a61b-11ed-933c-83870f6b2ba8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6tvKKYzN5vkUJPlotDa1j7iDKIgMMFscivD/ORBfUNU=;
        b=iWiwSmeeMdUchn07UMWlbItKk22mVRcbg/IvxgfCRW0hb7PCFdBaXGbsr7PlAmKolE
         0MI7VkY54QvpfF6reZ/SFX5pBjt0JmvclT2SQxnExtNpzWdHNaX08g+befxUSFlzyXPK
         Jo8tMou32EyGqNn6TEOMkHLsT+sOztmtbrJS3ekhq6/uRIjcoywbH7dCSyeFzyVH6Q9U
         nFWruv/fPCYD3Qq8HX6/ElfLPAaf8lNlKZJa2Jmp3lYuaAS8rA+kYGRcqkd+5P8Ob1YT
         XVS8Wza3BNDT0BWVs/CKKMbQZqQK/vrcu6kxYRTLDY81xMnT9o5wZ2oEnDTM7HQxU5s8
         Y9rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6tvKKYzN5vkUJPlotDa1j7iDKIgMMFscivD/ORBfUNU=;
        b=k+Z4o7j0Dl0ynah8Wwoh+ItSVfxFjizxiIgct11Oi918k+24ldY47WX5m3OQselDHQ
         AmwZkmYwSyk1pjJomULYzI9mMp115wMRQiCs9TC1UH7PNx5zdAztYzfxLt92uodmk+2e
         Z+iyJyJkJdk62TGA/CcxjJzlgaJDCaZll0OUqxUYCD2E8apGJen0FlOXbx/zgTfCC41T
         gsCODqYh3Q/lTlq6OKsXKKUSMlRogTacFB+B3ITqG4B0zKoqwglzU2otG7o1oSLXuiW0
         dIVV74CVI5kaBcPvRxJCHV+aSjl061r+LXs4Cmrc2BFAyQfsQDNRUp+X1Rmv6NViShq7
         ndQA==
X-Gm-Message-State: AO0yUKXc5F+IYkV1RgnfI+wkswR9SvVPsKgvkkbq3qvgQwzt9NdYXgTw
	J43N1hkWcjeud9ARv5D/lN0rPXo/GrA=
X-Google-Smtp-Source: AK7set/nxjPD9Heau7t3tFnzG7bMoV8c5K6wwhV8FZWM87nBZXQ+z70F9eK2qFTyo2eY3UtWHzue5g==
X-Received: by 2002:a5d:5582:0:b0:2c3:ea52:7d0e with SMTP id i2-20020a5d5582000000b002c3ea527d0emr2861327wrv.69.1675687379997;
        Mon, 06 Feb 2023 04:42:59 -0800 (PST)
From: Xenia Ragiadakou <burzalodowa@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>,
	Jun Nakajima <jun.nakajima@intel.com>,
	Kevin Tian <kevin.tian@intel.com>,
	Paul Durrant <paul@xen.org>,
	George Dunlap <george.dunlap@citrix.com>
Subject: [PATCH 0/2] Remove unnecessary asm/hvm/support.h includes
Date: Mon,  6 Feb 2023 14:42:49 +0200
Message-Id: <20230206124251.911744-1-burzalodowa@gmail.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

While working on the separation between AMD and Intel code, I noticed that
the header asm/hvm/support.h is included in many files even if none of its
declarations and macro definitions is referred in those files.

This patch series aims to remove any redundant includes of asm/hvm/support.h.
The changes are sent as 2 patches to aid review (especially the change in
asm/spec_ctrl.h).

Xenia Ragiadakou (2):
  x86: do not include asm/hvm/support.h when not used
  x86/hygon: do not include asm/hvm/support.h when not used

 xen/arch/x86/cpu/amd.c                  | 2 +-
 xen/arch/x86/cpu/hygon.c                | 1 -
 xen/arch/x86/cpu/intel.c                | 2 +-
 xen/arch/x86/cpu/vpmu.c                 | 1 -
 xen/arch/x86/cpu/vpmu_intel.c           | 1 -
 xen/arch/x86/crash.c                    | 1 -
 xen/arch/x86/domain.c                   | 1 -
 xen/arch/x86/domctl.c                   | 1 -
 xen/arch/x86/emul-i8254.c               | 2 +-
 xen/arch/x86/hvm/hpet.c                 | 2 +-
 xen/arch/x86/hvm/io.c                   | 1 -
 xen/arch/x86/hvm/irq.c                  | 2 +-
 xen/arch/x86/hvm/pmtimer.c              | 3 ++-
 xen/arch/x86/hvm/rtc.c                  | 3 ++-
 xen/arch/x86/hvm/save.c                 | 2 --
 xen/arch/x86/hvm/stdvga.c               | 1 -
 xen/arch/x86/hvm/svm/emulate.c          | 1 -
 xen/arch/x86/hvm/svm/intr.c             | 1 -
 xen/arch/x86/hvm/svm/vmcb.c             | 1 -
 xen/arch/x86/hvm/viridian/synic.c       | 1 -
 xen/arch/x86/hvm/viridian/time.c        | 1 -
 xen/arch/x86/hvm/viridian/viridian.c    | 1 -
 xen/arch/x86/hvm/vmx/intr.c             | 1 -
 xen/arch/x86/hvm/vmx/vmcs.c             | 1 -
 xen/arch/x86/hvm/vmx/vvmx.c             | 1 +
 xen/arch/x86/hvm/vpic.c                 | 2 +-
 xen/arch/x86/hvm/vpt.c                  | 2 +-
 xen/arch/x86/i387.c                     | 1 -
 xen/arch/x86/include/asm/hvm/vmx/vmx.h  | 2 +-
 xen/arch/x86/include/asm/spec_ctrl.h    | 2 +-
 xen/arch/x86/mm/altp2m.c                | 1 -
 xen/arch/x86/mm/hap/nested_ept.c        | 1 -
 xen/arch/x86/mm/hap/nested_hap.c        | 1 -
 xen/arch/x86/oprofile/op_model_athlon.c | 2 +-
 xen/arch/x86/oprofile/xenoprof.c        | 1 -
 xen/arch/x86/smp.c                      | 1 -
 xen/arch/x86/sysctl.c                   | 1 -
 xen/arch/x86/x86_64/traps.c             | 1 -
 xen/arch/x86/xstate.c                   | 1 -
 xen/drivers/passthrough/x86/hvm.c       | 1 -
 40 files changed, 15 insertions(+), 40 deletions(-)

-- 
2.37.2


