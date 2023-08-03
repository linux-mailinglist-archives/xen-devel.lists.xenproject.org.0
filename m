Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3433576EEF8
	for <lists+xen-devel@lfdr.de>; Thu,  3 Aug 2023 18:04:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.576490.902685 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRanr-00084I-4t; Thu, 03 Aug 2023 16:03:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 576490.902685; Thu, 03 Aug 2023 16:03:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRanr-00082C-00; Thu, 03 Aug 2023 16:03:55 +0000
Received: by outflank-mailman (input) for mailman id 576490;
 Thu, 03 Aug 2023 16:03:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0usr=DU=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1qRanp-000826-24
 for xen-devel@lists.xenproject.org; Thu, 03 Aug 2023 16:03:53 +0000
Received: from sender4-of-o50.zoho.com (sender4-of-o50.zoho.com
 [136.143.188.50]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5556c0d9-3217-11ee-b268-6b7b168915f2;
 Thu, 03 Aug 2023 18:03:50 +0200 (CEST)
Received: from [10.10.1.156] (static-72-81-132-2.bltmmd.fios.verizon.net
 [72.81.132.2]) by mx.zohomail.com
 with SMTPS id 1691078625504929.2837018516593;
 Thu, 3 Aug 2023 09:03:45 -0700 (PDT)
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
X-Inumbo-ID: 5556c0d9-3217-11ee-b268-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; t=1691078626; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=DS13iNruZ74gob5JuEF9R9LJzhD6wYpKT7t2OgFNe/pQd3Yqr/3uXzF8//twWhKnAhKUVFMT0HGz+Rr9sGrszOeUqrkBh2Rr4pwRxcbcwALjkkyQ3D9aPuqzBkjA+FHD3jdXn/9WCUYY30pTN+DENQeY7rJtF4ro5zhfoesk0A8=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1691078626; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=ae4dbcHbi3OyPMm8c1f1Dt7aSpjgiQa8dQIIotDjUCc=; 
	b=kXK7aLvPRaxySO3cqlzk9ZwN6iU0phOaeJvVQUcW+waoSLl4h30NCYmKQoLyzRvPRnkBmzDzdJ0SMnvv9qmFayc0H6JmJ3dFOJfatYgnO05tu5YsCTisoe3b7VLVnmPWBFrmgTJ+Cb/MsGIvAGm/7hnGEchrCAN4rChMTMGi97s=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1691078626;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=ae4dbcHbi3OyPMm8c1f1Dt7aSpjgiQa8dQIIotDjUCc=;
	b=ZtptUgi1q5WO92dmAXdxKKYfXz4cLKardfsCQUNLCGFNO/ZKUQs5G1EK3JnXo35C
	eAh19Q5oxun/tJ/YHxdBG/rZdm0gWLAsUI/1e3GtNQW8FQHmSoAKwkrQtMpwO9bNpMp
	4m8zESqhg/U32M099eB9mWA78rxiQYVSpV23VmgE=
Message-ID: <aa574d08-bd31-0a0c-e2ae-15e184f2eb24@apertussolutions.com>
Date: Thu, 3 Aug 2023 12:03:42 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [RFC 6/6] capabilities: convert attach debugger into a capability
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>
Cc: Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <20230801202006.20322-1-dpsmith@apertussolutions.com>
 <20230801202006.20322-7-dpsmith@apertussolutions.com>
 <alpine.DEB.2.22.394.2308011802401.2127516@ubuntu-linux-20-04-desktop>
 <2a651c80-7e44-1ff9-bb63-989605960c72@apertussolutions.com>
 <eb622e00-09c2-df09-1127-63feb63eb961@suse.com>
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
In-Reply-To: <eb622e00-09c2-df09-1127-63feb63eb961@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External

On 8/3/23 11:59, Jan Beulich wrote:
> On 03.08.2023 17:52, Daniel P. Smith wrote:
>> On 8/1/23 21:06, Stefano Stabellini wrote:
>>> On Tue, 1 Aug 2023, Daniel P. Smith wrote:
>>>> --- a/xen/include/xen/sched.h
>>>> +++ b/xen/include/xen/sched.h
>>>> @@ -474,9 +474,8 @@ struct domain
>>>>        uint8_t          role;
>>>>    #define CAP_CONSOLE_IO         (1U<<0)
>>>>    #define CAP_DISABLE_CPU_FAULT  (1U<<1)
>>>> -    uint8_t          capabilities;
>>>> -    /* Is this guest being debugged by dom0? */
>>>> -    bool             debugger_attached;
>>>> +#define CAP_DEBUGGER_ATTACH    (1U<<2)
>>>> +    uint16_t         capabilities;
>>>
>>> No need to switch to uint16_t just yet?
>>
>> I know space is tight in struct domain, wanted to reclaim the freed
>> space into capabilities (or roles). One thing I was considering if
>> enough space could be found is instead replace it all with a pointer to
>> a new struct that held these values. It would allow using heap space and
>> future growth of the structure. As of this patch, it is consuming 5
>> bytes and would need to find an additional 3 bytes. Is there a
>> willingness to entertain such an approach?
> 
> Usually we do such conversion when data belonging to a subsystem (for lack
> of a better term) grows big enough, not right away when eventual data size
> isn't even known yet.

Right and if there is a desire to instead follow the suggestion in my 
reply to Stefano on patch 4, that approach could be sizeable. Larger 
than 40 bits/flags, that I am less confident about.

v/r,
dps

