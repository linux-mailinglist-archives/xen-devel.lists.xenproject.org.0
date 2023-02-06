Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B5CFD68BD1F
	for <lists+xen-devel@lfdr.de>; Mon,  6 Feb 2023 13:43:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.490354.759010 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pP0pv-0005J9-6u; Mon, 06 Feb 2023 12:43:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 490354.759010; Mon, 06 Feb 2023 12:43:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pP0pv-0005Gu-3e; Mon, 06 Feb 2023 12:43:07 +0000
Received: by outflank-mailman (input) for mailman id 490354;
 Mon, 06 Feb 2023 12:43:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cvBD=6C=gmail.com=burzalodowa@srs-se1.protection.inumbo.net>)
 id 1pP0pt-0005GF-Vi
 for xen-devel@lists.xenproject.org; Mon, 06 Feb 2023 12:43:06 +0000
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [2a00:1450:4864:20::42e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cbcc1dab-a61b-11ed-93b5-47a8fe42b414;
 Mon, 06 Feb 2023 13:43:03 +0100 (CET)
Received: by mail-wr1-x42e.google.com with SMTP id g6so2251659wrv.1
 for <xen-devel@lists.xenproject.org>; Mon, 06 Feb 2023 04:43:03 -0800 (PST)
Received: from uni.router.wind (adsl-89.109.242.139.tellas.gr.
 [109.242.139.89]) by smtp.googlemail.com with ESMTPSA id
 o15-20020adfa10f000000b002bddaea7a0bsm8881450wro.57.2023.02.06.04.43.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Feb 2023 04:43:02 -0800 (PST)
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
X-Inumbo-ID: cbcc1dab-a61b-11ed-93b5-47a8fe42b414
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MNDsqUhVp4CrpdRW5c2DDqCamntpV86ahP5h/2pH/yM=;
        b=mWamJfY77NtlQrOeItwBjf30DLN/kcIGuFvTr3GQF13Fway6y1IxFTPwI0KYkVJvzh
         /0v/ACirRrkby+/TzP6Fzmu+bPggVRQlQ5xUOIA6iwNzgv56+43usbqyb9U7y5oI32mz
         GTTIvaCFGO+69SfqwsQwy75c2Kef/LSCBycRoykolTjbFFVfHAcdQz9LepSXQiAABu7b
         d86uFfVl/mpGigMfRU47wf/6FDkkyc2pCDPUifeWdcEGaLadRyo5fYvVY5KX8h8aomvH
         7jUP3z6lkrdMlXiLUpSatgO5P+mtE84BWqvjM2TJAcHIyg9TseE7TzWjolnf/nti9f/V
         fi4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MNDsqUhVp4CrpdRW5c2DDqCamntpV86ahP5h/2pH/yM=;
        b=CFZC2674nOKnUX9h1AHS8RAHCXANp0aJ9rRWbR8gC0K+d76hN4e8XICL/25uYBsuk8
         D6KO1WUjay6BJwkfYBYshqIMMMAPuYuX/EYWwzXx5bjNfICvrFGeEuiZm/DxywMitwAA
         CRnzzuB+TdjmXuo0vPqPHtXYtZAG80XaGJpxDnuJwgCRvo6VJgjcRA4JcrUxhhVWU59D
         b/Pt9wIQ38BQyLvZnofXssbgGQo2tu7ZzcpmiRamFQFsWABl2PnJJmudD4EO8MmrFX9E
         tCgBl7FOdoDmBkftnf5gB7XHm5PbnMiPgPn/4LOE9XhBr3tvFbftZdWUEM0m2kB683U7
         H9dg==
X-Gm-Message-State: AO0yUKWI7E4Tlex5HSSt0u38LR+x/W0JCQdC4bz45zTfb9rUUKgUn8G/
	tYf0791RIT4kD7GT6Ls3UEoLIs33kPo=
X-Google-Smtp-Source: AK7set+pn2ZACVv7Cs0+tdmWIDEb8U7yE5/zmsQ8ZHjja9zaPLHSq206t6JgGqT7vLZFrTtRYQwvzw==
X-Received: by 2002:a5d:5284:0:b0:2c3:d296:7a84 with SMTP id c4-20020a5d5284000000b002c3d2967a84mr9232097wrv.17.1675687382566;
        Mon, 06 Feb 2023 04:43:02 -0800 (PST)
From: Xenia Ragiadakou <burzalodowa@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>,
	Jun Nakajima <jun.nakajima@intel.com>,
	Kevin Tian <kevin.tian@intel.com>,
	Paul Durrant <paul@xen.org>,
	George Dunlap <george.dunlap@citrix.com>
Subject: [PATCH 1/2] x86: do not include asm/hvm/support.h when not used
Date: Mon,  6 Feb 2023 14:42:50 +0200
Message-Id: <20230206124251.911744-2-burzalodowa@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230206124251.911744-1-burzalodowa@gmail.com>
References: <20230206124251.911744-1-burzalodowa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When none of the declarations and macro definitions in asm/hvm/support.h is
referred in the file, do not include the header.

To fix subsequent build errors, which were not triggered before due to the
indirect inclusion of the missing headers by asm/hvm/support.h, include any
missing headers.

No functional change intended.

Signed-off-by: Xenia Ragiadakou <burzalodowa@gmail.com>
---
 xen/arch/x86/cpu/amd.c                  | 2 +-
 xen/arch/x86/cpu/intel.c                | 2 +-
 xen/arch/x86/cpu/vpmu.c                 | 1 -
 xen/arch/x86/cpu/vpmu_intel.c           | 1 -
 xen/arch/x86/crash.c                    | 1 -
 xen/arch/x86/domain.c                   | 1 -
 xen/arch/x86/domctl.c                   | 1 -
 xen/arch/x86/emul-i8254.c               | 2 +-
 xen/arch/x86/hvm/hpet.c                 | 2 +-
 xen/arch/x86/hvm/io.c                   | 1 -
 xen/arch/x86/hvm/irq.c                  | 2 +-
 xen/arch/x86/hvm/pmtimer.c              | 3 ++-
 xen/arch/x86/hvm/rtc.c                  | 3 ++-
 xen/arch/x86/hvm/save.c                 | 2 --
 xen/arch/x86/hvm/stdvga.c               | 1 -
 xen/arch/x86/hvm/svm/emulate.c          | 1 -
 xen/arch/x86/hvm/svm/intr.c             | 1 -
 xen/arch/x86/hvm/svm/vmcb.c             | 1 -
 xen/arch/x86/hvm/viridian/synic.c       | 1 -
 xen/arch/x86/hvm/viridian/time.c        | 1 -
 xen/arch/x86/hvm/viridian/viridian.c    | 1 -
 xen/arch/x86/hvm/vmx/intr.c             | 1 -
 xen/arch/x86/hvm/vmx/vmcs.c             | 1 -
 xen/arch/x86/hvm/vmx/vvmx.c             | 1 +
 xen/arch/x86/hvm/vpic.c                 | 2 +-
 xen/arch/x86/hvm/vpt.c                  | 2 +-
 xen/arch/x86/i387.c                     | 1 -
 xen/arch/x86/include/asm/hvm/vmx/vmx.h  | 2 +-
 xen/arch/x86/mm/altp2m.c                | 1 -
 xen/arch/x86/mm/hap/nested_ept.c        | 1 -
 xen/arch/x86/mm/hap/nested_hap.c        | 1 -
 xen/arch/x86/oprofile/op_model_athlon.c | 2 +-
 xen/arch/x86/oprofile/xenoprof.c        | 1 -
 xen/arch/x86/smp.c                      | 1 -
 xen/arch/x86/sysctl.c                   | 1 -
 xen/arch/x86/x86_64/traps.c             | 1 -
 xen/arch/x86/xstate.c                   | 1 -
 xen/drivers/passthrough/x86/hvm.c       | 1 -
 38 files changed, 14 insertions(+), 38 deletions(-)

diff --git a/xen/arch/x86/cpu/amd.c b/xen/arch/x86/cpu/amd.c
index 1ddb55cbe5..caafe44740 100644
--- a/xen/arch/x86/cpu/amd.c
+++ b/xen/arch/x86/cpu/amd.c
@@ -4,12 +4,12 @@
 #include <xen/param.h>
 #include <xen/smp.h>
 #include <xen/pci.h>
+#include <xen/sched.h>
 #include <xen/warning.h>
 #include <asm/io.h>
 #include <asm/msr.h>
 #include <asm/processor.h>
 #include <asm/amd.h>
-#include <asm/hvm/support.h>
 #include <asm/spec_ctrl.h>
 #include <asm/acpi.h>
 #include <asm/apic.h>
diff --git a/xen/arch/x86/cpu/intel.c b/xen/arch/x86/cpu/intel.c
index dc6a0c7807..71fc1a1e18 100644
--- a/xen/arch/x86/cpu/intel.c
+++ b/xen/arch/x86/cpu/intel.c
@@ -1,5 +1,6 @@
 #include <xen/init.h>
 #include <xen/kernel.h>
+#include <xen/sched.h>
 #include <xen/string.h>
 #include <xen/bitops.h>
 #include <xen/smp.h>
@@ -10,7 +11,6 @@
 #include <asm/apic.h>
 #include <asm/i387.h>
 #include <mach_apic.h>
-#include <asm/hvm/support.h>
 
 #include "cpu.h"
 
diff --git a/xen/arch/x86/cpu/vpmu.c b/xen/arch/x86/cpu/vpmu.c
index 33e2fca8cd..b6b7342fb4 100644
--- a/xen/arch/x86/cpu/vpmu.c
+++ b/xen/arch/x86/cpu/vpmu.c
@@ -30,7 +30,6 @@
 #include <asm/nmi.h>
 #include <asm/p2m.h>
 #include <asm/vpmu.h>
-#include <asm/hvm/support.h>
 #include <asm/apic.h>
 #include <irq_vectors.h>
 #include <public/pmu.h>
diff --git a/xen/arch/x86/cpu/vpmu_intel.c b/xen/arch/x86/cpu/vpmu_intel.c
index b91d818be0..a8df52579d 100644
--- a/xen/arch/x86/cpu/vpmu_intel.c
+++ b/xen/arch/x86/cpu/vpmu_intel.c
@@ -29,7 +29,6 @@
 #include <asm/msr.h>
 #include <asm/msr-index.h>
 #include <asm/vpmu.h>
-#include <asm/hvm/support.h>
 #include <asm/hvm/vlapic.h>
 #include <asm/hvm/vmx/vmx.h>
 #include <asm/hvm/vmx/vmcs.h>
diff --git a/xen/arch/x86/crash.c b/xen/arch/x86/crash.c
index 99089f77a7..7850f0af24 100644
--- a/xen/arch/x86/crash.c
+++ b/xen/arch/x86/crash.c
@@ -24,7 +24,6 @@
 #include <xen/keyhandler.h>
 #include <public/xen.h>
 #include <asm/shared.h>
-#include <asm/hvm/support.h>
 #include <asm/apic.h>
 #include <asm/io_apic.h>
 #include <xen/iommu.h>
diff --git a/xen/arch/x86/domain.c b/xen/arch/x86/domain.c
index d7a8237f01..abd2b4ad68 100644
--- a/xen/arch/x86/domain.c
+++ b/xen/arch/x86/domain.c
@@ -51,7 +51,6 @@
 #include <asm/ldt.h>
 #include <asm/hvm/hvm.h>
 #include <asm/hvm/nestedhvm.h>
-#include <asm/hvm/support.h>
 #include <asm/hvm/svm/svm.h>
 #include <asm/hvm/viridian.h>
 #include <asm/debugreg.h>
diff --git a/xen/arch/x86/domctl.c b/xen/arch/x86/domctl.c
index e9bfbc57a7..2118fcad5d 100644
--- a/xen/arch/x86/domctl.c
+++ b/xen/arch/x86/domctl.c
@@ -25,7 +25,6 @@
 #include <asm/irq.h>
 #include <asm/hvm/emulate.h>
 #include <asm/hvm/hvm.h>
-#include <asm/hvm/support.h>
 #include <asm/processor.h>
 #include <asm/acpi.h> /* for hvm_acpi_power_button */
 #include <xen/hypercall.h> /* for arch_do_domctl */
diff --git a/xen/arch/x86/emul-i8254.c b/xen/arch/x86/emul-i8254.c
index 18894b6348..1688b7e458 100644
--- a/xen/arch/x86/emul-i8254.c
+++ b/xen/arch/x86/emul-i8254.c
@@ -34,7 +34,7 @@
 #include <asm/time.h>
 #include <asm/hvm/hvm.h>
 #include <asm/hvm/io.h>
-#include <asm/hvm/support.h>
+#include <asm/hvm/save.h>
 #include <asm/hvm/vpt.h>
 #include <asm/current.h>
 
diff --git a/xen/arch/x86/hvm/hpet.c b/xen/arch/x86/hvm/hpet.c
index 45c7b9b406..c65e1b27d0 100644
--- a/xen/arch/x86/hvm/hpet.c
+++ b/xen/arch/x86/hvm/hpet.c
@@ -18,7 +18,7 @@
 
 #include <asm/hvm/vpt.h>
 #include <asm/hvm/io.h>
-#include <asm/hvm/support.h>
+#include <asm/hvm/save.h>
 #include <asm/hvm/trace.h>
 #include <asm/current.h>
 #include <asm/hpet.h>
diff --git a/xen/arch/x86/hvm/io.c b/xen/arch/x86/hvm/io.c
index 0309d05cfd..5ae209d3b6 100644
--- a/xen/arch/x86/hvm/io.c
+++ b/xen/arch/x86/hvm/io.c
@@ -36,7 +36,6 @@
 #include <asm/shadow.h>
 #include <asm/p2m.h>
 #include <asm/hvm/hvm.h>
-#include <asm/hvm/support.h>
 #include <asm/hvm/vpt.h>
 #include <asm/hvm/vpic.h>
 #include <asm/hvm/vlapic.h>
diff --git a/xen/arch/x86/hvm/irq.c b/xen/arch/x86/hvm/irq.c
index d93ffe4546..4fe87a71c1 100644
--- a/xen/arch/x86/hvm/irq.c
+++ b/xen/arch/x86/hvm/irq.c
@@ -24,7 +24,7 @@
 #include <xen/irq.h>
 #include <xen/keyhandler.h>
 #include <asm/hvm/domain.h>
-#include <asm/hvm/support.h>
+#include <asm/hvm/save.h>
 #include <asm/msi.h>
 #include <public/hvm/params.h>
 
diff --git a/xen/arch/x86/hvm/pmtimer.c b/xen/arch/x86/hvm/pmtimer.c
index 2a89bbdfa5..b89d0fd53b 100644
--- a/xen/arch/x86/hvm/pmtimer.c
+++ b/xen/arch/x86/hvm/pmtimer.c
@@ -17,9 +17,10 @@
  * this program; If not, see <http://www.gnu.org/licenses/>.
  */
 
+#include <xen/sched.h>
 #include <asm/hvm/vpt.h>
 #include <asm/hvm/io.h>
-#include <asm/hvm/support.h>
+#include <asm/hvm/save.h>
 #include <asm/acpi.h> /* for hvm_acpi_power_button prototype */
 #include <public/hvm/params.h>
 
diff --git a/xen/arch/x86/hvm/rtc.c b/xen/arch/x86/hvm/rtc.c
index d21925db08..44f2fb668d 100644
--- a/xen/arch/x86/hvm/rtc.c
+++ b/xen/arch/x86/hvm/rtc.c
@@ -22,10 +22,11 @@
  * IN THE SOFTWARE.
  */
 
+#include <xen/sched.h>
 #include <asm/mc146818rtc.h>
 #include <asm/hvm/vpt.h>
 #include <asm/hvm/io.h>
-#include <asm/hvm/support.h>
+#include <asm/hvm/save.h>
 #include <asm/current.h>
 #include <xen/trace.h>
 #include <public/hvm/params.h>
diff --git a/xen/arch/x86/hvm/save.c b/xen/arch/x86/hvm/save.c
index 86c82cbd74..c1675e3d9f 100644
--- a/xen/arch/x86/hvm/save.c
+++ b/xen/arch/x86/hvm/save.c
@@ -24,8 +24,6 @@
 #include <xen/softirq.h>
 #include <xen/version.h>
 
-#include <asm/hvm/support.h>
-
 #include <public/hvm/save.h>
 
 void arch_hvm_save(struct domain *d, struct hvm_save_header *hdr)
diff --git a/xen/arch/x86/hvm/stdvga.c b/xen/arch/x86/hvm/stdvga.c
index be8200c8d0..798a9a0549 100644
--- a/xen/arch/x86/hvm/stdvga.c
+++ b/xen/arch/x86/hvm/stdvga.c
@@ -31,7 +31,6 @@
 #include <xen/types.h>
 #include <xen/sched.h>
 #include <xen/domain_page.h>
-#include <asm/hvm/support.h>
 #include <xen/numa.h>
 #include <xen/paging.h>
 
diff --git a/xen/arch/x86/hvm/svm/emulate.c b/xen/arch/x86/hvm/svm/emulate.c
index 635b3705f7..16fc134883 100644
--- a/xen/arch/x86/hvm/svm/emulate.c
+++ b/xen/arch/x86/hvm/svm/emulate.c
@@ -22,7 +22,6 @@
 #include <asm/msr.h>
 #include <asm/hvm/emulate.h>
 #include <asm/hvm/hvm.h>
-#include <asm/hvm/support.h>
 #include <asm/hvm/svm/svm.h>
 #include <asm/hvm/svm/vmcb.h>
 #include <asm/hvm/svm/emulate.h>
diff --git a/xen/arch/x86/hvm/svm/intr.c b/xen/arch/x86/hvm/svm/intr.c
index 7f815d2307..9525f35593 100644
--- a/xen/arch/x86/hvm/svm/intr.c
+++ b/xen/arch/x86/hvm/svm/intr.c
@@ -27,7 +27,6 @@
 #include <asm/paging.h>
 #include <asm/hvm/hvm.h>
 #include <asm/hvm/io.h>
-#include <asm/hvm/support.h>
 #include <asm/hvm/vlapic.h>
 #include <asm/hvm/svm/svm.h>
 #include <asm/hvm/svm/intr.h>
diff --git a/xen/arch/x86/hvm/svm/vmcb.c b/xen/arch/x86/hvm/svm/vmcb.c
index 0fc57dfd71..305d4767e3 100644
--- a/xen/arch/x86/hvm/svm/vmcb.c
+++ b/xen/arch/x86/hvm/svm/vmcb.c
@@ -26,7 +26,6 @@
 #include <asm/hvm/svm/vmcb.h>
 #include <asm/msr-index.h>
 #include <asm/p2m.h>
-#include <asm/hvm/support.h>
 #include <asm/hvm/svm/svm.h>
 #include <asm/hvm/svm/svmdebug.h>
 #include <asm/spec_ctrl.h>
diff --git a/xen/arch/x86/hvm/viridian/synic.c b/xen/arch/x86/hvm/viridian/synic.c
index 856bb898b8..83d7addfc3 100644
--- a/xen/arch/x86/hvm/viridian/synic.c
+++ b/xen/arch/x86/hvm/viridian/synic.c
@@ -13,7 +13,6 @@
 
 #include <asm/apic.h>
 #include <asm/guest/hyperv-tlfs.h>
-#include <asm/hvm/support.h>
 #include <asm/hvm/vlapic.h>
 
 #include "private.h"
diff --git a/xen/arch/x86/hvm/viridian/time.c b/xen/arch/x86/hvm/viridian/time.c
index b56fd67662..a3ea3fa067 100644
--- a/xen/arch/x86/hvm/viridian/time.c
+++ b/xen/arch/x86/hvm/viridian/time.c
@@ -15,7 +15,6 @@
 #include <asm/event.h>
 #include <asm/guest/hyperv.h>
 #include <asm/guest/hyperv-tlfs.h>
-#include <asm/hvm/support.h>
 
 #include "private.h"
 
diff --git a/xen/arch/x86/hvm/viridian/viridian.c b/xen/arch/x86/hvm/viridian/viridian.c
index 2937ddd3a8..7405c117bc 100644
--- a/xen/arch/x86/hvm/viridian/viridian.c
+++ b/xen/arch/x86/hvm/viridian/viridian.c
@@ -16,7 +16,6 @@
 #include <asm/paging.h>
 #include <asm/p2m.h>
 #include <asm/apic.h>
-#include <asm/hvm/support.h>
 #include <public/sched.h>
 #include <public/hvm/hvm_op.h>
 
diff --git a/xen/arch/x86/hvm/vmx/intr.c b/xen/arch/x86/hvm/vmx/intr.c
index 13bbe8430d..6a8316de0e 100644
--- a/xen/arch/x86/hvm/vmx/intr.c
+++ b/xen/arch/x86/hvm/vmx/intr.c
@@ -29,7 +29,6 @@
 #include <asm/msr.h>
 #include <asm/hvm/hvm.h>
 #include <asm/hvm/io.h>
-#include <asm/hvm/support.h>
 #include <asm/hvm/vmx/vmx.h>
 #include <asm/hvm/vmx/vmcs.h>
 #include <asm/hvm/vpic.h>
diff --git a/xen/arch/x86/hvm/vmx/vmcs.c b/xen/arch/x86/hvm/vmx/vmcs.c
index 7d8bfeb539..09edbd23b3 100644
--- a/xen/arch/x86/hvm/vmx/vmcs.c
+++ b/xen/arch/x86/hvm/vmx/vmcs.c
@@ -33,7 +33,6 @@
 #include <asm/hvm/hvm.h>
 #include <asm/hvm/io.h>
 #include <asm/hvm/nestedhvm.h>
-#include <asm/hvm/support.h>
 #include <asm/hvm/vmx/vmx.h>
 #include <asm/hvm/vmx/vvmx.h>
 #include <asm/hvm/vmx/vmcs.h>
diff --git a/xen/arch/x86/hvm/vmx/vvmx.c b/xen/arch/x86/hvm/vmx/vvmx.c
index f8fe8d0c14..674cdabb07 100644
--- a/xen/arch/x86/hvm/vmx/vvmx.c
+++ b/xen/arch/x86/hvm/vmx/vvmx.c
@@ -24,6 +24,7 @@
 #include <asm/types.h>
 #include <asm/mtrr.h>
 #include <asm/p2m.h>
+#include <asm/hvm/support.h>
 #include <asm/hvm/vmx/vmx.h>
 #include <asm/hvm/vmx/vvmx.h>
 #include <asm/hvm/nestedhvm.h>
diff --git a/xen/arch/x86/hvm/vpic.c b/xen/arch/x86/hvm/vpic.c
index b3cafaab8f..17e15720f0 100644
--- a/xen/arch/x86/hvm/vpic.c
+++ b/xen/arch/x86/hvm/vpic.c
@@ -32,7 +32,7 @@
 #include <xen/trace.h>
 #include <asm/hvm/hvm.h>
 #include <asm/hvm/io.h>
-#include <asm/hvm/support.h>
+#include <asm/hvm/save.h>
 
 #define vpic_domain(v) (container_of((v), struct domain, \
                         arch.hvm.vpic[!vpic->is_master]))
