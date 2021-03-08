Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CCD3B330AC0
	for <lists+xen-devel@lfdr.de>; Mon,  8 Mar 2021 11:01:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.94761.178429 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lJCh5-0006v9-3r; Mon, 08 Mar 2021 10:00:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 94761.178429; Mon, 08 Mar 2021 10:00:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lJCh5-0006uj-0T; Mon, 08 Mar 2021 10:00:55 +0000
Received: by outflank-mailman (input) for mailman id 94761;
 Mon, 08 Mar 2021 10:00:54 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=mI6H=IG=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lJCh4-0006ud-Cf
 for xen-devel@lists.xenproject.org; Mon, 08 Mar 2021 10:00:54 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ae46403a-4bbe-49f8-b85e-df41e2c4765d;
 Mon, 08 Mar 2021 10:00:53 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 8C379ACBF;
 Mon,  8 Mar 2021 10:00:52 +0000 (UTC)
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
X-Inumbo-ID: ae46403a-4bbe-49f8-b85e-df41e2c4765d
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1615197652; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Q2SIrA5XRpg/FSGgWjrQL2AxlwffylmbxFH/5gTIJiw=;
	b=ZkcK1RoQsaA7SGrxo9qYdY+HsX+6fa5Ndi+pa711L6G17rfyHZep/xQG503W8HXOUX5yVa
	muWVBQMUt5Yd2AkkDsbeL7oDVDFIpgcuGrpXL56/u8oZceyQ1XEHzfTKx8zUuqn8OqyomH
	Qkea6Gg/zB3ekwmSohapUM8LjWEDJ+o=
Subject: Re: [PATCH] arm: Add Kconfig entry to select CONFIG_DTB_FILE
To: Michal Orzel <michal.orzel@arm.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Wei Liu <wl@xen.org>, bertrand.marquis@arm.com, wei.chen@arm.com,
 xen-devel@lists.xenproject.org
References: <20210308095233.13329-1-michal.orzel@arm.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <3709714b-6627-3c66-b8ca-4cb9c59df83b@suse.com>
Date: Mon, 8 Mar 2021 11:00:51 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210308095233.13329-1-michal.orzel@arm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 08.03.2021 10:52, Michal Orzel wrote:
> --- a/xen/common/Kconfig
> +++ b/xen/common/Kconfig
> @@ -400,6 +400,20 @@ config DOM0_MEM
>  
>  	  Leave empty if you are not sure what to specify.
>  
> +config LINK_DTB
> +	bool "Link DTB into Xen image"
> +	depends on ARM
> +	default n

I don't think this last line is needed.

> +config DTB_FILE
> +	string "Absolute path to device tree blob"
> +	default ""
> +	depends on LINK_DTB
> +	---help---
> +	  When using a bootloader that has no device tree support or when there
> +	  is no bootloader at all, use this option to specify the absolute path
> +	  to a device tree that will be linked directly inside Xen binary.

How is selecting LINK_DTB but leaving DTB_FILE at an empty string
different from not having a LINK_DTB setting at all?

Jan

