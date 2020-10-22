Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 92C002959B7
	for <lists+xen-devel@lfdr.de>; Thu, 22 Oct 2020 09:56:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.10229.27140 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kVVS4-0008WI-8v; Thu, 22 Oct 2020 07:56:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 10229.27140; Thu, 22 Oct 2020 07:56:00 +0000
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
	id 1kVVS4-0008Vt-5c; Thu, 22 Oct 2020 07:56:00 +0000
Received: by outflank-mailman (input) for mailman id 10229;
 Thu, 22 Oct 2020 07:55:59 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Z30Q=D5=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kVVS3-0008Vl-C5
 for xen-devel@lists.xenproject.org; Thu, 22 Oct 2020 07:55:59 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 517bff5a-cd4b-4b45-97a4-5fcc121826fb;
 Thu, 22 Oct 2020 07:55:58 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id A1670AC5F;
 Thu, 22 Oct 2020 07:55:57 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=Z30Q=D5=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kVVS3-0008Vl-C5
	for xen-devel@lists.xenproject.org; Thu, 22 Oct 2020 07:55:59 +0000
X-Inumbo-ID: 517bff5a-cd4b-4b45-97a4-5fcc121826fb
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 517bff5a-cd4b-4b45-97a4-5fcc121826fb;
	Thu, 22 Oct 2020 07:55:58 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1603353357;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=G1L1K+pLqf/UxGfuaoyoFjDiUcEiA4in4XnRyEgIr6g=;
	b=FTrImu4mPRJ6yrUt8DRnKbFPZn3OKJMXN4t/VfmJl5iw4jUj2yc3ObrXiULkDBTrT9+sJp
	wXtdVda1Cy74dr+SDvRITBJ/De2Wmd09N6dS2bZbCJ/pX4VSxaHsL88ufPD7r32lZ9H2IP
	KdGhBNfXNQ3fig/9Qz/FRuHOM65myAk=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id A1670AC5F;
	Thu, 22 Oct 2020 07:55:57 +0000 (UTC)
Subject: Re: [PATCH 4/5] xen/events: unmask a fifo event channel only if it
 was masked
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <20201022074214.21693-1-jgross@suse.com>
 <20201022074214.21693-5-jgross@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <e6dcce7e-acfb-0ca1-8ff1-e303932bc3c5@suse.com>
Date: Thu, 22 Oct 2020 09:55:58 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.1
MIME-Version: 1.0
In-Reply-To: <20201022074214.21693-5-jgross@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 22.10.2020 09:42, Juergen Gross wrote:
> --- a/drivers/xen/events/events_fifo.c
> +++ b/drivers/xen/events/events_fifo.c
> @@ -236,6 +236,9 @@ static bool clear_masked_cond(volatile event_word_t *word)
>  
>  	w = *word;
>  
> +	if (!(w & (1 << EVTCHN_FIFO_MASKED)))
> +		return true;

Maybe better move this ...

>  	do {
>  		if (w & (1 << EVTCHN_FIFO_PENDING))
>  			return false;
> 

... into the loop, above this check?

Jan

