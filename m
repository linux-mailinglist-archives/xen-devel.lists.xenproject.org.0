Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DD7762C6683
	for <lists+xen-devel@lfdr.de>; Fri, 27 Nov 2020 14:15:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.39290.72133 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kidaS-0006i1-Sc; Fri, 27 Nov 2020 13:14:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 39290.72133; Fri, 27 Nov 2020 13:14:56 +0000
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
	id 1kidaS-0006hb-OW; Fri, 27 Nov 2020 13:14:56 +0000
Received: by outflank-mailman (input) for mailman id 39290;
 Fri, 27 Nov 2020 13:14:55 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=rmeX=FB=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kidaR-0006hU-7o
 for xen-devel@lists.xenproject.org; Fri, 27 Nov 2020 13:14:55 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 19032c15-ab24-4234-8e6d-430bb29bbe07;
 Fri, 27 Nov 2020 13:14:54 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id C0C7AAC23;
 Fri, 27 Nov 2020 13:14:53 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=rmeX=FB=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kidaR-0006hU-7o
	for xen-devel@lists.xenproject.org; Fri, 27 Nov 2020 13:14:55 +0000
X-Inumbo-ID: 19032c15-ab24-4234-8e6d-430bb29bbe07
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 19032c15-ab24-4234-8e6d-430bb29bbe07;
	Fri, 27 Nov 2020 13:14:54 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1606482893; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8p8rG6mNNxRdp60uFi/2EGcwbvcytIrxUNojyBnQQtA=;
	b=lrKWoTWcYKmrtAVHtQCkGmDw2zVDiQ5PNNBfIkYcmmJvIIHfACwW2jqanyOZFSYFZH3+SF
	+EDYeDzL1eg7mD9CzP3QOWA2h2VvnYOrg0IXHJiiODt7AY+zmKD9ednRYYIOWFNKupaS0o
	SScNvCZ0uCy14MAHQXQbIUsgDc+iAPQ=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id C0C7AAC23;
	Fri, 27 Nov 2020 13:14:53 +0000 (UTC)
Subject: Re: NetBSD dom0 PVH: hardware interrupts stalls
To: Manuel Bouyer <bouyer@antioche.eu.org>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20201124154917.l3jwa6w4ejumjuqw@Air-de-Roger>
 <20201124160914.GQ2020@antioche.eu.org>
 <20201126133444.r2oi24i3umh7shb3@Air-de-Roger>
 <20201126141608.GA4123@antioche.eu.org>
 <20201126142635.uzi643co3mxp5h42@Air-de-Roger>
 <20201126150937.jhbfp7iefkmtedx7@Air-de-Roger>
 <20201126172034.GA7642@antioche.eu.org>
 <20201127105948.ji5gxv4e7axrvgpo@Air-de-Roger>
 <20201127111904.GG1717@antioche.eu.org>
 <89aecc1b-bfe5-26fb-9d11-bec4f0aa7b84@suse.com>
 <20201127131004.GH1717@antioche.eu.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <66716bca-4187-30c2-aba7-f6f973b194e4@suse.com>
Date: Fri, 27 Nov 2020 14:14:55 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20201127131004.GH1717@antioche.eu.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 27.11.2020 14:10, Manuel Bouyer wrote:
> On Fri, Nov 27, 2020 at 12:21:23PM +0100, Jan Beulich wrote:
>> On 27.11.2020 12:19, Manuel Bouyer wrote:
>>> On Fri, Nov 27, 2020 at 11:59:48AM +0100, Roger Pau Monné wrote:
>>>>>
>>>>> I had to restart from a clean source tree to apply this patch, so to make
>>>>> sure we're in sync I attached the diff from my sources
>>>>
>>>> I'm quite confused about why your trace don't even get into
>>>> hvm_do_IRQ_dpci, so I've added some more debug info.
>>>>
>>>> Here is the new patch, sorry for so many rounds of testing.
>>>
>>> No problem, it's expected for this kind of debug :)
>>>
>>> http://www-soc.lip6.fr/~bouyer/xen-log11.txt
>>
>> Hmm, this one now has hvm_do_IRQ_dpci entries. Maybe the previous one
>> was again from a stale binary?
> 
> But I do see hvm_do_IRQ_dpci in the previous one too (xen-log10.txt)

Ah yes. In your respective mail the link said 9 though instead of 10.

Jan

