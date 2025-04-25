Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 61E39A9C12A
	for <lists+xen-devel@lfdr.de>; Fri, 25 Apr 2025 10:35:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.967313.1357141 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u8EWz-00034S-FE; Fri, 25 Apr 2025 08:35:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 967313.1357141; Fri, 25 Apr 2025 08:35:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u8EWz-00030U-AE; Fri, 25 Apr 2025 08:35:33 +0000
Received: by outflank-mailman (input) for mailman id 967313;
 Fri, 25 Apr 2025 08:35:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Tuhi=XL=zytor.com=xin@srs-se1.protection.inumbo.net>)
 id 1u8EWx-0002sy-Pm
 for xen-devel@lists.xenproject.org; Fri, 25 Apr 2025 08:35:31 +0000
Received: from mail.zytor.com (unknown [2607:7c80:54:3::138])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3c7e7f8a-21b0-11f0-9eb3-5ba50f476ded;
 Fri, 25 Apr 2025 10:35:27 +0200 (CEST)
Received: from terminus.zytor.com (terminus.zytor.com
 [IPv6:2607:7c80:54:3:0:0:0:136]) (authenticated bits=0)
 by mail.zytor.com (8.18.1/8.17.1) with ESMTPSA id 53P8Yg5O2390085
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
 Fri, 25 Apr 2025 01:34:47 -0700
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
X-Inumbo-ID: 3c7e7f8a-21b0-11f0-9eb3-5ba50f476ded
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com 53P8Yg5O2390085
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
	s=2025042001; t=1745570089;
	bh=A3b4ITZaTfXzMfE8P3NClf2sv8WJ6sa7JySmuA7pbdY=;
	h=From:To:Cc:Subject:Date:From;
	b=OejYNbDTNY7z9B258k3ak9TmvMyUbUpawFr8lLCTkwYMVfGb8YqhUrp3Z4KHs5fPj
	 my80ixwryjSADjgtbLLeYGt0L3yHPJEv3Wau8PPmxGKQDdPwP1Xvbht7Gu2n9NaQOW
	 r9knRf/PcJ8xVurhtr9sRPFMNKKB8w/PmJDV/lYlJLHUotF+ugc+6Wg/XheAMKDeDu
	 coOtH3LvRC/W3UtUcStNjIBjhI6NBGI5cYFWcYvObfXwETuZisb5epS8DGpWpQdwKV
	 ZzSnCgUoos8Ps6ZQ2mJ4kAjz3ZUWe34m74SdH0VpP2V6mtcW/fmnQms4X8fzOFGbzo
	 5n2xdLpTmFqxA==
From: "Xin Li (Intel)" <xin@zytor.com>
To: linux-kernel@vger.kernel.org, kvm@vger.kernel.org,
        linux-perf-users@vger.kernel.org, linux-hyperv@vger.kernel.org,
        virtualization@lists.linux.dev, linux-pm@vger.kernel.org,
        linux-edac@vger.kernel.org, xen-devel@lists.xenproject.org,
        linux-acpi@vger.kernel.org, linux-hwmon@vger.kernel.org,
        netdev@vger.kernel.org, platform-driver-x86@vger.kernel.org
Cc: tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
        dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com,
        acme@kernel.org, jgross@suse.com, andrew.cooper3@citrix.com,
        peterz@infradead.org, namhyung@kernel.org, mark.rutland@arm.com,
        alexander.shishkin@linux.intel.com, jolsa@kernel.org,
        irogers@google.com, adrian.hunter@intel.com, kan.liang@linux.intel.com,
        wei.liu@kernel.org, ajay.kaher@broadcom.com,
        bcm-kernel-feedback-list@broadcom.com, tony.luck@intel.com,
        pbonzini@redhat.com, vkuznets@redhat.com, seanjc@google.com,
        luto@kernel.org, boris.ostrovsky@oracle.com, kys@microsoft.com,
        haiyangz@microsoft.com, decui@microsoft.com,
        dapeng1.mi@linux.intel.com
Subject: [PATCH v3 00/14] MSR code cleanup part one
Date: Fri, 25 Apr 2025 01:34:23 -0700
Message-ID: <20250425083442.2390017-1-xin@zytor.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This patch set is the first part of the patch set:

  MSR refactor with new MSR instructions support

@ https://lore.kernel.org/lkml/20250422082216.1954310-1-xin@zytor.com/T/#m5a34be7d4ed55f0baca965cb65452a08e9ad7c8a


It's getting *WAY* too big, and whether to zap the pv_ops MSR APIs is
still under argument.  Dave Hansen suggested to focus on rename stuff
first, most of which he acked.

Jürgen Groß also gave his RBs to most of the Xen MSR cleanup patches.

So here comes the first MSR cleanup patch set with version 3.


This patch series is based on:

  git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git x86/msr


