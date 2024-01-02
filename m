Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 11D7F821ECE
	for <lists+xen-devel@lfdr.de>; Tue,  2 Jan 2024 16:35:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.660740.1030317 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rKgnt-0007nM-He; Tue, 02 Jan 2024 15:35:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 660740.1030317; Tue, 02 Jan 2024 15:35:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rKgnt-0007kr-E8; Tue, 02 Jan 2024 15:35:41 +0000
Received: by outflank-mailman (input) for mailman id 660740;
 Tue, 02 Jan 2024 15:35:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JX1x=IM=redhat.com=stefanha@srs-se1.protection.inumbo.net>)
 id 1rKgnr-0007fS-RL
 for xen-devel@lists.xenproject.org; Tue, 02 Jan 2024 15:35:39 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 94330e01-a984-11ee-98ef-6d05b1d4d9a1;
 Tue, 02 Jan 2024 16:35:39 +0100 (CET)
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-383-TFxt5OeqMum2uB9b2QHDrA-1; Tue,
 02 Jan 2024 10:35:35 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 014B03C02748;
 Tue,  2 Jan 2024 15:35:33 +0000 (UTC)
Received: from localhost (unknown [10.39.193.188])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0D5AA2166B31;
 Tue,  2 Jan 2024 15:35:31 +0000 (UTC)
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
X-Inumbo-ID: 94330e01-a984-11ee-98ef-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1704209738;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=ouwQCxUmvOVgAb+tQSARaZyGpSNS0e2t7AfE4iNocH4=;
	b=SvskHH0CYnf24VvJo9TnLF4N/S6oU50gjY7L7Ho04VGh7wbeFhByjEmdWy9GUVOw4ICN7i
	7mZj/8pF3DXu9oejOCNU6HCSqywiiIQyqpTMlBUmQCQ8PjW1m3Lnxdb+MmxkGDVc4rsxhC
	3b/pviSXpXCg5yYafIijnsnuX/s96iM=
X-MC-Unique: TFxt5OeqMum2uB9b2QHDrA-1
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Cc: Hanna Reitz <hreitz@redhat.com>,
	qemu-riscv@nongnu.org,
	Roman Bolshakov <rbolshakov@ddn.com>,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
	Elena Ufimtseva <elena.ufimtseva@oracle.com>,
	Eduardo Habkost <eduardo@habkost.net>,
	Thomas Huth <thuth@redhat.com>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	qemu-block@nongnu.org,
	Andrey Smirnov <andrew.smirnov@gmail.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Huacai Chen <chenhuacai@kernel.org>,
	Fam Zheng <fam@euphon.net>,
	Gerd Hoffmann <kraxel@redhat.com>,
	David Gibson <david@gibson.dropbear.id.au>,
	John Snow <jsnow@redhat.com>,
	Stafford Horne <shorne@gmail.com>,
	Weiwei Li <liwei1518@gmail.com>,
	Jean-Christophe Dubois <jcd@tribudubois.net>,
	Cameron Esfahani <dirty@apple.com>,
	Alexander Graf <agraf@csgraf.de>,
	David Hildenbrand <david@redhat.com>,
	Juan Quintela <quintela@redhat.com>,
	Nicholas Piggin <npiggin@gmail.com>,
	Max Filippov <jcmvbkbc@gmail.com>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Daniel Henrique Barboza <danielhb413@gmail.com>,
	Markus Armbruster <armbru@redhat.com>,
	Peter Xu <peterx@redhat.com>,
	Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
	Richard Henderson <richard.henderson@linaro.org>,
	qemu-s390x@nongnu.org,
	Jiri Slaby <jslaby@suse.cz>,
	Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
	Eric Blake <eblake@redhat.com>,
	Akihiko Odaki <akihiko.odaki@daynix.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Jason Wang <jasowang@redhat.com>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Sunil Muthuswamy <sunilmut@microsoft.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Fabiano Rosas <farosas@suse.de>,
	Michael Roth <michael.roth@amd.com>,
	Paul Durrant <paul@xen.org>,
	Jagannathan Raman <jag.raman@oracle.com>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Hyman Huang <yong.huang@smartx.com>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	xen-devel@lists.xenproject.org,
	Halil Pasic <pasic@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Song Gao <gaosong@loongson.cn>,
	Kevin Wolf <kwolf@redhat.com>,
	Ilya Leoshkevich <iii@linux.ibm.com>,
	Artyom Tarasenko <atar4qemu@gmail.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Reinoud Zandijk <reinoud@netbsd.org>,
	qemu-ppc@nongnu.org,
	Marcelo Tosatti <mtosatti@redhat.com>,
	David Woodhouse <dwmw2@infradead.org>,
	Aurelien Jarno <aurelien@aurel32.net>,
	Bin Meng <bin.meng@windriver.com>,
	qemu-arm@nongnu.org,
	Anthony Perard <anthony.perard@citrix.com>,
	Leonardo Bras <leobras@redhat.com>,
	Hailiang Zhang <zhanghailiang@xfusion.com>,
	Harsh Prateek Bora <harshpb@linux.ibm.com>,
	kvm@vger.kernel.org,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Eric Farman <farman@linux.ibm.com>,
	BALATON Zoltan <balaton@eik.bme.hu>,
	Liu Zhiwei <zhiwei_liu@linux.alibaba.com>
