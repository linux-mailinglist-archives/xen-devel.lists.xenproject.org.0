Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 72D15810A76
	for <lists+xen-devel@lfdr.de>; Wed, 13 Dec 2023 07:38:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.653726.1020208 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rDIrz-0000BD-Ee; Wed, 13 Dec 2023 06:37:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 653726.1020208; Wed, 13 Dec 2023 06:37:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rDIrz-00008p-B6; Wed, 13 Dec 2023 06:37:23 +0000
Received: by outflank-mailman (input) for mailman id 653726;
 Wed, 13 Dec 2023 06:37:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=AQxx=HY=daynix.com=akihiko.odaki@srs-se1.protection.inumbo.net>)
 id 1rDIrx-00008j-E9
 for xen-devel@lists.xenproject.org; Wed, 13 Dec 2023 06:37:21 +0000
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com
 [2607:f8b0:4864:20::1034])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0e7f28be-9982-11ee-9b0f-b553b5be7939;
 Wed, 13 Dec 2023 07:37:17 +0100 (CET)
Received: by mail-pj1-x1034.google.com with SMTP id
 98e67ed59e1d1-28abb3c5b9cso985264a91.3
 for <xen-devel@lists.xenproject.org>; Tue, 12 Dec 2023 22:37:17 -0800 (PST)
Received: from [157.82.205.15] ([157.82.205.15])
 by smtp.gmail.com with ESMTPSA id
 u13-20020a170902e5cd00b001cff026df52sm9636038plf.221.2023.12.12.22.37.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 Dec 2023 22:37:15 -0800 (PST)
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
X-Inumbo-ID: 0e7f28be-9982-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=daynix-com.20230601.gappssmtp.com; s=20230601; t=1702449436; x=1703054236; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kMU0hw+gwGczR/gRWRQnDaEoeESPinDQdK01aukaVCQ=;
        b=OFKtfprH+eMxLTgFc9eOVRyO4ktOOoxAR/DXIr44WhmKKmjjaYC4p7WQDoQAnKDjiI
         g+XrZ7XI2+z+J/U3O4dlq6w27Ht6BjVDBYX9ck92HOj3LirVqgFJmMp7j+FGCiewKpS8
         bf1S4aqKlN+1mDL66iB/4o7ULnUGjGILnbTYd/JWsihg4+5RmNlbah6U5BXFBgUmfB7Y
         XJdU9pGSugGMQbELoRs+NSZUPOmck23Cao2iiqchiwfBnXqUQfudpUznn2cw2huC3k3w
         QAL0b9nTK66mzpb8Jgy9Y+AO6Vn8ZQ7N3Fcp04zH4aaCIbXfkAnjx4B6uWY51WqCFvzC
         q7IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702449436; x=1703054236;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kMU0hw+gwGczR/gRWRQnDaEoeESPinDQdK01aukaVCQ=;
        b=ezP3wIhySuWhy4uemfXRxEciHEUZ8RYIS3J4ZzfXRNCyt2MXHTVvgY7VxKb6lfrtD0
         vCpy9sW7GId5jcBL+TWFvl/T0nFFNLTGR1VMqcCeTQidrYUvMKL2mX1bxdazJIrGCjIe
         IV3T+AWa4X1FANOFSFX5PLuMEV1BjYKu1G0etQ921zF/ifZblwB0okV+XiPhRAPsfRx0
         pqsNmaLUWZmr7BdQD5OLH5kjjZRxxcTKcMKIYaQgOH+9qjgDf/E2fDCnQ75yuZE56K0d
         tCyE+43ziDpHtkRnH3WHQQvYvpYbvYbdOBnIuovQleqJuLz+jOAwiDAV/GaoE4H9dNBo
         kvXw==
X-Gm-Message-State: AOJu0Yx/j4o7iSnGPBoz1V76rZRJpEA9LZoW53vSuww0RBPeLqYuPoC7
	oEW8otUqn2h9pJtoJXQEYTjm5Q==
X-Google-Smtp-Source: AGHT+IG5o/HJjzAe1oqBwjDmyKD+jnryCVy/PNKNBzfMqSP/v+UwSWZ7GhdbAoPzo3ay4ybD2HWbEQ==
X-Received: by 2002:a17:902:eb87:b0:1d0:b944:6344 with SMTP id q7-20020a170902eb8700b001d0b9446344mr3145508plg.28.1702449435577;
        Tue, 12 Dec 2023 22:37:15 -0800 (PST)
