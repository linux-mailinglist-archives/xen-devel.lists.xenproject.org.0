Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B6475AB9035
	for <lists+xen-devel@lfdr.de>; Thu, 15 May 2025 21:52:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.985912.1371679 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uFebh-0003W5-MX; Thu, 15 May 2025 19:51:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 985912.1371679; Thu, 15 May 2025 19:51:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uFebh-0003UQ-Jp; Thu, 15 May 2025 19:51:05 +0000
Received: by outflank-mailman (input) for mailman id 985912;
 Thu, 15 May 2025 19:51:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=us+D=X7=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1uFebf-0003UK-Al
 for xen-devel@lists.xenproject.org; Thu, 15 May 2025 19:51:03 +0000
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [2a00:1450:4864:20::329])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id edcb4ead-31c5-11f0-9eb6-5ba50f476ded;
 Thu, 15 May 2025 21:51:02 +0200 (CEST)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-43ede096d73so9602105e9.2
 for <xen-devel@lists.xenproject.org>; Thu, 15 May 2025 12:51:02 -0700 (PDT)
Received: from localhost.localdomain (host-92-26-98-202.as13285.net.
 [92.26.98.202]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a35ca5a03fsm440925f8f.22.2025.05.15.12.50.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 May 2025 12:51:00 -0700 (PDT)
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
X-Inumbo-ID: edcb4ead-31c5-11f0-9eb6-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1747338661; x=1747943461; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wZCZBNec/jVK5fwnZ+1Uw9LNKLMvJb8VoV7F4Xuquk0=;
        b=tMzsb8N9LRsPiA6RTj8MZwxp2XIOUY9CwVNlymS2DU6Uat0d3AQd4hnWAepHE1hG3o
         upjHPoS6k+WmeFYUcyF7xlGBYMhI+ErYNAfxEqRcnuTGU8ygSKwXmO9IT6SVUf9jwNw9
         NZEO1SreiVVrDTdnchFbJrck8CL6VoAOEbPss=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747338661; x=1747943461;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wZCZBNec/jVK5fwnZ+1Uw9LNKLMvJb8VoV7F4Xuquk0=;
        b=UC9KQ9l+r4n79hq2WF18eBwbMP7F3FDzzi4mbKGWKdavuByww5dEc+4SCplwpbnMGK
         Om5i/cnuz3eQI6+ym7BWteGLzYl3FokkeTowjc1tsEDThNY51mukEoq5fijK5UHhXQrT
         mataS+31izLuebuh2P59/hdzSqJSSkwhWvd3TRSRl+pL4cWM8RmilhAaeYj2+jR4PrLO
         hEhQRZbmpzwF7bS6WwzYG9F7omeKmSFvgIVT+ef2HmUbctXlppojwcNT8Rzy/c+5hiFk
         cQam3KgRTnbhO3R4phsvxflDs5DkC9eu005YjwqUeKYCMjZP0rEupx1ZSagBfHz0Qiao
         X0iw==
X-Gm-Message-State: AOJu0YxDZwr424gswtoxYK6PmrDemc+9wk5JUQgab6RE3aNtXoLuAOH+
	08rQkYKwBBINLB39diZ8vSkbWFRSm8RVg+IrI9VZjMlKAx/jpAw7oKsTpMnwgFcVap8qca2iIzW
	ZSJXC
X-Gm-Gg: ASbGncv7SzlLOq0IsP3skVo5qtqtPPq14kCkNlq0qgFrDkZXTI1aP2OO7wJMSgSIUEa
	Moev18peMewzbi0hPGKCSknS5fYX6ukcvXe8TzNa+NpJRYsulCc6/1woZph/E5OPZFc8tUEtzt1
	nq6HRuetgUvZIH+yKvann7ZojRNZviaxm2RL27UVx5nUJ6k2quXyJN6YxrvkAYAvskM8XeoJ3nC
	yVLGsGfQhJMMuTeFpRnVNYCrRXnoAPUoOUMEA8YhkD6+xNmQeoHNcs9uAh5u4P21fEmuQrCexuq
	x8VFvXivIrvrdrJaq5yCgFKerqYra174y/ofTzwW28YwB8dockcCezCHKYHc2nDBKazAzMdGSlr
	Ixc1hTeIpWX/MTZ9BYaFOVNFQ
X-Google-Smtp-Source: AGHT+IFszA5YjZ5ZvW5f7Xazk+EHALOzN3nZl0b1KoykWFrj8R2/CkzPzeyUlp8lWJcY2IrT38QAdw==
X-Received: by 2002:a05:600c:4e52:b0:43d:db5:7af8 with SMTP id 5b1f17b1804b1-442fd665cd3mr6535455e9.21.1747338660834;
        Thu, 15 May 2025 12:51:00 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Nicola Vetrini <nicola.vetrini@bugseng.com>,
	"consulting @ bugseng . com" <consulting@bugseng.com>
Subject: [PATCH for-4.20] x86/emul: Fix emulation of RDSEED with older toolchains
Date: Thu, 15 May 2025 20:50:58 +0100
Message-Id: <20250515195058.3702872-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This is reported as a MISRA R16.3 (missing break) violation, but turns out to
be substantially more complicated than expected.

In commit a8fe4ec5320a ("x86emul: support RDRAND/RDSEED"), the switch()
statement had a default case going to cannot_emulate, with both the case 6 and
case 7 labels being fully within #ifdef HAVE_GAS_RD{RAND,SEED}.

Therefore, when the toolchain didn't understand the RDRAND/RDSEED
instructions, attempts to emulate them suffered #UD.  (This is arguably a
problem as there's no interlock to prevent RDRAND/RDSEED being advertied to
the guest, but as instructions with only register encodings, they can only end
up being emulated with VM Introspection is in use.)

