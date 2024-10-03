Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A1E598EF0B
	for <lists+xen-devel@lfdr.de>; Thu,  3 Oct 2024 14:19:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.809329.1221613 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1swKnq-0004zi-Ev; Thu, 03 Oct 2024 12:19:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 809329.1221613; Thu, 03 Oct 2024 12:19:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1swKnq-0004sh-4i; Thu, 03 Oct 2024 12:19:30 +0000
Received: by outflank-mailman (input) for mailman id 809329;
 Thu, 03 Oct 2024 12:19:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=d1Re=Q7=cloud.com=frediano.ziglio@srs-se1.protection.inumbo.net>)
 id 1swKnn-00043u-Oz
 for xen-devel@lists.xenproject.org; Thu, 03 Oct 2024 12:19:28 +0000
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com
 [2a00:1450:4864:20::22b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b99ce03a-8181-11ef-99a2-01e77a169b0f;
 Thu, 03 Oct 2024 14:19:23 +0200 (CEST)
Received: by mail-lj1-x22b.google.com with SMTP id
 38308e7fff4ca-2fabb837ddbso13526731fa.1
 for <xen-devel@lists.xenproject.org>; Thu, 03 Oct 2024 05:19:23 -0700 (PDT)
Received: from fziglio-desktop.. ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a991047319asm77328366b.184.2024.10.03.05.19.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Oct 2024 05:19:20 -0700 (PDT)
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
X-Inumbo-ID: b99ce03a-8181-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1727957963; x=1728562763; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RYq/uxmWWOuDIBAi5TU2oS3g/UeKBd67D/Je8r9P+wI=;
        b=akm0KPTvRmTl+KBUc8BVITbHbvKFKEVTm286n+fBqD2u7F0z+obWnTOfr1Jym/KivI
         OZbGG+sEZbdVL7dy24eX/8t+uep2IIvehMzJFvKusFDfJBkEBiVYE+HZQTqQ+ooQIlei
         Skzovg35SoLxJAKqI1bPCm1EXTcuEiNLocY0g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727957963; x=1728562763;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RYq/uxmWWOuDIBAi5TU2oS3g/UeKBd67D/Je8r9P+wI=;
        b=teX8DPv7aaD+O415UztTcFtCG27wv/3ROo2Sfn1cOmvPz34LxrJ+ciZuJQvwNkEHg/
         sDQsozhGnW+eNDtkWgRKDAyIHH13XzcKtuSzH5XgKvVyVPkFLLgPoB2iHbdi8YEpzsxo
         5YpE066avAv528nl5cNH5hqTALzCNeDtopuTjkymnLNd6/24OKEC0+UcENJobXm4rZDH
         9mZYO9LPF2LsA4KZi2ZHRJKuciHOyBWihS6TpwLRK0jaQdYAhRD7BbN3bZ+z0347RUGF
         nJvGgkRWA98RGPGXtqySO4nqK/zlWCtJONN9z1JfWhSrDFWRkNjK2RHRpjEJ0QdPKBax
         3imQ==
X-Gm-Message-State: AOJu0YwElzCG5UqmZIN+6xcyLcZl3kokSfZPvkLqfaJKhQ/uZSgHaxQe
	JcQrxLVNWPU16KEaGf21x4E2wmVmrA6Kq3fNXQtaDe7LJhqHN9gwh6HAl7mN1rwHDwTKUEa16y0
	a
X-Google-Smtp-Source: AGHT+IEYr6hpEygjZSHsODcrV2ni/tP0JAd/LkoWFcA5t84yYxdubpv9nz4DjHCVXgy1fkQwlChumQ==
X-Received: by 2002:a2e:a543:0:b0:2f0:1a95:7106 with SMTP id 38308e7fff4ca-2fae10b46admr60348081fa.39.1727957960868;
        Thu, 03 Oct 2024 05:19:20 -0700 (PDT)
From: Frediano Ziglio <frediano.ziglio@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Frediano Ziglio <frediano.ziglio@cloud.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>
Subject: [PATCH 01/20] xen: Update header guards - Generic
Date: Thu,  3 Oct 2024 13:18:49 +0100
Message-Id: <20241003121908.362888-2-frediano.ziglio@cloud.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241003121908.362888-1-frediano.ziglio@cloud.com>
References: <20241003121908.362888-1-frediano.ziglio@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Updated headers not having specific maintainers.

Signed-off-by: Frediano Ziglio <frediano.ziglio@cloud.com>
---
 xen/common/coverage/coverage.h            | 4 ++--
 xen/common/coverage/gcov.h                | 6 +++---
 xen/common/libelf/libelf-private.h        | 6 +++---
 xen/common/lz4/defs.h                     | 6 +++---
 xen/common/ubsan/ubsan.h                  | 4 ++--
 xen/common/xz/lzma2.h                     | 4 ++--
 xen/common/xz/private.h                   | 4 ++--
 xen/common/xz/stream.h                    | 4 ++--
 xen/common/zstd/bitstream.h               | 6 +++---
 xen/common/zstd/error_private.h           | 6 +++---
 xen/common/zstd/fse.h                     | 6 +++---
 xen/common/zstd/huf.h                     | 6 +++---
 xen/common/zstd/mem.h                     | 6 +++---
 xen/common/zstd/zstd_internal.h           | 6 +++---
 xen/drivers/video/font.h                  | 6 +++---
 xen/drivers/video/lfb.h                   | 4 ++--
 xen/drivers/video/modelines.h             | 4 ++--
 xen/include/asm-generic/altp2m.h          | 6 +++---
 xen/include/asm-generic/atomic-ops.h      | 6 +++---
 xen/include/asm-generic/device.h          | 6 +++---
 xen/include/asm-generic/div64.h           | 4 ++--
 xen/include/asm-generic/hardirq.h         | 6 +++---
 xen/include/asm-generic/hypercall.h       | 8 ++++----
 xen/include/asm-generic/iocap.h           | 6 +++---
 xen/include/asm-generic/paging.h          | 6 +++---
 xen/include/asm-generic/percpu.h          | 6 +++---
 xen/include/asm-generic/random.h          | 6 +++---
 xen/include/asm-generic/softirq.h         | 6 +++---
 xen/include/crypto/rijndael.h             | 6 +++---
 xen/include/crypto/vmac.h                 | 4 ++--
 xen/include/public/arch-ppc.h             | 6 +++---
 xen/include/public/arch-riscv.h           | 6 +++---
 xen/include/public/callback.h             | 6 +++---
 xen/include/public/device_tree_defs.h     | 4 ++--
 xen/include/public/dom0_ops.h             | 6 +++---
 xen/include/public/domctl.h               | 6 +++---
 xen/include/public/elfnote.h              | 6 +++---
 xen/include/public/errno.h                | 6 +++---
 xen/include/public/event_channel.h        | 6 +++---
 xen/include/public/features.h             | 6 +++---
 xen/include/public/grant_table.h          | 6 +++---
 xen/include/public/hvm/dm_op.h            | 6 +++---
 xen/include/public/hvm/e820.h             | 6 +++---
 xen/include/public/hvm/hvm_info_table.h   | 6 +++---
 xen/include/public/hvm/hvm_op.h           | 6 +++---
 xen/include/public/hvm/hvm_vcpu.h         | 6 +++---
 xen/include/public/hvm/hvm_xs_strings.h   | 6 +++---
 xen/include/public/hvm/ioreq.h            | 6 +++---
 xen/include/public/hvm/params.h           | 6 +++---
 xen/include/public/hvm/pvdrivers.h        | 6 +++---
 xen/include/public/hvm/save.h             | 6 +++---
 xen/include/public/hypfs.h                | 6 +++---
 xen/include/public/kexec.h                | 6 +++---
 xen/include/public/memory.h               | 6 +++---
 xen/include/public/nmi.h                  | 6 +++---
 xen/include/public/physdev.h              | 6 +++---
 xen/include/public/platform.h             | 6 +++---
 xen/include/public/pmu.h                  | 6 +++---
 xen/include/public/sched.h                | 6 +++---
 xen/include/public/sysctl.h               | 6 +++---
 xen/include/public/tmem.h                 | 6 +++---
 xen/include/public/trace.h                | 6 +++---
 xen/include/public/vcpu.h                 | 6 +++---
 xen/include/public/version.h              | 6 +++---
 xen/include/public/xen-compat.h           | 6 +++---
 xen/include/public/xen.h                  | 6 +++---
 xen/include/public/xencomm.h              | 6 +++---
 xen/include/public/xenoprof.h             | 6 +++---
 xen/include/public/xsm/flask_op.h         | 4 ++--
 xen/include/xen/8250-uart.h               | 6 +++---
 xen/include/xen/acpi.h                    | 6 +++---
 xen/include/xen/alternative-call.h        | 6 +++---
 xen/include/xen/atomic.h                  | 6 +++---
 xen/include/xen/bitmap.h                  | 6 +++---
 xen/include/xen/bitops.h                  | 6 +++---
 xen/include/xen/bug.h                     | 6 +++---
 xen/include/xen/byteorder/big_endian.h    | 6 +++---
 xen/include/xen/byteorder/generic.h       | 6 +++---
 xen/include/xen/byteorder/little_endian.h | 6 +++---
 xen/include/xen/byteorder/swab.h          | 6 +++---
 xen/include/xen/cache.h                   | 6 +++---
 xen/include/xen/compat.h                  | 6 +++---
 xen/include/xen/compiler.h                | 6 +++---
 xen/include/xen/config.h                  | 6 +++---
 xen/include/xen/console.h                 | 6 +++---
 xen/include/xen/consoled.h                | 6 +++---
 xen/include/xen/const.h                   | 6 +++---
 xen/include/xen/coverage.h                | 4 ++--
 xen/include/xen/cper.h                    | 4 ++--
 xen/include/xen/cpu.h                     | 6 +++---
 xen/include/xen/cpuidle.h                 | 6 +++---
 xen/include/xen/cpumask.h                 | 6 +++---
 xen/include/xen/ctype.h                   | 4 ++--
 xen/include/xen/decompress.h              | 4 ++--
 xen/include/xen/delay.h                   | 6 +++---
 xen/include/xen/dm.h                      | 6 +++---
 xen/include/xen/dmi.h                     | 6 +++---
 xen/include/xen/domain.h                  | 6 +++---
 xen/include/xen/domain_page.h             | 6 +++---
 xen/include/xen/dt-overlay.h              | 6 +++---
 xen/include/xen/early_printk.h            | 4 ++--
 xen/include/xen/earlycpio.h               | 6 +++---
 xen/include/xen/efi.h                     | 6 +++---
 xen/include/xen/elf.h                     | 6 +++---
 xen/include/xen/elfcore.h                 | 6 +++---
 xen/include/xen/elfstructs.h              | 6 +++---
 xen/include/xen/err.h                     | 6 +++---
 xen/include/xen/errno.h                   | 6 +++---
 xen/include/xen/event.h                   | 6 +++---
 xen/include/xen/grant_table.h             | 6 +++---
 xen/include/xen/guest_access.h            | 6 +++---
 xen/include/xen/gunzip.h                  | 4 ++--
 xen/include/xen/hypercall.h               | 6 +++---
 xen/include/xen/init.h                    | 6 +++---
 xen/include/xen/inttypes.h                | 6 +++---
 xen/include/xen/iocap.h                   | 6 +++---
 xen/include/xen/ioreq.h                   | 6 +++---
 xen/include/xen/irq.h                     | 6 +++---
 xen/include/xen/irq_cpustat.h             | 6 +++---
 xen/include/xen/kconfig.h                 | 6 +++---
 xen/include/xen/kernel.h                  | 6 +++---
 xen/include/xen/keyhandler.h              | 6 +++---
 xen/include/xen/lib.h                     | 6 +++---
 xen/include/xen/libelf.h                  | 6 +++---
 xen/include/xen/linkage.h                 | 6 +++---
 xen/include/xen/linux-compat.h            | 6 +++---
 xen/include/xen/list.h                    | 6 +++---
 xen/include/xen/list_sort.h               | 4 ++--
 xen/include/xen/lz4.h                     | 4 ++--
 xen/include/xen/lzo.h                     | 4 ++--
 xen/include/xen/macros.h                  | 6 +++---
 xen/include/xen/mm-frame.h                | 6 +++---
 xen/include/xen/mm.h                      | 6 +++---
 xen/include/xen/msi.h                     | 4 ++--
 xen/include/xen/multiboot.h               | 6 +++---
 xen/include/xen/multiboot2.h              | 6 +++---
 xen/include/xen/multicall.h               | 6 +++---
 xen/include/xen/nodemask.h                | 6 +++---
 xen/include/xen/nospec.h                  | 6 +++---
 xen/include/xen/notifier.h                | 6 +++---
 xen/include/xen/numa.h                    | 6 +++---
 xen/include/xen/p2m-common.h              | 6 +++---
 xen/include/xen/page-defs.h               | 6 +++---
 xen/include/xen/page-size.h               | 4 ++--
 xen/include/xen/paging.h                  | 6 +++---
 xen/include/xen/param.h                   | 6 +++---
 xen/include/xen/pci.h                     | 6 +++---
 xen/include/xen/pci_regs.h                | 6 +++---
 xen/include/xen/pdx.h                     | 6 +++---
 xen/include/xen/percpu.h                  | 6 +++---
 xen/include/xen/perfc.h                   | 6 +++---
 xen/include/xen/perfc_defn.h              | 6 +++---
 xen/include/xen/pfn.h                     | 6 +++---
 xen/include/xen/pmap.h                    | 6 +++---
 xen/include/xen/pmstat.h                  | 6 +++---
 xen/include/xen/preempt.h                 | 6 +++---
 xen/include/xen/prefetch.h                | 4 ++--
 xen/include/xen/pv_console.h              | 6 +++---
 xen/include/xen/radix-tree.h              | 6 +++---
 xen/include/xen/random.h                  | 6 +++---
 xen/include/xen/rangeset.h                | 6 +++---
 xen/include/xen/rbtree.h                  | 6 +++---
 xen/include/xen/rcupdate.h                | 6 +++---
 xen/include/xen/rwlock.h                  | 6 +++---
 xen/include/xen/sched.h                   | 6 +++---
 xen/include/xen/sections.h                | 6 +++---
 xen/include/xen/self-tests.h              | 6 +++---
 xen/include/xen/serial.h                  | 6 +++---
 xen/include/xen/shared.h                  | 6 +++---
 xen/include/xen/shutdown.h                | 6 +++---
 xen/include/xen/sizes.h                   | 6 +++---
 xen/include/xen/smp.h                     | 6 +++---
 xen/include/xen/softirq.h                 | 6 +++---
 xen/include/xen/sort.h                    | 6 +++---
 xen/include/xen/spinlock.h                | 6 +++---
 xen/include/xen/stdarg.h                  | 6 +++---
 xen/include/xen/stdbool.h                 | 6 +++---
 xen/include/xen/stdint.h                  | 6 +++---
 xen/include/xen/stop_machine.h            | 6 +++---
 xen/include/xen/string.h                  | 6 +++---
 xen/include/xen/stringify.h               | 6 +++---
 xen/include/xen/symbols.h                 | 6 +++---
 xen/include/xen/tasklet.h                 | 6 +++---
 xen/include/xen/time.h                    | 6 +++---
 xen/include/xen/timer.h                   | 6 +++---
 xen/include/xen/trace.h                   | 6 +++---
 xen/include/xen/types.h                   | 6 +++---
 xen/include/xen/typesafe.h                | 6 +++---
 xen/include/xen/unaligned.h               | 6 +++---
 xen/include/xen/version.h                 | 6 +++---
 xen/include/xen/vga.h                     | 6 +++---
 xen/include/xen/video.h                   | 6 +++---
 xen/include/xen/virtual_region.h          | 6 +++---
 xen/include/xen/vmap.h                    | 6 +++---
 xen/include/xen/wait.h                    | 6 +++---
 xen/include/xen/warning.h                 | 4 ++--
 xen/include/xen/watchdog.h                | 6 +++---
 xen/include/xen/xen.lds.h                 | 6 +++---
 xen/include/xen/xenoprof.h                | 4 ++--
 xen/include/xen/xmalloc.h                 | 6 +++---
 xen/include/xen/xxhash.h                  | 6 +++---
 201 files changed, 579 insertions(+), 579 deletions(-)

diff --git a/xen/common/coverage/coverage.h b/xen/common/coverage/coverage.h
index aa66396c08..34400d0f4b 100644
--- a/xen/common/coverage/coverage.h
+++ b/xen/common/coverage/coverage.h
@@ -1,5 +1,5 @@
-#ifndef _XEN_COV_PRIV_H
-#define _XEN_COV_PRIV_H
+#ifndef COMMON__COVERAGE__COVERAGE_H
+#define COMMON__COVERAGE__COVERAGE_H
 
 #include <xen/types.h>
 
diff --git a/xen/common/coverage/gcov.h b/xen/common/coverage/gcov.h
index efc1fd7b00..f0f70019e3 100644
--- a/xen/common/coverage/gcov.h
+++ b/xen/common/coverage/gcov.h
@@ -1,5 +1,5 @@
-#ifndef _GCOV_H_
-#define _GCOV_H_
+#ifndef COMMON__COVERAGE__GCOV_H
+#define COMMON__COVERAGE__GCOV_H
 
 #include <xen/guest_access.h>
 #include <xen/types.h>
@@ -37,4 +37,4 @@ size_t gcov_info_to_gcda(char *buffer, const struct gcov_info *info);
 size_t gcov_store_uint32(void *buffer, size_t off, uint32_t v);
 size_t gcov_store_uint64(void *buffer, size_t off, uint64_t v);
 
-#endif	/* _GCOV_H_ */
+#endif	/* COMMON__COVERAGE__GCOV_H */
diff --git a/xen/common/libelf/libelf-private.h b/xen/common/libelf/libelf-private.h
index 197d7a7623..890fba8ae2 100644
--- a/xen/common/libelf/libelf-private.h
+++ b/xen/common/libelf/libelf-private.h
@@ -12,8 +12,8 @@
  * You should have received a copy of the GNU Lesser General Public
  * License along with this library; If not, see <http://www.gnu.org/licenses/>.
  */
-#ifndef __LIBELF_PRIVATE_H__
-#define __LIBELF_PRIVATE_H__
+#ifndef COMMON__LIBELF__LIBELF_PRIVATE_H
+#define COMMON__LIBELF__LIBELF_PRIVATE_H
 
 #ifdef __XEN__
 
@@ -105,7 +105,7 @@ do { strncpy((d),(s),sizeof((d))-1);            \
    * of memcpy, memset, memmove and strcpy.  Every call site
    * must either use elf_mem*_unchecked, or elf_mem*_safe. */
 
-#endif /* __LIBELF_PRIVATE_H__ */
+#endif /* COMMON__LIBELF__LIBELF_PRIVATE_H */
 
 /*
  * Local variables:
diff --git a/xen/common/lz4/defs.h b/xen/common/lz4/defs.h
index ecfbf07f83..6b974bc806 100644
--- a/xen/common/lz4/defs.h
+++ b/xen/common/lz4/defs.h
@@ -8,8 +8,8 @@
  * published by the Free Software Foundation.
  */
 
-#ifndef COMMON_LZ4_DEFS_H
-#define COMMON_LZ4_DEFS_H
+#ifndef COMMON__LZ4__DEFS_H
+#define COMMON__LZ4__DEFS_H
 
 #ifdef __XEN__
 #include <asm/byteorder.h>
@@ -170,4 +170,4 @@ typedef struct _U64_S { u64 v; } U64_S;
 		d = e;	\
 	} while (0)
 
-#endif /* COMMON_LZ4_DEFS_H */
+#endif /* COMMON__LZ4__DEFS_H */
diff --git a/xen/common/ubsan/ubsan.h b/xen/common/ubsan/ubsan.h
index 9c7f3b9b6c..495e53a7fd 100644
--- a/xen/common/ubsan/ubsan.h
+++ b/xen/common/ubsan/ubsan.h
@@ -1,5 +1,5 @@
-#ifndef _LIB_UBSAN_H
-#define _LIB_UBSAN_H
+#ifndef COMMON__UBSAN__UBSAN_H
+#define COMMON__UBSAN__UBSAN_H
 
 #include <xen/linux-compat.h>
 
diff --git a/xen/common/xz/lzma2.h b/xen/common/xz/lzma2.h
index 06a7edb4d7..ba9afb0049 100644
--- a/xen/common/xz/lzma2.h
+++ b/xen/common/xz/lzma2.h
@@ -8,8 +8,8 @@
  * You can do whatever you want with this file.
  */
 
-#ifndef XZ_LZMA2_H
-#define XZ_LZMA2_H
+#ifndef COMMON__XZ__LZMA2_H
+#define COMMON__XZ__LZMA2_H
 
 /* Range coder constants */
 #define RC_SHIFT_BITS 8
diff --git a/xen/common/xz/private.h b/xen/common/xz/private.h
index 2299705378..b1345a9ddb 100644
--- a/xen/common/xz/private.h
+++ b/xen/common/xz/private.h
@@ -7,8 +7,8 @@
  * You can do whatever you want with this file.
  */
 
-#ifndef XZ_PRIVATE_H
-#define XZ_PRIVATE_H
+#ifndef COMMON__XZ__PRIVATE_H
+#define COMMON__XZ__PRIVATE_H
 
 #ifdef __XEN__
 #include <xen/kernel.h>
diff --git a/xen/common/xz/stream.h b/xen/common/xz/stream.h
index 8d9fbbe1b5..a4caa665fd 100644
--- a/xen/common/xz/stream.h
+++ b/xen/common/xz/stream.h
@@ -7,8 +7,8 @@
  * You can do whatever you want with this file.
  */
 
-#ifndef XZ_STREAM_H
-#define XZ_STREAM_H
+#ifndef COMMON__XZ__STREAM_H
+#define COMMON__XZ__STREAM_H
 
 /*
  * See the .xz file format specification at
diff --git a/xen/common/zstd/bitstream.h b/xen/common/zstd/bitstream.h
index 2b06d4551f..c38afe399e 100644
--- a/xen/common/zstd/bitstream.h
+++ b/xen/common/zstd/bitstream.h
@@ -38,8 +38,8 @@
  * You can contact the author at :
  * - Source repository : https://github.com/Cyan4973/FiniteStateEntropy
  */
-#ifndef BITSTREAM_H_MODULE
-#define BITSTREAM_H_MODULE
+#ifndef COMMON__ZSTD__BITSTREAM_H
+#define COMMON__ZSTD__BITSTREAM_H
 
 /*
 *  This API consists of small unitary functions, which must be inlined for best performance.
@@ -377,4 +377,4 @@ ZSTD_STATIC unsigned BIT_endOfDStream(const BIT_DStream_t *DStream)
 	return ((DStream->ptr == DStream->start) && (DStream->bitsConsumed == sizeof(DStream->bitContainer) * 8));
 }
 
-#endif /* BITSTREAM_H_MODULE */
+#endif /* COMMON__ZSTD__BITSTREAM_H */
diff --git a/xen/common/zstd/error_private.h b/xen/common/zstd/error_private.h
index fa84ae4fef..171525b252 100644
--- a/xen/common/zstd/error_private.h
+++ b/xen/common/zstd/error_private.h
@@ -16,8 +16,8 @@
 
 /* Note : this module is expected to remain private, do not expose it */
 
-#ifndef ERROR_H_MODULE
-#define ERROR_H_MODULE
+#ifndef COMMON__ZSTD__ERROR_PRIVATE_H
+#define COMMON__ZSTD__ERROR_PRIVATE_H
 
 /**
  * enum ZSTD_ErrorCode - zstd error codes
@@ -102,4 +102,4 @@ static __attribute__((unused)) ZSTD_ErrorCode __init ZSTD_getErrorCode(
 	return (ZSTD_ErrorCode)(0 - functionResult);
 }
 
-#endif /* ERROR_H_MODULE */
+#endif /* COMMON__ZSTD__ERROR_PRIVATE_H */
diff --git a/xen/common/zstd/fse.h b/xen/common/zstd/fse.h
index 5761e09f17..dc15c8cd7f 100644
--- a/xen/common/zstd/fse.h
+++ b/xen/common/zstd/fse.h
@@ -37,8 +37,8 @@
  * You can contact the author at :
  * - Source repository : https://github.com/Cyan4973/FiniteStateEntropy
  */
-#ifndef FSE_H
-#define FSE_H
+#ifndef COMMON__ZSTD__FSE_H
+#define COMMON__ZSTD__FSE_H
 
 /*-*****************************************
 *  FSE_PUBLIC_API : control library symbols visibility
@@ -567,4 +567,4 @@ ZSTD_STATIC unsigned FSE_endOfDState(const FSE_DState_t *DStatePtr) { return DSt
 
 #define FSE_TABLESTEP(tableSize) ((tableSize >> 1) + (tableSize >> 3) + 3)
 
-#endif /* FSE_H */
+#endif /* COMMON__ZSTD__FSE_H */
diff --git a/xen/common/zstd/huf.h b/xen/common/zstd/huf.h
index 0e091dbffe..e2ed6cf82b 100644
--- a/xen/common/zstd/huf.h
+++ b/xen/common/zstd/huf.h
@@ -37,8 +37,8 @@
  * You can contact the author at :
  * - Source repository : https://github.com/Cyan4973/FiniteStateEntropy
  */
-#ifndef HUF_H_298734234
-#define HUF_H_298734234
+#ifndef COMMON__ZSTD__HUF_H
+#define COMMON__ZSTD__HUF_H
 
 /* ***   Tool functions *** */
 #define HUF_BLOCKSIZE_MAX (128 * 1024) /**< maximum input size for a single block compressed with HUF_compress */
@@ -206,4 +206,4 @@ size_t HUF_decompress1X_usingDTable(void *dst, size_t maxDstSize, const void *cS
 size_t HUF_decompress1X2_usingDTable(void *dst, size_t maxDstSize, const void *cSrc, size_t cSrcSize, const HUF_DTable *DTable);
 size_t HUF_decompress1X4_usingDTable(void *dst, size_t maxDstSize, const void *cSrc, size_t cSrcSize, const HUF_DTable *DTable);
 
-#endif /* HUF_H_298734234 */
+#endif /* COMMON__ZSTD__HUF_H */
diff --git a/xen/common/zstd/mem.h b/xen/common/zstd/mem.h
index ae1e305126..8e4228771c 100644
--- a/xen/common/zstd/mem.h
+++ b/xen/common/zstd/mem.h
@@ -14,8 +14,8 @@
  * ("BSD").
  */
 
-#ifndef MEM_H_MODULE
-#define MEM_H_MODULE
+#ifndef COMMON__ZSTD__MEM_H
+#define COMMON__ZSTD__MEM_H
 
 /*-****************************************
 *  Dependencies
@@ -150,4 +150,4 @@ ZSTD_STATIC U32 ZSTD_readMINMATCH(const void *memPtr, U32 length)
 	}
 }
 
-#endif /* MEM_H_MODULE */
+#endif /* COMMON__ZSTD__MEM_H */
diff --git a/xen/common/zstd/zstd_internal.h b/xen/common/zstd/zstd_internal.h
index 94f8c58622..93339813d6 100644
--- a/xen/common/zstd/zstd_internal.h
+++ b/xen/common/zstd/zstd_internal.h
@@ -14,8 +14,8 @@
  * ("BSD").
  */
 
-#ifndef ZSTD_CCOMMON_H_MODULE
-#define ZSTD_CCOMMON_H_MODULE
+#ifndef COMMON__ZSTD__ZSTD_INTERNAL_H
+#define COMMON__ZSTD__ZSTD_INTERNAL_H
 
 /*-*******************************************************
 *  Compiler specifics
@@ -373,4 +373,4 @@ size_t ZSTD_freeDDict(ZSTD_DDict *cdict);
 size_t ZSTD_freeCStream(ZSTD_CStream *zcs);
 size_t ZSTD_freeDStream(ZSTD_DStream *zds);
 
-#endif /* ZSTD_CCOMMON_H_MODULE */
+#endif /* COMMON__ZSTD__ZSTD_INTERNAL_H */
diff --git a/xen/drivers/video/font.h b/xen/drivers/video/font.h
index 7f720b3568..123a69dcef 100644
--- a/xen/drivers/video/font.h
+++ b/xen/drivers/video/font.h
@@ -8,8 +8,8 @@
  *  for more details.
  */
 
-#ifndef _XEN_FONT_H
-#define _XEN_FONT_H
+#ifndef DRIVERS__VIDEO__FONT_H
+#define DRIVERS__VIDEO__FONT_H
 
 struct font_desc {
     const char *name;
@@ -19,4 +19,4 @@ struct font_desc {
 
 extern const struct font_desc font_vga_8x8, font_vga_8x14, font_vga_8x16;
 
-#endif /* _XEN_FONT_H */
+#endif /* DRIVERS__VIDEO__FONT_H */
diff --git a/xen/drivers/video/lfb.h b/xen/drivers/video/lfb.h
index 42161402d6..bee1bd3c28 100644
--- a/xen/drivers/video/lfb.h
+++ b/xen/drivers/video/lfb.h
@@ -17,8 +17,8 @@
  * GNU General Public License for more details.
  */
 
-#ifndef _XEN_LFB_H
-#define _XEN_LFB_H
+#ifndef DRIVERS__VIDEO__LFB_H
+#define DRIVERS__VIDEO__LFB_H
 
 #include <xen/init.h>
 
diff --git a/xen/drivers/video/modelines.h b/xen/drivers/video/modelines.h
index 9cb7cdde05..08d631b134 100644
--- a/xen/drivers/video/modelines.h
+++ b/xen/drivers/video/modelines.h
@@ -25,8 +25,8 @@
  * Copyright (c) 2013 Citrix Systems
  */
 
-#ifndef _XEN_MODLINES_H
-#define _XEN_MODLINES_H
+#ifndef DRIVERS__VIDEO__MODELINES_H
+#define DRIVERS__VIDEO__MODELINES_H
 
 struct modeline {
     const char* mode;  /* in the form 1280x1024@60 */
diff --git a/xen/include/asm-generic/altp2m.h b/xen/include/asm-generic/altp2m.h
index 39865a842a..34ae943145 100644
--- a/xen/include/asm-generic/altp2m.h
+++ b/xen/include/asm-generic/altp2m.h
@@ -1,6 +1,6 @@
 /* SPDX-License-Identifier: GPL-2.0-only */
-#ifndef __ASM_GENERIC_ALTP2M_H
-#define __ASM_GENERIC_ALTP2M_H
+#ifndef ASM_GENERIC__ALTP2M_H
+#define ASM_GENERIC__ALTP2M_H
 
 #include <xen/bug.h>
 
@@ -22,7 +22,7 @@ static inline unsigned int altp2m_vcpu_idx(const struct vcpu *v)
     return 0;
 }
 
-#endif /* __ASM_GENERIC_ALTP2M_H */
+#endif /* ASM_GENERIC__ALTP2M_H */
 
 /*
  * Local variables:
diff --git a/xen/include/asm-generic/atomic-ops.h b/xen/include/asm-generic/atomic-ops.h
index 98dd907942..b1f883c360 100644
--- a/xen/include/asm-generic/atomic-ops.h
+++ b/xen/include/asm-generic/atomic-ops.h
@@ -4,8 +4,8 @@
  * forward inline declaration that can be synthesized from other atomic
  * functions or being created from scratch.
  */
-#ifndef _ASM_GENERIC_ATOMIC_OPS_H_
-#define _ASM_GENERIC_ATOMIC_OPS_H_
+#ifndef ASM_GENERIC__ATOMIC_OPS_H
+#define ASM_GENERIC__ATOMIC_OPS_H
 
 #include <xen/atomic.h>
 #include <xen/lib.h>
@@ -94,4 +94,4 @@ static inline int atomic_add_negative(int i, atomic_t *v)
 }
 #endif
 
-#endif /* _ASM_GENERIC_ATOMIC_OPS_H_ */
+#endif /* ASM_GENERIC__ATOMIC_OPS_H */
diff --git a/xen/include/asm-generic/device.h b/xen/include/asm-generic/device.h
index 1acd1ba1d8..eccd3159a9 100644
--- a/xen/include/asm-generic/device.h
+++ b/xen/include/asm-generic/device.h
@@ -1,6 +1,6 @@
 /* SPDX-License-Identifier: GPL-2.0-only */
-#ifndef __ASM_GENERIC_DEVICE_H__
-#define __ASM_GENERIC_DEVICE_H__
+#ifndef ASM_GENERIC__DEVICE_H
+#define ASM_GENERIC__DEVICE_H
 
 #include <xen/stdbool.h>
 
@@ -127,7 +127,7 @@ __section(".adev.info") = {                                         \
 
 #endif /* CONFIG_ACPI */
 
-#endif /* __ASM_GENERIC_DEVICE_H__ */
+#endif /* ASM_GENERIC__DEVICE_H */
 
 /*
  * Local variables:
diff --git a/xen/include/asm-generic/div64.h b/xen/include/asm-generic/div64.h
index 068d8a11ad..774198f98b 100644
--- a/xen/include/asm-generic/div64.h
+++ b/xen/include/asm-generic/div64.h
@@ -1,6 +1,6 @@
 /* SPDX-License-Identifier: GPL-2.0-only */
-#ifndef __ASM_GENERIC_DIV64
-#define __ASM_GENERIC_DIV64
+#ifndef ASM_GENERIC__DIV64_H
+#define ASM_GENERIC__DIV64_H
 
 #include <xen/types.h>
 
diff --git a/xen/include/asm-generic/hardirq.h b/xen/include/asm-generic/hardirq.h
index ddccf460b9..09260b1b08 100644
--- a/xen/include/asm-generic/hardirq.h
+++ b/xen/include/asm-generic/hardirq.h
@@ -1,6 +1,6 @@
 /* SPDX-License-Identifier: GPL-2.0-only */
-#ifndef __ASM_GENERIC_HARDIRQ_H
-#define __ASM_GENERIC_HARDIRQ_H
+#ifndef ASM_GENERIC__HARDIRQ_H
+#define ASM_GENERIC__HARDIRQ_H
 
 #include <xen/cache.h>
 #include <xen/smp.h>
@@ -17,7 +17,7 @@ typedef struct {
 #define irq_enter()     (local_irq_count(smp_processor_id())++)
 #define irq_exit()      (local_irq_count(smp_processor_id())--)
 
-#endif /* __ASM_GENERIC_HARDIRQ_H */
+#endif /* ASM_GENERIC__HARDIRQ_H */
 
 /*
  * Local variables:
diff --git a/xen/include/asm-generic/hypercall.h b/xen/include/asm-generic/hypercall.h
index 7743b35c0d..201b2cb301 100644
--- a/xen/include/asm-generic/hypercall.h
+++ b/xen/include/asm-generic/hypercall.h
@@ -1,12 +1,12 @@
 /* SPDX-License-Identifier: GPL-2.0-only */
-#ifndef __XEN_HYPERCALL_H__
+#ifndef XEN__HYPERCALL_H
 #error "asm/hypercall.h should not be included directly - include xen/hypercall.h instead"
 #endif
 
-#ifndef __ASM_GENERIC_HYPERCALL_H__
-#define __ASM_GENERIC_HYPERCALL_H__
+#ifndef ASM_GENERIC__HYPERCALL_H
+#define ASM_GENERIC__HYPERCALL_H
 
-#endif /* __ASM_GENERIC_HYPERCALL_H__ */
+#endif /* ASM_GENERIC__HYPERCALL_H */
 
 /*
  * Local variables:
diff --git a/xen/include/asm-generic/iocap.h b/xen/include/asm-generic/iocap.h
index dd7cb45488..1001fb629a 100644
--- a/xen/include/asm-generic/iocap.h
+++ b/xen/include/asm-generic/iocap.h
@@ -1,11 +1,11 @@
 /* SPDX-License-Identifier: GPL-2.0-only */
-#ifndef __ASM_GENERIC_IOCAP_H__
-#define __ASM_GENERIC_IOCAP_H__
+#ifndef ASM_GENERIC__IOCAP_H
+#define ASM_GENERIC__IOCAP_H
 
 #define cache_flush_permitted(d)                        \
     (!rangeset_is_empty((d)->iomem_caps))
 
-#endif /* __ASM_GENERIC_IOCAP_H__ */
+#endif /* ASM_GENERIC__IOCAP_H */
 
 /*
  * Local variables:
diff --git a/xen/include/asm-generic/paging.h b/xen/include/asm-generic/paging.h
index 8df534cfdc..1a8fae6543 100644
--- a/xen/include/asm-generic/paging.h
+++ b/xen/include/asm-generic/paging.h
@@ -1,13 +1,13 @@
 /* SPDX-License-Identifier: GPL-2.0-only */
-#ifndef __ASM_GENERIC_PAGING_H__
-#define __ASM_GENERIC_PAGING_H__
+#ifndef ASM_GENERIC__PAGING_H
+#define ASM_GENERIC__PAGING_H
 
 #include <xen/stdbool.h>
 
 #define paging_mode_translate(d)    ((void)(d), true)
 #define paging_mode_external(d)     ((void)(d), true)
 
-#endif /* __ASM_GENERIC_PAGING_H__ */
+#endif /* ASM_GENERIC__PAGING_H */
 
 /*
  * Local variables:
diff --git a/xen/include/asm-generic/percpu.h b/xen/include/asm-generic/percpu.h
index 60af4f9ff9..7302edb00c 100644
--- a/xen/include/asm-generic/percpu.h
+++ b/xen/include/asm-generic/percpu.h
@@ -1,6 +1,6 @@
 /* SPDX-License-Identifier: GPL-2.0-only */
-#ifndef __ASM_GENERIC_PERCPU_H__
-#define __ASM_GENERIC_PERCPU_H__
+#ifndef ASM_GENERIC__PERCPU_H
+#define ASM_GENERIC__PERCPU_H
 
 #ifndef __ASSEMBLY__
 
@@ -25,7 +25,7 @@ void percpu_init_areas(void);
 
 #endif
 
-#endif /* __ASM_GENERIC_PERCPU_H__ */
+#endif /* ASM_GENERIC__PERCPU_H */
 
 /*
  * Local variables:
diff --git a/xen/include/asm-generic/random.h b/xen/include/asm-generic/random.h
index d0d35dd217..f2e6c1c11c 100644
--- a/xen/include/asm-generic/random.h
+++ b/xen/include/asm-generic/random.h
@@ -1,13 +1,13 @@
 /* SPDX-License-Identifier: GPL-2.0-only */
-#ifndef __ASM_GENERIC_RANDOM_H__
-#define __ASM_GENERIC_RANDOM_H__
+#ifndef ASM_GENERIC__RANDOM_H
+#define ASM_GENERIC__RANDOM_H
 
 static inline unsigned int arch_get_random(void)
 {
     return 0;
 }
 
-#endif /* __ASM_GENERIC_RANDOM_H__ */
+#endif /* ASM_GENERIC__RANDOM_H */
 
 /*
  * Local variables:
diff --git a/xen/include/asm-generic/softirq.h b/xen/include/asm-generic/softirq.h
index 83be855e50..92144c7eca 100644
--- a/xen/include/asm-generic/softirq.h
+++ b/xen/include/asm-generic/softirq.h
@@ -1,12 +1,12 @@
 /* SPDX-License-Identifier: GPL-2.0-only */
-#ifndef __ASM_GENERIC_SOFTIRQ_H__
-#define __ASM_GENERIC_SOFTIRQ_H__
+#ifndef ASM_GENERIC__SOFTIRQ_H
+#define ASM_GENERIC__SOFTIRQ_H
 
 #define NR_ARCH_SOFTIRQS       0
 
 #define arch_skip_send_event_check(cpu) 0
 
-#endif /* __ASM_GENERIC_SOFTIRQ_H__ */
+#endif /* ASM_GENERIC__SOFTIRQ_H */
 /*
  * Local variables:
  * mode: C
diff --git a/xen/include/crypto/rijndael.h b/xen/include/crypto/rijndael.h
index 4386be5878..52c7a2f622 100644
--- a/xen/include/crypto/rijndael.h
+++ b/xen/include/crypto/rijndael.h
@@ -25,8 +25,8 @@
  * OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE,
  * EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
  */
-#ifndef __RIJNDAEL_H
-#define __RIJNDAEL_H
+#ifndef CRYPTO__RIJNDAEL_H
+#define CRYPTO__RIJNDAEL_H
 
 #define AES_MAXKEYBITS	(256)
 #define AES_MAXKEYBYTES	(AES_MAXKEYBITS/8)
@@ -55,4 +55,4 @@ int	rijndaelKeySetupDec(unsigned int [], const unsigned char [], int);
 void	rijndaelEncrypt(const unsigned int [], int, const unsigned char [16],
 	    unsigned char [16]);
 
-#endif /* __RIJNDAEL_H */
+#endif /* CRYPTO__RIJNDAEL_H */
diff --git a/xen/include/crypto/vmac.h b/xen/include/crypto/vmac.h
index 457f3f5dd6..310fc77f5c 100644
--- a/xen/include/crypto/vmac.h
+++ b/xen/include/crypto/vmac.h
@@ -1,5 +1,5 @@
-#ifndef HEADER_VMAC_H
-#define HEADER_VMAC_H
+#ifndef CRYPTO__VMAC_H
+#define CRYPTO__VMAC_H
 
 /* --------------------------------------------------------------------------
  * VMAC and VHASH Implementation by Ted Krovetz (tdk@acm.org) and Wei Dai.
diff --git a/xen/include/public/arch-ppc.h b/xen/include/public/arch-ppc.h
index 33a24e3795..1367743d97 100644
--- a/xen/include/public/arch-ppc.h
+++ b/xen/include/public/arch-ppc.h
@@ -8,8 +8,8 @@
  *          Shawn Anastasio <sanastasio@raptorengineering.com>
  */
 
-#ifndef __XEN_PUBLIC_ARCH_PPC_H__
-#define __XEN_PUBLIC_ARCH_PPC_H__
+#ifndef PUBLIC__ARCH_PPC_H
+#define PUBLIC__ARCH_PPC_H
 
 #if defined(__XEN__) || defined(__XEN_TOOLS__)
 #define  int64_aligned_t  int64_t __attribute__((__aligned__(8)))
@@ -109,4 +109,4 @@ typedef struct xen_pmu_arch { uint8_t dummy; } xen_pmu_arch_t;
 
 #endif
 
-#endif /* __XEN_PUBLIC_ARCH_PPC_H__ */
+#endif /* PUBLIC__ARCH_PPC_H */
diff --git a/xen/include/public/arch-riscv.h b/xen/include/public/arch-riscv.h
index 168263b920..edfc518929 100644
--- a/xen/include/public/arch-riscv.h
+++ b/xen/include/public/arch-riscv.h
@@ -4,8 +4,8 @@
  * Initially based on the ARM implementation.
  */
 
-#ifndef __XEN_PUBLIC_ARCH_RISCV_H__
-#define __XEN_PUBLIC_ARCH_RISCV_H__
+#ifndef PUBLIC__ARCH_RISCV_H
+#define PUBLIC__ARCH_RISCV_H
 
 #if defined(__XEN__) || defined(__XEN_TOOLS__) || defined(__GNUC__)
 #define  int64_aligned_t  int64_t __attribute__((__aligned__(8)))
@@ -80,7 +80,7 @@ typedef struct arch_shared_info arch_shared_info_t;
 typedef struct xen_pmu_arch { uint8_t dummy; } xen_pmu_arch_t;
 #endif
 
-#endif /*  __XEN_PUBLIC_ARCH_RISCV_H__ */
+#endif /*  PUBLIC__ARCH_RISCV_H */
 
 /*
  * Local variables:
diff --git a/xen/include/public/callback.h b/xen/include/public/callback.h
index 7f13be66f3..917b4d0fe7 100644
--- a/xen/include/public/callback.h
+++ b/xen/include/public/callback.h
@@ -7,8 +7,8 @@
  * Copyright (c) 2006, Ian Campbell
  */
 
-#ifndef __XEN_PUBLIC_CALLBACK_H__
-#define __XEN_PUBLIC_CALLBACK_H__
+#ifndef PUBLIC__CALLBACK_H
+#define PUBLIC__CALLBACK_H
 
 #include "xen.h"
 
@@ -91,7 +91,7 @@ DEFINE_XEN_GUEST_HANDLE(callback_unregister_t);
 #define CALLBACKTYPE_sysenter CALLBACKTYPE_sysenter_deprecated
 #endif
 
-#endif /* __XEN_PUBLIC_CALLBACK_H__ */
+#endif /* PUBLIC__CALLBACK_H */
 
 /*
  * Local variables:
diff --git a/xen/include/public/device_tree_defs.h b/xen/include/public/device_tree_defs.h
index 9e80d0499d..0d7f989c4e 100644
--- a/xen/include/public/device_tree_defs.h
+++ b/xen/include/public/device_tree_defs.h
@@ -4,8 +4,8 @@
  * Copyright (c) 2015 Citrix Systems, Inc
  */
 
-#ifndef __XEN_DEVICE_TREE_DEFS_H__
-#define __XEN_DEVICE_TREE_DEFS_H__
+#ifndef PUBLIC__DEVICE_TREE_DEFS_H
+#define PUBLIC__DEVICE_TREE_DEFS_H
 
 #if defined(__XEN__) || defined(__XEN_TOOLS__)
 /*
diff --git a/xen/include/public/dom0_ops.h b/xen/include/public/dom0_ops.h
index 9fba71d3a8..28f8501b8e 100644
--- a/xen/include/public/dom0_ops.h
+++ b/xen/include/public/dom0_ops.h
@@ -8,8 +8,8 @@
  * Copyright (c) 2002-2006, K Fraser
  */
 
-#ifndef __XEN_PUBLIC_DOM0_OPS_H__
-#define __XEN_PUBLIC_DOM0_OPS_H__
+#ifndef PUBLIC__DOM0_OPS_H
+#define PUBLIC__DOM0_OPS_H
 
 #include "xen.h"
 #include "platform.h"
@@ -90,7 +90,7 @@ struct dom0_op {
 typedef struct dom0_op dom0_op_t;
 DEFINE_XEN_GUEST_HANDLE(dom0_op_t);
 
-#endif /* __XEN_PUBLIC_DOM0_OPS_H__ */
+#endif /* PUBLIC__DOM0_OPS_H */
 
 /*
  * Local variables:
diff --git a/xen/include/public/domctl.h b/xen/include/public/domctl.h
index e1028fc524..7d58a56b51 100644
--- a/xen/include/public/domctl.h
+++ b/xen/include/public/domctl.h
@@ -8,8 +8,8 @@
  * Copyright (c) 2002-2006, K Fraser
  */
 
-#ifndef __XEN_PUBLIC_DOMCTL_H__
-#define __XEN_PUBLIC_DOMCTL_H__
+#ifndef PUBLIC__DOMCTL_H
+#define PUBLIC__DOMCTL_H
 
 #if !defined(__XEN__) && !defined(__XEN_TOOLS__)
 #error "domctl operations are intended for use by node control tools only"
@@ -1387,7 +1387,7 @@ struct xen_domctl {
 typedef struct xen_domctl xen_domctl_t;
 DEFINE_XEN_GUEST_HANDLE(xen_domctl_t);
 
-#endif /* __XEN_PUBLIC_DOMCTL_H__ */
+#endif /* PUBLIC__DOMCTL_H */
 
 /*
  * Local variables:
diff --git a/xen/include/public/elfnote.h b/xen/include/public/elfnote.h
index 2fd8f1b770..91bc4711fd 100644
--- a/xen/include/public/elfnote.h
+++ b/xen/include/public/elfnote.h
@@ -7,8 +7,8 @@
  * Copyright (c) 2006, Ian Campbell, XenSource Ltd.
  */
 
-#ifndef __XEN_PUBLIC_ELFNOTE_H__
-#define __XEN_PUBLIC_ELFNOTE_H__
+#ifndef PUBLIC__ELFNOTE_H
+#define PUBLIC__ELFNOTE_H
 
 /*
  * `incontents 200 elfnotes ELF notes
@@ -273,7 +273,7 @@
  */
 #define XEN_ELFNOTE_DUMPCORE_FORMAT_VERSION     0x2000003
 
-#endif /* __XEN_PUBLIC_ELFNOTE_H__ */
+#endif /* PUBLIC__ELFNOTE_H */
 
 /*
  * Local variables:
diff --git a/xen/include/public/errno.h b/xen/include/public/errno.h
index b9fc6762fb..c0e5022078 100644
--- a/xen/include/public/errno.h
+++ b/xen/include/public/errno.h
@@ -25,8 +25,8 @@
  * guards, an automatic enum (for C code) and constants in the XEN_xxx
  * namespace.
  */
-#ifndef __XEN_PUBLIC_ERRNO_H__
-#define __XEN_PUBLIC_ERRNO_H__
+#ifndef PUBLIC__ERRNO_H
+#define PUBLIC__ERRNO_H
 
 #define XEN_ERRNO_DEFAULT_INCLUDE
 
@@ -41,7 +41,7 @@ enum xen_errno {
 
 #endif /* __ASSEMBLY__ */
 
-#endif /* __XEN_PUBLIC_ERRNO_H__ */
+#endif /* PUBLIC__ERRNO_H */
 #endif /* !XEN_ERRNO */
 
 /* ` enum neg_errnoval {  [ -Efoo for each Efoo in the list below ]  } */
diff --git a/xen/include/public/event_channel.h b/xen/include/public/event_channel.h
index 0d91a1c4af..eb6be297a0 100644
--- a/xen/include/public/event_channel.h
+++ b/xen/include/public/event_channel.h
@@ -7,8 +7,8 @@
  * Copyright (c) 2003-2004, K A Fraser.
  */
 
-#ifndef __XEN_PUBLIC_EVENT_CHANNEL_H__
-#define __XEN_PUBLIC_EVENT_CHANNEL_H__
+#ifndef PUBLIC__EVENT_CHANNEL_H
+#define PUBLIC__EVENT_CHANNEL_H
 
 #include "xen.h"
 
@@ -358,7 +358,7 @@ struct evtchn_fifo_control_block {
 };
 typedef struct evtchn_fifo_control_block evtchn_fifo_control_block_t;
 
-#endif /* __XEN_PUBLIC_EVENT_CHANNEL_H__ */
+#endif /* PUBLIC__EVENT_CHANNEL_H */
 
 /*
  * Local variables:
diff --git a/xen/include/public/features.h b/xen/include/public/features.h
index 8801930947..f42bcce464 100644
--- a/xen/include/public/features.h
+++ b/xen/include/public/features.h
@@ -7,8 +7,8 @@
  * Copyright (c) 2006, Keir Fraser <keir@xensource.com>
  */
 
-#ifndef __XEN_PUBLIC_FEATURES_H__
-#define __XEN_PUBLIC_FEATURES_H__
+#ifndef PUBLIC__FEATURES_H
+#define PUBLIC__FEATURES_H
 
 /*
  * `incontents 200 elfnotes_features XEN_ELFNOTE_FEATURES
@@ -130,7 +130,7 @@
 
 #define XENFEAT_NR_SUBMAPS 1
 
-#endif /* __XEN_PUBLIC_FEATURES_H__ */
+#endif /* PUBLIC__FEATURES_H */
 
 /*
  * Local variables:
diff --git a/xen/include/public/grant_table.h b/xen/include/public/grant_table.h
index 1dfa17a6d0..c41a4e3f33 100644
--- a/xen/include/public/grant_table.h
+++ b/xen/include/public/grant_table.h
@@ -8,8 +8,8 @@
  * Copyright (c) 2004, K A Fraser
  */
 
-#ifndef __XEN_PUBLIC_GRANT_TABLE_H__
-#define __XEN_PUBLIC_GRANT_TABLE_H__
+#ifndef PUBLIC__GRANT_TABLE_H
+#define PUBLIC__GRANT_TABLE_H
 
 #include "xen.h"
 
@@ -656,7 +656,7 @@ DEFINE_XEN_GUEST_HANDLE(gnttab_cache_flush_t);
     "out of space",                             \
 }
 
-#endif /* __XEN_PUBLIC_GRANT_TABLE_H__ */
+#endif /* PUBLIC__GRANT_TABLE_H */
 
 /*
  * Local variables:
diff --git a/xen/include/public/hvm/dm_op.h b/xen/include/public/hvm/dm_op.h
index fa98551914..22067626c4 100644
--- a/xen/include/public/hvm/dm_op.h
+++ b/xen/include/public/hvm/dm_op.h
@@ -4,8 +4,8 @@
  *
  */
 
-#ifndef __XEN_PUBLIC_HVM_DM_OP_H__
-#define __XEN_PUBLIC_HVM_DM_OP_H__
+#ifndef PUBLIC__HVM__DM_OP_H
+#define PUBLIC__HVM__DM_OP_H
 
 #include "../xen.h"
 #include "../event_channel.h"
@@ -493,7 +493,7 @@ DEFINE_XEN_GUEST_HANDLE(xen_dm_op_buf_t);
  * passing extra information to or from the domain.
  */
 
-#endif /* __XEN_PUBLIC_HVM_DM_OP_H__ */
+#endif /* PUBLIC__HVM__DM_OP_H */
 
 /*
  * Local variables:
diff --git a/xen/include/public/hvm/e820.h b/xen/include/public/hvm/e820.h
index 5879b8ff7b..9b7a104329 100644
--- a/xen/include/public/hvm/e820.h
+++ b/xen/include/public/hvm/e820.h
@@ -3,8 +3,8 @@
  * Copyright (c) 2006, Keir Fraser
  */
 
-#ifndef __XEN_PUBLIC_HVM_E820_H__
-#define __XEN_PUBLIC_HVM_E820_H__
+#ifndef PUBLIC__HVM__E820_H
+#define PUBLIC__HVM__E820_H
 
 #include "../xen.h"
 
@@ -18,4 +18,4 @@
 #define HVM_BELOW_4G_MMIO_LENGTH    ((xen_mk_ullong(1) << 32) - \
                                      HVM_BELOW_4G_MMIO_START)
 
-#endif /* __XEN_PUBLIC_HVM_E820_H__ */
+#endif /* PUBLIC__HVM__E820_H */
diff --git a/xen/include/public/hvm/hvm_info_table.h b/xen/include/public/hvm/hvm_info_table.h
index a885f356db..822b172f18 100644
--- a/xen/include/public/hvm/hvm_info_table.h
+++ b/xen/include/public/hvm/hvm_info_table.h
@@ -7,8 +7,8 @@
  * Copyright (c) 2006, Keir Fraser
  */
 
-#ifndef __XEN_PUBLIC_HVM_HVM_INFO_TABLE_H__
-#define __XEN_PUBLIC_HVM_HVM_INFO_TABLE_H__
+#ifndef PUBLIC__HVM__HVM_INFO_TABLE_H
+#define PUBLIC__HVM__HVM_INFO_TABLE_H
 
 #define HVM_INFO_PFN         0x09F
 #define HVM_INFO_OFFSET      0x800
@@ -62,4 +62,4 @@ struct hvm_info_table {
     uint8_t     vcpu_online[(HVM_MAX_VCPUS + 7)/8];
 };
 
-#endif /* __XEN_PUBLIC_HVM_HVM_INFO_TABLE_H__ */
+#endif /* PUBLIC__HVM__HVM_INFO_TABLE_H */
diff --git a/xen/include/public/hvm/hvm_op.h b/xen/include/public/hvm/hvm_op.h
index e22adf0319..505e116e90 100644
--- a/xen/include/public/hvm/hvm_op.h
+++ b/xen/include/public/hvm/hvm_op.h
@@ -3,8 +3,8 @@
  * Copyright (c) 2007, Keir Fraser
  */
 
-#ifndef __XEN_PUBLIC_HVM_HVM_OP_H__
-#define __XEN_PUBLIC_HVM_HVM_OP_H__
+#ifndef PUBLIC__HVM__HVM_OP_H
+#define PUBLIC__HVM__HVM_OP_H
 
 #include "../xen.h"
 #include "../trace.h"
@@ -365,7 +365,7 @@ struct xen_hvm_altp2m_op {
 typedef struct xen_hvm_altp2m_op xen_hvm_altp2m_op_t;
 DEFINE_XEN_GUEST_HANDLE(xen_hvm_altp2m_op_t);
 
-#endif /* __XEN_PUBLIC_HVM_HVM_OP_H__ */
+#endif /* PUBLIC__HVM__HVM_OP_H */
 
 /*
  * Local variables:
diff --git a/xen/include/public/hvm/hvm_vcpu.h b/xen/include/public/hvm/hvm_vcpu.h
index 4a43401144..0cc1f9d956 100644
--- a/xen/include/public/hvm/hvm_vcpu.h
+++ b/xen/include/public/hvm/hvm_vcpu.h
@@ -3,8 +3,8 @@
  * Copyright (c) 2015, Roger Pau Monne <roger.pau@citrix.com>
  */
 
-#ifndef __XEN_PUBLIC_HVM_HVM_VCPU_H__
-#define __XEN_PUBLIC_HVM_HVM_VCPU_H__
+#ifndef PUBLIC__HVM__HVM_VCPU_H
+#define PUBLIC__HVM__HVM_VCPU_H
 
 #include "../xen.h"
 
@@ -116,7 +116,7 @@ struct vcpu_hvm_context {
 typedef struct vcpu_hvm_context vcpu_hvm_context_t;
 DEFINE_XEN_GUEST_HANDLE(vcpu_hvm_context_t);
 
-#endif /* __XEN_PUBLIC_HVM_HVM_VCPU_H__ */
+#endif /* PUBLIC__HVM__HVM_VCPU_H */
 
 /*
  * Local variables:
diff --git a/xen/include/public/hvm/hvm_xs_strings.h b/xen/include/public/hvm/hvm_xs_strings.h
index e1ed078628..c26e9698b7 100644
--- a/xen/include/public/hvm/hvm_xs_strings.h
+++ b/xen/include/public/hvm/hvm_xs_strings.h
@@ -7,8 +7,8 @@
  * Copyright (c) 2013, Citrix Systems
  */
 
-#ifndef __XEN_PUBLIC_HVM_HVM_XS_STRINGS_H__
-#define __XEN_PUBLIC_HVM_HVM_XS_STRINGS_H__
+#ifndef PUBLIC__HVM__HVM_XS_STRINGS_H
+#define PUBLIC__HVM__HVM_XS_STRINGS_H
 
 #define HVM_XS_HVMLOADER               "hvmloader"
 #define HVM_XS_BIOS                    "hvmloader/bios"
@@ -69,4 +69,4 @@
  */
 #define HVM_XS_OEM_STRINGS             "bios-strings/oem-%d"
 
-#endif /* __XEN_PUBLIC_HVM_HVM_XS_STRINGS_H__ */
+#endif /* PUBLIC__HVM__HVM_XS_STRINGS_H */
diff --git a/xen/include/public/hvm/ioreq.h b/xen/include/public/hvm/ioreq.h
index 7a6bc760d0..14c0fe6457 100644
--- a/xen/include/public/hvm/ioreq.h
+++ b/xen/include/public/hvm/ioreq.h
@@ -4,8 +4,8 @@
  * Copyright (c) 2004, Intel Corporation.
  */
 
-#ifndef _IOREQ_H_
-#define _IOREQ_H_
+#ifndef PUBLIC__HVM__IOREQ_H
+#define PUBLIC__HVM__IOREQ_H
 
 #define IOREQ_READ      1
 #define IOREQ_WRITE     0
@@ -113,7 +113,7 @@ typedef struct buffered_iopage buffered_iopage_t;
 #define ACPI_GPE0_BLK_LEN            ACPI_GPE0_BLK_LEN_V0
 
 
-#endif /* _IOREQ_H_ */
+#endif /* PUBLIC__HVM__IOREQ_H */
 
 /*
  * Local variables:
diff --git a/xen/include/public/hvm/params.h b/xen/include/public/hvm/params.h
index 99c40b4287..559cfb8240 100644
--- a/xen/include/public/hvm/params.h
+++ b/xen/include/public/hvm/params.h
@@ -3,8 +3,8 @@
  * Copyright (c) 2007, Keir Fraser
  */
 
-#ifndef __XEN_PUBLIC_HVM_PARAMS_H__
-#define __XEN_PUBLIC_HVM_PARAMS_H__
+#ifndef PUBLIC__HVM__PARAMS_H
+#define PUBLIC__HVM__PARAMS_H
 
 #include "hvm_op.h"
 
@@ -293,4 +293,4 @@
 
 #define HVM_NR_PARAMS 39
 
-#endif /* __XEN_PUBLIC_HVM_PARAMS_H__ */
+#endif /* PUBLIC__HVM__PARAMS_H */
diff --git a/xen/include/public/hvm/pvdrivers.h b/xen/include/public/hvm/pvdrivers.h
index 62252db626..348cdfed28 100644
--- a/xen/include/public/hvm/pvdrivers.h
+++ b/xen/include/public/hvm/pvdrivers.h
@@ -4,8 +4,8 @@
  * Copyright (c) 2012, Citrix Systems Inc.
  */
 
-#ifndef _XEN_PUBLIC_PVDRIVERS_H_
-#define _XEN_PUBLIC_PVDRIVERS_H_
+#ifndef PUBLIC__HVM__PVDRIVERS_H
+#define PUBLIC__HVM__PVDRIVERS_H
 
 /*
  * This is the master registry of product numbers for
@@ -29,4 +29,4 @@
         EACH("xenserver-windows-v7.2+", 0x0005) /* Citrix */       \
         EACH("experimental",            0xffff)
 
-#endif /* _XEN_PUBLIC_PVDRIVERS_H_ */
+#endif /* PUBLIC__HVM__PVDRIVERS_H */
diff --git a/xen/include/public/hvm/save.h b/xen/include/public/hvm/save.h
index 72e16ab5bc..8fcf17e97b 100644
--- a/xen/include/public/hvm/save.h
+++ b/xen/include/public/hvm/save.h
@@ -8,8 +8,8 @@
  * Copyright (c) 2007 XenSource Ltd.
  */
 
-#ifndef __XEN_PUBLIC_HVM_SAVE_H__
-#define __XEN_PUBLIC_HVM_SAVE_H__
+#ifndef PUBLIC__HVM__SAVE_H
+#define PUBLIC__HVM__SAVE_H
 
 /*
  * Structures in this header *must* have the same layout in 32bit
@@ -95,4 +95,4 @@ DECLARE_HVM_SAVE_TYPE(END, 0, struct hvm_save_end);
 #error "unsupported architecture"
 #endif
 
-#endif /* __XEN_PUBLIC_HVM_SAVE_H__ */
+#endif /* PUBLIC__HVM__SAVE_H */
diff --git a/xen/include/public/hypfs.h b/xen/include/public/hypfs.h
index 70047e1762..2aabedf606 100644
--- a/xen/include/public/hypfs.h
+++ b/xen/include/public/hypfs.h
@@ -6,8 +6,8 @@
  *
  */
 
-#ifndef __XEN_PUBLIC_HYPFS_H__
-#define __XEN_PUBLIC_HYPFS_H__
+#ifndef PUBLIC__HYPFS_H
+#define PUBLIC__HYPFS_H
 
 #include "xen.h"
 
@@ -110,4 +110,4 @@ struct xen_hypfs_dirlistentry {
  */
 #define XEN_HYPFS_OP_write_contents    2
 
-#endif /* __XEN_PUBLIC_HYPFS_H__ */
+#endif /* PUBLIC__HYPFS_H */
diff --git a/xen/include/public/kexec.h b/xen/include/public/kexec.h
index 40d79e936b..5ddbada0fe 100644
--- a/xen/include/public/kexec.h
+++ b/xen/include/public/kexec.h
@@ -7,8 +7,8 @@
  * - Magnus Damm <magnus@valinux.co.jp>
  */
 
-#ifndef _XEN_PUBLIC_KEXEC_H
-#define _XEN_PUBLIC_KEXEC_H
+#ifndef PUBLIC__KEXEC_H
+#define PUBLIC__KEXEC_H
 
 
 /* This file describes the Kexec / Kdump hypercall interface for Xen.
@@ -233,7 +233,7 @@ DEFINE_XEN_GUEST_HANDLE(xen_kexec_status_t);
 
 #endif
 
-#endif /* _XEN_PUBLIC_KEXEC_H */
+#endif /* PUBLIC__KEXEC_H */
 
 /*
  * Local variables:
diff --git a/xen/include/public/memory.h b/xen/include/public/memory.h
index 5e545ae9a4..3c07f724d4 100644
--- a/xen/include/public/memory.h
+++ b/xen/include/public/memory.h
@@ -7,8 +7,8 @@
  * Copyright (c) 2005, Keir Fraser <keir@xensource.com>
  */
 
-#ifndef __XEN_PUBLIC_MEMORY_H__
-#define __XEN_PUBLIC_MEMORY_H__
+#ifndef PUBLIC__MEMORY_H
+#define PUBLIC__MEMORY_H
 
 #include "xen.h"
 #include "physdev.h"
@@ -733,7 +733,7 @@ DEFINE_XEN_GUEST_HANDLE(xen_vnuma_topology_info_t);
 
 /* Next available subop number is 29 */
 
-#endif /* __XEN_PUBLIC_MEMORY_H__ */
+#endif /* PUBLIC__MEMORY_H */
 
 /*
  * Local variables:
diff --git a/xen/include/public/nmi.h b/xen/include/public/nmi.h
index 5900703f5f..7bc63c0a4d 100644
--- a/xen/include/public/nmi.h
+++ b/xen/include/public/nmi.h
@@ -7,8 +7,8 @@
  * Copyright (c) 2005, Keir Fraser <keir@xensource.com>
  */
 
-#ifndef __XEN_PUBLIC_NMI_H__
-#define __XEN_PUBLIC_NMI_H__
+#ifndef PUBLIC__NMI_H
+#define PUBLIC__NMI_H
 
 #include "xen.h"
 
@@ -55,7 +55,7 @@ DEFINE_XEN_GUEST_HANDLE(xennmi_callback_t);
  */
 #define XENNMI_unregister_callback 1
 
-#endif /* __XEN_PUBLIC_NMI_H__ */
+#endif /* PUBLIC__NMI_H */
 
 /*
  * Local variables:
diff --git a/xen/include/public/physdev.h b/xen/include/public/physdev.h
index 3149049a9a..cfce2fbb0a 100644
--- a/xen/include/public/physdev.h
+++ b/xen/include/public/physdev.h
@@ -3,8 +3,8 @@
  * Copyright (c) 2006, Keir Fraser
  */
 
-#ifndef __XEN_PUBLIC_PHYSDEV_H__
-#define __XEN_PUBLIC_PHYSDEV_H__
+#ifndef PUBLIC__PHYSDEV_H
+#define PUBLIC__PHYSDEV_H
 
 #include "xen.h"
 
@@ -373,7 +373,7 @@ DEFINE_XEN_GUEST_HANDLE(physdev_dbgp_op_t);
 #define PHYSDEVOP_pirq_eoi_gmfn PHYSDEVOP_pirq_eoi_gmfn_v2
 #endif
 
-#endif /* __XEN_PUBLIC_PHYSDEV_H__ */
+#endif /* PUBLIC__PHYSDEV_H */
 
 /*
  * Local variables:
diff --git a/xen/include/public/platform.h b/xen/include/public/platform.h
index 2725b8d104..3ce970f866 100644
--- a/xen/include/public/platform.h
+++ b/xen/include/public/platform.h
@@ -7,8 +7,8 @@
  * Copyright (c) 2002-2006, K Fraser
  */
 
-#ifndef __XEN_PUBLIC_PLATFORM_H__
-#define __XEN_PUBLIC_PLATFORM_H__
+#ifndef PUBLIC__PLATFORM_H
+#define PUBLIC__PLATFORM_H
 
 #include "xen.h"
 
@@ -676,7 +676,7 @@ struct xen_platform_op {
 typedef struct xen_platform_op xen_platform_op_t;
 DEFINE_XEN_GUEST_HANDLE(xen_platform_op_t);
 
-#endif /* __XEN_PUBLIC_PLATFORM_H__ */
+#endif /* PUBLIC__PLATFORM_H */
 
 /*
  * Local variables:
diff --git a/xen/include/public/pmu.h b/xen/include/public/pmu.h
index af8b7babdd..5e6c52bb6e 100644
--- a/xen/include/public/pmu.h
+++ b/xen/include/public/pmu.h
@@ -3,8 +3,8 @@
  * Copyright (c) 2015 Oracle and/or its affiliates. All rights reserved.
  */
 
-#ifndef __XEN_PUBLIC_PMU_H__
-#define __XEN_PUBLIC_PMU_H__
+#ifndef PUBLIC__PMU_H
+#define PUBLIC__PMU_H
 
 #include "xen.h"
 #if defined(__i386__) || defined(__x86_64__)
@@ -117,7 +117,7 @@ struct xen_pmu_data {
     xen_pmu_arch_t pmu;
 };
 
-#endif /* __XEN_PUBLIC_PMU_H__ */
+#endif /* PUBLIC__PMU_H */
 
 /*
  * Local variables:
diff --git a/xen/include/public/sched.h b/xen/include/public/sched.h
index b4362c6a1d..63b90468ce 100644
--- a/xen/include/public/sched.h
+++ b/xen/include/public/sched.h
@@ -7,8 +7,8 @@
  * Copyright (c) 2005, Keir Fraser <keir@xensource.com>
  */
 
-#ifndef __XEN_PUBLIC_SCHED_H__
-#define __XEN_PUBLIC_SCHED_H__
+#ifndef PUBLIC__SCHED_H
+#define PUBLIC__SCHED_H
 
 #include "event_channel.h"
 
@@ -172,7 +172,7 @@ DEFINE_XEN_GUEST_HANDLE(sched_pin_override_t);
 #define SHUTDOWN_MAX        5  /* Maximum valid shutdown reason.             */
 /* ` } */
 
-#endif /* __XEN_PUBLIC_SCHED_H__ */
+#endif /* PUBLIC__SCHED_H */
 
 /*
  * Local variables:
diff --git a/xen/include/public/sysctl.h b/xen/include/public/sysctl.h
index b2a5a724db..1e07bea079 100644
--- a/xen/include/public/sysctl.h
+++ b/xen/include/public/sysctl.h
@@ -7,8 +7,8 @@
  * Copyright (c) 2002-2006, K Fraser
  */
 
-#ifndef __XEN_PUBLIC_SYSCTL_H__
-#define __XEN_PUBLIC_SYSCTL_H__
+#ifndef PUBLIC__SYSCTL_H
+#define PUBLIC__SYSCTL_H
 
 #if !defined(__XEN__) && !defined(__XEN_TOOLS__)
 #error "sysctl operations are intended for use by node control tools only"
@@ -1271,7 +1271,7 @@ struct xen_sysctl {
 typedef struct xen_sysctl xen_sysctl_t;
 DEFINE_XEN_GUEST_HANDLE(xen_sysctl_t);
 
-#endif /* __XEN_PUBLIC_SYSCTL_H__ */
+#endif /* PUBLIC__SYSCTL_H */
 
 /*
  * Local variables:
diff --git a/xen/include/public/tmem.h b/xen/include/public/tmem.h
index da68de76fe..141c540ce1 100644
--- a/xen/include/public/tmem.h
+++ b/xen/include/public/tmem.h
@@ -7,8 +7,8 @@
  * Copyright (c) 2004, K A Fraser
  */
 
-#ifndef __XEN_PUBLIC_TMEM_H__
-#define __XEN_PUBLIC_TMEM_H__
+#ifndef PUBLIC__TMEM_H
+#define PUBLIC__TMEM_H
 
 #include "xen.h"
 
@@ -92,7 +92,7 @@ DEFINE_XEN_GUEST_HANDLE(tmem_op_t);
 
 #endif  /* __XEN_INTERFACE_VERSION__ < 0x00041300 */
 
-#endif /* __XEN_PUBLIC_TMEM_H__ */
+#endif /* PUBLIC__TMEM_H */
 
 /*
  * Local variables:
diff --git a/xen/include/public/trace.h b/xen/include/public/trace.h
index 141efa0ea7..093b388cee 100644
--- a/xen/include/public/trace.h
+++ b/xen/include/public/trace.h
@@ -6,8 +6,8 @@
  * Copyright (C) 2005 Bin Ren
  */
 
-#ifndef __XEN_PUBLIC_TRACE_H__
-#define __XEN_PUBLIC_TRACE_H__
+#ifndef PUBLIC__TRACE_H
+#define PUBLIC__TRACE_H
 
 #define TRACE_EXTRA_MAX    7
 #define TRACE_EXTRA_SHIFT 28
@@ -313,7 +313,7 @@ struct t_info {
     /* MFN lists immediately after the header */
 };
 
-#endif /* __XEN_PUBLIC_TRACE_H__ */
+#endif /* PUBLIC__TRACE_H */
 
 /*
  * Local variables:
diff --git a/xen/include/public/vcpu.h b/xen/include/public/vcpu.h
index f7445ac0b0..c3ad41a1fc 100644
--- a/xen/include/public/vcpu.h
+++ b/xen/include/public/vcpu.h
@@ -7,8 +7,8 @@
  * Copyright (c) 2005, Keir Fraser <keir@xensource.com>
  */
 
-#ifndef __XEN_PUBLIC_VCPU_H__
-#define __XEN_PUBLIC_VCPU_H__
+#ifndef PUBLIC__VCPU_H
+#define PUBLIC__VCPU_H
 
 #include "xen.h"
 
@@ -243,7 +243,7 @@ DEFINE_XEN_GUEST_HANDLE(vcpu_register_time_memory_area_t);
 #define VCPUOP_register_runstate_phys_area      14
 #define VCPUOP_register_vcpu_time_phys_area     15
 
-#endif /* __XEN_PUBLIC_VCPU_H__ */
+#endif /* PUBLIC__VCPU_H */
 
 /*
  * Local variables:
diff --git a/xen/include/public/version.h b/xen/include/public/version.h
index cbc4ef7a46..02d0e1a5ee 100644
--- a/xen/include/public/version.h
+++ b/xen/include/public/version.h
@@ -8,8 +8,8 @@
  * Copyright (c) 2005, Keir Fraser <keir@xensource.com>
  */
 
-#ifndef __XEN_PUBLIC_VERSION_H__
-#define __XEN_PUBLIC_VERSION_H__
+#ifndef PUBLIC__VERSION_H
+#define PUBLIC__VERSION_H
 
 #include "xen.h"
 
@@ -110,7 +110,7 @@ struct xen_build_id {
 };
 typedef struct xen_build_id xen_build_id_t;
 
-#endif /* __XEN_PUBLIC_VERSION_H__ */
+#endif /* PUBLIC__VERSION_H */
 
 /*
  * Local variables:
diff --git a/xen/include/public/xen-compat.h b/xen/include/public/xen-compat.h
index 078b796664..5dba32ad18 100644
--- a/xen/include/public/xen-compat.h
+++ b/xen/include/public/xen-compat.h
@@ -7,8 +7,8 @@
  * Copyright (c) 2006, Christian Limpach
  */
 
-#ifndef __XEN_PUBLIC_XEN_COMPAT_H__
-#define __XEN_PUBLIC_XEN_COMPAT_H__
+#ifndef PUBLIC__XEN_COMPAT_H
+#define PUBLIC__XEN_COMPAT_H
 
 #define __XEN_LATEST_INTERFACE_VERSION__ 0x00041300
 
@@ -26,4 +26,4 @@
 
 #define COMPAT_FLEX_ARRAY_DIM XEN_FLEX_ARRAY_DIM
 
-#endif /* __XEN_PUBLIC_XEN_COMPAT_H__ */
+#endif /* PUBLIC__XEN_COMPAT_H */
diff --git a/xen/include/public/xen.h b/xen/include/public/xen.h
index b47d48d0e2..cd29948391 100644
--- a/xen/include/public/xen.h
+++ b/xen/include/public/xen.h
@@ -7,8 +7,8 @@
  * Copyright (c) 2004, K A Fraser
  */
 
-#ifndef __XEN_PUBLIC_XEN_H__
-#define __XEN_PUBLIC_XEN_H__
+#ifndef PUBLIC__XEN_H
+#define PUBLIC__XEN_H
 
 #include "xen-compat.h"
 
@@ -1023,7 +1023,7 @@ typedef struct xenctl_bitmap xenctl_bitmap_t;
 
 #endif /* defined(__XEN__) || defined(__XEN_TOOLS__) */
 
-#endif /* __XEN_PUBLIC_XEN_H__ */
+#endif /* PUBLIC__XEN_H */
 
 /*
  * Local variables:
diff --git a/xen/include/public/xencomm.h b/xen/include/public/xencomm.h
index a441f3e270..437d250824 100644
--- a/xen/include/public/xencomm.h
+++ b/xen/include/public/xencomm.h
@@ -3,8 +3,8 @@
  * Copyright (C) IBM Corp. 2006
  */
 
-#ifndef _XEN_XENCOMM_H_
-#define _XEN_XENCOMM_H_
+#ifndef PUBLIC__XENCOMM_H
+#define PUBLIC__XENCOMM_H
 
 /* A xencomm descriptor is a scatter/gather list containing physical
  * addresses corresponding to a virtually contiguous memory area. The
@@ -21,4 +21,4 @@ struct xencomm_desc {
     uint64_t address[0];
 };
 
-#endif /* _XEN_XENCOMM_H_ */
+#endif /* PUBLIC__XENCOMM_H */
diff --git a/xen/include/public/xenoprof.h b/xen/include/public/xenoprof.h
index 2298b6759e..6472b2bae0 100644
--- a/xen/include/public/xenoprof.h
+++ b/xen/include/public/xenoprof.h
@@ -9,8 +9,8 @@
  * Written by Aravind Menon & Jose Renato Santos
  */
 
-#ifndef __XEN_PUBLIC_XENOPROF_H__
-#define __XEN_PUBLIC_XENOPROF_H__
+#ifndef PUBLIC__XENOPROF_H
+#define PUBLIC__XENOPROF_H
 
 #include "xen.h"
 
@@ -122,7 +122,7 @@ struct xenoprof_ibs_counter {
 typedef struct xenoprof_ibs_counter xenoprof_ibs_counter_t;
 DEFINE_XEN_GUEST_HANDLE(xenoprof_ibs_counter_t);
 
-#endif /* __XEN_PUBLIC_XENOPROF_H__ */
+#endif /* PUBLIC__XENOPROF_H */
 
 /*
  * Local variables:
diff --git a/xen/include/public/xsm/flask_op.h b/xen/include/public/xsm/flask_op.h
index 7185e80621..a31012e024 100644
--- a/xen/include/public/xsm/flask_op.h
+++ b/xen/include/public/xsm/flask_op.h
@@ -5,8 +5,8 @@
  *  Author:  George Coker, <gscoker@alpha.ncsc.mil>
  */
 
-#ifndef __FLASK_OP_H__
-#define __FLASK_OP_H__
+#ifndef PUBLIC__XSM__FLASK_OP_H
+#define PUBLIC__XSM__FLASK_OP_H
 
 #include "../event_channel.h"
 
diff --git a/xen/include/xen/8250-uart.h b/xen/include/xen/8250-uart.h
index d13352940c..7915297a24 100644
--- a/xen/include/xen/8250-uart.h
+++ b/xen/include/xen/8250-uart.h
@@ -19,8 +19,8 @@
  * GNU General Public License for more details.
  */
 
-#ifndef __XEN_8250_UART_H__
-#define __XEN_8250_UART_H__
+#ifndef XEN__8250_UART_H
+#define XEN__8250_UART_H
 
 /* Register offsets */
 #define UART_RBR          0x00    /* receive buffer       */
@@ -129,7 +129,7 @@
 #define RESUME_DELAY      MILLISECS(10)
 #define RESUME_RETRIES    100
 
-#endif /* __XEN_8250_UART_H__ */
+#endif /* XEN__8250_UART_H */
 
 /*
  * Local variables:
diff --git a/xen/include/xen/acpi.h b/xen/include/xen/acpi.h
index bc4818c943..64efc0a7bc 100644
--- a/xen/include/xen/acpi.h
+++ b/xen/include/xen/acpi.h
@@ -21,8 +21,8 @@
  * ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  */
 
-#ifndef _LINUX_ACPI_H
-#define _LINUX_ACPI_H
+#ifndef XEN__ACPI_H
+#define XEN__ACPI_H
 
 #ifndef _LINUX
 #define _LINUX
@@ -204,4 +204,4 @@ static inline void acpi_dmar_reinstate(void) {}
 
 #endif /* __ASSEMBLY__ */
 
-#endif /*_LINUX_ACPI_H*/
+#endif /*XEN__ACPI_H*/
diff --git a/xen/include/xen/alternative-call.h b/xen/include/xen/alternative-call.h
index 10f7d7637e..a91ae14416 100644
--- a/xen/include/xen/alternative-call.h
+++ b/xen/include/xen/alternative-call.h
@@ -1,6 +1,6 @@
 /* SPDX-License-Identifier: GPL-2.0 */
-#ifndef XEN_ALTERNATIVE_CALL
-#define XEN_ALTERNATIVE_CALL
+#ifndef XEN__ALTERNATIVE_CALL_H
+#define XEN__ALTERNATIVE_CALL_H
 
 /*
  * Some subsystems in Xen may have multiple implementations, which can be
@@ -65,4 +65,4 @@
 #define __alt_call_maybe_initdata __ro_after_init
 
 #endif /* !CONFIG_ALTERNATIVE_CALL */
-#endif /* XEN_ALTERNATIVE_CALL */
+#endif /* XEN__ALTERNATIVE_CALL_H */
diff --git a/xen/include/xen/atomic.h b/xen/include/xen/atomic.h
index fa750a18ae..ecff44c23d 100644
--- a/xen/include/xen/atomic.h
+++ b/xen/include/xen/atomic.h
@@ -19,8 +19,8 @@
  * this program; If not, see <http://www.gnu.org/licenses/>.
  */
 
-#ifndef __XEN_ATOMIC_H__
-#define __XEN_ATOMIC_H__
+#ifndef XEN__ATOMIC_H
+#define XEN__ATOMIC_H
 
 typedef struct { int counter; } atomic_t;
 
@@ -204,4 +204,4 @@ static inline int atomic_add_negative(int i, atomic_t *v);
  */
 static inline int atomic_add_unless(atomic_t *v, int a, int u);
 
-#endif /* __XEN_ATOMIC_H__ */
+#endif /* XEN__ATOMIC_H */
diff --git a/xen/include/xen/bitmap.h b/xen/include/xen/bitmap.h
index 4b642cd420..83b80214bc 100644
--- a/xen/include/xen/bitmap.h
+++ b/xen/include/xen/bitmap.h
@@ -1,5 +1,5 @@
-#ifndef __XEN_BITMAP_H
-#define __XEN_BITMAP_H
+#ifndef XEN__BITMAP_H
+#define XEN__BITMAP_H
 
 #ifndef __ASSEMBLY__
 
@@ -292,4 +292,4 @@ int bitmap_to_xenctl_bitmap(struct xenctl_bitmap *xenctl_bitmap,
 
 #endif /* __ASSEMBLY__ */
 
-#endif /* __XEN_BITMAP_H */
+#endif /* XEN__BITMAP_H */
diff --git a/xen/include/xen/bitops.h b/xen/include/xen/bitops.h
index 12eb88fb12..540cd58e9f 100644
--- a/xen/include/xen/bitops.h
+++ b/xen/include/xen/bitops.h
@@ -1,5 +1,5 @@
-#ifndef XEN_BITOPS_H
-#define XEN_BITOPS_H
+#ifndef XEN__BITOPS_H
+#define XEN__BITOPS_H
 
 #include <xen/compiler.h>
 #include <xen/types.h>
@@ -438,4 +438,4 @@ static inline __u32 ror32(__u32 word, unsigned int shift)
 
 #define BIT_WORD(nr) ((nr) / BITS_PER_LONG)
 
-#endif /* XEN_BITOPS_H */
+#endif /* XEN__BITOPS_H */
diff --git a/xen/include/xen/bug.h b/xen/include/xen/bug.h
index 99814c4bef..6f901fa1e4 100644
--- a/xen/include/xen/bug.h
+++ b/xen/include/xen/bug.h
@@ -1,5 +1,5 @@
-#ifndef __XEN_BUG_H__
-#define __XEN_BUG_H__
+#ifndef XEN__BUG_H
+#define XEN__BUG_H
 
 #define BUGFRAME_run_fn 0
 #define BUGFRAME_warn   1
@@ -157,7 +157,7 @@ int do_bug_frame(const struct cpu_user_regs *regs, unsigned long pc);
 
 #endif /* !__ASSEMBLY__ */
 
-#endif /* __XEN_BUG_H__ */
+#endif /* XEN__BUG_H */
 /*
  * Local variables:
  * mode: C
diff --git a/xen/include/xen/byteorder/big_endian.h b/xen/include/xen/byteorder/big_endian.h
index 40eb80a390..5b33acb577 100644
--- a/xen/include/xen/byteorder/big_endian.h
+++ b/xen/include/xen/byteorder/big_endian.h
@@ -1,5 +1,5 @@
-#ifndef __XEN_BYTEORDER_BIG_ENDIAN_H__
-#define __XEN_BYTEORDER_BIG_ENDIAN_H__
+#ifndef XEN__BYTEORDER__BIG_ENDIAN_H
+#define XEN__BYTEORDER__BIG_ENDIAN_H
 
 #ifndef __BIG_ENDIAN
 #define __BIG_ENDIAN 4321
@@ -99,4 +99,4 @@ static inline __u16 __be16_to_cpup(const __be16 *p)
 
 #include <xen/byteorder/generic.h>
 
-#endif /* __XEN_BYTEORDER_BIG_ENDIAN_H__ */
+#endif /* XEN__BYTEORDER__BIG_ENDIAN_H */
diff --git a/xen/include/xen/byteorder/generic.h b/xen/include/xen/byteorder/generic.h
index 8a0006b755..f97eb4771b 100644
--- a/xen/include/xen/byteorder/generic.h
+++ b/xen/include/xen/byteorder/generic.h
@@ -1,5 +1,5 @@
-#ifndef __XEN_BYTEORDER_GENERIC_H__
-#define __XEN_BYTEORDER_GENERIC_H__
+#ifndef XEN__BYTEORDER__GENERIC_H
+#define XEN__BYTEORDER__GENERIC_H
 
 /*
  * Generic Byte-reordering support
@@ -65,4 +65,4 @@
 #define cpu_to_be16s __cpu_to_be16s
 #define be16_to_cpus __be16_to_cpus
 
-#endif /* __XEN_BYTEORDER_GENERIC_H__ */
+#endif /* XEN__BYTEORDER__GENERIC_H */
diff --git a/xen/include/xen/byteorder/little_endian.h b/xen/include/xen/byteorder/little_endian.h
index 4955632793..6e944dca1a 100644
--- a/xen/include/xen/byteorder/little_endian.h
+++ b/xen/include/xen/byteorder/little_endian.h
@@ -1,5 +1,5 @@
-#ifndef __XEN_BYTEORDER_LITTLE_ENDIAN_H__
-#define __XEN_BYTEORDER_LITTLE_ENDIAN_H__
+#ifndef XEN__BYTEORDER__LITTLE_ENDIAN_H
+#define XEN__BYTEORDER__LITTLE_ENDIAN_H
 
 #ifndef __LITTLE_ENDIAN
 #define __LITTLE_ENDIAN 1234
@@ -99,4 +99,4 @@ static inline __u16 __be16_to_cpup(const __be16 *p)
 
 #include <xen/byteorder/generic.h>
 
-#endif /* __XEN_BYTEORDER_LITTLE_ENDIAN_H__ */
+#endif /* XEN__BYTEORDER__LITTLE_ENDIAN_H */
diff --git a/xen/include/xen/byteorder/swab.h b/xen/include/xen/byteorder/swab.h
index 9f817e3c44..96f8834e53 100644
--- a/xen/include/xen/byteorder/swab.h
+++ b/xen/include/xen/byteorder/swab.h
@@ -1,5 +1,5 @@
-#ifndef __XEN_BYTEORDER_SWAB_H__
-#define __XEN_BYTEORDER_SWAB_H__
+#ifndef XEN__BYTEORDER__SWAB_H
+#define XEN__BYTEORDER__SWAB_H
 
 /*
  * Byte-swapping, independently from CPU endianness
@@ -180,4 +180,4 @@ static inline void __swab64s(__u64 *addr)
 #define swab32s __swab32s
 #define swab64s __swab64s
 
-#endif /* __XEN_BYTEORDER_SWAB_H__ */
+#endif /* XEN__BYTEORDER__SWAB_H */
diff --git a/xen/include/xen/cache.h b/xen/include/xen/cache.h
index 6ee174efa4..9aa5150188 100644
--- a/xen/include/xen/cache.h
+++ b/xen/include/xen/cache.h
@@ -1,5 +1,5 @@
-#ifndef __LINUX_CACHE_H
-#define __LINUX_CACHE_H
+#ifndef XEN__CACHE_H
+#define XEN__CACHE_H
 
 #include <asm/cache.h>
 
@@ -15,4 +15,4 @@
 #define __cacheline_aligned __attribute__((__aligned__(SMP_CACHE_BYTES)))
 #endif
 
-#endif /* __LINUX_CACHE_H */
+#endif /* XEN__CACHE_H */
diff --git a/xen/include/xen/compat.h b/xen/include/xen/compat.h
index 7ec9d6567e..d1f6463530 100644
--- a/xen/include/xen/compat.h
+++ b/xen/include/xen/compat.h
@@ -2,8 +2,8 @@
  * compat.h
  */
 
-#ifndef __XEN_COMPAT_H__
-#define __XEN_COMPAT_H__
+#ifndef XEN__COMPAT_H
+#define XEN__COMPAT_H
 
 #include <xen/types.h>
 #ifdef CONFIG_HAS_COMPAT
@@ -243,4 +243,4 @@ void xlat_vcpu_runstate_info(struct vcpu_runstate_info *native);
 
 #endif
 
-#endif /* __XEN_COMPAT_H__ */
+#endif /* XEN__COMPAT_H */
diff --git a/xen/include/xen/compiler.h b/xen/include/xen/compiler.h
index b118e4ba62..e1ec208873 100644
--- a/xen/include/xen/compiler.h
+++ b/xen/include/xen/compiler.h
@@ -1,5 +1,5 @@
-#ifndef __LINUX_COMPILER_H
-#define __LINUX_COMPILER_H
+#ifndef XEN__COMPILER_H
+#define XEN__COMPILER_H
 
 #if !defined(__GNUC__) || (__GNUC__ < 4)
 #error Sorry, your compiler is too old/not recognized.
@@ -184,4 +184,4 @@
 # define CLANG_DISABLE_WARN_GCC_COMPAT_END
 #endif
 
-#endif /* __LINUX_COMPILER_H */
+#endif /* XEN__COMPILER_H */
diff --git a/xen/include/xen/config.h b/xen/include/xen/config.h
index d888b2314d..5202d25a66 100644
--- a/xen/include/xen/config.h
+++ b/xen/include/xen/config.h
@@ -4,8 +4,8 @@
  * A Linux-style configuration list.
  */
 
-#ifndef __XEN_CONFIG_H__
-#define __XEN_CONFIG_H__
+#ifndef XEN__CONFIG_H
+#define XEN__CONFIG_H
 
 #ifdef CPPCHECK
 #include <generated/compiler-def.h>
@@ -98,4 +98,4 @@
 #define ZERO_BLOCK_PTR ((void *)-1L)
 #endif
 
-#endif /* __XEN_CONFIG_H__ */
+#endif /* XEN__CONFIG_H */
diff --git a/xen/include/xen/console.h b/xen/include/xen/console.h
index 6dfbade3ec..36956faa17 100644
--- a/xen/include/xen/console.h
+++ b/xen/include/xen/console.h
@@ -4,8 +4,8 @@
  * Xen header file concerning console access.
  */
 
-#ifndef __CONSOLE_H__
-#define __CONSOLE_H__
+#ifndef XEN__CONSOLE_H
+#define XEN__CONSOLE_H
 
 #include <xen/inttypes.h>
 #include <public/xen.h>
@@ -50,4 +50,4 @@ void console_serial_puts(const char *s, size_t nr);
 
 extern int8_t opt_console_xen;
 
-#endif /* __CONSOLE_H__ */
+#endif /* XEN__CONSOLE_H */
diff --git a/xen/include/xen/consoled.h b/xen/include/xen/consoled.h
index bd7ab6329e..6975e50631 100644
--- a/xen/include/xen/consoled.h
+++ b/xen/include/xen/consoled.h
@@ -1,5 +1,5 @@
-#ifndef __XEN_CONSOLED_H__
-#define __XEN_CONSOLED_H__
+#ifndef XEN__CONSOLED_H
+#define XEN__CONSOLED_H
 
 #include <public/io/console.h>
 
@@ -8,7 +8,7 @@ struct xencons_interface *consoled_get_ring_addr(void);
 void consoled_guest_rx(void);
 void consoled_guest_tx(char c);
 
-#endif /* __XEN_CONSOLED_H__ */
+#endif /* XEN__CONSOLED_H */
 /*
  * Local variables:
  * mode: C
diff --git a/xen/include/xen/const.h b/xen/include/xen/const.h
index baf28ef144..16f550959d 100644
--- a/xen/include/xen/const.h
+++ b/xen/include/xen/const.h
@@ -1,7 +1,7 @@
 /* const.h: Macros for dealing with constants.  */
 
-#ifndef __XEN_CONST_H__
-#define __XEN_CONST_H__
+#ifndef XEN__CONST_H
+#define XEN__CONST_H
 
 /* Some constant macros are used in both assembler and
  * C code.  Therefore we cannot annotate them always with
@@ -23,4 +23,4 @@
 
 #define BIT(pos, sfx)   (_AC(1, sfx) << (pos))
 
-#endif /* __XEN_CONST_H__ */
+#endif /* XEN__CONST_H */
diff --git a/xen/include/xen/coverage.h b/xen/include/xen/coverage.h
index ba5fb67947..76101455e0 100644
--- a/xen/include/xen/coverage.h
+++ b/xen/include/xen/coverage.h
@@ -1,5 +1,5 @@
-#ifndef _XEN_COV_H
-#define _XEN_COV_H
+#ifndef XEN__COVERAGE_H
+#define XEN__COVERAGE_H
 
 #ifdef CONFIG_COVERAGE
 #include <public/sysctl.h>
diff --git a/xen/include/xen/cper.h b/xen/include/xen/cper.h
index de8f385bdd..8528ae2447 100644
--- a/xen/include/xen/cper.h
+++ b/xen/include/xen/cper.h
@@ -18,8 +18,8 @@
  * along with this program; If not, see <http://www.gnu.org/licenses/>.
  */
 
-#ifndef LINUX_CPER_H
-#define LINUX_CPER_H
+#ifndef XEN__CPER_H
+#define XEN__CPER_H
 
 #include <xen/types.h>
 #include <xen/string.h>
diff --git a/xen/include/xen/cpu.h b/xen/include/xen/cpu.h
index 6bf5786750..8ec0e8ef61 100644
--- a/xen/include/xen/cpu.h
+++ b/xen/include/xen/cpu.h
@@ -1,5 +1,5 @@
-#ifndef __XEN_CPU_H__
-#define __XEN_CPU_H__
+#ifndef XEN__CPU_H
+#define XEN__CPU_H
 
 #include <xen/types.h>
 #include <xen/spinlock.h>
@@ -83,4 +83,4 @@ int __cpu_up(unsigned int cpu);
 void __cpu_disable(void);
 void __cpu_die(unsigned int cpu);
 
-#endif /* __XEN_CPU_H__ */
+#endif /* XEN__CPU_H */
diff --git a/xen/include/xen/cpuidle.h b/xen/include/xen/cpuidle.h
index 705d0c1135..0e54eb7d9b 100644
--- a/xen/include/xen/cpuidle.h
+++ b/xen/include/xen/cpuidle.h
@@ -23,8 +23,8 @@
  *
  * ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  */
-#ifndef _XEN_CPUIDLE_H
-#define _XEN_CPUIDLE_H
+#ifndef XEN__CPUIDLE_H
+#define XEN__CPUIDLE_H
 
 #include <xen/cpumask.h>
 #include <xen/spinlock.h>
@@ -98,4 +98,4 @@ extern void cpuidle_wakeup_mwait(cpumask_t *mask);
 
 extern void menu_get_trace_data(u32 *expected, u32 *pred);
 
-#endif /* _XEN_CPUIDLE_H */
+#endif /* XEN__CPUIDLE_H */
diff --git a/xen/include/xen/cpumask.h b/xen/include/xen/cpumask.h
index b713bb69a9..4324af7c36 100644
--- a/xen/include/xen/cpumask.h
+++ b/xen/include/xen/cpumask.h
@@ -1,5 +1,5 @@
-#ifndef __XEN_CPUMASK_H
-#define __XEN_CPUMASK_H
+#ifndef XEN__CPUMASK_H
+#define XEN__CPUMASK_H
 
 /*
  * Cpumasks provide a bitmap suitable for representing the
@@ -466,4 +466,4 @@ int cpumask_to_xenctl_bitmap(struct xenctl_bitmap *xenctl_cpumap,
 int xenctl_bitmap_to_cpumask(cpumask_var_t *cpumask,
                              const struct xenctl_bitmap *xenctl_cpumap);
 
-#endif /* __XEN_CPUMASK_H */
+#endif /* XEN__CPUMASK_H */
diff --git a/xen/include/xen/ctype.h b/xen/include/xen/ctype.h
index 773ac27aa4..da4122f6ab 100644
--- a/xen/include/xen/ctype.h
+++ b/xen/include/xen/ctype.h
@@ -1,5 +1,5 @@
-#ifndef _LINUX_CTYPE_H
-#define _LINUX_CTYPE_H
+#ifndef XEN__CTYPE_H
+#define XEN__CTYPE_H
 
 /*
  * NOTE! This ctype does not handle EOF like the standard C
diff --git a/xen/include/xen/decompress.h b/xen/include/xen/decompress.h
index f5bc17f2b6..d65a3a4346 100644
--- a/xen/include/xen/decompress.h
+++ b/xen/include/xen/decompress.h
@@ -1,5 +1,5 @@
-#ifndef __XEN_GENERIC_H
-#define __XEN_GENERIC_H
+#ifndef XEN__DECOMPRESS_H
+#define XEN__DECOMPRESS_H
 
 typedef int decompress_fn(unsigned char *inbuf, unsigned int len,
                           int (*fill)(void*, unsigned int),
diff --git a/xen/include/xen/delay.h b/xen/include/xen/delay.h
index 8fd3b8f99f..269c034ce1 100644
--- a/xen/include/xen/delay.h
+++ b/xen/include/xen/delay.h
@@ -1,5 +1,5 @@
-#ifndef _LINUX_DELAY_H
-#define _LINUX_DELAY_H
+#ifndef XEN__DELAY_H
+#define XEN__DELAY_H
 
 /* Copyright (C) 1993 Linus Torvalds */
 
@@ -11,4 +11,4 @@ static inline void mdelay(unsigned long msec)
         udelay(1000);
 }
 
-#endif /* defined(_LINUX_DELAY_H) */
+#endif /* defined(XEN__DELAY_H) */
diff --git a/xen/include/xen/dm.h b/xen/include/xen/dm.h
index 18417d57f1..27d69a5c91 100644
--- a/xen/include/xen/dm.h
+++ b/xen/include/xen/dm.h
@@ -14,8 +14,8 @@
  * this program; If not, see <http://www.gnu.org/licenses/>.
  */
 
-#ifndef __XEN_DM_H__
-#define __XEN_DM_H__
+#ifndef XEN__DM_H
+#define XEN__DM_H
 
 #include <xen/types.h>
 
@@ -31,7 +31,7 @@ struct dmop_args {
 
 int dm_op(const struct dmop_args *op_args);
 
-#endif /* __XEN_DM_H__ */
+#endif /* XEN__DM_H */
 
 /*
  * Local variables:
diff --git a/xen/include/xen/dmi.h b/xen/include/xen/dmi.h
index ed6ffda315..16f13195d7 100644
--- a/xen/include/xen/dmi.h
+++ b/xen/include/xen/dmi.h
@@ -1,5 +1,5 @@
-#ifndef __DMI_H__
-#define __DMI_H__
+#ifndef XEN__DMI_H
+#define XEN__DMI_H
 
 enum dmi_field {
 	DMI_NONE,
@@ -44,4 +44,4 @@ extern void dmi_efi_get_table(const void *smbios, const void *smbios3);
 bool dmi_get_date(int field, int *yearp, int *monthp, int *dayp);
 extern void dmi_end_boot(void);
 
-#endif	/* __DMI_H__ */
+#endif	/* XEN__DMI_H */
diff --git a/xen/include/xen/domain.h b/xen/include/xen/domain.h
index 3de5635291..99f312e9b4 100644
--- a/xen/include/xen/domain.h
+++ b/xen/include/xen/domain.h
@@ -1,6 +1,6 @@
 
-#ifndef __XEN_DOMAIN_H__
-#define __XEN_DOMAIN_H__
+#ifndef XEN__DOMAIN_H
+#define XEN__DOMAIN_H
 
 #include <xen/numa.h>
 #include <xen/types.h>
@@ -171,4 +171,4 @@ extern bool vmtrace_available;
 
 extern bool vpmu_is_available;
 
-#endif /* __XEN_DOMAIN_H__ */
+#endif /* XEN__DOMAIN_H */
diff --git a/xen/include/xen/domain_page.h b/xen/include/xen/domain_page.h
index c89b149e54..4ccf28f26d 100644
--- a/xen/include/xen/domain_page.h
+++ b/xen/include/xen/domain_page.h
@@ -6,8 +6,8 @@
  * Copyright (c) 2003-2006, Keir Fraser <keir@xensource.com>
  */
 
-#ifndef __XEN_DOMAIN_PAGE_H__
-#define __XEN_DOMAIN_PAGE_H__
+#ifndef XEN__DOMAIN_PAGE_H
+#define XEN__DOMAIN_PAGE_H
 
 #include <xen/mm.h>
 
@@ -77,4 +77,4 @@ static inline void unmap_domain_page_global(const void *va) {};
     (p) = NULL;                     \
 } while ( false )
 
-#endif /* __XEN_DOMAIN_PAGE_H__ */
+#endif /* XEN__DOMAIN_PAGE_H */
diff --git a/xen/include/xen/dt-overlay.h b/xen/include/xen/dt-overlay.h
index b2cedf3f2a..cd44a5cacb 100644
--- a/xen/include/xen/dt-overlay.h
+++ b/xen/include/xen/dt-overlay.h
@@ -8,8 +8,8 @@
  * Written by Vikram Garhwal <vikram.garhwal@amd.com>
  *
  */
-#ifndef __XEN_DT_OVERLAY_H__
-#define __XEN_DT_OVERLAY_H__
+#ifndef XEN__DT_OVERLAY_H
+#define XEN__DT_OVERLAY_H
 
 #include <xen/device_tree.h>
 #include <xen/list.h>
@@ -58,7 +58,7 @@ static inline long dt_overlay_domctl(struct domain *d,
 }
 #endif
 
-#endif /* __XEN_DT_OVERLAY_H__ */
+#endif /* XEN__DT_OVERLAY_H */
 
 /*
  * Local variables:
diff --git a/xen/include/xen/early_printk.h b/xen/include/xen/early_printk.h
index 5d72293793..41ae0dded1 100644
--- a/xen/include/xen/early_printk.h
+++ b/xen/include/xen/early_printk.h
@@ -1,8 +1,8 @@
 /*
  * printk() for use before the console is initialized
  */
-#ifndef __XEN_EARLY_PRINTK_H__
-#define __XEN_EARLY_PRINTK_H__
+#ifndef XEN__EARLY_PRINTK_H
+#define XEN__EARLY_PRINTK_H
 
 #include <xen/types.h>
 
diff --git a/xen/include/xen/earlycpio.h b/xen/include/xen/earlycpio.h
index 16d9404d73..9e5d740be9 100644
--- a/xen/include/xen/earlycpio.h
+++ b/xen/include/xen/earlycpio.h
@@ -1,5 +1,5 @@
-#ifndef _EARLYCPIO_H
-#define _EARLYCPIO_H
+#ifndef XEN__EARLYCPIO_H
+#define XEN__EARLYCPIO_H
 
 #define MAX_CPIO_FILE_NAME 18
 
@@ -12,4 +12,4 @@ struct cpio_data {
 struct cpio_data find_cpio_data(const char *path, void *data, size_t len,
 				long *offset);
 
-#endif /* _EARLYCPIO_H */
+#endif /* XEN__EARLYCPIO_H */
diff --git a/xen/include/xen/efi.h b/xen/include/xen/efi.h
index 160804e294..bc3ddffd6d 100644
--- a/xen/include/xen/efi.h
+++ b/xen/include/xen/efi.h
@@ -1,5 +1,5 @@
-#ifndef __XEN_EFI_H__
-#define __XEN_EFI_H__
+#ifndef XEN__EFI_H
+#define XEN__EFI_H
 
 #ifndef __ASSEMBLY__
 #include <xen/types.h>
@@ -55,4 +55,4 @@ int efi_compat_runtime_call(struct compat_pf_efi_runtime_call *op);
 
 #endif /* !__ASSEMBLY__ */
 
-#endif /* __XEN_EFI_H__ */
+#endif /* XEN__EFI_H */
diff --git a/xen/include/xen/elf.h b/xen/include/xen/elf.h
index 4199b4d6e6..48d8dc4ca8 100644
--- a/xen/include/xen/elf.h
+++ b/xen/include/xen/elf.h
@@ -24,8 +24,8 @@
  * THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
  */
 
-#ifndef __XEN_ELF_H__
-#define __XEN_ELF_H__
+#ifndef XEN__ELF_H
+#define XEN__ELF_H
 
 #include <xen/elfstructs.h>
 
@@ -34,4 +34,4 @@
 #define ELFNOTE_DESC(_n_) (ELFNOTE_NAME(_n_) + ELFNOTE_ALIGN((_n_)->namesz))
 #define ELFNOTE_NEXT(_n_) ((Elf_Note *)(ELFNOTE_DESC(_n_) + ELFNOTE_ALIGN((_n_)->descsz)))
 
-#endif /* __XEN_ELF_H__ */
+#endif /* XEN__ELF_H */
diff --git a/xen/include/xen/elfcore.h b/xen/include/xen/elfcore.h
index 0d78033424..e5b18a5eff 100644
--- a/xen/include/xen/elfcore.h
+++ b/xen/include/xen/elfcore.h
@@ -6,8 +6,8 @@
  *
  */
 
-#ifndef __ELFCOREC_H__
-#define __ELFCOREC_H__
+#ifndef XEN__ELFCORE_H
+#define XEN__ELFCORE_H
 
 #include <xen/types.h>
 #include <xen/elf.h>
@@ -71,7 +71,7 @@ typedef struct crash_xen_info {
 #endif
 } crash_xen_info_t;
 
-#endif /* __ELFCOREC_H__ */
+#endif /* XEN__ELFCORE_H */
 
 /*
  * Local variables:
diff --git a/xen/include/xen/elfstructs.h b/xen/include/xen/elfstructs.h
index eb6b87a823..df4712c21a 100644
--- a/xen/include/xen/elfstructs.h
+++ b/xen/include/xen/elfstructs.h
@@ -1,5 +1,5 @@
-#ifndef __XEN_ELFSTRUCTS_H__
-#define __XEN_ELFSTRUCTS_H__
+#ifndef XEN__ELFSTRUCTS_H
+#define XEN__ELFSTRUCTS_H
 /*
  * Copyright (c) 1995, 1996 Erik Theisen.  All rights reserved.
  *
@@ -620,4 +620,4 @@ typedef struct {
 #define AuxInfo		Aux64Info
 #endif
 
-#endif /* __XEN_ELFSTRUCTS_H__ */
+#endif /* XEN__ELFSTRUCTS_H */
diff --git a/xen/include/xen/err.h b/xen/include/xen/err.h
index cbdd1bf7f8..52ac753425 100644
--- a/xen/include/xen/err.h
+++ b/xen/include/xen/err.h
@@ -1,5 +1,5 @@
-#if !defined(__XEN_ERR_H__) && !defined(__ASSEMBLY__)
-#define __XEN_ERR_H__
+#if !defined(XEN__ERR_H) && !defined(__ASSEMBLY__)
+#define XEN__ERR_H
 
 #include <xen/compiler.h>
 #include <xen/errno.h>
@@ -41,4 +41,4 @@ static inline int __must_check PTR_RET(const void *ptr)
 	return IS_ERR(ptr) ? PTR_ERR(ptr) : 0;
 }
 
-#endif /* __XEN_ERR_H__ */
+#endif /* XEN__ERR_H */
diff --git a/xen/include/xen/errno.h b/xen/include/xen/errno.h
index 506674701f..bb99a2fdd8 100644
--- a/xen/include/xen/errno.h
+++ b/xen/include/xen/errno.h
@@ -1,5 +1,5 @@
-#ifndef __XEN_ERRNO_H__
-#define __XEN_ERRNO_H__
+#ifndef XEN__ERRNO_H
+#define XEN__ERRNO_H
 
 #ifndef __ASSEMBLY__
 
@@ -15,4 +15,4 @@ enum {
 
 #endif /* __ASSEMBLY__ */
 
-#endif /*  __XEN_ERRNO_H__ */
+#endif /*  XEN__ERRNO_H */
diff --git a/xen/include/xen/event.h b/xen/include/xen/event.h
index 48b79f3d62..e0643abe53 100644
--- a/xen/include/xen/event.h
+++ b/xen/include/xen/event.h
@@ -6,8 +6,8 @@
  * Copyright (c) 2002-2006, K A Fraser
  */
 
-#ifndef __XEN_EVENT_H__
-#define __XEN_EVENT_H__
+#ifndef XEN__EVENT_H
+#define XEN__EVENT_H
 
 #include <xen/sched.h>
 #include <xen/smp.h>
@@ -302,4 +302,4 @@ static inline int evtchn_port_poll(struct domain *d, evtchn_port_t port)
     return rc;
 }
 
-#endif /* __XEN_EVENT_H__ */
+#endif /* XEN__EVENT_H */
diff --git a/xen/include/xen/grant_table.h b/xen/include/xen/grant_table.h
index 50edfecfb6..31e56925a7 100644
--- a/xen/include/xen/grant_table.h
+++ b/xen/include/xen/grant_table.h
@@ -20,8 +20,8 @@
  * along with this program; If not, see <http://www.gnu.org/licenses/>.
  */
 
-#ifndef __XEN_GRANT_TABLE_H__
-#define __XEN_GRANT_TABLE_H__
+#ifndef XEN__GRANT_TABLE_H
+#define XEN__GRANT_TABLE_H
 
 #include <xen/mm-frame.h>
 #include <xen/rwlock.h>
@@ -117,4 +117,4 @@ static inline int gnttab_acquire_resource(
 
 #endif /* CONFIG_GRANT_TABLE */
 
-#endif /* __XEN_GRANT_TABLE_H__ */
+#endif /* XEN__GRANT_TABLE_H */
diff --git a/xen/include/xen/guest_access.h b/xen/include/xen/guest_access.h
index 6489924db6..62b7d8838c 100644
--- a/xen/include/xen/guest_access.h
+++ b/xen/include/xen/guest_access.h
@@ -4,8 +4,8 @@
  * Copyright (x) 2006, K A Fraser
  */
 
-#ifndef __XEN_GUEST_ACCESS_H__
-#define __XEN_GUEST_ACCESS_H__
+#ifndef XEN__GUEST_ACCESS_H
+#define XEN__GUEST_ACCESS_H
 
 #include <asm/guest_access.h>
 #include <xen/types.h>
@@ -186,7 +186,7 @@
 char *safe_copy_string_from_guest(XEN_GUEST_HANDLE(char) u_buf,
                                   size_t size, size_t max_size);
 
-#endif /* __XEN_GUEST_ACCESS_H__ */
+#endif /* XEN__GUEST_ACCESS_H */
 
 /*
  * Local variables:
diff --git a/xen/include/xen/gunzip.h b/xen/include/xen/gunzip.h
index 805833127a..12fa062b87 100644
--- a/xen/include/xen/gunzip.h
+++ b/xen/include/xen/gunzip.h
@@ -1,5 +1,5 @@
-#ifndef __XEN_GUNZIP_H
-#define __XEN_GUNZIP_H
+#ifndef XEN__GUNZIP_H
+#define XEN__GUNZIP_H
 
 int gzip_check(char *image, unsigned long image_len);
 int perform_gunzip(char *output, char *image, unsigned long image_len);
diff --git a/xen/include/xen/hypercall.h b/xen/include/xen/hypercall.h
index f307dfb597..93263390f9 100644
--- a/xen/include/xen/hypercall.h
+++ b/xen/include/xen/hypercall.h
@@ -2,8 +2,8 @@
  * hypercall.h
  */
 
-#ifndef __XEN_HYPERCALL_H__
-#define __XEN_HYPERCALL_H__
+#ifndef XEN__HYPERCALL_H
+#define XEN__HYPERCALL_H
 
 #include <xen/types.h>
 #include <xen/time.h>
@@ -58,4 +58,4 @@ common_vcpu_op(int cmd,
 
 void arch_get_xen_caps(xen_capabilities_info_t *info);
 
-#endif /* __XEN_HYPERCALL_H__ */
+#endif /* XEN__HYPERCALL_H */
diff --git a/xen/include/xen/init.h b/xen/include/xen/init.h
index 0a42238337..39ad1d71d4 100644
--- a/xen/include/xen/init.h
+++ b/xen/include/xen/init.h
@@ -1,5 +1,5 @@
-#ifndef _LINUX_INIT_H
-#define _LINUX_INIT_H
+#ifndef XEN__INIT_H
+#define XEN__INIT_H
 
 /*
  * Mark functions and data as being only used at initialization
@@ -82,4 +82,4 @@ void do_initcalls(void);
 #define __hwdom_initdata  __initdata
 #endif
 
-#endif /* _LINUX_INIT_H */
+#endif /* XEN__INIT_H */
diff --git a/xen/include/xen/inttypes.h b/xen/include/xen/inttypes.h
index 28c0053f1c..b7172f8746 100644
--- a/xen/include/xen/inttypes.h
+++ b/xen/include/xen/inttypes.h
@@ -18,8 +18,8 @@
  *	ISO C99: 7.8 Format conversion of integer types	<inttypes.h>
  */
 
-#ifndef _XEN_INTTYPES_H
-#define _XEN_INTTYPES_H	1
+#ifndef XEN__INTTYPES_H
+#define XEN__INTTYPES_H	1
 
 #include <xen/types.h>
 
@@ -245,4 +245,4 @@
 # define SCNuPTR	__PRIPTR_PREFIX "u"
 # define SCNxPTR	__PRIPTR_PREFIX "x"
 
-#endif /* _XEN_INTTYPES_H */
+#endif /* XEN__INTTYPES_H */
diff --git a/xen/include/xen/iocap.h b/xen/include/xen/iocap.h
index ffbc48b60f..c9ec5c931b 100644
--- a/xen/include/xen/iocap.h
+++ b/xen/include/xen/iocap.h
@@ -4,8 +4,8 @@
  * Per-domain I/O capabilities.
  */
 
-#ifndef __XEN_IOCAP_H__
-#define __XEN_IOCAP_H__
+#ifndef XEN__IOCAP_H
+#define XEN__IOCAP_H
 
 #include <xen/sched.h>
 #include <xen/rangeset.h>
@@ -66,4 +66,4 @@ static inline int iomem_deny_access(struct domain *d, unsigned long s,
     ? irq__ : 0;                                        \
 })
 
-#endif /* __XEN_IOCAP_H__ */
+#endif /* XEN__IOCAP_H */
diff --git a/xen/include/xen/ioreq.h b/xen/include/xen/ioreq.h
index 29a17e8ff5..ce54ff2d57 100644
--- a/xen/include/xen/ioreq.h
+++ b/xen/include/xen/ioreq.h
@@ -16,8 +16,8 @@
  * this program; If not, see <http://www.gnu.org/licenses/>.
  */
 
-#ifndef __XEN_IOREQ_H__
-#define __XEN_IOREQ_H__
+#ifndef XEN__IOREQ_H
+#define XEN__IOREQ_H
 
 #include <xen/sched.h>
 
@@ -138,7 +138,7 @@ bool arch_ioreq_server_get_type_addr(const struct domain *d, const ioreq_t *p,
                                      uint8_t *type, uint64_t *addr);
 void arch_ioreq_domain_init(struct domain *d);
 
-#endif /* __XEN_IOREQ_H__ */
+#endif /* XEN__IOREQ_H */
 
 /*
  * Local variables:
diff --git a/xen/include/xen/irq.h b/xen/include/xen/irq.h
index 95034c0d6b..c037e104c3 100644
--- a/xen/include/xen/irq.h
+++ b/xen/include/xen/irq.h
@@ -1,5 +1,5 @@
-#ifndef __XEN_IRQ_H__
-#define __XEN_IRQ_H__
+#ifndef XEN__IRQ_H
+#define XEN__IRQ_H
 
 #include <xen/cpumask.h>
 #include <xen/rcupdate.h>
@@ -211,4 +211,4 @@ unsigned int arch_hwdom_irqs(const struct domain *d);
 void arch_evtchn_bind_pirq(struct domain *d, int pirq);
 #endif
 
-#endif /* __XEN_IRQ_H__ */
+#endif /* XEN__IRQ_H */
diff --git a/xen/include/xen/irq_cpustat.h b/xen/include/xen/irq_cpustat.h
index b9629f25c2..81e8f87d49 100644
--- a/xen/include/xen/irq_cpustat.h
+++ b/xen/include/xen/irq_cpustat.h
@@ -1,5 +1,5 @@
-#ifndef __irq_cpustat_h
-#define __irq_cpustat_h
+#ifndef XEN__IRQ_CPUSTAT_H
+#define XEN__IRQ_CPUSTAT_H
 
 /*
  * Contains default mappings for irq_cpustat_t, used by almost every
@@ -26,4 +26,4 @@ extern irq_cpustat_t irq_stat[];
 #define local_irq_count(cpu)	__IRQ_STAT((cpu), __local_irq_count)
 #define mwait_wakeup(cpu)	__IRQ_STAT((cpu), __mwait_wakeup)
 
-#endif	/* __irq_cpustat_h */
+#endif	/* XEN__IRQ_CPUSTAT_H */
diff --git a/xen/include/xen/kconfig.h b/xen/include/xen/kconfig.h
index c25dc0f6c2..820836b0a1 100644
--- a/xen/include/xen/kconfig.h
+++ b/xen/include/xen/kconfig.h
@@ -1,5 +1,5 @@
-#ifndef __XEN_KCONFIG_H
-#define __XEN_KCONFIG_H
+#ifndef XEN__KCONFIG_H
+#define XEN__KCONFIG_H
 
 #include <generated/autoconf.h>
 
@@ -46,4 +46,4 @@
 #define STATIC_IF_NOT(option) static_if_not(option)
 #endif
 
-#endif /* __XEN_KCONFIG_H */
+#endif /* XEN__KCONFIG_H */
diff --git a/xen/include/xen/kernel.h b/xen/include/xen/kernel.h
index c5b6cc9777..3b6687e990 100644
--- a/xen/include/xen/kernel.h
+++ b/xen/include/xen/kernel.h
@@ -1,5 +1,5 @@
-#ifndef _LINUX_KERNEL_H
-#define _LINUX_KERNEL_H
+#ifndef XEN__KERNEL_H
+#define XEN__KERNEL_H
 
 /*
  * 'kernel.h' contains some often-used function prototypes etc
@@ -100,5 +100,5 @@ struct vcpu;
 void cf_check show_execution_state(const struct cpu_user_regs *regs);
 void vcpu_show_execution_state(struct vcpu *v);
 
-#endif /* _LINUX_KERNEL_H */
+#endif /* XEN__KERNEL_H */
 
diff --git a/xen/include/xen/keyhandler.h b/xen/include/xen/keyhandler.h
index 6fee878fdf..5362e6de04 100644
--- a/xen/include/xen/keyhandler.h
+++ b/xen/include/xen/keyhandler.h
@@ -7,8 +7,8 @@
  * nicer fashion than just editing the serial/keyboard drivers.
  */
 
-#ifndef __XEN_KEYHANDLER_H__
-#define __XEN_KEYHANDLER_H__
+#ifndef XEN__KEYHANDLER_H
+#define XEN__KEYHANDLER_H
 
 #include <xen/types.h>
 
@@ -57,4 +57,4 @@ enum crash_reason {
 
 void keyhandler_crash_action(enum crash_reason reason);
 
-#endif /* __XEN_KEYHANDLER_H__ */
+#endif /* XEN__KEYHANDLER_H */
diff --git a/xen/include/xen/lib.h b/xen/include/xen/lib.h
index 81b722ea3e..5d75fca614 100644
--- a/xen/include/xen/lib.h
+++ b/xen/include/xen/lib.h
@@ -1,5 +1,5 @@
-#ifndef __LIB_H__
-#define __LIB_H__
+#ifndef XEN__LIB_H
+#define XEN__LIB_H
 
 #include <xen/macros.h>
 
@@ -202,4 +202,4 @@ void *bsearch(const void *key, const void *base, size_t num, size_t size,
 
 #endif /* __ASSEMBLY__ */
 
-#endif /* __LIB_H__ */
+#endif /* XEN__LIB_H */
diff --git a/xen/include/xen/libelf.h b/xen/include/xen/libelf.h
index a99d33c251..82151e3292 100644
--- a/xen/include/xen/libelf.h
+++ b/xen/include/xen/libelf.h
@@ -20,8 +20,8 @@
  * DEALINGS IN THE SOFTWARE.
  */
 
-#ifndef __XEN_LIBELF_H__
-#define __XEN_LIBELF_H__
+#ifndef XEN__LIBELF_H
+#define XEN__LIBELF_H
 
 #if defined(__i386__) || defined(__x86_64__) || defined(__arm__) || defined(__aarch64__)
 #define XEN_ELF_LITTLE_ENDIAN
@@ -504,4 +504,4 @@ static inline void ELF_ADVANCE_DEST(struct elf_binary *elf, uint64_t amount)
  * is in use or until elf_set_xdest(,0,0) is called. */
 void elf_set_xdest(struct elf_binary *elf, void *addr, uint64_t size);
 
-#endif /* __XEN_LIBELF_H__ */
+#endif /* XEN__LIBELF_H */
diff --git a/xen/include/xen/linkage.h b/xen/include/xen/linkage.h
index 3d401b88c1..a81300ccff 100644
--- a/xen/include/xen/linkage.h
+++ b/xen/include/xen/linkage.h
@@ -1,5 +1,5 @@
-#ifndef __LINKAGE_H__
-#define __LINKAGE_H__
+#ifndef XEN__LINKAGE_H
+#define XEN__LINKAGE_H
 
 #ifdef __ASSEMBLY__
 
@@ -64,4 +64,4 @@
 
 #endif /*  __ASSEMBLY__ */
 
-#endif /* __LINKAGE_H__ */
+#endif /* XEN__LINKAGE_H */
diff --git a/xen/include/xen/linux-compat.h b/xen/include/xen/linux-compat.h
index 1f4186102a..32f08b03f0 100644
--- a/xen/include/xen/linux-compat.h
+++ b/xen/include/xen/linux-compat.h
@@ -6,8 +6,8 @@
  * files.
  */
 
-#ifndef __XEN_LINUX_COMPAT_H__
-#define __XEN_LINUX_COMPAT_H__
+#ifndef XEN__LINUX_COMPAT_H
+#define XEN__LINUX_COMPAT_H
 
 #include <xen/types.h>
 
@@ -21,4 +21,4 @@ typedef paddr_t phys_addr_t;
 
 #define __ffs(x) (ffsl(x) - 1UL)
 
-#endif /* __XEN_LINUX_COMPAT_H__ */
+#endif /* XEN__LINUX_COMPAT_H */
diff --git a/xen/include/xen/list.h b/xen/include/xen/list.h
index 62169f4674..4cfb196940 100644
--- a/xen/include/xen/list.h
+++ b/xen/include/xen/list.h
@@ -4,8 +4,8 @@
  * Useful linked-list definitions taken from the Linux kernel (2.6.18).
  */
 
-#ifndef __XEN_LIST_H__
-#define __XEN_LIST_H__
+#ifndef XEN__LIST_H
+#define XEN__LIST_H
 
 #include <xen/bug.h>
 #include <asm/system.h>
@@ -979,4 +979,4 @@ static inline void hlist_add_after_rcu(struct hlist_node *prev,
           ({ tpos = hlist_entry(pos, typeof(*(tpos)), member); 1;});    \
           (pos) = (pos)->next)
 
-#endif /* __XEN_LIST_H__ */
+#endif /* XEN__LIST_H */
diff --git a/xen/include/xen/list_sort.h b/xen/include/xen/list_sort.h
index 13ce0a55ec..9ec309ac83 100644
--- a/xen/include/xen/list_sort.h
+++ b/xen/include/xen/list_sort.h
@@ -1,5 +1,5 @@
-#ifndef _LINUX_LIST_SORT_H
-#define _LINUX_LIST_SORT_H
+#ifndef XEN__LIST_SORT_H
+#define XEN__LIST_SORT_H
 
 #include <xen/types.h>
 
diff --git a/xen/include/xen/lz4.h b/xen/include/xen/lz4.h
index fa20520110..fd11d01ef9 100644
--- a/xen/include/xen/lz4.h
+++ b/xen/include/xen/lz4.h
@@ -1,5 +1,5 @@
-#ifndef __LZ4_H__
-#define __LZ4_H__
+#ifndef XEN__LZ4_H
+#define XEN__LZ4_H
 
 /*
  * LZ4 Kernel Interface
diff --git a/xen/include/xen/lzo.h b/xen/include/xen/lzo.h
index e920027fad..7d3949e3f1 100644
--- a/xen/include/xen/lzo.h
+++ b/xen/include/xen/lzo.h
@@ -1,5 +1,5 @@
-#ifndef __LZO_H__
-#define __LZO_H__
+#ifndef XEN__LZO_H
+#define XEN__LZO_H
 /*
  *  LZO Public Kernel Interface
  *  A mini subset of the LZO real-time data compression library
diff --git a/xen/include/xen/macros.h b/xen/include/xen/macros.h
index 19caaa8026..9e470c7649 100644
--- a/xen/include/xen/macros.h
+++ b/xen/include/xen/macros.h
@@ -1,5 +1,5 @@
-#ifndef __MACROS_H__
-#define __MACROS_H__
+#ifndef XEN__MACROS_H
+#define XEN__MACROS_H
 
 #define ROUNDUP(x, a) (((x) + (a) - 1) & ~((a) - 1))
 
@@ -147,7 +147,7 @@
 
 #endif /* __ASSEMBLY__ */
 
-#endif /* __MACROS_H__ */
+#endif /* XEN__MACROS_H */
 
 /*
  * Local variables:
diff --git a/xen/include/xen/mm-frame.h b/xen/include/xen/mm-frame.h
index d973aec901..d8dffe22d6 100644
--- a/xen/include/xen/mm-frame.h
+++ b/xen/include/xen/mm-frame.h
@@ -1,5 +1,5 @@
-#ifndef __XEN_FRAME_NUM_H__
-#define __XEN_FRAME_NUM_H__
+#ifndef XEN__MM_FRAME_H
+#define XEN__MM_FRAME_H
 
 #include <xen/kernel.h>
 #include <xen/typesafe.h>
@@ -85,4 +85,4 @@ TYPE_SAFE(unsigned long, pfn);
 #define pfn_x
 #endif
 
-#endif /* __XEN_FRAME_NUM_H__ */
+#endif /* XEN__MM_FRAME_H */
diff --git a/xen/include/xen/mm.h b/xen/include/xen/mm.h
index 7561297a75..3a64b013c4 100644
--- a/xen/include/xen/mm.h
+++ b/xen/include/xen/mm.h
@@ -58,8 +58,8 @@
  *   documented, meanings.
  */
 
-#ifndef __XEN_MM_H__
-#define __XEN_MM_H__
+#ifndef XEN__MM_H
+#define XEN__MM_H
 
 #include <xen/bug.h>
 #include <xen/compiler.h>
@@ -648,4 +648,4 @@ static inline void put_page_alloc_ref(struct page_info *page)
     }
 }
 
-#endif /* __XEN_MM_H__ */
+#endif /* XEN__MM_H */
diff --git a/xen/include/xen/msi.h b/xen/include/xen/msi.h
index c903d0050c..4e462881ae 100644
--- a/xen/include/xen/msi.h
+++ b/xen/include/xen/msi.h
@@ -1,5 +1,5 @@
-#ifndef __XEN_MSI_H_
-#define __XEN_MSI_H_
+#ifndef XEN__MSI_H
+#define XEN__MSI_H
 
 #include <xen/pci.h>
 
diff --git a/xen/include/xen/multiboot.h b/xen/include/xen/multiboot.h
index 80a1761d9e..30959a5bb6 100644
--- a/xen/include/xen/multiboot.h
+++ b/xen/include/xen/multiboot.h
@@ -14,8 +14,8 @@
    You should have received a copy of the GNU General Public License
    along with this program; If not, see <http://www.gnu.org/licenses/>.  */
 
-#ifndef __MULTIBOOT_H__
-#define __MULTIBOOT_H__
+#ifndef XEN__MULTIBOOT_H
+#define XEN__MULTIBOOT_H
 
 #include "const.h"
 
@@ -130,4 +130,4 @@ typedef struct memory_map memory_map_t;
 
 #endif /* __ASSEMBLY__ */
 
-#endif /* __MULTIBOOT_H__ */
+#endif /* XEN__MULTIBOOT_H */
diff --git a/xen/include/xen/multiboot2.h b/xen/include/xen/multiboot2.h
index f792040205..20c6082ea9 100644
--- a/xen/include/xen/multiboot2.h
+++ b/xen/include/xen/multiboot2.h
@@ -23,8 +23,8 @@
  *  IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
  */
 
-#ifndef __MULTIBOOT2_H__
-#define __MULTIBOOT2_H__
+#ifndef XEN__MULTIBOOT2_H
+#define XEN__MULTIBOOT2_H
 
 /* The magic field should contain this.  */
 #define MULTIBOOT2_HEADER_MAGIC                         0xe85250d6
@@ -232,4 +232,4 @@ typedef struct {
 } multiboot2_tag_module_t;
 #endif /* __ASSEMBLY__ */
 
-#endif /* __MULTIBOOT2_H__ */
+#endif /* XEN__MULTIBOOT2_H */
diff --git a/xen/include/xen/multicall.h b/xen/include/xen/multicall.h
index 5bebeca7b2..fd71dbd9a1 100644
--- a/xen/include/xen/multicall.h
+++ b/xen/include/xen/multicall.h
@@ -2,8 +2,8 @@
  * multicall.h
  */
 
-#ifndef __XEN_MULTICALL_H__
-#define __XEN_MULTICALL_H__
+#ifndef XEN__MULTICALL_H
+#define XEN__MULTICALL_H
 
 #ifdef CONFIG_COMPAT
 #include <compat/xen.h>
@@ -27,4 +27,4 @@ enum mc_disposition {
     mc_preempt,
 } arch_do_multicall_call(struct mc_state *mcs);
 
-#endif /* __XEN_MULTICALL_H__ */
+#endif /* XEN__MULTICALL_H */
diff --git a/xen/include/xen/nodemask.h b/xen/include/xen/nodemask.h
index 1dd6c7458e..8cab82c7a2 100644
--- a/xen/include/xen/nodemask.h
+++ b/xen/include/xen/nodemask.h
@@ -1,5 +1,5 @@
-#ifndef __LINUX_NODEMASK_H
-#define __LINUX_NODEMASK_H
+#ifndef XEN__NODEMASK_H
+#define XEN__NODEMASK_H
 
 /*
  * Nodemasks provide a bitmap suitable for representing the
@@ -290,4 +290,4 @@ extern nodemask_t node_online_map;
 
 #define for_each_online_node(node) for_each_node_mask((node), node_online_map)
 
-#endif /* __LINUX_NODEMASK_H */
+#endif /* XEN__NODEMASK_H */
diff --git a/xen/include/xen/nospec.h b/xen/include/xen/nospec.h
index 828dbd4e0a..99e6d5a6e9 100644
--- a/xen/include/xen/nospec.h
+++ b/xen/include/xen/nospec.h
@@ -4,8 +4,8 @@
 /* Copyright(c) 2018 Intel Corporation. All rights reserved. */
 /* Copyright(c) 2018 Citrix Systems R&D Ltd. All rights reserved. */
 
-#ifndef XEN_NOSPEC_H
-#define XEN_NOSPEC_H
+#ifndef XEN__NOSPEC_H
+#define XEN__NOSPEC_H
 
 #include <xen/stdbool.h>
 
@@ -87,7 +87,7 @@ static always_inline bool lock_evaluate_nospec(bool condition)
 #endif
 }
 
-#endif /* XEN_NOSPEC_H */
+#endif /* XEN__NOSPEC_H */
 
 /*
  * Local variables:
diff --git a/xen/include/xen/notifier.h b/xen/include/xen/notifier.h
index 05359e8a85..e2ce641311 100644
--- a/xen/include/xen/notifier.h
+++ b/xen/include/xen/notifier.h
@@ -7,8 +7,8 @@
  * Original code from Linux kernel 2.6.27 (Alan Cox <Alan.Cox@linux.org>)
  */
  
-#ifndef __XEN_NOTIFIER_H__
-#define __XEN_NOTIFIER_H__
+#ifndef XEN__NOTIFIER_H
+#define XEN__NOTIFIER_H
 
 #include <xen/types.h>
 #include <xen/errno.h>
@@ -68,4 +68,4 @@ static inline int notifier_to_errno(int ret)
     return (ret == NOTIFY_DONE) ? 0 : -(ret & ~NOTIFY_STOP_MASK);
 }
 
-#endif /* __XEN_NOTIFIER_H__ */
+#endif /* XEN__NOTIFIER_H */
diff --git a/xen/include/xen/numa.h b/xen/include/xen/numa.h
index fd1511a6fb..1617901fc2 100644
--- a/xen/include/xen/numa.h
+++ b/xen/include/xen/numa.h
@@ -1,5 +1,5 @@
-#ifndef _XEN_NUMA_H
-#define _XEN_NUMA_H
+#ifndef XEN__NUMA_H
+#define XEN__NUMA_H
 
 #include <xen/mm-frame.h>
 
@@ -135,4 +135,4 @@ static inline nodeid_t mfn_to_nid(mfn_t mfn)
 
 #define page_to_nid(pg) mfn_to_nid(page_to_mfn(pg))
 
-#endif /* _XEN_NUMA_H */
+#endif /* XEN__NUMA_H */
diff --git a/xen/include/xen/p2m-common.h b/xen/include/xen/p2m-common.h
index a322e738ef..7cee4c92f2 100644
--- a/xen/include/xen/p2m-common.h
+++ b/xen/include/xen/p2m-common.h
@@ -1,5 +1,5 @@
-#ifndef _XEN_P2M_COMMON_H
-#define _XEN_P2M_COMMON_H
+#ifndef XEN__P2M_COMMON_H
+#define XEN__P2M_COMMON_H
 
 #include <xen/mm-frame.h>
 
@@ -41,4 +41,4 @@ int __must_check check_get_page_from_gfn(struct domain *d, gfn_t gfn,
                                          struct page_info **page_p);
 
 
-#endif /* _XEN_P2M_COMMON_H */
+#endif /* XEN__P2M_COMMON_H */
diff --git a/xen/include/xen/page-defs.h b/xen/include/xen/page-defs.h
index 682da6b7b4..c06f247921 100644
--- a/xen/include/xen/page-defs.h
+++ b/xen/include/xen/page-defs.h
@@ -1,5 +1,5 @@
-#ifndef __XEN_PAGE_DEFS_H__
-#define __XEN_PAGE_DEFS_H__
+#ifndef XEN__PAGE_DEFS_H
+#define XEN__PAGE_DEFS_H
 
 /* Helpers for different page granularities. */
 #define PAGE_SIZE_GRAN(gran)        ((paddr_t)1 << PAGE_SHIFT_##gran)
@@ -32,4 +32,4 @@
 #define PAGE_MASK_1G                PAGE_MASK_GRAN(1G)
 #define PAGE_ALIGN_1G(addr)         PAGE_ALIGN_GRAN(1G, addr)
 
-#endif /* __XEN_PAGE_DEFS_H__ */
+#endif /* XEN__PAGE_DEFS_H */
diff --git a/xen/include/xen/page-size.h b/xen/include/xen/page-size.h
index 78ea57f324..b2a346e6b1 100644
--- a/xen/include/xen/page-size.h
+++ b/xen/include/xen/page-size.h
@@ -1,5 +1,5 @@
-#ifndef __XEN_PAGE_SIZE_H__
-#define __XEN_PAGE_SIZE_H__
+#ifndef XEN__PAGE_SIZE_H
+#define XEN__PAGE_SIZE_H
 
 #include <xen/const.h>
 #include <asm/page-bits.h>
diff --git a/xen/include/xen/paging.h b/xen/include/xen/paging.h
index a126c9bf58..08580a4c73 100644
--- a/xen/include/xen/paging.h
+++ b/xen/include/xen/paging.h
@@ -1,7 +1,7 @@
-#ifndef __XEN_PAGING_H__
-#define __XEN_PAGING_H__
+#ifndef XEN__PAGING_H
+#define XEN__PAGING_H
 
 #include <asm/paging.h>
 #include <asm/p2m.h>
 
-#endif /* __XEN_PAGING_H__ */
+#endif /* XEN__PAGING_H */
diff --git a/xen/include/xen/param.h b/xen/include/xen/param.h
index 1bdbab34ab..970af8d779 100644
--- a/xen/include/xen/param.h
+++ b/xen/include/xen/param.h
@@ -1,5 +1,5 @@
-#ifndef _XEN_PARAM_H
-#define _XEN_PARAM_H
+#ifndef XEN__PARAM_H
+#define XEN__PARAM_H
 
 #include <xen/bug.h>
 #include <xen/hypfs.h>
@@ -196,4 +196,4 @@ static inline void no_config_param(const char *cfg, const char *param,
            cfg, param, len, s);
 }
 
-#endif /* _XEN_PARAM_H */
+#endif /* XEN__PARAM_H */
diff --git a/xen/include/xen/pci.h b/xen/include/xen/pci.h
index 63e49f0117..b8c6727d1b 100644
--- a/xen/include/xen/pci.h
+++ b/xen/include/xen/pci.h
@@ -4,8 +4,8 @@
  * PCI access functions.
  */
 
-#ifndef __XEN_PCI_H__
-#define __XEN_PCI_H__
+#ifndef XEN__PCI_H
+#define XEN__PCI_H
 
 #include <xen/types.h>
 #include <xen/list.h>
@@ -261,4 +261,4 @@ static inline int arch_pci_clean_pirqs(struct domain *d)
 }
 #endif /* CONFIG_HVM */
 
-#endif /* __XEN_PCI_H__ */
+#endif /* XEN__PCI_H */
diff --git a/xen/include/xen/pci_regs.h b/xen/include/xen/pci_regs.h
index 250ba106db..8a8f8e4b8e 100644
--- a/xen/include/xen/pci_regs.h
+++ b/xen/include/xen/pci_regs.h
@@ -19,8 +19,8 @@
  *	The Hypertransport I/O Link Specification
  */
 
-#ifndef LINUX_PCI_REGS_H
-#define LINUX_PCI_REGS_H
+#ifndef XEN__PCI_REGS_H
+#define XEN__PCI_REGS_H
 
 /*
  * Conventional PCI and PCI-X Mode 1 devices have 256 bytes of
@@ -616,4 +616,4 @@
 #define  PCI_SRIOV_VFM_MO	0x2	/* Active.MigrateOut */
 #define  PCI_SRIOV_VFM_AV	0x3	/* Active.Available */
 
-#endif /* LINUX_PCI_REGS_H */
+#endif /* XEN__PCI_REGS_H */
diff --git a/xen/include/xen/pdx.h b/xen/include/xen/pdx.h
index 23f3956db8..04a31e0629 100644
--- a/xen/include/xen/pdx.h
+++ b/xen/include/xen/pdx.h
@@ -1,5 +1,5 @@
-#ifndef __XEN_PDX_H__
-#define __XEN_PDX_H__
+#ifndef XEN__PDX_H
+#define XEN__PDX_H
 
 /*
  * PDX (Page inDeX)
@@ -239,7 +239,7 @@ static inline void pfn_pdx_hole_setup(unsigned long mask)
 }
 
 #endif /* CONFIG_PDX_COMPRESSION */
-#endif /* __XEN_PDX_H__ */
+#endif /* XEN__PDX_H */
 
 /*
  * Local variables:
diff --git a/xen/include/xen/percpu.h b/xen/include/xen/percpu.h
index 57522f346b..2cc1ed4a3a 100644
--- a/xen/include/xen/percpu.h
+++ b/xen/include/xen/percpu.h
@@ -1,5 +1,5 @@
-#ifndef __XEN_PERCPU_H__
-#define __XEN_PERCPU_H__
+#ifndef XEN__PERCPU_H
+#define XEN__PERCPU_H
 
 #define DECLARE_PER_CPU(type, name) \
     extern __typeof__(type) per_cpu__ ## name
@@ -33,4 +33,4 @@
 #define get_cpu_var(var) this_cpu(var)
 #define put_cpu_var(var)
 
-#endif /* __XEN_PERCPU_H__ */
+#endif /* XEN__PERCPU_H */
diff --git a/xen/include/xen/perfc.h b/xen/include/xen/perfc.h
index f9009dc388..85fa4d8397 100644
--- a/xen/include/xen/perfc.h
+++ b/xen/include/xen/perfc.h
@@ -1,5 +1,5 @@
-#ifndef __XEN_PERFC_H__
-#define __XEN_PERFC_H__
+#ifndef XEN__PERFC_H
+#define XEN__PERFC_H
 
 #ifdef CONFIG_PERF_COUNTERS
 
@@ -116,4 +116,4 @@ extern void cf_check perfc_reset(unsigned char key);
 
 #endif /* CONFIG_PERF_COUNTERS */
 
-#endif /* __XEN_PERFC_H__ */
+#endif /* XEN__PERFC_H */
diff --git a/xen/include/xen/perfc_defn.h b/xen/include/xen/perfc_defn.h
index 0027d95a60..38865b614e 100644
--- a/xen/include/xen/perfc_defn.h
+++ b/xen/include/xen/perfc_defn.h
@@ -1,6 +1,6 @@
 /* This file is legitimately included multiple times. */
-/*#ifndef __XEN_PERFC_DEFN_H__*/
-/*#define __XEN_PERFC_DEFN_H__*/
+/*#ifndef XEN__PERFC_DEFN_H*/
+/*#define XEN__PERFC_DEFN_H*/
 
 #include <asm/perfc_defn.h>
 
@@ -83,4 +83,4 @@ PERFCOUNTER(tickled_cpu_overridden, "csched2: tickled_cpu_overridden")
 
 PERFCOUNTER(need_flush_tlb_flush,   "PG_need_flush tlb flushes")
 
-/*#endif*/ /* __XEN_PERFC_DEFN_H__ */
+/*#endif*/ /* XEN__PERFC_DEFN_H */
diff --git a/xen/include/xen/pfn.h b/xen/include/xen/pfn.h
index 1ca9b095e0..14fe4c8864 100644
--- a/xen/include/xen/pfn.h
+++ b/xen/include/xen/pfn.h
@@ -1,5 +1,5 @@
-#ifndef __XEN_PFN_H__
-#define __XEN_PFN_H__
+#ifndef XEN__PFN_H
+#define XEN__PFN_H
 
 #include <xen/page-size.h>
 
@@ -9,4 +9,4 @@
 #define round_pgup(p)    (((p) + (PAGE_SIZE - 1)) & PAGE_MASK)
 #define round_pgdown(p)  ((p) & PAGE_MASK)
 
-#endif /* __XEN_PFN_H__ */
+#endif /* XEN__PFN_H */
diff --git a/xen/include/xen/pmap.h b/xen/include/xen/pmap.h
index 93e61b1087..7da30c1240 100644
--- a/xen/include/xen/pmap.h
+++ b/xen/include/xen/pmap.h
@@ -1,5 +1,5 @@
-#ifndef __XEN_PMAP_H__
-#define __XEN_PMAP_H__
+#ifndef XEN__PMAP_H
+#define XEN__PMAP_H
 
 /* Large enough for mapping 5 levels of page tables with some headroom */
 #define NUM_FIX_PMAP 8
@@ -13,4 +13,4 @@ void pmap_unmap(const void *p);
 
 #endif /* __ASSEMBLY__ */
 
-#endif /* __XEN_PMAP_H__ */
+#endif /* XEN__PMAP_H */
diff --git a/xen/include/xen/pmstat.h b/xen/include/xen/pmstat.h
index e6ab1423a9..38837ed8e3 100644
--- a/xen/include/xen/pmstat.h
+++ b/xen/include/xen/pmstat.h
@@ -1,5 +1,5 @@
-#ifndef __XEN_PMSTAT_H_
-#define __XEN_PMSTAT_H_
+#ifndef XEN__PMSTAT_H
+#define XEN__PMSTAT_H
 
 #include <xen/types.h>
 #include <public/platform.h> /* for struct xen_processor_power */
@@ -14,4 +14,4 @@ int pmstat_reset_cx_stat(unsigned int cpu);
 int do_get_pm_info(struct xen_sysctl_get_pmstat *op);
 int do_pm_op(struct xen_sysctl_pm_op *op);
 
-#endif /* __XEN_PMSTAT_H_ */
+#endif /* XEN__PMSTAT_H */
diff --git a/xen/include/xen/preempt.h b/xen/include/xen/preempt.h
index aa059b497b..c1a41ba330 100644
--- a/xen/include/xen/preempt.h
+++ b/xen/include/xen/preempt.h
@@ -6,8 +6,8 @@
  * Copyright (c) 2010, Keir Fraser <keir@xen.org>
  */
 
-#ifndef __XEN_PREEMPT_H__
-#define __XEN_PREEMPT_H__
+#ifndef XEN__PREEMPT_H
+#define XEN__PREEMPT_H
 
 #include <xen/types.h>
 #include <xen/percpu.h>
@@ -34,4 +34,4 @@ void ASSERT_NOT_IN_ATOMIC(void);
 #define ASSERT_NOT_IN_ATOMIC() ((void)0)
 #endif
 
-#endif /* __XEN_PREEMPT_H__ */
+#endif /* XEN__PREEMPT_H */
diff --git a/xen/include/xen/prefetch.h b/xen/include/xen/prefetch.h
index 85831f953f..70f4780285 100644
--- a/xen/include/xen/prefetch.h
+++ b/xen/include/xen/prefetch.h
@@ -7,8 +7,8 @@
  *
  */
 
-#ifndef _LINUX_PREFETCH_H
-#define _LINUX_PREFETCH_H
+#ifndef XEN__PREFETCH_H
+#define XEN__PREFETCH_H
 
 #include <asm/processor.h>
 #include <asm/cache.h>
diff --git a/xen/include/xen/pv_console.h b/xen/include/xen/pv_console.h
index 2133aa71cb..5c984dd543 100644
--- a/xen/include/xen/pv_console.h
+++ b/xen/include/xen/pv_console.h
@@ -1,5 +1,5 @@
-#ifndef __XEN_PV_CONSOLE_H__
-#define __XEN_PV_CONSOLE_H__
+#ifndef XEN__PV_CONSOLE_H
+#define XEN__PV_CONSOLE_H
 
 #include <xen/serial.h>
 
@@ -21,7 +21,7 @@ static inline void pv_console_puts(const char *buf, size_t nr) { }
 static inline size_t pv_console_rx(void) { return 0; }
 
 #endif /* !CONFIG_XEN_GUEST */
-#endif /* __XEN_PV_CONSOLE_H__ */
+#endif /* XEN__PV_CONSOLE_H */
 /*
  * Local variables:
  * mode: C
diff --git a/xen/include/xen/radix-tree.h b/xen/include/xen/radix-tree.h
index 58c40312e6..4a3ad62702 100644
--- a/xen/include/xen/radix-tree.h
+++ b/xen/include/xen/radix-tree.h
@@ -16,8 +16,8 @@
  * You should have received a copy of the GNU General Public License
  * along with this program; If not, see <http://www.gnu.org/licenses/>.
  */
-#ifndef _XEN_RADIX_TREE_H
-#define _XEN_RADIX_TREE_H
+#ifndef XEN__RADIX_TREE_H
+#define XEN__RADIX_TREE_H
 
 #include <xen/types.h>
 #include <xen/lib.h>
@@ -224,4 +224,4 @@ unsigned long radix_tree_next_hole(struct radix_tree_root *root,
 unsigned long radix_tree_prev_hole(struct radix_tree_root *root,
 				unsigned long index, unsigned long max_scan);
 
-#endif /* _XEN_RADIX_TREE_H */
+#endif /* XEN__RADIX_TREE_H */
diff --git a/xen/include/xen/random.h b/xen/include/xen/random.h
index b950f03c0c..abb011d654 100644
--- a/xen/include/xen/random.h
+++ b/xen/include/xen/random.h
@@ -1,9 +1,9 @@
-#ifndef __XEN_RANDOM_H__
-#define __XEN_RANDOM_H__
+#ifndef XEN__RANDOM_H
+#define XEN__RANDOM_H
 
 unsigned int get_random(void);
 
 /* The value keeps unchange once initialized for each booting */
 extern unsigned int boot_random;
 
-#endif /* __XEN_RANDOM_H__ */
+#endif /* XEN__RANDOM_H */
diff --git a/xen/include/xen/rangeset.h b/xen/include/xen/rangeset.h
index 96c9180825..36bc2055a9 100644
--- a/xen/include/xen/rangeset.h
+++ b/xen/include/xen/rangeset.h
@@ -7,8 +7,8 @@
  * Copyright (c) 2005, K A Fraser
  */
 
-#ifndef __XEN_RANGESET_H__
-#define __XEN_RANGESET_H__
+#ifndef XEN__RANGESET_H
+#define XEN__RANGESET_H
 
 #include <xen/types.h>
 
@@ -100,7 +100,7 @@ void rangeset_swap(struct rangeset *a, struct rangeset *b);
 void rangeset_domain_printk(
     struct domain *d);
 
-#endif /* __XEN_RANGESET_H__ */
+#endif /* XEN__RANGESET_H */
 
 /*
  * Local variables:
diff --git a/xen/include/xen/rbtree.h b/xen/include/xen/rbtree.h
index 77bf57d4ab..a8c5215e06 100644
--- a/xen/include/xen/rbtree.h
+++ b/xen/include/xen/rbtree.h
@@ -90,8 +90,8 @@ static inline struct page * rb_insert_page_cache(struct inode * inode,
 -----------------------------------------------------------------------
 */
 
-#ifndef __RBTREE_H__
-#define __RBTREE_H__
+#ifndef XEN__RBTREE_H
+#define XEN__RBTREE_H
 
 struct rb_node {
 	unsigned long  __rb_parent_color;
@@ -139,4 +139,4 @@ static inline void rb_link_node(struct rb_node * node, struct rb_node * parent,
 	*rb_link = node;
 }
 
-#endif /* __RBTREE_H__ */
+#endif /* XEN__RBTREE_H */
diff --git a/xen/include/xen/rcupdate.h b/xen/include/xen/rcupdate.h
index 95f4ad81c4..5e0a8328ee 100644
--- a/xen/include/xen/rcupdate.h
+++ b/xen/include/xen/rcupdate.h
@@ -28,8 +28,8 @@
  * http://lse.sourceforge.net/locking/rcupdate.html
  */
 
-#ifndef __XEN_RCUPDATE_H
-#define __XEN_RCUPDATE_H
+#ifndef XEN__RCUPDATE_H
+#define XEN__RCUPDATE_H
 
 #include <xen/compiler.h>
 #include <xen/spinlock.h>
@@ -179,4 +179,4 @@ void rcu_barrier(void);
 void rcu_idle_enter(unsigned int cpu);
 void rcu_idle_exit(unsigned int cpu);
 
-#endif /* __XEN_RCUPDATE_H */
+#endif /* XEN__RCUPDATE_H */
diff --git a/xen/include/xen/rwlock.h b/xen/include/xen/rwlock.h
index 4e78028218..129bba2a78 100644
--- a/xen/include/xen/rwlock.h
+++ b/xen/include/xen/rwlock.h
@@ -1,5 +1,5 @@
-#ifndef __RWLOCK_H__
-#define __RWLOCK_H__
+#ifndef XEN__RWLOCK_H
+#define XEN__RWLOCK_H
 
 #include <xen/percpu.h>
 #include <xen/preempt.h>
@@ -455,4 +455,4 @@ static inline void _percpu_write_unlock(percpu_rwlock_t **per_cpudata,
 #define DECLARE_PERCPU_RWLOCK_GLOBAL(name) DECLARE_PER_CPU(percpu_rwlock_t *, \
                                                            name)
 
-#endif /* __RWLOCK_H__ */
+#endif /* XEN__RWLOCK_H */
diff --git a/xen/include/xen/sched.h b/xen/include/xen/sched.h
index 90666576c2..968ec5f8db 100644
--- a/xen/include/xen/sched.h
+++ b/xen/include/xen/sched.h
@@ -1,6 +1,6 @@
 
-#ifndef __SCHED_H__
-#define __SCHED_H__
+#ifndef XEN__SCHED_H
+#define XEN__SCHED_H
 
 #include <xen/types.h>
 #include <xen/spinlock.h>
@@ -1276,7 +1276,7 @@ btcpupools_get_domain_pool_id(const struct dt_device_node *node)
 
 #endif
 
-#endif /* __SCHED_H__ */
+#endif /* XEN__SCHED_H */
 
 /*
  * Local variables:
diff --git a/xen/include/xen/sections.h b/xen/include/xen/sections.h
index f2fac8d7fa..fbba123325 100644
--- a/xen/include/xen/sections.h
+++ b/xen/include/xen/sections.h
@@ -1,7 +1,7 @@
 /* SPDX-License-Identifier: GPL-2.0-only */
 
-#ifndef __XEN_SECTIONS_H__
-#define __XEN_SECTIONS_H__
+#ifndef XEN__SECTIONS_H
+#define XEN__SECTIONS_H
 
 #include <xen/compiler.h>
 
@@ -27,7 +27,7 @@ extern char __init_begin[], __init_end[];
  */
 #define __ro_after_init __section(".data.ro_after_init")
 
-#endif /* !__XEN_SECTIONS_H__ */
+#endif /* !XEN__SECTIONS_H */
 /*
  * Local variables:
  * mode: C
diff --git a/xen/include/xen/self-tests.h b/xen/include/xen/self-tests.h
index bd8a4867aa..149b48b804 100644
--- a/xen/include/xen/self-tests.h
+++ b/xen/include/xen/self-tests.h
@@ -4,8 +4,8 @@
  * Helpers for Xen self-tests of basic logic, including confirming that
  * examples which should be calculated by the compiler are.
  */
-#ifndef XEN_SELF_TESTS_H
-#define XEN_SELF_TESTS_H
+#ifndef XEN__SELF_TESTS_H
+#define XEN__SELF_TESTS_H
 
 #include <xen/lib.h>
 
@@ -59,4 +59,4 @@
         RUNTIME_CHECK(fn, val, res);            \
     } while ( 0 )
 
-#endif /* XEN_SELF_TESTS_H */
+#endif /* XEN__SELF_TESTS_H */
diff --git a/xen/include/xen/serial.h b/xen/include/xen/serial.h
index 3d21207a3d..1799c199ca 100644
--- a/xen/include/xen/serial.h
+++ b/xen/include/xen/serial.h
@@ -6,8 +6,8 @@
  * Copyright (c) 2003-2008, K A Fraser
  */
 
-#ifndef __XEN_SERIAL_H__
-#define __XEN_SERIAL_H__
+#ifndef XEN__SERIAL_H
+#define XEN__SERIAL_H
 
 #include <xen/init.h>
 #include <xen/spinlock.h>
@@ -174,7 +174,7 @@ int dbgp_op(const struct physdev_dbgp_op *op);
 /* Baud rate was pre-configured before invoking the UART driver. */
 #define BAUD_AUTO (-1)
 
-#endif /* __XEN_SERIAL_H__ */
+#endif /* XEN__SERIAL_H */
 
 /*
  * Local variables:
diff --git a/xen/include/xen/shared.h b/xen/include/xen/shared.h
index 5b71342cab..31e1cca8c8 100644
--- a/xen/include/xen/shared.h
+++ b/xen/include/xen/shared.h
@@ -1,5 +1,5 @@
-#ifndef __XEN_SHARED_H__
-#define __XEN_SHARED_H__
+#ifndef XEN__SHARED_H
+#define XEN__SHARED_H
 
 #ifdef CONFIG_COMPAT
 
@@ -47,4 +47,4 @@ extern vcpu_info_t dummy_vcpu_info;
 #define vcpu_info(v, field)        \
         __vcpu_info(v, (vcpu_info_t *)(v)->vcpu_info_area.map, field)
 
-#endif /* __XEN_SHARED_H__ */
+#endif /* XEN__SHARED_H */
diff --git a/xen/include/xen/shutdown.h b/xen/include/xen/shutdown.h
index c7fa23aec1..9197b56d5f 100644
--- a/xen/include/xen/shutdown.h
+++ b/xen/include/xen/shutdown.h
@@ -1,5 +1,5 @@
-#ifndef __XEN_SHUTDOWN_H__
-#define __XEN_SHUTDOWN_H__
+#ifndef XEN__SHUTDOWN_H
+#define XEN__SHUTDOWN_H
 
 #include <xen/compiler.h>
 #include <xen/types.h>
@@ -12,4 +12,4 @@ void noreturn hwdom_shutdown(unsigned char reason);
 void noreturn machine_restart(unsigned int delay_millisecs);
 void noreturn machine_halt(void);
 
-#endif /* __XEN_SHUTDOWN_H__ */
+#endif /* XEN__SHUTDOWN_H */
diff --git a/xen/include/xen/sizes.h b/xen/include/xen/sizes.h
index f7b728ddab..16c1009fc2 100644
--- a/xen/include/xen/sizes.h
+++ b/xen/include/xen/sizes.h
@@ -1,5 +1,5 @@
-#ifndef __XEN_SIZES_H__
-#define __XEN_SIZES_H__
+#ifndef XEN__SIZES_H
+#define XEN__SIZES_H
 
 /*
  * Taken from kernel code include/linux/size.h
@@ -45,4 +45,4 @@
 #define SZ_1G                           0x40000000
 #define SZ_2G                           0x80000000
 
-#endif /* __XEN_SIZES_H__ */
+#endif /* XEN__SIZES_H */
diff --git a/xen/include/xen/smp.h b/xen/include/xen/smp.h
index 2ca9ff1bfc..faffb49704 100644
--- a/xen/include/xen/smp.h
+++ b/xen/include/xen/smp.h
@@ -1,5 +1,5 @@
-#ifndef __XEN_SMP_H__
-#define __XEN_SMP_H__
+#ifndef XEN__SMP_H
+#define XEN__SMP_H
 
 #include <asm/smp.h>
 
@@ -76,4 +76,4 @@ extern void *stack_base[NR_CPUS];
 void initialize_cpu_data(unsigned int cpu);
 int setup_cpu_root_pgt(unsigned int cpu);
 
-#endif /* __XEN_SMP_H__ */
+#endif /* XEN__SMP_H */
diff --git a/xen/include/xen/softirq.h b/xen/include/xen/softirq.h
index 33d6f2ecd2..6cceb109fa 100644
--- a/xen/include/xen/softirq.h
+++ b/xen/include/xen/softirq.h
@@ -1,5 +1,5 @@
-#if !defined(__XEN_SOFTIRQ_H__) && !defined(__ASSEMBLY__)
-#define __XEN_SOFTIRQ_H__
+#if !defined(XEN__SOFTIRQ_H) && !defined(__ASSEMBLY__)
+#define XEN__SOFTIRQ_H
 
 /* Low-latency softirqs come first in the following list. */
 enum {
@@ -40,4 +40,4 @@ void cpu_raise_softirq_batch_finish(void);
  */
 void process_pending_softirqs(void);
 
-#endif /* __XEN_SOFTIRQ_H__ */
+#endif /* XEN__SOFTIRQ_H */
diff --git a/xen/include/xen/sort.h b/xen/include/xen/sort.h
index b953286284..110a54637b 100644
--- a/xen/include/xen/sort.h
+++ b/xen/include/xen/sort.h
@@ -1,5 +1,5 @@
-#ifndef __XEN_SORT_H__
-#define __XEN_SORT_H__
+#ifndef XEN__SORT_H
+#define XEN__SORT_H
 
 #include <xen/types.h>
 
@@ -60,4 +60,4 @@ void sort(void *base, size_t num, size_t size,
     }
 }
 
-#endif /* __XEN_SORT_H__ */
+#endif /* XEN__SORT_H */
diff --git a/xen/include/xen/spinlock.h b/xen/include/xen/spinlock.h
index 8825affb25..b84ac4d347 100644
--- a/xen/include/xen/spinlock.h
+++ b/xen/include/xen/spinlock.h
@@ -1,5 +1,5 @@
-#ifndef __SPINLOCK_H__
-#define __SPINLOCK_H__
+#ifndef XEN__SPINLOCK_H
+#define XEN__SPINLOCK_H
 
 #include <xen/nospec.h>
 #include <xen/time.h>
@@ -358,4 +358,4 @@ static always_inline void nrspin_lock_irq(rspinlock_t *l)
 #define nrspin_unlock_irqrestore(l, f) _nrspin_unlock_irqrestore(l, f)
 #define nrspin_unlock_irq(l)           _nrspin_unlock_irq(l)
 
-#endif /* __SPINLOCK_H__ */
+#endif /* XEN__SPINLOCK_H */
diff --git a/xen/include/xen/stdarg.h b/xen/include/xen/stdarg.h
index 29249a11a7..ec1f1d8378 100644
--- a/xen/include/xen/stdarg.h
+++ b/xen/include/xen/stdarg.h
@@ -1,5 +1,5 @@
-#ifndef __XEN_STDARG_H__
-#define __XEN_STDARG_H__
+#ifndef XEN__STDARG_H
+#define XEN__STDARG_H
 
 typedef __builtin_va_list va_list;
 #define va_copy(dest, src)    __builtin_va_copy((dest), (src))
@@ -7,4 +7,4 @@ typedef __builtin_va_list va_list;
 #define va_end(ap)            __builtin_va_end(ap)
 #define va_arg                __builtin_va_arg
 
-#endif /* __XEN_STDARG_H__ */
+#endif /* XEN__STDARG_H */
diff --git a/xen/include/xen/stdbool.h b/xen/include/xen/stdbool.h
index b0947a62b5..99f25d64f6 100644
--- a/xen/include/xen/stdbool.h
+++ b/xen/include/xen/stdbool.h
@@ -1,9 +1,9 @@
-#ifndef __XEN_STDBOOL_H__
-#define __XEN_STDBOOL_H__
+#ifndef XEN__STDBOOL_H
+#define XEN__STDBOOL_H
 
 #define bool _Bool
 #define true 1
 #define false 0
 #define __bool_true_false_are_defined   1
 
-#endif /* __XEN_STDBOOL_H__ */
+#endif /* XEN__STDBOOL_H */
diff --git a/xen/include/xen/stdint.h b/xen/include/xen/stdint.h
index a40165c6ae..1e4319fd0f 100644
--- a/xen/include/xen/stdint.h
+++ b/xen/include/xen/stdint.h
@@ -1,6 +1,6 @@
 /* SPDX-License-Identifier: GPL-2.0-only */
-#ifndef __XEN_STDINT_H__
-#define __XEN_STDINT_H__
+#ifndef XEN__STDINT_H
+#define XEN__STDINT_H
 
 #ifndef __INT8_TYPE__ /* GCC <= 4.4 */
 
@@ -30,4 +30,4 @@ typedef __UINT64_TYPE__    uint64_t;
 
 #endif
 
-#endif /* __XEN_STDINT_H__ */
+#endif /* XEN__STDINT_H */
diff --git a/xen/include/xen/stop_machine.h b/xen/include/xen/stop_machine.h
index 0bbf71f112..7a3f22affc 100644
--- a/xen/include/xen/stop_machine.h
+++ b/xen/include/xen/stop_machine.h
@@ -1,5 +1,5 @@
-#ifndef __XEN_STOP_MACHINE_H__
-#define __XEN_STOP_MACHINE_H__
+#ifndef XEN__STOP_MACHINE_H
+#define XEN__STOP_MACHINE_H
 
 /**
  * stop_machine_run: freeze the machine on all CPUs and run this function
@@ -16,4 +16,4 @@
  * grabbing every spinlock in the kernel. */
 int stop_machine_run(int (*fn)(void *data), void *data, unsigned int cpu);
 
-#endif /* __XEN_STOP_MACHINE_H__ */
+#endif /* XEN__STOP_MACHINE_H */
diff --git a/xen/include/xen/string.h b/xen/include/xen/string.h
index bd4a8f48e9..0d7383ef9a 100644
--- a/xen/include/xen/string.h
+++ b/xen/include/xen/string.h
@@ -1,5 +1,5 @@
-#ifndef __XEN_STRING_H__
-#define __XEN_STRING_H__
+#ifndef XEN__STRING_H
+#define XEN__STRING_H
 
 #include <xen/types.h>	/* for size_t */
 
@@ -100,7 +100,7 @@ void *memchr_inv(const void *s, int c, size_t n);
     (strlcat(d, s, sizeof(d)) >= sizeof(d));    \
 })
 
-#endif /* __XEN_STRING_H__ */
+#endif /* XEN__STRING_H */
 /*
  * Local variables:
  * mode: C
diff --git a/xen/include/xen/stringify.h b/xen/include/xen/stringify.h
index 36808e0969..be4a979885 100644
--- a/xen/include/xen/stringify.h
+++ b/xen/include/xen/stringify.h
@@ -1,5 +1,5 @@
-#ifndef __XEN_STRINGIFY_H
-#define __XEN_STRINGIFY_H
+#ifndef XEN__STRINGIFY_H
+#define XEN__STRINGIFY_H
 
 /* Indirect stringification.  Doing two levels allows the parameter to be a
  * macro itself.  For example, compile with -DFOO=bar, __stringify(FOO)
@@ -9,4 +9,4 @@
 #define __stringify_1(x...) #x
 #define __stringify(x...)   __stringify_1(x)
 
-#endif /* !__XEN_STRINGIFY_H */
+#endif /* !XEN__STRINGIFY_H */
diff --git a/xen/include/xen/symbols.h b/xen/include/xen/symbols.h
index 20bbb28ef2..d8adc03a07 100644
--- a/xen/include/xen/symbols.h
+++ b/xen/include/xen/symbols.h
@@ -1,5 +1,5 @@
-#ifndef _XEN_SYMBOLS_H
-#define _XEN_SYMBOLS_H
+#ifndef XEN__SYMBOLS_H
+#define XEN__SYMBOLS_H
 
 #include <xen/types.h>
 
@@ -33,4 +33,4 @@ struct symbol_offset {
     uint32_t stream; /* .. in the compressed stream.*/
     uint32_t addr;   /* .. and in the fixed size address array. */
 };
-#endif /*_XEN_SYMBOLS_H*/
+#endif /*XEN__SYMBOLS_H*/
diff --git a/xen/include/xen/tasklet.h b/xen/include/xen/tasklet.h
index 78760b694a..55ff906a31 100644
--- a/xen/include/xen/tasklet.h
+++ b/xen/include/xen/tasklet.h
@@ -7,8 +7,8 @@
  * during per-tasklet initialisation.
  */
 
-#ifndef __XEN_TASKLET_H__
-#define __XEN_TASKLET_H__
+#ifndef XEN__TASKLET_H
+#define XEN__TASKLET_H
 
 #include <xen/types.h>
 #include <xen/list.h>
@@ -64,4 +64,4 @@ void softirq_tasklet_init(struct tasklet *t,
                           void (*func)(void *data), void *data);
 void tasklet_subsys_init(void);
 
-#endif /* __XEN_TASKLET_H__ */
+#endif /* XEN__TASKLET_H */
diff --git a/xen/include/xen/time.h b/xen/include/xen/time.h
index 67c586b736..cf515fcdeb 100644
--- a/xen/include/xen/time.h
+++ b/xen/include/xen/time.h
@@ -5,8 +5,8 @@
  * Copyright (c) 2002-2005 K A Fraser
  */
 
-#ifndef __XEN_TIME_H__
-#define __XEN_TIME_H__
+#ifndef XEN__TIME_H
+#define XEN__TIME_H
 
 #include <xen/types.h>
 #include <public/xen.h>
@@ -77,7 +77,7 @@ void domain_set_time_offset(struct domain *d, int64_t time_offset_seconds);
 
 #include <asm/time.h>
 
-#endif /* __XEN_TIME_H__ */
+#endif /* XEN__TIME_H */
 
 /*
  * Local variables:
diff --git a/xen/include/xen/timer.h b/xen/include/xen/timer.h
index fb28517515..2fa5ba57ab 100644
--- a/xen/include/xen/timer.h
+++ b/xen/include/xen/timer.h
@@ -5,8 +5,8 @@
  * Copyright (c) 2002-2005 K A Fraser
  */
 
-#ifndef _TIMER_H_
-#define _TIMER_H_
+#ifndef XEN__TIMER_H
+#define XEN__TIMER_H
 
 #include <xen/spinlock.h>
 #include <xen/time.h>
@@ -110,7 +110,7 @@ int reprogram_timer(s_time_t timeout);
 /* Calculate the aligned first tick time for a given periodic timer. */
 s_time_t align_timer(s_time_t firsttick, uint64_t period);
 
-#endif /* _TIMER_H_ */
+#endif /* XEN__TIMER_H */
 
 /*
  * Local variables:
diff --git a/xen/include/xen/trace.h b/xen/include/xen/trace.h
index 914cecbc18..4bdbdeffa8 100644
--- a/xen/include/xen/trace.h
+++ b/xen/include/xen/trace.h
@@ -18,8 +18,8 @@
  * trace buffer contents can then be performed using a userland tool.
  */
 
-#ifndef __XEN_TRACE_H__
-#define __XEN_TRACE_H__
+#ifndef XEN__TRACE_H
+#define XEN__TRACE_H
 
 #include <xen/types.h>
 #include <public/sysctl.h>
@@ -91,4 +91,4 @@ static inline void trace_time(
 /* Create a trace record with time included. */
 #define TRACE_TIME(_e, ...) TRACE((_e) | TRC_HD_CYCLE_FLAG, ## __VA_ARGS__)
 
-#endif /* __XEN_TRACE_H__ */
+#endif /* XEN__TRACE_H */
diff --git a/xen/include/xen/types.h b/xen/include/xen/types.h
index 1bcc5a474f..f8ca8a7958 100644
--- a/xen/include/xen/types.h
+++ b/xen/include/xen/types.h
@@ -1,5 +1,5 @@
-#ifndef __TYPES_H__
-#define __TYPES_H__
+#ifndef XEN__TYPES_H
+#define XEN__TYPES_H
 
 #include <xen/stdbool.h>
 #include <xen/stdint.h>
@@ -64,4 +64,4 @@ typedef unsigned int __attribute__((__mode__(__pointer__))) uintptr_t;
 #define test_and_set_bool(b)   xchg(&(b), true)
 #define test_and_clear_bool(b) xchg(&(b), false)
 
-#endif /* __TYPES_H__ */
+#endif /* XEN__TYPES_H */
diff --git a/xen/include/xen/typesafe.h b/xen/include/xen/typesafe.h
index 7ecd3b4a8d..8898278e75 100644
--- a/xen/include/xen/typesafe.h
+++ b/xen/include/xen/typesafe.h
@@ -1,5 +1,5 @@
-#ifndef __XEN_TYPESAFE_H__
-#define __XEN_TYPESAFE_H__
+#ifndef XEN__TYPESAFE_H
+#define XEN__TYPESAFE_H
 
 /*
  * Compiler games to gain type safety between different logical integers.
@@ -33,7 +33,7 @@
 
 #endif
 
-#endif /* __XEN_TYPESAFE_H__ */
+#endif /* XEN__TYPESAFE_H */
 
 /*
  * Local variables:
diff --git a/xen/include/xen/unaligned.h b/xen/include/xen/unaligned.h
index d9bb599e65..d4e35c13e5 100644
--- a/xen/include/xen/unaligned.h
+++ b/xen/include/xen/unaligned.h
@@ -1,6 +1,6 @@
 /* SPDX-License-Identifier: GPL-2.0 */
-#ifndef __XEN_UNALIGNED_H__
-#define __XEN_UNALIGNED_H__
+#ifndef XEN__UNALIGNED_H
+#define XEN__UNALIGNED_H
 
 #ifdef __XEN__
 #include <xen/types.h>
@@ -85,4 +85,4 @@ static inline void put_unaligned_le64(uint64_t val, void *p)
 	put_unaligned_t(__le64, cpu_to_le64(val), p);
 }
 
-#endif /* __XEN_UNALIGNED_H__ */
+#endif /* XEN__UNALIGNED_H */
diff --git a/xen/include/xen/version.h b/xen/include/xen/version.h
index 93c5877363..858469684d 100644
--- a/xen/include/xen/version.h
+++ b/xen/include/xen/version.h
@@ -1,5 +1,5 @@
-#ifndef __XEN_VERSION_H__
-#define __XEN_VERSION_H__
+#ifndef XEN__VERSION_H
+#define XEN__VERSION_H
 
 #include <xen/types.h>
 #include <xen/elfstructs.h>
@@ -27,4 +27,4 @@ int xen_build_id_check(const Elf_Note *n, unsigned int n_sz,
 static inline void xen_build_init(void) {};
 #endif
 
-#endif /* __XEN_VERSION_H__ */
+#endif /* XEN__VERSION_H */
diff --git a/xen/include/xen/vga.h b/xen/include/xen/vga.h
index ceb8a527ed..6f8cd20bd7 100644
--- a/xen/include/xen/vga.h
+++ b/xen/include/xen/vga.h
@@ -6,8 +6,8 @@
  *  for more details.
  */
 
-#ifndef _XEN_VGA_H
-#define _XEN_VGA_H
+#ifndef XEN__VGA_H
+#define XEN__VGA_H
 
 #include <xen/video.h>
 
@@ -21,4 +21,4 @@ void vesa_endboot(bool keep);
 static inline void vesa_init(void) {}
 #endif
 
-#endif /* _XEN_VGA_H */
+#endif /* XEN__VGA_H */
diff --git a/xen/include/xen/video.h b/xen/include/xen/video.h
index 1ee1aa46b1..2db8bbaa2e 100644
--- a/xen/include/xen/video.h
+++ b/xen/include/xen/video.h
@@ -6,8 +6,8 @@
  *  for more details.
  */
 
-#ifndef _XEN_VIDEO_H
-#define _XEN_VIDEO_H
+#ifndef XEN__VIDEO_H
+#define XEN__VIDEO_H
 
 #include <public/xen.h>
 
@@ -21,4 +21,4 @@ static inline void video_puts(const char *str, size_t nr) {}
 #define video_endboot() ((void)0)
 #endif
 
-#endif /* _XEN_VIDEO_H */
+#endif /* XEN__VIDEO_H */
diff --git a/xen/include/xen/virtual_region.h b/xen/include/xen/virtual_region.h
index a18dfb6fb0..860043ab76 100644
--- a/xen/include/xen/virtual_region.h
+++ b/xen/include/xen/virtual_region.h
@@ -3,8 +3,8 @@
  *
  */
 
-#ifndef __XEN_VIRTUAL_REGION_H__
-#define __XEN_VIRTUAL_REGION_H__
+#ifndef XEN__VIRTUAL_REGION_H
+#define XEN__VIRTUAL_REGION_H
 
 #include <xen/list.h>
 #include <xen/symbols.h>
@@ -46,7 +46,7 @@ void unregister_virtual_region(struct virtual_region *r);
 void relax_virtual_region_perms(void);
 void tighten_virtual_region_perms(void);
 
-#endif /* __XEN_VIRTUAL_REGION_H__ */
+#endif /* XEN__VIRTUAL_REGION_H */
 
 /*
  * Local variables:
diff --git a/xen/include/xen/vmap.h b/xen/include/xen/vmap.h
index c1dd7ac22f..c94c4d68f1 100644
--- a/xen/include/xen/vmap.h
+++ b/xen/include/xen/vmap.h
@@ -5,8 +5,8 @@
  * purpose area (VMAP_DEFAULT) and a livepatch-specific area (VMAP_XEN). The
  * latter is used when loading livepatches and the former for everything else.
  */
-#if !defined(__XEN_VMAP_H__) && defined(VMAP_VIRT_START)
-#define __XEN_VMAP_H__
+#if !defined(XEN__VMAP_H) && defined(VMAP_VIRT_START)
+#define XEN__VMAP_H
 
 #include <xen/mm-frame.h>
 #include <xen/page-size.h>
@@ -146,4 +146,4 @@ static inline void vm_init(void)
 #endif
 }
 
-#endif /* __XEN_VMAP_H__ */
+#endif /* XEN__VMAP_H */
diff --git a/xen/include/xen/wait.h b/xen/include/xen/wait.h
index 1c68bc564b..c890d3244d 100644
--- a/xen/include/xen/wait.h
+++ b/xen/include/xen/wait.h
@@ -6,8 +6,8 @@
  * Copyright (c) 2010, Keir Fraser <keir@xen.org>
  */
 
-#ifndef __XEN_WAIT_H__
-#define __XEN_WAIT_H__
+#ifndef XEN__WAIT_H
+#define XEN__WAIT_H
 
 #include <xen/types.h>
 #include <xen/list.h>
@@ -56,4 +56,4 @@ void wait(void);
 void finish_wait(struct waitqueue_head *wq);
 void check_wakeup_from_wait(void);
 
-#endif /* __XEN_WAIT_H__ */
+#endif /* XEN__WAIT_H */
diff --git a/xen/include/xen/warning.h b/xen/include/xen/warning.h
index c0661d5140..eec3850ec1 100644
--- a/xen/include/xen/warning.h
+++ b/xen/include/xen/warning.h
@@ -1,5 +1,5 @@
-#ifndef _WARNING_H_
-#define _WARNING_H_
+#ifndef XEN__WARNING_H
+#define XEN__WARNING_H
 
 void warning_add(const char *warning);
 void warning_print(void);
diff --git a/xen/include/xen/watchdog.h b/xen/include/xen/watchdog.h
index 4c2840bd91..564bc7d8c1 100644
--- a/xen/include/xen/watchdog.h
+++ b/xen/include/xen/watchdog.h
@@ -4,8 +4,8 @@
  * Common watchdog code
  */
 
-#ifndef __XEN_WATCHDOG_H__
-#define __XEN_WATCHDOG_H__
+#ifndef XEN__WATCHDOG_H
+#define XEN__WATCHDOG_H
 
 #include <xen/types.h>
 
@@ -32,4 +32,4 @@ bool watchdog_enabled(void);
 
 #endif
 
-#endif /* __XEN_WATCHDOG_H__ */
+#endif /* XEN__WATCHDOG_H */
diff --git a/xen/include/xen/xen.lds.h b/xen/include/xen/xen.lds.h
index 24b8900ffe..c66b2c4c3b 100644
--- a/xen/include/xen/xen.lds.h
+++ b/xen/include/xen/xen.lds.h
@@ -1,5 +1,5 @@
-#ifndef __XEN_LDS_H__
-#define __XEN_LDS_H__
+#ifndef XEN__XEN_LDS_H
+#define XEN__XEN_LDS_H
 
 /*
  * Common macros to be used in architecture specific linker scripts.
@@ -171,4 +171,4 @@
 #define VPCI_ARRAY
 #endif
 
-#endif /* __XEN_LDS_H__ */
+#endif /* XEN__XEN_LDS_H */
diff --git a/xen/include/xen/xenoprof.h b/xen/include/xen/xenoprof.h
index c3dac447d3..c50221d2a2 100644
--- a/xen/include/xen/xenoprof.h
+++ b/xen/include/xen/xenoprof.h
@@ -7,8 +7,8 @@
  * written by Aravind Menon & Jose Renato Santos
  */
 
-#ifndef __XEN_XENOPROF_H__
-#define __XEN_XENOPROF_H__
+#ifndef XEN__XENOPROF_H
+#define XEN__XENOPROF_H
 
 #define PMU_OWNER_NONE          0
 #define PMU_OWNER_XENOPROF      1
diff --git a/xen/include/xen/xmalloc.h b/xen/include/xen/xmalloc.h
index b903fa2e26..cd230bfde8 100644
--- a/xen/include/xen/xmalloc.h
+++ b/xen/include/xen/xmalloc.h
@@ -1,6 +1,6 @@
 
-#ifndef __XMALLOC_H__
-#define __XMALLOC_H__
+#ifndef XEN__XMALLOC_H
+#define XEN__XMALLOC_H
 
 #include <xen/types.h>
 #include <xen/cache.h>
@@ -171,4 +171,4 @@ unsigned long xmem_pool_get_used_size(struct xmem_pool *pool);
  */
 unsigned long xmem_pool_get_total_size(struct xmem_pool *pool);
 
-#endif /* __XMALLOC_H__ */
+#endif /* XEN__XMALLOC_H */
diff --git a/xen/include/xen/xxhash.h b/xen/include/xen/xxhash.h
index 6f2237cbcf..9ad85c85ce 100644
--- a/xen/include/xen/xxhash.h
+++ b/xen/include/xen/xxhash.h
@@ -72,8 +72,8 @@
  * xxh32        6.8 GB/s            6.0 GB/s
  */
 
-#ifndef __XENXXHASH_H__
-#define __XENXXHASH_H__
+#ifndef XEN__XXHASH_H
+#define XEN__XXHASH_H
 
 #include <xen/types.h>
 
@@ -256,4 +256,4 @@ void xxh32_copy_state(struct xxh32_state *dst, const struct xxh32_state *src);
  */
 void xxh64_copy_state(struct xxh64_state *dst, const struct xxh64_state *src);
 
-#endif /* __XENXXHASH_H__ */
+#endif /* XEN__XXHASH_H */
-- 
2.34.1


