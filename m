Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B56C1913EB
	for <lists+xen-devel@lfdr.de>; Tue, 24 Mar 2020 16:12:45 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jGlBS-0003dA-Ov; Tue, 24 Mar 2020 15:09:38 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=hjhq=5J=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1jGlBR-0003d5-RZ
 for xen-devel@lists.xenproject.org; Tue, 24 Mar 2020 15:09:37 +0000
X-Inumbo-ID: 79eeb290-6de1-11ea-b34e-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 79eeb290-6de1-11ea-b34e-bc764e2007e4;
 Tue, 24 Mar 2020 15:09:37 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 42C1FAC22;
 Tue, 24 Mar 2020 15:09:36 +0000 (UTC)
To: Roger Pau Monne <roger.pau@citrix.com>, linux-kernel@vger.kernel.org
References: <20200324150015.50496-1-roger.pau@citrix.com>
 <20200324150015.50496-2-roger.pau@citrix.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <f4ce1d95-c80a-8727-7ddc-9199bb2036c4@suse.com>
Date: Tue, 24 Mar 2020 16:09:35 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200324150015.50496-2-roger.pau@citrix.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Subject: Re: [Xen-devel] [PATCH 2/2] xen: enable BALLOON_MEMORY_HOTPLUG by
 default
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: xen-devel@lists.xenproject.org,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Ian Jackson <ian.jackson@eu.citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 24.03.20 16:00, Roger Pau Monne wrote:
> Without it a PVH dom0 is mostly useless, as it would balloon down huge
> amounts of RAM in order get physical address space to map foreign
> memory and grants, ultimately leading to an out of memory situation.
> 
> Such option is also needed for HVM or PVH driver domains, since they
> also require mapping grants into physical memory regions.
> 
> Suggested-by: Ian Jackson <ian.jackson@eu.citrix.com>
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> ---
> Cc: Boris Ostrovsky <boris.ostrovsky@oracle.com>
> Cc: Juergen Gross <jgross@suse.com>
> Cc: Stefano Stabellini <sstabellini@kernel.org>
> Cc: xen-devel@lists.xenproject.org
> ---
>   drivers/xen/Kconfig | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/xen/Kconfig b/drivers/xen/Kconfig
> index 57ddd6f4b729..c344bcffd89d 100644
> --- a/drivers/xen/Kconfig
> +++ b/drivers/xen/Kconfig
> @@ -13,6 +13,7 @@ config XEN_BALLOON
>   config XEN_BALLOON_MEMORY_HOTPLUG
>   	bool "Memory hotplug support for Xen balloon driver"
>   	depends on XEN_BALLOON && MEMORY_HOTPLUG
> +	default y
>   	help
>   	  Memory hotplug support for Xen balloon driver allows expanding memory
>   	  available for the system above limit declared at system startup.
> 

Another variant would be to set: default XEN_BACKEND

This would match the reasoning for switching it on.

Either way would be fine with me, so you can add

Reviewed-by: Juergen Gross <jgross@suse.com>


Juergen

