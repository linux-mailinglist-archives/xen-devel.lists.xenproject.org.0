Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 06572664E0D
	for <lists+xen-devel@lfdr.de>; Tue, 10 Jan 2023 22:30:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.474979.736453 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pFMBw-0001od-V5; Tue, 10 Jan 2023 21:29:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 474979.736453; Tue, 10 Jan 2023 21:29:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pFMBw-0001lE-RN; Tue, 10 Jan 2023 21:29:56 +0000
Received: by outflank-mailman (input) for mailman id 474979;
 Tue, 10 Jan 2023 21:29:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=+sVE=5H=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1pFMBu-0001l8-Vl
 for xen-devel@lists.xenproject.org; Tue, 10 Jan 2023 21:29:55 +0000
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [2a00:1450:4864:20::433])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ea9e8b68-912d-11ed-91b6-6bf2151ebd3b;
 Tue, 10 Jan 2023 22:29:51 +0100 (CET)
Received: by mail-wr1-x433.google.com with SMTP id z5so12097913wrt.6
 for <xen-devel@lists.xenproject.org>; Tue, 10 Jan 2023 13:29:51 -0800 (PST)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 m7-20020adffe47000000b002b880b6ef19sm12096616wrs.66.2023.01.10.13.29.48
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 10 Jan 2023 13:29:50 -0800 (PST)
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
X-Inumbo-ID: ea9e8b68-912d-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=W6wbWAaLwPWIlIyedxb4xDOOJaJOFE6u3k4WgWE5z1Q=;
        b=NJZgrJVezNBUk1duCF+KjTkxDbZ0B2oYgQK83ujjYQRz+WNzlUbXFUmU9NDDTsM19M
         goUMPU68xScavEmrKhM2zb28Z0Uwxk8Ks3kUNckShLpzHgDUlR5ymQe1OZjxxTFSGJfy
         0mIRfytO1Hzan3AA8Tb7BY3X2jb4Bn5qRPiuxYu8Q2WvtI4lbPS4ceMTfBPmj03uewwZ
         DDGHmMz6s2PJdA2G8U1VcDFgyfp5CE0R5WzFgg1GOpY1yXdYtJPJVAryA7QY3qB9bevb
         mGS1tIJTmqUB7pSkXaebkhgeUEgr/3nV7vBsCwGWP/6JsZVQNg8uLSUdjUPpO9cHHeoC
         RSng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=W6wbWAaLwPWIlIyedxb4xDOOJaJOFE6u3k4WgWE5z1Q=;
        b=HFwMHq2BXnA3kA/2yCxRKKhIPUVpgTAceYy+CzruVZcZ/2FC0udJmqkW9kb2w6i+Tb
         807kf4nhz7XLIvcsQaoCFx2iBozeEqIWaEF4F1E37XZUvWovBarwZyC69+uescIo8YeJ
         UXq/uvPsIxiSt319Y/DdXKHhD5N/0BFtumqHXIChm2K4cYbYVA1fx6xuuypO6wgm5CNU
         gSR3k3F3nztJQn7GlN6UT+K8hBAdV4lX5cS5VfLHegZ1lVhNDEj4YRcGrAr0tHCxdYrF
         ph14mL2/nCbuCrPhiRZe3AArTofyrHF0tinFN8sdvQXK9UwAdJwTFdhQxk+tOzagJ2qZ
         LZGQ==
X-Gm-Message-State: AFqh2koAvaUySPI0q5uuJlVEVastbdMgvY6JY0RaI75vchY7PGd8I+TI
	hYZcbu/1Ad0fHD2XAFBgXgadhA==
X-Google-Smtp-Source: AMrXdXsUkev5VAsuQo1OfOr+0irzTxLF6bwT0XZWW8EQ21bjlIyp+8HkVhItOJf6wPYBdCkZvWs46A==
X-Received: by 2002:a5d:664e:0:b0:2bc:7ec3:8a8 with SMTP id f14-20020a5d664e000000b002bc7ec308a8mr5077500wrw.44.1673386190595;
        Tue, 10 Jan 2023 13:29:50 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
	qemu-block@nongnu.org,
	qemu-arm@nongnu.org,
	qemu-ppc@nongnu.org,
	Richard Henderson <richard.henderson@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	ale@rev.ng,
	qemu-riscv@nongnu.org,
	xen-devel@lists.xenproject.org,
	Thomas Huth <thuth@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH] bulk: Rename TARGET_FMT_plx -> HWADDR_FMT_plx
Date: Tue, 10 Jan 2023 22:29:47 +0100
Message-Id: <20230110212947.34557-1-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The 'hwaddr' type is defined in "exec/hwaddr.h" as:

    hwaddr is the type of a physical address
   (its size can be different from 'target_ulong').

All definitions use the 'HWADDR_' prefix, except TARGET_FMT_plx:

 $ fgrep define include/exec/hwaddr.h
 #define HWADDR_H
 #define HWADDR_BITS 64
 #define HWADDR_MAX UINT64_MAX
 #define TARGET_FMT_plx "%016" PRIx64
         ^^^^^^
 #define HWADDR_PRId PRId64
 #define HWADDR_PRIi PRIi64
 #define HWADDR_PRIo PRIo64
 #define HWADDR_PRIu PRIu64
 #define HWADDR_PRIx PRIx64
 #define HWADDR_PRIX PRIX64

Since hwaddr's size can be *different* from target_ulong, it is
very confusing to read one of its format using the 'TARGET_FMT_'
prefix, normally used for the target_long / target_ulong types:

$ fgrep TARGET_FMT_ include/exec/cpu-defs.h
 #define TARGET_FMT_lx "%08x"
 #define TARGET_FMT_ld "%d"
 #define TARGET_FMT_lu "%u"
 #define TARGET_FMT_lx "%016" PRIx64
 #define TARGET_FMT_ld "%" PRId64
 #define TARGET_FMT_lu "%" PRIu64

Apparently this format was missed during commit a8170e5e97
("Rename target_phys_addr_t to hwaddr"), so complete it by
doing a bulk-rename with:

 $ sed -i -e s/TARGET_FMT_plx/HWADDR_FMT_plx/g $(git grep -l TARGET_FMT_plx)

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 accel/tcg/cputlb.c                  |  2 +-
 hw/arm/strongarm.c                  | 24 ++++++++++++------------
 hw/block/pflash_cfi01.c             |  2 +-
 hw/char/digic-uart.c                |  4 ++--
 hw/char/etraxfs_ser.c               |  4 ++--
 hw/core/loader.c                    |  8 ++++----
 hw/core/sysbus.c                    |  4 ++--
 hw/display/cirrus_vga.c             |  4 ++--
 hw/display/g364fb.c                 |  4 ++--
 hw/display/vga.c                    |  8 ++++----
 hw/dma/etraxfs_dma.c                | 14 +++++++-------
 hw/dma/pl330.c                      | 14 +++++++-------
 hw/dma/xilinx_axidma.c              |  4 ++--
 hw/dma/xlnx_csu_dma.c               |  4 ++--
 hw/i2c/mpc_i2c.c                    |  4 ++--
 hw/i386/multiboot.c                 |  8 ++++----
 hw/i386/xen/xen-hvm.c               |  8 ++++----
 hw/i386/xen/xen-mapcache.c          | 16 ++++++++--------
 hw/i386/xen/xen_platform.c          |  4 ++--
 hw/intc/arm_gicv3_dist.c            |  8 ++++----
 hw/intc/arm_gicv3_its.c             | 14 +++++++-------
 hw/intc/arm_gicv3_redist.c          |  8 ++++----
 hw/intc/exynos4210_combiner.c       | 10 +++++-----
 hw/misc/auxbus.c                    |  2 +-
 hw/misc/ivshmem.c                   |  6 +++---
 hw/misc/macio/mac_dbdma.c           |  4 ++--
 hw/misc/mst_fpga.c                  |  4 ++--
 hw/net/allwinner-sun8i-emac.c       |  4 ++--
 hw/net/allwinner_emac.c             |  4 ++--
 hw/net/fsl_etsec/etsec.c            |  4 ++--
 hw/net/fsl_etsec/rings.c            |  4 ++--
 hw/net/pcnet.c                      |  4 ++--
 hw/net/rocker/rocker.c              | 26 +++++++++++++-------------
 hw/net/rocker/rocker_desc.c         |  2 +-
 hw/net/xilinx_axienet.c             |  4 ++--
 hw/net/xilinx_ethlite.c             |  6 +++---
 hw/pci-bridge/pci_expander_bridge.c |  2 +-
 hw/pci-host/bonito.c                | 14 +++++++-------
 hw/pci-host/ppce500.c               |  4 ++--
 hw/pci/pci_host.c                   |  4 ++--
 hw/ppc/ppc4xx_sdram.c               |  2 +-
 hw/rtc/exynos4210_rtc.c             |  4 ++--
 hw/sh4/sh7750.c                     |  4 ++--
 hw/ssi/xilinx_spi.c                 |  4 ++--
 hw/ssi/xilinx_spips.c               |  8 ++++----
 hw/timer/digic-timer.c              |  4 ++--
 hw/timer/etraxfs_timer.c            |  2 +-
 hw/timer/exynos4210_mct.c           |  2 +-
 hw/timer/exynos4210_pwm.c           |  4 ++--
 hw/virtio/virtio-mmio.c             |  4 ++--
 hw/xen/xen_pt.c                     |  4 ++--
 include/exec/hwaddr.h               |  2 +-
 monitor/misc.c                      |  2 +-
 softmmu/memory.c                    | 18 +++++++++---------
 softmmu/memory_mapping.c            |  4 ++--
 softmmu/physmem.c                   | 10 +++++-----
 target/i386/monitor.c               |  6 +++---
 target/loongarch/tlb_helper.c       |  2 +-
 target/microblaze/op_helper.c       |  2 +-
 target/mips/tcg/sysemu/tlb_helper.c |  2 +-
 target/ppc/mmu-hash32.c             | 14 +++++++-------
 target/ppc/mmu-hash64.c             | 12 ++++++------
 target/ppc/mmu_common.c             | 26 +++++++++++++-------------
 target/ppc/mmu_helper.c             |  4 ++--
 target/riscv/cpu_helper.c           | 10 +++++-----
 target/riscv/monitor.c              |  2 +-
 target/sparc/ldst_helper.c          |  6 +++---
 target/sparc/mmu_helper.c           | 10 +++++-----
 target/tricore/helper.c             |  2 +-
 69 files changed, 227 insertions(+), 227 deletions(-)

diff --git a/accel/tcg/cputlb.c b/accel/tcg/cputlb.c
index 4948729917..4e040a1cb9 100644
--- a/accel/tcg/cputlb.c
+++ b/accel/tcg/cputlb.c
@@ -1142,7 +1142,7 @@ void tlb_set_page_full(CPUState *cpu, int mmu_idx,
                                                 &xlat, &sz, full->attrs, &prot);
     assert(sz >= TARGET_PAGE_SIZE);
 
-    tlb_debug("vaddr=" TARGET_FMT_lx " paddr=0x" TARGET_FMT_plx
+    tlb_debug("vaddr=" TARGET_FMT_lx " paddr=0x" HWADDR_FMT_plx
               " prot=%x idx=%d\n",
               vaddr, full->phys_addr, prot, mmu_idx);
 
diff --git a/hw/arm/strongarm.c b/hw/arm/strongarm.c
index 39b8f01ac4..cc73145053 100644
--- a/hw/arm/strongarm.c
+++ b/hw/arm/strongarm.c
@@ -151,7 +151,7 @@ static uint64_t strongarm_pic_mem_read(void *opaque, hwaddr offset,
     case ICPR:
         return s->pending;
     default:
-        printf("%s: Bad register offset 0x" TARGET_FMT_plx "\n",
+        printf("%s: Bad register offset 0x" HWADDR_FMT_plx "\n",
                         __func__, offset);
         return 0;
     }
@@ -173,7 +173,7 @@ static void strongarm_pic_mem_write(void *opaque, hwaddr offset,
         s->int_idle = (value & 1) ? 0 : ~0;
         break;
     default:
-        printf("%s: Bad register offset 0x" TARGET_FMT_plx "\n",
+        printf("%s: Bad register offset 0x" HWADDR_FMT_plx "\n",
                         __func__, offset);
         break;
     }
@@ -333,7 +333,7 @@ static uint64_t strongarm_rtc_read(void *opaque, hwaddr addr,
                 ((qemu_clock_get_ms(rtc_clock) - s->last_hz) << 15) /
                 (1000 * ((s->rttr & 0xffff) + 1));
     default:
-        printf("%s: Bad register 0x" TARGET_FMT_plx "\n", __func__, addr);
+        printf("%s: Bad register 0x" HWADDR_FMT_plx "\n", __func__, addr);
         return 0;
     }
 }
@@ -375,7 +375,7 @@ static void strongarm_rtc_write(void *opaque, hwaddr addr,
         break;
 
     default:
-        printf("%s: Bad register 0x" TARGET_FMT_plx "\n", __func__, addr);
+        printf("%s: Bad register 0x" HWADDR_FMT_plx "\n", __func__, addr);
     }
 }
 
@@ -581,7 +581,7 @@ static uint64_t strongarm_gpio_read(void *opaque, hwaddr offset,
         return s->status;
 
     default:
-        printf("%s: Bad offset 0x" TARGET_FMT_plx "\n", __func__, offset);
+        printf("%s: Bad offset 0x" HWADDR_FMT_plx "\n", __func__, offset);
     }
 
     return 0;
@@ -626,7 +626,7 @@ static void strongarm_gpio_write(void *opaque, hwaddr offset,
         break;
 
     default:
-        printf("%s: Bad offset 0x" TARGET_FMT_plx "\n", __func__, offset);
+        printf("%s: Bad offset 0x" HWADDR_FMT_plx "\n", __func__, offset);
     }
 }
 
@@ -782,7 +782,7 @@ static uint64_t strongarm_ppc_read(void *opaque, hwaddr offset,
         return s->ppfr | ~0x7f001;
 
     default:
-        printf("%s: Bad offset 0x" TARGET_FMT_plx "\n", __func__, offset);
+        printf("%s: Bad offset 0x" HWADDR_FMT_plx "\n", __func__, offset);
     }
 
     return 0;
@@ -817,7 +817,7 @@ static void strongarm_ppc_write(void *opaque, hwaddr offset,
         break;
 
     default:
-        printf("%s: Bad offset 0x" TARGET_FMT_plx "\n", __func__, offset);
+        printf("%s: Bad offset 0x" HWADDR_FMT_plx "\n", __func__, offset);
     }
 }
 
@@ -1164,7 +1164,7 @@ static uint64_t strongarm_uart_read(void *opaque, hwaddr addr,
         return s->utsr1;
 
     default:
-        printf("%s: Bad register 0x" TARGET_FMT_plx "\n", __func__, addr);
+        printf("%s: Bad register 0x" HWADDR_FMT_plx "\n", __func__, addr);
         return 0;
     }
 }
@@ -1221,7 +1221,7 @@ static void strongarm_uart_write(void *opaque, hwaddr addr,
         break;
 
     default:
-        printf("%s: Bad register 0x" TARGET_FMT_plx "\n", __func__, addr);
+        printf("%s: Bad register 0x" HWADDR_FMT_plx "\n", __func__, addr);
     }
 }
 
@@ -1443,7 +1443,7 @@ static uint64_t strongarm_ssp_read(void *opaque, hwaddr addr,
         strongarm_ssp_fifo_update(s);
         return retval;
     default:
-        printf("%s: Bad register 0x" TARGET_FMT_plx "\n", __func__, addr);
+        printf("%s: Bad register 0x" HWADDR_FMT_plx "\n", __func__, addr);
         break;
     }
     return 0;
