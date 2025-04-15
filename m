Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B20EA8A2D2
	for <lists+xen-devel@lfdr.de>; Tue, 15 Apr 2025 17:34:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.954131.1348462 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4iIi-0004f9-Jg; Tue, 15 Apr 2025 15:34:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 954131.1348462; Tue, 15 Apr 2025 15:34:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4iIi-0004c3-Gl; Tue, 15 Apr 2025 15:34:16 +0000
Received: by outflank-mailman (input) for mailman id 954131;
 Tue, 15 Apr 2025 15:34:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OGoX=XB=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1u4iIg-0004bx-PZ
 for xen-devel@lists.xenproject.org; Tue, 15 Apr 2025 15:34:14 +0000
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com
 [2607:f8b0:4864:20::62c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 13b7b7d7-1a0f-11f0-9eae-5ba50f476ded;
 Tue, 15 Apr 2025 17:34:13 +0200 (CEST)
Received: by mail-pl1-x62c.google.com with SMTP id
 d9443c01a7336-22401f4d35aso65982335ad.2
 for <xen-devel@lists.xenproject.org>; Tue, 15 Apr 2025 08:34:11 -0700 (PDT)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with UTF8SMTPSA id
 d9443c01a7336-22ac7ccbf1esm118389435ad.251.2025.04.15.08.34.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Apr 2025 08:34:08 -0700 (PDT)
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
X-Inumbo-ID: 13b7b7d7-1a0f-11f0-9eae-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1744731249; x=1745336049; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=eocjmM7MVktzfXC5ekMq3Rt6aB9Bq62CMofph8Sa8I4=;
        b=vJe9rUUpmb+CmSV2/p2lsON5BRrZPjB4I/UoIcyvCUAEDORiv9ynscn06lgn++OV+s
         EIC9bXRPQjg0eg+niijCicWmf4uGXylXbt+oabf5Q4NihIPgr4SPsSN5cySu3LXFiuci
         VEKwwVxSeV126P2CSoWzcJN9gNpE2iW4B0Ll4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744731249; x=1745336049;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eocjmM7MVktzfXC5ekMq3Rt6aB9Bq62CMofph8Sa8I4=;
        b=qnowabtioUTD8qGyXmjp3xecNNLWaF7+wrOawr5QEgwyp4HKfEFVsWklwTz6OgbG6o
         wFaxEEs1Z37aT/cceRfhn5WmdLDNsuMZibknt4vI45kr7cUod2kPcaVQCCDy9MMEBiVv
         RKA0t+kyQvjbfU+pCY1ph6ppoFAshJE7F9KJd+88SveQNRAEbcPQK3A3ytgvLfBeWYfm
         MqrAy+6VqXaUGM4WfRddOK3+ylguy62qGTVevarQQD3iJrucShB3IVa0W8ALxLNrUwi7
         tbVX26U54Jxzibwdsu+2sS/KutaoiCWXPt3if1dE8YeEgh7BCRKX1srtavDAsdcfujnT
         speA==
X-Gm-Message-State: AOJu0YyUqQLuW8UpIzb0U2F3OIYXP3anOUHMI/H5Sqv95L2MK/pgM+Vd
	1dKjDoSjkqQcOMAS7TOKF8tBZQ+jvkSxB5BpJYIcWrDfJ9TPuLKMHzTvyzrCT5+sPV3CchrjkrM
	R
X-Gm-Gg: ASbGncucU15fkEXrx8HV1JLoJHeqsFZrHB7vkyVLvsuXsq1LrMmzDs8mmNZ/iyoACrC
	6VEKjRqffLjWq0POHPPVrw2FOL4sf8GW2noVNlH9CiI3RRmpScTyFIwLFRsKW6yaX1RBWVOFsj3
	yAZkn4CB8swbvu5nNVbZkT6Zn97Ap0qS6Iq5pO9HH8VSjpIHSvsRoprwmVzWTCcchmmv2Mnu/nk
	oLhw/euPWDsfL4jJRNaEOVuh/4InGeAkWKZpXkJtKISwmrDMEO7I5rovfkf3+ZqdbGazqoL3vl6
	8lzQfIM2MRzhHExIHkq4f3Vd/UtR6aji63Pn7d6s+NTQgw==
X-Google-Smtp-Source: AGHT+IEQJWFsyQohC+/N2mGb6JxLViFOHHOxkz/pMrIrpSJjx5AG2CwOgXZbxfksi8hC/vunggfBFQ==
X-Received: by 2002:a17:902:e552:b0:223:f408:c3cf with SMTP id d9443c01a7336-22bea4ade61mr203924075ad.21.1744731249435;
        Tue, 15 Apr 2025 08:34:09 -0700 (PDT)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v2 0/4] xen/x86: fix implementation of subpage r/o MMIO
Date: Tue, 15 Apr 2025 17:32:42 +0200
Message-ID: <20250415153246.81688-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hello,

Following series include some bugfixes and improvements to the handling
of subpage r/o MMIO accesses.

Patch 1 introduces a helper to reduce code duplication when performing
MMIO accesses.

Patch 2 is a bugfix for using subpage in HVM guest, and patch 3 is an
optimization to only register the HVM subpage handler when needed.

Finally patch 4 moves some PV only code to a PV specific file.

Thanks, Roger.

Roger Pau Monne (4):
  xen/io: provide helpers for multi size MMIO accesses
  x86/hvm: fix handling of accesses to partial r/o MMIO pages
  x86/hvm: only register the r/o subpage ops when needed
  x86/mm: move mmio_ro_emulated_write() to PV only file

 xen/arch/x86/hvm/Makefile              |   1 +
 xen/arch/x86/hvm/emulate.c             |  51 ++----------
 xen/arch/x86/hvm/hvm.c                 |  18 ++---
 xen/arch/x86/hvm/mmio.c                | 100 ++++++++++++++++++++++++
 xen/arch/x86/hvm/vmsi.c                |  47 +----------
 xen/arch/x86/include/asm/hvm/emulate.h |   1 -
 xen/arch/x86/include/asm/hvm/io.h      |   3 +
 xen/arch/x86/include/asm/mm.h          |  21 ++---
 xen/arch/x86/mm.c                      | 103 ++++++-------------------
 xen/arch/x86/pv/ro-page-fault.c        |  34 ++++++++
 xen/drivers/vpci/msix.c                |  47 +----------
 xen/include/xen/io.h                   |  68 ++++++++++++++++
 12 files changed, 259 insertions(+), 235 deletions(-)
 create mode 100644 xen/arch/x86/hvm/mmio.c
 create mode 100644 xen/include/xen/io.h

-- 
2.48.1


