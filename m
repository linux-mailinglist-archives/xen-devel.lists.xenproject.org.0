Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 595FAA5BEB4
	for <lists+xen-devel@lfdr.de>; Tue, 11 Mar 2025 12:16:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.907867.1315097 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1trxbM-0007z6-US; Tue, 11 Mar 2025 11:16:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 907867.1315097; Tue, 11 Mar 2025 11:16:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1trxbM-0007vg-MH; Tue, 11 Mar 2025 11:16:48 +0000
Received: by outflank-mailman (input) for mailman id 907867;
 Tue, 11 Mar 2025 11:16:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1WQE=V6=gmail.com=gragst.linux@srs-se1.protection.inumbo.net>)
 id 1trxbL-00061U-20
 for xen-devel@lists.xenproject.org; Tue, 11 Mar 2025 11:16:47 +0000
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [2a00:1450:4864:20::229])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 50632b62-fe6a-11ef-9898-31a8f345e629;
 Tue, 11 Mar 2025 12:16:44 +0100 (CET)
Received: by mail-lj1-x229.google.com with SMTP id
 38308e7fff4ca-30bee278c2aso52145171fa.0
 for <xen-devel@lists.xenproject.org>; Tue, 11 Mar 2025 04:16:44 -0700 (PDT)
Received: from epuakyiw0a98.kyiv.epam.com (ll-74.141.223.85.sovam.net.ua.
 [85.223.141.74]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5498ae45fa8sm1755729e87.52.2025.03.11.04.16.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Mar 2025 04:16:40 -0700 (PDT)
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
X-Inumbo-ID: 50632b62-fe6a-11ef-9898-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741691803; x=1742296603; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ULLAK7NmCziJs9BSDGosiIrFW201LWUnnGDpVeP39lU=;
        b=lNVOBg9q8bq1WyXNqcLHVtcLJ+VW5YlyXFx+7DlcGXFF7vgCxwT2zlZYymZ64Gtttc
         rdzbIHDsHxR23/4RH+s6125qB2Y1+wYlbyc/A4UssTCll4AGgM96wW9kyXYrPgXGzuh3
         rQhnvqhVkhf6jz3mpyilcdtBfZ6lyLyw0wp+98hMLAOyoKHgfx9yBXx7sQeQRszjfcb+
         W0i2goNILYCX2oIH2pznq3qKuJZyUnyYuUlZBpigLFAQwyMtonEgVLD1+12/7ImoovRu
         OjH2cdlhR0IdRFOSmpNVFhYwKzv7uT9CR1AhTyUDZtuuM0fjKLjBOBw9hYYpwPZuF6rz
         FF9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741691803; x=1742296603;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ULLAK7NmCziJs9BSDGosiIrFW201LWUnnGDpVeP39lU=;
        b=a9erxy57EXiadMYtpxc7BpgRf8JK1ebypX/f8VU1QD1pyGFeb2dM+7sROA2uC0gjVn
         el9wdwUw4nt9e8SjCZD/aXxfGYe1AeRza3U7NE509cjCfc3CgyYXRELC2QvA9txTAmQn
         AHk1emuNV+KU+OPFvZbbt+5lft2FBJ2GXGlBUr81l9b/47aIHX5HPHpA/DvKZjJtGE/6
         R1eks5izTYO28ljmKYYQuEQ0S4Oiv1QwNCbKpAb/X/MAr36xe+qQuekB0lbfNaEnnm7y
         F1Y4CD+iw2FSEqNW7a15WDcHmL3z+OC49e5D2I/qA20EawbsJegVoG8oZmL8I0859Otw
         RrcA==
X-Gm-Message-State: AOJu0Yy2VErUq3Hk0YJaWBCmOsTg9OFsnVdXKamL58n20iTcFkbysjOd
	IyCAC33YN2QXF0RJCXicAYMx5Aa81E0U99w5MhNFjXeNJfFt7hzlZvdLYQ==
X-Gm-Gg: ASbGncv0g8zLEpBtoWytD/c0WHuCkebid+fckntF3vTbjUeGOqBSBYekxtKQ9wyBN6p
	dmHZUsHlOcnIPtNJ/7igHeSnBGDrh+GAghDalOmemP+p2VpVsI8BdsW0PzdEe7cZ0shWAo6xUf0
	43ai8SUn0MZCVhrUd3Srf7z64OMV39OSmhIt1GcMtJMaYC4IySKciN1zVDntkj4Vqpda4Dnt1lD
	a6PImu8pwfOOTnYKYY25JzXRXS5FxACpjGSrpH66y70ZcRqBDjOfu4nTytsprSLaXU6bIC6bj6B
	m9uiJbKk1AQMySQUe2Gm5438dVTNRVF/9k3zJKI12R0O7201VgkhJN+FBRhlwJf7iiUR2pwcahI
	X8XNc9b7N1wOHcAO1VzAm7fpUJ5g=
X-Google-Smtp-Source: AGHT+IElCrrkRe4hwT75pzwhZTMPYIUdZ7glJt6yA9xPn9E8GYjecUN2cUo3EXRlfv/KVXK9G2ZkoA==
X-Received: by 2002:a05:6512:39d6:b0:545:a70:74c5 with SMTP id 2adb3069b0e04-549abd252a5mr1045694e87.13.1741691802373;
        Tue, 11 Mar 2025 04:16:42 -0700 (PDT)
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
Subject: [RFC PATCH v3 4/7] xen/arm: scmi: introduce SCI SCMI SMC multi-agent driver
Date: Tue, 11 Mar 2025 13:16:15 +0200
Message-Id: <20250311111618.1850927-5-grygorii_strashko@epam.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250311111618.1850927-1-grygorii_strashko@epam.com>
References: <20250311111618.1850927-1-grygorii_strashko@epam.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Oleksii Moisieiev <oleksii_moisieiev@epam.com>

This patch introduces SCI driver to support for ARM EL3 Trusted Firmware-A
(TF-A) which provides SCMI interface with multi-agnet support, as shown
below.

  +-----------------------------------------+
  |                                         |
  | EL3 TF-A SCMI                           |
  +-------+--+-------+--+-------+--+-------++
  |shmem0 |  |shmem1 |  |shmem2 |  |shmemX |
  +-----+-+  +---+---+  +--+----+  +---+---+
smc-id0 |        |         |           |
agent0  |        |         |           |
  +-----v--------+---------+-----------+----+
  |              |         |           |    |
  |              |         |           |    |
  +--------------+---------+-----------+----+
         smc-id1 |  smc-id2|    smc-idX|
         agent1  |  agent2 |    agentX |
                 |         |           |
            +----v---+  +--v-----+  +--v-----+
            |        |  |        |  |        |
            | Dom0   |  | Dom1   |  | DomX   |
            |        |  |        |  |        |
            |        |  |        |  |        |
            +--------+  +--------+  +--------+

The EL3 SCMI multi-agent firmware expected to provide SCMI SMC/HVC shared
memory transport for every Agent in the system.

The SCMI Agent transport channel defined by pair:
 - smc-id: SMC/HVC id used for Doorbell
 - shmem: shared memory for messages transfer, Xen page aligned,
 p2m_mmio_direct_nc.

The follwoing SCMI Agents expected to be defined by SCMI FW to enable SCMI
multi-agent functionality under Xen:
- Xen manegement agent: trusted agents that accesses to the Base Protocol
commands to configure agent specific permissions
- OSPM VM agents: non-trusted agent, one for each Guest domain which is
  allowed direct HW access. At least one OSPM VM agent has to be provided
  by FW if HW is handled only by Dom0 or Driver Domain.

The EL3 SCMI FW expected to implement following Base protocol messages:
- BASE_DISCOVER_AGENT
- BASE_RESET_AGENT_CONFIGURATION (optional)
- BASE_SET_DEVICE_PERMISSIONS (optional)

The SCI SCMI SMC multi-agent driver implements following functionality:
- It's initialized based on the Host DT SCMI node (only one SCMI interface
is supported) which describes Xen management agent SCMI interface.

scmi_shm_0 : sram@47ff0000 {
    compatible = "arm,scmi-shmem";
    reg = <0x0 0x47ff0000 0x0 0x1000>;
};
firmware {
    scmi: scmi {
        compatible = "arm,scmi-smc";
        arm,smc-id = <0x82000002>; // Xen manegement agent smc-id
        \#address-cells = < 1>;
        \#size-cells = < 0>;
        \#access-controller - cells = < 1>;
        shmem = <&scmi_shm_0>; // Xen manegement agent shmem

        protocol@X{
        };
    };
};

