Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 172CA321435
	for <lists+xen-devel@lfdr.de>; Mon, 22 Feb 2021 11:34:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.87888.165130 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lE8XB-0001uz-K4; Mon, 22 Feb 2021 10:33:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 87888.165130; Mon, 22 Feb 2021 10:33:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lE8XB-0001ua-GW; Mon, 22 Feb 2021 10:33:45 +0000
Received: by outflank-mailman (input) for mailman id 87888;
 Mon, 22 Feb 2021 10:33:44 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=6bXc=HY=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lE8XA-0001uR-Hm
 for xen-devel@lists.xenproject.org; Mon, 22 Feb 2021 10:33:44 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d6b05476-8d51-4bd7-93fe-f45c4a10e9ad;
 Mon, 22 Feb 2021 10:33:43 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id AC41DACCF;
 Mon, 22 Feb 2021 10:33:42 +0000 (UTC)
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
X-Inumbo-ID: d6b05476-8d51-4bd7-93fe-f45c4a10e9ad
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1613990022; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XP6ExC202EgsdIHhSjjZkbCWtVSsVnCYDjnEzu3A4dA=;
	b=jk9HdvMe8h6xnyiVpcIVst5T5z8ivntHIg4nGI0GuFYv9paG9ZDpfTWM/xfsG7LcolaNs1
	8AmLEMCsObu3K1KJuyKnHsUdSKRT+kwpoWDVuypjZ18VPHBAQfZewXsZw5zF1YAkEVLI+u
	0bHdqPAlcx7DA7oF72ifu8JGNcRk4e4=
Subject: Re: [PATCH v2 1/4] xl: Add support for ignore_msrs option
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org, iwj@xenproject.org, wl@xen.org,
 anthony.perard@citrix.com, andrew.cooper3@citrix.com,
 jun.nakajima@intel.com, kevin.tian@intel.com,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>
References: <1611182952-9941-1-git-send-email-boris.ostrovsky@oracle.com>
 <1611182952-9941-2-git-send-email-boris.ostrovsky@oracle.com>
 <YC5EitRCZB+VCeCC@Air-de-Roger>
 <a78a4b94-47cc-64c0-1b1f-8429665822b2@suse.com>
 <YC6NPcym62a0Nu0M@Air-de-Roger>
 <8ffd4f51-5fc6-349b-146f-e52c35c59b4d@suse.com>
 <5b286dfd-278b-8675-cd88-3ee2706c06e1@oracle.com>
 <YDOGWC/VK9eOtgLw@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <99dace05-576d-bd53-898b-74130ffc59fe@suse.com>
Date: Mon, 22 Feb 2021 11:33:42 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <YDOGWC/VK9eOtgLw@Air-de-Roger>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 22.02.2021 11:24, Roger Pau Monné wrote:
> On Fri, Feb 19, 2021 at 09:50:12AM -0500, Boris Ostrovsky wrote:
>>
>> On 2/18/21 10:57 AM, Jan Beulich wrote:
>>> On 18.02.2021 16:52, Roger Pau Monné wrote:
>>>> On Thu, Feb 18, 2021 at 12:54:13PM +0100, Jan Beulich wrote:
>>>>> On 18.02.2021 11:42, Roger Pau Monné wrote:
>>>>>> Not that you need to implement the full thing now, but maybe we could
>>>>>> have something like:
>>>>>>
>>>>>> "
>>>>>> =item B<ignore_msrs=[ "MSR_RANGE, "MSR_RANGE", ..]>
>>>>>>
>>>>>> Specify a list of MSR ranges that will be ignored by the hypervisor:
>>>>>> reads will return zeros and writes will be discarded without raising a
>>>>>> #GP.
>>>>>>
>>>>>> Each MSR_RANGE is given in hexadecimal format and may be a range, e.g.
>>>>>> c00102f0-c00102f1 (inclusive), or a single MSR, e.g. c00102f1.
>>>>>> "
>>>>>>
>>>>>> Then you can print the messages in the hypervisor using a guest log
>>>>>> level and modify it on demand in order to get more verbose output?
>>>>> "Modify on demand"? Irrespective of what you mean with this, ...
>>>>>
>>>>>> I don't think selecting whether the messages are printed or not from
>>>>>> xl is that helpful as the same could be achieved using guest_loglvl.
>>>>> ... controlling this via guest_loglvl would affect various other
>>>>> log messages' visibility.
>>>> Right, but do we really need this level of per-guest log control,
>>>> implemented in this way exclusively for MSRs?
>>
>>
>> In a multi-tenant environment we may need to figure out why a particular guest is failing to boot, without affecting behavior of other guests.
>>
>>
>> If we had per-guest log level in general then what you are suggesting would be the right thing to do IMO. Maybe that's what we should add?
> 
> Yes, that would seem better IMO, but I don't think it's fair to ask
> you to do that work.
> 
> Do you think it would be acceptable to untangle both, and try to get
> the MSR stuff without any logging changes?
> 
> I know we would be addressing only one part of what the series
> originally tried to achieve, but I would rather prefer to have a
> generic way to set a per-guest log level rather than something
> specific to MSR accesses.

TBH I'd see us go the other route: Follow Boris'es approach for
4.15, and switch the logging control to per-guest once that
ability is there, _and_ if we're really convinced we don't want
to have this extra level of control. The latter because I think
a domain could end up pretty chatty just because of MSR accesses,
and it might therefore be undesirable to also hide all other
potentially relevant output. Perhaps the per-domain log level
control needs to be finer grained than what "guest_loglvl="
currently permits, more like what "hvm_debug=" has.

Jan

