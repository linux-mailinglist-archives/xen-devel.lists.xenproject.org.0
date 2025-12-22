Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0848DCD6AD9
	for <lists+xen-devel@lfdr.de>; Mon, 22 Dec 2025 17:37:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1192150.1511492 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vXiup-0000UX-0o; Mon, 22 Dec 2025 16:37:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1192150.1511492; Mon, 22 Dec 2025 16:37:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vXiuo-0000SK-U9; Mon, 22 Dec 2025 16:37:46 +0000
Received: by outflank-mailman (input) for mailman id 1192150;
 Mon, 22 Dec 2025 16:37:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ACBk=64=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1vXiun-00085h-C6
 for xen-devel@lists.xenproject.org; Mon, 22 Dec 2025 16:37:45 +0000
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [2a00:1450:4864:20::62d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8302be99-df54-11f0-9cce-f158ae23cfc8;
 Mon, 22 Dec 2025 17:37:31 +0100 (CET)
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-b7355f6ef12so743214166b.3
 for <xen-devel@lists.xenproject.org>; Mon, 22 Dec 2025 08:37:31 -0800 (PST)
Received: from fedora (user-109-243-71-38.play-internet.pl. [109.243.71.38])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-64b9105655asm10977819a12.9.2025.12.22.08.37.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Dec 2025 08:37:30 -0800 (PST)
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
X-Inumbo-ID: 8302be99-df54-11f0-9cce-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766421451; x=1767026251; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UfaMQVt71vudvZ+6o553qPxHKZsQhzxz3nxmG/7MgzY=;
        b=gZwGr8xWzT02772LM4V8/wExtqXsEkVx7g3K3RZdMfe4RR8jt7hHgVmacgXl8Lp/tQ
         4haysiOCJg6msOQb4vJ7Trd4Wcdx09wt7yzqE8++/vgZd+IT78uoTDZ0vtXbftUGsSMm
         5aJeqd5HXX0MBYG0sYyAjTtY/divf4tJXR/OpUxiSG9RPPFiAq3xmajeixKc79wSWkUN
         k3Z3rMtzdy94qk7eMb65t9hOgypDTl/CjRYBgA12w7T372nSJl3Rl9XzOZtXW9XtA9Do
         TrEg6M6eHLmYrhwi8inkzosw9AG1Ev3cmi8egfV4GmHq9f16+kZDNBU7E+NTRXA412WM
         bYdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766421451; x=1767026251;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UfaMQVt71vudvZ+6o553qPxHKZsQhzxz3nxmG/7MgzY=;
        b=l0jOfGS8nhQX0GkFdkxMUdPzvUmn6hzDDEMEtCOAJxkefiIyJZqKzHe6Oq2jFGi83N
         s1OUzoPYkZsD6LnnrM63OqnniscYRjR4r8AxzDHZQ9cjv3ZPAmVH1BNkzAzh1Epb2h2g
         QEuBo28HVtLSDYI0n6ObwWmOX/IYglIcJgHtRTaF20b1Eg8CrsFGh/0pWVgzUf/OzIiD
         nKHyqXhVmsYMvFuEiiY914LL9WDgKhUbOaaQQU7loKhrxOHCH1NuMMnKrnEiZi+6CMHQ
         /Gpo66jndwZQGgSFWUH2Vg+Zl79x8E0A+Os9p/0GfCrHclXYROAVojPR/mDmhv1kEjAO
         XdYg==
X-Gm-Message-State: AOJu0Yxaj3vYuYptZPTCecvZ6Yhc7zcPJJsUSdnILM5qY/aLU/Qi45sr
	42fr/nJW5FDlgLzeM9gl7+ngH1ClNl4zWmBOXPj1Hy9YcF4ITCJy3+VTdOCbag==
X-Gm-Gg: AY/fxX6cIJ/aYV4oAsAuCr2coCrfjH+EthZTnVSGi2g4rtRFeYUnVS3ge3HSlGxZ5nm
	0oIAVVEqE5ckSQOmMnvf6bMqj5Sh3w1MGnARCfkMSrdBd1ComhqpcT5Z9JnSP1fQGrEP+6OWQZR
	BWBNsyOlBp4MvfLhTOd+/iCikx/D/1MXKh/N/q3YCNOFPozmi7ZT8LlSqQfGuBpewNMuQrCOtOt
	Ni6/BGTdsbGh4n/caEqaRAI5h+hcOmxYfAuz2VA92i3rA0xra2/fjlgKz7hLsF3QyNvsrwNQNtD
	t5EIifpaBPwa+RKGQHVXVnBPx8ZK8sAYLz+gmqI4lzAXzjH+kfIauFGJmI/IjBS7SgQ2XX74EJd
	SotWwGAlnEI1zw16vW+BdWENz/5MkiZynffDn9UWMRvl0MuDWlQm6eCYIDRxzudSS1xuuoL2lfE
	bvl2b5c4EmZaTom+4ArGzfMBGDN/hsYFimPO7pRkS/3Tkq8kwa+5x+PQA=
X-Google-Smtp-Source: AGHT+IGvXT3pTP0j8wqYblo4WAN9/SFFYARSVhXay+MvpV+gtEzGYzertZngk3eBbBhQ73TrTRc30Q==
X-Received: by 2002:a17:906:730f:b0:b73:9937:e96b with SMTP id a640c23a62f3a-b8037183903mr1275110066b.52.1766421450688;
        Mon, 22 Dec 2025 08:37:30 -0800 (PST)
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
Subject: [PATCH v3 0/3] RISC-V: Introduce vSBI framework
Date: Mon, 22 Dec 2025 17:37:18 +0100
Message-ID: <cover.1766399205.git.oleksii.kurochko@gmail.com>
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

CI tests: https://gitlab.com/xen-project/people/olkur/xen/-/pipelines/2228014400

---
Changes in v3:
 - Address a comments from v2.
---
Changes in v2:
 - Address a comments from v1.
---

Oleksii Kurochko (3):
  xen/riscv: introduce vSBI extension framework
  xen/riscv: add RISC-V legacy SBI extension support for guests
  xen/riscv: add RISC-V virtual SBI base extension support for guests

 xen/arch/riscv/Makefile                |  1 +
 xen/arch/riscv/entry.S                 |  6 ++
 xen/arch/riscv/include/asm/processor.h |  1 +
 xen/arch/riscv/include/asm/sbi.h       | 21 ++++++-
 xen/arch/riscv/include/asm/vsbi.h      | 31 ++++++++++
 xen/arch/riscv/riscv64/asm-offsets.c   |  1 +
 xen/arch/riscv/setup.c                 |  3 +
 xen/arch/riscv/traps.c                 |  8 +++
 xen/arch/riscv/vsbi/Makefile           |  3 +
 xen/arch/riscv/vsbi/base-extension.c   | 78 ++++++++++++++++++++++++++
 xen/arch/riscv/vsbi/core.c             | 57 +++++++++++++++++++
 xen/arch/riscv/vsbi/legacy-extension.c | 64 +++++++++++++++++++++
 xen/arch/riscv/xen.lds.S               |  7 +++
 13 files changed, 279 insertions(+), 2 deletions(-)
 create mode 100644 xen/arch/riscv/include/asm/vsbi.h
 create mode 100644 xen/arch/riscv/vsbi/Makefile
 create mode 100644 xen/arch/riscv/vsbi/base-extension.c
 create mode 100644 xen/arch/riscv/vsbi/core.c
 create mode 100644 xen/arch/riscv/vsbi/legacy-extension.c

-- 
2.52.0


