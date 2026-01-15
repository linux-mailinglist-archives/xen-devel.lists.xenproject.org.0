Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DF16D2340C
	for <lists+xen-devel@lfdr.de>; Thu, 15 Jan 2026 09:49:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1204304.1519021 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vgJ2Y-0004fx-2C; Thu, 15 Jan 2026 08:49:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1204304.1519021; Thu, 15 Jan 2026 08:49:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vgJ2X-0004de-VM; Thu, 15 Jan 2026 08:49:13 +0000
Received: by outflank-mailman (input) for mailman id 1204304;
 Thu, 15 Jan 2026 08:49:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=6aKL=7U=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vgJ2W-0004G1-DA
 for xen-devel@lists.xenproject.org; Thu, 15 Jan 2026 08:49:12 +0000
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [2a00:1450:4864:20::343])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0ef3f435-f1ef-11f0-9ccf-f158ae23cfc8;
 Thu, 15 Jan 2026 09:49:10 +0100 (CET)
Received: by mail-wm1-x343.google.com with SMTP id
 5b1f17b1804b1-47ee4539adfso5809895e9.3
 for <xen-devel@lists.xenproject.org>; Thu, 15 Jan 2026 00:49:10 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47ee11ab892sm39952805e9.6.2026.01.15.00.49.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 15 Jan 2026 00:49:09 -0800 (PST)
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
X-Inumbo-ID: 0ef3f435-f1ef-11f0-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1768466949; x=1769071749; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=gvsmLp7JhLuQWhLHWus5ECv1L4CKpHytFNpIKghAoJQ=;
        b=Gg6u9vzIwWk1SBsvvuojSlOBULmXZYBGHzanxJDHAcOhCnfv8pV7d6nwEWpjUsf6ru
         7HfiPDg+rFOB9bPvfNH6+Y+n3vnd3g4cclH0VEMh2bk9+ZqqgXQeOfdItXlfupGK1Ym2
         jpGLxYUdq9edqhI1EzSAnzAhu+wJ5Dcqn1qUUGcLWKj0ACAHSOm7BsjbKtHziUwz1fiG
         vK/PFGTf4SqVVZKrrBgkepW534iMp7SYkzEo47p/YnlaKZxXt8NcTcG1/2sjO7cDdGEu
         iINS18P6T8XqzZ82MIT74lGCO6YFilx4eg9DKy7i8IbZcoVm8gW1xfE8Ia2nDqyr/TXL
         28RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768466949; x=1769071749;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gvsmLp7JhLuQWhLHWus5ECv1L4CKpHytFNpIKghAoJQ=;
        b=DRsRMNV7A/vuVxmjNmrR4d17pURmlRYNJh+fh8tSfM2p76rmD1845U8KnE8abAEDZ6
         SlulfeboAtCGkEiXmZU5WPnn8wSliExDL+B9hwOHbX802iZ9UMYZ7fGwKvG3SPIAuRAh
         jfAh+eU39fUzKJ0tIt5aWdrC+eyq/6uFIlDkjXiCnMdWuZ/Tv3iy+LGrWMtrFr3sDD2H
         vId7yb6iB7MPjEl+GvulnTK9bh97Trb+DnZGi6SbDO+kDd76FHsFEINE+JTd+2AHOra/
         ZnJvv/qruRF/ducY37TeOF6rTN5g0Plz3dw91KItH7mfSjvugigq8bOkjK29iMJkyHzS
         IQIQ==
X-Forwarded-Encrypted: i=1; AJvYcCWVQ1LT+2roKCyBSyVAgyvseKbX7Pr7PDuMcEGglMELcFh1iT3cUjSajoVK9tjTdfk6zH3/NRpXxFk=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwWvd96xbAOg/86IeXQGr0AvGNpIavi26AWDLeXMsIZj3et5ba5
	yiN+lj/swFE0bYxXuCk+fxNphM5FmQHXjn0i+xr6iIg7MXAAX49mlOj+/6Pb+l9OaA==
