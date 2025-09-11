Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1241BB528E2
	for <lists+xen-devel@lfdr.de>; Thu, 11 Sep 2025 08:35:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1119343.1464735 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uwatK-0005Ll-Rk; Thu, 11 Sep 2025 06:34:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1119343.1464735; Thu, 11 Sep 2025 06:34:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uwatK-0005JZ-PA; Thu, 11 Sep 2025 06:34:46 +0000
Received: by outflank-mailman (input) for mailman id 1119343;
 Thu, 11 Sep 2025 06:34:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=rKVg=3W=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1uwatJ-0005JR-NW
 for xen-devel@lists.xenproject.org; Thu, 11 Sep 2025 06:34:45 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6675e229-8ed9-11f0-9809-7dc792cee155;
 Thu, 11 Sep 2025 08:34:42 +0200 (CEST)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 5E2A8683E8;
 Thu, 11 Sep 2025 06:34:39 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 773761372E;
 Thu, 11 Sep 2025 06:34:37 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id KsszG31twmjuTAAAD6G6ig
 (envelope-from <jgross@suse.com>); Thu, 11 Sep 2025 06:34:37 +0000
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
X-Inumbo-ID: 6675e229-8ed9-11f0-9809-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1757572479; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=Lfr1qPpuiB3AOwPU0ZFjKKYSXrWZllg4AtF3tp+3Wzs=;
	b=Rb52kiLtTg3v2u9zgMn3NUgzc+I9t7goexfTSG/6vAd6CFqdCGPPMNDDYCobdCdyrq5sS4
	THsDzUD4UF4y2fXBlIeYIVCPmZLL7CdaqepqR8WgmiYxUf4btn7G6HEQab08I1KrGeDcGm
	nmUC3Xv4HYwAo2tomf/WXQlFMXA6O8w=
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1757572479; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=Lfr1qPpuiB3AOwPU0ZFjKKYSXrWZllg4AtF3tp+3Wzs=;
	b=Rb52kiLtTg3v2u9zgMn3NUgzc+I9t7goexfTSG/6vAd6CFqdCGPPMNDDYCobdCdyrq5sS4
	THsDzUD4UF4y2fXBlIeYIVCPmZLL7CdaqepqR8WgmiYxUf4btn7G6HEQab08I1KrGeDcGm
	nmUC3Xv4HYwAo2tomf/WXQlFMXA6O8w=
From: Juergen Gross <jgross@suse.com>
To: linux-kernel@vger.kernel.org,
	x86@kernel.org,
	linux-hyperv@vger.kernel.org,
	virtualization@lists.linux.dev,
	loongarch@lists.linux.dev,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	kvm@vger.kernel.org
Cc: Juergen Gross <jgross@suse.com>,
	Andy Lutomirski <luto@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	"K. Y. Srinivasan" <kys@microsoft.com>,
	Haiyang Zhang <haiyangz@microsoft.com>,
	Wei Liu <wei.liu@kernel.org>,
	Dexuan Cui <decui@microsoft.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Will Deacon <will@kernel.org>,
	Boqun Feng <boqun.feng@gmail.com>,
	Waiman Long <longman@redhat.com>,
	Jiri Kosina <jikos@kernel.org>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Pawan Gupta <pawan.kumar.gupta@linux.intel.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	xen-devel@lists.xenproject.org,
	Ajay Kaher <ajay.kaher@broadcom.com>,
	Alexey Makhalov <alexey.makhalov@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Russell King <linux@armlinux.org.uk>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>,
	Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	linux-arm-kernel@lists.infradead.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	Vitaly Kuznetsov <vkuznets@redhat.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	Daniel Lezcano <daniel.lezcano@linaro.org>
Subject: [PATCH 00/14] paravirt: cleanup and reorg
Date: Thu, 11 Sep 2025 08:34:19 +0200
Message-ID: <20250911063433.13783-1-jgross@suse.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-1.30 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_COUNT_TWO(0.00)[2];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FREEMAIL_CC(0.00)[suse.com,kernel.org,linutronix.de,redhat.com,alien8.de,linux.intel.com,zytor.com,microsoft.com,infradead.org,gmail.com,oracle.com,lists.xenproject.org,broadcom.com,armlinux.org.uk,arm.com,xen0n.name,linux.ibm.com,ellerman.id.au,csgroup.eu,sifive.com,dabbelt.com,eecs.berkeley.edu,ghiti.fr,linaro.org,goodmis.org,google.com,suse.de,lists.infradead.org,epam.com];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_ALL(0.00)[];
	TAGGED_RCPT(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:mid];
	RCPT_COUNT_GT_50(0.00)[56];
	FROM_HAS_DN(0.00)[];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	R_RATELIMIT(0.00)[to_ip_from(RLfdszjqhz8kzzb9uwpzdm8png)];
	FREEMAIL_ENVRCPT(0.00)[gmail.com]
X-Spam-Flag: NO
X-Spam-Level: 
X-Spam-Score: -1.30

Some cleanups and reorg of paravirt code and headers:

- The first 2 patches should be not controversial at all, as they
  remove just some no longer needed #include and struct forward
  declarations.

- The 3rd patch is removing CONFIG_PARAVIRT_DEBUG, which IMO has
  no real value, as it just changes a crash to a BUG() (the stack
  trace will basically be the same). As the maintainer of the main
  paravirt user (Xen) I have never seen this crash/BUG() to happen.

- The 4th patch is just a movement of code.

- I don't know for what reason asm/paravirt_api_clock.h was added,
  as all archs supporting it do it exactly in the same way. Patch
  5 is removing it.

- Patches 6-12 are streamlining the paravirt clock interfaces by
  using a common implementation across architectures where possible
  and by moving the related code into common sched code, as this is
  where it should live.

