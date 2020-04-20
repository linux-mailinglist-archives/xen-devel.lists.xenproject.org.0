Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A73051B0576
	for <lists+xen-devel@lfdr.de>; Mon, 20 Apr 2020 11:20:13 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jQSay-0002UI-2A; Mon, 20 Apr 2020 09:20:04 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=z/8R=6E=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jQSaw-0002Li-8F
 for xen-devel@lists.xenproject.org; Mon, 20 Apr 2020 09:20:02 +0000
X-Inumbo-ID: 1c7c2b08-82e8-11ea-b58d-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1c7c2b08-82e8-11ea-b58d-bc764e2007e4;
 Mon, 20 Apr 2020 09:20:01 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id B01F5B1CD;
 Mon, 20 Apr 2020 09:19:59 +0000 (UTC)
Subject: Re: [PATCH 07/17] xen/x86: traps: Convert __page_fault_type() to use
 typesafe MFN
To: Julien Grall <julien@xen.org>
References: <20200322161418.31606-1-julien@xen.org>
 <20200322161418.31606-8-julien@xen.org>
 <12a955a3-d326-f5f9-f20b-69f3dafac238@suse.com>
 <527ec42b-1fcf-7e35-0ed7-b9da91a8c583@xen.org>
 <cb09a267-32b6-9ea3-1289-a1e20ec99746@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <97d8cf44-678b-29ed-995e-e0737f83566f@suse.com>
Date: Mon, 20 Apr 2020 11:19:57 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <cb09a267-32b6-9ea3-1289-a1e20ec99746@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: xen-devel@lists.xenproject.org, Julien Grall <jgrall@amazon.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 18.04.2020 13:43, Julien Grall wrote:
> On 18/04/2020 12:01, Julien Grall wrote:
>> On 26/03/2020 15:54, Jan Beulich wrote:
>>> On 22.03.2020 17:14, julien@xen.org wrote:
>>>> From: Julien Grall <jgrall@amazon.com>
>>>>
>>>> Note that the code is now using cr3_to_mfn() to get the MFN. This is
>>>> slightly different as the top 12-bits will now be masked.
>>>
>>> And here I agree with the change. Hence it is even more so important
>>> that the patch introducing the new helper(s) first gets sorted.
>>> Should there be further patches in this series with this same
>>> interaction issue, I won't point it out again and may not respond at
>>> all if I see no other issues.
>>
>> I will update the commit message explaining the reason of using cr3_to_mfn() and look at the other user.
> 
> Looking at the code again, there are a few users that don't mask the top 12-bits. I am trying to understand why this has never been an issue so far.
> 
> Wouldn't it break when bit 63 (no flush) is set?

Yes; I guess those uses are case where bit 63 can't / won't be set.
Just like the register, which doesn't store the bit, I think we
avoid storing the bit set as well. But correctness of the non-
masking variants can only be established by looking at every
individual site.

> If so, maybe I should split the work from typesafe.

Maybe better indeed.

Jan

