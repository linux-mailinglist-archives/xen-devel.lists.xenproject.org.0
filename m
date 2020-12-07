Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BE8D2D1436
	for <lists+xen-devel@lfdr.de>; Mon,  7 Dec 2020 16:00:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.46682.82762 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kmHzp-0008CU-8F; Mon, 07 Dec 2020 15:00:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 46682.82762; Mon, 07 Dec 2020 15:00:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kmHzp-0008C5-4n; Mon, 07 Dec 2020 15:00:13 +0000
Received: by outflank-mailman (input) for mailman id 46682;
 Mon, 07 Dec 2020 15:00:11 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=3bhA=FL=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kmHzn-0008C0-TL
 for xen-devel@lists.xenproject.org; Mon, 07 Dec 2020 15:00:11 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d052f47e-e39b-4724-8db8-88a2179e342c;
 Mon, 07 Dec 2020 15:00:11 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 32128ACBD;
 Mon,  7 Dec 2020 15:00:10 +0000 (UTC)
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
X-Inumbo-ID: d052f47e-e39b-4724-8db8-88a2179e342c
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1607353210; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UPfYqQ+Bzpt16+gJpfccy7YbR/QJRFCBohhl/OWjGb4=;
	b=fXitukg3x33dDcruenaOQ7JFDXDGx9svtHN3Psc/5Mn/OpJ2/QpWF9zPebbn05q56X3y6b
	ebaXHWKCYx6AU23gEzdor59j1UGcXDxUZQtO4U2R28bz4GdY2Oktj10efj/5M+6ruRe7I5
	EKTeRSZdyJ53Bw+tewk1B9pFXcYiYlM=
Subject: Re: [PATCH v2 04/17] xen/cpupool: switch cpupool id to unsigned
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Cc: George Dunlap <george.dunlap@citrix.com>,
 Dario Faggioli <dfaggioli@suse.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
References: <20201201082128.15239-1-jgross@suse.com>
 <20201201082128.15239-5-jgross@suse.com>
 <a0bac022-fe6e-aae6-6d07-6a2b9bc492b3@suse.com>
 <eed1baac-a6eb-f10b-7272-742c08f5124e@suse.com>
 <eb2e47aa-6c82-f3dd-83e7-b1853816c41c@suse.com>
 <d21da8c1-fdb9-6184-06f1-dce6ed683d92@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <2efb6f26-ab82-7122-26c9-1db586d44bbb@suse.com>
Date: Mon, 7 Dec 2020 16:00:12 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <d21da8c1-fdb9-6184-06f1-dce6ed683d92@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 07.12.2020 15:48, Jürgen Groß wrote:
> On 07.12.20 10:59, Jan Beulich wrote:
>> On 01.12.2020 10:01, Jürgen Groß wrote:
>>> On 01.12.20 09:55, Jan Beulich wrote:
>>>> On 01.12.2020 09:21, Juergen Gross wrote:
>>>>> --- a/xen/common/sched/private.h
>>>>> +++ b/xen/common/sched/private.h
>>>>> @@ -505,8 +505,8 @@ static inline void sched_unit_unpause(const struct sched_unit *unit)
>>>>>    
>>>>>    struct cpupool
>>>>>    {
>>>>> -    int              cpupool_id;
>>>>> -#define CPUPOOLID_NONE    (-1)
>>>>> +    unsigned int     cpupool_id;
>>>>> +#define CPUPOOLID_NONE    (~0U)
>>>>
>>>> How about using XEN_SYSCTL_CPUPOOL_PAR_ANY here? Furthermore,
>>>> together with the remark above, I think you also want to consider
>>>> the case of sizeof(unsigned int) > sizeof(uint32_t).
>>>
>>> With patch 5 this should be completely fine.
>>
>> I don't think so, as there still will be CPUPOOLID_NONE !=
>> XEN_SYSCTL_CPUPOOL_PAR_ANY in the mentioned case.
> 
> I don't see that being relevant, as we have in cpupool_do_sysctl():
> 
> poolid = (op->cpupool_id == XEN_SYSCTL_CPUPOOL_PAR_ANY) ?
>              CPUPOOLID_NONE: op->cpupool_id;

Oh, sorry for the noise then. I forgot about this transformation.

Jan

