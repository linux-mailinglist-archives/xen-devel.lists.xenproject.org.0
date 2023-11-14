Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D97F57EB5F0
	for <lists+xen-devel@lfdr.de>; Tue, 14 Nov 2023 18:58:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.633078.987604 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r2xfM-0000N3-Pu; Tue, 14 Nov 2023 17:57:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 633078.987604; Tue, 14 Nov 2023 17:57:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r2xfM-0000II-M3; Tue, 14 Nov 2023 17:57:36 +0000
Received: by outflank-mailman (input) for mailman id 633078;
 Tue, 14 Nov 2023 17:50:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5HBD=G3=3mdeb.com=krystian.hebel@srs-se1.protection.inumbo.net>)
 id 1r2xYU-0004mK-BL
 for xen-devel@lists.xenproject.org; Tue, 14 Nov 2023 17:50:30 +0000
Received: from 4.mo583.mail-out.ovh.net (4.mo583.mail-out.ovh.net
 [178.33.111.247]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4c4a8a8f-8316-11ee-98db-6d05b1d4d9a1;
 Tue, 14 Nov 2023 18:50:29 +0100 (CET)
Received: from director8.ghost.mail-out.ovh.net (unknown [10.109.156.215])
 by mo583.mail-out.ovh.net (Postfix) with ESMTP id 8770029423
 for <xen-devel@lists.xenproject.org>; Tue, 14 Nov 2023 17:50:28 +0000 (UTC)
Received: from ghost-submission-6684bf9d7b-x5j2z (unknown [10.110.115.90])
 by director8.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 8F5A81FD24;
 Tue, 14 Nov 2023 17:50:27 +0000 (UTC)
Received: from 3mdeb.com ([37.59.142.103])
 by ghost-submission-6684bf9d7b-x5j2z with ESMTPSA
 id rx40GWOzU2V/lwcATVRwWg
 (envelope-from <krystian.hebel@3mdeb.com>); Tue, 14 Nov 2023 17:50:27 +0000
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
X-Inumbo-ID: 4c4a8a8f-8316-11ee-98db-6d05b1d4d9a1
Authentication-Results:garm.ovh; auth=pass (GARM-103G0054052121a-002a-44d4-9d02-8e709530af71,
                    1C6EC45AC3E1968723EBE40916FD99D0F8B07574) smtp.auth=krystian.hebel@3mdeb.com
X-OVh-ClientIp:213.192.77.249
From: Krystian Hebel <krystian.hebel@3mdeb.com>
To: xen-devel@lists.xenproject.org
Cc: Krystian Hebel <krystian.hebel@3mdeb.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>,
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [XEN PATCH 0/9] x86: parallelize AP bring-up during boot
Date: Tue, 14 Nov 2023 18:49:54 +0100
Message-ID: <cover.1699982111.git.krystian.hebel@3mdeb.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 12926456833206757834
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvkedrudeffedgudefucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvefufffkofgggfestdekredtredttdenucfhrhhomhepmfhrhihsthhirghnucfjvggsvghluceokhhrhihsthhirghnrdhhvggsvghlseefmhguvggsrdgtohhmqeenucggtffrrghtthgvrhhnpefhheeigeffkeejudegieeifeeiuedtfefffeefudefjeethfffueelieegfeegueenucffohhmrghinhepghhithhhuhgsrdgtohhmnecukfhppeduvdejrddtrddtrddupddvudefrdduledvrdejjedrvdegledpfeejrdehledrudegvddruddtfeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeduvdejrddtrddtrddupdhmrghilhhfrhhomhepoehkrhihshhtihgrnhdrhhgvsggvlhesfehmuggvsgdrtghomheqpdhnsggprhgtphhtthhopedupdhrtghpthhtohepgigvnhdquggvvhgvlheslhhishhtshdrgigvnhhprhhojhgvtghtrdhorhhgpdfovfetjfhoshhtpehmohehkeefpdhmohguvgepshhmthhpohhuth

Patch series available on this branch:
https://github.com/TrenchBoot/xen/tree/smp_cleanup_upstreaming

This series makes AP bring-up parallel on x86. This reduces number of
IPIs (and more importantly, delays between them) required to start all
logical processors significantly.

In order to make it possible, some state variables that were global
had to be made per-CPU. In most cases, accesses to those variables can
be performed through helper macros, some of them existed before in a
different form.

In addition to work required for parallel initialization, I've fixed
issues in error path around `machine_restart()` that were discovered
during implementation and testing.

CPU hotplug should not be affected, but I had no way of testing it.
During wakeup from S3 APs are started one by one. It should be possible
to enable parallel execution there as well, but I don't have a way of
testing it as of now.

To measure the improvement, I added output lines (identical for before
and after changes so there is no impact of printing over serial) just
above and below `if ( !pv_shim )` block. `console_timestamps=raw` was
used to get as accurate timestamp as possible, and average over 3 boots
was taken into account for each measurement. The final improvement was
calculated as (1 - after/before) * 100%, rounded to 0.01%. These are
the results:

* Dell OptiPlex 9010 with Intel(R) Core(TM) i5-3470 CPU @ 3.20GHz
  (4 cores, 4 threads): 48.83%
* MSI PRO Z790-P with 13th Gen Intel(R) Core(TM) i5-13600K (14 cores,
  20 threads, 6P+8E) `smt=on`: 36.16%
* MSI PRO Z790-P with 13th Gen Intel(R) Core(TM) i5-13600K (14 cores,
  20 threads, 6P+8E) `smt=off`: 0.25% (parking takes a lot of additional
  time)
* HP t630 Thin Client with AMD Embedded G-Series GX-420GI Radeon R7E
  (4 cores, 4 threads): 68.00%

Krystian Hebel (9):
  x86/boot: choose AP stack based on APIC ID
  x86: don't access x86_cpu_to_apicid[] directly, use
    cpu_physical_id(cpu)
  x86/smp: drop x86_cpu_to_apicid, use cpu_data[cpu].apicid instead
  x86/smp: move stack_base to cpu_data
  x86/smp: call x2apic_ap_setup() earlier
  x86/shutdown: protect against recurrent machine_restart()
  x86/smp: drop booting_cpu variable
  x86/smp: make cpu_state per-CPU
  x86/smp: start APs in parallel during boot

 xen/arch/x86/acpi/cpu_idle.c          |   4 +-
 xen/arch/x86/acpi/lib.c               |   2 +-
 xen/arch/x86/apic.c                   |   2 +-
 xen/arch/x86/boot/trampoline.S        |  20 +++
 xen/arch/x86/boot/x86_64.S            |  34 ++++-
 xen/arch/x86/cpu/mwait-idle.c         |   4 +-
 xen/arch/x86/domain.c                 |   2 +-
 xen/arch/x86/include/asm/asm_defns.h  |   2 +-
 xen/arch/x86/include/asm/cpufeature.h |   2 +
 xen/arch/x86/include/asm/processor.h  |   2 +
 xen/arch/x86/include/asm/smp.h        |   7 +-
 xen/arch/x86/mpparse.c                |   6 +-
 xen/arch/x86/numa.c                   |  17 +--
 xen/arch/x86/platform_hypercall.c     |   2 +-
 xen/arch/x86/setup.c                  |  25 +++-
 xen/arch/x86/shutdown.c               |  20 ++-
 xen/arch/x86/smpboot.c                | 207 ++++++++++++++++----------
 xen/arch/x86/spec_ctrl.c              |   2 +-
 xen/arch/x86/sysctl.c                 |   2 +-
 xen/arch/x86/traps.c                  |   4 +-
 xen/arch/x86/x86_64/asm-offsets.c     |   5 +-
 xen/include/xen/smp.h                 |   2 -
 22 files changed, 248 insertions(+), 125 deletions(-)


base-commit: fb41228ececea948c7953c8c16fe28fd65c6536b
prerequisite-patch-id: 142a87c707411d49e136c3fb76f1b14963ec6dc8
prerequisite-patch-id: f155cb7e2761deec26b76f1b8b587bc56a404c80
-- 
2.41.0