- It obtains Xen specific SCMI Agent's configuration from the Host DT,
  probes Agents and build SCMI Agents list. The Agents configuration
  is taken from:

chosen {
  xen,scmi-secondary-agents = <
		1 0x82000003 &scmi_shm_1
		2 0x82000004 &scmi_shm_2
		3 0x82000005 &scmi_shm_3
		4 0x82000006 &scmi_shm_4>;
}

/{
	scmi_shm_1: sram@47ff1000 {
		compatible = "arm,scmi-shmem";
		reg = <0x0 0x47ff1000 0x0 0x1000>;
	};
	scmi_shm_2: sram@47ff2000 {
		compatible = "arm,scmi-shmem";
		reg = <0x0 0x47ff2000 0x0 0x1000>;
	};
	scmi_shm_3: sram@47ff3000 {
		compatible = "arm,scmi-shmem";
		reg = <0x0 0x47ff3000 0x0 0x1000>;
	};
}
  where first item is "agent_id", second - "arm,smc-id", and third - "arm,scmi-shmem" for
  this agent_id.

  Note that Xen is the only one entry in the system which need to know
  about SCMI multi-agent support.

- It implements the SCI subsystem interface required for configuring and
enabling SCMI functionality for Dom0/hwdom and Guest domains. To enable
SCMI functionality for domain it has to be configured with unique supported
SCMI Agent_id and use corresponding SCMI SMC/HVC shared memory transport
[smc-id, shmem] defined for this SCMI Agent_id.
- Once Xen domain is configured it can communicate with EL3 SCMI FW:
  -- zero-copy, the guest domain puts SCMI message in shmem;
  -- the guest triggers SMC/HVC exception with smc-id (doorbell);
  -- the Xen driver catches exception, do checks and synchronously forwards
  it to EL3 FW.
- the Xen driver sends BASE_RESET_AGENT_CONFIGURATION message to Xen
  management agent channel on domain destroy event. This allows to reset
  resources used by domain and so implement use-case like domain reboot.

Dom0 Enable SCMI SMC:
 - pass dom0_scmi_agent_id=<agent_id> in Xen command line option. if not provided
   SCMI will be disabled for Dom0 and all SCMI nodes removed from Dom0 DT.
   The driver updates Dom0 DT SCMI node "arm,smc-id" value and fix up shmem
   node according to assigned agent_id.

Guest domains enable SCMI SMC:
 - xl.cfg: add configuration option as below

   arm_sci = "type=scmi_smc_multiagent,agent_id=2"

 - xl.cfg: enable access to the "arm,scmi-shmem" which should correspond assigned agent_id for
   the domain, for example:

iomem = [
    "47ff2,1@22001",
]

 - DT: add SCMI nodes to the Driver domain partial device tree as in the
 below example. The "arm,smc-id" should correspond assigned agent_id for the domain:

passthrough {
   scmi_shm_0: sram@22001000 {
       compatible = "arm,scmi-shmem";
       reg = <0x0 0x22001000 0x0 0x1000>;
   };

   firmware {
        compatible = "simple-bus";
            scmi: scmi {
                compatible = "arm,scmi-smc";
                arm,smc-id = <0x82000004>;
                shmem = <&scmi_shm_0>;
                ...
            }
    }
}

SCMI "4.2.1.1 Device specific access control"

The XEN SCI SCMI SMC multi-agent driver performs "access-controller" provider function
in case EL3 SCMI FW implements SCMI "4.2.1.1 Device specific access control" and provides the
BASE_SET_DEVICE_PERMISSIONS command to configure the devices that an agents have access to.
The DT SCMI node should "#access-controller-cells=<1>" property and DT devices should be bound
to the Xen SCMI.

&i2c1 {
   access-controllers = <&scmi 0>;
};

The Dom0 and dom0less (TBD) domains DT devices will be processed automatically through
sci_assign_dt_device() call, but to assign SCMI devices from toolstack the xl.cfg:"dtdev" property
shell be used:

dtdev = [
    "/soc/i2c@e6508000",
]

xl.cfg:dtdev will contain all nodes which are under SCMI management (not only those which are behind IOMMU).

TODO:
- dom0less is not fully supported yet
- move memcpy_fro/tomio in separate patch

[1] https://web.git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/devicetree/bindings/firmware/arm,scmi.yaml
[2] https://web.git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/devicetree/bindings/access-controllers/access-controllers.yaml
Signed-off-by: Oleksii Moisieiev <oleksii_moisieiev@epam.com>
Signed-off-by: Grygorii Strashko <grygorii_strashko@epam.com>
---
 docs/man/xl.cfg.5.pod.in                    |  15 +
 docs/misc/xen-command-line.pandoc           |   9 +
 tools/libs/light/libxl_arm.c                |   4 +
 tools/libs/light/libxl_types.idl            |   4 +-
 tools/xl/xl_parse.c                         |  17 +
 xen/arch/arm/domain_build.c                 |   3 +-
 xen/arch/arm/firmware/Kconfig               |  11 +
 xen/arch/arm/firmware/Makefile              |   1 +
 xen/arch/arm/firmware/scmi-proto.h          | 164 ++++
 xen/arch/arm/firmware/scmi-shmem.c          | 172 ++++
 xen/arch/arm/firmware/scmi-shmem.h          |  45 +
 xen/arch/arm/firmware/scmi-smc-multiagent.c | 856 ++++++++++++++++++++
 xen/include/public/arch-arm.h               |   3 +
 13 files changed, 1302 insertions(+), 2 deletions(-)
 create mode 100644 xen/arch/arm/firmware/scmi-proto.h
 create mode 100644 xen/arch/arm/firmware/scmi-shmem.c
 create mode 100644 xen/arch/arm/firmware/scmi-shmem.h
 create mode 100644 xen/arch/arm/firmware/scmi-smc-multiagent.c

diff --git a/docs/man/xl.cfg.5.pod.in b/docs/man/xl.cfg.5.pod.in
index 7edf272386e3..fc6041724a13 100644
--- a/docs/man/xl.cfg.5.pod.in
+++ b/docs/man/xl.cfg.5.pod.in
@@ -3126,6 +3126,21 @@ single SCMI OSPM agent support.
 Should be used together with B<dom0_scmi_smc_passthrough> Xen command line
 option.
 
+=item B<scmi_smc_multiagent>
+
+Enables ARM SCMI SMC multi-agent support for the guest by enabling SCMI over
+SMC calls forwarding from domain to the EL3 firmware (like Trusted Firmware-A)
+with a multi SCMI OSPM agent support. The SCMI B<agent_id> should be
+specified for the guest.
+
+=back
+
+=item B<agent_id=NUMBER>
+
+Specifies a non-zero ARM SCI agent id for the guest. This option is mandatory
+if the SCMI SMC support is enabled for the guest. The agent ids of domains
+existing on a single host must be unique.
+
 =back
 
 =back
diff --git a/docs/misc/xen-command-line.pandoc b/docs/misc/xen-command-line.pandoc
index 8e50f6b7c7ac..bc3c64d6ec90 100644
--- a/docs/misc/xen-command-line.pandoc
+++ b/docs/misc/xen-command-line.pandoc
@@ -1091,6 +1091,15 @@ which serves as Driver domain. The SCMI will be disabled for Dom0/hwdom and
 SCMI nodes removed from Dom0/hwdom device tree.
 (for example, thin Dom0 with Driver domain use-case).
 
+### dom0_scmi_agent_id (ARM)
+> `= <integer>`
+
+The option is available when `CONFIG_SCMI_SMC_MA` is compiled in, and allows to
+enable SCMI functionality for Dom0 by specifying a non-zero ARM SCMI agent id.
+The SCMI will be disabled for Dom0 if this option is not specified
+(for example, thin Dom0 or dom0less use-cases).
+The agent ids of domains existing on a single host must be unique.
+
 ### dtuart (ARM)
 > `= path [:options]`
 
