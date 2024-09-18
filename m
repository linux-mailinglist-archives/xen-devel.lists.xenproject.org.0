Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A21BD97BA0F
	for <lists+xen-devel@lfdr.de>; Wed, 18 Sep 2024 11:23:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.800210.1210114 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sqqtw-0001XH-TM; Wed, 18 Sep 2024 09:23:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 800210.1210114; Wed, 18 Sep 2024 09:23:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sqqtw-0001Uy-Q0; Wed, 18 Sep 2024 09:23:08 +0000
Received: by outflank-mailman (input) for mailman id 800210;
 Wed, 18 Sep 2024 09:23:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9PNE=QQ=cloud.com=frediano.ziglio@srs-se1.protection.inumbo.net>)
 id 1sqqtv-0001Uh-Kj
 for xen-devel@lists.xenproject.org; Wed, 18 Sep 2024 09:23:07 +0000
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com
 [2a00:1450:4864:20::22f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9c7c204e-759f-11ef-99a2-01e77a169b0f;
 Wed, 18 Sep 2024 11:23:05 +0200 (CEST)
Received: by mail-lj1-x22f.google.com with SMTP id
 38308e7fff4ca-2f761461150so73329641fa.0
 for <xen-devel@lists.xenproject.org>; Wed, 18 Sep 2024 02:23:05 -0700 (PDT)
Received: from fziglio-desktop.. ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a906109718bsm559125666b.34.2024.09.18.02.23.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Sep 2024 02:23:04 -0700 (PDT)
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
X-Inumbo-ID: 9c7c204e-759f-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1726651385; x=1727256185; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Y6JyuEO+6Wt0ENWNKO6NxuWS5r52VvRSamQuM3NaU+8=;
        b=im+ewdGHKz5f/gbXrpJYJwByCTTFxayVq39vUH98sK+Dkux7Onp4hwRUetUf+KR784
         D7Lxew1Znrc18E5XWWwCzRg2I3PbvbZadUIYi0ygElIgjmOjg4WuhJca+24rNlUPBmHW
         oJ/ha6O2dhdaHILpSlI5U5/nPUhs0fQyg/ojc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726651385; x=1727256185;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Y6JyuEO+6Wt0ENWNKO6NxuWS5r52VvRSamQuM3NaU+8=;
        b=snY5h6MASI4cQJy27uEgR+NslvCJ9/6smqsZwbOaTvyontdMXzBGjCuDF5TjLYPJ+W
         oSZQG5ZKzcoj91WmVOSQrqQg053VEAuyZang7tRz/ByATq2otvddQxS23WdvNNE5K6UF
         GyhAeqZ69UHbtPsqmQU7638GDZMH62LeHuDMMZQ+g6H5m1L8OAXYo/wTOY6YgW9hbyZT
         88gkUHuZ+jWa41Pdd1tnwo7Xe7WjGOdAV4zqrcNEhkEf0haCzZ/ZJm4NkNEMDsZQabz+
         calZJpgLTMtPutwg/NycYnJb2zb3/CUslYMc7295/j8OqNp4tOKd9zwQOS8o9DPRxvBg
         xp6g==
X-Gm-Message-State: AOJu0Yw0XHnvKRzV2vh+DvR9v1kWhax8IKON4ICbPSIXInZ16YCCJ+Rk
	NwuymASH9yeQ+VWaCpmCzRBgSmphOz0e1taHEPbsP8d47RV+tQXiIRSDGCvqg4rSjmHHGh3196R
	D
X-Google-Smtp-Source: AGHT+IHX7W0cuUVaKf9HU4xrIFHM70Omrg5H2gVZYlBHtaIqstKb1cDpbSACZRZjYx4U1cjae+2DTQ==
X-Received: by 2002:a2e:4e02:0:b0:2ef:2555:e52d with SMTP id 38308e7fff4ca-2f791b66d4cmr78022531fa.45.1726651384751;
        Wed, 18 Sep 2024 02:23:04 -0700 (PDT)
From: Frediano Ziglio <frediano.ziglio@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Frediano Ziglio <frediano.ziglio@cloud.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Subject: [PATCH v2 0/4] x86/boot: Reduce assembly code
Date: Wed, 18 Sep 2024 10:22:51 +0100
Message-Id: <20240918092255.13527-1-frediano.ziglio@cloud.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series came from part of the work of removing duplications between
boot code and rewriting part of code from assembly to C.
First 2 patches rework BIOS/PVH paths to reuse some code.
Third patch rewrites EFI code in pure C.

Changes since v1, more details in specific commits:
- style updates;
- comments and descriptions improvements;
- other improvements.

Frediano Ziglio (4):
  x86/boot: Initialise BSS sooner
  x86/boot: Refactor BIOS/PVH start
  x86/boot: Rewrite EFI/MBI2 code partly in C
  x86/boot: Improve MBI2 structure check

 xen/arch/x86/boot/head.S      | 296 +++++++++++-----------------------
 xen/arch/x86/efi/Makefile     |   1 +
 xen/arch/x86/efi/efi-boot.h   |   6 +-
 xen/arch/x86/efi/parse-mbi2.c |  61 +++++++
 xen/arch/x86/efi/stub.c       |   3 +-
 5 files changed, 159 insertions(+), 208 deletions(-)
 create mode 100644 xen/arch/x86/efi/parse-mbi2.c

-- 
2.34.1


