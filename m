Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E18E7B28767
	for <lists+xen-devel@lfdr.de>; Fri, 15 Aug 2025 22:51:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1083958.1443478 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1un1O3-0006HY-7n; Fri, 15 Aug 2025 20:50:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1083958.1443478; Fri, 15 Aug 2025 20:50:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1un1O3-0006G4-4m; Fri, 15 Aug 2025 20:50:55 +0000
Received: by outflank-mailman (input) for mailman id 1083958;
 Fri, 15 Aug 2025 20:50:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=oFbR=23=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1un1F1-0005Rl-6N
 for xen-devel@lists.xenproject.org; Fri, 15 Aug 2025 20:41:35 +0000
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [2a00:1450:4864:20::32e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3ae662db-7a18-11f0-b898-0df219b8e170;
 Fri, 15 Aug 2025 22:41:33 +0200 (CEST)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-45a1b0c8867so17685085e9.3
 for <xen-devel@lists.xenproject.org>; Fri, 15 Aug 2025 13:41:33 -0700 (PDT)
Received: from localhost.localdomain (host-195-149-20-212.as13285.net.
 [195.149.20.212]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3bb5d089e07sm3153924f8f.0.2025.08.15.13.41.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Aug 2025 13:41:32 -0700 (PDT)
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
X-Inumbo-ID: 3ae662db-7a18-11f0-b898-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1755290493; x=1755895293; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3zNiV0d1+G8Wff8cLR0QuknnKG7CLHYvqMENqSQD6oI=;
        b=YYoikke66TIu9bg0lXNNBWACJO+G6Z9KNhCP2i1qCkrvF6P99yfL/fSLOQxFvOE9QJ
         +n4fk739F74DZR4On0vQivHyWWv1aTNxT7pZ/+OEqpHlkjRs01RwAFNtw1idf3p/WPHV
         6DeVAEhV+9pbWmybFjbnEcs879cg13m3wKLZM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755290493; x=1755895293;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3zNiV0d1+G8Wff8cLR0QuknnKG7CLHYvqMENqSQD6oI=;
        b=cu8OxPsi3x9FrfynKbd4a/8J31hG1rr7cPtkQF14zS5uTmmjaOmUblbHTY3E1WqUdl
         uG7qZ9wF98XCO97qJFyzxIp2jTUIvh9tF5FuUd0gOLHGTmjbQStN0TFpoVhw8zGwjNLQ
         OPonngiYef6XswS0F7Uq+8s3BgNXSQ9rf8S5JJR/CbnLqs6Jnh9vtG18/ZLif5bSC+ra
         E86DkW6OV/fAwY7nC59OMPoHFD1lWqYoLMF+NTdfZV5PdEy7TKEAL00hwACVmCVgDESs
         0ZoqF08+5oDnerCvcExAoijPmAHVKGy/cHVMkmbVJYfz9udy/YzR7lv9P27MNCS4Sk35
         lEgg==
X-Gm-Message-State: AOJu0YxWZ6PefI4bo4+e07JX7v+m8qrZWOKbmDArWmDs4+Slht3LvvN1
	Qr83GiuxPXiekKhmAW++/P/pS1uHGlVgrgUoUoC5xPhvZg24tIJNARZdLGtp34bhvGp1xQcOiIT
	3RmBh
X-Gm-Gg: ASbGncut/xXsNv+qHHVAcI98DXBuRhN5OHfrp5zkPvcl6XT4NcY2ozDKvZOvlJ0UbUw
	52VKm1cC/HTrOkraCPhExEmYERvHTsgejLfp2zVqa2wsJIqVd7sZiR2UqiEA6HaorQ3pcPUWqwh
	7vxhQWvD/81+4iXIkX5CRd7n08m7kjWHpKOKifoHznaM+nE1VIqVhSNBDlq7imsuvMzZEoAxKeB
	qNFQPJvM8d9h+FfEd4KusP1BJXQUQ6S1Z0L2gx/Tqi3auyihJShWXaijsXM4RNiDxJWGFCc7grz
	3L+Evc86oHEPzaQFa/1hHtOQt5OLI7taH6mY/pbba0Rs29Pcdn+8C+61qDhXswlB6Og11NFv/3o
	tX/a+QkfskSfMaaMSvEXywE6V6iafiXfRRF61giilsk6mZPyaz2zysTxPMVRJv+QamBDFKbKfED
	4e
X-Google-Smtp-Source: AGHT+IGmu1YDwyvtZE2fRU7Zf8nu4yq1fC7elgzaDXo+fr0XiiF6JzjzRaV8vQ9Z+C3XJYBW2NYqqg==
X-Received: by 2002:a05:600c:4591:b0:458:bbed:a827 with SMTP id 5b1f17b1804b1-45a217f78damr26648625e9.1.1755290492736;
        Fri, 15 Aug 2025 13:41:32 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v2 16/16] x86/fsgsbase: Improve code generation in read_registers()
Date: Fri, 15 Aug 2025 21:41:17 +0100
Message-Id: <20250815204117.3312742-17-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250815204117.3312742-1-andrew.cooper3@citrix.com>
References: <20250815204117.3312742-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

It turns out that using the higher level helpers adjacent like this leads to
terrible code generation.  Due to -fno-strict-alising, the store into state->
invalidates the read_cr4() address calculation (which is really cpu_info->cr4
under the hood), meaning that it can't be hoisted.

As a result we get "locate the top of stack block, get cr4, and see if
FSGSBASE is set" repeated 3 times, and an unreasoanble number of basic blocks.

Hoist the calculation manually, which results in two basic blocks.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>

Side-by-side disassembly: https://termbin.com/9xfq
---
 xen/arch/x86/traps.c | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/xen/arch/x86/traps.c b/xen/arch/x86/traps.c
index 0c5393cb2166..8c261d219c07 100644
--- a/xen/arch/x86/traps.c
+++ b/xen/arch/x86/traps.c
@@ -118,9 +118,18 @@ static void read_registers(struct extra_state *state)
     state->cr3 = read_cr3();
     state->cr4 = read_cr4();
 
-    state->fsb = read_fs_base();
-    state->gsb = read_gs_base();
-    state->gss = read_gs_shadow();
+    if ( state->cr4 & X86_CR4_FSGSBASE )
+    {
+        state->fsb = __rdfsbase();
+        state->gsb = __rdgsbase();
+        state->gss = __rdgskern();
+    }
+    else
+    {
+        state->fsb = rdmsr(MSR_FS_BASE);
+        state->gsb = rdmsr(MSR_GS_BASE);
+        state->gss = rdmsr(MSR_SHADOW_GS_BASE);
+    }
 
     asm ( "mov %%ds, %0" : "=m" (state->ds) );
     asm ( "mov %%es, %0" : "=m" (state->es) );
-- 
2.39.5


