Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D41FF4F2F33
	for <lists+xen-devel@lfdr.de>; Tue,  5 Apr 2022 14:07:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.298844.509180 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nbhxg-0003rM-F2; Tue, 05 Apr 2022 12:07:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 298844.509180; Tue, 05 Apr 2022 12:07:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nbhxg-0003oi-BS; Tue, 05 Apr 2022 12:07:04 +0000
Received: by outflank-mailman (input) for mailman id 298844;
 Tue, 05 Apr 2022 12:07:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FxJD=UP=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1nbhxe-0003oB-UI
 for xen-devel@lists.xenproject.org; Tue, 05 Apr 2022 12:07:03 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e56b0d9d-b4d8-11ec-a405-831a346695d4;
 Tue, 05 Apr 2022 14:07:01 +0200 (CEST)
Received: from [10.10.1.138] (static-72-81-132-2.bltmmd.fios.verizon.net
 [72.81.132.2]) by mx.zohomail.com
 with SMTPS id 1649160416307201.74447491950446;
 Tue, 5 Apr 2022 05:06:56 -0700 (PDT)
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
X-Inumbo-ID: e56b0d9d-b4d8-11ec-a405-831a346695d4
ARC-Seal: i=1; a=rsa-sha256; t=1649160417; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=c7Tlm1BibFHCgIIZ25boczd7nxwBD/71/ibtsOyBzZo9kr79K7Wgaq5HWWsyxOLpMNyOwmRy7aE27B5F6eQGbyt8SBRpVDgtbFkCk58TyKSrpHTtQeTUrWnzb6E+0X7NjxrZGUHAs8AXFEUxENA/O5/xlV8kLO38mRNtHsyLn18=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1649160417; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=W9uEMEEVdi9Ua83j3iyEoXl2G+KS1XiR5VYiEdS/0cA=; 
	b=O/hI+PxxLIYdP8mrE+C+z8EoT4oVm2+2nZJkvpBB8oA6Bes4rFOBPimTP0nf1hLMnha1aymAuZz9sm7JBBoKWbEuApi9Z80WwpuE7fkmdHi3Ogg0vWpUb3V8+97yHpcXNTEvPD2rDPkZl2taTCDSJPFpufWzI6kZDWWLhk/MtDY=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1649160417;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Message-ID:Date:Date:MIME-Version:To:To:Cc:Cc:References:From:From:Subject:Subject:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=W9uEMEEVdi9Ua83j3iyEoXl2G+KS1XiR5VYiEdS/0cA=;
	b=oFvqLPiW/4C11McAGs9zuj9v0laHYfvDfVElYdEXI4iC8OD3D/9tU13M9tlhvBL2
	RFzziBIQOUZb6pxU1o0FFPYSck+epuos7JK89avrXluULI8M9ITjnqCqeKMPSRVl06m
	ieLW6kBypL6W9mIA/Rmm4/6lniYm6pvHNaZ3tGm0=
Message-ID: <959fce1f-31c4-3de8-c3f2-45c307502473@apertussolutions.com>
Date: Tue, 5 Apr 2022 08:06:31 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org, scott.davis@starlab.io,
 jandryuk@gmail.com, Daniel De Graaf <dgdegra@tycho.nsa.gov>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>
References: <20220330230549.26074-1-dpsmith@apertussolutions.com>
 <20220330230549.26074-2-dpsmith@apertussolutions.com>
 <YkWgXhFVq/fD72CB@Air-de-Roger>
 <25c10763-36fa-34d4-05b6-655c08fdfee7@apertussolutions.com>
 <YksK9hIbJbOXkIYd@Air-de-Roger>
 <cd178295-4c8b-6710-3050-011fcee378b1@apertussolutions.com>
 <Ykvy4lWiwASHGXcF@Air-de-Roger>
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
Subject: Re: [PATCH 1/2] xsm: add ability to elevate a domain to privileged
In-Reply-To: <Ykvy4lWiwASHGXcF@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

On 4/5/22 03:42, Roger Pau Monné wrote:
> On Mon, Apr 04, 2022 at 12:08:25PM -0400, Daniel P. Smith wrote:
>> On 4/4/22 11:12, Roger Pau Monné wrote:
>>> On Mon, Apr 04, 2022 at 10:21:18AM -0400, Daniel P. Smith wrote:
>>>> On 3/31/22 08:36, Roger Pau Monné wrote:
>>>>> On Wed, Mar 30, 2022 at 07:05:48PM -0400, Daniel P. Smith wrote:
>>>>>> diff --git a/xen/include/xsm/xsm.h b/xen/include/xsm/xsm.h
>>>>>> index e22d6160b5..157e57151e 100644
>>>>>> --- a/xen/include/xsm/xsm.h
>>>>>> +++ b/xen/include/xsm/xsm.h
>>>>>> @@ -189,6 +189,28 @@ struct xsm_operations {
>>>>>>  #endif
>>>>>>  };
>>>>>>  
>>>>>> +static always_inline int xsm_elevate_priv(struct domain *d)
>>>>>
>>>>> I don't think it needs to be always_inline, using just inline would be
>>>>> fine IMO.
>>>>>
>>>>> Also this needs to be __init.
>>>>
>>>> AIUI always_inline is likely the best way to preserve the speculation
>>>> safety brought in by the call to is_system_domain().
>>>
>>> There's nothing related to speculation safety in is_system_domain()
>>> AFAICT. It's just a plain check against d->domain_id. It's my
>>> understanding there's no need for any speculation barrier there
>>> because d->domain_id is not an external input.
>>
>> Hmmm, this actually raises a good question. Why is is_control_domain(),
>> is_hardware_domain, and others all have evaluate_nospec() wrapping the
>> check of a struct domain element while is_system_domain() does not?
> 
> Jan replied to this regard, see:
> 
> https://lore.kernel.org/xen-devel/54272d08-7ce1-b162-c8e9-1955b780ca11@suse.com/

Jan can correct me if I misunderstood, but his point is with respect to
where the inline function will be expanded into and I would think you
would want to ensure that if anyone were to use is_system_domain(), then
the inline expansion of this new location could create a potential
speculation-able branch. Basically my concern is not putting the guards
in place today just because there is not currently any location where
is_system_domain() is expanded to create a speculation opportunity does
not mean there is not an opening for the opportunity down the road for a
future unprotected use.

>>> In any case this function should be __init only, at which point there
>>> are no untrusted inputs to Xen.
>>
>> I thought it was agreed that __init on inline functions in headers had
>> no meaning?
> 
> In a different reply I already noted my preference would be for the
> function to not reside in a header and not be inline, simply because
> it would be gone after initialization and we won't have to worry about
> any stray calls when the system is active.

If an inline function is only used by __init code, how would be
available for stray calls when the system is active? I would concede
that it is possible for someone to explicitly use in not __init code but
I would like to believe any usage in a submitted code change would be
questioned by the reviewers.

With that said, if we consider Jason's suggestion would this remove your
concern since that would only introduce a de-privilege function and
there would be no piv escalation that could be erroneously called at
anytime?

v/r
dps

