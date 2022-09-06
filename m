Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B90D35AF7CF
	for <lists+xen-devel@lfdr.de>; Wed,  7 Sep 2022 00:23:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.400652.642289 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVgxq-0000lr-Hi; Tue, 06 Sep 2022 22:22:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 400652.642289; Tue, 06 Sep 2022 22:22:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVgxq-0000j9-EZ; Tue, 06 Sep 2022 22:22:38 +0000
Received: by outflank-mailman (input) for mailman id 400652;
 Tue, 06 Sep 2022 22:22:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4s6j=ZJ=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1oVgxo-0000j3-7b
 for xen-devel@lists.xenproject.org; Tue, 06 Sep 2022 22:22:36 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 67af75d8-2e32-11ed-af93-0125da4c0113;
 Wed, 07 Sep 2022 00:22:34 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id B8B04616DF;
 Tue,  6 Sep 2022 22:22:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 52E55C433C1;
 Tue,  6 Sep 2022 22:22:32 +0000 (UTC)
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
X-Inumbo-ID: 67af75d8-2e32-11ed-af93-0125da4c0113
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1662502953;
	bh=8n8aMCWIfJIlAuCHcbpzkSDHpKkDTpXTJEtaU2PtQ8I=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=uO1HfR5AenOtZwvziWvYSCFADRYyUkfnabsWDD6nZELMQHf+DbbQMXSKLRWjIbpmm
	 SoBU9fMEpzqzEuYeIQwFmCh8vWi17ohE1Lxp6mukER0u77s3U9qr7dePcG00pItVAN
	 XyB/e/I9UHqXQiIqByLmhuVmUIpAy/3uPQr2mwXSjw8fB+x4K3+Pi19CmkcyUc9eqR
	 JjuL7p6NLaOOosbp3yBoRwYYxC9RDmNwA2yIDP25/pO7AhgOLfQ6lVYyjIPogi1oJC
	 R3SHy/RxsbjV/LdrWpdSRQPQR71iK4o3zw8fZD9//k/THq0B1vu91REiW49qGW3q3H
	 swPO0JWCxokzg==
Date: Tue, 6 Sep 2022 15:22:31 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Rahul Singh <rahul.singh@arm.com>
cc: xen-devel@lists.xenproject.org, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v4 7/7] xen/arm: introduce xen-evtchn dom0less property
In-Reply-To: <055660c342c85cd97d6e3a5551c84e62f49dece6.1662462034.git.rahul.singh@arm.com>
Message-ID: <alpine.DEB.2.22.394.2209061514150.157835@ubuntu-linux-20-04-desktop>
References: <cover.1662462034.git.rahul.singh@arm.com> <055660c342c85cd97d6e3a5551c84e62f49dece6.1662462034.git.rahul.singh@arm.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 6 Sep 2022, Rahul Singh wrote:
> Introduce a new sub-node under /chosen node to establish static event
> channel communication between domains on dom0less systems.
> 
> An event channel will be created beforehand to allow the domains to
> send notifications to each other.
> 
> Signed-off-by: Rahul Singh <rahul.singh@arm.com>
> ---
> Changes in v4:
>  - move documentation to common place for evtchn node in booting.txt
>  - Add comment why we use dt_device_static_evtchn_created()
>  - check if dt_get_parent() returns NULL
>  - fold process_static_evtchn_node() in alloc_static_evtchn()
> Changes in v3:
>  - use device-tree used_by to find the domain id of the evtchn node.
>  - add new static_evtchn_create variable in struct dt_device_node to
>    hold the information if evtchn is already created.
>  - fix minor comments
> Changes in v2:
>  - no change
> ---
>  docs/misc/arm/device-tree/booting.txt |  98 +++++++++++++++++

I have just reviewed the binding, only three minor comments below.
Everything looks good.


