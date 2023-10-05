Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0801D7BAEEF
	for <lists+xen-devel@lfdr.de>; Fri,  6 Oct 2023 00:44:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.613158.953499 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qoX4Y-0005w3-Rw; Thu, 05 Oct 2023 22:43:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 613158.953499; Thu, 05 Oct 2023 22:43:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qoX4Y-0005uP-Oz; Thu, 05 Oct 2023 22:43:58 +0000
Received: by outflank-mailman (input) for mailman id 613158;
 Thu, 05 Oct 2023 22:43:57 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qoX4X-0005uG-Ip
 for xen-devel@lists.xenproject.org; Thu, 05 Oct 2023 22:43:57 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qoX4X-0002kK-Av; Thu, 05 Oct 2023 22:43:57 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.102])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qoX4X-0000cH-5h; Thu, 05 Oct 2023 22:43:57 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	References:Cc:To:From:Subject:MIME-Version:Date:Message-ID;
	bh=FTV4XgWMHAHr3r6KuDSze0ROkp+JDvxOwFLYEqC9iio=; b=izoyUxi+420NLIlFQm/5TDIyxx
	xkTjAMaC7S5IbR7Mth/TsJMvsiBOD3AmSeH7Vgwb7KJTYhIIUqj2+mXiFMQYSSSpvkoJCEQCgkkAE
	dN0Ub2y34qvyuJS218ZbRRVO5t5zPT2sPCTicSOVmnYKUn9VMcOQ8s24j6xBuuaUl6MA=;
Message-ID: <cc7ca277-8a58-765f-18dd-d0fd220683d3@xen.org>
Date: Thu, 5 Oct 2023 23:43:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.15.1
Subject: Re: [CRITICAL for 4.18] Re: [PATCH v5 00/10] runstate/time area
 registration by (guest) physical address
From: Julien Grall <julien@xen.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Roger Pau Monne <roger.pau@citrix.com>, xen-devel@lists.xenproject.org,
 henry.wang@arm.com
Cc: Tamas K Lengyel <tamas@tklengyel.com>, Jan Beulich <jbeulich@suse.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <20231002151127.71020-1-roger.pau@citrix.com>
 <ff8994eb-968d-4bbb-a960-e5ca78ef658e@citrix.com>
 <d388b32b-af07-279b-82af-a961c60f8c50@xen.org>
In-Reply-To: <d388b32b-af07-279b-82af-a961c60f8c50@xen.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 05/10/2023 23:40, Julien Grall wrote:
> Hi Andrew,
> 
> On 05/10/2023 19:58, Andrew Cooper wrote:
>> I see this series has been committed.  But it's broken in a really
>> fundamental way.
> 
> Thanks for pointing out. But I'd like to understand how I come to only 
> hear about those concerns on the series after committing. Did I miss any 
> thread? Even if this series has been pending for over 6 months, should 
> have I waited longer before committing?
> 
> Furthermore, Jan pointed out that this series was discussed recently 
> during the x86 meeting. Did you raise any concern during the call and 
> they were not carried on the ML?
> 
>> This is a new extension with persistent side effects to an existing part
>> of the guest ABI.
>>
>> Yet there doesn't appear to be any enumeration that the interface is
>> available to begin with.  Requiring the guest to probe subops, and
>> having no way to disable it on a per-domain basis is unacceptable, and
>> has exploded on us more times than I care to count in security fixes
>> alone, and that doesn't even cover the issues Amazon have reported over
>> the years.
> 
> Indeed. But, AFAIR, all those patches got stuck because of diverging 
> opinions between you and you. Can we finally come to an agreement on how 

The second 'you' was meant to be Jan. I didn't intend to say you were 
disagreing with yourself.

Cheers,

-- 
Julien Grall

