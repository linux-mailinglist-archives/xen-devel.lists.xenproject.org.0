Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 25AA781097D
	for <lists+xen-devel@lfdr.de>; Wed, 13 Dec 2023 06:33:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.653693.1020168 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rDHqp-0006Bd-Lm; Wed, 13 Dec 2023 05:32:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 653693.1020168; Wed, 13 Dec 2023 05:32:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rDHqp-00068l-H6; Wed, 13 Dec 2023 05:32:07 +0000
Received: by outflank-mailman (input) for mailman id 653693;
 Wed, 13 Dec 2023 01:35:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=odKt=HY=smartx.com=yong.huang@srs-se1.protection.inumbo.net>)
 id 1rDE9j-00055W-CH
 for xen-devel@lists.xenproject.org; Wed, 13 Dec 2023 01:35:24 +0000
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com
 [2607:f8b0:4864:20::1029])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id dd14ea6a-9957-11ee-9b0f-b553b5be7939;
 Wed, 13 Dec 2023 02:35:15 +0100 (CET)
Received: by mail-pj1-x1029.google.com with SMTP id
 98e67ed59e1d1-28647f4ebd9so4840677a91.3
 for <xen-devel@lists.xenproject.org>; Tue, 12 Dec 2023 17:35:15 -0800 (PST)
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
X-Inumbo-ID: dd14ea6a-9957-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smartx-com.20230601.gappssmtp.com; s=20230601; t=1702431314; x=1703036114; darn=lists.xenproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=pgfAz/69Ix72xABlAtLdjRPfJn1xOy20H6FDLfExTJk=;
        b=B8TpUciVeRIZKpyXsd23bAUlMLKVsvlWuhlBK9uDaYc3m40pxXiKqWQQTYiEEmj0Uq
         YIUN+WSpAQbUWK97YdWPQImfiq+vgd7Yy/ctbqF7yBDbFYzjGwyU6ExN/i99qj1OgRAq
         HVpFR5IJFqWdD+rleXs9ZHXb+Txi+a4Vbx6R/eXeawezLcdjVTnr2ml6p6k/aHndTYhJ
         u0VuSBW7E4bFVmMYh1mz5bcrdP5FzVIajP0cvgPefsi+CeiYSB2qqIx/moX1Z2xslvEE
         C3Vsh76bXQ29alWKQ+yxvsils/Nr/EEVv5MIz5qCIJ2FueBmqaDGWY2dBL+13VSYLhFR
         eG8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702431314; x=1703036114;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pgfAz/69Ix72xABlAtLdjRPfJn1xOy20H6FDLfExTJk=;
        b=EGOUIJJC2sIMN4aBqfmKyj/e12Eu3TFmYXUEMd3PNhPyJVQrPm3ni5QD5YwvdWrM9k
         0xQShL2tbb/6zRpflfZbG4g6BPnBPuxUlbsrpEHSnMyYx/qE90pgFkgLWZs4bmNBQ2o4
         JyT7jlSxAxcQ7hd3crHLY3AOMtjXCglX74w8SQ2/aCIHXse/eDD7ZVnvUvOGms0nQSjm
         UlBrsVuF5NkeBS6h9QELfqD+DS4uDBZG1zKvQP40hCW7wx/5KBgkvuBQpRmG692I8kJ3
         6RT7ls7KAXU6CD/mcSw3uDTiURccny7penB9+a+5p1Szk0TuKrV3vgz8Aupf7HPOHGmw
         DvvA==
X-Gm-Message-State: AOJu0YzcyuFR167rGzISQc+KcW1x1Z0UGg8GslX3chcgY//1Yr00sRCV
	ZOtPJPMyK818hMeJ8Ki00F5EYDitnD/f+l9x4XenvA==
X-Google-Smtp-Source: AGHT+IEe+IIHuHCCXOnXwodpP61cdfdJz8siRfvbC8xkRSYmS4yOQ4o6JYbv9p2hBk/08JPKzNNnMkbcAEayNWZF6S0=
X-Received: by 2002:a17:90b:350:b0:286:6cc1:5fd4 with SMTP id
 fh16-20020a17090b035000b002866cc15fd4mr3534747pjb.87.1702431312252; Tue, 12
 Dec 2023 17:35:12 -0800 (PST)
MIME-Version: 1.0
References: <20231212153905.631119-1-stefanha@redhat.com> <20231212153905.631119-2-stefanha@redhat.com>
In-Reply-To: <20231212153905.631119-2-stefanha@redhat.com>
From: Yong Huang <yong.huang@smartx.com>
Date: Wed, 13 Dec 2023 09:34:55 +0800
Message-ID: <CAK9dgmZjEK=1mGs4GyaqszVEUMrW5NwRh3hHmyctcm0jPtV+sw@mail.gmail.com>
Subject: Re: [PATCH v2 1/5] system/cpus: rename qemu_mutex_lock_iothread() to bql_lock()
To: Stefan Hajnoczi <stefanha@redhat.com>
Cc: qemu-devel@nongnu.org, =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, Akihiko Odaki <akihiko.odaki@daynix.com>, 
	Artyom Tarasenko <atar4qemu@gmail.com>, Paul Durrant <paul@xen.org>, 
	Daniel Henrique Barboza <danielhb413@gmail.com>, =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
	Paolo Bonzini <pbonzini@redhat.com>, BALATON Zoltan <balaton@eik.bme.hu>, 
	Jagannathan Raman <jag.raman@oracle.com>, Anthony Perard <anthony.perard@citrix.com>, 
	Nicholas Piggin <npiggin@gmail.com>, David Gibson <david@gibson.dropbear.id.au>, 
	Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>, Alexander Graf <agraf@csgraf.de>, 
	Hailiang Zhang <zhanghailiang@xfusion.com>, Marcelo Tosatti <mtosatti@redhat.com>, 
	Jiaxun Yang <jiaxun.yang@flygoat.com>, Huacai Chen <chenhuacai@kernel.org>, 
	Harsh Prateek Bora <harshpb@linux.ibm.com>, Ilya Leoshkevich <iii@linux.ibm.com>, Peter Xu <peterx@redhat.com>, 
	Fam Zheng <fam@euphon.net>, Song Gao <gaosong@loongson.cn>, 
	Alistair Francis <alistair.francis@wdc.com>, 
	=?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
	Stefano Stabellini <sstabellini@kernel.org>, David Woodhouse <dwmw2@infradead.org>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Aurelien Jarno <aurelien@aurel32.net>, Leonardo Bras <leobras@redhat.com>, Jiri Slaby <jslaby@suse.cz>, 
	Eric Farman <farman@linux.ibm.com>, Thomas Huth <thuth@redhat.com>, 
	Richard Henderson <richard.henderson@linaro.org>, David Hildenbrand <david@redhat.com>, 
	Michael Roth <michael.roth@amd.com>, Elena Ufimtseva <elena.ufimtseva@oracle.com>, 
	Gerd Hoffmann <kraxel@redhat.com>, Cameron Esfahani <dirty@apple.com>, qemu-ppc@nongnu.org, 
	John Snow <jsnow@redhat.com>, Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, 
	Weiwei Li <liwei1518@gmail.com>, Hanna Reitz <hreitz@redhat.com>, qemu-s390x@nongnu.org, 
	qemu-block@nongnu.org, =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	kvm@vger.kernel.org, "Michael S. Tsirkin" <mst@redhat.com>, 
	Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>, 
	Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>, Andrey Smirnov <andrew.smirnov@gmail.com>, 
	Reinoud Zandijk <reinoud@netbsd.org>, Kevin Wolf <kwolf@redhat.com>, Bin Meng <bin.meng@windriver.com>, 
	Sunil Muthuswamy <sunilmut@microsoft.com>, Peter Maydell <peter.maydell@linaro.org>, qemu-riscv@nongnu.org, 
	Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, Stafford Horne <shorne@gmail.com>, 
	Fabiano Rosas <farosas@suse.de>, Juan Quintela <quintela@redhat.com>, 
	Markus Armbruster <armbru@redhat.com>, qemu-arm@nongnu.org, Jason Wang <jasowang@redhat.com>, 
	Eduardo Habkost <eduardo@habkost.net>, Max Filippov <jcmvbkbc@gmail.com>, 
	Jean-Christophe Dubois <jcd@tribudubois.net>, Eric Blake <eblake@redhat.com>, 
	Roman Bolshakov <rbolshakov@ddn.com>, Halil Pasic <pasic@linux.ibm.com>, xen-devel@lists.xenproject.org, 
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
	David Woodhouse <dwmw@amazon.co.uk>
Content-Type: multipart/alternative; boundary="0000000000009f22ff060c5a2da5"

--0000000000009f22ff060c5a2da5
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 12, 2023 at 11:39=E2=80=AFPM Stefan Hajnoczi <stefanha@redhat.c=
om>
wrote:

> The Big QEMU Lock (BQL) has many names and they are confusing. The
> actual QemuMutex variable is called qemu_global_mutex but it's commonly
> referred to as the BQL in discussions and some code comments. The
> locking APIs, however, are called qemu_mutex_lock_iothread() and
> qemu_mutex_unlock_iothread().
>
> The "iothread" name is historic and comes from when the main thread was
> split into into KVM vcpu threads and the "iothread" (now called the main
> loop thread). I have contributed to the confusion myself by introducing
> a separate --object iothread, a separate concept unrelated to the BQL.
>
> The "iothread" name is no longer appropriate for the BQL. Rename the
> locking APIs to:
> - void bql_lock(void)
> - void bql_unlock(void)
> - bool bql_locked(void)
>
> There are more APIs with "iothread" in their names. Subsequent patches
> will rename them. There are also comments and documentation that will be
> updated in later patches.
>
> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> Reviewed-by: Paul Durrant <paul@xen.org>
> Acked-by: Fabiano Rosas <farosas@suse.de>
> Acked-by: David Woodhouse <dwmw@amazon.co.uk>
> Reviewed-by: C=C3=A9dric Le Goater <clg@kaod.org>
> Acked-by: Peter Xu <peterx@redhat.com>
> Acked-by: Eric Farman <farman@linux.ibm.com>
> Reviewed-by: Harsh Prateek Bora <harshpb@linux.ibm.com>
> ---
>  include/block/aio-wait.h             |   2 +-
>  include/qemu/main-loop.h             |  40 ++++-----
>  include/qemu/thread.h                |   2 +-
>  accel/accel-blocker.c                |  10 +--
>  accel/dummy-cpus.c                   |   8 +-
>  accel/hvf/hvf-accel-ops.c            |   4 +-
>  accel/kvm/kvm-accel-ops.c            |   4 +-
>  accel/kvm/kvm-all.c                  |  22 ++---
>  accel/tcg/cpu-exec.c                 |  26 +++---
>  accel/tcg/cputlb.c                   |  16 ++--
>  accel/tcg/tcg-accel-ops-icount.c     |   4 +-
>  accel/tcg/tcg-accel-ops-mttcg.c      |  12 +--
>  accel/tcg/tcg-accel-ops-rr.c         |  14 ++--
>  accel/tcg/tcg-accel-ops.c            |   2 +-
>  accel/tcg/translate-all.c            |   2 +-
>  cpu-common.c                         |   4 +-
>  dump/dump.c                          |   4 +-
>  hw/core/cpu-common.c                 |   6 +-
>  hw/i386/intel_iommu.c                |   6 +-
>  hw/i386/kvm/xen_evtchn.c             |  16 ++--
>  hw/i386/kvm/xen_overlay.c            |   2 +-
>  hw/i386/kvm/xen_xenstore.c           |   2 +-
>  hw/intc/arm_gicv3_cpuif.c            |   2 +-
>  hw/intc/s390_flic.c                  |  18 ++--
>  hw/misc/edu.c                        |   4 +-
>  hw/misc/imx6_src.c                   |   2 +-
>  hw/misc/imx7_src.c                   |   2 +-
>  hw/net/xen_nic.c                     |   8 +-
>  hw/ppc/pegasos2.c                    |   2 +-
>  hw/ppc/ppc.c                         |   4 +-
>  hw/ppc/spapr.c                       |   2 +-
>  hw/ppc/spapr_rng.c                   |   4 +-
>  hw/ppc/spapr_softmmu.c               |   4 +-
>  hw/remote/mpqemu-link.c              |  20 ++---
>  hw/remote/vfio-user-obj.c            |   2 +-
>  hw/s390x/s390-skeys.c                |   2 +-
>  migration/block-dirty-bitmap.c       |   4 +-
>  migration/block.c                    |  16 ++--
>  migration/colo.c                     |  60 +++++++-------
>  migration/dirtyrate.c                |  12 +--
>  migration/migration.c                |  52 ++++++------
>  migration/ram.c                      |  12 +--
>  replay/replay-internal.c             |   2 +-
>  semihosting/console.c                |   8 +-
>  stubs/iothread-lock.c                |   6 +-
>  system/cpu-throttle.c                |   4 +-
>  system/cpus.c                        |  51 ++++++------
>  system/dirtylimit.c                  |   4 +-
>  system/memory.c                      |   2 +-
>  system/physmem.c                     |   8 +-
>  system/runstate.c                    |   2 +-
>  system/watchpoint.c                  |   4 +-
>  target/arm/arm-powerctl.c            |  14 ++--
>  target/arm/helper.c                  |   4 +-
>  target/arm/hvf/hvf.c                 |   8 +-
>  target/arm/kvm.c                     |   4 +-
>  target/arm/kvm64.c                   |   4 +-
>  target/arm/ptw.c                     |   6 +-
>  target/arm/tcg/helper-a64.c          |   8 +-
>  target/arm/tcg/m_helper.c            |   6 +-
>  target/arm/tcg/op_helper.c           |  24 +++---
>  target/arm/tcg/psci.c                |   2 +-
>  target/hppa/int_helper.c             |   8 +-
>  target/i386/hvf/hvf.c                |   6 +-
>  target/i386/kvm/hyperv.c             |   4 +-
>  target/i386/kvm/kvm.c                |  28 +++----
>  target/i386/kvm/xen-emu.c            |  14 ++--
>  target/i386/nvmm/nvmm-accel-ops.c    |   4 +-
>  target/i386/nvmm/nvmm-all.c          |  20 ++---
>  target/i386/tcg/sysemu/fpu_helper.c  |   6 +-
>  target/i386/tcg/sysemu/misc_helper.c |   4 +-
>  target/i386/whpx/whpx-accel-ops.c    |   4 +-
>  target/i386/whpx/whpx-all.c          |  24 +++---
>  target/loongarch/csr_helper.c        |   4 +-
>  target/mips/kvm.c                    |   4 +-
>  target/mips/tcg/sysemu/cp0_helper.c  |   4 +-
>  target/openrisc/sys_helper.c         |  16 ++--
>  target/ppc/excp_helper.c             |  12 +--
>  target/ppc/kvm.c                     |   4 +-
>  target/ppc/misc_helper.c             |   8 +-
>  target/ppc/timebase_helper.c         |   8 +-
>  target/s390x/kvm/kvm.c               |   4 +-
>  target/s390x/tcg/misc_helper.c       | 118 +++++++++++++--------------
>  target/sparc/int32_helper.c          |   2 +-
>  target/sparc/int64_helper.c          |   6 +-
>  target/sparc/win_helper.c            |  20 ++---
>  target/xtensa/exc_helper.c           |   8 +-
>  ui/spice-core.c                      |   4 +-
>  util/async.c                         |   2 +-
>  util/main-loop.c                     |   8 +-
>  util/qsp.c                           |   6 +-
>  util/rcu.c                           |  14 ++--
>  audio/coreaudio.m                    |   4 +-
>  memory_ldst.c.inc                    |  18 ++--
>  target/i386/hvf/README.md            |   2 +-
>  ui/cocoa.m                           |  50 ++++++------
>  96 files changed, 530 insertions(+), 529 deletions(-)
>
> diff --git a/include/block/aio-wait.h b/include/block/aio-wait.h
> index 5449b6d742..d22ca24329 100644
> --- a/include/block/aio-wait.h
> +++ b/include/block/aio-wait.h
> @@ -151,7 +151,7 @@ static inline bool
> in_aio_context_home_thread(AioContext *ctx)
>      }
>
>      if (ctx =3D=3D qemu_get_aio_context()) {
> -        return qemu_mutex_iothread_locked();
> +        return bql_locked();
>      } else {
>          return false;
>      }
> diff --git a/include/qemu/main-loop.h b/include/qemu/main-loop.h
> index 68e70e61aa..596a206acd 100644
> --- a/include/qemu/main-loop.h
> +++ b/include/qemu/main-loop.h
> @@ -248,19 +248,19 @@ GSource *iohandler_get_g_source(void);
>  AioContext *iohandler_get_aio_context(void);
>
>  /**
> - * qemu_mutex_iothread_locked: Return lock status of the main loop mutex=
.
> + * bql_locked: Return lock status of the Big QEMU Lock (BQL)
>   *
> - * The main loop mutex is the coarsest lock in QEMU, and as such it
> + * The Big QEMU Lock (BQL) is the coarsest lock in QEMU, and as such it
>   * must always be taken outside other locks.  This function helps
>   * functions take different paths depending on whether the current
> - * thread is running within the main loop mutex.
> + * thread is running within the BQL.
>   *
>   * This function should never be used in the block layer, because
>   * unit tests, block layer tools and qemu-storage-daemon do not
>   * have a BQL.
>   * Please instead refer to qemu_in_main_thread().
>   */
> -bool qemu_mutex_iothread_locked(void);
> +bool bql_locked(void);
>
>  /**
>   * qemu_in_main_thread: return whether it's possible to safely access
> @@ -312,58 +312,58 @@ bool qemu_in_main_thread(void);
>      } while (0)
>
>  /**
> - * qemu_mutex_lock_iothread: Lock the main loop mutex.
> + * bql_lock: Lock the Big QEMU Lock (BQL).
>   *
> - * This function locks the main loop mutex.  The mutex is taken by
> + * This function locks the Big QEMU Lock (BQL).  The lock is taken by
>   * main() in vl.c and always taken except while waiting on
> - * external events (such as with select).  The mutex should be taken
> + * external events (such as with select).  The lock should be taken
>   * by threads other than the main loop thread when calling
>   * qemu_bh_new(), qemu_set_fd_handler() and basically all other
>   * functions documented in this file.
>   *
> - * NOTE: tools currently are single-threaded and qemu_mutex_lock_iothrea=
d
> + * NOTE: tools currently are single-threaded and bql_lock
>   * is a no-op there.
>   */
> -#define qemu_mutex_lock_iothread()                      \
> -    qemu_mutex_lock_iothread_impl(__FILE__, __LINE__)
> -void qemu_mutex_lock_iothread_impl(const char *file, int line);
> +#define bql_lock()                      \
> +    bql_lock_impl(__FILE__, __LINE__)
> +void bql_lock_impl(const char *file, int line);
>
>  /**
> - * qemu_mutex_unlock_iothread: Unlock the main loop mutex.
> + * bql_unlock: Unlock the Big QEMU Lock (BQL).
>   *
> - * This function unlocks the main loop mutex.  The mutex is taken by
> + * This function unlocks the Big QEMU Lock.  The lock is taken by
>   * main() in vl.c and always taken except while waiting on
> - * external events (such as with select).  The mutex should be unlocked
> + * external events (such as with select).  The lock should be unlocked
>   * as soon as possible by threads other than the main loop thread,
>   * because it prevents the main loop from processing callbacks,
>   * including timers and bottom halves.
>   *
> - * NOTE: tools currently are single-threaded and
> qemu_mutex_unlock_iothread
> + * NOTE: tools currently are single-threaded and bql_unlock
>   * is a no-op there.
>   */
> -void qemu_mutex_unlock_iothread(void);
> +void bql_unlock(void);
>
>  /**
>   * QEMU_IOTHREAD_LOCK_GUARD
>   *
> - * Wrap a block of code in a conditional
> qemu_mutex_{lock,unlock}_iothread.
> + * Wrap a block of code in a conditional bql_{lock,unlock}.
>   */
>  typedef struct IOThreadLockAuto IOThreadLockAuto;
>
>  static inline IOThreadLockAuto *qemu_iothread_auto_lock(const char *file=
,
>                                                          int line)
>  {
> -    if (qemu_mutex_iothread_locked()) {
> +    if (bql_locked()) {
>          return NULL;
>      }
> -    qemu_mutex_lock_iothread_impl(file, line);
> +    bql_lock_impl(file, line);
>      /* Anything non-NULL causes the cleanup function to be called */
>      return (IOThreadLockAuto *)(uintptr_t)1;
>  }
>
>  static inline void qemu_iothread_auto_unlock(IOThreadLockAuto *l)
>  {
> -    qemu_mutex_unlock_iothread();
> +    bql_unlock();
>  }
>
>  G_DEFINE_AUTOPTR_CLEANUP_FUNC(IOThreadLockAuto, qemu_iothread_auto_unloc=
k)
> diff --git a/include/qemu/thread.h b/include/qemu/thread.h
> index dd3822d7ce..fb74e21c08 100644
> --- a/include/qemu/thread.h
> +++ b/include/qemu/thread.h
> @@ -47,7 +47,7 @@ typedef void (*QemuCondWaitFunc)(QemuCond *c, QemuMutex
> *m, const char *f,
>  typedef bool (*QemuCondTimedWaitFunc)(QemuCond *c, QemuMutex *m, int ms,
>                                        const char *f, int l);
>
> -extern QemuMutexLockFunc qemu_bql_mutex_lock_func;
> +extern QemuMutexLockFunc bql_mutex_lock_func;
>  extern QemuMutexLockFunc qemu_mutex_lock_func;
>  extern QemuMutexTrylockFunc qemu_mutex_trylock_func;
>  extern QemuRecMutexLockFunc qemu_rec_mutex_lock_func;
> diff --git a/accel/accel-blocker.c b/accel/accel-blocker.c
> index 1e7f423462..e083f24aa8 100644
> --- a/accel/accel-blocker.c
> +++ b/accel/accel-blocker.c
> @@ -41,7 +41,7 @@ void accel_blocker_init(void)
>
>  void accel_ioctl_begin(void)
>  {
> -    if (likely(qemu_mutex_iothread_locked())) {
> +    if (likely(bql_locked())) {
>          return;
>      }
>
> @@ -51,7 +51,7 @@ void accel_ioctl_begin(void)
>
>  void accel_ioctl_end(void)
>  {
> -    if (likely(qemu_mutex_iothread_locked())) {
> +    if (likely(bql_locked())) {
>          return;
>      }
>
> @@ -62,7 +62,7 @@ void accel_ioctl_end(void)
>
>  void accel_cpu_ioctl_begin(CPUState *cpu)
>  {
> -    if (unlikely(qemu_mutex_iothread_locked())) {
> +    if (unlikely(bql_locked())) {
>          return;
>      }
>
> @@ -72,7 +72,7 @@ void accel_cpu_ioctl_begin(CPUState *cpu)
>
>  void accel_cpu_ioctl_end(CPUState *cpu)
>  {
> -    if (unlikely(qemu_mutex_iothread_locked())) {
> +    if (unlikely(bql_locked())) {
>          return;
>      }
>
> @@ -105,7 +105,7 @@ void accel_ioctl_inhibit_begin(void)
>       * We allow to inhibit only when holding the BQL, so we can identify
>       * when an inhibitor wants to issue an ioctl easily.
>       */
> -    g_assert(qemu_mutex_iothread_locked());
> +    g_assert(bql_locked());
>
>      /* Block further invocations of the ioctls outside the BQL.  */
>      CPU_FOREACH(cpu) {
> diff --git a/accel/dummy-cpus.c b/accel/dummy-cpus.c
> index b75c919ac3..f4b0ec5890 100644
> --- a/accel/dummy-cpus.c
> +++ b/accel/dummy-cpus.c
> @@ -24,7 +24,7 @@ static void *dummy_cpu_thread_fn(void *arg)
>
>      rcu_register_thread();
>
> -    qemu_mutex_lock_iothread();
> +    bql_lock();
>      qemu_thread_get_self(cpu->thread);
>      cpu->thread_id =3D qemu_get_thread_id();
>      cpu->neg.can_do_io =3D true;
> @@ -43,7 +43,7 @@ static void *dummy_cpu_thread_fn(void *arg)
>      qemu_guest_random_seed_thread_part2(cpu->random_seed);
>
>      do {
> -        qemu_mutex_unlock_iothread();
> +        bql_unlock();
>  #ifndef _WIN32
>          do {
>              int sig;
> @@ -56,11 +56,11 @@ static void *dummy_cpu_thread_fn(void *arg)
>  #else
>          qemu_sem_wait(&cpu->sem);
>  #endif
> -        qemu_mutex_lock_iothread();
> +        bql_lock();
>          qemu_wait_io_event(cpu);
>      } while (!cpu->unplug);
>
> -    qemu_mutex_unlock_iothread();
> +    bql_unlock();
>      rcu_unregister_thread();
>      return NULL;
>  }
> diff --git a/accel/hvf/hvf-accel-ops.c b/accel/hvf/hvf-accel-ops.c
> index abe7adf7ee..8eabb696fa 100644
> --- a/accel/hvf/hvf-accel-ops.c
> +++ b/accel/hvf/hvf-accel-ops.c
> @@ -424,7 +424,7 @@ static void *hvf_cpu_thread_fn(void *arg)
>
>      rcu_register_thread();
>
> -    qemu_mutex_lock_iothread();
> +    bql_lock();
>      qemu_thread_get_self(cpu->thread);
>
>      cpu->thread_id =3D qemu_get_thread_id();
> @@ -449,7 +449,7 @@ static void *hvf_cpu_thread_fn(void *arg)
>
>      hvf_vcpu_destroy(cpu);
>      cpu_thread_signal_destroyed(cpu);
> -    qemu_mutex_unlock_iothread();
> +    bql_unlock();
>      rcu_unregister_thread();
>      return NULL;
>  }
> diff --git a/accel/kvm/kvm-accel-ops.c b/accel/kvm/kvm-accel-ops.c
> index 6195150a0b..45ff06e953 100644
> --- a/accel/kvm/kvm-accel-ops.c
> +++ b/accel/kvm/kvm-accel-ops.c
> @@ -33,7 +33,7 @@ static void *kvm_vcpu_thread_fn(void *arg)
>
>      rcu_register_thread();
>
> -    qemu_mutex_lock_iothread();
> +    bql_lock();
>      qemu_thread_get_self(cpu->thread);
>      cpu->thread_id =3D qemu_get_thread_id();
>      cpu->neg.can_do_io =3D true;
> @@ -58,7 +58,7 @@ static void *kvm_vcpu_thread_fn(void *arg)
>
>      kvm_destroy_vcpu(cpu);
>      cpu_thread_signal_destroyed(cpu);
> -    qemu_mutex_unlock_iothread();
> +    bql_unlock();
>      rcu_unregister_thread();
>      return NULL;
>  }
> diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
> index e39a810a4e..09404b897f 100644
> --- a/accel/kvm/kvm-all.c
> +++ b/accel/kvm/kvm-all.c
> @@ -817,7 +817,7 @@ static void kvm_dirty_ring_flush(void)
>       * should always be with BQL held, serialization is guaranteed.
>       * However, let's be sure of it.
>       */
> -    assert(qemu_mutex_iothread_locked());
> +    assert(bql_locked());
>      /*
>       * First make sure to flush the hardware buffers by kicking all
>       * vcpus out in a synchronous way.
> @@ -1402,9 +1402,9 @@ static void *kvm_dirty_ring_reaper_thread(void *dat=
a)
>          trace_kvm_dirty_ring_reaper("wakeup");
>          r->reaper_state =3D KVM_DIRTY_RING_REAPER_REAPING;
>
> -        qemu_mutex_lock_iothread();
> +        bql_lock();
>          kvm_dirty_ring_reap(s, NULL);
> -        qemu_mutex_unlock_iothread();
> +        bql_unlock();
>
>          r->reaper_iteration++;
>      }
> @@ -2828,7 +2828,7 @@ int kvm_cpu_exec(CPUState *cpu)
>          return EXCP_HLT;
>      }
>
> -    qemu_mutex_unlock_iothread();
> +    bql_unlock();
>      cpu_exec_start(cpu);
>
>      do {
> @@ -2868,11 +2868,11 @@ int kvm_cpu_exec(CPUState *cpu)
>
>  #ifdef KVM_HAVE_MCE_INJECTION
>          if (unlikely(have_sigbus_pending)) {
> -            qemu_mutex_lock_iothread();
> +            bql_lock();
>              kvm_arch_on_sigbus_vcpu(cpu, pending_sigbus_code,
>                                      pending_sigbus_addr);
>              have_sigbus_pending =3D false;
> -            qemu_mutex_unlock_iothread();
> +            bql_unlock();
>          }
>  #endif
>
> @@ -2942,7 +2942,7 @@ int kvm_cpu_exec(CPUState *cpu)
>               * still full.  Got kicked by KVM_RESET_DIRTY_RINGS.
>               */
>              trace_kvm_dirty_ring_full(cpu->cpu_index);
> -            qemu_mutex_lock_iothread();
> +            bql_lock();
>              /*
>               * We throttle vCPU by making it sleep once it exit from
> kernel
>               * due to dirty ring full. In the dirtylimit scenario, reapi=
ng
> @@ -2954,7 +2954,7 @@ int kvm_cpu_exec(CPUState *cpu)
>              } else {
>                  kvm_dirty_ring_reap(kvm_state, NULL);
>              }
> -            qemu_mutex_unlock_iothread();
> +            bql_unlock();
>              dirtylimit_vcpu_execute(cpu);
>              ret =3D 0;
>              break;
> @@ -2970,9 +2970,9 @@ int kvm_cpu_exec(CPUState *cpu)
>                  break;
>              case KVM_SYSTEM_EVENT_CRASH:
>                  kvm_cpu_synchronize_state(cpu);
> -                qemu_mutex_lock_iothread();
> +                bql_lock();
>                  qemu_system_guest_panicked(cpu_get_crash_info(cpu));
> -                qemu_mutex_unlock_iothread();
> +                bql_unlock();
>                  ret =3D 0;
>                  break;
>              default:
> @@ -2989,7 +2989,7 @@ int kvm_cpu_exec(CPUState *cpu)
>      } while (ret =3D=3D 0);
>
>      cpu_exec_end(cpu);
> -    qemu_mutex_lock_iothread();
> +    bql_lock();
>
>      if (ret < 0) {
>          cpu_dump_state(cpu, stderr, CPU_DUMP_CODE);
> diff --git a/accel/tcg/cpu-exec.c b/accel/tcg/cpu-exec.c
> index c938eb96f8..67eda9865e 100644
> --- a/accel/tcg/cpu-exec.c
> +++ b/accel/tcg/cpu-exec.c
> @@ -558,8 +558,8 @@ static void cpu_exec_longjmp_cleanup(CPUState *cpu)
>          tcg_ctx->gen_tb =3D NULL;
>      }
>  #endif
> -    if (qemu_mutex_iothread_locked()) {
> -        qemu_mutex_unlock_iothread();
> +    if (bql_locked()) {
> +        bql_unlock();
>      }
>      assert_no_pages_locked();
>  }
> @@ -680,10 +680,10 @@ static inline bool cpu_handle_halt(CPUState *cpu)
>  #if defined(TARGET_I386)
>          if (cpu->interrupt_request & CPU_INTERRUPT_POLL) {
>              X86CPU *x86_cpu =3D X86_CPU(cpu);
> -            qemu_mutex_lock_iothread();
> +            bql_lock();
>              apic_poll_irq(x86_cpu->apic_state);
>              cpu_reset_interrupt(cpu, CPU_INTERRUPT_POLL);
> -            qemu_mutex_unlock_iothread();
> +            bql_unlock();
>          }
>  #endif /* TARGET_I386 */
>          if (!cpu_has_work(cpu)) {
> @@ -749,9 +749,9 @@ static inline bool cpu_handle_exception(CPUState *cpu=
,
> int *ret)
>  #else
>          if (replay_exception()) {
>              CPUClass *cc =3D CPU_GET_CLASS(cpu);
> -            qemu_mutex_lock_iothread();
> +            bql_lock();
>              cc->tcg_ops->do_interrupt(cpu);
> -            qemu_mutex_unlock_iothread();
> +            bql_unlock();
>              cpu->exception_index =3D -1;
>
>              if (unlikely(cpu->singlestep_enabled)) {
> @@ -812,7 +812,7 @@ static inline bool cpu_handle_interrupt(CPUState *cpu=
,
>
>      if (unlikely(qatomic_read(&cpu->interrupt_request))) {
>          int interrupt_request;
> -        qemu_mutex_lock_iothread();
> +        bql_lock();
>          interrupt_request =3D cpu->interrupt_request;
>          if (unlikely(cpu->singlestep_enabled & SSTEP_NOIRQ)) {
>              /* Mask out external interrupts for this step. */
> @@ -821,7 +821,7 @@ static inline bool cpu_handle_interrupt(CPUState *cpu=
,
>          if (interrupt_request & CPU_INTERRUPT_DEBUG) {
>              cpu->interrupt_request &=3D ~CPU_INTERRUPT_DEBUG;
>              cpu->exception_index =3D EXCP_DEBUG;
> -            qemu_mutex_unlock_iothread();
> +            bql_unlock();
>              return true;
>          }
>  #if !defined(CONFIG_USER_ONLY)
> @@ -832,7 +832,7 @@ static inline bool cpu_handle_interrupt(CPUState *cpu=
,
>              cpu->interrupt_request &=3D ~CPU_INTERRUPT_HALT;
>              cpu->halted =3D 1;
>              cpu->exception_index =3D EXCP_HLT;
> -            qemu_mutex_unlock_iothread();
> +            bql_unlock();
>              return true;
>          }
>  #if defined(TARGET_I386)
> @@ -843,14 +843,14 @@ static inline bool cpu_handle_interrupt(CPUState
> *cpu,
>              cpu_svm_check_intercept_param(env, SVM_EXIT_INIT, 0, 0);
>              do_cpu_init(x86_cpu);
>              cpu->exception_index =3D EXCP_HALTED;
> -            qemu_mutex_unlock_iothread();
> +            bql_unlock();
>              return true;
>          }
>  #else
>          else if (interrupt_request & CPU_INTERRUPT_RESET) {
>              replay_interrupt();
>              cpu_reset(cpu);
> -            qemu_mutex_unlock_iothread();
> +            bql_unlock();
>              return true;
>          }
>  #endif /* !TARGET_I386 */
> @@ -873,7 +873,7 @@ static inline bool cpu_handle_interrupt(CPUState *cpu=
,
>                   */
>                  if (unlikely(cpu->singlestep_enabled)) {
>                      cpu->exception_index =3D EXCP_DEBUG;
> -                    qemu_mutex_unlock_iothread();
> +                    bql_unlock();
>                      return true;
>                  }
>                  cpu->exception_index =3D -1;
> @@ -892,7 +892,7 @@ static inline bool cpu_handle_interrupt(CPUState *cpu=
,
>          }
>
>          /* If we exit via cpu_loop_exit/longjmp it is reset in cpu_exec =
*/
> -        qemu_mutex_unlock_iothread();
> +        bql_unlock();
>      }
>
>      /* Finally, check if we need to exit to the main loop.  */
> diff --git a/accel/tcg/cputlb.c b/accel/tcg/cputlb.c
> index db3f93fda9..5698a9fd8e 100644
> --- a/accel/tcg/cputlb.c
> +++ b/accel/tcg/cputlb.c
> @@ -2030,10 +2030,10 @@ static uint64_t do_ld_mmio_beN(CPUState *cpu,
> CPUTLBEntryFull *full,
>      section =3D io_prepare(&mr_offset, cpu, full->xlat_section, attrs,
> addr, ra);
>      mr =3D section->mr;
>
> -    qemu_mutex_lock_iothread();
> +    bql_lock();
>      ret =3D int_ld_mmio_beN(cpu, full, ret_be, addr, size, mmu_idx,
>                            type, ra, mr, mr_offset);
> -    qemu_mutex_unlock_iothread();
> +    bql_unlock();
>
>      return ret;
>  }
> @@ -2054,12 +2054,12 @@ static Int128 do_ld16_mmio_beN(CPUState *cpu,
> CPUTLBEntryFull *full,
>      section =3D io_prepare(&mr_offset, cpu, full->xlat_section, attrs,
> addr, ra);
>      mr =3D section->mr;
>
> -    qemu_mutex_lock_iothread();
> +    bql_lock();
>      a =3D int_ld_mmio_beN(cpu, full, ret_be, addr, size - 8, mmu_idx,
>                          MMU_DATA_LOAD, ra, mr, mr_offset);
>      b =3D int_ld_mmio_beN(cpu, full, ret_be, addr + size - 8, 8, mmu_idx=
,
>                          MMU_DATA_LOAD, ra, mr, mr_offset + size - 8);
> -    qemu_mutex_unlock_iothread();
> +    bql_unlock();
>
>      return int128_make128(b, a);
>  }
> @@ -2577,10 +2577,10 @@ static uint64_t do_st_mmio_leN(CPUState *cpu,
> CPUTLBEntryFull *full,
>      section =3D io_prepare(&mr_offset, cpu, full->xlat_section, attrs,
> addr, ra);
>      mr =3D section->mr;
>
> -    qemu_mutex_lock_iothread();
> +    bql_lock();
>      ret =3D int_st_mmio_leN(cpu, full, val_le, addr, size, mmu_idx,
>                            ra, mr, mr_offset);
> -    qemu_mutex_unlock_iothread();
> +    bql_unlock();
>
>      return ret;
>  }
> @@ -2601,12 +2601,12 @@ static uint64_t do_st16_mmio_leN(CPUState *cpu,
> CPUTLBEntryFull *full,
>      section =3D io_prepare(&mr_offset, cpu, full->xlat_section, attrs,
> addr, ra);
>      mr =3D section->mr;
>
> -    qemu_mutex_lock_iothread();
> +    bql_lock();
>      int_st_mmio_leN(cpu, full, int128_getlo(val_le), addr, 8,
>                      mmu_idx, ra, mr, mr_offset);
>      ret =3D int_st_mmio_leN(cpu, full, int128_gethi(val_le), addr + 8,
>                            size - 8, mmu_idx, ra, mr, mr_offset + 8);
> -    qemu_mutex_unlock_iothread();
> +    bql_unlock();
>
>      return ret;
>  }
> diff --git a/accel/tcg/tcg-accel-ops-icount.c
> b/accel/tcg/tcg-accel-ops-icount.c
> index b25685fb71..5824d92580 100644
> --- a/accel/tcg/tcg-accel-ops-icount.c
> +++ b/accel/tcg/tcg-accel-ops-icount.c
> @@ -126,9 +126,9 @@ void icount_prepare_for_run(CPUState *cpu, int64_t
> cpu_budget)
>           * We're called without the iothread lock, so must take it while
>           * we're calling timer handlers.
>           */
> -        qemu_mutex_lock_iothread();
> +        bql_lock();
>          icount_notify_aio_contexts();
> -        qemu_mutex_unlock_iothread();
> +        bql_unlock();
>      }
>  }
>
> diff --git a/accel/tcg/tcg-accel-ops-mttcg.c
> b/accel/tcg/tcg-accel-ops-mttcg.c
> index fac80095bb..af7307013a 100644
> --- a/accel/tcg/tcg-accel-ops-mttcg.c
> +++ b/accel/tcg/tcg-accel-ops-mttcg.c
> @@ -76,7 +76,7 @@ static void *mttcg_cpu_thread_fn(void *arg)
>      rcu_add_force_rcu_notifier(&force_rcu.notifier);
>      tcg_register_thread();
>
> -    qemu_mutex_lock_iothread();
> +    bql_lock();
>      qemu_thread_get_self(cpu->thread);
>
>      cpu->thread_id =3D qemu_get_thread_id();
> @@ -91,9 +91,9 @@ static void *mttcg_cpu_thread_fn(void *arg)
>      do {
>          if (cpu_can_run(cpu)) {
>              int r;
> -            qemu_mutex_unlock_iothread();
> +            bql_unlock();
>              r =3D tcg_cpus_exec(cpu);
> -            qemu_mutex_lock_iothread();
> +            bql_lock();
>              switch (r) {
>              case EXCP_DEBUG:
>                  cpu_handle_guest_debug(cpu);
> @@ -105,9 +105,9 @@ static void *mttcg_cpu_thread_fn(void *arg)
>                   */
>                  break;
>              case EXCP_ATOMIC:
> -                qemu_mutex_unlock_iothread();
> +                bql_unlock();
>                  cpu_exec_step_atomic(cpu);
> -                qemu_mutex_lock_iothread();
> +                bql_lock();
>              default:
>                  /* Ignore everything else? */
>                  break;
> @@ -119,7 +119,7 @@ static void *mttcg_cpu_thread_fn(void *arg)
>      } while (!cpu->unplug || cpu_can_run(cpu));
>
>      tcg_cpus_destroy(cpu);
> -    qemu_mutex_unlock_iothread();
> +    bql_unlock();
>      rcu_remove_force_rcu_notifier(&force_rcu.notifier);
>      rcu_unregister_thread();
>      return NULL;
> diff --git a/accel/tcg/tcg-accel-ops-rr.c b/accel/tcg/tcg-accel-ops-rr.c
> index 611932f3c3..c4ea372a3f 100644
> --- a/accel/tcg/tcg-accel-ops-rr.c
> +++ b/accel/tcg/tcg-accel-ops-rr.c
> @@ -188,7 +188,7 @@ static void *rr_cpu_thread_fn(void *arg)
>      rcu_add_force_rcu_notifier(&force_rcu);
>      tcg_register_thread();
>
> -    qemu_mutex_lock_iothread();
> +    bql_lock();
>      qemu_thread_get_self(cpu->thread);
>
>      cpu->thread_id =3D qemu_get_thread_id();
> @@ -218,9 +218,9 @@ static void *rr_cpu_thread_fn(void *arg)
>          /* Only used for icount_enabled() */
>          int64_t cpu_budget =3D 0;
>
> -        qemu_mutex_unlock_iothread();
> +        bql_unlock();
>          replay_mutex_lock();
> -        qemu_mutex_lock_iothread();
> +        bql_lock();
>
>          if (icount_enabled()) {
>              int cpu_count =3D rr_cpu_count();
> @@ -254,7 +254,7 @@ static void *rr_cpu_thread_fn(void *arg)
>              if (cpu_can_run(cpu)) {
>                  int r;
>
> -                qemu_mutex_unlock_iothread();
> +                bql_unlock();
>                  if (icount_enabled()) {
>                      icount_prepare_for_run(cpu, cpu_budget);
>                  }
> @@ -262,15 +262,15 @@ static void *rr_cpu_thread_fn(void *arg)
>                  if (icount_enabled()) {
>                      icount_process_data(cpu);
>                  }
> -                qemu_mutex_lock_iothread();
> +                bql_lock();
>
>                  if (r =3D=3D EXCP_DEBUG) {
>                      cpu_handle_guest_debug(cpu);
>                      break;
>                  } else if (r =3D=3D EXCP_ATOMIC) {
> -                    qemu_mutex_unlock_iothread();
> +                    bql_unlock();
>                      cpu_exec_step_atomic(cpu);
> -                    qemu_mutex_lock_iothread();
> +                    bql_lock();
>                      break;
>                  }
>              } else if (cpu->stop) {
> diff --git a/accel/tcg/tcg-accel-ops.c b/accel/tcg/tcg-accel-ops.c
> index 1b57290682..813065c0ec 100644
> --- a/accel/tcg/tcg-accel-ops.c
> +++ b/accel/tcg/tcg-accel-ops.c
> @@ -88,7 +88,7 @@ static void tcg_cpu_reset_hold(CPUState *cpu)
>  /* mask must never be zero, except for A20 change call */
>  void tcg_handle_interrupt(CPUState *cpu, int mask)
>  {
> -    g_assert(qemu_mutex_iothread_locked());
> +    g_assert(bql_locked());
>
>      cpu->interrupt_request |=3D mask;
>
> diff --git a/accel/tcg/translate-all.c b/accel/tcg/translate-all.c
> index 79a88f5fb7..1737bb3da5 100644
> --- a/accel/tcg/translate-all.c
> +++ b/accel/tcg/translate-all.c
> @@ -649,7 +649,7 @@ void cpu_io_recompile(CPUState *cpu, uintptr_t retadd=
r)
>
>  void cpu_interrupt(CPUState *cpu, int mask)
>  {
> -    g_assert(qemu_mutex_iothread_locked());
> +    g_assert(bql_locked());
>      cpu->interrupt_request |=3D mask;
>      qatomic_set(&cpu->neg.icount_decr.u16.high, -1);
>  }
> diff --git a/cpu-common.c b/cpu-common.c
> index c81fd72d16..ce78273af5 100644
> --- a/cpu-common.c
> +++ b/cpu-common.c
> @@ -351,11 +351,11 @@ void process_queued_cpu_work(CPUState *cpu)
>               * BQL, so it goes to sleep; start_exclusive() is sleeping
> too, so
>               * neither CPU can proceed.
>               */
> -            qemu_mutex_unlock_iothread();
> +            bql_unlock();
>              start_exclusive();
>              wi->func(cpu, wi->data);
>              end_exclusive();
> -            qemu_mutex_lock_iothread();
> +            bql_lock();
>          } else {
>              wi->func(cpu, wi->data);
>          }
> diff --git a/dump/dump.c b/dump/dump.c
> index 4819050764..84064d890d 100644
> --- a/dump/dump.c
> +++ b/dump/dump.c
> @@ -108,11 +108,11 @@ static int dump_cleanup(DumpState *s)
>      s->guest_note =3D NULL;
>      if (s->resume) {
>          if (s->detached) {
> -            qemu_mutex_lock_iothread();
> +            bql_lock();
>          }
>          vm_start();
>          if (s->detached) {
> -            qemu_mutex_unlock_iothread();
> +            bql_unlock();
>          }
>      }
>      migrate_del_blocker(&dump_migration_blocker);
> diff --git a/hw/core/cpu-common.c b/hw/core/cpu-common.c
> index 82dae51a55..a59e2ce645 100644
> --- a/hw/core/cpu-common.c
> +++ b/hw/core/cpu-common.c
> @@ -70,14 +70,14 @@ CPUState *cpu_create(const char *typename)
>   * BQL here if we need to.  cpu_interrupt assumes it is held.*/
>  void cpu_reset_interrupt(CPUState *cpu, int mask)
>  {
> -    bool need_lock =3D !qemu_mutex_iothread_locked();
> +    bool need_lock =3D !bql_locked();
>
>      if (need_lock) {
> -        qemu_mutex_lock_iothread();
> +        bql_lock();
>      }
>      cpu->interrupt_request &=3D ~mask;
>      if (need_lock) {
> -        qemu_mutex_unlock_iothread();
> +        bql_unlock();
>      }
>  }
>
> diff --git a/hw/i386/intel_iommu.c b/hw/i386/intel_iommu.c
> index 5085a6fee3..7e310109cf 100644
> --- a/hw/i386/intel_iommu.c
> +++ b/hw/i386/intel_iommu.c
> @@ -1665,7 +1665,7 @@ static bool vtd_switch_address_space(VTDAddressSpac=
e
> *as)
>  {
>      bool use_iommu, pt;
>      /* Whether we need to take the BQL on our own */
> -    bool take_bql =3D !qemu_mutex_iothread_locked();
> +    bool take_bql =3D !bql_locked();
>
>      assert(as);
>
> @@ -1683,7 +1683,7 @@ static bool vtd_switch_address_space(VTDAddressSpac=
e
> *as)
>       * it. We'd better make sure we have had it already, or, take it.
>       */
>      if (take_bql) {
> -        qemu_mutex_lock_iothread();
> +        bql_lock();
>      }
>
>      /* Turn off first then on the other */
> @@ -1738,7 +1738,7 @@ static bool vtd_switch_address_space(VTDAddressSpac=
e
> *as)
>      }
>
>      if (take_bql) {
> -        qemu_mutex_unlock_iothread();
> +        bql_unlock();
>      }
>
>      return use_iommu;
> diff --git a/hw/i386/kvm/xen_evtchn.c b/hw/i386/kvm/xen_evtchn.c
> index 02b8cbf8df..d7d15cfaf7 100644
> --- a/hw/i386/kvm/xen_evtchn.c
> +++ b/hw/i386/kvm/xen_evtchn.c
> @@ -425,7 +425,7 @@ void xen_evtchn_set_callback_level(int level)
>       * effect immediately. That just leaves interdomain loopback as the
> case
>       * which uses the BH.
>       */
> -    if (!qemu_mutex_iothread_locked()) {
> +    if (!bql_locked()) {
>          qemu_bh_schedule(s->gsi_bh);
>          return;
>      }
> @@ -459,7 +459,7 @@ int xen_evtchn_set_callback_param(uint64_t param)
>       * We need the BQL because set_callback_pci_intx() may call into PCI
> code,
>       * and because we may need to manipulate the old and new GSI levels.
>       */
> -    assert(qemu_mutex_iothread_locked());
> +    assert(bql_locked());
>      qemu_mutex_lock(&s->port_lock);
>
>      switch (type) {
> @@ -1037,7 +1037,7 @@ static int close_port(XenEvtchnState *s,
> evtchn_port_t port,
>      XenEvtchnPort *p =3D &s->port_table[port];
>
>      /* Because it *might* be a PIRQ port */
> -    assert(qemu_mutex_iothread_locked());
> +    assert(bql_locked());
>
>      switch (p->type) {
>      case EVTCHNSTAT_closed:
> @@ -1104,7 +1104,7 @@ int xen_evtchn_soft_reset(void)
>          return -ENOTSUP;
>      }
>
> -    assert(qemu_mutex_iothread_locked());
> +    assert(bql_locked());
>
>      qemu_mutex_lock(&s->port_lock);
>
> @@ -1601,7 +1601,7 @@ bool xen_evtchn_set_gsi(int gsi, int level)
>      XenEvtchnState *s =3D xen_evtchn_singleton;
>      int pirq;
>
> -    assert(qemu_mutex_iothread_locked());
> +    assert(bql_locked());
>
>      if (!s || gsi < 0 || gsi >=3D IOAPIC_NUM_PINS) {
>          return false;
> @@ -1712,7 +1712,7 @@ void xen_evtchn_snoop_msi(PCIDevice *dev, bool
> is_msix, unsigned int vector,
>          return;
>      }
>
> -    assert(qemu_mutex_iothread_locked());
> +    assert(bql_locked());
>
>      pirq =3D msi_pirq_target(addr, data);
>
> @@ -1749,7 +1749,7 @@ int xen_evtchn_translate_pirq_msi(struct
> kvm_irq_routing_entry *route,
>          return 1; /* Not a PIRQ */
>      }
>
> -    assert(qemu_mutex_iothread_locked());
> +    assert(bql_locked());
>
>      pirq =3D msi_pirq_target(address, data);
>      if (!pirq || pirq >=3D s->nr_pirqs) {
> @@ -1796,7 +1796,7 @@ bool xen_evtchn_deliver_pirq_msi(uint64_t address,
> uint32_t data)
>          return false;
>      }
>
> -    assert(qemu_mutex_iothread_locked());
> +    assert(bql_locked());
>
>      pirq =3D msi_pirq_target(address, data);
>      if (!pirq || pirq >=3D s->nr_pirqs) {
> diff --git a/hw/i386/kvm/xen_overlay.c b/hw/i386/kvm/xen_overlay.c
> index 39fda1b72c..1722294638 100644
> --- a/hw/i386/kvm/xen_overlay.c
> +++ b/hw/i386/kvm/xen_overlay.c
> @@ -194,7 +194,7 @@ int xen_overlay_map_shinfo_page(uint64_t gpa)
>          return -ENOENT;
>      }
>
> -    assert(qemu_mutex_iothread_locked());
> +    assert(bql_locked());
>
>      if (s->shinfo_gpa) {
>          /* If removing shinfo page, turn the kernel magic off first */
> diff --git a/hw/i386/kvm/xen_xenstore.c b/hw/i386/kvm/xen_xenstore.c
> index 6e651960b3..ae27889a3f 100644
> --- a/hw/i386/kvm/xen_xenstore.c
> +++ b/hw/i386/kvm/xen_xenstore.c
> @@ -1341,7 +1341,7 @@ static void fire_watch_cb(void *opaque, const char
> *path, const char *token)
>  {
>      XenXenstoreState *s =3D opaque;
>
> -    assert(qemu_mutex_iothread_locked());
> +    assert(bql_locked());
>
>      /*
>       * If there's a response pending, we obviously can't scribble over
> diff --git a/hw/intc/arm_gicv3_cpuif.c b/hw/intc/arm_gicv3_cpuif.c
> index ab1a00508e..77c2a6dd3b 100644
> --- a/hw/intc/arm_gicv3_cpuif.c
> +++ b/hw/intc/arm_gicv3_cpuif.c
> @@ -934,7 +934,7 @@ void gicv3_cpuif_update(GICv3CPUState *cs)
>      ARMCPU *cpu =3D ARM_CPU(cs->cpu);
>      CPUARMState *env =3D &cpu->env;
>
> -    g_assert(qemu_mutex_iothread_locked());
> +    g_assert(bql_locked());
>
>      trace_gicv3_cpuif_update(gicv3_redist_affid(cs), cs->hppi.irq,
>                               cs->hppi.grp, cs->hppi.prio);
> diff --git a/hw/intc/s390_flic.c b/hw/intc/s390_flic.c
> index 74e02858d4..93b8531ad0 100644
> --- a/hw/intc/s390_flic.c
> +++ b/hw/intc/s390_flic.c
> @@ -106,7 +106,7 @@ static int qemu_s390_clear_io_flic(S390FLICState *fs,
> uint16_t subchannel_id,
>      QEMUS390FlicIO *cur, *next;
>      uint8_t isc;
>
> -    g_assert(qemu_mutex_iothread_locked());
> +    g_assert(bql_locked());
>      if (!(flic->pending & FLIC_PENDING_IO)) {
>          return 0;
>      }
> @@ -223,7 +223,7 @@ uint32_t
> qemu_s390_flic_dequeue_service(QEMUS390FLICState *flic)
>  {
>      uint32_t tmp;
>
> -    g_assert(qemu_mutex_iothread_locked());
> +    g_assert(bql_locked());
>      g_assert(flic->pending & FLIC_PENDING_SERVICE);
>      tmp =3D flic->service_param;
>      flic->service_param =3D 0;
> @@ -238,7 +238,7 @@ QEMUS390FlicIO
> *qemu_s390_flic_dequeue_io(QEMUS390FLICState *flic, uint64_t cr6)
>      QEMUS390FlicIO *io;
>      uint8_t isc;
>
> -    g_assert(qemu_mutex_iothread_locked());
> +    g_assert(bql_locked());
>      if (!(flic->pending & CR6_TO_PENDING_IO(cr6))) {
>          return NULL;
>      }
> @@ -262,7 +262,7 @@ QEMUS390FlicIO
> *qemu_s390_flic_dequeue_io(QEMUS390FLICState *flic, uint64_t cr6)
>
>  void qemu_s390_flic_dequeue_crw_mchk(QEMUS390FLICState *flic)
>  {
> -    g_assert(qemu_mutex_iothread_locked());
> +    g_assert(bql_locked());
>      g_assert(flic->pending & FLIC_PENDING_MCHK_CR);
>      flic->pending &=3D ~FLIC_PENDING_MCHK_CR;
>  }
> @@ -271,7 +271,7 @@ static void qemu_s390_inject_service(S390FLICState
> *fs, uint32_t parm)
>  {
>      QEMUS390FLICState *flic =3D s390_get_qemu_flic(fs);
>
> -    g_assert(qemu_mutex_iothread_locked());
> +    g_assert(bql_locked());
>      /* multiplexing is good enough for sclp - kvm does it internally as
> well */
>      flic->service_param |=3D parm;
>      flic->pending |=3D FLIC_PENDING_SERVICE;
> @@ -287,7 +287,7 @@ static void qemu_s390_inject_io(S390FLICState *fs,
> uint16_t subchannel_id,
>      QEMUS390FLICState *flic =3D s390_get_qemu_flic(fs);
>      QEMUS390FlicIO *io;
>
> -    g_assert(qemu_mutex_iothread_locked());
> +    g_assert(bql_locked());
>      io =3D g_new0(QEMUS390FlicIO, 1);
>      io->id =3D subchannel_id;
>      io->nr =3D subchannel_nr;
> @@ -304,7 +304,7 @@ static void qemu_s390_inject_crw_mchk(S390FLICState
> *fs)
>  {
>      QEMUS390FLICState *flic =3D s390_get_qemu_flic(fs);
>
> -    g_assert(qemu_mutex_iothread_locked());
> +    g_assert(bql_locked());
>      flic->pending |=3D FLIC_PENDING_MCHK_CR;
>
>      qemu_s390_flic_notify(FLIC_PENDING_MCHK_CR);
> @@ -330,7 +330,7 @@ bool qemu_s390_flic_has_crw_mchk(QEMUS390FLICState
> *flic)
>
>  bool qemu_s390_flic_has_any(QEMUS390FLICState *flic)
>  {
> -    g_assert(qemu_mutex_iothread_locked());
> +    g_assert(bql_locked());
>      return !!flic->pending;
>  }
>
> @@ -340,7 +340,7 @@ static void qemu_s390_flic_reset(DeviceState *dev)
>      QEMUS390FlicIO *cur, *next;
>      int isc;
>
> -    g_assert(qemu_mutex_iothread_locked());
> +    g_assert(bql_locked());
>      flic->simm =3D 0;
>      flic->nimm =3D 0;
>      flic->pending =3D 0;
> diff --git a/hw/misc/edu.c b/hw/misc/edu.c
> index a1f8bc77e7..fa05bdd4f3 100644
> --- a/hw/misc/edu.c
> +++ b/hw/misc/edu.c
> @@ -355,9 +355,9 @@ static void *edu_fact_thread(void *opaque)
>          smp_mb__after_rmw();
>
>          if (qatomic_read(&edu->status) & EDU_STATUS_IRQFACT) {
> -            qemu_mutex_lock_iothread();
> +            bql_lock();
>              edu_raise_irq(edu, FACT_IRQ);
> -            qemu_mutex_unlock_iothread();
> +            bql_unlock();
>          }
>      }
>
> diff --git a/hw/misc/imx6_src.c b/hw/misc/imx6_src.c
> index a9c64d06eb..2b9bb07540 100644
> --- a/hw/misc/imx6_src.c
> +++ b/hw/misc/imx6_src.c
> @@ -131,7 +131,7 @@ static void imx6_clear_reset_bit(CPUState *cpu,
> run_on_cpu_data data)
>      struct SRCSCRResetInfo *ri =3D data.host_ptr;
>      IMX6SRCState *s =3D ri->s;
>
> -    assert(qemu_mutex_iothread_locked());
> +    assert(bql_locked());
>
>      s->regs[SRC_SCR] =3D deposit32(s->regs[SRC_SCR], ri->reset_bit, 1, 0=
);
>      DPRINTF("reg[%s] <=3D 0x%" PRIx32 "\n",
> diff --git a/hw/misc/imx7_src.c b/hw/misc/imx7_src.c
> index 983251e86f..77ad7a7eef 100644
> --- a/hw/misc/imx7_src.c
> +++ b/hw/misc/imx7_src.c
> @@ -136,7 +136,7 @@ static void imx7_clear_reset_bit(CPUState *cpu,
> run_on_cpu_data data)
>      struct SRCSCRResetInfo *ri =3D data.host_ptr;
>      IMX7SRCState *s =3D ri->s;
>
> -    assert(qemu_mutex_iothread_locked());
> +    assert(bql_locked());
>
>      s->regs[SRC_A7RCR0] =3D deposit32(s->regs[SRC_A7RCR0], ri->reset_bit=
,
> 1, 0);
>
> diff --git a/hw/net/xen_nic.c b/hw/net/xen_nic.c
> index 1e2b3baeb1..453fdb9819 100644
> --- a/hw/net/xen_nic.c
> +++ b/hw/net/xen_nic.c
> @@ -133,7 +133,7 @@ static bool net_tx_packets(struct XenNetDev *netdev)
>      void *page;
>      void *tmpbuf =3D NULL;
>
> -    assert(qemu_mutex_iothread_locked());
> +    assert(bql_locked());
>
>      for (;;) {
>          rc =3D netdev->tx_ring.req_cons;
> @@ -260,7 +260,7 @@ static ssize_t net_rx_packet(NetClientState *nc, cons=
t
> uint8_t *buf, size_t size
>      RING_IDX rc, rp;
>      void *page;
>
> -    assert(qemu_mutex_iothread_locked());
> +    assert(bql_locked());
>
>      if (xen_device_backend_get_state(&netdev->xendev) !=3D
> XenbusStateConnected) {
>          return -1;
> @@ -354,7 +354,7 @@ static bool xen_netdev_connect(XenDevice *xendev,
> Error **errp)
>      XenNetDev *netdev =3D XEN_NET_DEVICE(xendev);
>      unsigned int port, rx_copy;
>
> -    assert(qemu_mutex_iothread_locked());
> +    assert(bql_locked());
>
>      if (xen_device_frontend_scanf(xendev, "tx-ring-ref", "%u",
>                                    &netdev->tx_ring_ref) !=3D 1) {
> @@ -425,7 +425,7 @@ static void xen_netdev_disconnect(XenDevice *xendev,
> Error **errp)
>
>      trace_xen_netdev_disconnect(netdev->dev);
>
> -    assert(qemu_mutex_iothread_locked());
> +    assert(bql_locked());
>
>      netdev->tx_ring.sring =3D NULL;
>      netdev->rx_ring.sring =3D NULL;
> diff --git a/hw/ppc/pegasos2.c b/hw/ppc/pegasos2.c
> index 3203a4a728..d84f3f977d 100644
> --- a/hw/ppc/pegasos2.c
> +++ b/hw/ppc/pegasos2.c
> @@ -515,7 +515,7 @@ static void pegasos2_hypercall(PPCVirtualHypervisor
> *vhyp, PowerPCCPU *cpu)
>      CPUPPCState *env =3D &cpu->env;
>
>      /* The TCG path should also be holding the BQL at this point */
> -    g_assert(qemu_mutex_iothread_locked());
> +    g_assert(bql_locked());
>
>      if (FIELD_EX64(env->msr, MSR, PR)) {
>          qemu_log_mask(LOG_GUEST_ERROR, "Hypercall made with MSR[PR]=3D1\=
n");
> diff --git a/hw/ppc/ppc.c b/hw/ppc/ppc.c
> index be167710a3..b6581c16fc 100644
> --- a/hw/ppc/ppc.c
> +++ b/hw/ppc/ppc.c
> @@ -314,7 +314,7 @@ void store_40x_dbcr0(CPUPPCState *env, uint32_t val)
>  {
>      PowerPCCPU *cpu =3D env_archcpu(env);
>
> -    qemu_mutex_lock_iothread();
> +    bql_lock();
>
>      switch ((val >> 28) & 0x3) {
>      case 0x0:
> @@ -334,7 +334,7 @@ void store_40x_dbcr0(CPUPPCState *env, uint32_t val)
>          break;
>      }
>
> -    qemu_mutex_unlock_iothread();
> +    bql_unlock();
>  }
>
>  /* PowerPC 40x internal IRQ controller */
> diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
> index df09aa9d6a..0620912f9c 100644
> --- a/hw/ppc/spapr.c
> +++ b/hw/ppc/spapr.c
> @@ -1304,7 +1304,7 @@ static void
> emulate_spapr_hypercall(PPCVirtualHypervisor *vhyp,
>      CPUPPCState *env =3D &cpu->env;
>
>      /* The TCG path should also be holding the BQL at this point */
> -    g_assert(qemu_mutex_iothread_locked());
> +    g_assert(bql_locked());
>
>      g_assert(!vhyp_cpu_in_nested(cpu));
>
> diff --git a/hw/ppc/spapr_rng.c b/hw/ppc/spapr_rng.c
> index df5c4b9687..c2fda7ad20 100644
> --- a/hw/ppc/spapr_rng.c
> +++ b/hw/ppc/spapr_rng.c
> @@ -82,9 +82,9 @@ static target_ulong h_random(PowerPCCPU *cpu,
> SpaprMachineState *spapr,
>      while (hrdata.received < 8) {
>          rng_backend_request_entropy(rngstate->backend, 8 -
> hrdata.received,
>                                      random_recv, &hrdata);
> -        qemu_mutex_unlock_iothread();
> +        bql_unlock();
>          qemu_sem_wait(&hrdata.sem);
> -        qemu_mutex_lock_iothread();
> +        bql_lock();
>      }
>
>      qemu_sem_destroy(&hrdata.sem);
> diff --git a/hw/ppc/spapr_softmmu.c b/hw/ppc/spapr_softmmu.c
> index 278666317e..fc1bbc0b61 100644
> --- a/hw/ppc/spapr_softmmu.c
> +++ b/hw/ppc/spapr_softmmu.c
> @@ -334,7 +334,7 @@ static void *hpt_prepare_thread(void *opaque)
>          pending->ret =3D H_NO_MEM;
>      }
>
> -    qemu_mutex_lock_iothread();
> +    bql_lock();
>
>      if (SPAPR_MACHINE(qdev_get_machine())->pending_hpt =3D=3D pending) {
>          /* Ready to go */
> @@ -344,7 +344,7 @@ static void *hpt_prepare_thread(void *opaque)
>          free_pending_hpt(pending);
>      }
>
> -    qemu_mutex_unlock_iothread();
> +    bql_unlock();
>      return NULL;
>  }
>
> diff --git a/hw/remote/mpqemu-link.c b/hw/remote/mpqemu-link.c
> index 9bd98e8219..d04ac93621 100644
> --- a/hw/remote/mpqemu-link.c
> +++ b/hw/remote/mpqemu-link.c
> @@ -33,7 +33,7 @@
>   */
>  bool mpqemu_msg_send(MPQemuMsg *msg, QIOChannel *ioc, Error **errp)
>  {
> -    bool iolock =3D qemu_mutex_iothread_locked();
> +    bool drop_bql =3D bql_locked();
>      bool iothread =3D qemu_in_iothread();
>      struct iovec send[2] =3D {};
>      int *fds =3D NULL;
> @@ -63,8 +63,8 @@ bool mpqemu_msg_send(MPQemuMsg *msg, QIOChannel *ioc,
> Error **errp)
>       * for IOThread case.
>       * Also skip lock handling while in a co-routine in the main context=
.
>       */
> -    if (iolock && !iothread && !qemu_in_coroutine()) {
> -        qemu_mutex_unlock_iothread();
> +    if (drop_bql && !iothread && !qemu_in_coroutine()) {
> +        bql_unlock();
>      }
>
>      if (!qio_channel_writev_full_all(ioc, send, G_N_ELEMENTS(send),
> @@ -74,9 +74,9 @@ bool mpqemu_msg_send(MPQemuMsg *msg, QIOChannel *ioc,
> Error **errp)
>          trace_mpqemu_send_io_error(msg->cmd, msg->size, nfds);
>      }
>
> -    if (iolock && !iothread && !qemu_in_coroutine()) {
> +    if (drop_bql && !iothread && !qemu_in_coroutine()) {
>          /* See above comment why skip locking here. */
> -        qemu_mutex_lock_iothread();
> +        bql_lock();
>      }
>
>      return ret;
> @@ -96,7 +96,7 @@ static ssize_t mpqemu_read(QIOChannel *ioc, void *buf,
> size_t len, int **fds,
>                             size_t *nfds, Error **errp)
>  {
>      struct iovec iov =3D { .iov_base =3D buf, .iov_len =3D len };
> -    bool iolock =3D qemu_mutex_iothread_locked();
> +    bool drop_bql =3D bql_locked();
>      bool iothread =3D qemu_in_iothread();
>      int ret =3D -1;
>
> @@ -106,14 +106,14 @@ static ssize_t mpqemu_read(QIOChannel *ioc, void
> *buf, size_t len, int **fds,
>       */
>      assert(qemu_in_coroutine() || !iothread);
>
> -    if (iolock && !iothread && !qemu_in_coroutine()) {
> -        qemu_mutex_unlock_iothread();
> +    if (drop_bql && !iothread && !qemu_in_coroutine()) {
> +        bql_unlock();
>      }
>
>      ret =3D qio_channel_readv_full_all_eof(ioc, &iov, 1, fds, nfds, errp=
);
>
> -    if (iolock && !iothread && !qemu_in_coroutine()) {
> -        qemu_mutex_lock_iothread();
> +    if (drop_bql && !iothread && !qemu_in_coroutine()) {
> +        bql_lock();
>      }
>
>      return (ret <=3D 0) ? ret : iov.iov_len;
> diff --git a/hw/remote/vfio-user-obj.c b/hw/remote/vfio-user-obj.c
> index 8b10c32a3c..d9b879e056 100644
> --- a/hw/remote/vfio-user-obj.c
> +++ b/hw/remote/vfio-user-obj.c
> @@ -400,7 +400,7 @@ static int vfu_object_mr_rw(MemoryRegion *mr, uint8_t
> *buf, hwaddr offset,
>          }
>
>          if (release_lock) {
> -            qemu_mutex_unlock_iothread();
> +            bql_unlock();
>              release_lock =3D false;
>          }
>
> diff --git a/hw/s390x/s390-skeys.c b/hw/s390x/s390-skeys.c
> index 8f5159d85d..5c535d483e 100644
> --- a/hw/s390x/s390-skeys.c
> +++ b/hw/s390x/s390-skeys.c
> @@ -153,7 +153,7 @@ void qmp_dump_skeys(const char *filename, Error **err=
p)
>          goto out;
>      }
>
> -    assert(qemu_mutex_iothread_locked());
> +    assert(bql_locked());
>      guest_phys_blocks_init(&guest_phys_blocks);
>      guest_phys_blocks_append(&guest_phys_blocks);
>
> diff --git a/migration/block-dirty-bitmap.c
> b/migration/block-dirty-bitmap.c
> index 24347ab0f7..92e031b6fa 100644
> --- a/migration/block-dirty-bitmap.c
> +++ b/migration/block-dirty-bitmap.c
> @@ -774,7 +774,7 @@ static void dirty_bitmap_state_pending(void *opaque,
>      SaveBitmapState *dbms;
>      uint64_t pending =3D 0;
>
> -    qemu_mutex_lock_iothread();
> +    bql_lock();
>
>      QSIMPLEQ_FOREACH(dbms, &s->dbms_list, entry) {
>          uint64_t gran =3D bdrv_dirty_bitmap_granularity(dbms->bitmap);
> @@ -784,7 +784,7 @@ static void dirty_bitmap_state_pending(void *opaque,
>          pending +=3D DIV_ROUND_UP(sectors * BDRV_SECTOR_SIZE, gran);
>      }
>
> -    qemu_mutex_unlock_iothread();
> +    bql_unlock();
>
>      trace_dirty_bitmap_state_pending(pending);
>
> diff --git a/migration/block.c b/migration/block.c
> index a15f9bddcb..4a675b92bc 100644
> --- a/migration/block.c
> +++ b/migration/block.c
> @@ -269,7 +269,7 @@ static int mig_save_device_bulk(QEMUFile *f,
> BlkMigDevState *bmds)
>      int64_t count;
>
>      if (bmds->shared_base) {
> -        qemu_mutex_lock_iothread();
> +        bql_lock();
>          aio_context_acquire(blk_get_aio_context(bb));
>          /* Skip unallocated sectors; intentionally treats failure or
>           * partial sector as an allocated sector */
> @@ -282,7 +282,7 @@ static int mig_save_device_bulk(QEMUFile *f,
> BlkMigDevState *bmds)
>              cur_sector +=3D count >> BDRV_SECTOR_BITS;
>          }
>          aio_context_release(blk_get_aio_context(bb));
> -        qemu_mutex_unlock_iothread();
> +        bql_unlock();
>      }
>
>      if (cur_sector >=3D total_sectors) {
> @@ -321,14 +321,14 @@ static int mig_save_device_bulk(QEMUFile *f,
> BlkMigDevState *bmds)
>       * This is ugly and will disappear when we make bdrv_* thread-safe,
>       * without the need to acquire the AioContext.
>       */
> -    qemu_mutex_lock_iothread();
> +    bql_lock();
>      aio_context_acquire(blk_get_aio_context(bmds->blk));
>      bdrv_reset_dirty_bitmap(bmds->dirty_bitmap, cur_sector *
> BDRV_SECTOR_SIZE,
>                              nr_sectors * BDRV_SECTOR_SIZE);
>      blk->aiocb =3D blk_aio_preadv(bb, cur_sector * BDRV_SECTOR_SIZE,
> &blk->qiov,
>                                  0, blk_mig_read_cb, blk);
>      aio_context_release(blk_get_aio_context(bmds->blk));
> -    qemu_mutex_unlock_iothread();
> +    bql_unlock();
>
>      bmds->cur_sector =3D cur_sector + nr_sectors;
>      return (bmds->cur_sector >=3D total_sectors);
> @@ -786,9 +786,9 @@ static int block_save_iterate(QEMUFile *f, void
> *opaque)
>              /* Always called with iothread lock taken for
>               * simplicity, block_save_complete also calls it.
>               */
> -            qemu_mutex_lock_iothread();
> +            bql_lock();
>              ret =3D blk_mig_save_dirty_block(f, 1);
> -            qemu_mutex_unlock_iothread();
> +            bql_unlock();
>          }
>          if (ret < 0) {
>              return ret;
> @@ -860,9 +860,9 @@ static void block_state_pending(void *opaque, uint64_=
t
> *must_precopy,
>      /* Estimate pending number of bytes to send */
>      uint64_t pending;
>
> -    qemu_mutex_lock_iothread();
> +    bql_lock();
>      pending =3D get_remaining_dirty();
> -    qemu_mutex_unlock_iothread();
> +    bql_unlock();
>
>      blk_mig_lock();
>      pending +=3D block_mig_state.submitted * BLK_MIG_BLOCK_SIZE +
> diff --git a/migration/colo.c b/migration/colo.c
> index 4447e34914..2a74efdd77 100644
> --- a/migration/colo.c
> +++ b/migration/colo.c
> @@ -420,13 +420,13 @@ static int
> colo_do_checkpoint_transaction(MigrationState *s,
>      qio_channel_io_seek(QIO_CHANNEL(bioc), 0, 0, NULL);
>      bioc->usage =3D 0;
>
> -    qemu_mutex_lock_iothread();
> +    bql_lock();
>      if (failover_get_state() !=3D FAILOVER_STATUS_NONE) {
> -        qemu_mutex_unlock_iothread();
> +        bql_unlock();
>          goto out;
>      }
>      vm_stop_force_state(RUN_STATE_COLO);
> -    qemu_mutex_unlock_iothread();
> +    bql_unlock();
>      trace_colo_vm_state_change("run", "stop");
>      /*
>       * Failover request bh could be called after vm_stop_force_state(),
> @@ -435,23 +435,23 @@ static int
> colo_do_checkpoint_transaction(MigrationState *s,
>      if (failover_get_state() !=3D FAILOVER_STATUS_NONE) {
>          goto out;
>      }
> -    qemu_mutex_lock_iothread();
> +    bql_lock();
>
>      replication_do_checkpoint_all(&local_err);
>      if (local_err) {
> -        qemu_mutex_unlock_iothread();
> +        bql_unlock();
>          goto out;
>      }
>
>      colo_send_message(s->to_dst_file, COLO_MESSAGE_VMSTATE_SEND,
> &local_err);
>      if (local_err) {
> -        qemu_mutex_unlock_iothread();
> +        bql_unlock();
>          goto out;
>      }
>      /* Note: device state is saved into buffer */
>      ret =3D qemu_save_device_state(fb);
>
> -    qemu_mutex_unlock_iothread();
> +    bql_unlock();
>      if (ret < 0) {
>          goto out;
>      }
> @@ -504,9 +504,9 @@ static int
> colo_do_checkpoint_transaction(MigrationState *s,
>
>      ret =3D 0;
>
> -    qemu_mutex_lock_iothread();
> +    bql_lock();
>      vm_start();
> -    qemu_mutex_unlock_iothread();
> +    bql_unlock();
>      trace_colo_vm_state_change("stop", "run");
>
>  out:
> @@ -557,15 +557,15 @@ static void colo_process_checkpoint(MigrationState
> *s)
>      fb =3D qemu_file_new_output(QIO_CHANNEL(bioc));
>      object_unref(OBJECT(bioc));
>
> -    qemu_mutex_lock_iothread();
> +    bql_lock();
>      replication_start_all(REPLICATION_MODE_PRIMARY, &local_err);
>      if (local_err) {
> -        qemu_mutex_unlock_iothread();
> +        bql_unlock();
>          goto out;
>      }
>
>      vm_start();
> -    qemu_mutex_unlock_iothread();
> +    bql_unlock();
>      trace_colo_vm_state_change("stop", "run");
>
>      timer_mod(s->colo_delay_timer, qemu_clock_get_ms(QEMU_CLOCK_HOST) +
> @@ -639,14 +639,14 @@ out:
>
>  void migrate_start_colo_process(MigrationState *s)
>  {
> -    qemu_mutex_unlock_iothread();
> +    bql_unlock();
>      qemu_event_init(&s->colo_checkpoint_event, false);
>      s->colo_delay_timer =3D  timer_new_ms(QEMU_CLOCK_HOST,
>                                  colo_checkpoint_notify, s);
>
>      qemu_sem_init(&s->colo_exit_sem, 0);
>      colo_process_checkpoint(s);
> -    qemu_mutex_lock_iothread();
> +    bql_lock();
>  }
>
>  static void colo_incoming_process_checkpoint(MigrationIncomingState *mis=
,
> @@ -657,9 +657,9 @@ static void
> colo_incoming_process_checkpoint(MigrationIncomingState *mis,
>      Error *local_err =3D NULL;
>      int ret;
>
> -    qemu_mutex_lock_iothread();
> +    bql_lock();
>      vm_stop_force_state(RUN_STATE_COLO);
> -    qemu_mutex_unlock_iothread();
> +    bql_unlock();
>      trace_colo_vm_state_change("run", "stop");
>
>      /* FIXME: This is unnecessary for periodic checkpoint mode */
> @@ -677,10 +677,10 @@ static void
> colo_incoming_process_checkpoint(MigrationIncomingState *mis,
>          return;
>      }
>
> -    qemu_mutex_lock_iothread();
> +    bql_lock();
>      cpu_synchronize_all_states();
>      ret =3D qemu_loadvm_state_main(mis->from_src_file, mis);
> -    qemu_mutex_unlock_iothread();
> +    bql_unlock();
>
>      if (ret < 0) {
>          error_setg(errp, "Load VM's live state (ram) error");
> @@ -719,14 +719,14 @@ static void
> colo_incoming_process_checkpoint(MigrationIncomingState *mis,
>          return;
>      }
>
> -    qemu_mutex_lock_iothread();
> +    bql_lock();
>      vmstate_loading =3D true;
>      colo_flush_ram_cache();
>      ret =3D qemu_load_device_state(fb);
>      if (ret < 0) {
>          error_setg(errp, "COLO: load device state failed");
>          vmstate_loading =3D false;
> -        qemu_mutex_unlock_iothread();
> +        bql_unlock();
>          return;
>      }
>
> @@ -734,7 +734,7 @@ static void
> colo_incoming_process_checkpoint(MigrationIncomingState *mis,
>      if (local_err) {
>          error_propagate(errp, local_err);
>          vmstate_loading =3D false;
> -        qemu_mutex_unlock_iothread();
> +        bql_unlock();
>          return;
>      }
>
> @@ -743,7 +743,7 @@ static void
> colo_incoming_process_checkpoint(MigrationIncomingState *mis,
>      if (local_err) {
>          error_propagate(errp, local_err);
>          vmstate_loading =3D false;
> -        qemu_mutex_unlock_iothread();
> +        bql_unlock();
>          return;
>      }
>      /* Notify all filters of all NIC to do checkpoint */
> @@ -752,13 +752,13 @@ static void
> colo_incoming_process_checkpoint(MigrationIncomingState *mis,
>      if (local_err) {
>          error_propagate(errp, local_err);
>          vmstate_loading =3D false;
> -        qemu_mutex_unlock_iothread();
> +        bql_unlock();
>          return;
>      }
>
>      vmstate_loading =3D false;
>      vm_start();
> -    qemu_mutex_unlock_iothread();
> +    bql_unlock();
>      trace_colo_vm_state_change("stop", "run");
>
>      if (failover_get_state() =3D=3D FAILOVER_STATUS_RELAUNCH) {
> @@ -851,14 +851,14 @@ static void *colo_process_incoming_thread(void
> *opaque)
>      fb =3D qemu_file_new_input(QIO_CHANNEL(bioc));
>      object_unref(OBJECT(bioc));
>
> -    qemu_mutex_lock_iothread();
> +    bql_lock();
>      replication_start_all(REPLICATION_MODE_SECONDARY, &local_err);
>      if (local_err) {
> -        qemu_mutex_unlock_iothread();
> +        bql_unlock();
>          goto out;
>      }
>      vm_start();
> -    qemu_mutex_unlock_iothread();
> +    bql_unlock();
>      trace_colo_vm_state_change("stop", "run");
>
>      colo_send_message(mis->to_src_file, COLO_MESSAGE_CHECKPOINT_READY,
> @@ -920,7 +920,7 @@ int coroutine_fn colo_incoming_co(void)
>      Error *local_err =3D NULL;
>      QemuThread th;
>
> -    assert(qemu_mutex_iothread_locked());
> +    assert(bql_locked());
>
>      if (!migration_incoming_colo_enabled()) {
>          return 0;
> @@ -940,10 +940,10 @@ int coroutine_fn colo_incoming_co(void)
>      qemu_coroutine_yield();
>      mis->colo_incoming_co =3D NULL;
>
> -    qemu_mutex_unlock_iothread();
> +    bql_unlock();
>      /* Wait checkpoint incoming thread exit before free resource */
>      qemu_thread_join(&th);
> -    qemu_mutex_lock_iothread();
> +    bql_lock();
>
>      /* We hold the global iothread lock, so it is safe here */
>      colo_release_ram_cache();
> diff --git a/migration/dirtyrate.c b/migration/dirtyrate.c
> index 036ac017fc..429d10c4d9 100644
> --- a/migration/dirtyrate.c
> +++ b/migration/dirtyrate.c
> @@ -90,13 +90,13 @@ static int64_t do_calculate_dirtyrate(DirtyPageRecord
> dirty_pages,
>
>  void global_dirty_log_change(unsigned int flag, bool start)
>  {
> -    qemu_mutex_lock_iothread();
> +    bql_lock();
>      if (start) {
>          memory_global_dirty_log_start(flag);
>      } else {
>          memory_global_dirty_log_stop(flag);
>      }
> -    qemu_mutex_unlock_iothread();
> +    bql_unlock();
>  }
>
>  /*
> @@ -106,12 +106,12 @@ void global_dirty_log_change(unsigned int flag, boo=
l
> start)
>   */
>  static void global_dirty_log_sync(unsigned int flag, bool one_shot)
>  {
> -    qemu_mutex_lock_iothread();
> +    bql_lock();
>      memory_global_dirty_log_sync(false);
>      if (one_shot) {
>          memory_global_dirty_log_stop(flag);
>      }
> -    qemu_mutex_unlock_iothread();
> +    bql_unlock();
>  }
>
>  static DirtyPageRecord *vcpu_dirty_stat_alloc(VcpuStat *stat)
> @@ -610,7 +610,7 @@ static void calculate_dirtyrate_dirty_bitmap(struct
> DirtyRateConfig config)
>      int64_t start_time;
>      DirtyPageRecord dirty_pages;
>
> -    qemu_mutex_lock_iothread();
> +    bql_lock();
>      memory_global_dirty_log_start(GLOBAL_DIRTY_DIRTY_RATE);
>
>      /*
> @@ -627,7 +627,7 @@ static void calculate_dirtyrate_dirty_bitmap(struct
> DirtyRateConfig config)
>       * KVM_DIRTY_LOG_MANUAL_PROTECT_ENABLE cap is enabled.
>       */
>      dirtyrate_manual_reset_protect();
> -    qemu_mutex_unlock_iothread();
> +    bql_unlock();
>
>      record_dirtypages_bitmap(&dirty_pages, true);
>
> diff --git a/migration/migration.c b/migration/migration.c
> index 3ce04b2aaf..be74c714d6 100644
> --- a/migration/migration.c
> +++ b/migration/migration.c
> @@ -1294,12 +1294,12 @@ static void migrate_fd_cleanup(MigrationState *s)
>          QEMUFile *tmp;
>
>          trace_migrate_fd_cleanup();
> -        qemu_mutex_unlock_iothread();
> +        bql_unlock();
>          if (s->migration_thread_running) {
>              qemu_thread_join(&s->thread);
>              s->migration_thread_running =3D false;
>          }
> -        qemu_mutex_lock_iothread();
> +        bql_lock();
>
>          multifd_save_cleanup();
>          qemu_mutex_lock(&s->qemu_file_lock);
> @@ -2411,7 +2411,7 @@ static int postcopy_start(MigrationState *ms, Error
> **errp)
>      }
>
>      trace_postcopy_start();
> -    qemu_mutex_lock_iothread();
> +    bql_lock();
>      trace_postcopy_start_set_run();
>
>      migration_downtime_start(ms);
> @@ -2520,7 +2520,7 @@ static int postcopy_start(MigrationState *ms, Error
> **errp)
>
>      migration_downtime_end(ms);
>
> -    qemu_mutex_unlock_iothread();
> +    bql_unlock();
>
>      if (migrate_postcopy_ram()) {
>          /*
> @@ -2561,7 +2561,7 @@ fail:
>              error_report_err(local_err);
>          }
>      }
> -    qemu_mutex_unlock_iothread();
> +    bql_unlock();
>      return -1;
>  }
>
> @@ -2595,14 +2595,14 @@ static int migration_maybe_pause(MigrationState *=
s,
>       * wait for the 'pause_sem' semaphore.
>       */
>      if (s->state !=3D MIGRATION_STATUS_CANCELLING) {
> -        qemu_mutex_unlock_iothread();
> +        bql_unlock();
>          migrate_set_state(&s->state, *current_active_state,
>                            MIGRATION_STATUS_PRE_SWITCHOVER);
>          qemu_sem_wait(&s->pause_sem);
>          migrate_set_state(&s->state, MIGRATION_STATUS_PRE_SWITCHOVER,
>                            new_state);
>          *current_active_state =3D new_state;
> -        qemu_mutex_lock_iothread();
> +        bql_lock();
>      }
>
>      return s->state =3D=3D new_state ? 0 : -EINVAL;
> @@ -2613,7 +2613,7 @@ static int
> migration_completion_precopy(MigrationState *s,
>  {
>      int ret;
>
> -    qemu_mutex_lock_iothread();
> +    bql_lock();
>      migration_downtime_start(s);
>      qemu_system_wakeup_request(QEMU_WAKEUP_REASON_OTHER, NULL);
>
> @@ -2641,7 +2641,7 @@ static int
> migration_completion_precopy(MigrationState *s,
>      ret =3D qemu_savevm_state_complete_precopy(s->to_dst_file, false,
>                                               s->block_inactive);
>  out_unlock:
> -    qemu_mutex_unlock_iothread();
> +    bql_unlock();
>      return ret;
>  }
>
> @@ -2649,9 +2649,9 @@ static void
> migration_completion_postcopy(MigrationState *s)
>  {
>      trace_migration_completion_postcopy_end();
>
> -    qemu_mutex_lock_iothread();
> +    bql_lock();
>      qemu_savevm_state_complete_postcopy(s->to_dst_file);
> -    qemu_mutex_unlock_iothread();
> +    bql_unlock();
>
>      /*
>       * Shutdown the postcopy fast path thread.  This is only needed when
> dest
> @@ -2675,14 +2675,14 @@ static void
> migration_completion_failed(MigrationState *s,
>           */
>          Error *local_err =3D NULL;
>
> -        qemu_mutex_lock_iothread();
> +        bql_lock();
>          bdrv_activate_all(&local_err);
>          if (local_err) {
>              error_report_err(local_err);
>          } else {
>              s->block_inactive =3D false;
>          }
> -        qemu_mutex_unlock_iothread();
> +        bql_unlock();
>      }
>
>      migrate_set_state(&s->state, current_active_state,
> @@ -3122,7 +3122,7 @@ static void
> migration_iteration_finish(MigrationState *s)
>      /* If we enabled cpu throttling for auto-converge, turn it off. */
>      cpu_throttle_stop();
>
> -    qemu_mutex_lock_iothread();
> +    bql_lock();
>      switch (s->state) {
>      case MIGRATION_STATUS_COMPLETED:
>          migration_calculate_complete(s);
> @@ -3153,7 +3153,7 @@ static void
> migration_iteration_finish(MigrationState *s)
>          break;
>      }
>      migrate_fd_cleanup_schedule(s);
> -    qemu_mutex_unlock_iothread();
> +    bql_unlock();
>  }
>
>  static void bg_migration_iteration_finish(MigrationState *s)
> @@ -3165,7 +3165,7 @@ static void
> bg_migration_iteration_finish(MigrationState *s)
>       */
>      ram_write_tracking_stop();
>
> -    qemu_mutex_lock_iothread();
> +    bql_lock();
>      switch (s->state) {
>      case MIGRATION_STATUS_COMPLETED:
>          migration_calculate_complete(s);
> @@ -3184,7 +3184,7 @@ static void
> bg_migration_iteration_finish(MigrationState *s)
>      }
>
>      migrate_fd_cleanup_schedule(s);
> -    qemu_mutex_unlock_iothread();
> +    bql_unlock();
>  }
>
>  /*
> @@ -3306,9 +3306,9 @@ static void *migration_thread(void *opaque)
>      object_ref(OBJECT(s));
>      update_iteration_initial_status(s);
>
> -    qemu_mutex_lock_iothread();
> +    bql_lock();
>      qemu_savevm_state_header(s->to_dst_file);
> -    qemu_mutex_unlock_iothread();
> +    bql_unlock();
>
>      /*
>       * If we opened the return path, we need to make sure dst has it
> @@ -3336,9 +3336,9 @@ static void *migration_thread(void *opaque)
>          qemu_savevm_send_colo_enable(s->to_dst_file);
>      }
>
> -    qemu_mutex_lock_iothread();
> +    bql_lock();
>      qemu_savevm_state_setup(s->to_dst_file);
> -    qemu_mutex_unlock_iothread();
> +    bql_unlock();
>
>      qemu_savevm_wait_unplug(s, MIGRATION_STATUS_SETUP,
>                                 MIGRATION_STATUS_ACTIVE);
> @@ -3449,10 +3449,10 @@ static void *bg_migration_thread(void *opaque)
>      ram_write_tracking_prepare();
>  #endif
>
> -    qemu_mutex_lock_iothread();
> +    bql_lock();
>      qemu_savevm_state_header(s->to_dst_file);
>      qemu_savevm_state_setup(s->to_dst_file);
> -    qemu_mutex_unlock_iothread();
> +    bql_unlock();
>
>      qemu_savevm_wait_unplug(s, MIGRATION_STATUS_SETUP,
>                                 MIGRATION_STATUS_ACTIVE);
> @@ -3462,7 +3462,7 @@ static void *bg_migration_thread(void *opaque)
>      trace_migration_thread_setup_complete();
>      migration_downtime_start(s);
>
> -    qemu_mutex_lock_iothread();
> +    bql_lock();
>
>      /*
>       * If VM is currently in suspended state, then, to make a valid
> runstate
> @@ -3505,7 +3505,7 @@ static void *bg_migration_thread(void *opaque)
>      s->vm_start_bh =3D qemu_bh_new(bg_migration_vm_start_bh, s);
>      qemu_bh_schedule(s->vm_start_bh);
>
> -    qemu_mutex_unlock_iothread();
> +    bql_unlock();
>
>      while (migration_is_active(s)) {
>          MigIterateState iter_state =3D bg_migration_iteration_run(s);
> @@ -3534,7 +3534,7 @@ fail:
>      if (early_fail) {
>          migrate_set_state(&s->state, MIGRATION_STATUS_ACTIVE,
>                  MIGRATION_STATUS_FAILED);
> -        qemu_mutex_unlock_iothread();
> +        bql_unlock();
>      }
>
>      bg_migration_iteration_finish(s);
> diff --git a/migration/ram.c b/migration/ram.c
> index 8c7886ab79..08dc7e2909 100644
> --- a/migration/ram.c
> +++ b/migration/ram.c
> @@ -2984,9 +2984,9 @@ static int ram_save_setup(QEMUFile *f, void *opaque=
)
>      migration_ops =3D g_malloc0(sizeof(MigrationOps));
>      migration_ops->ram_save_target_page =3D ram_save_target_page_legacy;
>
> -    qemu_mutex_unlock_iothread();
> +    bql_unlock();
>      ret =3D multifd_send_sync_main(f);
> -    qemu_mutex_lock_iothread();
> +    bql_lock();
>      if (ret < 0) {
>          return ret;
>      }
> @@ -3221,11 +3221,11 @@ static void ram_state_pending_exact(void *opaque,
> uint64_t *must_precopy,
>      uint64_t remaining_size =3D rs->migration_dirty_pages *
> TARGET_PAGE_SIZE;
>
>      if (!migration_in_postcopy() && remaining_size < s->threshold_size) =
{
> -        qemu_mutex_lock_iothread();
> +        bql_lock();
>          WITH_RCU_READ_LOCK_GUARD() {
>              migration_bitmap_sync_precopy(rs, false);
>          }
> -        qemu_mutex_unlock_iothread();
> +        bql_unlock();
>          remaining_size =3D rs->migration_dirty_pages * TARGET_PAGE_SIZE;
>      }
>
> @@ -3453,7 +3453,7 @@ void colo_incoming_start_dirty_log(void)
>  {
>      RAMBlock *block =3D NULL;
>      /* For memory_global_dirty_log_start below. */
> -    qemu_mutex_lock_iothread();
> +    bql_lock();
>      qemu_mutex_lock_ramlist();
>
>      memory_global_dirty_log_sync(false);
> @@ -3467,7 +3467,7 @@ void colo_incoming_start_dirty_log(void)
>      }
>      ram_state->migration_dirty_pages =3D 0;
>      qemu_mutex_unlock_ramlist();
> -    qemu_mutex_unlock_iothread();
> +    bql_unlock();
>  }
>
>  /* It is need to hold the global lock to call this helper */
> diff --git a/replay/replay-internal.c b/replay/replay-internal.c
> index 77d0c82327..3e08e381cb 100644
> --- a/replay/replay-internal.c
> +++ b/replay/replay-internal.c
> @@ -216,7 +216,7 @@ void replay_mutex_lock(void)
>  {
>      if (replay_mode !=3D REPLAY_MODE_NONE) {
>          unsigned long id;
> -        g_assert(!qemu_mutex_iothread_locked());
> +        g_assert(!bql_locked());
>          g_assert(!replay_mutex_locked());
>          qemu_mutex_lock(&lock);
>          id =3D mutex_tail++;
> diff --git a/semihosting/console.c b/semihosting/console.c
> index 5d61e8207e..60102bbab6 100644
> --- a/semihosting/console.c
> +++ b/semihosting/console.c
> @@ -43,7 +43,7 @@ static SemihostingConsole console;
>  static int console_can_read(void *opaque)
>  {
>      SemihostingConsole *c =3D opaque;
> -    g_assert(qemu_mutex_iothread_locked());
> +    g_assert(bql_locked());
>      return (int)fifo8_num_free(&c->fifo);
>  }
>
> @@ -58,7 +58,7 @@ static void console_wake_up(gpointer data, gpointer
> user_data)
>  static void console_read(void *opaque, const uint8_t *buf, int size)
>  {
>      SemihostingConsole *c =3D opaque;
> -    g_assert(qemu_mutex_iothread_locked());
> +    g_assert(bql_locked());
>      while (size-- && !fifo8_is_full(&c->fifo)) {
>          fifo8_push(&c->fifo, *buf++);
>      }
> @@ -70,7 +70,7 @@ bool qemu_semihosting_console_ready(void)
>  {
>      SemihostingConsole *c =3D &console;
>
> -    g_assert(qemu_mutex_iothread_locked());
> +    g_assert(bql_locked());
>      return !fifo8_is_empty(&c->fifo);
>  }
>
> @@ -78,7 +78,7 @@ void qemu_semihosting_console_block_until_ready(CPUStat=
e
> *cs)
>  {
>      SemihostingConsole *c =3D &console;
>
> -    g_assert(qemu_mutex_iothread_locked());
> +    g_assert(bql_locked());
>
>      /* Block if the fifo is completely empty. */
>      if (fifo8_is_empty(&c->fifo)) {
> diff --git a/stubs/iothread-lock.c b/stubs/iothread-lock.c
> index 5b45b7fc8b..d7890e5581 100644
> --- a/stubs/iothread-lock.c
> +++ b/stubs/iothread-lock.c
> @@ -1,15 +1,15 @@
>  #include "qemu/osdep.h"
>  #include "qemu/main-loop.h"
>
> -bool qemu_mutex_iothread_locked(void)
> +bool bql_locked(void)
>  {
>      return false;
>  }
>
> -void qemu_mutex_lock_iothread_impl(const char *file, int line)
> +void bql_lock_impl(const char *file, int line)
>  {
>  }
>
> -void qemu_mutex_unlock_iothread(void)
> +void bql_unlock(void)
>  {
>  }
> diff --git a/system/cpu-throttle.c b/system/cpu-throttle.c
> index d9bb30a223..786a9a5639 100644
> --- a/system/cpu-throttle.c
> +++ b/system/cpu-throttle.c
> @@ -57,9 +57,9 @@ static void cpu_throttle_thread(CPUState *cpu,
> run_on_cpu_data opaque)
>              qemu_cond_timedwait_iothread(cpu->halt_cond,
>                                           sleeptime_ns / SCALE_MS);
>          } else {
> -            qemu_mutex_unlock_iothread();
> +            bql_unlock();
>              g_usleep(sleeptime_ns / SCALE_US);
> -            qemu_mutex_lock_iothread();
> +            bql_lock();
>          }
>          sleeptime_ns =3D endtime_ns -
> qemu_clock_get_ns(QEMU_CLOCK_REALTIME);
>      }
> diff --git a/system/cpus.c b/system/cpus.c
> index a444a747f0..9b68dc9c7c 100644
> --- a/system/cpus.c
> +++ b/system/cpus.c
> @@ -65,7 +65,8 @@
>
>  #endif /* CONFIG_LINUX */
>
> -static QemuMutex qemu_global_mutex;
> +/* The Big QEMU Lock (BQL) */
> +static QemuMutex bql;
>
>  /*
>   * The chosen accelerator is supposed to register this.
> @@ -389,14 +390,14 @@ void qemu_init_cpu_loop(void)
>      qemu_init_sigbus();
>      qemu_cond_init(&qemu_cpu_cond);
>      qemu_cond_init(&qemu_pause_cond);
> -    qemu_mutex_init(&qemu_global_mutex);
> +    qemu_mutex_init(&bql);
>
>      qemu_thread_get_self(&io_thread);
>  }
>
>  void run_on_cpu(CPUState *cpu, run_on_cpu_func func, run_on_cpu_data dat=
a)
>  {
> -    do_run_on_cpu(cpu, func, data, &qemu_global_mutex);
> +    do_run_on_cpu(cpu, func, data, &bql);
>  }
>
>  static void qemu_cpu_stop(CPUState *cpu, bool exit)
> @@ -428,7 +429,7 @@ void qemu_wait_io_event(CPUState *cpu)
>              slept =3D true;
>              qemu_plugin_vcpu_idle_cb(cpu);
>          }
> -        qemu_cond_wait(cpu->halt_cond, &qemu_global_mutex);
> +        qemu_cond_wait(cpu->halt_cond, &bql);
>      }
>      if (slept) {
>          qemu_plugin_vcpu_resume_cb(cpu);
> @@ -481,46 +482,46 @@ bool qemu_in_vcpu_thread(void)
>      return current_cpu && qemu_cpu_is_self(current_cpu);
>  }
>
> -QEMU_DEFINE_STATIC_CO_TLS(bool, iothread_locked)
> +QEMU_DEFINE_STATIC_CO_TLS(bool, bql_locked)
>
> -bool qemu_mutex_iothread_locked(void)
> +bool bql_locked(void)
>  {
> -    return get_iothread_locked();
> +    return get_bql_locked();
>  }
>
>  bool qemu_in_main_thread(void)
>  {
> -    return qemu_mutex_iothread_locked();
> +    return bql_locked();
>  }
>
>  /*
>   * The BQL is taken from so many places that it is worth profiling the
>   * callers directly, instead of funneling them all through a single
> function.
>   */
> -void qemu_mutex_lock_iothread_impl(const char *file, int line)
> +void bql_lock_impl(const char *file, int line)
>  {
> -    QemuMutexLockFunc bql_lock =3D qatomic_read(&qemu_bql_mutex_lock_fun=
c);
> +    QemuMutexLockFunc bql_lock_fn =3D qatomic_read(&bql_mutex_lock_func)=
;
>
> -    g_assert(!qemu_mutex_iothread_locked());
> -    bql_lock(&qemu_global_mutex, file, line);
> -    set_iothread_locked(true);
> +    g_assert(!bql_locked());
> +    bql_lock_fn(&bql, file, line);
> +    set_bql_locked(true);
>  }
>
> -void qemu_mutex_unlock_iothread(void)
> +void bql_unlock(void)
>  {
> -    g_assert(qemu_mutex_iothread_locked());
> -    set_iothread_locked(false);
> -    qemu_mutex_unlock(&qemu_global_mutex);
> +    g_assert(bql_locked());
> +    set_bql_locked(false);
> +    qemu_mutex_unlock(&bql);
>  }
>
>  void qemu_cond_wait_iothread(QemuCond *cond)
>  {
> -    qemu_cond_wait(cond, &qemu_global_mutex);
> +    qemu_cond_wait(cond, &bql);
>  }
>
>  void qemu_cond_timedwait_iothread(QemuCond *cond, int ms)
>  {
> -    qemu_cond_timedwait(cond, &qemu_global_mutex, ms);
> +    qemu_cond_timedwait(cond, &bql, ms);
>  }
>
>  /* signal CPU creation */
> @@ -571,15 +572,15 @@ void pause_all_vcpus(void)
>      replay_mutex_unlock();
>
>      while (!all_vcpus_paused()) {
> -        qemu_cond_wait(&qemu_pause_cond, &qemu_global_mutex);
> +        qemu_cond_wait(&qemu_pause_cond, &bql);
>          CPU_FOREACH(cpu) {
>              qemu_cpu_kick(cpu);
>          }
>      }
>
> -    qemu_mutex_unlock_iothread();
> +    bql_unlock();
>      replay_mutex_lock();
> -    qemu_mutex_lock_iothread();
> +    bql_lock();
>  }
>
>  void cpu_resume(CPUState *cpu)
> @@ -608,9 +609,9 @@ void cpu_remove_sync(CPUState *cpu)
>      cpu->stop =3D true;
>      cpu->unplug =3D true;
>      qemu_cpu_kick(cpu);
> -    qemu_mutex_unlock_iothread();
> +    bql_unlock();
>      qemu_thread_join(cpu->thread);
> -    qemu_mutex_lock_iothread();
> +    bql_lock();
>  }
>
>  void cpus_register_accel(const AccelOpsClass *ops)
> @@ -649,7 +650,7 @@ void qemu_init_vcpu(CPUState *cpu)
>      cpus_accel->create_vcpu_thread(cpu);
>
>      while (!cpu->created) {
> -        qemu_cond_wait(&qemu_cpu_cond, &qemu_global_mutex);
> +        qemu_cond_wait(&qemu_cpu_cond, &bql);
>      }
>  }
>
> diff --git a/system/dirtylimit.c b/system/dirtylimit.c
> index 495c7a7082..b5607eb8c2 100644
> --- a/system/dirtylimit.c
> +++ b/system/dirtylimit.c
> @@ -148,9 +148,9 @@ void vcpu_dirty_rate_stat_stop(void)
>  {
>      qatomic_set(&vcpu_dirty_rate_stat->running, 0);
>      dirtylimit_state_unlock();
> -    qemu_mutex_unlock_iothread();
> +    bql_unlock();
>      qemu_thread_join(&vcpu_dirty_rate_stat->thread);
> -    qemu_mutex_lock_iothread();
> +    bql_lock();
>      dirtylimit_state_lock();
>  }
>
> diff --git a/system/memory.c b/system/memory.c
> index 798b6c0a17..7a9dc43c2d 100644
> --- a/system/memory.c
> +++ b/system/memory.c
> @@ -1119,7 +1119,7 @@ void memory_region_transaction_commit(void)
>      AddressSpace *as;
>
>      assert(memory_region_transaction_depth);
> -    assert(qemu_mutex_iothread_locked());
> +    assert(bql_locked());
>
>      --memory_region_transaction_depth;
>      if (!memory_region_transaction_depth) {
> diff --git a/system/physmem.c b/system/physmem.c
> index a63853a7bc..4937e67bad 100644
> --- a/system/physmem.c
> +++ b/system/physmem.c
> @@ -2639,8 +2639,8 @@ bool prepare_mmio_access(MemoryRegion *mr)
>  {
>      bool release_lock =3D false;
>
> -    if (!qemu_mutex_iothread_locked()) {
> -        qemu_mutex_lock_iothread();
> +    if (!bql_locked()) {
> +        bql_lock();
>          release_lock =3D true;
>      }
>      if (mr->flush_coalesced_mmio) {
> @@ -2721,7 +2721,7 @@ static MemTxResult flatview_write_continue(FlatView
> *fv, hwaddr addr,
>          }
>
>          if (release_lock) {
> -            qemu_mutex_unlock_iothread();
> +            bql_unlock();
>              release_lock =3D false;
>          }
>
> @@ -2799,7 +2799,7 @@ MemTxResult flatview_read_continue(FlatView *fv,
> hwaddr addr,
>          }
>
>          if (release_lock) {
> -            qemu_mutex_unlock_iothread();
> +            bql_unlock();
>              release_lock =3D false;
>          }
>
> diff --git a/system/runstate.c b/system/runstate.c
> index ea9d6c2a32..5833ba0675 100644
> --- a/system/runstate.c
> +++ b/system/runstate.c
> @@ -810,7 +810,7 @@ void qemu_init_subsystems(void)
>
>      qemu_init_cpu_list();
>      qemu_init_cpu_loop();
> -    qemu_mutex_lock_iothread();
> +    bql_lock();
>
>      atexit(qemu_run_exit_notifiers);
>
> diff --git a/system/watchpoint.c b/system/watchpoint.c
> index ba5ad13352..b76007ebf6 100644
> --- a/system/watchpoint.c
> +++ b/system/watchpoint.c
> @@ -155,9 +155,9 @@ void cpu_check_watchpoint(CPUState *cpu, vaddr addr,
> vaddr len,
>           * Now raise the debug interrupt so that it will
>           * trigger after the current instruction.
>           */
> -        qemu_mutex_lock_iothread();
> +        bql_lock();
>          cpu_interrupt(cpu, CPU_INTERRUPT_DEBUG);
> -        qemu_mutex_unlock_iothread();
> +        bql_unlock();
>          return;
>      }
>
> diff --git a/target/arm/arm-powerctl.c b/target/arm/arm-powerctl.c
> index c078849403..8850381565 100644
> --- a/target/arm/arm-powerctl.c
> +++ b/target/arm/arm-powerctl.c
> @@ -88,7 +88,7 @@ static void arm_set_cpu_on_async_work(CPUState
> *target_cpu_state,
>      g_free(info);
>
>      /* Finally set the power status */
> -    assert(qemu_mutex_iothread_locked());
> +    assert(bql_locked());
>      target_cpu->power_state =3D PSCI_ON;
>  }
>
> @@ -99,7 +99,7 @@ int arm_set_cpu_on(uint64_t cpuid, uint64_t entry,
> uint64_t context_id,
>      ARMCPU *target_cpu;
>      struct CpuOnInfo *info;
>
> -    assert(qemu_mutex_iothread_locked());
> +    assert(bql_locked());
>
>      DPRINTF("cpu %" PRId64 " (EL %d, %s) @ 0x%" PRIx64 " with R0 =3D 0x%=
"
> PRIx64
>              "\n", cpuid, target_el, target_aa64 ? "aarch64" : "aarch32",
> entry,
> @@ -196,7 +196,7 @@ static void
> arm_set_cpu_on_and_reset_async_work(CPUState *target_cpu_state,
>      target_cpu_state->halted =3D 0;
>
>      /* Finally set the power status */
> -    assert(qemu_mutex_iothread_locked());
> +    assert(bql_locked());
>      target_cpu->power_state =3D PSCI_ON;
>  }
>
> @@ -205,7 +205,7 @@ int arm_set_cpu_on_and_reset(uint64_t cpuid)
>      CPUState *target_cpu_state;
>      ARMCPU *target_cpu;
>
> -    assert(qemu_mutex_iothread_locked());
> +    assert(bql_locked());
>
>      /* Retrieve the cpu we are powering up */
>      target_cpu_state =3D arm_get_cpu_by_id(cpuid);
> @@ -247,7 +247,7 @@ static void arm_set_cpu_off_async_work(CPUState
> *target_cpu_state,
>  {
>      ARMCPU *target_cpu =3D ARM_CPU(target_cpu_state);
>
> -    assert(qemu_mutex_iothread_locked());
> +    assert(bql_locked());
>      target_cpu->power_state =3D PSCI_OFF;
>      target_cpu_state->halted =3D 1;
>      target_cpu_state->exception_index =3D EXCP_HLT;
> @@ -258,7 +258,7 @@ int arm_set_cpu_off(uint64_t cpuid)
>      CPUState *target_cpu_state;
>      ARMCPU *target_cpu;
>
> -    assert(qemu_mutex_iothread_locked());
> +    assert(bql_locked());
>
>      DPRINTF("cpu %" PRId64 "\n", cpuid);
>
> @@ -294,7 +294,7 @@ int arm_reset_cpu(uint64_t cpuid)
>      CPUState *target_cpu_state;
>      ARMCPU *target_cpu;
>
> -    assert(qemu_mutex_iothread_locked());
> +    assert(bql_locked());
>
>      DPRINTF("cpu %" PRId64 "\n", cpuid);
>
> diff --git a/target/arm/helper.c b/target/arm/helper.c
> index 2746d3fdac..4a978d1102 100644
> --- a/target/arm/helper.c
> +++ b/target/arm/helper.c
> @@ -5831,7 +5831,7 @@ static void do_hcr_write(CPUARMState *env, uint64_t
> value, uint64_t valid_mask)
>       * VFIQ are masked unless running at EL0 or EL1, and HCR
>       * can only be written at EL2.
>       */
> -    g_assert(qemu_mutex_iothread_locked());
> +    g_assert(bql_locked());
>      arm_cpu_update_virq(cpu);
>      arm_cpu_update_vfiq(cpu);
>      arm_cpu_update_vserr(cpu);
> @@ -11344,7 +11344,7 @@ void arm_cpu_do_interrupt(CPUState *cs)
>       * BQL needs to be held for any modification of
>       * cs->interrupt_request.
>       */
> -    g_assert(qemu_mutex_iothread_locked());
> +    g_assert(bql_locked());
>
>      arm_call_pre_el_change_hook(cpu);
>
> diff --git a/target/arm/hvf/hvf.c b/target/arm/hvf/hvf.c
> index 757e13b0f9..f8dffb815f 100644
> --- a/target/arm/hvf/hvf.c
> +++ b/target/arm/hvf/hvf.c
> @@ -1718,9 +1718,9 @@ static void hvf_wait_for_ipi(CPUState *cpu, struct
> timespec *ts)
>       * sleeping.
>       */
>      qatomic_set_mb(&cpu->thread_kicked, false);
> -    qemu_mutex_unlock_iothread();
> +    bql_unlock();
>      pselect(0, 0, 0, 0, ts, &cpu->accel->unblock_ipi_mask);
> -    qemu_mutex_lock_iothread();
> +    bql_lock();
>  }
>
>  static void hvf_wfi(CPUState *cpu)
> @@ -1821,7 +1821,7 @@ int hvf_vcpu_exec(CPUState *cpu)
>
>      flush_cpu_state(cpu);
>
> -    qemu_mutex_unlock_iothread();
> +    bql_unlock();
>      assert_hvf_ok(hv_vcpu_run(cpu->accel->fd));
>
>      /* handle VMEXIT */
> @@ -1830,7 +1830,7 @@ int hvf_vcpu_exec(CPUState *cpu)
>      uint32_t ec =3D syn_get_ec(syndrome);
>
>      ret =3D 0;
> -    qemu_mutex_lock_iothread();
> +    bql_lock();
>      switch (exit_reason) {
>      case HV_EXIT_REASON_EXCEPTION:
>          /* This is the main one, handle below. */
> diff --git a/target/arm/kvm.c b/target/arm/kvm.c
> index 7903e2ddde..dcfe3d48ab 100644
> --- a/target/arm/kvm.c
> +++ b/target/arm/kvm.c
> @@ -833,7 +833,7 @@ MemTxAttrs kvm_arch_post_run(CPUState *cs, struct
> kvm_run *run)
>      if (run->s.regs.device_irq_level !=3D cpu->device_irq_level) {
>          switched_level =3D cpu->device_irq_level ^
> run->s.regs.device_irq_level;
>
> -        qemu_mutex_lock_iothread();
> +        bql_lock();
>
>          if (switched_level & KVM_ARM_DEV_EL1_VTIMER) {
>              qemu_set_irq(cpu->gt_timer_outputs[GTIMER_VIRT],
> @@ -862,7 +862,7 @@ MemTxAttrs kvm_arch_post_run(CPUState *cs, struct
> kvm_run *run)
>
>          /* We also mark unknown levels as processed to not waste cycles =
*/
>          cpu->device_irq_level =3D run->s.regs.device_irq_level;
> -        qemu_mutex_unlock_iothread();
> +        bql_unlock();
>      }
>
>      return MEMTXATTRS_UNSPECIFIED;
> diff --git a/target/arm/kvm64.c b/target/arm/kvm64.c
> index 3c175c93a7..498d77b8cf 100644
> --- a/target/arm/kvm64.c
> +++ b/target/arm/kvm64.c
> @@ -1233,9 +1233,9 @@ bool kvm_arm_handle_debug(CPUState *cs, struct
> kvm_debug_exit_arch *debug_exit)
>      env->exception.syndrome =3D debug_exit->hsr;
>      env->exception.vaddress =3D debug_exit->far;
>      env->exception.target_el =3D 1;
> -    qemu_mutex_lock_iothread();
> +    bql_lock();
>      arm_cpu_do_interrupt(cs);
> -    qemu_mutex_unlock_iothread();
> +    bql_unlock();
>
>      return false;
>  }
> diff --git a/target/arm/ptw.c b/target/arm/ptw.c
> index 1762b058ae..0ecd3a36da 100644
> --- a/target/arm/ptw.c
> +++ b/target/arm/ptw.c
> @@ -772,9 +772,9 @@ static uint64_t arm_casq_ptw(CPUARMState *env,
> uint64_t old_val,
>  #if !TCG_OVERSIZED_GUEST
>  # error "Unexpected configuration"
>  #endif
> -    bool locked =3D qemu_mutex_iothread_locked();
> +    bool locked =3D bql_locked();
>      if (!locked) {
> -       qemu_mutex_lock_iothread();
> +        bql_lock();
>      }
>      if (ptw->out_be) {
>          cur_val =3D ldq_be_p(host);
> @@ -788,7 +788,7 @@ static uint64_t arm_casq_ptw(CPUARMState *env,
> uint64_t old_val,
>          }
>      }
>      if (!locked) {
> -        qemu_mutex_unlock_iothread();
> +        bql_unlock();
>      }
>  #endif
>
> diff --git a/target/arm/tcg/helper-a64.c b/target/arm/tcg/helper-a64.c
> index 8ad84623d3..198b975f20 100644
> --- a/target/arm/tcg/helper-a64.c
> +++ b/target/arm/tcg/helper-a64.c
> @@ -809,9 +809,9 @@ void HELPER(exception_return)(CPUARMState *env,
> uint64_t new_pc)
>          goto illegal_return;
>      }
>
> -    qemu_mutex_lock_iothread();
> +    bql_lock();
>      arm_call_pre_el_change_hook(env_archcpu(env));
> -    qemu_mutex_unlock_iothread();
> +    bql_unlock();
>
>      if (!return_to_aa64) {
>          env->aarch64 =3D false;
> @@ -876,9 +876,9 @@ void HELPER(exception_return)(CPUARMState *env,
> uint64_t new_pc)
>       */
>      aarch64_sve_change_el(env, cur_el, new_el, return_to_aa64);
>
> -    qemu_mutex_lock_iothread();
> +    bql_lock();
>      arm_call_el_change_hook(env_archcpu(env));
> -    qemu_mutex_unlock_iothread();
> +    bql_unlock();
>
>      return;
>
> diff --git a/target/arm/tcg/m_helper.c b/target/arm/tcg/m_helper.c
> index a26adb75aa..d1f1e02acc 100644
> --- a/target/arm/tcg/m_helper.c
> +++ b/target/arm/tcg/m_helper.c
> @@ -373,8 +373,8 @@ void HELPER(v7m_preserve_fp_state)(CPUARMState *env)
>      bool ts =3D is_secure && (env->v7m.fpccr[M_REG_S] &
> R_V7M_FPCCR_TS_MASK);
>      bool take_exception;
>
> -    /* Take the iothread lock as we are going to touch the NVIC */
> -    qemu_mutex_lock_iothread();
> +    /* Take the BQL as we are going to touch the NVIC */
> +    bql_lock();
>
>      /* Check the background context had access to the FPU */
>      if (!v7m_cpacr_pass(env, is_secure, is_priv)) {
> @@ -428,7 +428,7 @@ void HELPER(v7m_preserve_fp_state)(CPUARMState *env)
>      take_exception =3D !stacked_ok &&
>          armv7m_nvic_can_take_pending_exception(env->nvic);
>
> -    qemu_mutex_unlock_iothread();
> +    bql_unlock();
>
>      if (take_exception) {
>          raise_exception_ra(env, EXCP_LAZYFP, 0, 1, GETPC());
> diff --git a/target/arm/tcg/op_helper.c b/target/arm/tcg/op_helper.c
> index ea08936a85..34e706e0fd 100644
> --- a/target/arm/tcg/op_helper.c
> +++ b/target/arm/tcg/op_helper.c
> @@ -427,9 +427,9 @@ void HELPER(cpsr_write_eret)(CPUARMState *env,
> uint32_t val)
>  {
>      uint32_t mask;
>
> -    qemu_mutex_lock_iothread();
> +    bql_lock();
>      arm_call_pre_el_change_hook(env_archcpu(env));
> -    qemu_mutex_unlock_iothread();
> +    bql_unlock();
>
>      mask =3D aarch32_cpsr_valid_mask(env->features,
> &env_archcpu(env)->isar);
>      cpsr_write(env, val, mask, CPSRWriteExceptionReturn);
> @@ -442,9 +442,9 @@ void HELPER(cpsr_write_eret)(CPUARMState *env,
> uint32_t val)
>      env->regs[15] &=3D (env->thumb ? ~1 : ~3);
>      arm_rebuild_hflags(env);
>
> -    qemu_mutex_lock_iothread();
> +    bql_lock();
>      arm_call_el_change_hook(env_archcpu(env));
> -    qemu_mutex_unlock_iothread();
> +    bql_unlock();
>  }
>
>  /* Access to user mode registers from privileged modes.  */
> @@ -803,9 +803,9 @@ void HELPER(set_cp_reg)(CPUARMState *env, const void
> *rip, uint32_t value)
>      const ARMCPRegInfo *ri =3D rip;
>
>      if (ri->type & ARM_CP_IO) {
> -        qemu_mutex_lock_iothread();
> +        bql_lock();
>          ri->writefn(env, ri, value);
> -        qemu_mutex_unlock_iothread();
> +        bql_unlock();
>      } else {
>          ri->writefn(env, ri, value);
>      }
> @@ -817,9 +817,9 @@ uint32_t HELPER(get_cp_reg)(CPUARMState *env, const
> void *rip)
>      uint32_t res;
>
>      if (ri->type & ARM_CP_IO) {
> -        qemu_mutex_lock_iothread();
> +        bql_lock();
>          res =3D ri->readfn(env, ri);
> -        qemu_mutex_unlock_iothread();
> +        bql_unlock();
>      } else {
>          res =3D ri->readfn(env, ri);
>      }
> @@ -832,9 +832,9 @@ void HELPER(set_cp_reg64)(CPUARMState *env, const voi=
d
> *rip, uint64_t value)
>      const ARMCPRegInfo *ri =3D rip;
>
>      if (ri->type & ARM_CP_IO) {
> -        qemu_mutex_lock_iothread();
> +        bql_lock();
>          ri->writefn(env, ri, value);
> -        qemu_mutex_unlock_iothread();
> +        bql_unlock();
>      } else {
>          ri->writefn(env, ri, value);
>      }
> @@ -846,9 +846,9 @@ uint64_t HELPER(get_cp_reg64)(CPUARMState *env, const
> void *rip)
>      uint64_t res;
>
>      if (ri->type & ARM_CP_IO) {
> -        qemu_mutex_lock_iothread();
> +        bql_lock();
>          res =3D ri->readfn(env, ri);
> -        qemu_mutex_unlock_iothread();
> +        bql_unlock();
>      } else {
>          res =3D ri->readfn(env, ri);
>      }
> diff --git a/target/arm/tcg/psci.c b/target/arm/tcg/psci.c
> index 6c1239bb96..9080a91d9c 100644
> --- a/target/arm/tcg/psci.c
> +++ b/target/arm/tcg/psci.c
> @@ -107,7 +107,7 @@ void arm_handle_psci_call(ARMCPU *cpu)
>              }
>              target_cpu =3D ARM_CPU(target_cpu_state);
>
> -            g_assert(qemu_mutex_iothread_locked());
> +            g_assert(bql_locked());
>              ret =3D target_cpu->power_state;
>              break;
>          default:
> diff --git a/target/hppa/int_helper.c b/target/hppa/int_helper.c
> index 98e9d688f6..efe638b36e 100644
> --- a/target/hppa/int_helper.c
> +++ b/target/hppa/int_helper.c
> @@ -84,17 +84,17 @@ void hppa_cpu_alarm_timer(void *opaque)
>  void HELPER(write_eirr)(CPUHPPAState *env, target_ulong val)
>  {
>      env->cr[CR_EIRR] &=3D ~val;
> -    qemu_mutex_lock_iothread();
> +    bql_lock();
>      eval_interrupt(env_archcpu(env));
> -    qemu_mutex_unlock_iothread();
> +    bql_unlock();
>  }
>
>  void HELPER(write_eiem)(CPUHPPAState *env, target_ulong val)
>  {
>      env->cr[CR_EIEM] =3D val;
> -    qemu_mutex_lock_iothread();
> +    bql_lock();
>      eval_interrupt(env_archcpu(env));
> -    qemu_mutex_unlock_iothread();
> +    bql_unlock();
>  }
>
>  void hppa_cpu_do_interrupt(CPUState *cs)
> diff --git a/target/i386/hvf/hvf.c b/target/i386/hvf/hvf.c
> index 20b9ca3ef5..11ffdd4c69 100644
> --- a/target/i386/hvf/hvf.c
> +++ b/target/i386/hvf/hvf.c
> @@ -429,9 +429,9 @@ int hvf_vcpu_exec(CPUState *cpu)
>          }
>          vmx_update_tpr(cpu);
>
> -        qemu_mutex_unlock_iothread();
> +        bql_unlock();
>          if (!cpu_is_bsp(X86_CPU(cpu)) && cpu->halted) {
> -            qemu_mutex_lock_iothread();
> +            bql_lock();
>              return EXCP_HLT;
>          }
>
> @@ -450,7 +450,7 @@ int hvf_vcpu_exec(CPUState *cpu)
>          rip =3D rreg(cpu->accel->fd, HV_X86_RIP);
>          env->eflags =3D rreg(cpu->accel->fd, HV_X86_RFLAGS);
>
> -        qemu_mutex_lock_iothread();
> +        bql_lock();
>
>          update_apic_tpr(cpu);
>          current_cpu =3D cpu;
> diff --git a/target/i386/kvm/hyperv.c b/target/i386/kvm/hyperv.c
> index e3ac978648..6825c89af3 100644
> --- a/target/i386/kvm/hyperv.c
> +++ b/target/i386/kvm/hyperv.c
> @@ -45,9 +45,9 @@ void hyperv_x86_synic_update(X86CPU *cpu)
>
>  static void async_synic_update(CPUState *cs, run_on_cpu_data data)
>  {
> -    qemu_mutex_lock_iothread();
> +    bql_lock();
>      hyperv_x86_synic_update(X86_CPU(cs));
> -    qemu_mutex_unlock_iothread();
> +    bql_unlock();
>  }
>
>  int kvm_hv_handle_exit(X86CPU *cpu, struct kvm_hyperv_exit *exit)
> diff --git a/target/i386/kvm/kvm.c b/target/i386/kvm/kvm.c
> index 4ce80555b4..76a66246eb 100644
> --- a/target/i386/kvm/kvm.c
> +++ b/target/i386/kvm/kvm.c
> @@ -4713,9 +4713,9 @@ void kvm_arch_pre_run(CPUState *cpu, struct kvm_run
> *run)
>      /* Inject NMI */
>      if (cpu->interrupt_request & (CPU_INTERRUPT_NMI | CPU_INTERRUPT_SMI)=
)
> {
>          if (cpu->interrupt_request & CPU_INTERRUPT_NMI) {
> -            qemu_mutex_lock_iothread();
> +            bql_lock();
>              cpu->interrupt_request &=3D ~CPU_INTERRUPT_NMI;
> -            qemu_mutex_unlock_iothread();
> +            bql_unlock();
>              DPRINTF("injected NMI\n");
>              ret =3D kvm_vcpu_ioctl(cpu, KVM_NMI);
>              if (ret < 0) {
> @@ -4724,9 +4724,9 @@ void kvm_arch_pre_run(CPUState *cpu, struct kvm_run
> *run)
>              }
>          }
>          if (cpu->interrupt_request & CPU_INTERRUPT_SMI) {
> -            qemu_mutex_lock_iothread();
> +            bql_lock();
>              cpu->interrupt_request &=3D ~CPU_INTERRUPT_SMI;
> -            qemu_mutex_unlock_iothread();
> +            bql_unlock();
>              DPRINTF("injected SMI\n");
>              ret =3D kvm_vcpu_ioctl(cpu, KVM_SMI);
>              if (ret < 0) {
> @@ -4737,7 +4737,7 @@ void kvm_arch_pre_run(CPUState *cpu, struct kvm_run
> *run)
>      }
>
>      if (!kvm_pic_in_kernel()) {
> -        qemu_mutex_lock_iothread();
> +        bql_lock();
>      }
>
>      /* Force the VCPU out of its inner loop to process any INIT requests
> @@ -4790,7 +4790,7 @@ void kvm_arch_pre_run(CPUState *cpu, struct kvm_run
> *run)
>          DPRINTF("setting tpr\n");
>          run->cr8 =3D cpu_get_apic_tpr(x86_cpu->apic_state);
>
> -        qemu_mutex_unlock_iothread();
> +        bql_unlock();
>      }
>  }
>
> @@ -4838,12 +4838,12 @@ MemTxAttrs kvm_arch_post_run(CPUState *cpu, struc=
t
> kvm_run *run)
>      /* We need to protect the apic state against concurrent accesses fro=
m
>       * different threads in case the userspace irqchip is used. */
>      if (!kvm_irqchip_in_kernel()) {
> -        qemu_mutex_lock_iothread();
> +        bql_lock();
>      }
>      cpu_set_apic_tpr(x86_cpu->apic_state, run->cr8);
>      cpu_set_apic_base(x86_cpu->apic_state, run->apic_base);
>      if (!kvm_irqchip_in_kernel()) {
> -        qemu_mutex_unlock_iothread();
> +        bql_unlock();
>      }
>      return cpu_get_mem_attrs(env);
>  }
> @@ -5277,17 +5277,17 @@ int kvm_arch_handle_exit(CPUState *cs, struct
> kvm_run *run)
>      switch (run->exit_reason) {
>      case KVM_EXIT_HLT:
>          DPRINTF("handle_hlt\n");
> -        qemu_mutex_lock_iothread();
> +        bql_lock();
>          ret =3D kvm_handle_halt(cpu);
> -        qemu_mutex_unlock_iothread();
> +        bql_unlock();
>          break;
>      case KVM_EXIT_SET_TPR:
>          ret =3D 0;
>          break;
>      case KVM_EXIT_TPR_ACCESS:
> -        qemu_mutex_lock_iothread();
> +        bql_lock();
>          ret =3D kvm_handle_tpr_access(cpu);
> -        qemu_mutex_unlock_iothread();
> +        bql_unlock();
>          break;
>      case KVM_EXIT_FAIL_ENTRY:
>          code =3D run->fail_entry.hardware_entry_failure_reason;
> @@ -5313,9 +5313,9 @@ int kvm_arch_handle_exit(CPUState *cs, struct
> kvm_run *run)
>          break;
>      case KVM_EXIT_DEBUG:
>          DPRINTF("kvm_exit_debug\n");
> -        qemu_mutex_lock_iothread();
> +        bql_lock();
>          ret =3D kvm_handle_debug(cpu, &run->debug.arch);
> -        qemu_mutex_unlock_iothread();
> +        bql_unlock();
>          break;
>      case KVM_EXIT_HYPERV:
>          ret =3D kvm_hv_handle_exit(cpu, &run->hyperv);
> diff --git a/target/i386/kvm/xen-emu.c b/target/i386/kvm/xen-emu.c
> index c0631f9cf4..b0ed2e6aeb 100644
> --- a/target/i386/kvm/xen-emu.c
> +++ b/target/i386/kvm/xen-emu.c
> @@ -403,7 +403,7 @@ void kvm_xen_maybe_deassert_callback(CPUState *cs)
>
>      /* If the evtchn_upcall_pending flag is cleared, turn the GSI off. *=
/
>      if (!vi->evtchn_upcall_pending) {
> -        qemu_mutex_lock_iothread();
> +        bql_lock();
>          /*
>           * Check again now we have the lock, because it may have been
>           * asserted in the interim. And we don't want to take the lock
> @@ -413,7 +413,7 @@ void kvm_xen_maybe_deassert_callback(CPUState *cs)
>              X86_CPU(cs)->env.xen_callback_asserted =3D false;
>              xen_evtchn_set_callback_level(0);
>          }
> -        qemu_mutex_unlock_iothread();
> +        bql_unlock();
>      }
>  }
>
> @@ -773,9 +773,9 @@ static bool handle_set_param(struct kvm_xen_exit
> *exit, X86CPU *cpu,
>
>      switch (hp.index) {
>      case HVM_PARAM_CALLBACK_IRQ:
> -        qemu_mutex_lock_iothread();
> +        bql_lock();
>          err =3D xen_evtchn_set_callback_param(hp.value);
> -        qemu_mutex_unlock_iothread();
> +        bql_unlock();
>          xen_set_long_mode(exit->u.hcall.longmode);
>          break;
>      default:
> @@ -1408,7 +1408,7 @@ int kvm_xen_soft_reset(void)
>      CPUState *cpu;
>      int err;
>
> -    assert(qemu_mutex_iothread_locked());
> +    assert(bql_locked());
>
>      trace_kvm_xen_soft_reset();
>
> @@ -1481,9 +1481,9 @@ static int schedop_shutdown(CPUState *cs, uint64_t
> arg)
>          break;
>
>      case SHUTDOWN_soft_reset:
> -        qemu_mutex_lock_iothread();
> +        bql_lock();
>          ret =3D kvm_xen_soft_reset();
> -        qemu_mutex_unlock_iothread();
> +        bql_unlock();
>          break;
>
>      default:
> diff --git a/target/i386/nvmm/nvmm-accel-ops.c
> b/target/i386/nvmm/nvmm-accel-ops.c
> index 6c46101ac1..f9d5e9a37a 100644
> --- a/target/i386/nvmm/nvmm-accel-ops.c
> +++ b/target/i386/nvmm/nvmm-accel-ops.c
> @@ -25,7 +25,7 @@ static void *qemu_nvmm_cpu_thread_fn(void *arg)
>
>      rcu_register_thread();
>
> -    qemu_mutex_lock_iothread();
> +    bql_lock();
>      qemu_thread_get_self(cpu->thread);
>      cpu->thread_id =3D qemu_get_thread_id();
>      current_cpu =3D cpu;
> @@ -55,7 +55,7 @@ static void *qemu_nvmm_cpu_thread_fn(void *arg)
>
>      nvmm_destroy_vcpu(cpu);
>      cpu_thread_signal_destroyed(cpu);
> -    qemu_mutex_unlock_iothread();
> +    bql_unlock();
>      rcu_unregister_thread();
>      return NULL;
>  }
> diff --git a/target/i386/nvmm/nvmm-all.c b/target/i386/nvmm/nvmm-all.c
> index 7d752bc5e0..cfdca91123 100644
> --- a/target/i386/nvmm/nvmm-all.c
> +++ b/target/i386/nvmm/nvmm-all.c
> @@ -399,7 +399,7 @@ nvmm_vcpu_pre_run(CPUState *cpu)
>      uint8_t tpr;
>      int ret;
>
> -    qemu_mutex_lock_iothread();
> +    bql_lock();
>
>      tpr =3D cpu_get_apic_tpr(x86_cpu->apic_state);
>      if (tpr !=3D qcpu->tpr) {
> @@ -462,7 +462,7 @@ nvmm_vcpu_pre_run(CPUState *cpu)
>          }
>      }
>
> -    qemu_mutex_unlock_iothread();
> +    bql_unlock();
>  }
>
>  /*
> @@ -485,9 +485,9 @@ nvmm_vcpu_post_run(CPUState *cpu, struct
> nvmm_vcpu_exit *exit)
>      tpr =3D exit->exitstate.cr8;
>      if (qcpu->tpr !=3D tpr) {
>          qcpu->tpr =3D tpr;
> -        qemu_mutex_lock_iothread();
> +        bql_lock();
>          cpu_set_apic_tpr(x86_cpu->apic_state, qcpu->tpr);
> -        qemu_mutex_unlock_iothread();
> +        bql_unlock();
>      }
>  }
>
> @@ -648,7 +648,7 @@ nvmm_handle_halted(struct nvmm_machine *mach, CPUStat=
e
> *cpu,
>      CPUX86State *env =3D cpu_env(cpu);
>      int ret =3D 0;
>
> -    qemu_mutex_lock_iothread();
> +    bql_lock();
>
>      if (!((cpu->interrupt_request & CPU_INTERRUPT_HARD) &&
>            (env->eflags & IF_MASK)) &&
> @@ -658,7 +658,7 @@ nvmm_handle_halted(struct nvmm_machine *mach, CPUStat=
e
> *cpu,
>          ret =3D 1;
>      }
>
> -    qemu_mutex_unlock_iothread();
> +    bql_unlock();
>
>      return ret;
>  }
> @@ -721,7 +721,7 @@ nvmm_vcpu_loop(CPUState *cpu)
>          return 0;
>      }
>
> -    qemu_mutex_unlock_iothread();
> +    bql_unlock();
>      cpu_exec_start(cpu);
>
>      /*
> @@ -806,16 +806,16 @@ nvmm_vcpu_loop(CPUState *cpu)
>              error_report("NVMM: Unexpected VM exit code 0x%lx [hw=3D0x%l=
x]",
>                  exit->reason, exit->u.inv.hwcode);
>              nvmm_get_registers(cpu);
> -            qemu_mutex_lock_iothread();
> +            bql_lock();
>              qemu_system_guest_panicked(cpu_get_crash_info(cpu));
> -            qemu_mutex_unlock_iothread();
> +            bql_unlock();
>              ret =3D -1;
>              break;
>          }
>      } while (ret =3D=3D 0);
>
>      cpu_exec_end(cpu);
> -    qemu_mutex_lock_iothread();
> +    bql_lock();
>
>      qatomic_set(&cpu->exit_request, false);
>
> diff --git a/target/i386/tcg/sysemu/fpu_helper.c
> b/target/i386/tcg/sysemu/fpu_helper.c
> index 93506cdd94..e0305ba234 100644
> --- a/target/i386/tcg/sysemu/fpu_helper.c
> +++ b/target/i386/tcg/sysemu/fpu_helper.c
> @@ -32,9 +32,9 @@ void x86_register_ferr_irq(qemu_irq irq)
>  void fpu_check_raise_ferr_irq(CPUX86State *env)
>  {
>      if (ferr_irq && !(env->hflags2 & HF2_IGNNE_MASK)) {
> -        qemu_mutex_lock_iothread();
> +        bql_lock();
>          qemu_irq_raise(ferr_irq);
> -        qemu_mutex_unlock_iothread();
> +        bql_unlock();
>          return;
>      }
>  }
> @@ -49,7 +49,7 @@ void cpu_set_ignne(void)
>  {
>      CPUX86State *env =3D &X86_CPU(first_cpu)->env;
>
> -    assert(qemu_mutex_iothread_locked());
> +    assert(bql_locked());
>
>      env->hflags2 |=3D HF2_IGNNE_MASK;
>      /*
> diff --git a/target/i386/tcg/sysemu/misc_helper.c
> b/target/i386/tcg/sysemu/misc_helper.c
> index e1528b7f80..1ddfc9fe09 100644
> --- a/target/i386/tcg/sysemu/misc_helper.c
> +++ b/target/i386/tcg/sysemu/misc_helper.c
> @@ -118,9 +118,9 @@ void helper_write_crN(CPUX86State *env, int reg,
> target_ulong t0)
>          break;
>      case 8:
>          if (!(env->hflags2 & HF2_VINTR_MASK)) {
> -            qemu_mutex_lock_iothread();
> +            bql_lock();
>              cpu_set_apic_tpr(env_archcpu(env)->apic_state, t0);
> -            qemu_mutex_unlock_iothread();
> +            bql_unlock();
>          }
>          env->int_ctl =3D (env->int_ctl & ~V_TPR_MASK) | (t0 & V_TPR_MASK=
);
>
> diff --git a/target/i386/whpx/whpx-accel-ops.c
> b/target/i386/whpx/whpx-accel-ops.c
> index 67cad86720..e783a760a7 100644
> --- a/target/i386/whpx/whpx-accel-ops.c
> +++ b/target/i386/whpx/whpx-accel-ops.c
> @@ -25,7 +25,7 @@ static void *whpx_cpu_thread_fn(void *arg)
>
>      rcu_register_thread();
>
> -    qemu_mutex_lock_iothread();
> +    bql_lock();
>      qemu_thread_get_self(cpu->thread);
>      cpu->thread_id =3D qemu_get_thread_id();
>      current_cpu =3D cpu;
> @@ -55,7 +55,7 @@ static void *whpx_cpu_thread_fn(void *arg)
>
>      whpx_destroy_vcpu(cpu);
>      cpu_thread_signal_destroyed(cpu);
> -    qemu_mutex_unlock_iothread();
> +    bql_unlock();
>      rcu_unregister_thread();
>      return NULL;
>  }
> diff --git a/target/i386/whpx/whpx-all.c b/target/i386/whpx/whpx-all.c
> index d29ba916a0..a7262654ac 100644
> --- a/target/i386/whpx/whpx-all.c
> +++ b/target/i386/whpx/whpx-all.c
> @@ -1324,7 +1324,7 @@ static int whpx_first_vcpu_starting(CPUState *cpu)
>      struct whpx_state *whpx =3D &whpx_global;
>      HRESULT hr;
>
> -    g_assert(qemu_mutex_iothread_locked());
> +    g_assert(bql_locked());
>
>      if (!QTAILQ_EMPTY(&cpu->breakpoints) ||
>              (whpx->breakpoints.breakpoints &&
> @@ -1442,7 +1442,7 @@ static int whpx_handle_halt(CPUState *cpu)
>      CPUX86State *env =3D cpu_env(cpu);
>      int ret =3D 0;
>
> -    qemu_mutex_lock_iothread();
> +    bql_lock();
>      if (!((cpu->interrupt_request & CPU_INTERRUPT_HARD) &&
>            (env->eflags & IF_MASK)) &&
>          !(cpu->interrupt_request & CPU_INTERRUPT_NMI)) {
> @@ -1450,7 +1450,7 @@ static int whpx_handle_halt(CPUState *cpu)
>          cpu->halted =3D true;
>          ret =3D 1;
>      }
> -    qemu_mutex_unlock_iothread();
> +    bql_unlock();
>
>      return ret;
>  }
> @@ -1472,7 +1472,7 @@ static void whpx_vcpu_pre_run(CPUState *cpu)
>      memset(&new_int, 0, sizeof(new_int));
>      memset(reg_values, 0, sizeof(reg_values));
>
> -    qemu_mutex_lock_iothread();
> +    bql_lock();
>
>      /* Inject NMI */
>      if (!vcpu->interruption_pending &&
> @@ -1563,7 +1563,7 @@ static void whpx_vcpu_pre_run(CPUState *cpu)
>          reg_count +=3D 1;
>      }
>
> -    qemu_mutex_unlock_iothread();
> +    bql_unlock();
>      vcpu->ready_for_pic_interrupt =3D false;
>
>      if (reg_count) {
> @@ -1590,9 +1590,9 @@ static void whpx_vcpu_post_run(CPUState *cpu)
>      uint64_t tpr =3D vcpu->exit_ctx.VpContext.Cr8;
>      if (vcpu->tpr !=3D tpr) {
>          vcpu->tpr =3D tpr;
> -        qemu_mutex_lock_iothread();
> +        bql_lock();
>          cpu_set_apic_tpr(x86_cpu->apic_state,
> whpx_cr8_to_apic_tpr(vcpu->tpr));
> -        qemu_mutex_unlock_iothread();
> +        bql_unlock();
>      }
>
>      vcpu->interruption_pending =3D
> @@ -1652,7 +1652,7 @@ static int whpx_vcpu_run(CPUState *cpu)
>      WhpxStepMode exclusive_step_mode =3D WHPX_STEP_NONE;
>      int ret;
>
> -    g_assert(qemu_mutex_iothread_locked());
> +    g_assert(bql_locked());
>
>      if (whpx->running_cpus++ =3D=3D 0) {
>          /* Insert breakpoints into memory, update exception exit bitmap.
> */
> @@ -1690,7 +1690,7 @@ static int whpx_vcpu_run(CPUState *cpu)
>          }
>      }
>
> -    qemu_mutex_unlock_iothread();
> +    bql_unlock();
>
>      if (exclusive_step_mode !=3D WHPX_STEP_NONE) {
>          start_exclusive();
> @@ -2028,9 +2028,9 @@ static int whpx_vcpu_run(CPUState *cpu)
>              error_report("WHPX: Unexpected VP exit code %d",
>                           vcpu->exit_ctx.ExitReason);
>              whpx_get_registers(cpu);
> -            qemu_mutex_lock_iothread();
> +            bql_lock();
>              qemu_system_guest_panicked(cpu_get_crash_info(cpu));
> -            qemu_mutex_unlock_iothread();
> +            bql_unlock();
>              break;
>          }
>
> @@ -2055,7 +2055,7 @@ static int whpx_vcpu_run(CPUState *cpu)
>          cpu_exec_end(cpu);
>      }
>
> -    qemu_mutex_lock_iothread();
> +    bql_lock();
>      current_cpu =3D cpu;
>
>      if (--whpx->running_cpus =3D=3D 0) {
> diff --git a/target/loongarch/csr_helper.c b/target/loongarch/csr_helper.=
c
> index 55341551a5..15f94caefa 100644
> --- a/target/loongarch/csr_helper.c
> +++ b/target/loongarch/csr_helper.c
> @@ -89,9 +89,9 @@ target_ulong helper_csrwr_ticlr(CPULoongArchState *env,
> target_ulong val)
>      int64_t old_v =3D 0;
>
>      if (val & 0x1) {
> -        qemu_mutex_lock_iothread();
> +        bql_lock();
>          loongarch_cpu_set_irq(cpu, IRQ_TIMER, 0);
> -        qemu_mutex_unlock_iothread();
> +        bql_unlock();
>      }
>      return old_v;
>  }
> diff --git a/target/mips/kvm.c b/target/mips/kvm.c
> index e22e24ed97..15d0cf9adb 100644
> --- a/target/mips/kvm.c
> +++ b/target/mips/kvm.c
> @@ -138,7 +138,7 @@ void kvm_arch_pre_run(CPUState *cs, struct kvm_run
> *run)
>      int r;
>      struct kvm_mips_interrupt intr;
>
> -    qemu_mutex_lock_iothread();
> +    bql_lock();
>
>      if ((cs->interrupt_request & CPU_INTERRUPT_HARD) &&
>              cpu_mips_io_interrupts_pending(cpu)) {
> @@ -151,7 +151,7 @@ void kvm_arch_pre_run(CPUState *cs, struct kvm_run
> *run)
>          }
>      }
>
> -    qemu_mutex_unlock_iothread();
> +    bql_unlock();
>  }
>
>  MemTxAttrs kvm_arch_post_run(CPUState *cs, struct kvm_run *run)
> diff --git a/target/mips/tcg/sysemu/cp0_helper.c
> b/target/mips/tcg/sysemu/cp0_helper.c
> index d349548743..cc545aed9c 100644
> --- a/target/mips/tcg/sysemu/cp0_helper.c
> +++ b/target/mips/tcg/sysemu/cp0_helper.c
> @@ -59,9 +59,9 @@ static inline void mips_vpe_wake(MIPSCPU *c)
>       * because there might be other conditions that state that c should
>       * be sleeping.
>       */
> -    qemu_mutex_lock_iothread();
> +    bql_lock();
>      cpu_interrupt(CPU(c), CPU_INTERRUPT_WAKE);
> -    qemu_mutex_unlock_iothread();
> +    bql_unlock();
>  }
>
>  static inline void mips_vpe_sleep(MIPSCPU *cpu)
> diff --git a/target/openrisc/sys_helper.c b/target/openrisc/sys_helper.c
> index 782a5751b7..77567afba4 100644
> --- a/target/openrisc/sys_helper.c
> +++ b/target/openrisc/sys_helper.c
> @@ -160,20 +160,20 @@ void HELPER(mtspr)(CPUOpenRISCState *env,
> target_ulong spr, target_ulong rb)
>          break;
>      case TO_SPR(9, 0):  /* PICMR */
>          env->picmr =3D rb;
> -        qemu_mutex_lock_iothread();
> +        bql_lock();
>          if (env->picsr & env->picmr) {
>              cpu_interrupt(cs, CPU_INTERRUPT_HARD);
>          } else {
>              cpu_reset_interrupt(cs, CPU_INTERRUPT_HARD);
>          }
> -        qemu_mutex_unlock_iothread();
> +        bql_unlock();
>          break;
>      case TO_SPR(9, 2):  /* PICSR */
>          env->picsr &=3D ~rb;
>          break;
>      case TO_SPR(10, 0): /* TTMR */
>          {
> -            qemu_mutex_lock_iothread();
> +            bql_lock();
>              if ((env->ttmr & TTMR_M) ^ (rb & TTMR_M)) {
>                  switch (rb & TTMR_M) {
>                  case TIMER_NONE:
> @@ -198,15 +198,15 @@ void HELPER(mtspr)(CPUOpenRISCState *env,
> target_ulong spr, target_ulong rb)
>                  cs->interrupt_request &=3D ~CPU_INTERRUPT_TIMER;
>              }
>              cpu_openrisc_timer_update(cpu);
> -            qemu_mutex_unlock_iothread();
> +            bql_unlock();
>          }
>          break;
>
>      case TO_SPR(10, 1): /* TTCR */
> -        qemu_mutex_lock_iothread();
> +        bql_lock();
>          cpu_openrisc_count_set(cpu, rb);
>          cpu_openrisc_timer_update(cpu);
> -        qemu_mutex_unlock_iothread();
> +        bql_unlock();
>          break;
>      }
>  #endif
> @@ -347,9 +347,9 @@ target_ulong HELPER(mfspr)(CPUOpenRISCState *env,
> target_ulong rd,
>          return env->ttmr;
>
>      case TO_SPR(10, 1): /* TTCR */
> -        qemu_mutex_lock_iothread();
> +        bql_lock();
>          cpu_openrisc_count_update(cpu);
> -        qemu_mutex_unlock_iothread();
> +        bql_unlock();
>          return cpu_openrisc_count_get(cpu);
>      }
>  #endif
> diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c
> index a42743a3e0..8a2bfb5aa2 100644
> --- a/target/ppc/excp_helper.c
> +++ b/target/ppc/excp_helper.c
> @@ -3056,7 +3056,7 @@ void helper_msgsnd(target_ulong rb)
>          return;
>      }
>
> -    qemu_mutex_lock_iothread();
> +    bql_lock();
>      CPU_FOREACH(cs) {
>          PowerPCCPU *cpu =3D POWERPC_CPU(cs);
>          CPUPPCState *cenv =3D &cpu->env;
> @@ -3065,7 +3065,7 @@ void helper_msgsnd(target_ulong rb)
>              ppc_set_irq(cpu, irq, 1);
>          }
>      }
> -    qemu_mutex_unlock_iothread();
> +    bql_unlock();
>  }
>
>  /* Server Processor Control */
> @@ -3093,7 +3093,7 @@ static void book3s_msgsnd_common(int pir, int irq)
>  {
>      CPUState *cs;
>
> -    qemu_mutex_lock_iothread();
> +    bql_lock();
>      CPU_FOREACH(cs) {
>          PowerPCCPU *cpu =3D POWERPC_CPU(cs);
>          CPUPPCState *cenv =3D &cpu->env;
> @@ -3103,7 +3103,7 @@ static void book3s_msgsnd_common(int pir, int irq)
>              ppc_set_irq(cpu, irq, 1);
>          }
>      }
> -    qemu_mutex_unlock_iothread();
> +    bql_unlock();
>  }
>
>  void helper_book3s_msgsnd(target_ulong rb)
> @@ -3157,14 +3157,14 @@ void helper_book3s_msgsndp(CPUPPCState *env,
> target_ulong rb)
>      }
>
>      /* Does iothread need to be locked for walking CPU list? */
> -    qemu_mutex_lock_iothread();
> +    bql_lock();
>      THREAD_SIBLING_FOREACH(cs, ccs) {
>          PowerPCCPU *ccpu =3D POWERPC_CPU(ccs);
>          uint32_t thread_id =3D ppc_cpu_tir(ccpu);
>
>          if (ttir =3D=3D thread_id) {
>              ppc_set_irq(ccpu, PPC_INTERRUPT_DOORBELL, 1);
> -            qemu_mutex_unlock_iothread();
> +            bql_unlock();
>              return;
>          }
>      }
> diff --git a/target/ppc/kvm.c b/target/ppc/kvm.c
> index 9b1abe2fc4..26fa9d0575 100644
> --- a/target/ppc/kvm.c
> +++ b/target/ppc/kvm.c
> @@ -1656,7 +1656,7 @@ int kvm_arch_handle_exit(CPUState *cs, struct
> kvm_run *run)
>      CPUPPCState *env =3D &cpu->env;
>      int ret;
>
> -    qemu_mutex_lock_iothread();
> +    bql_lock();
>
>      switch (run->exit_reason) {
>      case KVM_EXIT_DCR:
> @@ -1715,7 +1715,7 @@ int kvm_arch_handle_exit(CPUState *cs, struct
> kvm_run *run)
>          break;
>      }
>
> -    qemu_mutex_unlock_iothread();
> +    bql_unlock();
>      return ret;
>  }
>
> diff --git a/target/ppc/misc_helper.c b/target/ppc/misc_helper.c
> index a05bdf78c9..a9d41d2802 100644
> --- a/target/ppc/misc_helper.c
> +++ b/target/ppc/misc_helper.c
> @@ -238,7 +238,7 @@ target_ulong helper_load_dpdes(CPUPPCState *env)
>          return dpdes;
>      }
>
> -    qemu_mutex_lock_iothread();
> +    bql_lock();
>      THREAD_SIBLING_FOREACH(cs, ccs) {
>          PowerPCCPU *ccpu =3D POWERPC_CPU(ccs);
>          CPUPPCState *cenv =3D &ccpu->env;
> @@ -248,7 +248,7 @@ target_ulong helper_load_dpdes(CPUPPCState *env)
>              dpdes |=3D (0x1 << thread_id);
>          }
>      }
> -    qemu_mutex_unlock_iothread();
> +    bql_unlock();
>
>      return dpdes;
>  }
> @@ -278,14 +278,14 @@ void helper_store_dpdes(CPUPPCState *env,
> target_ulong val)
>      }
>
>      /* Does iothread need to be locked for walking CPU list? */
> -    qemu_mutex_lock_iothread();
> +    bql_lock();
>      THREAD_SIBLING_FOREACH(cs, ccs) {
>          PowerPCCPU *ccpu =3D POWERPC_CPU(ccs);
>          uint32_t thread_id =3D ppc_cpu_tir(ccpu);
>
>          ppc_set_irq(cpu, PPC_INTERRUPT_DOORBELL, val & (0x1 <<
> thread_id));
>      }
> -    qemu_mutex_unlock_iothread();
> +    bql_unlock();
>  }
>  #endif /* defined(TARGET_PPC64) */
>
> diff --git a/target/ppc/timebase_helper.c b/target/ppc/timebase_helper.c
> index 08a6b47ee0..f618ed2922 100644
> --- a/target/ppc/timebase_helper.c
> +++ b/target/ppc/timebase_helper.c
> @@ -173,9 +173,9 @@ target_ulong helper_load_dcr(CPUPPCState *env,
> target_ulong dcrn)
>      } else {
>          int ret;
>
> -        qemu_mutex_lock_iothread();
> +        bql_lock();
>          ret =3D ppc_dcr_read(env->dcr_env, (uint32_t)dcrn, &val);
> -        qemu_mutex_unlock_iothread();
> +        bql_unlock();
>          if (unlikely(ret !=3D 0)) {
>              qemu_log_mask(LOG_GUEST_ERROR, "DCR read error %d %03x\n",
>                            (uint32_t)dcrn, (uint32_t)dcrn);
> @@ -196,9 +196,9 @@ void helper_store_dcr(CPUPPCState *env, target_ulong
> dcrn, target_ulong val)
>                                 POWERPC_EXCP_INVAL_INVAL, GETPC());
>      } else {
>          int ret;
> -        qemu_mutex_lock_iothread();
> +        bql_lock();
>          ret =3D ppc_dcr_write(env->dcr_env, (uint32_t)dcrn, (uint32_t)va=
l);
> -        qemu_mutex_unlock_iothread();
> +        bql_unlock();
>          if (unlikely(ret !=3D 0)) {
>              qemu_log_mask(LOG_GUEST_ERROR, "DCR write error %d %03x\n",
>                            (uint32_t)dcrn, (uint32_t)dcrn);
> diff --git a/target/s390x/kvm/kvm.c b/target/s390x/kvm/kvm.c
> index 33ab3551f4..888d6c1a1c 100644
> --- a/target/s390x/kvm/kvm.c
> +++ b/target/s390x/kvm/kvm.c
> @@ -1923,7 +1923,7 @@ int kvm_arch_handle_exit(CPUState *cs, struct
> kvm_run *run)
>      S390CPU *cpu =3D S390_CPU(cs);
>      int ret =3D 0;
>
> -    qemu_mutex_lock_iothread();
> +    bql_lock();
>
>      kvm_cpu_synchronize_state(cs);
>
> @@ -1947,7 +1947,7 @@ int kvm_arch_handle_exit(CPUState *cs, struct
> kvm_run *run)
>              fprintf(stderr, "Unknown KVM exit: %d\n", run->exit_reason);
>              break;
>      }
> -    qemu_mutex_unlock_iothread();
> +    bql_unlock();
>
>      if (ret =3D=3D 0) {
>          ret =3D EXCP_INTERRUPT;
> diff --git a/target/s390x/tcg/misc_helper.c
> b/target/s390x/tcg/misc_helper.c
> index 6aa7907438..89b5268fd4 100644
> --- a/target/s390x/tcg/misc_helper.c
> +++ b/target/s390x/tcg/misc_helper.c
> @@ -101,9 +101,9 @@ uint64_t HELPER(stck)(CPUS390XState *env)
>  /* SCLP service call */
>  uint32_t HELPER(servc)(CPUS390XState *env, uint64_t r1, uint64_t r2)
>  {
> -    qemu_mutex_lock_iothread();
> +    bql_lock();
>      int r =3D sclp_service_call(env_archcpu(env), r1, r2);
> -    qemu_mutex_unlock_iothread();
> +    bql_unlock();
>      if (r < 0) {
>          tcg_s390_program_interrupt(env, -r, GETPC());
>      }
> @@ -117,9 +117,9 @@ void HELPER(diag)(CPUS390XState *env, uint32_t r1,
> uint32_t r3, uint32_t num)
>      switch (num) {
>      case 0x500:
>          /* KVM hypercall */
> -        qemu_mutex_lock_iothread();
> +        bql_lock();
>          r =3D s390_virtio_hypercall(env);
> -        qemu_mutex_unlock_iothread();
> +        bql_unlock();
>          break;
>      case 0x44:
>          /* yield */
> @@ -127,9 +127,9 @@ void HELPER(diag)(CPUS390XState *env, uint32_t r1,
> uint32_t r3, uint32_t num)
>          break;
>      case 0x308:
>          /* ipl */
> -        qemu_mutex_lock_iothread();
> +        bql_lock();
>          handle_diag_308(env, r1, r3, GETPC());
> -        qemu_mutex_unlock_iothread();
> +        bql_unlock();
>          r =3D 0;
>          break;
>      case 0x288:
> @@ -185,7 +185,7 @@ static void update_ckc_timer(CPUS390XState *env)
>
>      /* stop the timer and remove pending CKC IRQs */
>      timer_del(env->tod_timer);
> -    g_assert(qemu_mutex_iothread_locked());
> +    g_assert(bql_locked());
>      env->pending_int &=3D ~INTERRUPT_EXT_CLOCK_COMPARATOR;
>
>      /* the tod has to exceed the ckc, this can never happen if ckc is al=
l
> 1's */
> @@ -207,9 +207,9 @@ void HELPER(sckc)(CPUS390XState *env, uint64_t ckc)
>  {
>      env->ckc =3D ckc;
>
> -    qemu_mutex_lock_iothread();
> +    bql_lock();
>      update_ckc_timer(env);
> -    qemu_mutex_unlock_iothread();
> +    bql_unlock();
>  }
>
>  void tcg_s390_tod_updated(CPUState *cs, run_on_cpu_data opaque)
> @@ -229,9 +229,9 @@ uint32_t HELPER(sck)(CPUS390XState *env, uint64_t
> tod_low)
>          .low =3D tod_low,
>      };
>
> -    qemu_mutex_lock_iothread();
> +    bql_lock();
>      tdc->set(td, &tod, &error_abort);
> -    qemu_mutex_unlock_iothread();
> +    bql_unlock();
>      return 0;
>  }
>
> @@ -421,9 +421,9 @@ uint32_t HELPER(sigp)(CPUS390XState *env, uint64_t
> order_code, uint32_t r1,
>      int cc;
>
>      /* TODO: needed to inject interrupts  - push further down */
> -    qemu_mutex_lock_iothread();
> +    bql_lock();
>      cc =3D handle_sigp(env, order_code & SIGP_ORDER_MASK, r1, r3);
> -    qemu_mutex_unlock_iothread();
> +    bql_unlock();
>
>      return cc;
>  }
> @@ -433,92 +433,92 @@ uint32_t HELPER(sigp)(CPUS390XState *env, uint64_t
> order_code, uint32_t r1,
>  void HELPER(xsch)(CPUS390XState *env, uint64_t r1)
>  {
>      S390CPU *cpu =3D env_archcpu(env);
> -    qemu_mutex_lock_iothread();
> +    bql_lock();
>      ioinst_handle_xsch(cpu, r1, GETPC());
> -    qemu_mutex_unlock_iothread();
> +    bql_unlock();
>  }
>
>  void HELPER(csch)(CPUS390XState *env, uint64_t r1)
>  {
>      S390CPU *cpu =3D env_archcpu(env);
> -    qemu_mutex_lock_iothread();
> +    bql_lock();
>      ioinst_handle_csch(cpu, r1, GETPC());
> -    qemu_mutex_unlock_iothread();
> +    bql_unlock();
>  }
>
>  void HELPER(hsch)(CPUS390XState *env, uint64_t r1)
>  {
>      S390CPU *cpu =3D env_archcpu(env);
> -    qemu_mutex_lock_iothread();
> +    bql_lock();
>      ioinst_handle_hsch(cpu, r1, GETPC());
> -    qemu_mutex_unlock_iothread();
> +    bql_unlock();
>  }
>
>  void HELPER(msch)(CPUS390XState *env, uint64_t r1, uint64_t inst)
>  {
>      S390CPU *cpu =3D env_archcpu(env);
> -    qemu_mutex_lock_iothread();
> +    bql_lock();
>      ioinst_handle_msch(cpu, r1, inst >> 16, GETPC());
> -    qemu_mutex_unlock_iothread();
> +    bql_unlock();
>  }
>
>  void HELPER(rchp)(CPUS390XState *env, uint64_t r1)
>  {
>      S390CPU *cpu =3D env_archcpu(env);
> -    qemu_mutex_lock_iothread();
> +    bql_lock();
>      ioinst_handle_rchp(cpu, r1, GETPC());
> -    qemu_mutex_unlock_iothread();
> +    bql_unlock();
>  }
>
>  void HELPER(rsch)(CPUS390XState *env, uint64_t r1)
>  {
>      S390CPU *cpu =3D env_archcpu(env);
> -    qemu_mutex_lock_iothread();
> +    bql_lock();
>      ioinst_handle_rsch(cpu, r1, GETPC());
> -    qemu_mutex_unlock_iothread();
> +    bql_unlock();
>  }
>
>  void HELPER(sal)(CPUS390XState *env, uint64_t r1)
>  {
>      S390CPU *cpu =3D env_archcpu(env);
>
> -    qemu_mutex_lock_iothread();
> +    bql_lock();
>      ioinst_handle_sal(cpu, r1, GETPC());
> -    qemu_mutex_unlock_iothread();
> +    bql_unlock();
>  }
>
>  void HELPER(schm)(CPUS390XState *env, uint64_t r1, uint64_t r2, uint64_t
> inst)
>  {
>      S390CPU *cpu =3D env_archcpu(env);
>
> -    qemu_mutex_lock_iothread();
> +    bql_lock();
>      ioinst_handle_schm(cpu, r1, r2, inst >> 16, GETPC());
> -    qemu_mutex_unlock_iothread();
> +    bql_unlock();
>  }
>
>  void HELPER(ssch)(CPUS390XState *env, uint64_t r1, uint64_t inst)
>  {
>      S390CPU *cpu =3D env_archcpu(env);
> -    qemu_mutex_lock_iothread();
> +    bql_lock();
>      ioinst_handle_ssch(cpu, r1, inst >> 16, GETPC());
> -    qemu_mutex_unlock_iothread();
> +    bql_unlock();
>  }
>
>  void HELPER(stcrw)(CPUS390XState *env, uint64_t inst)
>  {
>      S390CPU *cpu =3D env_archcpu(env);
>
> -    qemu_mutex_lock_iothread();
> +    bql_lock();
>      ioinst_handle_stcrw(cpu, inst >> 16, GETPC());
> -    qemu_mutex_unlock_iothread();
> +    bql_unlock();
>  }
>
>  void HELPER(stsch)(CPUS390XState *env, uint64_t r1, uint64_t inst)
>  {
>      S390CPU *cpu =3D env_archcpu(env);
> -    qemu_mutex_lock_iothread();
> +    bql_lock();
>      ioinst_handle_stsch(cpu, r1, inst >> 16, GETPC());
> -    qemu_mutex_unlock_iothread();
> +    bql_unlock();
>  }
>
>  uint32_t HELPER(tpi)(CPUS390XState *env, uint64_t addr)
> @@ -533,10 +533,10 @@ uint32_t HELPER(tpi)(CPUS390XState *env, uint64_t
> addr)
>          tcg_s390_program_interrupt(env, PGM_SPECIFICATION, ra);
>      }
>
> -    qemu_mutex_lock_iothread();
> +    bql_lock();
>      io =3D qemu_s390_flic_dequeue_io(flic, env->cregs[6]);
>      if (!io) {
> -        qemu_mutex_unlock_iothread();
> +        bql_unlock();
>          return 0;
>      }
>
> @@ -554,7 +554,7 @@ uint32_t HELPER(tpi)(CPUS390XState *env, uint64_t add=
r)
>          if (s390_cpu_virt_mem_write(cpu, addr, 0, &intc, sizeof(intc))) =
{
>              /* writing failed, reinject and properly clean up */
>              s390_io_interrupt(io->id, io->nr, io->parm, io->word);
> -            qemu_mutex_unlock_iothread();
> +            bql_unlock();
>              g_free(io);
>              s390_cpu_virt_mem_handle_exc(cpu, ra);
>              return 0;
> @@ -570,24 +570,24 @@ uint32_t HELPER(tpi)(CPUS390XState *env, uint64_t
> addr)
>      }
>
>      g_free(io);
> -    qemu_mutex_unlock_iothread();
> +    bql_unlock();
>      return 1;
>  }
>
>  void HELPER(tsch)(CPUS390XState *env, uint64_t r1, uint64_t inst)
>  {
>      S390CPU *cpu =3D env_archcpu(env);
> -    qemu_mutex_lock_iothread();
> +    bql_lock();
>      ioinst_handle_tsch(cpu, r1, inst >> 16, GETPC());
> -    qemu_mutex_unlock_iothread();
> +    bql_unlock();
>  }
>
>  void HELPER(chsc)(CPUS390XState *env, uint64_t inst)
>  {
>      S390CPU *cpu =3D env_archcpu(env);
> -    qemu_mutex_lock_iothread();
> +    bql_lock();
>      ioinst_handle_chsc(cpu, inst >> 16, GETPC());
> -    qemu_mutex_unlock_iothread();
> +    bql_unlock();
>  }
>  #endif
>
> @@ -726,27 +726,27 @@ void HELPER(clp)(CPUS390XState *env, uint32_t r2)
>  {
>      S390CPU *cpu =3D env_archcpu(env);
>
> -    qemu_mutex_lock_iothread();
> +    bql_lock();
>      clp_service_call(cpu, r2, GETPC());
> -    qemu_mutex_unlock_iothread();
> +    bql_unlock();
>  }
>
>  void HELPER(pcilg)(CPUS390XState *env, uint32_t r1, uint32_t r2)
>  {
>      S390CPU *cpu =3D env_archcpu(env);
>
> -    qemu_mutex_lock_iothread();
> +    bql_lock();
>      pcilg_service_call(cpu, r1, r2, GETPC());
> -    qemu_mutex_unlock_iothread();
> +    bql_unlock();
>  }
>
>  void HELPER(pcistg)(CPUS390XState *env, uint32_t r1, uint32_t r2)
>  {
>      S390CPU *cpu =3D env_archcpu(env);
>
> -    qemu_mutex_lock_iothread();
> +    bql_lock();
>      pcistg_service_call(cpu, r1, r2, GETPC());
> -    qemu_mutex_unlock_iothread();
> +    bql_unlock();
>  }
>
>  void HELPER(stpcifc)(CPUS390XState *env, uint32_t r1, uint64_t fiba,
> @@ -754,9 +754,9 @@ void HELPER(stpcifc)(CPUS390XState *env, uint32_t r1,
> uint64_t fiba,
>  {
>      S390CPU *cpu =3D env_archcpu(env);
>
> -    qemu_mutex_lock_iothread();
> +    bql_lock();
>      stpcifc_service_call(cpu, r1, fiba, ar, GETPC());
> -    qemu_mutex_unlock_iothread();
> +    bql_unlock();
>  }
>
>  void HELPER(sic)(CPUS390XState *env, uint64_t r1, uint64_t r3)
> @@ -764,9 +764,9 @@ void HELPER(sic)(CPUS390XState *env, uint64_t r1,
> uint64_t r3)
>      S390CPU *cpu =3D env_archcpu(env);
>      int r;
>
> -    qemu_mutex_lock_iothread();
> +    bql_lock();
>      r =3D css_do_sic(cpu, (r3 >> 27) & 0x7, r1 & 0xffff);
> -    qemu_mutex_unlock_iothread();
> +    bql_unlock();
>      /* css_do_sic() may actually return a PGM_xxx value to inject */
>      if (r) {
>          tcg_s390_program_interrupt(env, -r, GETPC());
> @@ -777,9 +777,9 @@ void HELPER(rpcit)(CPUS390XState *env, uint32_t r1,
> uint32_t r2)
>  {
>      S390CPU *cpu =3D env_archcpu(env);
>
> -    qemu_mutex_lock_iothread();
> +    bql_lock();
>      rpcit_service_call(cpu, r1, r2, GETPC());
> -    qemu_mutex_unlock_iothread();
> +    bql_unlock();
>  }
>
>  void HELPER(pcistb)(CPUS390XState *env, uint32_t r1, uint32_t r3,
> @@ -787,9 +787,9 @@ void HELPER(pcistb)(CPUS390XState *env, uint32_t r1,
> uint32_t r3,
>  {
>      S390CPU *cpu =3D env_archcpu(env);
>
> -    qemu_mutex_lock_iothread();
> +    bql_lock();
>      pcistb_service_call(cpu, r1, r3, gaddr, ar, GETPC());
> -    qemu_mutex_unlock_iothread();
> +    bql_unlock();
>  }
>
>  void HELPER(mpcifc)(CPUS390XState *env, uint32_t r1, uint64_t fiba,
> @@ -797,8 +797,8 @@ void HELPER(mpcifc)(CPUS390XState *env, uint32_t r1,
> uint64_t fiba,
>  {
>      S390CPU *cpu =3D env_archcpu(env);
>
> -    qemu_mutex_lock_iothread();
> +    bql_lock();
>      mpcifc_service_call(cpu, r1, fiba, ar, GETPC());
> -    qemu_mutex_unlock_iothread();
> +    bql_unlock();
>  }
>  #endif
> diff --git a/target/sparc/int32_helper.c b/target/sparc/int32_helper.c
> index 1563613582..49a9149263 100644
> --- a/target/sparc/int32_helper.c
> +++ b/target/sparc/int32_helper.c
> @@ -70,7 +70,7 @@ void cpu_check_irqs(CPUSPARCState *env)
>      CPUState *cs;
>
>      /* We should be holding the BQL before we mess with IRQs */
> -    g_assert(qemu_mutex_iothread_locked());
> +    g_assert(bql_locked());
>
>      if (env->pil_in && (env->interrupt_index =3D=3D 0 ||
>                          (env->interrupt_index & ~15) =3D=3D TT_EXTINT)) =
{
> diff --git a/target/sparc/int64_helper.c b/target/sparc/int64_helper.c
> index 1b4155f5f3..27df9dba89 100644
> --- a/target/sparc/int64_helper.c
> +++ b/target/sparc/int64_helper.c
> @@ -69,7 +69,7 @@ void cpu_check_irqs(CPUSPARCState *env)
>                    (env->softint & ~(SOFTINT_TIMER | SOFTINT_STIMER));
>
>      /* We should be holding the BQL before we mess with IRQs */
> -    g_assert(qemu_mutex_iothread_locked());
> +    g_assert(bql_locked());
>
>      /* TT_IVEC has a higher priority (16) than TT_EXTINT (31..17) */
>      if (env->ivec_status & 0x20) {
> @@ -267,9 +267,9 @@ static bool do_modify_softint(CPUSPARCState *env,
> uint32_t value)
>          env->softint =3D value;
>  #if !defined(CONFIG_USER_ONLY)
>          if (cpu_interrupts_enabled(env)) {
> -            qemu_mutex_lock_iothread();
> +            bql_lock();
>              cpu_check_irqs(env);
> -            qemu_mutex_unlock_iothread();
> +            bql_unlock();
>          }
>  #endif
>          return true;
> diff --git a/target/sparc/win_helper.c b/target/sparc/win_helper.c
> index 16d1c70fe7..b53fc9ce94 100644
> --- a/target/sparc/win_helper.c
> +++ b/target/sparc/win_helper.c
> @@ -179,9 +179,9 @@ void helper_wrpsr(CPUSPARCState *env, target_ulong
> new_psr)
>          cpu_raise_exception_ra(env, TT_ILL_INSN, GETPC());
>      } else {
>          /* cpu_put_psr may trigger interrupts, hence BQL */
> -        qemu_mutex_lock_iothread();
> +        bql_lock();
>          cpu_put_psr(env, new_psr);
> -        qemu_mutex_unlock_iothread();
> +        bql_unlock();
>      }
>  }
>
> @@ -407,9 +407,9 @@ void helper_wrpstate(CPUSPARCState *env, target_ulong
> new_state)
>
>  #if !defined(CONFIG_USER_ONLY)
>      if (cpu_interrupts_enabled(env)) {
> -        qemu_mutex_lock_iothread();
> +        bql_lock();
>          cpu_check_irqs(env);
> -        qemu_mutex_unlock_iothread();
> +        bql_unlock();
>      }
>  #endif
>  }
> @@ -422,9 +422,9 @@ void helper_wrpil(CPUSPARCState *env, target_ulong
> new_pil)
>      env->psrpil =3D new_pil;
>
>      if (cpu_interrupts_enabled(env)) {
> -        qemu_mutex_lock_iothread();
> +        bql_lock();
>          cpu_check_irqs(env);
> -        qemu_mutex_unlock_iothread();
> +        bql_unlock();
>      }
>  #endif
>  }
> @@ -451,9 +451,9 @@ void helper_done(CPUSPARCState *env)
>
>  #if !defined(CONFIG_USER_ONLY)
>      if (cpu_interrupts_enabled(env)) {
> -        qemu_mutex_lock_iothread();
> +        bql_lock();
>          cpu_check_irqs(env);
> -        qemu_mutex_unlock_iothread();
> +        bql_unlock();
>      }
>  #endif
>  }
> @@ -480,9 +480,9 @@ void helper_retry(CPUSPARCState *env)
>
>  #if !defined(CONFIG_USER_ONLY)
>      if (cpu_interrupts_enabled(env)) {
> -        qemu_mutex_lock_iothread();
> +        bql_lock();
>          cpu_check_irqs(env);
> -        qemu_mutex_unlock_iothread();
> +        bql_unlock();
>      }
>  #endif
>  }
> diff --git a/target/xtensa/exc_helper.c b/target/xtensa/exc_helper.c
> index 91354884f7..168419a505 100644
> --- a/target/xtensa/exc_helper.c
> +++ b/target/xtensa/exc_helper.c
> @@ -105,9 +105,9 @@ void HELPER(waiti)(CPUXtensaState *env, uint32_t pc,
> uint32_t intlevel)
>      env->sregs[PS] =3D (env->sregs[PS] & ~PS_INTLEVEL) |
>          (intlevel << PS_INTLEVEL_SHIFT);
>
> -    qemu_mutex_lock_iothread();
> +    bql_lock();
>      check_interrupts(env);
> -    qemu_mutex_unlock_iothread();
> +    bql_unlock();
>
>      if (env->pending_irq_level) {
>          cpu_loop_exit(cpu);
> @@ -120,9 +120,9 @@ void HELPER(waiti)(CPUXtensaState *env, uint32_t pc,
> uint32_t intlevel)
>
>  void HELPER(check_interrupts)(CPUXtensaState *env)
>  {
> -    qemu_mutex_lock_iothread();
> +    bql_lock();
>      check_interrupts(env);
> -    qemu_mutex_unlock_iothread();
> +    bql_unlock();
>  }
>
>  void HELPER(intset)(CPUXtensaState *env, uint32_t v)
> diff --git a/ui/spice-core.c b/ui/spice-core.c
> index db21db2c94..b6ee495a8f 100644
> --- a/ui/spice-core.c
> +++ b/ui/spice-core.c
> @@ -222,7 +222,7 @@ static void channel_event(int event,
> SpiceChannelEventInfo *info)
>       */
>      bool need_lock =3D !qemu_thread_is_self(&me);
>      if (need_lock) {
> -        qemu_mutex_lock_iothread();
> +        bql_lock();
>      }
>
>      if (info->flags & SPICE_CHANNEL_EVENT_FLAG_ADDR_EXT) {
> @@ -260,7 +260,7 @@ static void channel_event(int event,
> SpiceChannelEventInfo *info)
>      }
>
>      if (need_lock) {
> -        qemu_mutex_unlock_iothread();
> +        bql_unlock();
>      }
>
>      qapi_free_SpiceServerInfo(server);
> diff --git a/util/async.c b/util/async.c
> index 8f90ddc304..def720045b 100644
> --- a/util/async.c
> +++ b/util/async.c
> @@ -741,7 +741,7 @@ AioContext *qemu_get_current_aio_context(void)
>      if (ctx) {
>          return ctx;
>      }
> -    if (qemu_mutex_iothread_locked()) {
> +    if (bql_locked()) {
>          /* Possibly in a vCPU thread.  */
>          return qemu_get_aio_context();
>      }
> diff --git a/util/main-loop.c b/util/main-loop.c
> index 797b640c41..bfbff4f246 100644
> --- a/util/main-loop.c
> +++ b/util/main-loop.c
> @@ -302,13 +302,13 @@ static int os_host_main_loop_wait(int64_t timeout)
>
>      glib_pollfds_fill(&timeout);
>
> -    qemu_mutex_unlock_iothread();
> +    bql_unlock();
>      replay_mutex_unlock();
>
>      ret =3D qemu_poll_ns((GPollFD *)gpollfds->data, gpollfds->len, timeo=
ut);
>
>      replay_mutex_lock();
> -    qemu_mutex_lock_iothread();
> +    bql_lock();
>
>      glib_pollfds_poll();
>
> @@ -517,7 +517,7 @@ static int os_host_main_loop_wait(int64_t timeout)
>
>      poll_timeout_ns =3D qemu_soonest_timeout(poll_timeout_ns, timeout);
>
> -    qemu_mutex_unlock_iothread();
> +    bql_unlock();
>
>      replay_mutex_unlock();
>
> @@ -525,7 +525,7 @@ static int os_host_main_loop_wait(int64_t timeout)
>
>      replay_mutex_lock();
>
> -    qemu_mutex_lock_iothread();
> +    bql_lock();
>      if (g_poll_ret > 0) {
>          for (i =3D 0; i < w->num; i++) {
>              w->revents[i] =3D poll_fds[n_poll_fds + i].revents;
> diff --git a/util/qsp.c b/util/qsp.c
> index 2fe3764906..6b783e2e7f 100644
> --- a/util/qsp.c
> +++ b/util/qsp.c
> @@ -124,7 +124,7 @@ static const char * const qsp_typenames[] =3D {
>      [QSP_CONDVAR]   =3D "condvar",
>  };
>
> -QemuMutexLockFunc qemu_bql_mutex_lock_func =3D qemu_mutex_lock_impl;
> +QemuMutexLockFunc bql_mutex_lock_func =3D qemu_mutex_lock_impl;
>  QemuMutexLockFunc qemu_mutex_lock_func =3D qemu_mutex_lock_impl;
>  QemuMutexTrylockFunc qemu_mutex_trylock_func =3D qemu_mutex_trylock_impl=
;
>  QemuRecMutexLockFunc qemu_rec_mutex_lock_func =3D qemu_rec_mutex_lock_im=
pl;
> @@ -439,7 +439,7 @@ void qsp_enable(void)
>  {
>      qatomic_set(&qemu_mutex_lock_func, qsp_mutex_lock);
>      qatomic_set(&qemu_mutex_trylock_func, qsp_mutex_trylock);
> -    qatomic_set(&qemu_bql_mutex_lock_func, qsp_bql_mutex_lock);
> +    qatomic_set(&bql_mutex_lock_func, qsp_bql_mutex_lock);
>      qatomic_set(&qemu_rec_mutex_lock_func, qsp_rec_mutex_lock);
>      qatomic_set(&qemu_rec_mutex_trylock_func, qsp_rec_mutex_trylock);
>      qatomic_set(&qemu_cond_wait_func, qsp_cond_wait);
> @@ -450,7 +450,7 @@ void qsp_disable(void)
>  {
>      qatomic_set(&qemu_mutex_lock_func, qemu_mutex_lock_impl);
>      qatomic_set(&qemu_mutex_trylock_func, qemu_mutex_trylock_impl);
> -    qatomic_set(&qemu_bql_mutex_lock_func, qemu_mutex_lock_impl);
> +    qatomic_set(&bql_mutex_lock_func, qemu_mutex_lock_impl);
>      qatomic_set(&qemu_rec_mutex_lock_func, qemu_rec_mutex_lock_impl);
>      qatomic_set(&qemu_rec_mutex_trylock_func,
> qemu_rec_mutex_trylock_impl);
>      qatomic_set(&qemu_cond_wait_func, qemu_cond_wait_impl);
> diff --git a/util/rcu.c b/util/rcu.c
> index e587bcc483..bb7f633b5c 100644
> --- a/util/rcu.c
> +++ b/util/rcu.c
> @@ -283,24 +283,24 @@ static void *call_rcu_thread(void *opaque)
>
>          qatomic_sub(&rcu_call_count, n);
>          synchronize_rcu();
> -        qemu_mutex_lock_iothread();
> +        bql_lock();
>          while (n > 0) {
>              node =3D try_dequeue();
>              while (!node) {
> -                qemu_mutex_unlock_iothread();
> +                bql_unlock();
>                  qemu_event_reset(&rcu_call_ready_event);
>                  node =3D try_dequeue();
>                  if (!node) {
>                      qemu_event_wait(&rcu_call_ready_event);
>                      node =3D try_dequeue();
>                  }
> -                qemu_mutex_lock_iothread();
> +                bql_lock();
>              }
>
>              n--;
>              node->func(node);
>          }
> -        qemu_mutex_unlock_iothread();
> +        bql_unlock();
>      }
>      abort();
>  }
> @@ -337,13 +337,13 @@ static void drain_rcu_callback(struct rcu_head *nod=
e)
>  void drain_call_rcu(void)
>  {
>      struct rcu_drain rcu_drain;
> -    bool locked =3D qemu_mutex_iothread_locked();
> +    bool locked =3D bql_locked();
>
>      memset(&rcu_drain, 0, sizeof(struct rcu_drain));
>      qemu_event_init(&rcu_drain.drain_complete_event, false);
>
>      if (locked) {
> -        qemu_mutex_unlock_iothread();
> +        bql_unlock();
>      }
>
>
> @@ -365,7 +365,7 @@ void drain_call_rcu(void)
>      qatomic_dec(&in_drain_call_rcu);
>
>      if (locked) {
> -        qemu_mutex_lock_iothread();
> +        bql_lock();
>      }
>
>  }
> diff --git a/audio/coreaudio.m b/audio/coreaudio.m
> index 8cd129a27d..9d2db9883c 100644
> --- a/audio/coreaudio.m
> +++ b/audio/coreaudio.m
> @@ -547,7 +547,7 @@ static OSStatus handle_voice_change(
>  {
>      coreaudioVoiceOut *core =3D in_client_data;
>
> -    qemu_mutex_lock_iothread();
> +    bql_lock();
>
>      if (core->outputDeviceID) {
>          fini_out_device(core);
> @@ -557,7 +557,7 @@ static OSStatus handle_voice_change(
>          update_device_playback_state(core);
>      }
>
> -    qemu_mutex_unlock_iothread();
> +    bql_unlock();
>      return 0;
>  }
>
> diff --git a/memory_ldst.c.inc b/memory_ldst.c.inc
> index 84b868f294..0e6f3940a9 100644
> --- a/memory_ldst.c.inc
> +++ b/memory_ldst.c.inc
> @@ -61,7 +61,7 @@ static inline uint32_t glue(address_space_ldl_internal,
> SUFFIX)(ARG1_DECL,
>          *result =3D r;
>      }
>      if (release_lock) {
> -        qemu_mutex_unlock_iothread();
> +        bql_unlock();
>      }
>      RCU_READ_UNLOCK();
>      return val;
> @@ -130,7 +130,7 @@ static inline uint64_t
> glue(address_space_ldq_internal, SUFFIX)(ARG1_DECL,
>          *result =3D r;
>      }
>      if (release_lock) {
> -        qemu_mutex_unlock_iothread();
> +        bql_unlock();
>      }
>      RCU_READ_UNLOCK();
>      return val;
> @@ -186,7 +186,7 @@ uint8_t glue(address_space_ldub, SUFFIX)(ARG1_DECL,
>          *result =3D r;
>      }
>      if (release_lock) {
> -        qemu_mutex_unlock_iothread();
> +        bql_unlock();
>      }
>      RCU_READ_UNLOCK();
>      return val;
> @@ -234,7 +234,7 @@ static inline uint16_t
> glue(address_space_lduw_internal, SUFFIX)(ARG1_DECL,
>          *result =3D r;
>      }
>      if (release_lock) {
> -        qemu_mutex_unlock_iothread();
> +        bql_unlock();
>      }
>      RCU_READ_UNLOCK();
>      return val;
> @@ -295,7 +295,7 @@ void glue(address_space_stl_notdirty,
> SUFFIX)(ARG1_DECL,
>          *result =3D r;
>      }
>      if (release_lock) {
> -        qemu_mutex_unlock_iothread();
> +        bql_unlock();
>      }
>      RCU_READ_UNLOCK();
>  }
> @@ -339,7 +339,7 @@ static inline void glue(address_space_stl_internal,
> SUFFIX)(ARG1_DECL,
>          *result =3D r;
>      }
>      if (release_lock) {
> -        qemu_mutex_unlock_iothread();
> +        bql_unlock();
>      }
>      RCU_READ_UNLOCK();
>  }
> @@ -391,7 +391,7 @@ void glue(address_space_stb, SUFFIX)(ARG1_DECL,
>          *result =3D r;
>      }
>      if (release_lock) {
> -        qemu_mutex_unlock_iothread();
> +        bql_unlock();
>      }
>      RCU_READ_UNLOCK();
>  }
> @@ -435,7 +435,7 @@ static inline void glue(address_space_stw_internal,
> SUFFIX)(ARG1_DECL,
>          *result =3D r;
>      }
>      if (release_lock) {
> -        qemu_mutex_unlock_iothread();
> +        bql_unlock();
>      }
>      RCU_READ_UNLOCK();
>  }
> @@ -499,7 +499,7 @@ static void glue(address_space_stq_internal,
> SUFFIX)(ARG1_DECL,
>          *result =3D r;
>      }
>      if (release_lock) {
> -        qemu_mutex_unlock_iothread();
> +        bql_unlock();
>      }
>      RCU_READ_UNLOCK();
>  }
> diff --git a/target/i386/hvf/README.md b/target/i386/hvf/README.md
> index 2d33477aca..64a8935237 100644
> --- a/target/i386/hvf/README.md
> +++ b/target/i386/hvf/README.md
> @@ -4,4 +4,4 @@ These sources (and ../hvf-all.c) are adapted from Veertu
> Inc's vdhh (Veertu Desk
>
>  1. Adapt to our current QEMU's `CPUState` structure and
> `address_space_rw` API; many struct members have been moved around
> (emulated x86 state, xsave_buf) due to historical differences + QEMU
> needing to handle more emulation targets.
>  2. Removal of `apic_page` and hyperv-related functionality.
> -3. More relaxed use of `qemu_mutex_lock_iothread`.
> +3. More relaxed use of `bql_lock`.
> diff --git a/ui/cocoa.m b/ui/cocoa.m
> index cd069da696..5ebb535070 100644
> --- a/ui/cocoa.m
> +++ b/ui/cocoa.m
> @@ -117,29 +117,29 @@ static void cocoa_switch(DisplayChangeListener *dcl=
,
>  typedef void (^CodeBlock)(void);
>  typedef bool (^BoolCodeBlock)(void);
>
> -static void with_iothread_lock(CodeBlock block)
> +static void with_bql(CodeBlock block)
>  {
> -    bool locked =3D qemu_mutex_iothread_locked();
> +    bool locked =3D bql_locked();
>      if (!locked) {
> -        qemu_mutex_lock_iothread();
> +        bql_lock();
>      }
>      block();
>      if (!locked) {
> -        qemu_mutex_unlock_iothread();
> +        bql_unlock();
>      }
>  }
>
> -static bool bool_with_iothread_lock(BoolCodeBlock block)
> +static bool bool_with_bql(BoolCodeBlock block)
>  {
> -    bool locked =3D qemu_mutex_iothread_locked();
> +    bool locked =3D bql_locked();
>      bool val;
>
>      if (!locked) {
> -        qemu_mutex_lock_iothread();
> +        bql_lock();
>      }
>      val =3D block();
>      if (!locked) {
> -        qemu_mutex_unlock_iothread();
> +        bql_unlock();
>      }
>      return val;
>  }
> @@ -605,7 +605,7 @@ - (void) updateUIInfo
>          return;
>      }
>
> -    with_iothread_lock(^{
> +    with_bql(^{
>          [self updateUIInfoLocked];
>      });
>  }
> @@ -790,7 +790,7 @@ - (void) handleMonitorInput:(NSEvent *)event
>
>  - (bool) handleEvent:(NSEvent *)event
>  {
> -    return bool_with_iothread_lock(^{
> +    return bool_with_bql(^{
>          return [self handleEventLocked:event];
>      });
>  }
> @@ -1182,7 +1182,7 @@ - (QEMUScreen) gscreen {return screen;}
>   */
>  - (void) raiseAllKeys
>  {
> -    with_iothread_lock(^{
> +    with_bql(^{
>          qkbd_state_lift_all_keys(kbd);
>      });
>  }
> @@ -1282,7 +1282,7 @@ - (void)applicationWillTerminate:(NSNotification
> *)aNotification
>  {
>      COCOA_DEBUG("QemuCocoaAppController: applicationWillTerminate\n");
>
> -    with_iothread_lock(^{
> +    with_bql(^{
>          shutdown_action =3D SHUTDOWN_ACTION_POWEROFF;
>          qemu_system_shutdown_request(SHUTDOWN_CAUSE_HOST_UI);
>      });
> @@ -1420,7 +1420,7 @@ - (void)displayConsole:(id)sender
>  /* Pause the guest */
>  - (void)pauseQEMU:(id)sender
>  {
> -    with_iothread_lock(^{
> +    with_bql(^{
>          qmp_stop(NULL);
>      });
>      [sender setEnabled: NO];
> @@ -1431,7 +1431,7 @@ - (void)pauseQEMU:(id)sender
>  /* Resume running the guest operating system */
>  - (void)resumeQEMU:(id) sender
>  {
> -    with_iothread_lock(^{
> +    with_bql(^{
>          qmp_cont(NULL);
>      });
>      [sender setEnabled: NO];
> @@ -1461,7 +1461,7 @@ - (void)removePause
>  /* Restarts QEMU */
>  - (void)restartQEMU:(id)sender
>  {
> -    with_iothread_lock(^{
> +    with_bql(^{
>          qmp_system_reset(NULL);
>      });
>  }
> @@ -1469,7 +1469,7 @@ - (void)restartQEMU:(id)sender
>  /* Powers down QEMU */
>  - (void)powerDownQEMU:(id)sender
>  {
> -    with_iothread_lock(^{
> +    with_bql(^{
>          qmp_system_powerdown(NULL);
>      });
>  }
> @@ -1488,7 +1488,7 @@ - (void)ejectDeviceMedia:(id)sender
>      }
>
>      __block Error *err =3D NULL;
> -    with_iothread_lock(^{
> +    with_bql(^{
>          qmp_eject([drive cStringUsingEncoding: NSASCIIStringEncoding],
>                    NULL, false, false, &err);
>      });
> @@ -1523,7 +1523,7 @@ - (void)changeDeviceMedia:(id)sender
>          }
>
>          __block Error *err =3D NULL;
> -        with_iothread_lock(^{
> +        with_bql(^{
>              qmp_blockdev_change_medium([drive cStringUsingEncoding:
>                                                    NSASCIIStringEncoding]=
,
>                                         NULL,
> @@ -1605,7 +1605,7 @@ - (void)adjustSpeed:(id)sender
>      // get the throttle percentage
>      throttle_pct =3D [sender tag];
>
> -    with_iothread_lock(^{
> +    with_bql(^{
>          cpu_throttle_set(throttle_pct);
>      });
>      COCOA_DEBUG("cpu throttling at %d%c\n",
> cpu_throttle_get_percentage(), '%');
> @@ -1819,7 +1819,7 @@ - (void)pasteboard:(NSPasteboard *)sender
> provideDataForType:(NSPasteboardType)t
>          return;
>      }
>
> -    with_iothread_lock(^{
> +    with_bql(^{
>          QemuClipboardInfo *info =3D qemu_clipboard_info_ref(cbinfo);
>          qemu_event_reset(&cbevent);
>          qemu_clipboard_request(info, QEMU_CLIPBOARD_TYPE_TEXT);
> @@ -1827,9 +1827,9 @@ - (void)pasteboard:(NSPasteboard *)sender
> provideDataForType:(NSPasteboardType)t
>          while (info =3D=3D cbinfo &&
>                 info->types[QEMU_CLIPBOARD_TYPE_TEXT].available &&
>                 info->types[QEMU_CLIPBOARD_TYPE_TEXT].data =3D=3D NULL) {
> -            qemu_mutex_unlock_iothread();
> +            bql_unlock();
>              qemu_event_wait(&cbevent);
> -            qemu_mutex_lock_iothread();
> +            bql_lock();
>          }
>
>          if (info =3D=3D cbinfo) {
> @@ -1927,9 +1927,9 @@ static void
> cocoa_clipboard_request(QemuClipboardInfo *info,
>      int status;
>
>      COCOA_DEBUG("Second thread: calling qemu_default_main()\n");
> -    qemu_mutex_lock_iothread();
> +    bql_lock();
>      status =3D qemu_default_main();
> -    qemu_mutex_unlock_iothread();
> +    bql_unlock();
>      COCOA_DEBUG("Second thread: qemu_default_main() returned, exiting\n"=
);
>      [cbowner release];
>      exit(status);
> @@ -1941,7 +1941,7 @@ static int cocoa_main(void)
>
>      COCOA_DEBUG("Entered %s()\n", __func__);
>
> -    qemu_mutex_unlock_iothread();
> +    bql_unlock();
>      qemu_thread_create(&thread, "qemu_main", call_qemu_main,
>                         NULL, QEMU_THREAD_DETACHED);
>
> --
> 2.43.0
>
>
Thanks,

Acked-by: Hyman Huang <yong.huang@smartx.com>

--=20
Best regards

--0000000000009f22ff060c5a2da5
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div di=
r=3D"ltr"><div class=3D"gmail_default" style=3D"font-family:&quot;comic san=
s ms&quot;,sans-serif"><br></div></div><br><div class=3D"gmail_quote"><div =
dir=3D"ltr" class=3D"gmail_attr">On Tue, Dec 12, 2023 at 11:39=E2=80=AFPM S=
tefan Hajnoczi &lt;<a href=3D"mailto:stefanha@redhat.com">stefanha@redhat.c=
om</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0px 0px 0px 0.8ex;border-left-width:1px;border-left-style:solid;border-le=
ft-color:rgb(204,204,204);padding-left:1ex">The Big QEMU Lock (BQL) has man=
y names and they are confusing. The<br>
actual QemuMutex variable is called qemu_global_mutex but it&#39;s commonly=
<br>
referred to as the BQL in discussions and some code comments. The<br>
locking APIs, however, are called qemu_mutex_lock_iothread() and<br>
qemu_mutex_unlock_iothread().<br>
<br>
The &quot;iothread&quot; name is historic and comes from when the main thre=
ad was<br>
split into into KVM vcpu threads and the &quot;iothread&quot; (now called t=
he main<br>
loop thread). I have contributed to the confusion myself by introducing<br>
a separate --object iothread, a separate concept unrelated to the BQL.<br>
<br>
The &quot;iothread&quot; name is no longer appropriate for the BQL. Rename =
the<br>
locking APIs to:<br>
- void bql_lock(void)<br>
- void bql_unlock(void)<br>
- bool bql_locked(void)<br>
<br>
There are more APIs with &quot;iothread&quot; in their names. Subsequent pa=
tches<br>
will rename them. There are also comments and documentation that will be<br=
>
updated in later patches.<br>
<br>
Signed-off-by: Stefan Hajnoczi &lt;<a href=3D"mailto:stefanha@redhat.com" t=
arget=3D"_blank">stefanha@redhat.com</a>&gt;<br>
Reviewed-by: Paul Durrant &lt;<a href=3D"mailto:paul@xen.org" target=3D"_bl=
ank">paul@xen.org</a>&gt;<br>
Acked-by: Fabiano Rosas &lt;<a href=3D"mailto:farosas@suse.de" target=3D"_b=
lank">farosas@suse.de</a>&gt;<br>
Acked-by: David Woodhouse &lt;<a href=3D"mailto:dwmw@amazon.co.uk" target=
=3D"_blank">dwmw@amazon.co.uk</a>&gt;<br>
Reviewed-by: C=C3=A9dric Le Goater &lt;<a href=3D"mailto:clg@kaod.org" targ=
et=3D"_blank">clg@kaod.org</a>&gt;<br>
Acked-by: Peter Xu &lt;<a href=3D"mailto:peterx@redhat.com" target=3D"_blan=
k">peterx@redhat.com</a>&gt;<br>
Acked-by: Eric Farman &lt;<a href=3D"mailto:farman@linux.ibm.com" target=3D=
"_blank">farman@linux.ibm.com</a>&gt;<br>
Reviewed-by: Harsh Prateek Bora &lt;<a href=3D"mailto:harshpb@linux.ibm.com=
" target=3D"_blank">harshpb@linux.ibm.com</a>&gt;<br>
---<br>
=C2=A0include/block/aio-wait.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0|=C2=A0 =C2=A02 +-<br>
=C2=A0include/qemu/main-loop.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0|=C2=A0 40 ++++-----<br>
=C2=A0include/qemu/thread.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 |=C2=A0 =C2=A02 +-<br>
=C2=A0accel/accel-blocker.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 |=C2=A0 10 +--<br>
=C2=A0accel/dummy-cpus.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A08 +-<br>
=C2=A0accel/hvf/hvf-accel-ops.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 =C2=A04 +-<br>
=C2=A0accel/kvm/kvm-accel-ops.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 =C2=A04 +-<br>
=C2=A0accel/kvm/kvm-all.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 22 ++---<br>
=C2=A0accel/tcg/cpu-exec.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0|=C2=A0 26 +++---<br>
=C2=A0accel/tcg/cputlb.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0|=C2=A0 16 ++--<br>
=C2=A0accel/tcg/tcg-accel-ops-icount.c=C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A04 +=
-<br>
=C2=A0accel/tcg/tcg-accel-ops-mttcg.c=C2=A0 =C2=A0 =C2=A0 |=C2=A0 12 +--<br=
>
=C2=A0accel/tcg/tcg-accel-ops-rr.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0=
 14 ++--<br>
=C2=A0accel/tcg/tcg-accel-ops.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 =C2=A02 +-<br>
=C2=A0accel/tcg/translate-all.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 =C2=A02 +-<br>
=C2=A0cpu-common.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A04 +-<br>
=C2=A0dump/dump.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A04 +-<br>
=C2=A0hw/core/cpu-common.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0|=C2=A0 =C2=A06 +-<br>
=C2=A0hw/i386/intel_iommu.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 |=C2=A0 =C2=A06 +-<br>
=C2=A0hw/i386/kvm/xen_evtchn.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0|=C2=A0 16 ++--<br>
=C2=A0hw/i386/kvm/xen_overlay.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 =C2=A02 +-<br>
=C2=A0hw/i386/kvm/xen_xenstore.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=
=C2=A0 =C2=A02 +-<br>
=C2=A0hw/intc/arm_gicv3_cpuif.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 =C2=A02 +-<br>
=C2=A0hw/intc/s390_flic.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 18 ++--<br>
=C2=A0hw/misc/edu.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A04 +-<br>
=C2=A0hw/misc/imx6_src.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A02 +-<br>
=C2=A0hw/misc/imx7_src.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A02 +-<br>
=C2=A0hw/net/xen_nic.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A08 +-<br>
=C2=A0hw/ppc/pegasos2.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A02 +-<br>
=C2=A0hw/ppc/ppc.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A04 +-<br>
=C2=A0hw/ppc/spapr.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A02 +-<br>
=C2=A0hw/ppc/spapr_rng.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A04 +-<br>
=C2=A0hw/ppc/spapr_softmmu.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0|=C2=A0 =C2=A04 +-<br>
=C2=A0hw/remote/mpqemu-link.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 20 ++---<br>
=C2=A0hw/remote/vfio-user-obj.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 =C2=A02 +-<br>
=C2=A0hw/s390x/s390-skeys.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 |=C2=A0 =C2=A02 +-<br>
=C2=A0migration/block-dirty-bitmap.c=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=
=A04 +-<br>
=C2=A0migration/block.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 |=C2=A0 16 ++--<br>
=C2=A0migration/colo.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 60 +++++++-------<br>
=C2=A0migration/dirtyrate.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 |=C2=A0 12 +--<br>
=C2=A0migration/migration.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 |=C2=A0 52 ++++++------<br>
=C2=A0migration/ram.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 12 +--<br>
=C2=A0replay/replay-internal.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0|=C2=A0 =C2=A02 +-<br>
=C2=A0semihosting/console.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 |=C2=A0 =C2=A08 +-<br>
=C2=A0stubs/iothread-lock.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 |=C2=A0 =C2=A06 +-<br>
=C2=A0system/cpu-throttle.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 |=C2=A0 =C2=A04 +-<br>
=C2=A0system/cpus.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 51 ++++++------<br>
=C2=A0system/dirtylimit.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 =C2=A04 +-<br>
=C2=A0system/memory.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A02 +-<br>
=C2=A0system/physmem.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A08 +-<br>
=C2=A0system/runstate.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A02 +-<br>
=C2=A0system/watchpoint.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 =C2=A04 +-<br>
=C2=A0target/arm/arm-powerctl.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 14 ++--<br>
=C2=A0target/arm/helper.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 =C2=A04 +-<br>
=C2=A0target/arm/hvf/hvf.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0|=C2=A0 =C2=A08 +-<br>
=C2=A0target/arm/kvm.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A04 +-<br>
=C2=A0target/arm/kvm64.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A04 +-<br>
=C2=A0target/arm/ptw.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A06 +-<br>
=C2=A0target/arm/tcg/helper-a64.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0=
 =C2=A08 +-<br>
=C2=A0target/arm/tcg/m_helper.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 =C2=A06 +-<br>
=C2=A0target/arm/tcg/op_helper.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=
=C2=A0 24 +++---<br>
=C2=A0target/arm/tcg/psci.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 |=C2=A0 =C2=A02 +-<br>
=C2=A0target/hppa/int_helper.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0|=C2=A0 =C2=A08 +-<br>
=C2=A0target/i386/hvf/hvf.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 |=C2=A0 =C2=A06 +-<br>
=C2=A0target/i386/kvm/hyperv.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0|=C2=A0 =C2=A04 +-<br>
=C2=A0target/i386/kvm/kvm.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 |=C2=A0 28 +++----<br>
=C2=A0target/i386/kvm/xen-emu.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 14 ++--<br>
=C2=A0target/i386/nvmm/nvmm-accel-ops.c=C2=A0 =C2=A0 |=C2=A0 =C2=A04 +-<br>
=C2=A0target/i386/nvmm/nvmm-all.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0=
 20 ++---<br>
=C2=A0target/i386/tcg/sysemu/fpu_helper.c=C2=A0 |=C2=A0 =C2=A06 +-<br>
=C2=A0target/i386/tcg/sysemu/misc_helper.c |=C2=A0 =C2=A04 +-<br>
=C2=A0target/i386/whpx/whpx-accel-ops.c=C2=A0 =C2=A0 |=C2=A0 =C2=A04 +-<br>
=C2=A0target/i386/whpx/whpx-all.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0=
 24 +++---<br>
=C2=A0target/loongarch/csr_helper.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=
=A04 +-<br>
=C2=A0target/mips/kvm.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A04 +-<br>
=C2=A0target/mips/tcg/sysemu/cp0_helper.c=C2=A0 |=C2=A0 =C2=A04 +-<br>
=C2=A0target/openrisc/sys_helper.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0=
 16 ++--<br>
=C2=A0target/ppc/excp_helper.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0|=C2=A0 12 +--<br>
=C2=A0target/ppc/kvm.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A04 +-<br>
=C2=A0target/ppc/misc_helper.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0|=C2=A0 =C2=A08 +-<br>
=C2=A0target/ppc/timebase_helper.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0=
 =C2=A08 +-<br>
=C2=A0target/s390x/kvm/kvm.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0|=C2=A0 =C2=A04 +-<br>
=C2=A0target/s390x/tcg/misc_helper.c=C2=A0 =C2=A0 =C2=A0 =C2=A0| 118 ++++++=
+++++++--------------<br>
=C2=A0target/sparc/int32_helper.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0=
 =C2=A02 +-<br>
=C2=A0target/sparc/int64_helper.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0=
 =C2=A06 +-<br>
=C2=A0target/sparc/win_helper.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 20 ++---<br>
=C2=A0target/xtensa/exc_helper.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=
=C2=A0 =C2=A08 +-<br>
=C2=A0ui/spice-core.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A04 +-<br>
=C2=A0util/async.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A02 +-<br>
=C2=A0util/main-loop.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A08 +-<br>
=C2=A0util/qsp.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A06 +-<br>
=C2=A0util/rcu.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 14 ++--<br>
=C2=A0audio/coreaudio.m=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A04 +-<br>
=C2=A0memory_ldst.c.inc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 |=C2=A0 18 ++--<br>
=C2=A0target/i386/hvf/README.md=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 =C2=A02 +-<br>
=C2=A0ui/cocoa.m=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 50 ++++++------<br>
=C2=A096 files changed, 530 insertions(+), 529 deletions(-)<br>
<br>
diff --git a/include/block/aio-wait.h b/include/block/aio-wait.h<br>
index 5449b6d742..d22ca24329 100644<br>
--- a/include/block/aio-wait.h<br>
+++ b/include/block/aio-wait.h<br>
@@ -151,7 +151,7 @@ static inline bool in_aio_context_home_thread(AioContex=
t *ctx)<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
=C2=A0 =C2=A0 =C2=A0if (ctx =3D=3D qemu_get_aio_context()) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 return qemu_mutex_iothread_locked();<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return bql_locked();<br>
=C2=A0 =C2=A0 =C2=A0} else {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return false;<br>
=C2=A0 =C2=A0 =C2=A0}<br>
diff --git a/include/qemu/main-loop.h b/include/qemu/main-loop.h<br>
index 68e70e61aa..596a206acd 100644<br>
--- a/include/qemu/main-loop.h<br>
+++ b/include/qemu/main-loop.h<br>
@@ -248,19 +248,19 @@ GSource *iohandler_get_g_source(void);<br>
=C2=A0AioContext *iohandler_get_aio_context(void);<br>
<br>
=C2=A0/**<br>
- * qemu_mutex_iothread_locked: Return lock status of the main loop mutex.<=
br>
+ * bql_locked: Return lock status of the Big QEMU Lock (BQL)<br>
=C2=A0 *<br>
- * The main loop mutex is the coarsest lock in QEMU, and as such it<br>
+ * The Big QEMU Lock (BQL) is the coarsest lock in QEMU, and as such it<br=
>
=C2=A0 * must always be taken outside other locks.=C2=A0 This function help=
s<br>
=C2=A0 * functions take different paths depending on whether the current<br=
>
- * thread is running within the main loop mutex.<br>
+ * thread is running within the BQL.<br>
=C2=A0 *<br>
=C2=A0 * This function should never be used in the block layer, because<br>
=C2=A0 * unit tests, block layer tools and qemu-storage-daemon do not<br>
=C2=A0 * have a BQL.<br>
=C2=A0 * Please instead refer to qemu_in_main_thread().<br>
=C2=A0 */<br>
-bool qemu_mutex_iothread_locked(void);<br>
+bool bql_locked(void);<br>
<br>
=C2=A0/**<br>
=C2=A0 * qemu_in_main_thread: return whether it&#39;s possible to safely ac=
cess<br>
@@ -312,58 +312,58 @@ bool qemu_in_main_thread(void);<br>
=C2=A0 =C2=A0 =C2=A0} while (0)<br>
<br>
=C2=A0/**<br>
- * qemu_mutex_lock_iothread: Lock the main loop mutex.<br>
+ * bql_lock: Lock the Big QEMU Lock (BQL).<br>
=C2=A0 *<br>
- * This function locks the main loop mutex.=C2=A0 The mutex is taken by<br=
>
+ * This function locks the Big QEMU Lock (BQL).=C2=A0 The lock is taken by=
<br>
=C2=A0 * main() in vl.c and always taken except while waiting on<br>
- * external events (such as with select).=C2=A0 The mutex should be taken<=
br>
+ * external events (such as with select).=C2=A0 The lock should be taken<b=
r>
=C2=A0 * by threads other than the main loop thread when calling<br>
=C2=A0 * qemu_bh_new(), qemu_set_fd_handler() and basically all other<br>
=C2=A0 * functions documented in this file.<br>
=C2=A0 *<br>
- * NOTE: tools currently are single-threaded and qemu_mutex_lock_iothread<=
br>
+ * NOTE: tools currently are single-threaded and bql_lock<br>
=C2=A0 * is a no-op there.<br>
=C2=A0 */<br>
-#define qemu_mutex_lock_iothread()=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \<br>
-=C2=A0 =C2=A0 qemu_mutex_lock_iothread_impl(__FILE__, __LINE__)<br>
-void qemu_mutex_lock_iothread_impl(const char *file, int line);<br>
+#define bql_lock()=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 \<br>
+=C2=A0 =C2=A0 bql_lock_impl(__FILE__, __LINE__)<br>
+void bql_lock_impl(const char *file, int line);<br>
<br>
=C2=A0/**<br>
- * qemu_mutex_unlock_iothread: Unlock the main loop mutex.<br>
+ * bql_unlock: Unlock the Big QEMU Lock (BQL).<br>
=C2=A0 *<br>
- * This function unlocks the main loop mutex.=C2=A0 The mutex is taken by<=
br>
+ * This function unlocks the Big QEMU Lock.=C2=A0 The lock is taken by<br>
=C2=A0 * main() in vl.c and always taken except while waiting on<br>
- * external events (such as with select).=C2=A0 The mutex should be unlock=
ed<br>
+ * external events (such as with select).=C2=A0 The lock should be unlocke=
d<br>
=C2=A0 * as soon as possible by threads other than the main loop thread,<br=
>
=C2=A0 * because it prevents the main loop from processing callbacks,<br>
=C2=A0 * including timers and bottom halves.<br>
=C2=A0 *<br>
- * NOTE: tools currently are single-threaded and qemu_mutex_unlock_iothrea=
d<br>
+ * NOTE: tools currently are single-threaded and bql_unlock<br>
=C2=A0 * is a no-op there.<br>
=C2=A0 */<br>
-void qemu_mutex_unlock_iothread(void);<br>
+void bql_unlock(void);<br>
<br>
=C2=A0/**<br>
=C2=A0 * QEMU_IOTHREAD_LOCK_GUARD<br>
=C2=A0 *<br>
- * Wrap a block of code in a conditional qemu_mutex_{lock,unlock}_iothread=
.<br>
+ * Wrap a block of code in a conditional bql_{lock,unlock}.<br>
=C2=A0 */<br>
=C2=A0typedef struct IOThreadLockAuto IOThreadLockAuto;<br>
<br>
=C2=A0static inline IOThreadLockAuto *qemu_iothread_auto_lock(const char *f=
ile,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0int line)<br>
=C2=A0{<br>
-=C2=A0 =C2=A0 if (qemu_mutex_iothread_locked()) {<br>
+=C2=A0 =C2=A0 if (bql_locked()) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return NULL;<br>
=C2=A0 =C2=A0 =C2=A0}<br>
-=C2=A0 =C2=A0 qemu_mutex_lock_iothread_impl(file, line);<br>
+=C2=A0 =C2=A0 bql_lock_impl(file, line);<br>
=C2=A0 =C2=A0 =C2=A0/* Anything non-NULL causes the cleanup function to be =
called */<br>
=C2=A0 =C2=A0 =C2=A0return (IOThreadLockAuto *)(uintptr_t)1;<br>
=C2=A0}<br>
<br>
=C2=A0static inline void qemu_iothread_auto_unlock(IOThreadLockAuto *l)<br>
=C2=A0{<br>
-=C2=A0 =C2=A0 qemu_mutex_unlock_iothread();<br>
+=C2=A0 =C2=A0 bql_unlock();<br>
=C2=A0}<br>
<br>
=C2=A0G_DEFINE_AUTOPTR_CLEANUP_FUNC(IOThreadLockAuto, qemu_iothread_auto_un=
lock)<br>
diff --git a/include/qemu/thread.h b/include/qemu/thread.h<br>
index dd3822d7ce..fb74e21c08 100644<br>
--- a/include/qemu/thread.h<br>
+++ b/include/qemu/thread.h<br>
@@ -47,7 +47,7 @@ typedef void (*QemuCondWaitFunc)(QemuCond *c, QemuMutex *=
m, const char *f,<br>
=C2=A0typedef bool (*QemuCondTimedWaitFunc)(QemuCond *c, QemuMutex *m, int =
ms,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0const cha=
r *f, int l);<br>
<br>
-extern QemuMutexLockFunc qemu_bql_mutex_lock_func;<br>
+extern QemuMutexLockFunc bql_mutex_lock_func;<br>
=C2=A0extern QemuMutexLockFunc qemu_mutex_lock_func;<br>
=C2=A0extern QemuMutexTrylockFunc qemu_mutex_trylock_func;<br>
=C2=A0extern QemuRecMutexLockFunc qemu_rec_mutex_lock_func;<br>
diff --git a/accel/accel-blocker.c b/accel/accel-blocker.c<br>
index 1e7f423462..e083f24aa8 100644<br>
--- a/accel/accel-blocker.c<br>
+++ b/accel/accel-blocker.c<br>
@@ -41,7 +41,7 @@ void accel_blocker_init(void)<br>
<br>
=C2=A0void accel_ioctl_begin(void)<br>
=C2=A0{<br>
-=C2=A0 =C2=A0 if (likely(qemu_mutex_iothread_locked())) {<br>
+=C2=A0 =C2=A0 if (likely(bql_locked())) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return;<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
@@ -51,7 +51,7 @@ void accel_ioctl_begin(void)<br>
<br>
=C2=A0void accel_ioctl_end(void)<br>
=C2=A0{<br>
-=C2=A0 =C2=A0 if (likely(qemu_mutex_iothread_locked())) {<br>
+=C2=A0 =C2=A0 if (likely(bql_locked())) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return;<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
@@ -62,7 +62,7 @@ void accel_ioctl_end(void)<br>
<br>
=C2=A0void accel_cpu_ioctl_begin(CPUState *cpu)<br>
=C2=A0{<br>
-=C2=A0 =C2=A0 if (unlikely(qemu_mutex_iothread_locked())) {<br>
+=C2=A0 =C2=A0 if (unlikely(bql_locked())) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return;<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
@@ -72,7 +72,7 @@ void accel_cpu_ioctl_begin(CPUState *cpu)<br>
<br>
=C2=A0void accel_cpu_ioctl_end(CPUState *cpu)<br>
=C2=A0{<br>
-=C2=A0 =C2=A0 if (unlikely(qemu_mutex_iothread_locked())) {<br>
+=C2=A0 =C2=A0 if (unlikely(bql_locked())) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return;<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
@@ -105,7 +105,7 @@ void accel_ioctl_inhibit_begin(void)<br>
=C2=A0 =C2=A0 =C2=A0 * We allow to inhibit only when holding the BQL, so we=
 can identify<br>
=C2=A0 =C2=A0 =C2=A0 * when an inhibitor wants to issue an ioctl easily.<br=
>
=C2=A0 =C2=A0 =C2=A0 */<br>
-=C2=A0 =C2=A0 g_assert(qemu_mutex_iothread_locked());<br>
+=C2=A0 =C2=A0 g_assert(bql_locked());<br>
<br>
=C2=A0 =C2=A0 =C2=A0/* Block further invocations of the ioctls outside the =
BQL.=C2=A0 */<br>
=C2=A0 =C2=A0 =C2=A0CPU_FOREACH(cpu) {<br>
diff --git a/accel/dummy-cpus.c b/accel/dummy-cpus.c<br>
index b75c919ac3..f4b0ec5890 100644<br>
--- a/accel/dummy-cpus.c<br>
+++ b/accel/dummy-cpus.c<br>
@@ -24,7 +24,7 @@ static void *dummy_cpu_thread_fn(void *arg)<br>
<br>
=C2=A0 =C2=A0 =C2=A0rcu_register_thread();<br>
<br>
-=C2=A0 =C2=A0 qemu_mutex_lock_iothread();<br>
+=C2=A0 =C2=A0 bql_lock();<br>
=C2=A0 =C2=A0 =C2=A0qemu_thread_get_self(cpu-&gt;thread);<br>
=C2=A0 =C2=A0 =C2=A0cpu-&gt;thread_id =3D qemu_get_thread_id();<br>
=C2=A0 =C2=A0 =C2=A0cpu-&gt;neg.can_do_io =3D true;<br>
@@ -43,7 +43,7 @@ static void *dummy_cpu_thread_fn(void *arg)<br>
=C2=A0 =C2=A0 =C2=A0qemu_guest_random_seed_thread_part2(cpu-&gt;random_seed=
);<br>
<br>
=C2=A0 =C2=A0 =C2=A0do {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_mutex_unlock_iothread();<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 bql_unlock();<br>
=C2=A0#ifndef _WIN32<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0do {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0int sig;<br>
@@ -56,11 +56,11 @@ static void *dummy_cpu_thread_fn(void *arg)<br>
=C2=A0#else<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0qemu_sem_wait(&amp;cpu-&gt;sem);<br>
=C2=A0#endif<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_mutex_lock_iothread();<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 bql_lock();<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0qemu_wait_io_event(cpu);<br>
=C2=A0 =C2=A0 =C2=A0} while (!cpu-&gt;unplug);<br>
<br>
-=C2=A0 =C2=A0 qemu_mutex_unlock_iothread();<br>
+=C2=A0 =C2=A0 bql_unlock();<br>
=C2=A0 =C2=A0 =C2=A0rcu_unregister_thread();<br>
=C2=A0 =C2=A0 =C2=A0return NULL;<br>
=C2=A0}<br>
diff --git a/accel/hvf/hvf-accel-ops.c b/accel/hvf/hvf-accel-ops.c<br>
index abe7adf7ee..8eabb696fa 100644<br>
--- a/accel/hvf/hvf-accel-ops.c<br>
+++ b/accel/hvf/hvf-accel-ops.c<br>
@@ -424,7 +424,7 @@ static void *hvf_cpu_thread_fn(void *arg)<br>
<br>
=C2=A0 =C2=A0 =C2=A0rcu_register_thread();<br>
<br>
-=C2=A0 =C2=A0 qemu_mutex_lock_iothread();<br>
+=C2=A0 =C2=A0 bql_lock();<br>
=C2=A0 =C2=A0 =C2=A0qemu_thread_get_self(cpu-&gt;thread);<br>
<br>
=C2=A0 =C2=A0 =C2=A0cpu-&gt;thread_id =3D qemu_get_thread_id();<br>
@@ -449,7 +449,7 @@ static void *hvf_cpu_thread_fn(void *arg)<br>
<br>
=C2=A0 =C2=A0 =C2=A0hvf_vcpu_destroy(cpu);<br>
=C2=A0 =C2=A0 =C2=A0cpu_thread_signal_destroyed(cpu);<br>
-=C2=A0 =C2=A0 qemu_mutex_unlock_iothread();<br>
+=C2=A0 =C2=A0 bql_unlock();<br>
=C2=A0 =C2=A0 =C2=A0rcu_unregister_thread();<br>
=C2=A0 =C2=A0 =C2=A0return NULL;<br>
=C2=A0}<br>
diff --git a/accel/kvm/kvm-accel-ops.c b/accel/kvm/kvm-accel-ops.c<br>
index 6195150a0b..45ff06e953 100644<br>
--- a/accel/kvm/kvm-accel-ops.c<br>
+++ b/accel/kvm/kvm-accel-ops.c<br>
@@ -33,7 +33,7 @@ static void *kvm_vcpu_thread_fn(void *arg)<br>
<br>
=C2=A0 =C2=A0 =C2=A0rcu_register_thread();<br>
<br>
-=C2=A0 =C2=A0 qemu_mutex_lock_iothread();<br>
+=C2=A0 =C2=A0 bql_lock();<br>
=C2=A0 =C2=A0 =C2=A0qemu_thread_get_self(cpu-&gt;thread);<br>
=C2=A0 =C2=A0 =C2=A0cpu-&gt;thread_id =3D qemu_get_thread_id();<br>
=C2=A0 =C2=A0 =C2=A0cpu-&gt;neg.can_do_io =3D true;<br>
@@ -58,7 +58,7 @@ static void *kvm_vcpu_thread_fn(void *arg)<br>
<br>
=C2=A0 =C2=A0 =C2=A0kvm_destroy_vcpu(cpu);<br>
=C2=A0 =C2=A0 =C2=A0cpu_thread_signal_destroyed(cpu);<br>
-=C2=A0 =C2=A0 qemu_mutex_unlock_iothread();<br>
+=C2=A0 =C2=A0 bql_unlock();<br>
=C2=A0 =C2=A0 =C2=A0rcu_unregister_thread();<br>
=C2=A0 =C2=A0 =C2=A0return NULL;<br>
=C2=A0}<br>
diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c<br>
index e39a810a4e..09404b897f 100644<br>
--- a/accel/kvm/kvm-all.c<br>
+++ b/accel/kvm/kvm-all.c<br>
@@ -817,7 +817,7 @@ static void kvm_dirty_ring_flush(void)<br>
=C2=A0 =C2=A0 =C2=A0 * should always be with BQL held, serialization is gua=
ranteed.<br>
=C2=A0 =C2=A0 =C2=A0 * However, let&#39;s be sure of it.<br>
=C2=A0 =C2=A0 =C2=A0 */<br>
-=C2=A0 =C2=A0 assert(qemu_mutex_iothread_locked());<br>
+=C2=A0 =C2=A0 assert(bql_locked());<br>
=C2=A0 =C2=A0 =C2=A0/*<br>
=C2=A0 =C2=A0 =C2=A0 * First make sure to flush the hardware buffers by kic=
king all<br>
=C2=A0 =C2=A0 =C2=A0 * vcpus out in a synchronous way.<br>
@@ -1402,9 +1402,9 @@ static void *kvm_dirty_ring_reaper_thread(void *data)=
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0trace_kvm_dirty_ring_reaper(&quot;wakeup&=
quot;);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0r-&gt;reaper_state =3D KVM_DIRTY_RING_REA=
PER_REAPING;<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_mutex_lock_iothread();<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 bql_lock();<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0kvm_dirty_ring_reap(s, NULL);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_mutex_unlock_iothread();<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 bql_unlock();<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0r-&gt;reaper_iteration++;<br>
=C2=A0 =C2=A0 =C2=A0}<br>
@@ -2828,7 +2828,7 @@ int kvm_cpu_exec(CPUState *cpu)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return EXCP_HLT;<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
-=C2=A0 =C2=A0 qemu_mutex_unlock_iothread();<br>
+=C2=A0 =C2=A0 bql_unlock();<br>
=C2=A0 =C2=A0 =C2=A0cpu_exec_start(cpu);<br>
<br>
=C2=A0 =C2=A0 =C2=A0do {<br>
@@ -2868,11 +2868,11 @@ int kvm_cpu_exec(CPUState *cpu)<br>
<br>
=C2=A0#ifdef KVM_HAVE_MCE_INJECTION<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (unlikely(have_sigbus_pending)) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_mutex_lock_iothread();<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bql_lock();<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0kvm_arch_on_sigbus_vcpu(cpu=
, pending_sigbus_code,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pending_sigbus_a=
ddr);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0have_sigbus_pending =3D fal=
se;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_mutex_unlock_iothread();<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bql_unlock();<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0#endif<br>
<br>
@@ -2942,7 +2942,7 @@ int kvm_cpu_exec(CPUState *cpu)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * still full.=C2=A0 Got ki=
cked by KVM_RESET_DIRTY_RINGS.<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0trace_kvm_dirty_ring_full(c=
pu-&gt;cpu_index);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_mutex_lock_iothread();<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bql_lock();<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/*<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * We throttle vCPU by maki=
ng it sleep once it exit from kernel<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * due to dirty ring full. =
In the dirtylimit scenario, reaping<br>
@@ -2954,7 +2954,7 @@ int kvm_cpu_exec(CPUState *cpu)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0} else {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0kvm_dirty_rin=
g_reap(kvm_state, NULL);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_mutex_unlock_iothread();<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bql_unlock();<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dirtylimit_vcpu_execute(cpu=
);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D 0;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
@@ -2970,9 +2970,9 @@ int kvm_cpu_exec(CPUState *cpu)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0case KVM_SYSTEM_EVENT_CRASH=
:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0kvm_cpu_synch=
ronize_state(cpu);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_mutex_lock_io=
thread();<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bql_lock();<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0qemu_system_g=
uest_panicked(cpu_get_crash_info(cpu));<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_mutex_unlock_=
iothread();<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bql_unlock();<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D 0;<br=
>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0default:<br>
@@ -2989,7 +2989,7 @@ int kvm_cpu_exec(CPUState *cpu)<br>
=C2=A0 =C2=A0 =C2=A0} while (ret =3D=3D 0);<br>
<br>
=C2=A0 =C2=A0 =C2=A0cpu_exec_end(cpu);<br>
-=C2=A0 =C2=A0 qemu_mutex_lock_iothread();<br>
+=C2=A0 =C2=A0 bql_lock();<br>
<br>
=C2=A0 =C2=A0 =C2=A0if (ret &lt; 0) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cpu_dump_state(cpu, stderr, CPU_DUMP_CODE=
);<br>
diff --git a/accel/tcg/cpu-exec.c b/accel/tcg/cpu-exec.c<br>
index c938eb96f8..67eda9865e 100644<br>
--- a/accel/tcg/cpu-exec.c<br>
+++ b/accel/tcg/cpu-exec.c<br>
@@ -558,8 +558,8 @@ static void cpu_exec_longjmp_cleanup(CPUState *cpu)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tcg_ctx-&gt;gen_tb =3D NULL;<br>
=C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0#endif<br>
-=C2=A0 =C2=A0 if (qemu_mutex_iothread_locked()) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_mutex_unlock_iothread();<br>
+=C2=A0 =C2=A0 if (bql_locked()) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 bql_unlock();<br>
=C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0assert_no_pages_locked();<br>
=C2=A0}<br>
@@ -680,10 +680,10 @@ static inline bool cpu_handle_halt(CPUState *cpu)<br>
=C2=A0#if defined(TARGET_I386)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (cpu-&gt;interrupt_request &amp; CPU_I=
NTERRUPT_POLL) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0X86CPU *x86_cpu =3D X86_CPU=
(cpu);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_mutex_lock_iothread();<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bql_lock();<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0apic_poll_irq(x86_cpu-&gt;a=
pic_state);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cpu_reset_interrupt(cpu, CP=
U_INTERRUPT_POLL);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_mutex_unlock_iothread();<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bql_unlock();<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0#endif /* TARGET_I386 */<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!cpu_has_work(cpu)) {<br>
@@ -749,9 +749,9 @@ static inline bool cpu_handle_exception(CPUState *cpu, =
int *ret)<br>
=C2=A0#else<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (replay_exception()) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0CPUClass *cc =3D CPU_GET_CL=
ASS(cpu);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_mutex_lock_iothread();<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bql_lock();<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cc-&gt;tcg_ops-&gt;do_inter=
rupt(cpu);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_mutex_unlock_iothread();<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bql_unlock();<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cpu-&gt;exception_index =3D=
 -1;<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (unlikely(cpu-&gt;single=
step_enabled)) {<br>
@@ -812,7 +812,7 @@ static inline bool cpu_handle_interrupt(CPUState *cpu,<=
br>
<br>
=C2=A0 =C2=A0 =C2=A0if (unlikely(qatomic_read(&amp;cpu-&gt;interrupt_reques=
t))) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0int interrupt_request;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_mutex_lock_iothread();<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 bql_lock();<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0interrupt_request =3D cpu-&gt;interrupt_r=
equest;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (unlikely(cpu-&gt;singlestep_enabled &=
amp; SSTEP_NOIRQ)) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* Mask out external interr=
upts for this step. */<br>
@@ -821,7 +821,7 @@ static inline bool cpu_handle_interrupt(CPUState *cpu,<=
br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (interrupt_request &amp; CPU_INTERRUPT=
_DEBUG) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cpu-&gt;interrupt_request &=
amp;=3D ~CPU_INTERRUPT_DEBUG;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cpu-&gt;exception_index =3D=
 EXCP_DEBUG;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_mutex_unlock_iothread();<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bql_unlock();<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return true;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0#if !defined(CONFIG_USER_ONLY)<br>
@@ -832,7 +832,7 @@ static inline bool cpu_handle_interrupt(CPUState *cpu,<=
br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cpu-&gt;interrupt_request &=
amp;=3D ~CPU_INTERRUPT_HALT;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cpu-&gt;halted =3D 1;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cpu-&gt;exception_index =3D=
 EXCP_HLT;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_mutex_unlock_iothread();<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bql_unlock();<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return true;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0#if defined(TARGET_I386)<br>
@@ -843,14 +843,14 @@ static inline bool cpu_handle_interrupt(CPUState *cpu=
,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cpu_svm_check_intercept_par=
am(env, SVM_EXIT_INIT, 0, 0);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0do_cpu_init(x86_cpu);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cpu-&gt;exception_index =3D=
 EXCP_HALTED;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_mutex_unlock_iothread();<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bql_unlock();<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return true;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0#else<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0else if (interrupt_request &amp; CPU_INTE=
RRUPT_RESET) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0replay_interrupt();<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cpu_reset(cpu);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_mutex_unlock_iothread();<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bql_unlock();<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return true;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0#endif /* !TARGET_I386 */<br>
@@ -873,7 +873,7 @@ static inline bool cpu_handle_interrupt(CPUState *cpu,<=
br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (unlikely(=
cpu-&gt;singlestep_enabled)) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0cpu-&gt;exception_index =3D EXCP_DEBUG;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu=
_mutex_unlock_iothread();<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bql_=
unlock();<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0return true;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cpu-&gt;excep=
tion_index =3D -1;<br>
@@ -892,7 +892,7 @@ static inline bool cpu_handle_interrupt(CPUState *cpu,<=
br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* If we exit via cpu_loop_exit/longjmp i=
t is reset in cpu_exec */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_mutex_unlock_iothread();<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 bql_unlock();<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
=C2=A0 =C2=A0 =C2=A0/* Finally, check if we need to exit to the main loop.=
=C2=A0 */<br>
diff --git a/accel/tcg/cputlb.c b/accel/tcg/cputlb.c<br>
index db3f93fda9..5698a9fd8e 100644<br>
--- a/accel/tcg/cputlb.c<br>
+++ b/accel/tcg/cputlb.c<br>
@@ -2030,10 +2030,10 @@ static uint64_t do_ld_mmio_beN(CPUState *cpu, CPUTL=
BEntryFull *full,<br>
=C2=A0 =C2=A0 =C2=A0section =3D io_prepare(&amp;mr_offset, cpu, full-&gt;xl=
at_section, attrs, addr, ra);<br>
=C2=A0 =C2=A0 =C2=A0mr =3D section-&gt;mr;<br>
<br>
-=C2=A0 =C2=A0 qemu_mutex_lock_iothread();<br>
+=C2=A0 =C2=A0 bql_lock();<br>
=C2=A0 =C2=A0 =C2=A0ret =3D int_ld_mmio_beN(cpu, full, ret_be, addr, size, =
mmu_idx,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0type, ra, mr, mr_offset);<br>
-=C2=A0 =C2=A0 qemu_mutex_unlock_iothread();<br>
+=C2=A0 =C2=A0 bql_unlock();<br>
<br>
=C2=A0 =C2=A0 =C2=A0return ret;<br>
=C2=A0}<br>
@@ -2054,12 +2054,12 @@ static Int128 do_ld16_mmio_beN(CPUState *cpu, CPUTL=
BEntryFull *full,<br>
=C2=A0 =C2=A0 =C2=A0section =3D io_prepare(&amp;mr_offset, cpu, full-&gt;xl=
at_section, attrs, addr, ra);<br>
=C2=A0 =C2=A0 =C2=A0mr =3D section-&gt;mr;<br>
<br>
-=C2=A0 =C2=A0 qemu_mutex_lock_iothread();<br>
+=C2=A0 =C2=A0 bql_lock();<br>
=C2=A0 =C2=A0 =C2=A0a =3D int_ld_mmio_beN(cpu, full, ret_be, addr, size - 8=
, mmu_idx,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0MMU_DATA_LOAD, ra, mr, mr_offset);<br>
=C2=A0 =C2=A0 =C2=A0b =3D int_ld_mmio_beN(cpu, full, ret_be, addr + size - =
8, 8, mmu_idx,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0MMU_DATA_LOAD, ra, mr, mr_offset + size - 8);<br>
-=C2=A0 =C2=A0 qemu_mutex_unlock_iothread();<br>
+=C2=A0 =C2=A0 bql_unlock();<br>
<br>
=C2=A0 =C2=A0 =C2=A0return int128_make128(b, a);<br>
=C2=A0}<br>
@@ -2577,10 +2577,10 @@ static uint64_t do_st_mmio_leN(CPUState *cpu, CPUTL=
BEntryFull *full,<br>
=C2=A0 =C2=A0 =C2=A0section =3D io_prepare(&amp;mr_offset, cpu, full-&gt;xl=
at_section, attrs, addr, ra);<br>
=C2=A0 =C2=A0 =C2=A0mr =3D section-&gt;mr;<br>
<br>
-=C2=A0 =C2=A0 qemu_mutex_lock_iothread();<br>
+=C2=A0 =C2=A0 bql_lock();<br>
=C2=A0 =C2=A0 =C2=A0ret =3D int_st_mmio_leN(cpu, full, val_le, addr, size, =
mmu_idx,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0ra, mr, mr_offset);<br>
-=C2=A0 =C2=A0 qemu_mutex_unlock_iothread();<br>
+=C2=A0 =C2=A0 bql_unlock();<br>
<br>
=C2=A0 =C2=A0 =C2=A0return ret;<br>
=C2=A0}<br>
@@ -2601,12 +2601,12 @@ static uint64_t do_st16_mmio_leN(CPUState *cpu, CPU=
TLBEntryFull *full,<br>
=C2=A0 =C2=A0 =C2=A0section =3D io_prepare(&amp;mr_offset, cpu, full-&gt;xl=
at_section, attrs, addr, ra);<br>
=C2=A0 =C2=A0 =C2=A0mr =3D section-&gt;mr;<br>
<br>
-=C2=A0 =C2=A0 qemu_mutex_lock_iothread();<br>
+=C2=A0 =C2=A0 bql_lock();<br>
=C2=A0 =C2=A0 =C2=A0int_st_mmio_leN(cpu, full, int128_getlo(val_le), addr, =
8,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0mmu_idx, ra, mr, mr_offset);<br>
=C2=A0 =C2=A0 =C2=A0ret =3D int_st_mmio_leN(cpu, full, int128_gethi(val_le)=
, addr + 8,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0size - 8, mmu_idx, ra, mr, mr_offset + 8);<br>
-=C2=A0 =C2=A0 qemu_mutex_unlock_iothread();<br>
+=C2=A0 =C2=A0 bql_unlock();<br>
<br>
=C2=A0 =C2=A0 =C2=A0return ret;<br>
=C2=A0}<br>
diff --git a/accel/tcg/tcg-accel-ops-icount.c b/accel/tcg/tcg-accel-ops-ico=
unt.c<br>
index b25685fb71..5824d92580 100644<br>
--- a/accel/tcg/tcg-accel-ops-icount.c<br>
+++ b/accel/tcg/tcg-accel-ops-icount.c<br>
@@ -126,9 +126,9 @@ void icount_prepare_for_run(CPUState *cpu, int64_t cpu_=
budget)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * We&#39;re called without the iothread =
lock, so must take it while<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * we&#39;re calling timer handlers.<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_mutex_lock_iothread();<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 bql_lock();<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0icount_notify_aio_contexts();<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_mutex_unlock_iothread();<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 bql_unlock();<br>
=C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0}<br>
<br>
diff --git a/accel/tcg/tcg-accel-ops-mttcg.c b/accel/tcg/tcg-accel-ops-mttc=
g.c<br>
index fac80095bb..af7307013a 100644<br>
--- a/accel/tcg/tcg-accel-ops-mttcg.c<br>
+++ b/accel/tcg/tcg-accel-ops-mttcg.c<br>
@@ -76,7 +76,7 @@ static void *mttcg_cpu_thread_fn(void *arg)<br>
=C2=A0 =C2=A0 =C2=A0rcu_add_force_rcu_notifier(&amp;force_rcu.notifier);<br=
>
=C2=A0 =C2=A0 =C2=A0tcg_register_thread();<br>
<br>
-=C2=A0 =C2=A0 qemu_mutex_lock_iothread();<br>
+=C2=A0 =C2=A0 bql_lock();<br>
=C2=A0 =C2=A0 =C2=A0qemu_thread_get_self(cpu-&gt;thread);<br>
<br>
=C2=A0 =C2=A0 =C2=A0cpu-&gt;thread_id =3D qemu_get_thread_id();<br>
@@ -91,9 +91,9 @@ static void *mttcg_cpu_thread_fn(void *arg)<br>
=C2=A0 =C2=A0 =C2=A0do {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (cpu_can_run(cpu)) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0int r;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_mutex_unlock_iothread();<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bql_unlock();<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0r =3D tcg_cpus_exec(cpu);<b=
r>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_mutex_lock_iothread();<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bql_lock();<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0switch (r) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0case EXCP_DEBUG:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cpu_handle_gu=
est_debug(cpu);<br>
@@ -105,9 +105,9 @@ static void *mttcg_cpu_thread_fn(void *arg)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0case EXCP_ATOMIC:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_mutex_unlock_=
iothread();<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bql_unlock();<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cpu_exec_step=
_atomic(cpu);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_mutex_lock_io=
thread();<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bql_lock();<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0default:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* Ignore eve=
rything else? */<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
@@ -119,7 +119,7 @@ static void *mttcg_cpu_thread_fn(void *arg)<br>
=C2=A0 =C2=A0 =C2=A0} while (!cpu-&gt;unplug || cpu_can_run(cpu));<br>
<br>
=C2=A0 =C2=A0 =C2=A0tcg_cpus_destroy(cpu);<br>
-=C2=A0 =C2=A0 qemu_mutex_unlock_iothread();<br>
+=C2=A0 =C2=A0 bql_unlock();<br>
=C2=A0 =C2=A0 =C2=A0rcu_remove_force_rcu_notifier(&amp;force_rcu.notifier);=
<br>
=C2=A0 =C2=A0 =C2=A0rcu_unregister_thread();<br>
=C2=A0 =C2=A0 =C2=A0return NULL;<br>
diff --git a/accel/tcg/tcg-accel-ops-rr.c b/accel/tcg/tcg-accel-ops-rr.c<br=
>
index 611932f3c3..c4ea372a3f 100644<br>
--- a/accel/tcg/tcg-accel-ops-rr.c<br>
+++ b/accel/tcg/tcg-accel-ops-rr.c<br>
@@ -188,7 +188,7 @@ static void *rr_cpu_thread_fn(void *arg)<br>
=C2=A0 =C2=A0 =C2=A0rcu_add_force_rcu_notifier(&amp;force_rcu);<br>
=C2=A0 =C2=A0 =C2=A0tcg_register_thread();<br>
<br>
-=C2=A0 =C2=A0 qemu_mutex_lock_iothread();<br>
+=C2=A0 =C2=A0 bql_lock();<br>
=C2=A0 =C2=A0 =C2=A0qemu_thread_get_self(cpu-&gt;thread);<br>
<br>
=C2=A0 =C2=A0 =C2=A0cpu-&gt;thread_id =3D qemu_get_thread_id();<br>
@@ -218,9 +218,9 @@ static void *rr_cpu_thread_fn(void *arg)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* Only used for icount_enabled() */<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0int64_t cpu_budget =3D 0;<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_mutex_unlock_iothread();<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 bql_unlock();<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0replay_mutex_lock();<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_mutex_lock_iothread();<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 bql_lock();<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (icount_enabled()) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0int cpu_count =3D rr_cpu_co=
unt();<br>
@@ -254,7 +254,7 @@ static void *rr_cpu_thread_fn(void *arg)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (cpu_can_run(cpu)) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0int r;<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_mutex_unlock_=
iothread();<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bql_unlock();<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (icount_en=
abled()) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0icount_prepare_for_run(cpu, cpu_budget);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
@@ -262,15 +262,15 @@ static void *rr_cpu_thread_fn(void *arg)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (icount_en=
abled()) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0icount_process_data(cpu);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_mutex_lock_io=
thread();<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bql_lock();<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (r =3D=3D =
EXCP_DEBUG) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0cpu_handle_guest_debug(cpu);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0break;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0} else if (r =
=3D=3D EXCP_ATOMIC) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu=
_mutex_unlock_iothread();<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bql_=
unlock();<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0cpu_exec_step_atomic(cpu);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu=
_mutex_lock_iothread();<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bql_=
lock();<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0break;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0} else if (cpu-&gt;stop) {<=
br>
diff --git a/accel/tcg/tcg-accel-ops.c b/accel/tcg/tcg-accel-ops.c<br>
index 1b57290682..813065c0ec 100644<br>
--- a/accel/tcg/tcg-accel-ops.c<br>
+++ b/accel/tcg/tcg-accel-ops.c<br>
@@ -88,7 +88,7 @@ static void tcg_cpu_reset_hold(CPUState *cpu)<br>
=C2=A0/* mask must never be zero, except for A20 change call */<br>
=C2=A0void tcg_handle_interrupt(CPUState *cpu, int mask)<br>
=C2=A0{<br>
-=C2=A0 =C2=A0 g_assert(qemu_mutex_iothread_locked());<br>
+=C2=A0 =C2=A0 g_assert(bql_locked());<br>
<br>
=C2=A0 =C2=A0 =C2=A0cpu-&gt;interrupt_request |=3D mask;<br>
<br>
diff --git a/accel/tcg/translate-all.c b/accel/tcg/translate-all.c<br>
index 79a88f5fb7..1737bb3da5 100644<br>
--- a/accel/tcg/translate-all.c<br>
+++ b/accel/tcg/translate-all.c<br>
@@ -649,7 +649,7 @@ void cpu_io_recompile(CPUState *cpu, uintptr_t retaddr)=
<br>
<br>
=C2=A0void cpu_interrupt(CPUState *cpu, int mask)<br>
=C2=A0{<br>
-=C2=A0 =C2=A0 g_assert(qemu_mutex_iothread_locked());<br>
+=C2=A0 =C2=A0 g_assert(bql_locked());<br>
=C2=A0 =C2=A0 =C2=A0cpu-&gt;interrupt_request |=3D mask;<br>
=C2=A0 =C2=A0 =C2=A0qatomic_set(&amp;cpu-&gt;neg.icount_decr.u16.high, -1);=
<br>
=C2=A0}<br>
diff --git a/cpu-common.c b/cpu-common.c<br>
index c81fd72d16..ce78273af5 100644<br>
--- a/cpu-common.c<br>
+++ b/cpu-common.c<br>
@@ -351,11 +351,11 @@ void process_queued_cpu_work(CPUState *cpu)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * BQL, so it goes to sleep=
; start_exclusive() is sleeping too, so<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * neither CPU can proceed.=
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_mutex_unlock_iothread();<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bql_unlock();<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0start_exclusive();<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0wi-&gt;func(cpu, wi-&gt;dat=
a);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0end_exclusive();<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_mutex_lock_iothread();<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bql_lock();<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0} else {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0wi-&gt;func(cpu, wi-&gt;dat=
a);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
diff --git a/dump/dump.c b/dump/dump.c<br>
index 4819050764..84064d890d 100644<br>
--- a/dump/dump.c<br>
+++ b/dump/dump.c<br>
@@ -108,11 +108,11 @@ static int dump_cleanup(DumpState *s)<br>
=C2=A0 =C2=A0 =C2=A0s-&gt;guest_note =3D NULL;<br>
=C2=A0 =C2=A0 =C2=A0if (s-&gt;resume) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (s-&gt;detached) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_mutex_lock_iothread();<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bql_lock();<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0vm_start();<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (s-&gt;detached) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_mutex_unlock_iothread();<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bql_unlock();<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0migrate_del_blocker(&amp;dump_migration_blocker);<br>
diff --git a/hw/core/cpu-common.c b/hw/core/cpu-common.c<br>
index 82dae51a55..a59e2ce645 100644<br>
--- a/hw/core/cpu-common.c<br>
+++ b/hw/core/cpu-common.c<br>
@@ -70,14 +70,14 @@ CPUState *cpu_create(const char *typename)<br>
=C2=A0 * BQL here if we need to.=C2=A0 cpu_interrupt assumes it is held.*/<=
br>
=C2=A0void cpu_reset_interrupt(CPUState *cpu, int mask)<br>
=C2=A0{<br>
-=C2=A0 =C2=A0 bool need_lock =3D !qemu_mutex_iothread_locked();<br>
+=C2=A0 =C2=A0 bool need_lock =3D !bql_locked();<br>
<br>
=C2=A0 =C2=A0 =C2=A0if (need_lock) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_mutex_lock_iothread();<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 bql_lock();<br>
=C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0cpu-&gt;interrupt_request &amp;=3D ~mask;<br>
=C2=A0 =C2=A0 =C2=A0if (need_lock) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_mutex_unlock_iothread();<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 bql_unlock();<br>
=C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0}<br>
<br>
diff --git a/hw/i386/intel_iommu.c b/hw/i386/intel_iommu.c<br>
index 5085a6fee3..7e310109cf 100644<br>
--- a/hw/i386/intel_iommu.c<br>
+++ b/hw/i386/intel_iommu.c<br>
@@ -1665,7 +1665,7 @@ static bool vtd_switch_address_space(VTDAddressSpace =
*as)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0bool use_iommu, pt;<br>
=C2=A0 =C2=A0 =C2=A0/* Whether we need to take the BQL on our own */<br>
-=C2=A0 =C2=A0 bool take_bql =3D !qemu_mutex_iothread_locked();<br>
+=C2=A0 =C2=A0 bool take_bql =3D !bql_locked();<br>
<br>
=C2=A0 =C2=A0 =C2=A0assert(as);<br>
<br>
@@ -1683,7 +1683,7 @@ static bool vtd_switch_address_space(VTDAddressSpace =
*as)<br>
=C2=A0 =C2=A0 =C2=A0 * it. We&#39;d better make sure we have had it already=
, or, take it.<br>
=C2=A0 =C2=A0 =C2=A0 */<br>
=C2=A0 =C2=A0 =C2=A0if (take_bql) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_mutex_lock_iothread();<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 bql_lock();<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
=C2=A0 =C2=A0 =C2=A0/* Turn off first then on the other */<br>
@@ -1738,7 +1738,7 @@ static bool vtd_switch_address_space(VTDAddressSpace =
*as)<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
=C2=A0 =C2=A0 =C2=A0if (take_bql) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_mutex_unlock_iothread();<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 bql_unlock();<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
=C2=A0 =C2=A0 =C2=A0return use_iommu;<br>
diff --git a/hw/i386/kvm/xen_evtchn.c b/hw/i386/kvm/xen_evtchn.c<br>
index 02b8cbf8df..d7d15cfaf7 100644<br>
--- a/hw/i386/kvm/xen_evtchn.c<br>
+++ b/hw/i386/kvm/xen_evtchn.c<br>
@@ -425,7 +425,7 @@ void xen_evtchn_set_callback_level(int level)<br>
=C2=A0 =C2=A0 =C2=A0 * effect immediately. That just leaves interdomain loo=
pback as the case<br>
=C2=A0 =C2=A0 =C2=A0 * which uses the BH.<br>
=C2=A0 =C2=A0 =C2=A0 */<br>
-=C2=A0 =C2=A0 if (!qemu_mutex_iothread_locked()) {<br>
+=C2=A0 =C2=A0 if (!bql_locked()) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0qemu_bh_schedule(s-&gt;gsi_bh);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return;<br>
=C2=A0 =C2=A0 =C2=A0}<br>
@@ -459,7 +459,7 @@ int xen_evtchn_set_callback_param(uint64_t param)<br>
=C2=A0 =C2=A0 =C2=A0 * We need the BQL because set_callback_pci_intx() may =
call into PCI code,<br>
=C2=A0 =C2=A0 =C2=A0 * and because we may need to manipulate the old and ne=
w GSI levels.<br>
=C2=A0 =C2=A0 =C2=A0 */<br>
-=C2=A0 =C2=A0 assert(qemu_mutex_iothread_locked());<br>
+=C2=A0 =C2=A0 assert(bql_locked());<br>
=C2=A0 =C2=A0 =C2=A0qemu_mutex_lock(&amp;s-&gt;port_lock);<br>
<br>
=C2=A0 =C2=A0 =C2=A0switch (type) {<br>
@@ -1037,7 +1037,7 @@ static int close_port(XenEvtchnState *s, evtchn_port_=
t port,<br>
=C2=A0 =C2=A0 =C2=A0XenEvtchnPort *p =3D &amp;s-&gt;port_table[port];<br>
<br>
=C2=A0 =C2=A0 =C2=A0/* Because it *might* be a PIRQ port */<br>
-=C2=A0 =C2=A0 assert(qemu_mutex_iothread_locked());<br>
+=C2=A0 =C2=A0 assert(bql_locked());<br>
<br>
=C2=A0 =C2=A0 =C2=A0switch (p-&gt;type) {<br>
=C2=A0 =C2=A0 =C2=A0case EVTCHNSTAT_closed:<br>
@@ -1104,7 +1104,7 @@ int xen_evtchn_soft_reset(void)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -ENOTSUP;<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
-=C2=A0 =C2=A0 assert(qemu_mutex_iothread_locked());<br>
+=C2=A0 =C2=A0 assert(bql_locked());<br>
<br>
=C2=A0 =C2=A0 =C2=A0qemu_mutex_lock(&amp;s-&gt;port_lock);<br>
<br>
@@ -1601,7 +1601,7 @@ bool xen_evtchn_set_gsi(int gsi, int level)<br>
=C2=A0 =C2=A0 =C2=A0XenEvtchnState *s =3D xen_evtchn_singleton;<br>
=C2=A0 =C2=A0 =C2=A0int pirq;<br>
<br>
-=C2=A0 =C2=A0 assert(qemu_mutex_iothread_locked());<br>
+=C2=A0 =C2=A0 assert(bql_locked());<br>
<br>
=C2=A0 =C2=A0 =C2=A0if (!s || gsi &lt; 0 || gsi &gt;=3D IOAPIC_NUM_PINS) {<=
br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return false;<br>
@@ -1712,7 +1712,7 @@ void xen_evtchn_snoop_msi(PCIDevice *dev, bool is_msi=
x, unsigned int vector,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return;<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
-=C2=A0 =C2=A0 assert(qemu_mutex_iothread_locked());<br>
+=C2=A0 =C2=A0 assert(bql_locked());<br>
<br>
=C2=A0 =C2=A0 =C2=A0pirq =3D msi_pirq_target(addr, data);<br>
<br>
@@ -1749,7 +1749,7 @@ int xen_evtchn_translate_pirq_msi(struct kvm_irq_rout=
ing_entry *route,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return 1; /* Not a PIRQ */<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
-=C2=A0 =C2=A0 assert(qemu_mutex_iothread_locked());<br>
+=C2=A0 =C2=A0 assert(bql_locked());<br>
<br>
=C2=A0 =C2=A0 =C2=A0pirq =3D msi_pirq_target(address, data);<br>
=C2=A0 =C2=A0 =C2=A0if (!pirq || pirq &gt;=3D s-&gt;nr_pirqs) {<br>
@@ -1796,7 +1796,7 @@ bool xen_evtchn_deliver_pirq_msi(uint64_t address, ui=
nt32_t data)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return false;<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
-=C2=A0 =C2=A0 assert(qemu_mutex_iothread_locked());<br>
+=C2=A0 =C2=A0 assert(bql_locked());<br>
<br>
=C2=A0 =C2=A0 =C2=A0pirq =3D msi_pirq_target(address, data);<br>
=C2=A0 =C2=A0 =C2=A0if (!pirq || pirq &gt;=3D s-&gt;nr_pirqs) {<br>
diff --git a/hw/i386/kvm/xen_overlay.c b/hw/i386/kvm/xen_overlay.c<br>
index 39fda1b72c..1722294638 100644<br>
--- a/hw/i386/kvm/xen_overlay.c<br>
+++ b/hw/i386/kvm/xen_overlay.c<br>
@@ -194,7 +194,7 @@ int xen_overlay_map_shinfo_page(uint64_t gpa)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -ENOENT;<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
-=C2=A0 =C2=A0 assert(qemu_mutex_iothread_locked());<br>
+=C2=A0 =C2=A0 assert(bql_locked());<br>
<br>
=C2=A0 =C2=A0 =C2=A0if (s-&gt;shinfo_gpa) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* If removing shinfo page, turn the kern=
el magic off first */<br>
diff --git a/hw/i386/kvm/xen_xenstore.c b/hw/i386/kvm/xen_xenstore.c<br>
index 6e651960b3..ae27889a3f 100644<br>
--- a/hw/i386/kvm/xen_xenstore.c<br>
+++ b/hw/i386/kvm/xen_xenstore.c<br>
@@ -1341,7 +1341,7 @@ static void fire_watch_cb(void *opaque, const char *p=
ath, const char *token)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0XenXenstoreState *s =3D opaque;<br>
<br>
-=C2=A0 =C2=A0 assert(qemu_mutex_iothread_locked());<br>
+=C2=A0 =C2=A0 assert(bql_locked());<br>
<br>
=C2=A0 =C2=A0 =C2=A0/*<br>
=C2=A0 =C2=A0 =C2=A0 * If there&#39;s a response pending, we obviously can&=
#39;t scribble over<br>
diff --git a/hw/intc/arm_gicv3_cpuif.c b/hw/intc/arm_gicv3_cpuif.c<br>
index ab1a00508e..77c2a6dd3b 100644<br>
--- a/hw/intc/arm_gicv3_cpuif.c<br>
+++ b/hw/intc/arm_gicv3_cpuif.c<br>
@@ -934,7 +934,7 @@ void gicv3_cpuif_update(GICv3CPUState *cs)<br>
=C2=A0 =C2=A0 =C2=A0ARMCPU *cpu =3D ARM_CPU(cs-&gt;cpu);<br>
=C2=A0 =C2=A0 =C2=A0CPUARMState *env =3D &amp;cpu-&gt;env;<br>
<br>
-=C2=A0 =C2=A0 g_assert(qemu_mutex_iothread_locked());<br>
+=C2=A0 =C2=A0 g_assert(bql_locked());<br>
<br>
=C2=A0 =C2=A0 =C2=A0trace_gicv3_cpuif_update(gicv3_redist_affid(cs), cs-&gt=
;hppi.irq,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cs-&gt;hppi.grp, cs-&gt;hppi.prio);<br>
diff --git a/hw/intc/s390_flic.c b/hw/intc/s390_flic.c<br>
index 74e02858d4..93b8531ad0 100644<br>
--- a/hw/intc/s390_flic.c<br>
+++ b/hw/intc/s390_flic.c<br>
@@ -106,7 +106,7 @@ static int qemu_s390_clear_io_flic(S390FLICState *fs, u=
int16_t subchannel_id,<br>
=C2=A0 =C2=A0 =C2=A0QEMUS390FlicIO *cur, *next;<br>
=C2=A0 =C2=A0 =C2=A0uint8_t isc;<br>
<br>
-=C2=A0 =C2=A0 g_assert(qemu_mutex_iothread_locked());<br>
+=C2=A0 =C2=A0 g_assert(bql_locked());<br>
=C2=A0 =C2=A0 =C2=A0if (!(flic-&gt;pending &amp; FLIC_PENDING_IO)) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
=C2=A0 =C2=A0 =C2=A0}<br>
@@ -223,7 +223,7 @@ uint32_t qemu_s390_flic_dequeue_service(QEMUS390FLICSta=
te *flic)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0uint32_t tmp;<br>
<br>
-=C2=A0 =C2=A0 g_assert(qemu_mutex_iothread_locked());<br>
+=C2=A0 =C2=A0 g_assert(bql_locked());<br>
=C2=A0 =C2=A0 =C2=A0g_assert(flic-&gt;pending &amp; FLIC_PENDING_SERVICE);<=
br>
=C2=A0 =C2=A0 =C2=A0tmp =3D flic-&gt;service_param;<br>
=C2=A0 =C2=A0 =C2=A0flic-&gt;service_param =3D 0;<br>
@@ -238,7 +238,7 @@ QEMUS390FlicIO *qemu_s390_flic_dequeue_io(QEMUS390FLICS=
tate *flic, uint64_t cr6)<br>
=C2=A0 =C2=A0 =C2=A0QEMUS390FlicIO *io;<br>
=C2=A0 =C2=A0 =C2=A0uint8_t isc;<br>
<br>
-=C2=A0 =C2=A0 g_assert(qemu_mutex_iothread_locked());<br>
+=C2=A0 =C2=A0 g_assert(bql_locked());<br>
=C2=A0 =C2=A0 =C2=A0if (!(flic-&gt;pending &amp; CR6_TO_PENDING_IO(cr6))) {=
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return NULL;<br>
=C2=A0 =C2=A0 =C2=A0}<br>
@@ -262,7 +262,7 @@ QEMUS390FlicIO *qemu_s390_flic_dequeue_io(QEMUS390FLICS=
tate *flic, uint64_t cr6)<br>
<br>
=C2=A0void qemu_s390_flic_dequeue_crw_mchk(QEMUS390FLICState *flic)<br>
=C2=A0{<br>
-=C2=A0 =C2=A0 g_assert(qemu_mutex_iothread_locked());<br>
+=C2=A0 =C2=A0 g_assert(bql_locked());<br>
=C2=A0 =C2=A0 =C2=A0g_assert(flic-&gt;pending &amp; FLIC_PENDING_MCHK_CR);<=
br>
=C2=A0 =C2=A0 =C2=A0flic-&gt;pending &amp;=3D ~FLIC_PENDING_MCHK_CR;<br>
=C2=A0}<br>
@@ -271,7 +271,7 @@ static void qemu_s390_inject_service(S390FLICState *fs,=
 uint32_t parm)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0QEMUS390FLICState *flic =3D s390_get_qemu_flic(fs);<br>
<br>
-=C2=A0 =C2=A0 g_assert(qemu_mutex_iothread_locked());<br>
+=C2=A0 =C2=A0 g_assert(bql_locked());<br>
=C2=A0 =C2=A0 =C2=A0/* multiplexing is good enough for sclp - kvm does it i=
nternally as well */<br>
=C2=A0 =C2=A0 =C2=A0flic-&gt;service_param |=3D parm;<br>
=C2=A0 =C2=A0 =C2=A0flic-&gt;pending |=3D FLIC_PENDING_SERVICE;<br>
@@ -287,7 +287,7 @@ static void qemu_s390_inject_io(S390FLICState *fs, uint=
16_t subchannel_id,<br>
=C2=A0 =C2=A0 =C2=A0QEMUS390FLICState *flic =3D s390_get_qemu_flic(fs);<br>
=C2=A0 =C2=A0 =C2=A0QEMUS390FlicIO *io;<br>
<br>
-=C2=A0 =C2=A0 g_assert(qemu_mutex_iothread_locked());<br>
+=C2=A0 =C2=A0 g_assert(bql_locked());<br>
=C2=A0 =C2=A0 =C2=A0io =3D g_new0(QEMUS390FlicIO, 1);<br>
=C2=A0 =C2=A0 =C2=A0io-&gt;id =3D subchannel_id;<br>
=C2=A0 =C2=A0 =C2=A0io-&gt;nr =3D subchannel_nr;<br>
@@ -304,7 +304,7 @@ static void qemu_s390_inject_crw_mchk(S390FLICState *fs=
)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0QEMUS390FLICState *flic =3D s390_get_qemu_flic(fs);<br>
<br>
-=C2=A0 =C2=A0 g_assert(qemu_mutex_iothread_locked());<br>
+=C2=A0 =C2=A0 g_assert(bql_locked());<br>
=C2=A0 =C2=A0 =C2=A0flic-&gt;pending |=3D FLIC_PENDING_MCHK_CR;<br>
<br>
=C2=A0 =C2=A0 =C2=A0qemu_s390_flic_notify(FLIC_PENDING_MCHK_CR);<br>
@@ -330,7 +330,7 @@ bool qemu_s390_flic_has_crw_mchk(QEMUS390FLICState *fli=
c)<br>
<br>
=C2=A0bool qemu_s390_flic_has_any(QEMUS390FLICState *flic)<br>
=C2=A0{<br>
-=C2=A0 =C2=A0 g_assert(qemu_mutex_iothread_locked());<br>
+=C2=A0 =C2=A0 g_assert(bql_locked());<br>
=C2=A0 =C2=A0 =C2=A0return !!flic-&gt;pending;<br>
=C2=A0}<br>
<br>
@@ -340,7 +340,7 @@ static void qemu_s390_flic_reset(DeviceState *dev)<br>
=C2=A0 =C2=A0 =C2=A0QEMUS390FlicIO *cur, *next;<br>
=C2=A0 =C2=A0 =C2=A0int isc;<br>
<br>
-=C2=A0 =C2=A0 g_assert(qemu_mutex_iothread_locked());<br>
+=C2=A0 =C2=A0 g_assert(bql_locked());<br>
=C2=A0 =C2=A0 =C2=A0flic-&gt;simm =3D 0;<br>
=C2=A0 =C2=A0 =C2=A0flic-&gt;nimm =3D 0;<br>
=C2=A0 =C2=A0 =C2=A0flic-&gt;pending =3D 0;<br>
diff --git a/hw/misc/edu.c b/hw/misc/edu.c<br>
index a1f8bc77e7..fa05bdd4f3 100644<br>
--- a/hw/misc/edu.c<br>
+++ b/hw/misc/edu.c<br>
@@ -355,9 +355,9 @@ static void *edu_fact_thread(void *opaque)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0smp_mb__after_rmw();<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (qatomic_read(&amp;edu-&gt;status) &am=
p; EDU_STATUS_IRQFACT) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_mutex_lock_iothread();<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bql_lock();<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0edu_raise_irq(edu, FACT_IRQ=
);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_mutex_unlock_iothread();<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bql_unlock();<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
diff --git a/hw/misc/imx6_src.c b/hw/misc/imx6_src.c<br>
index a9c64d06eb..2b9bb07540 100644<br>
--- a/hw/misc/imx6_src.c<br>
+++ b/hw/misc/imx6_src.c<br>
@@ -131,7 +131,7 @@ static void imx6_clear_reset_bit(CPUState *cpu, run_on_=
cpu_data data)<br>
=C2=A0 =C2=A0 =C2=A0struct SRCSCRResetInfo *ri =3D data.host_ptr;<br>
=C2=A0 =C2=A0 =C2=A0IMX6SRCState *s =3D ri-&gt;s;<br>
<br>
-=C2=A0 =C2=A0 assert(qemu_mutex_iothread_locked());<br>
+=C2=A0 =C2=A0 assert(bql_locked());<br>
<br>
=C2=A0 =C2=A0 =C2=A0s-&gt;regs[SRC_SCR] =3D deposit32(s-&gt;regs[SRC_SCR], =
ri-&gt;reset_bit, 1, 0);<br>
=C2=A0 =C2=A0 =C2=A0DPRINTF(&quot;reg[%s] &lt;=3D 0x%&quot; PRIx32 &quot;\n=
&quot;,<br>
diff --git a/hw/misc/imx7_src.c b/hw/misc/imx7_src.c<br>
index 983251e86f..77ad7a7eef 100644<br>
--- a/hw/misc/imx7_src.c<br>
+++ b/hw/misc/imx7_src.c<br>
@@ -136,7 +136,7 @@ static void imx7_clear_reset_bit(CPUState *cpu, run_on_=
cpu_data data)<br>
=C2=A0 =C2=A0 =C2=A0struct SRCSCRResetInfo *ri =3D data.host_ptr;<br>
=C2=A0 =C2=A0 =C2=A0IMX7SRCState *s =3D ri-&gt;s;<br>
<br>
-=C2=A0 =C2=A0 assert(qemu_mutex_iothread_locked());<br>
+=C2=A0 =C2=A0 assert(bql_locked());<br>
<br>
=C2=A0 =C2=A0 =C2=A0s-&gt;regs[SRC_A7RCR0] =3D deposit32(s-&gt;regs[SRC_A7R=
CR0], ri-&gt;reset_bit, 1, 0);<br>
<br>
diff --git a/hw/net/xen_nic.c b/hw/net/xen_nic.c<br>
index 1e2b3baeb1..453fdb9819 100644<br>
--- a/hw/net/xen_nic.c<br>
+++ b/hw/net/xen_nic.c<br>
@@ -133,7 +133,7 @@ static bool net_tx_packets(struct XenNetDev *netdev)<br=
>
=C2=A0 =C2=A0 =C2=A0void *page;<br>
=C2=A0 =C2=A0 =C2=A0void *tmpbuf =3D NULL;<br>
<br>
-=C2=A0 =C2=A0 assert(qemu_mutex_iothread_locked());<br>
+=C2=A0 =C2=A0 assert(bql_locked());<br>
<br>
=C2=A0 =C2=A0 =C2=A0for (;;) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0rc =3D netdev-&gt;tx_ring.req_cons;<br>
@@ -260,7 +260,7 @@ static ssize_t net_rx_packet(NetClientState *nc, const =
uint8_t *buf, size_t size<br>
=C2=A0 =C2=A0 =C2=A0RING_IDX rc, rp;<br>
=C2=A0 =C2=A0 =C2=A0void *page;<br>
<br>
-=C2=A0 =C2=A0 assert(qemu_mutex_iothread_locked());<br>
+=C2=A0 =C2=A0 assert(bql_locked());<br>
<br>
=C2=A0 =C2=A0 =C2=A0if (xen_device_backend_get_state(&amp;netdev-&gt;xendev=
) !=3D XenbusStateConnected) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -1;<br>
@@ -354,7 +354,7 @@ static bool xen_netdev_connect(XenDevice *xendev, Error=
 **errp)<br>
=C2=A0 =C2=A0 =C2=A0XenNetDev *netdev =3D XEN_NET_DEVICE(xendev);<br>
=C2=A0 =C2=A0 =C2=A0unsigned int port, rx_copy;<br>
<br>
-=C2=A0 =C2=A0 assert(qemu_mutex_iothread_locked());<br>
+=C2=A0 =C2=A0 assert(bql_locked());<br>
<br>
=C2=A0 =C2=A0 =C2=A0if (xen_device_frontend_scanf(xendev, &quot;tx-ring-ref=
&quot;, &quot;%u&quot;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;netdev-&gt;tx_ring=
_ref) !=3D 1) {<br>
@@ -425,7 +425,7 @@ static void xen_netdev_disconnect(XenDevice *xendev, Er=
ror **errp)<br>
<br>
=C2=A0 =C2=A0 =C2=A0trace_xen_netdev_disconnect(netdev-&gt;dev);<br>
<br>
-=C2=A0 =C2=A0 assert(qemu_mutex_iothread_locked());<br>
+=C2=A0 =C2=A0 assert(bql_locked());<br>
<br>
=C2=A0 =C2=A0 =C2=A0netdev-&gt;tx_ring.sring =3D NULL;<br>
=C2=A0 =C2=A0 =C2=A0netdev-&gt;rx_ring.sring =3D NULL;<br>
diff --git a/hw/ppc/pegasos2.c b/hw/ppc/pegasos2.c<br>
index 3203a4a728..d84f3f977d 100644<br>
--- a/hw/ppc/pegasos2.c<br>
+++ b/hw/ppc/pegasos2.c<br>
@@ -515,7 +515,7 @@ static void pegasos2_hypercall(PPCVirtualHypervisor *vh=
yp, PowerPCCPU *cpu)<br>
=C2=A0 =C2=A0 =C2=A0CPUPPCState *env =3D &amp;cpu-&gt;env;<br>
<br>
=C2=A0 =C2=A0 =C2=A0/* The TCG path should also be holding the BQL at this =
point */<br>
-=C2=A0 =C2=A0 g_assert(qemu_mutex_iothread_locked());<br>
+=C2=A0 =C2=A0 g_assert(bql_locked());<br>
<br>
=C2=A0 =C2=A0 =C2=A0if (FIELD_EX64(env-&gt;msr, MSR, PR)) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0qemu_log_mask(LOG_GUEST_ERROR, &quot;Hype=
rcall made with MSR[PR]=3D1\n&quot;);<br>
diff --git a/hw/ppc/ppc.c b/hw/ppc/ppc.c<br>
index be167710a3..b6581c16fc 100644<br>
--- a/hw/ppc/ppc.c<br>
+++ b/hw/ppc/ppc.c<br>
@@ -314,7 +314,7 @@ void store_40x_dbcr0(CPUPPCState *env, uint32_t val)<br=
>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0PowerPCCPU *cpu =3D env_archcpu(env);<br>
<br>
-=C2=A0 =C2=A0 qemu_mutex_lock_iothread();<br>
+=C2=A0 =C2=A0 bql_lock();<br>
<br>
=C2=A0 =C2=A0 =C2=A0switch ((val &gt;&gt; 28) &amp; 0x3) {<br>
=C2=A0 =C2=A0 =C2=A0case 0x0:<br>
@@ -334,7 +334,7 @@ void store_40x_dbcr0(CPUPPCState *env, uint32_t val)<br=
>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
-=C2=A0 =C2=A0 qemu_mutex_unlock_iothread();<br>
+=C2=A0 =C2=A0 bql_unlock();<br>
=C2=A0}<br>
<br>
=C2=A0/* PowerPC 40x internal IRQ controller */<br>
diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c<br>
index df09aa9d6a..0620912f9c 100644<br>
--- a/hw/ppc/spapr.c<br>
+++ b/hw/ppc/spapr.c<br>
@@ -1304,7 +1304,7 @@ static void emulate_spapr_hypercall(PPCVirtualHypervi=
sor *vhyp,<br>
=C2=A0 =C2=A0 =C2=A0CPUPPCState *env =3D &amp;cpu-&gt;env;<br>
<br>
=C2=A0 =C2=A0 =C2=A0/* The TCG path should also be holding the BQL at this =
point */<br>
-=C2=A0 =C2=A0 g_assert(qemu_mutex_iothread_locked());<br>
+=C2=A0 =C2=A0 g_assert(bql_locked());<br>
<br>
=C2=A0 =C2=A0 =C2=A0g_assert(!vhyp_cpu_in_nested(cpu));<br>
<br>
diff --git a/hw/ppc/spapr_rng.c b/hw/ppc/spapr_rng.c<br>
index df5c4b9687..c2fda7ad20 100644<br>
--- a/hw/ppc/spapr_rng.c<br>
+++ b/hw/ppc/spapr_rng.c<br>
@@ -82,9 +82,9 @@ static target_ulong h_random(PowerPCCPU *cpu, SpaprMachin=
eState *spapr,<br>
=C2=A0 =C2=A0 =C2=A0while (hrdata.received &lt; 8) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0rng_backend_request_entropy(rngstate-&gt;=
backend, 8 - hrdata.received,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0random_recv, &am=
p;hrdata);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_mutex_unlock_iothread();<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 bql_unlock();<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0qemu_sem_wait(&amp;hrdata.sem);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_mutex_lock_iothread();<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 bql_lock();<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
=C2=A0 =C2=A0 =C2=A0qemu_sem_destroy(&amp;hrdata.sem);<br>
diff --git a/hw/ppc/spapr_softmmu.c b/hw/ppc/spapr_softmmu.c<br>
index 278666317e..fc1bbc0b61 100644<br>
--- a/hw/ppc/spapr_softmmu.c<br>
+++ b/hw/ppc/spapr_softmmu.c<br>
@@ -334,7 +334,7 @@ static void *hpt_prepare_thread(void *opaque)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pending-&gt;ret =3D H_NO_MEM;<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
-=C2=A0 =C2=A0 qemu_mutex_lock_iothread();<br>
+=C2=A0 =C2=A0 bql_lock();<br>
<br>
=C2=A0 =C2=A0 =C2=A0if (SPAPR_MACHINE(qdev_get_machine())-&gt;pending_hpt =
=3D=3D pending) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* Ready to go */<br>
@@ -344,7 +344,7 @@ static void *hpt_prepare_thread(void *opaque)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0free_pending_hpt(pending);<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
-=C2=A0 =C2=A0 qemu_mutex_unlock_iothread();<br>
+=C2=A0 =C2=A0 bql_unlock();<br>
=C2=A0 =C2=A0 =C2=A0return NULL;<br>
=C2=A0}<br>
<br>
diff --git a/hw/remote/mpqemu-link.c b/hw/remote/mpqemu-link.c<br>
index 9bd98e8219..d04ac93621 100644<br>
--- a/hw/remote/mpqemu-link.c<br>
+++ b/hw/remote/mpqemu-link.c<br>
@@ -33,7 +33,7 @@<br>
=C2=A0 */<br>
=C2=A0bool mpqemu_msg_send(MPQemuMsg *msg, QIOChannel *ioc, Error **errp)<b=
r>
=C2=A0{<br>
-=C2=A0 =C2=A0 bool iolock =3D qemu_mutex_iothread_locked();<br>
+=C2=A0 =C2=A0 bool drop_bql =3D bql_locked();<br>
=C2=A0 =C2=A0 =C2=A0bool iothread =3D qemu_in_iothread();<br>
=C2=A0 =C2=A0 =C2=A0struct iovec send[2] =3D {};<br>
=C2=A0 =C2=A0 =C2=A0int *fds =3D NULL;<br>
@@ -63,8 +63,8 @@ bool mpqemu_msg_send(MPQemuMsg *msg, QIOChannel *ioc, Err=
or **errp)<br>
=C2=A0 =C2=A0 =C2=A0 * for IOThread case.<br>
=C2=A0 =C2=A0 =C2=A0 * Also skip lock handling while in a co-routine in the=
 main context.<br>
=C2=A0 =C2=A0 =C2=A0 */<br>
-=C2=A0 =C2=A0 if (iolock &amp;&amp; !iothread &amp;&amp; !qemu_in_coroutin=
e()) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_mutex_unlock_iothread();<br>
+=C2=A0 =C2=A0 if (drop_bql &amp;&amp; !iothread &amp;&amp; !qemu_in_corout=
ine()) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 bql_unlock();<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
=C2=A0 =C2=A0 =C2=A0if (!qio_channel_writev_full_all(ioc, send, G_N_ELEMENT=
S(send),<br>
@@ -74,9 +74,9 @@ bool mpqemu_msg_send(MPQemuMsg *msg, QIOChannel *ioc, Err=
or **errp)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0trace_mpqemu_send_io_error(msg-&gt;cmd, m=
sg-&gt;size, nfds);<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
-=C2=A0 =C2=A0 if (iolock &amp;&amp; !iothread &amp;&amp; !qemu_in_coroutin=
e()) {<br>
+=C2=A0 =C2=A0 if (drop_bql &amp;&amp; !iothread &amp;&amp; !qemu_in_corout=
ine()) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* See above comment why skip locking her=
e. */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_mutex_lock_iothread();<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 bql_lock();<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
=C2=A0 =C2=A0 =C2=A0return ret;<br>
@@ -96,7 +96,7 @@ static ssize_t mpqemu_read(QIOChannel *ioc, void *buf, si=
ze_t len, int **fds,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 size_t *nfds, Error **errp)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0struct iovec iov =3D { .iov_base =3D buf, .iov_len =3D =
len };<br>
-=C2=A0 =C2=A0 bool iolock =3D qemu_mutex_iothread_locked();<br>
+=C2=A0 =C2=A0 bool drop_bql =3D bql_locked();<br>
=C2=A0 =C2=A0 =C2=A0bool iothread =3D qemu_in_iothread();<br>
=C2=A0 =C2=A0 =C2=A0int ret =3D -1;<br>
<br>
@@ -106,14 +106,14 @@ static ssize_t mpqemu_read(QIOChannel *ioc, void *buf=
, size_t len, int **fds,<br>
=C2=A0 =C2=A0 =C2=A0 */<br>
=C2=A0 =C2=A0 =C2=A0assert(qemu_in_coroutine() || !iothread);<br>
<br>
-=C2=A0 =C2=A0 if (iolock &amp;&amp; !iothread &amp;&amp; !qemu_in_coroutin=
e()) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_mutex_unlock_iothread();<br>
+=C2=A0 =C2=A0 if (drop_bql &amp;&amp; !iothread &amp;&amp; !qemu_in_corout=
ine()) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 bql_unlock();<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
=C2=A0 =C2=A0 =C2=A0ret =3D qio_channel_readv_full_all_eof(ioc, &amp;iov, 1=
, fds, nfds, errp);<br>
<br>
-=C2=A0 =C2=A0 if (iolock &amp;&amp; !iothread &amp;&amp; !qemu_in_coroutin=
e()) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_mutex_lock_iothread();<br>
+=C2=A0 =C2=A0 if (drop_bql &amp;&amp; !iothread &amp;&amp; !qemu_in_corout=
ine()) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 bql_lock();<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
=C2=A0 =C2=A0 =C2=A0return (ret &lt;=3D 0) ? ret : iov.iov_len;<br>
diff --git a/hw/remote/vfio-user-obj.c b/hw/remote/vfio-user-obj.c<br>
index 8b10c32a3c..d9b879e056 100644<br>
--- a/hw/remote/vfio-user-obj.c<br>
+++ b/hw/remote/vfio-user-obj.c<br>
@@ -400,7 +400,7 @@ static int vfu_object_mr_rw(MemoryRegion *mr, uint8_t *=
buf, hwaddr offset,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (release_lock) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_mutex_unlock_iothread();<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bql_unlock();<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0release_lock =3D false;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
<br>
diff --git a/hw/s390x/s390-skeys.c b/hw/s390x/s390-skeys.c<br>
index 8f5159d85d..5c535d483e 100644<br>
--- a/hw/s390x/s390-skeys.c<br>
+++ b/hw/s390x/s390-skeys.c<br>
@@ -153,7 +153,7 @@ void qmp_dump_skeys(const char *filename, Error **errp)=
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto out;<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
-=C2=A0 =C2=A0 assert(qemu_mutex_iothread_locked());<br>
+=C2=A0 =C2=A0 assert(bql_locked());<br>
=C2=A0 =C2=A0 =C2=A0guest_phys_blocks_init(&amp;guest_phys_blocks);<br>
=C2=A0 =C2=A0 =C2=A0guest_phys_blocks_append(&amp;guest_phys_blocks);<br>
<br>
diff --git a/migration/block-dirty-bitmap.c b/migration/block-dirty-bitmap.=
c<br>
index 24347ab0f7..92e031b6fa 100644<br>
--- a/migration/block-dirty-bitmap.c<br>
+++ b/migration/block-dirty-bitmap.c<br>
@@ -774,7 +774,7 @@ static void dirty_bitmap_state_pending(void *opaque,<br=
>
=C2=A0 =C2=A0 =C2=A0SaveBitmapState *dbms;<br>
=C2=A0 =C2=A0 =C2=A0uint64_t pending =3D 0;<br>
<br>
-=C2=A0 =C2=A0 qemu_mutex_lock_iothread();<br>
+=C2=A0 =C2=A0 bql_lock();<br>
<br>
=C2=A0 =C2=A0 =C2=A0QSIMPLEQ_FOREACH(dbms, &amp;s-&gt;dbms_list, entry) {<b=
r>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0uint64_t gran =3D bdrv_dirty_bitmap_granu=
larity(dbms-&gt;bitmap);<br>
@@ -784,7 +784,7 @@ static void dirty_bitmap_state_pending(void *opaque,<br=
>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pending +=3D DIV_ROUND_UP(sectors * BDRV_=
SECTOR_SIZE, gran);<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
-=C2=A0 =C2=A0 qemu_mutex_unlock_iothread();<br>
+=C2=A0 =C2=A0 bql_unlock();<br>
<br>
=C2=A0 =C2=A0 =C2=A0trace_dirty_bitmap_state_pending(pending);<br>
<br>
diff --git a/migration/block.c b/migration/block.c<br>
index a15f9bddcb..4a675b92bc 100644<br>
--- a/migration/block.c<br>
+++ b/migration/block.c<br>
@@ -269,7 +269,7 @@ static int mig_save_device_bulk(QEMUFile *f, BlkMigDevS=
tate *bmds)<br>
=C2=A0 =C2=A0 =C2=A0int64_t count;<br>
<br>
=C2=A0 =C2=A0 =C2=A0if (bmds-&gt;shared_base) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_mutex_lock_iothread();<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 bql_lock();<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0aio_context_acquire(blk_get_aio_context(b=
b));<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* Skip unallocated sectors; intentionall=
y treats failure or<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * partial sector as an allocated sector =
*/<br>
@@ -282,7 +282,7 @@ static int mig_save_device_bulk(QEMUFile *f, BlkMigDevS=
tate *bmds)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cur_sector +=3D count &gt;&=
gt; BDRV_SECTOR_BITS;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0aio_context_release(blk_get_aio_context(b=
b));<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_mutex_unlock_iothread();<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 bql_unlock();<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
=C2=A0 =C2=A0 =C2=A0if (cur_sector &gt;=3D total_sectors) {<br>
@@ -321,14 +321,14 @@ static int mig_save_device_bulk(QEMUFile *f, BlkMigDe=
vState *bmds)<br>
=C2=A0 =C2=A0 =C2=A0 * This is ugly and will disappear when we make bdrv_* =
thread-safe,<br>
=C2=A0 =C2=A0 =C2=A0 * without the need to acquire the AioContext.<br>
=C2=A0 =C2=A0 =C2=A0 */<br>
-=C2=A0 =C2=A0 qemu_mutex_lock_iothread();<br>
+=C2=A0 =C2=A0 bql_lock();<br>
=C2=A0 =C2=A0 =C2=A0aio_context_acquire(blk_get_aio_context(bmds-&gt;blk));=
<br>
=C2=A0 =C2=A0 =C2=A0bdrv_reset_dirty_bitmap(bmds-&gt;dirty_bitmap, cur_sect=
or * BDRV_SECTOR_SIZE,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0nr_sectors * BDRV_SECTOR_SIZE);<br>
=C2=A0 =C2=A0 =C2=A0blk-&gt;aiocb =3D blk_aio_preadv(bb, cur_sector * BDRV_=
SECTOR_SIZE, &amp;blk-&gt;qiov,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00, blk_mig_read_cb, blk);<br>
=C2=A0 =C2=A0 =C2=A0aio_context_release(blk_get_aio_context(bmds-&gt;blk));=
<br>
-=C2=A0 =C2=A0 qemu_mutex_unlock_iothread();<br>
+=C2=A0 =C2=A0 bql_unlock();<br>
<br>
=C2=A0 =C2=A0 =C2=A0bmds-&gt;cur_sector =3D cur_sector + nr_sectors;<br>
=C2=A0 =C2=A0 =C2=A0return (bmds-&gt;cur_sector &gt;=3D total_sectors);<br>
@@ -786,9 +786,9 @@ static int block_save_iterate(QEMUFile *f, void *opaque=
)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* Always called with iothr=
ead lock taken for<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * simplicity, block_save_c=
omplete also calls it.<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_mutex_lock_iothread();<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bql_lock();<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D blk_mig_save_dirty_=
block(f, 1);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_mutex_unlock_iothread();<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bql_unlock();<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (ret &lt; 0) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return ret;<br>
@@ -860,9 +860,9 @@ static void block_state_pending(void *opaque, uint64_t =
*must_precopy,<br>
=C2=A0 =C2=A0 =C2=A0/* Estimate pending number of bytes to send */<br>
=C2=A0 =C2=A0 =C2=A0uint64_t pending;<br>
<br>
-=C2=A0 =C2=A0 qemu_mutex_lock_iothread();<br>
+=C2=A0 =C2=A0 bql_lock();<br>
=C2=A0 =C2=A0 =C2=A0pending =3D get_remaining_dirty();<br>
-=C2=A0 =C2=A0 qemu_mutex_unlock_iothread();<br>
+=C2=A0 =C2=A0 bql_unlock();<br>
<br>
=C2=A0 =C2=A0 =C2=A0blk_mig_lock();<br>
=C2=A0 =C2=A0 =C2=A0pending +=3D block_mig_state.submitted * BLK_MIG_BLOCK_=
SIZE +<br>
diff --git a/migration/colo.c b/migration/colo.c<br>
index 4447e34914..2a74efdd77 100644<br>
--- a/migration/colo.c<br>
+++ b/migration/colo.c<br>
@@ -420,13 +420,13 @@ static int colo_do_checkpoint_transaction(MigrationSt=
ate *s,<br>
=C2=A0 =C2=A0 =C2=A0qio_channel_io_seek(QIO_CHANNEL(bioc), 0, 0, NULL);<br>
=C2=A0 =C2=A0 =C2=A0bioc-&gt;usage =3D 0;<br>
<br>
-=C2=A0 =C2=A0 qemu_mutex_lock_iothread();<br>
+=C2=A0 =C2=A0 bql_lock();<br>
=C2=A0 =C2=A0 =C2=A0if (failover_get_state() !=3D FAILOVER_STATUS_NONE) {<b=
r>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_mutex_unlock_iothread();<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 bql_unlock();<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto out;<br>
=C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0vm_stop_force_state(RUN_STATE_COLO);<br>
-=C2=A0 =C2=A0 qemu_mutex_unlock_iothread();<br>
+=C2=A0 =C2=A0 bql_unlock();<br>
=C2=A0 =C2=A0 =C2=A0trace_colo_vm_state_change(&quot;run&quot;, &quot;stop&=
quot;);<br>
=C2=A0 =C2=A0 =C2=A0/*<br>
=C2=A0 =C2=A0 =C2=A0 * Failover request bh could be called after vm_stop_fo=
rce_state(),<br>
@@ -435,23 +435,23 @@ static int colo_do_checkpoint_transaction(MigrationSt=
ate *s,<br>
=C2=A0 =C2=A0 =C2=A0if (failover_get_state() !=3D FAILOVER_STATUS_NONE) {<b=
r>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto out;<br>
=C2=A0 =C2=A0 =C2=A0}<br>
-=C2=A0 =C2=A0 qemu_mutex_lock_iothread();<br>
+=C2=A0 =C2=A0 bql_lock();<br>
<br>
=C2=A0 =C2=A0 =C2=A0replication_do_checkpoint_all(&amp;local_err);<br>
=C2=A0 =C2=A0 =C2=A0if (local_err) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_mutex_unlock_iothread();<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 bql_unlock();<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto out;<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
=C2=A0 =C2=A0 =C2=A0colo_send_message(s-&gt;to_dst_file, COLO_MESSAGE_VMSTA=
TE_SEND, &amp;local_err);<br>
=C2=A0 =C2=A0 =C2=A0if (local_err) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_mutex_unlock_iothread();<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 bql_unlock();<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto out;<br>
=C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0/* Note: device state is saved into buffer */<br>
=C2=A0 =C2=A0 =C2=A0ret =3D qemu_save_device_state(fb);<br>
<br>
-=C2=A0 =C2=A0 qemu_mutex_unlock_iothread();<br>
+=C2=A0 =C2=A0 bql_unlock();<br>
=C2=A0 =C2=A0 =C2=A0if (ret &lt; 0) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto out;<br>
=C2=A0 =C2=A0 =C2=A0}<br>
@@ -504,9 +504,9 @@ static int colo_do_checkpoint_transaction(MigrationStat=
e *s,<br>
<br>
=C2=A0 =C2=A0 =C2=A0ret =3D 0;<br>
<br>
-=C2=A0 =C2=A0 qemu_mutex_lock_iothread();<br>
+=C2=A0 =C2=A0 bql_lock();<br>
=C2=A0 =C2=A0 =C2=A0vm_start();<br>
-=C2=A0 =C2=A0 qemu_mutex_unlock_iothread();<br>
+=C2=A0 =C2=A0 bql_unlock();<br>
=C2=A0 =C2=A0 =C2=A0trace_colo_vm_state_change(&quot;stop&quot;, &quot;run&=
quot;);<br>
<br>
=C2=A0out:<br>
@@ -557,15 +557,15 @@ static void colo_process_checkpoint(MigrationState *s=
)<br>
=C2=A0 =C2=A0 =C2=A0fb =3D qemu_file_new_output(QIO_CHANNEL(bioc));<br>
=C2=A0 =C2=A0 =C2=A0object_unref(OBJECT(bioc));<br>
<br>
-=C2=A0 =C2=A0 qemu_mutex_lock_iothread();<br>
+=C2=A0 =C2=A0 bql_lock();<br>
=C2=A0 =C2=A0 =C2=A0replication_start_all(REPLICATION_MODE_PRIMARY, &amp;lo=
cal_err);<br>
=C2=A0 =C2=A0 =C2=A0if (local_err) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_mutex_unlock_iothread();<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 bql_unlock();<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto out;<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
=C2=A0 =C2=A0 =C2=A0vm_start();<br>
-=C2=A0 =C2=A0 qemu_mutex_unlock_iothread();<br>
+=C2=A0 =C2=A0 bql_unlock();<br>
=C2=A0 =C2=A0 =C2=A0trace_colo_vm_state_change(&quot;stop&quot;, &quot;run&=
quot;);<br>
<br>
=C2=A0 =C2=A0 =C2=A0timer_mod(s-&gt;colo_delay_timer, qemu_clock_get_ms(QEM=
U_CLOCK_HOST) +<br>
@@ -639,14 +639,14 @@ out:<br>
<br>
=C2=A0void migrate_start_colo_process(MigrationState *s)<br>
=C2=A0{<br>
-=C2=A0 =C2=A0 qemu_mutex_unlock_iothread();<br>
+=C2=A0 =C2=A0 bql_unlock();<br>
=C2=A0 =C2=A0 =C2=A0qemu_event_init(&amp;s-&gt;colo_checkpoint_event, false=
);<br>
=C2=A0 =C2=A0 =C2=A0s-&gt;colo_delay_timer =3D=C2=A0 timer_new_ms(QEMU_CLOC=
K_HOST,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0colo_checkpoint_notify, s);<br=
>
<br>
=C2=A0 =C2=A0 =C2=A0qemu_sem_init(&amp;s-&gt;colo_exit_sem, 0);<br>
=C2=A0 =C2=A0 =C2=A0colo_process_checkpoint(s);<br>
-=C2=A0 =C2=A0 qemu_mutex_lock_iothread();<br>
+=C2=A0 =C2=A0 bql_lock();<br>
=C2=A0}<br>
<br>
=C2=A0static void colo_incoming_process_checkpoint(MigrationIncomingState *=
mis,<br>
@@ -657,9 +657,9 @@ static void colo_incoming_process_checkpoint(MigrationI=
ncomingState *mis,<br>
=C2=A0 =C2=A0 =C2=A0Error *local_err =3D NULL;<br>
=C2=A0 =C2=A0 =C2=A0int ret;<br>
<br>
-=C2=A0 =C2=A0 qemu_mutex_lock_iothread();<br>
+=C2=A0 =C2=A0 bql_lock();<br>
=C2=A0 =C2=A0 =C2=A0vm_stop_force_state(RUN_STATE_COLO);<br>
-=C2=A0 =C2=A0 qemu_mutex_unlock_iothread();<br>
+=C2=A0 =C2=A0 bql_unlock();<br>
=C2=A0 =C2=A0 =C2=A0trace_colo_vm_state_change(&quot;run&quot;, &quot;stop&=
quot;);<br>
<br>
=C2=A0 =C2=A0 =C2=A0/* FIXME: This is unnecessary for periodic checkpoint m=
ode */<br>
@@ -677,10 +677,10 @@ static void colo_incoming_process_checkpoint(Migratio=
nIncomingState *mis,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return;<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
-=C2=A0 =C2=A0 qemu_mutex_lock_iothread();<br>
+=C2=A0 =C2=A0 bql_lock();<br>
=C2=A0 =C2=A0 =C2=A0cpu_synchronize_all_states();<br>
=C2=A0 =C2=A0 =C2=A0ret =3D qemu_loadvm_state_main(mis-&gt;from_src_file, m=
is);<br>
-=C2=A0 =C2=A0 qemu_mutex_unlock_iothread();<br>
+=C2=A0 =C2=A0 bql_unlock();<br>
<br>
=C2=A0 =C2=A0 =C2=A0if (ret &lt; 0) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0error_setg(errp, &quot;Load VM&#39;s live=
 state (ram) error&quot;);<br>
@@ -719,14 +719,14 @@ static void colo_incoming_process_checkpoint(Migratio=
nIncomingState *mis,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return;<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
-=C2=A0 =C2=A0 qemu_mutex_lock_iothread();<br>
+=C2=A0 =C2=A0 bql_lock();<br>
=C2=A0 =C2=A0 =C2=A0vmstate_loading =3D true;<br>
=C2=A0 =C2=A0 =C2=A0colo_flush_ram_cache();<br>
=C2=A0 =C2=A0 =C2=A0ret =3D qemu_load_device_state(fb);<br>
=C2=A0 =C2=A0 =C2=A0if (ret &lt; 0) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0error_setg(errp, &quot;COLO: load device =
state failed&quot;);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0vmstate_loading =3D false;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_mutex_unlock_iothread();<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 bql_unlock();<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return;<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
@@ -734,7 +734,7 @@ static void colo_incoming_process_checkpoint(MigrationI=
ncomingState *mis,<br>
=C2=A0 =C2=A0 =C2=A0if (local_err) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0error_propagate(errp, local_err);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0vmstate_loading =3D false;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_mutex_unlock_iothread();<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 bql_unlock();<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return;<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
@@ -743,7 +743,7 @@ static void colo_incoming_process_checkpoint(MigrationI=
ncomingState *mis,<br>
=C2=A0 =C2=A0 =C2=A0if (local_err) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0error_propagate(errp, local_err);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0vmstate_loading =3D false;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_mutex_unlock_iothread();<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 bql_unlock();<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return;<br>
=C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0/* Notify all filters of all NIC to do checkpoint */<br=
>
@@ -752,13 +752,13 @@ static void colo_incoming_process_checkpoint(Migratio=
nIncomingState *mis,<br>
=C2=A0 =C2=A0 =C2=A0if (local_err) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0error_propagate(errp, local_err);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0vmstate_loading =3D false;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_mutex_unlock_iothread();<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 bql_unlock();<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return;<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
=C2=A0 =C2=A0 =C2=A0vmstate_loading =3D false;<br>
=C2=A0 =C2=A0 =C2=A0vm_start();<br>
-=C2=A0 =C2=A0 qemu_mutex_unlock_iothread();<br>
+=C2=A0 =C2=A0 bql_unlock();<br>
=C2=A0 =C2=A0 =C2=A0trace_colo_vm_state_change(&quot;stop&quot;, &quot;run&=
quot;);<br>
<br>
=C2=A0 =C2=A0 =C2=A0if (failover_get_state() =3D=3D FAILOVER_STATUS_RELAUNC=
H) {<br>
@@ -851,14 +851,14 @@ static void *colo_process_incoming_thread(void *opaqu=
e)<br>
=C2=A0 =C2=A0 =C2=A0fb =3D qemu_file_new_input(QIO_CHANNEL(bioc));<br>
=C2=A0 =C2=A0 =C2=A0object_unref(OBJECT(bioc));<br>
<br>
-=C2=A0 =C2=A0 qemu_mutex_lock_iothread();<br>
+=C2=A0 =C2=A0 bql_lock();<br>
=C2=A0 =C2=A0 =C2=A0replication_start_all(REPLICATION_MODE_SECONDARY, &amp;=
local_err);<br>
=C2=A0 =C2=A0 =C2=A0if (local_err) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_mutex_unlock_iothread();<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 bql_unlock();<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto out;<br>
=C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0vm_start();<br>
-=C2=A0 =C2=A0 qemu_mutex_unlock_iothread();<br>
+=C2=A0 =C2=A0 bql_unlock();<br>
=C2=A0 =C2=A0 =C2=A0trace_colo_vm_state_change(&quot;stop&quot;, &quot;run&=
quot;);<br>
<br>
=C2=A0 =C2=A0 =C2=A0colo_send_message(mis-&gt;to_src_file, COLO_MESSAGE_CHE=
CKPOINT_READY,<br>
@@ -920,7 +920,7 @@ int coroutine_fn colo_incoming_co(void)<br>
=C2=A0 =C2=A0 =C2=A0Error *local_err =3D NULL;<br>
=C2=A0 =C2=A0 =C2=A0QemuThread th;<br>
<br>
-=C2=A0 =C2=A0 assert(qemu_mutex_iothread_locked());<br>
+=C2=A0 =C2=A0 assert(bql_locked());<br>
<br>
=C2=A0 =C2=A0 =C2=A0if (!migration_incoming_colo_enabled()) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
@@ -940,10 +940,10 @@ int coroutine_fn colo_incoming_co(void)<br>
=C2=A0 =C2=A0 =C2=A0qemu_coroutine_yield();<br>
=C2=A0 =C2=A0 =C2=A0mis-&gt;colo_incoming_co =3D NULL;<br>
<br>
-=C2=A0 =C2=A0 qemu_mutex_unlock_iothread();<br>
+=C2=A0 =C2=A0 bql_unlock();<br>
=C2=A0 =C2=A0 =C2=A0/* Wait checkpoint incoming thread exit before free res=
ource */<br>
=C2=A0 =C2=A0 =C2=A0qemu_thread_join(&amp;th);<br>
-=C2=A0 =C2=A0 qemu_mutex_lock_iothread();<br>
+=C2=A0 =C2=A0 bql_lock();<br>
<br>
=C2=A0 =C2=A0 =C2=A0/* We hold the global iothread lock, so it is safe here=
 */<br>
=C2=A0 =C2=A0 =C2=A0colo_release_ram_cache();<br>
diff --git a/migration/dirtyrate.c b/migration/dirtyrate.c<br>
index 036ac017fc..429d10c4d9 100644<br>
--- a/migration/dirtyrate.c<br>
+++ b/migration/dirtyrate.c<br>
@@ -90,13 +90,13 @@ static int64_t do_calculate_dirtyrate(DirtyPageRecord d=
irty_pages,<br>
<br>
=C2=A0void global_dirty_log_change(unsigned int flag, bool start)<br>
=C2=A0{<br>
-=C2=A0 =C2=A0 qemu_mutex_lock_iothread();<br>
+=C2=A0 =C2=A0 bql_lock();<br>
=C2=A0 =C2=A0 =C2=A0if (start) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0memory_global_dirty_log_start(flag);<br>
=C2=A0 =C2=A0 =C2=A0} else {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0memory_global_dirty_log_stop(flag);<br>
=C2=A0 =C2=A0 =C2=A0}<br>
-=C2=A0 =C2=A0 qemu_mutex_unlock_iothread();<br>
+=C2=A0 =C2=A0 bql_unlock();<br>
=C2=A0}<br>
<br>
=C2=A0/*<br>
@@ -106,12 +106,12 @@ void global_dirty_log_change(unsigned int flag, bool =
start)<br>
=C2=A0 */<br>
=C2=A0static void global_dirty_log_sync(unsigned int flag, bool one_shot)<b=
r>
=C2=A0{<br>
-=C2=A0 =C2=A0 qemu_mutex_lock_iothread();<br>
+=C2=A0 =C2=A0 bql_lock();<br>
=C2=A0 =C2=A0 =C2=A0memory_global_dirty_log_sync(false);<br>
=C2=A0 =C2=A0 =C2=A0if (one_shot) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0memory_global_dirty_log_stop(flag);<br>
=C2=A0 =C2=A0 =C2=A0}<br>
-=C2=A0 =C2=A0 qemu_mutex_unlock_iothread();<br>
+=C2=A0 =C2=A0 bql_unlock();<br>
=C2=A0}<br>
<br>
=C2=A0static DirtyPageRecord *vcpu_dirty_stat_alloc(VcpuStat *stat)<br>
@@ -610,7 +610,7 @@ static void calculate_dirtyrate_dirty_bitmap(struct Dir=
tyRateConfig config)<br>
=C2=A0 =C2=A0 =C2=A0int64_t start_time;<br>
=C2=A0 =C2=A0 =C2=A0DirtyPageRecord dirty_pages;<br>
<br>
-=C2=A0 =C2=A0 qemu_mutex_lock_iothread();<br>
+=C2=A0 =C2=A0 bql_lock();<br>
=C2=A0 =C2=A0 =C2=A0memory_global_dirty_log_start(GLOBAL_DIRTY_DIRTY_RATE);=
<br>
<br>
=C2=A0 =C2=A0 =C2=A0/*<br>
@@ -627,7 +627,7 @@ static void calculate_dirtyrate_dirty_bitmap(struct Dir=
tyRateConfig config)<br>
=C2=A0 =C2=A0 =C2=A0 * KVM_DIRTY_LOG_MANUAL_PROTECT_ENABLE cap is enabled.<=
br>
=C2=A0 =C2=A0 =C2=A0 */<br>
=C2=A0 =C2=A0 =C2=A0dirtyrate_manual_reset_protect();<br>
-=C2=A0 =C2=A0 qemu_mutex_unlock_iothread();<br>
+=C2=A0 =C2=A0 bql_unlock();<br>
<br>
=C2=A0 =C2=A0 =C2=A0record_dirtypages_bitmap(&amp;dirty_pages, true);<br>
<br>
diff --git a/migration/migration.c b/migration/migration.c<br>
index 3ce04b2aaf..be74c714d6 100644<br>
--- a/migration/migration.c<br>
+++ b/migration/migration.c<br>
@@ -1294,12 +1294,12 @@ static void migrate_fd_cleanup(MigrationState *s)<b=
r>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0QEMUFile *tmp;<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0trace_migrate_fd_cleanup();<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_mutex_unlock_iothread();<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 bql_unlock();<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (s-&gt;migration_thread_running) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0qemu_thread_join(&amp;s-&gt=
;thread);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0s-&gt;migration_thread_runn=
ing =3D false;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_mutex_lock_iothread();<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 bql_lock();<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0multifd_save_cleanup();<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0qemu_mutex_lock(&amp;s-&gt;qemu_file_lock=
);<br>
@@ -2411,7 +2411,7 @@ static int postcopy_start(MigrationState *ms, Error *=
*errp)<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
=C2=A0 =C2=A0 =C2=A0trace_postcopy_start();<br>
-=C2=A0 =C2=A0 qemu_mutex_lock_iothread();<br>
+=C2=A0 =C2=A0 bql_lock();<br>
=C2=A0 =C2=A0 =C2=A0trace_postcopy_start_set_run();<br>
<br>
=C2=A0 =C2=A0 =C2=A0migration_downtime_start(ms);<br>
@@ -2520,7 +2520,7 @@ static int postcopy_start(MigrationState *ms, Error *=
*errp)<br>
<br>
=C2=A0 =C2=A0 =C2=A0migration_downtime_end(ms);<br>
<br>
-=C2=A0 =C2=A0 qemu_mutex_unlock_iothread();<br>
+=C2=A0 =C2=A0 bql_unlock();<br>
<br>
=C2=A0 =C2=A0 =C2=A0if (migrate_postcopy_ram()) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/*<br>
@@ -2561,7 +2561,7 @@ fail:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0error_report_err(local_err)=
;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0}<br>
-=C2=A0 =C2=A0 qemu_mutex_unlock_iothread();<br>
+=C2=A0 =C2=A0 bql_unlock();<br>
=C2=A0 =C2=A0 =C2=A0return -1;<br>
=C2=A0}<br>
<br>
@@ -2595,14 +2595,14 @@ static int migration_maybe_pause(MigrationState *s,=
<br>
=C2=A0 =C2=A0 =C2=A0 * wait for the &#39;pause_sem&#39; semaphore.<br>
=C2=A0 =C2=A0 =C2=A0 */<br>
=C2=A0 =C2=A0 =C2=A0if (s-&gt;state !=3D MIGRATION_STATUS_CANCELLING) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_mutex_unlock_iothread();<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 bql_unlock();<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0migrate_set_state(&amp;s-&gt;state, *curr=
ent_active_state,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0MIGRATION_STATUS_PRE_SWITCHOVER);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0qemu_sem_wait(&amp;s-&gt;pause_sem);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0migrate_set_state(&amp;s-&gt;state, MIGRA=
TION_STATUS_PRE_SWITCHOVER,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0new_state);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*current_active_state =3D new_state;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_mutex_lock_iothread();<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 bql_lock();<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
=C2=A0 =C2=A0 =C2=A0return s-&gt;state =3D=3D new_state ? 0 : -EINVAL;<br>
@@ -2613,7 +2613,7 @@ static int migration_completion_precopy(MigrationStat=
e *s,<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0int ret;<br>
<br>
-=C2=A0 =C2=A0 qemu_mutex_lock_iothread();<br>
+=C2=A0 =C2=A0 bql_lock();<br>
=C2=A0 =C2=A0 =C2=A0migration_downtime_start(s);<br>
=C2=A0 =C2=A0 =C2=A0qemu_system_wakeup_request(QEMU_WAKEUP_REASON_OTHER, NU=
LL);<br>
<br>
@@ -2641,7 +2641,7 @@ static int migration_completion_precopy(MigrationStat=
e *s,<br>
=C2=A0 =C2=A0 =C2=A0ret =3D qemu_savevm_state_complete_precopy(s-&gt;to_dst=
_file, false,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 s-&gt;block_inactive);<br>
=C2=A0out_unlock:<br>
-=C2=A0 =C2=A0 qemu_mutex_unlock_iothread();<br>
+=C2=A0 =C2=A0 bql_unlock();<br>
=C2=A0 =C2=A0 =C2=A0return ret;<br>
=C2=A0}<br>
<br>
@@ -2649,9 +2649,9 @@ static void migration_completion_postcopy(MigrationSt=
ate *s)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0trace_migration_completion_postcopy_end();<br>
<br>
-=C2=A0 =C2=A0 qemu_mutex_lock_iothread();<br>
+=C2=A0 =C2=A0 bql_lock();<br>
=C2=A0 =C2=A0 =C2=A0qemu_savevm_state_complete_postcopy(s-&gt;to_dst_file);=
<br>
-=C2=A0 =C2=A0 qemu_mutex_unlock_iothread();<br>
+=C2=A0 =C2=A0 bql_unlock();<br>
<br>
=C2=A0 =C2=A0 =C2=A0/*<br>
=C2=A0 =C2=A0 =C2=A0 * Shutdown the postcopy fast path thread.=C2=A0 This i=
s only needed when dest<br>
@@ -2675,14 +2675,14 @@ static void migration_completion_failed(MigrationSt=
ate *s,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Error *local_err =3D NULL;<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_mutex_lock_iothread();<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 bql_lock();<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bdrv_activate_all(&amp;local_err);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (local_err) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0error_report_err(local_err)=
;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0} else {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0s-&gt;block_inactive =3D fa=
lse;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_mutex_unlock_iothread();<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 bql_unlock();<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
=C2=A0 =C2=A0 =C2=A0migrate_set_state(&amp;s-&gt;state, current_active_stat=
e,<br>
@@ -3122,7 +3122,7 @@ static void migration_iteration_finish(MigrationState=
 *s)<br>
=C2=A0 =C2=A0 =C2=A0/* If we enabled cpu throttling for auto-converge, turn=
 it off. */<br>
=C2=A0 =C2=A0 =C2=A0cpu_throttle_stop();<br>
<br>
-=C2=A0 =C2=A0 qemu_mutex_lock_iothread();<br>
+=C2=A0 =C2=A0 bql_lock();<br>
=C2=A0 =C2=A0 =C2=A0switch (s-&gt;state) {<br>
=C2=A0 =C2=A0 =C2=A0case MIGRATION_STATUS_COMPLETED:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0migration_calculate_complete(s);<br>
@@ -3153,7 +3153,7 @@ static void migration_iteration_finish(MigrationState=
 *s)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
=C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0migrate_fd_cleanup_schedule(s);<br>
-=C2=A0 =C2=A0 qemu_mutex_unlock_iothread();<br>
+=C2=A0 =C2=A0 bql_unlock();<br>
=C2=A0}<br>
<br>
=C2=A0static void bg_migration_iteration_finish(MigrationState *s)<br>
@@ -3165,7 +3165,7 @@ static void bg_migration_iteration_finish(MigrationSt=
ate *s)<br>
=C2=A0 =C2=A0 =C2=A0 */<br>
=C2=A0 =C2=A0 =C2=A0ram_write_tracking_stop();<br>
<br>
-=C2=A0 =C2=A0 qemu_mutex_lock_iothread();<br>
+=C2=A0 =C2=A0 bql_lock();<br>
=C2=A0 =C2=A0 =C2=A0switch (s-&gt;state) {<br>
=C2=A0 =C2=A0 =C2=A0case MIGRATION_STATUS_COMPLETED:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0migration_calculate_complete(s);<br>
@@ -3184,7 +3184,7 @@ static void bg_migration_iteration_finish(MigrationSt=
ate *s)<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
=C2=A0 =C2=A0 =C2=A0migrate_fd_cleanup_schedule(s);<br>
-=C2=A0 =C2=A0 qemu_mutex_unlock_iothread();<br>
+=C2=A0 =C2=A0 bql_unlock();<br>
=C2=A0}<br>
<br>
=C2=A0/*<br>
@@ -3306,9 +3306,9 @@ static void *migration_thread(void *opaque)<br>
=C2=A0 =C2=A0 =C2=A0object_ref(OBJECT(s));<br>
=C2=A0 =C2=A0 =C2=A0update_iteration_initial_status(s);<br>
<br>
-=C2=A0 =C2=A0 qemu_mutex_lock_iothread();<br>
+=C2=A0 =C2=A0 bql_lock();<br>
=C2=A0 =C2=A0 =C2=A0qemu_savevm_state_header(s-&gt;to_dst_file);<br>
-=C2=A0 =C2=A0 qemu_mutex_unlock_iothread();<br>
+=C2=A0 =C2=A0 bql_unlock();<br>
<br>
=C2=A0 =C2=A0 =C2=A0/*<br>
=C2=A0 =C2=A0 =C2=A0 * If we opened the return path, we need to make sure d=
st has it<br>
@@ -3336,9 +3336,9 @@ static void *migration_thread(void *opaque)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0qemu_savevm_send_colo_enable(s-&gt;to_dst=
_file);<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
-=C2=A0 =C2=A0 qemu_mutex_lock_iothread();<br>
+=C2=A0 =C2=A0 bql_lock();<br>
=C2=A0 =C2=A0 =C2=A0qemu_savevm_state_setup(s-&gt;to_dst_file);<br>
-=C2=A0 =C2=A0 qemu_mutex_unlock_iothread();<br>
+=C2=A0 =C2=A0 bql_unlock();<br>
<br>
=C2=A0 =C2=A0 =C2=A0qemu_savevm_wait_unplug(s, MIGRATION_STATUS_SETUP,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 MIGRATION_STATUS_ACTIVE);<br>
@@ -3449,10 +3449,10 @@ static void *bg_migration_thread(void *opaque)<br>
=C2=A0 =C2=A0 =C2=A0ram_write_tracking_prepare();<br>
=C2=A0#endif<br>
<br>
-=C2=A0 =C2=A0 qemu_mutex_lock_iothread();<br>
+=C2=A0 =C2=A0 bql_lock();<br>
=C2=A0 =C2=A0 =C2=A0qemu_savevm_state_header(s-&gt;to_dst_file);<br>
=C2=A0 =C2=A0 =C2=A0qemu_savevm_state_setup(s-&gt;to_dst_file);<br>
-=C2=A0 =C2=A0 qemu_mutex_unlock_iothread();<br>
+=C2=A0 =C2=A0 bql_unlock();<br>
<br>
=C2=A0 =C2=A0 =C2=A0qemu_savevm_wait_unplug(s, MIGRATION_STATUS_SETUP,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 MIGRATION_STATUS_ACTIVE);<br>
@@ -3462,7 +3462,7 @@ static void *bg_migration_thread(void *opaque)<br>
=C2=A0 =C2=A0 =C2=A0trace_migration_thread_setup_complete();<br>
=C2=A0 =C2=A0 =C2=A0migration_downtime_start(s);<br>
<br>
-=C2=A0 =C2=A0 qemu_mutex_lock_iothread();<br>
+=C2=A0 =C2=A0 bql_lock();<br>
<br>
=C2=A0 =C2=A0 =C2=A0/*<br>
=C2=A0 =C2=A0 =C2=A0 * If VM is currently in suspended state, then, to make=
 a valid runstate<br>
@@ -3505,7 +3505,7 @@ static void *bg_migration_thread(void *opaque)<br>
=C2=A0 =C2=A0 =C2=A0s-&gt;vm_start_bh =3D qemu_bh_new(bg_migration_vm_start=
_bh, s);<br>
=C2=A0 =C2=A0 =C2=A0qemu_bh_schedule(s-&gt;vm_start_bh);<br>
<br>
-=C2=A0 =C2=A0 qemu_mutex_unlock_iothread();<br>
+=C2=A0 =C2=A0 bql_unlock();<br>
<br>
=C2=A0 =C2=A0 =C2=A0while (migration_is_active(s)) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0MigIterateState iter_state =3D bg_migrati=
on_iteration_run(s);<br>
@@ -3534,7 +3534,7 @@ fail:<br>
=C2=A0 =C2=A0 =C2=A0if (early_fail) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0migrate_set_state(&amp;s-&gt;state, MIGRA=
TION_STATUS_ACTIVE,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0MIGRATION_STA=
TUS_FAILED);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_mutex_unlock_iothread();<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 bql_unlock();<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
=C2=A0 =C2=A0 =C2=A0bg_migration_iteration_finish(s);<br>
diff --git a/migration/ram.c b/migration/ram.c<br>
index 8c7886ab79..08dc7e2909 100644<br>
--- a/migration/ram.c<br>
+++ b/migration/ram.c<br>
@@ -2984,9 +2984,9 @@ static int ram_save_setup(QEMUFile *f, void *opaque)<=
br>
=C2=A0 =C2=A0 =C2=A0migration_ops =3D g_malloc0(sizeof(MigrationOps));<br>
=C2=A0 =C2=A0 =C2=A0migration_ops-&gt;ram_save_target_page =3D ram_save_tar=
get_page_legacy;<br>
<br>
-=C2=A0 =C2=A0 qemu_mutex_unlock_iothread();<br>
+=C2=A0 =C2=A0 bql_unlock();<br>
=C2=A0 =C2=A0 =C2=A0ret =3D multifd_send_sync_main(f);<br>
-=C2=A0 =C2=A0 qemu_mutex_lock_iothread();<br>
+=C2=A0 =C2=A0 bql_lock();<br>
=C2=A0 =C2=A0 =C2=A0if (ret &lt; 0) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return ret;<br>
=C2=A0 =C2=A0 =C2=A0}<br>
@@ -3221,11 +3221,11 @@ static void ram_state_pending_exact(void *opaque, u=
int64_t *must_precopy,<br>
=C2=A0 =C2=A0 =C2=A0uint64_t remaining_size =3D rs-&gt;migration_dirty_page=
s * TARGET_PAGE_SIZE;<br>
<br>
=C2=A0 =C2=A0 =C2=A0if (!migration_in_postcopy() &amp;&amp; remaining_size =
&lt; s-&gt;threshold_size) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_mutex_lock_iothread();<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 bql_lock();<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0WITH_RCU_READ_LOCK_GUARD() {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0migration_bitmap_sync_preco=
py(rs, false);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_mutex_unlock_iothread();<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 bql_unlock();<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0remaining_size =3D rs-&gt;migration_dirty=
_pages * TARGET_PAGE_SIZE;<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
@@ -3453,7 +3453,7 @@ void colo_incoming_start_dirty_log(void)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0RAMBlock *block =3D NULL;<br>
=C2=A0 =C2=A0 =C2=A0/* For memory_global_dirty_log_start below. */<br>
-=C2=A0 =C2=A0 qemu_mutex_lock_iothread();<br>
+=C2=A0 =C2=A0 bql_lock();<br>
=C2=A0 =C2=A0 =C2=A0qemu_mutex_lock_ramlist();<br>
<br>
=C2=A0 =C2=A0 =C2=A0memory_global_dirty_log_sync(false);<br>
@@ -3467,7 +3467,7 @@ void colo_incoming_start_dirty_log(void)<br>
=C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0ram_state-&gt;migration_dirty_pages =3D 0;<br>
=C2=A0 =C2=A0 =C2=A0qemu_mutex_unlock_ramlist();<br>
-=C2=A0 =C2=A0 qemu_mutex_unlock_iothread();<br>
+=C2=A0 =C2=A0 bql_unlock();<br>
=C2=A0}<br>
<br>
=C2=A0/* It is need to hold the global lock to call this helper */<br>
diff --git a/replay/replay-internal.c b/replay/replay-internal.c<br>
index 77d0c82327..3e08e381cb 100644<br>
--- a/replay/replay-internal.c<br>
+++ b/replay/replay-internal.c<br>
@@ -216,7 +216,7 @@ void replay_mutex_lock(void)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0if (replay_mode !=3D REPLAY_MODE_NONE) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned long id;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 g_assert(!qemu_mutex_iothread_locked());<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 g_assert(!bql_locked());<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0g_assert(!replay_mutex_locked());<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0qemu_mutex_lock(&amp;lock);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0id =3D mutex_tail++;<br>
diff --git a/semihosting/console.c b/semihosting/console.c<br>
index 5d61e8207e..60102bbab6 100644<br>
--- a/semihosting/console.c<br>
+++ b/semihosting/console.c<br>
@@ -43,7 +43,7 @@ static SemihostingConsole console;<br>
=C2=A0static int console_can_read(void *opaque)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0SemihostingConsole *c =3D opaque;<br>
-=C2=A0 =C2=A0 g_assert(qemu_mutex_iothread_locked());<br>
+=C2=A0 =C2=A0 g_assert(bql_locked());<br>
=C2=A0 =C2=A0 =C2=A0return (int)fifo8_num_free(&amp;c-&gt;fifo);<br>
=C2=A0}<br>
<br>
@@ -58,7 +58,7 @@ static void console_wake_up(gpointer data, gpointer user_=
data)<br>
=C2=A0static void console_read(void *opaque, const uint8_t *buf, int size)<=
br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0SemihostingConsole *c =3D opaque;<br>
-=C2=A0 =C2=A0 g_assert(qemu_mutex_iothread_locked());<br>
+=C2=A0 =C2=A0 g_assert(bql_locked());<br>
=C2=A0 =C2=A0 =C2=A0while (size-- &amp;&amp; !fifo8_is_full(&amp;c-&gt;fifo=
)) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fifo8_push(&amp;c-&gt;fifo, *buf++);<br>
=C2=A0 =C2=A0 =C2=A0}<br>
@@ -70,7 +70,7 @@ bool qemu_semihosting_console_ready(void)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0SemihostingConsole *c =3D &amp;console;<br>
<br>
-=C2=A0 =C2=A0 g_assert(qemu_mutex_iothread_locked());<br>
+=C2=A0 =C2=A0 g_assert(bql_locked());<br>
=C2=A0 =C2=A0 =C2=A0return !fifo8_is_empty(&amp;c-&gt;fifo);<br>
=C2=A0}<br>
<br>
@@ -78,7 +78,7 @@ void qemu_semihosting_console_block_until_ready(CPUState =
*cs)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0SemihostingConsole *c =3D &amp;console;<br>
<br>
-=C2=A0 =C2=A0 g_assert(qemu_mutex_iothread_locked());<br>
+=C2=A0 =C2=A0 g_assert(bql_locked());<br>
<br>
=C2=A0 =C2=A0 =C2=A0/* Block if the fifo is completely empty. */<br>
=C2=A0 =C2=A0 =C2=A0if (fifo8_is_empty(&amp;c-&gt;fifo)) {<br>
diff --git a/stubs/iothread-lock.c b/stubs/iothread-lock.c<br>
index 5b45b7fc8b..d7890e5581 100644<br>
--- a/stubs/iothread-lock.c<br>
+++ b/stubs/iothread-lock.c<br>
@@ -1,15 +1,15 @@<br>
=C2=A0#include &quot;qemu/osdep.h&quot;<br>
=C2=A0#include &quot;qemu/main-loop.h&quot;<br>
<br>
-bool qemu_mutex_iothread_locked(void)<br>
+bool bql_locked(void)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0return false;<br>
=C2=A0}<br>
<br>
-void qemu_mutex_lock_iothread_impl(const char *file, int line)<br>
+void bql_lock_impl(const char *file, int line)<br>
=C2=A0{<br>
=C2=A0}<br>
<br>
-void qemu_mutex_unlock_iothread(void)<br>
+void bql_unlock(void)<br>
=C2=A0{<br>
=C2=A0}<br>
diff --git a/system/cpu-throttle.c b/system/cpu-throttle.c<br>
index d9bb30a223..786a9a5639 100644<br>
--- a/system/cpu-throttle.c<br>
+++ b/system/cpu-throttle.c<br>
@@ -57,9 +57,9 @@ static void cpu_throttle_thread(CPUState *cpu, run_on_cpu=
_data opaque)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0qemu_cond_timedwait_iothrea=
d(cpu-&gt;halt_cond,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 s=
leeptime_ns / SCALE_MS);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0} else {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_mutex_unlock_iothread();<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bql_unlock();<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0g_usleep(sleeptime_ns / SCA=
LE_US);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_mutex_lock_iothread();<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bql_lock();<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sleeptime_ns =3D endtime_ns - qemu_clock_=
get_ns(QEMU_CLOCK_REALTIME);<br>
=C2=A0 =C2=A0 =C2=A0}<br>
diff --git a/system/cpus.c b/system/cpus.c<br>
index a444a747f0..9b68dc9c7c 100644<br>
--- a/system/cpus.c<br>
+++ b/system/cpus.c<br>
@@ -65,7 +65,8 @@<br>
<br>
=C2=A0#endif /* CONFIG_LINUX */<br>
<br>
-static QemuMutex qemu_global_mutex;<br>
+/* The Big QEMU Lock (BQL) */<br>
+static QemuMutex bql;<br>
<br>
=C2=A0/*<br>
=C2=A0 * The chosen accelerator is supposed to register this.<br>
@@ -389,14 +390,14 @@ void qemu_init_cpu_loop(void)<br>
=C2=A0 =C2=A0 =C2=A0qemu_init_sigbus();<br>
=C2=A0 =C2=A0 =C2=A0qemu_cond_init(&amp;qemu_cpu_cond);<br>
=C2=A0 =C2=A0 =C2=A0qemu_cond_init(&amp;qemu_pause_cond);<br>
-=C2=A0 =C2=A0 qemu_mutex_init(&amp;qemu_global_mutex);<br>
+=C2=A0 =C2=A0 qemu_mutex_init(&amp;bql);<br>
<br>
=C2=A0 =C2=A0 =C2=A0qemu_thread_get_self(&amp;io_thread);<br>
=C2=A0}<br>
<br>
=C2=A0void run_on_cpu(CPUState *cpu, run_on_cpu_func func, run_on_cpu_data =
data)<br>
=C2=A0{<br>
-=C2=A0 =C2=A0 do_run_on_cpu(cpu, func, data, &amp;qemu_global_mutex);<br>
+=C2=A0 =C2=A0 do_run_on_cpu(cpu, func, data, &amp;bql);<br>
=C2=A0}<br>
<br>
=C2=A0static void qemu_cpu_stop(CPUState *cpu, bool exit)<br>
@@ -428,7 +429,7 @@ void qemu_wait_io_event(CPUState *cpu)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0slept =3D true;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0qemu_plugin_vcpu_idle_cb(cp=
u);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_cond_wait(cpu-&gt;halt_cond, &amp;qemu_gl=
obal_mutex);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_cond_wait(cpu-&gt;halt_cond, &amp;bql);<b=
r>
=C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0if (slept) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0qemu_plugin_vcpu_resume_cb(cpu);<br>
@@ -481,46 +482,46 @@ bool qemu_in_vcpu_thread(void)<br>
=C2=A0 =C2=A0 =C2=A0return current_cpu &amp;&amp; qemu_cpu_is_self(current_=
cpu);<br>
=C2=A0}<br>
<br>
-QEMU_DEFINE_STATIC_CO_TLS(bool, iothread_locked)<br>
+QEMU_DEFINE_STATIC_CO_TLS(bool, bql_locked)<br>
<br>
-bool qemu_mutex_iothread_locked(void)<br>
+bool bql_locked(void)<br>
=C2=A0{<br>
-=C2=A0 =C2=A0 return get_iothread_locked();<br>
+=C2=A0 =C2=A0 return get_bql_locked();<br>
=C2=A0}<br>
<br>
=C2=A0bool qemu_in_main_thread(void)<br>
=C2=A0{<br>
-=C2=A0 =C2=A0 return qemu_mutex_iothread_locked();<br>
+=C2=A0 =C2=A0 return bql_locked();<br>
=C2=A0}<br>
<br>
=C2=A0/*<br>
=C2=A0 * The BQL is taken from so many places that it is worth profiling th=
e<br>
=C2=A0 * callers directly, instead of funneling them all through a single f=
unction.<br>
=C2=A0 */<br>
-void qemu_mutex_lock_iothread_impl(const char *file, int line)<br>
+void bql_lock_impl(const char *file, int line)<br>
=C2=A0{<br>
-=C2=A0 =C2=A0 QemuMutexLockFunc bql_lock =3D qatomic_read(&amp;qemu_bql_mu=
tex_lock_func);<br>
+=C2=A0 =C2=A0 QemuMutexLockFunc bql_lock_fn =3D qatomic_read(&amp;bql_mute=
x_lock_func);<br>
<br>
-=C2=A0 =C2=A0 g_assert(!qemu_mutex_iothread_locked());<br>
-=C2=A0 =C2=A0 bql_lock(&amp;qemu_global_mutex, file, line);<br>
-=C2=A0 =C2=A0 set_iothread_locked(true);<br>
+=C2=A0 =C2=A0 g_assert(!bql_locked());<br>
+=C2=A0 =C2=A0 bql_lock_fn(&amp;bql, file, line);<br>
+=C2=A0 =C2=A0 set_bql_locked(true);<br>
=C2=A0}<br>
<br>
-void qemu_mutex_unlock_iothread(void)<br>
+void bql_unlock(void)<br>
=C2=A0{<br>
-=C2=A0 =C2=A0 g_assert(qemu_mutex_iothread_locked());<br>
-=C2=A0 =C2=A0 set_iothread_locked(false);<br>
-=C2=A0 =C2=A0 qemu_mutex_unlock(&amp;qemu_global_mutex);<br>
+=C2=A0 =C2=A0 g_assert(bql_locked());<br>
+=C2=A0 =C2=A0 set_bql_locked(false);<br>
+=C2=A0 =C2=A0 qemu_mutex_unlock(&amp;bql);<br>
=C2=A0}<br>
<br>
=C2=A0void qemu_cond_wait_iothread(QemuCond *cond)<br>
=C2=A0{<br>
-=C2=A0 =C2=A0 qemu_cond_wait(cond, &amp;qemu_global_mutex);<br>
+=C2=A0 =C2=A0 qemu_cond_wait(cond, &amp;bql);<br>
=C2=A0}<br>
<br>
=C2=A0void qemu_cond_timedwait_iothread(QemuCond *cond, int ms)<br>
=C2=A0{<br>
-=C2=A0 =C2=A0 qemu_cond_timedwait(cond, &amp;qemu_global_mutex, ms);<br>
+=C2=A0 =C2=A0 qemu_cond_timedwait(cond, &amp;bql, ms);<br>
=C2=A0}<br>
<br>
=C2=A0/* signal CPU creation */<br>
@@ -571,15 +572,15 @@ void pause_all_vcpus(void)<br>
=C2=A0 =C2=A0 =C2=A0replay_mutex_unlock();<br>
<br>
=C2=A0 =C2=A0 =C2=A0while (!all_vcpus_paused()) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_cond_wait(&amp;qemu_pause_cond, &amp;qemu=
_global_mutex);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_cond_wait(&amp;qemu_pause_cond, &amp;bql)=
;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0CPU_FOREACH(cpu) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0qemu_cpu_kick(cpu);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
-=C2=A0 =C2=A0 qemu_mutex_unlock_iothread();<br>
+=C2=A0 =C2=A0 bql_unlock();<br>
=C2=A0 =C2=A0 =C2=A0replay_mutex_lock();<br>
-=C2=A0 =C2=A0 qemu_mutex_lock_iothread();<br>
+=C2=A0 =C2=A0 bql_lock();<br>
=C2=A0}<br>
<br>
=C2=A0void cpu_resume(CPUState *cpu)<br>
@@ -608,9 +609,9 @@ void cpu_remove_sync(CPUState *cpu)<br>
=C2=A0 =C2=A0 =C2=A0cpu-&gt;stop =3D true;<br>
=C2=A0 =C2=A0 =C2=A0cpu-&gt;unplug =3D true;<br>
=C2=A0 =C2=A0 =C2=A0qemu_cpu_kick(cpu);<br>
-=C2=A0 =C2=A0 qemu_mutex_unlock_iothread();<br>
+=C2=A0 =C2=A0 bql_unlock();<br>
=C2=A0 =C2=A0 =C2=A0qemu_thread_join(cpu-&gt;thread);<br>
-=C2=A0 =C2=A0 qemu_mutex_lock_iothread();<br>
+=C2=A0 =C2=A0 bql_lock();<br>
=C2=A0}<br>
<br>
=C2=A0void cpus_register_accel(const AccelOpsClass *ops)<br>
@@ -649,7 +650,7 @@ void qemu_init_vcpu(CPUState *cpu)<br>
=C2=A0 =C2=A0 =C2=A0cpus_accel-&gt;create_vcpu_thread(cpu);<br>
<br>
=C2=A0 =C2=A0 =C2=A0while (!cpu-&gt;created) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_cond_wait(&amp;qemu_cpu_cond, &amp;qemu_g=
lobal_mutex);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_cond_wait(&amp;qemu_cpu_cond, &amp;bql);<=
br>
=C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0}<br>
<br>
diff --git a/system/dirtylimit.c b/system/dirtylimit.c<br>
index 495c7a7082..b5607eb8c2 100644<br>
--- a/system/dirtylimit.c<br>
+++ b/system/dirtylimit.c<br>
@@ -148,9 +148,9 @@ void vcpu_dirty_rate_stat_stop(void)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0qatomic_set(&amp;vcpu_dirty_rate_stat-&gt;running, 0);<=
br>
=C2=A0 =C2=A0 =C2=A0dirtylimit_state_unlock();<br>
-=C2=A0 =C2=A0 qemu_mutex_unlock_iothread();<br>
+=C2=A0 =C2=A0 bql_unlock();<br>
=C2=A0 =C2=A0 =C2=A0qemu_thread_join(&amp;vcpu_dirty_rate_stat-&gt;thread);=
<br>
-=C2=A0 =C2=A0 qemu_mutex_lock_iothread();<br>
+=C2=A0 =C2=A0 bql_lock();<br>
=C2=A0 =C2=A0 =C2=A0dirtylimit_state_lock();<br>
=C2=A0}<br>
<br>
diff --git a/system/memory.c b/system/memory.c<br>
index 798b6c0a17..7a9dc43c2d 100644<br>
--- a/system/memory.c<br>
+++ b/system/memory.c<br>
@@ -1119,7 +1119,7 @@ void memory_region_transaction_commit(void)<br>
=C2=A0 =C2=A0 =C2=A0AddressSpace *as;<br>
<br>
=C2=A0 =C2=A0 =C2=A0assert(memory_region_transaction_depth);<br>
-=C2=A0 =C2=A0 assert(qemu_mutex_iothread_locked());<br>
+=C2=A0 =C2=A0 assert(bql_locked());<br>
<br>
=C2=A0 =C2=A0 =C2=A0--memory_region_transaction_depth;<br>
=C2=A0 =C2=A0 =C2=A0if (!memory_region_transaction_depth) {<br>
diff --git a/system/physmem.c b/system/physmem.c<br>
index a63853a7bc..4937e67bad 100644<br>
--- a/system/physmem.c<br>
+++ b/system/physmem.c<br>
@@ -2639,8 +2639,8 @@ bool prepare_mmio_access(MemoryRegion *mr)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0bool release_lock =3D false;<br>
<br>
-=C2=A0 =C2=A0 if (!qemu_mutex_iothread_locked()) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_mutex_lock_iothread();<br>
+=C2=A0 =C2=A0 if (!bql_locked()) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 bql_lock();<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0release_lock =3D true;<br>
=C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0if (mr-&gt;flush_coalesced_mmio) {<br>
@@ -2721,7 +2721,7 @@ static MemTxResult flatview_write_continue(FlatView *=
fv, hwaddr addr,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (release_lock) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_mutex_unlock_iothread();<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bql_unlock();<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0release_lock =3D false;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
<br>
@@ -2799,7 +2799,7 @@ MemTxResult flatview_read_continue(FlatView *fv, hwad=
dr addr,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (release_lock) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_mutex_unlock_iothread();<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bql_unlock();<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0release_lock =3D false;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
<br>
diff --git a/system/runstate.c b/system/runstate.c<br>
index ea9d6c2a32..5833ba0675 100644<br>
--- a/system/runstate.c<br>
+++ b/system/runstate.c<br>
@@ -810,7 +810,7 @@ void qemu_init_subsystems(void)<br>
<br>
=C2=A0 =C2=A0 =C2=A0qemu_init_cpu_list();<br>
=C2=A0 =C2=A0 =C2=A0qemu_init_cpu_loop();<br>
-=C2=A0 =C2=A0 qemu_mutex_lock_iothread();<br>
+=C2=A0 =C2=A0 bql_lock();<br>
<br>
=C2=A0 =C2=A0 =C2=A0atexit(qemu_run_exit_notifiers);<br>
<br>
diff --git a/system/watchpoint.c b/system/watchpoint.c<br>
index ba5ad13352..b76007ebf6 100644<br>
--- a/system/watchpoint.c<br>
+++ b/system/watchpoint.c<br>
@@ -155,9 +155,9 @@ void cpu_check_watchpoint(CPUState *cpu, vaddr addr, va=
ddr len,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * Now raise the debug interrupt so that =
it will<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * trigger after the current instruction.=
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_mutex_lock_iothread();<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 bql_lock();<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cpu_interrupt(cpu, CPU_INTERRUPT_DEBUG);<=
br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_mutex_unlock_iothread();<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 bql_unlock();<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return;<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
diff --git a/target/arm/arm-powerctl.c b/target/arm/arm-powerctl.c<br>
index c078849403..8850381565 100644<br>
--- a/target/arm/arm-powerctl.c<br>
+++ b/target/arm/arm-powerctl.c<br>
@@ -88,7 +88,7 @@ static void arm_set_cpu_on_async_work(CPUState *target_cp=
u_state,<br>
=C2=A0 =C2=A0 =C2=A0g_free(info);<br>
<br>
=C2=A0 =C2=A0 =C2=A0/* Finally set the power status */<br>
-=C2=A0 =C2=A0 assert(qemu_mutex_iothread_locked());<br>
+=C2=A0 =C2=A0 assert(bql_locked());<br>
=C2=A0 =C2=A0 =C2=A0target_cpu-&gt;power_state =3D PSCI_ON;<br>
=C2=A0}<br>
<br>
@@ -99,7 +99,7 @@ int arm_set_cpu_on(uint64_t cpuid, uint64_t entry, uint64=
_t context_id,<br>
=C2=A0 =C2=A0 =C2=A0ARMCPU *target_cpu;<br>
=C2=A0 =C2=A0 =C2=A0struct CpuOnInfo *info;<br>
<br>
-=C2=A0 =C2=A0 assert(qemu_mutex_iothread_locked());<br>
+=C2=A0 =C2=A0 assert(bql_locked());<br>
<br>
=C2=A0 =C2=A0 =C2=A0DPRINTF(&quot;cpu %&quot; PRId64 &quot; (EL %d, %s) @ 0=
x%&quot; PRIx64 &quot; with R0 =3D 0x%&quot; PRIx64<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;\n&quot;, cpuid, targ=
et_el, target_aa64 ? &quot;aarch64&quot; : &quot;aarch32&quot;, entry,<br>
@@ -196,7 +196,7 @@ static void arm_set_cpu_on_and_reset_async_work(CPUStat=
e *target_cpu_state,<br>
=C2=A0 =C2=A0 =C2=A0target_cpu_state-&gt;halted =3D 0;<br>
<br>
=C2=A0 =C2=A0 =C2=A0/* Finally set the power status */<br>
-=C2=A0 =C2=A0 assert(qemu_mutex_iothread_locked());<br>
+=C2=A0 =C2=A0 assert(bql_locked());<br>
=C2=A0 =C2=A0 =C2=A0target_cpu-&gt;power_state =3D PSCI_ON;<br>
=C2=A0}<br>
<br>
@@ -205,7 +205,7 @@ int arm_set_cpu_on_and_reset(uint64_t cpuid)<br>
=C2=A0 =C2=A0 =C2=A0CPUState *target_cpu_state;<br>
=C2=A0 =C2=A0 =C2=A0ARMCPU *target_cpu;<br>
<br>
-=C2=A0 =C2=A0 assert(qemu_mutex_iothread_locked());<br>
+=C2=A0 =C2=A0 assert(bql_locked());<br>
<br>
=C2=A0 =C2=A0 =C2=A0/* Retrieve the cpu we are powering up */<br>
=C2=A0 =C2=A0 =C2=A0target_cpu_state =3D arm_get_cpu_by_id(cpuid);<br>
@@ -247,7 +247,7 @@ static void arm_set_cpu_off_async_work(CPUState *target=
_cpu_state,<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0ARMCPU *target_cpu =3D ARM_CPU(target_cpu_state);<br>
<br>
-=C2=A0 =C2=A0 assert(qemu_mutex_iothread_locked());<br>
+=C2=A0 =C2=A0 assert(bql_locked());<br>
=C2=A0 =C2=A0 =C2=A0target_cpu-&gt;power_state =3D PSCI_OFF;<br>
=C2=A0 =C2=A0 =C2=A0target_cpu_state-&gt;halted =3D 1;<br>
=C2=A0 =C2=A0 =C2=A0target_cpu_state-&gt;exception_index =3D EXCP_HLT;<br>
@@ -258,7 +258,7 @@ int arm_set_cpu_off(uint64_t cpuid)<br>
=C2=A0 =C2=A0 =C2=A0CPUState *target_cpu_state;<br>
=C2=A0 =C2=A0 =C2=A0ARMCPU *target_cpu;<br>
<br>
-=C2=A0 =C2=A0 assert(qemu_mutex_iothread_locked());<br>
+=C2=A0 =C2=A0 assert(bql_locked());<br>
<br>
=C2=A0 =C2=A0 =C2=A0DPRINTF(&quot;cpu %&quot; PRId64 &quot;\n&quot;, cpuid)=
;<br>
<br>
@@ -294,7 +294,7 @@ int arm_reset_cpu(uint64_t cpuid)<br>
=C2=A0 =C2=A0 =C2=A0CPUState *target_cpu_state;<br>
=C2=A0 =C2=A0 =C2=A0ARMCPU *target_cpu;<br>
<br>
-=C2=A0 =C2=A0 assert(qemu_mutex_iothread_locked());<br>
+=C2=A0 =C2=A0 assert(bql_locked());<br>
<br>
=C2=A0 =C2=A0 =C2=A0DPRINTF(&quot;cpu %&quot; PRId64 &quot;\n&quot;, cpuid)=
;<br>
<br>
diff --git a/target/arm/helper.c b/target/arm/helper.c<br>
index 2746d3fdac..4a978d1102 100644<br>
--- a/target/arm/helper.c<br>
+++ b/target/arm/helper.c<br>
@@ -5831,7 +5831,7 @@ static void do_hcr_write(CPUARMState *env, uint64_t v=
alue, uint64_t valid_mask)<br>
=C2=A0 =C2=A0 =C2=A0 * VFIQ are masked unless running at EL0 or EL1, and HC=
R<br>
=C2=A0 =C2=A0 =C2=A0 * can only be written at EL2.<br>
=C2=A0 =C2=A0 =C2=A0 */<br>
-=C2=A0 =C2=A0 g_assert(qemu_mutex_iothread_locked());<br>
+=C2=A0 =C2=A0 g_assert(bql_locked());<br>
=C2=A0 =C2=A0 =C2=A0arm_cpu_update_virq(cpu);<br>
=C2=A0 =C2=A0 =C2=A0arm_cpu_update_vfiq(cpu);<br>
=C2=A0 =C2=A0 =C2=A0arm_cpu_update_vserr(cpu);<br>
@@ -11344,7 +11344,7 @@ void arm_cpu_do_interrupt(CPUState *cs)<br>
=C2=A0 =C2=A0 =C2=A0 * BQL needs to be held for any modification of<br>
=C2=A0 =C2=A0 =C2=A0 * cs-&gt;interrupt_request.<br>
=C2=A0 =C2=A0 =C2=A0 */<br>
-=C2=A0 =C2=A0 g_assert(qemu_mutex_iothread_locked());<br>
+=C2=A0 =C2=A0 g_assert(bql_locked());<br>
<br>
=C2=A0 =C2=A0 =C2=A0arm_call_pre_el_change_hook(cpu);<br>
<br>
diff --git a/target/arm/hvf/hvf.c b/target/arm/hvf/hvf.c<br>
index 757e13b0f9..f8dffb815f 100644<br>
--- a/target/arm/hvf/hvf.c<br>
+++ b/target/arm/hvf/hvf.c<br>
@@ -1718,9 +1718,9 @@ static void hvf_wait_for_ipi(CPUState *cpu, struct ti=
mespec *ts)<br>
=C2=A0 =C2=A0 =C2=A0 * sleeping.<br>
=C2=A0 =C2=A0 =C2=A0 */<br>
=C2=A0 =C2=A0 =C2=A0qatomic_set_mb(&amp;cpu-&gt;thread_kicked, false);<br>
-=C2=A0 =C2=A0 qemu_mutex_unlock_iothread();<br>
+=C2=A0 =C2=A0 bql_unlock();<br>
=C2=A0 =C2=A0 =C2=A0pselect(0, 0, 0, 0, ts, &amp;cpu-&gt;accel-&gt;unblock_=
ipi_mask);<br>
-=C2=A0 =C2=A0 qemu_mutex_lock_iothread();<br>
+=C2=A0 =C2=A0 bql_lock();<br>
=C2=A0}<br>
<br>
=C2=A0static void hvf_wfi(CPUState *cpu)<br>
@@ -1821,7 +1821,7 @@ int hvf_vcpu_exec(CPUState *cpu)<br>
<br>
=C2=A0 =C2=A0 =C2=A0flush_cpu_state(cpu);<br>
<br>
-=C2=A0 =C2=A0 qemu_mutex_unlock_iothread();<br>
+=C2=A0 =C2=A0 bql_unlock();<br>
=C2=A0 =C2=A0 =C2=A0assert_hvf_ok(hv_vcpu_run(cpu-&gt;accel-&gt;fd));<br>
<br>
=C2=A0 =C2=A0 =C2=A0/* handle VMEXIT */<br>
@@ -1830,7 +1830,7 @@ int hvf_vcpu_exec(CPUState *cpu)<br>
=C2=A0 =C2=A0 =C2=A0uint32_t ec =3D syn_get_ec(syndrome);<br>
<br>
=C2=A0 =C2=A0 =C2=A0ret =3D 0;<br>
-=C2=A0 =C2=A0 qemu_mutex_lock_iothread();<br>
+=C2=A0 =C2=A0 bql_lock();<br>
=C2=A0 =C2=A0 =C2=A0switch (exit_reason) {<br>
=C2=A0 =C2=A0 =C2=A0case HV_EXIT_REASON_EXCEPTION:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* This is the main one, handle below. */=
<br>
diff --git a/target/arm/kvm.c b/target/arm/kvm.c<br>
index 7903e2ddde..dcfe3d48ab 100644<br>
--- a/target/arm/kvm.c<br>
+++ b/target/arm/kvm.c<br>
@@ -833,7 +833,7 @@ MemTxAttrs kvm_arch_post_run(CPUState *cs, struct kvm_r=
un *run)<br>
=C2=A0 =C2=A0 =C2=A0if (run-&gt;s.regs.device_irq_level !=3D cpu-&gt;device=
_irq_level) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0switched_level =3D cpu-&gt;device_irq_lev=
el ^ run-&gt;s.regs.device_irq_level;<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_mutex_lock_iothread();<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 bql_lock();<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (switched_level &amp; KVM_ARM_DEV_EL1_=
VTIMER) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0qemu_set_irq(cpu-&gt;gt_tim=
er_outputs[GTIMER_VIRT],<br>
@@ -862,7 +862,7 @@ MemTxAttrs kvm_arch_post_run(CPUState *cs, struct kvm_r=
un *run)<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* We also mark unknown levels as process=
ed to not waste cycles */<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cpu-&gt;device_irq_level =3D run-&gt;s.re=
gs.device_irq_level;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_mutex_unlock_iothread();<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 bql_unlock();<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
=C2=A0 =C2=A0 =C2=A0return MEMTXATTRS_UNSPECIFIED;<br>
diff --git a/target/arm/kvm64.c b/target/arm/kvm64.c<br>
index 3c175c93a7..498d77b8cf 100644<br>
--- a/target/arm/kvm64.c<br>
+++ b/target/arm/kvm64.c<br>
@@ -1233,9 +1233,9 @@ bool kvm_arm_handle_debug(CPUState *cs, struct kvm_de=
bug_exit_arch *debug_exit)<br>
=C2=A0 =C2=A0 =C2=A0env-&gt;exception.syndrome =3D debug_exit-&gt;hsr;<br>
=C2=A0 =C2=A0 =C2=A0env-&gt;exception.vaddress =3D debug_exit-&gt;far;<br>
=C2=A0 =C2=A0 =C2=A0env-&gt;exception.target_el =3D 1;<br>
-=C2=A0 =C2=A0 qemu_mutex_lock_iothread();<br>
+=C2=A0 =C2=A0 bql_lock();<br>
=C2=A0 =C2=A0 =C2=A0arm_cpu_do_interrupt(cs);<br>
-=C2=A0 =C2=A0 qemu_mutex_unlock_iothread();<br>
+=C2=A0 =C2=A0 bql_unlock();<br>
<br>
=C2=A0 =C2=A0 =C2=A0return false;<br>
=C2=A0}<br>
diff --git a/target/arm/ptw.c b/target/arm/ptw.c<br>
index 1762b058ae..0ecd3a36da 100644<br>
--- a/target/arm/ptw.c<br>
+++ b/target/arm/ptw.c<br>
@@ -772,9 +772,9 @@ static uint64_t arm_casq_ptw(CPUARMState *env, uint64_t=
 old_val,<br>
=C2=A0#if !TCG_OVERSIZED_GUEST<br>
=C2=A0# error &quot;Unexpected configuration&quot;<br>
=C2=A0#endif<br>
-=C2=A0 =C2=A0 bool locked =3D qemu_mutex_iothread_locked();<br>
+=C2=A0 =C2=A0 bool locked =3D bql_locked();<br>
=C2=A0 =C2=A0 =C2=A0if (!locked) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0qemu_mutex_lock_iothread();<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 bql_lock();<br>
=C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0if (ptw-&gt;out_be) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cur_val =3D ldq_be_p(host);<br>
@@ -788,7 +788,7 @@ static uint64_t arm_casq_ptw(CPUARMState *env, uint64_t=
 old_val,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0if (!locked) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_mutex_unlock_iothread();<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 bql_unlock();<br>
=C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0#endif<br>
<br>
diff --git a/target/arm/tcg/helper-a64.c b/target/arm/tcg/helper-a64.c<br>
index 8ad84623d3..198b975f20 100644<br>
--- a/target/arm/tcg/helper-a64.c<br>
+++ b/target/arm/tcg/helper-a64.c<br>
@@ -809,9 +809,9 @@ void HELPER(exception_return)(CPUARMState *env, uint64_=
t new_pc)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto illegal_return;<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
-=C2=A0 =C2=A0 qemu_mutex_lock_iothread();<br>
+=C2=A0 =C2=A0 bql_lock();<br>
=C2=A0 =C2=A0 =C2=A0arm_call_pre_el_change_hook(env_archcpu(env));<br>
-=C2=A0 =C2=A0 qemu_mutex_unlock_iothread();<br>
+=C2=A0 =C2=A0 bql_unlock();<br>
<br>
=C2=A0 =C2=A0 =C2=A0if (!return_to_aa64) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0env-&gt;aarch64 =3D false;<br>
@@ -876,9 +876,9 @@ void HELPER(exception_return)(CPUARMState *env, uint64_=
t new_pc)<br>
=C2=A0 =C2=A0 =C2=A0 */<br>
=C2=A0 =C2=A0 =C2=A0aarch64_sve_change_el(env, cur_el, new_el, return_to_aa=
64);<br>
<br>
-=C2=A0 =C2=A0 qemu_mutex_lock_iothread();<br>
+=C2=A0 =C2=A0 bql_lock();<br>
=C2=A0 =C2=A0 =C2=A0arm_call_el_change_hook(env_archcpu(env));<br>
-=C2=A0 =C2=A0 qemu_mutex_unlock_iothread();<br>
+=C2=A0 =C2=A0 bql_unlock();<br>
<br>
=C2=A0 =C2=A0 =C2=A0return;<br>
<br>
diff --git a/target/arm/tcg/m_helper.c b/target/arm/tcg/m_helper.c<br>
index a26adb75aa..d1f1e02acc 100644<br>
--- a/target/arm/tcg/m_helper.c<br>
+++ b/target/arm/tcg/m_helper.c<br>
@@ -373,8 +373,8 @@ void HELPER(v7m_preserve_fp_state)(CPUARMState *env)<br=
>
=C2=A0 =C2=A0 =C2=A0bool ts =3D is_secure &amp;&amp; (env-&gt;v7m.fpccr[M_R=
EG_S] &amp; R_V7M_FPCCR_TS_MASK);<br>
=C2=A0 =C2=A0 =C2=A0bool take_exception;<br>
<br>
-=C2=A0 =C2=A0 /* Take the iothread lock as we are going to touch the NVIC =
*/<br>
-=C2=A0 =C2=A0 qemu_mutex_lock_iothread();<br>
+=C2=A0 =C2=A0 /* Take the BQL as we are going to touch the NVIC */<br>
+=C2=A0 =C2=A0 bql_lock();<br>
<br>
=C2=A0 =C2=A0 =C2=A0/* Check the background context had access to the FPU *=
/<br>
=C2=A0 =C2=A0 =C2=A0if (!v7m_cpacr_pass(env, is_secure, is_priv)) {<br>
@@ -428,7 +428,7 @@ void HELPER(v7m_preserve_fp_state)(CPUARMState *env)<br=
>
=C2=A0 =C2=A0 =C2=A0take_exception =3D !stacked_ok &amp;&amp;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0armv7m_nvic_can_take_pending_exception(en=
v-&gt;nvic);<br>
<br>
-=C2=A0 =C2=A0 qemu_mutex_unlock_iothread();<br>
+=C2=A0 =C2=A0 bql_unlock();<br>
<br>
=C2=A0 =C2=A0 =C2=A0if (take_exception) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0raise_exception_ra(env, EXCP_LAZYFP, 0, 1=
, GETPC());<br>
diff --git a/target/arm/tcg/op_helper.c b/target/arm/tcg/op_helper.c<br>
index ea08936a85..34e706e0fd 100644<br>
--- a/target/arm/tcg/op_helper.c<br>
+++ b/target/arm/tcg/op_helper.c<br>
@@ -427,9 +427,9 @@ void HELPER(cpsr_write_eret)(CPUARMState *env, uint32_t=
 val)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0uint32_t mask;<br>
<br>
-=C2=A0 =C2=A0 qemu_mutex_lock_iothread();<br>
+=C2=A0 =C2=A0 bql_lock();<br>
=C2=A0 =C2=A0 =C2=A0arm_call_pre_el_change_hook(env_archcpu(env));<br>
-=C2=A0 =C2=A0 qemu_mutex_unlock_iothread();<br>
+=C2=A0 =C2=A0 bql_unlock();<br>
<br>
=C2=A0 =C2=A0 =C2=A0mask =3D aarch32_cpsr_valid_mask(env-&gt;features, &amp=
;env_archcpu(env)-&gt;isar);<br>
=C2=A0 =C2=A0 =C2=A0cpsr_write(env, val, mask, CPSRWriteExceptionReturn);<b=
r>
@@ -442,9 +442,9 @@ void HELPER(cpsr_write_eret)(CPUARMState *env, uint32_t=
 val)<br>
=C2=A0 =C2=A0 =C2=A0env-&gt;regs[15] &amp;=3D (env-&gt;thumb ? ~1 : ~3);<br=
>
=C2=A0 =C2=A0 =C2=A0arm_rebuild_hflags(env);<br>
<br>
-=C2=A0 =C2=A0 qemu_mutex_lock_iothread();<br>
+=C2=A0 =C2=A0 bql_lock();<br>
=C2=A0 =C2=A0 =C2=A0arm_call_el_change_hook(env_archcpu(env));<br>
-=C2=A0 =C2=A0 qemu_mutex_unlock_iothread();<br>
+=C2=A0 =C2=A0 bql_unlock();<br>
=C2=A0}<br>
<br>
=C2=A0/* Access to user mode registers from privileged modes.=C2=A0 */<br>
@@ -803,9 +803,9 @@ void HELPER(set_cp_reg)(CPUARMState *env, const void *r=
ip, uint32_t value)<br>
=C2=A0 =C2=A0 =C2=A0const ARMCPRegInfo *ri =3D rip;<br>
<br>
=C2=A0 =C2=A0 =C2=A0if (ri-&gt;type &amp; ARM_CP_IO) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_mutex_lock_iothread();<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 bql_lock();<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ri-&gt;writefn(env, ri, value);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_mutex_unlock_iothread();<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 bql_unlock();<br>
=C2=A0 =C2=A0 =C2=A0} else {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ri-&gt;writefn(env, ri, value);<br>
=C2=A0 =C2=A0 =C2=A0}<br>
@@ -817,9 +817,9 @@ uint32_t HELPER(get_cp_reg)(CPUARMState *env, const voi=
d *rip)<br>
=C2=A0 =C2=A0 =C2=A0uint32_t res;<br>
<br>
=C2=A0 =C2=A0 =C2=A0if (ri-&gt;type &amp; ARM_CP_IO) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_mutex_lock_iothread();<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 bql_lock();<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0res =3D ri-&gt;readfn(env, ri);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_mutex_unlock_iothread();<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 bql_unlock();<br>
=C2=A0 =C2=A0 =C2=A0} else {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0res =3D ri-&gt;readfn(env, ri);<br>
=C2=A0 =C2=A0 =C2=A0}<br>
@@ -832,9 +832,9 @@ void HELPER(set_cp_reg64)(CPUARMState *env, const void =
*rip, uint64_t value)<br>
=C2=A0 =C2=A0 =C2=A0const ARMCPRegInfo *ri =3D rip;<br>
<br>
=C2=A0 =C2=A0 =C2=A0if (ri-&gt;type &amp; ARM_CP_IO) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_mutex_lock_iothread();<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 bql_lock();<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ri-&gt;writefn(env, ri, value);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_mutex_unlock_iothread();<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 bql_unlock();<br>
=C2=A0 =C2=A0 =C2=A0} else {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ri-&gt;writefn(env, ri, value);<br>
=C2=A0 =C2=A0 =C2=A0}<br>
@@ -846,9 +846,9 @@ uint64_t HELPER(get_cp_reg64)(CPUARMState *env, const v=
oid *rip)<br>
=C2=A0 =C2=A0 =C2=A0uint64_t res;<br>
<br>
=C2=A0 =C2=A0 =C2=A0if (ri-&gt;type &amp; ARM_CP_IO) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_mutex_lock_iothread();<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 bql_lock();<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0res =3D ri-&gt;readfn(env, ri);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_mutex_unlock_iothread();<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 bql_unlock();<br>
=C2=A0 =C2=A0 =C2=A0} else {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0res =3D ri-&gt;readfn(env, ri);<br>
=C2=A0 =C2=A0 =C2=A0}<br>
diff --git a/target/arm/tcg/psci.c b/target/arm/tcg/psci.c<br>
index 6c1239bb96..9080a91d9c 100644<br>
--- a/target/arm/tcg/psci.c<br>
+++ b/target/arm/tcg/psci.c<br>
@@ -107,7 +107,7 @@ void arm_handle_psci_call(ARMCPU *cpu)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0target_cpu =3D ARM_CPU(targ=
et_cpu_state);<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 g_assert(qemu_mutex_iothread_loc=
ked());<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 g_assert(bql_locked());<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D target_cpu-&gt;powe=
r_state;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0default:<br>
diff --git a/target/hppa/int_helper.c b/target/hppa/int_helper.c<br>
index 98e9d688f6..efe638b36e 100644<br>
--- a/target/hppa/int_helper.c<br>
+++ b/target/hppa/int_helper.c<br>
@@ -84,17 +84,17 @@ void hppa_cpu_alarm_timer(void *opaque)<br>
=C2=A0void HELPER(write_eirr)(CPUHPPAState *env, target_ulong val)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0env-&gt;cr[CR_EIRR] &amp;=3D ~val;<br>
-=C2=A0 =C2=A0 qemu_mutex_lock_iothread();<br>
+=C2=A0 =C2=A0 bql_lock();<br>
=C2=A0 =C2=A0 =C2=A0eval_interrupt(env_archcpu(env));<br>
-=C2=A0 =C2=A0 qemu_mutex_unlock_iothread();<br>
+=C2=A0 =C2=A0 bql_unlock();<br>
=C2=A0}<br>
<br>
=C2=A0void HELPER(write_eiem)(CPUHPPAState *env, target_ulong val)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0env-&gt;cr[CR_EIEM] =3D val;<br>
-=C2=A0 =C2=A0 qemu_mutex_lock_iothread();<br>
+=C2=A0 =C2=A0 bql_lock();<br>
=C2=A0 =C2=A0 =C2=A0eval_interrupt(env_archcpu(env));<br>
-=C2=A0 =C2=A0 qemu_mutex_unlock_iothread();<br>
+=C2=A0 =C2=A0 bql_unlock();<br>
=C2=A0}<br>
<br>
=C2=A0void hppa_cpu_do_interrupt(CPUState *cs)<br>
diff --git a/target/i386/hvf/hvf.c b/target/i386/hvf/hvf.c<br>
index 20b9ca3ef5..11ffdd4c69 100644<br>
--- a/target/i386/hvf/hvf.c<br>
+++ b/target/i386/hvf/hvf.c<br>
@@ -429,9 +429,9 @@ int hvf_vcpu_exec(CPUState *cpu)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0vmx_update_tpr(cpu);<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_mutex_unlock_iothread();<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 bql_unlock();<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!cpu_is_bsp(X86_CPU(cpu)) &amp;&amp; =
cpu-&gt;halted) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_mutex_lock_iothread();<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bql_lock();<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return EXCP_HLT;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
<br>
@@ -450,7 +450,7 @@ int hvf_vcpu_exec(CPUState *cpu)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0rip =3D rreg(cpu-&gt;accel-&gt;fd, HV_X86=
_RIP);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0env-&gt;eflags =3D rreg(cpu-&gt;accel-&gt=
;fd, HV_X86_RFLAGS);<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_mutex_lock_iothread();<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 bql_lock();<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0update_apic_tpr(cpu);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0current_cpu =3D cpu;<br>
diff --git a/target/i386/kvm/hyperv.c b/target/i386/kvm/hyperv.c<br>
index e3ac978648..6825c89af3 100644<br>
--- a/target/i386/kvm/hyperv.c<br>
+++ b/target/i386/kvm/hyperv.c<br>
@@ -45,9 +45,9 @@ void hyperv_x86_synic_update(X86CPU *cpu)<br>
<br>
=C2=A0static void async_synic_update(CPUState *cs, run_on_cpu_data data)<br=
>
=C2=A0{<br>
-=C2=A0 =C2=A0 qemu_mutex_lock_iothread();<br>
+=C2=A0 =C2=A0 bql_lock();<br>
=C2=A0 =C2=A0 =C2=A0hyperv_x86_synic_update(X86_CPU(cs));<br>
-=C2=A0 =C2=A0 qemu_mutex_unlock_iothread();<br>
+=C2=A0 =C2=A0 bql_unlock();<br>
=C2=A0}<br>
<br>
=C2=A0int kvm_hv_handle_exit(X86CPU *cpu, struct kvm_hyperv_exit *exit)<br>
diff --git a/target/i386/kvm/kvm.c b/target/i386/kvm/kvm.c<br>
index 4ce80555b4..76a66246eb 100644<br>
--- a/target/i386/kvm/kvm.c<br>
+++ b/target/i386/kvm/kvm.c<br>
@@ -4713,9 +4713,9 @@ void kvm_arch_pre_run(CPUState *cpu, struct kvm_run *=
run)<br>
=C2=A0 =C2=A0 =C2=A0/* Inject NMI */<br>
=C2=A0 =C2=A0 =C2=A0if (cpu-&gt;interrupt_request &amp; (CPU_INTERRUPT_NMI =
| CPU_INTERRUPT_SMI)) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (cpu-&gt;interrupt_request &amp; CPU_I=
NTERRUPT_NMI) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_mutex_lock_iothread();<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bql_lock();<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cpu-&gt;interrupt_request &=
amp;=3D ~CPU_INTERRUPT_NMI;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_mutex_unlock_iothread();<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bql_unlock();<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0DPRINTF(&quot;injected NMI\=
n&quot;);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D kvm_vcpu_ioctl(cpu,=
 KVM_NMI);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (ret &lt; 0) {<br>
@@ -4724,9 +4724,9 @@ void kvm_arch_pre_run(CPUState *cpu, struct kvm_run *=
run)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (cpu-&gt;interrupt_request &amp; CPU_I=
NTERRUPT_SMI) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_mutex_lock_iothread();<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bql_lock();<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cpu-&gt;interrupt_request &=
amp;=3D ~CPU_INTERRUPT_SMI;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_mutex_unlock_iothread();<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bql_unlock();<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0DPRINTF(&quot;injected SMI\=
n&quot;);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D kvm_vcpu_ioctl(cpu,=
 KVM_SMI);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (ret &lt; 0) {<br>
@@ -4737,7 +4737,7 @@ void kvm_arch_pre_run(CPUState *cpu, struct kvm_run *=
run)<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
=C2=A0 =C2=A0 =C2=A0if (!kvm_pic_in_kernel()) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_mutex_lock_iothread();<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 bql_lock();<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
=C2=A0 =C2=A0 =C2=A0/* Force the VCPU out of its inner loop to process any =
INIT requests<br>
@@ -4790,7 +4790,7 @@ void kvm_arch_pre_run(CPUState *cpu, struct kvm_run *=
run)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0DPRINTF(&quot;setting tpr\n&quot;);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0run-&gt;cr8 =3D cpu_get_apic_tpr(x86_cpu-=
&gt;apic_state);<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_mutex_unlock_iothread();<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 bql_unlock();<br>
=C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0}<br>
<br>
@@ -4838,12 +4838,12 @@ MemTxAttrs kvm_arch_post_run(CPUState *cpu, struct =
kvm_run *run)<br>
=C2=A0 =C2=A0 =C2=A0/* We need to protect the apic state against concurrent=
 accesses from<br>
=C2=A0 =C2=A0 =C2=A0 * different threads in case the userspace irqchip is u=
sed. */<br>
=C2=A0 =C2=A0 =C2=A0if (!kvm_irqchip_in_kernel()) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_mutex_lock_iothread();<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 bql_lock();<br>
=C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0cpu_set_apic_tpr(x86_cpu-&gt;apic_state, run-&gt;cr8);<=
br>
=C2=A0 =C2=A0 =C2=A0cpu_set_apic_base(x86_cpu-&gt;apic_state, run-&gt;apic_=
base);<br>
=C2=A0 =C2=A0 =C2=A0if (!kvm_irqchip_in_kernel()) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_mutex_unlock_iothread();<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 bql_unlock();<br>
=C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0return cpu_get_mem_attrs(env);<br>
=C2=A0}<br>
@@ -5277,17 +5277,17 @@ int kvm_arch_handle_exit(CPUState *cs, struct kvm_r=
un *run)<br>
=C2=A0 =C2=A0 =C2=A0switch (run-&gt;exit_reason) {<br>
=C2=A0 =C2=A0 =C2=A0case KVM_EXIT_HLT:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0DPRINTF(&quot;handle_hlt\n&quot;);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_mutex_lock_iothread();<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 bql_lock();<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D kvm_handle_halt(cpu);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_mutex_unlock_iothread();<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 bql_unlock();<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
=C2=A0 =C2=A0 =C2=A0case KVM_EXIT_SET_TPR:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D 0;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
=C2=A0 =C2=A0 =C2=A0case KVM_EXIT_TPR_ACCESS:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_mutex_lock_iothread();<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 bql_lock();<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D kvm_handle_tpr_access(cpu);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_mutex_unlock_iothread();<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 bql_unlock();<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
=C2=A0 =C2=A0 =C2=A0case KVM_EXIT_FAIL_ENTRY:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0code =3D run-&gt;fail_entry.hardware_entr=
y_failure_reason;<br>
@@ -5313,9 +5313,9 @@ int kvm_arch_handle_exit(CPUState *cs, struct kvm_run=
 *run)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
=C2=A0 =C2=A0 =C2=A0case KVM_EXIT_DEBUG:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0DPRINTF(&quot;kvm_exit_debug\n&quot;);<br=
>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_mutex_lock_iothread();<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 bql_lock();<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D kvm_handle_debug(cpu, &amp;run-&g=
t;debug.arch);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_mutex_unlock_iothread();<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 bql_unlock();<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
=C2=A0 =C2=A0 =C2=A0case KVM_EXIT_HYPERV:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D kvm_hv_handle_exit(cpu, &amp;run-=
&gt;hyperv);<br>
diff --git a/target/i386/kvm/xen-emu.c b/target/i386/kvm/xen-emu.c<br>
index c0631f9cf4..b0ed2e6aeb 100644<br>
--- a/target/i386/kvm/xen-emu.c<br>
+++ b/target/i386/kvm/xen-emu.c<br>
@@ -403,7 +403,7 @@ void kvm_xen_maybe_deassert_callback(CPUState *cs)<br>
<br>
=C2=A0 =C2=A0 =C2=A0/* If the evtchn_upcall_pending flag is cleared, turn t=
he GSI off. */<br>
=C2=A0 =C2=A0 =C2=A0if (!vi-&gt;evtchn_upcall_pending) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_mutex_lock_iothread();<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 bql_lock();<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/*<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * Check again now we have the lock, beca=
use it may have been<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * asserted in the interim. And we don&#3=
9;t want to take the lock<br>
@@ -413,7 +413,7 @@ void kvm_xen_maybe_deassert_callback(CPUState *cs)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0X86_CPU(cs)-&gt;env.xen_cal=
lback_asserted =3D false;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0xen_evtchn_set_callback_lev=
el(0);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_mutex_unlock_iothread();<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 bql_unlock();<br>
=C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0}<br>
<br>
@@ -773,9 +773,9 @@ static bool handle_set_param(struct kvm_xen_exit *exit,=
 X86CPU *cpu,<br>
<br>
=C2=A0 =C2=A0 =C2=A0switch (hp.index) {<br>
=C2=A0 =C2=A0 =C2=A0case HVM_PARAM_CALLBACK_IRQ:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_mutex_lock_iothread();<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 bql_lock();<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0err =3D xen_evtchn_set_callback_param(hp.=
value);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_mutex_unlock_iothread();<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 bql_unlock();<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0xen_set_long_mode(exit-&gt;u.hcall.longmo=
de);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
=C2=A0 =C2=A0 =C2=A0default:<br>
@@ -1408,7 +1408,7 @@ int kvm_xen_soft_reset(void)<br>
=C2=A0 =C2=A0 =C2=A0CPUState *cpu;<br>
=C2=A0 =C2=A0 =C2=A0int err;<br>
<br>
-=C2=A0 =C2=A0 assert(qemu_mutex_iothread_locked());<br>
+=C2=A0 =C2=A0 assert(bql_locked());<br>
<br>
=C2=A0 =C2=A0 =C2=A0trace_kvm_xen_soft_reset();<br>
<br>
@@ -1481,9 +1481,9 @@ static int schedop_shutdown(CPUState *cs, uint64_t ar=
g)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
<br>
=C2=A0 =C2=A0 =C2=A0case SHUTDOWN_soft_reset:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_mutex_lock_iothread();<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 bql_lock();<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D kvm_xen_soft_reset();<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_mutex_unlock_iothread();<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 bql_unlock();<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
<br>
=C2=A0 =C2=A0 =C2=A0default:<br>
diff --git a/target/i386/nvmm/nvmm-accel-ops.c b/target/i386/nvmm/nvmm-acce=
l-ops.c<br>
index 6c46101ac1..f9d5e9a37a 100644<br>
--- a/target/i386/nvmm/nvmm-accel-ops.c<br>
+++ b/target/i386/nvmm/nvmm-accel-ops.c<br>
@@ -25,7 +25,7 @@ static void *qemu_nvmm_cpu_thread_fn(void *arg)<br>
<br>
=C2=A0 =C2=A0 =C2=A0rcu_register_thread();<br>
<br>
-=C2=A0 =C2=A0 qemu_mutex_lock_iothread();<br>
+=C2=A0 =C2=A0 bql_lock();<br>
=C2=A0 =C2=A0 =C2=A0qemu_thread_get_self(cpu-&gt;thread);<br>
=C2=A0 =C2=A0 =C2=A0cpu-&gt;thread_id =3D qemu_get_thread_id();<br>
=C2=A0 =C2=A0 =C2=A0current_cpu =3D cpu;<br>
@@ -55,7 +55,7 @@ static void *qemu_nvmm_cpu_thread_fn(void *arg)<br>
<br>
=C2=A0 =C2=A0 =C2=A0nvmm_destroy_vcpu(cpu);<br>
=C2=A0 =C2=A0 =C2=A0cpu_thread_signal_destroyed(cpu);<br>
-=C2=A0 =C2=A0 qemu_mutex_unlock_iothread();<br>
+=C2=A0 =C2=A0 bql_unlock();<br>
=C2=A0 =C2=A0 =C2=A0rcu_unregister_thread();<br>
=C2=A0 =C2=A0 =C2=A0return NULL;<br>
=C2=A0}<br>
diff --git a/target/i386/nvmm/nvmm-all.c b/target/i386/nvmm/nvmm-all.c<br>
index 7d752bc5e0..cfdca91123 100644<br>
--- a/target/i386/nvmm/nvmm-all.c<br>
+++ b/target/i386/nvmm/nvmm-all.c<br>
@@ -399,7 +399,7 @@ nvmm_vcpu_pre_run(CPUState *cpu)<br>
=C2=A0 =C2=A0 =C2=A0uint8_t tpr;<br>
=C2=A0 =C2=A0 =C2=A0int ret;<br>
<br>
-=C2=A0 =C2=A0 qemu_mutex_lock_iothread();<br>
+=C2=A0 =C2=A0 bql_lock();<br>
<br>
=C2=A0 =C2=A0 =C2=A0tpr =3D cpu_get_apic_tpr(x86_cpu-&gt;apic_state);<br>
=C2=A0 =C2=A0 =C2=A0if (tpr !=3D qcpu-&gt;tpr) {<br>
@@ -462,7 +462,7 @@ nvmm_vcpu_pre_run(CPUState *cpu)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
-=C2=A0 =C2=A0 qemu_mutex_unlock_iothread();<br>
+=C2=A0 =C2=A0 bql_unlock();<br>
=C2=A0}<br>
<br>
=C2=A0/*<br>
@@ -485,9 +485,9 @@ nvmm_vcpu_post_run(CPUState *cpu, struct nvmm_vcpu_exit=
 *exit)<br>
=C2=A0 =C2=A0 =C2=A0tpr =3D exit-&gt;exitstate.cr8;<br>
=C2=A0 =C2=A0 =C2=A0if (qcpu-&gt;tpr !=3D tpr) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0qcpu-&gt;tpr =3D tpr;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_mutex_lock_iothread();<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 bql_lock();<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cpu_set_apic_tpr(x86_cpu-&gt;apic_state, =
qcpu-&gt;tpr);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_mutex_unlock_iothread();<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 bql_unlock();<br>
=C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0}<br>
<br>
@@ -648,7 +648,7 @@ nvmm_handle_halted(struct nvmm_machine *mach, CPUState =
*cpu,<br>
=C2=A0 =C2=A0 =C2=A0CPUX86State *env =3D cpu_env(cpu);<br>
=C2=A0 =C2=A0 =C2=A0int ret =3D 0;<br>
<br>
-=C2=A0 =C2=A0 qemu_mutex_lock_iothread();<br>
+=C2=A0 =C2=A0 bql_lock();<br>
<br>
=C2=A0 =C2=A0 =C2=A0if (!((cpu-&gt;interrupt_request &amp; CPU_INTERRUPT_HA=
RD) &amp;&amp;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(env-&gt;eflags &amp; IF_MASK)) &a=
mp;&amp;<br>
@@ -658,7 +658,7 @@ nvmm_handle_halted(struct nvmm_machine *mach, CPUState =
*cpu,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D 1;<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
-=C2=A0 =C2=A0 qemu_mutex_unlock_iothread();<br>
+=C2=A0 =C2=A0 bql_unlock();<br>
<br>
=C2=A0 =C2=A0 =C2=A0return ret;<br>
=C2=A0}<br>
@@ -721,7 +721,7 @@ nvmm_vcpu_loop(CPUState *cpu)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
-=C2=A0 =C2=A0 qemu_mutex_unlock_iothread();<br>
+=C2=A0 =C2=A0 bql_unlock();<br>
=C2=A0 =C2=A0 =C2=A0cpu_exec_start(cpu);<br>
<br>
=C2=A0 =C2=A0 =C2=A0/*<br>
@@ -806,16 +806,16 @@ nvmm_vcpu_loop(CPUState *cpu)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0error_report(&quot;NVMM: Un=
expected VM exit code 0x%lx [hw=3D0x%lx]&quot;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0exit-&gt;reas=
on, exit-&gt;u.inv.hwcode);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0nvmm_get_registers(cpu);<br=
>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_mutex_lock_iothread();<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bql_lock();<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0qemu_system_guest_panicked(=
cpu_get_crash_info(cpu));<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_mutex_unlock_iothread();<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bql_unlock();<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D -1;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0} while (ret =3D=3D 0);<br>
<br>
=C2=A0 =C2=A0 =C2=A0cpu_exec_end(cpu);<br>
-=C2=A0 =C2=A0 qemu_mutex_lock_iothread();<br>
+=C2=A0 =C2=A0 bql_lock();<br>
<br>
=C2=A0 =C2=A0 =C2=A0qatomic_set(&amp;cpu-&gt;exit_request, false);<br>
<br>
diff --git a/target/i386/tcg/sysemu/fpu_helper.c b/target/i386/tcg/sysemu/f=
pu_helper.c<br>
index 93506cdd94..e0305ba234 100644<br>
--- a/target/i386/tcg/sysemu/fpu_helper.c<br>
+++ b/target/i386/tcg/sysemu/fpu_helper.c<br>
@@ -32,9 +32,9 @@ void x86_register_ferr_irq(qemu_irq irq)<br>
=C2=A0void fpu_check_raise_ferr_irq(CPUX86State *env)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0if (ferr_irq &amp;&amp; !(env-&gt;hflags2 &amp; HF2_IGN=
NE_MASK)) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_mutex_lock_iothread();<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 bql_lock();<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0qemu_irq_raise(ferr_irq);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_mutex_unlock_iothread();<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 bql_unlock();<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return;<br>
=C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0}<br>
@@ -49,7 +49,7 @@ void cpu_set_ignne(void)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0CPUX86State *env =3D &amp;X86_CPU(first_cpu)-&gt;env;<b=
r>
<br>
-=C2=A0 =C2=A0 assert(qemu_mutex_iothread_locked());<br>
+=C2=A0 =C2=A0 assert(bql_locked());<br>
<br>
=C2=A0 =C2=A0 =C2=A0env-&gt;hflags2 |=3D HF2_IGNNE_MASK;<br>
=C2=A0 =C2=A0 =C2=A0/*<br>
diff --git a/target/i386/tcg/sysemu/misc_helper.c b/target/i386/tcg/sysemu/=
misc_helper.c<br>
index e1528b7f80..1ddfc9fe09 100644<br>
--- a/target/i386/tcg/sysemu/misc_helper.c<br>
+++ b/target/i386/tcg/sysemu/misc_helper.c<br>
@@ -118,9 +118,9 @@ void helper_write_crN(CPUX86State *env, int reg, target=
_ulong t0)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
=C2=A0 =C2=A0 =C2=A0case 8:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!(env-&gt;hflags2 &amp; HF2_VINTR_MAS=
K)) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_mutex_lock_iothread();<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bql_lock();<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cpu_set_apic_tpr(env_archcp=
u(env)-&gt;apic_state, t0);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_mutex_unlock_iothread();<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bql_unlock();<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0env-&gt;int_ctl =3D (env-&gt;int_ctl &amp=
; ~V_TPR_MASK) | (t0 &amp; V_TPR_MASK);<br>
<br>
diff --git a/target/i386/whpx/whpx-accel-ops.c b/target/i386/whpx/whpx-acce=
l-ops.c<br>
index 67cad86720..e783a760a7 100644<br>
--- a/target/i386/whpx/whpx-accel-ops.c<br>
+++ b/target/i386/whpx/whpx-accel-ops.c<br>
@@ -25,7 +25,7 @@ static void *whpx_cpu_thread_fn(void *arg)<br>
<br>
=C2=A0 =C2=A0 =C2=A0rcu_register_thread();<br>
<br>
-=C2=A0 =C2=A0 qemu_mutex_lock_iothread();<br>
+=C2=A0 =C2=A0 bql_lock();<br>
=C2=A0 =C2=A0 =C2=A0qemu_thread_get_self(cpu-&gt;thread);<br>
=C2=A0 =C2=A0 =C2=A0cpu-&gt;thread_id =3D qemu_get_thread_id();<br>
=C2=A0 =C2=A0 =C2=A0current_cpu =3D cpu;<br>
@@ -55,7 +55,7 @@ static void *whpx_cpu_thread_fn(void *arg)<br>
<br>
=C2=A0 =C2=A0 =C2=A0whpx_destroy_vcpu(cpu);<br>
=C2=A0 =C2=A0 =C2=A0cpu_thread_signal_destroyed(cpu);<br>
-=C2=A0 =C2=A0 qemu_mutex_unlock_iothread();<br>
+=C2=A0 =C2=A0 bql_unlock();<br>
=C2=A0 =C2=A0 =C2=A0rcu_unregister_thread();<br>
=C2=A0 =C2=A0 =C2=A0return NULL;<br>
=C2=A0}<br>
diff --git a/target/i386/whpx/whpx-all.c b/target/i386/whpx/whpx-all.c<br>
index d29ba916a0..a7262654ac 100644<br>
--- a/target/i386/whpx/whpx-all.c<br>
+++ b/target/i386/whpx/whpx-all.c<br>
@@ -1324,7 +1324,7 @@ static int whpx_first_vcpu_starting(CPUState *cpu)<br=
>
=C2=A0 =C2=A0 =C2=A0struct whpx_state *whpx =3D &amp;whpx_global;<br>
=C2=A0 =C2=A0 =C2=A0HRESULT hr;<br>
<br>
-=C2=A0 =C2=A0 g_assert(qemu_mutex_iothread_locked());<br>
+=C2=A0 =C2=A0 g_assert(bql_locked());<br>
<br>
=C2=A0 =C2=A0 =C2=A0if (!QTAILQ_EMPTY(&amp;cpu-&gt;breakpoints) ||<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(whpx-&gt;breakpoints.break=
points &amp;&amp;<br>
@@ -1442,7 +1442,7 @@ static int whpx_handle_halt(CPUState *cpu)<br>
=C2=A0 =C2=A0 =C2=A0CPUX86State *env =3D cpu_env(cpu);<br>
=C2=A0 =C2=A0 =C2=A0int ret =3D 0;<br>
<br>
-=C2=A0 =C2=A0 qemu_mutex_lock_iothread();<br>
+=C2=A0 =C2=A0 bql_lock();<br>
=C2=A0 =C2=A0 =C2=A0if (!((cpu-&gt;interrupt_request &amp; CPU_INTERRUPT_HA=
RD) &amp;&amp;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(env-&gt;eflags &amp; IF_MASK)) &a=
mp;&amp;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0!(cpu-&gt;interrupt_request &amp; CPU_INT=
ERRUPT_NMI)) {<br>
@@ -1450,7 +1450,7 @@ static int whpx_handle_halt(CPUState *cpu)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cpu-&gt;halted =3D true;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D 1;<br>
=C2=A0 =C2=A0 =C2=A0}<br>
-=C2=A0 =C2=A0 qemu_mutex_unlock_iothread();<br>
+=C2=A0 =C2=A0 bql_unlock();<br>
<br>
=C2=A0 =C2=A0 =C2=A0return ret;<br>
=C2=A0}<br>
@@ -1472,7 +1472,7 @@ static void whpx_vcpu_pre_run(CPUState *cpu)<br>
=C2=A0 =C2=A0 =C2=A0memset(&amp;new_int, 0, sizeof(new_int));<br>
=C2=A0 =C2=A0 =C2=A0memset(reg_values, 0, sizeof(reg_values));<br>
<br>
-=C2=A0 =C2=A0 qemu_mutex_lock_iothread();<br>
+=C2=A0 =C2=A0 bql_lock();<br>
<br>
=C2=A0 =C2=A0 =C2=A0/* Inject NMI */<br>
=C2=A0 =C2=A0 =C2=A0if (!vcpu-&gt;interruption_pending &amp;&amp;<br>
@@ -1563,7 +1563,7 @@ static void whpx_vcpu_pre_run(CPUState *cpu)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0reg_count +=3D 1;<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
-=C2=A0 =C2=A0 qemu_mutex_unlock_iothread();<br>
+=C2=A0 =C2=A0 bql_unlock();<br>
=C2=A0 =C2=A0 =C2=A0vcpu-&gt;ready_for_pic_interrupt =3D false;<br>
<br>
=C2=A0 =C2=A0 =C2=A0if (reg_count) {<br>
@@ -1590,9 +1590,9 @@ static void whpx_vcpu_post_run(CPUState *cpu)<br>
=C2=A0 =C2=A0 =C2=A0uint64_t tpr =3D vcpu-&gt;exit_ctx.VpContext.Cr8;<br>
=C2=A0 =C2=A0 =C2=A0if (vcpu-&gt;tpr !=3D tpr) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0vcpu-&gt;tpr =3D tpr;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_mutex_lock_iothread();<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 bql_lock();<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cpu_set_apic_tpr(x86_cpu-&gt;apic_state, =
whpx_cr8_to_apic_tpr(vcpu-&gt;tpr));<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_mutex_unlock_iothread();<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 bql_unlock();<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
=C2=A0 =C2=A0 =C2=A0vcpu-&gt;interruption_pending =3D<br>
@@ -1652,7 +1652,7 @@ static int whpx_vcpu_run(CPUState *cpu)<br>
=C2=A0 =C2=A0 =C2=A0WhpxStepMode exclusive_step_mode =3D WHPX_STEP_NONE;<br=
>
=C2=A0 =C2=A0 =C2=A0int ret;<br>
<br>
-=C2=A0 =C2=A0 g_assert(qemu_mutex_iothread_locked());<br>
+=C2=A0 =C2=A0 g_assert(bql_locked());<br>
<br>
=C2=A0 =C2=A0 =C2=A0if (whpx-&gt;running_cpus++ =3D=3D 0) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* Insert breakpoints into memory, update=
 exception exit bitmap. */<br>
@@ -1690,7 +1690,7 @@ static int whpx_vcpu_run(CPUState *cpu)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
-=C2=A0 =C2=A0 qemu_mutex_unlock_iothread();<br>
+=C2=A0 =C2=A0 bql_unlock();<br>
<br>
=C2=A0 =C2=A0 =C2=A0if (exclusive_step_mode !=3D WHPX_STEP_NONE) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0start_exclusive();<br>
@@ -2028,9 +2028,9 @@ static int whpx_vcpu_run(CPUState *cpu)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0error_report(&quot;WHPX: Un=
expected VP exit code %d&quot;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 vcpu-&gt;exit_ctx.ExitReason);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0whpx_get_registers(cpu);<br=
>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_mutex_lock_iothread();<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bql_lock();<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0qemu_system_guest_panicked(=
cpu_get_crash_info(cpu));<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_mutex_unlock_iothread();<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bql_unlock();<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
<br>
@@ -2055,7 +2055,7 @@ static int whpx_vcpu_run(CPUState *cpu)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cpu_exec_end(cpu);<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
-=C2=A0 =C2=A0 qemu_mutex_lock_iothread();<br>
+=C2=A0 =C2=A0 bql_lock();<br>
=C2=A0 =C2=A0 =C2=A0current_cpu =3D cpu;<br>
<br>
=C2=A0 =C2=A0 =C2=A0if (--whpx-&gt;running_cpus =3D=3D 0) {<br>
diff --git a/target/loongarch/csr_helper.c b/target/loongarch/csr_helper.c<=
br>
index 55341551a5..15f94caefa 100644<br>
--- a/target/loongarch/csr_helper.c<br>
+++ b/target/loongarch/csr_helper.c<br>
@@ -89,9 +89,9 @@ target_ulong helper_csrwr_ticlr(CPULoongArchState *env, t=
arget_ulong val)<br>
=C2=A0 =C2=A0 =C2=A0int64_t old_v =3D 0;<br>
<br>
=C2=A0 =C2=A0 =C2=A0if (val &amp; 0x1) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_mutex_lock_iothread();<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 bql_lock();<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0loongarch_cpu_set_irq(cpu, IRQ_TIMER, 0);=
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_mutex_unlock_iothread();<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 bql_unlock();<br>
=C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0return old_v;<br>
=C2=A0}<br>
diff --git a/target/mips/kvm.c b/target/mips/kvm.c<br>
index e22e24ed97..15d0cf9adb 100644<br>
--- a/target/mips/kvm.c<br>
+++ b/target/mips/kvm.c<br>
@@ -138,7 +138,7 @@ void kvm_arch_pre_run(CPUState *cs, struct kvm_run *run=
)<br>
=C2=A0 =C2=A0 =C2=A0int r;<br>
=C2=A0 =C2=A0 =C2=A0struct kvm_mips_interrupt intr;<br>
<br>
-=C2=A0 =C2=A0 qemu_mutex_lock_iothread();<br>
+=C2=A0 =C2=A0 bql_lock();<br>
<br>
=C2=A0 =C2=A0 =C2=A0if ((cs-&gt;interrupt_request &amp; CPU_INTERRUPT_HARD)=
 &amp;&amp;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cpu_mips_io_interrupts_pend=
ing(cpu)) {<br>
@@ -151,7 +151,7 @@ void kvm_arch_pre_run(CPUState *cs, struct kvm_run *run=
)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
-=C2=A0 =C2=A0 qemu_mutex_unlock_iothread();<br>
+=C2=A0 =C2=A0 bql_unlock();<br>
=C2=A0}<br>
<br>
=C2=A0MemTxAttrs kvm_arch_post_run(CPUState *cs, struct kvm_run *run)<br>
diff --git a/target/mips/tcg/sysemu/cp0_helper.c b/target/mips/tcg/sysemu/c=
p0_helper.c<br>
index d349548743..cc545aed9c 100644<br>
--- a/target/mips/tcg/sysemu/cp0_helper.c<br>
+++ b/target/mips/tcg/sysemu/cp0_helper.c<br>
@@ -59,9 +59,9 @@ static inline void mips_vpe_wake(MIPSCPU *c)<br>
=C2=A0 =C2=A0 =C2=A0 * because there might be other conditions that state t=
hat c should<br>
=C2=A0 =C2=A0 =C2=A0 * be sleeping.<br>
=C2=A0 =C2=A0 =C2=A0 */<br>
-=C2=A0 =C2=A0 qemu_mutex_lock_iothread();<br>
+=C2=A0 =C2=A0 bql_lock();<br>
=C2=A0 =C2=A0 =C2=A0cpu_interrupt(CPU(c), CPU_INTERRUPT_WAKE);<br>
-=C2=A0 =C2=A0 qemu_mutex_unlock_iothread();<br>
+=C2=A0 =C2=A0 bql_unlock();<br>
=C2=A0}<br>
<br>
=C2=A0static inline void mips_vpe_sleep(MIPSCPU *cpu)<br>
diff --git a/target/openrisc/sys_helper.c b/target/openrisc/sys_helper.c<br=
>
index 782a5751b7..77567afba4 100644<br>
--- a/target/openrisc/sys_helper.c<br>
+++ b/target/openrisc/sys_helper.c<br>
@@ -160,20 +160,20 @@ void HELPER(mtspr)(CPUOpenRISCState *env, target_ulon=
g spr, target_ulong rb)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
=C2=A0 =C2=A0 =C2=A0case TO_SPR(9, 0):=C2=A0 /* PICMR */<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0env-&gt;picmr =3D rb;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_mutex_lock_iothread();<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 bql_lock();<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (env-&gt;picsr &amp; env-&gt;picmr) {<=
br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cpu_interrupt(cs, CPU_INTER=
RUPT_HARD);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0} else {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cpu_reset_interrupt(cs, CPU=
_INTERRUPT_HARD);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_mutex_unlock_iothread();<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 bql_unlock();<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
=C2=A0 =C2=A0 =C2=A0case TO_SPR(9, 2):=C2=A0 /* PICSR */<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0env-&gt;picsr &amp;=3D ~rb;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
=C2=A0 =C2=A0 =C2=A0case TO_SPR(10, 0): /* TTMR */<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_mutex_lock_iothread();<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bql_lock();<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if ((env-&gt;ttmr &amp; TTM=
R_M) ^ (rb &amp; TTMR_M)) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0switch (rb &a=
mp; TTMR_M) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0case TIMER_NO=
NE:<br>
@@ -198,15 +198,15 @@ void HELPER(mtspr)(CPUOpenRISCState *env, target_ulon=
g spr, target_ulong rb)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cs-&gt;interr=
upt_request &amp;=3D ~CPU_INTERRUPT_TIMER;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cpu_openrisc_timer_update(c=
pu);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_mutex_unlock_iothread();<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bql_unlock();<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
<br>
=C2=A0 =C2=A0 =C2=A0case TO_SPR(10, 1): /* TTCR */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_mutex_lock_iothread();<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 bql_lock();<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cpu_openrisc_count_set(cpu, rb);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cpu_openrisc_timer_update(cpu);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_mutex_unlock_iothread();<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 bql_unlock();<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
=C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0#endif<br>
@@ -347,9 +347,9 @@ target_ulong HELPER(mfspr)(CPUOpenRISCState *env, targe=
t_ulong rd,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return env-&gt;ttmr;<br>
<br>
=C2=A0 =C2=A0 =C2=A0case TO_SPR(10, 1): /* TTCR */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_mutex_lock_iothread();<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 bql_lock();<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cpu_openrisc_count_update(cpu);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_mutex_unlock_iothread();<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 bql_unlock();<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return cpu_openrisc_count_get(cpu);<br>
=C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0#endif<br>
diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c<br>
index a42743a3e0..8a2bfb5aa2 100644<br>
--- a/target/ppc/excp_helper.c<br>
+++ b/target/ppc/excp_helper.c<br>
@@ -3056,7 +3056,7 @@ void helper_msgsnd(target_ulong rb)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return;<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
-=C2=A0 =C2=A0 qemu_mutex_lock_iothread();<br>
+=C2=A0 =C2=A0 bql_lock();<br>
=C2=A0 =C2=A0 =C2=A0CPU_FOREACH(cs) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0PowerPCCPU *cpu =3D POWERPC_CPU(cs);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0CPUPPCState *cenv =3D &amp;cpu-&gt;env;<b=
r>
@@ -3065,7 +3065,7 @@ void helper_msgsnd(target_ulong rb)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ppc_set_irq(cpu, irq, 1);<b=
r>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0}<br>
-=C2=A0 =C2=A0 qemu_mutex_unlock_iothread();<br>
+=C2=A0 =C2=A0 bql_unlock();<br>
=C2=A0}<br>
<br>
=C2=A0/* Server Processor Control */<br>
@@ -3093,7 +3093,7 @@ static void book3s_msgsnd_common(int pir, int irq)<br=
>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0CPUState *cs;<br>
<br>
-=C2=A0 =C2=A0 qemu_mutex_lock_iothread();<br>
+=C2=A0 =C2=A0 bql_lock();<br>
=C2=A0 =C2=A0 =C2=A0CPU_FOREACH(cs) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0PowerPCCPU *cpu =3D POWERPC_CPU(cs);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0CPUPPCState *cenv =3D &amp;cpu-&gt;env;<b=
r>
@@ -3103,7 +3103,7 @@ static void book3s_msgsnd_common(int pir, int irq)<br=
>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ppc_set_irq(cpu, irq, 1);<b=
r>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0}<br>
-=C2=A0 =C2=A0 qemu_mutex_unlock_iothread();<br>
+=C2=A0 =C2=A0 bql_unlock();<br>
=C2=A0}<br>
<br>
=C2=A0void helper_book3s_msgsnd(target_ulong rb)<br>
@@ -3157,14 +3157,14 @@ void helper_book3s_msgsndp(CPUPPCState *env, target=
_ulong rb)<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
=C2=A0 =C2=A0 =C2=A0/* Does iothread need to be locked for walking CPU list=
? */<br>
-=C2=A0 =C2=A0 qemu_mutex_lock_iothread();<br>
+=C2=A0 =C2=A0 bql_lock();<br>
=C2=A0 =C2=A0 =C2=A0THREAD_SIBLING_FOREACH(cs, ccs) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0PowerPCCPU *ccpu =3D POWERPC_CPU(ccs);<br=
>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0uint32_t thread_id =3D ppc_cpu_tir(ccpu);=
<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (ttir =3D=3D thread_id) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ppc_set_irq(ccpu, PPC_INTER=
RUPT_DOORBELL, 1);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_mutex_unlock_iothread();<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bql_unlock();<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0}<br>
diff --git a/target/ppc/kvm.c b/target/ppc/kvm.c<br>
index 9b1abe2fc4..26fa9d0575 100644<br>
--- a/target/ppc/kvm.c<br>
+++ b/target/ppc/kvm.c<br>
@@ -1656,7 +1656,7 @@ int kvm_arch_handle_exit(CPUState *cs, struct kvm_run=
 *run)<br>
=C2=A0 =C2=A0 =C2=A0CPUPPCState *env =3D &amp;cpu-&gt;env;<br>
=C2=A0 =C2=A0 =C2=A0int ret;<br>
<br>
-=C2=A0 =C2=A0 qemu_mutex_lock_iothread();<br>
+=C2=A0 =C2=A0 bql_lock();<br>
<br>
=C2=A0 =C2=A0 =C2=A0switch (run-&gt;exit_reason) {<br>
=C2=A0 =C2=A0 =C2=A0case KVM_EXIT_DCR:<br>
@@ -1715,7 +1715,7 @@ int kvm_arch_handle_exit(CPUState *cs, struct kvm_run=
 *run)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
-=C2=A0 =C2=A0 qemu_mutex_unlock_iothread();<br>
+=C2=A0 =C2=A0 bql_unlock();<br>
=C2=A0 =C2=A0 =C2=A0return ret;<br>
=C2=A0}<br>
<br>
diff --git a/target/ppc/misc_helper.c b/target/ppc/misc_helper.c<br>
index a05bdf78c9..a9d41d2802 100644<br>
--- a/target/ppc/misc_helper.c<br>
+++ b/target/ppc/misc_helper.c<br>
@@ -238,7 +238,7 @@ target_ulong helper_load_dpdes(CPUPPCState *env)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return dpdes;<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
-=C2=A0 =C2=A0 qemu_mutex_lock_iothread();<br>
+=C2=A0 =C2=A0 bql_lock();<br>
=C2=A0 =C2=A0 =C2=A0THREAD_SIBLING_FOREACH(cs, ccs) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0PowerPCCPU *ccpu =3D POWERPC_CPU(ccs);<br=
>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0CPUPPCState *cenv =3D &amp;ccpu-&gt;env;<=
br>
@@ -248,7 +248,7 @@ target_ulong helper_load_dpdes(CPUPPCState *env)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dpdes |=3D (0x1 &lt;&lt; th=
read_id);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0}<br>
-=C2=A0 =C2=A0 qemu_mutex_unlock_iothread();<br>
+=C2=A0 =C2=A0 bql_unlock();<br>
<br>
=C2=A0 =C2=A0 =C2=A0return dpdes;<br>
=C2=A0}<br>
@@ -278,14 +278,14 @@ void helper_store_dpdes(CPUPPCState *env, target_ulon=
g val)<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
=C2=A0 =C2=A0 =C2=A0/* Does iothread need to be locked for walking CPU list=
? */<br>
-=C2=A0 =C2=A0 qemu_mutex_lock_iothread();<br>
+=C2=A0 =C2=A0 bql_lock();<br>
=C2=A0 =C2=A0 =C2=A0THREAD_SIBLING_FOREACH(cs, ccs) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0PowerPCCPU *ccpu =3D POWERPC_CPU(ccs);<br=
>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0uint32_t thread_id =3D ppc_cpu_tir(ccpu);=
<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ppc_set_irq(cpu, PPC_INTERRUPT_DOORBELL, =
val &amp; (0x1 &lt;&lt; thread_id));<br>
=C2=A0 =C2=A0 =C2=A0}<br>
-=C2=A0 =C2=A0 qemu_mutex_unlock_iothread();<br>
+=C2=A0 =C2=A0 bql_unlock();<br>
=C2=A0}<br>
=C2=A0#endif /* defined(TARGET_PPC64) */<br>
<br>
diff --git a/target/ppc/timebase_helper.c b/target/ppc/timebase_helper.c<br=
>
index 08a6b47ee0..f618ed2922 100644<br>
--- a/target/ppc/timebase_helper.c<br>
+++ b/target/ppc/timebase_helper.c<br>
@@ -173,9 +173,9 @@ target_ulong helper_load_dcr(CPUPPCState *env, target_u=
long dcrn)<br>
=C2=A0 =C2=A0 =C2=A0} else {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0int ret;<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_mutex_lock_iothread();<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 bql_lock();<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D ppc_dcr_read(env-&gt;dcr_env, (ui=
nt32_t)dcrn, &amp;val);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_mutex_unlock_iothread();<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 bql_unlock();<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (unlikely(ret !=3D 0)) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0qemu_log_mask(LOG_GUEST_ERR=
OR, &quot;DCR read error %d %03x\n&quot;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0(uint32_t)dcrn, (uint32_t)dcrn);<br>
@@ -196,9 +196,9 @@ void helper_store_dcr(CPUPPCState *env, target_ulong dc=
rn, target_ulong val)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 POWERPC_EXCP_INVAL_INVAL, GETPC());<=
br>
=C2=A0 =C2=A0 =C2=A0} else {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0int ret;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_mutex_lock_iothread();<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 bql_lock();<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D ppc_dcr_write(env-&gt;dcr_env, (u=
int32_t)dcrn, (uint32_t)val);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_mutex_unlock_iothread();<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 bql_unlock();<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (unlikely(ret !=3D 0)) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0qemu_log_mask(LOG_GUEST_ERR=
OR, &quot;DCR write error %d %03x\n&quot;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0(uint32_t)dcrn, (uint32_t)dcrn);<br>
diff --git a/target/s390x/kvm/kvm.c b/target/s390x/kvm/kvm.c<br>
index 33ab3551f4..888d6c1a1c 100644<br>
--- a/target/s390x/kvm/kvm.c<br>
+++ b/target/s390x/kvm/kvm.c<br>
@@ -1923,7 +1923,7 @@ int kvm_arch_handle_exit(CPUState *cs, struct kvm_run=
 *run)<br>
=C2=A0 =C2=A0 =C2=A0S390CPU *cpu =3D S390_CPU(cs);<br>
=C2=A0 =C2=A0 =C2=A0int ret =3D 0;<br>
<br>
-=C2=A0 =C2=A0 qemu_mutex_lock_iothread();<br>
+=C2=A0 =C2=A0 bql_lock();<br>
<br>
=C2=A0 =C2=A0 =C2=A0kvm_cpu_synchronize_state(cs);<br>
<br>
@@ -1947,7 +1947,7 @@ int kvm_arch_handle_exit(CPUState *cs, struct kvm_run=
 *run)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fprintf(stderr, &quot;Unkno=
wn KVM exit: %d\n&quot;, run-&gt;exit_reason);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
=C2=A0 =C2=A0 =C2=A0}<br>
-=C2=A0 =C2=A0 qemu_mutex_unlock_iothread();<br>
+=C2=A0 =C2=A0 bql_unlock();<br>
<br>
=C2=A0 =C2=A0 =C2=A0if (ret =3D=3D 0) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D EXCP_INTERRUPT;<br>
diff --git a/target/s390x/tcg/misc_helper.c b/target/s390x/tcg/misc_helper.=
c<br>
index 6aa7907438..89b5268fd4 100644<br>
--- a/target/s390x/tcg/misc_helper.c<br>
+++ b/target/s390x/tcg/misc_helper.c<br>
@@ -101,9 +101,9 @@ uint64_t HELPER(stck)(CPUS390XState *env)<br>
=C2=A0/* SCLP service call */<br>
=C2=A0uint32_t HELPER(servc)(CPUS390XState *env, uint64_t r1, uint64_t r2)<=
br>
=C2=A0{<br>
-=C2=A0 =C2=A0 qemu_mutex_lock_iothread();<br>
+=C2=A0 =C2=A0 bql_lock();<br>
=C2=A0 =C2=A0 =C2=A0int r =3D sclp_service_call(env_archcpu(env), r1, r2);<=
br>
-=C2=A0 =C2=A0 qemu_mutex_unlock_iothread();<br>
+=C2=A0 =C2=A0 bql_unlock();<br>
=C2=A0 =C2=A0 =C2=A0if (r &lt; 0) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tcg_s390_program_interrupt(env, -r, GETPC=
());<br>
=C2=A0 =C2=A0 =C2=A0}<br>
@@ -117,9 +117,9 @@ void HELPER(diag)(CPUS390XState *env, uint32_t r1, uint=
32_t r3, uint32_t num)<br>
=C2=A0 =C2=A0 =C2=A0switch (num) {<br>
=C2=A0 =C2=A0 =C2=A0case 0x500:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* KVM hypercall */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_mutex_lock_iothread();<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 bql_lock();<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0r =3D s390_virtio_hypercall(env);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_mutex_unlock_iothread();<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 bql_unlock();<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
=C2=A0 =C2=A0 =C2=A0case 0x44:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* yield */<br>
@@ -127,9 +127,9 @@ void HELPER(diag)(CPUS390XState *env, uint32_t r1, uint=
32_t r3, uint32_t num)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
=C2=A0 =C2=A0 =C2=A0case 0x308:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* ipl */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_mutex_lock_iothread();<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 bql_lock();<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0handle_diag_308(env, r1, r3, GETPC());<br=
>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_mutex_unlock_iothread();<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 bql_unlock();<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0r =3D 0;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
=C2=A0 =C2=A0 =C2=A0case 0x288:<br>
@@ -185,7 +185,7 @@ static void update_ckc_timer(CPUS390XState *env)<br>
<br>
=C2=A0 =C2=A0 =C2=A0/* stop the timer and remove pending CKC IRQs */<br>
=C2=A0 =C2=A0 =C2=A0timer_del(env-&gt;tod_timer);<br>
-=C2=A0 =C2=A0 g_assert(qemu_mutex_iothread_locked());<br>
+=C2=A0 =C2=A0 g_assert(bql_locked());<br>
=C2=A0 =C2=A0 =C2=A0env-&gt;pending_int &amp;=3D ~INTERRUPT_EXT_CLOCK_COMPA=
RATOR;<br>
<br>
=C2=A0 =C2=A0 =C2=A0/* the tod has to exceed the ckc, this can never happen=
 if ckc is all 1&#39;s */<br>
@@ -207,9 +207,9 @@ void HELPER(sckc)(CPUS390XState *env, uint64_t ckc)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0env-&gt;ckc =3D ckc;<br>
<br>
-=C2=A0 =C2=A0 qemu_mutex_lock_iothread();<br>
+=C2=A0 =C2=A0 bql_lock();<br>
=C2=A0 =C2=A0 =C2=A0update_ckc_timer(env);<br>
-=C2=A0 =C2=A0 qemu_mutex_unlock_iothread();<br>
+=C2=A0 =C2=A0 bql_unlock();<br>
=C2=A0}<br>
<br>
=C2=A0void tcg_s390_tod_updated(CPUState *cs, run_on_cpu_data opaque)<br>
@@ -229,9 +229,9 @@ uint32_t HELPER(sck)(CPUS390XState *env, uint64_t tod_l=
ow)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.low =3D tod_low,<br>
=C2=A0 =C2=A0 =C2=A0};<br>
<br>
-=C2=A0 =C2=A0 qemu_mutex_lock_iothread();<br>
+=C2=A0 =C2=A0 bql_lock();<br>
=C2=A0 =C2=A0 =C2=A0tdc-&gt;set(td, &amp;tod, &amp;error_abort);<br>
-=C2=A0 =C2=A0 qemu_mutex_unlock_iothread();<br>
+=C2=A0 =C2=A0 bql_unlock();<br>
=C2=A0 =C2=A0 =C2=A0return 0;<br>
=C2=A0}<br>
<br>
@@ -421,9 +421,9 @@ uint32_t HELPER(sigp)(CPUS390XState *env, uint64_t orde=
r_code, uint32_t r1,<br>
=C2=A0 =C2=A0 =C2=A0int cc;<br>
<br>
=C2=A0 =C2=A0 =C2=A0/* TODO: needed to inject interrupts=C2=A0 - push furth=
er down */<br>
-=C2=A0 =C2=A0 qemu_mutex_lock_iothread();<br>
+=C2=A0 =C2=A0 bql_lock();<br>
=C2=A0 =C2=A0 =C2=A0cc =3D handle_sigp(env, order_code &amp; SIGP_ORDER_MAS=
K, r1, r3);<br>
-=C2=A0 =C2=A0 qemu_mutex_unlock_iothread();<br>
+=C2=A0 =C2=A0 bql_unlock();<br>
<br>
=C2=A0 =C2=A0 =C2=A0return cc;<br>
=C2=A0}<br>
@@ -433,92 +433,92 @@ uint32_t HELPER(sigp)(CPUS390XState *env, uint64_t or=
der_code, uint32_t r1,<br>
=C2=A0void HELPER(xsch)(CPUS390XState *env, uint64_t r1)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0S390CPU *cpu =3D env_archcpu(env);<br>
-=C2=A0 =C2=A0 qemu_mutex_lock_iothread();<br>
+=C2=A0 =C2=A0 bql_lock();<br>
=C2=A0 =C2=A0 =C2=A0ioinst_handle_xsch(cpu, r1, GETPC());<br>
-=C2=A0 =C2=A0 qemu_mutex_unlock_iothread();<br>
+=C2=A0 =C2=A0 bql_unlock();<br>
=C2=A0}<br>
<br>
=C2=A0void HELPER(csch)(CPUS390XState *env, uint64_t r1)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0S390CPU *cpu =3D env_archcpu(env);<br>
-=C2=A0 =C2=A0 qemu_mutex_lock_iothread();<br>
+=C2=A0 =C2=A0 bql_lock();<br>
=C2=A0 =C2=A0 =C2=A0ioinst_handle_csch(cpu, r1, GETPC());<br>
-=C2=A0 =C2=A0 qemu_mutex_unlock_iothread();<br>
+=C2=A0 =C2=A0 bql_unlock();<br>
=C2=A0}<br>
<br>
=C2=A0void HELPER(hsch)(CPUS390XState *env, uint64_t r1)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0S390CPU *cpu =3D env_archcpu(env);<br>
-=C2=A0 =C2=A0 qemu_mutex_lock_iothread();<br>
+=C2=A0 =C2=A0 bql_lock();<br>
=C2=A0 =C2=A0 =C2=A0ioinst_handle_hsch(cpu, r1, GETPC());<br>
-=C2=A0 =C2=A0 qemu_mutex_unlock_iothread();<br>
+=C2=A0 =C2=A0 bql_unlock();<br>
=C2=A0}<br>
<br>
=C2=A0void HELPER(msch)(CPUS390XState *env, uint64_t r1, uint64_t inst)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0S390CPU *cpu =3D env_archcpu(env);<br>
-=C2=A0 =C2=A0 qemu_mutex_lock_iothread();<br>
+=C2=A0 =C2=A0 bql_lock();<br>
=C2=A0 =C2=A0 =C2=A0ioinst_handle_msch(cpu, r1, inst &gt;&gt; 16, GETPC());=
<br>
-=C2=A0 =C2=A0 qemu_mutex_unlock_iothread();<br>
+=C2=A0 =C2=A0 bql_unlock();<br>
=C2=A0}<br>
<br>
=C2=A0void HELPER(rchp)(CPUS390XState *env, uint64_t r1)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0S390CPU *cpu =3D env_archcpu(env);<br>
-=C2=A0 =C2=A0 qemu_mutex_lock_iothread();<br>
+=C2=A0 =C2=A0 bql_lock();<br>
=C2=A0 =C2=A0 =C2=A0ioinst_handle_rchp(cpu, r1, GETPC());<br>
-=C2=A0 =C2=A0 qemu_mutex_unlock_iothread();<br>
+=C2=A0 =C2=A0 bql_unlock();<br>
=C2=A0}<br>
<br>
=C2=A0void HELPER(rsch)(CPUS390XState *env, uint64_t r1)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0S390CPU *cpu =3D env_archcpu(env);<br>
-=C2=A0 =C2=A0 qemu_mutex_lock_iothread();<br>
+=C2=A0 =C2=A0 bql_lock();<br>
=C2=A0 =C2=A0 =C2=A0ioinst_handle_rsch(cpu, r1, GETPC());<br>
-=C2=A0 =C2=A0 qemu_mutex_unlock_iothread();<br>
+=C2=A0 =C2=A0 bql_unlock();<br>
=C2=A0}<br>
<br>
=C2=A0void HELPER(sal)(CPUS390XState *env, uint64_t r1)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0S390CPU *cpu =3D env_archcpu(env);<br>
<br>
-=C2=A0 =C2=A0 qemu_mutex_lock_iothread();<br>
+=C2=A0 =C2=A0 bql_lock();<br>
=C2=A0 =C2=A0 =C2=A0ioinst_handle_sal(cpu, r1, GETPC());<br>
-=C2=A0 =C2=A0 qemu_mutex_unlock_iothread();<br>
+=C2=A0 =C2=A0 bql_unlock();<br>
=C2=A0}<br>
<br>
=C2=A0void HELPER(schm)(CPUS390XState *env, uint64_t r1, uint64_t r2, uint6=
4_t inst)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0S390CPU *cpu =3D env_archcpu(env);<br>
<br>
-=C2=A0 =C2=A0 qemu_mutex_lock_iothread();<br>
+=C2=A0 =C2=A0 bql_lock();<br>
=C2=A0 =C2=A0 =C2=A0ioinst_handle_schm(cpu, r1, r2, inst &gt;&gt; 16, GETPC=
());<br>
-=C2=A0 =C2=A0 qemu_mutex_unlock_iothread();<br>
+=C2=A0 =C2=A0 bql_unlock();<br>
=C2=A0}<br>
<br>
=C2=A0void HELPER(ssch)(CPUS390XState *env, uint64_t r1, uint64_t inst)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0S390CPU *cpu =3D env_archcpu(env);<br>
-=C2=A0 =C2=A0 qemu_mutex_lock_iothread();<br>
+=C2=A0 =C2=A0 bql_lock();<br>
=C2=A0 =C2=A0 =C2=A0ioinst_handle_ssch(cpu, r1, inst &gt;&gt; 16, GETPC());=
<br>
-=C2=A0 =C2=A0 qemu_mutex_unlock_iothread();<br>
+=C2=A0 =C2=A0 bql_unlock();<br>
=C2=A0}<br>
<br>
=C2=A0void HELPER(stcrw)(CPUS390XState *env, uint64_t inst)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0S390CPU *cpu =3D env_archcpu(env);<br>
<br>
-=C2=A0 =C2=A0 qemu_mutex_lock_iothread();<br>
+=C2=A0 =C2=A0 bql_lock();<br>
=C2=A0 =C2=A0 =C2=A0ioinst_handle_stcrw(cpu, inst &gt;&gt; 16, GETPC());<br=
>
-=C2=A0 =C2=A0 qemu_mutex_unlock_iothread();<br>
+=C2=A0 =C2=A0 bql_unlock();<br>
=C2=A0}<br>
<br>
=C2=A0void HELPER(stsch)(CPUS390XState *env, uint64_t r1, uint64_t inst)<br=
>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0S390CPU *cpu =3D env_archcpu(env);<br>
-=C2=A0 =C2=A0 qemu_mutex_lock_iothread();<br>
+=C2=A0 =C2=A0 bql_lock();<br>
=C2=A0 =C2=A0 =C2=A0ioinst_handle_stsch(cpu, r1, inst &gt;&gt; 16, GETPC())=
;<br>
-=C2=A0 =C2=A0 qemu_mutex_unlock_iothread();<br>
+=C2=A0 =C2=A0 bql_unlock();<br>
=C2=A0}<br>
<br>
=C2=A0uint32_t HELPER(tpi)(CPUS390XState *env, uint64_t addr)<br>
@@ -533,10 +533,10 @@ uint32_t HELPER(tpi)(CPUS390XState *env, uint64_t add=
r)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tcg_s390_program_interrupt(env, PGM_SPECI=
FICATION, ra);<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
-=C2=A0 =C2=A0 qemu_mutex_lock_iothread();<br>
+=C2=A0 =C2=A0 bql_lock();<br>
=C2=A0 =C2=A0 =C2=A0io =3D qemu_s390_flic_dequeue_io(flic, env-&gt;cregs[6]=
);<br>
=C2=A0 =C2=A0 =C2=A0if (!io) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_mutex_unlock_iothread();<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 bql_unlock();<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
@@ -554,7 +554,7 @@ uint32_t HELPER(tpi)(CPUS390XState *env, uint64_t addr)=
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (s390_cpu_virt_mem_write(cpu, addr, 0,=
 &amp;intc, sizeof(intc))) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* writing failed, reinject=
 and properly clean up */<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0s390_io_interrupt(io-&gt;id=
, io-&gt;nr, io-&gt;parm, io-&gt;word);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_mutex_unlock_iothread();<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bql_unlock();<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0g_free(io);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0s390_cpu_virt_mem_handle_ex=
c(cpu, ra);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
@@ -570,24 +570,24 @@ uint32_t HELPER(tpi)(CPUS390XState *env, uint64_t add=
r)<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
=C2=A0 =C2=A0 =C2=A0g_free(io);<br>
-=C2=A0 =C2=A0 qemu_mutex_unlock_iothread();<br>
+=C2=A0 =C2=A0 bql_unlock();<br>
=C2=A0 =C2=A0 =C2=A0return 1;<br>
=C2=A0}<br>
<br>
=C2=A0void HELPER(tsch)(CPUS390XState *env, uint64_t r1, uint64_t inst)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0S390CPU *cpu =3D env_archcpu(env);<br>
-=C2=A0 =C2=A0 qemu_mutex_lock_iothread();<br>
+=C2=A0 =C2=A0 bql_lock();<br>
=C2=A0 =C2=A0 =C2=A0ioinst_handle_tsch(cpu, r1, inst &gt;&gt; 16, GETPC());=
<br>
-=C2=A0 =C2=A0 qemu_mutex_unlock_iothread();<br>
+=C2=A0 =C2=A0 bql_unlock();<br>
=C2=A0}<br>
<br>
=C2=A0void HELPER(chsc)(CPUS390XState *env, uint64_t inst)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0S390CPU *cpu =3D env_archcpu(env);<br>
-=C2=A0 =C2=A0 qemu_mutex_lock_iothread();<br>
+=C2=A0 =C2=A0 bql_lock();<br>
=C2=A0 =C2=A0 =C2=A0ioinst_handle_chsc(cpu, inst &gt;&gt; 16, GETPC());<br>
-=C2=A0 =C2=A0 qemu_mutex_unlock_iothread();<br>
+=C2=A0 =C2=A0 bql_unlock();<br>
=C2=A0}<br>
=C2=A0#endif<br>
<br>
@@ -726,27 +726,27 @@ void HELPER(clp)(CPUS390XState *env, uint32_t r2)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0S390CPU *cpu =3D env_archcpu(env);<br>
<br>
-=C2=A0 =C2=A0 qemu_mutex_lock_iothread();<br>
+=C2=A0 =C2=A0 bql_lock();<br>
=C2=A0 =C2=A0 =C2=A0clp_service_call(cpu, r2, GETPC());<br>
-=C2=A0 =C2=A0 qemu_mutex_unlock_iothread();<br>
+=C2=A0 =C2=A0 bql_unlock();<br>
=C2=A0}<br>
<br>
=C2=A0void HELPER(pcilg)(CPUS390XState *env, uint32_t r1, uint32_t r2)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0S390CPU *cpu =3D env_archcpu(env);<br>
<br>
-=C2=A0 =C2=A0 qemu_mutex_lock_iothread();<br>
+=C2=A0 =C2=A0 bql_lock();<br>
=C2=A0 =C2=A0 =C2=A0pcilg_service_call(cpu, r1, r2, GETPC());<br>
-=C2=A0 =C2=A0 qemu_mutex_unlock_iothread();<br>
+=C2=A0 =C2=A0 bql_unlock();<br>
=C2=A0}<br>
<br>
=C2=A0void HELPER(pcistg)(CPUS390XState *env, uint32_t r1, uint32_t r2)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0S390CPU *cpu =3D env_archcpu(env);<br>
<br>
-=C2=A0 =C2=A0 qemu_mutex_lock_iothread();<br>
+=C2=A0 =C2=A0 bql_lock();<br>
=C2=A0 =C2=A0 =C2=A0pcistg_service_call(cpu, r1, r2, GETPC());<br>
-=C2=A0 =C2=A0 qemu_mutex_unlock_iothread();<br>
+=C2=A0 =C2=A0 bql_unlock();<br>
=C2=A0}<br>
<br>
=C2=A0void HELPER(stpcifc)(CPUS390XState *env, uint32_t r1, uint64_t fiba,<=
br>
@@ -754,9 +754,9 @@ void HELPER(stpcifc)(CPUS390XState *env, uint32_t r1, u=
int64_t fiba,<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0S390CPU *cpu =3D env_archcpu(env);<br>
<br>
-=C2=A0 =C2=A0 qemu_mutex_lock_iothread();<br>
+=C2=A0 =C2=A0 bql_lock();<br>
=C2=A0 =C2=A0 =C2=A0stpcifc_service_call(cpu, r1, fiba, ar, GETPC());<br>
-=C2=A0 =C2=A0 qemu_mutex_unlock_iothread();<br>
+=C2=A0 =C2=A0 bql_unlock();<br>
=C2=A0}<br>
<br>
=C2=A0void HELPER(sic)(CPUS390XState *env, uint64_t r1, uint64_t r3)<br>
@@ -764,9 +764,9 @@ void HELPER(sic)(CPUS390XState *env, uint64_t r1, uint6=
4_t r3)<br>
=C2=A0 =C2=A0 =C2=A0S390CPU *cpu =3D env_archcpu(env);<br>
=C2=A0 =C2=A0 =C2=A0int r;<br>
<br>
-=C2=A0 =C2=A0 qemu_mutex_lock_iothread();<br>
+=C2=A0 =C2=A0 bql_lock();<br>
=C2=A0 =C2=A0 =C2=A0r =3D css_do_sic(cpu, (r3 &gt;&gt; 27) &amp; 0x7, r1 &a=
mp; 0xffff);<br>
-=C2=A0 =C2=A0 qemu_mutex_unlock_iothread();<br>
+=C2=A0 =C2=A0 bql_unlock();<br>
=C2=A0 =C2=A0 =C2=A0/* css_do_sic() may actually return a PGM_xxx value to =
inject */<br>
=C2=A0 =C2=A0 =C2=A0if (r) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tcg_s390_program_interrupt(env, -r, GETPC=
());<br>
@@ -777,9 +777,9 @@ void HELPER(rpcit)(CPUS390XState *env, uint32_t r1, uin=
t32_t r2)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0S390CPU *cpu =3D env_archcpu(env);<br>
<br>
-=C2=A0 =C2=A0 qemu_mutex_lock_iothread();<br>
+=C2=A0 =C2=A0 bql_lock();<br>
=C2=A0 =C2=A0 =C2=A0rpcit_service_call(cpu, r1, r2, GETPC());<br>
-=C2=A0 =C2=A0 qemu_mutex_unlock_iothread();<br>
+=C2=A0 =C2=A0 bql_unlock();<br>
=C2=A0}<br>
<br>
=C2=A0void HELPER(pcistb)(CPUS390XState *env, uint32_t r1, uint32_t r3,<br>
@@ -787,9 +787,9 @@ void HELPER(pcistb)(CPUS390XState *env, uint32_t r1, ui=
nt32_t r3,<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0S390CPU *cpu =3D env_archcpu(env);<br>
<br>
-=C2=A0 =C2=A0 qemu_mutex_lock_iothread();<br>
+=C2=A0 =C2=A0 bql_lock();<br>
=C2=A0 =C2=A0 =C2=A0pcistb_service_call(cpu, r1, r3, gaddr, ar, GETPC());<b=
r>
-=C2=A0 =C2=A0 qemu_mutex_unlock_iothread();<br>
+=C2=A0 =C2=A0 bql_unlock();<br>
=C2=A0}<br>
<br>
=C2=A0void HELPER(mpcifc)(CPUS390XState *env, uint32_t r1, uint64_t fiba,<b=
r>
@@ -797,8 +797,8 @@ void HELPER(mpcifc)(CPUS390XState *env, uint32_t r1, ui=
nt64_t fiba,<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0S390CPU *cpu =3D env_archcpu(env);<br>
<br>
-=C2=A0 =C2=A0 qemu_mutex_lock_iothread();<br>
+=C2=A0 =C2=A0 bql_lock();<br>
=C2=A0 =C2=A0 =C2=A0mpcifc_service_call(cpu, r1, fiba, ar, GETPC());<br>
-=C2=A0 =C2=A0 qemu_mutex_unlock_iothread();<br>
+=C2=A0 =C2=A0 bql_unlock();<br>
=C2=A0}<br>
=C2=A0#endif<br>
diff --git a/target/sparc/int32_helper.c b/target/sparc/int32_helper.c<br>
index 1563613582..49a9149263 100644<br>
--- a/target/sparc/int32_helper.c<br>
+++ b/target/sparc/int32_helper.c<br>
@@ -70,7 +70,7 @@ void cpu_check_irqs(CPUSPARCState *env)<br>
=C2=A0 =C2=A0 =C2=A0CPUState *cs;<br>
<br>
=C2=A0 =C2=A0 =C2=A0/* We should be holding the BQL before we mess with IRQ=
s */<br>
-=C2=A0 =C2=A0 g_assert(qemu_mutex_iothread_locked());<br>
+=C2=A0 =C2=A0 g_assert(bql_locked());<br>
<br>
=C2=A0 =C2=A0 =C2=A0if (env-&gt;pil_in &amp;&amp; (env-&gt;interrupt_index =
=3D=3D 0 ||<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0(env-&gt;interrupt_index &amp; ~15) =3D=3D TT_EXTINT)) {<b=
r>
diff --git a/target/sparc/int64_helper.c b/target/sparc/int64_helper.c<br>
index 1b4155f5f3..27df9dba89 100644<br>
--- a/target/sparc/int64_helper.c<br>
+++ b/target/sparc/int64_helper.c<br>
@@ -69,7 +69,7 @@ void cpu_check_irqs(CPUSPARCState *env)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(env-&=
gt;softint &amp; ~(SOFTINT_TIMER | SOFTINT_STIMER));<br>
<br>
=C2=A0 =C2=A0 =C2=A0/* We should be holding the BQL before we mess with IRQ=
s */<br>
-=C2=A0 =C2=A0 g_assert(qemu_mutex_iothread_locked());<br>
+=C2=A0 =C2=A0 g_assert(bql_locked());<br>
<br>
=C2=A0 =C2=A0 =C2=A0/* TT_IVEC has a higher priority (16) than TT_EXTINT (3=
1..17) */<br>
=C2=A0 =C2=A0 =C2=A0if (env-&gt;ivec_status &amp; 0x20) {<br>
@@ -267,9 +267,9 @@ static bool do_modify_softint(CPUSPARCState *env, uint3=
2_t value)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0env-&gt;softint =3D value;<br>
=C2=A0#if !defined(CONFIG_USER_ONLY)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (cpu_interrupts_enabled(env)) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_mutex_lock_iothread();<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bql_lock();<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cpu_check_irqs(env);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_mutex_unlock_iothread();<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bql_unlock();<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0#endif<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return true;<br>
diff --git a/target/sparc/win_helper.c b/target/sparc/win_helper.c<br>
index 16d1c70fe7..b53fc9ce94 100644<br>
--- a/target/sparc/win_helper.c<br>
+++ b/target/sparc/win_helper.c<br>
@@ -179,9 +179,9 @@ void helper_wrpsr(CPUSPARCState *env, target_ulong new_=
psr)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cpu_raise_exception_ra(env, TT_ILL_INSN, =
GETPC());<br>
=C2=A0 =C2=A0 =C2=A0} else {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* cpu_put_psr may trigger interrupts, he=
nce BQL */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_mutex_lock_iothread();<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 bql_lock();<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cpu_put_psr(env, new_psr);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_mutex_unlock_iothread();<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 bql_unlock();<br>
=C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0}<br>
<br>
@@ -407,9 +407,9 @@ void helper_wrpstate(CPUSPARCState *env, target_ulong n=
ew_state)<br>
<br>
=C2=A0#if !defined(CONFIG_USER_ONLY)<br>
=C2=A0 =C2=A0 =C2=A0if (cpu_interrupts_enabled(env)) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_mutex_lock_iothread();<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 bql_lock();<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cpu_check_irqs(env);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_mutex_unlock_iothread();<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 bql_unlock();<br>
=C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0#endif<br>
=C2=A0}<br>
@@ -422,9 +422,9 @@ void helper_wrpil(CPUSPARCState *env, target_ulong new_=
pil)<br>
=C2=A0 =C2=A0 =C2=A0env-&gt;psrpil =3D new_pil;<br>
<br>
=C2=A0 =C2=A0 =C2=A0if (cpu_interrupts_enabled(env)) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_mutex_lock_iothread();<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 bql_lock();<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cpu_check_irqs(env);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_mutex_unlock_iothread();<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 bql_unlock();<br>
=C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0#endif<br>
=C2=A0}<br>
@@ -451,9 +451,9 @@ void helper_done(CPUSPARCState *env)<br>
<br>
=C2=A0#if !defined(CONFIG_USER_ONLY)<br>
=C2=A0 =C2=A0 =C2=A0if (cpu_interrupts_enabled(env)) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_mutex_lock_iothread();<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 bql_lock();<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cpu_check_irqs(env);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_mutex_unlock_iothread();<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 bql_unlock();<br>
=C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0#endif<br>
=C2=A0}<br>
@@ -480,9 +480,9 @@ void helper_retry(CPUSPARCState *env)<br>
<br>
=C2=A0#if !defined(CONFIG_USER_ONLY)<br>
=C2=A0 =C2=A0 =C2=A0if (cpu_interrupts_enabled(env)) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_mutex_lock_iothread();<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 bql_lock();<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cpu_check_irqs(env);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_mutex_unlock_iothread();<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 bql_unlock();<br>
=C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0#endif<br>
=C2=A0}<br>
diff --git a/target/xtensa/exc_helper.c b/target/xtensa/exc_helper.c<br>
index 91354884f7..168419a505 100644<br>
--- a/target/xtensa/exc_helper.c<br>
+++ b/target/xtensa/exc_helper.c<br>
@@ -105,9 +105,9 @@ void HELPER(waiti)(CPUXtensaState *env, uint32_t pc, ui=
nt32_t intlevel)<br>
=C2=A0 =C2=A0 =C2=A0env-&gt;sregs[PS] =3D (env-&gt;sregs[PS] &amp; ~PS_INTL=
EVEL) |<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(intlevel &lt;&lt; PS_INTLEVEL_SHIFT);<br=
>
<br>
-=C2=A0 =C2=A0 qemu_mutex_lock_iothread();<br>
+=C2=A0 =C2=A0 bql_lock();<br>
=C2=A0 =C2=A0 =C2=A0check_interrupts(env);<br>
-=C2=A0 =C2=A0 qemu_mutex_unlock_iothread();<br>
+=C2=A0 =C2=A0 bql_unlock();<br>
<br>
=C2=A0 =C2=A0 =C2=A0if (env-&gt;pending_irq_level) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cpu_loop_exit(cpu);<br>
@@ -120,9 +120,9 @@ void HELPER(waiti)(CPUXtensaState *env, uint32_t pc, ui=
nt32_t intlevel)<br>
<br>
=C2=A0void HELPER(check_interrupts)(CPUXtensaState *env)<br>
=C2=A0{<br>
-=C2=A0 =C2=A0 qemu_mutex_lock_iothread();<br>
+=C2=A0 =C2=A0 bql_lock();<br>
=C2=A0 =C2=A0 =C2=A0check_interrupts(env);<br>
-=C2=A0 =C2=A0 qemu_mutex_unlock_iothread();<br>
+=C2=A0 =C2=A0 bql_unlock();<br>
=C2=A0}<br>
<br>
=C2=A0void HELPER(intset)(CPUXtensaState *env, uint32_t v)<br>
diff --git a/ui/spice-core.c b/ui/spice-core.c<br>
index db21db2c94..b6ee495a8f 100644<br>
--- a/ui/spice-core.c<br>
+++ b/ui/spice-core.c<br>
@@ -222,7 +222,7 @@ static void channel_event(int event, SpiceChannelEventI=
nfo *info)<br>
=C2=A0 =C2=A0 =C2=A0 */<br>
=C2=A0 =C2=A0 =C2=A0bool need_lock =3D !qemu_thread_is_self(&amp;me);<br>
=C2=A0 =C2=A0 =C2=A0if (need_lock) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_mutex_lock_iothread();<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 bql_lock();<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
=C2=A0 =C2=A0 =C2=A0if (info-&gt;flags &amp; SPICE_CHANNEL_EVENT_FLAG_ADDR_=
EXT) {<br>
@@ -260,7 +260,7 @@ static void channel_event(int event, SpiceChannelEventI=
nfo *info)<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
=C2=A0 =C2=A0 =C2=A0if (need_lock) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_mutex_unlock_iothread();<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 bql_unlock();<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
=C2=A0 =C2=A0 =C2=A0qapi_free_SpiceServerInfo(server);<br>
diff --git a/util/async.c b/util/async.c<br>
index 8f90ddc304..def720045b 100644<br>
--- a/util/async.c<br>
+++ b/util/async.c<br>
@@ -741,7 +741,7 @@ AioContext *qemu_get_current_aio_context(void)<br>
=C2=A0 =C2=A0 =C2=A0if (ctx) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return ctx;<br>
=C2=A0 =C2=A0 =C2=A0}<br>
-=C2=A0 =C2=A0 if (qemu_mutex_iothread_locked()) {<br>
+=C2=A0 =C2=A0 if (bql_locked()) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* Possibly in a vCPU thread.=C2=A0 */<br=
>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return qemu_get_aio_context();<br>
=C2=A0 =C2=A0 =C2=A0}<br>
diff --git a/util/main-loop.c b/util/main-loop.c<br>
index 797b640c41..bfbff4f246 100644<br>
--- a/util/main-loop.c<br>
+++ b/util/main-loop.c<br>
@@ -302,13 +302,13 @@ static int os_host_main_loop_wait(int64_t timeout)<br=
>
<br>
=C2=A0 =C2=A0 =C2=A0glib_pollfds_fill(&amp;timeout);<br>
<br>
-=C2=A0 =C2=A0 qemu_mutex_unlock_iothread();<br>
+=C2=A0 =C2=A0 bql_unlock();<br>
=C2=A0 =C2=A0 =C2=A0replay_mutex_unlock();<br>
<br>
=C2=A0 =C2=A0 =C2=A0ret =3D qemu_poll_ns((GPollFD *)gpollfds-&gt;data, gpol=
lfds-&gt;len, timeout);<br>
<br>
=C2=A0 =C2=A0 =C2=A0replay_mutex_lock();<br>
-=C2=A0 =C2=A0 qemu_mutex_lock_iothread();<br>
+=C2=A0 =C2=A0 bql_lock();<br>
<br>
=C2=A0 =C2=A0 =C2=A0glib_pollfds_poll();<br>
<br>
@@ -517,7 +517,7 @@ static int os_host_main_loop_wait(int64_t timeout)<br>
<br>
=C2=A0 =C2=A0 =C2=A0poll_timeout_ns =3D qemu_soonest_timeout(poll_timeout_n=
s, timeout);<br>
<br>
-=C2=A0 =C2=A0 qemu_mutex_unlock_iothread();<br>
+=C2=A0 =C2=A0 bql_unlock();<br>
<br>
=C2=A0 =C2=A0 =C2=A0replay_mutex_unlock();<br>
<br>
@@ -525,7 +525,7 @@ static int os_host_main_loop_wait(int64_t timeout)<br>
<br>
=C2=A0 =C2=A0 =C2=A0replay_mutex_lock();<br>
<br>
-=C2=A0 =C2=A0 qemu_mutex_lock_iothread();<br>
+=C2=A0 =C2=A0 bql_lock();<br>
=C2=A0 =C2=A0 =C2=A0if (g_poll_ret &gt; 0) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0for (i =3D 0; i &lt; w-&gt;num; i++) {<br=
>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0w-&gt;revents[i] =3D poll_f=
ds[n_poll_fds + i].revents;<br>
diff --git a/util/qsp.c b/util/qsp.c<br>
index 2fe3764906..6b783e2e7f 100644<br>
--- a/util/qsp.c<br>
+++ b/util/qsp.c<br>
@@ -124,7 +124,7 @@ static const char * const qsp_typenames[] =3D {<br>
=C2=A0 =C2=A0 =C2=A0[QSP_CONDVAR]=C2=A0 =C2=A0=3D &quot;condvar&quot;,<br>
=C2=A0};<br>
<br>
-QemuMutexLockFunc qemu_bql_mutex_lock_func =3D qemu_mutex_lock_impl;<br>
+QemuMutexLockFunc bql_mutex_lock_func =3D qemu_mutex_lock_impl;<br>
=C2=A0QemuMutexLockFunc qemu_mutex_lock_func =3D qemu_mutex_lock_impl;<br>
=C2=A0QemuMutexTrylockFunc qemu_mutex_trylock_func =3D qemu_mutex_trylock_i=
mpl;<br>
=C2=A0QemuRecMutexLockFunc qemu_rec_mutex_lock_func =3D qemu_rec_mutex_lock=
_impl;<br>
@@ -439,7 +439,7 @@ void qsp_enable(void)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0qatomic_set(&amp;qemu_mutex_lock_func, qsp_mutex_lock);=
<br>
=C2=A0 =C2=A0 =C2=A0qatomic_set(&amp;qemu_mutex_trylock_func, qsp_mutex_try=
lock);<br>
-=C2=A0 =C2=A0 qatomic_set(&amp;qemu_bql_mutex_lock_func, qsp_bql_mutex_loc=
k);<br>
+=C2=A0 =C2=A0 qatomic_set(&amp;bql_mutex_lock_func, qsp_bql_mutex_lock);<b=
r>
=C2=A0 =C2=A0 =C2=A0qatomic_set(&amp;qemu_rec_mutex_lock_func, qsp_rec_mute=
x_lock);<br>
=C2=A0 =C2=A0 =C2=A0qatomic_set(&amp;qemu_rec_mutex_trylock_func, qsp_rec_m=
utex_trylock);<br>
=C2=A0 =C2=A0 =C2=A0qatomic_set(&amp;qemu_cond_wait_func, qsp_cond_wait);<b=
r>
@@ -450,7 +450,7 @@ void qsp_disable(void)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0qatomic_set(&amp;qemu_mutex_lock_func, qemu_mutex_lock_=
impl);<br>
=C2=A0 =C2=A0 =C2=A0qatomic_set(&amp;qemu_mutex_trylock_func, qemu_mutex_tr=
ylock_impl);<br>
-=C2=A0 =C2=A0 qatomic_set(&amp;qemu_bql_mutex_lock_func, qemu_mutex_lock_i=
mpl);<br>
+=C2=A0 =C2=A0 qatomic_set(&amp;bql_mutex_lock_func, qemu_mutex_lock_impl);=
<br>
=C2=A0 =C2=A0 =C2=A0qatomic_set(&amp;qemu_rec_mutex_lock_func, qemu_rec_mut=
ex_lock_impl);<br>
=C2=A0 =C2=A0 =C2=A0qatomic_set(&amp;qemu_rec_mutex_trylock_func, qemu_rec_=
mutex_trylock_impl);<br>
=C2=A0 =C2=A0 =C2=A0qatomic_set(&amp;qemu_cond_wait_func, qemu_cond_wait_im=
pl);<br>
diff --git a/util/rcu.c b/util/rcu.c<br>
index e587bcc483..bb7f633b5c 100644<br>
--- a/util/rcu.c<br>
+++ b/util/rcu.c<br>
@@ -283,24 +283,24 @@ static void *call_rcu_thread(void *opaque)<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0qatomic_sub(&amp;rcu_call_count, n);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0synchronize_rcu();<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_mutex_lock_iothread();<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 bql_lock();<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0while (n &gt; 0) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0node =3D try_dequeue();<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0while (!node) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_mutex_unlock_=
iothread();<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bql_unlock();<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0qemu_event_re=
set(&amp;rcu_call_ready_event);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0node =3D try_=
dequeue();<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!node) {<=
br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0qemu_event_wait(&amp;rcu_call_ready_event);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0node =3D try_dequeue();<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_mutex_lock_io=
thread();<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bql_lock();<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0n--;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0node-&gt;func(node);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_mutex_unlock_iothread();<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 bql_unlock();<br>
=C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0abort();<br>
=C2=A0}<br>
@@ -337,13 +337,13 @@ static void drain_rcu_callback(struct rcu_head *node)=
<br>
=C2=A0void drain_call_rcu(void)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0struct rcu_drain rcu_drain;<br>
-=C2=A0 =C2=A0 bool locked =3D qemu_mutex_iothread_locked();<br>
+=C2=A0 =C2=A0 bool locked =3D bql_locked();<br>
<br>
=C2=A0 =C2=A0 =C2=A0memset(&amp;rcu_drain, 0, sizeof(struct rcu_drain));<br=
>
=C2=A0 =C2=A0 =C2=A0qemu_event_init(&amp;rcu_drain.drain_complete_event, fa=
lse);<br>
<br>
=C2=A0 =C2=A0 =C2=A0if (locked) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_mutex_unlock_iothread();<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 bql_unlock();<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
<br>
@@ -365,7 +365,7 @@ void drain_call_rcu(void)<br>
=C2=A0 =C2=A0 =C2=A0qatomic_dec(&amp;in_drain_call_rcu);<br>
<br>
=C2=A0 =C2=A0 =C2=A0if (locked) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_mutex_lock_iothread();<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 bql_lock();<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
=C2=A0}<br>
diff --git a/audio/coreaudio.m b/audio/coreaudio.m<br>
index 8cd129a27d..9d2db9883c 100644<br>
--- a/audio/coreaudio.m<br>
+++ b/audio/coreaudio.m<br>
@@ -547,7 +547,7 @@ static OSStatus handle_voice_change(<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0coreaudioVoiceOut *core =3D in_client_data;<br>
<br>
-=C2=A0 =C2=A0 qemu_mutex_lock_iothread();<br>
+=C2=A0 =C2=A0 bql_lock();<br>
<br>
=C2=A0 =C2=A0 =C2=A0if (core-&gt;outputDeviceID) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fini_out_device(core);<br>
@@ -557,7 +557,7 @@ static OSStatus handle_voice_change(<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0update_device_playback_state(core);<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
-=C2=A0 =C2=A0 qemu_mutex_unlock_iothread();<br>
+=C2=A0 =C2=A0 bql_unlock();<br>
=C2=A0 =C2=A0 =C2=A0return 0;<br>
=C2=A0}<br>
<br>
diff --git a/memory_ldst.c.inc b/memory_ldst.c.inc<br>
index 84b868f294..0e6f3940a9 100644<br>
--- a/memory_ldst.c.inc<br>
+++ b/memory_ldst.c.inc<br>
@@ -61,7 +61,7 @@ static inline uint32_t glue(address_space_ldl_internal, S=
UFFIX)(ARG1_DECL,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*result =3D r;<br>
=C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0if (release_lock) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_mutex_unlock_iothread();<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 bql_unlock();<br>
=C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0RCU_READ_UNLOCK();<br>
=C2=A0 =C2=A0 =C2=A0return val;<br>
@@ -130,7 +130,7 @@ static inline uint64_t glue(address_space_ldq_internal,=
 SUFFIX)(ARG1_DECL,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*result =3D r;<br>
=C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0if (release_lock) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_mutex_unlock_iothread();<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 bql_unlock();<br>
=C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0RCU_READ_UNLOCK();<br>
=C2=A0 =C2=A0 =C2=A0return val;<br>
@@ -186,7 +186,7 @@ uint8_t glue(address_space_ldub, SUFFIX)(ARG1_DECL,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*result =3D r;<br>
=C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0if (release_lock) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_mutex_unlock_iothread();<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 bql_unlock();<br>
=C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0RCU_READ_UNLOCK();<br>
=C2=A0 =C2=A0 =C2=A0return val;<br>
@@ -234,7 +234,7 @@ static inline uint16_t glue(address_space_lduw_internal=
, SUFFIX)(ARG1_DECL,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*result =3D r;<br>
=C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0if (release_lock) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_mutex_unlock_iothread();<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 bql_unlock();<br>
=C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0RCU_READ_UNLOCK();<br>
=C2=A0 =C2=A0 =C2=A0return val;<br>
@@ -295,7 +295,7 @@ void glue(address_space_stl_notdirty, SUFFIX)(ARG1_DECL=
,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*result =3D r;<br>
=C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0if (release_lock) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_mutex_unlock_iothread();<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 bql_unlock();<br>
=C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0RCU_READ_UNLOCK();<br>
=C2=A0}<br>
@@ -339,7 +339,7 @@ static inline void glue(address_space_stl_internal, SUF=
FIX)(ARG1_DECL,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*result =3D r;<br>
=C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0if (release_lock) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_mutex_unlock_iothread();<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 bql_unlock();<br>
=C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0RCU_READ_UNLOCK();<br>
=C2=A0}<br>
@@ -391,7 +391,7 @@ void glue(address_space_stb, SUFFIX)(ARG1_DECL,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*result =3D r;<br>
=C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0if (release_lock) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_mutex_unlock_iothread();<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 bql_unlock();<br>
=C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0RCU_READ_UNLOCK();<br>
=C2=A0}<br>
@@ -435,7 +435,7 @@ static inline void glue(address_space_stw_internal, SUF=
FIX)(ARG1_DECL,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*result =3D r;<br>
=C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0if (release_lock) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_mutex_unlock_iothread();<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 bql_unlock();<br>
=C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0RCU_READ_UNLOCK();<br>
=C2=A0}<br>
@@ -499,7 +499,7 @@ static void glue(address_space_stq_internal, SUFFIX)(AR=
G1_DECL,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*result =3D r;<br>
=C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0if (release_lock) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_mutex_unlock_iothread();<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 bql_unlock();<br>
=C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0RCU_READ_UNLOCK();<br>
=C2=A0}<br>
diff --git a/target/i386/hvf/README.md b/target/i386/hvf/README.md<br>
index 2d33477aca..64a8935237 100644<br>
--- a/target/i386/hvf/README.md<br>
+++ b/target/i386/hvf/README.md<br>
@@ -4,4 +4,4 @@ These sources (and ../hvf-all.c) are adapted from Veertu In=
c&#39;s vdhh (Veertu Desk<br>
<br>
=C2=A01. Adapt to our current QEMU&#39;s `CPUState` structure and `address_=
space_rw` API; many struct members have been moved around (emulated x86 sta=
te, xsave_buf) due to historical differences + QEMU needing to handle more =
emulation targets.<br>
=C2=A02. Removal of `apic_page` and hyperv-related functionality.<br>
-3. More relaxed use of `qemu_mutex_lock_iothread`.<br>
+3. More relaxed use of `bql_lock`.<br>
diff --git a/ui/cocoa.m b/ui/cocoa.m<br>
index cd069da696..5ebb535070 100644<br>
--- a/ui/cocoa.m<br>
+++ b/ui/cocoa.m<br>
@@ -117,29 +117,29 @@ static void cocoa_switch(DisplayChangeListener *dcl,<=
br>
=C2=A0typedef void (^CodeBlock)(void);<br>
=C2=A0typedef bool (^BoolCodeBlock)(void);<br>
<br>
-static void with_iothread_lock(CodeBlock block)<br>
+static void with_bql(CodeBlock block)<br>
=C2=A0{<br>
-=C2=A0 =C2=A0 bool locked =3D qemu_mutex_iothread_locked();<br>
+=C2=A0 =C2=A0 bool locked =3D bql_locked();<br>
=C2=A0 =C2=A0 =C2=A0if (!locked) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_mutex_lock_iothread();<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 bql_lock();<br>
=C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0block();<br>
=C2=A0 =C2=A0 =C2=A0if (!locked) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_mutex_unlock_iothread();<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 bql_unlock();<br>
=C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0}<br>
<br>
-static bool bool_with_iothread_lock(BoolCodeBlock block)<br>
+static bool bool_with_bql(BoolCodeBlock block)<br>
=C2=A0{<br>
-=C2=A0 =C2=A0 bool locked =3D qemu_mutex_iothread_locked();<br>
+=C2=A0 =C2=A0 bool locked =3D bql_locked();<br>
=C2=A0 =C2=A0 =C2=A0bool val;<br>
<br>
=C2=A0 =C2=A0 =C2=A0if (!locked) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_mutex_lock_iothread();<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 bql_lock();<br>
=C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0val =3D block();<br>
=C2=A0 =C2=A0 =C2=A0if (!locked) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_mutex_unlock_iothread();<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 bql_unlock();<br>
=C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0return val;<br>
=C2=A0}<br>
@@ -605,7 +605,7 @@ - (void) updateUIInfo<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return;<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
-=C2=A0 =C2=A0 with_iothread_lock(^{<br>
+=C2=A0 =C2=A0 with_bql(^{<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0[self updateUIInfoLocked];<br>
=C2=A0 =C2=A0 =C2=A0});<br>
=C2=A0}<br>
@@ -790,7 +790,7 @@ - (void) handleMonitorInput:(NSEvent *)event<br>
<br>
=C2=A0- (bool) handleEvent:(NSEvent *)event<br>
=C2=A0{<br>
-=C2=A0 =C2=A0 return bool_with_iothread_lock(^{<br>
+=C2=A0 =C2=A0 return bool_with_bql(^{<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return [self handleEventLocked:event];<br=
>
=C2=A0 =C2=A0 =C2=A0});<br>
=C2=A0}<br>
@@ -1182,7 +1182,7 @@ - (QEMUScreen) gscreen {return screen;}<br>
=C2=A0 */<br>
=C2=A0- (void) raiseAllKeys<br>
=C2=A0{<br>
-=C2=A0 =C2=A0 with_iothread_lock(^{<br>
+=C2=A0 =C2=A0 with_bql(^{<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0qkbd_state_lift_all_keys(kbd);<br>
=C2=A0 =C2=A0 =C2=A0});<br>
=C2=A0}<br>
@@ -1282,7 +1282,7 @@ - (void)applicationWillTerminate:(NSNotification *)aN=
otification<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0COCOA_DEBUG(&quot;QemuCocoaAppController: applicationWi=
llTerminate\n&quot;);<br>
<br>
-=C2=A0 =C2=A0 with_iothread_lock(^{<br>
+=C2=A0 =C2=A0 with_bql(^{<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0shutdown_action =3D SHUTDOWN_ACTION_POWER=
OFF;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0qemu_system_shutdown_request(SHUTDOWN_CAU=
SE_HOST_UI);<br>
=C2=A0 =C2=A0 =C2=A0});<br>
@@ -1420,7 +1420,7 @@ - (void)displayConsole:(id)sender<br>
=C2=A0/* Pause the guest */<br>
=C2=A0- (void)pauseQEMU:(id)sender<br>
=C2=A0{<br>
-=C2=A0 =C2=A0 with_iothread_lock(^{<br>
+=C2=A0 =C2=A0 with_bql(^{<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0qmp_stop(NULL);<br>
=C2=A0 =C2=A0 =C2=A0});<br>
=C2=A0 =C2=A0 =C2=A0[sender setEnabled: NO];<br>
@@ -1431,7 +1431,7 @@ - (void)pauseQEMU:(id)sender<br>
=C2=A0/* Resume running the guest operating system */<br>
=C2=A0- (void)resumeQEMU:(id) sender<br>
=C2=A0{<br>
-=C2=A0 =C2=A0 with_iothread_lock(^{<br>
+=C2=A0 =C2=A0 with_bql(^{<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0qmp_cont(NULL);<br>
=C2=A0 =C2=A0 =C2=A0});<br>
=C2=A0 =C2=A0 =C2=A0[sender setEnabled: NO];<br>
@@ -1461,7 +1461,7 @@ - (void)removePause<br>
=C2=A0/* Restarts QEMU */<br>
=C2=A0- (void)restartQEMU:(id)sender<br>
=C2=A0{<br>
-=C2=A0 =C2=A0 with_iothread_lock(^{<br>
+=C2=A0 =C2=A0 with_bql(^{<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0qmp_system_reset(NULL);<br>
=C2=A0 =C2=A0 =C2=A0});<br>
=C2=A0}<br>
@@ -1469,7 +1469,7 @@ - (void)restartQEMU:(id)sender<br>
=C2=A0/* Powers down QEMU */<br>
=C2=A0- (void)powerDownQEMU:(id)sender<br>
=C2=A0{<br>
-=C2=A0 =C2=A0 with_iothread_lock(^{<br>
+=C2=A0 =C2=A0 with_bql(^{<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0qmp_system_powerdown(NULL);<br>
=C2=A0 =C2=A0 =C2=A0});<br>
=C2=A0}<br>
@@ -1488,7 +1488,7 @@ - (void)ejectDeviceMedia:(id)sender<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
=C2=A0 =C2=A0 =C2=A0__block Error *err =3D NULL;<br>
-=C2=A0 =C2=A0 with_iothread_lock(^{<br>
+=C2=A0 =C2=A0 with_bql(^{<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0qmp_eject([drive cStringUsingEncoding: NS=
ASCIIStringEncoding],<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0NULL, =
false, false, &amp;err);<br>
=C2=A0 =C2=A0 =C2=A0});<br>
@@ -1523,7 +1523,7 @@ - (void)changeDeviceMedia:(id)sender<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0__block Error *err =3D NULL;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 with_iothread_lock(^{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 with_bql(^{<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0qmp_blockdev_change_medium(=
[drive cStringUsingEncoding:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0NSASCIIStringEncoding],<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 NULL,<br=
>
@@ -1605,7 +1605,7 @@ - (void)adjustSpeed:(id)sender<br>
=C2=A0 =C2=A0 =C2=A0// get the throttle percentage<br>
=C2=A0 =C2=A0 =C2=A0throttle_pct =3D [sender tag];<br>
<br>
-=C2=A0 =C2=A0 with_iothread_lock(^{<br>
+=C2=A0 =C2=A0 with_bql(^{<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cpu_throttle_set(throttle_pct);<br>
=C2=A0 =C2=A0 =C2=A0});<br>
=C2=A0 =C2=A0 =C2=A0COCOA_DEBUG(&quot;cpu throttling at %d%c\n&quot;, cpu_t=
hrottle_get_percentage(), &#39;%&#39;);<br>
@@ -1819,7 +1819,7 @@ - (void)pasteboard:(NSPasteboard *)sender provideData=
ForType:(NSPasteboardType)t<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return;<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
-=C2=A0 =C2=A0 with_iothread_lock(^{<br>
+=C2=A0 =C2=A0 with_bql(^{<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0QemuClipboardInfo *info =3D qemu_clipboar=
d_info_ref(cbinfo);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0qemu_event_reset(&amp;cbevent);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0qemu_clipboard_request(info, QEMU_CLIPBOA=
RD_TYPE_TEXT);<br>
@@ -1827,9 +1827,9 @@ - (void)pasteboard:(NSPasteboard *)sender provideData=
ForType:(NSPasteboardType)t<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0while (info =3D=3D cbinfo &amp;&amp;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 info-&gt;types[QEMU=
_CLIPBOARD_TYPE_TEXT].available &amp;&amp;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 info-&gt;types[QEMU=
_CLIPBOARD_TYPE_TEXT].data =3D=3D NULL) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_mutex_unlock_iothread();<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bql_unlock();<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0qemu_event_wait(&amp;cbeven=
t);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_mutex_lock_iothread();<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bql_lock();<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (info =3D=3D cbinfo) {<br>
@@ -1927,9 +1927,9 @@ static void cocoa_clipboard_request(QemuClipboardInfo=
 *info,<br>
=C2=A0 =C2=A0 =C2=A0int status;<br>
<br>
=C2=A0 =C2=A0 =C2=A0COCOA_DEBUG(&quot;Second thread: calling qemu_default_m=
ain()\n&quot;);<br>
-=C2=A0 =C2=A0 qemu_mutex_lock_iothread();<br>
+=C2=A0 =C2=A0 bql_lock();<br>
=C2=A0 =C2=A0 =C2=A0status =3D qemu_default_main();<br>
-=C2=A0 =C2=A0 qemu_mutex_unlock_iothread();<br>
+=C2=A0 =C2=A0 bql_unlock();<br>
=C2=A0 =C2=A0 =C2=A0COCOA_DEBUG(&quot;Second thread: qemu_default_main() re=
turned, exiting\n&quot;);<br>
=C2=A0 =C2=A0 =C2=A0[cbowner release];<br>
=C2=A0 =C2=A0 =C2=A0exit(status);<br>
@@ -1941,7 +1941,7 @@ static int cocoa_main(void)<br>
<br>
=C2=A0 =C2=A0 =C2=A0COCOA_DEBUG(&quot;Entered %s()\n&quot;, __func__);<br>
<br>
-=C2=A0 =C2=A0 qemu_mutex_unlock_iothread();<br>
+=C2=A0 =C2=A0 bql_unlock();<br>
=C2=A0 =C2=A0 =C2=A0qemu_thread_create(&amp;thread, &quot;qemu_main&quot;, =
call_qemu_main,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 NULL, QEMU_THREAD_DETACHED);<br>
<br>
-- <br>
2.43.0<br>
<br>
</blockquote></div><font face=3D"comic sans ms, sans-serif"><div dir=3D"ltr=
"><font face=3D"comic sans ms, sans-serif"><br></font></div>T<span class=3D=
"gmail_default" style=3D"font-family:&quot;comic sans ms&quot;,sans-serif">=
hanks,</span><div dir=3D"ltr"><font face=3D"comic sans ms, sans-serif"><br>=
</font></div>Acked-by: Hyman Huang &lt;<a href=3D"mailto:yong.huang@smartx.=
com">yong.huang@smartx.com</a>&gt;</font></div><div dir=3D"ltr"><font face=
=3D"comic sans ms, sans-serif"><br></font><span class=3D"gmail_signature_pr=
efix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature"><div dir=3D"=
ltr"><font face=3D"comic sans ms, sans-serif">Best regards</font></div></di=
v></div></div></div></div>

--0000000000009f22ff060c5a2da5--

