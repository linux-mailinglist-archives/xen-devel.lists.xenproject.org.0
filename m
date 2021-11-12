Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E9AC44EC9C
	for <lists+xen-devel@lfdr.de>; Fri, 12 Nov 2021 19:29:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.225360.389179 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mlbI3-0001uc-CZ; Fri, 12 Nov 2021 18:28:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 225360.389179; Fri, 12 Nov 2021 18:28:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mlbI3-0001ol-7m; Fri, 12 Nov 2021 18:28:43 +0000
Received: by outflank-mailman (input) for mailman id 225360;
 Fri, 12 Nov 2021 18:28:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=26E1=P7=citrix.com=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1mlbI2-0001mj-1B
 for xen-devel@lists.xenproject.org; Fri, 12 Nov 2021 18:28:42 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 59da1cbc-43e6-11ec-a9d2-d9f7a1cc8784;
 Fri, 12 Nov 2021 19:28:39 +0100 (CET)
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
X-Inumbo-ID: 59da1cbc-43e6-11ec-a9d2-d9f7a1cc8784
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1636741719;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=gE6ojH/9khVrVKykrTMSiRo+XcJAwIMNkluytopjuas=;
  b=W5ZgdwGwRyoc6NgkwCy3jIVb5WTb0OXBQ8owlYygafHOrr3cAAVFfxVQ
   mOwR1IdDgwDM+b4eDsWUCQiPX8iN3uPn3AAYAiS7bwmllmB1djrj9UFp/
   4Tr1/GQzQ4ExPIHz871e7XcyRntO0kE8F4PhgpZFBIbzbRnBcwLD7RFN0
   E=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: kWZSW1am1N+hPGsg89ZLrOJu+LkvFAXAI3SXbkDSCvPk9cw8UaXBiYne4tDn0OgiAMlfOIT1/r
 B6pw46GM5Yhlq94NQZi6VD6kIUAIV/106tULner0OisnMa1mghpInWqb5EbuZ4kDXaJgO8JISl
 A9afvxwBt6OhI4MBmFtmcZEktFxJ4q66NHrMCJlTJU9rnmhh5DnlieWlmB/E8cGc46QGgMvbVo
 N2M4n7JSdYYk5uKKkn26zy8Iv/mH07rIhgD/buwE5FLButQFDcTDn2cXP28s38JhPXx6I4OCiF
 UTUYTzxsBFVrcvG1/SiXfMCf
