Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EB247F167F
	for <lists+xen-devel@lfdr.de>; Mon, 20 Nov 2023 15:56:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.636969.992660 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r55hY-0007y0-DQ; Mon, 20 Nov 2023 14:56:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 636969.992660; Mon, 20 Nov 2023 14:56:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r55hY-0007uh-AJ; Mon, 20 Nov 2023 14:56:40 +0000
Received: by outflank-mailman (input) for mailman id 636969;
 Mon, 20 Nov 2023 14:56:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Uh/B=HB=citrix.com=prvs=681f0548f=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1r55hW-0007tb-3Z
 for xen-devel@lists.xenproject.org; Mon, 20 Nov 2023 14:56:38 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fedd7f0a-87b4-11ee-9b0e-b553b5be7939;
 Mon, 20 Nov 2023 15:56:35 +0100 (CET)
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
X-Inumbo-ID: fedd7f0a-87b4-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1700492194;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=6vr6P+DH3BGlg02OWWXmxPfC3uezAc1WcuXREonYF90=;
  b=Hcu4ttWPzyog9fb9hsQsm2CSBSbPZrGBAWRu6PIQP0L3DwjgDKK3tMX1
   8W5DPZlXMIaEkfdhauoBdWiMAK6u2Tnkd8rMnMuTwddKGtjzFKSBv5Jm0
   melaJHrTejof01MO2AWuAbl/PhjI9baaf99JkkSgFpQhmUnxlLlyXVYRC
   0=;
X-CSE-ConnectionGUID: YxgkUgEXQvaxEBofcrPFUw==
X-CSE-MsgGUID: YSjic0Z9RCClbRhiBMI+QA==
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 127427126
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.159.70
X-Policy: $RELAYED
X-ThreatScanner-Verdict: Negative
IronPort-Data: A9a23:HAzPsq75JQv+ou/bIFaEiAxRtFPHchMFZxGqfqrLsTDasY5as4F+v
 mEYC2qDa/nZMTGkfdwnaYzl9xhS7J/cmoJkHlFoqytmHi5G8cbLO4+Ufxz6V8+wwm8vb2o8t
 plDNYOQRCwQZiWBzvt4GuG59RGQ7YnRG/ykTraCY3gtLeNdYH9JoQp5nOIkiZJfj9G8Agec0
 fv/uMSaM1K+s9JOGjt8B5mr9lU34JwehBtC5gZlPKkR5AeE/5UoJMl3yZ+ZfiOQrrZ8RoZWd
 86bpJml82XQ+QsaC9/Nut4XpWVTH9Y+lSDX4pZnc/DKbipq/0Te4Y5iXBYoUm9Fii3hojxE4
 I4lWapc6+seFvakdOw1C3G0GszlVEFM0OevzXOX6aR/w6BaGpdFLjoH4EweZOUlFuhL7W5mx
 OwXKw0CQyC6meum7Zi8ROJ2vuoeM5y+VG8fkikIITDxCP8nRdbIQrnQ5M8e1zA17ixMNa+AP
 YxDM2MpNUmRJUIXUrsUIMtWcOOAr3/zaTBH7nmSorI6+TP7xw1tyrn9dtHSf7RmQO0MxBnE/
 D2fpTqR7hcyBeedyDHdwCOWrcTLlxn7Wag3Nf6B36s/6LGU7jNKU0BHPbehmtGph0j7V99BJ
 kg8/is1sbN05EGtVsP6XRCzvDiDpBF0c/h6HvA+6QqN4rHJ+AvfDW8BJhZac8AvvsIyQT0s1
 3eKksnvCDgpt6eaIVqC8p+EoDX0PjIaRUcAeCsFQA0t89Tl5oYpgXryos1LSfDvyIevQHepn
 mHM83BWa6gvYdAj5rW0/m3IrgKVuJHZYyQy6A7NZkyY8VYsDGK6XLBE+WQ3/N4Zc97BEgHQ4
 ihU8/Vy+tziGn1kqcBsfAnuNOvwjxp9GGeA6WOD5rF4n9hXx1atfJpL/BZ1L1pzP8APdFfBO
 RCL4V8ItM4OYifwNsebhr5d7OxwlcDd+SnNDKiIPrKinLAsHON4wM2eTRHJhD28+KTduao+J
 Y2aYa6R4YUyUMxaIM6Nb75Fi9cDn3lurV4/sLinl3xLJ5LCPi/KIVrEWXPSBt0EAFSs+lSIq
 Y0HbZDTl32ykoTWO0HqzGLaFnhSRVBTOHw8g5U/mjKrSua+JFwcNg==
