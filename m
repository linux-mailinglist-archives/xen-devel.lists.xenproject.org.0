Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C4B44766F0
	for <lists+xen-devel@lfdr.de>; Thu, 16 Dec 2021 01:34:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.247669.427069 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mxeiD-000731-IC; Thu, 16 Dec 2021 00:33:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 247669.427069; Thu, 16 Dec 2021 00:33:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mxeiD-00070E-EP; Thu, 16 Dec 2021 00:33:33 +0000
Received: by outflank-mailman (input) for mailman id 247669;
 Thu, 16 Dec 2021 00:33:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CQEQ=RB=gmail.com=olekstysh@srs-se1.protection.inumbo.net>)
 id 1mxeiC-000708-45
 for xen-devel@lists.xenproject.org; Thu, 16 Dec 2021 00:33:32 +0000
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [2a00:1450:4864:20::233])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id caf50057-5e07-11ec-85d3-df6b77346a89;
 Thu, 16 Dec 2021 01:33:30 +0100 (CET)
Received: by mail-lj1-x233.google.com with SMTP id u22so35831103lju.7
 for <xen-devel@lists.xenproject.org>; Wed, 15 Dec 2021 16:33:30 -0800 (PST)
Received: from [192.168.1.7] ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id f24sm561471lfe.247.2021.12.15.16.33.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Dec 2021 16:33:29 -0800 (PST)
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
X-Inumbo-ID: caf50057-5e07-11ec-85d3-df6b77346a89
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=uXIYr6m+OUKat4C/s5i8qxUUG7WvMYSYMLbIJZbMcgI=;
        b=kHafZPqOZ/mX2oUWNkuUpOF//35rshoQpX2/iD7LbxROT5mUGJxthEDUKfrpfVkZP7
         E0N+Ps6V+2VbamZeKA9kVrVy3++/Wy2RenQqxbT0X6WRo+yqdXqd2m/sLzwM56AF7Lgc
         Qz2hgYYCpZT1Bb7ekAE31pgfeg4fIwwm0/FvIy48IZ6x7Ob5GsF4ESj846hMlatOiMGh
         kQw6Q6DJhlWozksrszGY50O8GOB7v5RlVgURGlsvlYYeQ/OKOYOUdBnc/5dai+3nugqL
         untmgCtfoHdaEp8U1YBIxgy8eVf0DYCE10ondjFKmAzle+najBWcB0u8J7ckCmno9850
         xtgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=uXIYr6m+OUKat4C/s5i8qxUUG7WvMYSYMLbIJZbMcgI=;
        b=Vs32QcI0u5IeZJoDSkrEO80yFiaqMOFRNcyvgcdHMKetFzJt7hwc0ta3TIDHz3BDsD
         NP5MV/I+Ai7Le0qqLycEXElXdLFPsA19JOZK2uSWdlQUijDzKE4c+ANXf+Y9fKrG8B0u
         bea1tLHBhetR/CsLt478kS1Hux+jObPMOMJCpvihFHcrax8lzot9r5M3O23/aichwdPh
         8rbnJ+L3I1EGdXHicWDDAXhnK29uzNBcAzHZjQVENcvEWmeukL+dAJrmQJPFH41c2xuF
         Yowig+lrf9SFL75xxK5H3cx/0aGzIfx0HtWI9D4Ua5ezbHH+qtGAyVQDn/sJymh5F66H
         wMrQ==
X-Gm-Message-State: AOAM533Wc/CTjrez4U7rqWS9zGN6RIekwKIsxhjQpCBF8ZuNioE/KfPH
	8lulYjoJgJrb4c7mwSQFYC8=
X-Google-Smtp-Source: ABdhPJxjifhiEgt4xyU2JYf8aLBNVZI/qPOyYkj4qC/pnDIusDdnFlOfClyr6dPG/YDKJbmfjuwp8Q==
X-Received: by 2002:a2e:bf05:: with SMTP id c5mr13436830ljr.104.1639614810070;
        Wed, 15 Dec 2021 16:33:30 -0800 (PST)
Subject: Re: [RFC v1 0/5] Introduce SCI-mediator feature
To: Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>,
 Juergen Gross <jgross@suse.com>
References: <cover.1639472078.git.oleksii_moisieiev@epam.com>
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <c8739251-3e13-2337-0ae8-cfae59397251@gmail.com>
Date: Thu, 16 Dec 2021 02:33:28 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <cover.1639472078.git.oleksii_moisieiev@epam.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US


On 14.12.21 11:34, Oleksii Moisieiev wrote:


Hi Oleksii

