Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CA2130872E
	for <lists+xen-devel@lfdr.de>; Fri, 29 Jan 2021 10:01:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.77805.141165 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l5Pes-0003Xp-E9; Fri, 29 Jan 2021 09:01:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 77805.141165; Fri, 29 Jan 2021 09:01:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l5Pes-0003XS-Aw; Fri, 29 Jan 2021 09:01:38 +0000
Received: by outflank-mailman (input) for mailman id 77805;
 Fri, 29 Jan 2021 09:01:36 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Mmvf=HA=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1l5Peq-0003XN-SI
 for xen-devel@lists.xenproject.org; Fri, 29 Jan 2021 09:01:36 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3680fb3f-1371-4f11-be8a-6325123453e2;
 Fri, 29 Jan 2021 09:01:36 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 5BE2BAEAC;
 Fri, 29 Jan 2021 09:01:35 +0000 (UTC)
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
X-Inumbo-ID: 3680fb3f-1371-4f11-be8a-6325123453e2
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1611910895; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=x9a+JK494bDEHpr76KRTuUCKLj45wBeHiIBlvpjxl9s=;
	b=BTEybm4xcksraSL+mDlXIFyy94SSCDy2VZdiV3IE7eC9KycQyS7nq6yowfBqbNGYE9AEVp
	FwD0sPrMvqqzh7D9qGXLV3Ik7X/TN7pCNOxehKTNHtlaDDa3msGgF5R75Dgwt0dwX9+7CZ
	YihgSDtq3PRRw/LvSAn72sZLVNKxhq4=
Subject: Re: [PATCH V6 24/24] xen/ioreq: Make the IOREQ feature selectable on
 Arm
To: Oleksandr Tyshchenko <olekstysh@gmail.com>
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
References: <1611884932-1851-1-git-send-email-olekstysh@gmail.com>
 <1611884932-1851-25-git-send-email-olekstysh@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <c9add60d-79e9-684a-4d5a-e3c130c7fa43@suse.com>
Date: Fri, 29 Jan 2021 10:01:36 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <1611884932-1851-25-git-send-email-olekstysh@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 29.01.2021 02:48, Oleksandr Tyshchenko wrote:
> --- a/xen/common/Kconfig
> +++ b/xen/common/Kconfig
> @@ -137,7 +137,13 @@ config HYPFS_CONFIG
>  	  want to hide the .config contents from dom0.
>  
>  config IOREQ_SERVER
> -	bool
> +	bool "IOREQ support (EXPERT)" if EXPERT && !X86
> +	default X86
> +	depends on HVM
> +	---help---
> +	  Enables generic mechanism for providing emulated devices to the guests.
> +
> +	  If unsure, say Y.

I would have given this my ack, if there wasn't this last line.
For an experimental feature, I think any uncertainty should
lead to a suggestion of turning it off, not on? Hence
Acked-by: Jan Beulich <jbeulich@suse.com>
only with this saying N instead of Y.

Jan

