Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 87E8CB490D7
	for <lists+xen-devel@lfdr.de>; Mon,  8 Sep 2025 16:11:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1115283.1461965 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uvcaT-00035N-0x; Mon, 08 Sep 2025 14:11:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1115283.1461965; Mon, 08 Sep 2025 14:11:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uvcaS-00032p-Th; Mon, 08 Sep 2025 14:11:16 +0000
Received: by outflank-mailman (input) for mailman id 1115283;
 Mon, 08 Sep 2025 14:11:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PLPY=3T=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1uvcaR-00032j-GN
 for xen-devel@lists.xenproject.org; Mon, 08 Sep 2025 14:11:15 +0000
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [2a00:1450:4864:20::62f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a967d5e5-8cbd-11f0-9d13-b5c5bf9af7f9;
 Mon, 08 Sep 2025 16:11:06 +0200 (CEST)
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-b049bd81ce5so545150066b.1
 for <xen-devel@lists.xenproject.org>; Mon, 08 Sep 2025 07:11:07 -0700 (PDT)
Received: from [192.168.1.5] (user-109-243-64-38.play-internet.pl.
 [109.243.64.38]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b04279a59ffsm1944788466b.60.2025.09.08.07.11.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Sep 2025 07:11:05 -0700 (PDT)
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
X-Inumbo-ID: a967d5e5-8cbd-11f0-9d13-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757340666; x=1757945466; darn=lists.xenproject.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LZ4LKQMdwxZDnuWaDQYBpnyDtKMzx4kkjPJ67hL4DO4=;
        b=nGt37FuNInFMLOkUyawcM/7DXud6id7Sy0epq9rLfmpEDG0eEQBr0u/a+I08i1vzkB
         WjCO8mmMrnYuWCr/1KZAe3fu5MQAK62SsgVdAKZUQJCu0aAX+U5ZW/FwyrQcFlrVQYTF
         6QuUky01khOOAN/kuRIyLe3ka1jle7FQr+rbD4QsmhCilMzwbK9/ejSUvJxfxASqcr4x
         63BqWNhTYatfyl/oxQo275u+4SXtfgH1J1AyYm7HCmGkdlJlOC1vbP9vkxmoEn0Hc88W
         u84c3edwSyk0tP9LZ96Pqz8G3TGTWeku+Ef6aILyctapmdqIAuqnjevg4hsM2GDWNXNz
         O4hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757340666; x=1757945466;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=LZ4LKQMdwxZDnuWaDQYBpnyDtKMzx4kkjPJ67hL4DO4=;
        b=AThxH+QBmlkQ65k/7Isb7wkV/H0DlmJCFzZWIxT55sC9yEq6z/fyjFD8xF4ERjVKNh
         dn+RFpbYYDViKwbIwwMCQl73rl7wxkmext0p/eKafSzWQFy5MZ5UipD163gjkCkbYVEm
         zUs2dyLu0v9HuN82zC0Zcl4eqFkCw8+H3cNWPatZP7JplPQOeWx4es9SsPsQwUMjrBMP
         kiqV5xkgemL1bdiWFd2M5kAnr1bfa5MzUhuSW3UCfYwk9FU5YANeHk0ewBjjATVzzTy3
         s5xONNtovdavo1Iuyrj87HF9+hYoFqA16ZULe1uNzXjVg0XFHQvW+9yGDWJ/DMmlH4Si
         9XaQ==
X-Forwarded-Encrypted: i=1; AJvYcCU/+4udmzHxiBD3hgqBq+M24k5vOnEzPYRMriwPQrODkd2L6Aps6S3CEVSc+bSjg4q9p3XCQFmeVyA=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwCE6nahyVq0KvYLOlv4qyQIyNzpYXTaPFiFSmi70m0ejNlpPwX
	4inCiKZhnbSjmeyS84wXgJbUIBDZbxFbc73ZR9Mc46k7b9cLKkgIgr5w
X-Gm-Gg: ASbGnctZ4+mefAjzuaZpaJ31NMCPWl+vsIxE6vicJFRpTdINalUyFJxB5GazOyTUW/Y
	22aHYiqc93AU0eloNbim7Aws3Fa2HwTm9fprNQ0JRoxcsuFMTZvsf8cNeG8ohswj4HBAVEm/hT5
	eJZQUAhCi+DSVRmYB6wkclSC2JKZJF/rTFF1hEA6TMfgo2HJsabj+fsKnQG65P2vL6qqt+3pv1N
	RGKV0qYZn/xraJilbU4DPHs1u8Ooo3/vXB2J2XWwMRcFTdt3RTiHynsAMNZkrmTrJEsAtmeljnd
	6etqgEzcMBav0i9SMufDdOviPdv/ypkMKURnyCgo0/J87txGYbfYyZJbE7j3dgh1FCPNfGBbJOi
	/ANSF7ZKuTooC12njSNA0+fIDckfdYdt7ED2QijUmyuA5VdUSr65FvRvEaAZrhkaGrugIPoTmJ1
	ksYd36oQI=
X-Google-Smtp-Source: AGHT+IGDSTO2JbaZR60pQvyiHWjWXt1pzI8JMJ4Xmfa4HislaGZbABwMdRGpiNTy66l41lGHdiibuQ==
X-Received: by 2002:a17:907:3f8c:b0:b04:7514:f9ce with SMTP id a640c23a62f3a-b049307f5edmr1204976266b.2.1757340665994;
        Mon, 08 Sep 2025 07:11:05 -0700 (PDT)
Content-Type: multipart/alternative;
 boundary="------------9ZeOuM06A0eBtsmxEG5pDP7Y"
Message-ID: <e60397da-41fd-441d-a3b1-d1d22b322b1a@gmail.com>
Date: Mon, 8 Sep 2025 16:11:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 0/4] xen/arm: scmi: introduce SCI SCMI SMC single-agent
 support
To: Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Bertrand Marquis <bertrand.marquis@arm.com>, Jan Beulich
 <jbeulich@suse.com>, Juergen Gross <jgross@suse.com>,
 Julien Grall <julien@xen.org>, Michal Orzel <michal.orzel@amd.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Grygorii Strashko <grygorii_strashko@epam.com>
References: <cover.1756995595.git.oleksii_moisieiev@epam.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <cover.1756995595.git.oleksii_moisieiev@epam.com>

This is a multi-part message in MIME format.
--------------9ZeOuM06A0eBtsmxEG5pDP7Y
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hello everyone,

Based on the message from the previous version, the MISRA issues have been fixed,
and aside from one remaining documentation patch ("docs: arm: add docs for SCMI
over SMC calls forwarding driver"), the patch series appears to be ready.

I believe we can consider including it in 4.21. We should have sufficient time
to address any bugs that may arise.

By the way, it would also be good to prepare a CHANGELOG patch.

Does anyone have any objections?

Best regards,
  Oleksii

On 9/4/25 4:21 PM, Oleksii Moisieiev wrote:
> Inroducing V9 patch series  on top of the Xen version 4.20-rc2
> which includes implementation of the SCI SCMI SMC single-agent support.
>
> This patch series is the first chunk of the
> "xen/arm: scmi: introduce SCI SCMI SMC multi-agent support" which can
> be found at [0]
>
> SCMI-multiagent support will be provided as the followup patch series.
>
> [0]https://lore.kernel.org/xen-devel/cover.1753184487.git.oleksii_moisieiev@epam.com/
>
> Patch 1 "xen/arm: add generic SCI subsystem"
> - rebased and refactored
> - introduced DEVICE_ARM_SCI DT device class and used for SCI drivers probing
> instead of custom,
>    linker sections based implementation.
> - added SCI API for Dom0 DT handling, instead of manipulating with ARM arch
> dom0 code directly.
> - RFC changes in XEN_DOMCTL_assign_device OP processing
> - Introduce arch_handle_passthrough_prop call to handle arm specific
> nodes
>
> Patch 2 "xen/arm: scmi-smc: update to be used under sci subsystem"
> - update driver introduced by commit 3e322bef8bc0 ("xen/arm: firmware: Add SCMI
> over SMC calls
> handling layer") be used under sci subsystem.
> - no functional changes in general
>
> Patch 3 "xen/arm: scmi-smc: passthrough SCMI SMC to guest domain
> This is new change which allows passthrough SCMI SMC, single agent interface to
> guest domain
> cover use case "thin Dom0 with guest domain, which serves as Driver domain".
> See patch commit message for full description.
>
> Patch 4 - docs: arm: add docs for SCMI over SMC calls forwarding
> driver
> - add documentation section for Simple Arm SCMI over SMC calls
> forwarding driver.
>
> Code can be found at:
> https://github.com/oleksiimoisieiev/xen/tree/scmi_upstrv5
>
> [1] RFC v2:
> http://patchwork.kernel.org/project/xen-devel/cover/cover.1644341635.git.oleksii_moisieiev@epam.com/
> [2] RFC v3:
> https://patchwork.kernel.org/project/xen-devel/patch/20250311111618.1850927-1-grygorii_strashko@epam.com
> SCMI spec:
> https://developer.arm.com/documentation/den0056/e/?lang=en
>
> SCMI bindings:
> https://web.git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/devicetree/bindings/firmware/arm,scmi.yaml
> https://web.git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/devicetree/bindings/access-controllers/access-controllers.yaml
>
> Reference EL3 FW:
> RPI5:https://github.com/xen-troops/arm-trusted-firmware/commits/rpi5_dev/
> Renesas v4h:
> https://github.com/GrygiriiS/arm-trusted-firmware/commits/rcar_gen4_v2.7_v4x-scmi_upd/
>
> base-commit: dbe60f244c (Update Xen to 4.21, 2025-02-21)
>
> Changes in v9:
> - change input param name for sci_handle_call function to match MISRA rules
> - update domu_dt_sci_parse declaration to match MC3A2.R8.4 MISRA rule
>
> Changes in v8:
> - reneregated {helpers/types}.gen.go, dropped unneeded parameters
>
> Changes in v7:
> - fix sci_handl_call to make changes more readable
> - fix build error when DOM0LESS_BUILD is disabled (removed
>   arch_handle_passthrough_prop from the header)
> - sort headers in alphabetical order in sci.h
> - sort headers in scmi-smc.c file
> - Fix commit description.
> - Move scmi-smc-passthrough definition to match alphaberical order
> - remove unneeded initialization with NULL
> - changed u64 to uint64_t
> - Send warning if iomem permit access was failed
> - fixed typos
>
> Changes in v6:
> - rebase on top of the latest master
> - fix return value of sci_dt_finalize() call
> - add R-b tag
> - added generated helpers and types go files
> - rename cmdline parameter to scmi-smc-passthrough
> - fix goto tag in parse_arm_sci_config
> - add link to the scmi bindings used in the doc
> - remove mentions about HVC calls from doc
> - rename cmdline parameter to scmi-smc-passthrough
>
> Changes in v5:
> - update Maintainers file. Set role as a Reviewer
> - rebased on the latest master branch
> - Introduce arch_handle_passthrough_prop call to handle arm specific nodes
> - rename dom0_scmi_smc_passthrough to scmi_smc_passthrough
> - rename dom0_scmi_smc_passthrough in documentation
>
> Changes in v4:
> - fix SPDX-License
> - rename DEVICE_ARM_SCI DT device class to FIRMWARE_DEVICE
> - move XEN_DOMCTL_assign_device code in separate patch
> - Add documentation for SCI SCMI drivers
> - xl.cfg doc
> - fix comments from Stefano Stabellini
> - fix toolstack code as sugested by Anthony PERARD
>    - use MATCH_OPTION()
>    - move arm_sci struct and cfg params in "arch_arm"
> - add SCMI passthrough for dom0less case
>
> Grygorii Strashko (3):
>    xen/arm: scmi-smc: update to be used under sci subsystem
>    xen/arm: scmi-smc: passthrough SCMI SMC to domain, single agent
>    docs: arm: add docs for SCMI over SMC calls forwarding driver
>
> Oleksii Moisieiev (1):
>    xen/arm: add generic SCI subsystem
>
>   MAINTAINERS                                   |   6 +
>   .../arm/firmware/arm-scmi.rst                 | 180 ++++++++++++++++
>   docs/hypervisor-guide/arm/index.rst           |   9 +
>   docs/hypervisor-guide/index.rst               |   1 +
>   docs/man/xl.cfg.5.pod.in                      |  34 +++
>   docs/misc/arm/device-tree/booting.txt         |  15 ++
>   docs/misc/xen-command-line.pandoc             |   9 +
>   tools/golang/xenlight/helpers.gen.go          |  35 +++
>   tools/golang/xenlight/types.gen.go            |  11 +
>   tools/include/libxl.h                         |   5 +
>   tools/libs/light/libxl_arm.c                  |  14 ++
>   tools/libs/light/libxl_types.idl              |  10 +
>   tools/xl/xl_parse.c                           |  36 ++++
>   xen/arch/arm/device.c                         |   5 +
>   xen/arch/arm/dom0less-build.c                 |  40 ++++
>   xen/arch/arm/domain.c                         |  12 +-
>   xen/arch/arm/domain_build.c                   |   8 +
>   xen/arch/arm/firmware/Kconfig                 |  25 ++-
>   xen/arch/arm/firmware/Makefile                |   1 +
>   xen/arch/arm/firmware/sci.c                   | 154 ++++++++++++++
>   xen/arch/arm/firmware/scmi-smc.c              | 194 +++++++++++++----
>   xen/arch/arm/include/asm/domain.h             |   5 +
>   xen/arch/arm/include/asm/firmware/sci.h       | 200 ++++++++++++++++++
>   xen/arch/arm/include/asm/firmware/scmi-smc.h  |  41 ----
>   xen/arch/arm/vsmc.c                           |   4 +-
>   xen/common/device-tree/dom0less-build.c       |   4 +
>   xen/include/asm-generic/device.h              |   1 +
>   xen/include/public/arch-arm.h                 |   5 +
>   xen/include/xen/dom0less-build.h              |   3 +
>   29 files changed, 982 insertions(+), 85 deletions(-)
>   create mode 100644 docs/hypervisor-guide/arm/firmware/arm-scmi.rst
>   create mode 100644 docs/hypervisor-guide/arm/index.rst
>   create mode 100644 xen/arch/arm/firmware/sci.c
>   create mode 100644 xen/arch/arm/include/asm/firmware/sci.h
>   delete mode 100644 xen/arch/arm/include/asm/firmware/scmi-smc.h
>
--------------9ZeOuM06A0eBtsmxEG5pDP7Y
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <pre data-start="110" data-end="125">Hello everyone,</pre>
    <pre data-start="127" data-end="362">Based on the message from the previous version, the MISRA issues have been fixed,
and aside from one remaining documentation patch ("docs: arm: add docs for SCMI
over SMC calls forwarding driver"), the patch series appears to be ready.</pre>
    <pre data-start="364" data-end="478">I believe we can consider including it in 4.21. We should have sufficient time
to address any bugs that may arise.</pre>
    <pre data-start="480" data-end="543">By the way, it would also be good to prepare a CHANGELOG patch.</pre>
    <pre data-start="545" data-end="577">Does anyone have any objections?</pre>
    <pre data-start="579" data-end="602">Best regards,
 Oleksii</pre>
    <pre></pre>
    <div class="moz-cite-prefix">On 9/4/25 4:21 PM, Oleksii Moisieiev
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:cover.1756995595.git.oleksii_moisieiev@epam.com">
      <pre wrap="" class="moz-quote-pre">
Inroducing V9 patch series  on top of the Xen version 4.20-rc2
which includes implementation of the SCI SCMI SMC single-agent support.

This patch series is the first chunk of the
"xen/arm: scmi: introduce SCI SCMI SMC multi-agent support" which can
be found at [0]

SCMI-multiagent support will be provided as the followup patch series.

[0] <a class="moz-txt-link-freetext" href="https://lore.kernel.org/xen-devel/cover.1753184487.git.oleksii_moisieiev@epam.com/">https://lore.kernel.org/xen-devel/cover.1753184487.git.oleksii_moisieiev@epam.com/</a>

Patch 1 "xen/arm: add generic SCI subsystem"
- rebased and refactored
- introduced DEVICE_ARM_SCI DT device class and used for SCI drivers probing
instead of custom,
  linker sections based implementation.
- added SCI API for Dom0 DT handling, instead of manipulating with ARM arch
dom0 code directly.
- RFC changes in XEN_DOMCTL_assign_device OP processing
- Introduce arch_handle_passthrough_prop call to handle arm specific
nodes

Patch 2 "xen/arm: scmi-smc: update to be used under sci subsystem"
- update driver introduced by commit 3e322bef8bc0 ("xen/arm: firmware: Add SCMI
over SMC calls
handling layer") be used under sci subsystem.
- no functional changes in general

Patch 3 "xen/arm: scmi-smc: passthrough SCMI SMC to guest domain
This is new change which allows passthrough SCMI SMC, single agent interface to
guest domain
cover use case "thin Dom0 with guest domain, which serves as Driver domain".
See patch commit message for full description.

Patch 4 - docs: arm: add docs for SCMI over SMC calls forwarding
driver
- add documentation section for Simple Arm SCMI over SMC calls
forwarding driver.

Code can be found at:
<a class="moz-txt-link-freetext" href="https://github.com/oleksiimoisieiev/xen/tree/scmi_upstrv5">https://github.com/oleksiimoisieiev/xen/tree/scmi_upstrv5</a>

[1] RFC v2:
<a class="moz-txt-link-freetext" href="http://patchwork.kernel.org/project/xen-devel/cover/cover.1644341635.git.oleksii_moisieiev@epam.com/">http://patchwork.kernel.org/project/xen-devel/cover/cover.1644341635.git.oleksii_moisieiev@epam.com/</a>
[2] RFC v3:
<a class="moz-txt-link-freetext" href="https://patchwork.kernel.org/project/xen-devel/patch/20250311111618.1850927-1-grygorii_strashko@epam.com">https://patchwork.kernel.org/project/xen-devel/patch/20250311111618.1850927-1-grygorii_strashko@epam.com</a>
SCMI spec:
<a class="moz-txt-link-freetext" href="https://developer.arm.com/documentation/den0056/e/?lang=en">https://developer.arm.com/documentation/den0056/e/?lang=en</a>

SCMI bindings:
<a class="moz-txt-link-freetext" href="https://web.git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/devicetree/bindings/firmware/arm,scmi.yaml">https://web.git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/devicetree/bindings/firmware/arm,scmi.yaml</a>
<a class="moz-txt-link-freetext" href="https://web.git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/devicetree/bindings/access-controllers/access-controllers.yaml">https://web.git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/devicetree/bindings/access-controllers/access-controllers.yaml</a>

Reference EL3 FW:
RPI5: <a class="moz-txt-link-freetext" href="https://github.com/xen-troops/arm-trusted-firmware/commits/rpi5_dev/">https://github.com/xen-troops/arm-trusted-firmware/commits/rpi5_dev/</a>
Renesas v4h:
<a class="moz-txt-link-freetext" href="https://github.com/GrygiriiS/arm-trusted-firmware/commits/rcar_gen4_v2.7_v4x-scmi_upd/">https://github.com/GrygiriiS/arm-trusted-firmware/commits/rcar_gen4_v2.7_v4x-scmi_upd/</a>

base-commit: dbe60f244c (Update Xen to 4.21, 2025-02-21)

Changes in v9:
- change input param name for sci_handle_call function to match MISRA rules
- update domu_dt_sci_parse declaration to match MC3A2.R8.4 MISRA rule

Changes in v8:
- reneregated {helpers/types}.gen.go, dropped unneeded parameters

Changes in v7:
- fix sci_handl_call to make changes more readable
- fix build error when DOM0LESS_BUILD is disabled (removed
 arch_handle_passthrough_prop from the header)
- sort headers in alphabetical order in sci.h
- sort headers in scmi-smc.c file
- Fix commit description.
- Move scmi-smc-passthrough definition to match alphaberical order
- remove unneeded initialization with NULL
- changed u64 to uint64_t
- Send warning if iomem permit access was failed
- fixed typos

Changes in v6:
- rebase on top of the latest master
- fix return value of sci_dt_finalize() call
- add R-b tag
- added generated helpers and types go files
- rename cmdline parameter to scmi-smc-passthrough
- fix goto tag in parse_arm_sci_config
- add link to the scmi bindings used in the doc
- remove mentions about HVC calls from doc
- rename cmdline parameter to scmi-smc-passthrough

Changes in v5:
- update Maintainers file. Set role as a Reviewer
- rebased on the latest master branch
- Introduce arch_handle_passthrough_prop call to handle arm specific nodes
- rename dom0_scmi_smc_passthrough to scmi_smc_passthrough
- rename dom0_scmi_smc_passthrough in documentation

Changes in v4:
- fix SPDX-License
- rename DEVICE_ARM_SCI DT device class to FIRMWARE_DEVICE
- move XEN_DOMCTL_assign_device code in separate patch
- Add documentation for SCI SCMI drivers
- xl.cfg doc
- fix comments from Stefano Stabellini
- fix toolstack code as sugested by Anthony PERARD
  - use MATCH_OPTION()
  - move arm_sci struct and cfg params in "arch_arm"
- add SCMI passthrough for dom0less case

Grygorii Strashko (3):
  xen/arm: scmi-smc: update to be used under sci subsystem
  xen/arm: scmi-smc: passthrough SCMI SMC to domain, single agent
  docs: arm: add docs for SCMI over SMC calls forwarding driver

Oleksii Moisieiev (1):
  xen/arm: add generic SCI subsystem

 MAINTAINERS                                   |   6 +
 .../arm/firmware/arm-scmi.rst                 | 180 ++++++++++++++++
 docs/hypervisor-guide/arm/index.rst           |   9 +
 docs/hypervisor-guide/index.rst               |   1 +
 docs/man/xl.cfg.5.pod.in                      |  34 +++
 docs/misc/arm/device-tree/booting.txt         |  15 ++
 docs/misc/xen-command-line.pandoc             |   9 +
 tools/golang/xenlight/helpers.gen.go          |  35 +++
 tools/golang/xenlight/types.gen.go            |  11 +
 tools/include/libxl.h                         |   5 +
 tools/libs/light/libxl_arm.c                  |  14 ++
 tools/libs/light/libxl_types.idl              |  10 +
 tools/xl/xl_parse.c                           |  36 ++++
 xen/arch/arm/device.c                         |   5 +
 xen/arch/arm/dom0less-build.c                 |  40 ++++
 xen/arch/arm/domain.c                         |  12 +-
 xen/arch/arm/domain_build.c                   |   8 +
 xen/arch/arm/firmware/Kconfig                 |  25 ++-
 xen/arch/arm/firmware/Makefile                |   1 +
 xen/arch/arm/firmware/sci.c                   | 154 ++++++++++++++
 xen/arch/arm/firmware/scmi-smc.c              | 194 +++++++++++++----
 xen/arch/arm/include/asm/domain.h             |   5 +
 xen/arch/arm/include/asm/firmware/sci.h       | 200 ++++++++++++++++++
 xen/arch/arm/include/asm/firmware/scmi-smc.h  |  41 ----
 xen/arch/arm/vsmc.c                           |   4 +-
 xen/common/device-tree/dom0less-build.c       |   4 +
 xen/include/asm-generic/device.h              |   1 +
 xen/include/public/arch-arm.h                 |   5 +
 xen/include/xen/dom0less-build.h              |   3 +
 29 files changed, 982 insertions(+), 85 deletions(-)
 create mode 100644 docs/hypervisor-guide/arm/firmware/arm-scmi.rst
 create mode 100644 docs/hypervisor-guide/arm/index.rst
 create mode 100644 xen/arch/arm/firmware/sci.c
 create mode 100644 xen/arch/arm/include/asm/firmware/sci.h
 delete mode 100644 xen/arch/arm/include/asm/firmware/scmi-smc.h

</pre>
    </blockquote>
  </body>
</html>

--------------9ZeOuM06A0eBtsmxEG5pDP7Y--

