Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B287AB4917D
	for <lists+xen-devel@lfdr.de>; Mon,  8 Sep 2025 16:32:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1115366.1462024 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uvcuL-0000Ta-1O; Mon, 08 Sep 2025 14:31:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1115366.1462024; Mon, 08 Sep 2025 14:31:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uvcuK-0000Qi-Uz; Mon, 08 Sep 2025 14:31:48 +0000
Received: by outflank-mailman (input) for mailman id 1115366;
 Mon, 08 Sep 2025 14:31:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PLPY=3T=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1uvcuJ-0000Qa-K3
 for xen-devel@lists.xenproject.org; Mon, 08 Sep 2025 14:31:47 +0000
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [2a00:1450:4864:20::636])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8c273081-8cc0-11f0-9d13-b5c5bf9af7f9;
 Mon, 08 Sep 2025 16:31:46 +0200 (CEST)
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-afcb7ae6ed0so715500066b.3
 for <xen-devel@lists.xenproject.org>; Mon, 08 Sep 2025 07:31:46 -0700 (PDT)
Received: from [192.168.1.5] (user-109-243-64-38.play-internet.pl.
 [109.243.64.38]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aff0681aefdsm2509065866b.8.2025.09.08.07.31.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Sep 2025 07:31:44 -0700 (PDT)
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
X-Inumbo-ID: 8c273081-8cc0-11f0-9d13-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757341906; x=1757946706; darn=lists.xenproject.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gTnAGsvaRP34XBIxc1sSDELAPuvbtMj5Wn5Vr704pRY=;
        b=EkQZ2uzjpABWYjOOZkMFg9AT02JuVjpf2TzlU5T+SfbYnG4MZMlCqKBwaQ5kWjM5I4
         cJ5M3zJi9aBteNE/ooAyfG5dhaMJsnzkZX3GGyCecNf7VucXCpwbbVfZYemc2zU77rtD
         +6P4+MzBcTdJ8fTjEklKt2k6LhNLIZsIpFpHHa4ZbeCBTcl2jrHdArP2zZUNcbrR5qOU
         DAXiR5quAy3yx4No3FgH73E3QJSgqJnL3tpMrYRsoQJUnyghsEIuwsW47IMYU0xgfzZd
         ySYbrDrPHLh9OJtXeQJyGl0AHUWB0U+clG16N9rmgk96yYniA5aGbJN+Bayyv466z+LJ
         Sw+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757341906; x=1757946706;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=gTnAGsvaRP34XBIxc1sSDELAPuvbtMj5Wn5Vr704pRY=;
        b=pveSkGT4qctUG+NcUtBzHQh0is+/t7eNnLecMyQnUEShePeAe5HaQVsumRyMHPkhxM
         kte0cBP5IGRDhLUk3xxVELAYpr+NJU7UGHPMslRjKSVMskmND8REovO8roWMoZ9u9iz8
         klwArK04DotNrN77RO4XOPfz25ZIx9K2I5oNIpvDz0goAk2qD2vxpz3ohDQ1DJjg5DFy
         g8n+hsj/FVmGwldA0uPmswt2XX/med8ko4JMU3uCXdeAALFGyrAZvgiG1c0MaazT/vBP
         UUQQt8hwdVQrj47M7oBdKDy8PUDtTVoV+sLpl7YspqWE9o4BYI8nRV4OKdkyUmh8SECI
         6ZEw==
X-Forwarded-Encrypted: i=1; AJvYcCW/hNH/5Y4UZRTJQhWT62z0Ih1oG0eBDpZVhUYbUEruKAIkTPifJFMpIYV2MsAKHERlGRa8ggpP3kU=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzP5oZzfRz0eIQ2LWk6Y1yvV0KA+q3/9BmQr4hs92YSA9qcPU7e
	a6WEFOg6/EhXYirivTtTIYOsAwXUMMAs9IubEbfp82cXreVX3MgxoZ/s
X-Gm-Gg: ASbGncvVPLPyilHGZYahJehH2xLY1YuZOsJeXyXVPRRdd+qRJ06W2XrMj2RZgZBHU9M
	chfjAQZUa3jyE08VerDoQ2lBdAFgqtnuDXpo8GvW0SUtMrrg9yN13sG9k4TAV7HcqVDiu2TTk9l
	r91X+JNfsX5fSCMAGR4HGYAknK6ksSiVQ2JgrLaHCSZMMqoWYbKkHIkwxI71TYH4Z2yRAo/2WWY
	F77janyo7Bz3Rv68G8w55Uz46xEFIIMXLO1HsWf/drO8GzWHH5qqx8dhqQX37f1/2+sJxBU7tlT
	2U4zvMSHLHKfK3UaUjvx2oILUDVn1L/QW5k2gLzMihznmBHjNvwPUch03rU9rv5WwKFybJB75tS
	e3ht/BfjmDVcDIl5ktJrUOr+Js4G9ffT4doEcqtQ5O75XvSk4Hkslj9o4OlYy4xp4QR44yLsWwq
	Nn6y5wHvjjeH1HD0ZClw==
X-Google-Smtp-Source: AGHT+IEAobtqTdYEVKPJKy53dUqk7nnvS2fcUPLvmFMEqXl+JTNfFfUGlOWdQnHpvHZ2m9xodYOllg==
X-Received: by 2002:a17:907:da0:b0:b04:93f7:8b55 with SMTP id a640c23a62f3a-b04b14529eamr802968766b.21.1757341904856;
        Mon, 08 Sep 2025 07:31:44 -0700 (PDT)
Content-Type: multipart/alternative;
 boundary="------------NOS1zJdU5q70T088PNc98hq0"
Message-ID: <5bc8844d-fcde-48a0-9992-0f1a105a563e@gmail.com>
Date: Mon, 8 Sep 2025 16:31:42 +0200
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
 <e60397da-41fd-441d-a3b1-d1d22b322b1a@gmail.com>
 <c19592f6-2ee5-4faf-8f88-000e07b652f9@epam.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <c19592f6-2ee5-4faf-8f88-000e07b652f9@epam.com>

This is a multi-part message in MIME format.
--------------NOS1zJdU5q70T088PNc98hq0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hello Oleksii,

On 9/8/25 4:21 PM, Oleksii Moisieiev wrote:
> On 08/09/2025 17:11, Oleksii Kurochko wrote:
>> Hello everyone,
>> Based on the message from the previous version, the MISRA issues have been fixed,
>> and aside from one remaining documentation patch ("docs: arm: add docs for SCMI
>> over SMC calls forwarding driver"), the patch series appears to be ready.
> It seems to me that I have fixed all comments for the documentation
> patch. Did I miss something? Why do you think it's not ready for merge?

I don't see any proper/Reviewed-by/ or/Acked-by/ tags, only/Signed-off-by/:
   Signed-off-by: Grygorii Strashko<grygorii_strashko@epam.com>
   Signed-off-by: Oleksii Moisieiev<oleksii_moisieiev@epam.com>

Am I missing something?

>> I believe we can consider including it in 4.21. We should have sufficient time
>> to address any bugs that may arise.
>> By the way, it would also be good to prepare a CHANGELOG patch.
> Is it going to be changed during release process or it requires separate
> patch to be sent?

I'm not entirely sure I understand the first part of the sentence correctly,
but both options could work (IIUC).

I can send an update to the CHANGELOG as part of the release process,
but I'm also fine if you prefer to send a separate patch or apply a new patch
to this series using the Message-ID.

Please let me know which option you prefer.

~ Oleksii

>> Does anyone have any objections?
>> Best regards,
>>    Oleksii
>> On 9/4/25 4:21 PM, Oleksii Moisieiev wrote:
>>> Inroducing V9 patch series  on top of the Xen version 4.20-rc2
>>> which includes implementation of the SCI SCMI SMC single-agent support.
>>>
>>> This patch series is the first chunk of the
>>> "xen/arm: scmi: introduce SCI SCMI SMC multi-agent support" which can
>>> be found at [0]
>>>
>>> SCMI-multiagent support will be provided as the followup patch series.
>>>
>>> [0]https://lore.kernel.org/xen-devel/cover.1753184487.git.oleksii_moisieiev@epam.com/
>>>
>>> Patch 1 "xen/arm: add generic SCI subsystem"
>>> - rebased and refactored
>>> - introduced DEVICE_ARM_SCI DT device class and used for SCI drivers probing
>>> instead of custom,
>>>     linker sections based implementation.
>>> - added SCI API for Dom0 DT handling, instead of manipulating with ARM arch
>>> dom0 code directly.
>>> - RFC changes in XEN_DOMCTL_assign_device OP processing
>>> - Introduce arch_handle_passthrough_prop call to handle arm specific
>>> nodes
>>>
>>> Patch 2 "xen/arm: scmi-smc: update to be used under sci subsystem"
>>> - update driver introduced by commit 3e322bef8bc0 ("xen/arm: firmware: Add SCMI
>>> over SMC calls
>>> handling layer") be used under sci subsystem.
>>> - no functional changes in general
>>>
>>> Patch 3 "xen/arm: scmi-smc: passthrough SCMI SMC to guest domain
>>> This is new change which allows passthrough SCMI SMC, single agent interface to
>>> guest domain
>>> cover use case "thin Dom0 with guest domain, which serves as Driver domain".
>>> See patch commit message for full description.
>>>
>>> Patch 4 - docs: arm: add docs for SCMI over SMC calls forwarding
>>> driver
>>> - add documentation section for Simple Arm SCMI over SMC calls
>>> forwarding driver.
>>>
>>> Code can be found at:
>>> https://github.com/oleksiimoisieiev/xen/tree/scmi_upstrv5
>>>
>>> [1] RFC v2:
>>> http://patchwork.kernel.org/project/xen-devel/cover/cover.1644341635.git.oleksii_moisieiev@epam.com/
>>> [2] RFC v3:
>>> https://patchwork.kernel.org/project/xen-devel/patch/20250311111618.1850927-1-grygorii_strashko@epam.com
>>> SCMI spec:
>>> https://developer.arm.com/documentation/den0056/e/?lang=en
>>>
>>> SCMI bindings:
>>> https://web.git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/devicetree/bindings/firmware/arm,scmi.yaml
>>> https://web.git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/devicetree/bindings/access-controllers/access-controllers.yaml
>>>
>>> Reference EL3 FW:
>>> RPI5:https://github.com/xen-troops/arm-trusted-firmware/commits/rpi5_dev/
>>> Renesas v4h:
>>> https://github.com/GrygiriiS/arm-trusted-firmware/commits/rcar_gen4_v2.7_v4x-scmi_upd/
>>>
>>> base-commit: dbe60f244c (Update Xen to 4.21, 2025-02-21)
>>>
>>> Changes in v9:
>>> - change input param name for sci_handle_call function to match MISRA rules
>>> - update domu_dt_sci_parse declaration to match MC3A2.R8.4 MISRA rule
>>>
>>> Changes in v8:
>>> - reneregated {helpers/types}.gen.go, dropped unneeded parameters
>>>
>>> Changes in v7:
>>> - fix sci_handl_call to make changes more readable
>>> - fix build error when DOM0LESS_BUILD is disabled (removed
>>>    arch_handle_passthrough_prop from the header)
>>> - sort headers in alphabetical order in sci.h
>>> - sort headers in scmi-smc.c file
>>> - Fix commit description.
>>> - Move scmi-smc-passthrough definition to match alphaberical order
>>> - remove unneeded initialization with NULL
>>> - changed u64 to uint64_t
>>> - Send warning if iomem permit access was failed
>>> - fixed typos
>>>
>>> Changes in v6:
>>> - rebase on top of the latest master
>>> - fix return value of sci_dt_finalize() call
>>> - add R-b tag
>>> - added generated helpers and types go files
>>> - rename cmdline parameter to scmi-smc-passthrough
>>> - fix goto tag in parse_arm_sci_config
>>> - add link to the scmi bindings used in the doc
>>> - remove mentions about HVC calls from doc
>>> - rename cmdline parameter to scmi-smc-passthrough
>>>
>>> Changes in v5:
>>> - update Maintainers file. Set role as a Reviewer
>>> - rebased on the latest master branch
>>> - Introduce arch_handle_passthrough_prop call to handle arm specific nodes
>>> - rename dom0_scmi_smc_passthrough to scmi_smc_passthrough
>>> - rename dom0_scmi_smc_passthrough in documentation
>>>
>>> Changes in v4:
>>> - fix SPDX-License
>>> - rename DEVICE_ARM_SCI DT device class to FIRMWARE_DEVICE
>>> - move XEN_DOMCTL_assign_device code in separate patch
>>> - Add documentation for SCI SCMI drivers
>>> - xl.cfg doc
>>> - fix comments from Stefano Stabellini
>>> - fix toolstack code as sugested by Anthony PERARD
>>>     - use MATCH_OPTION()
>>>     - move arm_sci struct and cfg params in "arch_arm"
>>> - add SCMI passthrough for dom0less case
>>>
>>> Grygorii Strashko (3):
>>>     xen/arm: scmi-smc: update to be used under sci subsystem
>>>     xen/arm: scmi-smc: passthrough SCMI SMC to domain, single agent
>>>     docs: arm: add docs for SCMI over SMC calls forwarding driver
>>>
>>> Oleksii Moisieiev (1):
>>>     xen/arm: add generic SCI subsystem
>>>
>>>    MAINTAINERS                                   |   6 +
>>>    .../arm/firmware/arm-scmi.rst                 | 180 ++++++++++++++++
>>>    docs/hypervisor-guide/arm/index.rst           |   9 +
>>>    docs/hypervisor-guide/index.rst               |   1 +
>>>    docs/man/xl.cfg.5.pod.in                      |  34 +++
>>>    docs/misc/arm/device-tree/booting.txt         |  15 ++
>>>    docs/misc/xen-command-line.pandoc             |   9 +
>>>    tools/golang/xenlight/helpers.gen.go          |  35 +++
>>>    tools/golang/xenlight/types.gen.go            |  11 +
>>>    tools/include/libxl.h                         |   5 +
>>>    tools/libs/light/libxl_arm.c                  |  14 ++
>>>    tools/libs/light/libxl_types.idl              |  10 +
>>>    tools/xl/xl_parse.c                           |  36 ++++
>>>    xen/arch/arm/device.c                         |   5 +
>>>    xen/arch/arm/dom0less-build.c                 |  40 ++++
>>>    xen/arch/arm/domain.c                         |  12 +-
>>>    xen/arch/arm/domain_build.c                   |   8 +
>>>    xen/arch/arm/firmware/Kconfig                 |  25 ++-
>>>    xen/arch/arm/firmware/Makefile                |   1 +
>>>    xen/arch/arm/firmware/sci.c                   | 154 ++++++++++++++
>>>    xen/arch/arm/firmware/scmi-smc.c              | 194 +++++++++++++----
>>>    xen/arch/arm/include/asm/domain.h             |   5 +
>>>    xen/arch/arm/include/asm/firmware/sci.h       | 200 ++++++++++++++++++
>>>    xen/arch/arm/include/asm/firmware/scmi-smc.h  |  41 ----
>>>    xen/arch/arm/vsmc.c                           |   4 +-
>>>    xen/common/device-tree/dom0less-build.c       |   4 +
>>>    xen/include/asm-generic/device.h              |   1 +
>>>    xen/include/public/arch-arm.h                 |   5 +
>>>    xen/include/xen/dom0less-build.h              |   3 +
>>>    29 files changed, 982 insertions(+), 85 deletions(-)
>>>    create mode 100644 docs/hypervisor-guide/arm/firmware/arm-scmi.rst
>>>    create mode 100644 docs/hypervisor-guide/arm/index.rst
>>>    create mode 100644 xen/arch/arm/firmware/sci.c
>>>    create mode 100644 xen/arch/arm/include/asm/firmware/sci.h
>>>    delete mode 100644 xen/arch/arm/include/asm/firmware/scmi-smc.h
>>>
--------------NOS1zJdU5q70T088PNc98hq0
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <pre>Hello Oleksii,
</pre>
    <div class="moz-cite-prefix">On 9/8/25 4:21 PM, Oleksii Moisieiev
      wrote:<span style="white-space: pre-wrap">
</span></div>
    <blockquote type="cite"
      cite="mid:c19592f6-2ee5-4faf-8f88-000e07b652f9@epam.com">
      <pre wrap="" class="moz-quote-pre">On 08/09/2025 17:11, Oleksii Kurochko wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">Hello everyone,
Based on the message from the previous version, the MISRA issues have been fixed,
and aside from one remaining documentation patch ("docs: arm: add docs for SCMI
over SMC calls forwarding driver"), the patch series appears to be ready.
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">It seems to me that I have fixed all comments for the documentation 
patch. Did I miss something? Why do you think it's not ready for merge?</pre>
    </blockquote>
    <pre>I don't see any proper <em data-start="93" data-end="106">Reviewed-by</em> or <em
    data-start="110" data-end="120">Acked-by</em> tags, only <em
    data-start="133" data-end="148">Signed-off-by</em>:
  Signed-off-by: Grygorii Strashko <a class="moz-txt-link-rfc2396E"
    href="mailto:grygorii_strashko@epam.com">&lt;grygorii_strashko@epam.com&gt;</a>
  Signed-off-by: Oleksii Moisieiev <a class="moz-txt-link-rfc2396E"
    href="mailto:oleksii_moisieiev@epam.com">&lt;oleksii_moisieiev@epam.com&gt;</a>

Am I missing something?
</pre>
    <pre>
</pre>
    <blockquote type="cite"
      cite="mid:c19592f6-2ee5-4faf-8f88-000e07b652f9@epam.com">
      <pre wrap="" class="moz-quote-pre">
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">I believe we can consider including it in 4.21. We should have sufficient time
to address any bugs that may arise.
By the way, it would also be good to prepare a CHANGELOG patch.
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">Is it going to be changed during release process or it requires separate 
patch to be sent?</pre>
    </blockquote>
    <pre data-start="64" data-end="169">I'm not entirely sure I understand the first part of the sentence correctly,
but both options could work (IIUC).</pre>
    <pre data-start="171" data-end="401">I can send an update to the CHANGELOG as part of the release process,
but I'm also fine if you prefer to send a separate patch or apply a new patch
to this series using the Message-ID.

Please let me know which option you prefer.

~ Oleksii

</pre>
    <blockquote type="cite"
      cite="mid:c19592f6-2ee5-4faf-8f88-000e07b652f9@epam.com">
      <pre wrap="" class="moz-quote-pre">
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">Does anyone have any objections?
Best regards,
  Oleksii
On 9/4/25 4:21 PM, Oleksii Moisieiev wrote:
</pre>
        <blockquote type="cite">
          <pre wrap="" class="moz-quote-pre">Inroducing V9 patch series  on top of the Xen version 4.20-rc2
which includes implementation of the SCI SCMI SMC single-agent support.

This patch series is the first chunk of the
"xen/arm: scmi: introduce SCI SCMI SMC multi-agent support" which can
be found at [0]

SCMI-multiagent support will be provided as the followup patch series.

[0]<a class="moz-txt-link-freetext" href="https://lore.kernel.org/xen-devel/cover.1753184487.git.oleksii_moisieiev@epam.com/">https://lore.kernel.org/xen-devel/cover.1753184487.git.oleksii_moisieiev@epam.com/</a>

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
RPI5:<a class="moz-txt-link-freetext" href="https://github.com/xen-troops/arm-trusted-firmware/commits/rpi5_dev/">https://github.com/xen-troops/arm-trusted-firmware/commits/rpi5_dev/</a>
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
      </blockquote>
    </blockquote>
  </body>
</html>

--------------NOS1zJdU5q70T088PNc98hq0--

