Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D037387D4BC
	for <lists+xen-devel@lfdr.de>; Fri, 15 Mar 2024 20:57:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.694068.1082922 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rlDfy-00028C-Tx; Fri, 15 Mar 2024 19:57:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 694068.1082922; Fri, 15 Mar 2024 19:57:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rlDfy-00026f-RH; Fri, 15 Mar 2024 19:57:10 +0000
Received: by outflank-mailman (input) for mailman id 694068;
 Fri, 15 Mar 2024 19:57:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9knB=KV=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1rlDfx-00026Z-NX
 for xen-devel@lists.xenproject.org; Fri, 15 Mar 2024 19:57:09 +0000
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [2a00:1450:4864:20::135])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 33bd6dce-e306-11ee-a1ee-f123f15fe8a2;
 Fri, 15 Mar 2024 20:57:07 +0100 (CET)
Received: by mail-lf1-x135.google.com with SMTP id
 2adb3069b0e04-513cf9bacf1so3155873e87.0
 for <xen-devel@lists.xenproject.org>; Fri, 15 Mar 2024 12:57:07 -0700 (PDT)
Received: from andrewcoop.citrite.net (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 l23-20020a170906645700b00a4655513f0bsm1965229ejn.88.2024.03.15.12.57.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Mar 2024 12:57:05 -0700 (PDT)
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
X-Inumbo-ID: 33bd6dce-e306-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1710532626; x=1711137426; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=O0ApqtLjzIi/04P3O2hgcnVwq8obyxxKEIjVNeGVDjY=;
        b=SyL0KLwDcGl1A4VCiDzIPMhqbOQUEQZ0c48JEx7pH90x96vLfDe9BrJDo3DJ9q2K5M
         KsSYg+4iNW/JxUv0DFWXrLHcdOSsoUDxJX8BOHRcKeIEkA1w7t07faUZMYru73Mh2R1w
         dzUkN7k1S4zJWBAdQYgYKyzp8YqCwt9Dclwqc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710532626; x=1711137426;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=O0ApqtLjzIi/04P3O2hgcnVwq8obyxxKEIjVNeGVDjY=;
        b=gWJyh3Nt+6jPvmVWuuUJTZm7y/Nar8PInbSOXwDIGzEA9QGWmh4fjYgkA5kFtJESkh
         tfaH23RUpbJxO8t2NOGRZ03DxAisaOOdkx7jbnzni8HGPbneikKrmTaxJH2rZYwB8D+f
         w2HXPop9GTGpkxm6pSNMQaju0vW0PawcWeujErDto6PB/9CWI4NJYFBUFihniJh9Jrq4
         9IpVuLVqPeqG6QV6Y44Ybjfr0IBoAv34cNF2GrA3O+e0DwY+T1AF3p2oLQt4f/CvHFwf
         uMI+qmlRlSRdXP9C8LY01EK4tV2ISfayDkGuECYseU0TaxrsrYYmVfRUayVVQpS5p4bM
         H7DA==
X-Gm-Message-State: AOJu0YziMmM+woYIuuFKq9cwteP8j36ncFCu3gS2pSoaqUpZ48bsqOL0
	a4BVkpKQzZbsln7D5VWOxBtu0XSjmz8kgTbq+CtlZNKGTGhYBE6mCvsjzgMlmvq/vpvz3IpL1hj
	y
X-Google-Smtp-Source: AGHT+IEwIdKSm+GJyLllXTuzToT1RkzdjTCcEC7XXEQW2g9x6/OTLRo03IcG38JHfZFOI56vBo2SiA==
X-Received: by 2002:ac2:4258:0:b0:513:fad:3a79 with SMTP id m24-20020ac24258000000b005130fad3a79mr2859499lfl.41.1710532625936;
        Fri, 15 Mar 2024 12:57:05 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [PATCH] x86/boot: Improve the boot watchdog determination of stuck cpus
Date: Fri, 15 Mar 2024 19:57:04 +0000
Message-Id: <20240315195704.3423282-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Right now, check_nmi_watchdog() has two processing loops over all online CP=
Us
using prev_nmi_count as storage.

Use a cpumask_t instead (1/32th as much initdata) and have wait_for_nmis()
make the determination of whether it is stuck, rather than having both
functions needing to agree on how many ticks mean stuck.

More importantly though, it means we can use the standard cpumask
infrastructure, including turning this:

  (XEN) Brought up 512 CPUs
  (XEN) Testing NMI watchdog on all CPUs: {0,1,2,3,4,5,6,7,8,9,10,11,12,13,=
14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,=
39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,=
64,65,66,67,68,69,70,71,72,73,74,75,76,77,78,79,80,81,82,83,84,85,86,87,88,=
89,90,91,92,93,94,95,96,97,98,99,100,101,102,103,104,105,106,107,108,109,11=
0,111,112,113,114,115,116,117,118,119,120,121,122,123,124,125,126,127,128,1=
29,130,131,132,133,134,135,136,137,138,139,140,141,142,143,144,145,146,147,=
148,149,150,151,152,153,154,155,156,157,158,159,160,161,162,163,164,165,166=
,167,168,169,170,171,172,173,174,175,176,177,178,179,180,181,182,183,184,18=
5,186,187,188,189,190,191,192,193,194,195,196,197,198,199,200,201,202,203,2=
04,205,206,207,208,209,210,211,212,213,214,215,216,217,218,219,220,221,222,=
223,224,225,226,227,228,229,230,231,232,233,234,235,236,237,238,239,240,241=
,242,243,244,245,246,247,248,249,250,251,252,253,254,255,256,257,258,259,26=
0,261,262,263,264,265,266,267,268,269,270,271,272,273,274,275,276,277,278,2=
79,280,281,282,283,284,285,286,287,288,289,290,291,292,293,294,295,296,297,=
298,299,300,301,302,303,304,305,306,307,308,309,310,311,312,313,314,315,316=
,317,318,319,320,321,322,323,324,325,326,327,328,329,330,331,332,333,334,33=
5,336,337,338,339,340,341,342,343,344,345,346,347,348,349,350,351,352,353,3=
54,355,356,357,358,359,360,361,362,363,364,365,366,367,368,369,370,371,372,=
373,374,375,376,377,378,379,380,381,382,383,384,385,386,387,388,389,390,391=
,392,393,394,395,396,397,398,399,400,401,402,403,404,405,406,407,408,409,41=
0,411,412,413,414,415,416,417,418,419,420,421,422,423,424,425,426,427,428,4=
29,430,431,432,433,434,435,436,437,438,439,440,441,442,443,444,445,446,447,=
448,449,450,451,452,453,454,455,456,457,458,459,460,461,462,463,464,465,466=
,467,468,469,470,471,472,473,474,475,476,477,478,479,480,481,482,483,484,48=
5,486,487,488,489,490,491,492,493,494,495,496,497,498,499,500,501,502,503,5=
04,505,506,507,508,509,510,511} stuck

into the rather more manageable:

  (XEN) Brought up 512 CPUs
  (XEN) Testing NMI watchdog on all CPUs: {0-511} stuck

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
---
 xen/arch/x86/nmi.c | 35 ++++++++++++++---------------------
 1 file changed, 14 insertions(+), 21 deletions(-)

diff --git a/xen/arch/x86/nmi.c b/xen/arch/x86/nmi.c
index 633dc59bf830..8994c50cb5e4 100644
--- a/xen/arch/x86/nmi.c
+++ b/xen/arch/x86/nmi.c
@@ -151,6 +151,8 @@ static int nmi_active;
=20
 static void __init cf_check wait_for_nmis(void *p)
 {
+    cpumask_t *stuck_cpus =3D p;
+    unsigned int cpu =3D smp_processor_id();
     unsigned int start_count =3D this_cpu(nmi_count);
     unsigned long ticks =3D 10 * 1000 * cpu_khz / nmi_hz;
     unsigned long s, e;
@@ -159,44 +161,35 @@ static void __init cf_check wait_for_nmis(void *p)
     do {
         cpu_relax();
         if ( this_cpu(nmi_count) >=3D start_count + 2 )
-            break;
+            return;
+
         e =3D rdtsc();
-    } while( e - s < ticks );
+    } while ( e - s < ticks );
+
+    /* Timeout.  Mark ourselves as stuck. */
+    cpumask_set_cpu(cpu, stuck_cpus);
 }