> Introducing the feature, called SCI mediator.
> It's purpose is to redirect SCMI requests from the domains to firmware
> (SCP, ATF etc), which controls the power/clock/resets etc.
> The idea is to make SCP firmware (or similar, such as AT-F) responsible for
> control power/clock/resets and provide SCMI interface so controls can be shared
> between the Domains.
> Originally, we've met a problem, that the devices, shared between different
> Domains, can't have an access to HW registers to work with clocks/resets/power
> etc. You have to pass cpg to the Domain, so the devices can access HW directly.
> The solution for this is to move HW controls over power/clock/resets to
> SCP firmware and use Linux-kernel SCMI drivers to pass requests to SCP.
> Xen is responsible for permissions setting, so Domain can access only to
> power/clock/resets which are related to this Domain. Also XEN is the mediator
> which redirects SCMI requests, adding agentID so firmware should know the
> sender.
> SMC is currently used as transport, but this should be configurable.
>
> Here is the high level design:
>
> SCI (System Control Interface) feature can be enabled in xen_config:
>> CONFIG_SCI=y
> Mediator can be configured:
>> CONFIG_SCMI_SMC=y
> Currently, only SCMI_SMC mediator is implemented, which using shared memory
> region to communicate with firmware and SMC as transport.
>
> Xen scmi should be configured in the device-tree.
> Format is the following:
> 	cpu_scp_shm: scp-shmem@0x53FF0000 {
> 		compatible = "arm,scmi-shmem";
> 		reg = <0x0 0x53FF0000 0x0 0x1000>;
> 	};
>
> 	firmware {
> 		scmi {
> 			compatible = "arm,scmi-smc";
> 			arm,smc-id = <0x82000002>;
> 			shmem = <&cpu_scp_shm>;
> 			#address-cells = <1>;
> 			#size-cells = <0>;
>
> 			scmi_power: protocol@11 {
> 				reg = <0x11>;
> 				#power-domain-cells = <1>;
> 			};
>
> 			scmi_clock: protocol@14 {
> 				reg = <0x14>;
> 				#clock-cells = <1>;
> 			};
>
> 			scmi_reset: protocol@16 {
> 				reg = <0x16>;
> 				#reset-cells = <1>;
> 			};
> 		};
> 	};
>
> Where:
> &cpu_scp_shm is the shared memory for scmi buffers;
> 0x53FF0000, size 0x1000 is the platform specific free address, which provide
> space for the communication.
> &scmi node, which should be copied to Dom0 device-tree.
>
> Device configured to use scmi:
> &avb {
> 	scmi_devid = <0>;
> 	clocks = <&scmi_clock 0>;
> 	power-domains = <&scmi_power 0>;
> 	resets = <&scmi_reset 0>;
> };
>
> Where:
> scmi_devid - id from the firmware, which is assigned for AVB.
>
> During initialization, XEN scans probes the first SCI-mediator driver which has
> matching node in the device-tree. If no device-tree was provided, then the
> first registered mediator driver should be probed.
>
> DomX should be configured:
> Device-tree should include the same nodes, described above.
> &cpu_scp_shm should be altered during domain creation. Xen allocates free page
> from the memory region, provided in &cpu_scp_shm in XEN device-tree, so each
> domain should have unique page. Nodes &cpu_scp_shm and /firmware/scmi should be
> copied from partial device-tree to domain device-tree, so kernel can initialize
> scmi driver.
>
> SCI mediator can be enabled in dom.cfg the following way:
>> sci = "scmi_smc"
> which sets scmi_smc to be used for the domain.


Great work! I can imagine this is going to be nice feature once upstreamed.

I am wondering, would the Xen (with the required updates of course) also 
be able to send it's own requests to the SCP? For example, to control 
overall system performance (CPU frequency)

or other let's say important power management task.


>
> Oleksii Moisieiev (5):
>    xen/arm: add support for Renesas R-Car Gen3 platform
>    xen/arm: add generic SCI mediator framework
>    xen/arm: introduce SCMI-SMC mediator driver
>    tools/arm: add "scmi_smc" option to xl.cfg
>    xen/arm: add SCI mediator support for DomUs
>
>   MAINTAINERS                       |   6 +
>   docs/man/xl.cfg.5.pod.in          |  22 +
>   tools/include/libxl.h             |   5 +
>   tools/include/xenctrl.h           |   3 +
>   tools/include/xenguest.h          |   2 +
>   tools/libs/ctrl/xc_domain.c       |  23 +
>   tools/libs/guest/xg_dom_arm.c     |   5 +-
>   tools/libs/light/libxl_arm.c      | 122 ++++-
>   tools/libs/light/libxl_create.c   |  54 +-
>   tools/libs/light/libxl_dom.c      |   1 +
>   tools/libs/light/libxl_internal.h |   4 +
>   tools/libs/light/libxl_types.idl  |   6 +
>   tools/xl/xl_parse.c               |   9 +
>   xen/arch/arm/Kconfig              |  10 +
>   xen/arch/arm/Makefile             |   1 +
>   xen/arch/arm/domain.c             |  24 +
>   xen/arch/arm/domain_build.c       |  11 +
>   xen/arch/arm/domctl.c             |  15 +
>   xen/arch/arm/platforms/Makefile   |   1 +
>   xen/arch/arm/platforms/rcar3.c    |  47 ++
>   xen/arch/arm/sci/Kconfig          |  10 +
>   xen/arch/arm/sci/Makefile         |   2 +
>   xen/arch/arm/sci/sci.c            | 128 +++++
>   xen/arch/arm/sci/scmi_smc.c       | 795 ++++++++++++++++++++++++++++++
>   xen/arch/arm/setup.c              |   1 +
>   xen/arch/arm/xen.lds.S            |   7 +
>   xen/include/asm-arm/domain.h      |   4 +
>   xen/include/asm-arm/sci/sci.h     | 162 ++++++
>   xen/include/public/arch-arm.h     |  11 +
>   xen/include/public/domctl.h       |   9 +
>   30 files changed, 1485 insertions(+), 15 deletions(-)
>   create mode 100644 xen/arch/arm/platforms/rcar3.c
>   create mode 100644 xen/arch/arm/sci/Kconfig
>   create mode 100644 xen/arch/arm/sci/Makefile
>   create mode 100644 xen/arch/arm/sci/sci.c
>   create mode 100644 xen/arch/arm/sci/scmi_smc.c
>   create mode 100644 xen/include/asm-arm/sci/sci.h
>
-- 
Regards,

Oleksandr Tyshchenko


