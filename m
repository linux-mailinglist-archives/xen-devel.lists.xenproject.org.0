Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A204355AF8
	for <lists+xen-devel@lfdr.de>; Tue,  6 Apr 2021 20:03:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.106188.203099 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lTq3F-0004S8-6p; Tue, 06 Apr 2021 18:03:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 106188.203099; Tue, 06 Apr 2021 18:03:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lTq3F-0004Ri-2V; Tue, 06 Apr 2021 18:03:45 +0000
Received: by outflank-mailman (input) for mailman id 106188;
 Tue, 06 Apr 2021 18:03:44 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1lTq3E-0004RY-3y
 for xen-devel@lists.xenproject.org; Tue, 06 Apr 2021 18:03:44 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lTq3C-0004K8-UX; Tue, 06 Apr 2021 18:03:42 +0000
Received: from 54-240-197-234.amazon.com ([54.240.197.234]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lTq3C-0002NC-K7; Tue, 06 Apr 2021 18:03:42 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=H1KREt+k46XAFO7M/nG21288UVAzga57uKnKtGMnA6w=; b=yh5e+tzL1nwgiVhbQ5f0nBTPdY
	RzYa6SPKpbMyEbIP3VAMEFaH9CVaGZ2bx27p3STD1GHalmzIY9IQNlluukdkJi53WqwcQh9NCnEA6
	pHW4225YeWp5SudTvUDTZda5QSn8rRJ75uA4n4PGy2sxSdKSQmfbfUnNWR7TomruBTjo=;
Subject: Re: [PATCH 01/14] xen: Constify the second parameter of
 rangeset_new()
To: Jan Beulich <jbeulich@suse.com>
Cc: Julien Grall <jgrall@amazon.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20210405155713.29754-1-julien@xen.org>
 <20210405155713.29754-2-julien@xen.org>
 <b318ba40-a38a-4120-496d-5adef66c827a@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <cd695b96-f51c-a7f3-fc60-19b8197b185f@xen.org>
Date: Tue, 6 Apr 2021 19:03:39 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <b318ba40-a38a-4120-496d-5adef66c827a@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Jan,

On 06/04/2021 08:57, Jan Beulich wrote:
> On 05.04.2021 17:57, Julien Grall wrote:
>> From: Julien Grall <jgrall@amazon.com>
>>
>> The string 'name' will never get modified by the function, so mark it
>> as const.
>>
>> Signed-off-by: Julien Grall <jgrall@amazon.com>
> 
> Reviewed-by: Jan Beulich <jbeulich@suse.com>

Thanks!

> 
>> --- a/xen/common/rangeset.c
>> +++ b/xen/common/rangeset.c
>> @@ -421,7 +421,7 @@ bool_t rangeset_is_empty(
>>   }
>>   
>>   struct rangeset *rangeset_new(
>> -    struct domain *d, char *name, unsigned int flags)
>> +    struct domain *d, const char *name, unsigned int flags)
>>   {
>>       struct rangeset *r;
> 
> Remotely along these lines the function also has no need anymore to
> use snprintf() - safe_strcpy() very well fits both purposes. But
> quite likely for another patch.

I saw you already sent the patch for that. So I am assuming there is no 
action for me here.

Cheers,

-- 
Julien Grall

