Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EBABD31EBE7
	for <lists+xen-devel@lfdr.de>; Thu, 18 Feb 2021 16:57:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.86702.162963 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lClfy-0001Ik-Mk; Thu, 18 Feb 2021 15:57:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 86702.162963; Thu, 18 Feb 2021 15:57:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lClfy-0001IL-It; Thu, 18 Feb 2021 15:57:10 +0000
Received: by outflank-mailman (input) for mailman id 86702;
 Thu, 18 Feb 2021 15:57:08 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=x3vz=HU=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lClfw-0001IF-CN
 for xen-devel@lists.xenproject.org; Thu, 18 Feb 2021 15:57:08 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 34a89aa1-8a97-4477-9280-a1eb20102512;
 Thu, 18 Feb 2021 15:57:07 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id BACE2AD57;
 Thu, 18 Feb 2021 15:57:06 +0000 (UTC)
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
X-Inumbo-ID: 34a89aa1-8a97-4477-9280-a1eb20102512
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1613663826; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1HFE6TUCiuqRztdB/XB1rh8grG5LF44712bwwFCFtZs=;
	b=qn65r9eCaNmJqux2b6wa5QgfXBiBaLLJOMMAdthfG0EkFcXw3E88+nijwZxCbTN8YQBuX6
	JxR6dx9b2I0RsCuXz7GWRJclYTt2AkD1X0PBQowJf/2MM2WBAhjH3zTaXEbgJpkVUCFxi9
	PNv5dwwOnL/VVkt0p1uV+DkiR1YVbxE=
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
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <8ffd4f51-5fc6-349b-146f-e52c35c59b4d@suse.com>
Date: Thu, 18 Feb 2021 16:57:05 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <YC6NPcym62a0Nu0M@Air-de-Roger>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 18.02.2021 16:52, Roger Pau Monné wrote:
> On Thu, Feb 18, 2021 at 12:54:13PM +0100, Jan Beulich wrote:
>> On 18.02.2021 11:42, Roger Pau Monné wrote:
>>> Not that you need to implement the full thing now, but maybe we could
>>> have something like:
>>>
>>> "
>>> =item B<ignore_msrs=[ "MSR_RANGE, "MSR_RANGE", ..]>
>>>
>>> Specify a list of MSR ranges that will be ignored by the hypervisor:
>>> reads will return zeros and writes will be discarded without raising a
>>> #GP.
>>>
>>> Each MSR_RANGE is given in hexadecimal format and may be a range, e.g.
>>> c00102f0-c00102f1 (inclusive), or a single MSR, e.g. c00102f1.
>>> "
>>>
>>> Then you can print the messages in the hypervisor using a guest log
>>> level and modify it on demand in order to get more verbose output?
>>
>> "Modify on demand"? Irrespective of what you mean with this, ...
>>
>>> I don't think selecting whether the messages are printed or not from
>>> xl is that helpful as the same could be achieved using guest_loglvl.
>>
>> ... controlling this via guest_loglvl would affect various other
>> log messages' visibility.
> 
> Right, but do we really need this level of per-guest log control,
> implemented in this way exclusively for MSRs?
> 
> We don't have a way for other parts of the code to have such
> fine-grained control about what messages should be printed, and I
> don't think MSR should be an exception. I assume this would be used to
> detect which MSRs a guest is trying to access, and I would be fine
> just using guest_loglvl to that end, the more that it can be modified
> at run time now.

I can certainly see your point. The problem is that for guests
heavily accessing such MSRs, all other messages may disappear
due to rate limiting. That's not going to be helpful.

Jan

