Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 18A3298DEEF
	for <lists+xen-devel@lfdr.de>; Wed,  2 Oct 2024 17:26:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.808874.1220920 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sw1EL-0004Z3-4J; Wed, 02 Oct 2024 15:25:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 808874.1220920; Wed, 02 Oct 2024 15:25:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sw1EK-0004UO-VV; Wed, 02 Oct 2024 15:25:32 +0000
Received: by outflank-mailman (input) for mailman id 808874;
 Wed, 02 Oct 2024 15:25:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6go0=Q6=cloud.com=matthew.barnes@srs-se1.protection.inumbo.net>)
 id 1sw1EJ-0004SM-Cw
 for xen-devel@lists.xenproject.org; Wed, 02 Oct 2024 15:25:31 +0000
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [2a00:1450:4864:20::233])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8e89f176-80d2-11ef-99a2-01e77a169b0f;
 Wed, 02 Oct 2024 17:25:29 +0200 (CEST)
Received: by mail-lj1-x233.google.com with SMTP id
 38308e7fff4ca-2fad8337aa4so28270961fa.0
 for <xen-devel@lists.xenproject.org>; Wed, 02 Oct 2024 08:25:29 -0700 (PDT)
Received: from mbarnes-x-u.eng.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a93c277726asm894554866b.10.2024.10.02.08.25.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Oct 2024 08:25:28 -0700 (PDT)
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
X-Inumbo-ID: 8e89f176-80d2-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1727882728; x=1728487528; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Cthy4vBlSFT64QTX1AaTyw/nOCRFjR3Hlujb8NnYXGM=;
        b=kiEdgPboo/AZW+gVHYpLxpx2svSBAmFYjZO+qgc/xXtYesHQiE1rGcG7DlrrBwCeUP
         7EbwU0iQRVbF9mQIjXh8XOD996dASJg2+EhHgkelBkT0LpogCBYixHrf6ouWIeLfa7sw
         UEb3jyeE3Eei8oajQdLahk+QRotXda+sLCJ2c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727882728; x=1728487528;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Cthy4vBlSFT64QTX1AaTyw/nOCRFjR3Hlujb8NnYXGM=;
        b=LLld1q2XLIB3Uic2VUbG9w6skjNH2LpTVThoEz4KWFDTEBRC1+hhp5QndCWR9wAf4V
         C2dlMBSj9z2PPz0wcCGTeUUSxzha/R8B8wZCUwr6nZdjVaL03ozQ236XO26oajuXdRPe
         2SKuP6pOvFZjE7iGJEJCmXsL2vfA+IQvtmVdciB9VK1HdJZz30Qr9FgOhgPwu+JdHfO+
         VwhlT8GYleGYSR22nKaf4we0Ksq64+3paG2Fx75yub+QpPUz7Dqk5Su2uX3u6P8C8P1M
         oxKx8wPrpIWed28/evq6xjWNE9VPK+LBxiDrZvWW8mH+w+av+ntCdLHmiRVTmHVgMWrH
         wDEA==
X-Gm-Message-State: AOJu0YyQSYDBb4owssFQ8gpRhc0jlPHkyt8wYLOrg0RNGIunAALGVyOA
	uUZZXI+5ys7tb13h50aPbBLW8IjDb4W8Zu10ob9FWgHBIeznrULOqDhMOV/bwNcwKnr4/yNjHmr
	U
X-Google-Smtp-Source: AGHT+IHfga+gEcT+7zo55/f7ywfuUOIqls64d/FukL2mSr6fMabMWWjWJ8Qqn1Huyl3ZkJ1koUlAaw==
X-Received: by 2002:a05:6512:3e26:b0:533:40dc:8248 with SMTP id 2adb3069b0e04-539a0658ba0mr2179509e87.11.1727882728297;
        Wed, 02 Oct 2024 08:25:28 -0700 (PDT)
From: Matthew Barnes <matthew.barnes@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Matthew Barnes <matthew.barnes@cloud.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH 0/3] Switch flat driver to use phys dst for ext ints
Date: Wed,  2 Oct 2024 16:17:23 +0100
Message-Id: <cover.1727880621.git.matthew.barnes@cloud.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series switches the apic_default APIC driver from using
logical flat destination mode for external interrupts, to using
physical destination mode for external interrupts.

This is followed up by two non-functional cleanup commits.

Matthew Barnes (3):
  x86/APIC: Switch flat driver to use phys dst for ext ints
  x86/APIC: Remove unnecessary logical flat functions
  x86/APIC: Refactor GENAPIC_FLAT -> GENAPIC_MIXED

 xen/arch/x86/genapic/default.c     |  2 +-
 xen/arch/x86/genapic/delivery.c    | 10 ----------
 xen/arch/x86/include/asm/genapic.h | 14 ++++++--------
 3 files changed, 7 insertions(+), 19 deletions(-)

-- 
2.46.0


