Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 76C2C827559
	for <lists+xen-devel@lfdr.de>; Mon,  8 Jan 2024 17:36:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.663608.1033630 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rMsc7-00030Y-Ke; Mon, 08 Jan 2024 16:36:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 663608.1033630; Mon, 08 Jan 2024 16:36:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rMsc7-0002ya-Hi; Mon, 08 Jan 2024 16:36:35 +0000
Received: by outflank-mailman (input) for mailman id 663608;
 Mon, 08 Jan 2024 16:36:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EZ8K=IS=redhat.com=stefanha@srs-se1.protection.inumbo.net>)
 id 1rMsc6-0002yU-6j
 for xen-devel@lists.xenproject.org; Mon, 08 Jan 2024 16:36:34 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 13aa11e7-ae44-11ee-9b0f-b553b5be7939;
 Mon, 08 Jan 2024 17:36:31 +0100 (CET)
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-281-KwCnbtp0Nqud2EvJwmvQHA-1; Mon,
 08 Jan 2024 11:36:28 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4AE3829AC022;
 Mon,  8 Jan 2024 16:36:25 +0000 (UTC)
Received: from localhost (unknown [10.39.194.85])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 30CB62166B35;
 Mon,  8 Jan 2024 16:36:21 +0000 (UTC)
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
X-Inumbo-ID: 13aa11e7-ae44-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1704731790;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=RKB+N0/wOsxXAF5xSn+nS3xwiYgd0ai43bmH3YPjDN0=;
	b=iTDiGW+EpStiwlcaDphw8RabgqQUmXV2f7QTAZn7hvVDMYNF1C81J2S8gLtQPFNTOEPqTX
	qgZ/huLS2RHOGBgRMisLAaxBdMIKrC3Qkkf3/CJFwzPW+JXSKQcXt50XAAbD6ZNTsCR4uZ
	W+dmSc+3sVYcjtbnGetSBAt/WOJc4bE=
X-MC-Unique: KwCnbtp0Nqud2EvJwmvQHA-1
Date: Mon, 8 Jan 2024 11:36:19 -0500
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Cc: Hanna Reitz <hreitz@redhat.com>, qemu-riscv@nongnu.org,
	Roman Bolshakov <rbolshakov@ddn.com>,
	=?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>,
	Elena Ufimtseva <elena.ufimtseva@oracle.com>,
	Eduardo Habkost <eduardo@habkost.net>,
	Thomas Huth <thuth@redhat.com>, qemu-block@nongnu.org,
	Andrey Smirnov <andrew.smirnov@gmail.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Huacai Chen <chenhuacai@kernel.org>, Fam Zheng <fam@euphon.net>,
	Gerd Hoffmann <kraxel@redhat.com>,
	David Gibson <david@gibson.dropbear.id.au>,
	John Snow <jsnow@redhat.com>, Stafford Horne <shorne@gmail.com>,
	Weiwei Li <liwei1518@gmail.com>,
	Jean-Christophe Dubois <jcd@tribudubois.net>,
	Cameron Esfahani <dirty@apple.com>,
	Alexander Graf <agraf@csgraf.de>,
	David Hildenbrand <david@redhat.com>,
	Juan Quintela <quintela@redhat.com>,
	Nicholas Piggin <npiggin@gmail.com>,
	Max Filippov <jcmvbkbc@gmail.com>,
	Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Daniel Henrique Barboza <danielhb413@gmail.com>,
	Markus Armbruster <armbru@redhat.com>, Peter Xu <peterx@redhat.com>,
	Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
	Richard Henderson <richard.henderson@linaro.org>,
	qemu-s390x@nongnu.org, Jiri Slaby <jslaby@suse.cz>,
	Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
	Eric Blake <eblake@redhat.com>,
	Akihiko Odaki <akihiko.odaki@daynix.com>,
	Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
	Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Jason Wang <jasowang@redhat.com>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Sunil Muthuswamy <sunilmut@microsoft.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>,
	Fabiano Rosas <farosas@suse.de>,
	Michael Roth <michael.roth@amd.com>, Paul Durrant <paul@xen.org>,
	Jagannathan Raman <jag.raman@oracle.com>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Hyman Huang <yong.huang@smartx.com>,
	=?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@redhat.com>,
	xen-devel@lists.xenproject.org, Halil Pasic <pasic@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Song Gao <gaosong@loongson.cn>, Kevin Wolf <kwolf@redhat.com>,
	Ilya Leoshkevich <iii@linux.ibm.com>,
	Artyom Tarasenko <atar4qemu@gmail.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Reinoud Zandijk <reinoud@netbsd.org>, qemu-ppc@nongnu.org,
	Marcelo Tosatti <mtosatti@redhat.com>,
	David Woodhouse <dwmw2@infradead.org>,
	Aurelien Jarno <aurelien@aurel32.net>,
	Bin Meng <bin.meng@windriver.com>, qemu-arm@nongnu.org,
	Anthony Perard <anthony.perard@citrix.com>,
	Leonardo Bras <leobras@redhat.com>,
	Hailiang Zhang <zhanghailiang@xfusion.com>,
	Harsh Prateek Bora <harshpb@linux.ibm.com>, kvm@vger.kernel.org,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Eric Farman <farman@linux.ibm.com>,
	BALATON Zoltan <balaton@eik.bme.hu>,
	Liu Zhiwei <zhiwei_liu@linux.alibaba.com>