Xin Li (Intel) (14):
  x86/msr: Move rdtsc{,_ordered}() to <asm/tsc.h>
  x86/msr: Remove rdpmc()
  x86/msr: Rename rdpmcl() to rdpmc()
  x86/msr: Convert the rdpmc() macro into an always inline function
  x86/msr: Return u64 consistently in Xen PMC read functions
  x86/msr: Convert __wrmsr() uses to native_wrmsr{,q}() uses
  x86/msr: Add the native_rdmsrq() helper
  x86/msr: Convert __rdmsr() uses to native_rdmsrq() uses
  x86/xen/msr: Remove calling native_{read,write}_msr{,_safe}() in
    pmu_msr_{read,write}()
  x86/xen/msr: Remove pmu_msr_{read,write}()
  x86/xen/msr: Remove the error pointer argument from set_seg()
  x86/pvops/msr: refactor pv_cpu_ops.write_msr{,_safe}()
  x86/msr: Replace wrmsr(msr, low, 0) with wrmsrq(msr, low)
  x86/msr: Change the function type of native_read_msr_safe()

 arch/x86/coco/sev/core.c                      |   2 +-
 arch/x86/events/amd/brs.c                     |   4 +-
 arch/x86/events/amd/uncore.c                  |   2 +-
 arch/x86/events/core.c                        |   2 +-
 arch/x86/events/intel/core.c                  |   4 +-
 arch/x86/events/intel/ds.c                    |   2 +-
 arch/x86/events/msr.c                         |   3 +
 arch/x86/events/perf_event.h                  |   1 +
 arch/x86/events/probe.c                       |   2 +
 arch/x86/hyperv/hv_apic.c                     |   6 +-
 arch/x86/hyperv/hv_vtl.c                      |   4 +-
 arch/x86/hyperv/ivm.c                         |   3 +-
 arch/x86/include/asm/apic.h                   |   4 +-
 arch/x86/include/asm/fred.h                   |   1 +
 arch/x86/include/asm/microcode.h              |   2 +
 arch/x86/include/asm/mshyperv.h               |   3 +-
 arch/x86/include/asm/msr.h                    | 130 +++++-------------
 arch/x86/include/asm/paravirt.h               |  57 ++++----
 arch/x86/include/asm/paravirt_types.h         |  10 +-
 arch/x86/include/asm/suspend_32.h             |   1 +
 arch/x86/include/asm/suspend_64.h             |   1 +
 arch/x86/include/asm/switch_to.h              |   4 +-
 arch/x86/include/asm/tsc.h                    |  76 +++++++++-
 arch/x86/kernel/cpu/amd.c                     |   2 +-
 arch/x86/kernel/cpu/common.c                  |  10 +-
 arch/x86/kernel/cpu/mce/core.c                |   6 +-
 arch/x86/kernel/cpu/resctrl/pseudo_lock.c     |  25 ++--
 arch/x86/kernel/cpu/resctrl/rdtgroup.c        |   2 +-
 arch/x86/kernel/cpu/umwait.c                  |   4 +-
 arch/x86/kernel/fpu/xstate.h                  |   1 +
 arch/x86/kernel/hpet.c                        |   1 +
 arch/x86/kernel/kvm.c                         |   2 +-
 arch/x86/kernel/kvmclock.c                    |   2 +-
 arch/x86/kernel/process_64.c                  |   1 +
 arch/x86/kernel/trace_clock.c                 |   2 +-
 arch/x86/kernel/tsc_sync.c                    |   1 +
 arch/x86/kvm/svm/svm.c                        |  34 ++---
 arch/x86/kvm/vmx/vmx.c                        |   4 +-
 arch/x86/lib/kaslr.c                          |   2 +-
 arch/x86/mm/mem_encrypt_identity.c            |   5 +-
 arch/x86/realmode/init.c                      |   1 +
 arch/x86/xen/enlighten_pv.c                   |  58 ++++----
 arch/x86/xen/pmu.c                            |  69 +++-------
 arch/x86/xen/xen-ops.h                        |   5 +-
 drivers/acpi/processor_perflib.c              |   1 +
 drivers/acpi/processor_throttling.c           |   3 +-
 drivers/cpufreq/amd-pstate-ut.c               |   2 +
 drivers/hwmon/hwmon-vid.c                     |   4 +
 drivers/net/vmxnet3/vmxnet3_drv.c             |   4 +
 drivers/platform/x86/intel/pmc/cnp.c          |   1 +
 .../intel/speed_select_if/isst_if_common.c    |   1 +
 drivers/platform/x86/intel/turbo_max_3.c      |   1 +
 52 files changed, 284 insertions(+), 294 deletions(-)


base-commit: a5447e92e169dafaf02fd653500105c7186d7128
-- 
2.49.0


