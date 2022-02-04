Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B91A4A9DA9
	for <lists+xen-devel@lfdr.de>; Fri,  4 Feb 2022 18:35:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.265745.459286 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nG2Ty-0000es-RX; Fri, 04 Feb 2022 17:34:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 265745.459286; Fri, 04 Feb 2022 17:34:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nG2Ty-0000d2-OG; Fri, 04 Feb 2022 17:34:50 +0000
Received: by outflank-mailman (input) for mailman id 265745;
 Fri, 04 Feb 2022 17:34:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TTBG=ST=citrix.com=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1nG2Tw-0000cw-Uo
 for xen-devel@lists.xenproject.org; Fri, 04 Feb 2022 17:34:49 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id be4f302b-85e0-11ec-8f75-fffcc8bd4f1a;
 Fri, 04 Feb 2022 18:34:47 +0100 (CET)
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
X-Inumbo-ID: be4f302b-85e0-11ec-8f75-fffcc8bd4f1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1643996087;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=PbR2rJWgBd8l/U07rE0KMfGiCfSwypoEiPGi9JzCvTA=;
  b=TncU8WpbQ4C8tx6KEf7xXO75Cb6kHKGDlJhzLdCJ9SbTDpT+KmiDsNdY
   dmitf3rtpn3M3orjpNXMIxLCov00NSbyrNRRhcZGPlz4KM3fTAEM8gTHa
   jClrDgI1GKsVEHbK4BRcdge2GUxgd+NXLxp1dfkdnkQTkFcEl2kI1OYWQ
   M=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: J/p6P4ljyjwR5JgK6GAY5wErsKlvYH78QvuY9xbxzHLRbFffYaVybKODu00WHgI4i+HR1zMhTd
 4N+K4kiwvtyqVZYgwguQqIrvEfiF6Hmc+NPjTb//LtZ7oWTGIkCqPeO6qKZAiSxMVhT3q6CBLW
 6fx8wAdcDwWzlUWP/MxF7/Q+K+IltWr+oFRQsJqQ/I3ce38k7a+RVn6zM+gse9HJEz0CJB3SG5
 MwgecVub/nnF5oVlEO6zspdB9xOkzoHbg/oe6hCJ49PVfTBk2Wt5JiTr9PyZA4cXb/Sh9FwXVY
 yvj5SaCLJO/NS9h3SBzIPavZ
