Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7548778D751
	for <lists+xen-devel@lfdr.de>; Wed, 30 Aug 2023 17:53:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.593116.926035 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qbNVd-000674-Vm; Wed, 30 Aug 2023 15:53:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 593116.926035; Wed, 30 Aug 2023 15:53:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qbNVd-000655-SH; Wed, 30 Aug 2023 15:53:33 +0000
Received: by outflank-mailman (input) for mailman id 593116;
 Wed, 30 Aug 2023 15:53:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Xver=EP=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1qbNVb-00064j-Ti
 for xen-devel@lists.xenproject.org; Wed, 30 Aug 2023 15:53:31 +0000
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [2a00:1450:4864:20::32b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5d425d57-474d-11ee-8783-cb3800f73035;
 Wed, 30 Aug 2023 17:53:29 +0200 (CEST)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-401da71b7c5so15834335e9.2
 for <xen-devel@lists.xenproject.org>; Wed, 30 Aug 2023 08:53:29 -0700 (PDT)
Received: from localhost.localdomain ([66.81.173.62])
 by smtp.gmail.com with ESMTPSA id
 b4-20020adff244000000b0031423a8f4f7sm17000009wrp.56.2023.08.30.08.53.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Aug 2023 08:53:28 -0700 (PDT)
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
X-Inumbo-ID: 5d425d57-474d-11ee-8783-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1693410809; x=1694015609; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zgFprSpF684gDhgVue83BunhcMq8nZ7UpRqzRTLCkOY=;
        b=QfvWPzMIjD+dVulfMtyJ444WFvq6k93ZnU566kne96Po0nppJrO2nVtogN9bx+Vk3c
         HhzKhnQi1KCk6LHvXU3WbKjZaJ/Qj4Oy8nn35IAPqe7wGPhWtGLk9uDzBw9/eJ5wrDyE
         HXx5mGoewzTcGOxknMrUraTnrrNexJbNSB88Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693410809; x=1694015609;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zgFprSpF684gDhgVue83BunhcMq8nZ7UpRqzRTLCkOY=;
        b=kvStSLFTvLaLiZXR9Y0YUTL2vavZsT9jKCMswqZkEPiOIXr/6Dw8HlThV2mjDMNSAz
         BM2gkjf+nSVUKKx3DuApIcP1EWdcqo3xhnR/K185uYjtV3+TOlVF8fFDbEOy5XRmcSx3
         9dfmxLvcuv9TKTqL5S0MfhpryaySo+NNF7soD1lEIw8cwGuO+KuTj3u2aSNKTX1m6Z3I
         IkiWnIBurFjJC7qoQApMmUM5MGN2Fc8YSdVgiC3UDkV411ID3yF2BDwPKm9SMcev/nw4
         NyZMktseer+f0JBxVPVUxT7bg3bExTszXuULTxOxo91qtCLCZVYJCbG4KB3Vyw57f4to
         O/0w==
X-Gm-Message-State: AOJu0Yxq7sRJGVUFxy4fwI0r1LH3Yu4ctYBMCvzPZaKxZwISkQ/JjQQm
	+RqbJeqSn6rd5w7+1i4Q9XsUB+TTCf0Nnb7sPPU=
X-Google-Smtp-Source: AGHT+IFddvf2Q+Owe/TEqPTLzef95kwb7kAD0mOciGkW60nUtF5+77cEcNnxjtnHq+vNbtdNOmDeiw==
X-Received: by 2002:a7b:ca47:0:b0:401:a0b1:aef6 with SMTP id m7-20020a7bca47000000b00401a0b1aef6mr2198039wml.2.1693410809033;
        Wed, 30 Aug 2023 08:53:29 -0700 (PDT)
From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Alejandro Vallejo <alejandro.vallejo@cloud.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v8 0/4] Prevent attempting updates known to fail
Date: Wed, 30 Aug 2023 16:53:22 +0100
Message-Id: <20230830155326.10199-1-alejandro.vallejo@cloud.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Now that XENLOG_INFO is the default logging level...

v8:
  * Fixed last bits mentioned by Jan in v7/patch1 (v8/patch2)
  * Rolled back to having new printk as INFO
  * Added v8/patch1 to ensure the existing early exit from
    early_cpu_init() has INFO severity as well.

Original cover letter:

Under certain conditions a CPU may not be able to perform microcode updates
even if hardware exists to that effect. In particular:

 * If Xen runs under certain hypervisors they won't allow microcode
   updates, and will signal this fact by reporting a microcode revision of
   -1.
 * If the DIS_MCU_LOAD bit is set, which is expected in some baremetal
   clouds where the owner may not trust the tenant, then the CPU is not
   capable of loading new microcode.

This series adds logic so that in both of these cases we don't needlessly
attempt updates that are not going to succeed. Patch summary:

Patch 1 Modifies the severity of the printk statement in
        early_microcode_init() to be INFO

Patch 2 Ignores microcode facilities when the current microcode revision is -1
        (was v7/patch1)

Patch 3 Moves the MSR_ARCH_CAPS read in tsx_init() to early_cpu_init() and
        early_microcode_init()
        (was v7/patch2)

Patch 4 Adds the logic to detect microcode updates being disabled on Intel.
        (was v7/patch3)

Alejandro Vallejo (4):
  x86/microcode: WARN->INFO for the "no ucode loading" log message
  x86/microcode: Ignore microcode loading interface for revision = -1
  x86: Read MSR_ARCH_CAPS immediately after early_microcode_init()
  x86/microcode: Disable microcode update handler if DIS_MCU_UPDATE is
    set

 xen/arch/x86/cpu/common.c             | 20 ++++++++++----
 xen/arch/x86/cpu/microcode/core.c     | 40 +++++++++++++++++++++++----
 xen/arch/x86/cpu/microcode/intel.c    | 13 +++++++++
 xen/arch/x86/cpu/microcode/private.h  |  7 +++++
 xen/arch/x86/include/asm/cpufeature.h |  1 +
 xen/arch/x86/include/asm/msr-index.h  |  5 ++++
 xen/arch/x86/include/asm/setup.h      |  2 +-
 xen/arch/x86/setup.c                  |  2 +-
 xen/arch/x86/tsx.c                    | 16 +++--------
 9 files changed, 82 insertions(+), 24 deletions(-)

-- 
2.34.1


