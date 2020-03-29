Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AA1D8196B65
	for <lists+xen-devel@lfdr.de>; Sun, 29 Mar 2020 06:58:54 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jIPyl-0002pw-3R; Sun, 29 Mar 2020 04:55:23 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=NY0J=5O=gmail.com=singhalsimran0@srs-us1.protection.inumbo.net>)
 id 1jIPyj-0002pq-1w
 for xen-devel@lists.xenproject.org; Sun, 29 Mar 2020 04:55:21 +0000
X-Inumbo-ID: 7d801822-7179-11ea-a6c1-bc764e2007e4
Received: from mail-pl1-x644.google.com (unknown [2607:f8b0:4864:20::644])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7d801822-7179-11ea-a6c1-bc764e2007e4;
 Sun, 29 Mar 2020 04:55:20 +0000 (UTC)
Received: by mail-pl1-x644.google.com with SMTP id e1so5268262plt.9
 for <xen-devel@lists.xenproject.org>; Sat, 28 Mar 2020 21:55:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:mime-version:content-disposition
 :user-agent; bh=AYt3QUMaPQajEDhDFhKC4mL4Ue+J22qPFzeC1zApcAA=;
 b=L98V1ab1ggWto2Hy3vBijNUCP+NjNltCQZRkhQMQtoHBPXd8iHTB3yv+TE3UU4bfYU
 IGlo0ogmWCe2lkXKVcIBCEHk2T0CgZU0p61GlfbpaPX7DAP8zIVaYKcOcMie1UhoNyyJ
 nETP4XcCVcKfbWnt7NOwpVXXqWaSSkOvgiiznWeBJ+0KgR5E7aSIaos+4Zrnu08F2wiJ
 0breV0rL43sJ8g0BhEGLfAfqGFQ2ZqYElZCgQ+YmOTa0haIeqrKtzPgIKr2bEy0S6HWF
 7TNVywLurtVjwZn2TkYi+TIGVyGYhXqIQVJHU4lAAlzDFgvKU3GWF3YgvLLdzXbwpzNO
 HIZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
 :content-disposition:user-agent;
 bh=AYt3QUMaPQajEDhDFhKC4mL4Ue+J22qPFzeC1zApcAA=;
 b=NXEaD1Z1jtrTfYA2f01McgXl8IEGNs0Zu1DEbjse0+OXBtOZku1irpP1Px5PJ1ukx2
 mIM9hke1rBUWIs/PAFdzBw4887BHzJwGeE020X77ca6UYZHRQ57IUcGv4WxblReuUuPr
 dgRXbBPOs2vzNh8uwzr6o/DSparsvzC52+xPr4PTO73Oto1LLa6Hoxii/kk8usXl3P5D
 ubXlsL2QhPtyE18JAjLMwVcbt76K6diJthGW9OCuvn234oQRfrVwf1sdPtoWLuYDBYgH
 LVMBbid2Ax2hQEj9ocXIsWZPYt50aZ5pMdhLPupPo/zhLmx47JazcMX7kxpH70Vi38LI
 ZDjQ==
X-Gm-Message-State: ANhLgQ3gp4kRWsv21ytetr+3/gWXZkIMgIgrDklgzgeSkxQDQZMknTYL
 xDj/xNB9OWnJVkdE5t9oHv4=
X-Google-Smtp-Source: ADFU+vtiQSlpgxEhFqMeb/Zn2Fn7CaEyXcyySIozdQoyBmYXQ7ZSx6VDhBx4Bb2q99jnGdH1Z9CBfw==
X-Received: by 2002:a17:902:ba97:: with SMTP id
 k23mr6134480pls.46.1585457719327; 
 Sat, 28 Mar 2020 21:55:19 -0700 (PDT)
Received: from simran-Inspiron-5558 ([2409:4052:2ea9:879:e86a:3263:71b5:b71b])
 by smtp.gmail.com with ESMTPSA id
 i26sm7294020pfk.176.2020.03.28.21.55.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 28 Mar 2020 21:55:18 -0700 (PDT)
Date: Sun, 29 Mar 2020 10:25:12 +0530
From: Simran Singhal <singhalsimran0@gmail.com>
To: xen-devel@lists.xenproject.org
Message-ID: <20200329045512.GA28203@simran-Inspiron-5558>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.9.4 (2018-02-28)
Subject: [Xen-devel] [PATCH v2] xen/x86: Remove unnecessary cast on void
 pointer
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Kevin Tian <kevin.tian@intel.com>, Jan Beulich <jbeulich@suse.com>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Jun Nakajima <jun.nakajima@intel.com>,
 Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Assignment to a typed pointer is sufficient in C.
No cast is needed.

Also, changed some u64/u32 to uint64_t/uint32_t.

