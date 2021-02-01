Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3248130B378
	for <lists+xen-devel@lfdr.de>; Tue,  2 Feb 2021 00:27:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.80192.146533 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l6ibg-0007bT-MU; Mon, 01 Feb 2021 23:27:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 80192.146533; Mon, 01 Feb 2021 23:27:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l6ibg-0007ao-I2; Mon, 01 Feb 2021 23:27:44 +0000
Received: by outflank-mailman (input) for mailman id 80192;
 Mon, 01 Feb 2021 23:27:42 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=IWGu=HD=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1l6ibe-0007P6-Qz
 for xen-devel@lists.xenproject.org; Mon, 01 Feb 2021 23:27:42 +0000
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 38cdcfa4-521c-43b8-a188-6a21d06b37d7;
 Mon, 01 Feb 2021 23:27:32 +0000 (UTC)
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
X-Inumbo-ID: 38cdcfa4-521c-43b8-a188-6a21d06b37d7
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1612222052;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=FBfo6N9u3Sukj0MKNcU3Z9nO9VLLQT0Q251N7HMr1t4=;
  b=W+AMHjrZtM0JdgByJWxIl+Q2o2kC0Hp+Z9c35pgJCUOdxofBHtd98ugt
   RyZDO/x/pM4EgnPbFfZCGkc55tUQmV4eFGJoOUA6CBObgj8HKNCgP4qOR
   kcP4/TbGNemXwKraGvRA8t4gwVByqsLzui2w2iE3zM4UD6yoANyCv7Ovu
   c=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: 12MhwBfguQk0bLxFSPpqPdTqs4n6Fxn3l25XKaRAqX09hFa34kLWoantVeiJPyoIOd9c4ScBOK
 XdoOLk0DmbE9RXIcx5/P8DrSsQjR2Z5G7N8+/5fREE/G/xf2Hs2kZMC7PP0dz0TRULbtnT9GDN
 UeuaOsfeX6ntwJ9t/j1Sier4gog6YGqKhufTg89OcsascmaJjD595nU4buluHAhcmM/AbDDKaG
 VEwpqi+7FCZgnV4tL58dn2dChMjNxvo2jrOSElEgx+2fxxPWFzJCgsl0j7HNderxoke4jPvCPH
 Y+4=
X-SBRS: 5.1
X-MesageID: 36523028
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.79,393,1602561600"; 
   d="scan'208";a="36523028"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Tamas K Lengyel <tamas.lengyel@intel.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu
	<wl@xen.org>, Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian
	<kevin.tian@intel.com>, =?UTF-8?q?Micha=C5=82=20Leszczy=C5=84ski?=
	<michal.leszczynski@cert.pl>, Tamas K Lengyel <tamas@tklengyel.com>
Subject: [PATCH v9 09/11] xen/vmtrace: support for VM forks
Date: Mon, 1 Feb 2021 23:27:01 +0000
Message-ID: <20210201232703.29275-10-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20210201232703.29275-1-andrew.cooper3@citrix.com>
References: <20210201232703.29275-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

From: Tamas K Lengyel <tamas.lengyel@intel.com>

Implement vmtrace_reset_pt function. Properly set IPT
state for VM forks.

Signed-off-by: Tamas K Lengyel <tamas.lengyel@intel.com>
Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
Reviewed-by: Jan Beulich <jbeulich@suse.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
CC: Jun Nakajima <jun.nakajima@intel.com>
CC: Kevin Tian <kevin.tian@intel.com>
CC: Michał Leszczyński <michal.leszczynski@cert.pl>
CC: Tamas K Lengyel <tamas@tklengyel.com>

v7:
 * New
---
 tools/misc/xen-vmtrace.c      |  2 +-
 xen/arch/x86/hvm/vmx/vmx.c    | 11 +++++++++++
 xen/arch/x86/mm/mem_sharing.c |  3 +++
 xen/include/asm-x86/hvm/hvm.h |  9 +++++++++
 4 files changed, 24 insertions(+), 1 deletion(-)

