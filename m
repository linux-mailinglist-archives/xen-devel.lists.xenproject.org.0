Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3044A78B4E8
	for <lists+xen-devel@lfdr.de>; Mon, 28 Aug 2023 17:58:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.591663.924104 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qaec7-0004AS-L3; Mon, 28 Aug 2023 15:57:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 591663.924104; Mon, 28 Aug 2023 15:57:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qaec7-00047Y-G5; Mon, 28 Aug 2023 15:57:15 +0000
Received: by outflank-mailman (input) for mailman id 591663;
 Mon, 28 Aug 2023 15:57:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0Xqe=EN=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1qaec6-00047N-0T
 for xen-devel@lists.xenproject.org; Mon, 28 Aug 2023 15:57:14 +0000
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [2a00:1450:4864:20::130])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8d1ecd09-45bb-11ee-8783-cb3800f73035;
 Mon, 28 Aug 2023 17:57:12 +0200 (CEST)
Received: by mail-lf1-x130.google.com with SMTP id
 2adb3069b0e04-5007abb15e9so5195783e87.0
 for <xen-devel@lists.xenproject.org>; Mon, 28 Aug 2023 08:57:12 -0700 (PDT)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 t25-20020ac24c19000000b004fe8424c750sm1636027lfq.47.2023.08.28.08.57.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Aug 2023 08:57:11 -0700 (PDT)
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
X-Inumbo-ID: 8d1ecd09-45bb-11ee-8783-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693238232; x=1693843032;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zlSGKbs/IdFGYcThSCWsdoNTZDxKBKT53110yneZmV4=;
        b=H+VJj/ODmzDMKdtsWNUIflzSEv1EXAgcJvllpwlG1wnD5mgEsiIpX6HNSksJhkzIRU
         wL4ja4qJicOyo9UDB/Y91AKoADwpPFDmwJPVD27FL0/7fk+Bij60ft62lm6BXp1NH45o
         FnDEohie7V8nwSTulzOfqx9AgXSlI82HqFjc2E/8duEaJyYr4f34l154O4c2b4V3IQl8
         hkBnXQBAPqQ3R0iaiFFLDxR0PCictT6A6DJX7ZngOyxzTIFFTCR+g629YanvYhyhiMWP
         /eDz/CbWtIVRtgOVeAU50dPsqN8a91Dz3dsee+LN1POkplILIIBu7m3QslTCgIxCG5H9
         tjvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693238232; x=1693843032;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zlSGKbs/IdFGYcThSCWsdoNTZDxKBKT53110yneZmV4=;
        b=ICGy8Zcdv5+Q/Wk/ryAes6GGaKrINGKFTVFLLQa2+lLM51yCPN5oX5ATZzjCzHFV7X
         w/305q7TIC/KwvldjaGn6NfV6dABcU4Bc+iwjE7CqAV5odYHc7EieCx6Ly8+j6LUxtlQ
         hb4WcXMXDQvspOsCrvqYU8MOHPIJ78qj9YMSDawFsOXdvvBoL2/mbShbfEwfo1MxO/cG
         7dweqmcqfn5dr4BKHpI/tfue0IP/R3IgJj5m5HEIsQ2593YJbEkh4Z4PVDYsAVbQznPD
         MHeuuqnTYYvKLudLP2LoCeChIHknfWk/DDP+riW6q6dGzm4E4op4lEEH6gqvp6niXq7J
         zZOg==
X-Gm-Message-State: AOJu0Yzcik9uRoIgrFUFWBPReI25F70RK0Dk40XtcC+bd0NmdQcY+jPg
	gKUF2y8o0CnoarloV8OOHa0ZbCaR26k=
X-Google-Smtp-Source: AGHT+IGktDhZmacGqrRlfv8EP+jA1f8/jR2YKUGo7yadGOP5OW+88mcSM3GB3pub4jWLuKLhGM6lEA==
X-Received: by 2002:ac2:58e8:0:b0:500:9734:b415 with SMTP id v8-20020ac258e8000000b005009734b415mr9734508lfo.30.1693238231415;
        Mon, 28 Aug 2023 08:57:11 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Tamas K Lengyel <tamas.k.lengyel@gmail.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v1 0/2] introduce stub directory to storing empty/stub headers
Date: Mon, 28 Aug 2023 18:57:06 +0300
Message-ID: <cover.1693235841.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A lot of empty/stub headers should be introduced during the early steps of adding
support of new architecture.

An example can be found here:
1. https://lore.kernel.org/xen-devel/cover.1692181079.git.oleksii.kurochko@gmail.com/
2. https://lore.kernel.org/xen-devel/a92f99e8f697da99d77bfde562a549dbef3760ce.1692816595.git.sanastasio@raptorengineering.com/

As part of the patch series, asm/vm_event.h was moved to the stubs directory because
It is the same for ARM, PPC, and RISC-V.

Oleksii Kurochko (2):
  xen: add stubs dir to include path
  xen: move arm/include/asm/vm_event.h to stubs

 xen/Makefile                        |  1 +
 xen/arch/arm/include/asm/vm_event.h | 66 -----------------------------
 xen/include/stubs/asm/vm_event.h    | 55 ++++++++++++++++++++++++
 3 files changed, 56 insertions(+), 66 deletions(-)
 delete mode 100644 xen/arch/arm/include/asm/vm_event.h
 create mode 100644 xen/include/stubs/asm/vm_event.h

-- 
2.41.0


