Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AF71C523D39
	for <lists+xen-devel@lfdr.de>; Wed, 11 May 2022 21:13:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.327220.549987 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1norlp-0000ON-17; Wed, 11 May 2022 19:13:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 327220.549987; Wed, 11 May 2022 19:13:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1norlo-0000MX-UM; Wed, 11 May 2022 19:13:12 +0000
Received: by outflank-mailman (input) for mailman id 327220;
 Wed, 11 May 2022 19:13:12 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1norlo-0000MJ-1U
 for xen-devel@lists.xenproject.org; Wed, 11 May 2022 19:13:12 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1norln-0005mW-Kg; Wed, 11 May 2022 19:13:11 +0000
Received: from [54.239.6.188] (helo=[192.168.11.111])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1norln-0000JP-ES; Wed, 11 May 2022 19:13:11 +0000
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
	bh=gHvV+rB+gkIIGc4SPP/TSIng9jrBX5D9wBakibcGGlY=; b=sRZhJuq+YJa+cjjtGUeGDcOc1m
	16omWND+xj5NdFdg23tgT/Kmip5S8++AuOCLLq1PVKpVJez6syd1lNPMLI6bZP1Kg8Y9/nMyiQzpa
	hyBtsGNVXwea0NG/SvH6qw3TSkzJ65lGinfIC52IOfKh93AOwPWUBJ9wJ0wKlf90f94s=;
Message-ID: <1a814fab-3122-746a-80f8-e87bc70f3b57@xen.org>
Date: Wed, 11 May 2022 20:13:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.9.0
Subject: Re: [PATCH v6 7/7] docs: document dom0less + PV drivers
To: Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org
Cc: jgross@suse.com, Bertrand.Marquis@arm.com, Volodymyr_Babchuk@epam.com,
 Stefano Stabellini <stefano.stabellini@xilinx.com>,
 Luca Fancellu <luca.fancellu@arm.com>
References: <alpine.DEB.2.22.394.2205041715320.43560@ubuntu-linux-20-04-desktop>
 <20220505001656.395419-7-sstabellini@kernel.org>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20220505001656.395419-7-sstabellini@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 05/05/2022 01:16, Stefano Stabellini wrote:
> From: Stefano Stabellini <stefano.stabellini@xilinx.com>
> 
> Document how to use the feature and how the implementation works.
> 
> Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
> Reviewed-by: Luca Fancellu <luca.fancellu@arm.com>

AFAICT, this match the code in Xen. So:

Acked-by: Julien Grall <jgrall@amazon.com>

> ---
>   docs/features/dom0less.pandoc | 43 ++++++++++++++++++++++++++++++++---
>   1 file changed, 40 insertions(+), 3 deletions(-)
> 
> diff --git a/docs/features/dom0less.pandoc b/docs/features/dom0less.pandoc
> index c9edb529e1..725afa0558 100644
> --- a/docs/features/dom0less.pandoc
> +++ b/docs/features/dom0less.pandoc
> @@ -90,6 +90,46 @@ Otherwise, they may be unusable in Xen (for instance if they are compressed).
>   
>   See docs/misc/arm/device-tree/booting.txt for more information.
>   
> +PV Drivers
> +----------
> +
> +It is possible to use PV drivers with dom0less guests with some
> +restrictions:
> +
> +- dom0less domUs that want to use PV drivers support should have the
> +  "xen,enhanced" property set under their device tree nodes (see
> +  docs/misc/arm/device-tree/booting.txt)
> +- a dom0 must be present (or another domain with enough privileges to
> +  run the toolstack)
> +- after dom0 is booted, the utility "init-dom0less" must be run
> +- do not run "init-dom0less" while creating other guests with xl
> +
> +After the execution of init-dom0less, it is possible to use "xl" to
> +hotplug PV drivers to dom0less guests. E.g. xl network-attach domU.
> +
> +The implementation works as follows:
> +- Xen allocates the xenstore event channel for each dom0less domU that
> +  has the "xen,enhanced" property, and sets HVM_PARAM_STORE_EVTCHN
> +- Xen does *not* allocate the xenstore page and sets HVM_PARAM_STORE_PFN
> +  to ~0ULL (invalid)
> +- Dom0less domU kernels check that HVM_PARAM_STORE_PFN is set to invalid
> +    - Old kernels will continue without xenstore support (Note: some old
> +      buggy kernels might crash because they don't check the validity of
> +      HVM_PARAM_STORE_PFN before using it! Disable "xen,enhanced" in
> +      those cases)
> +    - New kernels will wait for a notification on the xenstore event
> +      channel (HVM_PARAM_STORE_EVTCHN) before continuing with the
> +      initialization
> +- Once dom0 is booted, init-dom0less is executed:
> +    - it allocates the xenstore shared page and sets HVM_PARAM_STORE_PFN
> +    - it calls xs_introduce_domain
> +- Xenstored notices the new domain, initializes interfaces as usual, and
> +  sends an event channel notification to the domain using the xenstore
> +  event channel (HVM_PARAM_STORE_EVTCHN)
> +- The Linux domU kernel receives the event channel notification, checks
> +  HVM_PARAM_STORE_PFN again and continue with the initialization
> +
> +
>   Limitations
>   -----------
>   
> @@ -107,9 +147,6 @@ limitations:
>     information, the GIC version exposed to the domains started by Xen at
>     boot is the same as the native GIC version.
>   
> -- No PV drivers. There is no support for PV devices at the moment. All
> -  devices need to be statically assigned to guests.
> -
>   - Pinning vCPUs of domains started by Xen at boot can be
>     done from the control domain, using `xl vcpu-pin` as usual. It is not
>     currently possible to configure vCPU pinning without a control domain.

-- 
Julien Grall

