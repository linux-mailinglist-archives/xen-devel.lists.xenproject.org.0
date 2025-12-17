Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B0504CC8E43
	for <lists+xen-devel@lfdr.de>; Wed, 17 Dec 2025 17:54:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1188962.1509953 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vVunH-00031P-Jc; Wed, 17 Dec 2025 16:54:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1188962.1509953; Wed, 17 Dec 2025 16:54:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vVunH-0002zc-Gh; Wed, 17 Dec 2025 16:54:31 +0000
Received: by outflank-mailman (input) for mailman id 1188962;
 Wed, 17 Dec 2025 16:54:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ddEZ=6X=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1vVunG-0002zW-79
 for xen-devel@lists.xenproject.org; Wed, 17 Dec 2025 16:54:30 +0000
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [2a00:1450:4864:20::533])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0d1b3059-db69-11f0-b15b-2bf370ae4941;
 Wed, 17 Dec 2025 17:54:28 +0100 (CET)
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-6419aaced59so9527342a12.0
 for <xen-devel@lists.xenproject.org>; Wed, 17 Dec 2025 08:54:28 -0800 (PST)
Received: from fedora (user-109-243-71-38.play-internet.pl. [109.243.71.38])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b7cfa5d1e89sm2015077966b.69.2025.12.17.08.54.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Dec 2025 08:54:27 -0800 (PST)
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
X-Inumbo-ID: 0d1b3059-db69-11f0-b15b-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765990468; x=1766595268; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/zJ5+/H+aYzeqzgvSsbkH+AEVFKater49hymxlSXKXQ=;
        b=i1BF/m1Z2/rieFbs2DWLXcedFziFQnVp+SOus3iU1Q/CWYeaRLtR7ED3SW4LwapZd1
         drS0YWMKDTNU2woYHKnswPwDJt+uc1iXsLbpzy4GskvuQB/bMm3XNRRfeVanhyRmDsZZ
         qCG2QNHHwdjrD1VN1SOIyYdCiQULNbKIj5SsBVORBBzYKLlYlQmq9kaitGAaQxuLLdBX
         N689EcpQ6aqLhD37vTCyHteJU9VlIc9GWdwUOghLdanjk8gRMAxIs1kE/Bj9OzvRgefR
         YPbRwN1D1NIL646mUoFE7nldnY3br1bPY+gPyZNZV1VVJEPXIS2+ZkHx+SLfwu9htpE2
         nddA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765990468; x=1766595268;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/zJ5+/H+aYzeqzgvSsbkH+AEVFKater49hymxlSXKXQ=;
        b=nUWHaTNXLP7tqpPZpI0X+VV0irqBpW4LLgy9yqLrjo0O/oV9jVlvqu9UesHSMP2YXb
         KCMiQb50x7/5jVlgIosCitg+XG/RCa64sHx1NvPcY0kKiVUAP0gXlyob0Y1sL5FOKwZc
         zmf13KSPLRd63/HLl1/g+7NU2l2uHS3xdhmTmGkaDJSFzGahkRkZNRY2ZtLCXWdxBOAC
         pg76z12MiThMIkgAiH8uoM2nUshQPzhLHx2oy9H0BFmTJNdic6PD4HzCtcvPS7Lr2RTW
         9cE+/+LePoUjxtX9LL6ISHhEGjKf2oB+P+FM9vDGWl1uxVhs8rYhWzAIiH81+50vZXHU
         DfwA==
X-Gm-Message-State: AOJu0Yyq734B7m5kikJVfQNkOUeqbdKfV+aC5WmBzj0WGnWEYkGdZ0ov
	pseFurbCr6awQOUFfqRarJwS2MBQRyIFYNOCZ48euAisw5qUhVbBFsarsjkidQ==
