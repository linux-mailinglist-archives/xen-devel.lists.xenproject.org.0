Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F1B20CFEDE0
	for <lists+xen-devel@lfdr.de>; Wed, 07 Jan 2026 17:29:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1196893.1514600 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vdWPI-0008NK-OX; Wed, 07 Jan 2026 16:29:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1196893.1514600; Wed, 07 Jan 2026 16:29:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vdWPI-0008MC-Kn; Wed, 07 Jan 2026 16:29:12 +0000
Received: by outflank-mailman (input) for mailman id 1196893;
 Wed, 07 Jan 2026 16:29:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ufZv=7M=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1vdWPG-0007tp-UM
 for xen-devel@lists.xenproject.org; Wed, 07 Jan 2026 16:29:11 +0000
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [2a00:1450:4864:20::630])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fe050a7f-ebe5-11f0-9ccf-f158ae23cfc8;
 Wed, 07 Jan 2026 17:29:09 +0100 (CET)
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-b7633027cb2so428283366b.1
 for <xen-devel@lists.xenproject.org>; Wed, 07 Jan 2026 08:29:09 -0800 (PST)
Received: from fedora (user-109-243-67-101.play-internet.pl. [109.243.67.101])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b842a2bcd30sm564782166b.28.2026.01.07.08.29.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Jan 2026 08:29:08 -0800 (PST)
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
X-Inumbo-ID: fe050a7f-ebe5-11f0-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767803348; x=1768408148; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tjuoYdvWljUojSpx+YIWcKImnV56YQ/NbuvvvfaP9pQ=;
        b=ItX/uXeXjH435npqY+QEV7Bwt51rEWnc8CVcahUN2slQrtzgdl75qVizZ/Vb4Q02LL
         wHV+dKd+VNKkhK6Mwdr0DSDZb5+e/APqaxuggP8c8+xudbQTmCnk+aiDkI9xSix6h3QB
         7Bwi0u7lrwgaPzRR9I2PHzAhq9OZipJOZ65Mgg0P5UgaI4DhgzlSrkPhtLrxLF1bpiZP
         hn4nZ3OXp7S58O33aemvdYH58g3OQtMQbcR3Rggautb4aDKlDB8pYykmIXHsW5BHjRJ0
         3tlNcmsHSqTCxbl4GtuJ0LjIKj9WWnbUMoi+9ks/YQ9WD70YyTOVnu+29UVMGWBKAedA
         w5PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767803348; x=1768408148;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tjuoYdvWljUojSpx+YIWcKImnV56YQ/NbuvvvfaP9pQ=;
        b=T4Ka7BNbymROD85uVFBcGexmrtVhG8ivsPKGgZ9f7TfelYLcm4KqILpUrlZll/bDwO
         tHKEc3M/KZ4tEn7NF/zZYiBDTiBb9rr3HiIgf4Gv1am3IC+EJOwZUepG945fOr2FP431
         8MJmO4DB+qOlZCV4rECKDvCivoQzCC9Ky8bC8X5+9w9TxfpyPO/v1cGTSipZdLMFlIxH
         ZHcV7z1rCbYULb99g6AO1ju+givcalGVQ83dcN0KxWFLc17EWGFX5DZaeLjP8RqQDrTO
         Bu6ehLGHktSKTfDo90nmDrbST+YTPvTJh1rAqDRHcPGkE59kf1NhF0as4qgdjCxXvfVT
         cJ/w==
X-Gm-Message-State: AOJu0Yy6dBQIJEmh8WGiGBXLfPmxhpL2zQENJwF7ESXHANP6fk5jUR0W
	YoRcUlL+Nqf8gUUHcjmk9bOk0UmshLMRuP9hdhS/pMc+LDYXYKvco3XYFirPhQ==
X-Gm-Gg: AY/fxX6LYBhnca7Q2q2zsbKqvoR3DmwI3p5SvsTR8HOmKA/7CcF+CkflAM5PHk9BjMY
	/GKbLx3kgGXAuFEetenIejQPdUbKaOV0kEO0VS+8CbglxGcu7IsM2EqADipih1cFvWPEdBIRZfd
	7OPAJ/1vXFgPUdExUsTT97ZPw3+0zqYNVeyHtL7PglM8+xeYCw9IZk1wZ2skQ8YWWHzb6LxCLXl
	RWjBdyhjDMzazRXizXdfofn2J05h91jv6CRuFm+ZF6NezbLzNc7FqoMPvPLOnNkJlk5Zjm2Dr9W
	B1gxNv7KitZ8QRoD2flyFcOFwOLeUNJrlnbVJWxqibxL2E7E01oxT9qbTD1rxsD4tX567YXORcr
	CVaN/3njWi3fhfsplwLjlikALOHKd4oCZ0s7a84jG5QVn23pENjDAK/xKh8PDhuGxzWJxNimiy0
	OqhlB3Hb22nyZHDuLkkvpAXxAXMjnC/yT5qOrm7zLgV2GSxBwehVhQDA==