X-Gm-Gg: AY/fxX6yaxr43TxHwi0FZF9nSLX+iDPBHY5Nt7IFSWVrCsB4vNaFuO35n3mfE7gboU/
	B9YShBqtCqclhdTPBJjy8ETdkP1f1IlGr9VBOF6qGLpu/2U7X5AaiZSw1pygUyUgvwSJXgWCvGy
	BX3aPVmR9gg/jG+19JcU0DUnwI17RS/wAGy812u55S2njlbwrpFI0gSnLd5OD9mN/pML3F2zOdB
	CZN/IrFii1cQOXS0IZwf4P+FocIVysG7NIFZGqMtqMjT67QW7jOH1juIdyqb5Z11j5ompLdzpTq
	EG0fF/LUv6Nxj9hij/ugK+K4bA0vLtqGDbo0oTb7aJp4tFFsqvKu1DFMgy+BXXo7z0AYDKq5INT
	aPO8h2vkTGlLYI4TSF0v0jleFFDEzLakFDQDd7VJhaEPX4v/Sl1lnFQ9ekU6eVL77MlQc5MOOvt
	lZfNYeEY3kdD7wTSlpSscgqTNhqUP0OphMrR+r0CzXEp49vs1URlSepkfmeyCCsYGjrAJhnparf
	7k=
X-Received: by 2002:a05:600c:3555:b0:477:7c7d:d9b2 with SMTP id 5b1f17b1804b1-47ee338f01bmr70091245e9.32.1768466949385;
        Thu, 15 Jan 2026 00:49:09 -0800 (PST)
Message-ID: <8621d9c5-15d3-4d6b-8119-006327efb5c4@suse.com>
Date: Thu, 15 Jan 2026 09:49:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 0/5] xen/arm: scmi: introduce SCI SCMI SMC multi-agent
 support
To: Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Bertrand Marquis <bertrand.marquis@arm.com>, Juergen Gross
 <jgross@suse.com>, Julien Grall <julien@xen.org>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Grygorii Strashko <grygorii_strashko@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <cover.1768415200.git.oleksii_moisieiev@epam.com>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
Autocrypt: addr=jbeulich@suse.com; keydata=
 xsDiBFk3nEQRBADAEaSw6zC/EJkiwGPXbWtPxl2xCdSoeepS07jW8UgcHNurfHvUzogEq5xk
 hu507c3BarVjyWCJOylMNR98Yd8VqD9UfmX0Hb8/BrA+Hl6/DB/eqGptrf4BSRwcZQM32aZK
 7Pj2XbGWIUrZrd70x1eAP9QE3P79Y2oLrsCgbZJfEwCgvz9JjGmQqQkRiTVzlZVCJYcyGGsD
 /0tbFCzD2h20ahe8rC1gbb3K3qk+LpBtvjBu1RY9drYk0NymiGbJWZgab6t1jM7sk2vuf0Py
 O9Hf9XBmK0uE9IgMaiCpc32XV9oASz6UJebwkX+zF2jG5I1BfnO9g7KlotcA/v5ClMjgo6Gl
 MDY4HxoSRu3i1cqqSDtVlt+AOVBJBACrZcnHAUSuCXBPy0jOlBhxPqRWv6ND4c9PH1xjQ3NP
 nxJuMBS8rnNg22uyfAgmBKNLpLgAGVRMZGaGoJObGf72s6TeIqKJo/LtggAS9qAUiuKVnygo
 3wjfkS9A3DRO+SpU7JqWdsveeIQyeyEJ/8PTowmSQLakF+3fote9ybzd880fSmFuIEJldWxp
 Y2ggPGpiZXVsaWNoQHN1c2UuY29tPsJgBBMRAgAgBQJZN5xEAhsDBgsJCAcDAgQVAggDBBYC
 AwECHgECF4AACgkQoDSui/t3IH4J+wCfQ5jHdEjCRHj23O/5ttg9r9OIruwAn3103WUITZee
 e7Sbg12UgcQ5lv7SzsFNBFk3nEQQCACCuTjCjFOUdi5Nm244F+78kLghRcin/awv+IrTcIWF
 hUpSs1Y91iQQ7KItirz5uwCPlwejSJDQJLIS+QtJHaXDXeV6NI0Uef1hP20+y8qydDiVkv6l
 IreXjTb7DvksRgJNvCkWtYnlS3mYvQ9NzS9PhyALWbXnH6sIJd2O9lKS1Mrfq+y0IXCP10eS
 FFGg+Av3IQeFatkJAyju0PPthyTqxSI4lZYuJVPknzgaeuJv/2NccrPvmeDg6Coe7ZIeQ8Yj
 t0ARxu2xytAkkLCel1Lz1WLmwLstV30g80nkgZf/wr+/BXJW/oIvRlonUkxv+IbBM3dX2OV8
 AmRv1ySWPTP7AAMFB/9PQK/VtlNUJvg8GXj9ootzrteGfVZVVT4XBJkfwBcpC/XcPzldjv+3
 HYudvpdNK3lLujXeA5fLOH+Z/G9WBc5pFVSMocI71I8bT8lIAzreg0WvkWg5V2WZsUMlnDL9
 mpwIGFhlbM3gfDMs7MPMu8YQRFVdUvtSpaAs8OFfGQ0ia3LGZcjA6Ik2+xcqscEJzNH+qh8V
 m5jjp28yZgaqTaRbg3M/+MTbMpicpZuqF4rnB0AQD12/3BNWDR6bmh+EkYSMcEIpQmBM51qM
 EKYTQGybRCjpnKHGOxG0rfFY1085mBDZCH5Kx0cl0HVJuQKC+dV2ZY5AqjcKwAxpE75MLFkr
 wkkEGBECAAkFAlk3nEQCGwwACgkQoDSui/t3IH7nnwCfcJWUDUFKdCsBH/E5d+0ZnMQi+G0A
 nAuWpQkjM1ASeQwSHEeAWPgskBQL
