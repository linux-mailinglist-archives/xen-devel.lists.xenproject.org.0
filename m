Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3699345EE97
	for <lists+xen-devel@lfdr.de>; Fri, 26 Nov 2021 14:07:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.232772.403752 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqawL-0002fY-Ak; Fri, 26 Nov 2021 13:06:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 232772.403752; Fri, 26 Nov 2021 13:06:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqawL-0002da-3r; Fri, 26 Nov 2021 13:06:57 +0000
Received: by outflank-mailman (input) for mailman id 232772;
 Fri, 26 Nov 2021 13:06:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=k+gV=QN=citrix.com=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1mqauw-0003W9-Cz
 for xen-devel@lists.xenproject.org; Fri, 26 Nov 2021 13:05:30 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8432bbe3-4eb9-11ec-a9d2-d9f7a1cc8784;
 Fri, 26 Nov 2021 14:05:25 +0100 (CET)
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
X-Inumbo-ID: 8432bbe3-4eb9-11ec-a9d2-d9f7a1cc8784
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1637931924;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=SoaVzjnC4k/9FIXMh3yDocr0kLc2Ez0/muzxLvgq4vw=;
  b=PvMp2EXmQkxpELxTqpXudzECF0fP5Pk8XUpsDbesO0ll1Ik9nO+LvgbK
   EIg76Sj/fWo8GB1yMtYnheviLFK6fELRCpPJQSVnS1ZU47vpDX3n3chC4
   bPQ4n0tTn9gTmKzRlcLyW2sIPAzEZDxBjG+WKK1fCNZTCPsZMHiSXlhj/
   U=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: IPuR6OEJii/cuW4FHwFCAb2Qfs3WRyC9KwpwrtROb2XahnhvNwGGdsDrrZ3eFwChASeqicmiR/
 18xq+nx78zAajtR4lLwo1ySPrfG1hVo1Z+3YYHZSpnK18BM8yc/St7/fv2k0ip/WQVfhKY1w3e
 ArCLQ5GAsaODr0wP1N+lI+ze83h+d5+ChiTlxMLMEDibLn5wbcvrYar6/iW1FzqiJ4Xjvgp37d
 7eWZyN1VHa50adIN+pxoeOSxkg8JEEo3ItAtO2C3T80V4tPNeRJEBJzXVnDYFxU9khB1i9UnN/
 Q7pmY8EEw4XaGYHiI3yon+PM