IronPort-HdrOrdr: A9a23:6gnUpqliROAcb3JvjCqS5qjUVk/pDfIg3DAbv31ZSRFFG/Fxl6
 iV8sjzsiWE7wr5OUtQ/exoV5PhfZqxz/JICOoqTNKftWvdyQiVxehZhOOIqVDd8kXFh4hgPM
 xbEpSWZueeMbEDt7eZ3DWF
X-Talos-CUID: =?us-ascii?q?9a23=3ArPWW7Wqen0tlbHUVioCiSJbmUfE1fX7gw1rgGlG?=
 =?us-ascii?q?xGUtDT7OeU2e+xbwxxg=3D=3D?=
X-Talos-MUID: =?us-ascii?q?9a23=3AThAoVAzoSCjFupYgV4/MfhExXmaaqJWVCkEGyad?=
 =?us-ascii?q?XgeKvMSZKOza3qRX0e6Zyfw=3D=3D?=
X-IronPort-AV: E=Sophos;i="6.04,214,1695700800"; 
   d="scan'208";a="127427126"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<George.Dunlap@citrix.com>, Jan Beulich <JBeulich@suse.com>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, Julien Grall
	<julien@xen.org>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH 0/3] xen: Drop bool_t
Date: Mon, 20 Nov 2023 14:56:20 +0000
Message-ID: <20231120145623.167383-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Final cleanup of bool_t.

