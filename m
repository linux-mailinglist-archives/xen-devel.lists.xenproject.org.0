Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ED4A1302357
	for <lists+xen-devel@lfdr.de>; Mon, 25 Jan 2021 10:44:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.73948.132909 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l3yQO-0003Y3-P9; Mon, 25 Jan 2021 09:44:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 73948.132909; Mon, 25 Jan 2021 09:44:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l3yQO-0003Xe-LP; Mon, 25 Jan 2021 09:44:44 +0000
Received: by outflank-mailman (input) for mailman id 73948;
 Mon, 25 Jan 2021 09:44:42 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=dw2F=G4=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1l3yQM-0003XV-Ro
 for xen-devel@lists.xenproject.org; Mon, 25 Jan 2021 09:44:42 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6530081f-0868-4595-b46b-b363b857af2e;
 Mon, 25 Jan 2021 09:44:42 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 4CA64AD19;
 Mon, 25 Jan 2021 09:44:41 +0000 (UTC)
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
X-Inumbo-ID: 6530081f-0868-4595-b46b-b363b857af2e
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1611567881; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kmutQNT6P4IQfGow+njNk6cGVpt/ANTYl00Zk71VsbU=;
	b=T8xzIlmug+hV+PEdu/Soo0m9GzDyKBBYObR4wg0tEzq/LZYTP3xqO8w8xREIBlT04dE6qX
	eiU9ME7kKBxHxTcJBkF7O0qw9qv2LAzlAIu2i380t+7irzrSRjekfmeH7VvBrFGb09crAY
	ytYaT4ifgxvi6VbhmmJIQhL8oTPOq7M=
Subject: Re: [PATCH v3] xen: EXPERT clean-up and introduce UNSUPPORTED
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Stefano Stabellini <stefano.stabellini@xilinx.com>,
 andrew.cooper3@citrix.com, george.dunlap@citrix.com, iwj@xenproject.org,
 julien@xen.org, wl@xen.org, Bertrand.Marquis@arm.com,
 xen-devel@lists.xenproject.org
References: <20210123021950.1270-1-sstabellini@kernel.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <e4a5cba7-6101-1e4b-199b-d1a01d65da9a@suse.com>
Date: Mon, 25 Jan 2021 10:44:40 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <20210123021950.1270-1-sstabellini@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 23.01.2021 03:19, Stefano Stabellini wrote:
> --- a/xen/Kconfig
> +++ b/xen/Kconfig
> @@ -34,8 +34,15 @@ config DEFCONFIG_LIST
>  	option defconfig_list
>  	default ARCH_DEFCONFIG
>  
> +config UNSUPPORTED
> +	bool "Configure UNSUPPORTED features"
> +	help
> +	  This option allows certain unsupported Xen options to be changed,
> +	  which includes non-security-supported, experimental, and tech
> +	  preview features as defined by SUPPORT.md.

And by implication anything not depending on UNSUPPORTED is
supported? I didn't think this was the case (some unsupported
code can't even be turned off via Kconfig), so I think this
needs clarifying here, so we won't end up with people
considering some feature supported which really isn't. That's
irrespective of the reference to SUPPORT.md.

>  config EXPERT
> -	bool "Configure standard Xen features (expert users)"
> +	bool "Configure EXPERT features"
>  	help
>  	  This option allows certain base Xen options and settings
>  	  to be disabled or tweaked. This is for specialized environments

I'd like to suggest to move UNSUPPORTED past this one, to
then have that have "default EXPERT".

Jan

