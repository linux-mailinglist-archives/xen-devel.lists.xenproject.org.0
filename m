Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B1E70AC8081
	for <lists+xen-devel@lfdr.de>; Thu, 29 May 2025 17:50:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1000009.1380441 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uKfWY-0006r1-7z; Thu, 29 May 2025 15:50:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1000009.1380441; Thu, 29 May 2025 15:50:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uKfWY-0006ob-4m; Thu, 29 May 2025 15:50:30 +0000
Received: by outflank-mailman (input) for mailman id 1000009;
 Thu, 29 May 2025 15:50:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vnej=YN=gmail.com=edgar.iglesias@srs-se1.protection.inumbo.net>)
 id 1uKfWW-0006oV-Jv
 for xen-devel@lists.xenproject.org; Thu, 29 May 2025 15:50:28 +0000
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [2a00:1450:4864:20::12e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a4223cd2-3ca4-11f0-a2ff-13f23c93f187;
 Thu, 29 May 2025 17:50:27 +0200 (CEST)
Received: by mail-lf1-x12e.google.com with SMTP id
 2adb3069b0e04-553241d30b3so1224765e87.3
 for <xen-devel@lists.xenproject.org>; Thu, 29 May 2025 08:50:27 -0700 (PDT)
Received: from gmail.com (213-67-3-247-no600.tbcn.telia.com. [213.67.3.247])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-553379374f4sm362882e87.215.2025.05.29.08.50.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 May 2025 08:50:25 -0700 (PDT)
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
X-Inumbo-ID: a4223cd2-3ca4-11f0-a2ff-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748533827; x=1749138627; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=B4QRnVWhmsvxyrEb6IihLA1iLdgt/uebugKpxTMpdtA=;
        b=KsBJcrhKNswF7EmSzspN8gRSEPuG6nBFgNZkdmzuVvQOnYGLqgthhTVaykmDg3BeZ2
         K9bun43tKV7TUFh+VhypCaHGV54MNqeeFhAABGb6xEfkzkcDFvxNqhLu1Iq1QQnqLmka
         wJo2XAVW7cfbuFhQgNJ94VnM6Gj4vEyYC9ct4OaBHx4+IMQ9D0VhY7oesSYziHGkIFQm
         1pxd+7jSYcvwXKIJtP1kS5FPq5wpbBLUMUZEAiI3UckhJPyT/azNkKWgkvT4UfxINsT3
         98ydMqOKUod/PQRvWyYozKrYndFEU/AOKDkzCR55t8rYSDA5QUHUGMye5c0ixRcctWUF
         NLKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748533827; x=1749138627;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=B4QRnVWhmsvxyrEb6IihLA1iLdgt/uebugKpxTMpdtA=;
        b=fklrXpqR8w5Q9/kEbDMx3/LE6XUJEO7xgpPqh2yo0VsCFzrcpfklcWlAR510C2nkW0
         YJg0ckYUHCE02Cg5gd4PzLI2wueW9UsmPIacx1rO1Utac3VucBa5JSMSKoszvxLFCRYn
         kSmD4jDDeFuYhL3xQuene9IqZYbw7soRomT2f/pf4blsbVarYxxhGR0Cru5l3xMs4nmk
         8R6FItPJyGxVQrrawA/8ew6adP4hj6Ez3CyY9sTcp78q8gHflPszHKpyJuJ22lgGyzsv
         7d5hsxflvFMeNWuV503eKpAEv/8evoo48DgZ23Oyj+aAPfZR0LWM1MYSKTtE0KJSF4vg
         tSLw==
X-Gm-Message-State: AOJu0YwEIizbnrFb4v7/k7x0tp99awAMeTJ1MpE5NHeMBTPwhyrICurA
	HpyzjQ6JtFBSaNL1rQH3PcYj98/Ee+aMTfykIhKNUtaiTIQncMQLXbS2ebsjQFpvbPQ=
X-Gm-Gg: ASbGncu7f3oXXYtZHu88RGoYQq+QLkf7uz/IOUFrp8DmdtRnx9fd4jVh1lxuu7FgMP5
	9J1sQGMmLkhNSf9e2PZrcnz2EJ4ABT+BmWcPPeDcdPm1qf0lfG+qPqdY+y5HM8uixpizlz/Lylr
	VrEgUFsaP5K7nAYuxjpXV424qYl8s4b5MD2Kc34MTTtFSNfJWTBR5u0gu7NbEFnOkLcX3qm8frf
	YvJr0ZNPGY82xycrUiZXYEeQcZmvB+Y1jFgv64oYy7+U8JVcHmRd0wMEhePRIK6uIW8rFXmoDrN
	3Jyxe30T213Xk/uWa+KbSYZS2GNNVSx3L0zGmxhTMb27q1cHmYKexQwj0hD++CZkEyjlOwXm6d1
	/fne6fYPnTJqkD2ypZSv69oU=
X-Google-Smtp-Source: AGHT+IF5Qx85RdNADkm5W+0XahZ0HpGgfoK4VXMiel5mP0+oeVflp0Zg4giCcwQ6EmWZiVSfk7dOwQ==
X-Received: by 2002:a05:6512:3d24:b0:553:390a:e1d3 with SMTP id 2adb3069b0e04-553390ae2e1mr865638e87.48.1748533826455;
        Thu, 29 May 2025 08:50:26 -0700 (PDT)
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org,
	julien@xen.org,
	bertrand.marquis@arm.com,
	michal.orzel@amd.com,
	Volodymyr_Babchuk@epam.com,
	andrew.cooper3@citrix.com,
	edgar.iglesias@amd.com
Subject: [PATCH v2 0/3] xen/arm: Add option to optionally disable trapping on unmapped acceses
Date: Thu, 29 May 2025 17:50:20 +0200
Message-ID: <20250529155024.1284227-1-edgar.iglesias@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Edgar E. Iglesias" <edgar.iglesias@amd.com>

This follows up on the virtio-pci discussion and adds a per-domain
option to select the behaviour of accesses to unmapped address ranges.
The new option is trap_unmapped_accesses, it's general but for now
only implemented for ARM.

I'm happy with any name, so if you have better ideas please suggest them!

Thanks,
Edgar

ChangeLog:

v1 -> v2:
* Rename trap_unmapped_mmio to trap_unmapped_accesses
* Generalize to allow other archs to later support this option
* Change dom0less DT binding from boolean to integer
* Remove changes to autogenerated go bindings

Edgar E. Iglesias (3):
  xen/arm: Add way to disable traps on accesses to unmapped addresses
  xen/arm: dom0less: Add trap-unmapped-accesses
  tools/arm: Add the trap_unmapped_accesses xl config option

 docs/man/xl.cfg.5.pod.in              |  8 ++++++
 docs/misc/arm/device-tree/booting.txt |  9 +++++++
 tools/libs/light/libxl_arm.c          |  3 +++
 tools/libs/light/libxl_create.c       |  3 +++
 tools/libs/light/libxl_types.idl      |  1 +
 tools/libs/light/libxl_x86.c          |  6 +++++
 tools/xl/xl_parse.c                   |  3 +++
 xen/arch/arm/dom0less-build.c         | 10 ++++++++
 xen/arch/arm/domain.c                 |  3 ++-
 xen/arch/arm/domain_build.c           |  3 ++-
 xen/arch/arm/io.c                     | 36 +++++++++++++++++++++++++--
 xen/common/domain.c                   |  3 ++-
 xen/include/public/domctl.h           |  4 ++-
 13 files changed, 86 insertions(+), 6 deletions(-)

-- 
2.43.0


