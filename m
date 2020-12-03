Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 539672CD120
	for <lists+xen-devel@lfdr.de>; Thu,  3 Dec 2020 09:21:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.43160.77639 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kkjrD-0003qr-Ky; Thu, 03 Dec 2020 08:20:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 43160.77639; Thu, 03 Dec 2020 08:20:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kkjrD-0003qS-Hd; Thu, 03 Dec 2020 08:20:55 +0000
Received: by outflank-mailman (input) for mailman id 43160;
 Thu, 03 Dec 2020 08:20:54 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=vSHx=FH=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kkjrC-0003qN-5N
 for xen-devel@lists.xenproject.org; Thu, 03 Dec 2020 08:20:54 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ceeae4b4-107d-4e50-a51c-bfc0412f8a2e;
 Thu, 03 Dec 2020 08:20:52 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 61F10AC55;
 Thu,  3 Dec 2020 08:20:51 +0000 (UTC)
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
X-Inumbo-ID: ceeae4b4-107d-4e50-a51c-bfc0412f8a2e
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1606983651; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4puBeoSg4tODVpXmLAW0sGWhnauZKc2JuH4Jn/niFAE=;
	b=Oe06/56bn4A3nCVy8onyNtDB57y4gC/VKHD528xFqG7TyV4sm76OW6n32MuIApx7UVIN+K
	bvZsI7pWv++M/0I+28LPmz5RAgta+N12iXo34qS+F8Hfuh1CtmmGhMf4+UxsuKN/fuz009
	WUpF0Dwn9Xd0O3QtghAiEvJHA2fQMHU=
Subject: Re: [PATCH] x86/IRQ: bump max number of guests for a shared IRQ to 31
To: Igor Druzhinin <igor.druzhinin@citrix.com>
Cc: andrew.cooper3@citrix.com, roger.pau@citrix.com, wl@xen.org,
 xen-devel@lists.xenproject.org
References: <1606780777-30718-1-git-send-email-igor.druzhinin@citrix.com>
 <b98d3517-6c9d-6f40-6e28-cde142978143@suse.com>
 <3c9735ec-2b04-1ace-2adb-d72b32c4a5f9@citrix.com>
 <88019c81-1988-2512-282b-53b61adf09c6@suse.com>
 <bcb0964d-9444-f5e6-372f-d8daa460fcfd@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <c29f706f-2fef-fbca-1b45-776882b8445c@suse.com>
Date: Thu, 3 Dec 2020 09:20:50 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <bcb0964d-9444-f5e6-372f-d8daa460fcfd@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 02.12.2020 17:34, Igor Druzhinin wrote:
> On 02/12/2020 15:21, Jan Beulich wrote:
>> On 02.12.2020 15:53, Igor Druzhinin wrote:
>>> On 02/12/2020 09:25, Jan Beulich wrote:
>>>> Instead I'm wondering whether this wouldn't better be a Kconfig
>>>> setting (or even command line controllable). There don't look to be
>>>> any restrictions on the precise value chosen (i.e. 2**n-1 like is
>>>> the case for old and new values here, for whatever reason), so a
>>>> simple permitted range of like 4...64 would seem fine to specify.
>>>> Whether the default then would want to be 8 (close to the current
>>>> 7) or higher (around the actually observed maximum) is a different
>>>> question.
>>>
>>> I'm in favor of a command line argument here - it would be much less trouble
>>> if a higher limit was suddenly necessary in the field. The default IMO
>>> should definitely be higher than 8 - I'd stick with number 32 which to me
>>> should cover our real world scenarios and apply some headroom for the future.
>>
>> Well, I'm concerned of the extra memory overhead. Every IRQ,
>> sharable or not, will get the extra slots allocated with the
>> current scheme. Perhaps a prereq change then would be to only
>> allocate multi-guest arrays for sharable IRQs, effectively
>> shrinking the overhead in particular for all MSI ones?
> 
> That's one way to improve overall system scalability but in that area
> there is certainly much bigger fish to fry elsewhere. With 32 elements in the
> array we get 200 bytes of overhead per structure, with 16 it's just 72 extra
> bytes which in the unattainable worst case scenario of every single vector taken
> in 512 CPU machine would only account for several MB of overhead.

I'm generally unhappy with this way of thinking, as this is what has
been leading to unnecessary growth of all sorts of software and its
needs of resources. Yes, there surely are larger gains to be had
elsewhere, but that's imo still no excuse to grow memory allocations
"blindly" despite it being clear that in a fair share of cases a
fair part of the allocated memory won't be used. This said, ...

> I'd start with dynamic array allocation first and setting the limit to 16 that
> should be enough for now. And then if that default value needs to be raised
> we can consider further improvements.

... I'm puzzled by this plan of yours, because unless I'm
misunderstanding dynamic array allocation is what I've been asking
for, effectively. Now that we have xmalloc_flex_struct(), this
should even be relatively straightforward, i.e. in particular with
no need to open code complex expressions.

Jan

