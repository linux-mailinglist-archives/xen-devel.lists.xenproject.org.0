Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CD922B044A
	for <lists+xen-devel@lfdr.de>; Thu, 12 Nov 2020 12:48:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.25734.53700 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kdB5o-0004E2-SA; Thu, 12 Nov 2020 11:48:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 25734.53700; Thu, 12 Nov 2020 11:48:44 +0000
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
	id 1kdB5o-0004Dd-P1; Thu, 12 Nov 2020 11:48:44 +0000
Received: by outflank-mailman (input) for mailman id 25734;
 Thu, 12 Nov 2020 11:48:43 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=2UFB=ES=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kdB5n-0004DY-26
 for xen-devel@lists.xenproject.org; Thu, 12 Nov 2020 11:48:43 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a629766d-c4c1-41a6-bf44-c45a77d767ad;
 Thu, 12 Nov 2020 11:48:42 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 77777AC54;
 Thu, 12 Nov 2020 11:48:41 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=2UFB=ES=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kdB5n-0004DY-26
	for xen-devel@lists.xenproject.org; Thu, 12 Nov 2020 11:48:43 +0000
X-Inumbo-ID: a629766d-c4c1-41a6-bf44-c45a77d767ad
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id a629766d-c4c1-41a6-bf44-c45a77d767ad;
	Thu, 12 Nov 2020 11:48:42 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1605181721;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ze8U6I0h6oEwKiD0d7/M+wn/PW2QPVzQJ0CwfPSWjS4=;
	b=lqWeSJRpsjrb0RpFITkgr+loL3yMNWJd23UhlDR2yGcn03Rq7qTHZ/xV9uOag1JqproC+i
	T33Hf+TSDw98/GipOGIuaogQcjOxnat3v/sY/S/thjvmnqY4hNgTtgIfH9212mKkRjqDT8
	eReVKqUAj/F8BuzRA6naeNDHH2wQEdY=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 77777AC54;
	Thu, 12 Nov 2020 11:48:41 +0000 (UTC)
Subject: Re: [PATCH V2 14/23] arm/ioreq: Introduce arch specific bits for
 IOREQ/DM features
To: Oleksandr Tyshchenko <olekstysh@gmail.com>
Cc: Julien Grall <julien.grall@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Paul Durrant <paul@xen.org>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 xen-devel@lists.xenproject.org
References: <1602780274-29141-1-git-send-email-olekstysh@gmail.com>
 <1602780274-29141-15-git-send-email-olekstysh@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <2c36a380-633b-1e3f-3f99-014bc315e75f@suse.com>
Date: Thu, 12 Nov 2020 12:48:42 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.1
MIME-Version: 1.0
In-Reply-To: <1602780274-29141-15-git-send-email-olekstysh@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 15.10.2020 18:44, Oleksandr Tyshchenko wrote:
> --- a/xen/common/ioreq.c
> +++ b/xen/common/ioreq.c
> @@ -18,6 +18,7 @@
>  
>  #include <xen/ctype.h>
>  #include <xen/domain.h>
> +#include <xen/domain_page.h>
>  #include <xen/event.h>
>  #include <xen/init.h>
>  #include <xen/irq.h>

There preferably wouldn't be a need to touch non-Arm code in this
patch. I suppose the added #include could easily be introduced
e.g. while moving the file?

Jan