diff --git a/xen/arch/x86/hvm/vpt.c b/xen/arch/x86/hvm/vpt.c
index cb1d81bf9e..621f5bb88b 100644
--- a/xen/arch/x86/hvm/vpt.c
+++ b/xen/arch/x86/hvm/vpt.c
@@ -16,8 +16,8 @@
  * this program; If not, see <http://www.gnu.org/licenses/>.
  */
 
+#include <xen/sched.h>
 #include <xen/time.h>
-#include <asm/hvm/support.h>
 #include <asm/hvm/vpt.h>
 #include <asm/event.h>
 #include <asm/apic.h>
diff --git a/xen/arch/x86/i387.c b/xen/arch/x86/i387.c
index 677f571792..d824f2bb52 100644
--- a/xen/arch/x86/i387.c
+++ b/xen/arch/x86/i387.c
@@ -11,7 +11,6 @@
 #include <xen/sched.h>
 #include <asm/current.h>
 #include <asm/processor.h>
-#include <asm/hvm/support.h>
 #include <asm/i387.h>
 #include <asm/xstate.h>
 #include <asm/asm_defns.h>
diff --git a/xen/arch/x86/include/asm/hvm/vmx/vmx.h b/xen/arch/x86/include/asm/hvm/vmx/vmx.h
index 96a9f07ca5..234da4a7f4 100644
--- a/xen/arch/x86/include/asm/hvm/vmx/vmx.h
+++ b/xen/arch/x86/include/asm/hvm/vmx/vmx.h
@@ -23,8 +23,8 @@
 #include <asm/regs.h>
 #include <asm/asm_defns.h>
 #include <asm/processor.h>