>  xen/arch/arm/domain_build.c           | 147 ++++++++++++++++++++++++++
>  xen/arch/arm/include/asm/setup.h      |   1 +
>  xen/arch/arm/setup.c                  |   2 +
>  xen/include/xen/device_tree.h         |  16 +++
>  5 files changed, 264 insertions(+)
> 
> diff --git a/docs/misc/arm/device-tree/booting.txt b/docs/misc/arm/device-tree/booting.txt
> index 1b0dca1454..c8329b73e5 100644
> --- a/docs/misc/arm/device-tree/booting.txt
> +++ b/docs/misc/arm/device-tree/booting.txt
> @@ -382,3 +382,101 @@ device-tree:
>  
>  This will reserve a 512MB region starting at the host physical address
>  0x30000000 to be exclusively used by DomU1.
> +
> +Static Event Channel
> +====================
> +The event channel communication will be established statically between two
> +domains (dom0 and domU also). Event channel connection information between
> +domains will be passed to Xen via the device tree node. The event channel
> +will be created and established in Xen before the domain started. The domain
> +doesn???t need to do any operation to establish a connection. Domain only

doesn't

better to use ASCII if possible


> +needs hypercall EVTCHNOP_send(local port) to send notifications to the
> +remote guest.
> +
> +There is no need to describe the static event channel info in the domU device
> +tree. Static event channels are only useful in fully static configurations,
> +and in those configurations, the domU device tree dynamically generated by Xen
> +is not needed.
> +
> +To enable the event-channel interface for domU guests include the
> +"xen,enhanced = "no-xenstore"" property in the domU Xen device tree node.

double ""


> +
> +Under the "xen,domain" compatible node for domU, there needs to be sub-nodes
> +with compatible "xen,evtchn" that describe the event channel connection
> +between two domUs. For dom0, there needs to be sub-nodes with compatible
> +"xen,evtchn" under the chosen node.
> +
> +The static event channel node has the following properties:
> +
> +- compatible
> +
> +    "xen,evtchn"
> +
> +- xen,evtchn
> +
> +    The property is tuples of two numbers
> +    (local-evtchn link-to-foreign-evtchn) where:
> +
> +    local-evtchn is an integer value that will be used to allocate local port
> +    for a domain to send and receive event notifications to/from the remote
> +    domain. Maximum supported value is 2^17 for FIFO ABI and 4096 for 2L ABI.
> +    It is recommended to use low event channel IDs.
> +
> +    link-to-foreign-evtchn is a single phandle to a remote evtchn to which
> +    local-evtchn will be connected.
> +
> +Example
> +=======
> +
> +chosen {
> +
> +    /* one sub-node per local event channel */

It would be good to say that this is for dom0 in the comment, e.g.:

/* this is for Dom0 */


> +    ec1: evtchn@1 {
> +         compatible = "xen,evtchn-v1";
> +         /* local-evtchn link-to-foreign-evtchn */
> +         xen,evtchn = <0xa &ec2>;
> +    };
> +
> +    domU1 {
> +        compatible = "xen,domain";
> +        #address-cells = <0x2>;
> +        #size-cells = <0x1>;
> +        xen,enhanced = "no-xenstore";
> +
> +        /* one sub-node per local event channel */
> +        ec2: evtchn@2 {
> +            compatible = "xen,evtchn-v1";
> +            /* local-evtchn link-to-foreign-evtchn */
> +            xen,evtchn = <0xa &ec1>;
> +        };
> +
> +        ec3: evtchn@3 {
> +            compatible = "xen,evtchn-v1";
> +            xen,evtchn = <0xb &ec5>;
> +        };
> +
> +        ec4: evtchn@4 {
> +            compatible = "xen,evtchn-v1";
> +            xen,evtchn = <0xc &ec6>;
> +        };
> +    };
> +
> +    domU2 {
> +        compatible = "xen,domain";
> +        #address-cells = <0x2>;
> +        #size-cells = <0x1>;
> +        xen,enhanced = "no-xenstore";
> +
> +        /* one sub-node per local event channel */
> +        ec5: evtchn@5 {
> +            compatible = "xen,evtchn-v1";
> +            /* local-evtchn link-to-foreign-evtchn */
> +            xen,evtchn = <0xb &ec3>;
> +        };
> +
> +        ec6: evtchn@6 {
> +            compatible = "xen,evtchn-v1";
> +            xen,evtchn = <0xd &ec4>;
> +        };
> +    };
> +};