Message-ID: <389fff8c-9f5d-4b6b-acd2-bc3e2110a9b3@daynix.com>
Date: Wed, 13 Dec 2023 15:37:00 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/5] system/cpus: rename qemu_mutex_lock_iothread() to
 bql_lock()
Content-Language: en-US
To: Stefan Hajnoczi <stefanha@redhat.com>, qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Paul Durrant <paul@xen.org>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
 Paolo Bonzini <pbonzini@redhat.com>, BALATON Zoltan <balaton@eik.bme.hu>,
 Jagannathan Raman <jag.raman@oracle.com>,
 Anthony Perard <anthony.perard@citrix.com>,
 Nicholas Piggin <npiggin@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Alexander Graf <agraf@csgraf.de>, Hailiang Zhang
 <zhanghailiang@xfusion.com>, Marcelo Tosatti <mtosatti@redhat.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Huacai Chen <chenhuacai@kernel.org>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>,
 Ilya Leoshkevich <iii@linux.ibm.com>, Peter Xu <peterx@redhat.com>,
 Hyman Huang <yong.huang@smartx.com>, Fam Zheng <fam@euphon.net>,
 Song Gao <gaosong@loongson.cn>, Alistair Francis <alistair.francis@wdc.com>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 David Woodhouse <dwmw2@infradead.org>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Aurelien Jarno <aurelien@aurel32.net>,
 Leonardo Bras <leobras@redhat.com>, Jiri Slaby <jslaby@suse.cz>,
 Eric Farman <farman@linux.ibm.com>, Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 David Hildenbrand <david@redhat.com>, Michael Roth <michael.roth@amd.com>,
 Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Cameron Esfahani <dirty@apple.com>,
 qemu-ppc@nongnu.org, John Snow <jsnow@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Weiwei Li <liwei1518@gmail.com>, Hanna Reitz <hreitz@redhat.com>,
 qemu-s390x@nongnu.org, qemu-block@nongnu.org,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>, kvm@vger.kernel.org,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 Andrey Smirnov <andrew.smirnov@gmail.com>,
 Reinoud Zandijk <reinoud@netbsd.org>, Kevin Wolf <kwolf@redhat.com>,
 Bin Meng <bin.meng@windriver.com>, Sunil Muthuswamy
 <sunilmut@microsoft.com>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-riscv@nongnu.org, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Stafford Horne <shorne@gmail.com>, Fabiano Rosas <farosas@suse.de>,
 Juan Quintela <quintela@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 qemu-arm@nongnu.org, Jason Wang <jasowang@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>, Max Filippov <jcmvbkbc@gmail.com>,
 Jean-Christophe Dubois <jcd@tribudubois.net>, Eric Blake
 <eblake@redhat.com>, Roman Bolshakov <rbolshakov@ddn.com>,
 Halil Pasic <pasic@linux.ibm.com>, xen-devel@lists.xenproject.org,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 David Woodhouse <dwmw@amazon.co.uk>
References: <20231212153905.631119-1-stefanha@redhat.com>
 <20231212153905.631119-2-stefanha@redhat.com>
