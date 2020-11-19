Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 657732B9848
	for <lists+xen-devel@lfdr.de>; Thu, 19 Nov 2020 17:45:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.31176.61462 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kfn3H-0004t6-0W; Thu, 19 Nov 2020 16:44:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 31176.61462; Thu, 19 Nov 2020 16:44:54 +0000
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
	id 1kfn3G-0004sT-Sm; Thu, 19 Nov 2020 16:44:54 +0000
Received: by outflank-mailman (input) for mailman id 31176;
 Thu, 19 Nov 2020 16:44:53 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=PWQs=EZ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kfn3F-0004s7-FJ
 for xen-devel@lists.xenproject.org; Thu, 19 Nov 2020 16:44:53 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b8ee63e4-6a6d-4d34-ad09-9a5c45947a30;
 Thu, 19 Nov 2020 16:44:52 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 464D8AC22;
 Thu, 19 Nov 2020 16:44:51 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=PWQs=EZ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kfn3F-0004s7-FJ
	for xen-devel@lists.xenproject.org; Thu, 19 Nov 2020 16:44:53 +0000
X-Inumbo-ID: b8ee63e4-6a6d-4d34-ad09-9a5c45947a30
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id b8ee63e4-6a6d-4d34-ad09-9a5c45947a30;
	Thu, 19 Nov 2020 16:44:52 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1605804291; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bOx0ypNVPvDzfXoaBWYicPCyh9evkGWlh2Ic/Vvq1yY=;
	b=fe/pobK+CAUFJYfarF25N6JjyMrFJz1c6htm3qZUuU1V2xl16He8o+BYz3qpk0o8Pddk5a
	09czZSJ2AQy43CQeb9x07Zlf28/zTHWPWoKjTnD6NsSWLmF9CCMNgP3T55VP7A6uePIoD5
	iwHEz4oD6DA9GjCQaAnvgjXl/eQkLEc=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 464D8AC22;
	Thu, 19 Nov 2020 16:44:51 +0000 (UTC)
Subject: Re: [PATCH 06/10] viridian: add ExProcessorMasks variants of the
 flush hypercalls
To: paul@xen.org
Cc: 'Paul Durrant' <pdurrant@amazon.com>, 'Wei Liu' <wl@xen.org>,
 'Andrew Cooper' <andrew.cooper3@citrix.com>,
 =?UTF-8?B?J1JvZ2VyIFBhdSBNb25uw6kn?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20201111200721.30551-1-paul@xen.org>
 <20201111200721.30551-7-paul@xen.org>
 <dd6c4a0d-f611-7b81-8c95-72786891f311@suse.com>
 <00cc01d6be8e$b24973c0$16dc5b40$@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <f974ee35-239a-644f-ab81-ab4a435e3693@suse.com>
Date: Thu, 19 Nov 2020 17:44:50 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.3
MIME-Version: 1.0
In-Reply-To: <00cc01d6be8e$b24973c0$16dc5b40$@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 19.11.2020 17:11, Paul Durrant wrote:
>> From: Jan Beulich <jbeulich@suse.com>
>> Sent: 12 November 2020 09:19
>>
>> On 11.11.2020 21:07, Paul Durrant wrote:
>>> --- a/xen/arch/x86/hvm/viridian/viridian.c
>>> +++ b/xen/arch/x86/hvm/viridian/viridian.c
>>> @@ -553,6 +553,83 @@ static unsigned int vpmask_next(struct hypercall_vpmask *vpmask, unsigned int
>> vp
>>>  	     (vp) < HVM_MAX_VCPUS; \
>>>  	     (vp) = vpmask_next(vpmask, vp))
>>>
>>> +struct hypercall_vpset {
>>> +        struct hv_vpset set;
>>> +        uint64_t __bank_contents[64];
>>
>> gcc documents this to be supported as an extension; did you check
>> clang supports this, too?
> 
> By 'this', do you mean the assumption that that memory layout is consecutive?

No, rather the basic language aspect that in standard C a struct
member which is a struct ending in a flexible array member may
not be followed by any other field.

Jan