=20
 void __init check_nmi_watchdog(void)
 {
-    static unsigned int __initdata prev_nmi_count[NR_CPUS];
-    unsigned int cpu;
-    char sep =3D '{';
-    bool ok =3D true;
+    static cpumask_t __initdata stuck_cpus;
=20
     if ( nmi_watchdog =3D=3D NMI_NONE )
         return;
=20
     printk("Testing NMI watchdog on all CPUs: ");
=20
-    for_each_online_cpu ( cpu )
-        prev_nmi_count[cpu] =3D per_cpu(nmi_count, cpu);
-
     /*
      * Wait at most 10 ticks for 2 watchdog NMIs on each CPU.
      * Busy-wait on all CPUs: the LAPIC counter that the NMI watchdog
      * uses only runs while the core's not halted
      */
-    on_selected_cpus(&cpu_online_map, wait_for_nmis, NULL, 1);
+    on_selected_cpus(&cpu_online_map, wait_for_nmis, &stuck_cpus, 1);
=20
-    for_each_online_cpu ( cpu )
-    {
-        if ( per_cpu(nmi_count, cpu) - prev_nmi_count[cpu] < 2 )
-        {
-            printk("%c%u", sep, cpu);
-            sep =3D ',';
-            ok =3D false;
-        }
-    }
-
-    printk("%s\n", ok ? "ok" : "} stuck");
+    if ( cpumask_empty(&stuck_cpus) )
+        printk("ok\n");
+    else
+        printk("{%*pbl} stuck\n", CPUMASK_PR(&stuck_cpus));
=20
     /*
      * Now that we know it works we can reduce NMI frequency to

base-commit: d638e304f13a5ef7d125de5ace5f7828a7b25bac
--=20
2.30.2


