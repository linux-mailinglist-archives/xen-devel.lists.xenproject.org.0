Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EACD8773A56
	for <lists+xen-devel@lfdr.de>; Tue,  8 Aug 2023 15:03:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.579802.907948 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTMNB-0005ya-9q; Tue, 08 Aug 2023 13:03:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 579802.907948; Tue, 08 Aug 2023 13:03:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTMNB-0005vg-6k; Tue, 08 Aug 2023 13:03:41 +0000
Received: by outflank-mailman (input) for mailman id 579802;
 Tue, 08 Aug 2023 13:03:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Gjkb=DZ=tibco.com=avallejo@srs-se1.protection.inumbo.net>)
 id 1qTMN9-0003KL-NR
 for xen-devel@lists.xenproject.org; Tue, 08 Aug 2023 13:03:39 +0000
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [2a00:1450:4864:20::42d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fe04cde5-35eb-11ee-b280-6b7b168915f2;
 Tue, 08 Aug 2023 15:03:39 +0200 (CEST)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-317798b359aso4301263f8f.1
 for <xen-devel@lists.xenproject.org>; Tue, 08 Aug 2023 06:03:39 -0700 (PDT)
Received: from localhost.localdomain (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 t6-20020adfe446000000b003179b3fd837sm13699587wrm.33.2023.08.08.06.03.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Aug 2023 06:03:38 -0700 (PDT)
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
X-Inumbo-ID: fe04cde5-35eb-11ee-b280-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1691499818; x=1692104618;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=CLQCJAr0rC6dxrW2X+lLr/OB58MmuMcxotnvqWKYPbM=;
        b=UGPW1p2RXholxwOATeLDNTjmIUchwn+XV6jwctj/fYgqKK2cprRWTt7kO8lOCq50Kp
         JptcMxuQEndlNW29pSLDdyMxWfWBi5kN1IO51HdLDsnCvjQko6bmZ3RjJEBfvfE4KwDm
         k8nuNQpdXTr8ju1inovh6r4pp7HOp+O4TxS0Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691499818; x=1692104618;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CLQCJAr0rC6dxrW2X+lLr/OB58MmuMcxotnvqWKYPbM=;
        b=CYEZwQi3qXV66D6zEoSorq1VSc1dgCMr36N80wUuobhnjDlMIaHtP0dwvPxGd1DMTP
         wXovoQPk3NY+pOY+EHYJhCh41HPw+TGjCfN/zezsBbvDzJC4mAGEMLRMLIscJcEDBqjY
         wpykUNU9kfvD/2fngIXQTAUMVdlXa8UkoO/O3hq+dmAohYxRBwhOubu63tlD78OR0zYW
         Q+kUWaF4bSGPPEs1/7ZjqeJDSuypwcHyYDkZGNEWrA7565sWbDkmW6WR4p5oHOEa9SHE
         +5W1rbYxnuDcRfyuNDfq6vYJJLzvFoJSQ6q71AAQKBYOV9sPyi6MOUCGxEmYJcZF46GI
         cwJg==
X-Gm-Message-State: AOJu0YzmH1vA+BhF3rA8j7hQ4NIQ3HrVNaFp++1hFdZn2IFxK0rVC+/p
	L6U/McBdY+KJA/rzk5vmGIigVjFC+UxNjMusSoU=
X-Google-Smtp-Source: AGHT+IFFliAuXIbhDdB6fd04YO90HpZVHVdq6h+VWGjhQ8tReKodm6RNfQoaKVgmVhWpbeJuEFtMdw==
X-Received: by 2002:adf:ce90:0:b0:314:3b02:a8a8 with SMTP id r16-20020adfce90000000b003143b02a8a8mr7914781wrn.55.1691499818483;
        Tue, 08 Aug 2023 06:03:38 -0700 (PDT)
From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Alejandro Vallejo <alejandro.vallejo@cloud.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v7 0/3] Prevent attempting updates known to fail
Date: Tue,  8 Aug 2023 14:03:28 +0100
Message-Id: <20230808130331.27995-1-alejandro.vallejo@cloud.com>
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


