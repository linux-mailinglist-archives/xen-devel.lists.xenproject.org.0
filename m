Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C1D331EDFC1
	for <lists+xen-devel@lfdr.de>; Thu,  4 Jun 2020 10:26:04 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jglBp-00050k-DI; Thu, 04 Jun 2020 08:25:29 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=pUjb=7R=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1jglBn-00050f-3i
 for xen-devel@lists.xenproject.org; Thu, 04 Jun 2020 08:25:27 +0000
X-Inumbo-ID: f0c42588-a63c-11ea-ae3d-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f0c42588-a63c-11ea-ae3d-12813bfff9fa;
 Thu, 04 Jun 2020 08:25:26 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id B7777AC96;
 Thu,  4 Jun 2020 08:25:28 +0000 (UTC)
Subject: Re: Xenstore quota and driver domains
To: paul@xen.org, xen-devel@lists.xenproject.org
References: <35df958d-eff8-9ca7-fd72-05694f07248d@suse.com>
 <006701d63a47$408511c0$c18f3540$@xen.org>
 <f7fe86f0-f8b0-ebb2-4d01-d3b59bc38d41@suse.com>
 <006801d63a48$7173f750$545be5f0$@xen.org>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <ed822418-7209-625e-99b9-bd87098c1150@suse.com>
Date: Thu, 4 Jun 2020 10:25:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <006801d63a48$7173f750$545be5f0$@xen.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 04.06.20 10:16, Paul Durrant wrote:
>> -----Original Message-----
>> From: Jürgen Groß <jgross@suse.com>
>> Sent: 04 June 2020 09:11
>> To: paul@xen.org; xen-devel@lists.xenproject.org
>> Subject: Re: Xenstore quota and driver domains
>>
>> On 04.06.20 10:07, Paul Durrant wrote:
>>>> -----Original Message-----
>>>> From: Xen-devel <xen-devel-bounces@lists.xenproject.org> On Behalf Of Jürgen Groß
>>>> Sent: 04 June 2020 06:03
>>>> To: xen-devel@lists.xenproject.org
>>>> Subject: Xenstore quota and driver domains
>>>>
>>>> A recent report on xen-users surfaced a problem we have with driver
>>>> domains in medium sized or large configuration: the driver domain can
>>>> easily hit the default Xenstore quota (in the report it was a driver
>>>> domain for disks which hit the quota when 15 domUs were active at the
>>>> same time).
>>>
>>> Which quota is hit? Node or watch?
>>
>> Node.
>>
> 
> Ok. Since each individual backend is going to watch at least its frontend's 'state' node then a watch quota of 128 is still probably going to be restrictive for a global driver domain so this ought to be settable on a per-domain basis as well as the node quota.

TBH I'd go with any quota to be settable via the new interface.

Currently we have:

- number of nodes
- max size of a node
- number of watches
- number of concurrent active transactions

and there might be more coming in the future.


Juergen

