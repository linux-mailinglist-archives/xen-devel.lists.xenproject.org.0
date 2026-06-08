Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id PxIVGQ3YJmqflgIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 08 Jun 2026 16:56:13 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 825C8657A7F
	for <lists+xen-devel@lfdr.de>; Mon, 08 Jun 2026 16:56:12 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=infradead.org header.s=desiato.20200630 header.b=P9MXUoXj;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=infradead.org
Received: from list by lists.xenproject.org with outflank-mailman.1331757.1594526 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wWbOW-0003yW-V2; Mon, 08 Jun 2026 14:56:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1331757.1594526; Mon, 08 Jun 2026 14:56:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wWbOV-0003Za-KP; Mon, 08 Jun 2026 14:56:03 +0000
Received: by outflank-mailman (input) for mailman id 1331757;
 Mon, 08 Jun 2026 14:55:42 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <BATV+614c7b1bd25833f05746+8324+infradead.org+dwmw2@desiato.srs.infradead.org>)
 id 1wWbO8-0007MI-QZ
 for xen-devel@lists.xenproject.org; Mon, 08 Jun 2026 14:55:40 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wWbO8-008Sst-60; Mon, 08 Jun 2026 16:55:40 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <BATV+614c7b1bd25833f05746+8324+infradead.org+dwmw2@desiato.srs.infradead.org>)
 id 6a26d7e3-e002-0a2a0a5209dd-0a2a4505d032-26
 for <multiple-recipients>; Mon, 08 Jun 2026 16:55:40 +0200
Received: from [90.155.92.199] (helo=desiato.infradead.org)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from
 <BATV+614c7b1bd25833f05746+8324+infradead.org+dwmw2@desiato.srs.infradead.org>)
 id 6a26d7eb-aaa8-0a2a45050019-5a9b5cc7e5f2-3
 for <multiple-recipients>; Mon, 08 Jun 2026 16:55:40 +0200
