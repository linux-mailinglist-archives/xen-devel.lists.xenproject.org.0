Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 04E7632E688
	for <lists+xen-devel@lfdr.de>; Fri,  5 Mar 2021 11:36:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.93615.176566 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lI7oL-0005Ri-Ih; Fri, 05 Mar 2021 10:35:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 93615.176566; Fri, 05 Mar 2021 10:35:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lI7oL-0005RM-FQ; Fri, 05 Mar 2021 10:35:57 +0000
Received: by outflank-mailman (input) for mailman id 93615;
 Fri, 05 Mar 2021 10:35:55 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=IQfx=ID=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lI7oJ-0005RH-Qq
 for xen-devel@lists.xenproject.org; Fri, 05 Mar 2021 10:35:55 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 4ccef588-6c02-42e0-9dd0-2e246beba10e;
 Fri, 05 Mar 2021 10:35:55 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 116F8AC54;
 Fri,  5 Mar 2021 10:35:54 +0000 (UTC)
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
X-Inumbo-ID: 4ccef588-6c02-42e0-9dd0-2e246beba10e
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1614940554; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=R09jOA2PM3Wd5x+6RaZQyLd9dqmNo7T6Vj0dK1AMmoA=;
	b=PJkSwPA4Omd4bejsaCDehcJQW9+vaZwm05KGC5oQVyjTpbZ8tv5dNDqmKMp0K1rVmTM18+
	ufMHkif9gZbTLzE1Zr09iHgzs+C+8Y1MORHW6ypKYMfjx88YAUcOn2LDjhP0vs4x3dqz0l
	siXSTOwtsROYAAwLoCGxuRNyuOHM0NQ=
Subject: Re: [PATCH v2 for-4.15] x86/msr: introduce an option for HVM relaxed
 rdmsr behavior
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org, Ian Jackson <iwj@xenproject.org>,
 Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>,
 Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>
References: <20210304144755.35891-1-roger.pau@citrix.com>
 <4cb7e1f3-0593-6d06-281a-e3bf06843221@citrix.com>
 <YEH2rEw31frFcq4D@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <4353ffce-52ae-ec7f-01cb-57b24618eed0@suse.com>
Date: Fri, 5 Mar 2021 11:35:54 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <YEH2rEw31frFcq4D@Air-de-Roger>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 05.03.2021 10:15, Roger Pau Monné wrote:
> On Fri, Mar 05, 2021 at 12:06:19AM +0000, Andrew Cooper wrote:
>> On 04/03/2021 14:47, Roger Pau Monne wrote:
>>> From a release PoV the biggest risk would be breaking some of the
>>> existing MSR functionality. I think that's a necessary risk in order
>>> to offer such fallback option, or else we might discover after the
>>> release that guests that worked on Xen 4.14 don't work anymore in Xen
>>> 4.15.
>>
>> Much as I'd prefer not to have this, I agree with the sentiment that we
>> should have an "emergency undo" which people can use, and carry it for
>> at least a short while.
>>
>> However, to be useful for the purpose of unbreaking VMs, it must change
>> both the read and write behaviour, because both are potential
>> compatibility concerns (without reintroducing the information leak).
> 
> I think I was confused here and assumed the previous behavior would
> check the written value to match the current underlying value before
> injecting a #GP. That's not the case.
> 
> I can expand this patch to include the write side, I just thought
> having the rad side only would be enough to cover for the unhandled
> MSRs accesses.

Both when seeing this patch's title and when ripping the write part
out of my patch I meant to indicate the same - dealing with just
reads may not be enough. Arguably people could be told to first try
with just relaxing rdmsr handling, but ones anxious to get their
VMs back into production use may ignore such an advice and use the
bigger hammer right away.

Jan

