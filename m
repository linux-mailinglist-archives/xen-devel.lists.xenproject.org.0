Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5171E2757A8
	for <lists+xen-devel@lfdr.de>; Wed, 23 Sep 2020 14:05:10 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kL3Vk-0001Pd-T3; Wed, 23 Sep 2020 12:04:36 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=g9L7=DA=redhat.com=pbonzini@srs-us1.protection.inumbo.net>)
 id 1kL3Vj-0001PY-8f
 for xen-devel@lists.xenproject.org; Wed, 23 Sep 2020 12:04:35 +0000
X-Inumbo-ID: e48e3850-bf74-433c-9286-1e068c716bc4
Received: from us-smtp-delivery-124.mimecast.com (unknown [63.128.21.124])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id e48e3850-bf74-433c-9286-1e068c716bc4;
 Wed, 23 Sep 2020 12:04:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1600862672;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3IVdkYm7HkQ8zLhea6Q0sZljwbo+0qeo/IOEv9CZemo=;
 b=cC85T5gfWG5tjY/8tfN0h626kpYH9NSx+af4AMoBgiGNwPkMhwi5838Ks0qysn7UpH3x4m
 iAiz6jSaEgMZRn+htz0v12lgHfS0SqOMfEGJheys6UEnKPsBoMsJSdjdB6+TK1nhMRnt9D
 cvSLL/f2phBvPs3Gb/JfjYdD11uSwYs=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-410-dOJieTZeNGWtwhg7kI84yw-1; Wed, 23 Sep 2020 08:04:26 -0400
X-MC-Unique: dOJieTZeNGWtwhg7kI84yw-1
Received: by mail-wr1-f71.google.com with SMTP id j7so8771448wro.14
 for <xen-devel@lists.xenproject.org>; Wed, 23 Sep 2020 05:04:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=3IVdkYm7HkQ8zLhea6Q0sZljwbo+0qeo/IOEv9CZemo=;
 b=ahqoy3sv8zo9j3i1e+42AMjfjbitE0Is84IEul+IqTezz0M3DxuCrAVWykENTMBUNZ
 jMwGbwLNBra7rTCvYB/+7FhuSFU8zDAduedVRxY8ejnudMr8rkM1BCddahbxRIaYxj8/
 GagfBF8hnODCB8Vva46UBqkYwcLWCv68tvTQtjjOJHcIHDvOMuczQjYw5+cs7YSj3M9F
 QXifb6dPk7BGWmitMUdqxxLlLAx073DhFO9yHq7H2RCL9yz+ikgL083SF3yhqxb1u13E
 CBKBwdY+uFocJz1A7kHXdrLrH7GGjjWCrsSFLsLxNgNnTKhuU65OsxactqOYj26Q/ADs
 fAMw==
X-Gm-Message-State: AOAM531YmcAITz+F0o+ohUMfqavpwzzi68TbK7vOvUJ+h54M5fm7Q2Hf
 XBQ6VedqPeBCBobluILr8w6bgh7IQYFU40eZGuwSHrDZbGFtLl+Z9vjREfvropJ7LUV2lbOlV8R
 cMWIdZVNdznkGBStSYEiYsMPxxkY=
X-Received: by 2002:a1c:e256:: with SMTP id z83mr6249223wmg.33.1600862662903; 
 Wed, 23 Sep 2020 05:04:22 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxb/RrNefyFSMMgWubGjT2IXIExu39w06RQLMs7K11RK0idEv/qecuQGChSkCXbAlYX+ExTRA==
X-Received: by 2002:a1c:e256:: with SMTP id z83mr6249010wmg.33.1600862660910; 
 Wed, 23 Sep 2020 05:04:20 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:15f1:648d:7de6:bad9?
 ([2001:b07:6468:f312:15f1:648d:7de6:bad9])
 by smtp.gmail.com with ESMTPSA id z83sm8674579wmb.4.2020.09.23.05.04.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Sep 2020 05:04:17 -0700 (PDT)
Subject: Re: [PATCH v3] qemu/atomic.h: rename atomic_ to qatomic_
To: Stefan Hajnoczi <stefanha@redhat.com>, qemu-devel@nongnu.org
Cc: Michael Roth <mdroth@linux.vnet.ibm.com>, John Snow <jsnow@redhat.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Halil Pasic <pasic@linux.ibm.com>, Matthew Rosato <mjrosato@linux.ibm.com>,
 Peter Maydell <peter.maydell@linaro.org>, Eric Blake <eblake@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 sheepdog@lists.wpkg.org, Yoshinori Sato <ysato@users.sourceforge.jp>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Thomas Huth <thuth@redhat.com>, kvm@vger.kernel.org,
 Paul Durrant <paul@xen.org>, qemu-s390x@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
 Stefan Weil <sw@weilnetz.de>, qemu-riscv@nongnu.org, qemu-block@nongnu.org,
 Hailiang Zhang <zhang.zhanghailiang@huawei.com>,
 Max Filippov <jcmvbkbc@gmail.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Alberto Garcia <berto@igalia.com>, Kevin Wolf <kwolf@redhat.com>,
 Peter Lieven <pl@kamp.de>, =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?=
 <marcandre.lureau@redhat.com>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Laurent Vivier <laurent@vivier.eu>,
 Anthony Perard <anthony.perard@citrix.com>,
 Yuval Shaia <yuval.shaia.ml@gmail.com>, xen-devel@lists.xenproject.org,
 Huacai Chen <chenhc@lemote.com>, Sunil Muthuswamy <sunilmut@microsoft.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Juan Quintela <quintela@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Max Reitz <mreitz@redhat.com>, Richard Henderson <rth@twiddle.net>,
 Jiri Slaby <jslaby@suse.cz>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>, Liu Yuan
 <namei.unix@gmail.com>, Jason Wang <jasowang@redhat.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Fam Zheng <fam@euphon.net>,
 David Hildenbrand <david@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 qemu-arm@nongnu.org
References: <20200923105646.47864-1-stefanha@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <65b81fb9-a522-b62e-1353-04b6530de6d7@redhat.com>
Date: Wed, 23 Sep 2020 14:04:15 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200923105646.47864-1-stefanha@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 23/09/20 12:56, Stefan Hajnoczi wrote:
> clang's C11 atomic_fetch_*() functions only take a C11 atomic type
> pointer argument. QEMU uses direct types (int, etc) and this causes a
> compiler error when a QEMU code calls these functions in a source file
> that also included <stdatomic.h> via a system header file:
> 
>   $ CC=clang CXX=clang++ ./configure ... && make
>   ../util/async.c:79:17: error: address argument to atomic operation must be a pointer to _Atomic type ('unsigned int *' invalid)
> 
> Avoid using atomic_*() names in QEMU's atomic.h since that namespace is
> used by <stdatomic.h>. Prefix QEMU's APIs with 'q' so that atomic.h
> and <stdatomic.h> can co-exist. I checked /usr/include on my machine and
> searched GitHub for existing "qatomic_" users but there seem to be none.
> 
> This patch was generated using:
> 
>   $ git grep -h -o '\<atomic\(64\)\?_[a-z0-9_]\+' include/qemu/atomic.h | \
>     sort -u >/tmp/changed_identifiers
>   $ for identifier in $(</tmp/changed_identifiers); do
>         sed -i "s%\<$identifier\>%q$identifier%g" \
>             $(git grep -I -l "\<$identifier\>")
>     done
> 
> I manually fixed line-wrap issues and misaligned rST tables.
> 
> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>

Acked-by: Paolo Bonzini <pbonzini@redhat.com>

Thank you very much!

Paolo

> ---
> v3:
>  * Use qatomic_ instead of atomic_ [Paolo]
>  * The diff of my manual fixups is available here:
>    https://vmsplice.net/~stefan/atomic-namespace-pre-fixups-v3.diff
>    - Dropping #ifndef qatomic_fetch_add in atomic.h
>    - atomic_##X(haddr, val) glue macros not caught by grep
>    - Keep atomic_add-bench name
>    - C preprocessor backslash-newline ('\') column alignment
>    - Line wrapping
> v2:
>  * The diff of my manual fixups is available here:
>    https://vmsplice.net/~stefan/atomic-namespace-pre-fixups.diff
>    - Dropping #ifndef qemu_atomic_fetch_add in atomic.h
>    - atomic_##X(haddr, val) glue macros not caught by grep
>    - Keep atomic_add-bench name
>    - C preprocessor backslash-newline ('\') column alignment
>    - Line wrapping
>  * Use grep -I to avoid accidentally modifying binary files (RISC-V
>    OpenSBI ELFs) [Eric Blake]
>  * Tweak .gitorder to show atomic.h changes first [Eric Blake]
>  * Update grep commands in commit description so reviewers can reproduce
>    mechanical changes [Eric Blake]
> ---
>  include/qemu/atomic.h                         | 248 +++++++++---------
>  docs/devel/lockcnt.txt                        |   8 +-
>  docs/devel/rcu.txt                            |  34 +--
>  accel/tcg/atomic_template.h                   |  20 +-
>  include/block/aio-wait.h                      |   4 +-
>  include/block/aio.h                           |   8 +-
>  include/exec/cpu_ldst.h                       |   2 +-
>  include/exec/exec-all.h                       |   6 +-
>  include/exec/log.h                            |   6 +-
>  include/exec/memory.h                         |   2 +-
>  include/exec/ram_addr.h                       |  26 +-
>  include/exec/ramlist.h                        |   2 +-
>  include/exec/tb-lookup.h                      |   4 +-
>  include/hw/core/cpu.h                         |   2 +-
>  include/qemu/atomic128.h                      |   6 +-
>  include/qemu/bitops.h                         |   2 +-
>  include/qemu/coroutine.h                      |   2 +-
>  include/qemu/log.h                            |   6 +-
>  include/qemu/queue.h                          |   7 +-
>  include/qemu/rcu.h                            |  10 +-
>  include/qemu/rcu_queue.h                      | 100 +++----
>  include/qemu/seqlock.h                        |   8 +-
>  include/qemu/stats64.h                        |  28 +-
>  include/qemu/thread.h                         |  24 +-
>  .../infiniband/hw/vmw_pvrdma/pvrdma_ring.h    |  14 +-
>  linux-user/qemu.h                             |   2 +-
>  tcg/i386/tcg-target.h                         |   2 +-
>  tcg/s390/tcg-target.h                         |   2 +-
>  tcg/tci/tcg-target.h                          |   2 +-
>  accel/kvm/kvm-all.c                           |  12 +-
>  accel/tcg/cpu-exec.c                          |  15 +-
>  accel/tcg/cputlb.c                            |  24 +-
>  accel/tcg/tcg-all.c                           |   2 +-
>  accel/tcg/translate-all.c                     |  55 ++--
>  audio/jackaudio.c                             |  18 +-
>  block.c                                       |   4 +-
>  block/block-backend.c                         |  15 +-
>  block/io.c                                    |  48 ++--
>  block/nfs.c                                   |   2 +-
>  block/sheepdog.c                              |   2 +-
>  block/throttle-groups.c                       |  12 +-
>  block/throttle.c                              |   4 +-
>  blockdev.c                                    |   2 +-
>  blockjob.c                                    |   2 +-
>  contrib/libvhost-user/libvhost-user.c         |   2 +-
>  cpus-common.c                                 |  26 +-
>  dump/dump.c                                   |   8 +-
>  exec.c                                        |  49 ++--
>  hw/core/cpu.c                                 |   6 +-
>  hw/display/qxl.c                              |   4 +-
>  hw/hyperv/hyperv.c                            |  10 +-
>  hw/hyperv/vmbus.c                             |   2 +-
>  hw/i386/xen/xen-hvm.c                         |   2 +-
>  hw/intc/rx_icu.c                              |  12 +-
>  hw/intc/sifive_plic.c                         |   4 +-
>  hw/misc/edu.c                                 |  16 +-
>  hw/net/virtio-net.c                           |  10 +-
>  hw/rdma/rdma_backend.c                        |  18 +-
>  hw/rdma/rdma_rm.c                             |   2 +-
>  hw/rdma/vmw/pvrdma_dev_ring.c                 |   4 +-
>  hw/s390x/s390-pci-bus.c                       |   2 +-
>  hw/s390x/virtio-ccw.c                         |   2 +-
>  hw/virtio/vhost.c                             |   2 +-
>  hw/virtio/virtio-mmio.c                       |   6 +-
>  hw/virtio/virtio-pci.c                        |   6 +-
>  hw/virtio/virtio.c                            |  16 +-
>  hw/xtensa/pic_cpu.c                           |   4 +-
>  iothread.c                                    |   6 +-
>  linux-user/hppa/cpu_loop.c                    |  11 +-
>  linux-user/signal.c                           |   8 +-
>  migration/colo-failover.c                     |   4 +-
>  migration/migration.c                         |   8 +-
>  migration/multifd.c                           |  18 +-
>  migration/postcopy-ram.c                      |  34 +--
>  migration/rdma.c                              |  34 +--
>  monitor/hmp.c                                 |   6 +-
>  monitor/misc.c                                |   2 +-
>  monitor/monitor.c                             |   6 +-
>  qemu-nbd.c                                    |   2 +-
>  qga/commands.c                                |  12 +-
>  qom/object.c                                  |  20 +-
>  scsi/qemu-pr-helper.c                         |   4 +-
>  softmmu/cpu-throttle.c                        |  10 +-
>  softmmu/cpus.c                                |  42 +--
>  softmmu/memory.c                              |   6 +-
>  softmmu/vl.c                                  |   2 +-
>  target/arm/mte_helper.c                       |   6 +-
>  target/hppa/op_helper.c                       |   2 +-
>  target/i386/mem_helper.c                      |   2 +-
>  target/i386/whpx-all.c                        |   6 +-
>  target/riscv/cpu_helper.c                     |   2 +-
>  target/s390x/mem_helper.c                     |   4 +-
>  target/xtensa/exc_helper.c                    |   4 +-
>  target/xtensa/op_helper.c                     |   2 +-
>  tcg/tcg.c                                     |  58 ++--
>  tcg/tci.c                                     |   2 +-
>  tests/atomic64-bench.c                        |  14 +-
>  tests/atomic_add-bench.c                      |  14 +-
>  tests/iothread.c                              |   2 +-
>  tests/qht-bench.c                             |  12 +-
>  tests/rcutorture.c                            |  24 +-
>  tests/test-aio-multithread.c                  |  52 ++--
>  tests/test-logging.c                          |   4 +-
>  tests/test-rcu-list.c                         |  38 +--
>  tests/test-thread-pool.c                      |  10 +-
>  util/aio-posix.c                              |  14 +-
>  util/aio-wait.c                               |   2 +-
>  util/aio-win32.c                              |   5 +-
>  util/async.c                                  |  28 +-
>  util/atomic64.c                               |  10 +-
>  util/bitmap.c                                 |  14 +-
>  util/cacheinfo.c                              |   2 +-
>  util/fdmon-epoll.c                            |   4 +-
>  util/fdmon-io_uring.c                         |  12 +-
>  util/lockcnt.c                                |  52 ++--
>  util/log.c                                    |  10 +-
>  util/qemu-coroutine-lock.c                    |  18 +-
>  util/qemu-coroutine-sleep.c                   |   4 +-
>  util/qemu-coroutine.c                         |   6 +-
>  util/qemu-sockets.c                           |   4 +-
>  util/qemu-thread-posix.c                      |  12 +-
>  util/qemu-thread-win32.c                      |  12 +-
>  util/qemu-timer.c                             |  12 +-
>  util/qht.c                                    |  57 ++--
>  util/qsp.c                                    |  50 ++--
>  util/rcu.c                                    |  36 +--
>  util/stats64.c                                |  34 +--
>  docs/devel/atomics.rst                        | 134 +++++-----
>  scripts/kernel-doc                            |   2 +-
>  tcg/aarch64/tcg-target.c.inc                  |   2 +-
>  tcg/mips/tcg-target.c.inc                     |   2 +-
>  tcg/ppc/tcg-target.c.inc                      |   6 +-
>  tcg/sparc/tcg-target.c.inc                    |   5 +-
>  133 files changed, 1041 insertions(+), 1018 deletions(-)
> 
> diff --git a/include/qemu/atomic.h b/include/qemu/atomic.h
> index ff72db5115..c1d211a351 100644
> --- a/include/qemu/atomic.h
> +++ b/include/qemu/atomic.h
> @@ -125,49 +125,49 @@
>   * no effect on the generated code but not using the atomic primitives
>   * will get flagged by sanitizers as a violation.
>   */
> -#define atomic_read__nocheck(ptr) \
> +#define qatomic_read__nocheck(ptr) \
>      __atomic_load_n(ptr, __ATOMIC_RELAXED)
>  
> -#define atomic_read(ptr)                              \
> -    ({                                                \
> +#define qatomic_read(ptr)                              \
> +    ({                                                 \
>      QEMU_BUILD_BUG_ON(sizeof(*ptr) > ATOMIC_REG_SIZE); \
> -    atomic_read__nocheck(ptr);                        \
> +    qatomic_read__nocheck(ptr);                        \
>      })
>  
> -#define atomic_set__nocheck(ptr, i) \
> +#define qatomic_set__nocheck(ptr, i) \
>      __atomic_store_n(ptr, i, __ATOMIC_RELAXED)
>  
> -#define atomic_set(ptr, i)  do {                      \
> +#define qatomic_set(ptr, i)  do {                      \
>      QEMU_BUILD_BUG_ON(sizeof(*ptr) > ATOMIC_REG_SIZE); \
> -    atomic_set__nocheck(ptr, i);                      \
> +    qatomic_set__nocheck(ptr, i);                      \
>  } while(0)
>  
>  /* See above: most compilers currently treat consume and acquire the
> - * same, but this slows down atomic_rcu_read unnecessarily.
> + * same, but this slows down qatomic_rcu_read unnecessarily.
>   */
>  #ifdef __SANITIZE_THREAD__
> -#define atomic_rcu_read__nocheck(ptr, valptr)           \
> +#define qatomic_rcu_read__nocheck(ptr, valptr)           \
>      __atomic_load(ptr, valptr, __ATOMIC_CONSUME);
>  #else
> -#define atomic_rcu_read__nocheck(ptr, valptr)           \
> -    __atomic_load(ptr, valptr, __ATOMIC_RELAXED);       \
> +#define qatomic_rcu_read__nocheck(ptr, valptr)           \
> +    __atomic_load(ptr, valptr, __ATOMIC_RELAXED);        \
>      smp_read_barrier_depends();
>  #endif
>  
> -#define atomic_rcu_read(ptr)                          \
> -    ({                                                \
> +#define qatomic_rcu_read(ptr)                          \
> +    ({                                                 \
>      QEMU_BUILD_BUG_ON(sizeof(*ptr) > ATOMIC_REG_SIZE); \
> -    typeof_strip_qual(*ptr) _val;                     \
> -    atomic_rcu_read__nocheck(ptr, &_val);             \
> -    _val;                                             \
> +    typeof_strip_qual(*ptr) _val;                      \
> +    qatomic_rcu_read__nocheck(ptr, &_val);             \
> +    _val;                                              \
>      })
>  
> -#define atomic_rcu_set(ptr, i) do {                   \
> +#define qatomic_rcu_set(ptr, i) do {                   \
>      QEMU_BUILD_BUG_ON(sizeof(*ptr) > ATOMIC_REG_SIZE); \
> -    __atomic_store_n(ptr, i, __ATOMIC_RELEASE);       \
> +    __atomic_store_n(ptr, i, __ATOMIC_RELEASE);        \
>  } while(0)
>  
> -#define atomic_load_acquire(ptr)                        \
> +#define qatomic_load_acquire(ptr)                       \
>      ({                                                  \
>      QEMU_BUILD_BUG_ON(sizeof(*ptr) > ATOMIC_REG_SIZE);  \
>      typeof_strip_qual(*ptr) _val;                       \
> @@ -175,7 +175,7 @@
>      _val;                                               \
>      })
>  
> -#define atomic_store_release(ptr, i)  do {              \
> +#define qatomic_store_release(ptr, i)  do {             \
>      QEMU_BUILD_BUG_ON(sizeof(*ptr) > ATOMIC_REG_SIZE);  \
>      __atomic_store_n(ptr, i, __ATOMIC_RELEASE);         \
>  } while(0)
> @@ -183,56 +183,61 @@
>  
>  /* All the remaining operations are fully sequentially consistent */
>  
> -#define atomic_xchg__nocheck(ptr, i)    ({                  \
> +#define qatomic_xchg__nocheck(ptr, i)    ({                 \
>      __atomic_exchange_n(ptr, (i), __ATOMIC_SEQ_CST);        \
>  })
>  
> -#define atomic_xchg(ptr, i)    ({                           \
> +#define qatomic_xchg(ptr, i)    ({                          \
>      QEMU_BUILD_BUG_ON(sizeof(*ptr) > ATOMIC_REG_SIZE);      \
> -    atomic_xchg__nocheck(ptr, i);                           \
> +    qatomic_xchg__nocheck(ptr, i);                          \
>  })
>  
>  /* Returns the eventual value, failed or not */
> -#define atomic_cmpxchg__nocheck(ptr, old, new)    ({                    \
> +#define qatomic_cmpxchg__nocheck(ptr, old, new)    ({                   \
>      typeof_strip_qual(*ptr) _old = (old);                               \
>      (void)__atomic_compare_exchange_n(ptr, &_old, new, false,           \
>                                __ATOMIC_SEQ_CST, __ATOMIC_SEQ_CST);      \
>      _old;                                                               \
>  })
>  
> -#define atomic_cmpxchg(ptr, old, new)    ({                             \
> +#define qatomic_cmpxchg(ptr, old, new)    ({                            \
>      QEMU_BUILD_BUG_ON(sizeof(*ptr) > ATOMIC_REG_SIZE);                  \
> -    atomic_cmpxchg__nocheck(ptr, old, new);                             \
> +    qatomic_cmpxchg__nocheck(ptr, old, new);                            \
>  })
>  
>  /* Provide shorter names for GCC atomic builtins, return old value */
> -#define atomic_fetch_inc(ptr)  __atomic_fetch_add(ptr, 1, __ATOMIC_SEQ_CST)
> -#define atomic_fetch_dec(ptr)  __atomic_fetch_sub(ptr, 1, __ATOMIC_SEQ_CST)
> +#define qatomic_fetch_inc(ptr)  __atomic_fetch_add(ptr, 1, __ATOMIC_SEQ_CST)
> +#define qatomic_fetch_dec(ptr)  __atomic_fetch_sub(ptr, 1, __ATOMIC_SEQ_CST)
>  
> -#ifndef atomic_fetch_add
> -#define atomic_fetch_add(ptr, n) __atomic_fetch_add(ptr, n, __ATOMIC_SEQ_CST)
> -#define atomic_fetch_sub(ptr, n) __atomic_fetch_sub(ptr, n, __ATOMIC_SEQ_CST)
> -#define atomic_fetch_and(ptr, n) __atomic_fetch_and(ptr, n, __ATOMIC_SEQ_CST)
> -#define atomic_fetch_or(ptr, n)  __atomic_fetch_or(ptr, n, __ATOMIC_SEQ_CST)
> -#define atomic_fetch_xor(ptr, n) __atomic_fetch_xor(ptr, n, __ATOMIC_SEQ_CST)
> -#endif
> +#define qatomic_fetch_add(ptr, n) __atomic_fetch_add(ptr, n, __ATOMIC_SEQ_CST)
> +#define qatomic_fetch_sub(ptr, n) __atomic_fetch_sub(ptr, n, __ATOMIC_SEQ_CST)
> +#define qatomic_fetch_and(ptr, n) __atomic_fetch_and(ptr, n, __ATOMIC_SEQ_CST)
> +#define qatomic_fetch_or(ptr, n)  __atomic_fetch_or(ptr, n, __ATOMIC_SEQ_CST)
> +#define qatomic_fetch_xor(ptr, n) __atomic_fetch_xor(ptr, n, __ATOMIC_SEQ_CST)
>  
> -#define atomic_inc_fetch(ptr)    __atomic_add_fetch(ptr, 1, __ATOMIC_SEQ_CST)
> -#define atomic_dec_fetch(ptr)    __atomic_sub_fetch(ptr, 1, __ATOMIC_SEQ_CST)
> -#define atomic_add_fetch(ptr, n) __atomic_add_fetch(ptr, n, __ATOMIC_SEQ_CST)
> -#define atomic_sub_fetch(ptr, n) __atomic_sub_fetch(ptr, n, __ATOMIC_SEQ_CST)
> -#define atomic_and_fetch(ptr, n) __atomic_and_fetch(ptr, n, __ATOMIC_SEQ_CST)
> -#define atomic_or_fetch(ptr, n)  __atomic_or_fetch(ptr, n, __ATOMIC_SEQ_CST)
> -#define atomic_xor_fetch(ptr, n) __atomic_xor_fetch(ptr, n, __ATOMIC_SEQ_CST)
> +#define qatomic_inc_fetch(ptr)    __atomic_add_fetch(ptr, 1, __ATOMIC_SEQ_CST)
> +#define qatomic_dec_fetch(ptr)    __atomic_sub_fetch(ptr, 1, __ATOMIC_SEQ_CST)
> +#define qatomic_add_fetch(ptr, n) __atomic_add_fetch(ptr, n, __ATOMIC_SEQ_CST)
> +#define qatomic_sub_fetch(ptr, n) __atomic_sub_fetch(ptr, n, __ATOMIC_SEQ_CST)
> +#define qatomic_and_fetch(ptr, n) __atomic_and_fetch(ptr, n, __ATOMIC_SEQ_CST)
> +#define qatomic_or_fetch(ptr, n)  __atomic_or_fetch(ptr, n, __ATOMIC_SEQ_CST)
> +#define qatomic_xor_fetch(ptr, n) __atomic_xor_fetch(ptr, n, __ATOMIC_SEQ_CST)
>  
>  /* And even shorter names that return void.  */
> -#define atomic_inc(ptr)    ((void) __atomic_fetch_add(ptr, 1, __ATOMIC_SEQ_CST))
> -#define atomic_dec(ptr)    ((void) __atomic_fetch_sub(ptr, 1, __ATOMIC_SEQ_CST))
> -#define atomic_add(ptr, n) ((void) __atomic_fetch_add(ptr, n, __ATOMIC_SEQ_CST))
> -#define atomic_sub(ptr, n) ((void) __atomic_fetch_sub(ptr, n, __ATOMIC_SEQ_CST))
> -#define atomic_and(ptr, n) ((void) __atomic_fetch_and(ptr, n, __ATOMIC_SEQ_CST))
> -#define atomic_or(ptr, n)  ((void) __atomic_fetch_or(ptr, n, __ATOMIC_SEQ_CST))
> -#define atomic_xor(ptr, n) ((void) __atomic_fetch_xor(ptr, n, __ATOMIC_SEQ_CST))
> +#define qatomic_inc(ptr) \
> +    ((void) __atomic_fetch_add(ptr, 1, __ATOMIC_SEQ_CST))
> +#define qatomic_dec(ptr) \
> +    ((void) __atomic_fetch_sub(ptr, 1, __ATOMIC_SEQ_CST))
> +#define qatomic_add(ptr, n) \
> +    ((void) __atomic_fetch_add(ptr, n, __ATOMIC_SEQ_CST))
> +#define qatomic_sub(ptr, n) \
> +    ((void) __atomic_fetch_sub(ptr, n, __ATOMIC_SEQ_CST))
> +#define qatomic_and(ptr, n) \
> +    ((void) __atomic_fetch_and(ptr, n, __ATOMIC_SEQ_CST))
> +#define qatomic_or(ptr, n) \
> +    ((void) __atomic_fetch_or(ptr, n, __ATOMIC_SEQ_CST))
> +#define qatomic_xor(ptr, n) \
> +    ((void) __atomic_fetch_xor(ptr, n, __ATOMIC_SEQ_CST))
>  
>  #else /* __ATOMIC_RELAXED */
>  
> @@ -272,7 +277,7 @@
>   * but it is a full barrier at the hardware level.  Add a compiler barrier
>   * to make it a full barrier also at the compiler level.
>   */
> -#define atomic_xchg(ptr, i)    (barrier(), __sync_lock_test_and_set(ptr, i))
> +#define qatomic_xchg(ptr, i)    (barrier(), __sync_lock_test_and_set(ptr, i))
>  
>  #elif defined(_ARCH_PPC)
>  
> @@ -325,14 +330,14 @@
>  /* These will only be atomic if the processor does the fetch or store
>   * in a single issue memory operation
>   */
> -#define atomic_read__nocheck(p)   (*(__typeof__(*(p)) volatile*) (p))
> -#define atomic_set__nocheck(p, i) ((*(__typeof__(*(p)) volatile*) (p)) = (i))
> +#define qatomic_read__nocheck(p)   (*(__typeof__(*(p)) volatile*) (p))
> +#define qatomic_set__nocheck(p, i) ((*(__typeof__(*(p)) volatile*) (p)) = (i))
>  
> -#define atomic_read(ptr)       atomic_read__nocheck(ptr)
> -#define atomic_set(ptr, i)     atomic_set__nocheck(ptr,i)
> +#define qatomic_read(ptr)       qatomic_read__nocheck(ptr)
> +#define qatomic_set(ptr, i)     qatomic_set__nocheck(ptr,i)
>  
>  /**
> - * atomic_rcu_read - reads a RCU-protected pointer to a local variable
> + * qatomic_rcu_read - reads a RCU-protected pointer to a local variable
>   * into a RCU read-side critical section. The pointer can later be safely
>   * dereferenced within the critical section.
>   *
> @@ -342,21 +347,21 @@
>   * Inserts memory barriers on architectures that require them (currently only
>   * Alpha) and documents which pointers are protected by RCU.
>   *
> - * atomic_rcu_read also includes a compiler barrier to ensure that
> + * qatomic_rcu_read also includes a compiler barrier to ensure that
>   * value-speculative optimizations (e.g. VSS: Value Speculation
>   * Scheduling) does not perform the data read before the pointer read
>   * by speculating the value of the pointer.
>   *
> - * Should match atomic_rcu_set(), atomic_xchg(), atomic_cmpxchg().
> + * Should match qatomic_rcu_set(), qatomic_xchg(), qatomic_cmpxchg().
>   */
> -#define atomic_rcu_read(ptr)    ({                \
> -    typeof(*ptr) _val = atomic_read(ptr);         \
> +#define qatomic_rcu_read(ptr)    ({               \
> +    typeof(*ptr) _val = qatomic_read(ptr);        \
>      smp_read_barrier_depends();                   \
>      _val;                                         \
>  })
>  
>  /**
> - * atomic_rcu_set - assigns (publicizes) a pointer to a new data structure
> + * qatomic_rcu_set - assigns (publicizes) a pointer to a new data structure
>   * meant to be read by RCU read-side critical sections.
>   *
>   * Documents which pointers will be dereferenced by RCU read-side critical
> @@ -364,65 +369,64 @@
>   * them. It also makes sure the compiler does not reorder code initializing the
>   * data structure before its publication.
>   *
> - * Should match atomic_rcu_read().
> + * Should match qatomic_rcu_read().
>   */
> -#define atomic_rcu_set(ptr, i)  do {              \
> +#define qatomic_rcu_set(ptr, i)  do {             \
>      smp_wmb();                                    \
> -    atomic_set(ptr, i);                           \
> +    qatomic_set(ptr, i);                          \
>  } while (0)
>  
> -#define atomic_load_acquire(ptr)    ({      \
> -    typeof(*ptr) _val = atomic_read(ptr);   \
> +#define qatomic_load_acquire(ptr)    ({     \
> +    typeof(*ptr) _val = qatomic_read(ptr);  \
>      smp_mb_acquire();                       \
>      _val;                                   \
>  })
>  
> -#define atomic_store_release(ptr, i)  do {  \
> +#define qatomic_store_release(ptr, i)  do { \
>      smp_mb_release();                       \
> -    atomic_set(ptr, i);                     \
> +    qatomic_set(ptr, i);                    \
>  } while (0)
>  
> -#ifndef atomic_xchg
> +#ifndef qatomic_xchg
>  #if defined(__clang__)
> -#define atomic_xchg(ptr, i)    __sync_swap(ptr, i)
> +#define qatomic_xchg(ptr, i)    __sync_swap(ptr, i)
>  #else
>  /* __sync_lock_test_and_set() is documented to be an acquire barrier only.  */
> -#define atomic_xchg(ptr, i)    (smp_mb(), __sync_lock_test_and_set(ptr, i))
> +#define qatomic_xchg(ptr, i)    (smp_mb(), __sync_lock_test_and_set(ptr, i))
>  #endif
>  #endif
> -#define atomic_xchg__nocheck  atomic_xchg
> +#define qatomic_xchg__nocheck  qatomic_xchg
>  
>  /* Provide shorter names for GCC atomic builtins.  */
> -#define atomic_fetch_inc(ptr)  __sync_fetch_and_add(ptr, 1)
> -#define atomic_fetch_dec(ptr)  __sync_fetch_and_add(ptr, -1)
> +#define qatomic_fetch_inc(ptr)  __sync_fetch_and_add(ptr, 1)
> +#define qatomic_fetch_dec(ptr)  __sync_fetch_and_add(ptr, -1)
>  
> -#ifndef atomic_fetch_add
> -#define atomic_fetch_add(ptr, n) __sync_fetch_and_add(ptr, n)
> -#define atomic_fetch_sub(ptr, n) __sync_fetch_and_sub(ptr, n)
> -#define atomic_fetch_and(ptr, n) __sync_fetch_and_and(ptr, n)
> -#define atomic_fetch_or(ptr, n) __sync_fetch_and_or(ptr, n)
> -#define atomic_fetch_xor(ptr, n) __sync_fetch_and_xor(ptr, n)
> -#endif
> +#define qatomic_fetch_add(ptr, n) __sync_fetch_and_add(ptr, n)
> +#define qatomic_fetch_sub(ptr, n) __sync_fetch_and_sub(ptr, n)
> +#define qatomic_fetch_and(ptr, n) __sync_fetch_and_and(ptr, n)
> +#define qatomic_fetch_or(ptr, n) __sync_fetch_and_or(ptr, n)
> +#define qatomic_fetch_xor(ptr, n) __sync_fetch_and_xor(ptr, n)
>  
> -#define atomic_inc_fetch(ptr)  __sync_add_and_fetch(ptr, 1)
> -#define atomic_dec_fetch(ptr)  __sync_add_and_fetch(ptr, -1)
> -#define atomic_add_fetch(ptr, n) __sync_add_and_fetch(ptr, n)
> -#define atomic_sub_fetch(ptr, n) __sync_sub_and_fetch(ptr, n)
> -#define atomic_and_fetch(ptr, n) __sync_and_and_fetch(ptr, n)
> -#define atomic_or_fetch(ptr, n) __sync_or_and_fetch(ptr, n)
> -#define atomic_xor_fetch(ptr, n) __sync_xor_and_fetch(ptr, n)
> +#define qatomic_inc_fetch(ptr)  __sync_add_and_fetch(ptr, 1)
> +#define qatomic_dec_fetch(ptr)  __sync_add_and_fetch(ptr, -1)
> +#define qatomic_add_fetch(ptr, n) __sync_add_and_fetch(ptr, n)
> +#define qatomic_sub_fetch(ptr, n) __sync_sub_and_fetch(ptr, n)
> +#define qatomic_and_fetch(ptr, n) __sync_and_and_fetch(ptr, n)
> +#define qatomic_or_fetch(ptr, n) __sync_or_and_fetch(ptr, n)
> +#define qatomic_xor_fetch(ptr, n) __sync_xor_and_fetch(ptr, n)
>  
> -#define atomic_cmpxchg(ptr, old, new) __sync_val_compare_and_swap(ptr, old, new)
> -#define atomic_cmpxchg__nocheck(ptr, old, new)  atomic_cmpxchg(ptr, old, new)
> +#define qatomic_cmpxchg(ptr, old, new) \
> +    __sync_val_compare_and_swap(ptr, old, new)
> +#define qatomic_cmpxchg__nocheck(ptr, old, new)  qatomic_cmpxchg(ptr, old, new)
>  
>  /* And even shorter names that return void.  */
> -#define atomic_inc(ptr)        ((void) __sync_fetch_and_add(ptr, 1))
> -#define atomic_dec(ptr)        ((void) __sync_fetch_and_add(ptr, -1))
> -#define atomic_add(ptr, n)     ((void) __sync_fetch_and_add(ptr, n))
> -#define atomic_sub(ptr, n)     ((void) __sync_fetch_and_sub(ptr, n))
> -#define atomic_and(ptr, n)     ((void) __sync_fetch_and_and(ptr, n))
> -#define atomic_or(ptr, n)      ((void) __sync_fetch_and_or(ptr, n))
> -#define atomic_xor(ptr, n)     ((void) __sync_fetch_and_xor(ptr, n))
> +#define qatomic_inc(ptr)        ((void) __sync_fetch_and_add(ptr, 1))
> +#define qatomic_dec(ptr)        ((void) __sync_fetch_and_add(ptr, -1))
> +#define qatomic_add(ptr, n)     ((void) __sync_fetch_and_add(ptr, n))
> +#define qatomic_sub(ptr, n)     ((void) __sync_fetch_and_sub(ptr, n))
> +#define qatomic_and(ptr, n)     ((void) __sync_fetch_and_and(ptr, n))
> +#define qatomic_or(ptr, n)      ((void) __sync_fetch_and_or(ptr, n))
> +#define qatomic_xor(ptr, n)     ((void) __sync_fetch_and_xor(ptr, n))
>  
>  #endif /* __ATOMIC_RELAXED */
>  
> @@ -436,11 +440,11 @@
>  /* This is more efficient than a store plus a fence.  */
>  #if !defined(__SANITIZE_THREAD__)
>  #if defined(__i386__) || defined(__x86_64__) || defined(__s390x__)
> -#define atomic_mb_set(ptr, i)  ((void)atomic_xchg(ptr, i))
> +#define qatomic_mb_set(ptr, i)  ((void)qatomic_xchg(ptr, i))
>  #endif
>  #endif
>  
> -/* atomic_mb_read/set semantics map Java volatile variables. They are
> +/* qatomic_mb_read/set semantics map Java volatile variables. They are
>   * less expensive on some platforms (notably POWER) than fully
>   * sequentially consistent operations.
>   *
> @@ -448,58 +452,58 @@
>   * use. See docs/devel/atomics.txt for more discussion.
>   */
>  
> -#ifndef atomic_mb_read
> -#define atomic_mb_read(ptr)                             \
> -    atomic_load_acquire(ptr)
> +#ifndef qatomic_mb_read
> +#define qatomic_mb_read(ptr)                             \
> +    qatomic_load_acquire(ptr)
>  #endif
>  
> -#ifndef atomic_mb_set
> -#define atomic_mb_set(ptr, i)  do {                     \
> -    atomic_store_release(ptr, i);                       \
> +#ifndef qatomic_mb_set
> +#define qatomic_mb_set(ptr, i)  do {                    \
> +    qatomic_store_release(ptr, i);                      \
>      smp_mb();                                           \
>  } while(0)
>  #endif
>  
> -#define atomic_fetch_inc_nonzero(ptr) ({                                \
> -    typeof_strip_qual(*ptr) _oldn = atomic_read(ptr);                   \
> -    while (_oldn && atomic_cmpxchg(ptr, _oldn, _oldn + 1) != _oldn) {   \
> -        _oldn = atomic_read(ptr);                                       \
> +#define qatomic_fetch_inc_nonzero(ptr) ({                               \
> +    typeof_strip_qual(*ptr) _oldn = qatomic_read(ptr);                  \
> +    while (_oldn && qatomic_cmpxchg(ptr, _oldn, _oldn + 1) != _oldn) {  \
> +        _oldn = qatomic_read(ptr);                                      \
>      }                                                                   \
>      _oldn;                                                              \
>  })
>  
>  /* Abstractions to access atomically (i.e. "once") i64/u64 variables */
>  #ifdef CONFIG_ATOMIC64
> -static inline int64_t atomic_read_i64(const int64_t *ptr)
> +static inline int64_t qatomic_read_i64(const int64_t *ptr)
>  {
>      /* use __nocheck because sizeof(void *) might be < sizeof(u64) */
> -    return atomic_read__nocheck(ptr);
> +    return qatomic_read__nocheck(ptr);
>  }
>  
> -static inline uint64_t atomic_read_u64(const uint64_t *ptr)
> +static inline uint64_t qatomic_read_u64(const uint64_t *ptr)
>  {
> -    return atomic_read__nocheck(ptr);
> +    return qatomic_read__nocheck(ptr);
>  }
>  
> -static inline void atomic_set_i64(int64_t *ptr, int64_t val)
> +static inline void qatomic_set_i64(int64_t *ptr, int64_t val)
>  {
> -    atomic_set__nocheck(ptr, val);
> +    qatomic_set__nocheck(ptr, val);
>  }
>  
> -static inline void atomic_set_u64(uint64_t *ptr, uint64_t val)
> +static inline void qatomic_set_u64(uint64_t *ptr, uint64_t val)
>  {
> -    atomic_set__nocheck(ptr, val);
> +    qatomic_set__nocheck(ptr, val);
>  }
>  
> -static inline void atomic64_init(void)
> +static inline void qatomic64_init(void)
>  {
>  }
>  #else /* !CONFIG_ATOMIC64 */
> -int64_t  atomic_read_i64(const int64_t *ptr);
> -uint64_t atomic_read_u64(const uint64_t *ptr);
> -void atomic_set_i64(int64_t *ptr, int64_t val);
> -void atomic_set_u64(uint64_t *ptr, uint64_t val);
> -void atomic64_init(void);
> +int64_t  qatomic_read_i64(const int64_t *ptr);
> +uint64_t qatomic_read_u64(const uint64_t *ptr);
> +void qatomic_set_i64(int64_t *ptr, int64_t val);
> +void qatomic_set_u64(uint64_t *ptr, uint64_t val);
> +void qatomic64_init(void);
>  #endif /* !CONFIG_ATOMIC64 */
>  
>  #endif /* QEMU_ATOMIC_H */
> diff --git a/docs/devel/lockcnt.txt b/docs/devel/lockcnt.txt
> index 7c099bc6c8..2d85462fe3 100644
> --- a/docs/devel/lockcnt.txt
> +++ b/docs/devel/lockcnt.txt
> @@ -95,7 +95,7 @@ not just frees, though there could be cases where this is not necessary.
>  
>  Reads, instead, can be done without taking the mutex, as long as the
>  readers and writers use the same macros that are used for RCU, for
> -example atomic_rcu_read, atomic_rcu_set, QLIST_FOREACH_RCU, etc.  This is
> +example qatomic_rcu_read, qatomic_rcu_set, QLIST_FOREACH_RCU, etc.  This is
>  because the reads are done outside a lock and a set or QLIST_INSERT_HEAD
>  can happen concurrently with the read.  The RCU API ensures that the
>  processor and the compiler see all required memory barriers.
> @@ -189,7 +189,7 @@ qemu_lockcnt_lock and qemu_lockcnt_unlock:
>      if (!xyz) {
>          new_xyz = g_new(XYZ, 1);
>          ...
> -        atomic_rcu_set(&xyz, new_xyz);
> +        qatomic_rcu_set(&xyz, new_xyz);
>      }
>      qemu_lockcnt_unlock(&xyz_lockcnt);
>  
> @@ -198,7 +198,7 @@ qemu_lockcnt_dec:
>  
>      qemu_lockcnt_inc(&xyz_lockcnt);
>      if (xyz) {
> -        XYZ *p = atomic_rcu_read(&xyz);
> +        XYZ *p = qatomic_rcu_read(&xyz);
>          ...
>          /* Accesses can now be done through "p".  */
>      }
> @@ -222,7 +222,7 @@ the decrement, the locking and the check on count as follows:
>  
>      qemu_lockcnt_inc(&xyz_lockcnt);
>      if (xyz) {
> -        XYZ *p = atomic_rcu_read(&xyz);
> +        XYZ *p = qatomic_rcu_read(&xyz);
>          ...
>          /* Accesses can now be done through "p".  */
>      }
> diff --git a/docs/devel/rcu.txt b/docs/devel/rcu.txt
> index 0ce15ba198..cdf002edd8 100644
> --- a/docs/devel/rcu.txt
> +++ b/docs/devel/rcu.txt
> @@ -130,13 +130,13 @@ The core RCU API is small:
>  
>              g_free_rcu(&foo, rcu);
>  
> -     typeof(*p) atomic_rcu_read(p);
> +     typeof(*p) qatomic_rcu_read(p);
>  
> -        atomic_rcu_read() is similar to atomic_load_acquire(), but it makes
> +        qatomic_rcu_read() is similar to qatomic_load_acquire(), but it makes
>          some assumptions on the code that calls it.  This allows a more
>          optimized implementation.
>  
> -        atomic_rcu_read assumes that whenever a single RCU critical
> +        qatomic_rcu_read assumes that whenever a single RCU critical
>          section reads multiple shared data, these reads are either
>          data-dependent or need no ordering.  This is almost always the
>          case when using RCU, because read-side critical sections typically
> @@ -144,7 +144,7 @@ The core RCU API is small:
>          every update) until reaching a data structure of interest,
>          and then read from there.
>  
> -        RCU read-side critical sections must use atomic_rcu_read() to
> +        RCU read-side critical sections must use qatomic_rcu_read() to
>          read data, unless concurrent writes are prevented by another
>          synchronization mechanism.
>  
> @@ -152,18 +152,18 @@ The core RCU API is small:
>          data structure in a single direction, opposite to the direction
>          in which the updater initializes it.
>  
> -     void atomic_rcu_set(p, typeof(*p) v);
> +     void qatomic_rcu_set(p, typeof(*p) v);
>  
> -        atomic_rcu_set() is similar to atomic_store_release(), though it also
> +        qatomic_rcu_set() is similar to qatomic_store_release(), though it also
>          makes assumptions on the code that calls it in order to allow a more
>          optimized implementation.
>  
> -        In particular, atomic_rcu_set() suffices for synchronization
> +        In particular, qatomic_rcu_set() suffices for synchronization
>          with readers, if the updater never mutates a field within a
>          data item that is already accessible to readers.  This is the
>          case when initializing a new copy of the RCU-protected data
>          structure; just ensure that initialization of *p is carried out
> -        before atomic_rcu_set() makes the data item visible to readers.
> +        before qatomic_rcu_set() makes the data item visible to readers.
>          If this rule is observed, writes will happen in the opposite
>          order as reads in the RCU read-side critical sections (or if
>          there is just one update), and there will be no need for other
> @@ -212,7 +212,7 @@ DIFFERENCES WITH LINUX
>    programming; not allowing this would prevent upgrading an RCU read-side
>    critical section to become an updater.
>  
> -- atomic_rcu_read and atomic_rcu_set replace rcu_dereference and
> +- qatomic_rcu_read and qatomic_rcu_set replace rcu_dereference and
>    rcu_assign_pointer.  They take a _pointer_ to the variable being accessed.
>  
>  - call_rcu is a macro that has an extra argument (the name of the first
> @@ -257,7 +257,7 @@ may be used as a restricted reference-counting mechanism.  For example,
>  consider the following code fragment:
>  
>      rcu_read_lock();
> -    p = atomic_rcu_read(&foo);
> +    p = qatomic_rcu_read(&foo);
>      /* do something with p. */
>      rcu_read_unlock();
>  
> @@ -268,7 +268,7 @@ The write side looks simply like this (with appropriate locking):
>  
>      qemu_mutex_lock(&foo_mutex);
>      old = foo;
> -    atomic_rcu_set(&foo, new);
> +    qatomic_rcu_set(&foo, new);
>      qemu_mutex_unlock(&foo_mutex);
>      synchronize_rcu();
>      free(old);
> @@ -277,7 +277,7 @@ If the processing cannot be done purely within the critical section, it
>  is possible to combine this idiom with a "real" reference count:
>  
>      rcu_read_lock();
> -    p = atomic_rcu_read(&foo);
> +    p = qatomic_rcu_read(&foo);
>      foo_ref(p);
>      rcu_read_unlock();
>      /* do something with p. */
> @@ -287,7 +287,7 @@ The write side can be like this:
>  
>      qemu_mutex_lock(&foo_mutex);
>      old = foo;
> -    atomic_rcu_set(&foo, new);
> +    qatomic_rcu_set(&foo, new);
>      qemu_mutex_unlock(&foo_mutex);
>      synchronize_rcu();
>      foo_unref(old);
> @@ -296,7 +296,7 @@ or with call_rcu:
>  
>      qemu_mutex_lock(&foo_mutex);
>      old = foo;
> -    atomic_rcu_set(&foo, new);
> +    qatomic_rcu_set(&foo, new);
>      qemu_mutex_unlock(&foo_mutex);
>      call_rcu(foo_unref, old, rcu);
>  
> @@ -307,7 +307,7 @@ last reference may be dropped on the read side.  Hence you can
>  use call_rcu() instead:
>  
>       foo_unref(struct foo *p) {
> -        if (atomic_fetch_dec(&p->refcount) == 1) {
> +        if (qatomic_fetch_dec(&p->refcount) == 1) {
>              call_rcu(foo_destroy, p, rcu);
>          }
>      }
> @@ -375,7 +375,7 @@ Instead, we store the size of the array with the array itself:
>  
>      read side:
>          rcu_read_lock();
> -        struct arr *array = atomic_rcu_read(&global_array);
> +        struct arr *array = qatomic_rcu_read(&global_array);
>          x = i < array->size ? array->data[i] : -1;
>          rcu_read_unlock();
>          return x;
> @@ -392,7 +392,7 @@ Instead, we store the size of the array with the array itself:
>  
>              /* Removal phase.  */
>              old_array = global_array;
> -            atomic_rcu_set(&new_array->data, new_array);
> +            qatomic_rcu_set(&new_array->data, new_array);
>              synchronize_rcu();
>  
>              /* Reclamation phase.  */
> diff --git a/accel/tcg/atomic_template.h b/accel/tcg/atomic_template.h
> index 26969487d6..0ff7f913e1 100644
> --- a/accel/tcg/atomic_template.h
> +++ b/accel/tcg/atomic_template.h
> @@ -83,7 +83,7 @@ ABI_TYPE ATOMIC_NAME(cmpxchg)(CPUArchState *env, target_ulong addr,
>  #if DATA_SIZE == 16
>      ret = atomic16_cmpxchg(haddr, cmpv, newv);
>  #else
> -    ret = atomic_cmpxchg__nocheck(haddr, cmpv, newv);
> +    ret = qatomic_cmpxchg__nocheck(haddr, cmpv, newv);
>  #endif
>      ATOMIC_MMU_CLEANUP;
>      atomic_trace_rmw_post(env, addr, info);
> @@ -131,7 +131,7 @@ ABI_TYPE ATOMIC_NAME(xchg)(CPUArchState *env, target_ulong addr,
>                                           ATOMIC_MMU_IDX);
>  
>      atomic_trace_rmw_pre(env, addr, info);
> -    ret = atomic_xchg__nocheck(haddr, val);
> +    ret = qatomic_xchg__nocheck(haddr, val);
>      ATOMIC_MMU_CLEANUP;
>      atomic_trace_rmw_post(env, addr, info);
>      return ret;
> @@ -147,7 +147,7 @@ ABI_TYPE ATOMIC_NAME(X)(CPUArchState *env, target_ulong addr,       \
>      uint16_t info = trace_mem_build_info(SHIFT, false, 0, false,    \
>                                           ATOMIC_MMU_IDX);           \
>      atomic_trace_rmw_pre(env, addr, info);                          \
> -    ret = atomic_##X(haddr, val);                                   \
> +    ret = qatomic_##X(haddr, val);                                  \
>      ATOMIC_MMU_CLEANUP;                                             \
>      atomic_trace_rmw_post(env, addr, info);                         \
>      return ret;                                                     \
> @@ -182,10 +182,10 @@ ABI_TYPE ATOMIC_NAME(X)(CPUArchState *env, target_ulong addr,       \
>                                           ATOMIC_MMU_IDX);           \
>      atomic_trace_rmw_pre(env, addr, info);                          \
>      smp_mb();                                                       \
> -    cmp = atomic_read__nocheck(haddr);                              \
> +    cmp = qatomic_read__nocheck(haddr);                             \
>      do {                                                            \
>          old = cmp; new = FN(old, val);                              \
> -        cmp = atomic_cmpxchg__nocheck(haddr, old, new);             \
> +        cmp = qatomic_cmpxchg__nocheck(haddr, old, new);            \
>      } while (cmp != old);                                           \
>      ATOMIC_MMU_CLEANUP;                                             \
>      atomic_trace_rmw_post(env, addr, info);                         \
> @@ -230,7 +230,7 @@ ABI_TYPE ATOMIC_NAME(cmpxchg)(CPUArchState *env, target_ulong addr,
>  #if DATA_SIZE == 16
>      ret = atomic16_cmpxchg(haddr, BSWAP(cmpv), BSWAP(newv));
>  #else
> -    ret = atomic_cmpxchg__nocheck(haddr, BSWAP(cmpv), BSWAP(newv));
> +    ret = qatomic_cmpxchg__nocheck(haddr, BSWAP(cmpv), BSWAP(newv));
>  #endif
>      ATOMIC_MMU_CLEANUP;
>      atomic_trace_rmw_post(env, addr, info);
> @@ -280,7 +280,7 @@ ABI_TYPE ATOMIC_NAME(xchg)(CPUArchState *env, target_ulong addr,
>                                           ATOMIC_MMU_IDX);
>  
>      atomic_trace_rmw_pre(env, addr, info);
> -    ret = atomic_xchg__nocheck(haddr, BSWAP(val));
> +    ret = qatomic_xchg__nocheck(haddr, BSWAP(val));
>      ATOMIC_MMU_CLEANUP;
>      atomic_trace_rmw_post(env, addr, info);
>      return BSWAP(ret);
> @@ -296,7 +296,7 @@ ABI_TYPE ATOMIC_NAME(X)(CPUArchState *env, target_ulong addr,       \
>      uint16_t info = trace_mem_build_info(SHIFT, false, MO_BSWAP,    \
>                                           false, ATOMIC_MMU_IDX);    \
>      atomic_trace_rmw_pre(env, addr, info);                          \
> -    ret = atomic_##X(haddr, BSWAP(val));                            \
> +    ret = qatomic_##X(haddr, BSWAP(val));                           \
>      ATOMIC_MMU_CLEANUP;                                             \
>      atomic_trace_rmw_post(env, addr, info);                         \
>      return BSWAP(ret);                                              \
> @@ -329,10 +329,10 @@ ABI_TYPE ATOMIC_NAME(X)(CPUArchState *env, target_ulong addr,       \
>                                           false, ATOMIC_MMU_IDX);    \
>      atomic_trace_rmw_pre(env, addr, info);                          \
>      smp_mb();                                                       \
> -    ldn = atomic_read__nocheck(haddr);                              \
> +    ldn = qatomic_read__nocheck(haddr);                             \
>      do {                                                            \
>          ldo = ldn; old = BSWAP(ldo); new = FN(old, val);            \
> -        ldn = atomic_cmpxchg__nocheck(haddr, ldo, BSWAP(new));      \
> +        ldn = qatomic_cmpxchg__nocheck(haddr, ldo, BSWAP(new));     \
>      } while (ldo != ldn);                                           \
>      ATOMIC_MMU_CLEANUP;                                             \
>      atomic_trace_rmw_post(env, addr, info);                         \
> diff --git a/include/block/aio-wait.h b/include/block/aio-wait.h
> index 716d2639df..b39eefb38d 100644
> --- a/include/block/aio-wait.h
> +++ b/include/block/aio-wait.h
> @@ -80,7 +80,7 @@ extern AioWait global_aio_wait;
>      AioWait *wait_ = &global_aio_wait;                             \
>      AioContext *ctx_ = (ctx);                                      \
>      /* Increment wait_->num_waiters before evaluating cond. */     \
> -    atomic_inc(&wait_->num_waiters);                               \
> +    qatomic_inc(&wait_->num_waiters);                              \
>      if (ctx_ && in_aio_context_home_thread(ctx_)) {                \
>          while ((cond)) {                                           \
>              aio_poll(ctx_, true);                                  \
> @@ -100,7 +100,7 @@ extern AioWait global_aio_wait;
>              waited_ = true;                                        \
>          }                                                          \
>      }                                                              \
> -    atomic_dec(&wait_->num_waiters);                               \
> +    qatomic_dec(&wait_->num_waiters);                              \
>      waited_; })
>  
>  /**
> diff --git a/include/block/aio.h b/include/block/aio.h
> index b2f703fa3f..ec8c5af642 100644
> --- a/include/block/aio.h
> +++ b/include/block/aio.h
> @@ -595,7 +595,7 @@ int64_t aio_compute_timeout(AioContext *ctx);
>   */
>  static inline void aio_disable_external(AioContext *ctx)
>  {
> -    atomic_inc(&ctx->external_disable_cnt);
> +    qatomic_inc(&ctx->external_disable_cnt);
>  }
>  
>  /**
> @@ -608,7 +608,7 @@ static inline void aio_enable_external(AioContext *ctx)
>  {
>      int old;
>  
> -    old = atomic_fetch_dec(&ctx->external_disable_cnt);
> +    old = qatomic_fetch_dec(&ctx->external_disable_cnt);
>      assert(old > 0);
>      if (old == 1) {
>          /* Kick event loop so it re-arms file descriptors */
> @@ -624,7 +624,7 @@ static inline void aio_enable_external(AioContext *ctx)
>   */
>  static inline bool aio_external_disabled(AioContext *ctx)
>  {
> -    return atomic_read(&ctx->external_disable_cnt);
> +    return qatomic_read(&ctx->external_disable_cnt);
>  }
>  
>  /**
> @@ -637,7 +637,7 @@ static inline bool aio_external_disabled(AioContext *ctx)
>   */
>  static inline bool aio_node_check(AioContext *ctx, bool is_external)
>  {
> -    return !is_external || !atomic_read(&ctx->external_disable_cnt);
> +    return !is_external || !qatomic_read(&ctx->external_disable_cnt);
>  }
>  
>  /**
> diff --git a/include/exec/cpu_ldst.h b/include/exec/cpu_ldst.h
> index c14a48f65e..30605edab9 100644
> --- a/include/exec/cpu_ldst.h
> +++ b/include/exec/cpu_ldst.h
> @@ -299,7 +299,7 @@ static inline target_ulong tlb_addr_write(const CPUTLBEntry *entry)
>  #if TCG_OVERSIZED_GUEST
>      return entry->addr_write;
>  #else
> -    return atomic_read(&entry->addr_write);
> +    return qatomic_read(&entry->addr_write);
>  #endif
>  }
>  
> diff --git a/include/exec/exec-all.h b/include/exec/exec-all.h
> index 3cf88272df..1fe28d574f 100644
> --- a/include/exec/exec-all.h
> +++ b/include/exec/exec-all.h
> @@ -89,7 +89,7 @@ void QEMU_NORETURN cpu_loop_exit_atomic(CPUState *cpu, uintptr_t pc);
>   */
>  static inline bool cpu_loop_exit_requested(CPUState *cpu)
>  {
> -    return (int32_t)atomic_read(&cpu_neg(cpu)->icount_decr.u32) < 0;
> +    return (int32_t)qatomic_read(&cpu_neg(cpu)->icount_decr.u32) < 0;
>  }
>  
>  #if !defined(CONFIG_USER_ONLY)
> @@ -487,10 +487,10 @@ struct TranslationBlock {
>  
>  extern bool parallel_cpus;
>  
> -/* Hide the atomic_read to make code a little easier on the eyes */
> +/* Hide the qatomic_read to make code a little easier on the eyes */
>  static inline uint32_t tb_cflags(const TranslationBlock *tb)
>  {
> -    return atomic_read(&tb->cflags);
> +    return qatomic_read(&tb->cflags);
>  }
>  
>  /* current cflags for hashing/comparison */
> diff --git a/include/exec/log.h b/include/exec/log.h
> index 3ed797c1c8..86871f403a 100644
> --- a/include/exec/log.h
> +++ b/include/exec/log.h
> @@ -19,7 +19,7 @@ static inline void log_cpu_state(CPUState *cpu, int flags)
>  
>      if (qemu_log_enabled()) {
>          rcu_read_lock();
> -        logfile = atomic_rcu_read(&qemu_logfile);
> +        logfile = qatomic_rcu_read(&qemu_logfile);
>          if (logfile) {
>              cpu_dump_state(cpu, logfile->fd, flags);
>          }
> @@ -49,7 +49,7 @@ static inline void log_target_disas(CPUState *cpu, target_ulong start,
>  {
>      QemuLogFile *logfile;
>      rcu_read_lock();
> -    logfile = atomic_rcu_read(&qemu_logfile);
> +    logfile = qatomic_rcu_read(&qemu_logfile);
>      if (logfile) {
>          target_disas(logfile->fd, cpu, start, len);
>      }
> @@ -60,7 +60,7 @@ static inline void log_disas(void *code, unsigned long size, const char *note)
>  {
>      QemuLogFile *logfile;
>      rcu_read_lock();
> -    logfile = atomic_rcu_read(&qemu_logfile);
> +    logfile = qatomic_rcu_read(&qemu_logfile);
>      if (logfile) {
>          disas(logfile->fd, code, size, note);
>      }
> diff --git a/include/exec/memory.h b/include/exec/memory.h
> index f1bb2a7df5..06b85e3a73 100644
> --- a/include/exec/memory.h
> +++ b/include/exec/memory.h
> @@ -685,7 +685,7 @@ struct FlatView {
>  
>  static inline FlatView *address_space_to_flatview(AddressSpace *as)
>  {
> -    return atomic_rcu_read(&as->current_map);
> +    return qatomic_rcu_read(&as->current_map);
>  }
>  
>  
> diff --git a/include/exec/ram_addr.h b/include/exec/ram_addr.h
> index 3ef729a23c..c6d2ef1d07 100644
> --- a/include/exec/ram_addr.h
> +++ b/include/exec/ram_addr.h
> @@ -164,7 +164,7 @@ static inline bool cpu_physical_memory_get_dirty(ram_addr_t start,
>      page = start >> TARGET_PAGE_BITS;
>  
>      WITH_RCU_READ_LOCK_GUARD() {
> -        blocks = atomic_rcu_read(&ram_list.dirty_memory[client]);
> +        blocks = qatomic_rcu_read(&ram_list.dirty_memory[client]);
>  
>          idx = page / DIRTY_MEMORY_BLOCK_SIZE;
>          offset = page % DIRTY_MEMORY_BLOCK_SIZE;
> @@ -205,7 +205,7 @@ static inline bool cpu_physical_memory_all_dirty(ram_addr_t start,
>  
>      RCU_READ_LOCK_GUARD();
>  
> -    blocks = atomic_rcu_read(&ram_list.dirty_memory[client]);
> +    blocks = qatomic_rcu_read(&ram_list.dirty_memory[client]);
>  
>      idx = page / DIRTY_MEMORY_BLOCK_SIZE;
>      offset = page % DIRTY_MEMORY_BLOCK_SIZE;
> @@ -278,7 +278,7 @@ static inline void cpu_physical_memory_set_dirty_flag(ram_addr_t addr,
>  
>      RCU_READ_LOCK_GUARD();
>  
> -    blocks = atomic_rcu_read(&ram_list.dirty_memory[client]);
> +    blocks = qatomic_rcu_read(&ram_list.dirty_memory[client]);
>  
>      set_bit_atomic(offset, blocks->blocks[idx]);
>  }
> @@ -301,7 +301,7 @@ static inline void cpu_physical_memory_set_dirty_range(ram_addr_t start,
>  
>      WITH_RCU_READ_LOCK_GUARD() {
>          for (i = 0; i < DIRTY_MEMORY_NUM; i++) {
> -            blocks[i] = atomic_rcu_read(&ram_list.dirty_memory[i]);
> +            blocks[i] = qatomic_rcu_read(&ram_list.dirty_memory[i]);
>          }
>  
>          idx = page / DIRTY_MEMORY_BLOCK_SIZE;
> @@ -361,23 +361,25 @@ static inline void cpu_physical_memory_set_dirty_lebitmap(unsigned long *bitmap,
>  
>          WITH_RCU_READ_LOCK_GUARD() {
>              for (i = 0; i < DIRTY_MEMORY_NUM; i++) {
> -                blocks[i] = atomic_rcu_read(&ram_list.dirty_memory[i])->blocks;
> +                blocks[i] =
> +                    qatomic_rcu_read(&ram_list.dirty_memory[i])->blocks;
>              }
>  
>              for (k = 0; k < nr; k++) {
>                  if (bitmap[k]) {
>                      unsigned long temp = leul_to_cpu(bitmap[k]);
>  
> -                    atomic_or(&blocks[DIRTY_MEMORY_VGA][idx][offset], temp);
> +                    qatomic_or(&blocks[DIRTY_MEMORY_VGA][idx][offset], temp);
>  
>                      if (global_dirty_log) {
> -                        atomic_or(&blocks[DIRTY_MEMORY_MIGRATION][idx][offset],
> -                                  temp);
> +                        qatomic_or(
> +                                &blocks[DIRTY_MEMORY_MIGRATION][idx][offset],
> +                                temp);
>                      }
>  
>                      if (tcg_enabled()) {
> -                        atomic_or(&blocks[DIRTY_MEMORY_CODE][idx][offset],
> -                                  temp);
> +                        qatomic_or(&blocks[DIRTY_MEMORY_CODE][idx][offset],
> +                                   temp);
>                      }
>                  }
>  
> @@ -461,12 +463,12 @@ uint64_t cpu_physical_memory_sync_dirty_bitmap(RAMBlock *rb,
>                                          DIRTY_MEMORY_BLOCK_SIZE);
>          unsigned long page = BIT_WORD(start >> TARGET_PAGE_BITS);
>  
> -        src = atomic_rcu_read(
> +        src = qatomic_rcu_read(
>                  &ram_list.dirty_memory[DIRTY_MEMORY_MIGRATION])->blocks;
>  
>          for (k = page; k < page + nr; k++) {
>              if (src[idx][offset]) {
> -                unsigned long bits = atomic_xchg(&src[idx][offset], 0);
> +                unsigned long bits = qatomic_xchg(&src[idx][offset], 0);
>                  unsigned long new_dirty;
>                  new_dirty = ~dest[k];
>                  dest[k] |= bits;
> diff --git a/include/exec/ramlist.h b/include/exec/ramlist.h
> index bc4faa1b00..26704aa3b0 100644
> --- a/include/exec/ramlist.h
> +++ b/include/exec/ramlist.h
> @@ -19,7 +19,7 @@ typedef struct RAMBlockNotifier RAMBlockNotifier;
>   *   rcu_read_lock();
>   *
>   *   DirtyMemoryBlocks *blocks =
> - *       atomic_rcu_read(&ram_list.dirty_memory[DIRTY_MEMORY_MIGRATION]);
> + *       qatomic_rcu_read(&ram_list.dirty_memory[DIRTY_MEMORY_MIGRATION]);
>   *
>   *   ram_addr_t idx = (addr >> TARGET_PAGE_BITS) / DIRTY_MEMORY_BLOCK_SIZE;
>   *   unsigned long *block = blocks.blocks[idx];
> diff --git a/include/exec/tb-lookup.h b/include/exec/tb-lookup.h
> index 26921b6daf..9cf475bb03 100644
> --- a/include/exec/tb-lookup.h
> +++ b/include/exec/tb-lookup.h
> @@ -27,7 +27,7 @@ tb_lookup__cpu_state(CPUState *cpu, target_ulong *pc, target_ulong *cs_base,
>  
>      cpu_get_tb_cpu_state(env, pc, cs_base, flags);
>      hash = tb_jmp_cache_hash_func(*pc);
> -    tb = atomic_rcu_read(&cpu->tb_jmp_cache[hash]);
> +    tb = qatomic_rcu_read(&cpu->tb_jmp_cache[hash]);
>  
>      cf_mask &= ~CF_CLUSTER_MASK;
>      cf_mask |= cpu->cluster_index << CF_CLUSTER_SHIFT;
> @@ -44,7 +44,7 @@ tb_lookup__cpu_state(CPUState *cpu, target_ulong *pc, target_ulong *cs_base,
>      if (tb == NULL) {
>          return NULL;
>      }
> -    atomic_set(&cpu->tb_jmp_cache[hash], tb);
> +    qatomic_set(&cpu->tb_jmp_cache[hash], tb);
>      return tb;
>  }
>  
> diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
> index 99dc33ffeb..6c34798c8b 100644
> --- a/include/hw/core/cpu.h
> +++ b/include/hw/core/cpu.h
> @@ -482,7 +482,7 @@ static inline void cpu_tb_jmp_cache_clear(CPUState *cpu)
>      unsigned int i;
>  
>      for (i = 0; i < TB_JMP_CACHE_SIZE; i++) {
> -        atomic_set(&cpu->tb_jmp_cache[i], NULL);
> +        qatomic_set(&cpu->tb_jmp_cache[i], NULL);
>      }
>  }
>  
> diff --git a/include/qemu/atomic128.h b/include/qemu/atomic128.h
> index 6b34484e15..ad2bcf45b4 100644
> --- a/include/qemu/atomic128.h
> +++ b/include/qemu/atomic128.h
> @@ -44,7 +44,7 @@
>  #if defined(CONFIG_ATOMIC128)
>  static inline Int128 atomic16_cmpxchg(Int128 *ptr, Int128 cmp, Int128 new)
>  {
> -    return atomic_cmpxchg__nocheck(ptr, cmp, new);
> +    return qatomic_cmpxchg__nocheck(ptr, cmp, new);
>  }
>  # define HAVE_CMPXCHG128 1
>  #elif defined(CONFIG_CMPXCHG128)
> @@ -89,12 +89,12 @@ Int128 QEMU_ERROR("unsupported atomic")
>  #if defined(CONFIG_ATOMIC128)
>  static inline Int128 atomic16_read(Int128 *ptr)
>  {
> -    return atomic_read__nocheck(ptr);
> +    return qatomic_read__nocheck(ptr);
>  }
>  
>  static inline void atomic16_set(Int128 *ptr, Int128 val)
>  {
> -    atomic_set__nocheck(ptr, val);
> +    qatomic_set__nocheck(ptr, val);
>  }
>  
>  # define HAVE_ATOMIC128 1
> diff --git a/include/qemu/bitops.h b/include/qemu/bitops.h
> index f55ce8b320..3acbf3384c 100644
> --- a/include/qemu/bitops.h
> +++ b/include/qemu/bitops.h
> @@ -51,7 +51,7 @@ static inline void set_bit_atomic(long nr, unsigned long *addr)
>      unsigned long mask = BIT_MASK(nr);
>      unsigned long *p = addr + BIT_WORD(nr);
>  
> -    atomic_or(p, mask);
> +    qatomic_or(p, mask);
>  }
>  
>  /**
> diff --git a/include/qemu/coroutine.h b/include/qemu/coroutine.h
> index dfd261c5b1..84eab6e3bf 100644
> --- a/include/qemu/coroutine.h
> +++ b/include/qemu/coroutine.h
> @@ -179,7 +179,7 @@ static inline coroutine_fn void qemu_co_mutex_assert_locked(CoMutex *mutex)
>       * because the condition will be false no matter whether we read NULL or
>       * the pointer for any other coroutine.
>       */
> -    assert(atomic_read(&mutex->locked) &&
> +    assert(qatomic_read(&mutex->locked) &&
>             mutex->holder == qemu_coroutine_self());
>  }
>  
> diff --git a/include/qemu/log.h b/include/qemu/log.h
> index f4724f7330..9b80660207 100644
> --- a/include/qemu/log.h
> +++ b/include/qemu/log.h
> @@ -36,7 +36,7 @@ static inline bool qemu_log_separate(void)
>      bool res = false;
>  
>      rcu_read_lock();
> -    logfile = atomic_rcu_read(&qemu_logfile);
> +    logfile = qatomic_rcu_read(&qemu_logfile);
>      if (logfile && logfile->fd != stderr) {
>          res = true;
>      }
> @@ -75,7 +75,7 @@ static inline FILE *qemu_log_lock(void)
>  {
>      QemuLogFile *logfile;
>      rcu_read_lock();
> -    logfile = atomic_rcu_read(&qemu_logfile);
> +    logfile = qatomic_rcu_read(&qemu_logfile);
>      if (logfile) {
>          qemu_flockfile(logfile->fd);
>          return logfile->fd;
> @@ -102,7 +102,7 @@ qemu_log_vprintf(const char *fmt, va_list va)
>      QemuLogFile *logfile;
>  
>      rcu_read_lock();
> -    logfile = atomic_rcu_read(&qemu_logfile);
> +    logfile = qatomic_rcu_read(&qemu_logfile);
>      if (logfile) {
>          vfprintf(logfile->fd, fmt, va);
>      }
> diff --git a/include/qemu/queue.h b/include/qemu/queue.h
> index 456a5b01ee..e029e7bf66 100644
> --- a/include/qemu/queue.h
> +++ b/include/qemu/queue.h
> @@ -218,12 +218,12 @@ struct {                                                                \
>          typeof(elm) save_sle_next;                                           \
>          do {                                                                 \
>              save_sle_next = (elm)->field.sle_next = (head)->slh_first;       \
> -        } while (atomic_cmpxchg(&(head)->slh_first, save_sle_next, (elm)) != \
> +        } while (qatomic_cmpxchg(&(head)->slh_first, save_sle_next, (elm)) !=\
>                   save_sle_next);                                             \
>  } while (/*CONSTCOND*/0)
>  
>  #define QSLIST_MOVE_ATOMIC(dest, src) do {                               \
> -        (dest)->slh_first = atomic_xchg(&(src)->slh_first, NULL);        \
> +        (dest)->slh_first = qatomic_xchg(&(src)->slh_first, NULL);       \
>  } while (/*CONSTCOND*/0)
>  
>  #define QSLIST_REMOVE_HEAD(head, field) do {                             \
> @@ -376,7 +376,8 @@ struct {                                                                \
>  /*
>   * Simple queue access methods.
>   */
> -#define QSIMPLEQ_EMPTY_ATOMIC(head) (atomic_read(&((head)->sqh_first)) == NULL)
> +#define QSIMPLEQ_EMPTY_ATOMIC(head) \
> +    (qatomic_read(&((head)->sqh_first)) == NULL)
>  #define QSIMPLEQ_EMPTY(head)        ((head)->sqh_first == NULL)
>  #define QSIMPLEQ_FIRST(head)        ((head)->sqh_first)
>  #define QSIMPLEQ_NEXT(elm, field)   ((elm)->field.sqe_next)
> diff --git a/include/qemu/rcu.h b/include/qemu/rcu.h
> index 0e375ebe13..515d327cf1 100644
> --- a/include/qemu/rcu.h
> +++ b/include/qemu/rcu.h
> @@ -79,8 +79,8 @@ static inline void rcu_read_lock(void)
>          return;
>      }
>  
> -    ctr = atomic_read(&rcu_gp_ctr);
> -    atomic_set(&p_rcu_reader->ctr, ctr);
> +    ctr = qatomic_read(&rcu_gp_ctr);
> +    qatomic_set(&p_rcu_reader->ctr, ctr);
>  
>      /* Write p_rcu_reader->ctr before reading RCU-protected pointers.  */
>      smp_mb_placeholder();
> @@ -100,12 +100,12 @@ static inline void rcu_read_unlock(void)
>       * smp_mb_placeholder(), this ensures writes to p_rcu_reader->ctr
>       * are sequentially consistent.
>       */
> -    atomic_store_release(&p_rcu_reader->ctr, 0);
> +    qatomic_store_release(&p_rcu_reader->ctr, 0);
>  
>      /* Write p_rcu_reader->ctr before reading p_rcu_reader->waiting.  */
>      smp_mb_placeholder();
> -    if (unlikely(atomic_read(&p_rcu_reader->waiting))) {
> -        atomic_set(&p_rcu_reader->waiting, false);
> +    if (unlikely(qatomic_read(&p_rcu_reader->waiting))) {
> +        qatomic_set(&p_rcu_reader->waiting, false);
>          qemu_event_set(&rcu_gp_event);
>      }
>  }
> diff --git a/include/qemu/rcu_queue.h b/include/qemu/rcu_queue.h
> index 558961cc27..0e53ddd530 100644
> --- a/include/qemu/rcu_queue.h
> +++ b/include/qemu/rcu_queue.h
> @@ -36,9 +36,9 @@ extern "C" {
>  /*
>   * List access methods.
>   */
> -#define QLIST_EMPTY_RCU(head) (atomic_read(&(head)->lh_first) == NULL)
> -#define QLIST_FIRST_RCU(head) (atomic_rcu_read(&(head)->lh_first))
> -#define QLIST_NEXT_RCU(elm, field) (atomic_rcu_read(&(elm)->field.le_next))
> +#define QLIST_EMPTY_RCU(head) (qatomic_read(&(head)->lh_first) == NULL)
> +#define QLIST_FIRST_RCU(head) (qatomic_rcu_read(&(head)->lh_first))
> +#define QLIST_NEXT_RCU(elm, field) (qatomic_rcu_read(&(elm)->field.le_next))
>  
>  /*
>   * List functions.
> @@ -46,7 +46,7 @@ extern "C" {
>  
>  
>  /*
> - *  The difference between atomic_read/set and atomic_rcu_read/set
> + *  The difference between qatomic_read/set and qatomic_rcu_read/set
>   *  is in the including of a read/write memory barrier to the volatile
>   *  access. atomic_rcu_* macros include the memory barrier, the
>   *  plain atomic macros do not. Therefore, it should be correct to
> @@ -66,7 +66,7 @@ extern "C" {
>  #define QLIST_INSERT_AFTER_RCU(listelm, elm, field) do {    \
>      (elm)->field.le_next = (listelm)->field.le_next;        \
>      (elm)->field.le_prev = &(listelm)->field.le_next;       \
> -    atomic_rcu_set(&(listelm)->field.le_next, (elm));       \
> +    qatomic_rcu_set(&(listelm)->field.le_next, (elm));      \
>      if ((elm)->field.le_next != NULL) {                     \
>         (elm)->field.le_next->field.le_prev =                \
>          &(elm)->field.le_next;                              \
> @@ -82,7 +82,7 @@ extern "C" {
>  #define QLIST_INSERT_BEFORE_RCU(listelm, elm, field) do {   \
>      (elm)->field.le_prev = (listelm)->field.le_prev;        \
>      (elm)->field.le_next = (listelm);                       \
> -    atomic_rcu_set((listelm)->field.le_prev, (elm));        \
> +    qatomic_rcu_set((listelm)->field.le_prev, (elm));       \
>      (listelm)->field.le_prev = &(elm)->field.le_next;       \
>  } while (/*CONSTCOND*/0)
>  
> @@ -95,7 +95,7 @@ extern "C" {
>  #define QLIST_INSERT_HEAD_RCU(head, elm, field) do {    \
>      (elm)->field.le_prev = &(head)->lh_first;           \
>      (elm)->field.le_next = (head)->lh_first;            \
> -    atomic_rcu_set((&(head)->lh_first), (elm));         \
> +    qatomic_rcu_set((&(head)->lh_first), (elm));        \
>      if ((elm)->field.le_next != NULL) {                 \
>         (elm)->field.le_next->field.le_prev =            \
>          &(elm)->field.le_next;                          \
> @@ -112,20 +112,20 @@ extern "C" {
>         (elm)->field.le_next->field.le_prev =        \
>          (elm)->field.le_prev;                       \
>      }                                               \
> -    atomic_set((elm)->field.le_prev, (elm)->field.le_next); \
> +    qatomic_set((elm)->field.le_prev, (elm)->field.le_next); \
>  } while (/*CONSTCOND*/0)
>  
>  /* List traversal must occur within an RCU critical section.  */
>  #define QLIST_FOREACH_RCU(var, head, field)                 \
> -        for ((var) = atomic_rcu_read(&(head)->lh_first);    \
> +        for ((var) = qatomic_rcu_read(&(head)->lh_first);   \
>                  (var);                                      \
> -                (var) = atomic_rcu_read(&(var)->field.le_next))
> +                (var) = qatomic_rcu_read(&(var)->field.le_next))
>  
>  /* List traversal must occur within an RCU critical section.  */
>  #define QLIST_FOREACH_SAFE_RCU(var, head, field, next_var)           \
> -    for ((var) = (atomic_rcu_read(&(head)->lh_first));               \
> +    for ((var) = (qatomic_rcu_read(&(head)->lh_first));              \
>        (var) &&                                                       \
> -          ((next_var) = atomic_rcu_read(&(var)->field.le_next), 1);  \
> +          ((next_var) = qatomic_rcu_read(&(var)->field.le_next), 1); \
>             (var) = (next_var))
>  
>  /*
> @@ -133,9 +133,10 @@ extern "C" {
>   */
>  
>  /* Simple queue access methods */
> -#define QSIMPLEQ_EMPTY_RCU(head)      (atomic_read(&(head)->sqh_first) == NULL)
> -#define QSIMPLEQ_FIRST_RCU(head)       atomic_rcu_read(&(head)->sqh_first)
> -#define QSIMPLEQ_NEXT_RCU(elm, field)  atomic_rcu_read(&(elm)->field.sqe_next)
> +#define QSIMPLEQ_EMPTY_RCU(head) \
> +    (qatomic_read(&(head)->sqh_first) == NULL)
> +#define QSIMPLEQ_FIRST_RCU(head)       qatomic_rcu_read(&(head)->sqh_first)
> +#define QSIMPLEQ_NEXT_RCU(elm, field)  qatomic_rcu_read(&(elm)->field.sqe_next)
>  
>  /* Simple queue functions */
>  #define QSIMPLEQ_INSERT_HEAD_RCU(head, elm, field) do {         \
> @@ -143,12 +144,12 @@ extern "C" {
>      if ((elm)->field.sqe_next == NULL) {                        \
>          (head)->sqh_last = &(elm)->field.sqe_next;              \
>      }                                                           \
> -    atomic_rcu_set(&(head)->sqh_first, (elm));                  \
> +    qatomic_rcu_set(&(head)->sqh_first, (elm));                 \
>  } while (/*CONSTCOND*/0)
>  
>  #define QSIMPLEQ_INSERT_TAIL_RCU(head, elm, field) do {    \
>      (elm)->field.sqe_next = NULL;                          \
> -    atomic_rcu_set((head)->sqh_last, (elm));               \
> +    qatomic_rcu_set((head)->sqh_last, (elm));              \
>      (head)->sqh_last = &(elm)->field.sqe_next;             \
>  } while (/*CONSTCOND*/0)
>  
> @@ -157,11 +158,11 @@ extern "C" {
>      if ((elm)->field.sqe_next == NULL) {                                \
>          (head)->sqh_last = &(elm)->field.sqe_next;                      \
>      }                                                                   \
> -    atomic_rcu_set(&(listelm)->field.sqe_next, (elm));                  \
> +    qatomic_rcu_set(&(listelm)->field.sqe_next, (elm));                 \
>  } while (/*CONSTCOND*/0)
>  
>  #define QSIMPLEQ_REMOVE_HEAD_RCU(head, field) do {                     \
> -    atomic_set(&(head)->sqh_first, (head)->sqh_first->field.sqe_next); \
> +    qatomic_set(&(head)->sqh_first, (head)->sqh_first->field.sqe_next);\
>      if ((head)->sqh_first == NULL) {                                   \
>          (head)->sqh_last = &(head)->sqh_first;                         \
>      }                                                                  \
> @@ -175,7 +176,7 @@ extern "C" {
>          while (curr->field.sqe_next != (elm)) {                     \
>              curr = curr->field.sqe_next;                            \
>          }                                                           \
> -        atomic_set(&curr->field.sqe_next,                           \
> +        qatomic_set(&curr->field.sqe_next,                          \
>                     curr->field.sqe_next->field.sqe_next);           \
>          if (curr->field.sqe_next == NULL) {                         \
>              (head)->sqh_last = &(curr)->field.sqe_next;             \
> @@ -184,13 +185,13 @@ extern "C" {
>  } while (/*CONSTCOND*/0)
>  
>  #define QSIMPLEQ_FOREACH_RCU(var, head, field)                          \
> -    for ((var) = atomic_rcu_read(&(head)->sqh_first);                   \
> +    for ((var) = qatomic_rcu_read(&(head)->sqh_first);                  \
>           (var);                                                         \
> -         (var) = atomic_rcu_read(&(var)->field.sqe_next))
> +         (var) = qatomic_rcu_read(&(var)->field.sqe_next))
>  
>  #define QSIMPLEQ_FOREACH_SAFE_RCU(var, head, field, next)                \
> -    for ((var) = atomic_rcu_read(&(head)->sqh_first);                    \
> -         (var) && ((next) = atomic_rcu_read(&(var)->field.sqe_next), 1); \
> +    for ((var) = qatomic_rcu_read(&(head)->sqh_first);                   \
> +         (var) && ((next) = qatomic_rcu_read(&(var)->field.sqe_next), 1);\
>           (var) = (next))
>  
>  /*
> @@ -198,9 +199,9 @@ extern "C" {
>   */
>  
>  /* Tail queue access methods */
> -#define QTAILQ_EMPTY_RCU(head)      (atomic_read(&(head)->tqh_first) == NULL)
> -#define QTAILQ_FIRST_RCU(head)       atomic_rcu_read(&(head)->tqh_first)
> -#define QTAILQ_NEXT_RCU(elm, field)  atomic_rcu_read(&(elm)->field.tqe_next)
> +#define QTAILQ_EMPTY_RCU(head)      (qatomic_read(&(head)->tqh_first) == NULL)
> +#define QTAILQ_FIRST_RCU(head)       qatomic_rcu_read(&(head)->tqh_first)
> +#define QTAILQ_NEXT_RCU(elm, field)  qatomic_rcu_read(&(elm)->field.tqe_next)
>  
>  /* Tail queue functions */
>  #define QTAILQ_INSERT_HEAD_RCU(head, elm, field) do {                   \
> @@ -211,14 +212,14 @@ extern "C" {
>      } else {                                                            \
>          (head)->tqh_circ.tql_prev = &(elm)->field.tqe_circ;             \
>      }                                                                   \
> -    atomic_rcu_set(&(head)->tqh_first, (elm));                          \
> +    qatomic_rcu_set(&(head)->tqh_first, (elm));                         \
>      (elm)->field.tqe_circ.tql_prev = &(head)->tqh_circ;                 \
>  } while (/*CONSTCOND*/0)
>  
>  #define QTAILQ_INSERT_TAIL_RCU(head, elm, field) do {                   \
>      (elm)->field.tqe_next = NULL;                                       \
>      (elm)->field.tqe_circ.tql_prev = (head)->tqh_circ.tql_prev;         \
> -    atomic_rcu_set(&(head)->tqh_circ.tql_prev->tql_next, (elm));        \
> +    qatomic_rcu_set(&(head)->tqh_circ.tql_prev->tql_next, (elm));       \
>      (head)->tqh_circ.tql_prev = &(elm)->field.tqe_circ;                 \
>  } while (/*CONSTCOND*/0)
>  
> @@ -230,14 +231,14 @@ extern "C" {
>      } else {                                                            \
>          (head)->tqh_circ.tql_prev = &(elm)->field.tqe_circ;             \
>      }                                                                   \
> -    atomic_rcu_set(&(listelm)->field.tqe_next, (elm));                  \
> +    qatomic_rcu_set(&(listelm)->field.tqe_next, (elm));                 \
>      (elm)->field.tqe_circ.tql_prev = &(listelm)->field.tqe_circ;        \
>  } while (/*CONSTCOND*/0)
>  
>  #define QTAILQ_INSERT_BEFORE_RCU(listelm, elm, field) do {                \
>      (elm)->field.tqe_circ.tql_prev = (listelm)->field.tqe_circ.tql_prev;  \
>      (elm)->field.tqe_next = (listelm);                                    \
> -    atomic_rcu_set(&(listelm)->field.tqe_circ.tql_prev->tql_next, (elm)); \
> +    qatomic_rcu_set(&(listelm)->field.tqe_circ.tql_prev->tql_next, (elm));\
>      (listelm)->field.tqe_circ.tql_prev = &(elm)->field.tqe_circ;          \
>  } while (/*CONSTCOND*/0)
>  
> @@ -248,18 +249,19 @@ extern "C" {
>      } else {                                                            \
>          (head)->tqh_circ.tql_prev = (elm)->field.tqe_circ.tql_prev;     \
>      }                                                                   \
> -    atomic_set(&(elm)->field.tqe_circ.tql_prev->tql_next, (elm)->field.tqe_next); \
> +    qatomic_set(&(elm)->field.tqe_circ.tql_prev->tql_next,              \
> +                (elm)->field.tqe_next);                                 \
>      (elm)->field.tqe_circ.tql_prev = NULL;                              \
>  } while (/*CONSTCOND*/0)
>  
>  #define QTAILQ_FOREACH_RCU(var, head, field)                            \
> -    for ((var) = atomic_rcu_read(&(head)->tqh_first);                   \
> +    for ((var) = qatomic_rcu_read(&(head)->tqh_first);                  \
>           (var);                                                         \
> -         (var) = atomic_rcu_read(&(var)->field.tqe_next))
> +         (var) = qatomic_rcu_read(&(var)->field.tqe_next))
>  
>  #define QTAILQ_FOREACH_SAFE_RCU(var, head, field, next)                  \
> -    for ((var) = atomic_rcu_read(&(head)->tqh_first);                    \
> -         (var) && ((next) = atomic_rcu_read(&(var)->field.tqe_next), 1); \
> +    for ((var) = qatomic_rcu_read(&(head)->tqh_first);                   \
> +         (var) && ((next) = qatomic_rcu_read(&(var)->field.tqe_next), 1);\
>           (var) = (next))
>  
>  /*
> @@ -267,23 +269,23 @@ extern "C" {
>   */
>  
>  /* Singly-linked list access methods */
> -#define QSLIST_EMPTY_RCU(head)      (atomic_read(&(head)->slh_first) == NULL)
> -#define QSLIST_FIRST_RCU(head)       atomic_rcu_read(&(head)->slh_first)
> -#define QSLIST_NEXT_RCU(elm, field)  atomic_rcu_read(&(elm)->field.sle_next)
> +#define QSLIST_EMPTY_RCU(head)      (qatomic_read(&(head)->slh_first) == NULL)
> +#define QSLIST_FIRST_RCU(head)       qatomic_rcu_read(&(head)->slh_first)
> +#define QSLIST_NEXT_RCU(elm, field)  qatomic_rcu_read(&(elm)->field.sle_next)
>  
>  /* Singly-linked list functions */
>  #define QSLIST_INSERT_HEAD_RCU(head, elm, field) do {           \
>      (elm)->field.sle_next = (head)->slh_first;                  \
> -    atomic_rcu_set(&(head)->slh_first, (elm));                  \
> +    qatomic_rcu_set(&(head)->slh_first, (elm));                 \
>  } while (/*CONSTCOND*/0)
>  
>  #define QSLIST_INSERT_AFTER_RCU(head, listelm, elm, field) do {         \
>      (elm)->field.sle_next = (listelm)->field.sle_next;                  \
> -    atomic_rcu_set(&(listelm)->field.sle_next, (elm));                  \
> +    qatomic_rcu_set(&(listelm)->field.sle_next, (elm));                 \
>  } while (/*CONSTCOND*/0)
>  
>  #define QSLIST_REMOVE_HEAD_RCU(head, field) do {                       \
> -    atomic_set(&(head)->slh_first, (head)->slh_first->field.sle_next); \
> +    qatomic_set(&(head)->slh_first, (head)->slh_first->field.sle_next);\
>  } while (/*CONSTCOND*/0)
>  
>  #define QSLIST_REMOVE_RCU(head, elm, type, field) do {              \
> @@ -294,19 +296,19 @@ extern "C" {
>          while (curr->field.sle_next != (elm)) {                     \
>              curr = curr->field.sle_next;                            \
>          }                                                           \
> -        atomic_set(&curr->field.sle_next,                           \
> +        qatomic_set(&curr->field.sle_next,                          \
>                     curr->field.sle_next->field.sle_next);           \
>      }                                                               \
>  } while (/*CONSTCOND*/0)
>  
>  #define QSLIST_FOREACH_RCU(var, head, field)                          \
> -    for ((var) = atomic_rcu_read(&(head)->slh_first);                   \
> -         (var);                                                         \
> -         (var) = atomic_rcu_read(&(var)->field.sle_next))
> +    for ((var) = qatomic_rcu_read(&(head)->slh_first);                \
> +         (var);                                                       \
> +         (var) = qatomic_rcu_read(&(var)->field.sle_next))
>  
> -#define QSLIST_FOREACH_SAFE_RCU(var, head, field, next)                \
> -    for ((var) = atomic_rcu_read(&(head)->slh_first);                    \
> -         (var) && ((next) = atomic_rcu_read(&(var)->field.sle_next), 1); \
> +#define QSLIST_FOREACH_SAFE_RCU(var, head, field, next)                   \
> +    for ((var) = qatomic_rcu_read(&(head)->slh_first);                    \
> +         (var) && ((next) = qatomic_rcu_read(&(var)->field.sle_next), 1); \
>           (var) = (next))
>  
>  #ifdef __cplusplus
> diff --git a/include/qemu/seqlock.h b/include/qemu/seqlock.h
> index 8b6b4ee4bb..ecb7d2c864 100644
> --- a/include/qemu/seqlock.h
> +++ b/include/qemu/seqlock.h
> @@ -32,7 +32,7 @@ static inline void seqlock_init(QemuSeqLock *sl)
>  /* Lock out other writers and update the count.  */
>  static inline void seqlock_write_begin(QemuSeqLock *sl)
>  {
> -    atomic_set(&sl->sequence, sl->sequence + 1);
> +    qatomic_set(&sl->sequence, sl->sequence + 1);
>  
>      /* Write sequence before updating other fields.  */
>      smp_wmb();
> @@ -43,7 +43,7 @@ static inline void seqlock_write_end(QemuSeqLock *sl)
>      /* Write other fields before finalizing sequence.  */
>      smp_wmb();
>  
> -    atomic_set(&sl->sequence, sl->sequence + 1);
> +    qatomic_set(&sl->sequence, sl->sequence + 1);
>  }
>  
>  /* Lock out other writers and update the count.  */
> @@ -68,7 +68,7 @@ static inline void seqlock_write_unlock_impl(QemuSeqLock *sl, QemuLockable *lock
>  static inline unsigned seqlock_read_begin(const QemuSeqLock *sl)
>  {
>      /* Always fail if a write is in progress.  */
> -    unsigned ret = atomic_read(&sl->sequence);
> +    unsigned ret = qatomic_read(&sl->sequence);
>  
>      /* Read sequence before reading other fields.  */
>      smp_rmb();
> @@ -79,7 +79,7 @@ static inline int seqlock_read_retry(const QemuSeqLock *sl, unsigned start)
>  {
>      /* Read other fields before reading final sequence.  */
>      smp_rmb();
> -    return unlikely(atomic_read(&sl->sequence) != start);
> +    return unlikely(qatomic_read(&sl->sequence) != start);
>  }
>  
>  #endif
> diff --git a/include/qemu/stats64.h b/include/qemu/stats64.h
> index 19a5ac4c56..fdd3d1b8f9 100644
> --- a/include/qemu/stats64.h
> +++ b/include/qemu/stats64.h
> @@ -37,27 +37,27 @@ static inline void stat64_init(Stat64 *s, uint64_t value)
>  
>  static inline uint64_t stat64_get(const Stat64 *s)
>  {
> -    return atomic_read__nocheck(&s->value);
> +    return qatomic_read__nocheck(&s->value);
>  }
>  
>  static inline void stat64_add(Stat64 *s, uint64_t value)
>  {
> -    atomic_add(&s->value, value);
> +    qatomic_add(&s->value, value);
>  }
>  
>  static inline void stat64_min(Stat64 *s, uint64_t value)
>  {
> -    uint64_t orig = atomic_read__nocheck(&s->value);
> +    uint64_t orig = qatomic_read__nocheck(&s->value);
>      while (orig > value) {
> -        orig = atomic_cmpxchg__nocheck(&s->value, orig, value);
> +        orig = qatomic_cmpxchg__nocheck(&s->value, orig, value);
>      }
>  }
>  
>  static inline void stat64_max(Stat64 *s, uint64_t value)
>  {
> -    uint64_t orig = atomic_read__nocheck(&s->value);
> +    uint64_t orig = qatomic_read__nocheck(&s->value);
>      while (orig < value) {
> -        orig = atomic_cmpxchg__nocheck(&s->value, orig, value);
> +        orig = qatomic_cmpxchg__nocheck(&s->value, orig, value);
>      }
>  }
>  #else
> @@ -79,7 +79,7 @@ static inline void stat64_add(Stat64 *s, uint64_t value)
>      low = (uint32_t) value;
>      if (!low) {
>          if (high) {
> -            atomic_add(&s->high, high);
> +            qatomic_add(&s->high, high);
>          }
>          return;
>      }
> @@ -101,7 +101,7 @@ static inline void stat64_add(Stat64 *s, uint64_t value)
>           * the high 32 bits, so it can race just fine with stat64_add32_carry
>           * and even stat64_get!
>           */
> -        old = atomic_cmpxchg(&s->low, orig, result);
> +        old = qatomic_cmpxchg(&s->low, orig, result);
>          if (orig == old) {
>              return;
>          }
> @@ -116,7 +116,7 @@ static inline void stat64_min(Stat64 *s, uint64_t value)
>      high = value >> 32;
>      low = (uint32_t) value;
>      do {
> -        orig_high = atomic_read(&s->high);
> +        orig_high = qatomic_read(&s->high);
>          if (orig_high < high) {
>              return;
>          }
> @@ -128,7 +128,7 @@ static inline void stat64_min(Stat64 *s, uint64_t value)
>               * the write barrier in stat64_min_slow.
>               */
>              smp_rmb();
> -            orig_low = atomic_read(&s->low);
> +            orig_low = qatomic_read(&s->low);
>              if (orig_low <= low) {
>                  return;
>              }
> @@ -138,7 +138,7 @@ static inline void stat64_min(Stat64 *s, uint64_t value)
>               * we may miss being lucky.
>               */
>              smp_rmb();
> -            orig_high = atomic_read(&s->high);
> +            orig_high = qatomic_read(&s->high);
>              if (orig_high < high) {
>                  return;
>              }
> @@ -156,7 +156,7 @@ static inline void stat64_max(Stat64 *s, uint64_t value)
>      high = value >> 32;
>      low = (uint32_t) value;
>      do {
> -        orig_high = atomic_read(&s->high);
> +        orig_high = qatomic_read(&s->high);
>          if (orig_high > high) {
>              return;
>          }
> @@ -168,7 +168,7 @@ static inline void stat64_max(Stat64 *s, uint64_t value)
>               * the write barrier in stat64_max_slow.
>               */
>              smp_rmb();
> -            orig_low = atomic_read(&s->low);
> +            orig_low = qatomic_read(&s->low);
>              if (orig_low >= low) {
>                  return;
>              }
> @@ -178,7 +178,7 @@ static inline void stat64_max(Stat64 *s, uint64_t value)
>               * we may miss being lucky.
>               */
>              smp_rmb();
> -            orig_high = atomic_read(&s->high);
> +            orig_high = qatomic_read(&s->high);
>              if (orig_high > high) {
>                  return;
>              }
> diff --git a/include/qemu/thread.h b/include/qemu/thread.h
> index 4baf4d1715..5435763184 100644
> --- a/include/qemu/thread.h
> +++ b/include/qemu/thread.h
> @@ -70,33 +70,33 @@ extern QemuCondTimedWaitFunc qemu_cond_timedwait_func;
>              qemu_cond_timedwait_impl(c, m, ms, __FILE__, __LINE__)
>  #else
>  #define qemu_mutex_lock(m) ({                                           \
> -            QemuMutexLockFunc _f = atomic_read(&qemu_mutex_lock_func);  \
> +            QemuMutexLockFunc _f = qatomic_read(&qemu_mutex_lock_func); \
>              _f(m, __FILE__, __LINE__);                                  \
>          })
>  
> -#define qemu_mutex_trylock(m) ({                                        \
> -            QemuMutexTrylockFunc _f = atomic_read(&qemu_mutex_trylock_func); \
> -            _f(m, __FILE__, __LINE__);                                  \
> +#define qemu_mutex_trylock(m) ({                                              \
> +            QemuMutexTrylockFunc _f = qatomic_read(&qemu_mutex_trylock_func); \
> +            _f(m, __FILE__, __LINE__);                                        \
>          })
>  
> -#define qemu_rec_mutex_lock(m) ({                                       \
> -            QemuRecMutexLockFunc _f = atomic_read(&qemu_rec_mutex_lock_func); \
> -            _f(m, __FILE__, __LINE__);                                  \
> +#define qemu_rec_mutex_lock(m) ({                                             \
> +            QemuRecMutexLockFunc _f = qatomic_read(&qemu_rec_mutex_lock_func);\
> +            _f(m, __FILE__, __LINE__);                                        \
>          })
>  
>  #define qemu_rec_mutex_trylock(m) ({                            \
>              QemuRecMutexTrylockFunc _f;                         \
> -            _f = atomic_read(&qemu_rec_mutex_trylock_func);     \
> +            _f = qatomic_read(&qemu_rec_mutex_trylock_func);    \
>              _f(m, __FILE__, __LINE__);                          \
>          })
>  
>  #define qemu_cond_wait(c, m) ({                                         \
> -            QemuCondWaitFunc _f = atomic_read(&qemu_cond_wait_func);    \
> +            QemuCondWaitFunc _f = qatomic_read(&qemu_cond_wait_func);   \
>              _f(c, m, __FILE__, __LINE__);                               \
>          })
>  
>  #define qemu_cond_timedwait(c, m, ms) ({                                       \
> -            QemuCondTimedWaitFunc _f = atomic_read(&qemu_cond_timedwait_func); \
> +            QemuCondTimedWaitFunc _f = qatomic_read(&qemu_cond_timedwait_func);\
>              _f(c, m, ms, __FILE__, __LINE__);                                  \
>          })
>  #endif
> @@ -236,7 +236,7 @@ static inline void qemu_spin_lock(QemuSpin *spin)
>      __tsan_mutex_pre_lock(spin, 0);
>  #endif
>      while (unlikely(__sync_lock_test_and_set(&spin->value, true))) {
> -        while (atomic_read(&spin->value)) {
> +        while (qatomic_read(&spin->value)) {
>              cpu_relax();
>          }
>      }
> @@ -261,7 +261,7 @@ static inline bool qemu_spin_trylock(QemuSpin *spin)
>  
>  static inline bool qemu_spin_locked(QemuSpin *spin)
>  {
> -    return atomic_read(&spin->value);
> +    return qatomic_read(&spin->value);
>  }
>  
>  static inline void qemu_spin_unlock(QemuSpin *spin)
> diff --git a/include/standard-headers/drivers/infiniband/hw/vmw_pvrdma/pvrdma_ring.h b/include/standard-headers/drivers/infiniband/hw/vmw_pvrdma/pvrdma_ring.h
> index acd4c8346d..7b4062a1a1 100644
> --- a/include/standard-headers/drivers/infiniband/hw/vmw_pvrdma/pvrdma_ring.h
> +++ b/include/standard-headers/drivers/infiniband/hw/vmw_pvrdma/pvrdma_ring.h
> @@ -68,7 +68,7 @@ static inline int pvrdma_idx_valid(uint32_t idx, uint32_t max_elems)
>  
>  static inline int32_t pvrdma_idx(int *var, uint32_t max_elems)
>  {
> -	const unsigned int idx = atomic_read(var);
> +	const unsigned int idx = qatomic_read(var);
>  
>  	if (pvrdma_idx_valid(idx, max_elems))
>  		return idx & (max_elems - 1);
> @@ -77,17 +77,17 @@ static inline int32_t pvrdma_idx(int *var, uint32_t max_elems)
>  
>  static inline void pvrdma_idx_ring_inc(int *var, uint32_t max_elems)
>  {
> -	uint32_t idx = atomic_read(var) + 1;	/* Increment. */
> +	uint32_t idx = qatomic_read(var) + 1;	/* Increment. */
>  
>  	idx &= (max_elems << 1) - 1;		/* Modulo size, flip gen. */
> -	atomic_set(var, idx);
> +	qatomic_set(var, idx);
>  }
>  
>  static inline int32_t pvrdma_idx_ring_has_space(const struct pvrdma_ring *r,
>  					      uint32_t max_elems, uint32_t *out_tail)
>  {
> -	const uint32_t tail = atomic_read(&r->prod_tail);
> -	const uint32_t head = atomic_read(&r->cons_head);
> +	const uint32_t tail = qatomic_read(&r->prod_tail);
> +	const uint32_t head = qatomic_read(&r->cons_head);
>  
>  	if (pvrdma_idx_valid(tail, max_elems) &&
>  	    pvrdma_idx_valid(head, max_elems)) {
> @@ -100,8 +100,8 @@ static inline int32_t pvrdma_idx_ring_has_space(const struct pvrdma_ring *r,
>  static inline int32_t pvrdma_idx_ring_has_data(const struct pvrdma_ring *r,
>  					     uint32_t max_elems, uint32_t *out_head)
>  {
> -	const uint32_t tail = atomic_read(&r->prod_tail);
> -	const uint32_t head = atomic_read(&r->cons_head);
> +	const uint32_t tail = qatomic_read(&r->prod_tail);
> +	const uint32_t head = qatomic_read(&r->cons_head);
>  
>  	if (pvrdma_idx_valid(tail, max_elems) &&
>  	    pvrdma_idx_valid(head, max_elems)) {
> diff --git a/linux-user/qemu.h b/linux-user/qemu.h
> index a69a0bd347..941ca99722 100644
> --- a/linux-user/qemu.h
> +++ b/linux-user/qemu.h
> @@ -146,7 +146,7 @@ typedef struct TaskState {
>      /* Nonzero if process_pending_signals() needs to do something (either
>       * handle a pending signal or unblock signals).
>       * This flag is written from a signal handler so should be accessed via
> -     * the atomic_read() and atomic_set() functions. (It is not accessed
> +     * the qatomic_read() and qatomic_set() functions. (It is not accessed
>       * from multiple threads.)
>       */
>      int signal_pending;
> diff --git a/tcg/i386/tcg-target.h b/tcg/i386/tcg-target.h
> index 99ac1e3958..d2baf796b0 100644
> --- a/tcg/i386/tcg-target.h
> +++ b/tcg/i386/tcg-target.h
> @@ -215,7 +215,7 @@ static inline void tb_target_set_jmp_target(uintptr_t tc_ptr,
>                                              uintptr_t jmp_addr, uintptr_t addr)
>  {
>      /* patch the branch destination */
> -    atomic_set((int32_t *)jmp_addr, addr - (jmp_addr + 4));
> +    qatomic_set((int32_t *)jmp_addr, addr - (jmp_addr + 4));
>      /* no need to flush icache explicitly */
>  }
>  
> diff --git a/tcg/s390/tcg-target.h b/tcg/s390/tcg-target.h
> index 07accabbd1..63c8797bd3 100644
> --- a/tcg/s390/tcg-target.h
> +++ b/tcg/s390/tcg-target.h
> @@ -154,7 +154,7 @@ static inline void tb_target_set_jmp_target(uintptr_t tc_ptr,
>  {
>      /* patch the branch destination */
>      intptr_t disp = addr - (jmp_addr - 2);
> -    atomic_set((int32_t *)jmp_addr, disp / 2);
> +    qatomic_set((int32_t *)jmp_addr, disp / 2);
>      /* no need to flush icache explicitly */
>  }
>  
> diff --git a/tcg/tci/tcg-target.h b/tcg/tci/tcg-target.h
> index 8b90ab71cb..8c1c1d265d 100644
> --- a/tcg/tci/tcg-target.h
> +++ b/tcg/tci/tcg-target.h
> @@ -206,7 +206,7 @@ static inline void tb_target_set_jmp_target(uintptr_t tc_ptr,
>                                              uintptr_t jmp_addr, uintptr_t addr)
>  {
>      /* patch the branch destination */
> -    atomic_set((int32_t *)jmp_addr, addr - (jmp_addr + 4));
> +    qatomic_set((int32_t *)jmp_addr, addr - (jmp_addr + 4));
>      /* no need to flush icache explicitly */
>  }
>  
> diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
> index ad8b315b35..e4bbf78366 100644
> --- a/accel/kvm/kvm-all.c
> +++ b/accel/kvm/kvm-all.c
> @@ -2379,7 +2379,7 @@ static __thread bool have_sigbus_pending;
>  
>  static void kvm_cpu_kick(CPUState *cpu)
>  {
> -    atomic_set(&cpu->kvm_run->immediate_exit, 1);
> +    qatomic_set(&cpu->kvm_run->immediate_exit, 1);
>  }
>  
>  static void kvm_cpu_kick_self(void)
> @@ -2400,7 +2400,7 @@ static void kvm_eat_signals(CPUState *cpu)
>      int r;
>  
>      if (kvm_immediate_exit) {
> -        atomic_set(&cpu->kvm_run->immediate_exit, 0);
> +        qatomic_set(&cpu->kvm_run->immediate_exit, 0);
>          /* Write kvm_run->immediate_exit before the cpu->exit_request
>           * write in kvm_cpu_exec.
>           */
> @@ -2434,7 +2434,7 @@ int kvm_cpu_exec(CPUState *cpu)
>      DPRINTF("kvm_cpu_exec()\n");
>  
>      if (kvm_arch_process_async_events(cpu)) {
> -        atomic_set(&cpu->exit_request, 0);
> +        qatomic_set(&cpu->exit_request, 0);
>          return EXCP_HLT;
>      }
>  
> @@ -2450,7 +2450,7 @@ int kvm_cpu_exec(CPUState *cpu)
>          }
>  
>          kvm_arch_pre_run(cpu, run);
> -        if (atomic_read(&cpu->exit_request)) {
> +        if (qatomic_read(&cpu->exit_request)) {
>              DPRINTF("interrupt exit requested\n");
>              /*
>               * KVM requires us to reenter the kernel after IO exits to complete
> @@ -2577,7 +2577,7 @@ int kvm_cpu_exec(CPUState *cpu)
>          vm_stop(RUN_STATE_INTERNAL_ERROR);
>      }
>  
> -    atomic_set(&cpu->exit_request, 0);
> +    qatomic_set(&cpu->exit_request, 0);
>      return ret;
>  }
>  
> @@ -2994,7 +2994,7 @@ int kvm_on_sigbus_vcpu(CPUState *cpu, int code, void *addr)
>      have_sigbus_pending = true;
>      pending_sigbus_addr = addr;
>      pending_sigbus_code = code;
> -    atomic_set(&cpu->exit_request, 1);
> +    qatomic_set(&cpu->exit_request, 1);
>      return 0;
>  #else
>      return 1;
> diff --git a/accel/tcg/cpu-exec.c b/accel/tcg/cpu-exec.c
> index 66d38f9d85..e10b46283c 100644
> --- a/accel/tcg/cpu-exec.c
> +++ b/accel/tcg/cpu-exec.c
> @@ -367,7 +367,8 @@ static inline void tb_add_jump(TranslationBlock *tb, int n,
>          goto out_unlock_next;
>      }
>      /* Atomically claim the jump destination slot only if it was NULL */
> -    old = atomic_cmpxchg(&tb->jmp_dest[n], (uintptr_t)NULL, (uintptr_t)tb_next);
> +    old = qatomic_cmpxchg(&tb->jmp_dest[n], (uintptr_t)NULL,
> +                          (uintptr_t)tb_next);
>      if (old) {
>          goto out_unlock_next;
>      }
> @@ -407,7 +408,7 @@ static inline TranslationBlock *tb_find(CPUState *cpu,
>          tb = tb_gen_code(cpu, pc, cs_base, flags, cf_mask);
>          mmap_unlock();
>          /* We add the TB in the virtual pc hash table for the fast lookup */
> -        atomic_set(&cpu->tb_jmp_cache[tb_jmp_cache_hash_func(pc)], tb);
> +        qatomic_set(&cpu->tb_jmp_cache[tb_jmp_cache_hash_func(pc)], tb);
>      }
>  #ifndef CONFIG_USER_ONLY
>      /* We don't take care of direct jumps when address mapping changes in
> @@ -536,9 +537,9 @@ static inline bool cpu_handle_interrupt(CPUState *cpu,
>       * Ensure zeroing happens before reading cpu->exit_request or
>       * cpu->interrupt_request (see also smp_wmb in cpu_exit())
>       */
> -    atomic_mb_set(&cpu_neg(cpu)->icount_decr.u16.high, 0);
> +    qatomic_mb_set(&cpu_neg(cpu)->icount_decr.u16.high, 0);
>  
> -    if (unlikely(atomic_read(&cpu->interrupt_request))) {
> +    if (unlikely(qatomic_read(&cpu->interrupt_request))) {
>          int interrupt_request;
>          qemu_mutex_lock_iothread();
>          interrupt_request = cpu->interrupt_request;
> @@ -613,10 +614,10 @@ static inline bool cpu_handle_interrupt(CPUState *cpu,
>      }
>  
>      /* Finally, check if we need to exit to the main loop.  */
> -    if (unlikely(atomic_read(&cpu->exit_request))
> +    if (unlikely(qatomic_read(&cpu->exit_request))
>          || (use_icount
>              && cpu_neg(cpu)->icount_decr.u16.low + cpu->icount_extra == 0)) {
> -        atomic_set(&cpu->exit_request, 0);
> +        qatomic_set(&cpu->exit_request, 0);
>          if (cpu->exception_index == -1) {
>              cpu->exception_index = EXCP_INTERRUPT;
>          }
> @@ -642,7 +643,7 @@ static inline void cpu_loop_exec_tb(CPUState *cpu, TranslationBlock *tb,
>      }
>  
>      *last_tb = NULL;
> -    insns_left = atomic_read(&cpu_neg(cpu)->icount_decr.u32);
> +    insns_left = qatomic_read(&cpu_neg(cpu)->icount_decr.u32);
>      if (insns_left < 0) {
>          /* Something asked us to stop executing chained TBs; just
>           * continue round the main loop. Whatever requested the exit
> diff --git a/accel/tcg/cputlb.c b/accel/tcg/cputlb.c
> index 6489abbf8c..aaf8e46ae5 100644
> --- a/accel/tcg/cputlb.c
> +++ b/accel/tcg/cputlb.c
> @@ -312,9 +312,9 @@ void tlb_flush_counts(size_t *pfull, size_t *ppart, size_t *pelide)
>      CPU_FOREACH(cpu) {
>          CPUArchState *env = cpu->env_ptr;
>  
> -        full += atomic_read(&env_tlb(env)->c.full_flush_count);
> -        part += atomic_read(&env_tlb(env)->c.part_flush_count);
> -        elide += atomic_read(&env_tlb(env)->c.elide_flush_count);
> +        full += qatomic_read(&env_tlb(env)->c.full_flush_count);
> +        part += qatomic_read(&env_tlb(env)->c.part_flush_count);
> +        elide += qatomic_read(&env_tlb(env)->c.elide_flush_count);
>      }
>      *pfull = full;
>      *ppart = part;
> @@ -349,13 +349,13 @@ static void tlb_flush_by_mmuidx_async_work(CPUState *cpu, run_on_cpu_data data)
>      cpu_tb_jmp_cache_clear(cpu);
>  
>      if (to_clean == ALL_MMUIDX_BITS) {
> -        atomic_set(&env_tlb(env)->c.full_flush_count,
> +        qatomic_set(&env_tlb(env)->c.full_flush_count,
>                     env_tlb(env)->c.full_flush_count + 1);
>      } else {
> -        atomic_set(&env_tlb(env)->c.part_flush_count,
> +        qatomic_set(&env_tlb(env)->c.part_flush_count,
>                     env_tlb(env)->c.part_flush_count + ctpop16(to_clean));
>          if (to_clean != asked) {
> -            atomic_set(&env_tlb(env)->c.elide_flush_count,
> +            qatomic_set(&env_tlb(env)->c.elide_flush_count,
>                         env_tlb(env)->c.elide_flush_count +
>                         ctpop16(asked & ~to_clean));
>          }
> @@ -693,7 +693,7 @@ void tlb_unprotect_code(ram_addr_t ram_addr)
>   * generated code.
>   *
>   * Other vCPUs might be reading their TLBs during guest execution, so we update
> - * te->addr_write with atomic_set. We don't need to worry about this for
> + * te->addr_write with qatomic_set. We don't need to worry about this for
>   * oversized guests as MTTCG is disabled for them.
>   *
>   * Called with tlb_c.lock held.
> @@ -711,7 +711,7 @@ static void tlb_reset_dirty_range_locked(CPUTLBEntry *tlb_entry,
>  #if TCG_OVERSIZED_GUEST
>              tlb_entry->addr_write |= TLB_NOTDIRTY;
>  #else
> -            atomic_set(&tlb_entry->addr_write,
> +            qatomic_set(&tlb_entry->addr_write,
>                         tlb_entry->addr_write | TLB_NOTDIRTY);
>  #endif
>          }
> @@ -1138,8 +1138,8 @@ static inline target_ulong tlb_read_ofs(CPUTLBEntry *entry, size_t ofs)
>  #if TCG_OVERSIZED_GUEST
>      return *(target_ulong *)((uintptr_t)entry + ofs);
>  #else
> -    /* ofs might correspond to .addr_write, so use atomic_read */
> -    return atomic_read((target_ulong *)((uintptr_t)entry + ofs));
> +    /* ofs might correspond to .addr_write, so use qatomic_read */
> +    return qatomic_read((target_ulong *)((uintptr_t)entry + ofs));
>  #endif
>  }
>  
> @@ -1155,11 +1155,11 @@ static bool victim_tlb_hit(CPUArchState *env, size_t mmu_idx, size_t index,
>          CPUTLBEntry *vtlb = &env_tlb(env)->d[mmu_idx].vtable[vidx];
>          target_ulong cmp;
>  
> -        /* elt_ofs might correspond to .addr_write, so use atomic_read */
> +        /* elt_ofs might correspond to .addr_write, so use qatomic_read */
>  #if TCG_OVERSIZED_GUEST
>          cmp = *(target_ulong *)((uintptr_t)vtlb + elt_ofs);
>  #else
> -        cmp = atomic_read((target_ulong *)((uintptr_t)vtlb + elt_ofs));
> +        cmp = qatomic_read((target_ulong *)((uintptr_t)vtlb + elt_ofs));
>  #endif
>  
>          if (cmp == page) {
> diff --git a/accel/tcg/tcg-all.c b/accel/tcg/tcg-all.c
> index 7098ad96c3..1c664924d7 100644
> --- a/accel/tcg/tcg-all.c
> +++ b/accel/tcg/tcg-all.c
> @@ -65,7 +65,7 @@ static void tcg_handle_interrupt(CPUState *cpu, int mask)
>      if (!qemu_cpu_is_self(cpu)) {
>          qemu_cpu_kick(cpu);
>      } else {
> -        atomic_set(&cpu_neg(cpu)->icount_decr.u16.high, -1);
> +        qatomic_set(&cpu_neg(cpu)->icount_decr.u16.high, -1);
>          if (use_icount &&
>              !cpu->can_do_io
>              && (mask & ~old_mask) != 0) {
> diff --git a/accel/tcg/translate-all.c b/accel/tcg/translate-all.c
> index 2d83013633..f44ba9d46d 100644
> --- a/accel/tcg/translate-all.c
> +++ b/accel/tcg/translate-all.c
> @@ -377,9 +377,9 @@ static int cpu_restore_state_from_tb(CPUState *cpu, TranslationBlock *tb,
>      restore_state_to_opc(env, tb, data);
>  
>  #ifdef CONFIG_PROFILER
> -    atomic_set(&prof->restore_time,
> +    qatomic_set(&prof->restore_time,
>                  prof->restore_time + profile_getclock() - ti);
> -    atomic_set(&prof->restore_count, prof->restore_count + 1);
> +    qatomic_set(&prof->restore_count, prof->restore_count + 1);
>  #endif
>      return 0;
>  }
> @@ -509,7 +509,7 @@ static PageDesc *page_find_alloc(tb_page_addr_t index, int alloc)
>  
>      /* Level 2..N-1.  */
>      for (i = v_l2_levels; i > 0; i--) {
> -        void **p = atomic_rcu_read(lp);
> +        void **p = qatomic_rcu_read(lp);
>  
>          if (p == NULL) {
>              void *existing;
> @@ -518,7 +518,7 @@ static PageDesc *page_find_alloc(tb_page_addr_t index, int alloc)
>                  return NULL;
>              }
>              p = g_new0(void *, V_L2_SIZE);
> -            existing = atomic_cmpxchg(lp, NULL, p);
> +            existing = qatomic_cmpxchg(lp, NULL, p);
>              if (unlikely(existing)) {
>                  g_free(p);
>                  p = existing;
> @@ -528,7 +528,7 @@ static PageDesc *page_find_alloc(tb_page_addr_t index, int alloc)
>          lp = p + ((index >> (i * V_L2_BITS)) & (V_L2_SIZE - 1));
>      }
>  
> -    pd = atomic_rcu_read(lp);
> +    pd = qatomic_rcu_read(lp);
>      if (pd == NULL) {
>          void *existing;
>  
> @@ -545,7 +545,7 @@ static PageDesc *page_find_alloc(tb_page_addr_t index, int alloc)
>              }
>          }
>  #endif
> -        existing = atomic_cmpxchg(lp, NULL, pd);
> +        existing = qatomic_cmpxchg(lp, NULL, pd);
>          if (unlikely(existing)) {
>  #ifndef CONFIG_USER_ONLY
>              {
> @@ -1253,7 +1253,7 @@ static void do_tb_flush(CPUState *cpu, run_on_cpu_data tb_flush_count)
>      tcg_region_reset_all();
>      /* XXX: flush processor icache at this point if cache flush is
>         expensive */
> -    atomic_mb_set(&tb_ctx.tb_flush_count, tb_ctx.tb_flush_count + 1);
> +    qatomic_mb_set(&tb_ctx.tb_flush_count, tb_ctx.tb_flush_count + 1);
>  
>  done:
>      mmap_unlock();
> @@ -1265,7 +1265,7 @@ done:
>  void tb_flush(CPUState *cpu)
>  {
>      if (tcg_enabled()) {
> -        unsigned tb_flush_count = atomic_mb_read(&tb_ctx.tb_flush_count);
> +        unsigned tb_flush_count = qatomic_mb_read(&tb_ctx.tb_flush_count);
>  
>          if (cpu_in_exclusive_context(cpu)) {
>              do_tb_flush(cpu, RUN_ON_CPU_HOST_INT(tb_flush_count));
> @@ -1358,7 +1358,7 @@ static inline void tb_remove_from_jmp_list(TranslationBlock *orig, int n_orig)
>      int n;
>  
>      /* mark the LSB of jmp_dest[] so that no further jumps can be inserted */
> -    ptr = atomic_or_fetch(&orig->jmp_dest[n_orig], 1);
> +    ptr = qatomic_or_fetch(&orig->jmp_dest[n_orig], 1);
>      dest = (TranslationBlock *)(ptr & ~1);
>      if (dest == NULL) {
>          return;
> @@ -1369,7 +1369,7 @@ static inline void tb_remove_from_jmp_list(TranslationBlock *orig, int n_orig)
>       * While acquiring the lock, the jump might have been removed if the
>       * destination TB was invalidated; check again.
>       */
> -    ptr_locked = atomic_read(&orig->jmp_dest[n_orig]);
> +    ptr_locked = qatomic_read(&orig->jmp_dest[n_orig]);
>      if (ptr_locked != ptr) {
>          qemu_spin_unlock(&dest->jmp_lock);
>          /*
> @@ -1415,7 +1415,7 @@ static inline void tb_jmp_unlink(TranslationBlock *dest)
>  
>      TB_FOR_EACH_JMP(dest, tb, n) {
>          tb_reset_jump(tb, n);
> -        atomic_and(&tb->jmp_dest[n], (uintptr_t)NULL | 1);
> +        qatomic_and(&tb->jmp_dest[n], (uintptr_t)NULL | 1);
>          /* No need to clear the list entry; setting the dest ptr is enough */
>      }
>      dest->jmp_list_head = (uintptr_t)NULL;
> @@ -1439,7 +1439,7 @@ static void do_tb_phys_invalidate(TranslationBlock *tb, bool rm_from_page_list)
>  
>      /* make sure no further incoming jumps will be chained to this TB */
>      qemu_spin_lock(&tb->jmp_lock);
> -    atomic_set(&tb->cflags, tb->cflags | CF_INVALID);
> +    qatomic_set(&tb->cflags, tb->cflags | CF_INVALID);
>      qemu_spin_unlock(&tb->jmp_lock);
>  
>      /* remove the TB from the hash list */
> @@ -1466,8 +1466,8 @@ static void do_tb_phys_invalidate(TranslationBlock *tb, bool rm_from_page_list)
>      /* remove the TB from the hash list */
>      h = tb_jmp_cache_hash_func(tb->pc);
>      CPU_FOREACH(cpu) {
> -        if (atomic_read(&cpu->tb_jmp_cache[h]) == tb) {
> -            atomic_set(&cpu->tb_jmp_cache[h], NULL);
> +        if (qatomic_read(&cpu->tb_jmp_cache[h]) == tb) {
> +            qatomic_set(&cpu->tb_jmp_cache[h], NULL);
>          }
>      }
>  
> @@ -1478,7 +1478,7 @@ static void do_tb_phys_invalidate(TranslationBlock *tb, bool rm_from_page_list)
>      /* suppress any remaining jumps to this TB */
>      tb_jmp_unlink(tb);
>  
> -    atomic_set(&tcg_ctx->tb_phys_invalidate_count,
> +    qatomic_set(&tcg_ctx->tb_phys_invalidate_count,
>                 tcg_ctx->tb_phys_invalidate_count + 1);
>  }
>  
> @@ -1733,7 +1733,7 @@ TranslationBlock *tb_gen_code(CPUState *cpu,
>  
>  #ifdef CONFIG_PROFILER
>      /* includes aborted translations because of exceptions */
> -    atomic_set(&prof->tb_count1, prof->tb_count1 + 1);
> +    qatomic_set(&prof->tb_count1, prof->tb_count1 + 1);
>      ti = profile_getclock();
>  #endif
>  
> @@ -1758,8 +1758,9 @@ TranslationBlock *tb_gen_code(CPUState *cpu,
>      }
>  
>  #ifdef CONFIG_PROFILER
> -    atomic_set(&prof->tb_count, prof->tb_count + 1);
> -    atomic_set(&prof->interm_time, prof->interm_time + profile_getclock() - ti);
> +    qatomic_set(&prof->tb_count, prof->tb_count + 1);
> +    qatomic_set(&prof->interm_time,
> +                prof->interm_time + profile_getclock() - ti);
>      ti = profile_getclock();
>  #endif
>  
> @@ -1804,10 +1805,10 @@ TranslationBlock *tb_gen_code(CPUState *cpu,
>      tb->tc.size = gen_code_size;
>  
>  #ifdef CONFIG_PROFILER
> -    atomic_set(&prof->code_time, prof->code_time + profile_getclock() - ti);
> -    atomic_set(&prof->code_in_len, prof->code_in_len + tb->size);
> -    atomic_set(&prof->code_out_len, prof->code_out_len + gen_code_size);
> -    atomic_set(&prof->search_out_len, prof->search_out_len + search_size);
> +    qatomic_set(&prof->code_time, prof->code_time + profile_getclock() - ti);
> +    qatomic_set(&prof->code_in_len, prof->code_in_len + tb->size);
> +    qatomic_set(&prof->code_out_len, prof->code_out_len + gen_code_size);
> +    qatomic_set(&prof->search_out_len, prof->search_out_len + search_size);
>  #endif
>  
>  #ifdef DEBUG_DISAS
> @@ -1869,7 +1870,7 @@ TranslationBlock *tb_gen_code(CPUState *cpu,
>      }
>  #endif
>  
> -    atomic_set(&tcg_ctx->code_gen_ptr, (void *)
> +    qatomic_set(&tcg_ctx->code_gen_ptr, (void *)
>          ROUND_UP((uintptr_t)gen_code_buf + gen_code_size + search_size,
>                   CODE_GEN_ALIGN));
>  
> @@ -1905,7 +1906,7 @@ TranslationBlock *tb_gen_code(CPUState *cpu,
>          uintptr_t orig_aligned = (uintptr_t)gen_code_buf;
>  
>          orig_aligned -= ROUND_UP(sizeof(*tb), qemu_icache_linesize);
> -        atomic_set(&tcg_ctx->code_gen_ptr, (void *)orig_aligned);
> +        qatomic_set(&tcg_ctx->code_gen_ptr, (void *)orig_aligned);
>          tb_destroy(tb);
>          return existing_tb;
>      }
> @@ -2273,7 +2274,7 @@ static void tb_jmp_cache_clear_page(CPUState *cpu, target_ulong page_addr)
>      unsigned int i, i0 = tb_jmp_cache_hash_page(page_addr);
>  
>      for (i = 0; i < TB_JMP_PAGE_SIZE; i++) {
> -        atomic_set(&cpu->tb_jmp_cache[i0 + i], NULL);
> +        qatomic_set(&cpu->tb_jmp_cache[i0 + i], NULL);
>      }
>  }
>  
> @@ -2393,7 +2394,7 @@ void dump_exec_info(void)
>  
>      qemu_printf("\nStatistics:\n");
>      qemu_printf("TB flush count      %u\n",
> -                atomic_read(&tb_ctx.tb_flush_count));
> +                qatomic_read(&tb_ctx.tb_flush_count));
>      qemu_printf("TB invalidate count %zu\n",
>                  tcg_tb_phys_invalidate_count());
>  
> @@ -2415,7 +2416,7 @@ void cpu_interrupt(CPUState *cpu, int mask)
>  {
>      g_assert(qemu_mutex_iothread_locked());
>      cpu->interrupt_request |= mask;
> -    atomic_set(&cpu_neg(cpu)->icount_decr.u16.high, -1);
> +    qatomic_set(&cpu_neg(cpu)->icount_decr.u16.high, -1);
>  }
>  
>  /*
> diff --git a/audio/jackaudio.c b/audio/jackaudio.c
> index 72ed7c4929..1e714b30bc 100644
> --- a/audio/jackaudio.c
> +++ b/audio/jackaudio.c
> @@ -104,7 +104,7 @@ static void qjack_buffer_create(QJackBuffer *buffer, int channels, int frames)
>  static void qjack_buffer_clear(QJackBuffer *buffer)
>  {
>      assert(buffer->data);
> -    atomic_store_release(&buffer->used, 0);
> +    qatomic_store_release(&buffer->used, 0);
>      buffer->rptr = 0;
>      buffer->wptr = 0;
>  }
> @@ -129,7 +129,7 @@ static int qjack_buffer_write(QJackBuffer *buffer, float *data, int size)
>      assert(buffer->data);
>      const int samples = size / sizeof(float);
>      int frames        = samples / buffer->channels;
> -    const int avail   = buffer->frames - atomic_load_acquire(&buffer->used);
> +    const int avail   = buffer->frames - qatomic_load_acquire(&buffer->used);
>  
>      if (frames > avail) {
>          frames = avail;
> @@ -153,7 +153,7 @@ static int qjack_buffer_write(QJackBuffer *buffer, float *data, int size)
>  
>      buffer->wptr = wptr;
>  
> -    atomic_add(&buffer->used, frames);
> +    qatomic_add(&buffer->used, frames);
>      return frames * buffer->channels * sizeof(float);
>  };
>  
> @@ -161,7 +161,7 @@ static int qjack_buffer_write(QJackBuffer *buffer, float *data, int size)
>  static int qjack_buffer_write_l(QJackBuffer *buffer, float **dest, int frames)
>  {
>      assert(buffer->data);
> -    const int avail   = buffer->frames - atomic_load_acquire(&buffer->used);
> +    const int avail   = buffer->frames - qatomic_load_acquire(&buffer->used);
>      int wptr = buffer->wptr;
>  
>      if (frames > avail) {
> @@ -185,7 +185,7 @@ static int qjack_buffer_write_l(QJackBuffer *buffer, float **dest, int frames)
>      }
>      buffer->wptr = wptr;
>  
> -    atomic_add(&buffer->used, frames);
> +    qatomic_add(&buffer->used, frames);
>      return frames;
>  }
>  
> @@ -195,7 +195,7 @@ static int qjack_buffer_read(QJackBuffer *buffer, float *dest, int size)
>      assert(buffer->data);
>      const int samples = size / sizeof(float);
>      int frames        = samples / buffer->channels;
> -    const int avail   = atomic_load_acquire(&buffer->used);
> +    const int avail   = qatomic_load_acquire(&buffer->used);
>  
>      if (frames > avail) {
>          frames = avail;
> @@ -219,7 +219,7 @@ static int qjack_buffer_read(QJackBuffer *buffer, float *dest, int size)
>  
>      buffer->rptr = rptr;
>  
> -    atomic_sub(&buffer->used, frames);
> +    qatomic_sub(&buffer->used, frames);
>      return frames * buffer->channels * sizeof(float);
>  }
>  
> @@ -228,7 +228,7 @@ static int qjack_buffer_read_l(QJackBuffer *buffer, float **dest, int frames)
>  {
>      assert(buffer->data);
>      int copy       = frames;
> -    const int used = atomic_load_acquire(&buffer->used);
> +    const int used = qatomic_load_acquire(&buffer->used);
>      int rptr       = buffer->rptr;
>  
>      if (copy > used) {
> @@ -252,7 +252,7 @@ static int qjack_buffer_read_l(QJackBuffer *buffer, float **dest, int frames)
>      }
>      buffer->rptr = rptr;
>  
> -    atomic_sub(&buffer->used, copy);
> +    qatomic_sub(&buffer->used, copy);
>      return copy;
>  }
>  
> diff --git a/block.c b/block.c
> index 11ab55f80b..f72a2e26e8 100644
> --- a/block.c
> +++ b/block.c
> @@ -1694,7 +1694,7 @@ static int bdrv_open_common(BlockDriverState *bs, BlockBackend *file,
>      }
>  
>      /* bdrv_new() and bdrv_close() make it so */
> -    assert(atomic_read(&bs->copy_on_read) == 0);
> +    assert(qatomic_read(&bs->copy_on_read) == 0);
>  
>      if (bs->open_flags & BDRV_O_COPY_ON_READ) {
>          if (!bs->read_only) {
> @@ -4436,7 +4436,7 @@ static void bdrv_close(BlockDriverState *bs)
>      bs->file = NULL;
>      g_free(bs->opaque);
>      bs->opaque = NULL;
> -    atomic_set(&bs->copy_on_read, 0);
> +    qatomic_set(&bs->copy_on_read, 0);
>      bs->backing_file[0] = '\0';
>      bs->backing_format[0] = '\0';
>      bs->total_sectors = 0;
> diff --git a/block/block-backend.c b/block/block-backend.c
> index 24dd0670d1..ce78d30794 100644
> --- a/block/block-backend.c
> +++ b/block/block-backend.c
> @@ -1353,12 +1353,12 @@ int blk_make_zero(BlockBackend *blk, BdrvRequestFlags flags)
>  
>  void blk_inc_in_flight(BlockBackend *blk)
>  {
> -    atomic_inc(&blk->in_flight);
> +    qatomic_inc(&blk->in_flight);
>  }
>  
>  void blk_dec_in_flight(BlockBackend *blk)
>  {
> -    atomic_dec(&blk->in_flight);
> +    qatomic_dec(&blk->in_flight);
>      aio_wait_kick();
>  }
>  
> @@ -1720,7 +1720,7 @@ void blk_drain(BlockBackend *blk)
>  
>      /* We may have -ENOMEDIUM completions in flight */
>      AIO_WAIT_WHILE(blk_get_aio_context(blk),
> -                   atomic_mb_read(&blk->in_flight) > 0);
> +                   qatomic_mb_read(&blk->in_flight) > 0);
>  
>      if (bs) {
>          bdrv_drained_end(bs);
> @@ -1739,7 +1739,7 @@ void blk_drain_all(void)
>          aio_context_acquire(ctx);
>  
>          /* We may have -ENOMEDIUM completions in flight */
> -        AIO_WAIT_WHILE(ctx, atomic_mb_read(&blk->in_flight) > 0);
> +        AIO_WAIT_WHILE(ctx, qatomic_mb_read(&blk->in_flight) > 0);
>  
>          aio_context_release(ctx);
>      }
> @@ -2346,6 +2346,7 @@ void blk_io_limits_update_group(BlockBackend *blk, const char *group)
>  static void blk_root_drained_begin(BdrvChild *child)
>  {
>      BlockBackend *blk = child->opaque;
> +    ThrottleGroupMember *tgm = &blk->public.throttle_group_member;
>  
>      if (++blk->quiesce_counter == 1) {
>          if (blk->dev_ops && blk->dev_ops->drained_begin) {
> @@ -2356,8 +2357,8 @@ static void blk_root_drained_begin(BdrvChild *child)
>      /* Note that blk->root may not be accessible here yet if we are just
>       * attaching to a BlockDriverState that is drained. Use child instead. */
>  
> -    if (atomic_fetch_inc(&blk->public.throttle_group_member.io_limits_disabled) == 0) {
> -        throttle_group_restart_tgm(&blk->public.throttle_group_member);
> +    if (qatomic_fetch_inc(&tgm->io_limits_disabled) == 0) {
> +        throttle_group_restart_tgm(tgm);
>      }
>  }
>  
> @@ -2374,7 +2375,7 @@ static void blk_root_drained_end(BdrvChild *child, int *drained_end_counter)
>      assert(blk->quiesce_counter);
>  
>      assert(blk->public.throttle_group_member.io_limits_disabled);
> -    atomic_dec(&blk->public.throttle_group_member.io_limits_disabled);
> +    qatomic_dec(&blk->public.throttle_group_member.io_limits_disabled);
>  
>      if (--blk->quiesce_counter == 0) {
>          if (blk->dev_ops && blk->dev_ops->drained_end) {
> diff --git a/block/io.c b/block/io.c
> index a2389bb38c..11df1889f1 100644
> --- a/block/io.c
> +++ b/block/io.c
> @@ -69,7 +69,7 @@ void bdrv_parent_drained_end_single(BdrvChild *c)
>  {
>      int drained_end_counter = 0;
>      bdrv_parent_drained_end_single_no_poll(c, &drained_end_counter);
> -    BDRV_POLL_WHILE(c->bs, atomic_read(&drained_end_counter) > 0);
> +    BDRV_POLL_WHILE(c->bs, qatomic_read(&drained_end_counter) > 0);
>  }
>  
>  static void bdrv_parent_drained_end(BlockDriverState *bs, BdrvChild *ignore,
> @@ -186,12 +186,12 @@ void bdrv_refresh_limits(BlockDriverState *bs, Error **errp)
>   */
>  void bdrv_enable_copy_on_read(BlockDriverState *bs)
>  {
> -    atomic_inc(&bs->copy_on_read);
> +    qatomic_inc(&bs->copy_on_read);
>  }
>  
>  void bdrv_disable_copy_on_read(BlockDriverState *bs)
>  {
> -    int old = atomic_fetch_dec(&bs->copy_on_read);
> +    int old = qatomic_fetch_dec(&bs->copy_on_read);
>      assert(old >= 1);
>  }
>  
> @@ -219,9 +219,9 @@ static void coroutine_fn bdrv_drain_invoke_entry(void *opaque)
>      }
>  
>      /* Set data->done and decrement drained_end_counter before bdrv_wakeup() */
> -    atomic_mb_set(&data->done, true);
> +    qatomic_mb_set(&data->done, true);
>      if (!data->begin) {
> -        atomic_dec(data->drained_end_counter);
> +        qatomic_dec(data->drained_end_counter);
>      }
>      bdrv_dec_in_flight(bs);
>  
> @@ -248,7 +248,7 @@ static void bdrv_drain_invoke(BlockDriverState *bs, bool begin,
>      };
>  
>      if (!begin) {
> -        atomic_inc(drained_end_counter);
> +        qatomic_inc(drained_end_counter);
>      }
>  
>      /* Make sure the driver callback completes during the polling phase for
> @@ -268,7 +268,7 @@ bool bdrv_drain_poll(BlockDriverState *bs, bool recursive,
>          return true;
>      }
>  
> -    if (atomic_read(&bs->in_flight)) {
> +    if (qatomic_read(&bs->in_flight)) {
>          return true;
>      }
>  
> @@ -382,7 +382,7 @@ void bdrv_do_drained_begin_quiesce(BlockDriverState *bs,
>      assert(!qemu_in_coroutine());
>  
>      /* Stop things in parent-to-child order */
> -    if (atomic_fetch_inc(&bs->quiesce_counter) == 0) {
> +    if (qatomic_fetch_inc(&bs->quiesce_counter) == 0) {
>          aio_disable_external(bdrv_get_aio_context(bs));
>      }
>  
> @@ -473,7 +473,7 @@ static void bdrv_do_drained_end(BlockDriverState *bs, bool recursive,
>      bdrv_parent_drained_end(bs, parent, ignore_bds_parents,
>                              drained_end_counter);
>  
> -    old_quiesce_counter = atomic_fetch_dec(&bs->quiesce_counter);
> +    old_quiesce_counter = qatomic_fetch_dec(&bs->quiesce_counter);
>      if (old_quiesce_counter == 1) {
>          aio_enable_external(bdrv_get_aio_context(bs));
>      }
> @@ -492,7 +492,7 @@ void bdrv_drained_end(BlockDriverState *bs)
>  {
>      int drained_end_counter = 0;
>      bdrv_do_drained_end(bs, false, NULL, false, &drained_end_counter);
> -    BDRV_POLL_WHILE(bs, atomic_read(&drained_end_counter) > 0);
> +    BDRV_POLL_WHILE(bs, qatomic_read(&drained_end_counter) > 0);
>  }
>  
>  void bdrv_drained_end_no_poll(BlockDriverState *bs, int *drained_end_counter)
> @@ -504,7 +504,7 @@ void bdrv_subtree_drained_end(BlockDriverState *bs)
>  {
>      int drained_end_counter = 0;
>      bdrv_do_drained_end(bs, true, NULL, false, &drained_end_counter);
> -    BDRV_POLL_WHILE(bs, atomic_read(&drained_end_counter) > 0);
> +    BDRV_POLL_WHILE(bs, qatomic_read(&drained_end_counter) > 0);
>  }
>  
>  void bdrv_apply_subtree_drain(BdrvChild *child, BlockDriverState *new_parent)
> @@ -526,7 +526,7 @@ void bdrv_unapply_subtree_drain(BdrvChild *child, BlockDriverState *old_parent)
>                              &drained_end_counter);
>      }
>  
> -    BDRV_POLL_WHILE(child->bs, atomic_read(&drained_end_counter) > 0);
> +    BDRV_POLL_WHILE(child->bs, qatomic_read(&drained_end_counter) > 0);
>  }
>  
>  /*
> @@ -553,7 +553,7 @@ static void bdrv_drain_assert_idle(BlockDriverState *bs)
>  {
>      BdrvChild *child, *next;
>  
> -    assert(atomic_read(&bs->in_flight) == 0);
> +    assert(qatomic_read(&bs->in_flight) == 0);
>      QLIST_FOREACH_SAFE(child, &bs->children, next, next) {
>          bdrv_drain_assert_idle(child->bs);
>      }
> @@ -655,7 +655,7 @@ void bdrv_drain_all_end(void)
>      }
>  
>      assert(qemu_get_current_aio_context() == qemu_get_aio_context());
> -    AIO_WAIT_WHILE(NULL, atomic_read(&drained_end_counter) > 0);
> +    AIO_WAIT_WHILE(NULL, qatomic_read(&drained_end_counter) > 0);
>  
>      assert(bdrv_drain_all_count > 0);
>      bdrv_drain_all_count--;
> @@ -675,7 +675,7 @@ void bdrv_drain_all(void)
>  static void tracked_request_end(BdrvTrackedRequest *req)
>  {
>      if (req->serialising) {
> -        atomic_dec(&req->bs->serialising_in_flight);
> +        qatomic_dec(&req->bs->serialising_in_flight);
>      }
>  
>      qemu_co_mutex_lock(&req->bs->reqs_lock);
> @@ -777,7 +777,7 @@ bool bdrv_mark_request_serialising(BdrvTrackedRequest *req, uint64_t align)
>  
>      qemu_co_mutex_lock(&bs->reqs_lock);
>      if (!req->serialising) {
> -        atomic_inc(&req->bs->serialising_in_flight);
> +        qatomic_inc(&req->bs->serialising_in_flight);
>          req->serialising = true;
>      }
>  
> @@ -841,7 +841,7 @@ static int bdrv_get_cluster_size(BlockDriverState *bs)
>  
>  void bdrv_inc_in_flight(BlockDriverState *bs)
>  {
> -    atomic_inc(&bs->in_flight);
> +    qatomic_inc(&bs->in_flight);
>  }
>  
>  void bdrv_wakeup(BlockDriverState *bs)
> @@ -851,7 +851,7 @@ void bdrv_wakeup(BlockDriverState *bs)
>  
>  void bdrv_dec_in_flight(BlockDriverState *bs)
>  {
> -    atomic_dec(&bs->in_flight);
> +    qatomic_dec(&bs->in_flight);
>      bdrv_wakeup(bs);
>  }
>  
> @@ -860,7 +860,7 @@ static bool coroutine_fn bdrv_wait_serialising_requests(BdrvTrackedRequest *self
>      BlockDriverState *bs = self->bs;
>      bool waited = false;
>  
> -    if (!atomic_read(&bs->serialising_in_flight)) {
> +    if (!qatomic_read(&bs->serialising_in_flight)) {
>          return false;
>      }
>  
> @@ -1747,7 +1747,7 @@ int coroutine_fn bdrv_co_preadv_part(BdrvChild *child,
>      bdrv_inc_in_flight(bs);
>  
>      /* Don't do copy-on-read if we read data before write operation */
> -    if (atomic_read(&bs->copy_on_read)) {
> +    if (qatomic_read(&bs->copy_on_read)) {
>          flags |= BDRV_REQ_COPY_ON_READ;
>      }
>  
> @@ -1935,7 +1935,7 @@ bdrv_co_write_req_finish(BdrvChild *child, int64_t offset, uint64_t bytes,
>      int64_t end_sector = DIV_ROUND_UP(offset + bytes, BDRV_SECTOR_SIZE);
>      BlockDriverState *bs = child->bs;
>  
> -    atomic_inc(&bs->write_gen);
> +    qatomic_inc(&bs->write_gen);
>  
>      /*
>       * Discard cannot extend the image, but in error handling cases, such as
> @@ -2768,7 +2768,7 @@ int coroutine_fn bdrv_co_flush(BlockDriverState *bs)
>      }
>  
>      qemu_co_mutex_lock(&bs->reqs_lock);
> -    current_gen = atomic_read(&bs->write_gen);
> +    current_gen = qatomic_read(&bs->write_gen);
>  
>      /* Wait until any previous flushes are completed */
>      while (bs->active_flush_req) {
> @@ -3116,7 +3116,7 @@ void bdrv_io_plug(BlockDriverState *bs)
>          bdrv_io_plug(child->bs);
>      }
>  
> -    if (atomic_fetch_inc(&bs->io_plugged) == 0) {
> +    if (qatomic_fetch_inc(&bs->io_plugged) == 0) {
>          BlockDriver *drv = bs->drv;
>          if (drv && drv->bdrv_io_plug) {
>              drv->bdrv_io_plug(bs);
> @@ -3129,7 +3129,7 @@ void bdrv_io_unplug(BlockDriverState *bs)
>      BdrvChild *child;
>  
>      assert(bs->io_plugged);
> -    if (atomic_fetch_dec(&bs->io_plugged) == 1) {
> +    if (qatomic_fetch_dec(&bs->io_plugged) == 1) {
>          BlockDriver *drv = bs->drv;
>          if (drv && drv->bdrv_io_unplug) {
>              drv->bdrv_io_unplug(bs);
> diff --git a/block/nfs.c b/block/nfs.c
> index 61a249a9fc..f86e660374 100644
> --- a/block/nfs.c
> +++ b/block/nfs.c
> @@ -721,7 +721,7 @@ nfs_get_allocated_file_size_cb(int ret, struct nfs_context *nfs, void *data,
>      }
>  
>      /* Set task->complete before reading bs->wakeup.  */
> -    atomic_mb_set(&task->complete, 1);
> +    qatomic_mb_set(&task->complete, 1);
>      bdrv_wakeup(task->bs);
>  }
>  
> diff --git a/block/sheepdog.c b/block/sheepdog.c
> index cbbebc1aaf..2f5c0eb376 100644
> --- a/block/sheepdog.c
> +++ b/block/sheepdog.c
> @@ -665,7 +665,7 @@ out:
>      srco->co = NULL;
>      srco->ret = ret;
>      /* Set srco->finished before reading bs->wakeup.  */
> -    atomic_mb_set(&srco->finished, true);
> +    qatomic_mb_set(&srco->finished, true);
>      if (srco->bs) {
>          bdrv_wakeup(srco->bs);
>      }
> diff --git a/block/throttle-groups.c b/block/throttle-groups.c
> index 4e28365d8d..e2f2813c0f 100644
> --- a/block/throttle-groups.c
> +++ b/block/throttle-groups.c
> @@ -228,7 +228,7 @@ static ThrottleGroupMember *next_throttle_token(ThrottleGroupMember *tgm,
>       * immediately if it has pending requests. Otherwise we could be
>       * forcing it to wait for other member's throttled requests. */
>      if (tgm_has_pending_reqs(tgm, is_write) &&
> -        atomic_read(&tgm->io_limits_disabled)) {
> +        qatomic_read(&tgm->io_limits_disabled)) {
>          return tgm;
>      }
>  
> @@ -272,7 +272,7 @@ static bool throttle_group_schedule_timer(ThrottleGroupMember *tgm,
>      ThrottleTimers *tt = &tgm->throttle_timers;
>      bool must_wait;
>  
> -    if (atomic_read(&tgm->io_limits_disabled)) {
> +    if (qatomic_read(&tgm->io_limits_disabled)) {
>          return false;
>      }
>  
> @@ -417,7 +417,7 @@ static void coroutine_fn throttle_group_restart_queue_entry(void *opaque)
>  
>      g_free(data);
>  
> -    atomic_dec(&tgm->restart_pending);
> +    qatomic_dec(&tgm->restart_pending);
>      aio_wait_kick();
>  }
>  
> @@ -434,7 +434,7 @@ static void throttle_group_restart_queue(ThrottleGroupMember *tgm, bool is_write
>       * be no timer pending on this tgm at this point */
>      assert(!timer_pending(tgm->throttle_timers.timers[is_write]));
>  
> -    atomic_inc(&tgm->restart_pending);
> +    qatomic_inc(&tgm->restart_pending);
>  
>      co = qemu_coroutine_create(throttle_group_restart_queue_entry, rd);
>      aio_co_enter(tgm->aio_context, co);
> @@ -544,7 +544,7 @@ void throttle_group_register_tgm(ThrottleGroupMember *tgm,
>  
>      tgm->throttle_state = ts;
>      tgm->aio_context = ctx;
> -    atomic_set(&tgm->restart_pending, 0);
> +    qatomic_set(&tgm->restart_pending, 0);
>  
>      qemu_mutex_lock(&tg->lock);
>      /* If the ThrottleGroup is new set this ThrottleGroupMember as the token */
> @@ -592,7 +592,7 @@ void throttle_group_unregister_tgm(ThrottleGroupMember *tgm)
>      }
>  
>      /* Wait for throttle_group_restart_queue_entry() coroutines to finish */
> -    AIO_WAIT_WHILE(tgm->aio_context, atomic_read(&tgm->restart_pending) > 0);
> +    AIO_WAIT_WHILE(tgm->aio_context, qatomic_read(&tgm->restart_pending) > 0);
>  
>      qemu_mutex_lock(&tg->lock);
>      for (i = 0; i < 2; i++) {
> diff --git a/block/throttle.c b/block/throttle.c
> index 9a0f38149a..b685166ad4 100644
> --- a/block/throttle.c
> +++ b/block/throttle.c
> @@ -217,7 +217,7 @@ static void throttle_reopen_abort(BDRVReopenState *reopen_state)
>  static void coroutine_fn throttle_co_drain_begin(BlockDriverState *bs)
>  {
>      ThrottleGroupMember *tgm = bs->opaque;
> -    if (atomic_fetch_inc(&tgm->io_limits_disabled) == 0) {
> +    if (qatomic_fetch_inc(&tgm->io_limits_disabled) == 0) {
>          throttle_group_restart_tgm(tgm);
>      }
>  }
> @@ -226,7 +226,7 @@ static void coroutine_fn throttle_co_drain_end(BlockDriverState *bs)
>  {
>      ThrottleGroupMember *tgm = bs->opaque;
>      assert(tgm->io_limits_disabled);
> -    atomic_dec(&tgm->io_limits_disabled);
> +    qatomic_dec(&tgm->io_limits_disabled);
>  }
>  
>  static const char *const throttle_strong_runtime_opts[] = {
> diff --git a/blockdev.c b/blockdev.c
> index 7f2561081e..bebd3ba1c3 100644
> --- a/blockdev.c
> +++ b/blockdev.c
> @@ -1604,7 +1604,7 @@ static void external_snapshot_commit(BlkActionState *common)
>      /* We don't need (or want) to use the transactional
>       * bdrv_reopen_multiple() across all the entries at once, because we
>       * don't want to abort all of them if one of them fails the reopen */
> -    if (!atomic_read(&state->old_bs->copy_on_read)) {
> +    if (!qatomic_read(&state->old_bs->copy_on_read)) {
>          bdrv_reopen_set_read_only(state->old_bs, true, NULL);
>      }
>  
> diff --git a/blockjob.c b/blockjob.c
> index 470facfd47..98ac8af982 100644
> --- a/blockjob.c
> +++ b/blockjob.c
> @@ -298,7 +298,7 @@ BlockJobInfo *block_job_query(BlockJob *job, Error **errp)
>      info = g_new0(BlockJobInfo, 1);
>      info->type      = g_strdup(job_type_str(&job->job));
>      info->device    = g_strdup(job->job.id);
> -    info->busy      = atomic_read(&job->job.busy);
> +    info->busy      = qatomic_read(&job->job.busy);
>      info->paused    = job->job.pause_count > 0;
>      info->offset    = job->job.progress.current;
>      info->len       = job->job.progress.total;
> diff --git a/contrib/libvhost-user/libvhost-user.c b/contrib/libvhost-user/libvhost-user.c
> index 9d30ff2283..05861b1419 100644
> --- a/contrib/libvhost-user/libvhost-user.c
> +++ b/contrib/libvhost-user/libvhost-user.c
> @@ -448,7 +448,7 @@ static void
>  vu_log_page(uint8_t *log_table, uint64_t page)
>  {
>      DPRINT("Logged dirty guest page: %"PRId64"\n", page);
> -    atomic_or(&log_table[page / 8], 1 << (page % 8));
> +    qatomic_or(&log_table[page / 8], 1 << (page % 8));
>  }
>  
>  static void
> diff --git a/cpus-common.c b/cpus-common.c
> index 34044f4e4c..83475efff7 100644
> --- a/cpus-common.c
> +++ b/cpus-common.c
> @@ -148,7 +148,7 @@ void do_run_on_cpu(CPUState *cpu, run_on_cpu_func func, run_on_cpu_data data,
>      wi.exclusive = false;
>  
>      queue_work_on_cpu(cpu, &wi);
> -    while (!atomic_mb_read(&wi.done)) {
> +    while (!qatomic_mb_read(&wi.done)) {
>          CPUState *self_cpu = current_cpu;
>  
>          qemu_cond_wait(&qemu_work_cond, mutex);
> @@ -188,20 +188,20 @@ void start_exclusive(void)
>      exclusive_idle();
>  
>      /* Make all other cpus stop executing.  */
> -    atomic_set(&pending_cpus, 1);
> +    qatomic_set(&pending_cpus, 1);
>  
>      /* Write pending_cpus before reading other_cpu->running.  */
>      smp_mb();
>      running_cpus = 0;
>      CPU_FOREACH(other_cpu) {
> -        if (atomic_read(&other_cpu->running)) {
> +        if (qatomic_read(&other_cpu->running)) {
>              other_cpu->has_waiter = true;
>              running_cpus++;
>              qemu_cpu_kick(other_cpu);
>          }
>      }
>  
> -    atomic_set(&pending_cpus, running_cpus + 1);
> +    qatomic_set(&pending_cpus, running_cpus + 1);
>      while (pending_cpus > 1) {
>          qemu_cond_wait(&exclusive_cond, &qemu_cpu_list_lock);
>      }
> @@ -220,7 +220,7 @@ void end_exclusive(void)
>      current_cpu->in_exclusive_context = false;
>  
>      qemu_mutex_lock(&qemu_cpu_list_lock);
> -    atomic_set(&pending_cpus, 0);
> +    qatomic_set(&pending_cpus, 0);
>      qemu_cond_broadcast(&exclusive_resume);
>      qemu_mutex_unlock(&qemu_cpu_list_lock);
>  }
> @@ -228,7 +228,7 @@ void end_exclusive(void)
>  /* Wait for exclusive ops to finish, and begin cpu execution.  */
>  void cpu_exec_start(CPUState *cpu)
>  {
> -    atomic_set(&cpu->running, true);
> +    qatomic_set(&cpu->running, true);
>  
>      /* Write cpu->running before reading pending_cpus.  */
>      smp_mb();
> @@ -246,17 +246,17 @@ void cpu_exec_start(CPUState *cpu)
>       * 3. pending_cpus == 0.  Then start_exclusive is definitely going to
>       * see cpu->running == true, and it will kick the CPU.
>       */
> -    if (unlikely(atomic_read(&pending_cpus))) {
> +    if (unlikely(qatomic_read(&pending_cpus))) {
>          QEMU_LOCK_GUARD(&qemu_cpu_list_lock);
>          if (!cpu->has_waiter) {
>              /* Not counted in pending_cpus, let the exclusive item
>               * run.  Since we have the lock, just set cpu->running to true
>               * while holding it; no need to check pending_cpus again.
>               */
> -            atomic_set(&cpu->running, false);
> +            qatomic_set(&cpu->running, false);
>              exclusive_idle();
>              /* Now pending_cpus is zero.  */
> -            atomic_set(&cpu->running, true);
> +            qatomic_set(&cpu->running, true);
>          } else {
>              /* Counted in pending_cpus, go ahead and release the
>               * waiter at cpu_exec_end.
> @@ -268,7 +268,7 @@ void cpu_exec_start(CPUState *cpu)
>  /* Mark cpu as not executing, and release pending exclusive ops.  */
>  void cpu_exec_end(CPUState *cpu)
>  {
> -    atomic_set(&cpu->running, false);
> +    qatomic_set(&cpu->running, false);
>  
>      /* Write cpu->running before reading pending_cpus.  */
>      smp_mb();
> @@ -288,11 +288,11 @@ void cpu_exec_end(CPUState *cpu)
>       * see cpu->running == false, and it can ignore this CPU until the
>       * next cpu_exec_start.
>       */
> -    if (unlikely(atomic_read(&pending_cpus))) {
> +    if (unlikely(qatomic_read(&pending_cpus))) {
>          QEMU_LOCK_GUARD(&qemu_cpu_list_lock);
>          if (cpu->has_waiter) {
>              cpu->has_waiter = false;
> -            atomic_set(&pending_cpus, pending_cpus - 1);
> +            qatomic_set(&pending_cpus, pending_cpus - 1);
>              if (pending_cpus == 1) {
>                  qemu_cond_signal(&exclusive_cond);
>              }
> @@ -346,7 +346,7 @@ void process_queued_cpu_work(CPUState *cpu)
>          if (wi->free) {
>              g_free(wi);
>          } else {
> -            atomic_mb_set(&wi->done, true);
> +            qatomic_mb_set(&wi->done, true);
>          }
>      }
>      qemu_mutex_unlock(&cpu->work_mutex);
> diff --git a/dump/dump.c b/dump/dump.c
> index 13fda440a4..45da46a952 100644
> --- a/dump/dump.c
> +++ b/dump/dump.c
> @@ -1572,7 +1572,7 @@ static void dump_state_prepare(DumpState *s)
>  bool dump_in_progress(void)
>  {
>      DumpState *state = &dump_state_global;
> -    return (atomic_read(&state->status) == DUMP_STATUS_ACTIVE);
> +    return (qatomic_read(&state->status) == DUMP_STATUS_ACTIVE);
>  }
>  
>  /* calculate total size of memory to be dumped (taking filter into
> @@ -1882,7 +1882,7 @@ static void dump_process(DumpState *s, Error **errp)
>  
>      /* make sure status is written after written_size updates */
>      smp_wmb();
> -    atomic_set(&s->status,
> +    qatomic_set(&s->status,
>                 (local_err ? DUMP_STATUS_FAILED : DUMP_STATUS_COMPLETED));
>  
>      /* send DUMP_COMPLETED message (unconditionally) */
> @@ -1908,7 +1908,7 @@ DumpQueryResult *qmp_query_dump(Error **errp)
>  {
>      DumpQueryResult *result = g_new(DumpQueryResult, 1);
>      DumpState *state = &dump_state_global;
> -    result->status = atomic_read(&state->status);
> +    result->status = qatomic_read(&state->status);
>      /* make sure we are reading status and written_size in order */
>      smp_rmb();
>      result->completed = state->written_size;
> @@ -2013,7 +2013,7 @@ void qmp_dump_guest_memory(bool paging, const char *file,
>                begin, length, &local_err);
>      if (local_err) {
>          error_propagate(errp, local_err);
> -        atomic_set(&s->status, DUMP_STATUS_FAILED);
> +        qatomic_set(&s->status, DUMP_STATUS_FAILED);
>          return;
>      }
>  
> diff --git a/exec.c b/exec.c
> index e34b602bdf..3f5deb35ff 100644
> --- a/exec.c
> +++ b/exec.c
> @@ -353,13 +353,13 @@ static MemoryRegionSection *address_space_lookup_region(AddressSpaceDispatch *d,
>                                                          hwaddr addr,
>                                                          bool resolve_subpage)
>  {
> -    MemoryRegionSection *section = atomic_read(&d->mru_section);
> +    MemoryRegionSection *section = qatomic_read(&d->mru_section);
>      subpage_t *subpage;
>  
>      if (!section || section == &d->map.sections[PHYS_SECTION_UNASSIGNED] ||
>          !section_covers_addr(section, addr)) {
>          section = phys_page_find(d, addr);
> -        atomic_set(&d->mru_section, section);
> +        qatomic_set(&d->mru_section, section);
>      }
>      if (resolve_subpage && section->mr->subpage) {
>          subpage = container_of(section->mr, subpage_t, iomem);
> @@ -695,7 +695,8 @@ address_space_translate_for_iotlb(CPUState *cpu, int asidx, hwaddr addr,
>      IOMMUMemoryRegionClass *imrc;
>      IOMMUTLBEntry iotlb;
>      int iommu_idx;
> -    AddressSpaceDispatch *d = atomic_rcu_read(&cpu->cpu_ases[asidx].memory_dispatch);
> +    AddressSpaceDispatch *d =
> +        qatomic_rcu_read(&cpu->cpu_ases[asidx].memory_dispatch);
>  
>      for (;;) {
>          section = address_space_translate_internal(d, addr, &addr, plen, false);
> @@ -1247,7 +1248,7 @@ static RAMBlock *qemu_get_ram_block(ram_addr_t addr)
>  {
>      RAMBlock *block;
>  
> -    block = atomic_rcu_read(&ram_list.mru_block);
> +    block = qatomic_rcu_read(&ram_list.mru_block);
>      if (block && addr - block->offset < block->max_length) {
>          return block;
>      }
> @@ -1273,7 +1274,7 @@ found:
>       *                                        call_rcu(reclaim_ramblock, xxx);
>       *                  rcu_read_unlock()
>       *
> -     * atomic_rcu_set is not needed here.  The block was already published
> +     * qatomic_rcu_set is not needed here.  The block was already published
>       * when it was placed into the list.  Here we're just making an extra
>       * copy of the pointer.
>       */
> @@ -1321,7 +1322,7 @@ bool cpu_physical_memory_test_and_clear_dirty(ram_addr_t start,
>      page = start_page;
>  
>      WITH_RCU_READ_LOCK_GUARD() {
> -        blocks = atomic_rcu_read(&ram_list.dirty_memory[client]);
> +        blocks = qatomic_rcu_read(&ram_list.dirty_memory[client]);
>          ramblock = qemu_get_ram_block(start);
>          /* Range sanity check on the ramblock */
>          assert(start >= ramblock->offset &&
> @@ -1371,7 +1372,7 @@ DirtyBitmapSnapshot *cpu_physical_memory_snapshot_and_clear_dirty
>      dest = 0;
>  
>      WITH_RCU_READ_LOCK_GUARD() {
> -        blocks = atomic_rcu_read(&ram_list.dirty_memory[client]);
> +        blocks = qatomic_rcu_read(&ram_list.dirty_memory[client]);
>  
>          while (page < end) {
>              unsigned long idx = page / DIRTY_MEMORY_BLOCK_SIZE;
> @@ -2207,7 +2208,7 @@ static void dirty_memory_extend(ram_addr_t old_ram_size,
>          DirtyMemoryBlocks *new_blocks;
>          int j;
>  
> -        old_blocks = atomic_rcu_read(&ram_list.dirty_memory[i]);
> +        old_blocks = qatomic_rcu_read(&ram_list.dirty_memory[i]);
>          new_blocks = g_malloc(sizeof(*new_blocks) +
>                                sizeof(new_blocks->blocks[0]) * new_num_blocks);
>  
> @@ -2220,7 +2221,7 @@ static void dirty_memory_extend(ram_addr_t old_ram_size,
>              new_blocks->blocks[j] = bitmap_new(DIRTY_MEMORY_BLOCK_SIZE);
>          }
>  
> -        atomic_rcu_set(&ram_list.dirty_memory[i], new_blocks);
> +        qatomic_rcu_set(&ram_list.dirty_memory[i], new_blocks);
>  
>          if (old_blocks) {
>              g_free_rcu(old_blocks, rcu);
> @@ -2667,7 +2668,7 @@ RAMBlock *qemu_ram_block_from_host(void *ptr, bool round_offset,
>      }
>  
>      RCU_READ_LOCK_GUARD();
> -    block = atomic_rcu_read(&ram_list.mru_block);
> +    block = qatomic_rcu_read(&ram_list.mru_block);
>      if (block && block->host && host - block->host < block->max_length) {
>          goto found;
>      }
> @@ -2912,7 +2913,7 @@ MemoryRegionSection *iotlb_to_section(CPUState *cpu,
>  {
>      int asidx = cpu_asidx_from_attrs(cpu, attrs);
>      CPUAddressSpace *cpuas = &cpu->cpu_ases[asidx];
> -    AddressSpaceDispatch *d = atomic_rcu_read(&cpuas->memory_dispatch);
> +    AddressSpaceDispatch *d = qatomic_rcu_read(&cpuas->memory_dispatch);
>      MemoryRegionSection *sections = d->map.sections;
>  
>      return &sections[index & ~TARGET_PAGE_MASK];
> @@ -2996,7 +2997,7 @@ static void tcg_commit(MemoryListener *listener)
>       * may have split the RCU critical section.
>       */
>      d = address_space_to_dispatch(cpuas->as);
> -    atomic_rcu_set(&cpuas->memory_dispatch, d);
> +    qatomic_rcu_set(&cpuas->memory_dispatch, d);
>      tlb_flush(cpuas->cpu);
>  }
>  
> @@ -3443,7 +3444,7 @@ void cpu_register_map_client(QEMUBH *bh)
>      qemu_mutex_lock(&map_client_list_lock);
>      client->bh = bh;
>      QLIST_INSERT_HEAD(&map_client_list, client, link);
> -    if (!atomic_read(&bounce.in_use)) {
> +    if (!qatomic_read(&bounce.in_use)) {
>          cpu_notify_map_clients_locked();
>      }
>      qemu_mutex_unlock(&map_client_list_lock);
> @@ -3577,7 +3578,7 @@ void *address_space_map(AddressSpace *as,
>      mr = flatview_translate(fv, addr, &xlat, &l, is_write, attrs);
>  
>      if (!memory_access_is_direct(mr, is_write)) {
> -        if (atomic_xchg(&bounce.in_use, true)) {
> +        if (qatomic_xchg(&bounce.in_use, true)) {
>              *plen = 0;
>              return NULL;
>          }
> @@ -3636,7 +3637,7 @@ void address_space_unmap(AddressSpace *as, void *buffer, hwaddr len,
>      qemu_vfree(bounce.buffer);
>      bounce.buffer = NULL;
>      memory_region_unref(bounce.mr);
> -    atomic_mb_set(&bounce.in_use, false);
> +    qatomic_mb_set(&bounce.in_use, false);
>      cpu_notify_map_clients();
>  }
>  
> @@ -4105,16 +4106,17 @@ int ram_block_discard_disable(bool state)
>      int old;
>  
>      if (!state) {
> -        atomic_dec(&ram_block_discard_disabled);
> +        qatomic_dec(&ram_block_discard_disabled);
>          return 0;
>      }
>  
>      do {
> -        old = atomic_read(&ram_block_discard_disabled);
> +        old = qatomic_read(&ram_block_discard_disabled);
>          if (old < 0) {
>              return -EBUSY;
>          }
> -    } while (atomic_cmpxchg(&ram_block_discard_disabled, old, old + 1) != old);
> +    } while (qatomic_cmpxchg(&ram_block_discard_disabled,
> +                             old, old + 1) != old);
>      return 0;
>  }
>  
> @@ -4123,27 +4125,28 @@ int ram_block_discard_require(bool state)
>      int old;
>  
>      if (!state) {
> -        atomic_inc(&ram_block_discard_disabled);
> +        qatomic_inc(&ram_block_discard_disabled);
>          return 0;
>      }
>  
>      do {
> -        old = atomic_read(&ram_block_discard_disabled);
> +        old = qatomic_read(&ram_block_discard_disabled);
>          if (old > 0) {
>              return -EBUSY;
>          }
> -    } while (atomic_cmpxchg(&ram_block_discard_disabled, old, old - 1) != old);
> +    } while (qatomic_cmpxchg(&ram_block_discard_disabled,
> +                             old, old - 1) != old);
>      return 0;
>  }
>  
>  bool ram_block_discard_is_disabled(void)
>  {
> -    return atomic_read(&ram_block_discard_disabled) > 0;
> +    return qatomic_read(&ram_block_discard_disabled) > 0;
>  }
>  
>  bool ram_block_discard_is_required(void)
>  {
> -    return atomic_read(&ram_block_discard_disabled) < 0;
> +    return qatomic_read(&ram_block_discard_disabled) < 0;
>  }
>  
>  #endif
> diff --git a/hw/core/cpu.c b/hw/core/cpu.c
> index 8f65383ffb..c55c09f734 100644
> --- a/hw/core/cpu.c
> +++ b/hw/core/cpu.c
> @@ -111,10 +111,10 @@ void cpu_reset_interrupt(CPUState *cpu, int mask)
>  
>  void cpu_exit(CPUState *cpu)
>  {
> -    atomic_set(&cpu->exit_request, 1);
> +    qatomic_set(&cpu->exit_request, 1);
>      /* Ensure cpu_exec will see the exit request after TCG has exited.  */
>      smp_wmb();
> -    atomic_set(&cpu->icount_decr_ptr->u16.high, -1);
> +    qatomic_set(&cpu->icount_decr_ptr->u16.high, -1);
>  }
>  
>  int cpu_write_elf32_qemunote(WriteCoreDumpFunction f, CPUState *cpu,
> @@ -261,7 +261,7 @@ static void cpu_common_reset(DeviceState *dev)
>      cpu->halted = cpu->start_powered_off;
>      cpu->mem_io_pc = 0;
>      cpu->icount_extra = 0;
> -    atomic_set(&cpu->icount_decr_ptr->u32, 0);
> +    qatomic_set(&cpu->icount_decr_ptr->u32, 0);
>      cpu->can_do_io = 1;
>      cpu->exception_index = -1;
>      cpu->crash_occurred = false;
> diff --git a/hw/display/qxl.c b/hw/display/qxl.c
> index 11871340e7..431c107096 100644
> --- a/hw/display/qxl.c
> +++ b/hw/display/qxl.c
> @@ -1908,7 +1908,7 @@ static void qxl_send_events(PCIQXLDevice *d, uint32_t events)
>      /*
>       * Older versions of Spice forgot to define the QXLRam struct
>       * with the '__aligned__(4)' attribute. clang 7 and newer will
> -     * thus warn that atomic_fetch_or(&d->ram->int_pending, ...)
> +     * thus warn that qatomic_fetch_or(&d->ram->int_pending, ...)
>       * might be a misaligned atomic access, and will generate an
>       * out-of-line call for it, which results in a link error since
>       * we don't currently link against libatomic.
> @@ -1928,7 +1928,7 @@ static void qxl_send_events(PCIQXLDevice *d, uint32_t events)
>  #define ALIGNED_UINT32_PTR(P) ((uint32_t *)P)
>  #endif
>  
> -    old_pending = atomic_fetch_or(ALIGNED_UINT32_PTR(&d->ram->int_pending),
> +    old_pending = qatomic_fetch_or(ALIGNED_UINT32_PTR(&d->ram->int_pending),
>                                    le_events);
>      if ((old_pending & le_events) == le_events) {
>          return;
> diff --git a/hw/hyperv/hyperv.c b/hw/hyperv/hyperv.c
> index 4b26db1365..cb1074f234 100644
> --- a/hw/hyperv/hyperv.c
> +++ b/hw/hyperv/hyperv.c
> @@ -231,7 +231,7 @@ static void sint_msg_bh(void *opaque)
>      HvSintRoute *sint_route = opaque;
>      HvSintStagedMessage *staged_msg = sint_route->staged_msg;
>  
> -    if (atomic_read(&staged_msg->state) != HV_STAGED_MSG_POSTED) {
> +    if (qatomic_read(&staged_msg->state) != HV_STAGED_MSG_POSTED) {
>          /* status nor ready yet (spurious ack from guest?), ignore */
>          return;
>      }
> @@ -240,7 +240,7 @@ static void sint_msg_bh(void *opaque)
>      staged_msg->status = 0;
>  
>      /* staged message processing finished, ready to start over */
> -    atomic_set(&staged_msg->state, HV_STAGED_MSG_FREE);
> +    qatomic_set(&staged_msg->state, HV_STAGED_MSG_FREE);
>      /* drop the reference taken in hyperv_post_msg */
>      hyperv_sint_route_unref(sint_route);
>  }
> @@ -278,7 +278,7 @@ static void cpu_post_msg(CPUState *cs, run_on_cpu_data data)
>      memory_region_set_dirty(&synic->msg_page_mr, 0, sizeof(*synic->msg_page));
>  
>  posted:
> -    atomic_set(&staged_msg->state, HV_STAGED_MSG_POSTED);
> +    qatomic_set(&staged_msg->state, HV_STAGED_MSG_POSTED);
>      /*
>       * Notify the msg originator of the progress made; if the slot was busy we
>       * set msg_pending flag in it so it will be the guest who will do EOM and
> @@ -301,7 +301,7 @@ int hyperv_post_msg(HvSintRoute *sint_route, struct hyperv_message *src_msg)
>      assert(staged_msg);
>  
>      /* grab the staging area */
> -    if (atomic_cmpxchg(&staged_msg->state, HV_STAGED_MSG_FREE,
> +    if (qatomic_cmpxchg(&staged_msg->state, HV_STAGED_MSG_FREE,
>                         HV_STAGED_MSG_BUSY) != HV_STAGED_MSG_FREE) {
>          return -EAGAIN;
>      }
> @@ -351,7 +351,7 @@ int hyperv_set_event_flag(HvSintRoute *sint_route, unsigned eventno)
>      set_mask = BIT_MASK(eventno);
>      flags = synic->event_page->slot[sint_route->sint].flags;
>  
> -    if ((atomic_fetch_or(&flags[set_idx], set_mask) & set_mask) != set_mask) {
> +    if ((qatomic_fetch_or(&flags[set_idx], set_mask) & set_mask) != set_mask) {
>          memory_region_set_dirty(&synic->event_page_mr, 0,
>                                  sizeof(*synic->event_page));
>          ret = hyperv_sint_route_set_sint(sint_route);
> diff --git a/hw/hyperv/vmbus.c b/hw/hyperv/vmbus.c
> index 6ef895bc35..896e981f85 100644
> --- a/hw/hyperv/vmbus.c
> +++ b/hw/hyperv/vmbus.c
> @@ -747,7 +747,7 @@ static int vmbus_channel_notify_guest(VMBusChannel *chan)
>  
>      idx = BIT_WORD(chan->id);
>      mask = BIT_MASK(chan->id);
> -    if ((atomic_fetch_or(&int_map[idx], mask) & mask) != mask) {
> +    if ((qatomic_fetch_or(&int_map[idx], mask) & mask) != mask) {
>          res = hyperv_sint_route_set_sint(chan->notify_route);
>          dirty = len;
>      }
> diff --git a/hw/i386/xen/xen-hvm.c b/hw/i386/xen/xen-hvm.c
> index cde981bad6..a39a648ca6 100644
> --- a/hw/i386/xen/xen-hvm.c
> +++ b/hw/i386/xen/xen-hvm.c
> @@ -1140,7 +1140,7 @@ static int handle_buffered_iopage(XenIOState *state)
>          assert(req.dir == IOREQ_WRITE);
>          assert(!req.data_is_ptr);
>  
> -        atomic_add(&buf_page->read_pointer, qw + 1);
> +        qatomic_add(&buf_page->read_pointer, qw + 1);
>      }
>  
>      return req.count;
> diff --git a/hw/intc/rx_icu.c b/hw/intc/rx_icu.c
> index df4b6a8d22..94e17a9dea 100644
> --- a/hw/intc/rx_icu.c
> +++ b/hw/intc/rx_icu.c
> @@ -81,8 +81,8 @@ static void rxicu_request(RXICUState *icu, int n_IRQ)
>      int enable;
>  
>      enable = icu->ier[n_IRQ / 8] & (1 << (n_IRQ & 7));
> -    if (n_IRQ > 0 && enable != 0 && atomic_read(&icu->req_irq) < 0) {
> -        atomic_set(&icu->req_irq, n_IRQ);
> +    if (n_IRQ > 0 && enable != 0 && qatomic_read(&icu->req_irq) < 0) {
> +        qatomic_set(&icu->req_irq, n_IRQ);
>          set_irq(icu, n_IRQ, rxicu_level(icu, n_IRQ));
>      }
>  }
> @@ -124,10 +124,10 @@ static void rxicu_set_irq(void *opaque, int n_IRQ, int level)
>      }
>      if (issue == 0 && src->sense == TRG_LEVEL) {
>          icu->ir[n_IRQ] = 0;
> -        if (atomic_read(&icu->req_irq) == n_IRQ) {
> +        if (qatomic_read(&icu->req_irq) == n_IRQ) {
>              /* clear request */
>              set_irq(icu, n_IRQ, 0);
> -            atomic_set(&icu->req_irq, -1);
> +            qatomic_set(&icu->req_irq, -1);
>          }
>          return;
>      }
> @@ -144,11 +144,11 @@ static void rxicu_ack_irq(void *opaque, int no, int level)
>      int n_IRQ;
>      int max_pri;
>  
> -    n_IRQ = atomic_read(&icu->req_irq);
> +    n_IRQ = qatomic_read(&icu->req_irq);
>      if (n_IRQ < 0) {
>          return;
>      }
> -    atomic_set(&icu->req_irq, -1);
> +    qatomic_set(&icu->req_irq, -1);
>      if (icu->src[n_IRQ].sense != TRG_LEVEL) {
>          icu->ir[n_IRQ] = 0;
>      }
> diff --git a/hw/intc/sifive_plic.c b/hw/intc/sifive_plic.c
> index af611f8db8..f42fd695d8 100644
> --- a/hw/intc/sifive_plic.c
> +++ b/hw/intc/sifive_plic.c
> @@ -89,12 +89,12 @@ static void sifive_plic_print_state(SiFivePLICState *plic)
>  
>  static uint32_t atomic_set_masked(uint32_t *a, uint32_t mask, uint32_t value)
>  {
> -    uint32_t old, new, cmp = atomic_read(a);
> +    uint32_t old, new, cmp = qatomic_read(a);
>  
>      do {
>          old = cmp;
>          new = (old & ~mask) | (value & mask);
> -        cmp = atomic_cmpxchg(a, old, new);
> +        cmp = qatomic_cmpxchg(a, old, new);
>      } while (old != cmp);
>  
>      return old;
> diff --git a/hw/misc/edu.c b/hw/misc/edu.c
> index 0ff9d1ac78..e935c418d4 100644
> --- a/hw/misc/edu.c
> +++ b/hw/misc/edu.c
> @@ -212,7 +212,7 @@ static uint64_t edu_mmio_read(void *opaque, hwaddr addr, unsigned size)
>          qemu_mutex_unlock(&edu->thr_mutex);
>          break;
>      case 0x20:
> -        val = atomic_read(&edu->status);
> +        val = qatomic_read(&edu->status);
>          break;
>      case 0x24:
>          val = edu->irq_status;
> @@ -252,7 +252,7 @@ static void edu_mmio_write(void *opaque, hwaddr addr, uint64_t val,
>          edu->addr4 = ~val;
>          break;
>      case 0x08:
> -        if (atomic_read(&edu->status) & EDU_STATUS_COMPUTING) {
> +        if (qatomic_read(&edu->status) & EDU_STATUS_COMPUTING) {
>              break;
>          }
>          /* EDU_STATUS_COMPUTING cannot go 0->1 concurrently, because it is only
> @@ -260,15 +260,15 @@ static void edu_mmio_write(void *opaque, hwaddr addr, uint64_t val,
>           */
>          qemu_mutex_lock(&edu->thr_mutex);
>          edu->fact = val;
> -        atomic_or(&edu->status, EDU_STATUS_COMPUTING);
> +        qatomic_or(&edu->status, EDU_STATUS_COMPUTING);
>          qemu_cond_signal(&edu->thr_cond);
>          qemu_mutex_unlock(&edu->thr_mutex);
>          break;
>      case 0x20:
>          if (val & EDU_STATUS_IRQFACT) {
> -            atomic_or(&edu->status, EDU_STATUS_IRQFACT);
> +            qatomic_or(&edu->status, EDU_STATUS_IRQFACT);
>          } else {
> -            atomic_and(&edu->status, ~EDU_STATUS_IRQFACT);
> +            qatomic_and(&edu->status, ~EDU_STATUS_IRQFACT);
>          }
>          break;
>      case 0x60:
> @@ -322,7 +322,7 @@ static void *edu_fact_thread(void *opaque)
>          uint32_t val, ret = 1;
>  
>          qemu_mutex_lock(&edu->thr_mutex);
> -        while ((atomic_read(&edu->status) & EDU_STATUS_COMPUTING) == 0 &&
> +        while ((qatomic_read(&edu->status) & EDU_STATUS_COMPUTING) == 0 &&
>                          !edu->stopping) {
>              qemu_cond_wait(&edu->thr_cond, &edu->thr_mutex);
>          }
> @@ -347,9 +347,9 @@ static void *edu_fact_thread(void *opaque)
>          qemu_mutex_lock(&edu->thr_mutex);
>          edu->fact = ret;
>          qemu_mutex_unlock(&edu->thr_mutex);
> -        atomic_and(&edu->status, ~EDU_STATUS_COMPUTING);
> +        qatomic_and(&edu->status, ~EDU_STATUS_COMPUTING);
>  
> -        if (atomic_read(&edu->status) & EDU_STATUS_IRQFACT) {
> +        if (qatomic_read(&edu->status) & EDU_STATUS_IRQFACT) {
>              qemu_mutex_lock_iothread();
>              edu_raise_irq(edu, FACT_IRQ);
>              qemu_mutex_unlock_iothread();
> diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
> index cb0d27084c..7bf27b9db7 100644
> --- a/hw/net/virtio-net.c
> +++ b/hw/net/virtio-net.c
> @@ -933,7 +933,7 @@ static void virtio_net_set_features(VirtIODevice *vdev, uint64_t features)
>  
>      if (virtio_has_feature(features, VIRTIO_NET_F_STANDBY)) {
>          qapi_event_send_failover_negotiated(n->netclient_name);
> -        atomic_set(&n->primary_should_be_hidden, false);
> +        qatomic_set(&n->primary_should_be_hidden, false);
>          failover_add_primary(n, &err);
>          if (err) {
>              n->primary_dev = virtio_connect_failover_devices(n, n->qdev, &err);
> @@ -3168,7 +3168,7 @@ static void virtio_net_handle_migration_primary(VirtIONet *n,
>      bool should_be_hidden;
>      Error *err = NULL;
>  
> -    should_be_hidden = atomic_read(&n->primary_should_be_hidden);
> +    should_be_hidden = qatomic_read(&n->primary_should_be_hidden);
>  
>      if (!n->primary_dev) {
>          n->primary_dev = virtio_connect_failover_devices(n, n->qdev, &err);
> @@ -3183,7 +3183,7 @@ static void virtio_net_handle_migration_primary(VirtIONet *n,
>                      qdev_get_vmsd(n->primary_dev),
>                      n->primary_dev);
>              qapi_event_send_unplug_primary(n->primary_device_id);
> -            atomic_set(&n->primary_should_be_hidden, true);
> +            qatomic_set(&n->primary_should_be_hidden, true);
>          } else {
>              warn_report("couldn't unplug primary device");
>          }
> @@ -3234,7 +3234,7 @@ static int virtio_net_primary_should_be_hidden(DeviceListener *listener,
>      n->primary_device_opts = device_opts;
>  
>      /* primary_should_be_hidden is set during feature negotiation */
> -    hide = atomic_read(&n->primary_should_be_hidden);
> +    hide = qatomic_read(&n->primary_should_be_hidden);
>  
>      if (n->primary_device_dict) {
>          g_free(n->primary_device_id);
> @@ -3291,7 +3291,7 @@ static void virtio_net_device_realize(DeviceState *dev, Error **errp)
>      if (n->failover) {
>          n->primary_listener.should_be_hidden =
>              virtio_net_primary_should_be_hidden;
> -        atomic_set(&n->primary_should_be_hidden, true);
> +        qatomic_set(&n->primary_should_be_hidden, true);
>          device_listener_register(&n->primary_listener);
>          n->migration_state.notify = virtio_net_migration_state_notifier;
>          add_migration_state_change_notifier(&n->migration_state);
> diff --git a/hw/rdma/rdma_backend.c b/hw/rdma/rdma_backend.c
> index db7e5c8be5..5de010b1fa 100644
> --- a/hw/rdma/rdma_backend.c
> +++ b/hw/rdma/rdma_backend.c
> @@ -68,7 +68,7 @@ static void free_cqe_ctx(gpointer data, gpointer user_data)
>      bctx = rdma_rm_get_cqe_ctx(rdma_dev_res, cqe_ctx_id);
>      if (bctx) {
>          rdma_rm_dealloc_cqe_ctx(rdma_dev_res, cqe_ctx_id);
> -        atomic_dec(&rdma_dev_res->stats.missing_cqe);
> +        qatomic_dec(&rdma_dev_res->stats.missing_cqe);
>      }
>      g_free(bctx);
>  }
> @@ -81,7 +81,7 @@ static void clean_recv_mads(RdmaBackendDev *backend_dev)
>          cqe_ctx_id = rdma_protected_qlist_pop_int64(&backend_dev->
>                                                      recv_mads_list);
>          if (cqe_ctx_id != -ENOENT) {
> -            atomic_inc(&backend_dev->rdma_dev_res->stats.missing_cqe);
> +            qatomic_inc(&backend_dev->rdma_dev_res->stats.missing_cqe);
>              free_cqe_ctx(GINT_TO_POINTER(cqe_ctx_id),
>                           backend_dev->rdma_dev_res);
>          }
> @@ -123,7 +123,7 @@ static int rdma_poll_cq(RdmaDeviceResources *rdma_dev_res, struct ibv_cq *ibcq)
>              }
>              total_ne += ne;
>          } while (ne > 0);
> -        atomic_sub(&rdma_dev_res->stats.missing_cqe, total_ne);
> +        qatomic_sub(&rdma_dev_res->stats.missing_cqe, total_ne);
>      }
>  
>      if (ne < 0) {
> @@ -195,17 +195,17 @@ static void *comp_handler_thread(void *arg)
>  
>  static inline void disable_rdmacm_mux_async(RdmaBackendDev *backend_dev)
>  {
> -    atomic_set(&backend_dev->rdmacm_mux.can_receive, 0);
> +    qatomic_set(&backend_dev->rdmacm_mux.can_receive, 0);
>  }
>  
>  static inline void enable_rdmacm_mux_async(RdmaBackendDev *backend_dev)
>  {
> -    atomic_set(&backend_dev->rdmacm_mux.can_receive, sizeof(RdmaCmMuxMsg));
> +    qatomic_set(&backend_dev->rdmacm_mux.can_receive, sizeof(RdmaCmMuxMsg));
>  }
>  
>  static inline int rdmacm_mux_can_process_async(RdmaBackendDev *backend_dev)
>  {
> -    return atomic_read(&backend_dev->rdmacm_mux.can_receive);
> +    return qatomic_read(&backend_dev->rdmacm_mux.can_receive);
>  }
>  
>  static int rdmacm_mux_check_op_status(CharBackend *mad_chr_be)
> @@ -555,7 +555,7 @@ void rdma_backend_post_send(RdmaBackendDev *backend_dev,
>          goto err_dealloc_cqe_ctx;
>      }
>  
> -    atomic_inc(&backend_dev->rdma_dev_res->stats.missing_cqe);
> +    qatomic_inc(&backend_dev->rdma_dev_res->stats.missing_cqe);
>      backend_dev->rdma_dev_res->stats.tx++;
>  
>      return;
> @@ -658,7 +658,7 @@ void rdma_backend_post_recv(RdmaBackendDev *backend_dev,
>          goto err_dealloc_cqe_ctx;
>      }
>  
> -    atomic_inc(&backend_dev->rdma_dev_res->stats.missing_cqe);
> +    qatomic_inc(&backend_dev->rdma_dev_res->stats.missing_cqe);
>      backend_dev->rdma_dev_res->stats.rx_bufs++;
>  
>      return;
> @@ -710,7 +710,7 @@ void rdma_backend_post_srq_recv(RdmaBackendDev *backend_dev,
>          goto err_dealloc_cqe_ctx;
>      }
>  
> -    atomic_inc(&backend_dev->rdma_dev_res->stats.missing_cqe);
> +    qatomic_inc(&backend_dev->rdma_dev_res->stats.missing_cqe);
>      backend_dev->rdma_dev_res->stats.rx_bufs++;
>      backend_dev->rdma_dev_res->stats.rx_srq++;
>  
> diff --git a/hw/rdma/rdma_rm.c b/hw/rdma/rdma_rm.c
> index 60957f88db..49141d4074 100644
> --- a/hw/rdma/rdma_rm.c
> +++ b/hw/rdma/rdma_rm.c
> @@ -790,7 +790,7 @@ int rdma_rm_init(RdmaDeviceResources *dev_res, struct ibv_device_attr *dev_attr)
>      qemu_mutex_init(&dev_res->lock);
>  
>      memset(&dev_res->stats, 0, sizeof(dev_res->stats));
> -    atomic_set(&dev_res->stats.missing_cqe, 0);
> +    qatomic_set(&dev_res->stats.missing_cqe, 0);
>  
>      return 0;
>  }
> diff --git a/hw/rdma/vmw/pvrdma_dev_ring.c b/hw/rdma/vmw/pvrdma_dev_ring.c
> index c122fe7035..f0bcde74b0 100644
> --- a/hw/rdma/vmw/pvrdma_dev_ring.c
> +++ b/hw/rdma/vmw/pvrdma_dev_ring.c
> @@ -38,8 +38,8 @@ int pvrdma_ring_init(PvrdmaRing *ring, const char *name, PCIDevice *dev,
>      ring->max_elems = max_elems;
>      ring->elem_sz = elem_sz;
>      /* TODO: Give a moment to think if we want to redo driver settings
> -    atomic_set(&ring->ring_state->prod_tail, 0);
> -    atomic_set(&ring->ring_state->cons_head, 0);
> +    qatomic_set(&ring->ring_state->prod_tail, 0);
> +    qatomic_set(&ring->ring_state->cons_head, 0);
>      */
>      ring->npages = npages;
>      ring->pages = g_malloc(npages * sizeof(void *));
> diff --git a/hw/s390x/s390-pci-bus.c b/hw/s390x/s390-pci-bus.c
> index 92146a2119..fb4cee87a4 100644
> --- a/hw/s390x/s390-pci-bus.c
> +++ b/hw/s390x/s390-pci-bus.c
> @@ -650,7 +650,7 @@ static uint8_t set_ind_atomic(uint64_t ind_loc, uint8_t to_be_set)
>      actual = *ind_addr;
>      do {
>          expected = actual;
> -        actual = atomic_cmpxchg(ind_addr, expected, expected | to_be_set);
> +        actual = qatomic_cmpxchg(ind_addr, expected, expected | to_be_set);
>      } while (actual != expected);
>      cpu_physical_memory_unmap((void *)ind_addr, len, 1, len);
>  
> diff --git a/hw/s390x/virtio-ccw.c b/hw/s390x/virtio-ccw.c
> index 8feb3451a0..8d140dc50f 100644
> --- a/hw/s390x/virtio-ccw.c
> +++ b/hw/s390x/virtio-ccw.c
> @@ -800,7 +800,7 @@ static uint8_t virtio_set_ind_atomic(SubchDev *sch, uint64_t ind_loc,
>      actual = *ind_addr;
>      do {
>          expected = actual;
> -        actual = atomic_cmpxchg(ind_addr, expected, expected | to_be_set);
> +        actual = qatomic_cmpxchg(ind_addr, expected, expected | to_be_set);
>      } while (actual != expected);
>      trace_virtio_ccw_set_ind(ind_loc, actual, actual | to_be_set);
>      cpu_physical_memory_unmap((void *)ind_addr, len, 1, len);
> diff --git a/hw/virtio/vhost.c b/hw/virtio/vhost.c
> index 1a1384e7a6..0119516254 100644
> --- a/hw/virtio/vhost.c
> +++ b/hw/virtio/vhost.c
> @@ -90,7 +90,7 @@ static void vhost_dev_sync_region(struct vhost_dev *dev,
>          }
>          /* Data must be read atomically. We don't really need barrier semantics
>           * but it's easier to use atomic_* than roll our own. */
> -        log = atomic_xchg(from, 0);
> +        log = qatomic_xchg(from, 0);
>          while (log) {
>              int bit = ctzl(log);
>              hwaddr page_addr;
> diff --git a/hw/virtio/virtio-mmio.c b/hw/virtio/virtio-mmio.c
> index f12d1595aa..e1b5c3b81e 100644
> --- a/hw/virtio/virtio-mmio.c
> +++ b/hw/virtio/virtio-mmio.c
> @@ -179,7 +179,7 @@ static uint64_t virtio_mmio_read(void *opaque, hwaddr offset, unsigned size)
>          }
>          return proxy->vqs[vdev->queue_sel].enabled;
>      case VIRTIO_MMIO_INTERRUPT_STATUS:
> -        return atomic_read(&vdev->isr);
> +        return qatomic_read(&vdev->isr);
>      case VIRTIO_MMIO_STATUS:
>          return vdev->status;
>      case VIRTIO_MMIO_CONFIG_GENERATION:
> @@ -370,7 +370,7 @@ static void virtio_mmio_write(void *opaque, hwaddr offset, uint64_t value,
>          }
>          break;
>      case VIRTIO_MMIO_INTERRUPT_ACK:
> -        atomic_and(&vdev->isr, ~value);
> +        qatomic_and(&vdev->isr, ~value);
>          virtio_update_irq(vdev);
>          break;
>      case VIRTIO_MMIO_STATUS:
> @@ -496,7 +496,7 @@ static void virtio_mmio_update_irq(DeviceState *opaque, uint16_t vector)
>      if (!vdev) {
>          return;
>      }
> -    level = (atomic_read(&vdev->isr) != 0);
> +    level = (qatomic_read(&vdev->isr) != 0);
>      trace_virtio_mmio_setting_irq(level);
>      qemu_set_irq(proxy->irq, level);
>  }
> diff --git a/hw/virtio/virtio-pci.c b/hw/virtio/virtio-pci.c
> index 5bc769f685..02790e3237 100644
> --- a/hw/virtio/virtio-pci.c
> +++ b/hw/virtio/virtio-pci.c
> @@ -72,7 +72,7 @@ static void virtio_pci_notify(DeviceState *d, uint16_t vector)
>          msix_notify(&proxy->pci_dev, vector);
>      else {
>          VirtIODevice *vdev = virtio_bus_get_device(&proxy->bus);
> -        pci_set_irq(&proxy->pci_dev, atomic_read(&vdev->isr) & 1);
> +        pci_set_irq(&proxy->pci_dev, qatomic_read(&vdev->isr) & 1);
>      }
>  }
>  
> @@ -398,7 +398,7 @@ static uint32_t virtio_ioport_read(VirtIOPCIProxy *proxy, uint32_t addr)
>          break;
>      case VIRTIO_PCI_ISR:
>          /* reading from the ISR also clears it. */
> -        ret = atomic_xchg(&vdev->isr, 0);
> +        ret = qatomic_xchg(&vdev->isr, 0);
>          pci_irq_deassert(&proxy->pci_dev);
>          break;
>      case VIRTIO_MSI_CONFIG_VECTOR:
> @@ -1362,7 +1362,7 @@ static uint64_t virtio_pci_isr_read(void *opaque, hwaddr addr,
>  {
>      VirtIOPCIProxy *proxy = opaque;
>      VirtIODevice *vdev = virtio_bus_get_device(&proxy->bus);
> -    uint64_t val = atomic_xchg(&vdev->isr, 0);
> +    uint64_t val = qatomic_xchg(&vdev->isr, 0);
>      pci_irq_deassert(&proxy->pci_dev);
>  
>      return val;
> diff --git a/hw/virtio/virtio.c b/hw/virtio/virtio.c
> index e983025217..3a3d012d9f 100644
> --- a/hw/virtio/virtio.c
> +++ b/hw/virtio/virtio.c
> @@ -149,8 +149,8 @@ static void virtio_virtqueue_reset_region_cache(struct VirtQueue *vq)
>  {
>      VRingMemoryRegionCaches *caches;
>  
> -    caches = atomic_read(&vq->vring.caches);
> -    atomic_rcu_set(&vq->vring.caches, NULL);
> +    caches = qatomic_read(&vq->vring.caches);
> +    qatomic_rcu_set(&vq->vring.caches, NULL);
>      if (caches) {
>          call_rcu(caches, virtio_free_region_cache, rcu);
>      }
> @@ -197,7 +197,7 @@ static void virtio_init_region_cache(VirtIODevice *vdev, int n)
>          goto err_avail;
>      }
>  
> -    atomic_rcu_set(&vq->vring.caches, new);
> +    qatomic_rcu_set(&vq->vring.caches, new);
>      if (old) {
>          call_rcu(old, virtio_free_region_cache, rcu);
>      }
> @@ -283,7 +283,7 @@ static void vring_packed_flags_write(VirtIODevice *vdev,
>  /* Called within rcu_read_lock().  */
>  static VRingMemoryRegionCaches *vring_get_region_caches(struct VirtQueue *vq)
>  {
> -    return atomic_rcu_read(&vq->vring.caches);
> +    return qatomic_rcu_read(&vq->vring.caches);
>  }
>  
>  /* Called within rcu_read_lock().  */
> @@ -2007,7 +2007,7 @@ void virtio_reset(void *opaque)
>      vdev->queue_sel = 0;
>      vdev->status = 0;
>      vdev->disabled = false;
> -    atomic_set(&vdev->isr, 0);
> +    qatomic_set(&vdev->isr, 0);
>      vdev->config_vector = VIRTIO_NO_VECTOR;
>      virtio_notify_vector(vdev, vdev->config_vector);
>  
> @@ -2439,13 +2439,13 @@ void virtio_del_queue(VirtIODevice *vdev, int n)
>  
>  static void virtio_set_isr(VirtIODevice *vdev, int value)
>  {
> -    uint8_t old = atomic_read(&vdev->isr);
> +    uint8_t old = qatomic_read(&vdev->isr);
>  
>      /* Do not write ISR if it does not change, so that its cacheline remains
>       * shared in the common case where the guest does not read it.
>       */
>      if ((old & value) != value) {
> -        atomic_or(&vdev->isr, value);
> +        qatomic_or(&vdev->isr, value);
>      }
>  }
>  
> @@ -3254,7 +3254,7 @@ void virtio_init(VirtIODevice *vdev, const char *name,
>      vdev->started = false;
>      vdev->device_id = device_id;
>      vdev->status = 0;
> -    atomic_set(&vdev->isr, 0);
> +    qatomic_set(&vdev->isr, 0);
>      vdev->queue_sel = 0;
>      vdev->config_vector = VIRTIO_NO_VECTOR;
>      vdev->vq = g_malloc0(sizeof(VirtQueue) * VIRTIO_QUEUE_MAX);
> diff --git a/hw/xtensa/pic_cpu.c b/hw/xtensa/pic_cpu.c
> index 1d5982a9e4..6c9447565d 100644
> --- a/hw/xtensa/pic_cpu.c
> +++ b/hw/xtensa/pic_cpu.c
> @@ -72,9 +72,9 @@ static void xtensa_set_irq(void *opaque, int irq, int active)
>          uint32_t irq_bit = 1 << irq;
>  
>          if (active) {
> -            atomic_or(&env->sregs[INTSET], irq_bit);
> +            qatomic_or(&env->sregs[INTSET], irq_bit);
>          } else if (env->config->interrupt[irq].inttype == INTTYPE_LEVEL) {
> -            atomic_and(&env->sregs[INTSET], ~irq_bit);
> +            qatomic_and(&env->sregs[INTSET], ~irq_bit);
>          }
>  
>          check_interrupts(env);
> diff --git a/iothread.c b/iothread.c
> index 3a3860a09c..69eff9efbc 100644
> --- a/iothread.c
> +++ b/iothread.c
> @@ -76,7 +76,7 @@ static void *iothread_run(void *opaque)
>           * We must check the running state again in case it was
>           * changed in previous aio_poll()
>           */
> -        if (iothread->running && atomic_read(&iothread->run_gcontext)) {
> +        if (iothread->running && qatomic_read(&iothread->run_gcontext)) {
>              g_main_loop_run(iothread->main_loop);
>          }
>      }
> @@ -116,7 +116,7 @@ static void iothread_instance_init(Object *obj)
>      iothread->thread_id = -1;
>      qemu_sem_init(&iothread->init_done_sem, 0);
>      /* By default, we don't run gcontext */
> -    atomic_set(&iothread->run_gcontext, 0);
> +    qatomic_set(&iothread->run_gcontext, 0);
>  }
>  
>  static void iothread_instance_finalize(Object *obj)
> @@ -348,7 +348,7 @@ IOThreadInfoList *qmp_query_iothreads(Error **errp)
>  
>  GMainContext *iothread_get_g_main_context(IOThread *iothread)
>  {
> -    atomic_set(&iothread->run_gcontext, 1);
> +    qatomic_set(&iothread->run_gcontext, 1);
>      aio_notify(iothread->ctx);
>      return iothread->worker_context;
>  }
> diff --git a/linux-user/hppa/cpu_loop.c b/linux-user/hppa/cpu_loop.c
> index 9915456a1d..d7e1ec7722 100644
> --- a/linux-user/hppa/cpu_loop.c
> +++ b/linux-user/hppa/cpu_loop.c
> @@ -39,7 +39,7 @@ static abi_ulong hppa_lws(CPUHPPAState *env)
>          }
>          old = tswap32(old);
>          new = tswap32(new);
> -        ret = atomic_cmpxchg((uint32_t *)g2h(addr), old, new);
> +        ret = qatomic_cmpxchg((uint32_t *)g2h(addr), old, new);
>          ret = tswap32(ret);
>          break;
>  
> @@ -60,19 +60,19 @@ static abi_ulong hppa_lws(CPUHPPAState *env)
>          case 0:
>              old = *(uint8_t *)g2h(old);
>              new = *(uint8_t *)g2h(new);
> -            ret = atomic_cmpxchg((uint8_t *)g2h(addr), old, new);
> +            ret = qatomic_cmpxchg((uint8_t *)g2h(addr), old, new);
>              ret = ret != old;
>              break;
>          case 1:
>              old = *(uint16_t *)g2h(old);
>              new = *(uint16_t *)g2h(new);
> -            ret = atomic_cmpxchg((uint16_t *)g2h(addr), old, new);
> +            ret = qatomic_cmpxchg((uint16_t *)g2h(addr), old, new);
>              ret = ret != old;
>              break;
>          case 2:
>              old = *(uint32_t *)g2h(old);
>              new = *(uint32_t *)g2h(new);
> -            ret = atomic_cmpxchg((uint32_t *)g2h(addr), old, new);
> +            ret = qatomic_cmpxchg((uint32_t *)g2h(addr), old, new);
>              ret = ret != old;
>              break;
>          case 3:
> @@ -81,7 +81,8 @@ static abi_ulong hppa_lws(CPUHPPAState *env)
>                  o64 = *(uint64_t *)g2h(old);
>                  n64 = *(uint64_t *)g2h(new);
>  #ifdef CONFIG_ATOMIC64
> -                r64 = atomic_cmpxchg__nocheck((uint64_t *)g2h(addr), o64, n64);
> +                r64 = qatomic_cmpxchg__nocheck((uint64_t *)g2h(addr),
> +                                               o64, n64);
>                  ret = r64 != o64;
>  #else
>                  start_exclusive();
> diff --git a/linux-user/signal.c b/linux-user/signal.c
> index 8cf51ffecd..73de934c65 100644
> --- a/linux-user/signal.c
> +++ b/linux-user/signal.c
> @@ -195,7 +195,7 @@ int block_signals(void)
>      sigfillset(&set);
>      sigprocmask(SIG_SETMASK, &set, 0);
>  
> -    return atomic_xchg(&ts->signal_pending, 1);
> +    return qatomic_xchg(&ts->signal_pending, 1);
>  }
>  
>  /* Wrapper for sigprocmask function
> @@ -688,7 +688,7 @@ int queue_signal(CPUArchState *env, int sig, int si_type,
>      ts->sync_signal.info = *info;
>      ts->sync_signal.pending = sig;
>      /* signal that a new signal is pending */
> -    atomic_set(&ts->signal_pending, 1);
> +    qatomic_set(&ts->signal_pending, 1);
>      return 1; /* indicates that the signal was queued */
>  }
>  
> @@ -1005,7 +1005,7 @@ void process_pending_signals(CPUArchState *cpu_env)
>      sigset_t set;
>      sigset_t *blocked_set;
>  
> -    while (atomic_read(&ts->signal_pending)) {
> +    while (qatomic_read(&ts->signal_pending)) {
>          /* FIXME: This is not threadsafe.  */
>          sigfillset(&set);
>          sigprocmask(SIG_SETMASK, &set, 0);
> @@ -1049,7 +1049,7 @@ void process_pending_signals(CPUArchState *cpu_env)
>           * of unblocking might cause us to take another host signal which
>           * will set signal_pending again).
>           */
> -        atomic_set(&ts->signal_pending, 0);
> +        qatomic_set(&ts->signal_pending, 0);
>          ts->in_sigsuspend = 0;
>          set = ts->signal_mask;
>          sigdelset(&set, SIGSEGV);
> diff --git a/migration/colo-failover.c b/migration/colo-failover.c
> index b717edc8e2..42453481c4 100644
> --- a/migration/colo-failover.c
> +++ b/migration/colo-failover.c
> @@ -63,7 +63,7 @@ FailoverStatus failover_set_state(FailoverStatus old_state,
>  {
>      FailoverStatus old;
>  
> -    old = atomic_cmpxchg(&failover_state, old_state, new_state);
> +    old = qatomic_cmpxchg(&failover_state, old_state, new_state);
>      if (old == old_state) {
>          trace_colo_failover_set_state(FailoverStatus_str(new_state));
>      }
> @@ -72,7 +72,7 @@ FailoverStatus failover_set_state(FailoverStatus old_state,
>  
>  FailoverStatus failover_get_state(void)
>  {
> -    return atomic_read(&failover_state);
> +    return qatomic_read(&failover_state);
>  }
>  
>  void qmp_x_colo_lost_heartbeat(Error **errp)
> diff --git a/migration/migration.c b/migration/migration.c
> index 58a5452471..d9d1e0b190 100644
> --- a/migration/migration.c
> +++ b/migration/migration.c
> @@ -1595,7 +1595,7 @@ void qmp_migrate_start_postcopy(Error **errp)
>       * we don't error if migration has finished since that would be racy
>       * with issuing this command.
>       */
> -    atomic_set(&s->start_postcopy, true);
> +    qatomic_set(&s->start_postcopy, true);
>  }
>  
>  /* shared migration helpers */
> @@ -1603,7 +1603,7 @@ void qmp_migrate_start_postcopy(Error **errp)
>  void migrate_set_state(int *state, int old_state, int new_state)
>  {
>      assert(new_state < MIGRATION_STATUS__MAX);
> -    if (atomic_cmpxchg(state, old_state, new_state) == old_state) {
> +    if (qatomic_cmpxchg(state, old_state, new_state) == old_state) {
>          trace_migrate_set_state(MigrationStatus_str(new_state));
>          migrate_generate_event(new_state);
>      }
> @@ -1954,7 +1954,7 @@ void qmp_migrate_recover(const char *uri, Error **errp)
>          return;
>      }
>  
> -    if (atomic_cmpxchg(&mis->postcopy_recover_triggered,
> +    if (qatomic_cmpxchg(&mis->postcopy_recover_triggered,
>                         false, true) == true) {
>          error_setg(errp, "Migrate recovery is triggered already");
>          return;
> @@ -3329,7 +3329,7 @@ static MigIterateState migration_iteration_run(MigrationState *s)
>      if (pending_size && pending_size >= s->threshold_size) {
>          /* Still a significant amount to transfer */
>          if (!in_postcopy && pend_pre <= s->threshold_size &&
> -            atomic_read(&s->start_postcopy)) {
> +            qatomic_read(&s->start_postcopy)) {
>              if (postcopy_start(s)) {
>                  error_report("%s: postcopy failed to start", __func__);
>              }
> diff --git a/migration/multifd.c b/migration/multifd.c
> index ac84a61797..fd57378db8 100644
> --- a/migration/multifd.c
> +++ b/migration/multifd.c
> @@ -410,7 +410,7 @@ static int multifd_send_pages(QEMUFile *f)
>      MultiFDPages_t *pages = multifd_send_state->pages;
>      uint64_t transferred;
>  
> -    if (atomic_read(&multifd_send_state->exiting)) {
> +    if (qatomic_read(&multifd_send_state->exiting)) {
>          return -1;
>      }
>  
> @@ -508,7 +508,7 @@ static void multifd_send_terminate_threads(Error *err)
>       * threads at the same time, we can end calling this function
>       * twice.
>       */
> -    if (atomic_xchg(&multifd_send_state->exiting, 1)) {
> +    if (qatomic_xchg(&multifd_send_state->exiting, 1)) {
>          return;
>      }
>  
> @@ -632,7 +632,7 @@ static void *multifd_send_thread(void *opaque)
>      while (true) {
>          qemu_sem_wait(&p->sem);
>  
> -        if (atomic_read(&multifd_send_state->exiting)) {
> +        if (qatomic_read(&multifd_send_state->exiting)) {
>              break;
>          }
>          qemu_mutex_lock(&p->mutex);
> @@ -760,7 +760,7 @@ int multifd_save_setup(Error **errp)
>      multifd_send_state->params = g_new0(MultiFDSendParams, thread_count);
>      multifd_send_state->pages = multifd_pages_init(page_count);
>      qemu_sem_init(&multifd_send_state->channels_ready, 0);
> -    atomic_set(&multifd_send_state->exiting, 0);
> +    qatomic_set(&multifd_send_state->exiting, 0);
>      multifd_send_state->ops = multifd_ops[migrate_multifd_compression()];
>  
>      for (i = 0; i < thread_count; i++) {
> @@ -997,7 +997,7 @@ int multifd_load_setup(Error **errp)
>      thread_count = migrate_multifd_channels();
>      multifd_recv_state = g_malloc0(sizeof(*multifd_recv_state));
>      multifd_recv_state->params = g_new0(MultiFDRecvParams, thread_count);
> -    atomic_set(&multifd_recv_state->count, 0);
> +    qatomic_set(&multifd_recv_state->count, 0);
>      qemu_sem_init(&multifd_recv_state->sem_sync, 0);
>      multifd_recv_state->ops = multifd_ops[migrate_multifd_compression()];
>  
> @@ -1037,7 +1037,7 @@ bool multifd_recv_all_channels_created(void)
>          return true;
>      }
>  
> -    return thread_count == atomic_read(&multifd_recv_state->count);
> +    return thread_count == qatomic_read(&multifd_recv_state->count);
>  }
>  
>  /*
> @@ -1058,7 +1058,7 @@ bool multifd_recv_new_channel(QIOChannel *ioc, Error **errp)
>          error_propagate_prepend(errp, local_err,
>                                  "failed to receive packet"
>                                  " via multifd channel %d: ",
> -                                atomic_read(&multifd_recv_state->count));
> +                                qatomic_read(&multifd_recv_state->count));
>          return false;
>      }
>      trace_multifd_recv_new_channel(id);
> @@ -1079,7 +1079,7 @@ bool multifd_recv_new_channel(QIOChannel *ioc, Error **errp)
>      p->running = true;
>      qemu_thread_create(&p->thread, p->name, multifd_recv_thread, p,
>                         QEMU_THREAD_JOINABLE);
> -    atomic_inc(&multifd_recv_state->count);
> -    return atomic_read(&multifd_recv_state->count) ==
> +    qatomic_inc(&multifd_recv_state->count);
> +    return qatomic_read(&multifd_recv_state->count) ==
>             migrate_multifd_channels();
>  }
> diff --git a/migration/postcopy-ram.c b/migration/postcopy-ram.c
> index baf094ba3a..1654ff11a5 100644
> --- a/migration/postcopy-ram.c
> +++ b/migration/postcopy-ram.c
> @@ -530,7 +530,7 @@ int postcopy_ram_incoming_cleanup(MigrationIncomingState *mis)
>          Error *local_err = NULL;
>  
>          /* Let the fault thread quit */
> -        atomic_set(&mis->fault_thread_quit, 1);
> +        qatomic_set(&mis->fault_thread_quit, 1);
>          postcopy_fault_thread_notify(mis);
>          trace_postcopy_ram_incoming_cleanup_join();
>          qemu_thread_join(&mis->fault_thread);
> @@ -742,12 +742,12 @@ static void mark_postcopy_blocktime_begin(uintptr_t addr, uint32_t ptid,
>  
>      low_time_offset = get_low_time_offset(dc);
>      if (dc->vcpu_addr[cpu] == 0) {
> -        atomic_inc(&dc->smp_cpus_down);
> +        qatomic_inc(&dc->smp_cpus_down);
>      }
>  
> -    atomic_xchg(&dc->last_begin, low_time_offset);
> -    atomic_xchg(&dc->page_fault_vcpu_time[cpu], low_time_offset);
> -    atomic_xchg(&dc->vcpu_addr[cpu], addr);
> +    qatomic_xchg(&dc->last_begin, low_time_offset);
> +    qatomic_xchg(&dc->page_fault_vcpu_time[cpu], low_time_offset);
> +    qatomic_xchg(&dc->vcpu_addr[cpu], addr);
>  
>      /*
>       * check it here, not at the beginning of the function,
> @@ -756,9 +756,9 @@ static void mark_postcopy_blocktime_begin(uintptr_t addr, uint32_t ptid,
>       */
>      already_received = ramblock_recv_bitmap_test(rb, (void *)addr);
>      if (already_received) {
> -        atomic_xchg(&dc->vcpu_addr[cpu], 0);
> -        atomic_xchg(&dc->page_fault_vcpu_time[cpu], 0);
> -        atomic_dec(&dc->smp_cpus_down);
> +        qatomic_xchg(&dc->vcpu_addr[cpu], 0);
> +        qatomic_xchg(&dc->page_fault_vcpu_time[cpu], 0);
> +        qatomic_dec(&dc->smp_cpus_down);
>      }
>      trace_mark_postcopy_blocktime_begin(addr, dc, dc->page_fault_vcpu_time[cpu],
>                                          cpu, already_received);
> @@ -813,28 +813,28 @@ static void mark_postcopy_blocktime_end(uintptr_t addr)
>      for (i = 0; i < smp_cpus; i++) {
>          uint32_t vcpu_blocktime = 0;
>  
> -        read_vcpu_time = atomic_fetch_add(&dc->page_fault_vcpu_time[i], 0);
> -        if (atomic_fetch_add(&dc->vcpu_addr[i], 0) != addr ||
> +        read_vcpu_time = qatomic_fetch_add(&dc->page_fault_vcpu_time[i], 0);
> +        if (qatomic_fetch_add(&dc->vcpu_addr[i], 0) != addr ||
>              read_vcpu_time == 0) {
>              continue;
>          }
> -        atomic_xchg(&dc->vcpu_addr[i], 0);
> +        qatomic_xchg(&dc->vcpu_addr[i], 0);
>          vcpu_blocktime = low_time_offset - read_vcpu_time;
>          affected_cpu += 1;
>          /* we need to know is that mark_postcopy_end was due to
>           * faulted page, another possible case it's prefetched
>           * page and in that case we shouldn't be here */
>          if (!vcpu_total_blocktime &&
> -            atomic_fetch_add(&dc->smp_cpus_down, 0) == smp_cpus) {
> +            qatomic_fetch_add(&dc->smp_cpus_down, 0) == smp_cpus) {
>              vcpu_total_blocktime = true;
>          }
>          /* continue cycle, due to one page could affect several vCPUs */
>          dc->vcpu_blocktime[i] += vcpu_blocktime;
>      }
>  
> -    atomic_sub(&dc->smp_cpus_down, affected_cpu);
> +    qatomic_sub(&dc->smp_cpus_down, affected_cpu);
>      if (vcpu_total_blocktime) {
> -        dc->total_blocktime += low_time_offset - atomic_fetch_add(
> +        dc->total_blocktime += low_time_offset - qatomic_fetch_add(
>                  &dc->last_begin, 0);
>      }
>      trace_mark_postcopy_blocktime_end(addr, dc, dc->total_blocktime,
> @@ -928,7 +928,7 @@ static void *postcopy_ram_fault_thread(void *opaque)
>                  error_report("%s: read() failed", __func__);
>              }
>  
> -            if (atomic_read(&mis->fault_thread_quit)) {
> +            if (qatomic_read(&mis->fault_thread_quit)) {
>                  trace_postcopy_ram_fault_thread_quit();
>                  break;
>              }
> @@ -1410,13 +1410,13 @@ static PostcopyState incoming_postcopy_state;
>  
>  PostcopyState  postcopy_state_get(void)
>  {
> -    return atomic_mb_read(&incoming_postcopy_state);
> +    return qatomic_mb_read(&incoming_postcopy_state);
>  }
>  
>  /* Set the state and return the old state */
>  PostcopyState postcopy_state_set(PostcopyState new_state)
>  {
> -    return atomic_xchg(&incoming_postcopy_state, new_state);
> +    return qatomic_xchg(&incoming_postcopy_state, new_state);
>  }
>  
>  /* Register a handler for external shared memory postcopy
> diff --git a/migration/rdma.c b/migration/rdma.c
> index 3bd30d46ad..0340841fad 100644
> --- a/migration/rdma.c
> +++ b/migration/rdma.c
> @@ -2678,7 +2678,7 @@ static ssize_t qio_channel_rdma_writev(QIOChannel *ioc,
>      size_t len = 0;
>  
>      RCU_READ_LOCK_GUARD();
> -    rdma = atomic_rcu_read(&rioc->rdmaout);
> +    rdma = qatomic_rcu_read(&rioc->rdmaout);
>  
>      if (!rdma) {
>          return -EIO;
> @@ -2760,7 +2760,7 @@ static ssize_t qio_channel_rdma_readv(QIOChannel *ioc,
>      size_t done = 0;
>  
>      RCU_READ_LOCK_GUARD();
> -    rdma = atomic_rcu_read(&rioc->rdmain);
> +    rdma = qatomic_rcu_read(&rioc->rdmain);
>  
>      if (!rdma) {
>          return -EIO;
> @@ -2875,9 +2875,9 @@ qio_channel_rdma_source_prepare(GSource *source,
>  
>      RCU_READ_LOCK_GUARD();
>      if (rsource->condition == G_IO_IN) {
> -        rdma = atomic_rcu_read(&rsource->rioc->rdmain);
> +        rdma = qatomic_rcu_read(&rsource->rioc->rdmain);
>      } else {
> -        rdma = atomic_rcu_read(&rsource->rioc->rdmaout);
> +        rdma = qatomic_rcu_read(&rsource->rioc->rdmaout);
>      }
>  
>      if (!rdma) {
> @@ -2902,9 +2902,9 @@ qio_channel_rdma_source_check(GSource *source)
>  
>      RCU_READ_LOCK_GUARD();
>      if (rsource->condition == G_IO_IN) {
> -        rdma = atomic_rcu_read(&rsource->rioc->rdmain);
> +        rdma = qatomic_rcu_read(&rsource->rioc->rdmain);
>      } else {
> -        rdma = atomic_rcu_read(&rsource->rioc->rdmaout);
> +        rdma = qatomic_rcu_read(&rsource->rioc->rdmaout);
>      }
>  
>      if (!rdma) {
> @@ -2932,9 +2932,9 @@ qio_channel_rdma_source_dispatch(GSource *source,
>  
>      RCU_READ_LOCK_GUARD();
>      if (rsource->condition == G_IO_IN) {
> -        rdma = atomic_rcu_read(&rsource->rioc->rdmain);
> +        rdma = qatomic_rcu_read(&rsource->rioc->rdmain);
>      } else {
> -        rdma = atomic_rcu_read(&rsource->rioc->rdmaout);
> +        rdma = qatomic_rcu_read(&rsource->rioc->rdmaout);
>      }
>  
>      if (!rdma) {
> @@ -3035,12 +3035,12 @@ static int qio_channel_rdma_close(QIOChannel *ioc,
>  
>      rdmain = rioc->rdmain;
>      if (rdmain) {
> -        atomic_rcu_set(&rioc->rdmain, NULL);
> +        qatomic_rcu_set(&rioc->rdmain, NULL);
>      }
>  
>      rdmaout = rioc->rdmaout;
>      if (rdmaout) {
> -        atomic_rcu_set(&rioc->rdmaout, NULL);
> +        qatomic_rcu_set(&rioc->rdmaout, NULL);
>      }
>  
>      rcu->rdmain = rdmain;
> @@ -3060,8 +3060,8 @@ qio_channel_rdma_shutdown(QIOChannel *ioc,
>  
>      RCU_READ_LOCK_GUARD();
>  
> -    rdmain = atomic_rcu_read(&rioc->rdmain);
> -    rdmaout = atomic_rcu_read(&rioc->rdmain);
> +    rdmain = qatomic_rcu_read(&rioc->rdmain);
> +    rdmaout = qatomic_rcu_read(&rioc->rdmain);
>  
>      switch (how) {
>      case QIO_CHANNEL_SHUTDOWN_READ:
> @@ -3131,7 +3131,7 @@ static size_t qemu_rdma_save_page(QEMUFile *f, void *opaque,
>      int ret;
>  
>      RCU_READ_LOCK_GUARD();
> -    rdma = atomic_rcu_read(&rioc->rdmaout);
> +    rdma = qatomic_rcu_read(&rioc->rdmaout);
>  
>      if (!rdma) {
>          return -EIO;
> @@ -3451,7 +3451,7 @@ static int qemu_rdma_registration_handle(QEMUFile *f, void *opaque)
>      int i = 0;
>  
>      RCU_READ_LOCK_GUARD();
> -    rdma = atomic_rcu_read(&rioc->rdmain);
> +    rdma = qatomic_rcu_read(&rioc->rdmain);
>  
>      if (!rdma) {
>          return -EIO;
> @@ -3714,7 +3714,7 @@ rdma_block_notification_handle(QIOChannelRDMA *rioc, const char *name)
>      int found = -1;
>  
>      RCU_READ_LOCK_GUARD();
> -    rdma = atomic_rcu_read(&rioc->rdmain);
> +    rdma = qatomic_rcu_read(&rioc->rdmain);
>  
>      if (!rdma) {
>          return -EIO;
> @@ -3762,7 +3762,7 @@ static int qemu_rdma_registration_start(QEMUFile *f, void *opaque,
>      RDMAContext *rdma;
>  
>      RCU_READ_LOCK_GUARD();
> -    rdma = atomic_rcu_read(&rioc->rdmaout);
> +    rdma = qatomic_rcu_read(&rioc->rdmaout);
>      if (!rdma) {
>          return -EIO;
>      }
> @@ -3793,7 +3793,7 @@ static int qemu_rdma_registration_stop(QEMUFile *f, void *opaque,
>      int ret = 0;
>  
>      RCU_READ_LOCK_GUARD();
> -    rdma = atomic_rcu_read(&rioc->rdmaout);
> +    rdma = qatomic_rcu_read(&rioc->rdmaout);
>      if (!rdma) {
>          return -EIO;
>      }
> diff --git a/monitor/hmp.c b/monitor/hmp.c
> index d598dd02bb..4ecdefd705 100644
> --- a/monitor/hmp.c
> +++ b/monitor/hmp.c
> @@ -1337,19 +1337,19 @@ static void monitor_event(void *opaque, QEMUChrEvent event)
>              monitor_resume(mon);
>              monitor_flush(mon);
>          } else {
> -            atomic_mb_set(&mon->suspend_cnt, 0);
> +            qatomic_mb_set(&mon->suspend_cnt, 0);
>          }
>          break;
>  
>      case CHR_EVENT_MUX_OUT:
>          if (mon->reset_seen) {
> -            if (atomic_mb_read(&mon->suspend_cnt) == 0) {
> +            if (qatomic_mb_read(&mon->suspend_cnt) == 0) {
>                  monitor_printf(mon, "\n");
>              }
>              monitor_flush(mon);
>              monitor_suspend(mon);
>          } else {
> -            atomic_inc(&mon->suspend_cnt);
> +            qatomic_inc(&mon->suspend_cnt);
>          }
>          qemu_mutex_lock(&mon->mon_lock);
>          mon->mux_out = 1;
> diff --git a/monitor/misc.c b/monitor/misc.c
> index 0b1b9b196c..262f2bd951 100644
> --- a/monitor/misc.c
> +++ b/monitor/misc.c
> @@ -751,7 +751,7 @@ static uint64_t vtop(void *ptr, Error **errp)
>      }
>  
>      /* Force copy-on-write if necessary.  */
> -    atomic_add((uint8_t *)ptr, 0);
> +    qatomic_add((uint8_t *)ptr, 0);
>  
>      if (pread(fd, &pinfo, sizeof(pinfo), offset) != sizeof(pinfo)) {
>          error_setg_errno(errp, errno, "Cannot read pagemap");
> diff --git a/monitor/monitor.c b/monitor/monitor.c
> index b385a3d569..0f32892ad4 100644
> --- a/monitor/monitor.c
> +++ b/monitor/monitor.c
> @@ -449,7 +449,7 @@ int monitor_suspend(Monitor *mon)
>          return -ENOTTY;
>      }
>  
> -    atomic_inc(&mon->suspend_cnt);
> +    qatomic_inc(&mon->suspend_cnt);
>  
>      if (mon->use_io_thread) {
>          /*
> @@ -476,7 +476,7 @@ void monitor_resume(Monitor *mon)
>          return;
>      }
>  
> -    if (atomic_dec_fetch(&mon->suspend_cnt) == 0) {
> +    if (qatomic_dec_fetch(&mon->suspend_cnt) == 0) {
>          AioContext *ctx;
>  
>          if (mon->use_io_thread) {
> @@ -501,7 +501,7 @@ int monitor_can_read(void *opaque)
>  {
>      Monitor *mon = opaque;
>  
> -    return !atomic_mb_read(&mon->suspend_cnt);
> +    return !qatomic_mb_read(&mon->suspend_cnt);
>  }
>  
>  void monitor_list_append(Monitor *mon)
> diff --git a/qemu-nbd.c b/qemu-nbd.c
> index 33476a1000..e39d3b23c1 100644
> --- a/qemu-nbd.c
> +++ b/qemu-nbd.c
> @@ -158,7 +158,7 @@ QEMU_COPYRIGHT "\n"
>  #if HAVE_NBD_DEVICE
>  static void termsig_handler(int signum)
>  {
> -    atomic_cmpxchg(&state, RUNNING, TERMINATE);
> +    qatomic_cmpxchg(&state, RUNNING, TERMINATE);
>      qemu_notify_event();
>  }
>  #endif /* HAVE_NBD_DEVICE */
> diff --git a/qga/commands.c b/qga/commands.c
> index d3fec807c1..3dcd5fbe5c 100644
> --- a/qga/commands.c
> +++ b/qga/commands.c
> @@ -166,13 +166,13 @@ GuestExecStatus *qmp_guest_exec_status(int64_t pid, Error **errp)
>  
>      ges = g_new0(GuestExecStatus, 1);
>  
> -    bool finished = atomic_mb_read(&gei->finished);
> +    bool finished = qatomic_mb_read(&gei->finished);
>  
>      /* need to wait till output channels are closed
>       * to be sure we captured all output at this point */
>      if (gei->has_output) {
> -        finished = finished && atomic_mb_read(&gei->out.closed);
> -        finished = finished && atomic_mb_read(&gei->err.closed);
> +        finished = finished && qatomic_mb_read(&gei->out.closed);
> +        finished = finished && qatomic_mb_read(&gei->err.closed);
>      }
>  
>      ges->exited = finished;
> @@ -274,7 +274,7 @@ static void guest_exec_child_watch(GPid pid, gint status, gpointer data)
>              (int32_t)gpid_to_int64(pid), (uint32_t)status);
>  
>      gei->status = status;
> -    atomic_mb_set(&gei->finished, true);
> +    qatomic_mb_set(&gei->finished, true);
>  
>      g_spawn_close_pid(pid);
>  }
> @@ -330,7 +330,7 @@ static gboolean guest_exec_input_watch(GIOChannel *ch,
>  done:
>      g_io_channel_shutdown(ch, true, NULL);
>      g_io_channel_unref(ch);
> -    atomic_mb_set(&p->closed, true);
> +    qatomic_mb_set(&p->closed, true);
>      g_free(p->data);
>  
>      return false;
> @@ -384,7 +384,7 @@ static gboolean guest_exec_output_watch(GIOChannel *ch,
>  close:
>      g_io_channel_shutdown(ch, true, NULL);
>      g_io_channel_unref(ch);
> -    atomic_mb_set(&p->closed, true);
> +    qatomic_mb_set(&p->closed, true);
>      return false;
>  }
>  
> diff --git a/qom/object.c b/qom/object.c
> index a91a6a515a..1196970635 100644
> --- a/qom/object.c
> +++ b/qom/object.c
> @@ -867,7 +867,7 @@ Object *object_dynamic_cast_assert(Object *obj, const char *typename,
>      Object *inst;
>  
>      for (i = 0; obj && i < OBJECT_CLASS_CAST_CACHE; i++) {
> -        if (atomic_read(&obj->class->object_cast_cache[i]) == typename) {
> +        if (qatomic_read(&obj->class->object_cast_cache[i]) == typename) {
>              goto out;
>          }
>      }
> @@ -884,10 +884,10 @@ Object *object_dynamic_cast_assert(Object *obj, const char *typename,
>  
>      if (obj && obj == inst) {
>          for (i = 1; i < OBJECT_CLASS_CAST_CACHE; i++) {
> -            atomic_set(&obj->class->object_cast_cache[i - 1],
> -                       atomic_read(&obj->class->object_cast_cache[i]));
> +            qatomic_set(&obj->class->object_cast_cache[i - 1],
> +                       qatomic_read(&obj->class->object_cast_cache[i]));
>          }
> -        atomic_set(&obj->class->object_cast_cache[i - 1], typename);
> +        qatomic_set(&obj->class->object_cast_cache[i - 1], typename);
>      }
>  
>  out:
> @@ -957,7 +957,7 @@ ObjectClass *object_class_dynamic_cast_assert(ObjectClass *class,
>      int i;
>  
>      for (i = 0; class && i < OBJECT_CLASS_CAST_CACHE; i++) {
> -        if (atomic_read(&class->class_cast_cache[i]) == typename) {
> +        if (qatomic_read(&class->class_cast_cache[i]) == typename) {
>              ret = class;
>              goto out;
>          }
> @@ -978,10 +978,10 @@ ObjectClass *object_class_dynamic_cast_assert(ObjectClass *class,
>  #ifdef CONFIG_QOM_CAST_DEBUG
>      if (class && ret == class) {
>          for (i = 1; i < OBJECT_CLASS_CAST_CACHE; i++) {
> -            atomic_set(&class->class_cast_cache[i - 1],
> -                       atomic_read(&class->class_cast_cache[i]));
> +            qatomic_set(&class->class_cast_cache[i - 1],
> +                       qatomic_read(&class->class_cast_cache[i]));
>          }
> -        atomic_set(&class->class_cast_cache[i - 1], typename);
> +        qatomic_set(&class->class_cast_cache[i - 1], typename);
>      }
>  out:
>  #endif
> @@ -1166,7 +1166,7 @@ Object *object_ref(void *objptr)
>      if (!obj) {
>          return NULL;
>      }
> -    atomic_inc(&obj->ref);
> +    qatomic_inc(&obj->ref);
>      return obj;
>  }
>  
> @@ -1179,7 +1179,7 @@ void object_unref(void *objptr)
>      g_assert(obj->ref > 0);
>  
>      /* parent always holds a reference to its children */
> -    if (atomic_fetch_dec(&obj->ref) == 1) {
> +    if (qatomic_fetch_dec(&obj->ref) == 1) {
>          object_finalize(obj);
>      }
>  }
> diff --git a/scsi/qemu-pr-helper.c b/scsi/qemu-pr-helper.c
> index 57ad830d54..d26faaf91e 100644
> --- a/scsi/qemu-pr-helper.c
> +++ b/scsi/qemu-pr-helper.c
> @@ -747,7 +747,7 @@ static void coroutine_fn prh_co_entry(void *opaque)
>          goto out;
>      }
>  
> -    while (atomic_read(&state) == RUNNING) {
> +    while (qatomic_read(&state) == RUNNING) {
>          PRHelperRequest req;
>          PRHelperResponse resp;
>          int sz;
> @@ -816,7 +816,7 @@ static gboolean accept_client(QIOChannel *ioc, GIOCondition cond, gpointer opaqu
>  
>  static void termsig_handler(int signum)
>  {
> -    atomic_cmpxchg(&state, RUNNING, TERMINATE);
> +    qatomic_cmpxchg(&state, RUNNING, TERMINATE);
>      qemu_notify_event();
>  }
>  
> diff --git a/softmmu/cpu-throttle.c b/softmmu/cpu-throttle.c
> index 4e6b2818ca..2ec4b8e0bc 100644
> --- a/softmmu/cpu-throttle.c
> +++ b/softmmu/cpu-throttle.c
> @@ -64,7 +64,7 @@ static void cpu_throttle_thread(CPUState *cpu, run_on_cpu_data opaque)
>          }
>          sleeptime_ns = endtime_ns - qemu_clock_get_ns(QEMU_CLOCK_REALTIME);
>      }
> -    atomic_set(&cpu->throttle_thread_scheduled, 0);
> +    qatomic_set(&cpu->throttle_thread_scheduled, 0);
>  }
>  
>  static void cpu_throttle_timer_tick(void *opaque)
> @@ -77,7 +77,7 @@ static void cpu_throttle_timer_tick(void *opaque)
>          return;
>      }
>      CPU_FOREACH(cpu) {
> -        if (!atomic_xchg(&cpu->throttle_thread_scheduled, 1)) {
> +        if (!qatomic_xchg(&cpu->throttle_thread_scheduled, 1)) {
>              async_run_on_cpu(cpu, cpu_throttle_thread,
>                               RUN_ON_CPU_NULL);
>          }
> @@ -94,7 +94,7 @@ void cpu_throttle_set(int new_throttle_pct)
>      new_throttle_pct = MIN(new_throttle_pct, CPU_THROTTLE_PCT_MAX);
>      new_throttle_pct = MAX(new_throttle_pct, CPU_THROTTLE_PCT_MIN);
>  
> -    atomic_set(&throttle_percentage, new_throttle_pct);
> +    qatomic_set(&throttle_percentage, new_throttle_pct);
>  
>      timer_mod(throttle_timer, qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL_RT) +
>                                         CPU_THROTTLE_TIMESLICE_NS);
> @@ -102,7 +102,7 @@ void cpu_throttle_set(int new_throttle_pct)
>  
>  void cpu_throttle_stop(void)
>  {
> -    atomic_set(&throttle_percentage, 0);
> +    qatomic_set(&throttle_percentage, 0);
>  }
>  
>  bool cpu_throttle_active(void)
> @@ -112,7 +112,7 @@ bool cpu_throttle_active(void)
>  
>  int cpu_throttle_get_percentage(void)
>  {
> -    return atomic_read(&throttle_percentage);
> +    return qatomic_read(&throttle_percentage);
>  }
>  
>  void cpu_throttle_init(void)
> diff --git a/softmmu/cpus.c b/softmmu/cpus.c
> index e3b98065c9..ac8940d52e 100644
> --- a/softmmu/cpus.c
> +++ b/softmmu/cpus.c
> @@ -192,7 +192,7 @@ static void cpu_update_icount_locked(CPUState *cpu)
>      int64_t executed = cpu_get_icount_executed(cpu);
>      cpu->icount_budget -= executed;
>  
> -    atomic_set_i64(&timers_state.qemu_icount,
> +    qatomic_set_i64(&timers_state.qemu_icount,
>                     timers_state.qemu_icount + executed);
>  }
>  
> @@ -223,13 +223,13 @@ static int64_t cpu_get_icount_raw_locked(void)
>          cpu_update_icount_locked(cpu);
>      }
>      /* The read is protected by the seqlock, but needs atomic64 to avoid UB */
> -    return atomic_read_i64(&timers_state.qemu_icount);
> +    return qatomic_read_i64(&timers_state.qemu_icount);
>  }
>  
>  static int64_t cpu_get_icount_locked(void)
>  {
>      int64_t icount = cpu_get_icount_raw_locked();
> -    return atomic_read_i64(&timers_state.qemu_icount_bias) +
> +    return qatomic_read_i64(&timers_state.qemu_icount_bias) +
>          cpu_icount_to_ns(icount);
>  }
>  
> @@ -262,7 +262,7 @@ int64_t cpu_get_icount(void)
>  
>  int64_t cpu_icount_to_ns(int64_t icount)
>  {
> -    return icount << atomic_read(&timers_state.icount_time_shift);
> +    return icount << qatomic_read(&timers_state.icount_time_shift);
>  }
>  
>  static int64_t cpu_get_ticks_locked(void)
> @@ -393,18 +393,18 @@ static void icount_adjust(void)
>          && last_delta + ICOUNT_WOBBLE < delta * 2
>          && timers_state.icount_time_shift > 0) {
>          /* The guest is getting too far ahead.  Slow time down.  */
> -        atomic_set(&timers_state.icount_time_shift,
> +        qatomic_set(&timers_state.icount_time_shift,
>                     timers_state.icount_time_shift - 1);
>      }
>      if (delta < 0
>          && last_delta - ICOUNT_WOBBLE > delta * 2
>          && timers_state.icount_time_shift < MAX_ICOUNT_SHIFT) {
>          /* The guest is getting too far behind.  Speed time up.  */
> -        atomic_set(&timers_state.icount_time_shift,
> +        qatomic_set(&timers_state.icount_time_shift,
>                     timers_state.icount_time_shift + 1);
>      }
>      last_delta = delta;
> -    atomic_set_i64(&timers_state.qemu_icount_bias,
> +    qatomic_set_i64(&timers_state.qemu_icount_bias,
>                     cur_icount - (timers_state.qemu_icount
>                                   << timers_state.icount_time_shift));
>      seqlock_write_unlock(&timers_state.vm_clock_seqlock,
> @@ -428,7 +428,7 @@ static void icount_adjust_vm(void *opaque)
>  
>  static int64_t qemu_icount_round(int64_t count)
>  {
> -    int shift = atomic_read(&timers_state.icount_time_shift);
> +    int shift = qatomic_read(&timers_state.icount_time_shift);
>      return (count + (1 << shift) - 1) >> shift;
>  }
>  
> @@ -466,7 +466,7 @@ static void icount_warp_rt(void)
>              int64_t delta = clock - cur_icount;
>              warp_delta = MIN(warp_delta, delta);
>          }
> -        atomic_set_i64(&timers_state.qemu_icount_bias,
> +        qatomic_set_i64(&timers_state.qemu_icount_bias,
>                         timers_state.qemu_icount_bias + warp_delta);
>      }
>      timers_state.vm_clock_warp_start = -1;
> @@ -499,7 +499,7 @@ void qtest_clock_warp(int64_t dest)
>  
>          seqlock_write_lock(&timers_state.vm_clock_seqlock,
>                             &timers_state.vm_clock_lock);
> -        atomic_set_i64(&timers_state.qemu_icount_bias,
> +        qatomic_set_i64(&timers_state.qemu_icount_bias,
>                         timers_state.qemu_icount_bias + warp);
>          seqlock_write_unlock(&timers_state.vm_clock_seqlock,
>                               &timers_state.vm_clock_lock);
> @@ -583,7 +583,7 @@ void qemu_start_warp_timer(void)
>               */
>              seqlock_write_lock(&timers_state.vm_clock_seqlock,
>                                 &timers_state.vm_clock_lock);
> -            atomic_set_i64(&timers_state.qemu_icount_bias,
> +            qatomic_set_i64(&timers_state.qemu_icount_bias,
>                             timers_state.qemu_icount_bias + deadline);
>              seqlock_write_unlock(&timers_state.vm_clock_seqlock,
>                                   &timers_state.vm_clock_lock);
> @@ -837,11 +837,11 @@ static void qemu_cpu_kick_rr_next_cpu(void)
>  {
>      CPUState *cpu;
>      do {
> -        cpu = atomic_mb_read(&tcg_current_rr_cpu);
> +        cpu = qatomic_mb_read(&tcg_current_rr_cpu);
>          if (cpu) {
>              cpu_exit(cpu);
>          }
> -    } while (cpu != atomic_mb_read(&tcg_current_rr_cpu));
> +    } while (cpu != qatomic_mb_read(&tcg_current_rr_cpu));
>  }
>  
>  /* Kick all RR vCPUs */
> @@ -1110,7 +1110,7 @@ static void qemu_cpu_stop(CPUState *cpu, bool exit)
>  
>  static void qemu_wait_io_event_common(CPUState *cpu)
>  {
> -    atomic_mb_set(&cpu->thread_kicked, false);
> +    qatomic_mb_set(&cpu->thread_kicked, false);
>      if (cpu->stop) {
>          qemu_cpu_stop(cpu, false);
>      }
> @@ -1356,7 +1356,7 @@ static int tcg_cpu_exec(CPUState *cpu)
>      ret = cpu_exec(cpu);
>      cpu_exec_end(cpu);
>  #ifdef CONFIG_PROFILER
> -    atomic_set(&tcg_ctx->prof.cpu_exec_time,
> +    qatomic_set(&tcg_ctx->prof.cpu_exec_time,
>                 tcg_ctx->prof.cpu_exec_time + profile_getclock() - ti);
>  #endif
>      return ret;
> @@ -1443,7 +1443,7 @@ static void *qemu_tcg_rr_cpu_thread_fn(void *arg)
>  
>          while (cpu && cpu_work_list_empty(cpu) && !cpu->exit_request) {
>  
> -            atomic_mb_set(&tcg_current_rr_cpu, cpu);
> +            qatomic_mb_set(&tcg_current_rr_cpu, cpu);
>              current_cpu = cpu;
>  
>              qemu_clock_enable(QEMU_CLOCK_VIRTUAL,
> @@ -1479,11 +1479,11 @@ static void *qemu_tcg_rr_cpu_thread_fn(void *arg)
>              cpu = CPU_NEXT(cpu);
>          } /* while (cpu && !cpu->exit_request).. */
>  
> -        /* Does not need atomic_mb_set because a spurious wakeup is okay.  */
> -        atomic_set(&tcg_current_rr_cpu, NULL);
> +        /* Does not need qatomic_mb_set because a spurious wakeup is okay.  */
> +        qatomic_set(&tcg_current_rr_cpu, NULL);
>  
>          if (cpu && cpu->exit_request) {
> -            atomic_mb_set(&cpu->exit_request, 0);
> +            qatomic_mb_set(&cpu->exit_request, 0);
>          }
>  
>          if (use_icount && all_cpu_threads_idle()) {
> @@ -1687,7 +1687,7 @@ static void *qemu_tcg_cpu_thread_fn(void *arg)
>              }
>          }
>  
> -        atomic_mb_set(&cpu->exit_request, 0);
> +        qatomic_mb_set(&cpu->exit_request, 0);
>          qemu_wait_io_event(cpu);
>      } while (!cpu->unplug || cpu_can_run(cpu));
>  
> @@ -1776,7 +1776,7 @@ bool qemu_mutex_iothread_locked(void)
>   */
>  void qemu_mutex_lock_iothread_impl(const char *file, int line)
>  {
> -    QemuMutexLockFunc bql_lock = atomic_read(&qemu_bql_mutex_lock_func);
> +    QemuMutexLockFunc bql_lock = qatomic_read(&qemu_bql_mutex_lock_func);
>  
>      g_assert(!qemu_mutex_iothread_locked());
>      bql_lock(&qemu_global_mutex, file, line);
> diff --git a/softmmu/memory.c b/softmmu/memory.c
> index d030eb6f7c..da5f90f141 100644
> --- a/softmmu/memory.c
> +++ b/softmmu/memory.c
> @@ -294,12 +294,12 @@ static void flatview_destroy(FlatView *view)
>  
>  static bool flatview_ref(FlatView *view)
>  {
> -    return atomic_fetch_inc_nonzero(&view->ref) > 0;
> +    return qatomic_fetch_inc_nonzero(&view->ref) > 0;
>  }
>  
>  void flatview_unref(FlatView *view)
>  {
> -    if (atomic_fetch_dec(&view->ref) == 1) {
> +    if (qatomic_fetch_dec(&view->ref) == 1) {
>          trace_flatview_destroy_rcu(view, view->root);
>          assert(view->root);
>          call_rcu(view, flatview_destroy, rcu);
> @@ -1027,7 +1027,7 @@ static void address_space_set_flatview(AddressSpace *as)
>      }
>  
>      /* Writes are protected by the BQL.  */
> -    atomic_rcu_set(&as->current_map, new_view);
> +    qatomic_rcu_set(&as->current_map, new_view);
>      if (old_view) {
>          flatview_unref(old_view);
>      }
> diff --git a/softmmu/vl.c b/softmmu/vl.c
> index f7b103467c..50d8c2e42e 100644
> --- a/softmmu/vl.c
> +++ b/softmmu/vl.c
> @@ -1320,7 +1320,7 @@ ShutdownCause qemu_reset_requested_get(void)
>  
>  static int qemu_shutdown_requested(void)
>  {
> -    return atomic_xchg(&shutdown_requested, SHUTDOWN_CAUSE_NONE);
> +    return qatomic_xchg(&shutdown_requested, SHUTDOWN_CAUSE_NONE);
>  }
>  
>  static void qemu_kill_report(void)
> diff --git a/target/arm/mte_helper.c b/target/arm/mte_helper.c
> index 891306f5b0..5615c6706c 100644
> --- a/target/arm/mte_helper.c
> +++ b/target/arm/mte_helper.c
> @@ -313,11 +313,11 @@ static void store_tag1(uint64_t ptr, uint8_t *mem, int tag)
>  static void store_tag1_parallel(uint64_t ptr, uint8_t *mem, int tag)
>  {
>      int ofs = extract32(ptr, LOG2_TAG_GRANULE, 1) * 4;
> -    uint8_t old = atomic_read(mem);
> +    uint8_t old = qatomic_read(mem);
>  
>      while (1) {
>          uint8_t new = deposit32(old, ofs, 4, tag);
> -        uint8_t cmp = atomic_cmpxchg(mem, old, new);
> +        uint8_t cmp = qatomic_cmpxchg(mem, old, new);
>          if (likely(cmp == old)) {
>              return;
>          }
> @@ -398,7 +398,7 @@ static inline void do_st2g(CPUARMState *env, uint64_t ptr, uint64_t xt,
>                                    2 * TAG_GRANULE, MMU_DATA_STORE, 1, ra);
>          if (mem1) {
>              tag |= tag << 4;
> -            atomic_set(mem1, tag);
> +            qatomic_set(mem1, tag);
>          }
>      }
>  }
> diff --git a/target/hppa/op_helper.c b/target/hppa/op_helper.c
> index 5685e303ab..39361d3759 100644
> --- a/target/hppa/op_helper.c
> +++ b/target/hppa/op_helper.c
> @@ -67,7 +67,7 @@ static void atomic_store_3(CPUHPPAState *env, target_ulong addr, uint32_t val,
>      old = *haddr;
>      while (1) {
>          new = (old & ~mask) | (val & mask);
> -        cmp = atomic_cmpxchg(haddr, old, new);
> +        cmp = qatomic_cmpxchg(haddr, old, new);
>          if (cmp == old) {
>              return;
>          }
> diff --git a/target/i386/mem_helper.c b/target/i386/mem_helper.c
> index acf41f8885..3a6d3ae2ef 100644
> --- a/target/i386/mem_helper.c
> +++ b/target/i386/mem_helper.c
> @@ -68,7 +68,7 @@ void helper_cmpxchg8b(CPUX86State *env, target_ulong a0)
>          uint64_t *haddr = g2h(a0);
>          cmpv = cpu_to_le64(cmpv);
>          newv = cpu_to_le64(newv);
> -        oldv = atomic_cmpxchg__nocheck(haddr, cmpv, newv);
> +        oldv = qatomic_cmpxchg__nocheck(haddr, cmpv, newv);
>          oldv = le64_to_cpu(oldv);
>      }
>  #else
> diff --git a/target/i386/whpx-all.c b/target/i386/whpx-all.c
> index c78baac6df..5a0f337a4c 100644
> --- a/target/i386/whpx-all.c
> +++ b/target/i386/whpx-all.c
> @@ -946,7 +946,7 @@ static int whpx_vcpu_run(CPUState *cpu)
>      whpx_vcpu_process_async_events(cpu);
>      if (cpu->halted) {
>          cpu->exception_index = EXCP_HLT;
> -        atomic_set(&cpu->exit_request, false);
> +        qatomic_set(&cpu->exit_request, false);
>          return 0;
>      }
>  
> @@ -961,7 +961,7 @@ static int whpx_vcpu_run(CPUState *cpu)
>  
>          whpx_vcpu_pre_run(cpu);
>  
> -        if (atomic_read(&cpu->exit_request)) {
> +        if (qatomic_read(&cpu->exit_request)) {
>              whpx_vcpu_kick(cpu);
>          }
>  
> @@ -1113,7 +1113,7 @@ static int whpx_vcpu_run(CPUState *cpu)
>      qemu_mutex_lock_iothread();
>      current_cpu = cpu;
>  
> -    atomic_set(&cpu->exit_request, false);
> +    qatomic_set(&cpu->exit_request, false);
>  
>      return ret < 0;
>  }
> diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
> index f4c4111536..904899054d 100644
> --- a/target/riscv/cpu_helper.c
> +++ b/target/riscv/cpu_helper.c
> @@ -537,7 +537,7 @@ restart:
>                      *pte_pa = pte = updated_pte;
>  #else
>                      target_ulong old_pte =
> -                        atomic_cmpxchg(pte_pa, pte, updated_pte);
> +                        qatomic_cmpxchg(pte_pa, pte, updated_pte);
>                      if (old_pte != pte) {
>                          goto restart;
>                      } else {
> diff --git a/target/s390x/mem_helper.c b/target/s390x/mem_helper.c
> index a237dec757..bd25eed3e8 100644
> --- a/target/s390x/mem_helper.c
> +++ b/target/s390x/mem_helper.c
> @@ -1780,7 +1780,7 @@ static uint32_t do_csst(CPUS390XState *env, uint32_t r3, uint64_t a1,
>              if (parallel) {
>  #ifdef CONFIG_USER_ONLY
>                  uint32_t *haddr = g2h(a1);
> -                ov = atomic_cmpxchg__nocheck(haddr, cv, nv);
> +                ov = qatomic_cmpxchg__nocheck(haddr, cv, nv);
>  #else
>                  TCGMemOpIdx oi = make_memop_idx(MO_TEUL | MO_ALIGN, mem_idx);
>                  ov = helper_atomic_cmpxchgl_be_mmu(env, a1, cv, nv, oi, ra);
> @@ -1804,7 +1804,7 @@ static uint32_t do_csst(CPUS390XState *env, uint32_t r3, uint64_t a1,
>  #ifdef CONFIG_ATOMIC64
>  # ifdef CONFIG_USER_ONLY
>                  uint64_t *haddr = g2h(a1);
> -                ov = atomic_cmpxchg__nocheck(haddr, cv, nv);
> +                ov = qatomic_cmpxchg__nocheck(haddr, cv, nv);
>  # else
>                  TCGMemOpIdx oi = make_memop_idx(MO_TEQ | MO_ALIGN, mem_idx);
>                  ov = helper_atomic_cmpxchgq_be_mmu(env, a1, cv, nv, oi, ra);
> diff --git a/target/xtensa/exc_helper.c b/target/xtensa/exc_helper.c
> index 58a64e6d62..2f032bc053 100644
> --- a/target/xtensa/exc_helper.c
> +++ b/target/xtensa/exc_helper.c
> @@ -128,13 +128,13 @@ void HELPER(check_interrupts)(CPUXtensaState *env)
>  
>  void HELPER(intset)(CPUXtensaState *env, uint32_t v)
>  {
> -    atomic_or(&env->sregs[INTSET],
> +    qatomic_or(&env->sregs[INTSET],
>                v & env->config->inttype_mask[INTTYPE_SOFTWARE]);
>  }
>  
>  static void intclear(CPUXtensaState *env, uint32_t v)
>  {
> -    atomic_and(&env->sregs[INTSET], ~v);
> +    qatomic_and(&env->sregs[INTSET], ~v);
>  }
>  
>  void HELPER(intclear)(CPUXtensaState *env, uint32_t v)
> diff --git a/target/xtensa/op_helper.c b/target/xtensa/op_helper.c
> index 09f4962d00..143476849f 100644
> --- a/target/xtensa/op_helper.c
> +++ b/target/xtensa/op_helper.c
> @@ -62,7 +62,7 @@ void HELPER(update_ccompare)(CPUXtensaState *env, uint32_t i)
>  {
>      uint64_t dcc;
>  
> -    atomic_and(&env->sregs[INTSET],
> +    qatomic_and(&env->sregs[INTSET],
>                 ~(1u << env->config->timerint[i]));
>      HELPER(update_ccount)(env);
>      dcc = (uint64_t)(env->sregs[CCOMPARE + i] - env->sregs[CCOUNT] - 1) + 1;
> diff --git a/tcg/tcg.c b/tcg/tcg.c
> index 62f299e36e..284b1c2a15 100644
> --- a/tcg/tcg.c
> +++ b/tcg/tcg.c
> @@ -597,7 +597,7 @@ static inline bool tcg_region_initial_alloc__locked(TCGContext *s)
>  /* Call from a safe-work context */
>  void tcg_region_reset_all(void)
>  {
> -    unsigned int n_ctxs = atomic_read(&n_tcg_ctxs);
> +    unsigned int n_ctxs = qatomic_read(&n_tcg_ctxs);
>      unsigned int i;
>  
>      qemu_mutex_lock(&region.lock);
> @@ -605,7 +605,7 @@ void tcg_region_reset_all(void)
>      region.agg_size_full = 0;
>  
>      for (i = 0; i < n_ctxs; i++) {
> -        TCGContext *s = atomic_read(&tcg_ctxs[i]);
> +        TCGContext *s = qatomic_read(&tcg_ctxs[i]);
>          bool err = tcg_region_initial_alloc__locked(s);
>  
>          g_assert(!err);
> @@ -794,9 +794,9 @@ void tcg_register_thread(void)
>      }
>  
>      /* Claim an entry in tcg_ctxs */
> -    n = atomic_fetch_inc(&n_tcg_ctxs);
> +    n = qatomic_fetch_inc(&n_tcg_ctxs);
>      g_assert(n < ms->smp.max_cpus);
> -    atomic_set(&tcg_ctxs[n], s);
> +    qatomic_set(&tcg_ctxs[n], s);
>  
>      if (n > 0) {
>          alloc_tcg_plugin_context(s);
> @@ -819,17 +819,17 @@ void tcg_register_thread(void)
>   */
>  size_t tcg_code_size(void)
>  {
> -    unsigned int n_ctxs = atomic_read(&n_tcg_ctxs);
> +    unsigned int n_ctxs = qatomic_read(&n_tcg_ctxs);
>      unsigned int i;
>      size_t total;
>  
>      qemu_mutex_lock(&region.lock);
>      total = region.agg_size_full;
>      for (i = 0; i < n_ctxs; i++) {
> -        const TCGContext *s = atomic_read(&tcg_ctxs[i]);
> +        const TCGContext *s = qatomic_read(&tcg_ctxs[i]);
>          size_t size;
>  
> -        size = atomic_read(&s->code_gen_ptr) - s->code_gen_buffer;
> +        size = qatomic_read(&s->code_gen_ptr) - s->code_gen_buffer;
>          g_assert(size <= s->code_gen_buffer_size);
>          total += size;
>      }
> @@ -855,14 +855,14 @@ size_t tcg_code_capacity(void)
>  
>  size_t tcg_tb_phys_invalidate_count(void)
>  {
> -    unsigned int n_ctxs = atomic_read(&n_tcg_ctxs);
> +    unsigned int n_ctxs = qatomic_read(&n_tcg_ctxs);
>      unsigned int i;
>      size_t total = 0;
>  
>      for (i = 0; i < n_ctxs; i++) {
> -        const TCGContext *s = atomic_read(&tcg_ctxs[i]);
> +        const TCGContext *s = qatomic_read(&tcg_ctxs[i]);
>  
> -        total += atomic_read(&s->tb_phys_invalidate_count);
> +        total += qatomic_read(&s->tb_phys_invalidate_count);
>      }
>      return total;
>  }
> @@ -1041,7 +1041,7 @@ TranslationBlock *tcg_tb_alloc(TCGContext *s)
>          }
>          goto retry;
>      }
> -    atomic_set(&s->code_gen_ptr, next);
> +    qatomic_set(&s->code_gen_ptr, next);
>      s->data_gen_ptr = NULL;
>      return tb;
>  }
> @@ -2134,7 +2134,7 @@ static void tcg_dump_ops(TCGContext *s, bool have_prefs)
>              QemuLogFile *logfile;
>  
>              rcu_read_lock();
> -            logfile = atomic_rcu_read(&qemu_logfile);
> +            logfile = qatomic_rcu_read(&qemu_logfile);
>              if (logfile) {
>                  for (; col < 40; ++col) {
>                      putc(' ', logfile->fd);
> @@ -2341,7 +2341,7 @@ void tcg_op_remove(TCGContext *s, TCGOp *op)
>      s->nb_ops--;
>  
>  #ifdef CONFIG_PROFILER
> -    atomic_set(&s->prof.del_op_count, s->prof.del_op_count + 1);
> +    qatomic_set(&s->prof.del_op_count, s->prof.del_op_count + 1);
>  #endif
>  }
>  
> @@ -3964,12 +3964,12 @@ static void tcg_reg_alloc_call(TCGContext *s, TCGOp *op)
>  /* avoid copy/paste errors */
>  #define PROF_ADD(to, from, field)                       \
>      do {                                                \
> -        (to)->field += atomic_read(&((from)->field));   \
> +        (to)->field += qatomic_read(&((from)->field));  \
>      } while (0)
>  
>  #define PROF_MAX(to, from, field)                                       \
>      do {                                                                \
> -        typeof((from)->field) val__ = atomic_read(&((from)->field));    \
> +        typeof((from)->field) val__ = qatomic_read(&((from)->field));   \
>          if (val__ > (to)->field) {                                      \
>              (to)->field = val__;                                        \
>          }                                                               \
> @@ -3979,11 +3979,11 @@ static void tcg_reg_alloc_call(TCGContext *s, TCGOp *op)
>  static inline
>  void tcg_profile_snapshot(TCGProfile *prof, bool counters, bool table)
>  {
> -    unsigned int n_ctxs = atomic_read(&n_tcg_ctxs);
> +    unsigned int n_ctxs = qatomic_read(&n_tcg_ctxs);
>      unsigned int i;
>  
>      for (i = 0; i < n_ctxs; i++) {
> -        TCGContext *s = atomic_read(&tcg_ctxs[i]);
> +        TCGContext *s = qatomic_read(&tcg_ctxs[i]);
>          const TCGProfile *orig = &s->prof;
>  
>          if (counters) {
> @@ -4042,15 +4042,15 @@ void tcg_dump_op_count(void)
>  
>  int64_t tcg_cpu_exec_time(void)
>  {
> -    unsigned int n_ctxs = atomic_read(&n_tcg_ctxs);
> +    unsigned int n_ctxs = qatomic_read(&n_tcg_ctxs);
>      unsigned int i;
>      int64_t ret = 0;
>  
>      for (i = 0; i < n_ctxs; i++) {
> -        const TCGContext *s = atomic_read(&tcg_ctxs[i]);
> +        const TCGContext *s = qatomic_read(&tcg_ctxs[i]);
>          const TCGProfile *prof = &s->prof;
>  
> -        ret += atomic_read(&prof->cpu_exec_time);
> +        ret += qatomic_read(&prof->cpu_exec_time);
>      }
>      return ret;
>  }
> @@ -4083,15 +4083,15 @@ int tcg_gen_code(TCGContext *s, TranslationBlock *tb)
>          QTAILQ_FOREACH(op, &s->ops, link) {
>              n++;
>          }
> -        atomic_set(&prof->op_count, prof->op_count + n);
> +        qatomic_set(&prof->op_count, prof->op_count + n);
>          if (n > prof->op_count_max) {
> -            atomic_set(&prof->op_count_max, n);
> +            qatomic_set(&prof->op_count_max, n);
>          }
>  
>          n = s->nb_temps;
> -        atomic_set(&prof->temp_count, prof->temp_count + n);
> +        qatomic_set(&prof->temp_count, prof->temp_count + n);
>          if (n > prof->temp_count_max) {
> -            atomic_set(&prof->temp_count_max, n);
> +            qatomic_set(&prof->temp_count_max, n);
>          }
>      }
>  #endif
> @@ -4125,7 +4125,7 @@ int tcg_gen_code(TCGContext *s, TranslationBlock *tb)
>  #endif
>  
>  #ifdef CONFIG_PROFILER
> -    atomic_set(&prof->opt_time, prof->opt_time - profile_getclock());
> +    qatomic_set(&prof->opt_time, prof->opt_time - profile_getclock());
>  #endif
>  
>  #ifdef USE_TCG_OPTIMIZATIONS
> @@ -4133,8 +4133,8 @@ int tcg_gen_code(TCGContext *s, TranslationBlock *tb)
>  #endif
>  
>  #ifdef CONFIG_PROFILER
> -    atomic_set(&prof->opt_time, prof->opt_time + profile_getclock());
> -    atomic_set(&prof->la_time, prof->la_time - profile_getclock());
> +    qatomic_set(&prof->opt_time, prof->opt_time + profile_getclock());
> +    qatomic_set(&prof->la_time, prof->la_time - profile_getclock());
>  #endif
>  
>      reachable_code_pass(s);
> @@ -4159,7 +4159,7 @@ int tcg_gen_code(TCGContext *s, TranslationBlock *tb)
>      }
>  
>  #ifdef CONFIG_PROFILER
> -    atomic_set(&prof->la_time, prof->la_time + profile_getclock());
> +    qatomic_set(&prof->la_time, prof->la_time + profile_getclock());
>  #endif
>  
>  #ifdef DEBUG_DISAS
> @@ -4190,7 +4190,7 @@ int tcg_gen_code(TCGContext *s, TranslationBlock *tb)
>          TCGOpcode opc = op->opc;
>  
>  #ifdef CONFIG_PROFILER
> -        atomic_set(&prof->table_op_count[opc], prof->table_op_count[opc] + 1);
> +        qatomic_set(&prof->table_op_count[opc], prof->table_op_count[opc] + 1);
>  #endif
>  
>          switch (opc) {
> diff --git a/tcg/tci.c b/tcg/tci.c
> index 46fe9ce63f..82039fd163 100644
> --- a/tcg/tci.c
> +++ b/tcg/tci.c
> @@ -1115,7 +1115,7 @@ uintptr_t tcg_qemu_tb_exec(CPUArchState *env, uint8_t *tb_ptr)
>          case INDEX_op_goto_tb:
>              /* Jump address is aligned */
>              tb_ptr = QEMU_ALIGN_PTR_UP(tb_ptr, 4);
> -            t0 = atomic_read((int32_t *)tb_ptr);
> +            t0 = qatomic_read((int32_t *)tb_ptr);
>              tb_ptr += sizeof(int32_t);
>              tci_assert(tb_ptr == old_code_ptr + op_size);
>              tb_ptr += (int32_t)t0;
> diff --git a/tests/atomic64-bench.c b/tests/atomic64-bench.c
> index 121a8c14f4..e474753d34 100644
> --- a/tests/atomic64-bench.c
> +++ b/tests/atomic64-bench.c
> @@ -56,17 +56,17 @@ static void *thread_func(void *arg)
>  {
>      struct thread_info *info = arg;
>  
> -    atomic_inc(&n_ready_threads);
> -    while (!atomic_read(&test_start)) {
> +    qatomic_inc(&n_ready_threads);
> +    while (!qatomic_read(&test_start)) {
>          cpu_relax();
>      }
>  
> -    while (!atomic_read(&test_stop)) {
> +    while (!qatomic_read(&test_stop)) {
>          unsigned int index;
>  
>          info->r = xorshift64star(info->r);
>          index = info->r & (range - 1);
> -        atomic_read_i64(&counts[index].i64);
> +        qatomic_read_i64(&counts[index].i64);
>          info->accesses++;
>      }
>      return NULL;
> @@ -76,13 +76,13 @@ static void run_test(void)
>  {
>      unsigned int i;
>  
> -    while (atomic_read(&n_ready_threads) != n_threads) {
> +    while (qatomic_read(&n_ready_threads) != n_threads) {
>          cpu_relax();
>      }
>  
> -    atomic_set(&test_start, true);
> +    qatomic_set(&test_start, true);
>      g_usleep(duration * G_USEC_PER_SEC);
> -    atomic_set(&test_stop, true);
> +    qatomic_set(&test_stop, true);
>  
>      for (i = 0; i < n_threads; i++) {
>          qemu_thread_join(&threads[i]);
> diff --git a/tests/atomic_add-bench.c b/tests/atomic_add-bench.c
> index 5666f6bbff..f05471ab45 100644
> --- a/tests/atomic_add-bench.c
> +++ b/tests/atomic_add-bench.c
> @@ -53,12 +53,12 @@ static void *thread_func(void *arg)
>  {
>      struct thread_info *info = arg;
>  
> -    atomic_inc(&n_ready_threads);
> -    while (!atomic_read(&test_start)) {
> +    qatomic_inc(&n_ready_threads);
> +    while (!qatomic_read(&test_start)) {
>          cpu_relax();
>      }
>  
> -    while (!atomic_read(&test_stop)) {
> +    while (!qatomic_read(&test_stop)) {
>          unsigned int index;
>  
>          info->r = xorshift64star(info->r);
> @@ -68,7 +68,7 @@ static void *thread_func(void *arg)
>              counts[index].val += 1;
>              qemu_mutex_unlock(&counts[index].lock);
>          } else {
> -            atomic_inc(&counts[index].val);
> +            qatomic_inc(&counts[index].val);
>          }
>      }
>      return NULL;
> @@ -78,13 +78,13 @@ static void run_test(void)
>  {
>      unsigned int i;
>  
> -    while (atomic_read(&n_ready_threads) != n_threads) {
> +    while (qatomic_read(&n_ready_threads) != n_threads) {
>          cpu_relax();
>      }
>  
> -    atomic_set(&test_start, true);
> +    qatomic_set(&test_start, true);
>      g_usleep(duration * G_USEC_PER_SEC);
> -    atomic_set(&test_stop, true);
> +    qatomic_set(&test_stop, true);
>  
>      for (i = 0; i < n_threads; i++) {
>          qemu_thread_join(&threads[i]);
> diff --git a/tests/iothread.c b/tests/iothread.c
> index d3a2ee9a01..afde12b4ef 100644
> --- a/tests/iothread.c
> +++ b/tests/iothread.c
> @@ -74,7 +74,7 @@ static void *iothread_run(void *opaque)
>      qemu_cond_signal(&iothread->init_done_cond);
>      qemu_mutex_unlock(&iothread->init_done_lock);
>  
> -    while (!atomic_read(&iothread->stopping)) {
> +    while (!qatomic_read(&iothread->stopping)) {
>          aio_poll(iothread->ctx, true);
>      }
>  
> diff --git a/tests/qht-bench.c b/tests/qht-bench.c
> index 362f03cb03..2e5b70ccd0 100644
> --- a/tests/qht-bench.c
> +++ b/tests/qht-bench.c
> @@ -209,13 +209,13 @@ static void *thread_func(void *p)
>  
>      rcu_register_thread();
>  
> -    atomic_inc(&n_ready_threads);
> -    while (!atomic_read(&test_start)) {
> +    qatomic_inc(&n_ready_threads);
> +    while (!qatomic_read(&test_start)) {
>          cpu_relax();
>      }
>  
>      rcu_read_lock();
> -    while (!atomic_read(&test_stop)) {
> +    while (!qatomic_read(&test_stop)) {
>          info->seed = xorshift64star(info->seed);
>          info->func(info);
>      }
> @@ -423,13 +423,13 @@ static void run_test(void)
>  {
>      int i;
>  
> -    while (atomic_read(&n_ready_threads) != n_rw_threads + n_rz_threads) {
> +    while (qatomic_read(&n_ready_threads) != n_rw_threads + n_rz_threads) {
>          cpu_relax();
>      }
>  
> -    atomic_set(&test_start, true);
> +    qatomic_set(&test_start, true);
>      g_usleep(duration * G_USEC_PER_SEC);
> -    atomic_set(&test_stop, true);
> +    qatomic_set(&test_stop, true);
>  
>      for (i = 0; i < n_rw_threads; i++) {
>          qemu_thread_join(&rw_threads[i]);
> diff --git a/tests/rcutorture.c b/tests/rcutorture.c
> index 732f03abda..de6f649058 100644
> --- a/tests/rcutorture.c
> +++ b/tests/rcutorture.c
> @@ -123,7 +123,7 @@ static void *rcu_read_perf_test(void *arg)
>      rcu_register_thread();
>  
>      *(struct rcu_reader_data **)arg = &rcu_reader;
> -    atomic_inc(&nthreadsrunning);
> +    qatomic_inc(&nthreadsrunning);
>      while (goflag == GOFLAG_INIT) {
>          g_usleep(1000);
>      }
> @@ -149,7 +149,7 @@ static void *rcu_update_perf_test(void *arg)
>      rcu_register_thread();
>  
>      *(struct rcu_reader_data **)arg = &rcu_reader;
> -    atomic_inc(&nthreadsrunning);
> +    qatomic_inc(&nthreadsrunning);
>      while (goflag == GOFLAG_INIT) {
>          g_usleep(1000);
>      }
> @@ -172,7 +172,7 @@ static void perftestinit(void)
>  
>  static void perftestrun(int nthreads, int duration, int nreaders, int nupdaters)
>  {
> -    while (atomic_read(&nthreadsrunning) < nthreads) {
> +    while (qatomic_read(&nthreadsrunning) < nthreads) {
>          g_usleep(1000);
>      }
>      goflag = GOFLAG_RUN;
> @@ -259,8 +259,8 @@ static void *rcu_read_stress_test(void *arg)
>      }
>      while (goflag == GOFLAG_RUN) {
>          rcu_read_lock();
> -        p = atomic_rcu_read(&rcu_stress_current);
> -        if (atomic_read(&p->mbtest) == 0) {
> +        p = qatomic_rcu_read(&rcu_stress_current);
> +        if (qatomic_read(&p->mbtest) == 0) {
>              n_mberror++;
>          }
>          rcu_read_lock();
> @@ -268,7 +268,7 @@ static void *rcu_read_stress_test(void *arg)
>              garbage++;
>          }
>          rcu_read_unlock();
> -        pc = atomic_read(&p->age);
> +        pc = qatomic_read(&p->age);
>          rcu_read_unlock();
>          if ((pc > RCU_STRESS_PIPE_LEN) || (pc < 0)) {
>              pc = RCU_STRESS_PIPE_LEN;
> @@ -301,7 +301,7 @@ static void *rcu_read_stress_test(void *arg)
>  static void *rcu_update_stress_test(void *arg)
>  {
>      int i, rcu_stress_idx = 0;
> -    struct rcu_stress *cp = atomic_read(&rcu_stress_current);
> +    struct rcu_stress *cp = qatomic_read(&rcu_stress_current);
>  
>      rcu_register_thread();
>      *(struct rcu_reader_data **)arg = &rcu_reader;
> @@ -319,11 +319,11 @@ static void *rcu_update_stress_test(void *arg)
>          p = &rcu_stress_array[rcu_stress_idx];
>          /* catching up with ourselves would be a bug */
>          assert(p != cp);
> -        atomic_set(&p->mbtest, 0);
> +        qatomic_set(&p->mbtest, 0);
>          smp_mb();
> -        atomic_set(&p->age, 0);
> -        atomic_set(&p->mbtest, 1);
> -        atomic_rcu_set(&rcu_stress_current, p);
> +        qatomic_set(&p->age, 0);
> +        qatomic_set(&p->mbtest, 1);
> +        qatomic_rcu_set(&rcu_stress_current, p);
>          cp = p;
>          /*
>           * New RCU structure is now live, update pipe counts on old
> @@ -331,7 +331,7 @@ static void *rcu_update_stress_test(void *arg)
>           */
>          for (i = 0; i < RCU_STRESS_PIPE_LEN; i++) {
>              if (i != rcu_stress_idx) {
> -                atomic_set(&rcu_stress_array[i].age,
> +                qatomic_set(&rcu_stress_array[i].age,
>                             rcu_stress_array[i].age + 1);
>              }
>          }
> diff --git a/tests/test-aio-multithread.c b/tests/test-aio-multithread.c
> index d3144be7e0..a555cc8835 100644
> --- a/tests/test-aio-multithread.c
> +++ b/tests/test-aio-multithread.c
> @@ -118,16 +118,16 @@ static bool schedule_next(int n)
>  {
>      Coroutine *co;
>  
> -    co = atomic_xchg(&to_schedule[n], NULL);
> +    co = qatomic_xchg(&to_schedule[n], NULL);
>      if (!co) {
> -        atomic_inc(&count_retry);
> +        qatomic_inc(&count_retry);
>          return false;
>      }
>  
>      if (n == id) {
> -        atomic_inc(&count_here);
> +        qatomic_inc(&count_here);
>      } else {
> -        atomic_inc(&count_other);
> +        qatomic_inc(&count_other);
>      }
>  
>      aio_co_schedule(ctx[n], co);
> @@ -143,13 +143,13 @@ static coroutine_fn void test_multi_co_schedule_entry(void *opaque)
>  {
>      g_assert(to_schedule[id] == NULL);
>  
> -    while (!atomic_mb_read(&now_stopping)) {
> +    while (!qatomic_mb_read(&now_stopping)) {
>          int n;
>  
>          n = g_test_rand_int_range(0, NUM_CONTEXTS);
>          schedule_next(n);
>  
> -        atomic_mb_set(&to_schedule[id], qemu_coroutine_self());
> +        qatomic_mb_set(&to_schedule[id], qemu_coroutine_self());
>          qemu_coroutine_yield();
>          g_assert(to_schedule[id] == NULL);
>      }
> @@ -171,7 +171,7 @@ static void test_multi_co_schedule(int seconds)
>  
>      g_usleep(seconds * 1000000);
>  
> -    atomic_mb_set(&now_stopping, true);
> +    qatomic_mb_set(&now_stopping, true);
>      for (i = 0; i < NUM_CONTEXTS; i++) {
>          ctx_run(i, finish_cb, NULL);
>          to_schedule[i] = NULL;
> @@ -202,7 +202,7 @@ static CoMutex comutex;
>  
>  static void coroutine_fn test_multi_co_mutex_entry(void *opaque)
>  {
> -    while (!atomic_mb_read(&now_stopping)) {
> +    while (!qatomic_mb_read(&now_stopping)) {
>          qemu_co_mutex_lock(&comutex);
>          counter++;
>          qemu_co_mutex_unlock(&comutex);
> @@ -212,9 +212,9 @@ static void coroutine_fn test_multi_co_mutex_entry(void *opaque)
>           * exits before the coroutine is woken up, causing a spurious
>           * assertion failure.
>           */
> -        atomic_inc(&atomic_counter);
> +        qatomic_inc(&atomic_counter);
>      }
> -    atomic_dec(&running);
> +    qatomic_dec(&running);
>  }
>  
>  static void test_multi_co_mutex(int threads, int seconds)
> @@ -236,7 +236,7 @@ static void test_multi_co_mutex(int threads, int seconds)
>  
>      g_usleep(seconds * 1000000);
>  
> -    atomic_mb_set(&now_stopping, true);
> +    qatomic_mb_set(&now_stopping, true);
>      while (running > 0) {
>          g_usleep(100000);
>      }
> @@ -296,9 +296,9 @@ static void mcs_mutex_lock(void)
>  
>      nodes[id].next = -1;
>      nodes[id].locked = 1;
> -    prev = atomic_xchg(&mutex_head, id);
> +    prev = qatomic_xchg(&mutex_head, id);
>      if (prev != -1) {
> -        atomic_set(&nodes[prev].next, id);
> +        qatomic_set(&nodes[prev].next, id);
>          qemu_futex_wait(&nodes[id].locked, 1);
>      }
>  }
> @@ -306,13 +306,13 @@ static void mcs_mutex_lock(void)
>  static void mcs_mutex_unlock(void)
>  {
>      int next;
> -    if (atomic_read(&nodes[id].next) == -1) {
> -        if (atomic_read(&mutex_head) == id &&
> -            atomic_cmpxchg(&mutex_head, id, -1) == id) {
> +    if (qatomic_read(&nodes[id].next) == -1) {
> +        if (qatomic_read(&mutex_head) == id &&
> +            qatomic_cmpxchg(&mutex_head, id, -1) == id) {
>              /* Last item in the list, exit.  */
>              return;
>          }
> -        while (atomic_read(&nodes[id].next) == -1) {
> +        while (qatomic_read(&nodes[id].next) == -1) {
>              /* mcs_mutex_lock did the xchg, but has not updated
>               * nodes[prev].next yet.
>               */
> @@ -320,20 +320,20 @@ static void mcs_mutex_unlock(void)
>      }
>  
>      /* Wake up the next in line.  */
> -    next = atomic_read(&nodes[id].next);
> +    next = qatomic_read(&nodes[id].next);
>      nodes[next].locked = 0;
>      qemu_futex_wake(&nodes[next].locked, 1);
>  }
>  
>  static void test_multi_fair_mutex_entry(void *opaque)
>  {
> -    while (!atomic_mb_read(&now_stopping)) {
> +    while (!qatomic_mb_read(&now_stopping)) {
>          mcs_mutex_lock();
>          counter++;
>          mcs_mutex_unlock();
> -        atomic_inc(&atomic_counter);
> +        qatomic_inc(&atomic_counter);
>      }
> -    atomic_dec(&running);
> +    qatomic_dec(&running);
>  }
>  
>  static void test_multi_fair_mutex(int threads, int seconds)
> @@ -355,7 +355,7 @@ static void test_multi_fair_mutex(int threads, int seconds)
>  
>      g_usleep(seconds * 1000000);
>  
> -    atomic_mb_set(&now_stopping, true);
> +    qatomic_mb_set(&now_stopping, true);
>      while (running > 0) {
>          g_usleep(100000);
>      }
> @@ -383,13 +383,13 @@ static QemuMutex mutex;
>  
>  static void test_multi_mutex_entry(void *opaque)
>  {
> -    while (!atomic_mb_read(&now_stopping)) {
> +    while (!qatomic_mb_read(&now_stopping)) {
>          qemu_mutex_lock(&mutex);
>          counter++;
>          qemu_mutex_unlock(&mutex);
> -        atomic_inc(&atomic_counter);
> +        qatomic_inc(&atomic_counter);
>      }
> -    atomic_dec(&running);
> +    qatomic_dec(&running);
>  }
>  
>  static void test_multi_mutex(int threads, int seconds)
> @@ -411,7 +411,7 @@ static void test_multi_mutex(int threads, int seconds)
>  
>      g_usleep(seconds * 1000000);
>  
> -    atomic_mb_set(&now_stopping, true);
> +    qatomic_mb_set(&now_stopping, true);
>      while (running > 0) {
>          g_usleep(100000);
>      }
> diff --git a/tests/test-logging.c b/tests/test-logging.c
> index 8b1522cfed..ccb819f193 100644
> --- a/tests/test-logging.c
> +++ b/tests/test-logging.c
> @@ -133,7 +133,7 @@ static void test_logfile_write(gconstpointer data)
>       */
>      qemu_set_log_filename(file_path, &error_abort);
>      rcu_read_lock();
> -    logfile = atomic_rcu_read(&qemu_logfile);
> +    logfile = qatomic_rcu_read(&qemu_logfile);
>      orig_fd = logfile->fd;
>      g_assert(logfile && logfile->fd);
>      fprintf(logfile->fd, "%s 1st write to file\n", __func__);
> @@ -141,7 +141,7 @@ static void test_logfile_write(gconstpointer data)
>  
>      /* Change the logfile and ensure that the handle is still valid. */
>      qemu_set_log_filename(file_path1, &error_abort);
> -    logfile2 = atomic_rcu_read(&qemu_logfile);
> +    logfile2 = qatomic_rcu_read(&qemu_logfile);
>      g_assert(logfile->fd == orig_fd);
>      g_assert(logfile2->fd != logfile->fd);
>      fprintf(logfile->fd, "%s 2nd write to file\n", __func__);
> diff --git a/tests/test-rcu-list.c b/tests/test-rcu-list.c
> index 92be51ec50..49641e1936 100644
> --- a/tests/test-rcu-list.c
> +++ b/tests/test-rcu-list.c
> @@ -106,7 +106,7 @@ static void reclaim_list_el(struct rcu_head *prcu)
>      struct list_element *el = container_of(prcu, struct list_element, rcu);
>      g_free(el);
>      /* Accessed only from call_rcu thread.  */
> -    atomic_set_i64(&n_reclaims, n_reclaims + 1);
> +    qatomic_set_i64(&n_reclaims, n_reclaims + 1);
>  }
>  
>  #if TEST_LIST_TYPE == 1
> @@ -172,16 +172,16 @@ static void *rcu_q_reader(void *arg)
>      rcu_register_thread();
>  
>      *(struct rcu_reader_data **)arg = &rcu_reader;
> -    atomic_inc(&nthreadsrunning);
> -    while (atomic_read(&goflag) == GOFLAG_INIT) {
> +    qatomic_inc(&nthreadsrunning);
> +    while (qatomic_read(&goflag) == GOFLAG_INIT) {
>          g_usleep(1000);
>      }
>  
> -    while (atomic_read(&goflag) == GOFLAG_RUN) {
> +    while (qatomic_read(&goflag) == GOFLAG_RUN) {
>          rcu_read_lock();
>          TEST_LIST_FOREACH_RCU(el, &Q_list_head, entry) {
>              n_reads_local++;
> -            if (atomic_read(&goflag) == GOFLAG_STOP) {
> +            if (qatomic_read(&goflag) == GOFLAG_STOP) {
>                  break;
>              }
>          }
> @@ -207,12 +207,12 @@ static void *rcu_q_updater(void *arg)
>      struct list_element *el, *prev_el;
>  
>      *(struct rcu_reader_data **)arg = &rcu_reader;
> -    atomic_inc(&nthreadsrunning);
> -    while (atomic_read(&goflag) == GOFLAG_INIT) {
> +    qatomic_inc(&nthreadsrunning);
> +    while (qatomic_read(&goflag) == GOFLAG_INIT) {
>          g_usleep(1000);
>      }
>  
> -    while (atomic_read(&goflag) == GOFLAG_RUN) {
> +    while (qatomic_read(&goflag) == GOFLAG_RUN) {
>          target_el = select_random_el(RCU_Q_LEN);
>          j = 0;
>          /* FOREACH_RCU could work here but let's use both macros */
> @@ -226,7 +226,7 @@ static void *rcu_q_updater(void *arg)
>                  break;
>              }
>          }
> -        if (atomic_read(&goflag) == GOFLAG_STOP) {
> +        if (qatomic_read(&goflag) == GOFLAG_STOP) {
>              break;
>          }
>          target_el = select_random_el(RCU_Q_LEN);
> @@ -248,7 +248,7 @@ static void *rcu_q_updater(void *arg)
>      qemu_mutex_lock(&counts_mutex);
>      n_nodes += n_nodes_local;
>      n_updates += n_updates_local;
> -    atomic_set_i64(&n_nodes_removed, n_nodes_removed + n_removed_local);
> +    qatomic_set_i64(&n_nodes_removed, n_nodes_removed + n_removed_local);
>      qemu_mutex_unlock(&counts_mutex);
>      return NULL;
>  }
> @@ -271,13 +271,13 @@ static void rcu_qtest_init(void)
>  static void rcu_qtest_run(int duration, int nreaders)
>  {
>      int nthreads = nreaders + 1;
> -    while (atomic_read(&nthreadsrunning) < nthreads) {
> +    while (qatomic_read(&nthreadsrunning) < nthreads) {
>          g_usleep(1000);
>      }
>  
> -    atomic_set(&goflag, GOFLAG_RUN);
> +    qatomic_set(&goflag, GOFLAG_RUN);
>      sleep(duration);
> -    atomic_set(&goflag, GOFLAG_STOP);
> +    qatomic_set(&goflag, GOFLAG_STOP);
>      wait_all_threads();
>  }
>  
> @@ -302,21 +302,23 @@ static void rcu_qtest(const char *test, int duration, int nreaders)
>          n_removed_local++;
>      }
>      qemu_mutex_lock(&counts_mutex);
> -    atomic_set_i64(&n_nodes_removed, n_nodes_removed + n_removed_local);
> +    qatomic_set_i64(&n_nodes_removed, n_nodes_removed + n_removed_local);
>      qemu_mutex_unlock(&counts_mutex);
>      synchronize_rcu();
> -    while (atomic_read_i64(&n_nodes_removed) > atomic_read_i64(&n_reclaims)) {
> +    while (qatomic_read_i64(&n_nodes_removed) >
> +           qatomic_read_i64(&n_reclaims)) {
>          g_usleep(100);
>          synchronize_rcu();
>      }
>      if (g_test_in_charge) {
> -        g_assert_cmpint(atomic_read_i64(&n_nodes_removed), ==,
> -                        atomic_read_i64(&n_reclaims));
> +        g_assert_cmpint(qatomic_read_i64(&n_nodes_removed), ==,
> +                        qatomic_read_i64(&n_reclaims));
>      } else {
>          printf("%s: %d readers; 1 updater; nodes read: "  \
>                 "%lld, nodes removed: %"PRIi64"; nodes reclaimed: %"PRIi64"\n",
>                 test, nthreadsrunning - 1, n_reads,
> -               atomic_read_i64(&n_nodes_removed), atomic_read_i64(&n_reclaims));
> +               qatomic_read_i64(&n_nodes_removed),
> +               qatomic_read_i64(&n_reclaims));
>          exit(0);
>      }
>  }
> diff --git a/tests/test-thread-pool.c b/tests/test-thread-pool.c
> index 0b675923f6..70dc6314a1 100644
> --- a/tests/test-thread-pool.c
> +++ b/tests/test-thread-pool.c
> @@ -21,15 +21,15 @@ typedef struct {
>  static int worker_cb(void *opaque)
>  {
>      WorkerTestData *data = opaque;
> -    return atomic_fetch_inc(&data->n);
> +    return qatomic_fetch_inc(&data->n);
>  }
>  
>  static int long_cb(void *opaque)
>  {
>      WorkerTestData *data = opaque;
> -    if (atomic_cmpxchg(&data->n, 0, 1) == 0) {
> +    if (qatomic_cmpxchg(&data->n, 0, 1) == 0) {
>          g_usleep(2000000);
> -        atomic_or(&data->n, 2);
> +        qatomic_or(&data->n, 2);
>      }
>      return 0;
>  }
> @@ -172,7 +172,7 @@ static void do_test_cancel(bool sync)
>      /* Cancel the jobs that haven't been started yet.  */
>      num_canceled = 0;
>      for (i = 0; i < 100; i++) {
> -        if (atomic_cmpxchg(&data[i].n, 0, 4) == 0) {
> +        if (qatomic_cmpxchg(&data[i].n, 0, 4) == 0) {
>              data[i].ret = -ECANCELED;
>              if (sync) {
>                  bdrv_aio_cancel(data[i].aiocb);
> @@ -186,7 +186,7 @@ static void do_test_cancel(bool sync)
>      g_assert_cmpint(num_canceled, <, 100);
>  
>      for (i = 0; i < 100; i++) {
> -        if (data[i].aiocb && atomic_read(&data[i].n) < 4) {
> +        if (data[i].aiocb && qatomic_read(&data[i].n) < 4) {
>              if (sync) {
>                  /* Canceling the others will be a blocking operation.  */
>                  bdrv_aio_cancel(data[i].aiocb);
> diff --git a/util/aio-posix.c b/util/aio-posix.c
> index f7f13ebfc2..280f27bb99 100644
> --- a/util/aio-posix.c
> +++ b/util/aio-posix.c
> @@ -27,7 +27,7 @@
>  
>  bool aio_poll_disabled(AioContext *ctx)
>  {
> -    return atomic_read(&ctx->poll_disable_cnt);
> +    return qatomic_read(&ctx->poll_disable_cnt);
>  }
>  
>  void aio_add_ready_handler(AioHandlerList *ready_list,
> @@ -148,8 +148,8 @@ void aio_set_fd_handler(AioContext *ctx,
>       * Changing handlers is a rare event, and a little wasted polling until
>       * the aio_notify below is not an issue.
>       */
> -    atomic_set(&ctx->poll_disable_cnt,
> -               atomic_read(&ctx->poll_disable_cnt) + poll_disable_change);
> +    qatomic_set(&ctx->poll_disable_cnt,
> +               qatomic_read(&ctx->poll_disable_cnt) + poll_disable_change);
>  
>      ctx->fdmon_ops->update(ctx, node, new_node);
>      if (node) {
> @@ -581,7 +581,7 @@ bool aio_poll(AioContext *ctx, bool blocking)
>       */
>      use_notify_me = timeout != 0;
>      if (use_notify_me) {
> -        atomic_set(&ctx->notify_me, atomic_read(&ctx->notify_me) + 2);
> +        qatomic_set(&ctx->notify_me, qatomic_read(&ctx->notify_me) + 2);
>          /*
>           * Write ctx->notify_me before reading ctx->notified.  Pairs with
>           * smp_mb in aio_notify().
> @@ -589,7 +589,7 @@ bool aio_poll(AioContext *ctx, bool blocking)
>          smp_mb();
>  
>          /* Don't block if aio_notify() was called */
> -        if (atomic_read(&ctx->notified)) {
> +        if (qatomic_read(&ctx->notified)) {
>              timeout = 0;
>          }
>      }
> @@ -603,8 +603,8 @@ bool aio_poll(AioContext *ctx, bool blocking)
>  
>      if (use_notify_me) {
>          /* Finish the poll before clearing the flag.  */
> -        atomic_store_release(&ctx->notify_me,
> -                             atomic_read(&ctx->notify_me) - 2);
> +        qatomic_store_release(&ctx->notify_me,
> +                             qatomic_read(&ctx->notify_me) - 2);
>      }
>  
>      aio_notify_accept(ctx);
> diff --git a/util/aio-wait.c b/util/aio-wait.c
> index b4877493f8..bdb3d3af22 100644
> --- a/util/aio-wait.c
> +++ b/util/aio-wait.c
> @@ -36,7 +36,7 @@ static void dummy_bh_cb(void *opaque)
>  void aio_wait_kick(void)
>  {
>      /* The barrier (or an atomic op) is in the caller.  */
> -    if (atomic_read(&global_aio_wait.num_waiters)) {
> +    if (qatomic_read(&global_aio_wait.num_waiters)) {
>          aio_bh_schedule_oneshot(qemu_get_aio_context(), dummy_bh_cb, NULL);
>      }
>  }
> diff --git a/util/aio-win32.c b/util/aio-win32.c
> index 49bd90e62e..e7b1d649e9 100644
> --- a/util/aio-win32.c
> +++ b/util/aio-win32.c
> @@ -345,7 +345,7 @@ bool aio_poll(AioContext *ctx, bool blocking)
>       * so disable the optimization now.
>       */
>      if (blocking) {
> -        atomic_set(&ctx->notify_me, atomic_read(&ctx->notify_me) + 2);
> +        qatomic_set(&ctx->notify_me, qatomic_read(&ctx->notify_me) + 2);
>          /*
>           * Write ctx->notify_me before computing the timeout
>           * (reading bottom half flags, etc.).  Pairs with
> @@ -384,7 +384,8 @@ bool aio_poll(AioContext *ctx, bool blocking)
>          ret = WaitForMultipleObjects(count, events, FALSE, timeout);
>          if (blocking) {
>              assert(first);
> -            atomic_store_release(&ctx->notify_me, atomic_read(&ctx->notify_me) - 2);
> +            qatomic_store_release(&ctx->notify_me,
> +                                  qatomic_read(&ctx->notify_me) - 2);
>              aio_notify_accept(ctx);
>          }
>  
> diff --git a/util/async.c b/util/async.c
> index 4266745dee..f758354c6a 100644
> --- a/util/async.c
> +++ b/util/async.c
> @@ -70,13 +70,13 @@ static void aio_bh_enqueue(QEMUBH *bh, unsigned new_flags)
>      unsigned old_flags;
>  
>      /*
> -     * The memory barrier implicit in atomic_fetch_or makes sure that:
> +     * The memory barrier implicit in qatomic_fetch_or makes sure that:
>       * 1. idle & any writes needed by the callback are done before the
>       *    locations are read in the aio_bh_poll.
>       * 2. ctx is loaded before the callback has a chance to execute and bh
>       *    could be freed.
>       */
> -    old_flags = atomic_fetch_or(&bh->flags, BH_PENDING | new_flags);
> +    old_flags = qatomic_fetch_or(&bh->flags, BH_PENDING | new_flags);
>      if (!(old_flags & BH_PENDING)) {
>          QSLIST_INSERT_HEAD_ATOMIC(&ctx->bh_list, bh, next);
>      }
> @@ -96,13 +96,13 @@ static QEMUBH *aio_bh_dequeue(BHList *head, unsigned *flags)
>      QSLIST_REMOVE_HEAD(head, next);
>  
>      /*
> -     * The atomic_and is paired with aio_bh_enqueue().  The implicit memory
> +     * The qatomic_and is paired with aio_bh_enqueue().  The implicit memory
>       * barrier ensures that the callback sees all writes done by the scheduling
>       * thread.  It also ensures that the scheduling thread sees the cleared
>       * flag before bh->cb has run, and thus will call aio_notify again if
>       * necessary.
>       */
> -    *flags = atomic_fetch_and(&bh->flags,
> +    *flags = qatomic_fetch_and(&bh->flags,
>                                ~(BH_PENDING | BH_SCHEDULED | BH_IDLE));
>      return bh;
>  }
> @@ -185,7 +185,7 @@ void qemu_bh_schedule(QEMUBH *bh)
>   */
>  void qemu_bh_cancel(QEMUBH *bh)
>  {
> -    atomic_and(&bh->flags, ~BH_SCHEDULED);
> +    qatomic_and(&bh->flags, ~BH_SCHEDULED);
>  }
>  
>  /* This func is async.The bottom half will do the delete action at the finial
> @@ -249,7 +249,7 @@ aio_ctx_prepare(GSource *source, gint    *timeout)
>  {
>      AioContext *ctx = (AioContext *) source;
>  
> -    atomic_set(&ctx->notify_me, atomic_read(&ctx->notify_me) | 1);
> +    qatomic_set(&ctx->notify_me, qatomic_read(&ctx->notify_me) | 1);
>  
>      /*
>       * Write ctx->notify_me before computing the timeout
> @@ -276,7 +276,7 @@ aio_ctx_check(GSource *source)
>      BHListSlice *s;
>  
>      /* Finish computing the timeout before clearing the flag.  */
> -    atomic_store_release(&ctx->notify_me, atomic_read(&ctx->notify_me) & ~1);
> +    qatomic_store_release(&ctx->notify_me, qatomic_read(&ctx->notify_me) & ~1);
>      aio_notify_accept(ctx);
>  
>      QSLIST_FOREACH_RCU(bh, &ctx->bh_list, next) {
> @@ -424,21 +424,21 @@ void aio_notify(AioContext *ctx)
>       * aio_notify_accept.
>       */
>      smp_wmb();
> -    atomic_set(&ctx->notified, true);
> +    qatomic_set(&ctx->notified, true);
>  
>      /*
>       * Write ctx->notified before reading ctx->notify_me.  Pairs
>       * with smp_mb in aio_ctx_prepare or aio_poll.
>       */
>      smp_mb();
> -    if (atomic_read(&ctx->notify_me)) {
> +    if (qatomic_read(&ctx->notify_me)) {
>          event_notifier_set(&ctx->notifier);
>      }
>  }
>  
>  void aio_notify_accept(AioContext *ctx)
>  {
> -    atomic_set(&ctx->notified, false);
> +    qatomic_set(&ctx->notified, false);
>  
>      /*
>       * Write ctx->notified before reading e.g. bh->flags.  Pairs with smp_wmb
> @@ -465,7 +465,7 @@ static bool aio_context_notifier_poll(void *opaque)
>      EventNotifier *e = opaque;
>      AioContext *ctx = container_of(e, AioContext, notifier);
>  
> -    return atomic_read(&ctx->notified);
> +    return qatomic_read(&ctx->notified);
>  }
>  
>  static void co_schedule_bh_cb(void *opaque)
> @@ -489,7 +489,7 @@ static void co_schedule_bh_cb(void *opaque)
>          aio_context_acquire(ctx);
>  
>          /* Protected by write barrier in qemu_aio_coroutine_enter */
> -        atomic_set(&co->scheduled, NULL);
> +        qatomic_set(&co->scheduled, NULL);
>          qemu_aio_coroutine_enter(ctx, co);
>          aio_context_release(ctx);
>      }
> @@ -546,7 +546,7 @@ fail:
>  void aio_co_schedule(AioContext *ctx, Coroutine *co)
>  {
>      trace_aio_co_schedule(ctx, co);
> -    const char *scheduled = atomic_cmpxchg(&co->scheduled, NULL,
> +    const char *scheduled = qatomic_cmpxchg(&co->scheduled, NULL,
>                                             __func__);
>  
>      if (scheduled) {
> @@ -577,7 +577,7 @@ void aio_co_wake(struct Coroutine *co)
>       * qemu_coroutine_enter.
>       */
>      smp_read_barrier_depends();
> -    ctx = atomic_read(&co->ctx);
> +    ctx = qatomic_read(&co->ctx);
>  
>      aio_co_enter(ctx, co);
>  }
> diff --git a/util/atomic64.c b/util/atomic64.c
> index b198a6c9c8..93037d5b11 100644
> --- a/util/atomic64.c
> +++ b/util/atomic64.c
> @@ -51,8 +51,8 @@ static QemuSpin *addr_to_lock(const void *addr)
>          return ret;                             \
>      }
>  
> -GEN_READ(atomic_read_i64, int64_t)
> -GEN_READ(atomic_read_u64, uint64_t)
> +GEN_READ(qatomic_read_i64, int64_t)
> +GEN_READ(qatomic_read_u64, uint64_t)
>  #undef GEN_READ
>  
>  #define GEN_SET(name, type)                     \
> @@ -65,11 +65,11 @@ GEN_READ(atomic_read_u64, uint64_t)
>          qemu_spin_unlock(lock);                 \
>      }
>  
> -GEN_SET(atomic_set_i64, int64_t)
> -GEN_SET(atomic_set_u64, uint64_t)
> +GEN_SET(qatomic_set_i64, int64_t)
> +GEN_SET(qatomic_set_u64, uint64_t)
>  #undef GEN_SET
>  
> -void atomic64_init(void)
> +void qatomic64_init(void)
>  {
>      int i;
>  
> diff --git a/util/bitmap.c b/util/bitmap.c
> index 1753ff7f5b..1f201393ae 100644
> --- a/util/bitmap.c
> +++ b/util/bitmap.c
> @@ -190,7 +190,7 @@ void bitmap_set_atomic(unsigned long *map, long start, long nr)
>  
>      /* First word */
>      if (nr - bits_to_set > 0) {
> -        atomic_or(p, mask_to_set);
> +        qatomic_or(p, mask_to_set);
>          nr -= bits_to_set;
>          bits_to_set = BITS_PER_LONG;
>          mask_to_set = ~0UL;
> @@ -209,9 +209,9 @@ void bitmap_set_atomic(unsigned long *map, long start, long nr)
>      /* Last word */
>      if (nr) {
>          mask_to_set &= BITMAP_LAST_WORD_MASK(size);
> -        atomic_or(p, mask_to_set);
> +        qatomic_or(p, mask_to_set);
>      } else {
> -        /* If we avoided the full barrier in atomic_or(), issue a
> +        /* If we avoided the full barrier in qatomic_or(), issue a
>           * barrier to account for the assignments in the while loop.
>           */
>          smp_mb();
> @@ -253,7 +253,7 @@ bool bitmap_test_and_clear_atomic(unsigned long *map, long start, long nr)
>  
>      /* First word */
>      if (nr - bits_to_clear > 0) {
> -        old_bits = atomic_fetch_and(p, ~mask_to_clear);
> +        old_bits = qatomic_fetch_and(p, ~mask_to_clear);
>          dirty |= old_bits & mask_to_clear;
>          nr -= bits_to_clear;
>          bits_to_clear = BITS_PER_LONG;
> @@ -265,7 +265,7 @@ bool bitmap_test_and_clear_atomic(unsigned long *map, long start, long nr)
>      if (bits_to_clear == BITS_PER_LONG) {
>          while (nr >= BITS_PER_LONG) {
>              if (*p) {
> -                old_bits = atomic_xchg(p, 0);
> +                old_bits = qatomic_xchg(p, 0);
>                  dirty |= old_bits;
>              }
>              nr -= BITS_PER_LONG;
> @@ -276,7 +276,7 @@ bool bitmap_test_and_clear_atomic(unsigned long *map, long start, long nr)
>      /* Last word */
>      if (nr) {
>          mask_to_clear &= BITMAP_LAST_WORD_MASK(size);
> -        old_bits = atomic_fetch_and(p, ~mask_to_clear);
> +        old_bits = qatomic_fetch_and(p, ~mask_to_clear);
>          dirty |= old_bits & mask_to_clear;
>      } else {
>          if (!dirty) {
> @@ -291,7 +291,7 @@ void bitmap_copy_and_clear_atomic(unsigned long *dst, unsigned long *src,
>                                    long nr)
>  {
>      while (nr > 0) {
> -        *dst = atomic_xchg(src, 0);
> +        *dst = qatomic_xchg(src, 0);
>          dst++;
>          src++;
>          nr -= BITS_PER_LONG;
> diff --git a/util/cacheinfo.c b/util/cacheinfo.c
> index d94dc6adc8..7804c186b6 100644
> --- a/util/cacheinfo.c
> +++ b/util/cacheinfo.c
> @@ -193,5 +193,5 @@ static void __attribute__((constructor)) init_cache_info(void)
>      qemu_dcache_linesize = dsize;
>      qemu_dcache_linesize_log = ctz32(dsize);
>  
> -    atomic64_init();
> +    qatomic64_init();
>  }
> diff --git a/util/fdmon-epoll.c b/util/fdmon-epoll.c
> index fcd989d47d..e11a8a022e 100644
> --- a/util/fdmon-epoll.c
> +++ b/util/fdmon-epoll.c
> @@ -65,7 +65,7 @@ static int fdmon_epoll_wait(AioContext *ctx, AioHandlerList *ready_list,
>      struct epoll_event events[128];
>  
>      /* Fall back while external clients are disabled */
> -    if (atomic_read(&ctx->external_disable_cnt)) {
> +    if (qatomic_read(&ctx->external_disable_cnt)) {
>          return fdmon_poll_ops.wait(ctx, ready_list, timeout);
>      }
>  
> @@ -132,7 +132,7 @@ bool fdmon_epoll_try_upgrade(AioContext *ctx, unsigned npfd)
>      }
>  
>      /* Do not upgrade while external clients are disabled */
> -    if (atomic_read(&ctx->external_disable_cnt)) {
> +    if (qatomic_read(&ctx->external_disable_cnt)) {
>          return false;
>      }
>  
> diff --git a/util/fdmon-io_uring.c b/util/fdmon-io_uring.c
> index 1d14177df0..1461dfa407 100644
> --- a/util/fdmon-io_uring.c
> +++ b/util/fdmon-io_uring.c
> @@ -103,7 +103,7 @@ static void enqueue(AioHandlerSList *head, AioHandler *node, unsigned flags)
>  {
>      unsigned old_flags;
>  
> -    old_flags = atomic_fetch_or(&node->flags, FDMON_IO_URING_PENDING | flags);
> +    old_flags = qatomic_fetch_or(&node->flags, FDMON_IO_URING_PENDING | flags);
>      if (!(old_flags & FDMON_IO_URING_PENDING)) {
>          QSLIST_INSERT_HEAD_ATOMIC(head, node, node_submitted);
>      }
> @@ -127,7 +127,7 @@ static AioHandler *dequeue(AioHandlerSList *head, unsigned *flags)
>       * telling process_cqe() to delete the AioHandler when its
>       * IORING_OP_POLL_ADD completes.
>       */
> -    *flags = atomic_fetch_and(&node->flags, ~(FDMON_IO_URING_PENDING |
> +    *flags = qatomic_fetch_and(&node->flags, ~(FDMON_IO_URING_PENDING |
>                                                FDMON_IO_URING_ADD));
>      return node;
>  }
> @@ -233,7 +233,7 @@ static bool process_cqe(AioContext *ctx,
>       * with enqueue() here then we can safely clear the FDMON_IO_URING_REMOVE
>       * bit before IORING_OP_POLL_REMOVE is submitted.
>       */
> -    flags = atomic_fetch_and(&node->flags, ~FDMON_IO_URING_REMOVE);
> +    flags = qatomic_fetch_and(&node->flags, ~FDMON_IO_URING_REMOVE);
>      if (flags & FDMON_IO_URING_REMOVE) {
>          QLIST_INSERT_HEAD_RCU(&ctx->deleted_aio_handlers, node, node_deleted);
>          return false;
> @@ -273,7 +273,7 @@ static int fdmon_io_uring_wait(AioContext *ctx, AioHandlerList *ready_list,
>      int ret;
>  
>      /* Fall back while external clients are disabled */
> -    if (atomic_read(&ctx->external_disable_cnt)) {
> +    if (qatomic_read(&ctx->external_disable_cnt)) {
>          return fdmon_poll_ops.wait(ctx, ready_list, timeout);
>      }
>  
> @@ -312,7 +312,7 @@ static bool fdmon_io_uring_need_wait(AioContext *ctx)
>      }
>  
>      /* Are we falling back to fdmon-poll? */
> -    return atomic_read(&ctx->external_disable_cnt);
> +    return qatomic_read(&ctx->external_disable_cnt);
>  }
>  
>  static const FDMonOps fdmon_io_uring_ops = {
> @@ -344,7 +344,7 @@ void fdmon_io_uring_destroy(AioContext *ctx)
>  
>          /* Move handlers due to be removed onto the deleted list */
>          while ((node = QSLIST_FIRST_RCU(&ctx->submit_list))) {
> -            unsigned flags = atomic_fetch_and(&node->flags,
> +            unsigned flags = qatomic_fetch_and(&node->flags,
>                      ~(FDMON_IO_URING_PENDING |
>                        FDMON_IO_URING_ADD |
>                        FDMON_IO_URING_REMOVE));
> diff --git a/util/lockcnt.c b/util/lockcnt.c
> index 4f88dcf8b8..5da36946b1 100644
> --- a/util/lockcnt.c
> +++ b/util/lockcnt.c
> @@ -61,7 +61,7 @@ static bool qemu_lockcnt_cmpxchg_or_wait(QemuLockCnt *lockcnt, int *val,
>          int expected = *val;
>  
>          trace_lockcnt_fast_path_attempt(lockcnt, expected, new_if_free);
> -        *val = atomic_cmpxchg(&lockcnt->count, expected, new_if_free);
> +        *val = qatomic_cmpxchg(&lockcnt->count, expected, new_if_free);
>          if (*val == expected) {
>              trace_lockcnt_fast_path_success(lockcnt, expected, new_if_free);
>              *val = new_if_free;
> @@ -81,7 +81,7 @@ static bool qemu_lockcnt_cmpxchg_or_wait(QemuLockCnt *lockcnt, int *val,
>              int new = expected - QEMU_LOCKCNT_STATE_LOCKED + QEMU_LOCKCNT_STATE_WAITING;
>  
>              trace_lockcnt_futex_wait_prepare(lockcnt, expected, new);
> -            *val = atomic_cmpxchg(&lockcnt->count, expected, new);
> +            *val = qatomic_cmpxchg(&lockcnt->count, expected, new);
>              if (*val == expected) {
>                  *val = new;
>              }
> @@ -92,7 +92,7 @@ static bool qemu_lockcnt_cmpxchg_or_wait(QemuLockCnt *lockcnt, int *val,
>              *waited = true;
>              trace_lockcnt_futex_wait(lockcnt, *val);
>              qemu_futex_wait(&lockcnt->count, *val);
> -            *val = atomic_read(&lockcnt->count);
> +            *val = qatomic_read(&lockcnt->count);
>              trace_lockcnt_futex_wait_resume(lockcnt, *val);
>              continue;
>          }
> @@ -110,13 +110,14 @@ static void lockcnt_wake(QemuLockCnt *lockcnt)
>  
>  void qemu_lockcnt_inc(QemuLockCnt *lockcnt)
>  {
> -    int val = atomic_read(&lockcnt->count);
> +    int val = qatomic_read(&lockcnt->count);
>      bool waited = false;
>  
>      for (;;) {
>          if (val >= QEMU_LOCKCNT_COUNT_STEP) {
>              int expected = val;
> -            val = atomic_cmpxchg(&lockcnt->count, val, val + QEMU_LOCKCNT_COUNT_STEP);
> +            val = qatomic_cmpxchg(&lockcnt->count, val,
> +                                  val + QEMU_LOCKCNT_COUNT_STEP);
>              if (val == expected) {
>                  break;
>              }
> @@ -142,7 +143,7 @@ void qemu_lockcnt_inc(QemuLockCnt *lockcnt)
>  
>  void qemu_lockcnt_dec(QemuLockCnt *lockcnt)
>  {
> -    atomic_sub(&lockcnt->count, QEMU_LOCKCNT_COUNT_STEP);
> +    qatomic_sub(&lockcnt->count, QEMU_LOCKCNT_COUNT_STEP);
>  }
>  
>  /* Decrement a counter, and return locked if it is decremented to zero.
> @@ -151,14 +152,15 @@ void qemu_lockcnt_dec(QemuLockCnt *lockcnt)
>   */
>  bool qemu_lockcnt_dec_and_lock(QemuLockCnt *lockcnt)
>  {
> -    int val = atomic_read(&lockcnt->count);
> +    int val = qatomic_read(&lockcnt->count);
>      int locked_state = QEMU_LOCKCNT_STATE_LOCKED;
>      bool waited = false;
>  
>      for (;;) {
>          if (val >= 2 * QEMU_LOCKCNT_COUNT_STEP) {
>              int expected = val;
> -            val = atomic_cmpxchg(&lockcnt->count, val, val - QEMU_LOCKCNT_COUNT_STEP);
> +            val = qatomic_cmpxchg(&lockcnt->count, val,
> +                                  val - QEMU_LOCKCNT_COUNT_STEP);
>              if (val == expected) {
>                  break;
>              }
> @@ -199,7 +201,7 @@ bool qemu_lockcnt_dec_and_lock(QemuLockCnt *lockcnt)
>   */
>  bool qemu_lockcnt_dec_if_lock(QemuLockCnt *lockcnt)
>  {
> -    int val = atomic_read(&lockcnt->count);
> +    int val = qatomic_read(&lockcnt->count);
>      int locked_state = QEMU_LOCKCNT_STATE_LOCKED;
>      bool waited = false;
>  
> @@ -233,7 +235,7 @@ bool qemu_lockcnt_dec_if_lock(QemuLockCnt *lockcnt)
>  
>  void qemu_lockcnt_lock(QemuLockCnt *lockcnt)
>  {
> -    int val = atomic_read(&lockcnt->count);
> +    int val = qatomic_read(&lockcnt->count);
>      int step = QEMU_LOCKCNT_STATE_LOCKED;
>      bool waited = false;
>  
> @@ -255,12 +257,12 @@ void qemu_lockcnt_inc_and_unlock(QemuLockCnt *lockcnt)
>  {
>      int expected, new, val;
>  
> -    val = atomic_read(&lockcnt->count);
> +    val = qatomic_read(&lockcnt->count);
>      do {
>          expected = val;
>          new = (val + QEMU_LOCKCNT_COUNT_STEP) & ~QEMU_LOCKCNT_STATE_MASK;
>          trace_lockcnt_unlock_attempt(lockcnt, val, new);
> -        val = atomic_cmpxchg(&lockcnt->count, val, new);
> +        val = qatomic_cmpxchg(&lockcnt->count, val, new);
>      } while (val != expected);
>  
>      trace_lockcnt_unlock_success(lockcnt, val, new);
> @@ -273,12 +275,12 @@ void qemu_lockcnt_unlock(QemuLockCnt *lockcnt)
>  {
>      int expected, new, val;
>  
> -    val = atomic_read(&lockcnt->count);
> +    val = qatomic_read(&lockcnt->count);
>      do {
>          expected = val;
>          new = val & ~QEMU_LOCKCNT_STATE_MASK;
>          trace_lockcnt_unlock_attempt(lockcnt, val, new);
> -        val = atomic_cmpxchg(&lockcnt->count, val, new);
> +        val = qatomic_cmpxchg(&lockcnt->count, val, new);
>      } while (val != expected);
>  
>      trace_lockcnt_unlock_success(lockcnt, val, new);
> @@ -289,7 +291,7 @@ void qemu_lockcnt_unlock(QemuLockCnt *lockcnt)
>  
>  unsigned qemu_lockcnt_count(QemuLockCnt *lockcnt)
>  {
> -    return atomic_read(&lockcnt->count) >> QEMU_LOCKCNT_COUNT_SHIFT;
> +    return qatomic_read(&lockcnt->count) >> QEMU_LOCKCNT_COUNT_SHIFT;
>  }
>  #else
>  void qemu_lockcnt_init(QemuLockCnt *lockcnt)
> @@ -307,13 +309,13 @@ void qemu_lockcnt_inc(QemuLockCnt *lockcnt)
>  {
>      int old;
>      for (;;) {
> -        old = atomic_read(&lockcnt->count);
> +        old = qatomic_read(&lockcnt->count);
>          if (old == 0) {
>              qemu_lockcnt_lock(lockcnt);
>              qemu_lockcnt_inc_and_unlock(lockcnt);
>              return;
>          } else {
> -            if (atomic_cmpxchg(&lockcnt->count, old, old + 1) == old) {
> +            if (qatomic_cmpxchg(&lockcnt->count, old, old + 1) == old) {
>                  return;
>              }
>          }
> @@ -322,7 +324,7 @@ void qemu_lockcnt_inc(QemuLockCnt *lockcnt)
>  
>  void qemu_lockcnt_dec(QemuLockCnt *lockcnt)
>  {
> -    atomic_dec(&lockcnt->count);
> +    qatomic_dec(&lockcnt->count);
>  }
>  
>  /* Decrement a counter, and return locked if it is decremented to zero.
> @@ -331,9 +333,9 @@ void qemu_lockcnt_dec(QemuLockCnt *lockcnt)
>   */
>  bool qemu_lockcnt_dec_and_lock(QemuLockCnt *lockcnt)
>  {
> -    int val = atomic_read(&lockcnt->count);
> +    int val = qatomic_read(&lockcnt->count);
>      while (val > 1) {
> -        int old = atomic_cmpxchg(&lockcnt->count, val, val - 1);
> +        int old = qatomic_cmpxchg(&lockcnt->count, val, val - 1);
>          if (old != val) {
>              val = old;
>              continue;
> @@ -343,7 +345,7 @@ bool qemu_lockcnt_dec_and_lock(QemuLockCnt *lockcnt)
>      }
>  
>      qemu_lockcnt_lock(lockcnt);
> -    if (atomic_fetch_dec(&lockcnt->count) == 1) {
> +    if (qatomic_fetch_dec(&lockcnt->count) == 1) {
>          return true;
>      }
>  
> @@ -360,13 +362,13 @@ bool qemu_lockcnt_dec_and_lock(QemuLockCnt *lockcnt)
>  bool qemu_lockcnt_dec_if_lock(QemuLockCnt *lockcnt)
>  {
>      /* No need for acquire semantics if we return false.  */
> -    int val = atomic_read(&lockcnt->count);
> +    int val = qatomic_read(&lockcnt->count);
>      if (val > 1) {
>          return false;
>      }
>  
>      qemu_lockcnt_lock(lockcnt);
> -    if (atomic_fetch_dec(&lockcnt->count) == 1) {
> +    if (qatomic_fetch_dec(&lockcnt->count) == 1) {
>          return true;
>      }
>  
> @@ -381,7 +383,7 @@ void qemu_lockcnt_lock(QemuLockCnt *lockcnt)
>  
>  void qemu_lockcnt_inc_and_unlock(QemuLockCnt *lockcnt)
>  {
> -    atomic_inc(&lockcnt->count);
> +    qatomic_inc(&lockcnt->count);
>      qemu_mutex_unlock(&lockcnt->mutex);
>  }
>  
> @@ -392,6 +394,6 @@ void qemu_lockcnt_unlock(QemuLockCnt *lockcnt)
>  
>  unsigned qemu_lockcnt_count(QemuLockCnt *lockcnt)
>  {
> -    return atomic_read(&lockcnt->count);
> +    return qatomic_read(&lockcnt->count);
>  }
>  #endif
> diff --git a/util/log.c b/util/log.c
> index bdb3d712e8..4b423062aa 100644
> --- a/util/log.c
> +++ b/util/log.c
> @@ -41,7 +41,7 @@ int qemu_log(const char *fmt, ...)
>      QemuLogFile *logfile;
>  
>      rcu_read_lock();
> -    logfile = atomic_rcu_read(&qemu_logfile);
> +    logfile = qatomic_rcu_read(&qemu_logfile);
>      if (logfile) {
>          va_list ap;
>          va_start(ap, fmt);
> @@ -98,7 +98,7 @@ void qemu_set_log(int log_flags)
>      QEMU_LOCK_GUARD(&qemu_logfile_mutex);
>      if (qemu_logfile && !need_to_open_file) {
>          logfile = qemu_logfile;
> -        atomic_rcu_set(&qemu_logfile, NULL);
> +        qatomic_rcu_set(&qemu_logfile, NULL);
>          call_rcu(logfile, qemu_logfile_free, rcu);
>      } else if (!qemu_logfile && need_to_open_file) {
>          logfile = g_new0(QemuLogFile, 1);
> @@ -135,7 +135,7 @@ void qemu_set_log(int log_flags)
>  #endif
>              log_append = 1;
>          }
> -        atomic_rcu_set(&qemu_logfile, logfile);
> +        qatomic_rcu_set(&qemu_logfile, logfile);
>      }
>  }
>  
> @@ -272,7 +272,7 @@ void qemu_log_flush(void)
>      QemuLogFile *logfile;
>  
>      rcu_read_lock();
> -    logfile = atomic_rcu_read(&qemu_logfile);
> +    logfile = qatomic_rcu_read(&qemu_logfile);
>      if (logfile) {
>          fflush(logfile->fd);
>      }
> @@ -288,7 +288,7 @@ void qemu_log_close(void)
>      logfile = qemu_logfile;
>  
>      if (logfile) {
> -        atomic_rcu_set(&qemu_logfile, NULL);
> +        qatomic_rcu_set(&qemu_logfile, NULL);
>          call_rcu(logfile, qemu_logfile_free, rcu);
>      }
>      qemu_mutex_unlock(&qemu_logfile_mutex);
> diff --git a/util/qemu-coroutine-lock.c b/util/qemu-coroutine-lock.c
> index 5da5234155..36927b5f88 100644
> --- a/util/qemu-coroutine-lock.c
> +++ b/util/qemu-coroutine-lock.c
> @@ -212,10 +212,10 @@ static void coroutine_fn qemu_co_mutex_lock_slowpath(AioContext *ctx,
>      /* This is the "Responsibility Hand-Off" protocol; a lock() picks from
>       * a concurrent unlock() the responsibility of waking somebody up.
>       */
> -    old_handoff = atomic_mb_read(&mutex->handoff);
> +    old_handoff = qatomic_mb_read(&mutex->handoff);
>      if (old_handoff &&
>          has_waiters(mutex) &&
> -        atomic_cmpxchg(&mutex->handoff, old_handoff, 0) == old_handoff) {
> +        qatomic_cmpxchg(&mutex->handoff, old_handoff, 0) == old_handoff) {
>          /* There can be no concurrent pops, because there can be only
>           * one active handoff at a time.
>           */
> @@ -250,18 +250,18 @@ void coroutine_fn qemu_co_mutex_lock(CoMutex *mutex)
>       */
>      i = 0;
>  retry_fast_path:
> -    waiters = atomic_cmpxchg(&mutex->locked, 0, 1);
> +    waiters = qatomic_cmpxchg(&mutex->locked, 0, 1);
>      if (waiters != 0) {
>          while (waiters == 1 && ++i < 1000) {
> -            if (atomic_read(&mutex->ctx) == ctx) {
> +            if (qatomic_read(&mutex->ctx) == ctx) {
>                  break;
>              }
> -            if (atomic_read(&mutex->locked) == 0) {
> +            if (qatomic_read(&mutex->locked) == 0) {
>                  goto retry_fast_path;
>              }
>              cpu_relax();
>          }
> -        waiters = atomic_fetch_inc(&mutex->locked);
> +        waiters = qatomic_fetch_inc(&mutex->locked);
>      }
>  
>      if (waiters == 0) {
> @@ -288,7 +288,7 @@ void coroutine_fn qemu_co_mutex_unlock(CoMutex *mutex)
>      mutex->ctx = NULL;
>      mutex->holder = NULL;
>      self->locks_held--;
> -    if (atomic_fetch_dec(&mutex->locked) == 1) {
> +    if (qatomic_fetch_dec(&mutex->locked) == 1) {
>          /* No waiting qemu_co_mutex_lock().  Pfew, that was easy!  */
>          return;
>      }
> @@ -311,7 +311,7 @@ void coroutine_fn qemu_co_mutex_unlock(CoMutex *mutex)
>          }
>  
>          our_handoff = mutex->sequence;
> -        atomic_mb_set(&mutex->handoff, our_handoff);
> +        qatomic_mb_set(&mutex->handoff, our_handoff);
>          if (!has_waiters(mutex)) {
>              /* The concurrent lock has not added itself yet, so it
>               * will be able to pick our handoff.
> @@ -322,7 +322,7 @@ void coroutine_fn qemu_co_mutex_unlock(CoMutex *mutex)
>          /* Try to do the handoff protocol ourselves; if somebody else has
>           * already taken it, however, we're done and they're responsible.
>           */
> -        if (atomic_cmpxchg(&mutex->handoff, our_handoff, 0) != our_handoff) {
> +        if (qatomic_cmpxchg(&mutex->handoff, our_handoff, 0) != our_handoff) {
>              break;
>          }
>      }
> diff --git a/util/qemu-coroutine-sleep.c b/util/qemu-coroutine-sleep.c
> index 769a76e57d..8c4dac4fd7 100644
> --- a/util/qemu-coroutine-sleep.c
> +++ b/util/qemu-coroutine-sleep.c
> @@ -28,7 +28,7 @@ struct QemuCoSleepState {
>  void qemu_co_sleep_wake(QemuCoSleepState *sleep_state)
>  {
>      /* Write of schedule protected by barrier write in aio_co_schedule */
> -    const char *scheduled = atomic_cmpxchg(&sleep_state->co->scheduled,
> +    const char *scheduled = qatomic_cmpxchg(&sleep_state->co->scheduled,
>                                             qemu_co_sleep_ns__scheduled, NULL);
>  
>      assert(scheduled == qemu_co_sleep_ns__scheduled);
> @@ -54,7 +54,7 @@ void coroutine_fn qemu_co_sleep_ns_wakeable(QEMUClockType type, int64_t ns,
>          .user_state_pointer = sleep_state,
>      };
>  
> -    const char *scheduled = atomic_cmpxchg(&state.co->scheduled, NULL,
> +    const char *scheduled = qatomic_cmpxchg(&state.co->scheduled, NULL,
>                                             qemu_co_sleep_ns__scheduled);
>      if (scheduled) {
>          fprintf(stderr,
> diff --git a/util/qemu-coroutine.c b/util/qemu-coroutine.c
> index c3caa6c770..38fb6d3084 100644
> --- a/util/qemu-coroutine.c
> +++ b/util/qemu-coroutine.c
> @@ -60,7 +60,7 @@ Coroutine *qemu_coroutine_create(CoroutineEntry *entry, void *opaque)
>                   * release_pool_size and the actual size of release_pool.  But
>                   * it is just a heuristic, it does not need to be perfect.
>                   */
> -                alloc_pool_size = atomic_xchg(&release_pool_size, 0);
> +                alloc_pool_size = qatomic_xchg(&release_pool_size, 0);
>                  QSLIST_MOVE_ATOMIC(&alloc_pool, &release_pool);
>                  co = QSLIST_FIRST(&alloc_pool);
>              }
> @@ -88,7 +88,7 @@ static void coroutine_delete(Coroutine *co)
>      if (CONFIG_COROUTINE_POOL) {
>          if (release_pool_size < POOL_BATCH_SIZE * 2) {
>              QSLIST_INSERT_HEAD_ATOMIC(&release_pool, co, pool_next);
> -            atomic_inc(&release_pool_size);
> +            qatomic_inc(&release_pool_size);
>              return;
>          }
>          if (alloc_pool_size < POOL_BATCH_SIZE) {
> @@ -115,7 +115,7 @@ void qemu_aio_coroutine_enter(AioContext *ctx, Coroutine *co)
>  
>          /* Cannot rely on the read barrier for to in aio_co_wake(), as there are
>           * callers outside of aio_co_wake() */
> -        const char *scheduled = atomic_mb_read(&to->scheduled);
> +        const char *scheduled = qatomic_mb_read(&to->scheduled);
>  
>          QSIMPLEQ_REMOVE_HEAD(&pending, co_queue_next);
>  
> diff --git a/util/qemu-sockets.c b/util/qemu-sockets.c
> index 99ce2fd5e6..de4bf7616e 100644
> --- a/util/qemu-sockets.c
> +++ b/util/qemu-sockets.c
> @@ -395,7 +395,7 @@ static struct addrinfo *inet_parse_connect_saddr(InetSocketAddress *saddr,
>      memset(&ai, 0, sizeof(ai));
>  
>      ai.ai_flags = AI_CANONNAME | AI_ADDRCONFIG;
> -    if (atomic_read(&useV4Mapped)) {
> +    if (qatomic_read(&useV4Mapped)) {
>          ai.ai_flags |= AI_V4MAPPED;
>      }
>      ai.ai_family = inet_ai_family_from_address(saddr, &err);
> @@ -421,7 +421,7 @@ static struct addrinfo *inet_parse_connect_saddr(InetSocketAddress *saddr,
>       */
>      if (rc == EAI_BADFLAGS &&
>          (ai.ai_flags & AI_V4MAPPED)) {
> -        atomic_set(&useV4Mapped, 0);
> +        qatomic_set(&useV4Mapped, 0);
>          ai.ai_flags &= ~AI_V4MAPPED;
>          rc = getaddrinfo(saddr->host, saddr->port, &ai, &res);
>      }
> diff --git a/util/qemu-thread-posix.c b/util/qemu-thread-posix.c
> index b4c2359272..dcff5e7c5d 100644
> --- a/util/qemu-thread-posix.c
> +++ b/util/qemu-thread-posix.c
> @@ -414,8 +414,8 @@ void qemu_event_set(QemuEvent *ev)
>       */
>      assert(ev->initialized);
>      smp_mb();
> -    if (atomic_read(&ev->value) != EV_SET) {
> -        if (atomic_xchg(&ev->value, EV_SET) == EV_BUSY) {
> +    if (qatomic_read(&ev->value) != EV_SET) {
> +        if (qatomic_xchg(&ev->value, EV_SET) == EV_BUSY) {
>              /* There were waiters, wake them up.  */
>              qemu_futex_wake(ev, INT_MAX);
>          }
> @@ -427,14 +427,14 @@ void qemu_event_reset(QemuEvent *ev)
>      unsigned value;
>  
>      assert(ev->initialized);
> -    value = atomic_read(&ev->value);
> +    value = qatomic_read(&ev->value);
>      smp_mb_acquire();
>      if (value == EV_SET) {
>          /*
>           * If there was a concurrent reset (or even reset+wait),
>           * do nothing.  Otherwise change EV_SET->EV_FREE.
>           */
> -        atomic_or(&ev->value, EV_FREE);
> +        qatomic_or(&ev->value, EV_FREE);
>      }
>  }
>  
> @@ -443,7 +443,7 @@ void qemu_event_wait(QemuEvent *ev)
>      unsigned value;
>  
>      assert(ev->initialized);
> -    value = atomic_read(&ev->value);
> +    value = qatomic_read(&ev->value);
>      smp_mb_acquire();
>      if (value != EV_SET) {
>          if (value == EV_FREE) {
> @@ -453,7 +453,7 @@ void qemu_event_wait(QemuEvent *ev)
>               * a concurrent busy->free transition.  After the CAS, the
>               * event will be either set or busy.
>               */
> -            if (atomic_cmpxchg(&ev->value, EV_FREE, EV_BUSY) == EV_SET) {
> +            if (qatomic_cmpxchg(&ev->value, EV_FREE, EV_BUSY) == EV_SET) {
>                  return;
>              }
>          }
> diff --git a/util/qemu-thread-win32.c b/util/qemu-thread-win32.c
> index d207b0cb58..cb5aa2018c 100644
> --- a/util/qemu-thread-win32.c
> +++ b/util/qemu-thread-win32.c
> @@ -250,8 +250,8 @@ void qemu_event_set(QemuEvent *ev)
>       * ev->value we need a full memory barrier here.
>       */
>      smp_mb();
> -    if (atomic_read(&ev->value) != EV_SET) {
> -        if (atomic_xchg(&ev->value, EV_SET) == EV_BUSY) {
> +    if (qatomic_read(&ev->value) != EV_SET) {
> +        if (qatomic_xchg(&ev->value, EV_SET) == EV_BUSY) {
>              /* There were waiters, wake them up.  */
>              SetEvent(ev->event);
>          }
> @@ -263,13 +263,13 @@ void qemu_event_reset(QemuEvent *ev)
>      unsigned value;
>  
>      assert(ev->initialized);
> -    value = atomic_read(&ev->value);
> +    value = qatomic_read(&ev->value);
>      smp_mb_acquire();
>      if (value == EV_SET) {
>          /* If there was a concurrent reset (or even reset+wait),
>           * do nothing.  Otherwise change EV_SET->EV_FREE.
>           */
> -        atomic_or(&ev->value, EV_FREE);
> +        qatomic_or(&ev->value, EV_FREE);
>      }
>  }
>  
> @@ -278,7 +278,7 @@ void qemu_event_wait(QemuEvent *ev)
>      unsigned value;
>  
>      assert(ev->initialized);
> -    value = atomic_read(&ev->value);
> +    value = qatomic_read(&ev->value);
>      smp_mb_acquire();
>      if (value != EV_SET) {
>          if (value == EV_FREE) {
> @@ -292,7 +292,7 @@ void qemu_event_wait(QemuEvent *ev)
>               * because there cannot be a concurrent busy->free transition.
>               * After the CAS, the event will be either set or busy.
>               */
> -            if (atomic_cmpxchg(&ev->value, EV_FREE, EV_BUSY) == EV_SET) {
> +            if (qatomic_cmpxchg(&ev->value, EV_FREE, EV_BUSY) == EV_SET) {
>                  value = EV_SET;
>              } else {
>                  value = EV_BUSY;
> diff --git a/util/qemu-timer.c b/util/qemu-timer.c
> index 878d80fd5e..ca677836cb 100644
> --- a/util/qemu-timer.c
> +++ b/util/qemu-timer.c
> @@ -170,7 +170,7 @@ void qemu_clock_enable(QEMUClockType type, bool enabled)
>  
>  bool timerlist_has_timers(QEMUTimerList *timer_list)
>  {
> -    return !!atomic_read(&timer_list->active_timers);
> +    return !!qatomic_read(&timer_list->active_timers);
>  }
>  
>  bool qemu_clock_has_timers(QEMUClockType type)
> @@ -183,7 +183,7 @@ bool timerlist_expired(QEMUTimerList *timer_list)
>  {
>      int64_t expire_time;
>  
> -    if (!atomic_read(&timer_list->active_timers)) {
> +    if (!qatomic_read(&timer_list->active_timers)) {
>          return false;
>      }
>  
> @@ -213,7 +213,7 @@ int64_t timerlist_deadline_ns(QEMUTimerList *timer_list)
>      int64_t delta;
>      int64_t expire_time;
>  
> -    if (!atomic_read(&timer_list->active_timers)) {
> +    if (!qatomic_read(&timer_list->active_timers)) {
>          return -1;
>      }
>  
> @@ -385,7 +385,7 @@ static void timer_del_locked(QEMUTimerList *timer_list, QEMUTimer *ts)
>          if (!t)
>              break;
>          if (t == ts) {
> -            atomic_set(pt, t->next);
> +            qatomic_set(pt, t->next);
>              break;
>          }
>          pt = &t->next;
> @@ -408,7 +408,7 @@ static bool timer_mod_ns_locked(QEMUTimerList *timer_list,
>      }
>      ts->expire_time = MAX(expire_time, 0);
>      ts->next = *pt;
> -    atomic_set(pt, ts);
> +    qatomic_set(pt, ts);
>  
>      return pt == &timer_list->active_timers;
>  }
> @@ -502,7 +502,7 @@ bool timerlist_run_timers(QEMUTimerList *timer_list)
>      QEMUTimerCB *cb;
>      void *opaque;
>  
> -    if (!atomic_read(&timer_list->active_timers)) {
> +    if (!qatomic_read(&timer_list->active_timers)) {
>          return false;
>      }
>  
> diff --git a/util/qht.c b/util/qht.c
> index b2e020c398..079605121b 100644
> --- a/util/qht.c
> +++ b/util/qht.c
> @@ -131,11 +131,11 @@ static inline void qht_unlock(struct qht *ht)
>  
>  /*
>   * Note: reading partially-updated pointers in @pointers could lead to
> - * segfaults. We thus access them with atomic_read/set; this guarantees
> + * segfaults. We thus access them with qatomic_read/set; this guarantees
>   * that the compiler makes all those accesses atomic. We also need the
> - * volatile-like behavior in atomic_read, since otherwise the compiler
> + * volatile-like behavior in qatomic_read, since otherwise the compiler
>   * might refetch the pointer.
> - * atomic_read's are of course not necessary when the bucket lock is held.
> + * qatomic_read's are of course not necessary when the bucket lock is held.
>   *
>   * If both ht->lock and b->lock are grabbed, ht->lock should always
>   * be grabbed first.
> @@ -286,7 +286,7 @@ void qht_map_lock_buckets__no_stale(struct qht *ht, struct qht_map **pmap)
>  {
>      struct qht_map *map;
>  
> -    map = atomic_rcu_read(&ht->map);
> +    map = qatomic_rcu_read(&ht->map);
>      qht_map_lock_buckets(map);
>      if (likely(!qht_map_is_stale__locked(ht, map))) {
>          *pmap = map;
> @@ -318,7 +318,7 @@ struct qht_bucket *qht_bucket_lock__no_stale(struct qht *ht, uint32_t hash,
>      struct qht_bucket *b;
>      struct qht_map *map;
>  
> -    map = atomic_rcu_read(&ht->map);
> +    map = qatomic_rcu_read(&ht->map);
>      b = qht_map_to_bucket(map, hash);
>  
>      qemu_spin_lock(&b->lock);
> @@ -340,7 +340,8 @@ struct qht_bucket *qht_bucket_lock__no_stale(struct qht *ht, uint32_t hash,
>  
>  static inline bool qht_map_needs_resize(const struct qht_map *map)
>  {
> -    return atomic_read(&map->n_added_buckets) > map->n_added_buckets_threshold;
> +    return qatomic_read(&map->n_added_buckets) >
> +           map->n_added_buckets_threshold;
>  }
>  
>  static inline void qht_chain_destroy(const struct qht_bucket *head)
> @@ -404,7 +405,7 @@ void qht_init(struct qht *ht, qht_cmp_func_t cmp, size_t n_elems,
>      ht->mode = mode;
>      qemu_mutex_init(&ht->lock);
>      map = qht_map_create(n_buckets);
> -    atomic_rcu_set(&ht->map, map);
> +    qatomic_rcu_set(&ht->map, map);
>  }
>  
>  /* call only when there are no readers/writers left */
> @@ -425,8 +426,8 @@ static void qht_bucket_reset__locked(struct qht_bucket *head)
>              if (b->pointers[i] == NULL) {
>                  goto done;
>              }
> -            atomic_set(&b->hashes[i], 0);
> -            atomic_set(&b->pointers[i], NULL);
> +            qatomic_set(&b->hashes[i], 0);
> +            qatomic_set(&b->pointers[i], NULL);
>          }
>          b = b->next;
>      } while (b);
> @@ -492,19 +493,19 @@ void *qht_do_lookup(const struct qht_bucket *head, qht_lookup_func_t func,
>  
>      do {
>          for (i = 0; i < QHT_BUCKET_ENTRIES; i++) {
> -            if (atomic_read(&b->hashes[i]) == hash) {
> +            if (qatomic_read(&b->hashes[i]) == hash) {
>                  /* The pointer is dereferenced before seqlock_read_retry,
>                   * so (unlike qht_insert__locked) we need to use
> -                 * atomic_rcu_read here.
> +                 * qatomic_rcu_read here.
>                   */
> -                void *p = atomic_rcu_read(&b->pointers[i]);
> +                void *p = qatomic_rcu_read(&b->pointers[i]);
>  
>                  if (likely(p) && likely(func(p, userp))) {
>                      return p;
>                  }
>              }
>          }
> -        b = atomic_rcu_read(&b->next);
> +        b = qatomic_rcu_read(&b->next);
>      } while (b);
>  
>      return NULL;
> @@ -532,7 +533,7 @@ void *qht_lookup_custom(const struct qht *ht, const void *userp, uint32_t hash,
>      unsigned int version;
>      void *ret;
>  
> -    map = atomic_rcu_read(&ht->map);
> +    map = qatomic_rcu_read(&ht->map);
>      b = qht_map_to_bucket(map, hash);
>  
>      version = seqlock_read_begin(&b->sequence);
> @@ -584,7 +585,7 @@ static void *qht_insert__locked(const struct qht *ht, struct qht_map *map,
>      memset(b, 0, sizeof(*b));
>      new = b;
>      i = 0;
> -    atomic_inc(&map->n_added_buckets);
> +    qatomic_inc(&map->n_added_buckets);
>      if (unlikely(qht_map_needs_resize(map)) && needs_resize) {
>          *needs_resize = true;
>      }
> @@ -593,11 +594,11 @@ static void *qht_insert__locked(const struct qht *ht, struct qht_map *map,
>      /* found an empty key: acquire the seqlock and write */
>      seqlock_write_begin(&head->sequence);
>      if (new) {
> -        atomic_rcu_set(&prev->next, b);
> +        qatomic_rcu_set(&prev->next, b);
>      }
>      /* smp_wmb() implicit in seqlock_write_begin.  */
> -    atomic_set(&b->hashes[i], hash);
> -    atomic_set(&b->pointers[i], p);
> +    qatomic_set(&b->hashes[i], hash);
> +    qatomic_set(&b->pointers[i], p);
>      seqlock_write_end(&head->sequence);
>      return NULL;
>  }
> @@ -668,11 +669,11 @@ qht_entry_move(struct qht_bucket *to, int i, struct qht_bucket *from, int j)
>      qht_debug_assert(to->pointers[i]);
>      qht_debug_assert(from->pointers[j]);
>  
> -    atomic_set(&to->hashes[i], from->hashes[j]);
> -    atomic_set(&to->pointers[i], from->pointers[j]);
> +    qatomic_set(&to->hashes[i], from->hashes[j]);
> +    qatomic_set(&to->pointers[i], from->pointers[j]);
>  
> -    atomic_set(&from->hashes[j], 0);
> -    atomic_set(&from->pointers[j], NULL);
> +    qatomic_set(&from->hashes[j], 0);
> +    qatomic_set(&from->pointers[j], NULL);
>  }
>  
>  /*
> @@ -687,7 +688,7 @@ static inline void qht_bucket_remove_entry(struct qht_bucket *orig, int pos)
>  
>      if (qht_entry_is_last(orig, pos)) {
>          orig->hashes[pos] = 0;
> -        atomic_set(&orig->pointers[pos], NULL);
> +        qatomic_set(&orig->pointers[pos], NULL);
>          return;
>      }
>      do {
> @@ -803,7 +804,7 @@ do_qht_iter(struct qht *ht, const struct qht_iter *iter, void *userp)
>  {
>      struct qht_map *map;
>  
> -    map = atomic_rcu_read(&ht->map);
> +    map = qatomic_rcu_read(&ht->map);
>      qht_map_lock_buckets(map);
>      qht_map_iter__all_locked(map, iter, userp);
>      qht_map_unlock_buckets(map);
> @@ -876,7 +877,7 @@ static void qht_do_resize_reset(struct qht *ht, struct qht_map *new, bool reset)
>      qht_map_iter__all_locked(old, &iter, &data);
>      qht_map_debug__all_locked(new);
>  
> -    atomic_rcu_set(&ht->map, new);
> +    qatomic_rcu_set(&ht->map, new);
>      qht_map_unlock_buckets(old);
>      call_rcu(old, qht_map_destroy, rcu);
>  }
> @@ -905,7 +906,7 @@ void qht_statistics_init(const struct qht *ht, struct qht_stats *stats)
>      const struct qht_map *map;
>      int i;
>  
> -    map = atomic_rcu_read(&ht->map);
> +    map = qatomic_rcu_read(&ht->map);
>  
>      stats->used_head_buckets = 0;
>      stats->entries = 0;
> @@ -933,13 +934,13 @@ void qht_statistics_init(const struct qht *ht, struct qht_stats *stats)
>              b = head;
>              do {
>                  for (j = 0; j < QHT_BUCKET_ENTRIES; j++) {
> -                    if (atomic_read(&b->pointers[j]) == NULL) {
> +                    if (qatomic_read(&b->pointers[j]) == NULL) {
>                          break;
>                      }
>                      entries++;
>                  }
>                  buckets++;
> -                b = atomic_rcu_read(&b->next);
> +                b = qatomic_rcu_read(&b->next);
>              } while (b);
>          } while (seqlock_read_retry(&head->sequence, version));
>  
> diff --git a/util/qsp.c b/util/qsp.c
> index 7d5147f1b2..bacc5fa2f6 100644
> --- a/util/qsp.c
> +++ b/util/qsp.c
> @@ -245,11 +245,11 @@ static void qsp_do_init(void)
>  
>  static __attribute__((noinline)) void qsp_init__slowpath(void)
>  {
> -    if (atomic_cmpxchg(&qsp_initializing, false, true) == false) {
> +    if (qatomic_cmpxchg(&qsp_initializing, false, true) == false) {
>          qsp_do_init();
> -        atomic_set(&qsp_initialized, true);
> +        qatomic_set(&qsp_initialized, true);
>      } else {
> -        while (!atomic_read(&qsp_initialized)) {
> +        while (!qatomic_read(&qsp_initialized)) {
>              cpu_relax();
>          }
>      }
> @@ -258,7 +258,7 @@ static __attribute__((noinline)) void qsp_init__slowpath(void)
>  /* qsp_init() must be called from _all_ exported functions */
>  static inline void qsp_init(void)
>  {
> -    if (likely(atomic_read(&qsp_initialized))) {
> +    if (likely(qatomic_read(&qsp_initialized))) {
>          return;
>      }
>      qsp_init__slowpath();
> @@ -346,9 +346,9 @@ static QSPEntry *qsp_entry_get(const void *obj, const char *file, int line,
>   */
>  static inline void do_qsp_entry_record(QSPEntry *e, int64_t delta, bool acq)
>  {
> -    atomic_set_u64(&e->ns, e->ns + delta);
> +    qatomic_set_u64(&e->ns, e->ns + delta);
>      if (acq) {
> -        atomic_set_u64(&e->n_acqs, e->n_acqs + 1);
> +        qatomic_set_u64(&e->n_acqs, e->n_acqs + 1);
>      }
>  }
>  
> @@ -432,29 +432,29 @@ qsp_cond_timedwait(QemuCond *cond, QemuMutex *mutex, int ms,
>  
>  bool qsp_is_enabled(void)
>  {
> -    return atomic_read(&qemu_mutex_lock_func) == qsp_mutex_lock;
> +    return qatomic_read(&qemu_mutex_lock_func) == qsp_mutex_lock;
>  }
>  
>  void qsp_enable(void)
>  {
> -    atomic_set(&qemu_mutex_lock_func, qsp_mutex_lock);
> -    atomic_set(&qemu_mutex_trylock_func, qsp_mutex_trylock);
> -    atomic_set(&qemu_bql_mutex_lock_func, qsp_bql_mutex_lock);
> -    atomic_set(&qemu_rec_mutex_lock_func, qsp_rec_mutex_lock);
> -    atomic_set(&qemu_rec_mutex_trylock_func, qsp_rec_mutex_trylock);
> -    atomic_set(&qemu_cond_wait_func, qsp_cond_wait);
> -    atomic_set(&qemu_cond_timedwait_func, qsp_cond_timedwait);
> +    qatomic_set(&qemu_mutex_lock_func, qsp_mutex_lock);
> +    qatomic_set(&qemu_mutex_trylock_func, qsp_mutex_trylock);
> +    qatomic_set(&qemu_bql_mutex_lock_func, qsp_bql_mutex_lock);
> +    qatomic_set(&qemu_rec_mutex_lock_func, qsp_rec_mutex_lock);
> +    qatomic_set(&qemu_rec_mutex_trylock_func, qsp_rec_mutex_trylock);
> +    qatomic_set(&qemu_cond_wait_func, qsp_cond_wait);
> +    qatomic_set(&qemu_cond_timedwait_func, qsp_cond_timedwait);
>  }
>  
>  void qsp_disable(void)
>  {
> -    atomic_set(&qemu_mutex_lock_func, qemu_mutex_lock_impl);
> -    atomic_set(&qemu_mutex_trylock_func, qemu_mutex_trylock_impl);
> -    atomic_set(&qemu_bql_mutex_lock_func, qemu_mutex_lock_impl);
> -    atomic_set(&qemu_rec_mutex_lock_func, qemu_rec_mutex_lock_impl);
> -    atomic_set(&qemu_rec_mutex_trylock_func, qemu_rec_mutex_trylock_impl);
> -    atomic_set(&qemu_cond_wait_func, qemu_cond_wait_impl);
> -    atomic_set(&qemu_cond_timedwait_func, qemu_cond_timedwait_impl);
> +    qatomic_set(&qemu_mutex_lock_func, qemu_mutex_lock_impl);
> +    qatomic_set(&qemu_mutex_trylock_func, qemu_mutex_trylock_impl);
> +    qatomic_set(&qemu_bql_mutex_lock_func, qemu_mutex_lock_impl);
> +    qatomic_set(&qemu_rec_mutex_lock_func, qemu_rec_mutex_lock_impl);
> +    qatomic_set(&qemu_rec_mutex_trylock_func, qemu_rec_mutex_trylock_impl);
> +    qatomic_set(&qemu_cond_wait_func, qemu_cond_wait_impl);
> +    qatomic_set(&qemu_cond_timedwait_func, qemu_cond_timedwait_impl);
>  }
>  
>  static gint qsp_tree_cmp(gconstpointer ap, gconstpointer bp, gpointer up)
> @@ -538,8 +538,8 @@ static void qsp_aggregate(void *p, uint32_t h, void *up)
>       * The entry is in the global hash table; read from it atomically (as in
>       * "read once").
>       */
> -    agg->ns += atomic_read_u64(&e->ns);
> -    agg->n_acqs += atomic_read_u64(&e->n_acqs);
> +    agg->ns += qatomic_read_u64(&e->ns);
> +    agg->n_acqs += qatomic_read_u64(&e->n_acqs);
>  }
>  
>  static void qsp_iter_diff(void *p, uint32_t hash, void *htp)
> @@ -610,7 +610,7 @@ static void qsp_mktree(GTree *tree, bool callsite_coalesce)
>       * with the snapshot.
>       */
>      WITH_RCU_READ_LOCK_GUARD() {
> -        QSPSnapshot *snap = atomic_rcu_read(&qsp_snapshot);
> +        QSPSnapshot *snap = qatomic_rcu_read(&qsp_snapshot);
>  
>          /* Aggregate all results from the global hash table into a local one */
>          qht_init(&ht, qsp_entry_no_thread_cmp, QSP_INITIAL_SIZE,
> @@ -806,7 +806,7 @@ void qsp_reset(void)
>      qht_iter(&qsp_ht, qsp_aggregate, &new->ht);
>  
>      /* replace the previous snapshot, if any */
> -    old = atomic_xchg(&qsp_snapshot, new);
> +    old = qatomic_xchg(&qsp_snapshot, new);
>      if (old) {
>          call_rcu(old, qsp_snapshot_destroy, rcu);
>      }
> diff --git a/util/rcu.c b/util/rcu.c
> index c4fefa9333..13ac0f75cb 100644
> --- a/util/rcu.c
> +++ b/util/rcu.c
> @@ -57,7 +57,7 @@ static inline int rcu_gp_ongoing(unsigned long *ctr)
>  {
>      unsigned long v;
>  
> -    v = atomic_read(ctr);
> +    v = qatomic_read(ctr);
>      return v && (v != rcu_gp_ctr);
>  }
>  
> @@ -82,14 +82,14 @@ static void wait_for_readers(void)
>           */
>          qemu_event_reset(&rcu_gp_event);
>  
> -        /* Instead of using atomic_mb_set for index->waiting, and
> -         * atomic_mb_read for index->ctr, memory barriers are placed
> +        /* Instead of using qatomic_mb_set for index->waiting, and
> +         * qatomic_mb_read for index->ctr, memory barriers are placed
>           * manually since writes to different threads are independent.
>           * qemu_event_reset has acquire semantics, so no memory barrier
>           * is needed here.
>           */
>          QLIST_FOREACH(index, &registry, node) {
> -            atomic_set(&index->waiting, true);
> +            qatomic_set(&index->waiting, true);
>          }
>  
>          /* Here, order the stores to index->waiting before the loads of
> @@ -106,7 +106,7 @@ static void wait_for_readers(void)
>                  /* No need for mb_set here, worst of all we
>                   * get some extra futex wakeups.
>                   */
> -                atomic_set(&index->waiting, false);
> +                qatomic_set(&index->waiting, false);
>              }
>          }
>  
> @@ -151,7 +151,7 @@ void synchronize_rcu(void)
>  
>      QEMU_LOCK_GUARD(&rcu_registry_lock);
>      if (!QLIST_EMPTY(&registry)) {
> -        /* In either case, the atomic_mb_set below blocks stores that free
> +        /* In either case, the qatomic_mb_set below blocks stores that free
>           * old RCU-protected pointers.
>           */
>          if (sizeof(rcu_gp_ctr) < 8) {
> @@ -160,12 +160,12 @@ void synchronize_rcu(void)
>               *
>               * Switch parity: 0 -> 1, 1 -> 0.
>               */
> -            atomic_mb_set(&rcu_gp_ctr, rcu_gp_ctr ^ RCU_GP_CTR);
> +            qatomic_mb_set(&rcu_gp_ctr, rcu_gp_ctr ^ RCU_GP_CTR);
>              wait_for_readers();
> -            atomic_mb_set(&rcu_gp_ctr, rcu_gp_ctr ^ RCU_GP_CTR);
> +            qatomic_mb_set(&rcu_gp_ctr, rcu_gp_ctr ^ RCU_GP_CTR);
>          } else {
>              /* Increment current grace period.  */
> -            atomic_mb_set(&rcu_gp_ctr, rcu_gp_ctr + RCU_GP_CTR);
> +            qatomic_mb_set(&rcu_gp_ctr, rcu_gp_ctr + RCU_GP_CTR);
>          }
>  
>          wait_for_readers();
> @@ -188,8 +188,8 @@ static void enqueue(struct rcu_head *node)
>      struct rcu_head **old_tail;
>  
>      node->next = NULL;
> -    old_tail = atomic_xchg(&tail, &node->next);
> -    atomic_mb_set(old_tail, node);
> +    old_tail = qatomic_xchg(&tail, &node->next);
> +    qatomic_mb_set(old_tail, node);
>  }
>  
>  static struct rcu_head *try_dequeue(void)
> @@ -203,7 +203,7 @@ retry:
>       * The tail, because it is the first step in the enqueuing.
>       * It is only the next pointers that might be inconsistent.
>       */
> -    if (head == &dummy && atomic_mb_read(&tail) == &dummy.next) {
> +    if (head == &dummy && qatomic_mb_read(&tail) == &dummy.next) {
>          abort();
>      }
>  
> @@ -211,7 +211,7 @@ retry:
>       * wrong and we need to wait until its enqueuer finishes the update.
>       */
>      node = head;
> -    next = atomic_mb_read(&head->next);
> +    next = qatomic_mb_read(&head->next);
>      if (!next) {
>          return NULL;
>      }
> @@ -240,7 +240,7 @@ static void *call_rcu_thread(void *opaque)
>  
>      for (;;) {
>          int tries = 0;
> -        int n = atomic_read(&rcu_call_count);
> +        int n = qatomic_read(&rcu_call_count);
>  
>          /* Heuristically wait for a decent number of callbacks to pile up.
>           * Fetch rcu_call_count now, we only must process elements that were
> @@ -250,7 +250,7 @@ static void *call_rcu_thread(void *opaque)
>              g_usleep(10000);
>              if (n == 0) {
>                  qemu_event_reset(&rcu_call_ready_event);
> -                n = atomic_read(&rcu_call_count);
> +                n = qatomic_read(&rcu_call_count);
>                  if (n == 0) {
>  #if defined(CONFIG_MALLOC_TRIM)
>                      malloc_trim(4 * 1024 * 1024);
> @@ -258,10 +258,10 @@ static void *call_rcu_thread(void *opaque)
>                      qemu_event_wait(&rcu_call_ready_event);
>                  }
>              }
> -            n = atomic_read(&rcu_call_count);
> +            n = qatomic_read(&rcu_call_count);
>          }
>  
> -        atomic_sub(&rcu_call_count, n);
> +        qatomic_sub(&rcu_call_count, n);
>          synchronize_rcu();
>          qemu_mutex_lock_iothread();
>          while (n > 0) {
> @@ -289,7 +289,7 @@ void call_rcu1(struct rcu_head *node, void (*func)(struct rcu_head *node))
>  {
>      node->func = func;
>      enqueue(node);
> -    atomic_inc(&rcu_call_count);
> +    qatomic_inc(&rcu_call_count);
>      qemu_event_set(&rcu_call_ready_event);
>  }
>  
> diff --git a/util/stats64.c b/util/stats64.c
> index 389c365a9e..897613c949 100644
> --- a/util/stats64.c
> +++ b/util/stats64.c
> @@ -18,27 +18,27 @@
>  static inline void stat64_rdlock(Stat64 *s)
>  {
>      /* Keep out incoming writers to avoid them starving us. */
> -    atomic_add(&s->lock, 2);
> +    qatomic_add(&s->lock, 2);
>  
>      /* If there is a concurrent writer, wait for it.  */
> -    while (atomic_read(&s->lock) & 1) {
> +    while (qatomic_read(&s->lock) & 1) {
>          cpu_relax();
>      }
>  }
>  
>  static inline void stat64_rdunlock(Stat64 *s)
>  {
> -    atomic_sub(&s->lock, 2);
> +    qatomic_sub(&s->lock, 2);
>  }
>  
>  static inline bool stat64_wrtrylock(Stat64 *s)
>  {
> -    return atomic_cmpxchg(&s->lock, 0, 1) == 0;
> +    return qatomic_cmpxchg(&s->lock, 0, 1) == 0;
>  }
>  
>  static inline void stat64_wrunlock(Stat64 *s)
>  {
> -    atomic_dec(&s->lock);
> +    qatomic_dec(&s->lock);
>  }
>  
>  uint64_t stat64_get(const Stat64 *s)
> @@ -50,8 +50,8 @@ uint64_t stat64_get(const Stat64 *s)
>      /* 64-bit writes always take the lock, so we can read in
>       * any order.
>       */
> -    high = atomic_read(&s->high);
> -    low = atomic_read(&s->low);
> +    high = qatomic_read(&s->high);
> +    low = qatomic_read(&s->low);
>      stat64_rdunlock((Stat64 *)s);
>  
>      return ((uint64_t)high << 32) | low;
> @@ -70,9 +70,9 @@ bool stat64_add32_carry(Stat64 *s, uint32_t low, uint32_t high)
>       * order of our update.  By updating s->low first, we can check
>       * whether we have to carry into s->high.
>       */
> -    old = atomic_fetch_add(&s->low, low);
> +    old = qatomic_fetch_add(&s->low, low);
>      high += (old + low) < old;
> -    atomic_add(&s->high, high);
> +    qatomic_add(&s->high, high);
>      stat64_wrunlock(s);
>      return true;
>  }
> @@ -87,8 +87,8 @@ bool stat64_min_slow(Stat64 *s, uint64_t value)
>          return false;
>      }
>  
> -    high = atomic_read(&s->high);
> -    low = atomic_read(&s->low);
> +    high = qatomic_read(&s->high);
> +    low = qatomic_read(&s->low);
>  
>      orig = ((uint64_t)high << 32) | low;
>      if (value < orig) {
> @@ -98,9 +98,9 @@ bool stat64_min_slow(Stat64 *s, uint64_t value)
>           * effect on stat64_min is that the slow path may be triggered
>           * unnecessarily.
>           */
> -        atomic_set(&s->low, (uint32_t)value);
> +        qatomic_set(&s->low, (uint32_t)value);
>          smp_wmb();
> -        atomic_set(&s->high, value >> 32);
> +        qatomic_set(&s->high, value >> 32);
>      }
>      stat64_wrunlock(s);
>      return true;
> @@ -116,8 +116,8 @@ bool stat64_max_slow(Stat64 *s, uint64_t value)
>          return false;
>      }
>  
> -    high = atomic_read(&s->high);
> -    low = atomic_read(&s->low);
> +    high = qatomic_read(&s->high);
> +    low = qatomic_read(&s->low);
>  
>      orig = ((uint64_t)high << 32) | low;
>      if (value > orig) {
> @@ -127,9 +127,9 @@ bool stat64_max_slow(Stat64 *s, uint64_t value)
>           * effect on stat64_max is that the slow path may be triggered
>           * unnecessarily.
>           */
> -        atomic_set(&s->low, (uint32_t)value);
> +        qatomic_set(&s->low, (uint32_t)value);
>          smp_wmb();
> -        atomic_set(&s->high, value >> 32);
> +        qatomic_set(&s->high, value >> 32);
>      }
>      stat64_wrunlock(s);
>      return true;
> diff --git a/docs/devel/atomics.rst b/docs/devel/atomics.rst
> index 445c3b3503..52baa0736d 100644
> --- a/docs/devel/atomics.rst
> +++ b/docs/devel/atomics.rst
> @@ -23,9 +23,9 @@ provides macros that fall in three camps:
>  
>  - compiler barriers: ``barrier()``;
>  
> -- weak atomic access and manual memory barriers: ``atomic_read()``,
> -  ``atomic_set()``, ``smp_rmb()``, ``smp_wmb()``, ``smp_mb()``, ``smp_mb_acquire()``,
> -  ``smp_mb_release()``, ``smp_read_barrier_depends()``;
> +- weak atomic access and manual memory barriers: ``qatomic_read()``,
> +  ``qatomic_set()``, ``smp_rmb()``, ``smp_wmb()``, ``smp_mb()``,
> +  ``smp_mb_acquire()``, ``smp_mb_release()``, ``smp_read_barrier_depends()``;
>  
>  - sequentially consistent atomic access: everything else.
>  
> @@ -67,23 +67,23 @@ in the order specified by its program".
>  ``qemu/atomic.h`` provides the following set of atomic read-modify-write
>  operations::
>  
> -    void atomic_inc(ptr)
> -    void atomic_dec(ptr)
> -    void atomic_add(ptr, val)
> -    void atomic_sub(ptr, val)
> -    void atomic_and(ptr, val)
> -    void atomic_or(ptr, val)
> +    void qatomic_inc(ptr)
> +    void qatomic_dec(ptr)
> +    void qatomic_add(ptr, val)
> +    void qatomic_sub(ptr, val)
> +    void qatomic_and(ptr, val)
> +    void qatomic_or(ptr, val)
>  
> -    typeof(*ptr) atomic_fetch_inc(ptr)
> -    typeof(*ptr) atomic_fetch_dec(ptr)
> -    typeof(*ptr) atomic_fetch_add(ptr, val)
> -    typeof(*ptr) atomic_fetch_sub(ptr, val)
> -    typeof(*ptr) atomic_fetch_and(ptr, val)
> -    typeof(*ptr) atomic_fetch_or(ptr, val)
> -    typeof(*ptr) atomic_fetch_xor(ptr, val)
> -    typeof(*ptr) atomic_fetch_inc_nonzero(ptr)
> -    typeof(*ptr) atomic_xchg(ptr, val)
> -    typeof(*ptr) atomic_cmpxchg(ptr, old, new)
> +    typeof(*ptr) qatomic_fetch_inc(ptr)
> +    typeof(*ptr) qatomic_fetch_dec(ptr)
> +    typeof(*ptr) qatomic_fetch_add(ptr, val)
> +    typeof(*ptr) qatomic_fetch_sub(ptr, val)
> +    typeof(*ptr) qatomic_fetch_and(ptr, val)
> +    typeof(*ptr) qatomic_fetch_or(ptr, val)
> +    typeof(*ptr) qatomic_fetch_xor(ptr, val)
> +    typeof(*ptr) qatomic_fetch_inc_nonzero(ptr)
> +    typeof(*ptr) qatomic_xchg(ptr, val)
> +    typeof(*ptr) qatomic_cmpxchg(ptr, old, new)
>  
>  all of which return the old value of ``*ptr``.  These operations are
>  polymorphic; they operate on any type that is as wide as a pointer or
> @@ -91,19 +91,19 @@ smaller.
>  
>  Similar operations return the new value of ``*ptr``::
>  
> -    typeof(*ptr) atomic_inc_fetch(ptr)
> -    typeof(*ptr) atomic_dec_fetch(ptr)
> -    typeof(*ptr) atomic_add_fetch(ptr, val)
> -    typeof(*ptr) atomic_sub_fetch(ptr, val)
> -    typeof(*ptr) atomic_and_fetch(ptr, val)
> -    typeof(*ptr) atomic_or_fetch(ptr, val)
> -    typeof(*ptr) atomic_xor_fetch(ptr, val)
> +    typeof(*ptr) qatomic_inc_fetch(ptr)
> +    typeof(*ptr) qatomic_dec_fetch(ptr)
> +    typeof(*ptr) qatomic_add_fetch(ptr, val)
> +    typeof(*ptr) qatomic_sub_fetch(ptr, val)
> +    typeof(*ptr) qatomic_and_fetch(ptr, val)
> +    typeof(*ptr) qatomic_or_fetch(ptr, val)
> +    typeof(*ptr) qatomic_xor_fetch(ptr, val)
>  
>  ``qemu/atomic.h`` also provides loads and stores that cannot be reordered
>  with each other::
>  
> -    typeof(*ptr) atomic_mb_read(ptr)
> -    void         atomic_mb_set(ptr, val)
> +    typeof(*ptr) qatomic_mb_read(ptr)
> +    void         qatomic_mb_set(ptr, val)
>  
>  However these do not provide sequential consistency and, in particular,
>  they do not participate in the total ordering enforced by
> @@ -115,11 +115,11 @@ easiest to hardest):
>  
>  - lightweight synchronization primitives such as ``QemuEvent``
>  
> -- RCU operations (``atomic_rcu_read``, ``atomic_rcu_set``) when publishing
> +- RCU operations (``qatomic_rcu_read``, ``qatomic_rcu_set``) when publishing
>    or accessing a new version of a data structure
>  
> -- other atomic accesses: ``atomic_read`` and ``atomic_load_acquire`` for
> -  loads, ``atomic_set`` and ``atomic_store_release`` for stores, ``smp_mb``
> +- other atomic accesses: ``qatomic_read`` and ``qatomic_load_acquire`` for
> +  loads, ``qatomic_set`` and ``qatomic_store_release`` for stores, ``smp_mb``
>    to forbid reordering subsequent loads before a store.
>  
>  
> @@ -149,22 +149,22 @@ The only guarantees that you can rely upon in this case are:
>  
>  When using this model, variables are accessed with:
>  
> -- ``atomic_read()`` and ``atomic_set()``; these prevent the compiler from
> +- ``qatomic_read()`` and ``qatomic_set()``; these prevent the compiler from
>    optimizing accesses out of existence and creating unsolicited
>    accesses, but do not otherwise impose any ordering on loads and
>    stores: both the compiler and the processor are free to reorder
>    them.
>  
> -- ``atomic_load_acquire()``, which guarantees the LOAD to appear to
> +- ``qatomic_load_acquire()``, which guarantees the LOAD to appear to
>    happen, with respect to the other components of the system,
>    before all the LOAD or STORE operations specified afterwards.
> -  Operations coming before ``atomic_load_acquire()`` can still be
> +  Operations coming before ``qatomic_load_acquire()`` can still be
>    reordered after it.
>  
> -- ``atomic_store_release()``, which guarantees the STORE to appear to
> +- ``qatomic_store_release()``, which guarantees the STORE to appear to
>    happen, with respect to the other components of the system,
>    after all the LOAD or STORE operations specified before.
> -  Operations coming after ``atomic_store_release()`` can still be
> +  Operations coming after ``qatomic_store_release()`` can still be
>    reordered before it.
>  
>  Restrictions to the ordering of accesses can also be specified
> @@ -229,7 +229,7 @@ They come in six kinds:
>    dependency and a full read barrier or better is required.
>  
>  
> -Memory barriers and ``atomic_load_acquire``/``atomic_store_release`` are
> +Memory barriers and ``qatomic_load_acquire``/``qatomic_store_release`` are
>  mostly used when a data structure has one thread that is always a writer
>  and one thread that is always a reader:
>  
> @@ -238,8 +238,8 @@ and one thread that is always a reader:
>      +==================================+==================================+
>      | ::                               | ::                               |
>      |                                  |                                  |
> -    |   atomic_store_release(&a, x);   |   y = atomic_load_acquire(&b);   |
> -    |   atomic_store_release(&b, y);   |   x = atomic_load_acquire(&a);   |
> +    |   qatomic_store_release(&a, x);  |   y = qatomic_load_acquire(&b);  |
> +    |   qatomic_store_release(&b, y);  |   x = qatomic_load_acquire(&a);  |
>      +----------------------------------+----------------------------------+
>  
>  In this case, correctness is easy to check for using the "pairing"
> @@ -258,14 +258,14 @@ outside a loop.  For example:
>      |                                          |                                  |
>      |   n = 0;                                 |   n = 0;                         |
>      |   for (i = 0; i < 10; i++)               |   for (i = 0; i < 10; i++)       |
> -    |     n += atomic_load_acquire(&a[i]);     |     n += atomic_read(&a[i]);     |
> +    |     n += qatomic_load_acquire(&a[i]);    |     n += qatomic_read(&a[i]);    |
>      |                                          |   smp_mb_acquire();              |
>      +------------------------------------------+----------------------------------+
>      | ::                                       | ::                               |
>      |                                          |                                  |
>      |                                          |   smp_mb_release();              |
>      |   for (i = 0; i < 10; i++)               |   for (i = 0; i < 10; i++)       |
> -    |     atomic_store_release(&a[i], false);  |     atomic_set(&a[i], false);    |
> +    |     qatomic_store_release(&a[i], false); |     qatomic_set(&a[i], false);   |
>      +------------------------------------------+----------------------------------+
>  
>  Splitting a loop can also be useful to reduce the number of barriers:
> @@ -277,11 +277,11 @@ Splitting a loop can also be useful to reduce the number of barriers:
>      |                                          |                                  |
>      |   n = 0;                                 |     smp_mb_release();            |
>      |   for (i = 0; i < 10; i++) {             |     for (i = 0; i < 10; i++)     |
> -    |     atomic_store_release(&a[i], false);  |       atomic_set(&a[i], false);  |
> +    |     qatomic_store_release(&a[i], false); |       qatomic_set(&a[i], false); |
>      |     smp_mb();                            |     smb_mb();                    |
> -    |     n += atomic_read(&b[i]);             |     n = 0;                       |
> +    |     n += qatomic_read(&b[i]);            |     n = 0;                       |
>      |   }                                      |     for (i = 0; i < 10; i++)     |
> -    |                                          |       n += atomic_read(&b[i]);   |
> +    |                                          |       n += qatomic_read(&b[i]);  |
>      +------------------------------------------+----------------------------------+
>  
>  In this case, a ``smp_mb_release()`` is also replaced with a (possibly cheaper, and clearer
> @@ -294,10 +294,10 @@ as well) ``smp_wmb()``:
>      |                                          |                                  |
>      |                                          |     smp_mb_release();            |
>      |   for (i = 0; i < 10; i++) {             |     for (i = 0; i < 10; i++)     |
> -    |     atomic_store_release(&a[i], false);  |       atomic_set(&a[i], false);  |
> -    |     atomic_store_release(&b[i], false);  |     smb_wmb();                   |
> +    |     qatomic_store_release(&a[i], false); |       qatomic_set(&a[i], false); |
> +    |     qatomic_store_release(&b[i], false); |     smb_wmb();                   |
>      |   }                                      |     for (i = 0; i < 10; i++)     |
> -    |                                          |       atomic_set(&b[i], false);  |
> +    |                                          |       qatomic_set(&b[i], false); |
>      +------------------------------------------+----------------------------------+
>  
>  
> @@ -306,7 +306,7 @@ as well) ``smp_wmb()``:
>  Acquire/release pairing and the *synchronizes-with* relation
>  ------------------------------------------------------------
>  
> -Atomic operations other than ``atomic_set()`` and ``atomic_read()`` have
> +Atomic operations other than ``qatomic_set()`` and ``qatomic_read()`` have
>  either *acquire* or *release* semantics [#rmw]_.  This has two effects:
>  
>  .. [#rmw] Read-modify-write operations can have both---acquire applies to the
> @@ -357,16 +357,16 @@ thread 2 is relying on the *synchronizes-with* relation between ``pthread_exit``
>  
>  Synchronization between threads basically descends from this pairing of
>  a release operation and an acquire operation.  Therefore, atomic operations
> -other than ``atomic_set()`` and ``atomic_read()`` will almost always be
> +other than ``qatomic_set()`` and ``qatomic_read()`` will almost always be
>  paired with another operation of the opposite kind: an acquire operation
>  will pair with a release operation and vice versa.  This rule of thumb is
>  extremely useful; in the case of QEMU, however, note that the other
>  operation may actually be in a driver that runs in the guest!
>  
>  ``smp_read_barrier_depends()``, ``smp_rmb()``, ``smp_mb_acquire()``,
> -``atomic_load_acquire()`` and ``atomic_rcu_read()`` all count
> +``qatomic_load_acquire()`` and ``qatomic_rcu_read()`` all count
>  as acquire operations.  ``smp_wmb()``, ``smp_mb_release()``,
> -``atomic_store_release()`` and ``atomic_rcu_set()`` all count as release
> +``qatomic_store_release()`` and ``qatomic_rcu_set()`` all count as release
>  operations.  ``smp_mb()`` counts as both acquire and release, therefore
>  it can pair with any other atomic operation.  Here is an example:
>  
> @@ -375,11 +375,11 @@ it can pair with any other atomic operation.  Here is an example:
>        +======================+==============================+
>        | ::                   | ::                           |
>        |                      |                              |
> -      |   atomic_set(&a, 1); |                              |
> +      |   qatomic_set(&a, 1);|                              |
>        |   smp_wmb();         |                              |
> -      |   atomic_set(&b, 2); |   x = atomic_read(&b);       |
> +      |   qatomic_set(&b, 2);|   x = qatomic_read(&b);      |
>        |                      |   smp_rmb();                 |
> -      |                      |   y = atomic_read(&a);       |
> +      |                      |   y = qatomic_read(&a);      |
>        +----------------------+------------------------------+
>  
>  Note that a load-store pair only counts if the two operations access the
> @@ -393,9 +393,9 @@ correct synchronization:
>        +================================+================================+
>        | ::                             | ::                             |
>        |                                |                                |
> -      |   atomic_set(&a, 1);           |                                |
> -      |   atomic_store_release(&b, 2); |   x = atomic_load_acquire(&b); |
> -      |                                |   y = atomic_read(&a);         |
> +      |   qatomic_set(&a, 1);          |                                |
> +      |   qatomic_store_release(&b, 2);|   x = qatomic_load_acquire(&b);|
> +      |                                |   y = qatomic_read(&a);        |
>        +--------------------------------+--------------------------------+
>  
>  Acquire and release semantics of higher-level primitives can also be
> @@ -421,7 +421,7 @@ cannot be a data race:
>        |   smp_wmb();         |                              |
>        |   x->i = 2;          |                              |
>        |   smp_wmb();         |                              |
> -      |   atomic_set(&a, x); |  x = atomic_read(&a);        |
> +      |   qatomic_set(&a, x);|  x = qatomic_read(&a);       |
>        |                      |  smp_read_barrier_depends(); |
>        |                      |  y = x->i;                   |
>        |                      |  smp_read_barrier_depends(); |
> @@ -442,7 +442,7 @@ and memory barriers, and the equivalents in QEMU:
>    at all. Linux 4.1 updated them to implement volatile
>    semantics via ``ACCESS_ONCE`` (or the more recent ``READ``/``WRITE_ONCE``).
>  
> -  QEMU's ``atomic_read`` and ``atomic_set`` implement C11 atomic relaxed
> +  QEMU's ``qatomic_read`` and ``qatomic_set`` implement C11 atomic relaxed
>    semantics if the compiler supports it, and volatile semantics otherwise.
>    Both semantics prevent the compiler from doing certain transformations;
>    the difference is that atomic accesses are guaranteed to be atomic,
> @@ -451,8 +451,8 @@ and memory barriers, and the equivalents in QEMU:
>    since we assume the variables passed are machine-word sized and
>    properly aligned.
>  
> -  No barriers are implied by ``atomic_read`` and ``atomic_set`` in either Linux
> -  or QEMU.
> +  No barriers are implied by ``qatomic_read`` and ``qatomic_set`` in either
> +  Linux or QEMU.
>  
>  - atomic read-modify-write operations in Linux are of three kinds:
>  
> @@ -469,7 +469,7 @@ and memory barriers, and the equivalents in QEMU:
>    a different set of memory barriers; in QEMU, all of them enforce
>    sequential consistency.
>  
> -- in QEMU, ``atomic_read()`` and ``atomic_set()`` do not participate in
> +- in QEMU, ``qatomic_read()`` and ``qatomic_set()`` do not participate in
>    the total ordering enforced by sequentially-consistent operations.
>    This is because QEMU uses the C11 memory model.  The following example
>    is correct in Linux but not in QEMU:
> @@ -479,8 +479,8 @@ and memory barriers, and the equivalents in QEMU:
>        +==================================+================================+
>        | ::                               | ::                             |
>        |                                  |                                |
> -      |   a = atomic_fetch_add(&x, 2);   |   a = atomic_fetch_add(&x, 2); |
> -      |   b = READ_ONCE(&y);             |   b = atomic_read(&y);         |
> +      |   a = atomic_fetch_add(&x, 2);   |   a = qatomic_fetch_add(&x, 2);|
> +      |   b = READ_ONCE(&y);             |   b = qatomic_read(&y);        |
>        +----------------------------------+--------------------------------+
>  
>    because the read of ``y`` can be moved (by either the processor or the
> @@ -495,10 +495,10 @@ and memory barriers, and the equivalents in QEMU:
>        +================================+
>        | ::                             |
>        |                                |
> -      |   a = atomic_read(&x);         |
> -      |   atomic_set(&x, a + 2);       |
> +      |   a = qatomic_read(&x);        |
> +      |   qatomic_set(&x, a + 2);      |
>        |   smp_mb();                    |
> -      |   b = atomic_read(&y);         |
> +      |   b = qatomic_read(&y);        |
>        +--------------------------------+
>  
>  Sources
> diff --git a/scripts/kernel-doc b/scripts/kernel-doc
> index 030b5c8691..40ad782e34 100755
> --- a/scripts/kernel-doc
> +++ b/scripts/kernel-doc
> @@ -1625,7 +1625,7 @@ sub dump_function($$) {
>      # If you mess with these regexps, it's a good idea to check that
>      # the following functions' documentation still comes out right:
>      # - parport_register_device (function pointer parameters)
> -    # - atomic_set (macro)
> +    # - qatomic_set (macro)
>      # - pci_match_device, __copy_to_user (long return type)
>  
>      if ($define && $prototype =~ m/^()([a-zA-Z0-9_~:]+)\s+/) {
> diff --git a/tcg/aarch64/tcg-target.c.inc b/tcg/aarch64/tcg-target.c.inc
> index 948c35d825..2607fe4ab9 100644
> --- a/tcg/aarch64/tcg-target.c.inc
> +++ b/tcg/aarch64/tcg-target.c.inc
> @@ -1365,7 +1365,7 @@ void tb_target_set_jmp_target(uintptr_t tc_ptr, uintptr_t jmp_addr,
>          i2 = I3401_ADDI | rt << 31 | (addr & 0xfff) << 10 | rd << 5 | rd;
>      }
>      pair = (uint64_t)i2 << 32 | i1;
> -    atomic_set((uint64_t *)jmp_addr, pair);
> +    qatomic_set((uint64_t *)jmp_addr, pair);
>      flush_icache_range(jmp_addr, jmp_addr + 8);
>  }
>  
> diff --git a/tcg/mips/tcg-target.c.inc b/tcg/mips/tcg-target.c.inc
> index bd5b8e09a0..7aa2073520 100644
> --- a/tcg/mips/tcg-target.c.inc
> +++ b/tcg/mips/tcg-target.c.inc
> @@ -2662,7 +2662,7 @@ static void tcg_target_init(TCGContext *s)
>  void tb_target_set_jmp_target(uintptr_t tc_ptr, uintptr_t jmp_addr,
>                                uintptr_t addr)
>  {
> -    atomic_set((uint32_t *)jmp_addr, deposit32(OPC_J, 0, 26, addr >> 2));
> +    qatomic_set((uint32_t *)jmp_addr, deposit32(OPC_J, 0, 26, addr >> 2));
>      flush_icache_range(jmp_addr, jmp_addr + 4);
>  }
>  
> diff --git a/tcg/ppc/tcg-target.c.inc b/tcg/ppc/tcg-target.c.inc
> index 393c4b30e0..7cb40b0466 100644
> --- a/tcg/ppc/tcg-target.c.inc
> +++ b/tcg/ppc/tcg-target.c.inc
> @@ -1756,13 +1756,13 @@ void tb_target_set_jmp_target(uintptr_t tc_ptr, uintptr_t jmp_addr,
>  #endif
>  
>          /* As per the enclosing if, this is ppc64.  Avoid the _Static_assert
> -           within atomic_set that would fail to build a ppc32 host.  */
> -        atomic_set__nocheck((uint64_t *)jmp_addr, pair);
> +           within qatomic_set that would fail to build a ppc32 host.  */
> +        qatomic_set__nocheck((uint64_t *)jmp_addr, pair);
>          flush_icache_range(jmp_addr, jmp_addr + 8);
>      } else {
>          intptr_t diff = addr - jmp_addr;
>          tcg_debug_assert(in_range_b(diff));
> -        atomic_set((uint32_t *)jmp_addr, B | (diff & 0x3fffffc));
> +        qatomic_set((uint32_t *)jmp_addr, B | (diff & 0x3fffffc));
>          flush_icache_range(jmp_addr, jmp_addr + 4);
>      }
>  }
> diff --git a/tcg/sparc/tcg-target.c.inc b/tcg/sparc/tcg-target.c.inc
> index 0f1d91fc21..40bc12290c 100644
> --- a/tcg/sparc/tcg-target.c.inc
> +++ b/tcg/sparc/tcg-target.c.inc
> @@ -1839,7 +1839,8 @@ void tb_target_set_jmp_target(uintptr_t tc_ptr, uintptr_t jmp_addr,
>      tcg_debug_assert(br_disp == (int32_t)br_disp);
>  
>      if (!USE_REG_TB) {
> -        atomic_set((uint32_t *)jmp_addr, deposit32(CALL, 0, 30, br_disp >> 2));
> +        qatomic_set((uint32_t *)jmp_addr,
> +		    deposit32(CALL, 0, 30, br_disp >> 2));
>          flush_icache_range(jmp_addr, jmp_addr + 4);
>          return;
>      }
> @@ -1863,6 +1864,6 @@ void tb_target_set_jmp_target(uintptr_t tc_ptr, uintptr_t jmp_addr,
>                | INSN_IMM13((tb_disp & 0x3ff) | -0x400));
>      }
>  
> -    atomic_set((uint64_t *)jmp_addr, deposit64(i2, 32, 32, i1));
> +    qatomic_set((uint64_t *)jmp_addr, deposit64(i2, 32, 32, i1));
>      flush_icache_range(jmp_addr, jmp_addr + 8);
>  }
> 