X-SBRS: 5.1
X-MesageID: 60695261
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:2qtBeqByL/MynRVW/+Xkw5YqxClBgxIJ4kV8jS/XYbTApDtxhjYDz
 WYYWWmOaanfNGqjKNh+bd6wp0MB7ZGGn99jQQY4rX1jcSlH+JHPbTi7wuYcHM8wwunrFh8PA
 xA2M4GYRCwMo/u1Si6FatANl1ElvU2zbue6WLGs1hxZH1c+EX5400w7wYbVv6Yz6TSHK1LV0
 T/Ni5W31G+Ng1aY5UpNtspvADs21BjDkGtwUm4WPJinj3eH/5UhN7oNJLnZEpfNatI88thW5
 Qr05OrREmvxp3/BAz4++1rxWhVirrX6ZWBihpfKMkQLb9crSiEai84G2PQghUh/jifUv/JX1
 N9x8pmXGBcxY5P+xaMaakwNe81+FfUuFL7vJHG+tYqYzlHccmuqyPJrZK00FdRGoKAtWzgIr
 KFGbmBWBvyAr7veLLaTY+9gnMk8auLsO5sSoCpIxjDFF/c2B5vERs0m4PcGhGlh25oQRJ4yY
 eIHSGIsb0XKfydLeUkXCoslrbmZlnXwJmgwRFW9+vNsvjm7IBZK+KfpGMrYfJqNX8o9tmSyq
 3/C/m/5KgoHL9HZwj2Amlq8i+mKkS7lVYY6ELyj6uUskFCV3nYUChAdSR28u/bRt6Klc4sBc
 QpOoHNo9PVsshzwJjXgY/GmiHuW4z4+fcZaL6o/z1Cd0vfq0VveAVFRG1atd+canMMxQDUr0
 HqAkNXoGSFjvdWpdJ6NyluHhWjsYHZIdAfucQdBFFJYuIe7/OnfmzqWFo47eJNZmOEZDt0ZL
 9qiiCElz4segscQv0lQ1QCW2mn8znQlo+Nc2+k2Yo5Hxl8mDGJGT9bxgbQ+0RqmBN3CJrVml
 CJZ8/VyFMhUUfmweNWlGY3h5o2B6fefKyH7ilVyBZQn/DnF0yf9Jt8AvmwhdRs3bp1sldrVj
 Kn74lg5CHh7ZibCUEOKS9jpV5RCIVbISbwJqcw4nvIRO8MsJWdrDQllZFKK3nCFraTfufpXB
 HtvSu71VSxyIf0+lFKeHr5BuZd2lnFW7T6CHvjTkkX4uYdykVbIEN/pxnPVNbtnhE5FyS2Im
 +ti2zyil08CDbagO3aPqub+7zkidBAGOHw/kOQPHsbrH+asMDt8YxMI6b9+KYFjgYpPkeLEo
 iO0VkNCkQKtjnzbMwSaLHtkbeq3D5p4qHs6Ow0qPEqphCd/Mdr+sv9HestlZ6Qj+cxi0eVwE
 6sPdfKfD6kdUT/A4TkcM8Xw9dQwaBSxiAuSFCO5ezxjLYV4TgnE94a8LAvi/SUDFAStss46r
 +Hy3w/XW8NbFQ9jENzXeLSkyFbo5SoRn+d7Xk3pJNhPeRqzrNg2enKp1vJuepMCMxTOwDeex
 j26OxZAqLmfuZIx/fnImbuA89WjHdxhExcIBGLc97u3a3XXpzLx3Y9aXe+UVjnBT2eoqr66b
 OBYwvygYv0KmFFG79h1H7pxlP9s4tLuo/lRzxh+HWWNZFOuU+syLn6D1MhJl6tM2r4G5lfmB
 hPRooFXaeeTJcfoMF8NPw50PO2M2MYdliTW8flocl7x4zV6/ebfXEhfV/VWZPex8Feh3FsZ/
 Noc
IronPort-HdrOrdr: A9a23:Lf051KygZks2fppUp5UKKrPwFL1zdoMgy1knxilNoRw8SKKlfq
 eV7Y0mPH7P+VAssR4b+exoVJPtfZqYz+8R3WBzB8bEYOCFghrKEGgK1+KLqFeMJ8S9zJ846U
 4JSdkHNDSaNzlHZKjBjzVQa+xQouW6zA==
X-IronPort-AV: E=Sophos;i="5.87,266,1631592000"; 
   d="scan'208";a="60695261"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH 31/65] x86/ucode: Annotate fnptr targets
Date: Fri, 26 Nov 2021 12:34:12 +0000
Message-ID: <20211126123446.32324-32-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20211126123446.32324-1-andrew.cooper3@citrix.com>
References: <20211126123446.32324-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
---
 xen/arch/x86/cpu/microcode/amd.c   |  9 +++++----
 xen/arch/x86/cpu/microcode/core.c  |  4 ++--
 xen/arch/x86/cpu/microcode/intel.c | 10 +++++-----
 3 files changed, 12 insertions(+), 11 deletions(-)

diff --git a/xen/arch/x86/cpu/microcode/amd.c b/xen/arch/x86/cpu/microcode/amd.c
index fe92e594f129..0afa2192bf1d 100644
--- a/xen/arch/x86/cpu/microcode/amd.c
+++ b/xen/arch/x86/cpu/microcode/amd.c
@@ -91,7 +91,7 @@ static struct {
     uint16_t id;
 } equiv __read_mostly;
 