Andrew Cooper (3):
  x86/treewide: Switch bool_t to bool
  xen/treewide: Switch bool_t to bool
  xen: Drop bool_t

 xen/arch/x86/cpu/microcode/core.c        |  4 +--
 xen/arch/x86/cpu/mtrr/generic.c          |  2 +-
 xen/arch/x86/cpu/vpmu.c                  |  2 +-
 xen/arch/x86/cpu/vpmu_amd.c              |  4 +--
 xen/arch/x86/cpu/vpmu_intel.c            |  6 ++--
 xen/arch/x86/hvm/asid.c                  |  4 +--
 xen/arch/x86/hvm/emulate.c               | 28 +++++++--------
 xen/arch/x86/hvm/hvm.c                   | 36 +++++++++----------
 xen/arch/x86/hvm/intercept.c             |  2 +-
 xen/arch/x86/hvm/mtrr.c                  | 12 +++----
 xen/arch/x86/hvm/nestedhvm.c             |  4 +--
 xen/arch/x86/hvm/stdvga.c                |  2 +-
 xen/arch/x86/hvm/svm/nestedsvm.c         | 16 ++++-----
 xen/arch/x86/hvm/svm/svm.c               |  8 ++---
 xen/arch/x86/hvm/vlapic.c                | 31 +++++++++--------
 xen/arch/x86/hvm/vmx/vmcs.c              | 29 ++++++++--------
 xen/arch/x86/hvm/vmx/vmx.c               |  6 ++--
 xen/arch/x86/hvm/vmx/vvmx.c              | 20 +++++------
 xen/arch/x86/include/asm/acpi.h          |  2 +-
 xen/arch/x86/include/asm/apic.h          |  2 +-
 xen/arch/x86/include/asm/domain.h        | 28 +++++++--------
 xen/arch/x86/include/asm/hardirq.h       |  2 +-
 xen/arch/x86/include/asm/hvm/asid.h      |  2 +-
 xen/arch/x86/include/asm/hvm/emulate.h   |  2 +-
 xen/arch/x86/include/asm/hvm/hvm.h       | 24 ++++++-------
 xen/arch/x86/include/asm/hvm/io.h        |  6 ++--
 xen/arch/x86/include/asm/hvm/nestedhvm.h |  4 +--
 xen/arch/x86/include/asm/hvm/vcpu.h      | 16 ++++-----
 xen/arch/x86/include/asm/hvm/vlapic.h    | 12 +++----
 xen/arch/x86/include/asm/hvm/vmx/vmcs.h  | 10 +++---
 xen/arch/x86/include/asm/hvm/vmx/vmx.h   |  2 +-
 xen/arch/x86/include/asm/hvm/vmx/vvmx.h  |  2 +-
 xen/arch/x86/include/asm/mtrr.h          | 16 ++++-----
 xen/arch/x86/include/asm/p2m.h           | 20 +++++------
 xen/arch/x86/include/asm/page.h          |  2 +-
 xen/arch/x86/include/asm/paging.h        |  2 +-
 xen/arch/x86/include/asm/pci.h           |  8 ++---
 xen/arch/x86/include/asm/psr.h           |  2 +-
 xen/arch/x86/include/asm/vpmu.h          | 12 +++----
 xen/arch/x86/mm/hap/nested_ept.c         | 12 +++----
 xen/arch/x86/mm/mem_paging.c             |  2 +-
 xen/arch/x86/mm/p2m-ept.c                | 29 ++++++++--------
 xen/arch/x86/mm/p2m-pod.c                |  2 +-
 xen/arch/x86/mm/p2m-pt.c                 |  6 ++--
 xen/arch/x86/mm/p2m.c                    |  9 ++---
 xen/arch/x86/mm/paging.c                 |  6 ++--
 xen/arch/x86/x86_64/mmconf-fam10h.c      |  2 +-
 xen/arch/x86/x86_64/mmconfig-shared.c    |  8 ++---
 xen/arch/x86/x86_64/mmconfig_64.c        |  6 ++--
 xen/common/device_tree.c                 | 34 +++++++++---------
 xen/common/domain.c                      |  2 +-
 xen/common/domctl.c                      |  4 +--
 xen/common/event_fifo.c                  |  4 +--
 xen/common/grant_table.c                 | 14 ++++----
 xen/common/kernel.c                      |  2 +-
 xen/common/kexec.c                       |  4 +--
 xen/common/keyhandler.c                  |  4 +--
 xen/common/kimage.c                      |  8 ++---
 xen/common/livepatch.c                   | 20 +++++------
 xen/common/memory.c                      |  2 +-
 xen/common/notifier.c                    |  2 +-
 xen/common/preempt.c                     |  2 +-
 xen/common/rangeset.c                    | 12 +++----
 xen/common/shutdown.c                    |  2 +-
 xen/common/symbols.c                     |  2 +-
 xen/common/sysctl.c                      |  4 +--
 xen/common/tasklet.c                     |  4 +--
 xen/common/timer.c                       |  8 ++---
 xen/common/trace.c                       | 12 +++----
 xen/drivers/acpi/apei/apei-base.c        |  2 +-
 xen/drivers/acpi/apei/apei-internal.h    |  2 +-
 xen/drivers/acpi/apei/erst.c             |  2 +-
 xen/drivers/acpi/apei/hest.c             |  2 +-
 xen/drivers/char/console.c               |  8 ++---
 xen/drivers/char/ehci-dbgp.c             | 10 +++---
 xen/drivers/char/ns16550.c               | 14 ++++----
 xen/drivers/char/pl011.c                 |  2 +-
 xen/drivers/char/serial.c                |  2 +-
 xen/drivers/cpufreq/cpufreq.c            |  2 +-
 xen/drivers/video/vesa.c                 |  2 +-
 xen/include/acpi/cpufreq/cpufreq.h       | 10 +++---
 xen/include/xen/device_tree.h            | 44 ++++++++++++------------
 xen/include/xen/domain.h                 |  4 +--
 xen/include/xen/gdbstub.h                |  2 +-
 xen/include/xen/irq.h                    |  2 +-
 xen/include/xen/kernel.h                 |  2 +-
 xen/include/xen/kimage.h                 |  8 ++---
 xen/include/xen/livepatch.h              |  6 ++--
 xen/include/xen/mm-frame.h               |  4 +--
 xen/include/xen/mm.h                     |  6 ++--
 xen/include/xen/preempt.h                |  2 +-
 xen/include/xen/rangeset.h               |  8 ++---
 xen/include/xen/rwlock.h                 |  2 +-
 xen/include/xen/serial.h                 |  2 +-
 xen/include/xen/shutdown.h               |  2 +-
 xen/include/xen/tasklet.h                |  6 ++--
 xen/include/xen/types.h                  |  1 -
 97 files changed, 389 insertions(+), 390 deletions(-)


base-commit: cfb777791d39e025cf625ba1fa080597d4defef6
-- 
2.30.2