+#include <asm/p2m.h>
 #include <asm/i387.h>
-#include <asm/hvm/support.h>
 #include <asm/hvm/trace.h>
 #include <asm/hvm/vmx/vmcs.h>
 
diff --git a/xen/arch/x86/mm/altp2m.c b/xen/arch/x86/mm/altp2m.c
index 8be6eaf242..07393befee 100644
--- a/xen/arch/x86/mm/altp2m.c
+++ b/xen/arch/x86/mm/altp2m.c
@@ -15,7 +15,6 @@
  * this program; If not, see <http://www.gnu.org/licenses/>.
  */
 
-#include <asm/hvm/support.h>
 #include <asm/hvm/hvm.h>
 #include <asm/p2m.h>
 #include <asm/altp2m.h>
diff --git a/xen/arch/x86/mm/hap/nested_ept.c b/xen/arch/x86/mm/hap/nested_ept.c
index 23fb3889b7..605e47c16c 100644
--- a/xen/arch/x86/mm/hap/nested_ept.c
+++ b/xen/arch/x86/mm/hap/nested_ept.c
@@ -25,7 +25,6 @@
 #include <asm/p2m.h>
 #include <asm/mem_sharing.h>
 #include <asm/hap.h>
-#include <asm/hvm/support.h>
 
 #include <asm/hvm/nestedhvm.h>
 
