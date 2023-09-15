Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 323C17A1FAE
	for <lists+xen-devel@lfdr.de>; Fri, 15 Sep 2023 15:19:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.603142.940045 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qh8iS-00037m-7H; Fri, 15 Sep 2023 13:18:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 603142.940045; Fri, 15 Sep 2023 13:18:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qh8iS-00035L-3p; Fri, 15 Sep 2023 13:18:36 +0000
Received: by outflank-mailman (input) for mailman id 603142;
 Fri, 15 Sep 2023 13:18:34 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qh8iP-00035F-Uh
 for xen-devel@lists.xenproject.org; Fri, 15 Sep 2023 13:18:34 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qh8iM-0003ye-8A; Fri, 15 Sep 2023 13:18:30 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.240])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qh8iL-0001Rv-MO; Fri, 15 Sep 2023 13:18:29 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID;
	bh=VYihbhOA3pUgFPfEFlAK13mqDlbZwkOelpg+e6ODB5s=; b=GJYKagUsxGvAjrhHjH0KfpD+RC
	X/dYkd3HViJuzbQO0Pfdahykq6sAJT6HZONz/jX+qA64yXLSYxAoudlxfCgScNBetpRqCMWtbMbfh
	GOGGCT36Qpux2qPb5uJUcjqg1nbXHbNz/gQpofxm+U4fhfBEgVUy7uMMl0/RWF9IojL4=;
Message-ID: <7f896d46-e25a-40f0-bb74-9a471207aa94@xen.org>
Date: Fri, 15 Sep 2023 14:18:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] xen/x86: io_apic: Introduce a command line option to
 skip timer check
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>
Cc: Julien Grall <jgrall@amazon.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20230818134441.45586-1-julien@xen.org>
 <20230818134441.45586-2-julien@xen.org>
 <bb92bc36-db32-322b-569c-a176f08a95a0@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <bb92bc36-db32-322b-569c-a176f08a95a0@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 07/09/2023 15:09, Jan Beulich wrote:
> On 18.08.2023 15:44, Julien Grall wrote:
>> --- a/docs/misc/xen-command-line.pandoc
>> +++ b/docs/misc/xen-command-line.pandoc
>> @@ -1896,6 +1896,13 @@ This option is ignored in **pv-shim** mode.
>>   ### nr_irqs (x86)
>>   > `= <integer>`
>>   
>> +### no_timer_works (x86)
>> +> `=<boolean>`
>> +
>> +> Default: `true`
>> +
>> +Disables the code which tests for broken timer IRQ sources.
> 
> In description and code it's "check", but here it's "works". Likely
> just a typo. But I'd prefer if we didn't introduce any new "no*"
> options which then can be negated to "no-no*". Make it "timer-check"
> (also avoiding the underscore, no matter that Linux uses it), or
> alternatively make it a truly positive option, e.g. "timer-irq-works".

I don't mind too much about using - over _ but it is never clear why you 
strongly push for it (and whether the others agrees). Is this documented 
somewhere? If not, can you do it so everyone can apply it consistently? 
(At least I would not remember to ask for it because I am happy with the _).

I will go for 'timer-irq-works'.

> 
> I also think it wants emphasizing that if this option is used and then
> something doesn't work, people are on their own.

I will do that.

Note that I will only resend a new version after the tree as branched 
because this is not meant for 4.18.

Cheers,

-- 
Julien Grall

