Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 751E99AA152
	for <lists+xen-devel@lfdr.de>; Tue, 22 Oct 2024 13:46:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.824121.1238212 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t3DLB-0002UN-N7; Tue, 22 Oct 2024 11:46:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 824121.1238212; Tue, 22 Oct 2024 11:46:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t3DLB-0002S5-KQ; Tue, 22 Oct 2024 11:46:21 +0000
Received: by outflank-mailman (input) for mailman id 824121;
 Tue, 22 Oct 2024 11:46:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ufxd=RS=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1t3DLA-0002Rz-Ir
 for xen-devel@lists.xenproject.org; Tue, 22 Oct 2024 11:46:20 +0000
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [2a00:1450:4864:20::430])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 40a5aad6-906b-11ef-a0be-8be0dac302b0;
 Tue, 22 Oct 2024 13:46:19 +0200 (CEST)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-37d55f0cf85so3928422f8f.3
 for <xen-devel@lists.xenproject.org>; Tue, 22 Oct 2024 04:46:19 -0700 (PDT)
Received: from localhost ([213.195.115.182]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-37ee0b9bac3sm6427749f8f.94.2024.10.22.04.46.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Oct 2024 04:46:18 -0700 (PDT)
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
X-Inumbo-ID: 40a5aad6-906b-11ef-a0be-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1729597578; x=1730202378; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LwID1GrxV/bloiAFKXhClGYUkDfFW0Ltl4Y5csEIZIg=;
        b=FiJ2EF8oefuptduMk+7Redcsxmw9h1MCRvhgXFZE/4wIeroi/JxpLnOaERhxVCRy++
         woXNlx04amnvxNo8Be67N6k95D+0Q1vMDcnmXsZLE3ep7zanM1mTsfdDPCBIAM/22+6C
         3fO1hLg4diX94xPUKyNNKKo8yhRNiMpXAnJgY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729597578; x=1730202378;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LwID1GrxV/bloiAFKXhClGYUkDfFW0Ltl4Y5csEIZIg=;
        b=qgYxugX7Zz3vkOWcHsjdH9cJFbGXXn+VAfkC4xLLkQO4fQNFuIt8+YcLm9qo2POrkU
         /541QGSKSILHniKo8a9lTQ98k6gD2D+MLthrt9vlwpDAHQqsEF8OAz/mTYHVRhESxU+C
         6Y9kGeOTIOF4jW7EEQB9RpJPxIJCQrLvsMTSFXLn1hLcZRpjWdWdz+J55LS+NdU4hOyG
         nsFXeCwhI0g2JjGs5rYHa0TeqEV5XJi1TFujq9aGEi5odK3E14p9pyeiR16qMc2VZviq
         rsPrxRbL1SfwextLFqRCj7m3mYJc3eqsL3J/fvhkj6ra6J8aN486TRLGgR+MfBH4VgDs
         7t/g==
X-Gm-Message-State: AOJu0Yx4KY7v4Rg6GC1P4EXXpwcfkbzndXq3JoiP74fv50g9dM+OI68Y
	Jr82FCEcQ/9iZ2m7+16igCj9IYEE6pMu2fFoEJVrvzuF4YJoAEgVoOFcgTnlfCmWvl7NfAiom+G
	2
X-Google-Smtp-Source: AGHT+IEiU0wvj+zs1cHFftrmNWCE46p/g5/8Id31g7guT40biFpam4JG0okRinspcIsKavQhB9xDPg==
X-Received: by 2002:a5d:458e:0:b0:37d:4706:f728 with SMTP id ffacd0b85a97d-37ef21bb0aamr1780768f8f.50.1729597578475;
        Tue, 22 Oct 2024 04:46:18 -0700 (PDT)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH] x86/pv: remove unlikely() from BUG_ON() condition in pv_map_ldt_shadow_page()
Date: Tue, 22 Oct 2024 13:46:07 +0200
Message-ID: <20241022114607.2908-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

BUG_ON() itself already contains an unlikely() wrapping the bug condition.

No functional change.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/arch/x86/pv/mm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/arch/x86/pv/mm.c b/xen/arch/x86/pv/mm.c
index 24f0d2e4ff7d..187f5f6a3e8c 100644
--- a/xen/arch/x86/pv/mm.c
+++ b/xen/arch/x86/pv/mm.c
@@ -55,7 +55,7 @@ bool pv_map_ldt_shadow_page(unsigned int offset)
     l1_pgentry_t gl1e, *pl1e;
     unsigned long linear = curr->arch.pv.ldt_base + offset;
 
-    BUG_ON(unlikely(in_irq()));
+    BUG_ON(in_irq());
 
     /*
      * Prior limit checking should guarantee this property.  NB. This is
-- 
2.46.0


