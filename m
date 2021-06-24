Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DD2623B34AA
	for <lists+xen-devel@lfdr.de>; Thu, 24 Jun 2021 19:21:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.146970.270615 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lwT14-0007kq-Ci; Thu, 24 Jun 2021 17:19:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 146970.270615; Thu, 24 Jun 2021 17:19:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lwT14-0007iO-9U; Thu, 24 Jun 2021 17:19:50 +0000
Received: by outflank-mailman (input) for mailman id 146970;
 Thu, 24 Jun 2021 17:19:48 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LLZQ=LS=apertussolutions.com=dpsmith@srs-us1.protection.inumbo.net>)
 id 1lwT11-0007iI-T3
 for xen-devel@lists.xenproject.org; Thu, 24 Jun 2021 17:19:48 +0000
Received: from sender4-of-o51.zoho.com (unknown [136.143.188.51])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id bb578848-5d1a-4c1d-9d58-8b9e23efc5e0;
 Thu, 24 Jun 2021 17:19:46 +0000 (UTC)
Received: from [192.168.1.11] (209.152.155.107.marktwain.net
 [209.152.155.107]) by mx.zohomail.com
 with SMTPS id 1624555165661442.5443098503854;
 Thu, 24 Jun 2021 10:19:25 -0700 (PDT)
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
X-Inumbo-ID: bb578848-5d1a-4c1d-9d58-8b9e23efc5e0
ARC-Seal: i=1; a=rsa-sha256; t=1624555168; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=en9Nl1hEPxBjl04S36MyuRPlcSswqNvJCqam4v0a/c6y/efDVpkdHg4CzU3I46egcJ+yCn11GjCKRgCClpmwJu+hiyLFx0ejwsPJuXDaw41fjX4LLSZF3CczS4U+LVROjxm8vwX98c9Q0UuhP4bEmcci4aB4wCdA0ek6YvtyogQ=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1624555168; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=yZyPrGS+9kVuE3ObNTJW3JxOpqrFNV+fuzYelEs9TOc=; 
	b=VA2iT+UH4GS+baJUGhVet8VHYBIne/BrMS8KIBO/ZVhX5dEQY6cozzHrK7REv2sUrxuCJy8B9Bq2meFOvFDm0Bxaq1o2tZh4rVnOd9EpjyZN8jz+7J39yPqbMwwsPGsGVT4Q5QHOb/BJshE1WERdQ1SCgC4WJplbtW0nCWXBDqo=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1624555168;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=yZyPrGS+9kVuE3ObNTJW3JxOpqrFNV+fuzYelEs9TOc=;
	b=c8fffKpe3mg8pHMWUGWs+6rtPpu6kP8xnArCiED+GUmxdjtZCumc9oUST9VyVpp5
	4ycbrZTrWiBRg+t547nN5iUvyh4aycwmphyKDdT9wz9y0nA4OJ3EqDpcqfNtrVOyZLp
	PC3QHJ8ZitPuHZoBfJ2HYM4iecdlgbz1T0hjEJio=
Subject: Re: [PATCH 3/6] xsm: enabling xsm to always be included
To: Jan Beulich <jbeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Tamas K Lengyel <tamas@tklengyel.com>,
 Tim Deegan <tim@xen.org>, Juergen Gross <jgross@suse.com>,
 Alexandru Isaila <aisaila@bitdefender.com>,
 Petre Pircalabu <ppircalabu@bitdefender.com>,
 Dario Faggioli <dfaggioli@suse.com>, Paul Durrant <paul@xen.org>,
 Daniel De Graaf <dgdegra@tycho.nsa.gov>, persaur@gmail.com,
 christopher.w.clark@gmail.com, adam.schwalm@starlab.io,
 scott.davis@starlab.io, xen-devel@lists.xenproject.org,
 Andrew Cooper <andrew.cooper3@citrix.com>
References: <20210617233918.10095-1-dpsmith@apertussolutions.com>
 <20210617233918.10095-4-dpsmith@apertussolutions.com>
 <a8d60866-b9d9-8a76-3acc-703799b204b6@citrix.com>
 <3df8648d-f706-9684-4e6d-9438dc9f0894@apertussolutions.com>
 <ca65acbc-c57c-6056-7abd-299ce5ccd643@suse.com>
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
Message-ID: <9be51dc7-2534-64c9-30dd-06eddc5702ba@apertussolutions.com>
Date: Thu, 24 Jun 2021 13:18:00 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <ca65acbc-c57c-6056-7abd-299ce5ccd643@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External



On 6/21/21 2:53 AM, Jan Beulich wrote:
> On 18.06.2021 18:35, Daniel P. Smith wrote:
>> On 6/18/21 7:53 AM, Andrew Cooper wrote:
>>> On 18/06/2021 00:39, Daniel P. Smith wrote:
>>>> @@ -250,9 +261,8 @@ config XSM_FLASK_POLICY
>>>>   	  If unsure, say Y.
>>>>   
>>>>   config XSM_SILO
>>>> -	def_bool y
>>>> +	def_bool n
>>>
>>> I'm not sure we want to alter the FLASK/SILO defaults.  SILO in
>>> particular is mandatory on ARM, and without it, you're in a security
>>> unsupported configuration.
>> The intent here is the default is the classic dom0 configuration. What
>> if I did,
>>
>> def bool n
>> def bool y if ARM
> 
> Besides it needing to be with the order of the two lines flipped, if
> Arm requires XSM_SILO, then I think it would better "select" it.


Ack, I realized that as I fixed it for the upcoming v2.

Correct me if I am wrong but if you do a "select" that means you are 
forcing the user to always have SILO built in, i.e. that makes it so the 
option cannot be disabled. There may be users who would prefer to only 
have Flask enabled on ARM and those users would not be able to turn SILO 
off.

v/r,
dps

