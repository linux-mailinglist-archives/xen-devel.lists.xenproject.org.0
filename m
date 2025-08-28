Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B35F9B3ACC6
	for <lists+xen-devel@lfdr.de>; Thu, 28 Aug 2025 23:34:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1100033.1453631 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urkGV-0000zU-DY; Thu, 28 Aug 2025 21:34:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1100033.1453631; Thu, 28 Aug 2025 21:34:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urkGV-0000xl-Ar; Thu, 28 Aug 2025 21:34:39 +0000
Received: by outflank-mailman (input) for mailman id 1100033;
 Thu, 28 Aug 2025 21:34:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YsNu=3I=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1urkGU-0000K4-NE
 for xen-devel@lists.xenproject.org; Thu, 28 Aug 2025 21:34:38 +0000
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cb7765e8-8456-11f0-8adc-4578a1afcccb;
 Thu, 28 Aug 2025 23:34:37 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 2CA1F43C60;
 Thu, 28 Aug 2025 21:34:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6FDD7C4CEEB;
 Thu, 28 Aug 2025 21:34:34 +0000 (UTC)
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
X-Inumbo-ID: cb7765e8-8456-11f0-8adc-4578a1afcccb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756416876;
	bh=bJwvZMwCoA0Qx/uzqmYwY09BFeVZptsnxLvAxkTznpE=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=Lhhym9dZPurqRN5QM4HaMh/JgpokKYubYtNDsm/BFti4vvVizO4+E2dAYVrNwpv4T
	 SqlLhB3BfUNqrnS6JvvHHZTykd+8E3EOnUMgozTQ+vIUXQpYYjz+eSSuXAxkBKzYSn
	 Kvi9hz/aqSAoekjmHAimWtyU9xHwi3TxOSahtb7GoFf5T5xY1Vwm+pLnEkXTXsMy73
	 o0IPWCDKuz0Rx1NCoCYYjL3rFA+jAS+rwuEvO5m5AYAKSFvCVT/YJFSkoaCpt3q8pA
	 KLPc3QCxtfGi2Edv6Qb2+M/Ik26vjo76CptUn2+Q4WqqiEAgiGzQuRYSFEkcxS8G/l
	 P5411dRomKeqQ==
Date: Thu, 28 Aug 2025 14:34:32 -0700 (PDT)
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
Subject: Re: [PATCH v6 3/4] xen/arm: scmi-smc: passthrough SCMI SMC to domain,
 single agent
In-Reply-To: <02b79eaa0a611fb43a2146a5f41aec435d3db6c7.1756399156.git.oleksii_moisieiev@epam.com>
Message-ID: <alpine.DEB.2.22.394.2508281434210.8757@ubuntu-linux-20-04-desktop>
References: <cover.1756399156.git.oleksii_moisieiev@epam.com> <02b79eaa0a611fb43a2146a5f41aec435d3db6c7.1756399156.git.oleksii_moisieiev@epam.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 28 Aug 2025, Oleksii Moisieiev wrote:
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
>  - dom0: add scmi-smc-passthrough to the Xen Command Line
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
> 
> Signed-off-by: Grygorii Strashko <grygorii_strashko@epam.com>
> Signed-off-by: Oleksii Moisieiev <oleksii_moisieiev@epam.com>
> Acked-by: Anthony PERARD <anthony.perard@vates.tech> # tools

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

