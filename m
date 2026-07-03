Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 0knIFCMoSGoknAAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 03 Jul 2026 23:22:43 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DAD46705BE3
	for <lists+xen-devel@lfdr.de>; Fri, 03 Jul 2026 23:22:42 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=infradead.org header.s=casper.20170209 header.b=W9XzMKZF;
	dmarc=pass (policy=none) header.from=infradead.org;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.1353755.1609499 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wflKq-0006HC-F2; Fri, 03 Jul 2026 21:22:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1353755.1609499; Fri, 03 Jul 2026 21:22:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wflKq-0006Cb-4W; Fri, 03 Jul 2026 21:22:08 +0000
Received: by outflank-mailman (input) for mailman id 1353755;
 Fri, 03 Jul 2026 21:22:06 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <BATV+ba378bf2ab63d22ff04d+8349+infradead.org+dwmw2@casper.srs.infradead.org>)
 id 1wflKn-0005QS-Tu
 for xen-devel@lists.xenproject.org; Fri, 03 Jul 2026 21:22:06 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wflKn-00CeeP-A4; Fri, 03 Jul 2026 23:22:05 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <BATV+ba378bf2ab63d22ff04d+8349+infradead.org+dwmw2@casper.srs.infradead.org>)
 id 6a4827de-bab6-0a2a0a5309dd-0a2a450adcec-18
 for <multiple-recipients>; Fri, 03 Jul 2026 23:22:05 +0200
Received: from [90.155.50.34] (helo=casper.infradead.org)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <BATV+ba378bf2ab63d22ff04d+8349+infradead.org+dwmw2@casper.srs.infradead.org>)
 id 6a4827f7-e40e-0a2a450a0019-5a9b3222e672-3
 for <multiple-recipients>; Fri, 03 Jul 2026 23:22:00 +0200
Received: from [2001:8b0:10b:1::425] (helo=i7.infradead.org)
 by casper.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
 id 1wflKV-0000000AsXw-3fP8; Fri, 03 Jul 2026 21:21:48 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.99.2 #2 (Red
 Hat Linux)) id 1wflKV-00000001RNm-31u8;
 Fri, 03 Jul 2026 22:21:47 +0100
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Sender:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-Type:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=wvuVYxcpMKTUzB1PVAb2vp+z8q/daFQH97Zt0FzYdTI=; b=W9XzMKZF+Q5CoOq/aV2FImKmn4
	+MBNEUMz1UUX//35ieMEnUbaiZsHQsTOrfpMqJyem7xM2MCXsESLogrweax1K4VEn7VGsaAxuFtol
	n+KQ3EN4fgjtWaRqFyqxHg1HXf/yi2skXyW+jTaS0Qk1V7TSrvx56j13mRj5oekE/3fEQ694N2cEW
	mgq2fLxp2c99mW3FSQvDkCeudg1OHZOrce5n9XulglxvOXfr3wtY6IequF8Fr3xVB2motyCwj4WPC
	gykHtGQP7j0TgEtGz5X17+6/VdjMQG4YNf7bRWnBi75ZgSnmbQsHS/Sr74SliiI5bkrRKoTzdHNeY
	jhjnQZOA==;
From: David Woodhouse <dwmw2@infradead.org>
To: Paolo Bonzini <pbonzini@redhat.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Sean Christopherson <seanjc@google.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	Vitaly Kuznetsov <vkuznets@redhat.com>,
	Juergen Gross <jgross@suse.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	David Woodhouse <dwmw2@infradead.org>,
	Paul Durrant <paul@xen.org>,
	Jonathan Cameron <jic23@kernel.org>,
	Sascha Bischoff <Sascha.Bischoff@arm.com>,
	Marc Zyngier <maz@kernel.org>,
	Joey Gouly <joey.gouly@arm.com>,
	Jack Allister <jalliste@amazon.com>,
	Dongli Zhang <dongli.zhang@oracle.com>,
	joe.jin@oracle.com,
	kvm@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	xen-devel@lists.xenproject.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH v6 00/36] Cleaning up the KVM clock mess
