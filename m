Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 921383FF0F2
	for <lists+xen-devel@lfdr.de>; Thu,  2 Sep 2021 18:16:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.177409.322801 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mLpNW-00017k-M5; Thu, 02 Sep 2021 16:15:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 177409.322801; Thu, 02 Sep 2021 16:15:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mLpNW-00015s-J3; Thu, 02 Sep 2021 16:15:50 +0000
Received: by outflank-mailman (input) for mailman id 177409;
 Thu, 02 Sep 2021 16:15:48 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=c9UA=NY=gmail.com=philippe.mathieu.daude@srs-us1.protection.inumbo.net>)
 id 1mLpNU-00015i-QN
 for xen-devel@lists.xenproject.org; Thu, 02 Sep 2021 16:15:48 +0000
Received: from mail-wr1-x432.google.com (unknown [2a00:1450:4864:20::432])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d0586f74-3c3b-45c3-9d4d-5e8b10b51373;
 Thu, 02 Sep 2021 16:15:47 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id b10so3884094wru.0
 for <xen-devel@lists.xenproject.org>; Thu, 02 Sep 2021 09:15:47 -0700 (PDT)
Received: from x1w.. (163.red-83-52-55.dynamicip.rima-tde.net. [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id
 j18sm2355853wrd.56.2021.09.02.09.15.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Sep 2021 09:15:45 -0700 (PDT)
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
X-Inumbo-ID: d0586f74-3c3b-45c3-9d4d-5e8b10b51373
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Cx9tmtcMe/yqb/L4FxX6s6fgCGjzmE2xzXTNn5n4WRY=;
        b=mcdkcgUkPmIymlgoHwDrJpvE9KHw9dvSG2MlkuM7+LMu3zkIYpqtCeCGgcISYDoKCb
         8696YyJt2CPh12bbX7QpwDA8IAMyJN7taR/RiiyUq4y4j+fSACZ5oqQ08yGPg+QlMR0S
         hitbbr51iTLrvFSzYtCDWEBhD9WU3oObbn7IgCnxkcpgU8/Bpb/PRbBi6oyJFhSCPB/4
         T4eJ4wL0xOuOcg0FizPKZv0AhuncICKZC1qKdxIbn5OpaC/dbV050AWnqohvIXKAkBb9
         MuFoocUeCUvdcKKf//7Z32DJC9YmwC2EKSjtLp0AMfq+R5Wwnd7FM6PpEyUZ4hvUxjzc
         2tig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :mime-version:content-transfer-encoding;
        bh=Cx9tmtcMe/yqb/L4FxX6s6fgCGjzmE2xzXTNn5n4WRY=;
        b=OwocEGUbclqWd/677oejQXsrZXjgc5UQ+9J8GvdslFFo/Vtv6tLZ6c5NUFLE3+hImw
         ckHmp67mWdqSqLEibxLjf5CCDhO51d08PAkBKWlodtkcCQ0GB2mSPb48nuneKm6vORtt
         Exhc/64bLOIUgZWlHbwUJNQsQoyHXCnD1uvGCHm6i1fR7kwPPq8D/UXNvw6WDySyzofL
         NMpBhkoZBmXZKK4KrRw2QcfygjvXixEKdshDkMhzMNhVs2fxd5Imgku2XtmrB+zN+DY5
         pnKZnG+GpDtQNF6GUT/uoQUiB7gMfj4sYO/5Lju21+VN7uQHq5gDkuNGGNa9514YvSLl
         MF9A==
X-Gm-Message-State: AOAM532VeWCOR6jst8TMpFBX3Crt5lC8mlUjGzbELNXKEFX7FDceZgT+
	vAv9dya/i53k0ZwTNDlAuiY=
X-Google-Smtp-Source: ABdhPJwMW19l1RT5uyseQGoPrvV+9UXH/fieGpgiPEuYOlcUopWj6VFIU2AjhhvSZ8tr8ff4GeIa0w==
X-Received: by 2002:adf:8144:: with SMTP id 62mr4741623wrm.144.1630599347027;
        Thu, 02 Sep 2021 09:15:47 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Cc: Bin Meng <bin.meng@windriver.com>,
	Eduardo Habkost <ehabkost@redhat.com>,
	Greg Kurz <groug@kaod.org>,
	haxm-team@intel.com,
	Kamil Rytarowski <kamil@netbsd.org>,
	qemu-ppc@nongnu.org,
	Anthony Perard <anthony.perard@citrix.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Michael Rolnik <mrolnik@gmail.com>,
	qemu-riscv@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Thomas Huth <thuth@redhat.com>,
	David Hildenbrand <david@redhat.com>,
	Chris Wulff <crwulff@gmail.com>,
	Laurent Vivier <lvivier@redhat.com>,
	Cameron Esfahani <dirty@apple.com>,
	Sunil Muthuswamy <sunilmut@microsoft.com>,
	Max Filippov <jcmvbkbc@gmail.com>,
	Taylor Simpson <tsimpson@quicinc.com>,
	qemu-s390x@nongnu.org,
	Richard Henderson <richard.henderson@linaro.org>,
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	Artyom Tarasenko <atar4qemu@gmail.com>,
	Aurelien Jarno <aurelien@aurel32.net>,
	Paul Durrant <paul@xen.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	David Gibson <david@gibson.dropbear.id.au>,
	Alistair Francis <alistair.francis@wdc.com>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Roman Bolshakov <r.bolshakov@yadro.com>,
	Laurent Vivier <laurent@vivier.eu>,
	Cornelia Huck <cohuck@redhat.com>,
	qemu-arm@nongnu.org,
	Wenchao Wang <wenchao.wang@intel.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	xen-devel@lists.xenproject.org,
	Marek Vasut <marex@denx.de>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	Colin Xu <colin.xu@intel.com>,
	Claudio Fontana <cfontana@suse.de>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Stafford Horne <shorne@gmail.com>,
	Reinoud Zandijk <reinoud@netbsd.org>,
	kvm@vger.kernel.org
Subject: [PATCH v3 00/30] accel: Move has_work() from SysemuCPUOps to AccelOpsClass
Date: Thu,  2 Sep 2021 18:15:13 +0200
Message-Id: <20210902161543.417092-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi,=0D
=0D
CPU has_work() is a per-accelerator handler. This series=0D
- explicit the KVM / WHPX implementations=0D
- moves TCG implementations in AccelOpsClass=0D
- explicit missing implementations (returning 'false').=0D
=0D
Since v2:=0D
- Full rewrite, no more RFC.=0D
=0D
Supersedes: <20210304222323.1954755-1-f4bug@amsat.org>=0D
"cpu: Move CPUClass::has_work() to TCGCPUOps"=0D
=0D
Philippe Mathieu-Daud=C3=A9 (30):=0D
  accel/tcg: Restrict cpu_handle_halt() to sysemu=0D
  hw/core: Restrict cpu_has_work() to sysemu=0D
  hw/core: Un-inline cpu_has_work()=0D
  sysemu: Introduce AccelOpsClass::has_work()=0D
  accel/kvm: Implement AccelOpsClass::has_work()=0D
  accel/whpx: Implement AccelOpsClass::has_work()=0D
  accel/tcg: Implement AccelOpsClass::has_work() as stub=0D
  target/alpha: Restrict has_work() handler to sysemu and TCG=0D
  target/arm: Restrict has_work() handler to sysemu and TCG=0D
  target/avr: Restrict has_work() handler to sysemu and TCG=0D
  target/cris: Restrict has_work() handler to sysemu and TCG=0D
  target/hexagon: Remove unused has_work() handler=0D
  target/hppa: Restrict has_work() handler to sysemu and TCG=0D
  target/i386: Restrict has_work() handler to sysemu and TCG=0D
  target/m68k: Restrict has_work() handler to sysemu and TCG=0D
  target/microblaze: Restrict has_work() handler to sysemu and TCG=0D
  target/mips: Restrict has_work() handler to sysemu and TCG=0D
  target/nios2: Restrict has_work() handler to sysemu and TCG=0D
  target/openrisc: Restrict has_work() handler to sysemu and TCG=0D
  target/ppc: Restrict has_work() handler to sysemu and TCG=0D
  target/ppc: Introduce PowerPCCPUClass::has_work()=0D
  target/ppc: Simplify has_work() handlers=0D
  target/riscv: Restrict has_work() handler to sysemu and TCG=0D
  target/rx: Restrict has_work() handler to sysemu and TCG=0D
  target/s390x: Restrict has_work() handler to sysemu and TCG=0D
  target/sh4: Restrict has_work() handler to sysemu and TCG=0D
  target/sparc: Restrict has_work() handler to sysemu and TCG=0D
  target/tricore: Restrict has_work() handler to sysemu and TCG=0D
  target/xtensa: Restrict has_work() handler to sysemu and TCG=0D
  accel: Add missing AccelOpsClass::has_work() and drop SysemuCPUOps one=0D
=0D
 include/hw/core/cpu.h             |  28 +--=0D
 include/hw/core/tcg-cpu-ops.h     |   4 +=0D
 include/sysemu/accel-ops.h        |   5 +=0D
 target/ppc/cpu-qom.h              |   3 +=0D
 accel/hvf/hvf-accel-ops.c         |   6 +=0D
 accel/kvm/kvm-accel-ops.c         |   6 +=0D
 accel/qtest/qtest.c               |   6 +=0D
 accel/tcg/cpu-exec.c              |   8 +-=0D
 accel/tcg/tcg-accel-ops.c         |  12 ++=0D
 accel/xen/xen-all.c               |   6 +=0D
 hw/core/cpu-common.c              |   6 -=0D
 softmmu/cpus.c                    |  10 +-=0D
 target/alpha/cpu.c                |   4 +-=0D
 target/arm/cpu.c                  |   7 +-=0D
 target/avr/cpu.c                  |   4 +-=0D
 target/cris/cpu.c                 |   4 +-=0D
 target/hexagon/cpu.c              |   6 -=0D
 target/hppa/cpu.c                 |   4 +-=0D
 target/i386/cpu.c                 |   6 -=0D
 target/i386/hax/hax-accel-ops.c   |   6 +=0D
 target/i386/nvmm/nvmm-accel-ops.c |   6 +=0D
 target/i386/tcg/tcg-cpu.c         |   8 +-=0D
 target/i386/whpx/whpx-accel-ops.c |   6 +=0D
 target/m68k/cpu.c                 |   4 +-=0D
 target/microblaze/cpu.c           |  10 +-=0D
 target/mips/cpu.c                 |   4 +-=0D
 target/nios2/cpu.c                |   4 +-=0D
 target/openrisc/cpu.c             |   4 +-=0D
 target/ppc/cpu_init.c             | 324 +++++++++++++++---------------=0D
 target/riscv/cpu.c                |   8 +-=0D
 target/rx/cpu.c                   |   4 +-=0D
 target/s390x/cpu.c                |   4 +-=0D
 target/sh4/cpu.c                  |   7 +-=0D
 target/sparc/cpu.c                |   4 +-=0D
 target/tricore/cpu.c              |   6 +-=0D
 target/xtensa/cpu.c               |  16 +-=0D
 36 files changed, 321 insertions(+), 239 deletions(-)=0D
=0D
-- =0D
2.31.1=0D
=0D

