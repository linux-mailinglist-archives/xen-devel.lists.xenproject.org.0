Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 41D4A2B1D80
	for <lists+xen-devel@lfdr.de>; Fri, 13 Nov 2020 15:31:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.26545.54989 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kda6k-0001wd-VV; Fri, 13 Nov 2020 14:31:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 26545.54989; Fri, 13 Nov 2020 14:31:22 +0000
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
	id 1kda6k-0001wE-Ro; Fri, 13 Nov 2020 14:31:22 +0000
Received: by outflank-mailman (input) for mailman id 26545;
 Fri, 13 Nov 2020 14:31:21 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=5p9l=ET=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kda6j-0001w5-15
 for xen-devel@lists.xenproject.org; Fri, 13 Nov 2020 14:31:21 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 44a1fc76-e62a-4a8f-b62a-d7187e4b7003;
 Fri, 13 Nov 2020 14:31:19 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id E8A70ABD9;
 Fri, 13 Nov 2020 14:31:18 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=5p9l=ET=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kda6j-0001w5-15
	for xen-devel@lists.xenproject.org; Fri, 13 Nov 2020 14:31:21 +0000
X-Inumbo-ID: 44a1fc76-e62a-4a8f-b62a-d7187e4b7003
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 44a1fc76-e62a-4a8f-b62a-d7187e4b7003;
	Fri, 13 Nov 2020 14:31:19 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1605277879; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=27bsbPqnD749rcMxfQnT2QIkrBYTXZ41uSl4ifUf6xg=;
	b=HLxnAlmGBUuE3ZzOyQnXYRwyh9mIYpPBPuobqLB4IA9/AGuJibCGob3LursRW8SXeJaABY
	THMYVj7wLv1X+d17cXzfXvNPJ3C8Du4kqBYjL/fJt6bJISai+os4NhPGRVhZoo/mebcv34
	/evXffCAlRAnc5ZXcRlnii3+WwgniNs=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id E8A70ABD9;
	Fri, 13 Nov 2020 14:31:18 +0000 (UTC)
Subject: Re: [PATCH V2 01/23] x86/ioreq: Prepare IOREQ feature for making it
 common
To: Oleksandr <olekstysh@gmail.com>
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Paul Durrant <paul@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, Julien Grall <julien.grall@arm.com>,
 xen-devel@lists.xenproject.org
References: <1602780274-29141-1-git-send-email-olekstysh@gmail.com>
 <1602780274-29141-2-git-send-email-olekstysh@gmail.com>
 <61ea02e0-bdd4-5a0a-dd6f-b22e806e6d1e@suse.com>
 <cd16e1f2-849d-ec12-3325-382b8f6689ff@gmail.com>
 <e08459d9-dd0a-7875-5d12-d374c69fe775@suse.com>
 <9162290b-94c5-295e-3133-71284cd617e1@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <eb60cbdf-1148-c304-6d01-aaa7594f795c@suse.com>
Date: Fri, 13 Nov 2020 15:31:18 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.3
MIME-Version: 1.0
In-Reply-To: <9162290b-94c5-295e-3133-71284cd617e1@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 13.11.2020 13:45, Oleksandr wrote:
> On 13.11.20 13:20, Jan Beulich wrote:
>> On 13.11.2020 12:09, Oleksandr wrote:
>>> On 12.11.20 12:58, Jan Beulich wrote:
>>>> On 15.10.2020 18:44, Oleksandr Tyshchenko wrote:
>>>>> @@ -855,7 +841,7 @@ int hvm_destroy_ioreq_server(struct domain *d, ioservid_t id)
>>>>>    
>>>>>        domain_pause(d);
>>>>>    
>>>>> -    p2m_set_ioreq_server(d, 0, s);
>>>>> +    arch_hvm_destroy_ioreq_server(s);
>>>> Iirc there are plans to rename hvm_destroy_ioreq_server() in the
>>>> course of the generalization. If so, this arch hook would imo
>>>> better be named following the new scheme right away.
>>> Could you please clarify, are you speaking about the plans discussed there
>>>
>>> "[PATCH V2 12/23] xen/ioreq: Remove "hvm" prefixes from involved
>>> function names"?
>>>
>>> Copy text for the convenience:
>>> AT least some of the functions touched here would be nice to be
>>> moved to a more consistent new naming scheme right away, to
>>> avoid having to touch all the same places again. I guess ioreq
>>> server functions would be nice to all start with ioreq_server_
>>> and ioreq functions to all start with ioreq_. E.g. ioreq_send()
>>> and ioreq_server_select().
>>>
>>> or some other plans I am not aware of?
>>>
>>>
>>> What I really want to avoid with IOREQ enabling work is the round-trips
>>> related to naming things, this patch series
>>> became quite big (and consumes som time to rebase and test it) and I
>>> expect it to become bigger.
>>>
>>> So the arch_hvm_destroy_ioreq_server() should be
>>> arch_ioreq_server_destroy()?
>> I think so, yes. If you want to avoid doing full patches, how
>> about you simply list the functions / variables you plan to
>> rename alongside the intended new names? Would likely be easier
>> for all involved parties.
> I think it is a good idea. I will prepare a list once I analyze all new 
> comments to this series.
> As I understand that only global IOREQ functions need renaming according 
> to the new scheme,
> local ones can be left as is but without "hvm" prefixes of course?

Please apply common sense: Static ones, if you have to drop a
hvm_ prefix, may in some cases better further be renamed as well,
when their names aren't really in line with their purpose
(anymore). But yes, following a consistent naming model is more
relevant for non-static functions.

Jan

