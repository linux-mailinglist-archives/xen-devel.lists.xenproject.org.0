Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C1FB654E69
	for <lists+xen-devel@lfdr.de>; Fri, 23 Dec 2022 10:29:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.468838.728016 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p8eMX-00057n-Uv; Fri, 23 Dec 2022 09:29:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 468838.728016; Fri, 23 Dec 2022 09:29:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p8eMX-00055P-S4; Fri, 23 Dec 2022 09:29:09 +0000
Received: by outflank-mailman (input) for mailman id 468838;
 Fri, 23 Dec 2022 09:29:08 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1p8eMW-00055J-4b
 for xen-devel@lists.xenproject.org; Fri, 23 Dec 2022 09:29:08 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1p8eMS-000069-K9; Fri, 23 Dec 2022 09:29:04 +0000
Received: from 54-240-197-235.amazon.com ([54.240.197.235]
 helo=[192.168.3.230]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1p8eMS-0003wb-BG; Fri, 23 Dec 2022 09:29:04 +0000
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
	bh=XZqbrR+O9WOeXjntOUCZ/6Dw94oqaco4EzP72D90lGw=; b=C7EKjftPY2vm4yobRzG+mORITV
	VCfRN6BWLebrHRvlsIOnj+ewKmuP+3q27gji38LC0xvVxggXHnvUl1BReSRMXCepweONpaU2Sankq
	EAudl0njiT/dpFmavJo4YHMfDWq4Yt2+S2NQR8+7Rt5Fbz0mCeC938sIBKcZjtb+omkk=;
Message-ID: <434e701f-6114-121d-cb1c-929abaeffc74@xen.org>
Date: Fri, 23 Dec 2022 09:29:01 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH 01/22] xen/common: page_alloc: Re-order includes
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>
Cc: Julien Grall <jgrall@amazon.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20221216114853.8227-1-julien@xen.org>
 <20221216114853.8227-2-julien@xen.org>
 <c59193e7-4fee-6435-4698-385363df1bab@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <c59193e7-4fee-6435-4698-385363df1bab@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Jan,

On 16/12/2022 12:03, Jan Beulich wrote:
> On 16.12.2022 12:48, Julien Grall wrote:
>> From: Julien Grall <jgrall@amazon.com>
>>
>> Order the includes with the xen headers first, then asm headers and
>> last public headers. Within each category, they are sorted alphabetically.
>>
>> Note that the includes in protected by CONFIG_X86 hasn't been sorted
>> to avoid adding multiple #ifdef.
>>
>> Signed-off-by: Julien Grall <jgrall@amazon.com>
> 
> Acked-by: Jan Beulich <jbeulich@suse.com>

Thanks!

> 
>> ----
>>
>>      I am open to add sort the includes protected by CONFIG_X86
>>      and add multiple #ifdef if this is preferred.
> 
> I, for one, prefer it the way you've done it.

Ok. I have committed the patch as-is .

Cheers,

-- 
Julien Grall

