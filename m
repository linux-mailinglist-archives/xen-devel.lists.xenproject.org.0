Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C776E92CD0A
	for <lists+xen-devel@lfdr.de>; Wed, 10 Jul 2024 10:30:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.756618.1165287 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sRSiW-0000yb-RY; Wed, 10 Jul 2024 08:30:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 756618.1165287; Wed, 10 Jul 2024 08:30:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sRSiW-0000wM-Od; Wed, 10 Jul 2024 08:30:24 +0000
Received: by outflank-mailman (input) for mailman id 756618;
 Wed, 10 Jul 2024 08:30:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hHuL=OK=darkstar.site=sakib@srs-se1.protection.inumbo.net>)
 id 1sRSiV-0000wE-4Y
 for xen-devel@lists.xenproject.org; Wed, 10 Jul 2024 08:30:23 +0000
Received: from pb-smtp20.pobox.com (pb-smtp20.pobox.com [173.228.157.52])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a463428b-3e96-11ef-8776-851b0ebba9a2;
 Wed, 10 Jul 2024 10:30:20 +0200 (CEST)
Received: from pb-smtp20.pobox.com (unknown [127.0.0.1])
 by pb-smtp20.pobox.com (Postfix) with ESMTP id 15BF7184AB;
 Wed, 10 Jul 2024 04:30:19 -0400 (EDT)
 (envelope-from sakib@darkstar.site)
Received: from pb-smtp20.sea.icgroup.com (unknown [127.0.0.1])
 by pb-smtp20.pobox.com (Postfix) with ESMTP id 0CE2B184AA;
 Wed, 10 Jul 2024 04:30:19 -0400 (EDT)
 (envelope-from sakib@darkstar.site)
Received: from localhost (unknown [185.130.54.75])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by pb-smtp20.pobox.com (Postfix) with ESMTPSA id 7A47F184A8;
 Wed, 10 Jul 2024 04:30:15 -0400 (EDT)
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
X-Inumbo-ID: a463428b-3e96-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed; d=pobox.com; h=from:to:cc
	:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding; s=sasl; bh=DMyPQcp7MVx9wCHWMI7ShggWQ
	RVoCrJB3hO/uCOqu1U=; b=lNBDLzpOPwS+C46MRgnyrwTYglnSYE1EDn4tGzaWa
	5VCs5+wPGTS9MQwUW1ZRnEUcrrn59AU14ohx22Nko4LKarDuE2RT2uMIlWiBzZqr
	GEUMI0YXUeIpTzUw5qlZuZ3EpLsK8/KiiiHrynjL83yppUD66ASzNsYTPDU5s0eZ
	j0=
From: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
To: xen-devel@lists.xenproject.org
Cc: Sergiy Kibrik <Sergiy_Kibrik@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Jason Andryuk <jason.andryuk@amd.com>,
	Jan Beulich <jbeulich@suse.com>
Subject: [XEN PATCH v3 2/2] x86/cpufreq: separate powernow/hwp/acpi cpufreq code
Date: Wed, 10 Jul 2024 11:30:11 +0300
Message-Id: <56f61a1e22ba77fb352d7a18203935c26c815646.1720596402.git.Sergiy_Kibrik@epam.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1720596402.git.Sergiy_Kibrik@epam.com>
References: <cover.1720596402.git.Sergiy_Kibrik@epam.com>
MIME-Version: 1.0
X-Pobox-Relay-ID:
 A1F7A6F4-3E96-11EF-A1CE-C38742FD603B-90055647!pb-smtp20.pobox.com
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
changes in v3:
 - more clear wrapping of lines in conditionals + put IS_ENABLED() in fro=
nt
 - drop unneeded change to utility.c
changes in v2:
 - disable acpi-cpufreq driver as well when !INTEL
 - leave a stub for hwp_active() only when !INTEL
 - updated patch description
---
 xen/arch/x86/acpi/cpufreq/Makefile  | 6 +++---
 xen/arch/x86/acpi/cpufreq/cpufreq.c | 8 +++++---
 xen/drivers/acpi/pmstat.c           | 5 +++--
 xen/drivers/cpufreq/cpufreq.c       | 3 ++-
 xen/include/acpi/cpufreq/cpufreq.h  | 8 ++++++++
 5 files changed, 21 insertions(+), 9 deletions(-)

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
index 6244d29496..61e98b67bd 100644
--- a/xen/arch/x86/acpi/cpufreq/cpufreq.c
+++ b/xen/arch/x86/acpi/cpufreq/cpufreq.c
@@ -138,10 +138,12 @@ static int __init cf_check cpufreq_driver_init(void=
)
                 switch ( cpufreq_xen_opts[i] )
                 {
                 case CPUFREQ_xen:
-                    ret =3D acpi_cpufreq_register();
+                    ret =3D IS_ENABLED(CONFIG_INTEL) ?
+                          acpi_cpufreq_register() : -ENODEV;
                     break;
                 case CPUFREQ_hwp:
-                    ret =3D hwp_register_driver();
+                    ret =3D IS_ENABLED(CONFIG_INTEL) ?
+                          hwp_register_driver() : -ENODEV;
                     break;
                 case CPUFREQ_none:
                     ret =3D 0;
@@ -155,7 +157,7 @@ static int __init cf_check cpufreq_driver_init(void)
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
index 998d2e3c65..df309e27b4 100644
--- a/xen/drivers/acpi/pmstat.c
+++ b/xen/drivers/acpi/pmstat.c
@@ -254,8 +254,9 @@ static int get_cpufreq_para(struct xen_sysctl_pm_op *=
op)
     else
         strlcpy(op->u.get_para.scaling_driver, "Unknown", CPUFREQ_NAME_L=
EN);
=20
-    if ( !strncmp(op->u.get_para.scaling_driver, XEN_HWP_DRIVER_NAME,
-                      CPUFREQ_NAME_LEN) )
+    if ( IS_ENABLED(CONFIG_INTEL) &&
+         !strncmp(op->u.get_para.scaling_driver, XEN_HWP_DRIVER_NAME,
+                  CPUFREQ_NAME_LEN) )
         ret =3D get_hwp_para(policy->cpu, &op->u.get_para.u.cppc_para);
     else
     {
diff --git a/xen/drivers/cpufreq/cpufreq.c b/xen/drivers/cpufreq/cpufreq.=
c
index 8659ad3aee..4a103c6de9 100644
--- a/xen/drivers/cpufreq/cpufreq.c
+++ b/xen/drivers/cpufreq/cpufreq.c
@@ -120,7 +120,8 @@ static int __init cf_check setup_cpufreq_option(const=
 char *str)
             if ( arg[0] && arg[1] )
                 ret =3D cpufreq_cmdline_parse(arg + 1, end);
         }
-        else if ( choice < 0 && !cmdline_strcmp(str, "hwp") )
+        else if ( IS_ENABLED(CONFIG_INTEL) && choice < 0 &&
+                  !cmdline_strcmp(str, "hwp") )
         {
             xen_processor_pmbits |=3D XEN_PROCESSOR_PM_PX;
             cpufreq_controller =3D FREQCTL_xen;
diff --git a/xen/include/acpi/cpufreq/cpufreq.h b/xen/include/acpi/cpufre=
q/cpufreq.h
index ec7e139000..08ee2af0f8 100644
--- a/xen/include/acpi/cpufreq/cpufreq.h
+++ b/xen/include/acpi/cpufreq/cpufreq.h
@@ -254,7 +254,15 @@ void intel_feature_detect(struct cpufreq_policy *pol=
icy);
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
--=20
2.25.1


