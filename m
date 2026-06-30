Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Q9tyC1H7Q2oDmwoAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 30 Jun 2026 19:22:25 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F7786E6DBE
	for <lists+xen-devel@lfdr.de>; Tue, 30 Jun 2026 19:22:24 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("headers rsa verify failed") header.d=igalia.com header.s=20170329 header.b=sOrXeRW4;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=igalia.com (policy=none)
Received: from list by lists.xenproject.org with outflank-mailman.1349278.1607145 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wec9y-0001Tq-I4; Tue, 30 Jun 2026 17:22:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1349278.1607145; Tue, 30 Jun 2026 17:22:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wec9y-0001RL-EZ; Tue, 30 Jun 2026 17:22:10 +0000
Received: by outflank-mailman (input) for mailman id 1349278;
 Tue, 30 Jun 2026 17:22:09 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <mfo@igalia.com>) id 1wec9x-0001R7-0u
 for xen-devel@lists.xenproject.org; Tue, 30 Jun 2026 17:22:09 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wec9v-006hKZ-V3
 for xen-devel@lists.xenproject.org; Tue, 30 Jun 2026 19:22:07 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <mfo@igalia.com>)
 id 6a43fb15-2eae-0a2a0a5409dd-0a2a4508e38a-48
 for <xen-devel@lists.xenproject.org>; Tue, 30 Jun 2026 19:22:07 +0200
Received: from [213.97.179.56] (helo=fanzine2.igalia.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <mfo@igalia.com>)
 id 6a43fb3e-edec-0a2a45080019-d561b338dcb8-3
 for <xen-devel@lists.xenproject.org>; Tue, 30 Jun 2026 19:22:07 +0200
Received: from 186-249-148-121.shared.desktop.com.br ([186.249.148.121]
 helo=[127.0.1.1]) by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1wec9Z-007CH3-93; Tue, 30 Jun 2026 19:21:45 +0200
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Cc:To:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Message-Id:Date:Subject:From:Sender:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=7MQytiJiRfFH71U0gvZqh+EfaM2Wca2NqErcBk6rRw0=; b=sOrXeRW4/Ohpy2IrsKTZGsCfXB
	33mbwb1etP/A2yn3De5nSOlf4N7ZiM5QpIFuDU67/MhC+J0WbA9r8tsYn+B7ObQ0qgDg2keimPCcS
	yLF6unqpfXSZfNsdjHugt1kgByfcFAkoxgDSN7AbKtSAyVoaIoQwc8ZATNczEPKuGVg/m+BLn4PxN
	HXnxNTQO/uqEubm1grci9W7a+8Ga2lalvYqiJca3QsEfOeG/c4i4WsmFlprZYThK2mLL2gA+MUTQv
	kY3C5QFYD5t//jV5e+IB/qFA1+GWub5FOMW0wnhZ2o7mz4k1iJGb+IsnJ71xbZ0hbCvEmcTqd5Zi8
	d0VPJCEQ==;
From: Mauricio Faria de Oliveira <mfo@igalia.com>
Subject: [PATCH RESEND v5 0/3] x86/pvh: fix unbootable VMs again (PVH +
 KASAN)
Date: Tue, 30 Jun 2026 14:21:45 -0300
Message-Id: <20260630-pvh-kasan-inline-v5-0-52afc979be81@igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACn7Q2oC/3XNMU/DMBAF4L9SecbIvjg2YWKgKwOMiOFyOTcni
 lPFyAJV+e9YWShqGN893ffOKvMsnNX97qxmLpJlSjW0NztFI6YDaxlqVmDAGwegT2XU75gxaUl
 HSaw9R6QQou0hqPp2mjnK10q+quf9y/7pUb3V+yj5c5q/16Vi1/Z/tFhtdGBvO9c4Rx08yAGPg
 rc0faxagUshbAhQBaA29HcDxejxSmh+hRbMhtBUoeeBg+/IM4UrwV0KfkNwVcDGGvYILdPwR1i
 W5QdkEVVdfwEAAA==
X-Change-ID: 20260422-pvh-kasan-inline-6efac77f1b27
To: Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, 
 x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>, 
 Juergen Gross <jgross@suse.com>, Alexey Dobriyan <adobriyan@gmail.com>, 
 Boris Ostrovsky <boris.ostrovsky@oracle.com>
Cc: kernel-dev@igalia.com, linux-kernel@vger.kernel.org, 
 xen-devel@lists.xenproject.org, Mauricio Faria de Oliveira <mfo@igalia.com>
