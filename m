Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A10C333B7B
	for <lists+xen-devel@lfdr.de>; Wed, 10 Mar 2021 12:33:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.96017.181433 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lJx5R-0000sB-9S; Wed, 10 Mar 2021 11:33:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 96017.181433; Wed, 10 Mar 2021 11:33:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lJx5R-0000rl-5q; Wed, 10 Mar 2021 11:33:09 +0000
Received: by outflank-mailman (input) for mailman id 96017;
 Wed, 10 Mar 2021 11:33:07 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=W5NQ=II=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lJx5P-0000rb-CR
 for xen-devel@lists.xenproject.org; Wed, 10 Mar 2021 11:33:07 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 6a7013db-5aa1-42ba-9e2a-9b10b5ea8a1f;
 Wed, 10 Mar 2021 11:33:04 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 34B2DAE55;
 Wed, 10 Mar 2021 11:33:03 +0000 (UTC)
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
X-Inumbo-ID: 6a7013db-5aa1-42ba-9e2a-9b10b5ea8a1f
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1615375983; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kKgNATYR2ADz53k1z4+P+EuL9I6B5cwi3wfN0okSA7M=;
	b=gMKWYUio844M0Bu+0bh8BSadA21sJ9tmw1KEjJRoVFeGaWyzKlzfnLS5XGzPnUthUKiHdo
	hqvqU5QI5QbBPQnCj60CGBih3sLuQN/1zZlTwIi1UVG8ueCFXaeCcDl5cdnMx9Twi+nD5l
	DZy6/IR4dVO5/Nx7X9f/Bz4GFdtICPg=
Subject: Re: Hit ASSERT in credit2 code with NR_CPUS=1 build
From: Jan Beulich <jbeulich@suse.com>
To: Dario Faggioli <dfaggioli@suse.com>
Cc: xen-devel@lists.xenproject.org, George Dunlap <george.dunlap@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <YEehTbVVjWMaqjCV@Air-de-Roger>
 <5ac80ae8be856e49fd83245eee4baae986beafa9.camel@suse.com>
 <d44b90fc-3fc5-7df4-672b-980cca41f776@suse.com>
Message-ID: <afe80187-ef54-bf8d-1e9d-3c6c1a31bfa6@suse.com>
Date: Wed, 10 Mar 2021 12:33:03 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <d44b90fc-3fc5-7df4-672b-980cca41f776@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 10.03.2021 12:24, Jan Beulich wrote:
> On 10.03.2021 12:13, Dario Faggioli wrote:
>> So, in my mind, now `mask` is empty. Therefore, I'm currently clueless
>> about why we enter this loop...
>>
>>>     for_each_cpu(i, &mask)
>>>     {
>>>         s_time_t score;
>>>
>>>         /* Already looked at this one above */
>>>         ASSERT(i != cpu); <====
>>>
>> ... and we reach this point.
> 
> from xen/cpumask.h:
> 
> #define for_each_cpu(cpu, mask)			\
> 	for ((cpu) = 0; (cpu) < 1; (cpu)++, (void)(mask))
> 
> I'm struggling though why this is this way.

Quoting Linux 5.11 (where, long ago, our code came from):

#define for_each_cpu(cpu, mask)			\
	for ((cpu) = 0; (cpu) < 1; (cpu)++, (void)mask)
#define for_each_cpu_not(cpu, mask)		\
	for ((cpu) = 0; (cpu) < 1; (cpu)++, (void)mask)
#define for_each_cpu_wrap(cpu, mask, start)	\
	for ((cpu) = 0; (cpu) < 1; (cpu)++, (void)mask, (void)(start))
#define for_each_cpu_and(cpu, mask1, mask2)	\
	for ((cpu) = 0; (cpu) < 1; (cpu)++, (void)mask1, (void)mask2)

where I find particularly odd that for_each_cpu() and
for_each_cpu_not() have the same effect when really they should act
on disjoint sets of CPUs.

I can't find anything under Documentation/ there, so my best guess
is that this is either a bug we share, or there was some historical
reason for the behavior which wasn't written down anywhere.

Jan