diff --git a/xen/arch/x86/mm/hap/nested_hap.c b/xen/arch/x86/mm/hap/nested_hap.c
index b19f657c27..098e8e5d4c 100644
--- a/xen/arch/x86/mm/hap/nested_hap.c
+++ b/xen/arch/x86/mm/hap/nested_hap.c
@@ -27,7 +27,6 @@
 #include <asm/p2m.h>
 #include <asm/mem_sharing.h>
 #include <asm/hap.h>
-#include <asm/hvm/support.h>
 
 #include <asm/hvm/nestedhvm.h>
 
diff --git a/xen/arch/x86/oprofile/op_model_athlon.c b/xen/arch/x86/oprofile/op_model_athlon.c
index 7bc5853a6c..69fd3fcc86 100644
--- a/xen/arch/x86/oprofile/op_model_athlon.c
+++ b/xen/arch/x86/oprofile/op_model_athlon.c
@@ -10,6 +10,7 @@
  * @author Graydon Hoare
  */
 
+#include <xen/sched.h>
 #include <xen/types.h>
 #include <asm/msr.h>
 #include <asm/io.h>
@@ -18,7 +19,6 @@
 #include <xen/xenoprof.h>
 #include <asm/regs.h>
 #include <asm/current.h>
-#include <asm/hvm/support.h>
 #include <xen/pci_regs.h>
 #include <xen/pci_ids.h>
 