X-Mailer: b4 0.14.2
X-purgate-ID: tlsNG-c1860d/1782840127-415273FC-C417F0C2/0/0
X-purgate-type: clean
X-purgate-size: 6926
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.61 / 15.00];
	R_DKIM_REJECT(1.00)[igalia.com:s=20170329];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[igalia.com : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:tglx@kernel.org,m:mingo@redhat.com,m:bp@alien8.de,m:dave.hansen@linux.intel.com,m:x86@kernel.org,m:hpa@zytor.com,m:jgross@suse.com,m:adobriyan@gmail.com,m:boris.ostrovsky@oracle.com,m:kernel-dev@igalia.com,m:linux-kernel@vger.kernel.org,m:xen-devel@lists.xenproject.org,m:mfo@igalia.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[igalia.com:email,igalia.com:mid,igalia.com:from_mime];
	FREEMAIL_TO(0.00)[kernel.org,redhat.com,alien8.de,linux.intel.com,zytor.com,suse.com,gmail.com,oracle.com];
	FORGED_SENDER(0.00)[mfo@igalia.com,xen-devel-bounces@lists.xenproject.org];
	RCPT_COUNT_TWELVE(0.00)[13];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[igalia.com:-];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mfo@igalia.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9F7786E6DBE

[RESEND v5 (2026-06-01): address feedback from Borislav Petkov in Patch 1.]

The issue of unbootable VMs with CONFIG_PVH due to CONFIG_KASAN is back.

Booting directly from vmlinux (instead of bzImage) now fails with gcc-14/15
(but works with gcc-12/13) if CONFIG_KASAN_GENERIC is set, on Ubuntu 25.10.

The PVH code is required/supposed not to use the KASAN memory access check
in the kernel entry point as KASAN has not yet been setup, or an exception
is hit and the boot fails.

This was previously described and addressed with __builtin_mem{cmp,set}():
- commit 661362e3dcab ("xen, pvh: fix unbootable VMs (PVH + KASAN - AMD_MEM_ENCRYPT)")
- commit 416a33c9afce ("x86/cpu: fix unbootable VMs by inlining memcmp() in hypervisor_cpuid_base()")
- commit fbe5a6dfe492 ("xen, pvh: fix unbootable VMs by inlining memset() in xen_prepare_pvh()")

However, even with __builtin the compiler may decide to use the out of line
function instead of the inline implementation. So, that does not really fix
the issue unconditionally; see details below.

In order to address this, it's required to switch to inline implementations
that do not depend on the compiler.

There's such a memset() in <asm/string.h> and memcmp() in 'boot/string.c'.
Use them instead of builtins in PVH entry.

Testing:

- Booting from vmlinux (fixed) and bzImage (still works) using
  allnoconfig + CONFIG_PVH + CONFIG_KASAN with gcc-12/13/14/15.

- Building with CONFIG_KEXEC_FILE, CONFIG_CFI and !CONFIG_KASAN with LLVM 20
  (check for a build error not caught previously).

Details/Debugging:

- Only CONFIG_PVH (works):

  make allnoconfig
  ./scripts/config \
    -e 64BIT -e HYPERVISOR_GUEST -e PVH \
    -e SERIAL_8250 -e SERIAL_8250_CONSOLE
  make olddefconfig
  make -j$(nproc) vmlinux

  qemu-system-x86_64 \
    -accel kvm -nodefaults -nographic -serial stdio \
    -kernel vmlinux -append 'console=ttyS0'
  ...
  SeaBIOS (version ...)
  Booting from ROM...
  Linux version ...
  ...
  <Ctrl-C>

- With CONFIG_KASAN (fails)

  ./scripts/config -e KASAN
  make olddefconfig
  make -j$(nproc) vmlinux

  qemu-system-x86_64 \
    -accel kvm -nodefaults -nographic -serial stdio \
    -kernel vmlinux -append 'console=ttyS0'
  ...
  SeaBIOS (version ...)
  Booting from ROM...
  <QEMU reboot loop, flashing the text above>

- Debugging:

  Enable debug info and rebuild.

  QEMU: enable and wait for GDB, stop rebooting, remain running.

  qemu-system-x86_64 \
    -s -S -no-reboot -no-shutdown \
    <other options>

  gdb vmlinux
  (gdb) target remote localhost:1234
  ...
  (gdb) c
  ...
  Thread 2 received signal SIGQUIT, Quit.
  ...
  (gdb) info threads
    Id   Target Id                    Frame
    1    Thread 1.1 (CPU#0 [running]) bytes_is_nonzero (
      start=0xfffffbfff031eebe <error: Cannot access memory at address 0xfffffbfff031eebe>, size=1)
      at .../linux/mm/kasan/generic.c:98
  * 2    Thread 1.2 (CPU#1 [halted ]) 0x00000000000fd0a9 in ?? ()
  ...
  (gdb) thr 1
  ...
  (gdb) bt
  #0  bytes_is_nonzero (start=0xfffffbfff031eebe <error: Cannot access memory at address 0xfffffbfff031eebe>, size=1)
      at .../linux/mm/kasan/generic.c:98
  #1  memory_is_nonzero (start=0xfffffbfff031eebe, end=0xfffffbfff031eebf) at .../linux/mm/kasan/generic.c:115
  #2  memory_is_poisoned_n (addr=0xffffffff818f75f0, size=8) at .../linux/mm/kasan/generic.c:140
  #3  memory_is_poisoned (addr=0xffffffff818f75f0, size=8) at .../linux/mm/kasan/generic.c:172
  #4  check_region_inline (addr=0xffffffff818f75f0, size=8, write=false, ret_ip=18446744071585002062)
      at .../linux/mm/kasan/generic.c:191
  #5  kasan_check_range (addr=addr@entry=0xffffffff818f75f0, size=size@entry=8, write=write@entry=false,
      ret_ip=18446744071585002062) at .../linux/mm/kasan/generic.c:200
  #6  0xffffffff813eb283 in __asan_loadN (addr=addr@entry=0xffffffff818f75f0, size=size@entry=8)
      at .../linux/mm/kasan/generic.c:278
  #7  0xffffffff815df24e in memcmp (cs=cs@entry=0xffffffff818f75f0, ct=ct@entry=0x1be2fe4, count=<optimized out>,
      count@entry=12) at .../linux/lib/string.c:683
  #8  0xffffffff81ba2323 in cpuid_base_hypervisor (sig=0xffffffff818f75f0 "XenVMMXenVMM", leaves=2)
      at .../linux/arch/x86/include/asm/cpuid/api.h:206
  #9  xen_cpuid_base () at .../linux/arch/x86/include/asm/xen/hypervisor.h:46
  #10 xen_prepare_pvh () at .../linux/arch/x86/platform/pvh/enlighten.c:119
  #11 0x0000000001ba2588 in ?? ()
  #12 0x0000000000000000 in ?? ()
  (gdb)

  Frames #7-#8 show the non-builtin memcmp() (lib/string.c) was called
  even with __builtin_memcmp() being used in cpuid_base_hypervisor().

