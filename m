Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FF00A5BEB1
	for <lists+xen-devel@lfdr.de>; Tue, 11 Mar 2025 12:16:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.907860.1315078 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1trxbG-0007Hi-3e; Tue, 11 Mar 2025 11:16:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 907860.1315078; Tue, 11 Mar 2025 11:16:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1trxbF-0007Fo-Vc; Tue, 11 Mar 2025 11:16:41 +0000
Received: by outflank-mailman (input) for mailman id 907860;
 Tue, 11 Mar 2025 11:16:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1WQE=V6=gmail.com=gragst.linux@srs-se1.protection.inumbo.net>)
 id 1trxbE-0006Sq-5w
 for xen-devel@lists.xenproject.org; Tue, 11 Mar 2025 11:16:40 +0000
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com
 [2a00:1450:4864:20::230])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4d8b93ed-fe6a-11ef-9ab9-95dc52dad729;
 Tue, 11 Mar 2025 12:16:39 +0100 (CET)
Received: by mail-lj1-x230.google.com with SMTP id
 38308e7fff4ca-30bfc8faef9so32685031fa.1
 for <xen-devel@lists.xenproject.org>; Tue, 11 Mar 2025 04:16:39 -0700 (PDT)
Received: from epuakyiw0a98.kyiv.epam.com (ll-74.141.223.85.sovam.net.ua.
 [85.223.141.74]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5498ae45fa8sm1755729e87.52.2025.03.11.04.16.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Mar 2025 04:16:36 -0700 (PDT)
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
X-Inumbo-ID: 4d8b93ed-fe6a-11ef-9ab9-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741691798; x=1742296598; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dZ8IiY6XgKfSZ4z1G9tlPGGTDMovYwX3g0MBfNvj3Cs=;
        b=CBaP2AX1s5zyWTfjDVj3q/+tD2+qRwbckiCuIN+v1zMrftdEYgcDp9lUdenq1VVAwd
         hli+fG+LIlsHYFb5YO2DCv91kQgPsqjbCM+Kt5DPNHjpjmXwJA8qRAo57Mc99MQm5Ggv
         6Zn7DjE+8D56IYGnTMF5kbeZHxOknghyu1PJBtbSUai0L9d0wBS4CL/SLiaoHr/pOxdj
         XHntwmEIlfjlwCL5vika/061UpG3WGcZAjtodkSzoQfY8oWkvZN1WlFsjLRyW748E/Iv
         1z/LgmLfzxvB3K4r6JiKhNHP1gIcOT/q2WSueoKoF68/eaexsfvdf+GeevpEjMEKpVpR
         YROQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741691798; x=1742296598;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dZ8IiY6XgKfSZ4z1G9tlPGGTDMovYwX3g0MBfNvj3Cs=;
        b=DorzlewQ50RgbQV1pEQpELQpIuqXgpvEfAogoeTH8soIv7DbfLuNDDmEe6uGrM3Huj
         Vl+WbTzKAHdF4BhW06zy3Ps217FUok4a4SdhiQiSNOF+6dNfonE71Y+1AMha95DHSdtC
         PpEpNvfmI4HX19tv6gRPjwYjeC4G9eC4zF/82nutjKA2I3EjVOcD4alQrKWfHryPHF/R
         pvaFoHzU6pOpzQiJt4TE2VOfQLlam3YBF5ovdUkCg2WAVph9bElSgV6UPwixvuxp/vx7
         NGSRKVY7Uyh0p05M/uYfxmdPzChs83pM6SbjD1v5Ay6sm8GSCjUzJ0x2ODiIKDT1E10y
         fjuQ==
X-Gm-Message-State: AOJu0YxfPDeYv5AJ64RQ+Qcu2ZKMvVwljm/bHonQ9gppLL0HnTtYNSeY
	4vY/DJcOkPEAW4UAeAPHOqvaVgnVQ9cS7+Etwfd0vC/KuJlEBwQYlaU8Yg==
X-Gm-Gg: ASbGnctsc7bomL/mWg62N1ZxPHAT/8s520CenkhhD51GXgWOFpX/+mo1eNUeGT0xL5D
	g/jGWPLX8jykXkTtQ0yWpUntvwlQ5qLquOr/MQnzawmLQ8FHUCr8stmPdSFK+1Cxb/GCYON9rTy
	zSiJQB/kJ6HSxpvf42IWvlZO0zIH2UWxtMRUp7XRsi7/NOzVbFap72V14XMz9GB1fSaPh1jSLI+
	FqyOdHwU9bHBKEG8IGjTQHkcQU0LI6QMHCKTEL14BdrGKZjhXJN5HwsEpoth0IEpP9X6npPt1vq
	Wa3ueHAWIPK0HkWabCqKrHEiOkYh90NRcFSh1G6ImstrzgOSWN9SfvRRSrYbXoeRMLBsv6x9JHz
	D5Th1MLo/1ScLzNOJGLOXdXlBEA8=
X-Google-Smtp-Source: AGHT+IFxUf27PD/iQbSf+dmvyb3BN7p5RVYXcb02X3oue8L5FSS5VfDdw3RzWVnfz/fqptXjSmChVA==
X-Received: by 2002:a05:6512:159a:b0:549:8924:2212 with SMTP id 2adb3069b0e04-54990e5866bmr6506877e87.17.1741691798136;
        Tue, 11 Mar 2025 04:16:38 -0700 (PDT)
From: Grygorii Strashko <gragst.linux@gmail.com>
X-Google-Original-From: Grygorii Strashko <grygorii_strashko@epam.com>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Michal Orzel <michal.orzel@amd.com>,
	"Roger Pau Monne" <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Oleksii Moisieiev <oleksii_moisieiev@epam.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Juergen Gross <jgross@suse.com>,
	Grygorii Strashko <grygorii_strashko@epam.com>
Subject: [RFC PATCH v3 3/7] xen/arm: scmi-smc: passthrough SCMI SMC to guest domain
Date: Tue, 11 Mar 2025 13:16:14 +0200
Message-Id: <20250311111618.1850927-4-grygorii_strashko@epam.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250311111618.1850927-1-grygorii_strashko@epam.com>
References: <20250311111618.1850927-1-grygorii_strashko@epam.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The commit 3e322bef8bc0 ("xen/arm: firmware: Add SCMI over SMC calls
handling layer") introduces simple driver which forwards SCMI over SMC
calls from hwdom/dom0 to EL3 firmware (TF-A) with a single SCMI OSPM agent
support. While it working gracefully for hwdom/dom0 use case it doesn't
cover "thin Dom0 with guest domain, which serves as Driver domain"
use-case. In this case HW need to be enable in Driver domain and dom0 is
performing only control functions.

The EL3 SCMI firmware (TF-A) with a single SCMI OSPM agent support is
pretty generic case for the default vendors SDK and new platforms.

This patch enables passthrough of SCMI SMC single agent interface to the
Driver domain which can be enabled in the following way:

 - dom0: add dom0_scmi_smc_passthrough to the Xen Command Line
 - domD: xl.cfg add "arm_sci" option as below

   arm_sci = "type=scmi_smc"

 - domD: xl.cfg enable access to the "arm,scmi-shmem"

iomem = [
    "47ff0,1@22001",
]

 - domD: add scmi nodes to the Driver domain partial device tree as in the
 below example:

passthrough {
   scmi_shm_0: sram@22001000 {
       compatible = "arm,scmi-shmem";
       reg = <0x0 0x22001000 0x0 0x1000>;
   };

   firmware {
        compatible = "simple-bus";
            scmi: scmi {
                compatible = "arm,scmi-smc";
                shmem = <&scmi_shm_0>;
                ...
            }
    }
}

The SCMI SMC single agent interface can be enabled for one and only one
domain. In general, the configuration is similar to any other HW
passthrough, except explicitly enabling SCMI with "arm_sci" xl.cfg option.

Note that SCMI and "arm,scmi-shmem" nodes will be removed from
dom0 DT.

Signed-off-by: Grygorii Strashko <grygorii_strashko@epam.com>
---
 docs/man/xl.cfg.5.pod.in          | 36 ++++++++++++++
 docs/misc/xen-command-line.pandoc |  9 ++++
 tools/include/libxl.h             |  5 ++
 tools/libs/light/libxl_arm.c      | 13 ++++++
 tools/libs/light/libxl_types.idl  | 10 ++++
 tools/xl/xl_parse.c               | 66 ++++++++++++++++++++++++++
 xen/arch/arm/firmware/Kconfig     |  4 +-
 xen/arch/arm/firmware/scmi-smc.c  | 78 +++++++++++++++++++++++++++++--
 8 files changed, 217 insertions(+), 4 deletions(-)

diff --git a/docs/man/xl.cfg.5.pod.in b/docs/man/xl.cfg.5.pod.in
index 8e1422104e50..7edf272386e3 100644
--- a/docs/man/xl.cfg.5.pod.in
+++ b/docs/man/xl.cfg.5.pod.in
@@ -3094,6 +3094,42 @@ assigned to the domain.
 
 =back
 
+=over 4
+
+=item B<arm_sci="ARM_SCI_STRING">
+
+Set ARM_SCI specific options for the guest. ARM SCI is System
+Control Protocol allows domain to manage various functions that are provided
+by HW platform firmware.
+
+B<ARM_SCI_STRING> is a comma separated list of C<KEY=VALUE> settings,
+from the following list:
+
+=over 4
+
+=item B<type=STRING>
+
+Specifies an ARM SCI type for the guest.
+
+=over 4
+
+=item B<none>
+
+Don't allow guest to use ARM SCI if present on the platform. This is the
+default value.
+
+=item B<scmi_smc>
+
+Enables ARM SCMI SMC support for the guest by enabling SCMI over SMC calls
+forwarding from domain to the EL3 firmware (like Trusted Firmware-A) with a
+single SCMI OSPM agent support.
+Should be used together with B<dom0_scmi_smc_passthrough> Xen command line
+option.
+
+=back
+
+=back
+
 =head3 x86
 
 =over 4
diff --git a/docs/misc/xen-command-line.pandoc b/docs/misc/xen-command-line.pandoc
index 9bbd00baef91..8e50f6b7c7ac 100644
--- a/docs/misc/xen-command-line.pandoc
+++ b/docs/misc/xen-command-line.pandoc
@@ -1082,6 +1082,15 @@ affinities to prefer but be not limited to the specified node(s).
 
 Pin dom0 vcpus to their respective pcpus
 
+### dom0_scmi_smc_passthrough (ARM)
+> `= <boolean>`
+
+The option is available when `CONFIG_SCMI_SMC` is compiled in, and allows to
+enable SCMI SMC single agent interface for any, but only one guest domain,
+which serves as Driver domain. The SCMI will be disabled for Dom0/hwdom and
+SCMI nodes removed from Dom0/hwdom device tree.
+(for example, thin Dom0 with Driver domain use-case).
+
 ### dtuart (ARM)
 > `= path [:options]`
 
diff --git a/tools/include/libxl.h b/tools/include/libxl.h
index f8fe4afd7dca..5fa43637ab76 100644
--- a/tools/include/libxl.h
+++ b/tools/include/libxl.h
@@ -313,6 +313,11 @@
  */
 #define LIBXL_HAVE_BUILDINFO_ARCH_NR_SPIS 1
 
+/*
+ * libxl_domain_build_info has the arch_arm.sci* fields.
+ */
+#define LIBXL_HAVE_BUILDINFO_ARCH_ARM_SCI 1
+
 /*
  * LIBXL_HAVE_SOFT_RESET indicates that libxl supports performing
  * 'soft reset' for domains and there is 'soft_reset' shutdown reason
diff --git a/tools/libs/light/libxl_arm.c b/tools/libs/light/libxl_arm.c
index 28cea1f643c9..d41adea1cefd 100644
--- a/tools/libs/light/libxl_arm.c
+++ b/tools/libs/light/libxl_arm.c
@@ -222,6 +222,19 @@ int libxl__arch_domain_prepare_config(libxl__gc *gc,
         config->arch.sve_vl = d_config->b_info.arch_arm.sve_vl / 128U;
     }
 
+    switch (d_config->b_info.arm_sci.type) {
+    case LIBXL_ARM_SCI_TYPE_NONE:
+        config->arch.arm_sci_type = XEN_DOMCTL_CONFIG_ARM_SCI_NONE;
+        break;
+    case LIBXL_ARM_SCI_TYPE_SCMI_SMC:
+        config->arch.arm_sci_type = XEN_DOMCTL_CONFIG_ARM_SCI_SCMI_SMC;
+        break;
+    default:
+        LOG(ERROR, "Unknown ARM_SCI type %d",
+            d_config->b_info.arm_sci.type);
+        return ERROR_FAIL;
+    }
+
     return 0;
 }
 
diff --git a/tools/libs/light/libxl_types.idl b/tools/libs/light/libxl_types.idl
index 33c9cfc1a267..ea0d30654cdd 100644
--- a/tools/libs/light/libxl_types.idl
+++ b/tools/libs/light/libxl_types.idl
@@ -551,6 +551,15 @@ libxl_sve_type = Enumeration("sve_type", [
     (2048, "2048")
     ], init_val = "LIBXL_SVE_TYPE_DISABLED")
 
+libxl_arm_sci_type = Enumeration("arm_sci_type", [
+    (0, "none"),
+    (1, "scmi_smc")
+    ], init_val = "LIBXL_ARM_SCI_TYPE_NONE")
+
+libxl_arm_sci = Struct("arm_sci", [
+    ("type", libxl_arm_sci_type),
+    ])
+
 libxl_rdm_reserve = Struct("rdm_reserve", [
     ("strategy",    libxl_rdm_reserve_strategy),
     ("policy",      libxl_rdm_reserve_policy),
@@ -639,6 +648,7 @@ libxl_domain_build_info = Struct("domain_build_info",[
     ("apic",             libxl_defbool),
     ("dm_restrict",      libxl_defbool),
     ("tee",              libxl_tee_type),
+    ("arm_sci",          libxl_arm_sci),
     ("u", KeyedUnion(None, libxl_domain_type, "type",
                 [("hvm", Struct(None, [("firmware",         string),
                                        ("bios",             libxl_bios_type),
diff --git a/tools/xl/xl_parse.c b/tools/xl/xl_parse.c
index 9a3679c02325..ac9bf0b25c5a 100644
--- a/tools/xl/xl_parse.c
+++ b/tools/xl/xl_parse.c
@@ -1284,6 +1284,63 @@ out:
     if (rc) exit(EXIT_FAILURE);
 }
 
+static int parse_arm_sci_config(XLU_Config *cfg, libxl_arm_sci *arm_sci,
+                                const char *str)
+{
+    enum {
+        STATE_OPTION,
+        STATE_TYPE,
+        STATE_TERMINAL,
+    };
+    int ret, state = STATE_OPTION;
+    char *buf2, *tok, *ptr, *end;
+
+    if (NULL == (buf2 = ptr = strdup(str)))
+        return ERROR_NOMEM;
+
+    for (tok = ptr, end = ptr + strlen(ptr) + 1; ptr < end; ptr++) {
+        switch(state) {
+        case STATE_OPTION:
+            if (*ptr == '=') {
+                *ptr = '\0';
+                if (!strcmp(tok, "type")) {
+                    state = STATE_TYPE;
+                } else {
+                    fprintf(stderr, "Unknown ARM_SCI option: %s\n", tok);
+                    goto parse_error;
+                }
+                tok = ptr + 1;
+            }
+            break;
+        case STATE_TYPE:
+            if (*ptr == '\0' || *ptr == ',') {
+                state = *ptr == ',' ? STATE_OPTION : STATE_TERMINAL;
+                *ptr = '\0';
+                ret = libxl_arm_sci_type_from_string(tok, &arm_sci->type);
+                if (ret) {
+                    fprintf(stderr, "Unknown ARM_SCI type: %s\n", tok);
+                    goto parse_error;
+                }
+                tok = ptr + 1;
+            }
+            break;
+        default:
+            break;
+        }
+    }
+
+    if (tok != ptr || state != STATE_TERMINAL)
+        goto parse_error;
+
+    free(buf2);
+
+    return 0;
+
+parse_error:
+    free(buf2);
+    return ERROR_INVAL;
+}
+
 void parse_config_data(const char *config_source,
                        const char *config_data,
                        int config_len,
@@ -2981,6 +3038,15 @@ skip_usbdev:
     if (!xlu_cfg_get_long (config, "nr_spis", &l, 0))
         b_info->arch_arm.nr_spis = l;
 
+    if (!xlu_cfg_get_string(config, "arm_sci", &buf, 1)) {
+        libxl_arm_sci arm_sci = { 0 };
+        if (!parse_arm_sci_config(config, &arm_sci, buf)) {
+            b_info->arm_sci.type = arm_sci.type;
+        } else {
+            exit(EXIT_FAILURE);
+        }
+    }
+
     parse_vkb_list(config, d_config);
 
     d_config->virtios = NULL;
diff --git a/xen/arch/arm/firmware/Kconfig b/xen/arch/arm/firmware/Kconfig
index 02d7b600317f..2686ba313898 100644
--- a/xen/arch/arm/firmware/Kconfig
+++ b/xen/arch/arm/firmware/Kconfig
@@ -25,7 +25,9 @@ config SCMI_SMC
 	  doorbell mechanism and Shared Memory for transport ("arm,scmi-smc"
 	  compatible only). The value of "arm,smc-id" DT property from SCMI
 	  firmware node is used to trap and forward corresponding SCMI SMCs
-	  to firmware running at EL3, for calls coming from the hardware domain.
+	  to firmware running at EL3, for calls coming from the hardware domain or
+	  driver domain.
+	  Use with EL3 firmware which supports only single SCMI OSPM agent.
 
 endchoice
 
diff --git a/xen/arch/arm/firmware/scmi-smc.c b/xen/arch/arm/firmware/scmi-smc.c
index 188bd659513b..7a0130ea0ea9 100644
--- a/xen/arch/arm/firmware/scmi-smc.c
+++ b/xen/arch/arm/firmware/scmi-smc.c
@@ -14,6 +14,8 @@
 #include <xen/device_tree.h>
 #include <xen/errno.h>
 #include <xen/init.h>
+#include <xen/iocap.h>
+#include <xen/param.h>
 #include <xen/sched.h>
 #include <xen/types.h>
 
@@ -22,7 +24,11 @@
 
 #define SCMI_SMC_ID_PROP   "arm,smc-id"
 
+static bool __ro_after_init opt_dom0_scmi_smc_passthrough = false;
+boolean_param("dom0_scmi_smc_passthrough", opt_dom0_scmi_smc_passthrough);
+
 static uint32_t __ro_after_init scmi_smc_id;
+static struct domain *scmi_dom;
 
 /*
  * Check if provided SMC Function Identifier matches the one known by the SCMI
@@ -50,7 +56,7 @@ static bool scmi_handle_smc(struct cpu_user_regs *regs)
         return false;
 
     /* Only the hardware domain should use SCMI calls */
-    if ( !is_hardware_domain(current->domain) )
+    if ( scmi_dom != current->domain )
     {
         gdprintk(XENLOG_WARNING, "SCMI: Unprivileged access attempt\n");
         return false;
@@ -78,9 +84,18 @@ static bool scmi_handle_smc(struct cpu_user_regs *regs)
 static int scmi_smc_domain_init(struct domain *d,
                                 struct xen_domctl_createdomain *config)
 {
-    if ( !is_hardware_domain(d) )
+    if ( !opt_dom0_scmi_smc_passthrough && !is_hardware_domain(d) )
+        return 0;
+
+    if ( opt_dom0_scmi_smc_passthrough &&
+         (config->arch.arm_sci_type != XEN_DOMCTL_CONFIG_ARM_SCI_SCMI_SMC ||
+          is_hardware_domain(d)) )
         return 0;
 
+    if ( scmi_dom )
+        return -EEXIST;
+
+    scmi_dom = d;
     d->arch.sci_enabled = true;
     printk(XENLOG_DEBUG "SCMI: %pd init\n", d);
     return 0;
@@ -88,12 +103,68 @@ static int scmi_smc_domain_init(struct domain *d,
 
 static void scmi_smc_domain_destroy(struct domain *d)
 {
-    if ( !is_hardware_domain(d) )
+    if ( scmi_dom && scmi_dom != d )
         return;
 
+    scmi_dom = NULL;
+    d->arch.sci_enabled = false;
     printk(XENLOG_DEBUG "SCMI: %pd destroy\n", d);
 }
 
+/*
+ * Handle Dom0 SCMI SMC specific DT nodes
+ *
+ * Copy SCMI nodes into Dom0 device tree if dom0_scmi_smc_passthrough=false.
+ *
+ */
+static bool scmi_smc_dt_handle_node(struct domain *d,
+                                    struct dt_device_node *node)
+{
+    static const struct dt_device_match shmem_matches[] __initconst = {
+        DT_MATCH_COMPATIBLE("arm,scmi-shmem"),
+        { /* sentinel */ },
+    };
+    static const struct dt_device_match scmi_matches[] __initconst = {
+        DT_MATCH_PATH("/firmware/scmi"),
+        { /* sentinel */ },
+    };
+
+    if ( dt_match_node(shmem_matches, node) && !sci_domain_is_enabled(d) )
+    {
+        dt_dprintk("  Skip scmi shmem node\n");
+        return true;
+    }
+
+    if ( dt_match_node(scmi_matches, node) && !sci_domain_is_enabled(d) )
+    {
+        struct dt_device_node *shmem_node;
+        const __be32 *prop;
+        u64 paddr, size;
+        int ret;
+
+        dt_dprintk("  Skip scmi node\n");
+
+        prop = dt_get_property(node, "shmem", NULL);
+        if ( !prop )
+            return true;
+
+        shmem_node = dt_find_node_by_phandle(be32_to_cpup(prop));
+        if ( !shmem_node )
+            return true;
+
+        ret = dt_device_get_address(shmem_node, 0, &paddr, &size);
+        if ( ret )
+            return true;
+
+        ret = iomem_permit_access(d, paddr_to_pfn(paddr),
+                                  paddr_to_pfn(paddr + size - 1));
+
+        return true;
+    }
+
+    return false;
+}
+
 static int __init scmi_check_smccc_ver(void)
 {
     if ( smccc_ver < ARM_SMCCC_VERSION_1_1 )
@@ -110,6 +181,7 @@ static const struct sci_mediator_ops scmi_smc_ops = {
     .handle_call = scmi_handle_smc,
     .domain_init = scmi_smc_domain_init,
     .domain_destroy = scmi_smc_domain_destroy,
+    .dom0_dt_handle_node = scmi_smc_dt_handle_node,
 };
 
 /* Initialize the SCMI layer based on SMCs and Device-tree */
-- 
2.34.1


