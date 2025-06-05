Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DD06ACF9C0
	for <lists+xen-devel@lfdr.de>; Fri,  6 Jun 2025 00:40:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1007657.1386932 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uNJG8-0005ov-P3; Thu, 05 Jun 2025 22:40:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1007657.1386932; Thu, 05 Jun 2025 22:40:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uNJG8-0005mV-MI; Thu, 05 Jun 2025 22:40:28 +0000
Received: by outflank-mailman (input) for mailman id 1007657;
 Thu, 05 Jun 2025 22:40:27 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1uNJG7-0005mP-Ku
 for xen-devel@lists.xenproject.org; Thu, 05 Jun 2025 22:40:27 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1uNJG6-003mVw-2l;
 Thu, 05 Jun 2025 22:40:26 +0000
Received: from [2a02:8012:3a1:0:7807:532b:1d1d:b850]
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1uNJG7-009EbD-0G;
 Thu, 05 Jun 2025 22:40:26 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID;
	bh=51Crap5g3tsMLD8ahdQD1PZAJ1EohChB9g94IGRzfms=; b=Cek3+6WHYCv3muiJKpe7/ZUyzh
	CENGK/B3kWr4t2OUIM87QDk+aus+olsP4ORnmLOQ+le6vD9GaDleiBfBDWAd+5E/35umMYh2ycfb6
	GP+js+zKpSPXwhFoQvmw8qTDQ4mjKizeV6AAEPeqUDQLINvKkysBTu5fP85K0oW5Tr3A=;
Message-ID: <928d741e-7fa3-4b93-88b8-b45b9bd8b8f2@xen.org>
Date: Thu, 5 Jun 2025 23:40:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v4 0/8] xen/arm: scmi: introduce SCI SCMI SMC
 multi-agent support
Content-Language: en-GB
To: Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Bertrand Marquis <bertrand.marquis@arm.com>, Jan Beulich
 <jbeulich@suse.com>, Juergen Gross <jgross@suse.com>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Grygorii Strashko <grygorii_strashko@epam.com>
References: <cover.1747669845.git.oleksii_moisieiev@epam.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <cover.1747669845.git.oleksii_moisieiev@epam.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Oleksii,

On 19/05/2025 16:50, Oleksii Moisieiev wrote:
 > >   MAINTAINERS                                   |   6 +
>   .../arm/firmware/arm-scmi-proposal.rst        | 224 +++++
>   .../arm/firmware/arm-scmi.rst                 | 442 +++++++++
>   docs/hypervisor-guide/arm/index.rst           |   9 +
>   docs/hypervisor-guide/index.rst               |   1 +
>   docs/man/xl.cfg.5.pod.in                      |  47 +
>   docs/misc/arm/device-tree/booting.txt         |  75 ++
>   docs/misc/xen-command-line.pandoc             |  18 +
>   tools/include/libxl.h                         |   5 +
>   tools/libs/light/libxl_arm.c                  |  18 +
>   tools/libs/light/libxl_types.idl              |  12 +
>   tools/xl/xl_parse.c                           |  48 +
>   xen/arch/arm/device.c                         |   5 +
>   xen/arch/arm/dom0less-build.c                 |  49 +
>   xen/arch/arm/domain.c                         |  12 +-
>   xen/arch/arm/domain_build.c                   |  11 +-
>   xen/arch/arm/firmware/Kconfig                 |  36 +-
>   xen/arch/arm/firmware/Makefile                |   2 +
>   xen/arch/arm/firmware/sci.c                   | 191 ++++
>   xen/arch/arm/firmware/scmi-proto.h            | 164 ++++
>   xen/arch/arm/firmware/scmi-shmem.c            | 173 ++++
>   xen/arch/arm/firmware/scmi-shmem.h            |  45 +
>   xen/arch/arm/firmware/scmi-smc-multiagent.c   | 860 ++++++++++++++++++
>   xen/arch/arm/firmware/scmi-smc.c              | 191 +++-
>   xen/arch/arm/include/asm/domain.h             |   5 +
>   xen/arch/arm/include/asm/firmware/sci.h       | 214 +++++
>   xen/arch/arm/include/asm/firmware/scmi-smc.h  |  41 -
>   xen/arch/arm/vsmc.c                           |   4 +-
>   xen/common/domctl.c                           |  19 +
>   xen/drivers/passthrough/device_tree.c         |   6 +
>   xen/include/asm-generic/device.h              |   1 +
>   xen/include/public/arch-arm.h                 |   8 +
>   32 files changed, 2856 insertions(+), 86 deletions(-)
>   create mode 100644 docs/hypervisor-guide/arm/firmware/arm-scmi-proposal.rst
>   create mode 100644 docs/hypervisor-guide/arm/firmware/arm-scmi.rst
>   create mode 100644 docs/hypervisor-guide/arm/index.rst
>   create mode 100644 xen/arch/arm/firmware/sci.c
>   create mode 100644 xen/arch/arm/firmware/scmi-proto.h
>   create mode 100644 xen/arch/arm/firmware/scmi-shmem.c
>   create mode 100644 xen/arch/arm/firmware/scmi-shmem.h
>   create mode 100644 xen/arch/arm/firmware/scmi-smc-multiagent.c
>   create mode 100644 xen/arch/arm/include/asm/firmware/sci.h
>   delete mode 100644 xen/arch/arm/include/asm/firmware/scmi-smc.h

Looking at the list above, I don't see an update to SUPPORT.md. So I 
believe, this would fall under:

### Arm: SCMI over SMC calls forwarding to EL3 Firmware

Enable SCMI calls using SMC as doorbell mechanism and Shared Memory for
transport ("arm,scmi-smc" compatible only) to reach EL3 Firmware if issued
by hwdom. Some platforms use SCMI for access to system-level resources.

     Status: Supported

I think this should be updated for the multi-agent support to tech preview.

Cheers,


> 

-- 
Julien Grall


