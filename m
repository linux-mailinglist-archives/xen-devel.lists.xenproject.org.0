Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DE2694EDA8
	for <lists+xen-devel@lfdr.de>; Mon, 12 Aug 2024 15:06:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.775487.1185696 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sdUke-00077R-0e; Mon, 12 Aug 2024 13:06:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 775487.1185696; Mon, 12 Aug 2024 13:06:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sdUkd-00074v-Tx; Mon, 12 Aug 2024 13:06:19 +0000
Received: by outflank-mailman (input) for mailman id 775487;
 Mon, 12 Aug 2024 13:06:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FAji=PL=gmail.com=edgar.iglesias@srs-se1.protection.inumbo.net>)
 id 1sdUkc-00074b-3o
 for xen-devel@lists.xenproject.org; Mon, 12 Aug 2024 13:06:18 +0000
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [2a00:1450:4864:20::12e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a955124c-58ab-11ef-bc05-fd08da9f4363;
 Mon, 12 Aug 2024 15:06:17 +0200 (CEST)
Received: by mail-lf1-x12e.google.com with SMTP id
 2adb3069b0e04-52ef95ec938so4298569e87.3
 for <xen-devel@lists.xenproject.org>; Mon, 12 Aug 2024 06:06:17 -0700 (PDT)
Received: from gmail.com (213-67-3-247-no600.tbcn.telia.com. [213.67.3.247])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53200f3f7cbsm733690e87.246.2024.08.12.06.06.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Aug 2024 06:06:15 -0700 (PDT)
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
X-Inumbo-ID: a955124c-58ab-11ef-bc05-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723467977; x=1724072777; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=CShc+/eJ/eiKg8FqCgbRmAZvWuQTxo7AG/GfIA6PJS0=;
        b=DsbKZvXphmQJTapC7Dp39ETX7mdK+WRjmteye6iGn/PEQMZD9PqOtz2aBrui+O042M
         d4oSmbAAQrC9rC/yJT4k5T0ZSQdXi2CNOZHtx0g53FP4jFvX/Vsp5fOGvBMGCe00U1UL
         wNEBktXHtvHn+kAY4DuaGCuTHnAoYMFI40akmvd09KYAqXrPCOc7McyfMXoZx8rlbMr2
         run7/341ohcTnRgaz8eHiYgoz52p5ViEM2kYRCP1dWTV9JbqGEOI8/wAaku06ZcYMnjH
         cIiUE13K85Xz10xr5IWaA6lcaMYBYQu27Y9Q5z6JUJ32WxMWUmKuBBp4ORA5ZoI1KxIk
         lOqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723467977; x=1724072777;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CShc+/eJ/eiKg8FqCgbRmAZvWuQTxo7AG/GfIA6PJS0=;
        b=ftEfiiTDSZejJwFrd8nVzJPkUI8qc707Wt0R5kteKYFQ98Mtrn8+bbCMk4neeN9o1J
         K1xPvapA9tbsdyB92KavCqFAFEJHneGsMopu+HnOc9YtRS9bDPrW1o6zyrdYmCSFQTuf
         mySsYU5lRwAq6oYJEWuFhCtxVkHpAiNhUu5TjsPRc+k02m96CeU0xVKAB0YHYQwcEjWg
         2K+FK2gO0KiKK7FU5IrKo/Glx9CfsvbNz/6x+XY1wAx5d8gS9hEJd+6TKQvOhpWpcslV
         KrUryHHe1bMwCwd7e4THXxE38e2gvzu7E+RmcVvGtNc96MANBshrOKPFSK2wa3FBsbkI
         jm7g==
X-Forwarded-Encrypted: i=1; AJvYcCWOhZ4f/gziq1TXXvMxycEHIcEba94hk0i4FexBl7n1R/YWhXT7J4C3LVBkrX195iCPH0BOOETP3/ofszZfcYVB0r6AxbmrbkJrEu4E8SY=
X-Gm-Message-State: AOJu0YxHf9K+1Osrs2txzK39HO4/sWhNicPjEgzVdXGwG7bAPLFtvWMj
	OSFLQ0FYVcGXoBBFPq9gDzuDdDPlDYdFEdWikFbZuFijN6nTTtRw
X-Google-Smtp-Source: AGHT+IGyAfAGEwHpXN3mXDKP16d0LaryN/gTiqmKRJmEMkapDIMD5759JSxXq0T/pSPMTWqkAaeRxA==
X-Received: by 2002:a05:6512:696:b0:52c:d6d7:9dd0 with SMTP id 2adb3069b0e04-53213658bdamr53118e87.20.1723467976051;
        Mon, 12 Aug 2024 06:06:16 -0700 (PDT)
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: qemu-devel@nongnu.org
Cc: sstabellini@kernel.org,
	anthony@xenproject.org,
	paul@xen.org,
	peter.maydell@linaro.org,
	alex.bennee@linaro.org,
	xenia.ragiadakou@amd.com,
	jason.andryuk@amd.com,
	edgar.iglesias@amd.com,
	xen-devel@lists.xenproject.org
Subject: [PATCH v1 00/10] xen: pvh: Partial QOM:fication with new x86 PVH machine
Date: Mon, 12 Aug 2024 15:05:55 +0200
Message-ID: <20240812130606.90410-1-edgar.iglesias@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Edgar E. Iglesias" <edgar.iglesias@amd.com>

This series breaks-out parts of the ARM PVH support into a reusable
QOM module. There's a bit of refactoring and some bug-fixes along
the way.

Finally we add a new x86 xen-pvh machine using the new xen-pvh-common
module.

The corresponding changes Xen for PVH x86 are work in progress
(by Xenia Ragiadakou). You can find a current version here:
https://github.com/edgarigl/xen/tree/edgar/virtio-pvh-upstream 

I've briefly described the steps to run Xen PVH x86 guests here
(including example guest kernel config, xl.cfg and xl command-lines):
https://github.com/edgarigl/docs/blob/master/xen/pvh/xenpvh-x86.md

Cheers,
Edgar

Edgar E. Iglesias (10):
  MAINTAINERS: Add docs/system/arm/xenpvh.rst
  hw/arm: xenpvh: Update file header to use SPDX
  hw/arm: xenpvh: Tweak machine description
  hw/arm: xenpvh: Add support for SMP guests
  hw/arm: xenpvh: Break out a common PVH module
  hw/arm: xenpvh: Rename xen_arm.c -> xen-pvh.c
  hw/arm: xenpvh: Reverse virtio-mmio creation order
  hw/xen: pvh-common: Add support for creating PCIe/GPEX
  hw/i386/xen: Add a Xen PVH x86 machine
  docs/system/i386: xenpvh: Add a basic description

 MAINTAINERS                     |   2 +
 docs/system/i386/xenpvh.rst     |  49 ++++++
 docs/system/target-i386.rst     |   1 +
 hw/arm/meson.build              |   2 +-
 hw/arm/trace-events             |   5 -
 hw/arm/xen-pvh.c                | 165 ++++++++++++++++++++
 hw/arm/xen_arm.c                | 267 --------------------------------
 hw/i386/xen/meson.build         |   1 +
 hw/i386/xen/xen-pvh.c           | 196 +++++++++++++++++++++++
 hw/xen/meson.build              |   1 +
 hw/xen/trace-events             |   4 +
 hw/xen/xen-pvh-common.c         | 262 +++++++++++++++++++++++++++++++
 include/hw/xen/xen-pvh-common.h |  53 +++++++
 13 files changed, 735 insertions(+), 273 deletions(-)
 create mode 100644 docs/system/i386/xenpvh.rst
 create mode 100644 hw/arm/xen-pvh.c
 delete mode 100644 hw/arm/xen_arm.c
 create mode 100644 hw/i386/xen/xen-pvh.c
 create mode 100644 hw/xen/xen-pvh-common.c
 create mode 100644 include/hw/xen/xen-pvh-common.h

-- 
2.43.0