diff --git a/xen/arch/x86/oprofile/xenoprof.c b/xen/arch/x86/oprofile/xenoprof.c
index b20f26bbe5..247a0deca8 100644
--- a/xen/arch/x86/oprofile/xenoprof.c
+++ b/xen/arch/x86/oprofile/xenoprof.c
@@ -12,7 +12,6 @@
 #include <xen/sched.h>
 #include <xen/xenoprof.h>
 #include <public/xenoprof.h>
-#include <asm/hvm/support.h>
 
 #include "op_counter.h"
 
diff --git a/xen/arch/x86/smp.c b/xen/arch/x86/smp.c
index b42603c351..3a331cbdbc 100644
--- a/xen/arch/x86/smp.c
+++ b/xen/arch/x86/smp.c
@@ -21,7 +21,6 @@
 #include <asm/flushtlb.h>
 #include <asm/hardirq.h>
 #include <asm/hpet.h>
-#include <asm/hvm/support.h>
 #include <asm/setup.h>
 #include <irq_vectors.h>
 #include <mach_apic.h>
diff --git a/xen/arch/x86/sysctl.c b/xen/arch/x86/sysctl.c
index f82abc2488..f42a3b843b 100644
--- a/xen/arch/x86/sysctl.c
+++ b/xen/arch/x86/sysctl.c
@@ -22,7 +22,6 @@
 #include <xen/iocap.h>
 #include <asm/irq.h>
 #include <asm/hvm/hvm.h>
