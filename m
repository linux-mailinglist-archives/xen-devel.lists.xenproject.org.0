Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 71A52361A8C
	for <lists+xen-devel@lfdr.de>; Fri, 16 Apr 2021 09:30:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.111591.213439 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lXIuv-0006Xd-Q1; Fri, 16 Apr 2021 07:29:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 111591.213439; Fri, 16 Apr 2021 07:29:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lXIuv-0006XE-MW; Fri, 16 Apr 2021 07:29:29 +0000
Received: by outflank-mailman (input) for mailman id 111591;
 Fri, 16 Apr 2021 07:29:28 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=vDum=JN=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lXIuu-0006X9-IF
 for xen-devel@lists.xenproject.org; Fri, 16 Apr 2021 07:29:28 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a8e87d96-04d3-4cf5-891d-6e192b6fe7ee;
 Fri, 16 Apr 2021 07:29:27 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id C5CBAAD22;
 Fri, 16 Apr 2021 07:29:26 +0000 (UTC)
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
X-Inumbo-ID: a8e87d96-04d3-4cf5-891d-6e192b6fe7ee
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1618558166; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NjBUATrJ4HaJr0N2E31I3t1vVMual2GF0Nc5shyI48I=;
	b=uWIkvik9MSh/9z58w5+hhy+SHyifZjvOT94ZsuJnpzw+inLeAM7A6EeqgKCfzcB46gxtrD
	d+Vcyf/N8tVU0CR/LSEvsrAML0+nqCxOqqvjxbnMDbDjWt+xc6zz4u/ORbb/8zDOh+wyvj
	q453sRwhKXkNeRRIeSLPyNVMZ6ZfYrQ=
Subject: Re: [PATCH v3 06/11] x86/hvm: allowing registering EOI callbacks for
 GSIs
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20210331103303.79705-1-roger.pau@citrix.com>
 <20210331103303.79705-7-roger.pau@citrix.com>
 <a57f0f75-341d-e6e1-823c-2083184a8f08@suse.com>
 <YG3m9nW6xPeL7MPr@Air-de-Roger> <YHhkBBaXgBQMrov/@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <afb9ad03-d946-55c3-5f51-62683b69f0dc@suse.com>
Date: Fri, 16 Apr 2021 09:29:26 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.1
MIME-Version: 1.0
In-Reply-To: <YHhkBBaXgBQMrov/@Air-de-Roger>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 15.04.2021 18:04, Roger Pau Monné wrote:
> On Wed, Apr 07, 2021 at 07:08:06PM +0200, Roger Pau Monné wrote:
>> On Wed, Apr 07, 2021 at 05:51:14PM +0200, Jan Beulich wrote:
>>> On 31.03.2021 12:32, Roger Pau Monne wrote:
>>>> --- a/xen/arch/x86/hvm/irq.c
>>>> +++ b/xen/arch/x86/hvm/irq.c
>>>> +void hvm_gsi_execute_callbacks(unsigned int gsi)
>>>> +{
>>>> +    struct hvm_irq *hvm_irq = hvm_domain_irq(current->domain);
>>>> +    struct hvm_gsi_eoi_callback *cb;
>>>> +
>>>> +    read_lock(&hvm_irq->gsi_callbacks_lock);
>>>> +    list_for_each_entry ( cb, &hvm_irq->gsi_callbacks[gsi], list )
>>>> +        cb->callback(gsi, cb->data);
>>>> +    read_unlock(&hvm_irq->gsi_callbacks_lock);
>>>> +}
>>>
>>> Just as an observation (for now at least) - holding the lock here
>>> means the callbacks cannot re-register themselves.
>>
>> Well, re-registering would be weird, as the callback is not
>> unregistered after execution. What is likely more relevant is that the
>> callback cannot unregister itself. I haven't found a need for this so
>> far, so I think it's fine.
> 
> I'm afraid I was wrong here - rtc_pf_callback could attempt to
> unregister the timer, and thus end up calling
> hvm_gsi_unregister_callback inside of a callback.
> 
> I need to figure a way to solve this. We already run the RTC in no ack
> mode (which is correct because of the flag we expose in the WAET ACPI
> table), and hence I wonder if we still need to keep the code for the
> strict_mode around, since it's not used at all. Would you be OK with
> me removing the mode_strict related code?

Not sure, to be honest. Years ago I did submit a patch correcting this
("x86/HVM: tie RTC emulation mode to enabling of Viridian emulation"),
as we shouldn't assume all guests to even know of WAET. Hence running
uniformly in rtc_mode_no_ack isn't really correct. I'm still carrying
this patch, as Tim (iirc) had asked not to tie the behavior to the
Viridian param, but give it its own one. Which I still didn't get to.

Of course, if we decided to drop mode_strict support, I could also
drop that patch ...

Jan

