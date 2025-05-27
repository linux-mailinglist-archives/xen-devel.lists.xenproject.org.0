Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F1641AC5B0A
	for <lists+xen-devel@lfdr.de>; Tue, 27 May 2025 21:56:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.998701.1379425 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uK0PP-0006iy-La; Tue, 27 May 2025 19:56:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 998701.1379425; Tue, 27 May 2025 19:56:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uK0PP-0006g7-I2; Tue, 27 May 2025 19:56:23 +0000
Received: by outflank-mailman (input) for mailman id 998701;
 Tue, 27 May 2025 19:56:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=U5mK=YL=gmail.com=edgar.iglesias@srs-se1.protection.inumbo.net>)
 id 1uK0PO-0006fw-3s
 for xen-devel@lists.xenproject.org; Tue, 27 May 2025 19:56:22 +0000
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [2a00:1450:4864:20::12e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a90a2266-3b34-11f0-a2fe-13f23c93f187;
 Tue, 27 May 2025 21:56:20 +0200 (CEST)
Received: by mail-lf1-x12e.google.com with SMTP id
 2adb3069b0e04-54b10594812so4949667e87.1
 for <xen-devel@lists.xenproject.org>; Tue, 27 May 2025 12:56:20 -0700 (PDT)
Received: from gmail.com (213-67-3-247-no600.tbcn.telia.com. [213.67.3.247])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5532edde873sm7648e87.42.2025.05.27.12.56.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 May 2025 12:56:18 -0700 (PDT)
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
X-Inumbo-ID: a90a2266-3b34-11f0-a2fe-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748375779; x=1748980579; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=M0ACmCi6DjDOLF0IFUFMx4BwdOZTd31cVjcN0muT9K0=;
        b=PKH6pNohFcesOuUBnCGogR6sFf2pxhTPLfmZlbcCVap646UEtGUNJJ7H9Z4XRSPaiH
         xA90cS5NEh1zwPPqZhzDr4FMq0SsuUSNXcZfSnw5dLg/SVsQrTgpwh8wEuYhjbqJvz/G
         Ej4Wf1O8kzl68UeNpwveC+2NqkZZmfbVDVxILf7kw35rGhhsYurFPWEIY+aJLCjsUroO
         XkMdNkpGjgEPS5YMeP853kjOCoXE3EBaVgk1ue/uYqACNuTwdtVPdm5afzQew/FvLd7G
         5zotiKubdxyp/+qRgvkUz92QcXAE4MyjONuIc4VeAR2oby1EpcYKiqt9i1RlT9NmekS8
         cggg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748375779; x=1748980579;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=M0ACmCi6DjDOLF0IFUFMx4BwdOZTd31cVjcN0muT9K0=;
        b=UPmlEt3jyZsDkQI4e6FP8vzLXi1eWmoZScf/LEWpuVEsAJsnX8kSPqMvVJqH0kB1u7
         0WIYkYlLiqwYOiXAccuVNfhUD0M93zpxXph0NwcPOJrQX07WLonIRsrD0oMnorhrYO0r
         21JPLgnxgXmYHpwaSt4GANqu21WZWRa66ufPHkjk0p7Lrw5dscUBFFL75t5XjIf1/ujI
         toSZJ4t+xng7phJs8dIy7Y7avmzARKbB1IhNqf4NW3p8bIzimq/LijofVemRIOmDz4GZ
         0fHIi+fLehQ2pE2kSgo9OWJ9u+g7QQNqMO0C0jiyjdDEmjkQOHu5Cd/b2ZtxiN+Bj6rP
         Tq9A==
X-Gm-Message-State: AOJu0YxDN7rLib2GroIY0DltbChrS4Z4pNtQ7QFVXi9600ngNt6ltdar
	TOUYIRmOwAuNmUw1v7nBBX3EcYqmpeDgsgTy/h29w95jCEco1bt3vv4kiGI5agi6vvs=
X-Gm-Gg: ASbGncs7zkdF3eVHMXJ5ZNZaY+/F0wJondSSkeOdA2xhDrZmUpgC8IwgFZ7cYFuNe21
	CpH4FORAEMRlZNrlIPj4z/6elCrV8nJ4Ngu1fPRpXWD0dL1qYXJXjm1Zmk/bBH5mlDlJt3vocec
	mD7v3j0YqrHQM79jZ29MHH7/VK/1aOA/mJcDhrO/kYZbGRHMWzKYQlpmoMO9oDf68g8T36Bw/0L
	xdc7VJ7oUJbNiwwKHXajEoheLMzmc6iHmZRdyEDnIkidTMiFAfvxMBdnYstkOdusQqeTBFXP23z
	czIwBJPzdfXcZ+mL4s/7Wd9f9MrYyJZoC2XyHaRu4e36SMaPHRi6bDpSvrLDRliIpADRfBGndS3
	Sk4n/+5d0p1q/uoGi2dAG+n0=
X-Google-Smtp-Source: AGHT+IFR1tPw/3LurGIgiLuwjbvfYjKS2oLzFBFxDyCMQ+QLj3atqPptmGtPiO10TwYPMQ/C2k1O3A==
X-Received: by 2002:a05:6512:224b:b0:550:e4f5:741 with SMTP id 2adb3069b0e04-5521c7a8422mr4711395e87.9.1748375779265;
        Tue, 27 May 2025 12:56:19 -0700 (PDT)
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org,
	julien@xen.org,
	bertrand.marquis@arm.com,
	michal.orzel@amd.com,
	Volodymyr_Babchuk@epam.com,
	edgar.iglesias@amd.com
Subject: [PATCH v1 0/3] xen/arm: Add option to optionally disable trapping on unmapped mmio
Date: Tue, 27 May 2025 21:56:13 +0200
Message-ID: <20250527195616.874614-1-edgar.iglesias@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Edgar E. Iglesias" <edgar.iglesias@amd.com>

This follows up on the virtio-pci discussion and adds a per-domain
option to select the behaviour of accesses to unmapped mmio ranges.
The new option is trap-unmapped-mmio. For dom0less I negated it to
be able to use a boolean prop and keep existing behaviour, i.e
trap-unmapped-mmio-disabled.

I'm happy with any name though so if you have better ideas please
suggest them!

For the domain config i followed the example of x86 flags
and XEN_X86_MSR_RELXED, creating a flags field for ARM.

Thanks,
Edgar

Edgar E. Iglesias (3):
  xen/arm: Add a way to disable traps on unmapped MMIO
  xen/arm: dom0less: Add trap-unmapped-mmio-disabled
  tools/arm: Add the trap_unmapped_mmio xl config option

 docs/man/xl.cfg.5.pod.in              |  6 +++++
 docs/misc/arm/device-tree/booting.txt |  7 ++++++
 tools/golang/xenlight/helpers.gen.go  |  3 ++-
 tools/golang/xenlight/types.gen.go    |  1 +
 tools/libs/light/libxl_arm.c          |  7 ++++++
 tools/libs/light/libxl_types.idl      |  1 +
 tools/xl/xl_parse.c                   |  3 +++
 xen/arch/arm/dom0less-build.c         |  4 ++++
 xen/arch/arm/domain.c                 |  2 ++
 xen/arch/arm/domain_build.c           |  3 +++
 xen/arch/arm/include/asm/domain.h     |  2 ++
 xen/arch/arm/io.c                     | 33 +++++++++++++++++++++++++--
 xen/include/public/arch-arm.h         |  9 ++++++++
 13 files changed, 78 insertions(+), 3 deletions(-)

-- 
2.43.0