Signed-off-by: Simran Singhal <singhalsimran0@gmail.com>
---
Changes in v2:
	- Took the chance to change some uintX to uintX_t.

 xen/arch/x86/acpi/cpufreq/powernow.c |  2 +-
 xen/arch/x86/cpu/vpmu.c              |  2 +-
 xen/arch/x86/hpet.c                  |  2 +-
 xen/arch/x86/hvm/save.c              |  2 +-
 xen/arch/x86/hvm/vmx/vvmx.c          | 12 ++++++------
 5 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/xen/arch/x86/acpi/cpufreq/powernow.c b/xen/arch/x86/acpi/cpufreq/powernow.c
index 3cf9c6cd05..f620bebc7e 100644
--- a/xen/arch/x86/acpi/cpufreq/powernow.c
+++ b/xen/arch/x86/acpi/cpufreq/powernow.c
@@ -58,7 +58,7 @@ static void transition_pstate(void *pstate)
 
 static void update_cpb(void *data)
 {
-    struct cpufreq_policy *policy = (struct cpufreq_policy *)data;
+    struct cpufreq_policy *policy = data;
 
     if (policy->turbo != CPUFREQ_TURBO_UNSUPPORTED) {
         uint64_t msr_content;
diff --git a/xen/arch/x86/cpu/vpmu.c b/xen/arch/x86/cpu/vpmu.c
index e50d478d23..1ed39ef03f 100644
--- a/xen/arch/x86/cpu/vpmu.c
+++ b/xen/arch/x86/cpu/vpmu.c
@@ -337,7 +337,7 @@ void vpmu_do_interrupt(struct cpu_user_regs *regs)
 
 static void vpmu_save_force(void *arg)
 {
-    struct vcpu *v = (struct vcpu *)arg;
+    struct vcpu *v = arg;
     struct vpmu_struct *vpmu = vcpu_vpmu(v);
 
     if ( !vpmu_is_set(vpmu, VPMU_CONTEXT_LOADED) )
diff --git a/xen/arch/x86/hpet.c b/xen/arch/x86/hpet.c
index 86929b9ba1..c46e7cf4ee 100644
--- a/xen/arch/x86/hpet.c
+++ b/xen/arch/x86/hpet.c
@@ -215,7 +215,7 @@ again:
 static void hpet_interrupt_handler(int irq, void *data,
         struct cpu_user_regs *regs)
 {
-    struct hpet_event_channel *ch = (struct hpet_event_channel *)data;
+    struct hpet_event_channel *ch = data;
 
     this_cpu(irq_count)--;
 
diff --git a/xen/arch/x86/hvm/save.c b/xen/arch/x86/hvm/save.c
index 0fc59d3487..a2c56fbc1e 100644
--- a/xen/arch/x86/hvm/save.c
+++ b/xen/arch/x86/hvm/save.c
@@ -417,7 +417,7 @@ void _hvm_read_entry(struct hvm_domain_context *h, void *dest,
     memcpy(dest, &h->data[h->cur], d->length);
 
     if ( d->length < dest_len )
-        memset((char *)dest + d->length, 0, dest_len - d->length);
+        memset(dest + d->length, 0, dest_len - d->length);
 
     h->cur += d->length;
 }
diff --git a/xen/arch/x86/hvm/vmx/vvmx.c b/xen/arch/x86/hvm/vmx/vvmx.c
index f049920196..2edb103205 100644
--- a/xen/arch/x86/hvm/vmx/vvmx.c
+++ b/xen/arch/x86/hvm/vmx/vvmx.c
@@ -253,12 +253,12 @@ static int vvmcs_offset(u32 width, u32 type, u32 index)
     return offset;
 }
 
-u64 get_vvmcs_virtual(void *vvmcs, u32 vmcs_encoding)
+uint64_t get_vvmcs_virtual(void *vvmcs, uint32_t vmcs_encoding)
 {
     union vmcs_encoding enc;
-    u64 *content = (u64 *) vvmcs;
+    uint64_t *content = vvmcs;
     int offset;
-    u64 res;
+    uint64_t res;
 
     enc.word = vmcs_encoding;
     offset = vvmcs_offset(enc.width, enc.type, enc.index);
@@ -307,12 +307,12 @@ enum vmx_insn_errno get_vvmcs_real_safe(const struct vcpu *v, u32 encoding,
     return virtual_vmcs_vmread_safe(v, encoding, val);
 }
 
-void set_vvmcs_virtual(void *vvmcs, u32 vmcs_encoding, u64 val)
+void set_vvmcs_virtual(void *vvmcs, uint32_t vmcs_encoding, uint64_t val)
 {
     union vmcs_encoding enc;
-    u64 *content = (u64 *) vvmcs;
+    uint64_t *content = vvmcs;
     int offset;
-    u64 res;
+    uint64_t res;
 
     enc.word = vmcs_encoding;
     offset = vvmcs_offset(enc.width, enc.type, enc.index);
-- 
2.17.1