@@ -1509,7 +1509,7 @@ static void strongarm_ssp_write(void *opaque, hwaddr addr,
         break;
 
     default:
-        printf("%s: Bad register 0x" TARGET_FMT_plx "\n", __func__, addr);
+        printf("%s: Bad register 0x" HWADDR_FMT_plx "\n", __func__, addr);
         break;
     }
 }
diff --git a/hw/block/pflash_cfi01.c b/hw/block/pflash_cfi01.c
index 0cbc2fb4cb..36d68c70f6 100644
--- a/hw/block/pflash_cfi01.c
+++ b/hw/block/pflash_cfi01.c
@@ -645,7 +645,7 @@ static void pflash_write(PFlashCFI01 *pfl, hwaddr offset,
 
  error_flash:
     qemu_log_mask(LOG_UNIMP, "%s: Unimplemented flash cmd sequence "
-                  "(offset " TARGET_FMT_plx ", wcycle 0x%x cmd 0x%x value 0x%x)"
+                  "(offset " HWADDR_FMT_plx ", wcycle 0x%x cmd 0x%x value 0x%x)"
                   "\n", __func__, offset, pfl->wcycle, pfl->cmd, value);
 
  mode_read_array:
diff --git a/hw/char/digic-uart.c b/hw/char/digic-uart.c
index 00e5df5517..51d4e7db52 100644
--- a/hw/char/digic-uart.c
+++ b/hw/char/digic-uart.c
@@ -63,7 +63,7 @@ static uint64_t digic_uart_read(void *opaque, hwaddr addr,
     default:
         qemu_log_mask(LOG_UNIMP,
                       "digic-uart: read access to unknown register 0x"
-                      TARGET_FMT_plx "\n", addr << 2);
+                      HWADDR_FMT_plx "\n", addr << 2);
     }
 
     return ret;
@@ -101,7 +101,7 @@ static void digic_uart_write(void *opaque, hwaddr addr, uint64_t value,
     default:
         qemu_log_mask(LOG_UNIMP,
                       "digic-uart: write access to unknown register 0x"
-                      TARGET_FMT_plx "\n", addr << 2);
+                      HWADDR_FMT_plx "\n", addr << 2);
     }
 }
 
diff --git a/hw/char/etraxfs_ser.c b/hw/char/etraxfs_ser.c
index e8c3017724..8d6422dae4 100644
--- a/hw/char/etraxfs_ser.c
+++ b/hw/char/etraxfs_ser.c
@@ -113,7 +113,7 @@ ser_read(void *opaque, hwaddr addr, unsigned int size)
             break;
         default:
             r = s->regs[addr];
-            D(qemu_log("%s " TARGET_FMT_plx "=%x\n", __func__, addr, r));
+            D(qemu_log("%s " HWADDR_FMT_plx "=%x\n", __func__, addr, r));
             break;
     }
     return r;
@@ -127,7 +127,7 @@ ser_write(void *opaque, hwaddr addr,
     uint32_t value = val64;
     unsigned char ch = val64;
 
-    D(qemu_log("%s " TARGET_FMT_plx "=%x\n",  __func__, addr, value));
+    D(qemu_log("%s " HWADDR_FMT_plx "=%x\n",  __func__, addr, value));
     addr >>= 2;
     switch (addr)
     {
diff --git a/hw/core/loader.c b/hw/core/loader.c
index 0548830733..a18fb26469 100644
--- a/hw/core/loader.c
+++ b/hw/core/loader.c
@@ -1054,7 +1054,7 @@ ssize_t rom_add_file(const char *file, const char *fw_dir,
             rom->mr = mr;
             snprintf(devpath, sizeof(devpath), "/rom@%s", file);
         } else {
-            snprintf(devpath, sizeof(devpath), "/rom@" TARGET_FMT_plx, addr);
+            snprintf(devpath, sizeof(devpath), "/rom@" HWADDR_FMT_plx, addr);
         }
     }
 
@@ -1238,10 +1238,10 @@ static void rom_print_one_overlap_error(Rom *last_rom, Rom *rom)
         "\nThe following two regions overlap (in the %s address space):\n",
         rom_as_name(rom));
     error_printf(
-        "  %s (addresses 0x" TARGET_FMT_plx " - 0x" TARGET_FMT_plx ")\n",
+        "  %s (addresses 0x" HWADDR_FMT_plx " - 0x" HWADDR_FMT_plx ")\n",
         last_rom->name, last_rom->addr, last_rom->addr + last_rom->romsize);
     error_printf(
-        "  %s (addresses 0x" TARGET_FMT_plx " - 0x" TARGET_FMT_plx ")\n",
+        "  %s (addresses 0x" HWADDR_FMT_plx " - 0x" HWADDR_FMT_plx ")\n",
         rom->name, rom->addr, rom->addr + rom->romsize);
 }
 
@@ -1595,7 +1595,7 @@ HumanReadableText *qmp_x_query_roms(Error **errp)
                                    rom->romsize,
                                    rom->name);
         } else if (!rom->fw_file) {
-            g_string_append_printf(buf, "addr=" TARGET_FMT_plx
+            g_string_append_printf(buf, "addr=" HWADDR_FMT_plx
                                    " size=0x%06zx mem=%s name=\"%s\"\n",
                                    rom->addr, rom->romsize,
                                    rom->isrom ? "rom" : "ram",
diff --git a/hw/core/sysbus.c b/hw/core/sysbus.c
index 05c1da3d31..35f902b582 100644
--- a/hw/core/sysbus.c
+++ b/hw/core/sysbus.c
@@ -269,7 +269,7 @@ static void sysbus_dev_print(Monitor *mon, DeviceState *dev, int indent)
 
     for (i = 0; i < s->num_mmio; i++) {
         size = memory_region_size(s->mmio[i].memory);
-        monitor_printf(mon, "%*smmio " TARGET_FMT_plx "/" TARGET_FMT_plx "\n",
+        monitor_printf(mon, "%*smmio " HWADDR_FMT_plx "/" HWADDR_FMT_plx "\n",
                        indent, "", s->mmio[i].addr, size);
     }
 }
@@ -289,7 +289,7 @@ static char *sysbus_get_fw_dev_path(DeviceState *dev)
         }
     }
     if (s->num_mmio) {
-        return g_strdup_printf("%s@" TARGET_FMT_plx, qdev_fw_name(dev),
+        return g_strdup_printf("%s@" HWADDR_FMT_plx, qdev_fw_name(dev),
                                s->mmio[0].addr);
     }
     if (s->num_pio) {
diff --git a/hw/display/cirrus_vga.c b/hw/display/cirrus_vga.c
index 55c32e3e40..b80f98b6c4 100644
--- a/hw/display/cirrus_vga.c
+++ b/hw/display/cirrus_vga.c
@@ -2041,7 +2041,7 @@ static uint64_t cirrus_vga_mem_read(void *opaque,
     } else {
         val = 0xff;
         qemu_log_mask(LOG_GUEST_ERROR,
-                      "cirrus: mem_readb 0x" TARGET_FMT_plx "\n", addr);
+                      "cirrus: mem_readb 0x" HWADDR_FMT_plx "\n", addr);
     }
     return val;
 }
@@ -2105,7 +2105,7 @@ static void cirrus_vga_mem_write(void *opaque,
         }
     } else {
         qemu_log_mask(LOG_GUEST_ERROR,
-                      "cirrus: mem_writeb 0x" TARGET_FMT_plx " "
+                      "cirrus: mem_writeb 0x" HWADDR_FMT_plx " "
                       "value 0x%02" PRIx64 "\n", addr, mem_value);
     }
 }
diff --git a/hw/display/g364fb.c b/hw/display/g364fb.c
index caca86d773..2903cab82d 100644
--- a/hw/display/g364fb.c
+++ b/hw/display/g364fb.c
@@ -320,7 +320,7 @@ static uint64_t g364fb_ctrl_read(void *opaque,
                 break;
             default:
             {
-                error_report("g364: invalid read at [" TARGET_FMT_plx "]",
+                error_report("g364: invalid read at [" HWADDR_FMT_plx "]",
                              addr);
                 val = 0;
                 break;
@@ -424,7 +424,7 @@ static void g364fb_ctrl_write(void *opaque,
             break;
         default:
             error_report("g364: invalid write of 0x%" PRIx64
-                         " at [" TARGET_FMT_plx "]", val, addr);
+                         " at [" HWADDR_FMT_plx "]", val, addr);
             break;
         }
     }
diff --git a/hw/display/vga.c b/hw/display/vga.c
index 0cb26a791b..7a5fdff649 100644
--- a/hw/display/vga.c
+++ b/hw/display/vga.c
@@ -875,7 +875,7 @@ void vga_mem_writeb(VGACommonState *s, hwaddr addr, uint32_t val)
     uint32_t write_mask, bit_mask, set_mask;
 
 #ifdef DEBUG_VGA_MEM
-    printf("vga: [0x" TARGET_FMT_plx "] = 0x%02x\n", addr, val);
+    printf("vga: [0x" HWADDR_FMT_plx "] = 0x%02x\n", addr, val);
 #endif
     /* convert to VGA memory offset */
     memory_map_mode = (s->gr[VGA_GFX_MISC] >> 2) & 3;
@@ -909,7 +909,7 @@ void vga_mem_writeb(VGACommonState *s, hwaddr addr, uint32_t val)
             assert(addr < s->vram_size);
             s->vram_ptr[addr] = val;
 #ifdef DEBUG_VGA_MEM
-            printf("vga: chain4: [0x" TARGET_FMT_plx "]\n", addr);
+            printf("vga: chain4: [0x" HWADDR_FMT_plx "]\n", addr);
 #endif
             s->plane_updated |= mask; /* only used to detect font change */
             memory_region_set_dirty(&s->vram, addr, 1);
@@ -925,7 +925,7 @@ void vga_mem_writeb(VGACommonState *s, hwaddr addr, uint32_t val)
             }
             s->vram_ptr[addr] = val;
 #ifdef DEBUG_VGA_MEM
-            printf("vga: odd/even: [0x" TARGET_FMT_plx "]\n", addr);
+            printf("vga: odd/even: [0x" HWADDR_FMT_plx "]\n", addr);
 #endif
             s->plane_updated |= mask; /* only used to detect font change */
             memory_region_set_dirty(&s->vram, addr, 1);
@@ -1003,7 +1003,7 @@ void vga_mem_writeb(VGACommonState *s, hwaddr addr, uint32_t val)
             (((uint32_t *)s->vram_ptr)[addr] & ~write_mask) |
             (val & write_mask);
 #ifdef DEBUG_VGA_MEM
-        printf("vga: latch: [0x" TARGET_FMT_plx "] mask=0x%08x val=0x%08x\n",
+        printf("vga: latch: [0x" HWADDR_FMT_plx "] mask=0x%08x val=0x%08x\n",
                addr * 4, write_mask, val);
 #endif
         memory_region_set_dirty(&s->vram, addr << 2, sizeof(uint32_t));
diff --git a/hw/dma/etraxfs_dma.c b/hw/dma/etraxfs_dma.c
index c4334e87bf..8951864ed7 100644
--- a/hw/dma/etraxfs_dma.c
+++ b/hw/dma/etraxfs_dma.c
@@ -272,7 +272,7 @@ static void channel_load_d(struct fs_dma_ctrl *ctrl, int c)
 	hwaddr addr = channel_reg(ctrl, c, RW_SAVED_DATA);
 
 	/* Load and decode. FIXME: handle endianness.  */
-	D(printf("%s ch=%d addr=" TARGET_FMT_plx "\n", __func__, c, addr));
+	D(printf("%s ch=%d addr=" HWADDR_FMT_plx "\n", __func__, c, addr));
     cpu_physical_memory_read(addr, &ctrl->channels[c].current_d,
                              sizeof(ctrl->channels[c].current_d));
 
@@ -285,7 +285,7 @@ static void channel_store_c(struct fs_dma_ctrl *ctrl, int c)
 	hwaddr addr = channel_reg(ctrl, c, RW_GROUP_DOWN);
 
 	/* Encode and store. FIXME: handle endianness.  */
-	D(printf("%s ch=%d addr=" TARGET_FMT_plx "\n", __func__, c, addr));
+	D(printf("%s ch=%d addr=" HWADDR_FMT_plx "\n", __func__, c, addr));
 	D(dump_d(c, &ctrl->channels[c].current_d));
     cpu_physical_memory_write(addr, &ctrl->channels[c].current_c,
                               sizeof(ctrl->channels[c].current_c));
@@ -296,7 +296,7 @@ static void channel_store_d(struct fs_dma_ctrl *ctrl, int c)
 	hwaddr addr = channel_reg(ctrl, c, RW_SAVED_DATA);
 
 	/* Encode and store. FIXME: handle endianness.  */
-	D(printf("%s ch=%d addr=" TARGET_FMT_plx "\n", __func__, c, addr));
+	D(printf("%s ch=%d addr=" HWADDR_FMT_plx "\n", __func__, c, addr));
     cpu_physical_memory_write(addr, &ctrl->channels[c].current_d,
                               sizeof(ctrl->channels[c].current_d));
 }
@@ -574,7 +574,7 @@ static inline int channel_in_run(struct fs_dma_ctrl *ctrl, int c)
 
 static uint32_t dma_rinvalid (void *opaque, hwaddr addr)
 {
-        hw_error("Unsupported short raccess. reg=" TARGET_FMT_plx "\n", addr);
+        hw_error("Unsupported short raccess. reg=" HWADDR_FMT_plx "\n", addr);
         return 0;
 }
 
@@ -603,7 +603,7 @@ dma_read(void *opaque, hwaddr addr, unsigned int size)
 
 		default:
 			r = ctrl->channels[c].regs[addr];