X-SBRS: 5.1
X-MesageID: 57713708
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:AeXwVamO/hUKfHP6FsAYC4Ho5gxMIURdPkR7XQ2eYbSJt1+Wr1Gzt
 xIaWWzSOP3bNzOje98lYYq39k9V78WAyodkTAU6rXsxHyMWpZLJC+rCIxarNUt+DCFioGGLT
 Sk6QoOdRCzhZiaE/n9BClVlxJVF/fngqoDUUYYoAQgsA187IMsdoUg7wbdg29cy2YPR7z6l4
 rseneWOYDdJ5BYsWo4kw/rrRMRH5amaVJsw5zTSVNgT1LPsvyB94KE3fMldG0DQUIhMdtNWc
 s6YpF2PEsE1yD92Yj+tuu6TnkTn2dc+NyDW4pZdc/DKbhSvOkXee0v0XRYRQR4/ttmHozx+4
 IhCtJXvRQUvAqvjqugZazkCSANuFKITrdcrIVDn2SCS50jPcn+qyPRyFkAme4Yf/46bA0kXq
 6ZecmpUKEne2aTmm9pXScE17ignBODtMJkSpTdLyjbBAOx9aZvCX7/L9ZlT2zJYasVmQKmBP
 pFGMWoHgBLoOyFRJwdOVLsHrr2kon/jUTxJ736WjP9ii4TU5FMoi+W8WDbPQfSVQe1Fk0Deo
 XjJl0zbKBwHMN2UyRKe72mhwOTImEvTSI8UUbG16PNuqFmS3XAITg0bU0Ohpvu0gVL4XMhQQ
 3H44QJ38/J0rhbyCICgAVvo+xZooyLwRfINHOwztw2PzJbSzDSVAlAkFGVjePUp4ZpeqSMR6
 neFmNbgBDpKubKTSG6A+rr8kQ5eKRT5PkdZO3ZaEFJtD83L5dhq00mRFooL/Lud14WtQVnNL
 ya2QD/Sbln5peoCzO2F8F/OmFpATbCZH1dutm07so9Ihz6VhbJJhaT0tjA3Dt4ade51q2VtW
 lBexqByC8hUXfmweNSlGrllIV1Qz6/t3MfgqVBuBYI90D+m5mSue4tdiBknehw3bJtaI2SyM
 RKJ0e+02HO1FCH3BUOQS9jhY/nGMIC6TYi1PhwqRoYmjmdNmP+vo3g1OB/4M5HFm0kwi6AvU
 ap3gu73ZUv2/Z9PlWLsL89EiOdD7nlnmQv7GMCqpzz6gOH2TCPEFt843K6mM7lRAFWs+16Or
 b6y9qKiln1ibQEJSnWNrNNIcwlVdSNT6FKfg5U/S9Nv6zFOQAkJY8I9C5t7E2C8t6gKxOrO4
 F+nXUpUlAj2iXHdcF3YYXF/crL/G514qCtjbyArOF+p3VklYJqus/hDJ8dmI+F/+bwx1+NwQ
 tkEZ96EXqZFRAPY9mlPdpL6toFjKkim3FrcIyq/bTEjVJd8XAiVqMT8dw7i+XBWXCq6vMczu
 ZO60QbfTcZRTghuFp+OOvmu00mwrT4Wn+crBxnEJdxaeUPN9ol2KnOu0q9rcp9UcRian2mUz
 QebBxsctNLhmY5t/Ymbn72AoqeoD/B6QhhQEV7E4OvkLiLd5Gein9NNCb7aYTDHWWro06y+f
 uEJnerkOfgKkVsW4YpxF7FnkfA369f1/uIIyw1lGDPAbkixC6MmKX6DhJEduqpIz75fmA23R
 kPQpYUKZeTXYJvoQAwLOQ4oTuWfzvVFyDDd4MM8LFj++CIqrqGMVl9fPkXUhSFQRFev3FjJH
 Qv1VBYq1jGC
IronPort-HdrOrdr: A9a23:b3nVZKrwLRE5ByXIOsqSEPMaV5oTeYIsimQD101hICG8cqSj+f
 xG+85rrCMc6QxhPk3I9urhBEDtex/hHNtOkOws1NSZLW7bUQmTXeJfBOLZqlWKcUDDH6xmpM
 NdmsBFeaXN5DNB7PoSjjPWLz9Z+qjkzJyV
X-IronPort-AV: E=Sophos;i="5.87,230,1631592000"; 
   d="scan'208";a="57713708"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH 2/3] x86/cpufreq: Rework APERF/MPERF handling
Date: Fri, 12 Nov 2021 18:28:17 +0000
Message-ID: <20211112182818.30223-3-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20211112182818.30223-1-andrew.cooper3@citrix.com>
References: <20211112182818.30223-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Currently, each feature_detect() (called on CPU add) hook for both cpufreq
drivers duplicates cpu_has_aperfmperf in a per-cpu datastructure, and edits
cpufreq_driver.getavg to point at get_measured_perf().

As all parts of this are vendor-neutral, drop the function pointer and
duplicated boolean, and call get_measured_perf() directly.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>

Slightly RFC.  This does introduce an arch-specific call into a nominally
arch-neutral driver, but struct cpufreq_policy already had x86-specifics in it
so this is apparently ok.

A (less desirable) alternative would be to keep the function pointer, and
patch it in the BSP path, not every AP based on BSP data.

Either way, with patching moved out of feature_detect(), the main
cpufreq_driver object can become __ro_after_init (in principle), and all calls
optimised with alternative_call().
---
 xen/arch/x86/acpi/cpufreq/cpufreq.c  | 8 +-------
 xen/arch/x86/acpi/cpufreq/powernow.c | 6 ------
 xen/drivers/cpufreq/utility.c        | 9 +++------
 xen/include/acpi/cpufreq/cpufreq.h   | 2 --
 4 files changed, 4 insertions(+), 21 deletions(-)