Received: from [2001:8b0:10b:1::425] (helo=i7.infradead.org)
 by desiato.infradead.org with esmtpsa (Exim 4.99.2 #2 (Red Hat Linux))
 id 1wWbNU-00000001Afw-2M3l; Mon, 08 Jun 2026 14:55:00 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.99.2 #2 (Red
 Hat Linux)) id 1wWbNR-00000000NEV-1CLO;
 Mon, 08 Jun 2026 15:54:57 +0100
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
	d=infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:To:From:Reply-To:Cc:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=TgKl1KOO3MJY6Y2LA+lrNOwCy2WWSJSUW1q+Go58VwI=; b=P9MXUoXj7e3DhrM2y3IHOHq84j
	Dep6NROhhD5T6eCTvYbJKAS+eTglb9s+jKSn6uVmst9s5JTyCVQV9f14aN3sUIGo79+gzb2WHc7YU
	E/8Zq1W/ZqewrUv9ui/cszWJWLCs6e2QqNUl7nvYGE9dtX/H7iRVy930wxbzjbHuzIfv0YVWsdSey
	iZDAnFMYmwzQ3frOMg9RCyIqvH8dapfKqWvZL6LU/mPacHRped/qRnvVQbUDpKDMTuzG2/7idCnTT
	wdfpfALh8+kMdn0kKQZPa5Ce4FWQMNt14NCd8ogagcqSIYCifP5t8FEZENqDYEFTlW4j9MeiChGsp
	mPromYJw==;
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
Subject: [PATCH v5 00/34] Cleaning up the KVM clock mess
Date: Mon,  8 Jun 2026 15:47:41 +0100
Message-ID: <20260608145455.89187-1-dwmw2@infradead.org>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: David Woodhouse <dwmw2@infradead.org>
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by desiato.infradead.org. See http://www.infradead.org/rpr.html
X-purgate-ID: tlsNG-c201ff/1780930540-D3F66443-5E7C925D/0/0
X-purgate-type: clean
X-purgate-size: 7281
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.19 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[infradead.org,none];
	R_DKIM_ALLOW(-0.20)[infradead.org:s=desiato.20200630];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:pbonzini@redhat.com,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:seanjc@google.com,m:tglx@kernel.org,m:mingo@redhat.com,m:bp@alien8.de,m:dave.hansen@linux.intel.com,m:x86@kernel.org,m:hpa@zytor.com,m:vkuznets@redhat.com,m:jgross@suse.com,m:boris.ostrovsky@oracle.com,m:dwmw2@infradead.org,m:paul@xen.org,m:jic23@kernel.org,m:Sascha.Bischoff@arm.com,m:maz@kernel.org,m:joey.gouly@arm.com,m:jalliste@amazon.com,m:dongli.zhang@oracle.com,m:joe.jin@oracle.com,m:kvm@vger.kernel.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:xen-devel@lists.xenproject.org,m:linux-kselftest@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[dwmw2@infradead.org,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	RCPT_COUNT_TWELVE(0.00)[27];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[infradead.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dwmw2@infradead.org,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 825C8657A7F

This is v5 of the series to clean up the KVM clock, rebased onto
tip/timers/ptp (which now includes Thomas's ktime snapshot series and
the read_snapshot patches for hyperv, kvmclock, and vmclock).

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

Changes since v4:
 - Rebased onto tip/timers/ptp (includes ktime snapshot infrastructure)
 - Dropped "WARN if kvm_get_walltime_and_clockread() fails" — the WARN
   was spurious during clocksource transitions
 - Dropped guest-side "Obtain TSC frequency from CPUID" patches (adopted
   by Sean for a separate series)
 - Dropped KVM_VCPU_TSC_EFFECTIVE_FREQ
 - Fixed false re-enabling of master clock when a single vCPU syncs
   multiple times at a mismatched frequency: introduced per-vCPU
   cur_tsc_freq_generation counter so each vCPU is counted exactly once
 - Unified nr_vcpus_matched_tsc and nr_vcpus_matched_freq to use the
   same counting convention (1-based, >= online_vcpus threshold)
 - "Avoid gratuitous global clock updates": kept global update in
   non-master-clock mode on vCPU load (CLOCK_MONOTONIC_RAW means no NTP
   drift but preserving the existing safety); only optimize master clock
 - "Xen runstate negative time": refined to update state but not account
   time on backwards clock, always update last_steal and guest shared page
 - Added "Activate master clock immediately on vCPU creation" to avoid
   unnecessary non-master-clock window during VM setup
 - New final patches: use ktime_get_snapshot_id() for master clock
   reference, then remove pvclock_gtod_data entirely (replaced by direct
   ktime_get_raw() + offs_boot computation)
 - Added masterclock_offset_test selftest (verifies kvmclock consistency
   across vCPUs with different TSC offsets)
 - Added xen_cpuid_timing_test selftest
 - Added pvclock_migration_test selftest
 - Addressed AI reviewer (Sashiko) feedback throughout:
   - get_kvmclock(): goto fallback on clock read failure instead of
     using uninitialized data; single #ifdef CONFIG_X86_64 block
   - kvm_synchronize_tsc(): changed ns to s64 to match function
     signature; moved time reads inside tsc_write_lock
   - Kill last_tsc fields: use kvm_scale_tsc() subtraction for
     backwards TSC instead of zeroing cur_tsc_write
   - KVM_[GS]ET_CLOCK_GUEST: validate padding fields, bounds-check
     tsc_shift
   - pvclock selftest: seqcount loop for torn-read safety, per-vCPU
     pvclock addresses, graceful skip when caps unavailable
   - KVM_VCPU_TSC_SCALE: return -ENXIO when !has_tsc_control
   - UAPI pvclock-abi: added -D__KERNEL__ to xen-hypercalls.sh
   - VMX: also clear SECONDARY_EXEC_TSC_SCALING from vmcs_config

David Woodhouse (31):
  KVM: x86/xen: Do not corrupt KVM clock in kvm_xen_shared_info_init()
  KVM: x86: Improve accuracy of KVM clock when TSC scaling is in force
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
  KVM: x86: Factor out kvm_use_master_clock()
  KVM: x86: Avoid gratuitous global clock updates
  KVM: x86/xen: Prevent runstate times from becoming negative
  KVM: x86: Avoid redundant masterclock updates from multiple vCPUs
  KVM: x86: Remove runtime Xen TSC frequency CPUID update
  KVM: x86: Re-synchronize TSC after KVM_SET_TSC_KHZ
  KVM: x86: Use ktime_get_snapshot_id() for master clock
  KVM: x86: Compute kvmclock base without pvclock_gtod_data
  KVM: x86: Replace pvclock_gtod_data vclock_mode with boolean
  KVM: x86: Remove pvclock_gtod_data and private timekeeping code
  KVM: selftests: Add master clock offset test
  KVM: selftests: Add Xen/generic CPUID timing leaf test
  KVM: selftests: Add Xen runstate migration test

Jack Allister (3):
  UAPI: x86: Move pvclock-abi to UAPI for x86 platforms
  KVM: x86: Add KVM_[GS]ET_CLOCK_GUEST for accurate KVM clock migration
  KVM: selftests: Add KVM/PV clock selftest to prove timer correction

 Documentation/virt/kvm/api.rst                     |   37 +
 Documentation/virt/kvm/devices/vcpu.rst            |  119 ++-
 MAINTAINERS                                        |    4 +-
 arch/x86/include/asm/kvm_host.h                    |   16 +-
 arch/x86/include/uapi/asm/kvm.h                    |    6 +
 arch/x86/include/{ => uapi}/asm/pvclock-abi.h      |   27 +-
 arch/x86/kvm/cpuid.c                               |   16 -
 arch/x86/kvm/svm/svm.c                             |    3 +-
 arch/x86/kvm/vmx/vmx.c                             |    4 +-
 arch/x86/kvm/x86.c                                 | 1039 ++++++++++++--------
 arch/x86/kvm/xen.c                                 |   30 +-
 arch/x86/kvm/xen.h                                 |   13 -
 include/uapi/linux/kvm.h                           |    3 +
 scripts/xen-hypercalls.sh                          |    2 +-
 tools/testing/selftests/kvm/Makefile.kvm           |    4 +
 .../selftests/kvm/x86/masterclock_offset_test.c    |  180 ++++
 .../selftests/kvm/x86/pvclock_migration_test.c     |  382 +++++++
 tools/testing/selftests/kvm/x86/pvclock_test.c     |  441 +++++++++
 .../selftests/kvm/x86/xen_cpuid_timing_test.c      |  230 +++++
 .../testing/selftests/kvm/x86/xen_migration_test.c |  194 ++++
 20 files changed, 2263 insertions(+), 487 deletions(-)

base-commit: bc484a5096732cd858771cccd3164ec985bdc03d