-static void collect_cpu_info(void)
+static void cf_check collect_cpu_info(void)
 {
     struct cpu_signature *csig = &this_cpu(cpu_sig);
 
@@ -204,7 +204,7 @@ static enum microcode_match_result compare_header(
     return compare_revisions(old->patch_id, new->patch_id);
 }
 
-static enum microcode_match_result compare_patch(
+static enum microcode_match_result cf_check compare_patch(
     const struct microcode_patch *new, const struct microcode_patch *old)
 {
     /* Both patches to compare are supposed to be applicable to local CPU. */
@@ -214,7 +214,7 @@ static enum microcode_match_result compare_patch(
     return compare_header(new, old);
 }
 
-static int apply_microcode(const struct microcode_patch *patch)
+static int cf_check apply_microcode(const struct microcode_patch *patch)
 {
     int hw_err;
     unsigned int cpu = smp_processor_id();
@@ -299,7 +299,8 @@ static int scan_equiv_cpu_table(const struct container_equiv_table *et)
     return -ESRCH;
 }
 
-static struct microcode_patch *cpu_request_microcode(const void *buf, size_t size)
+static struct microcode_patch *cf_check cpu_request_microcode(
+    const void *buf, size_t size)
 {
     const struct microcode_patch *saved = NULL;
     struct microcode_patch *patch = NULL;
diff --git a/xen/arch/x86/cpu/microcode/core.c b/xen/arch/x86/cpu/microcode/core.c
index 841364208053..c07f68ba350e 100644
--- a/xen/arch/x86/cpu/microcode/core.c
+++ b/xen/arch/x86/cpu/microcode/core.c
@@ -291,12 +291,12 @@ static int wait_for_condition(bool (*func)(unsigned int data),
     return 0;
 }
 
-static bool wait_cpu_callin(unsigned int nr)
+static bool cf_check wait_cpu_callin(unsigned int nr)
 {
     return cpumask_weight(&cpu_callin_map) >= nr;
 }
 
-static bool wait_cpu_callout(unsigned int nr)
+static bool cf_check wait_cpu_callout(unsigned int nr)
 {
     return atomic_read(&cpu_out) >= nr;
 }
diff --git a/xen/arch/x86/cpu/microcode/intel.c b/xen/arch/x86/cpu/microcode/intel.c
index f6d01490e0ab..d3864b5ab03e 100644
--- a/xen/arch/x86/cpu/microcode/intel.c
+++ b/xen/arch/x86/cpu/microcode/intel.c
@@ -116,7 +116,7 @@ static bool signature_matches(const struct cpu_signature *cpu_sig,
     return cpu_sig->pf & ucode_pf;
 }
 
-static void collect_cpu_info(void)
+static void cf_check collect_cpu_info(void)
 {
     struct cpu_signature *csig = &this_cpu(cpu_sig);
     uint64_t msr_content;
@@ -271,7 +271,7 @@ static enum microcode_match_result microcode_update_match(
     return compare_revisions(cpu_sig->rev, mc->rev);
 }
 
-static enum microcode_match_result compare_patch(
+static enum microcode_match_result cf_check compare_patch(
     const struct microcode_patch *new, const struct microcode_patch *old)
 {
     /*
@@ -284,7 +284,7 @@ static enum microcode_match_result compare_patch(
     return compare_revisions(old->rev, new->rev);
 }
 
-static int apply_microcode(const struct microcode_patch *patch)
+static int cf_check apply_microcode(const struct microcode_patch *patch)
 {
     uint64_t msr_content;
     unsigned int cpu = smp_processor_id();
@@ -323,8 +323,8 @@ static int apply_microcode(const struct microcode_patch *patch)
     return 0;
 }
 
-static struct microcode_patch *cpu_request_microcode(const void *buf,
-                                                     size_t size)
+static struct microcode_patch *cf_check cpu_request_microcode(
+    const void *buf, size_t size)
 {
     int error = 0;
     const struct microcode_patch *saved = NULL;
-- 
2.11.0


