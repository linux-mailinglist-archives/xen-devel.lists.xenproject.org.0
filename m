Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B8DF7308789
	for <lists+xen-devel@lfdr.de>; Fri, 29 Jan 2021 10:46:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.77847.141283 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l5QMB-00005K-IS; Fri, 29 Jan 2021 09:46:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 77847.141283; Fri, 29 Jan 2021 09:46:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l5QMB-0008WV-Eo; Fri, 29 Jan 2021 09:46:23 +0000
Received: by outflank-mailman (input) for mailman id 77847;
 Fri, 29 Jan 2021 09:46:22 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Mmvf=HA=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1l5QMA-0008WQ-Oa
 for xen-devel@lists.xenproject.org; Fri, 29 Jan 2021 09:46:22 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e05112a0-c0be-4bc2-a2e6-4950ec935f24;
 Fri, 29 Jan 2021 09:46:21 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 027F6AE05;
 Fri, 29 Jan 2021 09:46:21 +0000 (UTC)
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
X-Inumbo-ID: e05112a0-c0be-4bc2-a2e6-4950ec935f24
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1611913581; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HQBVgrwbr/hEi4sr6+dUd5SKQlIoe9KB+CX9+H8WXY4=;
	b=u5A5fBvOFv137jgHPu3cIf7Vf3mLXGUVmk4JbK8jSU6BTwLwnlr5AfN2+Ck0F4SmNSvw8r
	gopkeRGRYYVXPq+0cPA+AWXqc5uNqGTDebCRgtBWs0YpvlHULs2iUHIyyZkCNYGzKqtYhO
	Cewh1QWxLyLZ9up32VmOclZYadOkyoc=
Subject: Re: [PATCH v3 7/7] xen/memory: Fix mapping grant tables with
 XENMEM_acquire_resource
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: George Dunlap <George.Dunlap@eu.citrix.com>,
 Ian Jackson <iwj@xenproject.org>, Stefano Stabellini
 <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, Julien Grall
 <julien@xen.org>, Paul Durrant <paul@xen.org>,
 =?UTF-8?Q?Micha=c5=82_Leszczy=c5=84ski?= <michal.leszczynski@cert.pl>,
 Hubert Jasudowicz <hubert.jasudowicz@cert.pl>,
 Tamas K Lengyel <tamas@tklengyel.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20210112194841.1537-1-andrew.cooper3@citrix.com>
 <20210112194841.1537-8-andrew.cooper3@citrix.com>
 <65d256c1-e9c0-3859-b6fc-d3b7a41ef964@suse.com>
 <836bc7bf-7342-96b4-253c-dedb00da92f6@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <46d73c0a-035c-db7f-3b1a-87ad88bc2518@suse.com>
Date: Fri, 29 Jan 2021 10:46:21 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <836bc7bf-7342-96b4-253c-dedb00da92f6@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 29.01.2021 00:44, Andrew Cooper wrote:
> On 15/01/2021 16:12, Jan Beulich wrote:
>> On 12.01.2021 20:48, Andrew Cooper wrote:
>>> --- a/xen/arch/x86/mm.c
>>> +++ b/xen/arch/x86/mm.c
>>> @@ -4628,7 +4628,6 @@ int arch_acquire_resource(struct domain *d, unsigned int type,
>>>          if ( id != (unsigned int)ioservid )
>>>              break;
>>>  
>>> -        rc = 0;
>>>          for ( i = 0; i < nr_frames; i++ )
>>>          {
>>>              mfn_t mfn;
>> How "good" are our chances that older gcc won't recognize that
>> without this initialization ...
>>
>>> @@ -4639,6 +4638,9 @@ int arch_acquire_resource(struct domain *d, unsigned int type,
>>>  
>>>              mfn_list[i] = mfn_x(mfn);
>>>          }
>>> +        if ( i == nr_frames )
>>> +            /* Success.  Passed nr_frames back to the caller. */
>>> +            rc = nr_frames;
>> ... rc will nevertheless not remain uninitialized when nr_frames
>> is zero?
> 
> I don't anticipate this function getting complicated enough for us to
> need to rely on tricks like that to spot bugs.
> 
> AFAICT, it would take a rather larger diffstat to make it "uninitialised
> clean" again.

Well, we'll see how it goes then. We still allow rather ancient
gcc, and I will eventually run into a build issue here once
having rebased accordingly, if such old gcc won't cope.

Jan

