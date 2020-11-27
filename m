Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 96E352C67CB
	for <lists+xen-devel@lfdr.de>; Fri, 27 Nov 2020 15:23:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.39472.72391 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kieeQ-0007ES-P7; Fri, 27 Nov 2020 14:23:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 39472.72391; Fri, 27 Nov 2020 14:23:06 +0000
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
	id 1kieeQ-0007E5-M2; Fri, 27 Nov 2020 14:23:06 +0000
Received: by outflank-mailman (input) for mailman id 39472;
 Fri, 27 Nov 2020 14:23:05 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1kieeO-0007E0-Vy
 for xen-devel@lists.xenproject.org; Fri, 27 Nov 2020 14:23:05 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kieeM-00062k-Ry; Fri, 27 Nov 2020 14:23:02 +0000
Received: from [54.239.6.185] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kieeM-0008KW-Iw; Fri, 27 Nov 2020 14:23:02 +0000
Received: from mail.xenproject.org ([104.130.215.37])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <julien@xen.org>)
	id 1kieeO-0007E0-Vy
	for xen-devel@lists.xenproject.org; Fri, 27 Nov 2020 14:23:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=KAlWNWKzU90CqokCU2i7K0T5BS0bM4FllDwjHF8xgck=; b=Y3geBysZnrdjanTwdzUj8x594A
	8cdeVJMYxQJPJkkYSUFBY9nxSp0oL1AaLRaX/csYcDsD6/WTbYY50YYcyKBaDndtJEskC8WAyXvHi
	zgyOTahx420DM/uir5r2I5X87lbclaRCv9PruYmXJ9NX0p+aLc8KEsHofC1VeCdOaA/8=;
Received: from xenbits.xenproject.org ([104.239.192.120])
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <julien@xen.org>)
	id 1kieeM-00062k-Ry; Fri, 27 Nov 2020 14:23:02 +0000
Received: from [54.239.6.185] (helo=a483e7b01a66.ant.amazon.com)
	by xenbits.xenproject.org with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.92)
	(envelope-from <julien@xen.org>)
	id 1kieeM-0008KW-Iw; Fri, 27 Nov 2020 14:23:02 +0000
Subject: Re: [PATCH v8 3/3] xen/events: do some cleanups in
 evtchn_fifo_set_pending()
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Jan Beulich <jbeulich@suse.com>, Stefano Stabellini
 <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <20201125105122.3650-1-jgross@suse.com>
 <20201125105122.3650-4-jgross@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <0ab6f8b5-1a9a-845e-3935-a660e5c7fc16@xen.org>
Date: Fri, 27 Nov 2020 14:23:00 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20201125105122.3650-4-jgross@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit



On 25/11/2020 10:51, Juergen Gross wrote:
> evtchn_fifo_set_pending() can be simplified a little bit.

The commit message is quite light... For posterity, it would be good to 
explain why the simplication can be done. In particular, there is a 
chance in behavior after this patch.

> Suggested-by: Jan Beulich <jbeulich@suse.com>
> Signed-off-by: Juergen Gross <jgross@suse.com>
> ---
> V8:
> - new patch
> ---
>   xen/common/event_fifo.c | 34 +++++++++++++++-------------------
>   1 file changed, 15 insertions(+), 19 deletions(-)
> 
> diff --git a/xen/common/event_fifo.c b/xen/common/event_fifo.c
> index 443593c3b3..77609539b1 100644
> --- a/xen/common/event_fifo.c
> +++ b/xen/common/event_fifo.c
> @@ -175,6 +175,18 @@ static void evtchn_fifo_set_pending(struct vcpu *v, struct evtchn *evtchn)
>           return;
>       }
>   
> +    /*
> +     * Control block not mapped.  The guest must not unmask an
> +     * event until the control block is initialized, so we can
> +     * just drop the event.
> +     */
> +    if ( unlikely(!v->evtchn_fifo->control_block) )

Sort of unrelated, AFAICT, v->evtchn_fifo->control_block can be set 
concurrently to this access.

Thankfully, once the control block is mapped, it can't be unmapped. 
However, there is still a possibility that you may see half of the update.

Shouldn't the field access with ACCESS_ONCE()?

Cheers,

-- 
Julien Grall

