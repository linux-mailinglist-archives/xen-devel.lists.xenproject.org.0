Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B3853FB71D
	for <lists+xen-devel@lfdr.de>; Mon, 30 Aug 2021 15:42:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.175108.319097 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mKhY2-0000tl-Rd; Mon, 30 Aug 2021 13:42:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 175108.319097; Mon, 30 Aug 2021 13:42:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mKhY2-0000ql-NZ; Mon, 30 Aug 2021 13:42:02 +0000
Received: by outflank-mailman (input) for mailman id 175108;
 Mon, 30 Aug 2021 13:42:02 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=krMZ=NV=apertussolutions.com=dpsmith@srs-us1.protection.inumbo.net>)
 id 1mKhY2-0000qf-4F
 for xen-devel@lists.xenproject.org; Mon, 30 Aug 2021 13:42:02 +0000
Received: from sender4-of-o51.zoho.com (unknown [136.143.188.51])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c44ee82c-2aeb-4821-bfd5-deb367491c1a;
 Mon, 30 Aug 2021 13:42:00 +0000 (UTC)
Received: from [10.10.1.24] (static-72-81-132-2.bltmmd.fios.verizon.net
 [72.81.132.2]) by mx.zohomail.com
 with SMTPS id 1630330915388408.5428746821407;
 Mon, 30 Aug 2021 06:41:55 -0700 (PDT)
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
X-Inumbo-ID: c44ee82c-2aeb-4821-bfd5-deb367491c1a
ARC-Seal: i=1; a=rsa-sha256; t=1630330918; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=SPaG1S/ViroJLZyPe5xn7fnBsbH9HfSxg6LzeBicxlR6H85dQdJv5ik/4Xw36IGJ1XzlDByKEdWdbiLvfcO4iwyPXFhYkumuo9N0+iqRAY/5O1JpYXDyusKUKEqdFHbTm6llox8SNLkWIbRw/A6pJn9xnzfsaZHdme7+XPTuyZY=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1630330918; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=8mUYezkGPNWlbfPrt0JI7s8sUghWScRmlRM8XYAZqVA=; 
	b=AsIYBqmaW2RpYhD+3076EyUDWmh7d4FzO8WdCHOt3tH3/6it/uYC5Osf+25lG9siRfEQ2avjmEtJANcEZ2OVLhgiUeoAEBDAFoPrsZ1A49mXiCu8aEetlMfE6yW8nn+Rn92WlmmfqP7eRZaZzs915pSSGPkcM3me6cxch0UyR0g=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1630330918;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=To:Cc:References:From:Subject:Message-ID:Date:MIME-Version:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=8mUYezkGPNWlbfPrt0JI7s8sUghWScRmlRM8XYAZqVA=;
	b=IEZBGfMSXnbrUGlnGhJTh3MHy86hSlu2a80Pmlh/PjG9NMehw6gIDyiabvRU8FWC
	4LnmPmozpD5Cpc+5gz0yUxGn9bQdheKkdkHOSvCM11s2k63WhV0RLREB0rxaYSAjwW+
	lDNRkQ4Z9TDYR0djahyYhOx901ACHJGJIFEmAxh8=
To: Jan Beulich <jbeulich@suse.com>
Cc: Daniel De Graaf <dgdegra@tycho.nsa.gov>, xen-devel@lists.xenproject.org
References: <20210805140644.357-1-dpsmith@apertussolutions.com>
 <20210805140644.357-6-dpsmith@apertussolutions.com>
 <2e4471d4-7d0a-757f-1291-de6e93d1d6f6@suse.com>
 <ba39f827-3fea-faed-9fde-105d03d3b417@apertussolutions.com>
 <c40d6fd3-ac7d-c824-32d9-678c7fd09068@suse.com>
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
Subject: Re: [PATCH v3 5/7] xsm: decouple xsm header inclusion selection
Message-ID: <3c45195e-82af-b543-d00c-40555dad28a5@apertussolutions.com>
Date: Mon, 30 Aug 2021 09:41:53 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <c40d6fd3-ac7d-c824-32d9-678c7fd09068@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

On 8/30/21 9:24 AM, Jan Beulich wrote:
> On 27.08.2021 16:06, Daniel P. Smith wrote:
>> On 8/26/21 4:13 AM, Jan Beulich wrote:
>>> On 05.08.2021 16:06, Daniel P. Smith wrote:
>>>> --- /dev/null
>>>> +++ b/xen/include/xsm/xsm-core.h
>>>> @@ -0,0 +1,273 @@
>>>> +/*
>>>> + *  This file contains the XSM hook definitions for Xen.
>>>> + *
>>>> + *  This work is based on the LSM implementation in Linux 2.6.13.4.
>>>> + *
>>>> + *  Author:  George Coker, <gscoker@alpha.ncsc.mil>
>>>> + *
>>>> + *  Contributors: Michael LeMay, <mdlemay@epoch.ncsc.mil>
>>>> + *
>>>> + *  This program is free software; you can redistribute it and/or modify
>>>> + *  it under the terms of the GNU General Public License version 2,
>>>> + *  as published by the Free Software Foundation.
>>>> + */
>>>> +
>>>> +#ifndef __XSM_CORE_H__
>>>> +#define __XSM_CORE_H__
>>>> +
>>>> +#include <xen/sched.h>
>>>> +#include <xen/multiboot.h>
>>>
>>> I was going to ask to invert the order (as we try to arrange #include-s
>>> alphabetically), but it looks like multiboot.h isn't fit for this.
>>
>> So my understanding is to leave this as is.
> 
> Yes, unfortunately.
> 
>>>> +typedef void xsm_op_t;
>>>> +DEFINE_XEN_GUEST_HANDLE(xsm_op_t);
>>>
>>> Just FTR - I consider this dubious. If void is meant, I don't see why
>>> a void handle can't be used.
>>
>> Unless I am misunderstanding what you are calling for, I am afraid this
>> will trickle further that what intended to be addressed in this patch
>> set. If disagree and would like to provide me a suggest that stays
>> bounded, I would gladly incorporate.
> 
> All I'm asking is to remove this pointless typedef and handle definition,
> seeing that you're doing a major rework anyway. I'm afraid I don't see
> how this would collide with the purpose of the overall series (albeit I
> may also have misunderstood your reply, as the 2nd half of the first
> sentence makes me struggle some with trying to parse it).
> 
> Jan
> 

If I drop the typedef and start changing everywhere xsm_op_t is
referenced to void, this now adds hypercall.h to the files I am now
touching.

In the end it is not about whether the change is big or small, but that
more and more unrelated small changes/clean ups keep getting requested.
There has to be a cut-off point to limit the scope of changes down to
the purpose of the patch set, which is to unravel and simplify the XSM
hooks. And this is being done so, so that the the XSM-Roles work can be
introduced to bring a more solid definition to the the default access
control system, which itself is needed to bring in hyperlaunch.

v/r,
dps

