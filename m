Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 49307360BDF
	for <lists+xen-devel@lfdr.de>; Thu, 15 Apr 2021 16:34:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.111306.212877 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lX34F-0001VX-AK; Thu, 15 Apr 2021 14:34:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 111306.212877; Thu, 15 Apr 2021 14:34:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lX34F-0001V8-7H; Thu, 15 Apr 2021 14:34:03 +0000
Received: by outflank-mailman (input) for mailman id 111306;
 Thu, 15 Apr 2021 14:34:01 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=x7n8=JM=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lX34D-0001V3-Nb
 for xen-devel@lists.xenproject.org; Thu, 15 Apr 2021 14:34:01 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5693ba94-da35-4e7b-b03b-869434eb5c7f;
 Thu, 15 Apr 2021 14:34:01 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 2C447AF1F;
 Thu, 15 Apr 2021 14:34:00 +0000 (UTC)
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
X-Inumbo-ID: 5693ba94-da35-4e7b-b03b-869434eb5c7f
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1618497240; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3F0VvfsM1VnCdVFqBirA6O0TM+Ymi8FAq8gt90i8NXY=;
	b=a9N5qM+I9RM53cKB7CwZQh/Q7b+glrmhrbk2Cc1ZcknoQs4Uy4rS1VJD4O3/I4qnMeFITI
	spx88pe041iLwmDtepCTZTsgFiYmjncbTD0l28Lnplr6LP+13OhKb+CJKsHQAMPOci5auA
	px9XUkJcqdR+bwM75ct6ppiYLSTVBqs=
Subject: Re: [PATCH v3 13/15] unzstd: replace INIT{,DATA} and STATIC
To: Julien Grall <julien@xen.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <2db91183-a7de-0c43-2fef-feb3523ed19b@suse.com>
 <19f12930-df0e-5a00-9e5e-53edffcf51d7@suse.com>
 <467ed62e-e5c3-0a08-b9a7-5b4e913b3c90@xen.org>
 <e1d08ced-c2e8-22e3-2da3-8116b69cb627@suse.com>
 <e861b617-7b9f-317d-9941-0fd7577147cb@xen.org>
 <950e7ec1-3d4a-594d-ce8f-62d9d5930265@suse.com>
 <75195be2-ca13-28c2-b871-992c0168e1e7@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <71658edb-2cb5-09c2-708f-06c6fca9253d@suse.com>
Date: Thu, 15 Apr 2021 16:34:00 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.1
MIME-Version: 1.0
In-Reply-To: <75195be2-ca13-28c2-b871-992c0168e1e7@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 15.04.2021 16:30, Julien Grall wrote:
> On 15/04/2021 15:25, Jan Beulich wrote:
>> On 15.04.2021 16:22, Julien Grall wrote:
>>> On 15/04/2021 15:21, Jan Beulich wrote:
>>>> On 15.04.2021 13:59, Julien Grall wrote:
>>>>> On 26/01/2021 09:52, Jan Beulich wrote:
>>>>>> With xen/common/decompress.h now agreeing in both build modes about
>>>>>> what STATIC expands to, there's no need for this abstraction anymore.
>>>>>
>>>>> Shouldn't you also mention "INIT" and "INITDATA" here?
>>>>
>>>> Two parts: INITDATA was mistakenly mentioned in the title. I've
>>>> dropped that.
>>>
>>> Ok.
>>>
>>> And what I'm saying about STATIC does not apply to
>>>> INIT - for it, we replace the extra level of abstraction by
>>>> directly using __init, just like was done in the earlier patches.
>>>
>>> This should be mention in the commit message.
>>
>> It already is by what is being said after the comma. May I direct
>> you back to the commit messages of earlier patches in this series
>> (when talk was of just INIT)?
>  From the way the commit message is written it sounds like more you are 
> referring to STATIC only. This is a clearer on the other commit messages 
> because there is no other way to interpret "this".

If the commit message is taken together with the title, I think
all is clear.

> So I would suggest to clarify it.

And I would like to avoid doing so. As a compromise, I'll change
"this abstraction" to "these abstractions".

Jan

