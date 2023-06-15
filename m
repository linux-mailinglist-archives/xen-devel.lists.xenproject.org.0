Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 33CF8731D04
	for <lists+xen-devel@lfdr.de>; Thu, 15 Jun 2023 17:49:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.549716.858412 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q9pDH-0006Zu-4H; Thu, 15 Jun 2023 15:48:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 549716.858412; Thu, 15 Jun 2023 15:48:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q9pDG-0006Tx-Sr; Thu, 15 Jun 2023 15:48:42 +0000
Received: by outflank-mailman (input) for mailman id 549716;
 Thu, 15 Jun 2023 15:48:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=IrMH=CD=tibco.com=avallejo@srs-se1.protection.inumbo.net>)
 id 1q9pDF-0006RY-CJ
 for xen-devel@lists.xenproject.org; Thu, 15 Jun 2023 15:48:41 +0000
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [2a00:1450:4864:20::431])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 189f4e00-0b94-11ee-8611-37d641c3527e;
 Thu, 15 Jun 2023 17:48:39 +0200 (CEST)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-30c4c1fd511so7560183f8f.1
 for <xen-devel@lists.xenproject.org>; Thu, 15 Jun 2023 08:48:39 -0700 (PDT)
Received: from localhost.localdomain (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 e10-20020a056000194a00b0030497b3224bsm21374699wry.64.2023.06.15.08.48.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Jun 2023 08:48:38 -0700 (PDT)
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
X-Inumbo-ID: 189f4e00-0b94-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1686844118; x=1689436118;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WqvJ9lDw5wAI+BX6sbDIqPcE8HO42JuEoFJ4XXLoAX4=;
        b=XYU46Ecf8oPKWIAttJRbkJIDmE7B4Mgbs+t0+mp19FWdQeVacmPVbbxPq4bYIWWOUD
         7fMtacvHGoDNXqzaYw8r1vx3Z7MMc4CfpJXm58qvUjsog5po8NpX/ChfP9w/QYm3fl+P
         4rMzRT8TjSjqWa8IKunrv2TIOePWWyaqiG2bk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686844118; x=1689436118;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WqvJ9lDw5wAI+BX6sbDIqPcE8HO42JuEoFJ4XXLoAX4=;
        b=PYV9BW+h20XfMyMjj1+sp52ybRBhyXfiU/slt7A/ue2PWe6NGqzXbYxAPg4uc42oIZ
         fwQ61Nz8EAzXzmy+Iduf4Gc0aIO/NXMZF00C6EG6oZmVLJWUiqdYJ0xO7FveQCZeDsBk
         UMTCkN1o7BBmIElRrSTc3EvUQhuJ+cFN2z6XhcbCIaiVongBF7RP0DCY3T9uzv5ozMO+
         Fn57HYRjhvBRNcKFpzbZeBMj0QsbzJWoaFzk6re0BuNTfjfTP5BNUjhi6t9r+u5yS4FF
         bCRIVDdTbEqZrB5pAxjcMYtkX9j5yDdGr5o0955jiRf4LT//znNswFyhZirnkgrFGLDC
         1vDw==
X-Gm-Message-State: AC+VfDyuIdVc3X33X3OceNSQDe2mXYm8vLd4tdGFDAVHqpaO/uM/tcPz
	A6/53RnmDYa8m5nS72OzJgbfVFDdfB/D0yrhK2I=
X-Google-Smtp-Source: ACHHUZ5m4IR9l1MMO7wl+JUYZSl8XJRtMh12kHAJgktepYIzPRZ9w4YiZ8UVQ9d0uAk4BIKUSEqlXA==
X-Received: by 2002:a5d:54d2:0:b0:311:13a7:2d87 with SMTP id x18-20020a5d54d2000000b0031113a72d87mr2122511wrv.66.1686844118433;
        Thu, 15 Jun 2023 08:48:38 -0700 (PDT)
From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Alejandro Vallejo <alejandro.vallejo@cloud.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v2 0/5] Prevent attempting updates known to fail
Date: Thu, 15 Jun 2023 16:48:29 +0100
Message-Id: <20230615154834.959-1-alejandro.vallejo@cloud.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

v3:
  * Lots of hunks moved around. Individually mentioned in each patch
  * Removed a redundant check
  * Ignore microcode interface if the revision is -1
  * Perform the DIS_MCU_LOAD checks during init rather than apply time


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

Patch 1 Does the refactors to allow collecting cpu info on systems with
        microcode updates disabled

Patch 2 Isolates early_microcode_init() per-vendor logic in per-vendor
        functions

Patch 3 Recognizes microcode revision of -1 as a hint meaning "don't use the
        microcode interface".

Patch 4 Moves the MSR_ARCH_CAPS read from tsx_init() to
        early_microcode_init()

Patch 5 Adds the logic to detect microcode updates being disabled on Intel.

Alejandro Vallejo (5):
  x86/microcode: Allow reading microcode revision even if it can't be
    updated
  x86/microcode: Create per-vendor microcode_ops builders
  x86/microcode: Ignore microcode loading interface for revision = -1
  x86: Read MSR_ARCH_CAPS immediately after early_microcode_init()
  x86/microcode: Disable microcode update handler if DIS_MCU_UPDATE is
    set

 xen/arch/x86/cpu/common.c             |  5 ++++
 xen/arch/x86/cpu/microcode/amd.c      | 16 +++++++----
 xen/arch/x86/cpu/microcode/core.c     | 41 ++++++++++++++++++++-------
 xen/arch/x86/cpu/microcode/intel.c    | 27 ++++++++++++++----
 xen/arch/x86/cpu/microcode/private.h  | 19 ++++++++++++-
 xen/arch/x86/include/asm/cpufeature.h |  1 +
 xen/arch/x86/include/asm/msr-index.h  |  5 ++++
 xen/arch/x86/tsx.c                    | 15 ++--------
 8 files changed, 93 insertions(+), 36 deletions(-)

-- 
2.34.1


