Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 679C5312EAD
	for <lists+xen-devel@lfdr.de>; Mon,  8 Feb 2021 11:16:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.82692.152725 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l93Zt-0005oC-0X; Mon, 08 Feb 2021 10:15:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 82692.152725; Mon, 08 Feb 2021 10:15:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l93Zs-0005nn-Tc; Mon, 08 Feb 2021 10:15:32 +0000
Received: by outflank-mailman (input) for mailman id 82692;
 Mon, 08 Feb 2021 10:15:31 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Nr9D=HK=citrix.com=ross.lagerwall@srs-us1.protection.inumbo.net>)
 id 1l93Zr-0005ni-HK
 for xen-devel@lists.xenproject.org; Mon, 08 Feb 2021 10:15:31 +0000
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c8a0974f-f3b2-47a9-82d8-e22dbd83e620;
 Mon, 08 Feb 2021 10:15:29 +0000 (UTC)
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
X-Inumbo-ID: c8a0974f-f3b2-47a9-82d8-e22dbd83e620
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1612779329;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=qqXwtjOco8fjJeHnQYr5Tm8x0nM5NCab4a40inMqm1A=;
  b=iCG3yLbN0Y6u7/yBdsk+5uTiQWu1hmej61kc/SKEnAoGGcaJTAci4oHW
   KPDVLTqS5iVx1UcTOdZSEzgBb6zZFP4n2k+4RG3OgFYcdmBnn8KcKL+QR
   Wlw7vSSyzVCiZI9InspBaUh8XINmi6glfd2UUwkTygKzAwdDqyfpYLhgz
   w=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: rjLiNJ3vCQ9cpicm4ICWdmqbU0Vr/mR7YGxVzAVJ52hyZBx42ePUyqcKVcg6h7iZihXAwtKnvk
 /u2ugcsHkCr2tjlPPtTnxOG0gr7hIogThvz1V16ht6iY6ej2VQBERCF/JonZUOAMxcv1kmMigu
 t848MnWL4C9XA83gbWwfXTwIC+UvubXumL2q3pImtIFTIMF3nv5XVgU+Y3eWieoOYu+wqvg7aw
 5/aeHo7oBKNfyDvBwrXzr6XxnepobkJpK0X8OPTp9b8GRTuQ0FaGUL8wvw83yykXckovqWbTs8
 NP0=
X-SBRS: 5.1
X-MesageID: 36787092
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.81,161,1610427600"; 
   d="scan'208";a="36787092"
Subject: Re: [PATCH 2/7] xen/events: don't unmask an event channel when an eoi
 is pending
To: Juergen Gross <jgross@suse.com>, <xen-devel@lists.xenproject.org>,
	<linux-kernel@vger.kernel.org>
CC: Boris Ostrovsky <boris.ostrovsky@oracle.com>, Stefano Stabellini
	<sstabellini@kernel.org>, <stable@vger.kernel.org>, Julien Grall
	<julien@xen.org>
References: <20210206104932.29064-1-jgross@suse.com>
 <20210206104932.29064-3-jgross@suse.com>
From: Ross Lagerwall <ross.lagerwall@citrix.com>
Message-ID: <bdf20a87-5b4d-529e-7028-cea3eeef769b@citrix.com>
Date: Mon, 8 Feb 2021 10:15:31 +0000
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.2
MIME-Version: 1.0
In-Reply-To: <20210206104932.29064-3-jgross@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 2021-02-06 10:49, Juergen Gross wrote:
> An event channel should be kept masked when an eoi is pending for it.
> When being migrated to another cpu it might be unmasked, though.
> 
> In order to avoid this keep two different flags for each event channel
> to be able to distinguish "normal" masking/unmasking from eoi related
> masking/unmasking. The event channel should only be able to generate
> an interrupt if both flags are cleared.
> 
> Cc: stable@vger.kernel.org
> Fixes: 54c9de89895e0a36047 ("xen/events: add a new late EOI evtchn framework")
> Reported-by: Julien Grall <julien@xen.org>
> Signed-off-by: Juergen Gross <jgross@suse.com>
...> +static void lateeoi_ack_dynirq(struct irq_data *data)
> +{
> +	struct irq_info *info = info_for_irq(data->irq);
> +	evtchn_port_t evtchn = info ? info->evtchn : 0;
> +
> +	if (VALID_EVTCHN(evtchn)) {
> +		info->eoi_pending = true;
> +		mask_evtchn(evtchn);
> +	}
> +}

Doesn't this (and the one below) need a call to clear_evtchn() to
actually ack the pending event? Otherwise I can't see what clears
the pending bit.

I tested out this patch but processes using the userspace evtchn device did
not work very well without the clear_evtchn() call.

Ross

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

