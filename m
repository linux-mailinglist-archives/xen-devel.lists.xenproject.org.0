Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A8EFF722D55
	for <lists+xen-devel@lfdr.de>; Mon,  5 Jun 2023 19:09:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.543817.849109 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q6Dgw-0001vi-Uw; Mon, 05 Jun 2023 17:08:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 543817.849109; Mon, 05 Jun 2023 17:08:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q6Dgw-0001pd-M3; Mon, 05 Jun 2023 17:08:26 +0000
Received: by outflank-mailman (input) for mailman id 543817;
 Mon, 05 Jun 2023 17:08:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dNO+=BZ=tibco.com=avallejo@srs-se1.protection.inumbo.net>)
 id 1q6Dgv-0001hK-8w
 for xen-devel@lists.xenproject.org; Mon, 05 Jun 2023 17:08:25 +0000
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [2a00:1450:4864:20::32e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 931a5fec-03c3-11ee-8611-37d641c3527e;
 Mon, 05 Jun 2023 19:08:21 +0200 (CEST)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-3f7378a75c0so14609885e9.3
 for <xen-devel@lists.xenproject.org>; Mon, 05 Jun 2023 10:08:21 -0700 (PDT)
Received: from localhost.localdomain (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 b3-20020a5d4d83000000b0030c4d8930b1sm10247405wru.91.2023.06.05.10.08.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Jun 2023 10:08:20 -0700 (PDT)
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
X-Inumbo-ID: 931a5fec-03c3-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1685984901; x=1688576901;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=BxAN7ZJqZgXBmrgHdZW7qym5luDTyymN4x+VG5t/p10=;
        b=DzxWjxrnc541pahAA3nG8MhbZgpOolJmw4Fg9QLMJEPKUGwJM2mOELSGlIpyfjeU7h
         rqN4lhl3MXgNMibimZ1G0kwln9gweBTO3uyzTiia+4DgVDJAcs5dQ0N/ADLaLYPGxZIN
         kvCUlQZ33JAt44nHMefHhkfcqi2qlf72KKutU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685984901; x=1688576901;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BxAN7ZJqZgXBmrgHdZW7qym5luDTyymN4x+VG5t/p10=;
        b=Q76sTr8669BAADG/o4ObJwL92rh3hjXgFTY6J4MDFaOiuM/TOxkg+VT1W5dYbm5w66
         phlRJfShmD1CJ1KXHhrRQZsowiXIN40chfi/+jR5Ni0ntrf7EDkbaPwgdxJf7grLB9MS
         28UP2JyhYvsVPOTLIUdF65oHyoRF/CsMr9AQijDxwvuchvisLiHFrlqWfGLqD+QdrgTa
         FROj67ABFuVWwK8o2lV0afVXoAEl3U0BiNYVY/lgjAkEqNzDFeFHl6qtUZkb+nmcu7bq
         PzGGsy2PnoCfzSfSk0hLk26bkexuncHr65qWrokYJfr8tlGfFvi7kHp4qUmz7DvbG9d3
         p6sg==
X-Gm-Message-State: AC+VfDwvsH+pKWEKeWdaggs7MhCBh75CVksrT4h233eESPWOAhyS0IBD
	bVaQaj017wFg0sU0iG8mrwcZDiv7T79dwLq5h3M=
X-Google-Smtp-Source: ACHHUZ5xQAGYp5OaSB5tLoDjEH2hpCqFXpvZG91iOogkNk1el8YW4K4c8hST4bzL6ZZc8+662GfP8Q==
X-Received: by 2002:a05:600c:b47:b0:3f6:5169:1ad5 with SMTP id k7-20020a05600c0b4700b003f651691ad5mr7447472wmr.38.1685984900993;
        Mon, 05 Jun 2023 10:08:20 -0700 (PDT)
From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Alejandro Vallejo <alejandro.vallejo@cloud.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v2 0/4] Prevent attempting updates known to fail
Date: Mon,  5 Jun 2023 18:08:13 +0100
Message-Id: <20230605170817.9913-1-alejandro.vallejo@cloud.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

  [This series spun out of a previous patch with the same name, with this
   series adding more related enhancements. Kept as v2 to preserve the
   linkage with previous suggestions.]

v2:
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

Patch 1 removes a redundant family check in the Intel init path.

Patch 2 moves an early read of MSR_ARCH_CAPS from tsx_init() back to
        immediately after the early microcode load.

Patch 3 Recognizes microcode revision of -1 as a hint meaning "don't use the
        microcode interface".

Patch 4 Adds support for DIS_MCU_LOAD during init time.

Alejandro Vallejo (4):
  x86/microcode: Remove Intel's family check on early_microcode_init()
  x86: Read MSR_ARCH_CAPS after early_microcode_init()
  x86/microcode: Ignore microcode loading interface for revision = -1
  x86/microcode: Prevent attempting updates if DIS_MCU_LOAD is set

 xen/arch/x86/cpu/microcode/core.c     | 79 +++++++++++++++++++++++++--
 xen/arch/x86/include/asm/cpufeature.h |  1 +
 xen/arch/x86/include/asm/msr-index.h  |  5 ++
 xen/arch/x86/tsx.c                    | 15 +----
 4 files changed, 82 insertions(+), 18 deletions(-)

-- 
2.34.1