-			D(printf ("%s c=%d addr=" TARGET_FMT_plx "\n",
+			D(printf ("%s c=%d addr=" HWADDR_FMT_plx "\n",
 				  __func__, c, addr));
 			break;
 	}
@@ -613,7 +613,7 @@ dma_read(void *opaque, hwaddr addr, unsigned int size)
 static void
 dma_winvalid (void *opaque, hwaddr addr, uint32_t value)
 {
-        hw_error("Unsupported short waccess. reg=" TARGET_FMT_plx "\n", addr);
+        hw_error("Unsupported short waccess. reg=" HWADDR_FMT_plx "\n", addr);
 }
 
 static void
@@ -686,7 +686,7 @@ dma_write(void *opaque, hwaddr addr,
 			break;
 
 	        default:
-			D(printf ("%s c=%d " TARGET_FMT_plx "\n",
+			D(printf ("%s c=%d " HWADDR_FMT_plx "\n",
 				__func__, c, addr));
 			break;
         }
diff --git a/hw/dma/pl330.c b/hw/dma/pl330.c
index e5d521c329..e7e67dd8b6 100644
--- a/hw/dma/pl330.c
+++ b/hw/dma/pl330.c
@@ -1373,7 +1373,7 @@ static void pl330_iomem_write(void *opaque, hwaddr offset,
             pl330_exec(s);
         } else {
             qemu_log_mask(LOG_GUEST_ERROR, "pl330: write of illegal value %u "
-                          "for offset " TARGET_FMT_plx "\n", (unsigned)value,
+                          "for offset " HWADDR_FMT_plx "\n", (unsigned)value,
                           offset);
         }
         break;
@@ -1384,7 +1384,7 @@ static void pl330_iomem_write(void *opaque, hwaddr offset,
         s->dbg[1] = value;
         break;
     default:
-        qemu_log_mask(LOG_GUEST_ERROR, "pl330: bad write offset " TARGET_FMT_plx
+        qemu_log_mask(LOG_GUEST_ERROR, "pl330: bad write offset " HWADDR_FMT_plx
                       "\n", offset);
         break;
     }
@@ -1409,7 +1409,7 @@ static inline uint32_t pl330_iomem_read_imp(void *opaque,
         chan_id = offset >> 5;
         if (chan_id >= s->num_chnls) {
             qemu_log_mask(LOG_GUEST_ERROR, "pl330: bad read offset "
-                          TARGET_FMT_plx "\n", offset);
+                          HWADDR_FMT_plx "\n", offset);
             return 0;
         }
         switch (offset & 0x1f) {
@@ -1425,7 +1425,7 @@ static inline uint32_t pl330_iomem_read_imp(void *opaque,
             return s->chan[chan_id].lc[1];
         default:
             qemu_log_mask(LOG_GUEST_ERROR, "pl330: bad read offset "
-                          TARGET_FMT_plx "\n", offset);
+                          HWADDR_FMT_plx "\n", offset);
             return 0;
         }
     }
@@ -1434,7 +1434,7 @@ static inline uint32_t pl330_iomem_read_imp(void *opaque,
         chan_id = offset >> 3;
         if (chan_id >= s->num_chnls) {
             qemu_log_mask(LOG_GUEST_ERROR, "pl330: bad read offset "
-                          TARGET_FMT_plx "\n", offset);
+                          HWADDR_FMT_plx "\n", offset);
             return 0;
         }
         switch ((offset >> 2) & 1) {
@@ -1456,7 +1456,7 @@ static inline uint32_t pl330_iomem_read_imp(void *opaque,
         chan_id = offset >> 2;
         if (chan_id >= s->num_chnls) {
             qemu_log_mask(LOG_GUEST_ERROR, "pl330: bad read offset "
-                          TARGET_FMT_plx "\n", offset);
+                          HWADDR_FMT_plx "\n", offset);
             return 0;
         }
         return s->chan[chan_id].fault_type;
@@ -1495,7 +1495,7 @@ static inline uint32_t pl330_iomem_read_imp(void *opaque,
         return s->debug_status;
     default:
         qemu_log_mask(LOG_GUEST_ERROR, "pl330: bad read offset "
-                      TARGET_FMT_plx "\n", offset);
+                      HWADDR_FMT_plx "\n", offset);
     }
     return 0;
 }
diff --git a/hw/dma/xilinx_axidma.c b/hw/dma/xilinx_axidma.c
index cbb8f0f169..6030c76435 100644
--- a/hw/dma/xilinx_axidma.c
+++ b/hw/dma/xilinx_axidma.c
@@ -456,7 +456,7 @@ static uint64_t axidma_read(void *opaque, hwaddr addr,
             break;
         default:
             r = s->regs[addr];
-            D(qemu_log("%s ch=%d addr=" TARGET_FMT_plx " v=%x\n",
+            D(qemu_log("%s ch=%d addr=" HWADDR_FMT_plx " v=%x\n",
                            __func__, sid, addr * 4, r));
             break;
     }
@@ -509,7 +509,7 @@ static void axidma_write(void *opaque, hwaddr addr,
             }
             break;
         default:
-            D(qemu_log("%s: ch=%d addr=" TARGET_FMT_plx " v=%x\n",
+            D(qemu_log("%s: ch=%d addr=" HWADDR_FMT_plx " v=%x\n",
                   __func__, sid, addr * 4, (unsigned)value));
             s->regs[addr] = value;
             break;
diff --git a/hw/dma/xlnx_csu_dma.c b/hw/dma/xlnx_csu_dma.c
index 1ce52ea5a2..88002698a1 100644
--- a/hw/dma/xlnx_csu_dma.c
+++ b/hw/dma/xlnx_csu_dma.c
@@ -211,7 +211,7 @@ static uint32_t xlnx_csu_dma_read(XlnxCSUDMA *s, uint8_t *buf, uint32_t len)
     if (result == MEMTX_OK) {
         xlnx_csu_dma_data_process(s, buf, len);
     } else {
-        qemu_log_mask(LOG_GUEST_ERROR, "%s: Bad address " TARGET_FMT_plx
+        qemu_log_mask(LOG_GUEST_ERROR, "%s: Bad address " HWADDR_FMT_plx
                       " for mem read", __func__, addr);
         s->regs[R_INT_STATUS] |= R_INT_STATUS_AXI_BRESP_ERR_MASK;
         xlnx_csu_dma_update_irq(s);
@@ -241,7 +241,7 @@ static uint32_t xlnx_csu_dma_write(XlnxCSUDMA *s, uint8_t *buf, uint32_t len)
     }
 
     if (result != MEMTX_OK) {
-        qemu_log_mask(LOG_GUEST_ERROR, "%s: Bad address " TARGET_FMT_plx
+        qemu_log_mask(LOG_GUEST_ERROR, "%s: Bad address " HWADDR_FMT_plx
                       " for mem write", __func__, addr);
         s->regs[R_INT_STATUS] |= R_INT_STATUS_AXI_BRESP_ERR_MASK;
         xlnx_csu_dma_update_irq(s);
diff --git a/hw/i2c/mpc_i2c.c b/hw/i2c/mpc_i2c.c
index 845392505f..219c548402 100644
--- a/hw/i2c/mpc_i2c.c
+++ b/hw/i2c/mpc_i2c.c
@@ -224,7 +224,7 @@ static uint64_t mpc_i2c_read(void *opaque, hwaddr addr, unsigned size)
         break;
     }
 
-    DPRINTF("%s: addr " TARGET_FMT_plx " %02" PRIx32 "\n", __func__,
+    DPRINTF("%s: addr " HWADDR_FMT_plx " %02" PRIx32 "\n", __func__,
                                          addr, value);
     return (uint64_t)value;
 }
@@ -234,7 +234,7 @@ static void mpc_i2c_write(void *opaque, hwaddr addr,
 {
     MPCI2CState *s = opaque;
 
-    DPRINTF("%s: addr " TARGET_FMT_plx " val %08" PRIx64 "\n", __func__,
+    DPRINTF("%s: addr " HWADDR_FMT_plx " val %08" PRIx64 "\n", __func__,
                                              addr, value);
     switch (addr) {
     case MPC_I2C_ADR:
diff --git a/hw/i386/multiboot.c b/hw/i386/multiboot.c
index 963e29362e..3332712ab3 100644
--- a/hw/i386/multiboot.c
+++ b/hw/i386/multiboot.c
@@ -137,7 +137,7 @@ static void mb_add_mod(MultibootState *s,
     stl_p(p + MB_MOD_END,     end);
     stl_p(p + MB_MOD_CMDLINE, cmdline_phys);
 
-    mb_debug("mod%02d: "TARGET_FMT_plx" - "TARGET_FMT_plx,
+    mb_debug("mod%02d: "HWADDR_FMT_plx" - "HWADDR_FMT_plx,
              s->mb_mods_count, start, end);
 
     s->mb_mods_count++;
@@ -353,7 +353,7 @@ int load_multiboot(X86MachineState *x86ms,
             mb_add_mod(&mbs, mbs.mb_buf_phys + offs,
                        mbs.mb_buf_phys + offs + mb_mod_length, c);
 
-            mb_debug("mod_start: %p\nmod_end:   %p\n  cmdline: "TARGET_FMT_plx,
+            mb_debug("mod_start: %p\nmod_end:   %p\n  cmdline: "HWADDR_FMT_plx,
                      (char *)mbs.mb_buf + offs,
                      (char *)mbs.mb_buf + offs + mb_mod_length, c);
             g_free(one_file);
@@ -382,8 +382,8 @@ int load_multiboot(X86MachineState *x86ms,
     stl_p(bootinfo + MBI_MMAP_ADDR,   ADDR_E820_MAP);
 
     mb_debug("multiboot: entry_addr = %#x", mh_entry_addr);
-    mb_debug("           mb_buf_phys   = "TARGET_FMT_plx, mbs.mb_buf_phys);
-    mb_debug("           mod_start     = "TARGET_FMT_plx,
+    mb_debug("           mb_buf_phys   = "HWADDR_FMT_plx, mbs.mb_buf_phys);
+    mb_debug("           mod_start     = "HWADDR_FMT_plx,
              mbs.mb_buf_phys + mbs.offset_mods);
     mb_debug("           mb_mods_count = %d", mbs.mb_mods_count);
 
diff --git a/hw/i386/xen/xen-hvm.c b/hw/i386/xen/xen-hvm.c
index e4293d6d66..b9a6f7f538 100644
--- a/hw/i386/xen/xen-hvm.c
+++ b/hw/i386/xen/xen-hvm.c
@@ -516,13 +516,13 @@ static void xen_set_memory(struct MemoryListener *listener,
             if (xen_set_mem_type(xen_domid, mem_type,
                                  start_addr >> TARGET_PAGE_BITS,
                                  size >> TARGET_PAGE_BITS)) {
-                DPRINTF("xen_set_mem_type error, addr: "TARGET_FMT_plx"\n",
+                DPRINTF("xen_set_mem_type error, addr: "HWADDR_FMT_plx"\n",
                         start_addr);
             }
         }
     } else {
         if (xen_remove_from_physmap(state, start_addr, size) < 0) {
-            DPRINTF("physmapping does not exist at "TARGET_FMT_plx"\n", start_addr);
+            DPRINTF("physmapping does not exist at "HWADDR_FMT_plx"\n", start_addr);
         }
     }
 }
@@ -642,8 +642,8 @@ static void xen_sync_dirty_bitmap(XenIOState *state,
 #endif
         if (errno == ENODATA) {
             memory_region_set_dirty(framebuffer, 0, size);
-            DPRINTF("xen: track_dirty_vram failed (0x" TARGET_FMT_plx
-                    ", 0x" TARGET_FMT_plx "): %s\n",
+            DPRINTF("xen: track_dirty_vram failed (0x" HWADDR_FMT_plx
+                    ", 0x" HWADDR_FMT_plx "): %s\n",
                     start_addr, start_addr + size, strerror(errno));
         }
         return;
diff --git a/hw/i386/xen/xen-mapcache.c b/hw/i386/xen/xen-mapcache.c
index a2f93096e7..1d0879d234 100644
--- a/hw/i386/xen/xen-mapcache.c
+++ b/hw/i386/xen/xen-mapcache.c
@@ -357,7 +357,7 @@ tryagain:
         entry->lock++;
         if (entry->lock == 0) {
             fprintf(stderr,
-                    "mapcache entry lock overflow: "TARGET_FMT_plx" -> %p\n",
+                    "mapcache entry lock overflow: "HWADDR_FMT_plx" -> %p\n",
                     entry->paddr_index, entry->vaddr_base);
             abort();
         }
@@ -404,7 +404,7 @@ ram_addr_t xen_ram_addr_from_mapcache(void *ptr)
     if (!found) {
         fprintf(stderr, "%s, could not find %p\n", __func__, ptr);
         QTAILQ_FOREACH(reventry, &mapcache->locked_entries, next) {
-            DPRINTF("   "TARGET_FMT_plx" -> %p is present\n", reventry->paddr_index,
+            DPRINTF("   "HWADDR_FMT_plx" -> %p is present\n", reventry->paddr_index,
                     reventry->vaddr_req);
         }
         abort();
@@ -445,7 +445,7 @@ static void xen_invalidate_map_cache_entry_unlocked(uint8_t *buffer)
     if (!found) {
         DPRINTF("%s, could not find %p\n", __func__, buffer);
         QTAILQ_FOREACH(reventry, &mapcache->locked_entries, next) {
-            DPRINTF("   "TARGET_FMT_plx" -> %p is present\n", reventry->paddr_index, reventry->vaddr_req);
+            DPRINTF("   "HWADDR_FMT_plx" -> %p is present\n", reventry->paddr_index, reventry->vaddr_req);
         }
         return;
     }
@@ -503,7 +503,7 @@ void xen_invalidate_map_cache(void)
             continue;
         }
         fprintf(stderr, "Locked DMA mapping while invalidating mapcache!"
-                " "TARGET_FMT_plx" -> %p is present\n",
+                " "HWADDR_FMT_plx" -> %p is present\n",
                 reventry->paddr_index, reventry->vaddr_req);
     }
 
@@ -562,7 +562,7 @@ static uint8_t *xen_replace_cache_entry_unlocked(hwaddr old_phys_addr,
         entry = entry->next;
     }
     if (!entry) {
-        DPRINTF("Trying to update an entry for "TARGET_FMT_plx \
+        DPRINTF("Trying to update an entry for "HWADDR_FMT_plx \
                 "that is not in the mapcache!\n", old_phys_addr);
         return NULL;
     }
@@ -570,15 +570,15 @@ static uint8_t *xen_replace_cache_entry_unlocked(hwaddr old_phys_addr,
     address_index  = new_phys_addr >> MCACHE_BUCKET_SHIFT;
     address_offset = new_phys_addr & (MCACHE_BUCKET_SIZE - 1);
 
-    fprintf(stderr, "Replacing a dummy mapcache entry for "TARGET_FMT_plx \
-            " with "TARGET_FMT_plx"\n", old_phys_addr, new_phys_addr);
+    fprintf(stderr, "Replacing a dummy mapcache entry for "HWADDR_FMT_plx \
+            " with "HWADDR_FMT_plx"\n", old_phys_addr, new_phys_addr);
 
     xen_remap_bucket(entry, entry->vaddr_base,
                      cache_size, address_index, false);
     if (!test_bits(address_offset >> XC_PAGE_SHIFT,
                 test_bit_size >> XC_PAGE_SHIFT,
                 entry->valid_mapping)) {
-        DPRINTF("Unable to update a mapcache entry for "TARGET_FMT_plx"!\n",
+        DPRINTF("Unable to update a mapcache entry for "HWADDR_FMT_plx"!\n",
                 old_phys_addr);
         return NULL;
     }
diff --git a/hw/i386/xen/xen_platform.c b/hw/i386/xen/xen_platform.c
index 7db0d94ec2..66e6de31a6 100644
--- a/hw/i386/xen/xen_platform.c
+++ b/hw/i386/xen/xen_platform.c
@@ -445,7 +445,7 @@ static uint64_t platform_mmio_read(void *opaque, hwaddr addr,
                                    unsigned size)
 {
     DPRINTF("Warning: attempted read from physical address "
-            "0x" TARGET_FMT_plx " in xen platform mmio space\n", addr);
+            "0x" HWADDR_FMT_plx " in xen platform mmio space\n", addr);
 
     return 0;
 }
@@ -454,7 +454,7 @@ static void platform_mmio_write(void *opaque, hwaddr addr,
                                 uint64_t val, unsigned size)
 {
     DPRINTF("Warning: attempted write of 0x%"PRIx64" to physical "
-            "address 0x" TARGET_FMT_plx " in xen platform mmio space\n",
+            "address 0x" HWADDR_FMT_plx " in xen platform mmio space\n",
             val, addr);
 }
 
diff --git a/hw/intc/arm_gicv3_dist.c b/hw/intc/arm_gicv3_dist.c
index d599fefcbc..35e850685c 100644
--- a/hw/intc/arm_gicv3_dist.c
+++ b/hw/intc/arm_gicv3_dist.c
@@ -564,7 +564,7 @@ static bool gicd_readl(GICv3State *s, hwaddr offset,
         /* WO registers, return unknown value */
         qemu_log_mask(LOG_GUEST_ERROR,
                       "%s: invalid guest read from WO register at offset "
-                      TARGET_FMT_plx "\n", __func__, offset);
+                      HWADDR_FMT_plx "\n", __func__, offset);
         *data = 0;
         return true;
     default:
@@ -773,7 +773,7 @@ static bool gicd_writel(GICv3State *s, hwaddr offset,
         /* RO registers, ignore the write */
         qemu_log_mask(LOG_GUEST_ERROR,
                       "%s: invalid guest write to RO register at offset "
-                      TARGET_FMT_plx "\n", __func__, offset);
+                      HWADDR_FMT_plx "\n", __func__, offset);
         return true;
     default:
         return false;
@@ -838,7 +838,7 @@ MemTxResult gicv3_dist_read(void *opaque, hwaddr offset, uint64_t *data,
 
     if (!r) {
         qemu_log_mask(LOG_GUEST_ERROR,
-                      "%s: invalid guest read at offset " TARGET_FMT_plx
+                      "%s: invalid guest read at offset " HWADDR_FMT_plx
                       " size %u\n", __func__, offset, size);
         trace_gicv3_dist_badread(offset, size, attrs.secure);
         /* The spec requires that reserved registers are RAZ/WI;
@@ -879,7 +879,7 @@ MemTxResult gicv3_dist_write(void *opaque, hwaddr offset, uint64_t data,
 
     if (!r) {
         qemu_log_mask(LOG_GUEST_ERROR,
-                      "%s: invalid guest write at offset " TARGET_FMT_plx
+                      "%s: invalid guest write at offset " HWADDR_FMT_plx
                       " size %u\n", __func__, offset, size);
         trace_gicv3_dist_badwrite(offset, data, size, attrs.secure);
         /* The spec requires that reserved registers are RAZ/WI;
diff --git a/hw/intc/arm_gicv3_its.c b/hw/intc/arm_gicv3_its.c
index 57c79da5c5..43dfd7a35c 100644
--- a/hw/intc/arm_gicv3_its.c
+++ b/hw/intc/arm_gicv3_its.c
@@ -1633,7 +1633,7 @@ static bool its_writel(GICv3ITSState *s, hwaddr offset,
             /* RO register, ignore the write */
             qemu_log_mask(LOG_GUEST_ERROR,
                           "%s: invalid guest write to RO register at offset "
-                          TARGET_FMT_plx "\n", __func__, offset);
+                          HWADDR_FMT_plx "\n", __func__, offset);
         }
         break;
     case GITS_CREADR + 4:
@@ -1643,7 +1643,7 @@ static bool its_writel(GICv3ITSState *s, hwaddr offset,
             /* RO register, ignore the write */
             qemu_log_mask(LOG_GUEST_ERROR,
                           "%s: invalid guest write to RO register at offset "
-                          TARGET_FMT_plx "\n", __func__, offset);
+                          HWADDR_FMT_plx "\n", __func__, offset);
         }
         break;
     case GITS_BASER ... GITS_BASER + 0x3f:
@@ -1675,7 +1675,7 @@ static bool its_writel(GICv3ITSState *s, hwaddr offset,
         /* RO registers, ignore the write */
         qemu_log_mask(LOG_GUEST_ERROR,
                       "%s: invalid guest write to RO register at offset "
-                      TARGET_FMT_plx "\n", __func__, offset);
+                      HWADDR_FMT_plx "\n", __func__, offset);
         break;
     default:
         result = false;
@@ -1785,14 +1785,14 @@ static bool its_writell(GICv3ITSState *s, hwaddr offset,
             /* RO register, ignore the write */
             qemu_log_mask(LOG_GUEST_ERROR,
                           "%s: invalid guest write to RO register at offset "
-                          TARGET_FMT_plx "\n", __func__, offset);
+                          HWADDR_FMT_plx "\n", __func__, offset);
         }
         break;
     case GITS_TYPER:
         /* RO registers, ignore the write */
         qemu_log_mask(LOG_GUEST_ERROR,
                       "%s: invalid guest write to RO register at offset "
-                      TARGET_FMT_plx "\n", __func__, offset);
+                      HWADDR_FMT_plx "\n", __func__, offset);
         break;
     default:
         result = false;
@@ -1851,7 +1851,7 @@ static MemTxResult gicv3_its_read(void *opaque, hwaddr offset, uint64_t *data,
 
     if (!result) {
         qemu_log_mask(LOG_GUEST_ERROR,
-                      "%s: invalid guest read at offset " TARGET_FMT_plx
+                      "%s: invalid guest read at offset " HWADDR_FMT_plx
                       " size %u\n", __func__, offset, size);
         trace_gicv3_its_badread(offset, size);
         /*
@@ -1887,7 +1887,7 @@ static MemTxResult gicv3_its_write(void *opaque, hwaddr offset, uint64_t data,
 
     if (!result) {
         qemu_log_mask(LOG_GUEST_ERROR,
-                      "%s: invalid guest write at offset " TARGET_FMT_plx
+                      "%s: invalid guest write at offset " HWADDR_FMT_plx
                       " size %u\n", __func__, offset, size);
         trace_gicv3_its_badwrite(offset, data, size);
         /*
diff --git a/hw/intc/arm_gicv3_redist.c b/hw/intc/arm_gicv3_redist.c
index c92ceecc16..297f7f0263 100644
--- a/hw/intc/arm_gicv3_redist.c
+++ b/hw/intc/arm_gicv3_redist.c
@@ -601,7 +601,7 @@ static MemTxResult gicr_writel(GICv3CPUState *cs, hwaddr offset,
         /* RO registers, ignore the write */
         qemu_log_mask(LOG_GUEST_ERROR,
                       "%s: invalid guest write to RO register at offset "
-                      TARGET_FMT_plx "\n", __func__, offset);
+                      HWADDR_FMT_plx "\n", __func__, offset);
         return MEMTX_OK;
         /*
          * VLPI frame registers. We don't need a version check for
@@ -668,7 +668,7 @@ static MemTxResult gicr_writell(GICv3CPUState *cs, hwaddr offset,
         /* RO register, ignore the write */
         qemu_log_mask(LOG_GUEST_ERROR,
                       "%s: invalid guest write to RO register at offset "
-                      TARGET_FMT_plx "\n", __func__, offset);
+                      HWADDR_FMT_plx "\n", __func__, offset);
         return MEMTX_OK;
         /*
          * VLPI frame registers. We don't need a version check for
@@ -727,7 +727,7 @@ MemTxResult gicv3_redist_read(void *opaque, hwaddr offset, uint64_t *data,
 
     if (r != MEMTX_OK) {
         qemu_log_mask(LOG_GUEST_ERROR,
-                      "%s: invalid guest read at offset " TARGET_FMT_plx
+                      "%s: invalid guest read at offset " HWADDR_FMT_plx
                       " size %u\n", __func__, offset, size);
         trace_gicv3_redist_badread(gicv3_redist_affid(cs), offset,
                                    size, attrs.secure);
@@ -786,7 +786,7 @@ MemTxResult gicv3_redist_write(void *opaque, hwaddr offset, uint64_t data,
 
     if (r != MEMTX_OK) {
         qemu_log_mask(LOG_GUEST_ERROR,
-                      "%s: invalid guest write at offset " TARGET_FMT_plx
+                      "%s: invalid guest write at offset " HWADDR_FMT_plx
                       " size %u\n", __func__, offset, size);
         trace_gicv3_redist_badwrite(gicv3_redist_affid(cs), offset, data,
                                     size, attrs.secure);
diff --git a/hw/intc/exynos4210_combiner.c b/hw/intc/exynos4210_combiner.c
index a289510bdb..4ba448fdb1 100644
--- a/hw/intc/exynos4210_combiner.c
+++ b/hw/intc/exynos4210_combiner.c
@@ -120,7 +120,7 @@ exynos4210_combiner_read(void *opaque, hwaddr offset, unsigned size)
     default:
         if (offset >> 2 >= IIC_REGSET_SIZE) {
             hw_error("exynos4210.combiner: overflow of reg_set by 0x"
-                    TARGET_FMT_plx "offset\n", offset);
+                    HWADDR_FMT_plx "offset\n", offset);
         }
         val = s->reg_set[offset >> 2];
     }
@@ -184,19 +184,19 @@ static void exynos4210_combiner_write(void *opaque, hwaddr offset,
 
     if (req_quad_base_n >= IIC_NGRP) {
         hw_error("exynos4210.combiner: unallowed write access at offset 0x"
-                TARGET_FMT_plx "\n", offset);
+                HWADDR_FMT_plx "\n", offset);
         return;
     }
 
     if (reg_n > 1) {
         hw_error("exynos4210.combiner: unallowed write access at offset 0x"
-                TARGET_FMT_plx "\n", offset);
+                HWADDR_FMT_plx "\n", offset);
         return;
     }
 
     if (offset >> 2 >= IIC_REGSET_SIZE) {
         hw_error("exynos4210.combiner: overflow of reg_set by 0x"
-                TARGET_FMT_plx "offset\n", offset);
+                HWADDR_FMT_plx "offset\n", offset);
     }
     s->reg_set[offset >> 2] = val;
 
@@ -246,7 +246,7 @@ static void exynos4210_combiner_write(void *opaque, hwaddr offset,
         break;
     default:
         hw_error("exynos4210.combiner: unallowed write access at offset 0x"
-                TARGET_FMT_plx "\n", offset);
+                HWADDR_FMT_plx "\n", offset);
         break;
     }
 }
diff --git a/hw/misc/auxbus.c b/hw/misc/auxbus.c
index 8a8012f5f0..28d50d9d09 100644
--- a/hw/misc/auxbus.c
+++ b/hw/misc/auxbus.c
@@ -299,7 +299,7 @@ static void aux_slave_dev_print(Monitor *mon, DeviceState *dev, int indent)
 
     s = AUX_SLAVE(dev);
 
-    monitor_printf(mon, "%*smemory " TARGET_FMT_plx "/" TARGET_FMT_plx "\n",
+    monitor_printf(mon, "%*smemory " HWADDR_FMT_plx "/" HWADDR_FMT_plx "\n",
                    indent, "",
                    object_property_get_uint(OBJECT(s->mmio), "addr", NULL),
                    memory_region_size(s->mmio));
diff --git a/hw/misc/ivshmem.c b/hw/misc/ivshmem.c
index 8270db53cd..d66d912172 100644
--- a/hw/misc/ivshmem.c
+++ b/hw/misc/ivshmem.c
@@ -179,7 +179,7 @@ static void ivshmem_io_write(void *opaque, hwaddr addr,
 
     addr &= 0xfc;
 
-    IVSHMEM_DPRINTF("writing to addr " TARGET_FMT_plx "\n", addr);
+    IVSHMEM_DPRINTF("writing to addr " HWADDR_FMT_plx "\n", addr);
     switch (addr)
     {
         case INTRMASK:
@@ -207,7 +207,7 @@ static void ivshmem_io_write(void *opaque, hwaddr addr,
             }
             break;
         default:
-            IVSHMEM_DPRINTF("Unhandled write " TARGET_FMT_plx "\n", addr);
+            IVSHMEM_DPRINTF("Unhandled write " HWADDR_FMT_plx "\n", addr);
     }
 }
 
@@ -233,7 +233,7 @@ static uint64_t ivshmem_io_read(void *opaque, hwaddr addr,
             break;
 
         default:
-            IVSHMEM_DPRINTF("why are we reading " TARGET_FMT_plx "\n", addr);
+            IVSHMEM_DPRINTF("why are we reading " HWADDR_FMT_plx "\n", addr);
             ret = 0;
     }
 
diff --git a/hw/misc/macio/mac_dbdma.c b/hw/misc/macio/mac_dbdma.c
index efcc02609f..43bb1f56ba 100644
--- a/hw/misc/macio/mac_dbdma.c
+++ b/hw/misc/macio/mac_dbdma.c
@@ -704,7 +704,7 @@ static void dbdma_write(void *opaque, hwaddr addr,
     DBDMA_channel *ch = &s->channels[channel];
     int reg = (addr - (channel << DBDMA_CHANNEL_SHIFT)) >> 2;
 
-    DBDMA_DPRINTFCH(ch, "writel 0x" TARGET_FMT_plx " <= 0x%08"PRIx64"\n",
+    DBDMA_DPRINTFCH(ch, "writel 0x" HWADDR_FMT_plx " <= 0x%08"PRIx64"\n",
                     addr, value);
     DBDMA_DPRINTFCH(ch, "channel 0x%x reg 0x%x\n",
                     (uint32_t)addr >> DBDMA_CHANNEL_SHIFT, reg);
@@ -786,7 +786,7 @@ static uint64_t dbdma_read(void *opaque, hwaddr addr,
         break;
     }
 
-    DBDMA_DPRINTFCH(ch, "readl 0x" TARGET_FMT_plx " => 0x%08x\n", addr, value);
+    DBDMA_DPRINTFCH(ch, "readl 0x" HWADDR_FMT_plx " => 0x%08x\n", addr, value);
     DBDMA_DPRINTFCH(ch, "channel 0x%x reg 0x%x\n",
                     (uint32_t)addr >> DBDMA_CHANNEL_SHIFT, reg);
 
diff --git a/hw/misc/mst_fpga.c b/hw/misc/mst_fpga.c
index 2aaadfa966..7692825867 100644
--- a/hw/misc/mst_fpga.c
+++ b/hw/misc/mst_fpga.c
@@ -131,7 +131,7 @@ mst_fpga_readb(void *opaque, hwaddr addr, unsigned size)
 		return s->pcmcia1;
 	default:
 		printf("Mainstone - mst_fpga_readb: Bad register offset "
-			"0x" TARGET_FMT_plx "\n", addr);
+			"0x" HWADDR_FMT_plx "\n", addr);
 	}
 	return 0;
 }
@@ -185,7 +185,7 @@ mst_fpga_writeb(void *opaque, hwaddr addr, uint64_t value,
 		break;
 	default:
 		printf("Mainstone - mst_fpga_writeb: Bad register offset "
-			"0x" TARGET_FMT_plx "\n", addr);
+			"0x" HWADDR_FMT_plx "\n", addr);
 	}
 }
 
diff --git a/hw/net/allwinner-sun8i-emac.c b/hw/net/allwinner-sun8i-emac.c
index ecc0245fe8..b861d8ff35 100644
--- a/hw/net/allwinner-sun8i-emac.c
+++ b/hw/net/allwinner-sun8i-emac.c
@@ -663,7 +663,7 @@ static uint64_t allwinner_sun8i_emac_read(void *opaque, hwaddr offset,
         break;
     default:
         qemu_log_mask(LOG_UNIMP, "allwinner-h3-emac: read access to unknown "
-                                 "EMAC register 0x" TARGET_FMT_plx "\n",
+                                 "EMAC register 0x" HWADDR_FMT_plx "\n",
                                   offset);
     }
 
@@ -760,7 +760,7 @@ static void allwinner_sun8i_emac_write(void *opaque, hwaddr offset,
         break;
     default:
         qemu_log_mask(LOG_UNIMP, "allwinner-h3-emac: write access to unknown "
-                                 "EMAC register 0x" TARGET_FMT_plx "\n",
+                                 "EMAC register 0x" HWADDR_FMT_plx "\n",
                                   offset);
     }
 }
diff --git a/hw/net/allwinner_emac.c b/hw/net/allwinner_emac.c
index ddddf35c45..372e5b66da 100644
--- a/hw/net/allwinner_emac.c
+++ b/hw/net/allwinner_emac.c
@@ -304,7 +304,7 @@ static uint64_t aw_emac_read(void *opaque, hwaddr offset, unsigned size)
     default:
         qemu_log_mask(LOG_UNIMP,
                       "allwinner_emac: read access to unknown register 0x"
-                      TARGET_FMT_plx "\n", offset);
+                      HWADDR_FMT_plx "\n", offset);
         ret = 0;
     }
 
@@ -407,7 +407,7 @@ static void aw_emac_write(void *opaque, hwaddr offset, uint64_t value,
     default:
         qemu_log_mask(LOG_UNIMP,
                       "allwinner_emac: write access to unknown register 0x"
-                      TARGET_FMT_plx "\n", offset);
+                      HWADDR_FMT_plx "\n", offset);
     }
 }
 
diff --git a/hw/net/fsl_etsec/etsec.c b/hw/net/fsl_etsec/etsec.c
index b75d8e3dce..c753bfb3a8 100644
--- a/hw/net/fsl_etsec/etsec.c
+++ b/hw/net/fsl_etsec/etsec.c
@@ -99,7 +99,7 @@ static uint64_t etsec_read(void *opaque, hwaddr addr, unsigned size)
         break;
     }
 
-    DPRINTF("Read  0x%08x @ 0x" TARGET_FMT_plx
+    DPRINTF("Read  0x%08x @ 0x" HWADDR_FMT_plx
             "                            : %s (%s)\n",
             ret, addr, reg->name, reg->desc);
 
@@ -276,7 +276,7 @@ static void etsec_write(void     *opaque,
         }
     }
 
-    DPRINTF("Write 0x%08x @ 0x" TARGET_FMT_plx
+    DPRINTF("Write 0x%08x @ 0x" HWADDR_FMT_plx
             " val:0x%08x->0x%08x : %s (%s)\n",
             (unsigned int)value, addr, before, reg->value,
             reg->name, reg->desc);
diff --git a/hw/net/fsl_etsec/rings.c b/hw/net/fsl_etsec/rings.c
index a32589e33b..788463f1b6 100644
--- a/hw/net/fsl_etsec/rings.c
+++ b/hw/net/fsl_etsec/rings.c
@@ -109,7 +109,7 @@ static void read_buffer_descriptor(eTSEC         *etsec,
 {
     assert(bd != NULL);
 
-    RING_DEBUG("READ Buffer Descriptor @ 0x" TARGET_FMT_plx"\n", addr);
+    RING_DEBUG("READ Buffer Descriptor @ 0x" HWADDR_FMT_plx"\n", addr);
     cpu_physical_memory_read(addr,
                              bd,
                              sizeof(eTSEC_rxtx_bd));
@@ -141,7 +141,7 @@ static void write_buffer_descriptor(eTSEC         *etsec,
         stl_be_p(&bd->bufptr, bd->bufptr);
     }
 
-    RING_DEBUG("Write Buffer Descriptor @ 0x" TARGET_FMT_plx"\n", addr);
+    RING_DEBUG("Write Buffer Descriptor @ 0x" HWADDR_FMT_plx"\n", addr);
     cpu_physical_memory_write(addr,
                               bd,
                               sizeof(eTSEC_rxtx_bd));
diff --git a/hw/net/pcnet.c b/hw/net/pcnet.c
index e63e524913..d456094575 100644
--- a/hw/net/pcnet.c
+++ b/hw/net/pcnet.c
@@ -908,11 +908,11 @@ static void pcnet_rdte_poll(PCNetState *s)
             s->csr[37] = nnrd >> 16;
 #ifdef PCNET_DEBUG
             if (bad) {
-                printf("pcnet: BAD RMD RECORDS AFTER 0x" TARGET_FMT_plx "\n",
+                printf("pcnet: BAD RMD RECORDS AFTER 0x" HWADDR_FMT_plx "\n",
                        crda);
             }
         } else {
-            printf("pcnet: BAD RMD RDA=0x" TARGET_FMT_plx "\n", crda);
+            printf("pcnet: BAD RMD RDA=0x" HWADDR_FMT_plx "\n", crda);
 #endif
         }
     }
diff --git a/hw/net/rocker/rocker.c b/hw/net/rocker/rocker.c
index cf54ddf49d..7ea8eb6ba5 100644
--- a/hw/net/rocker/rocker.c
+++ b/hw/net/rocker/rocker.c
@@ -815,7 +815,7 @@ static void rocker_io_writel(void *opaque, hwaddr addr, uint32_t val)
             }
             break;
         default:
-            DPRINTF("not implemented dma reg write(l) addr=0x" TARGET_FMT_plx
+            DPRINTF("not implemented dma reg write(l) addr=0x" HWADDR_FMT_plx
                     " val=0x%08x (ring %d, addr=0x%02x)\n",
                     addr, val, index, offset);
             break;
@@ -857,7 +857,7 @@ static void rocker_io_writel(void *opaque, hwaddr addr, uint32_t val)
         r->lower32 = 0;
         break;
     default:
-        DPRINTF("not implemented write(l) addr=0x" TARGET_FMT_plx
+        DPRINTF("not implemented write(l) addr=0x" HWADDR_FMT_plx
                 " val=0x%08x\n", addr, val);
         break;
     }
@@ -876,8 +876,8 @@ static void rocker_io_writeq(void *opaque, hwaddr addr, uint64_t val)
             desc_ring_set_base_addr(r->rings[index], val);
             break;
         default:
-            DPRINTF("not implemented dma reg write(q) addr=0x" TARGET_FMT_plx
-                    " val=0x" TARGET_FMT_plx " (ring %d, offset=0x%02x)\n",
+            DPRINTF("not implemented dma reg write(q) addr=0x" HWADDR_FMT_plx
+                    " val=0x" HWADDR_FMT_plx " (ring %d, offset=0x%02x)\n",
                     addr, val, index, offset);
             break;
         }
@@ -895,8 +895,8 @@ static void rocker_io_writeq(void *opaque, hwaddr addr, uint64_t val)
         rocker_port_phys_enable_write(r, val);
         break;
     default:
-        DPRINTF("not implemented write(q) addr=0x" TARGET_FMT_plx
-                " val=0x" TARGET_FMT_plx "\n", addr, val);
+        DPRINTF("not implemented write(q) addr=0x" HWADDR_FMT_plx
+                " val=0x" HWADDR_FMT_plx "\n", addr, val);
         break;
     }
 }
@@ -987,8 +987,8 @@ static const char *rocker_reg_name(void *opaque, hwaddr addr)
 static void rocker_mmio_write(void *opaque, hwaddr addr, uint64_t val,
                               unsigned size)
 {
-    DPRINTF("Write %s addr " TARGET_FMT_plx
-            ", size %u, val " TARGET_FMT_plx "\n",
+    DPRINTF("Write %s addr " HWADDR_FMT_plx
+            ", size %u, val " HWADDR_FMT_plx "\n",
             rocker_reg_name(opaque, addr), addr, size, val);
 
     switch (size) {
@@ -1060,7 +1060,7 @@ static uint32_t rocker_io_readl(void *opaque, hwaddr addr)
             ret = desc_ring_get_credits(r->rings[index]);
             break;
         default:
-            DPRINTF("not implemented dma reg read(l) addr=0x" TARGET_FMT_plx
+            DPRINTF("not implemented dma reg read(l) addr=0x" HWADDR_FMT_plx
                     " (ring %d, addr=0x%02x)\n", addr, index, offset);
             ret = 0;
             break;
@@ -1115,7 +1115,7 @@ static uint32_t rocker_io_readl(void *opaque, hwaddr addr)
         ret = (uint32_t)(r->switch_id >> 32);
         break;
     default:
-        DPRINTF("not implemented read(l) addr=0x" TARGET_FMT_plx "\n", addr);
+        DPRINTF("not implemented read(l) addr=0x" HWADDR_FMT_plx "\n", addr);
         ret = 0;
         break;
     }
@@ -1136,7 +1136,7 @@ static uint64_t rocker_io_readq(void *opaque, hwaddr addr)
             ret = desc_ring_get_base_addr(r->rings[index]);
             break;
         default:
-            DPRINTF("not implemented dma reg read(q) addr=0x" TARGET_FMT_plx
+            DPRINTF("not implemented dma reg read(q) addr=0x" HWADDR_FMT_plx
                     " (ring %d, addr=0x%02x)\n", addr, index, offset);
             ret = 0;
             break;
@@ -1165,7 +1165,7 @@ static uint64_t rocker_io_readq(void *opaque, hwaddr addr)
         ret = r->switch_id;
         break;
     default:
-        DPRINTF("not implemented read(q) addr=0x" TARGET_FMT_plx "\n", addr);
+        DPRINTF("not implemented read(q) addr=0x" HWADDR_FMT_plx "\n", addr);
         ret = 0;
         break;
     }
@@ -1174,7 +1174,7 @@ static uint64_t rocker_io_readq(void *opaque, hwaddr addr)
 
 static uint64_t rocker_mmio_read(void *opaque, hwaddr addr, unsigned size)
 {
-    DPRINTF("Read %s addr " TARGET_FMT_plx ", size %u\n",
+    DPRINTF("Read %s addr " HWADDR_FMT_plx ", size %u\n",
             rocker_reg_name(opaque, addr), addr, size);
 
     switch (size) {
diff --git a/hw/net/rocker/rocker_desc.c b/hw/net/rocker/rocker_desc.c
index f3068c9250..675383db36 100644
--- a/hw/net/rocker/rocker_desc.c
+++ b/hw/net/rocker/rocker_desc.c
@@ -104,7 +104,7 @@ static bool desc_ring_empty(DescRing *ring)
 bool desc_ring_set_base_addr(DescRing *ring, uint64_t base_addr)
 {
     if (base_addr & 0x7) {
-        DPRINTF("ERROR: ring[%d] desc base addr (0x" TARGET_FMT_plx
+        DPRINTF("ERROR: ring[%d] desc base addr (0x" HWADDR_FMT_plx
                 ") not 8-byte aligned\n", ring->index, base_addr);
         return false;
     }
diff --git a/hw/net/xilinx_axienet.c b/hw/net/xilinx_axienet.c
index 990ff3a1c2..7e00965323 100644
--- a/hw/net/xilinx_axienet.c
+++ b/hw/net/xilinx_axienet.c
@@ -524,7 +524,7 @@ static uint64_t enet_read(void *opaque, hwaddr addr, unsigned size)
             if (addr < ARRAY_SIZE(s->regs)) {
                 r = s->regs[addr];
             }
-            DENET(qemu_log("%s addr=" TARGET_FMT_plx " v=%x\n",
+            DENET(qemu_log("%s addr=" HWADDR_FMT_plx " v=%x\n",
                             __func__, addr * 4, r));
             break;
     }
@@ -630,7 +630,7 @@ static void enet_write(void *opaque, hwaddr addr,
             break;
 
         default:
-            DENET(qemu_log("%s addr=" TARGET_FMT_plx " v=%x\n",
+            DENET(qemu_log("%s addr=" HWADDR_FMT_plx " v=%x\n",
                            __func__, addr * 4, (unsigned)value));
             if (addr < ARRAY_SIZE(s->regs)) {
                 s->regs[addr] = value;
diff --git a/hw/net/xilinx_ethlite.c b/hw/net/xilinx_ethlite.c
index 6e09f7e422..99c22819ea 100644
--- a/hw/net/xilinx_ethlite.c
+++ b/hw/net/xilinx_ethlite.c
@@ -99,7 +99,7 @@ eth_read(void *opaque, hwaddr addr, unsigned int size)
         case R_RX_CTRL1:
         case R_RX_CTRL0:
             r = s->regs[addr];
-            D(qemu_log("%s " TARGET_FMT_plx "=%x\n", __func__, addr * 4, r));
+            D(qemu_log("%s " HWADDR_FMT_plx "=%x\n", __func__, addr * 4, r));
             break;
 
         default:
@@ -125,7 +125,7 @@ eth_write(void *opaque, hwaddr addr,
             if (addr == R_TX_CTRL1)
                 base = 0x800 / 4;
 
-            D(qemu_log("%s addr=" TARGET_FMT_plx " val=%x\n",
+            D(qemu_log("%s addr=" HWADDR_FMT_plx " val=%x\n",
                        __func__, addr * 4, value));
             if ((value & (CTRL_P | CTRL_S)) == CTRL_S) {
                 qemu_send_packet(qemu_get_queue(s->nic),
@@ -155,7 +155,7 @@ eth_write(void *opaque, hwaddr addr,
         case R_TX_LEN0:
         case R_TX_LEN1:
         case R_TX_GIE0:
-            D(qemu_log("%s addr=" TARGET_FMT_plx " val=%x\n",
+            D(qemu_log("%s addr=" HWADDR_FMT_plx " val=%x\n",
                        __func__, addr * 4, value));
             s->regs[addr] = value;
             break;
diff --git a/hw/pci-bridge/pci_expander_bridge.c b/hw/pci-bridge/pci_expander_bridge.c
index 870d9bab11..e752a21292 100644
--- a/hw/pci-bridge/pci_expander_bridge.c
+++ b/hw/pci-bridge/pci_expander_bridge.c
@@ -155,7 +155,7 @@ static char *pxb_host_ofw_unit_address(const SysBusDevice *dev)
     main_host_sbd = SYS_BUS_DEVICE(main_host);
 
     if (main_host_sbd->num_mmio > 0) {
-        return g_strdup_printf(TARGET_FMT_plx ",%x",
+        return g_strdup_printf(HWADDR_FMT_plx ",%x",
                                main_host_sbd->mmio[0].addr, position + 1);
     }
     if (main_host_sbd->num_pio > 0) {
diff --git a/hw/pci-host/bonito.c b/hw/pci-host/bonito.c
index f04f3ad668..e55e4d2950 100644
--- a/hw/pci-host/bonito.c
+++ b/hw/pci-host/bonito.c
@@ -254,7 +254,7 @@ static void bonito_writel(void *opaque, hwaddr addr,
 
     saddr = addr >> 2;
 
-    DPRINTF("bonito_writel "TARGET_FMT_plx" val %lx saddr %x\n",
+    DPRINTF("bonito_writel "HWADDR_FMT_plx" val %lx saddr %x\n",
             addr, val, saddr);
     switch (saddr) {
     case BONITO_BONPONCFG:
@@ -317,7 +317,7 @@ static uint64_t bonito_readl(void *opaque, hwaddr addr,
 
     saddr = addr >> 2;
 
-    DPRINTF("bonito_readl "TARGET_FMT_plx"\n", addr);
+    DPRINTF("bonito_readl "HWADDR_FMT_plx"\n", addr);
     switch (saddr) {
     case BONITO_INTISR:
         return s->regs[saddr];
@@ -342,7 +342,7 @@ static void bonito_pciconf_writel(void *opaque, hwaddr addr,
     PCIBonitoState *s = opaque;
     PCIDevice *d = PCI_DEVICE(s);
 
-    DPRINTF("bonito_pciconf_writel "TARGET_FMT_plx" val %lx\n", addr, val);
+    DPRINTF("bonito_pciconf_writel "HWADDR_FMT_plx" val %lx\n", addr, val);
     d->config_write(d, addr, val, 4);
 }
 
@@ -353,7 +353,7 @@ static uint64_t bonito_pciconf_readl(void *opaque, hwaddr addr,
     PCIBonitoState *s = opaque;
     PCIDevice *d = PCI_DEVICE(s);
 
-    DPRINTF("bonito_pciconf_readl "TARGET_FMT_plx"\n", addr);
+    DPRINTF("bonito_pciconf_readl "HWADDR_FMT_plx"\n", addr);
     return d->config_read(d, addr, 4);
 }
 
@@ -469,7 +469,7 @@ static uint32_t bonito_sbridge_pciaddr(void *opaque, hwaddr addr)
     regno = (cfgaddr & BONITO_PCICONF_REG_MASK_HW) >> BONITO_PCICONF_REG_OFFSET;
 
     if (idsel == 0) {
-        error_report("error in bonito pci config address 0x" TARGET_FMT_plx
+        error_report("error in bonito pci config address 0x" HWADDR_FMT_plx
                      ",pcimap_cfg=0x%x", addr, s->regs[BONITO_PCIMAP_CFG]);
         exit(1);
     }
@@ -489,7 +489,7 @@ static void bonito_spciconf_write(void *opaque, hwaddr addr, uint64_t val,
     uint32_t pciaddr;
     uint16_t status;
 
-    DPRINTF("bonito_spciconf_write "TARGET_FMT_plx" size %d val %lx\n",
+    DPRINTF("bonito_spciconf_write "HWADDR_FMT_plx" size %d val %lx\n",
             addr, size, val);
 
     pciaddr = bonito_sbridge_pciaddr(s, addr);
@@ -519,7 +519,7 @@ static uint64_t bonito_spciconf_read(void *opaque, hwaddr addr, unsigned size)
     uint32_t pciaddr;
     uint16_t status;
 
-    DPRINTF("bonito_spciconf_read "TARGET_FMT_plx" size %d\n", addr, size);
+    DPRINTF("bonito_spciconf_read "HWADDR_FMT_plx" size %d\n", addr, size);
 
     pciaddr = bonito_sbridge_pciaddr(s, addr);
 
diff --git a/hw/pci-host/ppce500.c b/hw/pci-host/ppce500.c
index 568849e930..38814247f2 100644
--- a/hw/pci-host/ppce500.c
+++ b/hw/pci-host/ppce500.c
@@ -189,7 +189,7 @@ static uint64_t pci_reg_read4(void *opaque, hwaddr addr,
         break;
     }
 
-    pci_debug("%s: win:%lx(addr:" TARGET_FMT_plx ") -> value:%x\n", __func__,
+    pci_debug("%s: win:%lx(addr:" HWADDR_FMT_plx ") -> value:%x\n", __func__,
               win, addr, value);
     return value;
 }
@@ -268,7 +268,7 @@ static void pci_reg_write4(void *opaque, hwaddr addr,
 
     win = addr & 0xfe0;
 
-    pci_debug("%s: value:%x -> win:%lx(addr:" TARGET_FMT_plx ")\n",
+    pci_debug("%s: value:%x -> win:%lx(addr:" HWADDR_FMT_plx ")\n",
               __func__, (unsigned)value, win, addr);
 
     switch (win) {
diff --git a/hw/pci/pci_host.c b/hw/pci/pci_host.c
index eaf217ff55..7f9f75239c 100644
--- a/hw/pci/pci_host.c
+++ b/hw/pci/pci_host.c
@@ -143,7 +143,7 @@ static void pci_host_config_write(void *opaque, hwaddr addr,
 {
     PCIHostState *s = opaque;
 
-    PCI_DPRINTF("%s addr " TARGET_FMT_plx " len %d val %"PRIx64"\n",
+    PCI_DPRINTF("%s addr " HWADDR_FMT_plx " len %d val %"PRIx64"\n",
                 __func__, addr, len, val);
     if (addr != 0 || len != 4) {
         return;
@@ -157,7 +157,7 @@ static uint64_t pci_host_config_read(void *opaque, hwaddr addr,
     PCIHostState *s = opaque;
     uint32_t val = s->config_reg;
 
-    PCI_DPRINTF("%s addr " TARGET_FMT_plx " len %d val %"PRIx32"\n",
+    PCI_DPRINTF("%s addr " HWADDR_FMT_plx " len %d val %"PRIx32"\n",
                 __func__, addr, len, val);
     return val;
 }
diff --git a/hw/ppc/ppc4xx_sdram.c b/hw/ppc/ppc4xx_sdram.c
index a24c80b1d2..4501fb28a5 100644
--- a/hw/ppc/ppc4xx_sdram.c
+++ b/hw/ppc/ppc4xx_sdram.c
@@ -500,7 +500,7 @@ static uint32_t sdram_ddr2_bcr(hwaddr ram_base, hwaddr ram_size)
         bcr = 0x8000;
         break;
     default:
-        error_report("invalid RAM size " TARGET_FMT_plx, ram_size);
+        error_report("invalid RAM size " HWADDR_FMT_plx, ram_size);
         return 0;
     }
     bcr |= ram_base >> 2 & 0xffe00000;
diff --git a/hw/rtc/exynos4210_rtc.c b/hw/rtc/exynos4210_rtc.c
index d1620c7a2a..2b8a38a296 100644
--- a/hw/rtc/exynos4210_rtc.c
+++ b/hw/rtc/exynos4210_rtc.c
@@ -374,7 +374,7 @@ static uint64_t exynos4210_rtc_read(void *opaque, hwaddr offset,
 
     default:
         qemu_log_mask(LOG_GUEST_ERROR,
-                      "exynos4210.rtc: bad read offset " TARGET_FMT_plx,
+                      "exynos4210.rtc: bad read offset " HWADDR_FMT_plx,
                       offset);
         break;
     }
@@ -508,7 +508,7 @@ static void exynos4210_rtc_write(void *opaque, hwaddr offset,
 
     default:
         qemu_log_mask(LOG_GUEST_ERROR,
-                      "exynos4210.rtc: bad write offset " TARGET_FMT_plx,
+                      "exynos4210.rtc: bad write offset " HWADDR_FMT_plx,
                       offset);
         break;
 
diff --git a/hw/sh4/sh7750.c b/hw/sh4/sh7750.c
index c77792d150..ebe0fd96d9 100644
--- a/hw/sh4/sh7750.c
+++ b/hw/sh4/sh7750.c
@@ -207,13 +207,13 @@ static void portb_changed(SH7750State *s, uint16_t prev)
 
 static void error_access(const char *kind, hwaddr addr)
 {
-    fprintf(stderr, "%s to %s (0x" TARGET_FMT_plx ") not supported\n",
+    fprintf(stderr, "%s to %s (0x" HWADDR_FMT_plx ") not supported\n",
             kind, regname(addr), addr);
 }
 
 static void ignore_access(const char *kind, hwaddr addr)
 {
-    fprintf(stderr, "%s to %s (0x" TARGET_FMT_plx ") ignored\n",
+    fprintf(stderr, "%s to %s (0x" HWADDR_FMT_plx ") ignored\n",
             kind, regname(addr), addr);
 }
 
diff --git a/hw/ssi/xilinx_spi.c b/hw/ssi/xilinx_spi.c
index b2819a7ff0..552927622f 100644
--- a/hw/ssi/xilinx_spi.c
+++ b/hw/ssi/xilinx_spi.c
@@ -232,7 +232,7 @@ spi_read(void *opaque, hwaddr addr, unsigned int size)
         break;
 
     }
-    DB_PRINT("addr=" TARGET_FMT_plx " = %x\n", addr * 4, r);
+    DB_PRINT("addr=" HWADDR_FMT_plx " = %x\n", addr * 4, r);
     xlx_spi_update_irq(s);
     return r;
 }
@@ -244,7 +244,7 @@ spi_write(void *opaque, hwaddr addr,
     XilinxSPI *s = opaque;
     uint32_t value = val64;
 
-    DB_PRINT("addr=" TARGET_FMT_plx " = %x\n", addr, value);
+    DB_PRINT("addr=" HWADDR_FMT_plx " = %x\n", addr, value);
     addr >>= 2;
     switch (addr) {
     case R_SRR:
diff --git a/hw/ssi/xilinx_spips.c b/hw/ssi/xilinx_spips.c
index 1e9dba2039..97009d3a5d 100644
--- a/hw/ssi/xilinx_spips.c
+++ b/hw/ssi/xilinx_spips.c
@@ -887,7 +887,7 @@ static uint64_t xilinx_spips_read(void *opaque, hwaddr addr,
     case R_INTR_STATUS:
         ret = s->regs[addr] & IXR_ALL;
         s->regs[addr] = 0;
-        DB_PRINT_L(0, "addr=" TARGET_FMT_plx " = %x\n", addr * 4, ret);
+        DB_PRINT_L(0, "addr=" HWADDR_FMT_plx " = %x\n", addr * 4, ret);
         xilinx_spips_update_ixr(s);
         return ret;
     case R_INTR_MASK:
@@ -916,12 +916,12 @@ static uint64_t xilinx_spips_read(void *opaque, hwaddr addr,
         if (!(s->regs[R_CONFIG] & R_CONFIG_ENDIAN)) {
             ret <<= 8 * shortfall;
         }
-        DB_PRINT_L(0, "addr=" TARGET_FMT_plx " = %x\n", addr * 4, ret);
+        DB_PRINT_L(0, "addr=" HWADDR_FMT_plx " = %x\n", addr * 4, ret);
         xilinx_spips_check_flush(s);
         xilinx_spips_update_ixr(s);
         return ret;
     }
-    DB_PRINT_L(0, "addr=" TARGET_FMT_plx " = %x\n", addr * 4,
+    DB_PRINT_L(0, "addr=" HWADDR_FMT_plx " = %x\n", addr * 4,
                s->regs[addr] & mask);
     return s->regs[addr] & mask;
 
@@ -971,7 +971,7 @@ static void xilinx_spips_write(void *opaque, hwaddr addr,
     XilinxSPIPS *s = opaque;
     bool try_flush = true;
 
-    DB_PRINT_L(0, "addr=" TARGET_FMT_plx " = %x\n", addr, (unsigned)value);
+    DB_PRINT_L(0, "addr=" HWADDR_FMT_plx " = %x\n", addr, (unsigned)value);
     addr >>= 2;
     switch (addr) {
     case R_CONFIG:
diff --git a/hw/timer/digic-timer.c b/hw/timer/digic-timer.c
index d5186f4454..973eab4386 100644
--- a/hw/timer/digic-timer.c
+++ b/hw/timer/digic-timer.c
@@ -76,7 +76,7 @@ static uint64_t digic_timer_read(void *opaque, hwaddr offset, unsigned size)
     default:
         qemu_log_mask(LOG_UNIMP,
                       "digic-timer: read access to unknown register 0x"
-                      TARGET_FMT_plx "\n", offset);
+                      HWADDR_FMT_plx "\n", offset);
     }
 
     return ret;
@@ -116,7 +116,7 @@ static void digic_timer_write(void *opaque, hwaddr offset,
     default:
         qemu_log_mask(LOG_UNIMP,
                       "digic-timer: read access to unknown register 0x"
-                      TARGET_FMT_plx "\n", offset);
+                      HWADDR_FMT_plx "\n", offset);
     }
 }
 
diff --git a/hw/timer/etraxfs_timer.c b/hw/timer/etraxfs_timer.c
index ecc2831baf..0205b49912 100644
--- a/hw/timer/etraxfs_timer.c
+++ b/hw/timer/etraxfs_timer.c
@@ -324,7 +324,7 @@ timer_write(void *opaque, hwaddr addr,
             t->rw_ack_intr = 0;
             break;
         default:
-            printf ("%s " TARGET_FMT_plx " %x\n",
+            printf ("%s " HWADDR_FMT_plx " %x\n",
                 __func__, addr, value);
             break;
     }
diff --git a/hw/timer/exynos4210_mct.c b/hw/timer/exynos4210_mct.c
index e175a9f5b9..c17b247da3 100644
--- a/hw/timer/exynos4210_mct.c
+++ b/hw/timer/exynos4210_mct.c
@@ -1445,7 +1445,7 @@ static void exynos4210_mct_write(void *opaque, hwaddr offset,
     case L0_ICNTO: case L1_ICNTO:
     case L0_FRCNTO: case L1_FRCNTO:
         qemu_log_mask(LOG_GUEST_ERROR,
-                      "exynos4210.mct: write to RO register " TARGET_FMT_plx,
+                      "exynos4210.mct: write to RO register " HWADDR_FMT_plx,
                       offset);
         break;
 
diff --git a/hw/timer/exynos4210_pwm.c b/hw/timer/exynos4210_pwm.c
index 02924a9e5b..3528d0f33a 100644
--- a/hw/timer/exynos4210_pwm.c
+++ b/hw/timer/exynos4210_pwm.c
@@ -257,7 +257,7 @@ static uint64_t exynos4210_pwm_read(void *opaque, hwaddr offset,
 
     default:
         qemu_log_mask(LOG_GUEST_ERROR,
-                      "exynos4210.pwm: bad read offset " TARGET_FMT_plx,
+                      "exynos4210.pwm: bad read offset " HWADDR_FMT_plx,
                       offset);
         break;
     }
@@ -352,7 +352,7 @@ static void exynos4210_pwm_write(void *opaque, hwaddr offset,
 
     default:
         qemu_log_mask(LOG_GUEST_ERROR,
-                      "exynos4210.pwm: bad write offset " TARGET_FMT_plx,
+                      "exynos4210.pwm: bad write offset " HWADDR_FMT_plx,
                       offset);
         break;
 
diff --git a/hw/virtio/virtio-mmio.c b/hw/virtio/virtio-mmio.c
index 103260ec15..23ba625eb6 100644
--- a/hw/virtio/virtio-mmio.c
+++ b/hw/virtio/virtio-mmio.c
@@ -829,10 +829,10 @@ static char *virtio_mmio_bus_get_dev_path(DeviceState *dev)
     assert(section.mr);
 
     if (proxy_path) {
-        path = g_strdup_printf("%s/virtio-mmio@" TARGET_FMT_plx, proxy_path,
+        path = g_strdup_printf("%s/virtio-mmio@" HWADDR_FMT_plx, proxy_path,
                                section.offset_within_address_space);
     } else {
-        path = g_strdup_printf("virtio-mmio@" TARGET_FMT_plx,
+        path = g_strdup_printf("virtio-mmio@" HWADDR_FMT_plx,
                                section.offset_within_address_space);
     }
     memory_region_unref(section.mr);
diff --git a/hw/xen/xen_pt.c b/hw/xen/xen_pt.c
index 0ec7e52183..8db0532632 100644
--- a/hw/xen/xen_pt.c
+++ b/hw/xen/xen_pt.c
@@ -434,7 +434,7 @@ static uint64_t xen_pt_bar_read(void *o, hwaddr addr,
     PCIDevice *d = o;
     /* if this function is called, that probably means that there is a
      * misconfiguration of the IOMMU. */
-    XEN_PT_ERR(d, "Should not read BAR through QEMU. @0x"TARGET_FMT_plx"\n",
+    XEN_PT_ERR(d, "Should not read BAR through QEMU. @0x"HWADDR_FMT_plx"\n",
                addr);
     return 0;
 }
@@ -443,7 +443,7 @@ static void xen_pt_bar_write(void *o, hwaddr addr, uint64_t val,
 {
     PCIDevice *d = o;
     /* Same comment as xen_pt_bar_read function */
-    XEN_PT_ERR(d, "Should not write BAR through QEMU. @0x"TARGET_FMT_plx"\n",
+    XEN_PT_ERR(d, "Should not write BAR through QEMU. @0x"HWADDR_FMT_plx"\n",
                addr);
 }
 
diff --git a/include/exec/hwaddr.h b/include/exec/hwaddr.h
index 8f16d179a8..50fbb2d96c 100644
--- a/include/exec/hwaddr.h
+++ b/include/exec/hwaddr.h
@@ -10,7 +10,7 @@
 
 typedef uint64_t hwaddr;
 #define HWADDR_MAX UINT64_MAX
-#define TARGET_FMT_plx "%016" PRIx64
+#define HWADDR_FMT_plx "%016" PRIx64
 #define HWADDR_PRId PRId64
 #define HWADDR_PRIi PRIi64
 #define HWADDR_PRIo PRIo64
diff --git a/monitor/misc.c b/monitor/misc.c
index bf3f1c67ca..fa0a42c261 100644
--- a/monitor/misc.c
+++ b/monitor/misc.c
@@ -566,7 +566,7 @@ static void memory_dump(Monitor *mon, int count, int format, int wsize,
 
     while (len > 0) {
         if (is_physical) {
-            monitor_printf(mon, TARGET_FMT_plx ":", addr);
+            monitor_printf(mon, HWADDR_FMT_plx ":", addr);
         } else {
             monitor_printf(mon, TARGET_FMT_lx ":", (target_ulong)addr);
         }
diff --git a/softmmu/memory.c b/softmmu/memory.c
index e05332d07f..9d64efca26 100644
--- a/softmmu/memory.c
+++ b/softmmu/memory.c
@@ -1281,7 +1281,7 @@ static uint64_t unassigned_mem_read(void *opaque, hwaddr addr,
                                     unsigned size)
 {
 #ifdef DEBUG_UNASSIGNED
-    printf("Unassigned mem read " TARGET_FMT_plx "\n", addr);
+    printf("Unassigned mem read " HWADDR_FMT_plx "\n", addr);
 #endif
     return 0;
 }
@@ -1290,7 +1290,7 @@ static void unassigned_mem_write(void *opaque, hwaddr addr,
                                  uint64_t val, unsigned size)
 {
 #ifdef DEBUG_UNASSIGNED
-    printf("Unassigned mem write " TARGET_FMT_plx " = 0x%"PRIx64"\n", addr, val);
+    printf("Unassigned mem write " HWADDR_FMT_plx " = 0x%"PRIx64"\n", addr, val);
 #endif
 }
 
@@ -3220,9 +3220,9 @@ static void mtree_print_mr(const MemoryRegion *mr, unsigned int level,
             for (i = 0; i < level; i++) {
                 qemu_printf(MTREE_INDENT);
             }
-            qemu_printf(TARGET_FMT_plx "-" TARGET_FMT_plx
-                        " (prio %d, %s%s): alias %s @%s " TARGET_FMT_plx
-                        "-" TARGET_FMT_plx "%s",
+            qemu_printf(HWADDR_FMT_plx "-" HWADDR_FMT_plx
+                        " (prio %d, %s%s): alias %s @%s " HWADDR_FMT_plx
+                        "-" HWADDR_FMT_plx "%s",
                         cur_start, cur_end,
                         mr->priority,
                         mr->nonvolatile ? "nv-" : "",
@@ -3242,7 +3242,7 @@ static void mtree_print_mr(const MemoryRegion *mr, unsigned int level,
             for (i = 0; i < level; i++) {
                 qemu_printf(MTREE_INDENT);
             }
-            qemu_printf(TARGET_FMT_plx "-" TARGET_FMT_plx
+            qemu_printf(HWADDR_FMT_plx "-" HWADDR_FMT_plx
                         " (prio %d, %s%s): %s%s",
                         cur_start, cur_end,
                         mr->priority,
@@ -3329,8 +3329,8 @@ static void mtree_print_flatview(gpointer key, gpointer value,
     while (n--) {
         mr = range->mr;
         if (range->offset_in_region) {
-            qemu_printf(MTREE_INDENT TARGET_FMT_plx "-" TARGET_FMT_plx
-                        " (prio %d, %s%s): %s @" TARGET_FMT_plx,
+            qemu_printf(MTREE_INDENT HWADDR_FMT_plx "-" HWADDR_FMT_plx
+                        " (prio %d, %s%s): %s @" HWADDR_FMT_plx,
                         int128_get64(range->addr.start),
                         int128_get64(range->addr.start)
                         + MR_SIZE(range->addr.size),
@@ -3340,7 +3340,7 @@ static void mtree_print_flatview(gpointer key, gpointer value,
                         memory_region_name(mr),
                         range->offset_in_region);
         } else {
-            qemu_printf(MTREE_INDENT TARGET_FMT_plx "-" TARGET_FMT_plx
+            qemu_printf(MTREE_INDENT HWADDR_FMT_plx "-" HWADDR_FMT_plx
                         " (prio %d, %s%s): %s",
                         int128_get64(range->addr.start),
                         int128_get64(range->addr.start)
diff --git a/softmmu/memory_mapping.c b/softmmu/memory_mapping.c
index f6f0a829fd..d7f1d096e0 100644
--- a/softmmu/memory_mapping.c
+++ b/softmmu/memory_mapping.c
@@ -241,8 +241,8 @@ static void guest_phys_block_add_section(GuestPhysListener *g,
     }
 
 #ifdef DEBUG_GUEST_PHYS_REGION_ADD
-    fprintf(stderr, "%s: target_start=" TARGET_FMT_plx " target_end="
-            TARGET_FMT_plx ": %s (count: %u)\n", __func__, target_start,
+    fprintf(stderr, "%s: target_start=" HWADDR_FMT_plx " target_end="
+            HWADDR_FMT_plx ": %s (count: %u)\n", __func__, target_start,
             target_end, predecessor ? "joined" : "added", g->list->num);
 #endif
 }
diff --git a/softmmu/physmem.c b/softmmu/physmem.c
index edec095c7a..bf585e45a8 100644
--- a/softmmu/physmem.c
+++ b/softmmu/physmem.c
@@ -2475,7 +2475,7 @@ static MemTxResult subpage_read(void *opaque, hwaddr addr, uint64_t *data,
     MemTxResult res;
 
 #if defined(DEBUG_SUBPAGE)
-    printf("%s: subpage %p len %u addr " TARGET_FMT_plx "\n", __func__,
+    printf("%s: subpage %p len %u addr " HWADDR_FMT_plx "\n", __func__,
            subpage, len, addr);
 #endif
     res = flatview_read(subpage->fv, addr + subpage->base, attrs, buf, len);
@@ -2493,7 +2493,7 @@ static MemTxResult subpage_write(void *opaque, hwaddr addr,
     uint8_t buf[8];
 
 #if defined(DEBUG_SUBPAGE)
-    printf("%s: subpage %p len %u addr " TARGET_FMT_plx
+    printf("%s: subpage %p len %u addr " HWADDR_FMT_plx
            " value %"PRIx64"\n",
            __func__, subpage, len, addr, value);
 #endif
@@ -2507,7 +2507,7 @@ static bool subpage_accepts(void *opaque, hwaddr addr,
 {
     subpage_t *subpage = opaque;
 #if defined(DEBUG_SUBPAGE)
-    printf("%s: subpage %p %c len %u addr " TARGET_FMT_plx "\n",
+    printf("%s: subpage %p %c len %u addr " HWADDR_FMT_plx "\n",
            __func__, subpage, is_write ? 'w' : 'r', len, addr);
 #endif
 
@@ -2558,7 +2558,7 @@ static subpage_t *subpage_init(FlatView *fv, hwaddr base)
                           NULL, TARGET_PAGE_SIZE);
     mmio->iomem.subpage = true;
 #if defined(DEBUG_SUBPAGE)
-    printf("%s: %p base " TARGET_FMT_plx " len %08x\n", __func__,
+    printf("%s: %p base " HWADDR_FMT_plx " len %08x\n", __func__,
            mmio, base, TARGET_PAGE_SIZE);
 #endif
 
@@ -3703,7 +3703,7 @@ void mtree_print_dispatch(AddressSpaceDispatch *d, MemoryRegion *root)
         const char *names[] = { " [unassigned]", " [not dirty]",
                                 " [ROM]", " [watch]" };
 
-        qemu_printf("      #%d @" TARGET_FMT_plx ".." TARGET_FMT_plx
+        qemu_printf("      #%d @" HWADDR_FMT_plx ".." HWADDR_FMT_plx
                     " %s%s%s%s%s",
             i,
             s->offset_within_address_space,
diff --git a/target/i386/monitor.c b/target/i386/monitor.c
index 8e4b4d600c..ad5b7b8bb5 100644
--- a/target/i386/monitor.c
+++ b/target/i386/monitor.c
@@ -57,7 +57,7 @@ static void print_pte(Monitor *mon, CPUArchState *env, hwaddr addr,
 {
     addr = addr_canonical(env, addr);
 
-    monitor_printf(mon, TARGET_FMT_plx ": " TARGET_FMT_plx
+    monitor_printf(mon, HWADDR_FMT_plx ": " HWADDR_FMT_plx
                    " %c%c%c%c%c%c%c%c%c\n",
                    addr,
                    pte & mask,
@@ -258,8 +258,8 @@ static void mem_print(Monitor *mon, CPUArchState *env,
     prot1 = *plast_prot;
     if (prot != prot1) {
         if (*pstart != -1) {
-            monitor_printf(mon, TARGET_FMT_plx "-" TARGET_FMT_plx " "
-                           TARGET_FMT_plx " %c%c%c\n",
+            monitor_printf(mon, HWADDR_FMT_plx "-" HWADDR_FMT_plx " "
+                           HWADDR_FMT_plx " %c%c%c\n",
                            addr_canonical(env, *pstart),
                            addr_canonical(env, end),
                            addr_canonical(env, end - *pstart),
diff --git a/target/loongarch/tlb_helper.c b/target/loongarch/tlb_helper.c
index c6d1de50fe..cce1db1e0a 100644
--- a/target/loongarch/tlb_helper.c
+++ b/target/loongarch/tlb_helper.c
@@ -655,7 +655,7 @@ bool loongarch_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
                      physical & TARGET_PAGE_MASK, prot,
                      mmu_idx, TARGET_PAGE_SIZE);
         qemu_log_mask(CPU_LOG_MMU,
-                      "%s address=%" VADDR_PRIx " physical " TARGET_FMT_plx
+                      "%s address=%" VADDR_PRIx " physical " HWADDR_FMT_plx
                       " prot %d\n", __func__, address, physical, prot);
         return true;
     } else {
diff --git a/target/microblaze/op_helper.c b/target/microblaze/op_helper.c
index 5b745d0928..f6378030b7 100644
--- a/target/microblaze/op_helper.c
+++ b/target/microblaze/op_helper.c
@@ -403,7 +403,7 @@ void mb_cpu_transaction_failed(CPUState *cs, hwaddr physaddr, vaddr addr,
     CPUMBState *env = &cpu->env;
 
     qemu_log_mask(CPU_LOG_INT, "Transaction failed: vaddr 0x%" VADDR_PRIx
-                  " physaddr 0x" TARGET_FMT_plx " size %d access type %s\n",
+                  " physaddr 0x" HWADDR_FMT_plx " size %d access type %s\n",
                   addr, physaddr, size,
                   access_type == MMU_INST_FETCH ? "INST_FETCH" :
                   (access_type == MMU_DATA_LOAD ? "DATA_LOAD" : "DATA_STORE"));
diff --git a/target/mips/tcg/sysemu/tlb_helper.c b/target/mips/tcg/sysemu/tlb_helper.c
index 9d16859c0a..e5e1e9dd3f 100644
--- a/target/mips/tcg/sysemu/tlb_helper.c
+++ b/target/mips/tcg/sysemu/tlb_helper.c
@@ -924,7 +924,7 @@ bool mips_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
     switch (ret) {
     case TLBRET_MATCH:
         qemu_log_mask(CPU_LOG_MMU,
-                      "%s address=%" VADDR_PRIx " physical " TARGET_FMT_plx
+                      "%s address=%" VADDR_PRIx " physical " HWADDR_FMT_plx
                       " prot %d\n", __func__, address, physical, prot);
         break;
     default:
diff --git a/target/ppc/mmu-hash32.c b/target/ppc/mmu-hash32.c
index cc091c3e62..3976416840 100644
--- a/target/ppc/mmu-hash32.c
+++ b/target/ppc/mmu-hash32.c
@@ -346,24 +346,24 @@ static hwaddr ppc_hash32_htab_lookup(PowerPCCPU *cpu,
     ptem = (vsid << 7) | (pgidx >> 10);
 
     /* Page address translation */
-    qemu_log_mask(CPU_LOG_MMU, "htab_base " TARGET_FMT_plx
-            " htab_mask " TARGET_FMT_plx
-            " hash " TARGET_FMT_plx "\n",
+    qemu_log_mask(CPU_LOG_MMU, "htab_base " HWADDR_FMT_plx
+            " htab_mask " HWADDR_FMT_plx
+            " hash " HWADDR_FMT_plx "\n",
             ppc_hash32_hpt_base(cpu), ppc_hash32_hpt_mask(cpu), hash);
 
     /* Primary PTEG lookup */
-    qemu_log_mask(CPU_LOG_MMU, "0 htab=" TARGET_FMT_plx "/" TARGET_FMT_plx
+    qemu_log_mask(CPU_LOG_MMU, "0 htab=" HWADDR_FMT_plx "/" HWADDR_FMT_plx
             " vsid=%" PRIx32 " ptem=%" PRIx32
-            " hash=" TARGET_FMT_plx "\n",
+            " hash=" HWADDR_FMT_plx "\n",
             ppc_hash32_hpt_base(cpu), ppc_hash32_hpt_mask(cpu),
             vsid, ptem, hash);
     pteg_off = get_pteg_offset32(cpu, hash);
     pte_offset = ppc_hash32_pteg_search(cpu, pteg_off, 0, ptem, pte);
     if (pte_offset == -1) {
         /* Secondary PTEG lookup */
-        qemu_log_mask(CPU_LOG_MMU, "1 htab=" TARGET_FMT_plx "/" TARGET_FMT_plx
+        qemu_log_mask(CPU_LOG_MMU, "1 htab=" HWADDR_FMT_plx "/" HWADDR_FMT_plx
                 " vsid=%" PRIx32 " api=%" PRIx32
-                " hash=" TARGET_FMT_plx "\n", ppc_hash32_hpt_base(cpu),
+                " hash=" HWADDR_FMT_plx "\n", ppc_hash32_hpt_base(cpu),
                 ppc_hash32_hpt_mask(cpu), vsid, ptem, ~hash);
         pteg_off = get_pteg_offset32(cpu, ~hash);
         pte_offset = ppc_hash32_pteg_search(cpu, pteg_off, 1, ptem, pte);
diff --git a/target/ppc/mmu-hash64.c b/target/ppc/mmu-hash64.c
index b9b31fd276..900f906990 100644
--- a/target/ppc/mmu-hash64.c
+++ b/target/ppc/mmu-hash64.c
@@ -697,15 +697,15 @@ static hwaddr ppc_hash64_htab_lookup(PowerPCCPU *cpu,
 
     /* Page address translation */
     qemu_log_mask(CPU_LOG_MMU,
-            "htab_base " TARGET_FMT_plx " htab_mask " TARGET_FMT_plx
-            " hash " TARGET_FMT_plx "\n",
+            "htab_base " HWADDR_FMT_plx " htab_mask " HWADDR_FMT_plx
+            " hash " HWADDR_FMT_plx "\n",
             ppc_hash64_hpt_base(cpu), ppc_hash64_hpt_mask(cpu), hash);
 
     /* Primary PTEG lookup */
     qemu_log_mask(CPU_LOG_MMU,
-            "0 htab=" TARGET_FMT_plx "/" TARGET_FMT_plx
+            "0 htab=" HWADDR_FMT_plx "/" HWADDR_FMT_plx
             " vsid=" TARGET_FMT_lx " ptem=" TARGET_FMT_lx
-            " hash=" TARGET_FMT_plx "\n",
+            " hash=" HWADDR_FMT_plx "\n",
             ppc_hash64_hpt_base(cpu), ppc_hash64_hpt_mask(cpu),
             vsid, ptem,  hash);
     ptex = ppc_hash64_pteg_search(cpu, hash, sps, ptem, pte, pshift);
@@ -714,9 +714,9 @@ static hwaddr ppc_hash64_htab_lookup(PowerPCCPU *cpu,
         /* Secondary PTEG lookup */
         ptem |= HPTE64_V_SECONDARY;
         qemu_log_mask(CPU_LOG_MMU,
-                "1 htab=" TARGET_FMT_plx "/" TARGET_FMT_plx
+                "1 htab=" HWADDR_FMT_plx "/" HWADDR_FMT_plx
                 " vsid=" TARGET_FMT_lx " api=" TARGET_FMT_lx
-                " hash=" TARGET_FMT_plx "\n", ppc_hash64_hpt_base(cpu),
+                " hash=" HWADDR_FMT_plx "\n", ppc_hash64_hpt_base(cpu),
                 ppc_hash64_hpt_mask(cpu), vsid, ptem, ~hash);
 
         ptex = ppc_hash64_pteg_search(cpu, ~hash, sps, ptem, pte, pshift);
diff --git a/target/ppc/mmu_common.c b/target/ppc/mmu_common.c
index 8901f4d134..7235a4befe 100644
--- a/target/ppc/mmu_common.c
+++ b/target/ppc/mmu_common.c
@@ -252,7 +252,7 @@ static int ppc6xx_tlb_check(CPUPPCState *env, mmu_ctx_t *ctx,
     }
     if (best != -1) {
     done:
-        qemu_log_mask(CPU_LOG_MMU, "found TLB at addr " TARGET_FMT_plx
+        qemu_log_mask(CPU_LOG_MMU, "found TLB at addr " HWADDR_FMT_plx
                       " prot=%01x ret=%d\n",
                       ctx->raddr & TARGET_PAGE_MASK, ctx->prot, ret);
         /* Update page flags */
@@ -328,7 +328,7 @@ static int get_bat_6xx_tlb(CPUPPCState *env, mmu_ctx_t *ctx,
                 ctx->prot = prot;
                 ret = check_prot(ctx->prot, access_type);
                 if (ret == 0) {
-                    qemu_log_mask(CPU_LOG_MMU, "BAT %d match: r " TARGET_FMT_plx
+                    qemu_log_mask(CPU_LOG_MMU, "BAT %d match: r " HWADDR_FMT_plx
                                   " prot=%c%c\n", i, ctx->raddr,
                                   ctx->prot & PAGE_READ ? 'R' : '-',
                                   ctx->prot & PAGE_WRITE ? 'W' : '-');
@@ -403,9 +403,9 @@ static int get_segment_6xx_tlb(CPUPPCState *env, mmu_ctx_t *ctx,
         /* Check if instruction fetch is allowed, if needed */
         if (type != ACCESS_CODE || ctx->nx == 0) {
             /* Page address translation */
-            qemu_log_mask(CPU_LOG_MMU, "htab_base " TARGET_FMT_plx
-                    " htab_mask " TARGET_FMT_plx
-                    " hash " TARGET_FMT_plx "\n",
+            qemu_log_mask(CPU_LOG_MMU, "htab_base " HWADDR_FMT_plx
+                    " htab_mask " HWADDR_FMT_plx
+                    " hash " HWADDR_FMT_plx "\n",
                     ppc_hash32_hpt_base(cpu), ppc_hash32_hpt_mask(cpu), hash);
             ctx->hash[0] = hash;
             ctx->hash[1] = ~hash;
@@ -420,7 +420,7 @@ static int get_segment_6xx_tlb(CPUPPCState *env, mmu_ctx_t *ctx,
                 hwaddr curaddr;
                 uint32_t a0, a1, a2, a3;
 
-                qemu_log("Page table: " TARGET_FMT_plx " len " TARGET_FMT_plx
+                qemu_log("Page table: " HWADDR_FMT_plx " len " HWADDR_FMT_plx
                          "\n", ppc_hash32_hpt_base(cpu),
                          ppc_hash32_hpt_mask(cpu) + 0x80);
                 for (curaddr = ppc_hash32_hpt_base(cpu);
@@ -432,7 +432,7 @@ static int get_segment_6xx_tlb(CPUPPCState *env, mmu_ctx_t *ctx,
                     a2 = ldl_phys(cs->as, curaddr + 8);
                     a3 = ldl_phys(cs->as, curaddr + 12);
                     if (a0 != 0 || a1 != 0 || a2 != 0 || a3 != 0) {
-                        qemu_log(TARGET_FMT_plx ": %08x %08x %08x %08x\n",
+                        qemu_log(HWADDR_FMT_plx ": %08x %08x %08x %08x\n",
                                  curaddr, a0, a1, a2, a3);
                     }
                 }
@@ -578,14 +578,14 @@ static int mmu40x_get_physical_address(CPUPPCState *env, mmu_ctx_t *ctx,
         if (ret >= 0) {
             ctx->raddr = raddr;
             qemu_log_mask(CPU_LOG_MMU, "%s: access granted " TARGET_FMT_lx
-                          " => " TARGET_FMT_plx
+                          " => " HWADDR_FMT_plx
                           " %d %d\n", __func__, address, ctx->raddr, ctx->prot,
                           ret);
             return 0;
         }
     }
      qemu_log_mask(CPU_LOG_MMU, "%s: access refused " TARGET_FMT_lx
-                   " => " TARGET_FMT_plx
+                   " => " HWADDR_FMT_plx
                    " %d %d\n", __func__, address, raddr, ctx->prot, ret);
 
     return ret;
@@ -666,11 +666,11 @@ static int mmubooke_get_physical_address(CPUPPCState *env, mmu_ctx_t *ctx,
     if (ret >= 0) {
         ctx->raddr = raddr;
         qemu_log_mask(CPU_LOG_MMU, "%s: access granted " TARGET_FMT_lx
-                      " => " TARGET_FMT_plx " %d %d\n", __func__,
+                      " => " HWADDR_FMT_plx " %d %d\n", __func__,
                       address, ctx->raddr, ctx->prot, ret);
     } else {
          qemu_log_mask(CPU_LOG_MMU, "%s: access refused " TARGET_FMT_lx
-                       " => " TARGET_FMT_plx " %d %d\n", __func__,
+                       " => " HWADDR_FMT_plx " %d %d\n", __func__,
                        address, raddr, ctx->prot, ret);
     }
 
@@ -894,11 +894,11 @@ found_tlb:
     if (ret >= 0) {
         ctx->raddr = raddr;
          qemu_log_mask(CPU_LOG_MMU, "%s: access granted " TARGET_FMT_lx
-                       " => " TARGET_FMT_plx " %d %d\n", __func__, address,
+                       " => " HWADDR_FMT_plx " %d %d\n", __func__, address,
                        ctx->raddr, ctx->prot, ret);
     } else {
          qemu_log_mask(CPU_LOG_MMU, "%s: access refused " TARGET_FMT_lx
-                       " => " TARGET_FMT_plx " %d %d\n", __func__, address,
+                       " => " HWADDR_FMT_plx " %d %d\n", __func__, address,
                        raddr, ctx->prot, ret);
     }
 
diff --git a/target/ppc/mmu_helper.c b/target/ppc/mmu_helper.c
index 2a91f3f46a..64e30435f5 100644
--- a/target/ppc/mmu_helper.c
+++ b/target/ppc/mmu_helper.c
@@ -826,7 +826,7 @@ void helper_4xx_tlbwe_hi(CPUPPCState *env, target_ulong entry,
         tlb->prot &= ~PAGE_VALID;
     }
     tlb->PID = env->spr[SPR_40x_PID]; /* PID */
-    qemu_log_mask(CPU_LOG_MMU, "%s: set up TLB %d RPN " TARGET_FMT_plx
+    qemu_log_mask(CPU_LOG_MMU, "%s: set up TLB %d RPN " HWADDR_FMT_plx
                   " EPN " TARGET_FMT_lx " size " TARGET_FMT_lx
                   " prot %c%c%c%c PID %d\n", __func__,
                   (int)entry, tlb->RPN, tlb->EPN, tlb->size,
@@ -864,7 +864,7 @@ void helper_4xx_tlbwe_lo(CPUPPCState *env, target_ulong entry,
     if (val & PPC4XX_TLBLO_WR) {
         tlb->prot |= PAGE_WRITE;
     }
-    qemu_log_mask(CPU_LOG_MMU, "%s: set up TLB %d RPN " TARGET_FMT_plx
+    qemu_log_mask(CPU_LOG_MMU, "%s: set up TLB %d RPN " HWADDR_FMT_plx
                   " EPN " TARGET_FMT_lx
                   " size " TARGET_FMT_lx " prot %c%c%c%c PID %d\n", __func__,
                   (int)entry, tlb->RPN, tlb->EPN, tlb->size,
diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index 8ea3442b4a..9a28816521 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -1272,7 +1272,7 @@ bool riscv_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
 
         qemu_log_mask(CPU_LOG_MMU,
                       "%s 1st-stage address=%" VADDR_PRIx " ret %d physical "
-                      TARGET_FMT_plx " prot %d\n",
+                      HWADDR_FMT_plx " prot %d\n",
                       __func__, address, ret, pa, prot);
 
         if (ret == TRANSLATE_SUCCESS) {
@@ -1285,7 +1285,7 @@ bool riscv_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
 
             qemu_log_mask(CPU_LOG_MMU,
                     "%s 2nd-stage address=%" VADDR_PRIx " ret %d physical "
-                    TARGET_FMT_plx " prot %d\n",
+                    HWADDR_FMT_plx " prot %d\n",
                     __func__, im_address, ret, pa, prot2);
 
             prot &= prot2;
@@ -1295,7 +1295,7 @@ bool riscv_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
                                                size, access_type, mode);
 
                 qemu_log_mask(CPU_LOG_MMU,
-                              "%s PMP address=" TARGET_FMT_plx " ret %d prot"
+                              "%s PMP address=" HWADDR_FMT_plx " ret %d prot"
                               " %d tlb_size " TARGET_FMT_lu "\n",
                               __func__, pa, ret, prot_pmp, tlb_size);
 
@@ -1320,7 +1320,7 @@ bool riscv_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
 
         qemu_log_mask(CPU_LOG_MMU,
                       "%s address=%" VADDR_PRIx " ret %d physical "
-                      TARGET_FMT_plx " prot %d\n",
+                      HWADDR_FMT_plx " prot %d\n",
                       __func__, address, ret, pa, prot);
 
         if (ret == TRANSLATE_SUCCESS) {
@@ -1328,7 +1328,7 @@ bool riscv_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
                                            size, access_type, mode);
 
             qemu_log_mask(CPU_LOG_MMU,
-                          "%s PMP address=" TARGET_FMT_plx " ret %d prot"
+                          "%s PMP address=" HWADDR_FMT_plx " ret %d prot"
                           " %d tlb_size " TARGET_FMT_lu "\n",
                           __func__, pa, ret, prot_pmp, tlb_size);
 
diff --git a/target/riscv/monitor.c b/target/riscv/monitor.c
index 17e63fab00..236f93b9f5 100644
--- a/target/riscv/monitor.c
+++ b/target/riscv/monitor.c
@@ -64,7 +64,7 @@ static void print_pte(Monitor *mon, int va_bits, target_ulong vaddr,
         return;
     }
 
-    monitor_printf(mon, TARGET_FMT_lx " " TARGET_FMT_plx " " TARGET_FMT_lx
+    monitor_printf(mon, TARGET_FMT_lx " " HWADDR_FMT_plx " " TARGET_FMT_lx
                    " %c%c%c%c%c%c%c\n",
                    addr_canonical(va_bits, vaddr),
                    paddr, size,
diff --git a/target/sparc/ldst_helper.c b/target/sparc/ldst_helper.c
index ec4fae78c3..a53580d9e4 100644
--- a/target/sparc/ldst_helper.c
+++ b/target/sparc/ldst_helper.c
@@ -430,12 +430,12 @@ static void sparc_raise_mmu_fault(CPUState *cs, hwaddr addr,
 
 #ifdef DEBUG_UNASSIGNED
     if (is_asi) {
-        printf("Unassigned mem %s access of %d byte%s to " TARGET_FMT_plx
+        printf("Unassigned mem %s access of %d byte%s to " HWADDR_FMT_plx
                " asi 0x%02x from " TARGET_FMT_lx "\n",
                is_exec ? "exec" : is_write ? "write" : "read", size,
                size == 1 ? "" : "s", addr, is_asi, env->pc);
     } else {
-        printf("Unassigned mem %s access of %d byte%s to " TARGET_FMT_plx
+        printf("Unassigned mem %s access of %d byte%s to " HWADDR_FMT_plx
                " from " TARGET_FMT_lx "\n",
                is_exec ? "exec" : is_write ? "write" : "read", size,
                size == 1 ? "" : "s", addr, env->pc);
@@ -490,7 +490,7 @@ static void sparc_raise_mmu_fault(CPUState *cs, hwaddr addr,
     CPUSPARCState *env = &cpu->env;
 
 #ifdef DEBUG_UNASSIGNED
-    printf("Unassigned mem access to " TARGET_FMT_plx " from " TARGET_FMT_lx
+    printf("Unassigned mem access to " HWADDR_FMT_plx " from " TARGET_FMT_lx
            "\n", addr, env->pc);
 #endif
 
diff --git a/target/sparc/mmu_helper.c b/target/sparc/mmu_helper.c
index 919448a494..158ec2ae8f 100644
--- a/target/sparc/mmu_helper.c
+++ b/target/sparc/mmu_helper.c
@@ -230,7 +230,7 @@ bool sparc_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
     if (likely(error_code == 0)) {
         qemu_log_mask(CPU_LOG_MMU,
                       "Translate at %" VADDR_PRIx " -> "
-                      TARGET_FMT_plx ", vaddr " TARGET_FMT_lx "\n",
+                      HWADDR_FMT_plx ", vaddr " TARGET_FMT_lx "\n",
                       address, paddr, vaddr);
         tlb_set_page(cs, vaddr, paddr, prot, mmu_idx, page_size);
         return true;
@@ -356,27 +356,27 @@ void dump_mmu(CPUSPARCState *env)
     hwaddr pa;
     uint32_t pde;
 
-    qemu_printf("Root ptr: " TARGET_FMT_plx ", ctx: %d\n",
+    qemu_printf("Root ptr: " HWADDR_FMT_plx ", ctx: %d\n",
                 (hwaddr)env->mmuregs[1] << 4, env->mmuregs[2]);
     for (n = 0, va = 0; n < 256; n++, va += 16 * 1024 * 1024) {
         pde = mmu_probe(env, va, 2);
         if (pde) {
             pa = cpu_get_phys_page_debug(cs, va);
-            qemu_printf("VA: " TARGET_FMT_lx ", PA: " TARGET_FMT_plx
+            qemu_printf("VA: " TARGET_FMT_lx ", PA: " HWADDR_FMT_plx
                         " PDE: " TARGET_FMT_lx "\n", va, pa, pde);
             for (m = 0, va1 = va; m < 64; m++, va1 += 256 * 1024) {
                 pde = mmu_probe(env, va1, 1);
                 if (pde) {
                     pa = cpu_get_phys_page_debug(cs, va1);
                     qemu_printf(" VA: " TARGET_FMT_lx ", PA: "
-                                TARGET_FMT_plx " PDE: " TARGET_FMT_lx "\n",
+                                HWADDR_FMT_plx " PDE: " TARGET_FMT_lx "\n",
                                 va1, pa, pde);
                     for (o = 0, va2 = va1; o < 64; o++, va2 += 4 * 1024) {
                         pde = mmu_probe(env, va2, 0);
                         if (pde) {
                             pa = cpu_get_phys_page_debug(cs, va2);
                             qemu_printf("  VA: " TARGET_FMT_lx ", PA: "
-                                        TARGET_FMT_plx " PTE: "
+                                        HWADDR_FMT_plx " PTE: "
                                         TARGET_FMT_lx "\n",
                                         va2, pa, pde);
                         }
diff --git a/target/tricore/helper.c b/target/tricore/helper.c
index 1db32808e8..114685cce4 100644
--- a/target/tricore/helper.c
+++ b/target/tricore/helper.c
@@ -79,7 +79,7 @@ bool tricore_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
                                address, rw, mmu_idx);
 
     qemu_log_mask(CPU_LOG_MMU, "%s address=" TARGET_FMT_lx " ret %d physical "
-                  TARGET_FMT_plx " prot %d\n",
+                  HWADDR_FMT_plx " prot %d\n",
                   __func__, (target_ulong)address, ret, physical, prot);
 
     if (ret == TLBRET_MATCH) {
-- 
2.38.1