X-SBRS: 5.1
X-MesageID: 65732452
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:7Zj6MqBo0WAVFxVW/+Tkw5YqxClBgxIJ4kV8jS/XYbTApDwl32ZTn
 GUaWWiOaKyJZmDwfdl/YYrnpkJX6JCAzYNhQQY4rX1jcSlH+JHPbTi7wuYcHM8wwunrFh8PA
 xA2M4GYRCwMo/u1Si6FatANl1ElvU2zbue6WL6s1hxZH1c+En970U47wIbVv6Yz6TSHK1LV0
 T/Ni5W31G+Ng1aY5UpNtspvADs21BjDkGtwUm4WPJinj3eH/5UhN7oNJLnZEpfNatI88thW5
 Qr05OrREmvxp3/BAz4++1rxWhVirrX6ZWBihpfKMkQLb9crSiEai84G2PQghUh/rCSvwNddy
 cx3n5GpbQoWEvfSneNNakwNe81+FfUuFL7vJHG+tYqYzlHccmuqyPJrZK00FdRGoKAtWzgIr
 KFGbmBWBvyAr7veLLaTY+9gnMk8auLsO5sSoCpIxjDFF/c2B5vERs0m4PcGgWhr3JwTR54yY
 eIWSAJuTQTrXidiKwYpDoIe37yNn2PGJmgwRFW9+vNsvjm7IBZK+KfpGMrYfJqNX8o9tmSyq
 3/C/m/5KgoHL9HZwj2Amlq8i+mKkS7lVYY6ELyj6uUskFCV3nYUChAdSR28u/bRt6Klc4sBc
 QpOoHNo9PVsshzwJjXgY/GmiFmVmEEbd9tJKcc38SWA9YaO/QOeVlFRG1atd+canMMxQDUr0
 HqAkNXoGSFjvdWpdJ6NyluHhWjsYHZIdAfucQdBFFJYuIe7/OnfmzqSFo4LLUKjsjHi9dgcK
 RiupTN2ubgchNVjO06TrQGe2GLESnQko2cICuTrsoCNs1sRiG2NPdXABb3nARBodt3xor6p5
 yBspiRmxLpSZaxhbQTUKAn3IJmn5uyeLBrXikN1Ep8q+lyFoiD/JtALvW8jdRw2aa7onAMFh
 meJ4mu9A7cIZBOXgVJfOdrtW6zGM4C8fTgaahwkRoUXOcUgHON21CpveVSRzwjQfLsEyskC1
 WOgWZ/0Vx4yUP0/pBLvHrt1+eJ7l0gWmDKILbimnkvP7FZrTCPMIVvzGADVNb5RAWLtiFi9z
 uuzwOPRmkgGDb2jPnKKmWPRRHhTRUUG6VnNg5Q/Xoa+zsBOQTlJ5yb5zexzdop7sb5Sk+uUr
 HixVlUBkAj0hGHdKBXMYXdmMeu9UZF6pHM9HCotIVf3hCRzPdfxtP8SJ8ktYL0q1O1/1vooH
 fMLTNqNX6ZUQTPd9jVDMZSk9N5+dA6mjB6lNja+ZGRtZIZpQgHEo4e2fgbm+CQUIDCwsM8y/
 ++p2g/BGMJRTAV+FsfGLvmoygrp73QanetzWWrOI8VSJxqwoNQ7dXSpg6Zucc8WKBjFyj+L7
 CqsAE8V9bvXvos40NjVnqTY/Y2nJPRzQxhBFG7B4LfoaSSDpji/wZVNWfqjdCzGUD+m472rY
 OhYwq2uMPADm1oW4YNwH6wykPA77trr4bRb0h5lDDPAaFHyUuFsJXyP3M9usKxRx+AG5VvqC
 xzXotQKa6+UPM7FEUIKIFt3Z+uO4vgYhz3O4KlnO079/iJ2oOKKXEg608NgU8CBwG+Z6L8Y/
 No=
IronPort-HdrOrdr: A9a23:jQtTyas9KfJUF7KCuQErUY717skDetV00zEX/kB9WHVpmszxra
 6TdZMgpHjJYVcqKRUdcL+7WJVoLUmxyXcX2/h1AV7BZniEhILAFugLhuGO/9SJIVyZygc378
 ZdmsZFZ+EYdWIK7/rH3A==
X-IronPort-AV: E=Sophos;i="5.88,343,1635220800"; 
   d="scan'208";a="65732452"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH] x86/hvm: Fix boot on systems where HVM isn't available
Date: Fri, 4 Feb 2022 17:34:05 +0000
Message-ID: <20220204173405.22759-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