Subject: Re: [PATCH v3 0/5] Make Big QEMU Lock naming consistent
Message-ID: <20240108163619.GA216787@fedora>
References: <20240102153529.486531-1-stefanha@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="yV/dJghpE5D5EHAJ"
Content-Disposition: inline
In-Reply-To: <20240102153529.486531-1-stefanha@redhat.com>
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.6


--yV/dJghpE5D5EHAJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 02, 2024 at 10:35:24AM -0500, Stefan Hajnoczi wrote:
> v3:
> - Rebase
> - Define bql_lock() macro on a single line [Akihiko Odaki]
> v2:
> - Rename APIs bql_*() [PeterX]
> - Spell out "Big QEMU Lock (BQL)" in doc comments [PeterX]
> - Rename "iolock" variables in hw/remote/mpqemu-link.c [Harsh]
> - Fix bql_auto_lock() indentation in Patch 2 [Ilya]
> - "with BQL taken" -> "with the BQL taken" [Philippe]
> - "under BQL" -> "under the BQL" [Philippe]
>=20
> The Big QEMU Lock ("BQL") has two other names: "iothread lock" and "QEMU =
global
> mutex". The term "iothread lock" is easily confused with the unrelated --=
object
> iothread (iothread.c).
>=20
> This series updates the code and documentation to consistently use "BQL".=
 This