Subject: [PATCH v3 0/5] Make Big QEMU Lock naming consistent
Date: Tue,  2 Jan 2024 10:35:24 -0500
Message-ID: <20240102153529.486531-1-stefanha@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.6

v3:
- Rebase
- Define bql_lock() macro on a single line [Akihiko Odaki]
v2:
- Rename APIs bql_*() [PeterX]
- Spell out "Big QEMU Lock (BQL)" in doc comments [PeterX]
- Rename "iolock" variables in hw/remote/mpqemu-link.c [Harsh]
- Fix bql_auto_lock() indentation in Patch 2 [Ilya]
- "with BQL taken" -> "with the BQL taken" [Philippe]
- "under BQL" -> "under the BQL" [Philippe]

The Big QEMU Lock ("BQL") has two other names: "iothread lock" and "QEMU global
mutex". The term "iothread lock" is easily confused with the unrelated --object
iothread (iothread.c).

This series updates the code and documentation to consistently use "BQL". This
makes the code easier to understand.

Stefan Hajnoczi (5):
  system/cpus: rename qemu_mutex_lock_iothread() to bql_lock()
  qemu/main-loop: rename QEMU_IOTHREAD_LOCK_GUARD to BQL_LOCK_GUARD
  qemu/main-loop: rename qemu_cond_wait_iothread() to
    qemu_cond_wait_bql()
  Replace "iothread lock" with "BQL" in comments
  Rename "QEMU global mutex" to "BQL" in comments and docs

 docs/devel/multi-thread-tcg.rst      |   7 +-
 docs/devel/qapi-code-gen.rst         |   2 +-
 docs/devel/replay.rst                |   2 +-
 docs/devel/reset.rst                 |   2 +-
 docs/devel/multiple-iothreads.txt    |  14 ++--
 hw/display/qxl.h                     |   2 +-
 include/block/aio-wait.h             |   2 +-
 include/block/blockjob.h             |   6 +-
 include/exec/cpu-common.h            |   2 +-
 include/exec/memory.h                |   4 +-
 include/exec/ramblock.h              |   2 +-
 include/io/task.h                    |   2 +-
 include/migration/register.h         |   8 +-
 include/qemu/coroutine-core.h        |   2 +-
 include/qemu/coroutine.h             |   2 +-
 include/qemu/main-loop.h             |  68 ++++++++-------
 include/qemu/thread.h                |   2 +-
 target/arm/internals.h               |   4 +-
 accel/accel-blocker.c                |  10 +--
 accel/dummy-cpus.c                   |   8 +-
 accel/hvf/hvf-accel-ops.c            |   4 +-
 accel/kvm/kvm-accel-ops.c            |   4 +-
 accel/kvm/kvm-all.c                  |  22 ++---
 accel/tcg/cpu-exec.c                 |  26 +++---
 accel/tcg/cputlb.c                   |  20 ++---
 accel/tcg/tcg-accel-ops-icount.c     |   6 +-
 accel/tcg/tcg-accel-ops-mttcg.c      |  12 +--
 accel/tcg/tcg-accel-ops-rr.c         |  18 ++--
 accel/tcg/tcg-accel-ops.c            |   2 +-
 accel/tcg/translate-all.c            |   2 +-
 cpu-common.c                         |   4 +-
 dump/dump.c                          |   4 +-
 hw/block/dataplane/virtio-blk.c      |   8 +-
 hw/block/virtio-blk.c                |   2 +-
 hw/core/cpu-common.c                 |   6 +-
 hw/display/virtio-gpu.c              |   2 +-
 hw/i386/intel_iommu.c                |   6 +-
 hw/i386/kvm/xen_evtchn.c             |  30 +++----
 hw/i386/kvm/xen_gnttab.c             |   2 +-
 hw/i386/kvm/xen_overlay.c            |   2 +-
 hw/i386/kvm/xen_xenstore.c           |   2 +-
 hw/intc/arm_gicv3_cpuif.c            |   2 +-
 hw/intc/s390_flic.c                  |  18 ++--
 hw/mips/mips_int.c                   |   2 +-
 hw/misc/edu.c                        |   4 +-
 hw/misc/imx6_src.c                   |   2 +-
 hw/misc/imx7_src.c                   |   2 +-
 hw/net/xen_nic.c                     |   8 +-
 hw/ppc/pegasos2.c                    |   2 +-
 hw/ppc/ppc.c                         |   6 +-
 hw/ppc/spapr.c                       |   2 +-
 hw/ppc/spapr_events.c                |   2 +-
 hw/ppc/spapr_rng.c                   |   4 +-
 hw/ppc/spapr_softmmu.c               |   4 +-
 hw/remote/mpqemu-link.c              |  22 ++---
 hw/remote/vfio-user-obj.c            |   2 +-
 hw/s390x/s390-skeys.c                |   2 +-
 hw/scsi/virtio-scsi-dataplane.c      |   6 +-
 migration/block-dirty-bitmap.c       |  14 ++--
 migration/block.c                    |  38 ++++-----
 migration/colo.c                     |  62 +++++++-------
 migration/dirtyrate.c                |  12 +--
 migration/migration.c                |  54 ++++++------
 migration/ram.c                      |  16 ++--
 net/tap.c                            |   2 +-
 replay/replay-internal.c             |   2 +-
 semihosting/console.c                |   8 +-
 stubs/iothread-lock.c                |   6 +-
 system/cpu-throttle.c                |   6 +-
 system/cpus.c                        |  55 +++++++------
 system/dirtylimit.c                  |   4 +-
 system/memory.c                      |   2 +-
 system/physmem.c                     |  14 ++--
 system/runstate.c                    |   2 +-
 system/watchpoint.c                  |   4 +-
 target/arm/arm-powerctl.c            |  14 ++--
 target/arm/helper.c                  |   6 +-
 target/arm/hvf/hvf.c                 |   8 +-
 target/arm/kvm.c                     |   8 +-
 target/arm/ptw.c                     |   6 +-
 target/arm/tcg/helper-a64.c          |   8 +-
 target/arm/tcg/m_helper.c            |   6 +-
 target/arm/tcg/op_helper.c           |  24 +++---
 target/arm/tcg/psci.c                |   2 +-
 target/hppa/int_helper.c             |   8 +-
 target/i386/hvf/hvf.c                |   6 +-
 target/i386/kvm/hyperv.c             |   4 +-
 target/i386/kvm/kvm.c                |  28 +++----
 target/i386/kvm/xen-emu.c            |  16 ++--
 target/i386/nvmm/nvmm-accel-ops.c    |   6 +-
 target/i386/nvmm/nvmm-all.c          |  20 ++---
 target/i386/tcg/sysemu/fpu_helper.c  |   6 +-
 target/i386/tcg/sysemu/misc_helper.c |   4 +-
 target/i386/whpx/whpx-accel-ops.c    |   6 +-
 target/i386/whpx/whpx-all.c          |  24 +++---
 target/loongarch/csr_helper.c        |   4 +-
 target/mips/kvm.c                    |   4 +-
 target/mips/tcg/sysemu/cp0_helper.c  |   4 +-
 target/openrisc/sys_helper.c         |  16 ++--
 target/ppc/excp_helper.c             |  14 ++--
 target/ppc/helper_regs.c             |   2 +-
 target/ppc/kvm.c                     |   4 +-
 target/ppc/misc_helper.c             |   8 +-
 target/ppc/timebase_helper.c         |   8 +-
 target/riscv/cpu_helper.c            |   4 +-
 target/s390x/kvm/kvm.c               |   4 +-
 target/s390x/tcg/misc_helper.c       | 118 +++++++++++++--------------
 target/sparc/int32_helper.c          |   2 +-
 target/sparc/int64_helper.c          |   6 +-
 target/sparc/win_helper.c            |  20 ++---
 target/xtensa/exc_helper.c           |   8 +-
 ui/spice-core.c                      |   6 +-
 util/async.c                         |   2 +-
 util/main-loop.c                     |   8 +-
 util/qsp.c                           |   6 +-
 util/rcu.c                           |  16 ++--
 audio/coreaudio.m                    |   8 +-
 memory_ldst.c.inc                    |  18 ++--
 target/i386/hvf/README.md            |   2 +-
 ui/cocoa.m                           |  56 ++++++-------
 120 files changed, 641 insertions(+), 643 deletions(-)

-- 
2.43.0


