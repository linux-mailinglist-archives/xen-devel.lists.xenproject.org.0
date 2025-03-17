Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 51149A65D03
	for <lists+xen-devel@lfdr.de>; Mon, 17 Mar 2025 19:41:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.917823.1322680 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tuFOM-0005iz-1c; Mon, 17 Mar 2025 18:40:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 917823.1322680; Mon, 17 Mar 2025 18:40:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tuFOL-0005ga-Ux; Mon, 17 Mar 2025 18:40:49 +0000
Received: by outflank-mailman (input) for mailman id 917823;
 Mon, 17 Mar 2025 18:40:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kom6=WE=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tuFOK-0005gI-SB
 for xen-devel@lists.xenproject.org; Mon, 17 Mar 2025 18:40:48 +0000
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [2a00:1450:4864:20::436])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5772791e-035f-11f0-9aba-95dc52dad729;
 Mon, 17 Mar 2025 19:40:47 +0100 (CET)
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-39143200ddaso3034595f8f.1
 for <xen-devel@lists.xenproject.org>; Mon, 17 Mar 2025 11:40:47 -0700 (PDT)
Received: from andrewcoop.eng.citrite.net (host-92-26-98-202.as13285.net.
 [92.26.98.202]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-395cb7ebe4bsm16118634f8f.98.2025.03.17.11.40.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Mar 2025 11:40:46 -0700 (PDT)
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
X-Inumbo-ID: 5772791e-035f-11f0-9aba-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1742236846; x=1742841646; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LQMPdbs5n7jlJF2V8rD6Jm1jdMD2vppH8sg7+sJDxj0=;
        b=kmG+tQedMJCfJyq7gurSOf3vgUO3WRrE8ZqpyX+nKMra8yw3kHsDzhZV1u7kngNLAz
         tiySXGXNr2RGKnp7n7xe1OUU+1YBOslKv7CS4RBfuiFQXzdBoRQMxFZtHRuHGm14zVBe
         1LS356/Hdh8Bfnu6Uy1w+gFhuMHpGllo/8h7w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742236846; x=1742841646;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LQMPdbs5n7jlJF2V8rD6Jm1jdMD2vppH8sg7+sJDxj0=;
        b=IfHPl2h49Yvwyec2GzRIHE8pZPGuB5268vBO6lY2bKZLxAVx7cvoz8iu3bxS2EXO2Q
         IAwlSkV5vx28xOni3cnMpTzJ0M0Fy9pQuiuN6boUXDZZqno7tvIxX96pVq/7u0D/NhJG
         MqU6NtoFalmUwfHHuc+dYoBoVkDA7CZVkwVuPRTkSWovDRzl6Gry92r6wsYT16ePAnTA
         UelqvkFoSmq1i5ZP+iCRPIDDZwxD8GLAGGPJxwZRvpvNpZc/72ykXtVklDB3Pm96GI8S
         ZWhSbCJnbmgn5q1tJMMwSpc7WH6UTpvvlRv7VrHSfcd4nbP9oVXfYzsmuLSHYGIYrMtr
         9VFQ==
X-Gm-Message-State: AOJu0YxZ9FGU2iSho7bS81Eg5TWFDHOhFXXnFilr9EhltocgLmKMvbMp
	BOsEFPxsJG9JvMHbjgxM0OJYEaNsCMUG1uJwSXx+YcWXuIRpG+eII96zUx/OGtp8Pa4sPnEIm3T
	L
X-Gm-Gg: ASbGncupuIWES8o32N2YAugqVfE5Ex5yg6ZoGNUYf9cABBzF9WHTCVc0jaShaUZtjlv
	qv7JRQYu4ZGZHopy30b93Kb4/3/JRExf/jM+egTQ6V3dFJ7R8WfxWDiHd86RNol6eF0XWnXnNhO
	j+YVsaArbhAIxrQxuYHe0JaevMi9ZQKZcLNVTzRSJmthqhVhswIobPzM+zKHMrOgaw1An5AXsQL
	uuODrFG4lzOPY4wV0t4/0qe/P3eWOGbI6WVSMfb+NIBayuiqKe/oR7ChwInoaTnoSwmYA4IT8m4
	1n5gZMGygII7WLBWJRmm1ymon86KotS7594rd/nHMrTZKPElFYf1XIrI1tlAiSBIXyQtLCfQJEp
	kXuX55nqB1bdsVsnYRKi/nrJ6
X-Google-Smtp-Source: AGHT+IHRQFYBKXE6JmNFPOa1zBeztYXy+hkF/S3+pV1YDgc/LEN99p50R13UPTMjxjIxuyDcFiNkDA==
X-Received: by 2002:a05:6000:381:b0:391:489a:ce12 with SMTP id ffacd0b85a97d-3971daebbc5mr9885741f8f.26.1742236846547;
        Mon, 17 Mar 2025 11:40:46 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Petr=20Bene=C5=A1?= <w1benny@gmail.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH] x86/emul: Emulate %cr8 accesses
Date: Mon, 17 Mar 2025 18:40:44 +0000
Message-Id: <20250317184044.560367-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Petr reports:

  (XEN) MMIO emulation failed (1): d12v1 64bit @ 0010:fffff8057ba7dfbf -> 45 0f 20 c2 ...

during introspection.

This is MOV %cr8, which is wired up for hvm_mov_{to,from}_cr(); the VMExit
fastpaths, but not for the full emulation slowpaths.  Wire %cr8 up in
hvmemul_{read,write}_cr() too.

Reported-by: Petr Beneš <w1benny@gmail.com>
Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Petr Beneš <w1benny@gmail.com>

Like the fastpaths, this depends on all HVM/PVH guests strictly getting an
LAPIC, which is guaranteed by XSA-256.  There's no such thing as a 64bit CPU
without a Local APIC, so no such thing as %cr8 not being TPR.
---
 xen/arch/x86/hvm/emulate.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/xen/arch/x86/hvm/emulate.c b/xen/arch/x86/hvm/emulate.c
index dbf6b5543adf..852240b29d74 100644
--- a/xen/arch/x86/hvm/emulate.c
+++ b/xen/arch/x86/hvm/emulate.c
@@ -2285,6 +2285,11 @@ static int cf_check hvmemul_read_cr(
         *val = current->arch.hvm.guest_cr[reg];
         TRACE(TRC_HVM_CR_READ64, reg, *val, *val >> 32);
         return X86EMUL_OKAY;
+
+    case 8:
+        *val = (vlapic_get_reg(vcpu_vlapic(current), APIC_TASKPRI) & 0xf0) >> 4;
+        return X86EMUL_OKAY;
+
     default:
         break;
     }
@@ -2325,6 +2330,11 @@ static int cf_check hvmemul_write_cr(
         rc = hvm_set_cr4(val, true);
         break;
 
+    case 8:
+        vlapic_set_reg(vcpu_vlapic(current), APIC_TASKPRI, ((val & 0x0f) << 4));
+        rc = X86EMUL_OKAY;
+        break;
+
     default:
         rc = X86EMUL_UNHANDLEABLE;
         break;

base-commit: e7e0d485e993e97b1c816adcfc610e7c7258ce96
-- 
2.39.5