-#include <asm/hvm/support.h>
 #include <asm/processor.h>
 #include <asm/setup.h>
 #include <asm/smp.h>
diff --git a/xen/arch/x86/x86_64/traps.c b/xen/arch/x86/x86_64/traps.c
index f8cb8d9a94..f4d17b4830 100644
--- a/xen/arch/x86/x86_64/traps.c
+++ b/xen/arch/x86/x86_64/traps.c
@@ -23,7 +23,6 @@
 #include <asm/page.h>
 #include <asm/shared.h>
 #include <asm/hvm/hvm.h>
-#include <asm/hvm/support.h>
 
 
 static void print_xen_info(void)
diff --git a/xen/arch/x86/xstate.c b/xen/arch/x86/xstate.c
index 3b32bdc51c..d481e1db3e 100644
--- a/xen/arch/x86/xstate.c
+++ b/xen/arch/x86/xstate.c
@@ -10,7 +10,6 @@
 #include <xen/sched.h>
 #include <asm/current.h>
 #include <asm/processor.h>
-#include <asm/hvm/support.h>
 #include <asm/i387.h>
 #include <asm/xstate.h>
 #include <asm/asm_defns.h>
diff --git a/xen/drivers/passthrough/x86/hvm.c b/xen/drivers/passthrough/x86/hvm.c
index 6bbd04bf3d..8175ba629a 100644
--- a/xen/drivers/passthrough/x86/hvm.c
+++ b/xen/drivers/passthrough/x86/hvm.c
@@ -23,7 +23,6 @@
 #include <xen/cpu.h>
 #include <xen/irq.h>
 #include <asm/hvm/irq.h>
-#include <asm/hvm/support.h>
 #include <asm/io_apic.h>
 
 /*
-- 
2.37.2


