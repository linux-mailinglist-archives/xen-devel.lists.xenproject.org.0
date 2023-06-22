Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C89173A786
	for <lists+xen-devel@lfdr.de>; Thu, 22 Jun 2023 19:42:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.553876.864709 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qCOKA-0007RJ-9R; Thu, 22 Jun 2023 17:42:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 553876.864709; Thu, 22 Jun 2023 17:42:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qCOKA-0007LL-5E; Thu, 22 Jun 2023 17:42:26 +0000
Received: by outflank-mailman (input) for mailman id 553876;
 Thu, 22 Jun 2023 17:42:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VOAB=CK=tibco.com=avallejo@srs-se1.protection.inumbo.net>)
 id 1qCOK8-00072r-EN
 for xen-devel@lists.xenproject.org; Thu, 22 Jun 2023 17:42:24 +0000
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [2a00:1450:4864:20::429])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 24522617-1124-11ee-8611-37d641c3527e;
 Thu, 22 Jun 2023 19:42:22 +0200 (CEST)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-3129c55e1d1so1032149f8f.0
 for <xen-devel@lists.xenproject.org>; Thu, 22 Jun 2023 10:42:22 -0700 (PDT)
Received: from localhost.localdomain (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 j11-20020a5d604b000000b003078681a1e8sm7558457wrt.54.2023.06.22.10.42.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Jun 2023 10:42:21 -0700 (PDT)
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
X-Inumbo-ID: 24522617-1124-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1687455741; x=1690047741;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UD8KMlkNYxYoncLEvbCCVk2CDjabIoi/rUQSLbrLffo=;
        b=k/5fkjb4c2EKos95B/o4RAX8AdVMa4OWeYZOCZIiTHx0PTUWQyZtog+fVyV1Ed6Edh
         +v7aQcmhK83A0U1no6+n4jCfMgGDID1C8ZLGj8SyFa68pWNTkT05dsY5PErQhaqAZh/0
         +tIHr43VWbQD48kYSyN8iwmtJqf/ouh2Kf42w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687455741; x=1690047741;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UD8KMlkNYxYoncLEvbCCVk2CDjabIoi/rUQSLbrLffo=;
        b=PemnoNEsRqQsKV8OvaQazQCdSO8tw9BlbRgBK8DOUgxGN4Ow7TNQptGbfWmg1nfti3
         F/V6bbpfAEf+SpMAY2WG6HfmDApKaLHP2YvCbBgp3LoWV565QEHpmIiGScn7NAj1sOY6
         CKOgJKLCA2dR6M4x2co7mljolJ3o1pTPKyj6OgIdBlGusEJJnCmK9nfxQ1qPfpFQwc/2
         c/+tnxFGUSyVC2i96qMhLV2LuFGXFCsC91mheJuhBPA/BiuNWd+lHnw8TymJ8hkXAzbf
         JfzDwrATI4Vy+U5Rl2AhL6QsYTin7AuIquYjDu5KWCiB0uV8M8AUoszDiuqRd6zYLpxI
         wMYg==
X-Gm-Message-State: AC+VfDz7PjlqtIvJ290g2Xi7PPtD2YvoBrKY5ZB25nWRLlFXYywTdJZy
	sGuKulIV6gt+Y69QPf3sQkAXQQV/UATQhlBj9JE=
X-Google-Smtp-Source: ACHHUZ67s7VwNg/hrM0I3gi23lRMOc/+CSZ3RRfeCxDG9cU011ivtvbjExHFQT/rBo/YZf+8oIT7KA==
X-Received: by 2002:a5d:4387:0:b0:311:1108:96ac with SMTP id i7-20020a5d4387000000b00311110896acmr18469503wrq.52.1687455741570;
        Thu, 22 Jun 2023 10:42:21 -0700 (PDT)
From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Alejandro Vallejo <alejandro.vallejo@cloud.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v4 0/4] Prevent attempting updates known to fail
Date: Thu, 22 Jun 2023 18:42:15 +0100
Message-Id: <20230622174219.8871-1-alejandro.vallejo@cloud.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

v4:
  * The refactor Andrew asked for to avoid a conditional check on
    early_microcode_init(). I'm not convinced it's clearer, but it's not
    much more complicated either, so I don't mind.
  * Removed microcode_ops builders in favour of a separate Intel-specific
    function to check whether the system can load new microcode. This keeps
    the static structs in the right sections.

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

Patch 1 Introduces the logic to print the microcode revision if at all
        possible

Patch 2 Ignores microcode facilities when the current microcode revision is -1

Patch 3 Moves the MSR_ARCH_CAPS read in tsx_init() to early_cpu_init() and
        early_microcode_init()

Patch 4 Adds the logic to detect microcode updates being disabled on Intel.

Alejandro Vallejo (4):
  x86/microcode: Allow reading microcode revision even if it can't be
    updated
  x86/microcode: Ignore microcode loading interface for revision = -1
  x86: Read MSR_ARCH_CAPS immediately after early_microcode_init()
  x86/microcode: Disable microcode update handler if DIS_MCU_UPDATE is
    set

 xen/arch/x86/cpu/common.c             |  5 ++++
 xen/arch/x86/cpu/microcode/core.c     | 41 +++++++++++++++++++++++----
 xen/arch/x86/cpu/microcode/intel.c    | 13 +++++++++
 xen/arch/x86/cpu/microcode/private.h  |  7 +++++
 xen/arch/x86/include/asm/cpufeature.h |  1 +
 xen/arch/x86/include/asm/msr-index.h  |  5 ++++
 xen/arch/x86/tsx.c                    | 16 +++--------
 7 files changed, 70 insertions(+), 18 deletions(-)

-- 
2.34.1