Signed-off-by: Mauricio Faria de Oliveira <mfo@igalia.com>
---
Changes in v5:
- Create a minimal separate header in <asm/shared/string.h> instead,
  to be used by 'boot/setup.c' and <asm/string.h> (Borislav Petkov).
- Patch 1 (in v4/v3) is no longer needed; removed.
- Patch 1 (in v5):
  - Briefly mention there are issues with <asm/string.h>.
  - Remove 'Reviewed-by: Jurgen Gross' to be conservative
    (same code change and result, but the means changed).
- Link to v4: https://lore.kernel.org/r/20260526-pvh-kasan-inline-v4-0-a310e6a25ecd@igalia.com

Changes in v4:
- Patch 1: address Juergen's feedback:
  - s/In next patch/In a future patch/.
  - Move footnote (Reasons not to include...) after "---".
- Add 'Reviewed-by: Juergen Gross' in patches 1 and 2 as well.
- Link to v3: https://lore.kernel.org/r/20260520-pvh-kasan-inline-v3-0-bede769c6ec7@igalia.com

Changes in v3:
- Create and use a separate header for inline string functions
  to fix a build error reported by kernel test robot (patch 1).
- That also removes '#ifndef _SETUP/#endif' in <asm/string.h>.
- Link to v2: https://lore.kernel.org/r/20260427-pvh-kasan-inline-v2-0-2c57b8dcff6a@igalia.com

Changes in v2:
- Add comment about the return value of __inline_memcmp() in patch 1. (v3: now 2)
- Add 'Reviewed-by: Juergen Gross' in patches 2 and 3 (v3: now 3 and 4).
- Link to v1: https://lore.kernel.org/r/20260422-pvh-kasan-inline-v1-0-7e6194344c92@igalia.com

---
Mauricio Faria de Oliveira (3):
      x86/asm, x86/boot: expose inline memcmp
      x86/cpuid: fix unbootable VMs by really inlining memcmp() in hypervisor_cpuid_base()
      x86/pvh: fix unbootable VMs by really inlining memset() in xen_prepare_pvh()

 arch/x86/boot/string.c               |  6 ++----
 arch/x86/include/asm/cpuid/api.h     |  2 +-
 arch/x86/include/asm/shared/string.h | 16 ++++++++++++++++
 arch/x86/include/asm/string.h        |  1 +
 arch/x86/platform/pvh/enlighten.c    |  3 ++-
 5 files changed, 22 insertions(+), 6 deletions(-)
---
base-commit: 7de6ae9e12207ec146f2f3f1e58d1a99317e88bc
change-id: 20260422-pvh-kasan-inline-6efac77f1b27

Best regards,
-- 
Mauricio Faria de Oliveira <mfo@igalia.com>


