Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 419162C66D0
	for <lists+xen-devel@lfdr.de>; Fri, 27 Nov 2020 14:27:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.39324.72184 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kidmb-00089d-W6; Fri, 27 Nov 2020 13:27:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 39324.72184; Fri, 27 Nov 2020 13:27:29 +0000
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
	id 1kidmb-00089E-SV; Fri, 27 Nov 2020 13:27:29 +0000
Received: by outflank-mailman (input) for mailman id 39324;
 Fri, 27 Nov 2020 13:27:28 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=rmeX=FB=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kidma-000899-B4
 for xen-devel@lists.xenproject.org; Fri, 27 Nov 2020 13:27:28 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 75cadbde-4305-485a-804a-48616b6f99ad;
 Fri, 27 Nov 2020 13:27:27 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id BB492ABD7;
 Fri, 27 Nov 2020 13:27:26 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=rmeX=FB=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kidma-000899-B4
	for xen-devel@lists.xenproject.org; Fri, 27 Nov 2020 13:27:28 +0000
X-Inumbo-ID: 75cadbde-4305-485a-804a-48616b6f99ad
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 75cadbde-4305-485a-804a-48616b6f99ad;
	Fri, 27 Nov 2020 13:27:27 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1606483646; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=51EYpbdjdC+tNeKD+XfzFsK9Ys9IXmbL6xmukn3jCoQ=;
	b=WbWLvy72YS3uNoBw5PSbszdpDrKCHuXCKw06hQcm3F71o3TD3K3MbLFTzZxQa7XRzWVEgu
	wwmhGk4f1x07/3p4lcPr6H1YVZs6YyRSHKRjPvBp2fauud6jnAujeu4MxrQ/fit0Z2qQO1
	qdC98JaLWBb+zdYjIk35vhxlk7zksbw=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id BB492ABD7;
	Fri, 27 Nov 2020 13:27:26 +0000 (UTC)
Subject: Re: [PATCH v8 3/3] xen/events: do some cleanups in
 evtchn_fifo_set_pending()
To: Juergen Gross <jgross@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
References: <20201125105122.3650-1-jgross@suse.com>
 <20201125105122.3650-4-jgross@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <dc81e650-166f-99c2-0982-58c0b89c1eb4@suse.com>
Date: Fri, 27 Nov 2020 14:27:27 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20201125105122.3650-4-jgross@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 25.11.2020 11:51, Juergen Gross wrote:
> --- a/xen/common/event_fifo.c
> +++ b/xen/common/event_fifo.c
> @@ -175,6 +175,18 @@ static void evtchn_fifo_set_pending(struct vcpu *v, struct evtchn *evtchn)
>          return;
>      }
>  
> +    /*
> +     * Control block not mapped.  The guest must not unmask an
> +     * event until the control block is initialized, so we can
> +     * just drop the event.
> +     */
> +    if ( unlikely(!v->evtchn_fifo->control_block) )
> +    {
> +        printk(XENLOG_G_WARNING
> +               "%pv has no FIFO event channel control block\n", v);
> +        return;
> +    }

This results in bypassing the setting of PENDING and the possible
call to evtchn_check_pollers(). It may in particular be the case
that a very special purpose guest uses event channels just for
waking up pollers, which - afaict - then doesn't require setting
up a control block. To give an example, I could easily see an XTF
test avoid that step if indeed it's unnecessary.

Jan

