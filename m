Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DE5943D04B
	for <lists+xen-devel@lfdr.de>; Wed, 27 Oct 2021 20:08:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.217166.377046 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mfnKO-0005YA-2N; Wed, 27 Oct 2021 18:07:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 217166.377046; Wed, 27 Oct 2021 18:07:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mfnKN-0005W9-VX; Wed, 27 Oct 2021 18:07:07 +0000
Received: by outflank-mailman (input) for mailman id 217166;
 Wed, 27 Oct 2021 18:07:06 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1mfnKM-0005Vn-ND
 for xen-devel@lists.xenproject.org; Wed, 27 Oct 2021 18:07:06 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mfnKL-0001Iq-FZ; Wed, 27 Oct 2021 18:07:05 +0000
Received: from [54.239.6.185] (helo=[192.168.29.96])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mfnKL-0004Ni-8M; Wed, 27 Oct 2021 18:07:05 +0000
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
	bh=cSAsLeSYfMVI+YiyzBjCtswDKla10wlmd6gbsDtBuvA=; b=nuBEaXaEIPs2lUHFquNs8ztckm
	OAHbdgJAXv2WGrRrKUQt9kn7WSLP228sN17tnJvPUTg/gbKA+qbjZSyiFYC73VA3Y2VV4xvZvzzdl
	3bHt0jc5vKFJm9I+rXbIGkzNDTNUFvqs3RS0A97ynM7Z2XhoNw18Ome4s/cjEulJ4EYQ=;
Message-ID: <7a97bbef-68a9-8f52-0c93-88d4e84a07fc@xen.org>
Date: Wed, 27 Oct 2021 19:07:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.2.1
Subject: Re: [PATCH] xen/arm: do not try to add pci-domain for disabled
 devices
To: Oleksandr Andrushchenko <andr2000@gmail.com>,
 xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org, iwj@xenproject.org, bertrand.marquis@arm.com,
 rahul.singh@arm.com,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
References: <20211027083730.1406947-1-andr2000@gmail.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20211027083730.1406947-1-andr2000@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Oleksandr,

On 27/10/2021 09:37, Oleksandr Andrushchenko wrote:
> From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> 
> If a PCI host bridge device is present in the device tree, but is
> disabled, then its PCI host bridge driver was not instantiated.
> This results in the following panic during Xen start:
> 
> (XEN) Device tree generation failed (-22).

It would good to clarify in the commit message where the error is coming 
from. I think this is from pci_get_host_bridge_segment().

> (XEN)
> (XEN) ****************************************
> (XEN) Panic on CPU 0:
> (XEN) Could not set up DOM0 guest OS
> (XEN) ****************************************
> 
> Fix this by not adding linux,pci-domain property for hwdom if it is
> neither available nor device enabled.
 From my reading of the binding [1], the property should be present in 
all the hostbridges if one specify it. IOW, I think the property should 
also be added for hostbridges that are not available.

AFAICT, Linux will ignore hostbridge that are not available. But it 
feels to me we are twisting the rule. So, could we consider to allocate 
an unused number?

> 
> Fixes: 4cfab4425d39 ("xen/arm: Add linux,pci-domain property for hwdom if not available.")
> 
> Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> ---
>   xen/arch/arm/domain_build.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
> index 124ade09123a..beeecf84a209 100644
> --- a/xen/arch/arm/domain_build.c
> +++ b/xen/arch/arm/domain_build.c
> @@ -747,7 +747,8 @@ static int __init write_properties(struct domain *d, struct kernel_info *kinfo,
>               return res;
>       }
>   
> -    if ( is_pci_passthrough_enabled() && dt_device_type_is_equal(node, "pci") )
> +    if ( is_pci_passthrough_enabled() && dt_device_type_is_equal(node, "pci") &&
 From my understanding, PCI device described in the DT would also have 
'type="pci"'. So we would also return an error because we don't have a 
corresponding hostbridge.

I think this check should be replaced with device_get_class(node) == 
DEVICE_PCI (confusingly DEVICE_PCI indicates that this is an 
hostbridge...). Although, I would consider to pass the device class as a 
parameter of write_properties() to avoid calling device_class() multiple 
time (it is already used twice in handle_node()).

I am aware this is not a bug introduced by your patch, but I think this 
should be dealt in this patch as well.

> +         dt_device_is_available(node) )

Shouldn't you also check that the hostbridge wasn't passthrough-ed?

>       {
>           if ( !dt_find_property(node, "linux,pci-domain", NULL) )
>           {
> 

Cheers,

[1] Documentation/devicetree/bindings/pci/pci.txt

-- 
Julien Grall

