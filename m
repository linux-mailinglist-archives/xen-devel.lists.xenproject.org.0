Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DC28B3ACBF
	for <lists+xen-devel@lfdr.de>; Thu, 28 Aug 2025 23:32:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1100001.1453602 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urkDo-0007sL-Ha; Thu, 28 Aug 2025 21:31:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1100001.1453602; Thu, 28 Aug 2025 21:31:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urkDo-0007q7-Ew; Thu, 28 Aug 2025 21:31:52 +0000
Received: by outflank-mailman (input) for mailman id 1100001;
 Thu, 28 Aug 2025 21:31:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YsNu=3I=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1urkDm-0007pW-JQ
 for xen-devel@lists.xenproject.org; Thu, 28 Aug 2025 21:31:50 +0000
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 674c9f2c-8456-11f0-8adc-4578a1afcccb;
 Thu, 28 Aug 2025 23:31:49 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id B6F7960139;
 Thu, 28 Aug 2025 21:31:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BBBF1C4CEEB;
 Thu, 28 Aug 2025 21:31:45 +0000 (UTC)
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
X-Inumbo-ID: 674c9f2c-8456-11f0-8adc-4578a1afcccb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756416707;
	bh=HL/nKcZBZDDGgK8YyFpxLKAwLiv68V1rJ59jDqp6xYA=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=GJuU/CUu4GksJvjdMSSBtIiLsLUHpxntomqwaEJgWXhW4C6VYlYCSEbRWttTN/RD0
	 JM7f6t7i1CLipMEfuC/+KidYjMiwcLCIr0z9ONJ659Bt4VqLKNuPv/uJUy0TvI7RlL
	 3N0niZhEfOoQ3iQDTgZJAS4bz748mMXW8D+ji9NA1V4VR5AJVO9JDl4F/icnUJGqd3
	 8AeEiuvzdEtfR4H5EpQYEto1j7vs+qSfHdCHoU2uH48WgCadmilP5lPVeiBXwVCPUy
	 1wjxg4zOlV2bAIORBmDDixJZwZnBNA/F+OLOF97+TWGgBAZpljctWdafVFRQCXXbqU
	 il5Ea2TGBeF5w==
Date: Thu, 28 Aug 2025 14:31:42 -0700 (PDT)
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
Subject: Re: [PATCH v6 1/4] xen/arm: add generic SCI subsystem
In-Reply-To: <ffe5a45efd34d92c9f2c7307ecd0e9efc5b0d57c.1756399156.git.oleksii_moisieiev@epam.com>
Message-ID: <alpine.DEB.2.22.394.2508281431180.8757@ubuntu-linux-20-04-desktop>
References: <cover.1756399156.git.oleksii_moisieiev@epam.com> <ffe5a45efd34d92c9f2c7307ecd0e9efc5b0d57c.1756399156.git.oleksii_moisieiev@epam.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 28 Aug 2025, Oleksii Moisieiev wrote:
> This patch adds the basic framework for ARM SCI mediator. SCI is System
> Control Interface, which is designed to redirect requests from the Domains
> to ARM specific Firmware (for example SCMI). This will allow the devices,
> passed-through to the different Domains, to access to the System resources
> (such as clocks/resets etc) by sending requests to the firmware.
> 
> ARM SCI subsystem allows to implement different SCI drivers to handle
> specific ARM firmware interfaces (like ARM SCMI) and mediate requests
> -between the Domains and the Firmware. Also it allows SCI drivers to perform
> proper action during Domain creation/destruction which is vital for
> handling use cases like Domain reboot.
> 
> This patch introduces new DEVICE_FIRMWARE device subclass for probing SCI
> drivers basing on device tree, SCI drivers register itself with
> DT_DEVICE_START/END macro. On init - the SCI drivers should register its
> SCI ops with sci_register(). Only one SCI driver can be supported.
> 
> At run-time, the following SCI API calls are introduced:
> 
> - sci_domain_sanitise_config() called from arch_sanitise_domain_config()
> - sci_domain_init() called from arch_domain_create()
> - sci_relinquish_resources() called from domain_relinquish_resources()
> - sci_domain_destroy() called from arch_domain_destroy()
> - sci_handle_call() called from vsmccc_handle_call()
> - sci_dt_handle_node()
> - sci_dt_finalize() called from handle_node() (Dom0 DT)
> 
> Signed-off-by: Oleksii Moisieiev <oleksii_moisieiev@epam.com>
> Signed-off-by: Grygorii Strashko <grygorii_strashko@epam.com>
> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

I just want to say that R-b from me is OK

