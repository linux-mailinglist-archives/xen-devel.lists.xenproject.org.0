Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 71498A9216E
	for <lists+xen-devel@lfdr.de>; Thu, 17 Apr 2025 17:27:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.958057.1351023 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u5R8R-0007np-8M; Thu, 17 Apr 2025 15:26:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 958057.1351023; Thu, 17 Apr 2025 15:26:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u5R8R-0007lV-5P; Thu, 17 Apr 2025 15:26:39 +0000
Received: by outflank-mailman (input) for mailman id 958057;
 Thu, 17 Apr 2025 15:26:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Dr0F=XD=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1u5R8P-0007lK-N4
 for xen-devel@lists.xenproject.org; Thu, 17 Apr 2025 15:26:37 +0000
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [2a00:1450:4864:20::62e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 595ac579-1ba0-11f0-9eb0-5ba50f476ded;
 Thu, 17 Apr 2025 17:26:35 +0200 (CEST)
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-ac2a81e41e3so171154266b.1
 for <xen-devel@lists.xenproject.org>; Thu, 17 Apr 2025 08:26:35 -0700 (PDT)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with UTF8SMTPSA id
 a640c23a62f3a-acb6eefc76esm7237866b.104.2025.04.17.08.26.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Apr 2025 08:26:34 -0700 (PDT)
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
X-Inumbo-ID: 595ac579-1ba0-11f0-9eb0-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1744903595; x=1745508395; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=AVqkELojG/lb45njgzcSMmqi6Ubh5ZaZhNGT6y1IyhI=;
        b=vYR+2+YRWFPePAVHWXqFEn4QvUFlOFn0kaS1aoNte4heTNzTWCIQhCz5yJvCg9S+uZ
         0ayF6HSS+6g4MGSmALr6OOAtcK/CM7Z3SGIN634yneWK0MHhG51D0xmdgO45I/T7rBWj
         m98//JMSVoHnkPie4nJPbufchYjkF2DYJCmbc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744903595; x=1745508395;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AVqkELojG/lb45njgzcSMmqi6Ubh5ZaZhNGT6y1IyhI=;
        b=NPEyHhZtDczOrCpDGA7QX/sFlE9byM9RXR21LlsZgRBlhGfwKx0MawngoiZn/I22V3
         IVYHTUOM4LJ9qIcI8PmBq98Xu1nr4L82S8mfM8r8ikCirmZzBRlywOhKSn2YfSjydQgc
         pzoGBzKATOvPiGkeVx+ck4Ppzd3RJcZdf/0mIR6DBZZJRoSrENfd4TKtUpgTAWMlnepY
         jTKeLVSN8r5IPTs9iIPAtDk7iVNp74JTw2E2cdnw8zs+0sW/xtBhluGnWRDU7RjxsDcs
         3SLXJTEG7O7+Y6LCQDFCuswnqNCxho1DdGo/CbwpThUKvEuoXwimzcSHAXKwsWOhC+uZ
         Xjjg==
X-Gm-Message-State: AOJu0Yyl953HbaFyAy8lY+MA8QSUl9Gg6NRrSZYGiaXeWk6uThcf4ALG
	CtbKDZrxKSmOqkbg01M+xO0Pmqgvnu6AOjdrOYk9LCo7FT4xHmijwtLzqnOSKHc+5RWCqfZXJv/
	c
X-Gm-Gg: ASbGncv2PQgMcOwYPFm4SpL6S5q8BwPPufFAV5AxG7QHp4y4LzYpUUuQmi1k2L/21W4
	HVAaKU9h9L7mftqLOQFw8n3bQVzdZp0sWgIgMZyzw88QpYz3PLRrsvghvwzX4emSZHML1F+1GWi
	t8+kOqac3HU7l5XTjr8euggiPCVswVcVBI4eKF2mykjRE7ny9q4pDaUhL1l4Iylvb24Cgt33atH
	HCscpwnvlG3ETdILuvIKRiekBiuoIGZvyf26iH2jYEZG+TD8kD1srqnKLTJptt/AnKYLYnjrayn
	0mDUbzfthmYBB7YPA9kFOXpufw0rykLrkVa2EbZdu8ZDvA==
X-Google-Smtp-Source: AGHT+IEzYJc/6QmwaKfQ+ag0WDL3RULEvOmmyiKDQ3oc5kSwpBcA2FwDxPSz6sGQsmuZ+dCK++jmXQ==
X-Received: by 2002:a17:907:9718:b0:abf:7453:1f1a with SMTP id a640c23a62f3a-acb42a1cdacmr603762466b.36.1744903594749;
        Thu, 17 Apr 2025 08:26:34 -0700 (PDT)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v3 0/4] xen/x86: fix implementation of subpage r/o MMIO
Date: Thu, 17 Apr 2025 17:25:10 +0200
Message-ID: <20250417152514.13702-1-roger.pau@citrix.com>
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
 xen/arch/x86/hvm/emulate.c             |  54 ++---------
 xen/arch/x86/hvm/hvm.c                 |  18 ++--
 xen/arch/x86/hvm/mmio.c                | 125 +++++++++++++++++++++++++
 xen/arch/x86/hvm/vmsi.c                |  47 +---------
 xen/arch/x86/include/asm/hvm/emulate.h |   1 -
 xen/arch/x86/include/asm/hvm/io.h      |   3 +
 xen/arch/x86/include/asm/mm.h          |  21 +++--
 xen/arch/x86/mm.c                      | 101 +++++---------------
 xen/arch/x86/pv/ro-page-fault.c        |  34 +++++++
 xen/drivers/vpci/msix.c                |  47 +---------
 xen/include/xen/io.h                   |  70 ++++++++++++++
 12 files changed, 289 insertions(+), 233 deletions(-)
 create mode 100644 xen/arch/x86/hvm/mmio.c
 create mode 100644 xen/include/xen/io.h

-- 
2.48.1


