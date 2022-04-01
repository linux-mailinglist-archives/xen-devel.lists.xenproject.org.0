Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 37AF54EF98E
	for <lists+xen-devel@lfdr.de>; Fri,  1 Apr 2022 20:10:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.297553.506944 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1naLjE-0004D8-Sc; Fri, 01 Apr 2022 18:10:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 297553.506944; Fri, 01 Apr 2022 18:10:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1naLjE-0004Ar-PJ; Fri, 01 Apr 2022 18:10:32 +0000
Received: by outflank-mailman (input) for mailman id 297553;
 Fri, 01 Apr 2022 18:10:31 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1naLjC-0004Al-V8
 for xen-devel@lists.xenproject.org; Fri, 01 Apr 2022 18:10:30 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1naLj8-00031G-AN; Fri, 01 Apr 2022 18:10:26 +0000
Received: from [54.239.6.189] (helo=[192.168.18.123])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1naLj8-0002A9-3z; Fri, 01 Apr 2022 18:10:26 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID;
	bh=55r6LcT9MBKzSwHanEpMP81a9g/XWoD4HG9tunkh3IU=; b=dvOU2zqpWhG5yXfrsUwnVcDpH8
	984zuSb2gmiuw8RDs2m0Ik68FSxC6Psj595svljPZpHvjKMwu5vJCS1ziCb+kuMf9etGk7IVwf6VD
	GJJ6TeKcuq2f1pavUywaqrWwqrWQIcvZQ47mDy6jRa0F0koiD+5y8qjdg9YIvLal/zCc=;
Message-ID: <9bcfabc9-3d5f-0677-5a78-2902a0fa45e7@xen.org>
Date: Fri, 1 Apr 2022 19:10:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.7.0
Subject: Re: [PATCH v1 3/5] xen/arm: unpopulate memory when domain on static
 allocation
To: Jan Beulich <jbeulich@suse.com>, Penny Zheng <Penny.Zheng@arm.com>
Cc: wei.chen@arm.com, henry.wang@arm.com,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20220330093617.3870589-1-Penny.Zheng@arm.com>
 <20220330093617.3870589-4-Penny.Zheng@arm.com>
 <31c1ae2d-a4d6-5445-e819-5df5a0984cdd@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <31c1ae2d-a4d6-5445-e819-5df5a0984cdd@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Jan,

On 30/03/2022 10:52, Jan Beulich wrote:
> On 30.03.2022 11:36, Penny Zheng wrote:
>> --- a/xen/common/memory.c
>> +++ b/xen/common/memory.c
>> @@ -35,6 +35,10 @@
>>   #include <asm/guest.h>
>>   #endif
>>   
>> +#ifndef is_domain_on_static_allocation
>> +#define is_domain_on_static_allocation(d) 0
> 
> Nit: "false", not "0".

I think we also want to evaluate d so the behavior on x86 and arm is the 
same. Something like ((void)(d), false).

Cheers,

-- 
Julien Grall

