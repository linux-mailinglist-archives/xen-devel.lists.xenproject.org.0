Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BDC191DEEF
	for <lists+xen-devel@lfdr.de>; Mon,  1 Jul 2024 14:20:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.751536.1159520 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sOG0G-0005Qx-IO; Mon, 01 Jul 2024 12:19:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 751536.1159520; Mon, 01 Jul 2024 12:19:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sOG0G-0005Pl-Eu; Mon, 01 Jul 2024 12:19:28 +0000
Received: by outflank-mailman (input) for mailman id 751536;
 Mon, 01 Jul 2024 12:19:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1OIh=OB=darkstar.site=sakib@srs-se1.protection.inumbo.net>)
 id 1sOG0F-0005Pf-12
 for xen-devel@lists.xenproject.org; Mon, 01 Jul 2024 12:19:27 +0000
Received: from pb-smtp20.pobox.com (pb-smtp20.pobox.com [173.228.157.52])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 26f0f8d7-37a4-11ef-90a4-e314d9c70b13;
 Mon, 01 Jul 2024 14:19:25 +0200 (CEST)
Received: from pb-smtp20.pobox.com (unknown [127.0.0.1])
 by pb-smtp20.pobox.com (Postfix) with ESMTP id 56B841B416;
 Mon,  1 Jul 2024 08:19:23 -0400 (EDT)
 (envelope-from sakib@darkstar.site)
Received: from pb-smtp20.sea.icgroup.com (unknown [127.0.0.1])
 by pb-smtp20.pobox.com (Postfix) with ESMTP id 4FB291B415;
 Mon,  1 Jul 2024 08:19:23 -0400 (EDT)
 (envelope-from sakib@darkstar.site)
Received: from localhost (unknown [46.211.3.74])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by pb-smtp20.pobox.com (Postfix) with ESMTPSA id 32D531B40B;
 Mon,  1 Jul 2024 08:19:19 -0400 (EDT)
 (envelope-from sakib@darkstar.site)
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
X-Inumbo-ID: 26f0f8d7-37a4-11ef-90a4-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed; d=pobox.com; h=from:to:cc
	:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding; s=sasl; bh=RUg7MohI2O8rEHGBoMjQlSjZ0
	0nvzmvTzmlYoLHBthQ=; b=xkbMy+3enbrKZ5W7aky3WCeijiiweYugT9ZcNciTf
	jkkh9snwYbOlUe5cA4AJjLKcWTFvaZYlF7PWyjpJSRuJtgQwusMzclrSasdhomut
	QC9tnaEee5JuvflPExCZOTW2UF7V4/KMnbKnbb2UzTtK/m7gGM9XS4sfQpNF6Wxi
	YI=
From: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
To: xen-devel@lists.xenproject.org
Cc: Sergiy Kibrik <Sergiy_Kibrik@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Jason Andryuk <jason.andryuk@amd.com>,
	Jan Beulich <jbeulich@suse.com>
Subject: [XEN PATCH v2 2/2] x86/cpufreq: separate powernow/hwp/acpi cpufreq code
Date: Mon,  1 Jul 2024 15:19:15 +0300
Message-Id: <0f6e8a602fb3106d6b064582ca50d3d5fd4f1174.1719832871.git.Sergiy_Kibrik@epam.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1719832871.git.Sergiy_Kibrik@epam.com>
References: <cover.1719832871.git.Sergiy_Kibrik@epam.com>
MIME-Version: 1.0
X-Pobox-Relay-ID:
 242385C0-37A4-11EF-9A25-C38742FD603B-90055647!pb-smtp20.pobox.com
Content-Transfer-Encoding: quoted-printable

Build AMD Architectural P-state driver when CONFIG_AMD is on, and
Intel Hardware P-States driver together with ACPI Processor P-States driv=
er
when CONFIG_INTEL is on respectively, allowing for a platform-specific bu=
ild.

Signed-off-by: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
CC: Jason Andryuk <jason.andryuk@amd.com>
CC: Jan Beulich <jbeulich@suse.com>
---
changes in v2:
 - disable acpi-cpufreq driver as well when !INTEL
 - leave a stub for hwp_active() only when !INTEL
 - updated patch description
---
 xen/arch/x86/acpi/cpufreq/Makefile  | 6 +++---
 xen/arch/x86/acpi/cpufreq/cpufreq.c | 8 +++++---
 xen/drivers/acpi/pmstat.c           | 2 +-
 xen/drivers/cpufreq/cpufreq.c       | 3 ++-
 xen/drivers/cpufreq/utility.c       | 2 +-
 xen/include/acpi/cpufreq/cpufreq.h  | 9 +++++++++
 6 files changed, 21 insertions(+), 9 deletions(-)

diff --git a/xen/arch/x86/acpi/cpufreq/Makefile b/xen/arch/x86/acpi/cpufr=
eq/Makefile
index 44d4c0b497..e7dbe434a8 100644
--- a/xen/arch/x86/acpi/cpufreq/Makefile
+++ b/xen/arch/x86/acpi/cpufreq/Makefile
@@ -1,4 +1,4 @@
-obj-y +=3D acpi.o
+obj-$(CONFIG_INTEL) +=3D acpi.o
 obj-y +=3D cpufreq.o
