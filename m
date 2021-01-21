Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CBC892FF732
	for <lists+xen-devel@lfdr.de>; Thu, 21 Jan 2021 22:28:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.72429.130463 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l2hUj-0005Op-20; Thu, 21 Jan 2021 21:27:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 72429.130463; Thu, 21 Jan 2021 21:27:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l2hUi-0005MO-Pc; Thu, 21 Jan 2021 21:27:56 +0000
Received: by outflank-mailman (input) for mailman id 72429;
 Thu, 21 Jan 2021 21:27:54 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rOiS=GY=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1l2hUg-0004xo-Re
 for xen-devel@lists.xenproject.org; Thu, 21 Jan 2021 21:27:54 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id cc95afc1-16c5-4671-ba77-cb1a5634bf41;
 Thu, 21 Jan 2021 21:27:40 +0000 (UTC)
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
X-Inumbo-ID: cc95afc1-16c5-4671-ba77-cb1a5634bf41
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1611264461;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=7e+PT6CI2IW9VvmlQDpZMLGMDO6+ZV3J/eiWjcFr53M=;
  b=W7X4L0wRwHAzvX4XTOmnJwQg+oiApoT7yuYtw2fGxIq+dB5IiADTy9Tv
   8Gfm3Rb+fGHe3YU0zv+OaSfI66cjTecOgVbrSofCn0klTp6KvqxK6ztCG
   VJ/oJOIDj/S/aFGjizMS1tSMbJiMZ87boO3fKTJGW6MyPlz00kHc1FnJj
   c=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: cQf0RDzhXE13BySs4YmNC/SPFB+uq+uBqGFBBIznYnTSz1PFgyATflfOepIImkyEfQ3cr1owSL
 HS6M54ULfMDywoJ/mCncxx4fBRPGN6Igd7QMK5b1tMe6tavuQoaLqe4rz2fKoar+cQyw6sQtNt
 VQcV7B25X2VmwXz7kJniMDmcl1vM6VDtwX2hCSemWt4fObPiWxrEFb7Rfsy5phJy2WdpA/e/rl
 bLQ1zW1jeGS9Fqk+NOM0ExDXjAehnabzBOnJkImyGBm2BtX5+6RPgfdUwtk2u1513ztDR6r9YN
 1KY=
X-SBRS: 5.1
X-MesageID: 35977348
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.79,365,1602561600"; 
   d="scan'208";a="35977348"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Tamas K Lengyel <tamas.lengyel@intel.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu
	<wl@xen.org>, Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian
	<kevin.tian@intel.com>, =?UTF-8?q?Micha=C5=82=20Leszczy=C5=84ski?=
	<michal.leszczynski@cert.pl>, Tamas K Lengyel <tamas@tklengyel.com>
Subject: [PATCH v7 09/10] xen/vmtrace: support for VM forks
Date: Thu, 21 Jan 2021 21:27:17 +0000
Message-ID: <20210121212718.2441-10-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20210121212718.2441-1-andrew.cooper3@citrix.com>
References: <20210121212718.2441-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

From: Tamas K Lengyel <tamas.lengyel@intel.com>

Implement vmtrace_reset_pt function. Properly set IPT
state for VM forks.

Signed-off-by: Tamas K Lengyel <tamas.lengyel@intel.com>
Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
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
 xen/arch/x86/hvm/vmx/vmx.c    | 11 +++++++++++
 xen/arch/x86/mm/mem_sharing.c |  3 +++
 xen/include/asm-x86/hvm/hvm.h |  9 +++++++++
 3 files changed, 23 insertions(+)

diff --git a/xen/arch/x86/hvm/vmx/vmx.c b/xen/arch/x86/hvm/vmx/vmx.c
index d4e7b50b8a..40ae398cf5 100644
--- a/xen/arch/x86/hvm/vmx/vmx.c
+++ b/xen/arch/x86/hvm/vmx/vmx.c
@@ -2408,6 +2408,16 @@ static int vmtrace_output_position(struct vcpu *v, uint64_t *pos)
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
@@ -2467,6 +2477,7 @@ static struct hvm_function_table __initdata vmx_function_table = {
     .vmtrace_output_position = vmtrace_output_position,
     .vmtrace_set_option = vmtrace_set_option,
     .vmtrace_get_option = vmtrace_get_option,
+    .vmtrace_reset = vmtrace_reset,
     .tsc_scaling = {
         .max_ratio = VMX_TSC_MULTIPLIER_MAX,
     },
diff --git a/xen/arch/x86/mm/mem_sharing.c b/xen/arch/x86/mm/mem_sharing.c
index adaeab4612..fd07eb8d4d 100644
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
+        cd->vmtrace_frames = d->vmtrace_frames;
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


