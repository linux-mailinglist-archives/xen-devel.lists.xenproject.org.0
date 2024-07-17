Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EF632934038
	for <lists+xen-devel@lfdr.de>; Wed, 17 Jul 2024 18:14:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.760076.1169802 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sU7IQ-0007m8-3X; Wed, 17 Jul 2024 16:14:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 760076.1169802; Wed, 17 Jul 2024 16:14:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sU7IP-0007jb-UP; Wed, 17 Jul 2024 16:14:25 +0000
Received: by outflank-mailman (input) for mailman id 760076;
 Wed, 17 Jul 2024 16:14:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9rux=OR=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1sU7IP-0007cd-0C
 for xen-devel@lists.xenproject.org; Wed, 17 Jul 2024 16:14:25 +0000
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [2a00:1450:4864:20::536])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a1116879-4457-11ef-8776-851b0ebba9a2;
 Wed, 17 Jul 2024 18:14:22 +0200 (CEST)
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-59f9f59b88cso2467408a12.3
 for <xen-devel@lists.xenproject.org>; Wed, 17 Jul 2024 09:14:22 -0700 (PDT)
Received: from andrewcoop.eng.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-59ff76e9851sm2064067a12.46.2024.07.17.09.14.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Jul 2024 09:14:21 -0700 (PDT)
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
X-Inumbo-ID: a1116879-4457-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1721232862; x=1721837662; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J4qyb2Q8pmTavMu8lP6BG6l66WhcSIyplW6y2Sr0GR4=;
        b=ic+RTZsqos+QiI6gFCh77lXOKO4U/BHanCnMGFShOpITYfZIx15E1MgN/pkHosgkbQ
         NOHt78rlCa+hVG0tNz9DPIFAIs7fok32wESN0XJhHiYFSvskIrHgnXcLln8WDzqNQxNN
         r+rGe2DwGnxL17f7eJCY1kESKgqn98mJDnYoU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721232862; x=1721837662;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=J4qyb2Q8pmTavMu8lP6BG6l66WhcSIyplW6y2Sr0GR4=;
        b=SB6L02hIbddP1Yec2gxhQA0de6MBV5LCOvY9ih4kR5ekqx9zUtXRE3X8UDQWaUsdFS
         eTetuGPFU6eVY8VUNdwR/kuZSgArON1qkkut2kMNIV3zD+nWrSDTL1ZdZPYolfSrNxCX
         Skcw3WPFHPcOTfvj/hbinUO4x72l+1a6SqWs1Vb9OPu+IKZadUeB8CuDVMwo1qfpxMFV
         H+jpKScvEjy/sugMClUQ4dc1Bg327uv30Mey5O/q6Et2iRRGmuc3ZYilEjBrbF5iDvEY
         jxDTE97hRYM3IF7IW/RImTAlhVNbdA44Q4nnE7RlgUIE7gUP9NMJDgAgJTKeHeWMqZHN
         WoOQ==
X-Gm-Message-State: AOJu0YxiHmsAJUrt6Eb+HmNOO+rxF3mjz4iLvFgFmzBdq7uH5w8M9+bk
	6DC9Csv9p0qZZJY12T3N9BQLaNgmqUhyl4nbruXH91H+gcVkEEiakojti5mb75B7bZPRYV+WuuP
	S
X-Google-Smtp-Source: AGHT+IGIvS2ShxY2WkKbLfsrMI5Fza3y7YZ3JTKjaqhBi9LN2oyOYTXmNB6tdsxWF3bwKIAe23gX0w==
X-Received: by 2002:a50:d5de:0:b0:585:4048:129a with SMTP id 4fb4d7f45d1cf-5a05ce11c37mr1509174a12.31.1721232861656;
        Wed, 17 Jul 2024 09:14:21 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH 2/3] x86/mm: Move base_disallow_mask into __ro_after_init
Date: Wed, 17 Jul 2024 17:14:14 +0100
Message-Id: <20240717161415.3586195-3-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240717161415.3586195-1-andrew.cooper3@citrix.com>
References: <20240717161415.3586195-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

base_disallow_mask is calculated once in arch_init_memory() and never changes
thereafter.  Write-protect it at runtime.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/arch/x86/mm.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/xen/arch/x86/mm.c b/xen/arch/x86/mm.c
index 0ecea0f707b2..95795567f2a5 100644
--- a/xen/arch/x86/mm.c
+++ b/xen/arch/x86/mm.c
@@ -150,7 +150,8 @@ bool __read_mostly machine_to_phys_mapping_valid;
 
 struct rangeset *__read_mostly mmio_ro_ranges;
 
-static uint32_t base_disallow_mask;
+static uint32_t __ro_after_init base_disallow_mask;
+
 /* Global bit is allowed to be set on L1 PTEs. Intended for user mappings. */
 #define L1_DISALLOW_MASK ((base_disallow_mask | _PAGE_GNTTAB) & ~_PAGE_GLOBAL)
 
-- 
2.39.2


