Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B5CF2DFC41
	for <lists+xen-devel@lfdr.de>; Mon, 21 Dec 2020 14:17:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.57384.100377 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1krL2f-0006Ke-7R; Mon, 21 Dec 2020 13:16:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 57384.100377; Mon, 21 Dec 2020 13:16:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1krL2f-0006KF-4U; Mon, 21 Dec 2020 13:16:01 +0000
Received: by outflank-mailman (input) for mailman id 57384;
 Mon, 21 Dec 2020 13:15:59 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=DEM5=FZ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1krL2d-0006KA-Ir
 for xen-devel@lists.xenproject.org; Mon, 21 Dec 2020 13:15:59 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 3e98f3e6-2bdd-4595-a9d6-14d67f4a1a83;
 Mon, 21 Dec 2020 13:15:57 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 2BDB6B71A;
 Mon, 21 Dec 2020 13:15:56 +0000 (UTC)
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
X-Inumbo-ID: 3e98f3e6-2bdd-4595-a9d6-14d67f4a1a83
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1608556556; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2TelxR8ifMOk0sGK5DT96UzSJXOJGE9O9ANLZ2XNnZ4=;
	b=aKcUpRmd0X71kF5jwsdGeuUSJJTBzGqnCLkkRTsWat4kwNZDOJ6R/2eR9smQ4Y4y+jJUmT
	83jdYM3QgiAhjti0Ab4tfkEfw42fdRA13Lw5y7gE9yPWc/w4g9ssfiMan2wfb/mt5p6Wq0
	3o81A/z5YxWJiJd6etS395YbpdjwLYE=
Subject: Re: [PATCH] xsm/dummy: harden against speculative abuse
From: Jan Beulich <jbeulich@suse.com>
Cc: Daniel de Graaf <dgdegra@tycho.nsa.gov>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>
References: <34833712-93d9-1b4e-1ebf-9df5ea93d19f@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Message-ID: <75e04672-f516-e068-a743-9046cef77768@suse.com>
Date: Mon, 21 Dec 2020 14:15:55 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <34833712-93d9-1b4e-1ebf-9df5ea93d19f@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 17.12.2020 12:57, Jan Beulich wrote:
> --- a/xen/include/xsm/dummy.h
> +++ b/xen/include/xsm/dummy.h
> @@ -76,20 +76,20 @@ static always_inline int xsm_default_act
>      case XSM_HOOK:
>          return 0;
>      case XSM_TARGET:
> -        if ( src == target )
> +        if ( evaluate_nospec(src == target) )
>          {
>              return 0;
>      case XSM_XS_PRIV:
> -            if ( is_xenstore_domain(src) )
> +            if ( evaluate_nospec(is_xenstore_domain(src)) )
>                  return 0;
>          }
>          /* fall through */
>      case XSM_DM_PRIV:
> -        if ( target && src->target == target )
> +        if ( target && evaluate_nospec(src->target == target) )
>              return 0;
>          /* fall through */
>      case XSM_PRIV:
> -        if ( src->is_privileged )
> +        if ( !is_control_domain(src) )
>              return 0;
>          return -EPERM;

And a stray ! slipped in here. Now fixed.

Jan

