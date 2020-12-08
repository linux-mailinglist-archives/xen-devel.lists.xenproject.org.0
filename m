Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 28A552D27C7
	for <lists+xen-devel@lfdr.de>; Tue,  8 Dec 2020 10:35:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.47266.83688 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kmZOn-0007WB-PR; Tue, 08 Dec 2020 09:35:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 47266.83688; Tue, 08 Dec 2020 09:35:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kmZOn-0007Vm-M9; Tue, 08 Dec 2020 09:35:09 +0000
Received: by outflank-mailman (input) for mailman id 47266;
 Tue, 08 Dec 2020 09:35:08 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Ur7q=FM=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kmZOm-0007Vh-IG
 for xen-devel@lists.xenproject.org; Tue, 08 Dec 2020 09:35:08 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3b82cf30-bbb9-4334-b346-c157f5a3a98a;
 Tue, 08 Dec 2020 09:35:07 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id BBDCEAD21;
 Tue,  8 Dec 2020 09:35:06 +0000 (UTC)
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
X-Inumbo-ID: 3b82cf30-bbb9-4334-b346-c157f5a3a98a
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1607420106; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MUQbzhw7NK6yRCTLkT/kEn3M96AjRwg+fxEt7cvqeZ0=;
	b=BwDGNAHLlAuGPVYvIV/J7ZfDBc40UQgWrrp1I3poRi1NwJtKuj8+Fekh/N17T8jaYBnvjd
	0tPGLup5/wD0gUlqBhFgXAxkiZN9vptmxAszqeej3h/LaWfASd6z7iafuzNV5BDuojNymT
	d5oaRKvzzg2X26QYKtuHFUo0eJeKdHU=
Subject: Re: [PATCH V3 11/23] xen/ioreq: Move x86's io_completion/io_req
 fields to struct vcpu
To: paul@xen.org, 'Oleksandr' <olekstysh@gmail.com>
Cc: 'Oleksandr Tyshchenko' <oleksandr_tyshchenko@epam.com>,
 'Andrew Cooper' <andrew.cooper3@citrix.com>,
 =?UTF-8?B?J1JvZ2VyIFBhdSBNb25uw6kn?= <roger.pau@citrix.com>,
 'Wei Liu' <wl@xen.org>, 'George Dunlap' <george.dunlap@citrix.com>,
 'Ian Jackson' <iwj@xenproject.org>, 'Julien Grall' <julien@xen.org>,
 'Stefano Stabellini' <sstabellini@kernel.org>,
 'Jun Nakajima' <jun.nakajima@intel.com>, 'Kevin Tian'
 <kevin.tian@intel.com>, 'Julien Grall' <julien.grall@arm.com>,
 xen-devel@lists.xenproject.org
References: <1606732298-22107-1-git-send-email-olekstysh@gmail.com>
 <1606732298-22107-12-git-send-email-olekstysh@gmail.com>
 <742899b6-964b-be75-affc-31342c07133a@suse.com>
 <d7d867d3-b508-0c6c-191f-264e1e08bf39@gmail.com>
 <0d3c01d6cd37$0c013770$2403a650$@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <c96725ea-883a-6123-0bf5-da74c1a3cc47@suse.com>
Date: Tue, 8 Dec 2020 10:35:06 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <0d3c01d6cd37$0c013770$2403a650$@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 08.12.2020 08:52, Paul Durrant wrote:
>> From: Oleksandr <olekstysh@gmail.com>
>> Sent: 07 December 2020 21:00
>>
>> On 07.12.20 14:32, Jan Beulich wrote:
>>> On 30.11.2020 11:31, Oleksandr Tyshchenko wrote:
>>>> --- a/xen/include/xen/sched.h
>>>> +++ b/xen/include/xen/sched.h
>>>> @@ -145,6 +145,21 @@ void evtchn_destroy_final(struct domain *d); /* from complete_domain_destroy
>> */
>>>>
>>>>   struct waitqueue_vcpu;
>>>>
>>>> +enum io_completion {
>>>> +    IO_no_completion,
>>>> +    IO_mmio_completion,
>>>> +    IO_pio_completion,
>>>> +#ifdef CONFIG_X86
>>>> +    IO_realmode_completion,
>>>> +#endif
>>>> +};
>>> I'm not entirely happy with io_ / IO_ here - they seem a little
>>> too generic. How about ioreq_ / IOREQ_ respectively?
>>
>> I am OK, would like to hear Paul's opinion on both questions.
>>
> 
> No, I think the 'IO_' prefix is better. They relate to a field in the vcpu_io struct. An alternative might be 'VIO_'...
> 
>>
>>>
>>>> +struct vcpu_io {
>>>> +    /* I/O request in flight to device model. */
>>>> +    enum io_completion   completion;
> 
> ... in which case, you could also name the enum 'vio_completion'.

I'd be okay with these - still better than just "io".

Jan

