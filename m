Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DD1FAA5BEAD
	for <lists+xen-devel@lfdr.de>; Tue, 11 Mar 2025 12:16:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.907855.1315048 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1trxb9-0006VQ-9G; Tue, 11 Mar 2025 11:16:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 907855.1315048; Tue, 11 Mar 2025 11:16:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1trxb9-0006T0-5r; Tue, 11 Mar 2025 11:16:35 +0000
Received: by outflank-mailman (input) for mailman id 907855;
 Tue, 11 Mar 2025 11:16:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1WQE=V6=gmail.com=gragst.linux@srs-se1.protection.inumbo.net>)
 id 1trxb8-0006Sq-6p
 for xen-devel@lists.xenproject.org; Tue, 11 Mar 2025 11:16:34 +0000
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [2a00:1450:4864:20::22c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 49ea3842-fe6a-11ef-9ab9-95dc52dad729;
 Tue, 11 Mar 2025 12:16:33 +0100 (CET)
Received: by mail-lj1-x22c.google.com with SMTP id
 38308e7fff4ca-30bef9b04adso47322621fa.1
 for <xen-devel@lists.xenproject.org>; Tue, 11 Mar 2025 04:16:33 -0700 (PDT)
Received: from epuakyiw0a98.kyiv.epam.com (ll-74.141.223.85.sovam.net.ua.
 [85.223.141.74]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5498ae45fa8sm1755729e87.52.2025.03.11.04.16.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Mar 2025 04:16:31 -0700 (PDT)
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
X-Inumbo-ID: 49ea3842-fe6a-11ef-9ab9-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741691792; x=1742296592; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=N+6cbmlWt96G4k4CNtgTYC9+E+sNENwDJS4lYdrVj9I=;
        b=RTxksURGtodyePsTffag4o9YamUh+Wm2S4p1nAllmQMIYwRySLU8QA284sWMgpDRwQ
         cxec65UuRJ+7o2JCLPxITtxoe423RkycnOSQ9PugmHFcXpO5+Hv6TJbAMDQYP3Nxyhpw
         WtPEdY1+ReEms0AGF/fcxIP2Ve1MJASVQ0cbYwB9+07ne783G6hM9tAOCi56xWV1fnIp
         nA1RPj0d0jPTATsG8Pr1BVUNBhq02yWqfKsJgFKsk++jRkvSkoQe6I3tXM6TgEn8aNX+
         Uv7Ixo6APMYgKmWT1n8+EniNGStFu1qg3n7FUPg4URUdy42rrq3RZxMcXWRGIjVJZgT5
         xadA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741691792; x=1742296592;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=N+6cbmlWt96G4k4CNtgTYC9+E+sNENwDJS4lYdrVj9I=;
        b=fxBB3AKlmtHOuLd9WKnatBFpSFn1B1Ha9fFejp1xmDxSyHPg2SNFHLWo61j9GgKaIr
         SIXvvbQPPi8gUKltb7YzdtRLHBvxGb8lFl9DOohxXxJsVw29nN7b01/YxHkH4z/35Wbd
         B1zMt6YP3Pmgij3wsCF84q9hxnECmeeNy1MdbDrvoNUbMKvASltipMd2D6ZP/DjN4RiB
         AiUmZ2PL0RGXH3XRJlVOwWVSCQ/yBNc3irv75Xw8QmsFsUlqXBD/0GvvK2mjA/iaaC7R
         FII9mpaAJHmFvVntUaS4pNn4G87FGxPmmsp0kpXSPNuPjipFTh2pVyGiMTCQD6pemHJW
         U7Mw==
X-Gm-Message-State: AOJu0YxDUGMXf9QOXNDSslRgmkZcuUZSu4d2WoyMtmxE+yCNxs6Dt2p2
	fxqC/sA8l/0qWNwnSS08fxWI8CPMQ71r+pgcuX+Oj8NCkHqIZkp7srky26my
X-Gm-Gg: ASbGnctw+kNS9Riguu2Y2iopz2hl/LbWtTbBgjDm2yy0coy8oBBOYyJxAUL2o6twfhG
	CMKG/oqjFSvR3tsHVA24O7UZJq4BSywHxXTRbJXUi4E25LxZeaMTBVlVxcFij37x7lzQbmGX3iU
	Tkrd1MXoKloKJjnaS1bGCagW3WpDjzzTs3ffwVaopInk3UrUWh2UvVItw5j/gZk8jmO8sAB3xze
	FZN/kFOJ8e2k4HsxAP1CziV49TlEMA7fQ2dUQAGJp6/X3PV5Cd4HgetMIwEDh44yuibPEfNtt+K
	KSHqhj5d5HkZPa5IgXgnnlMDcLJXkujLGBlHwDPlcfFQvyAZHbC8qAckVA+/HgoajwEpsiCGURj
	C2lsL4OFCElVNgjB8gxLqWnYTQHo=
X-Google-Smtp-Source: AGHT+IEe27X8S43+QmAn//kF2YBvQ7Td9nd32YZUwH/lFFiOWnbg3afQPaUvFTyERbDyXW6oMYiJYw==
X-Received: by 2002:a05:651c:b0c:b0:30b:c637:fcea with SMTP id 38308e7fff4ca-30c20648a89mr12321621fa.3.1741691791812;
        Tue, 11 Mar 2025 04:16:31 -0700 (PDT)
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
Subject: [RFC PATCH v3 0/7] xen/arm: scmi: introduce SCI SCMI SMC multi-agent support
Date: Tue, 11 Mar 2025 13:16:11 +0200
Message-Id: <20250311111618.1850927-1-grygorii_strashko@epam.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

This is respin of RFCv2 series from Oleksii Moisieiev [1] which was send pretty long time ago (2022),
with the main intention is to resume this discussion in public and gather more opinions.

Hence the code was previously sent long time ago there are pretty high number of changes,
including rebase on newer Xen version 4.20.0-rc2, which already contains some basic SCMI SMC driver
introduced by Andrei Cherechesu, commit 3e322bef8bc0 ("xen/arm: firmware: Add SCMI over SMC calls
handling layer").

Patch 1 "xen/arm: add generic SCI subsystem"
- rebased and refactored
- introduced DEVICE_ARM_SCI DT device class and used for SCI drivers probing instead of custom,
  linker sections based implementation.
- added SCI API for Dom0 DT handling, instead of manipulating with ARM arch dom0 code directly.
- TODO: RFC changes in XEN_DOMCTL_assign_device OP processing

Patch 2 "xen/arm: scmi-smc: update to be used under sci subsystem"
- update driver introduced by commit 3e322bef8bc0 ("xen/arm: firmware: Add SCMI over SMC calls
handling layer") be used under sci subsystem.
- no functional changes in general

Patch 3 "xen/arm: scmi-smc: passthrough SCMI SMC to guest domain
This is new change which allows passthrough SCMI SMC, single agent interface to guest domain
cover use case "thin Dom0 with guest domain, which serves as Driver domain".
See patch commit message for full description.

Patch 4 - xen/arm: scmi: introduce SCI SCMI SMC multi-agent driver
- added "xen,scmi-secondary-agents" property in "chosen" to inform SCI SCMI multi-agent driver
  about available agents and their configuration. It defines <agent_id> to <smc-id,scmi_shm> map.
  This option is Xen specific as Xen is the only one entry in the system which need to know
  about SCMI multi-agent support and configuration.
- each guest using SCMI should be configured with SCMI agent_id, so SCMI
  FW can implement Agent-specific permission policy.
  -- dom0: dom0_scmi_agent_id=<agent_id> in Xen command line option
  -- toolstack: arm_sci = "type=scmi_smc_multiagent,agent_id=<agent_id>"
  -- dom0less: todo: "xen,sci_type", "xen,sci_agent_id" properties in "xen,domain" nodes.
- factored out SCMI generic definitions (re-usable)
- factored out SCMI shmem code (re-usable)
- the SCMI passthrough configuration for guest domains is similar to any other HW passthrough cfg.

Patches 5-7
- no major changes, except to follow rebase and changes in previous patches

Regarding patches 5-7 I'd like to rise a question and I, personally, feel very skeptical doing any
kind of SCMI DT nodes generation as from toolstack as from Xen.
1) SCMI is no differ as any other HW MFD device, and HW passthrough configuration works for it in
   the same way.
2) if toolstack generates DT then dom0less case might need it also, but this means more code in Xen,
   so, with certification in mind, it means more overhead requirements, docs and testing.
   In my opinion if something can be done outside "kernel" - it should.
   So better invest in tools (imagebuilder, lopper, etc.) instead.
3) Hence SCMI DT bindings are pretty complex the corresponding guest DT nodes can't be generated
   from scratch - the user still need to add scmi node, protocols and protocols subnodes in the
   partial device tree, at least empty. But stop, not exactly empty - the properties like
   "#clock-cells" need to be added to avoid DTC warnings. Such behavior is rather confusing than
   helpful.
4) Exposing the Host Device tree in Dom0 is another questionable thing for toolstack SCMI DT
   generation. It consumes 128K of memory on Renesas r8a779g0-whitehawk.
