Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FA9C712907
	for <lists+xen-devel@lfdr.de>; Fri, 26 May 2023 17:01:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.540128.841644 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q2Yw0-00013F-8Y; Fri, 26 May 2023 15:00:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 540128.841644; Fri, 26 May 2023 15:00:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q2Yw0-00010I-37; Fri, 26 May 2023 15:00:52 +0000
Received: by outflank-mailman (input) for mailman id 540128;
 Fri, 26 May 2023 15:00:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EF2/=BP=tibco.com=avallejo@srs-se1.protection.inumbo.net>)
 id 1q2Yvy-0000zw-TD
 for xen-devel@lists.xenproject.org; Fri, 26 May 2023 15:00:50 +0000
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [2a00:1450:4864:20::436])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 19407304-fbd6-11ed-b230-6b7b168915f2;
 Fri, 26 May 2023 17:00:48 +0200 (CEST)
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-30add74cc30so264575f8f.3
 for <xen-devel@lists.xenproject.org>; Fri, 26 May 2023 08:00:48 -0700 (PDT)
Received: from localhost.localdomain (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 y9-20020a5d4709000000b00307d58b3da9sm5360033wrq.25.2023.05.26.08.00.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 May 2023 08:00:47 -0700 (PDT)
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
X-Inumbo-ID: 19407304-fbd6-11ed-b230-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1685113248; x=1687705248;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=C28wxsizkvytBc8ueJDeuJt4h314LQLVAiDr/nIoKrw=;
        b=YAKsBSL5leCDi1kBLrOfpLfnxJcwXqlq2zFIFA9Zmba9uzXgbpEt1/edQBsKeGY2ow
         jAJKv9jsu3bCh6wCPW4r+CwuZj7GWkDNdndYfs88W59JURSJry7BesL5UWHt5TSuVIaC
         fKmTIPekn6XJnFVSrzpbEupsoIP2A5EqXOByM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685113248; x=1687705248;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=C28wxsizkvytBc8ueJDeuJt4h314LQLVAiDr/nIoKrw=;
        b=Euwy6dgJBCVoFPhtsAoR3c5hUER27FwNoJKdNTdHmxEiXSHq/kXNUmTKLTH1VxKExX
         UkqGZiFP7k/np5VfvfeAZebkChKOBbEYuRnVT84pkyl7Tf3XyjloXi3iJepiZFJHjIcr
         XRzveKt6mAxJMf/BlowbCC/BVGWdXU5ANGvN/by9Vt7ngpGUnVJ5EDDAYNQG5OFwrJxs
         QrLmGKNDIgi4H8mLVx+nP1WglyPHiO+Uqo2yhuZHGtQ5SbNJrkFTRoDpAJaxwnexgZvu
         yXAwZade1QQ7UwSMopTgcyR1UZQwUu47BU3j2WcpwCzAawHSeL0Fw7JbOyq8AORJxIuK
         Uy2w==
X-Gm-Message-State: AC+VfDzp6u5E/GFlFX3+bGNEae1M6LhkAn2/alN5VtAsapqUJlcs9wX2
	2aQmQOa3IOrfdPVLVH4lF4HZDoTa5OPDvJcVM+g=
X-Google-Smtp-Source: ACHHUZ58CsujQt2FRr6ZgH9ICKzc1N7vEfbKrbuhNPCY2+Ia+n86KmeK3JhFkeKt0m5/h4IAQh4+7Q==
X-Received: by 2002:a5d:44c8:0:b0:309:3b8d:16a8 with SMTP id z8-20020a5d44c8000000b003093b8d16a8mr1828847wrr.50.1685113247790;
        Fri, 26 May 2023 08:00:47 -0700 (PDT)
From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Alejandro Vallejo <alejandro.vallejo@cloud.com>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Juergen Gross <jgross@suse.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH 0/3] Add Automatic IBRS support
Date: Fri, 26 May 2023 16:00:41 +0100
Message-Id: <20230526150044.31553-1-alejandro.vallejo@cloud.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Adds support for AMD's Automatic IBRS. It's a set-and-forget feature that
prevents lower privileged executions from affecting speculations of higher
privileged executions, so retpolines are not required. Furthermore, it
clears the RSB upon VMEXIT, so we can avoid doing it if the feature is
present.

Patch 1 adds the relevant bit definitions for CPUID and EFER.

Patch 2 Hooks up AutoIBRS to spec_ctrl. so it's used when IBRS is picked.
        It also tweaks the heuristics so AutoIBRS is preferred over
        retpolines as BTI mitigation. This is enough to protect Xen.

Patch 3 exposes the feature to HVM guests.

Alejandro Vallejo (3):
  x86: Add bit definitions for Automatic IBRS
  x86: Add support for AMD's Automatic IBRS
  x86: Expose Automatic IBRS to guests

 tools/libs/light/libxl_cpuid.c              |  1 +
 tools/misc/xen-cpuid.c                      |  2 +
 xen/arch/x86/hvm/hvm.c                      |  3 ++
 xen/arch/x86/include/asm/cpufeature.h       |  1 +
 xen/arch/x86/include/asm/msr-index.h        |  4 +-
 xen/arch/x86/pv/emul-priv-op.c              |  4 +-
 xen/arch/x86/setup.c                        |  3 ++
 xen/arch/x86/smpboot.c                      |  3 ++
 xen/arch/x86/spec_ctrl.c                    | 52 +++++++++++++++------
 xen/include/public/arch-x86/cpufeatureset.h |  1 +
 10 files changed, 56 insertions(+), 18 deletions(-)

-- 
2.34.1


