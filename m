Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D4F5C9E9E7
	for <lists+xen-devel@lfdr.de>; Wed, 03 Dec 2025 11:00:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1176556.1501016 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vQjev-00040f-0R; Wed, 03 Dec 2025 10:00:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1176556.1501016; Wed, 03 Dec 2025 10:00:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vQjeu-0003xd-RD; Wed, 03 Dec 2025 10:00:28 +0000
Received: by outflank-mailman (input) for mailman id 1176556;
 Wed, 03 Dec 2025 10:00:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1EAn=6J=gmail.com=xakep.amatop@srs-se1.protection.inumbo.net>)
 id 1vQjes-0003xM-N4
 for xen-devel@lists.xenproject.org; Wed, 03 Dec 2025 10:00:26 +0000
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [2a00:1450:4864:20::632])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e375cb0d-d02e-11f0-9d1a-b5c5bf9af7f9;
 Wed, 03 Dec 2025 11:00:25 +0100 (CET)
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-b727f452fffso115351066b.1
 for <xen-devel@lists.xenproject.org>; Wed, 03 Dec 2025 02:00:25 -0800 (PST)
Received: from EPUAKYIW02F7.. (pool185-5-253-211.as6723.net. [185.5.253.211])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-647510615c0sm18190969a12.30.2025.12.03.02.00.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Dec 2025 02:00:21 -0800 (PST)
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
X-Inumbo-ID: e375cb0d-d02e-11f0-9d1a-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764756024; x=1765360824; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=MK/pVqfc47MyltDBIvg2lje02DkokilRefxSfXQOmfw=;
        b=ejQwHhkDXrjNz8mfAmvJd9qlFlwfrX+zOs+Hy74lhg31+PLwcDjHm27UjYxg7RU5QG
         VhvjL5LMwzx1vYTy85jOuaiLRL5VsG1eU+AixmbtFsSa0Ewm6+1bqUYLMZpb65Ne4jl8
         754oKb9Z/33nhiya4hGrEvw9bhuNnlxHWks1R8rNl01AXvFQFTzCFNtSBqY22VX7aomv
         tAekvaHTn9J2VtY3R5aUmzoq+WUDcnfl1nuzRbsBdkczalg77BYq5A3knRtJRo4yAS5B
         umFMs3QFIpAjYzFL7PugsTfzCxbqfv5Mu8kxOqT1C+LID8HDvSutq3eayuDxTh+4mvpP
         hACA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764756024; x=1765360824;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MK/pVqfc47MyltDBIvg2lje02DkokilRefxSfXQOmfw=;
        b=Vz5pqqyHEWHCBL1AL39siQED7V20QpeEySier9irFmLewCUOemGPh8b9f/NMBlMJjn
         zGjy7HEsVqm5in8MJ1+WVKIe51K+qv7Sz2hfpWquY1Jp9h8QPef2qChrONva/JHNxOxl
         JA0CTP+5dHMpIPDKfzeDJ0zJnSIhBMoiogfFJW7v9kbCWa+XY6x+nhxiqGw0gZjUzYZU
         yxrlzkHd7LD6x6a+b7tZGRir5mKxULJLj1E0ENonHPDfbv/GSUlND31DquAyem7Y3o9w
         gsBeBt1/PVxVq1xtOeEyfT8P2j/D33OAxkglVsepVhPNvyFZJ94yyizQenYA8cxPnj/F
         cHjg==
X-Gm-Message-State: AOJu0Yxk/now1BxZQmeghOH+9cGGUQedwU/l+3hZn7mvktzLQTBq8y8o
	Qx6ZE4+qRPYkO7K4l8qqy1XYKFStB8hy7gYPBhWAouYM00fhYUNXqeO9+jaNhV3o
X-Gm-Gg: ASbGncu1Xe4NAnFqWZo/sb2L8g2eAYLs8+cE8pfU+fXCOB3uEFpyz5bMrogp4Vfo4uj
	ZltCZd9mHixnOakcSW1tCsbqe4wxvYJeIPXuH9Sdrm782pd0CMt1mfVDAllwuEM32guNx3dAmRu
	lN7bw04xTG8o94eQUvigxn+cYosmUQ86s4fdD27Bk1CRyztdjzwrQIlQuxhz+dnlb0ddKZOpCT5
	yUBwfrtK7yBj8B1e9y/gzjNJzK4uFvDD+5AyvzlWGRQItaO5KRg8zrVUfVoaEr571kgKNRdLyRj
	6up3csDwgtdzsA1DH+usIPrFyd+/IhkqMjCFAk36+HeX0HlNGh+zQrWOjBHGIvY0Uo8CCWcTKyT
	zojSnYVm/nHv1EGN8UWxeOJJL3HQg2QunFyXen0rQjQhbU2K15EUwwZlwlVRjtzgJpEpHMozZ8+
	rAyu1KanHqx+4BRAcLa/05bDvkwoLQ0NV2wxcocS7BgAnq2Q==
