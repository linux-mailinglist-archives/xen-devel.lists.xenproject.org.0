Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 17D93958944
	for <lists+xen-devel@lfdr.de>; Tue, 20 Aug 2024 16:30:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.780528.1190155 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sgPry-0000d1-5I; Tue, 20 Aug 2024 14:29:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 780528.1190155; Tue, 20 Aug 2024 14:29:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sgPry-0000aR-2n; Tue, 20 Aug 2024 14:29:58 +0000
Received: by outflank-mailman (input) for mailman id 780528;
 Tue, 20 Aug 2024 14:29:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=prYO=PT=gmail.com=edgar.iglesias@srs-se1.protection.inumbo.net>)
 id 1sgPrw-0000aG-RE
 for xen-devel@lists.xenproject.org; Tue, 20 Aug 2024 14:29:56 +0000
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [2a00:1450:4864:20::234])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id aada759f-5f00-11ef-8776-851b0ebba9a2;
 Tue, 20 Aug 2024 16:29:54 +0200 (CEST)
Received: by mail-lj1-x234.google.com with SMTP id
 38308e7fff4ca-2f15790b472so68137721fa.0
 for <xen-devel@lists.xenproject.org>; Tue, 20 Aug 2024 07:29:54 -0700 (PDT)
Received: from gmail.com (213-67-3-247-no600.tbcn.telia.com. [213.67.3.247])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2f3b748db7dsm18217371fa.36.2024.08.20.07.29.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Aug 2024 07:29:52 -0700 (PDT)
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
X-Inumbo-ID: aada759f-5f00-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724164194; x=1724768994; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1wqHo/ZnPjHlrmdKYJtuWm38+7FAW/gtzhAalcKMwBA=;
        b=g2ETv82fv0C64EwJ5L/+NsC6NLtjZkhQuECLnFl8aj/i4GFu1j7X780PL3uA33lg0T
         hHLMIs6g9zzsbPUGgyfzAn14S69ufQRnyViy0/ItHj8zVmiXzBobIt6IYL0Hg96/rZA8
         bAZsBvb/I5dfcR/Q54gc+9d9LbjgexLDjBEdFd+oCJ3pBkPdNUxMHd6CB5Hr5PUNUNmw
         1XjLitki5v8Rc/vHIUlWMHgyvxskenQ6JHrEWl1n7Ei6l7tUIJUDbopkLQK6uAIvWz/Y
         AaRxHvtJeSIAVHXJB/eFCCliA9dfE1T8uuYzM1mDHOCtyEHDwFnYBmnwlc2Lp3BIwqex
         wMvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724164194; x=1724768994;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1wqHo/ZnPjHlrmdKYJtuWm38+7FAW/gtzhAalcKMwBA=;
        b=jsmBq15pVxQVtLzho9Tg5fqTFP12sZ3peeqJG1HAO93vSRFxpmwJPEs8ntKFquO/yn
         vSe+guw4zmjmaMtvoXux63U/zf6771bJ3IvYdVc0/O4cVtpOdPbqECfCmdDgd2Thhmi9
         v9ZlXnyVLMOotjyXpj//ARb/TlmIqNv7PMd8QzOD9bJE5EFcqBoH+cexn3et0GaN6XHt
         V5Li7236Hbhinb6DihN3WSuZHGRFO41ZQmY5gaMuxSkVZSv1o9fKRwQ6L2uxggf9ZnDk
         SV4SgsvMmXG/GyYHzMhci0LOg0lV7nKZY2lzuPBC6ZhXeNFIzif5zlu9x4hdvq31ps1C
         pL7A==
X-Forwarded-Encrypted: i=1; AJvYcCXj2yyfGHHZC6eMmEOqGuHdEof2uKYHL1XfIPkCyYqYUNPsUToJIN/kaOwrJ0/E9tSiN8wkTF2sLOc=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yzuwu3Fq3T2M0hU2l/OW19jotWOma92hhU+m3iZT13lHo9SivRs
	RTnJjgQfXfW6RgxbUEpxDPWTPcEGbk216I4ZvnS+fDSnIwtlwX+e