In commit 58f1bba44033 ("x86emul: support RDPID"), case 7 was taken outside of
HAVE_GAS_RDSEED, meaning that emulating an RDSEED instruction no longer hit
the default case when the toolchain was too old.

Instead, it would fall out of the switch statment and be completed normally,
behaving as a NOP to the guest.

Retrofit a "return X86EMUL_UNIMPLEMENTED" in the case that the toolchain
doesn't know the RDRAND instruction, matching how RDRAND work.

Note that this has been fixed differently in Xen 4.21.  Commit
05bf9f1f0f52 ("x86/emulate: Remove HAVE_AS_RDRAND and HAVE_AS_RDSEED") has
removed the problematic condition due to the toolchain baseline upgrade.

Fixes: 58f1bba44033 ("x86emul: support RDPID")
Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Nicola Vetrini <nicola.vetrini@bugseng.com>
CC: consulting@bugseng.com <consulting@bugseng.com>

This will unblock the staging-4.20 branch.

I'm still concerned as to why this regression has shown up unexpected in the
4.20 branch.  In 4.19, the rule isn't marked clean, hence why that passes.

However, something changed in the Eclair environment to cause this to happen,
and given how HAVE_AS_RDSEED works, it's apparently to do with probing the
toolchain capabitilies, and now failing to probe correctly.
---
 xen/arch/x86/x86_emulate/0fc7.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/xen/arch/x86/x86_emulate/0fc7.c b/xen/arch/x86/x86_emulate/0fc7.c
index 5268d5cafd7b..2b6b444bab94 100644
--- a/xen/arch/x86/x86_emulate/0fc7.c
+++ b/xen/arch/x86/x86_emulate/0fc7.c
@@ -102,6 +102,8 @@ int x86emul_0fc7(struct x86_emulate_state *s,
             if ( carry )
                 regs->eflags |= X86_EFLAGS_CF;
             break;
+#else
+            return X86EMUL_UNIMPLEMENTED;
 #endif
         }
     }

base-commit: 612cfd7215568fe8a7e8939dfcc4bf53d986e482
-- 
2.39.5