X-Google-Smtp-Source: AGHT+IHXSIaRDREifRHmgI4xeNxe/ZwpXciikty4TeBm4vwRs3ZZiRa08WGypmzmoMIpWT8TNWEwRA==
X-Received: by 2002:a17:907:3d42:b0:b80:46f5:cabe with SMTP id a640c23a62f3a-b8444c4d2aemr349138466b.4.1767803348315;
        Wed, 07 Jan 2026 08:29:08 -0800 (PST)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Jan Beulich <jbeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Timothy Pearson <tpearson@raptorengineering.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Connor Davis <connojdavis@gmail.com>
Subject: [PATCH v5 0/3] Move alloc/free_vcpu_struct() to common code
Date: Wed,  7 Jan 2026 17:28:57 +0100
Message-ID: <cover.1767803084.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

As it was suggested in [1] it would be better to allocate one page for struct
vcpu for all arch-es. To do that it is needed to align Arm code to allocate
one page (as there is a case(when CONFIG_NEW_VGIC=y) when Arm64 will require
to allocate two pages). As a result, the following patches for Arm have been
introduced:
 - [PATCH v2 1/4] xen/arm: optimize the size of struct vcpu
 - [PATCH v2 2/4] xen/arm: drop MAX_PAGES_PER_VCPU

This patches are dependency for:
 - [PATCH v2 3/4] xen: move alloc/free_vcpu_struct() to common code

Also, as a part of this patch series another clean up is done which makes
{alloc,free}_domain_struct() static.

[1] https://lore.kernel.org/xen-devel/f8a9be3a-a0c6-496a-806f-40760dca5aee@suse.com/T/#m275dfcbdccef0461fa9a8acef072403f18091768

CI: https://gitlab.com/xen-project/people/olkur/xen/-/pipelines/2246917084

---
Changes in v5:
 - Address the comments recieved for v4.
 - Patch "xen/arm: vcpu_vgic_free() updates" has been merged to staging.
---
Changes in v4:
 - Address the comments recieved for v3.
---
Changes in v3:
 - Come up with a different way to optimize struct vcpu for Arm.
 - Merge patches "[PATCH v2 2/4] xen/arm: drop MAX_PAGES_PER_VCPU]" and
   "[PATCH v2 4/4] xen/common: make {alloc,free}_domain_struct() static"
   together.
 - Clean up vcpu_vgic_free() a little bit.
---
Changes in v2:
 - Introduce new patches for Arm:
     - [PATCH v2 1/4] xen/arm: optimize the size of struct vcpu
     - [PATCH v2 2/4] xen/arm: drop MAX_PAGES_PER_VCPU
    to allocate one page for struct vcpu in common code for all the arch-es.
 - Introduce patch to clean up xen/domain.h a little bit:
     - [PATCH v2 4/4] xen/common: make {alloc,free}_domain_struct() static
 - Address the comments from v1:
     - [PATCH v2 3/4] xen: move alloc/free_vcpu_struct() to common code
---


Oleksii Kurochko (3):
  xen/arm: optimize the size of struct vcpu
  xen: move alloc/free_vcpu_struct() to common code
  xen/common: make {alloc,free}_domain_struct() static

 xen/arch/arm/domain.c               | 32 ---------------
 xen/arch/arm/include/asm/new_vgic.h |  2 +-
 xen/arch/arm/vgic/vgic-init.c       |  7 ++++
 xen/arch/ppc/stubs.c                | 10 -----
 xen/arch/riscv/stubs.c              | 10 -----
 xen/arch/x86/domain.c               | 24 -----------
 xen/arch/x86/include/asm/domain.h   | 12 ++++++
 xen/common/domain.c                 | 62 +++++++++++++++++++----------
 xen/include/xen/domain.h            |  8 ----
 9 files changed, 61 insertions(+), 106 deletions(-)

-- 
2.52.0


