Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EBADF312E83
	for <lists+xen-devel@lfdr.de>; Mon,  8 Feb 2021 11:06:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.82686.152713 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l93Qw-0004ol-3X; Mon, 08 Feb 2021 10:06:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 82686.152713; Mon, 08 Feb 2021 10:06:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l93Qw-0004oM-0M; Mon, 08 Feb 2021 10:06:18 +0000
Received: by outflank-mailman (input) for mailman id 82686;
 Mon, 08 Feb 2021 10:06:16 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ZIyB=HK=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1l93Qu-0004oH-Jp
 for xen-devel@lists.xenproject.org; Mon, 08 Feb 2021 10:06:16 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 74f1ce93-b028-499c-85c6-ef5a5312b4cc;
 Mon, 08 Feb 2021 10:06:14 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 72167ADCD;
 Mon,  8 Feb 2021 10:06:13 +0000 (UTC)
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
X-Inumbo-ID: 74f1ce93-b028-499c-85c6-ef5a5312b4cc
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1612778773; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=m57HtWSnT9lNNo+P6sNLTZYsYuwZK8OejPr+c5tKA0k=;
	b=YMzOBN7u8wu6DufA67/rqYavO42OtrEcVU0jrj2aGc+eEo80i9SGA23JLWUCw6STUqfGY7
	UFg6BMAOIQmKCyCdNRE2hQsOGniljK3XArUoLVHL7yuIcuWB4h1/4OsHuaY/sCZVUZ3j2E
	iGgzdr++IJ8PC0eJtQLBc1eu1UldXZU=
Subject: Re: [PATCH 2/7] xen/events: don't unmask an event channel when an eoi
 is pending
To: Juergen Gross <jgross@suse.com>
Cc: Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Stefano Stabellini <sstabellini@kernel.org>, stable@vger.kernel.org,
 Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org,
 linux-kernel@vger.kernel.org
References: <20210206104932.29064-1-jgross@suse.com>
 <20210206104932.29064-3-jgross@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <7aa76e26-b6f4-fae2-861b-bcc0039ce497@suse.com>
Date: Mon, 8 Feb 2021 11:06:12 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210206104932.29064-3-jgross@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 06.02.2021 11:49, Juergen Gross wrote:
> @@ -1798,6 +1818,29 @@ static void mask_ack_dynirq(struct irq_data *data)
>  	ack_dynirq(data);
>  }
>  
> +static void lateeoi_ack_dynirq(struct irq_data *data)
> +{
> +	struct irq_info *info = info_for_irq(data->irq);
> +	evtchn_port_t evtchn = info ? info->evtchn : 0;
> +
> +	if (VALID_EVTCHN(evtchn)) {
> +		info->eoi_pending = true;
> +		mask_evtchn(evtchn);
> +	}
> +}
> +
> +static void lateeoi_mask_ack_dynirq(struct irq_data *data)
> +{
> +	struct irq_info *info = info_for_irq(data->irq);
> +	evtchn_port_t evtchn = info ? info->evtchn : 0;
> +
> +	if (VALID_EVTCHN(evtchn)) {
> +		info->masked = true;
> +		info->eoi_pending = true;
> +		mask_evtchn(evtchn);
> +	}
> +}
> +
>  static int retrigger_dynirq(struct irq_data *data)
>  {
>  	evtchn_port_t evtchn = evtchn_from_irq(data->irq);
> @@ -2023,8 +2066,8 @@ static struct irq_chip xen_lateeoi_chip __read_mostly = {
>  	.irq_mask		= disable_dynirq,
>  	.irq_unmask		= enable_dynirq,
>  
> -	.irq_ack		= mask_ack_dynirq,
> -	.irq_mask_ack		= mask_ack_dynirq,
> +	.irq_ack		= lateeoi_ack_dynirq,
> +	.irq_mask_ack		= lateeoi_mask_ack_dynirq,
>  
>  	.irq_set_affinity	= set_affinity_irq,
>  	.irq_retrigger		= retrigger_dynirq,
> 

Unlike the prior handler the two new ones don't call ack_dynirq()
anymore, and the description doesn't give a hint towards this
difference. As a consequence, clear_evtchn() also doesn't get
called anymore - patch 3 adds the calls, but claims an older
commit to have been at fault. _If_ ack_dynirq() indeed isn't to
be called here, shouldn't the clear_evtchn() calls get added
right here?

Jan