X-Google-Smtp-Source: AGHT+IFg6lQs2OsZsNCGIWTjjVJLl2dXbCRU2KNHwNow3ieDEL0zFgTAdsdzf5Agaia5hPgyoXOs7Q==
X-Received: by 2002:a17:907:741:b0:b3f:f6d:1d9e with SMTP id a640c23a62f3a-b79c21c52e5mr694119366b.6.1764756022474;
        Wed, 03 Dec 2025 02:00:22 -0800 (PST)
From: Mykola Kvach <xakep.amatop@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Jan Beulich <jbeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Juergen Gross <jgross@suse.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Community Manager <community.manager@xenproject.org>
Subject: [PATCH v15 0/4] Enable guest suspend/resume support on ARM via vPSCI
Date: Wed,  3 Dec 2025 11:57:03 +0200
Message-ID: <cover.1764755558.git.xakep.amatop@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series introduces the initial support for guest suspend
and resume on ARM platforms using the PSCI SYSTEM_SUSPEND interface. The main
goal is to allow ARM guests to request suspension using PSCI and be resumed
by the control domain (e.g., via "xl resume").


Background

The PSCI SYSTEM_SUSPEND call is part of the PSCI v1.0+ specification and is
used by guests to enter the deepest possible power state. On Xen/ARM, we
emulate this interface in the virtual PSCI (vPSCI) layer for guests.

This series includes:

1. A new vPSCI implementation of the PSCI SYSTEM_SUSPEND function for guests
2. Documentation updates to SUPPORT.md to reflect PSCI and vPSCI support status
3. Enabling "xl resume" command compilation for ARM, which was previously disabled


Usage

For Linux-based guests:
  - Suspend can be triggered using: "echo mem > /sys/power/state" or "systemctl suspend"
  - Resume can be performed from control domain using: "xl resume <domain>"

For more information, refer to the official Linux kernel documentation on power management.

Note that currently, SYSTEM_SUSPEND is supported only for guest domains (not for
the hardware domain).
---

This is the first part of previous patch series and originally consist only
with necessary changes needed for guest domain suspend.

The second part can be found here:
    https://patchew.org/Xen/cover.1756763487.git.mykola._5Fkvach@epam.com/
---

Changes in V15:
- add forward declaration of vcpu and domain structures to asm/suspend.h
- minor fixes after review

Mykola Kvach (4):
  xen/arm: Implement PSCI SYSTEM_SUSPEND call for guests
  tools/xl: Allow compilation of 'xl resume' command on Arm
  SUPPORT.md: Document PSCI SYSTEM_SUSPEND support for guests
  CHANGELOG: Document guest suspend/resume to RAM support on Arm

 CHANGELOG.md                          |   4 +
 SUPPORT.md                            |   5 +-
 tools/include/libxl.h                 |   1 -
 tools/xl/xl.h                         |   4 +-
 tools/xl/xl_cmdtable.c                |   4 +-
 tools/xl/xl_migrate.c                 |   2 +-
 tools/xl/xl_saverestore.c             |   2 +-
 tools/xl/xl_vmcontrol.c               |  12 +--
 xen/arch/arm/domain.c                 |  41 +++++++++
 xen/arch/arm/include/asm/domain.h     |   2 +
 xen/arch/arm/include/asm/perfc_defn.h |   1 +
 xen/arch/arm/include/asm/psci.h       |   2 +
 xen/arch/arm/include/asm/suspend.h    |  27 ++++++
 xen/arch/arm/include/asm/vpsci.h      |   5 +-
 xen/arch/arm/vpsci.c                  | 116 +++++++++++++++++++++-----
 xen/common/domain.c                   |   5 ++
 xen/include/xen/suspend.h             |  25 ++++++
 17 files changed, 221 insertions(+), 37 deletions(-)
 create mode 100644 xen/arch/arm/include/asm/suspend.h
 create mode 100644 xen/include/xen/suspend.h

-- 
2.43.0