Date: Fri,  3 Jul 2026 22:17:39 +0100
Message-ID: <20260703212145.343527-1-dwmw2@infradead.org>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: David Woodhouse <dwmw2@infradead.org>
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html
X-purgate-ID: tlsNG-4011c0/1783113725-CFF32DDE-2FE648EC/0/0
X-purgate-type: clean
X-purgate-size: 8553
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.31 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[infradead.org,none];
	R_DKIM_ALLOW(-0.20)[infradead.org:s=casper.20170209];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[27];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS(0.00)[m:pbonzini@redhat.com,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:seanjc@google.com,m:tglx@kernel.org,m:mingo@redhat.com,m:bp@alien8.de,m:dave.hansen@linux.intel.com,m:x86@kernel.org,m:hpa@zytor.com,m:vkuznets@redhat.com,m:jgross@suse.com,m:boris.ostrovsky@oracle.com,m:dwmw2@infradead.org,m:paul@xen.org,m:jic23@kernel.org,m:Sascha.Bischoff@arm.com,m:maz@kernel.org,m:joey.gouly@arm.com,m:jalliste@amazon.com,m:dongli.zhang@oracle.com,m:joe.jin@oracle.com,m:kvm@vger.kernel.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:xen-devel@lists.xenproject.org,m:linux-kselftest@vger.kernel.org,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[dwmw2@infradead.org,xen-devel-bounces@lists.xenproject.org];
	ARC_NA(0.00)[];
	DKIM_TRACE(0.00)[infradead.org:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:from_smtp,lists.xenproject.org:helo,lists.xenproject.org:rdns,infradead.org:from_mime,infradead.org:dkim,infradead.org:mid];
	FROM_NEQ_ENVFROM(0.00)[dwmw2@infradead.org,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: DAD46705BE3

This is v6 of the series to clean up the KVM clock, rebased onto the
tip timers/ptp material (the timers-ptp-2026-06-13 merge, which includes
Thomas's ktime snapshot series and the read_snapshot patches).

The KVM clock has historically suffered from three problems:

 1. Imprecision: get_kvmclock_ns() computed the clock from the *host*
    TSC without applying guest TSC scaling, causing systemic drift from
    the values the guest computes from its own TSC.

 2. Unnecessary discontinuities: gratuitous KVM_REQ_MASTERCLOCK_UPDATE
    requests caused the master clock reference point to be re-snapshotted,
    yanking the guest's clock due to arithmetic precision differences.

 3. No precise migration API: the existing KVM_[GS]ET_CLOCK only allows
    setting the clock at a given UTC reference time, which is necessarily
    imprecise. There was no way to preserve the exact arithmetic
    relationship between guest TSC and KVM clock across live migration.

This series addresses all three, and adds new APIs for precise clock
migration and TSC frequency reporting. As an added bonus, it now rips
out the whole pvclock_gtod_data hack which was shadowing the kernel's
timekeeping, and uses ktime snapshots as $DEITY (well, Thomas) intended.

v5: https://lore.kernel.org/all/20260608145455.89187-1-dwmw2@infradead.org/

Changes since v5:
 - Rebased onto the tip timers-ptp-2026-06-13 merge.

 - Series shape: two new patches ("KVM: selftests: Use UAPI pvclock-abi.h
   in xen_shinfo_test" and "KVM: x86: Activate master clock from
   kvm_arch_init_vm()"); "Replace pvclock_gtod_data vclock_mode with
   boolean" is replaced by "Cache host vclock_mode for masterclock
   eligibility checks".

 - Sean Christopherson's review:
   * KVM_VCPU_TSC_SCALE: return -ENXIO (not -EINVAL) from the get/set
     device-attribute handlers when !has_tsc_control, and do so in the
     patch that introduces the attribute.
   * Clear SECONDARY_EXEC_TSC_SCALING in setup_vmcs_config() rather than
     vmx_hardware_setup(), so the per-CPU configs recomputed by
     vmx_check_processor_compat() stay consistent with the golden
     vmcs_config.

 - kernel test robot (0-day), i386 W=1 warnings:
   * get_kvmclock(): move hv_clock into the use_master_clock block, drop
     the now-unnecessary get_cpu()/put_cpu() pinning (use_master_clock
     implies a stable synchronised TSC clocksource), and replace the
     goto/'fallback:' label with a 'continue'.
   * pvclock_gtod_notify(): move 'tk' inside CONFIG_X86_64.

 - Correctness fixes from review:
   * KVM_SET_CLOCK_GUEST: bound the shift in hvclock_to_hz(), tighten
     tsc_shift validation to [-31, 31], and reject guest_tsc below
     pvclock.tsc_timestamp.
   * kvm_guest_time_update(): read kvmclock_offset inside the pvclock
     seqcount loop to avoid a torn read.
   * kvm_snapshot_has_tsc(): honour snap->valid and zero-init the
     snapshot, avoiding use of uninitialised stack.
   * kvm_synchronize_tsc(): advance the matched reference point to "now"
     to preserve the 1-second TSC matching window.
   * kvm_track_tsc_matching(): request a masterclock update when
     all_vcpus_matched_tsc changes, so PVCLOCK_TSC_STABLE_BIT is
     broadcast to the other vCPUs.
   * kvm_arch_enable_virtualization_cpu(): adjust cur_tsc_offset together
     with cur_tsc_write under tsc_write_lock on the backwards-TSC / host
     S4 resume path.
   * kvm_set_tsc_khz(): sample the guest TSC before changing the ratio,
     preserving continuity across the frequency change.
   * Keep the real vclock_mode (int) rather than collapsing it to a
     bool, so kvm_check_tsc_unstable() still special-cases HVCLOCK.
   * Activate the master clock, and establish the initial TSC generation
     and kvmclock epoch, from kvm_arch_init_vm() instead of a synchronous
     kvm_update_masterclock() at each vCPU creation (avoids O(N^2)).

 - selftests: use kvm_vm_free() instead of kvm_vm_release(); add the
   missing Makefile entry for xen_migration_test; guard on
   KVM_GET_CLOCK_GUEST / KVM_VCPU_TSC_OFFSET availability; use the
   KVM_VCPU_TSC_SCALE enum instead of a literal; overflow-safe
   arithmetic and looser tolerances.

 - Documentation: fix the KVM_VCPU_TSC_OFFSET / KVM_VCPU_TSC_SCALE ReST
   heading underlines (Randy Dunlap).

 - UAPI: asm/kvm.h now includes <asm/pvclock-abi.h> so the
   KVM_[GS]ET_CLOCK_GUEST ioctls are self-contained.

 - Collected Dongli Zhang's Tested-by (kexec/LUO testing of the KVM clock
   accuracy, pvclock-abi UAPI move, KVM_[GS]ET_CLOCK_GUEST and
   redundant-masterclock-update patches).

David Woodhouse (33):
      KVM: x86/xen: Do not corrupt KVM clock in kvm_xen_shared_info_init()
      KVM: x86: Improve accuracy of KVM clock when TSC scaling is in force
      KVM: selftests: Use UAPI pvclock-abi.h in xen_shinfo_test
      KVM: x86: Explicitly disable TSC scaling without CONSTANT_TSC
      KVM: x86: Activate master clock immediately on vCPU creation
      KVM: x86: Add KVM_VCPU_TSC_SCALE and fix the documentation on TSC migration
      KVM: x86: Avoid NTP frequency skew for KVM clock on 32-bit host
      KVM: x86: Fold __get_kvmclock() into get_kvmclock()
      KVM: x86: Restructure get_kvmclock()
      KVM: x86: Fix KVM clock precision in get_kvmclock() with TSC scaling
      KVM: x86: Use get_kvmclock() in kvm_get_wall_clock_epoch()
      KVM: x86: Fix compute_guest_tsc() to handle negative time deltas
      KVM: x86: Restructure kvm_guest_time_update() for TSC upscaling
      KVM: x86: Simplify and comment kvm_get_time_scale()
      KVM: x86: Remove implicit rdtsc() from kvm_compute_l1_tsc_offset()
      KVM: x86: Improve synchronization in kvm_synchronize_tsc()
      KVM: x86: Kill last_tsc_{nsec,write,offset} fields
      KVM: x86: Replace nr_vcpus_matched_tsc count with all_vcpus_matched_tsc bool
      KVM: x86: Allow KVM master clock mode when TSCs are offset from each other
      KVM: selftests: Add master clock offset test
      KVM: x86: Factor out kvm_use_master_clock()
      KVM: x86: Avoid gratuitous global clock updates
      KVM: x86/xen: Prevent runstate times from becoming negative
      KVM: x86: Avoid redundant masterclock updates from multiple vCPUs
      KVM: x86: Remove runtime Xen TSC frequency CPUID update
      KVM: selftests: Add Xen/generic CPUID timing leaf test
      KVM: x86: Re-synchronize TSC after KVM_SET_TSC_KHZ
      KVM: selftests: Add Xen runstate migration test
      KVM: x86: Use ktime_get_snapshot_id() for master clock
      KVM: x86: Compute kvmclock base without pvclock_gtod_data
      KVM: x86: Cache host vclock_mode for masterclock eligibility checks
      KVM: x86: Remove pvclock_gtod_data and private timekeeping code
      KVM: x86: Activate master clock from kvm_arch_init_vm()

Jack Allister (3):
      UAPI: x86: Move pvclock-abi to UAPI for x86 platforms
      KVM: x86: Add KVM_[GS]ET_CLOCK_GUEST for accurate KVM clock migration
      KVM: selftests: Add KVM/PV clock selftest to prove timer correction

 Documentation/virt/kvm/api.rst                     |   37 +
 Documentation/virt/kvm/devices/vcpu.rst            |  120 ++-
 MAINTAINERS                                        |    4 +-
 arch/x86/include/asm/kvm_host.h                    |   16 +-
 arch/x86/include/uapi/asm/kvm.h                    |    7 +
 arch/x86/include/{ => uapi}/asm/pvclock-abi.h      |   27 +-
 arch/x86/kvm/cpuid.c                               |   16 -
 arch/x86/kvm/svm/svm.c                             |    3 +-
 arch/x86/kvm/vmx/vmx.c                             |   10 +
 arch/x86/kvm/x86.c                                 | 1104 ++++++++++++--------
 arch/x86/kvm/xen.c                                 |   30 +-
 arch/x86/kvm/xen.h                                 |   13 -
 include/uapi/linux/kvm.h                           |    3 +
 scripts/xen-hypercalls.sh                          |    2 +-
 tools/testing/selftests/kvm/Makefile.kvm           |    5 +
 .../selftests/kvm/x86/masterclock_offset_test.c    |  180 ++++
 .../selftests/kvm/x86/pvclock_migration_test.c     |  383 +++++++
 tools/testing/selftests/kvm/x86/pvclock_test.c     |  443 ++++++++
 .../selftests/kvm/x86/xen_cpuid_timing_test.c      |  230 ++++
 .../testing/selftests/kvm/x86/xen_migration_test.c |  194 ++++
 tools/testing/selftests/kvm/x86/xen_shinfo_test.c  |   17 +-
 21 files changed, 2318 insertions(+), 526 deletions(-)

base-commit: 2d6d57f889f3