- Patches 13+14 are more like RFC material: patch 13 is doing some
  preparation work to enable patch 14 to move all spinlock related
  paravirt functions into qspinlock.h. If this approach is accepted,
  I'd like to continue with this work by moving most (or all?)
  paravirt functions from paravirt.h into the headers where their
  native counterparts are defined. This is meant to keep the native
  and paravirt function definitions together in one place and
  hopefully to be able to reduce the include hell with paravirt.

Juergen Gross (14):
  x86/paravirt: remove not needed includes of paravirt.h
  x86/paravirt: remove some unneeded struct declarations
  x86/paravirt: remove PARAVIRT_DEBUG config option
  x86/paravirt: move thunk macros to paravirt_types.h
  paravirt: remove asm/paravirt_api_clock.h
  sched: move clock related paravirt code to kernel/sched
  arm/paravirt: use common code for paravirt_steal_clock()
  arm64/paravirt: use common code for paravirt_steal_clock()
  loongarch/paravirt: use common code for paravirt_steal_clock()
  riscv/paravirt: use common code for paravirt_steal_clock()
  x86/paravirt: use common code for paravirt_steal_clock()
  x86/paravirt: move paravirt_sched_clock() related code into tsc.c
  x86/paravirt: allow pv-calls outside paravirt.h
  x86/pvlocks: move paravirt spinlock functions into qspinlock.h

 arch/Kconfig                                  |   3 +
 arch/arm/Kconfig                              |   1 +
 arch/arm/include/asm/paravirt.h               |  22 ---
 arch/arm/include/asm/paravirt_api_clock.h     |   1 -
 arch/arm/kernel/Makefile                      |   1 -
 arch/arm/kernel/paravirt.c                    |  23 ---
 arch/arm64/Kconfig                            |   1 +
 arch/arm64/include/asm/paravirt.h             |  14 --
 arch/arm64/include/asm/paravirt_api_clock.h   |   1 -
 arch/arm64/kernel/paravirt.c                  |  11 +-
 arch/loongarch/Kconfig                        |   1 +
 arch/loongarch/include/asm/paravirt.h         |  13 --
 .../include/asm/paravirt_api_clock.h          |   1 -
 arch/loongarch/kernel/paravirt.c              |  10 +-
 arch/powerpc/include/asm/paravirt.h           |   3 -
 arch/powerpc/include/asm/paravirt_api_clock.h |   2 -
 arch/powerpc/platforms/pseries/setup.c        |   4 +-
 arch/riscv/Kconfig                            |   1 +
 arch/riscv/include/asm/paravirt.h             |  14 --
 arch/riscv/include/asm/paravirt_api_clock.h   |   1 -
 arch/riscv/kernel/paravirt.c                  |  11 +-
 arch/x86/Kconfig                              |   8 +-
 arch/x86/entry/entry_64.S                     |   1 -
 arch/x86/entry/vsyscall/vsyscall_64.c         |   1 -
 arch/x86/hyperv/hv_spinlock.c                 |   1 -
 arch/x86/include/asm/apic.h                   |   4 -
 arch/x86/include/asm/highmem.h                |   1 -
 arch/x86/include/asm/mmu_context.h            |   1 -
 arch/x86/include/asm/mshyperv.h               |   1 -
 arch/x86/include/asm/paravirt.h               | 166 ------------------
 arch/x86/include/asm/paravirt_api_clock.h     |   1 -
 arch/x86/include/asm/paravirt_types.h         |  82 +++++++--
 arch/x86/include/asm/pgtable_32.h             |   1 -
 arch/x86/include/asm/qspinlock.h              |  49 +++++-
 arch/x86/include/asm/spinlock.h               |   1 -
 arch/x86/include/asm/timer.h                  |   1 +
 arch/x86/include/asm/tlbflush.h               |   4 -
 arch/x86/kernel/apm_32.c                      |   1 -
 arch/x86/kernel/callthunks.c                  |   1 -
 arch/x86/kernel/cpu/bugs.c                    |   1 -
 arch/x86/kernel/cpu/vmware.c                  |   1 +
 arch/x86/kernel/kvm.c                         |   1 +
 arch/x86/kernel/kvmclock.c                    |   1 +
 arch/x86/kernel/paravirt.c                    |  16 --
 arch/x86/kernel/tsc.c                         |  10 +-
 arch/x86/kernel/vsmp_64.c                     |   1 -
 arch/x86/kernel/x86_init.c                    |   1 -
 arch/x86/lib/cache-smp.c                      |   1 -
 arch/x86/mm/init.c                            |   1 -
 arch/x86/xen/spinlock.c                       |   1 -
 arch/x86/xen/time.c                           |   2 +
 drivers/clocksource/hyperv_timer.c            |   2 +
 drivers/xen/time.c                            |   2 +-
 include/linux/sched/cputime.h                 |  18 ++
 kernel/sched/core.c                           |   5 +
 kernel/sched/cputime.c                        |  13 ++
 kernel/sched/sched.h                          |   3 +-
 57 files changed, 182 insertions(+), 362 deletions(-)
 delete mode 100644 arch/arm/include/asm/paravirt.h
 delete mode 100644 arch/arm/include/asm/paravirt_api_clock.h
 delete mode 100644 arch/arm/kernel/paravirt.c
 delete mode 100644 arch/arm64/include/asm/paravirt_api_clock.h
 delete mode 100644 arch/loongarch/include/asm/paravirt_api_clock.h
 delete mode 100644 arch/powerpc/include/asm/paravirt_api_clock.h
 delete mode 100644 arch/riscv/include/asm/paravirt_api_clock.h
 delete mode 100644 arch/x86/include/asm/paravirt_api_clock.h

-- 
2.51.0


