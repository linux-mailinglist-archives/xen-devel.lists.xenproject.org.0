Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 56B4987E7F5
	for <lists+xen-devel@lfdr.de>; Mon, 18 Mar 2024 12:05:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.694589.1083449 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmAnW-0007i9-Vm; Mon, 18 Mar 2024 11:04:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 694589.1083449; Mon, 18 Mar 2024 11:04:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmAnW-0007g0-Sc; Mon, 18 Mar 2024 11:04:54 +0000
Received: by outflank-mailman (input) for mailman id 694589;
 Mon, 18 Mar 2024 11:04:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=we9v=KY=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1rmAnU-0007RX-OV
 for xen-devel@lists.xenproject.org; Mon, 18 Mar 2024 11:04:52 +0000
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [2a00:1450:4864:20::536])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 57376e95-e517-11ee-a1ee-f123f15fe8a2;
 Mon, 18 Mar 2024 12:04:51 +0100 (CET)
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-56a0c0a7ebcso947161a12.1
 for <xen-devel@lists.xenproject.org>; Mon, 18 Mar 2024 04:04:50 -0700 (PDT)
Received: from andrewcoop.citrite.net (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 f22-20020aa7d856000000b0056b818544a9sm324882eds.90.2024.03.18.04.04.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Mar 2024 04:04:49 -0700 (PDT)
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
X-Inumbo-ID: 57376e95-e517-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1710759889; x=1711364689; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3r4xHUzG9Ecu6Kjh81DarskT8rMMxBwKozdg2CbJKKU=;
        b=VGSjvriHrAmBT8QviSIZ2SWJCVOP7tkU45nvw6n+OwYD1NNb1eB7KiH88rdFmiVytE
         e8VsSRwtMJdU/tkHRsyXFSKE0WMveDxO5ynBC4IRlurgX8JdQKP5/4fuzmQAZBhFBtFn
         2qLk24isppx7vNmj5P0eDKDaGA0NJhmJI1k0w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710759889; x=1711364689;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3r4xHUzG9Ecu6Kjh81DarskT8rMMxBwKozdg2CbJKKU=;
        b=eTzhaaOCvYT/84OzVmLNyvzQn/+6jjunpT/UWzNQvGa19w1QH+LNsjqAGLa09D+cQ5
         9nw6mg6BOulo2xk25uMrUf2M+USRc1cVyw5GGjeUnxt6J64zE4VETdRsFYagU7FG0z2O
         qyyEL9hlZ6wJqGG+KKKXHHbj0fTVuBee5Car8wXJIQlUuD6olZWrv/naIeJVXtoXNNhQ
         e1EF7XNvFELtad+xIHAn+HxF6LBjFynFarm61AePKKOaoM37M74zBxFb0BpGf2uH7oAr
         1q9aegiod7+BGVVOIDK2DEI2Kyf6I413X3Htf2qj3nur/mXvEcb08JWiRJD/gd/2bGfX
         XcKQ==
X-Gm-Message-State: AOJu0Yx+LwyGJ2msCXfAJ7xTU2inuZyDX7vl41ulfBSyUHjjakwjd3tP
	/kRBAAuZwKunYdjVQNib4u+Qd7rKQKmTZMSBTAkCXXdwy5JE1i1b5z4fZAfQhFjbyMMjjxWJ2m0
	+
X-Google-Smtp-Source: AGHT+IFLI2f2eZwoNNAEBzwVzMi+IqtjO/KUROxj+sr029ZijVt2L8rrEV0WZ4RzMk3zIgMWSZxV1g==
X-Received: by 2002:a05:6402:3589:b0:568:d315:b85e with SMTP id y9-20020a056402358900b00568d315b85emr2525712edc.36.1710759889673;
        Mon, 18 Mar 2024 04:04:49 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Shawn Anastasio <sanastasio@raptorengineering.com>,
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
	Ross Lagerwall <ross.lagerwall@citrix.com>
Subject: [PATCH 0/4] xen/arch: Simplify virtual_region setup
Date: Mon, 18 Mar 2024 11:04:38 +0000
Message-Id: <20240318110442.3653997-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

There is nothing that setup_virtual_regions() does which can't be done at
build time.  Make this happen.

Importantly, this removes logic from needed prior to setting up exceptions.

Andrew Cooper (4):
  xen/link: Introduce a common BUGFRAMES definition
  xen/virtual-region: Rework how bugframe linkage works
  xen/virtual-region: Link the list build time
  xen/virtual-region: Drop setup_virtual_regions()

 xen/arch/arm/setup.c             |   1 -
 xen/arch/arm/traps.c             |   5 +-
 xen/arch/arm/xen.lds.S           |  13 +---
 xen/arch/ppc/xen.lds.S           |  13 +---
 xen/arch/riscv/xen.lds.S         |  13 +---
 xen/arch/x86/setup.c             |   2 -
 xen/arch/x86/xen.lds.S           |  11 +---
 xen/common/bug.c                 |   5 +-
 xen/common/livepatch.c           |   7 +-
 xen/common/virtual_region.c      | 107 +++++++++++++++++--------------
 xen/include/xen/bug.h            |   6 --
 xen/include/xen/virtual_region.h |   5 +-
 xen/include/xen/xen.lds.h        |  17 +++++
 13 files changed, 95 insertions(+), 110 deletions(-)


base-commit: d638e304f13a5ef7d125de5ace5f7828a7b25bac
-- 
2.30.2