diff --git a/tools/misc/xen-vmtrace.c b/tools/misc/xen-vmtrace.c
index cc58a0707b..7572e880c5 100644
--- a/tools/misc/xen-vmtrace.c
+++ b/tools/misc/xen-vmtrace.c
@@ -43,7 +43,7 @@ static uint32_t domid, vcpu;
 static size_t size;
 static char *buf;
 
-static sig_atomic_t interrupted = 0;
+static sig_atomic_t interrupted;
 static void int_handler(int signum)
 {
     interrupted = 1;
diff --git a/xen/arch/x86/hvm/vmx/vmx.c b/xen/arch/x86/hvm/vmx/vmx.c
index beb5692b8b..faba95d057 100644
--- a/xen/arch/x86/hvm/vmx/vmx.c
+++ b/xen/arch/x86/hvm/vmx/vmx.c
@@ -2392,6 +2392,16 @@ static int vmtrace_output_position(struct vcpu *v, uint64_t *pos)
     return v->arch.hvm.vmx.ipt_active;
 }
 
+static int vmtrace_reset(struct vcpu *v)
+{
+    if ( !v->arch.hvm.vmx.ipt_active )
+        return -EINVAL;
+
+    v->arch.msrs->rtit.output_offset = 0;
+    v->arch.msrs->rtit.status = 0;
+    return 0;
+}
+
 static struct hvm_function_table __initdata vmx_function_table = {
     .name                 = "VMX",
     .cpu_up_prepare       = vmx_cpu_up_prepare,
@@ -2451,6 +2461,7 @@ static struct hvm_function_table __initdata vmx_function_table = {
     .vmtrace_output_position = vmtrace_output_position,
     .vmtrace_set_option = vmtrace_set_option,
     .vmtrace_get_option = vmtrace_get_option,
+    .vmtrace_reset = vmtrace_reset,
     .tsc_scaling = {
         .max_ratio = VMX_TSC_MULTIPLIER_MAX,
     },
diff --git a/xen/arch/x86/mm/mem_sharing.c b/xen/arch/x86/mm/mem_sharing.c
index adaeab4612..00ada05c10 100644
--- a/xen/arch/x86/mm/mem_sharing.c
+++ b/xen/arch/x86/mm/mem_sharing.c
@@ -1632,6 +1632,8 @@ static int copy_vcpu_settings(struct domain *cd, const struct domain *d)
             copy_domain_page(new_vcpu_info_mfn, vcpu_info_mfn);
         }
 
+        hvm_vmtrace_reset(cd_vcpu);
+
         /*
          * TODO: to support VMs with PV interfaces copy additional
          * settings here, such as PV timers.
@@ -1782,6 +1784,7 @@ static int fork(struct domain *cd, struct domain *d)
         cd->max_pages = d->max_pages;
         *cd->arch.cpuid = *d->arch.cpuid;
         *cd->arch.msr = *d->arch.msr;
+        cd->vmtrace_size = d->vmtrace_size;
         cd->parent = d;
     }
 
diff --git a/xen/include/asm-x86/hvm/hvm.h b/xen/include/asm-x86/hvm/hvm.h
index 960ec03917..150746de66 100644
--- a/xen/include/asm-x86/hvm/hvm.h
+++ b/xen/include/asm-x86/hvm/hvm.h
@@ -219,6 +219,7 @@ struct hvm_function_table {
     int (*vmtrace_output_position)(struct vcpu *v, uint64_t *pos);
     int (*vmtrace_set_option)(struct vcpu *v, uint64_t key, uint64_t value);
     int (*vmtrace_get_option)(struct vcpu *v, uint64_t key, uint64_t *value);
+    int (*vmtrace_reset)(struct vcpu *v);
 
     /*
      * Parameters and callbacks for hardware-assisted TSC scaling,
@@ -696,6 +697,14 @@ static inline int hvm_vmtrace_get_option(
     return -EOPNOTSUPP;
 }
 
+static inline int hvm_vmtrace_reset(struct vcpu *v)
+{
+    if ( hvm_funcs.vmtrace_reset )
+        return hvm_funcs.vmtrace_reset(v);
+
+    return -EOPNOTSUPP;
+}
+
 /*
  * This must be defined as a macro instead of an inline function,
  * because it uses 'struct vcpu' and 'struct domain' which have
-- 
2.11.0


