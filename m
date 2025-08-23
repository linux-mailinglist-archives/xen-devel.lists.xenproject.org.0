Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ED9E4B325C0
	for <lists+xen-devel@lfdr.de>; Sat, 23 Aug 2025 02:22:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1090711.1447831 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1upc1Z-0004Kv-Qb; Sat, 23 Aug 2025 00:22:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1090711.1447831; Sat, 23 Aug 2025 00:22:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1upc1Z-0004Hm-NR; Sat, 23 Aug 2025 00:22:25 +0000
Received: by outflank-mailman (input) for mailman id 1090711;
 Sat, 23 Aug 2025 00:22:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MmA+=3D=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1upc1Y-0004HH-Sa
 for xen-devel@lists.xenproject.org; Sat, 23 Aug 2025 00:22:24 +0000
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3af42c5f-7fb7-11f0-b898-0df219b8e170;
 Sat, 23 Aug 2025 02:22:20 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 7CEC360242;
 Sat, 23 Aug 2025 00:22:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9DEF1C4CEED;
 Sat, 23 Aug 2025 00:22:16 +0000 (UTC)
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
X-Inumbo-ID: 3af42c5f-7fb7-11f0-b898-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755908538;
	bh=cvjGvenOwhI9b6/HQCET2aj7y2m73JvkTz9jW1WwMYk=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=VLofcYQ8RdoLoXOBnQqTU/RFBesmWHztyA7EcaA625wWOfECb+1hcZs42FuvpO7Rf
	 MO41HtHXyspkArF29Ag+Rvx1au1lkMJbEWDx5jKQ9VoJgkjFGXKtv+KhmGkSxOqp0m
	 +F6qyOEwdGVaIB3OLezHty54VELGHKoE1yihnkgNi2kQ1w5JysXP9e0k1OEJshkx5b
	 /mYo5VpTpo/gVQt86Kgw6G9BgP8MsBEfztxTpQGmjenReWuNoLkf1Fym9G0AdkV7Nh
	 Ebdg2m7m+tQTnIRXIIyveFG5qWGp4ygb506gydQQO72WJ0iHO8J8d1idrT2lvlrW02
	 dKsIiUu4Bd/DA==
Date: Fri, 22 Aug 2025 17:22:15 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>
cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    Anthony PERARD <anthony.perard@vates.tech>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Jan Beulich <jbeulich@suse.com>, Juergen Gross <jgross@suse.com>, 
    Julien Grall <julien@xen.org>, Michal Orzel <michal.orzel@amd.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    Grygorii Strashko <grygorii_strashko@epam.com>
Subject: Re: [RFC PATCH v5 03/10] xen/arm: scmi-smc: passthrough SCMI SMC to
 domain, single agent
In-Reply-To: <3c8b292b345d81cd20ce260d45d3d7aac6d98702.1753184487.git.oleksii_moisieiev@epam.com>
Message-ID: <alpine.DEB.2.22.394.2508221715260.2743087@ubuntu-linux-20-04-desktop>
References: <cover.1753184487.git.oleksii_moisieiev@epam.com> <3c8b292b345d81cd20ce260d45d3d7aac6d98702.1753184487.git.oleksii_moisieiev@epam.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 22 Jul 2025, Oleksii Moisieiev wrote:
> From: Grygorii Strashko <grygorii_strashko@epam.com>
> 
> The commit 3e322bef8bc0 ("xen/arm: firmware: Add SCMI over SMC calls
> handling layer") introduces simple driver which forwards SCMI over SMC
> calls from hwdom/dom0 to EL3 firmware (TF-A) with a single SCMI OSPM agent
> support. While it is working gracefully for hwdom/dom0 use case it doesn't
> cover "thin Dom0 with guest domain, which serves as Driver domain"
> use-case. In this case HW need to be enable in Driver domain and dom0 is
> performing only control functions.
> 
> The EL3 SCMI firmware (TF-A) with a single SCMI OSPM agent support is
> pretty generic case for the default vendors SDK and new platforms.
> 
> This patch enables passthrough of SCMI SMC single agent interface to the
> one guest domain serving as Driver domain.
> 
> Configure Dom0 to enable SCMI passthrough:
> 
>  - dom0: add scmi_smc_passthrough to the Xen Command Line
> 
> Enabled SCMI passthrough for guest using toolstack in the following way:
> 
>  - domD: xl.cfg add "arm_sci" option as below
> 
>    arm_sci = "type=scmi_smc"
> 
>  - domD: xl.cfg enable access to the "arm,scmi-shmem"
> 
> iomem = [
>     "47ff0,1@22001",
> ]
> 
>  - domD: add SCMI nodes to the Driver domain partial device tree as in the
>  below example:
> 
> passthrough {
>    scmi_shm_0: sram@22001000 {
>        compatible = "arm,scmi-shmem";
>        reg = <0x0 0x22001000 0x0 0x1000>;
>    };
> 
>    firmware {
>         compatible = "simple-bus";
>             scmi: scmi {
>                 compatible = "arm,scmi-smc";
>                 shmem = <&scmi_shm_0>;
>                 ...
>             }
>     }
> }
> 
> dom0less case configuration:
> 
> - add "xen,sci_type" property for required DomU ("xen,domain") node
> 
>    xen,sci_type="scmi_smc"
> 
> - add scmi nodes to the Driver domain partial device tree the same way
> as above and enable access to the "arm,scmi-shmem" according to
> dom0less documentation. For example:
> 
>   scmi_shm_0: sram@22001000 {
>         compatible = "arm,scmi-shmem";
>         reg = <0x00 0x22001000 0x00 0x1000>;
> ->        xen,reg = <0x0 0x47ff0000 0x0 0x1000 0x0 0x22001000>;
> ->        xen,force-assign-without-iommu;
>   };
> 
> The SCMI SMC single agent interface can be enabled for one and only one
> domain. In general, the configuration is similar to any other HW
> passthrough, except explicitly enabling SCMI with "arm_sci" xl.cfg option.
> 
> Note that "arm,scmi-smc" and "arm,scmi-shmem" nodes will be removed from
> dom0/hwdom DT in case of

This patch needs to be rebased, other than that, it is OK


