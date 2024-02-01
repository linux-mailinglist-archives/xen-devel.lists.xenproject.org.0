Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F22D8845904
	for <lists+xen-devel@lfdr.de>; Thu,  1 Feb 2024 14:36:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.674429.1049320 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rVXEE-0005ce-Ve; Thu, 01 Feb 2024 13:35:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 674429.1049320; Thu, 01 Feb 2024 13:35:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rVXEE-0005b4-Rv; Thu, 01 Feb 2024 13:35:42 +0000
Received: by outflank-mailman (input) for mailman id 674429;
 Thu, 01 Feb 2024 13:35:41 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1rVXED-0005ay-7r
 for xen-devel@lists.xenproject.org; Thu, 01 Feb 2024 13:35:41 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rVXE8-00018T-5A; Thu, 01 Feb 2024 13:35:36 +0000
Received: from [15.248.2.31] (helo=[10.24.67.35])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rVXE7-0005nq-TT; Thu, 01 Feb 2024 13:35:36 +0000
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
	bh=6zsy4WakuTn74XC7bvekR33avbJIFGCKsBaSH8B/Nkk=; b=vgnHXgXOOytksbrFMm8skNetQ8
	C/J63cs7CWC1BoSur++uWVpGw1Ck3fT1PlFMG4PkNTlXR3vMVlHktDKAP07AKz8g3ZHyI+YK7NtAV
	eWzTJjP6tLHtpdyGnLUVyCj6ZgeuWmc1Hi6r3qVecgrb3z2Xz1bEqnpsRDA1FPi1UPUw=;
Message-ID: <12b2d25a-ff80-45d8-ad3e-fca6684508df@xen.org>
Date: Thu, 1 Feb 2024 13:35:33 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 04/15] xen/arm: add Dom0 cache coloring support
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>,
 Carlo Nonato <carlo.nonato@minervasys.tech>
Cc: andrea.bastoni@minervasys.tech, Andrew Cooper
 <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Marco Solieri <marco.solieri@minervasys.tech>, xen-devel@lists.xenproject.org
References: <20240129171811.21382-1-carlo.nonato@minervasys.tech>
 <20240129171811.21382-5-carlo.nonato@minervasys.tech>
 <cf23d8a8-7111-4014-adc7-93ecd5f110ec@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <cf23d8a8-7111-4014-adc7-93ecd5f110ec@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Jan,

On 01/02/2024 13:30, Jan Beulich wrote:
> On 29.01.2024 18:18, Carlo Nonato wrote:
>> Add a command line parameter to allow the user to set the coloring
>> configuration for Dom0.
>> A common configuration syntax for cache colors is introduced and
>> documented.
>> Take the opportunity to also add:
>>   - default configuration notion.
>>   - function to check well-formed configurations.
>>
>> Direct mapping Dom0 isn't possible when coloring is enabled, so
>> CDF_directmap flag is removed when creating it.
> 
> What implications does this have?
> 
>> --- a/docs/misc/xen-command-line.pandoc
>> +++ b/docs/misc/xen-command-line.pandoc
>> @@ -963,6 +963,15 @@ Controls for the dom0 IOMMU setup.
>>   
>>   Specify a list of IO ports to be excluded from dom0 access.
>>   
>> +### dom0-llc-colors
>> +> `= List of [ <integer> | <integer>-<integer> ]`
>> +
>> +> Default: `All available LLC colors`
>> +
>> +Specify dom0 LLC color configuration. This options is available only when
>> +`CONFIG_LLC_COLORING` is enabled. If the parameter is not set, all available
>> +colors are used.
> 
> Even Arm already has a "dom0=" option. Is there a particular reason why
> this doesn't become a new sub-option there?
> 
> As to meaning: With just a single <integer>, that's still a color value
> then (and not a count of colors)? Wouldn't it make sense to have a
> simpler variant available where you just say how many, and a suitable
> set/range is then picked?
> 
> Finally a nit: "This option is ...".
> 
>> @@ -2188,10 +2190,16 @@ void __init create_dom0(void)
>>               panic("SVE vector length error\n");
>>       }
>>   
>> -    dom0 = domain_create(0, &dom0_cfg, CDF_privileged | CDF_directmap);
>> +    if ( !llc_coloring_enabled )
>> +        flags |= CDF_directmap;
>> +
>> +    dom0 = domain_create(0, &dom0_cfg, flags);
>>       if ( IS_ERR(dom0) )
>>           panic("Error creating domain 0 (rc = %ld)\n", PTR_ERR(dom0));
>>   
>> +    if ( llc_coloring_enabled && (rc = dom0_set_llc_colors(dom0)) )
>> +        panic("Error initializing LLC coloring for domain 0 (rc = %d)", rc);
> 
> As for the earlier patch, I find panic()ing here dubious. You can continue
> quite fine, with a warning and perhaps again tainting the system.
There are arguments for both approach. I agree that you can continue but 
technically this is not the configuration you asked. Someone may not 
notice the tainting until it is too late (read they have done 
investigation).

Bear in mind that the user for cache coloring will be in very 
specialized environment. So if you can't enable cache coloring in 
production, then something really wrong has happened and continue to 
boot is probably not right.

This matches the approach for Arm we have been using since the 
beginning. And I will strongly argue to continue this way.

Cheers,

-- 
Julien Grall

