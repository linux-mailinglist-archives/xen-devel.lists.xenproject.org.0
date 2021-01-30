Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 00EE03091A6
	for <lists+xen-devel@lfdr.de>; Sat, 30 Jan 2021 04:22:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.78686.143296 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l5gqP-0004cH-Av; Sat, 30 Jan 2021 03:22:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 78686.143296; Sat, 30 Jan 2021 03:22:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l5gqP-0004bi-6o; Sat, 30 Jan 2021 03:22:41 +0000
Received: by outflank-mailman (input) for mailman id 78686;
 Sat, 30 Jan 2021 03:22:39 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bynp=HB=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1l5gqN-0004Yr-O1
 for xen-devel@lists.xenproject.org; Sat, 30 Jan 2021 03:22:39 +0000
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 48b50fb3-df2b-4fdf-af4a-c14f2065a733;
 Sat, 30 Jan 2021 03:22:38 +0000 (UTC)
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
X-Inumbo-ID: 48b50fb3-df2b-4fdf-af4a-c14f2065a733
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1611976958;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=QStf/4VUu5c6HbCvZxNWToA/k3UE3iHgVcKvXe9BGpE=;
  b=ca1OvCSdaWLjWJCOzg29G5F0ZRPsK2A/AhNvTNhZkeFesen00seYCOcd
   0ErwFjSdj1j1vKIZ0MJSudvHmUnslToEj8VMfBxwUvEh/P21lsqtzr8gG
   vwOHQRBy78Oavda7YdHrrvayTTH00EFfet04NWL2ECCu3eQlZP8WX1jWw
   g=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: rpAXcHiks7SP5PgNPdwpfOPSDtxPw/Erug+uuYWsCyMcFh9wPfMyOx5isuxU8RzNtmt/UfP870
 EDHdhsmbjendp+yq7qXPb63FWv/u+kXDkgR3jrBtj5/Zp6ym1uSEDMnDOjIWuNA+aoEQBhr0qf
 X87EzT9e1amsMYzibiPeVgUFguFu+ZTHqglbd4XaXAJuVbgggGopbmhQ6hhsQq/Z4uMF4x1Thq
 GDDRm9CyAUVPGUrqeeQ13zNoPJijCCOapZ0Wm6E4cDNO+ompxsyIkr1zc9lxRuk6P96AP2sgDe
 dGg=
X-SBRS: 5.1
X-MesageID: 36237571
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.79,387,1602561600"; 
   d="scan'208";a="36237571"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Tamas K Lengyel <tamas.lengyel@intel.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu
	<wl@xen.org>, Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian
	<kevin.tian@intel.com>, =?UTF-8?q?Micha=C5=82=20Leszczy=C5=84ski?=
	<michal.leszczynski@cert.pl>, Tamas K Lengyel <tamas@tklengyel.com>
Subject: [PATCH v8 15/16] xen/vmtrace: support for VM forks
Date: Sat, 30 Jan 2021 02:58:51 +0000
Message-ID: <20210130025852.12430-16-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20210130025852.12430-1-andrew.cooper3@citrix.com>
References: <20210130025852.12430-1-andrew.cooper3@citrix.com>
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
 xen/arch/x86/hvm/vmx/vmx.c    | 11 +++++++++++
 xen/arch/x86/mm/mem_sharing.c |  3 +++
 xen/include/asm-x86/hvm/hvm.h |  9 +++++++++
 3 files changed, 23 insertions(+)

diff --git a/xen/arch/x86/hvm/vmx/vmx.c b/xen/arch/x86/hvm/vmx/vmx.c
index a64c4e4177..5a33d8024e 100644
--- a/xen/arch/x86/hvm/vmx/vmx.c
+++ b/xen/arch/x86/hvm/vmx/vmx.c
@@ -2412,6 +2412,16 @@ static int vmtrace_output_position(struct vcpu *v, uint64_t *pos)
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
@@ -2471,6 +2481,7 @@ static struct hvm_function_table __initdata vmx_function_table = {
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


