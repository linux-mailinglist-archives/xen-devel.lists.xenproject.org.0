Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C9991AC4B63
	for <lists+xen-devel@lfdr.de>; Tue, 27 May 2025 11:20:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.998153.1378930 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uJqTR-0002dw-NI; Tue, 27 May 2025 09:19:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 998153.1378930; Tue, 27 May 2025 09:19:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uJqTR-0002bb-GL; Tue, 27 May 2025 09:19:53 +0000
Received: by outflank-mailman (input) for mailman id 998153;
 Tue, 27 May 2025 09:19:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PdBa=YL=gmail.com=xakep.amatop@srs-se1.protection.inumbo.net>)
 id 1uJqTQ-0002b1-EP
 for xen-devel@lists.xenproject.org; Tue, 27 May 2025 09:19:52 +0000
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [2a00:1450:4864:20::12e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bb4fc0e5-3adb-11f0-b894-0df219b8e170;
 Tue, 27 May 2025 11:19:46 +0200 (CEST)
Received: by mail-lf1-x12e.google.com with SMTP id
 2adb3069b0e04-54d6f933152so5271645e87.1
 for <xen-devel@lists.xenproject.org>; Tue, 27 May 2025 02:19:50 -0700 (PDT)
Received: from yp-VivoBook-ASUSLaptop-M1503QA-M1503QA.. ([95.67.15.120])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5521b9f9decsm1663715e87.157.2025.05.27.02.19.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 May 2025 02:19:48 -0700 (PDT)
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
X-Inumbo-ID: bb4fc0e5-3adb-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748337589; x=1748942389; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=p8R2uwd0TUV2vq9idtVEqlqIwSBIFPpKCtLoSAbkW/o=;
        b=E8D6Mh1WR2ZTCq68Se7mQkdBmBja3/MYIT8LHbKw43T6XORaJnKCa5tz7VSnltZSR6
         B1WkMJLRFzFpcAkSPq14paBHmUpAWrnqGFuMWX/w2Kd5PxvscqI1J/hfQx7Ekxl3Dgc2
         aLhqqynDLY6J5Jw7b4EDXsq94aFP5CHGg9o5Le8ZRonR17aPr+BDjihE/OVOhw/f83B3
         8cWj4yD3ENI2QzCbM7AU8xRpoxgsozm959FwlioyoLBIdIKUevDmaavJIN6wolPbPCHX
         pcQ4zY4bis9ekFM+aFcMC4MxvQyscqkIuypumzGOHiy3T4DUNV/5gAU997GbjGcNGBR7
         0WmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748337589; x=1748942389;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=p8R2uwd0TUV2vq9idtVEqlqIwSBIFPpKCtLoSAbkW/o=;
        b=OHtpwu60bpK1HwAzSQnHzlzYIgWcrbJbg/qxyVVhQr3gOWdWWftji//bQ4cjCVaUsN
         U/UaqClPV+TN0I7RGkgJnJDaVBqqAD0YqspvuiQ4Jq+ZPvsKdqZik2Fx8N6zFLMAlHEE
         SO3xdqjQZf25PQ7PFRswaQQQMrbOc+Rj1b59Q9lkEzmgo4LyA1BDyVccHAxxOftJNwvg
         V6P8z5NWvOlPABIxL0BvlyrIf+19mwMpwJVSgy9BLAvPaMVDqQ6+GrrrwQ8hYa6Bg62w
         W5wVoombnKMqZin6fe8xRBB6WTB3MPh+oCuQ5gP7RbWlQOLWCj/W+Bttj05L2Boc11dp
         Jr4Q==
X-Gm-Message-State: AOJu0YxCe11CeqqlaAyl+J29tq0Tk7vwqD7J/EFeAR+NfljpU2bRlNqZ
	41K9qZ2AhbrCKk82bN+TuQ94/RglUa6g4HOXhN1ckaOiGM1WMJdv4KUO2VfwPG6O
X-Gm-Gg: ASbGncso99wnW/MDuS9IqEOBjW4ZRmEP+Q3SY1yHltnyv4+5hBbozBj5lDlQfI53LUy
	pSx0XXj8wx+5sdJaZRX2vBzMz9RI+Qcl1VOqrNZZHxAV4Sld5IPuXpdQI0k+RvulTLir+7A3VF9
	0OZFduTUSQJ2JweimxnL4fe6mlrZMM03glOvil4u3tee8wrPd8/Q/c3pim4rnWWsAnIhPjWtXSu
	OmkzRVNoT0IbMiUjEaqMI1VTdIaCQ9nQ+cn9uDE/ajZfogQ6nav0ryISst+cJIs0wyxDnZjSlf1
	9jByyusrlbQvnD1pUZIv49RF1kGLhIJu2C0Oa9RlQNMmlFVBz6nZaAMcrM7BAbB+BxP/MqxGu7D
	/C/i1ww3BYDdNtks=
X-Google-Smtp-Source: AGHT+IGCQsvJkMXA2rfh8Zw6Ppmsb2SJ+rmcvCHFBUWkn1BHLN+8iXRIgxUHSicUk39ZpAtQqSKg1w==
X-Received: by 2002:a05:6512:3083:b0:54f:c580:af96 with SMTP id 2adb3069b0e04-5521cbafba7mr3274636e87.50.1748337588876;
        Tue, 27 May 2025 02:19:48 -0700 (PDT)
From: Mykola Kvach <xakep.amatop@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Mykola Kvach <mykola_kvach@epam.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Community Manager <community.manager@xenproject.org>
Subject: [PATCH v4][PART 1 0/4] Enable guest suspend/resume support on ARM via vPSCI
Date: Tue, 27 May 2025 12:18:53 +0300
Message-ID: <cover.1748337249.git.mykola_kvach@epam.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Mykola Kvach <mykola_kvach@epam.com>

This patch series introduces the initial support for guest suspend
and resume on ARM platforms using the PSCI SYSTEM_SUSPEND interface. The main
goal is to allow ARM guests to request suspension using PSCI and be resumed
by the control domain (e.g., via "xl resume").

### Background

The PSCI SYSTEM_SUSPEND call is part of the PSCI v1.0+ specification and is
used by guests to enter the deepest possible power state. On Xen/ARM, we
emulate this interface in the virtual PSCI (vPSCI) layer for guests.

This series includes:

1. A new vPSCI implementation of the PSCI SYSTEM_SUSPEND function for guests
2. Documentation updates to SUPPORT.md to reflect PSCI and vPSCI support status
3. Enabling "xl resume" command compilation for ARM, which was previously disabled

### Usage

For Linux-based guests:
  - Suspend can be triggered using: "echo mem > /sys/power/state" or "systemctl suspend"
  - Resume can be performed from control domain using: "xl resume <domain>"

For more information, refer to the official Linux kernel documentation on power management.

Note that currently, SYSTEM_SUSPEND is supported only for guest domains (not for
the hardware domain), and behaves as a logical standby. More details can be found in
the appropriate commit message and in the code comments.
---

TODO: enable "xl suspend" for ARM
---
Previous versions of this patch series:
  V1: https://lists.xenproject.org/archives/html/xen-devel/2018-11/msg01093.html
  V2: https://marc.info/?l=xen-devel&m=166514782207736&w=2
  V3: https://lists.xenproject.org/archives/html/xen-devel/2025-03/msg00168.html


This is the first part of previous patch series and originally consist only
with necessary changes needed for guest domain suspend.

Mykola Kvach (4):
  tools/xl: allow resume command compilation for arm
  xen/arm: Implement PSCI SYSTEM_SUSPEND call for guests
  SUPPORT.md: Document ARM PSCI and vPSCI support
  CHANGELOG: Mention Xen suspend/resume to RAM feature on arm64

 CHANGELOG.md                          |  1 +
 SUPPORT.md                            | 15 +++++++
 tools/include/libxl.h                 |  1 -
 tools/xl/xl.h                         |  2 +-
 tools/xl/xl_cmdtable.c                |  2 +-
 tools/xl/xl_vmcontrol.c               | 12 ++---
 xen/arch/arm/include/asm/perfc_defn.h |  1 +
 xen/arch/arm/include/asm/psci.h       |  2 +
 xen/arch/arm/vpsci.c                  | 64 +++++++++++++++++++++++++++
 9 files changed, 91 insertions(+), 9 deletions(-)

-- 
2.48.1