X-Google-Smtp-Source: AGHT+IHmXoWvrk+gxIHZjEW1LKuL3xcHNfeuaWwnRfQPlxHkqzHlE5tf/66Ts3wZhxRwZDt8IqN6DQ==
X-Received: by 2002:a05:651c:199e:b0:2ef:296d:1dda with SMTP id 38308e7fff4ca-2f3be57810fmr104068131fa.1.1724164193085;
        Tue, 20 Aug 2024 07:29:53 -0700 (PDT)
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
Subject: [PATCH v2 00/12] xen: pvh: Partial QOM:fication with new x86 PVH machine
Date: Tue, 20 Aug 2024 16:29:37 +0200
Message-ID: <20240820142949.533381-1-edgar.iglesias@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Edgar E. Iglesias" <edgar.iglesias@amd.com>

This series breaks out parts of the ARM PVH support into an abstract
machine that other targets can reuse.. There's a bit of refactoring
and some bug-fixes along the way.

Finally we add a new x86 xen-pvh machine.

The corresponding changes in Xen for PVH x86 are work in progress
(by Xenia Ragiadakou). You can find a current version here:
https://github.com/edgarigl/xen/tree/edgar/virtio-pvh-upstream 

I've briefly described the steps to run Xen PVH x86 guests here
(including example guest kernel config, xl.cfg and xl command-lines):
https://github.com/edgarigl/docs/blob/master/xen/pvh/xenpvh-x86.md

Cheers,
Edgar

ChangeLog:

v1 -> v2:
* Use an abstract PVH Machine to share code between arch specific
  PVH machines. This allows more sharing than a using a device component.
* Add comments describing our PCI INTX support.
* Allow the PVH target specific implementation to provide PCI
  INTX delivery via class methods.
* Clarify use of mc->max_cpus in comments.
* Use GUEST_MAX_VCPUS mc->max_cpus on ARM.
* Use HVM_MAX_VCPUS mc->max_cpus on x86.
* pvh-common: Directly use s->cfg. members when creating gpex.
* pvh-common: Clarify use of pci-ecam-size in comments.
* x86/xen-pvh: Create smp.max_cpus nr of dummy cores (not smp.cpus).
* x86/xen-pvh: Replace static array holding dummy cores with a dynamic one.
* Move stubbed Xen/ARM functions from hw/arm/xen_arm.c into xen-stubs.c

Edgar E. Iglesias (12):
  MAINTAINERS: Add docs/system/arm/xenpvh.rst
  hw/arm: xenpvh: Update file header to use SPDX
  hw/arm: xenpvh: Tweak machine description
  hw/arm: xenpvh: Add support for SMP guests
  hw/arm: xenpvh: Remove double-negation in warning
  hw/arm: xenpvh: Move stubbed functions to xen-stubs.c
  hw/arm: xenpvh: Break out a common PVH machine
  hw/arm: xenpvh: Rename xen_arm.c -> xen-pvh.c
  hw/arm: xenpvh: Reverse virtio-mmio creation order
  hw/xen: pvh-common: Add support for creating PCIe/GPEX
  hw/i386/xen: Add a Xen PVH x86 machine
  docs/system/i386: xenpvh: Add a basic description

 MAINTAINERS                     |   2 +
 docs/system/i386/xenpvh.rst     |  49 +++++
 docs/system/target-i386.rst     |   1 +
 hw/arm/meson.build              |   5 +-
 hw/arm/trace-events             |   5 -
 hw/arm/xen-pvh.c                |  89 ++++++++
 hw/arm/xen-stubs.c              |  32 +++
 hw/arm/xen_arm.c                | 267 -----------------------
 hw/i386/xen/meson.build         |   1 +
 hw/i386/xen/xen-pvh.c           | 121 +++++++++++
 hw/xen/meson.build              |   1 +
 hw/xen/trace-events             |   4 +
 hw/xen/xen-pvh-common.c         | 362 ++++++++++++++++++++++++++++++++
 include/hw/xen/xen-pvh-common.h |  88 ++++++++
 14 files changed, 754 insertions(+), 273 deletions(-)
 create mode 100644 docs/system/i386/xenpvh.rst
 create mode 100644 hw/arm/xen-pvh.c
 create mode 100644 hw/arm/xen-stubs.c
 delete mode 100644 hw/arm/xen_arm.c
 create mode 100644 hw/i386/xen/xen-pvh.c
 create mode 100644 hw/xen/xen-pvh-common.c
 create mode 100644 include/hw/xen/xen-pvh-common.h

-- 
2.43.0