> makes the code easier to understand.
>=20
> Stefan Hajnoczi (5):
>   system/cpus: rename qemu_mutex_lock_iothread() to bql_lock()
>   qemu/main-loop: rename QEMU_IOTHREAD_LOCK_GUARD to BQL_LOCK_GUARD
>   qemu/main-loop: rename qemu_cond_wait_iothread() to
>     qemu_cond_wait_bql()
>   Replace "iothread lock" with "BQL" in comments
>   Rename "QEMU global mutex" to "BQL" in comments and docs
>=20
>  docs/devel/multi-thread-tcg.rst      |   7 +-
>  docs/devel/qapi-code-gen.rst         |   2 +-
>  docs/devel/replay.rst                |   2 +-
>  docs/devel/reset.rst                 |   2 +-
>  docs/devel/multiple-iothreads.txt    |  14 ++--
>  hw/display/qxl.h                     |   2 +-
>  include/block/aio-wait.h             |   2 +-
>  include/block/blockjob.h             |   6 +-
>  include/exec/cpu-common.h            |   2 +-
>  include/exec/memory.h                |   4 +-
>  include/exec/ramblock.h              |   2 +-
>  include/io/task.h                    |   2 +-
>  include/migration/register.h         |   8 +-
>  include/qemu/coroutine-core.h        |   2 +-
>  include/qemu/coroutine.h             |   2 +-
>  include/qemu/main-loop.h             |  68 ++++++++-------
>  include/qemu/thread.h                |   2 +-
>  target/arm/internals.h               |   4 +-
>  accel/accel-blocker.c                |  10 +--
>  accel/dummy-cpus.c                   |   8 +-
>  accel/hvf/hvf-accel-ops.c            |   4 +-
>  accel/kvm/kvm-accel-ops.c            |   4 +-
>  accel/kvm/kvm-all.c                  |  22 ++---
>  accel/tcg/cpu-exec.c                 |  26 +++---
>  accel/tcg/cputlb.c                   |  20 ++---
>  accel/tcg/tcg-accel-ops-icount.c     |   6 +-
>  accel/tcg/tcg-accel-ops-mttcg.c      |  12 +--
>  accel/tcg/tcg-accel-ops-rr.c         |  18 ++--
>  accel/tcg/tcg-accel-ops.c            |   2 +-
>  accel/tcg/translate-all.c            |   2 +-
>  cpu-common.c                         |   4 +-
>  dump/dump.c                          |   4 +-
>  hw/block/dataplane/virtio-blk.c      |   8 +-
>  hw/block/virtio-blk.c                |   2 +-
>  hw/core/cpu-common.c                 |   6 +-
>  hw/display/virtio-gpu.c              |   2 +-
>  hw/i386/intel_iommu.c                |   6 +-
>  hw/i386/kvm/xen_evtchn.c             |  30 +++----
>  hw/i386/kvm/xen_gnttab.c             |   2 +-
>  hw/i386/kvm/xen_overlay.c            |   2 +-
>  hw/i386/kvm/xen_xenstore.c           |   2 +-
>  hw/intc/arm_gicv3_cpuif.c            |   2 +-
>  hw/intc/s390_flic.c                  |  18 ++--
>  hw/mips/mips_int.c                   |   2 +-
>  hw/misc/edu.c                        |   4 +-
>  hw/misc/imx6_src.c                   |   2 +-
>  hw/misc/imx7_src.c                   |   2 +-
>  hw/net/xen_nic.c                     |   8 +-
>  hw/ppc/pegasos2.c                    |   2 +-
>  hw/ppc/ppc.c                         |   6 +-
>  hw/ppc/spapr.c                       |   2 +-
>  hw/ppc/spapr_events.c                |   2 +-
>  hw/ppc/spapr_rng.c                   |   4 +-
>  hw/ppc/spapr_softmmu.c               |   4 +-
>  hw/remote/mpqemu-link.c              |  22 ++---
>  hw/remote/vfio-user-obj.c            |   2 +-
>  hw/s390x/s390-skeys.c                |   2 +-
>  hw/scsi/virtio-scsi-dataplane.c      |   6 +-
>  migration/block-dirty-bitmap.c       |  14 ++--
>  migration/block.c                    |  38 ++++-----
>  migration/colo.c                     |  62 +++++++-------
>  migration/dirtyrate.c                |  12 +--
>  migration/migration.c                |  54 ++++++------
>  migration/ram.c                      |  16 ++--
>  net/tap.c                            |   2 +-
>  replay/replay-internal.c             |   2 +-
>  semihosting/console.c                |   8 +-
>  stubs/iothread-lock.c                |   6 +-
>  system/cpu-throttle.c                |   6 +-
>  system/cpus.c                        |  55 +++++++------
>  system/dirtylimit.c                  |   4 +-
>  system/memory.c                      |   2 +-
>  system/physmem.c                     |  14 ++--
>  system/runstate.c                    |   2 +-
>  system/watchpoint.c                  |   4 +-
>  target/arm/arm-powerctl.c            |  14 ++--
>  target/arm/helper.c                  |   6 +-
>  target/arm/hvf/hvf.c                 |   8 +-
>  target/arm/kvm.c                     |   8 +-
>  target/arm/ptw.c                     |   6 +-
>  target/arm/tcg/helper-a64.c          |   8 +-
>  target/arm/tcg/m_helper.c            |   6 +-
>  target/arm/tcg/op_helper.c           |  24 +++---
>  target/arm/tcg/psci.c                |   2 +-
>  target/hppa/int_helper.c             |   8 +-
>  target/i386/hvf/hvf.c                |   6 +-
>  target/i386/kvm/hyperv.c             |   4 +-
>  target/i386/kvm/kvm.c                |  28 +++----
>  target/i386/kvm/xen-emu.c            |  16 ++--
>  target/i386/nvmm/nvmm-accel-ops.c    |   6 +-
>  target/i386/nvmm/nvmm-all.c          |  20 ++---
>  target/i386/tcg/sysemu/fpu_helper.c  |   6 +-
>  target/i386/tcg/sysemu/misc_helper.c |   4 +-
>  target/i386/whpx/whpx-accel-ops.c    |   6 +-
>  target/i386/whpx/whpx-all.c          |  24 +++---
>  target/loongarch/csr_helper.c        |   4 +-
>  target/mips/kvm.c                    |   4 +-
>  target/mips/tcg/sysemu/cp0_helper.c  |   4 +-
>  target/openrisc/sys_helper.c         |  16 ++--
>  target/ppc/excp_helper.c             |  14 ++--
>  target/ppc/helper_regs.c             |   2 +-
>  target/ppc/kvm.c                     |   4 +-
>  target/ppc/misc_helper.c             |   8 +-
>  target/ppc/timebase_helper.c         |   8 +-
>  target/riscv/cpu_helper.c            |   4 +-
>  target/s390x/kvm/kvm.c               |   4 +-
>  target/s390x/tcg/misc_helper.c       | 118 +++++++++++++--------------
>  target/sparc/int32_helper.c          |   2 +-
>  target/sparc/int64_helper.c          |   6 +-
>  target/sparc/win_helper.c            |  20 ++---
>  target/xtensa/exc_helper.c           |   8 +-
>  ui/spice-core.c                      |   6 +-
>  util/async.c                         |   2 +-
>  util/main-loop.c                     |   8 +-
>  util/qsp.c                           |   6 +-
>  util/rcu.c                           |  16 ++--
>  audio/coreaudio.m                    |   8 +-
>  memory_ldst.c.inc                    |  18 ++--
>  target/i386/hvf/README.md            |   2 +-
>  ui/cocoa.m                           |  56 ++++++-------
>  120 files changed, 641 insertions(+), 643 deletions(-)
>=20
> --=20
> 2.43.0
>=20

Thanks, applied to my block tree:
https://gitlab.com/stefanha/qemu/commits/block

Stefan

--yV/dJghpE5D5EHAJ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmWcJIMACgkQnKSrs4Gr
c8jzAgf+K9JojAxFS7AKekzLt/hRgAZvp+AQ+YBWFtGLGbQ2QA/PsWuANOgN0oxy
JV18ZtX4ksyA7VsYErxGbs+yWT4jCdJt3+fJL1GIcObmoUJzHkJe7++4w+3h+9jY
ZaGgV8E+LkLgopXXDycYoO8TFXot2TGi6TENVr0Cyh7chB/BS6br0ZKwaabUy6TZ
G/kSFi7Et9BE8mVHzY1/2po7jQJOMnKVY2U/GCvaHVZmvJg2civGxjhufZI6xe4D
nuAneBhS+/U0OajxzLR8NwLWtF1Drw9Nx149i67EBBpwpqklg0X5k3KKbEM6jHN/
sK7AKClhVyC96TpYK3WqNBQJYWapAw==
=sQ9o
-----END PGP SIGNATURE-----

--yV/dJghpE5D5EHAJ--