-obj-y +=3D hwp.o
-obj-y +=3D powernow.o
+obj-$(CONFIG_INTEL) +=3D hwp.o
+obj-$(CONFIG_AMD) +=3D powernow.o
diff --git a/xen/arch/x86/acpi/cpufreq/cpufreq.c b/xen/arch/x86/acpi/cpuf=
req/cpufreq.c
index c1a842e959..59ea1f41d4 100644
--- a/xen/arch/x86/acpi/cpufreq/cpufreq.c
+++ b/xen/arch/x86/acpi/cpufreq/cpufreq.c
@@ -50,10 +50,12 @@ static int __init cf_check cpufreq_driver_init(void)
                 switch ( cpufreq_xen_opts[i] )
                 {
                 case CPUFREQ_xen:
-                    ret =3D acpi_register_driver();
+                    ret =3D IS_ENABLED(CONFIG_INTEL) ?
+                          acpi_register_driver() : -ENODEV;
                     break;
                 case CPUFREQ_hwp:
-                    ret =3D hwp_register_driver();
+                    ret =3D IS_ENABLED(CONFIG_INTEL) ?
+                          hwp_register_driver() : -ENODEV;
                     break;
                 case CPUFREQ_none:
                     ret =3D 0;
@@ -67,7 +69,7 @@ static int __init cf_check cpufreq_driver_init(void)
=20
         case X86_VENDOR_AMD:
         case X86_VENDOR_HYGON:
-            ret =3D powernow_register_driver();
+            ret =3D IS_ENABLED(CONFIG_AMD) ? powernow_register_driver() =
: -ENODEV;
             break;
         }
     }
diff --git a/xen/drivers/acpi/pmstat.c b/xen/drivers/acpi/pmstat.c
index 998d2e3c65..ff6b930794 100644
--- a/xen/drivers/acpi/pmstat.c
+++ b/xen/drivers/acpi/pmstat.c
@@ -255,7 +255,7 @@ static int get_cpufreq_para(struct xen_sysctl_pm_op *=
op)
         strlcpy(op->u.get_para.scaling_driver, "Unknown", CPUFREQ_NAME_L=
EN);
=20
     if ( !strncmp(op->u.get_para.scaling_driver, XEN_HWP_DRIVER_NAME,
-                      CPUFREQ_NAME_LEN) )
+                      CPUFREQ_NAME_LEN) && IS_ENABLED(CONFIG_INTEL) )
         ret =3D get_hwp_para(policy->cpu, &op->u.get_para.u.cppc_para);
     else
     {
diff --git a/xen/drivers/cpufreq/cpufreq.c b/xen/drivers/cpufreq/cpufreq.=
c
index 8659ad3aee..e61482e5b0 100644
--- a/xen/drivers/cpufreq/cpufreq.c
+++ b/xen/drivers/cpufreq/cpufreq.c
@@ -120,7 +120,8 @@ static int __init cf_check setup_cpufreq_option(const=
 char *str)
             if ( arg[0] && arg[1] )
                 ret =3D cpufreq_cmdline_parse(arg + 1, end);
         }
-        else if ( choice < 0 && !cmdline_strcmp(str, "hwp") )
+        else if ( choice < 0 && !cmdline_strcmp(str, "hwp") &&
+                  IS_ENABLED(CONFIG_INTEL) )
         {
             xen_processor_pmbits |=3D XEN_PROCESSOR_PM_PX;
             cpufreq_controller =3D FREQCTL_xen;
diff --git a/xen/drivers/cpufreq/utility.c b/xen/drivers/cpufreq/utility.=
c
index e690a484f1..aab0b78454 100644
--- a/xen/drivers/cpufreq/utility.c
+++ b/xen/drivers/cpufreq/utility.c
@@ -379,7 +379,7 @@ int cpufreq_driver_getavg(unsigned int cpu, unsigned =
int flag)
     if (!cpu_online(cpu) || !(policy =3D per_cpu(cpufreq_cpu_policy, cpu=
)))
         return 0;
=20
-    freq_avg =3D get_measured_perf(cpu, flag);
+    freq_avg =3D IS_ENABLED(CONFIG_INTEL) ? get_measured_perf(cpu, flag)=
 : 0;
     if ( freq_avg > 0 )
         return freq_avg;
=20
diff --git a/xen/include/acpi/cpufreq/cpufreq.h b/xen/include/acpi/cpufre=
q/cpufreq.h
index 1a8ba3756c..b2e7a592df 100644
--- a/xen/include/acpi/cpufreq/cpufreq.h
+++ b/xen/include/acpi/cpufreq/cpufreq.h
@@ -254,11 +254,20 @@ void intel_feature_detect(struct cpufreq_policy *po=
licy);
=20
 int hwp_cmdline_parse(const char *s, const char *e);
 int hwp_register_driver(void);
+#ifdef CONFIG_INTEL
 bool hwp_active(void);
+#else
+static inline bool hwp_active(void)
+{
+    return false;
+}
+#endif
+
 int get_hwp_para(unsigned int cpu,
                  struct xen_cppc_para *cppc_para);
 int set_hwp_para(struct cpufreq_policy *policy,
                  struct xen_set_cppc_para *set_cppc);
=20
 int acpi_register_driver(void);
+
 #endif /* __XEN_CPUFREQ_PM_H__ */
--=20
2.25.1


