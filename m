Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F25E8FAEF1
	for <lists+xen-devel@lfdr.de>; Tue,  4 Jun 2024 11:35:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.735297.1141468 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sEQYd-0005hL-6a; Tue, 04 Jun 2024 09:34:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 735297.1141468; Tue, 04 Jun 2024 09:34:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sEQYd-0005ex-3j; Tue, 04 Jun 2024 09:34:19 +0000
Received: by outflank-mailman (input) for mailman id 735297;
 Tue, 04 Jun 2024 09:34:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WX0/=NG=darkstar.site=sakib@srs-se1.protection.inumbo.net>)
 id 1sEQYb-0005er-H8
 for xen-devel@lists.xenproject.org; Tue, 04 Jun 2024 09:34:17 +0000
Received: from pb-smtp20.pobox.com (pb-smtp20.pobox.com [173.228.157.52])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9a98104e-2255-11ef-b4bb-af5377834399;
 Tue, 04 Jun 2024 11:34:14 +0200 (CEST)
Received: from pb-smtp20.pobox.com (unknown [127.0.0.1])
 by pb-smtp20.pobox.com (Postfix) with ESMTP id 997412F5DB;
 Tue,  4 Jun 2024 05:34:12 -0400 (EDT)
 (envelope-from sakib@darkstar.site)
Received: from pb-smtp20.sea.icgroup.com (unknown [127.0.0.1])
 by pb-smtp20.pobox.com (Postfix) with ESMTP id 91B252F5DA;
 Tue,  4 Jun 2024 05:34:12 -0400 (EDT)
 (envelope-from sakib@darkstar.site)
Received: from localhost (unknown [185.130.54.75])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by pb-smtp20.pobox.com (Postfix) with ESMTPSA id ABF432F5D9;
 Tue,  4 Jun 2024 05:34:09 -0400 (EDT)
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
X-Inumbo-ID: 9a98104e-2255-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed; d=pobox.com; h=from:to:cc
	:subject:date:message-id:mime-version:content-transfer-encoding;
	 s=sasl; bh=xPhBlxMah8ylw2Vp341Ssc/9KhHi6LZUJO+fI51M1Xw=; b=ubsG
	NxbTQMv4tRUxnxFLHSBGco9H1CB7ZrM0tD/ZtvLZJp86kAbat3WbDYz+U80ExSXO
	RO/67DxLMAXQnN+nsMOFComgB9hWgBqDPxRW47kczV5zPm/4C3XkhI9wJ6zTGQlP
	jbfYJZT5ukmJQi+rtd2n2SAlxDEf58CoSYY7VyI=
From: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
To: xen-devel@lists.xenproject.org
Cc: Sergiy Kibrik <Sergiy_Kibrik@epam.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Jason Andryuk <jason.andryuk@amd.com>
Subject: [XEN PATCH v1] x86/cpufreq: separate powernow/hwp cpufreq code
Date: Tue,  4 Jun 2024 12:34:06 +0300
Message-Id: <20240604093406.2448552-1-Sergiy_Kibrik@epam.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Pobox-Relay-ID:
 98762248-2255-11EF-A541-ACC938F0AE34-90055647!pb-smtp20.pobox.com
Content-Transfer-Encoding: quoted-printable

Build AMD Architectural P-state driver when CONFIG_AMD is on, and
Intel Hardware P-States driver when CONFIG_INTEL is on respectively,
allowing for a plaftorm-specific build.

Signed-off-by: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
CC: Jason Andryuk <jason.andryuk@amd.com>
---
 xen/arch/x86/acpi/cpufreq/Makefile  |  4 ++--
 xen/arch/x86/acpi/cpufreq/cpufreq.c |  2 +-
 xen/include/acpi/cpufreq/cpufreq.h  | 32 +++++++++++++++++++++++++++++
 3 files changed, 35 insertions(+), 3 deletions(-)

diff --git a/xen/arch/x86/acpi/cpufreq/Makefile b/xen/arch/x86/acpi/cpufr=
eq/Makefile
index db83aa6b14..527ff20f5a 100644
--- a/xen/arch/x86/acpi/cpufreq/Makefile
+++ b/xen/arch/x86/acpi/cpufreq/Makefile
@@ -1,3 +1,3 @@
 obj-y +=3D cpufreq.o
-obj-y +=3D hwp.o
-obj-y +=3D powernow.o
+obj-$(CONFIG_INTEL) +=3D hwp.o
+obj-$(CONFIG_AMD) +=3D powernow.o
diff --git a/xen/arch/x86/acpi/cpufreq/cpufreq.c b/xen/arch/x86/acpi/cpuf=
req/cpufreq.c
index a341f2f020..a89f3ed03a 100644
--- a/xen/arch/x86/acpi/cpufreq/cpufreq.c
+++ b/xen/arch/x86/acpi/cpufreq/cpufreq.c
@@ -657,7 +657,7 @@ static int __init cf_check cpufreq_driver_init(void)
=20
         case X86_VENDOR_AMD:
         case X86_VENDOR_HYGON:
-            ret =3D powernow_register_driver();
+            ret =3D IS_ENABLED(CONFIG_AMD) ? powernow_register_driver() =
: -ENODEV;
             break;
         }
     }
diff --git a/xen/include/acpi/cpufreq/cpufreq.h b/xen/include/acpi/cpufre=
q/cpufreq.h
index 443427153b..bc0c9a2b9f 100644
--- a/xen/include/acpi/cpufreq/cpufreq.h
+++ b/xen/include/acpi/cpufreq/cpufreq.h
@@ -252,6 +252,7 @@ void cpufreq_dbs_timer_resume(void);
=20
 void intel_feature_detect(struct cpufreq_policy *policy);
=20
+#ifdef CONFIG_INTEL
 int hwp_cmdline_parse(const char *s, const char *e);
 int hwp_register_driver(void);
 bool hwp_active(void);
@@ -260,4 +261,35 @@ int get_hwp_para(unsigned int cpu,
 int set_hwp_para(struct cpufreq_policy *policy,
                  struct xen_set_cppc_para *set_cppc);
=20
+#else
+
+static inline int hwp_cmdline_parse(const char *s, const char *e)
+{
+    return -EINVAL;
+}
+
+static inline int hwp_register_driver(void)
+{
+    return -ENODEV;
+}
+
+static inline bool hwp_active(void)
+{
+    return false;
+}
+
+static inline int get_hwp_para(unsigned int cpu,
+                               struct xen_cppc_para *cppc_para)
+{
+    return -EINVAL;
+}
+
+static inline int set_hwp_para(struct cpufreq_policy *policy,
+                               struct xen_set_cppc_para *set_cppc)
+{
+    return -EINVAL;
+}
+
+#endif /* CONFIG_INTEL */
+
 #endif /* __XEN_CPUFREQ_PM_H__ */
--=20
2.25.1


