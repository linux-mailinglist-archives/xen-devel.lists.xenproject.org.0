Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B30B5295FA1
	for <lists+xen-devel@lfdr.de>; Thu, 22 Oct 2020 15:18:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.10429.27712 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kVaTa-0001RJ-OU; Thu, 22 Oct 2020 13:17:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 10429.27712; Thu, 22 Oct 2020 13:17:54 +0000
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
	id 1kVaTa-0001Qu-LG; Thu, 22 Oct 2020 13:17:54 +0000
Received: by outflank-mailman (input) for mailman id 10429;
 Thu, 22 Oct 2020 13:17:53 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Z30Q=D5=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kVaTZ-0001Qp-OT
 for xen-devel@lists.xenproject.org; Thu, 22 Oct 2020 13:17:53 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 42b9b724-3785-4a91-a4ff-79ba6fac635a;
 Thu, 22 Oct 2020 13:17:52 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 0FCABAE35;
 Thu, 22 Oct 2020 13:17:52 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=Z30Q=D5=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kVaTZ-0001Qp-OT
	for xen-devel@lists.xenproject.org; Thu, 22 Oct 2020 13:17:53 +0000
X-Inumbo-ID: 42b9b724-3785-4a91-a4ff-79ba6fac635a
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 42b9b724-3785-4a91-a4ff-79ba6fac635a;
	Thu, 22 Oct 2020 13:17:52 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1603372672;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=q3XLuJAiAJI40OqF2MlzN6uIGy9R9OJtoodmMnAlqVA=;
	b=R/lMCrLLsJ9oxMG8VYEjoj5XbtqmyCxxnkVfZT529iQ9EyrPI8NQo9Ft0fvftXIwPN/QRw
	WuR6R+i/DjPdKXhmnkCtsIeWGL+zxgLuHolPEnxjO0iiZcsdVvaHoZZg8tE+obiBqgPbb8
	ioZMsgIylAxUhxAT7O3IyhVn5ER3N4w=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 0FCABAE35;
	Thu, 22 Oct 2020 13:17:52 +0000 (UTC)
Subject: Re: [PATCH v2 3/5] xen/events: only register debug interrupt for
 2-level events
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org, x86@kernel.org,
 linux-kernel@vger.kernel.org, Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, "H. Peter Anvin" <hpa@zytor.com>
References: <20201022094907.28560-1-jgross@suse.com>
 <20201022094907.28560-4-jgross@suse.com>
 <1de24e42-6cb7-4ecb-0eb2-c4a15dc8afc9@suse.com>
 <98f76c98-00d5-3238-a54f-cce52419160f@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <b21d3544-2257-dee5-222d-f4dade94d167@suse.com>
Date: Thu, 22 Oct 2020 15:17:52 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.1
MIME-Version: 1.0
In-Reply-To: <98f76c98-00d5-3238-a54f-cce52419160f@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 22.10.2020 15:09, Jürgen Groß wrote:
> On 22.10.20 12:35, Jan Beulich wrote:
>> On 22.10.2020 11:49, Juergen Gross wrote:
>>> @@ -2080,10 +2080,12 @@ void __init xen_init_IRQ(void)
>>>   	int ret = -EINVAL;
>>>   	evtchn_port_t evtchn;
>>>   
>>> -	if (fifo_events)
>>> +	if (xen_fifo_events)
>>>   		ret = xen_evtchn_fifo_init();
>>> -	if (ret < 0)
>>> +	if (ret < 0) {
>>>   		xen_evtchn_2l_init();
>>> +		xen_fifo_events = false;
>>> +	}
>>
>> Another note: While it may not matter right here, maybe better
>> first set the variable and the call the function?
> 
> I don't think this is really important, TBH.
> 
> This code is executed before other cpus are up and we'd have major
> other problems in case the sequence would really matter here.

Fair enough; I was thinking in particular that it ought to be
legitimate for xen_evtchn_2l_init() to BUG_ON(xen_fifo_events).

Jan