In-Reply-To: <cover.1768415200.git.oleksii_moisieiev@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 14.01.2026 19:29, Oleksii Moisieiev wrote:
> Inroducing patch series which includes implementation of the SCI SCMI
> SMC multi-agent support.
> This patch series follows RFC v5 [3] series which was introducing both
> SCMI single-agent and multi-agent support. After the discussion it was
> decided to split features and upstream singe-agent support first. This
> feature is merged for now to v4.21-rc2.
> I'm starting this patch series from v6 to save the discussion history
> and don't break changes log.
> 
> Patch - xen/domctl: extend XEN_DOMCTL_assign_device to handle not
> only iommu
> - add chainged handling of assigned DT devices to support
> access-controller functionality through SCI framework.
> Change was done in two parts:
>  - call to sci_do_domctl() to do_domctl()
>  - update iommu_do_dt_domctl() to check for dt_device_is_protected()
>  and not fail if DT device is not protected by IOMMU
> 
> Patch - xen/arm: scmi: introduce SCI SCMI SMC multi-agent driver
> - add Xen-specific SCMI container compatible `xen,sci`
>   under `/chosen/xen`; Xen binds only to the `arm,scmi-smc` inside it and
>   ignores other SCMI nodes (e.g. under `/firmware`).
> - add `scmi-secondary-agents` and `#scmi-secondary-agents-cells` to describe
>   func_id/shmem/(optional agent_id) tuples for secondary agents.
> - each guest using SCMI supplies its agent_id (dom0 via `dom0=sci-agent-id=`,
>   toolstack via `arm_sci = "type=scmi_smc_multiagent,agent_id=..."`, dom0less
>   via `xen,sci_type` + `xen,sci-agent-id` in `xen,domain`).
> - factor out SCMI generic definitions and shmem code.
> - passthrough configuration for SCMI guests mirrors other HW passthrough.
> 
> Patch - docs: arm: add SCI SCMI SMC multi-agent driver docs
> - document the Xen SCMI container under `/chosen/xen/xen_scmi_config` and the
>   mediator’s binding rules; update examples accordingly.
> 
> All Xen-specific SCMI configuration now lives under `/chosen/g`
> to keep host DT changes isolated while leaving the host `/firmware/scmi`
> untouched for Dom0 consumption.
> 
> Code can be found at:
> https://github.com/oleksiimoisieiev/xen/tree/scmi_ma_upstrv6
> 
> [1] RFC v2:
> http://patchwork.kernel.org/project/xen-devel/cover/cover.1644341635.git.oleksii_moisieiev@epam.com/
> [2] RFC v3:
> https://patchwork.kernel.org/project/xen-devel/patch/20250311111618.1850927-1-grygorii_strashko@epam.com
> [3] RFC v5:
> https://lore.kernel.org/xen-devel/cover.1753184487.git.oleksii_moisieiev@epam.com/
> [4] SCMI single-agent:
> https://lore.kernel.org/xen-devel/cover.1756995595.git.oleksii_moisieiev@epam.com/
> SCMI spec:
> https://developer.arm.com/documentation/den0056/e/?lang=en
> 
> SCMI bindings:
> https://web.git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/devicetree/bindings/firmware/arm,scmi.yaml
> https://web.git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/devicetree/bindings/access-controllers/access-controllers.yaml
> 
> Reference EL3 FW:
> RPI5: https://github.com/xen-troops/arm-trusted-firmware/commits/rpi5_dev/
> Renesas v4h:
> https://github.com/GrygiriiS/arm-trusted-firmware/commits/rcar_gen4_v2.7_v4x-scmi_upd/
> 
> base-commit: dbe60f244c (Update Xen to 4.21, 2025-02-21)
> 
> Changes in v7:
> - update domctl to build on both Arm and x86 platforms
> - move ret1 declaration to the top of the function as required by code
> style
> - x86 guidance: removed the speculative note; header now just says
>   each arch supplies its own implementation or macro.
> - name spacing: dropped the double-underscore; the helpers are now
>   memcpy_fromio / memcpy_toio. The header also explicitly allows an
>   arch to define these as macros before including it.
> - updated io.c to keep 32-bit transfers safe on arm32
> - moved to __raw_read*/__raw_write* accessors to avoid endianness conversion.
> - split the helpers into separate compilation units
> - rework scmi nodes for xen to match on compatible string instead of
> the direct path
> - update documentation in section of the xen_scmi configuration which
> is matched by "xen,sci" compatible instead of the direct path.
> 
> Changes in v6:
> - change iommu_do_domctl and sci_do_domctl command order and
> call sci_do_domctl first which will produce cleaner code path.
> Also dropped changing return code when iommu was disabled in
> iommu_do_domctl.
> - sorted objs in Makefile alhabetically
> - added newline at the end of Makefile
> - used uint{N}_t intead of u{N}
> - add comment about why 32 bit IO operations were used
> - updated cast opertaions to avoid dropping constness which is wrong
> - move function definitions to generic place so the could be reused by
> other arch
> - add SPDX tag to io.c
> - updated scmi-shmem to use io.h from generic location
> - update scmi_agent_id parameter to be provided inside dom0= parameter
> list and have the following format "dom0=sci-agent-id=0"
> This change was done as a response for Stefano comment and
> requires a lot of code changes, but produces much cleaner solution
> that's why I've added it to the code.
> - fix file comments and return codes
> - fix lenght checks in shmem_{get,put}_message to use offsetof
> - remove len member from scmi_channel structure as it is not used
> - set scmi-secondary-agents property to be mandatory since if no
> secondary agents were provided then there is no sence to enable scmi
> when no secondary agents are populated to the Domains
> - update documentation in booting.txt, added xen_scmi node to the
> example
> - adjust d->arch.sci_enabled value in scmi_domain_destroy
> - fix lock management in smc_create_channel call
> - avoid extra map_channel_memory command for Xen management channel
> because collect_agent_id call unmaps memory if DOMID_XEN is not
> set. So for Xen management channel we can init domain_id ad DOMID_XEN
> before calling collect_agent_id so memory shouldn't be unmapped.
> - remove all HVC mentions from the multi-agent doc
> - update sci-agent-id parameter description in the documentation
> - add missing Sign-of
> - minor fixes across the document
> 
> Changes in v5:
> - return -EINVAL if mediator without assign_dt_device was provided
> - invert return code check for iommu_do_domctl in
> XEN_DOMCTL_assign_device domctl processing to make cleaner code
> - change -ENOTSUPP error code to -ENXIO in sci_do_domctl
> - handle -ENXIO return comde of iommu_do_domctl
> - leave !dt_device_is_protected check in iommu_do_dt_domctl to make
> code work the same way it's done in "handle_device" call while
> creating hwdom(dom0) and "handle_passthrough_prop" call for dom0less
> creation
> - drop return check from sci_assign_dt_device call as not needed
> - do not return EINVAL when addign_dt_device is not set. That is
> because this callback is optional and not implemented in single-agent driver
> - move memcpy_toio/fromio to the generic place
> - fix device-tree example format in booting.txt, added ";" after "}".
> - update define in scmi-proto.h
> - update define in scmi-shmem.h file
> - scmi_assign_device - do not ignore -EOPNOTSUPP return
> code of the do_smc_xfer
> - remove overwriting agent_channel->agent_id after
> SCMI_BASE_DISCOVER_AGENT call
> - add multi-agent files to the MAINTAINERS
> - add SCMI multi-agent description to the SUPPORT.md
> - handle ARM_SMCCC_INVALID_PARAMETER return code and return -EINVAL
> for smc call
> - updated collect_agents function. Set agent_id parameter as optional
> in scmi-secondary-agents device-tree property
> - introduce "#scmi-secondary-agents-cells" parameter to set if
> agent_id was provided
> - reanme xen,scmi-secondary-agents property to scmi-secondary-agents
> - move memcpu_toio/fromio for the generic place
> - update Xen to get management channel from /chosen/xen,config node
> - get hypervisor channnel from node instead of using hardcoded
> - update handling scmi and shmem nodes for the domain
> - Set multi-agent driver to support only Arm64
> - rework multi-agent driver to leave Host Device-tree unmodified
> 
> Changes in v4:
> - toolstack comments from Anthony PERARD
> - added dom0less support
> - added doc for "xen,scmi-secondary-agents"
> 
> Grygorii Strashko (2):
>   xen/domctl: extend XEN_DOMCTL_assign_device to handle not only iommu
>   docs: arm: add SCI SCMI SMC multi-agent driver docs
> 
> Oleksii Moisieiev (3):
>   xen: arm: smccc: add INVALID_PARAMETER error code
>   lib/arm: Add I/O memory copy helpers
>   xen/arm: scmi: introduce SCI SCMI SMC multi-agent driver
> 
>  MAINTAINERS                                   |   4 +
>  SUPPORT.md                                    |  11 +
>  .../arm/firmware/arm-scmi.rst                 | 341 ++++++++
>  docs/man/xl.cfg.5.pod.in                      |  13 +
>  docs/misc/arm/device-tree/booting.txt         | 122 +++
>  docs/misc/xen-command-line.pandoc             |  19 +-
>  tools/libs/light/libxl_arm.c                  |   4 +
>  tools/libs/light/libxl_types.idl              |   4 +-
>  tools/xl/xl_parse.c                           |  12 +
>  xen/arch/arm/dom0less-build.c                 |  11 +
>  xen/arch/arm/domain_build.c                   |  26 +-
>  xen/arch/arm/firmware/Kconfig                 |  12 +
>  xen/arch/arm/firmware/Makefile                |   1 +
>  xen/arch/arm/firmware/sci.c                   |  35 +
>  xen/arch/arm/firmware/scmi-proto.h            | 164 ++++
>  xen/arch/arm/firmware/scmi-shmem.c            | 115 +++
>  xen/arch/arm/firmware/scmi-shmem.h            |  45 +
>  xen/arch/arm/firmware/scmi-smc-multiagent.c   | 815 ++++++++++++++++++
>  xen/arch/arm/include/asm/firmware/sci.h       |  14 +
>  xen/arch/arm/include/asm/smccc.h              |   1 +
>  xen/common/domctl.c                           |  35 +-
>  xen/drivers/passthrough/device_tree.c         |   6 +
>  xen/include/public/arch-arm.h                 |   3 +
>  xen/include/xen/lib/io.h                      |  65 ++
>  xen/lib/Makefile                              |   1 +
>  xen/lib/arm/Makefile                          |   1 +
>  xen/lib/arm/memcpy_fromio.c                   |  48 ++
>  xen/lib/arm/memcpy_toio.c                     |  48 ++
>  28 files changed, 1972 insertions(+), 4 deletions(-)
>  create mode 100644 xen/arch/arm/firmware/scmi-proto.h
>  create mode 100644 xen/arch/arm/firmware/scmi-shmem.c
>  create mode 100644 xen/arch/arm/firmware/scmi-shmem.h
>  create mode 100644 xen/arch/arm/firmware/scmi-smc-multiagent.c

Just like done here, can ...

>  create mode 100644 xen/include/xen/lib/io.h
>  create mode 100644 xen/lib/arm/Makefile
>  create mode 100644 xen/lib/arm/memcpy_fromio.c
>  create mode 100644 xen/lib/arm/memcpy_toio.c

... new files please use dashes in favor of underscores?

Jan

