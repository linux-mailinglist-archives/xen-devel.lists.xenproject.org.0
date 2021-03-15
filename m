Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EB9133AC60
	for <lists+xen-devel@lfdr.de>; Mon, 15 Mar 2021 08:37:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.97853.185647 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lLhmt-00037g-SM; Mon, 15 Mar 2021 07:37:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 97853.185647; Mon, 15 Mar 2021 07:37:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lLhmt-00037H-Od; Mon, 15 Mar 2021 07:37:15 +0000
Received: by outflank-mailman (input) for mailman id 97853;
 Mon, 15 Mar 2021 07:37:14 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=EzTP=IN=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lLhms-00037C-Sj
 for xen-devel@lists.xenproject.org; Mon, 15 Mar 2021 07:37:14 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e8cfad8d-de6c-4f00-8c58-fbb4102dd47d;
 Mon, 15 Mar 2021 07:37:12 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id CAB97AC24;
 Mon, 15 Mar 2021 07:37:11 +0000 (UTC)
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
X-Inumbo-ID: e8cfad8d-de6c-4f00-8c58-fbb4102dd47d
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1615793831; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bwd78NaMBJS1pn9tcLaXpIpPWKUE776gW0YAJW/t+Yk=;
	b=HQ6xkqgGon5mqpq4I81sK13FaiDhr6PWnDuWvv/qg++DeW89kVk64UUHd5PgF+/WfnBTyh
	bMGBrlYI8mUF39pTDQI7MxDCORBZUTfqpwASd68vNDiHyg481Mm1HblHmk1sbvtOqf+FNv
	5cb2z83UhR/DcGG039aP/sx+oqtchDU=
Subject: Re: [PATCH v6] arm: Add Kconfig entry to select CONFIG_DTB_FILE
To: Michal Orzel <michal.orzel@arm.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Wei Liu <wl@xen.org>, bertrand.marquis@arm.com,
 xen-devel@lists.xenproject.org
References: <20210315065129.27036-1-michal.orzel@arm.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <3b6a5707-881c-7b85-84bf-ff75134b9738@suse.com>
Date: Mon, 15 Mar 2021 08:37:10 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210315065129.27036-1-michal.orzel@arm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 15.03.2021 07:51, Michal Orzel wrote:
> --- a/xen/common/Kconfig
> +++ b/xen/common/Kconfig
> @@ -400,6 +400,14 @@ config DOM0_MEM
>  
>  	  Leave empty if you are not sure what to specify.
>  
> +config DTB_FILE
> +	string "Absolute path to device tree blob"
> +	depends on HAS_DEVICE_TREE
> +	help
> +	  When using a bootloader that has no device tree support or when there
> +	  is no bootloader at all, use this option to specify the absolute path
> +	  to a device tree that will be linked directly inside Xen binary.

I'm sorry, it should have occurred to me earlier to ask, but: Shouldn't
this text make explicit that this is an optional setting and hence
leaving blank is generally okay? I.e. something along the lines of
what is visible in context above from the prior setting?

Jan