diff --git a/xen/arch/x86/acpi/cpufreq/cpufreq.c b/xen/arch/x86/acpi/cpufreq/cpufreq.c
index 2251c87f9e42..f26cd6649e7a 100644
--- a/xen/arch/x86/acpi/cpufreq/cpufreq.c
+++ b/xen/arch/x86/acpi/cpufreq/cpufreq.c
@@ -275,7 +275,7 @@ unsigned int get_measured_perf(unsigned int cpu, unsigned int flag)
         return 0;
 
     policy = per_cpu(cpufreq_cpu_policy, cpu);
-    if (!policy || !policy->aperf_mperf)
+    if ( !policy || !cpu_has_aperfmperf )
         return 0;
 
     switch (flag)
@@ -345,12 +345,6 @@ static void feature_detect(void *info)
     struct cpufreq_policy *policy = info;
     unsigned int eax;
 
-    if ( cpu_has_aperfmperf )
-    {
-        policy->aperf_mperf = 1;
-        cpufreq_driver.getavg = get_measured_perf;
-    }
-
     eax = cpuid_eax(6);
     if (eax & 0x2) {
         policy->turbo = CPUFREQ_TURBO_ENABLED;
diff --git a/xen/arch/x86/acpi/cpufreq/powernow.c b/xen/arch/x86/acpi/cpufreq/powernow.c
index 80095dfd14b4..82d7827e17c1 100644
--- a/xen/arch/x86/acpi/cpufreq/powernow.c
+++ b/xen/arch/x86/acpi/cpufreq/powernow.c
@@ -205,12 +205,6 @@ static void feature_detect(void *info)
     struct cpufreq_policy *policy = info;
     unsigned int edx;
 
-    if ( cpu_has_aperfmperf )
-    {
-        policy->aperf_mperf = 1;
-        cpufreq_driver.getavg = get_measured_perf;
-    }
-
     edx = cpuid_edx(CPUID_FREQ_VOLT_CAPABILITIES);
     if ((edx & CPB_CAPABLE) == CPB_CAPABLE) {
         policy->turbo = CPUFREQ_TURBO_ENABLED;
diff --git a/xen/drivers/cpufreq/utility.c b/xen/drivers/cpufreq/utility.c
index b93895d4dddc..9eb7ecedcd29 100644
--- a/xen/drivers/cpufreq/utility.c
+++ b/xen/drivers/cpufreq/utility.c
@@ -381,12 +381,9 @@ int cpufreq_driver_getavg(unsigned int cpu, unsigned int flag)
     if (!cpu_online(cpu) || !(policy = per_cpu(cpufreq_cpu_policy, cpu)))
         return 0;
 
-    if (cpufreq_driver.getavg)
-    {
-        freq_avg = cpufreq_driver.getavg(cpu, flag);
-        if (freq_avg > 0)
-            return freq_avg;
-    }
+    freq_avg = get_measured_perf(cpu, flag);
+    if ( freq_avg > 0 )
+        return freq_avg;
 
     return policy->cur;
 }
diff --git a/xen/include/acpi/cpufreq/cpufreq.h b/xen/include/acpi/cpufreq/cpufreq.h
index e88b20bfed4f..4958d3f7d315 100644
--- a/xen/include/acpi/cpufreq/cpufreq.h
+++ b/xen/include/acpi/cpufreq/cpufreq.h
@@ -72,7 +72,6 @@ struct cpufreq_policy {
     s8                  turbo;  /* tristate flag: 0 for unsupported
                                  * -1 for disable, 1 for enabled
                                  * See CPUFREQ_TURBO_* below for defines */
-    bool_t              aperf_mperf; /* CPU has APERF/MPERF MSRs */
 };
 DECLARE_PER_CPU(struct cpufreq_policy *, cpufreq_cpu_policy);
 
@@ -162,7 +161,6 @@ struct cpufreq_driver {
                      unsigned int target_freq,
                      unsigned int relation);
     unsigned int    (*get)(unsigned int cpu);
-    unsigned int    (*getavg)(unsigned int cpu, unsigned int flag);
     int    (*exit)(struct cpufreq_policy *policy);
 };
 
-- 
2.11.0


