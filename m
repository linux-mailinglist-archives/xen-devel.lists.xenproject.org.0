Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 52BDF86FD42
	for <lists+xen-devel@lfdr.de>; Mon,  4 Mar 2024 10:23:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.688226.1072173 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rh4XR-0002sG-1Z; Mon, 04 Mar 2024 09:23:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 688226.1072173; Mon, 04 Mar 2024 09:23:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rh4XQ-0002po-VC; Mon, 04 Mar 2024 09:23:12 +0000
Received: by outflank-mailman (input) for mailman id 688226;
 Mon, 04 Mar 2024 09:23:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=o7cd=KK=cloud.com=fouad.hilly@srs-se1.protection.inumbo.net>)
 id 1rh4XP-0002pf-2v
 for xen-devel@lists.xenproject.org; Mon, 04 Mar 2024 09:23:11 +0000
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [2a00:1450:4864:20::635])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d1020d8f-da08-11ee-afda-a90da7624cb6;
 Mon, 04 Mar 2024 10:23:09 +0100 (CET)
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-a44665605f3so442841566b.2
 for <xen-devel@lists.xenproject.org>; Mon, 04 Mar 2024 01:23:09 -0800 (PST)
Received: from fhilly.citrite.net (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 tj10-20020a170907c24a00b00a444526962asm4485529ejc.128.2024.03.04.01.23.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Mar 2024 01:23:08 -0800 (PST)
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
X-Inumbo-ID: d1020d8f-da08-11ee-afda-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1709544188; x=1710148988; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=o0ewBdo6BsfAu1040fP9UTBBK6xWae8Y+hi5LU8havE=;
        b=Gnrh8cAEUAUwwTWE7ZbwZ8fVcA6YMVBWavMVqOOG1k8YbSR8XM/DZbAHwJn3+BpPQu
         57B8yJnlFQslINOJyR7zob8ctfNzowLitAubZy+c/j9vSY2V21iRpgB0JkBcaRmp9abj
         zhdJlqTOlgUspwNbgN0F7ANVccmvfYDpUPrBw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709544188; x=1710148988;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=o0ewBdo6BsfAu1040fP9UTBBK6xWae8Y+hi5LU8havE=;
        b=w1Ol6R709t8z7tyLDyvOq91dR0iwslxJMoivnVZiIPXRtBVpzhfWKjoRmkdLUo7kJ5
         Fz+yUHi0ghu4rgqUPBwsNTo6hfs3cGD1I95BS+e2kSHhFPLlr4MEfZi+a0Ondp3xCUV9
         CeWIs28lmN4SQY8Wen3Gb3THd2qQHJ1fvDZq1ohSBC4tn2YQjVS7hjqHGesVhzzt0TaH
         0QuCsy5utSgDZ5cDG1Jk7v75J8FWA7ANfVrjPENhOQ0TkSzcQDpapne7iYiVfI7xEdzU
         Jcz/92NOkXQ1YTCTU6D8c96ZEQ6VsMGhPQXsy9SWvQir9iyxPQl+sbnLDdk7py2YHSFY
         ODiA==
X-Gm-Message-State: AOJu0Yz6+Wg+GUVOfDm+dqs24oZAVxvwHwPgTsTB1VoBnut/VrA42hUX
	yUJjggNDr4zjtx/Ocoafjz4K0fAzBLDxJTyhi+GpXqM4R1cs3IwvuddZiajZzDAXS+IH76Vm6Ai
	/Jdg=
X-Google-Smtp-Source: AGHT+IFPfluwiGoetkbsjHf5zwBeO9ZF6E4qDYdlBdWZFuWv+0qr71+F0BkI6MfGY9QS1Jc54mkuEg==
X-Received: by 2002:a17:907:11c1:b0:a44:790d:6a with SMTP id va1-20020a17090711c100b00a44790d006amr5716989ejb.4.1709544188293;
        Mon, 04 Mar 2024 01:23:08 -0800 (PST)
From: Fouad Hilly <fouad.hilly@cloud.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Fouad Hilly <fouad.hilly@cloud.com>,
	Wei Liu <wei.liu2@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Wei Liu <wl@xen.org>,
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Paul Durrant <paul@xen.org>,
	Jun Nakajima <jun.nakajima@intel.com>,
	Kevin Tian <kevin.tian@intel.com>
Subject: [PATCH 0/3] X86/eager-fpu: Switch to eager fpu save/restore
Date: Mon,  4 Mar 2024 09:13:04 +0000
Message-ID: <20240304091307.2295344-1-fouad.hilly@cloud.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

X86 Xen will only eagerly switch FPU context in the scheduler.
Xen itslef won't set CR0.TS other than for the purpose of servicing
a PV guset.

Signed-off-by: Wei Liu <wei.liu2@citrix.com>
Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
Signed-off-by: Fouad Hilly <fouad.hilly@cloud.com>
---
CC: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>
CC: "Roger Pau Monné" <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
CC: George Dunlap <george.dunlap@citrix.com>
CC: Julien Grall <julien@xen.org>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Paul Durrant <paul@xen.org>
CC: Jun Nakajima <jun.nakajima@intel.com>
CC: Kevin Tian <kevin.tian@intel.com>

Wei Liu (3):
  x86: i387.c cleanup
  x86: introduce xstate_zero
  x86: switch to eager fpu save / restore

 xen/arch/x86/cpu/common.c                    |   3 -
 xen/arch/x86/domain.c                        |  10 +-
 xen/arch/x86/domctl.c                        |   4 +-
 xen/arch/x86/hvm/emulate.c                   |  38 +----
 xen/arch/x86/hvm/hvm.c                       |   8 +-
 xen/arch/x86/hvm/svm/nestedsvm.c             |  62 +------
 xen/arch/x86/hvm/svm/svm.c                   |  81 +--------
 xen/arch/x86/hvm/svm/vmcb.c                  |   4 +-
 xen/arch/x86/hvm/vlapic.c                    |   4 -
 xen/arch/x86/hvm/vmx/vmcs.c                  |   8 +-
 xen/arch/x86/hvm/vmx/vmx.c                   |  70 +-------
 xen/arch/x86/hvm/vmx/vvmx.c                  |  15 +-
 xen/arch/x86/i387.c                          | 170 +++++--------------
 xen/arch/x86/include/asm/domain.h            |   3 -
 xen/arch/x86/include/asm/hvm/svm/nestedsvm.h |   3 -
 xen/arch/x86/include/asm/hvm/vmx/vmcs.h      |   2 -
 xen/arch/x86/include/asm/i387.h              |   3 +-
 xen/arch/x86/include/asm/xstate.h            |  18 +-
 xen/arch/x86/pv/misc-hypercalls.c            |   3 +-
 xen/arch/x86/traps.c                         |  18 +-
 xen/arch/x86/xstate.c                        |  65 ++++---
 xen/common/domain.c                          |   2 -
 xen/common/efi/runtime.c                     |   9 +-
 xen/include/xen/sched.h                      |   4 -
 24 files changed, 108 insertions(+), 499 deletions(-)

-- 
2.42.0


