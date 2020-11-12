Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EBC8E2B0410
	for <lists+xen-devel@lfdr.de>; Thu, 12 Nov 2020 12:41:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.25722.53676 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kdAy8-0003qI-PN; Thu, 12 Nov 2020 11:40:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 25722.53676; Thu, 12 Nov 2020 11:40:48 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kdAy8-0003pt-M7; Thu, 12 Nov 2020 11:40:48 +0000
Received: by outflank-mailman (input) for mailman id 25722;
 Thu, 12 Nov 2020 11:40:46 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=2UFB=ES=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kdAy6-0003pn-HZ
 for xen-devel@lists.xenproject.org; Thu, 12 Nov 2020 11:40:46 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c176a9f9-fb50-402c-b4bb-5db4a57142bd;
 Thu, 12 Nov 2020 11:40:45 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id AD2AEAE95;
 Thu, 12 Nov 2020 11:40:44 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=2UFB=ES=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kdAy6-0003pn-HZ
	for xen-devel@lists.xenproject.org; Thu, 12 Nov 2020 11:40:46 +0000
X-Inumbo-ID: c176a9f9-fb50-402c-b4bb-5db4a57142bd
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id c176a9f9-fb50-402c-b4bb-5db4a57142bd;
	Thu, 12 Nov 2020 11:40:45 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1605181244;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XuwcXG213xTdGdTodiKLD0mDII90UwD8c4iBHrJURdE=;
	b=FAmAkevN9mi3x9x+eR90XYQbWeY444+lrWDaaPDdd7Ep9h4G0mcPd1lnMdy+j4Qx8A7DPL
	dCsGGsCTzx/lZYj9OkOEsxQeQ6NxQWyAeTV70SY8rNz6AedhuxAQ6SLmHx6I4V1d3k6OFF
	IGNdDfVzRiltD/WUz45GJ9P1dPEeSWU=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id AD2AEAE95;
	Thu, 12 Nov 2020 11:40:44 +0000 (UTC)
Subject: Re: [PATCH V2 10/23] xen/mm: Make x86's XENMEM_resource_ioreq_server
 handling common
To: Oleksandr Tyshchenko <olekstysh@gmail.com>
Cc: Julien Grall <julien.grall@arm.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>,
 Ian Jackson <iwj@xenproject.org>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 xen-devel@lists.xenproject.org
References: <1602780274-29141-1-git-send-email-olekstysh@gmail.com>
 <1602780274-29141-11-git-send-email-olekstysh@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <1c9bc1aa-b622-fb8e-e5d5-3e27567354c0@suse.com>
Date: Thu, 12 Nov 2020 12:40:45 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.1
MIME-Version: 1.0
In-Reply-To: <1602780274-29141-11-git-send-email-olekstysh@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 15.10.2020 18:44, Oleksandr Tyshchenko wrote:
> --- a/xen/common/memory.c
> +++ b/xen/common/memory.c
> @@ -30,6 +30,10 @@
>  #include <public/memory.h>
>  #include <xsm/xsm.h>
>  
> +#ifdef CONFIG_IOREQ_SERVER
> +#include <xen/ioreq.h>
> +#endif

Preferably #ifdef-s would not be needed here. If any, they'd better
live in xen/ioreq.h itself then.

> @@ -1045,6 +1049,38 @@ static int acquire_grant_table(struct domain *d, unsigned int id,
>      return 0;
>  }
>  
> +#ifdef CONFIG_IOREQ_SERVER

To limit the number of #ifdef-s, could this be moved ...

> +static int acquire_ioreq_server(struct domain *d,
> +                                unsigned int id,
> +                                unsigned long frame,
> +                                unsigned int nr_frames,
> +                                xen_pfn_t mfn_list[])
> +{

... here such that ...

> @@ -1103,9 +1139,14 @@ static int acquire_resource(
>                                   mfn_list);
>          break;
>  
> +#ifdef CONFIG_IOREQ_SERVER
> +    case XENMEM_resource_ioreq_server:
> +        rc = acquire_ioreq_server(d, xmar.id, xmar.frame, xmar.nr_frames,
> +                                  mfn_list);
> +        break;
> +#endif

... the ones here then can be dropped?

>      default:

Also you'll want to a blank line between the new case statement and
the "default:".

Jan

