Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CE8E6295CC2
	for <lists+xen-devel@lfdr.de>; Thu, 22 Oct 2020 12:36:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.10354.27558 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kVXwk-00026l-AN; Thu, 22 Oct 2020 10:35:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 10354.27558; Thu, 22 Oct 2020 10:35:50 +0000
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
	id 1kVXwk-00026M-6u; Thu, 22 Oct 2020 10:35:50 +0000
Received: by outflank-mailman (input) for mailman id 10354;
 Thu, 22 Oct 2020 10:35:49 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Z30Q=D5=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kVXwj-00026H-0f
 for xen-devel@lists.xenproject.org; Thu, 22 Oct 2020 10:35:49 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ea524d12-ac89-4094-a9af-81b397cbd866;
 Thu, 22 Oct 2020 10:35:48 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 6BDE9ACF6;
 Thu, 22 Oct 2020 10:35:47 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=Z30Q=D5=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kVXwj-00026H-0f
	for xen-devel@lists.xenproject.org; Thu, 22 Oct 2020 10:35:49 +0000
X-Inumbo-ID: ea524d12-ac89-4094-a9af-81b397cbd866
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id ea524d12-ac89-4094-a9af-81b397cbd866;
	Thu, 22 Oct 2020 10:35:48 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1603362947;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7bj/gkiOtWxRriaas+Eg9fuSwfNM6Cn6VTUSXRtCPkU=;
	b=dZ2Bu4biyrSPNNa7TM1ZJ0TcOD4E9BZzt8z0SvvC2XdLwKtL1Q9Nj/ysADaaUau6dX8zlB
	zfXGYESxigbwEczzRNm+fnJVYsNBXnQzuaGwUT9jDDTW4dxdaLbY7bJhtczMRUpPV+GZqU
	r/mqRlp38QBpwr/sgWd4PIggZxgleb4=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 6BDE9ACF6;
	Thu, 22 Oct 2020 10:35:47 +0000 (UTC)
Subject: Re: [PATCH v2 3/5] xen/events: only register debug interrupt for
 2-level events
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org, x86@kernel.org,
 linux-kernel@vger.kernel.org, Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, "H. Peter Anvin" <hpa@zytor.com>
References: <20201022094907.28560-1-jgross@suse.com>
 <20201022094907.28560-4-jgross@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <1de24e42-6cb7-4ecb-0eb2-c4a15dc8afc9@suse.com>
Date: Thu, 22 Oct 2020 12:35:47 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.1
MIME-Version: 1.0
In-Reply-To: <20201022094907.28560-4-jgross@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 22.10.2020 11:49, Juergen Gross wrote:
> @@ -2080,10 +2080,12 @@ void __init xen_init_IRQ(void)
>  	int ret = -EINVAL;
>  	evtchn_port_t evtchn;
>  
> -	if (fifo_events)
> +	if (xen_fifo_events)
>  		ret = xen_evtchn_fifo_init();
> -	if (ret < 0)
> +	if (ret < 0) {
>  		xen_evtchn_2l_init();
> +		xen_fifo_events = false;
> +	}

Another note: While it may not matter right here, maybe better
first set the variable and the call the function?

Jan

