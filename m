Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F65A30A241
	for <lists+xen-devel@lfdr.de>; Mon,  1 Feb 2021 07:56:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.79540.144844 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l6T7v-00066s-A4; Mon, 01 Feb 2021 06:55:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 79540.144844; Mon, 01 Feb 2021 06:55:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l6T7v-00066T-6q; Mon, 01 Feb 2021 06:55:59 +0000
Received: by outflank-mailman (input) for mailman id 79540;
 Mon, 01 Feb 2021 06:55:58 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=et9n=HD=codiax.se=anders.tornqvist@srs-us1.protection.inumbo.net>)
 id 1l6T7u-00066N-0B
 for xen-devel@lists.xenproject.org; Mon, 01 Feb 2021 06:55:58 +0000
Received: from mailrelay4-3.pub.mailoutpod1-cph3.one.com (unknown
 [46.30.212.13]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ae0437dd-2408-4af4-b87b-3ef018b8b831;
 Mon, 01 Feb 2021 06:55:56 +0000 (UTC)
Received: from [192.168.101.129] (h87-96-135-119.cust.a3fiber.se
 [87.96.135.119])
 by mailrelay4.pub.mailoutpod1-cph3.one.com (Halon) with ESMTPSA
 id 87916886-645a-11eb-a8e7-d0431ea8bb10;
 Mon, 01 Feb 2021 06:55:55 +0000 (UTC)
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
X-Inumbo-ID: ae0437dd-2408-4af4-b87b-3ef018b8b831
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codiax.se; s=20191106;
	h=content-transfer-encoding:content-type:in-reply-to:mime-version:date:
	 message-id:from:references:to:subject:from;
	bh=KVkCnxlgywxorwQhcaT1l1x1iQFMOPECPdMmbhOGd2A=;
	b=GjHe9wrxWY4g6tNMcYj7epl9LcsyX+vY16/kOwhenYw+TM146HULTdIiQINaEPdgvTo8F7Ajx+S6h
	 zjq/Pr7hoaR1lXVlwSvdyxEm9S8wobXil/NggYC3xILYb7H2O7Ie6bTBPoTjKykJ/gyUVl84E9PkG6
	 zC/41seThUjrWqg6hsqsaxh6zmKPdKtcFQl3w68ATLBSwQV0PcR3ck/W5NCldwdtDwe0kvMPpgkBTo
	 +BvCJr79YjIhbCCtGsZn1R9d7NiHDmYiz9XJcBmRMH+hhLT3FVmzgsOHhUKilfQrX4/XtXoD55FakK
	 9SsSNif7B1p040uSJCGswvBCbsTEALw==
X-HalOne-Cookie: 150a2bb0fd9eed9730d60ae145742d155ea0c4b1
X-HalOne-ID: 87916886-645a-11eb-a8e7-d0431ea8bb10
Subject: Re: Null scheduler and vwfi native problem
To: Dario Faggioli <dfaggioli@suse.com>, Julien Grall <julien@xen.org>,
 xen-devel@lists.xenproject.org, Stefano Stabellini <sstabellini@kernel.org>
References: <fe3dd9f0-b035-01fe-3e01-ddf065f182ab@codiax.se>
 <207305e4e2998614767fdcc5ad83ced6de982820.camel@suse.com>
 <e85548f4-e03b-4717-3495-9ed472ed03c9@xen.org>
 <e18ba69efd0d12fc489144024305fd3c6102c330.camel@suse.com>
 <e37fe8a9-c633-3572-e273-2fd03b35b791@codiax.se>
 <744ddde6-a228-82fc-76b9-401926d7963b@xen.org>
 <d92c4191fb81e6d1de636f281c8624d68f8d14fc.camel@suse.com>
 <c9a4e132-5bca-aa76-ab8b-bfeee1cd5a9e@codiax.se>
 <f52baf12308d71b96d0d9be1c7c382a3c5efafbc.camel@suse.com>
 <18ef4619-19ae-90d2-459c-9b5282b49176@codiax.se>
 <a9d80e262760f6692f7086c9b6a0622caf19e795.camel@suse.com>
From: =?UTF-8?Q?Anders_T=c3=b6rnqvist?= <anders.tornqvist@codiax.se>
Message-ID: <def6307a-9242-f8b2-a4e0-b32652a1b6c0@codiax.se>
Date: Mon, 1 Feb 2021 07:55:54 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <a9d80e262760f6692f7086c9b6a0622caf19e795.camel@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-GB

On 1/30/21 6:59 PM, Dario Faggioli wrote:
> On Fri, 2021-01-29 at 09:08 +0100, Anders Törnqvist wrote:
>> On 1/26/21 11:31 PM, Dario Faggioli wrote:
>>> Thanks again for letting us see these logs.
>> Thanks for the attention to this :-)
>>
>> Any ideas for how to solve it?
>>
> So, you're up for testing patches, right?
Absolutely. I will apply them and be back with the results. :-)

>
> How about applying these two, and letting me know what happens? :-D
>
> They are on top of current staging. I can try to rebase on something
> else, if it's easier for you to test.
>
> Besides being attached, they're also available here:
>
> https://gitlab.com/xen-project/people/dfaggioli/xen/-/tree/rcu-quiet-fix
>
> I could not test them properly on ARM, as I don't have an ARM system
> handy, so everything is possible really... just let me know.
>
> It should at least build fine, AFAICT from here:
>
> https://gitlab.com/xen-project/people/dfaggioli/xen/-/pipelines/249101213
>
> Julien, back in:
>
>   https://lore.kernel.org/xen-devel/315740e1-3591-0e11-923a-718e06c36445@arm.com/
>
>
> you said I should hook in enter_hypervisor_head(),
> leave_hypervisor_tail(). Those functions are gone now and looking at
> how the code changed, this is where I figured I should put the calls
> (see the second patch). But feel free to educate me otherwise.
>
> For x86 people that are listening... Do we have, in our beloved arch,
> equally handy places (i.e., right before leaving Xen for a guest and
> right after entering Xen from one), preferrably in a C file, and for
> all guests... like it seems to be the case on ARM?
>
> Regards



