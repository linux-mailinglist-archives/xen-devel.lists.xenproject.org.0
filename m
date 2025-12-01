Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D9760C96A1E
	for <lists+xen-devel@lfdr.de>; Mon, 01 Dec 2025 11:25:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1175649.1500263 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vQ14w-000453-M3; Mon, 01 Dec 2025 10:24:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1175649.1500263; Mon, 01 Dec 2025 10:24:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vQ14w-000420-JN; Mon, 01 Dec 2025 10:24:22 +0000
Received: by outflank-mailman (input) for mailman id 1175649;
 Mon, 01 Dec 2025 10:24:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tSLg=6H=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1vQ14v-00041k-Fh
 for xen-devel@lists.xenproject.org; Mon, 01 Dec 2025 10:24:21 +0000
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [2a00:1450:4864:20::535])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e57550c0-ce9f-11f0-980a-7dc792cee155;
 Mon, 01 Dec 2025 11:24:19 +0100 (CET)
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-640a3317b89so6159149a12.0
 for <xen-devel@lists.xenproject.org>; Mon, 01 Dec 2025 02:24:19 -0800 (PST)
Received: from fedora (user-109-243-71-38.play-internet.pl. [109.243.71.38])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-647510508e1sm12104724a12.27.2025.12.01.02.24.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Dec 2025 02:24:17 -0800 (PST)
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
X-Inumbo-ID: e57550c0-ce9f-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764584658; x=1765189458; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=JXaDdTIaXHz5CwivPwYNGu/Vc2I3vAaM0EXiho61L0Y=;
        b=AeYGr++yVJJrzzQAy30HluUzOBpB2xfMNUPhyzrs7TnmONP8F8WWJS4T9l4V2F5DIs
         XeEdB7J1xaZ5xxmUr7iP4J82EjsdzWMJcbNc5BuXenqHnq/XaUUM04Vcx8wgABG7DViy
         LDu1sksLMz/l68RDAckBKuJydu6vMs0HdF7FXwceHJXoMuue380IFqkrN2Zdzc3CzeNW
         6rhJBJNtA5zCoQOr9D0TN8Ck1rWAUPPzs9oDKBlgpmKt1w/q1q4gHlI4vgdAFHXsis3E
         tBHz3nYAqrQati65SR/UzDhFicAzVQ0og2ahDD4XDhv8SX7Ls6z2zzisZp60CKp/21sS
         O/0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764584658; x=1765189458;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JXaDdTIaXHz5CwivPwYNGu/Vc2I3vAaM0EXiho61L0Y=;
        b=oirHPth/nDyjExfzY2CU6ZQhcMIDXFU7m2h3dlsNVQRGVo/HN1Gm9oLZqryng4kwQ4
         96jlQc1kq0Vpcs/WaqG34X7S1pmpDnv1K/j51Gs03K3kR3EXH3iPH715yHdsJ7cJ+rDg
         ESz9H2p2RHDhkgE92H9C8IpOzKJJTG+oa2oZJuDFbKzZ+GyDwGH7gE74MKwmobyYjQqv
         cyiFedIva0/R7TSztKepWw13B0rfBgYJZcTFpJqLtwbttcoFelo2DKgGACO522QzZ/Bq
         NLCDcLVkPZlYwDdHIjqFnx4vBzPFRbM2vrJCAw+cLqDq0SJlzK/lxI/UPBjpdA8IeR8x
         Cqpw==
X-Gm-Message-State: AOJu0YxY6I+1hx6F6smq0kDHCvCgk76TExehZEirdLNJrT7+vT8Wt5Pt
	qJv6ncnJI4ftWJ3xJFpY4eK6422AR9JKOzyijMjzKibV1TQ16YO3Nx3pRCj6IXB8
X-Gm-Gg: ASbGncuc+wtmlhy0TJTCflFSFJ8+kc3QOfJBvRt2VJJQB7GsV0Ky4TO3ek8Qc6j82l+
	+T9eyrqXgLCNuuMD8FnFL7iH7t7lv10kcOP1xKAqXf4vgg+7/o45m0mMAr8aGcCd3jy44zzHelS
	I6O0DLffHHqBLLDVQUgLN0skpTit5nN2KZ6P8n1qzKV5vsOsXo8obZybrwsFlPOsKQ7xyXuFb69
	IeYZpvGgqAxqtu1HRfMkoO2YkosSLHQdVn5fP7IzLmQLlLtGjDnbtkIbgaKw3M/UUap2TJH1Peh
	g8cPg20ItoiPKbwqLVQt+nyKOWfGjPYDdlpugv4a3F+jzrarAZMWyY6A6n7dKfP4Q3qmlZWOIPC
	IqUQigBuOqc24hA7oic+OOGrTvNAOGQ8x7e0PD37lZw/3H6j0rNKZad4GDKFNVF6ufv6KirH1Fj
	ciDS7sY0ZA2VXGkGNpyxOhiS9AywQoEyus0moRHh6psE1ZpFwZnfEzIY4=
X-Google-Smtp-Source: AGHT+IFczAH9/1T2fKi7euXdl2mU6LAl5n2bUrgGA59CEDKqubzhELS8xwLHITF6n+OK6AbcsJS4gw==
X-Received: by 2002:a05:6402:1449:b0:643:4e9c:d164 with SMTP id 4fb4d7f45d1cf-645eb23f957mr20963081a12.2.1764584658248;
        Mon, 01 Dec 2025 02:24:18 -0800 (PST)
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
Subject: [PATCH v1 0/3] RISC-V: Introduce vSBI framework
Date: Mon,  1 Dec 2025 11:24:07 +0100
Message-ID: <cover.1764582112.git.oleksii.kurochko@gmail.com>
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

Oleksii Kurochko (3):
  xen/riscv: introduce vSBI extension framework
  xen/riscv: add RISC-V legacy SBI extension support for guests
  xen/riscv: add RISC-V virtual SBI base extension support for guests

 xen/arch/riscv/Makefile                     |  1 +
 xen/arch/riscv/include/asm/processor.h      |  1 +
 xen/arch/riscv/include/asm/sbi.h            | 14 +++++-
 xen/arch/riscv/include/asm/vsbi.h           | 31 ++++++++++++
 xen/arch/riscv/sbi.c                        |  8 ++--
 xen/arch/riscv/traps.c                      |  8 ++++
 xen/arch/riscv/vsbi/Makefile                |  3 ++
 xen/arch/riscv/vsbi/vsbi-base-extension.c   | 52 +++++++++++++++++++++
 xen/arch/riscv/vsbi/vsbi-legacy-extension.c | 37 +++++++++++++++
 xen/arch/riscv/vsbi/vsbi.c                  | 46 ++++++++++++++++++
 xen/arch/riscv/xen.lds.S                    |  7 +++
 11 files changed, 203 insertions(+), 5 deletions(-)
 create mode 100644 xen/arch/riscv/include/asm/vsbi.h
 create mode 100644 xen/arch/riscv/vsbi/Makefile
 create mode 100644 xen/arch/riscv/vsbi/vsbi-base-extension.c
 create mode 100644 xen/arch/riscv/vsbi/vsbi-legacy-extension.c
 create mode 100644 xen/arch/riscv/vsbi/vsbi.c

-- 
2.52.0


