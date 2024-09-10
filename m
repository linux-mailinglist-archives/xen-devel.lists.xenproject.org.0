Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 03F4D972A7A
	for <lists+xen-devel@lfdr.de>; Tue, 10 Sep 2024 09:19:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.795024.1204102 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1snv9M-00054n-1t; Tue, 10 Sep 2024 07:18:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 795024.1204102; Tue, 10 Sep 2024 07:18:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1snv9L-00052j-Ui; Tue, 10 Sep 2024 07:18:55 +0000
Received: by outflank-mailman (input) for mailman id 795024;
 Tue, 10 Sep 2024 07:18:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SQ+P=QI=cloud.com=frediano.ziglio@srs-se1.protection.inumbo.net>)
 id 1snv9K-00052d-NA
 for xen-devel@lists.xenproject.org; Tue, 10 Sep 2024 07:18:54 +0000
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [2a00:1450:4864:20::632])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ed07e502-6f44-11ef-99a1-01e77a169b0f;
 Tue, 10 Sep 2024 09:18:50 +0200 (CEST)
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-a8d51a7d6f5so236129066b.2
 for <xen-devel@lists.xenproject.org>; Tue, 10 Sep 2024 00:18:50 -0700 (PDT)
Received: from fziglio-desktop.. ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a8d25830efdsm440528566b.41.2024.09.10.00.18.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Sep 2024 00:18:48 -0700 (PDT)
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
X-Inumbo-ID: ed07e502-6f44-11ef-99a1-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1725952729; x=1726557529; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9JFoEUISOkkmwCXQRnZjoaP4VgvfwKDPLFEYEv5VZrI=;
        b=UfmNGb2s+kiTTcxjeTSCTQlDn6Fl9eYGcEV9ZM5yk/RzFhGrks92sXct/GK7vB73bV
         VUE9O9nI5nxSB/hkR8VG2dYF6iCXVloS3c7CmMGg0g6B6IhvMfeReHTgOTNU6WsCufdn
         XDlH2cYlET3WLFa3JM7vM7QZKxQnFu43Vzn5U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725952729; x=1726557529;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9JFoEUISOkkmwCXQRnZjoaP4VgvfwKDPLFEYEv5VZrI=;
        b=hQZ78JgCsED7/fYDBPX4ms2jRKM/xxKFAVBAIVYQQfEL12E4WA7HMfX41VzXx2mIEf
         J0J8PmpLAqm0s6Xl2gN2RDg0+3heUzIWhOsbGX1mFhYbgg7wnYBA/4JlIxwzfsteHNEW
         7uWirAx+533iUo1+1sWcrg1PCnc+RCYqRYdG3o1k2Puq3oeGlbsH2hfq1NLZeStpb490
         s7gKl2z+SyToB3uFewiKc2zrKlEn6lY7Fcv1Ttul1OHVxHXhD7qr+D8knL+ga3dsw2yG
         nabYebokYad8bbtIKmPRFvzrc+x+G3WQ6GsSTemztNFPGq/w4tJe1RPignjq2MSJrM8y
         RazQ==
X-Gm-Message-State: AOJu0YxQfL7dwPzXWUVUBlSuawPaUR+5x2istSopSZNpkIb1WtU2c1uS
	FMsGAljRGlVnVdLM/+kxvglnvdBSwUAaZKL/fwmkSPpy9PQ/MfEfu0ixNhyndPk+jTNKRmkcko0
	3
X-Google-Smtp-Source: AGHT+IHkpNZHyHlYfUYisgJ0D5MPdMkdSR8R2p5glDQ+o8o/lMhh7UrVLPGNQif/YoVlfHtpDdL+gg==
X-Received: by 2002:a17:907:1b1c:b0:a80:f6a0:9c3c with SMTP id a640c23a62f3a-a8a88273991mr1177089266b.0.1725952728578;
        Tue, 10 Sep 2024 00:18:48 -0700 (PDT)
From: Frediano Ziglio <frediano.ziglio@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Frediano Ziglio <frediano.ziglio@cloud.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH] x86/boot: Remove __packed attribute
Date: Tue, 10 Sep 2024 08:18:38 +0100
Message-Id: <20240910071838.4545-1-frediano.ziglio@cloud.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The data are properly aligned in trampoline.S.

Signed-off-by: Frediano Ziglio <frediano.ziglio@cloud.com>
---
 xen/arch/x86/boot/cmdline.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/arch/x86/boot/cmdline.c b/xen/arch/x86/boot/cmdline.c
index fc9241ede9..aae5a1f04f 100644
--- a/xen/arch/x86/boot/cmdline.c
+++ b/xen/arch/x86/boot/cmdline.c
@@ -38,7 +38,7 @@ asm (
 #include "video.h"
 
 /* Keep in sync with trampoline.S:early_boot_opts label! */
-typedef struct __packed {
+typedef struct {
     uint8_t skip_realmode;
     uint8_t opt_edd;
     uint8_t opt_edid;
-- 
2.34.1


