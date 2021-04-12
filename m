Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C6B735C1A1
	for <lists+xen-devel@lfdr.de>; Mon, 12 Apr 2021 11:33:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.108848.207674 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lVsvt-0008Ne-3C; Mon, 12 Apr 2021 09:32:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 108848.207674; Mon, 12 Apr 2021 09:32:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lVsvs-0008NF-W3; Mon, 12 Apr 2021 09:32:36 +0000
Received: by outflank-mailman (input) for mailman id 108848;
 Mon, 12 Apr 2021 09:32:35 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=q596=JJ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lVsvq-0008N7-Ut
 for xen-devel@lists.xenproject.org; Mon, 12 Apr 2021 09:32:34 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 0f54a19c-bcbe-4619-9ccd-cbc6889fc2cb;
 Mon, 12 Apr 2021 09:32:32 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id B5596ADEF;
 Mon, 12 Apr 2021 09:32:31 +0000 (UTC)
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
X-Inumbo-ID: 0f54a19c-bcbe-4619-9ccd-cbc6889fc2cb
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1618219951; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CBVcOn6GQILGvpSxp1eSO7e3QR8CMork2o3bt5+Cxqk=;
	b=p+hRJwe72lde5snqRN9HTVfSXAbmCfWVNoQl7HQ4F5upKBiYAVoleyzpaZLsBMGmEkHkHZ
	jXOMCOgY09Ch0N2AlplgnMqQmniZGmcTvVdhDwspt/7jdEuyvv+bVhBHy9hDWVdkdH3Dhk
	59eOtymd7VMZSctnP7eVpACmqH70P8k=
Subject: Re: [PATCH] xen/events: fix setting irq affinity
To: Juergen Gross <jgross@suse.com>
Cc: Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org,
 stable@vger.kernel.org
References: <20210412062845.13946-1-jgross@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <38b2b47d-a77a-9d02-3034-f1c4d03ffdd5@suse.com>
Date: Mon, 12 Apr 2021 11:32:32 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <20210412062845.13946-1-jgross@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 12.04.2021 08:28, Juergen Gross wrote:
> The backport of upstream patch 25da4618af240fbec61 ("xen/events: don't
> unmask an event channel when an eoi is pending") introduced a
> regression for stable kernels 5.10 and older: setting IRQ affinity for
> IRQs related to interdomain events would no longer work, as moving the
> IRQ to its new cpu was not included in the irq_ack callback for those
> events.
> 
> Fix that by adding the needed call.
> 
> Note that kernels 5.11 and later don't need the explicit moving of the
> IRQ to the target cpu in the irq_ack callback, due to a rework of the
> affinity setting in kernel 5.11.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>
> ---
> This patch should be applied to all stable kernel branches up to
> (including) linux-5.10.y, where upstream patch 25da4618af240fbec61 has
> been added.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>

This looks functionally correct to me, so:
Reviewed-by: Jan Beulich <jbeulich@suse.com>

But I have remarks / questions:

> --- a/drivers/xen/events/events_base.c
> +++ b/drivers/xen/events/events_base.c
> @@ -1809,7 +1809,7 @@ static void lateeoi_ack_dynirq(struct irq_data *data)
>  
>  	if (VALID_EVTCHN(evtchn)) {
>  		do_mask(info, EVT_MASK_REASON_EOI_PENDING);
> -		event_handler_exit(info);
> +		ack_dynirq(data);
>  	}
>  }
>  
> @@ -1820,7 +1820,7 @@ static void lateeoi_mask_ack_dynirq(struct irq_data *data)
>  
>  	if (VALID_EVTCHN(evtchn)) {
>  		do_mask(info, EVT_MASK_REASON_EXPLICIT);
> -		event_handler_exit(info);
> +		ack_dynirq(data);
>  	}
>  }
>  

Can EVT_MASK_REASON_EOI_{PENDING,EXPLICIT} be cleared in a way racing
event_handler_exit() and (if it was called directly from here)
irq_move_masked_irq()? If not, the extra do_mask() / do_unmask() pair
(granted living on an "unlikely" path) could be avoided.

Even leaving aside the extra overhead in ack_dynirq()'s unlikely code
path, there's now some extra (redundant) processing. I guess this is
assumed to be within noise?

Possibly related, but first of all seeing the redundancy between
eoi_pirq() and ack_dynirq(): Wouldn't it make sense to break out the
common part into a helper? (Really the former could simply call the
latter as it seems.)

Jan

