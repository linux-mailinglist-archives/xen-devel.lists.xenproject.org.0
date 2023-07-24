Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A97FD75FC97
	for <lists+xen-devel@lfdr.de>; Mon, 24 Jul 2023 18:53:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.569160.889439 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qNynZ-0000UY-4W; Mon, 24 Jul 2023 16:52:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 569160.889439; Mon, 24 Jul 2023 16:52:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qNynZ-0000Rv-1s; Mon, 24 Jul 2023 16:52:41 +0000
Received: by outflank-mailman (input) for mailman id 569160;
 Mon, 24 Jul 2023 16:52:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+YiG=DK=tibco.com=avallejo@srs-se1.protection.inumbo.net>)
 id 1qNynY-0000Rl-49
 for xen-devel@lists.xenproject.org; Mon, 24 Jul 2023 16:52:40 +0000
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [2a00:1450:4864:20::32c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7f196bcc-2a42-11ee-b23b-6b7b168915f2;
 Mon, 24 Jul 2023 18:52:38 +0200 (CEST)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-3fbea14706eso36824075e9.2
 for <xen-devel@lists.xenproject.org>; Mon, 24 Jul 2023 09:52:38 -0700 (PDT)
Received: from EMEAENGAAD19049.citrite.net
 (default-46-102-197-194.interdsl.co.uk. [46.102.197.194])
 by smtp.gmail.com with ESMTPSA id
 x13-20020a5d60cd000000b0030ada01ca78sm13480777wrt.10.2023.07.24.09.52.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Jul 2023 09:52:37 -0700 (PDT)
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
X-Inumbo-ID: 7f196bcc-2a42-11ee-b23b-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1690217558; x=1690822358;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=CLQCJAr0rC6dxrW2X+lLr/OB58MmuMcxotnvqWKYPbM=;
        b=hd6yzEB/gZB21Qyxh20mdjwpa7KH30OKCCiFHBmnl5rxybh5T4OOif2oxJB0ZArETk
         uPnHEYa7EfRyTyrvGt1C8cEqbfK2IBJi/toqtApUOn24UtVDbWbe0MvOKE+69LmHO531
         sWAGTAzB+m5N9mrIrd2nM/+fVuT1mHJBbKO3o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690217558; x=1690822358;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CLQCJAr0rC6dxrW2X+lLr/OB58MmuMcxotnvqWKYPbM=;
        b=JacVqO+iIZS8cFT7mmwOItkpjUUavMwg33hTNhC76G6IYJlENQluW7br4wrr6gbKkv
         FwwGUOuYz47m7hEH8eGTLNlgT96nFfsaSlRyY4v6uEBdebzvc56XL9sXpro7QeMN2LT9
         HJ7JRs1ECgfv7OwfrQuE8w/56srs0rbBiTz4LwB8KAr7t4pSi/rvI0ZVKeZx/Y5AM88f
         483Geq6aGBXNf2vqT5O9WApJ2C+tdOBagsu38+C0cbK7N4mCFgc9ZFPzP+JXPqjYeVyD
         CEuUZ7haR+Gw254K9adc2OwBsZmi1vt2v0RCSlLLvarzrJ/y7hcm4Q9r2k4dYrxzrTmC
         Dz6w==
X-Gm-Message-State: ABy/qLbcx0KSuA1U0zrNVeDFBEi74RQVq6nkP0Mr1rjNgJr4l0/3s+sh
	B34IThNWYo7G6lRfJhf1PO3VjlFoYPll7Pv3Lpg=
X-Google-Smtp-Source: APBJJlGNazamfPa/FbdAUXmKTFl+lBPUVr735yYRADnLHJ6fno/0Ci2++OzWp3cJ8mMvxaxkGOBoww==
X-Received: by 2002:adf:fe12:0:b0:317:54d9:eb48 with SMTP id n18-20020adffe12000000b0031754d9eb48mr4026139wrr.11.1690217557770;
        Mon, 24 Jul 2023 09:52:37 -0700 (PDT)
From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Alejandro Vallejo <alejandro.vallejo@cloud.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v6 0/3] Prevent attempting updates known to fail
Date: Mon, 24 Jul 2023 17:52:32 +0100
Message-Id: <20230724165235.25262-1-alejandro.vallejo@cloud.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

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

Patch 1 Ignores microcode facilities when the current microcode revision is -1

Patch 2 Moves the MSR_ARCH_CAPS read in tsx_init() to early_cpu_init() and
        early_microcode_init()

Patch 3 Adds the logic to detect microcode updates being disabled on Intel.

Alejandro Vallejo (3):
  x86/microcode: Ignore microcode loading interface for revision = -1
  x86: Read MSR_ARCH_CAPS immediately after early_microcode_init()
  x86/microcode: Disable microcode update handler if DIS_MCU_UPDATE is
    set

 xen/arch/x86/cpu/common.c             | 20 ++++++++++----
 xen/arch/x86/cpu/microcode/core.c     | 38 ++++++++++++++++++++++++---
 xen/arch/x86/cpu/microcode/intel.c    | 13 +++++++++
 xen/arch/x86/cpu/microcode/private.h  |  7 +++++
 xen/arch/x86/include/asm/cpufeature.h |  1 +
 xen/arch/x86/include/asm/msr-index.h  |  5 ++++
 xen/arch/x86/include/asm/setup.h      |  2 +-
 xen/arch/x86/setup.c                  |  2 +-
 xen/arch/x86/tsx.c                    | 16 +++--------
 9 files changed, 81 insertions(+), 23 deletions(-)

-- 
2.34.1