From: Akihiko Odaki <akihiko.odaki@daynix.com>
In-Reply-To: <20231212153905.631119-2-stefanha@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 2023/12/13 0:39, Stefan Hajnoczi wrote:
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
> Reviewed-by: Cédric Le Goater <clg@kaod.org>
> Acked-by: Peter Xu <peterx@redhat.com>
> Acked-by: Eric Farman <farman@linux.ibm.com>
> Reviewed-by: Harsh Prateek Bora <harshpb@linux.ibm.com>
> ---
>   include/block/aio-wait.h             |   2 +-
>   include/qemu/main-loop.h             |  40 ++++-----
>   include/qemu/thread.h                |   2 +-
>   accel/accel-blocker.c                |  10 +--
>   accel/dummy-cpus.c                   |   8 +-
>   accel/hvf/hvf-accel-ops.c            |   4 +-
>   accel/kvm/kvm-accel-ops.c            |   4 +-
>   accel/kvm/kvm-all.c                  |  22 ++---
>   accel/tcg/cpu-exec.c                 |  26 +++---
>   accel/tcg/cputlb.c                   |  16 ++--
>   accel/tcg/tcg-accel-ops-icount.c     |   4 +-
>   accel/tcg/tcg-accel-ops-mttcg.c      |  12 +--
>   accel/tcg/tcg-accel-ops-rr.c         |  14 ++--
>   accel/tcg/tcg-accel-ops.c            |   2 +-
>   accel/tcg/translate-all.c            |   2 +-
>   cpu-common.c                         |   4 +-
>   dump/dump.c                          |   4 +-
>   hw/core/cpu-common.c                 |   6 +-
>   hw/i386/intel_iommu.c                |   6 +-
>   hw/i386/kvm/xen_evtchn.c             |  16 ++--
>   hw/i386/kvm/xen_overlay.c            |   2 +-
>   hw/i386/kvm/xen_xenstore.c           |   2 +-
>   hw/intc/arm_gicv3_cpuif.c            |   2 +-
>   hw/intc/s390_flic.c                  |  18 ++--
>   hw/misc/edu.c                        |   4 +-
>   hw/misc/imx6_src.c                   |   2 +-
>   hw/misc/imx7_src.c                   |   2 +-
>   hw/net/xen_nic.c                     |   8 +-
>   hw/ppc/pegasos2.c                    |   2 +-
>   hw/ppc/ppc.c                         |   4 +-
>   hw/ppc/spapr.c                       |   2 +-
>   hw/ppc/spapr_rng.c                   |   4 +-
>   hw/ppc/spapr_softmmu.c               |   4 +-
>   hw/remote/mpqemu-link.c              |  20 ++---
>   hw/remote/vfio-user-obj.c            |   2 +-
>   hw/s390x/s390-skeys.c                |   2 +-
>   migration/block-dirty-bitmap.c       |   4 +-
>   migration/block.c                    |  16 ++--
>   migration/colo.c                     |  60 +++++++-------
>   migration/dirtyrate.c                |  12 +--
>   migration/migration.c                |  52 ++++++------
>   migration/ram.c                      |  12 +--
>   replay/replay-internal.c             |   2 +-
>   semihosting/console.c                |   8 +-
>   stubs/iothread-lock.c                |   6 +-
>   system/cpu-throttle.c                |   4 +-
>   system/cpus.c                        |  51 ++++++------
>   system/dirtylimit.c                  |   4 +-
>   system/memory.c                      |   2 +-
>   system/physmem.c                     |   8 +-
>   system/runstate.c                    |   2 +-
>   system/watchpoint.c                  |   4 +-
>   target/arm/arm-powerctl.c            |  14 ++--
>   target/arm/helper.c                  |   4 +-
>   target/arm/hvf/hvf.c                 |   8 +-
>   target/arm/kvm.c                     |   4 +-
>   target/arm/kvm64.c                   |   4 +-
>   target/arm/ptw.c                     |   6 +-
>   target/arm/tcg/helper-a64.c          |   8 +-
>   target/arm/tcg/m_helper.c            |   6 +-
>   target/arm/tcg/op_helper.c           |  24 +++---
>   target/arm/tcg/psci.c                |   2 +-
>   target/hppa/int_helper.c             |   8 +-
>   target/i386/hvf/hvf.c                |   6 +-
>   target/i386/kvm/hyperv.c             |   4 +-
>   target/i386/kvm/kvm.c                |  28 +++----
>   target/i386/kvm/xen-emu.c            |  14 ++--
>   target/i386/nvmm/nvmm-accel-ops.c    |   4 +-
>   target/i386/nvmm/nvmm-all.c          |  20 ++---
>   target/i386/tcg/sysemu/fpu_helper.c  |   6 +-
>   target/i386/tcg/sysemu/misc_helper.c |   4 +-
>   target/i386/whpx/whpx-accel-ops.c    |   4 +-
>   target/i386/whpx/whpx-all.c          |  24 +++---
>   target/loongarch/csr_helper.c        |   4 +-
>   target/mips/kvm.c                    |   4 +-
>   target/mips/tcg/sysemu/cp0_helper.c  |   4 +-
>   target/openrisc/sys_helper.c         |  16 ++--
>   target/ppc/excp_helper.c             |  12 +--
>   target/ppc/kvm.c                     |   4 +-
>   target/ppc/misc_helper.c             |   8 +-
>   target/ppc/timebase_helper.c         |   8 +-
>   target/s390x/kvm/kvm.c               |   4 +-
>   target/s390x/tcg/misc_helper.c       | 118 +++++++++++++--------------
>   target/sparc/int32_helper.c          |   2 +-
>   target/sparc/int64_helper.c          |   6 +-
>   target/sparc/win_helper.c            |  20 ++---
>   target/xtensa/exc_helper.c           |   8 +-
>   ui/spice-core.c                      |   4 +-
>   util/async.c                         |   2 +-
>   util/main-loop.c                     |   8 +-
>   util/qsp.c                           |   6 +-
>   util/rcu.c                           |  14 ++--
>   audio/coreaudio.m                    |   4 +-
>   memory_ldst.c.inc                    |  18 ++--
>   target/i386/hvf/README.md            |   2 +-
>   ui/cocoa.m                           |  50 ++++++------
>   96 files changed, 530 insertions(+), 529 deletions(-)
> 
> diff --git a/include/block/aio-wait.h b/include/block/aio-wait.h
> index 5449b6d742..d22ca24329 100644
> --- a/include/block/aio-wait.h
> +++ b/include/block/aio-wait.h
> @@ -151,7 +151,7 @@ static inline bool in_aio_context_home_thread(AioContext *ctx)
>       }
>   
>       if (ctx == qemu_get_aio_context()) {
> -        return qemu_mutex_iothread_locked();
> +        return bql_locked();
>       } else {
>           return false;
>       }
> diff --git a/include/qemu/main-loop.h b/include/qemu/main-loop.h
> index 68e70e61aa..596a206acd 100644
> --- a/include/qemu/main-loop.h
> +++ b/include/qemu/main-loop.h
> @@ -248,19 +248,19 @@ GSource *iohandler_get_g_source(void);
>   AioContext *iohandler_get_aio_context(void);
>   
>   /**
> - * qemu_mutex_iothread_locked: Return lock status of the main loop mutex.
> + * bql_locked: Return lock status of the Big QEMU Lock (BQL)
>    *
> - * The main loop mutex is the coarsest lock in QEMU, and as such it
> + * The Big QEMU Lock (BQL) is the coarsest lock in QEMU, and as such it
>    * must always be taken outside other locks.  This function helps
>    * functions take different paths depending on whether the current
> - * thread is running within the main loop mutex.
> + * thread is running within the BQL.
>    *
>    * This function should never be used in the block layer, because
>    * unit tests, block layer tools and qemu-storage-daemon do not
>    * have a BQL.
>    * Please instead refer to qemu_in_main_thread().
>    */
> -bool qemu_mutex_iothread_locked(void);
> +bool bql_locked(void);
>   
>   /**
>    * qemu_in_main_thread: return whether it's possible to safely access
> @@ -312,58 +312,58 @@ bool qemu_in_main_thread(void);
>       } while (0)
>   
>   /**
> - * qemu_mutex_lock_iothread: Lock the main loop mutex.
> + * bql_lock: Lock the Big QEMU Lock (BQL).
>    *
> - * This function locks the main loop mutex.  The mutex is taken by
> + * This function locks the Big QEMU Lock (BQL).  The lock is taken by
>    * main() in vl.c and always taken except while waiting on
> - * external events (such as with select).  The mutex should be taken
> + * external events (such as with select).  The lock should be taken
>    * by threads other than the main loop thread when calling
>    * qemu_bh_new(), qemu_set_fd_handler() and basically all other
>    * functions documented in this file.
>    *
> - * NOTE: tools currently are single-threaded and qemu_mutex_lock_iothread
> + * NOTE: tools currently are single-threaded and bql_lock
>    * is a no-op there.
>    */
> -#define qemu_mutex_lock_iothread()                      \
> -    qemu_mutex_lock_iothread_impl(__FILE__, __LINE__)
> -void qemu_mutex_lock_iothread_impl(const char *file, int line);
> +#define bql_lock()                      \
> +    bql_lock_impl(__FILE__, __LINE__)

This line break is no longer necessary.

