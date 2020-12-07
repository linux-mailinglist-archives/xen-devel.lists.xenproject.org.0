Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 286712D0D97
	for <lists+xen-devel@lfdr.de>; Mon,  7 Dec 2020 10:59:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.46056.81693 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kmDIq-0001tQ-R4; Mon, 07 Dec 2020 09:59:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 46056.81693; Mon, 07 Dec 2020 09:59:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kmDIq-0001t0-Ne; Mon, 07 Dec 2020 09:59:32 +0000
Received: by outflank-mailman (input) for mailman id 46056;
 Mon, 07 Dec 2020 09:59:31 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=3bhA=FL=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kmDIp-0001su-GM
 for xen-devel@lists.xenproject.org; Mon, 07 Dec 2020 09:59:31 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 89fa7183-07bb-4977-b10b-62d5321293f1;
 Mon, 07 Dec 2020 09:59:30 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 1DFCFAD6B;
 Mon,  7 Dec 2020 09:59:30 +0000 (UTC)
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
X-Inumbo-ID: 89fa7183-07bb-4977-b10b-62d5321293f1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1607335170; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Bdqn2agfR32U8qSo2/yxfyc/n46s4Yiha5+sGmTNiQg=;
	b=YYTseKZZSegTUyX5UUTIkzLAMUDYNyzz0lk+DLtFXNOboaY05Ayj4Yp4oK6X1RxQF/X5QV
	BWtEB+6Z/V6yD6jSsA5CWcPpKZW4/GyLbzy5j9i/lA0nSstwn69+8F8pb/JjnETQHoYYub
	PSNukv802wbcxDQOCbT/9jaGyOBjHjU=
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
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <eb2e47aa-6c82-f3dd-83e7-b1853816c41c@suse.com>
Date: Mon, 7 Dec 2020 10:59:32 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <eed1baac-a6eb-f10b-7272-742c08f5124e@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 01.12.2020 10:01, Jürgen Groß wrote:
> On 01.12.20 09:55, Jan Beulich wrote:
>> On 01.12.2020 09:21, Juergen Gross wrote:
>>> --- a/xen/common/sched/private.h
>>> +++ b/xen/common/sched/private.h
>>> @@ -505,8 +505,8 @@ static inline void sched_unit_unpause(const struct sched_unit *unit)
>>>   
>>>   struct cpupool
>>>   {
>>> -    int              cpupool_id;
>>> -#define CPUPOOLID_NONE    (-1)
>>> +    unsigned int     cpupool_id;
>>> +#define CPUPOOLID_NONE    (~0U)
>>
>> How about using XEN_SYSCTL_CPUPOOL_PAR_ANY here? Furthermore,
>> together with the remark above, I think you also want to consider
>> the case of sizeof(unsigned int) > sizeof(uint32_t).
> 
> With patch 5 this should be completely fine.

I don't think so, as there still will be CPUPOOLID_NONE !=
XEN_SYSCTL_CPUPOOL_PAR_ANY in the mentioned case.

Jan