X-Gm-Gg: AY/fxX7LYXN9UcTC91GmzqcmUhlCfGI3T3f/4t5TH+kAl/nyjtVExRkchlZOr2zAJ2B
	fYWIJaQ5ToKeNXLZ84wq8bT07h71iTEIO+ndJGLQbloqX14gdqGytUimOaTSsGuBnQ7aKQUc4gu
	TzZufaa9QdtR2+IgNGqaO8h6Rf1YCNSLlupGyT3i/b6kQIoxke8+tsGzpw1jbWxeneu5WXvWWmO
	Nr+lYAuIDorCgqGHD9JxYqOpxl2bbWUHDnXpLq+FpVdSzdkAatecNZbobWFStJzCpUZsyqpelke
	2W2c0wCPmuFzNQ+gA6TjqGkK/6YDePOEzjyuO6O8AYMFHZ/5Pl0Rl7BrEh+T3kj4M252olWdaGF
	Xizgj551e4fg94bJWrWuQGq5XQgPKYTLf5h5bVuUYqICLuhRg9Zm47I8DCrq69+1iujWZ7Lyur3
	SQCg7IfxISx/VnLmm1pFXFMUKRhKMn5b3POS0aS8257GHaXMqrNRqysjA=
X-Google-Smtp-Source: AGHT+IFKzpOme1QoQZKm69yZjH0M8TGOwskoB+WF8n77mYFYytG3haM619jFd2MNGI7ZzxliYNXWhA==
X-Received: by 2002:a17:907:7206:b0:b73:4006:1875 with SMTP id a640c23a62f3a-b7d2377822fmr1956126866b.38.1765990467878;
        Wed, 17 Dec 2025 08:54:27 -0800 (PST)
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
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v2 0/3] RISC-V: Introduce vSBI framework
Date: Wed, 17 Dec 2025 17:54:17 +0100
Message-ID: <cover.1765888425.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Introduce the vSBI framework to handle extension ecall instruction calls
from a guest.

In this patch series, support is added for only a few extensions and FIDs,
just enough to boot the first guest domains and obtain logs from them. This
keeps the patch series independent from other ongoing work.

It was decided to start with support for the Legacy Extension, as it is still
supported by Linux (so we may need it anyway), and because some of its FIDs
require less functionality to implement at this stage compared to the more
modern extensions.

---
Chabges in v2:
 - Address a comments from v1.
---

Oleksii Kurochko (3):
  xen/riscv: introduce vSBI extension framework
  xen/riscv: add RISC-V legacy SBI extension support for guests
  xen/riscv: add RISC-V virtual SBI base extension support for guests

 xen/arch/riscv/Makefile                |  1 +
 xen/arch/riscv/entry.S                 |  6 +++
 xen/arch/riscv/include/asm/processor.h |  1 +
 xen/arch/riscv/include/asm/sbi.h       | 18 ++++++-
 xen/arch/riscv/include/asm/vsbi.h      | 32 ++++++++++++
 xen/arch/riscv/riscv64/asm-offsets.c   |  1 +
 xen/arch/riscv/setup.c                 |  3 ++
 xen/arch/riscv/traps.c                 |  8 +++
 xen/arch/riscv/vsbi/Makefile           |  3 ++
 xen/arch/riscv/vsbi/base-extension.c   | 71 ++++++++++++++++++++++++++
 xen/arch/riscv/vsbi/core.c             | 56 ++++++++++++++++++++
 xen/arch/riscv/vsbi/legacy-extension.c | 65 +++++++++++++++++++++++
 xen/arch/riscv/xen.lds.S               |  7 +++
 13 files changed, 270 insertions(+), 2 deletions(-)
 create mode 100644 xen/arch/riscv/include/asm/vsbi.h
 create mode 100644 xen/arch/riscv/vsbi/Makefile
 create mode 100644 xen/arch/riscv/vsbi/base-extension.c
 create mode 100644 xen/arch/riscv/vsbi/core.c
 create mode 100644 xen/arch/riscv/vsbi/legacy-extension.c

-- 
2.52.0