5) No needs for additional public API (XEN_DOMCTL_get_sci_info, GUEST_SCI_SHMEM_BASE..) if dropped 

Code can be found at:
https://github.com/GrygiriiS/xen/commits/master_v4h_sci_v13_dt_gen

[1] RFC v2:
https://patchwork.kernel.org/project/xen-devel/cover/cover.1644341635.git.oleksii_moisieiev@epam.com/

SCMI spec:
https://developer.arm.com/documentation/den0056/e/?lang=en

SCMI bindings:
https://web.git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/devicetree/bindings/firmware/arm,scmi.yaml
https://web.git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/devicetree/bindings/access-controllers/access-controllers.yaml

Reference EL3 FW:
RPI5: https://github.com/xen-troops/arm-trusted-firmware/commits/rpi5_dev/
Renesas v4h: https://github.com/GrygiriiS/arm-trusted-firmware/commits/rcar_gen4_v2.7_v4x-scmi_upd/

base-commit: c3f5d1bb40b5 ("automation/cirrus-ci: introduce FreeBSD randconfig builds")

Grygorii Strashko (2):
  xen/arm: scmi-smc: update to be used under sci subsystem
  xen/arm: scmi-smc: passthrough SCMI SMC to domain, single agent

Oleksii Moisieiev (5):
  xen/arm: add generic SCI subsystem
  xen/arm: scmi: introduce SCI SCMI SMC multi-agent driver
  libs: libxenhypfs - handle blob properties
  xen/arm: Export host device-tree to hypfs
  xen/arm: scmi: generate scmi dt node for DomUs

 MAINTAINERS                                  |   6 +
 docs/man/xl.cfg.5.pod.in                     |  51 ++
 docs/misc/xen-command-line.pandoc            |  18 +
 tools/include/libxl.h                        |   5 +
 tools/include/xenctrl.h                      |   3 +
 tools/libs/ctrl/xc_domain.c                  |  18 +
 tools/libs/hypfs/core.c                      |   2 -
 tools/libs/light/libxl_arm.c                 | 311 ++++++-
 tools/libs/light/libxl_create.c              |  12 +
 tools/libs/light/libxl_internal.h            |   3 +
 tools/libs/light/libxl_types.idl             |  12 +
 tools/xl/xl_parse.c                          |  83 ++
 xen/arch/arm/Kconfig                         |  16 +
 xen/arch/arm/Makefile                        |   1 +
 xen/arch/arm/device.c                        |   5 +
 xen/arch/arm/dom0less-build.c                |  13 +
 xen/arch/arm/domain.c                        |  12 +-
 xen/arch/arm/domain_build.c                  |  11 +-
 xen/arch/arm/domctl.c                        |  22 +
 xen/arch/arm/firmware/Kconfig                |  36 +-
 xen/arch/arm/firmware/Makefile               |   2 +
 xen/arch/arm/firmware/sci.c                  | 187 ++++
 xen/arch/arm/firmware/scmi-proto.h           | 164 ++++
 xen/arch/arm/firmware/scmi-shmem.c           | 172 ++++
 xen/arch/arm/firmware/scmi-shmem.h           |  45 +
 xen/arch/arm/firmware/scmi-smc-multiagent.c  | 858 +++++++++++++++++++
 xen/arch/arm/firmware/scmi-smc.c             | 161 +++-
 xen/arch/arm/host_dtb_export.c               |  28 +
 xen/arch/arm/include/asm/domain.h            |  11 +
 xen/arch/arm/include/asm/firmware/sci.h      | 214 +++++
 xen/arch/arm/include/asm/firmware/scmi-smc.h |  41 -
 xen/arch/arm/vsmc.c                          |   4 +-
 xen/common/domctl.c                          |  13 +
 xen/drivers/passthrough/device_tree.c        |   7 +
 xen/include/asm-generic/device.h             |   1 +
 xen/include/public/arch-arm.h                |  12 +
 xen/include/public/device_tree_defs.h        |   1 +
 xen/include/public/domctl.h                  |  11 +
 38 files changed, 2471 insertions(+), 101 deletions(-)
 create mode 100644 xen/arch/arm/firmware/sci.c
 create mode 100644 xen/arch/arm/firmware/scmi-proto.h
 create mode 100644 xen/arch/arm/firmware/scmi-shmem.c
 create mode 100644 xen/arch/arm/firmware/scmi-shmem.h
 create mode 100644 xen/arch/arm/firmware/scmi-smc-multiagent.c
 create mode 100644 xen/arch/arm/host_dtb_export.c
 create mode 100644 xen/arch/arm/include/asm/firmware/sci.h
 delete mode 100644 xen/arch/arm/include/asm/firmware/scmi-smc.h

-- 
2.34.1