c/s 27a63cdac388 ("x86/HVM: convert remaining hvm_funcs hook invocations to
alt-call") went too far with dropping NULL function pointer checks.

smp_callin() calls hvm_cpu_up() unconditionally.  When the platform doesn't
support HVM, hvm_enable() exits without filling in hvm_funcs, after which the
altcall pass nukes the (now unconditional) indirect call, causing:

  (XEN) ----[ Xen-4.17.0-10.18-d  x86_64  debug=y  Not tainted ]----
  (XEN) CPU:    1
  (XEN) RIP:    e008:[<ffff82d04034bef5>] start_secondary+0x393/0x3b7
  (XEN) RFLAGS: 0000000000010086   CONTEXT: hypervisor
  ...
  (XEN) Xen code around <ffff82d04034bef5> (start_secondary+0x393/0x3b7):
  (XEN)  ff ff 8b 05 1b 84 17 00 <0f> 0b 0f ff ff 90 89 c3 85 c0 0f 84 db fe ff ff
  ...
  (XEN) Xen call trace:
  (XEN)    [<ffff82d04034bef5>] R start_secondary+0x393/0x3b7
  (XEN)    [<ffff82d0402000e2>] F __high_start+0x42/0x60

To make matters worse, __stop_this_cpu() calls hvm_cpu_down() unconditionally
too, so what happen next is:

  (XEN) ----[ Xen-4.17.0-10.18-d  x86_64  debug=y  Not tainted ]----
  (XEN) CPU:    0
  (XEN) RIP:    e008:[<ffff82d04034ab02>] __stop_this_cpu+0x12/0x3c
  (XEN) RFLAGS: 0000000000010046   CONTEXT: hypervisor
  ...
  (XEN) Xen code around <ffff82d04034ab02> (__stop_this_cpu+0x12/0x3c):
  (XEN)  48 89 e5 e8 8a 1d fd ff <0f> 0b 0f ff ff 90 0f 06 db e3 48 89 e0 48 0d ff
  ...
  (XEN) Xen call trace:
  (XEN)    [<ffff82d04034ab02>] R __stop_this_cpu+0x12/0x3c
  (XEN)    [<ffff82d04034ac15>] F smp_send_stop+0xdd/0xf8
  (XEN)    [<ffff82d04034a229>] F machine_restart+0xa2/0x298
  (XEN)    [<ffff82d04034a42a>] F arch/x86/shutdown.c#__machine_restart+0xb/0x11
  (XEN)    [<ffff82d04022fd15>] F smp_call_function_interrupt+0xbf/0xea
  (XEN)    [<ffff82d04034acc6>] F call_function_interrupt+0x35/0x37
  (XEN)    [<ffff82d040331a70>] F do_IRQ+0xa3/0x6b5
  (XEN)    [<ffff82d04039482a>] F common_interrupt+0x10a/0x120
  (XEN)    [<ffff82d04031f649>] F __udelay+0x3a/0x51
  (XEN)    [<ffff82d04034d5fb>] F __cpu_up+0x48f/0x734
  (XEN)    [<ffff82d040203c2b>] F cpu_up+0x7d/0xde
  (XEN)    [<ffff82d0404543d3>] F __start_xen+0x200b/0x2618
  (XEN)    [<ffff82d0402000ef>] F __high_start+0x4f/0x60

which recurses until hitting a stack overflow.  The #DF handler, which resets
its stack on each invocation, loops indefinitely.

Reinstate the NULL function pointer checks for hvm_cpu_{up,down}().

Fixes: 27a63cdac388 ("x86/HVM: convert remaining hvm_funcs hook invocations to alt-call")
Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>

RFC.  Not tested yet on the imacted hardware.  It's a Xeon PHI with another
werid thing in need of debugging.  First boot is fine, while second
boot (loading microcode this time) has a problem with vmx.

I wonder if we want to modify the callers to check for HVM being enabled,
rather than leaving the NULL pointer checks in a position where they're liable
to be reaped again.

Also, the #UD handler really should identify 0f 0b 0f ff ff as the
clobbered-altcall sequence, and provide a message to that effect.
---
 xen/arch/x86/include/asm/hvm/hvm.h | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/xen/arch/x86/include/asm/hvm/hvm.h b/xen/arch/x86/include/asm/hvm/hvm.h
index a441cbc22159..2dd08567f730 100644
--- a/xen/arch/x86/include/asm/hvm/hvm.h
+++ b/xen/arch/x86/include/asm/hvm/hvm.h
@@ -553,12 +553,16 @@ static inline void hvm_invlpg(struct vcpu *v, unsigned long linear)
 
 static inline int hvm_cpu_up(void)
 {
-    return alternative_call(hvm_funcs.cpu_up);
+    if ( hvm_funcs.cpu_up )
+        return alternative_call(hvm_funcs.cpu_up);
+
+    return 0;
 }
 
 static inline void hvm_cpu_down(void)
 {
-    alternative_vcall(hvm_funcs.cpu_down);
+    if ( hvm_funcs.cpu_down )
+        alternative_vcall(hvm_funcs.cpu_down);
 }
 
 static inline unsigned int hvm_get_insn_bytes(struct vcpu *v, uint8_t *buf)
-- 
2.11.0


