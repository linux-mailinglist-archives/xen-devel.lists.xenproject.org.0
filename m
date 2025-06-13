Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F2A7AAD9216
	for <lists+xen-devel@lfdr.de>; Fri, 13 Jun 2025 17:56:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1014702.1392829 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uQ6ln-0005pM-Lf; Fri, 13 Jun 2025 15:56:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1014702.1392829; Fri, 13 Jun 2025 15:56:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uQ6ln-0005on-Iq; Fri, 13 Jun 2025 15:56:43 +0000
Received: by outflank-mailman (input) for mailman id 1014702;
 Fri, 13 Jun 2025 15:56:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=44KY=Y4=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1uQ6lm-0005oc-Lz
 for xen-devel@lists.xenproject.org; Fri, 13 Jun 2025 15:56:42 +0000
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [2a00:1450:4864:20::531])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fef99832-486e-11f0-a309-13f23c93f187;
 Fri, 13 Jun 2025 17:56:41 +0200 (CEST)
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-606b6dbe316so4672433a12.3
 for <xen-devel@lists.xenproject.org>; Fri, 13 Jun 2025 08:56:41 -0700 (PDT)
Received: from fedora.. (user-109-243-64-38.play-internet.pl. [109.243.64.38])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-608b4a93b03sm1357883a12.54.2025.06.13.08.56.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Jun 2025 08:56:39 -0700 (PDT)
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
X-Inumbo-ID: fef99832-486e-11f0-a309-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749830200; x=1750435000; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=YyES95+A2ACc3qewE69Vib3M9QUPkJE2MYtSgOXVrNA=;
        b=RnCUAbA9ofoFdYQ/aqpP8NsBhTtFKRz4Vg/fxoY9y/WLoK8XkvfOEBIm10NH6UKSdU
         SLG4yotYE2RYcpMa0sYSlhz3+Fm7kuP+gw0FAtctcAqhMM8pf7a7J8sESuU2aruDn9RQ
         6q9i2U4L1ndcfUDjexGfv8pE96Btr+9Dy+/eitVYHBKRV6/YfsAxSJEcVIpISh/bQ9xA
         i/PeY3ayzt1mtThKaEQbgclvCMuKd9tVbjoL/ahZow2WJ6uh6qoU4smbuC58z/Mnsbp2
         Ev89kcBLa8/QNS0bmv6zZu5tuGYdtHjSPcDHC+FbbVdgGoUTtT9YBhMK7FKunUpFPnhC
         42cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749830200; x=1750435000;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YyES95+A2ACc3qewE69Vib3M9QUPkJE2MYtSgOXVrNA=;
        b=BjTmkc/6NgBkpwNtfX7JkuRCivib3LUeKNg5Fbqrnuo3CsjvRUTY/IjQROlDGP9+10
         dEqI4JDIx5ESML4zj/3XAH1TTi455D6BUlW6o1+BJaHuPZNHsxUhXGx99jCXGNEbn0KJ
         0PvmoibkkVb2Kg8PBynCWcFPv09EsIVcVZJ2ISRhO0Z6BuIlRUIK4QeddH9YE8QJBfyy
         Ce156VRWmFWFxZ5klASVI7ffbIbxBdXMlFP2kZzBGBt0tlSUx7nhAtB04Xrc3y8ydOnt
         kRcB23f28xHkGAPaowQdcL1bHnyHw+6gNc1NDi0M+V0pSUm3+m6OhS/IN2dBmMsio32P
         nU/Q==
X-Gm-Message-State: AOJu0Yz8+xBmvQQad1JUtHb6GU94ZboUAgl5hI6vP6v1U2Yrd5YhIyAt
	MQx/51EvBKOHAin06pofwfLPpeZqlJxu+3Tx8KyK67C/UXeK08LtC3p+U1Jzvg==
X-Gm-Gg: ASbGncsyaWGQh9ufOmJLY7zkGGgEfQB+uIkBltRn1/IttK841zMB8kYboZy+fYhL4fD
	kj1tginzrqYrzurzx2af2L5NcXiyd80sFiTYo+ic4Ls6Q7tPL+nALVWoBASDZSfrBCgo8GAW1AP
	tnc2rMATOJXNBslSq+h7xuEKqZHf0UFirOz64jKjLES4AjeOFw1n23Qn+LpwsP2nzcpL4QCXGBH
	JTo40X0I6s1bvmUPxGc3vXWgTGaAZ9TC7xweqlq4jwQNq8JgY0DuuFDqJJfuRuPaAjEeiBJ2FUa
	fJ8JZEjVRKuiUcN6HrpWK9Nkppu/9Iv5gRVn9JzaJjJpLo0z1wkZWBKp7FH+Is5WrNGZ3oRakbX
	JQNsCO0+iX7WIBB/7k9G/9SEGplMYjNufj/SSs9s=
X-Google-Smtp-Source: AGHT+IEeV7ubfWODFOomRDVTltfDUbrjxPK/Rf+OVXFMo/Jx7FNTISHgk5rugXobGlpvgFlbMs06JA==
X-Received: by 2002:a05:6402:50cd:b0:607:5987:5ba1 with SMTP id 4fb4d7f45d1cf-608b498986bmr3265084a12.20.1749830200125;
        Fri, 13 Jun 2025 08:56:40 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Bob Eshleman <bobbyeshleman@gmail.com>,
	Connor Davis <connojdavis@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Shawn Anastasio <sanastasio@raptorengineering.com>
Subject: [PATCH v1 0/2] Move alloc_domain_struct() to common code
Date: Fri, 13 Jun 2025 17:56:34 +0200
Message-ID: <cover.1749829230.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

x86 has specific requirements about the allocation of the domain structure,
but that's not the case for ARM or likely other architectures.

Introduce a generic weak function that can be overwritten with an
architecture specific implementation if required.

RISC-V has a compilation issue [1] after an introduction of [2] becuase of
different way inclusion of asm/page.h and asm/mm.h (for more details please
check the patch [3]).
So rework asm/mm.h and asm/page.h includes to match other architectures.

[1] https://gitlab.com/xen-project/people/royger/xen/-/jobs/10328429719#L553
[2] xen/domain: introduce generic weak function for domain struct allocation
[3] xen/riscv: rework asm/mm.h and asm/page.h includes to match other architectures

CI tests:
  https://gitlab.com/xen-project/people/olkur/xen/-/pipelines/1868877289

Oleksii Kurochko (1):
  xen/riscv: rework asm/mm.h and asm/page.h includes to match other
    architectures

Roger Pau Monne (1):
  xen/domain: introduce generic weak function for domain struct
    allocation

 xen/arch/arm/domain.c             | 12 -----------
 xen/arch/ppc/stubs.c              |  5 -----
 xen/arch/riscv/include/asm/mm.h   | 24 ++++++++++++++++++---
 xen/arch/riscv/include/asm/page.h | 35 +------------------------------
 xen/arch/riscv/mm.c               | 14 +++++++++++++
 xen/arch/riscv/stubs.c            |  5 -----
 xen/common/domain.c               | 14 +++++++++++++
 7 files changed, 50 insertions(+), 59 deletions(-)

-- 
2.49.0


