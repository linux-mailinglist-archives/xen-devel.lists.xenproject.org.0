Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AB7B85FDCD
	for <lists+xen-devel@lfdr.de>; Thu, 22 Feb 2024 17:14:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.684484.1064366 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rdBhr-0006CH-UG; Thu, 22 Feb 2024 16:13:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 684484.1064366; Thu, 22 Feb 2024 16:13:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rdBhr-0006AQ-Rd; Thu, 22 Feb 2024 16:13:55 +0000
Received: by outflank-mailman (input) for mailman id 684484;
 Thu, 22 Feb 2024 16:13:54 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1rdBhq-0006AK-CX
 for xen-devel@lists.xenproject.org; Thu, 22 Feb 2024 16:13:54 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rdBho-0002Bw-9N; Thu, 22 Feb 2024 16:13:52 +0000
Received: from [15.248.2.233] (helo=[10.24.67.33])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rdBho-0006zG-3Z; Thu, 22 Feb 2024 16:13:52 +0000
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
	bh=CiMqrbBdPVU+W4HhbnQ/ZpuHekVHjKIcVoIfUbi4hqk=; b=I3CoaIoXH2ufT/QY0ayJc6VckT
	SzKT5sSA/nWHTusP6SwtYjf4s8EuyyV6wtihe0+khnvBX7m2GSXs66tnFtuGp+i27U6EbG+ipf8xr
	lCRg4TxJPJO/eTIcPmlAJp9r966Irrh/w7NyJwZwydI0z9GPBgcc5PRszJn9ppWLX6WI=;
Message-ID: <e75c2613-ce22-4dd5-97b4-a95994d98231@xen.org>
Date: Thu, 22 Feb 2024 16:13:50 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] xen-analysis.py: Enable Xen deviation tag at the end
 of the line
Content-Language: en-GB
To: Stefano Stabellini <sstabellini@kernel.org>,
 Luca Fancellu <luca.fancellu@arm.com>
Cc: xen-devel@lists.xenproject.org, Andrew Cooper
 <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>,
 Jan Beulich <jbeulich@suse.com>, Wei Liu <wl@xen.org>
References: <20240131110241.3951995-1-luca.fancellu@arm.com>
 <alpine.DEB.2.22.394.2402141707290.1925432@ubuntu-linux-20-04-desktop>
From: Julien Grall <julien@xen.org>
In-Reply-To: <alpine.DEB.2.22.394.2402141707290.1925432@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Stefano,

On 15/02/2024 01:08, Stefano Stabellini wrote:
> On Wed, 31 Jan 2024, Luca Fancellu wrote:
>> This serie is enabling the xen-analysis tool to parse and substitute correctly
>> a deviation tag put at the end of the line containing a deviation to be deviated.
>>
>> Before this serie the only way to deviate a violation was to put the tag in the
>> line above:
>>
>> /* SAF-<id>-safe deviate the bla bla bla */
>> <line containing the violation>
>>
>> But there are places in the code base where using the tag in the line above is
>> not convinient, for example:
>>
>> if ( (expression) &&
>>       ((expression with violation) ||
>>       (expression) )
>> {
>>    [...]
>> }
>>
>> In the above example is better to have the suppression comment at the end of the
>> line:
>>
>> if ( (expression) &&
>>       ((expression with violation) || /* SAF-<id>-safe deviate the bla bla bla */
>>       (expression) )
>> {
>>    [...]
>> }
>>
>> This clearly brings up the question about the code style line length, which in
>> this case needs to be amended for Xen deviation tags that goes above the limit.
> 
> 
> Hi Luca,
> 
> I tested the series in a number of configurations and everything works
> as expected. Great!
> 
> For the whole series:
> 
> Acked-by: Stefano Stabellini <sstabellini@kernel.org>

This is now committed.

Cheers,


-- 
Julien Grall

