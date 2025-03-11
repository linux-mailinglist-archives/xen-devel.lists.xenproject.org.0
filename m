Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C9AACA5D175
	for <lists+xen-devel@lfdr.de>; Tue, 11 Mar 2025 22:13:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.909299.1316303 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ts6uE-0000rp-De; Tue, 11 Mar 2025 21:12:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 909299.1316303; Tue, 11 Mar 2025 21:12:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ts6uE-0000pD-3L; Tue, 11 Mar 2025 21:12:54 +0000
Received: by outflank-mailman (input) for mailman id 909299;
 Tue, 11 Mar 2025 21:12:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=isYZ=V6=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1ts6uC-0008Uq-DK
 for xen-devel@lists.xenproject.org; Tue, 11 Mar 2025 21:12:52 +0000
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [2a00:1450:4864:20::42b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9793e51b-febd-11ef-9ab9-95dc52dad729;
 Tue, 11 Mar 2025 22:12:51 +0100 (CET)
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-3913d129c1aso194570f8f.0
 for <xen-devel@lists.xenproject.org>; Tue, 11 Mar 2025 14:12:51 -0700 (PDT)
Received: from andrewcoop.eng.citrite.net (host-92-26-98-202.as13285.net.
 [92.26.98.202]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3912bfdfba9sm19480872f8f.39.2025.03.11.14.12.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Mar 2025 14:12:50 -0700 (PDT)
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
X-Inumbo-ID: 9793e51b-febd-11ef-9ab9-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1741727571; x=1742332371; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yybFEmxc//5qe7pG1An7XfQn4aBdIa5c65oR7D6eBis=;
        b=Qj0hWsP/dxiMpFwZISivLk3HDLjLZDFTpeZP5c/nBO/+DjMPi0N+FTUEzk+o/fzuDz
         whTjEAMPgs3VzS6crBat7W1nnHFlu+kofLIAl/i1GXSjl1sOwa3kFMhengrhqX++oPtN
         ZIR+JLLfOuOENf8KJrfqOOcSU1nTIDM5vNc1E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741727571; x=1742332371;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yybFEmxc//5qe7pG1An7XfQn4aBdIa5c65oR7D6eBis=;
        b=GQOl9+my7RAslyEqF8gKER7p2WNnnw3d5lF8oN3nMJRR13HRlEpRjulp2wyOdn7XLE
         OH0nN6L4qdc3yHnlMT3tggpT8/ioWHNYCvTQQxzCgdZivDRsfyL5z/ti3jxOzL7/vWXt
         J1Pqk7o6poKP+Tiyu7YWo7V3ryjnNTdshumkiPvWA5sfyaKXOyIdnKG4o9GZo4y3bZyd
         qTcGoLpSGKLZMr8clbYIWoyjecj2f6TMog1PlLqb/JIXP0WwbEgy/DQhYHZunGA6OzsO
         5Djz1JxXcDmFqMkJrPeQT9M54FXOyALt85pCk+yzR+gt2IXqyuo8Gn9lTqZE2OiUIo4s
         QHXA==
X-Gm-Message-State: AOJu0YyVrjX6NM9H41y3nglycb57bMNbFF+1JLBOMhknLRAcywmugiDj
	ylfBBEU7+LZg/KcK9zH2xy70tqxarcEYR9R0F9Z1Oyord26f/S9MzLmL6fnwBCHJIshlxk2kf+L
	R
X-Gm-Gg: ASbGncvseYdqUyPPnuLDzxHpNb/6ihadS7/F5vuC/9TaiKFq74sqBPgWBTTsJX3ahPE
	K2t8OX0+WolgKcWWZjUnX9HV3t27XhvxTL7fHqDfyeULdrpRBLwmvFku+UMADawww+/aOfea1/A
	lAow63xIHy3MBwZ8pmoEbVJ0zFCcUF5U+JhLaVbn17EXNxZtfZRlYJMeoPk0NHePSOaM1VXnAkH
	j2IwY4sTYRshM2UGEyv4LSjd035Nfw0U6UjtY9O5RS4tIwCXmZoMR2Jipp9tO+bQjFjOduTzHbR
	JF/n4bgsnCC8A3Aek3IxcAoaGm75ntyC+lF0D5za+UFR/f+hIBFeXO+jhdqRGCXKwPfD4onaFAL
	o5TBLbWswJy/daxpfp8hVLci1
X-Google-Smtp-Source: AGHT+IGK6wZWF07oLD3Yx2YrNLBvLapG2HLiF0ZbCjlm5KSKloOuGhrTSAzr/9emni6uPWQYPRt5GA==
X-Received: by 2002:a05:6000:1f8e:b0:390:ff84:532b with SMTP id ffacd0b85a97d-3926c3b8b43mr5066827f8f.7.1741727571110;
        Tue, 11 Mar 2025 14:12:51 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH 4/8] Revert "x86/traps: 'Fix' safety of read_registers() in #DF path"
Date: Tue, 11 Mar 2025 21:10:39 +0000
Message-Id: <20250311211043.3629696-5-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250311211043.3629696-1-andrew.cooper3@citrix.com>
References: <20250311211043.3629696-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This reverts commit 6065a05adf152a556fb9f11a5218c89e41b62893.

The discussed "proper fix" has now been implemented, and the #DF path no
longer writes out-of-bounds.  Restore the proper #DF IST pointer.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>

Only 5 years late...
---
 xen/arch/x86/cpu/common.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/xen/arch/x86/cpu/common.c b/xen/arch/x86/cpu/common.c
index e8d4ca3203be..b934ce7ca487 100644
--- a/xen/arch/x86/cpu/common.c
+++ b/xen/arch/x86/cpu/common.c
@@ -847,13 +847,7 @@ void load_system_tables(void)
 	tss->ist[IST_MCE - 1] = stack_top + (1 + IST_MCE) * PAGE_SIZE;
 	tss->ist[IST_NMI - 1] = stack_top + (1 + IST_NMI) * PAGE_SIZE;
 	tss->ist[IST_DB  - 1] = stack_top + (1 + IST_DB)  * PAGE_SIZE;
-	/*
-	 * Gross bodge.  The #DF handler uses the vm86 fields of cpu_user_regs
-	 * beyond the hardware frame.  Adjust the stack entrypoint so this
-	 * doesn't manifest as an OoB write which hits the guard page.
-	 */
-	tss->ist[IST_DF  - 1] = stack_top + (1 + IST_DF)  * PAGE_SIZE -
-		(sizeof(struct cpu_user_regs) - offsetof(struct cpu_user_regs, es));
+	tss->ist[IST_DF  - 1] = stack_top + (1 + IST_DF)  * PAGE_SIZE;
 	tss->bitmap = IOBMP_INVALID_OFFSET;
 
 	/* All other stack pointers poisioned. */
-- 
2.39.5