diff --git a/tools/libs/light/libxl_arm.c b/tools/libs/light/libxl_arm.c
index d41adea1cefd..cdf5edb299af 100644
--- a/tools/libs/light/libxl_arm.c
+++ b/tools/libs/light/libxl_arm.c
@@ -229,6 +229,10 @@ int libxl__arch_domain_prepare_config(libxl__gc *gc,
     case LIBXL_ARM_SCI_TYPE_SCMI_SMC:
         config->arch.arm_sci_type = XEN_DOMCTL_CONFIG_ARM_SCI_SCMI_SMC;
         break;
+    case LIBXL_ARM_SCI_TYPE_SCMI_SMC_MULTIAGENT:
+        config->arch.arm_sci_type = XEN_DOMCTL_CONFIG_ARM_SCI_SCMI_SMC_MA;
+        config->arch.arm_sci_agent_id = d_config->b_info.arm_sci.agent_id;
+        break;
     default:
         LOG(ERROR, "Unknown ARM_SCI type %d",
             d_config->b_info.arm_sci.type);
diff --git a/tools/libs/light/libxl_types.idl b/tools/libs/light/libxl_types.idl
index ea0d30654cdd..e6707c7ca9e7 100644
--- a/tools/libs/light/libxl_types.idl
+++ b/tools/libs/light/libxl_types.idl
@@ -553,11 +553,13 @@ libxl_sve_type = Enumeration("sve_type", [
 
 libxl_arm_sci_type = Enumeration("arm_sci_type", [
     (0, "none"),
-    (1, "scmi_smc")
+    (1, "scmi_smc"),
+    (2, "scmi_smc_multiagent")
     ], init_val = "LIBXL_ARM_SCI_TYPE_NONE")
 
 libxl_arm_sci = Struct("arm_sci", [
     ("type", libxl_arm_sci_type),
+    ("agent_id", uint8)
     ])
 
 libxl_rdm_reserve = Struct("rdm_reserve", [
diff --git a/tools/xl/xl_parse.c b/tools/xl/xl_parse.c
index ac9bf0b25c5a..011222ec55b9 100644
--- a/tools/xl/xl_parse.c
+++ b/tools/xl/xl_parse.c
@@ -1290,6 +1290,7 @@ static int parse_arm_sci_config(XLU_Config *cfg, libxl_arm_sci *arm_sci,
     enum {
         STATE_OPTION,
         STATE_TYPE,
+        STATE_AGENT_ID,
         STATE_TERMINAL,
     };
     int ret, state = STATE_OPTION;
@@ -1305,6 +1306,8 @@ static int parse_arm_sci_config(XLU_Config *cfg, libxl_arm_sci *arm_sci,
                 *ptr = '\0';
                 if (!strcmp(tok, "type")) {
                     state = STATE_TYPE;
+                } else if (!strcmp(tok, "agent_id")) {
+                    state = STATE_AGENT_ID;
                 } else {
                     fprintf(stderr, "Unknown ARM_SCI option: %s\n", tok);
                     goto parse_error;
@@ -1324,11 +1327,24 @@ static int parse_arm_sci_config(XLU_Config *cfg, libxl_arm_sci *arm_sci,
                 tok = ptr + 1;
             }
             break;
+        case STATE_AGENT_ID:
+            if (*ptr == ',' || *ptr == '\0') {
+                state = *ptr == ',' ? STATE_OPTION : STATE_TERMINAL;
+                *ptr = '\0';
+                arm_sci->agent_id = strtoul(tok, NULL, 0);
+                tok = ptr + 1;
+            }
         default:
             break;
         }
     }
 
+    if (arm_sci->type == LIBXL_ARM_SCI_TYPE_SCMI_SMC_MULTIAGENT &&
+        arm_sci->agent_id == 0) {
+        fprintf(stderr, "A non-zero ARM_SCI agent_id must be specified\n");
+        goto parse_error;
+    }
+
     if (tok != ptr || state != STATE_TERMINAL)
         goto parse_error;
 
@@ -3042,6 +3058,7 @@ skip_usbdev:
         libxl_arm_sci arm_sci = { 0 };
         if (!parse_arm_sci_config(config, &arm_sci, buf)) {
             b_info->arm_sci.type = arm_sci.type;
+            b_info->arm_sci.agent_id = arm_sci.agent_id;
         } else {
             exit(EXIT_FAILURE);
         }
diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index 36d28b52a418..9238771a4aac 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -616,7 +616,8 @@ static int __init write_properties(struct domain *d, struct kernel_info *kinfo,
                  dt_property_name_is_equal(prop, "linux,uefi-mmap-start") ||
                  dt_property_name_is_equal(prop, "linux,uefi-mmap-size") ||
                  dt_property_name_is_equal(prop, "linux,uefi-mmap-desc-size") ||
-                 dt_property_name_is_equal(prop, "linux,uefi-mmap-desc-ver"))
+                 dt_property_name_is_equal(prop, "linux,uefi-mmap-desc-ver") ||
+                 dt_property_name_is_equal(prop, "xen,scmi-secondary-agents"))
                 continue;
 
             if ( dt_property_name_is_equal(prop, "xen,dom0-bootargs") )
diff --git a/xen/arch/arm/firmware/Kconfig b/xen/arch/arm/firmware/Kconfig
index 2686ba313898..63fc5eac8d52 100644
--- a/xen/arch/arm/firmware/Kconfig
+++ b/xen/arch/arm/firmware/Kconfig
@@ -29,6 +29,17 @@ config SCMI_SMC
 	  driver domain.
 	  Use with EL3 firmware which supports only single SCMI OSPM agent.
 
+config SCMI_SMC_MA
+	bool "Enable ARM SCMI SMC multi-agent driver"
+	select ARM_SCI
+	help
+	  Enables SCMI SMC/HVC multi-agent in XEN to pass SCMI requests from Domains
+	  to EL3 firmware (TF-A) which supports multi-agent feature.
+	  This feature allows to enable SCMI per Domain using unique SCMI agent_id,
+	  so Domain is identified by EL3 firmware as an SCMI Agent and can access
+	  allowed platform resources through dedicated SMC/HVC Shared memory based
+	  transport.
+
 endchoice
 
 endmenu
diff --git a/xen/arch/arm/firmware/Makefile b/xen/arch/arm/firmware/Makefile
index 71bdefc24afb..37927e690e98 100644
--- a/xen/arch/arm/firmware/Makefile
+++ b/xen/arch/arm/firmware/Makefile
@@ -1,2 +1,3 @@
 obj-$(CONFIG_ARM_SCI) += sci.o
 obj-$(CONFIG_SCMI_SMC) += scmi-smc.o
+obj-$(CONFIG_SCMI_SMC_MA) += scmi-shmem.o scmi-smc-multiagent.o
diff --git a/xen/arch/arm/firmware/scmi-proto.h b/xen/arch/arm/firmware/scmi-proto.h
new file mode 100644
index 000000000000..3f4b9c5d6b7c
--- /dev/null
+++ b/xen/arch/arm/firmware/scmi-proto.h
@@ -0,0 +1,164 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Arm System Control and Management Interface definitions
+ * Version 3.0 (DEN0056C)
+ *
+ * Copyright (c) 2024 EPAM Systems
+ */
+
+#ifndef XEN_ARCH_ARM_SCI_SCMI_PROTO_H_
+#define XEN_ARCH_ARM_SCI_SCMI_PROTO_H_
+
+#include <xen/stdint.h>
+
+#define SCMI_SHORT_NAME_MAX_SIZE 16
+
+/* SCMI status codes. See section 4.1.4 */
+#define SCMI_SUCCESS              0
+#define SCMI_NOT_SUPPORTED      (-1)
+#define SCMI_INVALID_PARAMETERS (-2)
+#define SCMI_DENIED             (-3)
+#define SCMI_NOT_FOUND          (-4)
+#define SCMI_OUT_OF_RANGE       (-5)
+#define SCMI_BUSY               (-6)
+#define SCMI_COMMS_ERROR        (-7)
+#define SCMI_GENERIC_ERROR      (-8)
+#define SCMI_HARDWARE_ERROR     (-9)
+#define SCMI_PROTOCOL_ERROR     (-10)
+
+/* Protocol IDs */
+#define SCMI_BASE_PROTOCOL 0x10
+
+/* Base protocol message IDs */
+#define SCMI_BASE_PROTOCOL_VERSION            0x0
+#define SCMI_BASE_PROTOCOL_ATTIBUTES          0x1
+#define SCMI_BASE_PROTOCOL_MESSAGE_ATTRIBUTES 0x2
+#define SCMI_BASE_DISCOVER_AGENT              0x7
+#define SCMI_BASE_SET_DEVICE_PERMISSIONS      0x9
+#define SCMI_BASE_RESET_AGENT_CONFIGURATION   0xB
+
+typedef struct scmi_msg_header {
+    uint8_t id;
+    uint8_t type;
+    uint8_t protocol;
+    uint32_t status;
+} scmi_msg_header_t;
+
+/* Table 2 Message header format */
+#define SCMI_HDR_ID    GENMASK(7, 0)
+#define SCMI_HDR_TYPE  GENMASK(9, 8)
+#define SCMI_HDR_PROTO GENMASK(17, 10)
+
+#define SCMI_FIELD_GET(_mask, _reg)                                            \
+    ((typeof(_mask))(((_reg) & (_mask)) >> (ffs64(_mask) - 1)))
+#define SCMI_FIELD_PREP(_mask, _val)                                           \
+    (((typeof(_mask))(_val) << (ffs64(_mask) - 1)) & (_mask))
+
+static inline uint32_t pack_scmi_header(scmi_msg_header_t *hdr)
+{
+    return SCMI_FIELD_PREP(SCMI_HDR_ID, hdr->id) |
+           SCMI_FIELD_PREP(SCMI_HDR_TYPE, hdr->type) |
+           SCMI_FIELD_PREP(SCMI_HDR_PROTO, hdr->protocol);
+}
+
+static inline void unpack_scmi_header(uint32_t msg_hdr, scmi_msg_header_t *hdr)
+{
+    hdr->id = SCMI_FIELD_GET(SCMI_HDR_ID, msg_hdr);
+    hdr->type = SCMI_FIELD_GET(SCMI_HDR_TYPE, msg_hdr);
+    hdr->protocol = SCMI_FIELD_GET(SCMI_HDR_PROTO, msg_hdr);
+}
+
+static inline int scmi_to_xen_errno(int scmi_status)
+{
+    if ( scmi_status == SCMI_SUCCESS )
+        return 0;
+
+    switch ( scmi_status )
+    {
+    case SCMI_NOT_SUPPORTED:
+        return -EOPNOTSUPP;
+    case SCMI_INVALID_PARAMETERS:
+        return -EINVAL;
+    case SCMI_DENIED:
+        return -EACCES;
+    case SCMI_NOT_FOUND:
+        return -ENOENT;
+    case SCMI_OUT_OF_RANGE:
+        return -ERANGE;
+    case SCMI_BUSY:
+        return -EBUSY;
+    case SCMI_COMMS_ERROR:
+        return -ENOTCONN;
+    case SCMI_GENERIC_ERROR:
+        return -EIO;
+    case SCMI_HARDWARE_ERROR:
+        return -ENXIO;
+    case SCMI_PROTOCOL_ERROR:
+        return -EBADMSG;
+    default:
+        return -EINVAL;
+    }
+}
+
+/* PROTOCOL_VERSION */
+#define SCMI_VERSION_MINOR GENMASK(15, 0)
+#define SCMI_VERSION_MAJOR GENMASK(31, 16)
+
+struct scmi_msg_prot_version_p2a {
+    uint32_t version;
+} __packed;
+
+/* BASE PROTOCOL_ATTRIBUTES */
+#define SCMI_BASE_ATTR_NUM_PROTO GENMASK(7, 0)
+#define SCMI_BASE_ATTR_NUM_AGENT GENMASK(15, 8)
+
+struct scmi_msg_base_attributes_p2a {
+    uint32_t attributes;
+} __packed;
+
+/*
+ * BASE_DISCOVER_AGENT
+ */
+#define SCMI_BASE_AGENT_ID_OWN 0xFFFFFFFF
+
+struct scmi_msg_base_discover_agent_a2p {
+    uint32_t agent_id;
+} __packed;
+
+struct scmi_msg_base_discover_agent_p2a {
+    uint32_t agent_id;
+    char name[SCMI_SHORT_NAME_MAX_SIZE];
+} __packed;
+
+/*
+ * BASE_SET_DEVICE_PERMISSIONS
+ */
+#define SCMI_BASE_DEVICE_ACCESS_ALLOW           BIT(0, UL)
+
+struct scmi_msg_base_set_device_permissions_a2p {
+    uint32_t agent_id;
+    uint32_t device_id;
+    uint32_t flags;
+} __packed;
+
+/*
+ * BASE_RESET_AGENT_CONFIGURATION
+ */
+#define SCMI_BASE_AGENT_PERMISSIONS_RESET       BIT(0, UL)
+
+struct scmi_msg_base_reset_agent_cfg_a2p {
+    uint32_t agent_id;
+    uint32_t flags;
+} __packed;
+
+#endif /* XEN_ARCH_ARM_SCI_SCMI_PROTO_H_ */
+
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: "BSD"
+ * c-basic-offset: 4
+ * tab-width: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
diff --git a/xen/arch/arm/firmware/scmi-shmem.c b/xen/arch/arm/firmware/scmi-shmem.c
new file mode 100644
index 000000000000..3815c15bed80
--- /dev/null
+++ b/xen/arch/arm/firmware/scmi-shmem.c
@@ -0,0 +1,172 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * SCI SCMI multi-agent driver, using SMC/HVC shmem as transport.
+ *
+ * Oleksii Moisieiev <oleksii_moisieiev@epam.com>
+ * Copyright (c) 2025 EPAM Systems
+ */
+/* SPDX-License-Identifier: GPL-2.0-only */
+
+#include <asm/io.h>
+#include <xen/err.h>
+
+#include "scmi-proto.h"
+#include "scmi-shmem.h"
+
+/*
+ * Copy data from IO memory space to "real" memory space.
+ */
+static void __memcpy_fromio(void *to, const volatile void __iomem *from,
+                            size_t count)
+{
+    while ( count && !IS_ALIGNED((unsigned long)from, 4) )
+    {
+        *(u8 *)to = readb_relaxed(from);
+        from++;
+        to++;
+        count--;
+    }
+
+    while ( count >= 4 )
+    {
+        *(u32 *)to = readl_relaxed(from);
+        from += 4;
+        to += 4;
+        count -= 4;
+    }
+
+    while ( count )
+    {
+        *(u8 *)to = readb_relaxed(from);
+        from++;
+        to++;
+        count--;
+    }
+}
+
+/*
+ * Copy data from "real" memory space to IO memory space.
+ */
+static void __memcpy_toio(volatile void __iomem *to, const void *from,
+                          size_t count)
+{
+    while ( count && !IS_ALIGNED((unsigned long)to, 4) )
+    {
+        writeb_relaxed(*(u8 *)from, to);
+        from++;
+        to++;
+        count--;
+    }
+
+    while ( count >= 4 )
+    {
+        writel_relaxed(*(u32 *)from, to);
+        from += 4;
+        to += 4;
+        count -= 4;
+    }
+
+    while ( count )
+    {
+        writeb_relaxed(*(u8 *)from, to);
+        from++;
+        to++;
+        count--;
+    }
+}
+
+static inline int
+shmem_channel_is_free(const volatile struct scmi_shared_mem __iomem *shmem)
+{
+    return (readl(&shmem->channel_status) &
+            SCMI_SHMEM_CHAN_STAT_CHANNEL_FREE) ? 0 : -EBUSY;
+}
+
+int shmem_put_message(volatile struct scmi_shared_mem __iomem *shmem,
+                      scmi_msg_header_t *hdr, void *data, int len)
+{
+    int ret;
+
+    if ( (len + sizeof(shmem->msg_header)) > SCMI_SHMEM_MAPPED_SIZE )
+    {
+        printk(XENLOG_ERR "scmi: Wrong size of smc message. Data is invalid\n");
+        return -EINVAL;
+    }
+
+    ret = shmem_channel_is_free(shmem);
+    if ( ret )
+        return ret;
+
+    writel_relaxed(0x0, &shmem->channel_status);
+    /* Writing 0x0 right now, but "shmem"_FLAG_INTR_ENABLED can be set */
+    writel_relaxed(0x0, &shmem->flags);
+    writel_relaxed(sizeof(shmem->msg_header) + len, &shmem->length);
+    writel(pack_scmi_header(hdr), &shmem->msg_header);
+
+    if ( len > 0 && data )
+        __memcpy_toio(shmem->msg_payload, data, len);
+
+    return 0;
+}
+
+int shmem_get_response(const volatile struct scmi_shared_mem __iomem *shmem,
+                            scmi_msg_header_t *hdr, void *data, int len)
+{
+    int recv_len;
+    int ret;
+    int pad = sizeof(hdr->status);
+
+    if ( len >= SCMI_SHMEM_MAPPED_SIZE - sizeof(shmem) )
+    {
+        printk(XENLOG_ERR
+               "scmi: Wrong size of input smc message. Data may be invalid\n");
+        return -EINVAL;
+    }
+
+    ret = shmem_channel_is_free(shmem);
+    if ( ret )
+        return ret;
+
+    recv_len = readl(&shmem->length) - sizeof(shmem->msg_header);
+
+    if ( recv_len < 0 )
+    {
+        printk(XENLOG_ERR
+               "scmi: Wrong size of smc message. Data may be invalid\n");
+        return -EINVAL;
+    }
+
+    unpack_scmi_header(readl(&shmem->msg_header), hdr);
+
+    hdr->status = readl(&shmem->msg_payload);
+    recv_len = recv_len > pad ? recv_len - pad : 0;
+
+    ret = scmi_to_xen_errno(hdr->status);
+    if ( ret ) {
+        printk(XENLOG_DEBUG "scmi: Error received: %d\n", ret);
+        return ret;
+    }
+
+    if ( recv_len > len )
+    {
+        printk(XENLOG_ERR
+               "scmi: Not enough buffer for message %d, expecting %d\n",
+               recv_len, len);
+        return -EINVAL;
+    }
+
+    if ( recv_len > 0 )
+        __memcpy_fromio(data, shmem->msg_payload + pad, recv_len);
+
+    return 0;
+}
+
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: "BSD"
+ * c-basic-offset: 4
+ * tab-width: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
diff --git a/xen/arch/arm/firmware/scmi-shmem.h b/xen/arch/arm/firmware/scmi-shmem.h
new file mode 100644
index 000000000000..f19e90786824
--- /dev/null
+++ b/xen/arch/arm/firmware/scmi-shmem.h
@@ -0,0 +1,45 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Arm System Control and Management Interface definitions
+ * Version 3.0 (DEN0056C)
+ * Shared Memory based Transport
+ *
+ * Copyright (c) 2024 EPAM Systems
+ */
+
+#ifndef XEN_ARCH_ARM_SCI_SCMI_SHMEM_H_
+#define XEN_ARCH_ARM_SCI_SCMI_SHMEM_H_
+
+#include <xen/stdint.h>
+
+#define SCMI_SHMEM_CHAN_STAT_CHANNEL_FREE  BIT(0, UL)
+#define SCMI_SHMEM_CHAN_STAT_CHANNEL_ERROR BIT(1, UL)
+
+struct scmi_shared_mem {
+    uint32_t reserved;
+    uint32_t channel_status;
+    uint32_t reserved1[2];
+    uint32_t flags;
+    uint32_t length;
+    uint32_t msg_header;
+    uint8_t msg_payload[];
+};
+
+#define SCMI_SHMEM_MAPPED_SIZE PAGE_SIZE
+
+int shmem_put_message(volatile struct scmi_shared_mem __iomem *shmem,
+                      scmi_msg_header_t *hdr, void *data, int len);
+
+int shmem_get_response(const volatile struct scmi_shared_mem __iomem *shmem,
+                            scmi_msg_header_t *hdr, void *data, int len);
+#endif /* XEN_ARCH_ARM_SCI_SCMI_SHMEM_H_ */
+
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: "BSD"
+ * c-basic-offset: 4
+ * tab-width: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
diff --git a/xen/arch/arm/firmware/scmi-smc-multiagent.c b/xen/arch/arm/firmware/scmi-smc-multiagent.c
new file mode 100644
index 000000000000..293fb30fa6c5
--- /dev/null
+++ b/xen/arch/arm/firmware/scmi-smc-multiagent.c
@@ -0,0 +1,856 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * SCI SCMI multi-agent driver, using SMC/HVC shmem as transport.
+ *
+ * Oleksii Moisieiev <oleksii_moisieiev@epam.com>
+ * Copyright (c) 2025 EPAM Systems
+ */
+
+#include <xen/acpi.h>
+
+#include <xen/device_tree.h>
+#include <xen/init.h>
+#include <xen/iocap.h>
+#include <xen/err.h>
+#include <xen/libfdt/libfdt.h>
+#include <xen/param.h>
+#include <xen/sched.h>
+#include <xen/vmap.h>
+
+#include <asm/firmware/sci.h>
+#include <asm/smccc.h>
+
+#include "scmi-proto.h"
+#include "scmi-shmem.h"
+
+#define SCMI_AGENT_ID_INVALID 0xFF
+
+static uint8_t __initdata opt_dom0_scmi_agent_id = SCMI_AGENT_ID_INVALID;
+integer_param("dom0_scmi_agent_id", opt_dom0_scmi_agent_id);
+
+#define SCMI_SECONDARY_AGENTS  "xen,scmi-secondary-agents"
+
+#define HYP_CHANNEL 0x0
+
+
+struct scmi_channel {
+    uint32_t agent_id;
+    uint32_t func_id;
+    domid_t domain_id;
+    uint64_t paddr;
+    uint64_t len;
+    struct scmi_shared_mem __iomem *shmem;
+    spinlock_t lock;
+    struct list_head list;
+};
+
+struct scmi_data {
+    struct list_head channel_list;
+    spinlock_t channel_list_lock;
+    uint32_t func_id;
+    bool initialized;
+    uint32_t shmem_phandle;
+    struct dt_device_node *dt_dev;
+};
+
+static struct scmi_data scmi_data;
+
+static int send_smc_message(struct scmi_channel *chan_info,
+                            scmi_msg_header_t *hdr, void *data, int len)
+{
+    struct arm_smccc_res resp;
+    int ret;
+
+    ret = shmem_put_message(chan_info->shmem, hdr, data, len);
+    if ( ret )
+        return ret;
+
+    arm_smccc_1_1_smc(chan_info->func_id, 0, 0, 0, 0, 0, 0, 0, &resp);
+
+    if ( resp.a0 )
+        return -EOPNOTSUPP;
+
+    return 0;
+}
+
+static int do_smc_xfer(struct scmi_channel *chan_info, scmi_msg_header_t *hdr,
+                       void *tx_data, int tx_size, void *rx_data, int rx_size)
+{
+    int ret = 0;
+
+    ASSERT(chan_info && chan_info->shmem);
+
+    if ( !hdr )
+        return -EINVAL;
+
+    spin_lock(&chan_info->lock);
+
+    printk(XENLOG_DEBUG
+           "scmi: agent_id = %d msg_id = %x type = %d, proto = %x\n",
+           chan_info->agent_id, hdr->id, hdr->type, hdr->protocol);
+
+    ret = send_smc_message(chan_info, hdr, tx_data, tx_size);
+    if ( ret )
+        goto clean;
+
+    ret = shmem_get_response(chan_info->shmem, hdr, rx_data, rx_size);
+
+clean:
+    printk(XENLOG_DEBUG
+           "scmi: get smc response agent_id = %d msg_id = %x proto = %x res=%d\n",
+           chan_info->agent_id, hdr->id, hdr->protocol, ret);
+
+    spin_unlock(&chan_info->lock);
+
+    return ret;
+}
+
+static struct scmi_channel *get_channel_by_id(uint32_t agent_id)
+{
+    struct scmi_channel *curr;
+    bool found = false;
+
+    spin_lock(&scmi_data.channel_list_lock);
+    list_for_each_entry(curr, &scmi_data.channel_list, list)
+    {
+        if ( curr->agent_id == agent_id )
+        {
+            found = true;
+            break;
+        }
+    }
+
+    spin_unlock(&scmi_data.channel_list_lock);
+    if ( found )
+        return curr;
+
+    return NULL;
+}
+
+static struct scmi_channel *aquire_scmi_channel(struct domain *d,
+                                                uint32_t agent_id)
+{
+    struct scmi_channel *curr;
+    struct scmi_channel *ret = ERR_PTR(-ENOENT);
+
+    spin_lock(&scmi_data.channel_list_lock);
+    list_for_each_entry(curr, &scmi_data.channel_list, list)
+    {
+        if ( curr->agent_id == agent_id )
+        {
+            if ( curr->domain_id != DOMID_INVALID )
+            {
+                ret = ERR_PTR(-EEXIST);
+                break;
+            }
+
+            curr->domain_id = d->domain_id;
+            ret = curr;
+            break;
+        }
+    }
+
+    spin_unlock(&scmi_data.channel_list_lock);
+
+    return ret;
+}
+
+static void relinquish_scmi_channel(struct scmi_channel *channel)
+{
+    ASSERT(channel != NULL);
+
+    spin_lock(&scmi_data.channel_list_lock);
+    channel->domain_id = DOMID_INVALID;
+    spin_unlock(&scmi_data.channel_list_lock);
+}
+
+static int map_channel_memory(struct scmi_channel *channel)
+{
+    ASSERT( channel && channel->paddr );
+    channel->shmem = ioremap_nocache(channel->paddr, SCMI_SHMEM_MAPPED_SIZE);
+    if ( !channel->shmem )
+        return -ENOMEM;
+
+    channel->shmem->channel_status = SCMI_SHMEM_CHAN_STAT_CHANNEL_FREE;
+    printk(XENLOG_DEBUG "scmi: Got shmem %lx after vmap %p\n", channel->paddr,
+           channel->shmem);
+
+    return 0;
+}
+
+static void unmap_channel_memory(struct scmi_channel *channel)
+{
+    ASSERT( channel && channel->shmem );
+    iounmap(channel->shmem);
+    channel->shmem = NULL;
+}
+
+static struct scmi_channel *smc_create_channel(uint32_t agent_id,
+                                               uint32_t func_id, uint64_t addr)
+{
+    struct scmi_channel *channel;
+
+    channel = get_channel_by_id(agent_id);
+    if ( channel )
+        return ERR_PTR(EEXIST);
+
+    channel = xmalloc(struct scmi_channel);
+    if ( !channel )
+        return ERR_PTR(ENOMEM);
+
+    spin_lock_init(&channel->lock);
+    channel->agent_id = agent_id;
+    channel->func_id = func_id;
+    channel->domain_id = DOMID_INVALID;
+    channel->shmem = NULL;
+    channel->paddr = addr;
+    list_add_tail(&channel->list, &scmi_data.channel_list);
+    return channel;
+}
+
+static void free_channel_list(void)
+{
+    struct scmi_channel *curr, *_curr;
+
+    list_for_each_entry_safe (curr, _curr, &scmi_data.channel_list, list)
+    {
+        list_del(&curr->list);
+        xfree(curr);
+    }
+}
+
+static int scmi_dt_read_hyp_channel_addr(struct dt_device_node *scmi_node,
+                                         u64 *addr, u64 *size)
+{
+    struct dt_device_node *shmem_node;
+    const __be32 *prop;
+
+    prop = dt_get_property(scmi_node, "shmem", NULL);
+    if ( !prop )
+        return -EINVAL;
+
+    shmem_node = dt_find_node_by_phandle(be32_to_cpup(prop));
+    if ( IS_ERR_OR_NULL(shmem_node) )
+    {
+        printk(XENLOG_ERR
+               "scmi: Device tree error, can't parse reserved memory %ld\n",
+               PTR_ERR(shmem_node));
+        return PTR_ERR(shmem_node);
+    }
+
+    return dt_device_get_address(shmem_node, 0, addr, size);
+}
+
+/*
+ * Handle Dom0 SCMI specific DT nodes
+ *
+ * Make a decision on copying SCMI specific nodes into Dom0 device tree.
+ * For SCMI multi-agent case:
+ * - shmem nodes will not be copied and generated instead if SCMI
+ *   is enabled for Dom0
+ * - scmi node will be copied if SCMI is enabled for Dom0
+ */
+static bool scmi_dt_handle_node(struct domain *d, struct dt_device_node *node)
+{
+    static const struct dt_device_match skip_matches[] __initconst = {
+        DT_MATCH_COMPATIBLE("arm,scmi-shmem"),
+        { /* sentinel */ },
+    };
+    static const struct dt_device_match scmi_matches[] __initconst = {
+        DT_MATCH_PATH("/firmware/scmi"),
+        { /* sentinel */ },
+    };
+
+    if ( !scmi_data.initialized )
+        return false;
+
+    /* always drop shmem */
+    if ( dt_match_node(skip_matches, node) )
+    {
+        dt_dprintk("  Skip scmi shmem\n");
+        return true;
+    }
+
+    /* drop scmi if not enabled */
+    if ( dt_match_node(scmi_matches, node) && !sci_domain_is_enabled(d) )
+    {
+        dt_dprintk("  Skip scmi node\n");
+        return true;
+    }
+
+    return false;
+}
+
+/*
+ * Finalize Dom0 SCMI specific DT nodes
+ *
+ * if SCMI is enabled for Dom0:
+ * - generate shmem node
+ * - map SCMI shmem MMIO into Dom0
+ */
+static int scmi_dt_finalize(struct domain *d, void *fdt)
+{
+    __be32 reg[GUEST_ROOT_ADDRESS_CELLS + GUEST_ROOT_SIZE_CELLS];
+    struct scmi_channel *channel;
+    int nodeoffset;
+    __be32 *cells;
+    __be32 val;
+    char buf[64];
+    int res, rc;
+
+    if ( !sci_domain_is_enabled(d) )
+        return 0;
+
+    channel = d->arch.sci_data;
+
+    /*
+     * Replace "arm,smc-id" with proper value assigned for Dom0 SCMI channel
+     */
+    nodeoffset = fdt_node_offset_by_compatible(fdt, -1, "arm,scmi-smc");
+    if ( nodeoffset < 0 )
+        return -ENODEV;
+
+    cells = (__be32 *)&val;
+    dt_set_cell(&cells, 1, channel->func_id);
+    res = fdt_setprop_inplace(fdt, nodeoffset, "arm,smc-id", &val, sizeof(val));
+    if ( res )
+        return -EINVAL;
+
+    /*
+     * All SCMI shmem nodes should be removed from Dom0 DT at this point, so
+     * the shmem node for Dom0 need to be generated from SCMI channel assigned
+     * to Dom0.
+     * The original SCMI shmem node from platform DT is used by Xen SCMI driver
+     * itself as privileged channel (agent_id=0) to manage other SCMI
+     * agents (domains).
+     */
+    snprintf(buf, sizeof(buf), "scmi-shmem@%lx", channel->paddr);
+
+    res = fdt_begin_node(fdt, buf);
+    if ( res )
+        return res;
+
+    res = fdt_property_string(fdt, "compatible", "arm,scmi-shmem");
+    if ( res )
+        return res;
+
+    cells = &reg[0];
+
+    dt_child_set_range(&cells, GUEST_ROOT_ADDRESS_CELLS, GUEST_ROOT_SIZE_CELLS,
+                       channel->paddr, SCMI_SHMEM_MAPPED_SIZE);
+
+    res = fdt_property(fdt, "reg", reg, sizeof(reg));
+    if ( res )
+        return res;
+
+    res = fdt_property_cell(fdt, "phandle", scmi_data.shmem_phandle);
+    if ( res )
+        return res;
+
+    res = fdt_end_node(fdt);
+    if ( res )
+        return res;
+
+    /*
+     * Map SCMI shmem into Dom0 here as shmem nodes are excluded from
+     * generic Dom0 DT processing
+     */
+    res = iomem_permit_access(d, paddr_to_pfn(channel->paddr),
+                              paddr_to_pfn(channel->paddr +
+                                           SCMI_SHMEM_MAPPED_SIZE - 1));
+    if ( res )
+        return res;
+
+    res = map_regions_p2mt(d, gaddr_to_gfn(channel->paddr),
+                           PFN_UP(SCMI_SHMEM_MAPPED_SIZE),
+                           maddr_to_mfn(channel->paddr), p2m_mmio_direct_nc);
+    if ( res )
+    {
+        rc = iomem_deny_access(d, paddr_to_pfn(channel->paddr),
+                               paddr_to_pfn(channel->paddr +
+                                            SCMI_SHMEM_MAPPED_SIZE - 1));
+        if ( rc )
+            printk(XENLOG_ERR "scmi: Unable to deny iomem access , err = %d\n",
+                   rc);
+    }
+
+    return res;
+}
+
+static int scmi_assign_device(uint32_t agent_id, uint32_t device_id,
+                              uint32_t flags)
+{
+    struct scmi_msg_base_set_device_permissions_a2p tx;
+    struct scmi_channel *channel;
+    scmi_msg_header_t hdr;
+    int ret;
+
+    channel = get_channel_by_id(HYP_CHANNEL);
+    if ( !channel )
+        return -EINVAL;
+
+    hdr.id = SCMI_BASE_SET_DEVICE_PERMISSIONS;
+    hdr.type = 0;
+    hdr.protocol = SCMI_BASE_PROTOCOL;
+
+    tx.agent_id = agent_id;
+    tx.device_id = device_id;
+    tx.flags = flags;
+
+    ret = do_smc_xfer(channel, &hdr, &tx, sizeof(tx), NULL, 0);
+    if ( ret == -EOPNOTSUPP )
+        return 0;
+
+    return ret;
+}
+
+static int scmi_dt_assign_device(struct domain *d,
+                                 struct dt_phandle_args *ac_spec)
+{
+    struct scmi_channel *agent_channel;
+    uint32_t scmi_device_id = ac_spec->args[0];
+    int ret;
+
+    if ( !d->arch.sci_data )
+        return 0;
+
+    /* The access-controllers is specified for DT dev, but it's not a SCMI */
+    if ( ac_spec->np != scmi_data.dt_dev )
+        return 0;
+
+    agent_channel = d->arch.sci_data;
+
+    spin_lock(&agent_channel->lock);
+
+    ret = scmi_assign_device(agent_channel->agent_id, scmi_device_id,
+                             SCMI_BASE_DEVICE_ACCESS_ALLOW);
+    if ( ret )
+    {
+        printk(XENLOG_ERR
+               "scmi: could not assign dev for %pd agent:%d dev_id:%u (%d)",
+               d, agent_channel->agent_id, scmi_device_id, ret);
+    }
+
+    spin_unlock(&agent_channel->lock);
+    return ret;
+}
+
+static __init int collect_agents(struct dt_device_node *scmi_node)
+{
+    const struct dt_device_node *chosen_node;
+    const __be32 *prop;
+    u32 len, i;
+
+    chosen_node = dt_find_node_by_path("/chosen");
+    if ( !chosen_node )
+    {
+        printk(XENLOG_ERR "scmi: chosen node not found\n");
+        return -ENOENT;
+    }
+
+    prop = dt_get_property(chosen_node, SCMI_SECONDARY_AGENTS, &len);
+    if ( !prop )
+    {
+        printk(XENLOG_WARNING "scmi: No %s property found\n",
+               SCMI_SECONDARY_AGENTS);
+        return -ENODEV;
+    }
+
+    if ( len % (3 * sizeof(u32)) )
+    {
+        printk(XENLOG_ERR "scmi: Invalid length of %s property: %d\n",
+               SCMI_SECONDARY_AGENTS, len);
+        return -EINVAL;
+    }
+
+    for ( i = 0 ; i < len / (3 * sizeof(u32)) ; i++ )
+    {
+        u32 agent_id = be32_to_cpu(*prop++);
+        u32 smc_id = be32_to_cpu(*prop++);
+        u32 shmem_phandle = be32_to_cpu(*prop++);
+        struct dt_device_node *node = dt_find_node_by_phandle(shmem_phandle);
+        u64 addr, size;
+        int ret;
+
+        if ( !node )
+        {
+            printk(XENLOG_ERR"scmi: Could not find shmem node for agent %d\n",
+                   agent_id);
+            return -EINVAL;
+        }
+
+        ret = dt_device_get_address(node, 0, &addr, &size);
+        if ( ret )
+        {
+            printk(XENLOG_ERR
+                   "scmi: Could not read shmem address for agent %d: %d",
+                   agent_id, ret);
+            return ret;
+        }
+
+        if ( !IS_ALIGNED(size, SCMI_SHMEM_MAPPED_SIZE) )
+        {
+            printk(XENLOG_ERR "scmi: shmem memory is not aligned\n");
+            return -EINVAL;
+        }
+
+        ret = PTR_RET(smc_create_channel(agent_id, smc_id, addr));
+        if ( ret )
+        {
+            printk(XENLOG_ERR "scmi: Could not create channel for agent %d: %d",
+                   agent_id, ret);
+            return ret;
+        }
+
+        printk(XENLOG_DEBUG "scmi: Agent %d SMC %X addr %lx\n", agent_id,
+               smc_id, addr);
+    }
+
+    return 0;
+}
+
+static int scmi_domain_init(struct domain *d,
+                            struct xen_domctl_createdomain *config)
+{
+    struct scmi_channel *channel;
+    int ret;
+
+    if ( !scmi_data.initialized )
+        return 0;
+
+    /*
+     * Special case for Dom0 - the SCMI support is enabled basing on
+     * "dom0_sci_agent_id" Xen command line parameter
+     */
+    if ( is_hardware_domain(d) ) {
+        if ( opt_dom0_scmi_agent_id != SCMI_AGENT_ID_INVALID )
+        {
+            config->arch.arm_sci_type = XEN_DOMCTL_CONFIG_ARM_SCI_SCMI_SMC_MA;
+            config->arch.arm_sci_agent_id = opt_dom0_scmi_agent_id;
+        } else
+            config->arch.arm_sci_type = XEN_DOMCTL_CONFIG_ARM_SCI_NONE;
+    }
+
+    if ( config->arch.arm_sci_type == XEN_DOMCTL_CONFIG_ARM_SCI_NONE )
+        return 0;
+
+    channel = aquire_scmi_channel(d, config->arch.arm_sci_agent_id);
+    if ( IS_ERR(channel) )
+    {
+        printk(XENLOG_ERR"scmi: Failed to acquire SCMI channel for agent_id %u: %ld\n",
+               config->arch.arm_sci_agent_id, PTR_ERR(channel));
+        return PTR_ERR(channel);
+    }
+
+    printk(XENLOG_INFO"scmi: Acquire channel id = 0x%x, domain_id = %d paddr = 0x%lx\n",
+        channel->agent_id, channel->domain_id, channel->paddr);
+
+    /*
+     * Dom0 (if present) needs to have an access to the guest memory range
+     * to satisfy iomem_access_permitted() check in XEN_DOMCTL_iomem_permission
+     * domctl.
+     */
+    if ( hardware_domain && !is_hardware_domain(d) )
+    {
+        ret = iomem_permit_access(hardware_domain, paddr_to_pfn(channel->paddr),
+                                  paddr_to_pfn(channel->paddr + PAGE_SIZE - 1));
+        if ( ret )
+            goto error;
+    }
+
+    d->arch.sci_data = channel;
+    d->arch.sci_enabled = true;
+
+    return 0;
+
+error:
+    relinquish_scmi_channel(channel);
+    return ret;
+}
+
+int scmi_domain_sanitise_config(struct xen_domctl_createdomain *config)
+{
+    if ( config->arch.arm_sci_type != XEN_DOMCTL_CONFIG_ARM_SCI_NONE &&
+         config->arch.arm_sci_type != XEN_DOMCTL_CONFIG_ARM_SCI_SCMI_SMC_MA )
+    {
+        dprintk(XENLOG_INFO, "scmi: Unsupported ARM_SCI type\n");
+        return -EINVAL;
+    }
+    else if ( config->arch.arm_sci_type ==
+              XEN_DOMCTL_CONFIG_ARM_SCI_SCMI_SMC_MA &&
+              config->arch.arm_sci_agent_id == 0 )
+    {
+        dprintk(XENLOG_INFO,
+                "scmi: A zero ARM SCMI agent_id is not supported\n");
+        return -EINVAL;
+    }
+
+    return 0;
+}
+
+static int scmi_relinquish_resources(struct domain *d)
+{
+    int ret;
+    struct scmi_channel *channel, *agent_channel;
+    scmi_msg_header_t hdr;
+    struct scmi_msg_base_reset_agent_cfg_a2p tx;
+
+    if ( !d->arch.sci_data )
+        return 0;
+
+    agent_channel = d->arch.sci_data;
+
+    spin_lock(&agent_channel->lock);
+    tx.agent_id = agent_channel->agent_id;
+    spin_unlock(&agent_channel->lock);
+
+    channel = get_channel_by_id(HYP_CHANNEL);
+    if ( !channel )
+    {
+        printk(XENLOG_ERR
+               "scmi: Unable to get Hypervisor scmi channel for domain %d\n",
+               d->domain_id);
+        return -EINVAL;
+    }
+
+    hdr.id = SCMI_BASE_RESET_AGENT_CONFIGURATION;
+    hdr.type = 0;
+    hdr.protocol = SCMI_BASE_PROTOCOL;
+
+    tx.flags = 0;
+
+    ret = do_smc_xfer(channel, &hdr, &tx, sizeof(tx), NULL, 0);
+    if ( ret == -EOPNOTSUPP )
+        return 0;
+
+    return ret;
+}
+
+static void scmi_domain_destroy(struct domain *d)
+{
+    struct scmi_channel *channel;
+
+    if ( !d->arch.sci_data )
+        return;
+
+    channel = d->arch.sci_data;
+    spin_lock(&channel->lock);
+
+    relinquish_scmi_channel(channel);
+    printk(XENLOG_DEBUG "scmi: Free domain %d\n", d->domain_id);
+
+    d->arch.sci_data = NULL;
+    d->arch.sci_enabled = true;
+
+    spin_unlock(&channel->lock);
+}
+
+static bool scmi_handle_call(struct cpu_user_regs *regs)
+{
+    uint32_t fid = (uint32_t)get_user_reg(regs, 0);
+    struct scmi_channel *agent_channel;
+    struct domain *d = current->domain;
+    struct arm_smccc_res resp;
+    bool res = false;
+
+    if ( !sci_domain_is_enabled(d) )
+        return false;
+
+    agent_channel = d->arch.sci_data;
+    spin_lock(&agent_channel->lock);
+
+    if ( agent_channel->func_id != fid )
+    {
+        res = false;
+        goto unlock;
+    }
+
+    arm_smccc_1_1_smc(fid,
+                      get_user_reg(regs, 1),
+                      get_user_reg(regs, 2),
+                      get_user_reg(regs, 3),
+                      get_user_reg(regs, 4),
+                      get_user_reg(regs, 5),
+                      get_user_reg(regs, 6),
+                      get_user_reg(regs, 7),
+                      &resp);
+
+    set_user_reg(regs, 0, resp.a0);
+    set_user_reg(regs, 1, resp.a1);
+    set_user_reg(regs, 2, resp.a2);
+    set_user_reg(regs, 3, resp.a3);
+    res = true;
+unlock:
+    spin_unlock(&agent_channel->lock);
+
+    return res;
+}
+
+static const struct sci_mediator_ops scmi_ops = {
+    .domain_init = scmi_domain_init,
+    .domain_destroy = scmi_domain_destroy,
+    .relinquish_resources = scmi_relinquish_resources,
+    .handle_call = scmi_handle_call,
+    .dom0_dt_handle_node = scmi_dt_handle_node,
+    .dom0_dt_finalize = scmi_dt_finalize,
+    .domain_sanitise_config = scmi_domain_sanitise_config,
+    .assign_dt_device = scmi_dt_assign_device,
+};
+
+static int __init scmi_check_smccc_ver(void)
+{
+    if ( smccc_ver < ARM_SMCCC_VERSION_1_1 )
+    {
+        printk(XENLOG_WARNING
+               "scmi: No SMCCC 1.1 support, SCMI calls forwarding disabled\n");
+        return -ENOSYS;
+    }
+
+    return 0;
+}
+
+static __init int scmi_probe(struct dt_device_node *scmi_node, const void *data)
+{
+    u64 addr, size;
+    int ret, i;
+    struct scmi_channel *channel, *agent_channel;
+    int n_agents;
+    scmi_msg_header_t hdr;
+    struct scmi_msg_base_attributes_p2a rx;
+
+    ASSERT(scmi_node != NULL);
+
+    INIT_LIST_HEAD(&scmi_data.channel_list);
+    spin_lock_init(&scmi_data.channel_list_lock);
+
+    if ( !acpi_disabled )
+    {
+        printk(XENLOG_WARNING "scmi: is not supported when using ACPI\n");
+        return -EINVAL;
+    }
+
+    ret = scmi_check_smccc_ver();
+    if ( ret )
+        return ret;
+
+    if ( !dt_property_read_u32(scmi_node, "arm,smc-id", &scmi_data.func_id) )
+    {
+        printk(XENLOG_ERR "scmi: unable to read smc-id from DT\n");
+        return -ENOENT;
+    }
+
+    /* save shmem phandle and re-use it fro Dom0 DT shmem node */
+    if ( !dt_property_read_u32(scmi_node, "shmem", &scmi_data.shmem_phandle) )
+    {
+        printk(XENLOG_ERR "scmi: unable to read shmem phandle from DT\n");
+        return -ENOENT;
+    }
+
+    ret = scmi_dt_read_hyp_channel_addr(scmi_node, &addr, &size);
+    if ( IS_ERR_VALUE(ret) )
+        return -ENOENT;
+
+    if ( !IS_ALIGNED(size, SCMI_SHMEM_MAPPED_SIZE) )
+    {
+        printk(XENLOG_ERR "scmi: shmem memory is not aligned\n");
+        return -EINVAL;
+    }
+
+    scmi_data.dt_dev = scmi_node;
+
+    channel = smc_create_channel(HYP_CHANNEL, scmi_data.func_id, addr);
+    if ( IS_ERR(channel) )
+        goto out;
+
+    ret = map_channel_memory(channel);
+    if ( ret )
+        goto out;
+
+    channel->domain_id = DOMID_XEN;
+
+    hdr.id = SCMI_BASE_PROTOCOL_ATTIBUTES;
+    hdr.type = 0;
+    hdr.protocol = SCMI_BASE_PROTOCOL;
+
+    ret = do_smc_xfer(channel, &hdr, NULL, 0, &rx, sizeof(rx));
+    if ( ret )
+        goto error;
+
+    n_agents = SCMI_FIELD_GET(SCMI_BASE_ATTR_NUM_AGENT, rx.attributes);
+    printk(XENLOG_DEBUG "scmi: Got agent count %d\n", n_agents);
+
+    ret = collect_agents(scmi_node);
+    if ( ret )
+        goto error;
+
+    i = 1;
+
+    list_for_each_entry(agent_channel, &scmi_data.channel_list, list)
+    {
+        struct scmi_msg_base_discover_agent_p2a da_rx;
+        struct scmi_msg_base_discover_agent_a2p da_tx;
+
+        ret = map_channel_memory(agent_channel);
+        if ( ret )
+            goto error;
+
+        hdr.id = SCMI_BASE_DISCOVER_AGENT;
+        hdr.type = 0;
+        hdr.protocol = SCMI_BASE_PROTOCOL;
+
+        da_tx.agent_id = agent_channel->agent_id;
+
+        ret = do_smc_xfer(agent_channel, &hdr, &da_tx,
+                          sizeof(da_tx), &da_rx, sizeof(da_rx));
+        if ( agent_channel->domain_id != DOMID_XEN )
+            unmap_channel_memory(agent_channel);
+        if ( ret )
+            goto error;
+
+        printk(XENLOG_DEBUG "id=0x%x name=%s\n",
+               da_rx.agent_id, da_rx.name);
+
+        agent_channel->agent_id = da_rx.agent_id;
+
+        if ( i > n_agents )
+            break;
+
+        i++;
+    }
+
+    ret = sci_register(&scmi_ops);
+    if (ret) {
+        printk(XENLOG_ERR "SCMI: mediator already registered (ret = %d)\n",
+               ret);
+        return ret;
+    }
+
+    scmi_data.initialized = true;
+    goto out;
+
+error:
+    unmap_channel_memory(channel);
+    free_channel_list();
+out:
+    return ret;
+}
+
+static const struct dt_device_match scmi_smc_match[] __initconst = {
+    DT_MATCH_COMPATIBLE("arm,scmi-smc"),
+    { /* sentinel */ },
+};
+
+DT_DEVICE_START(gicv3, "SCMI SMC MEDIATOR", DEVICE_ARM_SCI)
+        .dt_match = scmi_smc_match,
+        .init = scmi_probe,
+DT_DEVICE_END
+
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: "BSD"
+ * c-basic-offset: 4
+ * tab-width: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
diff --git a/xen/include/public/arch-arm.h b/xen/include/public/arch-arm.h
index 095b1a23e30c..30e46de6d7a0 100644
--- a/xen/include/public/arch-arm.h
+++ b/xen/include/public/arch-arm.h
@@ -329,6 +329,7 @@ DEFINE_XEN_GUEST_HANDLE(vcpu_guest_context_t);
 
 #define XEN_DOMCTL_CONFIG_ARM_SCI_NONE      0
 #define XEN_DOMCTL_CONFIG_ARM_SCI_SCMI_SMC  1
+#define XEN_DOMCTL_CONFIG_ARM_SCI_SCMI_SMC_MA  2
 
 struct xen_arch_domainconfig {
     /* IN/OUT */
@@ -355,6 +356,8 @@ struct xen_arch_domainconfig {
     uint32_t clock_frequency;
     /* IN */
     uint8_t arm_sci_type;
+    /* IN */
+    uint8_t arm_sci_agent_id;
 };
 #endif /* __XEN__ || __XEN_TOOLS__ */
 
-- 
2.34.1


