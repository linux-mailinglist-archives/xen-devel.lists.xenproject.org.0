Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 50ACB2FFDE3
	for <lists+xen-devel@lfdr.de>; Fri, 22 Jan 2021 09:07:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.72561.130693 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l2rTr-000324-DJ; Fri, 22 Jan 2021 08:07:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 72561.130693; Fri, 22 Jan 2021 08:07:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l2rTr-00031f-9o; Fri, 22 Jan 2021 08:07:43 +0000
Received: by outflank-mailman (input) for mailman id 72561;
 Fri, 22 Jan 2021 08:07:42 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=530u=GZ=codiax.se=anders.tornqvist@srs-us1.protection.inumbo.net>)
 id 1l2rTq-00031Z-3d
 for xen-devel@lists.xenproject.org; Fri, 22 Jan 2021 08:07:42 +0000
Received: from mailrelay4-3.pub.mailoutpod1-cph3.one.com (unknown
 [46.30.212.13]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id fee7b748-14cd-4a9b-b7eb-73a11693f263;
 Fri, 22 Jan 2021 08:07:40 +0000 (UTC)
Received: from [192.168.101.129] (h77-53-239-0.cust.a3fiber.se [77.53.239.0])
 by mailrelay4.pub.mailoutpod1-cph3.one.com (Halon) with ESMTPSA
 id e4ca4c15-5c88-11eb-a8e7-d0431ea8bb10;
 Fri, 22 Jan 2021 08:07:39 +0000 (UTC)
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
X-Inumbo-ID: fee7b748-14cd-4a9b-b7eb-73a11693f263
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codiax.se; s=20191106;
	h=content-transfer-encoding:content-type:in-reply-to:mime-version:date:
	 message-id:from:references:to:subject:from;
	bh=AqY++2+6vGLZEUeUVRW9ujephAxHwH1DdhYJAFs2iu4=;
	b=x/5ICC+p6YlIEMpLXHZMyGW4K3RpLWkKKqV8KOj8ZzTIhPnqVIKvY6cYwadOleeMK11vElGaZpWQ6
	 kCZohk5nMSCxMePZliuBHWd4BQ/miSNve45HIYCdjG2Nky489C+UiWEdkover79gBTnFwUz5BjwgZF
	 gfRpBz9OmkpwtGV0VECBXaSGfCSLM+dDAk/V4y3LY8EvZksETUVRaGOInrde7nDlibcWGoqfRCGKmE
	 rkZDSkJ2z0T+v3D5amXXrJbraTH4h88AzHXnFkDdhPlhkrmyPT6Alpqi6YJv7yjvExueJrqgwNUxSh
	 uxBMzBNOUWGj0+oeijkYiA0W2zdSQ3g==
X-HalOne-Cookie: 2601e932f36727b1baa049372f94cf68df101389
X-HalOne-ID: e4ca4c15-5c88-11eb-a8e7-d0431ea8bb10
Subject: Re: Null scheduler and vwfi native problem
To: Dario Faggioli <dfaggioli@suse.com>, xen-devel@lists.xenproject.org
References: <fe3dd9f0-b035-01fe-3e01-ddf065f182ab@codiax.se>
 <207305e4e2998614767fdcc5ad83ced6de982820.camel@suse.com>
From: =?UTF-8?Q?Anders_T=c3=b6rnqvist?= <anders.tornqvist@codiax.se>
Message-ID: <9458563c-4b91-c749-ea10-00e46a2ecbaa@codiax.se>
Date: Fri, 22 Jan 2021 09:07:38 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <207305e4e2998614767fdcc5ad83ced6de982820.camel@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-GB

On 1/21/21 7:32 PM, Dario Faggioli wrote:
> On Thu, 2021-01-21 at 11:54 +0100, Anders Törnqvist wrote:
>> Hi,
>>
> Hello,
>
>> I see a problem with destroy and restart of a domain. Interrupts are
>> not
>> available when trying to restart a domain.
>>
>> The situation seems very similar to the thread "null scheduler bug"
>>   
>> https://lists.xenproject.org/archives/html/xen-devel/2018-09/msg01213.html
>> .
>>
> Right. Back then, PCI passthrough was involved, if I remember
> correctly. Is it the case for you as well?
>
>> The target system is a iMX8-based ARM board and Xen is a 4.13.0
>> version
>> built from https://source.codeaurora.org/external/imx/imx-xen.git.
>>
> Mmm, perhaps it's me, but neither going at that url with a browser not
> trying to clone it, I do not see anything. What I'm doing wrong?
Sorry. The link is https://source.codeaurora.org/external/imx/imx-xen.
>
>> Xen is booted with sched=null vwfi=native.
>> One physical CPU core is pinned to the domu.
>> Some interrupts are passed through to the domu.
>>
> Ok, I guess it is involved, since you say "some interrupts are passed
> through..."
>
>> When destroying the domain with xl destroy etc it does not complain
>> but
>> then when trying to restart the domain
>> again with a "xl create <domain cfg>" I get:
>> (XEN) IRQ 210 is already used by domain 1
>>
>> "xl list" does not contain the domain.
>>
>> Repeating the "xl create" command 5-10 times eventually starts the
>> domain without complaining about the IRQ.
>>
>> Inspired from the discussion in the thread above I have put printks
>> in
>> the xen/common/domain.c file.
>> In the function domain_destroy I have a printk("End of domain_destroy
>> function\n") in the end.
>> In the function complete_domain_destroy have a printk("Begin of
>> complete_domain_destroy function\n") in the beginning.
>>
>> With these printouts I get at "xl destroy":
>> (XEN) End of domain_destroy function
>>
>> So it seems like the function complete_domain_destroy is not called.
>>
> Ok, thanks for making these tests. It's helpful to have this
> information right away.
>
>> "xl create" results in:
>> (XEN) IRQ 210 is already used by domain 1
>> (XEN) End of domain_destroy function
>>
>> Then repeated "xl create" looks the same until after a few tries I
>> also get:
>> (XEN) Begin of complete_domain_destroy function
>>
>> After that the next "xl create" creates the domain.
>>
>>
>> I have also applied the patch from
>>      
>> https://lists.xenproject.org/archives/html/xen-devel/2018-09/msg02469.html
>> .
>> This does seem to change the results.
>>
> Ah... Really? That's a bit unexpected, TBH.
>
> Well, I'll think about it.
>
>> Starting the system without "sched=null vwfi=native" does not result
>> in
>> the problem.
>>
> Ok, how about, if you're up for some more testing:
>
>   - booting with "sched=null" but not with "vwfi=native"
>   - booting with "sched=null vwfi=native" but not doing the IRQ
>     passthrough that you mentioned above
>
> ?
>
> Regards



